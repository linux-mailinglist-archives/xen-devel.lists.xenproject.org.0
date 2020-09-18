Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69463270437
	for <lists+xen-devel@lfdr.de>; Fri, 18 Sep 2020 20:40:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJLId-0008N4-HP; Fri, 18 Sep 2020 18:39:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GPqB=C3=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kJLIc-0008Mz-4z
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 18:39:58 +0000
X-Inumbo-ID: e1c467a1-a1a9-4dba-835f-173121ebc31e
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1c467a1-a1a9-4dba-835f-173121ebc31e;
 Fri, 18 Sep 2020 18:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=OMEJBcnU+QjpeQlobm+mzJUEGzdUeQo+zAKVXrl4iio=; b=x5vbzJLdooz3zdG5xtwoKVHC3Z
 waVL7rBKxhnlRSmuC1BzzIsOSR7jYNIoMy+0lNWGexDSipg2ZadkG0+NJMRkAiOxGyVA888QjWvNm
 IluG9vss2GWVaG3hilXUjiz+U1gY4rgmcolOZZHaXb+g6moTTQhW3hU6LHMTD6UXLjCM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kJLIU-0005iS-1L; Fri, 18 Sep 2020 18:39:50 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kJLIT-0000Pg-Ml; Fri, 18 Sep 2020 18:39:49 +0000
Subject: Re: [RESEND][PATCH v2 5/7] xen: include xen/guest_access.h rather
 than asm/guest_access.h
To: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-6-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <cc2dadec-03a0-b156-2174-d8b76cd0b533@xen.org>
Date: Fri, 18 Sep 2020 19:39:46 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200730181827.1670-6-julien@xen.org>
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

Hi all,

I was going to commit this patch but I realized that I still don't have 
a review from the maintainers of...

On 30/07/2020 19:18, Julien Grall wrote:
>   xen/arch/x86/hvm/viridian/viridian.c | 2 +-
... this file (Paul and Wei) and...

>   xen/arch/x86/hvm/vmx/vmx.c           | 2 +-

.. this one (Jun and Kevin).

Can I get one?

The change is pretty trivial so I plan to commit it on Monday afternoon 
unless otherwise.

Cheers,

-- 
Julien Grall

