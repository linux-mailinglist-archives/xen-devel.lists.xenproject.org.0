Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72257215C8F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 19:04:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsUX6-0005pq-D6; Mon, 06 Jul 2020 17:03:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiqY=AR=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jsUX5-0005pl-12
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 17:03:55 +0000
X-Inumbo-ID: ac3ded40-bfaa-11ea-bb8b-bc764e2007e4
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac3ded40-bfaa-11ea-bb8b-bc764e2007e4;
 Mon, 06 Jul 2020 17:03:54 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id e64so35193338iof.12
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 10:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X20uXtdA36wJdFmnL5kXE6ANkGPKNtErzQUg9fO43F0=;
 b=WKa0Lnp/4ENw4KYTm55Jp0CBKAAjECKb63/NLtirFrXqJWtjy9YARPnCGw4sN1rNjC
 xj+uAS77lFX7Pw53RhXebWVJDzr039uCYSZgLleFMvlnZrE5XzIgVJuamrvJYBrcM/gQ
 OgQk5oxwJFsQp3xnl3IN5pjJdSv5RpRJknYyuIngvcAGV+aEd3GH78GbDWbSR4txus0n
 OjkePAGPpMQG0Jj3txMJqRtyrJ1n41/fNix/mk8Dgmq6xf+CrzKD4xaDg7J5pIzH5G8L
 K1zDdXydsLx9rQ7CiCTvJ1PTLelBs97/0EipVuw22nVvFXmvZtr9fBmOY3leWsb+Ctmx
 sPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X20uXtdA36wJdFmnL5kXE6ANkGPKNtErzQUg9fO43F0=;
 b=kpURspZ9NqKyfdOlAgl8w8JwC11hQtOHftLvj904LHFgqOExEoXbxJFWtgn5Qybnqz
 DFNtd6wdJun0D3p3+eHpHBFKVeEeoPOUlKCfbEWBmm+zXokMJugC0oocFqBAVeDRgLDY
 Qw+O3yhM34gYKF7Fuz7Bh1LWY6+nQqePPmuh4mYEgWy0XDKndUqdLAU2TuxQT5aGuXAb
 cPbg1MbuqVpL+9cuyKFTqd48c5FpCc3MHRB2Cuil7K5ipKX8vIbg7TOQt/umzAlSE42c
 nQLBJS2qq1c1tHCUxEd3SzTHkiNaXqEHwiN2xzEw/YAZ407fkdigNYLG52FfSkCf1Npv
 lJrQ==
X-Gm-Message-State: AOAM53208Y1QsoyWiJwKZSwOuvs4+qeLjjMZbpZjQQmcQtOQTC2N8wT5
 i3pCY7qj7DGmuIQ8vy5SMMI/N5zi7YtnybIytb4=
X-Google-Smtp-Source: ABdhPJzF5odL5exow9BLUiHvk44VSggfGQ4JIj5C1Wu24QgZVWClevs13HGgZ8PX2ApFiDe8dG6ucK7PuLDbtFgP3a8=
X-Received: by 2002:a5d:9ed0:: with SMTP id a16mr26245576ioe.176.1594055034056; 
 Mon, 06 Jul 2020 10:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-7-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-7-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:54:07 -0700
Message-ID: <CAKmqyKOexZ602pCtmO03FW5x=NzawWSzfHq3puQOgpLbdXnUbg@mail.gmail.com>
Subject: Re: [PATCH 06/26] hw/usb/hcd-dwc2: Remove unnecessary includes
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
> "qemu/error-report.h" and "qemu/main-loop.h" are not used.
> Remove them.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/usb/hcd-dwc2.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
> index 72cbd051f3..590e75b455 100644
> --- a/hw/usb/hcd-dwc2.c
> +++ b/hw/usb/hcd-dwc2.c
> @@ -39,8 +39,6 @@
>  #include "migration/vmstate.h"
>  #include "trace.h"
>  #include "qemu/log.h"
> -#include "qemu/error-report.h"
> -#include "qemu/main-loop.h"
>  #include "hw/qdev-properties.h"
>
>  #define USB_HZ_FS       12000000
> --
> 2.21.3
>
>

