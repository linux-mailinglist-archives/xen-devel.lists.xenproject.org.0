Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD2331EB5F
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 16:16:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86678.162885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCl1r-0005Jv-Rp; Thu, 18 Feb 2021 15:15:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86678.162885; Thu, 18 Feb 2021 15:15:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCl1r-0005JW-Ol; Thu, 18 Feb 2021 15:15:43 +0000
Received: by outflank-mailman (input) for mailman id 86678;
 Thu, 18 Feb 2021 15:15:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Wg/=HU=redhat.com=crosa@srs-us1.protection.inumbo.net>)
 id 1lCl1q-0005JR-IB
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 15:15:42 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 91f814d1-a31a-405b-936a-51e970c0d183;
 Thu, 18 Feb 2021 15:15:41 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-m8pRphbRNZyoQTqxE2nwVg-1; Thu, 18 Feb 2021 10:15:39 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44F53192D7BA;
 Thu, 18 Feb 2021 15:15:36 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-28.rdu2.redhat.com
 [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18FC067CC2;
 Thu, 18 Feb 2021 15:15:30 +0000 (UTC)
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
X-Inumbo-ID: 91f814d1-a31a-405b-936a-51e970c0d183
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613661341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hdBF8OBirgPbspYnaG5GA5tWKPIadlNyyNrXBvpWLb0=;
	b=TSgR1edoNqLpTe2MPY5wsqIFePJaq+53IXqg125OPNkBsUcxIcHtNUlwMrnFvOpDgydfrT
	1PbRe5YseS4a2OVcQWIB40VYIflIYjSbWGjXtbrVdgvbm4WXuiBJ7RuC0SIzzAENTUghmm
	QG4ZYhixUrHrCoHY5/pldkpzlLcn8xc=
X-MC-Unique: m8pRphbRNZyoQTqxE2nwVg-1
Date: Thu, 18 Feb 2021 10:15:28 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, julien@xen.org, andre.przywara@arm.com,
	stefano.stabellini@linaro.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com,
	stratos-dev@op-lists.linaro.org
Subject: Re: [PATCH  v2 7/7] tests/avocado: add boot_xen tests
Message-ID: <20210218151528.GA433029@localhost.localdomain>
References: <20210211171945.18313-1-alex.bennee@linaro.org>
 <20210211171945.18313-8-alex.bennee@linaro.org>
 <20210217204654.GA353754@localhost.localdomain>
 <87sg5us58c.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87sg5us58c.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline

--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 17, 2021 at 10:22:50PM +0000, Alex Benn=E9e wrote:
>=20
> I think the solution is to use archive links here. There is a snapshot
> archive of sid (we've used it in the past) but I suspect there isn't an
> archive of old stable packages for a reason.
>

If the packages you need are available on archives (which I wasn't
aware of), then without a doubt it is the best solution.

I assume you're going to look into that (I'll keep an eye on the list
about it).

Regards,
- Cleber.

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAuhI0ACgkQZX6NM6Xy
CfP2Aw//cvewBBcbcAWjx/pOHRnaVZW8kOlzWmOLN3LYxwQWqbyN+s2735/dCRHb
VD2uZYIawq4T0bWTf/cOC77oT8YG3rRqwFWVM4lFayUqhJcBDyi+7RM+SLmQZbdg
M/4EiHzQc3ocPyUt9ZNVcvU0GHQbEefOobG8aK4s6+y3BPjdsoCPLWT6vqtctcyH
eGi2URX1WLWkCqCrYtgrWdm51jcFU59vtbrIqdR5KOaB0G676LdbCR94g6NWPeN9
9c7g3h10/C4z6KvSFUYRXWXuKYQjSLpYyDn1xMDWMJ+M/3oOf8Zmmd7U7lP9iOxA
p38MRhY+rdqPWmphvHcvwuWkIeq3gZlKc3RkVIw05Q7g92XNMZCjb03GJ3DxX+Ka
Mn9F+zTduy2/v7PhahbC+4xCzm2JBg9VAdvvAgXPddSCV5KsaqQbQ4BoZH/ik7EP
hy7055UxhwQI3giXbSu9drgJZ4NDKM12GRpcB83+SYp13ctu0o81Nei/XL7lEcC3
4/nBh8yEw4t5GlroU4L3Y0Agodmf6qvg7ejaS7EeJZ6kDnqn5Z3whz+l5UTzu/vr
81ekZ6kVaMjW9eFF6vyo4MgfPxTAh/LSYz5crvN/Ocu1zg8dGCGBDvDsQimHU24M
0gG3uhrdAxH7U3KYGy7wYYZJebQpQre8idUNBq6xZJSnipYswiI=
=oUm8
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--


