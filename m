Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E537D2017B
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 10:44:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRBwb-0003Yr-Qa; Thu, 16 May 2019 08:40:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ADxN=TQ=suse.com=ohering@srs-us1.protection.inumbo.net>)
 id 1hRBwa-0003YS-7I
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 08:40:52 +0000
X-Inumbo-ID: 4ed02598-77b6-11e9-a1f4-3721791845c3
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ed02598-77b6-11e9-a1f4-3721791845c3;
 Thu, 16 May 2019 08:40:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A95A0AE2C
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 08:40:49 +0000 (UTC)
Date: Thu, 16 May 2019 10:40:46 +0200
From: Olaf Hering <ohering@suse.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190516104046.0f0be4d7.ohering@suse.com>
In-Reply-To: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
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
Content-Type: multipart/mixed; boundary="===============3654579823869478406=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3654579823869478406==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/2gSDmaX+TjUziiycneETy/X"; protocol="application/pgp-signature"

--Sig_/2gSDmaX+TjUziiycneETy/X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 16 May 2019 10:09:38 +0200
schrieb Juergen Gross <jgross@suse.com>:

> assert(b_info->device_model_version);

Is the codepath perhaps coming from libxl_domain_need_memory?

Olaf

--Sig_/2gSDmaX+TjUziiycneETy/X
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN0iDgAKCRBdQqD6ppg2
fkknAKCp9C5EB5ZuzSJwxtQwdGL+gIomMQCeMyQVgBeHuisTbXBexa9XlBzOS8c=
=F9gM
-----END PGP SIGNATURE-----

--Sig_/2gSDmaX+TjUziiycneETy/X--


--===============3654579823869478406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3654579823869478406==--

