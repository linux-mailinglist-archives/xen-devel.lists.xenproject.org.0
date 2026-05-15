Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDaUNkCdBmpLlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:12:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A2254926F
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:12:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309490.1580568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjuj-00052s-J5; Fri, 15 May 2026 04:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309490.1580568; Fri, 15 May 2026 04:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjuj-0004zF-Ca; Fri, 15 May 2026 04:12:41 +0000
Received: by outflank-mailman (input) for mailman id 1309490;
 Fri, 15 May 2026 04:12:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjuh-0004u5-Do
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:12:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjug-000yVE-QE
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:12:38 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069d26-bab6-0a2a0a5309dd-0a2a4504b2a4-12
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:12:38 +0200
Received: from [40.107.74.93]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c44-1dec-0a2a45040019-286b4a5dedd0-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:38 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB3981.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:156::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 04:08:31 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:31 +0000
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
 b=YBlYFF/JZ3pryGAABICzL5fnic9gYzEsoLzvyN/B0CC0PabfIElJGTkPaC6gcRk9LF8nwWXR6xgRObWXQKNfKO3jpHJLmo3/9cMFH+w0AuAZK6ftPXB6iWta1p8Y5qPfPp/11UoJHUD7nTmx6ALY4ZbIBjEEBhdgQaNT99pl5smmwscyLMwR7+YyNx0unOaYPQgpnvLL3dootiAPUG5r/Inr8Fpw6Y/C44pc3q8np/OsB7LxdCqt9oFCSTkQSi7ZjdRxH4EOOF6qXs4L05nSk8fuL6j+nQwxIpfQii5t0NrwTcZRWf7rLUD6LDF93dxE2BoXe+hne6AfON231oVclA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ic4DMqcnpHbXQ4IcgQkHlB6E0zWUFBVW3mjpWAW49LI=;
 b=WjuP+IuMrr7obYTiBrVCamPq/XI3vTNvDz2ICaQHTRujqjA7BgcW4n4o3Fvq+6z3EvFMBMTfn/xHla3jc8mqh9aBPIpqjsdaWv0UPgt64lLNiraHPYoPvteiLrnVX5SAxF9oMBNl30Qo3zEL4yxgPwLjyDp2INHN7F4dSLoER9wb5mxgul3epCyKMPTRr8kERYfu/TpEBN1hKlHszpS/HHjTX6vdvxqAEU+yWw61E+EcKffrbFgkJDLpHch+CP0aeWTWndzrHKqxGE6yNrLXJ0iIt9KD+UHEoKebKw5KK8Vt/jhVPZ5zlbgpO4w9nx32rF+zLWn0+6gob6t0h2TRJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ic4DMqcnpHbXQ4IcgQkHlB6E0zWUFBVW3mjpWAW49LI=;
 b=ASmV9ZixM6nhrnDZqYV8GgLVxQyBzGZGViORUYbW1OZf8jgixlHpRIBDDzLKCTH1gb6cguqxNLdwGJqsjm3rZnn06QAwiUqQURO6ThJEvX+QocGBghtKBjBXcLqXXSKyZwADcjwOp4PMDMuNlubT2ARVkjfYcklXRdfNTnsuY3M=
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
Subject: [RFC PATCH v1 16/26] xen/arm/cca: build Realm RTTs
Date: Fri, 15 May 2026 13:08:02 +0900
Message-ID: <20260515040812.983626-17-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0069.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB3981:EE_
X-MS-Office365-Filtering-Correlation-Id: 050a3046-af8b-4c3d-25ef-08deb237a00e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	6PMNdPElGGfEcYqItk2aYTGz+S8bTo6L6/C3BV52RlG9U4lNWAUdad/T/a96tQpdf1bfZF9147g23ACYQhQZ5DZejgDCA8jJL47KwOBqdsKWFt9hmQ4I8Ihf8msgvVZe5ZuJkYf29qCEGtp6YBP0gX4PC421tRL1RWQuA4e8f9AsfIuB6VT7Pm4POud++XEa6axzG409juIP292a7D2Cg3l51WWL1e1a8FZkoz3GKtDi7eSUXtC1uxt2qvhmCPNaZwHWK4Y5+k4YtH9t//dWxMG+rJfYF5JwyEfcCdkwpGRJfLO2g8GEy/lYDj+Vw84ml+KQXvUTYH2AHBecnC7n7YxO5MakudWO+7hMICBOyYaK4EVQABuaX6f3zkBzrp1KyuuIQ6rlpiL98yCTpPsgYIecKZC0sJY8D0OpAhFCuqyQRTq/2OFwBoW6peBoyx0JHMHIzm5/Dqatz0SjB4UcRsrLEr85JvRHwddeyYOx/UVctROcq3jVo0z4qv08kM8rKv80MP+I2hGCy0wc26b0N0QO3vnzucKfpehr7WqNBMDkE9pqvQGTmB5bRFi5XgFN1MWspj4XeQix2WVL8juWvy3n1yYiofhkEATmVPqdEwhYff4nC/dCyzkO7+eu/I5P+9eMnc/2ht24V2bHegRtD4RTsy56GzRhoZBXhUFaZPhuIU9DZY966Dv+3sph6Ql1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZONyaHKDlQnmMBpAm1Lh/I1MF8+uiPWHtDHNfW8mFklLgRX3SLgglkbhdrR1?=
 =?us-ascii?Q?O8UyOxEjMBYym2E8qMDarjvaUc8/8Aba11qfWDJBi7tInZEZr2+dfwSXO+Dn?=
 =?us-ascii?Q?e8Per0I7kgyXSEf0sAwnj5FbOPMoDvbn/UGxWsAA6svVbDtRGxnfZuN6CEaH?=
 =?us-ascii?Q?5mC89X2SwtrTlZFP88DIZ2vSvsMGIHHNuY+wWpZ1yaG8rPTRO/mAjRLdxqFy?=
 =?us-ascii?Q?IV5HA5LRwA/tYO3Bz9PKQ7DeiYnqLCzU9Vk3rMvE+4jXi+Ukut04/n3GBBaL?=
 =?us-ascii?Q?f7kSxuL3X5OIgatlgR9Gkc40qZk67oJg3DcDfCMyDj64BdGTudvbXsofKRQH?=
 =?us-ascii?Q?4NpCkuwFpQ+ra4pBwIoni6I0nNthfgLcHfE/ZTi4hiUapoZ5aGj35yXEGjAj?=
 =?us-ascii?Q?mW6gUrJUKYK2F7CWSIA0VRiJdlLlqBn3rsRMr7X3Gfc0qhZwsiSEea+uMjEG?=
 =?us-ascii?Q?CQn17xO9bOcoPPDx7/rQFPavT/Qz9aj/jrZsHms8SYw+Zg32HKbh0bK6SJgc?=
 =?us-ascii?Q?qdOqCvAQdwoQXQ7Eh9FBuHPMhQZIQJY4OowpQkyQzgCRvl4HvwnPgxgJ8sBD?=
 =?us-ascii?Q?3DRyIV40QrSPIK6Wof5+E1O+sEdaqgHrC5rRJKQ96Z57YOBcaaQcsrwyvsQI?=
 =?us-ascii?Q?IlUKqQ7s1LMpLocl2tPGdJh/Q9RR/mTBwZ7k+9wSNwBV/rWya/V4aPIgC3Co?=
 =?us-ascii?Q?YsLw4nG6cSgR2zN3t2HScBCsd2KQ+2upM+yfkmyoXuXYJxkAH7llBL42iNqQ?=
 =?us-ascii?Q?AA/Vw3nAawA5V7xqEgAEX8dn7jKUhP9dPzshjZUjdlBsReg09E3opYCvEtN0?=
 =?us-ascii?Q?W6GTOFUsy8xYIDPJQA6eUTJKiOIf96/wAnHdNsqFUpyvHbmgQQOlWk3loUiZ?=
 =?us-ascii?Q?p9VVI41udheHWL87UYmm2xjsr+L89xPqLrojV1QeoRNU9VuW6JEUG0+MtIW9?=
 =?us-ascii?Q?ff4iXoc8OZCM+7Ee0KB1oESoDUk8XE+cww09J5/w6SKx3Fm6jqHg75yBo/b8?=
 =?us-ascii?Q?KQxYNuK7t/vAoW/I1mA9UnsfasqaceCvAekObTkORRobCKxPZjhyU3cmA+Ff?=
 =?us-ascii?Q?x0c/A51LZNdB53KtmeQpC7f7KwdHpO4vutGbvNlFwFA5cazJX12TPOJs7qn8?=
 =?us-ascii?Q?RQxAx/x7EE3L5yzpqqunZcHgGmbrRR9P7SVpaOCErRHn7xfSmh+fFqiFj8RT?=
 =?us-ascii?Q?vmgh1GblIBL/sW/K4OZGvj3wGtb0MLWzP7LBqzLBuZKvFUTR9+mgYd7WcBE8?=
 =?us-ascii?Q?ZK2DiyNIACDOsIBouVFFIItsFtnyyPwjz94UqGJyURJJ54UfgZDTCimBbkXM?=
 =?us-ascii?Q?idrdY9g9HgyGjS/NLoLUzfYfXxuxIB57pDsD1I6/0VsWjPxOOcRzT9ZiIc3/?=
 =?us-ascii?Q?lZxsecUX7/Yq9XXAcxJwRmdMBmJe2kOghupsa01KScVxK2YEWYX+1xLqta/5?=
 =?us-ascii?Q?7vLtqcw/RNRtQkSErMaW8X9vp7TJM+dyhj6QDmarW41cQ+HeisVbHgSmHY7g?=
 =?us-ascii?Q?7vK0TduhPClYB/RfgZVeEcBThODuTcLjfNYI0UVaXL5tlHVYZ+VNK8/XDmoF?=
 =?us-ascii?Q?/2o+D4IrI5H5TD82nQgtgxuj3K3S0iHumxpPVSTwEMcNEx7LuIs/aXz/BK33?=
 =?us-ascii?Q?pGumLvVq82X4I5SEhc+Kgv4N1GhR1OrrdFT/dj+rzz+vp+ZZNyLZ3wM5G+gd?=
 =?us-ascii?Q?Rj7E5ya55r2/jLHJDa1nWrDUNpMnTtoVdZd42eQxXio8Rx6EKo5PRT6ouzIO?=
 =?us-ascii?Q?qa1XvcJbqPB6G3b7TkgfSNkYWk0JQnpEKf4tsvldX+XSUvZaoD8G?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 050a3046-af8b-4c3d-25ef-08deb237a00e
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:31.1941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwlBgvM6pBArqAOHDB0n2NDG9C0CXT8mQaKwlnvt4A4Xw3pIFQkvnYwUKVN758GZs5PQHe4ObrWDbyPU7hWWyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB3981
X-purgate-ID: tlsNG-ebf023/1778818118-4237F3FF-11C8E8B2/0/0
X-purgate-type: clean
X-purgate-size: 4565
X-Rspamd-Queue-Id: 88A2254926F
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

Build the initial RTT tree in restartable chunks, recording each table
so Realm destruction can walk the reverse path later.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/cca/build.c | 139 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/xen/arch/arm/cca/build.c b/xen/arch/arm/cca/build.c
index 66d9c88da161..10f61b5038ef 100644
--- a/xen/arch/arm/cca/build.c
+++ b/xen/arch/arm/cca/build.c
@@ -525,3 +525,142 @@ out:
 
     return rc;
 }
+
+static int arm_cca_create_rtt_table(struct domain *d, paddr_t ipa,
+                                    unsigned int level,
+                                    uint64_t *rmi_result)
+{
+    struct page_info *pg;
+    struct arm_smccc_res res;
+    int rc;
+    unsigned int idx = d->arch.cca.nr_rtts;
+
+    pg = arm_cca_alloc_host_page();
+    if ( !pg )
+        return -ENOMEM;
+
+    rc = arm_cca_delegate_granule(page_to_maddr(pg));
+    if ( rc != 0 )
+        goto err_free_page;
+
+    rc = arm_cca_rmi_rtt_create(d->arch.cca.rd, page_to_maddr(pg), ipa,
+                                level, &res);
+    rc = arm_cca_build_record_rmi_failure(rmi_result, rc, &res);
+    if ( rc != 0 )
+        goto err_undelegate;
+
+    d->arch.cca.rtts[idx].ipa = ipa;
+    d->arch.cca.rtts[idx].pa = page_to_maddr(pg);
+    d->arch.cca.rtts[idx].level = level;
+    d->arch.cca.nr_rtts++;
+
+    return 0;
+
+err_undelegate:
+    arm_cca_free_or_abandon_build_page(d, pg, true);
+    return rc;
+err_free_page:
+    free_domheap_page(pg);
+    return rc;
+}
+
+static paddr_t arm_cca_rtt_span(unsigned int level)
+{
+    switch ( level )
+    {
+    case 1:
+        return ARM_CCA_L0_TABLE_SPAN;
+    case 2:
+        return ARM_CCA_L1_TABLE_SPAN;
+    case 3:
+        return ARM_CCA_L2_TABLE_SPAN;
+    default:
+        return 0;
+    }
+}
+
+static paddr_t arm_cca_rtt_start(paddr_t base, unsigned int level)
+{
+    return ROUNDDOWN(base, arm_cca_rtt_span(level));
+}
+
+static unsigned int arm_cca_count_rtt_tables(paddr_t base, paddr_t end)
+{
+    unsigned int level, nr_tables = 0;
+
+    for ( level = 1; level <= 3; level++ )
+    {
+        paddr_t span = arm_cca_rtt_span(level);
+
+        nr_tables += (unsigned int)((ROUNDUP(end, span) -
+                                     ROUNDDOWN(base, span)) / span);
+    }
+
+    return nr_tables;
+}
+
+static bool arm_cca_build_should_preempt(unsigned long work,
+                                         unsigned long soft_limit,
+                                         unsigned long hard_limit)
+{
+    if ( work < soft_limit )
+        return false;
+
+    return hypercall_preempt_check() || work >= hard_limit;
+}
+
+/*
+ * DEN0137 2.0-bet1 - D1.2.2 Realm Translation Table creation flow.
+ */
+static int arm_cca_build_rtts(struct domain *d, paddr_t base,
+                              unsigned long nr_pages,
+                              uint64_t *rmi_result)
+{
+    paddr_t end = base + nr_pages * PAGE_SIZE;
+    unsigned long work = 0;
+    int rc;
+
+    if ( !d->arch.cca.rtts )
+    {
+        unsigned int nr_tables = arm_cca_count_rtt_tables(base, end);
+
+        d->arch.cca.rtts = xzalloc_array(struct arm_cca_rtt_record, nr_tables);
+        if ( !d->arch.cca.rtts )
+            return -ENOMEM;
+
+        d->arch.cca.build_rtt_level = 1;
+        d->arch.cca.build_next_ipa = arm_cca_rtt_start(base, 1);
+    }
+
+    while ( d->arch.cca.build_rtt_level <= 3 )
+    {
+        unsigned int level = d->arch.cca.build_rtt_level;
+        paddr_t span = arm_cca_rtt_span(level);
+        paddr_t ipa = d->arch.cca.build_next_ipa;
+
+        if ( ipa >= end )
+        {
+            level++;
+            d->arch.cca.build_rtt_level = level;
+            if ( level <= 3 )
+                d->arch.cca.build_next_ipa = arm_cca_rtt_start(base, level);
+            continue;
+        }
+
+        rc = arm_cca_create_rtt_table(d, ipa, level, rmi_result);
+        if ( rc != 0 )
+            return rc;
+
+        d->arch.cca.build_next_ipa = ipa + span;
+
+        if ( arm_cca_build_should_preempt(++work,
+                                          ARM_CCA_BUILD_PREEMPT_TABLES,
+                                          ARM_CCA_BUILD_FORCE_PREEMPT_TABLES) )
+            return -ERESTART;
+    }
+
+    d->arch.cca.build_next_ipa = INVALID_PADDR;
+    d->arch.cca.build_rtt_level = 0;
+
+    return 0;
+}
-- 
2.51.0


