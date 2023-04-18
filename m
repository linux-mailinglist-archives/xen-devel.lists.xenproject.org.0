Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7601C6E5FD6
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 13:29:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522772.812355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pojWb-0006Lp-HR; Tue, 18 Apr 2023 11:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522772.812355; Tue, 18 Apr 2023 11:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pojWb-0006Js-El; Tue, 18 Apr 2023 11:29:29 +0000
Received: by outflank-mailman (input) for mailman id 522772;
 Tue, 18 Apr 2023 11:29:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pojWZ-0006Ji-Kn
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 11:29:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pojWZ-0002fH-2j; Tue, 18 Apr 2023 11:29:27 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.26.51]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pojWY-0003vx-Sp; Tue, 18 Apr 2023 11:29:27 +0000
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
	bh=33er2HK2Pue8U4YBESIqk5sVVWEzdL0YmimrS1s9S34=; b=omqnHqAi1bl2gu9iDcX9PHwZpn
	U/8L4lAURw8RXtePe3DKij4wBgGKDTkmNexROXOaVg1ISr/r/fSskIUxOGnO/Og+J7vJzcIhoae9d
	FfRNiOjVbhhFqiH6DHgq6C+C0raEEm0TjckE3j6ymCOj8nr+Wf07T/PQW/5Jn4mpt2pk=;
Message-ID: <a83e1891-99d2-2503-3675-e5c6573a9b69@xen.org>
Date: Tue, 18 Apr 2023 12:29:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: xen cache colors in ARM
Content-Language: en-US
To: Oleg Nikitenko <oleshiiwood@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Carlo Nonato <carlo.nonato@minervasys.tech>
References: <CA+SAi2uwrKFYN1tkYJ1_LVC-f+b-xb46RWTUv6wDOUO41yx8zg@mail.gmail.com>
 <bad09a6f-d41e-ab8e-2291-7fde3b646710@xen.org>
 <CA+SAi2uPZ=Dq1GxF9Kj1zCO=nbb55ruVG31kH-TgdpR6bLznvA@mail.gmail.com>
 <CA+SAi2s4WLiMEVa3u8rJRNZDpCpLTvnDygpObSUKxau-Q8dfyA@mail.gmail.com>
 <64326e46-096e-0f86-2aa9-31a72d3cd004@xen.org>
 <CA+SAi2u2=7h=Lo=bTC8YzmzidOErYaQGi=hpoG3w7tdM4LUzFw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CA+SAi2u2=7h=Lo=bTC8YzmzidOErYaQGi=hpoG3w7tdM4LUzFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 18/04/2023 12:26, Oleg Nikitenko wrote:
> Hi Julien,

Hi Oleg,

> 
>>> This feature has not been merged in Xen upstream yet
> 
>> would assume that upstream + the series on the ML [1] work
> 
> Please clarify this point.
> Because the two thoughts are controversial.

It is not clear to me how what I wrote is controversial. A series was 
sent on the ML for cache coloring support and this was tested on Xilinx 
ZynqMP (see cover letter).

This work was sponsored by Xilinx/AMD. So my assumption is they have 
done the same amount of testing as they did for their own branch.

Cheers,

-- 
Julien Grall

