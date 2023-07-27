Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98297765EDD
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 00:01:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571287.894774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP924-0005WY-9I; Thu, 27 Jul 2023 22:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571287.894774; Thu, 27 Jul 2023 22:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP924-0005U6-6h; Thu, 27 Jul 2023 22:00:28 +0000
Received: by outflank-mailman (input) for mailman id 571287;
 Thu, 27 Jul 2023 22:00:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qP923-0005Tz-6X
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 22:00:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qP922-0000zg-KJ; Thu, 27 Jul 2023 22:00:26 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qP922-0002p2-DU; Thu, 27 Jul 2023 22:00:26 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=lLoYQA7k/qppC6HysORTbwHJqLjG/TNuBxycYE8vzms=; b=NoR2x8nqUOdJMb3/u3MKVhasZ8
	xgyeU/Bc1nWeJzhOClduB7XCyGERaktJCvDqW84BOlhQCM8Ay8c9H8DLG1RD5yeWLygC1tAI/iWca
	0GFvG2Pbhs5gwuagF92hiRyw43ThLm4o8cqM7n33R81iuHTIp/ynOluqLxO+d/Avdx1A=;
Message-ID: <00f7cbe3-9a37-d136-4e96-400ed2518581@xen.org>
Date: Thu, 27 Jul 2023 23:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v3] xen/arm: Move TEE mediators in a kconfig submenu
From: Julien Grall <julien@xen.org>
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <5f10382a15ca7b221a052915347e4e59f66b001f.1690297570.git.bertrand.marquis@arm.com>
 <bfa643fe-4b8f-c8bf-2b13-fd699c6816c5@xen.org>
In-Reply-To: <bfa643fe-4b8f-c8bf-2b13-fd699c6816c5@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/07/2023 16:45, Julien Grall wrote:
> Hi Bertrand,
> 
> On 25/07/2023 16:42, Bertrand Marquis wrote:
>> Rework TEE mediators to put them under a submenu in Kconfig.
>> The submenu is only visible if UNSUPPORTED is activated as all currently
>> existing mediators are UNSUPPORTED.
>>
>> While there rework a bit the configuration so that OP-TEE and FF-A
>> mediators are selecting the generic TEE interface instead of depending
>> on it.
>> Make the TEE option hidden as it is of no interest for anyone to select
>> it without one of the mediators so having them select it instead should
>> be enough.
>>
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

I have committed it.

Cheers,

-- 
Julien Grall

