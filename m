Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2651138A0B0
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 11:18:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130802.244808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljep4-00054F-PW; Thu, 20 May 2021 09:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130802.244808; Thu, 20 May 2021 09:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljep4-00051r-MO; Thu, 20 May 2021 09:18:30 +0000
Received: by outflank-mailman (input) for mailman id 130802;
 Thu, 20 May 2021 09:18:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0lSn=KP=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ljep3-00051d-Jn
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 09:18:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f433512e-2848-471b-ab6e-4315d5e52256;
 Thu, 20 May 2021 09:18:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AEB14AD4B;
 Thu, 20 May 2021 09:18:27 +0000 (UTC)
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
X-Inumbo-ID: f433512e-2848-471b-ab6e-4315d5e52256
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621502307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R+rniqkUCnnA1A3M+xbkedH13kaeiqxG/AcGLxGQMCw=;
	b=M5BBFuxNoOChyXX8GREoLkeadL+zcCne5dinAEDt20P7+Q2vFfCGGw6NReRk8tzn90Tod3
	wyKEGVJNRydyMmWTnqGb6N8nLyyj34zwbTkdv4uOoTUUrGTYe1k9ATjadJjVrLDwPHAsh3
	kawh0UDZ1LjGw2C8ZHY03TBxAtEIjA0=
Message-ID: <c905e6872399dacf960d9890432ac0d53081e05c.camel@suse.com>
Subject: Re: [PATCH v2 2/2] automation: fix dependencies on openSUSE
 Tumbleweed containers
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
	=?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Date: Thu, 20 May 2021 11:18:21 +0200
In-Reply-To: <26642b6b-c988-406e-040e-905bdeae1b2f@citrix.com>
References: <162135593827.20014.14959979363028895972.stgit@Wayrath>
	 <162135616513.20014.6303562342690753615.stgit@Wayrath>
	 <YKSv/BGxuy+OCn3t@Air-de-Roger>
	 <b596d5ea2e96be5c6d627e14b87beb51ba4a094e.camel@suse.com>
	 <26642b6b-c988-406e-040e-905bdeae1b2f@citrix.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ubIOhFvU1+SjXDW2c3Wo"
User-Agent: Evolution 3.40.1 (by Flathub.org) 
MIME-Version: 1.0


--=-ubIOhFvU1+SjXDW2c3Wo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-05-19 at 20:25 +0100, Andrew Cooper wrote:
>=20
> I built the container locally, which reused some of the layers you
> pushed, and it all pushed successfully for me.
>=20
> I've committed this series so xen.git matches reality.=C2=A0 Lets see how
> the
> updated container fairs...
>=20
Well, something still looks off, although I don't know what.

In fact, we still see:=20
https://gitlab.com/xen-project/xen/-/jobs/1277448985

checking for deflateCopy in -lz... no
2608configure: error: Could not find zlib
2609configure: error: ./configure failed for tools

Which means we're missing libz.

In fact, if I pull the container that's currently in the registry, I
can see that:

dario@b17aaa86cacf:~> rpm -qa|grep zlib                              =20
zlib-devel-1.2.11-18.3.x86_64=20

However, if I build it locally, with:

dario@Solace:~/src/xen/xen.git/automation/build> make suse/opensuse-tumblew=
eed

And then enter and use it for building, the package is there and
configure works.

dario@51e463d1d47e:~> rpm -qa|grep libz
libzstd1-1.4.9-1.2.x86_64
libz1-1.2.11-18.3.x86_64
libzck1-1.1.11-1.1.x86_64
libzypp-17.25.10-1.1.x86_64
libzio1-1.06-4.26.x86_64
libzzip-0-13-0.13.72-1.2.x86_64
libzstd-devel-1.4.9-1.2.x86_64

dario@51e463d1d47e:~> ./configure
checking build system type... x86_64-pc-linux-gnu                    =20
checking host system type... x86_64-pc-linux-gnu
... ... ...
checking for pandoc... /usr/bin/pandoc
checking for perl... /usr/bin/perl
configure: creating ./config.status

So, what am I missing or doing wrong?

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-ubIOhFvU1+SjXDW2c3Wo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmCmKV0ACgkQFkJ4iaW4
c+5J2g/+PENuILMIz/xyJxNWvIqc7Gn95SrjeH/ay6M8EqVYUtuwBN2dCHr+/Hiq
McjvhDSYGPgLu9FpxsYQLSkcaLiBSl8Fwhh+2Z+TZFWMBfoiY7bmpW/c4oJss/Nb
BJ5msa7sh08wTr2X8mI9YEPbr0DrgnvDv2E7JKSL6ASZfD4SwJO89hJM03I0vY2B
OxbeiYoBtsDBJ0tS3hUcxcX8t7Dn65BFGx1a1iEx82OFE7t89XS02yPDhy+qOgIv
HFk+QX4wsUZ38Z+qFU/DgFDSyYY03dhs8LlMKFk69J0hdm7bWTkEE68o8chAbSlK
QQyargBFBk6/yHLz/nolINrqG+KP0YEXOeXAYgPxO4XV5OkoIip+4djJrJwb6YXZ
Sn5A6F00AkgF4ThoiYOjV87X9ZbGuAk2D1/JikEKuH6X2d0otQNP/5lq7grjgwaJ
kreSFYXNxrxKShyCogCqBDlIuJi7zfTQrWziv4Ce/lsI2BukBfwRV26tq7E8sLOf
Mym58NqTP+fC7wwx/p2/uneJZtk4RITBFgyLmagktv/9WnyvXgph4qvu0y0XxDA4
CfG+CGL8ZrQbc+9UhsWCKaXSYRsOk5xtI3Brczn2quf3U5cGxnDyKFDBfrUFCdYg
CyrO2eyipJIKYrjVMavVQxRXv8VUWWzSYZlhKp39UC19of5+oPA=
=ErIj
-----END PGP SIGNATURE-----

--=-ubIOhFvU1+SjXDW2c3Wo--


