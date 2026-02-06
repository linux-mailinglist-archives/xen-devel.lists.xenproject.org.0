Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NCfFDJOhmkVLwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 21:25:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 223C1103167
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 21:25:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223850.1531220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voSNl-00087u-5E; Fri, 06 Feb 2026 20:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223850.1531220; Fri, 06 Feb 2026 20:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voSNl-00083w-1K; Fri, 06 Feb 2026 20:24:49 +0000
Received: by outflank-mailman (input) for mailman id 1223850;
 Fri, 06 Feb 2026 20:24:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FjYH=AK=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1voSNj-0007sX-5p
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 20:24:47 +0000
Received: from mx0b-00498f03.pphosted.com (mx0b-00498f03.pphosted.com
 [148.163.143.241]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfcffbac-0399-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 21:24:45 +0100 (CET)
Received: from pps.filterd (m0367129.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 616IODM4029751
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 20:24:44 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azon11010005.outbound.protection.outlook.com [52.101.56.5])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4c5j8q36kq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 20:24:43 +0000 (GMT)
Received: from SJ0PR03CA0299.namprd03.prod.outlook.com (2603:10b6:a03:39e::34)
 by DS5PPF15CEA7AF4.namprd16.prod.outlook.com (2603:10b6:f:fc00::7cb)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 20:24:36 +0000
Received: from MW1PEPF0001615F.namprd21.prod.outlook.com
 (2603:10b6:a03:39e:cafe::58) by SJ0PR03CA0299.outlook.office365.com
 (2603:10b6:a03:39e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Fri,
 6 Feb 2026 20:24:31 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 MW1PEPF0001615F.mail.protection.outlook.com (10.167.249.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.0
 via Frontend Transport; Fri, 6 Feb 2026 20:24:35 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 616HGWLB1842312
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 15:24:34 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4c218c6fa1-8
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 15:24:34 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id oSNSvS7tpFVH0oSNUvlhx4; Fri, 06 Feb 2026 20:24:33 +0000
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
X-Inumbo-ID: dfcffbac-0399-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=PAb
	5O/Y8tkJMuRffwwSmk6ToGXwlAAsbstwG7rcOOjk=; b=RT9gxY8/LpdXtPwFiau
	+jfcDEEA4UtUWQVnghL45gCEnEiVBLU7TdV5kPPT7a4jg3w58ZrDscDJJ66KAQD7
	wmUQEwxor3VYCPo1LF94VUeQQf/8t6DSt821Yklr3L/tG9cITsmfCp5ygB3LhHVC
	fhSwva1r+/HSGRn+UTc46BCmvkED2/Mv4wM1O5Jip9GjMT18dC2i1bhVy/d8ezkk
	c+0ZE+3z9xymBcD/q1o2/vSQF6QUp+Xnb+GXfuMPq3eWjRu/6/DIT+lPe1MTrKq+
	9KDyRa39N0B/if3O4fqhbwxJ65GWRd3p+zomZxGBWzYp5g3QkID6obmWlO8yhw70
	0Yw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lysWj6+PYXB8dooueUFWKNAqa0zV3U58ab4+nI3XNoEOigkBU5V9KJFa0aDA90uUcaZjQi8T6CqXldaUU6d3CnCjkTBi8LhPyM5PB56WsPW/AiomBXePpP7Jpol56lr9k5yrjyhTuwElV9LhdauWe9aLncvY67/eC1l1VGCjWqdD0Bsi62jQ2f/CuhBHEZHLt2vR1mIvkuBRBwConi+DABEm0f9MI/TgNpalaQ0NiV6t/8SJv1zqrcnYTabVJXktZgryqyzMxYESOQIjX1/bMbOwEecrfURVhtuOKMHKo5GtygVrgq9lEgdc60PIYrsVU/3FK4vX2vjbxS33LQhAJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAb5O/Y8tkJMuRffwwSmk6ToGXwlAAsbstwG7rcOOjk=;
 b=sbUnvvVlyO2RJoEKeYDmILQJTD1iptz7LzZhGxaajQQvQQG3YS1bLs8zh04X1Ji/0kHDrP39HfDphRGehnhOF73U1n5hu6sRJI+wB6TPstyR9RbooKV6vt4tCGKtXHztkOoH3iCLV/99Q0sGIlxtudwqeHFCBNejWlYwNVfN5Ecq4V/pPFDdir3JDJtFo/ydex9MTF5BnW1P0IGba5yJITdN55b+0i7E02lycR63FdUmXXnBohxYoWUUuOQCs24nVOIE35UHErVFtV2Hn0d2qzECdVIvrLNfvEjDsTGxiwNCq2aoB45XAUOPKdTkjQZEv+OGtA2a8TL7UVos7dkQSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAb5O/Y8tkJMuRffwwSmk6ToGXwlAAsbstwG7rcOOjk=;
 b=Gzd511Klz56wgmZLtHJIfe8tNqobEq+kxgwwu78KsVcdtYt/lUiXjrwdPQWvLvPTb1SCQV3rBNh4MeBaj6+4GWxFAJLlvwpDfpSy8Xvw3YSfq0C863myrt5lN8AtN7i09kkm/QLKynRXqJgYj5IUU95evvgZ/AUWhtXh3KzHpYs=
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
	ppserprodsaar; bh=PAb5O/Y8tkJMuRffwwSmk6ToGXwlAAsbstwG7rcOOjk=; b=
	asHXhnL/jYo8iBkNbk1yOu/5W0MfbTMOcBhh/dUJ4vPBRvCsyb9088q0Uoba5orm
	rhiOFZ23Jbza7MNyTjPrUW2orOi0A+VxQD/c463ExnppGkBYFoNChEPgUzD2TOPk
	HJHFaSk2jtFviURJaPqhN+uWk5aGVk8APGcAug0ZqmQmivVdGrXFe56qdZCYYIiU
	IloOE88RlVEacw9aFMmj8vYuwGE2iRL/D9R5UCnA3ahYVpNv4m3N+Bfl618kOcUs
	E9dqAmgGYXkucKzM2jGVBgtfz9BRLlknut11BmxNemz1N7Gnk4GM84+UMkT9SvRK
	0g9yupCabcuZTBz9nRouIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=PAb5O/Y
	8tkJMuRffwwSmk6ToGXwlAAsbstwG7rcOOjk=; b=rMc+3sE9rtU4AVoE65CPivf
	qcflUAzrawltWtdttXFXz9E0ySktMrrBBOgcBuwyEoT1JJMuk13iLvjHu1Tw4AQu
	HoXmvi8KXQjiB4DOq+/6PlcgMi85X3Y1f8xdHIf2nZ/YkJqAFTXsKfOvyiL/gDD5
	NZ5XCBJSgUVrmz6l4QJgtLOlX4pprDT16PuPnCt60U7R7vSL221Q2e2QSlcH+E4o
	Nfv8e93iCsn8UV/J7ou9PWOFYUJ4ocBz9Jq5xllUT6wicsQYjeIRVOkv0uM+Y60w
	Ybvc9PhQeHPCtXwpyl8Q620UT//kL3NPW+oFD5Ue//hkYKaWfoguBP8ax6PHYUQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: oSNSvS7tpFVH0oSNUvlhx4
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 2/7] xen/console: use bool as return value from printk_ratelimit()
Date: Fri,  6 Feb 2026 12:24:19 -0800
Message-ID: <20260206202424.2054758-3-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615F:EE_|DS5PPF15CEA7AF4:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2e05c65e-1254-4d55-955b-08de65bdbea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BqXKJbTH92E6MMPffEWQeZfwL5XPMcVQClgzRKCi8ZRGEEmhUJl5yvxaE6Ja?=
 =?us-ascii?Q?Wo/5uMlZXhnx2Tg25HO4i+0IfosSZ5dLUk6+qnOjJ5lvPHBrOkL/r8VlQ8Hf?=
 =?us-ascii?Q?LGuTBYfOulYoM5x9MzkS9AAsefJ0pTcP1Yy6QT3dbh/sTl6OWNH0a3d1MTc0?=
 =?us-ascii?Q?TTE8kMrmfuhTCaNCgLHX2jNRvXBYdY1dVtlF6o8Hld6uFUNcWvwEvFTlx8A3?=
 =?us-ascii?Q?9IbW8erjjH1/ajemwJkn/LoGVEuk2mijWBSqar8rFxgFBltK6OjA794P6gbU?=
 =?us-ascii?Q?1q2kxLgFFj9/jWbOvkBXcCWQ/BXTUtd/ISUCAAFaBzyzgLOwgdYhqf7NiSlX?=
 =?us-ascii?Q?ugquMUpsY5cQ+q33wmm53KEi7Z+C6zPYnXVvKAmbMs6zCSwz228JO+OT79QN?=
 =?us-ascii?Q?kDQU298eqVW2BsNVc6WBGToNvnpDgJAV98OoDqAgU4uyWU2D4sw70iP32dS6?=
 =?us-ascii?Q?FgFi0MRQ19QBowyjWlV10wIiUBFCTKyXYAuP5fUZ9OqlOS5EitiuxPEoSd2n?=
 =?us-ascii?Q?tmFcFLsOCVnCQXSRqw/OpuUm/yiU0x0Gfc7bBU9vXnxOI6nf6aMnltXja5SC?=
 =?us-ascii?Q?H4g06Y5jo107JVERs1K9JAN16nCzEyF3Qa/6JHsxsEG7LawzRTOBVqNv8V0x?=
 =?us-ascii?Q?YX3ASYu0Ug9uv7YKT1lRthyiTvXonWYsei3r52gd6wpmCeo1t96QC/AJJBM4?=
 =?us-ascii?Q?4Xx72tcgLeSKFo/iVVBck4Wlf0Lkqfc7q2lvnJoUB/MZ+l9lU4Jju07z6AxT?=
 =?us-ascii?Q?GKZ3YE5Sype803NJ4xpinLHPzieI8bLno+zFv0GolOtfao/72PXLQZxUKSM+?=
 =?us-ascii?Q?9c64ecyV1rM1/Pt6Hz6v8OkRL+uc7Akv1LXO40iWYJubOl34QL37cgU55dHd?=
 =?us-ascii?Q?iz9VJkg5bodBQuPakh7BasjEMnO0Od6GQ8fhMXYNnHizHQGbJvYLS3+l6fgE?=
 =?us-ascii?Q?1tkaW8Eu43LKuus0GbCNmHU7z1YtKy9ItnGU9mcFLnMFrZzoGrSpsyS4mqlg?=
 =?us-ascii?Q?KFUPDuiv7EwJBjq6muJ9WWn1f5n2+upmUIyfXsCoQuTYevimihgdZDMPPXAC?=
 =?us-ascii?Q?zSXd94SSDOX2NwK0HupCE/E1XyibBywbDtg9fN4SG7P5B13CyafSEIGON0wp?=
 =?us-ascii?Q?uj8g0dy12kUvpqetsh6COQ/4bak5awK+tgRKIRKdhYLP4Wocae4mYwx+w5rX?=
 =?us-ascii?Q?nJYW6/HlHOaz+UfhPO1cyVWr/JUquXPTD1IO+f5vu8yc2EBJ7O1s2TKHZ0b3?=
 =?us-ascii?Q?JWX0eOJORNEXEg0PH54QvJLx0LGgx8ul2MVoPmNyblAtP6g5A7U2MIWWAPAK?=
 =?us-ascii?Q?PE8bt88BO50FdTvk+1YZHhTgbxZa25CAacLW2sIjYHrgbqAXKcUnJMSx8FLG?=
 =?us-ascii?Q?LXFMlynPe4Jcm7139xJsVePhJ4otazoiPsQf4yeID6wXlazdFG/yy0o7uOos?=
 =?us-ascii?Q?Cr6lBy9Al4q6JRoWlxtkZlUMQslQtEFEJ3HpAMkAcXZ5BIO8Nxox0OOPeIaw?=
 =?us-ascii?Q?2hu+fRoLpPPiTrJ+tqW/+vgM2RhD6chNdhNfUU2Q9jvrtndi77kNs2ZN3n8E?=
 =?us-ascii?Q?nGxJjaWCzn3prOuAgeJ2x0KSEz72gBH+gcA2/ZcLpGCZx59NrGX1FvAbOiCL?=
 =?us-ascii?Q?zgpyIAcqhRDQ2Ram6zigDvMVdXX9GY0mWWS+OnXLtMBYAnXi4eZE/rjDOZ0o?=
 =?us-ascii?Q?fgbELA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fUAYm2yHfful01GD7o2asg6rw0IfQ5JsSFuhTbI6zQvHVYRO2rvcKLfM6Bv5jSCo0d3JaYrNtHNe6NZ4ImTsidfqOrVMuJwaxXgBBZ5eL+RQphgxLeLICVkUox+ke3k7XuzFUSuMwndJmtZ/e655/VHCQepc+TKHe1FyD322j+0L+bsIErhJDF4iTPkfw+eCnHUi6IckwNEUCPmTfP+OQmWtgOEABxTrR4nKcWp7ZzX3pRU6rRr5GUHVghi3dJYCHeEVihVKTCNbtR88usPiw6tqL1k6GS0hmxCJt60uL6bh9shZRb6bykU/9HrFLM7K8sgyccejHBaZONTxqjleLNkC7DY29Jx1HQsPgeNO4ssq3bi4p6cR4yuoq5HfZXScfXAnumUl2A/JLdfsuQznSenZRfKDy7OPNlPQ/BRDcFTe31e2bNJx9+/+w92zSUGc
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pr8AieQrC78r97TizD7vof/P0NxC1Iy23pxgxC9ueyO0/N/LzhSM00Aeem5iTkGE/E2rs5+wvZpKK8U4D2NAYMUKGmjfSRmMGuxdzrdUsATYUgqes0HcVD6z9SXfgFH/6ocpmVmCLmq0l619rbiCvKX/ZE5I+KEvYQQQ6VTDd0haro8Yz55Z+RkRe1nAeBnGRncTndWmgEyoKr46gqETs/eHJ90FfSmKmdG1kp8FRvtg1DWitDXQrlVGSgDa9QChBIf5QrQV+0r3v7KVLXrbE147DO/MBrzpjyArhReycdmw1WwW4zFaW9RgFq4AbGk42+Wi7HFA4uOUiZ+X2k6LYiCLKIA8aayhv8l6OWVFw0OklAnsTUexfOT8ntoFEy2EQIGwJRQ/OPRKND5gXg/2w9LV8OnsxVpnfGdV7ICtLWdRolk5rHSB8EnhEJ0rGkMkL0rTZ9lDceqdG/hJrDCE3OMBovupad3U8hmpogZI6VGgnWMx1OjNzPBvXBLRluBX04CTaigi02HtV5QnWN5jcaU4Hhlv+yKT1Ne90VZHgPdWr2dr+bDTm3RtEfsoi+Lc/qFIgNUO5v8mNkdGDbVgRdlRcQp6BA9ugZAE90Uynae/QrVzLE0fBcfAfa0gbLLN
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 20:24:35.1879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e05c65e-1254-4d55-955b-08de65bdbea2
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF15CEA7AF4
X-Authority-Analysis: v=2.4 cv=B960EetM c=1 sm=1 tr=0 ts=69864e0b cx=c_pps a=sh1HRyDNv5RGx04/W1QObA==:117 a=b7IhknPlfT0FN1EembXvig==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=cbNQJ9GKAAAA:8 a=O5SXfJm8xCv1owjWUKgA:9 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDE1MSBTYWx0ZWRfX+ggG+y6eokCM o5xuhCKacqgqVyVEbjlCWz5sQFyj3Xn863Kngo4fj0nauybB8p6kexiHnkrjmwAty+L7yxAclfH rcQYf9hL05HZFMtVwt9KjfroyMSfSLTfMGvT8PuS/p/yY0zShcmUr0lVI63uzIDbyykjYkm/YhM
 N7EGo9k3VoEFvvBi7LfpeYlHYjaOA1Mjr4+eCOuu/Bfq4tNTHGCHJsuj4jdc4rW1JD6Gk/nK4tr bTJ18dVpQU5GRv4PbGx6+V+kqgOQuHg1HOLspOS+4ugG9izq3he1xnDeLFPNbWDEeAdpK2f0QuO irdF3369PuQc5HXDcabWjdRD5X0nmHVZTb0q9/8JO3N9NEMsNAgBo2/f2I/pVyKV7X4qNuFsxfT
 orWi+7vT0/r/LV32LM3FxzkBu31tMLnmuUB5YeBLahMDLsYgDHmnU2jt69h4QAKkWZz8SO6TQGN JcQAam47M4A4/U9+6aQ==
X-Proofpoint-ORIG-GUID: MaL_CyK9OpA5O2oyiAfGNYpny7HGwj0D
X-Proofpoint-GUID: MaL_CyK9OpA5O2oyiAfGNYpny7HGwj0D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2601150000 definitions=main-2602060151
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,ford.com:email,ford.com:dkim,ford.com:mid]
X-Rspamd-Queue-Id: 223C1103167
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

{do_,}printk_ratelimit() are predicates. Make that pronounced by updating the
return value to boolean.

Not a functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- new patch
---
 xen/drivers/char/console.c | 10 +++++-----
 xen/include/xen/lib.h      |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index af9ed38da553..c4c92e3efa39 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1273,8 +1273,8 @@ void console_end_sync(void)
  * This enforces a rate limit: not more than one kernel message
  * every printk_ratelimit_ms (millisecs).
  */
-static int do_printk_ratelimit(unsigned int ratelimit_ms,
-                               unsigned int ratelimit_burst)
+static bool do_printk_ratelimit(unsigned int ratelimit_ms,
+                                unsigned int ratelimit_burst)
 {
     static DEFINE_SPINLOCK(ratelimit_lock);
     static unsigned long toks = 10 * 5 * 1000;
@@ -1313,11 +1313,11 @@ static int do_printk_ratelimit(unsigned int ratelimit_ms,
             rspin_unlock(&console_lock);
         }
         local_irq_restore(flags);
-        return 1;
+        return true;
     }
     missed++;
     spin_unlock_irqrestore(&ratelimit_lock, flags);
-    return 0;
+    return false;
 }
 
 /* Minimum time in ms between messages */
@@ -1326,7 +1326,7 @@ static const unsigned int printk_ratelimit_ms = 5 * 1000;
 /* Number of messages we send before ratelimiting */
 static const unsigned int printk_ratelimit_burst = 10;
 
-int printk_ratelimit(void)
+bool printk_ratelimit(void)
 {
     return do_printk_ratelimit(printk_ratelimit_ms, printk_ratelimit_burst);
 }
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index f516215ca8e4..e39fa9200c82 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -82,7 +82,7 @@ extern void guest_printk(const struct domain *d, const char *fmt, ...)
     __attribute__ ((format (printf, 2, 3)));
 extern void noreturn panic(const char *fmt, ...)
     __attribute__ ((format (printf, 1, 2)));
-extern int printk_ratelimit(void);
+extern bool printk_ratelimit(void);
 
 #define gprintk(lvl, fmt, args...) \
     printk(XENLOG_GUEST lvl "%pv " fmt, current, ## args)
-- 
2.52.0


