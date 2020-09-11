Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C3D266124
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 16:26:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGjzg-0000q1-GI; Fri, 11 Sep 2020 14:25:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBET=CU=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kGjze-0000pw-V9
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 14:25:39 +0000
X-Inumbo-ID: baf0f914-3479-4cbc-a55e-057ca8dc2470
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id baf0f914-3479-4cbc-a55e-057ca8dc2470;
 Fri, 11 Sep 2020 14:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=AlWnRCXM0C278Auq8a2Mm+ceEaqcVl3zSRLdgHmV/aU=; b=Y0XU5Mzaw616Xf4mNkVUGpsu4M
 d2cbeVBnPFVPClkQLZBvioocR/caVBVa4Pm6ya52ZGxxkx37OTtAPx4EyDJUBoOEC6F+NuBzmNQjI
 z49EvydfJu7Is56CfL/yEfWxzdJNVcZqVmYTGjPmvq93guMye7BGA9BFa9ZtoJDzitAI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kGjzb-0002JR-Fc; Fri, 11 Sep 2020 14:25:35 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kGjzb-0002fV-5k; Fri, 11 Sep 2020 14:25:35 +0000
Subject: Re: preparations for 4.13.2 and 4.12.4
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <427c2293-366d-2ab3-cfbb-b41db35bd8b6@suse.com>
 <A526A238-AEE2-4A8D-960C-AA15E75786C0@arm.com>
 <78572a41-a84b-0c1a-0f17-4e4b484fc6cd@xen.org>
 <675ED3A7-6C02-42FC-8CD9-717610143A82@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <658b29f5-d68e-613b-5d53-c92eff1fde22@xen.org>
Date: Fri, 11 Sep 2020 15:25:33 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <675ED3A7-6C02-42FC-8CD9-717610143A82@arm.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Bertrand,

On 11/09/2020 14:56, Bertrand Marquis wrote:
> 
> 
>> On 11 Sep 2020, at 14:51, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Bertrand,
>>
>> On 11/09/2020 14:32, Bertrand Marquis wrote:
>>>> On 11 Sep 2020, at 14:11, Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> All,
>>>>
>>>> the releases are about due, but will of course want to wait for the
>>>> XSA fixes going public on the 22nd. Please point out backports
>>>> you find missing from the respective staging branches, but which
>>>> you consider relevant. (Ian, Julien, Stefano: I notice there once
>>>> again haven't been any tools or Arm side backports at all so far
>>>> since the most recent stable releases from these branches. But
>>>> maybe there simply aren't any.)
>>>>
>>>> One that I have queued already, but which first need to at least
>>>> pass the push gate to master, are
>>>>
>>>> 8efa46516c5f hvmloader: indicate ACPI tables with "ACPI data" type in e820
>>>> e5a1b6f0d207 x86/mm: do not mark IO regions as Xen heap
>>>> b4e41b1750d5 b4e41b1750d5 [4.14 only]
>>>>
>>>> On the Arm side I'd also like to ask for
>>>>
>>>> 5d45ecabe3c0 xen/arm64: force gcc 10+ to always inline generic atomics helpers
>>> +1
>>> Could those fixes also be considered:
>>> 3b418b3326 arm: Add Neoverse N1 processor identification
>>> 858c0be8c2 xen/arm: Enable CPU Erratum 1165522 for Neoverse
>>> 1814a626fb xen/arm: Update silicon-errata.txt with the Neovers AT erratum
>> The processor is quite new so may I ask why we would want to backport on older Xen?
> 
> 4.14 at least would be good as it is the current stable and N1SDP is support in Yocto which is based on 4.14.
While I understand external project are often based on stable release, I 
don't want to always backport errata. Some of them are quite involved 
and this is a risk for others.

In this case, the erratum has already been implemented for other 
processors. So the risk is minimal.

> But as the official one will be on next Yocto release this would be ok to consider only 4.14 here.

4.14 only would be my preference.

Cheers,

-- 
Julien Grall

