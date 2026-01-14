Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6AAD1CD10
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 08:26:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202543.1518070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfvH9-0005YX-J3; Wed, 14 Jan 2026 07:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202543.1518070; Wed, 14 Jan 2026 07:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfvH9-0005WX-FJ; Wed, 14 Jan 2026 07:26:43 +0000
Received: by outflank-mailman (input) for mailman id 1202543;
 Wed, 14 Jan 2026 07:26:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S8+q=7T=deutnet.info=agriveaux@srs-se1.protection.inumbo.net>)
 id 1vfvH8-0005Vk-7u
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 07:26:42 +0000
Received: from srv1.deutnet.info (srv1.deutnet.info [2a01:4f8:c2c:6846::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d783c63-f11a-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 08:26:39 +0100 (CET)
Received: from [2a01:e0a:186:d20::ebe]
 by srv1.deutnet.info with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <agriveaux@deutnet.info>) id 1vfvH3-000000043nP-1nS2;
 Wed, 14 Jan 2026 08:26:37 +0100
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
X-Inumbo-ID: 5d783c63-f11a-11f0-9ccf-f158ae23cfc8
Message-ID: <3e937fc7-62bb-404c-9b1b-c4172404bf35@deutnet.info>
Date: Wed, 14 Jan 2026 08:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH XEN] tools: Update files examples PV&PVH with pygrub.
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <aWV5U1hgOYqDBIk2@deutnet.info>
 <a2331e66-24ac-412f-bed5-66d9920f4efc@suse.com>
Content-Language: en-US
From: Alexandre GRIVEAUX <agriveaux@deutnet.info>
In-Reply-To: <a2331e66-24ac-412f-bed5-66d9920f4efc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 13/01/2026 à 07:15, Juergen Gross a écrit :
> On 12.01.26 23:44, Alexandre GRIVEAUX wrote:
>> Update files exemples PV&PVH for non direct kernel boot with pygrub.
>>
>> Signed-off-by: Alexandre GRIVEAUX <agriveaux@deutnet.info>
>> ---
>>   tools/examples/xlexample.pvhlinux | 3 +++
>>   tools/examples/xlexample.pvlinux  | 3 +++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/tools/examples/xlexample.pvhlinux 
>> b/tools/examples/xlexample.pvhlinux
>> index 18305b80af..2bdd43c2c5 100644
>> --- a/tools/examples/xlexample.pvhlinux
>> +++ b/tools/examples/xlexample.pvhlinux
>> @@ -25,6 +25,9 @@ kernel = "/boot/vmlinuz"
>>   # Kernel command line options
>>   extra = "root=/dev/xvda1"
>>   +# Enable to use a grub2 emulation inside guest instead of direct 
>> kernel boot.
>
> I don't think this is correct.
>
> pygrub is running in dom0, not in the guest.
>
>
> Juergen

Hello,


I doesn't understand your reply, yes pygrub is running on the Dom0, and 
this goal is to behave like there is a grub2 on the DomU.


My wording seem too confuse for you ? You would like this:

Enable to use a "grub2 emulation inside guest" instead of direct kernel 
boot.

Or

Enable to use a emulation of grub2 inside guest instead of direct kernel 
boot.

Or

Enable to use a emulation of grub2 for guest instead of direct kernel boot.


For me, using wiktionary:

emulate (computing <https://en.wiktionary.org/wiki/computing#Noun>) of a 
program or device: to imitate another program or device


And according to man page of xl.cfg:

> *bootloader="PROGRAM"* 
> <https://manpages.debian.org/trixie/xen-utils-common/xl.cfg.5.en.html#bootloader=_PROGRAM_>
>     Run "PROGRAM" to find the kernel image and ramdisk to use.
>     Normally "PROGRAM" would be "pygrub", which is an emulation of
>     grub/grub2/syslinux. Either *kernel* or *bootloader* must be
>     specified for PV guests. 

And when using it like with a lx start -c <name>.cfg, one of the screen 
will welcome an user with pygrub.

Thanks.


