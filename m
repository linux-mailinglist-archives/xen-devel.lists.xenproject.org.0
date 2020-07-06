Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E435215C94
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 19:05:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsUYK-0005x4-0i; Mon, 06 Jul 2020 17:05:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiqY=AR=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jsUYI-0005wn-F2
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 17:05:10 +0000
X-Inumbo-ID: d93ede12-bfaa-11ea-bca7-bc764e2007e4
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d93ede12-bfaa-11ea-bca7-bc764e2007e4;
 Mon, 06 Jul 2020 17:05:09 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id q8so40125814iow.7
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 10:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zN9P5ColTvlUfdn83p6hlM/q3HmA739CHt0AXxAEsKY=;
 b=eegBASf0DJgvBsiQJhBbGe04hBG8gQlnhR0e1R/ASVwj2VHV9vGLfcRsCN4KCZZL7R
 B83BaGMH/iF7mwFtkqNwrhcYBoLeuRgJhTM45CYuhyfzNTru1stzx/37r5EW7OhPb+Sh
 LRtrqRylWajXgEByi9cOTijxoLbDMEMhICnRVbAOOwJLu9jPbF/Te8Qvau7kveunJewl
 Db0lsTutmvoozzVPB+KFbn17OIYLS5FptsgdKB52Bz3rn1GjOosdN0j2cy5W6T6sYt0p
 QdMaqFdSvbzvnq0BKJyMWcewvVfyBSesh4A14gyVGvYTOfgkCHZ+MscaMJTp0T9VOAKa
 WAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zN9P5ColTvlUfdn83p6hlM/q3HmA739CHt0AXxAEsKY=;
 b=kUaMMEh+E7vanCoBdINzGIESuMmCGm/fpfG8CwskN5ml7zRRp6gJ8fYsuKTY5cVJ29
 M4t2fshGzhQDLFfcRUHVGy9EscQC7AzEUnY983pV7G5+J5+QG59AYXjy/s+Vvtu06wSf
 hbZRwg/rfVLtLOCtIxfm1KCJLzen/spHLO/aLK3xQKN22AzZ+PJfpHx5XBQqaJmCPOTF
 Ir6RxfB1y5BpmYoS3mg8lDLVZ4yPx/E7nHOq+uAXzKLq32/pyy7VeVeFSEQzVz7vbA8i
 zZ8NFUPyBBPRMAY47yfw0g4BF5wlzEA0XNMBEc8S/lisedNUYVIpCJo6rqwJuWXCGB+F
 Hm/Q==
X-Gm-Message-State: AOAM530VLOIG6Av4EBjlEiu7nnm2te+C1fOhkdByIbnTjf9WINeA4tmc
 0v+cEJrXxfRpOaq0BWmsFA4+n2douCC2FtKBWC0=
X-Google-Smtp-Source: ABdhPJw8hZ3hkrezlrBZ0tGzIowHRnJHp8TQNjhIxHPipZ6z7o2IrpAbgPHKaESP7cYXHZCW69GaN6F/KxK5+BYwjZc=
X-Received: by 2002:a5d:9ed0:: with SMTP id a16mr26251024ioe.176.1594055109583; 
 Mon, 06 Jul 2020 10:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-6-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-6-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:55:22 -0700
Message-ID: <CAKmqyKMW3Db-bk1+MOtz461-iAy9Se4uq=2stNmgiELzVAd3NA@mail.gmail.com>
Subject: Re: [PATCH 05/26] hw/usb/desc: Add missing header
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
> This header uses the USBPacket and USBDevice types which are
> forward declared in "hw/usb.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/usb/desc.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/usb/desc.h b/hw/usb/desc.h
> index 4d81c68e0e..92594fbe29 100644
> --- a/hw/usb/desc.h
> +++ b/hw/usb/desc.h
> @@ -2,6 +2,7 @@
>  #define QEMU_HW_USB_DESC_H
>
>  #include <wchar.h>
> +#include "hw/usb.h"
>
>  /* binary representation */
>  typedef struct USBDescriptor {
> --
> 2.21.3
>
>

