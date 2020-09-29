Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4454427D420
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 19:08:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313.884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNJ6O-0002Y3-Fp; Tue, 29 Sep 2020 17:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313.884; Tue, 29 Sep 2020 17:07:44 +0000
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
	id 1kNJ6O-0002XX-Bm; Tue, 29 Sep 2020 17:07:44 +0000
Received: by outflank-mailman (input) for mailman id 313;
 Tue, 29 Sep 2020 17:07:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pXYx=DG=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kNJ6N-0002W9-3A
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 17:07:43 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a9e3c31-b19c-452c-ae0d-8666212bb1e1;
 Tue, 29 Sep 2020 17:07:40 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNJ65-00085E-Vd; Tue, 29 Sep 2020 17:07:25 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNJ65-0008Ln-Ky; Tue, 29 Sep 2020 17:07:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pXYx=DG=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kNJ6N-0002W9-3A
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 17:07:43 +0000
X-Inumbo-ID: 9a9e3c31-b19c-452c-ae0d-8666212bb1e1
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9a9e3c31-b19c-452c-ae0d-8666212bb1e1;
	Tue, 29 Sep 2020 17:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=pXIxgdnz10wM/s/jVlFF+c6uY53/sKW71WxOgoqppKI=; b=c0Zvzx0vYqWZVmfIVV1kNlmpVw
	/C9ZnOH4OlA6IOctiXYNIENaBN60VxMj9Li461j6GTO535qrCjWOpNYgw6aFaRnQnJkkykpO6Yuiq
	lyU2LobPLtXwnv8bdX9fDlV4isK1QnMBJFsBKOc1LbPB4VCYiHybYtM2t2TfnaEK/reA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNJ65-00085E-Vd; Tue, 29 Sep 2020 17:07:25 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNJ65-0008Ln-Ky; Tue, 29 Sep 2020 17:07:25 +0000
Subject: Re: [PATCH 0/4] xen/arm: Unbreak ACPI
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: xen-devel@lists.xenproject.org, masami.hiramatsu@linaro.org,
 ehem+xen@m5p.com, bertrand.marquis@arm.com, andre.przywara@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200926205542.9261-1-julien@xen.org> <87k0wcppnj.fsf@linaro.org>
From: Julien Grall <julien@xen.org>
Message-ID: <5afbce1c-0c45-4b8c-771a-f83b91328e4a@xen.org>
Date: Tue, 29 Sep 2020 18:07:21 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87k0wcppnj.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Alex,

On 29/09/2020 16:29, Alex Bennée wrote:
> 
> Julien Grall <julien@xen.org> writes:
> 
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Hi all,
>>
>> Xen on ARM has been broken for quite a while on ACPI systems. This
>> series aims to fix it.
>>
>> Unfortunately I don't have a system with ACPI v6.0 or later (QEMU seems
>> to only support 5.1). So I did only some light testing.
> 
> I was hoping to get more diagnostics out to get it working under QEMU
> TCG so I think must of missed a step:
> 
>    Loading Xen 4.15-unstable ...
>    Loading Linux 4.19.0-11-arm64 ...
>    Loading initial ramdisk ...
>    Using modules provided by bootloader in FDT
>    Xen 4.15-unstable (c/s Sat Sep 26 21:55:42 2020 +0100 git:72f3d495d0) EFI loader
>    ...silence...
> 
> I have a grub installed from testing on a buster base:
> 
>    dpkg --status grub-arm64-efi
>    Version: 2.04-8
> 
> With:
> 
>    GRUB_CMDLINE_LINUX_DEFAULT=""
>    GRUB_CMDLINE_LINUX="console=ttyAMA0"
>    GRUB_CMDLINE_LINUX_XEN_REPLACE="console=hvc0 earlyprintk=xen"
>    GRUB_CMDLINE_XEN="loglvl=all guest_loglvl=all com1=115200,8n1,0x3e8,5console=com1,vg"
> 
> And I built Xen with --enable-systemd and tweaked the hypervisor .config:
> 
>    CONFIG_EXPERT=y
>    CONFIG_ACPI=y
> 
> So any pointers to make it more verbose would be helpful.

The error is hapenning before Xen setup the console. You can get early 
output on QEMU if you rebuild Xen with the following .config options:

CONFIG_DEBUG=y
CONFIG_EARLY_UART_CHOICE_PL011=y
CONFIG_EARLY_UART_PL011=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_UART_BASE_ADDRESS=0x09000000
CONFIG_EARLY_UART_PL011_BAUD_RATE=0
CONFIG_EARLY_PRINTK_INC="debug-pl011.inc"

Cheers,

-- 
Julien Grall

