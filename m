Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5834B702167
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 04:15:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534546.831657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyNiy-0000IH-4F; Mon, 15 May 2023 02:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534546.831657; Mon, 15 May 2023 02:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyNiy-0000Gd-1A; Mon, 15 May 2023 02:14:08 +0000
Received: by outflank-mailman (input) for mailman id 534546;
 Mon, 15 May 2023 02:14:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnKm=BE=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pyNix-0000GP-9g
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 02:14:07 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28d1e525-f2c6-11ed-8611-37d641c3527e;
 Mon, 15 May 2023 04:14:02 +0200 (CEST)
Received: from DB6PR07CA0162.eurprd07.prod.outlook.com (2603:10a6:6:43::16) by
 PA4PR08MB6304.eurprd08.prod.outlook.com (2603:10a6:102:e1::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.30; Mon, 15 May 2023 02:13:53 +0000
Received: from DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::1d) by DB6PR07CA0162.outlook.office365.com
 (2603:10a6:6:43::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.14 via Frontend
 Transport; Mon, 15 May 2023 02:13:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT058.mail.protection.outlook.com (100.127.142.120) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.13 via Frontend Transport; Mon, 15 May 2023 02:13:53 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Mon, 15 May 2023 02:13:53 +0000
Received: from 329b8123a383.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 85C33ADA-7D22-40CC-A1C6-97FBE7727AD8.1; 
 Mon, 15 May 2023 02:13:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 329b8123a383.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 May 2023 02:13:47 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAXPR08MB6560.eurprd08.prod.outlook.com (2603:10a6:102:12d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 02:13:44 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%3]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 02:13:44 +0000
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
X-Inumbo-ID: 28d1e525-f2c6-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYAGLuYTobLBNzIiopQ7l4ZSPYI8Agebm1EmgHfrBJE=;
 b=bzAHGNH2a1pEJwVh/0oDdNAbq6p8xrONSO9CIkMlO2jvgw2vqjffnd5lTcLf9tlTyzAFeS/VJX5JnuB0UiILlqOdBI/L/CSwoDhlt2ansNb3ajdRW9orY/MwTRVt/s5FwzzmEn3lCa2lHDtAeKroU2ziHFlNu3L/g5zF+Eg/tJc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9wsWtDJdS2Ip0wOZeb1OD6S2KCK5cfNIe+ysZRxwnLkk5J1d4kDPjak0KZdhtG+jrIwEY6HhqqPxwF7Uxbfv2/goJ2PFy6H5QwPzFOXhTo0taXSmuaRXKJBLSU2Y8rqiQVjNw4VBm4SZ73rvR0JrGq/V7Li8gRcTkCIYKh96earRIliRgNw2v/J1cguXc1yDyJZGW65CWqND/7UgylXHkGosAq1As3B1OkDM8smdOVmj3HCls6dPZxQYGH34A0vBIM/0fBroV24dxA4EOYo0eSJZWJslwHamr1MIZhc3g4BNSxmA0azTfbUh5/5/QOg/TaoA+nE6pQfW9xE0Rl4mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYAGLuYTobLBNzIiopQ7l4ZSPYI8Agebm1EmgHfrBJE=;
 b=j51UQVvafUPSwcTdbd2YrWjKcZf99HZMiGLq5N8hpTL67eTtjTxgstA/1bC4+FhMlxVX7gdH7jb6QCY46ru8FRgQmA9hDACAqDM1SgNM0SHaR0e2TgacGgopAvTLJtrOjJsrlkRAubhWDjwVIP8b5zujbnvFk8fim1Q0IhtZFNT3HlWSWf7UMUD97zzG5f05c8Z7VR00H/8LKolH8xzSQEmj2ZjrC2ohpttz762UjU9hTy2eXaDBtxEhtGcqE7oaFGwVJ7mrEA2M2Yir4MR5Ql2oJc4AlnINRNZZAjMr6ISsXNCqxl95il2XN8UnQA9XiGgFgab5S3WlfKS0vsGCYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYAGLuYTobLBNzIiopQ7l4ZSPYI8Agebm1EmgHfrBJE=;
 b=bzAHGNH2a1pEJwVh/0oDdNAbq6p8xrONSO9CIkMlO2jvgw2vqjffnd5lTcLf9tlTyzAFeS/VJX5JnuB0UiILlqOdBI/L/CSwoDhlt2ansNb3ajdRW9orY/MwTRVt/s5FwzzmEn3lCa2lHDtAeKroU2ziHFlNu3L/g5zF+Eg/tJc=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Rahul Singh
	<Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 1/2] xen/arm: smmuv3: Constify arm_smmu_get_by_dev()
 parameter
Thread-Topic: [PATCH 1/2] xen/arm: smmuv3: Constify arm_smmu_get_by_dev()
 parameter
Thread-Index: AQHZhN8XLdBPXF4izkqlyUf4//7Z469am+6Q
Date: Mon, 15 May 2023 02:13:44 +0000
Message-ID:
 <AS8PR08MB7991A6AF52CF606DA6A67B0592789@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230512143535.29679-1-michal.orzel@amd.com>
 <20230512143535.29679-2-michal.orzel@amd.com>
In-Reply-To: <20230512143535.29679-2-michal.orzel@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B20E6FE70081764B8E2A13E388F40B0D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAXPR08MB6560:EE_|DBAEUR03FT058:EE_|PA4PR08MB6304:EE_
X-MS-Office365-Filtering-Correlation-Id: 938e02c9-95e2-46c0-1f5d-08db54ea07dd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GLHa6RiqEAxOXX4FnQUnq/fGyFLMakUAkXohJvtzMGAaXc3Tyq4/HXLqtplI0C3Yqj7o+ZyKV0VjqkfBCYq1WzX3sPFgFafwMjh4N+bqEBvPjLeatoCYZ7RiOgUb5ry/tmolz7mlMQ/N7iyd0Ea2nqrZcE1AcUEo0KWiJwDFI4zZcYGcjcoONxG6eIOSF2/QL6av9mw+Ik2dZbznvPq0MgNfJwPOdjCHFA1aFb7grPXmKC5EGqhvqnARcmFEQI3g5MqnbjPlPflnUj9Z9lSOk+Xf7FhujHaxlmsypMnYLI77d8dCju09sGhtl7czY0T6/1Fi/aSk3BZWbAvTaQBHUkzT9EHTa3mu7INqmR0Yd4tgfIK55k5wru65proZIiUDuxB4oP43EKQkNvCTWg4/WBMJACXRnU9D9b0eejIuU/xbCZNEd/JAQXFj/AXMMIqjt25BWAv7NAX8vC2ywWf85Lo9USKD5hRG4ZVDxPknr/NAHA6p+YLFf05iKKDLyZ2UwWK4qBahtAhVN1Oqg219jw+k+yLK/7dnJa3tWzfHgw/b/yrR6Cwagd+fJUmAlEAQoznwenIF47WVYUpI4BOlY2kRjiME/cH+QroMQacn/8txwV10we+8AnKyWLneeN/G
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(366004)(376002)(396003)(451199021)(66946007)(66476007)(66556008)(66446008)(76116006)(64756008)(38070700005)(8936002)(83380400001)(33656002)(71200400001)(6506007)(26005)(7696005)(4326008)(8676002)(2906002)(5660300002)(4744005)(122000001)(316002)(38100700002)(41300700001)(52536014)(86362001)(110136005)(54906003)(478600001)(55016003)(186003)(9686003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6560
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f04e5c14-aec7-48a9-d385-08db54ea02a2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kLbiB/wEzb4n3Ic+bPK9D6IIRccqHJSvMSR6UhGYhS5C2DMEmmN/bYG5Knxp0S8shrHPE+XM34p/7WLWTY/Z/QII42AnsWG+aRwoEjBedRAMvudkgheGig3liHru3RCmGqeWAXe5mYpbDLoElzJEVmlWRe/UvqLGmcZ5/9BNF7Oxwrq7/DAnPoOThItwOuxZOYRSVCgKIlyaYnRI6yLt4WKjHT3sGb3CABhOUC7F5GE2uS1QHNzBAtbeu0F6Z+aB2ukHosZSFNAq4kXier9PQKg0A9Wfivd3bu1gHcWQy/KHIQ4Ve/uB16kzuyYAt6tALTB6DNmnuUd1PpQaiyvhMuZ8bXb9BMVpDvd2t+Eyth2zrMY7IBMzDJkOvsu5q5UhFNPhgUXCkj6vQfH+Dg6JX1C4Xe/SH/7ESilYdjd9PnAWv5T0ismzhUduzpcEeeIAzdtIcH0iaDFuYd1XnTw/GhWeS8l1pTJsL5g3vybs9BEd+NxdlCgRXP5J5e6umY3bisTSGTTpOYJu3w7vSLSHvUJevM5YVLPBb/aFnPL+Tq0B+ed/1R2S0alcJyALHmWfqhbcSAMEfBl+durQKVjN3USQtfuRBVUOqt6rEGooJryzcJNP2q4JsYbCb2q5GU0oPfYFDu+3kWaJQCrnJX2A/POR266d7surim5spbOrf9jCkpnvFStX1YJ/ZLwP3WtqrOEVVBNO2WEnccWdYFEMyA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199021)(46966006)(36840700001)(83380400001)(4744005)(6506007)(26005)(2906002)(47076005)(33656002)(186003)(82310400005)(110136005)(107886003)(9686003)(52536014)(336012)(86362001)(36860700001)(5660300002)(7696005)(8936002)(8676002)(82740400003)(356005)(4326008)(70586007)(478600001)(40480700001)(41300700001)(55016003)(54906003)(70206006)(81166007)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 02:13:53.3913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 938e02c9-95e2-46c0-1f5d-08db54ea07dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6304

Hi Michal,

> -----Original Message-----
> Subject: [PATCH 1/2] xen/arm: smmuv3: Constify arm_smmu_get_by_dev()
> parameter
>=20
> This function does not modify its parameter 'dev' and it is not supposed
> to do it. Therefore, constify it.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

