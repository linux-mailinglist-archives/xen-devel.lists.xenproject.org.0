Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A534B3F9708
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 11:32:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173539.316636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJYDL-0007SG-Al; Fri, 27 Aug 2021 09:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173539.316636; Fri, 27 Aug 2021 09:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJYDL-0007QT-6O; Fri, 27 Aug 2021 09:31:55 +0000
Received: by outflank-mailman (input) for mailman id 173539;
 Fri, 27 Aug 2021 09:31:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zv0+=NS=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJYDJ-0007QG-G5
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 09:31:53 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.83]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9bf432b6-0719-11ec-aa9a-12813bfff9fa;
 Fri, 27 Aug 2021 09:31:51 +0000 (UTC)
Received: from AM6PR0502CA0059.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::36) by AM0PR08MB4290.eurprd08.prod.outlook.com
 (2603:10a6:208:138::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Fri, 27 Aug
 2021 09:31:48 +0000
Received: from AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::81) by AM6PR0502CA0059.outlook.office365.com
 (2603:10a6:20b:56::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Fri, 27 Aug 2021 09:31:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT034.mail.protection.outlook.com (10.152.16.81) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 09:31:48 +0000
Received: ("Tessian outbound 1a0c40aa17d8:v103");
 Fri, 27 Aug 2021 09:31:48 +0000
Received: from 40f62dc0206e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2DF1ABF6-D0FC-4A6A-8BE5-02B9B9B44E96.1; 
 Fri, 27 Aug 2021 09:31:39 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 40f62dc0206e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 27 Aug 2021 09:31:39 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB6PR0801MB1766.eurprd08.prod.outlook.com (2603:10a6:4:3c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Fri, 27 Aug
 2021 09:31:35 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Fri, 27 Aug 2021
 09:31:35 +0000
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
X-Inumbo-ID: 9bf432b6-0719-11ec-aa9a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sv9ag1hS+yBaf9fPu0LBg///Aaco6MlTmDq/11RA2Mk=;
 b=2u0BFryY3P0WiHcUmO+FzntnajNxcSA3rnJ2N3IA2q0yxS1/14L3Hvv21iRtwPcE5c9Fie7EY7hajwBmCcrLe+B9ydrdvYNoM6ycDihT6xuPNCH33Ij5HY4ZgI8lhAgoTEPg4TpSUQmCz8MMIalATvRP/uC3a1e6p2Pk7Kgc+f8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Du4XMac0rmjwon5BxSfTHkHwBOc+CFXKQlXw/fX7LWb0vJMKtVRn6TZ3jKmQkqSenRH61XPp6QjvmPkoKPo6LASxNQuQFksGr1MsdlLl4fjQegAtgzhN7Yc7t7D+7g/mAcDyhEX4qhVmBKtbdHnH0NfR88WuA+igcLpMsqcieufzcpda0YJTUb7RCzzH/yzNwjO6xV5CGJE1umbI94a2n0iBl6tpUukLN8wtwhXlgY2zq3Bat8Dp8pOc3+ZK27OcpU/0YtWDvbC3Dzi3KUJlr5YQBRqQBBURDwmqNMer2UGF5CGDyfriOej8eiR5j6GL2T5zNpEP40w2bUtBG9lycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sv9ag1hS+yBaf9fPu0LBg///Aaco6MlTmDq/11RA2Mk=;
 b=i3ZrAfdwdrVVIXqVtqmHM8WA5gndbq2/0bfFBJZiF9jk2I42vF3/CV51Mr/3DikdXZ716keU3neZ0P9ueDXo4pwKTfydCZBB/Cg65KYQrjNvOP7a5/rpkgqA+ao3r77yLhN9S4A5xTXdj4VTh59VVIv2X95fTNqXLbmPkzQAJknnqdZncdT0wrOtShU60dnf5gaDH+8Hrlz7JACZBBmpase6UijqGCHXpK2YWl6dsFTN0Gxd4Orp79Nym+CgAqIMzgsTTFH6McWRX9jOwmXGlfppHAay7w5ODWkqUcgPqyNhNGlov7lPWF66BqKeGcbxzclhi7vCY1kmHo64AkljlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sv9ag1hS+yBaf9fPu0LBg///Aaco6MlTmDq/11RA2Mk=;
 b=2u0BFryY3P0WiHcUmO+FzntnajNxcSA3rnJ2N3IA2q0yxS1/14L3Hvv21iRtwPcE5c9Fie7EY7hajwBmCcrLe+B9ydrdvYNoM6ycDihT6xuPNCH33Ij5HY4ZgI8lhAgoTEPg4TpSUQmCz8MMIalATvRP/uC3a1e6p2Pk7Kgc+f8=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 22/40] xen/arm: introduce a helper to parse device
 tree processor node
Thread-Topic: [XEN RFC PATCH 22/40] xen/arm: introduce a helper to parse
 device tree processor node
Thread-Index: AQHXjps9W9pBfq916EKAfG5ObJRyjauGkX+AgACdvkA=
Date: Fri, 27 Aug 2021 09:31:35 +0000
Message-ID:
 <DB9PR08MB68571F27665D639E0422F2119EC89@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-23-wei.chen@arm.com>
 <alpine.DEB.2.21.2108261705000.24433@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2108261705000.24433@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C08266D106666F438B5B80D881014A5C.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e6cb0912-7417-4d76-bbed-08d9693d7e9b
x-ms-traffictypediagnostic: DB6PR0801MB1766:|AM0PR08MB4290:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB42904794858CA01CA48C37339EC89@AM0PR08MB4290.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FBj8wMpunnwZWCfeS+gGqyZo6DId0ltyGMLYZ77jZJdVjr+t3fMb+ByAOfnEXvkwBHWzplODySibrIurHu6Z94KNF7gVnuKmXRr9z6w0u83bzgAfUpjzFearMYI3m3NpKb3Qj+h1AHLyc4rbRBvksqWN23yGi6MwrNKijTxfY1Ak9DeXwKXitrJdtVDQagHvt5T4/AoXlXb4M0LHCcFUtN5Z1O0UYUK2yS6b7k1rIYVRB4JbXXcyPNXa0L76v+P+dTZCeinfpyDGLaIglRETArlTQiL+6qtZ+XitNz3gQXMQb98bdwj1UkpAvZN7c2UBWJg6cQ3c621x8nvrgarBTn/v+bC7RPRPCCfi1T6OxTedeL/eOQZsVj+3EmrHPDQ/EK4ifwcsK/Mvk/y03dhlFoSomxGUPQHr5wCqnTRQnkNYNDdE/GG9n/8v76eZb0T9diCUjMoa8VqD3TpXm/Yg4uMV/C4WDXG1xWO+9wm8Y7/XbMRSU6DluUQ6bcd/q95+fbGxFxAfE9jwmypjdKkb2EWd98U5jKYfPrb3Hqf+RDh6seHdRSlMxNgzHGBD7iCAyg5DRdcIxH6AqqquQYynP0C/M+tzFlb7hAA+v2mj8nUncGEzk5DLzNtLkZimabu2Z4QIn4aqwIBYpNKMLolhh+W2lyluZocsPMDf+VEveJPeIwPxRXA5xfJ8gg0BbW5gh1QSEEvprCp7hVSOs6gQPA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(54906003)(55016002)(6916009)(8936002)(186003)(71200400001)(53546011)(76116006)(2906002)(8676002)(6506007)(86362001)(26005)(4326008)(83380400001)(7696005)(66446008)(64756008)(66556008)(66476007)(9686003)(38100700002)(52536014)(508600001)(66946007)(122000001)(33656002)(5660300002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?RWNNMTZCRFZWb0NVWXJxcnNSdGplMFNpRjI1OGUxc2JwTXFGRTZnWElWbVh4?=
 =?gb2312?B?RzRHcGtNRDVBeGJVWDF2L1JFNW1hZDdUcmlDM2hvZzZxM1RrNTFlQjkvTllN?=
 =?gb2312?B?WXFBdnVtK1RWZXpJb2t6c2Y1SEF1Ykp6RHRUeWlEcndJV3g2SmE3UzRPMWJE?=
 =?gb2312?B?aURSS2RQekUvWUZqL1JPdUJZbEdoNXlYNmllaGs1M0lLUXk4QmNJU0piUyt5?=
 =?gb2312?B?QVJJS3FYanh2YkdaTW1pTXVGSzUwcTRTNU1uWnVKbHRkcjdaNE9JOGYrLzcv?=
 =?gb2312?B?aG9ZZ21VQXNSNWZrOVFHYWhCM2lvcmpSOG9iVGJlSUNIVVl4VkNGSml6ZDhz?=
 =?gb2312?B?aGx0VlRwMm45L2Q3TE8zc2kzZnhoMzZDK244K2lBaXlzM29BZ1Y4M04vajly?=
 =?gb2312?B?K0pZWjd6a0ZiSGo5VTdxdHNmWU5qckRYTElNdWRTTzMzcllDWStYQjJnN2lN?=
 =?gb2312?B?M0VBYjBCR2MycmhWNGdtNWtlMVowVHdyQkovcHY4VE13ZWkvRkliQ2t0anVP?=
 =?gb2312?B?WTd3amFkZGUvQ0cwY2lpRlVSR2JyNFRGOWFKRCtiM0NLRjltY3Y3c1pxcjEr?=
 =?gb2312?B?ZUFWRzNESGhjSjdRMlBUUVFvWWJ3T3NCcGYwN1pTSUc3MVoxc29vcW1yWTVo?=
 =?gb2312?B?SEdsT2xWRVYzLzBSNGFNc2E3ejFqcTFDY0xPelE4MmJjMkVUR2Q5TG5HNEN4?=
 =?gb2312?B?MlVjUmlNczl2OVJqTnRsMG5XNGJYRFFaaXhKT1NjQm1BaXpLZXJKakNoL01S?=
 =?gb2312?B?WUU1Q1Y2TzY4eUJHc1RZVlp1M1F1VlhnOEY5bkpQaHdrY3NWZ2dOVFlMSndT?=
 =?gb2312?B?V1U2dUx6ZVNPS0owdUlJQ1hMMW1yZ0JaVGUydkR0V1pMVmhoQzVLSG1EVkJH?=
 =?gb2312?B?bjRmWGwyK1BSNWRxUENvWG5IVk0vakpwM2ljTW42WnF3ZjZEanJpZk9IZ1N3?=
 =?gb2312?B?UnNPd3VZc0pzckgvNU9BL1J4V3RMUXpZTUNkWXBQQ1YrRVhNVm1Sd1FGeDhV?=
 =?gb2312?B?YlRMaGxyUUt5NTQ3RVBEOFByM2NNMytxazFMMUFXbTV2UStmOFR3TTFKeFly?=
 =?gb2312?B?V0dEdkFKVy9CYmhPV25oSmVjRUpqYnczMXhUMmNyR3RDT1R5ZVNLT293aERx?=
 =?gb2312?B?ODRFWmtFeWk5RldmdUx4QkhKT0RtMTh0WC9SbkVuYlFtK3ZraGZIVHNSRCt2?=
 =?gb2312?B?UzZTaHdWcDBUWWxMUzkxSzlaZFh5Q2xERzhIUzVVUjhVZk0xdlNpeFBRWVJy?=
 =?gb2312?B?dEQ1aUFGT2VCMk1HeGt3TFVHMHhnb2hwUHFIY25QVEg0ZTVEeTNmczBsWjNj?=
 =?gb2312?B?OU03d1dPOThpQ3FIaVp6VjIrWUcxYmVqMzZWYW9UVUdWdnJBM1kzNTh6eVd6?=
 =?gb2312?B?cWRtYitNZUpaMDBMeE1FbHNYMnZVMFl6ekNmeUkvRGRtbm5wSHB4V1U3OVdU?=
 =?gb2312?B?K1laZm5nNTdhNHU2TllwY2hka3FtUnVwVXdaVHJ4WVVMaTNmOTVsaFErWWVP?=
 =?gb2312?B?bXQrOHNYZ0ludDJWMFpKZ3RUREt5RUw4OERCNjdTS2NsU2c3VmtGTG5pa2Zj?=
 =?gb2312?B?dnFLTmR3Mkg0QVF3RTJwOWFSNFo0YVh5K3JZOWlvNmdKQmI2bGRTaTJJeVY0?=
 =?gb2312?B?YWt6ZDB0bTFuV2hydVN5Rm4rV2d0OHBxWHJLSmpEeXBIYXd2OXJDTW1VUDNp?=
 =?gb2312?B?U1NUMkdqOHVMUW9YWDJuVkwwVS9yMXlMMWZVMTV2RklPSkovUTc3MkNtY2Nh?=
 =?gb2312?Q?t0T8KUX0pnLcWi6ojxawrqhH2Zl/iXrAwvF773N?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1766
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ebf48208-cfe3-40df-81f5-08d9693d76f0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5DH2it6rfps1dGpql52i9cYjrQlw+TE1AkzMwG/WuRGKCwGmMB2GWi+j0GEl/vz62osgMUqWkjMS2QOFTugw+VmjM46YTsCBTbIfPX9GOdQZwMSsYrBa6YnGQRidqii4EhCcd3wJzk66tmP1wQizca0fluI278hF+74RdDBHJfvvcYkD69biGR5RXUC4jHmP5XPM8X2Qneo6Un1AogtXim4j3vKlGBmCKyzQxasHbarqxs3B/gaKNmsXB+0RuOmGLs6sBnFKZehiZ3yFEoyFl5k9JCnjb5Rh5RHwOfCOlW0+fPITjgXdele6ONIbMbMiAhoRqLn8iTYX+0V2DzuqCYVXGcgO7soVm/X5KzwLQWsjwh3ukqxd0T4IiZVy4+oeDxN2I/0YhyQKbfSlXfEbzqsSEZSN7dx9VjYgFmr5n7PHy7sXm/yffj/EHpxdeYu7JsJyES4S4zBvCDQhW4jY44YHI+wbr+6rYGfz2cVdnVfGHgyI5kA322iQBnT18zvR9NZezqEL11Tzdu2sdUmLLmtZd96ayy8Tw0qXzD4DDsH/O70DFZMcQioYQBAXuZ5+hlbbPRHaSyIHBTS8hutvsDsVZ2oqxjVzjPLTfkFlHYRTUmdp9Ir6XgCDoEIaTYbKtv40DNY1k2FkZYCzojC3qd1apDJfrd/bjwP4XSGR3EAwXaJzQHB2D2GVDl9/uTxSH8j/q7G2Wq+5x2ZM2DfQ8w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(46966006)(36840700001)(2906002)(8676002)(53546011)(33656002)(6506007)(9686003)(70586007)(86362001)(336012)(186003)(6862004)(54906003)(83380400001)(316002)(4326008)(7696005)(8936002)(47076005)(70206006)(26005)(356005)(36860700001)(478600001)(82740400003)(82310400003)(55016002)(5660300002)(81166007)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 09:31:48.7093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6cb0912-7417-4d76-bbed-08d9693d7e9b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4290

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jjU
wjI3yNUgODowNg0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGll
bkB4ZW4ub3JnOw0KPiBqYmV1bGljaEBzdXNlLmNvbTsgQmVydHJhbmQgTWFycXVpcyA8QmVydHJh
bmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMjIvNDBd
IHhlbi9hcm06IGludHJvZHVjZSBhIGhlbHBlciB0byBwYXJzZQ0KPiBkZXZpY2UgdHJlZSBwcm9j
ZXNzb3Igbm9kZQ0KPiANCj4gT24gV2VkLCAxMSBBdWcgMjAyMSwgV2VpIENoZW4gd3JvdGU6DQo+
ID4gUHJvY2Vzc29yIE5VTUEgSUQgaW5mb3JtYXRpb24gaXMgc3RvcmVkIGluIGRldmljZSB0cmVl
J3MgcHJvY2Vzc29yDQo+ID4gbm9kZSBhcyAibnVtYS1ub2RlLWlkIi4gV2UgbmVlZCBhIG5ldyBo
ZWxwZXIgdG8gcGFyc2UgdGhpcyBJRCBmcm9tDQo+ID4gcHJvY2Vzc29yIG5vZGUuIElmIHdlIGdl
dCB0aGlzIElEIGZyb20gcHJvY2Vzc29yIG5vZGUsIHRoaXMgSUQncw0KPiA+IHZhbGlkaXR5IHN0
aWxsIG5lZWQgdG8gYmUgY2hlY2tlZC4gT25jZSB3ZSBnb3QgYSBpbnZhbGlkIE5VTUEgSUQNCj4g
PiBmcm9tIGFueSBwcm9jZXNzb3Igbm9kZSwgdGhlIGRldmljZSB0cmVlIHdpbGwgYmUgbWFya2Vk
IGFzIE5VTUENCj4gPiBpbmZvcm1hdGlvbiBpbnZhbGlkLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4gLS0tDQo+ID4gIHhlbi9hcmNoL2Fy
bS9udW1hX2RldmljZV90cmVlLmMgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL251bWFfZGV2aWNlX3RyZWUuYw0K
PiBiL3hlbi9hcmNoL2FybS9udW1hX2RldmljZV90cmVlLmMNCj4gPiBpbmRleCAxYzc0YWQxMzVk
Li4zN2NjNTZhY2YzIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9udW1hX2RldmljZV90
cmVlLmMNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jDQo+ID4gQEAg
LTIwLDE2ICsyMCw1MyBAQA0KPiA+ICAjaW5jbHVkZSA8eGVuL2luaXQuaD4NCj4gPiAgI2luY2x1
ZGUgPHhlbi9ub2RlbWFzay5oPg0KPiA+ICAjaW5jbHVkZSA8eGVuL251bWEuaD4NCj4gPiArI2lu
Y2x1ZGUgPHhlbi9kZXZpY2VfdHJlZS5oPg0KPiA+ICsjaW5jbHVkZSA8YXNtL3NldHVwLmg+DQo+
ID4NCj4gPiAgczggZGV2aWNlX3RyZWVfbnVtYSA9IDA7DQo+ID4gK3N0YXRpYyBub2RlbWFza190
IHByb2Nlc3Nvcl9ub2Rlc19wYXJzZWQgX19pbml0ZGF0YTsNCj4gPg0KPiA+IC1pbnQgc3JhdF9k
aXNhYmxlZCh2b2lkKQ0KPiA+ICtzdGF0aWMgaW50IHNyYXRfZGlzYWJsZWQodm9pZCkNCj4gPiAg
ew0KPiA+ICAgICAgcmV0dXJuIG51bWFfb2ZmIHx8IGRldmljZV90cmVlX251bWEgPCAwOw0KPiA+
ICB9DQo+ID4NCj4gPiAtdm9pZCBfX2luaXQgYmFkX3NyYXQodm9pZCkNCj4gPiArc3RhdGljIF9f
aW5pdCB2b2lkIGJhZF9zcmF0KHZvaWQpDQo+ID4gIHsNCj4gPiAgICAgIHByaW50ayhLRVJOX0VS
UiAiRFQ6IE5VTUEgaW5mb3JtYXRpb24gaXMgbm90IHVzZWQuXG4iKTsNCj4gPiAgICAgIGRldmlj
ZV90cmVlX251bWEgPSAtMTsNCj4gPiAgfQ0KPiA+ICsNCj4gPiArLyogQ2FsbGJhY2sgZm9yIGRl
dmljZSB0cmVlIHByb2Nlc3NvciBhZmZpbml0eSAqLw0KPiA+ICtzdGF0aWMgaW50IF9faW5pdCBk
dGJfbnVtYV9wcm9jZXNzb3JfYWZmaW5pdHlfaW5pdChub2RlaWRfdCBub2RlKQ0KPiA+ICt7DQo+
ID4gKyAgICBpZiAoIHNyYXRfZGlzYWJsZWQoKSApDQo+ID4gKyAgICAgICAgcmV0dXJuIC1FSU5W
QUw7DQo+ID4gKyAgICBlbHNlIGlmICggbm9kZSA9PSBOVU1BX05PX05PREUgfHwgbm9kZSA+PSBN
QVhfTlVNTk9ERVMgKSB7DQo+ID4gKwkJYmFkX3NyYXQoKTsNCj4gPiArCQlyZXR1cm4gLUVJTlZB
TDsNCj4gPiArCX0NCj4gPiArDQo+ID4gKyAgICBub2RlX3NldChub2RlLCBwcm9jZXNzb3Jfbm9k
ZXNfcGFyc2VkKTsNCj4gPiArDQo+ID4gKyAgICBkZXZpY2VfdHJlZV9udW1hID0gMTsNCj4gPiAr
ICAgIHByaW50ayhLRVJOX0lORk8gIkRUOiBOVU1BIG5vZGUgJXUgcHJvY2Vzc29yIHBhcnNlZFxu
Iiwgbm9kZSk7DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4g
Ky8qIFBhcnNlIENQVSBOVU1BIG5vZGUgaW5mbyAqLw0KPiA+ICtpbnQgX19pbml0IGRldmljZV90
cmVlX3BhcnNlX251bWFfY3B1X25vZGUoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZSkNCj4gPiAr
ew0KPiA+ICsgICAgdWludDMyX3QgbmlkOw0KPiA+ICsNCj4gPiArICAgIG5pZCA9IGRldmljZV90
cmVlX2dldF91MzIoZmR0LCBub2RlLCAibnVtYS1ub2RlLWlkIiwgTUFYX05VTU5PREVTKTsNCj4g
PiArICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAiQ1BVIG9uIE5VTUEgbm9kZToldVxuIiwgbmlk
KTsNCj4gDQo+IEdpdmVuIHRoYXQgdGhpcyBpcyBub3QgYWN0dWFsbHkgYSB3YXJuaW5nIChpcyBp
dD8pIHRoZW4gSSB3b3VsZCBtb3ZlIGl0DQo+IHRvIFhFTkxPR19JTkZPDQo+IA0KPiANCg0KDQpP
Sw0KDQo+ID4gKyAgICBpZiAoIG5pZCA+PSBNQVhfTlVNTk9ERVMgKQ0KPiA+ICsgICAgew0KPiA+
ICsgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAiTm9kZSBpZCAldSBleGNlZWRzIG1heGlt
dW0gdmFsdWVcbiIsDQo+IG5pZCk7DQo+IA0KPiBUaGlzIGNvdWxkIGJlIFhFTkxPR19FUlINCj4g
DQoNCk9LDQoNCj4gDQo+ID4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gKyAgICB9DQo+
ID4gKw0KPiA+ICsgICAgcmV0dXJuIGR0Yl9udW1hX3Byb2Nlc3Nvcl9hZmZpbml0eV9pbml0KG5p
ZCk7DQo+ID4gK30NCg0K

