Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DA7900DF
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 13:41:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyaY0-00050l-1w; Fri, 16 Aug 2019 11:37:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1lwd=WM=bt.com=tony.nguyen@srs-us1.protection.inumbo.net>)
 id 1hyaXy-00050g-Pb
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 11:37:30 +0000
X-Inumbo-ID: 39a649f2-c01a-11e9-b90c-bc764e2007e4
Received: from smtpe1.intersmtp.com (unknown [213.121.35.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39a649f2-c01a-11e9-b90c-bc764e2007e4;
 Fri, 16 Aug 2019 11:37:28 +0000 (UTC)
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 BWP09926084.bt.com (10.36.82.115) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 12:37:05 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18e.domain1.systemhost.net (10.9.212.18) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 12:37:26 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 12:37:26 +0100
From: <tony.nguyen@bt.com>
To: <philmd@redhat.com>, <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 00/42] Invert Endian bit in SPARCv9 MMU
 TTE
Thread-Index: AQHVU/vc8DdfhK3ulkmWv148s0Uozqb9eXeAgAAr/BQ=
Date: Fri, 16 Aug 2019 11:37:26 +0000
Message-ID: <1565955445398.83897@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>,
 <a7d6eede-b152-4c06-8945-9607c663b99c@redhat.com>
In-Reply-To: <a7d6eede-b152-4c06-8945-9607c663b99c@redhat.com>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v7 00/42] Invert Endian bit in
 SPARCv9 MMU TTE
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
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, balrogg@gmail.com,
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
 amarkovic@wavecomp.com, peter.chubb@nicta.com.au, aurelien@aurel32.net,
 pburton@wavecomp.com, sagark@eecs.berkeley.edu, green@moxielogic.com,
 kraxel@redhat.com, edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn,
 robh@kernel.org, borntraeger@de.ibm.com, joel@jms.id.au,
 antonynpavlov@gmail.com, chouteau@adacore.com, lersek@redhat.com,
 Andrew.Baumann@microsoft.com, mreitz@redhat.com, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 jslaby@suse.cz, marex@denx.de, proljc@gmail.com, marcandre.lureau@redhat.com,
 alistair@alistair23.me, paul.durrant@citrix.com, david@gibson.dropbear.id.au,
 xiaoguangrong.eric@gmail.com, huth@tuxfamily.org, jcd@tribudubois.net,
 pbonzini@redhat.com, stefanb@linux.ibm.com
Content-Type: multipart/mixed; boundary="===============4983442785008837021=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4983442785008837021==
Content-Language: en-AU
Content-Type: multipart/alternative;
	boundary="_000_156595544539883897btcom_"

--_000_156595544539883897btcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Phillippe,

On 8/16/19 7:58 PM, Philippe Mathieu-Daud=E9 wrote:
>On 8/16/19 8:28 AM, tony.nguyen@bt.com wrote:
>> This patchset implements the IE (Invert Endian) bit in SPARCv9 MMU TTE.
>>
>> v7:
>[...]
>> - Re-declared many native endian devices as little or big endian. This i=
s why
>>   v7 has +16 patches.
>
>Why are you doing that? What is the rational?

While collapsing the byte swaps, it was suggested in patch #11 of v5 that
consistent use of MemOp simplified endian comparisons. This lead to the
deprecation of enum device_endian by MemOp.

As MO_TE is conditional upon NEED_CPU_H, the s/DEVICE_NATIVE_ENDIAN/MO_TE/
required changing some device object files from common-obj-* to obj-*. In p=
atch
#15 of v6 Paolo noted that most devices should not of been DEVICE_NATIVE_EN=
DIAN
and hinted at a clean up.

The +16 patches in v7 is the clean up effort.

>Anyhow if this not required by your series, you should split it out of
>it, and send it on your principal changes are merged.
>I'm worried because this these new patches involve many subsystems (thus
>maintainers) and reviewing them will now take a fair amount of time.

Yes, lets split these patches out. They are very much a tangent to the seri=
es
purpose.

>> For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
>> targets from the set of target/hw/*/device.o.
>>
>> If the set of targets are all little or all big endian, re-declare
>> the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
>> respectively.
>
>If only little endian targets use a device, that doesn't mean the device
>is designed in little endian...
>
>Then if a big endian target plan to use this device, it will require
>more work and you might have introduced regressions...
>
>I'm not sure this is a safe move.
>
>> This *naive* deduction may result in genuinely native endian devices
>> being incorrectly declared as little or big endian, but should not
>> introduce regressions for current targets.
>

Roger. Evidently too naive. TBH, most devices I've never heard of...

Regards,
Tony

--_000_156595544539883897btcom_
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
<div>Hi Phillippe,<br>
</div>
<div><br>
</div>
<div>On 8/16/19 7:58 PM, Philippe Mathieu-Daud=E9 wrote:</div>
<div>&gt;On 8/16/19 8:28 AM, tony.nguyen@bt.com wrote:</div>
<div>&gt;&gt; This patchset implements the IE (Invert Endian) bit in SPARCv=
9 MMU TTE.</div>
<div>&gt;&gt;&nbsp;</div>
<div>&gt;&gt; v7:</div>
<div>&gt;[...]</div>
<div>&gt;&gt; - Re-declared many native endian devices as little or big end=
ian. This is why</div>
<div>&gt;&gt; &nbsp; v7 has &#43;16 patches.<br>
</div>
<div>&gt;</div>
<div>&gt;Why are you doing that? What is the rational?</div>
<div><br>
</div>
<div>While collapsing the byte swaps, it was suggested in patch #11 of v5 t=
hat</div>
<div>consistent use of MemOp simplified endian comparisons. This lead to th=
e</div>
<div>deprecation of enum device_endian by MemOp.</div>
<div><br>
</div>
<div>As MO_TE is conditional upon NEED_CPU_H, the s/DEVICE_NATIVE_ENDIAN/MO=
_TE/</div>
<div>required changing some device object files from common-obj-* to obj-*.=
 In patch</div>
<div>#15 of v6 Paolo noted that most devices should not of been DEVICE_NATI=
VE_ENDIAN</div>
<div>and hinted at a clean up.</div>
<div><br>
</div>
<div>The &#43;16 patches in v7 is the clean up effort.<br>
</div>
<div><br>
</div>
<div>&gt;Anyhow if this not required by your series, you should split it ou=
t of</div>
<div>&gt;it, and send it on your principal changes are merged.</div>
<div>&gt;I'm worried because this these new patches involve many subsystems=
 (thus</div>
<div>&gt;maintainers) and reviewing them will now take a fair amount of tim=
e.</div>
<div><br>
</div>
<div>Yes, lets split these patches out. They are very much a tangent to the=
 series<br>
</div>
<div>purpose.<br>
</div>
<div><br>
</div>
<div>&gt;&gt; For each device declared with DEVICE_NATIVE_ENDIAN, find the =
set of</div>
<div>&gt;&gt; targets from the set of target/hw/*/device.o.</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; If the set of targets are all little or all big endian, re-de=
clare</div>
<div>&gt;&gt; the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_E=
NDIAN</div>
<div>&gt;&gt; respectively.</div>
<div>&gt;</div>
<div>&gt;If only little endian targets use a device, that doesn't mean the =
device</div>
<div>&gt;is designed in little endian...</div>
<div>&gt;</div>
<div>&gt;Then if a big endian target plan to use this device, it will requi=
re</div>
<div>&gt;more work and you might have introduced regressions...</div>
<div>&gt;</div>
<div>&gt;I'm not sure this is a safe move.</div>
<div>&gt;</div>
<div>&gt;&gt; This *naive* deduction may result in genuinely native endian =
devices<br>
</div>
<div>&gt;&gt; being incorrectly declared as little or big endian, but shoul=
d not</div>
<div>&gt;&gt; introduce regressions for current targets.</div>
<div>&gt;<br>
</div>
<div><br>
</div>
<div>Roger. Evidently too naive. TBH, most devices I've never heard of...</=
div>
<div><br>
Regards,<br>
</div>
<div>Tony<br>
</div>
</body>
</html>

--_000_156595544539883897btcom_--


--===============4983442785008837021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4983442785008837021==--

