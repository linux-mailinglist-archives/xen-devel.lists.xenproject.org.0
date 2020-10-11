Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0BE28A6B6
	for <lists+xen-devel@lfdr.de>; Sun, 11 Oct 2020 11:44:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5610.14579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRXtQ-0004tx-Qn; Sun, 11 Oct 2020 09:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5610.14579; Sun, 11 Oct 2020 09:43:52 +0000
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
	id 1kRXtQ-0004tY-NP; Sun, 11 Oct 2020 09:43:52 +0000
Received: by outflank-mailman (input) for mailman id 5610;
 Sun, 11 Oct 2020 09:43:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJVw=DS=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1kRXtP-0004tS-BH
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2020 09:43:51 +0000
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8a1d4c0-983c-4068-8f73-ac25a1f009e1;
 Sun, 11 Oct 2020 09:43:48 +0000 (UTC)
Received: from 76-24-144-85.ftth.glasoperator.nl ([85.144.24.76]:54102
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1kRXwS-0006uf-Ue; Sun, 11 Oct 2020 11:47:01 +0200
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DJVw=DS=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
	id 1kRXtP-0004tS-BH
	for xen-devel@lists.xenproject.org; Sun, 11 Oct 2020 09:43:51 +0000
X-Inumbo-ID: b8a1d4c0-983c-4068-8f73-ac25a1f009e1
Received: from server.eikelenboom.it (unknown [91.121.65.215])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b8a1d4c0-983c-4068-8f73-ac25a1f009e1;
	Sun, 11 Oct 2020 09:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TbcVuUDAMh5k/dQPsShWjaIzQRL9Lld6a1obbcUbXcw=; b=f6qzkOfJuQlVCi+hQqNshOWPBk
	7bvAZvh2M1DG7C784lNEeKEyKmJk/dBOW7Rp5L4gRxI0xGI7DyylKNid00gW0n+e+Y7dhssN2nkri
	jiJZCH1H72spxtS0OQkVIp2jGWwhH5mt9z72GmzuaQGQ7CXYtXTMbTsBtwDxEqta/XPQ=;
Received: from 76-24-144-85.ftth.glasoperator.nl ([85.144.24.76]:54102 helo=[172.16.1.50])
	by server.eikelenboom.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <linux@eikelenboom.it>)
	id 1kRXwS-0006uf-Ue; Sun, 11 Oct 2020 11:47:01 +0200
Subject: Re: [SUSPECTED SPAM]Xen-unstable :can't boot HVM guests, bisected to
 commit: "hvmloader: indicate ACPI tables with "ACPI data" type in e820"
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>
References: <9293a9e1-e507-4788-5460-d5ec9abc1af9@eikelenboom.it>
 <bbc026b0-06f1-a052-030d-d6757dda89b9@citrix.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <24413d2e-5665-bc36-452b-af5c9b1af0b8@eikelenboom.it>
Date: Sun, 11 Oct 2020 11:43:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <bbc026b0-06f1-a052-030d-d6757dda89b9@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/10/2020 02:06, Igor Druzhinin wrote:
> On 10/10/2020 18:51, Sander Eikelenboom wrote:
>> Hi Igor/Jan,
>>
>> I tried to update my AMD machine to current xen-unstable, but
>> unfortunately the HVM guests don't boot after that. The guest keeps
>> using CPU-cycles but I don't get to a command prompt (or any output at
>> all). PVH guests run fine.
>>
>> Bisection leads to commit:
>>
>> 8efa46516c5f4cf185c8df179812c185d3c27eb6
>> hvmloader: indicate ACPI tables with "ACPI data" type in e820
>>
>> I tried xen-unstable with this commit reverted and with that everything
>> works fine.
>>
>> I attached the xl-dmesg output.
> 
> What guests are you using? 
Not sure I understand what you ask for, but:
dom0 PV
guest HVM (qemu-xen)

> Could you get serial output from the guest?
Not getting any, it seems to be stuck in very early boot.

> Is it AMD specific?
Can't tell, this is the only machine I test xen-unstable on.
It's a AMD phenom X6.
Both dom0 and guest kernel are 5.9-rc8.

Tested with guest config:
kernel      = '/boot/vmlinuz-xen-guest'
ramdisk     = '/boot/initrd.img-xen-guest'

cmdline     = 'root=UUID=7cc4a90d-d6b0-4958-bb7d-50497aa29f18 ro
nomodeset console=tty1 console=ttyS0 console=hvc0 earlyprintk=xen'

type='hvm'

device_model_version = 'qemu-xen'

cpus        = "2-5"
vcpus = 2

memory      = '512'

disk        = [
                  'phy:/dev/xen_vms_ssd/media,xvda,w'
              ]

name        = 'guest'

vif         = [ 'bridge=xen_bridge,ip=192.168.1.10,mac=00:16:3E:DC:0A:F1' ]

on_poweroff = 'destroy'
on_reboot   = 'restart'
on_crash    = 'preserve'

vnc=0


>If it's a Linux guest could you get a stacktrace from
> the guest using xenctx?

It is, here are few subsequent runs:

~# /usr/local/lib/xen/bin/xenctx -s
/boot/System.map-5.9.0-rc8-20201010-doflr-mac80211debug+ -f -a -C 4
vcpu0:
cs:eip: ca80:00000256
flags: 00000016 nz a p
ss:esp: 0000:00006f38
eax: 029e0012	ebx: 0000fb00	ecx: 028484e3	edx: 00000511
esi: 00000000	edi: f97b7363	ebp: 00006f38
 ds:     ca80	 es:     0010	 fs:     0000	 gs:     0000

cr0: 00000011
cr2: 00000000
cr3: 00400000
cr4: 00000000

dr0: 00000000
dr1: 00000000
dr2: 00000000
dr3: 00000000
dr6: ffff0ff0
dr7: 00000400
Code (instr addr 00000256)
ff 00 f0 53 ff 00 f0 53 ff 00 f0 53 ff 00 f0 53 ff 00 f0 53 ff <00> f0
53 ff 00 f0 53 ff 00 f0 53



vcpu1 offline

~# /usr/local/lib/xen/bin/xenctx -s
/boot/System.map-5.9.0-rc8-20201010-doflr-mac80211debug+ -f -a -C 4
vcpu0:
cs:eip: ca80:00000256
flags: 00000016 nz a p
ss:esp: 0000:00006f38
eax: 029e0012	ebx: 0000fb00	ecx: 028444b7	edx: 00000511
esi: 00000000	edi: f97bb38f	ebp: 00006f38
 ds:     ca80	 es:     0010	 fs:     0000	 gs:     0000

cr0: 00000011
cr2: 00000000
cr3: 00400000
cr4: 00000000

dr0: 00000000
dr1: 00000000
dr2: 00000000
dr3: 00000000
dr6: ffff0ff0
dr7: 00000400
Code (instr addr 00000256)
ff 00 f0 53 ff 00 f0 53 ff 00 f0 53 ff 00 f0 53 ff 00 f0 53 ff <00> f0
53 ff 00 f0 53 ff 00 f0 53



vcpu1 offline

~# /usr/local/lib/xen/bin/xenctx -s
/boot/System.map-5.9.0-rc8-20201010-doflr-mac80211debug+ -f -a -C 4
vcpu0:
cs:eip: ca80:00000256
flags: 00000016 nz a p
ss:esp: 0000:00006f38
eax: 029e0012	ebx: 0000fb00	ecx: 02840901	edx: 00000511
esi: 00000000	edi: f97bef45	ebp: 00006f38
 ds:     ca80	 es:     0010	 fs:     0000	 gs:     0000

cr0: 00000011
cr2: 00000000
cr3: 00400000
cr4: 00000000

dr0: 00000000
dr1: 00000000
dr2: 00000000
dr3: 00000000
dr6: ffff0ff0
dr7: 00000400
Code (instr addr 00000256)
ff 00 f0 53 ff 00 f0 53 ff 00 f0 53 ff 00 f0 53 ff 00 f0 53 ff <00> f0
53 ff 00 f0 53 ff 00 f0 53



vcpu1 offline

~# /usr/local/lib/xen/bin/xenctx -s
/boot/System.map-5.9.0-rc8-20201010-doflr-mac80211debug+ -f -a -C 4
vcpu0:
cs:eip: ca80:00000256
flags: 00000016 nz a p
ss:esp: 0000:00006f38
eax: 029e0012	ebx: 0000fb00	ecx: 0283d4bd	edx: 00000511
esi: 00000000	edi: f97c2389	ebp: 00006f38
 ds:     ca80	 es:     0010	 fs:     0000	 gs:     0000

cr0: 00000011
cr2: 00000000
cr3: 00400000
cr4: 00000000

dr0: 00000000
dr1: 00000000
dr2: 00000000
dr3: 00000000
dr6: ffff0ff0
dr7: 00000400
Code (instr addr 00000256)
ff 00 f0 53 ff 00 f0 53 ff 00 f0 53 ff 00 f0 53 ff 00 f0 53 ff <00> f0
53 ff 00 f0 53 ff 00 f0 53



vcpu1 offline

~# /usr/local/lib/xen/bin/xenctx -s
/boot/System.map-5.9.0-rc8-20201010-doflr-mac80211debug+ -f -a -C 4
vcpu0:
cs:eip: ca80:00000256
flags: 00000016 nz a p
ss:esp: 0000:00006f38
eax: 029e0012	ebx: 0000fb00	ecx: 02838e90	edx: 00000511
esi: 00000000	edi: f97c69b6	ebp: 00006f38
 ds:     ca80	 es:     0010	 fs:     0000	 gs:     0000

cr0: 00000011
cr2: 00000000
cr3: 00400000
cr4: 00000000

dr0: 00000000
dr1: 00000000
dr2: 00000000
dr3: 00000000
dr6: ffff0ff0
dr7: 00000400
Code (instr addr 00000256)
ff 00 f0 53 ff 00 f0 53 ff 00 f0 53 ff 00 f0 53 ff 00 f0 53 ff <00> f0
53 ff 00 f0 53 ff 00 f0 53



vcpu1 offline


> We have tested the change on all modern guests in our Citrix lab and haven't
> found any problem for several months. 

> Igor
> 

--
Sander


