Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C9C9A255A
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 16:44:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820670.1234224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Rjz-0003Rd-AS; Thu, 17 Oct 2024 14:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820670.1234224; Thu, 17 Oct 2024 14:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Rjz-0003Q7-7W; Thu, 17 Oct 2024 14:44:39 +0000
Received: by outflank-mailman (input) for mailman id 820670;
 Thu, 17 Oct 2024 14:44:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t1Rjx-0003Od-N2
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 14:44:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1Rjv-0004S1-MJ; Thu, 17 Oct 2024 14:44:35 +0000
Received: from [15.248.2.232] (helo=[10.24.67.20])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1Rjv-0001kV-Fg; Thu, 17 Oct 2024 14:44:35 +0000
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
	bh=Bq15AjW1I70zV9leCjVzVYgsNUWiD9ibvqXqb9GOexw=; b=AUYlbYeYfShNplSvG3mrxV9CE+
	Q0nq7YgZx/LS6eZ2+X2Hcr8tTeqxX4tsfcGkgf8U8gLUSTQoSHNXEYUa/dlI6tkgVGU+oH44zGOo+
	x6pehLkY2oC2URHVjQOZeL0sce1p+VYis0JpxCFTEmiGj/yuMxY20tgTqWFeulnUfe7I=;
Message-ID: <96434f92-951f-4c62-b7b7-f15a9bf94029@xen.org>
Date: Thu, 17 Oct 2024 15:44:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] device-tree: Move dt-overlay.c to common/device-tree/
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20241010105746.140921-1-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2410101248160.471028@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2410101248160.471028@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/10/2024 20:48, Stefano Stabellini wrote:
> On Thu, 10 Oct 2024, Michal Orzel wrote:
>> The code is DT specific and as such should be placed under common
>> directory for DT related files. Update MAINTAINERS file accordingly
>> and drop the line with a path from a top-level comment in dt-overlay.c.
>> It serves no purpose and requires being updated on every code movement.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

This is now committed.

Cheers,

-- 
Julien Grall


