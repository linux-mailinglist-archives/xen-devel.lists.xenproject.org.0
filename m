Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B7B56BD2B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 18:04:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363571.594176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9qT4-0001dX-Mb; Fri, 08 Jul 2022 16:04:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363571.594176; Fri, 08 Jul 2022 16:04:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9qT4-0001bj-Jk; Fri, 08 Jul 2022 16:04:34 +0000
Received: by outflank-mailman (input) for mailman id 363571;
 Fri, 08 Jul 2022 16:04:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o9qT3-0001bd-6U
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 16:04:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o9qT1-0007oq-IK; Fri, 08 Jul 2022 16:04:31 +0000
Received: from [54.239.6.184] (helo=[192.168.18.9])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o9qT1-00066S-C6; Fri, 08 Jul 2022 16:04:31 +0000
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
	bh=rzbOg72Z2GgK1xdreJJj7KZCOASVERvaMdhhLOzBo6s=; b=BQorHkv2+XKYTZwAvBd5DKlhoX
	J0TNucsjO802roiNNksMXOXrnkDq8Ft8xVi+wIxAXSJd+gMCU/FveUquBhNPaGgJLXrT3vLLv7Lkd
	hlBYOO/xKyuOv+LZFjFBVkPcS+rPOnfhUFb2jvWTimXXHAUWqkryOGnfx+6vw0aS9vGA=;
Message-ID: <84efdf22-1e28-040f-a41d-0c3709e6b60b@xen.org>
Date: Fri, 8 Jul 2022 17:04:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] automation: arm64: Create a test job for testing
 static allocation on qemu
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
References: <20220707203803.798317-1-burzalodowa@gmail.com>
 <20220707203803.798317-3-burzalodowa@gmail.com>
 <259c9042-4a40-ddd3-5e3c-7a1698df74c4@xen.org>
 <alpine.DEB.2.22.394.2207071548220.2354836@ubuntu-linux-20-04-desktop>
 <d3f2e9b2-219b-d00b-04fd-f8e6a38222e4@gmail.com>
 <alpine.DEB.2.22.394.2207080850510.2354836@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2207080850510.2354836@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/07/2022 16:56, Stefano Stabellini wrote:
> Or we could add a script to detect and print specific output but I
> don't know if there is something under /proc or /sys that we could
> simply "cat" from bash to check it.

The domain device-tree should be /proc/device-tree. So you could check 
the properties from there.

Cheers,

-- 
Julien Grall

