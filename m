Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0E8A143F9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 22:22:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873812.1284773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYXJl-000147-I6; Thu, 16 Jan 2025 21:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873812.1284773; Thu, 16 Jan 2025 21:22:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYXJl-00011e-Ez; Thu, 16 Jan 2025 21:22:21 +0000
Received: by outflank-mailman (input) for mailman id 873812;
 Thu, 16 Jan 2025 21:22:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oLIk=UI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tYXJl-00011Y-0M
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 21:22:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6b34956-d44f-11ef-99a4-01e77a169b0f;
 Thu, 16 Jan 2025 22:22:18 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7D2EF5C5FE7;
 Thu, 16 Jan 2025 21:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0E3C4CEDD;
 Thu, 16 Jan 2025 21:22:15 +0000 (UTC)
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
X-Inumbo-ID: f6b34956-d44f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737062536;
	bh=ffkEaWjYvlPoNeNiYvsQVbb/vU0axWyLB1EqOQ73goU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WYgKrCuaImJOgUTHEKMgEBtMeelvPTqBLVZw3gdu38qkulAkqoFEzhf3ZhEX89uZh
	 nFWicHSIBw8A1jRAOyHu6jlmZRUB4ZV0haf9r4n6EJKwAulWycOtIhJflT0VPBhTfB
	 TcA7Nc04gpS44X+O8wTMGKqbvJZ2W6kKA47Ao1P1G+40TVDBZqsFK7T1QsBJ0ba6Q4
	 oeSStMwUb1V/LEdx3S/badIE2xX28RD4kb5vavqLkcbaGY+eREtj5Zuin/5FW6mXbi
	 Pd0THwomJZe478IMFzW2LTn3pcYor8JkheGiINkHQgd6FG4dZrhnY8GQxPwSnaFrar
	 zpKVXneoHrMFQ==
Date: Thu, 16 Jan 2025 13:22:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] docs/misra: Document ECLAIR extension to Rule 20.7
In-Reply-To: <48035a91703c82c82e9c5239fb6373a7@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2501161322000.2684657@ubuntu-linux-20-04-desktop>
References: <77354513a986a14c37ec2dfc45cf3534b08b5e85.1736972547.git.nicola.vetrini@bugseng.com> <d90e5496-cccf-4670-8332-8d2e5f482c5e@suse.com> <48035a91703c82c82e9c5239fb6373a7@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Jan 2025, Nicola Vetrini wrote:
> On 2025-01-16 10:51, Jan Beulich wrote:
> > On 16.01.2025 10:31, Nicola Vetrini wrote:
> > > MISRA C Rule 20.7 states:
> > > "Expressions resulting from the expansion of macro parameters shall
> > > be enclosed in parentheses".
> > > 
> > > Document the behaviour of ECLAIR with respect to the CPP extension
> > > that allows variable macro arguments to be named.
> > > 
> > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > ---
> > >  docs/misra/rules.rst | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> > > index e7763795b826..13890f6d8852 100644
> > > --- a/docs/misra/rules.rst
> > > +++ b/docs/misra/rules.rst
> > > @@ -671,7 +671,14 @@ maintainers if you want to suggest a change.
> > >         shall be enclosed in parentheses
> > >       - Extra parentheses are not required when macro parameters are used
> > >         as function arguments, as macro arguments, array indices, lhs in
> > > -       assignments or as initializers in initalizer lists.
> > > +       assignments or as initializers in initalizer lists. In addition,
> > > +       the use of a named variable argument in a macro that would
> > > constitute
> > > +       a violation of the rule is allowed by ECLAIR as an extension of
> > > the
> > > +       MISRA, since it may not always be possible to parenthesize such
> > 
> > Just one nit / question (addressable while committing, if desired): I
> > wouldn't have expected "the" before "MISRA". Is that conventional wording
> > in your environment?
> > 
> > Jan
> 
> Hi Jan,
> 
> that was just a typo. It should have been "the MISRA guideline".
> Thanks for catching that

With that fixed:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

