Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101C77DE60D
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 19:42:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626611.977004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyGAb-0004ZS-1H; Wed, 01 Nov 2023 18:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626611.977004; Wed, 01 Nov 2023 18:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyGAa-0004Xn-Uo; Wed, 01 Nov 2023 18:42:24 +0000
Received: by outflank-mailman (input) for mailman id 626611;
 Wed, 01 Nov 2023 18:42:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qyGAZ-0004Xh-00
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 18:42:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qyGAY-0001Fg-Fo; Wed, 01 Nov 2023 18:42:22 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[10.95.171.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qyGAY-0002FT-99; Wed, 01 Nov 2023 18:42:22 +0000
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
	bh=9ZJy9dJgc7ELq9aSstnooVKsivoGZIydLSWX968Xm30=; b=Kgm7JQdkvrvU0fq5zvl6AVNaVz
	jrkep+aSSXdo+TNAbpTyVzH27SY7nuO0O0obYljECZnuf75XxrOHiyv05VA1r6Ssm9jbR4tGPNaRd
	mK0lwplyaZPvVykxhgxiGUyizi30bm3QfdIR07b8DRqtO90Hxcf5AZ6UDVxe+tWp7jbk=;
Message-ID: <22d8c9dc-9356-4274-a372-066e072ac764@xen.org>
Date: Wed, 1 Nov 2023 18:42:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] xen/arm: Add asm/domain.h include to kernel.h
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230927140133.631192-1-luca.fancellu@arm.com>
 <20230927140133.631192-3-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230927140133.631192-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 27/09/2023 15:01, Luca Fancellu wrote:
> The 'enum domain_type' is defined by 'asm/domain.h' which is not
> included (directly or indirectly) by 'asm/kernel.h'.
> 
> This currently doesn't break the compilation because asm/domain.h will
> included by the user of 'kernel.h'. But it would be better to avoid
> relying on it. So add the include in 'asm/domain.h'.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

