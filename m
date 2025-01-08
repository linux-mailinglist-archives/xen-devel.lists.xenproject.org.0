Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1497EA04E02
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 01:05:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866825.1278187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVJZ8-0000d1-B5; Wed, 08 Jan 2025 00:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866825.1278187; Wed, 08 Jan 2025 00:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVJZ8-0000bA-7h; Wed, 08 Jan 2025 00:04:54 +0000
Received: by outflank-mailman (input) for mailman id 866825;
 Wed, 08 Jan 2025 00:04:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/V3S=UA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tVJZ5-0000b3-Vd
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 00:04:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d94d328-cd54-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 01:04:50 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F37DD5C0085;
 Wed,  8 Jan 2025 00:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C206C4CED6;
 Wed,  8 Jan 2025 00:04:47 +0000 (UTC)
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
X-Inumbo-ID: 2d94d328-cd54-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736294688;
	bh=mtTnv6Dt7hKi8/zexx4oWhOSoNmr3c7SzpMKMflQt6o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Mb8xgWeeIZhG8KexYoAE12zJNYrw5SBI7rufHe/GmIg9cPlq9XkEBaPmJBRMxObzq
	 dlwuXqawfqC1jQqwnw6vkaphrCK9ndoMHToRHeGHXHbrg2icQ/32dcLu9OKiPJDgyi
	 GUz1QTtnhj3bLdkQFVGAqSduMN7gb68nKCYUf+YId5PHsuG4r05+B2zXXAY3M++Rj+
	 cAp9WGVj120NFqDekSgoP04zwY8RJpssKRioYv4aeHEqY11P2lGdnwGF6xMWUUYCVJ
	 u674MdfcEtpTaaMY7w7JUenj7qWc3zein66jWrvs26LsQmwUoGVnjELvG3rw1XEni1
	 sa9BDhVLlKFVA==
Date: Tue, 7 Jan 2025 16:04:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] misra: add deviation for MISRA C Rule R11.8.
In-Reply-To: <921ef7b8-36d2-405d-ad7e-1a9418b7c4e6@suse.com>
Message-ID: <alpine.DEB.2.22.394.2501071603130.133435@ubuntu-linux-20-04-desktop>
References: <4a2c68bdc11a815cb8531be305e2e7fc4bef7779.1736240655.git.alessandro.zucchelli@bugseng.com> <921ef7b8-36d2-405d-ad7e-1a9418b7c4e6@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Jan 2025, Jan Beulich wrote:
> On 07.01.2025 10:10, Alessandro Zucchelli wrote:
> > --- a/docs/misra/deviations.rst
> > +++ b/docs/misra/deviations.rst
> > @@ -353,6 +353,13 @@ Deviations related to MISRA C:2012 Rules:
> >         Fixing this violation would require to increase code complexity and lower readability.
> >       - Tagged as `safe` for ECLAIR.
> >  
> > +   * - R11.8
> > +     - Violations caused by function __hvm_copy occour when a const void attribute is passed,
> > +       as the const qualifier is stripped. However, in such cases, the function ensures
> > +       that it does not modify the attribute, therefore, this use is deemed safe.
> > +       Fixing this violation would require to increase code complexity and lower readability.
> > +     - Tagged as `safe` for ECLAIR.
> 
> Do you really mean "attribute" in both places the word is used? In the
> first case talk appears to be of a function argument / parameter, while
> in the second case it looks to be the buffer referenced be the
> argument / parameter which is meant.

Yes I can see what Jan is saying. What about:

Violations caused by function __hvm_copy occur when a const void
argument is passed, as the const qualifier is stripped. However, in such
cases, the function ensures that it does not modify the buffer
referenced by the argument, therefore, this use is deemed safe. Fixing
this violation would require to increase code complexity and lower
readability.


