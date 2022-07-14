Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDF857513E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 16:58:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367697.598800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oC0I9-0007lq-6C; Thu, 14 Jul 2022 14:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367697.598800; Thu, 14 Jul 2022 14:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oC0I9-0007jK-32; Thu, 14 Jul 2022 14:58:13 +0000
Received: by outflank-mailman (input) for mailman id 367697;
 Thu, 14 Jul 2022 14:58:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lagp=XT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oC0I7-0007jC-Mq
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 14:58:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70081.outbound.protection.outlook.com [40.107.7.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60e72f42-0385-11ed-bd2d-47488cf2e6aa;
 Thu, 14 Jul 2022 16:58:11 +0200 (CEST)
Received: from DB8PR06CA0050.eurprd06.prod.outlook.com (2603:10a6:10:120::24)
 by HE1PR0801MB2121.eurprd08.prod.outlook.com (2603:10a6:3:80::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 14 Jul
 2022 14:58:06 +0000
Received: from DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::bf) by DB8PR06CA0050.outlook.office365.com
 (2603:10a6:10:120::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.11 via Frontend
 Transport; Thu, 14 Jul 2022 14:58:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT016.mail.protection.outlook.com (100.127.142.204) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 14 Jul 2022 14:58:05 +0000
Received: ("Tessian outbound afad550a20c6:v122");
 Thu, 14 Jul 2022 14:58:05 +0000
Received: from 4c3acbc0006e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 265A82A6-8C84-459A-A3F2-8D329435901A.1; 
 Thu, 14 Jul 2022 14:57:54 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4c3acbc0006e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Jul 2022 14:57:54 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB6PR0802MB2485.eurprd08.prod.outlook.com (2603:10a6:4:9b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Thu, 14 Jul
 2022 14:57:52 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 14:57:51 +0000
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
X-Inumbo-ID: 60e72f42-0385-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nFkWFkHbNb1I44cip1f1hld6Zy2BjSb7+icQSJpy5JWshxZK3AnbofByqi3Px/cc8bD+A5aaIf7vCKMMoHm1AASSPbyhmBFnyO2b6I1Oh56bAg0HEg2rxARz1UtsaQ4vZMK9QSjW7F8WPKOzy9JCn4p4/yQNgTxj8jrDnT8UdoIym/6HEHGx0PPGoxuxMbMEwgIm3TfqrZJDFg0lNvy+H3/Bo8rjEl9fNVYhf+DbICefDENOxCzhfjdqSekB2EoODNNmxkmoNkJLJtVxIunMBiNxb9ulBpn2xD1mRXilfzELtTT77iNBG0YaTTfNhenj0Vq1pUcdD7yie5x1QDp3Zw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkD+V04XSIkTHahi19jI9OlNy5zjuYhTGjZdDHwLeOw=;
 b=IJS9OGWhD5SrTQ0gVuS9nSEljX7Lkn3g9dsTy5Yste7Z8IuvYPMtSxzfpWdsz6foHvCUpFLZT5HA1F5kM1ArLz5v/geXp+/MvuzRUjKYquRZUzml9UG3HQH7XlXkin2S4RUephbaFgXTw6yrpMcftXTuVezISBQdqcXuEctvK8O4PFp5y8QRwz4yUxPYMXJp/GHOZzdKwypLF7P+gEY2ZY2qe10G20jKfppL80arR0KIO+nsmcsrP8l+w0CtDdSDn3K8PDfQD5zkUGBjN5bX5HLrqAE8Ij87oKpUbL5oHq6EjlI4fIV3aalczpUAbjkLcrK1ygMPqu+vcUSNR44C/A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkD+V04XSIkTHahi19jI9OlNy5zjuYhTGjZdDHwLeOw=;
 b=Y4T7yIO9vS75Pu8LC6CyVWFRtRemgLYWWPMTRdDR71uTg6nLlsBniPdBC0czAQmVVQDbcis2ELTp66c1YYahlHtCvWSgVKJ/YD/H98ejAQPMHEvlX/JcCci6eduiUVPz7qvug6ztkxRY3BP4C5zhVHVApTR6V0GdoClBGBTF/Vs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 97492a1bc17da79d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gB9Rxjp03qB473cI84uIbYlOgfv0KbcwsgfLHnuTFpP3+yPpcBPtjHQ2BKx1jbXvyhT1akpLjL9scbRAgY1Uho/54NBJOEuYhJX+g5XM/LgF/N8x1xrwerMzmHgV43kz3+yiohgPujj6Ane4FT6fIIODQc/TfCNNW/s48ZfMD49COUx76pI7/0CK8Iywc6MPvH2vL+OaeWFEMxP0XiptxLUItpDV2Q3OhSLUXYzSmWNlNif06ILYKOOJP9urupYGLEPMYMghreJ1uIMwIPco8jdX2llfz3WvXXlXpc0jsStva1g+2SI1teKuThrUKpvlq2kZ0BGu5tSA8hPF7awFAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkD+V04XSIkTHahi19jI9OlNy5zjuYhTGjZdDHwLeOw=;
 b=dU2p/oTy4hkLhYe/c2Tox72uZCurKIJRcv+VdYiTvt9aSb8VEDVuTYLQrnMo2OET18voGC7g8oQ/c8ffXptDLeYywz+LRqrXxhEROKa0W11AjQmcNj6NS016U2GjCepi1o6KgVlKzkQi6sTqVBUkVa3dwLGapZ14wseNYSPGNDGvKc3An2D5TfYHryswkfqZr7Vw8mTmnOQCmjF98mNapiu+lGx35X5C8x6AVEa+KkmWYOSL43MPqHDTfRANVrc9qB0LMckPfyHW0B/W6MjdZvAeude08RNwE1fk9f6jfoONSi9foS4qjSARICYta+2u4Is0Hi1u3Ub7ERUPwyUODg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkD+V04XSIkTHahi19jI9OlNy5zjuYhTGjZdDHwLeOw=;
 b=Y4T7yIO9vS75Pu8LC6CyVWFRtRemgLYWWPMTRdDR71uTg6nLlsBniPdBC0czAQmVVQDbcis2ELTp66c1YYahlHtCvWSgVKJ/YD/H98ejAQPMHEvlX/JcCci6eduiUVPz7qvug6ztkxRY3BP4C5zhVHVApTR6V0GdoClBGBTF/Vs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH 1/2] xen: Fix check-endbr with mawk
Thread-Topic: [XEN PATCH 1/2] xen: Fix check-endbr with mawk
Thread-Index: AQHYl4+SOiEnzZfQqUyU0a50UPEkY6199Q0A
Date: Thu, 14 Jul 2022 14:57:51 +0000
Message-ID: <7EFC2F80-43EC-49EB-A162-FAF0DF945A03@arm.com>
References: <20220714143907.25938-1-anthony.perard@citrix.com>
 <20220714143907.25938-2-anthony.perard@citrix.com>
In-Reply-To: <20220714143907.25938-2-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 541855fe-7a50-433f-8eae-08da65a9420e
x-ms-traffictypediagnostic:
	DB6PR0802MB2485:EE_|DBAEUR03FT016:EE_|HE1PR0801MB2121:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4JuNEpONpMBakrw7vKASdgaumZPjQsrXSGqCeEHmbmWWjoF16287MkPNLpI6FgVetAxcEgcfJ+9A3o9M39LRe/mU6FBJBCpv3S/aoeKJbh8bKCYLuDCbvWAjZEdWskhzzGu3JlKA1NQhByka9JWSEIhd8T1WkJd8x9f4uweGcC3f6lV/SCuWnIuUOcob3IfliDri2SwVCTeg3tYA3TCFmnQdD0AY/7SCwQj/3VdK7Gbh8IG6HJ9SkI//99AgKjBLIVPlJAQpKHlz+0H7y4E8MQPTmy6k8uG9TLT/j1t1XJ/J+50NJM7RMp30ss2SDdr3ercHsUqzyUNmVj2bPKT5pP7ftuve5WysQNO+pS1Nfjf5GaP2ICZO+ZsK8Jbjv06+EpbNQ1liaKpOpcYgsaxhLHr0DVQnx1ocDu02RGIdZplPWYGSz4Mxqf2+TB6/CIwpuBbkmIeeTTR47bryV0A9hKy5SEE75PgRYpfH84nUfZlFI3cbR3D/hVy+AkTtrFPVe6LUaT90C5zrzAknzCzqyiO6It1G2CXakdyiXUNhzuRZtDo4hmHbnvWhIhcx9SvSZD+FvQUHk7UOOhjjixefBr56TTgEi8x3nBpdftAUJ/bWnEDci3TwMEK73I29MBzQcWIgxAnl7MVm+SzzndTRdjwVIwIsbuIovS01o9ObhmqDL9ZA+Xm/IRl+7O3fC6Iuoqh/gxfU+nQrIqD/kU/UmFvjo3OW5XmlgGWU4YMsinSP7G49Cjo9Qr7VMjv16GP/Wt2KHANe/81UrQqqOq39pleXa+1QJYeIn9zM7+pf24KDPFwI6QmuO9ZTdoh7Z3EQCMeK442IDqBdsxpgODDRIDd0Tp+PY7hvkP0rzib53E0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(38070700005)(186003)(6916009)(38100700002)(8936002)(66946007)(2616005)(2906002)(36756003)(5660300002)(33656002)(66556008)(64756008)(6486002)(8676002)(41300700001)(66476007)(478600001)(26005)(53546011)(76116006)(6512007)(66446008)(6506007)(71200400001)(54906003)(4326008)(122000001)(91956017)(86362001)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6E865206FAE20442A9E37BD791D1C949@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2485
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	353f8962-e870-4747-2bd1-08da65a939be
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UDUEJ3XeN+zxzvQq0GZ9CDNAHB3D6j7I0wGn4QQO6+3dL4Bh1WP5Q9APGAOphjKp5/aVRbouqEXBM6kFkzxzEBqmzQfz10dd16HUEhEHh5v8O4RlBB0f52mJlucpHs4OhyvWRsrWEKdmrWf72153ibLD4B/FYUItlzbkUfPaBV3OOMUMTgLT5udDRXAnHdSwNKxS44WaHInV7fkkQ52qD4tQwzkolXlNnd4qd3KshKTATt62014mpug9U8KiRk6GYXx9q5cXxtEAoQexnBrtjZngD7++YISUhXl9/AgapV3tMRUAGfTXA2dacrAwKo+o60WM+4eFJrkAS+f9U/sI21Ixojp3YHBeY11N1t6Yv7vUq6s1w+qPlZoJJmRFQIck8zC1C27xVJCGX1eKEvwz2hWHBf2KHxJkKzreN+RtdTBZVk7LmRmo7MaYSYdwTz9HeoKOsbhcdy7ax0hH91PtjlFSOdynr281Ri+lrlReRhSq9fBQSeoQuqJmRMuDPq2Zp5e0b0WW2yXwLqBxARyWYVh8cP9j+8p+28xijlIjuS49Oud2TluNRseEMiquCWBhC+FkmLfURFaICQid5omx/rIciFQeZ6+dFZTQOwFw3wDvfHGyFtMGrxCLY2Fy8u+vzCfKg3k2HGC9FVZzE+P9tzNMgXEruhdYOTmaNrR4YYdxyRlgNF4JggL6w1PkYkQaPZ0ZpGYRJbRbFX+Es3osjLpz6PHmRrduqkoia+L3tPzY8tyyNOgWd6y3g6tZ34Q6VURQXvCa/kyWRXp48LXlXuPFCaj7F2DZ7MzZGI9fB9VFQwI21ebJK9XM52/TkjE4
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(396003)(376002)(136003)(36840700001)(40470700004)(46966006)(36860700001)(186003)(336012)(36756003)(82740400003)(4326008)(47076005)(316002)(2616005)(81166007)(356005)(8676002)(70206006)(26005)(5660300002)(6486002)(54906003)(6512007)(41300700001)(6862004)(70586007)(86362001)(478600001)(82310400005)(33656002)(53546011)(40460700003)(8936002)(40480700001)(2906002)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 14:58:05.8318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 541855fe-7a50-433f-8eae-08da65a9420e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2121

Hi Anthony,

> On 14 Jul 2022, at 15:39, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> check-endbr.sh works well with gawk, but fails with mawk. The produced
> $ALL file is smaller, it is missing 0x$vma_lo on every line. On mawk,
> int(0x2A) just produce 0, instead of the expected value.
>=20
> The use of hexadecimal-constant in awk is an optional part of the
> posix spec, and mawk doesn't seems to implemented.
>=20
> There is a way to convert an hexadecimal to a number be putting it in
> a string, and awk as I understand is supposed to use strtod() to
> convert the string to a number when needed. The expression
> 'int("0x15") + 21' would produce the expected value in `mawk` but now
> `gawk` won't convert the string to a number unless we use the option
> "--non-decimal-data".
>=20
> So let's convert the hexadecimal number before using it in the awk
> script. The shell as no issue with dealing with hexadecimal-constant
> so we'll simply use the expression "$(( 0x15 ))" to convert the value
> before using it in awk.
>=20
> Fixes: 4d037425dc ("x86: Build check for embedded endbr64 instructions")
> Reported-by: Luca Fancellu <Luca.Fancellu@arm.com>
> Reported-by: Mathieu Tarral <mathieu.tarral@protonmail.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Very nice solution

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


