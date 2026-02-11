Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLmXFQ3djGm3uAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 20:48:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22320127432
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 20:48:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228272.1534538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqGBE-0007tr-5C; Wed, 11 Feb 2026 19:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228272.1534538; Wed, 11 Feb 2026 19:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqGBE-0007r3-24; Wed, 11 Feb 2026 19:47:20 +0000
Received: by outflank-mailman (input) for mailman id 1228272;
 Wed, 11 Feb 2026 19:47:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vAzU=AP=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1vqGBB-0007qX-3v
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 19:47:18 +0000
Received: from mx0a-00498f03.pphosted.com (mx0a-00498f03.pphosted.com
 [148.163.146.23]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 726435b7-0782-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 20:47:08 +0100 (CET)
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61BGR77N1797839
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 19:47:06 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012003.outbound.protection.outlook.com [52.101.43.3])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4c8wa6a73k-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 19:47:06 +0000 (GMT)
Received: from BN1PR13CA0008.namprd13.prod.outlook.com (2603:10b6:408:e2::13)
 by DM4PR16MB5244.namprd16.prod.outlook.com (2603:10b6:8:184::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 19:47:04 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:e2:cafe::a0) by BN1PR13CA0008.outlook.office365.com
 (2603:10b6:408:e2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 19:47:00 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.0
 via Frontend Transport; Wed, 11 Feb 2026 19:47:03 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61BGwVUC3520465
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 14:47:02 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4c6nag3xea-10
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 14:47:02 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id qGAuv6CIFlOqbqGAvvfoBX; Wed, 11 Feb 2026 19:47:02 +0000
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
X-Inumbo-ID: 726435b7-0782-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=GpIQQ6bCAyIOe0v2lqNVhTFut6j
	+5NmBUBFSqPI8/mk=; b=YVXLdKTmqTBlD3le4z9GCGT/invT1qvjLQ8nTQsDEZ+
	6zBZjJ7waEfZzMsOU7bB/UX4rHoy/PQSvbmzgkJJ0lstx31xy0bVotInVbs6og3v
	zFZwuVXAMk3M2Z5Z6riUIzS9iyAsnAGSgxFET0YxMonwNKbLhrEFWGlfldAe8180
	s6BdMfyHqSdmzz3n1yDMEl1tQw5QiGorNbEY4s7DVir/FIRS6mllOd1YinvKqfKk
	2dHS/FRSpOgIko0EIh5A0HHXY3op38RM05EBTn6AmtVS7LNXvccvPQvITMmcPVTl
	djPwId0ne0/g/s0Tw3nDTAIC92qtGCVbW8kuZirlOZw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HuhRaxgDC2RzEcr45JbIMx8mIpehwPIra18UGexbej2i+oac/4MvyFvjQkVPGYfUzzzyEM23Z3VW0YI+4sOtTcA0Klb/uhZkq2JI/0cw7j09+oTRNyZGboDxySx/DOXNLZ/6rMrhEtY6JfOLhP40q1+JYMEmPJ4iXsH5Wpd0n6LBe9mezeytOPssBoKJsNCT1eAt4IgIOuHmLM4xTS9/6damgQiwizTXDPX+uCzHuzp6xfe9YY0rgc6cbA3kZ69PUE6J6PSnE9BkxMeludN282Mzv/f2yYBWv3rYH4B6iwdKKEHe/CtxgqGl2R9XoDQrFHFAZ/LgISo3Gw3DUznR8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpIQQ6bCAyIOe0v2lqNVhTFut6j+5NmBUBFSqPI8/mk=;
 b=SM8LaWwsavmsnNSaR8E3olj/5RSIzSXc7H/4RzPqylt9UB6Eg3WEZrM43qhLqiXCZUIlfeh8kh2HBbBEEMp8Je6ygaFMIWcT3dBb7NeL9iyrdGkUsXtGC+dmFwQJuxHdj2wvxeGPDy8HXCUrpqDvy4KbZGXkn4OQqRHsd/NEiNIpidFUmGyLt6c4B7EqxQzkfMl+yZ32zMNYaBxuyJhmGCAGRonJ//VXlxPmubB1/PmRXozK3GAmGIY0tOXebmf3ux47GMBkPLZFKATPCoFkqxNFryvPf1PKu4LVuVuHTFSbGmf3cWde9dcX1qcT2O9c8x00lKV0HyFTKdis2/WNPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpIQQ6bCAyIOe0v2lqNVhTFut6j+5NmBUBFSqPI8/mk=;
 b=dcBYTbd/yM/beXVIF/orpOaMOmiQz3n25Ij5R5OkERAiC3Ol2d906LUlpo3H5KBmo9dLZerAQk4kwXR9+R4GWvlXa8gkSFYlszVYwtai1gUo9uxp7TUNYbqxEMVMeCJqCiXzOOf3Ko4v+OY6omT6ielsGg4y7mBsv+1cmyR2Uio=
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
	 bh=GpIQQ6bCAyIOe0v2lqNVhTFut6j+5NmBUBFSqPI8/mk=; b=YVpwogSApwSV
	JNUjIc/UHI5G7HBlQFRUxps66afpvtOxf3au6H35jn/WrsTABs0TKOj9VR9+xNIz
	kKqfAnbNTOz+D3v1vTyS9D1jirXR9WbpekFBHacIF3y6H34mG3Hq6f1S2YmInD9K
	E5z6OfYg9Lp5Iy6BO5noJXJ7Rc3DEdSuz8GTjjGany1nxMBTU6Muomyuv0/Tev+b
	nsoVlhQ87o1x+CjNvQk9egaUbnUz4oHBlQB8KPQLP4mIwaKCTmMQI1CuR2LhLsPb
	EE+SQzCA1/wkbrxy/KNdw3PdxHQZDp1ndVLbDISgUJ/vTXgZN2G99ee5J9TI0666
	IVoBpjeE4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=GpIQQ6bCAyIOe0v2lqNV
	hTFut6j+5NmBUBFSqPI8/mk=; b=UB18aucuiBWZtL11W8y0oodJNNbugaOFPpoO
	RVg52hXEYrPAWQq7dAwFkAW6YOmfrmXbxG7V5BDJSogDOqtjs/7ZP+SNVtDn7z2z
	ZBTS0OjjOnEnimwrid1RJ97jJpUtCNynPM62AI5Cq25XpdGea40IBazgtx3ZTXLP
	OI6ssAWXQw9ACGTl4ytGpMddKtjM6UofkPbjfIn/+j0sODPhLPdy9ZF1GuS9JvN7
	atbbX8/RI32gThMp8Fr1GtWp6mfxRJpxj2usAIdndQRje2GKzcHzn7SQSNZiK+TS
	MaTXgl5RRWMv9bPk7fQaEiXgt9tBctFR1IjzjMgpzXPOstMrjA==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: qGAuv6CIFlOqbqGAvvfoBX
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Wed, 11 Feb 2026 11:47:00 -0800
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
        michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
        dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 1/6] xen/console: group conring code together
Message-ID: <aYzctC3xcH1vYq3S@kraken>
References: <20260205013606.3384798-1-dmukhin@ford.com>
 <20260205013606.3384798-2-dmukhin@ford.com>
 <1579e081-b945-40b1-9a72-f6c5f7ed69ca@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579e081-b945-40b1-9a72-f6c5f7ed69ca@suse.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|DM4PR16MB5244:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f5523c8-72c3-494e-b413-08de69a654a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?owYIuZYmFdogGiEYr/T6mg8ULW0C5SRmirNANPa4k1Zb6USxZr0b6mLtcct/?=
 =?us-ascii?Q?8bW0sJ7bypIh4g3pmENdzWAeUat/A7b94dk583+yd2a3rPIkSVZGlF02psV7?=
 =?us-ascii?Q?H66YSzSVokIyXnppkS7OrXEAW9DnTgIRtJIOLvbyfxMVcf4Ci/HVMCNgHtDS?=
 =?us-ascii?Q?BVDm1o1goBivy0jet/yobeF6IjeaesnGmaQe6tlqt8h2J3ZxWXq5ChrNT+Xt?=
 =?us-ascii?Q?OACkUjOu76mxF03CmzZeFPthFpY/kX4qjD7TqpEVtoXxkx+jJ/M0QhhoZgxW?=
 =?us-ascii?Q?sdhj47fypOmrtRb7Zqri0VJtMpyadZl/Fp5vWukVrRP73xy//KRUhWPsG1AH?=
 =?us-ascii?Q?5OAHZvhAoDLKefHpcLa+54PUck+gJscC7HJGUF09FzS1SVXZSRLYCaaYzNQL?=
 =?us-ascii?Q?Z1kKUWBTWxhLQLd1pOsBExYZaSnx5Lw6GeBvt4s+Fb14mvAxSemXwnqRFTNK?=
 =?us-ascii?Q?jyplTu74f9UlmbPsVcqbOrw9i8jptvCYQoRTXTFsZPW2eQcW2GHLeqLBGZBD?=
 =?us-ascii?Q?RbN/QPFVbcaKzp6Fcei5TPuupnI06eQ2S5ZlOaeWapBvezkvOhbbb9xAu2BY?=
 =?us-ascii?Q?HwHirqeTUt5gLkMF57Myc92SkLSB7zGNuhPCWK5VJWhW/7jprdDiHAdj2GnH?=
 =?us-ascii?Q?tzGQogeFhaqpkUCESIecGfAkf7jJbaeobzT78HSwqeoSvdUyROU8c7aNGO4f?=
 =?us-ascii?Q?XKFum+iaoTYr5Ndv4YwJ5qZR9TKzigXX7lrPb4wAUYYL/QHzsHB2I7yGM9pt?=
 =?us-ascii?Q?mjuy7ywNQpXGg5njJpMVZL15UYsDAuIcqxdYpjVW+b3tM7Yba7yOzILZrdVb?=
 =?us-ascii?Q?TXgkeWBFNe6jQFtSogFA7qaVJjxja9O0oQNIoPJ3EaGdc12/0EiHyec7cpOG?=
 =?us-ascii?Q?Zp2y6soOBJUgT7Yxdl2AZWmgUiQ00hhsEYkf0rITn5uummyfyov7XqnTB/HX?=
 =?us-ascii?Q?SDXpQzJ3nVKpRK1z8WomMKmbwzgynvLSw/cq6kH9/cL6cl31pAsoCY9LsKJO?=
 =?us-ascii?Q?xYOsbpvwUh3OEDNodG6vjLS5aF7q+HxIx0S1mDYZFNtkFS7+iqMIa9Bga0jF?=
 =?us-ascii?Q?KjpxUeWoxC7gRaM/O1aJh1XzTVGkhhbftWJ4WXNQ6bXpXYslV0iZzCfN3bhl?=
 =?us-ascii?Q?TR5nGOFYkmpr35a5i9S3ysKpIapn41YxBojUXV7GBDyq3QMTs+afsoe4UeQ6?=
 =?us-ascii?Q?apwR6YBEnc+bWmmzGwUwuNlr+5QwXEH1rKI8M8dLXmJbZ1Y5nCMBc5DJYCYp?=
 =?us-ascii?Q?vP+KndkwNkLVqq03k3mXQT5iQ8FS8jVbEdLevRUtNmrPxEJbcj4J62WsexLz?=
 =?us-ascii?Q?D9YcEXyxUPmKEGSbFnza/CIvXhrVk4eM3VgmxHv34DacRBLfKVL3PXrvPMKe?=
 =?us-ascii?Q?UJaVeqCW/gajJXUnfWdbAfg+gQBAvzYLt0hYa7JvmGcBrqkTr43qIV/1JYUt?=
 =?us-ascii?Q?FfM7CDQDVwfZsz9Y9klQ36Xj/ih4KkjPC13exTDRc+88SzaA6Jj5+Y1H2MST?=
 =?us-ascii?Q?DmxYA6jESBDGA7FPquvACuHX9MQFv1OoX3wJzAH/4dvaWT2GYQBrKpqGRlVF?=
 =?us-ascii?Q?TvBs6S3AvQjWhCjgdNxyVu5QNIrhNTGwmVfkpsPB5rRk9iNFzPFPnSs1GFdd?=
 =?us-ascii?Q?7IA6qGesddipVZ1Dzlu5QA3qPrjgPTT0okHb9VhdGnJY?=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6MxeqAqk2S9egb8x1BUJc6of5B9OPr0YuMFIvrfoN3Hvqm0HML/T6YIhFUg9xKNoz9wvnwXHVaithxQ64Skx8teAOdIZfDhzkhhxTETmUKLz9NI/ONt0al1snQ5Ir4PHSncekhuAhit+qqxbkgNArKomqghGQXwzxCVv30ge5oZpSGddTj22futki+XijZyJaAYNHKjNCVAD5bRIvkku7LR1yMV2cREAOsmertC1t/EcDdvZTjIypuQqY4FebmpbB/CtdN0ZAM/iRGbAFMznDn2LD/g5buOc2sxtK3beLFqWDvgt+nmFNMWwmJVuHfLCtK2aGLGquAYSZY0hhgEbzmM1Ln+O5M/8FHAuKKOu23R/e97mr9WPO4Cy20oZ2UvDnW58JMEs86tg7QGSNVBmSeXqv0gSSZqQjGyK3IyhXKkCgiJjPC8iGEAkarxDas12
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c0lXM40PpqeBDhM0G6xcXatDKFtr5Yn5gioRg8ooPoyGcGcnRlgM8CJzHzJ6f30xPgv0c/M2gWu8hbkg/GHBQ8eT5a63lb+mlFT2Xa64/WyR+gIYcVRrGRv+u7qCXShANA7gklar6bxqwd7+VIxGbaLuTI/YMLC8eK020GBvTN5iKmBGz5ivMHTRA2ToWqqcilIIHwj6g/MmjHFcOo/ym/4oZHJu3wVr7aaH7BjUDAV/x15H7W+4mc4t3JFaLTNtIqm8XXcWLuv8n/DR0XLb/UxSw8UJn7oYCuckTXJvt3OmYLT4+cxj6NzfV5yoT8rfAqOgOB+i1vQ1Nti+gieBHtmIlohVZG1kUkxfi0RqkpOXgr5g5vzehAZf2Kw2+T6APDPx0jnlygj2GqpRGYqr6OUEj12uYwl9hqJ6AbmT5xGVohv681sAAjNqStvje9641exGIPunQSZNu8c3jRvKKgwAmH+YUp2DOSxWyI2wRsuPXQCTJheAACMVtmsFTAozJPoCcdw1OstHWrsCAHF7pMAYBJCo1p+TmcVR8rCd8uwx8xT0JrWEcwqg72vk+OgxefAMVpErz6eB5/3Mv1ig2sRxcMW94qRlf0Vm/H3PkiMcpAB1LuBp7196jhGegjfsFPmup6u6SueA/i2fs12jlQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 19:47:03.8017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5523c8-72c3-494e-b413-08de69a654a8
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR16MB5244
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDE1MyBTYWx0ZWRfX+l/EIkGiFUHW
 5NR3knIFOkRF5VJq4d0nfU6jYyHRn9wlmNZo6FLgiGZwuEHHz4xBoHCzJaqRJ3II22Um+ccvJZR
 YHn3es9XtuviOF+3pmLi7HLPwMOmus5hUWJNKwzRBrvRPruxHCT3twPKMX1sMYMsBFEvxK5Jxos
 JP+ZIdPNh95aycK660DLgVMab8kUZHoEB2VUEoTkwj1kfG4XomCBGF7BKwSXd7sUFYPLV0Zr0qH
 cL3YhMTCBns1zGZpeFVboTQRv6RE/xnqLcG9DxwiGVRG3dJcDelHXcAmPjU1WND1+o3qb14bMLG
 TbEPRferSqP8+QDV5tRk7BtHFoj5lzQLwODa9tEU2G3bNGQnHm1+xET5YyxmADvu4cYe/qpdZQb
 FAeDF9a5feqhBdix4fh/20pYIJI2OjDg3SDL5Ir0Fix6+g+PXU1XUDMeGvMI5mWoSjcEQVnEi30
 xo69R6EGdSjfu3VDSGA==
X-Proofpoint-GUID: rIqtbVNiGdShPyW_Hp_Jl80kXi6ylGXp
X-Authority-Analysis: v=2.4 cv=etXSD4pX c=1 sm=1 tr=0 ts=698cdcba cx=c_pps
 a=ayBBURk7jZ4GzqZFlR2IhQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=mLnsDVdbAAAA:8 a=cbNQJ9GKAAAA:8 a=iox4zFpeAAAA:8 a=qZaStkxjBf0flXYCaZkA:9
 a=CjuIK1q_8ugA:10 a=G69WFyCBNqGPyalROSdv:22 a=xnp1pY6zelCj5OLna2To:22
 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: rIqtbVNiGdShPyW_Hp_Jl80kXi6ylGXp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,saarlouis.ford.com:dkim]
X-Rspamd-Queue-Id: 22320127432
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 05:38:36PM +0100, Jan Beulich wrote:
> On 05.02.2026 02:36, dmukhin@xen.org wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > Groups conring buffer management code in the console driver for ease of
> > maintaining this code.
> > 
> > Not a functional change.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> with one minimal adjustment:
> 
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -126,17 +126,6 @@ static int cf_check parse_console_timestamps(const char *s);
> >  custom_runtime_param("console_timestamps", parse_console_timestamps,
> >                       con_timestamp_mode_upd);
> >  
> > -/* conring_size: allows a large console ring than default (16kB). */
> > -static uint32_t __initdata opt_conring_size;
> > -size_param("conring_size", opt_conring_size);
> > -
> > -#define _CONRING_SIZE 16384
> > -#define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
> > -static char __initdata _conring[_CONRING_SIZE];
> > -static char *__read_mostly conring = _conring;
> > -static uint32_t __read_mostly conring_size = _CONRING_SIZE;
> > -static uint32_t conringc, conringp;
> > -
> >  static int __read_mostly sercon_handle = -1;
> >  
> >  #ifdef CONFIG_X86
> > @@ -350,6 +339,17 @@ static void cf_check do_dec_thresh(unsigned char key, bool unused)
> >   * ********************************************************
> >   */
> >  
> > +/* conring_size: allows a large console ring than default (16kB). */
> 
> As you move the comment, s/large/larger/. Will adjust while committing.

Thanks!

> 
> > +static uint32_t __initdata opt_conring_size;
> > +size_param("conring_size", opt_conring_size);
> > +
> > +#define _CONRING_SIZE 16384
> > +#define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
> > +static char __initdata _conring[_CONRING_SIZE];
> > +static char *__read_mostly conring = _conring;
> > +static uint32_t __read_mostly conring_size = _CONRING_SIZE;
> > +static uint32_t conringc, conringp;
> 
> There are several other tidying things to be done here, but I'm not going
> to request that you take care of those, too.
> 
> Jan

