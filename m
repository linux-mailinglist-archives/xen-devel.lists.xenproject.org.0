Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAE3644B98
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 19:23:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455459.712938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2caa-0007ti-Gk; Tue, 06 Dec 2022 18:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455459.712938; Tue, 06 Dec 2022 18:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2caa-0007rN-Dy; Tue, 06 Dec 2022 18:22:44 +0000
Received: by outflank-mailman (input) for mailman id 455459;
 Tue, 06 Dec 2022 18:22:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2caY-0007rH-Pd
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 18:22:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2caY-00073N-GW; Tue, 06 Dec 2022 18:22:42 +0000
Received: from [54.239.6.185] (helo=[192.168.22.87])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2caY-0003hi-B4; Tue, 06 Dec 2022 18:22:42 +0000
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
	bh=tObuIcrjLD6o6vAQDSNfgTDWeJwle1NyYs3bnPiTumA=; b=CIvvZq/n7acJFxvz11ZI0tFTrB
	G4odU07Bv2A/BMr84Cg3aduYtARv47BKO8NdAOHPzybzvPGPvJAOBRpfPEDX7HE/p+ov8a+keUdPk
	t8VfTpkiqGuRA3XRw3C4A7fSTBuGMf8nkx1sUpC7jzOZPeqQn8SbqGZpg0tpz3aoQb4I=;
Message-ID: <4c98b129-4935-f5ba-1b56-1bdd3c8710dc@xen.org>
Date: Tue, 6 Dec 2022 18:22:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v5 2/2] xen/arm: vpl011: add ASSERT_UNREACHABLE in
 vpl011_mmio_read
Content-Language: en-US
To: Jiamei Xie <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221205072640.2092473-1-jiamei.xie@arm.com>
 <20221205072640.2092473-3-jiamei.xie@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221205072640.2092473-3-jiamei.xie@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/12/2022 07:26, Jiamei Xie wrote:
> In vpl011_mmio_read switch block, all cases should have a return. Add
> ASSERT_UNREACHABLE to catch case where the return is not added.
> 
> Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

