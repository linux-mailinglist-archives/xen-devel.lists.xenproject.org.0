Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CA640F34A
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 09:30:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189025.338496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR8Jh-0007pS-Oj; Fri, 17 Sep 2021 07:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189025.338496; Fri, 17 Sep 2021 07:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR8Jh-0007mB-LU; Fri, 17 Sep 2021 07:29:49 +0000
Received: by outflank-mailman (input) for mailman id 189025;
 Fri, 17 Sep 2021 07:29:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQru=OH=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mR8Jg-0007UC-1o
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 07:29:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.78]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 569c687d-b668-41af-a710-7b088ddc5ace;
 Fri, 17 Sep 2021 07:29:40 +0000 (UTC)
Received: from PR3P191CA0025.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::30)
 by HE1PR0801MB1929.eurprd08.prod.outlook.com (2603:10a6:3:50::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 07:29:38 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:102:54:cafe::b0) by PR3P191CA0025.outlook.office365.com
 (2603:10a6:102:54::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Fri, 17 Sep 2021 07:29:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 07:29:38 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Fri, 17 Sep 2021 07:29:37 +0000
Received: from 8e2ff51be636.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A760724D-C089-4E6E-A93C-0966CF724A45.1; 
 Fri, 17 Sep 2021 07:29:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e2ff51be636.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Sep 2021 07:29:26 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4359.eurprd08.prod.outlook.com (2603:10a6:20b:b9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.15; Fri, 17 Sep
 2021 07:29:23 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%6]) with mapi id 15.20.4523.017; Fri, 17 Sep 2021
 07:29:23 +0000
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
X-Inumbo-ID: 569c687d-b668-41af-a710-7b088ddc5ace
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32hs9lkEXp8u8+aXUbXvjic0i9Ga9cqihqwtBjJ6HRo=;
 b=QhLSgxB9viWgu6mzaW4fpiZBIwmcU8D8Sy4FTzkLF8R7cEMUEdul8OwIZ2UyI0BPGlyKqh+wS2vuSF5dPAZ1LE1ttpuGgh3lS/ug7nobQga3gRLiHuhDMf4qofZvjUwwOOnsIw6NV7KgJWkuJ+ipJAOaerNRmUv2lfbuGo2bTxY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: cd03f33da22e8fff
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/JH8L1Z5jlkvAqEwGQo1K2upYa92R1OGqhst8BLevhp95Lw4tWEaNnmw5p7Ef23at0aZpcBDmjF3xVYiRltqOUFphEf5m77BdWp/bl+/WC8TR8ppcoaSjVLZ5ha4F+w3LhCuoWRntuofXD2KCEmwkeMJqxdUoT4aol/SeLZNbzPugMYpwwQC/JGO3cxjAluyR3nFmeOaZcnRCkuHzMb0LY3+JZopNe+gkb+qTrMABRhVa93R6qr9Nbjt+1L0AoJrHV1i2Yosq0StX6zKAVetkJKgVSI5vP3CVbx5EpZxIgbCj3KRMyKUD0keoYHuXILH89WNB+eH3ywx1HmgTxRmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=32hs9lkEXp8u8+aXUbXvjic0i9Ga9cqihqwtBjJ6HRo=;
 b=UUZK3M0BXZnheq639Y8zNmZj2ZjwsW+dgSFeplemiLOSyLuOPpClw+ml0pFKyi737L6DWFN1yHMC3Ibr2ENlIRfaWQNuC1zrcXD0clXLE0PIlcP01Crd1Mx0RCorEDqr8QOseVlKrlhFCzYJBuCQxYEKs8oOzm92jRJ5xKrhLHikZDtXF3J0LEwULiScwSwqrx/btTlanM8fyCWfGBB61FoG66a02lmWBO28DB2VVrxkBvh+fGgqNSMy0+4OBCGfyh5ZqZyVA/wil8+P8Lery/9vKbGHNlKI7Mu0V0x+4FmLek+svppU9V1xLxoERLzgmuXob9gmOBPcabP08d2PLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32hs9lkEXp8u8+aXUbXvjic0i9Ga9cqihqwtBjJ6HRo=;
 b=QhLSgxB9viWgu6mzaW4fpiZBIwmcU8D8Sy4FTzkLF8R7cEMUEdul8OwIZ2UyI0BPGlyKqh+wS2vuSF5dPAZ1LE1ttpuGgh3lS/ug7nobQga3gRLiHuhDMf4qofZvjUwwOOnsIw6NV7KgJWkuJ+ipJAOaerNRmUv2lfbuGo2bTxY=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Index:
 AQHXoJ57xrO/H5MzpEqKB3+2EFX1LqudvyUAgAXn+wCAAP1GAIAAWBqAgACkJYCAAjRZAIAAFToA
Date: Fri, 17 Sep 2021 07:29:23 +0000
Message-ID: <DA121AFC-E89C-43CB-A7F2-160D579AEC2C@arm.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-10-andr2000@gmail.com>
 <alpine.DEB.2.21.2109101308490.10523@sstabellini-ThinkPad-T480s>
 <6a4e6a1d-12c9-09bb-442d-ce7f6586ef89@epam.com>
 <20b0a8c0-10dc-7473-3c56-a9baeaa43e62@epam.com>
 <6EA9A8EE-8101-4679-832C-A912819891BC@arm.com>
 <alpine.DEB.2.21.2109151321030.21985@sstabellini-ThinkPad-T480s>
 <e413eea9-b6ae-9cf8-66a6-f02fdcb645bd@epam.com>
In-Reply-To: <e413eea9-b6ae-9cf8-66a6-f02fdcb645bd@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6122d151-4095-4289-7f4f-08d979ace7f0
x-ms-traffictypediagnostic: AM6PR08MB4359:|HE1PR0801MB1929:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB1929734195B3D01E1EFCD1D9FCDD9@HE1PR0801MB1929.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5Yt+B9UpJK46HE73clWGR+L1BPWIBAua3jfXy95ItJrG+QotKJG8M8/+qo5BLypTCLBLFPZLwwrOvVE++b012FhQoWNaccg3XKoQ2QJra7auUZClXOq1XBnbHqvzNjso8B0jjxI2y6ntrgNQjgJ9FKy+2zadDghOoge4uvkCuh5yrtXZmyoRUZ4vX486iKuOYhsIFzoJdXB5O0ReJCrBSuviK4XsLMP5Q4kx1cWB4gjOJL+0dAlDpM6ZsKkLUUJcFa5nDpU6yDOyvAn5UCGIOD01fP+/rw8IoFOcCFzy5VvWNKhs0PZ1MadtG0Q/IFPj9Km8MCIaUC/La0YCAPDMarzmDdTGcQdPvTDreuQN39eS1INf0xa3itLN8rEm/DJyUO3yod91ifgrhbu2oVfSoRvUFGYYptDDhzLF+GeUjBlWcMKWMkZT1g98hBv4ceGw269aMrTiBQlOxZcL4l+YmBTVd1z9QweT5Trc44YbnL4ItgMNSDImapmjkKBlJUqDV+BYLY1v+wzsicu0J4d5b3usf15DnsSnLA4VbgXKewvIzaDehTOONlvhRN9YhCzyx1GFJXoLNBVPSxcZvfMlXZB9lSq86blngfpxqAvvWpM9PDta7z3Nj1uObvyf06ekKm3QbPdMMCD/pDM0H9oGOOOQHjcThtmFRnAq0SIm6DEyuxK2eCniwKK4VryaxjZQweTMmDiRzc6m8aovB9098Ck5lYxCi3XXiKEw0vM6gM0ttArXCXfGiTEyakelLPhI28Pmtfts95PJsX5Paykyk25cU0p3m3lsujyjqwjKf5pnx/8unEgXySe3iJtoqghSQVb0wxRJoOckB3NWvTT2SQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(396003)(376002)(366004)(136003)(33656002)(66446008)(71200400001)(26005)(6916009)(2616005)(478600001)(2906002)(66556008)(83380400001)(966005)(316002)(64756008)(66946007)(91956017)(66476007)(36756003)(76116006)(186003)(8676002)(5660300002)(4326008)(122000001)(38100700002)(38070700005)(86362001)(6506007)(6512007)(8936002)(6486002)(54906003)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A64F14B0DF37A94FB47121445280DEA2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4359
Original-Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b91a1034-4e33-4e29-65ed-08d979acdf31
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4B60ywczJsrj6mCSycmBDAq+2uBNEb36uQ9aES7G7cTqpWwxzM7LUJe4uiaUIwLYg5VOnseS8XGUOaD7IgqKDdGEOWuyGGz/izTHUmBL0s4qVbShq9rCXIBw1HO+njOfb7imQcwbPr6YZ9e072tJCRgRxPaAO/68nN1taHkn+RszMdPLG7GYECvq7BQqKoYfxrw4qlNU91YLpqhY/rEFLQ68uEe6a+e5L0cflJ8Aeq9pzzSOXl6lqwDIpYAMa4wUoKNngJvDNl9Wztog5cVRUTny9/Y6JNLg7Ej0mZB14OOQ6a/RyXVuNxrqzY890oL/kyl40uzok3M55vdbiu97uPf02D2dzQQoILSoK41INfL8LBcv/dhSb0tsGfEsgJfpwAdbUG5hgN42YJqHP8QEXurY04Ue2N1vFD2Ok/K+1rq0n0B9bUxnOLkfCMvNi/h8OqcIOX8S7johtsb3JVWvERUfBl4Rc2yrXfyIgnY/GoWUR4Gqsk/SXEv98w0VkpGuwARzJASFOxcGkCDrNPWNfL/ORezazd9fj6wka8wg8m4pQP3DYjCMoYh9Yn3ihdkVkmBnlemKkFj5cuh4Nahjbpba2Kvfn72nBqs/eddwzYfbaBqQA6g06YJcNOH5RCbBEzBo8FLYxnWwlFgKB1rynWtw4uVPCj78Jry7Rufu4BeRWKozlM4bO4SJwnzi15aM+XUujLmOAt90pEW2fCjnkE5msCQkOWWACxueGpKwfTg96HF4caNogOCaR7BADWZLOrdPCIfvqvUJs6OInOm792gj+73XVufXVEzue89XiOc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2906002)(316002)(53546011)(6506007)(70586007)(4326008)(6862004)(82310400003)(356005)(86362001)(26005)(81166007)(6486002)(36756003)(8676002)(36860700001)(54906003)(508600001)(5660300002)(2616005)(83380400001)(8936002)(966005)(186003)(33656002)(107886003)(47076005)(336012)(6512007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 07:29:38.1220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6122d151-4095-4289-7f4f-08d979ace7f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1929

Hi Oleksandr,

> On 17 Sep 2021, at 7:13 am, Oleksandr Andrushchenko <Oleksandr_Andrushche=
nko@epam.com> wrote:
>=20
> Hi, Rahul!
>=20
> On 15.09.21 23:33, Stefano Stabellini wrote:
>> On Wed, 15 Sep 2021, Rahul Singh wrote:
>>> Hi Oleksandr, Stefano,
>>>=20
>>>> On 15 Sep 2021, at 6:30 am, Oleksandr Andrushchenko <Oleksandr_Andrush=
chenko@epam.com> wrote:
>>>>=20
>>>> Hi, Rahul!
>>>>=20
>>>> On 14.09.21 17:24, Oleksandr Andrushchenko wrote:
>>>>> }
>>>>>>>   +static int pci_ecam_register_mmio_handler(struct domain *d,
>>>>>>> +                                          struct pci_host_bridge *=
bridge,
>>>>>>> +                                          const struct mmio_handle=
r_ops *ops)
>>>>>>> +{
>>>>>>> +    struct pci_config_window *cfg =3D bridge->sysdata;
>>>>>>> +
>>>>>>> +    register_mmio_handler(d, ops, cfg->phys_addr, cfg->size, NULL)=
;
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>> Given that struct pci_config_window is generic (it is not specific t=
o
>>>>>> one bridge), I wonder if we even need the .register_mmio_handler
>>>>>> callback here.
>>>>>>=20
>>>>>> In fact,pci_host_bridge->sysdata doesn't even need to be a void*, it
>>>>>> could be a struct pci_config_window*, right?
>>>>> Rahul, this actually may change your series.
>>>>>=20
>>>>> Do you think we can do that?
>>>>>=20
>>>> This is the only change requested that left unanswered by now.
>>>>=20
>>>> Will it be possible that you change the API accordingly, so I can
>>>>=20
>>>> implement as Stefano suggests?
>>> We need pci_host_bridge->sysdata as void* in case we need to implement =
the new non-ecam PCI controller in XEN.
>>> Please have a look once in Linux code[1] how bridge->sysdata will be us=
ed. struct pci_config_window is used only for
>>> ecam supported host controller. Different PCI host controller will have=
 different PCI interface to access the PCI controller.
>>>=20
>>> [1] https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/ke=
rnel/git/torvalds/linux.git/tree/drivers/pci/controller/pcie-rcar-host.c*n3=
09__;Iw!!GF_29dbcQIUBPA!kjkv6KIlvXOEgVaS6BNPRo0gyABihhO0XmNHRPFJaFAGhhTEuK1=
mIsWqPs0cXEipzkT_MmA-Eg$ [git[.]kernel[.]org]
>>>=20
>>> I think we need bridge->sysdata in future to implement the new PCI cont=
roller.
>> In my opinion the pci_config_window is too important of an information
>> to be left inside an opaque pointer, especially when the info under
>> pci_config_window is both critical and vendor-neutral.
>>=20
>> My preference would be something like this:
>>=20
>>=20
>> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
>> index 9c28a4bdc4..c80d846da3 100644
>> --- a/xen/include/asm-arm/pci.h
>> +++ b/xen/include/asm-arm/pci.h
>> @@ -55,7 +55,6 @@ struct pci_config_window {
>>      uint8_t         busn_start;
>>      uint8_t         busn_end;
>>      void __iomem    *win;
>> -    const struct    pci_ecam_ops *ops;
>>  };
>>=20
>>  /*
>> @@ -68,7 +67,8 @@ struct pci_host_bridge {
>>      uint16_t segment;                /* Segment number */
>>      u8 bus_start;                    /* Bus start of this bridge. */
>>      u8 bus_end;                      /* Bus end of this bridge. */
>> -    void *sysdata;                   /* Pointer to the config space win=
dow*/
>> +    struct pci_config_window* cfg;   /* Pointer to the bridge config wi=
ndow */
>> +    void *sysdata;                   /* Pointer to bridge private data =
*/
>>      const struct pci_ops *ops;
>>  };
>>=20
>>=20
>> As a reference the attached patch builds. However, I had to remove const
>> where struct pci_ecam_ops *ops is used.
>=20
> I'd like to know which route we go with this as this is now the last
>=20
> thing which stops me from sending v2 of this series.

I will modify the code as per Stefano request and will send the next versio=
n.

Regards,
Rahul
>=20
> Thank you,
>=20
> Oleksandr


