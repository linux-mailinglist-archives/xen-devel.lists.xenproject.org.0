Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D954B1BB92
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 22:58:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070963.1434555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujOj7-0007DQ-Pc; Tue, 05 Aug 2025 20:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070963.1434555; Tue, 05 Aug 2025 20:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujOj7-0007BS-MZ; Tue, 05 Aug 2025 20:57:41 +0000
Received: by outflank-mailman (input) for mailman id 1070963;
 Tue, 05 Aug 2025 20:57:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ujOj6-0007BK-EX
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 20:57:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ujOj5-002uKg-2b;
 Tue, 05 Aug 2025 20:57:39 +0000
Received: from [2a02:8012:3a1:0:d57f:c918:5b22:a406]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ujOj5-00680h-1o;
 Tue, 05 Aug 2025 20:57:39 +0000
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
	bh=o5t2772qYlHXuqpkP22SCJqrItlXUcR8aQnEFbjnkDE=; b=VqDfVeL9NJ8HprYj1Lx1h5HaDo
	SCz71mMjx0dxc+P/KsF1r8ybAwU4G/lHBe9dAEHpRIHFeMuf3rC2IT6ESng+0tFeQ2XHd20q9ffcN
	xuVbTQcPn/tw5iUagGEc837K+nzxvj/XBJauVk394jZxvJfukCEx+L5l3vH4ek/i6V/Y=;
Message-ID: <7ca43ebb-5944-4542-89d4-9f826997d2a5@xen.org>
Date: Tue, 5 Aug 2025 21:57:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/arm: irq: drop unreachable pirq callbacks
Content-Language: en-GB
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Denis Mukhin <dmukhin@ford.com>
References: <20250805184003.202839-1-grygorii_strashko@epam.com>
 <20250805184003.202839-2-grygorii_strashko@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250805184003.202839-2-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/08/2025 19:40, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Since commit 341f271cf86f ("xen/evtchn: fully restrict concept of pIRQ for
> arches with pIRQ support only"), the corresponding Arm arch pIRQ callbacks
> become unreachable, so drop them.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Denis Mukhin <dmukhin@ford.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


