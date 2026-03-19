Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFkbDFH6u2mzqwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:29:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0942CBFF9
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:29:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257117.1551561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DRT-00053p-9g; Thu, 19 Mar 2026 13:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257117.1551561; Thu, 19 Mar 2026 13:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DRT-000521-6t; Thu, 19 Mar 2026 13:29:39 +0000
Received: by outflank-mailman (input) for mailman id 1257117;
 Thu, 19 Mar 2026 13:29:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wl8P=BT=citrix.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1w3DRR-0004oN-Ai
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 13:29:37 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac4fabdd-2397-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 14:29:36 +0100 (CET)
Received: from DS0PR03MB8272.namprd03.prod.outlook.com (2603:10b6:8:28f::23)
 by CH5PR03MB7816.namprd03.prod.outlook.com (2603:10b6:610:210::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 13:29:29 +0000
Received: from DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654]) by DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654%5]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 13:29:31 +0000
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
X-Inumbo-ID: ac4fabdd-2397-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sn5S4LLWoWAcwdsSLXvDqtVOZI/l10HD9JTXv4qfYSh+v/RWcXZZULRJalhaeaUg+xFNJwv10W3YTR5dbKX4zILYbB3n4Ov8zltbNLk9pRCQNmAetIcIK0oxd5gKg7UxHHLdcXPE7WhlWAKseLCJBuAUWqIpxySY/k5XGc+mz0BonSuvJKTk0iiZMyCLmrpu2GIg0OZsa2vm4C3ve9Lniib4qLS+XkpjqWwAYiVKo02keEEjEVWbEYH0WVFXixDiLs6pMn/I1r67Vxu5WUWSqEzyYo4FjBeKQCq9e3CEAkyBgvA/a+KAoKDWvD5IIDT3ifcEZPvgLYeFgeGXzh9cJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfpfp46eTyMy7pfSeQnpjON24kwtKz4/QB3um9t+Ie4=;
 b=eD9e5QlvoERmpy6EXDnoTGf84inSpdqTsY/6SB249Z2C4az/jkxWytdz1AOcy3q0FUoxk8w89RoGKGU9sqnAd7rdOW5886AYuLMb6B15SGjB8rissxnHZJOGcQGgidbE5BUvUr2JCWh4CFrYJKx81ya0yzOxa2KuNmcPLXbvlGd1gTPCPnrTKe828JO3mSK4DpJx9riW8PF0hnivJCsquh/DlDeJyTPeRosXmJWsFbpbV6qZCxPp+aCzEzul8idGZJAMy3MkTIxJRYYAQ/bD5ztuipGRrm+zheasTVQsc9ZOgcY8smqPhbHc+5XIzfZoCp2EGMt8OXFrLc+Gr4071w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfpfp46eTyMy7pfSeQnpjON24kwtKz4/QB3um9t+Ie4=;
 b=E4pFsrRZ5OHol2JvI2LmcvMN3/GQPPh9K8LqdIpcAk+dLMRGAKc3xWyJ6h5zi3ld2/mSmSvwLnAD6s9881/U57tc6W5MGusRC5D89hoYQPvS2tqOSeARpiTVjtAPNxit+2u0eB2oovcUs2I9GJkVkd8YgFS1ITa9zSwto5+W2+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v1 1/8] x86: Always use eager-fpu
Date: Thu, 19 Mar 2026 13:29:17 +0000
Message-ID: <20260319132924.1469809-2-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0059.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::15) To DS0PR03MB8272.namprd03.prod.outlook.com
 (2603:10b6:8:28f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR03MB8272:EE_|CH5PR03MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c201f1-63c7-4458-1262-08de85bb8d6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PwctcuVXhW0DoRdJ4zFdxMrTtvo/JrGFXWRLB7mglFSZgmPRRvsBRkAZSpdS0W+mvTYaSCVxZiWEPI8iXY+SlEim7ulDso8MOlPMB6f90MEb58L8FzIZ59Sg7ev4V5Gaac+3EkZ+fRNHv9cXLHN1pucub3FThnUQRP2pUPiRNMz7Xgu1sfElBfug0Xucy0FSXzVfWiNqo+Cevyq3L96X/LhMgnL048cbA+fO5Yjqsvg2b8nLvWaazGF3viEamgYCj6bnCp5TxlINNQ4RkFdP3vYh6WdJaD97sXMdGZI9QMjzjlizXjEHEj3PAbi+/Vjge77s2sTWnF1NLPlG+d4lTGVTMVHft9xOM/oTVGLQE4NJoAltqZCPm7NYzKHEYBUOZdND0MF2/Qq8Gvw1/xR3rMNjne8iOUHLKR3sK8gGsar5J9eu5DUXc/A+XWWjr+j8bc+1/dDolC7OnsM50m80zRRqA5KvnWXXT+vLKQNPhEuHeDc/lK0ciK5+lyT4/rHMG0RnxrqO6vAekJQBmsHMjxL+DcCFX9EqhIoikgy7OIW+1uYx7/3uWIx/l2izKWHXnaFmuMBcl3mVeiV/Zghz6lSBBYtZCkHeV4yhqlku20FJmgsSikOVmLFkRY4y+6iO4YF7rbpHBwN7lmVu5XBv4qXKitIFfT7wheM8NJ0hs443KFCRVAp0bSrEVDqQpkgbz8UpltJeoulGabNBGPC1sRxHUcKTUF7vX6U/pR4h3bo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB8272.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wI1uRyHvJdC2W1tMUoXdTmLy9tuydszLjrPktRBIwFqKBAPrqQIppbMmpnXU?=
 =?us-ascii?Q?ishS5ZZeDDq365NqnjG5Q3kHs9ymaPp5iyDRvRuFh1wp5ZgUQP115YjD3mMn?=
 =?us-ascii?Q?HKDs0h32cloglmLvmJsNn4BK3i6/MPomwPbrRDwq8bff9E4hj2QT+B4ij6tG?=
 =?us-ascii?Q?Wj596ESmF42PhGUXZdlfgPZBaPMTHDwIxrepRydZNbkhg5xqAB9mrC26+CL7?=
 =?us-ascii?Q?t6AubXXuFtqP/xU77dN8LMxiFjJ2vi7d5D72kEo9dJ3qftlT86d6ueqb7Z80?=
 =?us-ascii?Q?+aeri3OFxwZUmjEYZi1gPsYbqtBI82550LNn9wmk9W22WUaf9Z5FJW7aZyXu?=
 =?us-ascii?Q?PigDCxBrAcUycVKdKKlH+4efYNW7z/P476DWxrnswPBLjTjGY6EoCFuphxNk?=
 =?us-ascii?Q?pZYx/FQJHSx8gEsjTG7/6pmZK73e21ESVaxtM13SplKonmcR1dtLmqf2xK2l?=
 =?us-ascii?Q?KRdQvlnP7f6mdtxwvQKCr3u5IN/EzCoYmy47kvfAAxbcYwui9HUgpr1yMbG8?=
 =?us-ascii?Q?meQk7tJMpU9+d/cKIkzNV/G/0Dt68DIVcd4JkNcNnrot/H3Ow0wUWHyApWUi?=
 =?us-ascii?Q?Hmz9RzraUO4csnvrqckP8x/56wbz8etxO16Y9rc8caBy8GchV2phoPXqfy6B?=
 =?us-ascii?Q?TY0jsWtqkldxct7TaztzOfHA0ZX89q2evHHl0lpWTHVlF648MSvU+CZTiErP?=
 =?us-ascii?Q?ULHu2SbL7qixneaLRid2zm1XP9rGPz8JAmDiEQSNj34nbK9RPnvunUHRnwEr?=
 =?us-ascii?Q?XHXcG7ERCQkbk7t4zr81LNXy8YVGrU0+WOxPXU1l27kqQdU96sJlE5cN4ks6?=
 =?us-ascii?Q?kdUsj4zpiMxw31KIkz8W/cOp5K+85XJRwUFoHsXEOR2JgbqFVkQcDgP8Njdj?=
 =?us-ascii?Q?TMcceHqQ3groKiM71KA9EqizaZAN+UMMhN1tJSCm9tgU96abrIe059w1jLMF?=
 =?us-ascii?Q?BbDUOoFasE3flpArxcQ0ssreYyOlWS5dJyNzadB1KBimippXdZGFmD5YJqa0?=
 =?us-ascii?Q?nRkvsb/JEoVLszO+rE854KKdQmbJ9BbFe4nwAEdBXfdbmtnnKoSXjaqLy/l/?=
 =?us-ascii?Q?ShfnobhG0L8SKGERtdUaziABhB3aHPv6RCD5qfGjqlqzAfXLGYFVx8eektdA?=
 =?us-ascii?Q?KBl9MVNwEmYM7vcQoWs9y8HPDM801MpoA17IuH5xR8awVpvlDNVfM79vu0Sy?=
 =?us-ascii?Q?59OWZun8nhBB3sriCAuD7BFht8UhAV1ZOoPPO3obN69zNtsH7tx/fx/kwUyK?=
 =?us-ascii?Q?lDvAuPmZjmQLjJUTO5yWJVT5c6d4tPg7zT5rjj48SKFno4Rkjc0X4pWwY6wG?=
 =?us-ascii?Q?YEUbD6rn06OF4g/JK+S5p7xyK2BiKxHjQvKYEcmYkiLYzE291gzUOftuSrOs?=
 =?us-ascii?Q?xqwFDflR6+E0YCgKdWviMkHxA5BOS5BXBB87B7DS0bfjLdV2ud9E5x6PV1H2?=
 =?us-ascii?Q?pAFZAHxXbzE9BwhB2i4ykHoyS1D+y5xArlYEdEPAO1ZLEsjoW2msuyMKhZ4L?=
 =?us-ascii?Q?FJvdb1ct62DQR4bx19fSh6suc5uresiHSpYtPHtJdctk2lfcupKZ6FAkEDYu?=
 =?us-ascii?Q?CFSlO/E9EnuUt8NPIifvNYBGLcpB44547awG9vswKu2NhKD2NqP+q0D/epRG?=
 =?us-ascii?Q?sboAACnBnPXQwLDuzYDtyOa3w4UokA3xoigGyZj4UFvJninvG9PBfxI+7A9D?=
 =?us-ascii?Q?c/UnHgjsZf8j4teL25cTDCNdahcw/k2FjCVRDbJvVorAcVTpuZw6JxmgR8ru?=
 =?us-ascii?Q?l/Z8syziEQu92W0lmAbX70Cx772QcVI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c201f1-63c7-4458-1262-08de85bb8d6a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB8272.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 13:29:31.1842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ChuwEmEOZKBGmxyjhcmpaV0twMjOruI0xx83PK0o2Q1pL3D3GjHL0rMHix1v7nsZJTCSb6voIwpC2Sz4mxOB4Kj7lMKOv04MQw88Hhjg1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7816
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,boot_cpu_data.family:url,amd.com:url];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7C0942CBFF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Lazy FPU avoids some work during a context switch but pushes the costs
elsewhere:

* For a workload running some Windows VMs, I measured about 83% of
  context switches out had used the FPU so most of the time the FPU
  save/restore is not avoided, just delayed.
* Setting/clearing the cr0.TS bit is serializing and reportedly slower
  than the processor optimized xsave/restore.
* Linux uses PKRU so a partial xsave/restore is performed on each
  context switch anyway, followed by a second xsave/restore at some
  point during execution.

There is no measurable performance benefit for using lazy FPU and it
adds unwanted complexity so remove the option and always use eager-fpu.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 docs/misc/hypfs-paths.pandoc         |  2 -
 docs/misc/xen-command-line.pandoc    |  7 +--
 xen/arch/x86/i387.c                  |  2 +-
 xen/arch/x86/include/asm/spec_ctrl.h |  1 -
 xen/arch/x86/spec_ctrl.c             | 88 ++--------------------------
 5 files changed, 6 insertions(+), 94 deletions(-)

diff --git a/docs/misc/hypfs-paths.pandoc b/docs/misc/hypfs-paths.pandoc
index e86f7d0dbef9..1553cb0bcb7f 100644
--- a/docs/misc/hypfs-paths.pandoc
+++ b/docs/misc/hypfs-paths.pandoc
@@ -108,12 +108,10 @@ A populated Xen hypervisor file system might look like the following example:
             active-hvm/      directory for mitigations active in hvm doamins
                 msr-spec-ctrl "No" or "Yes"
                 rsb          "No" or "Yes"
-                eager-fpu    "No" or "Yes"
                 md-clear     "No" or "Yes"
             active-pv/       directory for mitigations active in pv doamins
                 msr-spec-ctrl "No" or "Yes"
                 rsb          "No" or "Yes"
-                eager-fpu    "No" or "Yes"
                 md-clear     "No" or "Yes"
                 xpti         "No" or list of "dom0", "domU", "PCID-on"
                 l1tf-shadow  "No" or list of "dom0", "domU"
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index ebdca007d26b..6c77129732bf 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2470,7 +2470,7 @@ By default SSBD will be mitigated at runtime (i.e `ssbd=runtime`).
 >              {msr-sc,rsb,verw,{ibpb,bhb}-entry}=<bool>|{pv,hvm}=<bool>,
 >              bti-thunk=retpoline|lfence|jmp,bhb-seq=short|tsx|long,
 >              {ibrs,ibpb,ssbd,psfd,
->              eager-fpu,l1d-flush,branch-harden,srb-lock,
+>              l1d-flush,branch-harden,srb-lock,
 >              unpriv-mmio,gds-mit,div-scrub,lock-harden,
 >              bhi-dis-s,bp-spec-reduce,ibpb-alt}=<bool> ]`
 
@@ -2574,11 +2574,6 @@ On hardware supporting IBPB (Indirect Branch Prediction Barrier), the `ibpb=`
 option can be used to force (the default) or prevent Xen from issuing branch
 prediction barriers on vcpu context switches.
 
-On all hardware, the `eager-fpu=` option can be used to force or prevent Xen
-from using fully eager FPU context switches.  This is currently implemented as
-a global control.  By default, Xen will choose to use fully eager context
-switches on hardware believed to speculate past #NM exceptions.
-
 On hardware supporting L1D_FLUSH, the `l1d-flush=` option can be used to force
 or prevent Xen from issuing an L1 data cache flush on each VMEntry.
 Irrespective of Xen's setting, the feature is virtualised for HVM guests to
diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index b84cd6f7a9e1..954ba3b1799b 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -297,7 +297,7 @@ void save_fpu_enable(void)
 /* Initialize FPU's context save area */
 int vcpu_init_fpu(struct vcpu *v)
 {
-    v->arch.fully_eager_fpu = opt_eager_fpu;
+    v->arch.fully_eager_fpu = true;
 
     return xstate_alloc_save_area(v);
 }
diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index 505e3ab863f0..8f82533c416a 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -79,7 +79,6 @@ static always_inline void spec_ctrl_new_guest_context(void)
 extern int8_t opt_ibpb_ctxt_switch;
 extern bool opt_ssbd;
 extern int8_t opt_bhi_dis_s;
-extern int8_t opt_eager_fpu;
 extern int8_t opt_l1d_flush;
 
 extern bool bsp_delay_spec_ctrl;
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index dd0413e1fc13..bc8538a56f0e 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -61,7 +61,6 @@ static int8_t __initdata opt_psfd = -1;
 int8_t __ro_after_init opt_bhi_dis_s = -1;
 
 int8_t __ro_after_init opt_ibpb_ctxt_switch = -1;
-int8_t __ro_after_init opt_eager_fpu = -1;
 int8_t __ro_after_init opt_l1d_flush = -1;
 static bool __initdata opt_branch_harden =
     IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH);
@@ -104,8 +103,6 @@ static int __init cf_check parse_spec_ctrl(const char *s)
             opt_msr_sc_pv = false;
             opt_msr_sc_hvm = false;
 
-            opt_eager_fpu = 0;
-
             if ( opt_xpti_hwdom < 0 )
                 opt_xpti_hwdom = 0;
             if ( opt_xpti_domu < 0 )
@@ -336,8 +333,6 @@ static int __init cf_check parse_spec_ctrl(const char *s)
         /* Misc settings. */
         else if ( (val = parse_boolean("ibpb", s, ss)) >= 0 )
             opt_ibpb_ctxt_switch = val;
-        else if ( (val = parse_boolean("eager-fpu", s, ss)) >= 0 )
-            opt_eager_fpu = val;
         else if ( (val = parse_boolean("l1d-flush", s, ss)) >= 0 )
             opt_l1d_flush = val;
         else if ( (val = parse_boolean("branch-harden", s, ss)) >= 0 )
@@ -648,32 +643,30 @@ static void __init print_details(enum ind_thunk thunk)
      * mitigation support for guests.
      */
 #ifdef CONFIG_HVM
-    printk("  Support for HVM VMs:%s%s%s%s%s%s%s%s\n",
+    printk("  Support for HVM VMs:%s%s%s%s%s%s%s\n",
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM) ||
             opt_bhb_entry_hvm || amd_virt_spec_ctrl ||
-            opt_eager_fpu || opt_verw_hvm)           ? ""               : " None",
+            opt_verw_hvm)                            ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             amd_virt_spec_ctrl)                      ? " MSR_VIRT_SPEC_CTRL" : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
-           opt_eager_fpu                             ? " EAGER_FPU"     : "",
            opt_verw_hvm                              ? " VERW"          : "",
            boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM)  ? " IBPB-entry"    : "",
            opt_bhb_entry_hvm                         ? " BHB-entry"     : "");
 
 #endif
 #ifdef CONFIG_PV
-    printk("  Support for PV VMs:%s%s%s%s%s%s%s\n",
+    printk("  Support for PV VMs:%s%s%s%s%s%s\n",
            (boot_cpu_has(X86_FEATURE_SC_MSR_PV) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_PV) ||
             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV) ||
             opt_bhb_entry_pv ||
-            opt_eager_fpu || opt_verw_pv)            ? ""               : " None",
+            opt_verw_pv)                             ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_PV)       ? " MSR_SPEC_CTRL" : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_PV)       ? " RSB"           : "",
-           opt_eager_fpu                             ? " EAGER_FPU"     : "",
            opt_verw_pv                               ? " VERW"          : "",
            boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV)   ? " IBPB-entry"    : "",
            opt_bhb_entry_pv                          ? " BHB-entry"     : "");
@@ -959,75 +952,6 @@ static bool __init rsb_is_full_width(void)
     return true;
 }
 
-/* Calculate whether this CPU speculates past #NM */
-static bool __init should_use_eager_fpu(void)
-{
-    /*
-     * Assume all unrecognised processors are ok.  This is only known to
-     * affect Intel Family 6 processors.
-     */
-    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.family != 6 )
-        return false;
-
-    switch ( boot_cpu_data.model )
-    {
-        /*
-         * Core processors since at least Nehalem are vulnerable.
-         */
-    case 0x1e: /* Nehalem */
-    case 0x1f: /* Auburndale / Havendale */
-    case 0x1a: /* Nehalem EP */
-    case 0x2e: /* Nehalem EX */
-    case 0x25: /* Westmere */
-    case 0x2c: /* Westmere EP */
-    case 0x2f: /* Westmere EX */
-    case 0x2a: /* SandyBridge */
-    case 0x2d: /* SandyBridge EP/EX */
-    case 0x3a: /* IvyBridge */
-    case 0x3e: /* IvyBridge EP/EX */
-    case 0x3c: /* Haswell */
-    case 0x3f: /* Haswell EX/EP */
-    case 0x45: /* Haswell D */
-    case 0x46: /* Haswell H */
-    case 0x3d: /* Broadwell */
-    case 0x47: /* Broadwell H */
-    case 0x4f: /* Broadwell EP/EX */
-    case 0x56: /* Broadwell D */
-    case 0x4e: /* Skylake M */
-    case 0x55: /* Skylake X */
-    case 0x5e: /* Skylake D */
-    case 0x66: /* Cannonlake */
-    case 0x67: /* Cannonlake? */
-    case 0x8e: /* Kabylake M */
-    case 0x9e: /* Kabylake D */
-        return true;
-
-        /*
-         * Atom processors are not vulnerable.
-         */
-    case 0x1c: /* Pineview */
-    case 0x26: /* Lincroft */
-    case 0x27: /* Penwell */
-    case 0x35: /* Cloverview */
-    case 0x36: /* Cedarview */
-    case 0x37: /* Baytrail / Valleyview (Silvermont) */
-    case 0x4d: /* Avaton / Rangely (Silvermont) */
-    case 0x4c: /* Cherrytrail / Brasswell */
-    case 0x4a: /* Merrifield */
-    case 0x5a: /* Moorefield */
-    case 0x5c: /* Goldmont */
-    case 0x5f: /* Denverton */
-    case 0x7a: /* Gemini Lake */
-        return false;
-
-    default:
-        printk("Unrecognised CPU model %#x - assuming vulnerable to LazyFPU\n",
-               boot_cpu_data.model);
-        return true;
-    }
-}
-
 /*
  * https://www.amd.com/content/dam/amd/en/documents/corporate/cr/speculative-return-stack-overflow-whitepaper.pdf
  */
@@ -2221,10 +2145,6 @@ void __init init_speculation_mitigations(void)
 
     div_calculations(hw_smt_enabled);
 
-    /* Check whether Eager FPU should be enabled by default. */
-    if ( opt_eager_fpu == -1 )
-        opt_eager_fpu = should_use_eager_fpu();
-
     /* (Re)init BSP state now that default_scf has been calculated. */
     init_shadow_spec_ctrl_state(get_cpu_info());
 
-- 
2.53.0


