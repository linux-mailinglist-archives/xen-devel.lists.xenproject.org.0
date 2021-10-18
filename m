Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF6A4311D1
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 10:06:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211762.369416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcNey-0006UI-5Q; Mon, 18 Oct 2021 08:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211762.369416; Mon, 18 Oct 2021 08:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcNey-0006Rv-1w; Mon, 18 Oct 2021 08:06:16 +0000
Received: by outflank-mailman (input) for mailman id 211762;
 Mon, 18 Oct 2021 08:06:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J+Bz=PG=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mcNew-0006Oy-MY
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 08:06:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.41]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42af881e-2fea-11ec-82ce-12813bfff9fa;
 Mon, 18 Oct 2021 08:06:13 +0000 (UTC)
Received: from DB6PR0202CA0033.eurprd02.prod.outlook.com (2603:10a6:4:a5::19)
 by DBBPR08MB6316.eurprd08.prod.outlook.com (2603:10a6:10:207::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 08:06:11 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::f1) by DB6PR0202CA0033.outlook.office365.com
 (2603:10a6:4:a5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Mon, 18 Oct 2021 08:06:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT015.mail.protection.outlook.com (10.152.20.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 08:06:10 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Mon, 18 Oct 2021 08:06:10 +0000
Received: from c05969f79600.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 24DD6916-2FC3-45CE-B369-2E94ABC71ACF.1; 
 Mon, 18 Oct 2021 08:05:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c05969f79600.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Oct 2021 08:05:59 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB9PR08MB6633.eurprd08.prod.outlook.com (2603:10a6:10:23d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 08:05:58 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 08:05:57 +0000
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
X-Inumbo-ID: 42af881e-2fea-11ec-82ce-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYbXdiZrqnq/ewGWjWYobOuyBPl4ycZ1/MdqCuZY6pg=;
 b=3JcXuUnDbddIcMl84X1vBaz5JjxpMcUXXAhRbEnCmbRKjLvCgoSMnxfEfg3dwbkks6l4ImaA4lodIEIFFoe1vvoktbdGaRRn/xCc6vRHy+D4FO4wBsOPEkkdQcZQw7VfC+vcClkeeBWZ/IQA+uHjaMGud6jR5seBwHM/ZYgZpnA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7d7bc893ef96a900
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXsXt9PApp+h4+ko+z12UBp/97hcp204jTolK8qb1YLvpvs7DUdK1iJ1guueHXiYRr//EOwrZ9HciPJxRH9/RCxYte4RX2slJeJhyY1DBqJfi7eLdlaJ4pSB1LFQNnCMueaSpZ0KaIg68hlg1RTS4XRqO3mUkf+rRlgPd7xm3kunrKO7qgy+EIRWnww2j8+Dv/vN8E/325CIQ2nxmyr7zQP/Fhmuwtm4PcxsbwgEGjP52LLmJEcztiJ1c97V/49rom5g3WeauApMpeF4Rx5HXAMZjNU0fWYYeOxjp3TsIc8C/b1JjZuTOLkZi++nR8hIaEjf5D6xUuFY7ITOjAErIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYbXdiZrqnq/ewGWjWYobOuyBPl4ycZ1/MdqCuZY6pg=;
 b=Yz/Zwt8FcKw0ydjSqi8fpbOPaoHdOD3x76Ia57h1DKbMmU+mSf6462G/wyGJPm/W5aSddkE3E8XoMPhKD6bZtWvM7zSQdClNDQgTEthMdoR+1kA37BQ3fML7XiXqQDtpJZ6l7uJVrPD7f2511DcKcCWc5LCmLcJTNOeaMI78znzdL3sllXgeSp50wBB1gJlvJ4lZw0I6VmWh4I+l69jxz5FxO06GZ49+YQQ7iWNoqJkB5WU+Z4COs08WkWEc46+OafbpCvrngW9Q/bymQgEDLhSFT/5BOdXTlxJK6dMnZzT0vgGn4MWRiw5Gys4yKpZXtDGkPphtDeabwiiB6j0j7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYbXdiZrqnq/ewGWjWYobOuyBPl4ycZ1/MdqCuZY6pg=;
 b=3JcXuUnDbddIcMl84X1vBaz5JjxpMcUXXAhRbEnCmbRKjLvCgoSMnxfEfg3dwbkks6l4ImaA4lodIEIFFoe1vvoktbdGaRRn/xCc6vRHy+D4FO4wBsOPEkkdQcZQw7VfC+vcClkeeBWZ/IQA+uHjaMGud6jR5seBwHM/ZYgZpnA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "iwj@xenproject.org"
	<iwj@xenproject.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	Rahul Singh <Rahul.Singh@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Thread-Topic: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Thread-Index: AQHXweULx+Lzp09rU0elFmx0jxVt5qvUT3iAgAACRwCAABIcgIAEAi0AgAAEIYA=
Date: Mon, 18 Oct 2021 08:05:55 +0000
Message-ID: <85CB568A-E026-4D4F-B72E-B2AB8B001F66@arm.com>
References: <cover.1634315461.git.bertrand.marquis@arm.com>
 <e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com>
 <cef8d2a6-91c1-2d4d-2078-98d0a92b067a@xen.org>
 <F447A1D8-A023-4127-AAC0-7511868DE9C4@arm.com>
 <a45077dc-e144-4427-9ae2-5815045ecaec@xen.org>
 <f77c42e2-4a3c-9e28-25c5-b23efffef25d@suse.com>
In-Reply-To: <f77c42e2-4a3c-9e28-25c5-b23efffef25d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c23db6a2-14cb-4dbd-52aa-08d9920e25a2
x-ms-traffictypediagnostic: DB9PR08MB6633:|DBBPR08MB6316:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB6316DD9BACC46FDCD3A670229DBC9@DBBPR08MB6316.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Qq+N439+YD3qPLyuUgIiabhustf0CQduc6uEoDYde7C4+1fYciEw/uqLvXM5Op8cV0IW661v/C5ou/KgSBqNPaEIbeZDb9NGvf1zZebmhldE+I7MSuRUgKrQYLSBwT6jfIlmgctoy0CeI0zQ5IOeCqAwMvKtYYWVSAOnMtn9lHPa3SKgFHyK9Ivo1UEDOQ7xRIjcVd++6xezwOkADHTmvVzMQ7+XsfM85LsmdVGgW02ekpXlUcqebbyIhyuPgxyEm/kT0uQZgN0OgwSxQueMJ3ioutFOOtISud/8t6E0p4Ub4ksJwMKJDDgfXhuzVJJz6Yk0mE+sr1RPgmgI/jKdK46ApFpFcl/W4auOm/ei5FqShxVcv/ylg5e6lrQXD6tcqtjWAvIqYdB2JNxWDYeT1XAbiG9t6qOKCXgDe3uyOFmhYNU0GFSqLhkf7ExNeszEwQN/eF5h5pqcxbjRl3hXKLi28DOq6eYH5l5TCW8vKRxlkvid+b4piOuoaPruZ2xPqPdfn2arMxIk4XsHO06G+30a6A2IobmNcaaLHc29DziCwzXG97I+4AQQheoCiFGD54C76QnD+o0OT83YOwnbMKdfN0HFdGiFWGp1HZoJfzzTeB7HCIRQvmcEoDnQ3+PbLsxFBES0bfhabLxcPVkkQKgWH4/3b6a04pOmKNRPqzdZLr25Zii+0cEJgn19dYpaLf45mqSHipUs/yMUToxoM2M6/G7KJKSSJZqFXO8x1YZyscgxMTDnH78agASA28xe
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(8676002)(38070700005)(86362001)(5660300002)(186003)(122000001)(66556008)(76116006)(66446008)(6486002)(66946007)(66476007)(64756008)(83380400001)(38100700002)(2616005)(2906002)(316002)(36756003)(91956017)(508600001)(6506007)(6916009)(4326008)(6512007)(54906003)(33656002)(8936002)(71200400001)(26005)(7416002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <73D89DA1251FE54187B6EB7B887FAD40@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6633
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	81ade068-29e3-40b3-f343-08d9920e1da3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	litBNqZRWeZBypnM0qAnFareXEen8ziaDgVX/yyG7+YdlwWl8OcwWTxGTyz+hAJN4doGRfUxXTzwHjCAL2i9Ktv814sOAw5et/gqzGF31o5uwsNF6AwSN/wdUVzr95y0NeAeRRMknEv81OypOWU97+RgV5PMjE9P5cHVrpfuqWwfiRzOO0IIRvohb8mtwCq1EOPHSMqQ3ns918rMsJtzfC89a5v+6o7MTubi4E2lquO/VG8zTHskUI/1yUXxa8evx6V7rF4BNei3j13R3IG5awhvQ0QbfvsUzt8aIhTQ4idblDR/aGHFXQAIztnl6IBMCGoJbohWbt4MY27HE2sij0fmc3xvgdKF4E6mICHc8e2hCm+Jl4Lw6g7giMHqxwz5rAGmh3kUIhUcV+QoXAtkwh4ctZH1wOXKtfQN5tR4bn6CgevgTP96KEWh6VsEyz1ZJmsQe4DgwfEf0Kz52JvPzj/mn/Q53xlCz40eZfVXiCrV5pVHeIWKsQ+Ss//eAQM8XTIOiPA2sHsWsORJNxD+QfrJOsist5d0p2QYtcEAtUQO6PrqI//OTz+67Ari4mj7fWGZSqVNBRaDJ3WewbtMIhy0cc/e/oWsGADIff5ESkS1BoxR+pxQQz57F/1fa487lA6nbSux3X1Moe6vjUTPH+uDCb0qWWzSE+1sOs0gxG6Dm6GuwsfcM8IEWX3JV0/86cBzJxnUCw8BlObQIl6MSw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(316002)(83380400001)(5660300002)(26005)(8676002)(53546011)(2616005)(6486002)(6512007)(6506007)(8936002)(186003)(82310400003)(508600001)(2906002)(336012)(70586007)(70206006)(36860700001)(54906003)(86362001)(47076005)(33656002)(6862004)(36756003)(356005)(81166007)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 08:06:10.8148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c23db6a2-14cb-4dbd-52aa-08d9920e25a2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6316

Hi Jan,

> On 18 Oct 2021, at 08:51, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 15.10.2021 20:38, Julien Grall wrote:
>>=20
>>=20
>> On 15/10/2021 18:33, Bertrand Marquis wrote:
>>> Hi Julien,
>>=20
>> Hi Bertrand,
>>=20
>>>=20
>>>> On 15 Oct 2021, at 18:25, Julien Grall <julien@xen.org> wrote:
>>>>=20
>>>> Hi Bertrand,
>>>>=20
>>>> On 15/10/2021 17:51, Bertrand Marquis wrote:
>>>>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/=
pci.c
>>>>> index 3aa8c3175f..35e0190796 100644
>>>>> --- a/xen/drivers/passthrough/pci.c
>>>>> +++ b/xen/drivers/passthrough/pci.c
>>>>> @@ -756,6 +756,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>>>      if ( !pdev->domain )
>>>>>      {
>>>>>          pdev->domain =3D hardware_domain;
>>>>> +#ifdef CONFIG_ARM
>>>>> +        /*
>>>>> +         * On ARM PCI devices discovery will be done by Dom0. Add vp=
ci handler
>>>>> +         * when Dom0 inform XEN to add the PCI devices in XEN.
>>>>> +         */
>>>>> +        ret =3D vpci_add_handlers(pdev);
>>>>=20
>>>> I don't seem to find the code to remove __init_hwdom in this series. A=
re you intending to fix it separately?
>>>=20
>>> Yes I think it is better to fix that in a new patch as it will require =
some discussion as it will impact the x86 code if I just remove the flag no=
w.
>> For the future patch series, may I ask to keep track of outstanding=20
>> issues in the commit message (if you don't plan to address them before=20
>> commiting) or after --- (if they are meant to be addressed before=20
>> commiting)?
>>=20
>> In this case, the impact on Arm is this would result to an hypervisor=20
>> crash if called. If we drop __init_hwdom, the impact on x86 is Xen text=
=20
>> will slightly be bigger after the boot time.
>>=20
>> AFAICT, the code is not reachable on Arm (?).
>=20
> Which re-raises my question towards testing of what is being added in
> this series. Supported also by the typo in v7 patch 1, which suggests
> that version wasn't even build-tested.

This was an honest mistake, we did build locally but without VPCI activated=
.
Once I discovered this by rerunning all tests (including one modifying the
code to activate VPCI), I signalled it on the mailing list and it was fixed=
 in v8.

We did a lot of tests and tried to be as careful as possible but on the las=
t rush
before the feature freeze deadline those can happen.

Regards
Bertrand

>=20
> Jan
>=20
>> Therefore, one could argue=20
>> we this can wait after the week-end as this is a latent bug. Yet, I am=20
>> not really comfortable to see knowningly buggy code merged.
>>=20
>> Stefano, would you be willing to remove __init_hwdom while committing=20
>> it? If not, can you update the commit message and mention this patch=20
>> doesn't work as intended?
>>=20
>> Cheers,


