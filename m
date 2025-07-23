Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC359B0ECBB
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 10:07:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053487.1422268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUUt-0003wD-V9; Wed, 23 Jul 2025 08:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053487.1422268; Wed, 23 Jul 2025 08:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueUUt-0003u7-SH; Wed, 23 Jul 2025 08:06:43 +0000
Received: by outflank-mailman (input) for mailman id 1053487;
 Wed, 23 Jul 2025 08:06:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ueUUs-0003u1-Ga
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 08:06:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ueUUr-00Ennl-1g;
 Wed, 23 Jul 2025 08:06:41 +0000
Received: from [2a02:8012:3a1:0:e96c:db0f:a11c:5705]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ueUUr-009HEH-11;
 Wed, 23 Jul 2025 08:06:41 +0000
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
	bh=xk9q8fYsStr63DOs3PrYVDClbdWKZgXhnk3+LVjQy6s=; b=u5VgOWQOOsxEYbB72pCMo8Rqm0
	RhIriIwNOeo03aSWE1ZY08Sr6St0iHYTI3mNq/hZkCB7pHAh3tLnIzS4QL9vqdX4ylMwBNDTwsJXq
	CIHIFQEiM31wNgh9fDRpgvDf9IfxQgbfY/uhXFra9h/57/2nOndcPlM6nhqrMHKVC9Fs=;
Message-ID: <b968715b-20e5-4a63-8ad3-d4250e796c5d@xen.org>
Date: Wed, 23 Jul 2025 09:06:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 0/8] xen/arm64: make aarch32 support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20250723075835.3993182-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250723075835.3993182-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/07/2025 08:58, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Hi,

Hi Grygorii,

> Now Arm64 AArch32 guest support is always enabled and built-in while not
> all Arm64 platforms supports AArch32 or this support might not be needed.

I am not entirely sure I like the proliferation of using CONFIG_* for 
every single feature. This makes the testing a bit more complicated.

Can you clarify what the goal with this patch?

Cheers,

-- 
Julien Grall


