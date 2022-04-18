Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDAC505F67
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 23:36:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307621.522820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngZ2w-0007zL-TA; Mon, 18 Apr 2022 21:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307621.522820; Mon, 18 Apr 2022 21:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngZ2w-0007wM-QB; Mon, 18 Apr 2022 21:36:34 +0000
Received: by outflank-mailman (input) for mailman id 307621;
 Mon, 18 Apr 2022 21:36:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FkDd=U4=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1ngZ2v-0007wG-8K
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 21:36:33 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bc2f5fa-bf5f-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 23:36:31 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 6773B5C00E2;
 Mon, 18 Apr 2022 17:36:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 18 Apr 2022 17:36:29 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Apr 2022 17:36:28 -0400 (EDT)
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
X-Inumbo-ID: 9bc2f5fa-bf5f-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650317789; x=
	1650404189; bh=jaVPkCHjJZvy8W69XBYb9VIwIp1IMXE4f8+LGNc37jA=; b=Z
	JvYTwfNqdryzXq1O9EEEDFzGElszNPUm304mAPfr3UwvrfaHf5FeRcC5wuDbI5jB
	6+y8wgQQpgv0oKsno8GhMDBccOtxQyZUaB+kL3btKRIxN8rwF74dUtmPDnsYY5+O
	UtNWeTgzIfGdC+ejvQepqWubcMi2XnfY/wg5Soz0jGK6jVU8TP9YuZVoZNQ+81H/
	9lWf9r/GSTTISS2No3u69j0PSunC0q/XqtNQwVMjEg+Z/HKbaUA1lRQWt5a/sjtq
	Te2iY4/VAh2n0tygIIRHqFZx9GteyKEICrnC/HQJJf7JZZj4h0ttoTQPLMU+4oMv
	KRb2y6EuDedO7E/6obFzw==
X-ME-Sender: <xms:3NldYoIsDq-fC9TfubcuhJehhPibReupd5moWU_FWD-c7v4idKtNYw>
    <xme:3NldYoLb01AMXneladr2bC44d0q73v7li7-yl50Xo1kVcQ4A8A1JO7HURViClqJer
    oujxo4RotL2tyA>
X-ME-Received: <xmr:3NldYouao9CeeAG6YLjlpNZQzMavsETQSw6xrQp67t_5EARkKW9h5Wnk-xqS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtvdcutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhiucforghr
    ihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomheqnecuggftrfgrthhtvghrnhepvdefleelfeefteekueeuvdfgtdegveekieff
    geeuffeuudeitddvkedtjedvueejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:3NldYlYbiRkfQln5teLiLwFnPeA2R2csCAJr5KFgE3BboOUS9j1n-Q>
    <xmx:3NldYvarexHTZqKrUejxBxsMxXEUpULRZgMAq89YdvNs9fkV6HKyvQ>
    <xmx:3NldYhDY1enbrQ4_CXZ4oiZRup-5rM6aMtVDYuTDw9Avl1TdzTRVpw>
    <xmx:3dldYkO2RyXS-d5LvKdgAxNtVT4ZSL2DyLeoR8xX_jRwu4icmCPv5g>
Date: Mon, 18 Apr 2022 17:36:22 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] Grab the EFI System Resource Table and check it
Message-ID: <Yl3Z2nilGQemHZnr@itl-email>
References: <YkeHXFvgB3MwXnuR@itl-email>
 <72ed7420-5f01-6cf4-b1fd-dd2186162a20@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GzkyR82Ue5kMn+dX"
Content-Disposition: inline
In-Reply-To: <72ed7420-5f01-6cf4-b1fd-dd2186162a20@suse.com>


--GzkyR82Ue5kMn+dX
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 Apr 2022 17:36:22 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] Grab the EFI System Resource Table and check it

On Wed, Apr 06, 2022 at 12:10:17PM +0200, Jan Beulich wrote:
> On 02.04.2022 01:14, Demi Marie Obenour wrote:
> > The EFI System Resource Table (ESRT) is necessary for fwupd to identify
> > firmware updates to install.  According to the UEFI specification =C2=
=A723.4,
> > the table shall be stored in memory of type EfiBootServicesData.
> > Therefore, Xen must avoid reusing that memory for other purposes, so
> > that Linux can access the ESRT.  Additionally, Xen must mark the memory
> > as reserved, so that Linux knows accessing it is safe.
> >=20
> > See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail-itl/T/
> > for details.
> >=20
> > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>=20
> First a note on patch submission: Patches are sent To: the list, with
> Cc: to involved maintainers (and perhaps other interested parties).

Sorry about that =E2=80=94 I am used to Linux which does things the other w=
ay
around.

> > ---
> >  xen/arch/arm/efi/efi-boot.h |  9 +++--
> >  xen/arch/x86/efi/efi-boot.h |  5 ++-
> >  xen/common/efi/boot.c       | 77 +++++++++++++++++++++++++++++++++++--
> >  xen/common/efi/efi.h        |  2 +-
> >  xen/common/efi/runtime.c    |  5 ++-
> >  xen/include/efi/efiapi.h    |  3 ++
> >  6 files changed, 89 insertions(+), 12 deletions(-)
>=20
> This being v2 (oddly enough with another v2 sent on Mar 30), you will
> want to add a brief revision log clarifying to reviewers what has
> changed. Together with the duplicate v2 it's not really clear whether
> this was a plain resend, or whether anything actually changed (it
> looks like you did address the Arm build issue).

Only change was to break the ARM build IIRC.

> > --- a/xen/arch/arm/efi/efi-boot.h
> > +++ b/xen/arch/arm/efi/efi-boot.h
> > @@ -176,7 +176,8 @@ static bool __init meminfo_add_bank(struct meminfo =
*mem,
> > =20
> >  static EFI_STATUS __init efi_process_memory_map_bootinfo(EFI_MEMORY_DE=
SCRIPTOR *map,
> >                                                  UINTN mmap_size,
> > -                                                UINTN desc_size)
> > +                                                UINTN desc_size,
> > +                                                const EFI_MEMORY_DESCR=
IPTOR *const esrt_desc)
>=20
> Please omit the 2nd const (here and elsewhere) - no other parameters are
> modified like this.

Will fix in v3.

> > --- a/xen/arch/x86/efi/efi-boot.h
> > +++ b/xen/arch/x86/efi/efi-boot.h
> > @@ -154,7 +154,8 @@ static void __init efi_arch_process_memory_map(EFI_=
SYSTEM_TABLE *SystemTable,
> >                                                 void *map,
> >                                                 UINTN map_size,
> >                                                 UINTN desc_size,
> > -                                               UINT32 desc_ver)
> > +                                               UINT32 desc_ver,
> > +                                               const EFI_MEMORY_DESCRI=
PTOR *const esrt_desc)
> >  {
> >      struct e820entry *e;
> >      unsigned int i;
> > @@ -171,7 +172,7 @@ static void __init efi_arch_process_memory_map(EFI_=
SYSTEM_TABLE *SystemTable,
> >          {
> >          case EfiBootServicesCode:
> >          case EfiBootServicesData:
> > -            if ( map_bs )
> > +            if ( map_bs || desc =3D=3D esrt_desc )
> >              {
> >          default:
> >                  type =3D E820_RESERVED;
>=20
> How certain is it that this descriptor doesn't cover (much) more than
> just ESRT? This could be quite wasteful in terms of memory which
> wouldn't be reclaimed just because of the (perhaps small) ESRT.

I can=E2=80=99t be certain at all, but this has the advantage of a much sim=
pler
and smaller patch.  I don=E2=80=99t intend to fix this in v3, but I will se=
nd a
follow-up patch that fixes it for x86.

> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -93,6 +93,23 @@ typedef struct _EFI_LOAD_OPTION {
> >      CHAR16 Description[];
> >  } EFI_LOAD_OPTION;
> > =20
> > +struct esrt_entry {
> > +    EFI_GUID fw_class;
> > +    UINT32 fw_type;
> > +    UINT32 fw_version;
> > +    UINT32 fw_lowest_supported_version;
> > +    UINT32 fw_capsule_flags;
> > +    UINT32 fw_last_attempt_version;
> > +    UINT32 fw_last_attempt_status;
> > +};
> > +
> > +struct esrt {
> > +    UINT32 esrt_count;
> > +    UINT32 esrt_max;
> > +    UINT64 esrt_version;
> > +    struct esrt_entry esrt_entries[];
> > +};
>=20
> Please follow the naming and naming convention used by immediately
> preceding structure definitions as well as the specification: All
> names matching the spec and using typedef. That's how such structures
> would eventually be added to the EFI headers we're inheriting from
> the gnu-efi package. At such a point we would want to be able to
> delete the declarations here without needing to touch any other code.
>=20
> > #define LOAD_OPTION_ACTIVE              0x00000001
>=20
> Also please don't insert in the middle of two related definitions.
>=20
> > @@ -567,6 +584,38 @@ static int __init efi_check_dt_boot(const EFI_LOAD=
ED_IMAGE *loaded_image)
> >  }
> >  #endif
> > =20
> > +static UINTN __initdata esrt;
>=20
> Don't you need to initialize this to EFI_INVALID_TABLE_ADDR in order
> for ...
>=20
> > +static bool __init is_esrt_valid(
> > +    const EFI_MEMORY_DESCRIPTOR *const desc)
> > +{
> > +    size_t available_len, esrt_len, len;
> > +    const UINTN physical_start =3D desc->PhysicalStart;
> > +    const struct esrt *esrt_ptr;
> > +
> > +    len =3D desc->NumberOfPages << EFI_PAGE_SHIFT;
> > +    if ( esrt =3D=3D EFI_INVALID_TABLE_ADDR )
> > +        return false;
>=20
> ... this check to actually be useful?
>=20
> > +    if ( physical_start > esrt || esrt - physical_start >=3D len )
> > +        return false;
> > +    /*
> > +     * The specification requires EfiBootServicesData, but accept
> > +     * EfiRuntimeServicesData for compatibility
> > +     */
> > +    if ( (desc->Type !=3D EfiRuntimeServicesData) &&
> > +         (desc->Type !=3D EfiBootServicesData) )
> > +        return false;
> > +    available_len =3D len - (esrt - physical_start);
> > +    if ( available_len < sizeof(*esrt_ptr) )
> > +        return false;
> > +    esrt_ptr =3D (const struct esrt *)esrt;
> > +    if ( esrt_ptr->esrt_version !=3D 1 || esrt_ptr->esrt_count <=3D 0 )
>=20
> Nit: I think unsigned values would better not be compared for "<=3D 0";
> this wants to be "=3D=3D 0" (or simply use the ! operator as we tend to
> do elsewhere).
>=20
> > +        return false;
> > +    esrt_len =3D esrt_ptr->esrt_count * sizeof(esrt_ptr->esrt_entries[=
0]);
>=20
> While presently we support EFI only for 64-bit architectures, this
> can overflow for 32-bit ones. Better to guard against this right
> away. This could be achieved implicitly by ...
>=20
> > +    return esrt_len > available_len - sizeof(*esrt_ptr);
>=20
>     return esrt_ptr->esrt_count <=3D
>            (available_len - sizeof(*esrt_ptr)) /
>            sizeof(esrt_ptr->esrt_entries[0]);
>=20
> (also correcting > to <=3D at the same time).
>=20
> > @@ -846,6 +895,10 @@ static void __init efi_tables(void)
> >  {
> >      unsigned int i;
> > =20
> > +    BUILD_BUG_ON(sizeof(struct esrt_entry) !=3D 40);
> > +    BUILD_BUG_ON(__alignof(struct esrt_entry) !=3D 4);
> > +    BUILD_BUG_ON(sizeof(struct esrt) !=3D 16);
>=20
> What are these about? I don't think we have similar checks for
> other interface definitions, and I don't see why we would need
> such.

These are there because I wanted to make sure I didn=E2=80=99t mess up when
writing the struct definitions.  Will remove in v3.

> > @@ -854,6 +907,7 @@ static void __init efi_tables(void)
> >          static EFI_GUID __initdata mps_guid =3D MPS_TABLE_GUID;
> >          static EFI_GUID __initdata smbios_guid =3D SMBIOS_TABLE_GUID;
> >          static EFI_GUID __initdata smbios3_guid =3D SMBIOS3_TABLE_GUID;
> > +        static EFI_GUID __initdata esrt_guid =3D ESRT_GUID;
> > =20
> >          if ( match_guid(&acpi2_guid, &efi_ct[i].VendorGuid) )
> >  	       efi.acpi20 =3D (long)efi_ct[i].VendorTable;
> > @@ -865,6 +919,8 @@ static void __init efi_tables(void)
> >  	       efi.smbios =3D (long)efi_ct[i].VendorTable;
> >          if ( match_guid(&smbios3_guid, &efi_ct[i].VendorGuid) )
> >  	       efi.smbios3 =3D (long)efi_ct[i].VendorTable;
> > +        if ( match_guid(&esrt_guid, &efi_ct[i].VendorGuid) )
> > +	       esrt =3D (long)efi_ct[i].VendorTable;
>=20
> I think all the casts to "long" are bogus here. At the very least
> this ought to be "unsigned long", but I think in your case it
> actually wants to be UINTN (the destination variable's type). Also,
> while I guess you simply derived the two new lines by copy-and-
> paste, please avoid introducing yet another instance of the pre-
> exisiting indentation issues (hard tab and too deep when tabs
> expand to the usual 8 blank positions).

Will fix in v3.

> > @@ -1053,19 +1109,19 @@ static void __init efi_exit_boot(EFI_HANDLE Ima=
geHandle, EFI_SYSTEM_TABLE *Syste
> >      EFI_STATUS status;
> >      UINTN info_size =3D 0, map_key;
> >      bool retry;
> > -#ifdef CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP
> >      unsigned int i;
> > -#endif
> > =20
> >      efi_bs->GetMemoryMap(&info_size, NULL, &map_key,
> >                           &efi_mdesc_size, &mdesc_ver);
> > -    info_size +=3D 8 * efi_mdesc_size;
> > +    info_size +=3D 8 * (efi_mdesc_size + 1);
> >      efi_memmap =3D efi_arch_allocate_mmap_buffer(info_size);
> >      if ( !efi_memmap )
> >          blexit(L"Unable to allocate memory for EFI memory map");
> > =20
> >      for ( retry =3D false; ; retry =3D true )
> >      {
> > +        esrt_desc =3D (EFI_MEMORY_DESCRIPTOR*)EFI_INVALID_TABLE_ADDR;
>=20
> Nit: Missing blank before * and perhaps wants to cast to pointer-to-
> const.

Will change in v3.

> > @@ -1074,8 +1130,21 @@ static void __init efi_exit_boot(EFI_HANDLE Imag=
eHandle, EFI_SYSTEM_TABLE *Syste
> >          if ( EFI_ERROR(status) )
> >              PrintErrMesg(L"Cannot obtain memory map", status);
> > =20
> > +        for ( i =3D 0; i < efi_memmap_size; i +=3D efi_mdesc_size )
> > +        {
> > +            if ( is_esrt_valid(efi_memmap + i) )
> > +            {
> > +                esrt_desc =3D efi_memmap + i;
> > +                break;
> > +            }
> > +        }
> > +
> > +        /*
> > +         * We cannot pass esrt because we need to explicitly compare t=
he
> > +         * descriptor pointers for equality.
> > +         */
> >          efi_arch_process_memory_map(SystemTable, efi_memmap, efi_memma=
p_size,
> > -                                    efi_mdesc_size, mdesc_ver);
> > +                                    efi_mdesc_size, mdesc_ver, esrt_de=
sc);
>=20
> Since esrt_desc is a global variable, why do you pass it as an argument
> here?

I was trying to minimize the use of globals.  Will change in v3.

> > --- a/xen/common/efi/runtime.c
> > +++ b/xen/common/efi/runtime.c
> > @@ -52,6 +52,7 @@ static unsigned int efi_rs_on_cpu =3D NR_CPUS;
> >  UINTN __read_mostly efi_memmap_size;
> >  UINTN __read_mostly efi_mdesc_size;
> >  void *__read_mostly efi_memmap;
> > +void *__read_mostly esrt_desc;
>=20
> Why "void *" and not pointer-to-const?
>=20
> > @@ -269,14 +270,14 @@ int efi_get_info(uint32_t idx, union xenpf_efi_in=
fo *info)
> >      case XEN_FW_EFI_MEM_INFO:
> >          for ( i =3D 0; i < efi_memmap_size; i +=3D efi_mdesc_size )
> >          {
> > -            EFI_MEMORY_DESCRIPTOR *desc =3D efi_memmap + i;
> > +            const EFI_MEMORY_DESCRIPTOR *desc =3D efi_memmap + i;
> >              u64 len =3D desc->NumberOfPages << EFI_PAGE_SHIFT;
> > =20
> >              if ( info->mem.addr >=3D desc->PhysicalStart &&
> >                   info->mem.addr < desc->PhysicalStart + len )
> >              {
> >                  info->mem.type =3D desc->Type;
> > -                info->mem.attr =3D desc->Attribute;
> > +                info->mem.attr =3D desc =3D=3D esrt_desc ? EFI_MEMORY_=
RUNTIME : desc->Attribute;
>=20
> Why this override?

This tells the dom0 kernel that the memory was reserved by Xen, even
though it is of type EfiBootServicesData.  Otherwise, dom0 might think
that the memory has been overwritten with garbage.  I will use a
different solution.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--GzkyR82Ue5kMn+dX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJd2doACgkQsoi1X/+c
IsFTcxAA3hmh5pBHBjmWpI89qnoJC1h2u/DEni9ssTEVwm9ft4qHSnZ4rGQOtvTl
7+OxVdR6YTlSjs7fv6QCb3jQGuhHpZEUTmSQZeBMAg9rltBaQZcy+P8840eRb3HU
TZO0ZuBQRmdq/Qd6/28V/65fTKIg6Ag84pcIMMvlCToqf60wT/7psAy91kLkooZV
4XGyPFH4fitW7qpM9BSP31d+d8enaM0gJZEqRKDnaXjVVFtaFL+z0SodvJRszW5G
g3d1/xls2DouP0vheLU3NfGXiTQMPgCdx+pJCP/QVApGx2uK9rCdcyzJctNXqtdT
fWWcanzeWnFeLs++Wd7Q8np2ba9Ss7QHulLr0aud17xPoycL9ZvvhNH3iBsFXUgo
tfJeWPXFAxIL+LCDvjHuHmB0xspPJ7MB6clzM+9pft4s94poEdAg+hC2N+1EwB6j
gRRLoNAXGXX9fWWohu8GqfDKhyLRBB1TKz8vI7b6W5tN1q4ERMdUZGA+CPitbtO7
Z5ZGeX+RlXnpSyG5/cM7gQ/SpOaKf2nWkPokweJ04Us6eDdzkXFCPFLSX3+rVCVf
Yul0n1SRCmlFgdGIbppanybX1qiYE7LVsk6drZoj7z4rFg8guWiW8dzJLkQGSBMC
IA+DVxdptxsd5bOVnMGk8yHX1RsKxetxFrxO1fFvq0Lk143j6zw=
=F8v6
-----END PGP SIGNATURE-----

--GzkyR82Ue5kMn+dX--

