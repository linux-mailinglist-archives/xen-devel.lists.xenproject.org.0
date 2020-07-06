Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575D9215CC0
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 19:12:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsUf4-0007I3-5G; Mon, 06 Jul 2020 17:12:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiqY=AR=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jsUf2-0007Hx-FA
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 17:12:08 +0000
X-Inumbo-ID: d2631c9c-bfab-11ea-bca7-bc764e2007e4
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2631c9c-bfab-11ea-bca7-bc764e2007e4;
 Mon, 06 Jul 2020 17:12:07 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id v6so26484838iob.4
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 10:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P0d8Iq06s1RxhBs4I7BZ5yRhluIYSvpMY7wkvFtI2Xg=;
 b=Y+NfzrMhVjazx3jBHloldv5qQ1eAAl6uiOiG7IwSb4NMG6+903IYIYU0tSMwa8mrC3
 cTQQBM94OvCgQ7efQJmM6schD+rLNB+ozc5/uJgypYi55rBKWT+NxRBPTgvuL6eWEhhE
 7rUuX7OsT4URw2jWCniwP0L1yU131oOJcE/YnIXdhlnn6n4G1LcX+iI6fNOgQFNSh157
 m2EprNayyIy7Rbewu0VeNMbCXbX+6iCdEKOcr8WRTrTBw4Gh4m+fC7fmitA3XMXG66WL
 XqFVF5UEWj2WlfQevGi6yVpV9hZNiy39mq2dQqoo5OhqyH5Quk+sfoOIKSNr3g+956up
 gJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P0d8Iq06s1RxhBs4I7BZ5yRhluIYSvpMY7wkvFtI2Xg=;
 b=PcHutAMYEC+hmZIJHa537NTwe2CfAUCfRa4JR7BanBZMTPGMEvdM9KSKZTVMw/J/Al
 xtcJxGuiXenhef0Z1srinl0xh7vHaJ3uuQi/v6Ay6vx7pgpRc5nc3LwlZxaulS4xc2Ni
 ljf3HMne1xf70aSrVYLk6zB2adKPFtZ5fF6yuCahaM//bSE9/tXoAd0+zw4nqWDP/Usb
 WiSPt5qgJDmKO1KZK9kAeVAngl0vo5GG88oun4Sk/WHB60lf5tDnU+TikJxN/K0xy2k2
 BcLkVHjAkzNO2rl/YFZ/jS66dYo+jltalxoX9X/Tx0jW3t3VKfjiEyPH3cVpVkGkJlX3
 hBbg==
X-Gm-Message-State: AOAM530abkzsM16oXE1ZEqY+2yPps7uU0m3oszFzn5kpR2yH0pId0epx
 nReIc7hGpnYSuOUsxfaN4+BqWgTcX3LDrjBj1ls=
X-Google-Smtp-Source: ABdhPJwQ4Y5SU2PHxNBgM6arl9mZiS4VMzkN+WtIMsTLI4VHjyaJG6nzbQPzYC2Wzjh5CnPd7DP0E6zy1bY/U6O6MAw=
X-Received: by 2002:a5d:9306:: with SMTP id l6mr26961459ion.105.1594055527579; 
 Mon, 06 Jul 2020 10:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-15-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-15-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 10:02:20 -0700
Message-ID: <CAKmqyKNYrB+BxS41KFWhYc2wXetJH4sJ_18kEDcaYPzu87r49A@mail.gmail.com>
Subject: Re: [PATCH 14/26] hw/usb/quirks: Rename included source with '.inc.c'
 suffix
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

On Sat, Jul 4, 2020 at 7:58 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> This file is not a header, but contains source code which is
> included and compiled once. We use the '.inc.c' suffix in few
> other cases in the repository. Follow the same convention with
> this file.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/usb/quirks.c                   | 2 +-
>  hw/usb/{quirks.h =3D> quirks.inc.c} | 5 -----
>  2 files changed, 1 insertion(+), 6 deletions(-)
>  rename hw/usb/{quirks.h =3D> quirks.inc.c} (99%)
>
> diff --git a/hw/usb/quirks.c b/hw/usb/quirks.c
> index 23ea7a23ea..655b36f2d5 100644
> --- a/hw/usb/quirks.c
> +++ b/hw/usb/quirks.c
> @@ -13,7 +13,7 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "quirks.h"
> +#include "quirks.inc.c"
>  #include "hw/usb.h"
>
>  static bool usb_id_match(const struct usb_device_id *ids,
> diff --git a/hw/usb/quirks.h b/hw/usb/quirks.inc.c
> similarity index 99%
> rename from hw/usb/quirks.h
> rename to hw/usb/quirks.inc.c
> index 50ef2f9c2e..004b228aba 100644
> --- a/hw/usb/quirks.h
> +++ b/hw/usb/quirks.inc.c
> @@ -12,9 +12,6 @@
>   * (at your option) any later version.
>   */
>
> -#ifndef HW_USB_QUIRKS_H
> -#define HW_USB_QUIRKS_H
> -
>  /* 1 on 1 copy of linux/drivers/usb/serial/ftdi_sio_ids.h */
>  #include "quirks-ftdi-ids.h"
>  /* 1 on 1 copy of linux/drivers/usb/serial/pl2303.h */
> @@ -915,5 +912,3 @@ static const struct usb_device_id usbredir_ftdi_seria=
l_ids[] =3D {
>
>  #undef USB_DEVICE
>  #undef USB_DEVICE_AND_INTERFACE_INFO
> -
> -#endif
> --
> 2.21.3
>
>

