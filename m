Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMaJKT2dBmpLlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:12:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E215549267
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:12:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309489.1580558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjuf-0004fL-0y; Fri, 15 May 2026 04:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309489.1580558; Fri, 15 May 2026 04:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjue-0004bq-RV; Fri, 15 May 2026 04:12:36 +0000
Received: by outflank-mailman (input) for mailman id 1309489;
 Fri, 15 May 2026 04:12:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjuc-00048s-Rp
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:12:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjuc-000yVE-84
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:12:34 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069d26-bab6-0a2a0a5309dd-0a2a4504b2a4-8
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:12:34 +0200
Received: from [52.101.125.129]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c35-1dec-0a2a45040019-34657d8136d2-10
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:33 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB3981.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:156::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 04:08:30 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:30 +0000
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
 b=jp+/O/GeQwJmOb7MFT9Ek25aZ7U4EoVMvKSVMZq10HtD+NcaUo7+kcbVRPi0jFXqQV12YIjtR975uXDySqNnb5oM9WfVGH7CqbZv5dO8O2+SXIyOmd77dD2vx8QdFTzGUOr9ADCbwhY3SzFH091ARmHHcFaepMXU8ofWkbm0dEArwjPM486vI4KArCNV7AHfmsvICQEkBjHr9MXKnvYPQNVBlARsGqYst+HCspE5mhy6101a8h5K3yaRvDlNjzAiUuoqpo05g5IeCKgcE4xMd7TcaGXG/1gZSMjvU1aAKy1AluN2kYAQKlU77toOLehL3uzi8BRdbLvLB7MFtkRL6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZtK/SKYZCbPqZPdtBWTxkdfuoOJCT3QfZZUH1rHysw=;
 b=mUx+ftlah+frn9InSWv9C5utTgOaDEm+tKlekXtfxjhqO93nwvlMZE2m4IuGxJsuItZ0wHRJ/zFIQ7+rN624iGd/SUN0XWJrFis4/X84f7awXuSpi7wZQRoSJx7RFq4kCt1CzDooYPRu+TjvPfd8cgy6cBUknZwumajbRVvuA7hiRbrA0pA9iWqrlIy0ERZDfyWVYCunDOK0GO1KpVI+zZ+dKR/64hliLs4wbA7xAmhwX15IX5K5Ue3paPymLbFMa8vIhvab7nuaYS34zplZZih7A9CkFfx0isoFUNQmEBn12ugFDd+TFPJrbNEyGnuqx7RixxqW37eLTg7XHlVnqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZtK/SKYZCbPqZPdtBWTxkdfuoOJCT3QfZZUH1rHysw=;
 b=UhbZxC/gWhgIyo3DfTpD1u2lNu48sr5kql55ojsI76V/I8DxlIKaCBZvUN2XXSc0vcbAXWpcGFqbkuz2TvK48af4bQ4J02mfJH/vQHXvXWPFSeI/OFkP06Evg2KIYKYuD4KR3hXLPu5vWB1xmvD0w00B/7xBlC/zSy3TLK8cMAs=
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
Subject: [RFC PATCH v1 15/26] xen/arm/cca: create Realm descriptors
Date: Fri, 15 May 2026 13:08:01 +0900
Message-ID: <20260515040812.983626-16-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0001.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB3981:EE_
X-MS-Office365-Filtering-Correlation-Id: 09dd67a0-dcf9-4135-92d8-08deb2379f98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|3023799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	V3xS5r1JAE/Ukme4iMo8UCnJR4zgZO4VdeUsjcCTpTbzLeXQDbKgUCF/fJ8ZrDy/q410Tud5x9ZZbT1+pln3ODwrf1JzkoVZggYXwxQkl6y4aq2TOZJ1qEeft8odO0nood9sEsdcnVU9hFfIU1sUUn+1TCDpx80LiNlPBZNfBxkbH+QEQdfO3XOeA5BCUqfZ4XbDR6XPHzUDVnFB0NdZhy4zF1ZPiQX4qNwb8PDwsHPQRegDuXXFlIaEaRcDadeE1sbfaRqbsWBm599Xxvr8salvzDRS+Std6Nv/6VGWv+u9CIlcLTj7bbIiSSmpOa52BiTQMu39AhHkxM/Y0PBJDUNf0sxi5il7mvDW3x71b9s+CRbAZvehR/XTGg2L6O7J1WpMoO8l8Mlu4v1ieomqWczBsoErr8/nulMCIbrAD+9spfm6VSmA9w3GPLZ30jMrV4BS6Xc45eV5fEt99o/h56FaBHOpF+A14IrgJ6aZ1QUg7BXhw1mJvdM2Y4GuhV23vGfeG0mktknt9m2Dbf1XpsT2jvWG9PZHQK7pyowWLxoRDYTpUsDj6zPNPaZkZw2StBfdqbREBl9LmC7PSw9tme/3P6p6jAYAZ9BSh7i/NQQpjqs6QIo4VyzgqicfSApRPfXTstqFZxNue4mDheLINeWqXPcoD28lR4eiuqVqKZKtOEvgfkfAhnfftyp+PTtn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(3023799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eDjwDLLTvKIR8XhvAV+DclLr/BeAZDcWMeJFHHwoUtYtAjCk4GX5f77z6WhI?=
 =?us-ascii?Q?CpCDhsxp5WGQutpFLqfKzGr74LA01/R+3uWUVoE4/ZdWlKMdOyWISGVcToGf?=
 =?us-ascii?Q?uWTGinbZXE58MuTflyUPUxJzbKLs1E4GGJLRuLoddEFFsFWvPaoKUyyLIuQm?=
 =?us-ascii?Q?3TqSDImcuoIX4oJKj+soY0fGS6xu68T/OQUBwJfUGPeE8EmksIdhmNtdpwzD?=
 =?us-ascii?Q?uGgB+Z3bui7T0ybWHdploeIKCySmjk//2mLD0wA5vYDrWZNv6HTVDPpx8s1r?=
 =?us-ascii?Q?RDdoEMt7VsBpso2bwaapYcTLuNquF2KFiQM3lg12c/aNwKQdTU3ImWu460Q7?=
 =?us-ascii?Q?r9liNgURVuVmq2ZLrj1WrjfeFKhIzUV/O/FLoK9djr1i4ly++WuUZk+Xj8Nx?=
 =?us-ascii?Q?BBy5kpMALJB9Gnszu/VT9B/+eTozQgF6nG+gEl1ygZc5QxR2U+P0ZkuEQ7fl?=
 =?us-ascii?Q?0IvxjnHA4GDxrMetutXm2OLOUFWPv/4SWwrbvpeXSz4NgwDyqZXmenwdeIq3?=
 =?us-ascii?Q?dzfd+LpLbSwZYsYnr8VacM8LB44TUnzpU3txCOaWigNlNtJpj0Mf4XmgUPei?=
 =?us-ascii?Q?sBqnObF+sSNBTrei2CLXAmLCUBhzVWM/FGG8L08iaWSJbvPqyQgzb+S1gQey?=
 =?us-ascii?Q?6WPu/CYVcqX9UgtZwGZrOJiDGDnPBLA0aY6DnVKi4zdgSkRiEDHEmyArM8d6?=
 =?us-ascii?Q?M3JpJosBFABXs8mzVQpsq578uX/JOx293wo7dhp3PWbJE27/9m071kL/Sdz3?=
 =?us-ascii?Q?8vPTXE5A0bg0roq6o/K8YP2cpiARZm+QMIKfL8AneafGVt2dVquNlDGXwCPV?=
 =?us-ascii?Q?1RFBghTZw78Ql04KfigeD5Ln49qUxul89VLNskFlwlVQyXoXwEZ6LkyuU/P8?=
 =?us-ascii?Q?nk9k6lLFkhJnHQe1Fxly6sAutrj4e+qYRRTfVv2NjkhF9xCLq5vSm/GkodK7?=
 =?us-ascii?Q?/Q7SoG1RIrRslImrjm79NmOluezM6MYzUfzcUlCl+Ijqli7BER7V9EGT8363?=
 =?us-ascii?Q?0Q+Dz0Lzc5Ra25PuELuNzbJ6o8ovXTyO+7MH0tYVnkU9bx6S9TbezfB4ib2F?=
 =?us-ascii?Q?Zql1+st9YUp9gzqEmGvf3Aye/I2DrOH0FAo9xVt74U4IenL5/PKaRlWOXgQN?=
 =?us-ascii?Q?qJdS+rUMQ/bzglMzvk+B89W3d+2Nbq0HTE0yxGbv55ozff4Zq5LzQkiTsDsu?=
 =?us-ascii?Q?UCQrufhlltdqdoEHxImTtCfqb61Mt7USDUGzAuRfEfPGfuDLBztYhl84Lcck?=
 =?us-ascii?Q?S3uSQGDsZUiFvuPwa4O+A3NyZFzhYz+joM1Di68vDS9ZwxLP8jP2rYfSySfw?=
 =?us-ascii?Q?kJbJ+GCPonrjHkNqDpjCjnrGQUxohxq+6rGmV3tZlkOWOPAo0FRpYSLpVjHP?=
 =?us-ascii?Q?UVZbidyWhMvcp5SyKFdcq+LKIPfysRHTfvgh1g9Cuixw9bmLtojpkG7c0IVG?=
 =?us-ascii?Q?+BVryQKLKcw5x/GgUn+jFtkfNA67fcGt0zGLiCISgudIYKK4kdP9YfwFBxd0?=
 =?us-ascii?Q?baviNSKdeS0jtFKXH1DgWSkdlfzi7brg7nPzpGpHkI4NTurr7GBrUZeJT2wl?=
 =?us-ascii?Q?gsNSuZDak2zN96F9jxVb8qkuE9ng9gzg6U7IPwcEif9UVZtZ0LjatVRnOP4G?=
 =?us-ascii?Q?fEJC0pXyGaOnoKVUMvCnnh/ca4vHrWFFEeHicLXfzu2WgK9+ZqwvRSApYBsu?=
 =?us-ascii?Q?t3q4sbiPQyOH7uOjcDzSUcyCaBh0V3RkDyTVyWvNJi30jocKfOkJBU0+EU4B?=
 =?us-ascii?Q?LPC8jLfPxc1vYpB08lb62ik4eatQqDT83p9Kttg/9GNdHcjlTW6g?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 09dd67a0-dcf9-4135-92d8-08deb2379f98
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:30.4211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Mw9cYarOAX5YnMziMUm21rytVTJVpUe3WJZpdDJOtphFD/zVfmyMwYzePzJAMG6N5zj8CbgnP/jiV3CcqWVSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB3981
X-purgate-ID: tlsNG-ebf023/1778818113-2AD643FF-CE381AFF/0/0
X-purgate-type: clean
X-purgate-size: 4417
X-Rspamd-Queue-Id: 5E215549267
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

Create the RD, root RTT and Realm parameter block for RMI_REALM_CREATE.
Record the delegated pages straight away so abort cleanup can find them.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/cca/build.c | 116 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/xen/arch/arm/cca/build.c b/xen/arch/arm/cca/build.c
index f333813e10a0..66d9c88da161 100644
--- a/xen/arch/arm/cca/build.c
+++ b/xen/arch/arm/cca/build.c
@@ -409,3 +409,119 @@ static int arm_cca_validate_realm_features(struct domain *d)
 
     return arm_cca_validate_realm_features1(d);
 }
+
+static int arm_cca_rmi_realm_create_complete(struct domain *d, paddr_t rd,
+                                             paddr_t params,
+                                             uint64_t *rmi_result)
+{
+    struct arm_cca_sro_mem_xfer xfer = {
+        .pages = d->arch.cca.realm_sro_pages,
+        .nr_pages = &d->arch.cca.nr_realm_sro_pages,
+        .max_pages = ARRAY_SIZE(d->arch.cca.realm_sro_pages),
+        .abandoned_pages = &d->arch.cca.abandoned_pages,
+    };
+    struct arm_smccc_res res;
+    int rc;
+
+    rc = arm_cca_rmi_realm_create(rd, params, &res);
+    rc = arm_cca_sro_complete_mem_transfer(rc, &res, &xfer);
+    rc = arm_cca_build_record_rmi_failure(rmi_result, rc, &res);
+
+    if ( rc != 0 && d->arch.cca.nr_realm_sro_pages != 0 )
+        d->arch.cca.build_unrecoverable = true;
+
+    return rc;
+}
+
+/* DEN0137 2.0-bet1 - D1.2.1 Realm creation flow. */
+static int arm_cca_create_realm(struct domain *d, uint64_t *rmi_result)
+{
+    struct arm_cca_rmi_realm_params *params;
+    struct page_info *params_pg = NULL;
+    struct page_info *rd_pg = NULL;
+    struct page_info *rtt_root_pg = NULL;
+    bool rd_delegated = false, rtt_root_delegated = false;
+    void *va;
+    int rc = -ENOMEM;
+
+    rc = arm_cca_validate_realm_features(d);
+    if ( rc != 0 )
+        return rc;
+
+    rd_pg = arm_cca_alloc_host_page();
+    if ( !rd_pg )
+        goto out;
+
+    rtt_root_pg = arm_cca_alloc_host_page();
+    if ( !rtt_root_pg )
+        goto out;
+
+    params_pg = arm_cca_alloc_host_page();
+    if ( !params_pg )
+        goto out;
+
+    rc = arm_cca_delegate_granule(page_to_maddr(rd_pg));
+    if ( rc != 0 )
+        goto out;
+    rd_delegated = true;
+    d->arch.cca.rd_page = rd_pg;
+
+    rc = arm_cca_delegate_granule(page_to_maddr(rtt_root_pg));
+    if ( rc != 0 )
+        goto out;
+    rtt_root_delegated = true;
+    d->arch.cca.rtt_root_page = rtt_root_pg;
+
+    va = map_domain_page(page_to_mfn(params_pg));
+    params = va;
+    arm_cca_realm_params_init(params);
+    /*
+     * Initial Xen CCA supports only shared MEC Realms.  Set the policy
+     * explicitly even though RMI_MEC_POLICY_SHARED is encoded as zero.
+     */
+    params->flags0 = ARM_CCA_RMI_REALM_FLAGS0_MEC_POLICY(
+        ARM_CCA_RMI_MEC_POLICY_SHARED);
+    params->s2sz = p2m_ipa_bits;
+    params->hash_algo = ARM_CCA_RMI_HASH_SHA_256;
+    params->num_bps = arm_cca_feature_field(
+        d->arch.cca.rmi_features0,
+        ARM_CCA_RMI_FEATURE_REGISTER_0_NUM_BPS_SHIFT,
+        ARM_CCA_RMI_FEATURE_REGISTER_0_NUM_BPS_WIDTH);
+    params->num_wps = arm_cca_feature_field(
+        d->arch.cca.rmi_features0,
+        ARM_CCA_RMI_FEATURE_REGISTER_0_NUM_WPS_SHIFT,
+        ARM_CCA_RMI_FEATURE_REGISTER_0_NUM_WPS_WIDTH);
+    params->sve_vl = 0;
+    params->rtt_base = page_to_maddr(rtt_root_pg);
+    params->rtt_level_start = 0;
+    params->rtt_num_start = 1;
+    unmap_domain_page(va);
+
+    d->arch.cca.rd = page_to_maddr(rd_pg);
+
+    rc = arm_cca_rmi_realm_create_complete(d, d->arch.cca.rd,
+                                           page_to_maddr(params_pg),
+                                           rmi_result);
+    if ( rc != 0 )
+        goto out;
+
+    rc = 0;
+
+out:
+    if ( params_pg )
+        free_domheap_page(params_pg);
+
+    if ( rc != 0 )
+    {
+        if ( arm_cca_free_build_page(d, rtt_root_pg, rtt_root_delegated) )
+            d->arch.cca.rtt_root_page = NULL;
+
+        if ( arm_cca_free_build_page(d, rd_pg, rd_delegated) )
+        {
+            d->arch.cca.rd = INVALID_PADDR;
+            d->arch.cca.rd_page = NULL;
+        }
+    }
+
+    return rc;
+}
-- 
2.51.0


