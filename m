Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GruKkTYg2lbuwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 00:37:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D7FED50C
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 00:37:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221256.1529562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnmRA-0002yi-Hh; Wed, 04 Feb 2026 23:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221256.1529562; Wed, 04 Feb 2026 23:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnmRA-0002v5-CP; Wed, 04 Feb 2026 23:37:32 +0000
Received: by outflank-mailman (input) for mailman id 1221256;
 Wed, 04 Feb 2026 23:37:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gU/K=AI=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vnmR9-0001wI-38
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 23:37:31 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77f34a59-0222-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 00:37:30 +0100 (CET)
Received: from BN9PR03CA0501.namprd03.prod.outlook.com (2603:10b6:408:130::26)
 by SJ0PR12MB6710.namprd12.prod.outlook.com (2603:10b6:a03:44c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 23:37:19 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:408:130:cafe::c6) by BN9PR03CA0501.outlook.office365.com
 (2603:10b6:408:130::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 23:37:13 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 23:37:19 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Feb
 2026 17:37:18 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Feb
 2026 17:37:18 -0600
Received: from SATLEXMB04.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Feb 2026 17:37:17 -0600
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
X-Inumbo-ID: 77f34a59-0222-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+5GhNmgPyXYn+xfNH7p1CHD+wBKFMgTdy4kIwrzotDd5gba9c3ScKOg/mwJ3HKjwaTSD4DPTzag1QbBV34i0S7EBs3ZvOPAek2OKXYZaHLbQPk+ASuCYzP8JmDen56sPd7T4QlWlZlLDdSUHCGDPzHaK9k6S2+kSEJJZVYUDsQfs9HK6JShZkkgnQyTby0kMePKDUE6rsxcyrorroQkZ7oCVMrbRXK5IvOr073IRqVDX+/Mcpvt6zbn/WdGA+XUbH5W8EkPw1hjjgK8ZPiGPaKRGepv47CEd+CrA7gFtGiAwPdDJuWcnMs26iUCAzlDl91UTmSuOZSOJXIWMzSc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJpIPQ9Ec8gZQSWwgKAgJ5LcBcdzjYPpdERL2oD0YAY=;
 b=M0d54LBxdZlOTwy/7HkAwnoLg34w1QLIpsRS4o6TTOQtnrczKAzk3mZLrFt/gy3vemr4gtWRzh1Axou+yjl9N9lc4+1WckyU/sg+5mU8v/lm6SY1wXcfCw9ojSXHBeohaO006M5LDG8H43CKqeI7EASuu+l47J6v6svYRPqS0ulut4CnBVkBxj6wmYOEB4TKiylB9gSIGUgVj55L8IdFUvUa7b7sUfVM/l+PTArma+LNIiL95BZOeEp89d6pTuV3tRTkIym9J5p6V98tIxtsL6ankC2R9DbG3ZR3QrxMX0jKRSwvUYs3sljbLzZmZRcqK2SsmkRyRSC3fV73G3h4BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJpIPQ9Ec8gZQSWwgKAgJ5LcBcdzjYPpdERL2oD0YAY=;
 b=Wf0iy+1oByQJ9uQCCteZqtveWhWm6wdyMz4su/UBKkxNxsJsyY5vgrBGsIKQXU4AOqL2ykaHFaK7EKdCsbH6Q7I1KJhKZkELViGvoI1B6dvH4ouefLptfxWJ9bzbdUoL4OzT6ja6DYYNqrXcSxgHGQtVv2gIdzoyNzTRBeSBEQE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <grygorii_strashko@epam.com>, <anthony.perard@vates.tech>,
	<michal.orzel@amd.com>, <julien@xen.org>, <roger.pau@citrix.com>,
	<jason.andryuk@amd.com>, <victorm.lira@amd.com>, <andrew.cooper3@citrix.com>,
	<jbeulich@suse.com>, <sstabellini@kernel.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v10 4/5] xen/console: handle multiple domains using console_io hypercalls
Date: Wed, 4 Feb 2026 15:37:11 -0800
Message-ID: <20260204233712.3396752-4-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|SJ0PR12MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: b64183d4-733f-4220-59f9-08de6446567c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OF2O+aGGIss1OtiLDTMUA2LuQsO76ODGpr3DwQrYhQGmATnIEN1pQPjp95Jd?=
 =?us-ascii?Q?/ueW8M55ZENJzyswc8g1AoGMNURSryLdRRlNuzjHtbxOoBiL1hW5aH8el3nS?=
 =?us-ascii?Q?l+7+QYHv2PFDpJeHtrub76YRZEfMNUa63ajDl20G+zUyymtQ+8qOpdu/IHIX?=
 =?us-ascii?Q?jHy7YkaxYq7e79nbWy80kh1QQz2t2qeF6okDq1p8fRnAU1MXzap1LfuDpX3W?=
 =?us-ascii?Q?9euDlK4CSP7cWsXvJBRiqcSZ3OKTP4yBtKp1urLxNbpE3sWwN1vXodPCRqb5?=
 =?us-ascii?Q?8EQx1cfjHMVAP56V1nYpNXzEJwf6t4jHvfmxohk6gmS5RyQjFwlJB2Kci06n?=
 =?us-ascii?Q?CQ5ZT4TzzAB2R3EeDTclP//HzLZwJndSTlBFr11oM0uXDRT//2bkPkN8ZfHi?=
 =?us-ascii?Q?yxkJznwrPaB3ofGXePBlXJDlcg5QAVEC8jEFKlUtLRzAD9s4sHLcICTxKwvE?=
 =?us-ascii?Q?TDDOZq7aAO50m+zm6h25JcvJKQG2qg8fQ598g0L+X3bSYswnWO5PZNxUzTVF?=
 =?us-ascii?Q?Ko/npBGDFS4vlslSwnQsInOepKstBDggA87stgvT680Rk1H+RvX4zkJh1ooJ?=
 =?us-ascii?Q?N1iCIP8hd/aETstEw4KtQj6esA+GHVDKjMd5rYc82XzZ8MggLO9gup5MeEpt?=
 =?us-ascii?Q?Bdv1E7UDilRg9AuKOcFERqKkbSYvDpZcH54dabgaazA79Yny/sb0XSkDp/Yq?=
 =?us-ascii?Q?bFizPQmY0l8m0OANB3gW7rIuSNg9+L+TEw9AqPAmO0rfhzf87pByGWiPgpQ6?=
 =?us-ascii?Q?N6K8npC1TLRUNJSOsrVZDZNQSWe/75ZChbe3p029UjprJZIfVjvas4M/Higk?=
 =?us-ascii?Q?mQJCIdwTW5ir+SxgQzgE2657m5PZ+M6NsZJre+nb374SxxhEUpw30GUaWUdn?=
 =?us-ascii?Q?9M7WLy/TdqtkdoJiUEOPsKiV8NUqjo53t4DIqpcEcDZwLIoVSQwpG05T9trO?=
 =?us-ascii?Q?QkxkT0UMCynDAbH7A05UW4Ktw3be4BTWK7opJRILTyFknw4NVJIONJMZXlxJ?=
 =?us-ascii?Q?csaZknDlZyTsCUUrSaeVMAIZ8cVeYdmBihSkt5wsLYNXkOS8EOWlIij2ereD?=
 =?us-ascii?Q?Y7xqBvFBJFvjJhrPqz4ToHjMBlnsx2pfNZH0ly4R7O0jVEn4wM/Cd+qln2cH?=
 =?us-ascii?Q?M8I+5YshirtoeH8NViYIGO/vk3jEwALUFh8F4jEpOpOP5oKO0edXo1uZKlHI?=
 =?us-ascii?Q?xD7Jfgq2rHzbv09GIOJlOzRboGqWGxhnl2zlHvldJkeCzxwbEhVUTAPzWun3?=
 =?us-ascii?Q?UYxwD0D5EKs5ivktC7pPWGK1VUEplSOXaGFgV+d3lFKnXHFoJHaD5/LaYQ23?=
 =?us-ascii?Q?ElXZesaUiVCJHP31wPI+ZOenwJKFrajWFzQ8Wec4BHAhEvTF0+xK08ytNQUb?=
 =?us-ascii?Q?uOgnLrbPK5YT+quXffIXrtvG1Tec4aHCBC82dyLVG80GrbOyPU+fhdVkAOXi?=
 =?us-ascii?Q?p5iS+525S5fMXUzkdeKV3JWF8UdPWW7rSg/tHT/7v/jFUBoSQJuzskdde9j6?=
 =?us-ascii?Q?SdZ9psgLNNLyf78BHYW31FmiBUYXhRhCI+2vR5Uqe2hpk8sT78S5J6eGpZh8?=
 =?us-ascii?Q?cxegJlp4xy0nMO2p/BSdgd1nblsQ4wijhNUE3kFRO8Ko7ZDzMLHf6yfdq3EO?=
 =?us-ascii?Q?cz5QYAN5dB2xeO5p5XLbs3fDptuhHb4FyVxyfLsrbNdROoFqiiNji2qcAP9Y?=
 =?us-ascii?Q?3hRsig=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1Mbec0mvVIBuAf+0dvipf7CbZvT2zx8OGDElS3biPMkESmdrCI1MIHxaI3bjWkN2vrtU3zvwK+qXu5KReuYMzvdXksKX7OTZx8cALiQqPaYNe9I+ZRR8McQ2e5ePHY63oaMA3BfPIuFPPjlpG4rqEJyZKEDOfuhRDrRop53ODDm3yZfB0vG7BCTb0IWUsONMBPdh0CuLHSGGkamQcvL32sxNaCTikcWZUwfnRGPQLr2m2IwYeZcEel0P+UtrxMV+lkd3Sj4XgJuzKjmRbYHKyEInxSnDbwzS0NYA4TEQmpYAGgmWlbTTxGLks8WcWSJKRoaJXLAtq5gBFlmd+LoTVzPOWmvLpR2QmtMJ+VMopnBqqOqg0aG0h1Bonugou2nYoqbMt6Yaa/RHiZ/68NjgnfUEbIPPmPTf1PW8cKa9WSsefCD/kCdvIgfXwD1xKfWr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 23:37:19.4241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b64183d4-733f-4220-59f9-08de6446567c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6710
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 01D7FED50C
X-Rspamd-Action: no action

Allow multiple dom0less domains to use the console_io hypercalls to
print to the console. Handle them in a similar way to vpl011: only the
domain which has focus can read from the console. All domains can write
to the console but the ones without focus have a prefix. In this case
the prefix is applied by using guest_printk instead of printk or
console_puts which is what the original code was already doing.

When switching focus using Ctrl-AAA, discard any unread data in the
input buffer. Input is read quickly and the user would be aware of it
being slow or stuck as they use Ctrl-AAA to switch focus domain.
In that situation, it is to be expected that the unread input is lost.

The domain writes are buffered when the domain is not in focus. Push out
the buffer after the domain enters focus on the first guest write.

Locking updates:

- Discard unread input under the lock when switching focus (including
  when returning to Xen) so that cross-domain reads can't see stale data

- Require is_focus_domain() callers to hold console_lock, and re-check
  focus after each chunk in the CONSOLEIO_read loop so a focus change
  simply stops further copies without duplicating or leaking input

- Hold cons->lock while flushing buffered writes in the focus path so
  the direct-write fast path does not race buffered guests or HVM debug
  output

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v10:
- patch split into two halves this is the second half
---
 xen/drivers/char/console.c | 52 ++++++++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index ad53073b99..d3ce925131 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -541,6 +541,12 @@ void console_put_domain(struct domain *d)
         rcu_unlock_domain(d);
 }
 
+static bool is_focus_domain(const struct domain *d)
+{
+    ASSERT(rspin_is_locked(&console_lock));
+    return d != NULL && d->domain_id == console_rx - 1;
+}
+
 static void console_switch_input(void)
 {
     unsigned int next_rx = ACCESS_ONCE(console_rx);
@@ -559,6 +565,7 @@ static void console_switch_input(void)
         {
             nrspin_lock_irqsave(&console_lock, flags);
             ACCESS_ONCE(console_rx) = 0;
+            serial_rx_cons = serial_rx_prod;
             nrspin_unlock_irqrestore(&console_lock, flags);
             printk("*** Serial input to Xen");
             break;
@@ -581,6 +588,8 @@ static void console_switch_input(void)
 
             nrspin_lock_irqsave(&console_lock, flags);
             ACCESS_ONCE(console_rx) = next_rx;
+            /* Don't let the next dom read the previous dom's unread data. */
+            serial_rx_cons = serial_rx_prod;
             nrspin_unlock_irqrestore(&console_lock, flags);
             printk("*** Serial input to DOM%u", domid);
             break;
@@ -610,7 +619,7 @@ static void __serial_rx(char c)
         unsigned long flags;
 
         /*
-         * Deliver input to the hardware domain buffer, unless it is
+         * Deliver input to the focus domain buffer, unless it is
          * already full.
          */
         nrspin_lock_irqsave(&console_lock, flags);
@@ -740,6 +749,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
     unsigned int flags = opt_console_to_ring
                          ? CONSOLE_ALL : CONSOLE_DEFAULT;
     struct domain *cd = current->domain;
+    struct domain_console *cons = cd->console;
 
     while ( count > 0 )
     {
@@ -752,17 +762,36 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
         if ( copy_from_guest(kbuf, buffer, kcount) )
             return -EFAULT;
 
-        if ( is_hardware_domain(cd) )
+        /*
+         * Take both cons->lock and console_lock:
+         * - cons->lock protects cons->buf and cons->idx
+         * - console_lock protects console_send() and is_focus_domain()
+         *   checks
+         *
+         * The order must be respected. guest_printk() takes the
+         * console_lock and it is called with cons->lock held. It is
+         * important that cons->lock is taken first.
+         */
+        spin_lock(&cons->lock);
+        nrspin_lock_irq(&console_lock);
+        if ( is_focus_domain(cd) )
         {
+            if ( cons->idx )
+            {
+                console_send(cons->buf, cons->idx, flags);
+                cons->idx = 0;
+            }
+            spin_unlock(&cons->lock);
+
             /* Use direct console output as it could be interactive */
-            nrspin_lock_irq(&console_lock);
             console_send(kbuf, kcount, flags);
             nrspin_unlock_irq(&console_lock);
         }
         else
         {
             char *kin = kbuf, *kout = kbuf, c;
-            struct domain_console *cons = cd->console;
+
+            nrspin_unlock_irq(&console_lock);
 
             /* Strip non-printable characters */
             do
@@ -775,7 +804,6 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
             } while ( --kcount > 0 );
 
             *kout = '\0';
-            spin_lock(&cons->lock);
             kcount = kin - kbuf;
             if ( c != '\n' &&
                  (cons->idx + (kout - kbuf) < (ARRAY_SIZE(cons->buf) - 1)) )
@@ -828,6 +856,8 @@ long do_console_io(
 
         rc = 0;
         nrspin_lock_irq(&console_lock);
+        if ( !is_focus_domain(current->domain) )
+            count = 0;
         while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )
         {
             idx = SERIAL_RX_MASK(serial_rx_cons);
@@ -844,7 +874,19 @@ long do_console_io(
                return -EFAULT;
             rc += len;
 
+            /*
+             * First get console_lock again, then check is_focus_domain().
+             * It is possible that we switched focus domain during
+             * copy_to_guest_offset(). In that case, serial_rx_cons and
+             * serial_rx_prod have been reset so it would be wrong to
+             * update serial_rx_cons here. Get out of the loop instead.
+             *
+             * rc is updated regardless to provide the correct return
+             * value to the VM as the data has been copied.
+             */
             nrspin_lock_irq(&console_lock);
+            if ( !is_focus_domain(current->domain) )
+                break;
 
             serial_rx_cons += len;
         }
-- 
2.25.1


