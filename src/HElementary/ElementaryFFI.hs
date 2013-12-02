{-# LINE 1 "HElementary\ElementaryFFI.hsc" #-}

{-# LINE 2 "HElementary\ElementaryFFI.hsc" #-}

module HElementary.ElementaryFFI where
import Foreign.Ptr (Ptr,FunPtr,plusPtr)
import Foreign.Ptr (wordPtrToPtr,castPtrToFunPtr)
import Foreign.Storable
import Foreign.C.Types
import Foreign.C.String (CString,CStringLen,CWString,CWStringLen)
import Foreign.Marshal.Alloc (alloca)
import Foreign.Marshal.Array (peekArray,pokeArray)
import Data.Int
import Data.Word

{-# LINE 5 "HElementary\ElementaryFFI.hsc" #-}

{-# LINE 6 "HElementary\ElementaryFFI.hsc" #-}


data C'Evas_Object = C'Evas_Object

{-# LINE 9 "HElementary\ElementaryFFI.hsc" #-}
data C'void = C'void

{-# LINE 10 "HElementary\ElementaryFFI.hsc" #-}
type C'Eina_Bool = CUChar

{-# LINE 11 "HElementary\ElementaryFFI.hsc" #-}
c'EINA_TRUE = 1
c'EINA_TRUE :: (Num a) => a

{-# LINE 12 "HElementary\ElementaryFFI.hsc" #-}
c'EINA_FALSE = 0
c'EINA_FALSE :: (Num a) => a

{-# LINE 13 "HElementary\ElementaryFFI.hsc" #-}

type C'Elm_Scroller_Policy = CUInt

{-# LINE 15 "HElementary\ElementaryFFI.hsc" #-}
c'ELM_SCROLLER_POLICY_AUTO = 0
c'ELM_SCROLLER_POLICY_AUTO :: (Num a) => a

{-# LINE 16 "HElementary\ElementaryFFI.hsc" #-}
c'ELM_SCROLLER_POLICY_ON = 1
c'ELM_SCROLLER_POLICY_ON :: (Num a) => a

{-# LINE 17 "HElementary\ElementaryFFI.hsc" #-}
c'ELM_SCROLLER_POLICY_OFF = 2
c'ELM_SCROLLER_POLICY_OFF :: (Num a) => a

{-# LINE 18 "HElementary\ElementaryFFI.hsc" #-}
c'ELM_SCROLLER_POLICY_LAST = 3
c'ELM_SCROLLER_POLICY_LAST :: (Num a) => a

{-# LINE 19 "HElementary\ElementaryFFI.hsc" #-}


c'EVAS_HINT_EXPAND = 1
c'EVAS_HINT_EXPAND :: (Num a) => a

{-# LINE 22 "HElementary\ElementaryFFI.hsc" #-}
c'EVAS_HINT_FILL = -1
c'EVAS_HINT_FILL :: (Num a) => a

{-# LINE 23 "HElementary\ElementaryFFI.hsc" #-}

type C'Evas_Coord = CInt

{-# LINE 25 "HElementary\ElementaryFFI.hsc" #-}

foreign import ccall "elm_init" c'elm_init
  :: CInt -> Ptr (Ptr CChar)-> IO CInt
foreign import ccall "&elm_init" p'elm_init
  :: FunPtr (CInt -> Ptr (Ptr CChar)-> IO CInt)

{-# LINE 27 "HElementary\ElementaryFFI.hsc" #-}
foreign import ccall "elm_shutdown" c'elm_shutdown
  :: IO CInt
foreign import ccall "&elm_shutdown" p'elm_shutdown
  :: FunPtr (IO CInt)

{-# LINE 28 "HElementary\ElementaryFFI.hsc" #-}

foreign import ccall "elm_run" c'elm_run
  :: IO ()
foreign import ccall "&elm_run" p'elm_run
  :: FunPtr (IO ())

{-# LINE 30 "HElementary\ElementaryFFI.hsc" #-}
foreign import ccall "elm_exit" c'elm_exit
  :: IO ()
foreign import ccall "&elm_exit" p'elm_exit
  :: FunPtr (IO ())

{-# LINE 31 "HElementary\ElementaryFFI.hsc" #-}

foreign import ccall "elm_win_util_standard_add" c'elm_win_util_standard_add
  :: Ptr CChar-> Ptr CChar-> IO (Ptr C'Evas_Object)
foreign import ccall "&elm_win_util_standard_add" p'elm_win_util_standard_add
  :: FunPtr (Ptr CChar-> Ptr CChar-> IO (Ptr C'Evas_Object))

{-# LINE 33 "HElementary\ElementaryFFI.hsc" #-}
foreign import ccall "evas_object_show" c'evas_object_show
  :: Ptr C'Evas_Object-> IO ()
foreign import ccall "&evas_object_show" p'evas_object_show
  :: FunPtr (Ptr C'Evas_Object-> IO ())

{-# LINE 34 "HElementary\ElementaryFFI.hsc" #-}

foreign import ccall "evas_object_smart_callback_add" c'evas_object_smart_callback_add
  :: Ptr C'Evas_Object -> Ptr CChar -> FunPtr (Ptr () -> Ptr C'Evas_Object -> Ptr () -> IO ()) -> Ptr () -> IO ()
foreign import ccall "&evas_object_smart_callback_add" p'evas_object_smart_callback_add
  :: FunPtr (Ptr C'Evas_Object -> Ptr CChar -> FunPtr (Ptr () -> Ptr C'Evas_Object -> Ptr () -> IO ()) -> Ptr () -> IO ())

{-# LINE 36 "HElementary\ElementaryFFI.hsc" #-}

foreign import ccall "elm_box_add" c'elm_box_add
  :: Ptr C'Evas_Object -> IO (Ptr C'Evas_Object)
foreign import ccall "&elm_box_add" p'elm_box_add
  :: FunPtr (Ptr C'Evas_Object -> IO (Ptr C'Evas_Object))

{-# LINE 38 "HElementary\ElementaryFFI.hsc" #-}

foreign import ccall "elm_box_horizontal_set" c'elm_box_horizontal_set
  :: Ptr C'Evas_Object -> CInt -> IO ()
foreign import ccall "&elm_box_horizontal_set" p'elm_box_horizontal_set
  :: FunPtr (Ptr C'Evas_Object -> CInt -> IO ())

{-# LINE 40 "HElementary\ElementaryFFI.hsc" #-}
foreign import ccall "elm_box_homogeneous_set" c'elm_box_homogeneous_set
  :: Ptr C'Evas_Object -> CInt -> IO ()
foreign import ccall "&elm_box_homogeneous_set" p'elm_box_homogeneous_set
  :: FunPtr (Ptr C'Evas_Object -> CInt -> IO ())

{-# LINE 41 "HElementary\ElementaryFFI.hsc" #-}

foreign import ccall "elm_win_resize_object_add" c'elm_win_resize_object_add
  :: Ptr C'Evas_Object -> Ptr C'Evas_Object -> IO ()
foreign import ccall "&elm_win_resize_object_add" p'elm_win_resize_object_add
  :: FunPtr (Ptr C'Evas_Object -> Ptr C'Evas_Object -> IO ())

{-# LINE 43 "HElementary\ElementaryFFI.hsc" #-}

foreign import ccall "elm_label_add" c'elm_label_add
  :: Ptr C'Evas_Object -> IO (Ptr C'Evas_Object)
foreign import ccall "&elm_label_add" p'elm_label_add
  :: FunPtr (Ptr C'Evas_Object -> IO (Ptr C'Evas_Object))

{-# LINE 45 "HElementary\ElementaryFFI.hsc" #-}

foreign import ccall "inline_elm_object_text_set" c'elm_object_text_set
  :: Ptr C'Evas_Object -> Ptr CChar -> IO ()

{-# LINE 47 "HElementary\ElementaryFFI.hsc" #-}

foreign import ccall "elm_box_pack_end" c'elm_box_pack_end
  :: Ptr C'Evas_Object -> Ptr C'Evas_Object -> IO ()
foreign import ccall "&elm_box_pack_end" p'elm_box_pack_end
  :: FunPtr (Ptr C'Evas_Object -> Ptr C'Evas_Object -> IO ())

{-# LINE 49 "HElementary\ElementaryFFI.hsc" #-}

foreign import ccall "elm_entry_add" c'elm_entry_add
  :: Ptr C'Evas_Object -> IO (Ptr C'Evas_Object)
foreign import ccall "&elm_entry_add" p'elm_entry_add
  :: FunPtr (Ptr C'Evas_Object -> IO (Ptr C'Evas_Object))

{-# LINE 51 "HElementary\ElementaryFFI.hsc" #-}

foreign import ccall "elm_button_add" c'elm_button_add
  :: Ptr C'Evas_Object -> IO (Ptr C'Evas_Object)
foreign import ccall "&elm_button_add" p'elm_button_add
  :: FunPtr (Ptr C'Evas_Object -> IO (Ptr C'Evas_Object))

{-# LINE 53 "HElementary\ElementaryFFI.hsc" #-}

foreign import ccall "elm_entry_single_line_set" c'elm_entry_single_line_set
  :: Ptr C'Evas_Object -> C'Eina_Bool -> IO ()
foreign import ccall "&elm_entry_single_line_set" p'elm_entry_single_line_set
  :: FunPtr (Ptr C'Evas_Object -> C'Eina_Bool -> IO ())

{-# LINE 55 "HElementary\ElementaryFFI.hsc" #-}

foreign import ccall "elm_entry_password_set" c'elm_entry_password_set
  :: Ptr C'Evas_Object -> C'Eina_Bool -> IO ()
foreign import ccall "&elm_entry_password_set" p'elm_entry_password_set
  :: FunPtr (Ptr C'Evas_Object -> C'Eina_Bool -> IO ())

{-# LINE 57 "HElementary\ElementaryFFI.hsc" #-}

foreign import ccall "evas_object_size_hint_min_set" c'evas_object_size_hint_min_set
  :: Ptr C'Evas_Object -> C'Evas_Coord -> C'Evas_Coord -> IO ()
foreign import ccall "&evas_object_size_hint_min_set" p'evas_object_size_hint_min_set
  :: FunPtr (Ptr C'Evas_Object -> C'Evas_Coord -> C'Evas_Coord -> IO ())

{-# LINE 59 "HElementary\ElementaryFFI.hsc" #-}
foreign import ccall "evas_object_resize" c'evas_object_resize
  :: Ptr C'Evas_Object -> C'Evas_Coord -> C'Evas_Coord -> IO ()
foreign import ccall "&evas_object_resize" p'evas_object_resize
  :: FunPtr (Ptr C'Evas_Object -> C'Evas_Coord -> C'Evas_Coord -> IO ())

{-# LINE 60 "HElementary\ElementaryFFI.hsc" #-}

foreign import ccall "evas_object_size_hint_weight_set" c'evas_object_size_hint_weight_set
  :: Ptr C'Evas_Object -> CDouble-> CDouble-> IO ()
foreign import ccall "&evas_object_size_hint_weight_set" p'evas_object_size_hint_weight_set
  :: FunPtr (Ptr C'Evas_Object -> CDouble-> CDouble-> IO ())

{-# LINE 62 "HElementary\ElementaryFFI.hsc" #-}
foreign import ccall "evas_object_size_hint_align_set" c'evas_object_size_hint_align_set
  :: Ptr C'Evas_Object -> CDouble-> CDouble-> IO ()
foreign import ccall "&evas_object_size_hint_align_set" p'evas_object_size_hint_align_set
  :: FunPtr (Ptr C'Evas_Object -> CDouble-> CDouble-> IO ())

{-# LINE 63 "HElementary\ElementaryFFI.hsc" #-}

foreign import ccall "elm_entry_scrollable_set" c'elm_entry_scrollable_set
  :: Ptr C'Evas_Object-> C'Eina_Bool -> IO ()
foreign import ccall "&elm_entry_scrollable_set" p'elm_entry_scrollable_set
  :: FunPtr (Ptr C'Evas_Object-> C'Eina_Bool -> IO ())

{-# LINE 65 "HElementary\ElementaryFFI.hsc" #-}
foreign import ccall "elm_entry_scrollbar_policy_set" c'elm_entry_scrollbar_policy_set
  :: Ptr C'Evas_Object -> C'Elm_Scroller_Policy -> C'Elm_Scroller_Policy -> IO ()
foreign import ccall "&elm_entry_scrollbar_policy_set" p'elm_entry_scrollbar_policy_set
  :: FunPtr (Ptr C'Evas_Object -> C'Elm_Scroller_Policy -> C'Elm_Scroller_Policy -> IO ())

{-# LINE 66 "HElementary\ElementaryFFI.hsc" #-}

foreign import ccall "evas_object_del" c'evas_object_del
  :: Ptr C'Evas_Object -> IO ()
foreign import ccall "&evas_object_del" p'evas_object_del
  :: FunPtr (Ptr C'Evas_Object -> IO ())

{-# LINE 68 "HElementary\ElementaryFFI.hsc" #-}

