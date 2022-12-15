Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B07664E399
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 23:00:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463912.722202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5wGz-0005R4-AO; Thu, 15 Dec 2022 22:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463912.722202; Thu, 15 Dec 2022 22:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5wGz-0005Ou-6x; Thu, 15 Dec 2022 22:00:13 +0000
Received: by outflank-mailman (input) for mailman id 463912;
 Thu, 15 Dec 2022 22:00:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5wGy-0005Oo-H6
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 22:00:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5wGx-0007cc-Pp; Thu, 15 Dec 2022 22:00:11 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5wGx-0005e4-IK; Thu, 15 Dec 2022 22:00:11 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=of/nSaZ/qkfyh+NcLBXnsWsGzU6794ekKTbupadD2gw=; b=mooTjx0Aj8GxQijk/noJ1ex94F
	N1J5rJZm+im19aApYmcAUmzMp6EFgskZJqeBTqgbNivXfiu9fKGgNOX62b+hqyx29gR6mcydl5EMm
	WTrnF7ha3c8eRhmH5abE+BE3ZkcTe2gJ+XH5JgKX2zYqYBt04lcnW1HprZZ4CzXLwmy0=;
Message-ID: <513d0cc3-a305-5029-32f7-67993ae83c55@xen.org>
Date: Thu, 15 Dec 2022 22:00:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
To: "Smith, Jackson" <rsmith@RiversideResearch.org>
Cc: "Brookes, Scott" <sbrookes@RiversideResearch.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "demi@invisiblethingslab.com" <demi@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
References: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <b7a367d4-a9df-0733-5a11-6ba11043c6b5@xen.org>
 <BN0P110MB1642A6DCBD15780CD8767B8CCFE19@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
From: Julien Grall <julien@xen.org>
Subject: Re: [RFC 0/4] Adding Virtual Memory Fuses to Xen
In-Reply-To: <BN0P110MB1642A6DCBD15780CD8767B8CCFE19@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/12/2022 19:27, Smith, Jackson wrote:
> Hi Julien,

Hi Jackson,

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: Tuesday, December 13, 2022 3:55 PM
> To: Smith, Jackson <rsmith@RiversideResearch.org>
>>
>> On 13/12/2022 19:48, Smith, Jackson wrote:
>>> Hi Xen Developers,
>>
>> Hi Jackson,
>>
>> Thanks for sharing the prototype with the community. Some
>> questions/remarks below.
>>
>>> My team at Riverside Research is currently spending IRAD funding to
>>> prototype next-generation secure hypervisor design ideas on Xen. In
>>> particular, we are prototyping the idea of Virtual Memory Fuses for
>>> Software Enclaves, as described in this paper:
>>> https://www.nspw.org/papers/2020/nspw2020-brookes.pdf. Note
>> that that
>>> paper talks about OS/Process while we have implemented the idea
>> for
>>> Hypervisor/VM.
>>>
>>> Our goal is to emulate something akin to Intel SGX or AMD SEV, but
>>> using only existing virtual memory features common in all
> processors.
>>> The basic idea is not to map guest memory into the hypervisor so
>> that
>>> a compromised hypervisor cannot compromise (e.g. read/write) the
>>> guest. This idea has been proposed before, however, Virtual Memory
>>> Fuses go one step further; they delete the hypervisor's mappings to
>>> its own page tables, essentially locking the virtual memory
>>> configuration for the lifetime of the system. This creates what we
>>> call "Software Enclaves", ensuring that an adversary with arbitrary
>>> code execution in the hypervisor STILL cannot read/write guest
>> memory.
>>
>> I am confused, if the attacker is able to execute arbitrary code, then
>> what prevent them to write code to map/unmap the page?
>>
>> Skimming through the paper (pages 5-6), it looks like you would need
>> to implement extra defense in Xen to be able to prevent map/unmap a
>> page.
>>
> 
> The key piece is deleting all virtual mappings to Xen's page table
> structures. From the paper (4.4.1 last paragraph), "Because all memory
> accesses operate through the MMU, even page table memory needs
> corresponding page table entries in order to be written to." Without a
> virtual mapping to the page table, no code can modify the page table
> because it cannot read or write the table. Therefore the mappings to the
> guest cannot be restored even with arbitrary code execution.
I don't think this is sufficient. Even if the page-tables not part of 
the virtual mapping, an attacker could still modify TTBR0_EL2 (that's a 
system register hold a host physical address). So, with a bit more work, 
you can gain access to everything (see more below).

AFAICT, this problem is pointed out in the paper (section 4.4.1):

"The remaining attack vector. Unfortunately, deleting the page
table mappings does not stop the kernel from creating an entirely
new page table with the necessary mappings and switching to it
as the active context. Although this would be very difficult for
an attacker, switching to a new context with a carefully crafted
new page table structure could compromise the VMFE."

I believe this will be easier to do it in Xen because the virtual layout 
is not very complex.

It would be a matter of inserting a new entry in the root table you 
control. A rough sequence would be:
    1) Allocate a page
    2) Prepare the page to act as a root (e.g. mapping of your code...)
    3) Map the "existing" root as a writable.
    4) Update TTBR0_EL2 to point to your new root
    5) Add a mapping in the "old" root
    6) Switch to the old root

So can you outline how you plan to prevent/mitigate it?

> 
>>>
>>> With this technique, we protect the integrity and confidentiality of
>>> guest memory. However, a compromised hypervisor can still
>> read/write
>>> register state during traps, or refuse to schedule a guest, denying
>>> service. We also recognize that because this technique precludes
>>> modifying Xen's page tables after startup, it may not be compatible
>>> with all of Xen's potential use cases. On the other hand, there are
>>> some uses cases (in particular statically defined embedded systems)
>>> where our technique could be adopted with minimal friction.
>>
>>   From what you wrote, this sounds very much like the project Citrix
> and
>> Amazon worked on called "Secret-free hypervisor" with a twist. In your
>> case, you want to prevent the hypervisor to map/unmap the guest
>> memory.
>>
>> You can find some details in [1]. The code is x86 only, but I don't
> see
>> any major blocker to port it on arm64.
>>
> 
> Yes, we are familiar with the "secret-free hypervisor" work. As you
> point out, both our work and the secret-free hypervisor remove the
> directmap region to mitigate the risk of leaking sensitive guest
> secrets. However, our work is slightly different because it additionally
> prevents attackers from tricking Xen into remapping a guest.

I understand your goal, but I don't think this is achieved (see above). 
You would need an entity to prevent write to TTBR0_EL2 in order to fully 
protect it.

> 
> We see our goals and the secret-free hypervisor goals as orthogonal.
> While the secret-free hypervisor views guests as untrusted and wants to
> keep compromised guests from leaking secrets, our work comes from the
> perspective of an individual guest trying to protect its secrets from
> the rest of the stack. So it wouldn't be unreasonable to say "I want a
> hypervisor that is 'secret-free' and implements VMF". We see them as
> different techniques with overlapping implementations.

I can see why you want to divide them. But to me if you have VMF, then 
you have a secret-free hypervisor in term of implementation.

The major difference is how the xenheap is dealt with. At the moment, 
for the implementation we are looking to still use the same heap.

However there are a few drawback in term of pages usage:
   * A page can be allocated anywhere in the memory map. So you can end 
to allocate a L1 (Arm) or L3 (x86) just for a single page
   * Contiguous pages may be allocated at different time.
   * Page-tables can be empty

x86 has some logic to handle the last two points. but Arm don't have it 
yet. I feel this is quite complex (in particular because of the 
break-before-make).

So one solution would be to use a split heap. The trouble is that 
xenheap memory would be more "limited". That might be OK for VMF, I need 
to think a bit more for secret-free hypervisor.

Another solution would be to use the vmap() (which would not be possible 
for VMF).

> Using the split xenheap approach means we don't have to worry about
> unmapping guest pagetables or xen's dynamically allocated tables.
> 
> We still need to unmap the handful of static pagetables that are
> declared at the top of xen/arch/arm/mm.c. Remember our goal is to
> prevent Xen from reading or writing its own page tables. We can't just
> unmap these static tables without shattering because they end up part of
> the superpages that map the xen binary. We're probably only shattering a
> single superpage for this right now. Maybe we can move the static tables
> to a superpage aligned region of the binary and pad that region so we
> can unmap an entire superpage without shattering?

For static pages you don't even need to shatter superpages because Xen 
is mapped with 4KB pages.

> In the future we might
> adjust the boot code to avoid the dependency on static page table
> locations.

You will always need at least a few static page tables for the initial 
switch the MMU on. Now, you could possibly allocate a new set out of Xen 
and then switch to it.

But I am not sure this is worth the trouble if you can easily unmap the 
static version afterwards.

>>
>>> Finally, our initial testing suggests that Xen never reads guest
>>> memory (in a static, non-dom0-enchanced configuration), but have
>> not
>>> really explored this thoroughly.
>>> We know at least these things work:
>>> 	Dom0less virtual serial terminal
>>> 	Domain scheduling
>>> We are aware that these things currently depend on accessible guest
>>> memory:
>>> 	Some hypercalls take guest pointers as arguments
>>
>> There are not many hypercalls that don't take guest pointers.
>>
>>> 	Virtualized MMIO on arm needs to decode certain load/store
>>> 	instructions
>>
>> On Arm, this can be avoided of the guest OS is not using such
>> instruction. In fact they were only added to cater "broken" guest OS.
>>
> 
> What do you mean by "broken" guests?
> 
> I see in the arm ARM where it discusses interpreting the syndrome
> register. But I'm not understanding which instructions populate the
> syndrome register and which do not. Why are guests using instructions
> that don't populate the syndrome register considered "broken"?

The short answer is they can't be easily/safely decoded as Xen read from 
the data cache but the processor read instruction from the instruction 
cache. There are situation where they could mismatch. For more details...

> Is there
> somewhere I can look to learn more?
... you can read [1], [2].


> 
>> Also, this will probably be a lot more difficult on x86 as, AFAIK,
> there
>> is
>> no instruction syndrome. So you will need to decode the instruction in
>> order to emulate the access.
>>
>>>
>>> It's likely that other Xen features require guest memory access.
>>
>> For Arm, guest memory access is also needed when using the GICv3 ITS
>> and/or second-level SMMU (still in RFC).
>>
> 
> Thanks for pointing this out. We will be sure to make note of these
> limitations going forward.
> 
>>
>> For x86, if you don't want to access the guest memory, then you may
>> need to restrict to PVH as for HVM we need to emulate some devices in
>> QEMU.
>> That said, I am not sure PVH is even feasible.
>>
> 
> Is that mostly in reference to the need decode instructions on x86 or
> are there other reasons why you feel it might not be feasible to apply
> this to Xen on x86?

I am not aware of any other. But it would probably best to ask with 
someone more knowledgeable than me on x86.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/e2d041b2-3b38-f19b-2d8e-3a255b0ac07e@amd.com/
[2] 
https://lore.kernel.org/xen-devel/20211126131459.2bbc81ad@donnerap.cambridge.arm.com


-- 
Julien Grall

