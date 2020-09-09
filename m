Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1154F262F64
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 15:55:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG0Z0-0008Q2-QD; Wed, 09 Sep 2020 13:55:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M6/y=CS=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kG0Yy-0008Px-VB
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 13:55:05 +0000
X-Inumbo-ID: 7b6180ab-6974-419a-b048-ffdbb620240f
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.53])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b6180ab-6974-419a-b048-ffdbb620240f;
 Wed, 09 Sep 2020 13:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1599659698;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=OQA2WjBh4LFroiwqbPqTpEfxVUlG21VNYEfxWAzAJs0=;
 b=JQmEI902WQZbThui5OhPlCnk3AKxMQaXDLCwTjaz7S06jR5HBWB+Vgi88jdA8WIWxR
 2dTJUujlcZjI7r8QYkqXbVUwOY9gGnoT5BEUegvKZawotIbWKAhxKdjwB+OByxfUmNBg
 y0ipBScgtff6Y2cQYSgYbIx0Hi+egrb9/P0dUXLZfbTts+c5gT7+IZu42rlFsAS66hjf
 8++lDkQTTobZS5gmVppfJXBiDNkmaR/6diGhbscHJ9J7uHcI9NpBg0atqADaEdtBf7pw
 BfyAmGcEo3kKGmfZCxStKbwT0SLtrG/G9HxJW0fPwyS2Z/XlkW6s4KE0XOHaCA36nfjo
 5O1w==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTWO///A=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.10.7 SBL|AUTH)
 with ESMTPSA id 60ad29w89DsmMR2
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 9 Sep 2020 15:54:48 +0200 (CEST)
Date: Wed, 9 Sep 2020 15:54:41 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] docs: remove bridge-utils from requirements
Message-ID: <20200909155441.4aae56c7.olaf@aepfle.de>
In-Reply-To: <bc70e498-50c8-5667-b535-48126847ef85@xen.org>
References: <20200909104849.22700-1-olaf@aepfle.de>
 <8240eea7-4822-f8f9-75ee-5ea7c2e85630@xen.org>
 <20200909145215.530ca814.olaf@aepfle.de>
 <209126b6-0707-0e2f-db2c-1dd492a0229f@xen.org>
 <20200909151707.3d7a3e70.olaf@aepfle.de>
 <bc70e498-50c8-5667-b535-48126847ef85@xen.org>
X-Mailer: Claws Mail 2020.07.13 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Mq=SATHVpMm9qWN_wx0T8OK"; protocol="application/pgp-signature"
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

--Sig_/Mq=SATHVpMm9qWN_wx0T8OK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 9 Sep 2020 14:43:28 +0100
schrieb Julien Grall <julien@xen.org>:

> If you think that bridge-utils should be dropped, then please send a=20
> proposal to remove/deprecate brctl.

This was already done with 0e7c69bd3c0b35a677d73843b39522787ccf5a3f.

The current code is just the simple form of a fallback, it does not represe=
nt the fact that brctl is the preferred tool. 'ip' is most likely always pr=
esent, but finding its capabilities is probably cumbersome.


Olaf

--Sig_/Mq=SATHVpMm9qWN_wx0T8OK
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl9Y3qEACgkQ86SN7mm1
DoAcgA//ak4hsS/HtuRhN/IdDQ+ZFiQIuQ4R4HbzYLE6LICm4Qi+YszQT652DvSo
gKrcQtSIdUiV81KTBsl6cY76HdkMsIFsauVYws0PjCLDC4OrDSzcMhwuhTy9+Xjn
r0gJX1FDxw/hUzug1oR8e77ta6hLgD/LNjpeiwhvewFXpGVWT16Us3r8lGM9WBC2
DY7DBCqjvVLH6o2CzzNEHT4f9CuzPgP984N8P+28DbYNH/2kVauwlSvofBTlmeHA
WSuI+rqEdhdyqWgDUDt0uQ9PwRiP9mKmKYrI82q4MR/So6V7d3nBaM+ZzS2wuqcL
R55+pI4aJas4ebOhrVCRVq12FtNMvoEoc6fywLM401nT0mNiz1WaJfChqRbCZeGH
qSu8cwSeCeNtE6eHhZz9yI3vXX0lEo79u9aQ7yyBFrF6pacnwAF3IrwWaF/NvJGD
DqzJpzkMYnSTUFjQootJaVmBB3Pg+5J0AmX2gOWKFeCrF/2JEK1T/744V3JmYHxN
SQy901k1Rw8LlTsuKljs9j492GJ+y5XanzmrDmftxvc+7tkwHUL8kIAnTJA4WbsT
yrLoo4ST+qbmqsoxvA2C5x7rbAtjrrKbzH05WYnAryp6teXErP1HDfvsxETGvN7W
7rOiQR5nQKg0AmBy4/OEiAdt02o/j99WhRtO48ZyNG/qunzV7sw=
=Yhxk
-----END PGP SIGNATURE-----

--Sig_/Mq=SATHVpMm9qWN_wx0T8OK--

