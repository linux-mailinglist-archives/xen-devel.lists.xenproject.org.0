Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8167E5697A6
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 03:45:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362694.592852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9GZZ-0007ly-Dc; Thu, 07 Jul 2022 01:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362694.592852; Thu, 07 Jul 2022 01:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9GZZ-0007kE-AP; Thu, 07 Jul 2022 01:44:53 +0000
Received: by outflank-mailman (input) for mailman id 362694;
 Thu, 07 Jul 2022 01:44:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j4MP=XM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o9GZW-0007k8-Ry
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 01:44:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70072.outbound.protection.outlook.com [40.107.7.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6291c18e-fd96-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 03:44:48 +0200 (CEST)
Received: from AM6P191CA0030.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::43)
 by AS8PR08MB6168.eurprd08.prod.outlook.com (2603:10a6:20b:294::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Thu, 7 Jul
 2022 01:44:44 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::89) by AM6P191CA0030.outlook.office365.com
 (2603:10a6:209:8b::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Thu, 7 Jul 2022 01:44:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 01:44:43 +0000
Received: ("Tessian outbound 190453a6d737:v122");
 Thu, 07 Jul 2022 01:44:43 +0000
Received: from cd15004ef429.4
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 829FEF61-F61B-411C-B191-2786B1793686.1; 
 Thu, 07 Jul 2022 01:44:33 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd15004ef429.4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Jul 2022 01:44:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM0PR08MB3059.eurprd08.prod.outlook.com (2603:10a6:208:5c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 01:44:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.020; Thu, 7 Jul 2022
 01:44:31 +0000
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
X-Inumbo-ID: 6291c18e-fd96-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FCE5E7E5GQQ20K+G6fptxCog1Dsq9FzC9+ZMkGeJGF5welKSD0a1TDNCZO4mlFX2geojW3bj/jvpOY2+5Xa13hLLpbvjdB2IucfMuGLhQrgaQXLOiaE8W0OoWnRo8MEdn6GBpXQLdHsZ+v3ZQ1SEDUtFAGYtQqBfGJ3U+LBBwxS35xziVLzuAIkTBb2zysH+cv5NymgKzAM3DIwgZsohspd3L0pNfcSvk5Qrap+kaZdy0NwzYcF0wclxBr2bnHvNwlrV2wQW9RdqFr5w1oENNFlZlC/GM4t35gUaEZcK1k7I9U6mmgDCklXSQAOnbzgXqW739dLk9NbyiwzLzpMc8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzKMgzJn6lcDh8AQWns1RMHYti4lDAifTNrK95jdCmc=;
 b=AHgmC2OzcMcidgT4wQfHxijiz7rnM8GS+kWMFIUfZIf+rrFHfVDNAwT9vOBg3/Sbd4H6RXeRGOB6G+HFU0Czdnochvr2jVA7QyJwiSz6gxiQuuqmBVGnJwCLG0SXLYdxhxqFX4uwsoNYZzqPr2xcJmmNfcyfdDSlYEzjVB7k8jMAxHVRWiwRiS3Q6U6eNlzvEcNVRiCJTRNYjpE49wzHcUSFv6qwACbc38bv1rJnSLLp0zT2tEOWPZ32ON1ypaaTsoFqLpr08kCY1+CKGq/BfgMmjE+6Mq/S5RfYLKqysw01XUiKr0ZKI9sVmUv6rMdD/SVq8njpjmcSfJMe+tRzTw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzKMgzJn6lcDh8AQWns1RMHYti4lDAifTNrK95jdCmc=;
 b=XNwy6Jhlo4fXvn4BKZnXoolIgCpKw1q7yAhlfupJG2Y7ii9vbg6rx9nxz2bdtITuKR2i7/dns2u40sBVx5qLgf5Q+/0qocWx17/lVzSIAWKVZoXN+k+jarNqi4x/IOU1cRzdncJQX4JgMGl+OyhrJAG3R+nrdyNAnCTrJskRiYg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iezwvvoHHyQPk9LxU4ElVQ2okNYkP3KyJH4FdXPRFxqXriR1LWI1bqeKZMbQv5L8LxmwA3cKae3/4sLMSPlp5cKEMGeQEAQeruTfclPwyHIIh4qCOTGTczhfOjYcAn1mALtj4X0Y6VIZL+1+bCEvss1jbZj+57raklB4LkCYNw+/OssMCfmS22rWrSo6UiO6eFVQXun7KBgKtgcfOxKc1O9JcZLhhqatASY6lnJGWWG81THWieLXXs33VRUO040x7jLX8PFUl+sguLnaVwJWA2Pk2C1L1Mw36K35dshCVZMn7POkjTluCHZFNYx5bPMro2EPN6MchCm1zaIVow4mmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzKMgzJn6lcDh8AQWns1RMHYti4lDAifTNrK95jdCmc=;
 b=eFPvzyoUbCqasYk3QRvwvQO/YdRW8d7jYy4ECm1n0CEW8eLqgcN5ohOkWf2uqVOdJhR8PO5XGFHx8pyN4NkU97zp84U0hjsmA4Hud6DfVTy/HOSVQE6w09B2xCUqjv+4dcEGmwlibWJUtCtVfoFSJNKBVCbMekpRUz64nlXPjUIEEVz7O4UO0mLgLRl4SexqeFkQ17+md/Eb11o4B77cBPv2nEDZjiXNtaczzzGOQ7qG3Ln56F+HfPhqflvnc2uPQNsTgCJfFaDHp3a8VlyOI/MfMEG2jYXA1Kh77cFExYSYbC7LtDPQzbM/ybX4ljOvUuzZ8LQb+9SUSDC5mz7IEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzKMgzJn6lcDh8AQWns1RMHYti4lDAifTNrK95jdCmc=;
 b=XNwy6Jhlo4fXvn4BKZnXoolIgCpKw1q7yAhlfupJG2Y7ii9vbg6rx9nxz2bdtITuKR2i7/dns2u40sBVx5qLgf5Q+/0qocWx17/lVzSIAWKVZoXN+k+jarNqi4x/IOU1cRzdncJQX4JgMGl+OyhrJAG3R+nrdyNAnCTrJskRiYg=
From: Henry Wang <Henry.Wang@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
CC: "scott.davis@starlab.io" <scott.davis@starlab.io>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH v1 06/18] fdt: make fdt handling reusable across arch
Thread-Topic: [PATCH v1 06/18] fdt: make fdt handling reusable across arch
Thread-Index: AQHYkXyfE6AfBDgn4kCb1ygs7X9Eba1yIjhw
Date: Thu, 7 Jul 2022 01:44:31 +0000
Message-ID:
 <AS8PR08MB7991E972327768E9E8D8B2CB92839@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-7-dpsmith@apertussolutions.com>
In-Reply-To: <20220706210454.30096-7-dpsmith@apertussolutions.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4C0966A4F0BF3446BF381DD1BD503BD7.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 90333ed7-0f38-42ac-bfad-08da5fba4445
x-ms-traffictypediagnostic:
	AM0PR08MB3059:EE_|AM5EUR03FT038:EE_|AS8PR08MB6168:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 U8JS7PZmVbnI5kqvvNzS/710qqbPP84H7BNGSVUm5S+e4cMG2RH3rtVbYIWkxzryHoYm76onFygVmGNbb8nK213CrttMWMGEQip4RJKybP8pii4JGL/ffq1koKatom82W1oRtTrgSca2wsyLLDP0Glg/apOEqfd93JHCAcHcD8s8Kjwh4tYsNh8OGmIEBnN1MG7zanh2Rpth2L16Ov/H+iKN/Ug/WQ1w0aBeRXO0g4B/IZeVR5xYwJJlsD6Ep7iV3Gw2xzaZPjFdcMQH2vTWDt9ctbX5IoS5tzFyHvEXGjMKKcgN+ZGbioDVP2wpvsAaonaLfsucXs2RB+I/FP08ujzY8MT8oVJBMsEQDknMBaJiLZJpgfhD16HdKRvBj2mew17dtmzB7WLMSXUTrCcAsPeqKZ0Ip92KCpr4KftlT/5Qaf1kEQOcg9FsM9lqPSDKYysSRQEYm7kVo58XenfAxqyzy56rxHDxMfoSsL/L1ALjdU4PZ2MvY5XkIe2StW0al+GemM8IOJr5EkPHm+xBaNSh6RAwQa9ZiaeEnsU6iWjbWd65zvj3pJvAiHr2gy9uI4sfTBbdEsLTiyMnnZAZCL7j7kGf5R1V2TvaX7i1Nkw/1VYPhrlMikEtnYWmkr1mdX7DM4WieB1tZ0R9CPZTAw/Mgay0MStRM8JuQ7wTQnUwBUBVEaMXnjQcOBqIZDfk1Gj4WuHzgYmMJlEhBGa8zmEW6H9TG2gaz61gi4+cZWTZVfoFnjfJKU+Q5OhV8fMMLpwVjNSVU0DIiiJRmsdR3PD06mz/vNKaj4O8urofAsVk320rpuWRnzOzEN4sxnxg
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(7696005)(6506007)(9686003)(26005)(38070700005)(71200400001)(186003)(83380400001)(55016003)(33656002)(2906002)(122000001)(38100700002)(66556008)(478600001)(5660300002)(316002)(86362001)(41300700001)(52536014)(8936002)(7416002)(4744005)(66446008)(54906003)(4326008)(66476007)(110136005)(64756008)(66946007)(76116006)(8676002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3059
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3a9caa8e-0b6b-4143-61ab-08da5fba3cb0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ikJ4Ksw0PVDE8HWTxrFpo4vUAN5fqMy8GgxQ/9rI2h8YIu0blxSY/Eukjkb0/asKHGStG6NKpXd45yDitUFJoT2aJwalPrM/iOllnVKvqmi/sw5njHd7cSqwZAxWMaUU8+qBy3zyb1WGCBNLJDBwAz4V1zzGIhMoMbiDGPAQbKvsAfi7Zl/qKFdl/L94i5lnvZtyIBysIn8/0u1y+dXsN6vJIJVcTriE0nefYoqD7g3+tVjmAGuic2QADch0RfDfzrS9py8wS0q0WEPKoKr1exGK0w/67H4q66zoOimaZ9b1shyLDbey+i15/gQNck7pFoWsFHOUVBpSQR8+U2VjoQIEaOkwU22GD/Qg73w/Dck9zgS8krylGRgnyFzTOMkRwMRPJaF1J2vyuMiNXx/Og+GlEWXysMtz9PSjRNb0W9gST/UM7pHPLSXhbguH8/7E7uCPA6W1X5m65aZFyGJzUFuPa2LxiVr4cx+cT9Dbx1bugLPdhB/jD5dlQ0Fa1PRDpccTg7ria2HMo0YL3n5gx2pxZh/XJxFWvcSd8LAc2QQrdPxlvGHEE+nItPdxiQvOeKM1/VkQMj7llfTTBU7KizWyZ+M+qqDhnl/r4KEsLYaOo7cHCFkyyLNicAV/NpBw452tb/wZ3T1ExnugVNoSAJRCohenT7lazSL6Q5hNsYGXjrPOLhsZ6u5LajAjfIYbylTW4xJY0IkIQ+iLoDKvPHupRlJ97QC86gt7rdbkA8ItE87ddq3B5VTV246P/Lqo/MAly+ywo6VoNe4WentBOz00UyNhrorB5kYfgnGB63ynZegHbwGbalzv0pq/lMH3
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(396003)(39860400002)(40470700004)(46966006)(36840700001)(336012)(82740400003)(81166007)(82310400005)(356005)(86362001)(54906003)(5660300002)(8936002)(4744005)(55016003)(316002)(47076005)(70586007)(40460700003)(36860700001)(8676002)(70206006)(83380400001)(26005)(9686003)(52536014)(40480700001)(4326008)(186003)(478600001)(110136005)(6506007)(33656002)(7696005)(2906002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 01:44:43.9699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90333ed7-0f38-42ac-bfad-08da5fba4445
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6168

Hi Daniel,

> -----Original Message-----
> Subject: [PATCH v1 06/18] fdt: make fdt handling reusable across arch
>=20
> This refactors reusable code from Arm's bootfdt.c and device-tree.h that =
is
> general fdt handling code.  The Kconfig parameter CORE_DEVICE_TREE is
> introduced for when the ability of parsing DTB files is needed by a capab=
ility
> such as hyperlaunch.
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Christopher Clark <christopher.clark@starlab.io>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

> ---
>  xen/arch/arm/bootfdt.c        | 115 +----------------------------
>  xen/common/Kconfig            |   4 ++
>  xen/common/Makefile           |   3 +-
>  xen/common/fdt.c              | 131 ++++++++++++++++++++++++++++++++++
>  xen/include/xen/device_tree.h |  50 +------------
>  xen/include/xen/fdt.h         |  79 ++++++++++++++++++++


