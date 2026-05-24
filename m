Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ybKMLT5AEmpExAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A950E5C0E88
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318175.1586524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIV-0001cy-FV; Sun, 24 May 2026 00:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318175.1586524; Sun, 24 May 2026 00:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIV-0001Zr-9N; Sun, 24 May 2026 00:02:27 +0000
Received: by outflank-mailman (input) for mailman id 1318175;
 Sun, 24 May 2026 00:02:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wQwIS-0001Zl-8T
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 00:02:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQwIR-005yAt-L3
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 02:02:23 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a123fee-2eae-0a2a0a5409dd-0a2a4508d87c-24
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:22 +0200
Received: from [52.101.229.130]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a12400c-63b5-0a2a45080019-3465e58276d0-3
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:22 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB4275.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sun, 24 May
 2026 00:02:18 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 00:02:16 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GfsP7e4GQ+j7aXejBo4LspgnBnL3lF9D4eaA4IJZc0/TFNY+9VjZCpcPJcjne8n5UJIiJeAGGSWMvtvsiCIsM4fbAJkcq2vNXhbkdoJqgwBDmYdWSirtzTk/7yf24pN0ZlJgufl9N/z+BnwguqFlU/yRq6NuIF+3wR2Vy7GrzHS2MTRi2jIbe8LheKWdAdz21CbWA/2XhWHSpzCNErcsaqC04D2JJRJT3Wqpd2MP1jtD3ztRkufo5qJP4NJWEKN98EIKwq0qgd8BPKtlLiOWE6fbypYZXDMMYSy6Ecxnd084QIhpq9Ijzn8JxKCSYcIeF/2oGcI+RLd/Ln5cDw/0sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMx/z4cJBICeXl4yN63GuRWscjM+ZyI0l1AM2oZE+/U=;
 b=TMjlLscOp0lJIg+zm68qUa3ao5VEFL3IpHdJyraQEBOw50Pm8Xii29cxPLtFRRjAHhLu/SxxL8DyaBIM43MLdx0SXbFMnTumiGJmM1Yhkpvuf8jqAvhcRHblk+e3kFOSn/hOAze2vnqEr6OHWQZwIL/yvybahAUwip2kCsdt6P2MIZ7GFazUtsVpfdq7c658SVTnZzlDxMFqtbwjMMnHyVktdHjiHu9EdIRWrlG5R8fNlSPrZRFyrkjH1P1ALaK9CH+aJetrhyp4qBdsnyaFtGnxZeDn8g/WJfmu4g+Q/cqDVF4FPFNkxIrl/Pjk7fvbzqen0SEDwp0W0mkE1Hq6+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMx/z4cJBICeXl4yN63GuRWscjM+ZyI0l1AM2oZE+/U=;
 b=hy6XUXPOt/6CLZY07rgp7RwjCgnu5STuDyLk/q+aSkzGYa5KP5bz6ZwC37UNoKyKQCx5qek6JwQaxYBzXLi+g9jaLz6R1fDyvX2v6tWCWg1RS+OjJmp1Wt8p/ivPAmGhcA8jcFtUUXEIVT8muacqClLjbd51dNBGHYMK3FwIGQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	dfaggioli@suse.com,
	gwd@xenproject.org,
	Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH 00/21] Introduce Device Tree based NUMA support for ARM Xen
Date: Sun, 24 May 2026 09:01:48 +0900
Message-ID: <20260524000209.292370-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0186.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::9) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 0144aab5-663f-470b-c161-08deb927b74a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|18002099003|56012099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	QQg1lAU8/q7UXF/IOQQb50++dHnZQnr6mVf52F9+aPEVc38CLipioEmssWTH4FOo9cwuPjH4kahS5HykJGBx6stD/qTu/S/pDhd5pKT/hpSHccXPtSx0TQBvpX93UYccW/zqJ8eJOB5EboJSyLwzL6xS3zhDK16ZKHEcvpze3+vxvkYK6n7q8h6DylIRf7fS7xYQPhtaFurfLeEH9J1pf7FR3LjPAZwfuKdNvQoLbf3iFGhjhtyO5dTMAPKHzjSgFHPBRE24VNj8JjDMX4E3naVxa+ePkNlNRmimB5eS0wkhM/EhyoVLRL9+B4yUTCNsuJRYURD6VBu4w/ejsY9Ayw3AqvwdhL3J+bak4pCzG7Gjr6mNcadc2ATrblPdTJXZr8Y8riTHAGKgwSM/hGtlzJTrfRuXYaJGtlIJAAapP9MOOgubeZpCcVJyRaP/37MMCIHRxi7ELOm2wIbKjIYg4t9OTbsjzwXDufjo3mQYPZ2Fvk9jBCv6u1tkn2HBjZyXc8ID+9J4ZoQZ5PV7Hg3qm85c9OD+CTM6XTAD/Ff1Zpf4SP5aR/WpQjKdl3tLAieWCsbDag7+nfFWvHC/FT7A/pPKo14A8zbt8AbRiPcrhQnKj3WpxKLcvMujSPWFyv4f1t6tzQUObZhco2jwB9r+1+8WJoVWUv1J/ghdLhBI8epJOuyNE0p9RKV0fBYu1GYG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(18002099003)(56012099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1QaCXQR5poPFxKvOumBVhgOxZZh4ynOnmoYfUaiP2DyZbng0ZqXysrHZ1Jal?=
 =?us-ascii?Q?F8qDzszst3l4eWaokc1Em/itFV1FaAFare6Mt8iVMyehtfJiJn3tLDG3BiEV?=
 =?us-ascii?Q?ZvY8zCZB3ecddDzAtUi/OANOoVjOhdl2qWtJ9TR6YMW5FbsUFn3r9Ey7gUMz?=
 =?us-ascii?Q?VfANrI8mhZjfeEX0UUFx9LRQO7RZzfL+A3FJ4s5HyCriHV1R2UyGF14T0Xvm?=
 =?us-ascii?Q?txNs3ZtRFJJrTr16v23wlxbkQauCRllxUUg52LNkEgqJ1c6dhH1hmA2fKXeZ?=
 =?us-ascii?Q?nJ5tNZnrA1OQX/Djn+1K58dba6sAD5okNJ+FPSFWi63UzAFGOKxtmDdEu35Q?=
 =?us-ascii?Q?php15Vfp/j95RRjkboRZ0nv0VmQ/4lYGJB8n9YkrWkD3Nfeicqe8C85p/Oee?=
 =?us-ascii?Q?s7dVON6G2bDpp6ZRbMSx2YbphmuzqzINkbQvMu/6djoZEPWB8uhPCndFzo5s?=
 =?us-ascii?Q?LIQXQ+974jIqjkwv+Ezd0Lfl5Lj19LOdVQhg2a9pP90FLAQm7gcXZyRvNNvP?=
 =?us-ascii?Q?+WXLTnR2pdVOmEAdA1vevSfketout5KevFXG5tCSf607fDVcdl2mu30Qp5Or?=
 =?us-ascii?Q?Ky6Zd7YM/hy0Mx73ykDhHs2b9EbB9EQ4uKGtTVmM6JlbQQFlvgXsRbSfFky2?=
 =?us-ascii?Q?pGrjL463GcXAdzhwJiA5r27LplR/VhcqkQA1zRgQFSPeONidX+K8aoTk4/IN?=
 =?us-ascii?Q?0zsjklETinsWTGuwy/vR4L4412TP5SyGeNjdtXSfEaYG9ju3rfhHIyhxnT6L?=
 =?us-ascii?Q?iRhq/S63ZNLo8U940yJYD1s+phDm5GQvtO2cLusrYTbCm15xvzwKZj/CrtcX?=
 =?us-ascii?Q?sLW12U1wgK6Id9RTl2Tj+Ci0cjxzS+IUw8fOJSIVcEYabG8byMS5K8Ki65ax?=
 =?us-ascii?Q?z+ROTF0qKMUhKINV19llQrQkvZmw3Ws2ugbgVu4INKUdmTBXZ0hz4RfQSfBN?=
 =?us-ascii?Q?oZ56rwUIZxIw8AodA89W0jSc+67e1cFKEVkI+WmbSgx5DiSACkYR5tNxnC15?=
 =?us-ascii?Q?at5NVHrXscGCVIcPotWW8x5l/kbN+ciLmXsYpkNg794RsSEJXV6ywbeW1i9o?=
 =?us-ascii?Q?c0UwJVf2CAGTRmy0ck4ocTWRv3H0TGPoQxCwTL844GjkWgys8UIORkv5v4yI?=
 =?us-ascii?Q?BzV/Nqx2Bu2j2ppvlcYanngKdiPtgXt2FvGU3AboKr0fhBif6Yg9KoCRx+cC?=
 =?us-ascii?Q?59pUgRlPXBRqozzrRxl7S+2ZtRxYwb3wE29ay7e1AamUvnOOgSbmZFcoAThp?=
 =?us-ascii?Q?k+qRfkAKDzFZPkv/fpPGMwzIxUxUJJd9AjBW1g5lkdu0SQevvxJ/Wfjfsk1v?=
 =?us-ascii?Q?HuWVMJNF/dqLiXLWOa8Ct8rXYbKAav4yOUkEfc3f2LZv+dyT57owpIumIPVP?=
 =?us-ascii?Q?EY0K3VsDcUu4oeMdZ/jLxQ+bF33IdKXfloAUz6F7A3cgD3Jyq/N8TMweNQfd?=
 =?us-ascii?Q?een4dNL0NxpyAKEzuJCsSleuUftIBubjTz7Ro9rVPddrczitSqCAbTc+WgjD?=
 =?us-ascii?Q?GhhHckWftArPPKhtlF9/5+CN4fcwRux/rXrBYCd19ocRkKr58mrYKxjmnGkD?=
 =?us-ascii?Q?K7B50zAPCBiqhDSxHjVRYzAqg+4L2j2dkcb/Wlz9jHBrfUMKPFcs7we1HnEq?=
 =?us-ascii?Q?ucZpFXBslIGf8sEkWCf9RSVKe0GFPCUv2DmG0FatFKC0uYAzdbFoPjFzgf/I?=
 =?us-ascii?Q?BCzJDI+guswF9Wf71GrDicD3fnNaZD1Ca8N2NSczIp2SxiWPAn0VpI5ipot+?=
 =?us-ascii?Q?GOhH7qumJosdx7cQvu4k+iWTPd+mnF3WenYyqtFXGgUoXWJ9IZUDy4LKfB7k?=
X-MS-Exchange-AntiSpam-MessageData-1: Bg5r+jLZmVLH1A==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 0144aab5-663f-470b-c161-08deb927b74a
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 00:02:16.5191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EOb5zW/KsVNqFE8iSFJ6C8QgTwvHG5ONKykyJclldvalSoWyb5hUguLH380JUReQb/5bEYYeo4SzUG3aYMhGRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4275
X-purgate-ID: tlsNG-c1860d/1779580942-B7D7BDB1-36844D53/0/0
X-purgate-type: clean
X-purgate-size: 3839
X-Spamd-Result: default: False [1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:taka@valinux.co.jp,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A950E5C0E88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

A few years ago, there was an attempt to bring NUMA support to Xen on
ARM, but it got stalled. This patch series revives that work to get
proper NUMA support up and running on ARM.

Note that this series only covers Device Tree environments for now.
ACPI support is skipped and left for the future.

Also, I've put the NUMA DT helper functions into the common code,
so that other DT-based architectures like RISC-V or PPC can easily
reuse them later.

The series is structured as follows:
- Patches 01-09: Basic Device Tree parsing and NUMA initialization
                 for ARM.
- Patches 10-12: Toolstack enhancements to generate vNUMA device
                 tree nodes for guests.
- Patches 13-20: Dom0 memory and vCPU allocation adjustments based
                 on node affinity.
- Patch 21:      Update documentation for the 'numa' and 'dom0_nodes'
                 command-line options.

Thanks,
Hirokazu Takahashi

Hirokazu Takahashi (21):
  xen/device-tree: Initial framework for Device Tree NUMA support
  xen/arm: NUMA helper functions via Device Tree helpers
  xen/arm: Introduce CONFIG_DEVICE_TREE_NUMA config option
  xen/arm: Configure NUMA affinity for populated memory banks
  xen/arm: Map populated CPUs to their respective NUMA nodes
  xen/device-tree: Read NUMA node distance from Device Tree
    'distance-map'
  xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
  xen/sched: Link CPU topology to scheduler and display via xl info
  xen/common: Allow building ARM32 Xen with CONFIG_NUMA
  tools/libxl: Add 'numa-node-id' property to DomU memory nodes
  tools/libxl: Add 'numa-node-id' property to DomU CPU nodes
  tools/libxl: Create 'distance-map' node in DomU Device Tree
  xen/arm: Introduce dom0_nodes boot command option
  xen/arm: Set Domain-0 node affinity from dom0_nodes option
  xen/arm: Reflect physical NUMA node IDs in Dom0 memory DT nodes
  xen/arm: Balance Dom0 vCPU assignment across NUMA nodes
  xen/arm: Export Dom0 vCPU-to-NUMA node mapping to Device Tree
  xen/arm: Generate distance-map node for Dom0 Device Tree
  xen/arm: Balance Dom0 memory allocation across allowed NUMA nodes
  xen/arm: Use dedicated function for Static SHM Device Tree creation
  xen/arm: Support numa and numa_nodes boot options

 docs/misc/xen-command-line.pandoc     |   9 +-
 tools/libs/light/libxl_arm.c          | 134 +++++++-
 xen/arch/arm/Makefile                 |   1 +
 xen/arch/arm/domain_build.c           | 428 +++++++++++++++++++-------
 xen/arch/arm/include/asm/numa.h       |  19 ++
 xen/arch/arm/include/asm/processor.h  |   6 +-
 xen/arch/arm/numa.c                   |  62 ++++
 xen/arch/arm/setup.c                  |   4 +
 xen/arch/arm/smpboot.c                |  35 ++-
 xen/common/Kconfig                    |  16 +
 xen/common/device-tree/Makefile       |   2 +
 xen/common/device-tree/bootinfo-fdt.c |   8 +
 xen/common/device-tree/cpu_topology.c | 361 ++++++++++++++++++++++
 xen/common/device-tree/domain-build.c |  99 +++---
 xen/common/device-tree/numa.c         | 142 +++++++++
 xen/common/numa.c                     |   2 +-
 xen/common/sched/credit2.c            |   3 +
 xen/common/sysctl.c                   |   1 +
 xen/include/xen/bootinfo.h            |  37 +++
 xen/include/xen/cpu_topology.h        |  45 +++
 xen/include/xen/dt-numa.h             |  31 ++
 xen/include/xen/fdt-domain-build.h    |   2 +
 22 files changed, 1274 insertions(+), 173 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/numa.h
 create mode 100644 xen/arch/arm/numa.c
 create mode 100644 xen/common/device-tree/cpu_topology.c
 create mode 100644 xen/common/device-tree/numa.c
 create mode 100644 xen/include/xen/cpu_topology.h
 create mode 100644 xen/include/xen/dt-numa.h

-- 
2.43.0


