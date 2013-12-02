#include <bindings.dsl.h>

module HElementary.ElementaryFFI where
#strict_import
#include "Elementary.h"


#opaque_t Evas_Object
#opaque_t void
#integral_t Eina_Bool
#num EINA_TRUE
#num EINA_FALSE

#integral_t Elm_Scroller_Policy
#num ELM_SCROLLER_POLICY_AUTO 
#num ELM_SCROLLER_POLICY_ON
#num ELM_SCROLLER_POLICY_OFF
#num ELM_SCROLLER_POLICY_LAST


#num EVAS_HINT_EXPAND
#num EVAS_HINT_FILL

#integral_t Evas_Coord

#callconv elm_init , ccall , CInt -> Ptr (Ptr CChar)-> IO CInt
#callconv elm_shutdown , ccall ,  IO CInt

#ccall elm_run , IO ()
#ccall elm_exit , IO ()

#ccall elm_win_util_standard_add , Ptr CChar-> Ptr CChar-> IO (Ptr <Evas_Object>)
#ccall evas_object_show , Ptr <Evas_Object>-> IO ()

#ccall evas_object_smart_callback_add , Ptr <Evas_Object> -> Ptr CChar -> FunPtr (Ptr () -> Ptr <Evas_Object> -> Ptr () -> IO ()) -> Ptr () -> IO ()

#ccall elm_box_add , Ptr <Evas_Object> -> IO (Ptr <Evas_Object>)

#ccall elm_box_horizontal_set , Ptr <Evas_Object> -> CInt -> IO ()
#ccall elm_box_homogeneous_set , Ptr <Evas_Object> -> CInt -> IO ()

#ccall elm_win_resize_object_add , Ptr <Evas_Object> -> Ptr <Evas_Object> -> IO ()

#ccall elm_label_add , Ptr <Evas_Object> -> IO (Ptr <Evas_Object>)

#cinline elm_object_text_set , Ptr <Evas_Object> -> Ptr CChar -> IO ()

#ccall elm_box_pack_end , Ptr <Evas_Object> -> Ptr <Evas_Object> -> IO ()

#ccall elm_entry_add , Ptr <Evas_Object> -> IO (Ptr <Evas_Object>)

#ccall elm_button_add , Ptr <Evas_Object> -> IO (Ptr <Evas_Object>)

#ccall elm_entry_single_line_set , Ptr <Evas_Object> -> <Eina_Bool> -> IO ()

#ccall elm_entry_password_set , Ptr <Evas_Object> -> <Eina_Bool> -> IO ()

#ccall evas_object_size_hint_min_set , Ptr <Evas_Object> -> <Evas_Coord> -> <Evas_Coord> -> IO ()
#ccall evas_object_resize , Ptr <Evas_Object> -> <Evas_Coord> -> <Evas_Coord> -> IO ()

#ccall evas_object_size_hint_weight_set , Ptr <Evas_Object> -> CDouble-> CDouble-> IO ()
#ccall evas_object_size_hint_align_set , Ptr <Evas_Object> -> CDouble-> CDouble-> IO ()

#ccall elm_entry_scrollable_set , Ptr <Evas_Object>-> <Eina_Bool> -> IO ()
#ccall elm_entry_scrollbar_policy_set , Ptr <Evas_Object> -> <Elm_Scroller_Policy> -> <Elm_Scroller_Policy> -> IO ()

#ccall evas_object_del , Ptr <Evas_Object> -> IO ()

