Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 559227CA389
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 11:07:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617374.959907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsJZM-0007MA-8v; Mon, 16 Oct 2023 09:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617374.959907; Mon, 16 Oct 2023 09:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsJZM-0007Jv-6K; Mon, 16 Oct 2023 09:07:24 +0000
Received: by outflank-mailman (input) for mailman id 617374;
 Mon, 16 Oct 2023 09:07:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qsJZK-0007I4-E0
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 09:07:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsJZJ-0004lx-QD; Mon, 16 Oct 2023 09:07:21 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsJZJ-0004rw-Km; Mon, 16 Oct 2023 09:07:21 +0000
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
	bh=68sFD1jhVTvXNXUROfxCuZSBf9fl+0aRRxgft27HZWs=; b=Np2bSiQMdNqlMGG2dKYunUIIfC
	OWHkvgsg89H6vke0VhBxbYggBrPK9Q74q28g9nnsYHSBKuf2tTZIE+nZepUKTX9bKnoQ3JCLptLD5
	6fndkAi+5mqaQXGOgmv7aAeh+QJjRWMmJX2FeQ4QIFoEOxfLHhQScHJ0iN0alZQDJ4ck=;
Message-ID: <39d3f8e0-61cf-4b8d-84f1-a5087ba8ead4@xen.org>
Date: Mon, 16 Oct 2023 10:07:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 10/10] arm/smmu: address violation of MISRA C:2012
 Rule 8.2
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <henry.wang@arm.com>
References: <cover.1697207038.git.federico.serafini@bugseng.com>
 <199886f6ba1f2d5701eabd080b4f9723fc28f4b9.1697207038.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <199886f6ba1f2d5701eabd080b4f9723fc28f4b9.1697207038.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/10/2023 16:24, Federico Serafini wrote:
> Add missing parameter names, no functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>   xen/drivers/passthrough/arm/smmu.c | 6 +++---

This file is using the Linux coding style because it is imported from 
Linux. I was under the impression we would exclude such file for now.

Looking at exclude-list.json, it doesn't seem to be present. I think 
this patch should be replaced with adding a line in execlude-list.json.

Cheers,

-- 
Julien Grall

