Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 774018190AF
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 20:27:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657116.1025834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFfkP-0001U2-IS; Tue, 19 Dec 2023 19:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657116.1025834; Tue, 19 Dec 2023 19:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFfkP-0001R3-Ez; Tue, 19 Dec 2023 19:27:21 +0000
Received: by outflank-mailman (input) for mailman id 657116;
 Tue, 19 Dec 2023 19:27:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFfkO-0001Qx-Tg
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 19:27:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFfkO-00011H-Kt; Tue, 19 Dec 2023 19:27:20 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.3.234]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFfkO-0004NV-D4; Tue, 19 Dec 2023 19:27:20 +0000
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
	bh=jv9TBTilkSC0NXTOS0qpaiCCocWxJlApespuF4YlU90=; b=nRaJH5i2BkoQ48/ZGQMc+RM68L
	5n66pcPg5vvfmiIrFHBuTP+wLqzQ/o5WaRVkdhJDRnasKeWwMSj0zV8cmxxQfYpN+iZi3tjuwilqt
	SCXPx8c0vSrX5y7IhhKL4cuV1qsoSb4vY2a5w6UELJAFSa4NaHpw0rTCZPU5H7gQK3PQ=;
Message-ID: <479bbc75-453f-488e-bf6c-3a99d550b7d4@xen.org>
Date: Tue, 19 Dec 2023 19:27:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] xen/arm: smmuv3: Add PCI devices support for
 SMMUv3
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231109182716.367119-1-stewart.hildebrand@amd.com>
 <20231109182716.367119-7-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231109182716.367119-7-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/11/2023 18:27, Stewart Hildebrand wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 

Looking at the code, most of my comments on SMMUv2 apply here too. So I 
will not repeat them.

Cheers,

-- 
Julien Grall

