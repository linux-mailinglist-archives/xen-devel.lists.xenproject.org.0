Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5EA29E348
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 06:20:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13995.34889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY0ME-00022Y-6S; Thu, 29 Oct 2020 05:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13995.34889; Thu, 29 Oct 2020 05:20:18 +0000
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
	id 1kY0ME-000229-2a; Thu, 29 Oct 2020 05:20:18 +0000
Received: by outflank-mailman (input) for mailman id 13995;
 Thu, 29 Oct 2020 05:20:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FUbw=EE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kY0MC-000224-MS
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 05:20:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3a6a871-87ce-4e23-90b9-39757f738e18;
 Thu, 29 Oct 2020 05:20:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 633F0AC24;
 Thu, 29 Oct 2020 05:20:13 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FUbw=EE=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kY0MC-000224-MS
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 05:20:16 +0000
X-Inumbo-ID: e3a6a871-87ce-4e23-90b9-39757f738e18
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e3a6a871-87ce-4e23-90b9-39757f738e18;
	Thu, 29 Oct 2020 05:20:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603948813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UqG24I0rIDcFpF42E+Xl4MYf85CfDEjpNOAxMWy7yb4=;
	b=POFoYiJsKF3XKRRcPa3mj6IftjlKH8yQUsF+2tuosfMxzNWkx9YN5SrzJP0EPin/vRFxcR
	K+YKk4vgrSICKAX2rW02LMFwBFnyKioIU21JOYH4JIKXrxBCAYZVkgzlkeGXESiSKEkdR6
	c7Vlhs9FlCXFZvs8GBN8ymtVFt638XA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 633F0AC24;
	Thu, 29 Oct 2020 05:20:13 +0000 (UTC)
Subject: Re: Xen on RP4
To: Stefano Stabellini <sstabellini@kernel.org>,
 Elliott Mitchell <ehem+xen@m5p.com>
Cc: Julien Grall <julien@xen.org>, roman@zededa.com,
 xen-devel@lists.xenproject.org
References: <20201022021655.GA74011@mattapan.m5p.com>
 <alpine.DEB.2.21.2010221620230.12247@sstabellini-ThinkPad-T480s>
 <20201023005629.GA83870@mattapan.m5p.com>
 <alpine.DEB.2.21.2010221801490.12247@sstabellini-ThinkPad-T480s>
 <20201023211941.GA90171@mattapan.m5p.com>
 <alpine.DEB.2.21.2010231647290.12247@sstabellini-ThinkPad-T480s>
 <20201024053540.GA97417@mattapan.m5p.com>
 <4fcf4832-9266-443f-54d0-fa1fff4b6e14@xen.org>
 <20201026160316.GA20589@mattapan.m5p.com>
 <7a904044-8206-b45d-8ec2-d4e48b07ea83@xen.org>
 <20201028015423.GA33407@mattapan.m5p.com>
 <alpine.DEB.2.21.2010281704250.12247@sstabellini-ThinkPad-T480s>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e885b2a9-f6ea-e224-b906-125936cfe550@suse.com>
Date: Thu, 29 Oct 2020 06:20:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010281704250.12247@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.10.20 01:37, Stefano Stabellini wrote:
> On Tue, 27 Oct 2020, Elliott Mitchell wrote:
>> On Mon, Oct 26, 2020 at 06:44:27PM +0000, Julien Grall wrote:
>>> On 26/10/2020 16:03, Elliott Mitchell wrote:
>>>> On Mon, Oct 26, 2020 at 01:31:42PM +0000, Julien Grall wrote:
>>>>> On 24/10/2020 06:35, Elliott Mitchell wrote:
>>>>>> ACPI has a distinct
>>>>>> means of specifying a limited DMA-width; the above fails, because it
>>>>>> assumes a *device-tree*.
>>>>>
>>>>> Do you know if it would be possible to infer from the ACPI static table
>>>>> the DMA-width?
>>>>
>>>> Yes, and it is.  Due to not knowing much about ACPI tables I don't know
>>>> what the C code would look like though (problem is which documentation
>>>> should I be looking at first?).
>>>
>>> What you provided below is an excerpt of the DSDT. AFAIK, DSDT content
>>> is written in AML. So far the shortest implementation I have seen for
>>> the AML parser is around 5000 lines (see [1]). It might be possible to
>>> strip some the code, although I think this will still probably too big
>>> for a single workaround.
>>>
>>> What I meant by "static table" is a table that looks like a structure
>>> and can be parsed in a few lines. If we can't find on contain the DMA
>>> window, then the next best solution is to find a way to identity the
>>> platform.
>>>
>>> I don't know enough ACPI to know if this solution is possible. A good
>>> starter would probably be the ACPI spec [2].
>>
>> Okay, that is worse than I had thought (okay, ACPI is impressively
>> complex for something nominally firmware-level).
>>
>> There are strings in the present Tianocore implementation for Raspberry
>> PI 4B which could be targeted.  Notably included in the output during
>> boot listing the tables, "RPIFDN", "RPIFDN RPI" and "RPIFDN RPI4" (I'm
>> unsure how kosher these are as this wsn't implemented nor blessed by the
>> Raspberry PI Foundation).
>>
>> I strongly dislike this approach as you soon turn the Xen project into a
>> database of hardware.  This is already occurring with
>> xen/arch/arm/platforms and I would love to do something about this.  On
>> that thought, how about utilizing Xen's command-line for this purpose?
> 
> I don't think that a command line option is a good idea: basically it is
> punting to users the task of platform detection. Also, it means that
> users will be necessarily forced to edit the uboot script or grub
> configuration file to boot.
> 
> Note that even if we introduced a new command line, we wouldn't take
> away the need for xen/arch/arm/platforms anyway.
> 
> It would be far better for Xen to autodetect the platform if we can.
> 
> 
>> Have a procedure of during installation/updates retrieve DMA limitation
>> information from the running OS and the following boot Xen will follow
>> the appropriate setup.  By its nature, Domain 0 will have the information
>> needed, just becomes an issue of how hard that is to retrieve...
> 
> Historically that is what we used to do for many things related to ACPI,
> but unfortunately it leads to a pretty bad architecture where Xen
> depends on Dom0 for booting rather than the other way around. (Dom0
> should be the one requiring Xen for booting, given that Xen is higher
> privilege and boots first.)
> 
> 
> I think the best compromise is still to use an ACPI string to detect the
> platform. For instance, would it be possible to use the OEMID fields in
> RSDT, XSDT, FADT?  Possibly even a combination of them?
> 
> Another option might be to get the platform name from UEFI somehow.

What about having a small domain parsing the ACPI booting first and use
that information for booting dom0?

That dom would be part of the Xen build and the hypervisor wouldn't need
to gain all the ACPI AML logic.


Juergen

