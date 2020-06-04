Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1701EE8A5
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 18:34:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgsol-0003h9-W6; Thu, 04 Jun 2020 16:34:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uZ5H=7R=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jgsok-0003h0-Ti
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 16:34:10 +0000
X-Inumbo-ID: 3766eac2-a681-11ea-aebe-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3766eac2-a681-11ea-aebe-12813bfff9fa;
 Thu, 04 Jun 2020 16:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NBXJUJsJTzOpO6WNXRcTt1YH0gFs7vUGy9SndxnqndI=; b=xk4g9a9JFWLEE7OpR1bK4mhWfH
 1giPl+YO/Bca+Obo2Gc15s3n3+fVKWUmhjD1cR7VtI+Fe/1AuPYObPG3so4zleLoqEAX5FR+n5Gns
 CN9GDejQ9+oNMl9N4iEaXk+qT3f2M8zw6HPxXDsl7K3C+oit2BdQVeXezOo8QZo1ovtw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jgsoj-0001Pi-Hv; Thu, 04 Jun 2020 16:34:09 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jgsoj-0003G5-Au; Thu, 04 Jun 2020 16:34:09 +0000
Subject: Re: UEFI support in ARM DomUs
To: Stefano Stabellini <sstabellini@kernel.org>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <dc3998f3-5fa1-9b97-12cd-a1e3bb29eee5@xen.org>
 <alpine.DEB.2.21.2006040925350.6774@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <9b4163cf-9cba-e094-cfff-594a3530f891@xen.org>
Date: Thu, 4 Jun 2020 17:34:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2006040925350.6774@sstabellini-ThinkPad-T480s>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Peng Fan <peng.fan@nxp.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 04/06/2020 17:27, Stefano Stabellini wrote:
> On Thu, 4 Jun 2020, Julien Grall wrote:
>> On 04/06/2020 16:26, Oleksandr Andrushchenko wrote:
>>> On 6/4/20 4:57 AM, Peng Fan wrote:
>>>> Grall <julien@xen.org>;
>>>>> Nataliya Korovkina <malus.brandywine@gmail.com>
>>>>> Subject: UEFI support in ARM DomUs
>>>> We have made U-Boot run inside XEN DomU, but just only PV console part,
>>>> not implement other frontend drivers currently. Would this help for your
>>>> case if enable EFI in U-Boot?
>>>
>>> Well, we have a working PV block implementation on top of that on iMX8
>>
>> That's a nice work and will be a good addition. However...
>>
>>>
>>> platform, mostly ported from mini-os. Currently we are finalizing the work
>>
>> ... AFAICT mini-os is licensed using BSD-2 while U-boot is using GPLv2. So I
>> would be careful with the licensing here.
>>
>> It might be better to consider to port Linux PV driver instead or rewrite them
>> completely.
> 
> Julien, I might be misunderstanding what you wrote. MiniOS is BSD-2 so
> MiniOS code can be integrated into a GPLv2 project without issues
> (becoming GPLv2.)  So it should be OK to take MiniOS code and add it to
> Uboot?

Yes I did realized that afterwards. Sorry for the noise :(.

Cheers,

-- 
Julien Grall

