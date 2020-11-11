Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4550F2AF3D2
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 15:40:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24926.52429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcrI4-00030i-VX; Wed, 11 Nov 2020 14:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24926.52429; Wed, 11 Nov 2020 14:40:04 +0000
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
	id 1kcrI4-0002xt-Rb; Wed, 11 Nov 2020 14:40:04 +0000
Received: by outflank-mailman (input) for mailman id 24926;
 Wed, 11 Nov 2020 14:40:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MbyH=ER=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kcrI4-0002u4-3L
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:40:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61aaa258-2a7e-4bfe-904c-61d76a0fb549;
 Wed, 11 Nov 2020 14:40:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4C213ABD1;
 Wed, 11 Nov 2020 14:40:01 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MbyH=ER=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
	id 1kcrI4-0002u4-3L
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:40:04 +0000
X-Inumbo-ID: 61aaa258-2a7e-4bfe-904c-61d76a0fb549
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 61aaa258-2a7e-4bfe-904c-61d76a0fb549;
	Wed, 11 Nov 2020 14:40:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605105601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=52A7j24ZYNVDVDL+Ly+n0GjKUaYBmcHxz7aOgwt+UZ8=;
	b=LAEOAxkTvohz43y+0/Ddm2t9AS2IotAPyI0GgDyeQWR4l9ggF25J6qQch+qV7l/PMR+U5i
	H2wN/odK9YnI72E5LJxq+pdFj9h6x6nqazvT6CxwXaKj1sH1pDLVXdEyX5/nqw/eJLHIA6
	Zn8Nx6LCS+rvAtymv/jUw07iNTWSW98=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4C213ABD1;
	Wed, 11 Nov 2020 14:40:01 +0000 (UTC)
Message-ID: <42fff7efc4c7233dccc16e8770ca4f00524a20c4.camel@suse.com>
Subject: Re: [PATCH 04/12] xen/sched: sort included headers in cpupool.c
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>
Date: Wed, 11 Nov 2020 15:40:00 +0100
In-Reply-To: <20201026091316.25680-5-jgross@suse.com>
References: <20201026091316.25680-1-jgross@suse.com>
	 <20201026091316.25680-5-jgross@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-RMoH63XT9zHnsAhav4EH"
User-Agent: Evolution 3.38.1 (by Flathub.org) 
MIME-Version: 1.0


--=-RMoH63XT9zHnsAhav4EH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-10-26 at 10:13 +0100, Juergen Gross wrote:
> Common style is to include header files in alphabetical order. Sort
> the
> #include statements in cpupool.c accordingly.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Acked-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-RMoH63XT9zHnsAhav4EH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl+r98AACgkQFkJ4iaW4
c+4C7hAAn3lRHR+V5orIxlqGqPGr++U0iabbxRmgWTNMTTI6yTS63GhcBclrUB2/
vxnAuCjUxFdK/RfSRz1K7aYCvyF2jkT/Ce19nA2+Xs3aqPqz6fPbUQoM6jw0NE6j
LmgkHuBvBMfnKk72jykgNyWJBRsUwIHDZD2YSAoZatyQBBhpGFf64h3CiQm3x83y
6yyw0EtVsfkZZWZ5UvDO7lBs/rMrYgep7sXcAaZU9BAADsA12nGmUx4PGZz41but
KQC2d/C/cUYNUS6OvkIqV/m7LPUjaYOuozzyVws/T2ij5ODRpL/Fry5pGgOmy4a4
szRJbESVRY+WNImox75cLZC91UDYAYD29nHkX9jw33V68P6evW129T4c914ORs4Z
nZN5ja1Gne6fi/O/zsTd1047YzBCbfTQTsQWiHIA0ltYhENmYpJP6LQPCy5GewZR
b56jAOsdNauQ5nJK9T5+tgVxnAY8Uo4GMtvbzqa9TVsEjaaGvFBzYUj+Dtymcu3X
h6UoOQ2VrGRWaOHhU71KcbwTW8fbdn3h6Pkhe24gz/k+ufepRCkbmBhXuIFe4CpN
HTDGWDfH9gL4qBWlAs4nM75gSV5vX8ZTiVZ5Xt2S9SCYDoNPON+UYaBU60xUHHBA
14jAWD3TdQE9iahlmLljVQpZi16Y+DXiAM57LXWgPdaWHFqLK0U=
=ihQQ
-----END PGP SIGNATURE-----

--=-RMoH63XT9zHnsAhav4EH--


