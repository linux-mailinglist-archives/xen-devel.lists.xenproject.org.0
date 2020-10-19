Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C42292AE5
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 17:52:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8767.23562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUXSn-0002oc-D7; Mon, 19 Oct 2020 15:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8767.23562; Mon, 19 Oct 2020 15:52:45 +0000
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
	id 1kUXSn-0002oE-A9; Mon, 19 Oct 2020 15:52:45 +0000
Received: by outflank-mailman (input) for mailman id 8767;
 Mon, 19 Oct 2020 15:52:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L3Wa=D2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kUXSl-0002o3-Oi
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 15:52:43 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06449247-8170-4378-a8cf-8a30014a13a7;
 Mon, 19 Oct 2020 15:52:42 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=L3Wa=D2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kUXSl-0002o3-Oi
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 15:52:43 +0000
X-Inumbo-ID: 06449247-8170-4378-a8cf-8a30014a13a7
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 06449247-8170-4378-a8cf-8a30014a13a7;
	Mon, 19 Oct 2020 15:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603122763;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=z7PqvPWXlAIeoXgjeWm7IAbeoFRA/7zzBYNHkA0kV6U=;
  b=TSknMctzPivm+mJ+nu3Q4369kQmwL0fP53F388QWBGcfrSeo67pG+fXe
   gbfAg7WqovWdBaXzYR8uTklhpgzYmlYUBFoOXBXbsXf7JZKQ1ySGLVS45
   nO6rZypLNuAuVm6CRnZOnkUb8fu/vUrxcTKWx21AQAlP3OeZLOGtnlh8J
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 6NVJcIB61YKqhRjmvbljT1RA1LC67gi89xaDcbMmJ+aWEYpjdv0N3iSsx7YiE6ZsFvmS490tDS
 bRY1PX2iw/oe2EH+zcl5ZLo52+h8FxqcQ0o0pt3ofHazw8Iv+opCxXhFmE627RQZK49eGaX0og
 5GPv1lZ0Acn5FvnzpaDgTpnN6gwU5LjIXrn9cezZ52x4KTucKlbrqCFi5f+bYKoCCNHpGgcnGh
 /ozKuP+IGtVB396KlXDZMB5r0TcVjvx8kaxFxg3wZn+g0kNUV0vAnoCFkxF+KKuXHFYBthOQtt
 fOo=
X-SBRS: None
X-MesageID: 29317521
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,394,1596513600"; 
   d="scan'208";a="29317521"
Subject: Re: [PATCH] SVM: avoid VMSAVE in ctxt-switch-to
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a01862b8-6e16-5ddc-7f48-2d3bed2f34b6@suse.com>
 <9d0cae4e-f849-f2a3-4261-d3efb977deeb@citrix.com>
 <b3b581fc-b1c9-cdc2-add6-900a4305623a@suse.com>
 <6af1bbb6-d717-affa-6409-2b983e48ed30@citrix.com>
 <59f3e399-8676-bb44-ec85-500583f97b2f@suse.com>
 <23d02e3b-7dac-ceb8-ebdd-3b77f264d6b4@citrix.com>
 <a5e30124-c1aa-e13f-cb09-8402b85209eb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e8ee8c84-f949-c882-07a6-58079987a308@citrix.com>
Date: Mon, 19 Oct 2020 16:52:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a5e30124-c1aa-e13f-cb09-8402b85209eb@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 19/10/2020 16:47, Jan Beulich wrote:
> On 19.10.2020 17:22, Andrew Cooper wrote:
>> On 19/10/2020 16:02, Jan Beulich wrote:
>>> On 19.10.2020 16:30, Andrew Cooper wrote:
>>>> On 19/10/2020 15:21, Jan Beulich wrote:
>>>>> On 19.10.2020 16:10, Andrew Cooper wrote:
>>>>>> On 19/10/2020 14:40, Jan Beulich wrote:
>>>>>>> Of the state saved by the insn and reloaded by the corresponding VMLOAD
>>>>>>> - TR, syscall, and sysenter state are invariant while having Xen's state
>>>>>>>   loaded,
>>>>>>> - FS, GS, and LDTR are not used by Xen and get suitably set in PV
>>>>>>>   context switch code.
>>>>>> I think it would be helpful to state that Xen's state is suitably cached
>>>>>> in _svm_cpu_up(), as this does now introduce an ordering dependency
>>>>>> during boot.
>>>>> I've added a sentence.
>>>>>
>>>>>> Is it possibly worth putting an assert checking the TR selector?  That
>>>>>> ought to be good enough to catch stray init reordering problems.
>>>>> How would checking just the TR selector help? If other pieces of TR
>>>>> or syscall/sysenter were out of sync, we'd be hosed, too.
>>>> They're far less likely to move relative to tr, than everything relative
>>>> to hvm_up().
>>>>
>>>>> I'm also not sure what exactly you mean to do for such an assertion:
>>>>> Merely check the host VMCB field against TSS_SELECTOR, or do an
>>>>> actual STR to be closer to what the VMSAVE actually did?
>>>> ASSERT(str() == TSS_SELECTOR);
>>> Oh, that's odd. How would this help with the VMCB?
>> It wont.
>>
>> We're not checking the behaviour of the VMSAVE instruction.  We just
>> want to sanity check that %tr is already configured.
> TR not already being configured is out of question in a function
> involved in context switching, don't you think? I thought you're
> worried about the VMCB not being set up correctly? Or are you in
> the end asking for the suggested assertion to go into
> _svm_cpu_up(), yet I didn't understand it that way?

I meant in _svm_cpu_up().  It is only at at __init time where the new
implicit dependency is created.

>
>> This version is far more simple than checking VMCB.trsel, which will
>> require a map_domain_page().
> In the general case yes, but in the most common case (PV also
> enabled) we have a mapping already (host_vmcb_va).

Still rather more invasive than I was hoping for a quick sanity check
that ought never to fire.

~Andrew

