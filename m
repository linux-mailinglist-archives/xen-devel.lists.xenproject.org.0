Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHo0JAI7hWn6+QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 01:51:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFBFF8C3F
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 01:51:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222630.1530417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voA3s-0006Xt-1W; Fri, 06 Feb 2026 00:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222630.1530417; Fri, 06 Feb 2026 00:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voA3r-0006Vi-UV; Fri, 06 Feb 2026 00:51:03 +0000
Received: by outflank-mailman (input) for mailman id 1222630;
 Fri, 06 Feb 2026 00:51:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FjYH=AK=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1voA3q-0006Vc-HP
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 00:51:02 +0000
Received: from mx0a-00498f03.pphosted.com (mx0a-00498f03.pphosted.com
 [148.163.146.23]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3ddd45f-02f5-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 01:50:55 +0100 (CET)
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 615HdePr019030
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 00:50:53 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012064.outbound.protection.outlook.com [52.101.43.64])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4c4baycvd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 00:50:53 +0000 (GMT)
Received: from BY3PR04CA0027.namprd04.prod.outlook.com (2603:10b6:a03:217::32)
 by MN0PR16MB6512.namprd16.prod.outlook.com (2603:10b6:208:4cb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 00:50:51 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:a03:217:cafe::1f) by BY3PR04CA0027.outlook.office365.com
 (2603:10b6:a03:217::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Fri,
 6 Feb 2026 00:50:47 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Fri, 6 Feb 2026 00:50:49 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6160NpMh029525
 for <xen-devel@lists.xenproject.org>; Thu, 5 Feb 2026 19:50:49 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4c21punmb2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 19:50:48 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id oA3av8h3jlOqboA3bvXPbA; Fri, 06 Feb 2026 00:50:48 +0000
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
X-Inumbo-ID: e3ddd45f-02f5-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=QMHsOrykkuwlAOZonJMI1HAHX7J
	mO2zBU41Pd2GXuGQ=; b=CA5vOaXvqvSTPPSLRX/oW6blUBEiid1wDI+ICrO0orW
	jAYwwsj+dCeMmWQZTzkSy1eCUSj7IPBaY/O78wqAsbHKuGx8UmFluqvqs6U7dbGW
	UUyIDD3JHM2TxWWlvQ4E7ifsxJq579wIzcXzufRS/ddUmxt0yfFztIh9mEizAFDD
	0DU3Kz5NwLcoYCWLDbr1+yq9EZJ+RKlxFsFmrNV55l2Xzm5HD5JeUSSFdsu53KKA
	/OWglk9Y1xpnRXYUnUNFlKqg7uo3kwC43wWIkOm3V7LtxgmR/uCbCrhOh6xn6LA2
	7LlYD3RlLvocCqfpZiJnzUtk9JrOzcQ35QcyO5HRI4Q==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjH/dD+bIEzftEuvPSvWPqoNV9eeFTnZ2X0Q7hP+gkblQslnx3apxcxKoShmQ6FyY16czMoQaccvZV3EwUV9clOx1/Z5vp5XBQs4maKXXar8h7Oc5opxHbfOXda8nkhu3KaKYbWWhKfu2YjuXwX5arjBCDesCFk4KIW7yLhvWc8GveCC+WhpKCjr00LRqiWnpwxZoWILlwQ9YmASLIVZhb2fvUGrAxoRUgjVXuVtuQSpTaCc3HoiDaMiZrnr7pBgo5msTb5XYy7aSj9bDnNsxqNIioYnnDZ5bfkblWyTbCLtc1HUSZnm/6ia0ubkETQBm9StY3pRYBnt3Jyot9aW5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMHsOrykkuwlAOZonJMI1HAHX7JmO2zBU41Pd2GXuGQ=;
 b=uS5Iq4wSJl6g4oWsz+HOXjwlLayrCMwVINWbaKXIhvRU0Z0uBEcKznqRRzA1yzcdsVUiGiXNHlEjv6Qir6E6UEc71X6yX0Lcfhss6t2KkZCm3+XMMz2lL8mfQJWKTQS/zl7LBSm9+vT4lefEYOGs9lGJ56ZIHNsosh0MYnGBZ0ibRyDmaQ20QwCgBR/Y8yYg8tOovCSV2KxtWgUHAFKCUCyWNJBWdvcpZkIkJ5w2lluZdS1VzBBU10NFPMpY4lAKQpgUirE80fQdpZvBrwpQd/3C3uEL8mPGtuaTqImx5VKRT748/bSeaGSwkU8mGcaRgl+Hf3mNF7uLGKb2ZayWHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMHsOrykkuwlAOZonJMI1HAHX7JmO2zBU41Pd2GXuGQ=;
 b=QnY03du1xh7FyHlvCC+GgiqEfAFlwqqWZ5lLiIpRQXHjiYs2TVfuCKK8Eq43KJotDEV9alMmqUV0MOF4wECwjt8xuwVIax9lTOM8KcSGZ95GZ7pWMu3DkF0yLn74N4AUx9ZD1BWE5aoPkgpeEHt89U5BcN7QVDeogOoBjotbeMQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=QMHsOrykkuwlAOZonJMI1HAHX7JmO2zBU41Pd2GXuGQ=; b=HiteVAb8B1oK
	W2eQTuZpuXdy3R79NLMp4BpE7H/rdnPDdjDihOmTwGew9dnOn82RwIIEAuGePi4c
	pnDrw7RACGU/FJm2hKGZCGa7TEKmzQ163q5HHezc/IkDrcuc3YJQJxRXvEOPGxBG
	Go60j5dYbbR0x0/oeSNjy/NUwJCCVWumVZeOeHRoTi7PRorpFkflaLBVYHttrR5L
	vubV2lp2tpj3xz483UlYQTFR1okFJJ+qqgthQxAIixx0G9EanyR3GbK40oP+H8J0
	8yvjTRNHMrfICwtzQtuWzaAyy0z3ogpyH53OKHObTPnSV9bPnpgyZ/sEJ2Vh9IeV
	TNT8Fz8gwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=QMHsOrykkuwlAOZonJMI
	1HAHX7JmO2zBU41Pd2GXuGQ=; b=DproVJM8RtBC3ngxa4DVGqGEc8+Ibwvq1Ptq
	ivXEs/9LiuCrHgiDSqh02xyD62SR6EhA5D934hxOvS37ix1YfsFdrw/4x7sJjuTL
	k7G6PXac/s5BtQt6Po8nqBKFn00KUq5MBuHjUKtGF9BxwBTvn+6xonI2z3t997uk
	4DApk0NKJO0CdM0bohBIyNneZaU3Bl5V/8jGvNZ9rYvBTA8jvBFyHzDMRM3i32cm
	H2faHSfwavsiK1QQc1s0EoGnk+oG8gw3RcsDw7zSPot6wBA6PQEkiC8tqlpUBcks
	UYIZeZxjuKe8QvtTsu6MJ7AOtMup2Oo96QDHAw5j7EV7eS9ouQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: oA3av8h3jlOqboA3bvXPbA
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 5 Feb 2026 16:50:46 -0800
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: xen-devel@lists.xenproject.org, grygorii_strashko@epam.com,
        anthony.perard@vates.tech, michal.orzel@amd.com, julien@xen.org,
        roger.pau@citrix.com, jason.andryuk@amd.com, victorm.lira@amd.com,
        andrew.cooper3@citrix.com, jbeulich@suse.com, sstabellini@kernel.org
Subject: Re: [PATCH v10 2/5] xen: change VIRQ_CONSOLE to VIRQ_DOMAIN to allow
 non-hwdom binding
Message-ID: <aYU65nqaZSGzUQD9@kraken>
References: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
 <20260204233712.3396752-2-stefano.stabellini@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204233712.3396752-2-stefano.stabellini@amd.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|MN0PR16MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: c0aa447f-3b6a-4399-7351-08de6519c5aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gQ0hdycGJkfFg+SDHLbqOCPPrzJiZ9tMtft9bsf/vPz0qXhweVhF9GP+pwju?=
 =?us-ascii?Q?zIrUGtYw9RMXFcJe1FXPkOou70Ip/nhSUIphI7h4NVWSmflS+qBLj1BUOsoc?=
 =?us-ascii?Q?+yexMZk7q+MrlKgt7CLeJBCsi9HoMef0pXHABO9O5/R4TnMx3Tr7x8Nd/zFX?=
 =?us-ascii?Q?otbbNS+KDytGs05fEvs/zMQyFnzjhPpa/R5IbNw9KG4tTnG7LgFP9GpXTd87?=
 =?us-ascii?Q?wMS+qC7gLXD5emwi8GGXZBUK9b1TdaCOq+p+A62nKzWcV1Mz1pOoMOMc+p5d?=
 =?us-ascii?Q?KcZuCojMtGxPFyAvlFuBFUvR3rikzJNeP+nCWl7sYvhIS9kXiZNWvEKbLmvh?=
 =?us-ascii?Q?JqjbMO0hiTZA4X/gZwPze5bOQUdp/gZ6o2+WbLMCCUoigI7NRy0EuJsOEY1b?=
 =?us-ascii?Q?d1m1wQ1xgb6+4MhW9pKB7l74M9wJyZFFjz7eplsQK8Y33wn+RCG8srM+154B?=
 =?us-ascii?Q?FLa/XnlKKGqMPqE8S2zD/vAbrAs4TVjpRXkjnx4C2Tl88NFeeJyXu6fqlA70?=
 =?us-ascii?Q?JmVAH/bNg8GP1HsMkDmXNdW0cjsyrqn6MZIQhzqdcpiBhsEfwKZ+NGPKFFxD?=
 =?us-ascii?Q?kXueeXhedVO9Gw9rqKgF0KrLyacZ/W+Xjd3OxqSZpqLJYTkf09IFhnMl2k13?=
 =?us-ascii?Q?BLr9kWt+4vA245d9Gx5cB/BfeRDtcHda0E6aZp1/fGQWJU+hDyv16I3SJA39?=
 =?us-ascii?Q?PjQgps3bhG8BFa1nqRHX1Ajtv+FUkGLUq346o4DggBiVsCS1TWq+D1qv4Zs3?=
 =?us-ascii?Q?ak8Sb2uwHzHZpitwvkQ5DCRCk40rg4tpFgG/DN5Jd38egK0OSy8w3M4YCBeK?=
 =?us-ascii?Q?JZeQbsPzIsTK50aSqgOPtBgWhnHA1CC0om1Q6RMtyqy6fLZlTidw8FkCCpe0?=
 =?us-ascii?Q?pOd5SUv5DeTG0mZWB/Ny6b7Uk4+K1wWfTmyAywJGjKw0WAo73F6lIXRUSeS2?=
 =?us-ascii?Q?EnqLUdIUQWnmHb7OqAEtbU5b1dYKoDXYkLM4eQpxvVV1UnNXYODMvhmJt2L9?=
 =?us-ascii?Q?q8bEFkBACu6YMxbrNNkLLodaf9BlpqPTIbotgwb6SqfD7fbbZM3QPL1yBDD2?=
 =?us-ascii?Q?RCKwUQhL3Ili50eYqVU7dYQhLejbtJ3VugerTH4u6yzm8Ud8j1sEvTOSw5d9?=
 =?us-ascii?Q?KkRuVo0RVc9hGt2Y5rUVH2aoNb+k0Uh+IGNb2FKbrmyNI4aB/gOrEpdfAflH?=
 =?us-ascii?Q?hvS0ijWXSSKu6BFOpCD3myltBHU7RKXzsJP+/2e5nfvS2OhFqoZet7uRD7ph?=
 =?us-ascii?Q?YibmBHMDKaHvNyG6FJ1uRyZUxyB0Ud7BIcWNMToaB+yRuK6s7Aejx0ONR0y8?=
 =?us-ascii?Q?JLXp3J2SR2nwosNeUKW2MWgTbxvxMKcb4OL0sskk3sTBLkRrqc5HVqpaA2u2?=
 =?us-ascii?Q?TGvcYWuye517M10XBlxGq1dAXnwZYaFkvyPaNyBuR9UGlTi261GmBvRx3iJH?=
 =?us-ascii?Q?K+Ifej1M2YOqSbI7+BJ2ixgtrMuaSMqsSbuyfuTdl9PTk/f1OLmT9KdSlVMj?=
 =?us-ascii?Q?DdltulKF95Ke1zbWRwSwEMJWKvrnqOOlkwXJnGdYjmK75cSJ9PJ4dZaHucpa?=
 =?us-ascii?Q?CrjTwHTvJm6WkCq1DXBqac1zgDMPuOoffG6hIEdzvX9qnQd4sgu2q8Q6IjhD?=
 =?us-ascii?Q?r1dFrr83GY6OaMl/pOLdypcjhAjnOg+CLbpykGFLKmTpnOmEjjjL0WXHaOVd?=
 =?us-ascii?Q?OHBMdw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CF++TE3CTW5kUtmc57teGX6eQQJPtVDzZjs+PWdwdlaGXWrt1l0qTdi8WFpMP5zsoZ20AInNUzQPoOdKVpYbKtbgGAVQSIBT8hY5CHYDSIG/4Z7GOmlp1uajckUqdWCU1ZGebnxl8UTcPyhLpa93mQyhkKiRsooEWfNmzZyqrFTfwBlrUYxfnmCdVXJzK1R5VegbNMoOA6nnnteAE3Z21q6dwSYEUndG6X1gzRijMGh5w7w0+T76PVvSCg38bRKc0NTfQB2VrfeZRi1LebUx7GR+Tx4nj1wGrVNcgMOxbmSg64dKnWj96fU1ePv+H93LHhmsMk+8cxPcOht5FdJ3XKf87xf/2vuxIZhAs+UKwqvR0Jc/e4G9AtDlvv5DDYIwLH0b/WaleXr4o7gfAQuqTVGd7byIXIsn5xbhl9ZCYb6uZyLMPc9Wd1Z2Lz4OKRUl
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	il3SAriOtSkKKZZiXgsoGWcg0hYixpabXk/mybky2w13vxEIwZTx/7a+qRyP7BxFtLQMRdyUkLRCnoRjRobecZFFxcnnqVl2g9le7iyir2Lu/p9o4Z0NOHYpJ0RtaI+SPn9dvARXGg3Oeder0CnkwqufM/PG45iP95DAbIyahWiOz87/W4z/NW4472zq1DOfAbKFPyQw0aV/WIzC1RSOMFkNWaxqX0FguTCSLb+whT80grEW7T01YcOhvJd7i+RW5j11kYIGB+WwTHq0EhU8oTQVh/8DoOLMecOEhemGAS8I1p+2ej7ty+YiHMGsDcV84UlrLMxewUuHH4mFjpex6LoTKxkcZ0b/OOMzXv2T9eq4Thm1DClYSfqUDPlI0K/QzrKjURIouyzJyBDLc/HTneUYIx3NLLyMGUfYQQmSWsjJ2h0B6+wCg/46sIlTlKmrGmAi+UzweU3rVoz8JFp/rrJLTVCvNF+SgY9xoxM13VPYhU8lElrkWR5NgVhP8CAHWr4hG0ygIGdFxD+DUg4n3GwxuFCiggZ1ISr8uCSZSCxME6+huPyQieeuvjwmJMs3GnU8Co3wP80Ohss2ybUygzkP3ooH/dRabT99IsK2uqceU1kRf63S9LkTwJ/sWHPF2cEyCx7SE0C6tEaeamNjcA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 00:50:49.6273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0aa447f-3b6a-4399-7351-08de6519c5aa
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR16MB6512
X-Proofpoint-GUID: TNTl5u5RBpdeRQTZk8IK3xCLtlSJkkcK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAwNSBTYWx0ZWRfX0hKy9ZG4smNM bHyfvWVSjQ/j/ClnQqpac1q3DZNPHvaW6XsDbKGavapsq6fvkZ6UZdMdskZ6PfwMyJJWI4Vigo6 uMgaCxMRJnLf5Tt4PsCCD+UAG0v87zpwBU7aQ3qbApv0hgl1nwKh54x6vi06FOyajd8tbo8NLPu
 8IyAO4lRR/tc+YGEWNWBsMXfhZdE/FguWp0eaiQhHUKGtQt48kq6N3aFr9bJveXXjsP/HWKWA4D 8N0Ij4rFI4ZKKvSiqN8sb5asPNaNqNY81/xdguF+xC0wNGicsVcmcb/3jtgn43bViWRsP7vJMuc sQ7lXWY7zgpggwxkDjNGZ/eFd0wWx+ciE4dALfOCg6vOum7C+bEkKfMIcK2ldjgZxTyiIb/YnPu
 WjxOWbvQ5DAEhZgO/sJe/ztD6gmSaNLa7dE4S//Ffw75PTw5ddbjk1ffw2VCOx/jSLtZk0/eavQ zvRN63EK2yFqxgoJnQA==
X-Proofpoint-ORIG-GUID: TNTl5u5RBpdeRQTZk8IK3xCLtlSJkkcK
X-Authority-Analysis: v=2.4 cv=Y5P1cxeN c=1 sm=1 tr=0 ts=69853aed cx=c_pps a=vzG6OqJaKuDO37FI3iuMvQ==:117 a=lOEMawUel/sSvQipkIvNbg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10
 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=zd2uoN0lAAAA:8 a=cbNQJ9GKAAAA:8 a=dEE_NiS0NobiUu1PXT0A:9 a=CjuIK1q_8ugA:10 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2601150000 definitions=main-2602060005
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,ford.com:email,ford.com:dkim,azureford.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: BAFBFF8C3F
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 03:37:09PM -0800, Stefano Stabellini wrote:
> Today only hwdom can bind VIRQ_CONSOLE. This patch changes the virq from
> global to VIRQ_DOMAIN to allow other domains to bind to it.
> 
> Note that Linux silently falls back to polling when binding fails, which
> masks the issue.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

