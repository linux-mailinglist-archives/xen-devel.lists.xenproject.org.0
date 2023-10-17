Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 542127CCD58
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 22:04:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618356.961916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsqII-00029P-7b; Tue, 17 Oct 2023 20:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618356.961916; Tue, 17 Oct 2023 20:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsqII-000263-4L; Tue, 17 Oct 2023 20:03:58 +0000
Received: by outflank-mailman (input) for mailman id 618356;
 Tue, 17 Oct 2023 20:03:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJo3=F7=ilande.co.uk=mark.cave-ayland@srs-se1.protection.inumbo.net>)
 id 1qsqIG-00025x-Us
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 20:03:57 +0000
Received: from mail.ilande.co.uk (mail.ilande.co.uk [2001:41c9:1:41f::167])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b8a8ca4-6d28-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 22:03:53 +0200 (CEST)
Received: from [2a00:23c4:8bb0:3200:407d:a65c:9fb4:b9b4]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1qsqI1-0001Wa-Ei; Tue, 17 Oct 2023 21:03:45 +0100
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 4b8a8ca4-6d28-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Uuyqiv3nZGm9IgxXvUvISIuIpnNbmO1i/BKyCpPauZg=; b=SCBq71hxcx9gsL/i0Hywr5DGoe
	8HuzyWolFaLTXsz9p8YsZLFxURbHTVaif2UzYOLac+fvlDzcQn12XQMXDQ3JV9uvBR+xrtx+KvhGN
	ZOK4i8HOYwbZX440K+YUEVIIxcBUDUuRy5GjnRi0onQ6Ynghp3dkLEwMNdqLSuRVzivYKQ9+MgKXm
	XJFRPZPh9Qpr24cSW5hL940CkCim9Kpr7Pl+necms61nFfCnWtNtceMv0ol9xNX7syQYagONk7cH/
	2w9Ok524668xVApbQHdIHll7kZ4hM4380k8UywivT+9WTXACbFx1y108nWCwaRcNdAqDK12FqzWG0
	hVXdE9hpwbPSXwKjlJv7mtkSokoqoJ8Qhk6yXxqUvH8mHtxrV40YH1Y+ci3Tkl6DtwYwNDSFdALF7
	wC9I9tldydlDRrgfkKyQelCriuKEx7g0RnHy6COLnTSOwLKuipGi/gqKQvzYLkqq69cOgA9QSqxat
	WGhSLlgc/6uChPV1swcjBOtN1N97P/Rn7h6Zkz17Y2xrlfJ+xfYGTI6ZQpHM7PDb/5CmN+AQSvrv6
	5aCAS4xsJamZGBUYo1vewJEeSwf8b1Lnq9B8xesSPKjxN5cwpNolAiFYS2vD1Yw2ij4gybSBAvhZZ
	TwJQxep0sD9INMZX4KVZV2AoNkgSuuxM5pcPb+b7U=;
Message-ID: <b8e0311c-242e-4447-937c-70b43d4d255b@ilande.co.uk>
Date: Tue, 17 Oct 2023 21:03:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-ppc@nongnu.org,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Gerd Hoffmann <kraxel@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20231017131251.43708-1-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 xsBNBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAHNME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPsLA
 eAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63M7ATQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABwsBfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
In-Reply-To: <20231017131251.43708-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bb0:3200:407d:a65c:9fb4:b9b4
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	mail.default.ilande.bv.iomart.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED,URIBL_SBL_A autolearn=no autolearn_force=no version=3.4.2
Subject: Re: [PATCH] ui/input: Constify QemuInputHandler structure
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)

On 17/10/2023 14:12, Philippe Mathieu-Daudé wrote:

> Access to QemuInputHandlerState::handler are read-only.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/virtio/virtio-input.h | 2 +-
>   include/ui/input.h               | 2 +-
>   chardev/msmouse.c                | 2 +-
>   chardev/wctablet.c               | 2 +-
>   hw/char/escc.c                   | 2 +-
>   hw/display/xenfb.c               | 6 +++---
>   hw/input/adb-kbd.c               | 2 +-
>   hw/input/hid.c                   | 6 +++---
>   hw/input/ps2.c                   | 4 ++--
>   hw/input/virtio-input-hid.c      | 8 ++++----
>   ui/input-legacy.c                | 2 +-
>   ui/input.c                       | 4 ++--
>   ui/vdagent.c                     | 2 +-
>   13 files changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/include/hw/virtio/virtio-input.h b/include/hw/virtio/virtio-input.h
> index 08f1591424..a6c9703644 100644
> --- a/include/hw/virtio/virtio-input.h
> +++ b/include/hw/virtio/virtio-input.h
> @@ -84,7 +84,7 @@ struct VirtIOInputHID {
>       VirtIOInput                       parent_obj;
>       char                              *display;
>       uint32_t                          head;
> -    QemuInputHandler                  *handler;
> +    const QemuInputHandler            *handler;
>       QemuInputHandlerState             *hs;
>       int                               ledstate;
>       bool                              wheel_axis;
> diff --git a/include/ui/input.h b/include/ui/input.h
> index 24d8e4579e..8f9aac562e 100644
> --- a/include/ui/input.h
> +++ b/include/ui/input.h
> @@ -30,7 +30,7 @@ struct QemuInputHandler {
>   };
>   
>   QemuInputHandlerState *qemu_input_handler_register(DeviceState *dev,
> -                                                   QemuInputHandler *handler);
> +                                            const QemuInputHandler *handler);
>   void qemu_input_handler_activate(QemuInputHandlerState *s);
>   void qemu_input_handler_deactivate(QemuInputHandlerState *s);
>   void qemu_input_handler_unregister(QemuInputHandlerState *s);
> diff --git a/chardev/msmouse.c b/chardev/msmouse.c
> index ab8fe981d6..a774c397b4 100644
> --- a/chardev/msmouse.c
> +++ b/chardev/msmouse.c
> @@ -171,7 +171,7 @@ static int msmouse_chr_write(struct Chardev *s, const uint8_t *buf, int len)
>       return len;
>   }
>   
> -static QemuInputHandler msmouse_handler = {
> +static const QemuInputHandler msmouse_handler = {
>       .name  = "QEMU Microsoft Mouse",
>       .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,
>       .event = msmouse_input_event,
> diff --git a/chardev/wctablet.c b/chardev/wctablet.c
> index 43bdf6b608..f4008bf35b 100644
> --- a/chardev/wctablet.c
> +++ b/chardev/wctablet.c
> @@ -178,7 +178,7 @@ static void wctablet_input_sync(DeviceState *dev)
>       }
>   }
>   
> -static QemuInputHandler wctablet_handler = {
> +static const QemuInputHandler wctablet_handler = {
>       .name  = "QEMU Wacom Pen Tablet",
>       .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_ABS,
>       .event = wctablet_input_event,
> diff --git a/hw/char/escc.c b/hw/char/escc.c
> index 4be66053c1..48b30ee760 100644
> --- a/hw/char/escc.c
> +++ b/hw/char/escc.c
> @@ -845,7 +845,7 @@ static void sunkbd_handle_event(DeviceState *dev, QemuConsole *src,
>       put_queue(s, keycode);
>   }
>   
> -static QemuInputHandler sunkbd_handler = {
> +static const QemuInputHandler sunkbd_handler = {
>       .name  = "sun keyboard",
>       .mask  = INPUT_EVENT_MASK_KEY,
>       .event = sunkbd_handle_event,
> diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
> index 0074a9b6f8..b2130a0d70 100644
> --- a/hw/display/xenfb.c
> +++ b/hw/display/xenfb.c
> @@ -321,20 +321,20 @@ static void xenfb_mouse_sync(DeviceState *dev)
>       xenfb->wheel = 0;
>   }
>   
> -static QemuInputHandler xenfb_keyboard = {
> +static const QemuInputHandler xenfb_keyboard = {
>       .name  = "Xen PV Keyboard",
>       .mask  = INPUT_EVENT_MASK_KEY,
>       .event = xenfb_key_event,
>   };
>   
> -static QemuInputHandler xenfb_abs_mouse = {
> +static const QemuInputHandler xenfb_abs_mouse = {
>       .name  = "Xen PV Mouse",
>       .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_ABS,
>       .event = xenfb_mouse_event,
>       .sync  = xenfb_mouse_sync,
>   };
>   
> -static QemuInputHandler xenfb_rel_mouse = {
> +static const QemuInputHandler xenfb_rel_mouse = {
>       .name  = "Xen PV Mouse",
>       .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,
>       .event = xenfb_mouse_event,
> diff --git a/hw/input/adb-kbd.c b/hw/input/adb-kbd.c
> index a9088c910c..e21edf9acd 100644
> --- a/hw/input/adb-kbd.c
> +++ b/hw/input/adb-kbd.c
> @@ -355,7 +355,7 @@ static void adb_kbd_reset(DeviceState *dev)
>       s->count = 0;
>   }
>   
> -static QemuInputHandler adb_keyboard_handler = {
> +static const QemuInputHandler adb_keyboard_handler = {
>       .name  = "QEMU ADB Keyboard",
>       .mask  = INPUT_EVENT_MASK_KEY,
>       .event = adb_keyboard_event,
> diff --git a/hw/input/hid.c b/hw/input/hid.c
> index a9c7dd1ce1..b8e85374ca 100644
> --- a/hw/input/hid.c
> +++ b/hw/input/hid.c
> @@ -510,20 +510,20 @@ void hid_free(HIDState *hs)
>       hid_del_idle_timer(hs);
>   }
>   
> -static QemuInputHandler hid_keyboard_handler = {
> +static const QemuInputHandler hid_keyboard_handler = {
>       .name  = "QEMU HID Keyboard",
>       .mask  = INPUT_EVENT_MASK_KEY,
>       .event = hid_keyboard_event,
>   };
>   
> -static QemuInputHandler hid_mouse_handler = {
> +static const QemuInputHandler hid_mouse_handler = {
>       .name  = "QEMU HID Mouse",
>       .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,
>       .event = hid_pointer_event,
>       .sync  = hid_pointer_sync,
>   };
>   
> -static QemuInputHandler hid_tablet_handler = {
> +static const QemuInputHandler hid_tablet_handler = {
>       .name  = "QEMU HID Tablet",
>       .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_ABS,
>       .event = hid_pointer_event,
> diff --git a/hw/input/ps2.c b/hw/input/ps2.c
> index 45af76a837..c8fd23cf36 100644
> --- a/hw/input/ps2.c
> +++ b/hw/input/ps2.c
> @@ -1231,7 +1231,7 @@ static const VMStateDescription vmstate_ps2_mouse = {
>       }
>   };
>   
> -static QemuInputHandler ps2_keyboard_handler = {
> +static const QemuInputHandler ps2_keyboard_handler = {
>       .name  = "QEMU PS/2 Keyboard",
>       .mask  = INPUT_EVENT_MASK_KEY,
>       .event = ps2_keyboard_event,
> @@ -1242,7 +1242,7 @@ static void ps2_kbd_realize(DeviceState *dev, Error **errp)
>       qemu_input_handler_register(dev, &ps2_keyboard_handler);
>   }
>   
> -static QemuInputHandler ps2_mouse_handler = {
> +static const QemuInputHandler ps2_mouse_handler = {
>       .name  = "QEMU PS/2 Mouse",
>       .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,
>       .event = ps2_mouse_event,
> diff --git a/hw/input/virtio-input-hid.c b/hw/input/virtio-input-hid.c
> index 7053ad72d4..45e4d4c75d 100644
> --- a/hw/input/virtio-input-hid.c
> +++ b/hw/input/virtio-input-hid.c
> @@ -265,7 +265,7 @@ static const TypeInfo virtio_input_hid_info = {
>   
>   /* ----------------------------------------------------------------- */
>   
> -static QemuInputHandler virtio_keyboard_handler = {
> +static const QemuInputHandler virtio_keyboard_handler = {
>       .name  = VIRTIO_ID_NAME_KEYBOARD,
>       .mask  = INPUT_EVENT_MASK_KEY,
>       .event = virtio_input_handle_event,
> @@ -322,7 +322,7 @@ static const TypeInfo virtio_keyboard_info = {
>   
>   /* ----------------------------------------------------------------- */
>   
> -static QemuInputHandler virtio_mouse_handler = {
> +static const QemuInputHandler virtio_mouse_handler = {
>       .name  = VIRTIO_ID_NAME_MOUSE,
>       .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,
>       .event = virtio_input_handle_event,
> @@ -416,7 +416,7 @@ static const TypeInfo virtio_mouse_info = {
>   
>   /* ----------------------------------------------------------------- */
>   
> -static QemuInputHandler virtio_tablet_handler = {
> +static const QemuInputHandler virtio_tablet_handler = {
>       .name  = VIRTIO_ID_NAME_TABLET,
>       .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_ABS,
>       .event = virtio_input_handle_event,
> @@ -541,7 +541,7 @@ static const TypeInfo virtio_tablet_info = {
>   
>   /* ----------------------------------------------------------------- */
>   
> -static QemuInputHandler virtio_multitouch_handler = {
> +static const QemuInputHandler virtio_multitouch_handler = {
>       .name  = VIRTIO_ID_NAME_MULTITOUCH,
>       .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_MTT,
>       .event = virtio_input_handle_event,
> diff --git a/ui/input-legacy.c b/ui/input-legacy.c
> index 46ea74e44d..210ae5eaca 100644
> --- a/ui/input-legacy.c
> +++ b/ui/input-legacy.c
> @@ -127,7 +127,7 @@ static void legacy_kbd_event(DeviceState *dev, QemuConsole *src,
>       }
>   }
>   
> -static QemuInputHandler legacy_kbd_handler = {
> +static const QemuInputHandler legacy_kbd_handler = {
>       .name  = "legacy-kbd",
>       .mask  = INPUT_EVENT_MASK_KEY,
>       .event = legacy_kbd_event,
> diff --git a/ui/input.c b/ui/input.c
> index cbe8573c5c..dc745860f4 100644
> --- a/ui/input.c
> +++ b/ui/input.c
> @@ -10,7 +10,7 @@
>   
>   struct QemuInputHandlerState {
>       DeviceState       *dev;
> -    QemuInputHandler  *handler;
> +    const QemuInputHandler *handler;
>       int               id;
>       int               events;
>       QemuConsole       *con;
> @@ -46,7 +46,7 @@ static uint32_t queue_count;
>   static uint32_t queue_limit = 1024;
>   
>   QemuInputHandlerState *qemu_input_handler_register(DeviceState *dev,
> -                                                   QemuInputHandler *handler)
> +                                            const QemuInputHandler *handler)
>   {
>       QemuInputHandlerState *s = g_new0(QemuInputHandlerState, 1);
>       static int id = 1;
> diff --git a/ui/vdagent.c b/ui/vdagent.c
> index 00d36a8677..706d6d97bd 100644
> --- a/ui/vdagent.c
> +++ b/ui/vdagent.c
> @@ -297,7 +297,7 @@ static void vdagent_pointer_sync(DeviceState *dev)
>       }
>   }
>   
> -static QemuInputHandler vdagent_mouse_handler = {
> +static const QemuInputHandler vdagent_mouse_handler = {
>       .name  = "vdagent mouse",
>       .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_ABS,
>       .event = vdagent_pointer_event,

Looks mostly harmless to me:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.


