Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30910599686
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 09:58:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390077.627284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwtk-0002nC-Ql; Fri, 19 Aug 2022 07:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390077.627284; Fri, 19 Aug 2022 07:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwtk-0002kv-Nq; Fri, 19 Aug 2022 07:58:32 +0000
Received: by outflank-mailman (input) for mailman id 390077;
 Fri, 19 Aug 2022 07:58:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oOwtj-0002kp-GW
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 07:58:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOwti-0002sT-Vk; Fri, 19 Aug 2022 07:58:30 +0000
Received: from [54.239.6.188] (helo=[192.168.16.114])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOwti-0004b9-Lt; Fri, 19 Aug 2022 07:58:30 +0000
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
	bh=kn9ZxPsXkZWr/JzYzSkFBNOT/fwV6hnHpjKxsORfKn0=; b=1KglysJ2zoFJQEmgfIFyzxlloh
	Ple/LSJs7IzVUVqdhfeAG/wh7IQvhS68fc6ftLkJJu0ck345TId5fqR+yC0FQzDMX66xoZAPWA97z
	ayCJkwz78kPPvaoE6XorjiCg0L6SY0bmLyQ5ZqJUzM+yaOYFYoQWzcuKp3fIFfcm3QqE=;
Message-ID: <6da837d7-4784-f517-5c24-2bbe6a2af2be@xen.org>
Date: Fri, 19 Aug 2022 08:58:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH 2/2] Arm32: tidy the memset() macro
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
 <80abb94d-67d1-ef71-afbc-4d0bd9d8a557@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <80abb94d-67d1-ef71-afbc-4d0bd9d8a557@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/08/2022 08:50, Jan Beulich wrote:
> - add parentheses where they were missing (MISRA)
> - make sure to evaluate also v exactly once (MISRA)
> - remove excess parentheses
> - rename local variables to not have leading underscores
> - apply Xen coding style

This code has been taken from Linux. From you write above, I don't see 
any strong reason for us to modify it (even if it is small).

Cheers,

-- 
Julien Grall

