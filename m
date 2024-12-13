Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22FF9F196E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 23:57:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857246.1269640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMEb4-0006kA-5V; Fri, 13 Dec 2024 22:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857246.1269640; Fri, 13 Dec 2024 22:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMEb4-0006hj-2v; Fri, 13 Dec 2024 22:57:22 +0000
Received: by outflank-mailman (input) for mailman id 857246;
 Fri, 13 Dec 2024 22:57:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tMEb3-0006hd-4J
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 22:57:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tMEb2-001SRY-0s;
 Fri, 13 Dec 2024 22:57:20 +0000
Received: from [2a02:8012:3a1:0:544c:e3b3:a616:8824]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tMEb2-0033aW-1H;
 Fri, 13 Dec 2024 22:57:20 +0000
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
	bh=oRnpSM+/TcK7gpc3shES86e+UYwEi0FaIXIFQkqcmss=; b=CkqBAS6UuDPd2oyhLCFQq2cojI
	tlcxNqNABgwPR1rfJC+VU4POz9nz0PlEHjcA2Th1KffigtFmeXk5o5NUDtvK9CEz+QIpaoT+ZcP7v
	A5ub8c20yhEiI8DwrhATG1Vx1pCl0S6c83PVuZrrUQ0VqE4DgXUP+9Ae9Kl4MmAbaZ34=;
Message-ID: <8d8ef7f9-d73f-4ff8-8af9-4e73cda97624@xen.org>
Date: Fri, 13 Dec 2024 22:57:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] xen/arm: ffa: Fine granular call support
Content-Language: en-GB
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org, Volodymyr Babchuk
 <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1732702210.git.bertrand.marquis@arm.com>
 <1b02c9c1df9ff2230e076f25398a5de876f98a51.1732702210.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1b02c9c1df9ff2230e076f25398a5de876f98a51.1732702210.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 27/11/2024 16:07, Bertrand Marquis wrote:
> Create a bitmap to store which feature is supported or not by the
> firmware and use it to filter which calls are done to the firmware.
> 
> While there reoder ABI definition by numbers to easily find the min and

Typo (I can fix it while committing): s/reoder/reorder

Cheers,

-- 
Julien Grall


