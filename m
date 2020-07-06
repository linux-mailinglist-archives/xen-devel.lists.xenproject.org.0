Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DF8216244
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 01:28:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsaWy-00047A-Pf; Mon, 06 Jul 2020 23:28:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8e5v=AR=gmail.com=pauldzim@srs-us1.protection.inumbo.net>)
 id 1jsaWw-000475-I2
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 23:28:10 +0000
X-Inumbo-ID: 5a0e5bbe-bfe0-11ea-bb8b-bc764e2007e4
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a0e5bbe-bfe0-11ea-bb8b-bc764e2007e4;
 Mon, 06 Jul 2020 23:28:09 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id y2so41226742ioy.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 16:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o2au+JJF3iFRx8/wMwMY9hqc8NDSgxZJ6W8bmJa6B3w=;
 b=UV175Ip46nlRSvIuHO9aabEhDAhS8PyIj2iRmpR6xqQ+kARmhfpHBtcbb4upNUIVED
 w5COe3pxivzOL5jcL2J6NewBUCoVXUl+Yk7+OvfUBSS+NnrArY64Q0rk8TgKL+7nngM/
 93LBL/adIxwmHtjZwApU05ehx7cWUU90hu9tzxmD1gF9QVNRPi7ljqae5aSh1pybr1qu
 HS9EBrcs8sD4WJ2XiM68eZqI8djubBpP1SsWGRTaNd///6tg//TxTkt6Hhexrze39Dcu
 qHO+nTI/RS9987CX3EVmGPh1Ealpci/8M576p/Lx0DKzavHAfVxg9CsNV43GFb/la/sX
 QYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o2au+JJF3iFRx8/wMwMY9hqc8NDSgxZJ6W8bmJa6B3w=;
 b=IBuuBv0wUpehKhFeDSYd967rWumMOit2kZRMdA2UlslcgttkEeJDSIYPHVpI9UiPKL
 2rKJVsn8844HQwCHqw3LXC+BMYEnyjbcaAGF1nkx7sEqwL6K0PMG0NXf7GtC+fm/pJ6n
 GF9NFGGFsk9CkTL3NxjKugOTR0pND+NbieJwMqpqLCHBIEJn/a69m95GFMxIIiPxeKJ4
 m9chhcK/VNUmbqj7N4Vrsgf139nY5COVAbeVOMyJOWZrZAdozg0UhA6fUKiGZxknHYG4
 77YWkYm6FFUxpq7dmR7EcbDdtKWK37mvunkZzGyUKtFJHMv5Gr7jgVJQW/QfHyoreTfQ
 yu9Q==
X-Gm-Message-State: AOAM530SgFnyLmXcE48zIv/Ct5SVf96Cl8QC7kD6ycoeEBQUT77RRTTA
 SxfHp8y+8pN8KnbO5g2v77Rg7KGhhI9a0i0hEIo=
X-Google-Smtp-Source: ABdhPJxiX7qsyPhPsM9b6aXZ6jrmsQJOHwK5JNaERwfHbIHo+HluncpsULlPeV6Fxuk7XqAu85zdwY+jX06UBRQ27X8=
X-Received: by 2002:a02:ac8e:: with SMTP id x14mr55270700jan.57.1594078088926; 
 Mon, 06 Jul 2020 16:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-8-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-8-f4bug@amsat.org>
From: Paul Zimmerman <pauldzim@gmail.com>
Date: Mon, 6 Jul 2020 16:27:42 -0700
Message-ID: <CADBGO79yDBVagNRfvKLG7LwVUX_4DK7v6DA5p1CEHboP3wOH7Q@mail.gmail.com>
Subject: Re: [PATCH 07/26] hw/usb/hcd-dwc2: Restrict some headers to source
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000003c1f1505a9ce3ab0"
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
 QEMU Developers <qemu-devel@nongnu.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Leif Lindholm <leif@nuviainc.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--0000000000003c1f1505a9ce3ab0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 4, 2020 at 7:50 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> The header "usb/hcd-dwc2.h" doesn't need to include "qemu/timer.h",
> "sysemu/dma.h", "hw/irq.h" (the types required are forward declared).
> Include them in the source file which is the only one requiring the
> function declarations.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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
Reviewed-by: Paul Zimmerman <pauldzim@gmail.com>

--0000000000003c1f1505a9ce3ab0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace"><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, Jul 4, 2020 at 7:50 AM Philippe Mathi=
eu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The hea=
der &quot;usb/hcd-dwc2.h&quot; doesn&#39;t need to include &quot;qemu/timer=
.h&quot;,<br>
&quot;sysemu/dma.h&quot;, &quot;hw/irq.h&quot; (the types required are forw=
ard declared).<br>
Include them in the source file which is the only one requiring the<br>
function declarations.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0hw/usb/hcd-dwc2.h | 3 ---<br>
=C2=A0hw/usb/hcd-dwc2.c | 3 +++<br>
=C2=A02 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/hw/usb/hcd-dwc2.h b/hw/usb/hcd-dwc2.h<br>
index 4ba809a07b..2adf0f53c7 100644<br>
--- a/hw/usb/hcd-dwc2.h<br>
+++ b/hw/usb/hcd-dwc2.h<br>
@@ -19,11 +19,8 @@<br>
=C2=A0#ifndef HW_USB_DWC2_H<br>
=C2=A0#define HW_USB_DWC2_H<br>
<br>
-#include &quot;qemu/timer.h&quot;<br>
-#include &quot;hw/irq.h&quot;<br>
=C2=A0#include &quot;hw/sysbus.h&quot;<br>
=C2=A0#include &quot;hw/usb.h&quot;<br>
-#include &quot;sysemu/dma.h&quot;<br>
<br>
=C2=A0#define DWC2_MMIO_SIZE=C2=A0 =C2=A0 =C2=A0 0x11000<br>
<br>
diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c<br>
index 590e75b455..ccf05d0823 100644<br>
--- a/hw/usb/hcd-dwc2.c<br>
+++ b/hw/usb/hcd-dwc2.c<br>
@@ -36,8 +36,11 @@<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;hw/usb/dwc2-regs.h&quot;<br>
=C2=A0#include &quot;hw/usb/hcd-dwc2.h&quot;<br>
+#include &quot;hw/irq.h&quot;<br>
+#include &quot;sysemu/dma.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
+#include &quot;qemu/timer.h&quot;<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
<br>
-- <br>
2.21.3<br>
<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-=
family:monospace"><span style=3D"font-family:Arial,Helvetica,sans-serif">Re=
viewed-by:</span><span style=3D"font-family:Arial,Helvetica,sans-serif">=C2=
=A0Paul Zimmerman &lt;<a href=3D"mailto:pauldzim@gmail.com">pauldzim@gmail.=
com</a>&gt;</span></div></div></div>

--0000000000003c1f1505a9ce3ab0--

