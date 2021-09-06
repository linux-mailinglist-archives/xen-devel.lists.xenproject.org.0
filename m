Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87669401F52
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 19:49:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180149.326666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNIjl-00026w-BN; Mon, 06 Sep 2021 17:48:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180149.326666; Mon, 06 Sep 2021 17:48:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNIjl-000259-8Q; Mon, 06 Sep 2021 17:48:53 +0000
Received: by outflank-mailman (input) for mailman id 180149;
 Mon, 06 Sep 2021 17:48:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNIjj-000253-9G
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 17:48:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNIji-0001Lg-9S; Mon, 06 Sep 2021 17:48:50 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNIji-0005Bv-35; Mon, 06 Sep 2021 17:48:50 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=4TxAf+1W+KDaf8dtm2znwRRH5Pti4W0MUcRVqefKbqo=; b=3kyYO9DDEwEBE7eT/hbpGJ16Na
	HcoZWjMalx12VR6nNq0fb+1Lfk05VUBFqPye4/ZV4B9c4O0WwUVughtJUcTviw3CwBwj5cL43dqJ5
	a9NMPFOHXedMoOVLPXxP23ljZEaHMFMfrhVkz1F+fAsPwHxEDG99wCXkSWViGD3dgoeo=;
Subject: Re: [PATCH v2] xen/arm64: Remove vreg_emulate_sysreg32
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210729104258.6320-1-michal.orzel@arm.com>
 <24ba08cc-acd4-c64a-1e90-dc4c8efbfe48@xen.org>
 <f4ee4519-9153-1671-179b-3595d632a4fb@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6ce114f6-ba2b-7262-ee0c-7a339465c9a6@xen.org>
Date: Mon, 6 Sep 2021 18:48:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f4ee4519-9153-1671-179b-3595d632a4fb@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 06/09/2021 10:09, Michal Orzel wrote:
> On 06.09.2021 11:07, Julien Grall wrote:
>> The rest of the patch looks fine. So I would be happy to deal with the fixes on commit:
> Please do. Thanks.

Pushed. I have also re-wrapped the commit message to 72 characters per line.

Cheers,

-- 
Julien Grall

