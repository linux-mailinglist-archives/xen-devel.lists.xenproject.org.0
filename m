Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ED92AF3CB
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 15:39:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24914.52404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcrH2-00029A-9A; Wed, 11 Nov 2020 14:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24914.52404; Wed, 11 Nov 2020 14:39:00 +0000
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
	id 1kcrH2-00028V-1G; Wed, 11 Nov 2020 14:39:00 +0000
Received: by outflank-mailman (input) for mailman id 24914;
 Wed, 11 Nov 2020 14:38:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MbyH=ER=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kcrH0-00027y-Mc
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:38:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 401e0563-ef10-4f46-8bbf-f43382260f44;
 Wed, 11 Nov 2020 14:38:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2E461ABD6;
 Wed, 11 Nov 2020 14:38:57 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MbyH=ER=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
	id 1kcrH0-00027y-Mc
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:38:58 +0000
X-Inumbo-ID: 401e0563-ef10-4f46-8bbf-f43382260f44
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 401e0563-ef10-4f46-8bbf-f43382260f44;
	Wed, 11 Nov 2020 14:38:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605105537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pOng3H3SkACgPUo/cvkAnhlDFfl0u6MHRepjUierqGw=;
	b=swETySJW/7Et6CJ2EFtxVQpdbfCibRmOsmZNXAHPoJn3RoWbqlgb3Akl2VUK2923DC6pzH
	OuzGR9A4gVTt6fpSAzSfsbe9AIIeUkS7JHVpKSvemnHVNumjoLGYiBKhIa+hRVZtz3NmsP
	xhmro3TJ+tpgviXTEvCU47dsxRiMEEY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2E461ABD6;
	Wed, 11 Nov 2020 14:38:57 +0000 (UTC)
Message-ID: <75b3865855dfc3e1771956b0be02e436fbebd71c.camel@suse.com>
Subject: Re: [PATCH 02/12] xen/cpupool: add missing bits for per-cpupool
 scheduling granularity
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>
Date: Wed, 11 Nov 2020 15:38:56 +0100
In-Reply-To: <20201026091316.25680-3-jgross@suse.com>
References: <20201026091316.25680-1-jgross@suse.com>
	 <20201026091316.25680-3-jgross@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-aBqizUb7ttVW8cIAewUU"
User-Agent: Evolution 3.38.1 (by Flathub.org) 
MIME-Version: 1.0


--=-aBqizUb7ttVW8cIAewUU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-10-26 at 10:13 +0100, Juergen Gross wrote:
> Even with storing the scheduling granularity in struct cpupool there
> are still a few bits missing for being able to have cpupools with
> different granularity (apart from the missing interface for setting
> the individual granularities): the number of cpus in a scheduling
> unit is always taken from the global sched_granularity variable.
>=20
> So store the value in struct cpupool and use that instead of
> sched_granularity.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-aBqizUb7ttVW8cIAewUU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl+r94AACgkQFkJ4iaW4
c+4w9Q/9FcB2E9jZohGyFTWalQ6aigUZ44bBHWsECfU8o2quZ5O633m4r6pGcu1a
7x+L5/gLYZJElpR0qXck3NTn2Q3H0EG/hTXdUdn1qGStTqagxJsr2lduotaGOob4
esBN7Z0yYOUulrXAbvXPh3ofAscHzohf8bMrHFjpvz3LtME16rCYgxeJLfVIaTHp
2B1SlgqfppbmocGHsY2W23o7inVf/pMR+OV2TYReoeFMpKyNvjREieqdaE5Fof1B
+2Kk6IswIytdNz/kqs1tzDmr/DHai91pwDzVR69anPwM83X5VF36I3j9Q57B+AzN
ud5T2boJSvZaH6DAFGr2bvImZIFsY0NGEtEwgGHb18AV0enzLZQonOP23t6WmY0l
lvaqaihjeDk5RERHVD5JEKCnOJOCs1PLSky+gDcHdQ4I9K6ikBB9o3PnJe2GqnDC
xvDRi49zsnlnkPae8ZQob0Zq7qfFTY4HB8I1ON7bG6DwnLYEkOjvJwdmxN4b3ghe
Tmh9uAjK/w7hRaQN+LiJLkc603Axlyd+Cskr7CWblwaZUe3pAsKHq7RL/UfwvnP1
pxhMi49A/5RYnaWFGzYytpkCC/orsJwPRNtHkmT3L/XNT9sh1wYpOhnZrarVKqS/
DGJ0fk6/9bdgnrwcyk/F4BS65YmRvzv8L7WRpnqa70XpyZYSVXE=
=92Hf
-----END PGP SIGNATURE-----

--=-aBqizUb7ttVW8cIAewUU--


