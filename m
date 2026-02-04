Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO0SOkDYg2lbuwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 00:37:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1028ED4F7
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 00:37:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221254.1529537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnmR6-0002Ho-Kk; Wed, 04 Feb 2026 23:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221254.1529537; Wed, 04 Feb 2026 23:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnmR6-0002Cg-Gq; Wed, 04 Feb 2026 23:37:28 +0000
Received: by outflank-mailman (input) for mailman id 1221254;
 Wed, 04 Feb 2026 23:37:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gU/K=AI=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vnmR5-0001wI-1B
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 23:37:27 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7549d2a6-0222-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 00:37:25 +0100 (CET)
Received: from BN9PR03CA0501.namprd03.prod.outlook.com (2603:10b6:408:130::26)
 by SJ0PR12MB8115.namprd12.prod.outlook.com (2603:10b6:a03:4e3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 23:37:18 +0000
Received: from BN1PEPF00004683.namprd03.prod.outlook.com
 (2603:10b6:408:130:cafe::c6) by BN9PR03CA0501.outlook.office365.com
 (2603:10b6:408:130::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 23:37:11 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004683.mail.protection.outlook.com (10.167.243.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 23:37:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 4 Feb
 2026 17:37:17 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Feb
 2026 17:37:17 -0600
Received: from SATLEXMB04.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Feb 2026 17:37:16 -0600
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
X-Inumbo-ID: 7549d2a6-0222-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXOHtvNtMhHVxi9pGyN95NyCmt2c9E4rh8Hhcur3/DVhNUxTbAU84yoqgVDoGJMEqwLc57vXqU9K7PYa3k+YckdbPgsQUW46PGpNLvmFYpbD7jFz+7EMOGNPe5BUF7WxDGVfZP/A6mJS+eUdGxoqf0LAfMoW7uix341EQLLRuRV0IKyUrdiQaOhufT/3F/OGqIMIMkOIGH+M+uG9zJWEUlDuBJ1uZF0pKsST2eqh7qoy07cq+IYfyGKyCsEiCYQAdZtHa80qwGMViFndBlXxTExh5QoPiqGb90XXj9tGTNn5zHHAX/1aGzMLe8Eadwp42GVDfAM6ctbZRx8TrMvj2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqwBp4MnNYKS6IvAa9j+HIjyvIvt0WGP7tqhc7zOsLU=;
 b=ExoQGo4s3V/+PqVPPuHLz+5xsKbXQW+A8ESdkvieZ79cdcI1ulC6h64qt7YkFQM8rwz1uXESevV4wWhd1yrj1Nta7p/iOPymzf2Ns3j0hkregsT5mqqAT2p1fA55KxttkMdNay22fBqGaHZF7Yc2EXkroefHGOom+Sg9pJKobs8VdiDVtSlvLtoPny6NXwa/FyRA61L2L0WaCcWJWf1gjcO8U9qaev8W/TidkhKCUocI+uvahHsYIa2+nzkrpw7lhd1vx+VYsHaQInbVQX0oTbiBrb+0S6nr5weontOI66CNhz4Ru0FKPHGo8Md3mrJU/uJyEAJELghvlY9omHgn+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqwBp4MnNYKS6IvAa9j+HIjyvIvt0WGP7tqhc7zOsLU=;
 b=Q8kPY6rzJI0ZKXYBLrWSkfNwkscV0FguUXxIF1F5Ukv7ZYThPByrJvwTp5BsaTAP4z05DSY5mEmZ8vhVw2ecMM45x0a4x7ToMprBGR/nKEcz1jOzyLzmWfBfIX6ln20qyVIdafxHqnd5DIKzI8CGoRFAIDxHErJhSFpZyoHeEtU=
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
Subject: [PATCH v10 3/5] xen/console: add locking for serial_rx ring buffer access
Date: Wed, 4 Feb 2026 15:37:10 -0800
Message-ID: <20260204233712.3396752-3-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004683:EE_|SJ0PR12MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d5794e7-a201-4095-f762-08de64465582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bufdVQeOzJdkhUBif+opBdDYVnsog7QBoI0OWVG/O3EqsIjUEhf8ukNSE5oV?=
 =?us-ascii?Q?LgbsDb2mVKn+RQfRW8+zKjuD38w0S/q+WGzqdZSzHLYGlgTifg7ZuTrXvm+v?=
 =?us-ascii?Q?sJ2cEfbIW6RZ/J71fgvzfOyKNOW3un3YOZhZKiC2vX/8U6R4EuugCjgVWWOo?=
 =?us-ascii?Q?cxgjuHmD3HaB1mz0lYxtwX+6NkrXthGZleZL9F4UwFky8D2+QYRzNBz/dQ2n?=
 =?us-ascii?Q?k+Mk6O50fqZKcjL876MBIZSIPlKINW+WSwzppLSHw+rn9TLzCyuxS9pyCUs9?=
 =?us-ascii?Q?JA4PApib8O8uG7NcfqYd51qcwNyTzS7AhzXG6qWs63NK1I4YBMCU4G85fqbk?=
 =?us-ascii?Q?JWgsphyq1hFzrGvua4rAQozTKP1yweYx+uCEvHUNJp6Cw7aCtCa/RRWbX4qt?=
 =?us-ascii?Q?o9UsYVqscPMmLVI4x6eehrBK7zyh1UIiqQ9Bp7yURG85VUdwCXUuCET+/0HN?=
 =?us-ascii?Q?d26pveSC2Vfvv9lE1lH6mYhSJ/UKLU2IR1VuzrihvsRmsEEsoIluacGGQm5k?=
 =?us-ascii?Q?CLxw/l8eOPr+Qji8NE3G/XcCSBPn4kTlz0XSnJjeeMq4FjbzsFyY3Th5d8Tp?=
 =?us-ascii?Q?YYQ4TYvPWTliiKouSeZl3EBkJczSQo8Gq09JwNBcck8F08NAW9BVrE0JdTaF?=
 =?us-ascii?Q?E4zX30HhBukUaM2zM2u4SLnaBFfVgQ4NcdY+VFhd7qat09hwBDOdKx3H9W7c?=
 =?us-ascii?Q?3Vuv15KrL/n/7nUfCu+vAapAEDwj9vtxPQgOTr7FurutGFSpuX2aGqlY1Kxj?=
 =?us-ascii?Q?pFmdtnfkptcN4BuynPLl3g3GYCyn3onIVZxgoYciGG0hxPnyiqCKGR7q33V3?=
 =?us-ascii?Q?w126WabMX9c+xwDny0p9hlTvdvbBWkzm3xeW557aI1lhedJ/fetfdUDT4/Tt?=
 =?us-ascii?Q?9qEDNoQbNITT5/n4elkCOjeURcBDJmrPv+6e60N9Ezr6XHNQjLwdT1QbKmdR?=
 =?us-ascii?Q?5vDQMkfEe7QaWtOhuhYW72M95DXDWS060iDJbRYeKaMw5vWi+QFyMf8mqtsO?=
 =?us-ascii?Q?bXHLXAC40YgyGV7FWC49jDPKEVK7HMQcypYqjAm8cR4gf5TGr82+DxCYaVm5?=
 =?us-ascii?Q?D4bBeTYg8cGJymuE2J77aQYcMKZ5Kd+lQ4LvdC1ctFHDSH8Zn0KOHN3rNRnU?=
 =?us-ascii?Q?+LBiCvM9m9/2tGajJB6/KTpEAExMFIT37nvcVKCu6J4/OTzkNE4HrMHXD9dX?=
 =?us-ascii?Q?+qy0xbfpiHN2v8LwgmQiqLt7LX2wlyF0NvLUmkqL9tPzD4vHCUir48BlmTFk?=
 =?us-ascii?Q?J/U+OdIlDaRH5k/wcn14U90Y8WYaYi47yJOC7jAJ6vthF/8VRp6WLpFBWuqL?=
 =?us-ascii?Q?SHDYcPNTbZZSIGGZw7E1wvwzSNBCrh5P1SDhCO4b7L3fxe4oQIYhh3wE8/IU?=
 =?us-ascii?Q?k7ATZXbn6ggl4rbL3ptbxcX7XPfR22rjFPuP7PSRw8wGYATRPtrqXk7qqulT?=
 =?us-ascii?Q?qNuBnIj834Vr/xDa2N9rICgvS0ZWNxPIjsPBLVZea0mZ5zUWJpj5sLpfMitz?=
 =?us-ascii?Q?npLYYLar37DkEyYFbKWnRKpoQLUi2osBsaztxsBm5d01fUkwGnNwpA7EUI2M?=
 =?us-ascii?Q?joxEExgZGUvC6+A0SjVG1BgycAvl4krr6nESVWRBTBJzXWfqxZBCo2C7IH/Z?=
 =?us-ascii?Q?F9/lbxL2an0YJEf27I/qrlt7J1zLaqzM6s5OctIbc7//Ph7niym/lDKwoCfM?=
 =?us-ascii?Q?LDLwGQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rQBX5GxwKI8nUpmd7O15a3ozboYJ/XImy0TPuLglSISmQKFuc3Bak46f9CH2OlKgfdN7R+wL3W4OLUc0dJE/lOV4ByG2VqYJL8v0PrVoORvHhZsXYg6EsEdSCEMAEivkpA9VufT/AsrH7/W0rSqicW8Mc4d+Mz9115GYlS2U1BeK8hNuqJT2ge15AuHkV281c1yJD1M+Uv5EgowVJXPGIhUpRpOhTVCooNZ3vYYj7ErjAMS2ox061KyJ1LAXGuPZiHi8lfHd1zamu0weItCFjd+q4XS/js2Q5Olvc6BABNaXdhiGFlsR19Duxq2HWQ0di90BaSFBAZu0FWzDHaDZJqr2vjAxjZ6KusTSM9ZNhu2DMZU8og1DEai8zQN8YWaN2ArzpTFx3aayDlHEX6BbsA3ud2yeH9HPfckvhx9YcPbcTOUWq1CQSeBv1dQjlgkp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 23:37:17.7884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5794e7-a201-4095-f762-08de64465582
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004683.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8115
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:sstabellini@kernel.org,m:stefano.stabellini@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: A1028ED4F7
X-Rspamd-Action: no action

Guard every mutation of serial_rx_cons/prod with console_lock so that
cross-domain reads can't see stale data:

- In console_switch_input(): protect console_rx assignment with the lock
  using irqsave/irqrestore variants since this can be called from
  interrupt context

- In __serial_rx(): protect the ring buffer write operation when
  delivering input to the hardware domain

- In do_console_io() CONSOLEIO_read: hold the lock around the entire
  read loop, using a local buffer copy to avoid holding the lock during
  copy_to_guest_offset()

This is preparatory work for allowing multiple domains to use the
console_io hypercalls where proper synchronization is required.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v10:
- patch split into two halves, this is the first half
---
 xen/drivers/char/console.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index fbc89ca2a4..ad53073b99 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -553,10 +553,13 @@ static void console_switch_input(void)
     {
         domid_t domid;
         struct domain *d;
+        unsigned long flags;
 
         if ( next_rx++ >= max_console_rx )
         {
+            nrspin_lock_irqsave(&console_lock, flags);
             ACCESS_ONCE(console_rx) = 0;
+            nrspin_unlock_irqrestore(&console_lock, flags);
             printk("*** Serial input to Xen");
             break;
         }
@@ -576,7 +579,9 @@ static void console_switch_input(void)
 
             rcu_unlock_domain(d);
 
+            nrspin_lock_irqsave(&console_lock, flags);
             ACCESS_ONCE(console_rx) = next_rx;
+            nrspin_unlock_irqrestore(&console_lock, flags);
             printk("*** Serial input to DOM%u", domid);
             break;
         }
@@ -602,12 +607,16 @@ static void __serial_rx(char c)
 
     if ( is_hardware_domain(d) )
     {
+        unsigned long flags;
+
         /*
          * Deliver input to the hardware domain buffer, unless it is
          * already full.
          */
+        nrspin_lock_irqsave(&console_lock, flags);
         if ( (serial_rx_prod - serial_rx_cons) != SERIAL_RX_SIZE )
             serial_rx_ring[SERIAL_RX_MASK(serial_rx_prod++)] = c;
+        nrspin_unlock_irqrestore(&console_lock, flags);
 
         /*
          * Always notify the hardware domain: prevents receive path from
@@ -796,6 +805,7 @@ long do_console_io(
 {
     long rc;
     unsigned int idx, len;
+    char kbuf[SERIAL_RX_SIZE];
 
     rc = xsm_console_io(XSM_OTHER, current->domain, cmd);
     if ( rc )
@@ -817,6 +827,7 @@ long do_console_io(
             break;
 
         rc = 0;
+        nrspin_lock_irq(&console_lock);
         while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )
         {
             idx = SERIAL_RX_MASK(serial_rx_cons);
@@ -825,14 +836,19 @@ long do_console_io(
                 len = SERIAL_RX_SIZE - idx;
             if ( (rc + len) > count )
                 len = count - rc;
-            if ( copy_to_guest_offset(buffer, rc, &serial_rx_ring[idx], len) )
-            {
-                rc = -EFAULT;
-                break;
-            }
+            memcpy(kbuf, &serial_rx_ring[idx], len);
+
+            nrspin_unlock_irq(&console_lock);
+
+            if ( copy_to_guest_offset(buffer, rc, kbuf, len) )
+               return -EFAULT;
             rc += len;
+
+            nrspin_lock_irq(&console_lock);
+
             serial_rx_cons += len;
         }
+        nrspin_unlock_irq(&console_lock);
         break;
     default:
         rc = -ENOSYS;
-- 
2.25.1


