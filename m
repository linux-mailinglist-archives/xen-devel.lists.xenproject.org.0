Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E1757E2E6
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 16:16:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373272.605379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEtRf-0006iq-6h; Fri, 22 Jul 2022 14:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373272.605379; Fri, 22 Jul 2022 14:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEtRf-0006gF-3q; Fri, 22 Jul 2022 14:15:59 +0000
Received: by outflank-mailman (input) for mailman id 373272;
 Fri, 22 Jul 2022 14:15:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sdc0=X3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oEtRd-0006g9-3M
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 14:15:57 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00065.outbound.protection.outlook.com [40.107.0.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd167310-09c8-11ed-bd2d-47488cf2e6aa;
 Fri, 22 Jul 2022 16:15:56 +0200 (CEST)
Received: from FR3P281CA0063.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::13)
 by AM0PR08MB4209.eurprd08.prod.outlook.com (2603:10a6:208:10c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Fri, 22 Jul
 2022 14:15:53 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4b:cafe::7) by FR3P281CA0063.outlook.office365.com
 (2603:10a6:d10:4b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.14 via Frontend
 Transport; Fri, 22 Jul 2022 14:15:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Fri, 22 Jul 2022 14:15:52 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Fri, 22 Jul 2022 14:15:51 +0000
Received: from a41c43fa236f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D428F4FE-2C6A-47CB-A864-DA1CDE98A1FB.1; 
 Fri, 22 Jul 2022 14:15:45 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a41c43fa236f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 22 Jul 2022 14:15:45 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by VI1PR08MB5437.eurprd08.prod.outlook.com (2603:10a6:803:13d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 14:15:42 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5458.019; Fri, 22 Jul 2022
 14:15:42 +0000
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
X-Inumbo-ID: cd167310-09c8-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=h6Bydq6sIk/2FZUSh/SYmrHQL1UAQRGGRVHVfPO6xf7gbatzu9j3/dgETounVhGOPdfMLBaTJ6n+sI0WEwLUlbljhNkUNPZ8H2foai+pXmzshOl5jP0rDa6ShzpecEMkCg1JNg2a7NaVcryDs90vfeyAmu6DnKwzsCXUGjYF7K6cUSDMMSCJiwSQB39DVGnu0n9xqQ2ta/Sx1Lt2SAwbqriqtz6sEDg8O6HTeko8+5wm5jy2WP7yK14c0vwj4tX3wYQTHF2C5j7bTR1iCIkR3Q7nHluQPA4unxMCC+D5zdZhliV+ISBiKk8BCbAC7y2Yy/n/94dwdT9WpK/G5Uj8BQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tHtpbGJkU4h9FCTOiG+Z7bDDA/CF1i+cP4q3c8efRU=;
 b=m+xMNvrhgJqtIy3ciukPU1uC5+6PJkzx64VAdxzu+EHU9r9EA5JMSpjUi/JiJQSqQyh7OzAI6hTrCE6i+KQkapiQw5W5baZt+diYyeeLIrRCucLeb4XT9Tv4ypffPX2p35Ry4DeXkTQtRM5OgUVvIACgUkzIgo1IByhzud8tFb6P3stY7jFaAJ/FOkje3/0pfX6zx4RbRhwWYctAMG4cDWFKzdfZuYDHjeIENrFcaQBdNyF4LkYwe9AqC0ofgOBxldAyuUU2gTZ9qjK3NLIQ5s63CBgO1hLgsBuHDEKpa3IBm+mmeavLqtHIq3kBdqQOOdvFS0CqWfI8toF4EQBSyQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tHtpbGJkU4h9FCTOiG+Z7bDDA/CF1i+cP4q3c8efRU=;
 b=sIPgXV4OnVuKQtZnIKyRYSs+EQluSo7MI8ptNeQo00WW2JX6FcmrS8HZv755+FL5Z5lA2NDfDQwF8IiYjtofayQ8q2P7+BJSF5ym/O8T/1D2YQIAXGtGUfrsYMNuWnYjG0m/5MEb/ITAliW+mKO8Mxye3GOswlsfDGJ3gj6/mjg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 620a799ab8d25c4d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3qI+mATLSsPtGDvAFpndTTco4avfJ0xXQ+UdjDK914IkQgqS9zJEQRe2NkhMiRxT8Ho5gXw6DGp7ZxXLwUcd1CLoUyB/zuF6qUwlWOdPx9PyLxNfJghpL0Yglz23yWdeADXe80Gt6ZGDqlUJPl3LVAFunyBfbSar/kuVP2Fv3hqFjFN4TRw6sN2K2xtM5TXT+mCNA0ifit46GuIJFG683Yl7VPimu1barg7vsyBnqsCabjOtrnbMw+BjAGpXKXNFgJavmqsewTxGViUj9NXhVgg88hn++8omvaOnUTr1vBXawSOhKCqGArllwohAi4/OKuqFS3jeK5U7/M985+FIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tHtpbGJkU4h9FCTOiG+Z7bDDA/CF1i+cP4q3c8efRU=;
 b=U8cLSnUbf+Iu/MxRuQ7HIHoPccB3yy5QQ5Gxoyy2iQ6dKkrD6TDY7uioV6QfeHQJIo9vqGV0tblYywcQlkuOnyU0kTgx5lQMo1L4uUD1YvvSbToEulyWoVn9pUsR42YqxYPNiLmpQu8T7E7byrnhmCW5f/tW/BQwk2BwSOU/oDjmXRqHTpiT4dG/5/TeC4xqkWsMS8VkceIa/Ahc+KWE/fL/V6wHvp/mAqcCBNBYwoWyaCDFTuE/s7pFknn0CQqH6TFc6D2ZavVUBepdQmvGmpaeSKXrmZLIQDkCSFn0CE16FYtjSb8qp4fRcAN9+7f/Ig/z3jhXFBUPD2L8qYISHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tHtpbGJkU4h9FCTOiG+Z7bDDA/CF1i+cP4q3c8efRU=;
 b=sIPgXV4OnVuKQtZnIKyRYSs+EQluSo7MI8ptNeQo00WW2JX6FcmrS8HZv755+FL5Z5lA2NDfDQwF8IiYjtofayQ8q2P7+BJSF5ym/O8T/1D2YQIAXGtGUfrsYMNuWnYjG0m/5MEb/ITAliW+mKO8Mxye3GOswlsfDGJ3gj6/mjg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH v3 22/25] tools/console: Use $(xenlibs-ldlibs,)
Thread-Topic: [XEN PATCH v3 22/25] tools/console: Use $(xenlibs-ldlibs,)
Thread-Index: AQHYh+SsviFG70C+5ESE8GdSE6k7yq2Km0KA
Date: Fri, 22 Jul 2022 14:15:42 +0000
Message-ID: <2C041D8E-96F2-472D-9EFD-78CB0ED3CFE5@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-23-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-23-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d2891a99-bd72-4cb6-c4d4-08da6becaf3b
x-ms-traffictypediagnostic:
	VI1PR08MB5437:EE_|VE1EUR03FT041:EE_|AM0PR08MB4209:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 n8MVjy0RZhmgBKkTr4ydzgCUDr48N4/60WI6ZAywKPlANimYxR2uyEMCYoeVBcVkm/Lvpp5Lh0uMZL7/gS3sGlI0op9xxHKxyaTY5NgFUbvu+vEmmCdH+4WrKTsTbYDk928lkUtszl+Od/4G73xKvd0bLv7Nm+h1R0KJgPec/3dLm6DQlFW4EhCckhitsNBwjnm3/w0rN5gYd57i7CETDy2/HiwAaf2cEuDUqocUa/js+GYieFXlKoQAQL08hAwOEVvSwi3kUWiOTMVROJfLvbpPrCrKpfNqN7i/+QMQQRymxtfzt/rzAZIaBZKFfiVbGdMW9Crv1gf3heu1bUjcQABhGhnY7cdMas6F031WjJw7NEBEn6yIox2GSNZHNAjTxdSQzPa2VlO+CdIineDwCp37MuR4OaqhdnoGZBTibXEdnPNjcOjnXnPC0sd4zoqXUojIglrRi7DgnJKeHz393SHDMPbdkXvannj9o4iTUKnYszIGVAYuEsGi2l4rlfWe4fvXhDb8nNwRvnCuEHVR6aQ3FzEVgK/vL2Qrf2sgePz8MGsI+cFlSb+KyPhuxYqlwqUbNn07veUVfwIrAETABFBNkVXIHPj06Tou8Ok+t/YaeVwJ303Qn+3TOBK2bsDseOcQoDZPkiowD6NAWYFlGQ1Gv5NbOQlHOxor1ttyEi578Lf2sLjMPzqo4FEh/NMXht3qoBMwnLuDk4oQAhKa2q+rmpGAhQZ59Dfarp/H8VVuU3OnwYvXCrLeN+ytc7Ao+2Lly8Z3/Pqt2suvyIsD5TSTMVD2JznA+cSfPjSIKQTP/Vbty3hHoM3C90TdG6ubyuzFVBy50RnHA+NJV14YSA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(316002)(71200400001)(33656002)(6916009)(558084003)(54906003)(6506007)(6486002)(478600001)(2616005)(53546011)(26005)(41300700001)(8936002)(86362001)(2906002)(5660300002)(91956017)(8676002)(66946007)(4326008)(66556008)(76116006)(186003)(122000001)(38100700002)(83380400001)(36756003)(64756008)(38070700005)(66476007)(6512007)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B441CE40BA60E24EAD06662E81EE0182@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5437
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	48d071e3-97dd-42c1-cb9e-08da6beca964
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PQL2oqk4OHI6kZgHRpPrlq2k+FIWMDwLPFSEj2Jn7gPfhGUBEthBjXbaZjUjPRWrOo/tXaUIfBDrXiNTjTc8Nd4639juvpuSpQOeeWj5zPtRjrPZYTsVklTwf5keRqYI8sbAB0z79bclJGndFLZuvhP/DoQS5KLcGrf+eTFjtySB9iBuWj25Y4Fq1+7YkqWpWl8NHsv4m/8O4SDy1HRx/CjIOy4L+mX6ifvRCfAgjLlE8ut1aGoNZKbsraybqTgwjUVDnuHff1eKfxpYKrVjgznhtwT9Jy42sE6WSEdnFgMrRrNWhMmI/NNUiSIrL8o1kvyZzZD0U9aHKkcbybr93tRWXE4tgav0QSg0PFWnjEfgXQPr1U23ugAdYQHKinwpuuSM1ERlsLu7Feh38zo4Yv6h1JlTd/FgOKky9oIHATv3miTLP1U/ucayxGhXmEdazNx51HVpqXjIJEif8Tw/sJGF97ZAR1vvkg0V7SRFnoXFKdsMD5Uy96va+HfGGJPnU6SwNVugVeXQUR1fwCToT8MKV9N0mP6GeDQvzMtgrq/R69BRwHBDtwTN+cKJeho0++6QDxijPiwDBjYPdZyHViWBEb2BBkD+sLG/gbClbmU9Qa/F/7jCrsYYaPIkh2TAoAL08W+xj6Xj0QvYhGaXSYgJ8inm6r2vkyOYx5qa02sRJmYbEPIsHang4rDn3rl9NGNxAV3JG00nEddWcTRgZ1C+5vSyN+/CGhQoAABbJ92XmcgCYSs1CmcGjmp/rELy+Tb6jj62XiECco4SfXSy8OfnCEQt9GAvrMCMTgIkBedMNiPxUTVDv/+YkfS9GB0r
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(136003)(346002)(36840700001)(40470700004)(46966006)(26005)(2906002)(4326008)(6512007)(2616005)(41300700001)(558084003)(6506007)(478600001)(70586007)(5660300002)(6486002)(86362001)(82740400003)(356005)(8936002)(82310400005)(6862004)(53546011)(186003)(336012)(83380400001)(40480700001)(36860700001)(40460700003)(33656002)(316002)(47076005)(54906003)(8676002)(36756003)(70206006)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 14:15:52.1636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2891a99-bd72-4cb6-c4d4-08da6becaf3b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4209

DQoNCj4gT24gMjQgSnVuIDIwMjIsIGF0IDE3OjA0LCBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KDQpJdCB3b3VsZG7igJl0IGh1cnQgc29tZXRo
aW5nIGFzIGNvbW1pdCBtZXNzYWdlIDopIA0KDQo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KDQpJbiBhbnkgY2FzZSB0aGUgcGF0Y2gg
bG9va3MgZ29vZDoNCg0KUmV2aWV3ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVA
YXJtLmNvbT4NCg0K

