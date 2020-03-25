Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D73192D77
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 16:53:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH8JB-0007EA-W3; Wed, 25 Mar 2020 15:51:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QfP3=5K=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1jH8JB-0007E5-7V
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 15:51:09 +0000
X-Inumbo-ID: 6ca7ffd6-6eb0-11ea-864b-12813bfff9fa
Received: from spam1.hygon.cn (unknown [110.188.70.11])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ca7ffd6-6eb0-11ea-864b-12813bfff9fa;
 Wed, 25 Mar 2020 15:51:03 +0000 (UTC)
Received: from MK-DB.hygon.cn ([172.23.18.60])
 by spam1.hygon.cn with ESMTP id 02PFjI1l017543;
 Wed, 25 Mar 2020 23:45:19 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from cncheex01.Hygon.cn ([172.23.18.10])
 by MK-DB.hygon.cn with ESMTP id 02PFjB1u047376;
 Wed, 25 Mar 2020 23:45:16 +0800 (GMT-8)
 (envelope-from puwen@hygon.cn)
Received: from [192.168.1.193] (172.23.18.44) by cncheex01.Hygon.cn
 (172.23.18.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Wed, 25 Mar
 2020 23:44:50 +0800
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200324103726.3406-1-puwen@hygon.cn>
 <8547604a-3a65-8b3a-d442-0c89ea8c15c6@suse.com>
From: Pu Wen <puwen@hygon.cn>
Message-ID: <dea9405a-2309-4c35-391b-049cd4bbcd98@hygon.cn>
Date: Wed, 25 Mar 2020 23:21:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8547604a-3a65-8b3a-d442-0c89ea8c15c6@suse.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.23.18.44]
X-ClientProxiedBy: cncheex02.Hygon.cn (172.23.18.12) To cncheex01.Hygon.cn
 (172.23.18.10)
X-MAIL: spam1.hygon.cn 02PFjI1l017543
X-DNSRBL: 
Subject: Re: [Xen-devel] [PATCH v2] SVM: Add union intstat_t for offset 68h
 in vmcb struct
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 2020/3/24 19:55, Jan Beulich wrote:
>> --- a/xen/include/asm-x86/hvm/svm/vmcb.h
>> +++ b/xen/include/asm-x86/hvm/svm/vmcb.h
>> @@ -316,6 +316,17 @@ typedef union
>>       uint64_t raw;
>>   } intinfo_t;
>>   
>> +typedef union
>> +{
>> +    struct
>> +    {
> 
> Nit: The brace should be on the same line as "struct"; can be
> taken care of while committing.

Ok, thanks.

-- 
Regards,
Pu Wen

