Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF99D1ECD55
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 12:17:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgQS8-0001F8-29; Wed, 03 Jun 2020 10:16:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rNY3=7Q=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jgQS6-0001F3-Qt
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 10:16:54 +0000
X-Inumbo-ID: 58e9964e-a583-11ea-9947-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58e9964e-a583-11ea-9947-bc764e2007e4;
 Wed, 03 Jun 2020 10:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8mRhuUxnO156PHabG+ARbKCVHN7CrvZydkVf9zuTDu4=; b=ySbFCUK3RDRAnNekLYwWLNjZlt
 k7pgmSOYIp624eiRyfYPa4S1U+yUWpT0DqwWGeOFO65ouLjd47rx1Hg+6AqNAQLprA4PPgPt7trbx
 cirMj/aW+Yx2AKZF4mN0J/wW5eklHpt+nS8va+7TbdIZwnX3ACFQ1tvnsNvQTLmawcX4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jgQS5-000156-OT; Wed, 03 Jun 2020 10:16:53 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jgQS5-0004LH-I0; Wed, 03 Jun 2020 10:16:53 +0000
Subject: Re: UEFI support in ARM DomUs
To: Roman Shaposhnik <roman@zededa.com>,
 Julien Grall <julien.grall.oss@gmail.com>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <CAJ=z9a2B1+A8jPXiE9adNSTWHENtULnmAxq2M5v6MxB5thZLfw@mail.gmail.com>
 <CAMmSBy_djgfQ1NT2TGo+1=7c20PyX-mzf6JiPx5ibnRkFT_5BQ@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7fe687e0-092b-6477-76cc-24eabc966ef8@xen.org>
Date: Wed, 3 Jun 2020 11:16:51 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CAMmSBy_djgfQ1NT2TGo+1=7c20PyX-mzf6JiPx5ibnRkFT_5BQ@mail.gmail.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nataliya Korovkina <malus.brandywine@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 01/06/2020 05:11, Roman Shaposhnik wrote:
> Hi Julien!

Hi Roman,

> 
> On Sun, May 31, 2020 at 3:24 PM Julien Grall <julien.grall.oss@gmail.com> wrote:
>>
>> On Sun, 31 May 2020 at 23:05, Roman Shaposhnik <roman@zededa.com> wrote:
>>> Hi!
>>>
>>> with a lot of help from Stefano, we're getting RPi4 support in
>>> Project EVE pretty much on par between KVM and Xen.
>>>
>>> One big area that still remains is supporting UEFI boot sequence
>>> for DomUs. With KVM, given the qemu virt device model this is
>>> as simple as using either stock UEFI build for arm or even U-Boot
>>> EFI emulation environment and passing it via -bios option.
>>>
>>> Obviously with Xen on ARM we don't have the device model so
>>> my understanding is that the easiest way we can support it would
>>> be to port UEFI's OvmfPkg/OvmfXen target to ARM (it seems to
>>> be currently exclusively X64).
>>
>> EDK2 has been supporting Xen on Arm for the past 5 years. We don't use
>> OvmfPkg/OvmfXen but ArmVirtPkg/ArmVirtXen (see [1]).
>> I haven't tried to build it recently, but I should be able to help if
>> there is any issue with it.
>>
>> Cheers,
>>
>> [1] https://github.com/tianocore/edk2/blob/master/ArmVirtPkg/ArmVirtXen.fdf
> 
> This is really, really awesome -- I guess it would be really helpful to document
> this someplace on the ARM/Xen wiki (I can volunteer if someone can grant
> me the karma).

There used to be a page on the Linaro wiki when they did the port. But 
it looks like any Xen pages have been removed/relocated :(.

Anyway, a page on Xen Project wiki would definitely be appreciated.

> 
> I've built XEN_EFI.fd and the rest worked out like a charm.

Glad to hear that it worked :).

Cheers,

-- 
Julien Grall

