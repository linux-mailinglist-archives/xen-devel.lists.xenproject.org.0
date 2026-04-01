Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PoDL+zVzGnnWwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 10:23:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31570376B59
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 10:23:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269993.1558839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7qqf-0003fQ-GV; Wed, 01 Apr 2026 08:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269993.1558839; Wed, 01 Apr 2026 08:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7qqf-0003dM-Dq; Wed, 01 Apr 2026 08:22:49 +0000
Received: by outflank-mailman (input) for mailman id 1269993;
 Wed, 01 Apr 2026 08:22:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <fengchengwen@huawei.com>) id 1w7qqd-0003dE-Jg
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 08:22:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7qqc-00AToi-Uv
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 10:22:46 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <fengchengwen@huawei.com>)
 id 69ccd5d5-e002-0a2a0a5209dd-0a2a450be3d6-8
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 10:22:46 +0200
Received: from [113.46.200.225] (helo=canpmsgout10.his.huawei.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <fengchengwen@huawei.com>)
 id 69ccd5d3-bca8-0a2a450b0019-712ec8e14828-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 10:22:46 +0200
Received: from mail.maildlp.com (unknown [172.19.162.92])
 by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4flyW63nb4z1K9VW;
 Wed,  1 Apr 2026 16:16:34 +0800 (CST)
Received: from kwepemk500009.china.huawei.com (unknown [7.202.194.94])
 by mail.maildlp.com (Postfix) with ESMTPS id 071664056C;
 Wed,  1 Apr 2026 16:22:42 +0800 (CST)
Received: from [10.67.121.161] (10.67.121.161) by
 kwepemk500009.china.huawei.com (7.202.194.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 1 Apr 2026 16:22:40 +0800
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=dkim header.d=huawei.com header.i="@huawei.com" header.h=From
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MTNaVMsdonTBgQUg0Ejtg6uI8JOpWHbQuBn8i2Muytk=;
	b=zfVqdZWZzivpJLTuZeEYbETVgUbpjxcc6vmJiz9VmBmGK7+p3ocbi7KhRl4SW1imGIWS+H+/S
	GEL7RNT6jhEzLuaPxUUhmMIjHBiCm2o5aipjEt5QgHPSsV8YAFhEn4y9speX8o0Hs3CLk5Jp28M
	LXlEaI+zkFwl4t8bQIqGT9w=
Message-ID: <504b43e1-fa7d-4694-b8af-fe4975823db3@huawei.com>
Date: Wed, 1 Apr 2026 16:22:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/8] ACPI: Unify CPU UID interface and fix ARM64 TPH
 steer-tag issue
To: "Rafael J. Wysocki" <rafael@kernel.org>
CC: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Palmer Dabbelt <palmer@dabbelt.com>, Borislav Petkov
	<bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, Juergen Gross
	<jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Sunil V L
	<sunilvl@ventanamicro.com>, Mark Rutland <mark.rutland@arm.com>, Jonathan
 Cameron <jonathan.cameron@huawei.com>, Kees Cook <kees@kernel.org>, Yanteng
 Si <si.yanteng@linux.dev>, Sean Christopherson <seanjc@google.com>, Kai Huang
	<kai.huang@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, Thomas Huth
	<thuth@redhat.com>, Thorsten Blum <thorsten.blum@linux.dev>, Kevin Loughlin
	<kevinloughlin@google.com>, Zheyun Shen <szy0127@sjtu.edu.cn>, Peter Zijlstra
	<peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Xin
 Li <xin@zytor.com>, "Ahmed S . Darwish" <darwi@linutronix.de>, Sohil Mehta
	<sohil.mehta@intel.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, Robin
 Murphy <robin.murphy@arm.com>, James Clark <james.clark@linaro.org>, Besar
 Wicaksono <bwicaksono@nvidia.com>, Ma Ke <make24@iscas.ac.cn>, Wei Huang
	<wei.huang2@amd.com>, Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Somnath Kotur <somnath.kotur@broadcom.com>, <punit.agrawal@oss.qualcomm.com>,
	<guohanjun@huawei.com>, <suzuki.poulose@arm.com>, <ryan.roberts@arm.com>,
	<chenl311@chinatelecom.cn>, <masahiroy@kernel.org>,
	<wangyuquan1236@phytium.com.cn>, <anshuman.khandual@arm.com>,
	<heinrich.schuchardt@canonical.com>, <Eric.VanTassell@amd.com>,
	<wangzhou1@hisilicon.com>, <wanghuiqiang@huawei.com>,
	<liuyonglong@huawei.com>, <linux-pci@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linux-riscv@lists.infradead.org>, <xen-devel@lists.xenproject.org>,
	<linux-acpi@vger.kernel.org>, <linux-perf-users@vger.kernel.org>
References: <20260320031737.35048-1-fengchengwen@huawei.com>
 <CAJZ5v0gO1VSPs58JeupaiTZBkP3i_-H2bEQpfU-6k2TXjdiaOQ@mail.gmail.com>
Content-Language: en-US
From: fengchengwen <fengchengwen@huawei.com>
In-Reply-To: <CAJZ5v0gO1VSPs58JeupaiTZBkP3i_-H2bEQpfU-6k2TXjdiaOQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.161]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk500009.china.huawei.com (7.202.194.94)
X-purgate-ID: tlsNG-42698a/1775031766-F5BC22A1-E052D146/0/0
X-purgate-type: clean
X-purgate-size: 3381
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:corbet@lwn.net,m:palmer@dabbelt.com,m:bp@alien8.de,m:hpa@zytor.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:sunilvl@ventanamicro.com,m:mark.rutland@arm.com,m:jonathan.cameron@huawei.com,m:kees@kernel.org,m:si.yanteng@linux.dev,m:seanjc@google.com,m:kai.huang@intel.com,m:thomas.lendacky@amd.com,m:thuth@redhat.com,m:thorsten.blum@linux.dev,m:kevinloughlin@google.com,m:szy0127@sjtu.edu.cn,m:peterz@infradead.org,m:pawan.kumar.gupta@linux.intel.com,m:xin@zytor.com,m:darwi@linutronix.de,m:sohil.mehta@intel.com,m:ilkka@os.amperecomputing.com,m:robin.murphy@arm.com,m:james.clark@linaro.org,m:bwicaksono@nvidia.com,m:make24@iscas.ac.cn,m:wei.huang2@amd.com,m:andrew.gospodarek@broadcom.com,m:somnath.kotur@broadcom.com,m:punit.agrawal@oss.qualcomm.com,m:guohanjun@huawei.com,m:suzuki.poulose@arm.com,m:ryan.roberts@arm.com,m:chenl311@chinatelecom.cn,m:masahiroy@kernel.org,m:wang
 yuquan1236@phytium.com.cn,m:anshuman.khandual@arm.com,m:heinrich.schuchardt@canonical.com,m:Eric.VanTassell@amd.com,m:wangzhou1@hisilicon.com,m:wanghuiqiang@huawei.com,m:liuyonglong@huawei.com,m:linux-pci@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:xen-devel@lists.xenproject.org,m:linux-acpi@vger.kernel.org,m:linux-perf-users@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:dkim,huawei.com:email,huawei.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[fengchengwen@huawei.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[huawei.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[fengchengwen@huawei.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[57];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 31570376B59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/2026 8:24 PM, Rafael J. Wysocki wrote:
> On Fri, Mar 20, 2026 at 4:17 AM Chengwen Feng <fengchengwen@huawei.com> wrote:
>>
>> This patchset unifies ACPI Processor UID retrieval across
>> arm64/loongarch/riscv/x86 via acpi_get_cpu_uid() (with input validation)
>> and fixes ARM64 CPU steer-tag retrieval failure in PCI/TPH:
>>
>> 1-4: Add acpi_get_cpu_uid() for arm64/loongarch/riscv/x86 (update
>>      respective users)
>> 5: Centralize acpi_get_cpu_uid() declaration in include/linux/acpi.h
>> 6: Clean up perf/arm_cspmu
>> 7: Clean up ACPI/PPTT and remove unused get_acpi_id_for_cpu()
>> 8: Pass ACPI Processor UID to Cache Locality _DSM
>>
>> The interface refactor ensures consistent CPU UID retrieval across
>> architectures (no functional changes for valid inputs) and provides the
>> unified interface required for the ARM64 TPH fix.
>>
>> ---
>> Changes in v10:
>> - Refine commit header&log according to Punit's and Bjorn's review
>> - Split perf/arm_cspmu as a separate commit which address Punit's
>>   review
>>
>> Changes in v9:
>> - Address Bjorn's review: split commits to each platform so that make
>>   them easy to review
>>
>> Changes in v8:
>> - Moving arm64's get_cpu_for_acpi_id() to kernel/acpi.c which address
>>   Jeremy's review
>>
>> Chengwen Feng (8):
>>   arm64: acpi: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
>>   LoongArch: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
>>   RISC-V: ACPI: Add acpi_get_cpu_uid() for unified ACPI CPU UID
>>     retrieval
>>   x86/acpi: Add acpi_get_cpu_uid() for unified ACPI CPU UID retrieval
>>   ACPI: Centralize acpi_get_cpu_uid() declaration in
>>     include/linux/acpi.h
>>   perf: arm_cspmu: Switch to acpi_get_cpu_uid() from
>>     get_acpi_id_for_cpu()
>>   ACPI: PPTT: Use acpi_get_cpu_uid() and remove get_acpi_id_for_cpu()
>>   PCI/TPH: Pass ACPI Processor UID to Cache Locality _DSM
>>
>>  Documentation/PCI/tph.rst          |  4 +--
>>  arch/arm64/include/asm/acpi.h      | 17 +---------
>>  arch/arm64/kernel/acpi.c           | 30 ++++++++++++++++++
>>  arch/loongarch/include/asm/acpi.h  |  5 ---
>>  arch/loongarch/kernel/acpi.c       |  9 ++++++
>>  arch/riscv/include/asm/acpi.h      |  4 ---
>>  arch/riscv/kernel/acpi.c           | 16 ++++++++++
>>  arch/riscv/kernel/acpi_numa.c      |  9 ++++--
>>  arch/x86/include/asm/cpu.h         |  1 -
>>  arch/x86/include/asm/smp.h         |  1 -
>>  arch/x86/kernel/acpi/boot.c        | 20 ++++++++++++
>>  arch/x86/xen/enlighten_hvm.c       |  5 +--
>>  drivers/acpi/pptt.c                | 50 ++++++++++++++++++++++--------
>>  drivers/acpi/riscv/rhct.c          |  7 ++++-
>>  drivers/pci/tph.c                  | 16 +++++++---
>>  drivers/perf/arm_cspmu/arm_cspmu.c |  6 ++--
>>  include/linux/acpi.h               | 11 +++++++
>>  include/linux/pci-tph.h            |  4 +--
>>  18 files changed, 158 insertions(+), 57 deletions(-)
>>
>> --
> 
> It doesn't look like anyone has a particular heartburn related to this
> series, so I could apply it in principle, but I'd appreciate some ACKs
> from arch maintainers.
> 
> Why don't you resend it with all of the tags collected so far (and
> please add x86@kernel.org to the CC list)?

done for resend v10 which with all the review/ack tag, add add x86@kernel.org to CC list

Thanks

