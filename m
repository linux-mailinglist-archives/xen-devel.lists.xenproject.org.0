Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAF0635901
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 11:06:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447488.703755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxmeA-0006QC-Vr; Wed, 23 Nov 2022 10:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447488.703755; Wed, 23 Nov 2022 10:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxmeA-0006Nb-Sq; Wed, 23 Nov 2022 10:06:26 +0000
Received: by outflank-mailman (input) for mailman id 447488;
 Wed, 23 Nov 2022 10:06:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oxmeA-0006NV-0q
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 10:06:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxme8-00014b-5b; Wed, 23 Nov 2022 10:06:24 +0000
Received: from [54.239.6.185] (helo=[192.168.17.134])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxme7-0002gO-T7; Wed, 23 Nov 2022 10:06:24 +0000
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
	bh=7BuRn4gN86YI+c+d6nd7UfoXB0hglny3yAPYefRYuh4=; b=micD1/FT5PuxF8apwEegZh3LVG
	IsUNRA5gexT9bhsRN34wsvfHXyXnnNZZjTuyT3xKeujQUsQ/WsGVvan2xFwKx3PnLb4aqtpuVUdFd
	K4y5K4SHual2nXG9H10D4juO5Ms7wlu9UVgwqcvQ7NH0XZSxMc3lfdMzLeSeHqH5sv4Y=;
Message-ID: <f7672fe8-36a9-5126-aad8-5ace79fe900a@xen.org>
Date: Wed, 23 Nov 2022 11:06:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v4 1/3] CHANGELOG: Add missing entries for work during the
 4.17 release
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Community Manager <community.manager@xenproject.org>
References: <20221123040315.1480112-1-Henry.Wang@arm.com>
 <20221123040315.1480112-2-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221123040315.1480112-2-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 23/11/2022 04:03, Henry Wang wrote:
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

