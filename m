Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CC928CE5B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 14:30:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6178.16342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSJRR-0006Fw-7P; Tue, 13 Oct 2020 12:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6178.16342; Tue, 13 Oct 2020 12:30:09 +0000
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
	id 1kSJRR-0006FX-42; Tue, 13 Oct 2020 12:30:09 +0000
Received: by outflank-mailman (input) for mailman id 6178;
 Tue, 13 Oct 2020 12:30:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSJRP-0006FS-Ec
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 12:30:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6278e6ad-e607-460d-9869-50b1d4c3ba3d;
 Tue, 13 Oct 2020 12:30:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 11A23AE0C;
 Tue, 13 Oct 2020 12:30:05 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSJRP-0006FS-Ec
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 12:30:07 +0000
X-Inumbo-ID: 6278e6ad-e607-460d-9869-50b1d4c3ba3d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6278e6ad-e607-460d-9869-50b1d4c3ba3d;
	Tue, 13 Oct 2020 12:30:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602592205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=82g8CD3jPLdtQOFQZo35CBJ5sjGGHvc4e3t7Z3OAfNs=;
	b=T1vDxUqvuhktK7qu2JX0IL1232YvY+yYzLUGWs6SA7tX6eyYoLSlAfE3iixsoIu4VZWSaj
	/Ej/w/ObzKdaxKsehLTqcVHmAwoHtJaTWC2OUMCttPqrJoFO2CWTW9tucx4pes95kXNtaL
	FWF5kikmRVyzOK9cDVcBX7bkRaZuOO0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 11A23AE0C;
	Tue, 13 Oct 2020 12:30:05 +0000 (UTC)
Subject: Re: Xen Coding style and clang-format
To: George Dunlap <George.Dunlap@citrix.com>,
 Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>
Cc: "viktor.mitin.19@gmail.com" <viktor.mitin.19@gmail.com>,
 "vicooodin@gmail.com" <vicooodin@gmail.com>, "julien@xen.org"
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <300923eb27aea4d19bff3c21bc51d749c315f8e3.camel@epam.com>
 <4238269c-3bf4-3acb-7464-3d753f377eef@suse.com>
 <E068C671-8009-4976-87B8-0709F6A5C3BF@citrix.com>
 <b16dfb26e0916166180d5cbbe95278dc99277330.camel@epam.com>
 <B64C5E67-7BEA-4C31-9089-AB8CC1F1E80F@citrix.com>
 <3ff3f7d16cdab692178ce638da1a6b880817fb7e.camel@epam.com>
 <64FE5ADB-2359-4A31-B1A1-925750515D98@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b4d7e9a7-6c25-1f7f-86ce-867083beb81a@suse.com>
Date: Tue, 13 Oct 2020 14:30:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <64FE5ADB-2359-4A31-B1A1-925750515D98@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12.10.2020 20:09, George Dunlap wrote:
>> On Oct 7, 2020, at 11:19 AM, Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com> wrote:
>> So I want to know if the community is ready to add new formatting
>> options and edit old ones. Below I will give examples of what
>> corrections the checker is currently making (the first variant in each
>> case is existing code and the second variant is formatted by checker).
>> If they fit the standards, then I can document them in the coding
>> style. If not, then I try to configure the checker. But the idea is
>> that we need to choose one option that will be considered correct.
>> 1) Function prototype when the string length is longer than the allowed
>> -static int __init
>> -acpi_parse_gic_cpu_interface(struct acpi_subtable_header *header,
>> -                             const unsigned long end)
>> +static int __init acpi_parse_gic_cpu_interface(
>> +    struct acpi_subtable_header *header, const unsigned long end)
> 
> Jan already commented on this one; is there any way to tell the checker to ignore  this discrepancy?
> 
> If not, I think we should just choose one; I’d go with the latter.
> 
>> 2) Wrapping an operation to a new line when the string length is longer
>> than the allowed
>> -    status = acpi_get_table(ACPI_SIG_SPCR, 0,
>> -                            (struct acpi_table_header **)&spcr);
>> +    status =
>> +        acpi_get_table(ACPI_SIG_SPCR, 0, (struct acpi_table_header
>> **)&spcr);
> 
> Personally I prefer the first version.

Same here.

>> 3) Space after brackets
>> -    return ((char *) base + offset);
>> +    return ((char *)base + offset);
> 
> This seems like a good change to me.
> 
>> 4) Spaces in brackets in switch condition
>> -    switch ( domctl->cmd )
>> +    switch (domctl->cmd)
> 
> This is explicitly against the current coding style.
> 
>> 5) Spaces in brackets in operation
>> -    imm = ( insn >> BRANCH_INSN_IMM_SHIFT ) & BRANCH_INSN_IMM_MASK;
>> +    imm = (insn >> BRANCH_INSN_IMM_SHIFT) & BRANCH_INSN_IMM_MASK;
> 
> I *think* this is already the official style.
> 
>> 6) Spaces in brackets in return
>> -        return ( !sym->name[2] || sym->name[2] == '.' );
>> +        return (!sym->name[2] || sym->name[2] == '.');
> 
> Similarly, I think this is already the official style.
> 
>> 7) Space after sizeof
>> -    clean_and_invalidate_dcache_va_range(new_ptr, sizeof (*new_ptr) *
>> len);
>> +    clean_and_invalidate_dcache_va_range(new_ptr, sizeof(*new_ptr) *
>> len);
> 
> I think this is correct.

I agree with George on all of the above.

>> 8) Spaces before comment if it’s on the same line
>> -    case R_ARM_MOVT_ABS: /* S + A */
>> +    case R_ARM_MOVT_ABS:    /* S + A */
>>
>> -    if ( tmp == 0UL )       /* Are any bits set? */
>> -        return result + size;   /* Nope. */
>> +    if ( tmp == 0UL )         /* Are any bits set? */
>> +        return result + size; /* Nope. */
> 
> Seem OK to me.

I don't think we have any rules how far apart a comment needs
to be; I don't think there should be any complaints or
"corrections" here.

>> 9) Space after for_each_vcpu
>> -        for_each_vcpu(d, v)
>> +        for_each_vcpu (d, v)
> 
> Er, not sure about this one.  This is actually a macro; but obviously it looks like for ( ).
> 
> I think Jan will probably have an opinion, and I think he’ll be back tomorrow; so maybe wait just a day or two before starting to prep your series.

This makes it look like Linux style. In Xen it ought to be one
of

        for_each_vcpu(d, v)
        for_each_vcpu ( d, v )

depending on whether the author of a change considers
for_each_vcpu an ordinary identifier or kind of a keyword.

>> 10) Spaces in declaration
>> -    union hsr hsr = { .bits = regs->hsr };
>> +    union hsr hsr = {.bits = regs->hsr};
> 
> I’m fine with this too.

I think we commonly put the blanks there that are being suggested
to get dropped, so I'm not convinced this is a change we would
want the tool making or suggesting.

Jan

