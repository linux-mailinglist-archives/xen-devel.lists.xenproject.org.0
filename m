Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC8B5F5BB7
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 23:30:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416469.661105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogBwg-0003GX-DN; Wed, 05 Oct 2022 21:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416469.661105; Wed, 05 Oct 2022 21:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogBwg-0003ES-Ab; Wed, 05 Oct 2022 21:28:50 +0000
Received: by outflank-mailman (input) for mailman id 416469;
 Wed, 05 Oct 2022 21:28:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Evou=2G=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1ogBwe-0003EC-9W
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 21:28:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b060cf52-44f4-11ed-964a-05401a9f4f97;
 Wed, 05 Oct 2022 23:28:45 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 73103617B9
 for <xen-devel@lists.xenproject.org>; Wed,  5 Oct 2022 21:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D396FC433D7
 for <xen-devel@lists.xenproject.org>; Wed,  5 Oct 2022 21:28:42 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id g1so27320057lfu.12
 for <xen-devel@lists.xenproject.org>; Wed, 05 Oct 2022 14:28:42 -0700 (PDT)
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
X-Inumbo-ID: b060cf52-44f4-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665005322;
	bh=muJbnrIp210gb7fqTfOmWC0eIYWfolnwyOXDDn4od4c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=onC1wgsK10b0LnSICn+HrmdzrnxCEMSH9xhj/y3+IbllcnAGBvno4qaFXFBCRry25
	 UrJJrWXg9K3QdgB9eXnisqnIIJQPtQepqs0juwRz19jvZjikXxigCozNXd39rEorJv
	 6XPkUiV4UGf3vBFiZ9sSFqJcQcNjRkgu2ktS+j1pNchdV1N0MwSKPn/D0s/pNUDtCJ
	 3CrkAmu0zDJExS0jBdZ1F9DpPBvywQVE+N2UF13AeNeCiEg80vFg6Cpal7s4LZwXBB
	 iVIUuWZZUN7B5vAo25F+7A5lflU+r/3lgNX95TT2mMIdZB5mzGE1EBEbk/1mfRvItG
	 g1/kQ7TrTRyOw==
X-Gm-Message-State: ACrzQf3gmBR06C2i3Z3g83cYDkzcafyWvO4ABEnU5ylLxBxd3FRyYlgk
	78zOAW7uKu5izxRzcwp0bnEO9QllaD8jMTaitf8=
X-Google-Smtp-Source: AMsMyM5ENCqkTVBxrzmq8hfVrlBZGy4ldUcnDApXzpb2VxRM/05S1UkqQQqEZ2D+hH1YOqSqFKb8NTMRIjJTusgjT10=
X-Received: by 2002:a05:6512:261b:b0:4a1:abd7:3129 with SMTP id
 bt27-20020a056512261b00b004a1abd73129mr637352lfb.637.1665005320796; Wed, 05
 Oct 2022 14:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664298147.git.demi@invisiblethingslab.com>
 <f3b624e99adfdbbfc1976a60a73a6b5950e1840d.1664298147.git.demi@invisiblethingslab.com>
 <282a225d-8782-0321-6f0e-19dd4510dc42@suse.com> <CAMj1kXFQNqsW5RfHGac-eGbosJHBybu6+-Fap_bi_kVxWNpGeg@mail.gmail.com>
 <YzcjeiOW8+i2Zxsd@itl-email> <CAMj1kXHBBbCNV3CLesqZi7ttmmi8y4tZ1KO5vievy_CJrU2o3Q@mail.gmail.com>
 <YzeaKjmls1YI/3ox@itl-email> <01d22092-8292-8ed7-ece7-9ca32d15bbce@suse.com>
 <YzxxXuovwQt3NskE@itl-email> <a0dc1158-01b1-4272-b86e-52f4996f0747@suse.com> <Yz3I2qwl243h9ZfZ@itl-email>
In-Reply-To: <Yz3I2qwl243h9ZfZ@itl-email>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 5 Oct 2022 23:28:29 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHFi71SKQAQHEjZTLyp-YooRTYZ2-nqydRZA5hys7tkKw@mail.gmail.com>
Message-ID: <CAMj1kXHFi71SKQAQHEjZTLyp-YooRTYZ2-nqydRZA5hys7tkKw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] Avoid using EFI tables Xen may have clobbered
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Kees Cook <keescook@chromium.org>, 
	Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Oct 2022 at 20:11, Demi Marie Obenour
<demi@invisiblethingslab.com> wrote:
>
> On Wed, Oct 05, 2022 at 08:15:07AM +0200, Jan Beulich wrote:
> > On 04.10.2022 17:46, Demi Marie Obenour wrote:
> > > Linux has a function called efi_mem_reserve() that is used to reserve
> > > EfiBootServicesData memory that contains e.g. EFI configuration tables.
> > > This function does not work under Xen because Xen could have already
> > > clobbered the memory.  efi_mem_reserve() not working is the whole reason
> > > for this thread, as it prevents EFI tables that are in
> > > EfiBootServicesData from being used under Xen.
> > >
> > > A much nicer approach would be for Xen to reserve boot services memory
> > > unconditionally, but provide a hypercall that dom0 could used to free
> > > the parts of EfiBootServicesData memory that are no longer needed.  This
> > > would allow efi_mem_reserve() to work normally.
> >
> > efi_mem_reserve() actually working would be a layering violation;
> > controlling the EFI memory map is entirely Xen's job.
>
> Doing this properly would require Xen to understand all of the EFI
> tables that could validly be in EfiBootServices* and which could be of
> interest to dom0.  It might (at least on some very buggy firmware)
> require a partial ACPI and/or SMBIOS implementation too, if the firmware
> decided to put an ACPI or SMBIOS table in EfiBootServices*.
>
> > As to the hypercall you suggest - I wouldn't mind its addition, but only
> > for the case when -mapbs is used. As I've indicated before, I'm of the
> > opinion that default behavior should be matching the intentions of the
> > spec, and the intention of EfiBootServices* is for the space to be
> > reclaimed. Plus I'm sure you realize there's a caveat with Dom0 using
> > that hypercall: It might use it for regions where data lives which it
> > wouldn't care about itself, but which an eventual kexec-ed (or alike)
> > entity would later want to consume. Code/data potentially usable by
> > _anyone_ between two resets of the system cannot legitimately be freed
> > (and hence imo is wrong to live in EfiBootServices* regions).
>
> I agree, but currently some such data *is* in EfiBootServices* regions,
> sadly.  When -mapbs is *not* used, I recommend uninstalling all of the
> configuration tables that point to EfiBootServicesData memory before
> freeing that memory.
>

That seems like a reasonable approach to me. Tables like MEMATTR or
RT_PROP are mostly relevant for bare metal where the host kernel maps
the runtime services, and in general, passing on these tables without
knowing what they do is kind of fishy anyway. You might even argue
that only known table types should be forwarded in the first place,
regardless of the memory type.

