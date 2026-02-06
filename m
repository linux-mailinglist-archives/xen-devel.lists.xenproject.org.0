Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHYMKx2uhWkRFAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 10:02:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ECBFBC3F
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 10:02:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222983.1530640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voHj6-0006sZ-Qg; Fri, 06 Feb 2026 09:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222983.1530640; Fri, 06 Feb 2026 09:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voHj6-0006qv-Nv; Fri, 06 Feb 2026 09:02:08 +0000
Received: by outflank-mailman (input) for mailman id 1222983;
 Fri, 06 Feb 2026 09:02:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YaI+=AK=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1voHj5-0006qi-JX
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 09:02:07 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 82a9b045-033a-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 10:02:06 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D0B6339;
 Fri,  6 Feb 2026 01:01:59 -0800 (PST)
Received: from e134099.cambridge.arm.com (e134099.arm.com [10.1.198.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 981723F778;
 Fri,  6 Feb 2026 01:02:04 -0800 (PST)
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
X-Inumbo-ID: 82a9b045-033a-11f1-b161-2bf370ae4941
From: Harry Ramsey <harry.ramsey@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/3] Fifth MPU Series
Date: Fri,  6 Feb 2026 09:01:52 +0000
Message-ID: <20260206090155.68466-1-harry.ramsey@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.11 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[harry.ramsey@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Luca.Fancellu@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[harry.ramsey@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid]
X-Rspamd-Queue-Id: A7ECBFBC3F
X-Rspamd-Action: no action

This series continues to further the ongoing work to introduce support
for MPU systems in Xen.

The patches in this series aim to implement MPU specific p2m functions.

Harry Ramsey (2):
  arm/mpu: Introduce `v8r_el1_msa` device tree property for domains
  arm/mpu: Implement p2m tables

Penny Zheng (1):
  arm/mpu: implement setup_virt_paging for MPU system

 docs/misc/arm/device-tree/booting.txt    | 11 ++++
 xen/arch/arm/arm64/mpu/p2m.c             | 67 +++++++++++++++++++++-
 xen/arch/arm/dom0less-build.c            | 25 +++++++++
 xen/arch/arm/domain.c                    | 16 ++++++
 xen/arch/arm/include/asm/arm32/mpu.h     |  2 +
 xen/arch/arm/include/asm/arm64/mpu.h     |  2 +
 xen/arch/arm/include/asm/arm64/sysregs.h |  4 ++
 xen/arch/arm/include/asm/cpufeature.h    | 13 ++++-
 xen/arch/arm/include/asm/domain.h        |  9 +++
 xen/arch/arm/include/asm/mpu.h           |  5 ++
 xen/arch/arm/include/asm/mpu/p2m.h       | 12 ++++
 xen/arch/arm/include/asm/p2m.h           |  5 ++
 xen/arch/arm/include/asm/processor.h     | 11 ++++
 xen/arch/arm/mpu/p2m.c                   | 71 +++++++++++++++++++++++-
 xen/include/public/arch-arm.h            |  4 ++
 15 files changed, 250 insertions(+), 7 deletions(-)

--
2.43.0


