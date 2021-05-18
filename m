Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 237F5387B3F
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 16:36:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129290.242708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj0p9-0006T1-1v; Tue, 18 May 2021 14:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129290.242708; Tue, 18 May 2021 14:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj0p8-0006QS-UG; Tue, 18 May 2021 14:35:54 +0000
Received: by outflank-mailman (input) for mailman id 129290;
 Tue, 18 May 2021 14:35:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4/q=KN=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lj0p8-0006QM-Ao
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 14:35:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26de69a1-aa8c-4acd-b3da-b5bea3fc50a3;
 Tue, 18 May 2021 14:35:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F2A87AEF5;
 Tue, 18 May 2021 14:35:52 +0000 (UTC)
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
X-Inumbo-ID: 26de69a1-aa8c-4acd-b3da-b5bea3fc50a3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621348553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s7941cM5/hhFGV8oIKLdXJ1XaE5cl95i2/P5PmmedkQ=;
	b=EnnHyTa1HOrDR0nFas/Ow1fvntDRZA2xjXPr3fzF4r31TO0QjK4fqF5y0Ku20kUjL7f2mE
	ghDf5GdaVaSUs9wNpmJS2HvRDBH+EIYe/KPlIcGgngFW6dKS6/yYqFjAIY7pf8GE20L98/
	PKQMGsFDVmx7xJ2OQKMjABsKI3LIi84=
Message-ID: <ed78f3c1aa4c31fa57ec6f9898a309ad0781b367.camel@suse.com>
Subject: Re: [PATCH 1/2] automation: use DOCKER_CMD for building containers
 too
From: Dario Faggioli <dfaggioli@suse.com>
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Date: Tue, 18 May 2021 16:35:51 +0200
In-Reply-To: <YKPOqwiiXqOZZ2cO@Air-de-Roger>
References: <162133919718.25010.4197057069904956422.stgit@Wayrath>
	 <162133944760.25010.12549941575201320853.stgit@Wayrath>
	 <YKPOqwiiXqOZZ2cO@Air-de-Roger>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-gXoIaqaTIx4oDURcQPRZ"
User-Agent: Evolution 3.40.1 (by Flathub.org) 
MIME-Version: 1.0


--=-gXoIaqaTIx4oDURcQPRZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-05-18 at 16:26 +0200, Roger Pau Monn=C3=A9 wrote:
> On Tue, May 18, 2021 at 02:04:07PM +0200, Dario Faggioli wrote:
> > From: Dario Faggioli <dario@Solace.fritz.box>
> >=20
> > Use DOCKER_CMD from the environment (if defined) in the containers'
> > makefile too, so that, e.g., when doing `export DOCKED_CMD=3Dpodman`
> > podman is used for building the containers too.
> >=20
> > Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
>=20
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>
Thanks! If it has not been committed yet, can I resend with a From:
that makes sense?

And, either way, sorry for the noise... :-(

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-gXoIaqaTIx4oDURcQPRZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmCj0McACgkQFkJ4iaW4
c+5WrQ//VlOJqmIql6hOwuDum3kWmUQpFwYnVsPhoXv3iHE4YQeSwGuVZdwDmizt
XvPwr8Y7OXbv4X50Hw1L8M3MDJnyIPeALDOc63Qp6rzn5nlLvrqBaCn6SW1OVfvn
C+8qSXtenM+jnqKtTPuw7esEzbiy0GhXT5a/ciH4gtPdzL7syZeUkxDdDOxe5eEe
bo8FiM5a70fukkSXOM4wm+CNigBQH4En/aACB0JoQwQRXuM5c3A6BwO/WE3/Pf3+
CAd+5opcz218jfL38WGjsmJ/xJ/tv48PUsSsu7st35f3m00RDHsh7yWGgITZkD/d
nONEnJMSSf3i6Ll1Oiz2o84LMKqWwiIsXQA4B3KsN9qvzEkcnRvJ2Gb36oXdwbby
pya2gbUn43WITDrGo+1Jn+l4UCx/YFC3M+bWjCIOa/CEx19sybcdigh5ubB7rqE7
izeVe0KU/syLHGUuu2psdfX+2OHVaytYlqpeU7dLidu4RI8iaNd7icSC9Ff57Khv
FF9xAEOcMxfI43PkE+5YK9eAOdyTEPZt6XdzzJvtnccUP7ZV6vkNDQpr3CZz8fcA
/nTBalbUvKoZDGhTkZlcyaxAyHdFbjjTdgLOHs4eICsFrQmrQENV1sb0wdEHhOfZ
1A7RmYumh1JINQzmzBlyAEXEG0I4OdPoprC55x9tac+RhOH3ZaI=
=HICx
-----END PGP SIGNATURE-----

--=-gXoIaqaTIx4oDURcQPRZ--


