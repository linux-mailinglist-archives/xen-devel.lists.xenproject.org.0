Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C88FA288615
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 11:40:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4738.12481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQosE-0007sB-LY; Fri, 09 Oct 2020 09:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4738.12481; Fri, 09 Oct 2020 09:39:38 +0000
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
	id 1kQosE-0007rm-IT; Fri, 09 Oct 2020 09:39:38 +0000
Received: by outflank-mailman (input) for mailman id 4738;
 Fri, 09 Oct 2020 09:39:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2W9l=DQ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kQosD-0007rh-MN
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 09:39:37 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea23fa90-075a-4d81-9f87-ca46aad683d1;
 Fri, 09 Oct 2020 09:39:36 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kQos6-00081X-D2; Fri, 09 Oct 2020 09:39:30 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kQos6-0008Nq-4Q; Fri, 09 Oct 2020 09:39:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2W9l=DQ=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kQosD-0007rh-MN
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 09:39:37 +0000
X-Inumbo-ID: ea23fa90-075a-4d81-9f87-ca46aad683d1
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ea23fa90-075a-4d81-9f87-ca46aad683d1;
	Fri, 09 Oct 2020 09:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=mFRuY1FDncZFrn5lLxJnQ5RUv3Y2kBgHnffYVRUPw0k=; b=25U8C1fjAlhSSq/A+lj+EvWPhU
	pwvEgCMOZ1QF8CypgsFEOqZOal/2hJaQrqIP7yersZatJpTwB8/DxaECRx8fYwOU5NijpO2Ei9G8Q
	dGiN3VkluRUZl1+ZOOdfGU+QlfAuYJzJbW5+bsakoM+HUgQ+hSUHxwYk81TXeAvPG80U=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kQos6-00081X-D2; Fri, 09 Oct 2020 09:39:30 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kQos6-0008Nq-4Q; Fri, 09 Oct 2020 09:39:30 +0000
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
To: Elliott Mitchell <ehem+xen@m5p.com>,
 Masami Hiramatsu <masami.hiramatsu@linaro.org>
Cc: xen-devel@lists.xenproject.org, Alex Benn??e <alex.bennee@linaro.org>,
 bertrand.marquis@arm.com, andre.przywara@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monn?? <roger.pau@citrix.com>
References: <20200926205542.9261-1-julien@xen.org>
 <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
 <20201008183904.GA56716@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f0976c17-ad36-847b-7868-f6bb13948368@xen.org>
Date: Fri, 9 Oct 2020 10:39:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201008183904.GA56716@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hello,

On 08/10/2020 19:39, Elliott Mitchell wrote:
> On Mon, Sep 28, 2020 at 03:47:52PM +0900, Masami Hiramatsu wrote:
>> This made progress with my Xen boot on DeveloperBox (
>> https://www.96boards.org/product/developerbox/ ) with ACPI.
> 
> Adding your patch on top of Julien Grall's patch appears to push the Xen
> boot of my target device (Raspberry PI 4B with Tianocore) further.  Still
> yet to see any output attributable to the Domain 0 kernel though.
> 
> (XEN) *** LOADING DOMAIN 0 ***
> (XEN) Loading d0 kernel from boot module @ 0000000032234000
> (XEN) Loading ramdisk from boot module @ 0000000031747000
> (XEN) Allocating 1:1 mappings totalling 2048MB for dom0:
> (XEN) BANK[0] 0x00000020000000-0x00000030000000 (256MB)
> (XEN) BANK[1] 0x00000040000000-0x000000b0000000 (1792MB)
> (XEN) Grant table range: 0x000000315f3000-0x00000031633000
> (XEN) Allocating PPI 16 for event channel interrupt
> (XEN) Loading zImage from 0000000032234000 to 0000000020080000-0000000021359200
> (XEN) Loading d0 initrd from 0000000031747000 to 0x0000000028200000-0x0000000028cebfe4
> (XEN) Loading d0 DTB to 0x0000000028000000-0x0000000028000273
> (XEN) Initial low memory virq threshold set at 0x4000 pages.
> (XEN) Scrubbing Free RAM in background
> (XEN) Std. Loglevel: All
> (XEN) Guest Loglevel: All
> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
> (XEN) Freed 396kB init memory.
> 
> The line, "Loading d0 DTB to 0x0000000028000000-0x0000000028000273" seems
> rather suspicious as I would expect Domain 0 to see ACPI tables, not a
> device tree.

This is normal, we are creating a small device-tree to pass some 
information to dom0 (such as the ACPI tables, command line, initrd).

> 
> Your (Masami Hiramatsu) patch seems plausible, but things haven't
> progressed enough for me to endorse it.  Looks like something closer to
> the core of ACPI still needs further work, Julien Grall?

I didn't go very far during my testing because QEMU is providing ACPI 
5.1 (Xen only supports 6.0+ so far).

For your log above, Xen finished to boot and now dom0 should start 
booting. The lack of console output may be because of a crash in Linux 
during earlyboot.

Do you have the early console enabled Linux? This can be done by adding 
earlycon=xenboot on the Linux command line.

Cheers,

-- 
Julien Grall

