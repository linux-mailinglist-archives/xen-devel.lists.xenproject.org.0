Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F7228A7CC
	for <lists+xen-devel@lfdr.de>; Sun, 11 Oct 2020 16:37:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5687.14757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRcRp-0000NN-S8; Sun, 11 Oct 2020 14:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5687.14757; Sun, 11 Oct 2020 14:35:41 +0000
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
	id 1kRcRp-0000My-P1; Sun, 11 Oct 2020 14:35:41 +0000
Received: by outflank-mailman (input) for mailman id 5687;
 Sun, 11 Oct 2020 14:35:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJVw=DS=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1kRcRn-0000Mt-9t
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2020 14:35:39 +0000
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20cb1483-4fb8-48cf-aefb-a8dcc08c46e0;
 Sun, 11 Oct 2020 14:35:35 +0000 (UTC)
Received: from 76-24-144-85.ftth.glasoperator.nl ([85.144.24.76]:56432
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1kRcUr-0008Av-Eq; Sun, 11 Oct 2020 16:38:49 +0200
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DJVw=DS=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
	id 1kRcRn-0000Mt-9t
	for xen-devel@lists.xenproject.org; Sun, 11 Oct 2020 14:35:39 +0000
X-Inumbo-ID: 20cb1483-4fb8-48cf-aefb-a8dcc08c46e0
Received: from server.eikelenboom.it (unknown [91.121.65.215])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 20cb1483-4fb8-48cf-aefb-a8dcc08c46e0;
	Sun, 11 Oct 2020 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=f3ScdoKbWWtzolAVZqhfqcwl0CNfWJlmgxLIUvsk+wE=; b=BNmC9crCveMS9V3BmyatkLQ6zI
	C+exz9is9IapLhk2IWBE8lakxI+EOwHuLz6E/p5UljCf+sOuguD5Mjaj+fwP9ZZ7XygFefovf7IOn
	JJtfT4SQpH02yiO3G6yNB6XzbhivRlr3WULE56yBBVUjLYwkXzJbHtuhO3osB89T/XWE=;
Received: from 76-24-144-85.ftth.glasoperator.nl ([85.144.24.76]:56432 helo=[172.16.1.50])
	by server.eikelenboom.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <linux@eikelenboom.it>)
	id 1kRcUr-0008Av-Eq; Sun, 11 Oct 2020 16:38:49 +0200
Subject: Re: [SUSPECTED SPAM]Xen-unstable :can't boot HVM guests, bisected to
 commit: "hvmloader: indicate ACPI tables with "ACPI data" type in e820"
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>
References: <9293a9e1-e507-4788-5460-d5ec9abc1af9@eikelenboom.it>
 <bbc026b0-06f1-a052-030d-d6757dda89b9@citrix.com>
 <24413d2e-5665-bc36-452b-af5c9b1af0b8@eikelenboom.it>
 <a7e46051-999d-fa5a-6707-d4c6e61727bb@citrix.com>
 <03219f26-3a2c-edcd-6654-a084102f9020@citrix.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <71d09f23-8931-4cfc-a49a-6787c0b6ba5c@eikelenboom.it>
Date: Sun, 11 Oct 2020 16:35:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <03219f26-3a2c-edcd-6654-a084102f9020@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/10/2020 13:20, Igor Druzhinin wrote:
> On 11/10/2020 11:40, Igor Druzhinin wrote:
>> On 11/10/2020 10:43, Sander Eikelenboom wrote:
>>> On 11/10/2020 02:06, Igor Druzhinin wrote:
>>>> On 10/10/2020 18:51, Sander Eikelenboom wrote:
>>>>> Hi Igor/Jan,
>>>>>
>>>>> I tried to update my AMD machine to current xen-unstable, but
>>>>> unfortunately the HVM guests don't boot after that. The guest keeps
>>>>> using CPU-cycles but I don't get to a command prompt (or any output at
>>>>> all). PVH guests run fine.
>>>>>
>>>>> Bisection leads to commit:
>>>>>
>>>>> 8efa46516c5f4cf185c8df179812c185d3c27eb6
>>>>> hvmloader: indicate ACPI tables with "ACPI data" type in e820
>>>>>
>>>>> I tried xen-unstable with this commit reverted and with that everything
>>>>> works fine.
>>>>>
>>>>> I attached the xl-dmesg output.
>>>>
>>>> What guests are you using? 
>>> Not sure I understand what you ask for, but:
>>> dom0 PV
>>> guest HVM (qemu-xen)
>>>
>>>> Could you get serial output from the guest?
>>> Not getting any, it seems to be stuck in very early boot.
>>>
>>>> Is it AMD specific?
>>> Can't tell, this is the only machine I test xen-unstable on.
>>> It's a AMD phenom X6.
>>> Both dom0 and guest kernel are 5.9-rc8.
>>>
>>> Tested with guest config:
>>> kernel      = '/boot/vmlinuz-xen-guest'
>>> ramdisk     = '/boot/initrd.img-xen-guest'
>>>
>>> cmdline     = 'root=UUID=7cc4a90d-d6b0-4958-bb7d-50497aa29f18 ro
>>> nomodeset console=tty1 console=ttyS0 console=hvc0 earlyprintk=xen'
>>>
>>> type='hvm'
>>>
>>> device_model_version = 'qemu-xen'
>>>
>>> cpus        = "2-5"
>>> vcpus = 2
>>>
>>> memory      = '512'
>>>
>>> disk        = [
>>>                   'phy:/dev/xen_vms_ssd/media,xvda,w'
>>>               ]
>>>
>>> name        = 'guest'
>>>
>>> vif         = [ 'bridge=xen_bridge,ip=192.168.1.10,mac=00:16:3E:DC:0A:F1' ]
>>>
>>> on_poweroff = 'destroy'
>>> on_reboot   = 'restart'
>>> on_crash    = 'preserve'
>>>
>>> vnc=0
>>>
>>>
>>>> If it's a Linux guest could you get a stacktrace from
>>>> the guest using xenctx?
>>>
>>> It is, here are few subsequent runs:
>>>
>>> ~# /usr/local/lib/xen/bin/xenctx -s
>>> /boot/System.map-5.9.0-rc8-20201010-doflr-mac80211debug+ -f -a -C 4
>>> vcpu0:
>>> cs:eip: ca80:00000256
>>
>> Ok, it's stuck in linuxboot.bin option ROM. That's not something we test in Citrix -
>> we don't use fw_cfg. It could be something with caching (given it's moving but slowly) or a
>> bug uncovered by memory map changes. I'll try to get a repro on Monday.
> 
> Right, I think I know what will fix your problem - could you flip "ACPI data"
> type to "ACPI NVS" in my commit.

Just did and the guest now boots fine.

--
Sander

> Jan, this is what we've discussed on the list as an ambiguity in ACPI spec but
> couldn't reach a clean resolution after all.
> SeaBIOS thinks that "ACPI data" type is essentially RAM that could be reported
> as RAM resource to the guest in E801.
> https://wiki.osdev.org/Detecting_Memory_(x86)#BIOS_Function:_INT_0x15.2C_AX_.3D_0xE801
> 
> // Calculate the maximum ramsize (less than 4gig) from e820 map.
> static void
> calcRamSize(void)
> {
>     u32 rs = 0;
>     int i;
>     for (i=e820_count-1; i>=0; i--) {
>         struct e820entry *en = &e820_list[i];
>         u64 end = en->start + en->size;
>         u32 type = en->type;
>         if (end <= 0xffffffff && (type == E820_ACPI || type == E820_RAM)) {
>             rs = end;
>             break;
>         }
>     }
>     LegacyRamSize = rs >= 1024*1024 ? rs : 1024*1024;
> }
> 
> what is wrong here I think is that it clearly doesn't handle holes and worked more
> by luck. So SeaBIOS needs to be fixed but I think that using ACPI NVS in hvmloader
> is still safer.
> 
> Igor
> 


