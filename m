Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6FB8B181A
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 02:42:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711733.1111938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rznBv-00088o-Cu; Thu, 25 Apr 2024 00:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711733.1111938; Thu, 25 Apr 2024 00:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rznBv-000862-AI; Thu, 25 Apr 2024 00:42:23 +0000
Received: by outflank-mailman (input) for mailman id 711733;
 Thu, 25 Apr 2024 00:42:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N29f=L6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rznBt-00085u-T7
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 00:42:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab7d44b0-029c-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 02:42:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1369560F02;
 Thu, 25 Apr 2024 00:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68829C113CD;
 Thu, 25 Apr 2024 00:42:16 +0000 (UTC)
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
X-Inumbo-ID: ab7d44b0-029c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714005737;
	bh=3WBQzeupVilEjh2JGQ3zP0drgQ/0P4z12xI1wL5NVLg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Mg0dNMcJ6QnxCZVOq26IvZcidnfW1L7DqFULJHA4FmTTAHLl8XMD1IIdsMWX3g09a
	 K84dJIcXuaAljZ4NX+QFPd4GKAHJ2Y3ul0P74IhEWPn4085gjGOBwdaqY3EfATFWeV
	 eOTrKkodSkwjT2F7FhzkRY5OYKnnePFYZD/Ws15PftjsARgdYJ0MiPwv5VKThbd/wL
	 XYnS+4S+Rzj1MOXv3vGhJG+QxZNYEVYUNLyJ5K4EtoOtma8PGnGQUdKM72vM6z+R+9
	 ZyaPYntdYQchuTRQiswvXpUFkORPN5MXlMcEqFQYJt4u2QxOif4swdUHaP7jS5qiOC
	 BspV8v97Sh9Rw==
Date: Wed, 24 Apr 2024 17:42:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: docs/misra: add R21.6 R21.14 R21.15 R21.16
In-Reply-To: <12adc492-aad0-4971-b744-e6dee87630ac@suse.com>
Message-ID: <alpine.DEB.2.22.394.2404241731290.3940@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2404161227340.2257106@ubuntu-linux-20-04-desktop> <12adc492-aad0-4971-b744-e6dee87630ac@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 18 Apr 2024, Jan Beulich wrote:
> On 16.04.2024 21:27, Stefano Stabellini wrote:
> > Also add two specific project-wide deviations for R21.6 and R21.15.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> > index 32b02905d1..9123c8edb5 100644
> > --- a/docs/misra/deviations.rst
> > +++ b/docs/misra/deviations.rst
> > @@ -387,6 +387,22 @@ Deviations related to MISRA C:2012 Rules:
> >         of the Rule due to uses of this macro.
> >       - Tagged as `deliberate` for ECLAIR.
> >  
> > +   * - R21.6
> > +     - The use of snprintf() and vsnprintf() is justifiable as, despite
> > +       the fact that such functions have the same names of the
> > +       corresponding standard library functions, each configuration of
> > +       Xen has a unique implementation for them; the code implementing
> > +       such functions is subject to the analysis, so that any undefined
> > +       or unspecified behavior associated to them falls under the
> > +       responsibility of other MISRA guidelines
> 
> Checking the Misra spec, I'm actually surprised a deviation is needed. The
> rule's rationale talks about streams and file I/O only. Why would the string
> formatting functions be covered then at all? They also don't have, afaik,
> any undefined or implementation defined behavior.

As discussed during the call, I'll add an explanatory note to rules.rst


> > +     - Tagged as `safe` for ECLAIR.
> > +
> > +   * - R21.15
> > +     - The use of void* arguments is justifiable as the rationale for
> > +       the rule is to indicate possible mistakes, and void* is
> > +       frequently used in Xen to represent virtual memory addresses
> 
> But that doesn't rule out mistakes. Are there actually examples in the
> code base?

If you are asking if there are any violations or bugs, I'll defer to the
Bugseng team.

 
> Additionally I wonder (a) whether the rule actually needs an exception

Yes my understanding is that a deviation is necessary from MISRA point
of view, and if nothing else it will serve as extra clarification.


> and thus (b) whether the deviation isn't instead for 21.16. As to (a) I
> understand the rule is worded slightly differently than what would
> strictly be needed to permit void*, but the general rule in C is that
> void* is compatible with all other pointers (suitably qualified as
> needed, of course) anyway.

Roberto and others, can you please confirm whether we need a deviation
on 21.16 as well for similar reasons to 21.15? I am asking because I
don't have any notes about requiring a deviation for 21.16 but I would
like to check with you.

