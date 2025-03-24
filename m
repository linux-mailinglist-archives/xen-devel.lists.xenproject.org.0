Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9965A6DC58
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 14:59:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925619.1328511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twiKS-00036q-4z; Mon, 24 Mar 2025 13:59:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925619.1328511; Mon, 24 Mar 2025 13:59:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twiKS-00034Q-1x; Mon, 24 Mar 2025 13:59:00 +0000
Received: by outflank-mailman (input) for mailman id 925619;
 Mon, 24 Mar 2025 13:58:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDgH=WL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1twiKQ-00034K-UT
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 13:58:59 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061f.outbound.protection.outlook.com
 [2a01:111:f403:260e::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2185e291-08b8-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 14:58:58 +0100 (CET)
Received: from AS9PR06CA0753.eurprd06.prod.outlook.com (2603:10a6:20b:484::9)
 by PAWPR08MB10306.eurprd08.prod.outlook.com (2603:10a6:102:358::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 13:58:53 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:20b:484:cafe::3e) by AS9PR06CA0753.outlook.office365.com
 (2603:10a6:20b:484::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Mon,
 24 Mar 2025 13:58:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Mon, 24 Mar 2025 13:58:52 +0000
Received: ("Tessian outbound 42ac64abf51c:v601");
 Mon, 24 Mar 2025 13:58:52 +0000
Received: from Lcc8d8dfb42d4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 77E924DC-FB4B-4528-B416-582DECA8B7E2.1; 
 Mon, 24 Mar 2025 13:58:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lcc8d8dfb42d4.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 24 Mar 2025 13:58:46 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB7919.eurprd08.prod.outlook.com (2603:10a6:20b:53a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 13:58:39 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 13:58:39 +0000
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
X-Inumbo-ID: 2185e291-08b8-11f0-9ea2-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KI5PAuSD/GKpXvpS3BL4X8oUcUWKETj4Xpg6PjMEoGvJAB1f5F2vJd0Rh7QEapafE8N686/8DnOIvTnscqTvMjixYiDZMKddX2fwRRKQbud/Zj29e67sQi8OqR2YhBLgrjfHLOL8kCcAAYN/ug6etcAglPRvahG1pOWQ9FULpgCjkL5x6uY7bj8fuw7qqw94FVij4uDnH90X9HJWvcbB7nvEqse+hPmV4xlyDMfntaKLYnlyGJ60ztZhPQmyGLRwVZ60z3LmUv+lhrCjHReUK7213WBGsK/JIcSz3MKkx9j3s+Iw9zK6m3HUMCWqyly5g6iSKStJn/RlD8Xs9N3mRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIhbcHI9JZDchcX+DEYk/gpB4DoxlNB+H+U4laZ6O6I=;
 b=f7B8yHYAbcNaJgbCOiMXd4hozTYKSu0xzjTvJoZKCPWBMywcdiyOvlMK9dYhQt4LGGkaCF2q0Xrf5Nb9cg/zGlShk1IeaAwItwA3o0pbHqGr1Df8EnB2Jgjm48+m5L7C+mKfXNTf5AazF/rqDScAT2GlnF66JKOx/4NIwV29843jNkNsI9E8VkESQ+zSbza0AxiEknCTtTOhKN9yXhE7pF3/92LJUFM5XUNjrmecjr8xGeiv+VG9LVBSzt++BC0eIQZzmDIR6wYpNxmEIa/AyV+G3f1ecMoJg7g2rd8Ko3heYBCwU2FGVODGHaQnA5CIOX/VSHFoldyaN1empduUhQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIhbcHI9JZDchcX+DEYk/gpB4DoxlNB+H+U4laZ6O6I=;
 b=sO9GujMau/rS6MMRKBN3S0jzoJiyKIrU2SwS+SdDrvOPOHVQlbxPZA8H/RxxTYttoN3+JNwHorM86cQC36Z1QEQWZoZik6dkW4ldZbiGe6mELxZZPLqZX6mppFk/3nFLT5fVtiiKufJWxRWumOYrAsRTc1+Mi7we7cUVfKLg5vk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f7dfcee01754b076
X-TessianGatewayMetadata: ey3zCXCbtdkolNCn/HP0Td75vzD4m7hmz6GXoPDq6LY+GpbZt+pQ71fCpUumYoigCNTfpBL7Yc+YB0g9aWkhXGF5tSbWc4eGP/SJe7BeJjeGF3gHpDMl2CBvO204GjIdDl/QsmCs5G3y0tZlc8cZXRmMrzcUS0SCc21xETiR7k4=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmuJaM7ywbJ9z9GCwOgr4iEOh9WGdzBC7IYAeq+/67gcnIcBhnZLxulCZmiqIxka8x8PBcIgmOfM913/for21l8Tob4AdrSf1sek74rM13aJc96cRtT1Vqfg2Ir6Zl3YKGC3BB2fAjcBfysoBH+RqYAmzYfPJoftUC1rAnf470sucMfPUcbbmYu4+EY1RrcmoFF1UP3dsxzOI8cDktfjtVsrY+SkpQqRS0tztc08PK1IG+bsg3qDrob4A6gS1saR+BVIWM4QsouUBF8nyIKe4JhEHEpkfu+Et9l4hz0xXDui98EMbbYS8q+AR3j1Ijst5VtRqL5FgvHd7uCyZD0vkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIhbcHI9JZDchcX+DEYk/gpB4DoxlNB+H+U4laZ6O6I=;
 b=ZmM1Q4a1eJHgNUu/REh45i+iAM0QpETR+azDhmQUX8w/lZqMbidX48QANUwZfacvbFFDQOY3iXrxJgyU0d3E0OoOJSDe95VhVugqPyQ4CYVfwy6Zmp+JhpZ9rH5bXtzjFDDyqS/DFi8T00qxgvMipplyTXWqdo63nVNay5+qG04JKDkf1ZjINm3wtQWmRBuJwG3y0KlUh1UkV33JH7z8vAY68cfONjSvVy4nS+lWqRgbUg0OoEsHGY1PuGdmHLHLbtqotrpUvdNPGGIlfXsogsT8671I/1md//i3DVtzgFYi5Uw9fHdRh29DJv4C3OMd8XoQz0TrnLvQ9yHsZMUEcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIhbcHI9JZDchcX+DEYk/gpB4DoxlNB+H+U4laZ6O6I=;
 b=sO9GujMau/rS6MMRKBN3S0jzoJiyKIrU2SwS+SdDrvOPOHVQlbxPZA8H/RxxTYttoN3+JNwHorM86cQC36Z1QEQWZoZik6dkW4ldZbiGe6mELxZZPLqZX6mppFk/3nFLT5fVtiiKufJWxRWumOYrAsRTc1+Mi7we7cUVfKLg5vk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v4 2/5] xen/arm: ffa: Introduce VM to VM support
Thread-Topic: [PATCH v4 2/5] xen/arm: ffa: Introduce VM to VM support
Thread-Index: AQHbnMQnVQCSJAleWkGtVlVLXLrx+bOCUBoA
Date: Mon, 24 Mar 2025 13:58:39 +0000
Message-ID: <A5ADD7FD-5FBD-4BE5-9428-A69719A2ACBE@arm.com>
References: <cover.1742824138.git.bertrand.marquis@arm.com>
 <8f0928b4e94b47d6fed201dcd8cfb1068573b297.1742824138.git.bertrand.marquis@arm.com>
In-Reply-To:
 <8f0928b4e94b47d6fed201dcd8cfb1068573b297.1742824138.git.bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB7919:EE_|AM3PEPF0000A795:EE_|PAWPR08MB10306:EE_
X-MS-Office365-Filtering-Correlation-Id: 69278c6b-f413-4490-928f-08dd6adc02cf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?cc5Md3AJFsoq/1ojfZkArwPM4O9d87dsebtMCnX/4S1R2G4zKCG7QGMgq6X1?=
 =?us-ascii?Q?2ZSeWvH5rem3gs1BMYHRrflEuT4laYGyBCeykmAr7ZDNVSv+8iQ1tM5ildcQ?=
 =?us-ascii?Q?IID/X+ObDw7R9TSVhCKwN2Cn5OP2ds1uMDTpdo+TLWSHXzwI49I6y/AaCu7m?=
 =?us-ascii?Q?YoO/6/SeGMajOos9wSpOGDmonpzIFT/ZjRaOaTKECHMwoEdbnHgvX0W610OM?=
 =?us-ascii?Q?VLCSKMsTZDyYoi3atQ2na+nZV+JsNk8EuizIlOnJCIpapDXPuXPLRZTz2ZJT?=
 =?us-ascii?Q?+RWsCwxD1vyq2sy4ub2oh06NFlXqfL3Pyk93fmM1PfIrFqOrBNnPRW2blwOg?=
 =?us-ascii?Q?jz1rt7dmkbzhsaGBFGgm3sNxZX/An5uOZXwM32WV2m/wVdeJVzH4tfr7mDyF?=
 =?us-ascii?Q?Y0JwOv5DEfwZlpFmEas59jBAIJLigyzBil985/RdPdm+vTOfXkwvgzKpWBoj?=
 =?us-ascii?Q?7RFbYvUeGbpKs346dXGm3iAz6M2fEi18B/ZGaaCzxW6DxQLeEwpsovloGiV6?=
 =?us-ascii?Q?VkMS5yQnyA7kOtOapUGuh8HQWG9v5R0816OhlrbkNhNL6KT+32hA2MIqSjee?=
 =?us-ascii?Q?chPY9HC0SFPEUsZNwvqXeT0kfT+cqtmdB3L55RLGetiyFTwqDSTQiSVdYO75?=
 =?us-ascii?Q?xURd+57BywOkcHJedy8o+Lx+6UJBdjcdbf3iPsfWOA6da/NiEvJmgRVYIv7b?=
 =?us-ascii?Q?3X1OFhvHJU0D2CbIS2X5eOnNLu0Bor7eV+bVfTQdMUU0rUxcsYPLG3pco56w?=
 =?us-ascii?Q?mNQ2UZVRNspd4gUyJKl5ElMe1BD4qkyTgqafrBCATMIJoinU+wEPcuWdZSG0?=
 =?us-ascii?Q?BfGHsJ7LXW5vUR/uwMDP1EH7nP+pesEsyfUs1Rq/rcY+l5goYiL3BXXvLPFe?=
 =?us-ascii?Q?nueS/M0ML3IL5dO1QbaSrKucK4F4paL3sPY3+CY7xkvFdoBR7UhF+CNn1H/5?=
 =?us-ascii?Q?R8qYajo/x2yQyflPGQpdvAiHhJGszyYj0XDxJlvB1P6envbrOElT2/mjJzo7?=
 =?us-ascii?Q?lOVkODhlx8WnA9SUS4DyUGb3zX/cMXvo4bJWb7WM/INvX8ueuah6wzsxXprG?=
 =?us-ascii?Q?8vQK0IGx6wCKPhulY2GCMe+R28B49bkuIjUDG46bQ6HplYopEtHGqbvJ6M6L?=
 =?us-ascii?Q?ScZDLYScU1w2meMHCoP/JB6OIv1jFOC276ChPRkRyvwyp1L75Ir/1ejVSUkP?=
 =?us-ascii?Q?KgtZOY0/SSUMvyLMfdcppJt8cHQhcL50HnRBxqzVtw7BBdTxy2kMdOk0M5xS?=
 =?us-ascii?Q?HEhBizacoj+wJSz2d9v+rRIAFFVbScTmdvsGw4jNVwVVgWjyIhLBDD8Cxr+b?=
 =?us-ascii?Q?5KxIqik3j4qOuZMxZP7bWS2LM7Hoxy3g4MZh3Pl/6mVPcREoD44VLhSBtfNu?=
 =?us-ascii?Q?HRh28POg5Q7eS7iQarcrCBNGJvewnI6JEmxOgxAC+9NOuvwVHfCSWKVlAS0r?=
 =?us-ascii?Q?2K4KIYeXrGgb8sCHk7gGa+qPm1zRnA5w?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <48112FB32C0A1F4EA636CAC87ADF773A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7919
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d2e0a399-2414-48aa-5e53-08dd6adbfaa8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|1800799024|82310400026|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?daNN1gsEfq+5jERILr9LysjmoUt6bA5xzj2TzKkHLrCyn+HOASoFr6fIUapO?=
 =?us-ascii?Q?BsccW4S0+ICsYP63b1xNj1PS9vgdsfrMxU+U3myVVREMgecxcl5htqq4AZzO?=
 =?us-ascii?Q?MtCLgYcZq8XJ3mpCfQvjdczYzUNqzzADFK7AzNLsVxMhhMz7lW8RQZ8kCsrE?=
 =?us-ascii?Q?uGlmXEZWazDvetZcz4c0KIvpPiUf5NE2Kk2InSoyyNoKNPOaBsW/wyiT/6T0?=
 =?us-ascii?Q?qe9Mir3b8yDx51zpKY0ikyikrCvVNxBWEqFZl/zr0VjOvBCCwsI5M+3hoEm3?=
 =?us-ascii?Q?KB5A+tvUDFAPDKYG8c6WqP7Nz0pUDgi8vuV+8zJY0KBX1BSJGciD5EUEeLfX?=
 =?us-ascii?Q?/Z5uQ8OchYCpBosX4nuLReVGkNkzax5RisMAP6fxgA1Q1gyYbOU5cYPhXsaU?=
 =?us-ascii?Q?EnSxoFt+BLWl7+iu2ouX8ehpG2ipWF7o6BNgJsVDMsPjesQZBEA7iLaKJl7U?=
 =?us-ascii?Q?5Z4fCLiViysuTr12+QMA8KATBbDbWOfROEcgkqwTQ5yy7qQtFAM41Qv3sbwT?=
 =?us-ascii?Q?6M3GaegQ3GebzkdoJahpNF4LNOeJgDHz1hvMKVnMxjlmeBR3+IomLneIC4et?=
 =?us-ascii?Q?aiDQpg+lGHFUtVp4F8ONUD9KvhK5+fAFmteytR5N8IdBgjSasmA560B8WPxn?=
 =?us-ascii?Q?vsjnuRyMTPsSci+6m0v2kym5qP25XoLWD23jTaqIPzQU4QFgKue+W3ak7Rfa?=
 =?us-ascii?Q?f66ejVKjwfu6l5tYjXlzmPTmIlLKp+n0YvAQ0rPppOQPdwT6wBAqR2hSZIlf?=
 =?us-ascii?Q?3KBpGqOaWfvsxVNeepyijtJ9s3CLlmAsYhP99jdXga9bg9IuZz2gajgg45xh?=
 =?us-ascii?Q?N8FrzGr64S2hcGarR58ZWBbNdiZfFOMN2YAtxaNuJJJSPfNJrwlbT95Lq7UE?=
 =?us-ascii?Q?NP62RpZNlvKR1wxU0mSse69eyCj9erSU/uPbAv6s0AGuqKbZHAugwJgIo/lo?=
 =?us-ascii?Q?/ryZTK1fBYw2HggINYXn5mDw2jTl/v7RmjH6//24jst6NsqZDyXKD1Gg+veW?=
 =?us-ascii?Q?eAX286mrkuP8YCWtKxdwYnWdQ5CoGdyEx3JKebACRmZFrXUpg7qC6wIuzeHo?=
 =?us-ascii?Q?d1Uv741taxsyNsIdczsdqRXxRl22uBOG3C6m3pBrcjUdTHBZVrUg9h25d3rZ?=
 =?us-ascii?Q?PZb8WZTAyq2OtV9mrakfZwYBN3uUYp/uXsnDgVR6qGuYbcf6crm86oX6YQ4F?=
 =?us-ascii?Q?VnePLd880a/lr98455X2tKfgBse1GOKK2xWyLXri3ZcUOORnWq20s8xCc6IM?=
 =?us-ascii?Q?ld9IurMDTBCwjKjcXlhmmnyIgNrb8CUtDi0O9edJIi41f10FUaatyx2sBIct?=
 =?us-ascii?Q?jKygAY4iFEkineX6kzR9EmrpeN/yf1msoYLNVGoKJuz85/Q6XB0JHZKQZy7t?=
 =?us-ascii?Q?BBxR+CLCj2jeT/gL5epEAam/xIgAwaUZTxeGmpMMGp7mdgQykU+00l02E2r7?=
 =?us-ascii?Q?lsUrDuMR1feqV0BZ2eYqIKglP6MLh4bkkY8q2YPEIJ2xwrpzTZC96zU0Mn+5?=
 =?us-ascii?Q?NZyMlTFo6FD4iok=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(1800799024)(82310400026)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 13:58:52.8360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69278c6b-f413-4490-928f-08dd6adc02cf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10306

Hi,

> On 24 Mar 2025, at 14:53, Bertrand Marquis <Bertrand.Marquis@arm.com> wro=
te:
>=20
> Create a CONFIG_FFA_VM_TO_VM parameter to activate FFA communication
> between VMs.
> When activated list VMs in the system with FF-A support in part_info_get.
>=20
> When VM to VM is activated, Xen will be tainted as Insecure and a
> message is displayed to the user during the boot as there is no
> filtering of VMs in FF-A so any VM can communicate or see any other VM
> in the system.
>=20
> WARNING: There is no filtering for now and all VMs are listed !!
>=20
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v4:
> - properly handle SPMC version 1.0 header size case in partinfo_get
> - switch to local counting variables instead of *pointer +=3D 1 form
> - coding style issue with missing spaces in if ()
> Changes in v3:
> - break partinfo_get in several sub functions to make the implementation
>  easier to understand and lock handling easier
> - rework implementation to check size along the way and prevent previous
>  implementation limits which had to check that the number of VMs or SPs
>  did not change
> - taint Xen as INSECURE when VM to VM is enabled
> Changes in v2:
> - Switch ifdef to IS_ENABLED
> - dom was not switched to d as requested by Jan because there is already
>  a variable d pointing to the current domain and it must not be
>  shadowed.
> ---
> xen/arch/arm/tee/Kconfig        |  11 ++
> xen/arch/arm/tee/ffa.c          |  12 ++
> xen/arch/arm/tee/ffa_partinfo.c | 274 +++++++++++++++++++++-----------
> xen/arch/arm/tee/ffa_private.h  |  12 ++
> 4 files changed, 218 insertions(+), 91 deletions(-)
>=20
> diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
> index c5b0f88d7522..88a4c4c99154 100644
> --- a/xen/arch/arm/tee/Kconfig
> +++ b/xen/arch/arm/tee/Kconfig
> @@ -28,5 +28,16 @@ config FFA
>=20
>  [1] https://developer.arm.com/documentation/den0077/latest
>=20
> +config FFA_VM_TO_VM
> +    bool "Enable FF-A between VMs (UNSUPPORTED)" if UNSUPPORTED
> +    default n
> +    depends on FFA
> +    help
> +      This option enables to use FF-A between VMs.
> +      This is experimental and there is no access control so any
> +      guest can communicate with any other guest.
> +
> +      If unsure, say N.
> +
> endmenu
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 3bbdd7168a6b..e41ab5f8ada6 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -464,6 +464,18 @@ static bool ffa_probe(void)
>     printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
>            FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
>=20
> +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> +    {
> +        /*
> +         * When FFA VM to VM is enabled, the current implementation does=
 not
> +         * offer any way to limit which VM can communicate with which VM=
 using
> +         * FF-A.
> +         * Signal this in the xen console and taint the system as insecu=
re.
> +         * TODO: Introduce a solution to limit what a VM can do through =
FFA.
> +         */
> +        printk(XENLOG_ERR "ffa: VM to VM is enabled, system is insecure =
!!\n");
> +        add_taint(TAINT_MACHINE_INSECURE);
> +    }
>     /*
>      * psci_init_smccc() updates this value with what's reported by EL-3
>      * or secure world.
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index c0510ceb8338..406c57b95f77 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -63,9 +63,156 @@ static int32_t ffa_partition_info_get(uint32_t *uuid,=
 uint32_t flags,
>     return ret;
> }
>=20
> -void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
> +static int32_t ffa_get_sp_count(uint32_t *uuid, uint32_t *sp_count)
> +{
> +    uint32_t src_size;
> +
> +    return ffa_partition_info_get(uuid, FFA_PARTITION_INFO_GET_COUNT_FLA=
G,
> +                                  sp_count, &src_size);
> +}
> +
> +static int32_t ffa_get_sp_partinfo(uint32_t *uuid, uint32_t *sp_count,
> +                                   void *dst_buf, void *end_buf,
> +                                   uint32_t dst_size)
> {
>     int32_t ret;
> +    uint32_t src_size, real_sp_count;
> +    void *src_buf =3D ffa_rx;
> +    uint32_t count =3D 0;
> +
> +    /* Do we have a RX buffer with the SPMC */
> +    if ( !ffa_rx )
> +        return FFA_RET_DENIED;
> +
> +    /* We need to use the RX buffer to receive the list */
> +    spin_lock(&ffa_rx_buffer_lock);
> +
> +    ret =3D ffa_partition_info_get(uuid, 0, &real_sp_count, &src_size);
> +    if ( ret )
> +        goto out;
> +
> +    /* We now own the RX buffer */
> +
> +    /* We only support a 1.1 firmware version */

This comment should have been removed.
I will fix it on next version of might be possible to do on commit
if there are no further comments here.

Cheers
Bertrand


