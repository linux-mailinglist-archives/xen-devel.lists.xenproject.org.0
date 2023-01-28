Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655A767F49F
	for <lists+xen-devel@lfdr.de>; Sat, 28 Jan 2023 05:23:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486064.753545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLcjW-0007oL-Sk; Sat, 28 Jan 2023 04:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486064.753545; Sat, 28 Jan 2023 04:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLcjW-0007l8-Pc; Sat, 28 Jan 2023 04:22:30 +0000
Received: by outflank-mailman (input) for mailman id 486064;
 Sat, 28 Jan 2023 04:22:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dFBb=5Z=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pLcjV-0007l2-B9
 for xen-devel@lists.xenproject.org; Sat, 28 Jan 2023 04:22:29 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2082.outbound.protection.outlook.com [40.107.14.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e8f6d29-9ec3-11ed-a5d9-ddcf98b90cbd;
 Sat, 28 Jan 2023 05:22:27 +0100 (CET)
Received: from AM7PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:20b:110::35)
 by GV2PR08MB8193.eurprd08.prod.outlook.com (2603:10a6:150:78::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Sat, 28 Jan
 2023 04:22:22 +0000
Received: from AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::82) by AM7PR04CA0025.outlook.office365.com
 (2603:10a6:20b:110::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23 via Frontend
 Transport; Sat, 28 Jan 2023 04:22:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT021.mail.protection.outlook.com (100.127.140.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Sat, 28 Jan 2023 04:22:21 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Sat, 28 Jan 2023 04:22:21 +0000
Received: from f430aefa61eb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 10AD6028-5B4F-4279-BCD9-91E083529096.1; 
 Sat, 28 Jan 2023 04:22:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f430aefa61eb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 28 Jan 2023 04:22:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9138.eurprd08.prod.outlook.com (2603:10a6:102:30d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Sat, 28 Jan
 2023 04:22:02 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.6043.023; Sat, 28 Jan 2023
 04:22:02 +0000
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
X-Inumbo-ID: 5e8f6d29-9ec3-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xAuOrLTh7mlsR9R63XbKpHBxxCyVMa9LcjLskT0hoM=;
 b=REUZpziHCMUVfV6WNws+ctyngkYl/LN9qqNEZIh/5AThYaUUZt2jOpCnoev3FL68WejKLNwQ78AKS08R7HSd3zJYwvVoM/bkVvVycenpUovGasaY85VDpcEQZmXXCkNAwR95SqPhNQr+Y8bDm+rPyn8ehxsYeaSCq7kDVBOAfkA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BT2/aulhOtPE4SXi1gaT0qZ8PFNwBrXr5eqWU8IA+F1FR4kX1B1cNns+Y8bQQHmVyLxXv4pRc5DZMKvbvfFYAN2uuEmeOdabvaajo6A6+M7lJS9LaxcbIBXR9aDh8exMQ5QycmIquPACAYrRN1rEsigEd6EHsrXrL8Rx6axj55MyQv7KJO7UUr20NGp25apzm9fAsaARtXUCF40f1X2ULZpywsfSrlXFljVVBP3vrTzdDNI3Mqi8fN/W8FMiV/ND78tv7Pls2AqFMyi3/PkAt/1tCf89dF1kln6/y7MiSsdX38tDi8TTXvO4VHE/MasREEa0O8zL9NSw0wTsNIoooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xAuOrLTh7mlsR9R63XbKpHBxxCyVMa9LcjLskT0hoM=;
 b=ebBVYd9I2+t1xNwtxGbi29zSyd+eaYbDpRrkihfVdDqbtePsRHrMPDATo77RyIqlqvyjhycZdYg9DyRw5d86N0MbHJOpNjVSlCzPfsb0pfVcDwiPLbeUe7uwTR3156cyFX9ydLxNCUGsKljaT/yG4B6m14Ko2xPWKFqioU4mG7xa7UaCQ4I7Br2tiDIbSxk1hrlTBK8kdRrO2cx0M6egDwdGXiDf2Y+0Kv53G0WTopMkGMNhNPmWRJJOQ8M1I2K7vCG7ijYi61zulmaddCvJJw4fjw99rSzbiaG2xX/535NCQZKwPpIbpuyeTNii/EYGviO6oA+b36Wmhz5RKa+NcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xAuOrLTh7mlsR9R63XbKpHBxxCyVMa9LcjLskT0hoM=;
 b=REUZpziHCMUVfV6WNws+ctyngkYl/LN9qqNEZIh/5AThYaUUZt2jOpCnoev3FL68WejKLNwQ78AKS08R7HSd3zJYwvVoM/bkVvVycenpUovGasaY85VDpcEQZmXXCkNAwR95SqPhNQr+Y8bDm+rPyn8ehxsYeaSCq7kDVBOAfkA=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v5 1/5] xen/arm32: head: Widen the use of the temporary
 mapping
Thread-Topic: [PATCH v5 1/5] xen/arm32: head: Widen the use of the temporary
 mapping
Thread-Index: AQHZMolUoPTZuw2UFUyOpejFjtxMfK6zFitQ
Date: Sat, 28 Jan 2023 04:22:02 +0000
Message-ID:
 <AS8PR08MB79912CB0263983B5551A946B92CD9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230127195508.2786-1-julien@xen.org>
 <20230127195508.2786-2-julien@xen.org>
In-Reply-To: <20230127195508.2786-2-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B9FFF2330491DA41B0C9B0C61B5904E6.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAVPR08MB9138:EE_|AM7EUR03FT021:EE_|GV2PR08MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: f687242e-b46e-493c-7a34-08db00e7402c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8zbaKRGvAbEeEzeP2EMIRDkvW0/l7T9zreLavb9X6mvHSVOAAeb/PzphJ9Hf+YEXNPsSlTUD4DrTRvg17NZ74yCvAWa6HSeFI1UWfU+S+X7dq5+bi+OUNp/26XJL1RnTkchsWm+Lb9x6ILAaQ7YKSsAT1Ezavb4FTXbGxRTQxsNCLiD2rGY1bUw/q5AWfAFMw2qOG5dXU2+s/5e38ILq2f1ade0l/3pocH2TW80HxBk+WMNSM/syMWzb9E8dBe9RoTU1VeyfCb77V5IuhvC4QHWTSPOZ8gb3VRhT9YE8THbN7upSW6UcUAoA7dyNVUsJbETrdQ3y+HBqYefvOtulLTrkuMW1Zm9fNoIik8WmryxRDeE2cuDXebjtPn5a+4G0F37uR4OkxNDp/qKgUZ/S66SNa3GLKvKhJRqLbXneSN2Osnwra3LU94yKF1hPBSXlcjIrbgoGbJyiyDf4RdQ7xp0cGRlyvE2++tyfiAc06XeACEVkl46fTViHLb5E19WIdSx7A9ERE+FM5VNhPozoBrPU5LrdrL9B+uFgkhKB6iH/bMiZ+JkUmnpjNMWIrwg7jnU1QuUXvGNu916xOiATT60/j8b2+xrvUGm8KX15M2BsM7dHnZQMMnB+2GNcIGhrvEcOJeBRmbMGSLgOrDDmPU3VJNdjYU8uzzB7oLJwrFvXPSFu7JDTdbpYkef2pJKDM/u0mTXWQc8EDuxpcRxKD6x8u9OZOdNOfhe6N10Lm3M5Lwq9tobf6b0MQtaLC8k9
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199018)(186003)(6506007)(38070700005)(66446008)(7696005)(76116006)(64756008)(66946007)(8936002)(66556008)(4744005)(8676002)(66476007)(4326008)(2906002)(9686003)(33656002)(41300700001)(54906003)(71200400001)(110136005)(55016003)(122000001)(86362001)(316002)(478600001)(26005)(5660300002)(52536014)(83380400001)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9138
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	434181c9-4b29-42b9-fd7c-08db00e734b5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YvZX3ZKWc14+9hDAjLbOkY5Qy7eCcF9Dc4pQfZAAbzJ0eDWxfjZ6+o+vYMQh6yVzbV6oCUc74qOtH4T4gqgpS56FJ2yej4CK9Z6qhUdit5SpO+TzlE0CSYaUOZbBD5RUY5ibv3qab2xyXuegMgNNni4TmO+bFLq/6DkGCUFIGEw8XghYzmqsaxb8tQKbYXS9/Wu63VeAwSeJhTT6fStVqODrfX2p2xDebhXBsaGrZOH63hHp7NAB4vgNJHtbM1dpMhseqbnRLcOLonvzTVO5vjpEyO9oOGzmmB6pGSZOkaWGFP8X4Xz7xvNXsDrmVzs+d+qsGFl9YNJ00+KbsXHqElq0TJfFFex70f/nxVk2UF/hY7ZTtHM0wofaWO1V2s9HBZkp/IGynKT1QFp5K1FM+SrYIdJTXFpUtLIKWbAWhVwgDFb/L6BLFK/1gGERYx9+MX+mdnALzvV2a3WtfeOs8jE7PI1JKv1YxKU74LC6//Cg2WXwmJLxEbvBL1xw26VJMFiMx6K3ZX5SME/aKifNR9wpwXFdBBrq3VTRMGrhilZOOsKmLYGO9cn3IlIbz4UJSA1p3RhIBGd8wi5ulPBwMP5IglBPKAi47mVg5lOaWxynvo6RYLM3JJb1thDmNzrphYemYjGPE/ZtpSVmPGJKJHwI/7uNpnTsGByS4rfDZLdnlHNiTTHz74LdOa5FVMGAc/M0d9egx54CvGiTPJlAgQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199018)(40470700004)(46966006)(36840700001)(47076005)(8676002)(7696005)(33656002)(40460700003)(86362001)(81166007)(26005)(55016003)(36860700001)(83380400001)(9686003)(186003)(82310400005)(336012)(40480700001)(54906003)(356005)(41300700001)(70586007)(4744005)(110136005)(107886003)(478600001)(4326008)(6506007)(316002)(5660300002)(70206006)(8936002)(52536014)(82740400003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 04:22:21.6690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f687242e-b46e-493c-7a34-08db00e7402c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8193

Hi Julien,

> -----Original Message-----
> Subject: [PATCH v5 1/5] xen/arm32: head: Widen the use of the temporary
> mapping
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, the temporary mapping is only used when the virtual
> runtime region of Xen is clashing with the physical region.
>=20
> In follow-up patches, we will rework how secondary CPU bring-up works
> and it will be convenient to use the fixmap area for accessing
> the root page-table (it is per-cpu).
>=20
> Rework the code to use temporary mapping when the Xen physical address
> is not overlapping with the temporary mapping.
>=20
> This also has the advantage to simplify the logic to identity map
> Xen.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Tested on FVP in Arm32 mode, so:
Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

