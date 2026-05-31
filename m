Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BxvONu6HGp+RwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DC3618308
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323454.1589156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTox4-0004Xv-ID; Sun, 31 May 2026 22:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323454.1589156; Sun, 31 May 2026 22:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTox4-0004VE-FN; Sun, 31 May 2026 22:48:14 +0000
Received: by outflank-mailman (input) for mailman id 1323454;
 Sun, 31 May 2026 22:48:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wTox3-0004Uu-TJ
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTox3-00261G-AD
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:13 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba69-2eae-0a2a0a5409dd-0a2a45099642-24
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:12 +0200
Received: from [40.107.74.96]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbaaa-2497-0a2a45090019-286b4a60e9a3-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:12 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYWP286MB2972.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2fe::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sun, 31 May
 2026 22:48:07 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:07 +0000
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
 b=kaCXhhX0s9QaqCwhpcb7oUWF7lFuuh04ls/ou7jyiX1WfNs/SjNyaH5xTQqhuSPHqTI1JnTNo3Wi2Q4wLSAhGFxgLGlsbjNCrAhzNkQEgvgYrqWSBkDZGfm423IOtYicxeTKQxwH67Ay624vrX6gbbHeVJuBrZzfeNpL//uLI1srIsIPz15dkzWHlVjxZZrm5Dlcn3SH5TvvkUscEkm3lRrgjEwfx5sUpUUoQZbGQ2gJdUlw8e4iuoGr7GsZBWOPOhlhG53by8FMO9aSJKNA93HAAPaW3o3o1c+qO0qO9TRC0rIbXdFdAn3yuo1oCHKio8mbRS/b2WyC8bEc2Ysj+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVIHzGP7xPG+QeB7F8sNCSVrdxqJXbQqFgu/3yZPit0=;
 b=JWow5qs0u1YptLeVYcOpSoeJUt4f1Xj4rE7cnjlofTS5B/y4PYVvGnLZ/hQxFuSSYRFmabRbk96bwvpu4erkvyV1OUrWUfGhU6ezcguJ4o7QE1XYRyX4w9oL/+2gwXfCCRheSGcU1ZriBUufXcHa3VnpvhyOTeCxGNT1HtswBz904NmjWU7D0LUz3a7cBKjOswsJ3v0IsACQS7gzaYHe5rOowW6XbsBoFZHORLDyx6g0nk+DMJMCBSxa5IHnzD8Ks+3qwymc+souAZNn/QB64BaD58uqGJTzWKCur9JrA54tcxlDDIwak6DNf4XWusI3fy/fLugv9/us6RKKTVtpgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVIHzGP7xPG+QeB7F8sNCSVrdxqJXbQqFgu/3yZPit0=;
 b=fRZRkTtTEfWtId4Qgq6MmsseBIzf+s5Hz5s3yddKMCiNR4eCgDks4/HNfnvQZcPzMM7yjSpreXs77Hd7MqxgQ25csb4m1rctoenNXdn82ezknzrP2/VhJXGPUMGMcj2oVHg9qsKIZDBbtECsA5YkAztK2kt3KFGm624F9Ihg20o=
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
Subject: [PATCH v2 04/24] xen/arm: Configure NUMA affinity for populated memory banks
Date: Mon,  1 Jun 2026 07:47:34 +0900
Message-ID: <20260531224755.9481-5-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0065.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::14) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYWP286MB2972:EE_
X-MS-Office365-Filtering-Correlation-Id: eff574b1-6fe0-4d9d-227c-08debf66aedb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	nmF05ctm3WYYwhR4ulAh7a3Z9MiSR3afq87OJqnKhwu+ODeJtsOQDTTj+j7h96UhaIE/if2u+GQya86nB5yEFP4gAYtZXwBNhjDym0/8GUO3WBOVjyg/0VdvAciZHGhmzKwu2jNPMdbGtWA6komG67UQsRfvX8Kj+Tixq8DbfRqr4r5d0JGLveE2EwIqtF86uT9CZGrDwlPmPrpPijhdBlx1beQTchu5EAsj8pPVDdM6gZGiqWxHXgAYBwHGP5JdbZYr9onfQu76Szu1CQsDA80NRU3n3/YQMf82c8Oh29ChuhmdJQhJ5S94xMexqK93jqTlzz3NoqRlZa3Ww4jqXPeC8i1TfGM8jnQSFmJjcvzbtFCQlP+JGCE00fa2mQEa0pmUwxEGdGE/dBRdZytqPVksM0IL2gJqK5rdBGCoJg9ReAQ6DUT8AU6R5lqKcwou8Q4FX8SQu9Bc7vpKj3TOHaIQSlNPh+SiDwZflzJ/QyZ79utOiTpkpKFaRVfpje7Um0wOTRoyoxBpZanIdwS5Be2kIGx5/sFeB2aqlD1B9G5fQDWBNTTVzlFVkBpFtVpMMeecAJq467coL+oBjvAzd2P33LQBpT4PxmfmWd/+GssnvnzOhRRJLneR/CjoRRCL6Y8hUGUyJrUipJjUSB4b6guOU/KJYc8wWtktvqofCM1HaRsD7jkbonJ1c7Wt6qw0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?108GtXEKqCTHLflj7hVMOK503QlBOE9bmZTwJp9TvhfoFDqtfekkF9TVZAh5?=
 =?us-ascii?Q?nvZQByh8+4F8sduNHl/R7zNR1Jgh+QcpUD7Rrvl0nGEtCg53LBbHe0AnCH7l?=
 =?us-ascii?Q?cZksLeleD+MjfEoYWlLMJ1f/Hqp1Um6J1P8oDiRvwWKMaQxfsl9+jL/yCwHd?=
 =?us-ascii?Q?mUowfuIMH5XAKAnIV3rVaff3Mr1M6mnzzZAHeyLaBOxEyngO6LQExSBlxkpp?=
 =?us-ascii?Q?r8a9MU0ekE8mVl2rDnU+giU8VMOuG6hrA5IL9eZXln6NaicIfEL792u/2p1o?=
 =?us-ascii?Q?AOKbUOVMIhekINCApR9Cgu28seSQscJyRdOHsk6iDz4hGMu4n43GuEQEF7cz?=
 =?us-ascii?Q?H9xZ+nKc8IW/V3Sykr3VVLew9sDuy0B+N4ceauMJPj09k0c0M7FAC/t4SyrB?=
 =?us-ascii?Q?8uswg13sCr+qV16Aw6aZ1kOvoVh5WBvcoXlQM+OnKCBrhu0n7l28CDimzfWG?=
 =?us-ascii?Q?Czv+q5y+sOOxd4TsGW8DidRYhkJZ3/z4kmFwcznzD56KzVIpgzCMZ8kZ6juI?=
 =?us-ascii?Q?EJK4+hIFjrd4TjYq/PlbPUFPCr6POI8P8IIHMPDRyWvIIezCX29cGrOEP25W?=
 =?us-ascii?Q?rZhH3r2AhgXnBON+olpssX4/6kOopJvG4nAWfIntsIxuDbVw660blRTeda7n?=
 =?us-ascii?Q?ODgTlDjHzcqJu5HRCJJu9K3Hv1BeZrEJ7BlPKxNmXz9+gP+bEyzmTqOoDYzD?=
 =?us-ascii?Q?LVFPcQ0W2ciTWO/J0w6N3mqswfgiWC/3KJpfDN8eY4JCFyJlDHViGTZ64qVq?=
 =?us-ascii?Q?yE45vR+hQ1WQ3hCRj21jFcohVjeuLx44JeJ5SMrK0/UWN2bjP+u4J4z7FMcX?=
 =?us-ascii?Q?EvRbEo0NTacvCNHjtWqOw7cnFdTUpn7YUClP0ZgS7csPEXK+C8UloStH9tcQ?=
 =?us-ascii?Q?a8fLQkMu3qw/JjPw12arfdNFMmcoCQnR7Xtpkb4aiXvJNkuz7eyf+8zxhf2t?=
 =?us-ascii?Q?sb3FvB+22H6G52RVj3IleTVScbVUMEYRS7iGKzPbhUcRSS7w7+ZJDna+aVWZ?=
 =?us-ascii?Q?J5DjtShvaOscgkVA/NEsNbRPmI6o0Rmen7lUBrYk7P49c8aD5QaKdpGMz4O7?=
 =?us-ascii?Q?sXGTOSWMBOiYn0DGHNiqF3nQgtfIbUApgMZL/Ho5GIfVqhwZYTPTaPFCgcap?=
 =?us-ascii?Q?gXB//GlLRh9odUD5l8dTROxLHBMzCPgb8c0ubgD8E7HKIpyxwm5lMjf21ROo?=
 =?us-ascii?Q?rkia0HV6vppyS+9KtKbSBjINCqvpy+flZoyqUi6n60Zhv2vBOt3NAEpVIDfM?=
 =?us-ascii?Q?gYQivcuEwlC/c6BaWL5WJey73iMYKYOLTa/973Ur02JmIdQbldI/VioIVZsu?=
 =?us-ascii?Q?XJkC/swgedCFRbl5wNnY7Yw4OCX59bzlnSyfYYNDAVHQVDVB1wcN098H7BCt?=
 =?us-ascii?Q?7drgA8X8kkmaFU4uOUexR6Y+m/pnS8xRYG0HG3JjxK5Undwboz4kRdjrwVWh?=
 =?us-ascii?Q?UhRXA1brrtCjdkiD+qMv62PyiXlWpMzbliCUeZHxtGJft3P2mRUex4F+Dab5?=
 =?us-ascii?Q?aYcf7N6MQpUFpLXnFSy8Q5PhFCYa//WYyHi8HmwH342slLquU5+oVjyNzo01?=
 =?us-ascii?Q?7ca35SOtfbkaSvzhypZzbD0ouWy4rtW7lLRVyLmFCEG/3KQ/CZWQcXdTW2br?=
 =?us-ascii?Q?lF2tDWEFSP3jAJTTw6EW9GhLQepuIV91nyjSU4/izQGdvPcUmLqWHZsSd2vQ?=
 =?us-ascii?Q?DYtLe08aNLSSvzcSREn/eoeoz8DSnrfJ2WSHirSYp1Vh+p/3EXxluX/3ZWT4?=
 =?us-ascii?Q?c9ImvE4VHC17kKF87E54eCC2DkJLVX9FiPT/HGmOqcte+FCWhtz/dakTWeiN?=
X-MS-Exchange-AntiSpam-MessageData-1: QyWxSkM8Y3mjTw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: eff574b1-6fe0-4d9d-227c-08debf66aedb
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:07.5845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDI3Pv4L/moz2VlZCEeY4g//rZeuSu6IYWM33iw9nEBKJXoRjeSb95hUFOO1b+tAIg6NakdNDp8i0NpwXYGj9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2972
X-purgate-ID: tlsNG-bad1c0/1780267692-40D67A53-CD208037/0/0
X-purgate-type: clean
X-purgate-size: 6123
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
X-Rspamd-Queue-Id: 81DC3618308
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Configure NUMA affinity for the populated memory banks. The NUMA
node ID for each memory bank is retrieved from the Device Tree.
---
 xen/arch/arm/include/asm/numa.h       |  1 +
 xen/arch/arm/numa.c                   |  7 +++++++
 xen/arch/arm/setup.c                  |  2 +-
 xen/common/device-tree/bootinfo-fdt.c |  8 ++++++++
 xen/common/device-tree/numa.c         | 29 +++++++++++++++++++++++++++
 xen/include/xen/bootinfo.h            | 23 +++++++++++++++++++++
 xen/include/xen/dt-numa.h             |  1 +
 7 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index a1fa54f2e7..6f1ccb4eb3 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -12,6 +12,7 @@ typedef u8 nodeid_t;
 extern bool numa_disabled(void);
 extern unsigned int numa_node_to_arch_nid(nodeid_t n);
 extern u8 __node_distance(nodeid_t a, nodeid_t b);
+extern void numa_memory_affinity_init(void);
 
 #define arch_want_default_dmazone() (num_online_nodes() > 1)
 
diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index 080d7892ae..15cad3d267 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -36,6 +36,13 @@ int __init arch_numa_setup(const char *opt)
     return 0;
 }
 
+void __init numa_memory_affinity_init(void)
+{
+    dt_numa_memory_affinity_init();
+
+    numa_initmem_init(0x0UL, 0x1UL << (PADDR_BITS - 12));
+}
+
 int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
 {
     return bootinfo_get_ram_range(idx, start, end);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index c0202d9ff6..cdabf536b0 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -352,7 +352,7 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
     acpi_boot_table_init();
 
 #ifdef CONFIG_NUMA
-    numa_initmem_init(0x0UL, 0x1UL << (PADDR_BITS - 12));
+    numa_memory_affinity_init();
 #endif /* CONFIG_NUMA */
 
     end_boot_allocator();
diff --git a/xen/common/device-tree/bootinfo-fdt.c b/xen/common/device-tree/bootinfo-fdt.c
index 272b5a6c0a..2d0e809231 100644
--- a/xen/common/device-tree/bootinfo-fdt.c
+++ b/xen/common/device-tree/bootinfo-fdt.c
@@ -121,6 +121,9 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
     const __be32 *cell;
     u32 reg_cells = address_cells + size_cells;
     paddr_t start, size;
+#ifdef CONFIG_DEVICE_TREE_NUMA
+    uint32_t nid;
+#endif /* CONFIG_DEVICE_TREE_NUMA */
 
     if ( !device_tree_node_is_available(fdt, node) )
         return 0;
@@ -136,6 +139,10 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
     if ( !prop )
         return -ENOENT;
 
+#ifdef CONFIG_DEVICE_TREE_NUMA
+    nid = device_tree_get_u32(fdt, node, "numa-node-id", 0U);
+#endif /* CONFIG_DEVICE_TREE_NUMA */
+
     cell = (const __be32 *)prop->data;
     banks = fdt32_to_cpu(prop->len) / (reg_cells * sizeof (u32));
 
@@ -158,6 +165,7 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
         mem->bank[mem->nr_banks].start = start;
         mem->bank[mem->nr_banks].size = size;
         mem->bank[mem->nr_banks].type = type;
+        set_numa_nodeid(&mem->bank[mem->nr_banks], nid);
         mem->nr_banks++;
     }
 
diff --git a/xen/common/device-tree/numa.c b/xen/common/device-tree/numa.c
index 06f2c8b102..539ddfccc5 100644
--- a/xen/common/device-tree/numa.c
+++ b/xen/common/device-tree/numa.c
@@ -22,3 +22,32 @@ u8 dt_node_distance(u8 a, u8 b)
     return LOCAL_DISTANCE;
 }
 
+/*
+ * Initialize memory affinity by registering bootinfo memory banks into Xen's
+ * NUMA subsystem.
+ */
+void __init dt_numa_memory_affinity_init(void)
+{
+    const struct membanks *mem = bootinfo_get_mem();
+    unsigned int bank;
+    nodeid_t nid;
+
+    numa_fw_nid_name = "DT";
+
+    for ( bank = 0 ; bank < mem->nr_banks; bank++ )
+    {
+        nid = get_numa_nodeid(&mem->bank[bank]);
+
+        if (numa_memblks_available())
+        {
+            numa_update_node_memblks(nid, nid, mem->bank[bank].start, mem->bank[bank].size, false);
+        }
+        else
+        {
+            dprintk(XENLOG_WARNING,
+                "Too many numa entries, try bigger NR_NODE_MEMBLKS!\n");
+            numa_fw_bad();
+            break;
+        }
+    }
+}
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
index 7923be2b38..d01a28b359 100644
--- a/xen/include/xen/bootinfo.h
+++ b/xen/include/xen/bootinfo.h
@@ -7,6 +7,7 @@
 #include <xen/macros.h>
 #include <xen/xmalloc.h>
 #include <xen/errno.h>
+#include <xen/numa.h>
 
 #define NR_MEM_BANKS 256
 #define NR_SHMEM_BANKS 32
@@ -56,6 +57,9 @@ struct shmem_membank_extra {
 struct membank {
     paddr_t start;
     paddr_t size;
+#ifdef CONFIG_DEVICE_TREE_NUMA
+    uint32_t numa_id;
+#endif /* CONFIG_DEVICE_TREE_NUMA */
     union {
         enum membank_type type;
 #ifdef CONFIG_STATIC_SHM
@@ -228,4 +232,23 @@ static inline int bootinfo_get_ram_range(unsigned int idx, paddr_t *start, paddr
     return 0;
 }
 
+#ifdef CONFIG_DEVICE_TREE_NUMA
+static inline uint32_t get_numa_nodeid(const struct membank *bank)
+{
+    if ( numa_disabled() ) return 0U;
+
+    return bank->numa_id;
+}
+
+static inline void set_numa_nodeid(struct membank *bank, uint32_t nid)
+{
+    if ( numa_disabled() ) nid = 0U;
+
+    bank->numa_id = nid;
+}
+#else /* CONFIG_DEVICE_TREE_NUMA */
+#define get_numa_nodeid(bank) (0)
+#define set_numa_nodeid(bank, nid) {}
+#endif /* CONFIG_DEVICE_TREE_NUMA */
+
 #endif /* XEN_BOOTINFO_H */
diff --git a/xen/include/xen/dt-numa.h b/xen/include/xen/dt-numa.h
index 721e8955fa..c6939d0928 100644
--- a/xen/include/xen/dt-numa.h
+++ b/xen/include/xen/dt-numa.h
@@ -14,6 +14,7 @@ static inline unsigned int numa_node_to_dt_nid(u32 n)
 #ifdef CONFIG_DEVICE_TREE_NUMA
 
 u8 dt_node_distance(u8 a, u8 b);
+void dt_numa_memory_affinity_init(void);
 
 #endif /* CONFIG_DEVICE_TREE_NUMA */
 
-- 
2.43.0


