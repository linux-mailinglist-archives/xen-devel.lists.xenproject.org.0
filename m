Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A105E6671
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 17:06:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410236.653294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obNmB-0003SN-Ce; Thu, 22 Sep 2022 15:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410236.653294; Thu, 22 Sep 2022 15:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obNmB-0003Ov-9r; Thu, 22 Sep 2022 15:06:07 +0000
Received: by outflank-mailman (input) for mailman id 410236;
 Thu, 22 Sep 2022 15:06:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PQAH=ZZ=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1obNmA-0003Op-7Y
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 15:06:06 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 132067ef-3a88-11ed-9647-05401a9f4f97;
 Thu, 22 Sep 2022 17:06:04 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id F186ECE2253
 for <xen-devel@lists.xenproject.org>; Thu, 22 Sep 2022 15:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D7FC433D7
 for <xen-devel@lists.xenproject.org>; Thu, 22 Sep 2022 15:05:56 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id c7so11321141ljm.12
 for <xen-devel@lists.xenproject.org>; Thu, 22 Sep 2022 08:05:56 -0700 (PDT)
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
X-Inumbo-ID: 132067ef-3a88-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663859156;
	bh=1uM16sAEsFRpmXqJh3o8KDbSU5Vn6VywW/jmOdA6aNc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R5Xni3kApssHFwBpX23u9FqbIoOrfFW9Eh+DXpawBWt83eJ2txweva4gjv1WcnATf
	 7IEz087ER/3ndPQ9bonJoS2RZV28gl54xgcODjILPpOuh7MG6GjSGBjsd3hdzL+bZI
	 /TQTj13hizyHTFlb5cTaOPaJmzPGme2l93biRkvnNEpZRc98RBilPbaEIN/wsE1icU
	 X0wh/90FYlcTObNdAHcpm+fouiLSO/Ef1uhXv5X/ox6u4OyXBR2ZOvsv1mvenvHdeF
	 i9NO19Wutl6RrOaY1MvHKbo84tVMreipSnQOyYUxfRqAMrqmzFar/xsPAyqbFwiHcc
	 0LZ7VF4CZzVSA==
X-Gm-Message-State: ACrzQf2IoMUeeEWYZdjrfh5za2hQ1uflz6N5rscwx8/J977/AdtANFyo
	dW5oCEJHxoA8bz6zA+ychLvUwyS39qnSdy7Wn/M=
X-Google-Smtp-Source: AMsMyM4SN/XP/Ju64WkB2EIWy6dKCCftvHdMN498Tlfzs6TU3Iv+ia7oWel8dcPZRPgNVsqFNV7TsgyKzSOdBFgMzXk=
X-Received: by 2002:a2e:9115:0:b0:26a:c086:5138 with SMTP id
 m21-20020a2e9115000000b0026ac0865138mr1173829ljg.189.1663859154235; Thu, 22
 Sep 2022 08:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220919193257.2031-1-demi@invisiblethingslab.com>
 <CAMj1kXEBfJUfTQ3THqqKxsU09_S98B_TjTECKwGM0WAv_5tZaA@mail.gmail.com>
 <7930b617-d473-94dd-c7e4-33ffa19da13e@suse.com> <CAMj1kXEJ9d3-8xa7rkczY7ur2zDm9CjqM7u1eEdHHmPG=Oo=xA@mail.gmail.com>
 <3671fd52-6034-7149-ebe4-f7560c0dc6b0@suse.com> <Yyu1xC7Tlf9sS7Ro@itl-email>
 <6f42a382-c5aa-ba16-f330-69a07476e2aa@suse.com> <Yyx3hlE/MDBeEdtu@itl-email>
In-Reply-To: <Yyx3hlE/MDBeEdtu@itl-email>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 22 Sep 2022 17:05:43 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFoyTRKfGH2nMpi-EJRqLz9T_p+ZMM0x09UNJ-34-kS_Q@mail.gmail.com>
Message-ID: <CAMj1kXFoyTRKfGH2nMpi-EJRqLz9T_p+ZMM0x09UNJ-34-kS_Q@mail.gmail.com>
Subject: Re: [PATCH v3] Support ESRT in Xen dom0
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Sept 2022 at 16:56, Demi Marie Obenour
<demi@invisiblethingslab.com> wrote:
>
> On Thu, Sep 22, 2022 at 08:12:14AM +0200, Jan Beulich wrote:
> > On 22.09.2022 03:09, Demi Marie Obenour wrote:
> > > On Wed, Sep 21, 2022 at 10:34:04PM +0200, Jan Beulich wrote:
> > >> On 20.09.2022 18:09, Ard Biesheuvel wrote:
> > >>> On Tue, 20 Sept 2022 at 17:54, Jan Beulich <jbeulich@suse.com> wrot=
e:
> > >>>>
> > >>>> On 20.09.2022 17:36, Ard Biesheuvel wrote:
> > >>>>> On Mon, 19 Sept 2022 at 21:33, Demi Marie Obenour
> > >>>>> <demi@invisiblethingslab.com> wrote:
> > >>>>>>
> > >>>>>> fwupd requires access to the EFI System Resource Table (ESRT) to
> > >>>>>> discover which firmware can be updated by the OS.  Currently, Li=
nux does
> > >>>>>> not expose the ESRT when running as a Xen dom0.  Therefore, it i=
s not
> > >>>>>> possible to use fwupd in a Xen dom0, which is a serious problem =
for e.g.
> > >>>>>> Qubes OS.
> > >>>>>>
> > >>>>>> Before Xen 4.16, this was not fixable due to hypervisor limitati=
ons.
> > >>>>>> The UEFI specification requires the ESRT to be in EfiBootService=
sData
> > >>>>>> memory, which Xen will use for whatever purposes it likes.  Ther=
efore,
> > >>>>>> Linux cannot safely access the ESRT, as Xen may have overwritten=
 it.
> > >>>>>>
> > >>>>>> Starting with Xen 4.17, Xen checks if the ESRT is in EfiBootServ=
icesData
> > >>>>>> or EfiRuntimeServicesData memory.  If the ESRT is in EfiBootServ=
icesData
> > >>>>>> memory, Xen allocates some memory of type EfiRuntimeServicesData=
, copies
> > >>>>>> the ESRT to it, and finally replaces the ESRT pointer with a poi=
nter to
> > >>>>>> the copy.  Since Xen will not clobber EfiRuntimeServicesData mem=
ory,
> > >>>>>> this ensures that the ESRT can safely be accessed by the OS.  It=
 is safe
> > >>>>>> to access the ESRT under Xen if, and only if, it is in memory of=
 type
> > >>>>>> EfiRuntimeServicesData.
> > >>>>>>
> > >>>>>
> > >>>>> Thanks for the elaborate explanation. This is really helpful.
> > >>>>>
> > >>>>> So here, you are explaining that the only way for Xen to prevent
> > >>>>> itself from potentially clobbering the ESRT is by creating a
> > >>>>> completely new allocation?
> > >>>>
> > >>>> There are surely other ways, e.g. preserving BootServices* regions
> > >>>> alongside RuntimeServices* ones. But as the maintainer of the EFI
> > >>>> code in Xen I don't view this as a reasonable approach.
> > >>>
> > >>> Why not?
> > >>
> > >> Because it's against the intentions the EFI has (or at least had)
> > >> for this memory type. Much more than EfiAcpiReclaimMemory this
> > >> type is intended for use as ordinary RAM post-boot.
> > >
> > > What about giving that memory to dom0?  dom0=E2=80=99s balloon driver=
 will give
> > > anything dom0 doesn=E2=80=99t wind up using back to Xen.
> >
> > While perhaps in principle possible, this would require special casing
> > in Xen. Except for the memory the initrd comes in, we don't directly
> > hand memory to Dom0. Instead everything goes through the page allocator
> > first. Plus if we really were convinced boot services memory needed
> > retaining, then it would also need retaining across kexec (and hence
> > shouldn't be left to Dom0 to decide what to do with it).
>
> So how should dom0 handle the various EFI tables other than the ESRT?
> Right now most uses of these tables in Linux are not guarded by any
> checks for efi_enabled(EFI_MEMMAP) or similar.  If some of them are in
> EfiBootServicesData memory, they might be corrupted before Linux gets
> them.

Yes, this is an annoying oversight of the EFI design: the config
tables are <guid, address> tuples, and the size of the table is
specific to each table type. So without knowing the GUID, there is no
way you can reserve the right size.

Perhaps you could implement something like a hypercall in
efi_arch_mem_reserve(), which is called by the EFI code to reserve
regions that are in boot services memory but need to remain reserved?
This is used for all config tables that it knows or cares about.

