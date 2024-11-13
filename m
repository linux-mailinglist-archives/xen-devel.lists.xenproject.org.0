Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5809C9C6E05
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 12:39:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835463.1251341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBBib-00063O-JM; Wed, 13 Nov 2024 11:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835463.1251341; Wed, 13 Nov 2024 11:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBBib-00061t-GE; Wed, 13 Nov 2024 11:39:29 +0000
Received: by outflank-mailman (input) for mailman id 835463;
 Wed, 13 Nov 2024 11:39:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lrmv=SI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tBBia-00061n-Mo
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 11:39:28 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee92080d-a1b3-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 12:39:24 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53d9ff92edaso910115e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 03:39:24 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d8267848asm2174441e87.36.2024.11.13.03.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 03:39:23 -0800 (PST)
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
X-Inumbo-ID: ee92080d-a1b3-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzIiLCJoZWxvIjoibWFpbC1sZjEteDEzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImVlOTIwODBkLWExYjMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDk3OTY0LjY4MjE0LCJzZW5kZXIiOiJvbGVrc2lpLmt1cm9jaGtvQGdtYWlsLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731497964; x=1732102764; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I1geJfzrddzBRm6Mhzzc16QDHOQMIQlXIFbM5ip5hlQ=;
        b=AgopBJOOz7FEpyzI+cnl6+NOD2QDknP8pr3Yj6gWbACz71ddqZLlZ4lwFDsJ8x5CjS
         97gZDWaxGVPHVCQ8Wd89syxaDdoVmpBFpqdExISM5d2jAnYJuoKjooGs8I+icXDNyBds
         MtY03J4nPOVevUc0DMpQg39qElMVfXf5nZQGLI3pVzUsWuFfcsWF9xw6RD2GH8OnJdAB
         oxPcWDARp5pK/+5S4kZN6OLmj5WgxJj9kwVQUyGE1aJ7nyqELmi5YslivjcmAyr6yKni
         XThm7FsYefhO7ec+ivuhCbRXcoHmOykHto62z+lSK3exTb7rsJKAi6ITmemMRmieVBKB
         GU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731497964; x=1732102764;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I1geJfzrddzBRm6Mhzzc16QDHOQMIQlXIFbM5ip5hlQ=;
        b=NLi+/PZtuGYVGWMJY7eL+2dysq++57jwrEuMxG8F9q6xfA2t+GidQ2h248ihkQL7ki
         gSvdSQ7rGjRziRXdc9hpG1ht1Tg7cCLRlfBRRBI1slbqxwItuWnNtQqdfpxhTARbl20M
         mHBRivkisIn3xHhZfSwsGSJMbMGC7OVBauk7r3l7wrMm7phyLB+oiu4gyUXWfn2DNG1o
         ZHXMHKLXAPpINvF1qhDIsX3qeALj9zdGOuc1hFI0TYWp36NMinxzzP7Sg2CSbbGKBg/+
         pYtxhFWah4o04kw2hqNTmxRHmTma4vT7AnSl8YQs6rz/FJqHFIelOgBAqI6CD816LTW/
         rUjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6NtAbzeecphYo4MniGcFFlL9r5kIUYYr/gVTzlYq4rAovD1YpYN9KHizKfYk+hJz8KfKbbxoquog=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxH5TtRx4vUdt3IrqVZASkLu/Pz19tEJ1YRSu6funZcXBG4Aa9
	HREu97BDDDpUtbM53+5+jy1fQEgR7lGS3m0aficxhsWsZogYMAWj
X-Google-Smtp-Source: AGHT+IHqXPbUoh57CKK73K6JG3JojskjcodadWTl8qefGyQWziUS/w9DE4Pu6C/a8q+ht/4mhZt+6Q==
X-Received: by 2002:a05:6512:b9c:b0:539:e3d8:fa33 with SMTP id 2adb3069b0e04-53d9a43cc8cmr3685497e87.54.1731497963629;
        Wed, 13 Nov 2024 03:39:23 -0800 (PST)
Message-ID: <aec35a326656a2b976b584ea5467f54cd87ca6d6.camel@gmail.com>
Subject: Re: [PATCH v5 1/3] xen/riscv: introduce setup_mm()
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman	
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper	 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini	 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 13 Nov 2024 12:39:22 +0100
In-Reply-To: <acd75f3d-da7d-4487-afde-877405c24c2a@suse.com>
References: <cover.1731344883.git.oleksii.kurochko@gmail.com>
	 <c3640fe453cb8a0eff4d50d21d57535f67f7b92a.1731344883.git.oleksii.kurochko@gmail.com>
	 <acd75f3d-da7d-4487-afde-877405c24c2a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

On Tue, 2024-11-12 at 12:22 +0100, Jan Beulich wrote:
> On 11.11.2024 19:16, Oleksii Kurochko wrote:
> > @@ -25,8 +27,11 @@
> > =C2=A0
> > =C2=A0static inline void *maddr_to_virt(paddr_t ma)
> > =C2=A0{
> > -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > -=C2=A0=C2=A0=C2=A0 return NULL;
> > +=C2=A0=C2=A0=C2=A0 unsigned long va_offset =3D maddr_to_directmapoff(m=
a);
> > +
> > +=C2=A0=C2=A0=C2=A0 ASSERT(va_offset < DIRECTMAP_SIZE);
>=20
> Much like with the consideration towards virt_to_maddr() that was
> corrected from v4, I think this one also needs adjusting:
>=20
> =C2=A0=C2=A0=C2=A0 ASSERT(va_offset < DIRECTMAP_SIZE + (DIRECTMAP_VIRT_ST=
ART -
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 directmap_virt_start));
>=20
> This is because ...
>=20
> > +=C2=A0=C2=A0=C2=A0 return (void *)(directmap_virt_start + va_offset);
>=20
> ... you're offsetting the VA here. It may then want accompanying
> by
>=20
> =C2=A0=C2=A0=C2=A0 ASSERT(va_offset >=3D DIRECTMAP_VIRT_START - directmap=
_virt_start);
>=20
> (probably to go first).
I might be misunderstanding something, but shouldn't the assertions be
as follows?
   DIRECTMAP_VIRT_START <=3D (directmap_virt_start + va_offset) <
   DIRECTMAP_VIRT_SIZE

So, va_offset should be in the range:
   DIRECTMAP_VIRT_START - direcmap_virt_start <=3D va_offset <
   DIRECTMAP_VIRT_SIZE - directmap_virt_start
  =20
This would make the assertions look like:
   ASSERT(va_offset < DIRECTMAP_VIRT_SIZE - directmap_virt_tart)
   ASSERT(va_offset >=3D DIRECTMAP_VIRT_START - directmap_virt_start)

So, we have different check for the first ASSERT. Could you please
clarify where my calculations are wrong?

>=20
> > @@ -423,3 +429,147 @@ void * __init early_fdt_map(paddr_t
> > fdt_paddr)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 return fdt_virt;
> > =C2=A0}
> > +
> > +vaddr_t __ro_after_init directmap_virt_start =3D
> > DIRECTMAP_VIRT_START;
> > +
> > +struct page_info *__ro_after_init frametable_virt_start =3D
> > frame_table;
> > +
> > +#ifndef CONFIG_RISCV_32
> > +
> > +/* Map a frame table to cover physical addresses ps through pe */
> > +static void __init setup_frametable_mappings(paddr_t ps, paddr_t
> > pe)
> > +{
> > +=C2=A0=C2=A0=C2=A0 static mfn_t __initdata frametable_mfn_start =3D
> > INVALID_MFN_INITIALIZER;
> > +
> > +=C2=A0=C2=A0=C2=A0 paddr_t aligned_ps =3D ROUNDUP(ps, PAGE_SIZE);
> > +=C2=A0=C2=A0=C2=A0 paddr_t aligned_pe =3D ROUNDDOWN(pe, PAGE_SIZE);
> > +=C2=A0=C2=A0=C2=A0 unsigned long nr_mfns =3D PFN_DOWN(aligned_pe - ali=
gned_ps);
> > +=C2=A0=C2=A0=C2=A0 unsigned long frametable_size =3D nr_mfns *
> > sizeof(*frame_table);
> > +=C2=A0=C2=A0=C2=A0 mfn_t base_mfn;
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( mfn_eq(frametable_mfn_start, INVALID_MFN) )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 frametable_mfn_start =3D ma=
ddr_to_mfn(aligned_ps);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 frametable_virt_start -=3D =
paddr_to_pfn(aligned_ps);
> > +=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 else
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("%s shouldn't be call=
ed twice\n", __func__);
>=20
> As said on the v4 thread - I don't think this is needed. Aiui Misra
> would
> actually dislike it, as it's unreachable code. Just to re-iterate: My
> complaint there wasn't about this missing check, but about the
> function
> partly giving the impression of expecting to be called more than
> once.
I=E2=80=99ll revert this check, then. Would it be better=E2=80=94and suffic=
ient=E2=80=94to add
a comment before setup_frametable_mappings() indicating that this
function should only be called once, to avoid any impression that it
might be expected to be called multiple times?

>=20
> > +=C2=A0=C2=A0=C2=A0 if ( frametable_size > FRAMETABLE_SIZE )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("The frametable canno=
t cover [%#"PRIpaddr",
> > %#"PRIpaddr")\n",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ps, pe);
> > +
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * align base_mfn and frametable_size to MB(2)=
 to have
> > superpage mapping
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * in map_pages_to_xen()
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 frametable_size =3D ROUNDUP(frametable_size, MB(2))=
;
> > +=C2=A0=C2=A0=C2=A0 base_mfn =3D alloc_boot_pages(frametable_size >> PA=
GE_SHIFT,
> > PFN_DOWN(MB(2)));
>=20
> As you already use PFN_DOWN() once, why do you open-code it for the
> other
> argument?
Just overlooked that PFN_DOWN() could be used here.

>  You also use it ...
>=20
> > +=C2=A0=C2=A0=C2=A0 if ( map_pages_to_xen(FRAMETABLE_VIRT_START, base_m=
fn,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 PFN_DOWN(frametable_size),
>=20
> ... here, where the purpose of the argument is exactly the same.
>=20
> > +void __init setup_mm(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 const struct membanks *banks =3D bootinfo_get_mem()=
;
> > +=C2=A0=C2=A0=C2=A0 paddr_t ram_start =3D INVALID_PADDR;
> > +=C2=A0=C2=A0=C2=A0 paddr_t ram_end =3D 0;
> > +=C2=A0=C2=A0=C2=A0 unsigned int i;
> > +
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * We need some memory to allocate the page-ta=
bles used for
> > the directmap
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * mappings. But some regions may contain memo=
ry already
> > allocated
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * for other uses (e.g. modules, reserved-memo=
ry...).
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * For simplicity, add all the free regions in=
 the boot
> > allocator.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 populate_boot_allocator();
> > +
> > +=C2=A0=C2=A0=C2=A0 for ( i =3D 0; i < banks->nr_banks; i++ )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct membank *bank =
=3D &banks->bank[i];
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paddr_t bank_start =3D ROUN=
DUP(bank->start, PAGE_SIZE);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paddr_t bank_end =3D ROUNDD=
OWN(bank->start + bank->size,
> > PAGE_SIZE);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long bank_size =3D=
 bank_end - bank_start;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ram_start =3D min(ram_start=
, bank_start);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ram_end =3D max(ram_end, ba=
nk_end);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 setup_directmap_mappings(PF=
N_DOWN(bank_start),
> > PFN_DOWN(bank_size));
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 setup_frametable_mappings(ram_start, ram_end);
>=20
> Just to double check: There is a guarantee that ->nr_banks isn't
> going to
> be zero? Else the setup_frametable_mappings() invocation here would
> badly
> degenerate.
Based on the what is mentioned in the device tree spec I would say yes
but based on the code we have in Xen ( and if I am not confusing
something ) it is still a chance that ->nr_banks could be zero.

From the device tree spec:
```
A memory device node is required for all devicetrees and describes the
physical memory layout for the system. If a system
has multiple ranges of memory, multiple memory nodes can be created, or
the ranges can be specified in the reg property
of a single memory node.

Property Name  Usage   Value Type           Definition
device_type     R      <string>             Value shall be =E2=80=9Cmemory=
=E2=80=9D
reg             R      <prop-encoded-array> ...

Usage legend: R=3DRequired, O=3DOptional, OR=3DOptional but Recommended,
SD=3DSee Definition
```

So the memory node should present in devicetree ( interesting that few
years ago I remember that I could build devicetree w/o memory node,
anyway, Xen cheking a reg property of memory node and panic if
something wrong ).

In the same time, based on the code of device_tree_get_meminfo() (
xen/common/device-tree/bootfdt.c:169 ):
       prop =3D fdt_get_property(fdt, node, prop_name, NULL);
       if ( !prop )
           return -ENOENT;
  =20
       cell =3D (const __be32 *)prop->data;
       banks =3D fdt32_to_cpu(prop->len) / (reg_cells * sizeof (u32));
  =20
       for ( i =3D 0; i < banks && mem->nr_banks < mem->max_banks; i++ )
       {
           device_tree_get_reg(&cell, address_cells, size_cells,
   &start, &size);
           if ( mem =3D=3D bootinfo_get_reserved_mem() &&
                check_reserved_regions_overlap(start, size) )
               return -EINVAL;
           /* Some DT may describe empty bank, ignore them */
           if ( !size )
               continue;
           mem->bank[mem->nr_banks].start =3D start;
           mem->bank[mem->nr_banks].size =3D size;
           mem->bank[mem->nr_banks].type =3D type;
           mem->nr_banks++;
       }
  =20
It is possible that mem->nr_banks is equal to 0 ( when DT describe only
empty banks? ) but then it sounds to me like something wrong with DT.

Just to be sure that everything is okay with ->nr_banks I could suggest
to add BUG_ON(banks->nr_banks) in setup_mm() before the `for` cycle.
Does it make sense?

Thanks.

~ Oleksii

