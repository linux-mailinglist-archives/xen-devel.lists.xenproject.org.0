Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A24C77C45CE
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 02:02:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615193.956454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqMfu-0003sJ-Ev; Wed, 11 Oct 2023 00:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615193.956454; Wed, 11 Oct 2023 00:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqMfu-0003qK-BN; Wed, 11 Oct 2023 00:02:06 +0000
Received: by outflank-mailman (input) for mailman id 615193;
 Wed, 11 Oct 2023 00:02:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+0Cd=FZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qqMfs-0003qE-14
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 00:02:04 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66388176-67c9-11ee-9b0d-b553b5be7939;
 Wed, 11 Oct 2023 02:02:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0278ECE20D3;
 Wed, 11 Oct 2023 00:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C52C433C9;
 Wed, 11 Oct 2023 00:01:54 +0000 (UTC)
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
X-Inumbo-ID: 66388176-67c9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696982516;
	bh=Sy2P5+wuKWwt0VBUDtSdgFFzlPfxvcmlOkyzBB1w7t4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tQqEvNzPrlva2hDYExPf9ot6F8jdVliOCBA2FB+2v7C0Ztx9cpxoCX24h/6NFZNxl
	 tqzhoDYPD53yFNrRobw43NFF1nQjxaxwE8INrlB7DFVVvqABfxyrhsq+J26WLujnW0
	 +PD6U3eI1m3mg45LFyYg6KT+4/L/5oHkJ6mizLyWJlaOddkVEU0cFUdnZJdYuoiWW4
	 0X7mpSKfSL8+ht9rtFGMowXR/SdUffTntBFV4jeyv7F16V8aXsSSnDdClHJ5tkMUi7
	 RNOlEt8snQ3gACU5S9WfUpCi9D8iEBUnNdjb2JK85IHHxBnmGfh9pXfe8RXG2u9b0D
	 3sP61PNC7FCMg==
Date: Tue, 10 Oct 2023 17:01:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>, julien@xen.org
cc: Xen-devel <xen-devel@lists.xenproject.org>, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: MISRA C:2012 D4.11 caution on staging
In-Reply-To: <7972c20f361126022fa97f6b51ca2d9c@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310101658030.3431292@ubuntu-linux-20-04-desktop>
References: <7972c20f361126022fa97f6b51ca2d9c@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hey Julien, please double-check what I am writing below


On Tue, 10 Oct 2023, Nicola Vetrini wrote:
> Hi,
> 
> as you can see from [1], there's a MISRA C guideline, D4.11, that is supposed
> to be clean
> (i.e., have no reports), but has a caution on an argument to memcpy
> (the second argument might be null according to the checker, given a set of
> assumptions on
> the control flow). To access the report just click on the second link in the
> log, which should take you to a webpage with a list of
> MISRA guidelines. Click on D4.11 and you'll see the full report, which I
> pasted below for convenience.
> 
> If the finding is genuine, then some countermeasure needs to be taken against
> this
> possible bug, otherwise it needs to be motivated why the field config->handle
> can't
> be null at that point.
> The finding is likely the result of an improvement made to the checker,
> because the first
> analysis I can see that spots it happened when rc1 has been tagged, but that
> commit does not
> touch the involved files.
> 
> [1] https://gitlab.com/xen-project/xen/-/jobs/5251222578
> 
>  caution for MC3R1.D4.11 untagged
> xen/common/domain.c:758.27-758.40:
> [59] null pointer passed as 2nd argument to memory copy function


This looks like a genuine issue: in domain_create, config->handle could
be uninitialized. For example, domain_create can be called
from xen/arch/arm/domain_build.c:create_domUs, passing &d_cfg, and I
don't see where we initialize d_cfg.handle.

This was just by code inspection. Julien, did I miss anything?

