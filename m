Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FDA42A931
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 18:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207526.363396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maKRU-0003k0-AL; Tue, 12 Oct 2021 16:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207526.363396; Tue, 12 Oct 2021 16:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maKRU-0003hn-7O; Tue, 12 Oct 2021 16:15:52 +0000
Received: by outflank-mailman (input) for mailman id 207526;
 Tue, 12 Oct 2021 16:15:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B8jq=PA=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1maKRT-0003hd-Ct
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 16:15:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.50]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1142dbf2-559d-4f62-85e1-e4212b4a52a7;
 Tue, 12 Oct 2021 16:15:49 +0000 (UTC)
Received: from AS9PR06CA0255.eurprd06.prod.outlook.com (2603:10a6:20b:45f::26)
 by DB6PR0801MB2054.eurprd08.prod.outlook.com (2603:10a6:4:77::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Tue, 12 Oct
 2021 16:15:47 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::17) by AS9PR06CA0255.outlook.office365.com
 (2603:10a6:20b:45f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24 via Frontend
 Transport; Tue, 12 Oct 2021 16:15:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 16:15:47 +0000
Received: ("Tessian outbound e27daf245730:v103");
 Tue, 12 Oct 2021 16:15:46 +0000
Received: from 01af4a8568e5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AAF51EB1-C566-40B2-9C9F-2A3741435DCB.1; 
 Tue, 12 Oct 2021 16:15:25 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 01af4a8568e5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Oct 2021 16:15:25 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB7PR08MB3771.eurprd08.prod.outlook.com (2603:10a6:10:32::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Tue, 12 Oct
 2021 16:15:20 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 16:15:20 +0000
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
X-Inumbo-ID: 1142dbf2-559d-4f62-85e1-e4212b4a52a7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYDm+x1uHHoe95VdJZCKrnBh2rXyUDEoWYPYidSuYM8=;
 b=SWIcgcZQlskBml3SWfjYwOKiLoRv1IZPtigme25sOToLH748WPEUMGTI3MQHg8gOknOAgyBEjx6lOWqxvq8uBk3bnqhMXzaZQJP9hnW6OmjTLZILuUjHSDEnR9WEzLCCh7BPzSH+PrSg3I2sRCTb+fdKmw8uTXa4+U2e+3kcO2w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 40ee3d2076aefa1b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBa4n+8ccl5cJbXq56rnnfP78VvcShGQASe5r5Kj981+cyWjYBI/naiLjKi5ECZNMOXcKqSz1UvP6tPft0pOzeWMsQbuVdQv1p1zKUddGfiClbB+ZUa4kDfiQU/v1uRgdQYb35+O4cJBg66p4r+fWMF0mZPvIUsiLgNccENAQQYqxgYu5n6Ahv7ev0lQnp2akdr0ls49zKawyY+VV929/ZP/oZqHeB0vplbNHnDfRg7wV65hK+1HkZNAL3qHxYp5mvGBnXF79MW1w1+4AbgeEXT2sOgttDKwNLk+gP6zFj/hy94vHexgISiIUlbCJqm9wVazS2kEd8ImAuXAIPEasQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYDm+x1uHHoe95VdJZCKrnBh2rXyUDEoWYPYidSuYM8=;
 b=Zb//hHJ06cnCk8LmN/qWROiq2yPn6/48tKVZYB0XyXXAQO6fg8X16qTBrBMd+uleO6pGpDloFMJIz10Rwv6ymZeG0o1k832SKIaqYM8nJjlB3laotrcpKFcdUBgeWFX21RySTlQlip6jiDiPd8jhMrhZbWsPtYZ6pTWej6sDn6R661HkZ/Hhp2njlfEvZWCkHFYBN9tjh4xo6oivqxmLrb7vi9PADH+O62uza7sSSOH2L8bA1fQiT0gTz2HqzzkFOtyih+k/r+8qg/mn237L76ST5rmAV91EasvhrBup0weQrAK9cgMPM3xmIhYgZVjolQN8sDX4tg00H2NDzrWjgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYDm+x1uHHoe95VdJZCKrnBh2rXyUDEoWYPYidSuYM8=;
 b=SWIcgcZQlskBml3SWfjYwOKiLoRv1IZPtigme25sOToLH748WPEUMGTI3MQHg8gOknOAgyBEjx6lOWqxvq8uBk3bnqhMXzaZQJP9hnW6OmjTLZILuUjHSDEnR9WEzLCCh7BPzSH+PrSg3I2sRCTb+fdKmw8uTXa4+U2e+3kcO2w=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>, Rahul Singh <Rahul.Singh@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andre
 Przywara <Andre.Przywara@arm.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Thread-Topic: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
Thread-Index:
 AQHXutl5d8zkP9bsD0GXT4+5QPGclKvNtfkAgAAGc4CAABOEAIAABXoAgAAEuYCAAAVHAIAAJiWAgAAK0ICAAQCPgIAAA0qAgAAOJYCAAAHCAIAABnQAgAABQgCAAAQNAIAABdAAgABGkoCAABa9AA==
Date: Tue, 12 Oct 2021 16:15:20 +0000
Message-ID: <AB6D62B6-2ED2-4957-A933-08EC77A4DFD6@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <d292392268df2c74c4103a82ef917072643407a8.1633540842.git.rahul.singh@arm.com>
 <YWQkblfNMYEs6jI9@MacBook-Air-de-Roger.local>
 <77CF7FA5-C566-469E-B4A8-0400789890BB@arm.com>
 <YWQ6Nk3Jk+BqgkwZ@MacBook-Air-de-Roger.local>
 <53AE6E2A-01D7-41EC-9B2C-C0D596EB8D4D@arm.com>
 <YWRCxXGQIyTOAepC@MacBook-Air-de-Roger.local>
 <FEF0B03A-5AC8-4F8D-B821-191AC2EF8295@arm.com>
 <ac6d4785-ac9a-4491-26bb-c66ffe82c55b@suse.com>
 <ED8FC92F-B5EF-4473-B4A9-641C7D44859F@arm.com>
 <0744b957-1832-dff2-9ae2-b8e8534f501b@suse.com>
 <c3952fd5-b893-4cb6-a9bc-325a89e859db@epam.com>
 <c125b447-53e8-7d13-3b08-af62fd3a9140@suse.com>
 <c6b6c22f-fb8a-f2d9-7735-f1ebc9809908@epam.com>
 <09656882-b297-7144-c291-1ee997edb119@suse.com>
 <69A83587-B7E0-4653-AF8C-AEE802922CE5@arm.com>
 <24933.41349.893363.203683@mariner.uk.xensource.com>
In-Reply-To: <24933.41349.893363.203683@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: xenproject.org; dkim=none (message not
 signed) header.d=none;xenproject.org; dmarc=none action=none
 header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 81a0cbd5-dc03-4de9-3a7f-08d98d9b8ccf
x-ms-traffictypediagnostic: DB7PR08MB3771:|DB6PR0801MB2054:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB2054BD52A9CF15382907E7A29DB69@DB6PR0801MB2054.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1LYK1jtZ/J1xMUHRsxB6I+izbc4nbsnja6zOz97Z5b95elJuoYh5pzpy2ImXUh/GHzxEVx4Bwm7mtO5ZIWfbbdtnTyfPFb/N/qdRHe4QvNDgUMEs83flIev/BhEjylH5hKRo/0d2+T4CEcHEoEKQU1Tq2HFHG2yI0sLvuSBJg0l3o32ZH/gEYGlVN/SkPkIE+DpfZPhy16+zXmTL3ohFmsCiH5uF5Lv0Z1amD6S9GHAOEeZPCNjpPS5xK4OhN/yfA5hPC7a0Wxp9Ck4xdBXEcYVkgI1FkCXznL1arHiU0VxNCJNUXw2UrjUMTX42mhrm3bSCoLD5sqJbZN/EV3FsXdjLBqTjSc6a5gVphHH5Njoulg4pQfnQubeP65/KqmUGzLcmjxhi04v+rJirkX5y/7DbxFkEiyQRkw48UHgEA9fLTB/bdF/ePoTaWXFMp/WHns4B2sotSNYUTIRiHaJY6TkhVFjlRf5t/wM8oLqjeQznZoy1Zaj4oObAsqP+naWomR30lOqpY5oy9+6/r1Ky5UTKMzuPMVuZ76CK80nIP56gd7erlOH12XICEgFSgS2MVZal06iM+n1JGd/rZtkhmq7k5d7nJB5bf1MHjU5ZgtDwFZP9a5Y4sMXtSn9mrT1vC3UyWt/3WlT3E6H3tDPar1ZaV8RD5cmH1hXIL68R2VoTzZ/B1677SP9lXw3JXNxOCMbGQh1AqRzm/EAdvcA5uJmE3X7z+eBENTi1SGMazqaoHKXSy0o11MEh325J8Dvi
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(2906002)(66556008)(66446008)(64756008)(6512007)(33656002)(6916009)(4326008)(2616005)(71200400001)(508600001)(54906003)(316002)(5660300002)(76116006)(8936002)(53546011)(26005)(186003)(66946007)(83380400001)(6506007)(86362001)(8676002)(38100700002)(122000001)(91956017)(6486002)(36756003)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <563C9D767C5B0B4BA90AE5712E500FC3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3771
Original-Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e7d0307d-5dc0-4470-fe88-08d98d9b7d10
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9memBaNy15avBC9uidcAUSP3gGg1Pdce7P7lQQipdaiYiFX1egkEymFYacLkzJHBVQzOItjw2ZGprWR2z31g/+QN5AtotLrBWRznHl8J+EPcG2NnGJhu9FwfsoQr3Od2IsBENHcMNPTzkVIHm+AfbmDieqakdpD3DsNeYYxDmcIrX0w2I7fD3aoeWqlxUSS2BMbNf+C7cTeWQCeF8eA7ga+xUJznyZtTDZ/B9RCeF2R8VWiTySNRQwJCEI+E5s15rR4X9nZIg2rYU96LYU8XN/UCtODzj+emYwu6ED1ckT5GlaRW1amo/Qh+o8CnhSx1LpiOo/zRERO/tM7xYQKSEbg3H17UGLcGQRhZKdBHtKxxBEOb9y+kIQRyl5VbN65sJrpPHhtiGVhRpZHf725Y0hnUMSiICbzzpVa428Nt9Vuj8OZ95/CkRPXOkPb2Qi5ks5RuY4PZW/v+xLAeR9yOsr4HFXhRAqL1FGqSr+5EdMC0f/PrcMMzUUN198xR5jadQ5Azmlz5jr0KHI0MaGf1YDH2QQo/KF2Jpyu/uZobglSiNPVIwqKBd5fVHC0KcVTTPv8Czdce7P9mDrTvlCm9Yth14EQANPGhTlo3ermW1EiwJjUyDQRaj5bkDs94spdDDhieULJOndVrBY4xjoioo4stc6SvJZ6Si1Y/BIkbu10Iyt+OGcP4E1VedaDD87TEekUiLvpChfHvzPFGi77/EA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(186003)(70206006)(26005)(6512007)(54906003)(36860700001)(81166007)(336012)(8676002)(86362001)(6486002)(2906002)(36756003)(107886003)(508600001)(47076005)(70586007)(82310400003)(356005)(33656002)(8936002)(53546011)(83380400001)(4326008)(5660300002)(6862004)(316002)(2616005)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 16:15:47.0384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a0cbd5-dc03-4de9-3a7f-08d98d9b8ccf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2054

Hi Ian,

> On 12 Oct 2021, at 15:53, Ian Jackson <iwj@xenproject.org> wrote:
>=20
> Bertrand Marquis writes ("Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_=
permission(..) not supported on ARM."):
>> So there is no comment remaining on this patch ?
>=20
> I have been following this thread.  I think I have a notion of why
> this is needed but I'm not 100% clear on it.  The commit message says
> this:
>=20
>> ARM architecture does not implement I/O ports. Ignore this call on ARM
>> to avoid the overhead of making a hypercall just for Xen to return
>> -ENOSYS.
>=20
> which implies it's a performance improvement.  But the change also
> suppresses an error return, so this commit message is false.  I think
> that the thread has concluded something different, but it should be
> explained in the commit message.  The purpose of a commit message is
> precisely to capture the kind of considerations and discussion that
> occurred in this thread.

I can add something in the commit message about the fact that we improve
performance and prevent to do a call that is and will not be supported in X=
en.

>=20
> If the overall outcome implied by this patch is correct (as I *think*
> the thread has concluded) then I don't think the #ifdefery is
> appropriate.  This should be done with a new arch-specific function in
> libxl_x86.c and libxl_arm.c.  I'm not sure precisely what that
> function should be called, but maybe something like
>  libxl_ioports_supported
> ?
>=20
> I see that the fact that we avoid #ifdefs wasn't documented in
> CODING_STYLE, so I have sent a patch to add that.  Sorry about that.

I saw your change in CODING_STYLE and I understand the request.
I will try to see if we can handle this change before the feature freeze.

Regards
Bertrand

>=20
> Thanks,
> Ian.


