Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BC92CF1D1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 17:25:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44943.80391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klDtY-0005IV-Jx; Fri, 04 Dec 2020 16:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44943.80391; Fri, 04 Dec 2020 16:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klDtY-0005I6-GV; Fri, 04 Dec 2020 16:25:20 +0000
Received: by outflank-mailman (input) for mailman id 44943;
 Fri, 04 Dec 2020 16:25:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6t4/=FI=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1klDtX-0005I1-42
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 16:25:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d7b34b8-e71c-46b7-b9b8-76d04880ed6a;
 Fri, 04 Dec 2020 16:25:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 69512AC9A;
 Fri,  4 Dec 2020 16:25:17 +0000 (UTC)
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
X-Inumbo-ID: 0d7b34b8-e71c-46b7-b9b8-76d04880ed6a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607099117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wCzY4tbIDpH0VVSO04WM5bndyi7WKIj6iiHn8DqcabU=;
	b=tOgvqskCaj3dWuLFXRr/D9VhuuzltZTHsNskMEoPPZKrOM13thR+ng45ha2wkM/1pRUBpi
	W6l9pepcYHAgg2312Y/csXigj1onHSVD4qJbRmhswbE+4BRtQ/IC4iyHQVY1Stm8J9iRBW
	CCD+5fqt3NymCfcgzYA0aeXssnT8aLE=
Message-ID: <967454f248c521e51b0a1be27b7d38fe243ce54e.camel@suse.com>
Subject: Re: [PATCH v2 05/17] xen/cpupool: switch cpupool list to normal
 list interface
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Jan Beulich
	 <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Date: Fri, 04 Dec 2020 17:25:16 +0100
In-Reply-To: <76e7d00f-b049-97fc-f9e2-ade76b10a93e@suse.com>
References: <20201201082128.15239-1-jgross@suse.com>
	 <20201201082128.15239-6-jgross@suse.com>
	 <54301d8c-2d69-3206-6c42-d2638b7e7aa3@suse.com>
	 <a812d9a9-a701-bb58-01bf-9375ad4feb50@suse.com>
	 <fe0b6924122aa9dff2095403738f111750cc815a.camel@suse.com>
	 <76e7d00f-b049-97fc-f9e2-ade76b10a93e@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-tkkM7bhpV4NNs/gEUX5h"
User-Agent: Evolution 3.38.2 (by Flathub.org) 
MIME-Version: 1.0


--=-tkkM7bhpV4NNs/gEUX5h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-12-04 at 17:16 +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 04.12.20 17:13, Dario Faggioli wrote:
> >=20
> >=20
> > What I'd do is:
> > =C2=A0 - add a comment here, explaining quickly exactly this fact, i.e.=
,
> > =C2=A0=C2=A0=C2=A0 that it's not that we've forgotten to deal with this=
 and it's
> > all
> > =C2=A0=C2=A0=C2=A0 on=C2=A0purpose. Actually, it can be either a commen=
t here or it can
> > be
> > =C2=A0=C2=A0=C2=A0 mentioned in the changelog. I'm fine either way
> > =C2=A0 - if we're concerned about someone doing:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for i=3D1...N { xl cpupool-create foo ba=
r }
> > =C2=A0=C2=A0=C2=A0 with N ending up being some giant number, e.g., by m=
istake, I
> > don't
> > =C2=A0=C2=A0=C2=A0 think it's unreasonable to come up with an high enou=
gh (but
> > =C2=A0=C2=A0=C2=A0 certainly not in the billions!) MAX_CPUPOOLS, and st=
op creating
> > new
> > =C2=A0=C2=A0=C2=A0 ones when we reach that level.
>=20
> Do you agree that this could be another patch?
>=20
Ah, yes, sorry, got carried away and forgot to mention that!

Of course it should be in another patch... But indeed I should have
stated that clearly.

So, trying to do better this time round:
- the comment can/should be added as part of this patch. But I'm
  now much more=C2=A0convinced=C2=A0that a quick mention in the changelog
  (still of this patch) is=C2=A0actually better;
- any "solution" (Jan's or MAX_CPUPOOLS) should go in its own patch.

> I'm not introducing that (theoretical) problem here.
>=20
Indeed.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-tkkM7bhpV4NNs/gEUX5h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl/KYuwACgkQFkJ4iaW4
c+61yhAAiFAyIW7eZ3o7XapgC2t8iDJzOpKwvbOIfnpPXHqeIR6tOpJVxtPSL36E
6RVNZ7DiilBizjF3aJ2WBKRsDpldfePBciUnDqcMkFLUDhqtDC/GBh2flSzB8twl
PcfQB15sKhYAKkDN1UNad05CfVDT7jmuDZfB0iTOf78bHKS5YMPcOFUJweeCYUCe
R47D8aIKqb+jdLg2rluKAt3gt+nmXesBUyGrV7DUMRoEd2ZuaCX8c++AXut0f7sd
E4z+X1EOaqnzY8dQYRJeIXvl6ZJsDTFVR2hkIfBJnXfpo9nJ1i7xnWIn5tPvJDxp
W6ihe8MUeRCcUN7CkxnH6exKQhoAjsKNOiynLPDbiY5IicvPgAUjHrY8srbgxZJ6
BAElKkdZot4oGfi7+++vKhAQ9HWX6JU8fHw30PdJCZzr6vQ5B1SHEbCo5eD4cviF
FgiHMjd6yTmEQgkE9uPIB/1P+LfEzvzjC065RnqDHD33PX7Oyjz92zUPYuTD72eu
nA5NZr8k/daCDjkKGX/tvu2t4+Plt1g/+Hv2JiCBDgxdrXJXi9FbzCv1Zhnu+ibr
PuoFSMUpnHOuDrMJiFCxcv3ohk0iNBW+Pp2YIvNZ0HL3xlcSHxVGsBSofR7Oz1lH
DNafHI0kTp8zYCBumlj9MDYzcrpJao438fbTHzsmevRMG1uQ8bI=
=hDDv
-----END PGP SIGNATURE-----

--=-tkkM7bhpV4NNs/gEUX5h--


