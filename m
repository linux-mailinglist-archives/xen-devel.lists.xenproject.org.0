Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Z+6CZWRjmlXDAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 03:51:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5251327A8
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 03:50:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230085.1535660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqjG8-00074r-TT; Fri, 13 Feb 2026 02:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230085.1535660; Fri, 13 Feb 2026 02:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqjG8-00070I-Oe; Fri, 13 Feb 2026 02:50:20 +0000
Received: by outflank-mailman (input) for mailman id 1230085;
 Fri, 13 Feb 2026 02:50:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4gzd=AR=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1vqjG7-0006yU-GE
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 02:50:19 +0000
Received: from mx0b-00498f03.pphosted.com (mx0b-00498f03.pphosted.com
 [148.163.143.241]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b69703dc-0886-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 03:50:11 +0100 (CET)
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61D0sXdj953797
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 02:50:10 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010002.outbound.protection.outlook.com [52.101.61.2])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4c9su0rfqg-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 02:50:10 +0000 (GMT)
Received: from BL1PR13CA0324.namprd13.prod.outlook.com (2603:10b6:208:2c1::29)
 by SA1PR16MB6414.namprd16.prod.outlook.com (2603:10b6:806:3ee::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 02:50:06 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::70) by BL1PR13CA0324.outlook.office365.com
 (2603:10b6:208:2c1::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Fri,
 13 Feb 2026 02:50:03 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Fri, 13 Feb 2026 02:50:05 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61CMWlc52548055
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 21:50:04 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4c6mq5denr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 21:50:03 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id qjFpvl2H84XAgqjFqvcAPx; Fri, 13 Feb 2026 02:50:03 +0000
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
X-Inumbo-ID: b69703dc-0886-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=q4rnB/Lh6fdQpYdjJxwi4vZ4C
	W28EcFbNEWJ5GIehRM=; b=ezzcYrSHFKNt8bwm7+ATmeNJfokyUxDzdk8Jrwo7i
	LaudZR5apFLQO9BG+ASRmR8mfKHAc1v8FpmP8Z2Id3WadaceUz+TGMW8fY7iwdWU
	8plIQe/bFQlEf2V1NEk5m544xnqDn+3AHnpX7l52um7IhbfuJ5gyHHOPLrmIiTmw
	7j5HsPSQ798LomwGnt5M/GLpUiTjFlJ4CgpEwVGhud5Z0F2VwCb6z5APfIf9BPwI
	JkzwFXmeQlEt05Y56j3kl1bDjQ4PFxqgPDmrVMU2yjbdz66TWcmziub818j0i0yW
	U9lMQ2uTX61FefTiIjGlG1binqMHoFeTs7DDe6JqXIjUg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1U9MqsSJgg1+S2kHp2cHyZDQcSifB8jAlWG8FR4QspuLyKcdlVS49O54R7CsiN4KbG/loLV/l+wvXAksFUjEUPXF8n2e8jd9RCMXqQjCVZugFwnv9mZ4K67iMaP15eqkB5PfPU3yw1XGmecJI/BtFGRf0Ef9Qaloxl9BsjWQXHL5Kf/i5HyYAyVDY1VfQRr9+4B0BWfGp+rxKfew3DHFHeKpoEkwoCePAy5t3wOdO4mP4qVJZREIOoIf55pk1yn4m7tkoSFwzQWBVdIiqiwYystRQfaWgzkS0fl/8MGR2sVm9gkeXmcpSQotUv5gFzhZSWOlOurY44neG77YHD6Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4rnB/Lh6fdQpYdjJxwi4vZ4CW28EcFbNEWJ5GIehRM=;
 b=VNY6KlAa30b7SB0qn869Q7weLMfZg24nJcYE+6XILiU/hWxc8437WA6kdBUp0MhuPHaXzwMpIW8jQuhFaIn6IgFcr2KDdRC2ksuWVXCK1q6j+LPRo2cPiOFIw1u8D0snkiDSqvZBI3BXSQZv7YErOliEMoDh1c/gz1gQYz31QJ9g9RDVIyWZOmRmj1blOgegQNs/TQyiAaaqSCROnNOw/9xwtC7mLon4s3VZWdCeMe3XDle5n5325MsfhhaMW96eE919vDjfB2TO9f/2raL9PsWSkSK1ziKbazvTB+55Hm4Sp2QX/Vp5WlAJ2hwpnrm+4ZvHM1hyQN4TaY2G1cc2Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4rnB/Lh6fdQpYdjJxwi4vZ4CW28EcFbNEWJ5GIehRM=;
 b=YwZ1ldbaIyO4dcyzwECUCMFvt4JUCbFfIE4AJ+GCB2oLMsw2Dg0AFblo7Q47V0lvsM9Lwn+OeuRwWVht16mfPJSDi6gaoXptmKZHnyco99oI3k1dqYcdtzPlwgPkq+wYpA0I4d/nXOWaQbKHXir35BsxnZ4Vuzf1FRmVISNkrqY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=q4rnB/L
	h6fdQpYdjJxwi4vZ4CW28EcFbNEWJ5GIehRM=; b=WertbK/+A+wwVfajLnq2lqw
	Z8EcvTjntCNes/TUE9WrBs5rLjSY/0H4+5sbwg+zWlAKgKWzlHwqUpJ8+yP/Yvq7
	VuogD0EUR8+Yd6zil49S1JhKqSEV40zxLOYvxi1mQEaqUr6GZXs9aEHaCQzyOVc9
	yhPpJYDVMgxMoh0hcmwCtABd3u88upKx0SCabOCg19PAOGK7A0R/AxJBwEtvc7hT
	Cx9EX4nsrrxQ01rOz5fv6aG9oeUsKtYLOxpkAIy4KaUzVCvD+z85I+XJFZifYWfu
	PJiW4uojmim8GFBM5dvWoBTNrvyAMUh0s1Wtuopc8hJ+nT5l9SyAn6A4ppXoc1w=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=q4rnB/Lh6fdQpYdjJxwi4vZ4CW28EcF
	bNEWJ5GIehRM=; b=GOE3iSOv+IDvbAVMYvqS9XXnnMz2wBh7LHzhK7eu66gL3Lf
	/FHytc7n92VE1gGBsQrcRHVnF2DhTlmdFN8EZ1QyasZqJjxWRW8imaYWNXEgXnvN
	pmbYEK1XRjVrwAKQNH/qA9m1/Rj1KoMaw1LduemaAssgGwsVMLKhy3MRm9VfUL7g
	DpnQOerx1KWZBCjv9JGOX2MYvfsXRWxf2k/B2D0ywRgIU3xZHtKR95a0GjM6hv2L
	V7feJgyf910qwJegN33m+A/mo4/cY9pX1l7FE9QUwV2zPSyG9FeZ/Gv11dKIcCUj
	bhDJnFpOshNA7/RLvhuAzBhZiTOlLD5xwCESGaA==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: qjFpvl2H84XAgqjFqvcAPx
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 0/5] tools/tests: test harness fragment
Date: Thu, 12 Feb 2026 18:49:47 -0800
Message-ID: <20260213024952.3270112-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602130019
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|SA1PR16MB6414:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 92478691-7738-488c-c9f4-08de6aaa97b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MJ+v71UanCFsPKJyrWnaAAA3ylZ+Me6AHJboKWf61Y3Qi/ev2hVCbitpeA4J?=
 =?us-ascii?Q?bx8wnXQUFJMF8I7RWYu9P7zTucgMpgFkxs0BKYrvqnsy8eetqK/AGm4c3lyn?=
 =?us-ascii?Q?FseX40ZH6si/dn5aUh5NB4z1V0vGGQ9GVqp7fc3mXam5Fq7AxNkeRhP4JjYw?=
 =?us-ascii?Q?e9Z/8ZlQy3FtOirmSMV/Z6ZB1jWtUlzL9dDBuS/bh6mpz+Lj8OUN5ZpgogiW?=
 =?us-ascii?Q?cL8eFrUJuYp64VaBPGS7jBXTM0FKWwO1VvmwP5X2qm4Mi+n9ajkrXaVhLbzp?=
 =?us-ascii?Q?ulMJ1/DRh5LKGk9KmPUjiuv0e4So8m/p0WQ55s3zB1ZxeHGJw68HYcCfUVM6?=
 =?us-ascii?Q?qadcE6Y2zi7CIeuWcUQhXj4xN3pNT9/CU/k/kO2kBr6TyF5mvI6MirwiYKkw?=
 =?us-ascii?Q?KZ9onTpx9Qok6Ld96i18voz/+7CehyrBTH0Q4kQaOUytQB6n3letLyRdbOh0?=
 =?us-ascii?Q?dtHS7ZmwNBikdcmQR+xEyM0hawViZ19NYurJg4+l3CldUs9MWSgHgkG7/2BF?=
 =?us-ascii?Q?cPakG1PGOLRMAjAcB8drnmG9jj0QJ4sWV3TKgNnJG7juhMJU35JPFZ62Z6RS?=
 =?us-ascii?Q?kqhUgA3snNdcbcg5v4g3DPIHu2ZBrqm6i3H+Np80pCX8g7OnfHDgUBrV88vx?=
 =?us-ascii?Q?XFZE8mdJdsTQjWCmBQ9go1MxWfOi48CQSwdCwDQQfv9yB7cl7Ql/fyLDakc2?=
 =?us-ascii?Q?ziVgL+GAgoQNp1dmR1d0HVkKO+V5aNJYROygFINBueCjNw3TVFJLaRjQ4D1G?=
 =?us-ascii?Q?pnrBXlQUGURzwxYnfWa1msWcrbBzzvgJHfvS/gBwVhJTcvy84rbg0Bgk1NYo?=
 =?us-ascii?Q?ZDqdbMvaKaBZtiC5M7AWV7hkycAPTllWm6TAXA6PelGLrOBk2gbkgJqfFEv7?=
 =?us-ascii?Q?LAxPQeST1AZVsQ+fe0cgPX7hbVWLes6XlIKry38/aELO8LEUjejOjsGT/1w0?=
 =?us-ascii?Q?iXwBSy1SOccpiMP00RTTOwS0bnb9DOA1Dtv4rVrGEuQuUIeCqIX+IzCoVdix?=
 =?us-ascii?Q?VCUQhXwEXjqCpU5XR+bTZc3ZYMChgJnLgPybyBA95qhp9q2xM6M7qkg24s09?=
 =?us-ascii?Q?QoBRmSPTBY6vuBySP5b1e9B/y4/SlJcn5k19ScPH3MTGAP1fgvAbfro0rZEq?=
 =?us-ascii?Q?vk2pAremRpo2baKGG4SDe9D2/YcIJHFvrgHcACVz+ifATIXRv6e+Q9XS9vkq?=
 =?us-ascii?Q?dRciKkiG9n7CUt/HNfC2rtAhe6K70MkN8hkkXzqR72npaFgAKGx/pzWcKknI?=
 =?us-ascii?Q?q0whkMH1p1BnDReFbjVwHTpr6YVVz+B/A8kHSCM6CBJaKMAJg/JkpVG2qXf7?=
 =?us-ascii?Q?sgn721slbwaJnzAoG5xRev0xt+yUjs/7CgnU/2t/Et+cJTSuhcss4YWRUTCW?=
 =?us-ascii?Q?l4QdmysCNhHompud71TkhiHRmdyJlU6oom9RaDOh36lePz7TVj7i7kkB+H4d?=
 =?us-ascii?Q?9W2jI/YYdWr9Qk9A8OYxAR3R1vFOC2JpEc/qpfBscdfW2AiGMQGkvwfvyGwE?=
 =?us-ascii?Q?rDXg+eUSfVIQydCFZqPC+qYcppIhEiVIQOSo2uqijckYIkCzYSIAOtaPJVbB?=
 =?us-ascii?Q?B9Uywl0d7XIBt2Yeo1yxlffFQKJwcQMJ5V/kfmvad/sQITmiX7tg9jX3DT4g?=
 =?us-ascii?Q?W+qGANtZW/s6f7Boe30zW85krXA3OeK+MFgq73mjdqjpdG0347LcPocQKzQu?=
 =?us-ascii?Q?asz6LQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AAsNcTfM31WtRVnHuFJvuT3cnBm+CQiovfNf3lnj7H3DeIupT/REKiOP85Q1roES835FJcraG5q+OhYd9FjA64KEYFv9rTVvI58EJ7aPGXRtoMody+qd5jzqt23GMzHlm2TKfeRcyNG/NgHATF/dxB8hI5zbRhka26jM1jQ0Cy0cPYJtE4F/IMr8wWerWtzCkw9vkl4wUGYhOyoUc1VpG9oi9cVPLUTi0B+LnMNHZ0DQeowKXxL6OJbbX/nkqwtoR7W1sxCLra6HEUUP+wAABiYZ4T5TneR4iFJtuLxIEQIR/RHsI50J9crurAdjK6T0IY4ylOr0jcs0gDVyuKWCEVFZqFbjj51BBIGz1m1Dn30eCb+t1D3ZHllGUmrJ0WSzFsWtqRr8cX0TF1GQbglJ+Vnw1jP6oFQ/0cUoR14OoOfqdGHXnN+TrtlrkA27rHRI
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	trZoT7mFP1PmmvAb7AIpL/F/DmOYt3Q2knA5UVPwiPZ4zzi+Od/js4N5mEMV+fmch39t2sFGRvIsK2cwWQmI1foigOmzW0WDNm9GoHWFBZJuKGRpeyWYOPBUddnjPE848XL5HyXRA9TKwC1W7s04TMLi/xaBYv/eRshWLj6YZkkjYdn444dqzL12zO5Nnheta5uamm3L+JGRiReQrGsh1z3jsY8LS54THalgVxUoGL9ZYdhg/Qb5ioextE8h2PEgynegJRZifZaLwj5K0bBd6Ryvo05BKjAS9H/Tf19qBSmtilHGuPYOmGLoxGxwIsuZIqCJepSI9BILlGSEHUe8Cw57pJ3yIwsQSK5xqD1sgGZXY4Eabuf8VdTZ1yJKIhyiFtSMFCx05ms0/wO8Dvbra/lUlaGdmIbHJJcx0LZrinoy4SuxuFMUccqWqRN5MCJUzL/8c3Et2TFDdZbhPPK92+nlZSCYiQhc2dz4egFAsFfsqOiEv7Igk/ST+o5CrTw1ivWV++2CxKlN2ECrRMeAOnhMXjXliEK/FtxskX/LCN1PODnXtnZt7qQ/RdOA7835miSOefuUPJiMy71fqdznwCr4mqCQieT3zipOcsoBevkUscQsQtB+QXxv7nipsWNH5FFZm+SUEx0K2BUwTbsDug==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 02:50:05.2906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92478691-7738-488c-c9f4-08de6aaa97b4
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB6414
X-Proofpoint-ORIG-GUID: 482JeGzEuk-w_og2sQ9qnEHKUvt7qPAQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDAxOSBTYWx0ZWRfX5vLyUeCsCiaN
 oLuPvly3ShJkzWh6I0s0pkrH5iDYuXHDQNhclx+GEdMcGzDEHK0z71x8Nbuc6AcWu2UcFvftqkd
 LHAtpfAfk2SD8nMSrgKBBFB/09ZYAbDpjxYdSmhIeCWIHduPBepJ7XZ9YutX4h/xlDNdaMd3AkR
 uw9DUiGEv9G4MWhlxqcxNBy15pQvbO1pvlk+eyGA5fqvHN7ipI93TPg+hKMhpj3SMZbCYLrA3m9
 7KNdasksbHvLSzz3ZfdnmELZLJDgDJE7+LPXdaojODB566wpCghVyUvyziFT+xOGNTclppn4LJM
 kf9qK/GEKUeBK7ZpcXWmedRRe8/Q/5EGvKcNIfpWuP0zFBCAi/VRAvho1nTqIiyZcOLroky/6X8
 DHxnawzCNXihN8VE8+P+TMN1QfabDaX3q6JSK45x4f25DT2GxqjQ283GAPomyOpO76Gt/BtbMKl
 t/0FcpbvfrsIr3VrzgA==
X-Authority-Analysis: v=2.4 cv=WKJyn3sR c=1 sm=1 tr=0 ts=698e9162 cx=c_pps
 a=h3cS895ItAADrFIx/0pANw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=cbNQJ9GKAAAA:8 a=p0WdMEafAAAA:8 a=gLHN_htkFaCboXJYiHUA:9
 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-GUID: 482JeGzEuk-w_og2sQ9qnEHKUvt7qPAQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130019
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[azureford.onmicrosoft.com:dkim,gitlab.com:url]
X-Rspamd-Queue-Id: 8E5251327A8
X-Rspamd-Action: no action

This series introduces the use of a new common unit test fragment across
several existing unit tests.

Patch 1 contains assorted fixups for the domid Makefile.
Patch 2 adds a new fragment for auto-generating test harness dependencies.
Patch 3 adds some prerequisite changes for vPCI test (patch 4).
Patch 4 switches the vPCI unit test to the new common fragment.
Patch 5 switches the PDX unit test to the new common fragment.

[1] Link to v2: https://lore.kernel.org/xen-devel/20260111041145.553673-1-dmukhin@ford.com/
[2] CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2323352235

Denis Mukhin (5):
  tests: fixup domid make fragment
  tests: use unit test fragment in domid test
  xen/include: customize headers for host builds
  tests: use unit test fragment in vPCI test
  tests: use unit test fragment in PDX test

 tools/tests/Rules.mk        | 106 ++++++++++++++++++++++++++++++++++++
 tools/tests/domid/Makefile  |  68 ++---------------------
 tools/tests/pdx/.gitignore  |   2 +-
 tools/tests/pdx/Makefile    |  59 ++++++--------------
 tools/tests/pdx/harness.h   |   2 +-
 tools/tests/pdx/test-pdx.c  |   2 -
 tools/tests/vpci/.gitignore |   2 +
 tools/tests/vpci/Makefile   |  52 ++++++------------
 tools/tests/vpci/emul.h     |  50 ++++++-----------
 tools/tests/vpci/main.c     |   2 -
 xen/common/pdx.c            |   3 +-
 xen/include/xen/irq.h       |   2 +
 xen/include/xen/list.h      |   2 +
 xen/include/xen/numa.h      |   2 +
 xen/include/xen/pci.h       |   2 +
 xen/include/xen/pdx.h       |   2 +
 xen/include/xen/pfn.h       |   2 +
 xen/include/xen/spinlock.h  |   2 +
 xen/include/xen/types.h     |   4 ++
 19 files changed, 185 insertions(+), 181 deletions(-)
 create mode 100644 tools/tests/Rules.mk
 create mode 100644 tools/tests/vpci/.gitignore

-- 
2.52.0


