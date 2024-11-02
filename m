Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF589B9C9D
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2024 04:56:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829289.1244363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t75Fd-0006k6-59; Sat, 02 Nov 2024 03:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829289.1244363; Sat, 02 Nov 2024 03:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t75Fd-0006hW-1w; Sat, 02 Nov 2024 03:56:37 +0000
Received: by outflank-mailman (input) for mailman id 829289;
 Sat, 02 Nov 2024 03:56:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8EOZ=R5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1t75Fb-0006hM-JW
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2024 03:56:35 +0000
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71186fe7-98ce-11ef-a0c5-8be0dac302b0;
 Sat, 02 Nov 2024 04:56:31 +0100 (CET)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfhigh.stl.internal (Postfix) with ESMTP id D0719254013A;
 Fri,  1 Nov 2024 23:56:29 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Fri, 01 Nov 2024 23:56:30 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 23:56:28 -0400 (EDT)
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
X-Inumbo-ID: 71186fe7-98ce-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIwMi4xMi4xMjQuMTU4IiwiaGVsbyI6ImZoaWdoLWI3LXNtdHAubWVzc2FnaW5nZW5naW5lLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjcxMTg2ZmU3LTk4Y2UtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNTE5NzkxLjE5MTcxMywic2VuZGVyIjoibWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1730519789;
	 x=1730606189; bh=RAyFWQwC3Ay167Vb6n9KZDWo0Hb+gByl4t3ggZWtfCo=; b=
	pcxon6pjrOtzWEASjjC/P4s/1NlYWzwaEkVO1UJZpOt/evqQS42BaE5njFZaIZLD
	rh/PS4jPI45z2VuPMxk82xqvdUXAPNANQV6CVFR7fNY99IfjHDYZt24FgbmEdQ5O
	Tq6FmVPxvrExGxE+2i+7Can76vrYlS5oN+3My4MFCuo7ZMNCv/3flQAyCPv8SW7v
	A3aVE0Duyfh+CVFP5dxJUzny7AUCiP90dGl7+/R4JFHwv31/oGrzQKD2wcuNHPgD
	r5gknLfL6DHIaKZ32M5rv6GD2+gfgtDr2yLPp3p5wIeSEDOzlsl2fjVMpscsTfQK
	nQ/l01QnXya6vhBJYomeow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730519789; x=1730606189; bh=RAyFWQwC3Ay167Vb6n9KZDWo0Hb+gByl4t3
	ggZWtfCo=; b=QllZsyQKVXOKYlyntYC2U6LNDNS0h1CwHu52u4+LsSGuUO0OT4Y
	t5Bzv28Rj0y/x1ZV6GPO6GYc0ZaMqNutta4Y+x/3T0WTyiiJ0HacUQxr70HgbqNh
	1gcQGl6RGp/PkoCIZwg+ZHVr/TVSgAbbWR0OBKLJVCQi9NHgdj6Cd9gLYOr8QbcB
	lfWsAOEKop5DaFbYaP38rbLtbsRPNAcwBPdihQN8DmgJdqyMWOzWog1EkFu86qzK
	mcmrbcn/ybENESrhChHISa6SFMM6/uD25vIITCiBvOFuN6N8/4WlkIVy+XKxr286
	nKyORfko/hJZBxww3sA0/2mwzECymEYmYjw==
X-ME-Sender: <xms:7aIlZyEenwwIN7zfX6k01B2pz--wYoN1oCmrFevpX5__zYW4wyOdVQ>
    <xme:7aIlZzWWMwE4Do2AhxsMi2O3hj_yUHbi7b2U5Qnr0p5l2tt5y1Od1kRiMUP9oPiKw
    3EhIzIPZHMkMw>
X-ME-Received: <xmr:7aIlZ8LqJkJmxY_szlfQqhUIt-6StqEq4-PQgC2nZndOQswC_0lgVpjr4LMgWt2yMRUJzboLg5aofNtR0qCWkb9QjTg_N5L6Xg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeltddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhoghgv
    rhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslh
    hishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepjhgsvghulhhitghh
    sehsuhhsvgdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghith
    hrihigrdgtohhmpdhrtghpthhtohepgigvnhhprhhojhgvtghtseihmhihrdgsvgdprhgt
    phhtthhopegufihmfiesrghmrgiiohhnrdgtohdruhhk
X-ME-Proxy: <xmx:7aIlZ8GsNw2cNo21fPvNR6DEpBp3NRegBOSzlgloegS98Kqv5-j59A>
    <xmx:7aIlZ4W4GYKSpmH0fDXxbNvKzuZEQvj5MCskPZl1gjEAXO2DQ-C9FA>
    <xmx:7aIlZ_OqPXJNjybb2xXRi2WXffx4TlUvR1ENlkIQCulliYUBZxXQhw>
    <xmx:7aIlZ_2sedDFI6lVF98rSO8gqNGUNGi5h6ImtEU_dCrgsATsPuqP4Q>
    <xmx:7aIlZydS1L_5LyEIXkcoXpnCk4sj2qBJBR6cE1MxfIi1TiDZif3CSAEI>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 2 Nov 2024 04:56:26 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH v4] x86/io-apic: fix directed EOI when using AMD-Vi
 interrupt remapping
Message-ID: <ZyWi6ojhSijwne5i@mail-itl>
References: <20241031085713.6156-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n8oS9+vfPQju9yeP"
Content-Disposition: inline
In-Reply-To: <20241031085713.6156-1-roger.pau@citrix.com>


--n8oS9+vfPQju9yeP
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 2 Nov 2024 04:56:26 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Willi Junga <xenproject@ymy.be>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH v4] x86/io-apic: fix directed EOI when using AMD-Vi
 interrupt remapping

On Thu, Oct 31, 2024 at 09:57:13AM +0100, Roger Pau Monne wrote:
> When using AMD-Vi interrupt remapping the vector field in the IO-APIC RTE=
 is
> repurposed to contain part of the offset into the remapping table.  Previ=
ous to
> 2ca9fbd739b8 Xen had logic so that the offset into the interrupt remapping
> table would match the vector.  Such logic was mandatory for end of interr=
upt to
> work, since the vector field (even when not containing a vector) is used =
by the
> IO-APIC to find for which pin the EOI must be performed.
>=20
> A simple solution wold be to read the IO-APIC RTE each time an EOI is to =
be
> performed, so the raw value of the vector field can be obtained.  However
> that's likely to perform poorly.  Instead introduce a cache to store the
> EOI handles when using interrupt remapping, so that the IO-APIC driver can
> translate pins into EOI handles without having to read the IO-APIC RTE en=
try.
> Note that to simplify the logic such cache is used unconditionally when
> interrupt remapping is enabled, even if strictly it would only be required
> for AMD-Vi.
>=20
> Reported-by: Willi Junga <xenproject@ymy.be>
> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
> Fixes: 2ca9fbd739b8 ('AMD IOMMU: allocate IRTE entries instead of using a=
 static mapping')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Very lightly, but
Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

with this patch, touchpad works on Framework AMD, _without_ ioapic_ack=3Dnew
option.

> ---
> Changes since v3:
>  - Remove the usage of a sentinel value (again).
>  - Allocate an initialize the cache in enable_IO_APIC().
>  - Fix MISRA compliance.
>  - Use xvmalloc.
>=20
> Changes since v2:
>  - Restore sentinel value.
>=20
> Changes since v1:
>  - s/apic_pin_eoi/io_apic_pin_eoi/.
>  - Expand comment about io_apic_pin_eoi usage and layout.
>  - Use uint8_t instead of unsigned int as array type.
>  - Do not use a sentinel value.
> ---
>  xen/arch/x86/io_apic.c | 76 +++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 71 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index e40d2f7dbd75..4e5ee2b890a0 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -29,6 +29,7 @@
>  #include <xen/acpi.h>
>  #include <xen/keyhandler.h>
>  #include <xen/softirq.h>
> +#include <xen/xvmalloc.h>
> =20
>  #include <asm/hpet.h>
>  #include <asm/mc146818rtc.h>
> @@ -71,6 +72,24 @@ static int apic_pin_2_gsi_irq(int apic, int pin);
> =20
>  static vmask_t *__read_mostly vector_map[MAX_IO_APICS];
> =20
> +/*
> + * Store the EOI handle when using interrupt remapping.
> + *
> + * If using AMD-Vi interrupt remapping the IO-APIC redirection entry rem=
apped
> + * format repurposes the vector field to store the offset into the Inter=
rupt
> + * Remap table.  This breaks directed EOI, as the CPU vector no longer m=
atches
> + * the contents of the RTE vector field.  Add a translation cache so that
> + * directed EOI uses the value in the RTE vector field when interrupt re=
mapping
> + * is enabled.
> + *
> + * Intel VT-d Xen code still stores the CPU vector in the RTE vector fie=
ld when
> + * using the remapped format, but use the translation cache uniformly in=
 order
> + * to avoid extra logic to differentiate between VT-d and AMD-Vi.
> + *
> + * The matrix is accessed as [#io-apic][#pin].
> + */
> +static uint8_t **io_apic_pin_eoi;
> +
>  static void share_vector_maps(unsigned int src, unsigned int dst)
>  {
>      unsigned int pin;
> @@ -273,6 +292,17 @@ void __ioapic_write_entry(
>      {
>          __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
>          __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
> +        /*
> +         * Might be called before io_apic_pin_eoi is allocated.  Entry w=
ill be
> +         * initialized to the RTE value once the cache is allocated.
> +         *
> +         * The vector field is only cached for raw RTE writes when using=
 IR.
> +         * In that case the vector field might have been repurposed to s=
tore
> +         * something different than the CPU vector, and hence need to be=
 cached
> +         * for performing EOI.
> +         */
> +        if ( io_apic_pin_eoi )
> +            io_apic_pin_eoi[apic][pin] =3D e.vector;
>      }
>      else
>          iommu_update_ire_from_apic(apic, pin, e.raw);
> @@ -288,18 +318,36 @@ static void ioapic_write_entry(
>      spin_unlock_irqrestore(&ioapic_lock, flags);
>  }
> =20
> -/* EOI an IO-APIC entry.  Vector may be -1, indicating that it should be
> +/*
> + * EOI an IO-APIC entry.  Vector may be -1, indicating that it should be
>   * worked out using the pin.  This function expects that the ioapic_lock=
 is
>   * being held, and interrupts are disabled (or there is a good reason not
>   * to), and that if both pin and vector are passed, that they refer to t=
he
> - * same redirection entry in the IO-APIC. */
> + * same redirection entry in the IO-APIC.
> + *
> + * If using Interrupt Remapping the vector is always ignored because the=
 RTE
> + * remapping format might have repurposed the vector field and a cached =
value
> + * of the EOI handle to use is obtained based on the provided apic and p=
in
> + * values.
> + */
>  static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsign=
ed int pin)
>  {
>      /* Prefer the use of the EOI register if available */
>      if ( ioapic_has_eoi_reg(apic) )
>      {
> -        /* If vector is unknown, read it from the IO-APIC */
> -        if ( vector =3D=3D IRQ_VECTOR_UNASSIGNED )
> +        if ( io_apic_pin_eoi )
> +            /*
> +             * If the EOI handle is cached use it. When using AMD-Vi IR =
the CPU
> +             * vector no longer matches the vector field in the RTE, bec=
ause
> +             * the RTE remapping format repurposes the field.
> +             *
> +             * The value in the RTE vector field must always be used to =
signal
> +             * which RTE to EOI, hence use the cached value which always
> +             * mirrors the contents of the raw RTE vector field.
> +             */
> +            vector =3D io_apic_pin_eoi[apic][pin];
> +        else if ( vector =3D=3D IRQ_VECTOR_UNASSIGNED )
> +             /* If vector is unknown, read it from the IO-APIC */
>              vector =3D __ioapic_read_entry(apic, pin, true).vector;
> =20
>          *(IO_APIC_BASE(apic)+16) =3D vector;
> @@ -1317,12 +1365,30 @@ void __init enable_IO_APIC(void)
>              vector_map[apic] =3D vector_map[0];
>      }
> =20
> +    if ( iommu_intremap !=3D iommu_intremap_off )
> +    {
> +        io_apic_pin_eoi =3D xvmalloc_array(typeof(*io_apic_pin_eoi), nr_=
ioapics);
> +        BUG_ON(!io_apic_pin_eoi);
> +    }
> +
>      for(apic =3D 0; apic < nr_ioapics; apic++) {
>          int pin;
> -        /* See if any of the pins is in ExtINT mode */
> +
> +        if ( io_apic_pin_eoi )
> +        {
> +            io_apic_pin_eoi[apic] =3D xvmalloc_array(typeof(**io_apic_pi=
n_eoi),
> +                                                   nr_ioapic_entries[api=
c]);
> +            BUG_ON(!io_apic_pin_eoi[apic]);
> +        }
> +
> +        /* See if any of the pins is in ExtINT mode and cache EOI handle=
 */
>          for (pin =3D 0; pin < nr_ioapic_entries[apic]; pin++) {
>              struct IO_APIC_route_entry entry =3D ioapic_read_entry(apic,=
 pin, false);
> =20
> +            if ( io_apic_pin_eoi )
> +                io_apic_pin_eoi[apic][pin] =3D
> +                    ioapic_read_entry(apic, pin, true).vector;
> +
>              /* If the interrupt line is enabled and in ExtInt mode
>               * I have found the pin where the i8259 is connected.
>               */
> --=20
> 2.46.0
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--n8oS9+vfPQju9yeP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmclouoACgkQ24/THMrX
1yzdhQf/SKzXn5vhvljZoCJg+MgM4BKyhszSgJ3ojqAAIdWcnN/d6XKPWtfanH6c
LVCXu4AGHJ1ysp7d/7oFYp3OdGTdoooe5cVl/BKBAccooiaG+JbO5aydUP0TWIb6
a3IMtZd1ombeQ8VwCOo4Kq6ijiIfCD10Nbhksj3iXSFYV90gaI0Zd8MWDjsSRVFT
soNX/GfFKvGWQDlROtHZ0PPIRyj+EH4S+L0bSzY3O5eIgMKpjO0LA8S5vJIlRAhe
6kf5+QwhPPrqpi6Kdo5vtEmcCRS9Gsed2jS4pkKWUlpv7pqtud49IYoFX4y7VLYb
QpWTjpD3hRM9CNEO5ubVyOS2NJUSNQ==
=5/Zf
-----END PGP SIGNATURE-----

--n8oS9+vfPQju9yeP--

