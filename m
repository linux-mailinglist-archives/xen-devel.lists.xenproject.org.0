Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EBD7D8BC0
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 00:36:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624031.972398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw8wK-0001wP-D6; Thu, 26 Oct 2023 22:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624031.972398; Thu, 26 Oct 2023 22:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw8wK-0001tG-AA; Thu, 26 Oct 2023 22:34:56 +0000
Received: by outflank-mailman (input) for mailman id 624031;
 Thu, 26 Oct 2023 22:34:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2QB=GI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qw8wI-0001tA-Cj
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 22:34:54 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df16ef51-744f-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 00:34:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 66073B816EF;
 Thu, 26 Oct 2023 22:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF64C433C8;
 Thu, 26 Oct 2023 22:34:46 +0000 (UTC)
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
X-Inumbo-ID: df16ef51-744f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698359687;
	bh=Osdx7hfaNFBaK3eeztfPGOHqBfwVnUuPl93jRNhqnVY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=I8W7llEnX4ngrtyb+hTnTuAZbYvUe9Jj/dOrCoKvNHxSs8G/7zTdToFVkYuCBLd3W
	 Fmgr0aJGm2sc0ZU7y8ppjIXEJBqzC9GoMW1qrbUzQ5RViIjCMv53T1cAs1+jjCJVnT
	 jISdIXeCRZ6xVZ2T3YnQXBO21dYpBTmSSUC5LLpi2HbsQ/6Oh8vLzCzxWeyKQG6/UQ
	 eyyNrasSoWeowheqGHKujpAVLkWfEYopzZhfovtBdt9nI25MYxPHBwRVIxuq1FLV2R
	 63Kdx5Hx0NSfPGt9z3VrTGRpAw1vHxbDHZGNJgMtHeku5nmMBRRqfvE+XjBodURPNP
	 z/1ev88bU/R9A==
Date: Thu, 26 Oct 2023 15:34:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org, 
    bertrand.marquis@arm.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    george.dunlap@citrix.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] misra: add R14.4 R21.1 R21.2
In-Reply-To: <abd5c802-00c0-eda6-05ef-d10260ddb383@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310261533050.271731@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2310231628500.3516@ubuntu-linux-20-04-desktop> <967caedc-3d10-dee4-6614-1b9dcc0c1c66@suse.com> <alpine.DEB.2.22.394.2310241753220.271731@ubuntu-linux-20-04-desktop> <1e2991d7-b7b5-2fdd-38e0-ee1eff607f0e@suse.com>
 <alpine.DEB.2.22.394.2310251759560.271731@ubuntu-linux-20-04-desktop> <abd5c802-00c0-eda6-05ef-d10260ddb383@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 Oct 2023, Jan Beulich wrote:
> On 26.10.2023 03:16, Stefano Stabellini wrote:
> > On Wed, 25 Oct 2023, Jan Beulich wrote:
> >> On 25.10.2023 03:15, Stefano Stabellini wrote:
> >>> And if we can find a clear general comment about the usage of leading
> >>> underscores in Xen I am happy to add it too (e.g. header guards), but
> >>> from MISRA point of view the above is sufficient.
> >>
> >> But what we need isn't a description of the status quo, but one of
> >> what state we want to (slowly) move to. The status quo anyway is
> >> "no pattern, as in the past hardly anyone cared".
> > 
> > I guess you are suggesting something more like the following, but please
> > feel free to suggest your favorite wording (it might be easier for me to
> > understand what you mean if you provide a short example).
> > 
> > ---
> > All identifiers starting with an underscore are reserved and should not
> > be used.
> 
> Again, no. Identifiers starting with an underscore followed by another
> underscore or an upper-case letter are reserved. Other identifiers are
> dedicated for a particular purpose, and are fine to use for (at least)
> that purpose.
> 
> > Today Xen uses many, such as header guards and bitwise
> > manipulation functions. Upon analysis it turns out Xen identifiers do
> > not clash with the identifiers used by modern GCC, but that is not a
> > guarantee that there won't be a naming clash in the future or with
> > another compiler. For these reasons we discourage the introduction of
> > new reserved identifiers in Xen, and we see it as positive the reduction
> > of reserved identifiers. At the same time, certain identifiers starting
> > with an underscore are also commonly used in Linux (e.g. __set_bit) and
> > we don't think it would be an improvement to rename them.
> 
> Everything else reads okay-ish to me.

OK, here is the new version

Identifiers starting with an underscore followed by another underscore
or an upper-case letter are reserved. Today Xen uses many, such as
header guards and bitwise manipulation functions. Upon analysis it turns
out Xen identifiers do not clash with the identifiers used by modern
GCC, but that is not a guarantee that there won't be a naming clash in
the future or with another compiler.  For these reasons we discourage
the introduction of new reserved identifiers in Xen, and we see it as
positive the reduction of reserved identifiers. At the same time,
certain identifiers starting with an underscore are also commonly used
in Linux (e.g. __set_bit) and we don't think it would be an improvement
to rename them.

