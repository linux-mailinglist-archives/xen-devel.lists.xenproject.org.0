Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKRbE7Mls2nMSgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 21:44:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0052797EB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 21:44:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252995.1549426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0mt1-0006y5-HL; Thu, 12 Mar 2026 20:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252995.1549426; Thu, 12 Mar 2026 20:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0mt1-0006wV-Aq; Thu, 12 Mar 2026 20:44:03 +0000
Received: by outflank-mailman (input) for mailman id 1252995;
 Thu, 12 Mar 2026 20:44:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBWs=BM=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1w0msz-0006Bj-NL
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 20:44:01 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 327e1d0a-1e54-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 21:44:00 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by PH0PR03MB6870.namprd03.prod.outlook.com (2603:10b6:510:167::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 20:43:57 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 20:43:57 +0000
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
X-Inumbo-ID: 327e1d0a-1e54-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCUmT5gviEyKBzndMK6THM3brdJ8BIZWpsTG9nUEckB3641RlhwyGMrDestVRvEN5ituHGrswBqmnvCNfIXKE1yaetA5QAU0xSrDT9BaO7I/LgrVKigdYEbQw6ktYjKRRS7UwfGaH8F+o1YtqFpLhQl5gqgo9cx/SW+mtLim+Kh44XuBU6M68bn112AG5CzhB6Qgjnkoe8em51PY2f0IW+Beom0AI0MNJOIDYqvDgtfpi+mf1qPQPoaI0s2Rg7hAoUdcUa2zvErV6nPtcSGECOzOr3V+1fwO3V3iV6uwfibRUS/JldJNuBhE/ykVAFLyTg0ZdOguQPUqRq+R2mhCCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bnrZNvGq+Vb9DJ9a2Zhmk9lhgnLVZNUoXX5pa4kBHY=;
 b=NMoHz/3Y6427ofoyaQogUTxEBuM7UkDFFDxCAaws21wUIDkeNZntvHEttiuWjXWvMq3xGfpHCT/c9ua+I6GYtY1lZJ8B+9AVxvfbr59GZLvrNPB6xLI4x1JKqEdF51Ywzx8orjb/e+7t3bWdkGgN+NnvWoKjc2d5WTUwLajk3PotolkPeG43iU8bbQ764C30ROEIUe606hYzmyCzqPEOje+yOS8tnKfpY70RuD+FnTi9dYnQDxnYr3WYzCdUeW8dGkRm+umRCu0XPG8T9rVBdqTfHffKCYnyxwqgCgImEscyCtFeoSDZKgnm+hy6jhy8s41RQeSl2VgLfIhKuR5spw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bnrZNvGq+Vb9DJ9a2Zhmk9lhgnLVZNUoXX5pa4kBHY=;
 b=tNaK9LuNPb/DLthJmIzTXIyIQZGx5NFPe535tuFLHKg2oYVMOy481cBXetthyBoj2GphPRwrSokXkska5gPek8K8dhP8V8ZDSvgAvX1kIR9fxCRDRFkkIr1/P5AZOJfKLbNrbJ3IZzQ8RKZFXufoPvra/yrSj8P2PXiHe/fIXO8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v v2 3/7] x86: Remove Intel 0x65, 0x6e, 0x5d from VMX code
Date: Thu, 12 Mar 2026 20:43:35 +0000
Message-ID: <20260312204339.740403-4-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260312204339.740403-1-kevin.lampis@citrix.com>
References: <20260312204339.740403-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0202.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::9) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|PH0PR03MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b828d5-4979-4d03-266e-08de80781507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	vYGxs2EtMFW7PeqeaOA4GmxuWQrMO9lswagB8V1ippmHZaJo9/N58JRoLqRXYTCU1deDwSWHF5HtVsZIFwXDVlJi49PRe559TVhAs2GTpolcs+4OAPYLjex2iSFd6TmAfRVbrBl9zAvj7IdKEPCLC27lPBf0N9+GcFHTK2All291CXFxHwWwHSlz1AFDtcqbFtx2KV6vbIqRX0Wg7bWPzZCxSHQk4xl5eGlXJEX69tN2xU3VEa6NzrC8i+oNhnCzBfx8J0/w0v8rYj/9nM6W1lXKSDqnC/1nfINbJlVZKUlVX9+j0qHvmqb9GRAlBTP4kkr8ETvJW6TmYN+TwA3GIVJ7BXEkvtBHfemCe/TzUSRfSb72AUZa4o0tI0vRyYJcer1YGYkFfPDaA+ThDIWVfW1DRNumgcSmpMgA3R5KAC4CUxqrqdA1WAGAzCPDwPFTdog863gkQEB4ay+zbIYlw50/zg7lFb1E6munam1swv6lrGu4wcO5CHugoSZuWR2TdhI2iFZy/EHpdCMjHiN5K23lxDUmTQ3rIfCyK1MrPejUeq99bqVGc0fxjFsoGyWf5BuDsd2cGRcrnJwuCD7EPr8Ad7z/1aU5aMq8AF2t8nmiFdm763zgpndWkYXt/YQPdIxqVR7dqpjldYcMOaSPMh44aTbYuT9oTiNsfJQIHclU9KBtdkpYHSxi5apCbTZ3+3h2qmITobMJNLhFfswD/nAxFDN7sEPDNRj1Nvf9lOg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ATVvHdzGKSuWZcgtC7OhA3XbBoICBCoXZ8fejyS9EIE+Q3IJdnEA8BJHLxjc?=
 =?us-ascii?Q?BsBDxb/HJl/WKCmAW5jddTt+omthl8VS5+etj+tuT8xMpmxmNwI0HTnW6349?=
 =?us-ascii?Q?1sVpa51sirFeedFED3ZWVnlbORLukWulQc57bXgwnfXhYloxkUAPvQSkADnl?=
 =?us-ascii?Q?FNgnhMCepb1/rke3dCV9mJKa110OcnKrS9lRlLzoNhIjvo55YLKog49oUdK2?=
 =?us-ascii?Q?V+jUFtofqSANHdKBIkJ9wveuQOJQHbcLQLRh2EeP1lbDJ/OQ6bQJXgfCEi+d?=
 =?us-ascii?Q?rWDcv4EwsefSIrT7r3tvBUKZjc7DgEEJTVRvJJ+WTYp4Z8xPgPfp8eHpL7HE?=
 =?us-ascii?Q?jRgXv0zIAli35FOwJtOB6shY9Yp2oWM6qMcc+P2Z4EVzJIqfgXz/V2jbcbCW?=
 =?us-ascii?Q?AxAeiGUDWObqchYpA70bFhIY1MC59Z2yjECz1BnEDuQ7xqfKkM/nMjE54bQQ?=
 =?us-ascii?Q?21GyBaOS8Gn1YHwZA5a6QcoliHTzIO6pNpUGYAYUMClHhG+hxXsBM4n7k6Ty?=
 =?us-ascii?Q?/udSsgjEMkjxHuq0ufyYh+WyiKdRLjwbnGLqICosZYCRNt2n5Cp/0LCpPjnZ?=
 =?us-ascii?Q?z4641L1t6FZCuLLQT/uzhnku2bBkxmRXx05A5ldUiodx1q+MVaxK6yyR7siI?=
 =?us-ascii?Q?ZKpzfC4pEEw+GCcHpBiAmNXm99vVxdrFtoxV7BO2J5naoqaLJ0Z6vL0gQj4p?=
 =?us-ascii?Q?WjUGyqjw+ogwZ04ptrj8arD9CLZ5MKWymflsl3uEhpYG3tQjZDlXJqmUGSG4?=
 =?us-ascii?Q?ycsCKhSmCkInHbx60jG04GFTccaYQyeYRA2vx2+5uhzGPDsM1j5s2cJNh214?=
 =?us-ascii?Q?hz5MZJPUOdEAeNqz4NU+MBD2nr64rnZnmT8y2auXhmCAkYz65N9b0Olxn662?=
 =?us-ascii?Q?AKJr2liRoBgvohcG+X74+1jI7SCkcdr6d0fGL+Uwy6HGXKMo8f8YfdCQBvNj?=
 =?us-ascii?Q?4eZypCmrltvTSLuDrgbcoto6zfcchPANzqigN3Ub9Eo8Zx0liptXQbEX/swi?=
 =?us-ascii?Q?Cjk1oBt97wduTkFASOQEOIz7W94J+K4OLZxBbpYZQbBidH9yh11eKy71oL7c?=
 =?us-ascii?Q?pcFVSWKMC40BgTM+DqYkAQYFov+e7re4UDObRYIsMbR2eIRFfq18yZlqS1uD?=
 =?us-ascii?Q?n6qnT8uscylFrBEZOd+jM99zT9vHtkC1dYmR7TcTfxhcHeoBz1S6PJfkmfpO?=
 =?us-ascii?Q?FkFLbKaSBdPQ7VF6N80+zPj0E6h6VbmQsiux30rGwYgbictMnYcoJ24beHvB?=
 =?us-ascii?Q?uW+h8j7ypyK392COoY2hs6HGFmgCmkcFaXER1uJyigbf1QM5qfvV0szzFPBU?=
 =?us-ascii?Q?Ytl+Eh7MsxSBxqwr9pFqO58LLDSP5LOi8QoJhJf+tm5NhMH01EsC16VKyA9y?=
 =?us-ascii?Q?cG9HVEUfgGRmLGN1LaFrar+G+r+8Qh32QMmbNFoVgD0ksEav4aIh9Dt7pvts?=
 =?us-ascii?Q?CR505RnMVF6zSP2MW//YOlVqZsRV7oNZYEJXKCNnr8zuhPo4p/g1lT7EdUWZ?=
 =?us-ascii?Q?EZhfSG/antutHyIC/aIlmZK2mRVHgRI7ztMW+MOUigWeRt9vO6zDUULw9fmG?=
 =?us-ascii?Q?BcYmBp5QgqYZkSMbX0oTQHJZQqJ64WfhjAhBleeuWxhxuPvyqEvTiLS0quWx?=
 =?us-ascii?Q?D1Y1YSmy6jewfMsZBsfbmUFxtOmDLgSViI3OYIWo4Mk4ZAl7wIQKF+Q3Imrx?=
 =?us-ascii?Q?2fo7sJdKRFLNt0MSXtNOZNXi+qhraZQwzndAm5C7lcVkZ7CsJuKaePoMoyPv?=
 =?us-ascii?Q?I8TzM85dfQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b828d5-4979-4d03-266e-08de80781507
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 20:43:57.1308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/yPSJECyAI5YnuPjia7ZCBY3CD3hOg3JgAyYBnJt56EoOBqsxvhO7agQPmjm45yMhIv0rnnqLLhA4TTngVEaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6870
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9E0052797EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These Intel models were used in cellular basestations and not regarded as
general purpose processors.
- 0x5d (SoFIA LTE AOSP)
- 0x6e (Cougar Mountain)
- 0x5d (SoFIA 3G Granite/ES2.1)

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- New patch based on review comments
---
 xen/arch/x86/hvm/vmx/vmx.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 82c55f49ae..e45060d403 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -550,7 +550,7 @@ static const struct lbr_info *__init get_model_specific_lbr(void)
         case 0x1c: case 0x26: case 0x27: case 0x35: case 0x36:
             return at_lbr;
         /* Silvermont */
-        case 0x37: case 0x4a: case 0x4d: case 0x5a: case 0x5d:
+        case 0x37: case 0x4a: case 0x4d: case 0x5a:
         /* Airmont */
         case 0x4c:
             return sm_lbr;
@@ -3126,10 +3126,7 @@ static bool __init has_if_pschange_mc(void)
     case 0x4a: /* Merrifield */
     case 0x5a: /* Moorefield */
     case 0x5c: /* Goldmont */
-    case 0x5d: /* SoFIA 3G Granite/ES2.1 */
-    case 0x65: /* SoFIA LTE AOSP */
     case 0x5f: /* Denverton */
-    case 0x6e: /* Cougar Mountain */
     case 0x75: /* Lightning Mountain */
     case 0x7a: /* Gemini Lake */
     case 0x86: /* Jacobsville */
-- 
2.51.1


