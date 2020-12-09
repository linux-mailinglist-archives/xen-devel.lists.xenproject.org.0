Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AB22D4EB1
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 00:23:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48860.86445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn8nB-0000rg-T4; Wed, 09 Dec 2020 23:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48860.86445; Wed, 09 Dec 2020 23:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn8nB-0000rH-Pl; Wed, 09 Dec 2020 23:22:41 +0000
Received: by outflank-mailman (input) for mailman id 48860;
 Wed, 09 Dec 2020 23:22:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kn8nA-0000rC-Kx
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 23:22:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kn8n9-0004xM-6D; Wed, 09 Dec 2020 23:22:39 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kn8n8-0001YV-V4; Wed, 09 Dec 2020 23:22:39 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=JjyjhzTWaMwnycOk0aOS8NcMq+XcL2vXe5foY/m4WHc=; b=Yi7zwWKSKoV3Oi7WP70/WQFdwA
	2ktS6ubIMJ4q1OZNJcwh8r6vG5FLVqOX243tHjFTKeDU3kzZmX23FEUx3DzICfUjXYHRnJLvfXdRG
	+Llc6Eg+++3yv8CN67lEe9qYUKUJQfZD+GcUBIhP0U9IQZmGKa4/tqgyx1Gl/sTbmIWI=;
Subject: Re: [PATCH v3 3/7] xen/arm: create a cpuinfo structure for guest
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
 <33f39e7f521e6f73a0dba57a8be9fb50656e1807.1607524536.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6cf80971-e9aa-f9e4-cb9b-4f102b84a99b@xen.org>
Date: Wed, 9 Dec 2020 23:22:37 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <33f39e7f521e6f73a0dba57a8be9fb50656e1807.1607524536.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 09/12/2020 16:30, Bertrand Marquis wrote:
> +    /* Disable MPAM as xen does not support it */

I am going to be picky :). I think we want to say "hide" rather than 
"disable" because the latter is done differently via the HCR_EL2.

Cheers,

-- 
Julien Grall

