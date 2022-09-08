Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3016A5B1DE2
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 15:05:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403340.645418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWHDU-0002oK-AY; Thu, 08 Sep 2022 13:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403340.645418; Thu, 08 Sep 2022 13:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWHDU-0002lz-7U; Thu, 08 Sep 2022 13:05:12 +0000
Received: by outflank-mailman (input) for mailman id 403340;
 Thu, 08 Sep 2022 13:05:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oWHDT-0002lt-CS
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 13:05:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWHDT-0007yY-1M; Thu, 08 Sep 2022 13:05:11 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.18.179]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWHDS-0001eW-Qp; Thu, 08 Sep 2022 13:05:10 +0000
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
	bh=Fw8v5mgnt+uiUQd92P1rz9Q7nfubChtbVYoUo+pWhQw=; b=tupAL+dQn+7/MujVxkncL1X8ND
	BpiHaZ47DwSWY/lEcCBZjVV/UBKLttiQDZpic2wi2ZqTDW4qmS1FM9WHbGXuBsKaE0RJ+SYdFi7be
	3sutSffsGDYFVMn7JVeawvTSEKdagXgLfnJevIZaR/8b2sGuYSbYMYUzdGy3AKCRLYic=;
Message-ID: <b1fe6526-6d30-bf39-a0e0-5040cb4ee20d@xen.org>
Date: Thu, 8 Sep 2022 14:05:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH] docs/device-tree: Place the static-heap dt-binding in
 proper place
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220908120728.8290-1-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220908120728.8290-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 08/09/2022 13:07, Henry Wang wrote:
> The static-heap dt-binding should be placed after the last feature,
> namely static-evtchn.
> 
> Fixes: 4596329291f5 ("docs, xen/arm: Introduce static heap memory")
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Thanks for fixing the mistake I did while committing the patch :).

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

