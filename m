Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A32966E07A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 15:24:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479515.743416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmsu-0003ST-1M; Tue, 17 Jan 2023 14:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479515.743416; Tue, 17 Jan 2023 14:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmst-0003Pz-Uc; Tue, 17 Jan 2023 14:24:19 +0000
Received: by outflank-mailman (input) for mailman id 479515;
 Tue, 17 Jan 2023 14:24:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHmss-0003Pt-OW
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 14:24:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHmsp-0001uG-7s; Tue, 17 Jan 2023 14:24:15 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.7.198]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHmsp-0000TQ-1k; Tue, 17 Jan 2023 14:24:15 +0000
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
	bh=E7YlRMGSPi1g4nZDvIxx8Y2IGAqrgBcbKzTtEPy6F+U=; b=PHHTrCvGLxgw65XGdXHwv3nQau
	Uu77G7Hbc0MkYcrAgeCNRJYQ+/AcqMGgM0hkHHXbRySpr7og72dcyqf580P9qWV6aetKh0duGi7uK
	9otv2iANDP2BdZFpnIasp3lRbbeUZJ1LxZPd0vm9j8gInjj2Icxz5i49cgSkWt2vufJU=;
Message-ID: <8caae9ce-671b-2a5a-4263-beb08c767861@xen.org>
Date: Tue, 17 Jan 2023 14:24:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: Xentrace and Xenalyze on ARM S32G3
Content-Language: en-US
To: El Mesdadi Youssef ESK UILD7 <youssef.elmesdadi@zf.com>,
 "psujkov@gmail.com" <psujkov@gmail.com>,
 "dario.faggioli@citrix.com" <dario.faggioli@citrix.com>,
 "ben.sanda@dornerworks.com" <ben.sanda@dornerworks.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <AM5PR0802MB2578F1D80D0F9E7A22C2D2079DC69@AM5PR0802MB2578.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM5PR0802MB2578F1D80D0F9E7A22C2D2079DC69@AM5PR0802MB2578.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/2023 14:17, El Mesdadi Youssef ESK UILD7 wrote:
> Hello everyone,

Hi,

> My name is Youssef, I am an electrical Eng. student and right now I'm working on my thesis using Xen hypervisor on an S32G3 microprocessor (ARM architecture). After building my Yocto-Image using the Linux-BSP of the microprocessor, I noticed that Xentrace and Xenalyze are not working because they are not compatible with ARM architecture. I have found on Xen.markmail.org that you have already done this, I tried to understand the changes that Mr. ben and Paul did, but I could not understand them. I wish you can help me with that by sending me the repo.

You already asked the question in a separate thread. If you don't get 
answer there, then it would be better to "ping" on the other thread.

This will avoid duplication on the ML. I will answer on the other thread 
soon.

Cheers,

-- 
Julien Grall

