Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2785C216249
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 01:30:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsaYc-0004FN-Cs; Mon, 06 Jul 2020 23:29:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8e5v=AR=gmail.com=pauldzim@srs-us1.protection.inumbo.net>)
 id 1jsaYa-0004FG-Pa
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 23:29:52 +0000
X-Inumbo-ID: 9755f432-bfe0-11ea-8496-bc764e2007e4
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9755f432-bfe0-11ea-8496-bc764e2007e4;
 Mon, 06 Jul 2020 23:29:52 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id e64so36301257iof.12
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 16:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=guo4Cz0saHkzfASqoW+5Vfcn07JMdPw0vLJcHYngdVg=;
 b=Mgg1+R1wgP3yxWPoxwWzVSxY2DBC9uea+PFILvRzMeodl7CDSW6RFuIaULNGjbl5Wm
 e+hCc1T3Xll8LfByGqK3TY3w+7eAb71d7Ae0R0447AX36sCNNoaUbvfaW3MjOyeRnMve
 s+nQuLbys2Cq6ZKBNVYoyxUZYEAcwfG4E1nUQkp22Dcn+sEZ6SgV+248afpNz2u0S6YB
 DeqGJkSGAO5axe7LmsN1L9ov27T4ZifdZ/+d5Qwvyv7PifaQb7LkaWs8K+/MJCfwnF2U
 OM/aWXU/Cp7UwxJaN304YU1X6zGqzj9Ed2BvtxVv3622J/wOVdGJLZ5TIYdbStGq2jRR
 0dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=guo4Cz0saHkzfASqoW+5Vfcn07JMdPw0vLJcHYngdVg=;
 b=heynhlQCBo97UrKL70S9EhL092g0zjme+SJyQiiT5LCTlnNCON/NoKV0DwXzJcW9hR
 +i/3t4MBFPLmZ5qPnF7shDBa1eUyPn+6eVakvnQBdFxkkgKh102AUQl8QG/LSwXxAcBD
 kROYFdgTpjr7iiN/VwbmT9HnE/4oj+EI3p4Q5nirtPF6hT9qxloaaZb48WLm9B9xuGwm
 Guhc7Fc4+Ioq5bKVD/kg4qIeQ+uFfQ6AXf8O1bqKjKL3Pf7x+g4ANI3JY3keKQg8/tgt
 teDsz7dHcMNYlgdBEmALZMmGZuvNGk2DnpJPzOOMOlpcKPok4taVLpghzZpGTEhpZeaS
 bitA==
X-Gm-Message-State: AOAM533G7ZhQIp1XYpewnSoUOLf26AdEHqLGaoWpBl3VWhmA0JC4Po+N
 iFWRMQVMLpjrfMQZHb5TBmxUQkkgdVlQO16eFIs=
X-Google-Smtp-Source: ABdhPJxccJUFvrRtMWh3+owZpgS6w9Fdz4b7CnGGaHawyuF5NA7yGHARPV7RXQDl8sKlO2zqMYBeBAVye8DBVl2kztM=
X-Received: by 2002:a5e:dc03:: with SMTP id b3mr26345208iok.97.1594078191753; 
 Mon, 06 Jul 2020 16:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-9-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-9-f4bug@amsat.org>
From: Paul Zimmerman <pauldzim@gmail.com>
Date: Mon, 6 Jul 2020 16:29:25 -0700
Message-ID: <CADBGO7__svJLvtHjyrn_BhqTnWxJWLbv0i0oK4rjmFLiFb82Aw@mail.gmail.com>
Subject: Re: [PATCH 08/26] hw/usb/hcd-dwc2: Restrict 'dwc2-regs.h' scope
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000005d234a05a9ce40b4"
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

--0000000000005d234a05a9ce40b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 4, 2020 at 7:50 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> We only use these register definitions in files under the
> hw/usb/ directory. Keep that header local by moving it there.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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
Reviewed-by: Paul Zimmerman <pauldzim@gmail.com>

--0000000000005d234a05a9ce40b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace"><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, Jul 4, 2020 at 7:50 AM Philippe Mathi=
eu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">We only=
 use these register definitions in files under the<br>
hw/usb/ directory. Keep that header local by moving it there.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0{include/hw =3D&gt; hw}/usb/dwc2-regs.h | 0<br>
=C2=A0hw/usb/hcd-dwc2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 2 +-<br>
=C2=A02 files changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename {include/hw =3D&gt; hw}/usb/dwc2-regs.h (100%)<br>
<br>
diff --git a/include/hw/usb/dwc2-regs.h b/hw/usb/dwc2-regs.h<br>
similarity index 100%<br>
rename from include/hw/usb/dwc2-regs.h<br>
rename to hw/usb/dwc2-regs.h<br>
diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c<br>
index ccf05d0823..252b60ef65 100644<br>
--- a/hw/usb/hcd-dwc2.c<br>
+++ b/hw/usb/hcd-dwc2.c<br>
@@ -34,7 +34,6 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
-#include &quot;hw/usb/dwc2-regs.h&quot;<br>
=C2=A0#include &quot;hw/usb/hcd-dwc2.h&quot;<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
=C2=A0#include &quot;sysemu/dma.h&quot;<br>
@@ -43,6 +42,7 @@<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
+#include &quot;dwc2-regs.h&quot;<br>
<br>
=C2=A0#define USB_HZ_FS=C2=A0 =C2=A0 =C2=A0 =C2=A012000000<br>
=C2=A0#define USB_HZ_HS=C2=A0 =C2=A0 =C2=A0 =C2=A096000000<br>
-- <br>
2.21.3<br>
<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-=
family:monospace"><span style=3D"font-family:Arial,Helvetica,sans-serif">Re=
viewed-by:</span><span style=3D"font-family:Arial,Helvetica,sans-serif">=C2=
=A0Paul Zimmerman &lt;<a href=3D"mailto:pauldzim@gmail.com">pauldzim@gmail.=
com</a>&gt;</span><span style=3D"font-family:Arial,Helvetica,sans-serif"></=
span></div><div class=3D"gmail_default" style=3D"font-family:monospace"></d=
iv></div></div>

--0000000000005d234a05a9ce40b4--

