Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2841784782
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 10:35:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvHNS-0001Vt-Lr; Wed, 07 Aug 2019 08:32:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DvAo=WD=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hvHNQ-0001Tw-Cc
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 08:32:56 +0000
X-Inumbo-ID: f2bf65d8-b8ed-11e9-bb1a-c3ad80eaa8e0
Received: from smtpe1.intersmtp.com (unknown [213.121.35.71])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2bf65d8-b8ed-11e9-bb1a-c3ad80eaa8e0;
 Wed, 07 Aug 2019 08:32:53 +0000 (UTC)
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 BWP09926076.bt.com (10.36.82.107) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 09:32:40 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Wed, 7 Aug 2019 09:32:52 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Wed, 7 Aug 2019
 09:32:51 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v6 19/26] exec: Delete DEVICE_HOST_ENDIAN
Thread-Index: AQHVTPqz60CeloaZYkqofdP35k6Cxw==
Date: Wed, 7 Aug 2019 08:32:51 +0000
Message-ID: <1565166771281.2734@bt.com>
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.44]
MIME-Version: 1.0
Subject: [Xen-devel] [Qemu-devel] [PATCH v6 19/26] exec: Delete
 DEVICE_HOST_ENDIAN
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 cohuck@redhat.com, sagark@eecs.berkeley.edu, david@redhat.com,
 jasowang@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 i.mitsyanko@gmail.com, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, dmitry.fleytman@gmail.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn, pburton@wavecomp.com,
 xiaoguangrong.eric@gmail.com, peter.chubb@nicta.com.au, philmd@redhat.com,
 robh@kernel.org, hare@suse.com, sstabellini@kernel.org, berto@igalia.com,
 chouteau@adacore.com, qemu-block@nongnu.org, arikalo@wavecomp.com,
 jslaby@suse.cz, deller@gmx.de, mst@redhat.com, magnus.damm@gmail.com,
 jcd@tribudubois.net, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 mreitz@redhat.com, hpoussin@reactos.org, joel@jms.id.au,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 david@gibson.dropbear.id.au, lersek@redhat.com, green@moxielogic.com,
 atar4qemu@gmail.com, antonynpavlov@gmail.com, marex@denx.de, jiri@resnulli.us,
 ehabkost@redhat.com, minyard@acm.org, qemu-s390x@nongnu.org, sw@weilnetz.de,
 alistair@alistair23.me, yuval.shaia@oracle.com, b.galvani@gmail.com,
 eric.auger@redhat.com, alex.williamson@redhat.com, qemu-arm@nongnu.org,
 jan.kiszka@web.de, clg@kaod.org, stefanha@redhat.com,
 marcandre.lureau@redhat.com, shorne@gmail.com, jsnow@redhat.com,
 rth@twiddle.net, kwolf@redhat.com, qemu-riscv@nongnu.org, proljc@gmail.com,
 pbonzini@redhat.com, andrew@aj.id.au, kbastian@mail.uni-paderborn.de,
 crwulff@gmail.com, laurent@vivier.eu, Andrew.Baumann@microsoft.com,
 sundeep.lkml@gmail.com, andrew.smirnov@gmail.com, michael@walle.cc,
 paul.durrant@citrix.com, qemu-ppc@nongnu.org, huth@tuxfamily.org,
 amarkovic@wavecomp.com, imammedo@redhat.com, aurelien@aurel32.net,
 stefanb@linux.ibm.com
Content-Type: multipart/mixed; boundary="===============4436457871273479428=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4436457871273479428==
Content-Language: en-AU
Content-Type: multipart/alternative; boundary="_000_15651667712812734btcom_"

--_000_15651667712812734btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

DEVICE_HOST_ENDIAN is conditional upon HOST_WORDS_BIGENDIAN.

Code is cleaner if the single use of DEVICE_HOST_ENDIAN is instead
directly conditional upon HOST_WORDS_BIGENDIAN.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 include/exec/cpu-common.h | 8 --------
 memory.c                  | 6 +++++-
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 7eeb78c..b33dc0c 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -16,14 +16,6 @@ void tcg_flush_softmmu_tlb(CPUState *cs);

 #if !defined(CONFIG_USER_ONLY)

-#include "exec/memop.h"
-
-#if defined(HOST_WORDS_BIGENDIAN)
-#define DEVICE_HOST_ENDIAN MO_BE
-#else
-#define DEVICE_HOST_ENDIAN MO_LE
-#endif
-
 /* address in the RAM (different from a physical address) */
 #if defined(CONFIG_XEN_BACKEND)
 typedef uint64_t ram_addr_t;
diff --git a/memory.c b/memory.c
index 3cabb52..11db6ec 100644
--- a/memory.c
+++ b/memory.c
@@ -1362,7 +1362,11 @@ static void memory_region_ram_device_write(void *opa=
que, hwaddr addr,
 static const MemoryRegionOps ram_device_mem_ops =3D {
     .read =3D memory_region_ram_device_read,
     .write =3D memory_region_ram_device_write,
-    .endianness =3D DEVICE_HOST_ENDIAN,
+#if defined(HOST_WORDS_BIGENDIAN)
+    .endianness =3D MO_BE,
+#else
+    .endianness =3D MO_LE,
+#endif
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 8,
--
1.8.3.1

?


--_000_15651667712812734btcom_
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
<div style=3D"color: rgb(33, 33, 33);"><font size=3D"2"><span style=3D"font=
-size:10pt;">
<div class=3D"PlainText">
<div><span style=3D"font-size: 10pt;">DEVICE_HOST_ENDIAN is conditional upo=
n HOST_WORDS_BIGENDIAN.</span><br>
</div>
<div><br>
</div>
<div>Code is cleaner if the single use of DEVICE_HOST_ENDIAN is instead</di=
v>
<div>directly conditional upon HOST_WORDS_BIGENDIAN.</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>---</div>
<div>&nbsp;include/exec/cpu-common.h | 8 --------</div>
<div>&nbsp;memory.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| 6 &#43;&#43;&#43;&#43;&#43;-</div>
<div>&nbsp;2 files changed, 5 insertions(&#43;), 9 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h</di=
v>
<div>index 7eeb78c..b33dc0c 100644</div>
<div>--- a/include/exec/cpu-common.h</div>
<div>&#43;&#43;&#43; b/include/exec/cpu-common.h</div>
<div>@@ -16,14 &#43;16,6 @@ void tcg_flush_softmmu_tlb(CPUState *cs);</div>
<div>&nbsp;</div>
<div>&nbsp;#if !defined(CONFIG_USER_ONLY)</div>
<div>&nbsp;</div>
<div>-#include &quot;exec/memop.h&quot;</div>
<div>-</div>
<div>-#if defined(HOST_WORDS_BIGENDIAN)</div>
<div>-#define DEVICE_HOST_ENDIAN MO_BE</div>
<div>-#else</div>
<div>-#define DEVICE_HOST_ENDIAN MO_LE</div>
<div>-#endif</div>
<div>-</div>
<div>&nbsp;/* address in the RAM (different from a physical address) */</di=
v>
<div>&nbsp;#if defined(CONFIG_XEN_BACKEND)</div>
<div>&nbsp;typedef uint64_t ram_addr_t;</div>
<div>diff --git a/memory.c b/memory.c</div>
<div>index 3cabb52..11db6ec 100644</div>
<div>--- a/memory.c</div>
<div>&#43;&#43;&#43; b/memory.c</div>
<div>@@ -1362,7 &#43;1362,11 @@ static void memory_region_ram_device_write(=
void *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps ram_device_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D memory_region_ram_device_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D memory_region_ram_device_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_HOST_ENDIAN,</div>
<div>&#43;#if defined(HOST_WORDS_BIGENDIAN)</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_BE,</div>
<div>&#43;#else</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D MO_LE,</div>
<div>&#43;#endif</div>
<div>&nbsp; &nbsp; &nbsp;.valid =3D {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.min_access_size =3D 1,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;.max_access_size =3D 8,</div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_15651667712812734btcom_--


--===============4436457871273479428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4436457871273479428==--

