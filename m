Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D13692601
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 20:02:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493618.763629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQYfO-0001QP-7n; Fri, 10 Feb 2023 19:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493618.763629; Fri, 10 Feb 2023 19:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQYfO-0001OR-4S; Fri, 10 Feb 2023 19:02:38 +0000
Received: by outflank-mailman (input) for mailman id 493618;
 Fri, 10 Feb 2023 19:02:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQYfN-0001OH-4d
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 19:02:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQYfM-00079H-Tq; Fri, 10 Feb 2023 19:02:36 +0000
Received: from [54.239.6.186] (helo=[192.168.26.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQYfM-0000dW-Me; Fri, 10 Feb 2023 19:02:36 +0000
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
	bh=1QRQJ1FQyrM3QlsVI/CPr4VYYyWlLkbTnFYWEK2PiUQ=; b=QS+64WPfE8dEudSxCJzLfYDss7
	8j3Ad09kL3nv0f5ZEyWGyqnaLt8g7o12UfkeOTJYKcBAHpfSxkHbFwC0fQprgrO19kjeVvquQvbKx
	zxkyT0d8g7P51EojTltFmLv6YVbROlZjMK60Ik+w6CihVIHHE6+ez86YxsUm6UlR87os=;
Message-ID: <0d29c301-497e-1868-ee98-e986b732d073@xen.org>
Date: Fri, 10 Feb 2023 19:02:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [XEN][RFC PATCH v4 03/16] libfdt: Keep fdt functions after init
 for CONFIG_OVERLAY_DTB.
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
References: <20221207061537.7266-1-vikram.garhwal@amd.com>
 <20221207061537.7266-4-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221207061537.7266-4-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/12/2022 06:15, Vikram Garhwal wrote:
> This is done to access fdt library function which are required for adding device
> tree overlay nodes for dynamic programming of nodes.
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

The tags are usually ordered chronologically: you first wrote the patch 
and then I acked. So please switch the two tags.

Cheers,

-- 
Julien Grall

