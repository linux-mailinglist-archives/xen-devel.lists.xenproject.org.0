Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 397E171F516
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 23:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542769.847022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4qDc-00074V-UA; Thu, 01 Jun 2023 21:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542769.847022; Thu, 01 Jun 2023 21:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4qDc-00072U-RC; Thu, 01 Jun 2023 21:52:28 +0000
Received: by outflank-mailman (input) for mailman id 542769;
 Thu, 01 Jun 2023 21:52:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yYfd=BV=digikod.net=mic@srs-se1.protection.inumbo.net>)
 id 1q4qDa-00072O-VB
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 21:52:27 +0000
Received: from smtp-190d.mail.infomaniak.ch (smtp-190d.mail.infomaniak.ch
 [185.125.25.13]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97f21cad-00c6-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 23:52:25 +0200 (CEST)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
 by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4QXKc77569zMqSL0;
 Thu,  1 Jun 2023 23:52:23 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4QXKc326PxzMpyf6; Thu,  1 Jun 2023 23:52:19 +0200 (CEST)
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
X-Inumbo-ID: 97f21cad-00c6-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1685656343;
	bh=Y4IDHny7hGy+XnSKBvFZqlpnWAHCn1rWumxGCLA50bQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=H6zZL510qVdfzZeh/i5GoA9yME1fspu+DZZ0Oi5ZVA8yOwTq7CQKGpshOTn5FYk2m
	 fNE71TN9vpCm+pbkovBsqfYJ/zEMqsdW5HgzDcg4v5qxa6E4ngCPALSTCeNgrwWESi
	 5/j+zhczJVB0aePMSXY+seCsa5XOfmyxFayW64i8=
Message-ID: <9a4edc66-a0a3-73e4-09c5-db68d4cfbb68@digikod.net>
Date: Thu, 1 Jun 2023 23:52:18 +0200
MIME-Version: 1.0
User-Agent:
Subject: Re: [ANNOUNCE] KVM Microconference at LPC 2023
Content-Language: en-US
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
To: Paolo Bonzini <pbonzini@redhat.com>,
 James Morris <jamorris@linux.microsoft.com>
Cc: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Graf <graf@amazon.com>, Forrest Yuan Yu <yuanyu@google.com>,
 John Andersen <john.s.andersen@intel.com>, Liran Alon
 <liran.alon@oracle.com>,
 "Madhavan T . Venkataraman" <madvenka@linux.microsoft.com>,
 Marian Rotariu <marian.c.rotariu@gmail.com>,
 =?UTF-8?Q?Mihai_Don=c8=9bu?= <mdontu@bitdefender.com>,
 =?UTF-8?B?TmljdciZb3IgQ8OuyJt1?= <nicu.citu@icloud.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Thara Gopinath <tgopinath@microsoft.com>, Will Deacon <will@kernel.org>,
 Zahra Tarkhani <ztarkhani@microsoft.com>,
 =?UTF-8?Q?=c8=98tefan_=c8=98icleru?= <ssicleru@bitdefender.com>,
 dev@lists.cloudhypervisor.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 x86@kernel.org, xen-devel@lists.xenproject.org
References: <2f19f26e-20e5-8198-294e-27ea665b706f@redhat.com>
 <4142c8dc-5385-fb1d-4f8b-2a98bb3f99af@digikod.net>
In-Reply-To: <4142c8dc-5385-fb1d-4f8b-2a98bb3f99af@digikod.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Hi,

What is the status of this microconference proposal? We'd be happy to 
talk about Heki [1] and potentially other hypervisor supports.

Regards,
  Mickaël


[1] https://lore.kernel.org/all/20230505152046.6575-1-mic@digikod.net/


On 26/05/2023 18:09, Mickaël Salaün wrote:
> See James Morris's proposal here:
> https://lore.kernel.org/all/17f62cb1-a5de-2020-2041-359b8e96b8c0@linux.microsoft.com/
> 
> On 26/05/2023 04:36, James Morris wrote:
>   > [Side topic]
>   >
>   > Would folks be interested in a Linux Plumbers Conference MC on this
>   > topic generally, across different hypervisors, VMMs, and architectures?
>   >
>   > If so, please let me know who the key folk would be and we can try
> writing
>   > up an MC proposal.
> 
> The fine-grain memory management proposal from James Gowans looks
> interesting, especially the "side-car" virtual machines:
> https://lore.kernel.org/all/88db2d9cb42e471692ff1feb0b9ca855906a9d95.camel@amazon.com/
> 
> 
> On 09/05/2023 11:55, Paolo Bonzini wrote:
>> Hi all!
>>
>> We are planning on submitting a CFP to host a KVM Microconference at
>> Linux Plumbers Conference 2023. To help justify the proposal, we would
>> like to gather a list of folks that would likely attend, and crowdsource
>> a list of topics to include in the proposal.
>>
>> For both this year and future years, the intent is that a KVM
>> Microconference will complement KVM Forum, *NOT* supplant it. As you
>> probably noticed, KVM Forum is going through a somewhat radical change in
>> how it's organized; the conference is now free and (with some help from
>> Red Hat) organized directly by the KVM and QEMU communities. Despite the
>> unexpected changes and some teething pains, community response to KVM
>> Forum continues to be overwhelmingly positive! KVM Forum will remain
>> the venue of choice for KVM/userspace collaboration, for educational
>> content covering both KVM and userspace, and to discuss new features in
>> QEMU and other userspace projects.
>>
>> At least on the x86 side, however, the success of KVM Forum led us
>> virtualization folks to operate in relative isolation. KVM depends on
>> and impacts multiple subsystems (MM, scheduler, perf) in profound ways,
>> and recently we’ve seen more and more ideas/features that require
>> non-trivial changes outside KVM and buy-in from stakeholders that
>> (typically) do not attend KVM Forum. Linux Plumbers Conference is a
>> natural place to establish such collaboration within the kernel.
>>
>> Therefore, the aim of the KVM Microconference will be:
>> * to provide a setting in which to discuss KVM and kernel internals
>> * to increase collaboration and reduce friction with other subsystems
>> * to discuss system virtualization issues that require coordination with
>> other subsystems (such as VFIO, or guest support in arch/)
>>
>> Below is a rough draft of the planned CFP submission.
>>
>> Thanks!
>>
>> Paolo Bonzini (KVM Maintainer)
>> Sean Christopherson (KVM x86 Co-Maintainer)
>> Marc Zyngier (KVM ARM Co-Maintainer)
>>
>>
>> ===================
>> KVM Microconference
>> ===================
>>
>> KVM (Kernel-based Virtual Machine) enables the use of hardware features
>> to improve the efficiency, performance, and security of virtual machines
>> created and managed by userspace.  KVM was originally developed to host
>> and accelerate "full" virtual machines running a traditional kernel and
>> operating system, but has long since expanded to cover a wide array of use
>> cases, e.g. hosting real time workloads, sandboxing untrusted workloads,
>> deprivileging third party code, reducing the trusted computed base of
>> security sensitive workloads, etc.  As KVM's use cases have grown, so too
>> have the requirements placed on KVM and the interactions between it and
>> other kernel subsystems.
>>
>> The KVM Microconference will focus on how to evolve KVM and adjacent
>> subsystems in order to satisfy new and upcoming requirements: serving
>> guest memory that cannot be accessed by host userspace[1], providing
>> accurate, feature-rich PMU/perf virtualization in cloud VMs[2], etc.
>>
>>
>> Potential Topics:
>>      - Serving inaccessible/unmappable memory for KVM guests (protected VMs)
>>      - Optimizing mmu_notifiers, e.g. reducing TLB flushes and spurious zapping
>>      - Supporting multiple KVM modules (for non-disruptive upgrades)
>>      - Improving and hardening KVM+perf interactions
>>      - Implementing arch-agnostic abstractions in KVM (e.g. MMU)
>>      - Defining KVM requirements for hardware vendors
>>      - Utilizing "fault" injection to increase test coverage of edge cases
>>      - KVM vs VFIO (e.g. memory types, a rather hot topic on the ARM side)
>>
>>
>> Key Attendees:
>>      - Paolo Bonzini <pbonzini@redhat.com> (KVM Maintainer)
>>      - Sean Christopherson <seanjc@google.com>  (KVM x86 Co-Maintainer)
>>      - Your name could be here!
>>
>> [1] https://lore.kernel.org/all/20221202061347.1070246-1-chao.p.peng@linux.intel.com
>> [2] https://lore.kernel.org/all/CALMp9eRBOmwz=mspp0m5Q093K3rMUeAsF3vEL39MGV5Br9wEQQ@mail.gmail.com
>>
>>

