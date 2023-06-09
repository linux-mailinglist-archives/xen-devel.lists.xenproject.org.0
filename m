Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DF972A18E
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 19:45:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546245.852964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7gAK-000746-Gk; Fri, 09 Jun 2023 17:44:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546245.852964; Fri, 09 Jun 2023 17:44:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7gAK-00071s-E5; Fri, 09 Jun 2023 17:44:48 +0000
Received: by outflank-mailman (input) for mailman id 546245;
 Fri, 09 Jun 2023 17:44:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=464j=B5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q7gAI-00071m-C5
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 17:44:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 518347c0-06ed-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 19:44:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 88D7665382;
 Fri,  9 Jun 2023 17:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0994C433EF;
 Fri,  9 Jun 2023 17:44:41 +0000 (UTC)
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
X-Inumbo-ID: 518347c0-06ed-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686332683;
	bh=VhfYQRK+S/HYzrGp924Xfk/CeSYupNJOtXkxXcO9G5Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LBSatMh6I72V1ym7anafYB8QlIgU8zr9EgTwXcvBKaCP/fzJZBHont2gjkMSoUBGn
	 ymiXR99jXmKDJgnSM6UQgpQB6in4D06gqA8wVeWJkOsACrux+NUQJfK0gaYZRvEQ6e
	 gKd5w7e5W1FJ8QT70Dm0HX+V+3Llhp+bZ6bh+BIINuniiNuTh7ncz8vx9dQrSPqk+3
	 0RBS02W2+eZwgoVlBtSbEy6hv3llAWeD/nC/y/MKFoud6YHd+rDJvX180tGhHJEoHR
	 lFvDB+IJYSEb7m+lfzM8iuVZpbInWDspubByel78i8tJeEDQsXkBNPlfCk79sRJLPr
	 5PHdSvWcULo3A==
Date: Fri, 9 Jun 2023 10:44:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Roberto Bagnara <roberto.bagnara@bugseng.com>, julien@xen.org, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] docs/misra: new rules addition
In-Reply-To: <6a8f2634-8580-e757-c57e-821387642fdc@suse.com>
Message-ID: <alpine.DEB.2.22.394.2306091039190.3803068@ubuntu-linux-20-04-desktop>
References: <20230607013810.3385316-1-sstabellini@kernel.org> <955f134b-75b8-f8a4-2e02-ae6def536ffb@suse.com> <alpine.DEB.2.22.394.2306071430160.3567387@ubuntu-linux-20-04-desktop> <ecf1fa52-5a78-8f56-6a9c-8f6b2d3119b2@bugseng.com>
 <6a8f2634-8580-e757-c57e-821387642fdc@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 Jun 2023, Jan Beulich wrote:
> On 08.06.2023 13:02, Roberto Bagnara wrote:
> > On 07/06/23 23:53, Stefano Stabellini wrote:
> >> On Wed, 7 Jun 2023, Jan Beulich wrote:
> >>>> +   * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_06.c>`_
> >>>> +     - Required
> >>>> +     - A typedef name shall be a unique identifier
> >>>> +     -
> >>>
> >>> Considering that the rule requires uniqueness across the entire code
> >>> base (and hence precludes e.g. two functions having identically named
> >>> local typedefs), I'm a little puzzled this was adopted. I for one
> >>> question that a use like the one mentioned is really at risk of being
> >>> confusing. Instead I think that the need to change at least one of
> >>> the names is at risk of making the code less readable then, even if
> >>> ever so slightly. (All of this said - I don't know if we have any
> >>> violations of this rule.)
> >>
> >> I don't think we have many local typedefs and I think we have only few
> >> violations if I remember right. I'll let Roberto confirm how many. This
> >> rule was considered not a difficult rule (some difficult rules were
> >> found, namely 2.1, 5.5 and 7.4.)
> > 
> > There currently are 30 violations for ARM64:
> > 
> > - some involve a typedef module_name (in the call it was said this should
> >    be renamed module_name_t, which will solve the issue);
> > - most concern repeated typedefs (UINT64 and similar) which are repeated
> >    in xen/arch/arm/include/asm/arm64/efibind.h
> >    and xen/include/acpi/actypes.h
> > - ret_t and phys_addr_t are also redefined in a couple of places.
> > 
> > There are 90 violations for X86_64, for the same reasons, plus
> > 
> > - another set of typedefs for basic types (such as u8);
> > - repeated typedefs for things like guest_l1e_t in the same header file:
> > 
> > xen/arch/x86/include/asm/guest_pt.h:60.39-60.49:
> > for program `xen/.xen-syms.0', the identifier for typedef `guest_l1e_t' is reused
> > xen/arch/x86/include/asm/guest_pt.h:128.22-128.32:
> > for program `xen/.xen-syms.0', the identifier for typedef `guest_l1e_t' is reused
> > 
> > The indicated lines read as follows:
> > 
> > typedef struct { guest_intpte_t l1; } guest_l1e_t;
> > typedef l1_pgentry_t guest_l1e_t;
> 
> So this is an example where I don't think we can sensibly do away with the
> re-use of the same typedef name: We use it so we can build the same source
> files multiple ways, dealing with different paging modes guests may be in.

Maybe we can have a quick discussion on Rule 5.6 during the next
meeting.

In the meantime, I'll resend the patch without Rule 5.6 and additing the
extra types in the notes for 6.1.

