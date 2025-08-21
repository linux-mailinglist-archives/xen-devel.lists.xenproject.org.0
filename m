Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11124B2FFF3
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 18:25:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089052.1446754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up86A-0003Nl-2f; Thu, 21 Aug 2025 16:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089052.1446754; Thu, 21 Aug 2025 16:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up869-0003LW-VM; Thu, 21 Aug 2025 16:25:09 +0000
Received: by outflank-mailman (input) for mailman id 1089052;
 Thu, 21 Aug 2025 16:25:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fS9d=3B=arm.com=ada.coupriediaz@srs-se1.protection.inumbo.net>)
 id 1up869-0002m3-0g
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 16:25:09 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6674bc20-7eab-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 18:25:07 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85839152B;
 Thu, 21 Aug 2025 09:24:58 -0700 (PDT)
Received: from [10.57.1.220] (unknown [10.57.1.220])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D68F3F738;
 Thu, 21 Aug 2025 09:25:03 -0700 (PDT)
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
X-Inumbo-ID: 6674bc20-7eab-11f0-b898-0df219b8e170
Message-ID: <e412cd01-cf76-4486-a475-74b255aff4ab@arm.com>
Date: Thu, 21 Aug 2025 17:25:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/8] arm64: entry: Refactor preempt_schedule_irq()
 check code
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20250815030633.448613-1-ruanjinjie@huawei.com>
 <20250815030633.448613-7-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, oleg@redhat.com,
 sstabellini@kernel.org, mark.rutland@arm.com, mbenes@suse.cz,
 broonie@kernel.org, anshuman.khandual@arm.com, ryan.roberts@arm.com,
 chenl311@chinatelecom.cn, liaochang1@huawei.com, kristina.martsenko@arm.com,
 leitao@debian.org, ardb@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250815030633.448613-7-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 15/08/2025 04:06, Jinjie Ruan wrote:
> To align the structure of the code with irqentry_exit_cond_resched()
> from the generic entry code, hoist the need_irq_preemption()
> and IS_ENABLED() check earlier. And different preemption check functions
> are defined based on whether dynamic preemption is enabled.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---

That looks good to me as well, thanks for the changes !
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>


