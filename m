Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC2329E704
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 10:13:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14070.35020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY3zr-0006MP-NI; Thu, 29 Oct 2020 09:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14070.35020; Thu, 29 Oct 2020 09:13:27 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY3zr-0006M0-KA; Thu, 29 Oct 2020 09:13:27 +0000
Received: by outflank-mailman (input) for mailman id 14070;
 Thu, 29 Oct 2020 09:13:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hwhy=EE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kY3zq-0006Lv-GD
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 09:13:26 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91c3bf7f-8559-4444-ba46-7dd7c995a9fd;
 Thu, 29 Oct 2020 09:13:21 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hwhy=EE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kY3zq-0006Lv-GD
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 09:13:26 +0000
X-Inumbo-ID: 91c3bf7f-8559-4444-ba46-7dd7c995a9fd
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 91c3bf7f-8559-4444-ba46-7dd7c995a9fd;
	Thu, 29 Oct 2020 09:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603962801;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to;
  bh=njeWV/EhVeAwdJZy8iBFwE5E+DJt7jd8mdfipFHfhdM=;
  b=NT01YFeDqz5LAxxetQyF5jyU0hy4dRtsr39TGk+pPQ4KjoMpouRvMq0g
   p72gfW8pLSY195OLo0POhtnTH32N6FCufAgw+3q5XYDIZF5HEPNWTvWe4
   Wau2V4aD4xMosINAO+YpAFYfDn20PiAH7RW0zgyt9RUAI6Djk/9PZIb3W
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1oI8sBvQvKbsoecTC6ptYy5NGOnI1E5p9u6brqy1o7+v2L1LoBUeAVablw+uWdQdiWliBHNij1
 qNN4GJfs6NJm2xCfOV28Gv8DgEsH8rCdkXyvmOEWZb90lGtbIe/N4gtTynsLFJhxI0KFJ19iPc
 YRvCK3uux0c6cKrJr4RvaYz6lhRtn4G8peMPXefRzPBQ3mp0qn7gbSrv2ab91SOnGpFIWszJNN
 tX4czHOoJswuK1UEDbTC495vDo/BCoFYslcSQy/WPmJcOT7xD1MQsuBLyi/QUxyeDvHywsqXIY
 xEQ=
X-SBRS: None
X-MesageID: 30379730
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,429,1596513600"; 
   d="asc'?scan'208";a="30379730"
Subject: Re: call traces in xl dmesg during boot
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
References: <20201029092237.50b8a6f6.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0831520a-609f-de69-7a07-1b86fe137699@citrix.com>
Date: Thu, 29 Oct 2020 09:13:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029092237.50b8a6f6.olaf@aepfle.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="QhF6ym3qSJ5TBsC7AQlvmNYiiDpEja59q"
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

--QhF6ym3qSJ5TBsC7AQlvmNYiiDpEja59q
Content-Type: multipart/mixed; boundary="fsO1gEleEDsGEEguxrHRzKed47sJ5Yk9Q"

--fsO1gEleEDsGEEguxrHRzKed47sJ5Yk9Q
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

On 29/10/2020 08:22, Olaf Hering wrote:
> During boot of xen.git#staging, Xen seems to think something pressed de=
bug keys very early, which shows various call traces in 'xl dmesg'. A reb=
oot may "fix" it, and no traces are printed.
>
> Any idea what may cause this behavior? I do not see it on a slightly sm=
aller box.

That means Xen is receiving real keystrokes on the UART.

I've seen it before on hardware with floating wires in place of a
properly connected UART, but I've also seen it on systems with an
incorrectly configured BAUD rate.=A0 Looking at your command line, you
probably want com1=3D115200,8n1 although this should also be the default.=



Totally unrelated to the problem at hand, but an observation.

(XEN) [000000d6b68c0ecc] WARNING: NR_CPUS limit of 256 reached -
ignoring further processors

You'll need NR_CPUS configured to 512 to boot properly on this system.

~Andrew


--fsO1gEleEDsGEEguxrHRzKed47sJ5Yk9Q--

--QhF6ym3qSJ5TBsC7AQlvmNYiiDpEja59q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEzzVJW36m9w6nfSF2ZcP5BqXXn6AFAl+ah6QACgkQZcP5BqXX
n6AclxAAubBpOm2VoMtiRvVgehGi8zG1emDjR1mdOcVDUJOrn9sizO5OFtyN1Oet
QP3aiKuN1eA3BqRu8qrXai5VlXlXYCZSFFnU7MNqEea2U4ROW4AqfgojkS2NQYMR
6Py4ppMeQ8fK7pudGQ+kqkKfbHbuYPLHjHVtDpRVPNxZLSBsALH7XcsFOCnxnMxt
GyFJHuErBMsROh6sFHRBoOC3YnEN+wx7LcI426cqVfzkqPYuzqqAZN7+ITUG4rKq
s7cNkXVzJHceuszPFe3/bs7hHLscE4Yn6Oamtco2Fq92hB94sLSlbWdkpeEflmbn
6cOeuBYur6k1RpJ1E0+vK6rNn4TpBU5UL7H/r4BoNWkMIdOcbqwJ/CJH9EuOgc2x
vTY2sAWN5J/CM1o4BMGpjTTkB/ev3CtZeBbWG62LKReuDGKG/lFzXYe1ffsjHyFs
qOzoHo1qU5STobxbBZIQJwCfub0Q7lCjw9qgwXvsPAmmBu3+YMv0L8pUnFZhHT4w
QaF8x3BFQrD3cOJi238h6BDVw8CUQGq6U8bpL4+wZw9ujS7igHPJEMpOOMu7ao0+
a1DNVHgit27ED3O1yCXb0NV6yu6Zr+FxfPbxxn2+OV1TsOg6LiH7dzVHYfHdZxYm
T/d4gr9I6dfW3QZOcraROJEwO2/KnaffA96p7wHrbp9yqnV9A0s=
=Bfn3
-----END PGP SIGNATURE-----

--QhF6ym3qSJ5TBsC7AQlvmNYiiDpEja59q--

