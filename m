Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A911F4133
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 18:41:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jihJQ-00031g-6A; Tue, 09 Jun 2020 16:41:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LdGU=7W=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jihJO-00031b-O9
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 16:41:19 +0000
X-Inumbo-ID: 05e61e59-aa70-11ea-b33f-12813bfff9fa
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.165])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05e61e59-aa70-11ea-b33f-12813bfff9fa;
 Tue, 09 Jun 2020 16:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591720871;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=rCph44Qv+8B3A8r8KBGK8gj6BdfkmD4uvC3nxBG6swg=;
 b=ijRTWbUCaTdWdwNqSR6p5xDZk0TPx1w4VsDfUz/e8Nw7C2T1NIsaPWlulYaoHbH2rF
 8Tb1FqFJFvfZyZcqnjgtrPIcZeFiTqBR51oBfT/gSRHWLLfgeKbqwujrG1w1gxtokPiE
 zrziWMZplAhreOZm15nUvoG7qowHXdXs1wU3/d1vSaqkUUWMh7XR8jW3+3x4YOcmkGba
 P8uArZfoF1N1QK5Ts5UNLzOr01sTr+AQRfpBknKHrpnvqTOH2MWN/eKtY6cDeBYi8WtZ
 M8yA7Xy8In8z9MpotmqUOcK35pc0LQTkW6Xt5YJKWKJvrSVH035BSsOnLVLsO0SG1kSY
 WQYQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYMxg4g=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.9.2 DYNA|AUTH)
 with ESMTPSA id I09bd2w59Gf7Lds
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 9 Jun 2020 18:41:07 +0200 (CEST)
Date: Tue, 9 Jun 2020 18:41:05 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Rich Persaud <persaur@gmail.com>
Subject: Re: [PATCH v1] tools: fix usage of strncpy
Message-ID: <20200609184105.01ea9b12.olaf@aepfle.de>
In-Reply-To: <E1632643-349D-4B0B-A78C-A06E64321964@gmail.com>
References: <20200608161111.26c2cdd4.olaf@aepfle.de>
 <E1632643-349D-4B0B-A78C-A06E64321964@gmail.com>
X-Mailer: Claws Mail 2020.06.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6RsHom6v_0zYFSK4tN5xo/J"; protocol="application/pgp-signature"
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
Cc: Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 Marek =?UTF-8?B?TWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--Sig_/6RsHom6v_0zYFSK4tN5xo/J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 9 Jun 2020 12:35:51 -0400
schrieb Rich Persaud <persaur@gmail.com>:

> Is there any reason not to take a patch that builds libvchan with -Werror?

The per-subdirectory settings of -Werror should probably become a global -W=
error. Someone has to step up and explore that path.
Bonus points if -Werror could be disabled via configure.

Olaf

--Sig_/6RsHom6v_0zYFSK4tN5xo/J
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl7fu6EACgkQ86SN7mm1
DoBoXA/+LSYk2/sq2Mhh07orSQKklACKgKhFlIQSXWr+ZkNKXZ0WqgBr1bP6VkL9
FEAW9rfP+WSD0KhnsOAX6XA2R1Ox51Y/HutjQcu4eIAaVLXP0N3rknb2ECaOXdIk
V1kJ0fLjEOuhlur9GifLaqUv9W+k0Ifi9+bUcSQAahtvl2fSEAqW1ckazGA8kWFm
BtivVoeH7HKjaR3ay3bVveWQkF/kz3osC332/oDRfbcGDaVn+1bTgqa/lDbt5qZF
iyqRkJsu9jglPV9YcNwfhoFOSe9WhObngELYy6Xx9e+vrYj7y3MlmQjW3l6yzGqe
XkAj+kllSH2m22FLDvqoSWHJGY/3RDX6aE6QhANjYk5m/UWmMiFUVJqfVQmGnmMu
Q4SKsIGco+hJOXTNBd2Mpz2THnxcDUYQdamP2vwWkBC3mBcEafiFa5gqv/ckgoj9
HMK5ZZCTj3QhJn/JYsnO8cGsuvMHfYcl8suHMmg2ft6XFiAvvMuMwRLTElHar8zy
eF1Y0T+AjD0DCwJadfUFQxn8wiUFX/cp+IpPeZw5vdMTytBvj4DGHYFbagfacxaN
Itq052x0Co4tgVflHcaLiniBZvK8iHWiHUOup/KO6gL/fHQvs2btBKfLeepzZh8k
tg88gDp9cptA4xA5BPUse06jN/HPxBdRsbQOvzUVGn+WBRF7QC4=
=qzZI
-----END PGP SIGNATURE-----

--Sig_/6RsHom6v_0zYFSK4tN5xo/J--

