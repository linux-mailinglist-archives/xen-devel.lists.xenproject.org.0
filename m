Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 584A47E3026
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 23:49:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628505.980047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r08Oi-0005jh-TA; Mon, 06 Nov 2023 22:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628505.980047; Mon, 06 Nov 2023 22:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r08Oi-0005h1-QM; Mon, 06 Nov 2023 22:48:44 +0000
Received: by outflank-mailman (input) for mailman id 628505;
 Mon, 06 Nov 2023 22:48:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r08Og-0005gc-VA
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 22:48:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r08Of-0007RC-W8; Mon, 06 Nov 2023 22:48:41 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r08Of-0007e8-QC; Mon, 06 Nov 2023 22:48:41 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=nMuWyPTIbkMAZqmS0UmXalINWa+fAvwCByyv7D3PN+o=; b=VaaTbWctud5/r4XwOGfuTv4oOF
	z/P9E7YKO4Bp4hgsW8S7sgKKM1PfCytuBy5RS16KtJuD/vwDt//eHweahgGgcDaow8mT/Q0gMqgqQ
	RkxN8ZkKB2GYP6r/YEiF7zx0P9YojmKppY34Bs4TVhzGYG7HbH80l1Gsk/rO+7gSMjzE=;
Message-ID: <39c47227-7695-4ef7-9e29-7a85253b5895@xen.org>
Date: Mon, 6 Nov 2023 22:48:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add xen/drivers/char/imx-lpuart.c to ARM
 section
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231106131922.29240-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231106131922.29240-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 06/11/2023 13:19, Michal Orzel wrote:
> Add it to the list next to other Arm serial drivers, so it does not fall
> back to THE REST.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon>

I will also commit the patch now.

Cheers,

-- 
Julien Grall

