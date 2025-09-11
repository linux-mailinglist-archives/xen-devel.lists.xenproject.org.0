Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A7DB53175
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 13:54:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120053.1465148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwfrn-0001NY-QA; Thu, 11 Sep 2025 11:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120053.1465148; Thu, 11 Sep 2025 11:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwfrn-0001L9-N8; Thu, 11 Sep 2025 11:53:31 +0000
Received: by outflank-mailman (input) for mailman id 1120053;
 Thu, 11 Sep 2025 11:53:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QF+R=3W=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uwfrm-0001L2-BV
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 11:53:30 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20602.outbound.protection.outlook.com
 [2a01:111:f403:2405::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed765fbe-8f05-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 13:53:27 +0200 (CEST)
Received: from DS7PR03CA0187.namprd03.prod.outlook.com (2603:10b6:5:3b6::12)
 by SA0PR12MB4493.namprd12.prod.outlook.com (2603:10b6:806:72::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:53:23 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:5:3b6:cafe::c2) by DS7PR03CA0187.outlook.office365.com
 (2603:10b6:5:3b6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Thu,
 11 Sep 2025 11:53:23 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 11:53:22 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 04:53:21 -0700
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
X-Inumbo-ID: ed765fbe-8f05-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0W5TygsqKkcMfnJ7wgAu+c66q1oCUpujlPKqdlQ2wD0RU7PYgwwpeH3P3T2cQJGzknjY+0vIMkhIdxzrGKRdJ3vhNxer9EutVnCS2jm67Y5mL0HR5bUKRYAtxazaJDRuUHQPvqKi0KIz99CnIwubcyA2XNmAm/gUnzEbsPShIEKGbEqcmSNU8MBXtjIBJzg8wgNLKO5CyaousT7rFQ5RT5fU8lg/wVlWrYrXqQ6qn/teFylOLYf5knnN87fZQfkc1SJEPlDfK8JDVJ8Rnv8Jr7D/iS5SBMnp9+ekFDZfy1pUGVz8FATAit9OdF/3DF2733kcGJZQnn9d9g2SEp0+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GhQ34t6zDY5lsPGRwXvJvYhlFV8itdLff0nmyIBRPU=;
 b=lqxMosQl1tcV0OkL/XRZXLaEwnJEnowM/tWhS6bccH8bJbJx2cBqvIs4W25Meqh4F2vG9rwAJ4wjNcIZHZDJUfHH/lwgbfv13HisCN520MVtsm3kjjU9rQrSJgtn7tbtYHU9oQiGloSWj/OijcQevzqru2f1T16VxMbi7eGT5MrQn5Dwqcjt9lmG7eYLO6/qlqMFRbGuMW8mWllKBRc/48UFLaqkXmJazVWiAnNkXAVTmFADc6J4i32HiYZn/Yl09tMPfs8aqnfdFnB4xh2EEUCmdLKynUpeuDz6T68LhZYNjhyGWCbP90NDSIpg99MS9cNQ3iqj9KUY/JfIWVUbTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GhQ34t6zDY5lsPGRwXvJvYhlFV8itdLff0nmyIBRPU=;
 b=RuRe2kKUJc6NsL+0DVtRdTpxUtgj5TjDfQEziqnr5Of0ywXPFc58hPaCTgKyFXB9Ya39u7eZne9IpBltdiBOLpNA2UJnkLAk2LdiAFdHjD766X0mspP4ow/Pwae+X0bPQyAPAcLvOI5yX+AmSyF4mzmDrYz3NE4W/+lYF5sQmHI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 0/2] libacpi: Fix memory corruption on ACPI CPU hotplug
Date: Thu, 11 Sep 2025 13:53:01 +0200
Message-ID: <20250911115308.16580-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|SA0PR12MB4493:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b50d947-7b9e-4a30-1b34-08ddf129cf1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SrDzBziOhu5+9gQdP/v0p6tj0GJ3pJkYKAbZZIeS/9d6fZj6fyEpJdsjN4lC?=
 =?us-ascii?Q?brMJ5U2DofXXPgLcV8XAJu3IIPAKEetmez2IKW7hCIHz9aWR2KlOjg1XZUcT?=
 =?us-ascii?Q?jAOwBMWYgRWJHXHcEOtAK+t8TfARZyNgYDXemaxdLc1WSzkSljs+GBr1zXBg?=
 =?us-ascii?Q?uhWGFXb6tE3FdfH1Grh8w0LuyC7mpfbzVZdRdvfdP+J7CwA3xjAPE6VkGqTR?=
 =?us-ascii?Q?vA9wvbEth8Udny6A/uNWHLO1sjlwejMZHhW+k1q/6jjpPkzvTMdCEq3SkhJj?=
 =?us-ascii?Q?UD8UCUDPApOU2lOkYWGyzokTM5rPn3LgEKg3Fzx3f3e5P9eeZmhmF0oa6tzh?=
 =?us-ascii?Q?gkhNsY8QE5ItNhiN2V590w2PeFP+dNmhACWuqo9Dr6sZvWVWNI1HNLwqYe+v?=
 =?us-ascii?Q?xg/zp2ERvsvxOxxH8FdB8AGx2aPBCQJqvxSagcFd5cjAwBOWQ2g8uczajqOM?=
 =?us-ascii?Q?nunmTXTY86fzA2dLHzgVwAmv8ABgQlobHMA1ieM1nzB8t1RIlRUlao1cL4R+?=
 =?us-ascii?Q?hQ9vxvCqx6EGbmdrwTWYZKkBRqR0w4jWk2kUuGJNGF63Ie5fRkVpcywrauhY?=
 =?us-ascii?Q?tcyep0wytNjRrDulQoBAZ8AXUoEhl9aexTtNnGnIup0coNYvdR3DktRJLeo9?=
 =?us-ascii?Q?iT+nImYLBoM8yke0umppyjcIyBqEwblrLdKlKTL0DR9kBD2jMc3h+muCBqzy?=
 =?us-ascii?Q?l4bPK65RocWPLx9E3zMYKd7FyeCvBc+Agm72Mss/+PgwuVv4UHoFUE/TIkDO?=
 =?us-ascii?Q?92KIPifVQtOR1aPqkSB6/NXlEJahZM8mPKMaN8hurKcexLSDN2cne9WtwMTI?=
 =?us-ascii?Q?pzn08iUyEkTcyG3pC5BJWY4GFk90HRRohrhD99poKgyUJ5s1sgg/xItM59Q0?=
 =?us-ascii?Q?r9LkXhfbAMiGN4rWoXeWSqBSmJIZtdtr0mY2CxPr+TMh3BsFfk+kYPE3dOuA?=
 =?us-ascii?Q?8X+uNr7SZWDTMh4As6Fpr05yo25Hu3nDRVj4t3ucir6mBt67fjVCmAAtzz04?=
 =?us-ascii?Q?0vS/vhdeZlKf2otkiiVssgkHIlIE8I117wlgId2TGVD2+hXWLu/iN1i4Xy6Z?=
 =?us-ascii?Q?mCh0/aEocSVtLoU7+kPUAku2K81P8b39DwWLqFCC6tX6FU17fiRrHa8Ago2G?=
 =?us-ascii?Q?N4c8kC/oOubTt3MqWxuEp1Hyo/gn1SC/2Pdu3OsJlb6xFewAxxhcE2o40Nr3?=
 =?us-ascii?Q?iX/aNY/BW4S6wJEpx7c7Vv89kxp464XhR60m8dghGA8GyfnVa4VpN+hkkKbE?=
 =?us-ascii?Q?xN7+OfdZS9svj9iRK4az8IxsAf1aRWqyQwwuxqE1jdE/XiKO+tCslgyLJJxo?=
 =?us-ascii?Q?zknK7KqIKZLlDxtJC7Xc6SYnhFW0PiMl7aomxzgPrjt/f3mAeFJYyS1OWaeW?=
 =?us-ascii?Q?aFYbDNqoBVufiHfEFl63zNHvSOWUbhC7rkIud2kbWpiUqzAqI7kapb29yb6W?=
 =?us-ascii?Q?Akfs/nAZnffSSxrKvTy67VOLvQg8NNYvVQpAL5Ue/tQ4ZpRu5qgOYzXeXS7V?=
 =?us-ascii?Q?sHqhJj/qWa0Kx1X+x078vNCdjmSJ6TdIis4lrDSpx0EV7h78WkD5WNcr9w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:53:22.6300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b50d947-7b9e-4a30-1b34-08ddf129cf1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4493

Hi,

This series is a follow-up to a prior patch to remove ACPI CPU hotplug AML from
PVH guests. Between now and then the working assumption for the corruption has
been identified to be more general than PVH. This series rewords the commit
message for that patch (which became patch 2 in this series), and includes a
patch 1 that prevents AML overflowing the MADT during execution of _GPE.

More details of the bug in patch1's commit message.

pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/2034006083
original patch: https://lore.kernel.org/xen-devel/20250910144921.29048-1-alejandro.garciavallejo@amd.com/

Alejandro Vallejo (2):
  libacpi: Prevent CPU hotplug AML from corrupting memory
  libacpi: Remove CPU hotplug and GPE handling from PVH DSDTs

 tools/libacpi/mk_dsdt.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)


base-commit: aad6ebf0596f7eda6ea709f1c293ef5911ae8938
-- 
2.43.0


