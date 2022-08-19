Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F71E59971B
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 10:32:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390146.627413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOxQV-0004pj-Jn; Fri, 19 Aug 2022 08:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390146.627413; Fri, 19 Aug 2022 08:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOxQV-0004nd-GQ; Fri, 19 Aug 2022 08:32:23 +0000
Received: by outflank-mailman (input) for mailman id 390146;
 Fri, 19 Aug 2022 08:32:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oOxQT-0004nN-O9
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 08:32:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOxQT-000454-Dd; Fri, 19 Aug 2022 08:32:21 +0000
Received: from [54.239.6.188] (helo=[192.168.16.114])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOxQT-0006BF-7F; Fri, 19 Aug 2022 08:32:21 +0000
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
	bh=+Fd7GjenphA+YdTx19RNZ6ZmneZjutSlr/6pcXWn9U8=; b=5IMN0ZEejEesjp2MqPsTDJr4oA
	oGcwzgIrk5O6MvzJoYRkV5ZVf1nVmXkHnbnzfbwxu0xTtZttaR1ECjYt1qqu1Wwxpp01ddafIWXSL
	DWIJClbcmcj1MVKEvnOsm5D+rUZBRsOoRa3aCXUXnWMJ3IM104nW7OdLCm1KT1+tLY3I=;
Message-ID: <c9df0573-044f-615d-f170-36ddbed6b50a@xen.org>
Date: Fri, 19 Aug 2022 09:32:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH 0/2] Arm32: memset() & friends
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/08/2022 08:48, Jan Beulich wrote:
> Note that while the original Linux code has the same issue, I don't
> really fancy sending there a patch similar to patch 1. That's because
> my XSA-307 related "make find_next_{,zero_}bit() have well defined
> behavior" was entirely ignored, so I would expect nothing better here.

Would you be able to point me to the discussion?

Cheers,

-- 
Julien Grall

