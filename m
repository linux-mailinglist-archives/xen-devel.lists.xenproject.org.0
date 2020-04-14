Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E583B1A7106
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 04:32:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOBMv-0006Zi-KW; Tue, 14 Apr 2020 02:32:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Htbk=56=ozlabs.org=dgibson@srs-us1.protection.inumbo.net>)
 id 1jOBMt-0006Yu-Us
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 02:32:07 +0000
X-Inumbo-ID: 050f548a-7df8-11ea-83d8-bc764e2007e4
Received: from ozlabs.org (unknown [203.11.71.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 050f548a-7df8-11ea-83d8-bc764e2007e4;
 Tue, 14 Apr 2020 02:32:05 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 491Twy4ztKz9sV1; Tue, 14 Apr 2020 12:25:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1586831426;
 bh=/kHCQs6uMq+5u4/mtGXY7lBRycSbLGC1KTKNOnBA2Y4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c02G4tpwBKtSX4Cy8dl3mWquRLc7WiCQh5osqLeugliTuijy/MqJw6vfNgSiAPsAB
 H0YZVfk8CA0NZX5GT9p219pJeA47NIauIGJIowvaA560ShRZvHfBEXyj1poiCf1JRv
 eqv3brG/NrRLimiYlJ5uPxblFDSFWPQwtvkelr1A=
Date: Tue, 14 Apr 2020 12:06:34 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-5.1 1/3] target: Remove unnecessary CPU() cast
Message-ID: <20200414020634.GE48061@umbus.fritz.box>
References: <20200412210954.32313-1-f4bug@amsat.org>
 <20200412210954.32313-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="65ImJOski3p8EhYV"
Content-Disposition: inline
In-Reply-To: <20200412210954.32313-2-f4bug@amsat.org>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--65ImJOski3p8EhYV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2020 at 11:09:52PM +0200, Philippe Mathieu-Daud=E9 wrote:
> The CPU() macro is defined as:
>=20
>   #define CPU(obj) ((CPUState *)(obj))
>=20
> Remove an unnecessary CPU() cast.
>=20
> Patch created mechanically using spatch with this script:
>=20
>   @@
>   typedef CPUState;
>   CPUState *s;
>   @@
>   -   CPU(s)
>   +   s
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/mmu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 86c667b094..8972714775 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -1820,7 +1820,7 @@ static inline void do_invalidate_BAT(CPUPPCState *e=
nv, target_ulong BATu,
>      if (((end - base) >> TARGET_PAGE_BITS) > 1024) {
>          /* Flushing 1024 4K pages is slower than a complete flush */
>          LOG_BATS("Flush all BATs\n");
> -        tlb_flush(CPU(cs));
> +        tlb_flush(cs);
>          LOG_BATS("Flush done\n");
>          return;
>      }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--65ImJOski3p8EhYV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl6VGqoACgkQbDjKyiDZ
s5KKyg/9FKEqC9D+alWv+8iNCU4sWOQEsmLKphUN1iQEQx1mOEnwEWoegLrG9pUK
mwn+RgxzzFhb2w5xatd+CDz2NzGNYfNNjOiraIrEWWKaPwK9Lz3xLw2J9ChxWcTs
BCb9Tpjl2dwIMYFW4GaLevqosEDRE0Z0IoVKGpyrlVnDLmRWX3ajL1g6KeFILh0c
TBWZlu0/WoHUIk8YZQHWtWQinxOoutnQzshdD4vxpX6qQ6ujrIhbyUFObWNJICse
A2pwFIA41B3rTESPKkxMeFoNXiWcEyd0Jk4qZvJRP0EI5TgLwkFFYogCGFYNS+Z7
UgPPvjgfGd/XbKXuf8sXjUcZgxg6M2lu8nbZ/fsRTTZV33Cjf9scAISZpLkH9bJ1
e4Ln3ge1xIUjhnQvsJ86nzHQLUPE9B1c9XHLYPI8xvDRy3Iup1DvZFi2zqZeMxP6
w0BO5X9OXBJLfo9d3O5UhsOe7fPfojFhHSp1PMovJzhRovcs40eWrJbbl6eJ0pA4
AIJeFYhPxdG/FYCdHPaDS6yIuAgrDHI0v/LXv9aQrfs4qa+ImpUosZwIY8CplZDa
HrM1GoVtuK9RcT/hANmrzlOg+dBFmQJ7IgimXNnVxBgMFQywio61NLYFrhJgfMTq
4mgomt1X+/UMWLjTmnBfgGap+QMG9ORP+H5M7RpHrwcnIjJ6vnI=
=dPwq
-----END PGP SIGNATURE-----

--65ImJOski3p8EhYV--

