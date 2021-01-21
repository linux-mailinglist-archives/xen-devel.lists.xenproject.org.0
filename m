Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B12582FF336
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 19:33:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72343.130191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2elN-0003Jm-Vy; Thu, 21 Jan 2021 18:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72343.130191; Thu, 21 Jan 2021 18:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2elN-0003JN-SE; Thu, 21 Jan 2021 18:32:57 +0000
Received: by outflank-mailman (input) for mailman id 72343;
 Thu, 21 Jan 2021 18:32:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hfWZ=GY=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1l2elM-0003JI-CF
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 18:32:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a497b70a-528d-4071-ad80-3c1417339b07;
 Thu, 21 Jan 2021 18:32:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ABB7CACC6;
 Thu, 21 Jan 2021 18:32:53 +0000 (UTC)
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
X-Inumbo-ID: a497b70a-528d-4071-ad80-3c1417339b07
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611253973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iIcNkolvMKSxKkSoVh59rIIEhSIKgaKsvYWdTI1qnTg=;
	b=ku+t2S2vkTp9Q7+xQRGgMpWcJl5MrnaEBbEyUI8R79kY8co4TZC/38ZNmXrnHSU+0CrBm9
	7STxNZwpVPDgPRU77zClculurX2eEY9hYdV5DiM8+cdkkw5+X+GJCLuo18gayblXwgK7JZ
	lQSaVaqL81rKPYePAQ/zxY71K6yxq+0=
Message-ID: <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
Subject: Re: Null scheduler and vwfi native problem
From: Dario Faggioli <dfaggioli@suse.com>
To: Anders =?ISO-8859-1?Q?T=F6rnqvist?= <anders.tornqvist@codiax.se>, 
	xen-devel@lists.xenproject.org
Date: Thu, 21 Jan 2021 19:32:52 +0100
In-Reply-To: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-NBA5hJW2DM7PYV7tgFoV"
User-Agent: Evolution 3.38.3 (by Flathub.org) 
MIME-Version: 1.0


--=-NBA5hJW2DM7PYV7tgFoV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-01-21 at 11:54 +0100, Anders T=C3=B6rnqvist wrote:
> Hi,
>=20
Hello,

> I see a problem with destroy and restart of a domain. Interrupts are
> not=20
> available when trying to restart a domain.
>=20
> The situation seems very similar to the thread "null scheduler bug"=20
> =20
> https://lists.xenproject.org/archives/html/xen-devel/2018-09/msg01213.htm=
l
> .
>=20
Right. Back then, PCI passthrough was involved, if I remember
correctly. Is it the case for you as well?

> The target system is a iMX8-based ARM board and Xen is a 4.13.0
> version=20
> built from https://source.codeaurora.org/external/imx/imx-xen.git.
>=20
Mmm, perhaps it's me, but neither going at that url with a browser not
trying to clone it, I do not see anything. What I'm doing wrong?

> Xen is booted with sched=3Dnull vwfi=3Dnative.
> One physical CPU core is pinned to the domu.
> Some interrupts are passed through to the domu.
>=20
Ok, I guess it is involved, since you say "some interrupts are passed
through..."

> When destroying the domain with xl destroy etc it does not complain
> but=20
> then when trying to restart the domain
> again with a "xl create <domain cfg>" I get:
> (XEN) IRQ 210 is already used by domain 1
>=20
> "xl list" does not contain the domain.
>=20
> Repeating the "xl create" command 5-10 times eventually starts the=20
> domain without complaining about the IRQ.
>=20
> Inspired from the discussion in the thread above I have put printks
> in=20
> the xen/common/domain.c file.
> In the function domain_destroy I have a printk("End of domain_destroy
> function\n") in the end.
> In the function complete_domain_destroy have a printk("Begin of=20
> complete_domain_destroy function\n") in the beginning.
>=20
> With these printouts I get at "xl destroy":
> (XEN) End of domain_destroy function
>=20
> So it seems like the function complete_domain_destroy is not called.
>=20
Ok, thanks for making these tests. It's helpful to have this
information right away.

> "xl create" results in:
> (XEN) IRQ 210 is already used by domain 1
> (XEN) End of domain_destroy function
>=20
> Then repeated "xl create" looks the same until after a few tries I
> also get:
> (XEN) Begin of complete_domain_destroy function
>=20
> After that the next "xl create" creates the domain.
>=20
>=20
> I have also applied the patch from=20
>    =20
> https://lists.xenproject.org/archives/html/xen-devel/2018-09/msg02469.htm=
l
> .=20
> This does seem to change the results.
>=20
Ah... Really? That's a bit unexpected, TBH.

Well, I'll think about it.

> Starting the system without "sched=3Dnull vwfi=3Dnative" does not result
> in=20
> the problem.
>
Ok, how about, if you're up for some more testing:

 - booting with "sched=3Dnull" but not with "vwfi=3Dnative"
 - booting with "sched=3Dnull vwfi=3Dnative" but not doing the IRQ=C2=A0
   passthrough that you mentioned above

?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-NBA5hJW2DM7PYV7tgFoV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmAJyNQACgkQFkJ4iaW4
c+6HBA//XfTRd89R+eHsXoAzKqLs7ZyzQ7ju6CdQlm2Krz7wloN8dTQv6bDgEEYy
HUNosqkrPJ2/VLtw3seYiKvbJjdZ1gVD1lxURqwclaYsvLAkunqgk4Rfht9PTgEl
z7OgKjPXJ2dLKvlD/6gikiZALvvaYQsk2qVUxk4rut9js1hBHpDs2PlEKDHBnjPU
aWLhB77E6po5saKQd0xFDexc43AqA/WVDNJ13uDPND49EbtzY41PDll2/cH0rP3y
WKl1DyOB8Wm4qTEYCZDBvHTozhmx92GnlThyq1MgZ7SWGE/uWOjxtUBk7AL8PqJE
KGfHF4nKZuddHpNk5C71ZQfRvotB+s93iW62aA/5FsoNQKgs6ypb+EBGHoPFF1lI
hblSiMM93yjT+KIeJeSowYyIL4dbyb/YuhXHzIWuD1B9ObR14ZmjG7cMIpIrgOru
momQssL+GbB1uQFyOuKBTS4Xs/vXHO1sptlDicTZrE+Ro1M++jY2rxAHU3C1DsoI
DViL0hoMXsG3wBh26/qZoP24qcwXhrKJcyhEIvwi2DyZOzLgdGLPhVgJq//omnj3
7dhhQYkJYT/l4Mdg2H4zkgCxj01paLda8V0VLLOKCkmsMQvmebDhe7XW3eU5CQKD
2JFXrvug66qAKvfu71P+tacJ8w0r18OUoFHIAB9Db1ij1R8yvS8=
=50LD
-----END PGP SIGNATURE-----

--=-NBA5hJW2DM7PYV7tgFoV--


