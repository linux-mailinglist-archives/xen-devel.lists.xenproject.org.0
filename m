Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2878130F4C8
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 15:21:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81326.150099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7fV5-0007mD-3T; Thu, 04 Feb 2021 14:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81326.150099; Thu, 04 Feb 2021 14:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7fV5-0007lp-0V; Thu, 04 Feb 2021 14:20:51 +0000
Received: by outflank-mailman (input) for mailman id 81326;
 Thu, 04 Feb 2021 14:20:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YSLV=HG=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1l7fV3-0007lk-Ur
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 14:20:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 255224e8-0ee2-489e-a243-542510d95f50;
 Thu, 04 Feb 2021 14:20:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 55B15AD24;
 Thu,  4 Feb 2021 14:20:47 +0000 (UTC)
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
X-Inumbo-ID: 255224e8-0ee2-489e-a243-542510d95f50
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612448447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4BGRJVYHX8vv0mMZ5K24DmOUL6xZvEVs3qVEdlWQrvg=;
	b=ghrDj22KIIcwxBLh0qp49GdDweL7JAGXMw80gkh3wrxvDkAmoHkX+g6RLd9HoyVm1rV1EA
	ZdmlDXRKzVhEqgd1R+B9ElRA5L/l13RP/pgkWM5crSznrT5oZaM1hGDCtTYSdMVp/voZyR
	F9Nm9ORxrpU5YdgJB/vIOZNKZN4Dcs0=
Message-ID: <6d0d7181bad79259aff28351621d2ac1eeaca113.camel@suse.com>
Subject: Re: [ANNOUNCE] Xen 4.15 - call for notification/status of
 significant bugs
From: Dario Faggioli <dfaggioli@suse.com>
To: Ian Jackson <iwj@xenproject.org>, committers@xenproject.org, 
	xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,  Julien Grall <julien@xen.org>,
 community.manager@xenproject.org
Date: Thu, 04 Feb 2021 15:20:46 +0100
In-Reply-To: <24603.58528.901884.980466@mariner.uk.xensource.com>
References: <24600.8030.769396.165224@mariner.uk.xensource.com>
	 <24603.58528.901884.980466@mariner.uk.xensource.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-4I6JqNFolG6UkCq4I6c3"
User-Agent: Evolution 3.38.3 (by Flathub.org) 
MIME-Version: 1.0


--=-4I6JqNFolG6UkCq4I6c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-02-04 at 12:12 +0000, Ian Jackson wrote:
> B. "scheduler broken" bugs.
>=20
> Information from
> =C2=A0 Andrew Cooper <andrew.cooper3@citrix.com>
> =C2=A0 Dario Faggioli <dfaggioli@suse.com>
>=20
> Quoting Andrew Cooper
> > We've had 4 or 5 reports of Xen not working, and very little
> > investigation on whats going on.=C2=A0 Suspicion is that there might be
> > two bugs, one with smt=3D0 on recent AMD hardware, and one more
> > general "some workloads cause negative credit" and might or might
> > not be specific to credit2 (debugging feedback differs - also might
> > be 3 underlying issue).
>=20
> I reviewed a thread about this and it is not clear to me where we are
> with this.
>=20
Ok, let me try to summarize the current status.

- BUG: credit=3Dsched2 machine hang when using DRAKVUF

  https://lists.xen.org/archives/html/xen-devel/2020-05/msg01985.html
  https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg01561.htm=
l
  https://bugzilla.opensuse.org/show_bug.cgi?id=3D1179246

  99% sure that it's a Credit2 scheduler issue.
  I'm actively working on it.
  "Seems a tricky one; I'm still in the analysis phase"

  Manifests only with=C2=A0certain combination of hardware and workload.=C2=
=A0
  I'm=C2=A0not reproducing,=C2=A0but there are multiple reports of it (see=
=C2=A0
  above). I'm investigating and trying to come up at least with=C2=A0
  debug=C2=A0patches that one of the reporter should be able and willing to=
=C2=A0
  test.

- Null scheduler and vwfi native problem

  https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg01634.htm=
l

  RCU issues, but manifests due to scheduler behavior (especially  =C2=A0
  NULL scheduler,=C2=A0especially on ARM).
  I'm actively working on it.

  Patches that should solve the issue for ARM posted already. They=C2=A0
  will=C2=A0need to be slightly adjusted to cover x86 as well. Waiting a=C2=
=A0
  couple days more for a confirmation from the reporter that the
  patches do help, at least on ARM.

- Xen crash after S3 suspend - Xen 4.13

  https://lists.xen.org/archives/html/xen-devel/2020-03/msg01251.html
  https://lists.xen.org/archives/html/xen-devel/2021-01/msg02620.html

  S3 suspend issue, but root cause seems to be in the scheduler.

  Marek is, as usual, providing good info and feedback. It comes as=C2=A0
  third in my list (below the two above, basically), but I will look
  into it.

- Ryzen 4000 (Mobile) Softlocks/Micro-stutters

  https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg00966.htm=
l

  Seems could be scheduling, but amount of info is limited.

  What we know is that with `dom0_max_vcpus=3D1 dom0_vcpus_pin`, all=C2=A0
  schedulers seem to work fine. Without those params, Credit2 is the=C2=A0
  "least bad", although not satisfactory. Other schedulers don't even=C2=A0
  boot.
  Fact is, it is reported to occure on QubesOS, which has its own=C2=A0
  downstream patches, plus there are no logs.
  There's a feeling that this (together with others) hints at SMT off=C2=A0
  having issues on AMD (Ryzen?), but again, it's not crystal clear to=C2=A0
  me whether this is the issue (or an issue at all) and, if yes, in=C2=A0
  what subsystem the problem lays.
  I can try to have a look, mostly for trying to understand whether or=C2=
=A0
  not it is really the case that some AMDs have issues with SMT=3Doff.
  But that probably will be after I'll be done with the other issues=C2=A0
  I've mentioned before (above) this one.

-=C2=A0Recent upgrade of 4.13 -> 4.14 issue

  https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg01800.htm=
l=20

  To my judgment, It's not at all clear whether or not this is a=C2=A0
  scheduler issue. And at least with the amount of info that we have=C2=A0
  so=C2=A0far, I'd lean toward "no, it's not". I'm happy to help with it=C2=
=A0
  anyway, of course,=C2=A0but it comes after the others.

So, Ian, was this any helpful?

If not, help me understand how I can help you. :-P

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-4I6JqNFolG6UkCq4I6c3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmAcAr4ACgkQFkJ4iaW4
c+6jWA//WW4Uie6tFaNAUR5lw2pyOqDO3tvzHUNu45vUvJSJxFdingOQ/HCzKtx2
zSuaU0+uwesIZemTxaERYA2ovdLLHHz6vZETvpXgG3y1l1JTM66Bth0xr6UfdpSF
YeBU2TF+utvvBEhDjzX1AeI7KSZbgXk+W8Xqn7QuF4tGGIngf+j/WV6GcKGhQsTF
h+5wCNWp49xtBHU1tYSnZkDU3b1z3BN7Ka7MxqYw8TO+du+jW8Ijits52p/C4l2O
H8th7TwhDxnabAaPHwKBzPb7G07hkiLkVE47796PyejAkb8JMzDzSNQnwAHGGJyK
FRo8TF8PnNTHw5tTSY8FNjyCzDqipasG/De3BKSgeoDGby7ce6IyUsC913dc26/w
HBM2c70nyvZ6+frJ4gCMxsj5qXTKAFB/v2Y445E00QSo26Nt52UYG0aedlahwEeK
yfwphxAMZIe2B2H4GsqgiWh9ctBmifbWGI7DM45/XZNe6YL3kOVmRljI/VoFsUZU
885bGRVcETm/Rl1zaTbsYXt0M9CPW9XtcLtB1cOVgmTEOYdsmPGBUTrkHVy1Xp3e
R0zm3YHOdNkmFRwkwwEQ/Zpa2Djj9/8xUifyu2A5Iq0zb3YHyHIoqxDb9dF10W3+
MzRelBGIza3VU0daRrJ/W/Hp1HIgeIyRYJSmnVH+tCOwVY7jZfk=
=n7XM
-----END PGP SIGNATURE-----

--=-4I6JqNFolG6UkCq4I6c3--


