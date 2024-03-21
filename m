Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 386FF881AC0
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 02:51:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696175.1086870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn7a6-0001ew-1n; Thu, 21 Mar 2024 01:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696175.1086870; Thu, 21 Mar 2024 01:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn7a5-0001cD-V8; Thu, 21 Mar 2024 01:50:57 +0000
Received: by outflank-mailman (input) for mailman id 696175;
 Thu, 21 Mar 2024 01:50:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gBWc=K3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rn7a4-0001c2-3N
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 01:50:56 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 734bf2a4-e725-11ee-afdf-a90da7624cb6;
 Thu, 21 Mar 2024 02:50:54 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 35C2BCE126F;
 Thu, 21 Mar 2024 01:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE1BC433C7;
 Thu, 21 Mar 2024 01:50:50 +0000 (UTC)
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
X-Inumbo-ID: 734bf2a4-e725-11ee-afdf-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710985851;
	bh=zhlHJSAyn7yUNAuJKEyXBF9XeNfl89xSX4Ho/3C2geA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=k870F1WFnZhPysmYBdTSskJmMu/FnfG/i+BtJGOJ5c7PrMYRTc9XIUxm58wDB3mUk
	 abzZ7wnoRf75TY4ovOOnlE8kBGAFPjztz2+GsyJNiAjbYIM7RhJcAk1sSXxc0OT9ip
	 5CuzbSAJqGgemz6RgMMk/4feBXBDgg/VdTEt3Kt1ydijeW8J1+pH2rhYtk4G1vx8J7
	 dQYdUEf2UebkTmSvWXQIAU0m9/nbbS+Ssn4fmAnHcgNJiprsrnoDwtEGw4V0YmG7si
	 Xy6JFzftNOMiviTCGayUXy/lm3SnOd46M0X4cKKRwC9YLKf+Ni0YA5AQTmPAZiCsil
	 58touNceBTLIg==
Date: Wed, 20 Mar 2024 18:50:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 1/2] automation/eclair: add deviation for MISRA C:2012
 Rule 17.1
In-Reply-To: <9341a711-74c3-463f-8cc2-a54e19b4b2f4@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403201848340.1569010@ubuntu-linux-20-04-desktop>
References: <cover.1710923235.git.simone.ballarin@bugseng.com> <882b442c8c1f73f8116676ab9351defe5c9609ac.1710923235.git.simone.ballarin@bugseng.com> <9341a711-74c3-463f-8cc2-a54e19b4b2f4@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Mar 2024, Jan Beulich wrote:
> On 20.03.2024 09:50, Simone Ballarin wrote:
> > MISRA C:2012 Rule 17.1 states:
> > The features of `<stdarg.h>' shall not be used
> > 
> > The Xen community wants to avoid using variadic functions except for
> > specific circumstances where it feels appropriate by strict code review.
> > 
> > Add deviation for functions related to console output (printk and similar).
> > 
> > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> > ---
> >  .../eclair_analysis/ECLAIR/deviations.ecl     | 26 +++++++++++++++++++
> >  docs/misra/deviations.rst                     |  5 ++++
> >  2 files changed, 31 insertions(+)
> > 
> > diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > index 9ac3ee4dfd..7c3559a3a0 100644
> > --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > @@ -382,6 +382,32 @@ explicit comment indicating the fallthrough intention is present."
> >  -config=MC3R1.R16.6,switch_clauses+={deliberate, "default(0)"}
> >  -doc_end
> >  
> > +#
> > +# Series 17.
> > +#
> > +
> > +-doc_begin="Functions related to console output are allowed to use the variadic features provided by stdarg.h."
> > +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(debugtrace_printk)&&kind(function))))"}
> 
> This isn't concole output related.

Should we say "related to console output or tracing" ?


> > +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dt_dprintk)&&kind(function))))"}
> > +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(printk)&&kind(function))))"}
> > +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(guest_printk)&&kind(function))))"}
> > +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
> > +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dprintk)&&kind(function))))"}
> > +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(gdprintk)&&kind(function))))"}
> > +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(snprintf)&&kind(function))))"}
> > +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(scnprintf)&&kind(function))))"}
> > +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(xasprintf)&&kind(function))))"}
> 
> These three and ...
> 
> > +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(mm_printk)&&kind(function))))"}
> > +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dbgp_printk)&&kind(function))))"}
> > +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
> > +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vsnprintf)&&kind(function))))"}
> > +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vscnprintf)&&kind(function))))"}
> > +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(xvasprintf)&&kind(function))))"}
> 
> ... these three aren't either.

Maybe it is better to write it as:

"Functions related printk, logging and tracing are allowed..."


> > +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vprintk_common)&&kind(function))))"}
> > +-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(guest_printk)&&kind(function))))"}
> > +-config=MC3R1.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
> > +-doc_end
> 
> Further, is there a reason xyzprintk() are all listed individually?
> Surely if we'd introduce a new flavor, we'd want that excluded too.
> 
> Finally, {,g}dprintk() in neither of their incarnation use any of the
> va_* items listed. Why do they need mentioning here?


