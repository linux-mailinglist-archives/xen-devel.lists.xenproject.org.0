Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 645558FC70A
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2024 10:55:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735608.1141728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEmQI-0002hx-5a; Wed, 05 Jun 2024 08:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735608.1141728; Wed, 05 Jun 2024 08:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEmQI-0002fm-2p; Wed, 05 Jun 2024 08:55:10 +0000
Received: by outflank-mailman (input) for mailman id 735608;
 Wed, 05 Jun 2024 08:55:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sEmQG-0002fg-TV
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2024 08:55:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sEmQG-0002Vm-Bn; Wed, 05 Jun 2024 08:55:08 +0000
Received: from [62.28.225.65] (helo=[172.20.145.71])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sEmQG-0004pS-42; Wed, 05 Jun 2024 08:55:08 +0000
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
	bh=7oWxHxgxOg5m6+msIJmhdgnSMo8PIyqw4Xd5D6cnUNA=; b=Ovx8r5+/Al4K3KcVimY2oTQkgF
	FbPwryPmE6E/0V7NPfelPZIT8IUU93FmcspIkxtgq2O8Nos97fmJR9PNn01RmxdR8uvmZ41QdZZ/h
	2clJdI62LQ45cSrgyiZOLYj5hALuV/bK1j48JW2EF0SWr1qQ5NzrHDavhYokVmTx/O6U=;
Message-ID: <68d27e3a-5715-47d8-8ae4-a36ed9ad71cd@xen.org>
Date: Wed, 5 Jun 2024 09:55:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] xen/arm: smmuv3: Mark more init-only functions
 with __init
Content-Language: en-GB
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, edgar.iglesias@amd.com
References: <20240522132829.1278625-1-edgar.iglesias@gmail.com>
 <20240522132829.1278625-2-edgar.iglesias@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240522132829.1278625-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Edgar,

On 22/05/2024 14:28, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Move more functions that are only called at init to
> the .init.text section.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

This also needs a reviewed-by from either Bertrand or Rahul.

Cheers,

-- 
Julien Grall

