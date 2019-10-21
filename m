Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4511EDF137
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 17:22:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMZTI-0004QY-Aj; Mon, 21 Oct 2019 15:19:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3IRp=YO=gmail.com=liq3ea@srs-us1.protection.inumbo.net>)
 id 1iMZTG-0004QP-Ok
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 15:19:46 +0000
X-Inumbo-ID: 36cf22fa-f416-11e9-8aca-bc764e2007e4
Received: from mail-ot1-x343.google.com (unknown [2607:f8b0:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36cf22fa-f416-11e9-8aca-bc764e2007e4;
 Mon, 21 Oct 2019 15:19:45 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id 41so11297296oti.12
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 08:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tz6w0C48MWIa2WMtQyrTIW8Jxx5xZ4x8upKdmxdEPCc=;
 b=DfhIuGJEx+vfA13FAI+Kr0BxOUsjcfZvOgUyPWuZkigj8gPhZEalxZXBA/x+e6emuc
 rOgs59mC5Ge+/sLvorLtiX0L8qAuVzhoPI9V+20I9MfDKmoPMB1HLBRkOrY5Ewvs0lfF
 CsMV7W6SfU5her6r6hJc62PsM12uQJvqpJ8SSlwXVBAZ97W2akETwHqxHl2CULSpna5p
 DWV3IMoG/CNE2QCzY4MlJZ3hoCwCZH5gmcC1BSiCfXKgtJ4JBWZJbJy14mvhXmOQMrJJ
 v9uY0BB0Lg/xP9qd0HqQ6ppAuveWyTIojQW+YORWGQl29zMQyZrjiyCMocSOaA5nMz/T
 0EPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tz6w0C48MWIa2WMtQyrTIW8Jxx5xZ4x8upKdmxdEPCc=;
 b=rRacyMXzhBIVleEGtBjD6dMVJlo2QMgRn0/IEw11L0+76SVRDl6/8+v0cHsQJF5oEx
 Vu+7q6ihCUciLiLy9Ik5PVN3yWlcYVQ+JOtbrclpQx9bkO5xajvRHdxrAgQBbsKd3/AR
 t/dXnxVy0zs/d9/roSuGpBRfaNC25iV9bJfXmIVnBVeP2zQe93hm6a8wHX+PbvPF146D
 p01YvEV91bHjhYYKXdnbSMMBnNunU77ASxhZMzjZu6o0n43S4AxHcdlypmG0t/T0bobX
 JTaCvXhvuJ7PJ9BSUsR86UslVHm5zMQUd/4F2klt6vMu4KIT8HiPjmfftbGCNuNxeXNC
 6YKg==
X-Gm-Message-State: APjAAAUNGQhEcILieYRYOLXFYwfAWUkzgTxFsAwIaGILTZCrnq9IzAJp
 9kH9bUwUtqNFdZB9zK0D2NWM1ARHlylvKpJpOgY=
X-Google-Smtp-Source: APXvYqy5B/+fp2AkMQJfPvSCGas9eFYhRWvfZlNsu8RTN1A3+HXPZLn2tBpGzNIYeEMNTibUlnYoA0vhzkxd2+pIJ3k=
X-Received: by 2002:a9d:3ec:: with SMTP id f99mr17836427otf.353.1571671185421; 
 Mon, 21 Oct 2019 08:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20191018134754.16362-1-philmd@redhat.com>
 <20191018134754.16362-6-philmd@redhat.com>
In-Reply-To: <20191018134754.16362-6-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Mon, 21 Oct 2019 23:19:08 +0800
Message-ID: <CAKXe6SJOgYN-FeDw8O-e7iBta+OztK4OxJJ73ESmnY+wDB6jAw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH v2 05/20] piix4: Rename PIIX4 object to
 piix4-isa
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/mixed; boundary="===============4819263534900481554=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4819263534900481554==
Content-Type: multipart/alternative; boundary="000000000000b61af105956d3602"

--000000000000b61af105956d3602
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2019=E5=B9=B410=E6=
=9C=8818=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=889:53=E5=86=99=E9=81=
=93=EF=BC=9A

> From: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
>
> Other piix4 parts are already named piix4-ide and piix4-usb-uhci.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> Message-Id: <20171216090228.28505-15-hpoussin@reactos.org>
> Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> [PMD: rebased]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>


Reviewed-by: Li Qiang <liq3ea@gmail.com>


> ---
>  hw/isa/piix4.c       | 1 -
>  hw/mips/mips_malta.c | 2 +-
>  include/hw/isa/isa.h | 2 ++
>  3 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 9c37c85ae2..ac9383a658 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -45,7 +45,6 @@ typedef struct PIIX4State {
>      uint8_t rcr;
>  } PIIX4State;
>
> -#define TYPE_PIIX4_PCI_DEVICE "PIIX4"
>  #define PIIX4_PCI_DEVICE(obj) \
>      OBJECT_CHECK(PIIX4State, (obj), TYPE_PIIX4_PCI_DEVICE)
>
> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index 7d25ab6c23..e499b7a6bb 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -1414,7 +1414,7 @@ void mips_malta_init(MachineState *machine)
>      ide_drive_get(hd, ARRAY_SIZE(hd));
>
>      pci =3D pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0),
> -                                          true, "PIIX4");
> +                                          true, TYPE_PIIX4_PCI_DEVICE);
>      dev =3D DEVICE(pci);
>      isa_bus =3D ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
>      piix4_devfn =3D pci->devfn;
> diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
> index 018ada4f6f..79f703fd6c 100644
> --- a/include/hw/isa/isa.h
> +++ b/include/hw/isa/isa.h
> @@ -147,4 +147,6 @@ static inline ISABus *isa_bus_from_device(ISADevice *=
d)
>      return ISA_BUS(qdev_get_parent_bus(DEVICE(d)));
>  }
>
> +#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
> +
>  #endif
> --
> 2.21.0
>
>
>

--000000000000b61af105956d3602
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; =E4=BA=8E2019=E5=
=B9=B410=E6=9C=8818=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=889:53=E5=86=
=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">From: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:hpoussin@reactos.or=
g" target=3D"_blank">hpoussin@reactos.org</a>&gt;<br>
<br>
Other piix4 parts are already named piix4-ide and piix4-usb-uhci.<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Acked-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" target=
=3D"_blank">mst@redhat.com</a>&gt;<br>
Acked-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
Signed-off-by: Herv=C3=A9 Poussineau &lt;<a href=3D"mailto:hpoussin@reactos=
.org" target=3D"_blank">hpoussin@reactos.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20171216090228.28505-15-hpoussin@reactos.=
org" target=3D"_blank">20171216090228.28505-15-hpoussin@reactos.org</a>&gt;=
<br>
Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:amarkovic@wavecomp.c=
om" target=3D"_blank">amarkovic@wavecomp.com</a>&gt;<br>
[PMD: rebased]<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br></blockquote><div><=
br></div><div><br></div><div>Reviewed-by: Li Qiang &lt;<a href=3D"mailto:li=
q3ea@gmail.com">liq3ea@gmail.com</a>&gt;<br></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/isa/piix4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0hw/mips/mips_malta.c | 2 +-<br>
=C2=A0include/hw/isa/isa.h | 2 ++<br>
=C2=A03 files changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c<br>
index 9c37c85ae2..ac9383a658 100644<br>
--- a/hw/isa/piix4.c<br>
+++ b/hw/isa/piix4.c<br>
@@ -45,7 +45,6 @@ typedef struct PIIX4State {<br>
=C2=A0 =C2=A0 =C2=A0uint8_t rcr;<br>
=C2=A0} PIIX4State;<br>
<br>
-#define TYPE_PIIX4_PCI_DEVICE &quot;PIIX4&quot;<br>
=C2=A0#define PIIX4_PCI_DEVICE(obj) \<br>
=C2=A0 =C2=A0 =C2=A0OBJECT_CHECK(PIIX4State, (obj), TYPE_PIIX4_PCI_DEVICE)<=
br>
<br>
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c<br>
index 7d25ab6c23..e499b7a6bb 100644<br>
--- a/hw/mips/mips_malta.c<br>
+++ b/hw/mips/mips_malta.c<br>
@@ -1414,7 +1414,7 @@ void mips_malta_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0ide_drive_get(hd, ARRAY_SIZE(hd));<br>
<br>
=C2=A0 =C2=A0 =C2=A0pci =3D pci_create_simple_multifunction(pci_bus, PCI_DE=
VFN(10, 0),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
rue, &quot;PIIX4&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
rue, TYPE_PIIX4_PCI_DEVICE);<br>
=C2=A0 =C2=A0 =C2=A0dev =3D DEVICE(pci);<br>
=C2=A0 =C2=A0 =C2=A0isa_bus =3D ISA_BUS(qdev_get_child_bus(dev, &quot;isa.0=
&quot;));<br>
=C2=A0 =C2=A0 =C2=A0piix4_devfn =3D pci-&gt;devfn;<br>
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h<br>
index 018ada4f6f..79f703fd6c 100644<br>
--- a/include/hw/isa/isa.h<br>
+++ b/include/hw/isa/isa.h<br>
@@ -147,4 +147,6 @@ static inline ISABus *isa_bus_from_device(ISADevice *d)=
<br>
=C2=A0 =C2=A0 =C2=A0return ISA_BUS(qdev_get_parent_bus(DEVICE(d)));<br>
=C2=A0}<br>
<br>
+#define TYPE_PIIX4_PCI_DEVICE &quot;piix4-isa&quot;<br>
+<br>
=C2=A0#endif<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote></div></div>

--000000000000b61af105956d3602--


--===============4819263534900481554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4819263534900481554==--

