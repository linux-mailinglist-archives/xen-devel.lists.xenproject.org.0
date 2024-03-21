Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A55886032
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 19:00:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696571.1087612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnMiB-0005Vz-Uc; Thu, 21 Mar 2024 18:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696571.1087612; Thu, 21 Mar 2024 18:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnMiB-0005TT-Rp; Thu, 21 Mar 2024 18:00:19 +0000
Received: by outflank-mailman (input) for mailman id 696571;
 Thu, 21 Mar 2024 18:00:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gBWc=K3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rnMi9-0005TN-QC
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 18:00:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de69670f-e7ac-11ee-a1ee-f123f15fe8a2;
 Thu, 21 Mar 2024 19:00:15 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5CE6D61217;
 Thu, 21 Mar 2024 18:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4702C433C7;
 Thu, 21 Mar 2024 18:00:11 +0000 (UTC)
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
X-Inumbo-ID: de69670f-e7ac-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711044013;
	bh=bIZxfWqmwJx/0DvvPek3iesJmNfFQbqii/uhtbdnHII=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HHFHvrRl6GDIjzXb8oV0JVZ+Q8RKL/nuFC8XTusudRI+9lT1DCPvYifoKNZUAB3p+
	 wOqSicZHN13NZRWme32NhKSE0EVU6nChqN3lrqrSBHuMIu/9SRQii7HNrdxaq+Ig4B
	 ynEweg354WqwbE+pP0flxOOM53MrULpn7k9nsadgz0auK3ZtX6nYJ019hFHVw7+Bi4
	 ZPjSwXT4KFiUqd9gJ2gmchcFBY86yb1DJxsXXj2a7bvrWrPbZwnB/6uJSvyYzEjLrr
	 MoVa2kB+rORS5U59Dwp8xLvOUcsF0zrF77/M3dsZRUuNNqjKuu0KE+Q4Gwp8BJUsi9
	 nBWCqfuEQmp7Q==
Date: Thu, 21 Mar 2024 11:00:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 1/2] automation/eclair: add deviation for MISRA C:2012
 Rule 17.1
In-Reply-To: <d8b2bf3d-7656-4a60-9888-86755735e825@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403211100030.1569010@ubuntu-linux-20-04-desktop>
References: <cover.1710923235.git.simone.ballarin@bugseng.com> <882b442c8c1f73f8116676ab9351defe5c9609ac.1710923235.git.simone.ballarin@bugseng.com> <9341a711-74c3-463f-8cc2-a54e19b4b2f4@suse.com> <alpine.DEB.2.22.394.2403201848340.1569010@ubuntu-linux-20-04-desktop>
 <d8b2bf3d-7656-4a60-9888-86755735e825@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 Mar 2024, Jan Beulich wrote:
> On 21.03.2024 02:50, Stefano Stabellini wrote:
> > On Wed, 20 Mar 2024, Jan Beulich wrote:
> >> On 20.03.2024 09:50, Simone Ballarin wrote:
> >>> MISRA C:2012 Rule 17.1 states:
> >>> The features of `<stdarg.h>' shall not be used
> >>>
> >>> The Xen community wants to avoid using variadic functions except for
> >>> specific circumstances where it feels appropriate by strict code review.
> >>>
> >>> Add deviation for functions related to console output (printk and similar).
> >>>
> >>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> >>> ---
> >>>  .../eclair_analysis/ECLAIR/deviations.ecl     | 26 +++++++++++++++++++
> >>>  docs/misra/deviations.rst                     |  5 ++++
> >>>  2 files changed, 31 insertions(+)
> >>>
> >>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> >>> index 9ac3ee4dfd..7c3559a3a0 100644
> >>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> >>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> >>> @@ -382,6 +382,32 @@ explicit comment indicating the fallthrough intention is present."
> >>>  -config=MC3R1.R16.6,switch_clauses+={deliberate, "default(0)"}
> >>>  -doc_end
> >>>  
> >>> +#
> >>> +# Series 17.
> >>> +#
> >>> +
> >>> +-doc_begin="Functions related to console output are allowed to use the variadic features provided by stdarg.h."
> >>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(debugtrace_printk)&&kind(function))))"}
> >>
> >> This isn't concole output related.
> > 
> > Should we say "related to console output or tracing" ?
> > 
> > 
> >>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dt_dprintk)&&kind(function))))"}
> >>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(printk)&&kind(function))))"}
> >>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(guest_printk)&&kind(function))))"}
> >>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
> >>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dprintk)&&kind(function))))"}
> >>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(gdprintk)&&kind(function))))"}
> >>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(snprintf)&&kind(function))))"}
> >>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(scnprintf)&&kind(function))))"}
> >>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(xasprintf)&&kind(function))))"}
> >>
> >> These three and ...
> >>
> >>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(mm_printk)&&kind(function))))"}
> >>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dbgp_printk)&&kind(function))))"}
> >>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
> >>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vsnprintf)&&kind(function))))"}
> >>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vscnprintf)&&kind(function))))"}
> >>> +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(xvasprintf)&&kind(function))))"}
> >>
> >> ... these three aren't either.
> > 
> > Maybe it is better to write it as:
> > 
> > "Functions related printk, logging and tracing are allowed..."
> 
> How about simply saying "printf()-like functions"? In what you suggest,
> sprintf() and friends would still not be covered.

I like it

