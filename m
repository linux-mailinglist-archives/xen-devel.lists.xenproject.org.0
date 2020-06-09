Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A28431F3724
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 11:37:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiahJ-0001s4-NF; Tue, 09 Jun 2020 09:37:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LdGU=7W=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jiahG-0001rY-U9
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 09:37:32 +0000
X-Inumbo-ID: d56c93b4-aa34-11ea-b2f8-12813bfff9fa
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.165])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d56c93b4-aa34-11ea-b2f8-12813bfff9fa;
 Tue, 09 Jun 2020 09:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591695448;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=Zn/pXRjO5vbTfIwqoQSy1CtR0CnKp80YdW24gR5AxKA=;
 b=YP+4WqfmsrQ4KcNmpVz0r+HXxgWznN71cpOSP/MNdPAheBii6SkE7UyikPk6uVDdlY
 9zDA6EsUtER6BdYKV/hnnUDQpVS0ezfvGR+lzmHxuYOLbSg2uY1KUY2iscrAnCzoqBqe
 x0c5ouRtSLSVRk4awcFpv8izuR1Y9P9d1cx430p7vJix0KGFxx8oCCuayNTX+IIjx2cD
 b3PX8D10HFFbgyvf0rCzqk24uuhdyqUg50iGMKKGne9PyJ9JzfgixKxek7xtVcThSxo3
 SKf19HkWs44t3OUQaqnW7URifucmCUCW8sc23HKp1DRuHNP2gmrx7HlVzgprZuAnuexh
 YDCQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYMxg4g=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.9.2 DYNA|AUTH)
 with ESMTPSA id I09bd2w599bOJmM
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 9 Jun 2020 11:37:24 +0200 (CEST)
Date: Tue, 9 Jun 2020 11:37:08 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Paul Durrant <xadimgnik@gmail.com>
Subject: Re: [PATCH v1] kdd: remove zero-length arrays
Message-ID: <20200609113708.01d64a93.olaf@aepfle.de>
In-Reply-To: <005f01d63e3c$fcf84fe0$f6e8efa0$@xen.org>
References: <20200608203849.18341-1-olaf@aepfle.de>
 <005001d63e3b$c85059f0$58f10dd0$@xen.org>
 <20200609110016.16a52277.olaf@aepfle.de>
 <005f01d63e3c$fcf84fe0$f6e8efa0$@xen.org>
X-Mailer: Claws Mail 2020.06.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gjpsBezG2SDuPjegf_Kv978"; protocol="application/pgp-signature"
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
Cc: xen-devel@lists.xenproject.org, 'Tim Deegan' <tim@xen.org>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Wei Liu' <wl@xen.org>,
 paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--Sig_/gjpsBezG2SDuPjegf_Kv978
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 9 Jun 2020 10:04:30 +0100
schrieb Paul Durrant <xadimgnik@gmail.com>:

> OOI which compiler (might be worth mentioning in the commit comment too, =
for reference)? I'm not seeing a problem.

This is from gcc10. I think the build automation for Tumbleweed will show t=
his error, unless the Tumbleweed image is older than a week.

Olaf

--Sig_/gjpsBezG2SDuPjegf_Kv978
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl7fWEQACgkQ86SN7mm1
DoCG8RAAggyNYva97bMCqqAbSoLxbLLq2ViptaFg5XjSvc8nI2I64/ifusGRJfM8
91Wz9qUZOg5tGObABRm4VDxtT1F83ReUFgDuIHCulQpI7ljhyXs7njRAiCZpci63
HcOfscyXrq0pd26Nm6gxqjFeKCCXDe/r+JA0gqHk4faI+gY08hP3nmpWyri2Uww0
RQQ8jjDgdV3ZVWQt1MMCmB9TlWn5iH9wh9EKykXvkb93GaawuvQ5rqMn20OC3Uu2
1dDbwt4Sh36PEDRYZ604Hu3k6qEOYYjNG257pIaISbd6Xy+apnP7z7VtAOZMpmmy
iiMCvo074RDlu9mzWoyYvDbIeg1kBUbpKugDYx2gFLwzSd5yr+Kx437WbGeGNpX5
rEoOgKI+JltF56SAVH8nz8OGmyFeZTk4DiueH+ZtYXTladQWsq8lVx+G2OUnB57x
jo0WwEFah/71WM9Pljl1ZFg2gfE3vVJelnt5HDObrFAj4g9lVDSANTpDbxOtKsSl
Rzv3vYSBzKiBabZ+KNmmszi8xK/dOkgoJuctonJ15vOOE3UKaZTOcfZk0Cq9tIwl
pX6lwU4bWeIMqu0s5dcsNTTaZYFpY/v0ZdLZRh+9uX7L5dH8MIXCXATAlWie5Gne
oJ4ABPabvlb3CsaYiSbToMTrnxVwELyON3zrKIK0q2Uo8iAMo78=
=I7e1
-----END PGP SIGNATURE-----

--Sig_/gjpsBezG2SDuPjegf_Kv978--

