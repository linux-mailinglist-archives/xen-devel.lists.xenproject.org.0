Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D1A8D09DB
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 20:22:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730920.1136214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBez2-0004A0-S7; Mon, 27 May 2024 18:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730920.1136214; Mon, 27 May 2024 18:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBez2-00047m-OJ; Mon, 27 May 2024 18:22:08 +0000
Received: by outflank-mailman (input) for mailman id 730920;
 Mon, 27 May 2024 18:22:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MISB=M6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sBez0-00047g-Ko
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 18:22:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04996966-1c56-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 20:22:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C7A1061B96;
 Mon, 27 May 2024 18:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D0FC2BBFC;
 Mon, 27 May 2024 18:22:01 +0000 (UTC)
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
X-Inumbo-ID: 04996966-1c56-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716834123;
	bh=MfpcuSDLTv7mzqhKIv7ioKH7DL90/sDNckRrjGnI/eY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NitukqZ3qBdcfsJRI/ZNlwnxHHOGEEY7audBq+BwX5WzAP0k6vogL2tYdtelgo+rV
	 W/j/DR0LH4JXz+4KSCDovhNqs3xYEBbfdxuY/CDF2Bq4Gmovsnme10IMD7JyI1q9Aj
	 lAPSGPcVMTNPkGhAXrVqLF+2N0bcgFPwh6rQyn/J+ZC0Q9pKXtFZ1z8IQqhm7v0RGb
	 aXZ9+GmXkbLEaZWVlO+2rgzclshiZ3qsJve7WaZZ+Nu3RfUmVc40WpG6d5ur2akl8M
	 f5uO+mq5540vm32jwlwb0rlezojrWvpW36nDQa23W6RbJoLqxC4Fa/ZvVX8PRqUzrg
	 9k79Ns9K7cncg==
Date: Mon, 27 May 2024 11:22:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>, 
    Michal Orzel <michal.orzel@amd.com>, roberto.bagnara@bugseng.com, 
    consulting@bugseng.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra: add D4.12
In-Reply-To: <alpine.DEB.2.22.394.2405151513530.2544314@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2405271120470.2557291@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405141611170.2544314@ubuntu-linux-20-04-desktop> <bd1072c5-1533-46b7-b6c8-fab1c0f80ab3@suse.com> <alpine.DEB.2.22.394.2405151513530.2544314@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Stefano Stabellini wrote:
> On Wed, 15 May 2024, Jan Beulich wrote:
> > On 15.05.2024 01:15, Stefano Stabellini wrote:
> > > Add D4.12 with the same explanation as the rules of the R21 series.
> > > D4.12 refers to the standard library memory allocation functions and
> > > similar third party libraries with memory allocation functions. It
> > > doesn't refer to the in-tree implementation we have in Xen which is
> > > subject to MISRA C rules and MISRA C scanning.
> > > 
> > > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > > 
> > > diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> > > index 80e5e972ad..bc8506add4 100644
> > > --- a/docs/misra/rules.rst
> > > +++ b/docs/misra/rules.rst
> > > @@ -76,6 +76,11 @@ maintainers if you want to suggest a change.
> > >         considered libraries from MISRA C point of view as they are
> > >         imported in source form)
> > >  
> > > +   * - `Dir 4.12 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_12.c>`_
> > > +     - Required
> > > +     - Dynamic memory allocation shall not be used
> > > +     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
> > 
> > I'm having trouble connecting this remark with the directive. We do have
> > dynamic memory allocation routines, and we use them. It doesn't really
> > matter that they don't come from an external library, does it?
> 
> Similarly to the 21.x rules series, it makes a difference if they are
> external libraries or code within the project. The rule points out that
> the standard library memory allocation functions can lead to undefined
> behavior. On the other hand, our own implementation under xen.git is
> subject to MISRA C scanning and all the other MISRA C rules.
> 
> The example in the link above, shows a use-after-free error that in our
> case it should be caught by other MISRA C rules scanning.

Just to close the loop on this -- I spoke with Roberto about D4.12, and
we decided that it is best to leave out this directive for now.

