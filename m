Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 193B364DA78
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 12:36:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463310.721476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5mXT-0006qF-TE; Thu, 15 Dec 2022 11:36:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463310.721476; Thu, 15 Dec 2022 11:36:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5mXT-0006nW-Q6; Thu, 15 Dec 2022 11:36:35 +0000
Received: by outflank-mailman (input) for mailman id 463310;
 Thu, 15 Dec 2022 11:36:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5mXS-0006nQ-86
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 11:36:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5mXR-0000Wb-Vp; Thu, 15 Dec 2022 11:36:33 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224] helo=[10.85.36.201])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5mXR-0007cP-Q6; Thu, 15 Dec 2022 11:36:33 +0000
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
	bh=G0hyqitgQIcFjn8b8TvD4WXfpdebuN8X05wM0wp9Rtk=; b=39CJvUl/kA9VX2LrYLDHvqLcoo
	qfigoLKWeyaOiA6mYwG1GV+dFPFdlNuVmeaaeayhxB7pW0lOhyofZKMvtdaKll7YnqMRcF279UQPu
	Z/EpS5ms6fFjCPKCmh9PYo+ah0FWxJhMN1f81gP4cgYlJeLQUfYgZcSX6ATgZ3LrKe9k=;
Message-ID: <e1e4a666-7c1d-86d2-927a-2e059bfa0e5b@xen.org>
Date: Thu, 15 Dec 2022 11:36:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2] xen/arm: efi-boot misra rule 4.1 fix
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>, bertrand.marquis@arm.com
Cc: Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org,
 jbeulich@suse.com, Luca.Fancellu@arm.com,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <20221209222552.3353993-1-sstabellini@kernel.org>
 <25584924-2701-dfcc-58c1-b9a0e4036fc1@xen.org>
In-Reply-To: <25584924-2701-dfcc-58c1-b9a0e4036fc1@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/12/2022 11:10, Julien Grall wrote:
> Hi Stefano,
> 
> On 09/12/2022 22:25, Stefano Stabellini wrote:
>> We have 3 violations of MISRA C Rule 4.1 ("Octal and hexadecimal escape
>> sequences shall be terminated") in xen/arch/arm/efi/efi-boot.h. Fix them
>> and take the opportunity to declare them as static const __initconst and
>> improve the style.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Committed.

Cheers,

-- 
Julien Grall

