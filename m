Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F765EB732
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 03:50:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412169.655376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oczjQ-00012n-98; Tue, 27 Sep 2022 01:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412169.655376; Tue, 27 Sep 2022 01:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oczjQ-00010G-6E; Tue, 27 Sep 2022 01:49:56 +0000
Received: by outflank-mailman (input) for mailman id 412169;
 Tue, 27 Sep 2022 01:49:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/4/=Z6=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oczjP-00010A-1v
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 01:49:55 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10081.outbound.protection.outlook.com [40.107.1.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae31be35-3e06-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 03:49:53 +0200 (CEST)
Received: from AS8PR04CA0015.eurprd04.prod.outlook.com (2603:10a6:20b:310::20)
 by AS8PR08MB8223.eurprd08.prod.outlook.com (2603:10a6:20b:52b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 01:49:51 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::fd) by AS8PR04CA0015.outlook.office365.com
 (2603:10a6:20b:310::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Tue, 27 Sep 2022 01:49:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 01:49:51 +0000
Received: ("Tessian outbound 8ec96648b960:v124");
 Tue, 27 Sep 2022 01:49:50 +0000
Received: from f9298ada8ef8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2A9A4E8E-43D3-4D83-9A71-D3F081C97B00.1; 
 Tue, 27 Sep 2022 01:49:45 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f9298ada8ef8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 27 Sep 2022 01:49:45 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GVXPR08MB7872.eurprd08.prod.outlook.com (2603:10a6:150:16::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 01:49:43 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a%3]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 01:49:42 +0000
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
X-Inumbo-ID: ae31be35-3e06-11ed-9648-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NWC2olTO/iyM7lWUWz4w3PC1GaGJ/HEXPBWSyCieavFP/AKcG5YlKuY4BDNtjLUOELvGzfGhbHr2NIjgLZhSN4LAlwywfU1Iv3Y4f1+/gxxNaEdgc1W4+icUTo4PFpzhp2pB6CaLpBSuRLQIisLWnqnHebIQAKxNSVitBWMeqXIe2Uu7Mbse8AZyA49kWx37VZQB/UspfBoKpLPhnxk5Ru++lR2jjxyORjUAfChlO0ro7+MXn1zNsRbotKcFli5ANpmTjmvT1PBAfYyO9HGR/ME4I+lxX+fGof8+gpZ2ULgcFFKlk/JX/CwSiRHfrVPiMGPvYteG3+IRnOe+Ydhpqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3wjqcNDCIcJvgOZcpLcs6HABF3QSqYH4aT6aCpftUc=;
 b=PMxgB7jOLAd2h9dTGUehSLzS0AFD6hNSSztKxiNOwdFgEhAq9S+QDJ86gPucCcpr+EO+Pc/7D2/WHG7haXtGPjNBFgyOQrlDaqYKDm4BKTS67MPfDG0dL+sE8Y2tKL3K6PVYvRkkugaptI67m8I7aRGkZIPCYrax7KHUcDjluho6EHQ4ujd69qHYduKi5GE7GVoZ/b+okMgO+1ZXAsuvPNnyrivjKKn5F12OEO51pJIYrkOY6Q7jPWSxVOV3KMW2rY20ftmdGXLRJ3ev8tys0zhcqoGyOcCGIU7dHcay5fthGcFWoqjj1HqRPgyCZ76sAbsxq5chlR0PIc7Q7blKeQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3wjqcNDCIcJvgOZcpLcs6HABF3QSqYH4aT6aCpftUc=;
 b=pQnoU92EQQjhZNvC/V2q3sdRNIzbkFeYma9iCqnHkv63CA2pKV/wMZ6cOloD9iJepLSeZKL7l2gDOEFdwkQcBEg4k4aIsOrv/4SrFvbOgMd+BfoNPvVpwrLWgkufrBuWxh/4VXm4mZH84hfxU3OWfAhfYM0UD4rlQpPkr7WrgHY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4jhjOHhJcARcD6MhnnX+X30v4BmzKBzgViKU3rDEsHY75nCW1QA8Xr5UrtmQwJwc9RwFBCDoFMhYCgBhFecMFmz2b3UCTr0wI6kPlgqkZmCoAY7UXC+kB2UMidT0pH44VIWqEJGCGl/rELEKUC8dNGIpJhWKed8uQfgT5bD9dI2LtSANVyjLsYCYqvMXT9fVr3Ct4dTEmk84il6BWCQ0SBg8BwKyKZ4q6UGmD7BkLCm1g7beVJS0PeW6GsSQHMrh1lKQhOXaEhTw3esHQS05x9HZw54aTlA9k1ZeCfVDKrtRe8gyoe/KvJS+8zNd409gU71gDR1pokcA07RnH8JoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3wjqcNDCIcJvgOZcpLcs6HABF3QSqYH4aT6aCpftUc=;
 b=epKsWuoofdnJ4bsiGeUzDKVBdICGQw/NkHaVEx1Qs0FFMXlWF8PGTP6BKu+ibZj33zN3hAD6YGVPpViha/qvMwrXtXDiKLzjzk2ffPuV8QZ3DYtkfrqe7/Dtv1Dr24Q0+IFTwm2nR4yo2SWKoWlIyk38LY2s56Uc3U7ICZwcQ7YVYbpfPpWVxhg3775Iv4AFW1L4vXdaVdSqQ4CKgJGJB6TwTtGbRioZlfSMBQdpPrtkQL0IIqmqHnSXtB5kDmEgZGUGEgJCj9AHQ/8lvOm4gw/LSmYCSHC/htKcOc4bi4r06wTYhnFx8XM2fnGXGIXkF1UAACguJdmFVi9kjDnabQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3wjqcNDCIcJvgOZcpLcs6HABF3QSqYH4aT6aCpftUc=;
 b=pQnoU92EQQjhZNvC/V2q3sdRNIzbkFeYma9iCqnHkv63CA2pKV/wMZ6cOloD9iJepLSeZKL7l2gDOEFdwkQcBEg4k4aIsOrv/4SrFvbOgMd+BfoNPvVpwrLWgkufrBuWxh/4VXm4mZH84hfxU3OWfAhfYM0UD4rlQpPkr7WrgHY=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: RE: [PATCH for-4.17] CI: Force CONFIG_XEN_IBT in the buster-gcc-ibt
 test
Thread-Topic: [PATCH for-4.17] CI: Force CONFIG_XEN_IBT in the buster-gcc-ibt
 test
Thread-Index: AQHY0ahd1Yel1Id/NEGTK5JNVyLiZa3ygvuw
Date: Tue, 27 Sep 2022 01:49:42 +0000
Message-ID:
 <AS8PR08MB7991DF055DF1CC2BCCA463E892559@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220926130213.28274-1-andrew.cooper3@citrix.com>
In-Reply-To: <20220926130213.28274-1-andrew.cooper3@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 39DB677A3199D944B37E1F3AE36FC184.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GVXPR08MB7872:EE_|VE1EUR03FT025:EE_|AS8PR08MB8223:EE_
X-MS-Office365-Filtering-Correlation-Id: cdc68ce2-ec2f-44d9-9e47-08daa02a915d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1oPbBrW6s4TsXuULldVFTCB0+QvVu/YRe6XAw+WsY0I0XjmJKMsh3wSaPVtlbfrNhnQxVmLNnQVaHO9eJGwcmwbBo+2ylDKMhxsg6yMahN3+5S81JJtKPaD2ExjGAoYv/LDcfanuXoNqQufEzPmfFSrQh6M3Y9z5+JnBdjoTKq+qMWEOGpM+P6joPO4Fb4WmI4CxtvueK3SsRqflAOCWJEyW5k8jtXgArXmcMGXRM5HYa/osWi6TQFbvhrqIKc3RI/kXajip4rAHpq8qlv9too04LECgRObHRCNVjD5y4tUm1sGtbre8Hsahk8mfzbPK6m8kfl4iuvdm+Uvx8AH+PmLKtpbpZRBaafI51z8JEGOWqA8dswYQEXdZy/YIIBDpT42ypWi4jXWyH8yhyrQSZmW5DpqxnsINugRX/5tAOezL8g/x5U6PoENX+8s9IvyMWldK12SIwZJEpeUWyT13VEQcMwuCkxCmShPW29Ia4QKxk1EbibgVcdjgjmjF4qxBD0fbnls+C443huzM+v0ilcP1MICwwjtR5FMCtdH7eQ0Ab+6ldfi2DTT/V5XW/nWWRXFtXxPDgf6MgtNdmKiQwXWjMnACe7Cj/dY5R1HVPke98JEBdkqi06fkGm440lZdPnyrjpNQdxW4JyJXJr8OQD86k897jzHzdFT4wUaJXgMEd1pyvTKvWi5iypW1Sw5GWYbtPSGWg1rvDGmnyg93iaK8z4Rq5oHTSCFdD7aYG8WapGoUUlgkwnEbXimadChz3fFKwjlM2BDMkf94OYLom5HAGk7oMuqpjCASJks+v/w=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(451199015)(83380400001)(55016003)(110136005)(86362001)(38100700002)(33656002)(52536014)(9686003)(76116006)(66476007)(38070700005)(66556008)(2906002)(64756008)(8936002)(122000001)(66946007)(5660300002)(4326008)(8676002)(66446008)(6506007)(316002)(26005)(54906003)(7696005)(186003)(71200400001)(478600001)(41300700001)(966005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7872
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	73082b8d-1690-4017-45ab-08daa02a8c4f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uJjy1kJssBZncingO19caHZJVNO90T1n99xXyl0hdF5Tq4/e5poKIaCGbdgJJotcR0s2AOfF8PO0+8Qs6aqRS9aT7DlcIJyPH/YeIA8aPo8QrJU2FkqoxqwyicJsoGKpR8nkRL1y5dGtEEOYX/OoGCN59ZfVRxL/vivdGFW5vLUXsypu6xe9fIK+sHiQCn8hjGokLnvg/6obyyWqioCb8lkY6FnacRpznU/yhYg9Sx9iz/2cu2U7TWY3hRkPvFwcBLQ4D9Tezq8iX8Mkph/q9jdLeaDMnmEVqWn8Mm0sDzpVJ7oS7Wua7nqXMvYLRCSSoi7z1zDDP8FViRfzElczG4BFLb4L/+F1lECqMZxxVwR6+4YYAiz9c7igm83QvLbkMgthXgzRjy6y19FShb+p6CsncSZxzMIZ6KWaD21720RXC/3IN72b99odZV88TAKsPy6yH31hBRLaMi7dkQgDq6msy4lZ4z+xSAyXr35cs/gNtL3ktWUouccFkOYYleL80+7/zl+82mQTsMtcnqMBeEzeL0e5VlsGDj/9VjzRrSIeJzdjzlqRpjyTqUW2bAOsykZpwiQrfDeNshx1x4PkpEL47bxwLNttzYZtBMVFGFKxEyiPJXl+yYhZ2bMEbNNXhTIbmZ+Sax1iMQBV/FMruwtCpfhS9mSEUUWj27zZMtFf944XVNCb8b8a6imqztHlpXS6kMaXaYV/ZZ+vcmRKdYkDERu4P48zHXhrb2kzVzEuhVWVEhupXUGzdQGX6xfJcPMYFAzmB141eqgT2hggrJyc8Rzp5OnnCWm0ZN7Hk5A=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(5660300002)(52536014)(8936002)(33656002)(70586007)(70206006)(966005)(478600001)(8676002)(4326008)(107886003)(41300700001)(36860700001)(40460700003)(110136005)(54906003)(316002)(55016003)(40480700001)(6506007)(7696005)(82310400005)(86362001)(81166007)(26005)(9686003)(83380400001)(2906002)(186003)(47076005)(82740400003)(336012)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 01:49:51.3155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc68ce2-ec2f-44d9-9e47-08daa02a915d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8223

Hi Andrew,

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Subject: [PATCH for-4.17] CI: Force CONFIG_XEN_IBT in the buster-gcc-ibt =
test
>=20
> buster-gcc-ibt is a dedicated test to run a not-yet-upstreamed compiler p=
atch
> which is relevant to CONFIG_XEN_IBT in 4.17 and later.
>=20
> Force it on, rather than having 50% of the jobs not testing what they're
> supposed to be testing.
>=20
> Fixes: 5d59421815d5 ("x86: Use control flow typechecking where possible")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Henry Wang <Henry.Wang@arm.com>
>=20
> For 4.17: This is bugfix to CI only, to avoid it producing a false negati=
ve.
> Currently, the test intermittently fails to spot the error it was intende=
d to
> identify.  It is very low risk as far as the 4.17 release goes.
>=20
> https://gitlab.com/xen-project/people/andyhhp/xen/-
> /jobs/3084774561#L373 for
> proof that CONFIG_XEN_IBT=3Dy is being fed into allrandom.config

Thanks for sending this patch!

I agree that considering this patch to 4.17 is low risk, and as long as
this patch is properly reviewed by CI maintainers, you can have my:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


