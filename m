Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC383BE88A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 15:09:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152201.281200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17II-0003YL-Eo; Wed, 07 Jul 2021 13:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152201.281200; Wed, 07 Jul 2021 13:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17II-0003Um-BM; Wed, 07 Jul 2021 13:08:50 +0000
Received: by outflank-mailman (input) for mailman id 152201;
 Wed, 07 Jul 2021 13:08:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m17IG-0003Ue-PR
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 13:08:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m17IF-000427-2o; Wed, 07 Jul 2021 13:08:47 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m17IE-0007o4-Tt; Wed, 07 Jul 2021 13:08:47 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=OrLD2pOmHbJxSzYkuiC+feOyiqiWerP7s26qMjwK/HI=; b=RaFelctTNmhb3IoZwR+PtuXCVD
	mFofCyfMicv9WW+xPat1bci+l5Y7oJNFfhNjVDrBHnOhKATnirRGv5U9MPi96Kgc8Ib4cRMwyIJTR
	7m0t5VFXUUqJQt1UgWoZLGv8SA272oZmkWqFPu+ydEyzVQ0o52GLiii6OdBChNexHkio=;
Subject: Re: [PATCH] xen/arm: smmuv1: Switch from kzalloc_array(..) to
 devm_kcalloc(..)
From: Julien Grall <julien@xen.org>
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <2c611dec5f1dbd6040d7a37d2d72ad2fc66e113f.1625568432.git.rahul.singh@arm.com>
 <d30b4c93-f45d-86cf-5966-3ff0f8788cca@xen.org>
Message-ID: <62ad240a-02b1-43eb-0d1f-ec14fc1b390f@xen.org>
Date: Wed, 7 Jul 2021 14:08:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d30b4c93-f45d-86cf-5966-3ff0f8788cca@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 07/07/2021 14:07, Julien Grall wrote:
> Hi Rahul,
> 
> On 06/07/2021 11:53, Rahul Singh wrote:
>> Switch from kzalloc_array(..) to devm_kcalloc(..) when allocating the
>> SMR to make code coherent.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

And committed.

Cheers,

-- 
Julien Grall

