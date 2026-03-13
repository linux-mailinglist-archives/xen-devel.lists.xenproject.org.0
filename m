Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLH4Iy89tGmDjQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:37:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E12287254
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:37:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253997.1550012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15VQ-0005K3-H9; Fri, 13 Mar 2026 16:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253997.1550012; Fri, 13 Mar 2026 16:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15VQ-0005GU-DU; Fri, 13 Mar 2026 16:36:56 +0000
Received: by outflank-mailman (input) for mailman id 1253997;
 Fri, 13 Mar 2026 16:36:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rc6w=BN=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1w15VP-00040A-Fu
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:36:55 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d75fe006-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:36:53 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by CH2PR03MB5271.namprd03.prod.outlook.com (2603:10b6:610:95::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 16:36:46 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 16:36:49 +0000
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
X-Inumbo-ID: d75fe006-1efa-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7JoNPxH48fj35dgdyeqjZkIo3VFqKVkXgplr8xQBO3d2xxEm/tvztb5ZARvw0uukrt/nLuSN6CFCK5frQGkfq6KLpLsAKOALoloqiJt7VNQuk3XP4rsa88/lf+QppD9AaibxwA6Dn8tU8lq7wYM7j4Zh1uc1fTuH1ntxudmiAvoG4+abEmvty26BkPxV/h/4B/1NIc/53tMMYhFtYR2tQUgCZ1XqhvEyvH3oK2rRS3xBeyBn69PuM4FjRn5YPlvfGwxGqlDkR7yeUxJqLz59pdK/O9/Eei0Iw5CMOmxD3ORGmozi8xmia07yONmfuuGIJ0+208KBlLhGeuLR2dScg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKvNKrMMq+iJ/izQetqNBCBeOqEbJlez3gi0nUvgvwo=;
 b=uk/9HA3EdRKnlrqG1OJiL0X7WcF/IW0/tPfqr1sQRWvDfqrrqb+jeCu1ZlgiUR/uo1q8bBQ+8AzGyWx1h8mUZqLX+KowhZbSIjFl30JbG6fs9Nff54bUiZolifkDTDrgqjr+ZNwCQL+pFlvh7i+6UavOQQr+BgqWRScCC/UTMLhECgn1Qs1NwoHhkXiUkSIKkKgOiCaXKwhbIwuI3WmS6v8KJMFVM0VJ0fNBDTuJZLatj2KEqOrzGucZX0IaMEeMYzLMmBXCCZkCaXCKUVlN034Lwtt9LDjIovbnOaHQ1eNo0FLOgyF1eHR21GGNuaEvkBFDfqt+aLv6nCn6uJt2SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKvNKrMMq+iJ/izQetqNBCBeOqEbJlez3gi0nUvgvwo=;
 b=cZAvpEzNJBY1rrMRCeYMSf0sQiZ+KzaY8m4uQtlDZ5cqQNt35tsAKc9XfcAg7NdiKIWJohagW7hpoIt6ZpGRt1AYqDb6PkHiPtKPJYbxg5bTUAHjncDqGLOELJuQU0LOS6uuOVhDxoOdP2JngyXC2LhroHh22v7LfZVgW+lRbBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v v3 4/7] x86: Remove Intel 0x65, 0x6e, 0x5d from VMX code
Date: Fri, 13 Mar 2026 16:36:27 +0000
Message-ID: <20260313163630.1073019-5-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260313163630.1073019-1-kevin.lampis@citrix.com>
References: <20260313163630.1073019-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0028.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::16)
 To BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|CH2PR03MB5271:EE_
X-MS-Office365-Filtering-Correlation-Id: 3825baf0-e1a8-4b41-fe06-08de811eb975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pbkr5dipB2INxc1S0hkt4JH2SQeFUF23E3MtRq3kZfW/g+INUQspug16zCyyTU6f98FtY4A8xKkTDYuATsw6h6N36o3pApc78wkkGK+kCQ58tyE3b/2KKxpCQWSr5/HRcVKi8Gb7sIK6sS1f17Ds/EdGmD6DEM0qDH8hLo+7iPShKIrDNNDqzR+QiNdiOo4dHv10HNNMaeWgCOnBP4AtyUAsTfnFW0N+m2FAXEsqDIEgpYtLrYyC8hdP2fvPWNGj/VYpyRahDRPUudOzEErt/fcud9iYjnUWuPY+zwAyIUxtP/fK6htD8LGRqQeSi6OrcDqfh4IJggTySrfv1ciFd0lsAIutHkZKJyBiQe3ido7GRuy6P/QTppcQcFiN/BG/f0t27Afe+ta1wm0rlV4F9hiGB162weaRCUGAZP243buvx1DaYAejCHuZ1VScY7YPgLDVttJcdRetC2JKtRJch7CZnuIjtEo4g08qO42NqLe9HFkmTfrzeK1u8l6ncO2h+S2K4cI6KtUkdQmPDev2YabipURHTNmXEh/KwbrjZqQhKiCqrUM7eg4gm8gS+I0PTxwPN0T1tc2HaB6SGr+Lkn/U6JboG5JiG27iWEI327npOZnUzeZbS3VCrtpMKpsuFyVHhjDkLhjDyU98K6IsIhNsE7o+pSIpK8DhJuZY0lfCOhbqTmph6v3lTwoQN39KYHYEOKkghfW4kMCwsAnQhddnzaHD68doGDdtIToynXE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y3P6hoCSrWmXs0cSCGtF5b4fbl1jcEDQC2VN25ocmCZ1YiRbdCjju7KtktCF?=
 =?us-ascii?Q?cNjBbzlFNNqbSKCBPDb4Q+40n5s8KztPIHSvQoA3bra5ikUu/1UX6lVrZPrn?=
 =?us-ascii?Q?sRVzL/xCp8eOlgtqFBZUFsjsCVFM0g4niCzv8+WXI6Rc8CuNluIG6J8Yvj+x?=
 =?us-ascii?Q?mbFdcIzRhY2v2vJ8Cn09dWlUpLC+L9BH+jjQU2100JYn8XzAelOcFv2WK77Y?=
 =?us-ascii?Q?d1QkxKtYfYKoqn5y/kp7NKRmUPBI9RynucMhHooPC4SSdQaeBv4N14d7tY/k?=
 =?us-ascii?Q?mnmoOH719PdS7vL0rV8n2Mw+NYxe7XhaCniZW3tuhlu278CnRqpipkUqn882?=
 =?us-ascii?Q?JfWOOIL1U98I9scEYePcXLwe0pnLBPNvFXO+alT/r1a1sbP62Zky6EPE+NsC?=
 =?us-ascii?Q?mJzfJZk7DFBlnx6tqlLpPPTbDs0KRnvj3gyej3UnclD/RbbTQx7byPlH4bpP?=
 =?us-ascii?Q?Qdjjc11J8kVJuQVCpdbk3tfj3ePmbwd702RXQDVL2YkTsPPlhBItwI5sHUH2?=
 =?us-ascii?Q?2cD9Sl1apf2u+ZyH4XXImGngxwIUoH1l+tbo/lcrfR5KF0/s+oR+z82tIQ2H?=
 =?us-ascii?Q?aIJp/raqa7pBMxxsC2kHQDSF0szpHYOEGrYIro/zol769lr9Wjrm/RAXwevb?=
 =?us-ascii?Q?y21eQRsf9Bst64mWjE+GyyUlJSuD66qdEyYYOIy7NAEDE3CsUhqz0dFf/pg3?=
 =?us-ascii?Q?TmMGXO2cYMVEnl78fggesh8MSEtCZK7IdWaqJgLSnrZUtIf/odj4RH1jV4yg?=
 =?us-ascii?Q?C488gAyrDZHdWU4Z/jWc9VfHNnqK636BGBM1LnArIhF5eHnOFilUYe6ewKbC?=
 =?us-ascii?Q?EMNhENJcfl4VNSiJw/6f2yvKBxHVhP3NClpizukb5j6G1P6BI8Xun6Jx3yw2?=
 =?us-ascii?Q?G0IYX3GqQ/glgQLqqpwLcCF0jmvd/7AQ6Jpudu2y5V5TiHV+NDGOhCu7JJOc?=
 =?us-ascii?Q?qjrAl6MHEpoBmShElMMmItCe0htQrsp6gCZIAe192dWS9IwasH+uwzZHNPeD?=
 =?us-ascii?Q?CwivpnYcK2qR/z3SGQ2Z03vv+h3ZQHhgNo1IIIuH+z5IeIOLw3MYXqZOHedv?=
 =?us-ascii?Q?Q1z0+HqjJygxgZgbJDwOJvE/dKBFbkA2/NwbYVsYqYX1PK+vJjvVGdZp4o7H?=
 =?us-ascii?Q?mbxTFvIAOltwBS9GQynB72yXX5O1zQMCfDyUjnZ0ijk1C9vnNsNyjYa8kPYm?=
 =?us-ascii?Q?90GlMvW7Byz8k2LisIxMn33W1fX8SvNVCgp7hqR/KHqeUI2XKwnUxLcnDUA1?=
 =?us-ascii?Q?NW3I1jNuDSRiO8eN0DmdM1J5fkfk5jmgnBEtJ9XdRF9yWx3+asTFGTuOZfmc?=
 =?us-ascii?Q?Pfr6TVu7I2/d4DgtSvnTb4ksNpjRsLXYCWyQtMLlbz6M8QHFiwCT7heNGrWF?=
 =?us-ascii?Q?ialQq+PlxT0O9WFHtmMWsUMArN8E5j3ON4lQuSapxyz9DxTz68SdiO+iRdxM?=
 =?us-ascii?Q?6p4gngC5+HPLQhM7n9dzAj0KLZ2r2mYnxohxoKi2RB33yyIirww8uOMaXj8q?=
 =?us-ascii?Q?pT8y4B/r0ewMNjuerRRfjJpEKjM7j4lmYiqDfG2TizUgW0Mk+qIIhfl9RGfK?=
 =?us-ascii?Q?wZxZ6DqrMLKNsspER3L08CHk2MJnm2yuNNcQ2l7Nsf1nnouSF01Kko25/kcj?=
 =?us-ascii?Q?y2GjagDBWaV3O3lcKjDHBZVFOovAv3OiXavmHetpRCr+Z8OMtCgl1BAZCHp0?=
 =?us-ascii?Q?xRDbbnA1SCjfJz156TzGWQjdNGk09jujCunsqlp3beEIaCoVi7gzZDS6wxRz?=
 =?us-ascii?Q?o8Kv1uHIpg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3825baf0-e1a8-4b41-fe06-08de811eb975
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:36:49.5714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sty4+Y5YKAgLAXc6YQvd7+EGQaYQDZvd335o6QpOP/1i+fJzlZvtvqDTkuUUVAHCeX1O5On78018vWLI50ONAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5271
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
X-Rspamd-Queue-Id: 47E12287254
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These Intel models were used in telecoms and not regarded as
general purpose processors.
- 0x5d (SoFIA 3G Granite/ES2.1)
- 0x65 (SoFIA LTE AOSP)
- 0x6e (Cougar Mountain)

Model 06_5DH does appear in the Intel Software Developers Manuals but
Linux has declined to take these models into intel-family.h because
they're not general purpose.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- New patch based on review comments

Changes in v3:
- Expanded the commit message
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


