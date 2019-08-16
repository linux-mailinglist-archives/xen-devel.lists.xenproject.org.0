Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2B490229
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 15:00:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hybnQ-0005s8-R4; Fri, 16 Aug 2019 12:57:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8cMr=WM=amazon.de=prvs=124e25053=wipawel@srs-us1.protection.inumbo.net>)
 id 1hybnP-0005rh-8p
 for xen-devel@lists.xen.org; Fri, 16 Aug 2019 12:57:31 +0000
X-Inumbo-ID: 67a8a0c4-c025-11e9-aee9-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67a8a0c4-c025-11e9-aee9-bc764e2007e4;
 Fri, 16 Aug 2019 12:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1565960250; x=1597496250;
 h=from:to:cc:subject:date:message-id:references: in-reply-to;
 bh=IK4yL8xXysRxcxSChRwNbTe2GJIIf6UnbmikgJj53Oc=;
 b=mMsUsGJaABHadYB628C+c30x3upR4Igp91nkW/2AI1NboznuvaYb8l5i
 hnWpIzltCCbBNBTk0PeXkr2lPQ4OvjnaKJaZBDlwkNiK3Zhp+s08zgdTl
 2VDgERYsu6BTVlNcpe5yquIgJE8THLqesWC9rrcu7qQWTK5q5vu96Sun7 8=;
X-Amazon-filename: signature.asc
X-IronPort-AV: E=Sophos;i="5.64,393,1559520000"; 
 d="asc'?scan'208,217";a="820473185"
Content-Type: multipart/mixed; boundary="===============3464559998993852452=="
MIME-Version: 1.0
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 16 Aug 2019 12:57:27 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id E04C8A31A8; Fri, 16 Aug 2019 12:57:26 +0000 (UTC)
Received: from EX13D05EUB001.ant.amazon.com (10.43.166.87) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 16 Aug 2019 12:57:25 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB001.ant.amazon.com (10.43.166.87) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 16 Aug 2019 12:57:25 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Fri, 16 Aug 2019 12:57:25 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Wei Liu <wl@xen.org>
Thread-Topic: [PATCH livepatch-python 1/1] livepatch: Add python bindings for
 livepatch operations
Thread-Index: AQHVU13A+lav3LIpREOK1FpVjrchn6b9t/iAgAAFl4A=
Date: Fri, 16 Aug 2019 12:57:25 +0000
Message-ID: <46524D52-5A3A-4873-ABB7-8ECAE5D64288@amazon.com>
References: <20190815113646.12918-1-wipawel@amazon.de>
 <20190816123723.exwa7zln2nh7rjkb@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
In-Reply-To: <20190816123723.exwa7zln2nh7rjkb@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.55]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH livepatch-python 1/1] livepatch: Add python
 bindings for livepatch operations
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, Martin Mazein <amazein@amazon.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3464559998993852452==
Content-Language: en-US
Content-Type: multipart/signed;
	boundary="Apple-Mail=_85D4869D-78AE-48EE-89A9-8A9DD3C3F80E";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Apple-Mail=_85D4869D-78AE-48EE-89A9-8A9DD3C3F80E
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_0CCE9281-BF8B-4213-B474-7A10C89A25B6"


--Apple-Mail=_0CCE9281-BF8B-4213-B474-7A10C89A25B6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On 16. Aug 2019, at 14:37, Wei Liu <wl@xen.org> wrote:
>=20
> On Thu, Aug 15, 2019 at 11:36:46AM +0000, Pawel Wieczorkiewicz wrote:
>> Extend the XC python bindings library to support also all common
>> livepatch operations and actions.
>>=20
>>=20

=E2=80=A6snip...

>>=20
>> Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
>> Reviewed-by: Martin Mazein <amazein@amazon.de>
>> Reviewed-by: Andra-Irina Paraschiv <andraprs@amazon.com>
>> Reviewed-by: Leonard Foerster <foersleo@amazon.de>
>> Reviewed-by: Norbert Manthey <nmanthey@amazon.de>
>=20
> I haven't looked in details, but I'm fine with these new =
functionalities
> in general. Let's see if Marek has any objections.

Thanks.

>=20
> Which version of Python do you use to build these? The requirement =
here
> is the code should build with both Python 2.5 and Python 3.
>=20

Ah, I see. Thanks for pointing this out. We=E2=80=99re planing to =
upstream the tool using those bindings as well.
But, it still requires some work. Let us add the python versions support =
for the tool.

> Wei.


Best Regards,
Pawel Wieczorkiewicz

--Apple-Mail=_0CCE9281-BF8B-4213-B474-7A10C89A25B6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><blockquote type=3D"cite" class=3D""><div class=3D"">On =
16. Aug 2019, at 14:37, Wei Liu &lt;<a href=3D"mailto:wl@xen.org" =
class=3D"">wl@xen.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">On Thu, Aug 15, 2019 at =
11:36:46AM +0000, Pawel Wieczorkiewicz wrote:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">Extend =
the XC python bindings library to support also all common<br =
class=3D"">livepatch operations and actions.<br class=3D""><br =
class=3D""><br class=3D""></blockquote></div></blockquote><div><br =
class=3D""></div><div>=E2=80=A6snip...</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br class=3D"">Signed-off-by: Pawel =
Wieczorkiewicz &lt;<a href=3D"mailto:wipawel@amazon.de" =
class=3D"">wipawel@amazon.de</a>&gt;<br class=3D"">Reviewed-by: Martin =
Mazein &lt;<a href=3D"mailto:amazein@amazon.de" =
class=3D"">amazein@amazon.de</a>&gt;<br class=3D"">Reviewed-by: =
Andra-Irina Paraschiv &lt;<a href=3D"mailto:andraprs@amazon.com" =
class=3D"">andraprs@amazon.com</a>&gt;<br class=3D"">Reviewed-by: =
Leonard Foerster &lt;<a href=3D"mailto:foersleo@amazon.de" =
class=3D"">foersleo@amazon.de</a>&gt;<br class=3D"">Reviewed-by: Norbert =
Manthey &lt;<a href=3D"mailto:nmanthey@amazon.de" =
class=3D"">nmanthey@amazon.de</a>&gt;<br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">I haven't looked in details, but =
I'm fine with these new functionalities</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">in general. Let's see if Marek has any objections.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""></div></blockquote><div><br =
class=3D""></div><div>Thanks.</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Which version of Python do you use to build these? The =
requirement here</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">is the code should build with both Python 2.5 and Python =
3.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote><div><br class=3D""></div><div>Ah, =
I see. Thanks for pointing this out. We=E2=80=99re planing to upstream =
the tool using those bindings as well.</div><div>But, it still requires =
some work. Let us add the python versions support for the =
tool.&nbsp;</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">Wei.</span></div></blockquote></div><div class=3D""><br =
class=3D""></div><div class=3D""><div class=3D""><div dir=3D"auto" =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break: =
after-white-space;" class=3D""><div style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);">Best Regards,<br class=3D"">Pawel =
Wieczorkiewicz</div></div></div></div></body></html>=

--Apple-Mail=_0CCE9281-BF8B-4213-B474-7A10C89A25B6--

--Apple-Mail=_85D4869D-78AE-48EE-89A9-8A9DD3C3F80E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEMfesMdpdS8dLoCFipZXgubqFgvsFAl1WqDMACgkQpZXgubqF
gvtP1BAA0x8ie/pcBjTQweLPRqp1qgajbGxylPRuezEKi7nzpUCMymEptxuuTa2l
xlkwAkvPK6DCsq9XbBAmowzka5BVqmyqX01noMMhlve0hXR0gt743nCwaVpAue1O
w4ShJrw/jWfLtpRYsdJnhzyVUIm8dKx+6zlShbvIEnsV1JFUGmiiQqWxBj7adXDx
HdEqpGih+sg01IGHwOWi2TR5RPM9jmqQW3UkI/mYULbqaBlIZgd5ABOHTk+SgQNb
xMVeVZUdSx4dySv7kNPfWpRRyzY9iWGxyFPIHBKzD2bXufsg3tUWT0zjAcBa9Xo3
NW8DySJQrRQ+becatrgGg4trLOR1UWrB6baidHiaXjABRZKBUBbPy86i/4LpQfRJ
mf8dNZCmSXnUtnY2R4ZurIRECY1G+pP2XUi0ZRGcmXvCr8zPK/thWVfHC9ctA02u
Efhfdi4XbL2A3gPAXe2k3kU0QnirdnhZ/xK3lutcAxNupIlmKJiH2VlcgWC1YkGX
mg1mcDDAihOgDLt5enrlLWJys3Y3xzquuZ5oqpwIhRKmgD3W1ZWY/jXaGor3u3je
Lc4rF7hUI4wDaBWK1naILdDgOUbyFHmy6cm1eC2/zNSISPHkVIWusvefrs1VDdmp
CH+/RXVfA+6E+fG3Tba3UfjRNSD9XN1MX95mzqGpQf81Z8vi3ZU=
=snwz
-----END PGP SIGNATURE-----

--Apple-Mail=_85D4869D-78AE-48EE-89A9-8A9DD3C3F80E--

--===============3464559998993852452==
Content-Type: multipart/alternative; boundary="===============6617796307309201945=="
MIME-Version: 1.0
Content-Disposition: inline

--===============6617796307309201945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Ralf Herbrich
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



--===============6617796307309201945==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<br><br><br>Amazon Development Center Germany GmbH
<br>Krausenstr. 38
<br>10117 Berlin
<br>Geschaeftsfuehrung: Christian Schlaeger, Ralf Herbrich
<br>Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
<br>Sitz: Berlin
<br>Ust-ID: DE 289 237 879
<br><br><br>

--===============6617796307309201945==--

--===============3464559998993852452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3464559998993852452==--

