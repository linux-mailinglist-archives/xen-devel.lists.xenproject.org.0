Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJlSG8eNqGmbvgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 20:53:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C51B2073D4
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 20:53:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245965.1545327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxsHo-00010a-Mn; Wed, 04 Mar 2026 19:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245965.1545327; Wed, 04 Mar 2026 19:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxsHo-0000vh-Ep; Wed, 04 Mar 2026 19:53:36 +0000
Received: by outflank-mailman (input) for mailman id 1245965;
 Wed, 04 Mar 2026 19:53:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nfWr=BE=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1vxsHn-0007ik-KQ
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 19:53:35 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d39365d0-1803-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 20:53:34 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by DM4PR03MB6079.namprd03.prod.outlook.com (2603:10b6:5:392::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 19:53:32 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 19:53:32 +0000
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
X-Inumbo-ID: d39365d0-1803-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+DpwdNYvCUbuEZvQetU/o2rC+YTGyy7slJFQUX8uJS93iAevtdVC3v43og9tGp0SMS0D7Hw2wDt5ILyHe8WMhOdBaIxYly6PtZ9VcjsWhE3Pce5MZ37Bd7VUL2GCjSqkZHIA0q+q6osuFel0h6bewvuofefW4A2vdnTaZ4eNW1ARbLEHw0smk6abBJnoPCbXushu64o6okvfMWSmexbhKWkB4ehMJvctqvRSX6XoEUpzQki8Qxl9xtoVLt+VGx7AxQiXMaPraqPVCVCexn5hPul7W8xgVKliRfG6vvJcAueojknb7hFZ8WxoD8HxePhTr920mDHPst4GKvzSBBK7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnVnsWYWKG7SVBrj/TXgZDuFUFT7AP5TCSelHpEbdVI=;
 b=W+NuaJcYpALgg+ksN8YfAKWxHeLghoxvKf4kSgFPjYqCLjeg6URo/lTpFaqrM2fT3a+FdHQuv0uYAwrm2/lLLlT5MYI/4h+k36zfvh6a/bays+3iCfpXQcJd71RKdXzlDyzx6fzYlmzpnl1zvuXXgqxWdvE7BQrP6zff9XJztl2X5pC2AWqXS0YGOB2I/3RIdFf1vvWxFm9CThze1910sBjBDZhXbBPtP9cOcMrSsL92KUjnkMYI8Bz4gMhSlZemCkjrApgG5dDwZ5fYzdS7d1rTfIN1OrSiw0EB+CKOzkvYtz0NMzkflt9at8In8qcT2a6a5HYnzTibs3n7SJF4Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnVnsWYWKG7SVBrj/TXgZDuFUFT7AP5TCSelHpEbdVI=;
 b=LEBG8FLkSzNT/KVmvoYe+hqRNLdSLmiZkaiSiO9OTdMh9fH3XE1y+rfuNANmWQhh1gZIt29CtGvXb1+1xvOAaqNq9/zdQnq14y8HMv6SNA5R0AxxcZFLJjvYJHGxYyTtWUu/eSpgMtmfKioxeDNJogm3nELSI2QbunjPSU+RSE4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH 6/6] x86: Remove x86 prefixed names from cpuinfo
Date: Wed,  4 Mar 2026 19:53:50 +0000
Message-ID: <20260304195350.837593-7-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260304195350.837593-1-kevin.lampis@citrix.com>
References: <20260304195350.837593-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::17) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|DM4PR03MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: 9feeda4e-46d0-475b-0d4c-08de7a27b6f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	0BToux3SEX8HOCLeeSSk6r2QIFwTw8ptRRbrGV7CwdCDwNSnEENQtqasyhzvKERVTPKV4/d0yzp4246eLTwtyoMLHF6r4M4qBMec0Q6Neq2NwFvbaEPBunEXG3WbBT2CIg2nP4Fl9L79bXkaDjwPYa6HZWovCMYBGh8lKb3rzTELhn72/XAY3LvYxcf10s3i9OaoIzJG4tXg/tJVznXeVXjoUyjW6FMFTDE2vsC5TfEPaausPyEjO7Jimmfv9WAfDae15m/ZSRSb9h/SYifbLWp8fZz6pkHuHNrvNwLVhQzqELYCOS/LEWSzppMV0dHtQzP01XwZJKGLOYmddySv3rOwII4Tqd0usvS+opNpcSK190cQyRCyPxXdPNgqR0p5E/bwkWT1yk+g2q7PGJgbEdfRKXT7jq9lL30crbm1pQMmfdvhJUcfI7sqwIapoXYoeZYOenMDj5pFJnzmPRGgfivri1vS6e9x+uy1uJMCfg0HstuDVbrpFsKXh9G/o2RrbOkijP8L/odo8HiDuDyyWLXhAYpzjvTnCzRb3cf19MdJwsDS3Z76DQ8mccVyUYGzKeNOvKTqipqr6EXSKlRZg8Z2RlXpBCZpjxVO41KQJ33i2QT1FVQ8EiWoRCRKgPUVIvBNI/m/a4UwbmbH0vC+GluNQRnoRjBA/PsuON2EfqDAleURh8RlNXpFyHGhxjWGiLYW9YVJZ+jxUDKDXrrJwLZM14fhQihjgPWgzNNXjLA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?loIK/d+NJUcGvTov20LAbL4h+0pMICbvhCbwbVlIdxCoUHH9W3NZir6ndFxe?=
 =?us-ascii?Q?tac9gWMcu3d7b/YoRLDbYPzvniQTxllMfvZLtXKAsSLofr/MGlmcAw+FXa6F?=
 =?us-ascii?Q?L9JCqpgwF3cUqf0dQ2PL7kCMtLYAP64OmCFZtehKhR+sBg8M0rW8/+Em2hX4?=
 =?us-ascii?Q?CCHbwX6HaL0EUZL77zwFNIZJ4up2ucW+ldnprEXFLuiqGdhZJ9mVtf2uRtar?=
 =?us-ascii?Q?hGvpK57bGXO7BsrXxPTvlu+vN5ZfcQA9JDBtlCgypSDS2p6nGV7jj9UOC7AC?=
 =?us-ascii?Q?Nj8S6BKxX9cuADNr0OdUaZT0eNwZP/xkRGJCLpUjKkdZisjP+EjQMSWTdXZw?=
 =?us-ascii?Q?QEeoFd+6cLNCsIZDZraz0u69WZbMO+05mA0aet5x0OpWFs5CeDKDjHRYSs8H?=
 =?us-ascii?Q?+6z2TmO5DHg0WQKP1ejoSO+kDV0gmC1QsRDcvdPM5lRuX2QP332WD+Nj/muj?=
 =?us-ascii?Q?rmzOg0+aslSdCeHnvAkKiEjw5GRTazILyqJ29clfNPkTjYMERG3NKdwktu/A?=
 =?us-ascii?Q?8SSwKSX9SKW1R4TPUQ+8wxPJCbIZ/4+XQXncR7Ot2uwpfrvLBVRVCHOoLuuz?=
 =?us-ascii?Q?wH22YAu3S/5TJm5exuzKQTK2WnEiPRJV6gB64D/ZqcxeIwwL1F0fw0i7Vp6h?=
 =?us-ascii?Q?yb/yMM61AXif9eG1Tn2mIGtbKJ5LkzDnnoj5pAWTiIgq2E7GxERt9EocEoxh?=
 =?us-ascii?Q?ZTMNinw/tj78e9PLEpaNmduYJJo3njCk39i7d2chaI9Ib9EINQ0+lhuxNJqc?=
 =?us-ascii?Q?Woj/zIf290KdQWIfWbqaZffrB+6+LoExsVgFvPWrTKw9IKpnX1J73ARdOy6D?=
 =?us-ascii?Q?Y9iTI8oMBXX+cQrDt79YUZ0KhIG0tVefB7gx/pjT48SEe4/DUCcQ2AFJl53i?=
 =?us-ascii?Q?tJEkbokwHYl+s+eg0kgkxJQW9pnHQEuwPaO8fD7fXPIGlAhxyxIP3rmaw54A?=
 =?us-ascii?Q?4SBeSw17nbPQZhDsPGMIVEpv30CPJoFpZ73qb3tV0z3R81aCIFvpBpiLc6aA?=
 =?us-ascii?Q?IWt9wnYL4ze96PT8WpLJNrJ7vFDyFIMMSedLIPx6TG4xl8kISABl7D0M2YR+?=
 =?us-ascii?Q?dvRiBLPXO5bkCf3N1AJu7CHSOMDWkJWG4aAcgmRWBvA2V9nZtFa2mVbo0+9c?=
 =?us-ascii?Q?rqlxVD85t3vZVUFeCFHkNqIKyJZ0lzQidrKN/lcBLjIk3rI0G1yuPl9r8sG+?=
 =?us-ascii?Q?Ng2Uw87lmRfyEtGNQvhfQU+FLybtueZXMOCr7kpUaTqhowY37dX1t4kC4blK?=
 =?us-ascii?Q?90m7epHt56tgS6XLZjKpGYQCX0cI4QxBfG7m9A0Dhkv3e3siEQOOUyluOD3V?=
 =?us-ascii?Q?VN6rzCxKb+SOadtJ+4m6n8LJtPu+l8xlTZpn92CxQMrN8vjsyKeKEUbmebit?=
 =?us-ascii?Q?2dGliWxFgsG1VvlXltBTAkh1ScaYR+lGSCUfO2m/lkLAja8PDZmPNtQ6bqdm?=
 =?us-ascii?Q?Fk/d//IEfiU0wTqvjgka3GK39b73rJYkDQbPYj9+r+TjnWIIbFSfnOr6+VsI?=
 =?us-ascii?Q?AISJstRWlHIENo+VQCqHZS1YwdueBJyrrU2VcNSqMm5WT+6IJfw0pQiQeOVd?=
 =?us-ascii?Q?PgZXBo/xEJgsvtlVzoW5XpRUbYYNS+VL2fZm4jnu+ZaS2InAksVZr055zRHm?=
 =?us-ascii?Q?lFNYbbRJtE93LQIR3f4PZ617YNZkMb75ZqauISn07GcqqpgLkApiRqH6CX2B?=
 =?us-ascii?Q?O0E2TRSf//VPbF0ccWCucFMfHnWcuU+/eR1Rgr0JT+VyqAjkS3HYWAoBuWKB?=
 =?us-ascii?Q?nfkDkRLHmw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9feeda4e-46d0-475b-0d4c-08de7a27b6f2
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 19:53:32.5625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bz+dXb/uCkyyrZNw5sh0LIA1sxMw1pFcDNUljzF4ZgKoBEimyNCTj9l1TMBTFqTtavgYueJP6SftzFr5MOed3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6079
X-Rspamd-Queue-Id: 1C51B2073D4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
With the first patch for intel.c this now compiles.
https://lore.kernel.org/xen-devel/20251124111942.1325635-1-kevin.lampis@citrix.com/
---
 xen/arch/x86/include/asm/cpufeature.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index dcd223d84f..09b1118cea 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -43,19 +43,15 @@
 #ifndef __ASSEMBLER__
 
 struct cpuinfo_x86 {
-    /* TODO: Phase out the x86 prefixed names. */
     union {
         struct {
             union {
-                uint8_t x86_model;
                 uint8_t model;
             };
             union {
-                uint8_t x86;
                 uint8_t family;
             };
             union {
-                uint8_t x86_vendor;
                 uint8_t vendor;
             };
             uint8_t _rsvd;             /* Use of this needs coordinating with VFM_MAKE() */
@@ -63,7 +59,6 @@ struct cpuinfo_x86 {
         uint32_t vfm;                  /* Vendor Family Model */
     };
     union {
-        uint8_t x86_mask;
         uint8_t stepping;
     };
 
-- 
2.51.1


