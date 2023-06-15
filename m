Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C4C73211B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 22:54:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549872.858659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9tyg-0000NO-10; Thu, 15 Jun 2023 20:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549872.858659; Thu, 15 Jun 2023 20:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9tyf-0000Jo-TZ; Thu, 15 Jun 2023 20:53:57 +0000
Received: by outflank-mailman (input) for mailman id 549872;
 Thu, 15 Jun 2023 20:53:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q9tye-0000Ja-86
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 20:53:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9tyd-000797-5T; Thu, 15 Jun 2023 20:53:55 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.16.225]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9tyc-0002kS-W4; Thu, 15 Jun 2023 20:53:55 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=CTS99/u756TBpDALqIcy1/WVxDnbX9qs3OsdD7DgVLw=; b=RHIKSF50lHp8X+Ih4aBjipnirW
	dZhFFH833LcJOjbUeCxZWNpfaXv5f07dDr7GIEU/7HGh66ANKuo6Ha3akXKacPPuZzLdFoQjoTfgU
	3ECKX02LMKfJDvp76QSLU1fmacqrhXXgDO0LInx+D3V+FE2gjirJJe61KH/SbEJZl0W4=;
Message-ID: <e146bce9-173c-acf2-09ef-e1aa63311f7c@xen.org>
Date: Thu, 15 Jun 2023 21:53:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] xen: Append a newline character to panic() where missing
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230614073018.21303-1-michal.orzel@amd.com>
 <261ab0b0-91ed-e6b7-730f-0ecb8a7b5635@citrix.com>
 <e9353bd5-a0c2-0451-0c7c-8778b3c285f5@amd.com>
 <4925a406-3b06-792f-008e-77503ca230f0@xen.org>
 <ce65ba3c-c3c6-dd89-534b-2caaf52ba256@amd.com>
 <5b4c98fb-9f81-ab30-29b4-ad8b9587b96b@xen.org>
In-Reply-To: <5b4c98fb-9f81-ab30-29b4-ad8b9587b96b@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/06/2023 10:09, Julien Grall wrote:
> The patch looks fine. I will commit it a bit later just to give a chance 
> to Bertrand/Stefano to object.

And committed.

Cheers,

-- 
Julien Grall

