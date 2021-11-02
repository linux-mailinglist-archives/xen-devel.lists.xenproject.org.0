Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C434429A8
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 09:39:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219779.380769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhpJs-000704-OD; Tue, 02 Nov 2021 08:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219779.380769; Tue, 02 Nov 2021 08:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhpJs-0006xJ-Ka; Tue, 02 Nov 2021 08:39:00 +0000
Received: by outflank-mailman (input) for mailman id 219779;
 Tue, 02 Nov 2021 08:38:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=67fr=PV=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mhpJr-0006xD-94
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 08:38:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.65]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfa62cae-3bc5-4a45-841c-a261581e1636;
 Tue, 02 Nov 2021 08:38:57 +0000 (UTC)
Received: from AM6P195CA0007.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::20)
 by AM6PR08MB4248.eurprd08.prod.outlook.com (2603:10a6:20b:b5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 08:38:48 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::7d) by AM6P195CA0007.outlook.office365.com
 (2603:10a6:209:81::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17 via Frontend
 Transport; Tue, 2 Nov 2021 08:38:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Tue, 2 Nov 2021 08:38:47 +0000
Received: ("Tessian outbound d49ee2bec50d:v108");
 Tue, 02 Nov 2021 08:38:47 +0000
Received: from 9cdf22280a13.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DF34D637-1330-4F3F-B5DD-9018483C4FEC.1; 
 Tue, 02 Nov 2021 08:38:41 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9cdf22280a13.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 02 Nov 2021 08:38:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM5PR0801MB1697.eurprd08.prod.outlook.com (2603:10a6:203:39::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 08:38:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 08:38:38 +0000
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
X-Inumbo-ID: bfa62cae-3bc5-4a45-841c-a261581e1636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isW9+9ZxDZibsxmW7vgPBrV1AfwLdCpm2hqLIMFXPDA=;
 b=AvHG9dF+hg6tIE7p2a29oraY3t/11m9pzSBHxOXfW7Z+xKmAc/cnHb8KEKrOTBvvt4nhDMj/xv6nD/Ay719x5266PL6ZIP2FAO+rssmOZ5PTH3kxKaowXw6fAE2P3iFnio6K/JzGjjy30pBayquFuQ7RX4k/8cSjpwwS8mwIoac=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fb23ea8d496429ea
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNDlwZ8sxnet+ikU3eX45CmFcCqMteFq7iC685ssYfNtPMQFcoBht7v3gevlXax83bEoAqw6++xUTozCODVfDEAqWMyhiQIJQCpu3z+YmF6NKl0kUYJAsCj7ziFVNNWuUPeq/hoBx/rg6ScbZY+rrzVz0zbKtf5asWFK7tqHzmDD+mEmnRhHA1jkagQNwQbljiuVkeEumVqt4wtLRlUzQu+7qKJiGE8m86MNNDTFrsUgp8JeU8QnJzNa6+achQVP8JPhyqwU1Nzjr8h/bovTz842Sc6W0q42YzhB19VxlgSo9VowKr/WwAgRSmFbDvxdatKjuIZy9UbpK7pt1HW3Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isW9+9ZxDZibsxmW7vgPBrV1AfwLdCpm2hqLIMFXPDA=;
 b=CAoO+GHjX77iEX0+IGYKv2yFmbHPm4uLvfGLz33uvJeKCJr4sK7BJkM3Vsb9Wkee6tJZonhK/b9Uic5Q+rfAdefSu3ZQ5WU/wvxQXI2ULFVCF/Ha3mWPosylJKy+auPZUnV8GuzTHztwWHqo9SfN1VzZrRxUHcxg5n/OgF/0pmZneq1ADPVD3SLTl0QHOoB7+csnSdgMit7W5fg5XSfFl8t6jSt3l2Tbj3ciPZ8tJtijvlmTelyI2XnrZ35ZagFGmpkTJYyPPccL26sOViBsAK2FyDOl6mNt+IYk7Ddo5YFOvbsYaXr3bcc35GLXQ61bQCsgeDKRZfq8Ocgs1Y8UJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isW9+9ZxDZibsxmW7vgPBrV1AfwLdCpm2hqLIMFXPDA=;
 b=AvHG9dF+hg6tIE7p2a29oraY3t/11m9pzSBHxOXfW7Z+xKmAc/cnHb8KEKrOTBvvt4nhDMj/xv6nD/Ay719x5266PL6ZIP2FAO+rssmOZ5PTH3kxKaowXw6fAE2P3iFnio6K/JzGjjy30pBayquFuQ7RX4k/8cSjpwwS8mwIoac=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Alistair Francis <alistair23@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jane
 Malalane <jane.malalane@citrix.com>, Bobby Eshleman
	<bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: Arch-neutral name for hardware interrupt support
Thread-Topic: Arch-neutral name for hardware interrupt support
Thread-Index: AQHXzw4CySYNKRokyE67QZNrnOsNdavvITCAgACzv4CAABcDgA==
Date: Tue, 2 Nov 2021 08:38:38 +0000
Message-ID: <75499D79-0A71-4A37-B8F3-2826CEA2D47B@arm.com>
References: <b34c957f-8439-709c-d8be-cc2f5111c342@citrix.com>
 <alpine.DEB.2.21.2111011330310.20134@sstabellini-ThinkPad-T480s>
 <CAKmqyKOJgYbb_pgd8CPH90yPVcEHBU9J65URw7CUA_unyw6gBw@mail.gmail.com>
In-Reply-To:
 <CAKmqyKOJgYbb_pgd8CPH90yPVcEHBU9J65URw7CUA_unyw6gBw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c9f1589a-0cbf-46d2-1b0b-08d99ddc3076
x-ms-traffictypediagnostic: AM5PR0801MB1697:|AM6PR08MB4248:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4248A87B4C17A3E146C6C6CC9D8B9@AM6PR08MB4248.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LouphzTgHGxSMYIMSIybyRx2WIP97Gy/6lKkpnyE2G4tTTRwqGfw3DlU/R3ysMWxk8GJYsC2Cf6IxSGiK0molrpHgAsiVtWf2FFMswcUhfUV2HE11yH3Zqj0ABQeqReuHABxFRpqd0mP5W7hn+8Hmltma0mRvP3OBBCMWgdUUNglvTyySUZ22FNGo6hj7g82abtxZhXde5ZAvbpPytmyOvQCQ59/ER0JxuGc2M792Jx4hD0IQThnIdeM5tQ0ydH8rVIXHAbgqjz97Qa20yUN++4TxwzWTLKbcwPpiUn+ph7jGX9Cq8gnmnujO1DyrLuooaJKqopXfQHAjW25NQvnjkTR104y3ISBQhYxiCbuiso6FD9KpnOeIa0+YEReMZfMe35AqKuYJNKVtO4Ar6ZC9gt0YSrOyzKOjh7n+aVYyI+lI4JLVQNb1zE0YFRRknD9W3HzKl8PDdlNmqEBs7WcOboTKgdodrw8+2eKr97+zXodeOktEwaJoC7OU4EdYfhgLi8bDhOt0+IrUZKYMU5grk899oG++g9b4xDH5NAqSetwl+RcHKhIJGqtb+no1ONAsuhrBjPviRL6lDcvexqK53OPcH6KiDVjQwmwgK+PsQJk1Z7Zmpl3ddomhtbI0j385LOJF5dXcXBNMCLNxAqp9SzcvxlggDgsOzcibLOUYE7b/DjNWSZKbdlQztBXD+/UxTW4gXgYbQLanfyanmODSx/u+Mzo8DHZ06EFg0kQYHTmgQt5xjdo31ngRwcKR97Y02epSCZAVObnVEfmUI1bDfXLQnOjajHgE/GbRc9gTd7kxf06sdUoifWRqQbIvF5x6vFjh25nRQGGqo0rj1IpTw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(38070700005)(966005)(8676002)(4326008)(6486002)(38100700002)(122000001)(6506007)(66476007)(66556008)(64756008)(66946007)(6512007)(508600001)(66446008)(53546011)(71200400001)(91956017)(7416002)(54906003)(186003)(86362001)(33656002)(2906002)(8936002)(76116006)(6916009)(26005)(36756003)(83380400001)(5660300002)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1B13C68C71F1294EA0ED79C60CD56420@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1697
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	32c502c1-c0fa-4cdc-d154-08d99ddc2aeb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GRmwZgPYb++hoOaYb9KZRZZNPzzotyhSgTCkemtrSvLDhOhBzCSoZyE9wVsdpcmCOAW4TnLz5vqGWntxDcu3JVjtPt40pv0ZYdhNP8Tt1X7/olEd8FcF7N1QVOi8JBkLlKdfXj3xnkiBYhqLRPthQaoV8g8hR/HdgrViQO9YfclwkHobdcjHRhfQzV/1pT7vDEvD0bJQ/0ijl1/HlJkVFehYzpBX+HWgZn7s0geRLSq9PVm/wl4udLx8icrweE6x7dnI55oSDjSHld78/e6BhIIvs5KfbJCFFduRIuL8zWpr0Pz4T5H2tF7ullEoDOlGRzGDrGxZ23bhdmdEijEdtICwUu2qliAOXjlVSGYSHvGoLJO2tCFMbVqsgb0oMo0x+T4LYfE2m6ntNDWUF2RvX7Q3lgXaRQ84sTV4xqLVW4Nds36ehZRZm8Cj5ScdPC2OFnOf8QQiq4epWy/YIQmB6E9kQs0ypb2g+wFh1gHfAgzniXagfSwNIiKmZ5EXpjiHuP4PUFzPHuiyJq4MKSsIR+BuPnZOb+LmsjZgtzrB3WY4l5vaiaKW4bqn0ogfna51a73dXoiwDW4vW6OPTwULz4CpfP3BGqY5lDW0CxjURYqCwqbJ1O/Qe7CJWZM2LSIwmdnIrkQuusqisgOfuKmR1HgzDiWb7st7T/TuQ008X5v9LBq6shXX5zxO9b/oteIBHMUJJ7gUZG9KJy7PgcovwsvgcHoWPVTcR6g0P6HoFUyD2aEHAiakV0JL1wvjpUp9dbF4DiuqxTvhKCDdma33Hjy5QOdCX6NGJoCzHT/BGZw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(26005)(356005)(316002)(81166007)(8676002)(53546011)(83380400001)(36860700001)(6862004)(54906003)(6506007)(8936002)(336012)(508600001)(4326008)(86362001)(2616005)(2906002)(966005)(6512007)(5660300002)(6486002)(47076005)(36756003)(82310400003)(107886003)(186003)(33656002)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 08:38:47.9988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f1589a-0cbf-46d2-1b0b-08d99ddc3076
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4248

Hi,

> On 2 Nov 2021, at 07:16, Alistair Francis <alistair23@gmail.com> wrote:
>=20
> On Tue, Nov 2, 2021 at 6:33 AM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
>>=20
>> +Bertrand
>>=20
>> On Mon, 1 Nov 2021, Andrew Cooper wrote:
>>> Hello,
>>>=20
>>> On ARM, the GIC is a hard prerequisite for VMs.
>>>=20
>>> I can't remember what the state of RISCV is, but IIRC there is still
>>> some debate over how interrupts are expected to work under virt.
>=20
> We are getting there, the current draft is pretty stable:
> https://github.com/riscv/riscv-aia/
>=20
>>>=20
>>> On x86, the story is very different.  PV have no hardware assistance,
>>> while HVM hardware assistance depends on hardware support.  Therefore w=
e
>>> want to introduce a new CDF flag so we can control the setting per
>>> domain, rather than globally as it is done now.
>>>=20
>>> This brings us to the question of what a suitable architecture name
>>> would be.
>>>=20
>>> Hardware Virtual Interrupts is a little too close to Hardware Virtual
>>> (Machine) Introspection, and Hardware Assisted Interrupts (mirroring
>>> HAP) doesn't seem great either.
>>>=20
>>> Thoughts / ideas / suggestions?
>>=20
>> Maybe "hardware-enabled virtualized interrupts"
>=20
> hardware-supported virtualised interrupts (HSV Interrupts)

Both propositions are ok I think but I have a preference for supported.

Cheers
Bertrand

>=20
> Alistair


