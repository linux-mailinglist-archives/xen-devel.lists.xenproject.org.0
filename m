Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C97D38BDE2
	for <lists+xen-devel@lfdr.de>; Fri, 21 May 2021 07:27:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131108.245216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljxgV-0003Mo-KP; Fri, 21 May 2021 05:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131108.245216; Fri, 21 May 2021 05:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljxgV-0003Jz-Gw; Fri, 21 May 2021 05:26:55 +0000
Received: by outflank-mailman (input) for mailman id 131108;
 Fri, 21 May 2021 05:26:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jA7z=KQ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ljxgU-0003Ds-Kb
 for xen-devel@lists.xenproject.org; Fri, 21 May 2021 05:26:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbdedb3e-8093-43c0-ac34-6ad09071a3c3;
 Fri, 21 May 2021 05:26:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3344AAC1A;
 Fri, 21 May 2021 05:26:52 +0000 (UTC)
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
X-Inumbo-ID: cbdedb3e-8093-43c0-ac34-6ad09071a3c3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621574812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h0Y29QIaGDhTJ8srlXj+KggabqhvgpqM7Cl5qz6AGjA=;
	b=YcXfUaKk8kBA6KxMspjLXpy2fLIGFObR5qdRGx9sgNd9rvOex4sW50kAoh02aXH+FK39XP
	FfX5LPkLPK2xB5ETinEmK24QBog80PwgCFbalyd7ZcNjLV6b+CNGJ3HQb25lF0EKX75dda
	DYqnl5sZCcHYcno5gydqNHh7jhzUQdI=
Message-ID: <8f780c50f5f672c65bc6a917460a5743e157707a.camel@suse.com>
Subject: Re: QEMU backport necessary for building with "recent" toolchain
 (on openSUSE Tumbleweed)
From: Dario Faggioli <dfaggioli@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
 <iwj@xenproject.org>,  Wei Liu <wl@xen.org>, Roger Pau Monne
 <roger.pau@citrix.com>
Date: Fri, 21 May 2021 07:26:51 +0200
In-Reply-To: <YKZqPMNawZUbR4eu@perard>
References: <f7738499f24f6682f4ae1c1c750e30f322dfdbf3.camel@suse.com>
	 <YKZqPMNawZUbR4eu@perard>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-tuUp2rABFTmBvrlO40XX"
User-Agent: Evolution 3.40.1 (by Flathub.org) 
MIME-Version: 1.0


--=-tuUp2rABFTmBvrlO40XX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-05-20 at 14:55 +0100, Anthony PERARD wrote:
> On Tue, May 18, 2021 at 05:24:30PM +0200, Dario Faggioli wrote:
> >=20
> > I think we need the following commit in our QEMU: bbd2d5a812077
> > ("build: -no-pie is no functional linker flag").
>=20
> Hi Dario,
>=20
Hi,

> I'm hoping to update qemu-xen to a newer version of QEMU (6.0) which
> would have the fix, but that's need a fix of libxl,
> =C2=A0=C2=A0=C2=A0 "Fix libxl with QEMU 6.0 + remove some more deprecated=
 usages."
> So I would prefer to avoid adding more to the current branch.
>=20
Sure, makes sense.

I wanted to bring it up, in case it hadn't been noticed yet. If it has
been noticed and there's a plan then we're good, I guess.

> The branch stable-4.15 already have the fix if you need, in the mean
> time.
>=20
Ok, thanks!

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-tuUp2rABFTmBvrlO40XX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmCnRJsACgkQFkJ4iaW4
c+4qxxAAi6BstseQQgqCp4YIV/kBDLfTXzojzwMZpcj+12Egx8VbB+QrLd6sz4LI
TDzYuOvVWs0psZZApFsOqfQCUxM9iFxbxG9ZRltxIHMvwszV2ZMN+4KSTqLQHHw1
m6yy05EBO/t73eOIjv45UUhRsQkZ+O05ne6YVl/fgO0/0FVwtfbSXht6oqmgNEsS
TkWLeUC+S1VJP2hdc6+QlJfzs0lsKIG/pW8tjjFIyCH28ZFytdYUVCW1ydgoTHJE
NTar6Tiw7vBxlU/RSO/b+4iM7U47lSD5rlVAz35SpbkOHBeRWgD49xNSoeRluAUQ
3ETn1XdF2WdGZLTqosUMybFEECl5NYUvanvilEgYls7m9vvOwGTxY4CFzXjdf7Bh
F/EK4DzIk6SSIhwxb3VO9kTf36Vp6XlLtseLKMpxnxKA7wf+nfsOb2W+ld2JePp+
OhAP34of5HiiWn/LzQNzJ/pdPMHyFTMLY24NOX/kl19XdQntyVVf15i1bQCRU/F+
q+ofdjOiSBak7Jff43vIeaJssYYMfzjbmt1LcTuRLDywAl83ZLxqE3+IgQYrWe54
YqbvyXMb+jGiD6NVVe37ydPZqSPU+c5XYGMpNj9Z5seguaKKk8dkWCh8v6d/gi7Z
fapykUNZN96QigOaMWIFA/dF10DwUkxaX7+6Y2hzONHdMnURUXU=
=j0N/
-----END PGP SIGNATURE-----

--=-tuUp2rABFTmBvrlO40XX--


