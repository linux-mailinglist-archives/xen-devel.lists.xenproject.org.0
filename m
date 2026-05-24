Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BEyKD9AEmpKxAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 579195C0EB6
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318190.1586597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIs-0003ta-1d; Sun, 24 May 2026 00:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318190.1586597; Sun, 24 May 2026 00:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIr-0003pA-QK; Sun, 24 May 2026 00:02:49 +0000
Received: by outflank-mailman (input) for mailman id 1318190;
 Sun, 24 May 2026 00:02:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wQwIq-0003hm-18
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 00:02:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQwIp-005yAt-DZ
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 02:02:47 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a12400e-2eae-0a2a0a5409dd-0a2a4504c06e-12
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:47 +0200
Received: from [52.101.125.123]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a124025-1dec-0a2a45040019-34657d7b4fb1-3
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:47 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB4275.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sun, 24 May
 2026 00:02:43 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 00:02:43 +0000
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
 b=c78SQJ+E7GtcOXZCrgI/BDGbgcvcL92PfcaN6MLKiT3VwMyw3UDXhlu4oTKnXO8jvEMICFuvdN87INpGjspdNi6yE/+PtdY8W5LlX/leyOycRoFvrzSbRmn30vbaaEp8gmCZWANUASDwM93c5p1OQnw4QQ6oyCU6aFLJpSd2Zjt4m8o9ucVEkpswmPcK/g47Ko5rctz02G3r9YHVBdCXAW1fpK3FDM+OwJZh+Sfrkng6D7RO2tIuWezyuCUE4r5P7fcNjkvSL+Gp1LNGrXjFgDzBdDn4bKEu1911Ido7xdqls6Fk1rQtQ/EffOAPZZQ41U1bmelI9yQmtgSg2Ug6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6XthfOnnreD0c3O6/MvGMc15h8Ca88EfvnVvFOO8OA=;
 b=D/27LsdhetCayJxjss3Gxsi79a33+xT6OTLRu0RdhZ5oDHB650xOYwGkaqW7Y42weq5Spsx5Zqf+ZdW2c4Xx4Dboiq1Vnw+1mlGTb9SF/3LH9mvPrkEAMgmVU8dt2dQEdz/YFNMDujtghhSEQO7Z6PDGRSDVqsfNeBCAG7ACbszRrMGXRPVFtOIC77UIrrBvIBPBa3wGMLIOFdcTRZ0ALpHUeCMWLCGhwAo1QF2hGwGi//S5s/lXWmmycT4yZufkU9vmx7QGjWOKZcpn6e5k/flp8eY8ooZbRAzMdovERKMyaQd4TXUvy8WysOp0i/FbFwIvyNW6kh8HkKmT/OTPQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6XthfOnnreD0c3O6/MvGMc15h8Ca88EfvnVvFOO8OA=;
 b=OOYwes/nT+ohhFM+rMh8cx7hKn6jFBG/eluatuOkSZkraxGQ8UZggNxFScbKHJzUBFX4G+QxCRx6ZjykYk8y7lc21YKHQjvZT52KXs6ZlSpD5VoSHsUeBoWlZLKLUX6MRLpkmWJlKr1tVrxpkWXigpY4VWCxYo6rpdbrb4E664o=
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
Subject: [PATCH 08/21] xen/sched: Link CPU topology to scheduler and display via xl info
Date: Sun, 24 May 2026 09:01:56 +0900
Message-ID: <20260524000209.292370-9-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524000209.292370-1-taka@valinux.co.jp>
References: <20260524000209.292370-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0063.jpnprd01.prod.outlook.com
 (2603:1096:405:2::27) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 05de9b1a-20c3-43c1-9e4c-08deb927c789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|22082099003|18002099003|56012099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	YWIYl0ddl8yuPz4BHCfYikDjoJ54lWqpc/Ssq0YwIN8zTl1ErwKevGs0/1DCmzgwUb9yHaOm11Fjidr5vvC2sg5YcYlIpvFF4ij2Jz4pRqmLCyx22Pt4ln0gD+jNiebNHEgPpIPCbP087Fed4Nf87HuERdiMjW3HLWhZDx/Nv7hGUKMGnh7tpBDDTrrKOETOL1rxBHlhw//ZfxDAzoplYDnFiN6ljLhuHwEUCh93KtrL4qQwZm+eCbqXZH/auEyoWfvx4e9YqPPxeKQIZgi/xHlq+qeG4iDv8vSeGaSRJZdA9888PAnv4Ju8cTzumczv9qniWmjeKqDChZdxaqb5wvgvbHvMNIn08mo2uHcLLqB2PJ5xtO0i2dtRhiKSWtTpRPWCDuFmRrYc/+bRfLh8rWLEFaiMYX6KWVy8r15Ew7gd9wnssA8BzgP3U2ZZz67SStBAMT63mdIVN0QFU6zoDH7KzgtHOsYr/FaYIhX8xeJfaWWftZu7IfBRBbkIMUzIJN7LBHOlOwDjA0q2U3hSFXGCvysFSLzp7kPSNEpU51/g37PPecjMZFpwNya/UCwbRaSB9j9l/2tB6N4yTTX1F0zhIr5fDHHLbQ6uBfmjy2WjuwKfHXnJMOMBm2zsipHxEdRUJQ8DsHLANb10e6QpcvX1YLSB6g3UAKHrUzAR5LaHFpNBiE2PNK0WRrh2hSEg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fYjyS+H//9rgEiIMAEIxuBY5r071YyntHE2M2SMpOXq3LpqB4QTg4q29Oeip?=
 =?us-ascii?Q?DVJDciII4swCIVViuMYayzTqqUCpmgZCwYIQx3TFQoHQ+dpw79V47Tclua9w?=
 =?us-ascii?Q?TOLexo7+8kIFASnsgDniqmUXJ79INak4nNMkq/pmUCsaT5V8ANj8xjQSvvTM?=
 =?us-ascii?Q?ImnlmeIIB8xlt2WoI5SC6StQPz4XcuW966R1wKKr0IN2OQW2W4LiFLovliXF?=
 =?us-ascii?Q?4U8GF7BelsWDv1x3ey7nr68n/HUmW1/K8lXK5xRpIyzIbqUG8qeGa9E1uuKB?=
 =?us-ascii?Q?2H2daVGW0bJTZQTPcwMvkuzQxxMhkckDlFHsD6MFkrue7Y1K9Y8RaRDhj/JX?=
 =?us-ascii?Q?j7x7dDtOD4DChqfnJKzVK64lBC2p0JIMv4CO5TCEbIEyNRx+YnhfLxbYvGAT?=
 =?us-ascii?Q?Z2O+IhWdiET0Ze3bL6x2+cNyIgKHWxACjskoCYN8fX0MLzUJRumuhelUw8tL?=
 =?us-ascii?Q?hY5it0+NE05V2tYnY8jSXAZReby6iuZ8mQijSAKX/4T/Rp2xYZPMatrXW8nN?=
 =?us-ascii?Q?PhR095xZqn2RxemtbQ0BTvgopxbQMPV5e0PaBuD7Tcc9OwUqJnphDjsQEaPq?=
 =?us-ascii?Q?zG4lWtyjqHhc3HF47gWmGOCN/0ujOTTmsH19QcyI6f+Om6lagGjAILptDAEB?=
 =?us-ascii?Q?aUP0eGQ7zX/nYtq3RzSsd+dehR25fykLzGegdGAtvYAY6uwaPdYL+qY0u+hg?=
 =?us-ascii?Q?YkoJCPMx1GZylTe6BXNYKQ+fIH5pC40k4iblWCkm/LXSWU5p7JbIn3lDEVZy?=
 =?us-ascii?Q?xmS0SX9YDrfVUbfspVgyNqXh7Q0tj0hAwFW+h/0wweteeX85+AgPO5GgajgU?=
 =?us-ascii?Q?vWUK34eNZA89ry3/wLH/eyGPCicnrj/v3X5+Aj7vEt9VeoYrBk80YOcvlM2q?=
 =?us-ascii?Q?VMjv/D81ZQKoBCLVfBcArC28khmghvHrS0bTD22cgukhp7LtuIqJ1DKFEeq2?=
 =?us-ascii?Q?somI5ZM44WmsRIKJ/ogILRtPmY1KE71DK3cb8BX3r2x3UjPkfaRJ3FDlJfws?=
 =?us-ascii?Q?/6wJ1QyxN0onXnPoQA+puL3AcXQOXyvHLMDOEysFgzr5JQ+KYKdektKijFDH?=
 =?us-ascii?Q?9bcOhPmXZiuBp5xKS47wVeQTPL5Rz5Mhy13NtyVqBaUTfZzmamUtUPVi9dVa?=
 =?us-ascii?Q?qnrVLrWFWrk104zGj95mz4jBXhR2K9NfKIh/d/dhp+tGXhNI5cZn/cvswT6b?=
 =?us-ascii?Q?uHOM262RY4Hj6HfY+n+5kUY7KfhiWl9WkgndYBUQx9P8uK2+9eC6LfI51qne?=
 =?us-ascii?Q?V/v8jOUV66bKr81ij8LXQ9wAYPOZek5o4IF5+V3HPuYRPcXjUfkhKA1dqO2S?=
 =?us-ascii?Q?aj1KND9qsHXsZsEqMzJLdbkbs3EuexeOICjg8kvsrMYDUo3bJjXqCpPBmJPG?=
 =?us-ascii?Q?8jCZ9UI79Iq67qAAJ74Q7yu6QAYum9KH/bArve90tCLXmYDfegqQYHZ+JAQQ?=
 =?us-ascii?Q?AmNNco0OLouJXS/E3JpxJshuV+4r8q6KcX2Eoux63BIRxcF5D29khM1ltOiA?=
 =?us-ascii?Q?5uWv/kqDUR/10k6QfzoJvHBYIjErkrOGEnFviqtD4X3UR9lc2ac4A4HhCz8L?=
 =?us-ascii?Q?psEu6MXKh/tBIa9zhpUqE+bhDcyte09k8vGYk5WaZeAwlg5dqDLJKdt8MwpS?=
 =?us-ascii?Q?NXvvRW6LAKlCBS1Dg/UdlOGMhMfVpFyuK7WoSLhxltPe2lEIUsLIOZpstAr3?=
 =?us-ascii?Q?paP6XRbtgqD9AIJ4S22sL+q1KTUO3ce2GXrqeF5TNVUg5VYs5/s8UBpD3SVk?=
 =?us-ascii?Q?QxhQyYrGPdcfZ0E4SoEeCaF4jTxOT6MbRz6HKJgcUD3gJwzZZb9J1UY2Fw13?=
X-MS-Exchange-AntiSpam-MessageData-1: XzMvSeRf/c/maQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 05de9b1a-20c3-43c1-9e4c-08deb927c789
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 00:02:43.6620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIXx77SPwG392u06EAmFufrYf9lYy4rC4LpPuQDRguoch+Fi5i8Z1cFomqBRwlN0ucKFxOqg3PaCposRVXoPAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4275
X-purgate-ID: tlsNG-ebf023/1779580967-2BF6D3FF-50070413/0/0
X-purgate-type: clean
X-purgate-size: 5726
X-Spamd-Result: default: False [1.32 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:taka@valinux.co.jp,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
X-Rspamd-Queue-Id: 579195C0EB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Make CPU topology information available to the Xen scheduler.
Additionally, ensure that this topology information is displayed
when executing the 'xl info -n' command.
---
 xen/arch/arm/include/asm/processor.h  |  6 ++-
 xen/arch/arm/smpboot.c                | 10 +++--
 xen/common/device-tree/cpu_topology.c | 54 +++++++++++++++++++++++++++
 xen/common/sched/credit2.c            |  3 ++
 xen/common/sysctl.c                   |  1 +
 xen/include/xen/cpu_topology.h        |  3 ++
 6 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 895d7cd502..066966b375 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -591,9 +591,13 @@ void show_stack(const struct cpu_user_regs *regs);
 
 #define cpu_relax() barrier() /* Could yield? */
 
-/* All a bit UP for the moment */
+#ifdef CONFIG_DT_CPU_TOPOLOGY
+#define cpu_to_core(_cpu)   (cpu_topology[_cpu].to_core)
+#define cpu_to_socket(_cpu)   (cpu_topology[_cpu].to_socket)
+#else /* CONFIG_DT_CPU_TOPOLOGY */
 #define cpu_to_core(_cpu)   (0)
 #define cpu_to_socket(_cpu) (0)
+#endif /* CONFIG_DT_CPU_TOPOLOGY */
 
 struct vcpu;
 void vcpu_regs_hyp_to_user(const struct vcpu *vcpu,
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index ff8b0d07e9..726f3720ce 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -93,13 +93,17 @@ static int setup_cpu_sibling_map(int cpu)
          !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
         return -ENOMEM;
 
+#ifdef CONFIG_DT_CPU_TOPOLOGY
+    cpumask_copy(per_cpu(cpu_sibling_mask, cpu), &cpu_topology[cpu].thread_sibling);
+    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_topology[cpu].core_sibling);
+#else /* CONFIG_DT_CPU_TOPOLOGY */
     /*
-     * Currently we assume there is no multithread and NUMA, so
-     * a CPU is a sibling with itself, and the all possible CPUs
-     * are supposed to belong to the same socket (NUMA node).
+     * If CONFIG_DT_CPU_TOPOLOGY is disabled, it is assumed that
+     * all CPUs reside in the same socket and that SMT is not used.
      */
     cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
     cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
+#endif /* CONFIG_DT_CPU_TOPOLOGY */
 
     return 0;
 }
diff --git a/xen/common/device-tree/cpu_topology.c b/xen/common/device-tree/cpu_topology.c
index 6c78a74778..f5d2a59e2c 100644
--- a/xen/common/device-tree/cpu_topology.c
+++ b/xen/common/device-tree/cpu_topology.c
@@ -275,6 +275,58 @@ static void __init fixup_topology(void)
 }
 
 
+static void __init setup_topology_for_sched(void)
+{
+    int prev_socketid = 0;
+    int prev_clusterid = 0;
+    int prev_coreid = 0;
+    int prev_threadid = 0;
+    int coreid = 0;
+    int socketid = 0;
+    int clusterid = 0;
+    int threadid = 0;
+    int cpu;
+
+    for_each_possible_cpu(cpu)
+    {
+        struct cpu_topology *cpu_topo = &cpu_topology[cpu];
+
+        if (cpu_topo->package_id != prev_socketid)
+        {
+            prev_socketid = cpu_topo->package_id;
+            prev_clusterid = cpu_topo->cluster_id;
+            prev_coreid = cpu_topo->core_id;
+            socketid++;
+            clusterid++;
+            coreid++;
+            threadid++;
+        }
+        else if (cpu_topo->cluster_id != prev_clusterid)
+        {
+            prev_clusterid = cpu_topo->cluster_id;
+            prev_coreid = cpu_topo->core_id;
+            clusterid++;
+            coreid++;
+            threadid++;
+        }
+        else if (cpu_topo->core_id != prev_coreid)
+        {
+            prev_coreid = cpu_topo->core_id;
+            coreid++;
+            threadid++;
+        }
+        else if (cpu_topo->thread_id != prev_threadid)
+        {
+            threadid++;
+        }
+
+        cpu_topo->to_socket = socketid;
+        cpu_topo->to_core = coreid;
+        cpu_topo->num_siblings = cpumask_weight(&cpu_topo->thread_sibling);
+    }
+
+}
+
 int __init parse_dt_topology(void)
 {
     struct dt_device_node *cpus;
@@ -304,4 +356,6 @@ void __init dt_init_cpu_topology(void)
 
     for_each_possible_cpu(cpu)
         setup_siblings_masks(cpu);
+
+    setup_topology_for_sched();
 }
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 75316d42b7..34876b99c0 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -20,6 +20,7 @@
 #include <xen/softirq.h>
 #include <xen/time.h>
 #include <xen/trace.h>
+#include <xen/cpu_topology.h>
 
 #include <asm/div64.h>
 
@@ -38,6 +39,8 @@ static unsigned int cpu_nr_siblings(unsigned int cpu)
 {
 #ifdef CONFIG_X86
     return cpu_data[cpu].x86_num_siblings;
+#elif CONFIG_DT_CPU_TOPOLOGY
+    return cpu_topology[cpu].num_siblings;
 #else
     return 1;
 #endif
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 5207664252..806c885df1 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -28,6 +28,7 @@
 #include <xen/pmstat.h>
 #include <xen/livepatch.h>
 #include <xen/coverage.h>
+#include <xen/cpu_topology.h>
 
 long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 {
diff --git a/xen/include/xen/cpu_topology.h b/xen/include/xen/cpu_topology.h
index 0cdceb9bd0..c22224b3af 100644
--- a/xen/include/xen/cpu_topology.h
+++ b/xen/include/xen/cpu_topology.h
@@ -14,6 +14,9 @@ struct cpu_topology {
     cpumask_t thread_sibling;
     cpumask_t core_sibling;
     cpumask_t cluster_sibling;
+    int to_core;
+    int to_socket;
+    int num_siblings;
 };
 
 
-- 
2.43.0


