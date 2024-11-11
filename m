Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A34009C3BC6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 11:18:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833470.1248624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tARV0-0006ek-OK; Mon, 11 Nov 2024 10:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833470.1248624; Mon, 11 Nov 2024 10:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tARV0-0006cC-LU; Mon, 11 Nov 2024 10:18:22 +0000
Received: by outflank-mailman (input) for mailman id 833470;
 Mon, 11 Nov 2024 10:18:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tARUz-0006bn-Ma
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 10:18:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tARUy-00015p-16;
 Mon, 11 Nov 2024 10:18:20 +0000
Received: from [2a02:8012:3a1:0:440f:f547:9226:a08e]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tARUy-0001mc-12;
 Mon, 11 Nov 2024 10:18:20 +0000
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
	bh=ietWmLYycllmS2mSyMvZwkOylV26P1xbB+aobozA0a4=; b=kFizLWwW9dWB6Jo+eJSWqgw9+W
	Fw9o5731VAGhEDoPc658yQxJAcB9Jr1UJbdwNCKgwAOEA3rQnTn9csdYH4tpE0DCCFCjhIiEg3q+b
	uLLaLt4YCHBSUBJ1JOSOgJ8BUhoxoKV8c5v/+6LBfP5pdN8R7ayK2oFeaHE3GT+PA4y4=;
Message-ID: <6ab4ad29-404d-4f5c-8582-5d2f492fd549@xen.org>
Date: Mon, 11 Nov 2024 10:17:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Add Renesas R8A779G0 (R-Car V4H)
 support
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>, gragst.linux@gmail.com
Cc: xen-devel@lists.xenproject.org,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20241107132501.724836-1-grygorii_strashko@epam.com>
 <alpine.DEB.2.22.394.2411071314270.89051@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2411071314270.89051@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/11/2024 21:14, Stefano Stabellini wrote:
> On Thu, 7 Nov 2024, gragst.linux@gmail.com wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Add Renesas R8A779G0 (R-Car V4H) IPMMU support.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Assuming it was properly tested:
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

It is now committed.

Cheers,

-- 
Julien Grall


