Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 982824D4431
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 11:05:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288251.488834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSFfF-0000Qm-JI; Thu, 10 Mar 2022 10:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288251.488834; Thu, 10 Mar 2022 10:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSFfF-0000Ov-FP; Thu, 10 Mar 2022 10:04:57 +0000
Received: by outflank-mailman (input) for mailman id 288251;
 Thu, 10 Mar 2022 10:04:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGlF=TV=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nSFfE-0000Og-2P
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 10:04:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7d00::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 886d63bf-a059-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 11:04:54 +0100 (CET)
Received: from AS8PR04CA0001.eurprd04.prod.outlook.com (2603:10a6:20b:310::6)
 by PA4PR08MB6317.eurprd08.prod.outlook.com (2603:10a6:102:ec::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 10:04:53 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::cc) by AS8PR04CA0001.outlook.office365.com
 (2603:10a6:20b:310::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.20 via Frontend
 Transport; Thu, 10 Mar 2022 10:04:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Thu, 10 Mar 2022 10:04:52 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Thu, 10 Mar 2022 10:04:51 +0000
Received: from 9fe71f417a22.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E8CAD38B-296B-45B2-900A-C944A3B95753.1; 
 Thu, 10 Mar 2022 10:04:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9fe71f417a22.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Mar 2022 10:04:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR0801MB1919.eurprd08.prod.outlook.com (2603:10a6:800:89::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 10 Mar
 2022 10:04:43 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 10:04:43 +0000
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
X-Inumbo-ID: 886d63bf-a059-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6DzGyR11dOFSZlHzPim5lUvFzM6gBvimFyirj35pXQ=;
 b=WLDR+FLVuf0h2wbekbMAIsbeD0I/AGItqjPLyhOUAdqxduhSsYqBAnHHP8ct3DcmMDyWi614eI9CnXwI5M67ivOR10RX7KWcwetp4tRwEJIZrKyD3hWFr0BoTUqxGJcNdGM/Boif8jUjhigU9om1XxqOMGADoH6AEa7uIRHOvoY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 97bfdac981c90aab
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbCAfSyO6HSXoIiHGWWHQRzS/JuW9mJlb5gmIlEXJ1zko5Y4ufWJ1w3TMkxrgaiSBoOfmCiGanZG+i0zkXGEWD5Py/WtcKB8dSRwlQHimrWRWddyVHf9wstX6G8a+DMtS23/lA/LV72e/8oKOsCeMfexxME5mCtO5jhF8mkmrjR6Gm8AM3zB7cBI9NuaaQriAVuFyKszINSBSwAyKPRV8oHBe6rAJ43MchSmaeu0Z552zH3drVnW493cxigXXZAHgm7FKQRzgeg5FSfvm8fKV170zGPjgOnGfp3ORChzuLSpbI/Hn4vNWE6ppLEAgDufWQk0kNhZrJu5tdimARz5Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6DzGyR11dOFSZlHzPim5lUvFzM6gBvimFyirj35pXQ=;
 b=YwnFTQDyQ+BTaVbVCxE5y10hoBRgG2PPuwpZhD0r4SCQVDNQZbkQ7mr7TY2iyuh6+GLTIACrhu0kKRv75elMXnk3ckeBZiHzhPBTLGSFF86XmpN8YPQrGfQODdAgT6voXeeqkEKaLbM+Db9ALwNszlXAKweitCYzMianrQqopQIai+AYS+98AMq0kTzOnzmdOZyiZQy5CGm6VnRaDI1aZ1WLtCR9Tcg6eluD3m0Is0oEnB7alf1MPTzfJ+dOsNfpqPBBQEA21mFtfFKW7+24rZtA6fsfT0G4bBRxRC3/ltBJEwHEiWzFzIlpCr8wH7zwMdBF47AhfBKB+gQd8eWDFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6DzGyR11dOFSZlHzPim5lUvFzM6gBvimFyirj35pXQ=;
 b=WLDR+FLVuf0h2wbekbMAIsbeD0I/AGItqjPLyhOUAdqxduhSsYqBAnHHP8ct3DcmMDyWi614eI9CnXwI5M67ivOR10RX7KWcwetp4tRwEJIZrKyD3hWFr0BoTUqxGJcNdGM/Boif8jUjhigU9om1XxqOMGADoH6AEa7uIRHOvoY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony
 Perard <anthony.perard@citrix.com>
Subject: Re: preparations for 4.16.1
Thread-Topic: preparations for 4.16.1
Thread-Index: AQHYNF0EFrPPp9sw2ESIVxGhRdwIe6y4UusAgAAQQACAAAChgA==
Date: Thu, 10 Mar 2022 10:04:43 +0000
Message-ID: <8A26AAE3-3C61-49E1-B745-D7C5A7712E2D@arm.com>
References: <b9be95eb-7a6e-9f1b-6b68-6d08d6329cd1@suse.com>
 <4fe170af-9120-0203-bed9-895380a2ff0a@xen.org>
 <4DE5BBE4-F228-4584-81AD-D0A41858FDB9@arm.com>
In-Reply-To: <4DE5BBE4-F228-4584-81AD-D0A41858FDB9@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 901d53b2-097a-44f9-6cc4-08da027d6b68
x-ms-traffictypediagnostic:
	VI1PR0801MB1919:EE_|VE1EUR03FT057:EE_|PA4PR08MB6317:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB63177866FEA934E39AE64E739D0B9@PA4PR08MB6317.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wrD4OSq0Mnpi9gn9hNI0FqvU4DRiwa3r7ENKZRwXSnhOFF9Eni/HIzVlktY8jvgScWALN7keo3wZKjRdhf+x9SaJX/qcBQAPtHdM/coDVenKXG98T7rBvt0hmlk7NlYqIZINCMAImEE8gn9q/7N8JkBazC4xG61wTeaZIkxwUgK5oKpg3nLwbW9clBBxnrRGpJ8fYM9wTTEEyX8z3CZOqGnX3Vo/gv461PRoAsfJl9irp4hNm5FcO00Dl4sWJUYBR6sKx56zsQ/SFjfmjOu48NCCY494+pwWmJCeGXa8xZu2UEjp15dkXfVAqyKgp9/EFEtdi1KgYehdXg82LS7K0d6mKIqtpf+T1qBOVgbVzZZBsbTm3E+0HdARV+VJG4janhrz7qJqpeXgnVlCvIA8IAjdS0oDRDzY3kO/OvVu1csLTunGlH6Ly7p3PJOGwq+mVmcnG4+ag0pT5yNEDbyMs8h0DyPLMcIsJ+skKKHNs111/1FIUCZ/OB3n3hYGzAr9zvlFWMufww2awTtKoA7qWyFqxajk47iHidXsOKgVmysH68IQqgzMToOWoNrr+KrC2pEpye4WSUnmJdMpo1wqG+MmlKRJms5yU/wOITnRXN8tkPAOEL0xVC73KhLVvpwtmK2pXaaCFDwDtSvJKE/1pANqiiMvXrgRFu7xQkv7TZ74uh8Hkyz46U38NdI4mo/RvOW1dYHFdLrljhJ8rU9RQgzIm8UgaxXMA/kl35aAm4FbwhaondsMSmc4MmRfnYcp
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(186003)(122000001)(2616005)(36756003)(53546011)(4326008)(8936002)(6512007)(6916009)(8676002)(86362001)(66476007)(38100700002)(66556008)(66946007)(26005)(66446008)(316002)(64756008)(7116003)(76116006)(33656002)(5660300002)(54906003)(83380400001)(508600001)(91956017)(71200400001)(38070700005)(2906002)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9A6F7FE55AA5BA4EADD1370371711876@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1919
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	19d188d4-02b9-4fa3-7ad0-08da027d6668
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ky6LMlLIqbMtH5NeDeW3LkaYGl5GqiaXPEoQEARWBOr0FWrqzn08GWZEQWCl8Zddc/pZokak/tFR/Uop4bGNdpWxSiWmY37BKwkZ2PkStb6W8Hc2iYhGM5ncL1zkABP2ZScztfNUmkFPvSSAkfPuY1xdeOzp+eEBxpTVvTs3SH0ADr4m44NnoBWeEz0dAkm9kiURl37pxKLO8iwDu/JKh9kCAzEcO1lEc8JQFk2aN0wBnhE4/Tvtqn8HvQQepKoPTTvVbISQTDxH//9Xo2nHs1+I8jZbG5QIH2PWTgXql6YCZ45KKjIQzLJ1uLBW9b++mAdAnf96Ers9uBaNlqj65hJ9wOCFmAHR7L2O9UIAEfrxHYbBOtCi4TLUlc0hpgM53PYRq35S6eQX1gO4bjpOk60BY6mm3nCQ9CjXs3BD0WxmLEq1UYKMulzV+qfhv7p0HgNNiaUELgbi28jMNt5sHUxYdYwA67VFKEPrJRc/H/Iap66UFSOumkc4GR3/9g7aml2cyJ2jabc+c7YurIx4UYljNQLYKcB44h3Ux5cbFeN6fryYn8q1Db6pCQG5WoGzpCEU3XT3FNzW6Fxe4MAXarVdqabK/bh2Ch7OP8iWjRInTd3hRXfpwNyzk5Aa6p3xopLfyiZXP3Q6/mGHKNmHdHSJPswBBeW9KMD37MYPFH2uPoiYB4kT1336wOEr3ip2
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(54906003)(33656002)(70586007)(8936002)(47076005)(36756003)(316002)(6486002)(356005)(81166007)(36860700001)(86362001)(2616005)(6862004)(6512007)(70206006)(4326008)(8676002)(186003)(5660300002)(26005)(82310400004)(53546011)(336012)(83380400001)(107886003)(2906002)(508600001)(40460700003)(7116003)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 10:04:52.1426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 901d53b2-097a-44f9-6cc4-08da027d6b68
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6317



> On 10 Mar 2022, at 10:02, Bertrand Marquis <Bertrand.Marquis@arm.com> wro=
te:
>=20
> Hi,
>=20
>=20
>> On 10 Mar 2022, at 09:04, Julien Grall <julien@xen.org> wrote:
>>=20
>> On 10/03/2022 08:57, Jan Beulich wrote:
>>> All,
>>=20
>> Hi,
>>=20
>>> the release is due in a few weeks time.
>>> Please point out backports you find missing from the respective staging
>>> branch, but which you consider relevant. One I have queued already, but
>>> which I'd like to put in only once the pending fix to it ("x86: avoid
>>> SORT_BY_INIT_PRIORITY with old GNU ld") has also landed in staging, is
>>> 4b7fd8153ddf x86: fold sections in final binaries
>>=20
>> For arm, I would like to propose backporting:
>>=20
>> 32365f3476: xen/arm64: Zero the top 32 bits of gp registers on entry...
>>=20
>=20
> Agree (not changing the fact that Stefano should confirm)
>=20
> I would like the following one to also be considered:
> f3999bc: arm/efi: Handle Xen bootargs from both xen.cfg and DT
> f1f38e2: xen/arm: increase memory banks number define value
>=20
> And maybe this doc fix:
> 620ed2c: docs/efi: Fix wrong compatible in dts example

Sorry please ignore this one, already in :-)

>=20
> Stefano and Julien could tell what you think ?
>=20
> Cheers
> Bertrand
>=20
>> Stefano, what do you think?
>>=20
>> Cheers,
>>=20
>> --=20
>> Julien Grall


