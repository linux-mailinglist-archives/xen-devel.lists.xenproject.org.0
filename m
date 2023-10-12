Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0407C7A44
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 01:15:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616173.957976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr4tD-0000Fm-G3; Thu, 12 Oct 2023 23:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616173.957976; Thu, 12 Oct 2023 23:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr4tD-0000DS-D4; Thu, 12 Oct 2023 23:14:47 +0000
Received: by outflank-mailman (input) for mailman id 616173;
 Thu, 12 Oct 2023 23:14:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/p7=F2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qr4tB-0000Bx-KN
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 23:14:45 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fa309b0-6955-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 01:14:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 4F85EB82560;
 Thu, 12 Oct 2023 23:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85217C433C9;
 Thu, 12 Oct 2023 23:14:38 +0000 (UTC)
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
X-Inumbo-ID: 1fa309b0-6955-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697152480;
	bh=QC3Gt7nl/sVsGchbpGMuErTOpN1xmZvj4/dG75fJ2lk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YZbf2lPuMNxrxZIqVEiuLoWVekkCvEZlVp4Y4Eg2U+Kf1jYnp/x28meZtSG8Zj8Hq
	 YIDv+GD5xWOEiHxx/3iaCv4pCexvvsjJkDflxWzHM2YZXfSNvqg4dhc+M4qsqxvXZb
	 bQYRryV9jqxVlGEOkMv5DFtG9qq8kdad7QW1rtZUs3FWRw9y1gQPwqT8uFRzVla1tU
	 5Qbzbv4qCNlHdzzpuEwehxS9CzvekcZHa3i7WMM9gzZSWx4G9Bl9b3DQamxkclvlpZ
	 2ELC7NIK8qPBoqmR/W0NMnrvKrVFVnWp9czWEFoDGcxIKpcAegq80gvIVZIlS8QFdz
	 Hlj2g9LvIk4qA==
Date: Thu, 12 Oct 2023 16:14:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>, 
    Wei Liu <wl@xen.org>, Henry.Wang@arm.com
Subject: Re: [XEN PATCH][for-4.19 v2 2/2] docs/misra: add deviations.rst to
 document additional deviations.
In-Reply-To: <9fc7241a16ca8b1db9bf788d4125fe16@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310121606110.3431292@ubuntu-linux-20-04-desktop>
References: <cover.1696865051.git.nicola.vetrini@bugseng.com> <ccda90b6be8f6977cff14ae65749ffc7fa429c3c.1696865051.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2310091811190.3431292@ubuntu-linux-20-04-desktop> <a5635fc5e51518c205d776ac8a9600ba@bugseng.com>
 <alpine.DEB.2.22.394.2310101524080.3431292@ubuntu-linux-20-04-desktop> <781c9b5c-1301-4a23-8c13-fba62c844b03@xen.org> <186af6b6c1b34fc9088a5fb226ff2482@bugseng.com> <9fc7241a16ca8b1db9bf788d4125fe16@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Oct 2023, Nicola Vetrini wrote:
> On 11/10/2023 17:00, Nicola Vetrini wrote:
> > > > > > > +
> > > > > > > +   * - R2.1
> > > > > > > +     - The compiler implementation guarantees that the
> > > > > > > unreachable code
> > > > > > > is
> > > > > > > +       removed. Constant expressions and unreachable branches of
> > > > > > > if and
> > > > > > > switch
> > > > > > > +       statements are expected.
> > > > > > > +     - Tagged as `safe` for ECLAIR.
> > > > > > > +
> > > > > > > +   * - R2.1
> > > > > > > +     - Some functions are intended not to be referenced.
> > > > > > > +     - Tagged as `deliberate` for ECLAIR.
> > > > > > 
> > > > > > What does it mean "some functions" in this case? Should we list
> > > > > > which
> > > > > > functions?
> > > > > > 
> > > > > 
> > > > > Well, there are a lot, typically resulting from build configurations
> > > > > that do
> > > > > not
> > > > > use them, or because they are used only in asm code. I can mention
> > > > > these
> > > > > reasons in the
> > > > > document, to make it easier to understand.
> > > > 
> > > > Yes, I think we need to clarify further this point, because saying "Some
> > > > functions" doesn't help the reader understand:
> > > > - whether all functions can be not referenced
> > > > - which subset of functions can be not referenced
> > > > 
> > > > How to distinguish between? How do we know whether a certain patch is
> > > > violating the rule or not?
> > > > 
> > > > If there is a clear list of functions that can be not referenced, then
> > > > we should list them here. If there is a methodology we can use to
> > > > distinguish between them (e.g. functions called from asm only) then we
> > > > can write the methodology here. Either way it is fine as long as the
> > > > criteria to know if it is OK if a function is not referenced is clear.
> > > 
> > > Aren't they more or less the one we tagged with SAF-1-safe because
> > > there were no prototype? If so, we could use the same tags.
> > > 
> > > We could introduce an extra tags for the others. An alternative would
> > > be to add an attribute (e.g. asmcall) to mark each function used by
> > > assembly.
> > > 
> > > Cheers,
> > 
> > Both suggestion do have some value. As it is, it's not distinguishable
> > what causes a
> > function to be unreferenced in a certain analysis config. However:
> > 
> > - functions only used by asm code can be specified in the ECLAIR
> > config so that they will
> >   have an extra fake reference as far as the checker is concerned. I
> > can do that on a
> >   separate patch and list them in deviations.rst. An attribute seems a
> > good way to signal the
> >   intention.
> > - Functions that have no reference only in the current analysis should
> > have their declaration
> >   #ifdef-ed out in the configurations where they are not used, in an
> > ideal world.
> > - Truly unreferenced functions should be removed, or justified
> 
> Especially the last two appear somewhat tricky to disentangle, as they do
> require knowledge of
> possible code paths.

First let me premise that if we are unsure on how to proceed on this you
can resend this patch series without this item ("Some functions are
intended not to be referenced"), so at least the rest can go in now.

On this specific point, I think we should only make clear and
unmistakable statements. For instance, I think it is OK to say that all
the functions only used by asm code are exceptions (ideally they would
have a asmcall tag as Julien suggested) because that is deterministic.

Functions that have no references in a specific kconfig configuration
should have their definition #ifdef'ed (not necessarily the
declaration, I think we have already clarified that it is OK to have a
declaration without definition.) 

Truly unreferenced functions should be removed.

In conclusion, I think we should only have "functions only called from
asm code" as a deviation here.

