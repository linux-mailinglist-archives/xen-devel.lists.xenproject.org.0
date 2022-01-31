Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6B14A4BA1
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 17:16:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263214.455850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEZLk-0004Mo-GE; Mon, 31 Jan 2022 16:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263214.455850; Mon, 31 Jan 2022 16:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEZLk-0004K5-D3; Mon, 31 Jan 2022 16:16:16 +0000
Received: by outflank-mailman (input) for mailman id 263214;
 Mon, 31 Jan 2022 16:16:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8WLv=SP=infradead.org=rdunlap@srs-se1.protection.inumbo.net>)
 id 1nEZLj-0004Jz-5J
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 16:16:15 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a2b4b7c-82b1-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 17:16:11 +0100 (CET)
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZLW-00A7NO-F9; Mon, 31 Jan 2022 16:16:03 +0000
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
X-Inumbo-ID: 1a2b4b7c-82b1-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=CFfhv6Epx2fHLPGBIbtj8/r6wcnT3ZZL4M31RTkI8Lk=; b=Sy6LHdGv3PDxuAaYqBp7DfX2hk
	MqaxGK1LD3LHHY9Y21GFD/MAf2X2S3t7EWhILe0oqLusoQV3He65YE4z4Ywky5QfkVwfIJ3TFR8A8
	CwXIiXPQF95e5eCdyZyJnyXg2NUB7YE7WqvxtB0p2lriVIvrY5WP6Zs3jrG3oj6LnhR1bzTNaEUOV
	9J3tI756r56iltbx3djfdg9sdQ5ZikG3VjPmZ0L2Ov3vM1NIguLctMJSeg1j2mWVnBEq8yauVji4o
	IjZSm4LJ35sQn1Z+q4IPoCjUOlbX3uA7Jmgirohqhe3omEixnUwJrAgzo724NTeChQoAmKFJY2oWz
	jPcGqeLQ==;
Message-ID: <5c12cf94-fb4d-28b4-dfeb-9e7878420980@infradead.org>
Date: Mon, 31 Jan 2022 08:15:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] xen: update missing ioctl magic numers documentation
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, patches@lists.linux.dev
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20220130192305.14523-1-rdunlap@infradead.org>
 <3d62ec12-2324-7e73-3056-c5bc99b957a1@suse.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <3d62ec12-2324-7e73-3056-c5bc99b957a1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi--

On 1/30/22 22:55, Juergen Gross wrote:
> On 30.01.22 20:23, Randy Dunlap wrote:
>> Add missing ioctl "magic numbers" for various Xen interfaces
>> (xenbus_dev.h, gntalloc.h, gntdev.h, and privcmd.h).
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>> Cc: Juergen Gross <jgross@suse.com>
>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: xen-devel@lists.xenproject.org
>> ---
>>   Documentation/userspace-api/ioctl/ioctl-number.rst |    3 +++
>>   1 file changed, 3 insertions(+)
>>
>> --- linux-next-20220128.orig/Documentation/userspace-api/ioctl/ioctl-number.rst
>> +++ linux-next-20220128/Documentation/userspace-api/ioctl/ioctl-number.rst
>> @@ -115,6 +115,7 @@ Code  Seq#    Include File
>>   'B'   00-1F  linux/cciss_ioctl.h                                     conflict!
>>   'B'   00-0F  include/linux/pmu.h                                     conflict!
>>   'B'   C0-FF  advanced bbus                                           <mailto:maassen@uni-freiburg.de>
>> +'B'   00-0F  xen/xenbus_dev.h                                        conflict!
> 
> Hmm, shouldn't xenbus_dev.h be moved to include/uapi/xen ?

Probably. That should be done in a different patch and probably/preferably
done using git (which I am not using). So if someone else could take care
of that, that would be good.

> 
>>   'C'   all    linux/soundcard.h                                       conflict!
>>   'C'   01-2F  linux/capi.h                                            conflict!
>>   'C'   F0-FF  drivers/net/wan/cosa.h                                  conflict!
>> @@ -134,6 +135,7 @@ Code  Seq#    Include File
>>   'F'   80-8F  linux/arcfb.h                                           conflict!
>>   'F'   DD     video/sstfb.h                                           conflict!
>>   'G'   00-3F  drivers/misc/sgi-gru/grulib.h                           conflict!
>> +'E'   00-0F  xen/gntalloc.h, xen/gntdev.h                            conflict!
> 
> Should be 'G' IMO.

Indeed it should. I'll send a v2.

> 
>>   'H'   00-7F  linux/hiddev.h                                          conflict!
>>   'H'   00-0F  linux/hidraw.h                                          conflict!
>>   'H'   01     linux/mei.h                                             conflict!
>> @@ -176,6 +178,7 @@ Code  Seq#    Include File
>>   'P'   60-6F  sound/sscape_ioctl.h                                    conflict!
>>   'P'   00-0F  drivers/usb/class/usblp.c                               conflict!
>>   'P'   01-09  drivers/misc/pci_endpoint_test.c                        conflict!
>> +'P'   00-0F  xen/privcmd.h                                           conflict!
>>   'Q'   all    linux/soundcard.h
>>   'R'   00-1F  linux/random.h                                          conflict!
>>   'R'   01     linux/rfkill.h                                          conflict!
>>
> 
> 
> Juergen

thanks.
-- 
~Randy

