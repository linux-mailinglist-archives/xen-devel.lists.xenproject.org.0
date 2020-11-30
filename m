Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7596F2C8207
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:21:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40780.73709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgIw-0007aS-Q8; Mon, 30 Nov 2020 10:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40780.73709; Mon, 30 Nov 2020 10:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgIw-0007a1-L6; Mon, 30 Nov 2020 10:21:10 +0000
Received: by outflank-mailman (input) for mailman id 40780;
 Mon, 30 Nov 2020 10:21:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DnPL=FE=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kjgIv-0007Zs-6q
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:21:09 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.50]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee263c8e-45e9-4625-a8af-09a7ac580664;
 Mon, 30 Nov 2020 10:21:06 +0000 (UTC)
Received: from AM0PR01CA0103.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::44) by AS8PR08MB6280.eurprd08.prod.outlook.com
 (2603:10a6:20b:29b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Mon, 30 Nov
 2020 10:21:04 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:10e:cafe::19) by AM0PR01CA0103.outlook.office365.com
 (2603:10a6:208:10e::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Mon, 30 Nov 2020 10:21:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.26 via Frontend Transport; Mon, 30 Nov 2020 10:21:04 +0000
Received: ("Tessian outbound fcd5bc555ddc:v71");
 Mon, 30 Nov 2020 10:21:04 +0000
Received: from eba43a1c45ac.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 61840E19-420E-4D49-A40D-939B83E99DC8.1; 
 Mon, 30 Nov 2020 10:20:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eba43a1c45ac.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 30 Nov 2020 10:20:47 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3161.eurprd08.prod.outlook.com (2603:10a6:5:1d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 10:20:46 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3611.031; Mon, 30 Nov 2020
 10:20:45 +0000
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
X-Inumbo-ID: ee263c8e-45e9-4625-a8af-09a7ac580664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r49K6sJHi7SUcDVDS7ZRT+jJIk+0vIWsHW3Bm479OYE=;
 b=kvO8PiN13sQEJvBajPnc24vCxlwmFdlCce7ySdknPcv2EMUhVXcyfXilpA1IW5XEt8o1dhRrIocHetsM1mtd/LJOF60Qv/qZWEVrZiB3/lYfGlCcwDc7267JH+8EzwmVXwtleh+d669jDEd3kFLITD1jVe+xPpvGODBpdmQ0KCc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8bdb98d7fc6053d5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOtycQn+JjNMvmnE7ka3Ht2HNinr7zVzARpdRHMmF0x0DlXD+Q3RoJPGwlN9ywYQGGop1bo9+kGmXkNu+jTgFHFsjrAegrNu70O56S3rLEnfcAvnP9nKbO5hMgKSpBuycU641fNDo9EU+ooRkMRdrubYmo7ZOl6EKIFP3sqSqhTot4cfobltuTBdw68oIGYuQK5OlHH6EQqmNlvBP8LR3sKkXG8muI9hLYjsOyPFMt6Mna+TyPHFOJyaQE88HnyLV7uPC8xUCa2I7tbw6Vf4XrtgLOsOtOl43KzVsX9sECJpofV+HfjfRNgiCmUrkiOd/D3u/kOAtln2/VJtrpkrLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r49K6sJHi7SUcDVDS7ZRT+jJIk+0vIWsHW3Bm479OYE=;
 b=I8/yMLCiyXNVI6iRa9lC4Hmzr4xlTZdXFHq9G/5+sAdb21P5Psmd88GdUI0vfm3EQWCEISvSarVbkqoSelp2UurUEHxt/gRumEYC5GIwxcyJtSoxJlS2E51IBTAOz1ELt4nOXexfshmVAKzl+Y0kwRF9h3+sRdoPzn+9WQfynvuXFF8Hm9ttV3kMmlyyU7zYLqfAhQnP9J5KMGIKoE2TjHa3QOnTTl+97oHgl30bEoZIbpMAjCvjkGCJqbwSXQVP0cQFnovbcS2dAw4FOhorme2nYsY9/kUHA5V9V5rSPLjkHR5BFsdgJhBXmPJoUOryByTGokjouQNccxHTrwZB4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r49K6sJHi7SUcDVDS7ZRT+jJIk+0vIWsHW3Bm479OYE=;
 b=kvO8PiN13sQEJvBajPnc24vCxlwmFdlCce7ySdknPcv2EMUhVXcyfXilpA1IW5XEt8o1dhRrIocHetsM1mtd/LJOF60Qv/qZWEVrZiB3/lYfGlCcwDc7267JH+8EzwmVXwtleh+d669jDEd3kFLITD1jVe+xPpvGODBpdmQ0KCc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 0/7] xen/arm: Emulate ID registers
Thread-Topic: [PATCH 0/7] xen/arm: Emulate ID registers
Thread-Index: AQHWxPkEic+Kxyhsf02jxIedQiFc2qngevuA
Date: Mon, 30 Nov 2020 10:20:45 +0000
Message-ID: <1BAAADF6-9E29-4BE5-857D-A8B51EB80712@arm.com>
References: <cover.1606151462.git.bertrand.marquis@arm.com>
 <45b8aac3-75a6-670f-d6f2-b427c497ee2d@citrix.com>
In-Reply-To: <45b8aac3-75a6-670f-d6f2-b427c497ee2d@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bb3b533c-7999-4c91-bfd6-08d89519a4d8
x-ms-traffictypediagnostic: DB7PR08MB3161:|AS8PR08MB6280:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6280B38C3B7C4986760AD1459DF50@AS8PR08MB6280.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KrpwvuiOdEPguUvIld+T4FiAALiSk9FAr55HdDSvkW+/Isg4AXKNOSwHCV83xL0FsaaMOtSa4Aj1sHgNdW8CRIuidVPl2rBLEyst7re81+cl42URsK1FHYrWy6L5X7VP+xQ7Jx2jNNXtV0J9dgsWo7wg7qDXuZtY9+aeu7e29/V2wNxPmix7fKyYedr0hIlhNSKEsPEzjhh0BGg/smbyhZVV+c6HO76JYR1kLIJs51i5Tifq58YasX230ZRE2r0uFhZsGH5RlzAdB5oOr5F8uH6+l0RdcGaZiPYmw8NI4R+HbYt83tvl8jMZUWtV3b/+1m5mdRJaM+Wlo+XTxXuG3leg4wSxt+XP5JWO8fe9SvUpiiq8kh7hKzvygBR6H+aqXDxwl78JPPfUitfhYXOIZw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(136003)(39860400002)(346002)(6512007)(71200400001)(478600001)(64756008)(66446008)(8936002)(4326008)(86362001)(66556008)(53546011)(83380400001)(6506007)(26005)(5660300002)(66476007)(186003)(76116006)(66946007)(8676002)(91956017)(966005)(2906002)(6916009)(54906003)(2616005)(36756003)(316002)(33656002)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?vKKWH7YMRYknevoF0babZlCvF4BNDbKBaCULTPWK/aj9cqm/xrHCIl5+iAMD?=
 =?us-ascii?Q?U3PYHXc9mbXGtl/v+n5LMcaMO3JBpEwWHa+UBCrNHqA9pkWRaHb0Q9ehDInf?=
 =?us-ascii?Q?jxpDuihq6teDMQmnyqGa+6BZBV4PPKJgxqhfOcvDrMQ0wKY3AVMR7+gxxfUR?=
 =?us-ascii?Q?NjGCUtfAhPem8sUz7oMzUMbNL0giM43NaAIPtPB35NCewfN+brs8clf80KHm?=
 =?us-ascii?Q?9tMnPQtpVDjdSM2wxgnDWa89aqCuVz2Lf6VooayUeekjzIEJHJvYWjOFsx/S?=
 =?us-ascii?Q?jTq0TbylhDbqU8zMk/LBQmpBML8g+RDaUTPyQD93z4D1dqHyd+m2oDummpG3?=
 =?us-ascii?Q?tYMUH4l+bGEIvHRusLm3wetS+CI4xwRQr5meY5YepzjLtnU0EFAFoMaQUvWY?=
 =?us-ascii?Q?kJG5eU440cnKg99SU43i6GDx+JqSfmByXxBVocqPuPfnnAldxZ02AzCmvafH?=
 =?us-ascii?Q?KmJx9p3DDP1HlvCW7rTH30R+sklWqzLmr3IiDHXLgF/WOy/SP/yOHT78N9Vv?=
 =?us-ascii?Q?pAGxDD6VKd/R4xA1Hmg3b0tI6APttOmR3CqPQr+ZB+vN0MhDWJ+t3SVL8MdL?=
 =?us-ascii?Q?5MwjBuuPbsw3G6+5TIPVB3fTnWAyFkofYwEu1rMWFNmZPS/3MiFQ7CDtLdMM?=
 =?us-ascii?Q?2idS0L+ZY0Mj1XvvhgsuD1iuGdnjg7Em1aOy1XtezLrSH1y3i0Pc5RRXfzCx?=
 =?us-ascii?Q?UlkPHdmZHUDP7sivvp/QLWde1BlOMTpTbAwujkjiqY35wep61rjcWlzqwIf/?=
 =?us-ascii?Q?WHO25yzI+gch29UCOe13U2l2lr3NbLV/n5Cf3wrcsda6i+IZZSDBj3ZW1yLc?=
 =?us-ascii?Q?R8Oq1xlRD8FeAIS/D15gYyUgOa1uZfPy44oZ+Q1o25j+TnxAcW3uE0mTqLNO?=
 =?us-ascii?Q?2MUo2S3Ronz2zlxDeUQTux6BmoIPIrZjPjM7sHkAx9tebOmdV6ALhTgz+d2r?=
 =?us-ascii?Q?20ubsTVkJiApzKyVg1p+gz67d108qWa4IqPcfO8c9Jrc9/rxzn1lWXrU5pRz?=
 =?us-ascii?Q?3p4m?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9A8D1CFBE6179C4CB9BA35DE6A32303E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3161
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f8a7a757-7575-43c1-e78b-08d8951999c7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ArKLUjWrFtBoA6b0reMfx7ZxqmprfOvPJ2dc1zztWnHnew6M8qRByvBFgrPVnUaT90ZxJ+/mkmKpLjtClcKbi8ws/vWtjo5J8Dd86Kwr3J7pgNzAwUjGyCQBmxj65Rcu6RN4TbEdl9gXS7uTdHGHJ3Hb2y6/27DOc/L+4FrC4w1ggrvCUzzufCVCbZ2k/w+QuHdLezEsK9gE5QRwWGCXMxmr/ToJTpQociCDgdhTVEe5yCJkV1ZiNx853nDDOE9RRe6ifAY2aBDNdCXwJaKRwOoZcSsobQuqz5x9smtbF9a33X8sK3yR6JcqfNhBy8V20KYeEE72fRhuBQYSA2xjjCSBLMaIbbJwLenn7WwoA0Hhj91VaQ2JKi0sTZOaqoCnw1QSz8R9iCT/60jPoGYDfwg4EkM0giUFtLJ1ZNOKL7i5zr1pHyGCT67LFFAOay4WPXZOVZg3Hb/QFudCygWulDa/YhW5c+Tf8WF6NIX+6ks=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(39860400002)(376002)(46966005)(83380400001)(36756003)(33656002)(82740400003)(47076004)(6506007)(186003)(82310400003)(336012)(26005)(53546011)(4326008)(2616005)(8676002)(478600001)(966005)(5660300002)(70586007)(70206006)(2906002)(316002)(8936002)(6512007)(356005)(36906005)(54906003)(6486002)(107886003)(81166007)(86362001)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 10:21:04.4764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3b533c-7999-4c91-bfd6-08d89519a4d8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280

Hi Andrew,

> On 27 Nov 2020, at 20:07, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> On 26/11/2020 15:51, Bertrand Marquis wrote:
>> The goal of this serie is to emulate coprocessor ID registers so that
>> Xen only publish to guest features that are supported by Xen and can
>> actually be used by guests.
>> One practical example where this is required are SVE support which is
>> forbidden by Xen as it is not supported, but if Linux is compiled with
>> it, it will crash on boot. An other one is AMU which is also forbidden
>> by Xen but one Linux compiled with it would crash if the platform
>> supports it.
>>=20
>> To be able to emulate the coprocessor registers defining what features
>> are supported by the hardware, the TID3 bit of HCR must be disabled and
>> Xen must emulated the values of those registers when an exception is
>> catched when a guest is accessing it.
>>=20
>> This serie is first creating a guest cpuinfo structure which will
>> contain the values that we want to publish to the guests and then
>> provides the proper emulationg for those registers when Xen is getting
>> an exception due to an access to any of those registers.
>>=20
>> This is a first simple implementation to solve the problem and the way
>> to define the values that we provide to guests and which features are
>> disabled will be in a future patchset enhance so that we could decide
>> per guest what can be used or not and depending on this deduce the bits
>> to activate in HCR and the values that we must publish on ID registers.
>>=20
>> Bertrand Marquis (7):
>>  xen/arm: Add ID registers and complete cpufinfo
>>  xen/arm: Add arm64 ID registers definitions
>>  xen/arm: create a cpuinfo structure for guest
>>  xen/arm: Add handler for ID registers on arm64
>>  xen/arm: Add handler for cp15 ID registers
>>  xen/arm: Add CP10 exception support to handle VMFR
>>  xen/arm: Activate TID3 in HCR_EL2
>=20
> CI found an ARM randconfig failure against this series.
>=20
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/221798884
>=20
> I have admit that I can't spot an obvious connection so it might be
> collateral damage from elsewhere, but does need looking at irrespective.

This absolutely right, there is a bug in my code and i will send a V2 to fi=
x it.

Very nice finding, i am wondering why my tests did not point this out.

Regards
Bertrand

>=20
> ~Andrew (in lieu of a real CI robot).


