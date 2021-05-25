Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 089E838FAC3
	for <lists+xen-devel@lfdr.de>; Tue, 25 May 2021 08:19:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132065.246485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llQNu-0002Vp-Tt; Tue, 25 May 2021 06:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132065.246485; Tue, 25 May 2021 06:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llQNu-0002Tf-Qa; Tue, 25 May 2021 06:17:46 +0000
Received: by outflank-mailman (input) for mailman id 132065;
 Tue, 25 May 2021 06:17:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RIGM=KU=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1llQNs-0002TZ-QI
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 06:17:44 +0000
Received: from szxga04-in.huawei.com (unknown [45.249.212.190])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22f3c710-b282-475d-a98e-b3f1b9b876a4;
 Tue, 25 May 2021 06:17:38 +0000 (UTC)
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fq3hM1jM5z1BQrK;
 Tue, 25 May 2021 14:14:43 +0800 (CST)
Received: from dggema769-chm.china.huawei.com (10.1.198.211) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 14:17:34 +0800
Received: from [10.174.179.215] (10.174.179.215) by
 dggema769-chm.china.huawei.com (10.1.198.211) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 25 May 2021 14:17:33 +0800
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
X-Inumbo-ID: 22f3c710-b282-475d-a98e-b3f1b9b876a4
Subject: Re: [PATCH -next] xen/pcpu: Use DEVICE_ATTR_RW macro
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, <jgross@suse.com>,
	<sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
References: <20210523070214.34948-1-yuehaibing@huawei.com>
 <c27b37e3-7d4b-1ed1-2b8c-1fbde6e30c3b@oracle.com>
From: YueHaibing <yuehaibing@huawei.com>
Message-ID: <e2f4309d-e53a-1511-a732-9cf5c5217d55@huawei.com>
Date: Tue, 25 May 2021 14:17:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <c27b37e3-7d4b-1ed1-2b8c-1fbde6e30c3b@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema769-chm.china.huawei.com (10.1.198.211)
X-CFilter-Loop: Reflected



On 2021/5/24 20:48, Boris Ostrovsky wrote:
> 
> On 5/23/21 3:02 AM, YueHaibing wrote:
>> Use DEVICE_ATTR_RW helper instead of plain DEVICE_ATTR,
>> which makes the code a bit shorter and easier to read.
>>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> 
> 
> Do you think you can also make similar change in drivers/xen/xen-balloon.c and drivers/xen/xenbus/xenbus_probe.c?
> 
Sure, will do that in v2.
> 
> 
> Thanks.
> 
> -boris
> 
> .
> 

