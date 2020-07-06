Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 841EA215C67
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 18:58:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsUR8-0004dE-J5; Mon, 06 Jul 2020 16:57:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiqY=AR=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jsUR7-0004d6-Bn
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 16:57:45 +0000
X-Inumbo-ID: cfa8b784-bfa9-11ea-bca7-bc764e2007e4
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfa8b784-bfa9-11ea-bca7-bc764e2007e4;
 Mon, 06 Jul 2020 16:57:44 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id c16so40096841ioi.9
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 09:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jbu76fBiXNYavUN7hJcbgVnTcX2cRFUs4aT7tEW/KCU=;
 b=ubHpKe3Nm/Sr5j6MorIaPojzmsRHj5+fmcltESNG2gAbWTvX1yCj86i/BloyiAH3SL
 xWhHSfxANC145Do+ytU9h3x6gUWXXpxoJbax6p8l+3hblfd3vf/ZAPYv7trfCqGSSgM7
 ULfQdyQJbfWa7bnl+6S/qg9ngCL58WTQ9YsqfvGxRjz48ApcTCue/jtHA4PiCxoPwZhs
 CTGRtaolavDk8YuMP5fi1gXkm8RHoEKlXhKjVg2jvZnxY6lwWUiXLwfdbEuPrlbjmpfN
 ZYZ+D4DfO4FNsz/Cko3Rugg6gv4hh5P11TwOjAfiM1LmFxrBE++T4JSXMs2EiDcjqq0I
 iI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jbu76fBiXNYavUN7hJcbgVnTcX2cRFUs4aT7tEW/KCU=;
 b=pJnphxkRSRRn1uVrolrPLbj8qo8tdk7wnrVH0huFD11D6/yGRpV1gYGvK6BecmcaNK
 d8zC3S+nbUx24xM1JFn29eo2WP2EtohbDoewPLrYb0Xwmf5cQTy0VqkLhtNC/dQv4Q9r
 F8x/3BNDxdQ75MiM7mEInMHA3lrSbfUi1/8qLbBdvKRBR9bFpmTS2XxE7xoWjy3B4nZ7
 dGvL+Ty2UhAYvT0c2oIuDCcxGO5QH5Q+ypdycVEWc2w+CxKh02DJeXgmDV8usLs1WkUk
 zHtuY5ccTmapYGPs9zBt2wCFe9mRAjg5GcIAdqSDy5K6uYM2fnBkmHQ515QEQzAH8kkC
 ebsw==
X-Gm-Message-State: AOAM531xR1Bv3vxrJdCh4pPSRBXngXF9hPD+aKuRv9Pl3Erw3StpdtSv
 f/MiMxf4us9trvPux3KKh+/jwmIMwcMuiJa4veo=
X-Google-Smtp-Source: ABdhPJz4Nagjt4yMPeIUiuanaZZK73HDv7ILWk0uVF4t2Q+HCp1PRj88webbTw+MS2P2VLqMmcsYgAWk06cLvYu6Q4g=
X-Received: by 2002:a02:1a06:: with SMTP id 6mr55748921jai.8.1594054664021;
 Mon, 06 Jul 2020 09:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-9-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-9-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:47:55 -0700
Message-ID: <CAKmqyKNeuFosuMbvQ80EQ2uCEXpxfii=8WZE_njt8=3UyzUMqw@mail.gmail.com>
Subject: Re: [PATCH 08/26] hw/usb/hcd-dwc2: Restrict 'dwc2-regs.h' scope
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

On Sat, Jul 4, 2020 at 7:53 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> We only use these register definitions in files under the
> hw/usb/ directory. Keep that header local by moving it there.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  {include/hw =3D> hw}/usb/dwc2-regs.h | 0
>  hw/usb/hcd-dwc2.c                  | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename {include/hw =3D> hw}/usb/dwc2-regs.h (100%)
>
> diff --git a/include/hw/usb/dwc2-regs.h b/hw/usb/dwc2-regs.h
> similarity index 100%
> rename from include/hw/usb/dwc2-regs.h
> rename to hw/usb/dwc2-regs.h
> diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
> index ccf05d0823..252b60ef65 100644
> --- a/hw/usb/hcd-dwc2.c
> +++ b/hw/usb/hcd-dwc2.c
> @@ -34,7 +34,6 @@
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
>  #include "qapi/error.h"
> -#include "hw/usb/dwc2-regs.h"
>  #include "hw/usb/hcd-dwc2.h"
>  #include "hw/irq.h"
>  #include "sysemu/dma.h"
> @@ -43,6 +42,7 @@
>  #include "qemu/timer.h"
>  #include "qemu/log.h"
>  #include "hw/qdev-properties.h"
> +#include "dwc2-regs.h"
>
>  #define USB_HZ_FS       12000000
>  #define USB_HZ_HS       96000000
> --
> 2.21.3
>
>

