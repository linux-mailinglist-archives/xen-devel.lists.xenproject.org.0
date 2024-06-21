Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4D59117D4
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 03:03:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744967.1152091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKSg7-0003H9-PY; Fri, 21 Jun 2024 01:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744967.1152091; Fri, 21 Jun 2024 01:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKSg7-0003Ei-Mp; Fri, 21 Jun 2024 01:02:59 +0000
Received: by outflank-mailman (input) for mailman id 744967;
 Fri, 21 Jun 2024 01:02:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B+dc=NX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sKSg6-0003Ec-Ra
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 01:02:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fec733fc-2f69-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 03:02:57 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AD1B062234;
 Fri, 21 Jun 2024 01:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7056CC4AF07;
 Fri, 21 Jun 2024 01:02:54 +0000 (UTC)
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
X-Inumbo-ID: fec733fc-2f69-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718931775;
	bh=DfcSr8Bx1doQEh/9BMVK86RhBRiiqnKnr9/JhJ1hEPA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tKlKPKAQE6H9ZATLfTLddhcux/6stgGRerXMc70U4TICqoEbswbXiwTBAIiPlWSoy
	 E0L01qIBquEAAZ6PgeyRb429YRkQvUDdJIc7cseKwc+5HpJNXsce9g2y09zDvGGoWU
	 JzVJXE5TBXbCiGaxBNxCeQ/Ye4uep5Ltm1deeNtV7VyViiOus2f83pE0xALiaZVq/J
	 ayu5Hqwgod9UGRt5ZN46x0jSNuy0OfZ3fhxmnAT/HXxuJZlRuDBIkEJ4kkpz250yOc
	 KMYdsHHLnnydv9oj5mVSX8NsFFxSV7QwkrP8VJfxqV0v6uqaIGUq4eiboREi0gXtbX
	 wTR8UM4rpib4w==
Date: Thu, 20 Jun 2024 18:02:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] automation/eclair_analysis: deviate MISRA C Rule
 21.2
In-Reply-To: <02ee9a03-c5b9-4250-960d-e9a2762605c8@suse.com>
Message-ID: <alpine.DEB.2.22.394.2406201758490.2572888@ubuntu-linux-20-04-desktop>
References: <cover.1718816397.git.alessandro.zucchelli@bugseng.com> <5b8364528a9ece8fec9f0e70bee81c2ea94c1820.1718816397.git.alessandro.zucchelli@bugseng.com> <02ee9a03-c5b9-4250-960d-e9a2762605c8@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Jun 2024, Jan Beulich wrote:
> On 19.06.2024 19:09, Alessandro Zucchelli wrote:
> > Rule 21.2 reports identifiers reserved for the C and POSIX standard
> > libraries: all xen's translation units are compiled with option
> > -nostdinc, this guarantees that these libraries are not used, therefore
> > a justification is provided for allowing uses of such identifiers in
> > the project.
> > Builtins starting with "__builtin_" still remain available.
> > 
> > No functional change.
> > 
> > Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> > ---
> >  automation/eclair_analysis/ECLAIR/deviations.ecl | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > index 447c1e6661..9fa9a7f01c 100644
> > --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > @@ -487,6 +487,17 @@ leads to a violation of the Rule are deviated."
> >  # Series 21.
> >  #
> >  
> > +-doc_begin="Rules 21.1 and 21.2 report identifiers reserved for the C and POSIX
> > +standard libraries: if these libraries are not used there is no reason to avoid such
> > +identifiers. All xen's translation units are compiled with option -nostdinc,
> > +this guarantees that these libraries are not used. Some compilers could perform
> > +optimization using built-in functions: this risk is partially addressed by
> > +using the compilation option -fno-builtin. Builtins starting with \"__builtin_\"
> > +still remain available."
> 
> While the sub-section "Reserved Identifiers" is part of Section 7,
> "Library", close coordination is needed between the library and the
> compiler, which only together form an "implementation". Therefore any
> use of identifiers beginning with two underscores or beginning with an
> underscore and an upper case letter is at risk of colliding not only
> with a particular library implementation (which we don't use), but
> also of such with a particular compiler implementation (which we cannot
> avoid to use). How can we permit use of such potentially problematic
> identifiers?

Alternative question: is there a way we can check if there is clash of
some sort between a compiler implementation of something and a MACRO or
identifier we have in Xen? An error or a warning from the compiler for
instance? That could be an easy way to prove we are safe.

Also, can we use the fact that the compiler we use is the same compiler
used to compile Linux, and Linux makes extensive use of identifiers and
macros starting with underscores as one of the reason for being safe
from clashes?

