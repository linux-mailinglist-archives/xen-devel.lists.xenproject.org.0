Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EB859FDBA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 17:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392820.631413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQrsq-0000DF-Gl; Wed, 24 Aug 2022 15:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392820.631413; Wed, 24 Aug 2022 15:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQrsq-0000AZ-Cb; Wed, 24 Aug 2022 15:01:32 +0000
Received: by outflank-mailman (input) for mailman id 392820;
 Wed, 24 Aug 2022 15:01:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oQrso-0000A0-4w
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 15:01:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQrsn-0006rw-Ui; Wed, 24 Aug 2022 15:01:29 +0000
Received: from [54.239.6.185] (helo=[192.168.29.89])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQrsn-0000FB-OA; Wed, 24 Aug 2022 15:01:29 +0000
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
	bh=85vYf+BEEqubasSHdQXzaUUUYVxS/rgG4MhODPLo7JU=; b=upafYz2dUuXf6DANDA3tgOaaCv
	YyIRelYHrcNSt6DzXqvaI1oUC9dg7QIz+qeAe/nN2JeTx4aKoUja2tX14MGQbEz9Wcllu3mkqYxCr
	WvyVPnU0D0dwEM1Tu0Tfj6S0mcIQhfnowjJUkMlmHJP1oqL5OERrPhe1YXMRpbWxc0fQ=;
Message-ID: <0a057b2d-a9e9-af47-a48d-511b31208ccc@xen.org>
Date: Wed, 24 Aug 2022 16:01:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH 04/10] xen/arm: smmuv3: Move definitions to a header
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1661331102.git.rahul.singh@arm.com>
 <e8ad3eed5474f2f09ef4fcca1ce0d1a669baca2b.1661331102.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e8ad3eed5474f2f09ef4fcca1ce0d1a669baca2b.1661331102.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/08/2022 14:53, Rahul Singh wrote:
> Allow sharing structure definitions with the upcoming virtual
> smmuv3 support for Arm SMMUv3, by moving them to a separate header.

I haven't seen this feature posted yet. So I can't tell how this will 
allow sharing. I guess you will introduce a new file?

In any case, I would suggest to either delay this patch until you send 
your work or find a different reason to split it (I can't think of one yet).

Cheers,

-- 
Julien Grall

