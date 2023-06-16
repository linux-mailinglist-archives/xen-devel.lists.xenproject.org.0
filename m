Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19363733B2C
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 22:50:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550460.859567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAGOf-0007NQ-UJ; Fri, 16 Jun 2023 20:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550460.859567; Fri, 16 Jun 2023 20:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAGOf-0007LH-Qp; Fri, 16 Jun 2023 20:50:17 +0000
Received: by outflank-mailman (input) for mailman id 550460;
 Fri, 16 Jun 2023 20:50:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qAGOe-0007L8-RY
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 20:50:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qAGOe-0007fE-07; Fri, 16 Jun 2023 20:50:16 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.4.107]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qAGOd-0006QC-Pf; Fri, 16 Jun 2023 20:50:15 +0000
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
	bh=3M0cGI4K5HwV+7NzHcCMQqj0CIU5AsR63dQkssyFlM8=; b=NYHFZCFTlTJJgkBO00mvf2HIhf
	ROVrLWWSTfX6InsQz7jwP6gz9bttWFTe2tt+nDx194N7GCJWHfyzGAlSwOpzIysfIi6WZpeWVIqJa
	AVvqAHFCSekK+lyiuAB2Hk6+iRxQA9RFn+Doi7Xl2f85OatGdb1GcnlKHnJtpHCjLUro=;
Message-ID: <2bb60bc6-b405-33ec-53f4-a45c7829b145@xen.org>
Date: Fri, 16 Jun 2023 21:50:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 8/8] SUPPORT.md: write down restriction of 32-bit tool
 stacks
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
 <6d6144f6-489e-d9b0-b590-f5d65c385116@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6d6144f6-489e-d9b0-b590-f5d65c385116@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

Sorry for the late reply.

On 26/04/2022 11:27, Jan Beulich wrote:
> Let's try to avoid giving the impression that 32-bit tool stacks are as
> capable as 64-bit ones.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

