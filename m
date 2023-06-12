Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A3672D36A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 23:36:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547659.855228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8pCQ-0005Ta-Ur; Mon, 12 Jun 2023 21:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547659.855228; Mon, 12 Jun 2023 21:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8pCQ-0005Re-RH; Mon, 12 Jun 2023 21:35:42 +0000
Received: by outflank-mailman (input) for mailman id 547659;
 Mon, 12 Jun 2023 21:35:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q8pCP-0005RV-GR
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 21:35:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q8pCP-0003l7-0i; Mon, 12 Jun 2023 21:35:41 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q8pCO-0004iI-R6; Mon, 12 Jun 2023 21:35:40 +0000
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
	bh=ACo9Eki9MYwH1etmxOZaOOvGtZp3qEuWxWHbHmq59sc=; b=pcxNmf+7tbAygRbUWEpf9PL/gg
	vtp+ugRJAXaRZtI3mV1h+pgbxm0aKd3i2bLI+8CjM/awchks1x/23sp79EXywfkfy3pP68dcFlboY
	JZkcz0UpCqQbUjgN05Ayh4gjb/L/eiHeXS36DBVPdSboDsI6E0u1TyZHh7Ay/C8B1qbU=;
Message-ID: <58c74c2c-e578-7534-79a6-1270e999434a@xen.org>
Date: Mon, 12 Jun 2023 22:35:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v2] xen/arm: rename guest_cpuinfo in domain_cpuinfo
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <a7703b52779c39fa64fb3872be873b9d0ca83fc1.1686574689.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a7703b52779c39fa64fb3872be873b9d0ca83fc1.1686574689.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 12/06/2023 14:00, Bertrand Marquis wrote:
> Rename the guest_cpuinfo structure to domain_cpuinfo as it is not only
> used for guests but also for dom0 so domain is a more suitable name.
> 
> While there also rename the create_guest_cpuinfo function to
> create_domain_cpuinfo to be coherent and fix comments accordingly.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

And committed.

Cheers,

-- 
Julien Grall

