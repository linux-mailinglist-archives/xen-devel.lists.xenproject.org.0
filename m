Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEC2203328
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 11:19:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnIao-00017E-Sb; Mon, 22 Jun 2020 09:18:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kCdQ=AD=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jnIam-000178-Im
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 09:18:17 +0000
X-Inumbo-ID: 4a02df6a-b469-11ea-be54-12813bfff9fa
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a02df6a-b469-11ea-be54-12813bfff9fa;
 Mon, 22 Jun 2020 09:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592817489;
 s=strato-dkim-0002; d=aepfle.de;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=/Wnz5DZ94JL+6N1kDWP4UJgwIXviIIbPBAQ8FVpCj3o=;
 b=cTEmeBuhZJgEXJq+zJGi7ALIxH7qwMsjMlBcn6suqoj9izrGP8zFBPI/117iF+iYyM
 PseX73sSy7a8YBW0dcxDmO/5VM58ybw3V0cbSQRsR1rgQ1x6QNtXRzemVrYj+fu3AB3i
 kUdD4b1anoDg7MznTlTixutSt6LCHNw54vHeMarN7UqAXnRJlt49gPXkoJKddSOTHkwX
 wSGWey61V0n27e9hAay+TNr+purPCsqHLizJ8KidoFMmmdyvSwZ5R5WQnka8vcGfvcij
 GBQVAJFIGWA86lKhYEZlF7cLys1KfT2LIRugGrIny7QvNJNFYYDvjYHVaT2EGNGYemim
 NQXg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Pjw=="
X-RZG-CLASS-ID: mo00
Received: from aepfle.de by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
 with ESMTPSA id 0013a0w5M9I3X3H
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 22 Jun 2020 11:18:03 +0200 (CEST)
Date: Mon, 22 Jun 2020 11:17:51 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [XEN PATCH for-4.14 1/2] tools: Commit autoconf (2.69) output
 from Debian buster
Message-ID: <20200622091738.GA27631@aepfle.de>
References: <000401d640c9$7b14e760$713eb620$@xen.org>
 <20200612151931.1083-2-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline
In-Reply-To: <20200612151931.1083-2-ian.jackson@eu.citrix.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Jun 12, Ian Jackson wrote:

> These files are in tree so that people can build (including from git)
> without needing recent autotools.

Do you know those people who can not possibly install the required (now 8year old) autoconf version?

Olaf

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl7wdz8ACgkQ86SN7mm1
DoCiQA/9HF3/RR3TaGbtcaKHzFWAAsq/3xuJ5I5/+bDe0rjzYRklRhY9wgjcEf06
T8FZqySA7X0dXpD31Vm8w+S2gcEtpNY7dV3ZAz3gq75ur87NshzpaVOwfreq+/OY
vGlIL/sxRFI+tUaqhtLDFJ3v0kiHhnsOrdoiI/EKvFQRTXyxIz+q0pxJ96Xw2Ba1
zGDATjFV765J6HapzZ2sYTvTg9Az1xlBSQuqGZ4XYaJw7nuVTB9RfGeziJjuRh0A
tICK5V12htE3jdq8u6ks+wnVa0CWzOWICIbt9JZkwQm6klwpZ9Uby4Z4yGtt4hLp
uXf8r094qmhZSaxz/O6JA+FAG5KjVlYv9OTaKB5Q509+0M5DZzrjVOMlqxn5UjO1
ySAsMA780X8YiB7f7EHbWVPPawAUBofDCe7t3Z+bBbvQeUDGbNGLTaDhwyOn5pEV
4nQhbQKT9D3oOzelmAA8T8Whspj40AchWJX2RwNRFwQGTlrI74G+WJQw1gknycYb
EpCCzgyvlskJU1rUP/I6RgDDgBU1JhVnAnNuN84uNzxOQF/O9YNEe3UoWd1qo7uN
tYGhBHRSj3j60UP8tynEL6gk0SYCOxB/HN/xlqJmBFyDN/BRronAn8o2rJZ+/ReG
9+9XdBvCsgjoBcz/EM6r15xaHTmK7v5WuokvZu7gNKDHZ/GL688=
=bzS3
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--

