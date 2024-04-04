Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7D1899255
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 01:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701033.1095051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsWxU-00056P-9D; Thu, 04 Apr 2024 23:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701033.1095051; Thu, 04 Apr 2024 23:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsWxU-00053C-6D; Thu, 04 Apr 2024 23:57:28 +0000
Received: by outflank-mailman (input) for mailman id 701033;
 Thu, 04 Apr 2024 23:57:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1z08=LJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rsWxS-000530-KP
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 23:57:26 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13f56a8b-f2df-11ee-afe5-a90da7624cb6;
 Fri, 05 Apr 2024 01:57:24 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4CB6DCE0B68;
 Thu,  4 Apr 2024 23:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF76C433C7;
 Thu,  4 Apr 2024 23:57:19 +0000 (UTC)
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
X-Inumbo-ID: 13f56a8b-f2df-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712275040;
	bh=YTWn/jLDqYsG7yndIXOne58onBFK4yvUrvIZTyJfHdA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HOKH3deZ1r7mX+GVFVHMC4Yi4ddyWvN2eA7WhsPO6Z/6vHHimUD87LA87DFSJrizo
	 2N3myvv+Lfx8xRQVXXGeueAsjvpsQc/x+rps+cryWKpGUlwPfh3hPSxDuYGhYLgc04
	 eKdVCWElnFFb0rU0nu2Bm7ktCQRABcQw/sohTWhjLz82n4C9haY7gfORPklDcp4gpU
	 C0EjT/8q/VXxIEwAuG2KNpum8ACZUXq5ZwiTOBG0xc6jNtM9owvRt2hwizNgLHq04i
	 NpUgj82MOdpzM1HOhvTtbLoZGQOUzboLa38VutpzfshZGJx+wbiwt/8R5IeJyjeimJ
	 l9IJaM5j6Ztkg==
Date: Thu, 4 Apr 2024 16:57:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>
Subject: Re: [PATCH v3] docs/misra: document the expected sizes of integer
 types
In-Reply-To: <703E19A2-FED2-4DA1-B9AA-1AF55BBE85B4@arm.com>
Message-ID: <alpine.DEB.2.22.394.2404041656390.2245130@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2404031806510.2245130@ubuntu-linux-20-04-desktop> <703E19A2-FED2-4DA1-B9AA-1AF55BBE85B4@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 Apr 2024, Bertrand Marquis wrote:
> Hi Stefano,
> 
> > On 4 Apr 2024, at 03:12, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > Xen makes assumptions about the size of integer types on the various
> > architectures. Document these assumptions.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > Changes in v3:
> > - add links to System V, AAPCS32 and AAPCS64
> > 
> > ---
> > docs/misra/C-language-toolchain.rst | 69 +++++++++++++++++++++++++++++
> > 1 file changed, 69 insertions(+)
> > 
> > diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
> > index b7c2000992..84b21992bc 100644
> > --- a/docs/misra/C-language-toolchain.rst
> > +++ b/docs/misra/C-language-toolchain.rst
> > @@ -480,4 +480,73 @@ The table columns are as follows:
> >      - See Section "4.13 Preprocessing Directives" of GCC_MANUAL and Section "11.1 Implementation-defined behavior" of CPP_MANUAL.
> > 
> > 
> > +Sizes of Integer types
> > +______________________
> > +
> > +Xen expects System V ABI on x86_64:
> > +  https://gitlab.com/x86-psABIs/x86-64-ABI
> > +
> > +Xen expects AAPCS32 on ARMv8-A AArch32:
> > +  https://github.com/ARM-software/abi-aa/blob/main/aapcs32/aapcs32.rst
> > +
> > +Xen expects AAPCS64 LP64 on ARMv8-A AArch64:
> > +  https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst
> 
> We still support armv7 somehow so we should add something for it here.
> 
> > +
> > +A summary table of data types, sizes and alignment is below:
> > +
> > +.. list-table::
> > +   :widths: 10 10 10 45
> > +   :header-rows: 1
> > +
> > +   * - Type
> > +     - Size
> > +     - Alignment
> > +     - Architectures
> > +
> > +   * - char 
> > +     - 8 bits
> > +     - 8 bits
> > +     - all architectures
> > +
> > +   * - short
> > +     - 16 bits
> > +     - 16 bits
> > +     - all architectures
> > +
> > +   * - int
> > +     - 32 bits
> > +     - 32 bits
> > +     - all architectures
> > +
> > +   * - long
> > +     - 32 bits
> > +     - 32 bits 
> > +     - 32-bit architectures (x86_32, ARMv8-A AArch32, ARMv8-R AArch32)
> 
> Same here armv7 should be mentioned.
> 
> > +
> > +   * - long
> > +     - 64 bits
> > +     - 64 bits 
> > +     - 64-bit architectures (x86_64, ARMv8-A AArch64, RV64, PPC64)
> > +
> > +   * - long long
> > +     - 64-bit
> > +     - 32-bit
> > +     - x86_32
> > +
> > +   * - long long
> > +     - 64-bit
> > +     - 64-bit
> > +     - 64-bit architectures, ARMv8-A AArch32, ARMv8-R AArch32
> 
> Should this be all architecture except x86_32 ?

yes

> > +
> > +   * - pointer
> > +     - 32-bit
> > +     - 32-bit
> > +     - 32-bit architectures (x86_32, ARMv8-A AArch32, ARMv8-R AArch32)
> 
> Armv7 missing here.

What is the formal name I should use for it here? ARMv7 AArch32 ?

