Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9E5ADA9FF
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 09:58:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016815.1393752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR4iy-00058k-O3; Mon, 16 Jun 2025 07:57:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016815.1393752; Mon, 16 Jun 2025 07:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR4iy-00056s-LC; Mon, 16 Jun 2025 07:57:48 +0000
Received: by outflank-mailman (input) for mailman id 1016815;
 Mon, 16 Jun 2025 07:57:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uR4iw-00056h-M5
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 07:57:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uR4is-004RfA-2x;
 Mon, 16 Jun 2025 07:57:42 +0000
Received: from [2a02:8012:3a1:0:64b5:81ad:1f26:5fcb]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uR4is-0076dH-1H;
 Mon, 16 Jun 2025 07:57:42 +0000
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
	bh=tRt68vllKD5DPfkrucpovmjiVUZriecmU3wqQ4Z+a7Y=; b=6wqG/xgJgS43iJ83njgNsyhCM/
	k8qzfdPq8ihY8TvaokqW3TDDMneGLG6C7SbXZ4AuCR0tb1kU7umpZvnYuUIioKHnSEZciZlPk4iGz
	kUmjxdF3t60cWGiVIwaHxryH9/4IfOSiONJijJY9pricNYK4MBTVLGbedrS36pwiaDmc=;
Message-ID: <93f19ebd-faa1-4811-97b1-2234025aa4b0@xen.org>
Date: Mon, 16 Jun 2025 08:57:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] xen/dt: ifdef out DEV_DT-related bits from
 device_tree.{c,h}
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Alejandro Vallejo <agarciav@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250613151612.754222-1-agarciav@amd.com>
 <20250613151612.754222-13-agarciav@amd.com>
 <07d0b403-1fc0-4d19-beee-b6960b29c819@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <07d0b403-1fc0-4d19-beee-b6960b29c819@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/06/2025 08:01, Jan Beulich wrote:
> On 13.06.2025 17:13, Alejandro Vallejo wrote:
>> ... which means, device-tree.c stops requiring strictly CONFIG_HAS_DEVICE_TREE
>> and may function without it.
> 
> See my reply to patch 14. I consider it outright wrong (as being overly
> misleading) to build device tree code without HAS_DEVICE_TREE=y.

FWIW +1.

Cheers,

-- 
Julien Grall


