Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4915F14BC
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 23:25:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414437.658715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeNVA-0001OH-Hv; Fri, 30 Sep 2022 21:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414437.658715; Fri, 30 Sep 2022 21:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeNVA-0001Ko-Et; Fri, 30 Sep 2022 21:24:56 +0000
Received: by outflank-mailman (input) for mailman id 414437;
 Fri, 30 Sep 2022 21:24:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VUOy=2B=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1oeNV8-0001Ki-8E
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 21:24:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51f60d58-4106-11ed-964a-05401a9f4f97;
 Fri, 30 Sep 2022 23:24:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6EFBD62508
 for <xen-devel@lists.xenproject.org>; Fri, 30 Sep 2022 21:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3A3C43143
 for <xen-devel@lists.xenproject.org>; Fri, 30 Sep 2022 21:24:50 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id o7so1454438lfk.7
 for <xen-devel@lists.xenproject.org>; Fri, 30 Sep 2022 14:24:50 -0700 (PDT)
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
X-Inumbo-ID: 51f60d58-4106-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664573090;
	bh=30nChzLQuXr92StWJJlgPGxevZR3popgF5oyJwpVxYk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n2OJlhNEJosXyp17WUQOqLLVp4MocrMWY81zEE4SYAT1+tqJ7GtsTJ57gzSMucPrd
	 TmrQUgv5XHAWTSfRsx7KOCSQnEf9l4uWzkofvmfkUp6T+0ni4kv/lHrf3FFp2HiHt7
	 qWTOhJ5s+WDdkVBRlBN90Y+84iQntqF0J9q1M486bdYhurXHtES8qLQeL4X35GAKrh
	 p2PauqyERpzLydcCxYKbsbG1lFOKZqRhJilQT4aYIlSQafWUZGve8pjMUME5s7nNi9
	 vAL2ecckDsn0DQXhnBVZf3cv8zmiocsK2BaaRSzzeYSMEvN0fgcR8fCipf9JRHqpzv
	 yJdEuQJU0E5Rw==
X-Gm-Message-State: ACrzQf0T9Zhfdss5pXaU2BczIEz+KytkBqhnCA/EirwY7O8yU0cE6xcW
	bdh/4ZpQ+f5Ph7/qjgQGNulLURgmqjpP9IlpkTc=
X-Google-Smtp-Source: AMsMyM7PA/FdfwX29hZGmfUQ+efLBEEjqC3yYjmOMXwajxKUALIR8Lh25MoQk0mQ5O4TFL/l6csXOIwF0WTfV82/2Pg=
X-Received: by 2002:a05:6512:3691:b0:4a1:f82a:9067 with SMTP id
 d17-20020a056512369100b004a1f82a9067mr4317344lfs.110.1664573088377; Fri, 30
 Sep 2022 14:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664298147.git.demi@invisiblethingslab.com>
 <5649176eacda434267f68676f1733d06c572d19e.1664298147.git.demi@invisiblethingslab.com>
 <CAMj1kXEs-o8jvNqRiW+Ue2i52RBgg4iktg8UONCACk8-Gx4XXA@mail.gmail.com>
 <YzczpIYop5olD4hj@itl-email> <CAMj1kXHGPzy9T1LcE8LX+woGtUGTzrDgbjDBJabJ+bwDVPbTag@mail.gmail.com>
 <YzdPv4+fYX3SG9P0@itl-email> <CAMj1kXGTZZmW=QZOL1FvrsBLsvFzN1GkvZCotuZ-C-gBVGY6CQ@mail.gmail.com>
In-Reply-To: <CAMj1kXGTZZmW=QZOL1FvrsBLsvFzN1GkvZCotuZ-C-gBVGY6CQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 30 Sep 2022 23:24:37 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFJa4sSDEkRwTXTntJcJrtshNofU6LaZOWtzMbp56cXXQ@mail.gmail.com>
Message-ID: <CAMj1kXFJa4sSDEkRwTXTntJcJrtshNofU6LaZOWtzMbp56cXXQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] Support ESRT in Xen dom0
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Peter Jones <pjones@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Kees Cook <keescook@chromium.org>, 
	Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 30 Sept 2022 at 22:59, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Fri, 30 Sept 2022 at 22:21, Demi Marie Obenour
> <demi@invisiblethingslab.com> wrote:
> >
> > On Fri, Sep 30, 2022 at 09:11:19PM +0200, Ard Biesheuvel wrote:
> > > On Fri, 30 Sept 2022 at 20:21, Demi Marie Obenour
> > > <demi@invisiblethingslab.com> wrote:
> > > >
> > > > On Fri, Sep 30, 2022 at 06:36:11PM +0200, Ard Biesheuvel wrote:
> > > > > On Fri, 30 Sept 2022 at 01:02, Demi Marie Obenour
> > > > > <demi@invisiblethingslab.com> wrote:
> > > > > >
> > > > > > fwupd requires access to the EFI System Resource Table (ESRT) t=
o
> > > > > > discover which firmware can be updated by the OS.  Currently, L=
inux does
> > > > > > not expose the ESRT when running as a Xen dom0.  Therefore, it =
is not
> > > > > > possible to use fwupd in a Xen dom0, which is a serious problem=
 for e.g.
> > > > > > Qubes OS.
> > > > > >
> > > > > > Before Xen 4.17, this was not fixable due to hypervisor limitat=
ions.
> > > > > > The UEFI specification requires the ESRT to be in EfiBootServic=
esData
> > > > > > memory, which Xen will use for whatever purposes it likes.  The=
refore,
> > > > > > Linux cannot safely access the ESRT, as Xen may have overwritte=
n it.
> > > > > >
> > > > > > Starting with Xen 4.17, Xen checks if the ESRT is in EfiBootSer=
vicesData
> > > > > > or EfiRuntimeServicesData memory.  If the ESRT is in EfiBootSer=
vicesData
> > > > > > memory, Xen replaces the ESRT with a copy in memory that it has
> > > > > > reserved.  Such memory is currently of type EFI_RUNTIME_SERVICE=
S_DATA,
> > > > > > but in the future it will be of type EFI_ACPI_RECLAIM_MEMORY.  =
This
> > > > > > ensures that the ESRT can safely be accessed by the OS.
> > > > > >
> > > > > > When running as a Xen dom0, use the new
> > > > > > xen_config_table_memory_region_max() function to determine if X=
en has
> > > > > > reserved the ESRT and, if so, find the end of the memory region
> > > > > > containing it.  This allows programs such as fwupd which requir=
e the
> > > > > > ESRT to run under Xen, and so makes fwupd support in Qubes OS p=
ossible.
> > > > > >
> > > > > > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > > > >
> > > > > Why do we need this patch? I'd expect esrt_table_exists() to retu=
rn
> > > > > false when patch 1/2 is applied.
> > > >
> > > > efi_enabled(EFI_MEMMAP) is false under Xen, so there needs to be an
> > > > alternative way to get the end of the memory region containing the =
ESRT.
> > > > That is what this patch provides.
> > >
> > > OK. I don't think we need that to be honest. When running under Xen,
> > > we should be able to assume that the ESRT does not span multiple
> > > memory regions arbitrarily, so we can just omit this check if
> > > !efi_enabled(EFI_MEMMAP)
> > >
> > > IIRC (and Peter would know), we are trying to filter out descriptors
> > > that are completely bogus here: zero lenght, zero address, etc etc. I
> > > don't think we need that for Xen.
> >
> > Xen doesn=E2=80=99t uninstall bogus ESRTs, so there is no less reason t=
o worry
> > under Xen than on bare hardware.
>
> That may be true. But if Xen needs dom0 to be able to cross reference
> the EFI memory map, it should provide one (and set EFI_MEMMAP to
> enabled).

Btw the efi_mem_reserve() for the ESRT is also redundant if it is
guaranteed to be in RT services data or ACPI reclaim memory.

