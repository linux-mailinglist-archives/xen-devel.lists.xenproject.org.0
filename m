Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C762015A
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 10:32:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRBmf-00022D-Cs; Thu, 16 May 2019 08:30:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ADxN=TQ=suse.com=ohering@srs-us1.protection.inumbo.net>)
 id 1hRBmd-000221-T7
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 08:30:35 +0000
X-Inumbo-ID: dfd81c95-77b4-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dfd81c95-77b4-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 08:30:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 326AFAE8A
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 08:30:34 +0000 (UTC)
Date: Thu, 16 May 2019 10:30:33 +0200
From: Olaf Hering <ohering@suse.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190516103033.115ad35d.ohering@suse.com>
In-Reply-To: <20190516102706.4766f2c3.ohering@suse.com>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
 <20190516102706.4766f2c3.ohering@suse.com>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] Regression in xen-unstable due to commit
 3802ecbaa9eb36
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============7306907997845858140=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7306907997845858140==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/CstxQM8NmZiEmZYZ8ZA29sA"; protocol="application/pgp-signature"

--Sig_/CstxQM8NmZiEmZYZ8ZA29sA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 16 May 2019 10:27:06 +0200
schrieb Olaf Hering <ohering@suse.com>:

> Am Thu, 16 May 2019 10:09:38 +0200
> schrieb Juergen Gross <jgross@suse.com>:
> > Has this patch ever been tested to work? =20
> With PV only. I will have a look.

It happens to work for me:
xen_changeset          : 2019-05-15 16:19:57 +0100 git:2a556b63a2

Domain-0
pv_sle12sp2_c_qcow2
pv_sle12sp2_c_raw
fv_sle12sp2_c_raw
fv_sle12sp2_c_qcow2

Maybe I misunderstand assert? I think the point is that the member is not z=
ero.

Olaf

--Sig_/CstxQM8NmZiEmZYZ8ZA29sA
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN0fqQAKCRBdQqD6ppg2
fnkPAJ9Xm44JY84rojucvO2z35GdGCoe2gCg2QtXhEBym7ON9X3yFF9l2wzzkEU=
=1vnB
-----END PGP SIGNATURE-----

--Sig_/CstxQM8NmZiEmZYZ8ZA29sA--


--===============7306907997845858140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7306907997845858140==--

