Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CC83205A0
	for <lists+xen-devel@lfdr.de>; Sat, 20 Feb 2021 15:07:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87235.164367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDSut-0001lB-81; Sat, 20 Feb 2021 14:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87235.164367; Sat, 20 Feb 2021 14:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lDSut-0001km-4x; Sat, 20 Feb 2021 14:07:27 +0000
Received: by outflank-mailman (input) for mailman id 87235;
 Sat, 20 Feb 2021 14:07:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oPX6=HW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lDSur-0001kh-SL
 for xen-devel@lists.xenproject.org; Sat, 20 Feb 2021 14:07:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0737046-ddbf-4640-bb69-b00800279e07;
 Sat, 20 Feb 2021 14:07:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 47CD3ACE5;
 Sat, 20 Feb 2021 14:07:24 +0000 (UTC)
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
X-Inumbo-ID: c0737046-ddbf-4640-bb69-b00800279e07
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613830044; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MMZfLI3uSSTyMFq/1E6/fns1dfniD+o5WsiH6Zsxu8c=;
	b=UeBW8f7u1ZVbP5sTmbC8YGvgPh1TDFjTJ78ZLbynUweGo/HaZc/CW9Ccdr+pvsXp61a445
	gbprASPvOG/kB36Y0BlXVAvtYpEkBwh89v1MIgAJ0Tgzjm+3htizYvADJyUW1S4RnEvMc0
	h1SBmObTQa7Ap2G+lRjKn+lRKC7V1TY=
Message-ID: <7d4d108c183f9eea160c14547d59c1dc4b22158c.camel@suse.com>
Subject: Re: [ANNOUNCE] Xen 4.15 - hard codefreeze today
From: Dario Faggioli <dfaggioli@suse.com>
To: Ian Jackson <iwj@xenproject.org>, committers@xenproject.org
Cc: xen-devel@lists.xenproject.org, community.manager@xenproject.org
Date: Sat, 20 Feb 2021 15:07:23 +0100
In-Reply-To: <24623.60318.719046.601197@mariner.uk.xensource.com>
References: <24612.676.586372.372903@mariner.uk.xensource.com>
	 <24623.60318.719046.601197@mariner.uk.xensource.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-bxxQY4/QTmO061hEvqbG"
User-Agent: Evolution 3.38.4 (by Flathub.org) 
MIME-Version: 1.0


--=-bxxQY4/QTmO061hEvqbG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-02-19 at 16:47 +0000, Ian Jackson wrote:
>=20
> OPEN ISSUES AND BLOCKERS
> ------------------------
>=20
> F. BUG: credit=3Dsched2 machine hang when using DRAKVUF
>=20
> Information from
> =C2=A0 Dario Faggioli <dfaggioli@suse.com>
> References
> =C2=A0 https://lists.xen.org/archives/html/xen-devel/2020-05/msg01985.htm=
l
> =C2=A0=20
> https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg01561.htm=
l
> =C2=A0 https://bugzilla.opensuse.org/show_bug.cgi?id=3D1179246
>=20
> Quoting Dario:
> > Manifests only with certain combination of hardware and workload.=20
> > I'm not reproducing, but there are multiple reports of it (see=20
> > above). I'm investigating and trying to come up at least with=20
> > debug patches that one of the reporter should be able and willing
> > to=20
> > test.
>=20
> Dario is working on this.=C2=A0 Last update 29.1.21 ?
>=20
Yep. A have a few more insights about it, but still not sure about a
few things. I'll try to give a more detailed update on Mon or Tue

> G. Null scheduler and vwfi native problem
>=20
> Information from
> =C2=A0 Dario Faggioli <dfaggioli@suse.com>
>=20
> References
> =C2=A0 =20
> https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg01634.htm=
l
>=20
> Quoting Dario:
> > RCU issues, but manifests due to scheduler behavior (especially=C2=A0=
=C2=A0=20
> > NULL scheduler, especially on ARM).
> >=20
> > Patches that should solve the issue for ARM posted already. They
> > will need to be slightly adjusted to cover x86 as well.
>=20
> As of last update from Dario 29.1.21:
> waiting for test report from submitter.
>=20
Report recently arrived and was positive. The issue, on ARM, is solved
by the patches sent to him. I've done the x86 bits of those patches,
but am still debugging an error I have with them applied.

It probably make sense for me to properly submit the two patches that
fix the problem on ARM right away (the x86 part would be in its own
patch anyway).

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-bxxQY4/QTmO061hEvqbG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmAxF5sACgkQFkJ4iaW4
c+50hQ/9F7mlWOPo8CpEh24+Jtl6HZAvYL1eLb/WmyGFsJ5QrMYIhd2PC2tMQEvF
G+jRMUbIYvd3rq+lMZzwBAtNZM3AIQCMQGS4H7EUnPKy7Zu0zeERK9PEVehCzhC5
rJr4AbPK2AFSDvlwjFBMtvioIZXFNsCgbKwpvv1uYJpAnRi1QV5c3yIHNvDVZZOS
bcVN07Z/2bGpW/hdCzvLn5JSc0vinN2zvhTq38NWo5QB3Z5Mh2/nyQ3tF0C4YKnB
IV7sqlluWzjAgFetSaavx5yq+zscslh0byIm2Vd0rifiNcECe57aT2N0muOqYvnZ
2UQEjA/DSNU7r+d013XEDppIXnTkN7EE3b6qMQJjfunCSpuupDKz1u6DOaW89NAZ
IZ4d1ByAjmzZS8lbnnE3mxwLXhVtQnBQ/SfdWEpuqsV1SfF9bMkOgyKRhLYsDo7L
XPRUZ8WyOnYJhWFJewWBXTOvc8EGYZ/3KrEF9MmFTINaa67n8AWACnFQSInJMHDH
f4kz/3VKCyVMhOeaFiR8goCNr4eBgCHs9vXUjJwCEqaD0/hPSMxP+WKY6ARH7d0X
NJPGJncmXz137AL0a6OpQshpZYixmh42l8XIJ2RnZoyit39DpDgNzu+jdpSUeDKN
SWWwnZzpnUJ8fB1OQN7Dt7ViKt0MSiTqxDPugdwb2l3Juh6nrsE=
=noxg
-----END PGP SIGNATURE-----

--=-bxxQY4/QTmO061hEvqbG--


