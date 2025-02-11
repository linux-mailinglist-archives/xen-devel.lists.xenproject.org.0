Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7160CA30A8F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 12:44:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885464.1295275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thogW-0002JQ-Ew; Tue, 11 Feb 2025 11:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885464.1295275; Tue, 11 Feb 2025 11:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thogW-0002GI-C9; Tue, 11 Feb 2025 11:44:12 +0000
Received: by outflank-mailman (input) for mailman id 885464;
 Tue, 11 Feb 2025 11:44:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OJrH=VC=huawei.com=ruanjinjie@srs-se1.protection.inumbo.net>)
 id 1thogU-0002GC-Bc
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 11:44:10 +0000
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78aea2a1-e86d-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 12:44:05 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Ysfjx48WNz20qDJ;
 Tue, 11 Feb 2025 19:44:21 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id 52E87140153;
 Tue, 11 Feb 2025 19:43:52 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemg200008.china.huawei.com (7.202.181.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Feb 2025 19:43:50 +0800
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
X-Inumbo-ID: 78aea2a1-e86d-11ef-a075-877d107080fb
Message-ID: <a715dd5d-f353-371c-f542-7430668f2e12@huawei.com>
Date: Tue, 11 Feb 2025 19:43:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next v5 00/22] arm64: entry: Convert to generic entry
Content-Language: en-US
To: Mark Rutland <mark.rutland@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<sstabellini@kernel.org>, <tglx@linutronix.de>, <peterz@infradead.org>,
	<luto@kernel.org>, <mingo@redhat.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <kees@kernel.org>, <wad@chromium.org>,
	<akpm@linux-foundation.org>, <samitolvanen@google.com>,
	<masahiroy@kernel.org>, <hca@linux.ibm.com>, <aliceryhl@google.com>,
	<rppt@kernel.org>, <xur@google.com>, <paulmck@kernel.org>, <arnd@arndb.de>,
	<mbenes@suse.cz>, <puranjay@kernel.org>, <pcc@google.com>, <ardb@kernel.org>,
	<sudeep.holla@arm.com>, <guohanjun@huawei.com>, <rafael@kernel.org>,
	<liuwei09@cestc.cn>, <dwmw@amazon.co.uk>, <Jonathan.Cameron@huawei.com>,
	<liaochang1@huawei.com>, <kristina.martsenko@arm.com>, <ptosi@google.com>,
	<broonie@kernel.org>, <thiago.bauermann@linaro.org>, <kevin.brodsky@arm.com>,
	<joey.gouly@arm.com>, <liuyuntao12@huawei.com>, <leobras@redhat.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<xen-devel@lists.xenproject.org>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <c34ebe3f-b78a-1a17-0c6a-48d3874f8be9@huawei.com>
 <Z6nxWM8cnhd32yfW@J2N7QTR9R3>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <Z6nxWM8cnhd32yfW@J2N7QTR9R3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemg200008.china.huawei.com (7.202.181.35)



On 2025/2/10 20:30, Mark Rutland wrote:
> On Sat, Feb 08, 2025 at 09:15:08AM +0800, Jinjie Ruan wrote:
>> On 2024/12/6 18:17, Jinjie Ruan wrote:
>>> Currently, x86, Riscv, Loongarch use the generic entry. Convert arm64
>>> to use the generic entry infrastructure from kernel/entry/*. The generic
>>> entry makes maintainers' work easier and codes more elegant, which aslo
>>> removed a lot of duplicate code.
>>>
>>> The main steps are as follows:
>>> - Make arm64 easier to use irqentry_enter/exit().
>>> - Make arm64 closer to the PREEMPT_DYNAMIC code of generic entry.
>>> - Split generic entry into generic irq entry and generic syscall to
>>>   make the single patch more concentrated in switching to one thing.
>>> - Switch to generic irq entry.
>>> - Make arm64 closer to the generic syscall code.
>>> - Switch to generic entry completely.
>>>
>>> Changes in v5:
>>> - Not change arm32 and keep inerrupts_enabled() macro for gicv3 driver.
>>> - Move irqentry_state definition into arch/arm64/kernel/entry-common.c.
>>> - Avoid removing the __enter_from_*() and __exit_to_*() wrappers.
>>> - Update "irqentry_state_t ret/irq_state" to "state"
>>>   to keep it consistently.
>>> - Use generic irq entry header for PREEMPT_DYNAMIC after split
>>>   the generic entry.
>>> - Also refactor the ARM64 syscall code.
>>> - Introduce arch_ptrace_report_syscall_entry/exit(), instead of
>>>   arch_pre/post_report_syscall_entry/exit() to simplify code.
>>> - Make the syscall patches clear separation.
>>> - Update the commit message.
>>
>> Gentle Ping.
> 
> I've left soem comments.
> 
> As I mentioned previously, I'd very much prefer that we do the syscall
> entry logic changes *later* (i.e. as a follow-up patch series), after
> we've got the irq/exception entry logic sorted.
> 
> I reckon we've got just enough time to get the irq/exception entry
> changes ready this cycle, with another round or two of review. So can we
> please put the syscall bits aside for now? ... that and run all the
> tests you mention in patch 22 on the irq/exception entry changes alone.

Sure, it is ok to put the syscall bits aside and split it out .

> 
> Mark.
> 
> 

