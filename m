Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D495227FDF
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 14:23:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxrIK-0008Gs-F5; Tue, 21 Jul 2020 12:22:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Oq7=BA=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jxrIJ-0008Gl-8P
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 12:22:51 +0000
X-Inumbo-ID: e4ae5799-cb4c-11ea-a0ac-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4ae5799-cb4c-11ea-a0ac-12813bfff9fa;
 Tue, 21 Jul 2020 12:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K1FgHKhAy02tHNnmHMmauO/aQZlmT1eGifFxe8fALEs=; b=ioKycbit0dQcPPT48h4XxnHZP+
 nIv8R0kEgry76tPnCRdNuOUfmZVF2cEvmKaK+F4XBgO37kTsT/j0cqIwpjWdQP1oImChkKyMZ8/Qr
 4IdtYrggNcmhOC7ksziFkoCI/x7/YYXhuIg8eUQLpUkYwdi19FLn2Dluu/IvbNO5ZyIk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxrIE-0005dF-M9; Tue, 21 Jul 2020 12:22:46 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxrIE-0005Af-F6; Tue, 21 Jul 2020 12:22:46 +0000
Subject: Re: [PATCH] SUPPORT.md: Spell correctly Experimental
To: paul@xen.org, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20200720173635.1571-1-julien@xen.org>
 <4cc580c5-146f-6f83-bd91-a798763c261b@citrix.com>
 <627851f2-d28e-5c3b-6f1f-882e9eb02ed4@xen.org>
 <aae69fa5-4aee-781d-2f52-291d8fa948bd@citrix.com>
 <003801d65f2d$df17bc10$9d473430$@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <042c7d69-a790-4f5d-56ba-fb64afefa4b8@xen.org>
Date: Tue, 21 Jul 2020 13:22:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <003801d65f2d$df17bc10$9d473430$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Julien Grall' <jgrall@amazon.com>, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Paul,

On 21/07/2020 08:09, Paul Durrant wrote:
>> -----Original Message-----
>> From: Andrew Cooper <andrew.cooper3@citrix.com>
>> Sent: 20 July 2020 18:49
>> To: Julien Grall <julien@xen.org>; xen-devel@lists.xenproject.org
>> Cc: paul@xen.org; Julien Grall <jgrall@amazon.com>; George Dunlap <george.dunlap@citrix.com>; Ian
>> Jackson <ian.jackson@eu.citrix.com>; Jan Beulich <jbeulich@suse.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>
>> Subject: Re: [PATCH] SUPPORT.md: Spell correctly Experimental
>>
>> On 20/07/2020 18:48, Julien Grall wrote:
>>>
>>> On 20/07/2020 18:45, Andrew Cooper wrote:
>>>> On 20/07/2020 18:36, Julien Grall wrote:
>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>
>>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>
>>>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>
>>>> Although I'd suggest the subject be changed rearranged to "Spell
>>>> Experimentally correctly".
>>>
>>> Did you intend to write "Experimental" rather than "Experimentally"?
>>
>> Erm, yes :)
>>
> 
> Since this is a small docs change...
> 
> Release-acked-by: Paul Durrant <paul@xen.org>
> 
> ...and please commit to staging-4.14 a.s.a.p.

Thanks. I have committed it to staging and staging-4.14.

Cheers,

-- 
Julien Grall

