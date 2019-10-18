Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9AEDC66F
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 15:47:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLSXd-0004UJ-8z; Fri, 18 Oct 2019 13:43:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BpLK=YL=gmail.com=aleksandar.m.mail@srs-us1.protection.inumbo.net>)
 id 1iLSXc-0004UE-8b
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 13:43:40 +0000
X-Inumbo-ID: 4a7eac0a-f1ad-11e9-bbab-bc764e2007e4
Received: from mail-oi1-x243.google.com (unknown [2607:f8b0:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a7eac0a-f1ad-11e9-bbab-bc764e2007e4;
 Fri, 18 Oct 2019 13:43:39 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id x3so5257844oig.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2019 06:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=VAS5PPVpHNOR2j3o3lGk9FzH0tOSDaoBdoqQ4YeAgYU=;
 b=fxRwhoG5R66Yib0ZEZ2RGDVO33nkcQlmFHgfrFY0TK9mnhm5mkVZT3abJOyzWHfW+F
 Tfgiqxg7PNzD+QwPyvlXDl6fD1CmmlQVAyHWL/TpJttNTyZ1/pfiw1QYUodXfKjbLXWN
 /98oklN8Jbxvt78WIcOzfII1zS6wxA9gfBlFF3+CuVm90qbLnA0i/SugsbOHgT2dqFZF
 wGHH4ISQHNuWCY4io8JTty3SoRVadVs6SJR1qc+toDSNNrwuDK+sY/MJKNZzI3u9sEDn
 R0tsslCTbnjjVNDR8Wzn7SDE9B0Xqvg/vswaQYMES0810/EUVoOzLsb1tn1O1cmJmzNB
 xfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=VAS5PPVpHNOR2j3o3lGk9FzH0tOSDaoBdoqQ4YeAgYU=;
 b=dwhDDeNT3StPG+PmqTKBZcevDjKyAoICixelU/jaPQbjy553Ta7rf5r5MFZmfqa6+U
 QNy7l2gJTFza37xeYyopWuuuN6XOWMihFZSu3Q207IfLyIrQoya9Ez7I/tB/Gha7Cd+u
 tItEu4qbvuCPe38bZmq2j2KDQvsjsPB0jhgOmRe1qebthGadvfb+RpryK22DQB+rEu6j
 jPqyyHN5E0zPL4bkMLa4f73QbCuo4wjckzQsJLWIhCJmaA0EFgQRKV9AjT738BeIaZns
 2V2z3CW/dRIQ7JBFFAy3mKCJ1XuL++AfhDdU/iwx3y8JNaCq7g0WWrkdxe8Riwe2ZLxJ
 oY5g==
X-Gm-Message-State: APjAAAVoqrndhVMWnpkJAVnkN3L3sVibVgD1i7OZ9SGL71v6UBKGYKP/
 EeuR0QWO9TkReQbjHTidcWQeBSxaPEaGp69DcVc=
X-Google-Smtp-Source: APXvYqyk+CpGc7TqDFWpnsfdFH6WO3TzzFNJT0QaR7Kxgjn232lB1jjamTCDi6eh3i4M2emFc6qyhukc3goKeLfjNRk=
X-Received: by 2002:a54:460c:: with SMTP id p12mr8189880oip.62.1571406219029; 
 Fri, 18 Oct 2019 06:43:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP; Fri, 18 Oct 2019 06:43:38
 -0700 (PDT)
In-Reply-To: <20191015162705.28087-5-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
 <20191015162705.28087-5-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 18 Oct 2019 15:43:38 +0200
Message-ID: <CAL1e-=h7zniYLFb-nUogMsvFeLwpLPSHf0KGZ7_p9pLNCUCGDA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH 04/32] mc146818rtc: Move RTC_ISA_IRQ
 definition
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/mixed; boundary="===============6744042680535535587=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6744042680535535587==
Content-Type: multipart/alternative; boundary="0000000000007bb18a05952f85ed"

--0000000000007bb18a05952f85ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The ISA default number for the RTC devices is not related to its
> registers neither. Move this definition to "hw/timer/mc146818rtc.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/hw/timer/mc146818rtc.h      | 2 ++
>  include/hw/timer/mc146818rtc_regs.h | 2 --
>  tests/rtc-test.c                    | 1 +
>  3 files changed, 3 insertions(+), 2 deletions(-)
>
>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>




> diff --git a/include/hw/timer/mc146818rtc.h b/include/hw/timer/
> mc146818rtc.h
> index 0f1c886e5b..17761cf6d9 100644
> --- a/include/hw/timer/mc146818rtc.h
> +++ b/include/hw/timer/mc146818rtc.h
> @@ -39,6 +39,8 @@ typedef struct RTCState {
>      QLIST_ENTRY(RTCState) link;
>  } RTCState;
>
> +#define RTC_ISA_IRQ 8
> +
>  ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,
>                               qemu_irq intercept_irq);
>  void rtc_set_memory(ISADevice *dev, int addr, int val);
> diff --git a/include/hw/timer/mc146818rtc_regs.h b/include/hw/timer/
> mc146818rtc_regs.h
> index bfbb57e570..631f71cfd9 100644
> --- a/include/hw/timer/mc146818rtc_regs.h
> +++ b/include/hw/timer/mc146818rtc_regs.h
> @@ -27,8 +27,6 @@
>
>  #include "qemu/timer.h"
>
> -#define RTC_ISA_IRQ 8
> -
>  #define RTC_SECONDS             0
>  #define RTC_SECONDS_ALARM       1
>  #define RTC_MINUTES             2
> diff --git a/tests/rtc-test.c b/tests/rtc-test.c
> index 6309b0ef6c..18f895690f 100644
> --- a/tests/rtc-test.c
> +++ b/tests/rtc-test.c
> @@ -15,6 +15,7 @@
>
>  #include "libqtest-single.h"
>  #include "qemu/timer.h"
> +#include "hw/timer/mc146818rtc.h"
>  #include "hw/timer/mc146818rtc_regs.h"
>
>  #define UIP_HOLD_LENGTH           (8 * NANOSECONDS_PER_SECOND / 32768)
> --
> 2.21.0
>
>
>

--0000000000007bb18a05952f85ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, October 15, 2019, Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">From: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"ma=
ilto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;<br>
<br>
The ISA default number for the RTC devices is not related to its<br>
registers neither. Move this definition to &quot;hw/timer/mc146818rtc.h&quo=
t;.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/hw/timer/mc146818rtc.h=C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A0include/hw/timer/mc146818rtc_<wbr>regs.h | 2 --<br>
=C2=A0tests/rtc-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A03 files changed, 3 insertions(+), 2 deletions(-)<br>
<br></blockquote><div><br></div><div><div id=3D"cvcmsg_16dda40027d5c491" cl=
ass=3D"yh  " style=3D"border-top-left-radius:0px;border-top-right-radius:0p=
x;color:rgb(34,34,34);font-size:14px;margin-bottom:11px;overflow:visible"><=
div class=3D"Vh" id=3D"cvcfullmsg_16dda40027d5c491"><div id=3D"cvcmsgbod_16=
dda40027d5c491" class=3D"aj"><div class=3D"Ni"><div class=3D"ni pi " dir=3D=
"ltr"><div><div style=3D"border-top-left-radius:0px;border-top-right-radius=
:0px;margin-bottom:11px;overflow:visible"><div dir=3D"ltr"><p dir=3D"ltr">R=
eviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.co=
m" target=3D"_blank">amarkovic@wavecomp.com</a>&gt;</p><p dir=3D"ltr"><br><=
/p></div></div></div></div></div></div></div></div></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
diff --git a/include/hw/timer/<wbr>mc146818rtc.h b/include/hw/timer/<wbr>mc=
146818rtc.h<br>
index 0f1c886e5b..17761cf6d9 100644<br>
--- a/include/hw/timer/<wbr>mc146818rtc.h<br>
+++ b/include/hw/timer/<wbr>mc146818rtc.h<br>
@@ -39,6 +39,8 @@ typedef struct RTCState {<br>
=C2=A0 =C2=A0 =C2=A0QLIST_ENTRY(RTCState) link;<br>
=C2=A0} RTCState;<br>
<br>
+#define RTC_ISA_IRQ 8<br>
+<br>
=C2=A0ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq intercept_irq);<br>
=C2=A0void rtc_set_memory(ISADevice *dev, int addr, int val);<br>
diff --git a/include/hw/timer/<wbr>mc146818rtc_regs.h b/include/hw/timer/<w=
br>mc146818rtc_regs.h<br>
index bfbb57e570..631f71cfd9 100644<br>
--- a/include/hw/timer/<wbr>mc146818rtc_regs.h<br>
+++ b/include/hw/timer/<wbr>mc146818rtc_regs.h<br>
@@ -27,8 +27,6 @@<br>
<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
<br>
-#define RTC_ISA_IRQ 8<br>
-<br>
=C2=A0#define RTC_SECONDS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<=
br>
=C2=A0#define RTC_SECONDS_ALARM=C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
=C2=A0#define RTC_MINUTES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02<=
br>
diff --git a/tests/rtc-test.c b/tests/rtc-test.c<br>
index 6309b0ef6c..18f895690f 100644<br>
--- a/tests/rtc-test.c<br>
+++ b/tests/rtc-test.c<br>
@@ -15,6 +15,7 @@<br>
<br>
=C2=A0#include &quot;libqtest-single.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
+#include &quot;hw/timer/mc146818rtc.h&quot;<br>
=C2=A0#include &quot;hw/timer/mc146818rtc_regs.h&quot;<br>
<br>
=C2=A0#define UIP_HOLD_LENGTH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(8 * =
NANOSECONDS_PER_SECOND / 32768)<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote>

--0000000000007bb18a05952f85ed--


--===============6744042680535535587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6744042680535535587==--

