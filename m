Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F928FCA3
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 09:44:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyWq9-0006Yc-75; Fri, 16 Aug 2019 07:40:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1lwd=WM=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hyWq7-0006YE-Su
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 07:39:59 +0000
X-Inumbo-ID: 0c04038e-bff9-11e9-a661-bc764e2007e4
Received: from smtpe1.intersmtp.com (unknown [213.121.35.71])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c04038e-bff9-11e9-a661-bc764e2007e4;
 Fri, 16 Aug 2019 07:39:58 +0000 (UTC)
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 BWP09926076.bt.com (10.36.82.107) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:39:33 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:39:56 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:39:57 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 42/42] target/sparc: sun4u Invert Endian
 TTE bit
Thread-Index: AQHVVAXNVmglh/lbAUq8ZFx4atJssA==
Date: Fri, 16 Aug 2019 07:39:56 +0000
Message-ID: <1565941195999.79315@bt.com>
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
Subject: [Xen-devel] [Qemu-devel] [PATCH v7 42/42] target/sparc: sun4u
 Invert Endian TTE bit
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
Content-Type: multipart/mixed; boundary="===============2874499505968922542=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2874499505968922542==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156594119599979315btcom_"

--_000_156594119599979315btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This bit configures endianness of PCI MMIO devices. It is used by
Solaris and OpenBSD sunhme drivers.

Tested working on OpenBSD.

Unfortunately Solaris 10 had a unrelated keyboard issue blocking
testing... another inch towards Solaris 10 on SPARC64 =3D)

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 target/sparc/cpu.h        | 2 ++
 target/sparc/mmu_helper.c | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 1406f0b..c6bafa8 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -275,6 +275,7 @@ enum {

 #define TTE_VALID_BIT       (1ULL << 63)
 #define TTE_NFO_BIT         (1ULL << 60)
+#define TTE_IE_BIT          (1ULL << 59)
 #define TTE_USED_BIT        (1ULL << 41)
 #define TTE_LOCKED_BIT      (1ULL <<  6)
 #define TTE_SIDEEFFECT_BIT  (1ULL <<  3)
@@ -291,6 +292,7 @@ enum {

 #define TTE_IS_VALID(tte)   ((tte) & TTE_VALID_BIT)
 #define TTE_IS_NFO(tte)     ((tte) & TTE_NFO_BIT)
+#define TTE_IS_IE(tte)      ((tte) & TTE_IE_BIT)
 #define TTE_IS_USED(tte)    ((tte) & TTE_USED_BIT)
 #define TTE_IS_LOCKED(tte)  ((tte) & TTE_LOCKED_BIT)
 #define TTE_IS_SIDEEFFECT(tte) ((tte) & TTE_SIDEEFFECT_BIT)
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 826e14b..77dc86a 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -537,6 +537,10 @@ static int get_physical_address_data(CPUSPARCState *en=
v, hwaddr *physical,
         if (ultrasparc_tag_match(&env->dtlb[i], address, context, physical=
)) {
             int do_fault =3D 0;

+            if (TTE_IS_IE(env->dtlb[i].tte)) {
+                attrs->byte_swap =3D true;
+            }
+
             /* access ok? */
             /* multiple bits in SFSR.FT may be set on TT_DFAULT */
             if (TTE_IS_PRIV(env->dtlb[i].tte) && is_user) {
@@ -792,7 +796,7 @@ void dump_mmu(CPUSPARCState *env)
             }
             if (TTE_IS_VALID(env->dtlb[i].tte)) {
                 qemu_printf("[%02u] VA: %" PRIx64 ", PA: %llx"
-                            ", %s, %s, %s, %s, ctx %" PRId64 " %s\n",
+                            ", %s, %s, %s, %s, ie %s, ctx %" PRId64 " %s\n=
",
                             i,
                             env->dtlb[i].tag & (uint64_t)~0x1fffULL,
                             TTE_PA(env->dtlb[i].tte),
@@ -801,6 +805,8 @@ void dump_mmu(CPUSPARCState *env)
                             TTE_IS_W_OK(env->dtlb[i].tte) ? "RW" : "RO",
                             TTE_IS_LOCKED(env->dtlb[i].tte) ?
                             "locked" : "unlocked",
+                            TTE_IS_IE(env->dtlb[i].tte) ?
+                            "yes" : "no",
                             env->dtlb[i].tag & (uint64_t)0x1fffULL,
                             TTE_IS_GLOBAL(env->dtlb[i].tte) ?
                             "global" : "local");
--
1.8.3.1

?


--_000_156594119599979315btcom_
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
<div><span style=3D"font-size: 12pt;">This bit configures endianness of PCI=
 MMIO devices. It is used by</span><br>
</div>
<div>Solaris and OpenBSD sunhme drivers.</div>
<div><br>
</div>
<div>Tested working on OpenBSD.</div>
<div><br>
</div>
<div>Unfortunately Solaris 10 had a unrelated keyboard issue blocking</div>
<div>testing... another inch towards Solaris 10 on SPARC64 =3D)</div>
<div><br>
</div>
<div>Signed-off-by: Tony Nguyen &lt;tony.nguyen@bt.com&gt;</div>
<div>Reviewed-by: Richard Henderson &lt;richard.henderson@linaro.org&gt;</d=
iv>
<div>Tested-by: Mark Cave-Ayland &lt;mark.cave-ayland@ilande.co.uk&gt;</div=
>
<div>---</div>
<div>&nbsp;target/sparc/cpu.h &nbsp; &nbsp; &nbsp; &nbsp;| 2 &#43;&#43;</di=
v>
<div>&nbsp;target/sparc/mmu_helper.c | 8 &#43;&#43;&#43;&#43;&#43;&#43;&#43=
;-</div>
<div>&nbsp;2 files changed, 9 insertions(&#43;), 1 deletion(-)</div>
<div><br>
</div>
<div>diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h</div>
<div>index 1406f0b..c6bafa8 100644</div>
<div>--- a/target/sparc/cpu.h</div>
<div>&#43;&#43;&#43; b/target/sparc/cpu.h</div>
<div>@@ -275,6 &#43;275,7 @@ enum {</div>
<div>&nbsp;</div>
<div>&nbsp;#define TTE_VALID_BIT &nbsp; &nbsp; &nbsp; (1ULL &lt;&lt; 63)</d=
iv>
<div>&nbsp;#define TTE_NFO_BIT &nbsp; &nbsp; &nbsp; &nbsp; (1ULL &lt;&lt; 6=
0)</div>
<div>&#43;#define TTE_IE_BIT &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1ULL &lt;&l=
t; 59)</div>
<div>&nbsp;#define TTE_USED_BIT &nbsp; &nbsp; &nbsp; &nbsp;(1ULL &lt;&lt; 4=
1)</div>
<div>&nbsp;#define TTE_LOCKED_BIT &nbsp; &nbsp; &nbsp;(1ULL &lt;&lt; &nbsp;=
6)</div>
<div>&nbsp;#define TTE_SIDEEFFECT_BIT &nbsp;(1ULL &lt;&lt; &nbsp;3)</div>
<div>@@ -291,6 &#43;292,7 @@ enum {</div>
<div>&nbsp;</div>
<div>&nbsp;#define TTE_IS_VALID(tte) &nbsp; ((tte) &amp; TTE_VALID_BIT)</di=
v>
<div>&nbsp;#define TTE_IS_NFO(tte) &nbsp; &nbsp; ((tte) &amp; TTE_NFO_BIT)<=
/div>
<div>&#43;#define TTE_IS_IE(tte) &nbsp; &nbsp; &nbsp;((tte) &amp; TTE_IE_BI=
T)</div>
<div>&nbsp;#define TTE_IS_USED(tte) &nbsp; &nbsp;((tte) &amp; TTE_USED_BIT)=
</div>
<div>&nbsp;#define TTE_IS_LOCKED(tte) &nbsp;((tte) &amp; TTE_LOCKED_BIT)</d=
iv>
<div>&nbsp;#define TTE_IS_SIDEEFFECT(tte) ((tte) &amp; TTE_SIDEEFFECT_BIT)<=
/div>
<div>diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c</di=
v>
<div>index 826e14b..77dc86a 100644</div>
<div>--- a/target/sparc/mmu_helper.c</div>
<div>&#43;&#43;&#43; b/target/sparc/mmu_helper.c</div>
<div>@@ -537,6 &#43;537,10 @@ static int get_physical_address_data(CPUSPARC=
State *env, hwaddr *physical,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (ultrasparc_tag_match(&amp;env-&g=
t;dtlb[i], address, context, physical)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int do_fault =3D 0;</d=
iv>
<div>&nbsp;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (TTE_IS_IE(env-&gt;d=
tlb[i].tte)) {</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;attrs-&gt=
;byte_swap =3D true;</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&#43;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* access ok? */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* multiple bits in SF=
SR.FT may be set on TT_DFAULT */</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (TTE_IS_PRIV(env-&g=
t;dtlb[i].tte) &amp;&amp; is_user) {</div>
<div>@@ -792,7 &#43;796,7 @@ void dump_mmu(CPUSPARCState *env)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (TTE_IS_VALID(env-&=
gt;dtlb[i].tte)) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;qemu_pri=
ntf(&quot;[%02u] VA: %&quot; PRIx64 &quot;, PA: %llx&quot;</div>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;&quot;, %s, %s, %s, %s, ctx %&quot; PRId64 &qu=
ot; %s\n&quot;,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;, %s, %s, %s, %s, ie %s, ctx %&quot;=
 PRId64 &quot; %s\n&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;env-&gt;dtlb[i].tag &amp; (uint64_t)~0x1f=
ffULL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TTE_PA(env-&gt;dtlb[i].tte),</div>
<div>@@ -801,6 &#43;805,8 @@ void dump_mmu(CPUSPARCState *env)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TTE_IS_W_OK(env-&gt;dtlb[i].tte) ? &quot;=
RW&quot; : &quot;RO&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TTE_IS_LOCKED(env-&gt;dtlb[i].tte) ?</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;locked&quot; : &quot;unlocked&quot;=
,</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TTE_IS_IE(env-&gt;dtlb[i].tte) ?</div>
<div>&#43; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;yes&quot; : &quot;no&quot;,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;env-&gt;dtlb[i].tag &amp; (uint64_t)0x1ff=
fULL,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;TTE_IS_GLOBAL(env-&gt;dtlb[i].tte) ?</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;global&quot; : &quot;local&quot;);<=
/div>
<div>--&nbsp;</div>
<div>1.8.3.1</div>
<div><br>
&#8203;<br>
</div>
<p><br>
</p>
</body>
</html>

--_000_156594119599979315btcom_--


--===============2874499505968922542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2874499505968922542==--

