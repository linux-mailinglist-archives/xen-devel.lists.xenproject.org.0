Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B324C6F588D
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 15:07:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529209.823349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puCCd-0004V9-CP; Wed, 03 May 2023 13:07:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529209.823349; Wed, 03 May 2023 13:07:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puCCd-0004SW-9K; Wed, 03 May 2023 13:07:27 +0000
Received: by outflank-mailman (input) for mailman id 529209;
 Wed, 03 May 2023 13:07:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1puCCb-0004SJ-Iy
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 13:07:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1puCCb-0002lj-IC
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 13:07:25 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1puCCb-0003xa-BP
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 13:07:25 +0000
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
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=J25v0xeHQmJ98iK3AGD9avQ1ZwSuZ9KoC9ZQDOtObug=; b=hURQbTZRe8JfAQoef9xYeABi2j
	kXmArVjZEHjOQsGZtAijTPbsE0Prcsco1uEU5ZHnSCjrx5DH0kM/8FfLZVjkJfSUTIzexYSjGtiQD
	2rhZzm7wwhRKtWYdyJGliaidH+mpIxAgEMWqUCA9GjiiUEAp976D3gUPcf0kAq77iRVM=;
Message-ID: <764c6eaf-3f3a-bf27-3678-391b12f56cd9@xen.org>
Date: Wed, 3 May 2023 14:07:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 07/13] tools/xenstore: remove stale TODO file
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <20230330085011.9170-1-jgross@suse.com>
 <20230330085011.9170-8-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230330085011.9170-8-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/03/2023 09:50, Juergen Gross wrote:
> The TODO file is not really helpful any longer. It contains only
> entries which no longer apply or it is unknown what they are meant
> for ("Dynamic/supply nodes", "Remove assumption that rename doesn't
> fail").
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

