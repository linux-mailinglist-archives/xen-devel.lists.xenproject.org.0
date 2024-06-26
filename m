Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2FF917565
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 03:01:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748194.1155781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMH11-00030T-Qe; Wed, 26 Jun 2024 01:00:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748194.1155781; Wed, 26 Jun 2024 01:00:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMH11-0002vN-Na; Wed, 26 Jun 2024 01:00:03 +0000
Received: by outflank-mailman (input) for mailman id 748194;
 Wed, 26 Jun 2024 01:00:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dBdT=N4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMH10-00026G-D7
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 01:00:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 695a748a-3357-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 03:00:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B568F60AC6;
 Wed, 26 Jun 2024 00:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47725C32781;
 Wed, 26 Jun 2024 00:59:57 +0000 (UTC)
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
X-Inumbo-ID: 695a748a-3357-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719363598;
	bh=N7/kGkqol1ywjifRFNz7zVHwLE979d0dgMOoiGCd9k4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mVmkdIjrMLDx11B/MauaRZoYijPQ8yQM+CVhKgNxEU5F9eJyq33/CW03wOBh2lEkC
	 wdrYT0Z9BsNjOk8nKgmSjDj6Lxelo01n6ymGCKLx33EkB0pPfnlDlYAz4KKQ2+cRBt
	 +AI25dXJNH6ueyhCMTz+P0+N+tjf0aGgZ95RsSWcHKhm7nID4CqIPGDa8H6eS8H3MC
	 Mlnx+GI6UvPrKOuHDEaJYTZdzrGaBfDXFDpOcTAyU9cTb/kvLDoIxrPGIZRmIMpqSL
	 0SLUqOMVzWO6oKA84pOFCzWfXKFkQ7Evo5niD8lNwtkaV4xN3NiPSiAdYeVs9KW85f
	 c6nvcB6YX6XQw==
Date: Tue, 25 Jun 2024 17:59:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v2 1/6][RESEND] automation/eclair: address violations
 of MISRA C Rule 20.7
In-Reply-To: <4aa05e0f26f050363d9ed0401855e1bb@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406251756010.3635@ubuntu-linux-20-04-desktop>
References: <cover.1718378539.git.nicola.vetrini@bugseng.com> <af4b0512eb52be99e37c9c670f98967ca15c68ac.1718378539.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2406201718140.2572888@ubuntu-linux-20-04-desktop>
 <4aa05e0f26f050363d9ed0401855e1bb@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Jun 2024, Nicola Vetrini wrote:
> On 2024-06-21 02:18, Stefano Stabellini wrote:
> > On Mon, 16 Jun 2024, Nicola Vetrini wrote:
> > > MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> > > of macro parameters shall be enclosed in parentheses".
> > > 
> > > The helper macro bitmap_switch has parameters that cannot be parenthesized
> > > in order to comply with the rule, as that would break its functionality.
> > > Moreover, the risk of misuse due developer confusion is deemed not
> > > substantial enough to warrant a more involved refactor, thus the macro
> > > is deviated for this rule.
> > > 
> > > No functional change.
> > > 
> > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > 
> > If possible, I would prefer we used a SAF in-code comment deviation. If
> > that doesn't work for any reason this patch is fine and I'd ack it.
> > 
> 
> Would that be an improvement for safety in your opinion?

Not for safety, as they both achieve the same result, but for
maintainability. The deviations under deviations.ecl are project-wide so
in my opinion should only be used for project-wide global deviations
from a rule. Specific deviations for functions should be done with SAF.
Another reason for this is that deviations under deviations.ecl need to
be manually ported to any other static analyzer one by one while SAF is
meant to support multiple automatically.

More importantly if we change deviations.ecl, deviations.rst should also
be changed the same way. I would say that this is required at a minimum
as deviations.ecl and deviations.rst should be in sync.

 
> > > ---
> > >  automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > index 447c1e6661d1..c2698e7074aa 100644
> > > --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > > @@ -463,6 +463,14 @@ of this macro do not lead to developer confusion, and
> > > can thus be deviated."
> > >  -config=MC3R1.R20.7,reports+={safe,
> > > "any_area(any_loc(any_exp(macro(^count_args_$))))"}
> > >  -doc_end
> > > 
> > > +-doc_begin="The arguments of macro bitmap_switch macro can't be
> > > parenthesized as
> > > +the rule would require, without breaking the functionality of the macro.
> > > This is
> > > +a specialized local helper macro only used within the bitmap.h header, so
> > > it is
> > > +less likely to lead to developer confusion and it is deemed better to
> > > deviate it."
> > > +-file_tag+={xen_bitmap_h, "^xen/include/xen/bitmap\\.h$"}
> > > +-config=MC3R1.R20.7,reports+={safe,
> > > "any_area(any_loc(any_exp(macro(loc(file(xen_bitmap_h))&&^bitmap_switch$))))"}
> > > +-doc_end
> > > +
> > >  -doc_begin="Uses of variadic macros that have one of their arguments
> > > defined as
> > >  a macro and used within the body for both ordinary parameter expansion
> > > and as an
> > >  operand to the # or ## operators have a behavior that is well-understood
> > > and
> > > --
> > > 2.34.1
> > > 
> 
> -- 
> Nicola Vetrini, BSc
> Software Engineer, BUGSENG srl (https://bugseng.com)
> 

