Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6A7702801
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 11:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534675.831928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyUG9-0007H5-1l; Mon, 15 May 2023 09:12:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534675.831928; Mon, 15 May 2023 09:12:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyUG8-0007Ep-Un; Mon, 15 May 2023 09:12:48 +0000
Received: by outflank-mailman (input) for mailman id 534675;
 Mon, 15 May 2023 09:12:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pyUG8-0007Ej-6k
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 09:12:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pyUG7-0002CG-VP; Mon, 15 May 2023 09:12:47 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.27.136]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pyUG7-000368-Pi; Mon, 15 May 2023 09:12:47 +0000
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
	bh=A7mHmKFDOHFXZ1P1TmBdlm7hU5IL7ZKFwITEz2mtWpc=; b=fFWxTCCf9u1JFoO2WnKdQsLqnj
	sElu9oBj7UmctmP4PYTo10loqOZn7TyrmOlrw9EiDXrvM7EvTJ5APEzZoB1YWbw5AcVSi1a66/wqp
	hqsPalzaOOSIN0uZtYsGCEEjcSiKulmWfb+NVSv+UFPV9LeGVoMuZo5NPS6I4YDAT5ik=;
Message-ID: <c6801d1f-ae14-28bc-53b1-e9d0c58468eb@xen.org>
Date: Mon, 15 May 2023 10:12:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] xen/arm: smmuv3: Advertise coherent table walk if
 supported
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230512143535.29679-1-michal.orzel@amd.com>
 <20230512143535.29679-3-michal.orzel@amd.com>
 <dff8ab04-ae35-3a71-b923-abe722dcdb1c@xen.org>
 <f043c234-eb51-126f-1a1f-610796c203e8@amd.com>
 <bfc634ce-43f9-2617-eee7-6ce8ab15b6b1@xen.org>
 <da9415ad-95cb-21bb-28ee-a007763a1e54@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <da9415ad-95cb-21bb-28ee-a007763a1e54@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/05/2023 10:07, Michal Orzel wrote:
>> Reviewed-by: Julien Grall <jgrall@amazon.com>
> Thanks,
> Bare in mind that Rahul responded in HTML so there will be a <mailto when using b4.

Thanks for the reminder! The patch is now committed.

Cheers,

-- 
Julien Grall

