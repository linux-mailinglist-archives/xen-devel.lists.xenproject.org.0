Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C39387D780
	for <lists+xen-devel@lfdr.de>; Sat, 16 Mar 2024 01:08:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694101.1082966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlHah-00043d-5n; Sat, 16 Mar 2024 00:07:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694101.1082966; Sat, 16 Mar 2024 00:07:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlHah-00041z-2Z; Sat, 16 Mar 2024 00:07:59 +0000
Received: by outflank-mailman (input) for mailman id 694101;
 Sat, 16 Mar 2024 00:07:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e312=KW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rlHaf-00041t-Bx
 for xen-devel@lists.xenproject.org; Sat, 16 Mar 2024 00:07:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c7307e5-e329-11ee-a1ee-f123f15fe8a2;
 Sat, 16 Mar 2024 01:07:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E3C776181E;
 Sat, 16 Mar 2024 00:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE9FC433F1;
 Sat, 16 Mar 2024 00:07:52 +0000 (UTC)
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
X-Inumbo-ID: 3c7307e5-e329-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710547673;
	bh=YsslnC7kNcz4/PFmexsOORIdSazznJu1TK9JiAM+gsU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ttzHrMRI7DSWGTRZQZ1d5OFXDmaUzXnMZVEc6dtfR82cVuOobr4oCXRojrv/9VwfT
	 UMbfmy/qSNxzZ3HNVOdwBg45Q7JOiB52TwlHEa7OfR84MhZPqegV25yWd6eKLEg1Q8
	 NC7qeNXbpuzYjw1BOdB0P3khhsBUUJdWPlV7eKPQlr2DhvSKsP4P9/hOc+GymwOOaM
	 bLyh+jtzdjLYSjl/cZpQZrjlzA4ymYWIfDkTS0MrYbivh1cmI5PnVC/51B3gtB+Tw8
	 VSYIXk26DcOIKi+CM5RVqBbj8EWrcani+NqvG6KO/sA+RmkR8jUD98iZ4rcwz2P4qh
	 2f0LKpDDDhhGw==
Date: Fri, 15 Mar 2024 17:07:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, george.dunlap@citrix.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] docs/misra: document the expected sizes of integer
 types
In-Reply-To: <6a76723e-ba47-40b3-8f33-d68030b14299@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403151658530.853156@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2403141516550.853156@ubuntu-linux-20-04-desktop> <6a76723e-ba47-40b3-8f33-d68030b14299@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Mar 2024, Jan Beulich wrote:
> On 14.03.2024 23:17, Stefano Stabellini wrote:
> > Xen makes assumptions about the size of integer types on the various
> > architectures. Document these assumptions.
> 
> My prior reservation wrt exact vs minimum sizes remains.

We have to specify the exact size. In practice the size is predetermined
and exact with all our supported compilers given a architecture.

Most importantly, unfortunately we use non-fixed-size integer types in
C hypercall entry points and public ABIs. In my opinion, that is not
acceptable.

We have two options:

1) we go with this document, and we clarify that even if we specify
  "unsigned int", we actually mean a 32-bit integer

2) we change all our public ABIs and C hypercall entry points to use
   fixed-size types (e.g. s/unsigned int/uint32_t/g)

2) is preferred because it is clearer but it is more work. So I went
with 1). I also thought you would like 1) more.


> Additionally, is it really meaningful to document x86-32 as an
> architecture, when it's been many years that the hypervisor cannot be
> built anymore for that target?

You are right. I should take x86_32 out. I'll do it in the next version.

