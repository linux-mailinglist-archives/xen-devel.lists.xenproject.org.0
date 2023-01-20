Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 946EE675619
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 14:46:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481794.746922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIrib-0001fB-Hx; Fri, 20 Jan 2023 13:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481794.746922; Fri, 20 Jan 2023 13:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIrib-0001ce-ER; Fri, 20 Jan 2023 13:46:09 +0000
Received: by outflank-mailman (input) for mailman id 481794;
 Fri, 20 Jan 2023 13:46:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pIriZ-0001cY-AI
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 13:46:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pIriZ-0006Oq-9b
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 13:46:07 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[10.95.149.154]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIriZ-0007uq-2X; Fri, 20 Jan 2023 13:46:07 +0000
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
	bh=PkKClvn0TmK4UC9rmACrc8YkEzZI50VmbuTaob+NRsg=; b=r/naC4uVnoNY7B8Gz/LdDjQPjA
	IlqAkcMvduqdqfPrjoE6sYXb9H75UaEF0o25ZKkIey7FwZsce1ClrXsN6lF0OUO800x9agFPj+yNu
	yhl3OaqfZ+soBlTIFPp4j/oGdjTiP/+IAE3Y66bPjbRwHA2N4+jkLe28VPhyTwhGRZ/c=;
Message-ID: <8c23e40b-5892-afb0-15d0-70bad98f640d@xen.org>
Date: Fri, 20 Jan 2023 13:46:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 0/3] xen/arm: Frametable hardening and config.h cleanup
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230117114332.25863-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230117114332.25863-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/01/2023 11:43, Michal Orzel wrote:
> The first patch fixes a bug due to incorrect DIRECTMAP_SIZE calculation.
> 
> The second patch removes unused macro FRAMETABLE_VIRT_END.
> 
> The third patch hardens the setup_frametable_mappings by adding a sanity check
> for the size of struct page_info and calling panic if the calculate size of
> the frametable exceeds the limit.
> 
> Sent together for ease of merging.
> 
> Michal Orzel (3):
>    xen/arm64: Fix incorrect DIRECTMAP_SIZE calculation
>    xen/arm32: Remove unused macro FRAMETABLE_VIRT_END
>    xen/arm: Harden setup_frametable_mappings

I have committed the series.

Cheers,

-- 
Julien Grall

