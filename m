Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 231F080426C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 00:14:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647340.1010363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAI8H-0005rr-Bw; Mon, 04 Dec 2023 23:13:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647340.1010363; Mon, 04 Dec 2023 23:13:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAI8H-0005qD-9I; Mon, 04 Dec 2023 23:13:45 +0000
Received: by outflank-mailman (input) for mailman id 647340;
 Mon, 04 Dec 2023 23:13:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8A84=HP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rAI8G-0005q7-23
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 23:13:44 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2d5addb-92fa-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 00:13:42 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 38453CE134C;
 Mon,  4 Dec 2023 23:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7710C433C7;
 Mon,  4 Dec 2023 23:13:37 +0000 (UTC)
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
X-Inumbo-ID: c2d5addb-92fa-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701731618;
	bh=e9k4q9sgvXCMMMEiOW/0/Ti2oAfmVqbtFy6V+ERJT58=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YGZuWCOumN4jf7pS26x/W9u1L4O5kX8Su78C1YXu1x2NvA+pNK+EguvwpSkLCFqIG
	 wWjfFYYWLzkeG0rPyQ5TTMPhpAZEwSS2Q0kEQV8oYKkBMIlyEZgp/zk8fCeP13csB1
	 zAtAw2HGSwnrIEHo6svA7+CVU4FMr0+lgh9s070WHmLithZ6vvexIudEdTxWDjjPYh
	 F3m4EI8iLq92S+w0B3oKoyAZy3NW2IJz6k6iFpS58jkw/YO/yAthB87aD1cFivMJos
	 hTOvzifSVUt8+e6qncM3wZLswFAnY/t5e9hXCA0csg3Ygnp9N+v0oKNsqZH2qq+ug3
	 D4bvjzFyqPxUg==
Date: Mon, 4 Dec 2023 15:13:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v2 1/3] automation/eclair: tag function calls to
 address violations of MISRA C:2012 Rule 13.1
In-Reply-To: <5683be1b-5eb9-44a7-89a7-70a71991f2f8@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312041513210.110490@ubuntu-linux-20-04-desktop>
References: <cover.1700844359.git.simone.ballarin@bugseng.com> <fc3e04e5d0432b280110414136f0587a1433d9b0.1700844359.git.simone.ballarin@bugseng.com> <alpine.DEB.2.22.394.2312011917030.110490@ubuntu-linux-20-04-desktop>
 <5683be1b-5eb9-44a7-89a7-70a71991f2f8@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 Dec 2023, Simone Ballarin wrote:
> On 02/12/23 04:19, Stefano Stabellini wrote:
> > On Fri, 24 Nov 2023, Simone Ballarin wrote:
> > > Rule 13.1: Initializer lists shall not contain persistent side effects
> > > 
> > > Invocations of functions in initializer lists cause violations of rule
> > > 13.1 if the called functions are not tagged with __attribute_pure__ or
> > > __attribute_const__ as they can produce persistent side effects.
> > > 
> > > Handling these violations with  attributes is not always possible: the
> > > pure and const attributes may cause unwanted and potentially dangerous
> > > optimisations.
> > > 
> > > To avoid this problem ECLAIR allows using the same attributes in the
> > > -call_properties setting. Additionally, it adds the noeffect attribute
> > > with the following definition:
> > > "like pure but can also read volatile variable not triggering side
> > > effects"
> > > 
> > > These patch tags some functions used in initializer lists to address
> > > violations of Rule 13.1.
> > > 
> > > No functional changes.
> > > 
> > > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> > 
> > Ideally we should also list them somewhere in a document, maybe
> > docs/misra/deviations.rst? Or a new doc? It would be best if this info
> > wouldn't only exist in call_properties.ecl.
> 
> They are not actually deviations, but information that can help
> document the code: I suggest creating a new document.
> 
> Then, ECLAIR or any other tool will be able to retrieve these properties
> directly from this new file.
> 
> If you agree I will do it in a separate patch.

Yes a separate patch is fine. Please don't forget :-)

