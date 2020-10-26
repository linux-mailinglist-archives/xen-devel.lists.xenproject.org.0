Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AE029946D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 18:54:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12523.32602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX6hR-0007RI-AB; Mon, 26 Oct 2020 17:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12523.32602; Mon, 26 Oct 2020 17:54:29 +0000
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
	id 1kX6hR-0007Qt-6t; Mon, 26 Oct 2020 17:54:29 +0000
Received: by outflank-mailman (input) for mailman id 12523;
 Mon, 26 Oct 2020 17:54:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3TsF=EB=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kX6hQ-0007Qo-4c
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 17:54:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a15c5f22-ea17-4a82-a962-564f7853fae2;
 Mon, 26 Oct 2020 17:54:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0B1A3AF86;
 Mon, 26 Oct 2020 17:54:25 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3TsF=EB=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
	id 1kX6hQ-0007Qo-4c
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 17:54:28 +0000
X-Inumbo-ID: a15c5f22-ea17-4a82-a962-564f7853fae2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a15c5f22-ea17-4a82-a962-564f7853fae2;
	Mon, 26 Oct 2020 17:54:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603734865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Si4DlmvMHXJaQ0sr20k69+hyq1qX3Q6SZo+emlwosWc=;
	b=m+0Nn43aSUIih4OKaQSpUcT9hzEWZgmfJv2EpNYUkBnyURwL9KatFDHF5XwKkrj6VIEbjV
	6pHxaCRUt+WNm3kuizq6W62nooXc6T6siHOH//IRS56z8YhIirYYxAt7jAtJu+3BCcby8U
	RMuHZ3s2ZGw2Pd33pXLNcVQPOMEdkRY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0B1A3AF86;
	Mon, 26 Oct 2020 17:54:25 +0000 (UTC)
Message-ID: <6da1d0b4b573997ff24a3b5597e764d0dba7597d.camel@suse.com>
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?Fr=E9d=E9ric?= Pierret <frederic.pierret@qubes-os.org>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Cc: Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?=
	 <marmarek@invisiblethingslab.com>
Date: Mon, 26 Oct 2020 18:54:23 +0100
In-Reply-To: <f6d179ac-eccc-99e1-ee0f-ea0d7f5ed335@qubes-os.org>
References: <a8e9113c-70ef-53fa-e340-be15eb3cba57@qubes-os.org>
	 <30452e9c-bf27-fce2-cc20-4ce91018a15a@citrix.com>
	 <f6d179ac-eccc-99e1-ee0f-ea0d7f5ed335@qubes-os.org>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-P2cS9z0+kmEVv02Wx7Du"
User-Agent: Evolution 3.38.1 (by Flathub.org) 
MIME-Version: 1.0


--=-P2cS9z0+kmEVv02Wx7Du
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-10-26 at 17:11 +0100, Fr=C3=A9d=C3=A9ric Pierret wrote:
> Le 10/26/20 =C3=A0 2:54 PM, Andrew Cooper a =C3=A9crit=C2=A0:
> > > If anyone would have any idea of what's going on, that would be
> > > very
> > > appreciated. Thank you.
> >=20
> > Does booting Xen with `sched=3Dcredit` make a difference?
> >=20
> > ~Andrew
>=20
> Thank you Andrew. Since your mail I'm currently testing this on
> production and it's clearly more stable than this morning. I will not
> say yet it's solved because yesterday I had some few hours of
> stability too. but clearly, it's encouraging because this morning it
> was just hell every 15/30 minutes.
>=20
Ok, yes, let us know if the credit scheduler seems to not suffer from
the issue.

I'm curious about another thing, though. You mentioned, in your
previous email (and in the subject :-)) that this is a 4.13 -> 4.14
issue for you?

Does that mean that the problem was not there on 4.13?

I'm asking because Credit2 was already the default scheduler in 4.13.=C2=A0

So, unless you were configuring things differently, you were already
using it there.

If this is the case, it would hint at the fact that something that
changed between .13 and .14 could be the cause.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-P2cS9z0+kmEVv02Wx7Du
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl+XDU8ACgkQFkJ4iaW4
c+6VZhAAy798V6/hEZDTa0kmdU2imGrd6bqBQwJ0T3fm/kcL09xYpRS6u9+GRwOb
hhAnM+c3J/OrgpGiCFx3nHGdyazKCX7vaNWjAsfQB6uGgnnGHpJTHj6mVZ4MEgda
Auj87jcKQ61UJM2ycMeSz3Z2Ynt1p09cRoMTMoX5b96cuuZMT3PFiXv7LMF0BRBb
AC2WexSSV1TRTmAQenSVO1ftEmeMv4Z1ZjVPBPgllT+Qxhg5Yq7i+WqPS4MmFRHA
xLbNDqVOG4FhD4zJw6LuGy0+oZ1vyH3bDNQRzu+uO7ue+eryQcB26mfWG/u+Oro7
WYWoqEyxrffAPaLYt3wdHqG1NOq1e6uMVmbLaYygZRPB54HkNxpFscaPh0JkdcVL
zxJaNh5s2U5e41hCfT6hABeQt8EIitE+oRpifgLywzouo7TPnvnp2bb3j8GdC5Lw
EdsfAXf7jfNU/TuCpmWPB+2qWp9i1DZMVLT2XtrmGE6qhZh5V1Fky+tVuUohgZnK
x4TDL3yPHT6u4/y82gyoUY89raJxiYVyDeNCKH1RE8/3CgG4ggRz7UeuXor1QOYj
tfNSPWz9nAkxUjKPXPb2Bmo+/lwmFpLH4DX+mpa+vNXbBVLHTJpe4WBdLinmo2k3
LgkQaDjjo94DQyVAY1ZyYMRKSTn0mZq9TTL7yvhUIrrJsnm/wn4=
=54mQ
-----END PGP SIGNATURE-----

--=-P2cS9z0+kmEVv02Wx7Du--


