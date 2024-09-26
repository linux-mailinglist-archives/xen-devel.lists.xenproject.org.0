Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7679986CEA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 08:51:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804949.1215940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stiLL-0005tj-8J; Thu, 26 Sep 2024 06:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804949.1215940; Thu, 26 Sep 2024 06:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stiLL-0005sM-4a; Thu, 26 Sep 2024 06:51:15 +0000
Received: by outflank-mailman (input) for mailman id 804949;
 Thu, 26 Sep 2024 06:51:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XoCv=QY=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1stiLJ-0005TO-D3
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 06:51:13 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20629.outbound.protection.outlook.com
 [2a01:111:f403:2606::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b754566c-7bd3-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 08:51:11 +0200 (CEST)
Received: from DUZPR01CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::6) by DU0PR08MB9324.eurprd08.prod.outlook.com
 (2603:10a6:10:41f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Thu, 26 Sep
 2024 06:51:02 +0000
Received: from DB5PEPF00014B9D.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::d7) by DUZPR01CA0018.outlook.office365.com
 (2603:10a6:10:46b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20 via Frontend
 Transport; Thu, 26 Sep 2024 06:51:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9D.mail.protection.outlook.com (10.167.8.164) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8005.15
 via Frontend Transport; Thu, 26 Sep 2024 06:51:02 +0000
Received: ("Tessian outbound 3e266b55d80f:v465");
 Thu, 26 Sep 2024 06:51:02 +0000
Received: from Laaaacb340fec.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CF078F7B-6354-40CC-929B-E3D677835D7B.1; 
 Thu, 26 Sep 2024 06:50:55 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Laaaacb340fec.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Sep 2024 06:50:55 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PA6PR08MB10565.eurprd08.prod.outlook.com (2603:10a6:102:3ca::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.8; Thu, 26 Sep
 2024 06:50:48 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8005.010; Thu, 26 Sep 2024
 06:50:48 +0000
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
X-Inumbo-ID: b754566c-7bd3-11ef-99a2-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=W0exkQqOM/skEsgVnDHOVSOm9NJPCrRUHKZHQLy2HMRbsCHy1G4lbpy7NmRSz2SOzNU5wbHCMV70skiqV2xwBUGP9cWm434+ylqcT/ZSK0RNrLu3OHAfc/diEqxnfUs1XEhD50hI1aaM9DdoPsjRdARWGDfaseH1y1wIebaDVv1iWTLKSedJS2ynN6Wc2md6VXxVxKugdhu/bFIkZdF2NmRCqkFLmJvRRMo32+v3RHTPClSpd9PBvTC+j5uheYdpuzXBGXLfrDYIhYHoUZhI3d1zetQgc1si0PwK/cAZdZBDaGnSjf2Bm44WBAyGSzWT5mQtLIOWVdruHRMOZFBXgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xYjM7xIQ1mw/ygfcAArXW+0gqxAt4PSBJSRqNG4Ma0=;
 b=t1ht5zoqNf02a+Z4te6ZzQoO2IRJuHbQwjsatTNV0/UTfqMxN0HbDYYaMXVnZ6vmchtiFNy4Au8vLBXMlXaD8tuwPuLIIUfjqe/3TIEfVZYbCUSjYVPZveuX12oYG/FTW7LxpLsDmJ5FlAae5LlUFOXP4S01dmwReqEM1kWfiYK6cJdgUf9cMCRFOpWqtk/MQ868za8Ii6jx73cdsYcqU2xQQZOmLI2CDlazsO/JUT5wDjjeSPWik7cu6oHvmmcLBuJH8DQzWLRe0dqyB+JNwlu7yG8OrtEh04k248mqoiu05VoHFrjCUAHNeSlmymUeLrP4zSajYuciULTafT+Izw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xYjM7xIQ1mw/ygfcAArXW+0gqxAt4PSBJSRqNG4Ma0=;
 b=ZqC0I5HpuPKsWPbRPecfZEbg8EBAq7OcKZtFbblefeH7+VbMewkL2aWxNclYqK/Y8KZJjWzVstuJZIbeTzc9SVM6JN3BJxD+5e3DXKqiOJ2j7ejaHYWHIYCOzE0AkxqRlv21xbCZWgdtaXh/Qcw77GrwsBxSK44JPSTrBHv5zXg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6f5b8f12566b09a5
X-TessianGatewayMetadata: y+k0B9Qt9yowIYKfMbk6see4KeaOub84g+Rv/E+Z3ZA5TkjaasEmiiuZ3/np4HMkbPgmsuVYSN6JMDaFobAWbWr0pGrzer2QcdPNyt5f0jfXullpLQ06wcbxvdhzD8cgkeaJsoprvvmQW1yjK07XiCxlwypg1JjyrNAMJaiBlko=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGjY7+NNNyiz9JW94kMnIDXdaaMSS0v4VyUx4VdQnaNmqMp4D2M3XjLsDdJhC1hYadtskqevG/9FoxjZunMRjmuwfrbE6tQ/aOM1NVcsLuhMbiIu5l6sJ553xb8wG8PWRMgnpLBEv0g4rKnIXEu9P0UbGZ9EH5DYa9jsBq2911y45g+8lSXyPFAci7sBEnFV3nX+5OGZUyQqJTEY/JzQJDspLbPzoN+5wtloNMMEfTtg78KYVzJrciTlbbl4dS6bxp8w/lws8RrFELLuq6CtcbdwdXIaJBJZFpfWA5PcIW76RQjVx53Yu8LzOet7iIjoGFVjGBGEoMKbt+0dWL56bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xYjM7xIQ1mw/ygfcAArXW+0gqxAt4PSBJSRqNG4Ma0=;
 b=WZz9HmJAVXa2OqC9GAJHLNqyjLRyCQyIrbpQidT6K8k6wkw+j/7Gp6euoOSjXaTHOckbYG2UVZeZbx5jB0DtFanMU0bb5phRRtLO/42x1O45F2xdjATymh/KY2GJ2YgGc29Nw6aiZMDT4E04ieA5Ad2lJQqSHf6xjWfR79nlOD9lu4/VBcpuLqJQSF+T5POZnm1BZ3aLIywfR5zEqFyTibqpqcsv9RsAuj/HhanQ66zkM6jvHC/gRPc4XFFCWtDQ2IyiYZUbexFSwYBuD3QTOruaneuTBhT/fqj2CDFUfpZHmEz1hptPdz3+YNtx2WBn7IvTZgaK3U1brO/+ztpqRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xYjM7xIQ1mw/ygfcAArXW+0gqxAt4PSBJSRqNG4Ma0=;
 b=ZqC0I5HpuPKsWPbRPecfZEbg8EBAq7OcKZtFbblefeH7+VbMewkL2aWxNclYqK/Y8KZJjWzVstuJZIbeTzc9SVM6JN3BJxD+5e3DXKqiOJ2j7ejaHYWHIYCOzE0AkxqRlv21xbCZWgdtaXh/Qcw77GrwsBxSK44JPSTrBHv5zXg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 03/10] xen/arm: ffa: fix version negotiation
Thread-Topic: [PATCH 03/10] xen/arm: ffa: fix version negotiation
Thread-Index: AQHbCo5DR6ro4Z09O0aiPTgUk1dK17Jjv8yAgALhMQCAAh6EAIAA7CwA
Date: Thu, 26 Sep 2024 06:50:48 +0000
Message-ID: <A95A97A0-150E-452B-8FE3-EB2F7CBB1578@arm.com>
References: <cover.1726676338.git.bertrand.marquis@arm.com>
 <716e806316f8249611c8268f781efbea19273b4a.1726676338.git.bertrand.marquis@arm.com>
 <ec473bbd-1fea-4ccf-80d5-2f55f2db69ed@xen.org>
 <BC0BF5AD-B3DA-4007-84E4-050884BBE08F@arm.com>
 <4d268eef-9eec-4173-a597-b903c7ccd769@xen.org>
In-Reply-To: <4d268eef-9eec-4173-a597-b903c7ccd769@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PA6PR08MB10565:EE_|DB5PEPF00014B9D:EE_|DU0PR08MB9324:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca3616a-1c03-4ad5-bbcc-08dcddf79605
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?KqjLJsH7sCu2cFcg0FyitZbRRI5NkwHpMTihe8gDgVzSXqrx7Pq+VwR0St2D?=
 =?us-ascii?Q?A2QV2ocMq459g7fIUBuo4mjOUL5iat/GIgOMOrG+0V0zyI+rckIN1fM7Xqxk?=
 =?us-ascii?Q?Fj/w8prhrKpD0ZGKwbjZIBDfYPPc0hFYUtbudFLl1LGSbcXHg3FyzyWdp0Pf?=
 =?us-ascii?Q?ds8+eLtnN3R+Xs5G9HdCK5LR6niGsp/YHu8rTcEorxJM/yIC92u52NZo6O3M?=
 =?us-ascii?Q?9TniluR2mAjBB4RmevELRLwPi8ShF1+Y1NgnTuAkPJefzUQeAFgDFHkgp+qA?=
 =?us-ascii?Q?IkZf+LkAGDjuii844mtZLUXfUUmc6L8pzIl6QKr9ByleFxF5T6qWOD19q9Mf?=
 =?us-ascii?Q?VMyz1pcTOOkNb1XgiVFza/fAlNZyGb0Su+Z+m3vyktWL56UNZ2VK5miyA83w?=
 =?us-ascii?Q?IQQhTnh0gm4dqUuNYvJaJ3EdZlR5eURYSnZobmmxP3y3yGPKY36+2vDBzp+y?=
 =?us-ascii?Q?N1AH4xnu9590/vhrFkdM6oMEPzJ2HHEAJbP0UypAcN7GV66+j6eRCc7r8L3k?=
 =?us-ascii?Q?FS9pXjJs4bwbwH1C6nE/r63U0MQ4Art6rXek+Sw/OsfARjEgwQ6nJGng0f57?=
 =?us-ascii?Q?Lznk5NH80Mb/fX9ZUDXy34ER9gl3wqIretuVRJ+ajhrq7/+jixM/pXr4RKBK?=
 =?us-ascii?Q?ndIEoNl7o8lrJZ2qtBUm+gjkpvX/phV/OdbWbDSGU/BF8S5Gl2PjjYOBzoqp?=
 =?us-ascii?Q?asRC5uNMVjUfEhAP/RbmlTL5s0X5QPkR4SbRvMu0y9Cied3LsQvZNvb2Zhru?=
 =?us-ascii?Q?Q56pFQI2X0dBHNW8BhAqAqGlQrXTRgAU5yerJjeQhl5ffdmssnkFrdAVEtJN?=
 =?us-ascii?Q?CO0MoEXWRoF0MkOET8khHNiZDtwZs1ciPzOoa82EEx25qYqxJYTNIBa2CBIX?=
 =?us-ascii?Q?lUOmB8FujPHB3o4jr/ti8UbdIGZJkyHwSDsEMPJQqDprLf/IvwLy3/omIyow?=
 =?us-ascii?Q?jW5qhZlenuEKAeK4ybAXIQ0JpAxxDIe+EqdHIskn1xNYw6mWc1OLrqUlZyWF?=
 =?us-ascii?Q?fqF4ypsOPnaJ2iTN1oJXp9bYJufj8iL3PhMd8Q8cVxC2jKn4r/vDxsOSijRH?=
 =?us-ascii?Q?EwoGVH4UtKZervb89MM2DJzz1jBHC0lM9/K7LzSg52JveveGE8XKABCsN6jf?=
 =?us-ascii?Q?zoBhEFkWi7k+1BzrJW7A0fM+WI/E8JQixRRFILuLD+SqCOQmmHeO6n9cmLjl?=
 =?us-ascii?Q?fcg375GeQbES9gS+Zy12TSShuiRmjMa0jivgwIoaCmoBjYTPnzO2k/IlBjpJ?=
 =?us-ascii?Q?3fB9Zx8pGKCrKfjiyrYhL8fQzKfU+Uo6IJPdBlzpdy6H3LaiXBjjAGNRp8zi?=
 =?us-ascii?Q?+ooZPl5IJ7s6hNX0jvp3wk/B8KSQ9Ktl8PxeVqwmUFnSHA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D460989CBE760E4BBC2F5E7C34DA7E77@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10565
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b2645b7b-8705-42f1-8674-08dcddf78df2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6x8QiNi60qbNRfTo8xNNX2PcktG5BdjgYbQ1w+xhA1Be/jyxqz6LYsDpzU6h?=
 =?us-ascii?Q?KFKr7DrmNV9mocC6ygcugnSe4Mb1STQXFbF7ZOgKHCVuNrOItoUdu/xDCX5G?=
 =?us-ascii?Q?24Bv64WnQ+xQomIkfIs7MWqakyjVE2wkNLE3Pt9gtJR4H4zF9Iy1lWZr37M1?=
 =?us-ascii?Q?QzxDkah+KU30hxCYxGQAFNXVVipn2KqRH8mTjdoZcg+Nqqhe9Jtpnv+f60u5?=
 =?us-ascii?Q?wPXT0Rc8v9jTfEpO37gzw02LNOn9lLn5g7XAi12+Dj2lbJ3Rh7Y2wPClmKb6?=
 =?us-ascii?Q?kMl3je5HHLZwyzmNlcan0MhTmMQRi1HrUqJzG9hMM20lpaeYiMfn8ikmz+Kk?=
 =?us-ascii?Q?fQm3ODHTOWqHyHEc8dOMkVG+l5mKYCbSLe97vP8SzXfJ6wcqSX0c3YEsBZHZ?=
 =?us-ascii?Q?Fa1JD3NtIHZ3IrhhNjMOjQPrw4J/N3NO05rgH9nG67BYCllT66E3QeUD9stl?=
 =?us-ascii?Q?gTE5P5kFpU2puVvOF1ff1QqXJsXvXvGD4qUUnmkDcUcYZAT6wKAN/4e/OiE8?=
 =?us-ascii?Q?A2wT849YkopUxexddti1AadY/dpPGXFW5/f4JEBrFyFbzssAIe9Ddn9+K++1?=
 =?us-ascii?Q?c4mBlTEui5x6ejFmW00U1T7/gt8qBAybXv9nTE1TlU2A1u0hkbzC8Fn1emu0?=
 =?us-ascii?Q?KrhdbOXMA3JO5r2Xs74SBC2xxjZRnn6n9YYqjTmMbvdyq5nUzU+6HA+JEUKK?=
 =?us-ascii?Q?+JHo13k5nGvdwp8TjKqXrq3tgmMBvRtouhkRdX4EkdQ2Re067zC30O7rGup4?=
 =?us-ascii?Q?nexaoE5XtekJOp+dPpbYxfFt48A9EfrYYW/r9JINgJpEIr1kvTUfEpOjy8td?=
 =?us-ascii?Q?ayQ4fIUZR4qNpIHyg5akCwWoLOKPNYvJazrRejPbD3m0l+QDcPv/fhZbOlxq?=
 =?us-ascii?Q?67sVM5HYvuatqZGuav7g86FBuDLgUrPN+2YkQaOxC3AJwI0jKylZl83vj+jV?=
 =?us-ascii?Q?837ikwPQICjdATzLISJV3mRvN2yqI+W6M3CnlkR2CDWkl9fKyX2SB8tw1xUC?=
 =?us-ascii?Q?RtIu7VOuwfKGxK8qCPWH8n1RwfYtu2hw59n7yIvdlIDr9KoU8Km+50bxkLYC?=
 =?us-ascii?Q?7nDpRysGtfywToWLIj5P81Lndlwfr6p9kobwE/VERvmWQtqVQ09uGm6/Lpnd?=
 =?us-ascii?Q?7gfHiisUGGDhVKMYMStW7qb7Fv5Z7H3PYk4JaOpFeHXynoGZbG2KO+L+hGq6?=
 =?us-ascii?Q?I+7K7FrGMlI30Q1taHXa5WyzQ3jCrCBajbg+vAv7go33EdIIEnlU6Np+uoM0?=
 =?us-ascii?Q?5PWMf+JqCb45pib/ezm5vE07ydQLvcijPBvu8+44OxmE0CrZplR+xoChDAzS?=
 =?us-ascii?Q?QEDdq4g2HNZ+S2qA4nsFtfLJYItIs46w+NaTzlrDxxKP8YRupR1I6rJYRUbI?=
 =?us-ascii?Q?p9y5Vt7rJIc0sJA9iHETEU7fB+yqfu0df6jtNQi6C0PLzHCT2BW4WIy0AtJL?=
 =?us-ascii?Q?DIVi4JTaEHXUhbUcdPiMZQNoity5a8n8?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 06:51:02.2917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca3616a-1c03-4ad5-bbcc-08dcddf79605
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9324

Hi Julien,

> On 25 Sep 2024, at 18:45, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 24/09/2024 09:23, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi Bertrand,
>=20
>=20
>>> On 22 Sep 2024, at 14:25, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Bertrand,
>>>=20
>>> NIT Typo: s/fix/Fix/ to match the other title
>> Ack
>>>=20
>>> On 19/09/2024 14:19, Bertrand Marquis wrote:
>>>> Fix FFA version negotiation with the firmware to follow the
>>>> specification guidance more closely.
>>>=20
>>> To confirm, below is based on 13.2.1 in DEN0077A, is that correct? If s=
o, can you add a link in the commit message (and maybe code).
>> Yes it and i will add a link and description to the commit message.
>>>=20
>>>> When the firmware returns OK we can have several cases:
>>>> - the version requested is accepted but the firmware supports a greate=
r
>>>>   one in the same major.
>>>> - the firmware supports a greater major version. It could still return
>>>>   OK even if the version requested is not accepted. Reject it.
>>>> - the firmware supports a lower version. It will return OK and give th=
at
>>>>   version. Check if we support it and use it or reject it if we do not=
.
>>>> Adapt the code to:
>>>> - reject any version lower than the one we support or not with the sam=
e
>>>>   major version
>>>> - use the version returned if in our supported range (currently 1.1
>>>>   only)
>>>> - use 1.1 if the version returned is greater.
>>>> Also adapt the handling of version requests from VM:
>>>> - return an error for a different major
>>>> - return 1.1 for a version >=3D 1.1
>>>> - return 1.0 if 1.0 was requested
>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>> ---
>>>>  xen/arch/arm/tee/ffa.c | 38 ++++++++++++++++++++++++++++++--------
>>>>  1 file changed, 30 insertions(+), 8 deletions(-)
>>>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
>>>> index 7ff2529b2055..1f602f25d097 100644
>>>> --- a/xen/arch/arm/tee/ffa.c
>>>> +++ b/xen/arch/arm/tee/ffa.c
>>>> @@ -141,13 +141,24 @@ static void handle_version(struct cpu_user_regs =
*regs)
>>>>      struct ffa_ctx *ctx =3D d->arch.tee;
>>>>      uint32_t vers =3D get_user_reg(regs, 1);
>>>>  -    if ( vers < FFA_VERSION_1_1 )
>>>> -        vers =3D FFA_VERSION_1_0;
>>>> -    else
>>>> -        vers =3D FFA_VERSION_1_1;
>>>> +    /**
>>>=20
>>> Coding style: We are use a single '*' to start comment.
>> Ack
>>>=20
>>>> +     * As of now we only support 1.0 or 1.1.
>>>> +     * For any 1.x >=3D 1.1 return OK with 1.1
>>>> +     * For 1.0 return OK with 1.0
>>>> +     * For anything else return an error.
>>>> +     */
>>>> +    if ( (vers >> FFA_VERSION_MAJOR_SHIFT) =3D=3D FFA_MY_VERSION_MAJO=
R )
>>>> +    {> +        if ( vers < FFA_VERSION_1_1 )
>>>> +            vers =3D FFA_VERSION_1_0;
>>>> +        else
>>>> +            vers =3D FFA_VERSION_1_1;
>>>=20
>>> I feel the logic is fragile. The first ``if`` is generic and I think it=
 would be easy to update the major version without updating handle_version(=
). To some extend, the same problem would happen with the minor version.
>> so something like:
>> if (MAJOR(vers) =3D=3D MY_MAJOR)
>> {
>>    if (MINOR(vers) < MY_MIN || MINOR(vers)>MY_MIN)
>> vers =3D MY_VERSION
>>    else
>>         keep requested version
>> }
>>>=20
>>> AFAICT, this is not a new issue, but as you touch the code, we should p=
robably harden it. I could settle with a BUILD_BUG_ON() to catch any change=
 of the minor/major.
>> i could see a BUILD_BUG_ON(MAJOR(MIN_VERSION) !=3D MAJOR(MAX_VERSION))
>> Is that what you have in mind ?
>=20
> I had in mind to check specifically that FFA_MY_VERSION_{MAJOR, MINOR} we=
re both 1. But I think your proposal is better.

Ok.

>=20
>>>=20
>>>>  -    ctx->guest_vers =3D vers;
>>>> -    ffa_set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
>>>> +        ctx->guest_vers =3D vers;
>>>> +        ffa_set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
>>>> +    }
>>>> +    else
>>>> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>>>>  }
>>>>    static void handle_msg_send_direct_req(struct cpu_user_regs *regs, =
uint32_t fid)
>>>> @@ -530,7 +541,8 @@ static bool ffa_probe(void)
>>>>          goto err_no_fw;
>>>>      }
>>>>  -    if ( vers < FFA_MIN_SPMC_VERSION || vers > FFA_MY_VERSION )
>>>> +    if ( vers < FFA_MIN_SPMC_VERSION ||
>>>> +              (vers >> FFA_VERSION_MAJOR_SHIFT) !=3D FFA_MY_VERSION_M=
AJOR )
>>>=20
>>> Coding style: the second line should be aligned with 'vers' rather than=
 indented.
>> Ack
>>>=20
>>>>      {
>>>>          printk(XENLOG_ERR "ffa: Incompatible version %#x found\n", ve=
rs);
>>>>          goto err_no_fw;
>>>> @@ -542,7 +554,17 @@ static bool ffa_probe(void)
>>>>      printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
>>>>             major_vers, minor_vers);
>>>>  -    ffa_fw_version =3D vers;
>>>> +    /**
>>>=20
>>> Coding style: We start comment with /*.
>> Ack
>>>=20
>>>> +     * If the call succeed and the version returned is higher or equa=
l to
>>>> +     * the one Xen requested, the version requested by Xen will be th=
e one
>>>> +     * used. If the version returned is lower but compatible with Xen=
, Xen
>>>> +     * will use that version instead.
>>>> +     * A version with a different major is rejected before.
>>>> +     */
>>>> +    if ( vers > FFA_MY_VERSION )
>>>> +        ffa_fw_version =3D FFA_MY_VERSION;
>>>> +    else
>>>> +        ffa_fw_version =3D vers;
>>>=20
>>> Looking at the code after your series (didn't check before). We don't s=
eem to use ffa_fw_version for other than checking that FFA was detected. So=
 wouldn't it be better to stop storing the version?
>> We are only supporting a firmware version with 1.1 at the moment but whe=
n we will add support for FFA version 1.2 in the next weeks this will not b=
e true anymore so if this is ok with you i would rather keep it.
>=20
> I am fine to keep ffa_fw_version as-is given there is a future use.

Good thanks.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall



