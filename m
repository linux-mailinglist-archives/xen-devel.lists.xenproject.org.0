Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A18D8742F44
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 23:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557108.870185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEyrr-0006bK-6q; Thu, 29 Jun 2023 21:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557108.870185; Thu, 29 Jun 2023 21:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEyrr-0006YJ-2G; Thu, 29 Jun 2023 21:07:55 +0000
Received: by outflank-mailman (input) for mailman id 557108;
 Thu, 29 Jun 2023 21:07:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qEyrq-0006YD-2w
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 21:07:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEyrp-0007u2-Gg; Thu, 29 Jun 2023 21:07:53 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEyrp-0002qb-Be; Thu, 29 Jun 2023 21:07:53 +0000
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
	bh=OvAFaG7rjnyi6yQP+pSFNkug5d3ywrOaJQBWGUXIeNc=; b=i3US706zm8402XUp39xd4QMf29
	6qizPa7egZaGc92q7kuKe6SeuNqlBikjDxxDJ/39die+Pm4jbjq11BxCAzcdur0vkxH9S1HlvosJt
	2xVQ9KD+5K6Ab2S5HhGvzBLHUt8IlpuWGbYuyQb8lQowwEBkzaeyiznUeHWR4unLEwG4=;
Message-ID: <feb7a6cf-9742-1e05-ae88-d653702e7f0d@xen.org>
Date: Thu, 29 Jun 2023 22:07:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN v2] xen/arm: arm32: Allow Xen to boot on unidentified CPUs
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230626181444.2305769-1-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2306281600250.3936094@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2306281600250.3936094@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29/06/2023 00:00, Stefano Stabellini wrote:
> On Mon, 26 Jun 2023, Ayan Kumar Halder wrote:
>> Currently if the processor id is not identified (ie it is missing in proc-v7.S)
>> , then Xen boot fails quite early.
>> We have removed this restriction as for some CPUs (eg Cortex-R52), there isn't
>> any special initialization required.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I have committed it.

Cheers,

-- 
Julien Grall

