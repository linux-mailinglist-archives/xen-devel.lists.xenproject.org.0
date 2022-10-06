Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDF85F61A9
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 09:33:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416656.661314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogLMU-0008HS-Ja; Thu, 06 Oct 2022 07:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416656.661314; Thu, 06 Oct 2022 07:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogLMU-0008E2-Fu; Thu, 06 Oct 2022 07:32:06 +0000
Received: by outflank-mailman (input) for mailman id 416656;
 Thu, 06 Oct 2022 07:32:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hmTD=2H=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1ogLMT-0008Dg-94
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 07:32:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f87ad460-4548-11ed-964a-05401a9f4f97;
 Thu, 06 Oct 2022 09:32:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 55A7261870
 for <xen-devel@lists.xenproject.org>; Thu,  6 Oct 2022 07:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB98C43140
 for <xen-devel@lists.xenproject.org>; Thu,  6 Oct 2022 07:32:01 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id x40so1214648ljq.9
 for <xen-devel@lists.xenproject.org>; Thu, 06 Oct 2022 00:32:01 -0700 (PDT)
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
X-Inumbo-ID: f87ad460-4548-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665041521;
	bh=VEE+qeskd4vr15hp0HONqTNmGFQc194J37xrvzeQFbA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p3GArwweEXG2MRPB0YiHgtfe31rDdrMAM3rqo8Hf4bD9zuKp1WCND2l8bPnSyWDAG
	 MyyD877aalEd0wimXnkH51ZDgsoHBd2S3FOBGER2clswRz1Wybejlo0MDmaVTi/RFV
	 jexIyjUV8kSIDLT4bTlO2RdX3upVdyItpIvgGIE8APijU1eKwCKWJN14+2/SiukeK8
	 GPi65RrikNAKqWDctAGvPEz7gbcmOk81NuyGWFyl9DaJGeZWpq40lDP0+V+nQxsvJd
	 WJ+YQ7k+LRFeF0k5Cow/CCQ2aaKb7hWXv/JE6ZqOUpH5zNco7mh3zrAFndcgz+ds+T
	 gITytupwMwt2g==
X-Gm-Message-State: ACrzQf3AmyAs3CAQUeimXSMzO0F7PadBnSacZM6EjFPYYVWZsYRLGLdF
	0kmRAfhGPQypbMr0HcUFfwzuY1CsrOaeVzPbwOs=
X-Google-Smtp-Source: AMsMyM4FY1O/rb/P8UUxDe34KFVoPInPMbW8nB/Pt6z7vbO72Tszv6qLckNvVf6ZyCal7E1hTuT+B0rpFotRK8/+HiM=
X-Received: by 2002:a2e:2d0a:0:b0:26c:a1c:cdf with SMTP id t10-20020a2e2d0a000000b0026c0a1c0cdfmr1335959ljt.352.1665041519591;
 Thu, 06 Oct 2022 00:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <282a225d-8782-0321-6f0e-19dd4510dc42@suse.com>
 <CAMj1kXFQNqsW5RfHGac-eGbosJHBybu6+-Fap_bi_kVxWNpGeg@mail.gmail.com>
 <YzcjeiOW8+i2Zxsd@itl-email> <CAMj1kXHBBbCNV3CLesqZi7ttmmi8y4tZ1KO5vievy_CJrU2o3Q@mail.gmail.com>
 <YzeaKjmls1YI/3ox@itl-email> <01d22092-8292-8ed7-ece7-9ca32d15bbce@suse.com>
 <YzxxXuovwQt3NskE@itl-email> <a0dc1158-01b1-4272-b86e-52f4996f0747@suse.com>
 <Yz3I2qwl243h9ZfZ@itl-email> <CAMj1kXHFi71SKQAQHEjZTLyp-YooRTYZ2-nqydRZA5hys7tkKw@mail.gmail.com>
 <Yz4yLyvX6un1rrqC@itl-email>
In-Reply-To: <Yz4yLyvX6un1rrqC@itl-email>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 6 Oct 2022 09:31:47 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFO9_yMw=_Fn2DBGgdYXgiK_OqafG5+TbJv1UKO1uQiJQ@mail.gmail.com>
Message-ID: <CAMj1kXFO9_yMw=_Fn2DBGgdYXgiK_OqafG5+TbJv1UKO1uQiJQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] Avoid using EFI tables Xen may have clobbered
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Kees Cook <keescook@chromium.org>, 
	Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Oct 2022 at 03:41, Demi Marie Obenour
<demi@invisiblethingslab.com> wrote:
>
> On Wed, Oct 05, 2022 at 11:28:29PM +0200, Ard Biesheuvel wrote:
> > On Wed, 5 Oct 2022 at 20:11, Demi Marie Obenour
> > <demi@invisiblethingslab.com> wrote:
> > >
> > > On Wed, Oct 05, 2022 at 08:15:07AM +0200, Jan Beulich wrote:
> > > > On 04.10.2022 17:46, Demi Marie Obenour wrote:
> > > > > Linux has a function called efi_mem_reserve() that is used to reserve
> > > > > EfiBootServicesData memory that contains e.g. EFI configuration tables.
> > > > > This function does not work under Xen because Xen could have already
> > > > > clobbered the memory.  efi_mem_reserve() not working is the whole reason
> > > > > for this thread, as it prevents EFI tables that are in
> > > > > EfiBootServicesData from being used under Xen.
> > > > >
> > > > > A much nicer approach would be for Xen to reserve boot services memory
> > > > > unconditionally, but provide a hypercall that dom0 could used to free
> > > > > the parts of EfiBootServicesData memory that are no longer needed.  This
> > > > > would allow efi_mem_reserve() to work normally.
> > > >
> > > > efi_mem_reserve() actually working would be a layering violation;
> > > > controlling the EFI memory map is entirely Xen's job.
> > >
> > > Doing this properly would require Xen to understand all of the EFI
> > > tables that could validly be in EfiBootServices* and which could be of
> > > interest to dom0.  It might (at least on some very buggy firmware)
> > > require a partial ACPI and/or SMBIOS implementation too, if the firmware
> > > decided to put an ACPI or SMBIOS table in EfiBootServices*.
> > >
> > > > As to the hypercall you suggest - I wouldn't mind its addition, but only
> > > > for the case when -mapbs is used. As I've indicated before, I'm of the
> > > > opinion that default behavior should be matching the intentions of the
> > > > spec, and the intention of EfiBootServices* is for the space to be
> > > > reclaimed. Plus I'm sure you realize there's a caveat with Dom0 using
> > > > that hypercall: It might use it for regions where data lives which it
> > > > wouldn't care about itself, but which an eventual kexec-ed (or alike)
> > > > entity would later want to consume. Code/data potentially usable by
> > > > _anyone_ between two resets of the system cannot legitimately be freed
> > > > (and hence imo is wrong to live in EfiBootServices* regions).
> > >
> > > I agree, but currently some such data *is* in EfiBootServices* regions,
> > > sadly.  When -mapbs is *not* used, I recommend uninstalling all of the
> > > configuration tables that point to EfiBootServicesData memory before
> > > freeing that memory.
> > >
> >
> > That seems like a reasonable approach to me. Tables like MEMATTR or
> > RT_PROP are mostly relevant for bare metal where the host kernel maps
> > the runtime services, and in general, passing on these tables without
> > knowing what they do is kind of fishy anyway. You might even argue
> > that only known table types should be forwarded in the first place,
> > regardless of the memory type.
>
> Which tables are worth handling in Xen?  I know about ACPI, SMBIOS, and
> ESRT, but I am curious which others Xen should preserve.  Currently, Xen
> does not know about RT_PROP or MEMATTR; could this be a cause of
> problems?

dom0 only has access to paravirtualized EFI runtime services, so
consuming RT_PROP or MEMATTR should be up to Xen (they describe which
runtime services remain available at runtime, and which permission
attributes to use for the runtime services memory regions,
respectively)

Looking through the kernel code, I don't think there are any that dom0
should care about beyond ACPI, SMBIOS and ESRT. But as you suggest,
that means Xen should just mask them in the view of the EFI system
table it exposes so dom0. Otherwise, the kernel may still try to map
and parse them.

