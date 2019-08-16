Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D74190213
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 14:56:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hybkQ-0005G3-Tx; Fri, 16 Aug 2019 12:54:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8cMr=WM=amazon.de=prvs=124e25053=wipawel@srs-us1.protection.inumbo.net>)
 id 1hybkO-0005Fr-Jr
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 12:54:24 +0000
X-Inumbo-ID: f6dde7d2-c024-11e9-8bb6-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6dde7d2-c024-11e9-8bb6-12813bfff9fa;
 Fri, 16 Aug 2019 12:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1565960061; x=1597496061;
 h=from:to:cc:subject:date:message-id:references: in-reply-to;
 bh=VN/qpdVp31ob+sDraYj6pGpwNT9DmcLFLOB1IY4UEw4=;
 b=jnDnHJuKd2srbOeg68oNROJMmOYMDu/Y/JTDh5J3lp5cS+/XWZBS4rWn
 vsdS/3UACZNNTdsVkUz3TqF3SbNOFZBs/AAlf75P3EE24ElQnetVwy0mK
 nH1fAOFMnmRIogYcMtSoh4np115GJJ36MkCi31D7vSIbFFA0YOWpeo+bv k=;
X-Amazon-filename: signature.asc
X-IronPort-AV: E=Sophos;i="5.64,393,1559520000"; 
 d="asc'?scan'208,217";a="820472317"
Content-Type: multipart/mixed; boundary="===============2627943336264604766=="
MIME-Version: 1.0
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 16 Aug 2019 12:54:17 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com (Postfix) with ESMTPS
 id 2D851A2168; Fri, 16 Aug 2019 12:54:13 +0000 (UTC)
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 16 Aug 2019 12:54:13 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB004.ant.amazon.com (10.43.166.115) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 16 Aug 2019 12:54:12 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Fri, 16 Aug 2019 12:54:12 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Wei Liu <wl@xen.org>
Thread-Topic: [PATCH lp-metadata 3/3] livepatch: Add metadata runtime
 retrieval mechanism
Thread-Index: AQHVU1x89n3d35oUnkWtHe3QPQw/V6b9ugqAgAACoQA=
Date: Fri, 16 Aug 2019 12:54:12 +0000
Message-ID: <FD2C7903-B925-4E83-B7A1-929A17FC7BAC@amazon.com>
References: <20190815112750.11581-1-wipawel@amazon.de>
 <20190816124445.n767e5yra4zodt3z@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
In-Reply-To: <20190816124445.n767e5yra4zodt3z@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.55]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH lp-metadata 3/3] livepatch: Add metadata
 runtime retrieval mechanism
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2627943336264604766==
Content-Language: en-US
Content-Type: multipart/signed;
	boundary="Apple-Mail=_14A1327F-F221-4FC0-BD37-A3719E36888E";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Apple-Mail=_14A1327F-F221-4FC0-BD37-A3719E36888E
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_271DA19A-C45C-4D4D-BEF6-CDCA5D540787"


--Apple-Mail=_271DA19A-C45C-4D4D-BEF6-CDCA5D540787
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On 16. Aug 2019, at 14:44, Wei Liu <wl@xen.org> wrote:
>=20
> On Thu, Aug 15, 2019 at 11:27:50AM +0000, Pawel Wieczorkiewicz wrote:
>> Extend the livepatch list operation to fetch also payloads' metadata.
>> This is achieved by extending the sysctl list interface with 2 extra
>> guest handles:
>> * metadata     - an array of arbitrary size strings
>> * metadata_len - an array of metadata strings' lengths (uin32_t each)

=E2=80=A6snip...

>> Signed-off-by: Pawel Wieczorkiewicz <wipawel@amazon.de>
>> Reviewed-by: Andra-Irina Paraschiv <andraprs@amazon.com>
>> Reviewed-by: Martin Pohlack <mpohlack@amazon.de>
>> Reviewed-by: Norbert Manthey <nmanthey@amazon.de>
>> ---
>> tools/libxc/include/xenctrl.h | 22 +++++++++++----
>> tools/libxc/xc_misc.c         | 66 =
+++++++++++++++++++++++++++++++++++--------
>> tools/misc/xen-livepatch.c    | 43 ++++++++++++++++++++++------
>> xen/common/livepatch.c        | 22 +++++++++++----
>> xen/include/public/sysctl.h   | 19 +++++++++----
>=20
> Mostly look good. One comment below...
>=20
>> diff --git a/xen/include/public/sysctl.h =
b/xen/include/public/sysctl.h
>> index b86804b7a6..e4c8f4fe63 100644
>> --- a/xen/include/public/sysctl.h
>> +++ b/xen/include/public/sysctl.h
>=20
> If it hasn't been done for this release already, changing sysctl =
interface requires
> bumping the version number in this header.
>=20

ACK. Will do (also for earlier patches=E2=80=A6).

> Wei.

Best Regards,
Pawel Wieczorkiewicz

--Apple-Mail=_271DA19A-C45C-4D4D-BEF6-CDCA5D540787
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><blockquote type=3D"cite" class=3D""><div class=3D"">On =
16. Aug 2019, at 14:44, Wei Liu &lt;<a href=3D"mailto:wl@xen.org" =
class=3D"">wl@xen.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">On Thu, Aug 15, 2019 at =
11:27:50AM +0000, Pawel Wieczorkiewicz wrote:</span><br =
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
the livepatch list operation to fetch also payloads' metadata.<br =
class=3D"">This is achieved by extending the sysctl list interface with =
2 extra<br class=3D"">guest handles:<br class=3D"">* metadata =
&nbsp;&nbsp;&nbsp;&nbsp;- an array of arbitrary size strings<br =
class=3D"">* metadata_len - an array of metadata strings' lengths =
(uin32_t each)<br class=3D""></blockquote></div></blockquote><div><br =
class=3D""></div><div>=E2=80=A6snip...</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">Signed-off-by: Pawel Wieczorkiewicz =
&lt;<a href=3D"mailto:wipawel@amazon.de" =
class=3D"">wipawel@amazon.de</a>&gt;<br class=3D"">Reviewed-by: =
Andra-Irina Paraschiv &lt;<a href=3D"mailto:andraprs@amazon.com" =
class=3D"">andraprs@amazon.com</a>&gt;<br class=3D"">Reviewed-by: Martin =
Pohlack &lt;<a href=3D"mailto:mpohlack@amazon.de" =
class=3D"">mpohlack@amazon.de</a>&gt;<br class=3D"">Reviewed-by: Norbert =
Manthey &lt;<a href=3D"mailto:nmanthey@amazon.de" =
class=3D"">nmanthey@amazon.de</a>&gt;<br class=3D"">---<br =
class=3D"">tools/libxc/include/xenctrl.h | 22 +++++++++++----<br =
class=3D"">tools/libxc/xc_misc.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 66 =
+++++++++++++++++++++++++++++++++++--------<br =
class=3D"">tools/misc/xen-livepatch.c &nbsp;&nbsp;&nbsp;| 43 =
++++++++++++++++++++++------<br class=3D"">xen/common/livepatch.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 22 +++++++++++----<br =
class=3D"">xen/include/public/sysctl.h &nbsp;&nbsp;| 19 +++++++++----<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">Mostly look good. One comment below...</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
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
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">diff =
--git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h<br =
class=3D"">index b86804b7a6..e4c8f4fe63 100644<br class=3D"">--- =
a/xen/include/public/sysctl.h<br class=3D"">+++ =
b/xen/include/public/sysctl.h<br class=3D""></blockquote><br =
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
display: inline !important;" class=3D"">If it hasn't been done for this =
release already, changing sysctl interface requires</span><br =
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
display: inline !important;" class=3D"">bumping the version number in =
this header.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote><div><br class=3D""></div><div>ACK. =
Will do (also for earlier patches=E2=80=A6).</div><div><br =
class=3D""></div><blockquote type=3D"cite" class=3D""><div =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">Wei.</span></div></blockquote></div><br class=3D""><div =
class=3D""><div class=3D""><div dir=3D"auto" style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D""><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);">Best Regards,<br class=3D"">Pawel =
Wieczorkiewicz</div></div></div></div></body></html>=

--Apple-Mail=_271DA19A-C45C-4D4D-BEF6-CDCA5D540787--

--Apple-Mail=_14A1327F-F221-4FC0-BD37-A3719E36888E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEMfesMdpdS8dLoCFipZXgubqFgvsFAl1Wp3MACgkQpZXgubqF
gvvsEw//dGLfXJOradMpGJ/mhubnu9mf3ryXxuponSZ+Y6cqSKZwQIE6Enw1jOLo
4myvIEAwajuEA8FP2vCuWb+8niOjz9cAnwpzf051MmWW8N8Pn4gjDdQnwAlX04Z4
NnAnsX8NvuaUjLOCVdNQarDU1koXi1laqP7ynnAYq0b4Aggo7syRtvmEoc/mUyzH
PI7iCxnxu4FJ6N9NHdB9pQQQ9YT968IU+yUojgewoY5YHnaqvLD6K12EsoBGNbrx
BfVay6hZSh0sqC4SwZyAzDsSt7TbhAbD7iPziBe/L126iIdanaM2l5KL8rP/GyHy
kIvfxlNFj36AZ2P5v2MNdPNfGauwnTIjsKTX7hMNyE2ms/36eWNgELriVD09+uCU
ilMQ3zq22Ixgx5eEbizB4u7Z/Nh6cs9kxHxOaWop4GdUXG0IeH5UBbe0M6HgSvbD
u0VkyIhgdlOkfKqENEHlNv6AZCWVyKztAjWuNUyM0ACkuld4/72eqezyKj4lLiJB
Cc8kI+sXapBhgkNwdlpxoBSfkWO9nTBfIrqPq2xswNKviczAuzKCmzuLwc5T0PjP
A7bh0FsVZUgznDgSGOtmzZ6JhBkTJvoq11djtjAG9a08GUpPlQT6SSADl1R9jq4r
v2lGcfMVG9a7hYAce2/KwkRppSAr0OVq4Jaz/pzl9YENKPvZUhs=
=8+Un
-----END PGP SIGNATURE-----

--Apple-Mail=_14A1327F-F221-4FC0-BD37-A3719E36888E--

--===============2627943336264604766==
Content-Type: multipart/alternative; boundary="===============6586579561050471471=="
MIME-Version: 1.0
Content-Disposition: inline

--===============6586579561050471471==
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



--===============6586579561050471471==
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

--===============6586579561050471471==--

--===============2627943336264604766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2627943336264604766==--

