Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E87160D53A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 22:06:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430206.681620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onQBe-00030d-IK; Tue, 25 Oct 2022 20:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430206.681620; Tue, 25 Oct 2022 20:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onQBe-0002yW-Eg; Tue, 25 Oct 2022 20:06:10 +0000
Received: by outflank-mailman (input) for mailman id 430206;
 Tue, 25 Oct 2022 20:06:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1onQBc-0002yQ-UM
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 20:06:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1onQBb-0002jl-Qg; Tue, 25 Oct 2022 20:06:07 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.95.108.38])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1onQBb-0006Ph-KX; Tue, 25 Oct 2022 20:06:07 +0000
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
	bh=5sBGVx029vIAkKNQa85YA992R3kBkhdM8wBN1+kGVlQ=; b=MkKKKp+hs458lgoTNgl1F9DLXU
	Lu7sbMApBpiYxV8gPcAeujd6629fIpgbdeXjO9vnY7vjyxrUruhuQVPQ8XYkj4n62zzkKomqcccoq
	lLqtVaDmHeZ8cnxBG2MAB062jy905ypoX1oh3inPuXY4s7ZQH1v6QZRXgp1hg7E4pnrU=;
Message-ID: <9bec8877-25d2-8d50-6f03-523b806642b2@xen.org>
Date: Tue, 25 Oct 2022 21:06:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH for-4.14-to-4.16 0/2] Backports for XSA-409 fixes
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221025092112.50168-1-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221025092112.50168-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 25/10/2022 10:21, Henry Wang wrote:
> This series is a backported series for XSA-409 fixes from master for
> 4.14 to 4.16, which cherry-picking commits:
> 3783e583319f arm/p2m: Rework p2m_init()
> c7cff1188802 xen/arm: p2m: Populate pages for GICv2 mapping in p2m_init()

I have merged the 2 patches in Xen 4.16, 4.15 and 4.14. I noticed that 
the "released-acked-by" tags were removed.

We usually keep the commit message as-is (including tags). But I vaguely 
remember that we may have stripped the "released-acked-by" tag in the 
past. So I left it alone.

Also, it looks like the tools I am using to download the patches (b4) 
decided to move the "cherry-picked ..." line before the tags. I am not 
entirely sure why... So I have modified the commit message to re-add the 
line where you initially added (this is the correct place!).

Cheers,

-- 
Julien Grall

