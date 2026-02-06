Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB/aGDJOhmkVLwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 21:25:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFB9103169
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 21:25:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223856.1531277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voSNv-0001Ig-AD; Fri, 06 Feb 2026 20:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223856.1531277; Fri, 06 Feb 2026 20:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voSNv-0001Ee-59; Fri, 06 Feb 2026 20:24:59 +0000
Received: by outflank-mailman (input) for mailman id 1223856;
 Fri, 06 Feb 2026 20:24:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FjYH=AK=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1voSNt-0007sY-Cm
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 20:24:57 +0000
Received: from mx0b-00498f03.pphosted.com (mx0b-00498f03.pphosted.com
 [148.163.143.241]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e61374a1-0399-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 21:24:55 +0100 (CET)
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 616IOCY2020005
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 20:24:54 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com
 (mail-westus2azon11010040.outbound.protection.outlook.com [52.101.46.40])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4c1vf7tw07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 20:24:54 +0000 (GMT)
Received: from PH0P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::17)
 by IA1PR16MB5455.namprd16.prod.outlook.com (2603:10b6:208:452::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 20:24:48 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:510:d3:cafe::5d) by PH0P220CA0028.outlook.office365.com
 (2603:10b6:510:d3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Fri,
 6 Feb 2026 20:24:32 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Fri, 6 Feb 2026 20:24:46 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 616JZ8E41635518
 for <xen-devel@lists.xenproject.org>; Fri, 6 Feb 2026 15:24:45 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4c2127xjn1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 15:24:45 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id oSNfv7ffjP7uEoSNfvI6oV; Fri, 06 Feb 2026 20:24:44 +0000
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
X-Inumbo-ID: e61374a1-0399-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=CR4
	hrbY+VQlJ/rgqLlCY9Cvf6nyLAYSOtoaaucI88Xs=; b=NNuTHRm7OJSUrMIS8cE
	X6514LUyZMHh+fTr7rNoNE4dPW7aFde2+HY392G27X0XQS9hMnFsbXrzD4otOsMr
	3bWuKBM3nQtkJved1YXy0yyxrHbAnBCA2N0JsRJ291lWuo3QFcl86NkZ1XEvwrWT
	yZvbmHj0R1NaaUyecfaAby3SAscW8vVJ8b+6fOou14iZd5nS8dPfz45l8zl7hvdM
	chLskLi4y7mibJzzisgwDC7FTi1jZM3m/qwpWdrLv0sjW1iiO2XEjolhn8Tpe82M
	axCihJlLjosOHsH1ML2Z4CEWZuidjDxdBN5ZtUmwE4Zg34typlCR5kl9ysjS3mcc
	fMQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tM+TFsP3atkBMdZe8/c2ydtb7Hu4WXRQbNIyi+OZzBbiDOemy7VYel4jcX4INPCy+vzDLeYeVzH9QNZiDvd4b7fuA6KyQs9UHCWLuSml3NVX6whgGi0iS6Vk9rrsKWYGJLBMzZIin/smaEyw8KzQNcMRMcwIcWR7KEqJ+e6tYIY7P/GlkmOTGXHj7DQOq1Y7qy/6wSjB/islLQQXuQUX1Kj3ROGtti0qFjP359as2C1akrT5Om6xnSe4A8F7eD7xXv/a/vGJ9sSEgCYVWH2B/wyI4QFmQ5E6BEDLwb4p3vaM+LFH1wHOJPvhwvtwK3awHJyFiNOMki1T06wVIfrVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CR4hrbY+VQlJ/rgqLlCY9Cvf6nyLAYSOtoaaucI88Xs=;
 b=nNUQgZX7i2TrAGvFl1aJ6C4SLzHfdAxytpZflTIECymYc0IXX4ORtP5OyxX6Er8vLvQ0+oYuttAPMhHLx+NCburbFq13J7QqNis9OWRETgbBQJ6JKyty3Pp+02sbOU9hu8pSy0tW0Nva/04XBOP1knlnfM8VJZ6R1sFek2Kdsadz4SLcMieAwA6RXkBG42YyiNHn/ydm7a6XOxKwEXcc7pH5+R9AhFT3k7eSslMMbY4xkh4T57pmpQnbJR/Zf3+53AUpu1sVMqdSlawCQvhlqSrw+aMSntfn+3EU1ZU6lgG6GI1OsiB0REh2qCUr50Vj7w4uYA9gZgCnZpXQweiA+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CR4hrbY+VQlJ/rgqLlCY9Cvf6nyLAYSOtoaaucI88Xs=;
 b=Lnij9Y6r8iliSzgHk4cj3I2PW/f/tAOihnGumaTPQxHIjiC3Y9ddq/fA71lTuZYh6dRFK6x/ElS+4XFO0D/1x24pI1vBBfGsQe/nh1+pVBfqC+sf7xYdH/JnBoPHH7LXALEL8qoD9YW3NqnCLEI9Rv0ajmo5MKTX06wVbVMaL14=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=CR4hrbY+VQlJ/rgqLlCY9Cvf6nyLAYSOtoaaucI88Xs=; b=
	GKp24soira96aMPBn/+WULAh03CMCWMxfP3ppicTBUC3KqGfW9fwdXpzql4tqj2S
	uIh6spJRpWBgdwoCRIWi5Yv8/FLZEudMl+64fJHYSkNjtXTCv+HuPbDbnClETGGf
	4/h4LHbEeGOk08wADlln1RKCq/0z7Ohad0GlE5oMMHWxpbU+kZ/zxDumrxJkt+Bj
	pklc87IU3BPbLEXXP+KafPdXiH2Gr85ExYpUsA4vRR22Yq3UnrJqwm4hjrjZeV8r
	6Dgp8oA937ulYO/YeGsnkk3dmhaJFSsvK99pnKipYIx8w1z+rUaG71nCjZTepSaA
	G5lF20b7b7c94he4VNpA+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=CR4hrbY
	+VQlJ/rgqLlCY9Cvf6nyLAYSOtoaaucI88Xs=; b=Q3+tSxeWydMRSKASXIZdzvG
	Y1f2R7ASHyDRTiRpg2dteQnTNY2ET6niWVYrCjsgH4Jr4FkL9Mf14XkkvEYcJEKc
	huIsmBhoQEUN9C5YlY9RFimmVrFmttDrRsF3i/WVvlAFyZaFWTRuvD93KZXl7ecw
	y/kOpKgEPfoku0dzZbO5Zqv3O0LeJSB6qbLKQxnoh1Flhi0RKT28MVY3P+Bwuwoy
	YjHy3c/DcgpD7kHg93asHrCnZ3KT3HhKbeSEnEmwWSuUnGOZw8GEtBzkAW+WSMmw
	k1dKtLi72TZYVd4wMV30/0bHDDbi4SMbHjM/grOYj3kBRzk0tJTYGBEAjkOfmDg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: oSNfv7ffjP7uEoSNfvI6oV
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 7/7] xen/console: simplify printouts in do_printk_ratelimit()
Date: Fri,  6 Feb 2026 12:24:24 -0800
Message-ID: <20260206202424.2054758-8-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206202424.2054758-1-dmukhin@ford.com>
References: <20260206202424.2054758-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060151
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|IA1PR16MB5455:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4d1a2765-4961-4cea-1281-08de65bdc561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6mSO8d/pQL//n+mKA8vTTMHyXhoaP1FzQT4BPFQxaUDZlfeV7HbjieAIPAkn?=
 =?us-ascii?Q?afif1iZf2J/49rHGC3LDYR4TQAT+I6Vz4JyBUkM4HedQO8QfJYAp3lG9ZgCb?=
 =?us-ascii?Q?HIqngrNSnj8AwaCE+Z9jStjOLI7p+iExuACzFwrTviPY/kS0J5vWY0X1v4Ad?=
 =?us-ascii?Q?ieGAZhBbSlbWAa/fsgddRhwL4uf7JSopW+Ym6bWb6qZw89QvjNnxyr75GdRM?=
 =?us-ascii?Q?WIt1GuFgg840/54+gdY1Bw4H4XAxBhRESbG+BNNHg6rDZwvXNY2I/Qv081Um?=
 =?us-ascii?Q?AfkrNX30ku1nxjTYTixiueDi3D+aDo/CgUP1PvkVYLwcJsILXWXQT/8BM9Uj?=
 =?us-ascii?Q?6EgNFuPBfgAtJMQSoGlWPRCd8oYbHFsWK6NaUWpPtw6FHw+MQqmSSMC+2AaW?=
 =?us-ascii?Q?jprpdCrDvhFmxNt3Qcd1a85SUtq8x4BGTjxi21D/CBgSkKpvVOnKMkLjqSxa?=
 =?us-ascii?Q?hgwM3pPAiwpJVwHQ2np+Q9APcF9s3SevSv1JCZLcFQgyxja80wd94AWzAdmn?=
 =?us-ascii?Q?SE5Tpc7EOLmWojrZptMzwMJcg1JTYELYanl7LTeQ7uT8Byz4zyl9P6zErAlx?=
 =?us-ascii?Q?WmEf3a25Zcz5cx4JiULNiTYeHaieAjy1AZUKOP+WJiNfdb4dgpqjSMVahWOa?=
 =?us-ascii?Q?DsquU+Qcr5FyDpiYONnDg4QvMkns4lGeAQaWkeQOnj8H3FkG1WJTA3QdVHai?=
 =?us-ascii?Q?dly3+wGVQQ42hAwfz5ZzkmoVWJACWd2Zi+w5YPGkvId8Q2+qkI22T8QrVKeT?=
 =?us-ascii?Q?Mz57RPbDHcMrE/XHq9ltyc7NUCxMT5k/hU4mhdIN8NkADZXpaVNhJSIv0ehC?=
 =?us-ascii?Q?5p72MI6BrwSHCqhdFVuhRrKyT6iyEdiQlI7GTE2zPoyQlNr2UhTdm8QEIlcN?=
 =?us-ascii?Q?E6vyhrtXjriUr3BPvedBqbr/cdullmN7F4SYjXdtSsXXn/6ssS4xiLqWN+Sm?=
 =?us-ascii?Q?V9kITlOc43pmfQnCN99cYfcgaLtDpGUGZ8sN2Co3KeO0b/KYOE0lSn7OAHKB?=
 =?us-ascii?Q?yj2+Ff8SkFoBt6ikYJPOP510Z+2dD/xNTRCE/sGWrA/RnwWwYnwQxr21RACH?=
 =?us-ascii?Q?UQM3CoWRBaBaUYcvzBxzHokREkKwDlY761sijl/lEn87jyWW+WOU49lODLhw?=
 =?us-ascii?Q?E3db7degtaIKgdsG6MSwssNLmmILM7fxzXHorvtARMu6J77HuGSy2kbdxxZo?=
 =?us-ascii?Q?A0RlFGOJdpjXxEjx286jXwIfm7EN1DRHAPtrLwpwqCry2r1/h2MIBdoX2Ais?=
 =?us-ascii?Q?Wtg7T0S7xND1XhBJ6c71AdRDZP+dNUMZicRI8l18Zf5DWQc31hndVjGi3Ol1?=
 =?us-ascii?Q?TrafpmKXXYfMPXaEN/z+VLplzvgR9yqVUdMlDvYpkcoqZw6t1mi+Lf8rl/48?=
 =?us-ascii?Q?lUna3yCiTleAHQcuNS+2WveXnvng6svZeiz9QNjYRRTgQ/EQi+BR9dzyAwEk?=
 =?us-ascii?Q?d4M7OQK12U+Zy0pRoe6smnjQOvoeKi+LhasA8aL1NrO7TYpWHYiLYyLoT5rS?=
 =?us-ascii?Q?psIgdMsrso5ji7e1fpQHWDN5aQS+wbMYMkMtFBlWKOpj9tbGHPvOwAv4XRVu?=
 =?us-ascii?Q?VoxR9dsAn+rI90y1KKoFJsvmdEu85ZPnRNNXhgaylHa17U3/vbvslr0KRBaF?=
 =?us-ascii?Q?BBanckhL3V4ESFleUVHeP/ENCU1Zj/gr/QUnNuZJ7DCUgvR99H7dNI45YoLS?=
 =?us-ascii?Q?xMldww=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8CJj7mQlqwP+HdvGiLTQKqk1WAf4i2kWBT6ndW0kOtsqVR9Co/yA5499McF5NBWLjAn/KV1Vt/JDPfhm6Ai1QZoDF9RUamZetHgonpGzZTZ2+b0IQOlFJ5ocrQy2EDqsT9T5xZJECgNFVtIMSV7QbZLVHuMTJKXwxYuVXkRNyKDSdzm6apSg80ksSxzh4yqKKPCLtIWNxSSmUYgJXGPgBRC7doGEzJ21bDmbiC1bXAws0h0la+S1DfSJX17Nb56aPXT43ij9rX7woIpsyi1Rb4tFBPwJp5jRuXKv7nEwju1yIxcGxwKO6xCkLs5trDeBWzlW4LYxrq/iKWEM1vHOoSNM9K7M9TYCnQxS8fpdLHWZyftlhzjihBkN+xIgo54YwSY68HQK1DsQODTeyWxpnQiF9PPEhbS/2kEyRnqfXUF6AbGCXtrcqWVAYuiqM4ay
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9/y2tzjBUa0NV12qDFzyWPXAstqpeMQC0scT93EIpr3vuDslCIMkgzpOdT3mNM7FY11SberJnXazpqe608v3sBLcNaAnhMX5n4kH5X504zpMO6KvMvi8riBVQHrumCtU+HBjyYbJLsGhwA7mrzEE/JNxcZBLJds1N+HSlJF19DAhj6lyaFgBoPD09db4fTgOe4eOqGQIdfJ1VyQzLa7EyK7Gp1hZ1P1G9qL0d0WYXZB/o0kVisryjTp9VtyFCiJzp+EFCHI/Fh9oUFugEuDR3hpbCRMIvOQOSlHGw5y+Zj+KeykaIpwmN9AqmbW5lcR0+D5EaTcJ9hEV9eY2MzpMadDVgiEIkHtmL1Sap2hlOe/LdgN/6DNVUuAPFxFPIcIArraBfJtEdBtSxiyy95yDoW06Dr8u2S5tkS51kBRQJ1PNhWwFYpfH6leR5PlLSbc6ZUkAIIjBEivNxHjzKtnBU+EyuHskzPXAkoXlRU68TXylSVBNE0353QoLrHZjNuksqCYQ2N2jV7PST27Ll9OuvFh/ayzWj2rKN/WbqWkk+zbwrPAcy9EAl8fwjsfMpKcoJHuXycorjeuZBlDk/6zQRHwvasSl1NnCxu7UMjSe6iTF5jJsCJXZOwRdlu49S8cQ
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 20:24:46.5769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1a2765-4961-4cea-1281-08de65bdc561
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR16MB5455
X-Proofpoint-GUID: n2vWVFBBYeftt5MXJwv7bZ2Ys-IgrRPd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDE1MSBTYWx0ZWRfX/xwkSqTYHVfL 7SqJRFbX8YOdv1NuwBiN7nvf8AuQuYoFfy9VABvIq+k7G3SjSJK3oXb84MIhmypHhoYtY8ISLTh AvPggHJG5WaLqAkChzel6Ay/jZeOxnGaKZy4oTlUtxz75HhzUJUli6NNPR31f56I4X/vsCXeQJd
 W7Chs00ALvpbSYaKBbs3qFG+ZCLTkaH7unQ5sXmtERZpGQKQvkKG8NLIvDo7l9nf2DK28tJ1hjh SG6Flyq6bvurYFMZ4HUO3mQpEWAfdMSBBzlCfjgBMm4T3QXiAU5eUH2yIOJpcrr9QM3wKPl/qA+ PgR5U5vlaGQGUe4n6Wt7uFPgENym0Sq19/awCmB/kEqTZ/xdvB8hgM95v6KxW2FR56mGWrdtYfl
 0Hmp9q/4d5RRN17voBA7Qj/fz/zGvkOyUuUhnhSF91M2xldkxur721C47oqB8aoV0QGOvr+spQR HZJfEn1rhM8mXSDyj+g==
X-Proofpoint-ORIG-GUID: n2vWVFBBYeftt5MXJwv7bZ2Ys-IgrRPd
X-Authority-Analysis: v=2.4 cv=Ffk6BZ+6 c=1 sm=1 tr=0 ts=69864e16 cx=c_pps a=AQ8jqBFaYtg5UXnSSWtk/A==:117 a=lOEMawUel/sSvQipkIvNbg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=cbNQJ9GKAAAA:8 a=SFDS5k057olLXLxw2aMA:9 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,ford.com:email,ford.com:dkim,ford.com:mid]
X-Rspamd-Queue-Id: 2BFB9103169
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

Simplify the code around notification of how many messages have been
rate-limited.

Not a functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- new patch
---
 xen/drivers/char/console.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 536b883d5dcf..a60a7c213555 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1318,15 +1318,15 @@ static bool do_printk_ratelimit(unsigned int ratelimit_ms,
         spin_unlock(&ratelimit_lock);
         if ( lost )
         {
-            char lost_str[10];
+            char msg[40];
+
+            snprintf(msg, sizeof(msg),
+                     "printk: %u messages suppressed\n", lost);
 
-            snprintf(lost_str, sizeof(lost_str), "%u", lost);
             /* console_lock may already be acquired by printk(). */
             rspin_lock(&console_lock);
             printk_start_of_line(CONSOLE_PREFIX);
-            __putstr("printk: ");
-            __putstr(lost_str);
-            __putstr(" messages suppressed.\n");
+            __putstr(msg);
             rspin_unlock(&console_lock);
         }
         local_irq_restore(flags);
-- 
2.52.0


