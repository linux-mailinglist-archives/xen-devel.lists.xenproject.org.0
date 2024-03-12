Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AB387975D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 16:19:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691907.1078473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk3tO-0003rh-6f; Tue, 12 Mar 2024 15:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691907.1078473; Tue, 12 Mar 2024 15:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk3tO-0003pk-3p; Tue, 12 Mar 2024 15:18:14 +0000
Received: by outflank-mailman (input) for mailman id 691907;
 Tue, 12 Mar 2024 15:18:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t7HW=KS=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1rk3tM-0003oq-Q2
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 15:18:12 +0000
Received: from 17.mo583.mail-out.ovh.net (17.mo583.mail-out.ovh.net
 [46.105.56.132]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbe2e104-e083-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 16:18:09 +0100 (CET)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.9.56])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4TvHMh6sKrz1FHf
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 15:18:08 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-tbfnn (unknown [10.110.113.153])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3C5EF1FEE2;
 Tue, 12 Mar 2024 15:18:08 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.99])
 by ghost-submission-6684bf9d7b-tbfnn with ESMTPSA
 id 0fW6CDBy8GUbuQAAEZrJMQ
 (envelope-from <krystian.hebel@3mdeb.com>); Tue, 12 Mar 2024 15:18:08 +0000
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
X-Inumbo-ID: bbe2e104-e083-11ee-a1ee-f123f15fe8a2
Authentication-Results:garm.ovh; auth=pass (GARM-99G003ba63f0ec-b095-4aa9-bd73-0fd4d1b3a469,
                    0B6B113C544506A41C6EB031E0F94F2E66B6AEBC) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:217.171.61.25
Content-Type: multipart/alternative;
 boundary="------------8naBNj30Wkav5P0Z3FbiTDV6"
Message-ID: <e5c7199b-bacb-4a81-964f-802c260ce75c@3mdeb.com>
Date: Tue, 12 Mar 2024 16:18:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/9] x86: don't access x86_cpu_to_apicid[] directly,
 use cpu_physical_id(cpu)
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <705574ddb7f18bae9ed3f60ddf2e4bda02c70388.1699982111.git.krystian.hebel@3mdeb.com>
 <904f358b-c535-4de2-b31d-e593687af11b@suse.com>
From: Krystian Hebel <krystian.hebel@3mdeb.com>
In-Reply-To: <904f358b-c535-4de2-b31d-e593687af11b@suse.com>
X-Ovh-Tracer-Id: 8228076520021403993
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrjeefgdejgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegtkfffgggfuffvvehfhfgjsegrtderredtvdejnecuhfhrohhmpefmrhihshhtihgrnhcujfgvsggvlhcuoehkrhihshhtihgrnhdrhhgvsggvlhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnheptddtledufedvgfettdevhffgtdegjeekveefgeelhfdvueegkeetueeuhfejgeetnecuffhomhgrihhnpeefmhguvggsrdgtohhmnecukfhppeduvdejrddtrddtrddupddvudejrddujedurdeiuddrvdehpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepkhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth

This is a multi-part message in MIME format.
--------------8naBNj30Wkav5P0Z3FbiTDV6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7.02.2024 17:28, Jan Beulich wrote:
> On 14.11.2023 18:49, Krystian Hebel wrote:
>> --- a/xen/arch/x86/apic.c
>> +++ b/xen/arch/x86/apic.c
>> @@ -950,7 +950,7 @@ __next:
>>        */
>>       if (boot_cpu_physical_apicid == -1U)
>>           boot_cpu_physical_apicid = get_apic_id();
>> -    x86_cpu_to_apicid[0] = get_apic_id();
>> +    cpu_physical_id(0) = get_apic_id();
> While personally I don't mind as much, I expect Andrew would not like
> this: Something that looks like a function call on the lhs is against
> what normal language structure would be.
This made me cringe as well, but I've seen something like this used in
other places (per_cpu() mostly) so I thought it was OK. I can change it.
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -1615,7 +1615,7 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
>>               break;
>>   
>>           cpu_id.phys_id =
>> -            (uint64_t)x86_cpu_to_apicid[v->vcpu_id] |
>> +            (uint64_t)cpu_physical_id(v->vcpu_id) |
>>               ((uint64_t)acpi_get_processor_id(v->vcpu_id) << 32);
> While the cast on the 2nd line is necessary, the one on the 2st isn't
> and would be nice to be dropped while touching the line anyway.
Ack
>
>> --- a/xen/arch/x86/numa.c
>> +++ b/xen/arch/x86/numa.c
>> @@ -70,7 +70,7 @@ void __init init_cpu_to_node(void)
>>   
>>       for ( i = 0; i < nr_cpu_ids; i++ )
>>       {
>> -        u32 apicid = x86_cpu_to_apicid[i];
>> +        u32 apicid = cpu_physical_id(i);
>>           if ( apicid == BAD_APICID )
>>               continue;
>>           node = apicid < MAX_LOCAL_APIC ? apicid_to_node[apicid] : NUMA_NO_NODE;
> We're in the process of phasing out u32 and friends, favoring uint32_t.
> Would be nice if in code being touched anyway (i.e. not just here) the
> conversion would be done right away. Then again fixed-width types are
> preferably avoided where not really needed (see ./CODING_STYLE), so
> quite likely it actually wants to be unsigned int here.
>
> Furthermore our style demands that declaration(s) and statement(s) are
> separated by a blank line. Inserting the missing one in cases like the
> one here would be very desirable as well.
Good to know, thanks.
> Jan
Best regards,

-- 
Krystian Hebel
Firmware Engineer
https://3mdeb.com  | @3mdeb_com

--------------8naBNj30Wkav5P0Z3FbiTDV6
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
    <div class="moz-cite-prefix">On 7.02.2024 17:28, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:904f358b-c535-4de2-b31d-e593687af11b@suse.com">
      <pre class="moz-quote-pre" wrap="">On 14.11.2023 18:49, Krystian Hebel wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -950,7 +950,7 @@ __next:
      */
     if (boot_cpu_physical_apicid == -1U)
         boot_cpu_physical_apicid = get_apic_id();
-    x86_cpu_to_apicid[0] = get_apic_id();
+    cpu_physical_id(0) = get_apic_id();
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
While personally I don't mind as much, I expect Andrew would not like
this: Something that looks like a function call on the lhs is against
what normal language structure would be.</pre>
    </blockquote>
    This made me cringe as well, but I've seen something like this used
    in<br>
    other places (per_cpu() mostly) so I thought it was OK. I can change
    it.<span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
      cite="mid:904f358b-c535-4de2-b31d-e593687af11b@suse.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1615,7 +1615,7 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
             break;
 
         cpu_id.phys_id =
-            (uint64_t)x86_cpu_to_apicid[v-&gt;vcpu_id] |
+            (uint64_t)cpu_physical_id(v-&gt;vcpu_id) |
             ((uint64_t)acpi_get_processor_id(v-&gt;vcpu_id) &lt;&lt; 32);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
While the cast on the 2nd line is necessary, the one on the 2st isn't
and would be nice to be dropped while touching the line anyway.</pre>
    </blockquote>
    Ack<br>
    <blockquote type="cite"
      cite="mid:904f358b-c535-4de2-b31d-e593687af11b@suse.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -70,7 +70,7 @@ void __init init_cpu_to_node(void)
 
     for ( i = 0; i &lt; nr_cpu_ids; i++ )
     {
-        u32 apicid = x86_cpu_to_apicid[i];
+        u32 apicid = cpu_physical_id(i);
         if ( apicid == BAD_APICID )
             continue;
         node = apicid &lt; MAX_LOCAL_APIC ? apicid_to_node[apicid] : NUMA_NO_NODE;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
We're in the process of phasing out u32 and friends, favoring uint32_t.
Would be nice if in code being touched anyway (i.e. not just here) the
conversion would be done right away. Then again fixed-width types are
preferably avoided where not really needed (see ./CODING_STYLE), so
quite likely it actually wants to be unsigned int here.

Furthermore our style demands that declaration(s) and statement(s) are
separated by a blank line. Inserting the missing one in cases like the
one here would be very desirable as well.</pre>
    </blockquote>
    Good to know, thanks.<span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
      cite="mid:904f358b-c535-4de2-b31d-e593687af11b@suse.com">
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

--------------8naBNj30Wkav5P0Z3FbiTDV6--

