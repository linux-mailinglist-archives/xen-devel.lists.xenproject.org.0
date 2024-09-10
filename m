Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5AE9728AF
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 06:58:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794996.1204058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snsx6-0004X7-KQ; Tue, 10 Sep 2024 04:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794996.1204058; Tue, 10 Sep 2024 04:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snsx6-0004Uy-HL; Tue, 10 Sep 2024 04:58:08 +0000
Received: by outflank-mailman (input) for mailman id 794996;
 Tue, 10 Sep 2024 04:58:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DP99=QI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1snsx5-0004Us-9R
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 04:58:07 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41b3ed9a-6f31-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 06:58:02 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C7C73A440C5;
 Tue, 10 Sep 2024 04:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDDB7C4CEC3;
 Tue, 10 Sep 2024 04:57:59 +0000 (UTC)
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
X-Inumbo-ID: 41b3ed9a-6f31-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725944280;
	bh=SkHIUwZ//PZST9JBMDnznPLbEJk3hkyT6v2LWlGtTsk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Oj633EqO1VRhzsmCDirDycnBopNnMmBk7nbx5vxF/qYBADUrGtjfpCLYX8QR3z18S
	 904GVvbiokxSsOo3WROkiFJEwPB5lcELA0ZfYyO1L8TbY7ciq2XJ3LIaU3+XNx+Bq8
	 Rsz34iaBzETBkb40yU+p6RcQb+tvTT3nL1HhZ/aCv7MtgsK92duMU00rxulzKHiNwx
	 BCKAexdZ/QArx6r5Q2q/ECDmo3g7dAuB1xmAJ3tMTmVDn33GHBiQKDAcxIYWmskkKz
	 WCFc4Su2uOdVR7Wl53LPTk30Z2o4728+CHsIGnzawB0Ys+FGpu/GflskcvBlk284S+
	 UbeNYtwjRT2iQ==
Date: Mon, 9 Sep 2024 21:57:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v6] CODING_STYLE: Add a section on header guards
 naming conventions
In-Reply-To: <7357f6e8-2630-4027-b339-eedab9ae48c5@suse.com>
Message-ID: <alpine.DEB.2.22.394.2409092149210.3672@ubuntu-linux-20-04-desktop>
References: <a68267c7465a9b0d2ed8f844a5e0145de50b0f3a.1725550985.git.alessandro.zucchelli@bugseng.com> <7357f6e8-2630-4027-b339-eedab9ae48c5@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Sep 2024, Jan Beulich wrote:
> On 05.09.2024 17:48, Alessandro Zucchelli wrote:
> > This section explains which format should be followed by header
> > inclusion guards via a drop-down list of rules.
> > 
> > No functional change.
> > 
> > Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> > 
> > ---
> > Changes in v6:
> > - edit inclusion guards naming conventions, including more details
> 
> Yet I'm afraid that from my pov we're still not there. Specifically ...
> 
> > --- a/CODING_STYLE
> > +++ b/CODING_STYLE
> > @@ -159,6 +159,34 @@ Emacs local variables
> >  A comment block containing local variables for emacs is permitted at
> >  the end of files.  It should be:
> >  
> > +Header inclusion guards
> > +-----------------------
> > +
> > +Unless otherwise specified, all header files should include proper
> > +guards to prevent multiple inclusions. The following naming conventions
> > +apply:
> 
> ... reading this, I can't derive ...
> 
> > +- Private headers: <dir>__<filename>_H
> > +    - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
> > +    - arch/arm/arm32/lib/something.h -> ARM__ARM32__LIB__SOMETHING_H
> > +    - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H
> 
> ... the absence of an equivalent of the arch/ part of the path. As per
> my recollection we agreed on that shortening, but it needs spelling out
> in the textual description. Such that it is possible to derived what to
> uses as a name for, say, a header under common/, crypto/, or drivers/
> (or anywhere else of course). Specifically with the further examples ...

Are you asking for something like this?

Omit the word "arch" from the filepath.

If you prefer an alternative wording please suggest the text. 


> > +- asm-generic headers: ASM_GENERIC__<filename>_H
> > +    - include/asm-generic/something.h -> ASM_GENERIC__SOMETHING_H
> > +
> > +- arch-specific headers: ASM__<architecture>__<subdir>__<filename>_H
> > +    - arch/x86/include/asm/something.h -> ASM__X86__SOMETHING_H
> 
> ... here and ...

Suggested text:

Omit the words "arch" and "include/asm" from the filepath, ASM is also
prefixed.


> > +- Xen headers: XEN__<filename>_H
> > +    - include/xen/something.h -> XEN__SOMETHING_H
> 
> ... here, where more than just one path component is omitted, deriving
> what's meant can end up ambiguous. Yet ambiguity is what we absolutely
> want to avoid, to preempt later discussions on any such naming.

Suggested text:

Omit the words "include/xen" from the filepath, XEN is always prefixed.

Please suggest a specific alternative if you prefer

