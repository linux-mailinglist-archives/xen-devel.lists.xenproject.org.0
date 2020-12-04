Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 306572CF1EA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 17:30:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44950.80405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klDxz-0005Vl-9Y; Fri, 04 Dec 2020 16:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44950.80405; Fri, 04 Dec 2020 16:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klDxz-0005VP-6F; Fri, 04 Dec 2020 16:29:55 +0000
Received: by outflank-mailman (input) for mailman id 44950;
 Fri, 04 Dec 2020 16:29:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6t4/=FI=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1klDxx-0005VJ-Oo
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 16:29:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b67a80c-78cf-4d5d-841d-a0c0931c7e4c;
 Fri, 04 Dec 2020 16:29:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 837E9ACC1;
 Fri,  4 Dec 2020 16:29:51 +0000 (UTC)
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
X-Inumbo-ID: 9b67a80c-78cf-4d5d-841d-a0c0931c7e4c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607099391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SL3mwkZxHtAUx3sawZKWGup9Vk1PcbISsUT/Xs/r90c=;
	b=JcUTC05PV1ie2Y2ULY9lG3A24V4VJcVjejvd2uV+LeflyvfUrk1XS9VyFs0VPcKpnIgaCP
	v8769GqUr2FEgHfKyzCVUFzUfuU/HHYmkp2LR6H/Nwc0w6Y77HdYJ2RTaknLHJXmEHCUTf
	oWvUVRoYjJYYeDIvLjvVQaSlkFkarD0=
Message-ID: <53c1aa85b4421d90b14f4345fb5cdf77a514a877.camel@suse.com>
Subject: Re: [PATCH v2 06/17] xen/cpupool: use ERR_PTR() for returning error
 cause from cpupool_create()
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>
Date: Fri, 04 Dec 2020 17:29:50 +0100
In-Reply-To: <20201201082128.15239-7-jgross@suse.com>
References: <20201201082128.15239-1-jgross@suse.com>
	 <20201201082128.15239-7-jgross@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-GPWP1MuQ5tDtAxoJkZJ2"
User-Agent: Evolution 3.38.2 (by Flathub.org) 
MIME-Version: 1.0


--=-GPWP1MuQ5tDtAxoJkZJ2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-12-01 at 09:21 +0100, Juergen Gross wrote:
> Instead of a pointer to an error variable as parameter just use
> ERR_PTR() to return the cause of an error in cpupool_create().
>=20
Yes... And thanks!

Happy to see more of this happening and more of the ad-hoc error
handling going away.

> This propagates to scheduler_alloc(), too.
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

--=-GPWP1MuQ5tDtAxoJkZJ2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl/KY/4ACgkQFkJ4iaW4
c+5bDBAAq5/G7A3RbNQC4aZGOP10aor8sxDTEj17/+1ooAvQbU07DPQKIZhbGoT2
hjI7qnMB8gBStILWaV0HpYNsRj28Xu1zXZDjrVgtwa7z82y8hc5Yqf14eMANmslE
YxeVFhDlbZ+orUxz5JoCGNfOSZLP5Ak1OeG4dpK40KmunbToqiwHe55k3NGuTU5n
NbznfjMdKrWnRcJJKcOQ629xge6Bkd98dx3M/Wv0JL3VNCsVx3xWY8P+DYAysKrZ
hEy47z6oc9AGUCq4AnAisXwAIrfdHeL/VlwKteGb8i2iS0ZAxzc3q1ZeoNr8I0Mx
kftWJ159E2E72yBquIfEMj9xB8fpBqDpqLx/uUyGeVF4O4nYO2WUcjUf9hAV9E41
FI88xJga3HMp+Yse+VL2H5wQ3vJPmSsKLuv53C2bMD0vtuC678ZmnJYT9hSAidv4
C7ggl66erCQwQVV9HFx1DIkkuNpZ1fK0xigTJbgQOzfAyjFgB7XSyEMhveh34MJZ
zB8AIXERvwaVchj6pMkxOKEn1eQtUKJ1BRQRPv3PgrcVjxO9RJuqbgq0T6XvwoCo
F+GcMJV5gdE5/4bMwwubkUjFJ35JlkzxInZuDSJ7ljiEdEk79fB+voEhYApXB8Oh
nFH2Ffcaml7XVT5JXFyMGbcTMqGyzOxrUo1D+Jd8P2RpL6I8WME=
=n+ut
-----END PGP SIGNATURE-----

--=-GPWP1MuQ5tDtAxoJkZJ2--


