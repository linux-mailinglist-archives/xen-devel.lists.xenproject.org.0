Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27355B06CF5
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 07:08:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044795.1414852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubuMb-0003QS-PC; Wed, 16 Jul 2025 05:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044795.1414852; Wed, 16 Jul 2025 05:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubuMb-0003On-La; Wed, 16 Jul 2025 05:07:29 +0000
Received: by outflank-mailman (input) for mailman id 1044795;
 Wed, 16 Jul 2025 02:05:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7lMj=Z5=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1ubrWG-0007bs-DE
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 02:05:17 +0000
Received: from mx0b-00498f03.pphosted.com (mx0b-00498f03.pphosted.com
 [148.163.143.241]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4dc59790-61e9-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 04:05:12 +0200 (CEST)
Received: from pps.filterd (m0482515.ppops.net [127.0.0.1])
 by m0482515.ppops.net (8.18.1.2/8.18.1.2) with ESMTP id 56G1Qn7D020090
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 19:05:10 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
 by m0482515.ppops.net (PPS) with ESMTPS id 47wu16kf1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 19:05:10 -0700 (PDT)
Received: from SJ0PR05CA0145.namprd05.prod.outlook.com (2603:10b6:a03:33d::30)
 by SJ2PR16MB5596.namprd16.prod.outlook.com (2603:10b6:a03:582::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.27; Wed, 16 Jul
 2025 02:05:06 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:a03:33d:cafe::b2) by SJ0PR05CA0145.outlook.office365.com
 (2603:10b6:a03:33d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Wed,
 16 Jul 2025 02:05:06 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Wed, 16 Jul 2025 02:05:05 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G0BHLx029076
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 22:05:05 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 47v6sttx7y-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 22:05:05 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id brW2u5ChBz46vbrW3ulL4X; Wed, 16 Jul 2025 02:05:04 +0000
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
X-Inumbo-ID: 4dc59790-61e9-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=SwYwDlZAis4/DYA6uqfQCXcuR
	uuaGKhPXCsT5cZr3qs=; b=lr+DIvqwfYo0bacYzShue+QtIy3Z549YawP9AM12u
	IkJzBJkup/XNxtIUk1kztuLOopzpZm9L9J1j4bZXYCbWhNUqyNDEa51PwUiEni4D
	mRtEgaadeslMw2J7KYgnqqlwa64v2sslYxp9a5vZoYue3iohqvJOc5PR8sBI5a+h
	nEx6Jr2UktInqU+Q+TsFuMAudY2w1o44erahL7X3V0Nsikbzkvad0B6an2AVQhgg
	zJbYombKZ29CR3tELgUJGGZ2Xbc7cKNU/kqtt2JqtzekSTqT3HwzxO6WXyBNXW9v
	xW3wqCmXPWdptFq/4HuFlduusIWqMCdrNRILYgg3o3Bzw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=so8Bc7LXhNxQ5obFzVFmk4Dfvr/qhB1/R+CAuz6mWM/Lq9dXQq9VylM3x1/RSuFrkJIYYSjl48plXMueIL2y/FFiTS/uIYXdxBmzmXgp3xujhOIBbxEUKhlLH8NPpZ81h6g+XWbcmyWwziL51nGiQceJdfXl3+YLjHtQ+jXex/kxbQivP+BYk51uUdLs6x6myQdWomdrxresoM2YjDWt4P25sPSHR7gSddkRicAy2KDw1C9b+5N1AuR2eiCToJyfNdJZzo8OzUJLE/IrQlZr2VuSwUYmJlZaMo3vgefFbr2qO4/FZSTIlhv7Y7u0LT6vMHLEPbzZKUeT3c7i1xU1Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SwYwDlZAis4/DYA6uqfQCXcuRuuaGKhPXCsT5cZr3qs=;
 b=AP6q2GB1B9eBAWEyeo3W6/Kaq4+6L6CIk8SW0VjK3W0vM5xVFbaGYY5AabsgAm9SUhTNMW7pKTIq8n898f3GPeu3tSen0wD8JLKGDjDbYeUSRX9ik/MC04JA4UYuRCxzRN0uNXBYcYqKahAXb60+PvpqgOA2tbbQMV8ou522qU44+jdccEE3qhNi8la4KikItcQPaMzcWFxbjNow6jnN/qmN9PDJiJYJ6UP4/EkVup7S/ZURjJQ8+CCP28jjXNizLMojlZPEYFsDNa6n4rlTFAZSDDYiPUH2vgkJbUILmdrjhjf2dJ6+YI2LluYeEIS4tSP6FXCKsuiOfQBosbjkeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SwYwDlZAis4/DYA6uqfQCXcuRuuaGKhPXCsT5cZr3qs=;
 b=Fn7isOf5I0OJydKf/tQ9pWKGFDHhAM6O/nI6tDJ4na6xmfFrYGsSYuqzBssjUNc0Ggn+WlGCKmmL6O90NqOBBYYFhGgJnC54LslHkb43grsAdwKh6xrc6XsrMeKYO16ILXEnzpw6NDiQaQITJVJQyOfzQR2f77NY8EbtSU4kQ38=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=SwYwDlZ
	Ais4/DYA6uqfQCXcuRuuaGKhPXCsT5cZr3qs=; b=lXOgAJHm2bsYHbskHirhgPm
	bZYla5c2ui8wOcytWd5mANGCvCbGAme5GQsIHQKzeavPujLzfZtvsA4OF9GmYPVQ
	Z3TCnG/kgnY26SwA1IATa5NvJVOXX5UIhPC465dEssKRYg0rMUtl2PNi9YCI3bbC
	qBmU7UY4pBjTtuBmqEVEZqHXOAWyIHm/V5ykpBlosuWfbNmBeyT9p0Tp6h24rubZ
	1oLDMFh/A77bAJimcHbpJzIVQxEKBq6yjbcgaifoE7AEU6X1nyy/n1aALOwq+Zmg
	4XYzAugAYW0k2qauXCgQQwwbWjGeS2BGrHcvb8BFWEKnyN/cw7r57hwLje4u14A=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=SwYwDlZAis4/DYA6uqfQCXcuRuuaGKh
	PXCsT5cZr3qs=; b=E936yoEZ3mxAyYKvhQPYPVPhEfPfLYyS2EX64kweQTFiSOv
	y1eUhIKl5hLVHm5Bg+6+LFThHlFT0yAyhMVKgkCqn96AHb6QlFHGZtLkXxPvnu2D
	507EGLZkdIafOmT3nYnUAVzlc7YPHJqhr7XScNHXpH9QzVoPcTFN5c1mPx3DBi/U
	XWUCdyAT8IsLyPQoZgzMmUjgXZYGp0ychn85ctXCtQIhl2s2XOk/4hoW8kKU/ypU
	32W26XkIuYGWvJoBX6ufytLm2zkpf2iOfzFxX0FF7snjO0S7j9U+PrY+MOSWFwlG
	RCDRSjf/SSi1WtCpy7eC1gJxf+Cua63qQY0uUvw==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: brW2u5ChBz46vbrW3ulL4X
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v8] xen/console: introduce domain_console struct
Date: Tue, 15 Jul 2025 19:04:48 -0700
Message-Id: <20250716020447.1029992-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 adultscore=0 mlxlogscore=935 spamscore=0 phishscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160017
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|SJ2PR16MB5596:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3aeaaa0d-e7bd-4c30-7407-08ddc40d2edb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sZNSifaYVmb/DdN2cxoCkFK6fCEDcLxQ45nXSE0UHzf3bBo2xvCdW6XgRX3O?=
 =?us-ascii?Q?3wG4zzMHXuX2X0BIUJ25q2i8FUZEFrd+3MTGLK/dkzppQHHcdR5Pp5LcKBvL?=
 =?us-ascii?Q?+Z09EBEJLid27IrCqOVnbRxkh1q51WDcOPGtO79ANlPlTlUlRPqYnYB63bTb?=
 =?us-ascii?Q?hTTfTnqV8wSwgX5uy2VRwvwPhb27I60kqn32h3Xx4MGEY+r6RPaRAxJ0gxhW?=
 =?us-ascii?Q?13ABwbiZNpImQbPrR4cS1PDXmEevz+CsUZrArz1Yxz4pbhfMnDQK82veXza2?=
 =?us-ascii?Q?Al/itKsks+BUDGyAAQAdOSisq1ZNQVbJ8kBNCTkko4WYHrQEoEktm09L51gV?=
 =?us-ascii?Q?4RKclQVrzxswTkf1NvmZwqhO8Z1hHsAo56c6TxAZ7ABo6HAL/Uh18iRZw9ds?=
 =?us-ascii?Q?6srHR5CRWV/z/5feGCLDOxtfNl6lUI0NZHbuqjiERKEXjqPOEAKhZs0J/uqN?=
 =?us-ascii?Q?6Q2Oct2r/iWhZLTHgXIJ6wHWFDGmH43KcCfXEiYmuCTLWjDrc+e0FHQF6MQL?=
 =?us-ascii?Q?txvUyAHFXVSHK5Zc++bTAGJA1iWjIq1EManNnv/suQpjqttV7pYNtZHvtGO3?=
 =?us-ascii?Q?E2KivofwO6KQMrE68a7MSMFRHJ+4o3zcTB8YjwWumVXMdLiZOSXbmpr+kjrb?=
 =?us-ascii?Q?sCQSCgUkMWuDyXV6duK9kOEeEcJVd1FfI3ESTcSqnHSfvWLNdSJrRG2QSgWg?=
 =?us-ascii?Q?DoODMJhBBVPp1rOLGPgxO7hXq1HoEV0dT+dAZ05I7OMDYroTLLu0EAhbK9jx?=
 =?us-ascii?Q?xDlIhwKD8AWWTq7vQB5LJrolgk5pegsAwe5Pvh0ycsBRznLNDqV4M4xFwXGz?=
 =?us-ascii?Q?k/C6aNiJuLMU4Vp4g8KxbXCicn9JUkiWtxB9371oFHs0qWvaVGAyklujaYoN?=
 =?us-ascii?Q?2bSWIrQI+07kNLHg4/S3b6DN8QUAsAcnZfWeMzv/Zl/bmBeHEVoVo9h/M1ve?=
 =?us-ascii?Q?nncOk93O6eqtRZwC9tzf8mIamoHo4mALDvopEi6wDQO0OXTy/BapR4+xznw3?=
 =?us-ascii?Q?CWggc86SI0aKwU/fmbRK7OOzGEwFE8nEZZpl0PZeyTl5cXR+oxVZM9ClU64Y?=
 =?us-ascii?Q?M91C2VWrW54L+GLmRd8ZvN7lU+TyzHPeANSe5ysuxvGeJbBbFzombhdqmKDZ?=
 =?us-ascii?Q?gKORZl5rLKydPtAyIPCv8tndG402KyRD+EJdeKhAYCEgOeCaDRR0Qkx5imE0?=
 =?us-ascii?Q?RXoVu0FH5qfSXpv0+PqhzdJCJsgk4LensP7hDUkEU9LtmV2hTMeMkrS2Mj01?=
 =?us-ascii?Q?UWjpEEJpnoZLyDN67qHzms4vXGj8Fw3kUuZjOxur8ylvvgyVEDHTNZ967nYW?=
 =?us-ascii?Q?pYFfjphBU99id4e87SUvtmWZxh+2TvbF+V2z3K0Le8R+7X0owSzMlGOsSpoJ?=
 =?us-ascii?Q?MffmCGQ5D7cDS2b3ynseD34jEfV55ExZRjaLOCuuq2XdG140+01SNKluwrQD?=
 =?us-ascii?Q?K56Or0vaViHhH7f/D0doNNCvTgScqRTQeqeYHRrg/X2PSg/Da6T3cxsRsDpn?=
 =?us-ascii?Q?h6MKwDIc3h+aEPWGuv12Q/vmrotlSZS9Z+in?=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SoqmHtIYT9S8QoZgP6YoVNAw0Ho0wWKQsPKGT0x/Zm9gGbV3SGhfGPFQM8Nr20M/brKANhVBtVTzTjleiDSLsrBHdLwXZLzuYUNfmx8PlbEvYJeBfTbOlIoHhEp5BabBMpp6I7t849oAvCAKlbiK6BQI/F70mn+urCqKNfiyjBO1A4krdFIW8LH/34+CMJ92Wr+rjOa0yZyLyENzQpz7rW1DuBJaKIjNwqCy21VywT4KqdcdgMspEoPp6/daisfO9SfDjtKrrj45s4XVsKgPy/jwXb8389Tg+sgECvOB2lg7HSwph1TlqnPG9fa7MmoUeyN+YtCE+E/9I1Tr2auSpg/1L+GxgOPl9jel6Cr61AdHm9ttZk7EAWB42CRT7nl3FNcgMt7SQVbdECO3WziSKyiRXZkEdGBp2okuDTrff0Ybs3Q/o60sHsAWE4gu9EyW6h0BurovHd61qNtvqVM3wXfQfBTcxTnyp6P29Yr+HXZxV947CB3cAq2xO3X+BCMzWrF3yug+q3mGmEhq/zRsDMUb5YeUP5IBT4wv4cc7HcZlNAVFQLDSWHgrLpqB2ZUN04Q31/8lNZwA7gSzMaJen2qX3EUHRZ+O3LA3k8g4BxajyqcQc0DkG6ew3xQ1d8V61uauq73VP//ij7WN2feC7A==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 02:05:05.5751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aeaaa0d-e7bd-4c30-7407-08ddc40d2edb
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR16MB5596
X-Authority-Analysis: v=2.4 cv=QZ5mvtbv c=1 sm=1 tr=0 ts=687708d6 cx=c_pps a=W6EPrjjQM45bXwhc9OBL1g==:117 a=lOEMawUel/sSvQipkIvNbg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=cbNQJ9GKAAAA:8 a=tL8OQOgzSnv7ZJV7wKAA:9 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-GUID: 8YJI7jZOi0f2EF5v9WuspKV6e34AI93L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDAxNiBTYWx0ZWRfX4bpyFhZVNIGi tHgqkViyj6C02e+33RQiXpWqZbqimBhZ+uPYkUVBVX5AZBmi3c40lY61xuDoF4xqXvTmWKGaCQ1 6Iy0DQp56KblCKcdm9rCVPqT2XutM8AivufHDzDTLWaLeily8udC9xIxRwnDyEZKGTm0nt5/BMI
 puKPptC8F/HYoj276UZ1hwydLz4dqympekmjiPNBJFM1g7+B0c6yDsRJFj/bk2eD0msAC8hg/Wh gelSglIh2hmneT59cXd2ojc19hIGEnNpBz+Bjt1iG3IhZ7HTBsTphPESwoVGww6eng6v7cMHnlZ Hn8tADSUEQMVOr6gHsUISAPRUI7ZmAwispmsc+/tcAtSOXxNwbBdBYjftfTnMFA9MZRg+IX4r/g
 hPCX2yAycDQkOh2AZwhSnT+6L8VgaAh4bnOBwFqYcy/yscZxnvj/OJjE43ZCG27oLVwEllAo
X-Proofpoint-ORIG-GUID: 8YJI7jZOi0f2EF5v9WuspKV6e34AI93L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160016

From: Denis Mukhin <dmukhin@ford.com> 

Introduce domain_console for grouping data structures used for integrating
domain's diagnostic console with Xen's console driver.

Group all pbuf-related data structures under domain_console. Rename the moved
fields to plain .buf, .idx and .lock names, since all uses of the fields are
touched.

Bump the domain console buffer allocation size to 256. No extra symbol for the
value since it is used only once during data structure declaration. All size
checks use ARRAY_SIZE().

Allocate domain_console from the heap so that the parent domain struct size
stays below PAGE_SIZE boundary to account for more console-related fields
added in the future.

Finally, update the domain_console allocation and initialization code.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v7:
- use ARRAY_SIZE() for cons->buf checks
- update the commit message
---
 xen/arch/arm/vpl011.c      |  2 +-
 xen/arch/x86/hvm/hvm.c     | 18 ++++++++++--------
 xen/arch/x86/pv/shim.c     |  2 +-
 xen/common/domain.c        | 19 +++++++++----------
 xen/drivers/char/console.c | 21 +++++++++++----------
 xen/include/xen/sched.h    | 22 ++++++++++++----------
 6 files changed, 44 insertions(+), 40 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 480fc664fc62..d0d17c76b72c 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -713,7 +713,7 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
     }
     else
     {
-        d->console.input_allowed = true;
+        d->console->input_allowed = true;
         vpl011->backend_in_domain = false;
 
         vpl011->backend.xen = xzalloc(struct vpl011_xen_backend);
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 56c7de39778b..684d2c0c195c 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -559,7 +559,8 @@ void hvm_do_resume(struct vcpu *v)
 static int cf_check hvm_print_line(
     int dir, unsigned int port, unsigned int bytes, uint32_t *val)
 {
-    struct domain *cd = current->domain;
+    const struct domain *d = current->domain;
+    struct domain_console *cons = d->console;
     char c = *val;
 
     ASSERT(bytes == 1 && port == XEN_HVM_DEBUGCONS_IOPORT);
@@ -571,16 +572,17 @@ static int cf_check hvm_print_line(
     if ( !is_console_printable(c) )
         return X86EMUL_OKAY;
 
-    spin_lock(&cd->pbuf_lock);
+    spin_lock(&cons->lock);
+    ASSERT(cons->idx < ARRAY_SIZE(cons->buf));
     if ( c != '\n' )
-        cd->pbuf[cd->pbuf_idx++] = c;
-    if ( (cd->pbuf_idx == (DOMAIN_PBUF_SIZE - 1)) || (c == '\n') )
+        cons->buf[cons->idx++] = c;
+    if ( (cons->idx == (ARRAY_SIZE(cons->buf) - 1)) || (c == '\n') )
     {
-        cd->pbuf[cd->pbuf_idx] = '\0';
-        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->pbuf);
-        cd->pbuf_idx = 0;
+        cons->buf[cons->idx] = '\0';
+        guest_printk(d, XENLOG_G_DEBUG "%s\n", cons->buf);
+        cons->idx = 0;
     }
-    spin_unlock(&cd->pbuf_lock);
+    spin_unlock(&cons->lock);
 
     return X86EMUL_OKAY;
 }
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index bc2a7dd5fae5..bd29c53a2d34 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -239,7 +239,7 @@ void __init pv_shim_setup_dom(struct domain *d, l4_pgentry_t *l4start,
      */
     d->max_pages = domain_tot_pages(d);
 
-    d->console.input_allowed = true;
+    d->console->input_allowed = true;
 }
 
 static void write_start_info(struct domain *d)
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 303c338ef293..caef4cc8d649 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -669,7 +669,7 @@ static void _domain_destroy(struct domain *d)
     BUG_ON(!d->is_dying);
     BUG_ON(atomic_read(&d->refcnt) != DOMAIN_DESTROYED);
 
-    xfree(d->pbuf);
+    xvfree(d->console);
 
     argo_destroy(d);
 
@@ -835,8 +835,6 @@ struct domain *domain_create(domid_t domid,
         flags |= CDF_hardware;
         if ( old_hwdom )
             old_hwdom->cdf &= ~CDF_hardware;
-
-        d->console.input_allowed = true;
     }
 
     /* Holding CDF_* internal flags. */
@@ -866,8 +864,6 @@ struct domain *domain_create(domid_t domid,
     spin_lock_init(&d->shutdown_lock);
     d->shutdown_code = SHUTDOWN_CODE_INVALID;
 
-    spin_lock_init(&d->pbuf_lock);
-
     rwlock_init(&d->vnuma_rwlock);
 
 #ifdef CONFIG_HAS_PCI
@@ -877,6 +873,14 @@ struct domain *domain_create(domid_t domid,
 
     /* All error paths can depend on the above setup. */
 
+    err = -ENOMEM;
+    d->console = xvzalloc(typeof(*d->console));
+    if ( !d->console )
+        goto fail;
+
+    spin_lock_init(&d->console->lock);
+    d->console->input_allowed = is_hardware_domain(d);
+
     /*
      * Allocate d->vcpu[] and set ->max_vcpus up early.  Various per-domain
      * resources want to be sized based on max_vcpus.
@@ -959,11 +963,6 @@ struct domain *domain_create(domid_t domid,
     if ( (err = argo_init(d)) != 0 )
         goto fail;
 
-    err = -ENOMEM;
-    d->pbuf = xzalloc_array(char, DOMAIN_PBUF_SIZE);
-    if ( !d->pbuf )
-        goto fail;
-
     if ( (err = sched_init_domain(d, config->cpupool_id)) != 0 )
         goto fail;
 
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index ba5a809a99fb..b0d50a910e27 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -521,7 +521,7 @@ struct domain *console_get_domain(void)
     if ( !d )
         return NULL;
 
-    if ( d->console.input_allowed )
+    if ( d->console->input_allowed )
         return d;
 
     rcu_unlock_domain(d);
@@ -564,7 +564,7 @@ static void console_switch_input(void)
         {
             rcu_unlock_domain(d);
 
-            if ( !d->console.input_allowed )
+            if ( !d->console->input_allowed )
                 continue;
 
             console_rx = next_rx;
@@ -744,6 +744,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
         else
         {
             char *kin = kbuf, *kout = kbuf, c;
+            struct domain_console *cons = cd->console;
 
             /* Strip non-printable characters */
             do
@@ -756,22 +757,22 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
             } while ( --kcount > 0 );
 
             *kout = '\0';
-            spin_lock(&cd->pbuf_lock);
+            spin_lock(&cons->lock);
             kcount = kin - kbuf;
             if ( c != '\n' &&
-                 (cd->pbuf_idx + (kout - kbuf) < (DOMAIN_PBUF_SIZE - 1)) )
+                 (cons->idx + (kout - kbuf) < (ARRAY_SIZE(cons->buf) - 1)) )
             {
                 /* buffer the output until a newline */
-                memcpy(cd->pbuf + cd->pbuf_idx, kbuf, kout - kbuf);
-                cd->pbuf_idx += (kout - kbuf);
+                memcpy(cons->buf + cons->idx, kbuf, kout - kbuf);
+                cons->idx += kout - kbuf;
             }
             else
             {
-                cd->pbuf[cd->pbuf_idx] = '\0';
-                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cd->pbuf, kbuf);
-                cd->pbuf_idx = 0;
+                cons->buf[cons->idx] = '\0';
+                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cons->buf, kbuf);
+                cons->idx = 0;
             }
-            spin_unlock(&cd->pbuf_lock);
+            spin_unlock(&cons->lock);
         }
 
         guest_handle_add_offset(buffer, kcount);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index fe53d4fab7ba..f7bb44328bbc 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -371,6 +371,17 @@ struct evtchn_port_ops;
 
 #define MAX_NR_IOREQ_SERVERS 8
 
+/* Domain console settings. */
+struct domain_console {
+    /* Permission to take ownership of the physical console input. */
+    bool input_allowed;
+
+    /* hvm_print_line() and guest_console_write() logging. */
+    unsigned int idx;
+    spinlock_t lock;
+    char buf[256];
+};
+
 struct domain
 {
     domid_t          domain_id;
@@ -562,12 +573,6 @@ struct domain
     /* Control-plane tools handle for this domain. */
     xen_domain_handle_t handle;
 
-    /* hvm_print_line() and guest_console_write() logging. */
-#define DOMAIN_PBUF_SIZE 200
-    char       *pbuf;
-    unsigned int pbuf_idx;
-    spinlock_t  pbuf_lock;
-
     /* OProfile support. */
     struct xenoprof *xenoprof;
 
@@ -653,10 +658,7 @@ struct domain
 #endif
 
     /* Console settings. */
-    struct {
-        /* Permission to take ownership of the physical console input. */
-        bool input_allowed;
-    } console;
+    struct domain_console *console;
 } __aligned(PAGE_SIZE);
 
 static inline struct page_list_head *page_to_list(
-- 
2.34.1


