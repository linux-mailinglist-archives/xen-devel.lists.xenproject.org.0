Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B14DC1A09C1
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 11:09:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLkE9-0007LO-7t; Tue, 07 Apr 2020 09:09:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SCBO=5X=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jLkE8-0007LI-9z
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 09:09:00 +0000
X-Inumbo-ID: 6aefdcc8-78af-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6aefdcc8-78af-11ea-b4f4-bc764e2007e4;
 Tue, 07 Apr 2020 09:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a+WfNd0zQdZIopu9/x/mXg2bGpCCMzzOfxTMamiPr0g=; b=LE8G9hH8lXRjem32tsye+So94V
 5YUNQ+1VmEz2yBl9Q/frFPjbPzqU9yZOMu6f95B/gS1/VKLykrMXFzx4BkzcjjXYThSW5u/NPJOFZ
 f9CX8M0SUVvQJmexcDcp8LhZYDs3ZCBJZ4mlRKomOg5elgbA/oem7/lOcZ8TLplKFMp0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLkE5-0006ez-NO; Tue, 07 Apr 2020 09:08:57 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jLkE5-00086X-GR; Tue, 07 Apr 2020 09:08:57 +0000
Subject: Re: [PATCH 7/7] xen/guest_access: Fix coding style in
 xen/guest_access.h
To: Jan Beulich <jbeulich@suse.com>
References: <20200404131017.27330-1-julien@xen.org>
 <20200404131017.27330-8-julien@xen.org>
 <f7d640aa-51da-830b-51e8-6257868b278e@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b6341ade-c3e5-e7b2-3727-9cda2619ca60@xen.org>
Date: Tue, 7 Apr 2020 10:08:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <f7d640aa-51da-830b-51e8-6257868b278e@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 07/04/2020 09:17, Jan Beulich wrote:
> On 04.04.2020 15:10, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>>      * Add space before and after operator
>>      * Align \
>>      * Format comments
> 
> To be honest, despite the reason you give for the split in patch 6,
> I'd rather see code movement like this to do formatting adjustments
> right away.

Thank you for thinking I can move code and also modify coding style at 
the same time :).

However I know mistakes can be easily made and may not be caught during 
review (possibly leading to an XSA). So I tend to adhere to the KISS 
principle.

> But if you're convinced the split is better, I'm not
> meaning to insist.

I will keep the code as-is unless someone else think it is bad idea.

Cheers,

-- 
Julien Grall

