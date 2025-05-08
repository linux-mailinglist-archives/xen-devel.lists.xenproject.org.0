Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E24AAF65E
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 11:10:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979091.1365797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCxGU-0001Qz-SI; Thu, 08 May 2025 09:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979091.1365797; Thu, 08 May 2025 09:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCxGU-0001MH-OU; Thu, 08 May 2025 09:10:02 +0000
Received: by outflank-mailman (input) for mailman id 979091;
 Thu, 08 May 2025 09:10:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uCxGT-0001A0-BB
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 09:10:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uCxGS-00HEPn-39;
 Thu, 08 May 2025 09:10:00 +0000
Received: from [2a02:8012:3a1:0:463:6943:9e59:fb6a]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uCxGS-008tjr-2G;
 Thu, 08 May 2025 09:10:00 +0000
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
	bh=vfRRyw0qdZFdT9DSzbietHI+ijxHfe3kBhKAJ4oazgI=; b=fZPRb33yC3nBeznYt7X3WOkqPZ
	LqEfIH62zUWQSY+lx/HP8+smHpAQGKLMHMOlcwT4JdlNCi6UxGxWnBDGDv27WaQ8lKCsv6al27Rr1
	uMWV8ZAzVg1kiNl+P/96iuscfKLTeQfHXg6bocxbgyaKVGLRyE/OUPpeSYfN1QqBs4Ig=;
Message-ID: <fa9dc817-7394-448b-8751-4c950d036af6@xen.org>
Date: Thu, 8 May 2025 10:09:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] device-tree: Add missing SPDX identifiers and EMACS
 comment blocks
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250506080752.23307-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250506080752.23307-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 06/05/2025 09:07, Michal Orzel wrote:
> Use the same license as the files from which the code originated during
> recent code movements. Take the opportunity to add SPDX identifier for
> device-tree.c and remove the license text.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


