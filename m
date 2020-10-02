Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C82E280CD3
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 06:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1657.5012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOCfl-0001lS-1C; Fri, 02 Oct 2020 04:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1657.5012; Fri, 02 Oct 2020 04:27:57 +0000
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
	id 1kOCfk-0001l3-U9; Fri, 02 Oct 2020 04:27:56 +0000
Received: by outflank-mailman (input) for mailman id 1657;
 Fri, 02 Oct 2020 04:27:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kOCfj-0001ky-To
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 04:27:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cde595ca-9253-4f39-9d72-0ab85d759a4c;
 Fri, 02 Oct 2020 04:27:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1239AAC19;
 Fri,  2 Oct 2020 04:27:54 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kOCfj-0001ky-To
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 04:27:55 +0000
X-Inumbo-ID: cde595ca-9253-4f39-9d72-0ab85d759a4c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id cde595ca-9253-4f39-9d72-0ab85d759a4c;
	Fri, 02 Oct 2020 04:27:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601612874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n5hLMCuQD4OyqugOBeWO8nJ7I2YjMYO1ImRm1jNVsq8=;
	b=gbDYFv1dLPC/dlkm4uHXrs07qez51pZfSyyED8yvIFcWPVhNQdr2Ar9aXBCHOZw/5dHgo3
	O0eMx0tHQXL/f1svEH9UfChGq1dHbPOom8jx2MxmGYoIOTqXIyD/yKDofF19i4cjAzdlz0
	DuvCEyjpuPEm9wCfjcfI6fAxf8G9ugY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1239AAC19;
	Fri,  2 Oct 2020 04:27:54 +0000 (UTC)
Subject: Re: Ping: [PATCH 0/6] tools/include: adjustments to the population of
 xen/
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2a9f86aa-9104-8a45-cd21-72acd693f924@suse.com>
 <673fdaf3-e770-67c8-0a6c-6cdec79df38a@suse.com>
 <9F53B61A-5A50-46DD-BF5B-75F48C91FCFC@arm.com>
 <6B9403A3-66DC-4A69-8006-096420649768@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <dea68b56-990d-a13f-a2c4-171e67eaaf73@suse.com>
Date: Fri, 2 Oct 2020 06:27:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6B9403A3-66DC-4A69-8006-096420649768@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.10.20 18:43, Bertrand Marquis wrote:
> Hi,
> 
>> On 1 Oct 2020, at 17:29, Bertrand Marquis <bertrand.marquis@arm.com> wrote:
>>
>> Hi Jan,
>>
>>> On 1 Oct 2020, at 17:03, Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>> On 10.09.2020 14:09, Jan Beulich wrote:
>>>> While looking at what it would take to move around libelf/
>>>> in the hypervisor subtree, I've run into this rule, which I
>>>> think can do with a few improvements and some simplification.
>>>>
>>>> 1: adjust population of acpi/
>>>> 2: fix (drop) dependencies of when to populate xen/
>>>> 3: adjust population of public headers into xen/
>>>> 4: properly install Arm public headers
>>>> 5: adjust x86-specific population of xen/
>>>> 6: drop remaining -f from ln invocations
>>>
>>> May I ask for an ack or otherwise here?
>>
>> This is going the right way but with this serie (on top of current staging
>> status), I have a compilation error in Yocto while compiling qemu:
>> In file included from /media/extend-drive/bermar01/Development/xen-dev/yocto-build/build/dom0-fvp.prj/tmp/work/armv8a-poky-linux/qemu/5.1.0-r0/recipe-sysroot/usr/include/xenguest.h:25,
>> |                  from /media/extend-drive/bermar01/Development/xen-dev/yocto-build/build/dom0-fvp.prj/tmp/work/armv8a-poky-linux/qemu/5.1.0-r0/qemu-5.1.0/hw/i386/xen/xen_platform.c:41:
>> | /media/extend-drive/bermar01/Development/xen-dev/yocto-build/build/dom0-fvp.prj/tmp/work/armv8a-poky-linux/qemu/5.1.0-r0/recipe-sysroot/usr/include/xenctrl_dom.h:19:10: fatal error: xen/libelf/libelf.h: No such file or directory
>> |    19 | #include <xen/libelf/libelf.h>
>> |       |          ^~~~~~~~~~~~~~~~~~~~~
>> | compilation terminated.
>> | /media/extend-drive/bermar01/Development/xen-dev/yocto-build/build/dom0-fvp.prj/tmp/work/armv8a-poky-linux/qemu/5.1.0-r0/qemu-5.1.0/rules.mak:69: recipe for target 'hw/i386/xen/xen_platform.o’ failed
>>
>> Xen is using xenctrl_dom.h which need the libelf.h header from xen.
> 
> Actually this is not coming from your serie and this is actually a problem already present on master.

... and fixed on staging.


Juergen

