Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOfTA5WRjmlFDAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 03:51:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D7F1327A5
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 03:50:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230089.1535701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqjGC-0007wt-HR; Fri, 13 Feb 2026 02:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230089.1535701; Fri, 13 Feb 2026 02:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqjGC-0007ux-8T; Fri, 13 Feb 2026 02:50:24 +0000
Received: by outflank-mailman (input) for mailman id 1230089;
 Fri, 13 Feb 2026 02:50:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4gzd=AR=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1vqjGA-0006yU-5i
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 02:50:22 +0000
Received: from mx0b-00498f03.pphosted.com (mx0b-00498f03.pphosted.com
 [148.163.143.241]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb454bb3-0886-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 03:50:19 +0100 (CET)
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61CKJwSu949884
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 02:50:18 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012064.outbound.protection.outlook.com [52.101.43.64])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4c9nt9t9mu-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 02:50:18 +0000 (GMT)
Received: from CH0PR04CA0119.namprd04.prod.outlook.com (2603:10b6:610:75::34)
 by CH4PR16MB6763.namprd16.prod.outlook.com (2603:10b6:610:221::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 02:50:10 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::c) by CH0PR04CA0119.outlook.office365.com
 (2603:10b6:610:75::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.12 via Frontend Transport; Fri,
 13 Feb 2026 02:50:10 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Fri, 13 Feb 2026 02:50:10 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61CMYP251194520
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 21:50:09 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4c6mq5denu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 21:50:09 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id qjFvvotfkRfmuqjFvvR3TA; Fri, 13 Feb 2026 02:50:09 +0000
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
X-Inumbo-ID: bb454bb3-0886-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=fOU
	WfQtEpLW+O91WgiS4xNRvSlc7HEqZhzWoRw/fWwE=; b=eRpmvpADU9ZjLhrsHHF
	lDgUz87yRsssbFo/16Yu3CoLJQJDK0I6FcT348fmXqjzon9xY830dJuaJ5OtUwxk
	JsrJ+IPyEH4bDoJcMlQTOEkQWk6FGr9Xi5iHYAGLtz18W/BzZGOKhIKaVEjCV02U
	C8QhhrzP/ahdOFYiOOzsPhfoiyuuu8cyQ5Rg8+8WWnWTnQUkLPo2Eoq2EREfwwQg
	gUdy9ZYU0JvBYJoYSfGhwVC/XgLOwC3AM9yfzJnRqNajm916u+bBatO0sq3rP3Or
	Eaq2q+vMVHqAIPQ8XprFy5Fa1r9W1cT4S4tJz90h4EihRekl6wJBeXL28uxX3a4a
	KDQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izXyZAdZn1WdnlEF+bzS5u7XHRjA82wU7QkbvSCnDw8Lsrh0dARt/0SUZB2Kyhf2RqsBx4ResF1ZISK125yw5VayaArzw7kFPQyOTqKKvOhqKA9sKPE8d843Q2UcbsFWQN8Klu37rdrhIG5+S1Ru1QHPWTnSXGoaKZGy7gBYgkMCh2Az5PzGGzGaQIQFTQyK5Zx8ly4CQL5kW4K5tef0iGPLzcr6pCU0Y7vT5LwByjR9imcfDHJG9UKLA4QuBjK9VWOY75Sypw4iEEwcyQcpO0JWybR3eIzs8Q3lb/3pXZOZXfhjUs6y2IvVWV6VZHAmATnT1Zka/tkSqcL7mYRMZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOUWfQtEpLW+O91WgiS4xNRvSlc7HEqZhzWoRw/fWwE=;
 b=zGTR7S5Ai+5/n+4DbAZ+G9OU9YJOU18V5hTEni71OSDZ5YWljgb4DSb1KW+GrUt6zqfOAMApURUlxoaATDb/ZWTz6kyzBbw5qR1d+Sy/iIGJ31bRRUlY9TA6S+2jcRy7dBbzzTmiP7LjCL5zDfRripEIuaLXjOkn8rZiWkXpxY+IRwhxMlaem+isc/QJTXIK/jNz0xPTNO6La71Bk23Em4slSEPJBJZcHvE999+1/bJZymFvJpEDuIQoBJcO4P+HlT+7woaY7Q8v8IV7JMzGSewOiJGTerGxyNckCcyhonTmSXmQvMR99YwyXok2+WlUyyuLs7xk7a79ocu3whTHNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOUWfQtEpLW+O91WgiS4xNRvSlc7HEqZhzWoRw/fWwE=;
 b=INkXM8tb53Lm97WYu2Xj8WxcXbYph9lAgWsju41qBKZPsYOjsA0OY+3jm3Lptp+0g4iXtPVGYa20ZSDv7pbqsQVmap75MInfgI+lIBM2asLHzuqJaW27U7sKaEGHSz19x4r+wt9gGK8H9B9uIBR/+vx07kqE38WwivEUccqeUlU=
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
	ppserprodsaar; bh=fOUWfQtEpLW+O91WgiS4xNRvSlc7HEqZhzWoRw/fWwE=; b=
	eVTJKT1OJWiAcN0LoNoyNYVRFkUtQPviuC1HJBSKP8O0e55DKTTLe/dnR6VekS+5
	MU36n0KeUxwmj9C+7g4tjAqmJJt5sRd7cIJRb2RyY6eueE8mGjIfEc+g+k1i0gnv
	jw6G56vfPeht/GjrDlKt3g4tC1YjgIrl7grnAhl+g6jsrOvy8CJY64P3J4lXwpoG
	97JpEMM6yXRh5liFN343jV3btLAZi7vtvVNbvPfAQ06+lVyiZNa+hr6Xy9DZnJLH
	Ui5hPAzfP7aS7kg1/ijfi44ZvPL+7a37l5VCI0s6YwHjwAjEq35HKQErzknMmAFw
	JtG11GjzxXOaCwfXfHlarg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=fOUWfQt
	EpLW+O91WgiS4xNRvSlc7HEqZhzWoRw/fWwE=; b=nRRvO3dU8LnwSSIYpIr8y8h
	enw4nuBTyMtrbchEAnotCxv564KQAZfkzlltASaQRNFJFmRlqGXiITdLY4B6HYKq
	b8M5E82Mr6nZuOBVX5VGSqaHNTyT0dpke/Zs+JZbwW2t++2GNmnTsj9VxLRpeF+3
	4V6KVcQEoEr04InFdjPWubDwMv2opRV9FeP+BeAdrtOUreMZyb3+au2ByvozIzGi
	1MtU07GbGWhzBmTOKKkABCeTvkY3/qBrXtl2iqpFZe9fQo8nS6Mx9Fjqtc4Pfvja
	NTu+VXOIXDVLwWNnVdsKxyxEqoaIHJMGZorMr4waO9tQDijPvMTyHQEWRUCwi3Q=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: qjFvvotfkRfmuqjFvvR3TA
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 3/5] xen/include: customize headers for host builds
Date: Thu, 12 Feb 2026 18:49:50 -0800
Message-ID: <20260213024952.3270112-4-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260213024952.3270112-1-dmukhin@ford.com>
References: <20260213024952.3270112-1-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|CH4PR16MB6763:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ae7b2de1-19b7-446e-c672-08de6aaa9ab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gvJ02nx2evg+ZCyx/ADgGqxJodVOl38Z6NgM7FizDi1QHEgSIctjLLcdi6vU?=
 =?us-ascii?Q?6KDPTuJ04klVuFJY82ynCP9Z/rnNiXrhuiIE1oogGw2Sq2sebmIrofLBdGMS?=
 =?us-ascii?Q?VtgZ5EUhJkbCGWkt4sNkkGM/sVQdHs+kFK1WVAJgWcbxAmVYHVnr3eIbvwMs?=
 =?us-ascii?Q?p9aLQRrPWniM4pdh93b/Eoys4Ff73uS4lxCR/1YSVZTmlVDBhqogwGEk5xsd?=
 =?us-ascii?Q?TpjLWLMjy7iYwN6VzJoB94GH/DAHQYtwHv6d1pm2arOYVLOfVSKZoWS5ybua?=
 =?us-ascii?Q?XQo6QMVillhwOjVCIlWmG5PxsQxiuwl+AL3ZGG34e7nUwi+GWfTwj9u3xkEG?=
 =?us-ascii?Q?nZCWvM09/r8WxbxOOHJMClS6jfRfTkHLRQtn98rIgkXhFYIMT4IuNJWU2VBe?=
 =?us-ascii?Q?7yocAX44Xmrq0k7Zyyt2J0ASPr1yYS0/c5t23unR6yMQNqiwaB26teYEKEni?=
 =?us-ascii?Q?fAUlEfej1h+wxxQaUkGqaNjtErstSNSfMmQ1RWjya7jqTKmfW9dMHKg0rd64?=
 =?us-ascii?Q?t/0E8kxulUL8U9OwkDF6JFZCdteV6ftzETWFfKELXhMSusbh7eS9AFuz+5D1?=
 =?us-ascii?Q?p3bPWXMPZBOhj3MO+ortOfxI5iHMQkbW//QTKv9OHBucrrnq/myZF/CWp18j?=
 =?us-ascii?Q?1x9nTBc5DXJHou8WNW7wwpnGW7TfVW5CmsA/yZXcuACY/Uf7v4OUr6o4C2cJ?=
 =?us-ascii?Q?YWP2ruLvpE0IQAp7b5WCTSxrmk7k+kCdgup1OrKS+raO4oooTWZevh5GBoqz?=
 =?us-ascii?Q?I0UK/Xft8xki6WgYfFTyEHxIhe6n93k3oqP6pS8kZIcn27oLk+G9rHSSnRa4?=
 =?us-ascii?Q?PZYa77aUuOgahAPouiIPr/F97k64jhwP+wePKJK/le3Fj9JiF96/yaZ33Nkr?=
 =?us-ascii?Q?PPjcnSXirCABDxO9phy4Gs1YRswy1qJiY7zotBOP3AeCNdQ8m8+EfHm4L3x0?=
 =?us-ascii?Q?vAY2hZwjh63RC7+/+20XAaxg/CZEnq8yle6zBxEBCrImiHwO34dfzzOWLhft?=
 =?us-ascii?Q?aPycGz3dBFu18s2wcroMMWH0f4xvJQKV6v2Q6gM6wWuvECHvlG6asse9yZbj?=
 =?us-ascii?Q?0ZXb7I50IwG/TfkniUBZIzL8m3/VezfXeIbmsn6rQiWoDxtkldpLret3sbu1?=
 =?us-ascii?Q?N/X1v0DoBIoWb0tJ3Ka7GD14Uf/8l+p4t/OlxIbWaAcQkzfQLhDXKKFYU193?=
 =?us-ascii?Q?F8GXhOl3kCTpUbAKRs0NMsAkILaxPlvXyrRzINdK9BOxOF+F799949U7jqpz?=
 =?us-ascii?Q?d1gdFjPMHk8qmtjoqUGtcGVraY0ZGv/w+eWLduCaFdH2QpWVDKwP/lZsSBST?=
 =?us-ascii?Q?VQUutssNprN2poThw8Ff0kOTzJyaz92VHnKMc7KdyjfZem/QeVY7FBNK8joC?=
 =?us-ascii?Q?xyoi2q4Y5ZkeBoi6CHsQwHWXr0z5VQtul0NUePSJ7yoZsoC6goWOmrVZqU8p?=
 =?us-ascii?Q?4uPeoji8LoniRNCncwzqPYy1ZacdbJEsAtD8zvMvn9xmhgjTSFPv3/IKOAXt?=
 =?us-ascii?Q?IVYN5LXofOiWMnhEaZpS7Z9AlGVcft4mW/79dKw2JsMqJ0Thgnu4jCTHtKgk?=
 =?us-ascii?Q?7Fqf8gGXAdCJo+666JKbgiKfY4U4b3lIXXOV5VDC2GGozcardZJYpyjDXEC+?=
 =?us-ascii?Q?2FAuzzV6gjabDuoJaN4zuQDgclH53Oa2AXdfebuwtJNrK08GB4w459xlcgOb?=
 =?us-ascii?Q?hwb+5w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CxL239nFRyHhONXwVSxIaiSgBaWEvhFaq/PtMAXGzkmhUi1Uzavv3mje+Rh49fen1pJ3rnXDliM8+maKJZMdYXDC/zMn3KBkIyLJhEnPzHcm8fPu+61NxQ3A+E/MCiqDw13W/kMHsnFJNhsxQkxX0vyewRG9fXGsqOWW3LoECKPsCzVHiZiCWOrnaYgBUaiv06XM9aRAw179ezuojbJu/FeK6N2lqZASABcZ1UDIlXMieoMCBU7t9bHd8URxGDUlPo+yOTMp3aPfmMesC0sEuYo/e8WHJk5llAcGcoZ6V1N5WYvSybopVWk7DOYNyS2H/RvlEawDujHkci9g5LF7o2K+L9xZj5nmrkinFt77Hl7a/L3MFfkK2w3aMQ0MDcvfzS5sSKSzYQFv5N0o5Ovn+VdI+U5wMHExurVwEffIymqIYdg7M3h9stW/OyMe4F8f
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aAiLoezWHprwMFyazRjIk4or/ClJzSdw5TOM+V6e3JTA9hdHFNcKmvn7CQZ17Wk2zQSsSBH4AjzCIWFcmGqJI7JX9GHwuw/yizC4CsE6VnvYGL3ojNxU0w7VJCHjjjhces491nP6QtPw6Sk9KN/ZGrrvNVxb6eLmKzT7/zEj0Q2AkRKtWq/CoPuyABD6W9XofK34L6esrbf7U2WbnUgB8v3nRDaN5UXpekQufc8/05I4aSpoPH7r/mDiB3XxFRh9nFAWc7szhu81IpWONkPBr815j4uiMMWgP0l4eASW0+/HJO0mGrQeaFcxuvZpOth6XcbhzL8XCx1EfUJJcacuIi1n41lOliZKANrUBD26OESGap78P1t3RrYT5OHpsjBiTZjsaGdPf8eXMmgmrPS1IsXMKF41wC72wrm65JFBXSJiAgFF0UtdXiNpq6KyuoBm4p0+5/WAP+UIxXC2sROGW3VcOQZ5uchzNjoTais6wT1+nCZU0MlcsR+qX+pGCwo84FX09o/wFrULBmsrxASPyjdXJjqlIwwqf8AStIPh2u2usipKyeYof9c8I8R4C/kMXvUluI3xlCgW28Uo1tjyqLvlQm/LiffLSTeDQxxEE4t7fkyp8X3EcTr+3XOV9Fk4pLDrsHSSN8NWww59fIHtyg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 02:50:10.3462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7b2de1-19b7-446e-c672-08de6aaa9ab9
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR16MB6763
X-Authority-Analysis: v=2.4 cv=Se/6t/Ru c=1 sm=1 tr=0 ts=698e916a cx=c_pps
 a=vzG6OqJaKuDO37FI3iuMvQ==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=cbNQJ9GKAAAA:8
 a=CsCi3mX3UFN2opcwia0A:9 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-ORIG-GUID: qebA1s16s7xsMUXS_9H3VKTfCrVkljWu
X-Proofpoint-GUID: qebA1s16s7xsMUXS_9H3VKTfCrVkljWu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDAxOSBTYWx0ZWRfX67lFaBJ8teOT
 T9u6iIO8mpV6+BqMA/Cjh92lsjfK/I706B1btYYSF/XTFmUA9xVcuxQZrgZbkO5/8nhXhxEG3AI
 Fc+AjsJQJ8ehWVD5KIYf3bGxEs6GkLDoxcCyncqMDHcZ+2J6zi82pbhXLZ993SHhA0iH0X2QUQT
 vZtCGoCJdObwqfS3s1mg8RRmUegCVQTuZ6BvZ62xzpkgvW6UipuPVtHHrc+muTXTwO2pExFeW5G
 EkGwbOm3nmHawXG4/YS/9giVTY6UFrgFHfhFsSNfCsnIjBcP06R3MCKueKagFGEX7SG2dQ1XVUK
 xq0YdMxz2b/gu1z0isYs4m5qf4RA2QiXf07qtASPRfYiTnd+N/tjI1Bh+FosTKIz+xM3/5woSGV
 hx0rNaEbZJxsGkHUq8hOw62NzDDyYWOcngt8jrT6H5lj1VHOrd+rriUeaOqDVisuKhGC9db9Gs6
 g3skd328Ez+s2fVissA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130019
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[azureford.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 66D7F1327A5
X-Rspamd-Action: no action

From: Denis Mukhin <dmukhin@ford.com> 

Update hypervisor headers to allow vpci.c to compile in a host build
environment, as required for the vPCI unit test.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- new patch
---
 xen/include/xen/irq.h      | 2 ++
 xen/include/xen/list.h     | 2 ++
 xen/include/xen/numa.h     | 2 ++
 xen/include/xen/pci.h      | 2 ++
 xen/include/xen/pfn.h      | 2 ++
 xen/include/xen/spinlock.h | 2 ++
 xen/include/xen/types.h    | 4 ++++
 7 files changed, 16 insertions(+)

diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index 6071b00f621e..f7fa1d0fa29b 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -1,5 +1,6 @@
 #ifndef __XEN_IRQ_H__
 #define __XEN_IRQ_H__
+#ifdef __XEN__
 
 #include <xen/cpumask.h>
 #include <xen/rcupdate.h>
@@ -208,4 +209,5 @@ unsigned int arch_hwdom_irqs(const struct domain *d);
 void arch_evtchn_bind_pirq(struct domain *d, int pirq);
 #endif
 
+#endif /* __XEN__ */
 #endif /* __XEN_IRQ_H__ */
diff --git a/xen/include/xen/list.h b/xen/include/xen/list.h
index 98d8482daba1..06d2fa3aed15 100644
--- a/xen/include/xen/list.h
+++ b/xen/include/xen/list.h
@@ -7,8 +7,10 @@
 #ifndef __XEN_LIST_H__
 #define __XEN_LIST_H__
 
+#ifdef __XEN__
 #include <xen/bug.h>
 #include <asm/system.h>
+#endif
 
 /*
  * These are non-NULL pointers that will result in faults under normal
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index f6c1f27ca105..80d60fd49178 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -1,5 +1,6 @@
 #ifndef _XEN_NUMA_H
 #define _XEN_NUMA_H
+#ifdef __XEN__
 
 #include <xen/mm-frame.h>
 
@@ -152,4 +153,5 @@ static inline nodeid_t mfn_to_nid(mfn_t mfn)
 
 #define page_to_nid(pg) mfn_to_nid(page_to_mfn(pg))
 
+#endif /* __XEN__ */
 #endif /* _XEN_NUMA_H */
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index afb6bbf50d05..f52dc7875e16 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -14,7 +14,9 @@
 #include <xen/numa.h>
 #include <xen/pci_regs.h>
 #include <xen/pfn.h>
+#ifdef __XEN__
 #include <asm/device.h>
+#endif
 
 /*
  * The PCI interface treats multi-function devices as independent
diff --git a/xen/include/xen/pfn.h b/xen/include/xen/pfn.h
index 1ca9b095e0df..98ff669d7def 100644
--- a/xen/include/xen/pfn.h
+++ b/xen/include/xen/pfn.h
@@ -1,7 +1,9 @@
 #ifndef __XEN_PFN_H__
 #define __XEN_PFN_H__
 
+#ifdef __XEN__
 #include <xen/page-size.h>
+#endif
 
 #define PFN_DOWN(x)   ((x) >> PAGE_SHIFT)
 #define PFN_UP(x)     (((x) + PAGE_SIZE-1) >> PAGE_SHIFT)
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index ca9d8c7ec0a1..ad5094c4eb92 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -1,5 +1,6 @@
 #ifndef __SPINLOCK_H__
 #define __SPINLOCK_H__
+#ifdef __XEN__
 
 #include <xen/nospec.h>
 #include <xen/time.h>
@@ -360,4 +361,5 @@ static always_inline void nrspin_lock_irq(rspinlock_t *l)
 #define nrspin_unlock_irqrestore(l, f) _nrspin_unlock_irqrestore(l, f)
 #define nrspin_unlock_irq(l)           _nrspin_unlock_irq(l)
 
+#endif /* __XEN__ */
 #endif /* __SPINLOCK_H__ */
diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index 73ddccbbd5dc..e5d702b48ac0 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -4,6 +4,7 @@
 #include <xen/stdbool.h>
 #include <xen/stdint.h>
 
+#ifdef __XEN__
 /* Linux inherited types which are being phased out */
 typedef uint8_t u8;
 typedef uint16_t u16;
@@ -15,6 +16,7 @@ typedef uint64_t u64;
 typedef __SIZE_TYPE__ size_t;
 
 typedef signed long ssize_t;
+#endif /* __XEN__ */
 
 typedef __PTRDIFF_TYPE__ ptrdiff_t;
 typedef __UINTPTR_TYPE__ uintptr_t;
@@ -33,6 +35,7 @@ typedef __UINTPTR_TYPE__ uintptr_t;
 #define NULL ((void*)0)
 #endif
 
+#ifdef __XEN__
 #define INT8_MIN        (-127-1)
 #define INT16_MIN       (-32767-1)
 #define INT32_MIN       (-2147483647-1)
@@ -52,6 +55,7 @@ typedef __UINTPTR_TYPE__ uintptr_t;
 #define LONG_MAX        ((long)(~0UL>>1))
 #define LONG_MIN        (-LONG_MAX - 1)
 #define ULONG_MAX       (~0UL)
+#endif /* __XEN__ */
 
 typedef uint16_t __le16;
 typedef uint16_t __be16;
-- 
2.52.0


