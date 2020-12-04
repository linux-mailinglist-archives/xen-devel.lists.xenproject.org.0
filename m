Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C672CF141
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 16:54:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44920.80355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klDOD-0001I8-GX; Fri, 04 Dec 2020 15:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44920.80355; Fri, 04 Dec 2020 15:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klDOD-0001Hj-DA; Fri, 04 Dec 2020 15:52:57 +0000
Received: by outflank-mailman (input) for mailman id 44920;
 Fri, 04 Dec 2020 15:52:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6t4/=FI=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1klDOB-0001He-BK
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 15:52:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5822dfd-3a27-4a7d-9a59-66f755a37ba2;
 Fri, 04 Dec 2020 15:52:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 96BD9ACF1;
 Fri,  4 Dec 2020 15:52:53 +0000 (UTC)
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
X-Inumbo-ID: b5822dfd-3a27-4a7d-9a59-66f755a37ba2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607097173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/s7w6felNN5aUqALA+mgH/FY6qkLlK/W/jn3uFNlDrI=;
	b=czeW9Nar3zrUjSW/SsHTzTEmHHKypnFST72Ec/zASskOh3eG1b4Pl9cvZwAuhOWmYlIeYo
	LxQHO6/yluo/9oqnIIgeycl7S0+bClcMYzwCG6Ok9d0FJcSSSNlQHP4TeJGjgx35icyO9f
	L5mnUVYZBHHc/9tdi1p2DbXzz5ZC9Z8=
Message-ID: <c2753a9853a1dccc159e0b34db0cdf0a364d2206.camel@suse.com>
Subject: Re: [PATCH v2 04/17] xen/cpupool: switch cpupool id to unsigned
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Andrew Cooper
	 <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	 <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Fri, 04 Dec 2020 16:52:52 +0100
In-Reply-To: <20201201082128.15239-5-jgross@suse.com>
References: <20201201082128.15239-1-jgross@suse.com>
	 <20201201082128.15239-5-jgross@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-G1APAdAHLbOB5//xki2j"
User-Agent: Evolution 3.38.2 (by Flathub.org) 
MIME-Version: 1.0


--=-G1APAdAHLbOB5//xki2j
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-12-01 at 09:21 +0100, Juergen Gross wrote:
> The cpupool id is an unsigned value in the public interface header,
> so
> there is no reason why it is a signed value in struct cpupool.
>=20
> Switch it to unsigned int.
>=20
I think we can add:

"No functional change intended"

> Signed-off-by: Juergen Gross <jgross@suse.com>
>
IAC:

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-G1APAdAHLbOB5//xki2j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl/KW1QACgkQFkJ4iaW4
c+6KbA/+MwD+ALsymyz5iKB+FV4FJuj7a3zN5crQmKJUEVDqJQj3T9bP083PsQNy
6g8SB4GaVYh0+J/DUl4BvEzYLiF9yDfl171gtR/AYMrTYHcALCseyRRwL69XRDC8
h8GG97v7tyaNXIFdZ38fEDtOkW6TPnUcD0EeQSS4YW0v1I6YSuRhTPwDEORNB0i4
ekkUrbSRZUzsdEE/gEwHh3qB0voDRWq5jRMjjWzZRVR1AUyQXqsp+Dfkzs3zrsSW
oT2CDyHqXBf4nYclEthzTB3Xa9jNB9yicY4fFdM86L7etJZtc+aZ+K1TE4e0ZIeh
6KJQK6o/YI5OrTqGE3CVB7BSOM9t7m4OF7uclWpOXob4UdVh95TE4XBrhozJ0gFN
TRhE7Vy4aVIWofFuPSOrK78IPRk8+EykLG8EB7ZmaJ2XkQLRwQxaM9NEUqpQvgPK
jumNrxjiS8JXXx+GV+wIJXZgZ313+SpIy3JoxmReojnj+gjq1f7wTu0cee4RelSi
1XZaBMz+Zlq0kLh93DJGkN+woQ+xMgqEpFoj83RLG1xftcFYxckhLA+0tvJaR0lj
zA3uariOhSnsJhU+gpI0wTUEeSpjoZ0ys7HpdlJnOj3ThN4fshyuK/nzbsSDr27X
l7PKgPZDnSuVRXKd6YIwidoU0n9Mco+MSBl682kahKFr9c2bULk=
=o/Gb
-----END PGP SIGNATURE-----

--=-G1APAdAHLbOB5//xki2j--


