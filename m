Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B462F1E76
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 20:03:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65344.115762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz2Sa-0006gu-Ve; Mon, 11 Jan 2021 19:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65344.115762; Mon, 11 Jan 2021 19:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz2Sa-0006gV-Rw; Mon, 11 Jan 2021 19:02:36 +0000
Received: by outflank-mailman (input) for mailman id 65344;
 Mon, 11 Jan 2021 19:02:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S6qt=GO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kz2SZ-0006gQ-QA
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 19:02:35 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.52]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f99ec949-aa35-413c-adb6-2341a1df69c7;
 Mon, 11 Jan 2021 19:02:33 +0000 (UTC)
Received: from DB8PR06CA0014.eurprd06.prod.outlook.com (2603:10a6:10:100::27)
 by VI1PR08MB3968.eurprd08.prod.outlook.com (2603:10a6:803:e5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 19:02:31 +0000
Received: from DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::db) by DB8PR06CA0014.outlook.office365.com
 (2603:10a6:10:100::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Mon, 11 Jan 2021 19:02:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT032.mail.protection.outlook.com (10.152.20.162) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 19:02:30 +0000
Received: ("Tessian outbound 2b57fdd78668:v71");
 Mon, 11 Jan 2021 19:02:30 +0000
Received: from 01d46b7c073c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 821F418F-765D-4024-B744-8E8DDC39DDB7.1; 
 Mon, 11 Jan 2021 19:02:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 01d46b7c073c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Jan 2021 19:02:25 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB3471.eurprd08.prod.outlook.com (2603:10a6:803:7d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 19:02:22 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 19:02:22 +0000
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
X-Inumbo-ID: f99ec949-aa35-413c-adb6-2341a1df69c7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xzt0osNr+WBVnFNzSOloMmM4TStk3mixaVvrOwFjpY=;
 b=9ZNlCr4no7/fy6WNtZY1pRQnsqDdy9S6bqdVj9zhkaCnGTege94To6xP5wgE98hcnw/TU5yY5Je789wz8sir3Gj60t3n1Slmb8KEku5XK3CRjFRpY7+xhj1hZ1auF2GbUbDBRoYvys2SNwOe9XwrvLMLSemKoOYnTxL7JypvVAc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1f95e82f7d98739c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ki8XZ8Rv0nNjwZx1zBrkFp33S/172ZzX9Cl0UkI4Ot8yqa+kZzp+ZAj/vKpbsYyoO5T3XRMvjVosFtvatIWGR+PKQuGveiIcMMeRbh3z8CeouSU5prAPvFLjY5kCTHGQcokxPtjd7MtbSgavkIf43QOnEDToicjUco7VMnXHLO+hiA9dwPppZzbiFlwW6QnbpV5IKOl0XRLvNSMEFeZVkIjwzxFm5k5gaPsOjChERwq3eK97oCOLAoKi8+KRfV86wcxRISPptW9wYipCNzzXy5RHrBxzHvo/PIQNO7RphLqg7d+fpMP/hYMAH4Cfl9cWLE74yREG/N04hUoXPHExKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xzt0osNr+WBVnFNzSOloMmM4TStk3mixaVvrOwFjpY=;
 b=UKRuN36k1kdVclOUzB7g0Hh+84hnuEcaH/eqvYQSziGeaPyctb8dch9ohZCZTelx339KZTW+MvkzlYS1GOrqqh7eXm4pw/5OBaD9cpE9W/ybyiIyZEAAcWbwkF3V9xqTAM4IRfk1e4PV84lSXIBYDmyMTx9uLGZWLOhVZnefDwGNMiAcmXtqUQYUJSqbbgDWCuQ6OSw2gKdoM5jRBNdn/dqgvfp9r3lEpouwAgikjIW3lBJwZ9OaqSSWJHUOZE/9qR1Qi6bQWtCm1QM4JlY+S2Y6LMaeIRB8yJAcq+b6h9hiwT560mr10UrmlZBYQlP0hy0qel+RahhT4cT3uAx97Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xzt0osNr+WBVnFNzSOloMmM4TStk3mixaVvrOwFjpY=;
 b=9ZNlCr4no7/fy6WNtZY1pRQnsqDdy9S6bqdVj9zhkaCnGTege94To6xP5wgE98hcnw/TU5yY5Je789wz8sir3Gj60t3n1Slmb8KEku5XK3CRjFRpY7+xhj1hZ1auF2GbUbDBRoYvys2SNwOe9XwrvLMLSemKoOYnTxL7JypvVAc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>
Subject: Re: [PATCH v2] xen/arm: do not read MVFR2 when is not defined
Thread-Topic: [PATCH v2] xen/arm: do not read MVFR2 when is not defined
Thread-Index: AQHW5fO/cBZB5l3jZkmpNH6hbDKrc6oiIY2AgAAasgCAAIUfgIAACBWAgAADOgA=
Date: Mon, 11 Jan 2021 19:02:22 +0000
Message-ID: <9A54F469-6A90-46C8-8BC4-673F469240E7@arm.com>
References: <20210108192243.25889-1-sstabellini@kernel.org>
 <f90e40ee-b042-6cc5-a08d-aef41a279527@suse.com>
 <dce8bed2-db66-b032-06a9-86c8f80d26aa@xen.org>
 <F715A994-7B47-4171-84F8-5BE912985784@arm.com>
 <7311f402-dd5d-7484-345a-ef62071adb58@xen.org>
In-Reply-To: <7311f402-dd5d-7484-345a-ef62071adb58@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c816297d-27ba-4dfd-5775-08d8b663723b
x-ms-traffictypediagnostic: VI1PR08MB3471:|VI1PR08MB3968:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3968FC4D661003EEEC0464E89DAB0@VI1PR08MB3968.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9WvHIVw5yB0B680KOsThG+v6/eZ8jq93XIPqbi1RncOA6iZuxnGslPItuWmH/P4/c8t/HGYQYEzQukbC3RY1J29xznZf7UBrNX0nCsOpLqA166C5t94rIjzvNvfHscraLezb4iOgoutM4g914UG0ZckjiP9iyD6q6CF8trv9VTnvu2nOZuUN6+OJ/lilYoOXolN5/uCMA5IW2iPv98BlRNX3448w0ugsMjbqujmtrJwNE6NwZOM32kuKhNHC3Vzj8RyzqbgScaZw8Pf4NaJswPoVeG5jqR2v1zhrrCYCIIq8GSuGsu2sNGqA5+N0S+gIawTK99Mjus1l2/uenbrIaMu29tepemleOrCDzIDi06fnuaomutHdKHWdXYJhdZ+zQvaB0gqG4O05dsUCojC/200JCjNVH1JN9hVwzEzhJa5fHJZkde24o6FAkuz7tp/A
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39830400003)(366004)(136003)(64756008)(6512007)(83380400001)(66446008)(4326008)(8936002)(54906003)(36756003)(66946007)(66556008)(316002)(71200400001)(478600001)(6916009)(76116006)(91956017)(86362001)(8676002)(2906002)(5660300002)(6486002)(26005)(186003)(6506007)(33656002)(53546011)(2616005)(66476007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?nOYcZBQzIi7LX9hG3ySrTJ7cwy12VF9PlUhwzj5lXQDNJ03fE1mCV47/Qc6R?=
 =?us-ascii?Q?il0jL3dqu2DgXJmDN8onG8/8oEU78orAMJYdT2JDglj3jVGR6230Xa0wHdKA?=
 =?us-ascii?Q?LSal92nfJvJgbvME6YUc21qCAx6a8MWfGsCcqtGhJfdXeVKRX+ML8PKh39X6?=
 =?us-ascii?Q?saaU0yjUqyRGp4GmK1Bvs6Qd76JPayjQkEeN/Ney8JM2SVYym28WlIuPeq87?=
 =?us-ascii?Q?didSytVdbgdXX/dSJRFA7CJt1/cFuTBCZRqfS+vaQsSZLsohhfzz5NMXD5Dk?=
 =?us-ascii?Q?rfML25CKNGa/xCccSJrRG6Nji5vlNjWjnpbKO1W1dY6+1OTD9r3IuV+QU5YC?=
 =?us-ascii?Q?PjtF+LmsH2ie0r8MpIqZzTy1Pj4LfTo/wRTnt8ELhFtDSEama2QLu9SJjjkH?=
 =?us-ascii?Q?olys+N627dLGGHbcR8WJ6MhyQ2i7TxZfy1oYjr/28r47CysCyOyod5OQz+2i?=
 =?us-ascii?Q?MPUw3wrywEzbmbUvx1aPpSfCCI+WD6b7tqmwt+3gRL9kXS30q4UbEISotG8A?=
 =?us-ascii?Q?tZtObe6rQPsOQG2sXlv2u1mdpAPeDfVVj66weExhGbKb6fucjGwZdXRv+1Au?=
 =?us-ascii?Q?/s6FywVdUOdA6LK01skta48he/7ugeCZHW5ZfiMwANl5n8ItWX8QYOBa9L7Z?=
 =?us-ascii?Q?wcT98aeAKufttGVfFaOgCUdTY0QAD+jg/LjUC7m5YE/m1Q5MIfmyjIKIL7lo?=
 =?us-ascii?Q?C+hEtLq7Pp5ilwVtG8/8T7CGGFPcZtf1tODfJckWfGmmBX/Qt/oZRVKMV+sz?=
 =?us-ascii?Q?xW8bc6TnGjWXp6Iwi0DD/iMRMiIkzHBAhr+JwFH/vidr0aQyzytkfo4F88bC?=
 =?us-ascii?Q?ZXNHIWJgk0vFFaVVymykvG/3NcF6U3Un26qDgB564br4KSkEzqzOzMXUlIC0?=
 =?us-ascii?Q?TfNObfrz+Bo1Fe5AxnFKhgBRNeYf7JPKwpn/3SkNp08VUPmTqhpPCra5zrTF?=
 =?us-ascii?Q?CCCO5xz02dGsiX5NRLse14UJEogkO+BVFOWEIJWtmhe2n8bguTi8k0KUf7JI?=
 =?us-ascii?Q?o6YC?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <461A80DDABBBE94FA12ECF8E95EC9F20@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3471
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2f9a3ceb-2d07-44b6-b178-08d8b6636d5a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K2dkM+E4pb941LBN8+Qjj5kO4wqubSKuPKsIlUqf/K/3U4Q+Sa+Wk8nadgfrIkl378prmIceMtY9Pc3Dw4h4e9T5dClNndlxXiBAHa5zlGPJ1pTx5Gag8Mh4rWlIBaP/jkaLdGFAw4Zqu895JVKUifUVV9ZXozZwoh1m6N90yIcSKqbXGVmXAmp3oBAfRwDc43d8kHhDeKjEceD/vROX5/b5pmC18d/lT5eQ8IG2ULxKIogvASFq451hyjZgbkBLSfsmZervCe3Qy0bDq0hIbmZN+8vOU5NaixJDtYFVvtof2HF7pGV7TW5nKHlF0nJ++E74ZbT79XV6c/YpGAPIEilbuwtNRMjirzx+VzpwFUmgm3y5lyo8SLrl7nrCQsHAddoepngq0WrWobqho0eCILpFuluj0BBhLfK+ReOVLCI+BReQMkmPIWItle2gyyDleYEodjpt5VKyr53ajNT7GLpZPWPWoYsb98sRtBhmU6wrZSWopHpFD5AzLaQI4UN9
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(136003)(376002)(396003)(346002)(46966006)(6486002)(2906002)(83380400001)(316002)(70586007)(54906003)(478600001)(70206006)(36756003)(8936002)(82740400003)(6512007)(81166007)(356005)(26005)(186003)(34020700004)(8676002)(2616005)(336012)(6506007)(53546011)(86362001)(5660300002)(82310400003)(33656002)(4326008)(6862004)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 19:02:30.7374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c816297d-27ba-4dfd-5775-08d8b663723b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3968

Hi Julien,

> On 11 Jan 2021, at 18:50, Julien Grall <julien@xen.org> wrote:
>=20
> On 11/01/2021 18:21, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi Bertrand,
>=20
>> Sorry for the delay but I was on holiday until today.
>=20
> Welcome back! No worries.
>=20
>>> On 11 Jan 2021, at 10:25, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Jan,
>>>=20
>>> On 11/01/2021 08:49, Jan Beulich wrote:
>>>> On 08.01.2021 20:22, Stefano Stabellini wrote:
>>>>> MVFR2 is not available on ARMv7. It is available on ARMv8 aarch32 and
>>>>> aarch64. If Xen reads MVFR2 on ARMv7 it could crash.
>>>>>=20
>>>>> Avoid the issue by doing the following:
>>>>>=20
>>>>> - define MVFR2_MAYBE_UNDEFINED on arm32
>>>>> - if MVFR2_MAYBE_UNDEFINED, do not attempt to read MVFR2 in Xen
>>>>> - keep the 3rd register_t in struct cpuinfo_arm.mvfr on arm32 so that=
 a
>>>>>   guest read to the register returns '0' instead of crashing the gues=
t.
>>>>>=20
>>>>> '0' is an appropriate value to return to the guest because it is defi=
ned
>>>>> as "no support for miscellaneous features".
>>>>>=20
>>>>> Aarch64 Xen is not affected by this patch.
>>>> But it looks to also be affected by ...
>>>=20
>>> AFAICT, the smoke test passed on Laxton0 (AMD Seattle) [1] over the wee=
k-end.
>>>=20
>>>>> Fixes: 9cfdb489af81 ("xen/arm: Add ID registers and complete cpuinfo"=
)
>>>> ... this, faulting (according to osstest logs) early during boot on
>>>=20
>>> The xen-unstable flight [2] ran on Rochester0 (Cavium Thunder-X). So th=
is has something to do with the platform.
>>>=20
>>> The main difference is AMD Seattle supports AArch32 while Cavium Thunde=
r-X doesn't.
>>>=20
>>>> 000000000025D314	mrs	x1, id_pfr2_el1
>>> This register contains information for the AArch32 state.
>>>=20
>>> AFAICT, the Arm Arm back to at least ARM DDI 0487A.j (published in 2016=
) described the encoding as Read-Only. So I am not sure why we receive an U=
NDEF here, the more it looks like ID_PFR{0, 1}_EL1 were correctly accessed.
>>>=20
>>> Andre, Bertrand, do you have any clue?
>> I will double check this but my understanding when I checked this was th=
at it would be possible to read with an unknown value but should not genera=
te an UNDEF.
>>>=20
>>> However, most of the AArch32 ID registers are UNKNOWN on platform not i=
mplementing AArch32. So we may want to conditionally skip the access to AAr=
ch32 state.
>> We could skip aarch32 registers on platforms not supporting aarch32 but =
we will still have to provide values to a guest trying to access them so mi=
ght be better to return what is returned by the hardware.
>=20
> Per the Arm Arm, the value of the registers may changed at any time. IOW,=
 two read of the sytem registers may return different values.
>=20
> IIRC, the original intent of the series was to provide sanitized value of=
 the ID registers. So I think it would be unwise to let the guest using the=
 values.
>=20
> Instead, I would suggest to implement them as RAZ.

Works for me.

>=20
>> Now if some platforms are generating an UNDEF we need to understand in w=
hat cases and behave the same way for the guest.
>=20
> I am not entirely sure what you mean by platforms here.
>=20
> If you mean any platform conforming with the Arm Arm, then I agree with y=
our statement.
>=20
> However, if you refer to platform that may not follow the Arm Arm, then I=
 disagree. We should try to expose a sane interface to the guest whenever i=
t is possible.
>=20
> In this case, I would bet the hardware would not even allow us to trap th=
e ID_PFR2. Although, I haven't tried it.
>=20
>> Do i understand it right that on Cavium which has no aarch32 support the=
 access is generating an UNDEF ?
>=20
> Yes. The UNDEF will happen when trying to read ID_PFR2_EL1. Interestingly=
, it doesn't happen when reading ID_PFR{0, 1}_EL1. So this smells like a si=
licon bug.

Sounds like the ifdef ARM64 should be something like if (!cavium)

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


