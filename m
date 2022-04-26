Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B839550F372
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 10:10:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313507.531056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njGHS-0004Fp-36; Tue, 26 Apr 2022 08:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313507.531056; Tue, 26 Apr 2022 08:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njGHR-0004D8-WE; Tue, 26 Apr 2022 08:10:42 +0000
Received: by outflank-mailman (input) for mailman id 313507;
 Tue, 26 Apr 2022 08:10:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/O6=VE=phptrix.de=einsle@srs-se1.protection.inumbo.net>)
 id 1njGHQ-0004D2-F9
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 08:10:40 +0000
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bb8f13c-c538-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 10:10:39 +0200 (CEST)
Received: from mail.phptrix.de ([93.233.10.210]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MQNF3-1nVsFz2OSv-00MKFC for <xen-devel@lists.xenproject.org>; Tue, 26 Apr
 2022 10:10:38 +0200
Received: (qmail 2393 invoked by uid 210); 26 Apr 2022 10:10:37 +0200
Received: from chromecast.phptrix.de (HELO ?192.168.139.156?)
 (einsle@192.168.139.156)
 by portfish.phptrix.de with ESMTPA; 26 Apr 2022 10:10:37 +0200
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
X-Inumbo-ID: 5bb8f13c-c538-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=phptrix.de;
	s=default; h=Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	References:From:In-Reply-To:Content-Type:
	Content-Transfer-Encoding; bh=mklG6v4vScYJWt3mI0Idt2vqOo0=; b=B/
	MkorV3hlxS9LB+1F0/Yd9lhP92DIDjaDszSoDsVPjmPOW0b6s9uOIkNtVslGpBti
	HSmeXAMo0fNiVSpgqJS0EqTuQRNn0fQPrXJAMP7tHvl6M1S+EmQLS3eogHTQuhc4
	noaKJ9DnH/YOOdkOHLXHS40lKd8iKYsyw4+PUPB8Q=
DomainKey-Signature: a=rsa-sha1; q=dns; c=simple;
  s=default; d=phptrix.de;
  b=J+1lp8v2D3jl97b7bRGmTPWyGJTPplkCcTgCDvDPTHzIFpw2tnDg874+yGm437wVWvo2ujTxVPH/pR430pexoD8fjq0w+7E/l7bFOETG81h3KDlf31fhBfKt+wuBRDaQZQt98vDCp61WJ5WRwmYGnh5hRACHB8T4pNE1nITJulw=;
X-Qmail-Scanner-Diagnostics: from chromecast.phptrix.de (einsle@chromecast.phptrix.de) by portfish (envelope-from <einsle@phptrix.de>, uid 201) with qmail-scanner-2.11st 
 (clamdscan: 0.100.1/26337. spamassassin: 3.4.1. perlscan: 2.11st.  
 Clear:RC:1(192.168.139.156):. 
 Processed in 0.021908 secs); 26 Apr 2022 08:10:37 -0000
Message-ID: <8ec2423f-d968-54d4-4bc4-fd8ded3d1fa0@phptrix.de>
Date: Tue, 26 Apr 2022 10:10:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: DomU Windows Server Essentials crashes with xen 4.16 but works
 with xen 4.14
To: xen-devel@lists.xenproject.org
References: <18bd542a-a649-c78b-b575-c62b4d533e44@phptrix.de>
 <YmeZ/8wtKJy7zzmS@Air-de-Roger>
From: Steffen Einsle <einsle@phptrix.de>
In-Reply-To: <YmeZ/8wtKJy7zzmS@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nqWzTxYPosD4SQBFaBmtju1gWh84mfbVDG0oXobudHlQc8MM5VC
 rMX7PvYMwL0CiCb4JJjgyUsHdHVH4HZ9z8iAm6GhrceELlRNMFv3GZueSbzkTGIiq4IAbvh
 3yy0/cJZCB08jKfTjXSJxpRRqmwyU+yB/PcgCfNzyVC6h2e2DvLjLUcVrbvu57gbvvjXdlM
 ZdspJbHrxb9Z67D4qsJKQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aBFFIyY4FVE=:JjRN1nieKepL8YEnJT6g1j
 AFZXjRcsIP/F6Y+K82fpqMHP5riIjVGmpqYaGDSUz6xXyZ1KEpMWaQRl968mAIb8QAJZ8uix9
 XJqXrK0s1e0HEn5JrQYNmftS2+lrWywAp7tX+VwATF3oLx4cLNmImZ8rFBZpeDmUtMoqcgZF8
 paTzyrfuS6EjDK0xry4imypwhbj2N3oGQ8FoK/aTXLGhxEl+GnHoDBATiUX+yf4A1K7Q8ElOY
 qY+PL0jld5lYzcUmdg8vizZC0H654OvGbXjVBXt4gSJOC3+477sta8W8xEEgPbDduL4PfutFI
 mM9HYJ0HOCnIJ52yoQVXF31xnpI5pkN1clkHLCZHNEqc2REoPtw8zM3o8RGBsrBMd2t7M2+5P
 cRtLbqsEZn3/VQQq998uaJPCUTk3gCCYkIZrMPkQYQKejxSF/PTEa8yfeIh/tfU9Ud0/nQo59
 fqw8T3yngPU6JhXgz3bmyPYqkkVGmONqpBNh+Ry4Lm01kUrWVQmoIKy9A1FB5rUcP7K8HnNp5
 72yHWq3sSagbRu7xPwFHGcyda/s51HBuSDqF2Qs+kTOnoGj9pxqdccq1FgpbEf7E7VpLfj1fY
 FdzbZNr8a2pxeuysfF+USaG27kVzaf8JaBfepYjzFhwcvI6pKU0YcBxd4rmSi5kNK8TktR7DD
 okU7Nytzjzsn7ZxJYoqEWsCLvcLF88vuFtmp0rZoeT7QMohvCE2JIgj7XSxtMV30LRz4=

Hello,

I can confirm that "msr_relaxed = 1" solves the problem with Server 2019 
Essentials crashing.

Am 26.04.2022 um 09:06 schrieb Roger Pau Monné:
> On Mon, Apr 25, 2022 at 07:19:08PM +0200, Steffen Einsle wrote:
>> Hello Everyone,
>>
>> I have some xen servers I recently tried to update from xen 4.14 to xen 4.16
>>
>> Everything worked without problem, except for the Windows Server Essentials
>> DomUs.
>>
>> With xen 4.16 those domains crashed (reproducable) during boot -
>> KMODE_EXCEPTION_NOT_HANDLED.
>>
>> I tried to install a new DomU Windows Server 2019 Essentials - this VM
>> crashed at the first reboot
>> (still in the installation routine) with the same error. No PV-drivers
>> installed yet.
>>
>> I switched back to xen 4.14 and all VMs booted ok without problem.
>>
>> All other VMs (Linux-PV, Windows-HVM (2008r2, 2012r2, 2016, 2019, 2022)
>> show no problems, only
>> the Windows Server Essentials crashes with xen 4.16.
>>
>> The system is a gentoo kernel 5.17.3, qemu-6.2.0-r4, xen-4.16.0-r5,
>> xen-tools-4.16.0-r1
>>
>> My working configuration is gentoo kernel 5.17.3, qemu-5.2.0-r2,
>> xen-4.14.3-r2, xen-tools-4.14.3
>>
>> My DomU config file looks like this
>>
>> name = 'DC-Server'
>> type = 'hvm'
>> memory = '8192'
>> vcpus = '6'
>> vif = [ 'mac=00:16:3E:ab:cd:50,bridge=br0' ]
>> disk = [ '/dev/vg1/ServerSys,raw,hda,rw',
>>                '/dev/vg1/ServerData,raw,hdb,rw' ]
>> viridian = 'all'
>> localtime = '1'
>> vnc = '1'
>> keymap = 'de'
>> vnclisten = '0.0.0.0:10,websocket'
>> usb = '1'
>> usbdevice = 'tablet'
>> on_crash  = 'restart'
>> boot = 'c'
>> xen_platform_pci = '1'
>> max_grant_frames = 128
> Could you try adding:
>
> msr_relaxed=1
>
> And see if that makes a difference?
>
> Thanks, Roger.

