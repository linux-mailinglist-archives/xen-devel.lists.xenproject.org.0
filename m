Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8727C3EB54F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 14:21:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166772.304406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEWBx-0004Jb-C4; Fri, 13 Aug 2021 12:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166772.304406; Fri, 13 Aug 2021 12:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEWBx-0004Gh-91; Fri, 13 Aug 2021 12:21:41 +0000
Received: by outflank-mailman (input) for mailman id 166772;
 Fri, 13 Aug 2021 12:21:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mEWBv-0004GZ-JJ
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 12:21:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mEWBv-0005VR-GL; Fri, 13 Aug 2021 12:21:39 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mEWBv-0007Gv-AY; Fri, 13 Aug 2021 12:21:39 +0000
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
	bh=m+QtAK1EBJ9L98PWpc5rJzGwU7tebvYWA+S7+qWflbw=; b=YyqdGD21AMNEBRa2BQxiV0O/PX
	iqIXOEP6T00uOpWTqt0IQ2aUHCDEB+xBLqu3r98NXRJQ+ZCaXtn+HD5W+oRmnB+9oTmTjdq3emVUp
	vsntqOiMCsjviAovB/1q89t0RhviO1fX5HsJLxrgYoCIMgl0NXxEa8Uxv1BnqOeTxoC4=;
Subject: Re: [PATCH V4 06/10] xen/arm: introduce PGC_reserved
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-7-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cdccfb6b-33d9-b8cc-6efe-3828278f9b4c@xen.org>
Date: Fri, 13 Aug 2021 13:21:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210728102758.3269446-7-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 28/07/2021 11:27, Penny Zheng wrote:
> This patch introduces a new page flag PGC_reserved in order to differentiate
> pages of static memory from those allocated from heap.
> 
> Mark pages of static memory PGC_reserved when initializing them.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

I think this want to be folded in patch #7.

Cheers,

-- 
Julien Grall

