Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA4535FD72
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 23:51:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110836.211751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWnQ8-0002jr-Mm; Wed, 14 Apr 2021 21:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110836.211751; Wed, 14 Apr 2021 21:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWnQ8-0002jW-Js; Wed, 14 Apr 2021 21:51:36 +0000
Received: by outflank-mailman (input) for mailman id 110836;
 Wed, 14 Apr 2021 21:51:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2F6e=JL=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lWnQ7-0002jR-4f
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 21:51:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 30c1b858-dbb4-47f2-a698-3a24efe2750e;
 Wed, 14 Apr 2021 21:51:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3BC9BAE78;
 Wed, 14 Apr 2021 21:51:33 +0000 (UTC)
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
X-Inumbo-ID: 30c1b858-dbb4-47f2-a698-3a24efe2750e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618437093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fyx9vlsOHGOYIIT42w0AhSKt3/73aRp0v4Jr2WTKp84=;
	b=I117XwifSnF/0PMJp99RVD37wz5ZP2iy37UyHu+b3086tUQfbsw5rte3lGDchwJGoSfnl0
	9sxMi5fAlddCJAUJtWPreMDMfbWu443eYu8wkq1QBZYRC62f65+SC0cRdOGENCNTa0OQeu
	6caZ70JI8fe0b6AcRnpbrH0zf1OXZFU=
Message-ID: <f99d5176df0298e8057e21f24a627832121b7aa8.camel@suse.com>
Subject: Re: A KernelShark plugin for Xen traces analysis
 =?UTF-8?Q?=E2=80=8B?=
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Giuseppe Eletto
	 <giuseppe.eletto@edu.unito.it>, linux-trace-devel@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Cc: Enrico Bini <enrico.bini@unito.it>
Date: Wed, 14 Apr 2021 23:51:31 +0200
In-Reply-To: <7184a7d7-6bca-4106-d70e-8cf9d5b227fb@citrix.com>
References: 
	<CALTQNB5X1+G33Qoh5nNxttQe_GkzKvJFLfEXQszsc6XYr+NgUA@mail.gmail.com>
	 <f33b39a5-9bbd-934f-a9cd-c536a0ba7416@citrix.com>
	 <eefc512b8c1ac26c4eaae81e79ee0243901a3de2.camel@suse.com>
	 <7184a7d7-6bca-4106-d70e-8cf9d5b227fb@citrix.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-PG2JFKkoV8wEkuAFwNPi"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0


--=-PG2JFKkoV8wEkuAFwNPi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-04-14 at 19:11 +0100, Andrew Cooper wrote:
> On 14/04/2021 18:31, Dario Faggioli wrote:
> > > A couple of questions.=C2=A0 Which Xen libraries do you currently use
> > > map
> > > the
> > > frames?
> > >=20
> > Err... If I understood the question none, as the plugin loads and
> > parses a file, as it is produced by `xentrace`. :-)
> >=20
> > But maybe I didn't understand the question?
>=20
> Ah no - that answer's my question.=C2=A0 I'd blindly assumed that the
> plugin
> was talking directly to Xen to obtain the tracebuffer.
>=20
Right. No, KernelShark, for Linux, "just" reads trace-data file
produced by trace-cmd. So we adopted the same model and made it "just"
read a trace-data file, in our case produced by xentrace.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-PG2JFKkoV8wEkuAFwNPi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmB3Y+MACgkQFkJ4iaW4
c+7q0w/+NlMki+7+D+3hMDgjz+dAjBpw5KL6YtcIGK2W8gZn+gwNORsAxPmq7HHN
PzEvkvGZSVn0sr9logV/Jq6Q9eABr6ueHYI8qQeccCeAj5QudTM4/ee9qK9SLDeZ
e/YPN1ya1u8UWvRj3xrJoL1OFhNdHR9OrhC2NeTmCL2zu199YORosUGjpBuXnPhJ
YcW5dcjwlwR3wD/lvB/Rh0N6Rt5JpMy/9h2qS/J62M8sLak9YGMns8tAjrTBhK2d
P4dHRfO1JjLlFaiPFdgUkTy33OQQ8kMfXDchUPeGUscrCFQ6yJbdvqc0l/zxQnWQ
wF0CKTuoQAGMMA39j/azawI4cYtT3+OzEvcXOeWljwjLiQqMGhfD1adiuiIyD6KO
OSue/fQ2pi1I5ur5zCFcM7vUrNSds0+v/BiLM5TzC+mtmzJxrkWw/fnCPJ6KazIu
lvqxnWi9APeDgnrwCiMtyYfdfWlS2qA9Z/WrjktYtdmPHwloeknx7gYIAoX0ndMt
HDjDhMRTG92z60VivEJEh5epRqraIo81lXa8LQRpC7orYvmi1sVz+opBfFuYYAjC
8x2OhF5VbAURQiZiSqFHJ/r6HQ1E3vBNn9oHeVJ9cHKE3MJAGwmlSCWGTEWk3Ub/
mHmlDMvvSyeR7t9P//wGLDk92FaPvkjZkjZ6lx7+h1uWs0JnsQQ=
=ZS6J
-----END PGP SIGNATURE-----

--=-PG2JFKkoV8wEkuAFwNPi--


