Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B71B7212AFE
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 19:13:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jr2l9-0007ge-LJ; Thu, 02 Jul 2020 17:12:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gpFn=AN=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jr2l8-0007gZ-SP
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 17:12:26 +0000
X-Inumbo-ID: 33bb30ec-bc87-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33bb30ec-bc87-11ea-bca7-bc764e2007e4;
 Thu, 02 Jul 2020 17:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qKo7l4ukOyqKEr2gEJ9D1gjkDyTo7aBp5+6VSKv82mw=; b=bigzbg0EmeDBNW3p+PxVkqW2P0
 r+G4d2srdbMWFnsYZktryPyjY1oT1AID96HFJKmqGmITtxxXxCPH3kfqTdyr3V47S+yFEqAPnmFiL
 JnR0y4t1kZGhS3EyrnRfhyJB1DJxerLw9bMjexudtGfzZ8OlOOfM+IEuTAFf/+NfV8BU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jr2l8-0006m5-4Z; Thu, 02 Jul 2020 17:12:26 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jr2l7-0001L7-Sn; Thu, 02 Jul 2020 17:12:26 +0000
Subject: Re: [Xen ARM64] Save coredump log when xen/dom0 crash on ARM64?
To: jinchen <jinchen1227@qq.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <tencent_F424A8312298D36ED25612607EF4BC341B0A@qq.com>
From: Julien Grall <julien@xen.org>
Message-ID: <94415ba8-53de-c294-36f6-0290bfb0bc83@xen.org>
Date: Thu, 2 Jul 2020 18:12:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <tencent_F424A8312298D36ED25612607EF4BC341B0A@qq.com>
Content-Type: text/plain; charset=gb18030; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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

Hello,

On 02/07/2020 02:41, jinchen wrote:
> Hello xen experts:
> 
> Is there any way to save xen and dom0 core dump log when xen or dom0 
> crash on ARM64 platform?

Usually all the crash stack trace (Xen and Dom0) should be output on the 
Xen Console.

>      I find that the kdump seems can't run on ARM64 platform?

We don't have support for kdump/kexec on Arm in Xen yet.

>      Are there any patches or other way to achive this goal?

I am not aware of any patches, but they would be welcomed.

For other way, it depends what exactly you expect. Do you need more than 
the stack trace?

Cheers,

-- 
Julien Grall

