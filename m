Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D203A2A912F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 09:24:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20484.46394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kax1z-0002Pn-TC; Fri, 06 Nov 2020 08:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20484.46394; Fri, 06 Nov 2020 08:23:35 +0000
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
	id 1kax1z-0002PO-Ps; Fri, 06 Nov 2020 08:23:35 +0000
Received: by outflank-mailman (input) for mailman id 20484;
 Fri, 06 Nov 2020 08:23:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kax1x-0002PJ-QW
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 08:23:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2243804-0348-43da-b29b-020da43409b2;
 Fri, 06 Nov 2020 08:23:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E584FAB8F;
 Fri,  6 Nov 2020 08:23:31 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kax1x-0002PJ-QW
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 08:23:33 +0000
X-Inumbo-ID: b2243804-0348-43da-b29b-020da43409b2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b2243804-0348-43da-b29b-020da43409b2;
	Fri, 06 Nov 2020 08:23:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604651012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R7zbUVH+QMVOh+rrhDzkFhtHNBwMmO2+uGPuRghQXTI=;
	b=RHvo5r7Jodnfp7gv50k5L9fVtwnGyO5g2+yHnDxpBPCp4BhU5JiNO6pouAiYcmOIoi+Jvv
	gLYHFbQa1mAC4bo0aQK0TXEGNvnfCUCQVZMRoAGtkR0BTaMVxVE2PNxUSSv2YZka6MSefG
	nyDLQo5VnkUwLHcmyqFpGe/yzRdCP7Q=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E584FAB8F;
	Fri,  6 Nov 2020 08:23:31 +0000 (UTC)
Subject: Re: [PATCH v2 2/4] xen/pci: Introduce new CONFIG_PCI_ATS flag for PCI
 ATS functionality.
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Rahul Singh <rahul.singh@arm.com>, Bertrand.Marquis@arm.com,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1604417224.git.rahul.singh@arm.com>
 <27814e614618c413ac61a9f7a48d795c557bfe5c.1604417224.git.rahul.singh@arm.com>
 <c9874396-44d2-b969-104f-eb40b4e107c9@suse.com>
 <4598bf81-5802-93b8-e160-05c139a6d4cf@suse.com>
 <alpine.DEB.2.21.2011051300450.2323@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b3a1280e-871d-3333-335d-8978e8528df5@suse.com>
Date: Fri, 6 Nov 2020 09:23:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2011051300450.2323@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.11.2020 22:04, Stefano Stabellini wrote:
> On Wed, 4 Nov 2020, Jan Beulich wrote:
>> On 04.11.2020 16:43, Jan Beulich wrote:
>>> On 03.11.2020 16:59, Rahul Singh wrote:
>>>> --- a/xen/drivers/pci/Kconfig
>>>> +++ b/xen/drivers/pci/Kconfig
>>>> @@ -1,3 +1,12 @@
>>>>  
>>>>  config HAS_PCI
>>>>  	bool
>>>> +
>>>> +config PCI_ATS
>>>> +	bool "PCI ATS support"
>>>> +	default y
>>>> +	depends on X86 && HAS_PCI
>>>> +	---help---
>>>> +	 Enable PCI Address Translation Services.
>>>> +
>>>> +	 If unsure, say Y.
>>>
>>> Support for "---help---" having gone away in Linux, I think we'd
>>> better not add new instances. Also indentation of help content
>>> typically is by a tab and two spaces. With these two adjusted
>>>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> Initially I wanted to merely reply indicating I'd be fine making
>> these changes while committing, but there are two more things
>> (and I withdraw my R-b): For one, isn't strict pci_dev's ats
>> field now unused when !PCI_ATS? If so, if should get an #ifdef
>> added. And then, what exactly is it in ats.c that's x86-specific?
>> Shouldn't the whole file instead be moved one level up, and be
>> usable by Arm right away?
> 
> If the issue is that ATS wouldn't work on ARM straight away, then I
> think it would be best to make this a silent option like we did in patch
> #1: if x86 && HAS_PCI -> automatically enable, otherwise disable.

Taking the opportunity to make this a non-silent option was actually
a request of mine. As long as the code builds and isn't obviously
broken for Arm, I think it shouldn't have an X86 dependency (and it
then should be moved up in the tree). Arguably it could then
default to off for Arm, but when asking for this option to gain a
prompt I also indicated that I wonder whether the default shouldn't
be off on x86 as well, seeing that the controlling command line
option also defaults to off.

Jan

