Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C660D40C3E9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 12:46:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187462.336328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQSQn-0006Jh-AT; Wed, 15 Sep 2021 10:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187462.336328; Wed, 15 Sep 2021 10:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQSQn-0006Gx-6i; Wed, 15 Sep 2021 10:46:21 +0000
Received: by outflank-mailman (input) for mailman id 187462;
 Wed, 15 Sep 2021 10:46:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LStB=OF=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mQSQl-0006Gr-80
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 10:46:19 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.58]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 155e62e8-588f-4bb9-a083-482e3a0a5509;
 Wed, 15 Sep 2021 10:46:15 +0000 (UTC)
Received: from AM6PR0502CA0049.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::26) by VI1PR0802MB2429.eurprd08.prod.outlook.com
 (2603:10a6:800:ba::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Wed, 15 Sep
 2021 10:46:14 +0000
Received: from AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::8) by AM6PR0502CA0049.outlook.office365.com
 (2603:10a6:20b:56::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Wed, 15 Sep 2021 10:46:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT003.mail.protection.outlook.com (10.152.16.149) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 15 Sep 2021 10:46:13 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Wed, 15 Sep 2021 10:46:12 +0000
Received: from 3ba332429c71.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D8BC9BC8-49DD-4066-BD88-52E93A6E70F0.1; 
 Wed, 15 Sep 2021 10:46:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3ba332429c71.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 15 Sep 2021 10:46:04 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM5PR0801MB1874.eurprd08.prod.outlook.com (2603:10a6:203:49::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Wed, 15 Sep
 2021 10:46:00 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%6]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 10:45:59 +0000
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
X-Inumbo-ID: 155e62e8-588f-4bb9-a083-482e3a0a5509
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGKW/gOUVgzzW5DtTrQAoowlwet+WhTAaJlhFN8KcOQ=;
 b=MxAHddygq4WnAPubJ1aCLS2yNQAyLBSeE5kbwdN3d1gPcI2YAQWUdB7q6uXcuqC87BC0NfWDbTN7peeJBbPxif0a0oWoLw9I3iM+pLiDwWWn0dT36IHIoVNIZswcQOj3jBluZWDXMS8ldd9vM7TMa/Qx8oKLmQ3alsKpLOxsFYQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2f58c133a6dece66
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZqvBZthUKsvayXUhMcteLFnKCAMEdZimPqmdc24dG8UoIFcvODoh4Rx/0NaIV+tIas7BHTfv3Bqp3yDuGjmvriKJoK2/MlkGA4nxYOqTfu+JZ2tN1l2jW+y7l1Sk9WMMpD3tM9iEWaSYZaNpBUqRJeGa+q8RFHeIRhPMLcdDGZyTZNnGba1QuNUBqOQmPQI19Zb+HZuskrdVJPEgfwolbDuan6/o/cH+VNfrvq+/UrTWT4vju5/wbxUgffLCCfAvHaGsqlkh++p13q0m4cCwSE1I8B0zfbwoi1FlBBJFQF+EYtwI5DDQC7O/qsxMiKaswO/+Mu4MHStPwDGaAujrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oGKW/gOUVgzzW5DtTrQAoowlwet+WhTAaJlhFN8KcOQ=;
 b=gsdt5OOdRaCIvreOvXvOQRk7mJrNQS9hOYl8GsiXdWQrRfCa8VhxTHb8mT+ZpZOt5vR3mG4diDu816I0ZyOpi3hdisFOIrWa/XtkbON1v46yJGhPkXJOULdy3BOJ0e5+T92RFe18MS2UvTdINp8BukxQW/RIDzFgHI2LtOKHWitknB5fDOeFY28jdwmLTQUpjqQcXKEoGD4lpoa3LwNQiglD122Px4e9/0N4EAQRrKYwQqwtq1Vl+6QXvV+WtcWxI/qDdZ2pPz/5nQNiHQgWZWPwk9CfuZfw/ThsoUMbapjsyXaTnvMAnVlM201LstoDYhT7IhguJylGKm+EvW1QAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGKW/gOUVgzzW5DtTrQAoowlwet+WhTAaJlhFN8KcOQ=;
 b=MxAHddygq4WnAPubJ1aCLS2yNQAyLBSeE5kbwdN3d1gPcI2YAQWUdB7q6uXcuqC87BC0NfWDbTN7peeJBbPxif0a0oWoLw9I3iM+pLiDwWWn0dT36IHIoVNIZswcQOj3jBluZWDXMS8ldd9vM7TMa/Qx8oKLmQ3alsKpLOxsFYQ=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Index: AQHXoJ57xrO/H5MzpEqKB3+2EFX1LqudvyUAgAXn+wCAAP1GAIAAWBqA
Date: Wed, 15 Sep 2021 10:45:59 +0000
Message-ID: <6EA9A8EE-8101-4679-832C-A912819891BC@arm.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-10-andr2000@gmail.com>
 <alpine.DEB.2.21.2109101308490.10523@sstabellini-ThinkPad-T480s>
 <6a4e6a1d-12c9-09bb-442d-ce7f6586ef89@epam.com>
 <20b0a8c0-10dc-7473-3c56-a9baeaa43e62@epam.com>
In-Reply-To: <20b0a8c0-10dc-7473-3c56-a9baeaa43e62@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ee5798ec-4000-40cc-3b3d-08d9783609b2
x-ms-traffictypediagnostic: AM5PR0801MB1874:|VI1PR0802MB2429:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB2429FAA595D4A5CD9EECE9B1FCDB9@VI1PR0802MB2429.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TSyFtXjiXlZ96HTrFqTKF89wK5JvskoIsUHK5Il3n9iF1I1N+vk7MM6NVieJGv+4CNpAQ8OmfQO8x72ghWgsDPGGlyknLnCSB8VtICVAz2nA1SxoUcrSZI9sgsw8F8DFSV407mpLGD7CcJIz9d2CQ0cvfegqyV6MlER8ds++OMHYQhdKF2Nye5hjKIC1XjkdQJbcwZIhHhl4Rz4PgOa/nmnRBGTKSIlC6a2KT2VxhUWnbM2qgxM27h5BQx4/KevLKCSq6XdZrC8OrijWyEZ2L8Ev2i3SzJZrW26tl2JNIXW7XzXAWDvPuNkHMxiq0jlwa0KQx4DhZkpPjel26+4k0K5DjWpiNAurkes+fm+0/o/HxzQ4+NmyyyNQ3d/5NpcQZNNNP4bhvU3rOP76/uRXrB8LNxbkrjKrtSlwxabWILrN/UTFeKjH9F6ZwPenzymokhgBA6wnYaL7WdWNqU+gGYbRmgGyYn4sxEmK0Qtq4b3P+c/MHmmP1qvskP7UimMVGmVIPBnOqaOVs2zSPSuFdO7tD53Du3XSy828X6k6CQ8KFG7eo9yUK/+cgi3uGN22mEFtsQ5TV7EmsI87ofFa5b3FJmULXC9ITjo1wl9SyoODaQLWddblrLnhjiEcneqHjaWt4BnFDwVpyBq+8J3gt6k63xa49nZ/WZuTn7lw0ea5SJTmIAm13P2pzTJepHWCOw4aqyJuh75b1NrmmrfuacrmzyPNkt+EDVHRdTbrWyI//q1xmQWu0uWlzQG4sT59PJtrR1fP00HWGGzCyPIE2oG2IA2SqhXoi3J1ULwyQDVrVZ3YuZFB25NGtsX9EdpUkipDzxTURojvvP8biLFm7w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(478600001)(38100700002)(83380400001)(2616005)(66946007)(66476007)(38070700005)(186003)(26005)(71200400001)(76116006)(966005)(5660300002)(64756008)(66556008)(66446008)(6512007)(8936002)(36756003)(91956017)(6506007)(53546011)(4326008)(2906002)(122000001)(6486002)(54906003)(6916009)(8676002)(316002)(86362001)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7BAB166D3F43E242B61ADD1EC0E0A731@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1874
Original-Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8cfa7acd-1ffd-4300-8b71-08d97836018e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GqOg/gFCAAwWnGH5N56v56ur2Fmj8eW5SZQlpHnvX1sLjuaD+lt505KEUNwYb4c8P7Z9FDMXG2Jahi825+xLxTjG+q3I26Fzko5hwRSvMXuAJmxcZGxZm8yybCnwRUXmHIM8mqvr/wvyprOZgsDsTUyJvp0b5XqzWsHUXFd+asu8V6BMgfOP5yZNKcvZof4R2iOhOgfI1y9gqxr1e+cg+Ap5DDdNjbku9GjCvtH3CkNp9Zn12dO5/F6cgh+r7gg/zHprubCsxpUe1mghSqybhq4k/RT0isiogzjZ/mCNk1Q44RF8Cjq4ViirEM9Aee6XgN56bzj5Gkuxw2BuuM3RKm3pDuWFCW4pAg5cAZyTylZopwdDFTAN6/ofwejS4NrZNLU3dEcCtrvsPsGPf1A0Fa+5lQY6hiCrEuaQa2bg2y3+25C94fxBFZUDnuE8HK1OLugSljXnEyPixd1UvgTpxXOeutoqfKORQr2hLeCJ/kxV9el5iotXj5BI0MBkWdyXDVAZSs8DRd5dScVv8hoi87ZOkRHWYCI6KPXxAb7BDmhcn7U//3ZSe19cYwN6MuwekM28Ybx3eF70e1yrq+fE+Rm4CtEedVLXM4tNWG2Ym0NA9lD8nW4Ooe3I3E8dkY79XbISN3PAviSqS7USxnZyP/vzhQ+InXY9yozuyaxkAjVcCcTFYtpEDP5IAX98ERN25ZTDDK8+FLPrDMUvlHGY02lhLwcE4+TRi8cT3s8uwy9lghygmfPpRvMl358OMbaxW0kDVHoexi6V6XEIrM7sxFD5lH3IGJH/FsI6NUAvMRY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(36840700001)(46966006)(82310400003)(47076005)(2906002)(2616005)(6862004)(82740400003)(6506007)(6512007)(107886003)(5660300002)(4326008)(356005)(966005)(316002)(6486002)(81166007)(70206006)(33656002)(70586007)(54906003)(478600001)(36756003)(8676002)(336012)(86362001)(36860700001)(186003)(26005)(53546011)(83380400001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 10:46:13.5288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5798ec-4000-40cc-3b3d-08d9783609b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2429

Hi Oleksandr, Stefano,

> On 15 Sep 2021, at 6:30 am, Oleksandr Andrushchenko <Oleksandr_Andrushche=
nko@epam.com> wrote:
>=20
> Hi, Rahul!
>=20
> On 14.09.21 17:24, Oleksandr Andrushchenko wrote:
>>=20
>> }
>>>>   +static int pci_ecam_register_mmio_handler(struct domain *d,
>>>> +                                          struct pci_host_bridge *bri=
dge,
>>>> +                                          const struct mmio_handler_o=
ps *ops)
>>>> +{
>>>> +    struct pci_config_window *cfg =3D bridge->sysdata;
>>>> +
>>>> +    register_mmio_handler(d, ops, cfg->phys_addr, cfg->size, NULL);
>>>> +    return 0;
>>>> +}
>>> Given that struct pci_config_window is generic (it is not specific to
>>> one bridge), I wonder if we even need the .register_mmio_handler
>>> callback here.
>>>=20
>>> In fact,pci_host_bridge->sysdata doesn't even need to be a void*, it
>>> could be a struct pci_config_window*, right?
>>=20
>> Rahul, this actually may change your series.
>>=20
>> Do you think we can do that?
>>=20
> This is the only change requested that left unanswered by now.
>=20
> Will it be possible that you change the API accordingly, so I can
>=20
> implement as Stefano suggests?

We need pci_host_bridge->sysdata as void* in case we need to implement the =
new non-ecam PCI controller in XEN.
Please have a look once in Linux code[1] how bridge->sysdata will be used. =
struct pci_config_window is used only for=20
ecam supported host controller. Different PCI host controller will have dif=
ferent PCI interface to access the PCI controller.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/pci/controller/pcie-rcar-host.c#n309

I think we need bridge->sysdata in future to implement the new PCI controll=
er.

Regards,
Rahul
=20
>=20
> Thanks,
>=20
> Oleksandr


