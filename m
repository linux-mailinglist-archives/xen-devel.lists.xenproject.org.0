Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 22QSGTJOhmkxLwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 21:25:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 275BD103168
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 21:25:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223854.1531266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voSNs-0000xS-Qm; Fri, 06 Feb 2026 20:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223854.1531266; Fri, 06 Feb 2026 20:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voSNs-0000vF-L6; Fri, 06 Feb 2026 20:24:56 +0000
Received: by outflank-mailman (input) for mailman id 1223854;
 Fri, 06 Feb 2026 20:24:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FjYH=AK=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1voSNr-0007sY-4J
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 20:24:55 +0000
Received: from mx0a-00498f03.pphosted.com (mx0a-00498f03.pphosted.com
 [148.163.146.23]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e47ee03a-0399-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 21:24:53 +0100 (CET)
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 616IOGl1017544
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 20:24:51 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azon11010001.outbound.protection.outlook.com [52.101.56.1])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4c4baymunk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 20:24:51 +0000 (GMT)
Received: from BL1PR13CA0222.namprd13.prod.outlook.com (2603:10b6:208:2bf::17)
 by SJ2PR16MB6132.namprd16.prod.outlook.com (2603:10b6:a03:571::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 20:24:44 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:208:2bf:cafe::a4) by BL1PR13CA0222.outlook.office365.com
 (2603:10b6:208:2bf::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 20:24:49 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.0
 via Frontend Transport; Fri, 6 Feb 2026 20:24:43 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 616IWehB3654759
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 15:24:43 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4c24gveaaw-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 15:24:43 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id oSNcvoz8awVq0oSNdveEla; Fri, 06 Feb 2026 20:24:42 +0000
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
X-Inumbo-ID: e47ee03a-0399-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=91u
	vrCfmE9p9OckTdvelbOLI6FReGTxP9EGg8jerJOM=; b=afazjQhmEDNaqPLk5v9
	RLNk1Ofa571aSDn4Fz5SSwJ3GNO4tWdQYm0tkd3LOBXphhOnTwjhXMs+Aq4uXnvF
	542WFaA8GPYBU1/L6IYja0ltsoZCtcboOMtZUu7lFlDRiNLaYOSwtnpOMknq4rYh
	BhVjzA3ccSKC5bo1lnWmUo2WWSwuDQp7LHdaPsntc3mWU2VG7U5Ww4l0BcNWgGjC
	EuJ/+rb43+S+IcatfyF9hEs96HB+MzXN5dVIuEtLlxOaxsvW5ouZ3l9hEJo3+JPU
	KIDffULgE+RUX/hE6i5MO5jmsDrtnjluVoExd9wYQiv/sQ/qUgh+v37Qd2OAdLf3
	/Tw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2ifvxee0qkO0LQ/SYqMzf/VexVVtz0LtQ3AyikPi5t3TFl8gDNnHVnll8gJ0sthZQKTl9bguZLVzy66DCkM30L+Ms3bG9otL8xRLfZjlzB4GNADNKcbch6j3UbfqLDZgzoUfln1r/ME2WahpobhSZ01ko+T+x60h8o4WccA4d1iWTpnd1GGh256njoxnDOgW8OF9saj+WwI0Xkh2DHwiGyQaglDRCeo7kJaR0AII1fhzm/ZiA6T5Q4l7dTZLlTiuSAQ1lPIlLP8Ilj5bCsnvQXbIgFTGuHM+LwpYhPKZNWVW3R9NfNB+yi2V2n87TfckwspD1FiA+AbttnzNc5lTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91uvrCfmE9p9OckTdvelbOLI6FReGTxP9EGg8jerJOM=;
 b=x3MRFUR7ldCqQoqGY6zMcFT2qzYpKQoYYJwpZg+mC8yRac8LNXt1rGbuCot8dw8d1cyKkyi/kemZkkmkHS0KLWE6zUnYaB/MSTy/dy/au3YXpaSuCY2qZKByIBAyCgSssFxN5eGvuya8dvG37lXNFJcF0MpJ+HYHOqDxE9wicJMESCe6VPchen8yzxoLEkn76e5bmDyLanDRA2MQG9UKoSg16y4RqAxGDC33c02kRi9jAhYlhI6lfa2R+Rosb/t/F0Nxeu0p2s7FNBAjP2KerENTByf375zildnoz1+FwjNjalm/9cqshB9efNNkfC9OZVML7z/UjE6BGromlKvcvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91uvrCfmE9p9OckTdvelbOLI6FReGTxP9EGg8jerJOM=;
 b=QKj9yW+G5dqA/Q6Ra3UdH8J4nfX0wyLF8tAtsms3XbrnveH6aFi0FQ+wbMirn1KeCfQuGpBKnAAG/88jBioE9+AksTF/Uds8a+DKVxkhHdJTAYDgt+wd3y/qVij4xZEngINLVIQ79sv7mGO6XYshicqTY2Xs2Wzl4NHQ36rvMEY=
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
	ppserprodsaar; bh=91uvrCfmE9p9OckTdvelbOLI6FReGTxP9EGg8jerJOM=; b=
	bazJ8CuAfH7XNJ69iUeawUD8ycV46TjDBRN+L5wXWm1sgzFhEhLq3SuGDwOBrkC0
	ZHwD8YCyjDFdH2T4Y4J1tmZOmYLbhShOnMHRTjG4DrXKpz6qWboBMpHcRfdKAa32
	UtlLYRBJyL3fyms3Sk0HzOccKUsxkoabehVj8ObVS0Rd1DTaBN2wKmUEmKHqzE+u
	jlvLFcumskGITMdihEvlGhqKaSCiOdH8NT7WkiHjARo9oGgbQ7SQuOEhH8Iau3/E
	DvJOzIqByhFBhgw38Q6Ew63nBIGVuozLeZxbnE/7C4YwCk7zcX3vjUh8RNiLtqiR
	nB+jSn6nqJRzsSqVicPGmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=91uvrCf
	mE9p9OckTdvelbOLI6FReGTxP9EGg8jerJOM=; b=WkAXJiUJ/J1w6ZaGvjrM1iP
	pL5JYjq2vTXcif1cuCH3Pt8L5Qur1oahU/waXT7ur+nZIo87sDjjYBSD13OktPXO
	pumh/epVfrE9dFQ+qKlABstD/gu0kU14+kglhKcn8F1Rf7JqN5lnnY1zQVWawpu1
	6Wq+XUCP/kqaAXCy6icOtwZZwSaTbX1RDvVcauIGfafcUgqkGASqVAEVdpeD6cQ4
	9xKXp+O5rNDpEdnZMPjRk/WBhRMeE/A2BE9/KWg6bCUvP71G1fz1uV/o4G+uDwTP
	7PZ4B0ORHRe/rg3jRM6hpCD2V9EcG+CJwKhvsCG9IHsvmEEIOB3OoxZlSEIQNAQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: oSNcvoz8awVq0oSNdveEla
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 6/7] xen/console: use s_time_t for time accounting in do_printk_ratelimit()
Date: Fri,  6 Feb 2026 12:24:23 -0800
Message-ID: <20260206202424.2054758-7-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206202424.2054758-1-dmukhin@ford.com>
References: <20260206202424.2054758-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060151
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|SJ2PR16MB6132:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e0db4c7c-126f-4c47-102b-08de65bdc39f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z7XeBMp7iSGv2sJKJF1ErHlMYrHYTTP6XAICIfUuV7kRtPoblp+/+8qkDM5e?=
 =?us-ascii?Q?z0Yx+M5iqeaDcFHeJIRt93smAqkbxJt/kO1/EpZSGsxf9Dr4aXF26kcV8KJn?=
 =?us-ascii?Q?ory82q4ZtxEIkhmiUXNtu1qN5JYshXdxOWkhppKG7vEGlPTLbhI+eu+Vktuj?=
 =?us-ascii?Q?bzqGL0/SCJK0eB1hllX2YqI4LOv0VC012ipxyesgzK7aBWm1ZLr5NXfUDjag?=
 =?us-ascii?Q?H61bVsRBsFI//H++xE58q52MBgsDXQLSfNCorjHcV/RsYn9ovH2PBAKp9/gh?=
 =?us-ascii?Q?arYCZEl47kNW0kWnp06ZtLfg6AzRJkR6fdW2AHilr+yLkFGQeiMkyo5yfK+1?=
 =?us-ascii?Q?QAQ8FNEEmi5MDYO7sagR9gI354FjKuAvGthC4KlP8HR7ummtKlj60sb16piD?=
 =?us-ascii?Q?bTJ++q4I6el18GjELLPOFdqWwDoZ+0PgFbb/xQFjR57SWpAWo6brOgjqCexZ?=
 =?us-ascii?Q?fEF10h2JRvCA7jQhcmtAgzsyQ2jQcTK9bcTQlEJ4Obk3BRSAUfn+frmh37IA?=
 =?us-ascii?Q?ohlL1QKZcttzti3ptbnQj/w39fVHeE5BcMKy/8WVa9ovf/lX4oOnhDNcNuPg?=
 =?us-ascii?Q?HJUJ0WCaAdxPxkTA+DhV95nCAqPH5VhDLV+P9krFy2IdvQhh7x18avMyoVZa?=
 =?us-ascii?Q?u8KP/RNTVyNqju7wV/8mwe3FYTuBQ9SI0ki0jI6Qu2QLmhvXJ+kLyWia6Tr6?=
 =?us-ascii?Q?31wOiuK4O6O9iIYkZ+9GIEIfu2gyytEQ53K6qlubXMCyzr9Rxfq++Zyknqoa?=
 =?us-ascii?Q?Dka/5QEoMcc0Gk3iAS/SZEMD9AE6XZA3j9oK/uhm7fsL1rkoJfNsFQD6PwaP?=
 =?us-ascii?Q?Rk8mmJuvg/P6cxEhePdpwLQmBzLOBkW0Qy/1TySy79zzsS+sSUnTnqwDpcae?=
 =?us-ascii?Q?lNSdwT2znShHz5KnyBw0U6pDuueN0Kb+SzkUI52Uh8HrvHrpa2gV74bkrkXZ?=
 =?us-ascii?Q?8pKEE+ZtA6YoBd8pKfObVWk+dlbRm9JZdjCgg149KncXHau3Z53z+i0LKfLz?=
 =?us-ascii?Q?ztTgoHkd2BfXyFnoEMYgR4+inoFFS7FCE1buWvdRH2JXQjSJEEXHkTmAH16b?=
 =?us-ascii?Q?rdsue6FN5IOVzyJ1mdqNLBAbIrhvfL5VBGEq52Iwu7RyZEsHc/r9c/c6U7TP?=
 =?us-ascii?Q?/7T10NOXZb3WdjMXYU9E1ZfKbTzFBa4fbFqt22w7yca0c74zOPOXPRtOtwnA?=
 =?us-ascii?Q?TacFLvr7CBPrhDxarJcv/DteNg+fCEzLf4GFVx/LJSBufeXxVtCkU60sO99Q?=
 =?us-ascii?Q?iuUF++NtXzZRiXW4KMG5IvsKX6CuE6fXjv+yuNYRzOPX/ijpJUaO7610EyEI?=
 =?us-ascii?Q?ld/AVw3yF0bYrQemf4f51mlW2CZjfbXrP4YK4TML946i+zbrO54lUYVjOI47?=
 =?us-ascii?Q?RTpsC1c6kfMYcR1t7QTDEH0DUj/jQbjDMzLz6sAFgeG4UsC2oOm+QzvsMsLw?=
 =?us-ascii?Q?BtCmxruUF4B02uWTt5mQkoHX2opxtaYrB8qgg7j85TT1dO9gjYHyGeGq5KYk?=
 =?us-ascii?Q?jWZNo0CWNm8S2Uuvwq8a8GXBp9If65o9ai0EGqUocclD+6XD9F2g2IGMBuDV?=
 =?us-ascii?Q?aOUch22PsEzT3cinK+SSw0jC10QeKct8rW6YRAJSnpno20PIVfYCdbrakAQt?=
 =?us-ascii?Q?pDjJ0s+sVpVQf6BzXbAPwB0=3D?=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZecZ654W56pnfY6cvlr3CVn9jpY5Is/kuJK2xsSEUZ4FGyRhSG7+qi9jZL/F9jLx8Z9vxmVxX/dE+9RTX+KNOAKrQBU6L8fmSocp0SDW48DfYyabx1LQmM0exBqfExcq38pUlp2ZDc0Bl9KHgeIHcAvWeHslFaqEYLp8A9zTuU8elQ7XzO1Gx+6Nc9IA1lb1X0Y6TqFDDvl79qvcLzykVR+20/qgfB9Nh7emqNGZkBIjyIZeVbjeiTAVj4xP0CzPXxyAPYfNRqKc77kB9ErnxX2a7ZrcvBELwLJVqnYK6BpOvxbDLt+Wgyl+UDHqnPp+y0F7IoIER+v90Mmrr11RvPMaJ55SQqLOuerd5Fvw9TSQIaXDhUPEaLbLHJ+v57FrQ5yIOvudd2X8lU0Di8uWtG6b6qF/n1M2la/5+T8qniv7uCyGksNBcRweYbcvehsh
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IYivZ5RI8RzsjIR45NzetnHP8o01ihiMknmQktDjSBJq4u8oUFc2/X/N8PpBfo2CQMQdK7qXpZ9SGB3BDuc2EoqyC7QnvUBIG3a6hmeIdZUq+3vpRDrjy8ULbeE2tRCe+/9ZHEJGx9P7qmlWe58mHpZKBdyEVBJVXmhhekc2f38BM63OSTPpPHL3xse5V9ikjdrvUSMlHlBqjqL6dqrxha9KRFm0FAAh/n3u7HYBU0fuu67xa1Xcda4dGWOg98qTgdH4OIhey3m4kzvr6OmXVYlo71H7XM5ymG/7Xb7WujOp04c2fTYqkE8v+ef6pE+3bCfbKWunt/8Dk5Nup139X1pJGM5gNryIOARKjvru5Gz6yfkYftHHsLq0hSWMre+jxiNREv5quQFZyNwZn+yj1PBtVFvKpagPrszjsi9gtUFOeRm/OPOwPwz2+SuGpSIqAXj7icS6dQ70u1O2hi8/HgIbL6gj78gAGUUBMjNap1ws9C9jjm/FLKJdm3u2somghbmdzdIFJBupHODcFp9z4ADuxX17peg0LjnzvvYmrBnvWAJ5f2s6garEKTt4T9Ul1DmbTHkkF730CsGfSRKGT2eExbo6sE5dFTHJUhAFbu1ozrIo7A2K1vzXmNB8PXy2
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 20:24:43.7317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0db4c7c-126f-4c47-102b-08de65bdc39f
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR16MB6132
X-Proofpoint-GUID: fgaykZ-oroHLu2cn7KDygUBkHrzFUDpH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDE1MSBTYWx0ZWRfXzh+D9j/V4yQB 6N56yMvlVv6k69kALKJCZgPtAJ/vLQJl/DjmwHGxbs6X0+E+plXLjr8L6PpZTqAGMJ2Fc/K5o8G hmgNJSacNtGTKIkbMMMYpIv0b76ypUohvZo7pWMS48BLKbmY0h6A/uqdUzIj6ylkne502vVG7ZN
 TQkgs1FqgdD5fq9Dux89BHbqm47dYcstfNZlID9auzO0TbJIk9tjmAkT+d4jRAvHcrdUdJmInNg AYAMsYe+4e/K12tQqpzZgLwNpuiLKCOog8cn0/z14uNm9QT385kcMM/8jQr/gvE86AE979o/roL fWfA/qi7wnoOk7bhfToeUA6VqmjwJsvfIN/UqsbCVnYGDwr9esUzsrk5fApRMMlUSTJqHLYDh5I
 z75huXBWSmLGlzL0DRrc0Fgd60woqB9Ig8vXOHmKcUW3q/OrkrvZyuYNfdNzu1+2u7Qd/hj4127 9xxM1gU4Pk9CgWvk8Lg==
X-Proofpoint-ORIG-GUID: fgaykZ-oroHLu2cn7KDygUBkHrzFUDpH
X-Authority-Analysis: v=2.4 cv=Y5P1cxeN c=1 sm=1 tr=0 ts=69864e13 cx=c_pps a=qHW1pi9L+1RZ0SKNcL3CYw==:117 a=b7IhknPlfT0FN1EembXvig==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=cbNQJ9GKAAAA:8 a=7mFPJ6EfzbUYukK6fngA:9 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 classifier=typeunknown
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ford.com:email,ford.com:dkim,ford.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 275BD103168
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

Use appropriate s_time_t for time window calculation in the rate limiting
algorithm.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- new patch
---
 xen/drivers/char/console.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index e3962512d282..536b883d5dcf 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1291,12 +1291,10 @@ static bool do_printk_ratelimit(unsigned int ratelimit_ms,
                                 unsigned int ratelimit_burst)
 {
     static DEFINE_SPINLOCK(ratelimit_lock);
-    static unsigned long toks;
-    static unsigned long last_msg;
+    static s_time_t toks, last_msg;
+    s_time_t now, ms;
     static unsigned int missed;
     unsigned long flags;
-    unsigned long long now;
-    unsigned long ms;
 
     if ( !printk_ratelimit_burst || !printk_ratelimit_burst )
         return true;
@@ -1305,13 +1303,12 @@ static bool do_printk_ratelimit(unsigned int ratelimit_ms,
         toks = printk_ratelimit_burst * printk_ratelimit_ms;
 
     now = NOW(); /* ns */
-    do_div(now, 1000000);
-    ms = (unsigned long)now;
+    ms = do_div(now, MILLISECS(1));
 
     spin_lock_irqsave(&ratelimit_lock, flags);
     toks += ms - last_msg;
     last_msg = ms;
-    toks = min(toks, (unsigned long)(ratelimit_burst * ratelimit_ms));
+    toks = min(toks, (s_time_t)(ratelimit_burst * ratelimit_ms));
     if ( toks >= ratelimit_ms )
     {
         unsigned int lost = missed;
-- 
2.52.0


