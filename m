Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A08D734D5E0
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 19:16:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103207.196940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQvV6-0005ye-Ge; Mon, 29 Mar 2021 17:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103207.196940; Mon, 29 Mar 2021 17:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQvV6-0005yF-DS; Mon, 29 Mar 2021 17:16:28 +0000
Received: by outflank-mailman (input) for mailman id 103207;
 Mon, 29 Mar 2021 17:16:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V6tS=I3=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lQvV5-0005yA-Fs
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 17:16:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5df2846e-d37d-40f1-8b07-b437444c0d3e;
 Mon, 29 Mar 2021 17:16:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6DF36AFE2;
 Mon, 29 Mar 2021 17:16:25 +0000 (UTC)
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
X-Inumbo-ID: 5df2846e-d37d-40f1-8b07-b437444c0d3e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617038185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ai6DzfaiyobueiWo4GUDCJOAvIrc4jVq3SJuy2jSUjI=;
	b=sbX7CQ1iitRUNztdxI/RSPQZt/6sG1kDbslFZstq++iDmmfrr+C1pDLlaclv0NTYIJE+4K
	WJErHiRwzCrQP/6VdwZrHW0AgVGAoN3QjAkVmzYmBGJALTibqaHUX1Jtmxvai7M8kSAxEY
	k7NkjNSzFCt7/7+JDvLvge+IyLWjUMQ=
Message-ID: <970850cb5839e06dca089229029850cc67eae260.camel@suse.com>
Subject: Re: [ANNOUNCE] Xen 4.15 release update - still in feature freeze
From: Dario Faggioli <dfaggioli@suse.com>
To: Ian Jackson <iwj@xenproject.org>, committers@xenproject.org, 
	xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  =?ISO-8859-1?Q?Fr=E9d=E9ric?= Pierret
 <frederic.pierret@qubes-os.org>, George Dunlap <George.Dunlap@citrix.com>
Date: Mon, 29 Mar 2021 19:16:24 +0200
In-Reply-To: <e98fa56dd32a73c6b230683958c433170315671e.camel@suse.com>
References: <24655.20609.834996.744652@mariner.uk.xensource.com>
	 <e98fa56dd32a73c6b230683958c433170315671e.camel@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-A9rtXkDLvTo5CitN2QWV"
User-Agent: Evolution 3.38.4 (by Flathub.org) 
MIME-Version: 1.0


--=-A9rtXkDLvTo5CitN2QWV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-03-18 at 19:11 +0100, Dario Faggioli wrote:
> On Mon, 2021-03-15 at 12:18 +0000, Ian Jackson wrote:
>=20
> > =20
> > =C2=A0 https://bugzilla.opensuse.org/show_bug.cgi?id=3D1179246
> >=20
> So, this is mostly about the third issue, the one described in the
> openSUSE bug, which was however also reported here, by different
> people.
>=20
> As I've just wrote there (on the bug), I've been working on trying to
> reproduce the problem on a variety of different machines. Seems AMD
> seemed to be the most impacted, I've lately focused on hardware from
> such vendor.
>=20
FWIW, as a further update, there are now new info/logs here:
https://bugzilla.opensuse.org/show_bug.cgi?id=3D1179246

which I'm analyzing. And I should be able to have direct access to a
box where the issue can reproduced.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-A9rtXkDLvTo5CitN2QWV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmBiC2gACgkQFkJ4iaW4
c+4K5RAAwZviGTD38d9qj1kijO6ZeQXGOMPi89cj+P9ZLq73CpJ80B7N+LfTVc66
NODK6jI1rqu5xW1981HEdEEmNx7Xfn9mI9AXwg2q9+eS3L4c7c3La5Yyj6/u7xcb
G+xKWbPC6adHr+W5kxd5CHV8ORn9/nl4/IFtRky/fi/hLRpbn09ld/A6KoMGmpgv
aKWaWOKP5VpkOtpRvS4qKP04ciXGVmmzYoQ1ugi8alISv4tYtB/ez7F2orn5/WfF
V8xLZnVCaHYIE7+CEly7ZiM1jQ+KSzq+Jge9uWtJNo6vTZUgXD2hbbw3CxP9z6r9
ruI4CQIVWdDVa7jSOQqkmqbaHdfdZbTQqOmOvvpAgaGV3aCBHm17xAOOGDvEqVO7
DO6c4Cfpwg1QIdZWzOPbuHohgLS7AS7+I7RfB02TnHNG+Lansb7XfVnqoawXVa/t
IH+YOT7HQdU1Jp4LGZ1OUx8Cj3HrNzvJnBwyAHuPj5V3QP40cf/w61FJ78/bXq+N
SkJgM92Rns16Bovab0kp9JTjmBuwGcWbpZojN5UpejpD4oVFLtPqWK3kgpxwkpV/
kNgZUeucfLN7CXHcOR4ZIRNievqA++NgZ5X1KX3G9XUDQXQgaFNaJkpnIdYyFU0Q
fY3jnA+pqmdIotypiOC+J2k/4hrTu8nGgfFXRHQBizuOdmnnREE=
=CV/+
-----END PGP SIGNATURE-----

--=-A9rtXkDLvTo5CitN2QWV--


