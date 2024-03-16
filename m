Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3A987D788
	for <lists+xen-devel@lfdr.de>; Sat, 16 Mar 2024 01:14:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694105.1082986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlHgg-0006O4-0Q; Sat, 16 Mar 2024 00:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694105.1082986; Sat, 16 Mar 2024 00:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlHgf-0006MW-Tw; Sat, 16 Mar 2024 00:14:09 +0000
Received: by outflank-mailman (input) for mailman id 694105;
 Sat, 16 Mar 2024 00:14:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e312=KW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rlHge-0006MQ-W1
 for xen-devel@lists.xenproject.org; Sat, 16 Mar 2024 00:14:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a13e222-e32a-11ee-a1ee-f123f15fe8a2;
 Sat, 16 Mar 2024 01:14:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A77E16170B;
 Sat, 16 Mar 2024 00:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F36C433F1;
 Sat, 16 Mar 2024 00:14:04 +0000 (UTC)
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
X-Inumbo-ID: 1a13e222-e32a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710548045;
	bh=yrdKAsf52DSZ4/YYYyVVe9Ax/figrEAAglOhwZwdctU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=im7GdM9FDqmNw9/6qVCg5gX6aZr+G3hcNRvGtyjr8KXCrKudF2euijHe+qLqquw05
	 ISLJbHEFBfrhjuYwn+THC5DnGYsi55PuKmK3Jwe5+X+XLtzWujeRKTnSxEqSEIx/iL
	 YTL5OOTg2NGcufoHqvpf9pWdL5R+QdKo8tCf1C8ccSVBVOk7fuUeduLy5+wrWW/+r4
	 gUM6jaqwZghOf4/OxWqMisYGbfIoX2RQ7Kf/U8Wg4ArBDEaTS2T1SjC3iXDP/FL3f1
	 sdDuX1UYbpZZy6J1/E6OpZhUpXY7HceEsFtBy56OD9UNYiJKPwQQYzlL7zqV2qdxoA
	 PEEm3XZBqwv7g==
Date: Fri, 15 Mar 2024 17:14:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, george.dunlap@citrix.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] docs/misra/rules.rst: add rule 5.5
In-Reply-To: <5a4533e5-c6f3-418c-811b-2bd0a631f1ad@suse.com>
Message-ID: <alpine.DEB.2.22.394.2403151711520.853156@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2403141733460.853156@ubuntu-linux-20-04-desktop> <5a4533e5-c6f3-418c-811b-2bd0a631f1ad@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Mar 2024, Jan Beulich wrote:
> On 15.03.2024 01:35, Stefano Stabellini wrote:
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -181,6 +181,21 @@ maintainers if you want to suggest a change.
> >         headers (xen/include/public/) are allowed to retain longer
> >         identifiers for backward compatibility.
> >  
> > +   * - `Rule 5.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_05.c>`_
> > +     - Required
> > +     - Identifiers shall be distinct from macro names
> > +     - Macros expanding to their own name are allowed, e.g.::
> > +
> > +           #define x x
> > +
> > +       Clashes between names of function-like macros and identifiers of
> > +       non-callable entities are allowed. Callable entities having an
> > +       identifier that is the same of the name of a
> > +       function-like macro are not allowed. Example (not allowed)::
> > +
> > +           #define f(x, y) f(x, y);
> 
> The semicolon here wants dropping, just to not give questionable constructs
> as examples.

Good point


> > +           void f(int x, int y);
> 
> With this not allowed and there (iirc) being examples of such in the code,
> I'll be curious how it is meant to deal with them.

I don't know how many violations we have, and if there is a general
pattern we could apply to address them. As usual we'll have a choice
between changing the code or adding a deviation.

