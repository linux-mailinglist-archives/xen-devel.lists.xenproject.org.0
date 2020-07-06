Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D87BB215CA6
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 19:07:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsUal-0006D7-Mu; Mon, 06 Jul 2020 17:07:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiqY=AR=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jsUaj-0006Cx-TH
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 17:07:41 +0000
X-Inumbo-ID: 338f3dee-bfab-11ea-bb8b-bc764e2007e4
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 338f3dee-bfab-11ea-bb8b-bc764e2007e4;
 Mon, 06 Jul 2020 17:07:41 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id q74so16558443iod.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 10:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dBgIVLKA0exdXkprZM6w2CG1AHicJslD0tUu5CxlPMg=;
 b=iqkaVDc+Prmll7W77QI2rjsviIcN5ukUeuzuaQ0p2o0zCEfPG0UufK2FbcqQBNBIWA
 guTgtEdhEKGxejAPHA9tMZmUDN3oLd7C2F0fKRP3owIBf/3tZ11gV8WrZd1M/ig0wQ6V
 kMYCtvlGTOSJe6qG/h8lVqrP3vA+s8CU5gCDC1Wp0auG8Myfi+4wBJ7sve4nUfxtUQa8
 WHp/NFGJDmm4uIEFnPQD7R6ve34GdwcRK7lZxMbn/Dt8nvSuLcJnM1PTi7aYL2e3L8UN
 MvCrzRJl874oVwv+GY8to2rSNjmgWVf0WumbR206I4OuAAVCHdu/C1OKKjCgdQQZOSva
 47bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dBgIVLKA0exdXkprZM6w2CG1AHicJslD0tUu5CxlPMg=;
 b=mIha8bW/bb1IQhS1fHi5QCHsw/oxYmR4XWFSrXNHl40B3z2KLo2Ujk9CfTNoclGRNh
 4KXD6j9PM/ramTjHdPkzNw1mt2XZ6LBK6h2uhPUVT7sFqw139r2vR6fybOacMFV6XKlR
 FW/4FzOQkkoyKqv7wpThLBedbJ6+vvQLNPeIKmLsc46C7WIgdNvaLucy8OV0LP7yVhGY
 bj5OV4OZig5KI8B2QwJMOsnYospzuSbg9bKCS/8b//yjLifqmaXThmW6/xc249iAkLbL
 LNUUwV1bv8t35pnjgAMGyDRcWjmgVfy5rqXC6TrIpK7YaodktioDWlDyWZM+OPml4kPo
 CJxw==
X-Gm-Message-State: AOAM532tU1gE55liICQymgxswaoLbzsZ6lDqCe2u1PdODjwVKyTtbQHa
 GDK/NeWUQyOcgaKW5xyaJpE3BWCediMJs3CVKoM=
X-Google-Smtp-Source: ABdhPJyw0KmkpT0wW3UGWOxj20T8QI719PAjvFEtTo4fBjXY/b+McPswSyw7q1t1bQm3ES8jp++ekpGyo8FkQ/2mlOY=
X-Received: by 2002:a02:1a06:: with SMTP id 6mr55797272jai.8.1594055261111;
 Mon, 06 Jul 2020 10:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-12-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-12-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:57:54 -0700
Message-ID: <CAKmqyKMYzHasyz0-Fx5tbpzr2_369n7wxkmtSVubCOxPH1BrDQ@mail.gmail.com>
Subject: Re: [PATCH 11/26] hw/usb/hcd-xhci: Add missing header
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

On Sat, Jul 4, 2020 at 7:54 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> This header uses the USBPort type which is forward declared
> by "hw/usb.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/usb/hcd-xhci.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
> index 946af51fc2..8edbdc2c3e 100644
> --- a/hw/usb/hcd-xhci.h
> +++ b/hw/usb/hcd-xhci.h
> @@ -22,6 +22,8 @@
>  #ifndef HW_USB_HCD_XHCI_H
>  #define HW_USB_HCD_XHCI_H
>
> +#include "hw/usb.h"
> +
>  #define TYPE_XHCI "base-xhci"
>  #define TYPE_NEC_XHCI "nec-usb-xhci"
>  #define TYPE_QEMU_XHCI "qemu-xhci"
> --
> 2.21.3
>
>

