Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C166D4161F4
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 17:22:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194444.346391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQY0-0007Df-JV; Thu, 23 Sep 2021 15:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194444.346391; Thu, 23 Sep 2021 15:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQY0-0007Bj-GH; Thu, 23 Sep 2021 15:22:04 +0000
Received: by outflank-mailman (input) for mailman id 194444;
 Thu, 23 Sep 2021 15:22:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y7SS=ON=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mTQXz-0007Bd-KK
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 15:22:03 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.50]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0072c7fd-1c82-11ec-ba52-12813bfff9fa;
 Thu, 23 Sep 2021 15:22:02 +0000 (UTC)
Received: from DB6P195CA0019.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::29) by
 PAXPR08MB6527.eurprd08.prod.outlook.com (2603:10a6:102:156::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 15:22:00 +0000
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::4a) by DB6P195CA0019.outlook.office365.com
 (2603:10a6:4:cb::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Thu, 23 Sep 2021 15:22:00 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 15:22:00 +0000
Received: ("Tessian outbound ac52c8afb262:v103");
 Thu, 23 Sep 2021 15:22:00 +0000
Received: from c6faf7a0b3f7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C1A37528-9CFA-4F4C-8CAD-A1DC48B1ADA6.1; 
 Thu, 23 Sep 2021 15:21:48 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c6faf7a0b3f7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 15:21:48 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM5PR0802MB2497.eurprd08.prod.outlook.com (2603:10a6:203:9f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 15:21:43 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%7]) with mapi id 15.20.4544.014; Thu, 23 Sep 2021
 15:21:43 +0000
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
X-Inumbo-ID: 0072c7fd-1c82-11ec-ba52-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9r3/3zlgkI8hibVZupWUcz56kvYJylQd6uukQR2DlrY=;
 b=8J2of4c23oLIE5Y6Fw1u0T/VyrGPEYEpotFzAU7Vc7gwCMkJc66f9dq2tKF7+Q4khWy8+4jT2fwf/r4BdCXZeChbnA/YTt/HB1sL6kvJ0Ir0Rqxnx8rz4MVso6Z8wNumZYmH+KlKmY8O676aZlm2sYr6xZhQSzMZRUKDnziKRKw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5660dd6988b5a634
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8UNjUhFliCzMYHfv7O759+cNTvrbfuYeG9o8tb0++r7TyR/vC3oJfZ7iohZrZw3oeyptrFVzEPljWHnQNNBCfmOrNVy5vL1pR+3PB7TsvEPgYazIXCkPjiLf92Bi05zhU1OFt7AwwR3U25MDlS3e12PUrrMZJzRS9Baq5v9aEQh0pS0XiQr7tf8FjqzCEowNM9YZk6X4WmjdU+zQKcuueSoXiS4e5h0R+dp5wzZV+hzNu5a9LrE0g9kfp8eo1eQnjMnD4cOhTc5PL9IW3bgkuIsj5v8df/mUw32O2Oite/kg7YtooXceBTIa9MGprCyjlN+oRkWEbsCkcUKiMR8bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=9r3/3zlgkI8hibVZupWUcz56kvYJylQd6uukQR2DlrY=;
 b=Xp1cETXRk9JPxwHwK6AnZY+NHPJzwTXiwlNmlbq6e3/Kk3xxIfLLtDPNGJlxOghs4Dlt4K8/sSdG5jfmIrwcFJ353IRgJIMtRWzzbcEL0zy7I14EYm9nmFkMiE/WAsQW9agt08PyMc3ipi9bUhCwf2YBqIfLRkN2EerXt/BPOHea99i+FUN9TWrI/3NAuLqnyfVq4FN3L5+9BzzS5BN1eutZUY5foJAIPc76UGEcjxPIRkHQ2e2D0gamLsmOdV5UzW4eMeT+RUK6SyzO883GSAENmghdRQOdOV48RO+xWOI2XBGrGtAbQIx9B2eXB5ZW+YmiX2ahJzNz84WgpdCQlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9r3/3zlgkI8hibVZupWUcz56kvYJylQd6uukQR2DlrY=;
 b=8J2of4c23oLIE5Y6Fw1u0T/VyrGPEYEpotFzAU7Vc7gwCMkJc66f9dq2tKF7+Q4khWy8+4jT2fwf/r4BdCXZeChbnA/YTt/HB1sL6kvJ0Ir0Rqxnx8rz4MVso6Z8wNumZYmH+KlKmY8O676aZlm2sYr6xZhQSzMZRUKDnziKRKw=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 17/17] xen/arm: Add linux,pci-domain property for hwdom
 if not available.
Thread-Topic: [PATCH v2 17/17] xen/arm: Add linux,pci-domain property for
 hwdom if not available.
Thread-Index: AQHXr6bBfRQPNKXni0uaclDek7ufJKuw7NmAgADRRQA=
Date: Thu, 23 Sep 2021 15:21:43 +0000
Message-ID: <D73B88A5-1D76-444E-9DCD-12522004280C@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
 <e1b8d878709dc8e93a3bb340f921a24976cebb57.1632307952.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109221948300.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109221948300.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4b25f4d2-b377-4b6e-7f2a-08d97ea5e3d3
x-ms-traffictypediagnostic: AM5PR0802MB2497:|PAXPR08MB6527:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6527B854F640C5EC2FC53B23FCA39@PAXPR08MB6527.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yCeIxKJvoCBsXkFJpX8b4VoSbsDD4iotV59vXoU+y/6KK+GnV7JWrHaZDZPT4+W2qFGwUuqx+wvbNq6Ij9FAsYL9hrxqBWPWoD8hGJY0+nfCJP5WBpp4YppHve/xp0BjZRpo6toPCtyfvOHDJCSQRm0cyZa+M+v39pOIixZv2VqZY7g8NfezVePjS3MgGax6EUhlITllZI+z22kgSiHjDESEyubwGtNnWauyQqgd/H/VHWIJvuR199d+yPj9hSgmq4i+etvTuN1QMAFli5M5zcWabaCHmzenD/RjTPvaVhnsSOofofYq4dexFFNiQFQ4tLW3Uqe4qYUOI6FrRuevoPpSK92IaxvRC262rOCUxKgw9+hCingPatU3TPKiB4MrZXjVw0iPwslj4LtZGE6x7TgHjd7A3fkPS+4K+HKF+r2boF4Hi6yb1iKPWAiPoLvcsjOR7K5J8A9ngLgxKPDXxtkprOOpcryoNVeFwLA1DjJiQGeoO/6oDEnujjAzAaJOr3mJxw1pPG1Vng3DCrBJ2seRVRHEiJ+oIZxA99CTKFZw4DF33mOWFkw8yVVf1R3Nb3ZcMt/BO0Pg2GLXQf5dtYfJ0VoahhGEFRwc/U/2+j3oaVEBz3HX13WB95z+NAEynBgtkqEj/7wXE9R+v7BRhhoYn6/LeckKRycAUpqs5mxIg/41rK6zAvZynx8yKM2PeRTHfYj6v5OarpPcjLNXL5v1dnA8IMM2H1nZr/SRGM8CvbyCKeKFWitPZ5GKWnRL
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(4326008)(508600001)(2616005)(83380400001)(26005)(8676002)(2906002)(186003)(6916009)(36756003)(38070700005)(38100700002)(71200400001)(6512007)(54906003)(316002)(86362001)(33656002)(66446008)(53546011)(5660300002)(8936002)(6486002)(6506007)(76116006)(66556008)(64756008)(66476007)(91956017)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D88DD35C69378748AE4CB12AEC9C7C8C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2497
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	835e2544-17b3-4a36-035c-08d97ea5d9bd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yEM7lEf5FeeUVLj/63hFoV3A3SmxhcxjJE21alokEiIc9K1ZSiVV2xQvHcBVvK9ACbUgFDm4YAAwU9rf8zOrPI8X34nBx0U+8VhV7eEuxX/AOMO1+rT4+qdJCwyOrAqBPz3Y+sNUjpzzH1pNLqwJUeVgVWv3PHNs4gr7TBE4lzn3GNxMO8zpgNCrm+zerKjsvWF1T+9YmwDAjCFia5JCs4L5Vw08k+nStCpW3QQO+HwIudDqhHtZ6Yl5ERqpRXHEMyvRveJjcCcfT0ZqowSo4weYiJzYWKUNzTMhl+gYoLx9P4HwhaS6mh05KYWf3nMu8rBr5HgsSKBVikLeFCEyUSfmBlZIjAtly2OGQVnnvezhVhwGQAGjErzYBsylxWDstGYIft7VLvJ6KS1RUJV7aioRRX3KVzvYC2fCBagAohG+CGMzH/4mjszMXlnDePS9beuTChh7+dxUG7ti3kwD5fz80xMkDVaY1KFwZyn6LJIaSGLANQ/n3eUIepPLuwyRLvnw0yE0TdQmPitL6avL8l3Ev7eHGMHxl1Ho35GtfoPszBU4ReGoZrnrqRYUUEPpnoVzLK2Fzsx1+TI1Xont478Yfw/WafRavX1F5RyHoUoyE7HtR9Sa6g7OdAI4grWIalMPGhKmEUlWIy15WcA9h5GIIGyMHfG2r1D8Dek47ZrUWeuibhYVKb3Z/8Nu/yepgMJuJWBdM6TfZa8r3recwQ==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2906002)(54906003)(107886003)(336012)(186003)(82310400003)(8936002)(6486002)(81166007)(356005)(4326008)(6506007)(47076005)(8676002)(53546011)(36860700001)(83380400001)(36756003)(6862004)(508600001)(70206006)(70586007)(316002)(5660300002)(86362001)(26005)(6512007)(2616005)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 15:22:00.6558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b25f4d2-b377-4b6e-7f2a-08d97ea5e3d3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6527

Hi Stefano,

> On 23 Sep 2021, at 3:52 am, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Wed, 22 Sep 2021, Rahul Singh wrote:
>> If the property is not present in the device tree node for host bridge,
>> XEN while creating the dtb for hwdom will create this property and
>> assigns the already allocated segment to the host bridge
>> so that XEN and linux will have the same segment for the host bridges.
>>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Change in v2:
>> - Add linux,pci-domain only when pci-passthrough command line option is =
enabeld
>> ---
>> xen/arch/arm/domain_build.c        | 16 ++++++++++++++++
>> xen/arch/arm/pci/pci-host-common.c | 21 +++++++++++++++++++++
>> xen/include/asm-arm/pci.h          |  9 +++++++++
>> 3 files changed, 46 insertions(+)
>>=20
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 5eb83b12a1..83ab0d52cc 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -743,6 +743,22 @@ static int __init write_properties(struct domain *d=
, struct kernel_info *kinfo,
>>             return res;
>>     }
>>=20
>> +    if ( pci_passthrough_enabled && dt_device_type_is_equal(node, "pci"=
) )
>=20
> Please use the accessor function is_pci_passthrough_enabled
Ack.

Regards,
Rahul


