Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4746657207B
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 18:12:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365839.596179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBIUR-0000Ze-MV; Tue, 12 Jul 2022 16:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365839.596179; Tue, 12 Jul 2022 16:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBIUR-0000W7-JG; Tue, 12 Jul 2022 16:11:59 +0000
Received: by outflank-mailman (input) for mailman id 365839;
 Tue, 12 Jul 2022 16:11:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n9B0=XR=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oBIUP-0000Vy-AY
 for xen-devel@lists.xen.org; Tue, 12 Jul 2022 16:11:57 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30075.outbound.protection.outlook.com [40.107.3.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59091a44-01fd-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 18:11:55 +0200 (CEST)
Received: from FR3P281CA0097.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a1::15)
 by PR3PR08MB5658.eurprd08.prod.outlook.com (2603:10a6:102:88::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21; Tue, 12 Jul
 2022 16:11:51 +0000
Received: from VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a1:cafe::fc) by FR3P281CA0097.outlook.office365.com
 (2603:10a6:d10:a1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.5 via Frontend
 Transport; Tue, 12 Jul 2022 16:11:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT059.mail.protection.outlook.com (10.152.19.60) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 16:11:50 +0000
Received: ("Tessian outbound 13cb25bfb745:v122");
 Tue, 12 Jul 2022 16:11:50 +0000
Received: from 6b56f019d017.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4468AEDE-C3CB-4B57-A6C5-66ADC7E96EF2.1; 
 Tue, 12 Jul 2022 16:11:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6b56f019d017.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Jul 2022 16:11:43 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB4333.eurprd08.prod.outlook.com (2603:10a6:803:101::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 16:11:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 16:11:41 +0000
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
X-Inumbo-ID: 59091a44-01fd-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Vau/Au6jZD1XtPxe0NEvqKgwooZDT9dBK9+D1KYQ4de4v/ormMIfAW4qhfUVr1qmVNH8Xj6dQV4qjyFW4IGlRx/fi6nvAYKRkgDTHdOmWKh4QspODT6I4f0M8VA08PQ2U/36g6psiYXHALQeTn2bQGg9km9Hf+UUjK46grsKCG1TOUoew6PM286Z6I115quBiFYzKHosUkv4e+IDpncePmC+of1u9TUemZErqKzoxDY1NjA9o7pZG54UtZw40QFu8WL9CkFbS6N3RwyCbns/rNd7FGjKdurv6cEOvqWPCNPH3rHVhQmHUfP+4x3xkJpgsv9fA3uPkklgHKCUEQYpKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CES0Gwh0Er6rznp0kvGhD+XyPAeLoOzzuhOllBhqAhw=;
 b=KUVWRXK7PDu4E/LV2XDAKW1D1b+UDeht+J5n2oyK5/VxWJTzeppFkx3lv18pSfBHx74s0rM3WQPsArx3sehFKJxRX6lQqCIZSo7qchE3fpJd8ZoSuW0YZ1GehKzpRry+3Pzucd5K0aLpHsLoX1w/QGfY3VMo9tmhc9tpd32FbFmWLsUMZBIC8FUo0CRcJQYQj/WKRXimUeTDZjcftVg6Wbc87bibDZxDQO/WcxhaXF2C1SiuIpDNhjbton0af+DbOlc9YZHj7r/BaRqnQVB9yPecCih6ahjUED1DpMXPLkckAhhO8eCeHHDHVqISINP+Lv3wqu3tlmcwgZtBJ9WtYg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xen.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CES0Gwh0Er6rznp0kvGhD+XyPAeLoOzzuhOllBhqAhw=;
 b=3gxWEPHKklxFKIvcijSAq/FpC81oe5vQqo2iXTWEup1WZIvew4hM18Ae4ZSGUcLfWrxthw8gWnonP0niZwCOlkuFRic4lGFlKe852wpC9MOQOBgPg2mvJEyMfaXol7ea59qgm220exfBbAR4mXq2+6FMUyHlNL40INI4Pe5piuc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c4d3c120439d3d93
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGgPOjuG/xKqG3MgiDul6KuMcl3oUvEIsd95b4cqlDh4lXQKo79abLNejIGsZNZrhHIu+BNajGFdCNqxQ1IU0N61l2+eKDqF0p3o2ndYMWVJKrzy2YwKGijEmF29Zpi7QkUBWjD5oF3sCpUp7TAVDieV8DMg4g1fcQFFaHnV0Va+WxHObXdo50hHeCPYG8ARCl4wnlfwULCgKA3BfQBJiIDzaL2uyp+wOtDMZCL6f9cI9yfe5CQuX2oTJUjiK0Z7nM28mncWW7EOchj5/vn9wJLjmLI8H9QNHR6R5Wy8nMXYvsNkv+D6ltFzOF5W1CL7JxUQg2BYGAX8v8JaQA8nvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CES0Gwh0Er6rznp0kvGhD+XyPAeLoOzzuhOllBhqAhw=;
 b=g1H6lDrJYhA/T1FMJea5pOkkrx8aaI7O/0zB22OuaL/NUAdLcsq90Gz9lg/dU7MpK6VGP5wz2Ycm9C8Jpf3lGVF2mQZoGRIBazhocnybqEICcLlplU/WUCuBTbCl8v1YBm8242sMJoGe68oX0lq5b3L5oT0zBFR5KLSXCOsqM06sIA9aP1BHpA0U797n6AOC+RXuJf1QYtjBTF0O8eD7NkxuytIn1GqgidM46/MuE37emQMr+NKLvcZy9EwBMH+jnkVAyZ9C01Qqry83JvWLHwwWz1Z+RmlN/SMoqjn+cF5WmWLA3WryR3PXQFgBCXDbGY0ic03tDBW93i6dOdjSbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CES0Gwh0Er6rznp0kvGhD+XyPAeLoOzzuhOllBhqAhw=;
 b=3gxWEPHKklxFKIvcijSAq/FpC81oe5vQqo2iXTWEup1WZIvew4hM18Ae4ZSGUcLfWrxthw8gWnonP0niZwCOlkuFRic4lGFlKe852wpC9MOQOBgPg2mvJEyMfaXol7ea59qgm220exfBbAR4mXq2+6FMUyHlNL40INI4Pe5piuc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Brad Churchwell <brad@cachengo.com>
CC: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Subject: Re: Xen on rk3399
Thread-Topic: Xen on rk3399
Thread-Index: AQHYlaRzw0VI/DSwq0Ot3R+564rcea161i+AgAAPUoCAAANZAA==
Date: Tue, 12 Jul 2022 16:11:41 +0000
Message-ID: <ECBAC842-3E20-4956-BACF-CB6D8CE708F8@arm.com>
References:
 <CAMdBLPN183W-t5bNJvxGb=t0kL4QHFQNQ7O3LZAd_yXUOrSStA@mail.gmail.com>
 <C84A929A-CCFC-497E-96C8-8D5EC3DE9AFD@arm.com>
 <CAMdBLPP62J250=ZTAM=vMR-a0rD_AdFxnbP5WVtybDiLisEV9w@mail.gmail.com>
In-Reply-To:
 <CAMdBLPP62J250=ZTAM=vMR-a0rD_AdFxnbP5WVtybDiLisEV9w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 500458ca-3549-4549-f0bb-08da64213ac1
x-ms-traffictypediagnostic:
	VI1PR08MB4333:EE_|VE1EUR03FT059:EE_|PR3PR08MB5658:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mC6M7xsyDIeIEpUQ3Ca6XRjo4WpdlyA95mtgE5KHP417wNH58S1z4P5Dymoq/zzscVmUluGdot3WkHCUHL1Kz1JYOujg39S7MsWO7b5dMrt4D2od+KiBD0PgvoSVnMTNPCwaRTFvRN3CM9VXwbPP9BWztlz4n6wHPeb9s05d1ggCPreSeYFJQJgrQGsNUVF846OvhuL/gWJihZpSnnzC8ncxXxDEer+p0T/L0XI1csZGAKq4F1BEX8dSDnC5lQMvFeSN13yMG7yIXTBtaQFni7s/lQ9FGl3wBCfeBzP/FD5y6DN99/mdwQ1uo5UzrS5rF6Uh4zipeHl3JItfAdkJtTC5T+gT/NrGuqudM9H+E+uTuXNC6kq4cdv2W3Cp9OolHi1EgYV/PEmELRSlZOBRU2pWhu3uowaiWaODSbZRfa0S/teDEIViLEH2hpF/g26SAaAKH7Or/6dDTnz9U3KFE47dWv14GJjo+fwEY0VMqMYKweG/t05VYuwdC4JGy9RZGALPVkWVhC1t3qUzdBjhqct6LVsz71iiNcHmzDR2jnt8iDz4BeyQeg6RUbzrymb1bWWM4TyzqUNBaqA/YcFSFlnJqo6TP3nR6OIjZGFgYjmhFGB70GUMcK20S+TzqKYMty61MovoXgiiHuSSUzxckyeSDFN2kMBzxOTTZZ1RPElpylpxPzCQx0gaFD+5AkSf3Jce9FRcbdwqAPlWpeTfznYtddBQoklnBwgIQtjKK+WD1WtzbrOGD6Pn6QsoG665DH2S/FsRjCkTmWIXcD55NIxt5D0a82ydJyqHNMdhcfWK80cHClXcVQ/4UrRHa0ZuGfSEWIqtWDUmBRGsMfy0Gq11XB5esat17CQqzkzdFgY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(76116006)(8936002)(2906002)(316002)(4326008)(6916009)(86362001)(83380400001)(7116003)(66446008)(66556008)(66476007)(91956017)(66946007)(8676002)(64756008)(5660300002)(6506007)(38070700005)(186003)(26005)(36756003)(6512007)(2616005)(71200400001)(6486002)(122000001)(38100700002)(33656002)(478600001)(41300700001)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0BEB69D6D0B0AF4A8503B22AC1213E1C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4333
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ab755a7f-d747-4365-c75a-08da64213521
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8i8RSaUXZXfON2F8yWiLiXO94ios5/zlm2fqFFa12vQr1m6flQ6sOtMoUGL1EHLjqKHWU7QvjoQQ04nA06nTsTSZzKtQY3/US9/PyJXADkGm/Pp6S0BU4yqieZ0oGfnH9fZDMD4a2EGhVKt1i7xWBcpkeuXghChkHiiaFHpsmHXoUxe3bXptMh2F9rKX59ThcYAo+HLS10ZUIbJlcMsUG/J3/vW9kkspt8mHuhre5KHj1gOCg1RCoPSAap7BabUlXux5GJWUZgN8v62VfXRocQmQbO6tAu7QD858kyDTNEbv5LWyenxEoKgZsoZ/YP9KxXoCxOIKLwznnDlRnlqsmNLeGGghSDaBqQ3qFFb0KosnTAMUBLl1E3GEib4DgIK4YR6a6p5KeoQ1Aa6exn8DWcDhxsde2tGbzKJdCFzcRtvXPL1VXtlIJ04VtzlgI+DJaZLJeGBrR7lMc9AC1oXUtDcz5xlyyZDsAxRkOXWOaRlhzq20dzKZjlbY6YMhnjPPJ3ViQMZQnFv3qHGf253oliEOq4Ofv7dosKM1Mxv6+v+NaC+9/Kqu+v9mnBvGLQ3Iosoht8djexIH1rdhFdJgNIAn9p0wjZ0IvrVPM5H+L9HeXe4hhlI1qnbYpR9LPlkwVROde36QTV4RsumMAwd1E7NYCJDkx3uiUsS+S1TPjK7XDs/FrNc3vHgF3ZN7DbSOs34P0lqtAOFeZWxH2cQUWPzySVtInD4T/RVuGou6C4KdoYKR/HAPIK66rezkRGTuryfQhcyrrUM8p3KKOn2s6nxtAZPo39tZ7HWd34zoYQqCXVF39fjpSayR+zuR4qSp
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(346002)(136003)(46966006)(36840700001)(40470700004)(8676002)(86362001)(40480700001)(316002)(478600001)(81166007)(82310400005)(36756003)(186003)(53546011)(6862004)(7116003)(2616005)(36860700001)(70206006)(33656002)(6506007)(4326008)(40460700003)(5660300002)(6486002)(356005)(47076005)(8936002)(336012)(2906002)(82740400003)(70586007)(6512007)(41300700001)(26005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 16:11:50.7271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 500458ca-3549-4549-f0bb-08da64213ac1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5658

Hi Brad,

> On 12 Jul 2022, at 16:59, Brad Churchwell <brad@cachengo.com> wrote:
>
> Hi Bertrand,
>
> Thanks so much for the quick response!
>
> I should have mentioned previously that this device tree and kernel Image=
 (5.15.16) does boot properly with the rootfs without XEN. The interrupt er=
rors are only present when booting with XEN.
>
> These are custom boards and they do have usb c, however we are unable to =
boot from usb as it doesn't receive power.  We currently only use the usb t=
o flash u-boot to spi which requires us to use a separate power adapter. Th=
ese boards get power and networking through a custom backplane and interfac=
e with the backplane via a sata style justice (I'm not sure what the proper=
 terminology would be here).
>
> Since I cannot boot to rootfs with XEN, I'm unable to show the device tre=
e there. The only bit that I added to accommodate XEN is this bit here:
>
> chosen {
>     stdout-path =3D "serial2:1500000n8";
>     bootargs =3D "hmp-unsafe=3Dtrue";
>     xen,dom0-bootargs =3D "console=3Dhvc0 earlyprintk=3Dxen clk_ignore_un=
used root=3D/dev/nvme0n1p2 rw init=3D/sbin/init rootwait rootfstype=3Dext4 =
ignore_loglevel";
>     modules {
>         #address-cells =3D <2>;
>         #size-cells =3D <2>;
>
>         module@1 {
>             compatible =3D "xen,linux-zimage", "xen,multiboot-module";
>             reg =3D <0x0 0x03F80000 0x0 0x01aa8008>;
>         };
>         module@2 {
>             compatible =3D "xen,linux-initrd", "xen,multiboot-module";
>             reg =3D <0x0 0x06000000 0x0 0x02000000>;
>         };
>     };
>
> };
>
> The gic declaration is in the vanilla rk3399.dtsi file and hasn't been mo=
dified:
>
>         gic: interrupt-controller@fee00000 {
>                 compatible =3D "arm,gic-v3";
>                 #interrupt-cells =3D <4>;
>                 #address-cells =3D <2>;
>                 #size-cells =3D <2>;
>                 ranges;
>                 interrupt-controller;
>
>                 reg =3D <0x0 0xfee00000 0 0x10000>, /* GICD */
>                       <0x0 0xfef00000 0 0xc0000>, /* GICR */
>                       <0x0 0xfff00000 0 0x10000>, /* GICC */
>                       <0x0 0xfff10000 0 0x10000>, /* GICH */
>                       <0x0 0xfff20000 0 0x10000>; /* GICV */
>                 interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
>                 its: interrupt-controller@fee20000 {
>                         compatible =3D "arm,gic-v3-its";
>                         msi-controller;
>                         #msi-cells =3D <1>;
>                         reg =3D <0x0 0xfee20000 0x0 0x20000>;
>                 };
>
>                 ppi-partitions {
>                         ppi_cluster0: interrupt-partition-0 {
>                                 affinity =3D <&cpu_l0 &cpu_l1 &cpu_l2 &cp=
u_l3>;
>                         };
>
>                         ppi_cluster1: interrupt-partition-1 {
>                                 affinity =3D <&cpu_b0 &cpu_b1>;
>                         };
>                 };

Xen is not supporting PPI partitions.
I also saw that your booting using SMP unsafe so all core are enabled by Xe=
n.

Right now big/little is not supported by Xen and here you might have some i=
nterrupts in your system which can only occur on some specific cores.
I would suggest to try the following:
- only boot enable in your dtb the cores with the same type than the boot c=
ore
- check in your device tree which devices are assign to the ppi_cluster not=
 available and disable them

This kind of configuration will be tricky to handle so it will depend on wh=
ich devices have interrupts that can only be fired on one cluster type.

Sorry but I cannot right now check in the device tree and do those checks m=
yself but if you do get the idea send back a mail :-)

Cheers
Bertrand

>         };
>
> I've attached the device tree and include files just in case you'd like t=
o take a look at those.
>
> Thanks so much for your help! I've been at this for weeks with very littl=
e progress.
>
> Cheers,
> Brad
>
>
> On Tue, Jul 12, 2022 at 10:05 AM Bertrand Marquis <Bertrand.Marquis@arm.c=
om> wrote:
> Hi Brad,
>
> > On 11 Jul 2022, at 19:38, Brad Churchwell <brad@cachengo.com> wrote:
> >
> > Hello,
> >
> > I've been trying to get Xen to boot dom0 with my kernel for weeks on an=
 rk3399 based board and thought I'd reach out for help. It looks like eithe=
r Xen is not properly recreating the device tree or the interrupt controlle=
r is just failing. The hypervisor boots but falls to initramfs because it c=
annot find the root device (nvme on pcie). Any help would be greatly apprec=
iated. Here is the complete boot log
>
> From the logs you have an issue with the interrupt controller and the fac=
t that your NVME is behind PCIE and as such depends on ITS is probably not =
helping.
>
> I would suggest to try to boot on usb as root fs for a try.
>
> Also it could be useful to compare the device tree on xen and without xen=
 to understand what is going on (using /proc/device-tree).
>
> Xen seems to be ok but Linux is not happy with interrupts and is showing =
several issues around this area on your logs.
> Could you show us an extract of your device tree around the gic declarati=
on ?
>
> Cheers
> Bertrand
>
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.
> <rk3399-zaku.dts><rk3399-zaku.dtsi><rk3399.dtsi>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

