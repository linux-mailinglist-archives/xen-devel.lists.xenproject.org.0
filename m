Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 769C153542F
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 21:58:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337740.562429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuJco-0003cK-DX; Thu, 26 May 2022 19:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337740.562429; Thu, 26 May 2022 19:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuJco-0003ZW-A3; Thu, 26 May 2022 19:58:26 +0000
Received: by outflank-mailman (input) for mailman id 337740;
 Thu, 26 May 2022 19:58:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/mMd=WC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nuJcn-0002Vw-2L
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 19:58:25 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 335921c1-dd2e-11ec-bd2c-47488cf2e6aa;
 Thu, 26 May 2022 21:58:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 92B25B821FC;
 Thu, 26 May 2022 19:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACDDDC385A9;
 Thu, 26 May 2022 19:58:20 +0000 (UTC)
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
X-Inumbo-ID: 335921c1-dd2e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653595102;
	bh=Ez1QX1kYxUxJ3eXuS5EaRUH8QqC/sTVOQQGMhzr/wvM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=So2PcIQli4r+ZeqPk3IAvK+Fl96OvbIs1PhW75g7I+wcEhSKwg496XN88CaeH0fVE
	 wVyQid4sJTSfTTBjyB8cW8Xb4RvrgpqIYi9IP4/cJoU6HX7UdlkOOu6PXWjibGbpKl
	 62D5w6TcN5unQW5CcxugH8aLihXK8snqFYN/Le0M8NcZSiHV3zX61d2NIWRnIT8ak9
	 UlqWPE8NCUV14egPjf2lZ5JF4Nhrqy5oh4n7GWNwQJhOvciCUp5wyUs1tywe4AMg2A
	 T7y8ar9UE4Ud4qERL1KqoLdP/m0CjVFmlqRe1nHPM8huF9r4OpDDiC+XBJ6OP7WAcI
	 P1dSstzohVqfQ==
Date: Thu, 26 May 2022 12:58:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, julien@xen.org, Bertrand.Marquis@arm.com, 
    George.Dunlap@citrix.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] docs/misra: add Rule 5.1
In-Reply-To: <39c930ba-f5b4-14a4-ec48-19dba9a21509@suse.com>
Message-ID: <alpine.DEB.2.22.394.2205261226200.1905099@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop> <20220525003505.304617-2-sstabellini@kernel.org> <6604372a-67a1-6ad2-bbcf-d6b4337a4bf0@suse.com> <alpine.DEB.2.22.394.2205251813290.1905099@ubuntu-linux-20-04-desktop>
 <39c930ba-f5b4-14a4-ec48-19dba9a21509@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 May 2022, Jan Beulich wrote:
> On 26.05.2022 03:18, Stefano Stabellini wrote:
> > On Wed, 25 May 2022, Jan Beulich wrote:
> >> On 25.05.2022 02:35, Stefano Stabellini wrote:
> >>> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> >>>
> >>> Add Rule 5.1, with the additional note that the character limit for Xen
> >>> is 63 characters.
> >>>
> >>> The max length identifiers found by ECLAIR are:
> >>>
> >>> __mitigate_spectre_bhb_clear_insn_start
> >>> domain_pause_by_systemcontroller_nosync
> >>>
> >>> Both of them are 40 characters long. A limit of 63 characters work for
> >>> the existing code.
> >>
> >> I have to admit that it hasn't become clear to me why we want to
> >> permit (if not to say encourage) the use of such long identifiers.
> >> If 40 is the longest we've got, why not limit it to 40 for now
> >> with a goal of further reducing? A 40-char symbol plus some
> >> indentation will already pose problems with 80-char line length.
> >  
> > We can go lower than 63 if we want to. I chose the closest power-of-two
> > length -1 for the NUL terminator. But it doesn't have to be a
> > power-of-two. So we could go with "41" if we want to.
> > 
> > Anyone in favor of that? I am happy with any number between 41 and 63.
> 
> Why 41, not 40? 41 seems yet more arbitrary to me than e.g. 40.

I was adding +1 to account for the NUL terminator, but actually I
already added it before (__mitigate_spectre_bhb_clear_insn_start and
domain_pause_by_systemcontroller_nosync are 39 characters).

So yes we can go with 40.


> >> Otoh, as said on the call, I think the public headers want
> >> mentioning explicitly here in some way. Part of them (most or all
> >> of what's under io/) aren't used when building Xen, so won't be
> >> seen by Eclair (aiui). Yet they are a formal part of the code
> >> base, and e.g. ring.h has some pretty long names (albeit still
> >> below 40 chars as it looks). So once we're able to go down to e.g.
> >> 32 for the bulk of the code base, public headers should imo still
> >> be explicitly allowed to use longer identifiers.
> > 
> > Actually I thought about writing something for the public header but I
> > wasn't sure what to write. What about:
> > 
> > - Note: the Xen characters limit for identifiers is 41. Public headers
> >   (xen/include/public/) are allowed to retain longer identifiers for
> >   backward compatibility.
> 
> Fine with me, except I wonder in how far going forward we actually
> need to play by that limit there. Proper name-spacing is particularly
> important in the public headers, so may warrant a higher limit for
> certain (unusual?) circumstances.

Keep in mind that the rules are general guidelines and good defaults.
There can be always special cases, and that is especially true for
"unusual circumstances".

