Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 106B25B08B6
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 17:39:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401995.643978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVx8c-0007Kd-O8; Wed, 07 Sep 2022 15:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401995.643978; Wed, 07 Sep 2022 15:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVx8c-0007Io-Kt; Wed, 07 Sep 2022 15:38:50 +0000
Received: by outflank-mailman (input) for mailman id 401995;
 Wed, 07 Sep 2022 15:38:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVx8b-0007Ii-Gh
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 15:38:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVx8b-0000S6-79; Wed, 07 Sep 2022 15:38:49 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVx8b-0001Al-0i; Wed, 07 Sep 2022 15:38:49 +0000
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
	bh=+GdVeUssNDRjPN9+jzsslXuRsyMUUCNoW9uJObPFNc0=; b=1ZDZOnEjIhziQux4vc97BumUKr
	eN5I5o8IEJsk6j9rxYC+fGaR74oJWHsAQxK0ht6UbMdjrhd5T7Jlwm1qCergoZO7JaWUxwhIB5xkd
	LNwN/rkYhLcg5MgP6k0eBqPDz9N7LTN0k+zHnF5lvSk2n7fla48ZQvoCgkyZnSbdMfjg=;
Message-ID: <230cdac8-e09d-8581-1e87-012a69601091@xen.org>
Date: Wed, 7 Sep 2022 16:38:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v4 3/4] xen/arm: mm: Rename xenheap_* variable to
 directmap_*
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220907143532.15397-1-Henry.Wang@arm.com>
 <20220907143532.15397-4-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220907143532.15397-4-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 07/09/2022 15:35, Henry Wang wrote:
> With the static heap setup, keep using xenheap_* in the function
> setup_xenheap_mappings() will make the code confusing to read,
> because we always need to map the full RAM on Arm64. Therefore,
> renaming all "xenheap_*" variables to "directmap_*" to make clear
> the area is used to access the RAM easily.

You are also renaming a function. So I think it should be clarified in 
the commit message.

With that:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

