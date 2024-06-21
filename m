Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B83A19130D8
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jun 2024 01:27:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745675.1152825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKnf6-0001ZO-HL; Fri, 21 Jun 2024 23:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745675.1152825; Fri, 21 Jun 2024 23:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKnf6-0001XG-E6; Fri, 21 Jun 2024 23:27:20 +0000
Received: by outflank-mailman (input) for mailman id 745675;
 Fri, 21 Jun 2024 23:27:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B+dc=NX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sKnf4-0001XA-MF
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 23:27:18 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c903ab96-3025-11ef-b4bb-af5377834399;
 Sat, 22 Jun 2024 01:27:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7EC13CE3CD2;
 Fri, 21 Jun 2024 23:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8835FC2BBFC;
 Fri, 21 Jun 2024 23:27:06 +0000 (UTC)
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
X-Inumbo-ID: c903ab96-3025-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719012427;
	bh=itEtUME6C4Zc1DxKquhnptxC25JV3Tn3U3n3KJMVXVQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=u4pJacmhvUGJ7NZAm2TPdPo2qnFEOX/ZQ0FQHxQU/FPAnx2JvCF+3GVa5eqdzpl8+
	 8cPBan5dW8tlHABlyvp4hNKrgem5Xc7JEMRPZNhAmOeJDduucjv768zo9yTJzqJdUx
	 hoVVIdbYVWrVLja/aZfRFUcR3xOC/VeaYJS16Go6VxNbg+BycpZAIAcOwcsQbRGqh3
	 u+XXGoonGDt6fsZjzJvJ77n5wKP7vLFcBiKsrGPczKZERLvQrBSneDACSye8YAa3tl
	 DrjMswAgafOV9Ozf9GJw2Vw5tgjsCYNArlUw/46g8yKBYjsZ4mWIlfxTH5IRjHcZXK
	 2u9r8+OfbRI0w==
Date: Fri, 21 Jun 2024 16:27:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] automation/eclair_analysis: deviate MISRA C Rule
 21.2
In-Reply-To: <650b7946-ddb5-4428-b6d9-d8f6e0b0f8b9@suse.com>
Message-ID: <alpine.DEB.2.22.394.2406211619070.2572888@ubuntu-linux-20-04-desktop>
References: <cover.1718816397.git.alessandro.zucchelli@bugseng.com> <5b8364528a9ece8fec9f0e70bee81c2ea94c1820.1718816397.git.alessandro.zucchelli@bugseng.com> <02ee9a03-c5b9-4250-960d-e9a2762605c8@suse.com> <alpine.DEB.2.22.394.2406201758490.2572888@ubuntu-linux-20-04-desktop>
 <650b7946-ddb5-4428-b6d9-d8f6e0b0f8b9@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Jun 2024, Jan Beulich wrote:
> On 21.06.2024 03:02, Stefano Stabellini wrote:
> > On Thu, 20 Jun 2024, Jan Beulich wrote:
> >> On 19.06.2024 19:09, Alessandro Zucchelli wrote:
> >>> Rule 21.2 reports identifiers reserved for the C and POSIX standard
> >>> libraries: all xen's translation units are compiled with option
> >>> -nostdinc, this guarantees that these libraries are not used, therefore
> >>> a justification is provided for allowing uses of such identifiers in
> >>> the project.
> >>> Builtins starting with "__builtin_" still remain available.
> >>>
> >>> No functional change.
> >>>
> >>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> >>> ---
> >>>  automation/eclair_analysis/ECLAIR/deviations.ecl | 11 +++++++++++
> >>>  1 file changed, 11 insertions(+)
> >>>
> >>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> >>> index 447c1e6661..9fa9a7f01c 100644
> >>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> >>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> >>> @@ -487,6 +487,17 @@ leads to a violation of the Rule are deviated."
> >>>  # Series 21.
> >>>  #
> >>>  
> >>> +-doc_begin="Rules 21.1 and 21.2 report identifiers reserved for the C and POSIX
> >>> +standard libraries: if these libraries are not used there is no reason to avoid such
> >>> +identifiers. All xen's translation units are compiled with option -nostdinc,
> >>> +this guarantees that these libraries are not used. Some compilers could perform
> >>> +optimization using built-in functions: this risk is partially addressed by
> >>> +using the compilation option -fno-builtin. Builtins starting with \"__builtin_\"
> >>> +still remain available."
> >>
> >> While the sub-section "Reserved Identifiers" is part of Section 7,
> >> "Library", close coordination is needed between the library and the
> >> compiler, which only together form an "implementation". Therefore any
> >> use of identifiers beginning with two underscores or beginning with an
> >> underscore and an upper case letter is at risk of colliding not only
> >> with a particular library implementation (which we don't use), but
> >> also of such with a particular compiler implementation (which we cannot
> >> avoid to use). How can we permit use of such potentially problematic
> >> identifiers?
> > 
> > Alternative question: is there a way we can check if there is clash of
> > some sort between a compiler implementation of something and a MACRO or
> > identifier we have in Xen? An error or a warning from the compiler for
> > instance? That could be an easy way to prove we are safe.
> 
> Well. I think it is the default for the compiler to warn when re-#define-
> ing a previously #define-d (by the compiler or by us) symbol, so on that
> side we ought to be safe at any given point in time,

OK, that's good. It seems to me that this explanation should be part of
the deviation text.


> yet we're still latently unsafe (as to compilers introducing new
> pre-defines).

Sure, but we don't need to be safe in relation to future compiler. Right
now, we are targeting gcc-12.1.0 as written in
docs/misra/C-language-toolchain.rst. When we decide to enable a new
compiler in Xen we can fix/change any specific define as needed. Also
note the large amount of things written in C-language-toolchain.rst that
need to be checked and verified for a new compiler to make sure we can
actually use it safely (we make many assumptions).


> For built-in declarations, though, there's nothing I'm aware of that
> would indicate collisions.

For builtins, Alessandro was suggesting -fno-builtin. One question to
Alessandro is why would -fno-builtin only "partially" address the
problem.

Another question for Jan and also Alessandro: given that builtins
starting with __builtin_ remain available, any drawbacks in using
-fno-builtin in a Xen build?



> > Also, can we use the fact that the compiler we use is the same compiler
> > used to compile Linux, and Linux makes extensive use of identifiers and
> > macros starting with underscores as one of the reason for being safe
> > from clashes?
> 
> I think we could, but I don't think we should.

