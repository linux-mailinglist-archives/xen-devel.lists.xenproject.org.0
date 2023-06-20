Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4AB7361FC
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 05:07:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551388.860933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBRiN-0006rB-CD; Tue, 20 Jun 2023 03:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551388.860933; Tue, 20 Jun 2023 03:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBRiN-0006pL-8n; Tue, 20 Jun 2023 03:07:31 +0000
Received: by outflank-mailman (input) for mailman id 551388;
 Tue, 20 Jun 2023 03:07:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+cFY=CI=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qBRiM-0005Pe-A9
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 03:07:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97459e9d-0f17-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 05:07:29 +0200 (CEST)
Received: from DU2P250CA0029.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::34)
 by AS8PR08MB6680.eurprd08.prod.outlook.com (2603:10a6:20b:397::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 03:07:23 +0000
Received: from DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::5d) by DU2P250CA0029.outlook.office365.com
 (2603:10a6:10:231::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.44 via Frontend
 Transport; Tue, 20 Jun 2023 03:07:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT038.mail.protection.outlook.com (100.127.143.23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21 via Frontend Transport; Tue, 20 Jun 2023 03:07:23 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Tue, 20 Jun 2023 03:07:23 +0000
Received: from 0b3fb1bc41ad.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9B0BCE5D-A362-40F0-82EE-6EE0C51CCEE3.1; 
 Tue, 20 Jun 2023 03:07:17 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0b3fb1bc41ad.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Jun 2023 03:07:17 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB4PR08MB9142.eurprd08.prod.outlook.com (2603:10a6:10:3fe::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 03:07:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%6]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 03:07:16 +0000
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
X-Inumbo-ID: 97459e9d-0f17-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLQpQpOhOr+auVK6MXQ1oCRvr6oog6ybRcT4RjaPepA=;
 b=Fj5eVbry4pbBS2iKsgdWXSA0Jz3sIVsi7A/hVDnrVV5IX+0x6yC4l2MULu6rOvxRMl/7WNIF4D5pfwCN+u+PShT0rXfRXdavy6X+AKMuciHrvybAZRGXYu3eMpiXCSTQASIq/UDFKSZ002oIxNqp2Ck/o7FTTLhJeZHMfMBBWZ8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OnTCo+tBFaJb0kUOblzqYbTQi6s4XAMDZrjl2mTALXBPs7xpNmMQAlh04sS2dRqNJ0hIA+kspi5cUmTj/0+h+GUdlw2HLicUrz5/B0LIvB6mxO+WSH/0OkJrSHT2fy7ZVUCGAKEoh22zWAm+WDHxKNwaqUchOf+JvivDd+ZZA4cilfpBToQNLJlXl4c+UwyPEiwI2L+S9uRKwJmbHfxPWbBU040nVC8p674PqBoKF/ntT0OdrbBowl2+1kOLQBV6kP3Vy5/s2l0NNnadDZjDU5ykWuB2bzEyWzny8Nde4J216BU+F52IQdQ+3NbdwAQcK/gYkR6P9MPf22HfxWoAjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLQpQpOhOr+auVK6MXQ1oCRvr6oog6ybRcT4RjaPepA=;
 b=Zj6iDVwLp6oZs0oPl+ZL1JUNsnEIhhkNiygs0Bz0qHBqUE9CPl5EdbacVOGcjqDIiyDC3GOg8RXB1r3m2EGy03HQpna6qbCwiyVm4kR3LhhVTm6pgIw1jDutHdIY//nuw2Lrsy73P45bh7uAfwLjz3b2Fl2/mRErNMrl9r3bPz55TR2UKCVSZTneXOf9vHBqVfRZyErL9tvA/+4R3wPf9FSIbbse2AWSJhdhYQF6znRWyOAY+F+GCVDux1x5Aal/k4NHwxSjE/Yi+6FkCLOJ8dRPr8XSOaT9JxRRnswsk/HcNjsSUaOWhKSNwAwH29bUpcLpIyPv4wATMcJEjD/z5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLQpQpOhOr+auVK6MXQ1oCRvr6oog6ybRcT4RjaPepA=;
 b=Fj5eVbry4pbBS2iKsgdWXSA0Jz3sIVsi7A/hVDnrVV5IX+0x6yC4l2MULu6rOvxRMl/7WNIF4D5pfwCN+u+PShT0rXfRXdavy6X+AKMuciHrvybAZRGXYu3eMpiXCSTQASIq/UDFKSZ002oIxNqp2Ck/o7FTTLhJeZHMfMBBWZ8=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 7/7] xen/arm32: head: Widen the use of the temporary
 mapping
Thread-Topic: [PATCH 7/7] xen/arm32: head: Widen the use of the temporary
 mapping
Thread-Index: AQHZos+8C/o4+lU2y0K001pAm5cZ6q+S18mA
Date: Tue, 20 Jun 2023 03:07:15 +0000
Message-ID:
 <AS8PR08MB799142FD315AAADDC5F523F9925CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230619170115.81398-1-julien@xen.org>
 <20230619170115.81398-8-julien@xen.org>
In-Reply-To: <20230619170115.81398-8-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 57B4F6CC442AEE4FB9EFBFF83BF360BC.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB4PR08MB9142:EE_|DBAEUR03FT038:EE_|AS8PR08MB6680:EE_
X-MS-Office365-Filtering-Correlation-Id: f0b604c1-cbf7-4ab0-d89e-08db713b77f6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Iz2edlCE/C6To0QDG0Xb6hqaf5+1+IR3FxijFhOP/LsKhMZbhYTFR4P4m9KM3cOSRlwjTbB5EU2hLNQsm1IVo7JlG3Gx7rXNtK5QV7lCtsAHPEE3SwzltwuRmD+fl8vveLwTCS4KkUFpPM2hJ2Hl/E7/qE4BHFFmZXc2dHiH3UP8mDtEYEcgFG/zXgx3xe7MnpMQ4U6werGunWh1pGR2gtif+XP5HYWSi4ktvtfe35rCg+mEKAGXtzbRkQzRoJkoXbYc7LBz8xF+VNOxSY+1TYvzr+q3SyrXtyGs0V2Znv43VYT4B5DaX5BBRC34NUFVgQCVHcF0yqrvYa/g9pmLG6ElSIE6/NdGc8Ro1naZx3+Uj8C5iL5xqbDHXYex1NvxCUD3i1BiJGQUBEH0pa3hcrwe0/OlYp77k1rGDTA89S1KB8MbAJp7BFEjAT80RG47hYa1UAsyxlR4/fAUVZGDZcm3C9ShbNZOiDacjD6s1hW5rr2/8h5OZhbkRMm+LuwzBiLu7gL8cnZhsOCCLPa/7M1Ch8rHP5piec0lvfqQLCEm0RvUPFp0Ot5RzUSl87F3Qu8dkVa9CWQ+t7ibzFtwRKgv0vLE9/LS7Yu3QzWXYKFPNc5tI931ZlhXU9W27szx
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199021)(71200400001)(7696005)(478600001)(33656002)(83380400001)(186003)(9686003)(6506007)(26005)(38100700002)(38070700005)(86362001)(122000001)(55016003)(8936002)(52536014)(8676002)(5660300002)(316002)(4326008)(2906002)(4744005)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(41300700001)(54906003)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9142
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c2d70326-feef-46e6-6623-08db713b73a4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sfwgvv8BNFuOtH7hJlj3WOqBCScPuu/mgNUtclGQBuWgtYuij1GWWNIEV9kOaQMob1rT61YkzgvoEU6VQApJIaMz+i+/EZXUax1Oyf4qxSJW4GZULIncwgwu2YTwwTpdJOeivrl0JP9ykWY9+3nabcMv8gOWabMf+FOm0CzyOqpJg1y9OwgsVvIfCfj591hUE4jnWAG6wP0h2neMuvH6e4P/uGKUtl0ae+UbTs7T6HbumqQ/Rz/aMx5jlfADOtBQibEFL3fO7n53b6ycrbAHZhBf8o0h/3VppO1u/RUiQOAJkdFBpGT1CLRLcFnQ2m+9QdYGUBq8lnvdhvFy9Il7McBSvjtyAm63zfdlgqbYUDs4RHzbCKmcQnbgBizxmia7qIpB8ssUs0uLDhhUQ2FUxQCRCjrykTPAFxb0JpnBHhZfS+jR3VIYy7u68rfrnjhQwhStAVbD97L2+QI+XXxoNHIuI8+AxQkrRuDmHGsWcRu2xnLLcCldywAPHFMIqPcTOCuisvh7eMhrrosBTGtjSYulodrq3CTFjPz6kzDMTE1iFuNud6v2XY1N+aWhvQwflEGOjefwQVcWYBLGMVQb43cj+5vh5HAhSFgvOvw1DyNu4j4rwQbVWMxqWE3aZmYlrDEgpjSNxDryB7/t1Pi/lyUMDPAmCOw+BTaHsYjWJOacjVwsjIaYn4IPF0EbM80nu7lK12XUTD5a32nb7+Td9DJcQdNsD0B/VANHehhxc2Mpp2gHwALUiZqv3C8UpG0m
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199021)(46966006)(40470700004)(36840700001)(55016003)(4326008)(316002)(70586007)(70206006)(40460700003)(86362001)(2906002)(4744005)(47076005)(336012)(82310400005)(83380400001)(36860700001)(8676002)(8936002)(52536014)(107886003)(5660300002)(33656002)(81166007)(356005)(82740400003)(40480700001)(186003)(26005)(9686003)(6506007)(110136005)(41300700001)(7696005)(54906003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 03:07:23.2732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b604c1-cbf7-4ab0-d89e-08db713b77f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6680

Hi Julien,

> -----Original Message-----
> Subject: [PATCH 7/7] xen/arm32: head: Widen the use of the temporary
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
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

I've tested this patch on top of today's staging by our internal CI, and th=
is
patch looks good, so:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

