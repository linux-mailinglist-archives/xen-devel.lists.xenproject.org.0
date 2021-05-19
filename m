Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF573894CF
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 19:52:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130286.244136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljQN2-0000j2-0j; Wed, 19 May 2021 17:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130286.244136; Wed, 19 May 2021 17:52:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljQN1-0000gf-TQ; Wed, 19 May 2021 17:52:35 +0000
Received: by outflank-mailman (input) for mailman id 130286;
 Wed, 19 May 2021 17:52:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ufKr=KO=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ljQMz-0000gS-TA
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 17:52:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49dd08ff-c781-420d-9e3c-3da7321213a6;
 Wed, 19 May 2021 17:52:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1F6D0AC47;
 Wed, 19 May 2021 17:52:32 +0000 (UTC)
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
X-Inumbo-ID: 49dd08ff-c781-420d-9e3c-3da7321213a6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621446752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zedULLW8DGxX1TLqyo9Mi46k+PxRWRbfziyEmVYvztA=;
	b=adc3KTvdkttFurZbadKEWBWose4cSZpPL4W5vQOLgSfYzK2VuHDRpqNcgX+10R+8ar6l8N
	Ezd/GBvSx1ya6YGNy3p2V7OasvdsnPjlbbnHUZdWJzwFp1ex2oDyNJCXSQbAZKDNOQdFZo
	8ScfT2YkOgS1Y0EDwt8L8OP68DDHdGo=
Message-ID: <b596d5ea2e96be5c6d627e14b87beb51ba4a094e.camel@suse.com>
Subject: Re: [PATCH v2 2/2] automation: fix dependencies on openSUSE
 Tumbleweed containers
From: Dario Faggioli <dfaggioli@suse.com>
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Date: Wed, 19 May 2021 19:52:30 +0200
In-Reply-To: <YKSv/BGxuy+OCn3t@Air-de-Roger>
References: <162135593827.20014.14959979363028895972.stgit@Wayrath>
	 <162135616513.20014.6303562342690753615.stgit@Wayrath>
	 <YKSv/BGxuy+OCn3t@Air-de-Roger>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Z8btzhCDS64c9HjaHiXd"
User-Agent: Evolution 3.40.1 (by Flathub.org) 
MIME-Version: 1.0


--=-Z8btzhCDS64c9HjaHiXd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-05-19 at 08:28 +0200, Roger Pau Monn=C3=A9 wrote:
> On Tue, May 18, 2021 at 06:42:45PM +0200, Dario Faggioli wrote:
> > Fix the build inside our openSUSE Tumbleweed container by using
> > adding libzstd headers. While there, remove the explicit dependency
> > for python and python3 as the respective -devel packages will pull
> > them in anyway.
> >=20
> > Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
>=20
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
Thanks!

> Can you try to push an updated container to the registry?
>=20
Yeah, I tried, but I'm getting this:

STEP 8: COMMIT registry.gitlab.com/xen-project/xen/suse:opensuse-tumbleweed
--> 940c6edbff9
940c6edbff965135a25bc20f0e2a59cf6062b9e8bc3516858828cbb7bba92d8f
Getting image source signatures
Copying blob acc28ee93e9b [--------------------------------------] 8.0b / 3=
.5KiB
Copying blob 89c6eef91991 [--------------------------------------] 8.0b / 5=
7.0MiB
Copying blob 20dabc80d591 [--------------------------------------] 8.0b / 9=
0.6MiB
Copying blob 5ea007576ed8 [--------------------------------------] 8.0b / 2=
.0GiB
Error: error copying image to the remote destination: Error writing blob: E=
rror initiating layer upload to /v2/xen-project/xen/suse/blobs/uploads/ in =
registry.gitlab.com: errors:
denied: requested access to the resource is denied
unauthorized: authentication required

make: *** [Makefile:15: suse/opensuse-tumbleweed] Error 125

So, either I'm doing something wrong, or I was just misremembering and
I don't have the permission to do that... Can we check if I do?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-Z8btzhCDS64c9HjaHiXd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmClUF4ACgkQFkJ4iaW4
c+4O/xAAwSdCZwqauw3kclkn03W5pkzgTdUyxwEJtENqywjoyNRauXX8rWE68DIe
rReTh2YWZfTWURxnk1XmhMN78TIBa/BsCmMe39hbEU6iesk9pUGTV9vamX+9+KMB
LlFbzT1wCxNNKVUxxeo49K7F3ZUL1wQTAO6nHlfDBEHTdRUF5x/Y1ncJ4YYrJ6vL
D/Qsq6tem2XoxffgX8pUwqCvQXRRecfp8GnA3l6G1GiZAImryPkGAtAufQXVQb3F
/EdjD7InES/zMK6HrftPyFWYw+DEctHiVaNTq+a1UQ1xlwABTtu+YOb12DF2Pml5
VgXi4IrkRQrx2W5iiWmXvzWd3s2ERs2xsOE6r7pcUp+bpmP1qsEn8ckjHgB4q7eh
M08Zf0OABGrXf8CU6H5TxPF1I07LGNK3QzN6COv/ZNj5U0/H/E35r/viagm4TsdN
5uhtPY9Ai9tAInB74B4RDYIzi8P6OiDAMw4p8skeHrKRILBVCUuL0PbtqsCQAexM
LxjJNRQaXTrtmODxDWwTkGXf1UC8Ww/h20eDHrXyMmX2fMXrx7RqwZShOOSOAS1H
YdCPpSlDLYa+Rs1oWBe2a/MzwkrMilNG6tleqya+j8yojLqPgD3/9T7j5uwOlKsw
Hjv0UKIS3fhuHo1bbuG0Ekw3pQerlr1kZXUr+0ptJwqYW3U+a/Q=
=Ji1a
-----END PGP SIGNATURE-----

--=-Z8btzhCDS64c9HjaHiXd--


