Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8DF72BB72
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 10:59:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546921.854023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8dNP-0002HO-Is; Mon, 12 Jun 2023 08:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546921.854023; Mon, 12 Jun 2023 08:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8dNP-0002FY-BV; Mon, 12 Jun 2023 08:58:15 +0000
Received: by outflank-mailman (input) for mailman id 546921;
 Mon, 12 Jun 2023 08:58:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yDFT=CA=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1q8dNO-0002FS-Nr
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 08:58:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41bcff68-08ff-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 10:58:11 +0200 (CEST)
Received: from [192.168.1.142] (unknown [151.57.12.77])
 by support.bugseng.com (Postfix) with ESMTPSA id 860804EE073E;
 Mon, 12 Jun 2023 10:58:09 +0200 (CEST)
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
X-Inumbo-ID: 41bcff68-08ff-11ee-8611-37d641c3527e
Message-ID: <a73f31d8-3e67-600a-6255-61f19aef1bc2@bugseng.com>
Date: Mon, 12 Jun 2023 10:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
Subject: Re: [PATCH] docs/misra: new rules addition
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: julien@xen.org, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20230607013810.3385316-1-sstabellini@kernel.org>
 <955f134b-75b8-f8a4-2e02-ae6def536ffb@suse.com>
 <alpine.DEB.2.22.394.2306071430160.3567387@ubuntu-linux-20-04-desktop>
 <ecf1fa52-5a78-8f56-6a9c-8f6b2d3119b2@bugseng.com>
 <6a8f2634-8580-e757-c57e-821387642fdc@suse.com>
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <6a8f2634-8580-e757-c57e-821387642fdc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/23 10:46, Jan Beulich wrote:
> On 08.06.2023 13:02, Roberto Bagnara wrote:
>> On 07/06/23 23:53, Stefano Stabellini wrote:
>>> On Wed, 7 Jun 2023, Jan Beulich wrote:
>>>>> +   * - `Rule 5.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_06.c>`_
>>>>> +     - Required
>>>>> +     - A typedef name shall be a unique identifier
>>>>> +     -
>>>>
>>>> Considering that the rule requires uniqueness across the entire code
>>>> base (and hence precludes e.g. two functions having identically named
>>>> local typedefs), I'm a little puzzled this was adopted. I for one
>>>> question that a use like the one mentioned is really at risk of being
>>>> confusing. Instead I think that the need to change at least one of
>>>> the names is at risk of making the code less readable then, even if
>>>> ever so slightly. (All of this said - I don't know if we have any
>>>> violations of this rule.)
>>>
>>> I don't think we have many local typedefs and I think we have only few
>>> violations if I remember right. I'll let Roberto confirm how many. This
>>> rule was considered not a difficult rule (some difficult rules were
>>> found, namely 2.1, 5.5 and 7.4.)
>>
>> There currently are 30 violations for ARM64:
>>
>> - some involve a typedef module_name (in the call it was said this should
>>     be renamed module_name_t, which will solve the issue);
>> - most concern repeated typedefs (UINT64 and similar) which are repeated
>>     in xen/arch/arm/include/asm/arm64/efibind.h
>>     and xen/include/acpi/actypes.h
>> - ret_t and phys_addr_t are also redefined in a couple of places.
>>
>> There are 90 violations for X86_64, for the same reasons, plus
>>
>> - another set of typedefs for basic types (such as u8);
>> - repeated typedefs for things like guest_l1e_t in the same header file:
>>
>> xen/arch/x86/include/asm/guest_pt.h:60.39-60.49:
>> for program `xen/.xen-syms.0', the identifier for typedef `guest_l1e_t' is reused
>> xen/arch/x86/include/asm/guest_pt.h:128.22-128.32:
>> for program `xen/.xen-syms.0', the identifier for typedef `guest_l1e_t' is reused
>>
>> The indicated lines read as follows:
>>
>> typedef struct { guest_intpte_t l1; } guest_l1e_t;
>> typedef l1_pgentry_t guest_l1e_t;
> 
> So this is an example where I don't think we can sensibly do away with the
> re-use of the same typedef name: We use it so we can build the same source
> files multiple ways, dealing with different paging modes guests may be in.

Typedefs being used this way can be deviated with tool configuration.
Here is a list of candidates for that treatment:

guest_intpte_t
guest_l1e_t
guest_l2e_t
ret_

I am not sure about the latter.  Please let me know if this is what
you would prefer and possible additions to/removals from the above list.
Kind regards,

    Roberto



