Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0929C9027
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 17:50:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836649.1252565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBd2j-0004wc-KW; Thu, 14 Nov 2024 16:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836649.1252565; Thu, 14 Nov 2024 16:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBd2j-0004tk-Hi; Thu, 14 Nov 2024 16:50:05 +0000
Received: by outflank-mailman (input) for mailman id 836649;
 Thu, 14 Nov 2024 16:50:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mvJx=SJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tBd2i-0004eW-7k
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 16:50:04 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cc54737-a2a8-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 17:50:00 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2fc968b3545so9088961fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 08:50:00 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff59763e25sm2363581fa.10.2024.11.14.08.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 08:49:59 -0800 (PST)
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
X-Inumbo-ID: 7cc54737-a2a8-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmIiLCJoZWxvIjoibWFpbC1sajEteDIyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjdjYzU0NzM3LWEyYTgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjAzMDAwLjQ0NjU4MSwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731603000; x=1732207800; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B9PT6GMOP+YA22RZDUnLBnDoM0NEFM1Ib1xInVaQ9nA=;
        b=XyA8sUltSE/64uzlhFtB/1gmUzRYixm8nnAuWchJD97lfCC3Pbb21oMc3M7Dbq31Ea
         FijYfSUHTbUgXemfjzdCdyTbi9fZ65bztR58bRzBcJtnHGy3EYRg6n3zyeKl/yb4Xv9x
         1KT1G/fiqPiOnzTSc2ahOBislSBvpXudPEY81pMWmEFYgI7jd5OGXHkziI3Ff2LQ1PPZ
         8HdOrmFaIeShdJgblPAjOdpNviCO6KHlubG+zaU0itt6uCv97KYRePRWrKBAR6LCXpWH
         ApV6/OmFHu9lexrqjuhCbMlaW/+rrCcHBW57kGkRI5Mx6/tZKoHHrT5SJGOnp5zDE7Ni
         FNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731603000; x=1732207800;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B9PT6GMOP+YA22RZDUnLBnDoM0NEFM1Ib1xInVaQ9nA=;
        b=GlosUHdqHEy5yORywPq1yYNKuiUmOcVazIAVXhzs7chb7BJ1oLzalJVZibz/VwvEa7
         UB8+G4Oxb02+G33tUqI5J/gcG9YGrrtfAlH4Kj53cZENj2cv0TCSbFOSB/gsVuiGp5qn
         UcY1Gkh/O9+DkZHxmmclLpLdf4orgTvQyETibacBUu5FEwp21rhHvHfYgEQQegHrbCFE
         p+sZEMn6g0mOsPEx68Yx0ka2DNhb3A0G85PtqnHLJ78WPV+8+IgqeE8uORTxZ1A87uR/
         awFb4jOCDScvojU82N6bzULEaxilpRUbJXNLLltFRuCnBLu5u5YSIfGieLX2Bq/R1ZBA
         5zew==
X-Forwarded-Encrypted: i=1; AJvYcCWOkQIVv7RMv83qZqHGSmG2f/GcM4apl5fDXkmQiQW7KXC1njtbzAhDJjnbHkNFog0zIP4HTVrwJbI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyApxS7gqlU/OhOmunyWb2O3oBGPkLe2FAE4ingC75WeA5+bN+s
	jmc8B0/KmNGXaRGfKlSnjDZDvY2Co94RnSiAbRAOJ6F4OB5rlY7Q
X-Google-Smtp-Source: AGHT+IHQ4Gt7fZ5iEUsX6gv/GeEyecZgt7FMPTO4m5r36eR2Tt6C4JhZPVYGKKwQfG/GVqLaNxIBfA==
X-Received: by 2002:a2e:b8c1:0:b0:2fb:60d8:7445 with SMTP id 38308e7fff4ca-2ff4c597749mr46235591fa.6.1731602999656;
        Thu, 14 Nov 2024 08:49:59 -0800 (PST)
Message-ID: <7555444c768edccee597dbb837edfe54a539722c.camel@gmail.com>
Subject: Re: [PATCH v5 1/3] xen/riscv: introduce setup_mm()
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman	
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper	 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini	 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 14 Nov 2024 17:49:58 +0100
In-Reply-To: <b71986cbc487b68a8d6b31162bcefb8b3b7c2648.camel@gmail.com>
References: <cover.1731344883.git.oleksii.kurochko@gmail.com>
		 <c3640fe453cb8a0eff4d50d21d57535f67f7b92a.1731344883.git.oleksii.kurochko@gmail.com>
		 <acd75f3d-da7d-4487-afde-877405c24c2a@suse.com>
		 <aec35a326656a2b976b584ea5467f54cd87ca6d6.camel@gmail.com>
		 <7aaa8eea-247f-43f5-9777-2a3431e0c1a0@suse.com>
	 <b71986cbc487b68a8d6b31162bcefb8b3b7c2648.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

On Thu, 2024-11-14 at 17:30 +0100, oleksii.kurochko@gmail.com wrote:
> On Thu, 2024-11-14 at 10:49 +0100, Jan Beulich wrote:
> > > > > @@ -423,3 +429,147 @@ void * __init early_fdt_map(paddr_t
> > > > > fdt_paddr)
> > > > > =C2=A0
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 return fdt_virt;
> > > > > =C2=A0}
> > > > > +
> > > > > +vaddr_t __ro_after_init directmap_virt_start =3D
> > > > > DIRECTMAP_VIRT_START;
> > > > > +
> > > > > +struct page_info *__ro_after_init frametable_virt_start =3D
> > > > > frame_table;
> > > > > +
> > > > > +#ifndef CONFIG_RISCV_32
> > > > > +
> > > > > +/* Map a frame table to cover physical addresses ps through
> > > > > pe
> > > > > */
> > > > > +static void __init setup_frametable_mappings(paddr_t ps,
> > > > > paddr_t
> > > > > pe)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0 static mfn_t __initdata frametable_mfn_start =
=3D
> > > > > INVALID_MFN_INITIALIZER;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 paddr_t aligned_ps =3D ROUNDUP(ps, PAGE_SIZE)=
;
> > > > > +=C2=A0=C2=A0=C2=A0 paddr_t aligned_pe =3D ROUNDDOWN(pe, PAGE_SIZ=
E);
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long nr_mfns =3D PFN_DOWN(aligned_pe=
 -
> > > > > aligned_ps);
> > > > > +=C2=A0=C2=A0=C2=A0 unsigned long frametable_size =3D nr_mfns *
> > > > > sizeof(*frame_table);
> > > > > +=C2=A0=C2=A0=C2=A0 mfn_t base_mfn;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0 if ( mfn_eq(frametable_mfn_start, INVALID_MFN=
) )
> > > > > +=C2=A0=C2=A0=C2=A0 {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 frametable_mfn_start =
=3D maddr_to_mfn(aligned_ps);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 frametable_virt_start=
 -=3D paddr_to_pfn(aligned_ps);
> > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > +=C2=A0=C2=A0=C2=A0 else
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("%s shouldn't b=
e called twice\n", __func__);
> > > >=20
> > > > As said on the v4 thread - I don't think this is needed. Aiui
> > > > Misra
> > > > would
> > > > actually dislike it, as it's unreachable code. Just to re-
> > > > iterate: My
> > > > complaint there wasn't about this missing check, but about the
> > > > function
> > > > partly giving the impression of expecting to be called more
> > > > than
> > > > once.
> > > I=E2=80=99ll revert this check, then. Would it be better=E2=80=94and
> > > sufficient=E2=80=94to
> > > add
> > > a comment before setup_frametable_mappings() indicating that this
> > > function should only be called once, to avoid any impression that
> > > it
> > > might be expected to be called multiple times?
> >=20
> > You can add such a comment if you like, we we have many functions
> > of
> > this
> > kind. The important aspect - as said before - is that the function
> > should
> > not - nowhere - give the impression of possibly expecting to be
> > called
> > more than once.
> Then I am not 100% sure how to deal with this impression specifically
> in the case of setup_frametable_mapping() which should be called
> once.
>=20
> The only options I have in my head are:
> =C2=A0=C2=A0 Option 1:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static void __init setup_frametable_=
mappings(paddr_t ps,
> paddr_t
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pe)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 static bool __read_mos=
tly once;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paddr_t alig=
ned_ps =3D ROUNDUP(ps, PAGE_SIZE);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paddr_t alig=
ned_pe =3D ROUNDDOWN(pe, PAGE_SIZE);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned lon=
g nr_mfns =3D PFN_DOWN(aligned_pe - aligned_ps);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned lon=
g frametable_size =3D nr_mfns *
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*frame_table);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfn_t base_m=
fn;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 ASSERT(!once);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 once =3D true;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 frametable_v=
irt_start -=3D paddr_to_pfn(aligned_ps);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( frameta=
ble_size > FRAMETABLE_SIZE )
>=20
>=20
> =C2=A0=C2=A0 Option 2:
> =C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -struct page_info *__ro_after_init frameta=
ble_virt_start =3D
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 frame_table;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +struct page_info *__ro_after_init frameta=
ble_virt_start;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #ifndef CONFIG_RISCV_32
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @@ -442,7 +442,9 @@ static void __init
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 setup_frametable_mappings(paddr_t ps, padd=
r_t pe)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned lon=
g frametable_size =3D nr_mfns *
> =C2=A0=C2=A0 sizeof(*frame_table);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfn_t base_m=
fn;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 frametable_virt_start =
-=3D paddr_to_pfn(aligned_ps);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 ASSERT(!frametable_vir=
t_start);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 frametable_virt_start =
=3D frame_table -
> =C2=A0=C2=A0 paddr_to_pfn(aligned_ps);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( frameta=
ble_size > FRAMETABLE_SIZE )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 panic("The frametable cannot cover [%#"PRIpaddr",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %#"PRIpaddr")\n",
> =C2=A0=C2=A0=20
Or your intention was that I can drop any check at all in
setup_frametable_mappings():
   static void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
   {
       paddr_t aligned_ps =3D ROUNDUP(ps, PAGE_SIZE);
       paddr_t aligned_pe =3D ROUNDDOWN(pe, PAGE_SIZE);
       unsigned long nr_mfns =3D PFN_DOWN(aligned_pe - aligned_ps);
       unsigned long frametable_size =3D nr_mfns * sizeof(*frame_table);
       mfn_t base_mfn;
  =20
       frametable_virt_start -=3D paddr_to_pfn(aligned_ps);
  =20
   ...
   }
  =20
and it should be enough as this function by its nature shouldn't be called
twice.

~ Oleksii

