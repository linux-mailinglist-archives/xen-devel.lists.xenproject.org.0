Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55B8730AFE
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 00:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549242.857679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9ZNA-0003Ei-Mu; Wed, 14 Jun 2023 22:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549242.857679; Wed, 14 Jun 2023 22:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9ZNA-0003Ca-K2; Wed, 14 Jun 2023 22:53:52 +0000
Received: by outflank-mailman (input) for mailman id 549242;
 Wed, 14 Jun 2023 22:53:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/4vD=CC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q9ZN9-0003CU-A6
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 22:53:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52e2f9c1-0b06-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 00:53:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D040060E97;
 Wed, 14 Jun 2023 22:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15271C433C0;
 Wed, 14 Jun 2023 22:53:45 +0000 (UTC)
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
X-Inumbo-ID: 52e2f9c1-0b06-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686783227;
	bh=MK0OgV1+3iu8fY60ujjgddNCePQ2dkqDHaY4xz+v8H8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Iec/6V5czjtlf/BWR9Zdy/b0uF1lYaEN5recbLlpFBA41+/YqSY+Of9RbtzpffPww
	 HRY3tbGYvC16hqtkZ8Lmbdp5zAmqWslU+fHpju0ZQkx3+HnvHb1rs0m42JNfUWkOE5
	 HLZH6Mlj4C1LrD+w48yW25kAnIKWe01341ChGEvRuYJLE/3/RLtszEJA1bnWIB7zac
	 Y/A3cHayCCQMd3YS8t8O+YaNmZwv7w5jhVtmpUsqYJdsta1+Pe4je3P3TWGyNnoys0
	 +tGGMYy21s3k295M0BNP7pm8SSvBgWn4vOpjCbhlJSeD6rzV1jmIna51zIR4iaNJI0
	 QLoSr6HeduMmQ==
Date: Wed, 14 Jun 2023 15:53:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    roberto.bagnara@bugseng.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] docs/misra: new rules addition
In-Reply-To: <7a0773e3-450c-4744-ad2b-689102ccc890@suse.com>
Message-ID: <alpine.DEB.2.22.394.2306141552150.897208@ubuntu-linux-20-04-desktop>
References: <20230613034456.701654-1-sstabellini@kernel.org> <7a0773e3-450c-4744-ad2b-689102ccc890@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 13 Jun 2023, Jan Beulich wrote:
> On 13.06.2023 05:44, Stefano Stabellini wrote:
> > @@ -133,6 +146,13 @@ existing codebase are work-in-progress.
> >         headers (xen/include/public/) are allowed to retain longer
> >         identifiers for backward compatibility.
> >  
> > +   * - `Rule 6.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_01.c>`_
> > +     - Required
> > +     - Bit-fields shall only be declared with an appropriate type
> > +     - In addition to the C99 types, we also consider appropriate types:
> > +       unsigned char, unsigned short, unsigned long, unsigned long long,
> > +       enum, and all explicitly signed integer types.
> 
> If I was to read this without the earlier discussion in mind, I would wonder
> why the unsigned types are explicitly enumerated, but the signed ones are
> described in more general terms. Can't it simply be "all explicitly unsigned
> / signed integer types", which then also covers e.g. uint32_t?

I'll change it to that effect


> > @@ -143,6 +163,32 @@ existing codebase are work-in-progress.
> >       - Octal constants shall not be used
> >       -
> >  
> > +   * - `Rule 7.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_02.c>`_
> > +     - Required
> > +     - A "u" or "U" suffix shall be applied to all integer constants
> > +       that are represented in an unsigned type
> > +     - The rule asks that any integer literal that is implicitly
> > +       unsigned is made explicitly unsigned by using one of the
> > +       indicated suffixes.  As an example, on a machine where the int
> > +       type is 32-bit wide, 0x77777777 is signed whereas 0x80000000 is
> > +       (implicitly) unsigned. In order to comply with the rule, the
> > +       latter should be rewritten as either 0x80000000u or 0x80000000U.
> > +       Consistency considerations may suggest using the same suffix even
> > +       when not required by the rule. For instance, if one has:
> > +
> > +       Original: f(0x77777777); f(0x80000000);
> > +
> > +       one might prefer
> > +
> > +       Solution 1: f(0x77777777U); f(0x80000000U);
> > +
> > +       over
> > +
> > +       Solution 2: f(0x77777777); f(0x80000000U);
> > +
> > +       after having ascertained that "Solution 1" is compatible with the
> > +       intended semantics.
> 
> I think we should state here what we want people to do, not what "one
> might prefer". That aspect aside, I'm not convinced the added text
> (matching what Roberto did suggest) really addresses my concerns. Yet
> I'm not going to pursue this any further - we'll see how this ends up
> working in practice.

OK. I'll keep it as is.

