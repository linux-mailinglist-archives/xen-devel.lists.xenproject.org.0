Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 976E92A0E61
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 20:14:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16207.39577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYZqC-0004Qa-Mp; Fri, 30 Oct 2020 19:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16207.39577; Fri, 30 Oct 2020 19:13:36 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYZqC-0004QB-JY; Fri, 30 Oct 2020 19:13:36 +0000
Received: by outflank-mailman (input) for mailman id 16207;
 Fri, 30 Oct 2020 19:13:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kYZqA-0004Pe-Eg
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 19:13:34 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c725507a-9803-4a90-8777-543cf2ec58fd;
 Fri, 30 Oct 2020 19:13:33 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYZq3-0000M0-R6; Fri, 30 Oct 2020 19:13:27 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYZq3-0002z7-Ke; Fri, 30 Oct 2020 19:13:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kYZqA-0004Pe-Eg
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 19:13:34 +0000
X-Inumbo-ID: c725507a-9803-4a90-8777-543cf2ec58fd
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c725507a-9803-4a90-8777-543cf2ec58fd;
	Fri, 30 Oct 2020 19:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=3XwIDC/zNO15TsWPqBEwPTczQU30EIZ+3OMOktjsMoM=; b=a4uQwp9kjOUmPjaHLk0mTjYOLi
	fw6VzpowXbS0ZWtCVWFISunXWvRlmH0Bk9wXUFKgE/bokHTY3N6xeC84fVXuiVIX6WcT7ak3mQI4U
	Yn1DbTtAzwK/08QWVdeAdhnR4t/Xrzlw5w073lfxm5vB5KcRgvC8CV3Bw70MWijufX2A=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYZq3-0000M0-R6; Fri, 30 Oct 2020 19:13:27 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYZq3-0002z7-Ke; Fri, 30 Oct 2020 19:13:27 +0000
Subject: Re: [PATCH v2 6/7] xen/arm: gic-v2: acpi: Use the correct length for
 the GICC structure
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
 masami.hiramatsu@linaro.org, ehem+xen@m5p.com, bertrand.marquis@arm.com,
 andre.przywara@arm.com, Rahul.Singh@arm.com,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20201023154156.6593-1-julien@xen.org>
 <20201023154156.6593-7-julien@xen.org>
 <alpine.DEB.2.21.2010231731010.12247@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2010231735000.12247@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <1d3b1643-e2cd-ede4-21e5-3a9bb23db0c3@xen.org>
Date: Fri, 30 Oct 2020 19:13:25 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010231735000.12247@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

I just realized the title says "gic-v2" when I also modified "gic-v3". I 
will update the title on the next version.

On 24/10/2020 01:45, Stefano Stabellini wrote:
> On Fri, 23 Oct 2020, Stefano Stabellini wrote:
>> On Fri, 23 Oct 2020, Julien Grall wrote:
>>> From: Julien Grall <julien.grall@arm.com>
>>>
>>> The length of the GICC structure in the MADT ACPI table differs between
>>> version 5.1 and 6.0, although there are no other relevant differences.
>>>
>>> Use the BAD_MADT_GICC_ENTRY macro, which was specifically designed to
>>> overcome this issue.
>>>
>>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Actually it looks we need to do substitutions in a couple of other places:
> 
> - xen/arch/arm/gic-v3.c:gicv3_make_hwdom_madt
> - xen/arch/arm/gic-v3.c:gic_acpi_get_madt_cpu_num
> - xen/arch/arm/gic.c:gic_get_hwdom_madt_size
I will update the 3 and resend the series.

Cheers,

-- 
Julien Grall

