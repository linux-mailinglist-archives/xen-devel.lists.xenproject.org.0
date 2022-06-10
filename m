Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB0D54610E
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 11:10:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346047.571768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzaeV-0001JX-L2; Fri, 10 Jun 2022 09:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346047.571768; Fri, 10 Jun 2022 09:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzaeV-0001Hb-Hn; Fri, 10 Jun 2022 09:09:59 +0000
Received: by outflank-mailman (input) for mailman id 346047;
 Fri, 10 Jun 2022 09:09:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nzaeU-0001HV-Sl
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 09:09:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzaeU-0004na-L9; Fri, 10 Jun 2022 09:09:58 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.23.251]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzaeU-0000PT-FR; Fri, 10 Jun 2022 09:09:58 +0000
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
	bh=2Jd1FXCCivjU8G/FVgbQacl2ETTk0v/5XHWSeEw9jBw=; b=lFB+jCriQJUvmItGGFdbQvasWw
	yIcQb/ecYpvKABJ7lr8ctAkfobTyh02/PqEE+EZrdcWyo4Qf6a2v8PmK9HMhzRm35ipD/MESllwUp
	GCbykdKNF3l25N5ikplKL3Wgj/qAM66W0GDmjl5ouZm8P8n5ROKLtBSe7Zt7XOTh1g4E=;
Message-ID: <79b286dd-8d79-093b-2bad-e12d237bc1f6@xen.org>
Date: Fri, 10 Jun 2022 10:09:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] xen/arm: traps: Fix reference to invalid erratum ID
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220610083358.101412-1-michal.orzel@arm.com>
 <20220610083358.101412-2-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220610083358.101412-2-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 10/06/2022 09:33, Michal Orzel wrote:
> The correct erratum ID should be 834220.
> 
> Fixes: 0a7ba2936457 ("xen/arm: arm64: Add Cortex-A57 erratum 834220 workaround")

Despite my answer in #2, this is one of the exception where I would keep 
the fixes tag because we should try to keep the documentation correct 
even in stable trees (this is more important than typo in names).

> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

