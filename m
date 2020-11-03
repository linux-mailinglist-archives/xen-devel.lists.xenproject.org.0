Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FCB2A47C8
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 15:16:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18342.43344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZx6C-0006Vy-Ai; Tue, 03 Nov 2020 14:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18342.43344; Tue, 03 Nov 2020 14:15:48 +0000
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
	id 1kZx6C-0006Va-78; Tue, 03 Nov 2020 14:15:48 +0000
Received: by outflank-mailman (input) for mailman id 18342;
 Tue, 03 Nov 2020 14:15:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ws1C=EJ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kZx6A-0006VO-US
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 14:15:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d42fa0d2-2b25-4e99-925e-86b4702fb666;
 Tue, 03 Nov 2020 14:15:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 61B36ABF4;
 Tue,  3 Nov 2020 14:15:45 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ws1C=EJ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
	id 1kZx6A-0006VO-US
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 14:15:46 +0000
X-Inumbo-ID: d42fa0d2-2b25-4e99-925e-86b4702fb666
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id d42fa0d2-2b25-4e99-925e-86b4702fb666;
	Tue, 03 Nov 2020 14:15:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604412945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=viJwzLFB/ThmL9uDbtzwZKdx+ghvo51wknw6OEPeAuw=;
	b=qlhovEST3SDrr3DP5MSZECg1Cngh2Hz6EuN4AT5QOd7K882jL1bKok/dfkLOyHfHP/gaXu
	0MIv06mGl2pOyilPOoAfaOEx67MFne+q3VAWyoID2cJfRz7MmNYBXj/UdUkdgSaAOkBc3K
	qSUwJl0WE679H+2JY3rs1Opm+9ggHtc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 61B36ABF4;
	Tue,  3 Nov 2020 14:15:45 +0000 (UTC)
Message-ID: <f9ceee15b46bfe66d126644986c25ced1ed70d0b.camel@suse.com>
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?Fr=E9d=E9ric?= Pierret <frederic.pierret@qubes-os.org>, 
	"marmarek@invisiblethingslab.com"
	 <marmarek@invisiblethingslab.com>
Cc: Juergen Gross <JGross@suse.com>, "George.Dunlap@citrix.com"
	 <George.Dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>, "andrew.cooper3@citrix.com"
	 <andrew.cooper3@citrix.com>
Date: Tue, 03 Nov 2020 15:15:44 +0100
In-Reply-To: <2cbcca0b-8415-8f98-46d8-12279703cbbe@qubes-os.org>
References: <30452e9c-bf27-fce2-cc20-4ce91018a15a@citrix.com>
	 <deefd340-ec7a-bbb9-7471-d147da174f4a@suse.com>
	 <a333ea82c12086874f705fc9ea9baa991235edd4.camel@suse.com>
	 <533ce2f2-f268-a70b-fad7-d8f3f4033209@suse.com>
	 <182a90a89cc02beec9760559799e74572e18ce49.camel@suse.com>
	 <9632dc14-46d5-83c0-7e44-0c3bd4f5154a@qubes-os.org>
	 <ce07254a-0775-d35c-559b-7d9ab642accf@qubes-os.org>
	 <b1a18e6ed88db3c40a54c7ca15c3399bdc6f2b9c.camel@suse.com>
	 <20201031025442.GF1447@mail-itl>
	 <c17e7a152a7e1922bd9c729f70a96acf4ca5240b.camel@suse.com>
	 <20201031040817.GG1447@mail-itl>
	 <2cbcca0b-8415-8f98-46d8-12279703cbbe@qubes-os.org>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-7qIAXVtpKc+TNdafpvN8"
User-Agent: Evolution 3.38.1 (by Flathub.org) 
MIME-Version: 1.0


--=-7qIAXVtpKc+TNdafpvN8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-11-03 at 14:23 +0100, Fr=C3=A9d=C3=A9ric Pierret wrote:
> Hi,
>
Hi,

> Some new info :). Marek has sent me a patch (=20
> https://gist.github.com/marmarek/810ae5c079d218928535514b08a07716) to
> help in debugging this issue.=C2=A0
>
Ok, thanks for the update (and thanks Mark for putthing together the
patch).

> With default credit2 as scheduler, here are some log from two
> successive crashes:
> - https://gist.github.com/fepitre/76a1e154249c7326c743d6a6d004a67b
> - https://gist.github.com/fepitre/ab00091980cb8110fb3d349aecc3a644
>=20
Right, this is what you see when you poke at the debug keys, after a
freeze. It would be interesting to see if there is any trace of the
debug output added in the patch _before_ the crash... But I appreciate
that it's not really easy to achieve this.

> Also, I've been testing "dom0=3Dpvh" option and the system remains
> stable since more than 24h. At least, I've not experimented any
> freeze since I'm using this option.
>=20
PVH and what scheduler?

I think it's quite clear that this is not a Credit2 bug, as it shows on
Credit1 as well, but AFAIUI, with Credit2 it shows up more often?

Now we also have a (weak?) dependency on the type of dom0?

What's the configuration that is currently working?
Credit2 +PVH ?
Credit1 + PVH ?
Whatever + PVH ?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-7qIAXVtpKc+TNdafpvN8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl+hZhAACgkQFkJ4iaW4
c+5iLQ/+PJo8dRn3FzNtX1sYTJqKL11g+HK/6jea8VwwYRCF9FBjrbGPxrXwqCog
XviJZuAdDLDTCVPoMX4QCPAypGDnAoIK1TJgt5DzKNrvy/IS1vgMo8B33Cw8uz4x
k65HyAXCAjW3yK5FUCEOjSTQhNIigKuKO/dHiMpfwnBAJjh1mCJEQIUpyR1BD4VZ
iJNjM6Cjiy2GGv966P9mkKF3aGRqI3KtrKq4Hv1GHCPVfEHKYEz8CvfQGTNjKhwo
TSdx8piqO/DF40h7dKRub3ytUa/56CiIU+YAJYXSQNAdxKY8NiVTBm86KXeFS9Wr
xneU0leABfOTcGttYnG2BzVlbZ9aqR21RGsBfWK/MkB7XmYAbB97cx/Ix3Hi2NLi
ZKssk31ImqQoTbVv+kEukmssA6TRvf14ohkqr3TvDP9UKnpsNSOgBAJWn4u55XSH
i+cIzf4Fr6kxHrNl3G2YBNxCcf2ejxh/1CuZi4Nu8u3PPdo9UE78AvHJ1KXSsiZy
RsgWyLOeQVLoZDlOPrFavzjWRLR1LG5WzedfX8Aa5Q/TGEqWxY4CdZ5MRm2FtvVr
wMPryRaMwIUqYJ6W5ZRC+ZXui2xv+baeUsYprC4nXVoe/gKerBxd/2zx//9RWjRR
BDzHO0pjUXcAtAxQbr8cfoQCASJTW54LtHU4e9zgkxS6VB9IcQU=
=k401
-----END PGP SIGNATURE-----

--=-7qIAXVtpKc+TNdafpvN8--


