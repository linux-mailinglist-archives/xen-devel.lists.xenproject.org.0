Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED158C6E85
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 00:19:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722627.1126757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Mxg-0003BJ-H4; Wed, 15 May 2024 22:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722627.1126757; Wed, 15 May 2024 22:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Mxg-00039m-Cz; Wed, 15 May 2024 22:19:00 +0000
Received: by outflank-mailman (input) for mailman id 722627;
 Wed, 15 May 2024 22:18:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kF2M=MS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7Mxe-00039d-SJ
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 22:18:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e7bf5d4-1309-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 00:18:56 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 504D660AAD;
 Wed, 15 May 2024 22:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B5CC116B1;
 Wed, 15 May 2024 22:18:53 +0000 (UTC)
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
X-Inumbo-ID: 1e7bf5d4-1309-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715811535;
	bh=hWPGgn2veiW2Ir9WKsDAPLO5QYf+tJ46ZxyS1oYFi/s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fLE2wcivHd34N8/JCEQHwnXrRDLKVrnBQEhD79p+w8c5V05OAKDzxqjnDKJjYUEvw
	 hUpuIPZ2YTknBqDZkIFbUKL1UtvKv+tHWzsxv7ANt8ntXhGaFU59lKq/YlWeqvouEE
	 9VH0vKPxGsZSydsRE9SP0Pc1eJm7Fd/wJaHK0g8cpSzI14iGxCiTYnAWPN67i1kAFq
	 f1o0Ssvq/KgDksR3Nl2cW0SpatLWhU2IoOp+x12S4s/AaJ0CyLgdPHepFPImIVsj8a
	 pXJw4fYXSW3t/oRpwJtoQsULLiJ7D1qRKB8+4eJ4v98U4GPLUBzmiJwRvh/93L+504
	 GbJqnYPflZfHw==
Date: Wed, 15 May 2024 15:18:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>, 
    Michal Orzel <michal.orzel@amd.com>, roberto.bagnara@bugseng.com, 
    consulting@bugseng.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra: add D4.12
In-Reply-To: <bd1072c5-1533-46b7-b6c8-fab1c0f80ab3@suse.com>
Message-ID: <alpine.DEB.2.22.394.2405151513530.2544314@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405141611170.2544314@ubuntu-linux-20-04-desktop> <bd1072c5-1533-46b7-b6c8-fab1c0f80ab3@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Jan Beulich wrote:
> On 15.05.2024 01:15, Stefano Stabellini wrote:
> > Add D4.12 with the same explanation as the rules of the R21 series.
> > D4.12 refers to the standard library memory allocation functions and
> > similar third party libraries with memory allocation functions. It
> > doesn't refer to the in-tree implementation we have in Xen which is
> > subject to MISRA C rules and MISRA C scanning.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> > index 80e5e972ad..bc8506add4 100644
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -76,6 +76,11 @@ maintainers if you want to suggest a change.
> >         considered libraries from MISRA C point of view as they are
> >         imported in source form)
> >  
> > +   * - `Dir 4.12 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_12.c>`_
> > +     - Required
> > +     - Dynamic memory allocation shall not be used
> > +     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_
> 
> I'm having trouble connecting this remark with the directive. We do have
> dynamic memory allocation routines, and we use them. It doesn't really
> matter that they don't come from an external library, does it?

Similarly to the 21.x rules series, it makes a difference if they are
external libraries or code within the project. The rule points out that
the standard library memory allocation functions can lead to undefined
behavior. On the other hand, our own implementation under xen.git is
subject to MISRA C scanning and all the other MISRA C rules.

The example in the link above, shows a use-after-free error that in our
case it should be caught by other MISRA C rules scanning.

