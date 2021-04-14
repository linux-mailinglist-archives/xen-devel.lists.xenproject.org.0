Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9922F35F158
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 12:15:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110451.210827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWcY2-0007ZE-3Y; Wed, 14 Apr 2021 10:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110451.210827; Wed, 14 Apr 2021 10:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWcY1-0007Yp-Vf; Wed, 14 Apr 2021 10:15:01 +0000
Received: by outflank-mailman (input) for mailman id 110451;
 Wed, 14 Apr 2021 10:14:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l1ra=JL=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lWcXz-0007WX-Sh
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 10:14:59 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::619])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2a7baab-8cc1-45b2-a4a3-9b578428d329;
 Wed, 14 Apr 2021 10:14:55 +0000 (UTC)
Received: from MR2P264CA0042.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::30) by
 VI1PR08MB4382.eurprd08.prod.outlook.com (2603:10a6:803:f5::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.18; Wed, 14 Apr 2021 10:14:52 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:0:cafe::73) by MR2P264CA0042.outlook.office365.com
 (2603:10a6:500::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 14 Apr 2021 10:14:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 14 Apr 2021 10:14:52 +0000
Received: ("Tessian outbound 9bcb3c8d6cb1:v90");
 Wed, 14 Apr 2021 10:14:51 +0000
Received: from 96e67fce1e9e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7C29FB28-EFC8-4427-9F87-35A65974067F.1; 
 Wed, 14 Apr 2021 10:14:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 96e67fce1e9e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Apr 2021 10:14:41 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB3312.eurprd08.prod.outlook.com (2603:10a6:803:46::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Wed, 14 Apr
 2021 10:14:37 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4020.023; Wed, 14 Apr 2021
 10:14:37 +0000
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
X-Inumbo-ID: a2a7baab-8cc1-45b2-a4a3-9b578428d329
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAiUwCKuHt4rmaWRpICcakGzsNcTinl6FR0YNeTAW70=;
 b=zoW/OZf1k7kXGY4rlx8EZt8yIul1g+V++2JJ/W8Vn6e6jI8PkbrZqfZo23nHFwZXvQv4pL0yar+9CrrujTUsAVtov/3g6LQa/mZ/QekM5DJoR8VX4NFasjwgnfhah+IpitF/qqN5nBruAXc01nQEjkKLwj9HbBsl97h1oe0JI84=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 299993c982861b1b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2NMpui5bafaLgaV14U0n6Z3GppZD/ZmM0umXYWR0h4fs0imanZ7rKpaVftLW5WFT8enyZKvjCB9T8jWGi3cCeRDLcLVNXdonZvUDW1je6L2fQM3rXmJmXWjunKUdn+ZySrryGKVIrdCiKygU0flKFX+pfDmkGb80r4g6+Gn6LHUBgITsdAcCbEH2mlCtXxsAHh6Pxie8Ei/OXcSGC0O+IVS7eulfLppIuhtP1+/KTbesafKf1iMvDjInqTJ2d2WMi/bjhYaX0Z6WmCzDYRLqROdH6/sV+iwxYmRP3n0HcmTJjXvrtnNi8YekoLMl5YvVp82YShtlHszFBywbt4UKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAiUwCKuHt4rmaWRpICcakGzsNcTinl6FR0YNeTAW70=;
 b=F60IzQb1Yxd8IwAInRcdTuyBMBrc3q1vBxyHnJZ5oxYK1gtfK/mI8BZeB9S77g+Y3EpZRF1kivrJJqPSKgZIadVSivGqyq53B+ksLvt6APbEQVTnPc06pcpDKRbtev9qDbPh5DHUDB0Rlo8E4f/Ofl55LQzhjkUkyNWYlfNrCtB83xk9slQhzFid8T5LYkAg9TiFc6uCVHlnWIRARDhWexZW9eowcPGEwOxfV+okwVdv/HGdd0FYoXlT3DOql96wcVek3Qg3vfqw1CqHByzwIryDIvSbHWyr44w2cFhSIAUEoP6GPqlBQ/QHJFpsrjdNUcf1XRKJZTN/iVtGKZe9YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAiUwCKuHt4rmaWRpICcakGzsNcTinl6FR0YNeTAW70=;
 b=zoW/OZf1k7kXGY4rlx8EZt8yIul1g+V++2JJ/W8Vn6e6jI8PkbrZqfZo23nHFwZXvQv4pL0yar+9CrrujTUsAVtov/3g6LQa/mZ/QekM5DJoR8VX4NFasjwgnfhah+IpitF/qqN5nBruAXc01nQEjkKLwj9HbBsl97h1oe0JI84=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 3/4] xen/arm: Clarify how the domid is decided in
 create_domUs()
Thread-Topic: [PATCH v4 3/4] xen/arm: Clarify how the domid is decided in
 create_domUs()
Thread-Index: AQHXMQ6fDaCb9krTZ0m5muPO6Ilq06qzy9WA
Date: Wed, 14 Apr 2021 10:14:37 +0000
Message-ID: <45357FA1-74FE-49E9-9BAB-8EF084975A2C@arm.com>
References: <20210414091404.14215-1-luca.fancellu@arm.com>
 <20210414091404.14215-4-luca.fancellu@arm.com>
In-Reply-To: <20210414091404.14215-4-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a49ae406-bc12-4776-c631-08d8ff2e24a7
x-ms-traffictypediagnostic: VI1PR08MB3312:|VI1PR08MB4382:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4382B76DDC46E4268EF277759D4E9@VI1PR08MB4382.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:813;OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 J1fGGA4D7db7ky9BXQtFFlzrQ1yh9fZO92cGri60dLjBXK4/60Gz9LGw6tL8kDGtterzIihWAdsYmYQblQIZY6eM0jouVdDiVPkGNIGL7KJ0lqGYB5dcviPgmF5nJE0Gpc4h2LqRoaOmpSfJiHgH0QC57/lRSt7Qn755a1ToHaur5Z4QZ8ZFHaxnnVu2XcBna0RY5veb04epg1agXzy47ceHkfNPuQwon4/67X8TzDbSjuFWq1Hpvs5OCHbEIHbXIql1dGRN3t75qCqs1vUwToJmGvbDtx0PxffHlMQb1R6QvijG+jN+M20fBxu/hVAdh7lc8klVeq3RdPGUyekmC60CqRhMe6RpAElNBogUerpss6VKHxlYV99yqRewHT40eNdx1rH65ZEygIjfPCW/taxdVTAl/0NDBeTG8VHAdMmM6Gup6AtQLu3n29gh5dpF9tWvsSxNhcooKY8JixQbdBd4QdT00U5bEgL+ocXp3XiDnXMLXBPz5SzUiQlcHsNjSt96il+DJX+7ZXyZa80JjYRCjoveBTvfiL/Ms548ik8/PCCMOR0hff3rRs9rp04Ey6skcKsWAAt4/4tYRgeHVkyTBcOfy03FPuXfZJDcKpT6RPepVcO5zdYZyIzXuD1aMFAqrltd4+HEWrnHwdxnxse8b7ZmqTVbYlqzhv0PFnI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(2906002)(66476007)(66556008)(8936002)(316002)(66946007)(91956017)(76116006)(6512007)(37006003)(33656002)(6862004)(26005)(54906003)(66446008)(36756003)(6506007)(2616005)(8676002)(478600001)(64756008)(186003)(122000001)(5660300002)(6636002)(38100700002)(86362001)(71200400001)(4326008)(53546011)(6486002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?ngkVPbQpnB8w0CVw3xXkOaPatWWftqRTXbTR+VrvkkEqF8kv6r06fnIU1VNt?=
 =?us-ascii?Q?Qm4DyO2H7GsXjUMJ6dZws0wfP4t8sQBggC+tAxywc9RUHb88Z/XxBetS5Nqd?=
 =?us-ascii?Q?yW5ARQLSCj0UXzwjO7rY5M62TYinKt2rRM1BzgYDdR2LtlUIiW1lAnc4LrFx?=
 =?us-ascii?Q?+C+rf1ZzdZEF9t9KDWCuHP/dammRmSSUK0DtJ9JX8rmffcDbl8khqHZ0eBi9?=
 =?us-ascii?Q?5uS5NMkCrm2RspsZMFKG8k8prDOkjFhJkJz/SUrLtBeIRtLgaKB3udY9hhxH?=
 =?us-ascii?Q?eoy205PteneW1mjdD7t8jQAHPzGXJmmjJdRiE4/COoAY7Td69pL4siFx0Zsb?=
 =?us-ascii?Q?8/qGde68ckYbRZiaOabvrSdA57EmkXU3wQMB1sWitTBL75fS+1hOO9gebUNz?=
 =?us-ascii?Q?cQr00exUxcnqMApxRa0Xvwwa2qQAgZzPguG5c331oAVJgYN1wUuPzIEZtuWF?=
 =?us-ascii?Q?wnKYWxbsgUioDyVNjQ6sxaAM2H1ccNkMIOLBu4ag94guXze24F3jXj2yVWfR?=
 =?us-ascii?Q?uG3Bpjb8cumCwDyTdCebIbqLZoQ71KAc6HVMPWczzBZklSDgA+hjQtkLijgS?=
 =?us-ascii?Q?Jay4jDJRCZX1ZlwN460w4th3M3D8xbzxGCb67GiS4AhcQ4cCt1frHM8Qb933?=
 =?us-ascii?Q?LwJClEwDluG+DIDjqiUyXsF9fI7OLw8rW0NHAfN3UGKxj68b6NrOkxjtoaXb?=
 =?us-ascii?Q?cdpmY80VZrfUefQvn273SOmEMpI9kjiZ3TzBI+bie0rZDkm9g9faxsEHqd1G?=
 =?us-ascii?Q?iR1xpyiRTCYgSgMOQClq4O0iNrXU7mHt92QIl+akALisZGOaNKQKp4IPTxDO?=
 =?us-ascii?Q?dKrSh49GeD5DTzX1i8qbfRUudyvqDULr4D4yf2nPtyObuJiMyzlO3tHtvQKM?=
 =?us-ascii?Q?mBd3jZsmgEg39krIs6ueiydLBkSmUAWzcjMyAGmMOjNJdc6Zs6I6hQfgtF/C?=
 =?us-ascii?Q?r133V57fRcHeIaeliJ6bhYNfEG9G46G5Qc0vldHX/V1ii1pvMqGe6esx1IU/?=
 =?us-ascii?Q?SbvMuN4XvVZbWwvAGq1wCakcCnSeVfQ/eZlMUHjqL1trCS0oaSD6JPAQ0UaZ?=
 =?us-ascii?Q?/OVoO+ME/bUNEcdIsftp1t4wynEgOyMn2+lqT+pSE4WidDeQfntd3nDam4Tc?=
 =?us-ascii?Q?PuflUfQUnEKmwHoSfxrXcMm89oonkMbjljKda9F2qgbc2xTGQYMNhAiiwJor?=
 =?us-ascii?Q?suGNguBhcfo7NeC6rh7PJ0V38CVTtutzky/5zac9vUiF+L7sLYw9ncGBjfSF?=
 =?us-ascii?Q?X9hK7qryWklZ5dMXJdLcTn1hUytDtgXgsPBD6n//OwjIrMOGsxXfrboIx2M7?=
 =?us-ascii?Q?RFK1uIHGDAdFV9NuYx51LFAa7e1yOkQofFbUeklOlnS0gA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EDD590D0F1975D48B41F0BDB5EA8F930@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3312
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6b1d335d-ccb8-4e2d-d3dc-08d8ff2e1bfb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jnyaTkFv1/8n20DoyQip6TGinArX2eyKj6ILd30HBbmrjsA51BX7b+QoX7bozglPhZ3dJW3Y6yGjBrTarulMd4ldruWVDXBTourwtWwGFS58ufXVLbPWb6tQ/+RVtXMET+P3aGy2Uz1VxtEQf8Iuf4EfeQ6RJDZffrQbeeJia5BMXOeYHzg5xqBGBaD949B6lgd/ueTSfadd0On1DU9KaUnvGNx9QAShG4PPrrRKoCNQN2Z15Viwd+ZBA4KxCRAfbOoVHwfrzr6JasUUTOf3BGwHH5iSuvmZdElf6Bej+rSu9Mr2ZblKi1GYcUSTkSs7uY9rDywBLr5emhhM7eGBmSBmEdr1J+uQkozVnSb2FEz0dFLZaq6hnH1LFkbODJsYyUuW0rbTDVmHjlX9j+DCiMBFpe3yJj80RczQxl8mI/dUVDa8x15nicAguZGswNRLhm3QBY/tsGW8qPPQfT/ww9geAXBrzC09ZuO67067oe3Jq1xH//IojsITxwnMkOTpEPh54E15iyIaHdYJgTZtEJBALLERRBibkEqDedRMmSzslNFrFAh6t8z1fcxLmqJHzqXB234MChjFT+N7ETVwAhH4jo0R/BgzMjr/t8cIUpUyyf3nxG5KdR5+HZ9nftNX9oNmcEY9hv8AnDwYeegSQN9OrIOViP+qbxr1D08QAzg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966006)(36840700001)(82740400003)(356005)(86362001)(70586007)(36860700001)(6636002)(8676002)(316002)(2616005)(37006003)(4326008)(53546011)(36756003)(478600001)(6506007)(47076005)(186003)(33656002)(2906002)(6512007)(26005)(70206006)(8936002)(82310400003)(6486002)(107886003)(5660300002)(6862004)(54906003)(81166007)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 10:14:52.0229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a49ae406-bc12-4776-c631-08d8ff2e24a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4382

Hi Luca,

> On 14 Apr 2021, at 10:14, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> This patch adds a comment in create_domUs() right before
> domain_create() to explain the importance of the pre-increment
> operator on the variable max_init_domid, to ensure that the
> domid 0 is allocated only during start_xen() function by the
> create_dom0() and not on any other possible code path to the
> domain_create() function.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers,
Bertrand

> ---
> Changes in v4:
> - Change to the commit title
> Changes in v3:
> - removed check introduced in v2.
> ---
> xen/arch/arm/domain_build.c | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 359957dc1b..b1d7b9849f 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2508,6 +2508,11 @@ void __init create_domUs(void)
>                                          GUEST_VPL011_SPI - 32 + 1);
>         }
>=20
> +        /*
> +         * The variable max_init_domid is initialized with zero, so here=
 it's
> +         * very important to use the pre-increment operator to call
> +         * domain_create() with a domid > 0. (domid =3D=3D 0 is reserved=
 for Dom0)
> +         */
>         d =3D domain_create(++max_init_domid, &d_cfg, false);
>         if ( IS_ERR(d) )
>             panic("Error creating domain %s\n", dt_node_name(node));
> --=20
> 2.17.1
>=20
>=20


