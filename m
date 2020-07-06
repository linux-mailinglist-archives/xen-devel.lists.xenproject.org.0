Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B94215C92
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 19:04:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsUXs-0005tG-N1; Mon, 06 Jul 2020 17:04:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiqY=AR=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jsUXr-0005t7-Cv
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 17:04:43 +0000
X-Inumbo-ID: c9232696-bfaa-11ea-bca7-bc764e2007e4
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9232696-bfaa-11ea-bca7-bc764e2007e4;
 Mon, 06 Jul 2020 17:04:42 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id q74so16547579iod.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 10:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cTCiYJ1utsgT/OEA1JPToQ9e7sbkDVzau0vl+orbX5M=;
 b=Y5emWhnvg2wA6Hsc2mNKM91+PUECbIjNCVx4XijBRlwxhG9yPaVY4nCPuN66Pn/g4N
 jALw2uCbPtXPOhmyJkKBc45MnuJg6mxtGi3kWihcL0PytiWW/5DejqGp9pu1JW3N0B0L
 YJbqT9Ic/jycTAYWFiu+Rsh/qMuTBhTldv4DWUXGneSj8xYSSWACCuJie0v5fihIfGzM
 +FHYD1FVz9yVKlUzWPPpjP3O3le2SpOqqOzlb4GBTfB83H90A+bGP6q+3xoLfe4Nv+cq
 E6XH5NYuSvgxKJUs0XSM4FaA8Wd5kSisFNa8A9sD0zbO1Mx64e82B7/5rFnqrKTujNAu
 cLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cTCiYJ1utsgT/OEA1JPToQ9e7sbkDVzau0vl+orbX5M=;
 b=oF0OiIuKeETAFVLQyN4/YVE30HevZ4KjHOrDS1hBcipJgQrK/wzGXDfrT8wlL9FO4A
 vwBzQHCFd9dV6T8EgZmFFOA93j/Iiuotps8vYBLKhaWFPU6SLobXHTDWf6xYRPw+F6kq
 zY7OI2D7iMPOqvMf3qlY2Kc1oNJWXzyRbTgmmb2niy1DggAQQNIjfEsOpJ42ab+Mejpn
 k4fpQNAAyu3ksaQQD5GMt7F/0vY8Atd0JlbT41IDtba3rNJgyNeDrmCEs5XytgSb0gY/
 s3h8FzPQD+jWl0GbweqzIVXME7wDOKkT2ICrpIqf0e34+8dvNjanHFpXgkc6T4nB4vSo
 jMEQ==
X-Gm-Message-State: AOAM5304j3wtZ61yeI1DxCDuMT1F9L4MF8HedIlfKn5RK+ul65K6F6GL
 rf7elMpfDTfFprZTnS7dQaNxDi2ELW4YSYnqmXM=
X-Google-Smtp-Source: ABdhPJwtinW+rIbee8onSzHAr9mGYnsnNGs22+9NC+YbC3w6hod1nvPLY3hYBjgn60PpMlBLwo7zj8UoDSitGwru4As=
X-Received: by 2002:a5d:97d9:: with SMTP id k25mr26494073ios.42.1594055082487; 
 Mon, 06 Jul 2020 10:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-8-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-8-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:54:53 -0700
Message-ID: <CAKmqyKMk272oxLgGJHQMmZk_7+Q7N=5uPxSUdEMq2-N8DbHrLg@mail.gmail.com>
Subject: Re: [PATCH 07/26] hw/usb/hcd-dwc2: Restrict some headers to source
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

On Sat, Jul 4, 2020 at 7:52 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> The header "usb/hcd-dwc2.h" doesn't need to include "qemu/timer.h",
> "sysemu/dma.h", "hw/irq.h" (the types required are forward declared).
> Include them in the source file which is the only one requiring the
> function declarations.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/usb/hcd-dwc2.h | 3 ---
>  hw/usb/hcd-dwc2.c | 3 +++
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/usb/hcd-dwc2.h b/hw/usb/hcd-dwc2.h
> index 4ba809a07b..2adf0f53c7 100644
> --- a/hw/usb/hcd-dwc2.h
> +++ b/hw/usb/hcd-dwc2.h
> @@ -19,11 +19,8 @@
>  #ifndef HW_USB_DWC2_H
>  #define HW_USB_DWC2_H
>
> -#include "qemu/timer.h"
> -#include "hw/irq.h"
>  #include "hw/sysbus.h"
>  #include "hw/usb.h"
> -#include "sysemu/dma.h"
>
>  #define DWC2_MMIO_SIZE      0x11000
>
> diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
> index 590e75b455..ccf05d0823 100644
> --- a/hw/usb/hcd-dwc2.c
> +++ b/hw/usb/hcd-dwc2.c
> @@ -36,8 +36,11 @@
>  #include "qapi/error.h"
>  #include "hw/usb/dwc2-regs.h"
>  #include "hw/usb/hcd-dwc2.h"
> +#include "hw/irq.h"
> +#include "sysemu/dma.h"
>  #include "migration/vmstate.h"
>  #include "trace.h"
> +#include "qemu/timer.h"
>  #include "qemu/log.h"
>  #include "hw/qdev-properties.h"
>
> --
> 2.21.3
>
>

