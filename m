Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D21B97C4408
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 00:28:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615174.956425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqLCu-00033t-JE; Tue, 10 Oct 2023 22:28:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615174.956425; Tue, 10 Oct 2023 22:28:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqLCu-00030p-Fp; Tue, 10 Oct 2023 22:28:04 +0000
Received: by outflank-mailman (input) for mailman id 615174;
 Tue, 10 Oct 2023 22:28:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z25Z=FY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qqLCt-00030g-7H
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 22:28:03 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45e32c60-67bc-11ee-98d3-6d05b1d4d9a1;
 Wed, 11 Oct 2023 00:28:02 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 8D110B81ECB;
 Tue, 10 Oct 2023 22:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C263C433C7;
 Tue, 10 Oct 2023 22:27:59 +0000 (UTC)
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
X-Inumbo-ID: 45e32c60-67bc-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696976880;
	bh=e+HZNmLS0K4X4liZmJjbHTv3fJqFyyy4yzgkfzwMgbc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NavhYgUiuE/hX4gn+rffJ1aVZV0xVzEMjqOwH61IEp7P3z91tubJpEPM0sQWm4le+
	 /uS9jNPiLf6o7/arqvVbi0lGctjoGiTGc5MPoFo7bJtjiof1dznJZBZng/8bybAOI4
	 GzivDGx4mRcCF7UznJbbOISIJJ4MErwomxnZ9c49AB2zXaQ3+qKxlsDlzIdpAqMzGJ
	 WFh89D4fw8XLi3iFAZWcLkTbe1rbdVFWFRAQ6dVXORtithuI/GNS4DxwKZg+giCs6D
	 ARR7hDIej62k13CaH/XZWt08ebJ3g3hAp5RzjGvNF8VAyn5GESHQnMYcNnnc1RoVVb
	 OEU88BCZvUdEQ==
Date: Tue, 10 Oct 2023 15:27:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Henry.Wang@arm.com
Subject: Re: [XEN PATCH][for-4.19 v2 2/2] docs/misra: add deviations.rst to
 document additional deviations.
In-Reply-To: <a5635fc5e51518c205d776ac8a9600ba@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310101524080.3431292@ubuntu-linux-20-04-desktop>
References: <cover.1696865051.git.nicola.vetrini@bugseng.com> <ccda90b6be8f6977cff14ae65749ffc7fa429c3c.1696865051.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2310091811190.3431292@ubuntu-linux-20-04-desktop>
 <a5635fc5e51518c205d776ac8a9600ba@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Oct 2023, Nicola Vetrini wrote:
> On 10/10/2023 03:19, Stefano Stabellini wrote:
> > +Henry
> > 
> > On Mon, 9 Oct 2023, Nicola Vetrini wrote:
> > > This file contains the deviation that are not marked by
> > > a deviation comment, as specified in
> > > docs/misra/documenting-violations.rst.
> > > 
> > > Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
> > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > 
> > This is great! Thank you so much!
> > 
> > I have a few questions below but even as-is it is way better than
> > nothing. I think we should add this for 4.18
> > 
> > 
> > > ---
> > >  docs/index.rst            |   1 +
> > >  docs/misra/deviations.rst | 240 ++++++++++++++++++++++++++++++++++++++
> > >  docs/misra/rules.rst      |   2 +-
> > >  3 files changed, 242 insertions(+), 1 deletion(-)
> > >  create mode 100644 docs/misra/deviations.rst
> > > 
> > > diff --git a/docs/index.rst b/docs/index.rst
> > > index 2c47cfa999f2..f3f779f89ce5 100644
> > > --- a/docs/index.rst
> > > +++ b/docs/index.rst
> > > @@ -63,6 +63,7 @@ Xen hypervisor code.
> > >     :maxdepth: 2
> > > 
> > >     misra/rules
> > > +   misra/deviations
> > > 
> > > 
> > >  Miscellanea
> > > diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> > > new file mode 100644
> > > index 000000000000..19743e34ce03
> > > --- /dev/null
> > > +++ b/docs/misra/deviations.rst
> > > @@ -0,0 +1,240 @@
> > > +.. SPDX-License-Identifier: CC-BY-4.0
> > > +
> > > +MISRA C deviations for Xen
> > > +==========================
> > > +
> > > +The following is the list of MISRA C:2012 deviations for the Xen codebase
> > > that
> > > +are not covered by a `SAF-x-safe` or `SAF-x-false-positive-<tool>`
> > > comment, as
> > > +specified in docs/misra/documenting-violations.rst; the lack of
> > > +such comments is usually due to the excessive clutter they would bring to
> > > the
> > > +codebase or the impossibility to express such a deviation (e.g., if it's
> > > +composed of several conditions).
> > > +
> > > +Deviations related to MISRA C:2012 Directives:
> > > +----------------------------------------------
> > > +
> > > +.. list-table::
> > > +   :header-rows: 1
> > > +
> > > +   * - Directive identifier
> > > +     - Justification
> > > +     - Notes
> > > +
> > > +   * - D4.3
> > > +     - Accepted for the ARM64 codebase
> > > +     - Tagged as `disapplied` for ECLAIR on any other violation report.
> > 
> > This mean it has been applied for ARM64 but not x86, right?
> > 
> > 
> 
> Yes.
> 
> > > +   * - D4.3
> > > +     - The inline asm in 'xen/arch/arm/arm64/lib/bitops.c' is tightly
> > > coupled
> > > +       with the surronding C code that acts as a wrapper, so it has been
> > > decided
> > > +       not to add an additional encapsulation layer.
> > > +     - Tagged as `deliberate` for ECLAIR.
> > > +
> > > +Deviations related to MISRA C:2012 Rules:
> > > +-----------------------------------------
> > > +
> > > +.. list-table::
> > > +   :header-rows: 1
> > > +
> > > +   * - Rule identifier
> > > +     - Justification
> > > +     - Notes
> > > +
> > > +   * - R2.1
> > > +     - The compiler implementation guarantees that the unreachable code
> > > is
> > > +       removed. Constant expressions and unreachable branches of if and
> > > switch
> > > +       statements are expected.
> > > +     - Tagged as `safe` for ECLAIR.
> > > +
> > > +   * - R2.1
> > > +     - Some functions are intended not to be referenced.
> > > +     - Tagged as `deliberate` for ECLAIR.
> > 
> > What does it mean "some functions" in this case? Should we list which
> > functions?
> > 
> 
> Well, there are a lot, typically resulting from build configurations that do
> not
> use them, or because they are used only in asm code. I can mention these
> reasons in the
> document, to make it easier to understand.

Yes, I think we need to clarify further this point, because saying "Some
functions" doesn't help the reader understand:
- whether all functions can be not referenced
- which subset of functions can be not referenced

How to distinguish between? How do we know whether a certain patch is
violating the rule or not?

If there is a clear list of functions that can be not referenced, then
we should list them here. If there is a methodology we can use to
distinguish between them (e.g. functions called from asm only) then we
can write the methodology here. Either way it is fine as long as the
criteria to know if it is OK if a function is not referenced is clear.

