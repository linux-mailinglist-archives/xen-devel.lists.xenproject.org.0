Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D564735F9FF
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 19:46:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110725.211386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWjaZ-0003S1-Il; Wed, 14 Apr 2021 17:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110725.211386; Wed, 14 Apr 2021 17:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWjaZ-0003Rb-FQ; Wed, 14 Apr 2021 17:46:07 +0000
Received: by outflank-mailman (input) for mailman id 110725;
 Wed, 14 Apr 2021 17:46:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2F6e=JL=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lWjaX-0003Qp-Fx
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 17:46:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a65ba570-1fcd-4250-aea4-6063e34510b8;
 Wed, 14 Apr 2021 17:46:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 06DBFAD8E;
 Wed, 14 Apr 2021 17:46:04 +0000 (UTC)
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
X-Inumbo-ID: a65ba570-1fcd-4250-aea4-6063e34510b8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618422364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2g8ziAmus50KijmlfayMO50WIIrzdytTdjaNvghJ58=;
	b=ao2AhT7UTj0JIVaK5t4IyuMTfJKKRO7BIDbqsrzO0+mYsB8cwBzZaXLZqwLsxrD81gkvvK
	+GM7Htw8lIHLO/RSo86y7BrZL+MJ9Bv07sHDjiX6M1lCR80tcPxZ/gvdw4UCsQY+I2UzFl
	6LEWu9R/4jWoCRi8RRYoiZyh+MEbM/A=
Message-ID: <14510b1d24a35281362ebb0a904cd5753289f5a4.camel@suse.com>
Subject: Re: A KernelShark plugin for Xen traces analysis
 =?UTF-8?Q?=E2=80=8B?=
From: Dario Faggioli <dfaggioli@suse.com>
To: "Yordan Karadzhov (VMware)" <y.karadz@gmail.com>, Giuseppe Eletto
	 <giuseppe.eletto@edu.unito.it>, linux-trace-devel@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Cc: Enrico Bini <enrico.bini@unito.it>
Date: Wed, 14 Apr 2021 19:46:02 +0200
In-Reply-To: <8b43ae47-9d7e-a95c-4573-852d09f99662@gmail.com>
References: 
	<CALTQNB5X1+G33Qoh5nNxttQe_GkzKvJFLfEXQszsc6XYr+NgUA@mail.gmail.com>
	 <8b43ae47-9d7e-a95c-4573-852d09f99662@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-8OcG1gDXAnyfPWWORqPr"
User-Agent: Evolution 3.40.0 (by Flathub.org) 
MIME-Version: 1.0


--=-8OcG1gDXAnyfPWWORqPr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-04-14 at 12:25 +0300, Yordan Karadzhov (VMware) wrote:
> It is great to see such progress in the development of the Xen
> plugin.
>=20
> Can you share with us what are your plans for continuing this work.
> Is=20
> this a first prototype of the plugin, or it is an almost final
> version?
>=20
I'm only going to say that the plugin is working well with the traces
that we've thrown at it so far, so I'd say it's past the prototype
phase. :-P

As I was telling to Andrew on xen-devel, there is indeed some room for
improvement, e.g., the content of the 'Info' column is a bit "raw", and
can be made less cryptic and hence more useful.

To me (but this is just my personal opinion) a rather interesting thing
is whether something like this plugin should live in its own project or
will it be better be integrated in either Xen or KS sources...

And I'll now leave any further comments to Giuseppe himself. :-)

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-8OcG1gDXAnyfPWWORqPr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmB3KloACgkQFkJ4iaW4
c+66HA/+LnOVRnSSmZcyQsHrM/cjOrh/o8lfz85ZhVRCpVNOVb4dfglzKsO5shw/
BPiOwcUc8nH4PA6ThZDYu0CkkzNS7ztOW65DhxW5i+LFRIosyeZFKdFUcn8Gbum5
FTHVGRyTeVtjNhufiDLqZnKsNC+nclTPhT/NDIaDFnomjgwJuHYu4EGwAnDhzAZp
DP8cz5XtM67NNO2CAiOuh1t4nDbNq6tSbmVeTexvyW4WHnpAIl2f73y0Ufhsq5Ff
effjPSil1+Y8zvyIhg+fueIKeyA8Zk7+scnBeS2y+apTNrLNmpqxG9ksAU2Fuf8i
CspVIdZl6sCiy+mdRPW+/zvOr5WSHdbgJJwreN+5WYdv3IkxZ0Nt1GzbvSG0206P
jV7+gwJTBIvmo+NfvmKMrvjpvNTt7hmPszx6XMQMnfUs57mVxgPNa7DyNQjtOS1t
CgRRbgZhI7dAnPI5HZ7rEOagkyXmum8c6W9wA3eiWDn8sJNrRADupQJiI1Vsj+MD
qLp3dHDCgA0rcXWqPHu3JfzAWh02dn+/2twVYKFeW0lT3Sn32N0Px2mMo3dLMxE0
joRDFG164T0HZsMxR+esTxE8LAuK++3t24bjgPDjN/FElqVq8b/4zdoi4mlkQNyu
+yli1UdpWqj+tszEgZTn4sDFDeoaLAl80rik1Zh5Oj3mPwlkfEU=
=OjGt
-----END PGP SIGNATURE-----

--=-8OcG1gDXAnyfPWWORqPr--


