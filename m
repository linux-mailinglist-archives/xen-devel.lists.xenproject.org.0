Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8EBAF8E99
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033088.1406534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXckZ-0007oy-LY; Fri, 04 Jul 2025 09:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033088.1406534; Fri, 04 Jul 2025 09:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXckZ-0007io-F9; Fri, 04 Jul 2025 09:30:31 +0000
Received: by outflank-mailman (input) for mailman id 1033088;
 Fri, 04 Jul 2025 09:30:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXckX-0006x0-5l
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:30:29 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20617.outbound.protection.outlook.com
 [2a01:111:f403:2413::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84ec5c5b-58b9-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 11:30:28 +0200 (CEST)
Received: from MW4PR03CA0254.namprd03.prod.outlook.com (2603:10b6:303:b4::19)
 by SA5PPF6CDAEAF48.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8cf) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Fri, 4 Jul
 2025 09:30:23 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:303:b4:cafe::e8) by MW4PR03CA0254.outlook.office365.com
 (2603:10b6:303:b4::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Fri,
 4 Jul 2025 09:30:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 09:30:22 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Jul 2025 04:30:18 -0500
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
X-Inumbo-ID: 84ec5c5b-58b9-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmFdAK5lIjFGhkuJLVjbwZMU96s+OuKLO5Txbnl1tnhPzfx4UQDA33kw7yczzgZEivrYinb3/06xwG0iq+vcFUhK/QZDbWTbs7IQbBZ5+iJ1jwOdjk2pew+q1SphnzAKGVLJ9Er43TSdaQrjpgHxMWjqh3Bc2ITzMQtZoE575FSfhDMjvThQGkhRogehFE8CgMW/eLwfwpNRMZyiBYY35CROmDHd/IiTTR/SxZdusTbi8S+JeSYPKa6l/adtf/4HgYP45IWIx7g2UjJGGbNkG9qNgKXpiIjtl77smQRhO0FLgMlOgnah4sC+V9zQUj+LZO5QkllrZ3U/7KAfpDJq5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30rk0j5lpGbWOdYBsFmDDdDPGEoAQD+DekB96/2T3ls=;
 b=ssUTmAJTKCZPlJdWut365YvFtd/7zgZoc3ElXT6MSystRUTFP+0zJ5ExxsiUmw7Pne+6YXPv+ghgQicdXCaCRiDar8hdAqaKO7WJalNa2nP4TzqDQ477gDXnrbkLnK9NEg67XYldNf1nqmYHj3S7QNkTigusIKmoQwwNpotifzlbDzQiAX2lC+rWFWS9wGKRorZjnxNRMEZwFHGR8qYB+imFgcuVQnadyAFK7Sul6zBSQqBX0PtMhWJ7lQiZlcjfw3umAFqV8KC4grkGvRSiJ69Wt2iNywJxRn3k3RaxgDbRzugY3QbHqVHPYCbrVnnD6gt3IZjKKQfjxFRat3mNdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30rk0j5lpGbWOdYBsFmDDdDPGEoAQD+DekB96/2T3ls=;
 b=Q3PyWFY7V8xKHeo8hK9Oxu3uCEuSR/NEKTCfEdfpNt7/wLof2BDStqt5wlyEg9lRLJhNQfX7QntJMMUo4DE+AE/Og17KvgaANQwpx94xFza6BfvXGNxhq/RaMFyQvjao9+WlnT7iRZwYuHxNEMXXm1KNnZkEx1ztxT1G3oFjYvk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 04/18] xen/sysctl: make CONFIG_TRACEBUFFER depend on CONFIG_SYSCTL
Date: Fri, 4 Jul 2025 17:29:38 +0800
Message-ID: <20250704092952.822578-5-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704092952.822578-1-Penny.Zheng@amd.com>
References: <20250704092952.822578-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|SA5PPF6CDAEAF48:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ea300e5-118c-439a-8b42-08ddbadd6669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/9xxXtRaPS8uvj/f/SE6/sBQI4rdCZ1N1eo1MlZjFlts8leIcCYZmVdjurDx?=
 =?us-ascii?Q?RtLWE6/OaSlY9OcEi1HeS8Y5oTcJb3KTsHC2kQ/d2zQWd/c5CVJUyLvHQL4t?=
 =?us-ascii?Q?CgqgpischsnDmTCbApA1jOpGOJW2OenKHtG3VNI1KdeGyVLHuXzOJxpkYlMQ?=
 =?us-ascii?Q?9fIIkPNQxJVDDoOGLW5gs4aLMjcpUv/thISlzetOpvQNOU9YKgNWGFcQsYtF?=
 =?us-ascii?Q?V+bZxJP8bLMLHjZLJ5YByXUdNkFCyGoY4xNu5UsSb3/hLDXQehvOoGqliDf9?=
 =?us-ascii?Q?89QeuTeVzudMO9YYAuJta/YOMU4JWvZYjScUOperO/NfRQRNgDHfrSu99/rW?=
 =?us-ascii?Q?1niz6iINbCgF3ZtppSjUiVflSlRvyV4SKJJVRQTIU/R0zmj6DPVJkruYpKVk?=
 =?us-ascii?Q?sK4XjzrwqLFvXo7crho9TApzxKgzPSJeGhF/1j84PeImBnpxGavjIUkT2XTi?=
 =?us-ascii?Q?mXX8qnysEBkqGN87ECVH6bVIb52TcYgKTBFkgaYoq4NbFty3duzNKmMwQJsm?=
 =?us-ascii?Q?uSHNBPPACn+weaEkA3Z5ycJrPXqzlEo7S91JwVCj0wnjqGLfsRHpgfTErlAW?=
 =?us-ascii?Q?nCBwWrEnr/SH8AsyNHGkci0k9tkZqfT2poim5eWtNWSsV4noPOyfvPkP6H9f?=
 =?us-ascii?Q?ZFrypN2ogZNb4nrFJPFES3H26henxFiy0dFfcI6GQ0mkxntKCw+Lex40Dwa2?=
 =?us-ascii?Q?8Mt7kbruxr2uBs7ZQc7MC4irRgrsJdKvbXQbrjNH8ljoflBy0MhLK/NqP75R?=
 =?us-ascii?Q?cMdXAMFGuhHYnIEzwoz87GIXTYdYepxvb8y1jkKbNrGJfFZ/t9WoYTTigiDl?=
 =?us-ascii?Q?wLFOAMp7Mb0T2ZruUiTntb1pJ8GaclKKogaaQXREWZi1JLnEkpuTuMrGaGiT?=
 =?us-ascii?Q?eEYTzJWpZg7x8IAd0TF+AD0uIHuSr76SnAqDm2pXkclCZkp8LgKZuXioja0v?=
 =?us-ascii?Q?pJIOFeNhvLVoATgtYnJYYsQ5kf88EX+t67KQbJRebLckoQS6c0blhWIyuAfg?=
 =?us-ascii?Q?L+7jHTIBmBeZc352x+oL2nYju+mXm7pnW5NLb8lessJmPKkQ9OCzxdInO42d?=
 =?us-ascii?Q?kEsg5A/AFAPZ9Ut8PzWMb/hKjZ0yPPdqZc5F1vqKrt+8xrxqv4r2uUGQgbYF?=
 =?us-ascii?Q?azG5h/kEpSU3HIIKLcUmQtJ6HyGRGcf6JRZkCj4neAQUdNPJx4Nnjq6QctXP?=
 =?us-ascii?Q?f3WX+lOcyDUV3+KD+57afJ3UnNGSNlyMpgvFxmELpeGyz3NaJHKA1KKHYuOy?=
 =?us-ascii?Q?7ndWFPV/Qn/bH18w4gIncY0wXfJbwYFXtFd+Uq5rnkO7jr9N/m9l7T0Q3e3t?=
 =?us-ascii?Q?A75wxn0AyS5qILkjKxmQsog/o9glmrw6MMCnrnmd7WbJXPwjasLS9A7ukouN?=
 =?us-ascii?Q?Vt0aepR7PyU5Sr0rQFTBSlpoE/SfuoyLUdOcJoBxzXeD7zT/1iikbzivNqfp?=
 =?us-ascii?Q?2d3ZasZwlXlWTUgJ9rUyr5huCpck8Za8Ko+QZ5+zlICVXGFQPI/eHkpCjUh+?=
 =?us-ascii?Q?1mPupaAeeMGtiYCTEYM/AQRKdHOrlUAdQgFj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:30:22.3868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea300e5-118c-439a-8b42-08ddbadd6669
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF6CDAEAF48

Users could only access trace buffers via hypercall XEN_SYSCTL_tbuf_op,
so we shall make CONFIG_TRACEBUFFER depend on CONFIG_SYSCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index fb5c60517a..dbd9747d1f 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -564,6 +564,7 @@ config DTB_FILE
 config TRACEBUFFER
 	bool "Enable tracing infrastructure" if EXPERT
 	default y
+	depends on SYSCTL
 	help
 	  Enable tracing infrastructure and pre-defined tracepoints within Xen.
 	  This will allow live information about Xen's execution and performance
-- 
2.34.1


