Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 690FFA9999A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 22:45:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965300.1355902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7gyJ-0000i7-9p; Wed, 23 Apr 2025 20:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965300.1355902; Wed, 23 Apr 2025 20:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7gyJ-0000fb-73; Wed, 23 Apr 2025 20:45:31 +0000
Received: by outflank-mailman (input) for mailman id 965300;
 Wed, 23 Apr 2025 20:45:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UY1Q=XJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u7gyH-0008IP-KM
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 20:45:29 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e34efca0-2083-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 22:45:28 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 145E26844A;
 Wed, 23 Apr 2025 20:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD3EC4CEE2;
 Wed, 23 Apr 2025 20:45:25 +0000 (UTC)
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
X-Inumbo-ID: e34efca0-2083-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745441127;
	bh=35skaJ2TXXS8C6jUKFulwtiCBk0dtKpwvzZtSuA/YEM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cYmfoPwDPcuzNn4lt1BdFjd7c3Whi8JEK4LQJItnZuBgQRnIsFySmiLIjtk/SWtNZ
	 23XATyodDpCn6sAjFG/YNpCKkHeITQOt1Zu6twroT1qTDPZskuFH8EwK9Hpvm9wPuh
	 DZ/otiwAxv0fklkMqh681cU6D0/L2G7MwaHEoejiX4vPawAeI2946YOtAgGMyCzJFn
	 n6afIqYysoycqOdXeFBzUelLpCOvO3ZUXURySlQfH9MMa2SL6A8UVTF6tfpU0mZOGv
	 DqJNSGqB9ffSEcYVXFcnrGUkANQFoQDfHxyOXR/fo8eEf6hZO4OMClO0MUmM3kWroo
	 dolQy24N3cMnA==
Date: Wed, 23 Apr 2025 13:45:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v1] misra: add deviation of Rule 5.5
In-Reply-To: <48c7830931a98b2bf70ef1509f309b262b9e5792.1745427770.git.victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504231344490.785180@ubuntu-linux-20-04-desktop>
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com> <48c7830931a98b2bf70ef1509f309b262b9e5792.1745427770.git.victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Apr 2025, victorm.lira@amd.com wrote:
> From: Federico Serafini <federico.serafini@bugseng.com>
> 
> MISRA C Rule 5.5 states that:
> "Identifiers shall be distinct from macro names".
> 
> A common pattern in Xen is to have a function-like macro that acts as a
> "wrapper" for the function to be called:
> before calling the function, the macro adds additional checks or
> increase/decrease the number of parameters depending on the
> configuration.
> 
> Update ECLAIR configuration and deviations.rst.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

This is something we have already discussed in the past and accepted,
but we were missing the ECLAIR configuration for the deviation.

Thanks Federico for producing it.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I understand Jan asked for being more precise with the wording and I am
OK with that.


