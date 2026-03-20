Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP8kGSMPvWkz6QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 10:10:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C894C2D7C95
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 10:10:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257897.1552144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3VsQ-0000Aq-Fd; Fri, 20 Mar 2026 09:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257897.1552144; Fri, 20 Mar 2026 09:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3VsQ-00007e-Cn; Fri, 20 Mar 2026 09:10:42 +0000
Received: by outflank-mailman (input) for mailman id 1257897;
 Fri, 20 Mar 2026 09:10:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GknJ=BU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1w3VsO-00007Y-9a
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 09:10:40 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a881b8bd-243c-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Mar 2026 10:10:37 +0100 (CET)
Received: from AM9P195CA0005.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::10)
 by AS1PR08MB7538.eurprd08.prod.outlook.com (2603:10a6:20b:482::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Fri, 20 Mar
 2026 09:10:31 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::1d) by AM9P195CA0005.outlook.office365.com
 (2603:10a6:20b:21f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Fri,
 20 Mar 2026 09:10:24 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Fri, 20 Mar 2026 09:10:31 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS8PR08MB8442.eurprd08.prod.outlook.com (2603:10a6:20b:568::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Fri, 20 Mar
 2026 09:09:27 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9723.019; Fri, 20 Mar 2026
 09:09:27 +0000
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
X-Inumbo-ID: a881b8bd-243c-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iXNHUQpwbz9K9e1mL3ZlwzZxVxWj8bP41MzOkgqU9k8Z0t/DB1SAIkNdzUvxCT4p8lKig7L3GwjL7RwRt/3+MK8WPV5vBn6aapC3ts3sIFicwxPUrFJZob4uEW2Q9qxKkfppRBoJApGS/i1E10LcI/bL2U2yDCrrU9HBTeGGytSVbtyWjXJx+yvyLV1DBpADFcsg2LDii5+kPiG7FfZLZZ0dBaqy1J7wudgey/wqku4hvsIFmCzwIgeHHJp+7sECOfzvcTfWmnkicoSqQMLGK+104pbQLd2JfmvQ9PyjoR/WNjK8Xn9XyRJNze7/8xRQFH/y0DMZ6Z02Ev9B2QVXFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8snH/ssz8nnANhJ2IOTzoWuv6JRMcs45u+juXqa06w0=;
 b=IBD5JicI46Fcro5sbH0V+6yTDL3Oq1uoC0VW0Jhmsx8fuYUfoLQUdXLTDP7gAuArdMZyv88z1yE/QLvWcCBZhtEzoGf+Gc4x0xZWrRQ2t8If8zhwTXF6LHjdk9yfbRn3psVf4KivMYqggzi4RF4pY4/vBc4q6Qnbllr2P3hRgQk/gsSuC9PaXwHU+KdqO6eJHLfFoHayuSuwWX+obyT6EsQsg5SP9KtW7RgIfogguvmtHcE+l+kRhu40a+oHD9KqRHpsj5+HDCER1j3Q4WjfEuF3Qz2iSeYVLtoZ9EJUf5ziInAh7XvcWC+pdoQMEWt1GAEonfunsGsfwEaywZdj6w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8snH/ssz8nnANhJ2IOTzoWuv6JRMcs45u+juXqa06w0=;
 b=X6cnqFxyCv5F+OtiRBtL5VGAtQiEcl3y7Dm+Kb98OSd82LrjLGe1LvdNQgQ5LIwYb4/LYGoLgjDNi3TOo8dkyIbzlCYFsLh6nknvhFWihF6a3K+IxMNUJbkYKHpcbTaDtAzsvRr7zDUd4tYaFSVUOEQhL8Ize6LU/anJzAs5JA4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AkYbeCT9ajo2oJsQes+lAWXsYWZbvDT1XkT6xv4LAowa8VRgcyGXlrNVWmHFgwRmxNweuScYhWX4XFglXZFkO8/5gizn2wbwz2bMtt1cVFw3M21Po5slYd/gwemMC9d1cAUX1YJbOueaPNk3xN3b5U6TbL4svMvzWLdF/f38Cvy/Vu02uxN7h/fPJtKexzpUw5ztRdEymeTOQKzjnqyg5JXuJSzNCooVNe1+Dll6mFomoSPvMWrEcXIdoPkq/QN7qPm8WRgXg/Xd34yeUKVxbBXeuicLdQV9L5xWKKjlEhk0i2W60ofJjCllAsdD3E9HbEB9FnCvdNXXye06/RpIgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8snH/ssz8nnANhJ2IOTzoWuv6JRMcs45u+juXqa06w0=;
 b=Va8xLoJHQGy0+IFpc1SSujXnp0Axn8+6NIct9xzkgOjN0fSuS9NjwKV8VMIm/+3BMss64CRL/iqh/WI5iY3uRthbsEd//GV1RI22b0QtV4ex5gxtPi1KvEPXu1alKUQsRgf8dyWnCBisTO41sqRcRgl9Q0jQxw25liPZDOur5SASGRtRwGoleQSAZD3d6yq+tQsp1mR1vQDPkJdmBB6d21WiLWnjTLpAjXwdt++Klja31vNxCLjd1zWe1hmr9MCr5zsi2I+6Nld7A/J/t9+O1nSsIYbUi/D3aMRatJOnSJ9d6eBdBuUpekX61AFJKIw+wKFolQcSpcAyGT+OaTvu1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8snH/ssz8nnANhJ2IOTzoWuv6JRMcs45u+juXqa06w0=;
 b=X6cnqFxyCv5F+OtiRBtL5VGAtQiEcl3y7Dm+Kb98OSd82LrjLGe1LvdNQgQ5LIwYb4/LYGoLgjDNi3TOo8dkyIbzlCYFsLh6nknvhFWihF6a3K+IxMNUJbkYKHpcbTaDtAzsvRr7zDUd4tYaFSVUOEQhL8Ize6LU/anJzAs5JA4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jens Wiklander
	<jens.wiklander@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] arm/tee: rename variable to address MISRA C Rule 5.3
Thread-Topic: [PATCH] arm/tee: rename variable to address MISRA C Rule 5.3
Thread-Index: AQHct91SP+heAl5ESUaIOkxQ7VfzerW3Cw6AgAATegCAAAQygA==
Date: Fri, 20 Mar 2026 09:09:27 +0000
Message-ID: <A4A7BBA7-C5A7-4D37-B549-1F738AE018F8@arm.com>
References:
 <e7fd1f75146e7faa520414c4ffc1bd9572914039.1773951370.git.dmytro_prokopchuk1@epam.com>
 <2E014D71-DFD1-46BD-9715-D6EEB0E3ED31@arm.com>
 <73aa8397-90b8-41ea-89df-05317499489f@epam.com>
In-Reply-To: <73aa8397-90b8-41ea-89df-05317499489f@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS8PR08MB8442:EE_|AM3PEPF0000A78E:EE_|AS1PR08MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: d941d4b8-c1c1-4908-ccd5-08de86608974
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 fa9UL1w2Lzt/K7XtRIlznPwIhp23I5lIRBhzZOOnv+ai8kTC+zzZM0r7V4hOb5Xasy/NxAooQvOqaant7xJTxnPzzdf0bqcD2cIz51r7BvyqhEQUEcwOsi6l6Kei2Ba3r/TjtXKPes6LbiAyyWWm6FhlUyy1fbcTWPk9kjX97sVwl8BMPmbOhttdP1zPYzMLpNVIOuroFIB+4rVRq6E5HTQEYpHTNGdIE0Cb4EZ8sYkbx8siE8Hu9V98XuiuJK5wemx8ElzVqTvyekaC/sS1YeMvkvIbiZY4a73NFQLFCuDg6N4lQz6kfUJZdqxz+Glk21Hrm+C+ZQWFrXxsh4oQ6E86U0qCJa3rpB0heGc5F3AO9qNd4JVCP6AXHsHvDteOkP7qWZXvqIF0TM7lTH39g1RGl7AeTkAH7UqQYr/Lt460+AOmlFdEkyFVLcpwNLQPQLQQkNAEhwpytNeT0aByDRyd7jImo/CSUEd7o04E8hyNms5ThJRlJ+4q7XlNzosCX01ieLLmrUw4bws+FtuG/PaeiEsfQrhwik4dl54Jkqo3mENcAh3lKHINICHZv9a35uaZXFcAZvXA3U6Asqpwn6BZURwNIRxtVvx+61+ablYC391pr9xvvJiQiBXNGcavxRf3lB4ofDj0R0Mo2K6HFw+gDLCXf/FKr73mJD7IF+cn3lUjT53FpkJESeOpCiGmRXBRX7u/Vok9D7IiPJvWAKmZsv/IEi4CRMIUPIYyIbutPw8coh2DU5s28jsRhT787lem83iMXdYG7u1Wl5CJKJn2NKSDnQbaEnS5MueAqLU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9E15F7438737894AA4FA31F630BABC11@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 LS+uHL+umx6aWlUxS5EcVUNOp1wpmp8EVccN0cyUa7VWz2aDY5SUIEqLaqGr0ZAnNFXG0iyJ9AwQdry3sBkqDVLLk7vhPjJtjEYSsUpnrM+Zbfws+PYWycjZ+AsyR8EYjVenpgJDyuKobxjGK+1HuqPLkV+bIMKfMoLdRUcM3Wl1SJbCRn50VIXIUnwap+EnyszAnLstnkHSqcmWVj340r7wZ9K2kR66NU8GcNI3BQVhNDqjSSpJUziNs/Mfik6HDhb/61nJb01emF2dlSp7NcBNg13eqsrNMH2by0f3nguprUP9RZHnvTtM0Xlwt6+TONR/30RiPGvg85Y0C9dwJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8442
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	80c0bbaa-32c6-4d9d-6711-08de86606365
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|1800799024|82310400026|36860700016|376014|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	ASd4XZlNO3imNUomzx6pM1hrPqVX8kDW2O+2w85IubI0pFt98ipSktRTDfTRLN4z5vcHMMDtwBYgeY31+qczqYayM5zaz+2Kp//lUxdQo7uj2IUkS9jbAIjQfHq9gsji2EuwVRWMWbyj/YN6B6HtiLUsEFPLPycS/eVZjzEvhEYuz4JYD8RYCEy6c34L6znIo0uJ47FA7q9H2ogJVq3AGsKVtulFaXZ6UDt9HNlF3Jwu1A3QgLijVtKZVmgztMuMTvHUwBoyRenSpqYsyw+/2lhm7zKo0PatYJgLcLPazBLlLrpDledZb74x0Up69D3j9OKzaV+ZsoOCPCbay4uiZIPWWk9Rw3KILXOrSoiKN4ZnAeUS+NHdD90a+6BPjvWcdHyj6prK15Cn32dhBMF2u1FxyGK3gjwyCdN3UKLlsXBUGkn5HV1gMty+3h9jelpj/ziVgpgma7OY+Ogx15kYPOwS58KeY28nKnQB3a7UNojW+faZGOlV1Y8a/p5n6l+jGk4C2YRgQESVNAeT/GB5JaAi0nrZBDUy4WO4+8h9rEjcMhpLW5Fji0K8GSpCpHu1wKvqavF9qLzui7pGmcGEVjUireAkY2Cpov053PfqNFtuYDnC7OB+5RdumOoG0zk+f3w5emG0gerTApIqhmAEcv0K7L4mSe0Ab8IT0aAifkb680s5i9mAEdu9KSFzJwr4NKY+/4l19mbb0aSSbxNqEp1vLlwJ7NeLcKFD2rxW53E5IiUhg3g9hKde+qrhBCOGs/IiZJPGCvISDi0LBauR/Q==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JyHPj/gzApkNPetf97U/uB99waGMpjmo1Ww9vOgd1zIA6jwaJ1kE+pD280Q0ywS6ds//wRnznFR/Uj+awPty+QqGZcMc0p5NHvfD9gfCLe1pRyDvHbRbd3w4Tilx6c6onhNgNj/C0Wwl++qMfgYRHKxLvwOjj2OeWK+/hxcJ1IL1PkdbxXtWkfaavmK+juUiTRgXlagCyigVPSHcmqLSJXYIoQVycwJal0s6ORCjvc/VJ3EDRFVX6SscB+eVtNQMVCmRuYiTJ/nfNNftDtSnET6pbiU/0O6A51oC7eMXoUEm9ASPTmLLE6kO+VXfot8sKJpnyFXmUQGm/ygtcU8A3DZBFWVrMsCGVkE1jKEP9UpOv/6F1+ZHuC/FU6Gb1v9QnJ5kDlTAbJuYp/Cfa8Pj/JPIraTD9XOE4hYpacVPMSBBDLmcsdNItrvdAHVW8I2Q
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 09:10:31.3288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d941d4b8-c1c1-4908-ccd5-08de86608974
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7538
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,m:Volodymyr_Babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	APPLE_MAILER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: C894C2D7C95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



> On 20 Mar 2026, at 09:54, Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com=
> wrote:
>=20
>=20
>=20
> On 3/20/26 09:44, Bertrand Marquis wrote:
>> Hi Dmytro,
>>=20
>>=20
>>> On 19 Mar 2026, at 21:16, Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.c=
om> wrote:
>>>=20
>>> The local variable 'ffa_vm_count' shadows the global variable, declared
>>> in 'xen/arch/arm/tee/ffa_private.h', therefore it is renamed
>>> 'ffa_vm2vm_count'.
>>=20
>> I have a patch in my queue to solve this (I am just removing the ffa_ pr=
efix from the local
>> variables but does the same as yours) and a patch to solve the other mis=
ra issue in optee
>> but happy to to use yours if you want instead.
>>=20
>> I was waiting for the pending ffa serie to push them (should be merge so=
on)
>>=20
>> This patch will not rebase cleanly on top of that serie which is changin=
g ffa_partinfo code.
>>=20
>> Do you want to wait and rebase or abandon and use the one in my serie in=
stead ?
>>=20
>> I am ok with either solution :-)
>>=20
>> Cheers
>> Bertrand
>=20
> Hi Bertrand,
>=20
> lets use your patch series.

I just sent it with a warning in the cover letter for its base.

Cheers
Bertrand



