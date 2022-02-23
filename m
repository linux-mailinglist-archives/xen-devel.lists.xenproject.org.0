Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C024C1B22
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 19:52:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277732.474543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMwkH-0001Cs-ET; Wed, 23 Feb 2022 18:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277732.474543; Wed, 23 Feb 2022 18:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMwkH-0001A1-AJ; Wed, 23 Feb 2022 18:52:13 +0000
Received: by outflank-mailman (input) for mailman id 277732;
 Wed, 23 Feb 2022 18:52:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nMwkG-00019r-9g
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 18:52:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nMwkF-00089f-UN; Wed, 23 Feb 2022 18:52:11 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[10.95.122.138]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nMwkF-0001oe-Op; Wed, 23 Feb 2022 18:52:11 +0000
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
	bh=19ZNXz6V8Ks1uqrdtl1sYxOuUbaoqkjQNiIah/IksnI=; b=JJHUCbha9AP5YKD2xAPcieaf5t
	zdUIZVmIMI9uUFNHA5DOnkkRTKXzGV6Yg7De2g/SBbml00eYfBSA/lQ/kiR00ylZnuUtLaZKuaENM
	sfThimjvgs5LlTO7fOrGj6DsNwffSS5KWMhPea7jFJJ6xu+SzsHCXyn+KyjrV1RT55yo=;
Message-ID: <af1aa9e0-a937-d209-8144-d39585b48ecb@xen.org>
Date: Wed, 23 Feb 2022 18:52:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 2/2] xen/arm: Rename psr_mode_is_user to
 regs_mode_is_user
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220222105613.20668-1-michal.orzel@arm.com>
 <20220222105613.20668-3-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220222105613.20668-3-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 22/02/2022 10:56, Michal Orzel wrote:
> Perform renaming of psr_mode_is_user to regs_mode_is_user in order to
> reflect that it takes struct cpu_user_regs as a parameter and not
> psr.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

