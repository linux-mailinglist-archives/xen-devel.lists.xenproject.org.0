Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2001E2816EC
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 17:43:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2239.6668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOND2-0007aL-94; Fri, 02 Oct 2020 15:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2239.6668; Fri, 02 Oct 2020 15:43:00 +0000
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
	id 1kOND2-0007Zr-5d; Fri, 02 Oct 2020 15:43:00 +0000
Received: by outflank-mailman (input) for mailman id 2239;
 Fri, 02 Oct 2020 15:42:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kOND0-0007ZV-0w
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 15:42:58 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8458d17a-c2e9-4f3a-8306-311a986c7892;
 Fri, 02 Oct 2020 15:42:56 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kOND0-0007ZV-0w
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 15:42:58 +0000
X-Inumbo-ID: 8458d17a-c2e9-4f3a-8306-311a986c7892
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8458d17a-c2e9-4f3a-8306-311a986c7892;
	Fri, 02 Oct 2020 15:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601653376;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=2vB/BhgmcK/033yAkis2WFflAsrHtymEDb+pmWYoL2o=;
  b=dtowS8WRLEXGxqd8C02Y+S2IfGjviDsqJApFM1qehE/x0TUdGTazemjg
   yNeA7RsWuPcnBpjnVruR2N5TzvqflUVo7Z4iGcTLSZItrmOnP1XUrGjZK
   cvi6PgPkNUh109g/E8DDMT+sus3B5DCWdEPLo45udxv4iRQMaPAj7tnSr
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: nd7SNFVxjW5sRcXrQRWBKfq5bq1a61ky3GiRdH5dh+nokrGVxvpLLORvv6oJFes4fAKeHJKH7G
 FObcTadzFUsgQHvrmzvgnQ5pw3YcBWMmTeXYkVR41vjBlZ4tgw6kCoJ/Oi33UWfuQSb+SUq0b4
 xWIpgEyVpWAyX32iAfNY5cDPQYlJ3YzO3Ph1cbWeveQIJCkYkBqyfHGbzLPkBYy5m9CGug14CK
 1S65GYSgu+A/SpnWLKWMJ9o17/Y6ACkZ3pH8k5k/pDoC7uI85JRXv0ox8v4KZY7MjkugiCK4uu
 6AY=
X-SBRS: None
X-MesageID: 28440549
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,328,1596513600"; 
   d="scan'208";a="28440549"
Subject: Re: Yet another S3 issue in Xen 4.14
To: Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
CC: xen-devel <xen-devel@lists.xenproject.org>
References: <20201001011245.GL3962@mail-itl>
 <a80ad59b-feb1-01c8-2b14-dbf6568d0ff5@suse.com>
 <20201001123129.GJ1482@mail-itl>
 <1e596ccc-a875-93f1-2619-e4dbcbd88b4d@citrix.com>
 <20201002150859.GM3962@mail-itl>
 <454ac9ce-012f-f2e7-722d-c5304fd3146f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <aa5e1a7b-3724-bdc1-a313-0598aabd181f@citrix.com>
Date: Fri, 2 Oct 2020 16:42:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <454ac9ce-012f-f2e7-722d-c5304fd3146f@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 02/10/2020 16:39, Jan Beulich wrote:
> On 02.10.2020 17:08, Marek Marczykowski-Górecki wrote:
>> I've done another bisect on the commit broken up in separate changes
>> (https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=shortlog;h=refs/heads/dbg-s3)
>> and the bad part seems to be this:
>>
>> From dbdb32f8c265295d6af7cd4cd0aa12b6d04a0430 Mon Sep 17 00:00:00 2001
>> From: Andrew Cooper <andrew.cooper3@citrix.com>
>> Date: Fri, 2 Oct 2020 15:40:22 +0100
>> Subject: [PATCH 1/1] CR4
> Interesting - I was wild guessing so yesterday, but couldn't come
> up with even a vague reason why this would be. I think you could
> further split it up:
>
>> --- a/xen/arch/x86/acpi/power.c
>> +++ b/xen/arch/x86/acpi/power.c
>> @@ -195,7 +195,6 @@ static int enter_state(u32 state)
>>      unsigned long flags;
>>      int error;
>>      struct cpu_info *ci;
>> -    unsigned long cr4;
>>  
>>      if ( (state <= ACPI_STATE_S0) || (state > ACPI_S_STATES_MAX) )
>>          return -EINVAL;
>> @@ -270,15 +269,15 @@ static int enter_state(u32 state)
>>  
>>      system_state = SYS_STATE_resume;
>>  
>> -    /* Restore CR4 and EFER from cached values. */
>> -    cr4 = read_cr4();
>> -    write_cr4(cr4 & ~X86_CR4_MCE);
>> +    /* Restore EFER from cached value. */
>>      write_efer(read_efer());
> This one should be possible to leave in place despite ...
>
>>      device_power_up(SAVED_ALL);
>>  
>>      mcheck_init(&boot_cpu_data, false);
>> -    write_cr4(cr4);
>> +
>> +    /* Restore CR4 from cached value, now MCE is set up. */
>> +    write_cr4(read_cr4());
> ... this change.
>
> Further, while I can't see how the set_in_cr4() in mcheck_init()
> could badly interact with the CR4 writes here, another option
> might be to suppress it when system_state == SYS_STATE_resume
> && c == &boot_cpu_data (or !bsp && c == &boot_cpu_data).
>
>> --- a/xen/arch/x86/acpi/suspend.c
>> +++ b/xen/arch/x86/acpi/suspend.c
>> @@ -23,7 +23,4 @@ void save_rest_processor_state(void)
>>  void restore_rest_processor_state(void)
>>  {
>>      load_system_tables();
>> -
>> -    /* Restore full CR4 (inc MCE) now that the IDT is in place. */
>> -    write_cr4(mmu_cr4_features);
>>  }
> This one should be possible to leave in place despite the other
> changes.

We're continuing to debug in private.  mmu_cr4_features and read_cr4()
are equivalent (as expected), but very different from MINIMAL_CR4 which
is what the trampoline configures, so I think we're suffering a
CR4-related #UD/#GP somewhere in device_power_up() or mcheck_init().

Its not INVPCID.  Trying others.

~Andrew

