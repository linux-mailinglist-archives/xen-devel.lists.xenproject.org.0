Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A26987C57D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 00:00:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693570.1081862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rku3H-00019y-1v; Thu, 14 Mar 2024 22:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693570.1081862; Thu, 14 Mar 2024 22:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rku3G-00016l-VQ; Thu, 14 Mar 2024 22:59:54 +0000
Received: by outflank-mailman (input) for mailman id 693570;
 Thu, 14 Mar 2024 22:59:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=69K2=KU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rku3F-00016d-5M
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 22:59:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fa4d13f-e256-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 23:59:51 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 97D72614BF;
 Thu, 14 Mar 2024 22:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6856CC433C7;
 Thu, 14 Mar 2024 22:59:47 +0000 (UTC)
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
X-Inumbo-ID: 8fa4d13f-e256-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710457189;
	bh=B1m3mkYGtw035NpRvFdVY8FwG6Pi9tCTh0TuZyTNYr4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bNXdlUM0GwJpidoKgE1aPU9zpJm/TOBddO1i+i5YJ9ASLfekX/JJzFm5i0CWXK2UJ
	 qNrDSCs7h/VN+zXzuEjtggPKuTeM2PQ6DteE08KInwGf+RjtF3segRSZ6WY0Y//ZC4
	 ZlU8a+s7VjMp4jkIy8m/YHGIQjqSQ82G97jIOcbZjgAdazohRhUpm6TLD4ECn0I3So
	 geDpGbDnX1XpQb8EL6RaPbuyQ268cJAAmZkiX6NqoXDDaeKsy6HC342qz4wu+fAaWd
	 1cUiJZw1FxdPuzD185crLA134CuPubrBDbFkh604LZoQOFkuK2pfJ91DFIuuaSPpTZ
	 qxJrckCIUw2gQ==
Date: Thu, 14 Mar 2024 15:59:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, consulting@bugseng.com, 
    sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3 03/16] misra: add deviations for direct inclusion
 guards
In-Reply-To: <3e4bb597-3624-418e-93d0-b95042fd27a7@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403141559270.853156@ubuntu-linux-20-04-desktop>
References: <cover.1710145041.git.simone.ballarin@bugseng.com> <1fdfec12fd2207c294f50d01d8ec32f890b915d7.1710145041.git.simone.ballarin@bugseng.com> <adeb5103-81b4-4f04-9ff6-a0526c8065db@suse.com> <6472eb42-157a-4d6e-b5bb-daa74fbbd97b@bugseng.com>
 <a9f85f2b-3eae-4544-88dd-6984011f0ef9@suse.com> <3e4bb597-3624-418e-93d0-b95042fd27a7@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Mar 2024, Simone Ballarin wrote:
> On 11/03/24 14:56, Jan Beulich wrote:
> > On 11.03.2024 13:00, Simone Ballarin wrote:
> > > On 11/03/24 11:08, Jan Beulich wrote:
> > > > On 11.03.2024 09:59, Simone Ballarin wrote:
> > > > > --- a/xen/arch/arm/include/asm/hypercall.h
> > > > > +++ b/xen/arch/arm/include/asm/hypercall.h
> > > > > @@ -1,3 +1,4 @@
> > > > > +/* SAF-5-safe direct inclusion guard before */
> > > > >    #ifndef __XEN_HYPERCALL_H__
> > > > >    #error "asm/hypercall.h should not be included directly - include
> > > > > xen/hypercall.h instead"
> > > > >    #endif
> > > > > --- a/xen/arch/x86/include/asm/hypercall.h
> > > > > +++ b/xen/arch/x86/include/asm/hypercall.h
> > > > > @@ -2,6 +2,7 @@
> > > > >     * asm-x86/hypercall.h
> > > > >     */
> > > > >    +/* SAF-5-safe direct inclusion guard before */
> > > > >    #ifndef __XEN_HYPERCALL_H__
> > > > >    #error "asm/hypercall.h should not be included directly - include
> > > > > xen/hypercall.h instead"
> > > > >    #endif
> > > > 
> > > > Iirc it was said that this way checking for correct guards is suppressed
> > > > altogether in Eclair, which is not what we want. Can you clarify this,
> > > > please?
> > > > 
> > > 
> > > My first change was moving this check inside the guard.
> > > You commented my patch saying that this would be an error because someone
> > > can
> > > include it directly if it has already been included indirectly.
> > > I replied telling that this was the case also before the change.
> > > You agreed with me, and we decided that the correct thing would be fixing
> > > the
> > > check and not apply my temporary change to address the finding.
> > > 
> > > Considering that the code should be amended, a SAF deviation seems to me
> > > the most appropriate way for suppressing these findings.
> > 
> > Since I don't feel your reply addresses my question, asking differently:
> > With
> > your change in place, will failure to have proper guards (later) in these
> > headers still be reported by Eclair?
> > 
> > Jan
> > 
> 
> No, if you put something between the check and the guard,
> no violation will be reported.

From this email exchange I cannot under if Jan is OK with this patch or
not.

