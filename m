Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F60648883
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 19:35:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458163.716035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3iCl-0001wK-T3; Fri, 09 Dec 2022 18:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458163.716035; Fri, 09 Dec 2022 18:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3iCl-0001tn-QO; Fri, 09 Dec 2022 18:34:39 +0000
Received: by outflank-mailman (input) for mailman id 458163;
 Fri, 09 Dec 2022 18:34:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p3iCk-0001tg-8y
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 18:34:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p3iCh-0001G6-US; Fri, 09 Dec 2022 18:34:35 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.4.46])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p3iCh-00019N-Oa; Fri, 09 Dec 2022 18:34:35 +0000
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
	bh=AATmCSC6YWykJrYJS/oQQNjW9bLDEXy63USLEXSmboI=; b=jf6YU0GJZC+YBzEyVaMHYbs7dU
	MYn8hqnVsdH5O+huCgW+2UFPlgAXh8ZL6pJ/P1XwtQInBaAGcxsPj2V1R/wXILf7KplaHZ4q/XZr2
	X2CYspWXOrD2AEDVP6T4jxv46igQAICsNAwLr90TyZjVnqcacpN95v32y5gy40ydkfBI=;
Message-ID: <3bd3e14b-5bc6-b54d-6754-6ace7fa93bbc@xen.org>
Date: Fri, 9 Dec 2022 18:34:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] xen/arm: efi-boot misra rule 4.1 fix
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org,
 bertrand.marquis@arm.com
References: <alpine.DEB.2.22.394.2212081538310.2965472@ubuntu-linux-20-04-desktop>
 <ddb12b37-fef4-b603-6a8a-ed474757c5b4@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ddb12b37-fef4-b603-6a8a-ed474757c5b4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/12/2022 09:04, Jan Beulich wrote:
> On 09.12.2022 01:41, Stefano Stabellini wrote:
>> We have 3 violations of MISRA C Rule 4.1 ("Octal and hexadecimal escape
>> sequences shall be terminated") in xen/arch/arm/efi/efi-boot.h. Fix
>> them.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> While I certainly agree, I wonder if you don't want to correct style
> (missing blank line after every one of these declarations) as well as
> data placement (all three should imo be static __initconst) at the
> same time.

+1. And use 'const' as well :).

Cheers,

-- 
Julien Grall

