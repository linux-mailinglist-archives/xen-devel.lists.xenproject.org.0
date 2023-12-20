Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 634C2819E5C
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 12:44:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657711.1026745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuzf-0006WP-Fr; Wed, 20 Dec 2023 11:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657711.1026745; Wed, 20 Dec 2023 11:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuzf-0006UL-Cn; Wed, 20 Dec 2023 11:44:07 +0000
Received: by outflank-mailman (input) for mailman id 657711;
 Wed, 20 Dec 2023 11:44:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFuzd-0006UD-CA
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 11:44:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFuzc-0003KD-C6; Wed, 20 Dec 2023 11:44:04 +0000
Received: from 82-132-247-3.dab.02.net ([82.132.247.3] helo=[172.20.10.6])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFuzc-0001wA-2t; Wed, 20 Dec 2023 11:44:04 +0000
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
	bh=8cl2K5A44Wc2FBRQ6BGrUrkUFCrEqbaolUxhSbaeM3Y=; b=5ezQKJ2SrfcX1oyPgTAJ2SC9z8
	Py5wzTnZcmnP3qL/1LbHyMnm0ONatOKtViFYA02HPH4ycyAC9lXJgQmK8yuA+llLdw5kzSV7scEsy
	464T0VDHPChgnUSUqzCaUWZdQU0AcOAixoDXPeckiymaZcB5Ky4fvblp2BNqVn6cicTo=;
Message-ID: <b5d700d9-7e34-4ec4-9e8a-bdbd378da8ee@xen.org>
Date: Wed, 20 Dec 2023 11:44:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/7] xen/arm: traps: address violations of MISRA
 C:2012 Rule 16.3
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1703066935.git.federico.serafini@bugseng.com>
 <90c6cdb780ff7b75aada2a8a8a2df5d9e8b94b78.1703066935.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <90c6cdb780ff7b75aada2a8a8a2df5d9e8b94b78.1703066935.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/12/2023 11:03, Federico Serafini wrote:
> MISRA C:2012 Rule 16.3 states: "An unconditional `break' statement
> shall terminate every switch-clause".
> 
> Add missing break statements to address violations of Rule 16.3.
> Add pseudo-keyword "fallthrough" to make explicit the intended
> behavior and satisfy the requirements to deviate Rule 16.3.
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

