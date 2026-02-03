Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEOfEOZ/gmnAVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 00:08:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E947EDF8EF
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 00:08:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219746.1528634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnPVF-0008WM-O3; Tue, 03 Feb 2026 23:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219746.1528634; Tue, 03 Feb 2026 23:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnPVF-0008Tx-Hz; Tue, 03 Feb 2026 23:08:13 +0000
Received: by outflank-mailman (input) for mailman id 1219746;
 Tue, 03 Feb 2026 23:08:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aUNd=AH=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vnPVE-00088F-8u
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 23:08:12 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34f22c2c-0155-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 00:08:10 +0100 (CET)
Received: from DM6PR01CA0010.prod.exchangelabs.com (2603:10b6:5:296::15) by
 IA1PR12MB8519.namprd12.prod.outlook.com (2603:10b6:208:44c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 23:08:05 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:5:296:cafe::a3) by DM6PR01CA0010.outlook.office365.com
 (2603:10b6:5:296::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 23:08:00 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 23:08:04 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Feb
 2026 17:08:01 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Feb
 2026 15:08:01 -0800
Received: from SATLEXMB04.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Feb 2026 17:08:00 -0600
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
X-Inumbo-ID: 34f22c2c-0155-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsUUJIA4npmCPF5CpNaHxYJYPWk2FJPyyBY229iRbM2gT/Z2LZIIp8D8aChXY0dPfYGspJhHu0w7FJmKU4SbnoMqBAYN/b9WFRwaTkFKYuE+IVeuJ014/tthwwbCWUlxN3CkPqOG+UQ1T3tplRYFfeziFX8YN9eHhWvUbpsjqsiYpctZAGQ6GyBgbiJ7WNRQhmW6jtYRhuOvuNR+gNMfo2vJottXYU+7xqko6rMOv+K4qTu1oOpZzM+PLgMg5mdnnzZq1FbUvlaMKtUm4tVCDvePivNncrzfTFEnFcNFZY0iwRX0ZMMYFaU3CkvjiX4cqDbxAa3GF9+SOwaYrhP+jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WkKPKeqOMJv6FTgk3hjmsdpiM1n+2tag8H0cwjhwBg=;
 b=TiM+5vWzJps2P5HH9dqwqOerZjmR0kn4E8ATAauXwlDdXRELZugijc04lhCTObRPYZDKpzD0n6RY2Qp46RGlYPkDIhAMO+9rtEM6epfepUzviP+z5N8kyJ2tqXZjEMDgLpu8c/oW0uIalSyyUYbXp2ldik303za6Alzzvv/4tAvtD0WYvLNfKwhqX6bMGFuXiqU80aWKmysXAguIvOXKQ+66vy4p32lIZhcbeumkWsRoFCah6+ECE/1SvCN6UwziBLgQ4BD/DbLMbp3PMHJDic1ioeDeRbnW4kACgbeNTMm1yB0w5c/ckYsUxXQPPuGwOlqUvGvHxqNQYYT3o9JXpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WkKPKeqOMJv6FTgk3hjmsdpiM1n+2tag8H0cwjhwBg=;
 b=zT8tpsEA0p6hceBu7rKxZDA+bIGqOubywbiAzZiJ6grunVSmFAM59HHJP+dFdZCjPKwl/SZZMWwpChHKaJyr5UCMn2YQsdoTcMMl+K9KCZO6u620utgn59ySYWzAS4Nj6RtCIn4SPqtOetTwEiZsNG2y4J6q5+hPfuv1Rp/0720=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <grygorii_strashko@epam.com>, <anthony.perard@vates.tech>,
	<michal.orzel@amd.com>, <julien@xen.org>, <roger.pau@citrix.com>,
	<jason.andryuk@amd.com>, <victorm.lira@amd.com>, <andrew.cooper3@citrix.com>,
	<jbeulich@suse.com>, <sstabellini@kernel.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v9 2/4] xen: change VIRQ_CONSOLE to VIRQ_DOMAIN to allow non-hwdom binding
Date: Tue, 3 Feb 2026 15:07:55 -0800
Message-ID: <20260203230757.3224547-2-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2602031502240.3175371@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2602031502240.3175371@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|IA1PR12MB8519:EE_
X-MS-Office365-Filtering-Correlation-Id: aa0d3dc2-cad7-4fa7-119f-08de6379161b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZlhElm//8GIsUWtUFLdD9I73m4MVd7+uzjMPnZg4PRGacq6Q/L3xATO8RzFP?=
 =?us-ascii?Q?tWEWPXI8PRakzMvOsG9QSWy59w7IJ5FMfujxAyqUDufBv67L/kfbMmIR2gbb?=
 =?us-ascii?Q?pmj3HqXuL7uR3bjjq3WwjeOeV42AS7jZhNl1080OycmHphv9lLgZJ3pK73NL?=
 =?us-ascii?Q?uSwmFCZ9rLclX/vkE0oamE0sOlyy0aGI4Wi9zg66h6xG6egskdjEul79AZht?=
 =?us-ascii?Q?Cxv7UV9guYw13KTlyhnlW/aWNo/qB6LyB9ix2jejdDSmJgrRsgU3iB2jbBV5?=
 =?us-ascii?Q?3ODtfnJInvSfChZs3OFPwDlLGYi4G+oM0gYOTUAVDvr5/17sDtekBKEwjdL9?=
 =?us-ascii?Q?TGQcjU2PCmqsC6hzm9yXpDkwYA0q2OqclcurONXf7euOqSYAIlRMZSqdimou?=
 =?us-ascii?Q?GFEfBg6AB2d90ENFektSKlNsy8Fxik37Y3kceNaTxo7Kr9N0NdnVOTcAXO6c?=
 =?us-ascii?Q?7LfGkS7hDlYc6PhC3WQS5J7I3BngKmbCHvWVHr4qUnld6iJn8tgdXIYtc9p4?=
 =?us-ascii?Q?ia7KWCfxg6EapIaWO2+/sCJarZvCVfgi2LTD/yXhWlnAwM2Frl5HLqf4lcT5?=
 =?us-ascii?Q?BBp5ghjsvl5FDR/1mbQWZvewqlWLU18oK1lh79A0wFFFNQPza8cQVxZBr60Z?=
 =?us-ascii?Q?lAVFr59v3aMVnNaQf4oM3ya3A4fLjJ2knTV9ygWfKe8Bgok45DMhAxeigJdr?=
 =?us-ascii?Q?SeAWz8MwkfqE+EKnIOWmsGKeq5MhmaaIC/XHo2R2o/4X7dLmDIRH4n65nPT9?=
 =?us-ascii?Q?wOZfvQ/RFvmnUExLjhZxbULmP6mgLdKfDq3/qVjdDNmSFZPnizGXwyeAAgF5?=
 =?us-ascii?Q?Ln5npb1iGuFO+JmA+WTBVIE8KRKpm5II4odhu2+GrBag+c26R3nriJMEe5EO?=
 =?us-ascii?Q?xK8BSBS3ekgJFLludTUf3aaVhwOYnMNMJFlIPibezHwW556FIRbbJUFL6oWB?=
 =?us-ascii?Q?2hHLQcZBV0Qh2EKVt5Oju7YxCU0sn2qDZ14NBYpaFgkqZdGYEcVMJ+LdYRqg?=
 =?us-ascii?Q?Fk1QIGjd0wL8dLQNKw/9CrTwAmGPGiXxLk768vMHmKYLvAazE/IX9iu58st0?=
 =?us-ascii?Q?H7fJCwFyvl/FeyfRLwE0BV1XlJrFUBHv31idaDobwG8EfZkYuMuZmYn3groi?=
 =?us-ascii?Q?fPzIFZZ0FEin8DvEvlIQy7F9I83eOLgCoTz8xlXbDv3cc9Unb365GdUhmVTJ?=
 =?us-ascii?Q?gmGApYRD7XmDGLiHk87m8a2koewecg1Eon6B8YYpDCay+CIVpeRgNJ2nGnY3?=
 =?us-ascii?Q?0W42ZxBQ3IS7E7Ju+UZwAK8R/iosToGZ5lX5PUHgFQQkp2lIC9AHYvqslEpt?=
 =?us-ascii?Q?rqfea/JImGYZ2UaXYbrfpbhPmllyh2ZHNo0S4a5t7AuaJEDOqalAStgLeiyM?=
 =?us-ascii?Q?tZr7jBSa00yyAgrQu4oO0B5G0RqpIEwzUxwgr/3RHiKtHQ4T+c8eSxchjXCA?=
 =?us-ascii?Q?he46tyZb4A9bVf4ugQWCjdDmcEvKbH9ldkW1Bq4ZGqSbEpu9FySnimp6xd00?=
 =?us-ascii?Q?zwDkW2UDVY6DI95U8aBlgra5JEk0XMeopr8bhg6Ydfq0oCZFAuiL5qDubyIz?=
 =?us-ascii?Q?2ZpBvNUia7dlkggW6gNvVNl6gdMaDxXkX3xlUNYqGN0ZYGy0xatDngrmF/K1?=
 =?us-ascii?Q?1GkqEO2+djq2Q23via9FodtLaD6hurhMBUeFTXxfam+Bi4y9GI/vaGmaeuSW?=
 =?us-ascii?Q?zr2DMQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UwdOksNpwNOmXuGoTkDnNTsp3S0HcvnIwaRCehl0xUvmqIrimxT+HKrvibkvnxls2HYpIHbgeGE58VLfX87maheqvY2eZM7OZaUhC6i2dSfODaarbmcsqbVwEKPWCFa7rXM7GbO9IrAActrWD3atHUsooj+oXM8l25JtKKpp+ahKAO0/78831Efuym6URmfW/C9+ixz6rVyB90gnu2Xz8U32Fsl+FtVQW7Pg7IgVWE0H0Kn36RMQDuS/tFETG1H5hh5gD3j/Q/qP+Uks+4p13Dh67FO7eSRBJHYDdZRVTNXn34aW/OS5TD29MB49nPwJHPTrakfB+0DuIKWOeOQxdSVxsBRBu9TmN8AxAG16/FHxS8n2jPfSAZqqnsnk1yqrGndQ981K3oY9dQROY5nl5JMXpU6U2UyYprhkLlilmm8Vo/Pfd4CpsyBE5gVoCY7k
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 23:08:04.5498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0d3dc2-cad7-4fa7-119f-08de6379161b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8519
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:sstabellini@kernel.org,m:stefano.stabellini@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: E947EDF8EF
X-Rspamd-Action: no action

Today only hwdom can bind VIRQ_CONSOLE. This patch changes the virq from
global to VIRQ_DOMAIN to allow other domains to bind to it.

Note that Linux silently falls back to polling when binding fails, which
masks the issue.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/common/event_channel.c | 1 +
 xen/drivers/char/console.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index a3d18bc464..f9becb4ca5 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -138,6 +138,7 @@ static enum virq_type get_virq_type(unsigned int virq)
         return VIRQ_VCPU;
 
     case VIRQ_ARGO:
+    case VIRQ_CONSOLE:
         return VIRQ_DOMAIN;
 
     case VIRQ_ARCH_0 ... VIRQ_ARCH_7:
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 35f541ca8e..fbc89ca2a4 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -613,7 +613,7 @@ static void __serial_rx(char c)
          * Always notify the hardware domain: prevents receive path from
          * getting stuck.
          */
-        send_global_virq(VIRQ_CONSOLE);
+        send_guest_domain_virq(d, VIRQ_CONSOLE);
     }
 #ifdef CONFIG_SBSA_VUART_CONSOLE
     else
-- 
2.25.1


