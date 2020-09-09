Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2CB262F05
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 15:17:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFzyb-0004ao-59; Wed, 09 Sep 2020 13:17:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M6/y=CS=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kFzyY-0004ag-TQ
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 13:17:27 +0000
X-Inumbo-ID: f9bb3fbe-2402-41be-b086-461e67c10a55
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9bb3fbe-2402-41be-b086-461e67c10a55;
 Wed, 09 Sep 2020 13:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1599657444;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=aO5AxSwm8rAzyFwwzoADZ9f8UHpyfeNQcbhZppl4Bwc=;
 b=hgLmHX21PSm3g7TgmAOVHXfZfqUolbQB9Pk3BXrUzhelOrnom19c+l7mucjCMTj+OL
 Cgq+gXCQe3b0EvSSsDxLe7MGYFQiPM54oqNGFoDdiJ0vPu01GS7YZu3IMPpSO+h3n6h7
 xUR4/r6uMxgmPH+RqVAKVP8a02EAPhaqKNXripDTO7NwgHwSn6BRUlnsADp9aYnPE46X
 jyURL0K8OJuavjasrL4glq00XMEmF2bFa9FrVjR6nBWxA9TTJsOp2JL2++1P+K0wBBbm
 NLlWB03TwK/uNMa2KYPWNvkOFHwdjitOqVuZ9IHYkDrGJTKxtQOt4hlvGfTD/gdIJ1kw
 oXsg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTWO///A=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.10.7 SBL|AUTH)
 with ESMTPSA id 60ad29w89DHEMDA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 9 Sep 2020 15:17:14 +0200 (CEST)
Date: Wed, 9 Sep 2020 15:17:07 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] docs: remove bridge-utils from requirements
Message-ID: <20200909151707.3d7a3e70.olaf@aepfle.de>
In-Reply-To: <209126b6-0707-0e2f-db2c-1dd492a0229f@xen.org>
References: <20200909104849.22700-1-olaf@aepfle.de>
 <8240eea7-4822-f8f9-75ee-5ea7c2e85630@xen.org>
 <20200909145215.530ca814.olaf@aepfle.de>
 <209126b6-0707-0e2f-db2c-1dd492a0229f@xen.org>
X-Mailer: Claws Mail 2020.07.13 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UIdiw/VqNb/IXV2QUqtbnC+"; protocol="application/pgp-signature"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--Sig_/UIdiw/VqNb/IXV2QUqtbnC+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 9 Sep 2020 14:06:42 +0100
schrieb Julien Grall <julien@xen.org>:

> "bridge-utils (if iroute version < ...)"

A brief search in git://git.kernel.org/pub/scm/network/iproute2/iproute2.gi=
t shows bridge support appeared in v3.5.0 from 2012.

One can barely run Xen on such old dists, so the patch is fine as it is.


Olaf

--Sig_/UIdiw/VqNb/IXV2QUqtbnC+
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl9Y1dMACgkQ86SN7mm1
DoBEThAAhhDU3ZWXpk/3WRLjOm9/R8XW4UdL+nEC+jXi8BnzIgVqpdhjZnTcWt9O
udABktFYqr48fWvl8Sj+rbtypvRHUa34H4p+1Fw1deeJvb9ZaMg4xCOFCZklltTs
2cD3NwkqmDX1Ea4i6THn/O1ze8OYtg9Zj9pQxfgasGsrUQuVscx828xPbZaka5Lj
KGFRh4+AwkDGzVJQh1dyvAMrT4KY3pPnQBXyEQpC/CzKp8bE02N0sMQlCZOCmyaN
hMLPOJm3isiWAankmXCxIi7XSvJ4Ir/4PSPy6jZyKrQIPXkjSeLMX/RIsaD6SLRE
EPng1bJVn1cL4pOYUHB5wmziKfhBP/+ddkcaCZQPrGh8ozJmg0esumUqzoe407GT
nJ5KT7WvIu5n0Ju6LS4aRDmc3+CQHRg+JLHOkmM8jAsO1DUmYU2FBSGCrza6PXpj
z7FlQpzLSyJYFoSt1P3eE1e3iqm9RK4PEEDmnmp+dWjhMQXnePkve42fnYvl1/6O
AhXuzhgZIe7QcYOxZ65PvZHzn3HC+DneR7uQWjZsw6LJTenjFjLlKwzQ+2tjV3w4
kIsLMjVH+NNCApP6KhMZw7PE0wgBT6WtIC5CI69zn1gO5Wou88uApYg8fMeVoOFr
Xbwm2ZrBHRTcSqzyXU70O0BxEQfau2BsOpkDipMenZPQCpfRfzA=
=eTw4
-----END PGP SIGNATURE-----

--Sig_/UIdiw/VqNb/IXV2QUqtbnC+--

