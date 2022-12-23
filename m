Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1583655362
	for <lists+xen-devel@lfdr.de>; Fri, 23 Dec 2022 18:57:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468998.728230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8mHo-0005IH-2w; Fri, 23 Dec 2022 17:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468998.728230; Fri, 23 Dec 2022 17:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8mHn-0005Eq-WB; Fri, 23 Dec 2022 17:56:47 +0000
Received: by outflank-mailman (input) for mailman id 468998;
 Fri, 23 Dec 2022 17:56:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p8mHm-0005Ek-66
 for xen-devel@lists.xenproject.org; Fri, 23 Dec 2022 17:56:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p8mHl-00042W-Rm; Fri, 23 Dec 2022 17:56:45 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.3.230]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p8mHl-0003oo-M0; Fri, 23 Dec 2022 17:56:45 +0000
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
	bh=bt61lqVJ2EW8ganxxeyBXG4uFMwk60qF7HYvxm5i8gI=; b=PR1LVzAEBckfuzrjru362lpUnR
	rWziROpKGe1h3rFVqXF0sGMpt6dQvUOVKupGIe8OwHFzP7Rg0K3AWUyozEkRf/go05lKk+pCdivJo
	NT95AnMqtroWcMK7DsZiU7Tyo7bCjyNB6P69qnGUqJRe62qMhye/5sQUpSxjGbhGZsDQ=;
Message-ID: <3e0ba92c-1aae-4d2e-5346-16a96a482d03@xen.org>
Date: Fri, 23 Dec 2022 17:56:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v5 0/2] xen/arm: refine vpl011
Content-Language: en-US
To: Jiamei Xie <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221205072640.2092473-1-jiamei.xie@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221205072640.2092473-1-jiamei.xie@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jiamei,

On 05/12/2022 07:26, Jiamei Xie wrote:
> This patch is the version 5 for "xen/arm: vpl011: Make access to DMACR
> write-ignore" [1].
> 
> [1] https://patchwork.kernel.org/project/xen-devel/patch/20221122054644.1092173-1-jiamei.xie@arm.com/

Sorry, it looks like I forgot to commit this series.

It is now committed. @Stefano, I think we should consider at least patch 
#1 for backport to stable branches.

Cheers,

-- 
Julien Grall

