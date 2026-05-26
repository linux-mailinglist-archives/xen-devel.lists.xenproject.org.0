Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6C7ABQOVFWp9WgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 14:41:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B47C75D5B28
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 14:41:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319835.1587314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRr60-0006LX-7P; Tue, 26 May 2026 12:41:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319835.1587314; Tue, 26 May 2026 12:41:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRr60-0006Ih-1m; Tue, 26 May 2026 12:41:20 +0000
Received: by outflank-mailman (input) for mailman id 1319835;
 Tue, 26 May 2026 12:41:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wRr5y-0006E2-Ia
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 12:41:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRr5x-00GcHe-UZ
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 14:41:17 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a1594e1-2eae-0a2a0a5409dd-0a2a4504c02e-40
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:41:17 +0200
Received: from [40.93.194.33]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a1594ec-1dec-0a2a45040019-285dc2215851-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:41:17 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SJ0PR03MB7128.namprd03.prod.outlook.com (2603:10b6:a03:4e7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 12:41:14 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 12:41:14 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AMNwPw6Wh1L3irFcfTAMRSniApzFzrb+G7QrhcNyl4XvIfheVnvz7iR6eY3+qoEcyiYULzJ2k1/4q5DpOaGTYdgO5mnlVkJf2WhaS9ipBjbbjcrOfbkpB67u38a8R/797Q9IlOXxGiBC68LokXtz2dmIPw7u0JHMWgRUEnH4liYnCYsMtEf9ILmmRMUvWEntht83j/tQOzyVtQmbZbmWaHETnx9YiTNTIgSF58hASlK2316j8bvV1Zs7LZi9Fb9Ql0JVv2ksWAet9zMewA+tQX5R0bzDbTXB3b45TK2kM22eGAgJ/TFt2brRWmkMeCMrwWi6f96PJbjFGL2e/d0OLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6q4xOqMf7DWj9QDMbGFMqw094yOSXyRHKf8SQZEleY=;
 b=it6JOBZ5HqtKo75mHdDgdQKtYTtBKtFFDdxDdB7jaWW0ywhk4dkx9kbfLNUZKu8rz6TYp07HSHgChReErEwepyzM0aCZcvMvCiprtBP6JfmAujFt8XrpHiixUP0iHSzJhnEAUlxLwJKzd+ieEgSgdoHtGNPxUHP9exPclumR8mJs62pB+OrbE1+mwl+JEQlPBLs8WMAbKajNb5AgqodFunDz3a5Pj5MqnEfRIswDC+cRy7QUJ3pBc8Bjrb9AkJEyTkNoCb+5BZ4HJ5VsbG/4z24bk+0kdLODxOBi31sAvtMEeNMbSbXJEneXT9NRMW5snTdb5gqcBCZhkouwe5EYmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6q4xOqMf7DWj9QDMbGFMqw094yOSXyRHKf8SQZEleY=;
 b=hUj05kd1HnBrsW7ZdCEki6z1TkbDC/82oh7ITfgwdxoK/MhhWPSM7kHs4Hvr1L9RFqRBogkemlIl3QaPsatM6ugEzbkVtxKzHMnWg4RLvxJRE8wX41Hv6lRIcRuSKFUHUjd2VwKtdlnwjqd9YyO1IpMJPwfdyx72PqS1CBt5Rvc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v1 6/6] nestedsvm: Allow destroying the domain fully
Date: Tue, 26 May 2026 13:40:27 +0100
Message-ID: <20260526124027.573412-7-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260526124027.573412-1-ross.lagerwall@citrix.com>
References: <20260526124027.573412-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0159.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::20) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SJ0PR03MB7128:EE_
X-MS-Office365-Filtering-Correlation-Id: 5444aa20-f354-4bc1-8dd0-08debb2412a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	v+EXLnaEQIhhd+Yee9qxjeVWXwxJdXl6DECAvTKgPHozyvu4KVg8xNMDYhQCOIsKEwOFNk+cN2OGicW81+dXwYTTaD8wU5Oq2RGrHu+/QQBI4u6APbphw6rmJobHSes0B0UTsaJ4JuRHn7dcaIr72w5LvUAUHK6dUpxvzUDiNY/VyLgdJrKtPw/IOTZGKeiIhfuRovZ1JviePOQsyRoDDFp+yE5f6n0leVgRg78idEfgW5QZy88PoUluo4ekS2pYc2fv6UA2Zy8Vi/J0ybXPyU4pQJXlqpgDonVW9UP/6gNNjdSwfDK3Yr1TK2a3IPKjQpNKdvVF/tdPyLlXv+uDUXj2asAkAaBraE0IcFTOzaCXqdQsq3UK0RHcfK/18uxInMdSudjL6YeIJ8ljxWW+5/YejqNe7Xl0QVVFgkNAof1BxFAmg99kBx1GzFBrSNURqP+tRNLG4TgDQ23FWmmUsX3flQqI9T3vjhXsL25G5LlObvi8gzQ2aiMa7SNvgLe4Fk2lDo3+8DLQaPwcSUENPfHUGpYeNGK6RmDiGJdxha4FCeqouXw0umaEkWSfMtyOHG9pMmeadcBvsKSoA95qjsmQM4JYtdvBZlPiouzgPSW+L+On2tqcvFRSkP6fwnr6xC2RjGcIxh1yzNLDVKcUsUP/ng+YkTcaUS8P/DporhUZDlSzzdyIjMIQsul0OBk8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6T9azilw98jXlirA1UJRefzCEk24NSkA4Ong6B6rksQ3c88WfpgR12qKxnYx?=
 =?us-ascii?Q?cxpQKoW1ahBDUg+FO2HBs/4clNoPj3fBRnOltTkK9hy7vGbUVnN/RZpF5Vn8?=
 =?us-ascii?Q?K6Cgieq6X5RS1borI0rYZjAKe3GrrryVUp7Ypsmuam/xWGkfRJDiM2uM7q1g?=
 =?us-ascii?Q?6jLzWCU3G9v3FZvFgMS8Fzj1PIdnd2wqErDCPh8oMfE02GyDTgrfmsRt3Dtk?=
 =?us-ascii?Q?9H32+eq9Pf//fHp1ynL7AVIpC1ywgWvpMpkPx18c14HQsBY2Xu49u2a1TAVY?=
 =?us-ascii?Q?K4mdfOKld17YMbhCQUiU3K3IUjNleuYRZP6UbUqdXWw97olhwj8rmNsHGArE?=
 =?us-ascii?Q?tk7zogUvaU3TfWJGhRR6K+m5xLG4gPt0J2L/OGR1vHxTtmdRw70ayNM8i0Tm?=
 =?us-ascii?Q?jpYyVACsKi/rRv5Jiprf8Mt82R54L5I0WhZ0/Ei0Fc8eIjY3KeBAldtqQ8Tw?=
 =?us-ascii?Q?+LuopbUiTgL7OLBo41cwytAy0Zv2Voj57mS1CGnPKZ8bvtrFWZxMBrZWZT85?=
 =?us-ascii?Q?tIpvN8MkG9XXTT8PYWDcl4xk0xxIWUH6YFMe1hSsDqaGljkUbSEKKTc3NWWz?=
 =?us-ascii?Q?IHpkZ1aV6Q1/eG/X6EeEMBbK1xDADbE6647cO+J1LMK91NgOnAJZjKNtwA0P?=
 =?us-ascii?Q?KuJz7LnQCQSkxgB8TeYo1n9nQ/ycBV6EemSjU474Iq5H+bo5pv70tVDmMCNb?=
 =?us-ascii?Q?1JbfJdYfGoby85QCLsmtIHpardNPsKM8+aeurPDysbzTQkBPBn0I9gEyNM1s?=
 =?us-ascii?Q?sWFn6iYg/9HCk6JKTceqAfYW/sMFu8oGXcED2k9lAadZghWZeBtQm3Iiay2x?=
 =?us-ascii?Q?+CpK9RjMl8RoqBEymJ9Lv3r1Zn6Zg2K8C2Dx4sJAlIJJZlEfAmcI573jBwEK?=
 =?us-ascii?Q?yfDQBRYXXB4uwF85e26N5O7B6qcYmjftm0Wd5s8NYEJIltrK5/1oFEdw27B+?=
 =?us-ascii?Q?p6/JdibJio7wEzrhWAiDscz1ipgpm9/qFm6RzGLxotbGyjNG7bMS2EUjsH4Z?=
 =?us-ascii?Q?uVWFkEwm21DT6zYJyE2lgqgx9fdL7H92HO205IYZnfeSsTs3JbarMCnHqRTD?=
 =?us-ascii?Q?ff3x9kfR7dPBvKwaJjHE3Wo3gOB272YWay5mlkR5eDMsZQReqrP/QrY6WV5j?=
 =?us-ascii?Q?6Z6hfGjaekh4LdFqVeM3gD5WQ/3jri7torutaoQYRWyGOs4ZzvhYi35C1qgi?=
 =?us-ascii?Q?YLhcRghCPZS8NEmbrCyehlvGmhhYinrApuP4815rH0cmLcCGgc5E8Cl51qvM?=
 =?us-ascii?Q?T1hfUB0KErjnB3Tqj/oVIUDfvR1mgqMlxfHCDIfrBzpjoEGpn6wO0kKWLsD/?=
 =?us-ascii?Q?m5zHTtASfKZg3598JC7ALGHWWY/D05mH7loNwpUzQmLIrhNfHzTHcd93lQaZ?=
 =?us-ascii?Q?FcvT3zzEUOELa1P8IcNMSY+oLnZoy7PDII7yfbxh4YPXPVf+m+jb1w9r2yWj?=
 =?us-ascii?Q?1vrYf97rWbF5BM7IQiPtO5xCXxDY7QTuVU2ymZhYltWMYphPdoXfQQr9+jFj?=
 =?us-ascii?Q?jS7vRx0c/HJJESgZEd0oZEOiZt78dv5FHFLeMpecmoiFgK7zdFJ01M1zobIO?=
 =?us-ascii?Q?VeHNm7B5dH73vUTwnlZjm9CSD3wauilJiVB1YmUw8mf1Qj9WwQ+Z0q/LB6Oi?=
 =?us-ascii?Q?fvBOXiZNqOugF9KC7k1xfCuCJLhHIlY2GZn0KIe/5hz5/1v8/nQydL020ZN7?=
 =?us-ascii?Q?9d3MW0NZ+8shZtgU8xoOJjZjdOdnFAWvpx6be+f/gJO4TYaQBB1KiPijyAQ/?=
 =?us-ascii?Q?QHlDpZp5KEGC5hDasrQIIpKFOGTlXlE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5444aa20-f354-4bc1-8dd0-08debb2412a8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 12:41:14.1026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yH1+XuSgsFZNzDSGuQ6SH3H5p3/u2cjDyuRyCm+PQEq3gt5rXVkpoYzWmQ1Y1WBO5HvWYRU4eSlUfR+KzYMTJ3QhxjRjjLe/USOuGmAhns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7128
X-purgate-ID: tlsNG-ebf023/1779799277-4396A3FF-0B101CBB/0/0
X-purgate-type: clean
X-purgate-size: 2795
X-Spamd-Result: default: False [1.32 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B47C75D5B28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Unmapping the virtual VMCB is performed near the end of the domain
destroy procedure but the mapped guest frame prevents domain destroy
from getting to that point. This means guests that call VMRUN cannot
be fully destroyed.

Move the unmap of the virtual VMCB earlier to fix the issue.

Fixes: bcf557675d85 ("x86: properly use map_domain_page() in nested HVM code")
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedhvm.h |  1 +
 xen/arch/x86/hvm/svm/nestedsvm.c | 15 +++++++++++++--
 xen/arch/x86/hvm/svm/svm.c       |  1 +
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
index 9bfed5ffd71b..9bb04a043430 100644
--- a/xen/arch/x86/hvm/svm/nestedhvm.h
+++ b/xen/arch/x86/hvm/svm/nestedhvm.h
@@ -48,6 +48,7 @@ bool cf_check nsvm_vmcb_guest_intercepts_event(
     struct vcpu *v, unsigned int vector, int errcode);
 bool cf_check nsvm_vmcb_hap_enabled(struct vcpu *v);
 enum hvm_intblk cf_check nsvm_intr_blocked(struct vcpu *v);
+void cf_check nsvm_domain_relinquish_resources(struct domain *d);
 
 /* Interrupts, vGIF */
 void svm_vmexit_do_clgi(struct cpu_user_regs *regs, struct vcpu *v);
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index d4fd838ca0b6..6f4684f5c21b 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -110,8 +110,6 @@ void cf_check nsvm_vcpu_destroy(struct vcpu *v)
         svm->ns_merged_msrpm = NULL;
     }
 
-    hvm_unmap_guest_frame(nv->nv_vvmcx, 1);
-    nv->nv_vvmcx = NULL;
     if ( nv->nv_n2vmcx )
     {
         free_vmcb(nv->nv_n2vmcx);
@@ -122,6 +120,19 @@ void cf_check nsvm_vcpu_destroy(struct vcpu *v)
     svm->ns_iomap = NULL;
 }
 
+void cf_check nsvm_domain_relinquish_resources(struct domain *d)
+{
+    struct vcpu *v;
+    struct nestedvcpu *nv;
+
+    for_each_vcpu ( d, v )
+    {
+        nv = &vcpu_nestedhvm(v);
+        hvm_unmap_guest_frame(nv->nv_vvmcx, 1);
+        nv->nv_vvmcx = NULL;
+    }
+}
+
 int cf_check nsvm_vcpu_reset(struct vcpu *v)
 {
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 209edcba321a..e6b5c9ec3b9c 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2422,6 +2422,7 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     .nhvm_vmcx_hap_enabled = nsvm_vmcb_hap_enabled,
     .nhvm_intr_blocked = nsvm_intr_blocked,
     .nhvm_hap_walk_L1_p2m = nsvm_hap_walk_L1_p2m,
+    .nhvm_domain_relinquish_resources = nsvm_domain_relinquish_resources,
 
     .get_reg = svm_get_reg,
     .set_reg = svm_set_reg,
-- 
2.53.0


