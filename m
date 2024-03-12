Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EDC879732
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 16:12:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691903.1078464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk3nM-0002s2-IY; Tue, 12 Mar 2024 15:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691903.1078464; Tue, 12 Mar 2024 15:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk3nM-0002pR-FI; Tue, 12 Mar 2024 15:12:00 +0000
Received: by outflank-mailman (input) for mailman id 691903;
 Tue, 12 Mar 2024 15:11:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t7HW=KS=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1rk3nK-0002pL-NA
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 15:11:58 +0000
Received: from 2.mo561.mail-out.ovh.net (2.mo561.mail-out.ovh.net
 [46.105.75.36]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd8a34af-e082-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 16:11:56 +0100 (CET)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.9.127])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4TvHDW6mX1z1Lv0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 15:11:55 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-fvjjd (unknown [10.110.113.248])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 513C61FEAE;
 Tue, 12 Mar 2024 15:11:54 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.103])
 by ghost-submission-6684bf9d7b-fvjjd with ESMTPSA
 id kberBrpw8GWC8wAAiou2OA
 (envelope-from <krystian.hebel@3mdeb.com>); Tue, 12 Mar 2024 15:11:54 +0000
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
X-Inumbo-ID: dd8a34af-e082-11ee-a1ee-f123f15fe8a2
Authentication-Results:garm.ovh; auth=pass (GARM-103G00555f2a4c5-7213-4f8a-ace8-6da5233e50cd,
                    0B6B113C544506A41C6EB031E0F94F2E66B6AEBC) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:217.171.61.25
Content-Type: multipart/alternative;
 boundary="------------X4xXLmr0taTvN3dkBTqSXMLF"
Message-ID: <ddf79696-e32e-49ca-bfe7-073c63b21e09@3mdeb.com>
Date: Tue, 12 Mar 2024 16:11:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/9] x86/boot: choose AP stack based on APIC ID
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <0e7dd957b6f26fa7b752bdce1ef6ebe97c825903.1699982111.git.krystian.hebel@3mdeb.com>
 <d0e03f9a-83b2-4809-9b76-5612f28f2464@suse.com>
From: Krystian Hebel <krystian.hebel@3mdeb.com>
In-Reply-To: <d0e03f9a-83b2-4809-9b76-5612f28f2464@suse.com>
X-Ovh-Tracer-Id: 8123086356890954096
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrjeefgdejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegtkfffgggfuffvvehfhfgjsegrtderredtvdejnecuhfhrohhmpefmrhihshhtihgrnhcujfgvsggvlhcuoehkrhihshhtihgrnhdrhhgvsggvlhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepjefftddvhfeljedujeelleegjeeiffeuvefgffeuieeuhfetleeuteefffevueeinecuffhomhgrihhnpehtrhgrmhhpohhlihhnvgdrshgspdigkeeipgeigedrshgspdefmhguvggsrdgtohhmnecukfhppeduvdejrddtrddtrddupddvudejrddujedurdeiuddrvdehpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehkrhihshhtihgrnhdrhhgvsggvlhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheeiuddpmhhouggvpehsmhhtphhouhht

This is a multi-part message in MIME format.
--------------X4xXLmr0taTvN3dkBTqSXMLF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7.02.2024 17:11, Jan Beulich wrote:
> On 14.11.2023 18:49, Krystian Hebel wrote:
>> --- a/xen/arch/x86/boot/trampoline.S
>> +++ b/xen/arch/x86/boot/trampoline.S
>> @@ -72,6 +72,26 @@ trampoline_protmode_entry:
>>           mov     $X86_CR4_PAE,%ecx
>>           mov     %ecx,%cr4
>>   
>> +        /*
>> +         * Get APIC ID while we're in non-paged mode. Start by checking if
>> +         * x2APIC is enabled.
>> +         */
>> +        mov     $MSR_APIC_BASE, %ecx
>> +        rdmsr
>> +        and     $APIC_BASE_EXTD, %eax
> You don't use the result, in which case "test" is to be preferred over
> "and".
Ack
>
>> +        jnz     .Lx2apic
>> +
>> +        /* Not x2APIC, read from MMIO */
>> +        mov     0xfee00020, %esp
> Please don't open-code existing constants (APIC_ID here and below,
> APIC_DEFAULT_PHYS_BASE just here, and ...
>
>> +        shr     $24, %esp
> ... a to-be-introduced constant here (for {G,S}ET_xAPIC_ID() to use as
> well then). This is the only way of being able to easily identify all
> pieces of code accessing the same piece of hardware.

Yes, this was also caught in review done by Qubes OS team.

New constant and {G,S}ET_xAPIC_ID() should be in separate patch, I presume?

>> +        jmp     1f
>> +
>> +.Lx2apic:
>> +        mov     $(MSR_X2APIC_FIRST + (0x20 >> 4)), %ecx
>> +        rdmsr
>> +        mov     %eax, %esp
>> +1:
> Overall I'm worried of the use of %esp throughout here.
>
>> --- a/xen/arch/x86/boot/x86_64.S
>> +++ b/xen/arch/x86/boot/x86_64.S
>> @@ -15,7 +15,33 @@ ENTRY(__high_start)
>>           mov     $XEN_MINIMAL_CR4,%rcx
>>           mov     %rcx,%cr4
>>   
>> -        mov     stack_start(%rip),%rsp
>> +        test    %ebx,%ebx
> Nit (style): Elsewhere you have blanks after the commas, just here
> (and once again near the end of the hunk) you don't.
Is either style preferred?This file has both.
>> +        cmovz   stack_start(%rip), %rsp
>> +        jz      .L_stack_set
>> +
>> +        /* APs only: get stack base from APIC ID saved in %esp. */
>> +        mov     $-1, %rax
> Why a 64-bit insn here and ...
>
>> +        lea     x86_cpu_to_apicid(%rip), %rcx
>> +1:
>> +        add     $1, %rax
> ... here, when you only use (far less than) 32-bit values?
Fair question, no idea what I had in mind, will change.
>> +        cmp     $NR_CPUS, %eax
>> +        jb      2f
>> +        hlt
>> +2:
>> +        cmp     %esp, (%rcx, %rax, 4)
>> +        jne     1b
> Aren't you open-coding REPNE SCASD here?
Looks like I am, I missed that. I'm not sure if this will still apply after
changes from further patches, but I'll keep that in mind.
>
>> +        /* %eax is now Xen CPU index. */
>> +        lea     stack_base(%rip), %rcx
>> +        mov     (%rcx, %rax, 8), %rsp
>> +
>> +        test    %rsp,%rsp
>> +        jnz     1f
>> +        hlt
>> +1:
>> +        add     $(STACK_SIZE - CPUINFO_sizeof), %rsp
> Even this post-adjustment is worrying me. Imo the stack pointer is
> better set exactly once, to its final value. Keeping it at its init
> value of 0 until then yields more predictable results in case it
> ends up being used somewhere.
It really shouldn't be used anywhere, but I'll change it.
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1951,6 +1951,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>        */
>>       if ( !pv_shim )
>>       {
>> +        /* Separate loop to make parallel AP bringup possible. */
>>           for_each_present_cpu ( i )
>>           {
>>               /* Set up cpu_to_node[]. */
>> @@ -1958,6 +1959,12 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>               /* Set up node_to_cpumask based on cpu_to_node[]. */
>>               numa_add_cpu(i);
>>   
>> +            if ( stack_base[i] == NULL )
>> +                stack_base[i] = cpu_alloc_stack(i);
>> +        }
> Imo this wants accompanying by removal of the allocation in
> cpu_smpboot_alloc(). Which would then make more visible that there's
> error checking there, but not here (I realize there effectively is
> error checking in assembly code, but that'll end in HLT with no
> useful indication of what the problem is). Provided, as Julien has
> pointed out, that the change is necessary in the first place.

The allocation in cpu_smpboot_alloc() was left for hot-plug. This loops
over present CPUs, not possible ones.

>
> Jan
Best regards,

-- 
Krystian Hebel
Firmware Engineer
https://3mdeb.com  | @3mdeb_com

--------------X4xXLmr0taTvN3dkBTqSXMLF
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
    <div class="moz-cite-prefix">On 7.02.2024 17:11, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d0e03f9a-83b2-4809-9b76-5612f28f2464@suse.com">
      <pre class="moz-quote-pre" wrap="">On 14.11.2023 18:49, Krystian Hebel wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -72,6 +72,26 @@ trampoline_protmode_entry:
         mov     $X86_CR4_PAE,%ecx
         mov     %ecx,%cr4
 
+        /*
+         * Get APIC ID while we're in non-paged mode. Start by checking if
+         * x2APIC is enabled.
+         */
+        mov     $MSR_APIC_BASE, %ecx
+        rdmsr
+        and     $APIC_BASE_EXTD, %eax
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You don't use the result, in which case "test" is to be preferred over
"and".</pre>
    </blockquote>
    Ack<br>
    <blockquote type="cite"
      cite="mid:d0e03f9a-83b2-4809-9b76-5612f28f2464@suse.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+        jnz     .Lx2apic
+
+        /* Not x2APIC, read from MMIO */
+        mov     0xfee00020, %esp
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Please don't open-code existing constants (APIC_ID here and below,
APIC_DEFAULT_PHYS_BASE just here, and ...

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+        shr     $24, %esp
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
... a to-be-introduced constant here (for {G,S}ET_xAPIC_ID() to use as
well then). This is the only way of being able to easily identify all
pieces of code accessing the same piece of hardware.</pre>
    </blockquote>
    <p><span style="white-space: pre-wrap">Yes, this was also caught in review done by Qubes OS team.</span></p>
    <p><span style="white-space: pre-wrap">New constant and {G,S}ET_xAPIC_ID() should be in separate patch, I presume?
</span></p>
    <blockquote type="cite"
      cite="mid:d0e03f9a-83b2-4809-9b76-5612f28f2464@suse.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+        jmp     1f
+
+.Lx2apic:
+        mov     $(MSR_X2APIC_FIRST + (0x20 &gt;&gt; 4)), %ecx
+        rdmsr
+        mov     %eax, %esp
+1:
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Overall I'm worried of the use of %esp throughout here.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -15,7 +15,33 @@ ENTRY(__high_start)
         mov     $XEN_MINIMAL_CR4,%rcx
         mov     %rcx,%cr4
 
-        mov     stack_start(%rip),%rsp
+        test    %ebx,%ebx
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Nit (style): Elsewhere you have blanks after the commas, just here
(and once again near the end of the hunk) you don't.</pre>
    </blockquote>
    Is either style preferred?<span style="white-space: pre-wrap"> This file has both.
</span>
    <blockquote type="cite"
      cite="mid:d0e03f9a-83b2-4809-9b76-5612f28f2464@suse.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+        cmovz   stack_start(%rip), %rsp
+        jz      .L_stack_set
+
+        /* APs only: get stack base from APIC ID saved in %esp. */
+        mov     $-1, %rax
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Why a 64-bit insn here and ...

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+        lea     x86_cpu_to_apicid(%rip), %rcx
+1:
+        add     $1, %rax
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
... here, when you only use (far less than) 32-bit values?</pre>
    </blockquote>
    Fair question, no idea what I had in mind<span
    style="white-space: pre-wrap">, will change.
</span>
    <blockquote type="cite"
      cite="mid:d0e03f9a-83b2-4809-9b76-5612f28f2464@suse.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+        cmp     $NR_CPUS, %eax
+        jb      2f
+        hlt
+2:
+        cmp     %esp, (%rcx, %rax, 4)
+        jne     1b
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Aren't you open-coding REPNE SCASD here?</pre>
    </blockquote>
    Looks like I am, I missed that. I'm not sure if this will still
    apply after<br>
    changes from further patches, but I'll keep that in mind.<br>
    <blockquote type="cite"
      cite="mid:d0e03f9a-83b2-4809-9b76-5612f28f2464@suse.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+        /* %eax is now Xen CPU index. */
+        lea     stack_base(%rip), %rcx
+        mov     (%rcx, %rax, 8), %rsp
+
+        test    %rsp,%rsp
+        jnz     1f
+        hlt
+1:
+        add     $(STACK_SIZE - CPUINFO_sizeof), %rsp
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Even this post-adjustment is worrying me. Imo the stack pointer is
better set exactly once, to its final value. Keeping it at its init
value of 0 until then yields more predictable results in case it
ends up being used somewhere.</pre>
    </blockquote>
    It really shouldn't be used anywhere, but I'll change it.<span
    style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
      cite="mid:d0e03f9a-83b2-4809-9b76-5612f28f2464@suse.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1951,6 +1951,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
      */
     if ( !pv_shim )
     {
+        /* Separate loop to make parallel AP bringup possible. */
         for_each_present_cpu ( i )
         {
             /* Set up cpu_to_node[]. */
@@ -1958,6 +1959,12 @@ void __init noreturn __start_xen(unsigned long mbi_p)
             /* Set up node_to_cpumask based on cpu_to_node[]. */
             numa_add_cpu(i);
 
+            if ( stack_base[i] == NULL )
+                stack_base[i] = cpu_alloc_stack(i);
+        }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Imo this wants accompanying by removal of the allocation in
cpu_smpboot_alloc(). Which would then make more visible that there's
error checking there, but not here (I realize there effectively is
error checking in assembly code, but that'll end in HLT with no
useful indication of what the problem is). Provided, as Julien has
pointed out, that the change is necessary in the first place.</pre>
    </blockquote>
    <p>The allocation in cpu_smpboot_alloc() was left for hot-plug. This
      loops<br>
      over present CPUs, not possible ones.</p>
    <blockquote type="cite"
      cite="mid:d0e03f9a-83b2-4809-9b76-5612f28f2464@suse.com">
      <pre class="moz-quote-pre" wrap="">

Jan</pre>
    </blockquote>
    Best regards,<span style="white-space: pre-wrap">
</span>
    <pre class="moz-signature" cols="72">-- 
Krystian Hebel
Firmware Engineer
<a class="moz-txt-link-freetext" href="https://3mdeb.com">https://3mdeb.com</a> | @3mdeb_com</pre>
  </body>
</html>

--------------X4xXLmr0taTvN3dkBTqSXMLF--

