Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D27729F605
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 21:18:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14681.36290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYEMs-00079R-Nt; Thu, 29 Oct 2020 20:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14681.36290; Thu, 29 Oct 2020 20:17:54 +0000
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
	id 1kYEMs-000792-KT; Thu, 29 Oct 2020 20:17:54 +0000
Received: by outflank-mailman (input) for mailman id 14681;
 Thu, 29 Oct 2020 20:17:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IgEN=EE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kYEMr-00078x-3F
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:17:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1ac74a9-13e7-4db1-9ec0-177c593647be;
 Thu, 29 Oct 2020 20:17:51 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 58A0220639;
 Thu, 29 Oct 2020 20:17:50 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IgEN=EE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kYEMr-00078x-3F
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 20:17:53 +0000
X-Inumbo-ID: b1ac74a9-13e7-4db1-9ec0-177c593647be
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b1ac74a9-13e7-4db1-9ec0-177c593647be;
	Thu, 29 Oct 2020 20:17:51 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 58A0220639;
	Thu, 29 Oct 2020 20:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604002670;
	bh=z1hQL2B8LbNft63IM5lmDeIRTvFcnbRTIi5NFyeo4cU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=F1MyV4YCvNg6iTFDlPit5CdQTNK4ZV2ady5XTxRhmSeQnTI/tR/i+Caa8fkWOXBRy
	 HArPUNUE4loEF/Jl+aJY7eMrjmZnmgGrXq761jkFCVEl498gkAqWW6mfEF2C0nAsQQ
	 Ey7nO3JWcM6VV8hwyOmXlH65jeZylY78KDmFwMw0=
Date: Thu, 29 Oct 2020 13:17:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Julien Grall <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
In-Reply-To: <92A7B6FF-A2CE-4BB1-831A-8F12FB5290B8@arm.com>
Message-ID: <alpine.DEB.2.21.2010291316290.12247@sstabellini-ThinkPad-T480s>
References: <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com> <cd433f0a-ed0b-ce82-c356-d6deaa053a30@xen.org> <BBF09ABE-29A6-4990-8DA2-B44086E9C88C@arm.com> <1082f30e-0ce8-00b1-e120-194ff874a9ba@xen.org>
 <alpine.DEB.2.21.2010221631440.12247@sstabellini-ThinkPad-T480s> <D8EF4B06-B64D-4264-8C86-DA1B5A1146D2@arm.com> <7314936f-6c1e-5ca6-a33b-973c8e61ba3b@xen.org> <D9F93137-412F-47E5-A55C-85D1F3745618@arm.com> <2813ea2b-bfc4-0590-47ef-86089ad65a5d@xen.org>
 <0E2548E0-0504-43B6-8DD7-D5B7BACCEB6E@arm.com> <bc697327-2750-9a78-042d-d45690d27928@xen.org> <92A7B6FF-A2CE-4BB1-831A-8F12FB5290B8@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-670353858-1604002670=:12247"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-670353858-1604002670=:12247
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 29 Oct 2020, Bertrand Marquis wrote:
> > On 28 Oct 2020, at 19:12, Julien Grall <julien@xen.org> wrote:
> > On 26/10/2020 11:03, Rahul Singh wrote:
> >> Hello Julien,
> >>> On 23 Oct 2020, at 4:19 pm, Julien Grall <julien@xen.org> wrote:
> >>> On 23/10/2020 15:27, Rahul Singh wrote:
> >>>> Hello Julien,
> >>>>> On 23 Oct 2020, at 2:00 pm, Julien Grall <julien@xen.org> wrote:
> >>>>> On 23/10/2020 12:35, Rahul Singh wrote:
> >>>>>> Hello,
> >>>>>>> On 23 Oct 2020, at 1:02 am, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >>>>>>> 
> >>>>>>> On Thu, 22 Oct 2020, Julien Grall wrote:
> >>>>>>>>>> On 20/10/2020 16:25, Rahul Singh wrote:
> >>>>>>>>>>> Add support for ARM architected SMMUv3 implementations. It is based on
> >>>>>>>>>>> the Linux SMMUv3 driver.
> >>>>>>>>>>> Major differences between the Linux driver are as follows:
> >>>>>>>>>>> 1. Only Stage-2 translation is supported as compared to the Linux driver
> >>>>>>>>>>>    that supports both Stage-1 and Stage-2 translations.
> >>>>>>>>>>> 2. Use P2M  page table instead of creating one as SMMUv3 has the
> >>>>>>>>>>>    capability to share the page tables with the CPU.
> >>>>>>>>>>> 3. Tasklets is used in place of threaded IRQ's in Linux for event queue
> >>>>>>>>>>>    and priority queue IRQ handling.
> >>>>>>>>>> 
> >>>>>>>>>> Tasklets are not a replacement for threaded IRQ. In particular, they will
> >>>>>>>>>> have priority over anything else (IOW nothing will run on the pCPU until
> >>>>>>>>>> they are done).
> >>>>>>>>>> 
> >>>>>>>>>> Do you know why Linux is using thread. Is it because of long running
> >>>>>>>>>> operations?
> >>>>>>>>> 
> >>>>>>>>> Yes you are right because of long running operations Linux is using the
> >>>>>>>>> threaded IRQs.
> >>>>>>>>> 
> >>>>>>>>> SMMUv3 reports fault/events bases on memory-based circular buffer queues not
> >>>>>>>>> based on the register. As per my understanding, it is time-consuming to
> >>>>>>>>> process the memory based queues in interrupt context because of that Linux
> >>>>>>>>> is using threaded IRQ to process the faults/events from SMMU.
> >>>>>>>>> 
> >>>>>>>>> I didn’t find any other solution in XEN in place of tasklet to defer the
> >>>>>>>>> work, that’s why I used tasklet in XEN in replacement of threaded IRQs. If
> >>>>>>>>> we do all work in interrupt context we will make XEN less responsive.
> >>>>>>>> 
> >>>>>>>> So we need to make sure that Xen continue to receives interrupts, but we also
> >>>>>>>> need to make sure that a vCPU bound to the pCPU is also responsive.
> >>>>>>>> 
> >>>>>>>>> 
> >>>>>>>>> If you know another solution in XEN that will be used to defer the work in
> >>>>>>>>> the interrupt please let me know I will try to use that.
> >>>>>>>> 
> >>>>>>>> One of my work colleague encountered a similar problem recently. He had a long
> >>>>>>>> running tasklet and wanted to be broken down in smaller chunk.
> >>>>>>>> 
> >>>>>>>> We decided to use a timer to reschedule the taslket in the future. This allows
> >>>>>>>> the scheduler to run other loads (e.g. vCPU) for some time.
> >>>>>>>> 
> >>>>>>>> This is pretty hackish but I couldn't find a better solution as tasklet have
> >>>>>>>> high priority.
> >>>>>>>> 
> >>>>>>>> Maybe the other will have a better idea.
> >>>>>>> 
> >>>>>>> Julien's suggestion is a good one.
> >>>>>>> 
> >>>>>>> But I think tasklets can be configured to be called from the idle_loop,
> >>>>>>> in which case they are not run in interrupt context?
> >>>>>>> 
> >>>>>>  Yes you are right tasklet will be scheduled from the idle_loop that is not interrupt conext.
> >>>>> 
> >>>>> This depends on your tasklet. Some will run from the softirq context which is usually (for Arm) on the return of an exception.
> >>>>> 
> >>>> Thanks for the info. I will check and will get better understanding of the tasklet how it will run in XEN.
> >>>>>>> 
> >>>>>>>>>>> 4. Latest version of the Linux SMMUv3 code implements the commands queue
> >>>>>>>>>>>    access functions based on atomic operations implemented in Linux.
> >>>>>>>>>> 
> >>>>>>>>>> Can you provide more details?
> >>>>>>>>> 
> >>>>>>>>> I tried to port the latest version of the SMMUv3 code than I observed that
> >>>>>>>>> in order to port that code I have to also port atomic operation implemented
> >>>>>>>>> in Linux to XEN. As latest Linux code uses atomic operation to process the
> >>>>>>>>> command queues (atomic_cond_read_relaxed(),atomic_long_cond_read_relaxed() ,
> >>>>>>>>> atomic_fetch_andnot_relaxed()) .
> >>>>>>>> 
> >>>>>>>> Thank you for the explanation. I think it would be best to import the atomic
> >>>>>>>> helpers and use the latest code.
> >>>>>>>> 
> >>>>>>>> This will ensure that we don't re-introduce bugs and also buy us some time
> >>>>>>>> before the Linux and Xen driver diverge again too much.
> >>>>>>>> 
> >>>>>>>> Stefano, what do you think?
> >>>>>>> 
> >>>>>>> I think you are right.
> >>>>>> Yes, I agree with you to have XEN code in sync with Linux code that's why I started with to port the Linux atomic operations to XEN  then I realised that it is not straightforward to port atomic operations and it requires lots of effort and testing. Therefore I decided to port the code before the atomic operation is introduced in Linux.
> >>>>> 
> >>>>> Hmmm... I would not have expected a lot of effort required to add the 3 atomics operations above. Are you trying to also port the LSE support at the same time?
> >>>> There are other atomic operations used in the SMMUv3 code apart from the 3 atomic operation I mention. I just mention 3 operation as an example.
> >>> 
> >>> Ok. Do you have a list you could share?
> >>> 
> >> Yes. Please find the list that we have to port to the XEN in order to merge the latest SMMUv3 code.
> > 
> > Thanks!
> > 
> >> If we start to port the below list we might have to port another atomic operation based on which below atomic operations are implemented. I have not spent time on how these atomic operations are implemented in detail but as per my understanding, it required an effort to port them to XEN and required a lot of testing.
> > 
> > For the beginning, I think it is fine to implement them with a stronger memory barrier than necessary or in a less efficient. This can be refined afterwards.
> > 
> > Those helpers can directly be defined in the SMMUv3 drivers so we know they are not for general purpose :).
> > 
> >> 1. atomic_set_release
> > 
> > This could be implemented as:
> > 
> > smp_mb();
> > atomic_set();
> > 
> >> 2. atomic_fetch_andnot_relaxed
> > 
> > This would need to be imported.
> > 
> >> 3. atomic_cond_read_relaxed
> > 
> > This would need to be imported. The simplest version seems to be the generic version provided by include/asm-generic/barrier.h (see smp_cond_load_relaxed).
> > 
> >> 4. atomic_long_cond_read_relaxed
> >> 5. atomic_long_xor
> > 
> > The two would require the implementation of atomic64. Volodymyr also required a version. I offered my help, however I didn't find enough time to do it yet :(.
> > 
> > For Arm64, it would be possible to do a copy/paste of the existing helpers and replace anything related to a 32-bit register with a 64-bit one.
> > 
> > For Arm32, they are a bit more complex because you now need to work with 2 registers.
> > 
> > However, for your purpose, you would be using atomic_long_t. So the the Arm64 implementation should be sufficient.
> > 
> >> 6. atomic_set_release
> > 
> > Same as 1.
> > 
> >> 7. atomic_cmpxchg_relaxed might be we can use atomic_cmpxchg that is implemented in XEN need to check.
> > atomic_cmpxchg() is strongly ordered. So it would be fine to use it for implementing the helper. Although, more inefficient :).
> > 
> >> 8. atomic_dec_return_release
> > 
> > Xen implements a stronger version atomic_dec_return(). You can re-use it here.
> > 
> >> 9. atomic_fetch_inc_relaxed
> > 
> > This would need to be imported.
> 
> We do agree that this would be the work required but some of the things to be imported have dependencies and this is not
> a simple change on the patch done by Rahul and it would require to almost restart the implementation and testing from the
> very beginning.
> 
> In the meantime could we process with the review of this SMMUv3 driver and include it in Xen as is ?
>
> We can set me and Rahul as maintainers and flag the driver as experimental in Support.md (it is already
> protected by the EXPERT configuration in Kconfig).

I think that is OK as long as you make sure to go through the changelog
of the Linux driver to make sure we are not missing any bug fixes and
errata fixes.
--8323329-670353858-1604002670=:12247--

