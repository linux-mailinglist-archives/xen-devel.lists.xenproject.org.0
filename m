Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39390215C6B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 18:59:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsUSM-0004iX-Ui; Mon, 06 Jul 2020 16:59:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiqY=AR=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jsUSL-0004iN-68
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 16:59:01 +0000
X-Inumbo-ID: fd320ade-bfa9-11ea-bb8b-bc764e2007e4
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd320ade-bfa9-11ea-bb8b-bc764e2007e4;
 Mon, 06 Jul 2020 16:59:00 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id q8so40103182iow.7
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 09:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FXnnv73L5WipvrjnAQ/ZRDtg+5iLp60OiInY9J0Zsfs=;
 b=fK2rUb2MdciYU4Z+vy8DaVGveUMlo9HFcBrc2ZvwhMG/OTSUYi16woJ2geJIOeCHf+
 s/tu4UZiATsSlkJBZD2mo3pornyf9G2RKM8kkgfjb7neQY+BTo9GGZ9L3v3UwKSUzApe
 89qSSXu30fk4x/9gPjbYtny2dhJQctl8b9Lrmn4gsXAE9hmlLHVRcYlZiDw+zMWXKhiT
 WJsFHIKj5Bhm1NoNyZFlGdsqEUXmX9z2x7FAgTnWrhAmBppFMg16jLsf48EcsdQ3N9Ln
 BfooAlKZ7UjPxtmAAZt8fESX0cQByDrugScyx/bxh9+zbshTBMAtPKfqON37hfLVY3Rb
 eq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FXnnv73L5WipvrjnAQ/ZRDtg+5iLp60OiInY9J0Zsfs=;
 b=Q3zXkE2wDlN7Rpfk0siEFSywCIvwzCSCU6fu4xHWsMA1JzfCN+t0PEC0SvI+I0dx/e
 QmSH5UR4qIdr12wpuiHUlsSLGjZPJrvOI+cfJaLYoD8KS7p5vANtAhy0wsP8x7I6nEdR
 7+bNrVgpOHEmDp1EvXdmZsom0IgWTirKkXgsDhdcH1wA644b4tgFgnQ6oBjxm+gQXh0N
 AwJmi6psy2xh8/KitTSA6jbzM2j0ar2EV1wnlcfRGt6smKIulkS4R9253qiIPnYl5tN5
 2Y5ZeGuWXhWFq4M0Of0DRAHtMazGBHFY2Jz+1XQRboS5dsiUTJkCgUFXZ3OxPu1TqpzF
 58qg==
X-Gm-Message-State: AOAM530CncLvtDHILju0S6QJg7c34wv8LNIfOHynmf+BDjBY7gKS4s1C
 H463YjyExbwVgIA37rYhyVAJIzh1ZvyOBaOXpH3weaLrAwU=
X-Google-Smtp-Source: ABdhPJxhPOyzA8S179T/GnN+DxKn3yFpd4iuIOBEQ6BWF7TH4kkJEHUUUSyuyppt2TvByxifRjL0bvuZRvWhnh0C+Tc=
X-Received: by 2002:a02:10c1:: with SMTP id 184mr52996773jay.135.1594054740444; 
 Mon, 06 Jul 2020 09:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-2-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-2-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:49:12 -0700
Message-ID: <CAKmqyKNd3qyB33TCamM_zXPFahfvdpmCirouODOy_QFotz55EQ@mail.gmail.com>
Subject: Re: [PATCH 01/26] hw/arm/sbsa-ref: Remove unused 'hw/usb.h' header
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

On Sat, Jul 4, 2020 at 7:51 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> This file doesn't access anything from "hw/usb.h", remove its
> inclusion.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/sbsa-ref.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index e40c868a82..021e7c1b8b 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -38,7 +38,6 @@
>  #include "hw/loader.h"
>  #include "hw/pci-host/gpex.h"
>  #include "hw/qdev-properties.h"
> -#include "hw/usb.h"
>  #include "hw/char/pl011.h"
>  #include "net/net.h"
>
> --
> 2.21.3
>
>

