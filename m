Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDFC42EBEF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 10:21:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209897.366477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbIS8-0004F6-Rm; Fri, 15 Oct 2021 08:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209897.366477; Fri, 15 Oct 2021 08:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbIS8-0004Cd-OP; Fri, 15 Oct 2021 08:20:32 +0000
Received: by outflank-mailman (input) for mailman id 209897;
 Fri, 15 Oct 2021 08:20:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mbIS7-0004CX-6k
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 08:20:31 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::62e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 032c2502-997a-4c87-bb9e-711e47385fac;
 Fri, 15 Oct 2021 08:20:29 +0000 (UTC)
Received: from AS9PR06CA0315.eurprd06.prod.outlook.com (2603:10a6:20b:45b::26)
 by PR3PR08MB5836.eurprd08.prod.outlook.com (2603:10a6:102:8f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Fri, 15 Oct
 2021 08:20:27 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45b:cafe::60) by AS9PR06CA0315.outlook.office365.com
 (2603:10a6:20b:45b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 08:20:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 08:20:26 +0000
Received: ("Tessian outbound f1898412aff1:v103");
 Fri, 15 Oct 2021 08:20:26 +0000
Received: from cb940565f6c6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ED9F4B0D-2D6D-46D2-ACAE-939B3A9A21D0.1; 
 Fri, 15 Oct 2021 08:20:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cb940565f6c6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 08:20:19 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DBBPR08MB4919.eurprd08.prod.outlook.com (2603:10a6:10:f0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 08:20:16 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.031; Fri, 15 Oct 2021
 08:20:16 +0000
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
X-Inumbo-ID: 032c2502-997a-4c87-bb9e-711e47385fac
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylyEFr7ZRm/Rji1Q2XsNjohqntNHuiA+r7nCGnGWRz0=;
 b=dVcA3oyze7nQH8an2B0dOC5GP3gjxLCpRNf3eA1FYKMWbYJGcaWegrGUYBhxg829jVj+xed6YMlQ1nFRdLN1HDLYjNrmQnKl31sIxsV+/EtByitxlfFCIrkBveOqVdZ7ny69y40NKbhYvoTXPsjzITsead7WgPUfYGJf/mMtCow=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d7b6ecd2e8583707
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSDwOoP/GJ7hASwkFBn7Yx0nWCRlpFAd/GWK8ttS8rwQk/UXeH0cS07Ee6t028kxKHpxfd4IIwiTB6roS/+0yU6Q5gswD6iccVWtzKyb6eh6xiXwznkY8p0qp60GB5LALmAUMlYFZGWF3G1gS8Hy1Oh05XQZK/094N8rhF+8ADQZyWk7v8xDzTrK3oHqH6yO0X5tZKCPPc+HTDa5HrmT+wSbq+Y/cwhsFn+iVy6t2QROaucEndnS33GzjFNWbJIgE0esDUKdpFc78P9SMZYmr6yaPe29XIIB7CGFu1QgAyPNqVxMWvNg/kQu5yHmYJehOQ7P0CYnZTaHNje1MwXazQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylyEFr7ZRm/Rji1Q2XsNjohqntNHuiA+r7nCGnGWRz0=;
 b=jq5ySdjlnvgOpdEq5xqhDq5VWoaf7rh6XPqkQkSIfmfV/KtbmRB+WADfOrjrcRPCy984Uh9rmDMc2lc37lVYIPaM219Llkpfo5/blXZMbv+QjOHv5H2MEmZ2vQRnEnvyVm+fsIF1aAGti1tCG9fjE4OXp/gNU1ai4Rvj2RBnve7N1155M6DhVoWJpa6x4DXUP4oyoTJn0K38wKZPqRcTP8jhF0h8Ih6NNZcb+N6WytCynVj1Q6wL+rVC/X9NhSMsKFdaBB51rcVpUmspgYlf9bG9Yf6L1PLd6jJXKnk6SZusPbk5hJS/dNDZZC1cVZp/swgD+X3C/1E0w35jbba2HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylyEFr7ZRm/Rji1Q2XsNjohqntNHuiA+r7nCGnGWRz0=;
 b=dVcA3oyze7nQH8an2B0dOC5GP3gjxLCpRNf3eA1FYKMWbYJGcaWegrGUYBhxg829jVj+xed6YMlQ1nFRdLN1HDLYjNrmQnKl31sIxsV+/EtByitxlfFCIrkBveOqVdZ7ny69y40NKbhYvoTXPsjzITsead7WgPUfYGJf/mMtCow=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Paul Durrant <paul@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>
Subject: Re: [PATCH v6 1/3] xen/vpci: Move ecam access functions to common
 code
Thread-Topic: [PATCH v6 1/3] xen/vpci: Move ecam access functions to common
 code
Thread-Index:
 AQHXwQraA42SZeh0QUGI/xX7keuWA6vSqLgAgAARnQCAAN+ngIAAEtoAgAAKIACAAAHqgA==
Date: Fri, 15 Oct 2021 08:20:16 +0000
Message-ID: <9B9BE725-53E4-49CC-80EC-E856081E08ED@arm.com>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <ced6f870dbfabcfe8584555cc80f9a37a0655a0c.1634221830.git.bertrand.marquis@arm.com>
 <20c73f4e-5a8b-c127-f3a7-b841f50b1a4a@suse.com>
 <6C71E132-0A78-4DA4-AA52-E62833912145@arm.com>
 <8a7d1370-ee58-8e95-efea-8e4162e1e5f7@suse.com>
 <152124C4-9A34-4F5B-B6C5-CBCC6A175665@arm.com>
 <9f0f8e0b-c989-d2ae-39eb-6784446fa6c3@suse.com>
In-Reply-To: <9f0f8e0b-c989-d2ae-39eb-6784446fa6c3@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e39ba81e-105a-4d16-5421-08d98fb4a4af
x-ms-traffictypediagnostic: DBBPR08MB4919:|PR3PR08MB5836:
X-Microsoft-Antispam-PRVS:
	<PR3PR08MB58360AF3FC99BD59BEDCFB2C9DB99@PR3PR08MB5836.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 b1WM6mg+DgfzSTV9kwgC8Q+Etv8M9BfJN1y0/gDN/dw/lfMex5TclHkPQFalMfey4mjmUYW1HJQ1KOz+AFsmK2TTRpNSLxkKVDnedMfHXWewUcww7W0XHfnxc3Jm1PUZ1nV09jiZS3PuJ4SGuXWNJMY7Plppd51k8YcqDlOlCcRNhHDgP88E+NpldPrzy7jcsbFFJ/044tUEXfX3XpUMpRHFV3BcjxxmLeI9VUa/gPrIjiveOG3YqBZvbmkeDXFGgjtDAVWrx9MY3kRfHtOXhx0ic1CeGBY2HkDGBXwLa/Uzwa7iHPxXaOxfo1WfTuAOEY9lOusqYNL3E4veMxATjZ8nXow2ivDowguZgsrDclm4BaDMBv95w2gzEWWz4CL1l2IhOtNcvErFDFg1kRRNS0UjCXkcJng2C9m0EjHc/P2eCd/S7+CQw5mWryAkoOMeQj1MU2dpjkS82lT2nRXQoP/QYDkCxZZ9plUfoz61oMxpcxvXNbby8TTMRfjwl8LD5Y24fnL2czB/kqslIe0NiA3Kf9zy9trCgm55VqsDwo9y1eD17gDyan4rmNZhbfvoCBdaUVG4k5LTRltYCC7h11SrcDyGCKoXZ+UvzTTbAzTK3n3AN4ivD+ml1zgelSba7Fk9Mvsp1NgkZvtxUdm2Tz6A7mqesxZ3F/k5K9EOU6hGWnpB6rR+BRlkb7afRANP4qCB6lI+T9oFlFRVi2xjXxOd3XqSd/9Lldx1ioUj9dHRzNu0uLtndGaRCbmPX/Nr
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(8676002)(53546011)(508600001)(2616005)(4326008)(33656002)(71200400001)(6506007)(83380400001)(54906003)(36756003)(6512007)(38070700005)(186003)(66446008)(64756008)(66946007)(66556008)(66476007)(8936002)(6916009)(76116006)(6486002)(86362001)(2906002)(5660300002)(91956017)(38100700002)(26005)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B9B8C73115548D478BADE4306F689147@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4919
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8634fa75-38e6-47c5-1352-08d98fb49e9b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LvUIwMxx2I8YAv1LibWItFKloFR4T47RYB9rCy/Bs9kehZ14Q/oT653djGY6W2D3FTW4ouff62lhHtRffWoW8GKjIpXbpPpwLo6hCP0fyOXuwKpGQyC/n+fbCJ3n3WP8POS6ZZXwKcngv/z2f0t2m8Qp973gEW4L9matJ0cVeAXMWK6v3/HUM6tQblVz4L8isauPYkcMk1aUWryWTSU4+ebUcMOOQQMRSDNDApS4KjGpgB+4EiXpnc0Qx/kO9o8W8/LnpK/t0w2lxmW1W6mj+Y/TehpQUFCWuIoagSL5wMJy5j7oBnJAedkGymmLyrXhqJm2oU/dG7I9BVGZaOJAzsylSxOFqjaLT8JMayfmjbZSzHapIFWWGF4WdZcWdN4pnaXA9YiU1yciYL3Kxyuuq/AvncnEiC73fNg9xAobfCHlHerBf215tdlH87puoVny8un7rAw1Jcr8xXrmgbyhiUuV1oxi6wqPFV9yK27GYDyZCvKHK/44VFPA2updycQQV52PBscaq7ZcmF/LaQ7G3ccnEJOtsQYkX7Io8JuCReImh5C46ESnfhmWICgw0wt/AZvaoUh1hIqmdMc6gbnSMJh6A3QsmDh1FYFb9A7aUYPLYRx7Yc1WJldSlEqoLaeeo9wQdWJiQU6jQZtUCEF4QwjLNo4Bq7eskz7cTpx3oXxH+67IRn2Y8ybMXhrp0wvqLBrqG3hTrI9hUaQl5/TGcA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8676002)(82310400003)(4326008)(508600001)(8936002)(81166007)(6506007)(6862004)(47076005)(6486002)(53546011)(316002)(83380400001)(36860700001)(70206006)(86362001)(70586007)(33656002)(5660300002)(36756003)(54906003)(356005)(186003)(6512007)(336012)(2906002)(2616005)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 08:20:26.8915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e39ba81e-105a-4d16-5421-08d98fb4a4af
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5836

Hi Jan,

> On 15 Oct 2021, at 09:13, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 15.10.2021 09:37, Bertrand Marquis wrote:
>>> On 15 Oct 2021, at 07:29, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 14.10.2021 19:09, Bertrand Marquis wrote:
>>>>> On 14 Oct 2021, at 17:06, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 14.10.2021 16:49, Bertrand Marquis wrote:
>>>>>> @@ -305,7 +291,7 @@ static int vpci_portio_read(const struct hvm_io_=
handler *handler,
>>>>>>=20
>>>>>>   reg =3D hvm_pci_decode_addr(cf8, addr, &sbdf);
>>>>>>=20
>>>>>> -    if ( !vpci_access_allowed(reg, size) )
>>>>>> +    if ( !vpci_ecam_access_allowed(reg, size) )
>>>>>>       return X86EMUL_OKAY;
>>>>>>=20
>>>>>>   *data =3D vpci_read(sbdf, reg, size);
>>>>>> @@ -335,7 +321,7 @@ static int vpci_portio_write(const struct hvm_io=
_handler *handler,
>>>>>>=20
>>>>>>   reg =3D hvm_pci_decode_addr(cf8, addr, &sbdf);
>>>>>>=20
>>>>>> -    if ( !vpci_access_allowed(reg, size) )
>>>>>> +    if ( !vpci_ecam_access_allowed(reg, size) )
>>>>>>       return X86EMUL_OKAY;
>>>>>>=20
>>>>>>   vpci_write(sbdf, reg, size, data);
>>>>>=20
>>>>> Why would port I/O functions call an ECAM helper? And in how far is
>>>>> that helper actually ECAM-specific?
>>>>=20
>>>> The function was global before.
>>>=20
>>> I'm not objecting to the function being global, but to the "ecam" in
>>> its name.
>>=20
>> Adding ecam in the name was a request from Roger.
>> This is just a consequence of this.
>=20
> Roger - did you have in mind the uses here when asking for the addition
> of "ecam"?
>=20
>> One suggestion here could be to turn vpci_ecam_access_allowed into
>> vpci_access_allowed
>=20
> That's what I'm asking for.

Will do

>=20
>> and maybe put this into vpci.h as a static inline ?
>=20
> I'm not overly fussed here.

Was just a suggestion, I am ok to just rename it and keep it where it is.

>=20
>>>>>> @@ -434,25 +420,8 @@ static int vpci_mmcfg_read(struct vcpu *v, unsi=
gned long addr,
>>>>>>   reg =3D vpci_mmcfg_decode_addr(mmcfg, addr, &sbdf);
>>>>>>   read_unlock(&d->arch.hvm.mmcfg_lock);
>>>>>>=20
>>>>>> -    if ( !vpci_access_allowed(reg, len) ||
>>>>>> -         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
>>>>>> -        return X86EMUL_OKAY;
>>>>>=20
>>>>> While I assume this earlier behavior is the reason for ...
>>>>=20
>>>> Yes :-)
>>>>=20
>>>>>=20
>>>>>> -    /*
>>>>>> -     * According to the PCIe 3.1A specification:
>>>>>> -     *  - Configuration Reads and Writes must usually be DWORD or s=
maller
>>>>>> -     *    in size.
>>>>>> -     *  - Because Root Complex implementations are not required to =
support
>>>>>> -     *    accesses to a RCRB that cross DW boundaries [...] softwar=
e
>>>>>> -     *    should take care not to cause the generation of such acce=
sses
>>>>>> -     *    when accessing a RCRB unless the Root Complex will suppor=
t the
>>>>>> -     *    access.
>>>>>> -     *  Xen however supports 8byte accesses by splitting them into =
two
>>>>>> -     *  4byte accesses.
>>>>>> -     */
>>>>>> -    *data =3D vpci_read(sbdf, reg, min(4u, len));
>>>>>> -    if ( len =3D=3D 8 )
>>>>>> -        *data |=3D (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
>>>>>> +    /* Ignore return code */
>>>>>> +    vpci_ecam_mmio_read(sbdf, reg, len, data);
>>>>>=20
>>>>> ... the commented-upon ignoring of the return value, I don't think
>>>>> that's a good way to deal with things anymore. Instead I think
>>>>> *data should be written to ~0 upon failure, unless it is intended
>>>>> for vpci_ecam_mmio_read() to take care of that case (in which case
>>>>> I'm not sure I would see why it needs to return an error indicator
>>>>> in the first place).
>>>>=20
>>>> I am not sure in the first place why this is actually ignored and just
>>>> returning a -1 value.
>>>> If an access is not right, an exception should be generated to the
>>>> Guest instead.
>>>=20
>>> No. That's also not what happens on bare metal, at least not on x86.
>>> Faults cannot be raised for reasons outside of the CPU; such errors
>>> (if these are errors in the first place) need to be dealt with
>>> differently. Signaling an error on the PCI bus would be possible,
>>> but would leave open how that's actually to be dealt with. Instead
>>> bad reads return all ones, while bad writes simply get dropped.
>>=20
>> So that behaviour is kept here on x86 and I think as the function is
>> generic it is right for it to return an error here. It is up to the call=
er to
>> ignore it or not.
>> To make this more generic I could return 0 on success and -EACCESS,
>> the caller would then handle it as he wants.
>=20
> I think boolean is sufficient here, but I wouldn't object to errno-
> style return values. All I do object to is int when boolean is meant.

Boolean sounds right as there is only one error case.
I will use that.

>=20
>>>>>> +int vpci_ecam_mmio_write(pci_sbdf_t sbdf, unsigned int reg, unsigne=
d int len,
>>>>>> +                         unsigned long data)
>>>>>> +{
>>>>>> +    if ( !vpci_ecam_access_allowed(reg, len) ||
>>>>>> +         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
>>>>>> +        return 0;
>>>>>> +
>>>>>> +    vpci_write(sbdf, reg, min(4u, len), data);
>>>>>> +    if ( len =3D=3D 8 )
>>>>>> +        vpci_write(sbdf, reg + 4, 4, data >> 32);
>>>>>> +
>>>>>> +    return 1;
>>>>>> +}
>>>>>> +
>>>>>> +int vpci_ecam_mmio_read(pci_sbdf_t sbdf, unsigned int reg, unsigned=
 int len,
>>>>>> +                        unsigned long *data)
>>>>>> +{
>>>>>> +    if ( !vpci_ecam_access_allowed(reg, len) ||
>>>>>> +         (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
>>>>>> +        return 0;
>>>>>> +
>>>>>> +    /*
>>>>>> +     * According to the PCIe 3.1A specification:
>>>>>> +     *  - Configuration Reads and Writes must usually be DWORD or s=
maller
>>>>>> +     *    in size.
>>>>>> +     *  - Because Root Complex implementations are not required to =
support
>>>>>> +     *    accesses to a RCRB that cross DW boundaries [...] softwar=
e
>>>>>> +     *    should take care not to cause the generation of such acce=
sses
>>>>>> +     *    when accessing a RCRB unless the Root Complex will suppor=
t the
>>>>>> +     *    access.
>>>>>> +     *  Xen however supports 8byte accesses by splitting them into =
two
>>>>>> +     *  4byte accesses.
>>>>>> +     */
>>>>>> +    *data =3D vpci_read(sbdf, reg, min(4u, len));
>>>>>> +    if ( len =3D=3D 8 )
>>>>>> +        *data |=3D (uint64_t)vpci_read(sbdf, reg + 4, 4) << 32;
>>>>>> +
>>>>>> +    return 1;
>>>>>> +}
>>>>>=20
>>>>> Why do these two functions return int/0/1 instead of
>>>>> bool/false/true (assuming, as per above, that them returning non-
>>>>> void is warranted at all)?
>>>>=20
>>>> This is what the mmio handlers should return to say that an access
>>>> was ok or not so the function stick to this standard.
>>>=20
>>> Sticking to this would be okay if the functions here needed their
>>> address taken, such that they can be installed as hooks for a
>>> more general framework to invoke. The functions, however, only get
>>> called directly. Hence there's no reason to mirror what is in need
>>> of cleaning up elsewhere. I'm sure you're aware there we're in the
>>> (slow going) process of improving which types get used where.
>>> While the functions you refer to may not have undergone such
>>> cleanup yet, we generally expect new code to conform to the new
>>> model.
>>=20
>> I am ok to rename those to vpci_ecam_{read/write}.
>> Is it what you want ?
>=20
> Yes, that's what I've been asking for, and I just saw Roger requesting
> the same. (I'm a little puzzled about the context though, as you reply
> looks disconnected here.)

Oups sorry.
Anyway if we agree on naming scheme and bool return type I think all
your comments here are covered ?

Cheers
Bertrand

>=20
> Jan
>=20


