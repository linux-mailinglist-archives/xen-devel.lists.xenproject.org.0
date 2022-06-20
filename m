Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0A25514FE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 11:56:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352688.579532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3E8y-0001LW-R0; Mon, 20 Jun 2022 09:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352688.579532; Mon, 20 Jun 2022 09:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3E8y-0001IG-Mt; Mon, 20 Jun 2022 09:56:28 +0000
Received: by outflank-mailman (input) for mailman id 352688;
 Mon, 20 Jun 2022 09:56:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o3E8w-0001IA-J0
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 09:56:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o3E8w-0000vQ-A5; Mon, 20 Jun 2022 09:56:26 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[192.168.1.39])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o3E8w-00010p-4W; Mon, 20 Jun 2022 09:56:26 +0000
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
	bh=2lA5V1g0a1NFBGBwYDGatm/v+Kz7kq5qsGUYune1dK4=; b=1a4HttZ/8mGwpS+DCRivYzes7e
	QxY1DgrXzqpPybyO/w2WjWS910g5M2AhqAsxYfjtPVjhtDhCeIFgTPAfVBqNBmMiSfp40ggIogb8F
	KiB/wiHjX3mdMymTKUeNI+MRa8oQhEksJq/ReJjm/83MIwUavThDxP+gnsygVBxoyZhc=;
Message-ID: <9e835e64-0182-26d0-241b-0e7796940e35@xen.org>
Date: Mon, 20 Jun 2022 10:56:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 7/9] common/libfdt: Use explicitly specified types
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <20220620070245.77979-8-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220620070245.77979-8-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 20/06/2022 08:02, Michal Orzel wrote:
> According to MISRA C 2012 Rule 8.1, types shall be explicitly
> specified. Fix all the findings reported by cppcheck with misra addon
> by substituting implicit type 'unsigned' to explicit 'unsigned int'.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
> This patch may not be applicable as these files come from libfdt.

The libfdt code is a verbatim copy of the one shipped in DTC. So any 
changes will have to be first accepted there and then the directory 
re-synced.

Cheers,

-- 
Julien Grall

