Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F328D4BF3FB
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 09:48:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276552.472740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMQqS-000786-DT; Tue, 22 Feb 2022 08:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276552.472740; Tue, 22 Feb 2022 08:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMQqS-00076G-AN; Tue, 22 Feb 2022 08:48:28 +0000
Received: by outflank-mailman (input) for mailman id 276552;
 Tue, 22 Feb 2022 08:48:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/+sy=TF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nMQqQ-00076A-1o
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 08:48:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fa7fa44-93bc-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 09:48:21 +0100 (CET)
Received: from DB6PR0202CA0043.eurprd02.prod.outlook.com (2603:10a6:4:a5::29)
 by AM0PR08MB3345.eurprd08.prod.outlook.com (2603:10a6:208:5c::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Tue, 22 Feb
 2022 08:48:22 +0000
Received: from DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::7b) by DB6PR0202CA0043.outlook.office365.com
 (2603:10a6:4:a5::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27 via Frontend
 Transport; Tue, 22 Feb 2022 08:48:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT062.mail.protection.outlook.com (10.152.20.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.20 via Frontend Transport; Tue, 22 Feb 2022 08:48:22 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Tue, 22 Feb 2022 08:48:22 +0000
Received: from eed862d4cf73.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2F0715CE-8FE0-40C4-803D-21198D27621B.1; 
 Tue, 22 Feb 2022 08:48:16 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eed862d4cf73.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Feb 2022 08:48:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBBPR08MB6283.eurprd08.prod.outlook.com (2603:10a6:10:1f7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Tue, 22 Feb
 2022 08:48:12 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6%5]) with mapi id 15.20.5017.021; Tue, 22 Feb 2022
 08:48:12 +0000
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
X-Inumbo-ID: 2fa7fa44-93bc-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyMy87wvyZ62c9vWLLoO71oN0aKj5HlXRnDLhTiB9DQ=;
 b=uaYXADQzbK3/+M9av+HEJWEx86P9i5zT6l8FKvRV32GrJAGFJn2mKnO+jhkiIN5ymOxkbefNV1mT+zky+NMVngQzCujvyvsIHMoYdAZ/1s2LaoC1a2KOCW59K1aw9f0kEMEmSBg6hUCmSaZc1AIXbHq1lqxQOU7MsKQpAp9D9Nw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fe5fcd5aaebcd0ba
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8IbaYsCrCahWyz0wUv9R1aou9A3fxqT+wfuq0VKck2/lXOiszVQToBl77YmOolxC0cQWYzugldsKA8WFfR2v727eGL1RWU8nA/aOHreVyMT6yZvq4ibwsMJU1cFVKYLHuBhh5llujPjgYtw6U80ae2CeC2FS+k/Vzl+9e6kxqsnLjfwhNh1JwPR3xAWNfs61EYbZaZqFF5qZhbuG3hpLuMpf4lZjBMcy6Uikx5M71w6nzW8TmO1i2+x4QmqKJ6CyZu8K15qw2J65P7izAam2+l9mxzW/LrGgPj7Ql+Fpt9/4PVKNPdHPxOxPWSMnEpUbElSUAzwA/nMmQeKc8w4cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LyMy87wvyZ62c9vWLLoO71oN0aKj5HlXRnDLhTiB9DQ=;
 b=ACxw5pB9+cFjB77vcfBqxN2EOhIbUYRsOjxB+8terEiNgNWIT3gOqzE/Q4nPx80mgA6LfXUelhTZPIcMzxRuNFHsNyMu/k3HJe5ndmqxm5TniivsRmMTd2aZI9UtotHDaH9OEzvWUofR3rWdPWF0OW1rqA5Qa+DANbQbRWwoJcDi8P+yjv5DTUZTadZGWnafj3EvtAXpIasPkyHTT3i+rjkqkICMUgiDxncP8fxV+zMGYSVEoL9fP9hFD1nCqk2yR4/6W7Q8MJRuC3NFmbSTDZteMKl/zJjKpb2yjJa1lRqe+Y/nTxYSDG25J5WTTjbot+9WbMSnTghr8PETOsxUkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyMy87wvyZ62c9vWLLoO71oN0aKj5HlXRnDLhTiB9DQ=;
 b=uaYXADQzbK3/+M9av+HEJWEx86P9i5zT6l8FKvRV32GrJAGFJn2mKnO+jhkiIN5ymOxkbefNV1mT+zky+NMVngQzCujvyvsIHMoYdAZ/1s2LaoC1a2KOCW59K1aw9f0kEMEmSBg6hUCmSaZc1AIXbHq1lqxQOU7MsKQpAp9D9Nw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Rename psr_mode_is_32bit to regs_mode_is_32bit
Thread-Topic: [PATCH] xen/arm: Rename psr_mode_is_32bit to regs_mode_is_32bit
Thread-Index: AQHYJxJCWcqEO5mjnU2pXdjeX/mYYqyeKbmAgAD9y4CAABwvgA==
Date: Tue, 22 Feb 2022 08:48:12 +0000
Message-ID: <A666192F-D43D-484D-8125-8908F45155BB@arm.com>
References: <20220221105931.12028-1-michal.orzel@arm.com>
 <1531f49d-c74c-8a41-a917-cfe76bee8e7d@xen.org>
 <05b5877b-7dc0-3d35-f073-5721e1605321@arm.com>
In-Reply-To: <05b5877b-7dc0-3d35-f073-5721e1605321@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4db849ea-ee2c-4a2e-5f48-08d9f5e014df
x-ms-traffictypediagnostic:
	DBBPR08MB6283:EE_|DB5EUR03FT062:EE_|AM0PR08MB3345:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3345EFF95EEE0CAD8585E7239D3B9@AM0PR08MB3345.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2AuD050VJKj0LtHvKx3ArMxv1JFId7zC61tAfYBg21WiDjrrZeKabPglmWJPZFALn1KzGmicEJaSotNdR/rRaU3Fib5BcWGXFp5zn53miHR509aIcMG7Nm52Bt1CwUb0PrKuQD8E6yV2IPdZJkBHrexn+kQMjyCqFLYoJ62stQzlNNhrR74ZaZwGdg04S33os9MVPIqha+5XF55i4w/C5N0RGGGWgKwFdOcpQpUnOICgsm1xKmfMICv4LXIN2F4mLC99EwI7z16vRcKQTJ925q8lw8DBwegDuS2Kp/Qc7xcCNEC2giN+bOAnxYf1nhWAw5dA1on8ZlrI45S3svSPMun39EMcDSJ2+0b6jRnyPqNsP2l9wcD66/HwR68wgFKHjZoGjVI0Lv8kSonJnYfzV1UWEYDiXhpOwpfIDvV11jwW0klc9Pe8+t391kHgzj5FM6g49vhj2Q2LH+kMhCtaJ0iaek8uyaZ+S0pyd+wh+1rZdzXXI50t2ou1ugo5MDJQyO6vBKbBmUVYwdqXJ+de/RzznTjNcFXMisbUEVRt5kCuvZv6HYXRbT77i54STXKm+YPy2KnAgvC3PonPpiB8YlyZBgbVr1GEuM4FJZTm/Wjh3kJbs6SzHy4snhFwQKIIp4o4QkMnqYZhZQLCROAasGaA88GurT272etjNSK9kV/dYygbJwvufk17kWJt5HwQmluWqOWAPMYI8TDQTDxf8/d7IUKv7LKpRry/XBEA4iJdMhXrpimfu7Igco2jXVYXD6THoyChXrAALC4N+gL603Med6qx7sfT+pgeZ0bibOZnNpa9KM2doUvmRx2Ybg7b
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(71200400001)(2616005)(6636002)(5660300002)(86362001)(37006003)(54906003)(36756003)(26005)(83380400001)(186003)(66556008)(76116006)(66946007)(8676002)(122000001)(33656002)(66476007)(66446008)(64756008)(91956017)(2906002)(966005)(38070700005)(4326008)(508600001)(6862004)(38100700002)(6486002)(53546011)(8936002)(6506007)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C5C7C3B0E9307540B4D638C19A57B597@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6283
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	697f1dc6-57f4-4aae-02ae-08d9f5e00f15
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EQftcHTVvjfODzi0z+FtUUGNO92qcQE6FaQ5icp0cLacuv3F4wYnZZKQulk7Kfp//k5MyQPGloiM6TlQiZ9KlPbN04IrraVSDOeGBY5x+M2mDr8Ylde6izkLtUUL2j+UcIPzWsHysDAQuicRAGdAuzPSSP8bwHfrIgqvPLbCi+PaR/2hrFNjPXY7PewsWGveQaTMc/WtZEmdux61xH6jHqempCDuS2jSogpwHajLUwJQr0KP59wrZcY7MGwJyqc3bGzCs77Lbhxin+WpbeKXcesoVOKL1Xy1VOt81j/+NoturHXZP9HtGI0DXjysIUHfxuxnOLsunFU/0uvRP0YTJiEavFzXMsmLQdI9jIdpYxYQtARdN4AXPBArmfAOU0s6VaviI8irOfS9HM8r2R5C2E6T+ebSnZxN9srZpdBeOW2KQT74DI4kwrCrBut/baaSZDQkGFtPvfJ96i4TgnN78QA1XhEmVH28Ux/qp5pH0SlGCYAs/1cT/TxjTzcb88sGqn9gPRHW3aIa+m/k8dA1Whn+JfkXvozy+8T9qi/PHoudIfmh8hWufgr1ZKqR7fakbD0fLGTC4q+gHmXaV7xk0mZ4v/wMREscZDmN4t4k+dJpgYqOpsSdFSmd5rG5osjGAtlgd7c0sF8+COylSMDmJ+mHYyOijCVgrJ3FwTDXK4STli+7a0/Sda3cuU9HFp+QikDy5QnHB5GWTL3bAnJRMC9rVIxwfULa8qY60WZvMlhMWGRBfCnDQPvbCuskuDga
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(83380400001)(47076005)(356005)(81166007)(86362001)(40460700003)(6636002)(6486002)(966005)(316002)(8676002)(70206006)(70586007)(54906003)(36756003)(37006003)(6862004)(4326008)(36860700001)(508600001)(107886003)(336012)(33656002)(2906002)(2616005)(53546011)(6506007)(82310400004)(8936002)(6512007)(26005)(186003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 08:48:22.1142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db849ea-ee2c-4a2e-5f48-08d9f5e014df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3345

Hi Michal,

> On 22 Feb 2022, at 07:07, Michal Orzel <michal.orzel@arm.com> wrote:
>=20
> Hi Julien,
>=20
> On 21.02.2022 16:58, Julien Grall wrote:
>> Hi Michal,
>>=20
>> On 21/02/2022 10:59, Michal Orzel wrote:
>>> Following a discussion [1] it seems like that renaming work has
>>> been forgotten.=20
>>=20
>> This is in my todo list of clean-up I need to do for Xen. But I haven't =
yet had a chance to look at it. Thank you for taking a look!
>>=20
>>> Perform renaming of psr_mode_is_32bit to
>>> regs_mode_is_32bit as the function no longer takes psr parameter.
>>=20
>> If we modify psr_mode_is_32bit(), then we should also modify psr_mode_is=
_user() because they have the same prototype and we should keep the naming =
consistent.
>>=20
> Ok, I agree. Do you think this should be done in a separate patch?
> FWICS, psr_mode_is_user is used in traps.c, vcpreg.c ,vtimer.c and vsysre=
g.c whereas psr_mode_is_32bit - only in traps.c.

I think it can be done in a separate patch.

Cheers
Bertrand

>=20
>>>=20
>>> [1] https://marc.info/?l=3Dxen-devel&m=3D156457538423787&w=3D2
>>=20
>> NIT: The first sentence and this link adds value for the review on the m=
ailing list (we know where the request came from) but doesn't add any after=
 the commit message (there are no extra information in them).
>>=20
>> So I would move this information after ---. This will get dropped on com=
mit.
>>=20
> Ok.
>> Cheers,
>>=20
>=20
> Cheers,
> Michal
>=20


