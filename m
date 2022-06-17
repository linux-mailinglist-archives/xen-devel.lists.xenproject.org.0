Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B74554F342
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 10:43:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351150.577717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o27ZJ-0002vX-2b; Fri, 17 Jun 2022 08:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351150.577717; Fri, 17 Jun 2022 08:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o27ZI-0002sR-UU; Fri, 17 Jun 2022 08:43:04 +0000
Received: by outflank-mailman (input) for mailman id 351150;
 Fri, 17 Jun 2022 08:43:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o27ZH-0002sL-AV
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 08:43:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o27ZG-0006hy-SS; Fri, 17 Jun 2022 08:43:02 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.0.243]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o27ZG-0006vp-Mi; Fri, 17 Jun 2022 08:43:02 +0000
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
	bh=cayx7TCsotA4ywUtxUHTncfYJiL0245ngkc8VWGVtao=; b=10IXOBfDO5M6DDjxWkXr8VP0XK
	0v1ih/b9jJi60zIslYKy5q4Isv8WNpELLJ747MeXjue+tdR2tYXQPB6Szo8cRFdgAposSeVl09dRO
	n+M4jXt0s/1Nmqt7fOH2EYvfgD6T/XDqFW0asZYKqBGf0+idejeNIM15rlImB5keu8KE=;
Message-ID: <3cbfb656-419d-15cc-c1da-d826f08ccb77@xen.org>
Date: Fri, 17 Jun 2022 09:43:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v6 0/8] Device tree based NUMA support for Arm - Part#1
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <20220610055316.2197571-1-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220610055316.2197571-1-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wei,

On 10/06/2022 06:53, Wei Chen wrote:
> Wei Chen (8):
>    xen: reuse x86 EFI stub functions for Arm
>    xen/arm: Keep memory nodes in device tree when Xen boots from EFI
>    xen: introduce an arch helper for default dma zone status
>    xen: decouple NUMA from ACPI in Kconfig
>    xen/arm: use !CONFIG_NUMA to keep fake NUMA API
>    xen/x86: use paddr_t for addresses in NUMA node structure
>    xen/x86: add detection of memory interleaves for different nodes
>    xen/x86: use INFO level for node's without memory log message

I have committed the series.

Thanks for the contribution.

Cheers,

-- 
Julien Grall

