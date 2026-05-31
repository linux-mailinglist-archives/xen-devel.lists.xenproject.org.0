Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOFrN926HGp7RwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:49:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 682DA61831C
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:49:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323530.1589345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxh-00043i-RS; Sun, 31 May 2026 22:48:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323530.1589345; Sun, 31 May 2026 22:48:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxh-0003rc-I8; Sun, 31 May 2026 22:48:53 +0000
Received: by outflank-mailman (input) for mailman id 1323530;
 Sun, 31 May 2026 22:48:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wToxf-0003OJ-0w
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wToxe-00En0E-Cw
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:50 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba94-bab6-0a2a0a5309dd-0a2a4504a1f8-28
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:50 +0200
Received: from [52.101.125.102]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbacf-1dec-0a2a45040019-34657d668b12-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:50 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY1P286MB3278.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Sun, 31 May
 2026 22:48:46 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:46 +0000
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
 b=bRkteYs+NLUCNXsxCNLzOsZq667fqTekJTnrHRvQ08jwYCXlYqSOEyhMfzNGv36TirMhUO2bdhshJEg1+cSe21k7u/bKZpjjHHGMuenezs3meJBZJAKnmdEdZXD3RP+uhGG/7+Kv+I1g/koCVb8gE2WTVm2oDnfHCePgzEX2Ek/nCfLlG/cXMe0eA2jFXDGxlaIZs4X1Ze8ppRykdmNvsmpMfnoaW2iuQf6611ZCu3F2sqK9MhYG70+mcsSyvRv/Xv5U/OTtqROhe5piuq/LjJLjgaJ8Cxmk0xYUliG917E3uKoRhP7TMgAFwNCb8R2RiyCZiu6loiVWoyYoH2YRew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3XmMr4E3+akgf1HAcBTnf26av6T0gioo48e5/4KTcg=;
 b=T6iKCSccDDHiJkHvDFWzJ/BwrGp3TTY9krdB8g+vp5hvGqJdu6W6iT0isQQUI37YDvMuAjURPLkmF/VsodlMlPigOzpjnP92kOsWUnMKGfJZqLlS0y+IBA5JjqPpBvgJFmLkxCPlvGPsoIdgFshtFBz1V77Vo19pW7iAtIULBEvd8kjGHrMRwFaNyAQcpBHiN6zFXLIohI8CgPN6rKCSQFLT2YUM7O+kvBaUecPbip3mTtEhtAFDMNe6cHX6eUE3Boa4TJaPQtb416LtUp8e5dJo/SYvKqqCXPnkqgPRyBi8S3B/kySrNOF5hY2bp+426ta2y8YgQwmXtvfUqkIqnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3XmMr4E3+akgf1HAcBTnf26av6T0gioo48e5/4KTcg=;
 b=rGQTi1hkjOQEDOIhNiXO/Z4Xvbt+FTa/W1sHHh7dbDsAO04hCvCRG6T9uhuDjYX+3vZp2hk9UipZKYh+2cUU2MUTKTz4OIm8FXk+x664Ys92gtCOAGUWbjUjI7JSW649mnChednPR4Aawt0JySS0MF+sHB+/L+FOCDR2ihTLevk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 24/24] xen/arm: Support numa and dom0_nodes boot options
Date: Mon,  1 Jun 2026 07:47:54 +0900
Message-ID: <20260531224755.9481-25-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0115.jpnprd01.prod.outlook.com
 (2603:1096:405:379::17) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY1P286MB3278:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eb66169-8a08-4f4c-cc24-08debf66c60c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|3023799007|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FJUywyCTtOHsTKeg+am8duIMaVPFio3GjK45JLlgUmdOUbFnmwWzgO/9LO9Pw5D+B0qYqUKeQ5hN4OeMKUxcJCdc9vsM9z3EXD2viC4fEZbrnyJpsTvS4eBTnRAGzqmvI/Ll2rYCANOuOQN175Lx7EsdmExVp8GFlob3TuOX8cVwELQXsxS7adLYuKR3aZl+nGDvGCNTjX6svK5o2l/zyZoid2ZHNLfrCJrPuvLNYBw/k4wSx8HZxkoVext3CgbzIcnU9NANngZhohO9TTPNXGC441KA8ddD2Sx3/p2KpzRRMvNuK/7eTKIIsLMWd17yLi1CB9PA+F4J7xVBrDShg/l0sLFRGnC3HraR58Xhn8ns5sViYihQ5sCY/Qfd5ikXQk3PESFWDNInWep5Xe4cI9kYNltPEiHxcJhyboFqg7HeenA3shoFzS3hHkF1eieILZAbNL4YE0hbn8VG+odBb5VL2jjYeid1pgkm6w0PRbSh/i8hZRWEQf8JHL5OEAeIGx4YyXmepg6XPQeMGCP7ErDmBpTuBsIMx3Z91xEiXSpcs669MzJOlhDExkZd5ECdUGBzcSLoPwPYqsqxJ4N+6ntL5Icug8zz4cJLaVMrrB1H4uD1TtuadT1W3fLbOK9Q7AHc6TBEDMlWJe6eHPSClQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(3023799007)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jD4UckMd8tOn6BqDXe2az43yMAyxSNPW6gIJbkOiZ+QvMMFmQGjxeMv8rxCH?=
 =?us-ascii?Q?uwT+YT4DKR1lhE+NZZDf7yPIca3SPbtzJqG9/gKamasm7Le5dm/BiuVUKAS6?=
 =?us-ascii?Q?M+piZ54808KNIbDl55PwgqJpPji/JkfwahruHemukepEfh81dlDSy1r8k2dB?=
 =?us-ascii?Q?rcna9+yYUKn66wC5s/Lv3q25p8HOAB9T51IKOjXo5Iw25BHHLQg3gty1ZTiG?=
 =?us-ascii?Q?VeT616eX5P0c7ZD0zkPk4HrLVg5U2wysqC5pTRi1R2T/Fr+dKgwkCm95i4Rh?=
 =?us-ascii?Q?IZqg/ONpdCcyug95SXAXGUBe2vOkuE4b23RwbiB6J/jAETjYW2x2VTCxjgcb?=
 =?us-ascii?Q?fhPOXiV89XdHy1OtmbYDRm5SIBCDsf4RDKR/kPw7digoQbfsUkG9RAQ50jxe?=
 =?us-ascii?Q?BWmZ+JOLcAuqIXp/Vp0NWiVKESUMhC/sA1S87UyGS4vTd9UEgp1vMZBe03OZ?=
 =?us-ascii?Q?KUn7u3L6bYkCxbwrwvTI9yXGP1dbzRKzs72WkS2nfKhiBlIA/mkS823v5K00?=
 =?us-ascii?Q?B/ajegjMwcubybr2w+89NLdVZXnjiccnldMLNiZBhcDhtPWCdo631s2no/rD?=
 =?us-ascii?Q?BGpOHnbnUFh1Q8spX+OQ/sNOLpYP9uhspQtyKVQ95Hk77YNuL0JDCxt1F+hR?=
 =?us-ascii?Q?7I2BOti7JLvo3zk7Kvm5ZWW3Qkcq6opNCnhY67rPMQOyOBKmMsnrmdc8DR8e?=
 =?us-ascii?Q?iZvra6Aph6QlqRUCdC/yTXgDGZPSoFQaqkRCYpG7M6sf7x4QEt6kenA/o5qa?=
 =?us-ascii?Q?mUVFTbUVO7VTUF8cgyBExHurr0DiYBGEePe0W5D+Ynd0edQKMETqQvdv3MUZ?=
 =?us-ascii?Q?VQ5NYAWOJ5wl+K03tCrdRTlHypTQIQKqSzOY3YRWqFCSqc6hrTPQlJyEQnxi?=
 =?us-ascii?Q?ZO1gYeag591zDfMB2MoqnQj3D2ijWdknvpMDbGdbGBasPzbq+258KuUGhzRT?=
 =?us-ascii?Q?Dl8BB3O48IHXvmE7kDdlgG//DT/K+DaedSZa4Kqa1l3ALUrX6/tpgbkKS9QH?=
 =?us-ascii?Q?0CNNyBVRLNLoSNgcX7pFz7TbcW+hfYNt0ysTJVEoRMy2hGik86RjaQusO430?=
 =?us-ascii?Q?xE4nqjSkUwRiiIRHL0ezMs7lvxcdw78zWWG//F3pI2szDSRBQREW1Du+Zciy?=
 =?us-ascii?Q?IKpbqaIr6CrZ8DWA+D/3ZQuEDGDflj34pKQnzoGeIcmF7LCWbIkx6X8eCx9r?=
 =?us-ascii?Q?jydREasCfVmq8JjBof7m/wqcFfA3/u1RNYoO8r3KTQ17ddPdkRf9ofDofpi2?=
 =?us-ascii?Q?m5xNwUy2QzzGWl9N/h6UPN5mdq4xTnVD1ESxA1VJa5k5Wb5l4Q392VynQCJz?=
 =?us-ascii?Q?yNGuJsJKUkIDE+Siox2GZGUMTfvRlQlv7uorbS9n/MZ/YIzkRBCeMDAV3b71?=
 =?us-ascii?Q?W43aoNoSisttS9s00UIgLkK/7rDK1M5/IglJOICYIMMe13PbuNBe8uv0k4SQ?=
 =?us-ascii?Q?FSTHBTzr1HZqa1BmGginVlwvVfy5yn6w7z2TgIdM2vXR4miGWdydPDpgMf/x?=
 =?us-ascii?Q?aRdIgaYhuTLflxurQ7Kp2jpKOotn2eXJ4vc9LzVlG6UDfTtCh64Nltg0dc/n?=
 =?us-ascii?Q?/MP2Tev4mlwCxfVnUh37yBF3CflN+jfJnWmOL35NpjSQeuel8gu4AmFzCyJU?=
 =?us-ascii?Q?1NcVnWiku+nPMIatK84wsrf+dDpHbp9ZjTK4jhPaaTjK6ctwlFex/maViqMi?=
 =?us-ascii?Q?foBvI4fDpOVtK/gRo74hhbJv4YGW8sOkKVW98bEVz3LpXdSz5Oli1QoDbBYY?=
 =?us-ascii?Q?fy3N213TxkA7PUERToHEtIwvkYeJ8RVLQoujHUbQH6Lv4/myHmoxCwrI5vh+?=
X-MS-Exchange-AntiSpam-MessageData-1: msz62ZHVuRl2gg==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb66169-8a08-4f4c-cc24-08debf66c60c
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:46.4114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlGp30Hdd034s6RanQoHhdLcP43DqTUXdPgxMkyLTjgtNFt8tD1sdCyE3WSjFI54Y2n4IR9o4mRb7oUe2OaEEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P286MB3278
X-purgate-ID: tlsNG-ebf023/1780267730-42F653FF-134D48AC/0/0
X-purgate-type: clean
X-purgate-size: 1710
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.867];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 682DA61831C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The numa_nodes command line option is now supported on ARM Xen.
Its usage is almost identical to x86 Xen. The key difference is that
while x86 uses ACPI PXM values to specify nodes, ARM uses the
values defined in the device tree (numa-node-id).
---
 docs/misc/xen-command-line.pandoc | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 8c89b7852c..909d5889e5 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1050,7 +1050,7 @@ Practices](https://wiki.xen.org/wiki/Xen_Best_Practices#Xen_dom0_dedicated_memor
 
 This option doesn't have effect if pv-shim mode is enabled.
 
-### dom0_nodes (x86)
+### dom0_nodes (x86, arm)
 
 > `= List of [ <integer> | relaxed | strict ]`
 
@@ -1059,8 +1059,9 @@ This option doesn't have effect if pv-shim mode is enabled.
 Specify the NUMA nodes to place Dom0 on. Defaults for vCPU-s created
 and memory assigned to Dom0 will be adjusted to match the node
 restrictions set up here. Note that the values to be specified here are
-ACPI PXM ones, not Xen internal node numbers. `relaxed` sets up vCPU
-affinities to prefer but be not limited to the specified node(s).
+ACPI PXM ones, not Xen internal node numbers, or node IDs in the device
+tree. `relaxed` sets up vCPU affinities to prefer but be not limited to
+the specified node(s).
 
 ### dom0_vcpus_pin
 > `= <boolean>`
@@ -2017,7 +2018,7 @@ This option is ignored in **pv-shim** mode.
 ### nr_irqs (x86)
 > `= <integer>`
 
-### numa (x86)
+### numa (x86, arm)
 > `= on | off | fake=<integer> | noacpi`
 
 > Default: `on`
-- 
2.43.0


