Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yND8Ho5fjmm1BwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 00:17:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C1B131B22
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 00:17:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229999.1535625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqfux-0005so-04; Thu, 12 Feb 2026 23:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229999.1535625; Thu, 12 Feb 2026 23:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqfuw-0005pk-Pu; Thu, 12 Feb 2026 23:16:14 +0000
Received: by outflank-mailman (input) for mailman id 1229999;
 Thu, 12 Feb 2026 23:16:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=361u=AQ=ford.com=dmukhin@srs-se1.protection.inumbo.net>)
 id 1vqfuu-0005pV-IF
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 23:16:13 +0000
Received: from mx0b-00498f03.pphosted.com (mx0b-00498f03.pphosted.com
 [148.163.143.241]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce9304f1-0868-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 00:16:06 +0100 (CET)
Received: from pps.filterd (m0367129.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61CJfntj393177
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 23:16:05 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11010067.outbound.protection.outlook.com
 [40.93.198.67])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4c9kkqtqt9-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 23:16:05 +0000 (GMT)
Received: from BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::17)
 by PH0PR16MB4842.namprd16.prod.outlook.com (2603:10b6:510:141::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.12; Thu, 12 Feb
 2026 23:15:57 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a03:59d:cafe::32) by BY1P220CA0013.outlook.office365.com
 (2603:10b6:a03:59d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.12 via Frontend Transport; Thu,
 12 Feb 2026 23:16:09 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Thu, 12 Feb 2026 23:15:56 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61CMPD2p2547170
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 18:15:55 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4c6nag56yx-7
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 18:15:55 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id qfuavgi8FRfmuqfubvK5b6; Thu, 12 Feb 2026 23:15:54 +0000
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
X-Inumbo-ID: ce9304f1-0868-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=j2YFjvbnpWiD6dbaYMfZ6v4JY
	YjAo0KPA0hAPH7Eirg=; b=lCtmQiQWCoveV69A8ICC4QjMG4+ou7KvYbIANDm+y
	mFyDx6lL0xheyTon88Tr41yNySfIkWimNtQEPLFcsyJU38TDrUdA01pE7PDw1zKU
	DE9amthiKcN8bZ+OOWjqP3whTZBViQ/KqLWp8MUT2VFGhGF3NRW+tBBYtOTqLL23
	akGAAe4yfylg2JyVYtIvUYLdkOW1xBvwXv6zPq6gFt7kkVw40NF1a8wDR1mENMfJ
	K0KwiCvfolzwdZ2s2pI+phqB51bEEJaOTOz0Y9d68opb+JH0khSS0ff552ZswURA
	ELtqZzUpkRCYaskqeBjWLZalj1uOOpeNF8yyPYhx5Lljw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8Y4SBWwDzLncirl9Sn0QGYNKFRJ/xcLKsQt7lTNLbOTDRiXxSGRrd+ohX4ye/hyadhvuyDowM6ctDUZyTOFQwKTw1x4qmyCEMdMKgik2eK0fs3uID0kcXgHh4rrkdxNODMokQzDHms47xhKzBhmlTKrJ0IwZLZnDcnvX4g6nWYaOOKQAxzygpdRzg5ZZv1ACDF0yYqIy9H/hwFT1lsUSBEMD34T+JLUdwn5swU2183wdze5dVAqMaDe9+4IK75RaXS12EZb3sHl0TdRVlDS29kmi1ffQZGHgpXW3EnODKcYNneZ9yjanWw8d7HaMMiFakosNbWIZo5/q5x/nLVB7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2YFjvbnpWiD6dbaYMfZ6v4JYYjAo0KPA0hAPH7Eirg=;
 b=X6ITH6Wn3xh6XiCMf2ZkDm5C7r+tXrI+vuNvnrBtgeZ7CjWSrC4kDhObMDgtVXLraVwtqRSazHrOT2v15PZRsrtqaHhQ4HPZWFeyjhxhoTbYX84YV9rRH14OKt6R+MWBavd0T4orxMPh3agqLhEMbuyfPET5685v51ftutNB018Q3NboLIhVFhSrKZjUF5W3mwQV2J57f/fVb7OJMaDzxt8xcSYxRxiquOoPCHwsEDCDisHX11RM7+fSIjH7iapy4eiMB5Alfvkgyb3jMTxCqu6dnUUfiCSJ03wb1ax2UVV9uJMKr/bQpP4Jupz8YcNwWX0O8pkfSMuBujqvytTQQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2YFjvbnpWiD6dbaYMfZ6v4JYYjAo0KPA0hAPH7Eirg=;
 b=St5jcTcKS4rWV1axgYXUx7giDUL/bKMqaSYyyxjmPZILjlyqJjAETvQ9hAL5GQV30qqn73F5kjJRN9B+CrJrQ3UbtycQFG//yPXIZNSn7MWncf2ni0xLQWwEwAb1jToG5OhjlJXf7H4girwkriExJHPbpqSX9+vcgtR9eS45kjE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=j2YFjvb
	npWiD6dbaYMfZ6v4JYYjAo0KPA0hAPH7Eirg=; b=d9+YAw8hqivOx3BxuuF8AH2
	3A5+KpcVGxSdEiDreOjqBXz6YLsyywdiF71gfZdRJk0Kr4981XM1ehzeqnOdtRAp
	YpCHf6SM4qsDkX59ahD/c4yuvfM3wrhIPfCfVaF2k4SsI7HmPSunTVX33KxnqAe6
	ahQtixFqSLqRC+mOgqSm9CotYTG25jSwSyio513lnV/3wgPFneC4fCM6kB3J/29a
	lEw3QgUhbmlgKlROjcIdlLsPM9QxVhdY+Bnz0N9jg3xtZYeHzaxjSGVyjFaaHoqc
	Vmt+KcH+0L6MCAO5lQ9ZAbHrPVgPl6vLV8dfu7ahSaSM0h30eFgqtLhszOIn9MQ=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=j2YFjvbnpWiD6dbaYMfZ6v4JYYjAo0K
	PA0hAPH7Eirg=; b=AFo9oBHfqPS+xabTPH65HlImBklc7w5mRYHbqHCXSfLniqG
	TK3xzNq7UTm9pWpdK+4mGPiYRn42pFUnSEim7IBS1MvP9qNhexUvfpSzPar9vE3y
	ONae2WUxXqSLEOFXnJUMiiQQ1G8u263SEdLIFfxwCcSmC2kOEyU8btLqlGqp2xWU
	IrHwF+SJ6Ww1rw4D43+UHRp3Ids7XB7LM5D7yMu5xpnSIj8UlLPczLRS0wYpbRm+
	wUJvHvtgHGLbnqJbuSBB7sydCvfcc20UeN2Uj0Gf1j5S7DYKhvo6ejtvaXnKy9Q3
	qNokP0LmoqWkH+SADofE9U49yzUEuqQ4S5YeOmg==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: qfuavgi8FRfmuqfubvK5b6
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH] xtf: fix argo test parameters
Date: Thu, 12 Feb 2026 15:15:06 -0800
Message-ID: <20260212231504.3135755-3-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120180
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|PH0PR16MB4842:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e2e60f65-fa0c-47c5-a3c5-08de6a8cad47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ocyoaiyYGMAgIIHi+q83WMXbA5Dof/DcijmzCuLdLyjAQRzWRzTdIaAbra0w?=
 =?us-ascii?Q?1Q+T8TKbl/BwQ2uQsAdxg5/aw91CyNRW7AtfHj1MkFPXZHum7tLeYduo2Hwj?=
 =?us-ascii?Q?aFfaylOHK0MVuyWdFgaS7u0YKq7v2PwggBAvV+QCpE8pVHz6CB4CdfgVTK1D?=
 =?us-ascii?Q?7PHFE6VhvMngyxf06G0hC/1eus+g3sfqyZgjUiTtLcG3HjylqPWxk+aVdQ3A?=
 =?us-ascii?Q?+zw7My5+wv6oEimwg2J2sAsHW+QGuD8IssfZTdVwHUzrBGRaQ/ntUsGYYqT4?=
 =?us-ascii?Q?qudzhDZ8UWIkmLtsGXU51YhH0+XzkRElFxWTEVh2EsTEnYa6DwLpKQPKL0ul?=
 =?us-ascii?Q?7P2uGRupi7qiZpQ4q9JST7y5kBo7IoNVKDWb1z6/NvRqmDfpR4H/93rznET/?=
 =?us-ascii?Q?J+MSNGldKle0mz7rwp8xlg50EcJr6R5eWGeXohsracvziNh+NVkVYfpSzU+O?=
 =?us-ascii?Q?mRmTcw3gAeNWegHDdCmrVg6bNG6y0qMq9cK9vQBAYvbG7wufOkr/pw3uBjpE?=
 =?us-ascii?Q?PnuvVHB93R1NF9j4wBy/lalmyuW0YW7FUWuSusj3UwmEENewsNOG7IVbiX94?=
 =?us-ascii?Q?CwG8NM/sNIY+x2/wg/oDSP6tSfSE/vdee+v99pnoOOoqm/QCSng1hKQcilwc?=
 =?us-ascii?Q?ISWtEWRopi7YFBCHS489ELoVn4ZYQLLFESLcMkZRhyXKGEGeCmnugxep+YmJ?=
 =?us-ascii?Q?IbYnOTdnoec4G5GcRVnxVEcRPeodg+ZQKuMsfRq/xQ8XhFIBGOb88v9D4hzc?=
 =?us-ascii?Q?9YQKB7vEQnL4ULMMLHzyfGd4a9cL/QQS/b29uHqYXMOBjz6MypwX5n709EV6?=
 =?us-ascii?Q?d7I97d/BSCROwUUQnlXTkLDplgViJUDCQGKWzRyx+PF49Ps/bbnaxuTegno/?=
 =?us-ascii?Q?0AFtLadVerhvMK1AJ4AnnDtfUUCD33OayQbKQeolp7QW0kUwo1GSWyFl4ajj?=
 =?us-ascii?Q?Olc9LWrLIdHNIKiT7cjs+3V97MVyCe6BIROw2atkovYAQfMrXvq69zL2Tm0/?=
 =?us-ascii?Q?Vc55IbcOFnLaNZ/mr2I7mVqMWL9DLx30eIDuDYt1Eiix7Qhs4mTzlnDsO4jJ?=
 =?us-ascii?Q?RRAtDWR1sLon+mUwBmHLU59yLpzreF+CrzrNJIQiyhJHmT4D0lv9o0INm04b?=
 =?us-ascii?Q?K7/6998+X6CpfCkt9ioS5ZSFsBh4Nle7OiOSjkFS4vk+oHuIt/J0xQeX9Xd5?=
 =?us-ascii?Q?8GfmU0yBcz6WsShUere+/7QrGCCxGDI3Ylzi0VlAmNxERrpOJUT9o8zq6Y8v?=
 =?us-ascii?Q?qxXhEzn4rihf7EatmxrrMSf8LmgGSpxstH8DCdOO5jBP+wVQ5YJcUG5gO4zd?=
 =?us-ascii?Q?tIThrnYG98vDHJjyfgmy0Q5deSBXXh1FAB8D9AAPtkT7S2zXtF2hdMaGPBFd?=
 =?us-ascii?Q?NOWciu7sFMLX87sI23UlwtkdKu9uedkBzOocvOJ0SY6Go8rQX0bwVjXXbxIn?=
 =?us-ascii?Q?YdTGToC8YrfTU46SJIsgtsVT3tqCCwwAObMerFbbZg1t3rm4J5kniTY6oQpI?=
 =?us-ascii?Q?KeGV6CiyEKMPcOGYMQdzv5QaG8FFM07vVy7ELnKml1w90QbO20HC0SrO2HD3?=
 =?us-ascii?Q?iVZ6ua0jNougkiCTa9Sc6Q7JxYuHTTEWi9QjO2Xd0JdSrcI1gwYNz+lEBBAs?=
 =?us-ascii?Q?d6ap9+DzhX0VMWSB9znUbK2Q6YvGYBwjQmnGHPC/4XavmMA0OLndKMJticG1?=
 =?us-ascii?Q?XkTtyQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5AG8t7wBq4fqaCnpgPyb/7CCe45/LOvx2uLOnAbF+N8CdkjzAVEHEMw1IhxaZUFLLAJZSLcRLXcTOECmLTRLYoEPll/i6Ww9Cr1m/XzGQubOV2P4kgUD2t9yGuJnjRcOeFAz1MD0A0BEPsM9AxBRX5UYpS24oJ1TsIo+VYQookNVxL8xMv30REx6WKpzySeVjQyns/a5eIDh02XF96CZT+RCH7j+zm+CkwjBBbtY5FPm2G3aTqzUNd10V/XL+9uypAlCEa4e+Fjax+S4zVWpS1uRDpNX88ffaQ4zRjUOtBdMIbjRUZxB7SzyydaR7l2o2xmDUgwGq0plrkwrAEgZHw1Ik2YbcBkH5Z4Rp7WGYnS3MJQmJhKqMIs2IAQVCZCXhDHIYdIuG4xp3oUH2ezVjGYYB1eB+ifpUb1dqieEDhwPd5vWh1ISIa+ADPNkHMF1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EEsrE7VmTEWr/og1GDhqdBz6NPqQpWnsX5mah9h0Kfyc7wDKnaVaphpCCBmxA6NgsoZDnzIq1g/RKLWVMN/hVMeqhRNmJEAzRBmYPfK51uhTp6qad24NpAxGbdOoq1f/DdvRT5shpSUg2wyYg/LM18aQCtQ4DuohaKdRoQ89k7fe6miEdI8TlC7kZm4okqPua/Qgab6zv+pxZJkwDSeUJe9/cC2CSfwK2FD7gjXPyYA4S97A0C7+96OXSJH96Ln9VatdKGDAZlxVXcFLN0qD9qUKlUpQtMyCuOgw5vV66GtRe4/3sAC9xptmBy3K0+ONn1QZN6AoeO7zM9a6gL7+O3yj1F/t+iG+C4QTD8lIoKBT8x2LGMaJLr93JyevHghhnGcZsvzHxDR1yi+WktjafGRm+DNSGi7j3ffGHdIO/MBCgqo5nCCbwJnFvhqkoy8ycbi6L7da1+Cs3h2o1uYebXjjYUiwJ7kVxoSH9MLGQQz3KExg+4C0ftGlvqDdC6S9CEWEYXKfsvhpWvtc797tiDcISdL0/urVYCfNwMZve5EUkcx8SEl9pIw/jGIgps55rw4g2Y6PL5eMsX0mdYuolwRohA8TyQfOaQCkwb++DYvTKvldn6Jh4qOmje8Y9TgkQMc+LdOiGUnQ9EwmQibfrA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 23:15:56.5809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e60f65-fa0c-47c5-a3c5-08de6a8cad47
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR16MB4842
X-Authority-Analysis: v=2.4 cv=Le0xKzfi c=1 sm=1 tr=0 ts=698e5f35 cx=c_pps
 a=wCygq6uL5kGpubmeL3zaNA==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HzLeVaNsDn8A:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=p0WdMEafAAAA:8
 a=cbNQJ9GKAAAA:8 a=Xe60KI40nWo1VRH31TwA:9 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-ORIG-GUID: 1hFyxuoCupy0rhR1jVXEmdiQvp_sVv3h
X-Proofpoint-GUID: 1hFyxuoCupy0rhR1jVXEmdiQvp_sVv3h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE4MCBTYWx0ZWRfX+fXzUd+XLEEH
 6C1Uqtiw/HDeZDG7k281RkGgKsWXIMTy1UYxh9srbro50yGotBKuPfV6M9iJWsyT7q7Mnl3bVYv
 rkWxrwBJRTXCEaY/GxFMBbs0K7VXjcmTPjP/1vYDkcRfYwZhLF/JiaxRGU5trZh2lFQRwFGzrjY
 KQBDV6XUqQAFrLsZI0UX7/F08yxEZFqeaSt6Zc7jKv8SQRdY5SksQR4wY8DeUelkjAp7BVS+le5
 r7f+CIcmewcdqv+Et1R7Sbs58AbxB0M1Yyf1qve5Aa6bqAAzfWbGTMKITANSZqpo0KuB+Zd7qJP
 0/+VLkqEGKMPrpY9mn02SiDpnMRR+QETk1tsEN/dmGsl+NDTV8b066Ca7MCAYNDWEeSk9qHJIl5
 TiLigFSnoSELlkpvsZSRelGtM3TSjPoz0u+eN40YI0v28WCDLzi1vzLn0ipbpfCYXq4QxmISAiC
 +HAho8bfkHHPJyuHKdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120180
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,saarlouis.ford.com:dkim]
X-Rspamd-Queue-Id: 12C1B131B22
X-Rspamd-Action: no action

The mac-permissive= option is currently ignored because Argo configuration
parameters are comma-separated.

Fix the missing comma in the XTF test arguments.

Fixes: 150c6ef45922 ("CI: add argo x86 XTF test")
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
CI run: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2323076582
---
 automation/scripts/include/xtf-runner | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/include/xtf-runner b/automation/scripts/include/xtf-runner
index 43ff2d4d88c7..d1ef888465c3 100644
--- a/automation/scripts/include/xtf-runner
+++ b/automation/scripts/include/xtf-runner
@@ -69,7 +69,7 @@ function xtf_build_cmdline()
     local xtf_name=$2
     declare -a cmdline=()
     declare -A per_test_args=(
-        [argo]="argo=1 mac-permissive=1"
+        [argo]="argo=1,mac-permissive=1"
     )
 
     cmdline+=("${XEN_CMDLINE}")
-- 
2.52.0


