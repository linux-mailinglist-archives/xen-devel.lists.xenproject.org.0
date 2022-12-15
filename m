Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFC764DA40
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 12:29:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463280.721443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5mPy-0003qa-HV; Thu, 15 Dec 2022 11:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463280.721443; Thu, 15 Dec 2022 11:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5mPy-0003og-Ec; Thu, 15 Dec 2022 11:28:50 +0000
Received: by outflank-mailman (input) for mailman id 463280;
 Thu, 15 Dec 2022 11:28:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5mPw-0003oa-Fl
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 11:28:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5mPv-0000LP-TT; Thu, 15 Dec 2022 11:28:47 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224] helo=[10.85.36.201])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5mPv-0007Eq-I5; Thu, 15 Dec 2022 11:28:47 +0000
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
	bh=R1q7AVfpptThFItoUodJypQXobnZpAEV0d/Tob0b+Yc=; b=MX5xDf7abfhIAsAIicWcK1G3Xb
	ariCxkrUXDT2aPONXhZTWc4rblCyIwXv/KvWsFM3QsH9X46GzQdEN/sFG2aNGFHMDU+25gkIvccmJ
	pQmQLm4egIuykXRhzC35wHSSgX2HxBy5Lgq1RtP359EdwW+PidJCUci6oEwRb7AUS+wk=;
Message-ID: <0755f61b-693b-7410-48c3-9162163030c7@xen.org>
Date: Thu, 15 Dec 2022 11:28:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [XEN v5 00/11] Arm: Enable GICv3 for AArch32
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, michal.orzel@amd.com, jgrall@amazon.com,
 burzalodowa@gmail.com
References: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/12/2022 13:26, Ayan Kumar Halder wrote:
> Hi All,

Hi Ayan,

> Please find the following patches to enable GICv3 for AArch32.
> This is a pre-requisite to support Xen on Cortex-R52 (AArch32-v8R system)
> 
> Let me know your thoughts.

The series is now merged.

Cheers,

-- 
Julien Grall

