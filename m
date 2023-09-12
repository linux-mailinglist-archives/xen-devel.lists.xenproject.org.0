Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7045A79C38C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 05:02:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599898.935500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qftet-0008Ub-RT; Tue, 12 Sep 2023 03:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599898.935500; Tue, 12 Sep 2023 03:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qftet-0008SR-Ol; Tue, 12 Sep 2023 03:01:47 +0000
Received: by outflank-mailman (input) for mailman id 599898;
 Tue, 12 Sep 2023 03:01:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O/bM=E4=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qftes-0008SL-1j
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 03:01:46 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b39cecb4-5118-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 05:01:43 +0200 (CEST)
Received: from DUZPR01CA0161.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::18) by PAVPR08MB9062.eurprd08.prod.outlook.com
 (2603:10a6:102:32d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Tue, 12 Sep
 2023 03:01:39 +0000
Received: from DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4bd:cafe::2a) by DUZPR01CA0161.outlook.office365.com
 (2603:10a6:10:4bd::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37 via Frontend
 Transport; Tue, 12 Sep 2023 03:01:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT044.mail.protection.outlook.com (100.127.142.189) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.16 via Frontend Transport; Tue, 12 Sep 2023 03:01:38 +0000
Received: ("Tessian outbound 0b7d6027328f:v175");
 Tue, 12 Sep 2023 03:01:38 +0000
Received: from cd698a7cb0fd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 040F313E-6A3F-4493-9ECD-560CD012E511.1; 
 Tue, 12 Sep 2023 03:01:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd698a7cb0fd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Sep 2023 03:01:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB9629.eurprd08.prod.outlook.com (2603:10a6:10:44a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 03:01:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 03:01:30 +0000
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
X-Inumbo-ID: b39cecb4-5118-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yWf/DeJXYOwyb25YTdJc0lWKI6qEcL2BvDlQYPfOJY=;
 b=dKhVo7jerYY+UCoRG51BtItZ3XkrCj1r7e/L1ckHbmtng1voefmzz2E3tSJ+sPth9J5VX5Xy3lekoVXx3HYLN9Ds9q0PYPBNoFcN/fQy5xw7lRSu050t+vOb72fxZJm2UOBikKgzT7D4eivLUWApQXQkDqexmcwfkTpI43Q40Yc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e210b37e78009628
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuP8Y33zdaqVLecOX9Cdt4S9R8eV+kLMnYKzN2DanHpy/00NaL64RcHAuaPnBLKjtGu9izLNkx01ekD4kKoEnEJOChL3nbLgZodNsU9kBDzr5CNTclM4u8a4OtUDvixsG14XaJpYhuMOuMFyjs0E2ngTX7NC1LQBHiRHeUQWcOiGScz2k70zpu7efy/bgz0eY6LzXz+HhVL9ez5pN1xmWKY5byHsk879DYKrFqTjWT2KHZDircrwBh1WWlO/iDCj43o3xLOthjEasX49YjGmVQOMmP4sja3BJCMJGrX4OHWaVS1CfIBfz5UHLqFfnwo91i9wyByySeTWkmxwGlaGrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yWf/DeJXYOwyb25YTdJc0lWKI6qEcL2BvDlQYPfOJY=;
 b=TTbeZNS7SDj/PsLNrAnOQe0FUCdpP2QcXVoHQuePrfr/pWE4lxCiv5RqNGWaIyiPcuDAJ/HQ4QTZzp49uGiyDFGs43k6vUM2PrsLSz/moMiAhqC3tcV0xutu4OEce/tlE4+KsrE6Au6uu0RHmPbDnwCuNzQVEAa+v+U1vaUlGueRbP2+TdQcwzM0seG00LFjHCGJaLCaa/9fO5XeaMteC4uVOWO329JT108cZm8FiXyUpwcKgYK8YSb8lHL8EhMnjZx5Ai2kB9Qq6Z8h/OjF/mvXn/lHy+tmINyPSwvnBm4vDzZa8dzg0da9LdTuVwpOu+xZ8REbSRYztbjm0EFGcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yWf/DeJXYOwyb25YTdJc0lWKI6qEcL2BvDlQYPfOJY=;
 b=dKhVo7jerYY+UCoRG51BtItZ3XkrCj1r7e/L1ckHbmtng1voefmzz2E3tSJ+sPth9J5VX5Xy3lekoVXx3HYLN9Ds9q0PYPBNoFcN/fQy5xw7lRSu050t+vOb72fxZJm2UOBikKgzT7D4eivLUWApQXQkDqexmcwfkTpI43Q40Yc=
From: Henry Wang <Henry.Wang@arm.com>
To: "leo.yan@linaro.org" <leo.yan@linaro.org>
CC: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alexey Klimov <alexey.klimov@linaro.org>
Subject: Re: [PATCH RESEND v2 2/2] xen/arm: Enlarge identity map space to
 127TiB
Thread-Topic: [PATCH RESEND v2 2/2] xen/arm: Enlarge identity map space to
 127TiB
Thread-Index: AQHZ4viMksvJdCvkpU23UX9vdzYb/rAVvxaAgADAOoCAAAWLAA==
Date: Tue, 12 Sep 2023 03:01:30 +0000
Message-ID: <A51D9BC5-B464-4979-860B-8365E478844F@arm.com>
References: <20230909083410.870726-1-leo.yan@linaro.org>
 <20230909083410.870726-3-leo.yan@linaro.org>
 <d526b697-ca64-473d-8a82-72b9052487fa@xen.org>
 <20230912024127.GB122656@leoy-huanghe>
In-Reply-To: <20230912024127.GB122656@leoy-huanghe>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB9629:EE_|DBAEUR03FT044:EE_|PAVPR08MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: f017dc33-690a-444d-830b-08dbb33c9574
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 a8zxqsHvStc3LUN7Y6nJYvO/kxep+14N09Fd/OEks9ykACntBYakLoVr18BmKRATmIXKg8MFQXAWoMP2Seq8jtInlB14oOCSQHmkh9Fg+086qFjd0ccAniIz8rfbP7BpxNggrqU9lksH9DW594DJI6M/bEDZIxJiApUL6ku6zXC4AP7oGeqdQs+HKosdY+LCnOVG5RvwGDsVE15wU0ynGlAKrLN5S6wzgzmZwKTKw9nzRcgJ0xkF9NPRpvbekama1ywBZSbAtowOatIodH/BT7XXDBVIuJaoxSmWdnkq2JDImxpJKxOfcTzd0bPyqaxqXfpNgzrKdMtSPXvaHTVMMhYtKiW4BjUjRJUWJIwYKbI6lGcsk2tk+spLkJadpQFKRRrcYMKDRdsvY48240UV0/phYc0PaJJezE0Auf9Z/aDlNrYDjid5Cz8pdIVDc5XdEXH9Wvp04gqIMq5gQ/LRULNLNktMVSqJVWBR0twPgJswJ5zEE3bUHSyJq+dZHq6SCt95EOWnzF3cFKRDASptfDR0E47pCS9xsdtT59ZF3ppsoxjsstSKI7yFsXmV6bj3jAhazmWURGkXDUYsbkIOd6QnS1kB1DwRqeclKX5MIqWhTvMrHKW5Lqz0uStaRqxUETqdEypGCRJgpHF+YHS6DU5i0ME2cEgQVrrkXLSryNvN6Rzn+rXWNH+EO5sKJCs3
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(396003)(136003)(346002)(186009)(451199024)(1800799009)(122000001)(6486002)(6506007)(71200400001)(53546011)(33656002)(36756003)(38070700005)(38100700002)(86362001)(2616005)(26005)(966005)(6512007)(83380400001)(478600001)(2906002)(91956017)(5660300002)(4326008)(41300700001)(316002)(76116006)(8936002)(8676002)(64756008)(6916009)(66946007)(66556008)(66446008)(66476007)(54906003)(10126625003)(147533002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0BF144597B23A547A1B65A22541CDA16@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9629
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3673cc3f-89cb-44bb-5a4f-08dbb33c9052
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tPW/vGiPmflhb5VFjupaaVven2v3VEOFJySl9wTs6XhLd26hUgrMxqP2LQoNn6NO1WkDfoczy+5Kr6i62+cbENHuqxD1zXsRSz9bULJbni4c0HkbvNNw7TUgiyq7z8YJfPd/N7bChTI5wixCxF/gR+Alcz6S13Zsh7/Bi52XrLLo+zhj6LBwyeheEm1+eTIslXhv/Q7ygbpj5HoqYZckYBAkJU8Ubut+eS4ia+QV2hSV1cIZWI/MtqWL7HW/YuxFtmd+ubYCVBSxEHFqnC8J+7havhORMN7TcjGJmBykvXkivrheSUnSHgrYSaDakr5qd7r7AywtNHdWIq6BmfF96fdDkOT85Zg8bo3BXz109Fya9lkZiHBpH5yV2fGYr7uir16lb9PxCO0fJZoVw1buvVihx5e4gXV66D2/QJRbYQMJnwdbOqlg2xKSuBvPkFo4mxb/6EkpZr4Afu/EM2ikDr0kBWr3UE55o9oUim1adgfwiBKTyGJuR6j9tXMqkcxrf8hA71WDhtZNpceEZ7Wxgg4ZUlk+v7wkMmTefewbAUFvy9QVVJhCbM4ZYTUsK2jhrja6QJVOIbmJwhCB/HzBTqxgdYt88tS0hxeRcl9MkVjudEsq1xKiyrkFi5BnCHhTRDzoX6T2jqpV17XXnYdJtujI5CoRteTL48s5CB74g88FRROrgTtXhbEky6DthrLfwxRyjdIIC2hgEZX/9J+eM0dasaPRbJYaQiLleIDv4DTyuJKlm1ZZfrna3l0yKZw3RGblf0CE2iaiJtPy+p3LPKZ9HKSb+wOE76rig44hGl46i3M+3ifgWW3H5InlLqln0ndYFXv18x+2LumcrU+EMg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(376002)(346002)(186009)(82310400011)(1800799009)(451199024)(46966006)(40470700004)(36840700001)(81166007)(82740400003)(40460700003)(356005)(36756003)(33656002)(40480700001)(86362001)(478600001)(966005)(6512007)(53546011)(70206006)(8936002)(6506007)(2906002)(6862004)(6486002)(8676002)(4326008)(5660300002)(41300700001)(316002)(54906003)(70586007)(83380400001)(47076005)(36860700001)(26005)(107886003)(2616005)(336012)(10126625003)(147533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 03:01:38.9907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f017dc33-690a-444d-830b-08dbb33c9574
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9062

Hi Leo,

> On Sep 12, 2023, at 10:41, Leo Yan <leo.yan@linaro.org> wrote:
>=20
> Hi Julien,
>=20
> On Mon, Sep 11, 2023 at 04:13:27PM +0100, Julien Grall wrote:
>> Hi Leo,
>>=20
>> I know you said you will respin the series. I'd like to leave some comme=
nts
>> to avoid having another round afterwards.
>=20
> Thanks!
>=20
>> On 09/09/2023 09:34, Leo Yan wrote:
>>> On some platforms, the memory regions could be:
>>=20
>> Can you add some details in the commit message on which platform you saw=
 the
>> issue?
>=20
> Sure, I will add it.  The issue happens on the ADLink AVA platform.

At Arm we also test Xen on AVA in our CI, but our setup is based on Yocto
meta-adlink-ampere layer [1].

>=20
>> Also, in v1, the problem was also depending on the firmware version. Do =
you
>> know if it fails booting on a new or old firmware?
>=20
> My colleague Alexey (CCed) and I both tested Xen hypervisor on own AVA
> machine, Alexey produced this issue on his machine with the old
> firmware, I upgraded to the new firmware so I cannot see the issue
> anymore.
>=20
>>>   (XEN) MODULE[0]: 00000807f6df0000 - 00000807f6f3e000 Xen
>>>   (XEN) MODULE[1]: 00000807f8054000 - 00000807f8056000 Device Tree
>>>   (XEN) MODULE[2]: 00000000fa834000 - 00000000fc5de1d5 Ramdisk
>>>   (XEN) MODULE[3]: 00000000fc5df000 - 00000000ffb3f810 Kernel

I tried to dig a bit more about Xen log printed by our AVA setup, and [2] i=
s our
RAM and MODULES setup, just FYI and hopefully it helps.

[1] https://github.com/ADLINK/meta-adlink-ampere
[2] https://pastebin.com/raw/0DQpmJP1

Kind regards,
Henry



