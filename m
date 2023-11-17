Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 354267EEA2B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 01:11:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634761.990225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3mRp-0006QM-17; Fri, 17 Nov 2023 00:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634761.990225; Fri, 17 Nov 2023 00:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3mRo-0006OU-UT; Fri, 17 Nov 2023 00:11:00 +0000
Received: by outflank-mailman (input) for mailman id 634761;
 Fri, 17 Nov 2023 00:11:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5d38=G6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r3mRo-0006OO-4j
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 00:11:00 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c751b5f8-84dd-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 01:10:58 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 58549CE21FE;
 Fri, 17 Nov 2023 00:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5336C433C8;
 Fri, 17 Nov 2023 00:10:50 +0000 (UTC)
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
X-Inumbo-ID: c751b5f8-84dd-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700179852;
	bh=JURK0RemGiM4BtLEWY7w4k9ZWL3bdEcOzlseGQP78jE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l7llJ+tAcZhoGkcSgWq//nw3SNgojkcuj+P66pTPP0sSTI8iNHL1M4bCp9O+goh8h
	 JClsp0bqJISFli7QYqdKdRqSqg3AMNYDD/AVFhdnKkJLshpXMhOM0Pi3k0wBJ4n5Uy
	 +5jsDph99Rub8ue3R4BwL3ffJO3cqO4bSK9DWXJsg5O4O8WdlMgCNEjsnhPTOgk9Oz
	 +mXnth6pr4Col6DUm1T/jgsCc7dgl6uc2F9oPVLvli4GhvKkMHTonHR3/PN88+/bi4
	 MpaRN7DPd4jaMVhpJD0rrqVKWbLLEkFTZQATXAkYaxjjJGKNr7gAQ4UzQ/ADgoqvE7
	 b4jI9lTrT/eSA==
Date: Thu, 16 Nov 2023 16:10:49 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    bertrand.marquis@arm.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v4 1/2] automation/eclair: make the docs for MISRA
 C:2012 Dir 4.1 visible to ECLAIR
In-Reply-To: <9f9772e8-0c30-4d9e-92af-2ad66f28857f@suse.com>
Message-ID: <alpine.DEB.2.22.394.2311161608410.773207@ubuntu-linux-20-04-desktop>
References: <cover.1699975581.git.nicola.vetrini@bugseng.com> <f14b266f18089f5951a3e390a5ebfe713beb8dbb.1699975581.git.nicola.vetrini@bugseng.com> <f63fa9b5-a821-49d4-88f6-7d991ab6c644@xen.org> <1689d4b47d708098c43601a58e867f1c@bugseng.com>
 <ecbfa46d-2e0a-4685-9695-f7de37e7b6ce@xen.org> <fd6f51afebb9fd90531e30289eb99d8c@bugseng.com> <9f9772e8-0c30-4d9e-92af-2ad66f28857f@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Nov 2023, Jan Beulich wrote:
> On 16.11.2023 09:45, Nicola Vetrini wrote:
> > On 2023-11-15 12:22, Julien Grall wrote:
> >> But I noticed you were using gcc-12 and originally thought it was a 
> >> mistake until I saw the second use.
> >>
> >> The advantage of a variable CC (and CXX) is you can add a comment on 
> >> top why you are specifically requestion gcc-12? IOW, why is gcc not 
> >> fine?
> >>
> > 
> > The assumptions in C-language-toolchain.rst (which are reflected in the 
> > analysis config) are using gcc-12 explicitly; that's just easier from a 
> > certification perspective to have a fixed version.
> 
> I'm wondering: Upstream Xen isn't going to undergo any certification
> effort, aiui. Downstreams who want to do so may have good reasons to
> choose a specific compiler version, which may well not be gcc12. How
> are we meaning to deal with that?

I think the most important part is to detail all our dependencies on the
compiler and compiler's specific behaviors. If we do that, taking gcc12
as an example, then any downstream can look at C-language-toolchain.rst
and see if there are any differences or any gaps in their compiler of
choice compared to the reference (gcc12).

