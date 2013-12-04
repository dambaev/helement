{-#LANGUAGE BangPatterns #-}
module HElementary.Elementary where

import Prelude as P
import HElementary.ElementaryFFI

import Foreign.Ptr
import Foreign.C
import Foreign.Marshal.Alloc
import Foreign.Marshal.Array
import Foreign.Marshal.Utils
import Foreign.Storable
import Foreign.C.String
import Data.Either
import Control.Monad
import System.Environment
import Data.ByteString.UTF8 as U
import Data.ByteString.Char8 as C8

import System.IO

type EvasObjectSmartCallback = Ptr ()-> Ptr C'Evas_Object-> Ptr ()-> IO ()

elm_init:: IO Int
elm_init = do
    !args <- getArgs
    !path <- getExecutablePath
    !cpath <- newCString path
    !cargs <- forM args newCString
    withArray (cpath:cargs) $ \p -> do
        !ret <- c'elm_init ( fromIntegral $ P.length args + 1) p
        return $! fromIntegral ret
        
elm_shutdown:: IO Int
elm_shutdown = c'elm_shutdown >>= return . fromIntegral

withElementary:: IO a -> IO a
withElementary fun = do
    elm_init
    ret <- fun
    elm_shutdown
    return ret

elm_run = c'elm_run
elm_exit = c'elm_exit

elm_win_util_standard_add:: ByteString-> ByteString-> IO (Ptr C'Evas_Object)
elm_win_util_standard_add name title = do
    useAsCString name $ \p_name ->
        useAsCString title $ \p_title -> do
            c'elm_win_util_standard_add p_name p_title

evas_object_show:: Ptr C'Evas_Object-> IO ()
evas_object_show = c'evas_object_show

evas_object_smart_callback_add
    :: Ptr C'Evas_Object
    -> ByteString
    -> EvasObjectSmartCallback
    -> Ptr ()
    -> IO ()
evas_object_smart_callback_add ptr event func p_data = do
    funptr <- mkEvasObjectSmartCallback func
    useAsCString event $ \p_event ->
        c'evas_object_smart_callback_add ptr p_event funptr p_data

foreign import ccall "wrapper"
    mkEvasObjectSmartCallback:: EvasObjectSmartCallback -> IO (FunPtr EvasObjectSmartCallback)


elm_box_add = c'elm_box_add

elm_box_horizontal_set:: Ptr C'Evas_Object -> IO ()
elm_box_horizontal_set ptr = c'elm_box_horizontal_set ptr 1

elm_box_vertical_set:: Ptr C'Evas_Object -> IO ()
elm_box_vertical_set ptr = c'elm_box_horizontal_set ptr 0

elm_box_homogeneous_set:: Ptr C'Evas_Object -> IO ()
elm_box_homogeneous_set ptr = c'elm_box_homogeneous_set ptr 1


elm_win_resize_object_add:: Ptr C'Evas_Object -> Ptr C'Evas_Object-> IO ()
elm_win_resize_object_add = c'elm_win_resize_object_add

elm_object_text_set:: Ptr C'Evas_Object-> ByteString-> IO ()
elm_object_text_set ptr str = do
    useAsCString str $ \p_str -> 
        c'elm_object_text_set ptr p_str

elm_label_add:: Ptr C'Evas_Object-> IO (Ptr C'Evas_Object)
elm_label_add = c'elm_label_add

elm_box_pack_end:: Ptr C'Evas_Object -> Ptr C'Evas_Object-> IO ()
elm_box_pack_end = c'elm_box_pack_end

elm_entry_add = c'elm_entry_add
elm_button_add = c'elm_button_add

elm_entry_single_line_set:: Ptr C'Evas_Object -> Bool -> IO ()
elm_entry_single_line_set ptr True = c'elm_entry_single_line_set ptr c'EINA_TRUE
elm_entry_single_line_set ptr _ = c'elm_entry_single_line_set ptr c'EINA_FALSE

elm_entry_password_set:: Ptr C'Evas_Object -> Bool -> IO ()
elm_entry_password_set ptr True = c'elm_entry_password_set ptr c'EINA_TRUE
elm_entry_password_set ptr _ = c'elm_entry_password_set ptr c'EINA_FALSE


evas_object_size_hint_min_set:: Ptr C'Evas_Object-> Int-> Int-> IO ()
evas_object_size_hint_min_set ptr w h = 
    c'evas_object_size_hint_min_set ptr (fromIntegral w) (fromIntegral h)

evas_object_resize:: Ptr C'Evas_Object-> Int-> Int-> IO ()
evas_object_resize ptr w h = 
    c'evas_object_resize ptr (fromIntegral w) (fromIntegral h)

evas_object_size_hint_weight_set:: Ptr C'Evas_Object-> CDouble-> CDouble-> IO ()
evas_object_size_hint_weight_set ptr x y =
    c'evas_object_size_hint_weight_set ptr x y

evas_object_size_hint_align_set:: Ptr C'Evas_Object-> CDouble-> CDouble-> IO ()
evas_object_size_hint_align_set ptr x y =
    c'evas_object_size_hint_align_set ptr x y

elm_entry_scrollable_set:: Ptr C'Evas_Object -> Bool -> IO ()
elm_entry_scrollable_set ptr True = c'elm_entry_scrollable_set ptr 
    c'EINA_TRUE
elm_entry_scrollable_set ptr _ = c'elm_entry_scrollable_set ptr 
    c'EINA_FALSE
    

elm_entry_scrollbar_policy_set:: Ptr C'Evas_Object-> C'Elm_Scroller_Policy -> C'Elm_Scroller_Policy -> IO ()
elm_entry_scrollbar_policy_set = c'elm_entry_scrollbar_policy_set

evas_object_del:: Ptr C'Evas_Object-> IO ()
evas_object_del = c'evas_object_del

elm_object_text_get:: Ptr C'Evas_Object-> IO ByteString
elm_object_text_get obj = do
    ptr <- c'elm_object_part_text_get obj nullPtr
    packCString ptr
    --str <- peekCString ptr
    --return $! fromString str
    

evas_object_smart_callback_call:: Ptr C'Evas_Object
                               -> ByteString 
                               -> Ptr ()
                               -> IO ()
evas_object_smart_callback_call ptr event eventinfo = do
    useAsCString event $ \p_event -> do
        c'evas_object_smart_callback_call ptr p_event eventinfo
