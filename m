Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFB025F39F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 09:12:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFBJf-0000A2-LU; Mon, 07 Sep 2020 07:11:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b7xj=CQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFBJd-00009r-Ah
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 07:11:49 +0000
X-Inumbo-ID: c2cedecb-db65-4ea6-8498-7128953b0147
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2cedecb-db65-4ea6-8498-7128953b0147;
 Mon, 07 Sep 2020 07:11:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A2B0AAF7F;
 Mon,  7 Sep 2020 07:11:48 +0000 (UTC)
Subject: Re: [PATCH] EFI: Enable booting unified hypervisor/kernel/initrd
 images
To: Julien Grall <julien@xen.org>
Cc: Trammell Hudson <hudson@trmm.net>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <EGZ7EZE5F-c5YJVD9p0TtccTz06ZsdMcL21-BcB64dk9V3x8eKrB3dSDsLbGL4peCaENcp55uRsnWUONZYvrRaQh0tToALcaHRr-QMYNsH0=@trmm.net>
 <96966138-552f-c86a-2d14-85b2f7af50e6@xen.org>
 <kxO4Q0LRhrdqHcPTtg_JQYmf2jaNOF-nUvckzLF_IhHTicunRP3-_CWWMDw2Jg7_-RSg56X_4ULzsL5rU84eIjWV9apUH9sRnu2rVf-6_Mk=@trmm.net>
 <c629d643-6275-4fc0-b36b-9da5b8ce88e9@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0dfeeaf9-850c-e8e5-9d0f-d80a50a7f19b@suse.com>
Date: Mon, 7 Sep 2020 09:11:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c629d643-6275-4fc0-b36b-9da5b8ce88e9@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.09.2020 19:35, Julien Grall wrote:
> On 04/09/2020 11:06, Trammell Hudson wrote:
>> On Friday, September 4, 2020 5:29 AM, Julien Grall <julien@xen.org> wrote:
>>
>>> On 28/08/2020 12:51, Trammell Hudson wrote:
>>>
>>>> -   /* PE32+ Subsystem type */
>>>>      +#if defined(ARM)
>>>>
>>>
>>> Shouldn't this be defined(aarch64) ?
>>
>> To be honest I'm not sure and don't have a way to check if
>> this code works on ARM.
> 
> The code looks generic enough. I will give a try to build it.
> 
>> Does an Xen EFI build on ARM even
>> use the PE32+ format?
> 
> So far, we only support EFI and AArch64. This is built using PE32+ format.

But this gets done by some custom means iirc, not by linking to that
format? (I'm not certain whether this matters here, so I'm sorry for
the noise if it doesn't.)

Jan

