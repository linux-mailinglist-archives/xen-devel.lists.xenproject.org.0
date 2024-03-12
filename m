Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 086308798C4
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 17:16:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691951.1078604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4nj-0003RV-5n; Tue, 12 Mar 2024 16:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691951.1078604; Tue, 12 Mar 2024 16:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4nj-0003PY-1y; Tue, 12 Mar 2024 16:16:27 +0000
Received: by outflank-mailman (input) for mailman id 691951;
 Tue, 12 Mar 2024 16:16:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t7HW=KS=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1rk4nh-0003PS-UE
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 16:16:25 +0000
Received: from 16.mo584.mail-out.ovh.net (16.mo584.mail-out.ovh.net
 [188.165.55.104]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df04fce0-e08b-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 17:16:24 +0100 (CET)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.148.116])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4TvJfv6L7Cz1DQj
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 16:16:23 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-xqgc7 (unknown [10.110.113.13])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 265F11FE5A;
 Tue, 12 Mar 2024 16:16:23 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.102])
 by ghost-submission-6684bf9d7b-xqgc7 with ESMTPSA
 id XXIuBdd/8GXxCwEA52rYjQ
 (envelope-from <krystian.hebel@3mdeb.com>); Tue, 12 Mar 2024 16:16:23 +0000
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
X-Inumbo-ID: df04fce0-e08b-11ee-afdd-a90da7624cb6
Authentication-Results:garm.ovh; auth=pass (GARM-102R004950cf0eb-3aa7-4695-9bc2-6ee31df4f5d9,
                    0B6B113C544506A41C6EB031E0F94F2E66B6AEBC) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:217.171.61.25
Content-Type: multipart/alternative;
 boundary="------------v5bIFxATm5XUzPgaY5RAYWWB"
Message-ID: <cee27c2a-8831-4e30-8b44-b22eedfb9849@3mdeb.com>
Date: Tue, 12 Mar 2024 17:16:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 7/9] x86/smp: drop booting_cpu variable
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <22109ebd7edef1140cb438a6ec5fa1726cdf2c12.1699982111.git.krystian.hebel@3mdeb.com>
 <3df6b783-ff02-4ac9-ae76-843899fa2383@suse.com>
From: Krystian Hebel <krystian.hebel@3mdeb.com>
In-Reply-To: <3df6b783-ff02-4ac9-ae76-843899fa2383@suse.com>
X-Ovh-Tracer-Id: 9211831564845033817
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrjeefgdekiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegtkfffgggfuffvvehfhfgjsegrtderredtvdejnecuhfhrohhmpefmrhihshhtihgrnhcujfgvsggvlhcuoehkrhihshhtihgrnhdrhhgvsggvlhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepkeevfeevudffvdelfeeuudegtdeggfegheegudegleefiedtffekgfeiheejjeegnecuffhomhgrihhnpeigkeeipgeigedrshgspdefmhguvggsrdgtohhmnecukfhppeduvdejrddtrddtrddupddvudejrddujedurdeiuddrvdehpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehkrhihshhtihgrnhdrhhgvsggvlhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekgedpmhhouggvpehsmhhtphhouhht

This is a multi-part message in MIME format.
--------------v5bIFxATm5XUzPgaY5RAYWWB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8.02.2024 12:39, Jan Beulich wrote:
> On 14.11.2023 18:50, Krystian Hebel wrote:
>> CPU id is obtained as a side effect of searching for appropriate
>> stack for AP. It can be used as a parameter to start_secondary().
>> Coincidentally this also makes further work on making AP bring-up
>> code parallel easier.
> It's not just "easier", but strictly a prereq I think? Such a global
> would get in the way of having multiple CPUs make it into
> start_secondary() in parallel.
start_secondary() could also repeat what was done in assembly to get
that ID. This was what I've done in one of first attempts, and the commit
messagewas about removing that lookup loop which was squashed along the 
way and no longer applies. I'll reword it a bit.
>> --- a/xen/arch/x86/boot/x86_64.S
>> +++ b/xen/arch/x86/boot/x86_64.S
>> @@ -20,20 +20,24 @@ ENTRY(__high_start)
>>           jz      .L_stack_set
>>   
>>           /* APs only: get stack base from APIC ID saved in %esp. */
>> -        mov     $0, %rax
>> +        mov     $0, %rbx
>>           lea     cpu_data(%rip), %rcx
>>           /* cpu_data[0] is BSP, skip it. */
>>   1:
>> -        add     $1, %rax
>> +        add     $1, %rbx
>>           add     $CPUINFO_X86_sizeof, %rcx
>> -        cmp     $NR_CPUS, %eax
>> +        cmp     $NR_CPUS, %rbx
>>           jb      2f
>>           hlt
>>   2:
>>           cmp     %esp, CPUINFO_X86_apicid(%rcx)
>>           jne     1b
> Once again this is code you introduced a few patches ago. Why not use
> %ebx right away for that purpose? (And yes, this explains why in the
> earlier patch you retained that code. Just that again suitably ordering
> the series would make this look natural. Otherwise it needs at least
> mentioning why dead pieces are kept around.)
Will do.
>
>> -        /* %rcx is now cpu_data[cpu], read stack base from it. */
>> +        /*
>> +         * At this point:
>> +         * - %rcx is cpu_data[cpu], read stack base from it,
>> +         * - %rbx (callee-save) is Xen cpu number, pass it to start_secondary().
>> +         */
>>           mov     CPUINFO_X86_stack_base(%rcx), %rsp
>>   
>>           test    %rsp,%rsp
>> @@ -101,6 +105,7 @@ ENTRY(__high_start)
>>   .L_ap_cet_done:
>>   #endif /* CONFIG_XEN_SHSTK || CONFIG_XEN_IBT */
>>   
>> +        mov     %rbx, %rdi
>>           tailcall start_secondary
> As alluded to above and as mentioned before - please stick to 32-bit
> operations when you deal with 32 (or less) bits of data.
Ack
>
>> --- a/xen/arch/x86/smpboot.c
>> +++ b/xen/arch/x86/smpboot.c
>> @@ -222,8 +222,6 @@ static void smp_callin(void)
>>           cpu_relax();
>>   }
>>   
>> -static int booting_cpu;
>> -
>>   /* CPUs for which sibling maps can be computed. */
>>   static cpumask_t cpu_sibling_setup_map;
>>   
>> @@ -311,15 +309,14 @@ static void set_cpu_sibling_map(unsigned int cpu)
>>       }
>>   }
>>   
>> -void start_secondary(void *unused)
>> +void start_secondary(unsigned int cpu)
>>   {
>>       struct cpu_info *info = get_cpu_info();
>>   
>>       /*
>> -     * Dont put anything before smp_callin(), SMP booting is so fragile that we
>> +     * Don't put anything before smp_callin(), SMP booting is so fragile that we
>>        * want to limit the things done here to the most necessary things.
>>        */
>> -    unsigned int cpu = booting_cpu;
>>   
>>       /* Critical region without IDT or TSS.  Any fault is deadly! */
>>   
>> @@ -346,9 +343,9 @@ void start_secondary(void *unused)
>>        */
>>       spin_debug_disable();
>>   
>> -    get_cpu_info()->use_pv_cr3 = false;
>> -    get_cpu_info()->xen_cr3 = 0;
>> -    get_cpu_info()->pv_cr3 = 0;
>> +    info->use_pv_cr3 = false;
>> +    info->xen_cr3 = 0;
>> +    info->pv_cr3 = 0;
> This hunk looks unrelated. While tidying next to what's changed anyway
> may be okay if suitably mentioned in the description, in this case I
> think it needs splitting off.
OK, I'll split it off.
>
> Jan
Best regards,

-- 
Krystian Hebel
Firmware Engineer
https://3mdeb.com  | @3mdeb_com

--------------v5bIFxATm5XUzPgaY5RAYWWB
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
    <div class="moz-cite-prefix">On 8.02.2024 12:39, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3df6b783-ff02-4ac9-ae76-843899fa2383@suse.com">
      <pre class="moz-quote-pre" wrap="">On 14.11.2023 18:50, Krystian Hebel wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">CPU id is obtained as a side effect of searching for appropriate
stack for AP. It can be used as a parameter to start_secondary().
Coincidentally this also makes further work on making AP bring-up
code parallel easier.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It's not just "easier", but strictly a prereq I think? Such a global
would get in the way of having multiple CPUs make it into
start_secondary() in parallel.</pre>
    </blockquote>
    start_secondary() could also repeat what was done in assembly to get<br>
    that ID. This was what I've done in one of first attempts, and the
    commit<br>
    message<span style="white-space: pre-wrap"> was about removing that lookup loop which was squashed along
the way and no longer applies. I'll reword it a bit.
</span>
    <blockquote type="cite"
      cite="mid:3df6b783-ff02-4ac9-ae76-843899fa2383@suse.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -20,20 +20,24 @@ ENTRY(__high_start)
         jz      .L_stack_set
 
         /* APs only: get stack base from APIC ID saved in %esp. */
-        mov     $0, %rax
+        mov     $0, %rbx
         lea     cpu_data(%rip), %rcx
         /* cpu_data[0] is BSP, skip it. */
 1:
-        add     $1, %rax
+        add     $1, %rbx
         add     $CPUINFO_X86_sizeof, %rcx
-        cmp     $NR_CPUS, %eax
+        cmp     $NR_CPUS, %rbx
         jb      2f
         hlt
 2:
         cmp     %esp, CPUINFO_X86_apicid(%rcx)
         jne     1b
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Once again this is code you introduced a few patches ago. Why not use
%ebx right away for that purpose? (And yes, this explains why in the
earlier patch you retained that code. Just that again suitably ordering
the series would make this look natural. Otherwise it needs at least
mentioning why dead pieces are kept around.)</pre>
    </blockquote>
    Will do.<br>
    <blockquote type="cite"
      cite="mid:3df6b783-ff02-4ac9-ae76-843899fa2383@suse.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-        /* %rcx is now cpu_data[cpu], read stack base from it. */
+        /*
+         * At this point:
+         * - %rcx is cpu_data[cpu], read stack base from it,
+         * - %rbx (callee-save) is Xen cpu number, pass it to start_secondary().
+         */
         mov     CPUINFO_X86_stack_base(%rcx), %rsp
 
         test    %rsp,%rsp
@@ -101,6 +105,7 @@ ENTRY(__high_start)
 .L_ap_cet_done:
 #endif /* CONFIG_XEN_SHSTK || CONFIG_XEN_IBT */
 
+        mov     %rbx, %rdi
         tailcall start_secondary
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
As alluded to above and as mentioned before - please stick to 32-bit
operations when you deal with 32 (or less) bits of data.</pre>
    </blockquote>
    Ack<br>
    <blockquote type="cite"
      cite="mid:3df6b783-ff02-4ac9-ae76-843899fa2383@suse.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -222,8 +222,6 @@ static void smp_callin(void)
         cpu_relax();
 }
 
-static int booting_cpu;
-
 /* CPUs for which sibling maps can be computed. */
 static cpumask_t cpu_sibling_setup_map;
 
@@ -311,15 +309,14 @@ static void set_cpu_sibling_map(unsigned int cpu)
     }
 }
 
-void start_secondary(void *unused)
+void start_secondary(unsigned int cpu)
 {
     struct cpu_info *info = get_cpu_info();
 
     /*
-     * Dont put anything before smp_callin(), SMP booting is so fragile that we
+     * Don't put anything before smp_callin(), SMP booting is so fragile that we
      * want to limit the things done here to the most necessary things.
      */
-    unsigned int cpu = booting_cpu;
 
     /* Critical region without IDT or TSS.  Any fault is deadly! */
 
@@ -346,9 +343,9 @@ void start_secondary(void *unused)
      */
     spin_debug_disable();
 
-    get_cpu_info()-&gt;use_pv_cr3 = false;
-    get_cpu_info()-&gt;xen_cr3 = 0;
-    get_cpu_info()-&gt;pv_cr3 = 0;
+    info-&gt;use_pv_cr3 = false;
+    info-&gt;xen_cr3 = 0;
+    info-&gt;pv_cr3 = 0;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This hunk looks unrelated. While tidying next to what's changed anyway
may be okay if suitably mentioned in the description, in this case I
think it needs splitting off.</pre>
    </blockquote>
    OK, I'll split it off.<br>
    <blockquote type="cite"
      cite="mid:3df6b783-ff02-4ac9-ae76-843899fa2383@suse.com">
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

--------------v5bIFxATm5XUzPgaY5RAYWWB--

