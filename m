Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EA843D069
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 20:14:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217179.377067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfnQw-0007cl-2W; Wed, 27 Oct 2021 18:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217179.377067; Wed, 27 Oct 2021 18:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfnQv-0007Zu-Vf; Wed, 27 Oct 2021 18:13:53 +0000
Received: by outflank-mailman (input) for mailman id 217179;
 Wed, 27 Oct 2021 18:13:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RMc=PP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mfnQv-0007Zo-8t
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 18:13:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f81640f5-4f05-4764-a282-53a70df5cc69;
 Wed, 27 Oct 2021 18:13:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2585F6109F;
 Wed, 27 Oct 2021 18:13:51 +0000 (UTC)
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
X-Inumbo-ID: f81640f5-4f05-4764-a282-53a70df5cc69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635358431;
	bh=sqvOweKnJ6e1tg/Hui1lqFbtUDaNPrM9lRPPHRa077A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TSMJz9UFUC9yYsoGskP0/mJq1qWpVVLGxYK6vxdIHtOQk8ORnJ02/OrCNeP0e7Zw7
	 5g9fcBoX1QYQUbCfqR1rsA/YPkvDNGugAqn1TPYT4oS3FfPmk57P/LyZluj6R29i2g
	 mNLr+VFu+Ovw+dVfUyrz6e6PsHphdUB+2nR08aL9AK3rFGxVhL/GPOu/gcpa5bnfd+
	 I+bx7qxO6YBmtjqIkvFKl6BO1yOuSr3rsGLXvXVGfHFagEvy4yPbqKaWejP9dRW3sG
	 lznLGd7R9TLW7oaEa4YcmUoDsCsZyD/QnOE8NMnEt8hXtg+T44hxp1GcTwqdJ8eRBq
	 mI1iswY2ciFrw==
Date: Wed, 27 Oct 2021 11:13:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    George Dunlap <George.Dunlap@citrix.com>, 
    "dunlapg@umich.edu" <dunlapg@umich.edu>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    "jbeulich@suse.com" <jbeulich@suse.com>, 
    "committers@xenproject.org" <committers@xenproject.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] governance: communication channels
In-Reply-To: <F3071594-3327-40B4-A0C2-D3EAD591DF74@arm.com>
Message-ID: <alpine.DEB.2.21.2110271111150.11563@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110251845500.4586@sstabellini-ThinkPad-T480s> <F3071594-3327-40B4-A0C2-D3EAD591DF74@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 26 Oct 2021, Bertrand Marquis wrote:
> > On 26 Oct 2021, at 02:46, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > Clarify that xen-devel is the only official communication channel.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks Bertrand


> Just for my knowledge, where is this file stored (as it is not in xen.git) ?

The governance is here:

https://xenbits.xenproject.org/governance/
https://xenbits.xen.org/gitweb/?p=governance.git;a=tree

