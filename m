Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7434D680839
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 10:10:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486670.754099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMQB1-0003mU-Cu; Mon, 30 Jan 2023 09:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486670.754099; Mon, 30 Jan 2023 09:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMQB1-0003jr-9t; Mon, 30 Jan 2023 09:10:11 +0000
Received: by outflank-mailman (input) for mailman id 486670;
 Mon, 30 Jan 2023 09:10:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OGSx=53=oderland.se=josef@srs-se1.protection.inumbo.net>)
 id 1pMQAy-0002nL-Ts
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 09:10:09 +0000
Received: from vsp04-out.oderland.com (vsp04-out.oderland.com
 [2a02:28f0::31:1]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e41bf481-a07d-11ed-9ec0-891035b88211;
 Mon, 30 Jan 2023 10:10:07 +0100 (CET)
Received: from office.oderland.com (office.oderland.com [91.201.60.5])
 by vsp-out.oderland.com (Halon) with ESMTPSA
 id e31d1808-a07d-11ed-84da-3167612d0455;
 Mon, 30 Jan 2023 10:10:06 +0100 (CET)
Received: from 160.193-180-18.r.oderland.com ([193.180.18.160]:45302
 helo=[10.137.0.14])
 by office.oderland.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
 (Exim 4.95) (envelope-from <josef@oderland.se>) id 1pMQAw-00AeZR-U5;
 Mon, 30 Jan 2023 10:10:05 +0100
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
X-Inumbo-ID: e41bf481-a07d-11ed-9ec0-891035b88211
X-Scanned-Cookie: 0162612eaad5b0a05cb4a8d9b4dce14a4c5e9ffb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=oderland.se
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GlzWozcYP8VFhu3TfQEgzwqw9EzqhKahQNYGN1a1Wes=; b=sO6gzS7syeZqv4KneATIZJGZZG
	pPrayOKMQvC6ujfYoqPVZ5iu6s8P2RivjpYriVO7PSEcFlOdB2jI+ivBkOCv94fwjeuJuMIyC40ir
	UXp0LliY8I8ccAnjLNKQ33zzWzEN1eUzymXqWAtdOsrAuar3sTXEG18wIdm1kKYcvscvoG1P1Ow3P
	/vRzPCK0aZPcWcN3nOLNgNdRJbPDcYlUMFT3L7BsPzJohsos3lIvtr4jYQsTI66h9DgI/vYGI2nkn
	+oPV7Hc2dj3bBYDZ30dyGhX+WxJ9eUImuELLhtY2afGdzFqNQWm9StkYudFQhjAfZzRgDi4V1bR1T
	4L2P1TyA==;
Message-ID: <407b7c10-ad1f-b6d2-2976-2b297755b2b3@oderland.se>
Date: Mon, 30 Jan 2023 10:10:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:108.0) Gecko/20100101
 Thunderbird/108.0
Subject: Re: [PATCH 3/3] xen/acpi: upload power and performance related data
 from a PVH dom0
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, x86@kernel.org
References: <20221121102113.41893-1-roger.pau@citrix.com>
 <20221121102113.41893-4-roger.pau@citrix.com>
From: Josef Johansson <josef@oderland.se>
In-Reply-To: <20221121102113.41893-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
x-oderland-domain-valid: yes


On 11/21/22 11:21, Roger Pau Monne wrote:
> When running as a PVH dom0 the ACPI MADT is crafted by Xen in order to
> report the correct numbers of vCPUs that dom0 has, so the host MADT is
> not provided to dom0.  This creates issues when parsing the power and
> performance related data from ACPI dynamic tables, as the ACPI
> Processor UIDs found on the dynamic code are likely to not match the
> ones crafted by Xen in the dom0 MADT.
>
> Xen would rely on Linux having filled at least the power and
> performance related data of the vCPUs on the system, and would clone
> that information in order to setup the remaining pCPUs on the system
> if dom0 vCPUs < pCPUs.  However when running as PVH dom0 it's likely
> that none of dom0 CPUs will have the power and performance data
> filled, and hence the Xen ACPI Processor driver needs to fetch that
> information by itself.
>
> In order to do so correctly, introduce a new helper to fetch the _CST
> data without taking into account the system capabilities from the
> CPUID output, as the capabilities reported to dom0 in CPUID might be
> different from the ones on the host.
>
>

Hi Roger,

First of all, thanks for doing the grunt work here to clear up the ACPI 
situation.

A bit of background, I'm trying to get an AMD APU (CPUID 0x17 (23)) to 
work properly
under Xen. It works fine otherwise but something is amiss under Xen.

Just to make sure that the patch is working as intended, what I found 
when trying it out
is that the first 8 CPUs have C-States, but 0, 2, 4, 6, 8, 10, 12, 14 
have P-States, out of
16 CPUs. Xen tells Linux that there are 8 CPUs since it's running with 
nosmt.

Regards
- Josef

xen_acpi_processor: Max ACPI ID: 30
xen_acpi_processor: Uploading Xen processor PM info
xen_acpi_processor: ACPI CPU0 - C-states uploaded.
xen_acpi_processor:      C1: ACPI HLT 1 uS
xen_acpi_processor:      C2: ACPI IOPORT 0x414 18 uS
xen_acpi_processor:      C3: ACPI IOPORT 0x415 350 uS
xen_acpi_processor: ACPI CPU0 - P-states uploaded.
xen_acpi_processor:      *P0: 1700 MHz, 2071 mW, 0 uS
xen_acpi_processor:       P1: 1600 MHz, 1520 mW, 0 uS
xen_acpi_processor:       P2: 1400 MHz, 1277 mW, 0 uS
xen_acpi_processor: ACPI CPU1 - C-states uploaded.
xen_acpi_processor:      C1: ACPI HLT 1 uS
xen_acpi_processor:      C2: ACPI IOPORT 0x414 18 uS
xen_acpi_processor:      C3: ACPI IOPORT 0x415 350 uS
xen_acpi_processor: ACPI CPU2 - C-states uploaded.
xen_acpi_processor:      C1: ACPI HLT 1 uS
xen_acpi_processor:      C2: ACPI IOPORT 0x414 18 uS
xen_acpi_processor:      C3: ACPI IOPORT 0x415 350 uS
xen_acpi_processor: ACPI CPU2 - P-states uploaded.
xen_acpi_processor:      *P0: 1700 MHz, 2071 mW, 0 uS
xen_acpi_processor:       P1: 1600 MHz, 1520 mW, 0 uS
xen_acpi_processor:       P2: 1400 MHz, 1277 mW, 0 uS
xen_acpi_processor: ACPI CPU3 - C-states uploaded.
xen_acpi_processor:      C1: ACPI HLT 1 uS
xen_acpi_processor:      C2: ACPI IOPORT 0x414 18 uS
xen_acpi_processor:      C3: ACPI IOPORT 0x415 350 uS
xen_acpi_processor: ACPI CPU4 - C-states uploaded.
xen_acpi_processor:      C1: ACPI HLT 1 uS
xen_acpi_processor:      C2: ACPI IOPORT 0x414 18 uS
xen_acpi_processor:      C3: ACPI IOPORT 0x415 350 uS
xen_acpi_processor: ACPI CPU4 - P-states uploaded.
xen_acpi_processor:      *P0: 1700 MHz, 2071 mW, 0 uS
xen_acpi_processor:       P1: 1600 MHz, 1520 mW, 0 uS
xen_acpi_processor:       P2: 1400 MHz, 1277 mW, 0 uS
xen_acpi_processor: ACPI CPU5 - C-states uploaded.
xen_acpi_processor:      C1: ACPI HLT 1 uS
xen_acpi_processor:      C2: ACPI IOPORT 0x414 18 uS
xen_acpi_processor:      C3: ACPI IOPORT 0x415 350 uS
xen_acpi_processor: ACPI CPU6 - C-states uploaded.
xen_acpi_processor:      C1: ACPI HLT 1 uS
xen_acpi_processor:      C2: ACPI IOPORT 0x414 18 uS
xen_acpi_processor:      C3: ACPI IOPORT 0x415 350 uS
xen_acpi_processor: ACPI CPU6 - P-states uploaded.
xen_acpi_processor:      *P0: 1700 MHz, 2071 mW, 0 uS
xen_acpi_processor:       P1: 1600 MHz, 1520 mW, 0 uS
xen_acpi_processor:       P2: 1400 MHz, 1277 mW, 0 uS
xen_acpi_processor: ACPI CPU7 - C-states uploaded.
xen_acpi_processor:      C1: ACPI HLT 1 uS
xen_acpi_processor:      C2: ACPI IOPORT 0x414 18 uS
xen_acpi_processor:      C3: ACPI IOPORT 0x415 350 uS
xen_acpi_processor: ACPI CPU0 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU0 w/ PST:coord_type = 254 domain = 0
xen_acpi_processor: CPU with ACPI ID 1 is unavailable
xen_acpi_processor: ACPI CPU2 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU2 w/ PST:coord_type = 254 domain = 1
xen_acpi_processor: CPU with ACPI ID 3 is unavailable
xen_acpi_processor: ACPI CPU4 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU4 w/ PST:coord_type = 254 domain = 2
xen_acpi_processor: CPU with ACPI ID 5 is unavailable
xen_acpi_processor: ACPI CPU6 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU6 w/ PST:coord_type = 254 domain = 3
xen_acpi_processor: CPU with ACPI ID 7 is unavailable
xen_acpi_processor: ACPI CPU8 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU8 w/ PST:coord_type = 254 domain = 4
xen_acpi_processor: CPU with ACPI ID 9 is unavailable
xen_acpi_processor: ACPI CPU10 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU10 w/ PST:coord_type = 254 domain = 5
xen_acpi_processor: CPU with ACPI ID 11 is unavailable
xen_acpi_processor: ACPI CPU12 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU12 w/ PST:coord_type = 254 domain = 6
xen_acpi_processor: CPU with ACPI ID 13 is unavailable
xen_acpi_processor: ACPI CPU14 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU14 w/ PST:coord_type = 254 domain = 7
xen_acpi_processor: CPU with ACPI ID 15 is unavailable
xen_acpi_processor: ACPI CPU8 - P-states uploaded.
xen_acpi_processor:      *P0: 1700 MHz, 2071 mW, 0 uS
xen_acpi_processor:       P1: 1600 MHz, 1520 mW, 0 uS
xen_acpi_processor:       P2: 1400 MHz, 1277 mW, 0 uS
xen_acpi_processor: ACPI CPU10 - P-states uploaded.
xen_acpi_processor:      *P0: 1700 MHz, 2071 mW, 0 uS
xen_acpi_processor:       P1: 1600 MHz, 1520 mW, 0 uS
xen_acpi_processor:       P2: 1400 MHz, 1277 mW, 0 uS
xen_acpi_processor: ACPI CPU12 - P-states uploaded.
xen_acpi_processor:      *P0: 1700 MHz, 2071 mW, 0 uS
xen_acpi_processor:       P1: 1600 MHz, 1520 mW, 0 uS
xen_acpi_processor:       P2: 1400 MHz, 1277 mW, 0 uS
xen_acpi_processor: ACPI CPU14 - P-states uploaded.
xen_acpi_processor:      *P0: 1700 MHz, 2071 mW, 0 uS
xen_acpi_processor:       P1: 1600 MHz, 1520 mW, 0 uS
xen_acpi_processor:       P2: 1400 MHz, 1277 mW, 0 uS

As a bonus, here are the previous debug output on the same machine.

xen_acpi_processor: Max ACPI ID: 30
xen_acpi_processor: Uploading Xen processor PM info
xen_acpi_processor: ACPI CPU0 - C-states uploaded.
xen_acpi_processor:      C1: ACPI HLT 1 uS
xen_acpi_processor:      C2: ACPI IOPORT 0x414 18 uS
xen_acpi_processor:      C3: ACPI IOPORT 0x415 350 uS
xen_acpi_processor: ACPI CPU0 - P-states uploaded.
xen_acpi_processor:      *P0: 1700 MHz, 2071 mW, 0 uS
xen_acpi_processor:       P1: 1600 MHz, 1520 mW, 0 uS
xen_acpi_processor:       P2: 1400 MHz, 1277 mW, 0 uS
xen_acpi_processor: ACPI CPU1 - C-states uploaded.
xen_acpi_processor:      C1: ACPI HLT 1 uS
xen_acpi_processor:      C2: ACPI IOPORT 0x414 18 uS
xen_acpi_processor:      C3: ACPI IOPORT 0x415 350 uS
xen_acpi_processor: ACPI CPU2 - C-states uploaded.
xen_acpi_processor:      C1: ACPI HLT 1 uS
xen_acpi_processor:      C2: ACPI IOPORT 0x414 18 uS
xen_acpi_processor:      C3: ACPI IOPORT 0x415 350 uS
xen_acpi_processor: ACPI CPU2 - P-states uploaded.
xen_acpi_processor:      *P0: 1700 MHz, 2071 mW, 0 uS
xen_acpi_processor:       P1: 1600 MHz, 1520 mW, 0 uS
xen_acpi_processor:       P2: 1400 MHz, 1277 mW, 0 uS
xen_acpi_processor: ACPI CPU3 - C-states uploaded.
xen_acpi_processor:      C1: ACPI HLT 1 uS
xen_acpi_processor:      C2: ACPI IOPORT 0x414 18 uS
xen_acpi_processor:      C3: ACPI IOPORT 0x415 350 uS
xen_acpi_processor: ACPI CPU4 - C-states uploaded.
xen_acpi_processor:      C1: ACPI HLT 1 uS
xen_acpi_processor:      C2: ACPI IOPORT 0x414 18 uS
xen_acpi_processor:      C3: ACPI IOPORT 0x415 350 uS
xen_acpi_processor: ACPI CPU4 - P-states uploaded.
xen_acpi_processor:      *P0: 1700 MHz, 2071 mW, 0 uS
xen_acpi_processor:       P1: 1600 MHz, 1520 mW, 0 uS
xen_acpi_processor:       P2: 1400 MHz, 1277 mW, 0 uS
xen_acpi_processor: ACPI CPU5 - C-states uploaded.
xen_acpi_processor:      C1: ACPI HLT 1 uS
xen_acpi_processor:      C2: ACPI IOPORT 0x414 18 uS
xen_acpi_processor:      C3: ACPI IOPORT 0x415 350 uS
xen_acpi_processor: ACPI CPU6 - C-states uploaded.
xen_acpi_processor:      C1: ACPI HLT 1 uS
xen_acpi_processor:      C2: ACPI IOPORT 0x414 18 uS
xen_acpi_processor:      C3: ACPI IOPORT 0x415 350 uS
xen_acpi_processor: ACPI CPU6 - P-states uploaded.
xen_acpi_processor:      *P0: 1700 MHz, 2071 mW, 0 uS
xen_acpi_processor:       P1: 1600 MHz, 1520 mW, 0 uS
xen_acpi_processor:       P2: 1400 MHz, 1277 mW, 0 uS
xen_acpi_processor: ACPI CPU7 - C-states uploaded.
xen_acpi_processor:      C1: ACPI HLT 1 uS
xen_acpi_processor:      C2: ACPI IOPORT 0x414 18 uS
xen_acpi_processor:      C3: ACPI IOPORT 0x415 350 uS
xen_acpi_processor: ACPI CPU0 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU0 w/ PST:coord_type = 254 domain = 0
xen_acpi_processor: ACPI CPU1 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU1 w/ PST:coord_type = 254 domain = 0
xen_acpi_processor: ACPI CPU2 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU2 w/ PST:coord_type = 254 domain = 1
xen_acpi_processor: ACPI CPU3 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU3 w/ PST:coord_type = 254 domain = 1
xen_acpi_processor: ACPI CPU4 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU4 w/ PST:coord_type = 254 domain = 2
xen_acpi_processor: ACPI CPU5 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU5 w/ PST:coord_type = 254 domain = 2
xen_acpi_processor: ACPI CPU6 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU6 w/ PST:coord_type = 254 domain = 3
xen_acpi_processor: ACPI CPU7 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU7 w/ PST:coord_type = 254 domain = 3
xen_acpi_processor: ACPI CPU8 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU8 w/ PST:coord_type = 254 domain = 4
xen_acpi_processor: ACPI CPU9 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU9 w/ PST:coord_type = 254 domain = 4
xen_acpi_processor: ACPI CPU10 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU10 w/ PST:coord_type = 254 domain = 5
xen_acpi_processor: ACPI CPU11 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU11 w/ PST:coord_type = 254 domain = 5
xen_acpi_processor: ACPI CPU12 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU12 w/ PST:coord_type = 254 domain = 6
xen_acpi_processor: ACPI CPU13 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU13 w/ PST:coord_type = 254 domain = 6
xen_acpi_processor: ACPI CPU14 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU14 w/ PST:coord_type = 254 domain = 7
xen_acpi_processor: ACPI CPU15 w/ PBLK:0x0
xen_acpi_processor: ACPI CPU15 w/ PST:coord_type = 254 domain = 7
xen_acpi_processor: ACPI CPU8 - P-states uploaded.
xen_acpi_processor:      *P0: 1700 MHz, 2071 mW, 0 uS
xen_acpi_processor:       P1: 1600 MHz, 1520 mW, 0 uS
xen_acpi_processor:       P2: 1400 MHz, 1277 mW, 0 uS
xen_acpi_processor: ACPI CPU10 - P-states uploaded.
xen_acpi_processor:      *P0: 1700 MHz, 2071 mW, 0 uS
xen_acpi_processor:       P1: 1600 MHz, 1520 mW, 0 uS
xen_acpi_processor:       P2: 1400 MHz, 1277 mW, 0 uS
xen_acpi_processor: ACPI CPU12 - P-states uploaded.
xen_acpi_processor:      *P0: 1700 MHz, 2071 mW, 0 uS
xen_acpi_processor:       P1: 1600 MHz, 1520 mW, 0 uS
xen_acpi_processor:       P2: 1400 MHz, 1277 mW, 0 uS
xen_acpi_processor: ACPI CPU14 - P-states uploaded.
xen_acpi_processor:      *P0: 1700 MHz, 2071 mW, 0 uS
xen_acpi_processor:       P1: 1600 MHz, 1520 mW, 0 uS
xen_acpi_processor:       P2: 1400 MHz, 1277 mW, 0 uS

