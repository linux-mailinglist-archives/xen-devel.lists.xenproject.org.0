Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29062216247
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 01:29:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsaXq-0004A7-3U; Mon, 06 Jul 2020 23:29:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8e5v=AR=gmail.com=pauldzim@srs-us1.protection.inumbo.net>)
 id 1jsaXo-0004A2-Lj
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 23:29:04 +0000
X-Inumbo-ID: 7aa5a5d0-bfe0-11ea-bca7-bc764e2007e4
Received: from mail-il1-x142.google.com (unknown [2607:f8b0:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7aa5a5d0-bfe0-11ea-bca7-bc764e2007e4;
 Mon, 06 Jul 2020 23:29:04 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id x9so34464267ila.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 16:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EqpTLnds0cQjQhPTtDXOEbWvKqfHq/uTNO2RA9Yz7QI=;
 b=UgeotncesG4zQVHNWYePkXPakT+0WIklkaH3zTOngjzTCBnpbdZIBJTHbfi0UmEFS+
 Vcm5+RldKaAmXqg95SgC2MIyumI1qeN9VPKNXGncr1QeMzipgKo4DSt+g3fZ8VHzMSef
 /64emOo0HYBwwnK3UZvcG7ZP73fb9yjItIWt4jFbJG9YOYm8UaCknaRZcVr2FyAL2pFr
 0UeJvx1+inWoRFPAziZTAvU3SCT7J1FIW5pB2PApAWcHLv6eK5KGkNJwOnXx0rqFxs+h
 JqwOFDCq92Wzf+D0PGoqUxr9dFtcFKHAbMbdUPdddOWgcCZRQ8wbcef5+FD8tg64+JhH
 BNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EqpTLnds0cQjQhPTtDXOEbWvKqfHq/uTNO2RA9Yz7QI=;
 b=ZR+DJlmcoxD+f77JpbouzXdW562bYEQ4QKhy7v406I8MU8yGn83F8WKLTXxZTivUdO
 NVtlVf96zfo33CaS/We51QhJN4JH7pIzKhR139vjYUmWNh1r/TaAS/TGanA80uJ34PkC
 G2wa0z10XxeMjRBTZ26oTnbs99ekxAcGKLOS5oADdex1E470KMS3Wnhi4DL1LewuyZpO
 fItWk1khbDW2hwdHejKKD46KzOX9xXBCu7Wo0RiG4ui7sHkvlLD3QzUfJ1VlhZYIBcYG
 4DRYH9zgTvo3KCIQir3LjSIreZx/mWCH+yWZGGPPSdxZW4wdTLYQURebYi0HV9jNS6Ia
 Twuw==
X-Gm-Message-State: AOAM53296UN3581ACndV6EsM8p1QfHP8DWVeNSkYCyigy2Z4NgIFXOpe
 RL+BMuSzlkHGlCwn4FqrXQM2O9BSFfTOcau99z0=
X-Google-Smtp-Source: ABdhPJw3JUW4GbL95AweZL605ZuGn+6rCK3ngUlA6e50fJsVbbkH5ckFabJvO/a6lXcUvM+d3wfLRaCN/a9ELGQNiVI=
X-Received: by 2002:a92:58d1:: with SMTP id z78mr32232484ilf.276.1594078143637; 
 Mon, 06 Jul 2020 16:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-7-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-7-f4bug@amsat.org>
From: Paul Zimmerman <pauldzim@gmail.com>
Date: Mon, 6 Jul 2020 16:28:37 -0700
Message-ID: <CADBGO78wa9Rth0=cszD6ZNo_y5ZtLQRyjvZLr-D45tuoEe_A8g@mail.gmail.com>
Subject: Re: [PATCH 06/26] hw/usb/hcd-dwc2: Remove unnecessary includes
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000007eeff905a9ce3d8d"
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

--0000000000007eeff905a9ce3d8d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 4, 2020 at 7:50 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> "qemu/error-report.h" and "qemu/main-loop.h" are not used.
> Remove them.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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
Reviewed-by: Paul Zimmerman <pauldzim@gmail.com>

--0000000000007eeff905a9ce3d8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace"><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, Jul 4, 2020 at 7:50 AM Philippe Mathi=
eu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&quot;q=
emu/error-report.h&quot; and &quot;qemu/main-loop.h&quot; are not used.<br>
Remove them.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0hw/usb/hcd-dwc2.c | 2 --<br>
=C2=A01 file changed, 2 deletions(-)<br>
<br>
diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c<br>
index 72cbd051f3..590e75b455 100644<br>
--- a/hw/usb/hcd-dwc2.c<br>
+++ b/hw/usb/hcd-dwc2.c<br>
@@ -39,8 +39,6 @@<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
-#include &quot;qemu/error-report.h&quot;<br>
-#include &quot;qemu/main-loop.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
<br>
=C2=A0#define USB_HZ_FS=C2=A0 =C2=A0 =C2=A0 =C2=A012000000<br>
-- <br>
2.21.3<br>
<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-=
family:monospace"><span style=3D"font-family:Arial,Helvetica,sans-serif">Re=
viewed-by:</span><span style=3D"font-family:Arial,Helvetica,sans-serif">=C2=
=A0Paul Zimmerman &lt;<a href=3D"mailto:pauldzim@gmail.com">pauldzim@gmail.=
com</a>&gt;</span><span style=3D"font-family:Arial,Helvetica,sans-serif"></=
span></div><div class=3D"gmail_default" style=3D"font-family:monospace"></d=
iv></div></div>

--0000000000007eeff905a9ce3d8d--

