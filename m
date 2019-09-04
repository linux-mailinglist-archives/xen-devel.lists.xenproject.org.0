Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49271A8579
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 16:16:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5W2Z-0007Xa-QV; Wed, 04 Sep 2019 14:13:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qwq=W7=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1i5W2X-0007XV-GX
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 14:13:42 +0000
X-Inumbo-ID: 312fc682-cf1e-11e9-b299-bc764e2007e4
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 312fc682-cf1e-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 14:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1567606419;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=lIJaQHW0ZVykQOYdPqbzQrmRSd3e+DhpG/RRGWhNY98=;
 b=lSyOSmvCp7FnCo82CDtL7OH+adhFu1RGVlzZFaYyTOrWONjcsl9mktz5N3eMMWWZJU
 0ObTm5Qu9Xp4Pu3m6BeHc0+hTz7IyQlf7yRY8GQLw9yV5com3t5UF9qnyHJ2J4JtADTt
 ldfFyhGg0mhuKyOb57RE+YmIdCiyrA5BD6/iiwPFSoPeeDRiKciYRotqYvzQyXwKMkdQ
 nW9Mww0w/KHhwHAY1AwfiR7+rsQVyjQM79PC/WRjR6mV0K7YX4SOvf01kKLdkLFo6iO2
 /8trmxj+raYXoRZ4KuvK2YgWwYlUhCx6auKPkfyY4zcAqTYO7CDRmJD8ghGfihc6GJSC
 JfVg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYM5kyQ=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.27.0 SBL|AUTH)
 with ESMTPSA id x0a054v84EDQUTg
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 4 Sep 2019 16:13:26 +0200 (CEST)
Date: Wed, 4 Sep 2019 16:13:24 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190904161324.68599b3c.olaf@aepfle.de>
In-Reply-To: <cae6ee14-da0f-883c-148a-5556f26f4b12@suse.com>
References: <20190904091423.23963-1-olaf@aepfle.de>
 <75fe87c1-2f21-b1c1-6589-36807e0b4aaa@citrix.com>
 <20190904113735.349609b4.olaf@aepfle.de>
 <cae6ee14-da0f-883c-148a-5556f26f4b12@suse.com>
X-Mailer: Claws Mail 2019.05.18 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v1] Remove stale crashkernel= example from
 documentation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============6590503150610269077=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6590503150610269077==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ld6ErslZgT=T4KQyAdL=tl6"; protocol="application/pgp-signature"

--Sig_/ld6ErslZgT=T4KQyAdL=tl6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 4 Sep 2019 14:19:23 +0200
schrieb Jan Beulich <jbeulich@suse.com>:

> On 04.09.2019 11:37, Olaf Hering wrote:
> > Maybe just the lack of b49225dc9df336405292dc08862b4c7c9d887bd6 in vend=
or binaries... =20
> But this change was only to deal with the bogus log message.
> The handling was still correct (and the option was being
> honored). I also can't see how this would be different now.

Is that true? My interpretation of the code path is that no colon and nothi=
ng after a size value will lead to EINVAL. With this change any unknown str=
ing will cause EINVAL.

Olaf

--Sig_/ld6ErslZgT=T4KQyAdL=tl6
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl1vxoQACgkQ86SN7mm1
DoD4bA//RNsb0fJCNfoAxojEuIeZnvov3MAS8wXFRrVQfEBuLKK0oMQXj+UuSXhr
gkf5/FUrYjXjSA9YwdZfq8xTfhiO4EWiUIo7FLf1DH+P47AbScOISZOXcpHVDJX3
mjXLmO/tt5R8UV03RqK61ohRhporAvI5hJjkYkrZUUoeifJHTIAz7G5Nxp3ndx2n
FbUsnDJ1p3AM2w4nn0DbqRHtDZ75HVehu2AEV8IzmHyTV2wDMzZwuY1lmSzEf1yw
n9VOVG7TyyiOf9y5+tWFz2oxpE/pypfpFl8oLAgmCbUZCzji2ZYjqCcVKHw+cgMC
Sh5JOzXUOtOG3em0Cs6OSXMWlYBqwWL5pVVH5jmQzwviHeN4Uc8k2ZeJzCQcMBsZ
hv93MNfcAJR3mwSjBzmo2rtFCdTsSlir7XUbQmAvV4pnzm5Nf3qxEpCD0npPYtA5
TMRU48i7RFvGSQmhg5Fc/cI680OpJ41hANgf1BEC2n+xCdJ7fGn4RKF4Iil0nVXP
WfXLIswy+Bha5o1wMh/nGH8TcHQnP5zCwhi5EmTCxe3Xa6bxjcGuk1ClqTuBDcHG
tAxKWHwf0vJ1EgCxO196Vd55Lhtp+sxIam6uWFzknvSDb7O19pduJE392jTwkXpW
TDKlRQljL1Vf6Gnn/KQy88s0vUMi3TTk4lOXFFQB7ttbtNN8tnA=
=bZaL
-----END PGP SIGNATURE-----

--Sig_/ld6ErslZgT=T4KQyAdL=tl6--


--===============6590503150610269077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6590503150610269077==--

