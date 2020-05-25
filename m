Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A584A1E0F76
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 15:27:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdD7T-0002J3-Us; Mon, 25 May 2020 13:26:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XQbn=7H=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jdD7S-0002Iy-KN
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 13:26:18 +0000
X-Inumbo-ID: 4fc6f74a-9e8b-11ea-aed4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4fc6f74a-9e8b-11ea-aed4-12813bfff9fa;
 Mon, 25 May 2020 13:26:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 96C07ABC2;
 Mon, 25 May 2020 13:26:18 +0000 (UTC)
Message-ID: <3c5f439741f63c9f60431f2cd86a8ad7a117ec7d.camel@suse.com>
Subject: Re: [PATCH v3 2/3] xen/sched: don't call sync_vcpu_execstate() in
 sched_unit_migrate_finish()
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Date: Mon, 25 May 2020 15:26:14 +0200
In-Reply-To: <b127c20f-1ae8-242f-8435-3165a728a451@suse.com>
References: <20200514153614.2240-1-jgross@suse.com>
 <20200514153614.2240-3-jgross@suse.com>
 <a3acb930c5656524f6229592be5d542f0cb9da60.camel@suse.com>
 <b127c20f-1ae8-242f-8435-3165a728a451@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-o+4t4rc6s2Dtzj++GNSl"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-o+4t4rc6s2Dtzj++GNSl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-05-25 at 15:12 +0200, Jan Beulich wrote:
> On 25.05.2020 09:18, Dario Faggioli wrote:
> >=20
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > >=20
> > Reviewed-by: Dario Faggioli <dfaggioli@suse.com>
>=20
> Hmm, I'm puzzled: This had gone in a week and a half ago with your
> R-b sent on the 15th.
>
Well, at least I'm consistent! :-P

Being a bit more serious, yes I see this now. Unfortunately, it somehow
was stuck in the "wrong" folder in my MUA, making me think it was still
pending.

And of course I could have double checked either the tree or my sent
folder, but I didn't... Sorry for the noise. :-(

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-o+4t4rc6s2Dtzj++GNSl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl7Lx3YACgkQFkJ4iaW4
c+6DfA//ZjX/bnJRmjyF1jHRvwKCYlpXHxuxK9lMPRCbmfpC1NpR41Q0rhDbJxHa
pTh6+bsa0iow+SBy4IGBPQfYc1vQ0MJucEaxrksPibodcYbtmv4cqsmu/jLebXgh
NEiOYQSiFOWU4GVzVtGvIKsJ5Qrw0vrqOJ8LcR2FV7zh0xAw/c+8zuVGZxA5r5Uj
SLWPn3cHFazG9nKJ+qI+3s8QWcbxAeBTSvEjjSjGSpiAVxd6oVxfpeLo0ntST7bI
5D8b+sds1eSIgarxApx+OnZIFGCv5JxFX9ko3Ho2vTGVmbYu681F+/g7YCvmgRY+
fky6IGkXOURn+kb/sidTJ1FObTFo27Jfx7qTYnGI9GN+TYHTOr9vEJIRfUW3xhGk
xYgge9jRYv762dX7dF6XGvG1j/mRDtYFfV320f8vnes8eTfE+Wq4MTKuJuyAR2U4
ajuSDONF+4/9aUNg48vSkPanxYTf5H9w6ar8VYBLsZ+OkuiTXZnGpOPjf/vTA3xw
Ah60TRWTKLHqItD1Bxcq+/TJ9KJLX4HosuVnFih62mW7gX7jxZTkFoOj0bM1qUwg
I93RjNFDBakhDc1tWvlp5Gzpx7X30Dbe1jesW8EV+6QWgmVx4i/i2zL8PmC+54Cc
JwZ0eNnccvsEm6Eps7vLRDJ9R4u9kxOryvmBVklFsN/nMjTgoVM=
=7ZRU
-----END PGP SIGNATURE-----

--=-o+4t4rc6s2Dtzj++GNSl--


