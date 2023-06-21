Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3AD7391B9
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 23:39:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553174.863581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC5XE-0002yQ-Hc; Wed, 21 Jun 2023 21:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553174.863581; Wed, 21 Jun 2023 21:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC5XE-0002vc-Dw; Wed, 21 Jun 2023 21:38:40 +0000
Received: by outflank-mailman (input) for mailman id 553174;
 Wed, 21 Jun 2023 21:38:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZQ+K=CJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qC5XC-0002vW-Fx
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 21:38:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa33794b-107b-11ee-b237-6b7b168915f2;
 Wed, 21 Jun 2023 23:38:37 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6CFCB616E6;
 Wed, 21 Jun 2023 21:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E42C433BB;
 Wed, 21 Jun 2023 21:38:33 +0000 (UTC)
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
X-Inumbo-ID: fa33794b-107b-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687383515;
	bh=Hq/fPe63Bk0uKzL9hbYWrDM9LrdEJF9SOtuVR3z7Nqs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qSlAbXCcQTM3orqBbHCixx+2G3GnYZM95DjpLwuNdNYzcLZuPDH4XTv8Ga+UiEZto
	 nXjW9ZHlBneEEl1c0jha4kvACmzMp9NMvqUmrflzvX9AQ/BEf1Pfga7Uq8EiqcIF5X
	 1g9kbxfExu4vyCNny4kcZBBiIaXUYpS1jtTNdDfqwLc98XBGhfbjwPj8DeQTO0LVch
	 SO/uuEg77iR03hw4QsRZdm3Jm/C7dgFpNiI310Zv7hbz16vJ7NdPUv1fHjQSOMcDmX
	 UlSGuwxySrLqhylDve54TeNNFlhdN9C5iriPV2rPa7UDycZpGQHEmUqWZU4g1IeyLt
	 ZFFzfKIeXjuVQ==
Date: Wed, 21 Jun 2023 14:38:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    roberto.bagnara@bugseng.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra: add Rules 8.2, 8.3, 8.14
In-Reply-To: <98a2acc7-956e-d97a-ac2f-5d7368f2cdc3@suse.com>
Message-ID: <alpine.DEB.2.22.394.2306211434280.897208@ubuntu-linux-20-04-desktop>
References: <20230621012618.2661337-1-sstabellini@kernel.org> <98a2acc7-956e-d97a-ac2f-5d7368f2cdc3@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 Jun 2023, Jan Beulich wrote:
> On 21.06.2023 03:26, Stefano Stabellini wrote:
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -213,6 +213,17 @@ maintainers if you want to suggest a change.
> >       - Types shall be explicitly specified
> >       -
> >  
> > +   * - `Rule 8.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_02.c>`_
> > +     - Required
> > +     - Function types shall be in prototype form with named parameters
> > +     -
> > +
> > +   * - `Rule 8.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_03.c>`_
> > +     - Required
> > +     - All declarations of an object or function shall use the same
> > +       names and type qualifiers
> > +     -
> 
> I think we want to deal with uses of const when not qualifying a pointed-to
> type: One approach is to simply say we don't use const like this (and the
> few uses there are should then go away). The other, if we deem this a
> valuable feature, would be to make a project-wide exception for this case,
> as having such const in declarations is meaningless and hence at the risk
> of being confusing or hampering readability.

I think they should go away (the first option you wrote).

If you are OK with it, I could add a note here, such as:

"The rule also applies to differences in const-ness."

