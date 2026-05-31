Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UD2TB9u6HGqRRwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D86B6182F2
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323458.1589191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxA-0005WI-SY; Sun, 31 May 2026 22:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323458.1589191; Sun, 31 May 2026 22:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxA-0005TX-Nx; Sun, 31 May 2026 22:48:20 +0000
Received: by outflank-mailman (input) for mailman id 1323458;
 Sun, 31 May 2026 22:48:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wTox8-00059X-4Q
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTox7-00261G-HE
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:17 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba69-2eae-0a2a0a5409dd-0a2a45099642-32
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:17 +0200
Received: from [40.107.74.96]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbaaa-2497-0a2a45090019-286b4a60e9a3-7
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:17 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYWP286MB2972.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2fe::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sun, 31 May
 2026 22:48:13 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:13 +0000
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
 b=Od+V9dmP565wnVYERljt2oJQdklz9OYZg92vI+8vrSNdciRXaicb6XBQ16VJQjQbRVOU+kRlN6bl7dqDEOGwRMZdv4mWgLjHq4Mg2mNvEt9mLX6p+BYqobyhQWr9bhcWVOvtUI4D4ChgOQupEAc5F9t/7o1Er4a9rg9zBhHD6kvXBHRpQ8LZM/GjRas7LZVQvKNga3TQuftEfJXqWUu95aj3Z+uOSHfVx41k8VmcYw/F63NDbE8k71BgHC0purSTkfoiTJN3VnayaGIe81JdoveWVY0M03Cmu5/ADPduOsJ91ZX9suM/YAA1ob75kFavuQaeO8U8Ix8tzHcBXUwv0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09ikRB9p2K6n1IXPIFviZ3O5z7V9MxCaGsEM2APynDM=;
 b=DRR5+wra/23dHP4cMmtC+pj1zrg0liXjoz1tvA3XPmKHVZ2kb3x7j3/8f9WCVInDsY7SJ2KjqvWK+777GV7sz3MGtXesl2a/bJfd08cGHUGl+AqRXLFWhNgk3a0AA/q8qI+nrvkvO7+DjOdczQiQ1dOSP+5rH5rj3y2QaEn/v/aNEbIpjmhjv0lEhUsYuasAx7RFdAnkJx90lSD6GWNad5VKP/X2ithAH35WXGGWJurHk/D3nfNFhdFd9pZobFxnu/MpaVRtFt5BLeP1rY2fDESnL3tSSse83CJ6CM/D/7F8FhWEKP8Hzl5zF+qbpxTV0AjVzfjk292EcQNprfbSNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09ikRB9p2K6n1IXPIFviZ3O5z7V9MxCaGsEM2APynDM=;
 b=r5T84K1YW8aj+HqmUr66H7bKEudgDIelq8grofprLWHrVzFYUGuee+nGMItzpfhn8Hsz2lWoNK84up5eYjJUOYwuWvK+MuGPQKcX5HFx3znnSnISaZtoFgw9OduSRVT1yKyfzC3its8wgFHk9wllLEV6srP3F+X/LVv2rHw3jGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 07/24] xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
Date: Mon,  1 Jun 2026 07:47:37 +0900
Message-ID: <20260531224755.9481-8-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::13) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYWP286MB2972:EE_
X-MS-Office365-Filtering-Correlation-Id: 0beea134-44a3-46d6-b48b-08debf66b257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	RA+mYr1790mNnsV72laVkOZ4rNPvbmcQIIxI/GHNqfERuPT6pspYqACd1OkOBIqN5cfU1QnNwn3ilJnYqyc2g/K9pN89cOjpuSmDrxZK26hcLKxKN94e8JW7n7I5xfy9cDM5AsWqhqsEbPQsOlyoUba4iBMMW1ltVZFr+paS6bYOjP74Hh+QiSrGvYlIwIkjrvWr0uDcJveswgVraj196vIE8yHhcPX9Go/M5cHfsfmT7muTw2Wn0z+yT5M+sh7kFOaNaiYKudMpB1Ni9R54MTcr/TfH2vaTKmXNJHTniHvUf/FkYb56eUVVACmVwdaEYTx+qivK+Z2wkz+ZNuXZ59TA8rDJNzvNdZO7Xlp2m6sC2Hqvuf8xU5WHyb88jRHqU4XCixNm59wJQgJFvnbHjtibjqDCv9QH/ibbqouHK6cVBhZEXSMB3HwWS2mXGA+lTFOxoFL/jEQZmYcgfRGno1falLksR3m02ScBOe/jtW9Zyg/NdBxIv3498LjBLNCschMW0ZAtnYo+8eGzLr6dh62xkdKHJdkh8YaHsyks6cPfSyw/0/kGCBXf66EqXJ3rKEhZ/sUxgCMFktZHcOM9Wq/3EkCbT8p8IYwKK9A8ebUmLzlqYAmmscnv8Lr5s3Uo7C6s1mcGw55HnUqx5bkGPr6PEnrRKO6R9CFXeDwq7l0fTAa5uw4ynIyUBZmJQS84
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CGnrTKkN2CyW/JrNmm53ZkVEw9mHwkDNBw05XuVDN/WNjJ6b+5DJKvT7DH2i?=
 =?us-ascii?Q?POGVq9yFelU+QTLF0nIzbkDPxkf39HxzL6CklkVv3szlZxejfDmz40MF1BfK?=
 =?us-ascii?Q?ZMcmGYK67s3H70MsxaM7BzDPNVTvIVho/S5po/9VBWdtzTDsn616+LALSrLH?=
 =?us-ascii?Q?IC4lZQ5d3CJ76lIkFAhQU8aNqNtSnCalV5ivN6RwCBLp+Jgdhg+RJgDNElGi?=
 =?us-ascii?Q?j5UyNLISTNeq00A+BBTysczq/cCk26hSX70yTJ5XGWsJu8Vl4NUdSHqFTVg4?=
 =?us-ascii?Q?mpmHkRpPQXSE5jsk7s0ibghncpKfXm2cC9z5ZSEkctYOqBM45F3flqH6Jl+D?=
 =?us-ascii?Q?KfpU+2V/sxCWKvy8Sb8iIdBJDxyo0aAieM4o7TuuKPXBe9rCNdljrsU+nn90?=
 =?us-ascii?Q?aijF/EyvrMWKGIJ/HtWT3nYlj09kpz2jlX1qVY71F369Z0alXyIfVZrCt+OX?=
 =?us-ascii?Q?+cDRefKcTT0c6GF79n7JgZy7NeA3gjTtH+hiKyU6sXK00f/QNlB5nnTvjO5n?=
 =?us-ascii?Q?wo3NFwi19JVME3LB3s30dTkSEMdET6Yw4cGdHppiZk1IpMNCMr9Rdupw1d1d?=
 =?us-ascii?Q?cy11z7YD/N7zh8OXldxV+PxQPSXmKDd985XAI4mzFNIjoZMcAn5uAl3qPAlO?=
 =?us-ascii?Q?vsufoLKIufmyeZTd2/dlAZHqMCFrrnQGouZh27ry9oTekOggiXqBaFOov3dL?=
 =?us-ascii?Q?+TMVkMOrjdv7hW847Lbgw044lP+Cy6WSp4NyvA+ZCgVLlmpemWs5xGHchin4?=
 =?us-ascii?Q?hrq3wiXmxcnzgKfp3RcFAJ6ju0V7wn0olfd/mbeSPP8AkscAJeN2nRkIKC+x?=
 =?us-ascii?Q?AFHBC6Ovgc6ASNgIqRvRMQPmh7ekc4XcH0UNW39U+FlgiYll+4mTWhzMgaCL?=
 =?us-ascii?Q?Tz3Cef0Soh3yeljHM2bkOUozFv84K8v+wsLnJDMVh0IGnCQhlp3wmDbmsXVg?=
 =?us-ascii?Q?Fkm1Db2RQjR6TsBWEHftrxkMvpMAcAea+tidho7Dr5MNJX7eu6STywslchMH?=
 =?us-ascii?Q?ZrVBspU/QChzlQ1r91BvP/sJtVUQPziE6SwyMKwdAPvA9sp3hCkRqBPOSDZh?=
 =?us-ascii?Q?wHk/Ipw+DgU/2ST+gKH2g1TCVi8lpJybD/yfhTd63Sd47KjivGqBZyQ4JpHZ?=
 =?us-ascii?Q?5ec4gzySFMxr/7CIsYLSYunC5YjmTpS4sVWUx3xRCuFjISavgERwSFITfs7H?=
 =?us-ascii?Q?LjnD+YpB9VPehXybW3QmnfCe1l4HOb5rYqKE4cCBfdORMJc3ojaBRv4ENPqc?=
 =?us-ascii?Q?HvJQvhTx6vg1NBPUeqdpU4oeEM97S4GTh6zNPZEsNc9OMDyml3TrQsrOXSJ/?=
 =?us-ascii?Q?eB93Kbxi68/MGwyJnWqTYhBNtxzqjK8xbH3dnZr9dJmkpc57PY+JTY/vhrDo?=
 =?us-ascii?Q?lsoe0zB6PJuHV1af3kW5Ejl2KvTPBd7yzwzRTixPgnqtCEi3U8N3t0zml+Lw?=
 =?us-ascii?Q?uQp7O/8nXURdWJ2u5tWNZ3sRRiobfbAWjgBiWtvqtMze1pNS0fcWdaGlUHC6?=
 =?us-ascii?Q?da/DXsT97WcsAN1QMbAEuHemaNimzYGGdKi0ZUDSGGmPZTQckrVCmj9cMq5i?=
 =?us-ascii?Q?Vl/Ln6EE55RhMj77s1QNZcH3Xa9b24Z6A9w9xxm5YxX1dJTWYNSY8AhBzu28?=
 =?us-ascii?Q?RXexHN2lZ/E9EprLJw+keYsTVvYGmWBv665AlPim2xizBJUk9A3BsQmv/H2e?=
 =?us-ascii?Q?r48Wvlm0/car64SoA95XB3Y3UcM3cMGFJUJ8oDI+Tbu+FfhjUPKRy8Ye0oVZ?=
 =?us-ascii?Q?/S43PfOCXpTwPhPqlY4OltPy8vyVz1oMbtfipbhabT0da+fsTwp5FrQJ6QBu?=
X-MS-Exchange-AntiSpam-MessageData-1: tv7tSO75kUFUug==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 0beea134-44a3-46d6-b48b-08debf66b257
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:13.3377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZmHs8pbVzBvTiVjOW3eG0wi9/r7qSCRDjkNoRFIU7fqtqVAU7IXzKFZ/AtqfONc17Efaw0jiPrW7oEDk9lX6LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2972
X-purgate-ID: tlsNG-bad1c0/1780267697-37F7EA53-CE9D9EDE/0/0
X-purgate-type: clean
X-purgate-size: 12559
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9D86B6182F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Parse the 'cpu-map' node in the Device Tree to extract CPU topology
information. If the 'cpu-map' node is absent, fall back to
generating the topology data from the NUMA information. This
generation assumes exactly one socket per NUMA node and that SMT
is unsupported.
---
 xen/arch/arm/Kconfig                  |   1 +
 xen/arch/arm/smpboot.c                |   6 +
 xen/common/Kconfig                    |   3 +
 xen/common/device-tree/Makefile       |   1 +
 xen/common/device-tree/cpu-topology.c | 306 ++++++++++++++++++++++++++
 xen/include/xen/cpu-topology.h        |  42 ++++
 6 files changed, 359 insertions(+)
 create mode 100644 xen/common/device-tree/cpu-topology.c
 create mode 100644 xen/include/xen/cpu-topology.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index e67219e949..c673ca345f 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -102,6 +102,7 @@ endchoice
 config ARM_NUMA
 	bool "Device tree based NUMA support (UNSUPPORTED)" if UNSUPPORTED
     select DEVICE_TREE_NUMA
+    select DT_CPU_TOPOLOGY
 	help
 	  Device tree based NUMA support. The "numa-node-id" property in
 	  the CPU and memory nodes of a Device Tree defines the NUMA node
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index eafa195504..6bcf7e7f53 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -24,6 +24,7 @@
 #include <xen/warning.h>
 #include <xen/irq.h>
 #include <xen/console.h>
+#include <xen/cpu-topology.h>
 #include <asm/cpuerrata.h>
 #include <asm/gic.h>
 #include <asm/procinfo.h>
@@ -248,6 +249,8 @@ static void __init dt_smp_init_cpus(void)
         else
             tmp_map[i] = hwid;
 
+        map_cpuid_to_node(i, cpu); /* pass the info to dt_init_cpu_topology() */
+
 #ifdef CONFIG_DEVICE_TREE_NUMA
         if ( tmp_map[i] != MPIDR_INVALID )
         {
@@ -294,7 +297,10 @@ void __init smp_init_cpus(void)
     }
 
     if ( acpi_disabled )
+    {
         dt_smp_init_cpus();
+        dt_init_cpu_topology();
+    }
     else
         acpi_smp_init_cpus();
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 89fa7d10c7..a1db4fcf17 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -188,6 +188,9 @@ config VM_EVENT
 config NEEDS_LIBELF
 	bool
 
+config DT_CPU_TOPOLOGY
+	bool
+
 config DEVICE_TREE_NUMA
 	select NUMA
 	bool
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 658aa293c4..bbe60297aa 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,6 +1,7 @@
 obj-y += bootfdt.init.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo-fdt.init.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo.init.o
+obj-$(CONFIG_DT_CPU_TOPOLOGY) += cpu-topology.o
 obj-y += device-tree.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
 obj-$(filter $(CONFIG_DOM0LESS_BOOT),$(CONFIG_HAS_DEVICE_TREE_DISCOVERY)) += dom0less-build.init.o
diff --git a/xen/common/device-tree/cpu-topology.c b/xen/common/device-tree/cpu-topology.c
new file mode 100644
index 0000000000..82a366f3f6
--- /dev/null
+++ b/xen/common/device-tree/cpu-topology.c
@@ -0,0 +1,306 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Derived from Linux kernel 7.0's $drivers/base/arch_topology.c
+ * Parse cpu topology information.
+ *
+ * Copyright (c) 2026 VA Linux Systems Japan K.K.
+ * Author: Hirokazu Takahashi <taka@valinux.co.jp>
+ */
+
+#include <xen/cpu.h>
+#include <xen/cpumask.h>
+#include <xen/delay.h>
+#include <xen/device_tree.h>
+#include <xen/cpu-topology.h>
+#include <xen/numa.h>
+#include <xen/domain_page.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+
+static struct dt_device_node * __initdata dt_cpu_table[NR_CPUS];
+
+struct cpu_topology __ro_after_init cpu_topology[NR_CPUS] = {
+    [0 ... NR_CPUS-1] = {-1, -1, -1, 0}
+};
+
+static void __init setup_siblings_masks(unsigned int cpuid)
+{
+    struct cpu_topology *cpu_topo, *cpuid_topo = &cpu_topology[cpuid];
+    int cpu;
+
+    /* update core and thread sibling masks */
+    for_each_possible_cpu(cpu) {
+        cpu_topo = &cpu_topology[cpu];
+
+        if (cpuid_topo->package_id != cpu_topo->package_id)
+            continue;
+
+        cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
+        cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
+
+        if (cpuid_topo->cluster_id != cpu_topo->cluster_id)
+            continue;
+
+        if (cpuid_topo->cluster_id >= 0) {
+            cpumask_set_cpu(cpu, &cpuid_topo->cluster_sibling);
+            cpumask_set_cpu(cpuid, &cpu_topo->cluster_sibling);
+        }
+
+        if (cpuid_topo->core_id != cpu_topo->core_id)
+            continue;
+
+        cpumask_set_cpu(cpuid, &cpu_topo->thread_sibling);
+        cpumask_set_cpu(cpu, &cpuid_topo->thread_sibling);
+    }
+}
+
+static struct dt_device_node * __init dt_find_child_node_by_name(struct dt_device_node *from, const char *name)
+{
+    struct dt_device_node *np;
+    struct dt_device_node *dt = from;
+
+    dt_for_each_child_node(dt, np)
+        if ( np->name && (dt_node_cmp(np->name, name) == 0) )
+            break;
+
+    return np;
+}
+
+void __init map_cpuid_to_node(u32 cpuid, struct dt_device_node *cpu_node)
+{
+    dt_cpu_table[cpuid] = cpu_node;
+}
+
+static int __init cpu_node_to_id(struct dt_device_node *cpu_node)
+{
+    int cpu;
+    bool found = false;
+
+    for_each_possible_cpu(cpu) {
+        found = (cpu_node == dt_cpu_table[cpu]);
+        if (found)
+            return cpu;
+    }
+
+    return -ENODEV;
+}
+
+/*
+ * This function returns the logic cpu number of the node.
+ */
+static int __init get_cpu_for_node(struct dt_device_node *node)
+{
+    struct dt_device_node *cpu_node = dt_parse_phandle(node, "cpu", 0);
+
+    if (!cpu_node)
+        return -ENOENT;
+
+    return cpu_node_to_id(cpu_node);
+}
+
+static int __init parse_core(struct dt_device_node *core, int package_id,
+                int cluster_id, int core_id)
+{
+    char name[20];
+    bool leaf = true;
+    int i = 0;
+    int cpu;
+
+    do {
+        struct dt_device_node *t;
+
+        snprintf(name, sizeof(name), "thread%d", i);
+        t = dt_find_child_node_by_name(core, name);
+
+        if (!t)
+            break;
+
+        leaf = false;
+        cpu = get_cpu_for_node(t);
+        if (cpu >= 0) {
+            cpu_topology[cpu].package_id = package_id;
+            cpu_topology[cpu].cluster_id = cluster_id;
+            cpu_topology[cpu].core_id = core_id;
+            cpu_topology[cpu].thread_id = i;
+        } else if (cpu != -ENODEV) {
+            printk(XENLOG_ERR "ERROR: %pOF: Can't get CPU for thread\n", t);
+            return -EINVAL;
+        }
+        i++;
+    } while (1);
+
+    cpu = get_cpu_for_node(core);
+    if (cpu >= 0) {
+        if (!leaf) {
+            printk(XENLOG_ERR "ERROR: %pOF: Core has both threads and CPU\n",
+                   core);
+            return -EINVAL;
+        }
+
+        cpu_topology[cpu].package_id = package_id;
+        cpu_topology[cpu].cluster_id = cluster_id;
+        cpu_topology[cpu].core_id = core_id;
+    } else if (leaf && cpu != -ENODEV) {
+        printk(XENLOG_ERR "ERROR: %pOF: Can't get CPU for leaf core\n", core);
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int __init parse_cluster(struct dt_device_node *cluster, int package_id,
+                int cluster_id, int depth)
+{
+    char name[20];
+    bool leaf = true;
+    bool has_cores = false;
+    int core_id = 0;
+    int i, ret;
+
+    /*
+     * First check for child clusters; we currently ignore any
+     * information about the nesting of clusters and present the
+     * scheduler with a flat list of them.
+     */
+    i = 0;
+    do {
+        struct dt_device_node *c;
+
+        snprintf(name, sizeof(name), "cluster%d", i);
+        c = dt_find_child_node_by_name(cluster, name);
+
+        if (!c)
+            break;
+
+        leaf = false;
+        ret = parse_cluster(c, package_id, i, depth + 1);
+        if (depth > 0)
+            printk(XENLOG_WARNING "WARNING: Topology for clusters of clusters not yet supported\n");
+        if (ret != 0)
+            return ret;
+        i++;
+    } while (1);
+
+    /* Now check for cores */
+    i = 0;
+    do {
+        struct dt_device_node *c;
+
+        snprintf(name, sizeof(name), "core%d", i);
+        c = dt_find_child_node_by_name(cluster, name);
+
+        if (!c)
+            break;
+
+        has_cores = true;
+
+        if (depth == 0) {
+            printk(XENLOG_ERR "ERROR: %pOF: cpu-map children should be clusters\n", c);
+            return -EINVAL;
+        }
+
+        if (leaf) {
+            ret = parse_core(c, package_id, cluster_id, core_id++);
+            if (ret != 0)
+                return ret;
+        } else {
+            printk(XENLOG_ERR "ERROR: %pOF: Non-leaf cluster with core %s\n",
+                   cluster, name);
+            return -EINVAL;
+        }
+
+        i++;
+    } while (1);
+
+    if (leaf && !has_cores)
+        printk(XENLOG_WARNING "WARNING: %pOF: empty cluster\n", cluster);
+
+    return 0;
+}
+
+static int __init parse_socket(struct dt_device_node *socket)
+{
+    char name[20];
+    bool has_socket = false;
+    int package_id = 0, ret;
+
+    do {
+        struct dt_device_node *c;
+
+        snprintf(name, sizeof(name), "socket%d", package_id);
+        c = dt_find_child_node_by_name(socket, name);
+
+        if (!c)
+            break;
+
+        has_socket = true;
+        ret = parse_cluster(c, package_id, -1, 0);
+        if (ret != 0)
+            return ret;
+
+        package_id++;
+    } while (1);
+
+    if (!has_socket)
+        ret = parse_cluster(socket, 0, -1, 0);
+
+    return ret;
+}
+
+/*
+ * Generate cpu topology information when cpu-map node doesn't exist.
+ * It assumes that the cpu doesn't have SMT and all CPUs on a NUMA
+ * node belong to the same socket.
+ */
+static void __init fixup_topology(void)
+{
+    int cpu;
+    int clid = 0;
+    int pkgid = 0;
+
+    for_each_possible_cpu(cpu)
+    {
+        struct cpu_topology *cpu_topo = &cpu_topology[cpu];
+
+        cpu_topo->package_id = cpu_to_node(cpu);
+        if (cpu_topo->package_id != pkgid)
+        {
+            pkgid = cpu_topo->package_id;
+            clid = 0;
+        }
+        cpu_topo->cluster_id = clid++;
+        cpu_topo->core_id = 0;
+        cpu_topo->thread_id = 0;
+    }
+}
+
+int __init parse_dt_topology(void)
+{
+    struct dt_device_node *cpus;
+    struct dt_device_node *map;
+
+    cpus = dt_find_node_by_path("/cpus");
+
+    if ( !cpus )
+    {
+        printk(XENLOG_ERR "ERROR: No CPU information found in DT\n");
+        return -EINVAL;
+    }
+
+    map = dt_find_child_node_by_name(cpus, "cpu-map");
+    if ( !map )
+        return -ENOENT;
+
+    return parse_socket(map);
+}
+
+void __init dt_init_cpu_topology(void)
+{
+    int cpu;
+
+    if (parse_dt_topology())
+        fixup_topology();
+
+    for_each_possible_cpu(cpu)
+        setup_siblings_masks(cpu);
+}
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
new file mode 100644
index 0000000000..8445f5786d
--- /dev/null
+++ b/xen/include/xen/cpu-topology.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN_CPU_TOPOLOGY_H
+#define XEN_CPU_TOPOLOGY_H
+
+#include <xen/types.h>
+#include <xen/device_tree.h>
+
+struct cpu_topology {
+    int thread_id;
+    int core_id;
+    int cluster_id;
+    int package_id;
+    cpumask_t thread_sibling;
+    cpumask_t core_sibling;
+    cpumask_t cluster_sibling;
+};
+
+
+#ifdef CONFIG_DT_CPU_TOPOLOGY
+extern struct cpu_topology cpu_topology[NR_CPUS];
+
+void map_cpuid_to_node(u32 cpuid, struct dt_device_node *cpu_node);
+void dt_init_cpu_topology(void);
+
+#elif CONFIG_DEVICE_TREE_PARSE
+
+static inline void map_cpuid_to_node(u32 cpuid, struct dt_device_node *cpu_node) {}
+static inline void dt_init_cpu_topology(void) {}
+
+#endif /* CONFIG_DEVICE_TREE_PARSE */
+
+#endif /* XEN_CPU_TOPOLOGY_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


