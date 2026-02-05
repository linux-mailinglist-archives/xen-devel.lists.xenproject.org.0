Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Kb0LDMthWlR9gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 00:52:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1416F86E3
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 00:52:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222591.1530386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo98U-0005tv-Az; Thu, 05 Feb 2026 23:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222591.1530386; Thu, 05 Feb 2026 23:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo98U-0005sU-7x; Thu, 05 Feb 2026 23:51:46 +0000
Received: by outflank-mailman (input) for mailman id 1222591;
 Thu, 05 Feb 2026 23:51:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7khk=AJ=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1vo98S-0005sO-5S
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 23:51:44 +0000
Received: from mx0a-00498f03.pphosted.com (mx0a-00498f03.pphosted.com
 [148.163.146.23]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9caaf6da-02ed-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 00:51:39 +0100 (CET)
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 615HqIDu018123
 for <xen-devel@lists.xenproject.org>; Thu, 5 Feb 2026 23:51:37 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11010067.outbound.protection.outlook.com [52.101.201.67])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4c4baycky0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 23:51:37 +0000 (GMT)
Received: from SJ0PR03CA0073.namprd03.prod.outlook.com (2603:10b6:a03:331::18)
 by MW4PR16MB4630.namprd16.prod.outlook.com (2603:10b6:303:185::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Thu, 5 Feb
 2026 23:51:33 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::a) by SJ0PR03CA0073.outlook.office365.com
 (2603:10b6:a03:331::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Thu,
 5 Feb 2026 23:51:33 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Thu, 5 Feb 2026 23:51:32 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 615NSiEL1197009
 for <xen-devel@lists.xenproject.org>; Thu, 5 Feb 2026 18:51:31 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4c21ngwf3h-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 18:51:30 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id o98Dv4VsqlOqbo98DvTVoB; Thu, 05 Feb 2026 23:51:30 +0000
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
X-Inumbo-ID: 9caaf6da-02ed-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=Lm3Syi2mpyRFVC0nxFXuSE47y
	+pIAzSatJzFQPa0JVs=; b=fyeZPsGEdmkn43ToBLjVY97//x85uR4fkHOhUwb1F
	YOlnRXJFfT1lXOotADaHHZp8cokJTIJf5onnfhu2tvaeAGysqL8HON8cnY9SqC23
	DtDTgwRpn9K7y0zEf5mVcDkjy5fCJvF7KcOvJaOKos/JIc6Gyg4nulPs7aCkPQeF
	tTM9O3YAGsNao5u9UFKd2wdQhJbevkTYtVWc8qs4nE0UiEOX/G5tW9pXSUd/iriK
	2KqD42a3Suae6BZRkK9051kd+4KUntmWCMc4KQ5ezH1QUcEI5l8Hr3S/iVWGfJve
	Ra0ITSAhRoZT9dFohihPfNIHrU8AzPYESiGhMb/ZEtixg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9F0F+gVbTCYg5Qx4TxIGgzmriXmxCkedepQw4ksWRArarDsa5QXrW+2rF+uz5hr5FlPQSFBGn5wT65Q5sBn5t3dncbitNBxUTOxJ4+fg2si/bZEyNvo5lNhupnuxzplOlC0jplEp9xz81Bzb81NIrTZFW138R1U0VSoJVvH/UlMJpX1r8SB63KFMjQdTpaFo1KNt3lF+ctZdw8//TnxkBaWZV/llmgIG/Ukd1zh/voM0hDOqqP9ycNmsXd+XEUksJ6O/N9BbPhCFYt3BO8/ce8v17GXLM0Ojq6PgzG6h9+SQIxZK+CQlMCgMA6c2k/ietsIfQgDiq4cmu1iAHRIkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lm3Syi2mpyRFVC0nxFXuSE47y+pIAzSatJzFQPa0JVs=;
 b=XhrAOtz/vnrW2P81bgoJi8hHtqbk+WJZwKuRkuxZqWj+cN31XP0RN/wG98gOpIA0hieYrKc9puox1dcMzr1Ctsz25lRk5pyhfPX/FCfHGWpYlqeTvVgZ03lHHVoLavqzLhnhH1DdWKmOiwHKVosAXcsT0+vVycIy5iby3AUrWKEQQecZZbZSbdRVZQNXEj8bNNJ+g7imr9jTGRbXpK6T/MovvTsoLWPac8u4kr81J8mfhZqzkoE2qCm1F6InffyOkdpc7O60BkDoCrYhchcyY3M9EbC56rOgwK4pDRLTJDbenk2zZCYXCGz6tO7LIm6pyXIkd3d+8WsZjk4iNgcYCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lm3Syi2mpyRFVC0nxFXuSE47y+pIAzSatJzFQPa0JVs=;
 b=Ozkdy385GeoCmS0gfLfgjyrz8Ywlaa2s3il1LCF1CZ//PI3XNpjtJCcLGX1wHi30hu9Ce7JxX9IDNwQyaa+/kFC0xaOkePU9OQdIjZarJ7nEqWnAXKeRQNyCUxLti7MXR94emA4EB2m9tAPKMj8hHkH1MpJe/SzQxXLqzW/zaeU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=Lm3Syi2
	mpyRFVC0nxFXuSE47y+pIAzSatJzFQPa0JVs=; b=Jh2tT4CmNG3tQicOM/XiPFN
	zIQbtIrB60J2nNSRT5ZBek1ivhuNrd1Hbaezt1rgN21Byi6DJZA4JAx1QwaB43aV
	TN9hQuHvzPNcnQByrfg6dRanxgAWAtmJdAjIhUSygPPtQIYYuUBt10JDemh/40w4
	o6tdTIamUxqfyyZ5LU3oTd3VDRFUyPDcPRcAql2X9Qb7SW2i7CVLSAtevL6MgZPD
	G31DAFBv7buQAgQiJESfNXgw/U0F3Sx+IIL3l+IvApe7AEH4fRIO4CACuVg0PTGS
	Vv8V9Pa3n18cY0W5oaYgWUgf5vUusrlWqd23r+D/kDReRxmX1aTidRRVUaFFuQQ=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=Lm3Syi2mpyRFVC0nxFXuSE47y+pIAzS
	atJzFQPa0JVs=; b=rmzYMntLXuw55WmEdjm8XuKrAkSjm3/x5qUXR2k+3zRmSIJ
	1mWwZGlm3/34bRcS95s/jIgLJu2vH3vQ6+2CGbmF1rD/1dxZQAKe6sLhjVRsiH4k
	HtcPvPtaXlPs2Hvu26EqQa8niLCLY2y+HXFFXoORUZ+0Z7t3Nr7SVhWzrysktjNz
	reFEjqYE3N33bDrkwSkJMre0wphV13l97oTElgvTAQ/vlvP3aeN+UhNhvy6ebVtQ
	nM+8+euqMdYEzzF8bN3ca1UywMmbbH545NeCmUo0358kdGIS7mP9SGY1OpP6dBNc
	/I0heZGB7umJhZca+HMTUd59EP+AjgnBrwQnIaA==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: o98Dv4VsqlOqbo98DvTVoB
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v5] xen/domain: introduce DOMID_ANY
Date: Thu,  5 Feb 2026 15:51:26 -0800
Message-ID: <20260205235126.3764953-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602050183
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|MW4PR16MB4630:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7d9e0a78-97b0-475e-49e5-08de65117d4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NMMetwAYOtDzuS9ubbeVlf85XWJLAXQx8JR+b0CzicZmV1Ali3Qaa15VWY7y?=
 =?us-ascii?Q?VJfBECi297E6hmNAn6rGVwf95hDcsPoNZuLMPvduivyQTpv5wO42gOMc3or5?=
 =?us-ascii?Q?R4BlVPuKp5Vb0ruC3NeXpDVuS+o8H82Qmn1oacZ4po8sIC0HLV8fO61YRktJ?=
 =?us-ascii?Q?1R4ksEz5mgn2YpNFlAEoI5Bxd/VISfPJ1vr+TIz7meB/KUqo/Bh9EGQl5djz?=
 =?us-ascii?Q?dUBMLza+CjKXXe9JqT9jNhp9rtx5Yw6QaWGNAIEqxPsLhAmLpVJDOJ1+4yY1?=
 =?us-ascii?Q?NkN63UfhfrzqGymKUKneLqbOYH9rtoA7V0nj7A4unvWv2tTRuG65G4xM8PjB?=
 =?us-ascii?Q?fuSk7eoKKbyytYNqY19ibKvT9iSZefJE4mpGhxKNLvabsOx7CII5aYt1os6W?=
 =?us-ascii?Q?qBbIKvg3IcPAIul7FoY645CFaVekePdjkPUhT2JApaaFRsQJSOo1xjqb33le?=
 =?us-ascii?Q?aqf6ob0ZC9FxZxt4wEn+sLrCRVjvhwm+/M4E5vrFmyAe73jfqz5gro6t1FnF?=
 =?us-ascii?Q?Z7bKsn1NcfX++82gvkRerzKdUabDV3cgEnioMT22NVxdO3/LspoGMqkxuxHb?=
 =?us-ascii?Q?NBM5fLDJyKkvfUupHwXTec4s8zwtFF2ug2ZAjTBZXJ+sejIcp+mO5F77eXMH?=
 =?us-ascii?Q?JF1eecbunuuLCtj9Xyoy0XLZNcmAkh+wcfQWvWAVVLMjxj8jucvwvZ8vKgM7?=
 =?us-ascii?Q?PgHnZYQd0sU5iVKVeCKk8JZRNFlYuzLdtLW6lsR3pSa++UyoxRxzeL5oOHQI?=
 =?us-ascii?Q?7S6jdtsCLmIVR2iECVEco1j9HrrC8Y+i+XCzY6lu/HpumBWbgCiVv3Xvlf2V?=
 =?us-ascii?Q?KsFo8LEbScJ/7H6AIqlKFYQZxQtky8Dd1Jij7/ucy+DzYA+0IQ0UwsCFDXKK?=
 =?us-ascii?Q?w+kZLJTd0JDN5xdU7myuHesFl+dV1nd2mvQEQ3XLYnnga5b9xidslcB4tRAS?=
 =?us-ascii?Q?cl+o7tQxVRX+nHaOMzwloBxnio4SeOSy8C8Co3Y9ntAE9eb4skv5CXdZV1S6?=
 =?us-ascii?Q?VGSpls6AtQgmOTBxGPK9OW9aTYPG9O3QmjQjFse20wgZohxqg/8E+FHDkD50?=
 =?us-ascii?Q?+stuDZWKOtHJnpBNwko/WjKHLjr9fWA0yK78wefy0Pksqq6Z+X8iIyAUspjy?=
 =?us-ascii?Q?lySRXd3KmJoeyAFs8NeyMVSlBaEDIMdBunHsJJ/IyqeZEk3PFbCU4stpLKnD?=
 =?us-ascii?Q?dju2+GVP4lpvgBeaTrT8MLpZMwtk5K1gFzjNUMjPKuE7s1G4yIH5KjXfYmzg?=
 =?us-ascii?Q?4hWrd4Dozid/kNcEan9C5qMhmIPW75dpnbbZH8jASrLGngx/wg/X0GEM8xGO?=
 =?us-ascii?Q?Lkle8uLvN7SDooria8fDfe0bAx2gUij/cpjysVm/t5YGfUzRhL0xjaF4yQFi?=
 =?us-ascii?Q?Zlm2ceTURMTM2v1Wg7OUOiOq2AT/tXN6afXT3bbdjgjysk5eov0GMw0mYFBS?=
 =?us-ascii?Q?JdWzGzfXitL1a7t9WHuQv3BnobmQH72MV3Ks0Ix9jsxr+RNCgyQDHO8MHXNF?=
 =?us-ascii?Q?LPlbYkNA6El1vayCGDiJVGi+jCGDRxPhRH8nEmpir7IMyNiCas3/m6G83kAe?=
 =?us-ascii?Q?AObM/uNu2VX0jGWwvF6OiWiV6ef1v9D2bW2U2KKtK3jMobWWvxAZ7j3QHMOh?=
 =?us-ascii?Q?ZbZG24ZpZ/a47aszQCHqTTPTwFU1slODk9ng96B2A/FK5+MzVf8dV3A2sJpi?=
 =?us-ascii?Q?+V8Lug=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BHr2Vv+b1ZA8pEgTHKL1zhO1vl66N+1qdPszJVP0oZz+awuv5RmBRcELK1I74eJewEEYulazFQS9o/GJBObSEFCeklNTnrfupy2AwN0wNf+9C+cVempoQ9pwTs0kgF1S/hfwwBNYx9dYXXUpGyh6E7wzzU3IlkJSbuexzb+Fi8r6C3HK78ynuvfdaeiOcmRmf9ZE+5gSM+7TZM1ZQR8CSUbK9NsUNLeGWIz1tRSMqZh0iqd7OERWt+ydMQLo/3iOuVkvAv/e5GSFzTJX0ybyAJ/vw7LzkAQBo2T4XavOSZ40TdtqoZSszx7rl/JoJ7YQCPZuAVQHSm9CA5gEE6tCWaYiuBl8A0PErxLGE7KkZyOeR7AKkTIi6AAvPD3gstm1gCJmzqbn11OF8GKGEQhmndIEFLGKea0ygYvGnFmJCqf+Ta3/vKXCcB11jgL2cXiv
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	N9jPm6u5mKi9sshJUo5ewH+KW0KqDbtAgEStnb4xAeCIWgQEtBNINGI0zv/kntFq2HEIhSEHOQo+vUWK4f5De+3JQkqWu8X4L5dlDeb+59H5BvpN3piM6aDh5qEK+8pXldQpLaOJ6+EPEODCYJbGn8A4bmNY14awFskhOYrZwnjmE8YXTey1A3FlWFtdcVrMEv6uOE9hLPhTqGmzNyB7nNvEt9SZTodeg65ejA4SFDd/pAM6Jcv3M6C5hyQpGB+EdyPq3ZnWmazGl4o8N8y6oHc5CRA92aAxN6K4BwShUo/7KEnXSLwoTbuP+7I/tEoFKz6dSiqsmU5K6rsZBRkpLkDH1hL4wKVVcBz2ljcDGRMw4nUE9YSezA5EsO90uoI5QxgYmPgQPBRQVlYsyBtn4Erq/cXwDULAW94OU4bFheECX4u0JWxIv+CfdvcpVtrlgbirlCmAbe87DG90iU8SsCEJNhQGEp+8Y447nQlDUYQTRa5mD7B6VeKGZcyWsh2bCtNlkp1DlOQtnu+1/C+CUWW/221eOpY89/bz8WE7jTCZHSOiuZub5CZRv3x/9GYqsQKRfvcKIbc54xSIM87iYpzs57W23dBrpSlNZK5Q5H76VOiQ70nL/uuxVukDcC4TBVyHF1ToWzm8cg7YchKRzg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 23:51:32.1879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9e0a78-97b0-475e-49e5-08de65117d4b
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR16MB4630
X-Proofpoint-GUID: Q2DNK4XEYZR0GbP38AtbZIVaAVeyOWJf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDE4MyBTYWx0ZWRfX94Dbxp0kB1JI gBvdGCOhmXPaB3iMrmm7m+nBKTO45Zm2C2VihJ7ffirwl0BfchWJgMEPlHEuQ+dIfQNfwxY0l0W ZjexD6z7MWpNi+sN7uH+GBHnUrUomUd5MlJTB8zRQeM45ilfWc5eobhVirsoTXFF/A+Hxwhr2Vs
 2MdPg99lGbkiahtKpxexk6YbQJyGgDugLw04zzO4qLNaLXtaClCypNgu978ZsaMFbeChsWFa+2p myNejtaAje/MCF2d5dR7bNOJyEuUBRKmJfERcfrdkbJe2pOUzmWDQiF6bKZBj8JWVvajixusLuc BVWFXzAaSOve0Jzo09TrjFwZ7SSOonwss0WXwdiOVkEKD8c1t/OEebWT+qHqbcSouRBpePzR+2f
 hP7pevsQau4VcjmhWFSLwwu8uPT2Ml2IwTI/ELRNRcEpv4Uf2ZpjVsNxY/RBO0spPVl6NnfDaua qkBZa1xvf8nofLlPQUg==
X-Proofpoint-ORIG-GUID: Q2DNK4XEYZR0GbP38AtbZIVaAVeyOWJf
X-Authority-Analysis: v=2.4 cv=Y5P1cxeN c=1 sm=1 tr=0 ts=69852d09 cx=c_pps a=uSxJDRa0a+oxfPxgRloJcw==:117 a=b7IhknPlfT0FN1EembXvig==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=p0WdMEafAAAA:8 a=cbNQJ9GKAAAA:8 a=Scr0WcHX4gzoYZdgL5MA:9 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2601150000 definitions=main-2602050183
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
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[14];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,saarlouis.ford.com:dkim,azureford.onmicrosoft.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: A1416F86E3
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

Add a new symbol DOMID_ANY to improve the readability of the code.

Update all relevant domid_alloc() call sites and harden the domid_alloc()
input value check.

Also, fix problem with passing invalid domain IDs in
XEN_DOMCTL_createdomain: turns out libxl__domain_make() (toolstack)
uses 0xffff as domain ID.

Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v4:
- dropped ifdefery for DOMID_ANY in public header since symbol is
  needed in toolstack and stubdom code
- fixed commentary for DOMID_ANY
- fixed check do_domctl()
- fixed libxl__domain_make() is toolstack which can pass invalid
  domain ID
- hardended domain ID check in domid_alloc()
- CI run: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2308917328
---
 tools/libs/light/libxl_create.c         |  9 ++++-----
 tools/tests/domid/harness.h             |  1 +
 tools/tests/domid/test-domid.c          | 12 ++++++------
 xen/common/device-tree/dom0less-build.c |  2 +-
 xen/common/domctl.c                     |  3 +--
 xen/common/domid.c                      |  5 ++++-
 xen/include/public/xen.h                |  7 +++++++
 7 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index bfc9149096a3..714e71441498 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -676,15 +676,14 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
                 if (ret < 0)
                     break;
 
-                v &= DOMID_MASK;
-                if (!libxl_domid_valid_guest(v))
-                    continue;
-
-                local_domid = v;
+                local_domid = v & DOMID_MASK;
             } else {
                 local_domid = info->domid; /* May not be valid */
             }
 
+            if (!libxl_domid_valid_guest(local_domid))
+                local_domid = DOMID_ANY;
+
             ret = xc_domain_create(ctx->xch, &local_domid, &create);
             if (ret < 0) {
                 /*
diff --git a/tools/tests/domid/harness.h b/tools/tests/domid/harness.h
index 17eb22a9a854..65da0d075a2b 100644
--- a/tools/tests/domid/harness.h
+++ b/tools/tests/domid/harness.h
@@ -41,6 +41,7 @@ extern unsigned long find_next_zero_bit(const unsigned long *addr,
 
 #define DOMID_FIRST_RESERVED            (100)
 #define DOMID_INVALID                   (101)
+#define DOMID_ANY                       (102)
 
 #endif /* _TEST_HARNESS_ */
 
diff --git a/tools/tests/domid/test-domid.c b/tools/tests/domid/test-domid.c
index 5915c4699a5c..71cc4e7fd86d 100644
--- a/tools/tests/domid/test-domid.c
+++ b/tools/tests/domid/test-domid.c
@@ -41,20 +41,20 @@ int main(int argc, char **argv)
         domid_free(expected);
 
     /*
-     * Test that that two consecutive calls of domid_alloc(DOMID_INVALID)
+     * Test that that two consecutive calls of domid_alloc(DOMID_ANY)
      * will never return the same ID.
      * NB: ID#0 is reserved and shall not be allocated by
-     * domid_alloc(DOMID_INVALID).
+     * domid_alloc(DOMID_ANY).
      */
     for ( expected = 1; expected < DOMID_FIRST_RESERVED; expected++ )
     {
-        allocated = domid_alloc(DOMID_INVALID);
+        allocated = domid_alloc(DOMID_ANY);
         verify(allocated == expected,
                "TEST 3: expected %u allocated %u\n", expected, allocated);
     }
     for ( expected = 1; expected < DOMID_FIRST_RESERVED; expected++ )
     {
-        allocated = domid_alloc(DOMID_INVALID);
+        allocated = domid_alloc(DOMID_ANY);
         verify(allocated == DOMID_INVALID,
                "TEST 4: expected %u allocated %u\n", DOMID_INVALID, allocated);
     }
@@ -64,7 +64,7 @@ int main(int argc, char **argv)
         domid_free(expected);
     for ( expected = 1; expected < DOMID_FIRST_RESERVED / 2; expected++ )
     {
-        allocated = domid_alloc(DOMID_INVALID);
+        allocated = domid_alloc(DOMID_ANY);
         verify(allocated == expected,
                "TEST 5: expected %u allocated %u\n", expected, allocated);
     }
@@ -72,7 +72,7 @@ int main(int argc, char **argv)
     /* Re-allocate last ID from [1..DOMID_FIRST_RESERVED - 1]. */
     expected = DOMID_FIRST_RESERVED - 1;
     domid_free(DOMID_FIRST_RESERVED - 1);
-    allocated = domid_alloc(DOMID_INVALID);
+    allocated = domid_alloc(DOMID_ANY);
     verify(allocated == expected,
            "TEST 6: expected %u allocated %u\n", expected, allocated);
 
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 840d14419da2..3c18dae5e625 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -852,7 +852,7 @@ void __init create_domUs(void)
         if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
             panic("No more domain IDs available\n");
 
-        domid = domid_alloc(DOMID_INVALID);
+        domid = domid_alloc(DOMID_ANY);
         if ( domid == DOMID_INVALID )
             panic("Error allocating ID for domain %s\n", dt_node_name(node));
 
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 29a7726d32d0..35fa60e74d74 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -409,8 +409,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 
     case XEN_DOMCTL_createdomain:
     {
-        /* NB: ID#0 is reserved, find the first suitable ID instead. */
-        domid_t domid = domid_alloc(op->domain ?: DOMID_INVALID);
+        domid_t domid = domid_alloc(op->domain);
 
         if ( domid == DOMID_INVALID )
         {
diff --git a/xen/common/domid.c b/xen/common/domid.c
index 2387ddb08300..b0258e477c1a 100644
--- a/xen/common/domid.c
+++ b/xen/common/domid.c
@@ -19,7 +19,7 @@ static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
  * @param domid Domain ID hint:
  * - If an explicit domain ID is provided, verify its availability and use it
  *   if ID is not used;
- * - If DOMID_INVALID is provided, search [1..DOMID_FIRST_RESERVED-1] range,
+ * - If DOMID_ANY is provided, search [1..DOMID_FIRST_RESERVED-1] range,
  *   starting from the last used ID. Implementation guarantees that two
  *   consecutive calls will never return the same ID. ID#0 is reserved for
  *   the first boot domain (currently, dom0) and excluded from the allocation
@@ -31,6 +31,9 @@ domid_t domid_alloc(domid_t domid)
 {
     static domid_t domid_last;
 
+    if ( domid >= DOMID_FIRST_RESERVED && domid != DOMID_ANY )
+        return DOMID_INVALID;
+
     spin_lock(&domid_lock);
 
     /* Exact match. */
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index b12fd10e6315..f35a6f21f063 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -608,6 +608,13 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
 /* DOMID_INVALID is used to identify pages with unknown owner. */
 #define DOMID_INVALID        xen_mk_uint(0x7FF4)
 
+/*
+ * DOMID_ANY is used to signal no specific domain ID requested.
+ * Handler should pick a valid ID, or handle it as a broadcast value
+ * depending on the context.
+ */
+#define DOMID_ANY            xen_mk_uint(0x7FF5)
+
 /* Idle domain. */
 #define DOMID_IDLE           xen_mk_uint(0x7FFF)
 
-- 
2.52.0


