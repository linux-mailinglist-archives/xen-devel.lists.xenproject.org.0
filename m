Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 048E41E61EE
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 15:14:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeIMJ-0007Tr-Nd; Thu, 28 May 2020 13:14:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lRPh=7K=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jeIMH-0007Tk-VC
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 13:14:06 +0000
X-Inumbo-ID: 1b001120-a0e5-11ea-a7c8-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b001120-a0e5-11ea-a7c8-12813bfff9fa;
 Thu, 28 May 2020 13:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/TGQqVJMo46RFi783ukTwjZkqvAI+atG7guE7LsOJRw=; b=tayfq+iWBTaRYEL1JG22O0euSw
 FVLlHeZ4IngAjmhhoBxx9Y76GSGzRcL7mF/n+61HDsQxFkYQT5lEW0J61XVIUg/g0c0vozu5ldToy
 Hc60CmtyeifMnTYrIGsKSazGMKHTsCnVMdTv14KyJEhUnZNPAjAgny1ZW0GFNaSXb5kM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jeIMG-0003w5-HA; Thu, 28 May 2020 13:14:04 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jeIMG-0005jw-Ar; Thu, 28 May 2020 13:14:04 +0000
Subject: Re: [OSSTEST PATCH 22/38] buster: Extend guest bootloader workaround
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
 <20200519190230.29519-23-ian.jackson@eu.citrix.com>
 <7747c676-f9da-cb97-bd93-78dc13138d03@xen.org>
 <24261.17724.382954.918761@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e4e7e515-587a-ad81-c9b7-b7cfa69108be@xen.org>
Date: Thu, 28 May 2020 14:14:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <24261.17724.382954.918761@mariner.uk.xensource.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Ian,

On 20/05/2020 15:57, Ian Jackson wrote:
> Julien Grall writes ("Re: [OSSTEST PATCH 22/38] buster: Extend guest bootloader workaround"):
>> On 19/05/2020 20:02, Ian Jackson wrote:
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Thanks.
> 
>>>    	# Debian doesn't currently know what bootloader to install in
>>>    	# a Xen guest on ARM. We install pv-grub-menu above which
>>
>> OOI, what does Debian install for x86 HVM guest? Is there any ticket
>> tracking this issue?
> 
> On x86, it installes grub.  (grub2, x86, PC, to be precise.)

I have just realized that on x86 you will always have a firmware in the 
guest. On Arm we commonly boot the kernel directly.

So maybe we are closer to PV here. Do you also install GRUB in that case?

Note that we do support EDK2 at least on Arm64. It would be nice to get 
some tests for it in Osstest in the future.

> I'm not aware of any ticket or bug about this.

It might be worth creating one then.

-- 
Julien Grall

