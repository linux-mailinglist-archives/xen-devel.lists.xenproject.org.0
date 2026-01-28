Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCpGLUKGemnx7AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 22:57:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA11A9502
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 22:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215994.1526007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlDXC-0000Gl-K7; Wed, 28 Jan 2026 21:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215994.1526007; Wed, 28 Jan 2026 21:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlDXC-0000EA-HF; Wed, 28 Jan 2026 21:57:10 +0000
Received: by outflank-mailman (input) for mailman id 1215994;
 Wed, 28 Jan 2026 21:57:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vlDXB-0000E4-RR
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 21:57:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vlDXA-0084oG-2J;
 Wed, 28 Jan 2026 21:57:08 +0000
Received: from [2a02:8012:3a1:0:2517:2769:8ea2:3b28]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vlDXA-006Sga-07;
 Wed, 28 Jan 2026 21:57:08 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=mI461cVXawa2nwdZipyyAU3NwrqZhkFsQBf35LG8M+I=; b=UeScH7pUfQ2t34Rwd5Df3iHL2s
	7ovNmwELMir1InQVLZktZQ8YjobErF4ZRdGV/h0B4RQOh1lqSOIOehp+tdVMbpEUESfcWT3SnmfoU
	j6JtPfNCdMlmxH4YYw2Himh38AlPUQ4peRtOju334T+tzIEdFCgo19lEgF0eSz5Oj9UI=;
Message-ID: <9740163b-5f0f-45b6-8d2f-df4b4756e272@xen.org>
Date: Wed, 28 Jan 2026 21:57:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Kconfig: Fix XEN_START_ADDRESS input prompt
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20260127131923.123294-1-michal.orzel@amd.com>
 <FAFAA9D7-DD69-4C6E-BEE3-424B8F9008F4@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <FAFAA9D7-DD69-4C6E-BEE3-424B8F9008F4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6AA11A9502
X-Rspamd-Action: no action

Hi,

On 27/01/2026 14:00, Bertrand Marquis wrote:
> 
> 
>> On 27 Jan 2026, at 14:19, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Remove the part about platform defined address which is not true. The
>> help text is correct i.e. 0xFFFFFFFF is used as default value to indicate
>> that user has not customized this address.
>>
>> Amends: d736b6eb451b ("xen/arm: mpu: Define Xen start address for MPU systems")
>> Reported-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

I have queued the patch for staging.

Cheers,

-- 
Julien Grall


