Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0FD5F1006
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 18:31:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414322.658537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeIuy-0003HI-P4; Fri, 30 Sep 2022 16:31:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414322.658537; Fri, 30 Sep 2022 16:31:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeIuy-0003Ef-MP; Fri, 30 Sep 2022 16:31:16 +0000
Received: by outflank-mailman (input) for mailman id 414322;
 Fri, 30 Sep 2022 16:31:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VUOy=2B=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1oeIux-0003EZ-AC
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 16:31:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b616f4a-40dd-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 18:31:12 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C6EE6623C6
 for <xen-devel@lists.xenproject.org>; Fri, 30 Sep 2022 16:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D0EC433C1
 for <xen-devel@lists.xenproject.org>; Fri, 30 Sep 2022 16:31:10 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id a8so7632904lff.13
 for <xen-devel@lists.xenproject.org>; Fri, 30 Sep 2022 09:31:10 -0700 (PDT)
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
X-Inumbo-ID: 4b616f4a-40dd-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664555470;
	bh=942mhlsPgXt/goX0aW+X613nTk5Qs5Pp3COTvOdUwZ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QQaItIyYxi0HLaL4oqDkDYh05o8FbZWsbNU2Y0NT8kfZub1XP2IlO80nVvphwfoss
	 Gj/++qo/ntHKK12oR+56pq5jRBesGpWCKimqBXV8vwP9toEB8f0gCD38Es5z/EU7VT
	 VsqktOXdiERPDC+Vii8DyivL3vp4liDmw58t3AvpGteE+STVh8QvyYD1SXoaoPUTAB
	 Fu50V06BvneE1AOB9NyhkkhHe3/KhprXgrGip/9zei+PqUoLPuLy7E+fmvvnGtPaun
	 2I+F1ZtSPJ7krbco6i4pnvW/YoXrVynpr0OLtnnO+B4XC40hn8SKW9Iq797zMlxH3b
	 Yd/7X7L1ncJRw==
X-Gm-Message-State: ACrzQf2jkavlV/9y0GAZrt+VKsJEKEaxOp3F5M4FZ4eiIswUGclhKrXx
	g+HDhXz9BsMl/ncRBzU9Z88SAdiclDj7aCv7GXM=
X-Google-Smtp-Source: AMsMyM7t5cQJ9hJx6xjrAJTWEfjKbUDevZQY6USEnBYzXwQs0wF27IzFulILlj/o9uw7ykYh3FpqgxTj+d47/dk/PFQ=
X-Received: by 2002:a05:6512:3691:b0:4a1:f82a:9067 with SMTP id
 d17-20020a056512369100b004a1f82a9067mr3981182lfs.110.1664555468264; Fri, 30
 Sep 2022 09:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1664298147.git.demi@invisiblethingslab.com>
 <f3b624e99adfdbbfc1976a60a73a6b5950e1840d.1664298147.git.demi@invisiblethingslab.com>
 <282a225d-8782-0321-6f0e-19dd4510dc42@suse.com>
In-Reply-To: <282a225d-8782-0321-6f0e-19dd4510dc42@suse.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 30 Sep 2022 18:30:57 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFQNqsW5RfHGac-eGbosJHBybu6+-Fap_bi_kVxWNpGeg@mail.gmail.com>
Message-ID: <CAMj1kXFQNqsW5RfHGac-eGbosJHBybu6+-Fap_bi_kVxWNpGeg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] Avoid using EFI tables Xen may have clobbered
To: Jan Beulich <jbeulich@suse.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Kees Cook <keescook@chromium.org>, 
	Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Sept 2022 at 08:44, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 30.09.2022 01:02, Demi Marie Obenour wrote:
> > Memory of type EFI_CONVENTIONAL_MEMORY, EFI_LOADER_CODE, EFI_LOADER_DATA,
> > EFI_BOOT_SERVICES_CODE, and EFI_BOOT_SERVICES_DATA may be clobbered by
> > Xen before Linux gets to start using it.  Therefore, Linux under Xen
> > must not use EFI tables from such memory.  Most of the remaining EFI
> > memory types are not suitable for EFI tables, leaving only
> > EFI_ACPI_RECLAIM_MEMORY, EFI_RUNTIME_SERVICES_DATA, and
> > EFI_RUNTIME_SERVICES_CODE.  When running under Xen, Linux should only
> > use tables that are located in one of these types of memory.
> >
> > This patch ensures this, and also adds a function
> > (xen_config_table_memory_region_max()) that will be used later to
> > replace the usage of the EFI memory map in esrt.c when running under
> > Xen.  This function can also be used in mokvar-table.c and efi-bgrt.c,
> > but I have not implemented this.
> >
> > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>
> In Xen we don't clobber EfiBootServices{Code,Data} when xen.efi was passed
> "-mapbs". Should we perhaps extend the interface such that Dom0 can then
> also use tables located in such regions, perhaps by faking
> EFI_MEMORY_RUNTIME in the attributes returned by XEN_FW_EFI_MEM_INFO?
>

I know this ship has sailed for x86, but for the sake of other
architectures, I'd strongly recommend leaving the EFI_MEMORY_RUNTIME
bits alone, for the same reasons I gave earlier. (Runtime mappings for
the firmware code itself, page table fragmentation etc etc)

I know very little about Xen, but based on the context you provided in
this thread, I'd say that the best approach from the Xen side is to
convert all EfiBootServicesData regions that have configuration tables
pointing into them into EfiAcpiReclaimMemory.

I take it XEN_FW_EFI_MEM_INFO is an existing interface? If so, you
might do the same for the returned type - EfiBootServicesData ->
EfiAcpiReclaimMemory, and not muck about with the EFI_MEMORY_RUNTIME
attribute.

