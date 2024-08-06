Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB7F9497A7
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 20:41:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773086.1183539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbP7m-0000xD-G1; Tue, 06 Aug 2024 18:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773086.1183539; Tue, 06 Aug 2024 18:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbP7m-0000vB-DU; Tue, 06 Aug 2024 18:41:34 +0000
Received: by outflank-mailman (input) for mailman id 773086;
 Tue, 06 Aug 2024 18:41:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sbP7l-0000v5-Lm
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 18:41:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sbP7l-0003yL-6j; Tue, 06 Aug 2024 18:41:33 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sbP7l-0001l2-2Q; Tue, 06 Aug 2024 18:41:33 +0000
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
	bh=l3LSozffNEDX3TZF6ewtBCUssb3LZqMVJ1MjJ+Jf1Ug=; b=3iJk1J2MkifRCG22WShSbmXFzz
	E955jjmQ91ZvR6JL/bqxYv8+Ratoxkx4BVaKxfqE2FC2ARrUKs27wL0b5Bk78QRsW5aRAIbjorNoT
	7F8OSBGfllxaEJ+q5aqtUyGNfn0lmY5hU+YiXVh757D43SfoLzpNLMuASVTl6b2nNNLY=;
Message-ID: <076fe048-c89c-496e-a2dc-2076649638cc@xen.org>
Date: Tue, 6 Aug 2024 19:41:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: vITS: add #msi-cells property
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240802182654.8976-1-stewart.hildebrand@amd.com>
 <alpine.DEB.2.22.394.2408021420320.114241@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2408021420320.114241@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/08/2024 22:20, Stefano Stabellini wrote:
> On Fri, 2 Aug 2024, Stewart Hildebrand wrote:
>> Non-PCI platform devices may use the ITS. Dom0 Linux drivers for such
>> devices are failing to register IRQs due to a missing #msi-cells
>> property. Add the missing #msi-cells property.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

This is now committed.

Cheers,

-- 
Julien Grall


