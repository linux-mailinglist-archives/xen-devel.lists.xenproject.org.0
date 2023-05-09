Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B338F6FC7C3
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 15:19:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532201.828294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwNFM-0000Rk-EJ; Tue, 09 May 2023 13:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532201.828294; Tue, 09 May 2023 13:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwNFM-0000PH-BA; Tue, 09 May 2023 13:19:16 +0000
Received: by outflank-mailman (input) for mailman id 532201;
 Tue, 09 May 2023 13:19:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jxqG=A6=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pwNFL-0000P6-2r
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 13:19:15 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.23]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16b57bf8-ee6c-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 15:19:12 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz49DJ95vk
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 9 May 2023 15:19:09 +0200 (CEST)
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
X-Inumbo-ID: 16b57bf8-ee6c-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1683638349; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=GRiBNU2amoEyyJJhmK5Is9uO3Ekfn8meC6iqfYwqjOijRLCZYAhNuju6sKXtBpi5Sj
    mKc9Ss7O5jYYaJvxyRanUNnBfswav+UvEinVP0MnSqA8Tgc5hSrtSWfhw3wHlBA72NOF
    jReajvxj4YomOfuAXXDcqCST33uuzkm04A48BMhr5Lk3l3zdCLBievNV+s29UyCirse+
    JBIcT8OwY7+Zub4y5sEkAY9R25rV82GYrBl97fRHfnMrjB5yMVcMSFbzbePQXrtNrAEu
    dgWJwVZVvd6u7C6aeNri5j50Y2SkJlWCQ4rdIUwWXXthzSM+gsB6SBtAnhHvRYrXH2zP
    HTCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683638349;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=rpuULCw5A7ilt2bXrFeg0Vy8Af4vXwqUM0zRdW+DNBM=;
    b=Mgk9WGkXHV45+gDRCXJoqNsLz0r4mz1JWNfXseGYkesIOojnVIaV+/WU1J8AfDBbj2
    3zsZIL0ENyUfX10mt8gAeUgl6aPBrIz10/rxj96M31EeDF4AMHRDnpmxoAmrb/yxeBU1
    Z6wUWoRJ3blFrreD3nzMLB8JmJ9ZNGho+hlmHCpWdVPySl+aEtdjHuh8pdXCmIk77gAX
    kcE/GXJI1qqj+cHLWKkhSojILDAfb0xbdj9LFmEXlaWp3MLbp3EPWGyFdLionrvP+PMH
    pn1NkQIxBDpb1/CAWgtCYik8Rdzq7Lq+MX1JPNxNhSxfk+mKjXHF2AA50Kt/4J3aVyD6
    +XAg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683638349;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=rpuULCw5A7ilt2bXrFeg0Vy8Af4vXwqUM0zRdW+DNBM=;
    b=JurmNDJ24tIKdKnUeKka3qhwunZJD9BCwS3I9mSJ93JZgUj08ClUWtIxuPvZO0CRaT
    zySmTWVmNl3QYtsNhYnGUrYwx1DCoAiWY/h9Ue/OwN/f2p6WlWqT6ONkZknR3/Ew0NGB
    qpLUCkyDCeVrT/rSK0f9G3EAtz8QomDxEvj9wEUtASPX5sILyIEZkt6pxvdszotRJEQQ
    fSFXcdXhNQY4qxqmW6aUPtyyWVoBHhQryf2H47c100zSqHb9NacVvJE0mapw/7gsEPng
    VuvUE0M383L+zjfqGZ6QuzzthpdPNoYDAnX6WCo7M0uA364gyzvedYMCRc/GSFDxNvOV
    2AGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683638349;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=rpuULCw5A7ilt2bXrFeg0Vy8Af4vXwqUM0zRdW+DNBM=;
    b=nxwhfRaeM5n8fK+0IxqCzztC4mY5uR60xqLFvmI6fIoE1e3BHIbL3qhli9epoaVBaG
    sBTPJNg2NP1ZGdp3VfDQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR4ARWIYxzstZKeVom+bauo0LKSCjuo5iX5xLikmg=="
Date: Tue, 9 May 2023 15:19:02 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>, Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2] Fix install.sh for systemd
Message-ID: <20230509151902.391b1bff.olaf@aepfle.de>
In-Reply-To: <0785a316-1920-f5de-61d3-ed21ddbff0b9@citrix.com>
References: <20230508171437.27424-1-olaf@aepfle.de>
	<0785a316-1920-f5de-61d3-ed21ddbff0b9@citrix.com>
X-Mailer: Claws Mail 20230504T161344.b05adb60 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Uod6fEfg8EmAfoVpyfp8Ud7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/Uod6fEfg8EmAfoVpyfp8Ud7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Tue, 9 May 2023 13:47:11 +0100 Andrew Cooper <andrew.cooper3@citrix.com>:

> > +++ b/tools/hotplug/Linux/init.d/xendriverdomain.in
> > @@ -49,6 +49,7 @@ fi
> > =20
> >  do_start () {
> >  	echo Starting xl devd...
> > +	mkdir -m700 -p @XEN_RUN_DIR@ =20
>=20
> Why is this 700, and the others just using regular perms?

I think the permissions are just copy&paste from elsewhere.
I have to check why -m700 is used anyway, and why it is not used consistent=
ly.

> Also, doesn't it want quoting like the other examples too?

There is a mix of quoting and non-quoting. Not sure if having spaces in any=
 of the path names does actually work today.

I will double check this detail as well.

Olaf

--Sig_/Uod6fEfg8EmAfoVpyfp8Ud7
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmRaSEYACgkQ86SN7mm1
DoDB+xAAkapUr5jz3U2KvFAEawzjuRpqfUUe4k6MThz2aTInWcgRZ/ZIzlbVKyXZ
yhzRawy3YX2c2cPjz+DCO4U941BP9i29LFVpXrplWQ9lxP5BwjBgvDMkNx7dvBho
lJ6wWQLWxYhgHPH1dLV/V1TLyj2k2eJHsJEH3zMEPUvqw/YT6Ex/B3p9J3ukqUt0
evsjoOZZcyI/WqAw2ihz3FRvUTv7bJLKjC0KzwmCjbjR9PsvGsuUVxXPpws4w1Ki
/eOCoN3ZwmAicCe9VQ7aGR6moVZhEjN+Nm+AoTsnPWHuypdihLAMiZRcNn5loRqf
yY7cyr/h2P4wqomsHLeUee5tJ0wTFfO6lcCJ2tndSWKQggP8YHe9gDktSPzYoawN
XTgFf2OJvMhj3iYkhHwpzw98nb3DSEK5+VyhrUkemeRZ4uMH+r1PjpPldY+zTAdm
KmUnDhcSnbsm9u0XdngmJA2gDk9CuFWkYzCTPFPlJk8GBDiTPFXAljOTC+j1lX3A
qd7974W3pWQgtHt8SLJM6ysUZpa7zKbxGyrZpy+nXLhYUG+GPfGIFYiWLtVFRo1Q
7br3a8u3zeNFVPTP1j753KveqqnKQKQzUVRLSbkUZcvuHov6Bt8/AFwNZxiSNcKF
g2nBXy8ChMaKUJx6vlg/dSEhyfn/nHBYp4s2xPeMNbQvwZUUXis=
=VaDW
-----END PGP SIGNATURE-----

--Sig_/Uod6fEfg8EmAfoVpyfp8Ud7--

