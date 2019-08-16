Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8594790125
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 14:14:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyb4t-0000g6-I5; Fri, 16 Aug 2019 12:11:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8cMr=WM=amazon.de=prvs=124e25053=wipawel@srs-us1.protection.inumbo.net>)
 id 1hyb4s-0000g0-2M
 for xen-devel@lists.xen.org; Fri, 16 Aug 2019 12:11:30 +0000
X-Inumbo-ID: f9df1a42-c01e-11e9-b90c-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9df1a42-c01e-11e9-b90c-bc764e2007e4;
 Fri, 16 Aug 2019 12:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1565957489; x=1597493489;
 h=from:to:cc:subject:date:message-id:references: in-reply-to;
 bh=qHNM6BgF+FsXH7WWCWOISwtjPrtbQW/B0i1ngXLyzO4=;
 b=BHWVeovqyy+Hc8XuBPoIj1prlOMXq4GhK1aS9jRCc9dZzuPmb70FAvgF
 XUBM6LSHBa/nwHqQtCUfhjxvI7WruRdVVsnVt5oZ4zRt7GJ71L0wHG1/V
 rknIReCo5zP7GnvDsrE++ZJEwHPcsiM7YfViXsBJuYGwJSDxclp+lO35K E=;
X-Amazon-filename: signature.asc
X-IronPort-AV: E=Sophos;i="5.64,393,1559520000"; 
 d="asc'?scan'208,217";a="820462898"
Content-Type: multipart/mixed; boundary="===============7936272302231597225=="
MIME-Version: 1.0
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1a-af6a10df.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 16 Aug 2019 12:08:19 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-af6a10df.us-east-1.amazon.com (Postfix) with ESMTPS
 id B1763A1FA4; Fri, 16 Aug 2019 12:08:18 +0000 (UTC)
Received: from EX13D05EUB001.ant.amazon.com (10.43.166.87) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 16 Aug 2019 12:08:17 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB001.ant.amazon.com (10.43.166.87) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 16 Aug 2019 12:08:16 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Fri, 16 Aug 2019 12:08:16 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Thread-Topic: [livepatch-build-tools part2 v2 6/6] create-diff-object: Do not
 include all .rodata sections
Thread-Index: AQHVTeZOIZEoFX4igUei1sh+3wGHf6b9liEAgAAkpAA=
Date: Fri, 16 Aug 2019 12:08:16 +0000
Message-ID: <76AF654A-A642-46C6-9B23-949565CC352B@amazon.com>
References: <20190416120716.26269-6-wipawel@amazon.de>
 <20190808123916.8706-1-wipawel@amazon.de>
 <a60d70ae-bc71-ec7c-61e1-7cbde5ef2625@citrix.com>
In-Reply-To: <a60d70ae-bc71-ec7c-61e1-7cbde5ef2625@citrix.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.237]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [livepatch-build-tools part2 v2 6/6]
 create-diff-object: Do not include all .rodata sections
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel <xen-devel@lists.xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7936272302231597225==
Content-Language: en-US
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B43EFC90-9DBD-4575-BF2A-E9D765E5B69E";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Apple-Mail=_B43EFC90-9DBD-4575-BF2A-E9D765E5B69E
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_FC22CED8-8001-4228-B173-7B130D59F796"


--Apple-Mail=_FC22CED8-8001-4228-B173-7B130D59F796
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On 16. Aug 2019, at 11:57, Ross Lagerwall <ross.lagerwall@citrix.com> =
wrote:
>=20
> On 8/8/19 1:39 PM, Pawel Wieczorkiewicz wrote:
>>=20

=E2=80=A6snip...

>>  #define inc_printf(fmt, ...) \
>>  	log_debug("%*s" fmt, recurselevel, "", ##__VA_ARGS__);
> This patch looks good. There is a comment at the top of =
should_include_str_section() which should probably be updated as well:
>=20
> /*
> * String sections are always included even if unchanged.
> * The format is either:
> * .rodata.<func>.str1.[0-9]+ (new in GCC 6.1.0)
> * or .rodata.str1.[0-9]+ (older versions of GCC)
> * For the new format we could be smarter and only include the needed
> * strings sections.
> */
>=20

Oh yes, right. Let me update the comment. Thanks!

> In fact, it is probably a good idea to rename the function to =
something like "is_rodata_str_section()" since this more accurately =
describes what it does now.

ACK, will do.

>=20
> Thanks,
> --
> Ross Lagerwall


Best Regards,
Pawel Wieczorkiewicz




--Apple-Mail=_FC22CED8-8001-4228-B173-7B130D59F796
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><blockquote type=3D"cite" class=3D""><div class=3D"">On =
16. Aug 2019, at 11:57, Ross Lagerwall &lt;<a =
href=3D"mailto:ross.lagerwall@citrix.com" =
class=3D"">ross.lagerwall@citrix.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">On 8/8/19 1:39 PM, Pawel =
Wieczorkiewicz wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br =
class=3D""></blockquote></div></blockquote><div><br =
class=3D""></div><div>=E2=80=A6snip...</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">&nbsp;#define inc_printf(fmt, ...) =
\<br class=3D"">&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:=
 pre;">	</span>log_debug("%*s" fmt, recurselevel, "", ##__VA_ARGS__);<br =
class=3D""></blockquote><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">This patch looks good. There is a comment at the top of =
should_include_str_section() which should probably be updated as =
well:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">/*</span><br =
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
display: inline !important;" class=3D"">* String sections are always =
included even if unchanged.</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">* The format is either:</span><br style=3D"caret-color: =
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
class=3D"">* .rodata.&lt;func&gt;.str1.[0-9]+ (new in GCC =
6.1.0)</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">* or =
.rodata.str1.[0-9]+ (older versions of GCC)</span><br =
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
display: inline !important;" class=3D"">* For the new format we could be =
smarter and only include the needed</span><br style=3D"caret-color: =
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
class=3D"">* strings sections.</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">*/</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote><div><br class=3D""></div><div>Oh =
yes, right. Let me update the comment. Thanks!</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">In fact, it is probably a good =
idea to rename the function to something like "is_rodata_str_section()" =
since this more accurately describes what it does now.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""></div></blockquote><div><br class=3D""></div><div>ACK, will =
do.</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">Thanks,</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">--<span class=3D"Apple-converted-space">&nbsp;</span></span><br=
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
display: inline !important;" class=3D"">Ross =
Lagerwall</span></div></blockquote><br class=3D""></div><div><br =
class=3D""></div><div><div class=3D""><div dir=3D"auto" =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break: =
after-white-space;" class=3D""><div style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);">Best Regards,<br class=3D"">Pawel =
Wieczorkiewicz</div><br class=3D"Apple-interchange-newline"></div><br =
class=3D"Apple-interchange-newline"></div></div><br =
class=3D""></body></html>=

--Apple-Mail=_FC22CED8-8001-4228-B173-7B130D59F796--

--Apple-Mail=_B43EFC90-9DBD-4575-BF2A-E9D765E5B69E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEMfesMdpdS8dLoCFipZXgubqFgvsFAl1WnLAACgkQpZXgubqF
gvtcQw//RmX5YFc/XYjuzT1ktZjG6Hqxe6rfgGzQuo4OsPrLJU4UuZvWajQDfo+5
NStGD3/C2A2sBkesIXg5cdvJF57ma3QgmL8UgAzxxhl0A+kw497t2a20T0EKSXGM
8j2cqFO09lQqlkyKHSJvyKxJpCr9d654ZjaHx1VWPb3jon8Mfx8P1qwPVJEXTiSm
015F7du0+ZXtpeEUC8bfa9chs5M5yCNt6g6jsnXlI0cQEx5ItqgZDS9sjhLiUWvq
/G7xke4jYjf8T8CF5KwOLokxdKtKoxX8dw/TMCzRGbUYBG3v56lvNZcvaQCyfT8t
a+g+OW8YUpsCOG/QNfCdcQ2m2jnGSM4N6bnhBVJgAQIa5tctkdTjGGr1WpWKMuWj
Mr0fGAcsT0s0viUCVh7TjQJEFgAOJfEg0r3xLAu4YV1djAVOcviPYApOccOoPuVW
0vodCLs/qhif2w6svyqtcu2Shz/0DLJo1it6XNr3dkp5T3b4R+tU8qXLgoCvtXNg
YS/vBY+Pt5uAQz/ox2Yl2ZMEQ0dbiEPPwhVJzav2CKXKunTEecItnUUbI1vCwKwX
KN2rEVWBlqlzTBQqt75M48qNUmRdnlxIABtWBao8nFtZtfd56dAdJhDygyodM6vU
5Nv+EmG2S+l+7FgTQ+huXNy2dBexR9V69THMwF/TMM+znC/a5sI=
=GtWM
-----END PGP SIGNATURE-----

--Apple-Mail=_B43EFC90-9DBD-4575-BF2A-E9D765E5B69E--

--===============7936272302231597225==
Content-Type: multipart/alternative; boundary="===============5301133852944349750=="
MIME-Version: 1.0
Content-Disposition: inline

--===============5301133852944349750==
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



--===============5301133852944349750==
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

--===============5301133852944349750==--

--===============7936272302231597225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7936272302231597225==--

