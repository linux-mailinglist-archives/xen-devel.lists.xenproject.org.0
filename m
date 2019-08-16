Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1078FC8D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 09:40:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyWmI-0005JZ-Ce; Fri, 16 Aug 2019 07:36:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1lwd=WM=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hyWmG-0005JJ-W4
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 07:36:01 +0000
X-Inumbo-ID: 7cb4d71c-bff8-11e9-8bb0-12813bfff9fa
Received: from smtpe1.intersmtp.com (unknown [213.121.35.74])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7cb4d71c-bff8-11e9-8bb0-12813bfff9fa;
 Fri, 16 Aug 2019 07:35:58 +0000 (UTC)
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 BWP09926079.bt.com (10.36.82.110) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:35:34 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:35:56 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:35:56 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 29/42] hw/ssi: Declare device little or
 big endian
Thread-Index: AQHVVAU9wbn561zm7k64tZGTYvMONA==
Date: Fri, 16 Aug 2019 07:35:56 +0000
Message-ID: <1565940955631.8939@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
MIME-Version: 1.0
Subject: [Xen-devel] [Qemu-devel] [PATCH v7 29/42] hw/ssi: Declare device
 little or big endian
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
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, lersek@redhat.com,
 jasowang@redhat.com, jiri@resnulli.us, ehabkost@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 andrew@aj.id.au, claudio.fontana@suse.com, crwulff@gmail.com,
 laurent@vivier.eu, sundeep.lkml@gmail.com, michael@walle.cc,
 qemu-ppc@nongnu.org, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, david@redhat.com, palmer@sifive.com,
 balaton@eik.bme.hu, keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
 sstabellini@kernel.org, andrew.smirnov@gmail.com, deller@gmx.de,
 magnus.damm@gmail.com, marcel.apfelbaum@gmail.com, atar4qemu@gmail.com,
 minyard@acm.org, sw@weilnetz.de, yuval.shaia@oracle.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, jan.kiszka@web.de, clg@kaod.org, shorne@gmail.com,
 qemu-riscv@nongnu.org, i.mitsyanko@gmail.com, cohuck@redhat.com,
 philmd@redhat.com, amarkovic@wavecomp.com, peter.chubb@nicta.com.au,
 aurelien@aurel32.net, pburton@wavecomp.com, sagark@eecs.berkeley.edu,
 green@moxielogic.com, kraxel@redhat.com, edgar.iglesias@gmail.com,
 gxt@mprc.pku.edu.cn, robh@kernel.org, borntraeger@de.ibm.com, joel@jms.id.au,
 antonynpavlov@gmail.com, chouteau@adacore.com, balrogg@gmail.com,
 Andrew.Baumann@microsoft.com, mreitz@redhat.com, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 jslaby@suse.cz, marex@denx.de, proljc@gmail.com, marcandre.lureau@redhat.com,
 alistair@alistair23.me, paul.durrant@citrix.com, david@gibson.dropbear.id.au,
 xiaoguangrong.eric@gmail.com, huth@tuxfamily.org, jcd@tribudubois.net,
 pbonzini@redhat.com, stefanb@linux.ibm.com
Content-Type: multipart/mixed; boundary="===============2972199874928168639=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2972199874928168639==
Content-Language: en-AU
Content-Type: multipart/alternative; boundary="_000_15659409556318939btcom_"

--_000_15659409556318939btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
targets from the set of target/hw/*/device.o.

If the set of targets are all little or all big endian, re-declare
the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
respectively.

This *naive* deduction may result in genuinely native endian devices
being incorrectly declared as little or big endian, but should not
introduce regressions for current targets.

These devices should be re-declared as DEVICE_NATIVE_ENDIAN if 1) it
has a new target with an opposite endian or 2) someone informed knows
better =3D)

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/ssi/mss-spi.c       | 2 +-
 hw/ssi/pl022.c         | 2 +-
 hw/ssi/stm32f2xx_spi.c | 2 +-
 hw/ssi/xilinx_spips.c  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
index 4c9da5d..71fd138 100644
--- a/hw/ssi/mss-spi.c
+++ b/hw/ssi/mss-spi.c
@@ -359,7 +359,7 @@ static void spi_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps spi_ops =3D {
     .read =3D spi_read,
     .write =3D spi_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4
diff --git a/hw/ssi/pl022.c b/hw/ssi/pl022.c
index fec73ca..10d1995 100644
--- a/hw/ssi/pl022.c
+++ b/hw/ssi/pl022.c
@@ -226,7 +226,7 @@ static void pl022_reset(DeviceState *dev)
 static const MemoryRegionOps pl022_ops =3D {
     .read =3D pl022_read,
     .write =3D pl022_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static int pl022_post_load(void *opaque, int version_id)
diff --git a/hw/ssi/stm32f2xx_spi.c b/hw/ssi/stm32f2xx_spi.c
index 4249101..e1e5ab5 100644
--- a/hw/ssi/stm32f2xx_spi.c
+++ b/hw/ssi/stm32f2xx_spi.c
@@ -166,7 +166,7 @@ static void stm32f2xx_spi_write(void *opaque, hwaddr ad=
dr,
 static const MemoryRegionOps stm32f2xx_spi_ops =3D {
     .read =3D stm32f2xx_spi_read,
     .write =3D stm32f2xx_spi_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static const VMStateDescription vmstate_stm32f2xx_spi =3D {
diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index b29e0a4..8cadc4e 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -1238,7 +1238,7 @@ static MemTxResult lqspi_write(void *opaque, hwaddr o=
ffset, uint64_t value,
 static const MemoryRegionOps lqspi_ops =3D {
     .read_with_attrs =3D lqspi_read,
     .write_with_attrs =3D lqspi_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
     .impl =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 4,
--
1.8.3.1

?


--_000_15659409556318939btcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- P { margin-top: 0px; m=
argin-bottom: 0px; } .EmailQuote { margin-left: 1pt; padding-left: 4pt; bor=
der-left-width: 2px; border-left-style: solid; border-left-color: rgb(128, =
0, 0); }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p></p>
<div><span style=3D"font-size: 12pt;">For each device declared with DEVICE_=
NATIVE_ENDIAN, find the set of</span><br>
</div>
<div>targets from the set of target/hw/*/device.o.</div>
<div><br>
</div>
<div>If the set of targets are all little or all big endian, re-declare</di=
v>
<div>the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN</di=
v>
<div>respectively.</div>
<div><br>
</div>
<div>This *naive* deduction may result in genuinely native endian devices</=
div>
<div>being incorrectly declared as little or big endian, but should not</di=
v>
<div>introduce regressions for current targets.</div>
<div><br>
</div>
<div>These devices should be re-declared as DEVICE_NATIVE_ENDIAN if 1) it</=
div>
<div>has a new target with an opposite endian or 2) someone informed knows<=
/div>
<div>better =3D)</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;hw/ssi/mss-spi.c &nbsp; &nbsp; &nbsp; | 2 &#43;-</div>
<div>&nbsp;hw/ssi/pl022.c &nbsp; &nbsp; &nbsp; &nbsp; | 2 &#43;-</div>
<div>&nbsp;hw/ssi/stm32f2xx_spi.c | 2 &#43;-</div>
<div>&nbsp;hw/ssi/xilinx_spips.c &nbsp;| 2 &#43;-</div>
<div>&nbsp;4 files changed, 4 insertions(&#43;), 4 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c</div>
<div>index 4c9da5d..71fd138 100644</div>
<div>--- a/hw/ssi/mss-spi.c</div>
<div>&#43;&#43;&#43; b/hw/ssi/mss-spi.c</div>
<div>@@ -359,7 &#43;359,7 @@ static void spi_write(void *opaque, hwaddr add=
r,</div>
<div>&nbsp;static const MemoryRegionOps spi_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D spi_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D spi_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4</div>
<div>diff --git a/hw/ssi/pl022.c b/hw/ssi/pl022.c</div>
<div>index fec73ca..10d1995 100644</div>
<div>--- a/hw/ssi/pl022.c</div>
<div>&#43;&#43;&#43; b/hw/ssi/pl022.c</div>
<div>@@ -226,7 &#43;226,7 @@ static void pl022_reset(DeviceState *dev)</div=
>
<div>&nbsp;static const MemoryRegionOps pl022_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D pl022_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D pl022_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static int pl022_post_load(void *opaque, int version_id)</div>
<div>diff --git a/hw/ssi/stm32f2xx_spi.c b/hw/ssi/stm32f2xx_spi.c</div>
<div>index 4249101..e1e5ab5 100644</div>
<div>--- a/hw/ssi/stm32f2xx_spi.c</div>
<div>&#43;&#43;&#43; b/hw/ssi/stm32f2xx_spi.c</div>
<div>@@ -166,7 &#43;166,7 @@ static void stm32f2xx_spi_write(void *opaque, =
hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps stm32f2xx_spi_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D stm32f2xx_spi_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D stm32f2xx_spi_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp;};</div>
<div>&nbsp;</div>
<div>&nbsp;static const VMStateDescription vmstate_stm32f2xx_spi =3D {</div=
>
<div>diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c</div>
<div>index b29e0a4..8cadc4e 100644</div>
<div>--- a/hw/ssi/xilinx_spips.c</div>
<div>&#43;&#43;&#43; b/hw/ssi/xilinx_spips.c</div>
<div>@@ -1238,7 &#43;1238,7 @@ static MemTxResult lqspi_write(void *opaque,=
 hwaddr offset, uint64_t value,</div>
<div>&nbsp;static const MemoryRegionOps lqspi_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read_with_attrs =3D lqspi_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write_with_attrs =3D lqspi_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_NATIVE_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D DEVICE_LITTLE_ENDIAN,</div>
<div>&nbsp; &nbsp; &nbsp;.impl =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 4,</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_15659409556318939btcom_--


--===============2972199874928168639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2972199874928168639==--

