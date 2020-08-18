Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CB7248150
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 11:04:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7xWp-0005EL-Mj; Tue, 18 Aug 2020 09:03:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ffgU=B4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k7xWo-0005EC-18
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 09:03:34 +0000
X-Inumbo-ID: 85325473-ab79-4c08-9396-9f501f6134a0
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85325473-ab79-4c08-9396-9f501f6134a0;
 Tue, 18 Aug 2020 09:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=lQL5wLFQZPFX4fDLtS8bYUsSbL9YGcn0KjHdng6qvn4=; b=PHb1ODZ2fejKUNVHn2frFd1E5D
 7vzuu6IoTUVrFHUCL5iKuJ9JDdCmYo5x65tIMe50Wk79LXrFJ4D5q8ajjQIGrexwBsRg1hVkrRaWO
 QBgiFTW90ugsLoGkGdWxhZpBV6hC1Es4WuvKQYIi4stZ7PHmp3reTpmFkTo1ss+oBMdY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7xWm-0007ZV-7O; Tue, 18 Aug 2020 09:03:32 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7xWm-0007yo-14; Tue, 18 Aug 2020 09:03:32 +0000
Subject: Re: [RESEND][PATCH v2 7/7] xen/guest_access: Fix coding style in
 xen/guest_access.h
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-8-julien@xen.org>
 <3bafb97f-45a3-7203-3e73-37e73c453de6@suse.com>
 <28c7d999-52da-cc96-533b-264c749c7f88@xen.org>
 <3d63c930-24f4-da8d-cbae-1a88c90bad99@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c5feaef4-a985-8deb-8793-3c235f18d39d@xen.org>
Date: Tue, 18 Aug 2020 10:03:29 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3d63c930-24f4-da8d-cbae-1a88c90bad99@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

Hi Jan,

On 18/08/2020 09:52, Jan Beulich wrote:
> On 14.08.2020 21:18, Julien Grall wrote:
>> On 31/07/2020 12:41, Jan Beulich wrote:
>>> On 30.07.2020 20:18, Julien Grall wrote:
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>>       * Add space before and after operator
>>>>       * Align \
>>>>       * Format comments
>>>
>>> How about also
>>>
>>>       * remove/replace leading underscores
>>>
>>> ?
>>
>> I don't have any plan for this. You are welcome to send a patch for this.
> 
> In which case may I ask that you replace "Fix" by "Improve" or some
> such in the title?

I will do it if. Although, this doesn't mean I agree with your implicit 
coding style.

Cheers,

-- 
Julien Grall

