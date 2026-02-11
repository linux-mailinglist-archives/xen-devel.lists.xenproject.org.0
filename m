Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGUAEw3djGm3uAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 20:48:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21710127431
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 20:48:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228280.1534550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqGBw-0008OJ-JF; Wed, 11 Feb 2026 19:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228280.1534550; Wed, 11 Feb 2026 19:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqGBw-0008LC-FS; Wed, 11 Feb 2026 19:48:04 +0000
Received: by outflank-mailman (input) for mailman id 1228280;
 Wed, 11 Feb 2026 19:48:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vAzU=AP=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1vqGBv-00087L-7X
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 19:48:03 +0000
Received: from mx0b-00498f03.pphosted.com (mx0b-00498f03.pphosted.com
 [148.163.143.241]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92ac59ba-0782-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 20:48:02 +0100 (CET)
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61BGWC6t2717325
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 19:48:01 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com
 (mail-southcentralusazon11011056.outbound.protection.outlook.com
 [40.93.194.56])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4c8wchstcu-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 19:48:00 +0000 (GMT)
Received: from BN9PR03CA0291.namprd03.prod.outlook.com (2603:10b6:408:f5::26)
 by DM4PR16MB5457.namprd16.prod.outlook.com (2603:10b6:8:18c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 19:47:52 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:f5:cafe::2d) by BN9PR03CA0291.outlook.office365.com
 (2603:10b6:408:f5::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Wed,
 11 Feb 2026 19:47:42 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Wed, 11 Feb 2026 19:47:51 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61BGnfOX2547620
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 14:47:50 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4c6nag3xf7-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 14:47:50 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id qGBfv8HSlkQ6qqGBgvrczh; Wed, 11 Feb 2026 19:47:50 +0000
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
X-Inumbo-ID: 92ac59ba-0782-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=1Fc7YYKQH/W+qCuZFYaTeuymKye
	TP2jh3pYNCJSfMnE=; b=r21WcoEF/cSVRIzzYtzxxd4ERaDrlGajGfi8/kben2u
	q5PP3QramA7MmpAovGBfnYYk71O9LdF5gRo0BTC4zKwC9FW5u+3NYBCwRIVBNczq
	BrHaijhoZcoDNG/QKJ7f4OYa/+M9hUIH4/7bjGaNrs0IOde3diKTiuRQp2tEbXsV
	iOg0Jf1w9Tyhr0REBcFMLxAhpli9FCtaMtv3jwgJNtJtAn4ZSUEnc9Hg47neqb0o
	K/X8aclTXdyZMnQvf6BDzaNciKyzfm88ysEj/GS7Oah14VVTmc2WwY87/jO00NPH
	zp9ApE4BZJfJH8+h8X7yzT0QHBMFsg6YIWcEmvArdTA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKSJ1avyjJlcyithas5JxiodILgZvZmsTmxCDz5sA5yqPRtvMaxESn5dXJqV4XpwJxHFvGWbt0eTvZ+GCzRGFfAhGFv8oclZEUpDWoONESlNVBpyaW+X05K6V5NFYjONcMfio4WInFeKgDscHq9EY5tP7BDnN0VKfMD5hSXHjX1DmYGUN2tgj3vzgrC1Nig1ipov26Mgz0iW9B4ho1b51xJQJnCeM5qoz9PB5jcsLYbDC7tp6Dv+FBz8/N7tgR4Zu3PQBFTIGcz6WVyiYhZuB/7EcWlL8oTb1Fi/fQaJ757LJqpfBjU0kEIJmORajCbi2U++0sHCVY9LVm2+KAKriw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Fc7YYKQH/W+qCuZFYaTeuymKyeTP2jh3pYNCJSfMnE=;
 b=q6OjOMOXf5mx4wfeMXTSijCJtDZmqWZTZ4J55hOcTmLWbvuFT5qo5KxG6M3daDMb1r0sI2UwAKvY+sUCopuM9G9WmZOyZFtEDJn3TY6xOMFSbsk/SVJNF8BOhgOPbqIf/8mSFJrKykO8yIJFl8Y6XtrNjBP0Lel8iLt6GguzABjQeCgEJeJQgoBN1QgAPl8oA179H6z5iI78OMJcyA/k0uTzLWKw48DePPVgJ3DZfioBokyEm2Q7YcStA033QL9m+NmnQcgJqswRoKS8GLMTGzgl00B44ZlKBlZJ+sdYjJOpjv9N8ZXC+XKLVQVRKhKamvWLFu2eS/30oh4M2yi38A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Fc7YYKQH/W+qCuZFYaTeuymKyeTP2jh3pYNCJSfMnE=;
 b=KaAm7Q4R93lHjAEBpCp1KJFcJx86oBaTSgt/yPq4v1XKGwoKfTHEthcunKH/6kvC1k6npZyen8H3cy+F9bmKNpGvEbnahtRCDN0T+T891rk6xdNvmS2evFWGHMyIe/05Qs2moQYrFttaHnyiWFd3ERIV1bZ8lI3fFV47zybyBso=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=1Fc7YYKQH/W+qCuZFYaTeuymKyeTP2jh3pYNCJSfMnE=; b=MhJz5ZmSBu8a
	jpVcgaoQJGLCJUH2tdqkJR/oTRcY1oob1xrv8/XQ1U4G0xfL57ITZDoYNYTyIizH
	8nB30+SQ55rREV0djUxGz5+gwPmGoMXuhRb7gH00BfHq4yAxor9kD/gooaVQHwxI
	BG/p7hO2qfimy2+BvnyzQBSmiVrb1IDztUKVTCtZuJfcH0klH7UmDXJlBgorLcCL
	AZBBYWmRejkfd+YlWM2SJ45bGF/f090PNBLgall6jnTKtUanqTuMYTj0ZK8LJNT7
	YUHJaAsyvxcvblHMtUDRo1pxANjTE41gVHN+z0Rtk6oLdnS1He0J7vN3wJ0DWefZ
	dmF5FF2Y6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=1Fc7YYKQH/W+qCuZFYaT
	euymKyeTP2jh3pYNCJSfMnE=; b=gij3Y1Lrovz/29U7Rt8rOg8UJLj5RIXvIxfQ
	x0ml22R633uGugzvM204RH1D8J4DhEQ3sKZ/5iL91JlE5ZWBp7CCCyWKK3oCEgIG
	i9+AkotriKSB2LAq1cLsO+e4jEd1ad9mO9LMV3GCOISrAIuISdMMNeOnvCquqnoL
	SkEWImjvnmjzgIrlMocJTORnBHQFStKmwLNVLhJN57quV4joRnvFL2la4i+VBPUt
	Yzsw9jvsD1ipfhDNcdCTk1ru7nvpSPhsVqb7jAp+sOhrBdHZuNeryMD9gYLB38Bk
	6hJe+l3lAKt0ZOEbJ+s2lEyCPHuuDR3AY+Lz4UUqZk4x4AlQkg==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: qGBfv8HSlkQ6qqGBgvrczh
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Wed, 11 Feb 2026 11:47:47 -0800
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
        michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
        dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 3/6] xen/console: promote conring{,_size} to
 __ro_after_init
Message-ID: <aYzc44P8hRaIc+29@kraken>
References: <20260205013606.3384798-1-dmukhin@ford.com>
 <20260205013606.3384798-4-dmukhin@ford.com>
 <3b452d1a-97c9-41d8-9687-36b702309f47@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b452d1a-97c9-41d8-9687-36b702309f47@suse.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110153
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|DM4PR16MB5457:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a48b3e-9447-451c-bcc0-08de69a670db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ewY5BouPxxxUU1lpt9bHo7xp3wPCMfxx7r2Zfw7WKgtP5BlXmmsqcYPD2gMQ?=
 =?us-ascii?Q?fGb/bWjHCU7A+XrexlZwdAWg0WAWwkHpf869pmFxEM55h6psir1ZCd+7HJnj?=
 =?us-ascii?Q?IJAd4DCaGrt153pnjH9yTxjgLCp6bD2Xohiq5cjxAb3bbtk9G8IupKuXEIsB?=
 =?us-ascii?Q?IHu+uZwa4VXjWAJHw7yCMRm3I6q/xJKOcoFsdj3NkWVjjR+926+DPoKXvdF9?=
 =?us-ascii?Q?Q4QHpVkR7O11W6ZkrQ0WSdyKM17vylc4aGQSs22aDya95mRpD3bEi/PCVsLf?=
 =?us-ascii?Q?od4h9o5OKlMpME2BecO80NQ+YXauTaqSDa7OGllj8xBiBTyhoVYJTvbbNIwf?=
 =?us-ascii?Q?yMV9a2eHnmwvfWtr2/rU4yxqGN6hmqCxZmzYYnbN6O6ywVK8U/QtvfhqMHQJ?=
 =?us-ascii?Q?IYebjhkt3OttGCDBLbbSFjt9FzyAmMhvICCLmRNVQTdlV++SA1SrN9ObkZCY?=
 =?us-ascii?Q?go4IyfLO0zrNWVK8QQgws4DMW+a7mRCO9teDHPWyC0zc28Y8Y6hzcrNK4ZVT?=
 =?us-ascii?Q?Oz1BdEcnOpAqBnNGu7ga8j1CY/eJgyXmzQw+XeaGkUBqCis+FW/jMI3i/gRo?=
 =?us-ascii?Q?lyFtDugqf05O97ZMkz44MgkrTIOfXM+iIdxMCKZxloJFAqeTfh7aPivKsUqL?=
 =?us-ascii?Q?MDYZSfpo12NZMviGvlo7+lf6ROL4zVNjl0SfnBjNIDYf7xSCpD7FDgUY9DXW?=
 =?us-ascii?Q?EmlLCPHdrvRdKO2/7MzpXwh3se2DHpkADbfcrRLqLxn3/WBG7DC532qEyyM/?=
 =?us-ascii?Q?nhsOFpX0Q/eKJaV1nAyJNa/iajMtkefZqOd1JnzPIS5J3M0T/v61+Igq3ywE?=
 =?us-ascii?Q?PrVsNv6wY1ZS1uPil1suRcqhN0JExf1cW3wf/JCO4uT7q9ZR/8oFq4k5kHOw?=
 =?us-ascii?Q?NsFSjmM1Wy21GTsNv56mUebPt2ndtwObdUIa0EzxsaBhJvgBHLmPKKvuhZ3O?=
 =?us-ascii?Q?zKd8pEGlFU+gh+ofcKPRsyye42XrXK3KJ7Sh3dNhv/FbDAuMBMlxOtsUS6cV?=
 =?us-ascii?Q?pbT1ZqmtbN4GluJH6Nq+tatln81JgmVw2qHtS7z1Ymy8bckDNNyjdjJG5v0q?=
 =?us-ascii?Q?0HdmHK7nnNhtayOohEdLo/WF7pXc6T37V96XM+2fjNJZ1HitrCpsnCd34OKB?=
 =?us-ascii?Q?6LG1qm9dvp0ND14T9Bukrltuy9n99/nRdQ8hISVX8sQTzgc6QdTebGHpm0VM?=
 =?us-ascii?Q?UDdeKu5fwR0Ev7l6k0bAcBW6oj35JObPy1QW7Jufoz+/rCvL0F2bVI2q23jm?=
 =?us-ascii?Q?THLPYCZYZ8jO9t5JK+o+E1VLyd3DCGCoMvS0ItGbPtl4g6+8mu7ksLYHktmm?=
 =?us-ascii?Q?H1QTHyPRMKuyqOU7gqo+soSfql3z2WpDgGpT0Zr5rwU8RfJRAOoN3kkPVEta?=
 =?us-ascii?Q?WBOE/+0ypbcbBmciIon1GdQ529m6EibQLrHtE2Xf9LihR6AmQv/m+OvYjBlf?=
 =?us-ascii?Q?FiD3SAaiKQ9gv/UIb2Zh+PfrhzwZNntLu/RRz0xfLtsH9xv/Z84prThqXFL/?=
 =?us-ascii?Q?F4ZBotrdsyk70atgSHknMEWOMMosd8GLXE9JN6b3bAVI6uKT6NPvQSoEXg5F?=
 =?us-ascii?Q?e6dxr3Tq3dmzydR4pkx27JudjRauJpURG90X9aT6ZiSedQkTLqz/d8GOmD+t?=
 =?us-ascii?Q?rPa2Q6q6vDkcR7deOKlCCpMcNpzuXifoMc91rgaVCnm5r6VAdIfSShJtOEHq?=
 =?us-ascii?Q?Ayh5Cg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oqwaflMmW7R/mFwWHVaDDZz4VQxp8quTTcRlLiTztRO8wR05YFRX1tZDiE/gq/q8i0hZM8WBLh022UXWHtwogih5qfqw+VlEr+V4bgeh2mlUWD8lCgJOCgn2XQvbVg6dfIF4t6LZTUcAHZw8dXcoPnsB054FcWc5Jjb9diSVxcaHMuUXS3E1K21eewdyhUWJSB6CkYMGZUEdHhQPhRu16YX6LuUkg0+02fPIHp/lRmW0JbnGpu94YpaxCL2h7wrOsudEoJnOs93LOe4rzFfKwWxW0Ng8J++yLmMkcT/HeRSQ6mc07qBElvjaQ2aeFVuwmZBBw41nn4RxSBxzU2uijqv3OdHP6bD1Wgx72nTz7s5UulJuxoNzotqp8v7lRS9H4bSj0DcnkrtJvJltZDOX+15ZNZn34yR3AtYsOps7nX0qJkQWfj+cNS90Pib3sgkd
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5JOnKsscGnv4zmcXtQLfBxRp2wiFzzzZMW+x1OOptuiBnZvzsH7GVJTjHANPe5usDjbiARtyNt8zZdQpQ/xNgOwF5WJ2L0KFjw2eRaIqaveOv4CCpmHFTpTPoQQhVsSyqEr+o6NDRufcxrTQovlzQA15F8Ghwb50/O3ZMPH/ou2mV+zXOEA+kgtRjpPSlgVjC8laxO+TbTu7XHG8vY7rIYaBQDWvAbdzoXDGroS2exbIugs8RBNPqetq/5kVlDwhDOdtBpO6VpHxQJjT8danpxn00wXVAhGg00UB3vSNHM9yxsL8u7oy1sHwj4uw9Kmnd6R7JCjJwr/VQfFUBgTS+S9nAwA//WFT9m64DVRtazRNnsiLppIwf7DLDB16pCDxHsI3g1/4qo2vFESKQNvx3xsiR5BqntaulH23yiUPVSJe0KXJ37XF6wmfaWjf92sraoTyxN5o2ujO7DqDz381OFlx7AtEtMGDaXyoUOjZ17CbifwsEhDZYuPRAqX1yC+S3DL+zhd97oeXOPBUaUz7FQvAOF72FJDQCciraJMMmhpI8ydJ1Ntw5yyGl3HaUdoSAPuEqLGwj5G7/RgFXwHqtvKfXQOoq8sw/D7/n8yso971QdNfNp05eM1CG9lYeMc5qnH9pZBKTRbDQrMxoX4Jng==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 19:47:51.1115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a48b3e-9447-451c-bcc0-08de69a670db
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR16MB5457
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDE1MyBTYWx0ZWRfX6jGGmuHNxy1i
 lNif9ae+6ErAeDpU1+YH00jo5jqNiXjtnfHjGyYqjRIntxz7wlBCAGbIk9kSrNcfdrmQLYZLODj
 gyn220ETcBOPlSdoAaO9rLEKhCxEQ1lnI8LffeaicXK8ogWsSKcrDNN3Tw3/sFRNZ7FmPz2Xn0H
 NRHnkd/g0mPN4Oi3KKKJvxMynL1fAIGDPYGBAp873xeQTRHL+5ca6ot5qftwQpB3MfQ79BC4G0m
 WmXKedb3CSKmd4wZ7BubD+G6+3q5kFfcDc1kAQ6xo8f8DVPnSO7OC2V/6tNq5iHeLb/N/4J4Pxx
 U8PSTa7ODfNxTRy8ArUx4jMFC3RW2NSyr5QQTaq6/d4vPvXWwXo3m8psXRkUamPyRf/PaiAq3af
 Nk559//dEPBIiZoCnBwLUiiPlw+rsrlyyGzFH3F71p5LrwCGE8zejrKPDmS/55OjbZ3wxItsHWR
 MaH5shLfdelRoZIBCBw==
X-Proofpoint-GUID: HvbE6ffkUA1fKl0gXI5PL_uJJxhRUFgU
X-Authority-Analysis: v=2.4 cv=KtZAGGWN c=1 sm=1 tr=0 ts=698cdcf0 cx=c_pps
 a=RvZuBu0Sq3F4hQe2CiMyvA==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=mLnsDVdbAAAA:8 a=cbNQJ9GKAAAA:8 a=tHz9FfFoAAAA:8 a=iox4zFpeAAAA:8
 a=lkgXPdtCH77cg12V8HkA:9 a=CjuIK1q_8ugA:10 a=DqJYxgmhk6moR-_7_KoZ:22
 a=xnp1pY6zelCj5OLna2To:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: HvbE6ffkUA1fKl0gXI5PL_uJJxhRUFgU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,saarlouis.ford.com:dkim]
X-Rspamd-Queue-Id: 21710127431
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 05:40:33PM +0100, Jan Beulich wrote:
> On 05.02.2026 02:36, dmukhin@xen.org wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > Both conring{,_size} should be RO after initialization is completed.
> > 
> > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> 
> Ah yes, that's one of those things mentioned for patch 1.
> Acked-by: Jan Beulich <jbeulich@suse.com>
> preferably with ...
> 
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -346,8 +346,8 @@ size_param("conring_size", opt_conring_size);
> >  #define _CONRING_SIZE       (1U << CONFIG_CONRING_SHIFT)
> >  #define CONRING_IDX_MASK(i) ((i) & (conring_size - 1))
> >  static char __initdata _conring[_CONRING_SIZE];
> > -static char *__read_mostly conring = _conring;
> > -static uint32_t __read_mostly conring_size = _CONRING_SIZE;
> > +static char *__ro_after_init conring = _conring;
> > +static uint32_t __ro_after_init conring_size = _CONRING_SIZE;
> 
> ... the type here also changed to unsigned int (as set forth by ./CODING_STYLE).
> Happy to adjust while committing.

Will appreciate help here.
Thanks!

> 
> Jan

