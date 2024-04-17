Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E198A82E2
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 14:10:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707433.1105368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx47b-0001sH-Ue; Wed, 17 Apr 2024 12:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707433.1105368; Wed, 17 Apr 2024 12:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx47b-0001pa-RL; Wed, 17 Apr 2024 12:10:39 +0000
Received: by outflank-mailman (input) for mailman id 707433;
 Wed, 17 Apr 2024 12:10:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rx47a-0001pQ-FD
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 12:10:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rx47T-0004QU-2o; Wed, 17 Apr 2024 12:10:31 +0000
Received: from [15.248.3.90] (helo=[10.24.67.26])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rx47S-0002mi-Sq; Wed, 17 Apr 2024 12:10:31 +0000
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
	bh=SyRMb1xmbk7nO2LKnu3N+EtKt/VyzMld4Loefr+UNh8=; b=03herz8QI8tA4jVjaCTHh0NcYC
	sKiv0+MU5GRx4vU9TQumoPSK6posPUSMS2BtZVhKkV4ewJkHlNzay9gU6TtzGLtPtRDaIAbl9Vf5L
	RKtj3bBd3D8+bTnqDiRtLnRcpV5ZIysChWDX15PPKiMiWlGkjALjOdHHX2HsCymfgLv0=;
Message-ID: <271ac8f1-b25f-4be2-a8e5-b0940d4da160@xen.org>
Date: Wed, 17 Apr 2024 13:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: imx8qm: Re-license file to GPL-2.0-only
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>, Peng Fan <peng.fan@nxp.com>
Cc: John Ernberg <john.ernberg@actia.se>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240416133844.2544452-1-john.ernberg@actia.se>
 <DU0PR04MB9417D2CBEAE4D002596B9F4B88082@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <alpine.DEB.2.22.394.2404161747250.2257106@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2404161747250.2257106@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi John,

Thanks for the patch!

On 17/04/2024 01:47, Stefano Stabellini wrote:
> On Tue, 16 Apr 2024, Peng Fan wrote:
>>> Subject: [PATCH] xen/arm: imx8qm: Re-license file to GPL-2.0-only
>>>
>>> New contributions are recommended to be under GPL-2.0-only [1], since this
>>> code piece originally came from the NXP tree the original license was retained.
>>>
>>> However, as discussed both Peng [2] and I [3] are ok with GPL-2.0.-only as a
>>> license. Change the license.
>>>
>>> Cc: Peng Fan <peng.fan@nxp.com>
>>> Signed-off-by: John Ernberg <john.ernberg@actia.se>
>>
>> Acked-by: Peng Fan <peng.fan@nxp.com>
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Julien Grall <jgrall@amazon.com>

I will commit it once OSSTest has been unblocked.

Cheers,

-- 
Julien Grall

