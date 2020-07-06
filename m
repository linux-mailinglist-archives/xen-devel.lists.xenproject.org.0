Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFF5215CB6
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 19:10:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsUdh-0007Ab-Pt; Mon, 06 Jul 2020 17:10:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiqY=AR=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jsUdg-0007A2-CC
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 17:10:44 +0000
X-Inumbo-ID: a04beea0-bfab-11ea-bb8b-bc764e2007e4
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a04beea0-bfab-11ea-bb8b-bc764e2007e4;
 Mon, 06 Jul 2020 17:10:43 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id v6so26479595iob.4
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 10:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wZPcNnfJm5MPTasltoq/pBa3iV0LcdhND5nIpKUJi/8=;
 b=k/1aoEljxB0uBEqfqH0Zn4KhFaSEHuRC7puZspsg00ZQnuYbG361wHg3SacgFJDj5D
 tsj3n5BFbxJduCK35tjRhuF2/a9NzvStraAOtyCnDhA1x3ZIDzvxsj0SeVn96GcH66cQ
 +fOPAx/5lIiJ6CUyYV8ORDaUEU0GMk/TmxFz2lsMqQ1ZPLYRTUaOZTHWIAoFD6WwT2w9
 dE0VZxLY1HVMcUMAVCCqzToMHhxxVykCFBb3WPUEtZ8T5PdUIBDhJKXxk1Spjm8NLNHs
 uMj6b4Ox5j2PchTgKufiol5/oFIvZYBrDFwPFhjtdYp+E3sHNnFizOD1mX/9Z5ZYBI8v
 cucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wZPcNnfJm5MPTasltoq/pBa3iV0LcdhND5nIpKUJi/8=;
 b=qqfNdsATDQxUJKXjLyENvCiB56yZ2Zp3rPcGjeXUX3lyAbsZ275RXOMNnpd7PpZ40f
 T5MfXmkCodpaJ2u2dNKBx0fHdWbB6o1al8FpLhqSCQfkZjzQDyH5CVR4YJ0Uwx97zXTz
 r33gDEH1KKcDW534euOljWbaj1YbhX8PS02yl5Bn6t7E5SdPWfkPGQ3DdNcB3ZizaEgn
 TqQNidmeoxGtORrIO7765XGaU1wheuoGyEGsRsj0lCndbV8Y+xUUomnYjXwiZ6c5jpJy
 C6q0FbGLQ1H+Wo3QzXN8Uq4ndHr00Uk2on/PHyCC3uqQOnW79wgchPnQnMt0FVCIWhOI
 OPVA==
X-Gm-Message-State: AOAM533yMP1lviNBXHyTefqAqBytvBtZ9ZQB4heT83QikKudq3NW6uOX
 +r/LNf8MchTXDUDBSahF42PTg8vj3Nlzl68572c=
X-Google-Smtp-Source: ABdhPJx4Y0GqgQR2J49zdJrF6Wimg0enF5qkXxsI0KvUd7/3ziu/gL8IcMOHx3OKEzWPz3QhdGIRQSrp8CAFUbt1qmc=
X-Received: by 2002:a02:6c4c:: with SMTP id w73mr55529406jab.26.1594055443540; 
 Mon, 06 Jul 2020 10:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-14-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-14-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 10:00:56 -0700
Message-ID: <CAKmqyKOcdG_Wv8yectwwHaxmryB9uBKK+GX1ZGtrq7ZCRcRsAw@mail.gmail.com>
Subject: Re: [PATCH 13/26] hw/usb/desc: Reduce some declarations scope
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Paul Zimmerman <pauldzim@gmail.com>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, Jul 4, 2020 at 7:59 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> USBDescString is forward-declared. Only bus.c uses the
> usb_device_get_product_desc() and usb_device_get_usb_desc()
> function. Move all that to the "desc.h" header to reduce
> the big "hw/usb.h" header a bit.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/usb/desc.h    | 10 ++++++++++
>  include/hw/usb.h | 10 ----------
>  hw/usb/bus.c     |  1 +
>  3 files changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/hw/usb/desc.h b/hw/usb/desc.h
> index 92594fbe29..4bf6966c4b 100644
> --- a/hw/usb/desc.h
> +++ b/hw/usb/desc.h
> @@ -242,4 +242,14 @@ int usb_desc_get_descriptor(USBDevice *dev, USBPacke=
t *p,
>  int usb_desc_handle_control(USBDevice *dev, USBPacket *p,
>          int request, int value, int index, int length, uint8_t *data);
>
> +const char *usb_device_get_product_desc(USBDevice *dev);
> +
> +const USBDesc *usb_device_get_usb_desc(USBDevice *dev);
> +
> +struct USBDescString {
> +    uint8_t index;
> +    char *str;
> +    QLIST_ENTRY(USBDescString) next;
> +};
> +
>  #endif /* QEMU_HW_USB_DESC_H */
> diff --git a/include/hw/usb.h b/include/hw/usb.h
> index 15b2ef300a..18f1349bdc 100644
> --- a/include/hw/usb.h
> +++ b/include/hw/usb.h
> @@ -192,12 +192,6 @@ typedef struct USBDescOther USBDescOther;
>  typedef struct USBDescString USBDescString;
>  typedef struct USBDescMSOS USBDescMSOS;
>
> -struct USBDescString {
> -    uint8_t index;
> -    char *str;
> -    QLIST_ENTRY(USBDescString) next;
> -};
> -
>  #define USB_MAX_ENDPOINTS  15
>  #define USB_MAX_INTERFACES 16
>
> @@ -555,10 +549,6 @@ int usb_device_alloc_streams(USBDevice *dev, USBEndp=
oint **eps, int nr_eps,
>                               int streams);
>  void usb_device_free_streams(USBDevice *dev, USBEndpoint **eps, int nr_e=
ps);
>
> -const char *usb_device_get_product_desc(USBDevice *dev);
> -
> -const USBDesc *usb_device_get_usb_desc(USBDevice *dev);
> -
>  /* quirks.c */
>
>  /* In bulk endpoints are streaming data sources (iow behave like isoc ep=
s) */
> diff --git a/hw/usb/bus.c b/hw/usb/bus.c
> index 957559b18d..111c3af7c1 100644
> --- a/hw/usb/bus.c
> +++ b/hw/usb/bus.c
> @@ -9,6 +9,7 @@
>  #include "monitor/monitor.h"
>  #include "trace.h"
>  #include "qemu/cutils.h"
> +#include "desc.h"
>
>  static void usb_bus_dev_print(Monitor *mon, DeviceState *qdev, int inden=
t);
>
> --
> 2.21.3
>
>

