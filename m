Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E70C3A999B0
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 22:50:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965345.1355934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7h2a-0002a3-Bl; Wed, 23 Apr 2025 20:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965345.1355934; Wed, 23 Apr 2025 20:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7h2a-0002Y8-7D; Wed, 23 Apr 2025 20:49:56 +0000
Received: by outflank-mailman (input) for mailman id 965345;
 Wed, 23 Apr 2025 20:49:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UY1Q=XJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u7h2Z-0002Xy-AH
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 20:49:55 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80eba918-2084-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 22:49:53 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C6A8A4A180;
 Wed, 23 Apr 2025 20:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF39CC4CEEA;
 Wed, 23 Apr 2025 20:49:49 +0000 (UTC)
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
X-Inumbo-ID: 80eba918-2084-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745441391;
	bh=GLhSDM9qc3q1S6fIf2zvHc1w/28TuKcPCdYwlopCgDc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OF4wYffzvZHGUe1XabwustgVODscZA82VeiX1XPvywKH0eeuDQJwoOz8Fiy4Rrpvq
	 +ISY7JOkMttgYj8iFYulwuGy721XUEsIu2gTmst7/dSmJy/riglzgD0TFARVXfUEG4
	 BVqGUGVe1tInibKXH34ATRGyqCBzu3IxyLW+cWxGczFyKH1Kn3j18lAb4RM3vpHVqB
	 /b2HN3Lm7lnW0jBGMldRUyt6BS3/jmiIyup3ZAS0rY4utRVll5iPAFDwMBXZj14Amv
	 rkAQfZez9Rr/kvYaPBr30CiJsZ3c/75z1oqcd2wEWJB8QE3Ua3UBtwC5cit2agkScU
	 7O9L9GpKtS+8A==
Date: Wed, 23 Apr 2025 13:49:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Victor Lira <victorm.lira@amd.com>, xen-devel@lists.xenproject.org, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v1] misra: add deviation of Rule 5.5
In-Reply-To: <alpine.DEB.2.22.394.2504231344490.785180@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2504231347500.785180@ubuntu-linux-20-04-desktop>
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com> <48c7830931a98b2bf70ef1509f309b262b9e5792.1745427770.git.victorm.lira@amd.com> <alpine.DEB.2.22.394.2504231344490.785180@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Apr 2025, Stefano Stabellini wrote:
> On Wed, 23 Apr 2025, victorm.lira@amd.com wrote:
> > From: Federico Serafini <federico.serafini@bugseng.com>
> > 
> > MISRA C Rule 5.5 states that:
> > "Identifiers shall be distinct from macro names".
> > 
> > A common pattern in Xen is to have a function-like macro that acts as a
> > "wrapper" for the function to be called:
> > before calling the function, the macro adds additional checks or
> > increase/decrease the number of parameters depending on the
> > configuration.
> > 
> > Update ECLAIR configuration and deviations.rst.
> > 
> > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> > Signed-off-by: Victor Lira <victorm.lira@amd.com>
> 
> This is something we have already discussed in the past and accepted,
> but we were missing the ECLAIR configuration for the deviation.
> 
> Thanks Federico for producing it.
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> I understand Jan asked for being more precise with the wording and I am
> OK with that.

Please remove this last sentence. I meant to say that I am OK with Jan's
request to narrow the deviation, both wording and check. The wording can
be done, I am not sure about the check.

