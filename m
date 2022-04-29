Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BA751450C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 11:05:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317055.536201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkMXn-0001k0-M2; Fri, 29 Apr 2022 09:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317055.536201; Fri, 29 Apr 2022 09:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkMXn-0001hF-IB; Fri, 29 Apr 2022 09:04:07 +0000
Received: by outflank-mailman (input) for mailman id 317055;
 Fri, 29 Apr 2022 09:04:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nkMXl-0001gz-Nd
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 09:04:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nkMXi-0003h1-JN; Fri, 29 Apr 2022 09:04:02 +0000
Received: from [54.239.6.189] (helo=[192.168.23.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nkMXi-0003fu-Cr; Fri, 29 Apr 2022 09:04:02 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=qSuXf/Px7iSHyMuIBSOmSTZ/yccocniHl5nPOPEA/X8=; b=n+dEbDUOSZ9rdy50B6v7TiYU3B
	eO1pTHjPqza4R2lUXXgXSKqrTdoHuATOiV42of6w8y/DAzMRZ6JSoKDW91QwXFTf87aeN2uLMOhs0
	e6n+z5+oKh12Oy+jW7JK5FywdE0wd9x/wt8tAnPaOkQPjVrLeGyR5ti6IVJZl2HZY0KU=;
Message-ID: <cc097cb8-d04d-6441-d0f8-4027c7d0dc8e@xen.org>
Date: Fri, 29 Apr 2022 10:04:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [xen-unstable-smoke test] 169781: regressions - FAIL
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien.grall.oss@gmail.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 David Vrabel <dvrabel@amazon.co.uk>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <osstest-169781-mainreport@xen.org>
 <d1d3d81e-fe1d-fc1c-11b3-781263d8ba84@xen.org>
 <alpine.DEB.2.22.394.2204271556110.915916@ubuntu-linux-20-04-desktop>
 <CAJ=z9a1bu=3sX0rvWy+T-ey4363DMUEJvzkSqkQkTnvOQtT0=A@mail.gmail.com>
 <alpine.DEB.2.22.394.2204271622520.915916@ubuntu-linux-20-04-desktop>
 <ac0a0bf0-81a8-63c7-6a62-377672e24069@xen.org>
 <alpine.DEB.2.22.394.2204281647540.915916@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2204281647540.915916@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 29/04/2022 01:41, Stefano Stabellini wrote:
> On Thu, 28 Apr 2022, Julien Grall wrote:
>> On 28/04/2022 01:47, Stefano Stabellini wrote:
>>> On Thu, 28 Apr 2022, Julien Grall wrote:
>>>> Hi Stefano,
>>>>
>>>> On Thu, 28 Apr 2022, 00:02 Stefano Stabellini, <sstabellini@kernel.org>
>>>> wrote
>>>>         It seems to me that it is acceptable to allocate memory with
>>>> interrupt
>>>>         disabled during __init. I cannot see any drawbacks with it. I think
>>>> we
>>>>         should change the ASSERT to only trigger after __init: system_state
>>>> ==
>>>>         SYS_STATE_active.
>>>>
>>>>         What do you think?
>>>>
>>>>
>>>> This would solve the immediate problem but not the long term one (i.e cpu
>>>> hotplug).
>>>>
>>>> So I think it would be better to properly fix it right away.
>>>
>>> Yeah, you are right about cpu hotplug. I think both statements are true:
>>>
>>> - it is true that this is supposed to work with cpu hotplug and these
>>>     functions might be directly affected by cpu hotplug (by a CPU coming
>>>     online later on)
>>>
>>> - it is also true that it might not make sense to ASSERT at __init time
>>>     if IRQs are disabled. There might be other places, not affected by cpu
>>>     hotplug, where we do memory allocation at __init time with IRQ
>>>     disabled. It might still be a good idea to add the system_state ==
>>>     SYS_STATE_active check in the ASSERT, not to solve this specific
>>>     problem but to avoid other issues.
>>
>> AFAIU, it is not safe on x86 to do TLB flush with interrupts disabled *and*
>> multiple CPUs running. So we can't generically relax the check.
>>
>> Looking at the OSSTest results, both Arm32 and Arm64 without GICv3 ITS tests
>> have passed. So it seems unnecessary to me to preemptively relax the check
>> just for Arm.
> 
> It is good news that it works already (GICv3 aside) on ARM. If you
> prefer not to relax it, I am OK with it (although it makes me a bit
> worried about future breakages).

Bear in mind this is a debug only breakage, production build will work 
fines with any ASSERT() affecting large code base, it is going to be 
difficult to find all the potential misuse. So we have to rely on wider 
testing and fix it as it gets reported.

If we relax the check, then we are never going to be able to harden the 
code in timely maneer.

>>> In regard to gicv3_lpi_allocate_pendtable, I haven't thought about the
>>> implications of cpu hotplug for LPIs and GICv3 before. Do you envision
>>> that in a CPU hotplug scenario gicv3_lpi_init_rdist would be called when
>>> the extra CPU comes online?
>>
>> It is already called per-CPU. See gicv3_secondary_cpu_init() ->
>> gicv3_cpu_init() -> gicv3_populate_rdist().
> 
> Got it, thanks!
> 
> 
>>> Today gicv3_lpi_init_rdist is called based on the number of
>>> rdist_regions without checking if the CPU is online or offline (I think ?)
>>
>> The re-distributors are not banked and therefore accessible by everyone.
>> However, in Xen case, each pCPU will only touch its own re-distributor (well
>> aside TYPER to figure out the ID).
>>
>> The loop in gicv3_populate_rdist() will walk throught all the
>> re-distributor to find which one corresponds to the current pCPU. Once we
>> found it, we will call gicv3_lpi_init_rdist() to fully initialize the
>> re-distributor.
>>
>> I don't think we want to populate the memory for each re-distributor in
>> advance.
> 
> I agree.
> 
> Currently we do:
> 
>      start_secondary
>          [...]
>          gic_init_secondary_cpu()
>              [...]
>              gicv3_lpi_init_rdist()
>          [...]
>          local_irq_enable();
> 
> Which seems to be the right sequence to me. There must be an early boot
> phase where interrupts are disabled on a CPU but memory allocations are
> possible. If this was x86 with the tlbflush limitation, I would suggest
> to have per-cpu memory mapping areas so that we don't have to do any
> global tlb flushes with interrupts disabled.
> 
> On ARM, we don't have the tlbflush limitation so we could do that but we
> wouldn't have much to gain from it.
> 
> Also, this seems to be a bit of a special case, because in general we
> can move drivers initializations later after local_irq_enable(). But
> this is the interrupt controller driver itself -- we cannot move it
> after local_irq_enable().
> 
> So maybe an ad-hoc solution could be acceptable?

We don't need any ad-hoc solution here. We can register a CPU notifier 
that will notify us when a CPU will be prepared. Something like below 
should work (untested yet):

diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index e1594dd20e4c..ccf4868540f5 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -18,6 +18,7 @@
   * along with this program; If not, see <http://www.gnu.org/licenses/>.
   */

+#include <xen/cpu.h>
  #include <xen/lib.h>
  #include <xen/mm.h>
  #include <xen/param.h>
@@ -234,18 +235,13 @@ void gicv3_lpi_update_host_entry(uint32_t 
host_lpi, int domain_id,
      write_u64_atomic(&hlpip->data, hlpi.data);
  }

-static int gicv3_lpi_allocate_pendtable(uint64_t *reg)
+static int gicv3_lpi_allocate_pendtable(unsigned int cpu)
  {
-    uint64_t val;
      void *pendtable;

-    if ( this_cpu(lpi_redist).pending_table )
+    if ( per_cpu(lpi_redist, cpu).pending_table )
          return -EBUSY;

-    val  = GIC_BASER_CACHE_RaWaWb << 
GICR_PENDBASER_INNER_CACHEABILITY_SHIFT;
-    val |= GIC_BASER_CACHE_SameAsInner << 
GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT;
-    val |= GIC_BASER_InnerShareable << GICR_PENDBASER_SHAREABILITY_SHIFT;
-
      /*
       * The pending table holds one bit per LPI and even covers bits for
       * interrupt IDs below 8192, so we allocate the full range.
@@ -265,13 +261,38 @@ static int gicv3_lpi_allocate_pendtable(uint64_t *reg)
      clean_and_invalidate_dcache_va_range(pendtable,
                                           lpi_data.max_host_lpi_ids / 8);

-    this_cpu(lpi_redist).pending_table = pendtable;
+    per_cpu(lpi_redist, cpu).pending_table = pendtable;

-    val |= GICR_PENDBASER_PTZ;
+    return 0;
+}
+
+static int gicv3_lpi_set_pendtable(void __iomem *rdist_base)
+{
+    const void *pendtable = this_cpu(lpi_redist).pending_table;
+    uint64_t val;
+
+    if ( !pendtable )
+        return -ENOMEM;

+    ASSERT(virt_to_maddr(pendtable) & ~GENMASK(51, 16));
+
+    val  = GIC_BASER_CACHE_RaWaWb << 
GICR_PENDBASER_INNER_CACHEABILITY_SHIFT;
+    val |= GIC_BASER_CACHE_SameAsInner << 
GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT;
+    val |= GIC_BASER_InnerShareable << GICR_PENDBASER_SHAREABILITY_SHIFT;
+    val |= GICR_PENDBASER_PTZ;
      val |= virt_to_maddr(pendtable);

-    *reg = val;
+    writeq_relaxed(val, rdist_base + GICR_PENDBASER);
+    val = readq_relaxed(rdist_base + GICR_PENDBASER);
+
+    /* If the hardware reports non-shareable, drop cacheability as well. */
+    if ( !(val & GICR_PENDBASER_SHAREABILITY_MASK) )
+    {
+        val &= ~GICR_PENDBASER_INNER_CACHEABILITY_MASK;
+        val |= GIC_BASER_CACHE_nC << 
GICR_PENDBASER_INNER_CACHEABILITY_SHIFT;
+
+        writeq_relaxed(val, rdist_base + GICR_PENDBASER);
+    }

      return 0;
  }
@@ -340,7 +361,6 @@ static int gicv3_lpi_set_proptable(void __iomem * 
rdist_base)
  int gicv3_lpi_init_rdist(void __iomem * rdist_base)
  {
      uint32_t reg;
-    uint64_t table_reg;
      int ret;

      /* We don't support LPIs without an ITS. */
@@ -352,24 +372,33 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base)
      if ( reg & GICR_CTLR_ENABLE_LPIS )
          return -EBUSY;

-    ret = gicv3_lpi_allocate_pendtable(&table_reg);
+    ret = gicv3_lpi_set_pendtable(rdist_base);
      if ( ret )
          return ret;
-    writeq_relaxed(table_reg, rdist_base + GICR_PENDBASER);
-    table_reg = readq_relaxed(rdist_base + GICR_PENDBASER);

-    /* If the hardware reports non-shareable, drop cacheability as well. */
-    if ( !(table_reg & GICR_PENDBASER_SHAREABILITY_MASK) )
-    {
-        table_reg &= ~GICR_PENDBASER_INNER_CACHEABILITY_MASK;
-        table_reg |= GIC_BASER_CACHE_nC << 
GICR_PENDBASER_INNER_CACHEABILITY_SHIFT;
+    return gicv3_lpi_set_proptable(rdist_base);
+}
+
+static int cpu_callback(struct notifier_block *nfb, unsigned long action,
+                        void *hcpu)
+{
+    unsigned long cpu = (unsigned long)hcpu;
+    int rc = 0;

-        writeq_relaxed(table_reg, rdist_base + GICR_PENDBASER);
+    switch ( action )
+    {
+    case CPU_UP_PREPARE:
+        rc = gicv3_lpi_allocate_pendtable(cpu);
+        break;
      }

-    return gicv3_lpi_set_proptable(rdist_base);
+    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
  }

+static struct notifier_block cpu_nfb = {
+    .notifier_call = cpu_callback,
+};
+
  static unsigned int max_lpi_bits = 20;
  integer_param("max_lpi_bits", max_lpi_bits);

@@ -381,6 +410,7 @@ integer_param("max_lpi_bits", max_lpi_bits);
  int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
  {
      unsigned int nr_lpi_ptrs;
+    int rc;

      /* We rely on the data structure being atomically accessible. */
      BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(unsigned long));
@@ -413,7 +443,14 @@ int gicv3_lpi_init_host_lpis(unsigned int 
host_lpi_bits)

      printk("GICv3: using at most %lu LPIs on the host.\n", 
MAX_NR_HOST_LPIS);

-    return 0;
+    /* Register the CPU notifier and allocate memory for the boot CPU */
+    register_cpu_notifier(&cpu_nfb);
+    rc = gicv3_lpi_allocate_pendtable(smp_processor_id());
+    if ( rc )
+        printk(XENLOG_ERR "Unable to allocate the pendtable for CPU%u\n",
+               smp_processor_id());
+
+    return rc;
  }

  static int find_unused_host_lpi(uint32_t start, uint32_t *index)

Cheers,

-- 
Julien Grall

