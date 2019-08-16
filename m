Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DA48FC97
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 09:42:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyWo2-0005rc-He; Fri, 16 Aug 2019 07:37:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1lwd=WM=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hyWo1-0005rR-NZ
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 07:37:49 +0000
X-Inumbo-ID: be89ae1a-bff8-11e9-b90c-bc764e2007e4
Received: from smtpe1.intersmtp.com (unknown [213.121.35.73])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be89ae1a-bff8-11e9-b90c-bc764e2007e4;
 Fri, 16 Aug 2019 07:37:48 +0000 (UTC)
Received: from tpw09926dag18h.domain1.systemhost.net (10.9.212.42) by
 BWP09926078.bt.com (10.36.82.109) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:37:07 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18h.domain1.systemhost.net (10.9.212.42) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:37:47 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:37:47 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 35/42] exec: Delete DEVICE_HOST_ENDIAN
Thread-Index: AQHVVAV/22SpmDs0VU2aZZpQIyY/gw==
Date: Fri, 16 Aug 2019 07:37:46 +0000
Message-ID: <1565941066081.69203@bt.com>
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
Subject: [Xen-devel] [Qemu-devel] [PATCH v7 35/42] exec: Delete
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
Content-Type: multipart/mixed; boundary="===============8053895071347985043=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8053895071347985043==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156594106608169203btcom_"

--_000_156594106608169203btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

DEVICE_HOST_ENDIAN is conditional upon HOST_WORDS_BIGENDIAN.

Code is cleaner if the single use of DEVICE_HOST_ENDIAN is instead
directly conditional upon HOST_WORDS_BIGENDIAN.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 include/exec/cpu-common.h | 8 --------
 memory.c                  | 2 +-
 2 files changed, 1 insertion(+), 9 deletions(-)

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
index 3cabb52..689390f 100644
--- a/memory.c
+++ b/memory.c
@@ -1362,7 +1362,7 @@ static void memory_region_ram_device_write(void *opaq=
ue, hwaddr addr,
 static const MemoryRegionOps ram_device_mem_ops =3D {
     .read =3D memory_region_ram_device_read,
     .write =3D memory_region_ram_device_write,
-    .endianness =3D DEVICE_HOST_ENDIAN,
+    .endianness =3D 0, /* Host endianness */
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 8,
--
1.8.3.1

?


--_000_156594106608169203btcom_
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
 &nbsp;| 2 &#43;-</div>
<div>&nbsp;2 files changed, 1 insertion(&#43;), 9 deletions(-)</div>
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
<div>index 3cabb52..689390f 100644</div>
<div>--- a/memory.c</div>
<div>&#43;&#43;&#43; b/memory.c</div>
<div>@@ -1362,7 &#43;1362,7 @@ static void memory_region_ram_device_write(v=
oid *opaque, hwaddr addr,</div>
<div>&nbsp;static const MemoryRegionOps ram_device_mem_ops =3D {</div>
<div>&nbsp; &nbsp; &nbsp;.read =3D memory_region_ram_device_read,</div>
<div>&nbsp; &nbsp; &nbsp;.write =3D memory_region_ram_device_write,</div>
<div>- &nbsp; &nbsp;.endianness =3D DEVICE_HOST_ENDIAN,</div>
<div>&#43; &nbsp; &nbsp;.endianness =3D 0, /* Host endianness */</div>
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

--_000_156594106608169203btcom_--


--===============8053895071347985043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8053895071347985043==--

