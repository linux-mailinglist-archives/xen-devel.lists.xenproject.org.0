Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 71TwLwCVFWp9WgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 14:41:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AEF5D5B10
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 14:41:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319830.1587304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRr5w-0005uk-Or; Tue, 26 May 2026 12:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319830.1587304; Tue, 26 May 2026 12:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRr5w-0005sg-Ki; Tue, 26 May 2026 12:41:16 +0000
Received: by outflank-mailman (input) for mailman id 1319830;
 Tue, 26 May 2026 12:41:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wRr5v-0005ov-6h
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 12:41:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRr5u-00GcEL-IX
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 14:41:14 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a1594ea-2eae-0a2a0a5409dd-0a2a450b9066-4
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:41:14 +0200
Received: from [52.101.53.69]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a1594e9-212f-0a2a450b0019-346535456a8e-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:41:14 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SJ0PR03MB7128.namprd03.prod.outlook.com (2603:10b6:a03:4e7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 12:41:10 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 12:41:10 +0000
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
 b=R9QAoA8C8icv+fF3q9bO60ggwTkR0KX2i4+rCy+Z+2yYz2iZOYowEuVONKpXmor2+CZEEbcb5LgoO9bbkRQsZ6t5PJINIkJWgbNu/ji/V9G4Uvkv5Lj5lYp1lfxQY14z5aVIeCwrUbwvwpRgoAyC9EMTsvvYqknlkk8KJHgNQ5nGEwH7ZoUCZ0oqSxwqYhc8bCEUZDw1PjEUTD7b5YB0YQKjoSDkDZk59YOoK03UFAF9kyG8tmv94ayce2TnRE83Wzgg0esnqmwxD5icxkmIpmKjFrID227v65SD6XveoRwzpbCW7mdXEEg/4MA95bXhszPUprNXscb1gdn+dA1EuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25QH8/n9RskB/SU6v5MzQTSD7KovvwReHF70/x5KgoE=;
 b=eMNho1IzcLpU4yXk3e7JxdB1PqmIEjGavOKoSpFyCdajV2AkbdUyCO2Bs5pOkTdL+2vWAaKlNHNCc7H+EWKRyR/q9i96QFou8j+4CMQfjAQaV24+ysK4/taSX7Cag7tGMdrsA1u5dEE87LjklZPilnLOl5ImnLUIrXksVLwGltrrywOuxyehQIWI6hScTSBogzNzzJIL5qSX8uCetW2aXnc/2R5CoQTNSNGUc2t7FQxwn1ugI/7aXh5Cqiatgy+azDqy7VNznTg4YWK/z3Kzek+3ts+AkXT8aX1izT7txlJioBMWgZ1C4H7CFZHRsYaEr+bQg1Uq2Tzrtysc2YIAIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25QH8/n9RskB/SU6v5MzQTSD7KovvwReHF70/x5KgoE=;
 b=AGqvjTmTlt0DI+El3GQLPivpKGc+npYNMfT2RUez/VQIio7ynfvvHUc5oP4XQwejqe5RmH7/NzGtCbIFM/E88ELRV9cgznf6XU4PboYyhM3lDKij4Dr/UFYzgtQ13vsw9kj1lAAuQZI4saKArfV7S+16JJQfchKoRU1YevI2vzc=
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
Subject: [PATCH v1 5/6] nestedsvm: Fix deferred event injection
Date: Tue, 26 May 2026 13:40:26 +0100
Message-ID: <20260526124027.573412-6-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260526124027.573412-1-ross.lagerwall@citrix.com>
References: <20260526124027.573412-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0156.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::17) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SJ0PR03MB7128:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b2ffef9-16e7-4a1d-d881-08debb24107a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7bjLD9P9S9cA4mFHwXUGRJGYlsyjLDNI1+8d9JpyRrD70s4RJZfnhyqAN7f6tPo9FxQeBLs/hp1SGe6VfIHU9gF0goXLiyhqgc2ctC5Ztwgcrf3F0C4Jq/ZMDq5AGB8MfwA5dbhhSv771FqIz+9QX6qkHk1wcPNDc8yJgFy1Mk+HlJmJhDowP0u8Ev87kHe8vCRmsHuDBd73Vr+9QIQqhBmFmeMJGUdhXkGeLGPI/ByRCgUqRpG1RPKtstjrYAuFLdxeZhkPtz6coyRF2Kb4K1zgtuYnmOw2gBXVlqiDrYJV8Mu9ET4D/YQakTfvSwVU4WBambDtuCBDoJK2jCzZHfleNPUEJ2VLFmJD7W6WgCu6S4cno1yEttCrVDRTSlzTrEKShZzK82ZJixkyjobelMdUzyteHVte64rPu4Dd1OIEMJY5/95C21b2HDJtS5FuVro67V5USXnl29Iqernt2uywY5nVFHhx9CwwWihf8DPV2/k9zmSvDN45Rnoh1Rjz+Joj+w2hXSqJ+YsNL5PQXFe/SO417mxeL4oCnjWQJeAd6hYKZvRnuq2Efh6q5USObeXYfQfCibeuDvy2uSJBFQ8mBJ4AexfmEUFzq2ooCJxIBKv2EWCWDFaP/Atkp1MuuitXHGmhGGStPSSg8eRp5RGo8FxtoxID+QAFzVmdH662lZsnJa+n/FDnA+Xn+J2r
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JuxzMGDp4q6b9b0vZfThD5sA4LM18YUwq6tkNUYiu7siS6guKPIRvbzhLAK0?=
 =?us-ascii?Q?hIVZ48iR6USskpZTls0cG3UPcIjw9IUtUbsR/pvgIKWDkqIVK1m5SlDlljYe?=
 =?us-ascii?Q?dEywudHpUmn6RwSkH+Ch5Nj3mfloOJrj7hLJbi8ItLVdYDKSPrsSZTgXUuri?=
 =?us-ascii?Q?IbYKEHGgaN+nVJPqiaOtnWmysmPVhmkrUM5UW3baiOUjp/CPB3kds9tPzecI?=
 =?us-ascii?Q?2rL3pDkNYVVg5s8balWQvwl6cyClsDpQxLbvFjOZUUOI62JsY3QqdzefMC26?=
 =?us-ascii?Q?Hf4bnMObd64IUYCxbgXQz9m6cktvz4JiKpgC5a2osktGuQvD4T1RmYYiUqKw?=
 =?us-ascii?Q?Lu3zVkpIc4e4cyIvhV/v5vjfeIM7LiqHEDLvk49JnsaHTlSfF4+Rdz+I++f0?=
 =?us-ascii?Q?bzSg5sSAomqjTJxpc0PUbpIIwvw6k/y7g98iRpaEnBCXCALNEla+Of1BRwL8?=
 =?us-ascii?Q?ve5x8u7P1SNIc6ASx9ORr7vibjxybJ2YlH8BCyVssm1hyN/4dFgVb9MuHwZR?=
 =?us-ascii?Q?rT4Zd8qOeEg1jUvDGivZXIjIHLoTfXCZMj5rlh/j5NHdZM82IV7lICiI3byH?=
 =?us-ascii?Q?dEEaa7jac023BpHBTgjES5ta0biW/7DvQSWxp+8bsZcZDRUPNMw2B2nhZBxE?=
 =?us-ascii?Q?WJLNo8fsPiTBLC41XR0MTU74r2Ypa2waqW33aCh/aeVG9vUkS6qMktYYElRB?=
 =?us-ascii?Q?VOtMw9nR161weLNiVESODibqvoMKJ8BUeyDS2H6/waeWJsmESH47UNaIEZdv?=
 =?us-ascii?Q?8BENtQ5Ch+A4gQWk96s8INnXIlzR1dPxTI8vFdEtL9LxfQNJnFH1eskGVy95?=
 =?us-ascii?Q?ZU8+Vs9FFVggQvyJGi99geomhefKDjfMWbtwRVWmq5iREil/vEwT0HBoOae6?=
 =?us-ascii?Q?2ZRgulNmj7TBpBoU1G5qM5O46LBjBWhUpOQeBYq4+U368Lk+AuOi27yKS14a?=
 =?us-ascii?Q?SErcqJFn5cFmrm37uOcJe7ADh+yksMwYhEfBBPRjzg+u4KM5IB4Wocdyi006?=
 =?us-ascii?Q?FcSLhW1Wo7jeWiP2QzSAFBs2DakZNZ9f0tfCBlFNPnxhoM/bsZjMMYOxJrCF?=
 =?us-ascii?Q?mZiTxGFhMHqbsUkyk1uF4X2kc/JzWpt3Evev0Ym2aAPzcMisB6/UCxtOc+u3?=
 =?us-ascii?Q?gBVmU4W3oaiUr8fjdapvFIdTFYSWQY5BvIOvM1jJ/5fakOENtuJAoRl2rFG6?=
 =?us-ascii?Q?Bewaaf9vIbGyT5B5tpFS1nSX62MQZoaKpB+ZfCY3xoTL2eeZVwf+ewHinu6b?=
 =?us-ascii?Q?ynnv/IZB1Dxjxvhwnz10FryDt+K+c/Kwd9QtD2xr26ShUmSCmMNoZUJlexUD?=
 =?us-ascii?Q?8Smd3mu4ssa+qzUH2o02itI0angOEjdnOdSHNXEpL6RQTVufjfs5x9HcxljQ?=
 =?us-ascii?Q?bRryX4a8yZERsC1mo8FkoTVD8ugBRYk6S0NRHR4sP25hfiL27Wrv+hqzxmZ2?=
 =?us-ascii?Q?xd7uRKxtN17opiclfIVM5Y9fEnZ4zRbvGzUX74AesVsQiOxmcYOsu+LrCSoj?=
 =?us-ascii?Q?YrkmTCIfwSRRcS6q8jGe6+L6wPiyAPsl6Q9erdtuGL7fwkc1X7Uv/OZWwILq?=
 =?us-ascii?Q?dZ9MuHrhZZ/8xacQfCN73l15ct1G8akXBRhIlAj/VXj1nlxBj0i8Kvph6C3F?=
 =?us-ascii?Q?Fmuu49LhTPwT5QeLHCkPELfWqwPm9xIyv8EIUkbUtF6sMeOMcMxlD4jIdogD?=
 =?us-ascii?Q?JWNDlQW54ncO89XoQ6orrRfniCC4rm8s5wG3u05ZAuji+Cyvmw73Jx8q7ZMB?=
 =?us-ascii?Q?7Wcf51WemWYIBgC796UBp1ifvlrXJik=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b2ffef9-16e7-4a1d-d881-08debb24107a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 12:41:10.4510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7Nj47CG2kyYwg0g7HWXtL/Vkpd2WLL6sCsSyV10QiZVhN+97GFc63cHSst7YCdtim/bITYv/LVcO/4ArxzvVjgIIBNQjad0b9IJT/eY5oY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7128
X-purgate-ID: tlsNG-42698a/1779799274-2007BF3B-B9CA4688/0/0
X-purgate-type: clean
X-purgate-size: 3554
X-Spamd-Result: default: False [1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
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
X-Rspamd-Queue-Id: 11AEF5D5B10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If an event for L1 occurs while L2 is running, Xen should inject
VMEXIT_INTR and the event into L1.

nestedsvm_vcpu_interrupt() and nestedsvm_vmexit_defer() set this up to
be handled later by nsvm_vcpu_vmexit_inject() after the switch back to
L1. However, the code there appears to be bogus and completely ignores
the source/vector set up in the first place. Fix this by using the
values to properly inject the event.

Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/intr.c      |  4 ++--
 xen/arch/x86/hvm/svm/nestedsvm.c | 22 ++++++++++++++++++----
 xen/arch/x86/hvm/svm/svm.h       |  3 +++
 3 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index cf0621d2f628..8914375b6c21 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -55,7 +55,7 @@ static void svm_inject_nmi(struct vcpu *v)
         vmcb, general1_intercepts | GENERAL1_INTERCEPT_IRET);
 }
 
-static void svm_inject_extint(struct vcpu *v, int vector)
+void svm_inject_extint(struct vcpu *v, int vector)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     intinfo_t event;
@@ -69,7 +69,7 @@ static void svm_inject_extint(struct vcpu *v, int vector)
     vmcb->event_inj = event;
 }
 
-static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
+void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     uint32_t general1_intercepts = vmcb_get_general1_intercepts(vmcb);
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 9b0bd0358ce4..d4fd838ca0b6 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -733,11 +733,25 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
         switch ( exitcode )
         {
         case VMEXIT_INTR:
-            if ( unlikely(ns_vmcb->event_inj.v) && nv->nv_vmentry_pending &&
-                 hvm_event_needs_reinjection(ns_vmcb->event_inj.type,
-                                             ns_vmcb->event_inj.vector) )
-                ns_vmcb->exit_int_info = ns_vmcb->event_inj;
+        {
+            struct hvm_intack intack = {
+                .source = svm->ns_vmexit.exitinfo1,
+                .vector = svm->ns_vmexit.exitinfo2
+            };
+
+            /* See the comment in svm_intr_assist() for why this is necessary */
+            if ( unlikely(vmcb->event_inj.v) ||
+                 hvm_interrupt_blocked(v, intack) )
+            {
+                svm_enable_intr_window(v, intack);
+                break;
+            }
+
+            svm_inject_extint(v, intack.vector);
+            pt_intr_post(v, intack);
             break;
+        }
+
         case VMEXIT_EXCEPTION_PF:
             ns_vmcb->_cr2 = ns_vmcb->ei.exc.cr2;
             fallthrough;
diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
index cfa411ad5ae1..186e0905967c 100644
--- a/xen/arch/x86/hvm/svm/svm.h
+++ b/xen/arch/x86/hvm/svm/svm.h
@@ -95,6 +95,9 @@ enum vmcb_sync_state {
 
 void svm_sync_vmcb(struct vcpu *v, enum vmcb_sync_state new_state);
 
+void svm_inject_extint(struct vcpu *v, int vector);
+void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack);
+
 #endif /* __X86_HVM_SVM_SVM_PRIV_H__ */
 
 /*
-- 
2.53.0


