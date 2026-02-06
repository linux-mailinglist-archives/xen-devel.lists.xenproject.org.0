Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCZ5D4c6hWn6+QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 01:49:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B383F8C2F
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 01:49:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222621.1530406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voA1A-00051n-It; Fri, 06 Feb 2026 00:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222621.1530406; Fri, 06 Feb 2026 00:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voA1A-0004zo-GA; Fri, 06 Feb 2026 00:48:16 +0000
Received: by outflank-mailman (input) for mailman id 1222621;
 Fri, 06 Feb 2026 00:48:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FjYH=AK=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1voA18-0004zf-DA
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 00:48:15 +0000
Received: from mx0a-00498f03.pphosted.com (mx0a-00498f03.pphosted.com
 [148.163.146.23]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7efc3023-02f5-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 01:48:05 +0100 (CET)
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 615HtUSn021469
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 00:48:04 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com
 (mail-westus2azon11012029.outbound.protection.outlook.com [52.101.48.29])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4c1x7kaj4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 00:48:03 +0000 (GMT)
Received: from CH0PR03CA0199.namprd03.prod.outlook.com (2603:10b6:610:e4::24)
 by SA1PR16MB5149.namprd16.prod.outlook.com (2603:10b6:806:33a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 00:48:01 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::7c) by CH0PR03CA0199.outlook.office365.com
 (2603:10b6:610:e4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 00:47:46 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Fri, 6 Feb 2026 00:48:00 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6160c7kl3941270
 for <xen-devel@lists.xenproject.org>; Thu, 5 Feb 2026 19:47:59 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4c2127wnwp-17
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 19:47:59 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id oA0qv3Wt5wVq0oA0rvzrR9; Fri, 06 Feb 2026 00:47:59 +0000
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
X-Inumbo-ID: 7efc3023-02f5-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=hIR6mgapBJLizrWjencnTibcGYW
	KdGynUj73hYu/DmM=; b=d802N9aw+MDdTBVLH0aobaDxdAkBvjSfnqjLPNlJfe0
	M+8grVEShFuaPlZhrHc5I+z7zaj+zD0FPuj+oJ+t2e83Pop0ziTATHx48RlbNySp
	79btf8j2krCZnO+H04nzXQfsIEORChYCTb4gbYB7fq/P6PJ1fsHkUtevwBJ/PQXC
	RliNh3A/qjDVdfC4lqi3J+D841moC7qNdvaphXUeLmA5IffwtXYBzfXYtCjRAg6I
	4HyWrIWwxh3cAqpWWgXx7GuoT1kzYW87dZyuDtp0H8VSBOadTcV4BdPAef2/olGd
	bXPeSVZqntTnSbQiNaGMDGLWbH/7y9KR4LAZC6Xt7tw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=keqdw35mCCWsTSfWHYhg2DJg2M2fjDkqdA8NFGK3zsRE/rKnKb4AZBsPXfA3gRfwFiVhqnRAkXO949JboFlOTof7+RLozWQmOrOS74K/5hRkhgd8FlCBnT/ecPvNI/YsdaNNStUrcgZU87r6BR2y43fK8rL5WHOHeR5ThA1cUvKdqhAThBrSW6LlP3G9qdcAo1AlhEtoruTOC0IJKMTAiOKEvv1aI7qz7R8+/HIwHovyk9IG4KsNYEsDxu8yDqONwi3LQqDd3oXh+sJI/b/ZyFRWVUVZzn+O79cIk18FTMaB8ZGQRfMVsuSE1qEwl7/LtyorGrYWb3U300g/PPrVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIR6mgapBJLizrWjencnTibcGYWKdGynUj73hYu/DmM=;
 b=tRyj2tOI4+As21FEzOB6BmuAohS9ICc9W1/a1/L/LVatSq+ri5XhIdGz1xvEfrhOztagAqsDIDzYisnIbY2P1XWEDgt+wFgCF43MjVIDnSOY4QzB+1Z2mrNu4QNPgDn9wlrrxQfE6pa4YuJmAnXyWarehbz8yU3OcVUlYyz+8yRY0XyrYrON2Fkmq9dawTtFjBh2Z7vjzvvObsoNhujWSvM7CsnmI35lRt15bbbr0Hwm9my4z+xNE5C4DyepTsNjAQtjtXMogtqH/BhfVsVNg967dQWQwW904urhW9o3WUxSQM2dUUkClygjuLFMHi+/+n5Vbo3iRD1fp1VA9Td27g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIR6mgapBJLizrWjencnTibcGYWKdGynUj73hYu/DmM=;
 b=kAxZxvLr4PMH0NOtLFJ8WIdsBwk4QTprePapiauD8eF+h3Wo8RsORIRixtKlosmTkBF0POmEiU+vNavO7Tuz8uWZA8DbmIcCEHsZtMuknO6KzAp2C20+ONGEsjgsNlsKBArAwUPQzw2PBcTyjywlD/tM5eKIfl5rK0sifd1V8Hg=
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
	 bh=hIR6mgapBJLizrWjencnTibcGYWKdGynUj73hYu/DmM=; b=UJJyLKkahyot
	FfBvmTSNjvlhBaKHCT08emNwQ3A+VulxtYUlCqxGyNhMF/7rT122cDX8t8UY1gJY
	UwIJC7VxxcRZVeD5Fy6h1XPTrn0P17432cW/8OUFeLeVo5nR2Y9s5ZpQoxTPKk32
	wYvIwrcVmA8XRJpu/rbVIsUNokd7LCeT5+wRIFk7EJmnPsWUWIamr8I37dYTI+vT
	N7UJAbZYkI5n58TFWsTCdl4FqEAzH+gIhnyD2PBvNxdb8cQivmYEFEJjfbtNmRCg
	vGXA5F5EEHT8jQONmmMuVCr+dcAO1rFr3bxRSUc6KaisvQS1QiW1Weh0+1UeF6cO
	bc3B8bAlrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=hIR6mgapBJLizrWjencn
	TibcGYWKdGynUj73hYu/DmM=; b=Ot2GFBgLPL0z7S4SXp16+JggspCtvtHW6FZb
	0kUf7XRi4LK1niuqlkrkXnHGNRYTLfr1l89Kkvtt6D8I/RQFnmKrKMcpNI05LfLY
	wNwJZSnzOlvufQeKbxE3/hEWijSb9JVUJndzPdubS2/0o87JXTTB3xM/4gSbs3A+
	eNes6wUgkNlJ3AME3DXEyJrv6aKccA4neAy8sc1myRPicJSOOCqjYxnRhe8t54iP
	L0SR+SN+ap4UVNLu2KBlFUPtyx5+SMKeggR/F7cQM0eer5aLQQp75Mv3OeThY8l/
	l0UPK9LFfvN3zDNlfliy4/uWnbVnWeQGMrZXGL5ZoeQNY4ksGQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: oA0qv3Wt5wVq0oA0rvzrR9
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 5 Feb 2026 16:47:55 -0800
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
        xen-devel@lists.xenproject.org, grygorii_strashko@epam.com,
        anthony.perard@vates.tech, michal.orzel@amd.com, julien@xen.org,
        roger.pau@citrix.com, jason.andryuk@amd.com, victorm.lira@amd.com,
        andrew.cooper3@citrix.com, jbeulich@suse.com
Subject: Re: [PATCH v10 5/5] xen: enable dom0less guests to use console_io
 hypercalls
Message-ID: <aYU5tGrbkns9OrAV@kraken>
References: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
 <20260204233712.3396752-5-stefano.stabellini@amd.com>
 <aYP76EsG3bf3Yp4I@kraken>
 <alpine.DEB.2.22.394.2602051403060.3397030@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment
In-Reply-To: <alpine.DEB.2.22.394.2602051403060.3397030@ubuntu-linux-20-04-desktop>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|SA1PR16MB5149:EE_
X-MS-Office365-Filtering-Correlation-Id: 3696e6a0-6b92-4700-b614-08de651960e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|6049299003|376014|4053099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QczZw8PrvdRLsr27pfqD3fByRzJjaMCVK6wjm1hYGRBmvxktKIb4xgx+yGQH?=
 =?us-ascii?Q?VhVVrmMPwg1Rn0cu6KCiqF4fBmr5FgaUV7FFk6RVir8SLzrxxfF2tyMrLhti?=
 =?us-ascii?Q?96ZxKNGJAQkwaCZPqFab/n0kJ6q4Iz2XKpZXlohbB3XfDs5XXamf12G78RdU?=
 =?us-ascii?Q?exyP99B5oicm4groi2ynvaM0F9+Zrz3zglsLO7kFFGKKU0NkH8x8b+PH/qHW?=
 =?us-ascii?Q?OxtGUgqPvfg1VqjHDRBMChy3hyb4hB0QwvhrSsd1JnKkN0NGbn9t2Mb3+5yj?=
 =?us-ascii?Q?cJ3h5YnjS8xIiVj/RwzdTYqGpelAacd3YNGPoSAu8HgtmU2bSt7ZjLHsqUyp?=
 =?us-ascii?Q?PZSnmn2UxlV3valyeNRv+p7wrB+023f1mpNybtm3faIs/zQyL2uvEyNUCp+J?=
 =?us-ascii?Q?AcBFL9778ZgOS4gFsMFJJGumYeEKqAauoN2ybO3ioAp/rnwv7uR7884TK8dO?=
 =?us-ascii?Q?OIZ3cDtIGo63sdNd6ICRuhwDPj3EvqtA2q3g3XZ96ZCoOdC7eQWompNrMeYH?=
 =?us-ascii?Q?3i3/dY0/gicwAqcx2Eplb44VN43oyiCElzo1hWpqdR293ycGXEwAnvsvVVba?=
 =?us-ascii?Q?A+vdHfLv7BgQbWURSrsUbytPilh4VpTD5vx1UBhG7OzUDGvSya1xG4O60OdH?=
 =?us-ascii?Q?3su31sBpIGoS2tlLLH+18ZHOfKFxME8niaV4voruCEBwYHLaPg0U2gko/1Np?=
 =?us-ascii?Q?iX0RYAzsDf2v2PsFJHNOA7IlYjLSdcDTC6gfAe0yvsWShVh+Bxe34pF0ZSos?=
 =?us-ascii?Q?PKgQVe6mCE7BeB8NhongQjn7CZDSzy3uLFf8A35thsUzmbMaOoNz/kzqwcXq?=
 =?us-ascii?Q?UM4p59R+gVn9rY0TL8u7BAeUQXPZSZ9/Gg6iVxz4uKk6Vj1BXfe5HoeDGSb0?=
 =?us-ascii?Q?6jIY3k2oAgla9tXqNJCxyVyEcudo3v6gUBlUd0F2gQ7Hal+l6YTqf0c3addW?=
 =?us-ascii?Q?e8cj0h7tNcBcdyXYWFAoB6TfU3FYSDwWT1/orKL0l5XGMDmctpKmVxzJ7Df3?=
 =?us-ascii?Q?0n0LG3kZlxc+EVRkifm8CammPc/VkVZ5lPvVkZ3ONxIYoQJpiyoDb3/Eog8L?=
 =?us-ascii?Q?gUHwYSFzRQ/iL8NO5WggG/8k1DXnsTKaGMJaQ645iP5By95OjjzUQEdwaLAk?=
 =?us-ascii?Q?fdZ4VMJ8WE3mb+YpRbxJHt/EApylK12hgEjghKP1NNJmfEQczN0ngpKKchAz?=
 =?us-ascii?Q?327HIylM+mVmPVu0qw65TAa/yuU68e7a6eEVYv9hT2u9L3H43WB5T0iUUzeb?=
 =?us-ascii?Q?PGkKKyRV95GxR2oiJ5Qxvg+OMw1YhtR8o5Gh5eMf5/F/EFc3S2uPtw5A+waV?=
 =?us-ascii?Q?pp6vyW9SzvfnlmWug35XxFUHamI6y8I2DAZEkGEnX8LYrWE6JPcjUZ0aMwVY?=
 =?us-ascii?Q?I4ygASU093aRcREjEJfiBZj/7pVu?=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(6049299003)(376014)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dxExsXdBKgPWEh5ZYDxv+MFjJaIMTGxP8QLBGCchD8cB7igrC2u3JW3qc20Z95+VxgKET0JIg43tD9z6U1wJALtZo/2OHdrr2vFUo+jCLZmWcl32qfLFAAfQBOGoVIVxpgvlgvRneeT+s6lOZAcUyja6ogGe08xQO15P0RwygukwE5BgbC1ORMoBcD9K1gC/PUBXbc/V4pGS8kYh45jQuoqZbgQONw1H20up8imXVDD/9r0rIEVOz5DI9OcMlbRM4VdWS1EAFEKFN+zOYmlPIuGivg9Ogs9UNhH8coFInanKVyrfM5YDtzANm0gdZFG/sCUlfBAkLq5ar7e6cH8UVxUPa+WtxICd1gfQZw80trve0/dIhI2JweAxOv3TaE5lw+ZYPfYWCRLHFzIVJPOv2u+P+e61nrNl3FuJ6E8DHEz/ZSOlSPcMS1Edm8nEtYIz
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nulJS2uyUpR5DgjkM8A7J6kewqGq+znGhmYvFFFYZyXdZDGIz6bD1WUnERNPV2/cbcp22c3lKtFkFpBGeLHcjN/JRMGfccrM0RS6Ms6Et4DNV3BLZDB/WL9BtfTIMR+2mhlv65gmiXVe/CV4Ny/0hUzOc1MX5O6bvvMfLa1K8cahK7KAW/WCUD4npv9uJf6kNYN5l/Y/7TS9qKVeSi8mdlIk/nN3msg21sX9+WVMW7zM0KLguWOgGZXUHvVLqGv49VOZ9nwpkapzK1fwfHs8DRyyYT582KYGQ50IlKK3xMvOui+N8tiWr/d2Q6vmSfp5KddqJqJhADHyEITZIjImUHGE9WCYtkgnCB7SPsqRTfOSwbJ9/G1BGCfqU7IEYQYhE/GbOZjIVHY1rldIWSPf3Bik5hVgXoH4slDblTXZgFv/m+7yC01ucjW9rqJXT4KhWGLlOF60Xv5IgbCQ00UmVlC850mF7o1130hjhAYEd05ShSgfdtlbwu9NYcsuoTCTW3iBbUHydIoiZKpyvtVF0XOIj3+FpyRF3428I0TJvBnAxKRAa1v2Qi2AcW5kj/oj9hTBaazGScij3G/SY0eI1k5ncCxA2yuIfaTkizaqWzEK1wfY8uIGIEWUzyHNbhvTBr0X3vI5radrqirJpCcPgA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 00:48:00.5721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3696e6a0-6b92-4700-b614-08de651960e8
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB5149
X-Proofpoint-ORIG-GUID: iw37FmwOPVbRp6JeX97DzdgKai0YjmcN
X-Proofpoint-GUID: iw37FmwOPVbRp6JeX97DzdgKai0YjmcN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAwNSBTYWx0ZWRfX/rVG7dTIFMP4 zPge5E64mNABqF61ka6DOANV1VgNfjUiZz4sknBnoD+s8jqRIOEiXG0Kt7TlBWmu8dRZ37U7tue SlbxmUvPEUccYlSzApO9cGSf1I8rxBJVIBXJiUjAvMc4oQVV+bPnhsiFyz/7/uEaP4lcAepBwbU
 je70nahOcciVS/yj04KYOK347aR2r4BfyVlxXx4xJ2mN1XDLp6ruF0QXetDyiW/pmJ0yFNVeTL0 4JsfJBzd21oJRp4tTL/p2vsXQO7SyiE88RTKkpkcPMxwaBRpsuXxeRmgZGrV3qYM5wofYqU/v+d 1o6dk45rrTJn9kJG0/L7QhJVDtX8UTYkU0DHaCmFWA8MTkXGU7RWGRf1lA7jUMlyjaluh/uk7yy
 Kn1Lj6VFP6TeKAITMDsYB9bwY5T6OdYiF6kVG2hvRHFbzqhYvRmkaKeNjiOJtPdczg6hyiIlCIq nzjbigWulp4HMosSbzw==
X-Authority-Analysis: v=2.4 cv=A/Zh/qWG c=1 sm=1 tr=0 ts=69853a43 cx=c_pps a=lBl9kuBVfjPHxW47UHPt6w==:117 a=lOEMawUel/sSvQipkIvNbg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10
 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=gmyCovRJf1LK-PwbnYMA:9 a=CjuIK1q_8ugA:10 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2602060005
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
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,ford.com:email,ford.com:dkim]
X-Rspamd-Queue-Id: 1B383F8C2F
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 02:09:07PM -0800, Stefano Stabellini wrote:
> On Wed, 4 Feb 2026, dmukhin@xen.org wrote:
> > On Wed, Feb 04, 2026 at 03:37:12PM -0800, Stefano Stabellini wrote:
> > > Enable dom0less guests on ARM to use console_io hypercalls:
> > > - set input_allow = true for dom0less domains
> > > - update the in-code comment in console.c
> > > - prioritize the VUART check to retain the same behavior as today
> > > 
> > > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > The code looks good, just one remark wrt prioritizing VUART check.
> > 
> > > ---
> > >  xen/common/device-tree/dom0less-build.c |  2 ++
> > >  xen/drivers/char/console.c              | 16 ++++++++++------
> > >  2 files changed, 12 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> > > index 840d14419d..cb7026fa7e 100644
> > > --- a/xen/common/device-tree/dom0less-build.c
> > > +++ b/xen/common/device-tree/dom0less-build.c
> > > @@ -829,6 +829,8 @@ static int __init construct_domU(struct kernel_info *kinfo,
> > >  
> > >      rangeset_destroy(kinfo->xen_reg_assigned);
> > >  
> > > +    d->console->input_allowed = true;
> > > +
> > >      return rc;
> > >  }
> > >  
> > > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > > index d3ce925131..7f0c3d8376 100644
> > > --- a/xen/drivers/char/console.c
> > > +++ b/xen/drivers/char/console.c
> > > @@ -610,11 +610,20 @@ static void __serial_rx(char c)
> > >      if ( ACCESS_ONCE(console_rx) == 0 )
> > >          return handle_keypress(c, false);
> > >  
> > > +    /* Includes an is_focus_domain() check. */
> > >      d = console_get_domain();
> > >      if ( !d )
> > >          return;
> > >  
> > > -    if ( is_hardware_domain(d) )
> > 
> > Hardware domain on x86 may have an emulated UART (not in upstream, through,
> > I need to send v8 for NS16550 series...). The patch which illustrates the
> > idea:
> >    https://lore.kernel.org/xen-devel/20250908211149.279143-2-dmukhin@ford.com/
> > 
> > So this code (hopefully soon) will need adjustment again.
> >
> > I would update the code to something like:
> > 
> > 
> > 
> >     if ( is_hardware_domain(d) && !domain_has_vuart(d) )
> >     {
> >         // handle hardware domain
> >     }
> > #ifdef CONFIG_SBSA_VUART_CONSOLE
> >     else if ( domain_has_vuart(d) )
> >         /* Deliver input to the emulated UART. */
> >         rc = vpl011_rx_char_xen(d, c);
> > #endif
> > 
> > 
> > 
> > But domain_has_vuart() needs to be defined for all architectures
> > (currently it is hidden in arch/arm/vuart.c).
> > 
> > Or perhaps it is possible to postpone the change?
> 
> This change is needed to avoid regressions on ARM.

Oh, I see.

> 
> However, while I wouldn't be surprised if we need a change here for your
> upcoming patch series, at the same time at the moment I don't see why
> this check wouldn't work as it is for you as well.
> 
> On x86, CONFIG_SBSA_VUART_CONSOLE will never be set. It is OK to do this
> first:
> 
> #ifdef CONFIG_SBSA_VUART_CONSOLE
>     /* Prioritize vpl011 if enabled for this domain */
>     if ( d->arch.vpl011.base_addr )
>     {
>         /* Deliver input to the emulated UART. */
>         rc = vpl011_rx_char_xen(d, c);
>     }
>     else
> #endif
> 
> It shouldn't hurt. The is_hardware_domain() check is also not necessary
> anymore because any necessary check would be part of this check above: 
> 
>       d = console_get_domain();
>       if ( !d )
>           return;
> 
> So I am guessing that your series might actually leave this code
> unchanged and instead might modify console_get_domain() or
> max_console_rx.

I think I did experiment w/ processing vUART before hardware domain
locally when debugging NS16550 emulator with dom0 PVH...

Thanks for explanations!

Please consider:

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

> 
> 
> 
> > > +#ifdef CONFIG_SBSA_VUART_CONSOLE
> > > +    /* Prioritize vpl011 if enabled for this domain */
> > > +    if ( d->arch.vpl011.base_addr )
> > > +    {
> > > +        /* Deliver input to the emulated UART. */
> > > +        rc = vpl011_rx_char_xen(d, c);
> > > +    }
> > > +    else
> > > +#endif
> > >      {
> > >          unsigned long flags;
> > >  
> > > @@ -633,11 +642,6 @@ static void __serial_rx(char c)
> > >           */
> > >          send_guest_domain_virq(d, VIRQ_CONSOLE);
> > >      }
> > > -#ifdef CONFIG_SBSA_VUART_CONSOLE
> > > -    else
> > > -        /* Deliver input to the emulated UART. */
> > > -        rc = vpl011_rx_char_xen(d, c);
> > > -#endif
> > >  
> > >      if ( consoled_is_enabled() )
> > >          /* Deliver input to the PV shim console. */
> > > -- 
> > > 2.25.1
> > > 
> > > 
> > 

