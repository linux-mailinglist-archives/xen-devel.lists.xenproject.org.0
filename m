Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D08668D489
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 11:39:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490999.759926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPLNW-0008Mr-26; Tue, 07 Feb 2023 10:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490999.759926; Tue, 07 Feb 2023 10:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPLNV-0008K5-Ui; Tue, 07 Feb 2023 10:39:09 +0000
Received: by outflank-mailman (input) for mailman id 490999;
 Tue, 07 Feb 2023 10:39:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pPLNU-0008Jz-Jo
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 10:39:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pPLNT-0006Xr-Me; Tue, 07 Feb 2023 10:39:07 +0000
Received: from [54.239.6.184] (helo=[192.168.19.254])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pPLNT-0003vO-FE; Tue, 07 Feb 2023 10:39:07 +0000
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
	bh=C9qTSZ0gbvsbfgxi2p57QAD1Nv90OK9YA/xsqiI6y0c=; b=xyGXm3QKUBWlQDMW8xEYTK8UOg
	AA1m2OcCTUfmd6fiKhN1Sg6sCDe0C/8I00O7D0R/pcS2z5VGTSgpVdQycqt8DaqSvpzbMzzIO7VeX
	rGFTHp5Rnuc27Ays5it3mmdvx183uqh2/Qy9eAe4QLehKf6OrZLcpAaQu7KAXwBqhS5w=;
Message-ID: <63d81215-fd4a-e2f2-e145-3ee115b7df14@xen.org>
Date: Tue, 7 Feb 2023 10:39:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/2] xen/device_tree: fix Eclair findings for MISRA C
 2012 Rule 20.7
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230203190908.211541-1-burzalodowa@gmail.com>
 <20230203190908.211541-2-burzalodowa@gmail.com>
 <F9BF9B83-7889-4D51-B0B3-09950071AB75@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <F9BF9B83-7889-4D51-B0B3-09950071AB75@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 07/02/2023 10:23, Luca Fancellu wrote:
> 
> 
>> On 3 Feb 2023, at 19:09, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>>
> 
> I’m not really a supporter of empty commit message, but it’s up to the maintainer :)

+1. In this case a brief summary of the rule would be handy for those 
that are not well-versed with MISRA.

This can be dealt on commit if you propose a new commit message.

> 
> For me the changes looks good
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,

-- 
Julien Grall

