Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D949DAD90F1
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:16:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014455.1392569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ692-00013I-Nn; Fri, 13 Jun 2025 15:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014455.1392569; Fri, 13 Jun 2025 15:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ692-00011N-K2; Fri, 13 Jun 2025 15:16:40 +0000
Received: by outflank-mailman (input) for mailman id 1014455;
 Fri, 13 Jun 2025 15:16:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwl9=Y4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uQ691-0000Kb-9L
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:16:39 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2417::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 667170b0-4869-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 17:16:38 +0200 (CEST)
Received: from DM6PR08CA0002.namprd08.prod.outlook.com (2603:10b6:5:80::15) by
 CYYPR12MB8889.namprd12.prod.outlook.com (2603:10b6:930:cb::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.39; Fri, 13 Jun 2025 15:16:35 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:80:cafe::be) by DM6PR08CA0002.outlook.office365.com
 (2603:10b6:5:80::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.23 via Frontend Transport; Fri,
 13 Jun 2025 15:16:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 15:16:35 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 10:16:33 -0500
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
X-Inumbo-ID: 667170b0-4869-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAmIoKvttO5f+kfpHTQxmQKfBQDFx6k0p393NHD5uEa5cpTgivp9HJzNmwUrME8CJrYyc3d8SVSEPkK633Ilc2os/pF8YuA3sjJtjGRTqAGsxJ/ZqpyLh2Q3pCxNEwJzxsCrMf3Y9598+t+SFUBQtKy9mF4ZcR/2P4SHdgD2qelrKUgKPjPCb8WiY6T5RTzIYeBehlnxfQO2URJqv6pQmTsZVD5VQ/2VsdSEhB40jQ8cNSfmXXA4Yp0h/ffhdXYSIayBCYpVyMVgJTHSX0f6AVEu6iLF2jUNV4EYNR3Cp56LGHoBMQxY+KGis7qEd+M+dllOtPhvxfn5PU2chPbq4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bto0Sue9jzjcaEeJFmEWkgGlcmxgs86j5hGDpqnCvg8=;
 b=PlES03UWbQco7cdqDrNG+ROeqhAZ0lBYiH6kB6t+CFDMzWidrwSIezKdSSkS3uGzm6C13WT/98htxpC5Y9Ux1p5fHL1eibXoNmY/Y30zeiyYNmpqYQpC+rY/4EUP6/HH4j4vsnr9wCO/ldMIAW3zfUCJ0SFRCf/WOby5WzfLTBcHPguvlyHk18BBUyiXv01KKzGpnT3iK0676tCdsb+t74bw5LCpHWhj6mqIWxziWjnYCiwyjIqIY2TNVA9Ykd+f09dBMfbDUGzRPwQPjyu2grfH4iQSkpVmqOD3hcnAfFi4AI5j4UM+qqp57CklTDwnj2G37ojGLqqwLwk/x1y05Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bto0Sue9jzjcaEeJFmEWkgGlcmxgs86j5hGDpqnCvg8=;
 b=SmEd7ei/JT0vEDsjbsYeQmEL97f4HkGNxz5qUtQuS4UfsQAZPimqyz0bnavyVVUSwYl47gnhaPOLP787LoY0HFbQVkkGzqo7BlfH5qqVQ5qtGV/f1kiUndhPtC9oyYwvaBPs/xt03hG7r81KH24Ul6reCpKVOEdNOH0N/nuYtPw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v3 03/14] CODING_STYLE: Custom type names must be snake-cased by word.
Date: Fri, 13 Jun 2025 17:13:12 +0200
Message-ID: <20250613151612.754222-4-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613151612.754222-1-agarciav@amd.com>
References: <20250613151612.754222-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|CYYPR12MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: d1ffcf5c-f8ab-4fbd-e882-08ddaa8d4964
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iPVAqwMpnYZ36qKY9Yjv5vUn8JnJrk+HnKexAxEIqvsFqHLQJY8VuENS2LYk?=
 =?us-ascii?Q?/CH6l9kJWpJOmVZoI1UdRDgLeaCU0gBstRG5P0RfY33PihJheeEMRGlGLf4J?=
 =?us-ascii?Q?tD8SBWf3hj2KCeBEzn6IOlIASPUkm8Osv7JwXXiHOuuxVQZ+eBcFRzc+6zm1?=
 =?us-ascii?Q?lthl2ZYubSFpnN3W0WVX4KZ3DiI79SwBHHTrbNcMmzN9FSE5KyvSyn08osAd?=
 =?us-ascii?Q?j/nZEXYOdq8aMVdAuPV6TAKrbySpeoJsnPKyUqZKcfizuTB8BezcrrLzHnoz?=
 =?us-ascii?Q?GxG1ouzTf/nwSeKxObxg5y3/bjtrnZXwKr7CCo66mK9Fg9Ea8y7N6Qxmy50O?=
 =?us-ascii?Q?udqgt61VdoGhIm3Cy4g3J+nGKpl2FEaeGNzytuXfrfg19ZeSVbbaSHei2+DH?=
 =?us-ascii?Q?em3rGYKB4/IpL+yjC4K5FNYRo9/HodDqnE33OXQR3EiM5Bh8r1skQLm6tpv4?=
 =?us-ascii?Q?EpgHPRh8CNEFecWjrWp4jlyMEUghZSSBh3OvyieB7i+Z4mrQJ794zO1FMz8F?=
 =?us-ascii?Q?b4SK7A08RUnWBbYrCk1nqbk6IfVk6fx0oGPV5VckleEIQswQUXe9w69FetE+?=
 =?us-ascii?Q?N4AVdFO1nN4wvrGHEldG0NZ50+Bovvz9Cq37sLM/q0d4L0N1ms1ubtO3bucZ?=
 =?us-ascii?Q?C48EoEfXylyX7hoL5uTdeSn3QUpakHEgDNfuelyOcxjxFi3F9Pfc7LwHo6uu?=
 =?us-ascii?Q?5NyjS7TMdSOKP02rP7h2P0h7imiZOmdYt38g+LiXTTjU3fnzztzrYJbLS5BC?=
 =?us-ascii?Q?R4RAEuOq3ZTNBgE2jzp8Wv9CLyWGW5glLEyqgkuHFq8Od2DnvflhU51jhkvY?=
 =?us-ascii?Q?DsVHwQN/vULeOliCoAxTR0Pq5o/FVbOrZt5yeYcj5INz5rLvPP37Sn+OeOJX?=
 =?us-ascii?Q?8M/cKBcKNEYWntU1KUdbGQsH3ZBlwPz/VIHb+kqD59tzegf0x10dErRmZqhw?=
 =?us-ascii?Q?+TFZMXMapKOK+ZvqJrUX4AMWGm6LXHbFdmG1P8xgDMOMdZZ3y6kJGeQdrDUr?=
 =?us-ascii?Q?g8SjH1mdG2pGuiOnB33gZBEEt948EREdRSIkryCl/edKgAz8Ze48pU9V+elD?=
 =?us-ascii?Q?srNKL5w75yaEeldgMGm7qBejHB4du7BT5p4d20ypNJ04kHO2SmbGMrNj7OKE?=
 =?us-ascii?Q?AfYJcNZEAGeSmlPzIT5yunkUsCZmfNCzyPztnrbnWSLnm05qQqyJBXYF9bKd?=
 =?us-ascii?Q?gDYNAW4zVKA+ypp2p1GcBRhSc+HXrGxYgsJpP11+6Zj/eegIktiWcuvVM6jL?=
 =?us-ascii?Q?6ITen8bqE7uTgXHabz5SPoq4qWd+UxNsZQywU/9Hplk1z4fKkxXXuuHpbQQ0?=
 =?us-ascii?Q?H9/vbqalotF5+U8Y9owa07n95Jph32fDhtZ84tsTzM9jS8X//2UInLoSaYXR?=
 =?us-ascii?Q?1F/fCb0kv6OK99B5w5xK14hwisHzr2DdpFMiaAWw3hGGgxTTZPi3BLESTKtQ?=
 =?us-ascii?Q?aTrb0FFC6ubSooF7H7lg0OnH92zqxhvHUSWSzzFbtDFNKFa/jcuRbzlwjIPk?=
 =?us-ascii?Q?WzC2Y8yg57mmPxbTwTgoam5LOfyQCQqkGxII?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 15:16:35.4131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ffcf5c-f8ab-4fbd-e882-08ddaa8d4964
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8889

There's the unwritten convention in x86 of splitting type names using
underscores. Add such convention to the CODINNG_STYLE to make it
common and less unwritten.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 CODING_STYLE | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CODING_STYLE b/CODING_STYLE
index 5644f1697f..e91ef7b3ca 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -126,6 +126,9 @@ register).
 Especially with pointer types, whenever the pointed to object is not
 (supposed to be) modified, qualify the pointed to type with "const".
 
+When defining types, split its words using underscores (e.g: prefer my_foo to
+myfoo).
+
 Comments
 --------
 
-- 
2.43.0


