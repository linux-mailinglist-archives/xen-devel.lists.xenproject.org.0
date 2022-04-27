Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 694DF512174
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 20:44:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315390.533926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njmeO-0004xP-Uz; Wed, 27 Apr 2022 18:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315390.533926; Wed, 27 Apr 2022 18:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njmeO-0004vA-Rl; Wed, 27 Apr 2022 18:44:32 +0000
Received: by outflank-mailman (input) for mailman id 315390;
 Wed, 27 Apr 2022 18:44:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7gAn=VF=cantab.net=dvrabel@srs-se1.protection.inumbo.net>)
 id 1njmeN-0004v4-Hb
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 18:44:31 +0000
Received: from smarthost01b.ixn.mail.zen.net.uk
 (smarthost01b.ixn.mail.zen.net.uk [212.23.1.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11f999a1-c65a-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 20:44:29 +0200 (CEST)
Received: from [82.70.146.41] (helo=pear.davidvrabel.org.uk)
 by smarthost01b.ixn.mail.zen.net.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 (envelope-from <dvrabel@cantab.net>)
 id 1njmeL-0002At-Jb; Wed, 27 Apr 2022 18:44:29 +0000
Received: from apple.davidvrabel.org.uk ([82.70.146.43])
 by pear.davidvrabel.org.uk with esmtp (Exim 4.94.2)
 (envelope-from <dvrabel@cantab.net>)
 id 1njmeB-001KKX-MR; Wed, 27 Apr 2022 19:44:28 +0100
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
X-Inumbo-ID: 11f999a1-c65a-11ec-8fc2-03012f2f19d4
Message-ID: <b5234297-c70c-ffc8-9104-99eb6f5a0e24@cantab.net>
Date: Wed, 27 Apr 2022 19:44:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-GB
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, David Vrabel <dvrabel@amazon.co.uk>
References: <20220419150320.64783-1-dvrabel@cantab.net>
 <6076f458-a56f-448b-2001-6af38b998edb@citrix.com>
From: David Vrabel <dvrabel@cantab.net>
In-Reply-To: <6076f458-a56f-448b-2001-6af38b998edb@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 82.70.146.43
X-SA-Exim-Mail-From: dvrabel@cantab.net
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	pear.davidvrabel.org.uk
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
	version=3.4.6
Subject: Re: Regression with CET: [PATCH v1] x86/mm: avoid inadvertently
 degrading a TLB flush to local only
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on pear.davidvrabel.org.uk)
X-Originating-smarthost01b-IP: [82.70.146.41]
Feedback-ID: 82.70.146.41



On 27/04/2022 19:03, Andrew Cooper wrote:
> On 19/04/2022 16:03, David Vrabel wrote:
>> From: David Vrabel <dvrabel@amazon.co.uk>
>>
>> If the direct map is incorrectly modified with interrupts disabled,
>> the required TLB flushes are degraded to flushing the local CPU only.
>>
>> This could lead to very hard to diagnose problems as different CPUs will
>> end up with different views of memory. Although, no such issues have yet
>> been identified.
>>
>> Change the check in the flush_area() macro to look at system_state
>> instead. This defers the switch from local to all later in the boot
>> (see xen/arch/x86/setup.c:__start_xen()). This is fine because
>> additional PCPUs are not brought up until after the system state is
>> SYS_STATE_smp_boot.
>>
>> Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>
> 
> This explodes on CET systems:
> 
> (XEN) Assertion 'local_irq_is_enabled()' failed at arch/x86/smp.c:265
> (XEN) ----[ Xen-4.17.0-10.24-d  x86_64  debug=y  Not tainted ]----
> (XEN) CPU:    0
> (XEN) RIP:    e008:[<ffff82d040345300>] flush_area_mask+0x40/0x13e
> <snip>
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040345300>] R flush_area_mask+0x40/0x13e
> (XEN)    [<ffff82d040338a40>] F modify_xen_mappings+0xc5/0x958
> (XEN)    [<ffff82d0404474f9>] F
> arch/x86/alternative.c#_alternative_instructions+0xb7/0xb9
> (XEN)    [<ffff82d0404476cc>] F alternative_branches+0xf/0x12
> (XEN)    [<ffff82d04044e37d>] F __start_xen+0x1ef4/0x2776
> (XEN)    [<ffff82d040203344>] F __high_start+0x94/0xa0
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Assertion 'local_irq_is_enabled()' failed at arch/x86/smp.c:265
> (XEN) ****************************************
> (XEN)
> 
> We really did want a local-only flush here, because we specifically
> intended to make self-modifying changes before bringing secondary CPUs up.

I think the transition to SYS_STATE_smp_boot system state should be 
later. i.e., the last point were only 1 PCPU is guaranteed.

David

