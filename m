Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAD181A7D7
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 21:59:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658257.1027371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG3ei-00043y-4q; Wed, 20 Dec 2023 20:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658257.1027371; Wed, 20 Dec 2023 20:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG3ei-000412-12; Wed, 20 Dec 2023 20:59:04 +0000
Received: by outflank-mailman (input) for mailman id 658257;
 Wed, 20 Dec 2023 20:59:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3yS4=H7=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rG3eg-00040w-QU
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 20:59:02 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98b1ea26-9f7a-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 21:59:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7825082859FC;
 Wed, 20 Dec 2023 14:58:58 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id YSBicA4j1kmp; Wed, 20 Dec 2023 14:58:58 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D86E88285AB9;
 Wed, 20 Dec 2023 14:58:57 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id rEnnkCTUCbhP; Wed, 20 Dec 2023 14:58:56 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 35AF582859FC;
 Wed, 20 Dec 2023 14:58:56 -0600 (CST)
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
X-Inumbo-ID: 98b1ea26-9f7a-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com D86E88285AB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1703105937; bh=CjGfFdazNR8NgpvmDTiqSJiAfNIEj67MpaEtLjAE0r4=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=X0sPiHjUifFmHxlsZXhvQe48nqOBOsURsOVuxF0HYZ7U4Pi3IU4bDCBydR/fIW1nK
	 ighHevKBUBa0c9hGLE3D5dy8clZIO451+JXO1EREVO8k2+W/QwjutOUaV9bQULMPLI
	 ly9lMbL3foybKO/ZAXyRUrag08AjNjaUu3xcWUDM=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <cb2f543b-ef29-4174-8437-dc875c27daab@raptorengineering.com>
Date: Wed, 20 Dec 2023 14:58:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] xen/common: Move Arm's bootfdt to common
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <b26a07209b54cd036e42a8b00f036201821eb775.1702607884.git.sanastasio@raptorengineering.com>
 <3546ec55-3e0c-4fdc-9697-0105d20bacfd@suse.com>
 <5fc9ad7a-1281-46da-abff-0aa2d2beca14@xen.org>
 <69c5afde-3a24-4792-b4e5-3ce17cb1602d@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <69c5afde-3a24-4792-b4e5-3ce17cb1602d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/20/23 2:09 AM, Jan Beulich wrote:
> On 19.12.2023 19:29, Julien Grall wrote:
>> On 19/12/2023 17:03, Jan Beulich wrote:
>>> On 15.12.2023 03:43, Shawn Anastasio wrote:
>>>> --- a/xen/arch/arm/bootfdt.c
>>>> +++ b/xen/common/device-tree/bootfdt.c
>>>> @@ -431,12 +431,15 @@ static int __init early_scan_node(const void *fdt,
>>>>   {
>>>>       int rc = 0;
>>>>   
>>>> -    /*
>>>> -     * If Xen has been booted via UEFI, the memory banks are
>>>> -     * populated. So we should skip the parsing.
>>>> -     */
>>>> -    if ( !efi_enabled(EFI_BOOT) &&
>>>> -         device_tree_node_matches(fdt, node, "memory") )
>>>> +    if ( device_tree_node_matches(fdt, node, "memory") )
>>>> +#if defined(CONFIG_ARM_EFI)
>>>> +        /*
>>>> +         * If Xen has been booted via UEFI, the memory banks are
>>>> +         * populated. So we should skip the parsing.
>>>> +         */
>>>> +        if ( efi_enabled(EFI_BOOT) )
>>>> +            return rc;
>>>> +#endif
>>>
>>> I'm not a DT maintainer, but I don't like this kind of #ifdef, the more
>>> that maybe PPC and quite likely RISC-V are likely to also want to support
>>> EFI boot. But of course there may be something inherently Arm-specific
>>> here that I'm unaware of.
>>
>> Right now, I can't think how this is Arm specific. If you are using 
>> UEFI, then you are expected to use the UEFI memory map rather than the 
>> content of the device-tree.
>>
>> However, we don't have a CONFIG_EFI option. It would be nice to 
>> introduce one but I am not sure I would introduce it just for this #ifdef.
> 
> Right, hence why I also wasn't suggesting to go that route right away.
> efi/common-stub.c already has a stub for efi_enabled(). Using that file
> may be too involved to arrange for in PPC, but supplying such a stub
> elsewhere for the time being looks like it wouldn't too much effort
> (and would eliminate the need for any #ifdef here afaict). Shawn?
> 

To clarify, you're suggesting we add an efi_enabled stub somewhere in
arch/ppc? I'm not against that, though it does seem a little silly to
have to define EFI-specific functions on an architecture that will never
support EFI.

Stil, if you think it's preferable to adding the ifdef here then I'm not
against it.

> Jan

Thanks,
Shawn

