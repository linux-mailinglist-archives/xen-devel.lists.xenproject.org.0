Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1123980B179
	for <lists+xen-devel@lfdr.de>; Sat,  9 Dec 2023 02:36:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650839.1016664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBmGb-0005vG-I1; Sat, 09 Dec 2023 01:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650839.1016664; Sat, 09 Dec 2023 01:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBmGb-0005sj-F0; Sat, 09 Dec 2023 01:36:29 +0000
Received: by outflank-mailman (input) for mailman id 650839;
 Sat, 09 Dec 2023 01:36:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dmD7=HU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rBmGa-0005sI-7d
 for xen-devel@lists.xenproject.org; Sat, 09 Dec 2023 01:36:28 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c81c3e9-9633-11ee-9b0f-b553b5be7939;
 Sat, 09 Dec 2023 02:36:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3470FCE256C;
 Sat,  9 Dec 2023 01:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D54C433C8;
 Sat,  9 Dec 2023 01:36:20 +0000 (UTC)
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
X-Inumbo-ID: 5c81c3e9-9633-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702085781;
	bh=YVzRqnw4MDk6dSKu7IG2gFfx8d15E6ChvPSpj23V+Bk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EW18qFC9EIbO5REHgxPQF4YkaNlZ3K/HGad4emCDHCYwR4RcRY5BsM2Iyv1mk4Vt6
	 2Q/YmBhAb9Pyo5M2mVijfsdJ3gUicg9iFMZz5p0SHXSKLntOudF5ZUXuamj9ihiAPP
	 Uc+0UCGDpNqHMYzDA4lTCyPzjHflahTnWeGAK07vaYBwLq0Ms+6naOfFLad/WWdkDc
	 GvxHOKFZVLbnMqmlBg9274EroP7Aom5RvH3XYeqjD41SCw00pV6o7I1viV7xTkVFei
	 Ph+HKzw5pq8V8jWIxGsJDgvGWJCMAAjrLxAo4GQrQ7NMMxj2O6vMdqiTWm49CC+w2Q
	 298lPtqsICxbQ==
Date: Fri, 8 Dec 2023 17:36:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, julien@xen.org, bertrand.marquis@arm.com, 
    roger.pau@citrix.com, roberto.bagnara@bugseng.com, 
    federico.serafini@bugseng.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] docs/misra/rules.rst: add more rules
In-Reply-To: <f51e120c-2db9-498c-82bf-66494f862920@suse.com>
Message-ID: <alpine.DEB.2.22.394.2312081735050.1703076@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2312071609060.1265976@ubuntu-linux-20-04-desktop> <f51e120c-2db9-498c-82bf-66494f862920@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Dec 2023, Jan Beulich wrote:
> On 08.12.2023 01:09, Stefano Stabellini wrote:
> > Add the rules accepted in the last three MISRA C working group meetings.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -462,6 +462,13 @@ maintainers if you want to suggest a change.
> >  
> >         while(0) and while(1) and alike are allowed.
> >  
> > +   * - `Rule 16.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_03.c>`_
> > +     - Required
> > +     - An unconditional break statement shall terminate every
> > +       switch-clause
> > +     - In addition to break, also other flow control statements such as
> > +       continue, return, goto are allowed.
> 
> To eliminate any room for doubt, maybe add "unconditional" also again here?

Thanks for the Ack! I am OK with the addition you suggested. I'll let
you do it on commit so that we can be sure it is added in the way you
intended.

