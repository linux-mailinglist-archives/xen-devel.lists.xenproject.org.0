Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3477129A7AF
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 10:23:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12702.32946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXLBp-0001tB-3W; Tue, 27 Oct 2020 09:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12702.32946; Tue, 27 Oct 2020 09:22:49 +0000
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
	id 1kXLBp-0001sm-0R; Tue, 27 Oct 2020 09:22:49 +0000
Received: by outflank-mailman (input) for mailman id 12702;
 Tue, 27 Oct 2020 09:22:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hbf0=EC=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kXLBn-0001sh-Fg
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 09:22:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c83cbdf-7c92-4b99-ba6d-83db1a613517;
 Tue, 27 Oct 2020 09:22:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3AD25ABAE;
 Tue, 27 Oct 2020 09:22:44 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Hbf0=EC=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
	id 1kXLBn-0001sh-Fg
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 09:22:47 +0000
X-Inumbo-ID: 5c83cbdf-7c92-4b99-ba6d-83db1a613517
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5c83cbdf-7c92-4b99-ba6d-83db1a613517;
	Tue, 27 Oct 2020 09:22:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603790564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5VXmT7OXS7Grv2amMbTiDpvu7FDd2Az8R8wtzflu0aQ=;
	b=LZ2WcOIuRMOuKL44nnU2lB9YRItAeUiekLoMA22hSSxma92dDHZ5x2fIWoK/rGco+bDcNK
	ARePcIg5qz3UOo+UCX03VjlOIYpXiROQg5YQGq4PeUHMZcL2sDt6gtfte/xjVapAYJMvU5
	yqZsfUbDJu529z3CuuwpPlTcAicOFwY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3AD25ABAE;
	Tue, 27 Oct 2020 09:22:44 +0000 (UTC)
Message-ID: <182a90a89cc02beec9760559799e74572e18ce49.camel@suse.com>
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, 
	"George.Dunlap@citrix.com"
	 <George.Dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>, 
	"frederic.pierret@qubes-os.org"
	 <frederic.pierret@qubes-os.org>, "andrew.cooper3@citrix.com"
	 <andrew.cooper3@citrix.com>
Date: Tue, 27 Oct 2020 10:22:42 +0100
In-Reply-To: <533ce2f2-f268-a70b-fad7-d8f3f4033209@suse.com>
References: <a8e9113c-70ef-53fa-e340-be15eb3cba57@qubes-os.org>
	 <30452e9c-bf27-fce2-cc20-4ce91018a15a@citrix.com>
	 <deefd340-ec7a-bbb9-7471-d147da174f4a@suse.com>
	 <a333ea82c12086874f705fc9ea9baa991235edd4.camel@suse.com>
	 <533ce2f2-f268-a70b-fad7-d8f3f4033209@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-3aE5EEhsEb5z1wV5vZe8"
User-Agent: Evolution 3.38.1 (by Flathub.org) 
MIME-Version: 1.0


--=-3aE5EEhsEb5z1wV5vZe8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-10-27 at 06:58 +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 26.10.20 17:31, Dario Faggioli wrote:
> >=20
> > Or did you have something completely different in mind, and I'm
> > missing
> > it?
>=20
> No, I think you are right. I mixed that up with __context_switch()
> not
> being called.
>=20
Right.

> Sorry for the noise,
>=20
Sure, no problem.

In fact, this issue is apparently scheduler independent. It indeed
seemd to be related to the other report we have "BUG: credit=3Dsched2
machine hang when using DRAKVUF", but there it looks like it is
scheduler-dependant.

Might it be something that lies somewhere else, but Credit2 is
triggering it faster/easier? (Just thinking out loud...)

For Frederic, what happens is that dom0 hangs, right? So you're able to
poke at Xen with some debugkeys (like 'r' for the scheduler's status,
and the ones for the domain's vCPUs)?

If yes, it may be useful to see the output.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-3aE5EEhsEb5z1wV5vZe8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl+X5uIACgkQFkJ4iaW4
c+7TGBAA0mdnksj8Pa4CjR789Vn+qTbNO+8CRgX3eZpZaBK63DVqpn6v8TZ1sVCC
le8IOj4ql+qmquzRtbFycuw6BCihZR54PlhWpgIr2usmEi1h203K0QsJy/xkBzGi
f+mOnZW+Xr81INZLpzCW5UvpkHFTpfri2vfxWdYHiGx5MEps38u4Slg50ShvB+bh
mQfTLC29EYtMDrmbRsg8avA9IW7prUD+OiaV6HHcnqSC9Od/2zdzJzUl8MjTYLi/
br7Arx8F8r2s0LC2FqniD5osfnUajV76mr8vI3yZz5RpqESm5dSzFhEwpS+8OS5x
Ko4RqFoXcPtjexdKLedrNyNHtCfg4qTKclu2u7BRQLPDYHwnyldWUfT0zIf5DrTC
w7Nq/FUdjrSuGQuqVfW5iwVuzw6nTo26Sv6PAiLpiMB+RnFwXadPMSqnWNoNsOdI
pZAvPXIrlVfUuCwgOjMW7DLEsqyiyZRL2TIXkNWhnNslthYCL9rd7gZ8kPuk3Xq5
+YI37H8h+FrkFBTbAcF+ija0boFNOnK4+xw8QOZUIIxiB8n8saGYNDonDJPynehv
WUFRJFjw9moBP7nXIyR5Fs/XTb8gkhNqE/jls8iVXKnOh53iUqWCwB2BUKx0+Jj0
gXX5UJNlcoDFNj3OK0y+kYhm6HGxjSw+ZYaXQJQaPSZDq1bQg1I=
=T1jQ
-----END PGP SIGNATURE-----

--=-3aE5EEhsEb5z1wV5vZe8--


