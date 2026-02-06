Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aodZHzJOhmk2LwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 21:25:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0E1103166
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 21:25:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223851.1531228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voSNl-0008HZ-Gv; Fri, 06 Feb 2026 20:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223851.1531228; Fri, 06 Feb 2026 20:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voSNl-00088E-C4; Fri, 06 Feb 2026 20:24:49 +0000
Received: by outflank-mailman (input) for mailman id 1223851;
 Fri, 06 Feb 2026 20:24:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FjYH=AK=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1voSNj-0007sX-HV
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 20:24:47 +0000
Received: from mx0b-00498f03.pphosted.com (mx0b-00498f03.pphosted.com
 [148.163.143.241]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e023a3b3-0399-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 21:24:45 +0100 (CET)
Received: from pps.filterd (m0384717.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 616IOH81018955
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 20:24:44 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010003.outbound.protection.outlook.com [52.101.61.3])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4c5n0ch9mj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 20:24:44 +0000 (GMT)
Received: from BL1PR13CA0218.namprd13.prod.outlook.com (2603:10b6:208:2bf::13)
 by DS4PR16MB6948.namprd16.prod.outlook.com (2603:10b6:8:319::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 20:24:42 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:208:2bf:cafe::7a) by BL1PR13CA0218.outlook.office365.com
 (2603:10b6:208:2bf::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 20:24:36 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.0
 via Frontend Transport; Fri, 6 Feb 2026 20:24:41 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 616I3C0J1842071
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 15:24:41 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4c218c6fa4-7
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 15:24:40 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id oSNavSQoORfmuoSNbvypEN; Fri, 06 Feb 2026 20:24:40 +0000
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
X-Inumbo-ID: e023a3b3-0399-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=ua9
	UEn7fZ+IMjj0dFXJV6pVmJk5FwzdwF5Yb/oZBC3U=; b=dPysj1FBkVVkOo1seRS
	JKPXrp9sbuEG1Fh93N09/D7G97fGxxrdOOHEylK5lKuSTbFDpfQQDcG0gShCgrHH
	ktIKUl0l7LtelbieR75/tEWIFDYVVoYrqCqWiCYuPe0qWq6DKQxLsEO7sKpOHTSS
	Hwc0v/nQWIvQCBCpo/f5wsLmf3jvroXfNv27WauWHJ9iZq+UgNzB0826wdOK3J4m
	Yqym1TWqXZB+WF0/VUov9ighXxit34T9M8Yu27/4NMFkFVqVGnjdyb8QUwUbq0Xw
	fKlDQHNYXmnjS+oYdBnun9GSgMnlHdlinbV3tbbef/uNi6Mlm9YZuk8VMuPYD7rk
	lLQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0Y+EuevjmOHL4FxYqqxsKvJYw6OnHVBNpdnfxN4x0TWjPdGuMAOJ29Q04iVwYJuh0QqP4PouWY84fuP25yFomiocEYBCuOTc3H4LnJfFNuDW9CqS+01piOofksU6v+IGLhf7ZNUu7LqzjFvW5JpCbXeBlJK1xDjVP2J5J3XLsHfdR5poDBkvONYrliO5AjkCZFPHUIlqIFrWGPWSefq+8OhzN3Ta91GGSedfBlXwfud061MjHU428+Tf1ONShvdEzv5hlJaTezfY1f4SdFZkooiCTUQfiNBbTrlitKo5ZDiFZeUI+ZMRToY/MlArMPWecvUauKogR1M3yfCn0V1Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ua9UEn7fZ+IMjj0dFXJV6pVmJk5FwzdwF5Yb/oZBC3U=;
 b=w7at9vRpzdJImxf1xXCuVDdnao26A0Tdyij7pyUTPgoFczZDs9HcxO7YjK5MHWHioil+Sev+Sn+lvbxHdv9cV7/vI7qQD5gGOI5kwfswiWb2Z6suuoDF4acUsbZwW5FUU0CrouD8+e7taLMlB5Y2yaSc3EwzUXoAMB1yfgJzK9SQBTQnJGtEzzmitLGal36oneIg45euRDVbe7x4kkhLN01Yjpspp3HFkTO2ZrVjvlM2XfpIKFMjUhYWmZrfOeH4gZP2FmhRHgjxdxvAkOuPexuidCq62lxEBSo34h1lveJCx2JaCIG2ZgEKEDTPQ4VImWxBMEMzW7974z5RbJLrfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ua9UEn7fZ+IMjj0dFXJV6pVmJk5FwzdwF5Yb/oZBC3U=;
 b=cLZ7DJARFSeck1FUWwiM/+qVcCO16VYmMZ4+EZcLPpUc0X7P2fXT18GUuoQHTfzYm6bgGMc4wUGHFVrpBOmhAfbL+Qlbe8uD0+rF+CodAd+fWuQhmbkK7ByY4AXFTFifQ0PSL6HoCdcDpSZs4WJz7MlvdOBoKn/I75V6TdmG5Bk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=ua9UEn7fZ+IMjj0dFXJV6pVmJk5FwzdwF5Yb/oZBC3U=; b=
	PI60bNxvIe5609nKJ5/DO+XwgLX2Dc6YIHXLnxzPdUPRIZLa/9GqEfjXlETTMpo2
	EJBZi4nXj56JEfnkGCqFO7fUM9Q6K6EaT+E/3uwl4UJl9Ml9q511I58SVJc220az
	xnmEPfYhh0AxGBMVrCbwxt7Xv6VnIKvIFv+ix3prYrFnaRcwinGrqtNMGmSu6hIL
	/10CbiD1hCYERmNqgrVon+WLTS4TgjXHzDXNkt6ck72fwLu1HZbR8g2Ps9wNp+t0
	RQgLNMsyOFzEoJMt419ZiiN4RKmI/kHYn+cW9uxXymQ6r6KjXLkXq5hgr25Grb0z
	vlCJlJvKmWInnLW4TAzpzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=ua9UEn7
	fZ+IMjj0dFXJV6pVmJk5FwzdwF5Yb/oZBC3U=; b=P/jNC0aLOAI1kMtBm/ny2Pp
	Ea0PuBoQKzGMJ0rNcQx9baRD92AWZgE6ijtxds1llfXaxpCFJe0HMoVpLRgnbdJa
	ylDwian/mFxUGW3qTLieXy5Lrcqfk41A4+1DDM1bN5a/SMy6GfrwZ/W9LP/qtZBg
	Bu6PUdzt/1pQZcs/1785REjCY1nbBOhIk9fdO6DNUvGwXwHrRZQ+NEI/a1aARvdy
	uTFy1uneA+pbKGjAKfIS1rH9mc0ZHLczAWCte3alto+04owz1NG6jJ+I8+vhGC9Q
	qkCgAUyWG4zwFiBSJINYo6UkfRnNU4ciXjzKNTsr8a/yUivAVKNoQqdQrrk5MPQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: oSNavSQoORfmuoSNbvypEN
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 5/7] xen/console: correct leaky-bucket rate limiter
Date: Fri,  6 Feb 2026 12:24:22 -0800
Message-ID: <20260206202424.2054758-6-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206202424.2054758-1-dmukhin@ford.com>
References: <20260206202424.2054758-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060151
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|DS4PR16MB6948:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 25a032e5-8ffe-4e99-f0e7-08de65bdc24a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nci5GDRaeidAXcWjLpdQrD/Yf8M+t2XtKM+JljGOC3oOkaMQ9thB43bhIjTM?=
 =?us-ascii?Q?VIoU4bSiHKQF3KSGsTXrFJnMv+s76VD6VaJbqPbFxXA8Cn418mBTND+xbRtI?=
 =?us-ascii?Q?yXpIRomtkqlZu+K629jSyk7l+Dnq3c3dv8dHI388XxMXDJWdV0phwaxTKjgi?=
 =?us-ascii?Q?vQ7qZsOlOmvuTdIidgc1qWcO6JfToWCASLN9eOAj9dGl/ofd456yWTvE6Ioo?=
 =?us-ascii?Q?PMMx9h58xhPv3FYQ+vCTBuPmCXrbXkNrSmqi6z9w8h46TaiNeUQhu8x+i4u/?=
 =?us-ascii?Q?CvlW5VKjulbzWEOt7jQ4UN5qm7sXComE/sVhzKmv+zN6lThj2YtFKgYwLOc1?=
 =?us-ascii?Q?FGZIp649WUY7PtN5km8Ff6wOZ7/T8Li9avIW9yQUVILZOXZWc7gx/4oDDr4A?=
 =?us-ascii?Q?5KEE7qHU4qfa3/yB7m4qbS98EsnZaem4kV3ESUSAHCfamSFXfuilY3DwDnU+?=
 =?us-ascii?Q?WLoeEc/3WeMqCig0/wVLPpXbRJiz8Xz+GOvCwpogO7VuEGOgfnK9mBtNr5TD?=
 =?us-ascii?Q?dmdk7R0A3gx26bUNKjuOb7kLqZu3fXLD9XgkBo4nk8KtlrAD97R40CL3zEDE?=
 =?us-ascii?Q?J4GYvsqgvMQkF0kT3Q4o/Zty9qDDiNfE6nV36+WGoNETV9auTJnVwZvgIC2y?=
 =?us-ascii?Q?hKErG4ZkZQR2KZbzqjXqK63cR8kyIxeidZJfWq6HX3sIyZ1D7beHJbc3vSxJ?=
 =?us-ascii?Q?ZeYSXYFWlkHSYHwAvBw4lBW/zaPCdg9KK7iBWCrmk1xVO0osCk/qswzn0Sia?=
 =?us-ascii?Q?ire2/7BttTf88A0NGK40wLF5aFymZjnXZpC/tAkoVZOkvpgcWYlWvY/8wSJX?=
 =?us-ascii?Q?hnripPYNicJDIDflQFWoj377J1cKr+SDt05lqYZExyliusht7wH/TJAkCK/I?=
 =?us-ascii?Q?JPAmSx6aqPAhIs8Tt+V+3niFhdWUnQ7YcUKvixh4j/Z3VNr7VeNTGfAiULM4?=
 =?us-ascii?Q?qBZ0Fa3vbw/oKaj0EuFfXr2YCW+5J5kNh0bVRD6ERidSXeBs952sMy83RSOs?=
 =?us-ascii?Q?DhVRl6EU57eCNyMPuVyHgVnc55+KMH2AwCBl4HN5udvqqhnDEFDwD94cinTR?=
 =?us-ascii?Q?PNOSJ2i3VzIDrl2YFy5ulmhjffRr0uRUGhuyr4BQWVpqeKDSkrpoTQpMfLEI?=
 =?us-ascii?Q?4SusYmtbUQ5FCQaz5y3jwlnaVoM5qOtwZTI+m+c73v26XlRXIQsSaBAK0F99?=
 =?us-ascii?Q?1jrwmzc3JOzBm8Y1cssltkXvqcp5YCM2V+T7lfRYaCZNHlTWrp6huvs76EHm?=
 =?us-ascii?Q?dbSy/CYk/9kilqzk2IVtiUsdCj/9rfA5Y0NGfqLqtAn5c7qzup1oDB9gLPNS?=
 =?us-ascii?Q?aoAmTnNmamdOYH2hhvgHOAiQSCswukOmN4ry6PkmW8CAxrsrPN8ZuvnlDfRh?=
 =?us-ascii?Q?Z8TaOuAYOjRdIEyW8K/74Q424wikLi0l1T956flkhkdSORGhN1vCMSmA5425?=
 =?us-ascii?Q?3CFMCDf/8WwfPxQloxwb1pZEMcw1reGt8UgdHRGYa5ttcxO69OfV4pHuwjkM?=
 =?us-ascii?Q?iM4TLut9X1W/XddtUqioNBDY+R9pH8Jji1KJe2pEanekLUZlDaXG8hI5OanQ?=
 =?us-ascii?Q?DARZYhmlnJNxeBFJiI2AmBVGqYHgyWTHVViEb/v+GnRCk/S4iTDYCEt4jxW9?=
 =?us-ascii?Q?PzdGNhKxJ0UR1ncpn7Ktz+0=3D?=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LMofdFfo/TaDeLeIxnEqErjVeFDjUg7a/6nHtKkSjoSry88Lp6ZbNfnzTy74Pod/s6bCGs7xupmQQWVG7gnPhS3IQJPjoGJ9J2zI+9eCK76jCOO2DwehtT+VDW2xiJQZPQ7vaL6UcpcGKQE3DTyuaNEw9MFmHuhYfL5/oFSpNH/4JY5o3Nf3de2evYrDzYR1xftM96bq5x0tZ4Rt4aygE3nKOVO2UlVoPBd1YD2Mkh6ZpqOqUDFk7PPAJk9O/RLsjjAoEJu/jZskFeOTBzCj93EDvl2K1ogoEiOEeEN1jWhRD/+FuVPb2tkUaCRG+HbdYZPx+jsAjdjtcykuuc1o+w+ZF+jVk0ggQDnXWDFFRtVqCSTclhEc1ZH9mG3kGvLNcgGpbpUsz1nDcdgnXMNdMB6XYQtk+0cWeLxU4l7mQ4oonfb07YxZkJmr41qeuuRa
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MUS3pNiNDNVOTGoH9wITLYYO4BZAq3FZ+/2W2eH+GBiB6vfspQ+l68P9vOhBsJOlrhYkzZ57CA5DMVlk85RfbC7m17uKdtntqflfv/mdsu6ganOWXM1oVKFL2ebi/jZFGklAdLEFnwnfJizhSnn6IOY9C0cnc5BLHTQXbesyi31FivDrj+Ole4btZwze0gqj2+eKYQO9shrJ11pxPm0X/bjjF5Nu9vT12vYTkoxVFfHRlvoJ8jLSI09N1X4gdyGrZh+00R4dRbO6jRQc7RPBF6XMUfIBonPvnhslNr5i9JyqBo+rcQT87fP/U5b8VmJcmLvebxQ9orkm8hTH20shj+fNgUsVXzUHSFqyjyJlK0waAhj/TleAiZa7x2VYjU43FyHNO9xgPk4yPQe+asQ1IeS8LLFfTxPb30EWe88HDlhQia/ZOPd/pksGVArJyt0cxfCquzX+7wTnqsTWY5gRZ7ZBACO0dKSzuollHOuU2O+OdrVRbWeKGB7x3y3Xs842LRA47cYDrgJ35GiHhiu99SkKDDXSx+gAeA7pfk8BLeSh5EaZsptRav/5xCJeL2TimDNgoBsp+eboiFilDxQ7E9M5aGtOyn1OXnC7ix4dUI9VLvQdfC/fADxCPFj59R+/
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 20:24:41.5119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a032e5-8ffe-4e99-f0e7-08de65bdc24a
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR16MB6948
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDE1MSBTYWx0ZWRfX7cSGUemrt1HD PBZrPZykAfCClVB8uTqCD4D+AdV0zkqCcpQ8wjh7ddfWD0v32uEG7UgObDapu7w2MQFA1kmxnyz w22wYS19VeMefGhqz3Ki9RCoSaQ5IGDoaS0YZCHCzvQx0vytU5KPimuIl4PKak7lEyz4ntnnSCW
 FE6CzknH0WE2CsmyfsVF2sCglt1FGHQ21d4hLHXoLbBRCwWWZc138pvWC0cYlmtMMSynbZzgpYq WT2kmk8X5ndIDMvdwlcR10TFlqtHuDhjjpHNLOGsPOoPgSypiqH5OAvBtmoELWjpU0wU+dMUza6 TrXEHiWcwDih4gNfsSCJ46KWhOdz2WoFcbzfuPjTtuvSAYyZRsiqG7Tn33EntftJSuGyBNwCJxi
 p7th2yVmq0JV6RTItK0+2woti/weEv/x7+Bt38+aw9lG6uTtXzgqgpEtwoPmgZwFeoKUiVahawg +HB+cpkKklco77ydj1A==
X-Proofpoint-ORIG-GUID: O4gGO6pxZ7cmWfGCwZuI7khaeTbc0DSR
X-Proofpoint-GUID: O4gGO6pxZ7cmWfGCwZuI7khaeTbc0DSR
X-Authority-Analysis: v=2.4 cv=b+C/I9Gx c=1 sm=1 tr=0 ts=69864e0c cx=c_pps a=z4Cvy7J80qD6KqIazgzwmw==:117 a=b7IhknPlfT0FN1EembXvig==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=cbNQJ9GKAAAA:8 a=LB0Ib6n2NbWcIVi9NEwA:9 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2602060151
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.994];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[14];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,ford.com:dkim,ford.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 1E0E1103166
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

Use existing printk_ratelimit_ms and printk_ratelimit_burst variables in
do_printk_ratelimit() instead of hardcoded values 5000 and 10 respectively.

Ensure rate limiter is disabled if either printk_ratelimit_ms or
printk_ratelimit_burst is 0. Make sure no unnecessary initialization is done
in the corner case.

Also, simplify the limiter code by using min().

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- new patch
---
 xen/drivers/char/console.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index f607e8f84d7a..e3962512d282 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1291,21 +1291,27 @@ static bool do_printk_ratelimit(unsigned int ratelimit_ms,
                                 unsigned int ratelimit_burst)
 {
     static DEFINE_SPINLOCK(ratelimit_lock);
-    static unsigned long toks = 10 * 5 * 1000;
+    static unsigned long toks;
     static unsigned long last_msg;
     static unsigned int missed;
     unsigned long flags;
-    unsigned long long now = NOW(); /* ns */
+    unsigned long long now;
     unsigned long ms;
 
+    if ( !printk_ratelimit_burst || !printk_ratelimit_burst )
+        return true;
+
+    if ( !toks )
+        toks = printk_ratelimit_burst * printk_ratelimit_ms;
+
+    now = NOW(); /* ns */
     do_div(now, 1000000);
     ms = (unsigned long)now;
 
     spin_lock_irqsave(&ratelimit_lock, flags);
     toks += ms - last_msg;
     last_msg = ms;
-    if ( toks > (ratelimit_burst * ratelimit_ms))
-        toks = ratelimit_burst * ratelimit_ms;
+    toks = min(toks, (unsigned long)(ratelimit_burst * ratelimit_ms));
     if ( toks >= ratelimit_ms )
     {
         unsigned int lost = missed;
-- 
2.52.0


