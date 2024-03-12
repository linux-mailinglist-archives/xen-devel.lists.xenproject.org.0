Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4EE879879
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 16:59:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691940.1078574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4XD-0006wV-CK; Tue, 12 Mar 2024 15:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691940.1078574; Tue, 12 Mar 2024 15:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4XD-0006tf-96; Tue, 12 Mar 2024 15:59:23 +0000
Received: by outflank-mailman (input) for mailman id 691940;
 Tue, 12 Mar 2024 15:59:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t7HW=KS=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1rk4XC-0006tZ-7Y
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 15:59:22 +0000
Received: from 2.mo581.mail-out.ovh.net (2.mo581.mail-out.ovh.net
 [87.98.143.68]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ce02049-e089-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 16:59:20 +0100 (CET)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.17.154])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4TvJHD1NkHz1Drq
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 15:59:20 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-dqcch (unknown [10.110.113.89])
 by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3A7E41FE91;
 Tue, 12 Mar 2024 15:59:18 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.102])
 by ghost-submission-6684bf9d7b-dqcch with ESMTPSA
 id or3LOtZ78GUmCgEAPdwMoA
 (envelope-from <krystian.hebel@3mdeb.com>); Tue, 12 Mar 2024 15:59:18 +0000
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
X-Inumbo-ID: 7ce02049-e089-11ee-afdd-a90da7624cb6
Authentication-Results:garm.ovh; auth=pass (GARM-102R0040c942c0f-2bc0-4f3f-9004-f3dbd45a2912,
                    0B6B113C544506A41C6EB031E0F94F2E66B6AEBC) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:217.171.61.25
Content-Type: multipart/alternative;
 boundary="------------fxxSrUaDYSHJhsFTScDE9qCt"
Message-ID: <dcb4d61a-d2bc-4018-aeef-89339f3faadc@3mdeb.com>
Date: Tue, 12 Mar 2024 16:59:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 4/9] x86/smp: move stack_base to cpu_data
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <70e3b7c84a69a7ec52b3ed6314395165c281734c.1699982111.git.krystian.hebel@3mdeb.com>
 <d0fc568a-f54e-4480-a903-6407f4e3a5b6@xen.org>
 <52e2db77-88c4-47c5-85d7-34b0bb133b69@suse.com>
From: Krystian Hebel <krystian.hebel@3mdeb.com>
In-Reply-To: <52e2db77-88c4-47c5-85d7-34b0bb133b69@suse.com>
X-Ovh-Tracer-Id: 8923882662734768473
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrjeefgdekfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegtkfffgggfuffvvehfhfgjsegrtderredtvdejnecuhfhrohhmpefmrhihshhtihgrnhcujfgvsggvlhcuoehkrhihshhtihgrnhdrhhgvsggvlhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnheptddtledufedvgfettdevhffgtdegjeekveefgeelhfdvueegkeetueeuhfejgeetnecuffhomhgrihhnpeefmhguvggsrdgtohhmnecukfhppeduvdejrddtrddtrddupddvudejrddujedurdeiuddrvdehpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehkrhihshhtihgrnhdrhhgvsggvlhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekuddpmhhouggvpehsmhhtphhouhht

This is a multi-part message in MIME format.
--------------fxxSrUaDYSHJhsFTScDE9qCt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5.02.2024 09:41, Jan Beulich wrote:
> On 02.02.2024 19:24, Julien Grall wrote:
>> On 14/11/2023 17:50, Krystian Hebel wrote:
>>> This location is easier to access from assembly. Having it close to
>>> other data required during initialization has also positive (although
>>> rather small) impact on prefetching data from RAM.
>> I understand your goal but...
>>
>>> --- a/xen/arch/x86/include/asm/cpufeature.h
>>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>> ... cpufeature.h feels a rather odd place for storing the stack. I am
>> not entirely sure where else to place. Andrew, Jan, Roger?
> Well, without having looked at the patch/series itself yet, I can only
> say that if struct cpuinfo_x86 really is the place to put this
> information, then it's unavoidable to have the field added in this
> header. That said, it certainly feels like an abuse - there's nothing
> in common with other (collected) data in this structure. "Easier to
> access from assembly" may be a fair reason, but then I'd expect the
> downsides of alternatives to be discussed explicitly. For example, a
> simple new array might be as "easily" accessible from assembly.

Initially I thought I'll be using more fields from this structure a lot, 
like
booted_cores or apicid. I'll move this and cpu_state introduced in following
patch somewhere else.

>
>>> @@ -37,6 +37,7 @@ struct cpuinfo_x86 {
>>>        unsigned int phys_proc_id;         /* package ID of each logical CPU */
>>>        unsigned int cpu_core_id;          /* core ID of each logical CPU */
>>>        unsigned int compute_unit_id;      /* AMD compute unit ID of each logical CPU */
>>> +    void *stack_base;
>> AFAICT, this means there will be a padding before stack_base and ...
>>
>>>        unsigned short x86_clflush_size;
>> ... another one here. Is there any particular reason the new field
>> wasn't added at the end?
> With ...
>
>>>    } __cacheline_aligned;
> ... this I'm not exactly sure this is a problem right now (there may
> be ample padding space anyway, yet I didn't go count). But I agree
> with your comment in principle.
I've checked that the size didn't change after adding. I also think that
I checked that adding it there wouldn't add any padding, but maybe I
miscalculated something. In any way, this will be moved from here.
>>> --- a/xen/arch/x86/smpboot.c
>>> +++ b/xen/arch/x86/smpboot.c
>>> @@ -75,13 +75,15 @@ static enum cpu_state {
>>>    } cpu_state;
>>>    #define set_cpu_state(state) do { smp_mb(); cpu_state = (state); } while (0)
>>>    
>>> -void *stack_base[NR_CPUS];
>>> -
>>>    void initialize_cpu_data(unsigned int cpu)
>>>    {
>>>        uint32_t apicid = cpu_physical_id(cpu);
>>> +    void *stack = cpu_data[cpu].stack_base;
>>> +
>>>        cpu_data[cpu] = boot_cpu_data;
>>> +
>>>        cpu_physical_id(cpu) = apicid;
>>> +    cpu_data[cpu].stack_base = stack;
>>>    }
>>>    
>>>    static bool smp_store_cpu_info(unsigned int id)
>>> @@ -579,8 +581,6 @@ static int do_boot_cpu(int apicid, int cpu)
>>>            printk("Booting processor %d/%d eip %lx\n",
>>>                   cpu, apicid, start_eip);
>>>    
>>> -    stack_start = stack_base[cpu] + STACK_SIZE - sizeof(struct cpu_info);
>>> -
>> You remove this line because I can't quite figure out where stack_start
>> is now set. This is used...
> This line sets a global variable, which ...
>
>>> @@ -856,7 +856,7 @@ int setup_cpu_root_pgt(unsigned int cpu)
>>>    
>>>        /* Install direct map page table entries for stack, IDT, and TSS. */
>>>        for ( off = rc = 0; !rc && off < STACK_SIZE; off += PAGE_SIZE )
>>> -        rc = clone_mapping(__va(__pa(stack_base[cpu])) + off, rpt);
>>> +        rc = clone_mapping(__va(__pa(cpu_data[cpu].stack_base)) + off, rpt);
>>>    
>>>        if ( !rc )
>>>            rc = clone_mapping(idt_tables[cpu], rpt);
>>> @@ -1007,10 +1007,10 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
>>>            FREE_XENHEAP_PAGE(per_cpu(gdt, cpu));
>>>            FREE_XENHEAP_PAGE(idt_tables[cpu]);
>>>    
>>> -        if ( stack_base[cpu] )
>>> +        if ( cpu_data[cpu].stack_base )
>>>            {
>>> -            memguard_unguard_stack(stack_base[cpu]);
>>> -            FREE_XENHEAP_PAGES(stack_base[cpu], STACK_ORDER);
>>> +            memguard_unguard_stack(cpu_data[cpu].stack_base);
>>> +            FREE_XENHEAP_PAGES(cpu_data[cpu].stack_base, STACK_ORDER);
>>>            }
>>>        }
>>>    }
>>> @@ -1044,11 +1044,11 @@ static int cpu_smpboot_alloc(unsigned int cpu)
>>>        if ( node != NUMA_NO_NODE )
>>>            memflags = MEMF_node(node);
>>>    
>>> -    if ( stack_base[cpu] == NULL &&
>>> -         (stack_base[cpu] = cpu_alloc_stack(cpu)) == NULL )
>>> +    if ( cpu_data[cpu].stack_base == NULL &&
>>> +         (cpu_data[cpu].stack_base = cpu_alloc_stack(cpu)) == NULL )
>>>                goto out;
>>>    
>>> -    info = get_cpu_info_from_stack((unsigned long)stack_base[cpu]);
>>> +    info = get_cpu_info_from_stack((unsigned long)cpu_data[cpu].stack_base);
>> ... here.
> ... pretty clearly is not used here (anymore). Instead I'd raise the
> question of what the remaining purpose of that variable then is.
> Looking through updates this patch alone makes to use sites of
> stack_start, it's unclear whether the use from assembly code has gone
> away already - brief checking suggests it hasn't.
BSP still uses it, but APs don't. That said, comment above declaration says
otherwise, I'll change it, or maybe this variable can be removed altogether
since it always points to the same place, and there are only two consumers,
both in assembly.
>
> Jan
Best regards,

-- 
Krystian Hebel
Firmware Engineer
https://3mdeb.com  | @3mdeb_com

--------------fxxSrUaDYSHJhsFTScDE9qCt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5.02.2024 09:41, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:52e2db77-88c4-47c5-85d7-34b0bb133b69@suse.com">
      <pre class="moz-quote-pre" wrap="">On 02.02.2024 19:24, Julien Grall wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 14/11/2023 17:50, Krystian Hebel wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">This location is easier to access from assembly. Having it close to
other data required during initialization has also positive (although
rather small) impact on prefetching data from RAM.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I understand your goal but...

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
... cpufeature.h feels a rather odd place for storing the stack. I am 
not entirely sure where else to place. Andrew, Jan, Roger?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Well, without having looked at the patch/series itself yet, I can only
say that if struct cpuinfo_x86 really is the place to put this
information, then it's unavoidable to have the field added in this
header. That said, it certainly feels like an abuse - there's nothing
in common with other (collected) data in this structure. "Easier to
access from assembly" may be a fair reason, but then I'd expect the
downsides of alternatives to be discussed explicitly. For example, a
simple new array might be as "easily" accessible from assembly.</pre>
    </blockquote>
    <p>Initially I thought I'll be using more fields from this structure
      a lot, like<br>
      booted_cores or apicid. I'll move this and cpu_state introduced in
      following<br>
      patch somewhere else.<br>
    </p>
    <blockquote type="cite"
      cite="mid:52e2db77-88c4-47c5-85d7-34b0bb133b69@suse.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">@@ -37,6 +37,7 @@ struct cpuinfo_x86 {
      unsigned int phys_proc_id;         /* package ID of each logical CPU */
      unsigned int cpu_core_id;          /* core ID of each logical CPU */
      unsigned int compute_unit_id;      /* AMD compute unit ID of each logical CPU */
+    void *stack_base;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
AFAICT, this means there will be a padding before stack_base and ...

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">      unsigned short x86_clflush_size;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
... another one here. Is there any particular reason the new field 
wasn't added at the end?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
With ...

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">  } __cacheline_aligned;
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
... this I'm not exactly sure this is a problem right now (there may
be ample padding space anyway, yet I didn't go count). But I agree
with your comment in principle.</pre>
    </blockquote>
    I've checked that the size didn't change after adding. I also think
    that<br>
    I checked that adding it there wouldn't add any padding, but maybe I<br>
    miscalculated something. In any way, this will be moved from here.<span
    style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
      cite="mid:52e2db77-88c4-47c5-85d7-34b0bb133b69@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -75,13 +75,15 @@ static enum cpu_state {
  } cpu_state;
  #define set_cpu_state(state) do { smp_mb(); cpu_state = (state); } while (0)
  
-void *stack_base[NR_CPUS];
-
  void initialize_cpu_data(unsigned int cpu)
  {
      uint32_t apicid = cpu_physical_id(cpu);
+    void *stack = cpu_data[cpu].stack_base;
+
      cpu_data[cpu] = boot_cpu_data;
+
      cpu_physical_id(cpu) = apicid;
+    cpu_data[cpu].stack_base = stack;
  }
  
  static bool smp_store_cpu_info(unsigned int id)
@@ -579,8 +581,6 @@ static int do_boot_cpu(int apicid, int cpu)
          printk("Booting processor %d/%d eip %lx\n",
                 cpu, apicid, start_eip);
  
-    stack_start = stack_base[cpu] + STACK_SIZE - sizeof(struct cpu_info);
-
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
You remove this line because I can't quite figure out where stack_start 
is now set. This is used...
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This line sets a global variable, which ...

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">@@ -856,7 +856,7 @@ int setup_cpu_root_pgt(unsigned int cpu)
  
      /* Install direct map page table entries for stack, IDT, and TSS. */
      for ( off = rc = 0; !rc &amp;&amp; off &lt; STACK_SIZE; off += PAGE_SIZE )
-        rc = clone_mapping(__va(__pa(stack_base[cpu])) + off, rpt);
+        rc = clone_mapping(__va(__pa(cpu_data[cpu].stack_base)) + off, rpt);
  
      if ( !rc )
          rc = clone_mapping(idt_tables[cpu], rpt);
@@ -1007,10 +1007,10 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
          FREE_XENHEAP_PAGE(per_cpu(gdt, cpu));
          FREE_XENHEAP_PAGE(idt_tables[cpu]);
  
-        if ( stack_base[cpu] )
+        if ( cpu_data[cpu].stack_base )
          {
-            memguard_unguard_stack(stack_base[cpu]);
-            FREE_XENHEAP_PAGES(stack_base[cpu], STACK_ORDER);
+            memguard_unguard_stack(cpu_data[cpu].stack_base);
+            FREE_XENHEAP_PAGES(cpu_data[cpu].stack_base, STACK_ORDER);
          }
      }
  }
@@ -1044,11 +1044,11 @@ static int cpu_smpboot_alloc(unsigned int cpu)
      if ( node != NUMA_NO_NODE )
          memflags = MEMF_node(node);
  
-    if ( stack_base[cpu] == NULL &amp;&amp;
-         (stack_base[cpu] = cpu_alloc_stack(cpu)) == NULL )
+    if ( cpu_data[cpu].stack_base == NULL &amp;&amp;
+         (cpu_data[cpu].stack_base = cpu_alloc_stack(cpu)) == NULL )
              goto out;
  
-    info = get_cpu_info_from_stack((unsigned long)stack_base[cpu]);
+    info = get_cpu_info_from_stack((unsigned long)cpu_data[cpu].stack_base);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
... here.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
... pretty clearly is not used here (anymore). Instead I'd raise the
question of what the remaining purpose of that variable then is.
Looking through updates this patch alone makes to use sites of
stack_start, it's unclear whether the use from assembly code has gone
away already - brief checking suggests it hasn't.</pre>
    </blockquote>
    BSP still uses it, but APs don't. That said, comment above
    declaration says<br>
    otherwise, I'll change it, or maybe this variable can be removed
    altogether<br>
    since it always points to the same place, and there are only two
    consumers,<br>
    both in assembly.<br>
    <blockquote type="cite"
      cite="mid:52e2db77-88c4-47c5-85d7-34b0bb133b69@suse.com">
      <pre class="moz-quote-pre" wrap="">

Jan
</pre>
    </blockquote>
    Best regards,<br>
    <pre class="moz-signature" cols="72">-- 
Krystian Hebel
Firmware Engineer
<a class="moz-txt-link-freetext" href="https://3mdeb.com">https://3mdeb.com</a> | @3mdeb_com</pre>
  </body>
</html>

--------------fxxSrUaDYSHJhsFTScDE9qCt--

