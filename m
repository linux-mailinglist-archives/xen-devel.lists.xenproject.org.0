Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA9C675135
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 10:33:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481523.746470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pInlZ-000316-2e; Fri, 20 Jan 2023 09:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481523.746470; Fri, 20 Jan 2023 09:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pInlY-0002yT-VA; Fri, 20 Jan 2023 09:32:56 +0000
Received: by outflank-mailman (input) for mailman id 481523;
 Fri, 20 Jan 2023 09:32:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pInlX-0002yN-LJ
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 09:32:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pInlX-0000Rz-82; Fri, 20 Jan 2023 09:32:55 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[10.95.149.154]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pInlX-0004Wl-1m; Fri, 20 Jan 2023 09:32:55 +0000
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
	bh=RpPR80D3Ywf5Fal28CowYgkKbe1D5uUb1nC+b/0ocR0=; b=qrrdn8vg8gNGEVI5VTulNjDNRj
	6KYO3sCXgE/76cy8u9lH5Ir4qfiW+gf9wNuRR78ON30Quxylcr7o6TQ2H/fosQGnoBYzQuV2WtQYI
	K69ZZdhF0RUx5M8nHSIPqEkUFKo5V4gn9chCXqEdLI1rhbbEoCKC1XUmdIAxT0mrmrps=;
Message-ID: <c7e5fbf3-9e90-7008-0299-f53b20566b9a@xen.org>
Date: Fri, 20 Jan 2023 09:32:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v2 02/11] xen/arm: Use the correct format specifier
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-3-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2301191454080.731018@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2301191454080.731018@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/01/2023 22:54, Stefano Stabellini wrote:
> On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
>> 1. One should use 'PRIpaddr' to display 'paddr_t' variables.
>> 2. One should use 'PRIx64' to display 'u64' in hex format. The current
>> use of 'PRIpaddr' for printing PTE is buggy as this is not a physical
>> address.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


I have committed the patch.

Cheers,

-- 
Julien Grall

