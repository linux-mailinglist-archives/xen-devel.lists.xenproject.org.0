Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E29F6C5041
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 17:11:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513536.794673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf13L-00043o-SU; Wed, 22 Mar 2023 16:11:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513536.794673; Wed, 22 Mar 2023 16:11:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf13L-000412-PC; Wed, 22 Mar 2023 16:11:07 +0000
Received: by outflank-mailman (input) for mailman id 513536;
 Wed, 22 Mar 2023 16:11:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pf13K-00040w-0F
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 16:11:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pf13J-0002S6-Ee; Wed, 22 Mar 2023 16:11:05 +0000
Received: from [15.248.2.159] (helo=[10.24.67.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pf13J-0007e3-8r; Wed, 22 Mar 2023 16:11:05 +0000
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
	bh=dcxwOgBItXf+s0TCMcLipOHjp+EeqdXF/6YhCZD2+BQ=; b=uQfwTkPvtB204H7rciTml/M0ax
	dP/+PxlsT65lTyiVK8x9QoOd7Ak436+LK/NjU1ibk5AknVD5DOTzClwp6s9VENkRJi6E54sHm/9MU
	6alqs/zHAI4bRRduUd0jXyvVLUqXLGzQ9jHu/kZaWd1P0emfg1TPNAhaMt84D8swicbA=;
Message-ID: <4efb440a-6397-8f02-c0bf-c3e2d2ee8b35@xen.org>
Date: Wed, 22 Mar 2023 16:11:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] xen/arm: domain_build: Check return code of
 domain_vpl011_init
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230322102941.959-1-michal.orzel@amd.com>
 <20230322102941.959-2-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230322102941.959-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22/03/2023 10:29, Michal Orzel wrote:
> We are assigning return code of domain_vpl011_init() to a variable
> without checking it for an error. Fix it.
> 
> Fixes: 3580c8b2dfc3 ("xen/arm: if direct-map domain use native UART address and IRQ number for vPL011")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

