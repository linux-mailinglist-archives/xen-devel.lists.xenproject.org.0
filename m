Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCiNITudBmpLlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:12:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F172549259
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:12:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309488.1580544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjud-0004J9-M9; Fri, 15 May 2026 04:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309488.1580544; Fri, 15 May 2026 04:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjud-0004DG-IQ; Fri, 15 May 2026 04:12:35 +0000
Received: by outflank-mailman (input) for mailman id 1309488;
 Fri, 15 May 2026 04:12:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjub-0003vu-IH
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:12:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjua-000yVE-Ul
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:12:32 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069d26-bab6-0a2a0a5309dd-0a2a4504b2a4-6
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:12:32 +0200
Received: from [52.101.125.129]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c35-1dec-0a2a45040019-34657d8136d2-9
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:32 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB3981.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:156::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 04:08:29 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:28 +0000
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
 b=IXjTWfZR+3kWly/5vOglg3MtVqix3dpi2eQw9ah7we8HlVQth7Xk+L8xkCNEi29EsQ7UBg7uTqCJt05gV6mlRcEnM4NhtbTyqod6iY+Oi9eR8zLL5AERzfXj2XCwtAz3s3dILLePV/OZEKgrNH3EDeS1a5dYtwCNId6QqjJ1Q8f0JmWSOIwzzjL1w7iRz2vpGZofgnGxfKfX9c5lJIXPdoPplNVOuTgZvNJf/NVGEytqlxm45IyOpfdLsIpe1FFHldRGfBlLNrdGazqzIUtOF3eZovvCrH7Auuy0cztcOhqJuW7fRw/zBT/GI9cx09x4TcA8WGh7fXxlreFGbKJASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3FWv0GhzR6Z08YwvEAu3rWkS08OimUL4UXo8Xw0smY=;
 b=GI1JsAnORKFapx3wQt4vFhLnrC9C04au+YIaXMiz49egE0CXAkzbVl8arOAiMiwpu/c/O1xuQrmI/I5wN+mD/IO4NOYPeL9EIwzEL7mFrkdU0qbTmS7girWrh7vbuGKnXZQhX6jjSwZG0rOYYqpaMTTuK2HENuXVznNdGC1Y5btIGU2848fKmfN8ZIAANH5/KyWnsBUyLzqpi5Qpta459duVfA8C/Pcpe1RzoPDZgZ/zXSy1S20cb0544/afEnk3AO/ZV5hBSuGVbj1qaTdFzw4OWFaCMvT63hapgZlpsICWDvp75c7yyIDFEL/dKeF5MT9TUwHDNOVDYY1YZ1nkmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3FWv0GhzR6Z08YwvEAu3rWkS08OimUL4UXo8Xw0smY=;
 b=EVdBhsnLh8sWAEI128zfUS0PEhAKbwuLjAK8hZK6q7Rrtwxm3lMxfrFRrjYvdCO46Ew2qXBNuwoZlwTzLRwQIS5myx0Bqb0QwnL7Ezh2Mp/KQfWVHFjmHn5FXIydZ4XohKwJ4rhe8+zF26mM8O4VTe9tCjhB3r0//I090w5uHsA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Koichiro Den <den@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Juergen Gross <jgross@suse.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v1 13/26] xen/arm/cca: destroy RECs during Realm relinquish
Date: Fri, 15 May 2026 13:07:59 +0900
Message-ID: <20260515040812.983626-14-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0066.jpnprd01.prod.outlook.com
 (2603:1096:405:2::30) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB3981:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e3134ae-414d-4cb7-8b08-08deb2379eb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ZbIuGgSzAP8xk/gIBp71eHploo10DeHDf7sMinyg3HS6zWii518J5F9LAu3n0dH4ELAHSRuW+oM2jkfNl+g9KoMlTNQiYGuabCjoSwZvVu19q/KcK7Mbb5KOvDRmA+z9xgTLbdujrwtOjZ63Ekd8ViL1kkUfL7zAJvea2wdkxdXS4gQ+OazatjCG1tsLHxZkVT1kOq7vdgujjht1PQqA77cjSVE2Y6JhznPCxO65t4U8/gFkbTY26s7hVbmnC609hVkImQQa4Hx9l0zfTDxUAX3QDwvHuZ3decxnplDUHvl9UoSiSFLNBpe5d618+EHhUyglmgwVe0bOU70TH2Wfs92Iu8PgYGqfjELE+jXwmIMhR+NC3lGpNsUWZjos7fAL8FPwGNx1He01XLwchnOdMHLBloCUd6r5usOrR4nsyE6teKHGcq8s1k6dQ0JcJKJnWtIvn3ZWzHe+4Cb3VejZhIfGJ0ZSQVwWFR8LymKfWyNTMcY4o//c3c8pL0YSLSlYfPD2VRRBjPXGMJKMo4pXCeRqrsN4km56QEseUj7TSd63Be3gi/ZL45698ezPrUTq2pp4jHj08JCOu8EuiSx8czQx/pLIYf2eGjVuPtTXDgfW0WJvz3WM4jBrU50rpjvQMg08JWUTTNO9ab9DhnyvuXbMsWYkkflPqN/I3AXa4d15LaN9XCPNPunAR9YkwZtN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rzFfkBtTiACIx5FNERO7+qcdGAQF/nexYtYrwA0XoEDt+s++ZvpxMmT/F6TO?=
 =?us-ascii?Q?ddaTm7Lond+JFPLgb+4zbCG0Ax0aVoZbfP5j6RFDAfFYT/noqA1KeVE8upZ8?=
 =?us-ascii?Q?gG3xO0QuNxmulWQZ3N8oRV5+t4DG3lE2EuBVevvvvZkb0/Rst2KUhQ3fPBRC?=
 =?us-ascii?Q?HuLyPS4q7ZvVX0ySM9hQv2mJAc3AAaUssKwFy6Frln7S51GTd1a9JzVvykic?=
 =?us-ascii?Q?poOKxOzZrzFiCanPbACv0X3MNhKi8zsjLGaWnBLo1ha2yasMdqgiZcSIaDrj?=
 =?us-ascii?Q?fqysX5MSpiZkj/1FS5zpHsQuxT6iS17xC7eELmf/YD69vOLc2rLj+EWyWLyR?=
 =?us-ascii?Q?h7IVwe9YEnEfJDtKbcrbJmTnetMa3ufXu1xk5nBr/a6q+wB5fB7DAGuV0C3n?=
 =?us-ascii?Q?hto5IlRbqSkAfii+cQ4/elC7VyjhDzCsEHU2iUbNJJtQFKIP6ddSEjLXh2c1?=
 =?us-ascii?Q?SIYDtmLRU0uZHRQ6m9o9pusJmpRyedjJMbCYK++c2RDleYQOB74woBfmMZzv?=
 =?us-ascii?Q?QUC7AmZdOovb5/xfytT8JdNsuz4c+68bSC585GmSEaGzbbp6f8NSxQ3KaI+9?=
 =?us-ascii?Q?MOix1hbL0huAIsQjVUouVqte4lZr35envA3bDgpCTubEhWlL3cP2mmvtTJ4x?=
 =?us-ascii?Q?GsNhV7qSxSC7mD2P1RH80ONhigw3ZTX3D6ss52CweHS8kXMAWWQE4eU8uyCB?=
 =?us-ascii?Q?5Nberif62uKDjUdlfH0tZPcEG8VpAsv8VVGRfHkc8FKMNEzF4ig0nB1yXDFU?=
 =?us-ascii?Q?pOaqK8kbMsIcPv6hufwMHrHNSpICU3SN3p2UVPmODZBSHrovdTMcwAl/Rcmo?=
 =?us-ascii?Q?VpLxQuQeXzbHrdMX2jPKgB4237MBbKfbNsXYlv1ysLaoSpjpQKA15qZxLSfM?=
 =?us-ascii?Q?ElME+VXp8JnpyMoRhDIqxkBWESJcoATT8YM1Zw1DzZc3+2bpwHjEou00IAym?=
 =?us-ascii?Q?YGa6viBElVTJ05RtSRv8B2Ms0ra2AXs4uhdPA9Qb38sccS9aVH72F8POlM4O?=
 =?us-ascii?Q?v0F2QFq8YxFOHvLSkRylXfmfzxslV4e6Nzi+yuj+1xyehb/T50B4u9xzG4BW?=
 =?us-ascii?Q?wbtpsCbxnamF9HqMK0RzP7BucSkThn326lSG4p4VqI+s5Aubjnyi8SitSAHF?=
 =?us-ascii?Q?2qQ2eq296VggSIJbRsKYfXntWSWenaNXA5TXfeHs0+EssfoGi0W4gI+I0BRr?=
 =?us-ascii?Q?BQqMS5RzO0b5FPWVlp404MErNQEn7/f32xtLgCVI7aHXbbJoo4L3DS7eQoLW?=
 =?us-ascii?Q?lJ1mkWrirMEQqdLQrdyIaPPDzRvXt1CuRpW7e4H0uhnl3pNjImP+mLwW3Hjy?=
 =?us-ascii?Q?Lf7JINDFs3X8sbMUcJTG2DwbLNhxah+bdqkBekZ7BvgA6+QxhcjP4A2pijQp?=
 =?us-ascii?Q?85ZegI7sT3lchbW+1fUOkKsQmivk0iUiQReuJey04FoWxvSWToEO1/NPLY5l?=
 =?us-ascii?Q?AvzyYef10YaYbUv0fQR8GNBLFTrQ34eZJBzS1eK3+OAXRYaD6f7AbRKLvv5i?=
 =?us-ascii?Q?hM0V5+pC3Gv+jgfYEJH0D46RnayROaTV+nh8J3iyw86YbH/eleYTf+9mrG/I?=
 =?us-ascii?Q?+U/+s2R4xIpQC2XFaYXsv1prIC2K002f9CSJu2SXJZi0B5UZIUko+She+xbd?=
 =?us-ascii?Q?IwX4tHLZEeWjjeshwLl4EuQbxR6WryR1frN9q7TTfYp1RaHxlzxqkkUlUW9T?=
 =?us-ascii?Q?2ASVhtH8Zx4vkp8t3VKyaAAKwQ2C1g1Xg7c4YLj65kIz1zc6OcFI+Kg2GY5x?=
 =?us-ascii?Q?b9fA9rSMC5r7Q9WCyocDl2h3U8jsZcMM4/rVMSMylC919yn0jwbL?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e3134ae-414d-4cb7-8b08-08deb2379eb2
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:28.9253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X4IWjT81l1Glcn1oU+UaHW8xEXpsZQ2qS2jVoLP8JygD1f2lrE0k70DsElq/0sAOOQkmxi8KkTfz1J64MdIryw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB3981
X-purgate-ID: tlsNG-ebf023/1778818112-4014E3FF-E7C63A26/0/0
X-purgate-type: clean
X-purgate-size: 3000
X-Rspamd-Queue-Id: 3F172549259
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:dkim];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Destroy each REC, reclaim its auxiliary pages through SRO, then release
the REC granule after the RMM has returned it.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/cca/state.c | 81 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/xen/arch/arm/cca/state.c b/xen/arch/arm/cca/state.c
index c85ef56a1297..72dbb83841d7 100644
--- a/xen/arch/arm/cca/state.c
+++ b/xen/arch/arm/cca/state.c
@@ -122,6 +122,22 @@ static int arm_cca_relinquish_abandoned_pages(struct domain *d)
     return 0;
 }
 
+static int arm_cca_rmi_rec_destroy_complete(struct vcpu *v)
+{
+    struct arm_cca_sro_mem_xfer xfer = {
+        .pages = v->arch.cca.aux_pages,
+        .nr_pages = &v->arch.cca.nr_aux,
+        .abandoned_pages = &v->domain->arch.cca.abandoned_pages,
+    };
+    struct arm_smccc_res res;
+    int rc;
+
+    rc = arm_cca_rmi_rec_destroy(v->arch.cca.rec, &res);
+    rc = arm_cca_sro_complete_mem_transfer(rc, &res, &xfer);
+
+    return rc;
+}
+
 static int arm_cca_rmi_realm_destroy_complete(struct domain *d)
 {
     struct arm_cca_sro_mem_xfer xfer = {
@@ -269,6 +285,67 @@ static int arm_cca_teardown_rtts(struct domain *d)
     return 0;
 }
 
+static int arm_cca_vcpu_free_rec_page(struct vcpu *v)
+{
+    int rc;
+
+    if ( !v->arch.cca.rec_page )
+        return 0;
+
+    rc = arm_cca_undelegate_granule(page_to_maddr(v->arch.cca.rec_page));
+    if ( rc != 0 )
+        return rc;
+
+    free_domheap_page(v->arch.cca.rec_page);
+    v->arch.cca.rec_page = NULL;
+
+    return 0;
+}
+
+static int arm_cca_vcpu_relinquish_resources(struct vcpu *v)
+{
+    int rc;
+
+    if ( v->arch.cca.rec != INVALID_PADDR )
+    {
+        rc = arm_cca_rmi_rec_destroy_complete(v);
+        if ( rc != 0 )
+            return rc;
+
+        v->arch.cca.rec = INVALID_PADDR;
+    }
+
+    /*
+     * arm_cca_sro_complete_mem_transfer() consumes REC_DESTROY reclaim
+     * requests.  Remaining REC auxiliary pages would mean Xen cannot prove
+     * that the granules have been returned by the RMM.
+     */
+    if ( v->arch.cca.nr_aux != 0 )
+        return -EIO;
+
+    return arm_cca_vcpu_free_rec_page(v);
+}
+
+static int arm_cca_teardown_recs(struct domain *d)
+{
+    unsigned int i;
+    int rc;
+
+    for ( i = 0; i < d->max_vcpus; ++i )
+    {
+        struct vcpu *v = d->vcpu[i];
+
+        if ( v == NULL )
+            continue;
+
+        rc = arm_cca_vcpu_relinquish_resources(v);
+        if ( rc != 0 )
+            return rc;
+    }
+
+    return 0;
+}
+
 static int arm_cca_destroy_realm(struct domain *d)
 {
     int rc;
@@ -330,6 +407,10 @@ int arm_cca_domain_relinquish_resources(struct domain *d)
     if ( rc != 0 )
         return rc;
 
+    rc = arm_cca_teardown_recs(d);
+    if ( rc != 0 )
+        return rc;
+
     rc = arm_cca_destroy_realm(d);
     if ( rc != 0 )
         return rc;
-- 
2.51.0


