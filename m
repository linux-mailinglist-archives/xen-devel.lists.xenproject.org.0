Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E139BF1F9
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 16:45:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831223.1246424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8iCd-00065r-Rn; Wed, 06 Nov 2024 15:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831223.1246424; Wed, 06 Nov 2024 15:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8iCd-00064J-Nv; Wed, 06 Nov 2024 15:44:15 +0000
Received: by outflank-mailman (input) for mailman id 831223;
 Wed, 06 Nov 2024 15:44:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yuz5=SB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t8iCb-00064D-Uk
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 15:44:14 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6df84cf-9c55-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 16:44:10 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2fb443746b8so60898191fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 07:44:10 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fdef5d6cc0sm25720631fa.42.2024.11.06.07.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 07:44:08 -0800 (PST)
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
X-Inumbo-ID: f6df84cf-9c55-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzAiLCJoZWxvIjoibWFpbC1sajEteDIzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImY2ZGY4NGNmLTljNTUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTA3ODUwLjE2NTcwOSwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730907849; x=1731512649; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5xmtowCTRPvOi8EtuknFA8TQkk1xavZ1qqy5wcx33fE=;
        b=JrkS2YwGA2USr3AFT15wSClZbhZ5EwtzXWq0sxmbYDVZ22fp4xU2xrHGLY2nG452xg
         EmNeg3gzLhqKbQ4lHup0xLe7f34XvRWXTqpOuHKOmrEib6fs0yeA48IDM0vAOT2gw0o2
         sDlrJK9QVa8soeKmVJ4666LsYZOLYSwV5Vwnvk+nkpFphSVOO6NASR05Yz/o4e+Ytk4p
         smqd/BYVQvINZFb+1Y4wep1BsY9qWl2uEpf3zLC27AI2cAvtcVMtg8kR7hEd6Qaecsa4
         wzJFonKaHM3xLvRMRsuzv/boPM5ll3LIZ0f2Fu8oyGGclBOmTLHrm1AJaBjScHt7oRAs
         S/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730907849; x=1731512649;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5xmtowCTRPvOi8EtuknFA8TQkk1xavZ1qqy5wcx33fE=;
        b=VWjyMv3cWRUWVXhDMipP/aKisoQls/De9uPZQZ+dSQtkwNRjtqOjVrHIW2O6NXALoT
         B9PzRIgyi/BjMe3jM7zw0v/8SksCaSmFLil/m9rFgTEPgWYohgDY6eJDvMUHDgcjSdCG
         O0JeBVdOOnO50flnLZgj5LqtmJ+ZNtMvI8yPi6/nvRMschvEi+FASpxw32dXu063XdkG
         +bCII6QaMRIDzWSoVqv6kQ4Q7/LesKzmlUfFPPJydU1hqnhuetU6eG9CaH0yQGIM/vf5
         5r0pxvDkw7EJaxIOfKNCrozzMjG3F+gm3A/9feECwf7wnM/qq0ihBQU+vA8WFgrUV8Kp
         E1FA==
X-Forwarded-Encrypted: i=1; AJvYcCUbWC7RocPtgLjT5qz1679SEi1Hi0oay6fGWu0YMaI8GVtpL4Idl9jc5jcOaJjwU1eahNM4U0flGgw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqXuBHzFn4i3cXhYk78iw+7xL2C4cHDVHOEKJuexySjIs2gFu2
	HL6ZE3OhpSjlqcP48LfeqvJLZY6/+nNHstut2VJoOumrebWZvJ9a
X-Google-Smtp-Source: AGHT+IE069wUdStTgXIqRSLWl1rbHfcuu7M5riUfSTsL5H5Hs0pDnVnUNd0xUSEIROZyk1L0egDW4Q==
X-Received: by 2002:a2e:80a:0:b0:2fb:5ac6:90f0 with SMTP id 38308e7fff4ca-2fcbe09ad70mr154451331fa.34.1730907849128;
        Wed, 06 Nov 2024 07:44:09 -0800 (PST)
Message-ID: <8914c0756ee05f09874a2473af16fe26b936ea1a.camel@gmail.com>
Subject: Re: [PATCH v3 1/3] xen/riscv: introduce setup_mm()
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman	
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper	 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini	 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 06 Nov 2024 16:44:04 +0100
In-Reply-To: <8380261d24388e453e74514dad8216c97e3bebee.camel@gmail.com>
References: <cover.1730465154.git.oleksii.kurochko@gmail.com>
		 <0f7cd809e848607408ff4615e55b847f5a524559.1730465154.git.oleksii.kurochko@gmail.com>
		 <9e22b5ad-634f-48b7-b64c-fc44319a1d4d@suse.com>
	 <8380261d24388e453e74514dad8216c97e3bebee.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

On Wed, 2024-11-06 at 13:44 +0100, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-11-05 at 16:20 +0100, Jan Beulich wrote:
> > On 01.11.2024 14:16, Oleksii Kurochko wrote:> @@ -423,3 +429,138 @@
> > void * __init early_fdt_map(paddr_t fdt_paddr)
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0 return fdt_virt;
> > > =C2=A0}
> > > +
> > > +vaddr_t __ro_after_init directmap_virt_start =3D
> > > DIRECTMAP_VIRT_START;
> > > +
> > > +#ifndef CONFIG_RISCV_32
> > > +
> > > +/* Map a frame table to cover physical addresses ps through pe
> > > */
> > > +static void __init setup_frametable_mappings(paddr_t ps, paddr_t
> > > pe)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 paddr_t aligned_ps =3D ROUNDUP(ps, PAGE_SIZE);
> > > +=C2=A0=C2=A0=C2=A0 paddr_t aligned_pe =3D ROUNDDOWN(pe, PAGE_SIZE);
> > > +=C2=A0=C2=A0=C2=A0 unsigned long nr_mfns =3D PFN_DOWN(aligned_pe - a=
ligned_ps);
> > > +=C2=A0=C2=A0=C2=A0 unsigned long frametable_size =3D nr_mfns *
> > > sizeof(*frame_table);
> > > +=C2=A0=C2=A0=C2=A0 mfn_t base_mfn;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 if ( frametable_size > FRAMETABLE_SIZE )
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("The frametable can=
not cover [%#"PRIpaddr",
> > > %#"PRIpaddr")\n",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ps, pe);
> > > +
> > > +=C2=A0=C2=A0=C2=A0 /*
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * align base_mfn and frametable_size to MB(=
2) to have
> > > superpage mapping
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * in map_pages_to_xen()
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > +=C2=A0=C2=A0=C2=A0 frametable_size =3D ROUNDUP(frametable_size, MB(2=
));
> > > +=C2=A0=C2=A0=C2=A0 base_mfn =3D alloc_boot_pages(frametable_size >> =
PAGE_SHIFT,
> > > PFN_DOWN(MB(2)));
> > > +
> > > +=C2=A0=C2=A0=C2=A0 if ( map_pages_to_xen(FRAMETABLE_VIRT_START, base=
_mfn,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 PFN_DOWN(frametable_size),
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 PAGE_HYPERVISOR_RW) )
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("frametable mapping=
s failed: %#lx -> %#lx\n",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 FRAMETABLE_VIRT_START, mfn_x(base_mfn));
> > > +
> > > +=C2=A0=C2=A0=C2=A0 memset(&frame_table[0], -1, frametable_size);
> > > +=C2=A0=C2=A0=C2=A0 memset(&frame_table[PFN_DOWN(aligned_ps)],
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, nr_m=
fns * sizeof(*frame_table));
> >=20
> > Interesting - now you write out a huge amount of -1s, just to then
> > overwrite
> > most of them with zeroes. I'm not going to insist that you change
> > this yet
> > another time, but the performance hit from this is going to bite
> > you/us as
> > soon as Xen is run on bigger-memory systems.
> I agree that validating or invalidating frames in a single pass would
> be preferable to nearly two passes. I=E2=80=99m considering whether there=
=E2=80=99s a
> way to ensure that frame_table is set to -1 at compile time. It seems
> the best approach (and only one?) might be to initialize frame_table
> in
> one pass as follows:
> 1) [0, aligned_ps) =3D -1
> 2) [aligned_ps, nr_mfns * sizeof(*frame_table)) =3D 0
> 3) [nr_mfns * sizeof(*frame_table), frame_table_size) =3D -1
> Does this approach seem optimal?
>=20
> >=20
> > Plus, unless I'm mistaken, the function continues to rely on ps =3D=3D
> > 0
> > as
> > input. Just that the dependency is now better hidden. Specifically
> > if
> > you
> > calculate nr_mfns from the difference, and then use that for
> > allocation,
> > then you need to offset the start of the mapping you create
> > accordingly.
> I'm not quite understanding why the method of calculating nr_mfns
> affects how the frame_table is mapped. Isn=E2=80=99t it only necessary to
> calculate the correct size of the frame_table that needs to be
> allocated?
>=20
> I assume by the offset you mean something similar to what was done
> for
> directmap mapping?
Here is the small diff for simplicity:
   --- a/xen/arch/riscv/include/asm/mm.h
   +++ b/xen/arch/riscv/include/asm/mm.h
   @@ -132,11 +132,13 @@ struct page_info
        };
    };
   =20
   +extern struct page_info *frame_table_virt_start;
   +
    #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
   =20
    /* Convert between machine frame numbers and page-info structures.
   */
   -#define mfn_to_page(mfn)    (frame_table + mfn_x(mfn))
   -#define page_to_mfn(pg)     _mfn((pg) - frame_table)
   +#define mfn_to_page(mfn)    (frame_table_virt_start + mfn_x(mfn))
   +#define page_to_mfn(pg)     _mfn((pg) - frame_table_virt_start)
   =20
    static inline void *page_to_virt(const struct page_info *pg)
    {
   diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
   index db75aa1d4f..9bd15597a9 100644
   --- a/xen/arch/riscv/mm.c
   +++ b/xen/arch/riscv/mm.c
   @@ -426,6 +426,8 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
   =20
    vaddr_t __ro_after_init directmap_virt_start =3D
   DIRECTMAP_VIRT_START;
   =20
   +struct page_info *frame_table_virt_start;
   +
    #ifndef CONFIG_RISCV_32
   =20
    /* Map a frame table to cover physical addresses ps through pe */
   @@ -437,6 +439,11 @@ static void __init
   setup_frametable_mappings(paddr_t ps, paddr_t pe)
        unsigned long frametable_size =3D nr_mfns * sizeof(*frame_table);
        mfn_t base_mfn;
   =20
   +    if ( !frame_table_virt_start )
   +    {
   +        frame_table_virt_start =3D frame_table -
   paddr_to_pfn(aligned_ps);
   +    }
   +
        if ( frametable_size > FRAMETABLE_SIZE )
            panic("The frametable cannot cover [%#"PRIpaddr",
   %#"PRIpaddr")\n",
                  ps, pe);
   @@ -454,9 +461,12 @@ static void __init
   setup_frametable_mappings(paddr_t ps, paddr_t pe)
            panic("frametable mappings failed: %#lx -> %#lx\n",
                  FRAMETABLE_VIRT_START, mfn_x(base_mfn));
   =20
   -    memset(&frame_table[0], -1, frametable_size);
   -    memset(&frame_table[PFN_DOWN(aligned_ps)],
   -           0, nr_mfns * sizeof(*frame_table));
   +    memset(&frame_table[0], -1,
   +           PFN_DOWN(aligned_ps) * sizeof(*frame_table));
   +    memset(&frame_table[PFN_DOWN(aligned_ps)], 0,
   +           nr_mfns * sizeof(*frame_table));
   +    memset(&frame_table[PFN_DOWN(aligned_pe)], -1,
   +           frametable_size - (nr_mfns * sizeof(*frame_table)));
    }

~ Oleksii=20

>=20
>=20
> > =C2=A0At
> > which point you may need to apply extra care to cover the case
> > where
> > sizeof(*frame_table) is not a power of two, and hence e.g. the
> > first
> > valid
> > page might have a struct instance straddling a page boundary.
> The first valid page is aligned_ps ( which is aligned on a page
> boundary ) so assuming that sizeof(*frame_table) < PAGE_SIZE we can't
> straddle a page boundary, can we?
>=20
> >=20
> > > +=C2=A0=C2=A0=C2=A0 /*
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * The base address may not be aligned to th=
e second level
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * size in case of Sv39 (e.g. 1GB when using=
 4KB pages).
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * This would prevent superpage mappings for=
 all the regions
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * because the virtual address and machine a=
ddress should
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * both be suitably aligned.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * Prevent that by offsetting the start of t=
he directmap
> > > virtual
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * address.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > +=C2=A0=C2=A0=C2=A0 if ( map_pages_to_xen(DIRECTMAP_VIRT_START + (bas=
e_addr &
> > > ~high_bits_mask),
> >=20
> > I'm afraid this is correct only for the first invocation of the
> > function.
> > For any further invocation you'd likely (attempt to) replace
> > previously
> > established mappings. I think that here you need to use
> > directmap_virt_start
> > instead.
> Banks are sorted by bank start address ( common/device-
> tree/bootfdt.c:623 ):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * On Arm64 setup_directmap_map=
pings() expects to be called
> with
> =C2=A0=C2=A0 the lowest
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * bank in memory first. There =
is no requirement that the DT
> will
> =C2=A0=C2=A0 provide
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the banks sorted in ascendin=
g order. So sort them through.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sort(mem->bank, mem->nr_banks, sizeo=
f(struct membank),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmp_me=
mory_node, swap_memory_node);
> ( btw, comment is needed to be updated ... )
>=20
> Thereby no replacement should happen if I don't miss something.
>=20
> I am thinking wouldn't it be more correct to use
> mfn_to_virt(base_mfn):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( map_pages_to_xen(__mfn_to_virt(=
base_mfn) + (base_addr &
> =C2=A0=C2=A0 ~high_bits_mask),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 _mfn(base_mfn), nr_mfns,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 PAGE_HYPERVISOR_RW) )
>=20
> >=20
> > > +/*
> > > + * Setup memory management
> > > + *
> > > + * RISC-V 64 has a large virtual address space (the minimum
> > > supported
> > > + * MMU mode is Sv39, which provides GBs of VA space).
> > > + *
> > > + * The directmap_virt_start is shifted lower in the VA space to
> > > + * (DIRECTMAP_VIRT_START - masked_low_bits_of_ram_start_address)
> > > to avoid
> > > + * wasting a large portion of the directmap space, this also
> > > allows for simple
> > > + * VA <-> PA translations. Also aligns DIRECTMAP_VIRT_START to a
> > > GB boundary
> > > + * (for Sv39; for other MMU mode boundaries will be bigger ) by
> > > masking the
> > > + * higher bits of the RAM start address to enable the use of
> > > superpages in
> > > + * map_pages_to_xen().
> > > + *
> > > + * The frametable is mapped starting from physical address 0,
> > > minimizing
> > > + * wasted VA space and simplifying page_to_mfn() and
> > > mfn_to_page()
> > > + * translations.
> > > + */
> > > +void __init setup_mm(void)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 const struct membanks *banks =3D bootinfo_get_mem=
();
> > > +=C2=A0=C2=A0=C2=A0 paddr_t ram_start =3D INVALID_PADDR;
> > > +=C2=A0=C2=A0=C2=A0 paddr_t ram_end =3D 0;
> > > +=C2=A0=C2=A0=C2=A0 paddr_t ram_size =3D 0;
> > > +=C2=A0=C2=A0=C2=A0 unsigned int i;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 /*
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * We need some memory to allocate the page-=
tables used for
> > > the directmap
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * mappings. But some regions may contain me=
mory already
> > > allocated
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * for other uses (e.g. modules, reserved-me=
mory...).
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * For simplicity, add all the free regions =
in the boot
> > > allocator.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > +=C2=A0=C2=A0=C2=A0 populate_boot_allocator();
> > > +
> > > +=C2=A0=C2=A0=C2=A0 total_pages =3D 0;
> >=20
> > Nit: Is this actually necessary?
> Agree, there is no need for total_pages. It should be dropped.
>=20
> >=20
> > > +=C2=A0=C2=A0=C2=A0 for ( i =3D 0; i < banks->nr_banks; i++ )
> > > +=C2=A0=C2=A0=C2=A0 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct membank *ban=
k =3D &banks->bank[i];
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paddr_t bank_start =3D RO=
UNDUP(bank->start, PAGE_SIZE);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paddr_t bank_end =3D ROUN=
DDOWN(bank->start + bank->size,
> > > PAGE_SIZE);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long bank_size =
=3D bank_end - bank_start;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ram_size +=3D bank_size;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ram_start =3D min(ram_sta=
rt, bank_start);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ram_end =3D max(ram_end, =
bank_end);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 setup_directmap_mappings(=
PFN_DOWN(bank_start),
> > > PFN_DOWN(bank_size));
> > > +=C2=A0=C2=A0=C2=A0 }
> >=20
> > You maintain ram_start in the loop, just to then ...
> >=20
> > > +=C2=A0=C2=A0=C2=A0 total_pages =3D PFN_DOWN(ram_size);
> > > +
> > > +=C2=A0=C2=A0=C2=A0 setup_frametable_mappings(0, ram_end);
> > > +=C2=A0=C2=A0=C2=A0 max_page =3D PFN_DOWN(ram_end);
> > > +}
> >=20
> > ... not use it at all - why?
> ram_start was needed for the case when setup_frametable_mappings()
> used
> it as the first argument. Now it isn't true anymore so should be
> dropped.
>=20
> Thanks.
>=20
> ~ Oleksii


