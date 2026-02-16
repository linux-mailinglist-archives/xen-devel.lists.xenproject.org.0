Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2O3rL+GYk2ly6wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 23:23:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A12E147EA5
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 23:23:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234548.1537760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs6zi-000803-Rd; Mon, 16 Feb 2026 22:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234548.1537760; Mon, 16 Feb 2026 22:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs6zi-0007xP-Ow; Mon, 16 Feb 2026 22:23:06 +0000
Received: by outflank-mailman (input) for mailman id 1234548;
 Mon, 16 Feb 2026 22:23:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=txJP=AU=bounce.vates.tech=bounce-md_30504962.699398c2.v1-58517a5d04e04dcda33126465a2c7c03@srs-se1.protection.inumbo.net>)
 id 1vs6zh-0007xJ-Vt
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 22:23:06 +0000
Received: from mail187-15.suw11.mandrillapp.com
 (mail187-15.suw11.mandrillapp.com [198.2.187.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cce0871-0b86-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 23:23:00 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-15.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fFHN24pwHzPm0PfQ
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 22:22:58 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 58517a5d04e04dcda33126465a2c7c03; Mon, 16 Feb 2026 22:22:58 +0000
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
X-Inumbo-ID: 0cce0871-0b86-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771280578; x=1771550578;
	bh=q7HFIOeaE/ybQNX7CfL5EmHhsOGesTTjsUOk6a0mVUk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=CM60rYbqQeeyH3rOTMqg/I/9AWRPihCx+W/JDMWT6iogaoKO2SFmAxkpWRY/0avxd
	 5g9hIPLNJbt7HHWiW1HHOViEQxGMBlMna/To2HXkSB8mXq0a8waS7gubrcJGgrsl2K
	 EPY24M4FK6m8B0dQ+nhmlK09g9dtrladvzZAT6ld2s2b96Ny5husRAl7bQvD9oaClA
	 IcVAnlH7H8QahpfyJFDImh5pfUf7WnU9e1pMwz+iJt9di2OGu3NB14TWw1aesNSu1c
	 FzJQGuR8pkIrsLqCgy85aULh9BG5djFtqvfgEui1/6jHl17tDeppgUeaegJwJn/FUe
	 Jx+4OoCZJahtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771280578; x=1771541078; i=teddy.astie@vates.tech;
	bh=q7HFIOeaE/ybQNX7CfL5EmHhsOGesTTjsUOk6a0mVUk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=L1zUt2RzyjhE+OnOfCvoD2h6ZMxjwZZEm3z/ufpRCd5x4Jydk1IaUnGFOpAwzt7ry
	 KYkbDjxhL3PqrsR0tGcMbPCRu9RbGgugMLRlTu54Si4iA+PL2N6CRJL3goOBNDSCu0
	 Esrv2f08dEXguHG8JvM9s9TwatF3dzKzoqTVgiUNavKiMfOYkuridVR509m4wWGSQM
	 1QFZXILfaVyolOftRHvHXZc6nGqkix1Opt7hSuRrBvBIqzOrCEQJbWUMCuB3M7bmRH
	 gDFM434hZRfBfhUofeEJHbI5XpFXwjGL4EZnW5v240ZM/WjNklR1TuiStQr01CdtYC
	 NGNPG1KA6mfAA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/platform:=20Consider=20PTM=20for=20exposing=20package-related=20MSR?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771280577708
Message-Id: <4bcb7fbd-3180-4780-8432-2c62ce24ce99@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Tu Dinh" <ngoc-tu.dinh@vates.tech>, xen-devel@lists.xenproject.org
References: <e7b1721097bd7abd975882f60b282cf7900db58d.1771254439.git.teddy.astie@vates.tech> <2764f432-85eb-44b9-aae9-f1bce410b4b9@suse.com>
In-Reply-To: <2764f432-85eb-44b9-aae9-f1bce410b4b9@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.58517a5d04e04dcda33126465a2c7c03?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260216:md
Date: Mon, 16 Feb 2026 22:22:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ngoc-tu.dinh@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim,vates.tech:mid,vates.tech:url,vates.tech:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6A12E147EA5
X-Rspamd-Action: no action

Le 16/02/2026 =C3=A0 17:15, Jan Beulich a =C3=A9crit=C2=A0:
> On 16.02.2026 16:09, Teddy Astie wrote:
>> Package-related MSR is actually gated behind "PTM" CPUID flag rather tha=
n
>> "DTS" one. Make sure we check the right CPUID for package-related MSR.
>>
>> Check for either DTS or PTM for MSR_TEMPERATURE_TARGET.
>>
>> The only visible difference in practice would be that EPERM would now
>> be reported instead of EFAULT if we tried accessing the package MSR on
>> a platform that doesn't have it.
>>
>> Amends: 615c9f3f820 ("x86/platform: Expose DTS sensors MSR")
> 
> Imo this really addresses a bug, so wants to be Fixes:.
> 

I wasn't so sure between Fixes and Amends; but Fixes is ok for me.

>> --- a/xen/arch/x86/platform_hypercall.c
>> +++ b/xen/arch/x86/platform_hypercall.c
>> @@ -89,9 +89,12 @@ static bool msr_read_allowed(unsigned int msr)
>>           return cpu_has_srbds_ctrl;
>>   
>>       case MSR_IA32_THERM_STATUS:
>> +        return host_cpu_policy.basic.digital_temp_sensor;
> 
> As per the SDM this doesn't look right either - it's CPUID.01H:EDX[22]
> (acpi) instead. It is the field you're after in xenpm which is tied to
> CPUID.06H:EAX[0] (digital_temp_sensor).
> 

I'm not sure to follow exactly what you mean here.
Which CPUID should we check ?

>>       case MSR_TEMPERATURE_TARGET:
>> +        return host_cpu_policy.basic.digital_temp_sensor ||
>> +               host_cpu_policy.basic.package_therm_management;
> 
> Where in the SDM did you find this connection? (Anything made up wants
> commenting upon.)
> 

To me, we are interested in the MSR_TEMPERATURE_TARGET only with dts or 
ptm, and the only used probing method in practice is performing a safe 
rdmsr (at least in Linux coretemp).

That may be worth adding a comment eventually.

>>       case MSR_PACKAGE_THERM_STATUS:
>> -        return host_cpu_policy.basic.digital_temp_sensor;
>> +        return host_cpu_policy.basic.package_therm_management;
>>       }
> 
> And of course with this splitting of cases, blank lines want inserting
> between the case blocks.
> 
>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>> @@ -132,7 +132,7 @@ struct cpu_policy
>>                           :1,
>>                           :1,
>>                           :1,
>> -                        :1,
>> +                        package_therm_management:1,
> 
> The SDM calls this PKG_THERM_MGMT; I think our naming would better match =
now
> that we decided to have everything else here named according to the SDM.
> 

I can't find PKG_THERM_MGMT in my SDM version; but overall I don't have 
a strong opinion on naming and am fine with pkg_therm_mgmt.

> Jan
> 

Teddy



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



