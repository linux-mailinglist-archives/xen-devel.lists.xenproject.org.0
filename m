Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8A5608B34
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 12:01:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428163.678036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omBJF-0000Hp-UL; Sat, 22 Oct 2022 10:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428163.678036; Sat, 22 Oct 2022 10:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omBJF-0000FJ-RB; Sat, 22 Oct 2022 10:00:53 +0000
Received: by outflank-mailman (input) for mailman id 428163;
 Sat, 22 Oct 2022 10:00:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omBJE-0000FD-FC
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 10:00:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omBJD-00009x-Sq; Sat, 22 Oct 2022 10:00:51 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omBJD-0005Zt-LI; Sat, 22 Oct 2022 10:00:51 +0000
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
	bh=fGc0cTgD0Ah+JdkVXzFVtAnxHUEGwmB4FgoQfhcSP20=; b=C+jk5WIBdheHSpZFbGLb9Ddzgb
	vfbMKtZ1K68tF6mF7r5Nrs0UYehbV51bL6rvJrhg1g5AtAsN10cD3uWbQYYMumZSqu8g8zwLoIWCu
	DkvK/3PRdJrqCLq6RAb1eYcGFK2C/k0gbK2cynbxeYFxS24v55BFhPtMzZEDd4wMalXM=;
Message-ID: <eaf6c1e1-a765-be2f-24d6-0f63050c17df@xen.org>
Date: Sat, 22 Oct 2022 11:00:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [RFC PATCH v1 01/12] Arm: GICv3: Sysreg emulation is applicable
 for Aarch64 only
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221021153128.44226-1-ayankuma@amd.com>
 <20221021153128.44226-2-ayankuma@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221021153128.44226-2-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 21/10/2022 16:31, Ayan Kumar Halder wrote:
> Refer ARM DDI 0487G.b ID072021, EC==0b011000 is supported for Aarch64 state
> only. This is when MSR, MRS, System instruction execution in AArch64 state
> is trapped, that is not reported using EC 0b000000, 0b000001 or 0b000111.

I don't understand the second sentence. However, what matter here is the 
fact the system registers are 64-bit only.

The change itself, looks ok to me.

Cheers,

-- 
Julien Grall

