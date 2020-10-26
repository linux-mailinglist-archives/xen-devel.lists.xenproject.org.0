Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0182992B3
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 17:44:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12462.32453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX5bF-000085-Kr; Mon, 26 Oct 2020 16:44:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12462.32453; Mon, 26 Oct 2020 16:44:01 +0000
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
	id 1kX5bF-00007g-Hf; Mon, 26 Oct 2020 16:44:01 +0000
Received: by outflank-mailman (input) for mailman id 12462;
 Mon, 26 Oct 2020 16:43:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dsar=EB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kX5bD-00007S-4z
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 16:43:59 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 287bca69-e455-4e61-aa85-b08440266629;
 Mon, 26 Oct 2020 16:43:57 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Dsar=EB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kX5bD-00007S-4z
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 16:43:59 +0000
X-Inumbo-ID: 287bca69-e455-4e61-aa85-b08440266629
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 287bca69-e455-4e61-aa85-b08440266629;
	Mon, 26 Oct 2020 16:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603730637;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=W5tYi8nQdGAwAPRlBIrOXvRnCSGAJRP7MM8VE7dlYhY=;
  b=ElM30uPoEqak7tFyzc8kg2ebYMdYBLAgwu/QoDPHI6prDB+x1xeswZuO
   svsdvlEbehb/bl2+6NvuFVV8BMPajGgjWW64ttjH19iaFnv0LGebfsyHM
   SjqSArLLSmnHOhuuFfMNoirQtVtIQxRAFHEGAXthA5gZrw+mmUaC46VHQ
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: gqHDFX6I39qpUyjzj1CRe3TqTEz+Co0fBvaH3vhjWVf9+hNa+mtu+ALwhwm46kxfVhI1mOAWJG
 8LjnYC6iN+nYmPRTK06Mw7Fi078k/fQ7zqdNqi8mEavDAiZPCb8+bKFjr5ZLuVXJub1Dg7aSyk
 gkiTZoEvROefBHGrcomQNOBOpkUfhpfE0KoHEwdtfHo94Heq7K0Kfh528H/CH8K5quIk+MxDGW
 7w6GGizzldrd1V+YTZxlf0i39jw0dPihGelJjlZQ9N+jxKg1nYHUeB7taUzUsq3NzmngcC5j3X
 xxY=
X-SBRS: None
X-MesageID: 29769153
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,420,1596513600"; 
   d="scan'208";a="29769153"
Subject: Re: XSM and the idle domain
To: Jason Andryuk <jandryuk@gmail.com>, Hongyan Xia <hx242@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	"Daniel Smith" <dpsmith@apertussolutions.com>
References: <bfd645cf42ef7786183be15c222ad04beed362c0.camel@xen.org>
 <f8f5f354-aa8d-4bd0-9c0e-ef37702e80c5@citrix.com>
 <48816c69ab2551a34c57a87392bb7f08ca6482ee.camel@xen.org>
 <CAKf6xpt0Kpi2ST4gfPnLrqUHE+3hHkRYpQAHPjp2vW=cHpqPAA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f1d16da4-b08f-6819-4883-affa5788c49c@citrix.com>
Date: Mon, 26 Oct 2020 16:43:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKf6xpt0Kpi2ST4gfPnLrqUHE+3hHkRYpQAHPjp2vW=cHpqPAA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 26/10/2020 13:37, Jason Andryuk wrote:
> On Thu, Oct 22, 2020 at 1:01 PM Hongyan Xia <hx242@xen.org> wrote:
>> On Thu, 2020-10-22 at 13:51 +0100, Andrew Cooper wrote:
>>> On 21/10/2020 15:34, Hongyan Xia wrote:
>>>> The first question came up during ongoing work in LiveUpdate. After
>>>> an
>>>> LU, the next Xen needs to restore all domains. To do that, some
>>>> hypercalls need to be issued from the idle domain context and
>>>> apparently XSM does not like it.
>>> There is no such thing as issuing hypercalls from the idle domain
>>> (context or otherwise), because the idle domain does not have enough
>>> associated guest state for anything to make the requisite
>>> SYSCALL/INT80/VMCALL/VMMCALL invocation.
>>>
>>> I presume from this comment that what you mean is that you're calling
>>> the plain hypercall functions, context checks and everything, from
>>> the
>>> idle context?
>> Yep, the restore code just calls the hypercall functions from idle
>> context.
>>
>>> If so, this is buggy for more reasons than just XSM objecting to its
>>> calling context, and that XSM is merely the first thing to explode.
>>> Therefore, I don't think modifications to XSM are applicable to
>>> solving
>>> the problem.
>>>
>>> (Of course, this is all speculation because there's no concrete
>>> implementation to look at.)
>> Another explosion is the inability to create hypercall preemption,
>> which for now is disabled when the calling context is the idle domain.
>> Apart from XSM and preemption, the LU prototype works fine. We only
>> reuse a limited number of hypercall functions and are not trying to be
>> able to call all possible hypercalls from idle.
> I wonder if for domain_create, it wouldn't be better to move
> xsm_domain_create() out to the domctl (hypercall entry) and check it
> there.  That would side-step xsm in domain_create.  Flask would need
> to be modified for that.  I've an untested patch doing the
> rearranging, which I'll send as a follow up.
>
> What other hypercalls are you having issues with?  Those could also be
> refactored so the hypercall entry checks permissions, and the actual
> work is done in a directly callable function.
>
>> Having a dedicated domLU just like domB (or reusing domB) sounds like a
>> viable option. If the overhead can be made low enough then we won't
>> need to work around XSM and hypercall preemption.
>>
>> Although the question was whether XSM should interact with the idle
>> domain. With a good design LU should be able to sidestep this though.
> Circling back to the main topic, is the idle domain Xen, or is it
> distinct?

It "is" Xen, IMO.

> It runs in the context of Xen, so Xen isn't really in a
> place to enforce policy on itself.  Hongyan, as you said earlier,
> applying XSM is more of a debugging feature at that point than a
> security feature.  And as Jan pointed out, you can have problems if
> XSM prevents the hypervisor from performing an action it doesn't
> expect to fail.

We have several system DOMID's which are SELF, IO, XEN, COW, INVALID and
IDLE.

SELF is a magic constant expected to be used in most hypercalls on
oneself, to simplify callers.  INVALID is also a magic constant.

The others all have struct domain's allocated for them, and are concrete
objects as far as Xen is concerned.  IO/XEN/COW all exist for the
purpose of fitting into the memory/device ownership models, while IDLE
exists for the purpose of encapsulating the idle vcpus in the scheduling
model.

None of them have any kind of outside-Xen state associated with them. 
"scheduling" an idle vCPU runs the idle loop, but it is all code within
the hypervisor.

The problem here is that idle context is also used in certain "normal"
cases in Xen (startup, shutdown, possibly also for softirq/tasklet
context), all of which we (currently) expect not to be making hypercalls
from.

~Andrew

