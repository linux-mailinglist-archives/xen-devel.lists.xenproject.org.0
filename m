Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8B12AF3A1
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 15:32:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24892.52364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcrAP-0001h1-LC; Wed, 11 Nov 2020 14:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24892.52364; Wed, 11 Nov 2020 14:32:09 +0000
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
	id 1kcrAP-0001gc-I4; Wed, 11 Nov 2020 14:32:09 +0000
Received: by outflank-mailman (input) for mailman id 24892;
 Wed, 11 Nov 2020 14:32:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MbyH=ER=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kcrAN-0001gX-Md
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:32:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90c6ca9c-ff9c-4f63-921f-7a306a835a1d;
 Wed, 11 Nov 2020 14:32:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F1734ABD6;
 Wed, 11 Nov 2020 14:32:01 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MbyH=ER=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
	id 1kcrAN-0001gX-Md
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:32:07 +0000
X-Inumbo-ID: 90c6ca9c-ff9c-4f63-921f-7a306a835a1d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 90c6ca9c-ff9c-4f63-921f-7a306a835a1d;
	Wed, 11 Nov 2020 14:32:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605105122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jiyAOm34YBlkt8TRW7xKyZI32hhUfjZX9Kt8C3ZWV2w=;
	b=dg1h30rehaUqxj4F3fTEdPPYo7i/4m4IJKJt92LOcbBGA09qzKZ4bbkhpMrz75YfJFe/I9
	T16fMa09UDbENQUStb1OYiB9bycFwxX/6cLP9/REcW42kE41w3UPyAUypQq7PUKV61xVVP
	u6uKPfNpAQiK0bgL21XrORLcyQ3B/GY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id F1734ABD6;
	Wed, 11 Nov 2020 14:32:01 +0000 (UTC)
Message-ID: <34527bbdeef138454b6a555c236b2289643b3d6b.camel@suse.com>
Subject: Re: [PATCH 01/12] xen/cpupool: add cpu to sched_res_mask when
 removing it from cpupool
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>
Date: Wed, 11 Nov 2020 15:32:00 +0100
In-Reply-To: <20201026091316.25680-2-jgross@suse.com>
References: <20201026091316.25680-1-jgross@suse.com>
	 <20201026091316.25680-2-jgross@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-1+R5tQwXK3XdNFiQEMxf"
User-Agent: Evolution 3.38.1 (by Flathub.org) 
MIME-Version: 1.0


--=-1+R5tQwXK3XdNFiQEMxf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-10-26 at 10:13 +0100, Juergen Gross wrote:
> When a cpu is removed from a cpupool and added to the free cpus it
> should be added to sched_res_mask, too.
>=20
> The related removal from sched_res_mask in case of core scheduling
> is already done in schedule_cpu_add().
>=20
> As long as all cpupools share the same scheduling granularity there
> is nothing going wrong with the missing removal,=C2=A0
>
This patch is adding an addition of the CPU to sched_res_mask, which
was missing... So isn't the above "there is nothing going wrong with
the missing addition", or something like that?

Or, if it's an actual missing removal that we are referring to here,
then it must be clarified which one.

> but this will change
> when per-cpupool granularity is fully supported.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
With the above fixed or clarified:

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-1+R5tQwXK3XdNFiQEMxf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl+r9eAACgkQFkJ4iaW4
c+5U7g/+KABC/HNMdXDMUPS+YwrioXpWKk1NMzHt+7L9fx+qmmeSM/a7u2cG9sCE
0w6AKc/q6mOmVCX8LmzymFYQbWYv3LNpbWd1ULBKrmPc/8EeJ+WRgOrWJamYNYGm
ZDzoT2avN0VBJ7rlvz9oRKG5YOIyRNkdV599FH9q9UEwbliBpDjFTHX9F/OpzMGb
S541Eh7GrL1KAiP7wc4ex5FXvp82mWwApS9FgtS0WcXBH4khXd0aMBSDAq79v6kn
sDuxjAdHK6ovYzwf2gh3FxFHv+2Fv6ZgPzard9214e65XQ7PmCbQxtkd+74+UGWW
Fw8IEYA7OfIXkLdfI7A065ZNLspJAZzi1sjwJyVmGpJAn/57jW3kxIUWvwKRR1BG
JPMJTfYHFnxXQYWHvTuvMpdLeB+hAgEa+BjtoZpygLSa+VAyqgGrvpkTqK0W/+Eb
8Nm6Ra3X0NEkKcr65PihVvPlq4w/mo+Ld0wAnx1Yd0Rl/nQWwlB3o9Ny4MgO+FuS
YwnEzC+vMT/ePr2o5f07e/WavvRJNEts4iboRhsMi2KjBZhDf0x+0R7cbEzFg/ye
EmZut5RvH7gaq7OydWOUIMvmOVBEPHQ7tRAn+5zNmU+PGAFMORePAU+tA+y5RQUL
Iv6qk1BwJQEZs1fFUREsDxyzUQY9mi+XnrVVVuB4x5IV7P8w5I8=
=ydfU
-----END PGP SIGNATURE-----

--=-1+R5tQwXK3XdNFiQEMxf--


