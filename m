Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0CC9F014D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 01:55:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856397.1269028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLtxe-0002Qg-Db; Fri, 13 Dec 2024 00:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856397.1269028; Fri, 13 Dec 2024 00:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLtxe-0002OH-AC; Fri, 13 Dec 2024 00:55:18 +0000
Received: by outflank-mailman (input) for mailman id 856397;
 Fri, 13 Dec 2024 00:55:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQ2+=TG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tLtxc-0002K4-R3
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 00:55:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9fd6d5c-b8ec-11ef-a0d6-8be0dac302b0;
 Fri, 13 Dec 2024 01:55:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E138B5C0391;
 Fri, 13 Dec 2024 00:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16514C4CED4;
 Fri, 13 Dec 2024 00:55:12 +0000 (UTC)
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
X-Inumbo-ID: e9fd6d5c-b8ec-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734051314;
	bh=OTFg+UYe06c8WEhbKmCTFULMPgpPXAcShiclVdaTYC0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=N068kFzMuvlk7/NaECFZMm9jydr548ID+mUkybnuTDXILSXQ0EstiowfTl/96FHhy
	 7/joQ1dlNkPB9BoEUvyJ5/uKfCnHddqoX7sxYsBAtAKPzOydOjZ7LXVGorZ8ejHPYG
	 XMtuOHKiQVH+B3LsqsZOAgsKtEmXW+xFe5Ay5uqO9fmflXTNbP2Jgjg6/2aU10DUKh
	 FNODVBwYZsI6kR5fjoeyFEEpxIJLmY+xAB70Ps2FlrsvT8vGZK6ZlEc/C7Mfje0PMU
	 cbEpaRwBthF7UC0XerRzeO7ZomQa5rM8eS8D+nYz9HCfSestRNZJmEQVb+O2tTpBOW
	 BBj07SzXM8OFQ==
Date: Thu, 12 Dec 2024 16:55:11 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] misra: add deviation for MISRA C Rule R11.1.
In-Reply-To: <032d2e7b-7828-4a7f-a2d2-c2df46831507@suse.com>
Message-ID: <alpine.DEB.2.22.394.2412121654300.463523@ubuntu-linux-20-04-desktop>
References: <8db58416ce215a3c5fdba8074dc21f32116e8a41.1733915076.git.alessandro.zucchelli@bugseng.com> <e413574c-f7ab-428c-a95c-30a73c0f30c8@suse.com> <alpine.DEB.2.22.394.2412111827540.463523@ubuntu-linux-20-04-desktop>
 <032d2e7b-7828-4a7f-a2d2-c2df46831507@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Dec 2024, Jan Beulich wrote:
> On 12.12.2024 03:29, Stefano Stabellini wrote:
> > On Wed, 11 Dec 2024, Jan Beulich wrote:
> >> On 11.12.2024 12:05, Alessandro Zucchelli wrote:
> >>> Rule 11.1 states as following: "Conversions shall not be performed
> >>> between a pointer to a function and any other type".
> >>>
> >>> In "xen/common/bug.c", in order to get additional debug information,
> >>> pointer "bug_fn_t *fn" in the data section is converted to a function
> >>> pointer, which is then used to get such information.
> >>
> >> If the pointer converted pointed into the data section, it would fault
> >> upon being used to call what it points to, for the lack of execute
> >> permissions there.
> >>
> >> The change itself looks okay to me, but the description imo needs
> >> updating, to be as precise as possible.
> > 
> > 
> > What about:
> > 
> > In "xen/common/bug.c", in order to get additional debug information,
> > pointer "bug_fn_t *fn" is converted to a function pointer, which is then
> > used to get such information.
> > 
> > ?
> 
> This may do; I, however, was rather hoping for the description to be
> extended rather than shrunk. E.g. '..., pointer "bug_fn_t *fn", obtained
> by arithmetic on a pointer originating in the data section, is converted
> to a function pointer, ...'

That's fine. 

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

If you feel like fixing it on commit, please go ahead.

