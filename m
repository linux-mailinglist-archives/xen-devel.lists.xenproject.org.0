Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB5C308100
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 23:16:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77477.140336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5FZl-0000T5-52; Thu, 28 Jan 2021 22:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77477.140336; Thu, 28 Jan 2021 22:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5FZl-0000Sj-1w; Thu, 28 Jan 2021 22:15:41 +0000
Received: by outflank-mailman (input) for mailman id 77477;
 Thu, 28 Jan 2021 22:15:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ue11=G7=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1l5FZj-0000Se-9I
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 22:15:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07167f84-afa2-4100-acbc-353c5b855e89;
 Thu, 28 Jan 2021 22:15:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4458DAC60;
 Thu, 28 Jan 2021 22:15:35 +0000 (UTC)
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
X-Inumbo-ID: 07167f84-afa2-4100-acbc-353c5b855e89
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611872135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qq2yfbSQNdjfetnY+9TsnGwxVgjuUNRsQW9UkuBm2f4=;
	b=NmPd0jsucYr5DeDn+fY70Dpe5GqBZkHy96hTfWGKdbqEHxU8GqBM8go5AX2VjIDAM7PMGi
	xsoGbiq/7pxs97XdAIhc6rzBocsyEf6ZQuVW4i59+qUm6+HD3GnHrDgSZZPZCOsLrb6y4r
	36CW6yV6+jjjkYCb9CbysakAvUkZp0k=
Message-ID: <691bf784db3dfc4e4a93b5770494ce2c8438d84b.camel@suse.com>
Subject: Re: [ANNOUNCE] Xen 4.15 release schedule and feature tracking
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
 <iwj@xenproject.org>,  xen-devel@lists.xenproject.org,
 committers@xenproject.org, Tamas K Lengyel <tamas@tklengyel.com>,
 =?UTF-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Date: Thu, 28 Jan 2021 23:15:33 +0100
In-Reply-To: <8c4b30f5f16824124e50922c871d440bf39991ba.camel@suse.com>
References: <24567.7198.846779.557032@mariner.uk.xensource.com>
	 <24576.27654.137226.608671@mariner.uk.xensource.com>
	 <017cd214-fce8-f8b7-7134-0a89eb45c2ac@citrix.com>
	 <8c4b30f5f16824124e50922c871d440bf39991ba.camel@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Av9S42xPbT55TtkvE/hh"
User-Agent: Evolution 3.38.3 (by Flathub.org) 
MIME-Version: 1.0


--=-Av9S42xPbT55TtkvE/hh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-01-28 at 19:26 +0100, Dario Faggioli wrote:
>=20
> [...]
>
> 2) Then there has been his one:
>=20
> =20
> https://lists.xenproject.org/archives/html/xen-devel/2020-10/msg01005.htm=
l
>=20
> Here, the where reporter said that "[credit1] results is an
> observable
> delay, unusable performance; credit2 seems to be the only usable
> scheduler". This is the one that also Andrew mention, happening on
> Ryzen and with SMT disabled (as this is on QubesOS, IIRC).
>=20
> Here, doing "dom0_max_vcpus=3D1 dom0_vcpus_pin" seemed to mitigate the
> problem but, of course, with obvious limitations. I don't have a
> Ryzen
> handy, but I have a Zen and a Zen2.=C2=A0
>
And, what I meant here was "I have an EPYC and an EPYC2". Sorry.

Also, in my previous email, I forgot to properly trim the context above
my actual reply.

Sorry about that too.
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-Av9S42xPbT55TtkvE/hh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmATN4UACgkQFkJ4iaW4
c+5dqRAA1Pqa7dRNU2FpOVW40/KIPiQuaIm+hF1/vkykKbGmmMQ3HcQ3WGNuCa8g
qvpUXttJ/N+DdzR3IWPrHVBbQEbMKIFpYI0RXEQ+/KkYhi21/JNxeAiuv9D9d24B
gdEig5kAY8IKx6VRVbVp4NT10ZTjzrQHBreBjqEpk31OJI83Vu2ktOmrFwmulGK0
Zfs0iOHr6wDEEf/o0IKF4ud9k4NpnGs2bfdv2c7PsSkm9YmPGtrv7TwKKyCMbEiJ
0tBoamONeZbLEnd6sBapYouD7BzminHOAY+W1VYT40rbmIdVLq4FyBLGWRMyruMx
J+w6VO5pnEIkOhggdCzouYEcva8o+sxpHv70hjq8zO0jp8vVKsbGZOHr3UMI/UaD
aEmTW0hVjNvQU944FX6rGhZ7Ozr38PH8qlBbiAbZKtQW296liOQKX0QKhNccJmZq
Zugr4z9YMdAjtDeo68/q7c5EplArcAL4UFTw2xgWt3p77PrS50OvCL848qOftX5I
X0KfPaSeYjJ2VnmPa3yVM9PDF1qbacL0LIQIWp8DOYRG6IJvXpLQPeAWEPqY8gaX
eZd3TcztnziyTxqAJAINZlICfYK3H978s6mRXcTpbO6JVx3Xf1N3nNyfw1Eilgjs
PTaCDzpQVarutjT32hBVuQ7EF9qLG7v6F/kkxAvNf+hOUGnZAAg=
=PNyO
-----END PGP SIGNATURE-----

--=-Av9S42xPbT55TtkvE/hh--


