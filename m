Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C558581A8C5
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 23:11:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658353.1027481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG4mJ-00057I-V0; Wed, 20 Dec 2023 22:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658353.1027481; Wed, 20 Dec 2023 22:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG4mJ-00054X-SE; Wed, 20 Dec 2023 22:10:59 +0000
Received: by outflank-mailman (input) for mailman id 658353;
 Wed, 20 Dec 2023 22:10:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BBWR=H7=raptorengineering.com=tpearson@srs-se1.protection.inumbo.net>)
 id 1rG4mI-00054L-5o
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 22:10:58 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4834d65-9f84-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 23:10:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5E9068284FC9;
 Wed, 20 Dec 2023 16:10:53 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id kqAlj1ybYgWe; Wed, 20 Dec 2023 16:10:51 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5E4CF82856F0;
 Wed, 20 Dec 2023 16:10:51 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id hQRdtyCgcE8s; Wed, 20 Dec 2023 16:10:51 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 35E718284FC9;
 Wed, 20 Dec 2023 16:10:51 -0600 (CST)
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
X-Inumbo-ID: a4834d65-9f84-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 5E4CF82856F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1703110251; bh=3dboC0tFlDmqZ387pwzKoAof96oNfvisCWonISzlbQ0=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=vPvuWzBirRih68dV2RFORW0Jp2PSQ0l7KlsGCvlEzUVfRc2RBrLOwCaTT6j0Q4XEY
	 I3kCIY2APvSAzwlNYyPGKh+98zDpomKZy3kjOiSEtvFaF+/0ZcHE2oKcDYQfYOt0KI
	 fsvUcQGCD6rTp3jNU5vdOfrZRWxufE/WVGsBqv7g=
X-Virus-Scanned: amavisd-new at rptsys.com
Date: Wed, 20 Dec 2023 16:10:51 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Julien Grall <julien@xen.org>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Jan Beulich <jbeulich@suse.com>, 
	Timothy Pearson <tpearson@raptorengineering.com>, 
	xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <154177700.148441.1703110251040.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <7a228bc8-7c2f-46fa-9ee6-5266f65e767b@xen.org>
References: <cover.1702607884.git.sanastasio@raptorengineering.com> <b26a07209b54cd036e42a8b00f036201821eb775.1702607884.git.sanastasio@raptorengineering.com> <3546ec55-3e0c-4fdc-9697-0105d20bacfd@suse.com> <5fc9ad7a-1281-46da-abff-0aa2d2beca14@xen.org> <69c5afde-3a24-4792-b4e5-3ce17cb1602d@suse.com> <cb2f543b-ef29-4174-8437-dc875c27daab@raptorengineering.com> <7a228bc8-7c2f-46fa-9ee6-5266f65e767b@xen.org>
Subject: Re: [PATCH v2 3/7] xen/common: Move Arm's bootfdt to common
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC120 (Linux)/8.5.0_GA_3042)
Thread-Topic: xen/common: Move Arm's bootfdt to common
Thread-Index: BUVobMRhmpwqCQGoml0nMQvJh7/n0w==



----- Original Message -----
> From: "Julien Grall" <julien@xen.org>
> To: "Shawn Anastasio" <sanastasio@raptorengineering.com>, "Jan Beulich" <jbeulich@suse.com>
> Cc: "Timothy Pearson" <tpearson@raptorengineering.com>, "xen-devel" <xen-devel@lists.xenproject.org>
> Sent: Wednesday, December 20, 2023 4:08:30 PM
> Subject: Re: [PATCH v2 3/7] xen/common: Move Arm's bootfdt to common

> Hi,
> 
> On 20/12/2023 20:58, Shawn Anastasio wrote:
>> On 12/20/23 2:09 AM, Jan Beulich wrote:
>>> On 19.12.2023 19:29, Julien Grall wrote:
>>>> On 19/12/2023 17:03, Jan Beulich wrote:
>>>>> On 15.12.2023 03:43, Shawn Anastasio wrote:
>>>>>> --- a/xen/arch/arm/bootfdt.c
>>>>>> +++ b/xen/common/device-tree/bootfdt.c
>>>>>> @@ -431,12 +431,15 @@ static int __init early_scan_node(const void *fdt,
>>>>>>    {
>>>>>>        int rc = 0;
>>>>>>    
>>>>>> -    /*
>>>>>> -     * If Xen has been booted via UEFI, the memory banks are
>>>>>> -     * populated. So we should skip the parsing.
>>>>>> -     */
>>>>>> -    if ( !efi_enabled(EFI_BOOT) &&
>>>>>> -         device_tree_node_matches(fdt, node, "memory") )
>>>>>> +    if ( device_tree_node_matches(fdt, node, "memory") )
>>>>>> +#if defined(CONFIG_ARM_EFI)
>>>>>> +        /*
>>>>>> +         * If Xen has been booted via UEFI, the memory banks are
>>>>>> +         * populated. So we should skip the parsing.
>>>>>> +         */
>>>>>> +        if ( efi_enabled(EFI_BOOT) )
>>>>>> +            return rc;
>>>>>> +#endif
>>>>>
>>>>> I'm not a DT maintainer, but I don't like this kind of #ifdef, the more
>>>>> that maybe PPC and quite likely RISC-V are likely to also want to support
>>>>> EFI boot. But of course there may be something inherently Arm-specific
>>>>> here that I'm unaware of.
>>>>
>>>> Right now, I can't think how this is Arm specific. If you are using
>>>> UEFI, then you are expected to use the UEFI memory map rather than the
>>>> content of the device-tree.
>>>>
>>>> However, we don't have a CONFIG_EFI option. It would be nice to
>>>> introduce one but I am not sure I would introduce it just for this #ifdef.
>>>
>>> Right, hence why I also wasn't suggesting to go that route right away.
>>> efi/common-stub.c already has a stub for efi_enabled(). Using that file
>>> may be too involved to arrange for in PPC, but supplying such a stub
>>> elsewhere for the time being looks like it wouldn't too much effort
>>> (and would eliminate the need for any #ifdef here afaict). Shawn?
>>>
>> 
>> To clarify, you're suggesting we add an efi_enabled stub somewhere in
>> arch/ppc? I'm not against that, though it does seem a little silly to
>> have to define EFI-specific functions on an architecture that will never
>> support EFI.
> 
> (This is not an argument for adding efi_enabled in arch/ppc)
> 
> I am curious to know why you think that. This is just software and
> therefore doesn't seem to be technically impossible. I mean who
> originally thought that ACPI would come to Arm? :) And yet we now have
> HWs (mainly servers) which provides only ACPI + UEFI.

It's not a technical restriction, it's an architecture specifiction and compatibility (standardization) restriction.  POWER has its own interfaces (OPAL etc.) that provide the functionality ACPI provides on x86/ARM, and fragmenting the ecosystem across two interface standards is not something that any of the key stakeholders are currently willing to do.

Just some background, I have no comment on the actual technical implementation in the patch. :)

Thanks!

