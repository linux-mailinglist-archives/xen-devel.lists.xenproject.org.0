Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CF95980E2
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 11:34:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389404.626288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oObui-0002RF-BA; Thu, 18 Aug 2022 09:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389404.626288; Thu, 18 Aug 2022 09:34:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oObui-0002OV-7e; Thu, 18 Aug 2022 09:34:08 +0000
Received: by outflank-mailman (input) for mailman id 389404;
 Thu, 18 Aug 2022 09:34:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+/fD=YW=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1oObug-0002OP-QM
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 09:34:06 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6a65f80-1ed8-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 11:34:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B6244B82131
 for <xen-devel@lists.xenproject.org>; Thu, 18 Aug 2022 09:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B43C433C1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Aug 2022 09:34:03 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 k18-20020a05600c0b5200b003a5dab49d0bso617570wmr.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Aug 2022 02:34:03 -0700 (PDT)
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
X-Inumbo-ID: e6a65f80-1ed8-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660815243;
	bh=czFwYtQsnSqmMpfqZFNWWQoY309RHWBFWcKUw6sHvgE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tUzGMwfRX2aYI2/ZIpab52tik7ECl1Wq3V03akxFYI029k6gukrTdoSxbDvt9VtG4
	 yKJMWmuehKPwexCly71omnBiTFP4zwi3xL+KGYcsygt+Vr8E57EZ+uqDeH743Jph2X
	 Q0Z1vdj9E3PWFezkgPnMn8FH+1qKCIB5CkpFeQW4v96VwFm4g7viGLnAWtKDvoE4nf
	 kwiiAKYjRAg2zWN0aungS66A/wV5DnhWVteKFz6OaZ4OjqitavAqTTBq+EYLkFmGlx
	 kI4Yy1FcfPsFnrXxiHy3wGtElRNzEYI/xIlCrlaLomOvJGhpWyS8+hdf9NW6VEGqKe
	 cOFN+IFd5S2ZQ==
X-Gm-Message-State: ACgBeo0qaw/JWvcuwQzc2k2Tpp6m608GyvUaCLViK4J7dWD+xtTQI2M4
	ZavGLk92t6DEdnGBGPZYYJ2meMH+Cg6PdTAC4h4=
X-Google-Smtp-Source: AA6agR7hmo4sRbY2ji12PLCUd9rmlvulyDkIBMzU4hp2UVvPl2KWOuL65a5T9PGD1Jr9G1T12QcANZQxUfKr64XTMNo=
X-Received: by 2002:a1c:a3c4:0:b0:3a5:512f:717a with SMTP id
 m187-20020a1ca3c4000000b003a5512f717amr4528691wme.192.1660815241639; Thu, 18
 Aug 2022 02:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220817105720.111618-1-leo.yan@linaro.org> <fd24b049-abf2-34e8-e0b0-2c2d2d1e1b0f@suse.com>
 <CAMj1kXEDxHC6RgKfcmpXGDxwQ0mTKG146D8dJnrwJ1cWWXZ=3g@mail.gmail.com> <Yv4DMuQHbGNhqAP4@leoy-yangtze.lan>
In-Reply-To: <Yv4DMuQHbGNhqAP4@leoy-yangtze.lan>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 18 Aug 2022 11:33:50 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHkWH7tkpuPLLjWszOVTQ-Cr3Zcbj8w0bogSd0Y_hso0g@mail.gmail.com>
Message-ID: <CAMj1kXHkWH7tkpuPLLjWszOVTQ-Cr3Zcbj8w0bogSd0Y_hso0g@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
To: Leo Yan <leo.yan@linaro.org>
Cc: Jan Beulich <jbeulich@suse.com>, Marc Zyngier <maz@kernel.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Rahul Singh <Rahul.Singh@arm.com>, 
	Peter Griffin <peter.griffin@linaro.org>, xen-devel <xen-devel@lists.xenproject.org>, 
	Julien Grall <jgrall@amazon.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Aug 2022 at 11:15, Leo Yan <leo.yan@linaro.org> wrote:
>
> Hi Ard,
>
> On Wed, Aug 17, 2022 at 03:49:32PM +0200, Ard Biesheuvel wrote:
>
> [...]
>
> > > This header holds ACPI spec defined data structures. This one looks
> > > to be a Linux one, and hence shouldn't be defined here. You use it
> > > in a single CU only, so I see no reason to define it there.
> > >
> > > Furthermore - what if Linux decided to change their structure? Or
> > > is there a guarantee that they won't?
> >
> > No, there is not. The memreserve table is an internal interface
> > between the EFI stub loader and the Linux kernel proper.
> >
> > As I have argued many times before, booting the arm64 kernel in
> > EFI/ACPI mode without going through the EFI stub violates the ACPI
> > spec, and relies on interfaces that were not intended for public
> > consumption.
>
> Let me ask a question but sorry it might be off topic.
>
> In the Linux kernel function:
>
>   static int gic_reserve_range(phys_addr_t addr, unsigned long size)
>   {
>           if (efi_enabled(EFI_CONFIG_TABLES))
>                   return efi_mem_reserve_persistent(addr, size);
>
>           return 0;
>   }
>
> We can see it will reserve persistent memory region for GIC pending
> pages, so my question is if a platform is booting with DT binding
> rather than ACPI table, how the primary kernel can reserve the pages
> and pass the info to the secondary kernel?
>
> Seems it's broken for kdump/kexec if kernel boots with using DT?
>

EFI supports both DT and ACPI boot, but only ACPI *requires* EFI.

So DT boot on hardware with affected GICv3 implementations works fine
with kdump/kexec as long as EFI is being used. Using non-EFI boot and
kexec on such systems will likely result in a splat on the second
kernel, unless there is another mechanism being used to reserve the
memory in DT as well.

Maybe we should wire up the EFI_PARAVIRT flag for Xen dom0 on arm64,
so that we can filter out the call above. That would mean that
Xen/arm64/dom0/kexec on affected hardware would result in a splat in
the second kernel as well, but whether that matters depends on your
support scope.

