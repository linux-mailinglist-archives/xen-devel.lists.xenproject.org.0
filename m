Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F91296C7E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 12:08:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10823.28887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVtzh-0007zY-SG; Fri, 23 Oct 2020 10:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10823.28887; Fri, 23 Oct 2020 10:08:21 +0000
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
	id 1kVtzh-0007z9-Oh; Fri, 23 Oct 2020 10:08:21 +0000
Received: by outflank-mailman (input) for mailman id 10823;
 Fri, 23 Oct 2020 10:08:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVtzg-0007z4-Ar
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 10:08:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 159b2d48-822c-472b-97db-a67788535ab3;
 Fri, 23 Oct 2020 10:08:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EF3CCACF5;
 Fri, 23 Oct 2020 10:08:17 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVtzg-0007z4-Ar
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 10:08:20 +0000
X-Inumbo-ID: 159b2d48-822c-472b-97db-a67788535ab3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 159b2d48-822c-472b-97db-a67788535ab3;
	Fri, 23 Oct 2020 10:08:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603447698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F4eZzYV8NnxDrphyFdWRCQ11jStzPJyDHfZINY2aw1o=;
	b=YEfXbcROsUuzDbPyyhyVVthKfbyKG6ZSDdhk3Rmor9awPXg/alrhyeswnMe6QPJVQN6ruU
	n1ZEeKg16mWQEVVbNYx5DZz8vARJ9+6jgF8zPccw8uNcdrHAuLZJvx7PjGQqEYdH2Mgc85
	pA68WLcQN8x4s2PBnJpCZHgfTavr0n0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EF3CCACF5;
	Fri, 23 Oct 2020 10:08:17 +0000 (UTC)
Subject: Re: [PATCH v2 12/14] kernel-doc: public/xen.h
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, ian.jackson@eu.citrix.com, julien@xen.org,
 wl@xen.org, Bertrand.Marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>
 <20201021000011.15351-12-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9f762160-e742-a14f-96a9-8ba908b7ebce@suse.com>
Date: Fri, 23 Oct 2020 12:08:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201021000011.15351-12-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.10.2020 02:00, Stefano Stabellini wrote:
> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -81,14 +81,62 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
>  
>  #endif
>  
> -/*
> - * HYPERCALLS
> - */
> -
> -/* `incontents 100 hcalls List of hypercalls
> - * ` enum hypercall_num { // __HYPERVISOR_* => HYPERVISOR_*()
> +/**
> + * DOC: HYPERCALLS
> + *
> + * List of hypercalls
> + *
> + * - __HYPERVISOR_set_trap_table
> + * - __HYPERVISOR_mmu_update
> + * - __HYPERVISOR_set_gdt
> + * - __HYPERVISOR_stack_switch
> + * - __HYPERVISOR_set_callbacks
> + * - __HYPERVISOR_fpu_taskswitch
> + * - __HYPERVISOR_sched_op_compat
> + * - __HYPERVISOR_platform_op
> + * - __HYPERVISOR_set_debugreg
> + * - __HYPERVISOR_get_debugreg
> + * - __HYPERVISOR_update_descriptor
> + * - __HYPERVISOR_memory_op
> + * - __HYPERVISOR_multicall
> + * - __HYPERVISOR_update_va_mapping
> + * - __HYPERVISOR_set_timer_op
> + * - __HYPERVISOR_event_channel_op_compat
> + * - __HYPERVISOR_xen_version
> + * - __HYPERVISOR_console_io
> + * - __HYPERVISOR_physdev_op_compat
> + * - __HYPERVISOR_grant_table_op
> + * - __HYPERVISOR_vm_assist
> + * - __HYPERVISOR_update_va_mapping_otherdomain
> + * - __HYPERVISOR_iret
> + * - __HYPERVISOR_vcpu_op
> + * - __HYPERVISOR_set_segment_base
> + * - __HYPERVISOR_mmuext_op
> + * - __HYPERVISOR_xsm_op
> + * - __HYPERVISOR_nmi_op
> + * - __HYPERVISOR_sched_op
> + * - __HYPERVISOR_callback_op
> + * - __HYPERVISOR_xenoprof_op
> + * - __HYPERVISOR_event_channel_op
> + * - __HYPERVISOR_physdev_op
> + * - __HYPERVISOR_hvm_op
> + * - __HYPERVISOR_sysctl
> + * - __HYPERVISOR_domctl
> + * - __HYPERVISOR_kexec_op
> + * - __HYPERVISOR_tmem_op
> + * - __HYPERVISOR_argo_op
> + * - __HYPERVISOR_xenpmu_op
> + * - __HYPERVISOR_dm_op
> + * - __HYPERVISOR_hypfs_op
> + * - __HYPERVISOR_arch_0
> + * - __HYPERVISOR_arch_1
> + * - __HYPERVISOR_arch_2
> + * - __HYPERVISOR_arch_3
> + * - __HYPERVISOR_arch_4
> + * - __HYPERVISOR_arch_5
> + * - __HYPERVISOR_arch_6
> + * - __HYPERVISOR_arch_7
>   */
> -
>  #define __HYPERVISOR_set_trap_table        0
>  #define __HYPERVISOR_mmu_update            1
>  #define __HYPERVISOR_set_gdt               2

I find this (and more similar ones below) addition of redundancy
quite unhelpful. Is there really no way at all to avoid such?

> @@ -650,34 +761,40 @@ typedef struct multicall_entry multicall_entry_t;
>  DEFINE_XEN_GUEST_HANDLE(multicall_entry_t);
>  
>  #if __XEN_INTERFACE_VERSION__ < 0x00040400
> -/*
> +/**
> + * DOC: NR_EVENT_CHANNELS
> + *
>   * Event channel endpoints per domain (when using the 2-level ABI):
>   *  1024 if a long is 32 bits; 4096 if a long is 64 bits.
>   */
>  #define NR_EVENT_CHANNELS EVTCHN_2L_NR_CHANNELS
>  #endif
>  
> +/**
> + * struct vcpu_time_info
> + *
> + * Updates to the following values are preceded and followed by an
> + * increment of 'version'. The guest can therefore detect updates by
> + * looking for changes to 'version'. If the least-significant bit of
> + * the version number is set then an update is in progress and the guest
> + * must wait to read a consistent set of values.
> + * The correct way to interact with the version number is similar to
> + * Linux's seqlock: see the implementations of read_seqbegin/read_seqretry.
> + *
> + * Current system time:
> + *   system_time +
> + *   ((((tsc - tsc_timestamp) << tsc_shift) * tsc_to_system_mul) >> 32)
> + * CPU frequency (Hz):
> + *   ((10^9 << 32) / tsc_to_system_mul) >> tsc_shift
> + */
>  struct vcpu_time_info {
> -    /*
> -     * Updates to the following values are preceded and followed by an
> -     * increment of 'version'. The guest can therefore detect updates by
> -     * looking for changes to 'version'. If the least-significant bit of
> -     * the version number is set then an update is in progress and the guest
> -     * must wait to read a consistent set of values.
> -     * The correct way to interact with the version number is similar to
> -     * Linux's seqlock: see the implementations of read_seqbegin/read_seqretry.
> -     */
>      uint32_t version;
>      uint32_t pad0;
> -    uint64_t tsc_timestamp;   /* TSC at last update of time vals.  */
> -    uint64_t system_time;     /* Time, in nanosecs, since boot.    */
> -    /*
> -     * Current system time:
> -     *   system_time +
> -     *   ((((tsc - tsc_timestamp) << tsc_shift) * tsc_to_system_mul) >> 32)
> -     * CPU frequency (Hz):
> -     *   ((10^9 << 32) / tsc_to_system_mul) >> tsc_shift
> -     */
> +    /** @tsc_timestamp: TSC at last update of time vals. */
> +    uint64_t tsc_timestamp;
> +    /** @system_time: Time, in nanosecs, since boot. */
> +    uint64_t system_time;

At the example of this (there are more below) - why the moving of the
main comment out of the struct, when comments inside the struct are
still used and apparently serving the (doc) purpose? This is even
more seeing that you ...

> @@ -692,18 +809,23 @@ typedef struct vcpu_time_info vcpu_time_info_t;
>  #define XEN_PVCLOCK_TSC_STABLE_BIT     (1 << 0)
>  #define XEN_PVCLOCK_GUEST_STOPPED      (1 << 1)
>  
> +/**
> + * struct vcpu_info
> + */
>  struct vcpu_info {
> -    /*
> -     * 'evtchn_upcall_pending' is written non-zero by Xen to indicate
> -     * a pending notification for a particular VCPU. It is then cleared
> -     * by the guest OS /before/ checking for pending work, thus avoiding
> -     * a set-and-check race. Note that the mask is only accessed by Xen
> -     * on the CPU that is currently hosting the VCPU. This means that the
> -     * pending and mask flags can be updated by the guest without special
> -     * synchronisation (i.e., no need for the x86 LOCK prefix).
> -     * This may seem suboptimal because if the pending flag is set by
> -     * a different CPU then an IPI may be scheduled even when the mask
> -     * is set. However, note:
> +    /**
> +     * @evtchn_upcall_pending:
> +     *
> +     * it is written non-zero by Xen to indicate a pending notification
> +     * for a particular VCPU. It is then cleared by the guest OS
> +     * /before/ checking for pending work, thus avoiding a set-and-check
> +     * race. Note that the mask is only accessed by Xen on the CPU that
> +     * is currently hosting the VCPU. This means that the pending and
> +     * mask flags can be updated by the guest without special
> +     * synchronisation (i.e., no need for the x86 LOCK prefix).  This
> +     * may seem suboptimal because if the pending flag is set by a
> +     * different CPU then an IPI may be scheduled even when the mask is
> +     * set. However, note:
>       *  1. The task of 'interrupt holdoff' is covered by the per-event-
>       *     channel mask bits. A 'noisy' event that is continually being
>       *     triggered can be masked at source at this very precise

... don't move it here.

> @@ -732,61 +854,69 @@ struct vcpu_info {
>  typedef struct vcpu_info vcpu_info_t;
>  #endif
>  
> -/*
> - * `incontents 200 startofday_shared Start-of-day shared data structure
> +/**
> + * struct shared_info - Start-of-day shared data structure
> + *
>   * Xen/kernel shared data -- pointer provided in start_info.
>   *
>   * This structure is defined to be both smaller than a page, and the
>   * only data on the shared page, but may vary in actual size even within
>   * compatible Xen versions; guests should not rely on the size
>   * of this structure remaining constant.
> + *
> + * A domain can create "event channels" on which it can send and receive
> + * asynchronous event notifications. There are three classes of event that
> + * are delivered by this mechanism:
> + *  1. Bi-directional inter- and intra-domain connections. Domains must
> + *     arrange out-of-band to set up a connection (usually by allocating
> + *     an unbound 'listener' port and avertising that via a storage service
> + *     such as xenstore).
> + *  2. Physical interrupts. A domain with suitable hardware-access
> + *     privileges can bind an event-channel port to a physical interrupt
> + *     source.
> + *  3. Virtual interrupts ('events'). A domain can bind an event-channel
> + *     port to a virtual interrupt source, such as the virtual-timer
> + *     device or the emergency console.
> + *
> + *
> + * @evtchn_pending: pending notifications

Please avoid double blank lines (even if they're just almost blank).

Jan

