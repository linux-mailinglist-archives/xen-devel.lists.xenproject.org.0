Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC627B01FD
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 12:36:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608864.947629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlRtK-00066k-Pz; Wed, 27 Sep 2023 10:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608864.947629; Wed, 27 Sep 2023 10:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlRtK-000653-MZ; Wed, 27 Sep 2023 10:35:38 +0000
Received: by outflank-mailman (input) for mailman id 608864;
 Wed, 27 Sep 2023 10:35:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qlRtJ-00063j-9w
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 10:35:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qlRtH-0008AK-7D; Wed, 27 Sep 2023 10:35:35 +0000
Received: from [15.248.2.159] (helo=[10.24.67.27])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qlRtG-0005L1-W6; Wed, 27 Sep 2023 10:35:35 +0000
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
	bh=KAkade0RO+m0CK+7ZEg5D3BY67Kkm4fVgYdPbdzG1qU=; b=XVTXUrdo1szCb3YQx7LdLspiZd
	7qCKyzFLCfyZY71ec7uZ5zQR+gqRBvxatltxZHg+uxHYhpIFMOf1hSxxPmHxkJEPXbt2/o+cLteKH
	hU82z+ge6Gnlji6IVeaHqpOGkNR6xUReekhM3YeVH/x/7Elbh2k4F8MeC2tZawKe0HBY=;
Message-ID: <165fb382-622a-4829-87c6-f41f6ff95014@xen.org>
Date: Wed, 27 Sep 2023 11:35:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.18] [PATCH v2] ARM: GICv3 ITS: flush caches for newly
 allocated ITT
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20230922222710.1383808-1-volodymyr_babchuk@epam.com>
 <d4ab6108-b190-437e-bd15-af9afb086794@xen.org>
 <9F5A8F55-DF3C-4D8D-AEB2-E009E6EB0C28@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9F5A8F55-DF3C-4D8D-AEB2-E009E6EB0C28@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 25/09/2023 23:19, Henry Wang wrote:
> Hi Julien,

Hi Henry,

> Yes, I was about to ask the same question but somehow forgot it. This is a quite
> low risk patch and I think it is fine to have this in 4.18, so if the "Fixes” tag
> can be added on commit, please also add:
> 
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Thanks! It is now committed.

Cheers,

-- 
Julien Grall

