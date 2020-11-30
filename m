Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C48CB2C8287
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:48:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40989.74072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgii-0004ow-KC; Mon, 30 Nov 2020 10:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40989.74072; Mon, 30 Nov 2020 10:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgii-0004oX-Gc; Mon, 30 Nov 2020 10:47:48 +0000
Received: by outflank-mailman (input) for mailman id 40989;
 Mon, 30 Nov 2020 10:47:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DnPL=FE=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kjgih-0004oS-6P
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:47:47 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.43]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9dc8397d-96ac-4274-a20a-2bc66e29197b;
 Mon, 30 Nov 2020 10:47:46 +0000 (UTC)
Received: from DB6PR0202CA0028.eurprd02.prod.outlook.com (2603:10a6:4:a5::14)
 by AM0PR08MB5348.eurprd08.prod.outlook.com (2603:10a6:208:189::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 10:47:39 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::d0) by DB6PR0202CA0028.outlook.office365.com
 (2603:10a6:4:a5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Mon, 30 Nov 2020 10:47:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.26 via Frontend Transport; Mon, 30 Nov 2020 10:47:39 +0000
Received: ("Tessian outbound 797fb8e1da56:v71");
 Mon, 30 Nov 2020 10:47:37 +0000
Received: from 30d5ba9b9df3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C2A55A43-3411-40DF-A1FD-12754BEBB636.1; 
 Mon, 30 Nov 2020 10:47:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 30d5ba9b9df3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 30 Nov 2020 10:47:00 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR0801MB1910.eurprd08.prod.outlook.com (2603:10a6:4:75::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 10:46:58 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3611.031; Mon, 30 Nov 2020
 10:46:58 +0000
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
X-Inumbo-ID: 9dc8397d-96ac-4274-a20a-2bc66e29197b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSNwJasFQ4DpZY37jelQq8pyGhAA8IgOys8LHIxMnbE=;
 b=2LtKzaM0qB3G52vzdYhPPW3khUVtcI5utigpcNX/Brts81u/Sa/tDU2lMDbI0f5LY/q95TlU98TeQdCOVJ05jXBbJzxIMjL4eHQVZwP7rf+MefLNrjxq3H7m5KyqhDQunlQtTjjDzOZ3p84DXqnuI/CsmT/YQN7Tdglng8Bx7Qk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2db7d77e50cf6b71
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Go0kvSpmKyqTIK8UoFyLrCVX+4A/JbskwlLQJbdxornN49nOgDuJNE6G/u0PyAGA2DMQZAt9QTlwDrzFXfelMbVf4IL1sURj41DQa7/7Db7mUKsS0TYxMvVYwSSqFI+HxO7B9FDqX5HMAsSVzCytCDpGBxaRFj/z7tIOnKYbxecUV0II+nCKt6j0NKyb09t0LWuj4M7enwg7kxgcKaEASAHIpwVFFmWxPRBwbavljnw09AbXXg6SHGdr3fB6TAKL3Y+bpynhaSCzlXUUoJJoccF6J3h2Fnc+UXTtgE/jJWS6R7ZTnq4r8ypSnTwtUoC/6/nyuxkbmRIcMD33tKz0Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSNwJasFQ4DpZY37jelQq8pyGhAA8IgOys8LHIxMnbE=;
 b=MpCeBsKxb/1iJjIvYG+Yyz140e63w52UDUnuByEEkb0JhM2X6FN1WvG649h8z8z2nfdKspULFenXTS3HrVQyArWkatRw3vrp8tMotjZ2TsYBK3XyVwL1Lw7GrPO2JHexPeyVHBVIqk5FeYuZS2W8tJjwuHfM1TtpNVCdmXTR667kkor3XNj4xiwKy6J95eS0Nz17cjw7Ka2rou0Qj044kEj9iMoP1tOq70M4XW+1o/nVvt2Mnrkq72vDqOeGTmyNQiaOwec/kOqNYp9GmaQd3EDZnZfLxnB9+UbyXmxJonpgpMaDfOZARTRI8HSx6znP8RKUS80EUlWzTtMMRec4Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSNwJasFQ4DpZY37jelQq8pyGhAA8IgOys8LHIxMnbE=;
 b=2LtKzaM0qB3G52vzdYhPPW3khUVtcI5utigpcNX/Brts81u/Sa/tDU2lMDbI0f5LY/q95TlU98TeQdCOVJ05jXBbJzxIMjL4eHQVZwP7rf+MefLNrjxq3H7m5KyqhDQunlQtTjjDzOZ3p84DXqnuI/CsmT/YQN7Tdglng8Bx7Qk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 0/7] xen/arm: Emulate ID registers
Thread-Topic: [PATCH 0/7] xen/arm: Emulate ID registers
Thread-Index: AQHWxPkEic+Kxyhsf02jxIedQiFc2qngevuAgAAEQwCAAAMPgA==
Date: Mon, 30 Nov 2020 10:46:58 +0000
Message-ID: <86D0C252-F970-43F1-A876-58D8F63CFD55@arm.com>
References: <cover.1606151462.git.bertrand.marquis@arm.com>
 <45b8aac3-75a6-670f-d6f2-b427c497ee2d@citrix.com>
 <1BAAADF6-9E29-4BE5-857D-A8B51EB80712@arm.com>
 <e119d6ff-dc61-0fd7-6da5-3e4e1b51839c@citrix.com>
In-Reply-To: <e119d6ff-dc61-0fd7-6da5-3e4e1b51839c@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 40c74519-f949-40b5-a78f-08d8951d5b83
x-ms-traffictypediagnostic: DB6PR0801MB1910:|AM0PR08MB5348:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB5348EC46CCD7E851F585B7099DF50@AM0PR08MB5348.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 R/e3vW5ef1Hf4jHwdWz/v9XLClhm6g6lLlrIYLcJnVaMRQloWF/imBQHQdLt5ifBrEhmuU7LRSW0XE6Sx0u7DwxTGNkNTOTS3nQ1fbBLRT28Tza7gLKqDhDRwDlqkBXIIckrVblrc4RzGJXEKbeQwYPoUVmpwcnIPxnYHjb5bQf+KJb17n3nKX14g7aJyKQTQhRRj8KpArHD2SwVhfqxAKQC20LLdpv45h2GIiLZxrUd3IdUmjNvH7zODcDLRjNYwd7enjWY9P3wDcHA8KTIFwZ2PNPMPJQdm9Vr5byBUE+J4cWUIChLWRAe/wEEo0pcBWgHS7flfVxN52qGhlm9g5y4OEvWQUJzY1qKISDF7JFIEzSC9lkw0UvozBOGNCLMPJD4lSPvqKQtxz6DDhjW2g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(5660300002)(26005)(6512007)(66946007)(478600001)(6506007)(6916009)(36756003)(53546011)(186003)(33656002)(2616005)(8936002)(66476007)(8676002)(83380400001)(4326008)(6486002)(64756008)(2906002)(76116006)(54906003)(91956017)(86362001)(66556008)(71200400001)(316002)(966005)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?+r/LSJToeBvPwgsKwkkvTt820EQYFgalzMpaUKr3qR39sz9MUybzMTi2fpbR?=
 =?us-ascii?Q?OqJy8O1GJObw/1qaQ4mdZo5X5PDoLMp8G8Ys/sW2/byZsuvTTM387Z8/XAds?=
 =?us-ascii?Q?eHsFL66wrAgQgTKhwQzfLH02czE10US5dAAl/E6OJ/9eZ9ulZZYxQY2YZYZW?=
 =?us-ascii?Q?Z94JF8pR6OI5KO29A01myNG0kfF2PaBR/hexfd7uGxDLQ06OiCuP5/EVRWoD?=
 =?us-ascii?Q?HkiNPX0xjrJBxveD2Gya64QcsGSfDSwNg/7u856yRbf9MFsUQVkgLu+2ydGN?=
 =?us-ascii?Q?62T76SivoMjBTLxurotVoJsM1ozzxkXMkRAFNiVfNDeL6NLaaK5FEcvsdJh0?=
 =?us-ascii?Q?1gYo6Grt9/MyOCspQ5kea+25N9wK2tSL1Xh0tXJj47JKz9njoD2oNJ/we9Bg?=
 =?us-ascii?Q?1VywlITPTEAu3mSUS6r01UjzO/VtvOEJQ2hj22zfKi7uGK2JNtVElbsOwo3/?=
 =?us-ascii?Q?i/CnN15rLXx3Y6bdRQP5VVeJy7dubxE8ci/XPd4tKbc+Tyr9t+zmrJgk67IT?=
 =?us-ascii?Q?OtQxfbLrNgo3RGCPo33aM39Q93Om+pMtLPaO3Ggl/IgGDdTe+dM7DPrwhFOh?=
 =?us-ascii?Q?7RzHMKOJ4ZjkFUXQeQVOv8AdgQ1ifKtrEL8jDkjVREblYNcXUxYZobs1IWke?=
 =?us-ascii?Q?uVfCXTc1yrRu9jivjbV8lxSJ7mhnZAnJXZwM0VMYI+M+HplKhSwRYSMRpHgq?=
 =?us-ascii?Q?hxn7w/mvm+V9fmJjBpZENWOPmDWRblkE7iQPdLAO2krWM8nklcFBv0omYKof?=
 =?us-ascii?Q?4tGMS0sq400bfXqTiLVvxrwmLU1t0J5cNHglE8b/oskjQVl3+hPMi1H6TYsf?=
 =?us-ascii?Q?WtWb9+sAVSVv5lb0GXrXgDPX7pfSkkn+tfniOczETzbWODdNsEd2TKVIIqXa?=
 =?us-ascii?Q?AS4H2GDPNfvF4upnSPYuwLqn0aVVtcYFVt2DeJ+gH6hiro2jtkz/MJcSH7Cb?=
 =?us-ascii?Q?Yr0arNv3ry/pbZsUd5KP5YRDnGxtDKBbWCBz5YfOfZyOsJu6j9KOot9M27e+?=
 =?us-ascii?Q?upz4?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FEFF8A26EFA2664981E3F58F4B1F457A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1910
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3b0c773b-6f3e-4c68-9008-08d8951d431c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dCCDtP++F+ztWrx+F+6Xr8s5hLwzUqW0ykkdlr0vuCxyBMYwCe3MYCZpB0CbnEpt5g592pMRNVzgTDfrq4PvhQnxRfUn6IdVtukcQ0lyd+TWu1ng5mE7dh5RBh5wmhNAYBmN9Ho9bn+lUuuLE73YIayBXbJhlkW4wpgE5DTPmwRNzn7q37PYWcJtgBo0ZcTU7leVfxeSIQp+gbAZdt1rObn9WjvrP3RqScnkCxavarpzjDOelV5XCWQmz6XDUt151USRS2MJ7QeuAvmen8AHOGpXnkhYAhHkChNUGDcaJGSI26UddffconG/ga3qpJPKjbhy7KCUITt8BJk5VwBpSfO5+nZafRrwyMV7F9AVpiAEEO6YJxrkumCtPmoCQsorGUpG8cBULQwkRp62Q0+6MQ+JjwsPlCwqZpTnj+UtpsMRYABMsHge0uuC8+gqbvcuGHwA21bK7TVxv+H6XuOG4SZJvUnHTtGL8xLCfxVzF+U=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(46966005)(70586007)(36756003)(86362001)(8936002)(8676002)(70206006)(53546011)(6486002)(4326008)(5660300002)(83380400001)(81166007)(82740400003)(82310400003)(356005)(47076004)(54906003)(33656002)(2906002)(186003)(26005)(6512007)(2616005)(6506007)(316002)(966005)(6862004)(478600001)(107886003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 10:47:39.4790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c74519-f949-40b5-a78f-08d8951d5b83
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5348

Hi Andrew,

> On 30 Nov 2020, at 10:36, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> On 30/11/2020 10:20, Bertrand Marquis wrote:
>> Hi Andrew,
>>=20
>>> On 27 Nov 2020, at 20:07, Andrew Cooper <andrew.cooper3@citrix.com> wro=
te:
>>>=20
>>> On 26/11/2020 15:51, Bertrand Marquis wrote:
>>>> The goal of this serie is to emulate coprocessor ID registers so that
>>>> Xen only publish to guest features that are supported by Xen and can
>>>> actually be used by guests.
>>>> One practical example where this is required are SVE support which is
>>>> forbidden by Xen as it is not supported, but if Linux is compiled with
>>>> it, it will crash on boot. An other one is AMU which is also forbidden
>>>> by Xen but one Linux compiled with it would crash if the platform
>>>> supports it.
>>>>=20
>>>> To be able to emulate the coprocessor registers defining what features
>>>> are supported by the hardware, the TID3 bit of HCR must be disabled an=
d
>>>> Xen must emulated the values of those registers when an exception is
>>>> catched when a guest is accessing it.
>>>>=20
>>>> This serie is first creating a guest cpuinfo structure which will
>>>> contain the values that we want to publish to the guests and then
>>>> provides the proper emulationg for those registers when Xen is getting
>>>> an exception due to an access to any of those registers.
>>>>=20
>>>> This is a first simple implementation to solve the problem and the way
>>>> to define the values that we provide to guests and which features are
>>>> disabled will be in a future patchset enhance so that we could decide
>>>> per guest what can be used or not and depending on this deduce the bit=
s
>>>> to activate in HCR and the values that we must publish on ID registers=
.
>>>>=20
>>>> Bertrand Marquis (7):
>>>> xen/arm: Add ID registers and complete cpufinfo
>>>> xen/arm: Add arm64 ID registers definitions
>>>> xen/arm: create a cpuinfo structure for guest
>>>> xen/arm: Add handler for ID registers on arm64
>>>> xen/arm: Add handler for cp15 ID registers
>>>> xen/arm: Add CP10 exception support to handle VMFR
>>>> xen/arm: Activate TID3 in HCR_EL2
>>> CI found an ARM randconfig failure against this series.
>>>=20
>>> https://gitlab.com/xen-project/patchew/xen/-/pipelines/221798884
>>>=20
>>> I have admit that I can't spot an obvious connection so it might be
>>> collateral damage from elsewhere, but does need looking at irrespective=
.
>> This absolutely right, there is a bug in my code and i will send a V2 to=
 fix it.
>>=20
>> Very nice finding, i am wondering why my tests did not point this out.
>=20
> Its randconfig, so every time the test runs, it picks a new random
> Kconfig configuration.

This could be consider as a fuzzer testing and can be very usefull.

>=20
> Sadly, it is non-deterministic, and not necessarily the fault of change
> the test ran against.  We're probably going to have to tweak how we run
> these tests before the CI goes too much further.

Agree but in this case the error would have been triggered for any Arm
configuration with the right compiler flags.

Regards
Bertrand


