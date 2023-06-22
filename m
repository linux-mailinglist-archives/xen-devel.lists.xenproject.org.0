Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 524AF739D9C
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 11:45:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553457.864024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCGsD-0006Cm-5K; Thu, 22 Jun 2023 09:45:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553457.864024; Thu, 22 Jun 2023 09:45:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCGsD-0006B9-0Y; Thu, 22 Jun 2023 09:45:05 +0000
Received: by outflank-mailman (input) for mailman id 553457;
 Thu, 22 Jun 2023 09:45:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t1HV=CK=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qCGsB-0006Ay-2s
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 09:45:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 750357b6-10e1-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 11:45:01 +0200 (CEST)
Received: from [172.20.10.2] (unknown [37.160.126.171])
 by support.bugseng.com (Postfix) with ESMTPSA id 07F304EE0737;
 Thu, 22 Jun 2023 11:44:59 +0200 (CEST)
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
X-Inumbo-ID: 750357b6-10e1-11ee-b237-6b7b168915f2
Message-ID: <adabbded-b1ec-d1ee-114d-e4bb95b6cc4f@bugseng.com>
Date: Thu, 22 Jun 2023 11:44:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH] xen/arm: fixed violations of MISRA C:2012 R8.3 on
 parameter names.
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cb0bbd89e169484ccd22da44bbcace56d5497c3e.1687420119.git.federico.serafini@bugseng.com>
 <7a48c49e-2998-9e34-45ef-a1c3431fbffe@xen.org>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <7a48c49e-2998-9e34-45ef-a1c3431fbffe@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/06/23 10:37, Julien Grall wrote:
> Hi,
> 
> On 22/06/2023 09:13, Federico Serafini wrote:
>> To comply with Rule 8.3 ("All declarations of an object or function
>> shall use the same names and type qualifiers") change the parameter
>> names of function declarations to be consistent with the names used
>> in the corresponding function definitions. >
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>>   xen/arch/arm/include/asm/event.h        | 2 +-
>>   xen/arch/arm/include/asm/fixmap.h       | 2 +-
>>   xen/arch/arm/include/asm/gic.h          | 2 +-
>>   xen/arch/arm/include/asm/gic_v3_its.h   | 5 +++--
>>   xen/arch/arm/include/asm/grant_table.h  | 6 +++---
>>   xen/arch/arm/include/asm/guest_access.h | 4 ++--
>>   xen/arch/arm/include/asm/irq.h          | 2 +-
>>   xen/arch/arm/include/asm/mm.h           | 2 +-
>>   xen/arch/arm/include/asm/regs.h         | 2 +-
>>   xen/arch/arm/include/asm/vgic.h         | 4 ++--
>>   10 files changed, 16 insertions(+), 15 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/event.h 
>> b/xen/arch/arm/include/asm/event.h
>> index b14c166ad6..fa54ef8869 100644
>> --- a/xen/arch/arm/include/asm/event.h
>> +++ b/xen/arch/arm/include/asm/event.h
>> @@ -3,7 +3,7 @@
>>   #include <asm/domain.h>
>> -void vcpu_kick(struct vcpu *v);
>> +void vcpu_kick(struct vcpu *vcpu);
> With this change we know have inconsistency in the arguments naming 
> within the header. It is more common to denote a vCPU with 'v' so I 
> would rather prefer if we modify the function definition in a patch before.
> 
>>   void vcpu_mark_events_pending(struct vcpu *v);> Hi,
> 
> On 22/06/2023 09:13, Federico Serafini wrote:
>> To comply with Rule 8.3 ("All declarations of an object or function
>> shall use the same names and type qualifiers") change the parameter
>> names of function declarations to be consistent with the names used
>> in the corresponding function definitions. >
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>>   xen/arch/arm/include/asm/event.h        | 2 +-
>>   xen/arch/arm/include/asm/fixmap.h       | 2 +-
>>   xen/arch/arm/include/asm/gic.h          | 2 +-
>>   xen/arch/arm/include/asm/gic_v3_its.h   | 5 +++--
>>   xen/arch/arm/include/asm/grant_table.h  | 6 +++---
>>   xen/arch/arm/include/asm/guest_access.h | 4 ++--
>>   xen/arch/arm/include/asm/irq.h          | 2 +-
>>   xen/arch/arm/include/asm/mm.h           | 2 +-
>>   xen/arch/arm/include/asm/regs.h         | 2 +-
>>   xen/arch/arm/include/asm/vgic.h         | 4 ++--
>>   10 files changed, 16 insertions(+), 15 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/event.h 
>> b/xen/arch/arm/include/asm/event.h
>> index b14c166ad6..fa54ef8869 100644
>> --- a/xen/arch/arm/include/asm/event.h
>> +++ b/xen/arch/arm/include/asm/event.h
>> @@ -3,7 +3,7 @@
>>   #include <asm/domain.h>
>> -void vcpu_kick(struct vcpu *v);
>> +void vcpu_kick(struct vcpu *vcpu)
>>   void vcpu_update_evtchn_irq(struct vcpu *v);
>>   void vcpu_block_unless_event_pending(struct vcpu *v);
>> diff --git a/xen/arch/arm/include/asm/fixmap.h 
>> b/xen/arch/arm/include/asm/fixmap.h
>> index d0c9a52c8c..734eb9b1d4 100644
>> --- a/xen/arch/arm/include/asm/fixmap.h
>> +++ b/xen/arch/arm/include/asm/fixmap.h
>> @@ -30,7 +30,7 @@
>>   extern lpae_t xen_fixmap[XEN_PT_LPAE_ENTRIES];
>>   /* Map a page in a fixmap entry */
>> -extern void set_fixmap(unsigned int map, mfn_t mfn, unsigned int 
>> attributes);
>> +extern void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags);
>>   /* Remove a mapping from a fixmap entry */
>>   extern void clear_fixmap(unsigned int map);
>> diff --git a/xen/arch/arm/include/asm/gic.h 
>> b/xen/arch/arm/include/asm/gic.h
>> index 76e3fa5dc4..f1ef347edc 100644
>> --- a/xen/arch/arm/include/asm/gic.h
>> +++ b/xen/arch/arm/include/asm/gic.h
>> @@ -257,7 +257,7 @@ int gic_remove_irq_from_guest(struct domain *d, 
>> unsigned int virq,
>>   extern void gic_clear_pending_irqs(struct vcpu *v);
>>   extern void init_maintenance_interrupt(void);
>> -extern void gic_raise_guest_irq(struct vcpu *v, unsigned int irq,
>> +extern void gic_raise_guest_irq(struct vcpu *v, unsigned int 
>> virtual_irq,
>>           unsigned int priority);
>>   extern void gic_raise_inflight_irq(struct vcpu *v, unsigned int 
>> virtual_irq);
>> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h 
>> b/xen/arch/arm/include/asm/gic_v3_its.h
>> index fae3f6ecef..c24d4752d0 100644
>> --- a/xen/arch/arm/include/asm/gic_v3_its.h
>> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
>> @@ -190,8 +190,9 @@ struct pending_irq 
>> *gicv3_its_get_event_pending_irq(struct domain *d,
>>                                                       uint32_t eventid);
>>   int gicv3_remove_guest_event(struct domain *d, paddr_t 
>> vdoorbell_address,
>>                                        uint32_t vdevid, uint32_t 
>> eventid);
>> -struct pending_irq *gicv3_assign_guest_event(struct domain *d, 
>> paddr_t doorbell,
>> -                                             uint32_t devid, uint32_t 
>> eventid,
>> +struct pending_irq *gicv3_assign_guest_event(struct domain *d,
>> +                                             paddr_t vdoorbell_address,
>> +                                             uint32_t vdevid, 
>> uint32_t eventid,
>>                                                uint32_t virt_lpi);
>>   void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
>>                                    uint32_t virt_lpi);
>> diff --git a/xen/arch/arm/include/asm/grant_table.h 
>> b/xen/arch/arm/include/asm/grant_table.h
>> index e13dfeefa5..bd4eea2317 100644
>> --- a/xen/arch/arm/include/asm/grant_table.h
>> +++ b/xen/arch/arm/include/asm/grant_table.h
>> @@ -36,10 +36,10 @@ static inline bool 
>> gnttab_release_host_mappings(const struct domain *d)
>>       return true;
>>   }
>> -int create_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>> +int create_grant_host_mapping(unsigned long addr, mfn_t frame,
>>                                 unsigned int flags, unsigned int 
>> cache_flags);
>> -int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>> -                               unsigned long new_gpaddr, unsigned int 
>> flags);
>> +int replace_grant_host_mapping(unsigned long addr, mfn_t mfn,
>> +                               unsigned long new_addr, unsigned int 
>> flags);
> 
> I know you are focusing to use the same parameter names as the 
> definitions. However, with the new name it is not clear anymore what 
> type of address is expected.
> 
>  From my understanding, the interface is expecting a guest physical 
> address. So I think we should stick with 'gpaddr'.
> 
> Also, I think there is another problem with this interface because a 
> guest (and even host) address can be bigger than an 'unsigned long' on 
> arm32. Anyway, this is something that could be dealt outside of this 
> series.
> 
>>   /*
>>    * The region used by Xen on the memory will never be mapped in DOM0
>> diff --git a/xen/arch/arm/include/asm/guest_access.h 
>> b/xen/arch/arm/include/asm/guest_access.h
>> index 4421e43611..c37cf7d871 100644
>> --- a/xen/arch/arm/include/asm/guest_access.h
>> +++ b/xen/arch/arm/include/asm/guest_access.h
>> @@ -12,11 +12,11 @@ unsigned long raw_clear_guest(void *to, unsigned 
>> int len);
>>   /* Copy data to guest physical address, then clean the region. */
>>   unsigned long copy_to_guest_phys_flush_dcache(struct domain *d,
>> -                                              paddr_t phys,
>> +                                              paddr_t gpa,
>>                                                 void *buf,
>>                                                 unsigned int len);
>> -int access_guest_memory_by_ipa(struct domain *d, paddr_t ipa, void *buf,
>> +int access_guest_memory_by_ipa(struct domain *d, paddr_t gpa, void *buf,
>>                                  uint32_t size, bool is_write);
> 
> The function namem suggests there would be a parameter called 'ipa'. But 
> you are renaming it to 'gpa'. In this case, we should either renaming 
> the parameter in the definition or the function name.
> 
> I am slightly leaning towards the latter because we don't tend to use 
> 'ipa' very much in Xen (even though this is the Arm official terminology).
> 
>>   #define __raw_copy_to_guest raw_copy_to_guest
>> diff --git a/xen/arch/arm/include/asm/irq.h 
>> b/xen/arch/arm/include/asm/irq.h
>> index 11bc85d111..105b33b37d 100644
>> --- a/xen/arch/arm/include/asm/irq.h
>> +++ b/xen/arch/arm/include/asm/irq.h
>> @@ -76,7 +76,7 @@ void init_IRQ(void);
>>   int route_irq_to_guest(struct domain *d, unsigned int virq,
>>                          unsigned int irq, const char *devname);
>> -int release_guest_irq(struct domain *d, unsigned int irq);
>> +int release_guest_irq(struct domain *d, unsigned int virq);
>>   void arch_move_irqs(struct vcpu *v);
>> diff --git a/xen/arch/arm/include/asm/mm.h 
>> b/xen/arch/arm/include/asm/mm.h
>> index 4262165ce2..d78f7a183a 100644
>> --- a/xen/arch/arm/include/asm/mm.h
>> +++ b/xen/arch/arm/include/asm/mm.h
>> @@ -225,7 +225,7 @@ extern void setup_directmap_mappings(unsigned long 
>> base_mfn, unsigned long nr_mf
>>   /* Map a frame table to cover physical addresses ps through pe */
>>   extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
>>   /* map a physical range in virtual memory */
>> -void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int 
>> attributes);
>> +void __iomem *ioremap_attr(paddr_t pa, size_t len, unsigned int 
>> attributes)
> All the ioremap_* prototypes were consistent before this change. I have 
> a slight preference if we stick we 'start' and therefore rename the 
> parameter in the definition. But I would be ok with 'pa' so long all the 
> other ioremap_* prototypes are updated accordingly.
> 
>>   static inline void __iomem *ioremap_nocache(paddr_t start, size_t len)
>>   {
>> diff --git a/xen/arch/arm/include/asm/regs.h 
>> b/xen/arch/arm/include/asm/regs.h
>> index 0693a68131..ef34b38aa1 100644
>> --- a/xen/arch/arm/include/asm/regs.h
>> +++ b/xen/arch/arm/include/asm/regs.h
>> @@ -58,7 +58,7 @@ static inline bool guest_mode(const struct 
>> cpu_user_regs *r)
>>   }
>>   register_t get_user_reg(struct cpu_user_regs *regs, int reg);
>> -void set_user_reg(struct cpu_user_regs *regs, int reg, register_t val);
>> +void set_user_reg(struct cpu_user_regs *regs, int reg, register_t 
>> value);
>>   #endif
>> diff --git a/xen/arch/arm/include/asm/vgic.h 
>> b/xen/arch/arm/include/asm/vgic.h
>> index 328fd46d1b..aa9f49409e 100644
>> --- a/xen/arch/arm/include/asm/vgic.h
>> +++ b/xen/arch/arm/include/asm/vgic.h
>> @@ -355,8 +355,8 @@ bool vgic_evtchn_irq_pending(struct vcpu *v);
>>   int domain_vgic_register(struct domain *d, int *mmio_count);
>>   int domain_vgic_init(struct domain *d, unsigned int nr_spis);
>>   void domain_vgic_free(struct domain *d);
>> -int vcpu_vgic_init(struct vcpu *vcpu);
>> -int vcpu_vgic_free(struct vcpu *vcpu);
>> +int vcpu_vgic_init(struct vcpu *v);
>> +int vcpu_vgic_free(struct vcpu *v);
>>   void vgic_inject_irq(struct domain *d, struct vcpu *v, unsigned int 
>> virq,
>>                        bool level);
> 
> Cheers,
> 

Hello Julien,
my original intention was to minimize the amount of modified code 
without touching the definitions, however, I can apply your suggested 
changes adapting definitions to declarations when the context requires it.

Regards

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

