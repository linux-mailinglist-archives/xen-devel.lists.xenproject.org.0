Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5E55AF183
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 19:04:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399992.641481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVbzN-00025O-Gb; Tue, 06 Sep 2022 17:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399992.641481; Tue, 06 Sep 2022 17:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVbzN-00023a-DV; Tue, 06 Sep 2022 17:03:53 +0000
Received: by outflank-mailman (input) for mailman id 399992;
 Tue, 06 Sep 2022 17:03:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVbzM-00023U-3a
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 17:03:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVbzL-0008I2-AH; Tue, 06 Sep 2022 17:03:51 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.11.176]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVbzL-0003kL-3p; Tue, 06 Sep 2022 17:03:51 +0000
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
	bh=GBPrQv9t/0DaG3asVLYtXAKvox9Tzk/QbmxUg+pM8sU=; b=es+wTLA234smCGUGr+VPCFYCxJ
	XziBoCnrXNdm8DKf3vfMZNOQ4LRxOq+kIJDCi23pDeTRz41JOou9pVPw08F/VZYeIE3DR99zq1Q8f
	3U1BoGnhAVFjAbNb7r+bRehX7q+tvcOJVu4GECfT8GjcHq2uFo69rRmuMmMdPT3QxGbw=;
Message-ID: <0da6388f-980a-9d6a-dedd-0af8e62887b6@xen.org>
Date: Tue, 6 Sep 2022 18:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v12 0/6] populate/unpopulate memory when domain on static
 allocation
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220906073919.941934-1-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220906073919.941934-1-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 06/09/2022 08:39, Penny Zheng wrote:
> Penny Zheng (6):
>    xen: do not free reserved memory into heap
>    xen/arm: introduce CDF_staticmem
>    xen: unpopulate memory when domain is static
>    xen: introduce prepare_staticmem_pages
>    xen: rename free_staticmem_pages to unprepare_staticmem_pages
>    xen: retrieve reserved pages on populate_physmap

The series is now committed.

Cheers,

-- 
Julien Grall

