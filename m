Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLcxG8jIGWpXzAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 19:11:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECF16062D7
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 19:11:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322700.1588971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wT0j2-0001Bh-Vn; Fri, 29 May 2026 17:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322700.1588971; Fri, 29 May 2026 17:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wT0j2-00018s-RJ; Fri, 29 May 2026 17:10:24 +0000
Received: by outflank-mailman (input) for mailman id 1322700;
 Fri, 29 May 2026 17:10:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1wT0j1-00017U-Bu
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 17:10:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wT0j0-006Ari-EW
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 19:10:22 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a19c84a-bab6-0a2a0a5309dd-0a2a450cbd72-42
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 19:10:21 +0200
Received: from [52.101.57.39]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a19c87c-62f1-0a2a450c0019-34653927b0d9-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 19:10:21 +0200
Received: from SA1P222CA0077.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::24)
 by LV3PR12MB9268.namprd12.prod.outlook.com (2603:10b6:408:216::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 17:10:10 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:806:2c1:cafe::a6) by SA1P222CA0077.outlook.office365.com
 (2603:10b6:806:2c1::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.14 via Frontend Transport; Fri, 29
 May 2026 17:10:09 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 17:10:09 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 29 May
 2026 12:10:08 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via
 Frontend Transport; Fri, 29 May 2026 12:10:07 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pthktce2JqM8SP3MUxOCVFV6lCuTGGa8NIgc1K5W8dCEdfpqS+zBVLZos9t5Jo5xz4NGQggL4LdDVS3cvaz1s0iKSY+14ynRt9hpoA059hjyQNLG3jZcFeO+VUk97OaFUYMVabn1YG+sczJLQESC0cDEP38e26NL0KaXHs8jEaVlVzluWsSmO+/QSmP9LNruF4DxuCleRC+7IRv/wmZ2W/t044qi5sjzE3ch27lI5ARuENujNWPS24/HNEbc6g/oKlwxR3o6oUdMjjgc4mpCY1Hq49jD5Mlsz3/ic0xA7UQiPt6E7UT5LCpN4jPiLWM8gfkOFxai4rhp+U4tGyNhHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIzDVquxVpLE6+YstaZL+qkPGeRJjS7Y/EFypuMCXcs=;
 b=W/4IG1RCHDTk+k//b214gAGoxAkZLeyslvpZm5YaFZOFrbOTKnNZUnZyfpF3veWMuLvGbme8o0HZNYe/si0kt8AzrkAivNxJopnQFu4eQtG6wvekUzODMHf6F2KZaZ3kx9jaZcaTrxnc5cg42PcZXNxt4/NZa6kkqJIz/31xHqkSynaaxp2f3TmiLgZNfYysLmeSXJ4iNewNjwE60+Dg4ujwSnJAsr4NXR9RwyLDyw9iCROXBEOzkmdKcd7A8zLasdZQq7DUM4cEXN1JJNewysHrsGjZ0Qqsxzauban0ECtBxozjBOE+1I9hTrk5rY3lDZ0Pm3PwBGyYANrTMFS4yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIzDVquxVpLE6+YstaZL+qkPGeRJjS7Y/EFypuMCXcs=;
 b=u/l+tMOWs++W7mdg8LF2cB9RN2dvrmuhh2eKdLxQBezNKHmup4q4wAnO4T4Fv5hi5KGzxPN5AE3ZONR3sc1vtnU+WsDzyeSECK3DrbG8C2m1dtlGbk3D4TL2x0So5RoCLu0i5SD0qzN5mhJJgdwixz6W4MiE6VyEQIo/8TQzx3I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 for 4.23] Add GICv3 SGI boot/self tests in Xen
Date: Fri, 29 May 2026 18:09:56 +0100
Message-ID: <20260529170956.49797-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|LV3PR12MB9268:EE_
X-MS-Office365-Filtering-Correlation-Id: bfe8198b-1c9a-4872-36e5-08debda52375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|10063799003|13003099007|6133799003|11063799006|3023799007|5023799004|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	7TSC5HCb9dfrEeXR3K5WVyX0zNP134E4gu7ART0G3D0aB+GGSxCPNaDklG5HfPFJBV7ZDitMmCyeS9sSQ++BnGILOPlWsSkJNipybPij2RESt3nWqC86WDKE90OZghOj/RZqn7bY5g7cdXs4F1i1yCEptxG61ESObrCGrVlnNPuI4rg9xLYKMcD86TzN35lQ7ILSdy36fDeJex9J9YJKKeuNRKxP4XlBQH8SYrFvJvB5kEkp8lZ3OiKcVMBhVUXcYEdJnJ5FLF/pSVbMG0oasz2MGnKcp6ZekzX8o9/feeo70FdcQSZ7U7HvVROanQYl+L/8GKldyszvd76DN5znb2UKXvhgg1nWQM5+8s5cpUDqSBmkIP1GoV/0/ytctOMy6MO2SfVxs1ILQUjsQ7Ew9iDmHYsOHjqXevDxHPgI75mVyH60Mnbb1xIgwWavQmnuQ6IUhIhmDAoSKl3/FU3BvxPITODQDTmwVU91MrQ5HnaHL4+u6XncyszPecO/WBU34/lN42+5le1D7eXEXHetSzWcGRGu80EPkK1pMUIso2SwLIh2Py8mlmEt2vPt6hn6b3IxSdO8vsL4klWuUBMiBZLbuLTkczOi9QTLLu4T96KyRRtybBKdRjFH1nR2L8IvXxhSm+/Ja1c6K+9dPN9spT5w7ePzQWc2dyOX1LnKeO9CeYEYAZegkqf8SP5fTZVN
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(10063799003)(13003099007)(6133799003)(11063799006)(3023799007)(5023799004)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JWZOuZUWBf+81NdwIkyAvYL1nUi+qfafruhyLIfp9VGv6vOQTe5xnUhnGhuUAMiqfyXR3EN0ioYaqCzYptmCmwSjZ5ST8hR/Jy4mWoDNA9qIHY3StswNogMeAkd0CT9v7k1UybDxr5qu0WaOSaAP2zmSRVX5bmtd7CGplOVAjPeltR6LEZZNPcGeQc1whFdaqr4lQNdeX1FUCGhDQq5pm01N1Ypbv60hnToccxU/fJhhkYuDUNchTzSedmONl5ZfJelJ2Sf1JZyhzRxi1eXocua+ny1lZYQts8ybqo6z6M4+rLFjGwL3U8qQ2ky2OFvVHa87WaheOxL6Ihbp0YHL6QJyDZ6NtuDjshAdW+ZU/cBGY+EriqyqMvgjFZGNHBtC2gJyWQ+dC9vIjti52dspYnTl17f/DJAbObFVe9Ee2Ev0ccWDyS0y3BSg6lRRyjp9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 17:10:09.4626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfe8198b-1c9a-4872-36e5-08debda52375
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9268
X-purgate-ID: tlsNG-d25034/1780074621-E357FCF5-259B9DE3/0/0
X-purgate-type: clean
X-purgate-size: 17331
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[ayan.kumar.halder@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ayan.kumar.halder@amd.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayan.kumar.halder@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,gitlab.com:url,xenproject.org:url,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: 8ECF16062D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Boot self-tests (also referred to as boot-time tests or power-on
self-tests) are intended to validate internal features of Xen during
bring-up. They are meant to be run in a debug / validation environment;
Xen is not expected to remain functional for production use after the
self-tests have executed. The purpose of these tests is to catch
hardware configuration issues early and to confirm that the platform
on which Xen has been brought up is sane. The expected flow is:
build Xen with the self-tests enabled, boot it, inspect the results,
and then reboot into the usual production configuration.

Introduce the tests to confirm that:
1. A cpu can send SGI 0 to itself
2. A cpu can send SGI 0 to another specific CPU
3. A cpu can send SGI 0 to all the other CPUs
4. A cpu can send SGI 1 to another CPU

These tests aim to test Xen has configured the GIC correctly to use SGIs.
Thus, the tests invoke specific APIs of GIC driver.

Also, introduce a config CONFIG_BOOT_SELFTEST which enables these tests.
The option defaults to N; it should be disabled for production builds and
is intended for the validation pipeline and coverage measurement. The
tests run during Xen boot and validate internal interfaces such as Xen's
interface with hardware, firmware and the bootloader.

Also, introduce an integer command line parameter "gic-test". By default, it
is set to 0 which means no tests are enabled.
For running SGI tests, "gic-test" should be set to 1. In future if we add
tests for distributer, ITS, LPI, etc, then we can use different numbers.
Thus, each number denotes a functionality of GICv3 which can be tested
independently and within a single boot of Xen.

In this way, we ensure that the tests to validate SGIs do not impact any other
tests.

In order to keep all the boot-time self-tests together in the binary, we
have introduced a separate section "initcallboottest". All the tests are
registered using __initcallboottest. During the bootup of each core, Xen
invokes do_init_boottests() to run the these tests. All these tests are
invoked before Xen creates the domains (in case of primary core) or runs
the idle loop (in case of secondary core).

Note: it was suggested that, once the boot self-tests have run, Xen
should call machine_halt() rather than continue booting (since this
build is only intended for validation). This is not wired in here
because the SGIs are sent from the primary and secondary CPUs and
received asynchronously on the target CPUs. There is no definite point
in the boot flow at which Xen can know that every send has been
observed by its receiver, so "after the tests have completed" has no
well-defined moment at which to insert machine_halt().

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Link to v1 (RFC):
https://lists.xenproject.org/archives/html/xen-devel/2025-09/msg00956.html

Upstream CI run (xen-project/people/ayankuma/xen fork, one commit on
top of xen-project/xen staging — all Linux builds + tests including
qemu-smoke-boot-selftest-arm64-gcc-debug passed; only the macos jobs
sit pending because the personal fork has no macos runner):
https://gitlab.com/xen-project/people/ayankuma/xen/-/pipelines/2561806695

Changes in v2:
 - Renamed the patch from "xen/arm: Introduce GICV3 Self Tests" to
   "Add GICv3 SGI boot/self tests in Xen", and rewrote the commit
   message to explain the intent of boot self-tests (debug /
   validation builds only, Xen not expected to remain functional
   afterwards).
 - Moved the selftest code out of gic-v3.c into a dedicated file
   xen/arch/arm/gic-test.c, gated by CONFIG_BOOT_SELFTEST
   (Stefano, Grygorii).
 - Introduced a generic boot-self-test framework: new section
   "initcallboottest", registration macro __initcallboottest, and
   do_init_boottests() invoked once per CPU after
   local_irq_enable(), so the test runs on every CPU (boot +
   secondaries) and no longer collides with the IRQ-enable timing
   in gicv3_init() (Julien #1, Julien #3).
 - Added Kconfig option CONFIG_BOOT_SELFTEST in
   xen/arch/arm/Kconfig (arm-only for now; arch-specific because
   the only registered test is GICv3-specific).
 - Reserved a dedicated SGI value GIC_SGI_TEST in enum gic_sgi
   (xen/arch/arm/include/asm/gic.h), so the selftest never
   reuses a functional SGI (Grygorii #3).
 - Added a runtime integer command-line parameter "gic-test" so
   the selftest binary can be shipped but its execution selected
   at boot (gic-test=0 -> no-op; gic-test=1 -> SGI tests). Future
   GICv3 features (distributor, ITS, LPI, ...) can claim further
   values (Grygorii #2, partial).
 - Documented why machine_halt() is not invoked after the tests:
   SGI delivery is asynchronous, so there is no well-defined
   point after which every send has been observed by its
   receiver (Julien #2).
 - Wired the tests into upstream GitLab CI: new build job
   alpine-3.18-gcc-debug-arm64-boot-selftest, new test job
   qemu-smoke-boot-selftest-arm64-gcc-debug, and the runner
   script automation/scripts/qemu-boot-selftest-arm64.sh that
   dumps the QEMU virt DTB, injects
   "gic-test=1 console=dtuart sync_console" into
   /chosen/xen,xen-bootargs via fdtput, boots Xen, and checks
   for each "Sending GIC_SGI_TEST ..." followed by the matching
   "CPU%u: GIC_SGI_TEST received".

 automation/gitlab-ci/build.yaml               |  8 ++
 automation/gitlab-ci/test.yaml                |  8 ++
 .../scripts/qemu-boot-selftest-arm64.sh       | 81 +++++++++++++++++++
 xen/arch/arm/Kconfig                          | 15 ++++
 xen/arch/arm/Makefile                         |  1 +
 xen/arch/arm/gic-test.c                       | 52 ++++++++++++
 xen/arch/arm/gic.c                            |  5 ++
 xen/arch/arm/include/asm/gic.h                |  3 +
 xen/arch/arm/setup.c                          |  2 +
 xen/arch/arm/smpboot.c                        |  2 +
 xen/arch/arm/xen.lds.S                        |  4 +
 xen/common/kernel.c                           | 11 +++
 xen/include/xen/init.h                        |  3 +
 13 files changed, 195 insertions(+)
 create mode 100755 automation/scripts/qemu-boot-selftest-arm64.sh
 create mode 100644 xen/arch/arm/gic-test.c

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 7f5b5938e8..8df45caa86 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -439,6 +439,14 @@ alpine-3.18-gcc-debug-arm64:
       CONFIG_UBSAN=y
       CONFIG_UBSAN_FATAL=y
 
+alpine-3.18-gcc-debug-arm64-boot-selftest:
+  extends: .gcc-arm64-build-debug
+  <<: *build-test
+  variables:
+    CONTAINER: alpine:3.18-arm64v8
+    EXTRA_XEN_CONFIG: |
+      CONFIG_BOOT_SELFTEST=y
+
 alpine-3.18-gcc-arm64-randconfig:
   extends: .gcc-arm64-build
   variables:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 8770c523e2..2398c6299a 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -524,6 +524,14 @@ qemu-smoke-dom0less-arm64-gcc-debug-gicv3:
     - *arm64-test-needs
     - alpine-3.18-gcc-debug-arm64
 
+qemu-smoke-boot-selftest-arm64-gcc-debug:
+  extends: .qemu-arm64
+  script:
+    - ./automation/scripts/qemu-boot-selftest-arm64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm64-test-needs
+    - alpine-3.18-gcc-debug-arm64-boot-selftest
+
 qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
   extends: .qemu-arm64
   script:
diff --git a/automation/scripts/qemu-boot-selftest-arm64.sh b/automation/scripts/qemu-boot-selftest-arm64.sh
new file mode 100755
index 0000000000..a37dba3e07
--- /dev/null
+++ b/automation/scripts/qemu-boot-selftest-arm64.sh
@@ -0,0 +1,81 @@
+#!/bin/bash
+
+set -ex -o pipefail
+
+# Boot the prebuilt Xen binary under QEMU with CONFIG_BOOT_SELFTEST=y enabled
+# and gic-test=1 in xen,xen-bootargs, then verify the four GICv3 SGI self-tests
+# pass by inspecting the serial log.
+
+XEN=binaries/xen
+QEMU=./binaries/qemu-system-aarch64
+DTB_RAW=binaries/virt.dtb
+DTB=binaries/virt-bootselftest.dtb
+LOG=smoke.serial
+
+test -x ${QEMU}
+test -f ${XEN}
+
+# Dump the auto-generated DT from the QEMU virt machine, then inject
+# /chosen/xen,xen-bootargs.  The selftest infrastructure invokes
+# do_init_boottests() during early boot; gic-test=1 selects the GICv3 SGI
+# tests.
+# -net none avoids QEMU's default virtio-net-pci, whose efi-virtio.rom
+# is not shipped with the qemu-system-aarch64 artifact used in CI.
+${QEMU} \
+    -machine virt,virtualization=true,gic-version=3,dumpdtb=${DTB_RAW} \
+    -cpu cortex-a57 -m 1024 -smp 2 -display none -net none
+
+cp ${DTB_RAW} ${DTB}
+fdtput -t s ${DTB} /chosen xen,xen-bootargs \
+    "gic-test=1 console=dtuart sync_console"
+
+rm -f ${LOG}
+timeout 60 ${QEMU} \
+    -machine virt,virtualization=true,gic-version=3 \
+    -cpu cortex-a57 -m 1024 -smp 2 \
+    -serial file:${LOG} \
+    -monitor none -display none -no-reboot -net none \
+    -dtb ${DTB} \
+    -kernel ${XEN} || true
+
+# Each "Sending GIC_SGI_TEST ..." line must be followed by the matching
+# "CPU%u: GIC_SGI_TEST received".
+fail=0
+check_pair() {
+    local send_pat=$1
+    local recv_pat=$2
+    local send_line recv_line
+
+    send_line=$(grep -n -- "${send_pat}" ${LOG} | head -n1 | cut -d: -f1)
+    if [ -z "${send_line}" ]; then
+        echo "MISSING: ${send_pat}"
+        fail=1
+        return
+    fi
+
+    recv_line=$(grep -n -- "${recv_pat}" ${LOG} \
+        | awk -v bl="${send_line}" -F: '$1 > bl {print $1; exit}')
+    if [ -z "${recv_line}" ]; then
+        echo "MISSING (after line ${send_line}): ${recv_pat}"
+        fail=1
+        return
+    fi
+
+    echo "OK: '${send_pat}' -> '${recv_pat}' (lines ${send_line} -> ${recv_line})"
+}
+
+# Boot CPU sends SGI to itself
+check_pair "Sending GIC_SGI_TEST to self CPU0" "CPU0: GIC_SGI_TEST received"
+# Secondary CPU sends SGI to itself
+check_pair "Sending GIC_SGI_TEST to self CPU1" "CPU1: GIC_SGI_TEST received"
+# Secondary CPU sends SGI to primary
+check_pair "Sending GIC_SGI_TEST to CPU0 from CPU1" "CPU0: GIC_SGI_TEST received"
+# Send to all-but-self
+check_pair "Sending GIC_SGI_TEST to all except CPU1" "CPU0: GIC_SGI_TEST received"
+
+if [ ${fail} -ne 0 ]; then
+    echo "FAILED"
+    exit 1
+fi
+
+echo "PASSED"
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 79622b46a1..0e23bbf20b 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -476,6 +476,21 @@ config ARM64_HARDEN_BRANCH_PREDICTOR
 config ARM32_HARDEN_BRANCH_PREDICTOR
     def_bool y if ARM_32 && HARDEN_BRANCH_PREDICTOR
 
+config BOOT_SELFTEST
+    bool "Enable boot-time self-tests"
+    default n
+    help
+      This option enables boot-time self-tests that validate Xen's internal
+      interfaces with hardware, firmware and the bootloader. The tests are
+      registered with __initcallboottest and executed by do_init_boottests()
+      during early boot, before domains are created.
+
+      These tests are intended for validation and coverage measurement, not
+      for production builds. With this option enabled, Xen may not be
+      functional after the tests have run.
+
+      If unsure, say N.
+
 source "arch/arm/platforms/Kconfig"
 
 source "common/Kconfig"
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 84c4062b30..0090761682 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -24,6 +24,7 @@ obj-y += domctl.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += efi/
 obj-y += gic.o
+obj-$(CONFIG_BOOT_SELFTEST) += gic-test.init.o
 obj-$(CONFIG_GICV2) += gic-v2.o
 obj-$(CONFIG_GICV3) += gic-v3.o
 obj-$(CONFIG_HAS_ITS) += gic-v3-its.o
diff --git a/xen/arch/arm/gic-test.c b/xen/arch/arm/gic-test.c
new file mode 100644
index 0000000000..ca922e5d2a
--- /dev/null
+++ b/xen/arch/arm/gic-test.c
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/delay.h>
+#include <xen/init.h>
+#include <xen/param.h>
+#include <xen/shutdown.h>
+#include <asm/gic.h>
+
+/*
+ * gic_test: Specifies the gic test to be executed.
+ * 0 = no tests are executed
+ * 1 = SGI tests are executed
+ */
+static unsigned int __initdata gic_test = 0;
+integer_param("gic-test", gic_test);
+
+/*
+ * CPU0: GIC_SGI_DUMP_STATE to self
+ * CPU{0-N}: GIC_SGI_TEST to self
+ * CPU{1-N}: GIC_SGI_TEST to CPU0
+ * CPU{N}: GIC_SGI_TEST to all but self
+ */
+static int __init gic_self_sgi_test(void)
+{
+    if ( !gic_test )
+        return 0;
+
+    printk("Sending GIC_SGI_TEST to self CPU%u\n", smp_processor_id());
+    send_SGI_self(GIC_SGI_TEST);
+
+    if ( smp_processor_id() == 0 )
+    {
+        printk("Sending GIC_SGI_DUMP_STATE to CPU0\n");
+        smp_send_state_dump(0);
+
+        return 0;
+    }
+
+    printk("Sending GIC_SGI_TEST to CPU0 from CPU%u\n", smp_processor_id());
+    send_SGI_one(0, GIC_SGI_TEST);
+
+    /* Execute this test only from the last core */
+    if ( smp_processor_id() == (smp_get_max_cpus() - 1) )
+    {
+        printk("Sending GIC_SGI_TEST to all except CPU%u\n", smp_processor_id());
+        send_SGI_allbutself(GIC_SGI_TEST);
+    }
+
+    return 0;
+
+}
+__initcallboottest(gic_self_sgi_test);
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index ee75258fc3..9736b0c7df 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -324,6 +324,11 @@ static void do_static_sgi(struct cpu_user_regs *regs, enum gic_sgi sgi)
     case GIC_SGI_CALL_FUNCTION:
         smp_call_function_interrupt();
         break;
+#ifdef CONFIG_BOOT_SELFTEST
+    case GIC_SGI_TEST:
+        printk("CPU%u: GIC_SGI_TEST received\n", smp_processor_id());
+        break;
+#endif
     default:
         panic("Unhandled SGI %d on CPU%d\n", sgi, smp_processor_id());
         break;
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index ff22dea40d..74bdd4ff63 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -306,6 +306,9 @@ enum gic_sgi {
     GIC_SGI_EVENT_CHECK,
     GIC_SGI_DUMP_STATE,
     GIC_SGI_CALL_FUNCTION,
+#ifdef CONFIG_BOOT_SELFTEST
+    GIC_SGI_TEST,
+#endif
     GIC_SGI_STATIC_MAX,
 };
 
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 6310a47d68..4e5db93027 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -470,6 +470,8 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
     enable_errata_workarounds();
     enable_cpu_features();
 
+    do_init_boottests();
+
     /* Create initial domain 0. */
     if ( !is_dom0less_mode() )
         create_dom0();
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 7f3cfa812e..a016ff00f5 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -405,6 +405,8 @@ void asmlinkage noreturn start_secondary(void)
 
     printk(XENLOG_DEBUG "CPU %u booted.\n", smp_processor_id());
 
+    do_init_boottests();
+
     startup_cpu_idle_loop();
 }
 
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 2d5f1c516d..14f64a856c 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -146,6 +146,10 @@ SECTIONS
        *(.initcall1.init)
        __initcall_end = .;
 
+       __initcall_boot_test_start = .;
+       *(.initcallboottest.init)
+       __initcall_boot_test_end = .;
+
        . = ALIGN(4);
        __alt_instructions = .;
        *(.altinstructions)
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index fb45f81399..2047fe2a3f 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -412,6 +412,7 @@ void add_taint(unsigned int taint)
 
 extern const initcall_t __initcall_start[], __presmp_initcall_end[],
     __initcall_end[];
+extern const initcall_t __initcall_boot_test_start[], __initcall_boot_test_end[];
 
 void __init do_presmp_initcalls(void)
 {
@@ -427,6 +428,16 @@ void __init do_initcalls(void)
         (*call)();
 }
 
+void __init do_init_boottests(void)
+{
+#ifdef CONFIG_BOOT_SELFTEST
+    const initcall_t *call;
+    for ( call = __initcall_boot_test_start; call < __initcall_boot_test_end;
+          call++ )
+        (*call)();
+#endif
+}
+
 #ifdef CONFIG_HYPFS
 static unsigned int __read_mostly major_version;
 static unsigned int __read_mostly minor_version;
diff --git a/xen/include/xen/init.h b/xen/include/xen/init.h
index 0c921672c1..bd518bcea9 100644
--- a/xen/include/xen/init.h
+++ b/xen/include/xen/init.h
@@ -66,11 +66,14 @@ typedef void (*exitcall_t)(void);
     static const initcall_t __initcall_##fn __init_call("presmp") = (fn)
 #define __initcall(fn) \
     static const initcall_t __initcall_##fn __init_call("1") = (fn)
+#define __initcallboottest(fn) \
+    static const initcall_t __initcall_##fn __init_call("boottest") = (fn)
 #define __exitcall(fn) \
     static exitcall_t __exitcall_##fn __exit_call = fn
 
 void do_presmp_initcalls(void);
 void do_initcalls(void);
+void do_init_boottests(void);
 
 #endif /* __ASSEMBLER__ */
 
-- 
2.25.1


