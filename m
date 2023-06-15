Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 675067321B3
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 23:27:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549925.858747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9uV3-0008MJ-K7; Thu, 15 Jun 2023 21:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549925.858747; Thu, 15 Jun 2023 21:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9uV3-0008KL-Gu; Thu, 15 Jun 2023 21:27:25 +0000
Received: by outflank-mailman (input) for mailman id 549925;
 Thu, 15 Jun 2023 21:27:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZfe=CD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q9uV1-00085U-UB
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 21:27:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69ffe82a-0bc3-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 23:27:22 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B1AD76147E;
 Thu, 15 Jun 2023 21:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0368EC433C0;
 Thu, 15 Jun 2023 21:27:19 +0000 (UTC)
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
X-Inumbo-ID: 69ffe82a-0bc3-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686864441;
	bh=O/TD4sLifRkWWfks/UHjVphPxmFUvobdzocjHvocOWQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XaQLLaMF+vetSwbWLCNIsebVya2e48rk0IZajqss9TCw40lu2zbSpjmn+GwwuAbbq
	 Kh/t/nSGwYOyZBwYR9TafF6vXXxH6lvhI2uHZuotCnhXTvh2xE5Ch2IbtzjZmydW81
	 CMU5VMhPLki2M+rD9ze+zENh1yJO5HOHFkKSmAMuFd+DPziZ8qG0zvlsGFmIvYgA/i
	 fZOXplRd2TeRR5XqKSrQcnHxKLIeFf5zEKJf34OsCj73S8OWCosYTpCy86LE7r6K1w
	 UiqtAV9J3NP2CsJ2XDiEZu0pmNHY8RPn3klUTfhmRpRTgREXFoETs1fDdeS/cSHaQ0
	 htcLTSfPtEh4A==
Date: Thu, 15 Jun 2023 14:27:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    roberto.bagnara@bugseng.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/misra: add rules 1.4 and 2.1
In-Reply-To: <0a8a5eec-0d07-c1ba-21cc-a336a7f49ddb@suse.com>
Message-ID: <alpine.DEB.2.22.394.2306151421520.897208@ubuntu-linux-20-04-desktop>
References: <20230614230328.1060282-1-sstabellini@kernel.org> <0a8a5eec-0d07-c1ba-21cc-a336a7f49ddb@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Jun 2023, Jan Beulich wrote:
> On 15.06.2023 01:03, Stefano Stabellini wrote:
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -90,6 +90,17 @@ existing codebase are work-in-progress.
> >         behaviour
> >       -
> >  
> > +   * - Rule 1.4
> > +     - Required
> > +     - Emergent language features shall not be used
> > +     - Emergent language features, such as C11 features, should not be
> > +       confused with similar compiler extensions, which we use.
> 
> The plans to possibly use _Generic, as mentioned during the discussion,
> are (I think) making this the first case where we accept a rule with
> the expectation to later break (deviate) it. I don't think I'm aware of
> provisions in this regard, so by accepting the rule in the form you
> suggest may well lead to people later pointing here and say "no" to any
> attempt to use _Generic. IOW I think it wants clarifying in the text at
> the top of the file that there is flexibility to change in how far we
> mean to comply to already accepted rules.

I'll do both things:
- expand the comment in the Notes section of 1.4
- also add a comment at the top of the file

