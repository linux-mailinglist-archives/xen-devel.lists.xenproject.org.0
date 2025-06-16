Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F87ADA86E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016517.1393456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3Xw-0001M1-LO; Mon, 16 Jun 2025 06:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016517.1393456; Mon, 16 Jun 2025 06:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3Xw-0001Js-FD; Mon, 16 Jun 2025 06:42:20 +0000
Received: by outflank-mailman (input) for mailman id 1016517;
 Mon, 16 Jun 2025 06:42:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn5w=Y7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uR3Xu-0008AT-L0
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:42:18 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2413::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b6b328e-4a7d-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 08:42:18 +0200 (CEST)
Received: from CY5P221CA0101.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:9::36) by
 MN0PR12MB6342.namprd12.prod.outlook.com (2603:10b6:208:3c1::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Mon, 16 Jun 2025 06:42:14 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:930:9:cafe::f6) by CY5P221CA0101.outlook.office365.com
 (2603:10b6:930:9::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Mon,
 16 Jun 2025 06:42:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 06:42:13 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Jun 2025 01:42:10 -0500
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
X-Inumbo-ID: 0b6b328e-4a7d-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjoYUfl8lz0JQiz66yWKXsQWUGDR0UpeqxkvyAZ+E6kcHA8II7tWZLQ3UC+UIOgbNaiePyCSPQGd8lOpwI2626cCpyCPvG8Yxl7WO0o5T3ASycej5Zjquo8AL86PLTvZHCuDFogzxFyExlRRRKkyNrxZtgH62s/Tf5ZCUQIpD3+Njctghhy4krGzskCNYl2kmUkk0kiEl3acYQm2YHrf5VbTrobt33GThk3jqrY2ydX2Va37OxwTgMyF8kN8abavFVP6n5GZozW1hxW3rfhRTW5TJsa5GaD4YApUcfdJBtkK5z3ctLYZxbBgTvN1oL9TaFwzkJ+VgnnxptALIGCVaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WItGqxAhxBw21f3KfwdiFUW2nn+4erXPhuSpx0xV6H8=;
 b=CYbLa0axuaQcb2a3qxM6rV8bMJxK+kY247ouH/iDrkag12IbbbrZP3YmYrRju26gNjOydMJKZoE9cGIMCBrYc4L9S9WmDqDSOUbJi7RI9ENGovB9tmco8elqx6Ez2lREXMUXh+8a+DQfE11U1jNUJVZloElbbWxK/X5KEyuwPsozC0DbJLEzQkyrXTQJytR8+QsmmLMgYj6D2dMN6XeWcwfTkWU4hn1h9gW/tn6YZPlRCzqmyAxyrxk7/Aw1r/YkXpZmDYYlwlQcUUp0YIFBdbx6w+yqiUt7MEfi8Up1ozBKMkG+b9gvB6fnNnZECZPu0jkllpdUs8Hg6eUo3QoH+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WItGqxAhxBw21f3KfwdiFUW2nn+4erXPhuSpx0xV6H8=;
 b=GwlqlTm4RtJPDTvOuY1+9KYz5na1EUmw0YaJ8jK2wpaibb7pPq5PuSh5JjzBjzDf78lyavA4LRyasiTLi0hFbtAOAkrMJQaVjBsChDXL3ZTucmOlBDYpYZh6ekPaO8R8gTHyHivBxA+WfVAsdvlSAQSuTjyElTNDddcQDD3jiaY=
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
Subject: [PATCH v5 07/18] xen/sysctl: wrap around XEN_SYSCTL_perfc_op
Date: Mon, 16 Jun 2025 14:41:17 +0800
Message-ID: <20250616064128.581164-8-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616064128.581164-1-Penny.Zheng@amd.com>
References: <20250616064128.581164-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|MN0PR12MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fc1f6b3-e0e3-4d65-0ad1-08ddaca0edbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bfhAxVJu620eswKyDFk9HywK6NqQb7jskiZvsWqYZkURPTi3oYrWdTRMk9Hi?=
 =?us-ascii?Q?Hsvd3Uk17FgW60TeVoBkc5cMotn4WipYyQZl84yCBcpjcZXioQU/E8MFg8bW?=
 =?us-ascii?Q?ArkYvm2DoPpgifM7SOGzlZaEYQmXzr8zCbb30hNIYyPsJUpc3SecZwJ3qYy/?=
 =?us-ascii?Q?JNvsj3xDN0Qu5BfWOhBm/lEmbDLLIhHLtEZJNSGE6DGlU4KOdC8ie2UDNE1h?=
 =?us-ascii?Q?EfUthyHQPl9m8HTztBpWPIZQODtvUnx3IwqfGNyQd1WQyQWBSpE7NSYydn5l?=
 =?us-ascii?Q?CQUoB3nKlFt9Pe4Q3EFVkPUzfhCWMrlqd2ufpQNl8JHEUnpRfOH514Ud+9Ll?=
 =?us-ascii?Q?/AeSt0Asj/4jK80kf9ivv7dpWcIOaiXd5sZNV6QNU0kDl6sd6dP3Vbb0xq87?=
 =?us-ascii?Q?6miaYzB7CkWEyVO77fl3OMLCinJrpvaZnLsS8AyS7PjNngIiw+ad/f/QsqKS?=
 =?us-ascii?Q?3CqV+UH4akwUAXXG1L+rXk7EiTfppQfhTlkRvLyj8PyW3cu3Vgp7Z4hi3lDx?=
 =?us-ascii?Q?6rQxkE/PMft616pUu5FCJmkNUYGEZmtab3k9EgTLFE8uJjCsRBo9IIEI0x08?=
 =?us-ascii?Q?iNvI+tnZHqrcmkhLjuUW5FENj61r7cQCLku8FMUOsZs8YpLB74exE+T/oHnR?=
 =?us-ascii?Q?RC+0KuSmIV6aOYYoWRl6ExFe4mb+V4pQI+ZzbyVGxIEm8xz4XKkhwhbpwiK+?=
 =?us-ascii?Q?xUAZ+BF/XdUH7phxafZ7/u42GwXt2zvlk6y/KCpnvrZPEBg/9O9Q8FBvmvbu?=
 =?us-ascii?Q?6rNr4pUpn0TZEod0V98Aul0sKD6iXetrTXLY7WZD9j7slv7VOFiJfSKnE33P?=
 =?us-ascii?Q?qiHadFmbyrQrvTUVn6KN8C+vz0x8RlU3YCemPtpW+HeXpz8yEJTycHbzJqh+?=
 =?us-ascii?Q?7iXsKu10R+WfrlxEX5YKTPa+jkzKfNFs64IYvGpvrDr9DwROUe8QpEwXf6fN?=
 =?us-ascii?Q?rODyuHsvKlpiH1kTqt0MyW/aFPI+dYBRd46IluFgJyzQguDwusDtZmJOhyJy?=
 =?us-ascii?Q?SSR3OrfcH+Ia+lUIUI+Wy6jg6jXzVYmLj1+H1Xcr+oYj+RLftP+xwWwptqU+?=
 =?us-ascii?Q?f7Zge5ixLaIhobUDLqmoppiO8GxOrFY6PcrevHFY15Cg8wKRsNXd/P3Jnm3M?=
 =?us-ascii?Q?5/UpoCgKqQtemW09h53BFxHebaEzrFQejr4PI9SLOYibiqD2iKwMoRDTHYk1?=
 =?us-ascii?Q?VdsL7YsXf2td9IpAb97XKRwkS1KmPf5TEupiiwng4nXim/yjpJGsSEegsGA3?=
 =?us-ascii?Q?bWRkjG+CohVp6GJuMiHb9eKe/5+fWKJsT98gVvddjcKQbWnVHDF3sPbY5hcL?=
 =?us-ascii?Q?45DKuumno39nX5x5q0WXUqmMmWnQMkQifLjwScG4PmqUOi3r2kV+5iPtZdro?=
 =?us-ascii?Q?x8kXja9iwFLamDO3+VuZog2GWYmehIUaHAT7zJu3d0wfEkPKDFXdre7peY3T?=
 =?us-ascii?Q?stxGoYiiL9jjK06PvMA714uyMS5yUztt4kxw7D0BxKiSz7A6WoUAKYzJxBLU?=
 =?us-ascii?Q?5+TzDhM67ZNi/S0BNIg+ww0JUmX5Vbry/E5M?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:42:13.8768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc1f6b3-e0e3-4d65-0ad1-08ddaca0edbd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6342

perfc_control() and perfc_copy_info() are responsible for providing control
of perf counters via XEN_SYSCTL_perfc_op in DOM0, so they both shall
be wrapped.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 -> v3:
- add the blank line
---
v3 -> v4:
- remove transient "#ifdef CONFIG_SYSCTL"
---
 xen/common/perfc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/perfc.c b/xen/common/perfc.c
index 8302b7cf6d..0f3b89af2c 100644
--- a/xen/common/perfc.c
+++ b/xen/common/perfc.c
@@ -149,6 +149,7 @@ void cf_check perfc_reset(unsigned char key)
     }
 }
 
+#ifdef CONFIG_SYSCTL
 static struct xen_sysctl_perfc_desc perfc_d[NR_PERFCTRS];
 static xen_sysctl_perfc_val_t *perfc_vals;
 static unsigned int      perfc_nbr_vals;
@@ -265,6 +266,7 @@ int perfc_control(struct xen_sysctl_perfc_op *pc)
 
     return rc;
 }
+#endif /* CONFIG_SYSCTL */
 
 /*
  * Local variables:
-- 
2.34.1


