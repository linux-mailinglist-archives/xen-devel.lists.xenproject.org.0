Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF565B035F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 13:49:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401368.643231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVtYH-0001w6-C7; Wed, 07 Sep 2022 11:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401368.643231; Wed, 07 Sep 2022 11:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVtYH-0001t8-8d; Wed, 07 Sep 2022 11:49:05 +0000
Received: by outflank-mailman (input) for mailman id 401368;
 Wed, 07 Sep 2022 11:49:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9gDT=ZK=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oVtYF-0001t1-Nx
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 11:49:03 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130080.outbound.protection.outlook.com [40.107.13.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10c999c7-2ea3-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 13:49:01 +0200 (CEST)
Received: from DB6PR07CA0174.eurprd07.prod.outlook.com (2603:10a6:6:43::28) by
 VE1PR08MB5616.eurprd08.prod.outlook.com (2603:10a6:800:1a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 11:48:57 +0000
Received: from DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::38) by DB6PR07CA0174.outlook.office365.com
 (2603:10a6:6:43::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 11:48:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT022.mail.protection.outlook.com (100.127.142.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 11:48:56 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Wed, 07 Sep 2022 11:48:56 +0000
Received: from 023f98a3c79d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4F440C40-6AC3-48DE-B9AE-1CA1F2D50C69.1; 
 Wed, 07 Sep 2022 11:48:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 023f98a3c79d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 11:48:46 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB7993.eurprd08.prod.outlook.com (2603:10a6:10:3e0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 11:48:44 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Wed, 7 Sep 2022
 11:48:44 +0000
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
X-Inumbo-ID: 10c999c7-2ea3-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fR2Rork1E8YxqWg0Wc4rSvY9day9hlOuXckavs7ONyou3rk+8P3ajG+uVjNBAvgpac25rNSpL//uW+kw9OuvKxmoJjFdaU0UGxAy3QMWENRIb66D6m2x2pi72JugY5Fqd938FA9oL0HmK07StPTeXj7dbcUSKd3zKF/V/LLXimsKax+ZyFxKEtQWhPkaFrjfMJKpAQx7UaoR0vQRiMgI7mZ2xhIYgAcZYTOrA9FT94jpbmXzJKV1xoICEjtUAxOwWhROxEoDjDTu3gU3dzoFodTBQokLmKfblzhCH+v2WHUvGkfF603VT8tasY1r+fvtGVQ7lhB5LwCFUWRPpZJYBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaLCuvJWI858oHkTBc7AFH9+Dd07svSAu0y6/r3rWgw=;
 b=irnqikn/g/fld/Z1MZpqLjevWXN3J1H1uYPG1JQT/V2B6hAIwWMiRwyCaXZhvWH/hNyxOiOTiA96iZ8tXG71JZJb4x/VSSBBsWIPtaBHHY+YPMJ74V1lmhYjpZKax7KeKWG63P910q01fyOdi0SQbg4KayZgEXdxqtUlfCR5FkjM0e7J1dbykjURtgfauJ32jWdw8sZZzGD+u4A9M6ao0l6Whrj2AKbaSFPYryWzpn1cjcibGOHhUCrYRomEIBJxgQ/N8iktsxaspBTO93qYIEU1jfLoM7oZWrbSJtJwH6gIOi2QyuDYdEQQzYs+nFF4lhiSux9imYEW5kctGc4LRg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaLCuvJWI858oHkTBc7AFH9+Dd07svSAu0y6/r3rWgw=;
 b=smVKMrByR2kIH2Jpp/LC059aJr3F4jUCgym/yNlBU+WSsdy5Fqzw1+W/7Z2m5Li+zvtq82tvnL5TJ9Pxua5ZVuMybSRILusPAjmH7R7SV+mS6/wK+UoephU/yAjFSApT6fNcvHnq29XYp6xKvuS0rnwLVfvIjy7RWEfkYWA/UsA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khCvLgw6rc9fL9DeLpJ5C8NxAAB+eZ9m9mz/3HYLgec/wAVROKvkQHR+oXQeyM1ANU/Aq55lxdjK/s1Vjx9hoHTH/tqEZBBLW4l5qPeHAkibY6Edu0nQV+l5GSkxHV5wgvapkfaRPlV0d9uyStRE6lQdO5Sk+czA0NgnIlqnNwD7aeEUHmb2VBqTv9gHMHr6p6OWkk43M2o/1uygMkZnHVBzEqxTra1NPis54zKP5ZgGpzJSqhaXPp049epAjwsVOLH62Oq8N1NX7DR1Gl4y8g+5UWCODKxoDEVQ1Qufl/Aum1G5L+moXNHj7F2Yg0n2ShrSrYlwylHpERyXTTJBEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaLCuvJWI858oHkTBc7AFH9+Dd07svSAu0y6/r3rWgw=;
 b=KnwkcqEHnMzVf+eqNL7HlynCrEErSyq3BR36lAnOdILIRXKUexn8yjr2oP/Wk8X47cydyCUx3LTHbHqh0jv73jSz6YSOjhVMkWFkypEjCy4PGlCngwljaS7UjXYkMkGU9zV5IXuEdJfo7xPlICVedYH7jtrxIk822TUMdFW4NPPLgp0j9f0BlV022we3IygYar9ar2X9oGtXYgdSr5ODE4f9FqZILb5MRGjzsmrLvzvXh7pGZDKaRJH+4sL/SKvagRb++WdwsRiIyorOpg4kAwsCeUI40jORqRoyfufop1AbFKmmXE3IAXEPlJ6mBwEtWxthMdTQcEJIeYxYYZGl/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaLCuvJWI858oHkTBc7AFH9+Dd07svSAu0y6/r3rWgw=;
 b=smVKMrByR2kIH2Jpp/LC059aJr3F4jUCgym/yNlBU+WSsdy5Fqzw1+W/7Z2m5Li+zvtq82tvnL5TJ9Pxua5ZVuMybSRILusPAjmH7R7SV+mS6/wK+UoephU/yAjFSApT6fNcvHnq29XYp6xKvuS0rnwLVfvIjy7RWEfkYWA/UsA=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Penny Zheng <Penny.Zheng@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Topic: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Index: AQHYwpUJ7IYztv5II0KGaSuPgw9aFq3T1xaAgAABDrA=
Date: Wed, 7 Sep 2022 11:48:44 +0000
Message-ID:
 <AS8PR08MB799186FB3046AD59C9F8BBE892419@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-3-Henry.Wang@arm.com>
 <968529ba-3a9d-0812-1a5f-430d467e827f@xen.org>
In-Reply-To: <968529ba-3a9d-0812-1a5f-430d467e827f@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: EF49DF7F6D44F34FB4D7C327C96C1D92.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d6331017-c943-45c9-60dd-08da90c6f235
x-ms-traffictypediagnostic:
	DU0PR08MB7993:EE_|DBAEUR03FT022:EE_|VE1PR08MB5616:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 m4tlnTyLXtDn/hWKsWCLfL9ENRS2BDvmM2PQGM7SzdEqsXhnhis6ktnq9gPfHgLAlJb+wklcNLIHnENMChsVq20lEe1o0P1kRFwfTlrZNOQW8+6TG9un1mlw/4hSaJRdtVF6LMPCLbeKYK9o1yB8fdpA0bsPmaXvXXpkiaYjonVDEVKXBzJOj315qJNY2i2WyqdD6tLiwu3mKi0j85+dLDkcdMuMlJGrPwhd4Sq0FLI4hnll1DHSbHlZKw7vLjQ9jukBNtvKGj+SxaN8SHugxc7Cy2uiVp1qfSGRKACsRiOKOUPmPbRO4zXsppbLC29gubZBFb8ntnugtJl8+CHiCnRkYhZ2DAuniL2MUZv/gR4vyhqUgpcnSH7J5hYuXTF9YAAdExjMKWbf4WO9OlYQGbBi/N5mqhXGankF8uqND9AiMMpiP6xhpEUNbQl2LBtebgMOA6rWWtcT/ZRcZOpvDPh6E0qMChhKflqY8Sw4FT8HWqxabPmwMuEa5ofaAoxOk1TIxXrvzJXTKGwIDx87NnL4SGTVMre3Qi652nnJJ0Rat6QkpYs5zOX+lL38CuOCvkVq8zN5th7b5G+CWbLsckyG31lXEeuexFZiaVCNsQGb6jhyD1RFfj2V0e7Fie27NHz168D1tIw447/0jwttbOyQSwecYNxnOw8xGdllEThuYs/dSZ2s/iva6gZZ8byA+MuP6o22zrUoMAa8agrPb+WYzTTg+f4z4v6tOG4yxXH8922rkT/UPxHF3EcWp23aKlnT+1RauFUQOoCbuMRwAQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(5660300002)(8936002)(41300700001)(33656002)(26005)(9686003)(53546011)(2906002)(52536014)(86362001)(6506007)(7696005)(55016003)(38100700002)(122000001)(38070700005)(186003)(83380400001)(8676002)(4326008)(54906003)(110136005)(66556008)(478600001)(76116006)(66476007)(66946007)(66446008)(71200400001)(316002)(64756008)(6636002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7993
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cbd30227-99fa-4c03-60a0-08da90c6eac1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FB13rK196lEuV1BcvwU/JUcsShxC5DUSy2m9ezMsAvG65ghZEBNrvsyrz0li3ygsja2XUWurdBxhKKQWYBcHbI7uJtk6BHtZe8KNuvl4YKo5N1PWYvt5hupk7OTwJ/zHsF9k5bvCtEUsslW9gfQcX6h78oTIsnuOP/Oln/4i1Q5U4wncsoQr0x9Q89z836hLSw+YOyvfkngYNv2KY54Zu3kEajhChNJMAHKTj16d2oHUT+9go3hUw1OdZAcsXv+FkPWAIO3xpXm+YDM0hqKVBqemKx9TNJ49IDD7MFWpDy5vrVTC11p3jpbBkKg66LvtLzdlHJf9FujJAqK7T3qV1P16nAeKiBAwHRsUoIizWQkCdV8p7WnY97AjxYj/6EmslsQT9j2m9l9Dm1tBL6LkuGlZNGXIZ/xSdTNs6PBnNXUj2qh0alZ5t77KSYPJtvV2WnrkcnnnMPUYDMtd4w248tuD3fyuc8WPgUqHZRdt559TrSZOm1qbezQXu78pW5gmKQBhf9jF67VXi+Q5wZ8v8V8VCAaoK4az4ZSyBaijy+LauDk2pLypxQUMsYQDuwlbXJovHU5z/K8/e3PPGYd25m4wIdX8V2otroQaAoH8aL4asr/NIgjrWrcaVrKOY3vMAQ+HqjSVpjg5R59wj055aHq3wmBCN17H9AxI/imvZA21F4H7KWEYj4SNze88638YRRVchdEX94rQvi/+Vj4FJXassNEoi9LAobKkmsQt3uqmsRchkSBmRQBP5DkOXwIrBHrebi6qrHQJZkkNlYes6Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(39860400002)(40470700004)(36840700001)(46966006)(316002)(36860700001)(5660300002)(83380400001)(110136005)(4326008)(54906003)(8676002)(52536014)(6636002)(70206006)(8936002)(70586007)(2906002)(33656002)(55016003)(82310400005)(26005)(41300700001)(9686003)(478600001)(40480700001)(86362001)(82740400003)(336012)(186003)(107886003)(81166007)(356005)(53546011)(6506007)(40460700003)(47076005)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 11:48:56.7699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6331017-c943-45c9-60dd-08da90c6f235
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5616

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMi80XSBk
b2NzLCB4ZW4vYXJtOiBJbnRyb2R1Y2Ugc3RhdGljIGhlYXAgbWVtb3J5DQo+IA0KPiBIaSBIZW5y
eSwNCj4gDQo+IFdoaWxlIHJldmlld2luZyB0aGUgYmluZGluZyBzZW50IGJ5IFBlbm55IEkgbm90
aWNlZCBzb21lIGluY29uc2lzdGVuY3kNCj4gd2l0aCB0aGUgb25lIHlvdSBpbnRyb2R1Y2VkLiBT
ZWUgYmVsb3cuDQo+IA0KPiBPbiAwNy8wOS8yMDIyIDA5OjM2LCBIZW5yeSBXYW5nIHdyb3RlOg0K
PiA+ICstIHhlbixzdGF0aWMtaGVhcA0KPiA+ICsNCj4gPiArICAgIFByb3BlcnR5IHVuZGVyIHRo
ZSB0b3AtbGV2ZWwgImNob3NlbiIgbm9kZS4gSXQgc3BlY2lmaWVzIHRoZSBhZGRyZXNzDQo+ID4g
KyAgICBhbmQgc2l6ZSBvZiBYZW4gc3RhdGljIGhlYXAgbWVtb3J5LiBOb3RlIHRoYXQgYXQgbGVh
c3QgYSA2NEtCDQo+ID4gKyAgICBhbGlnbm1lbnQgaXMgcmVxdWlyZWQuDQo+ID4gKw0KPiA+ICst
ICN4ZW4sc3RhdGljLWhlYXAtYWRkcmVzcy1jZWxscyBhbmQgI3hlbixzdGF0aWMtaGVhcC1zaXpl
LWNlbGxzDQo+ID4gKw0KPiA+ICsgICAgU3BlY2lmeSB0aGUgbnVtYmVyIG9mIGNlbGxzIHVzZWQg
Zm9yIHRoZSBhZGRyZXNzIGFuZCBzaXplIG9mIHRoZQ0KPiA+ICsgICAgInhlbixzdGF0aWMtaGVh
cCIgcHJvcGVydHkgdW5kZXIgImNob3NlbiIuDQo+ID4gKw0KPiA+ICtCZWxvdyBpcyBhbiBleGFt
cGxlIG9uIGhvdyB0byBzcGVjaWZ5IHRoZSBzdGF0aWMgaGVhcCBpbiBkZXZpY2UgdHJlZToNCj4g
PiArDQo+ID4gKyAgICAvIHsNCj4gPiArICAgICAgICBjaG9zZW4gew0KPiA+ICsgICAgICAgICAg
ICAjeGVuLHN0YXRpYy1oZWFwLWFkZHJlc3MtY2VsbHMgPSA8MHgyPjsNCj4gPiArICAgICAgICAg
ICAgI3hlbixzdGF0aWMtaGVhcC1zaXplLWNlbGxzID0gPDB4Mj47DQo+IA0KPiBZb3VyIGJpbmRp
bmcsIGlzIGludHJvZHVjZSAjeGVuLHN0YXRpYy1oZWFwLXthZGRyZXNzLCBzaXplfS1jZWxscw0K
PiB3aGVyZWFzIFBlbm55J3Mgb25lIGlzIHVzaW5nICN7YWRkcmVzcywgc2l6ZX0tY2VsbHMgZXZl
biBpZiB0aGUgcHJvcGVydHkNCj4gaXMgbm90ICJyZWciLg0KPiANCj4gSSB3b3VsZCBsaWtlIHNv
bWUgY29uc2lzdGVuY3kgaW4gdGhlIHdheSB3ZSBkZWZpbmUgYmluZGluZ3MuIExvb2tpbmcgYXQN
Cj4gdGhlIHRyZWUsIHdlIGFscmVhZHkgc2VlbSB0byBoYXZlIGludHJvZHVjZWQNCj4gI3hlbi1z
dGF0aWMtbWVtLWFkZHJlc3MtY2VsbHMuIFNvIG1heWJlIHdlIHNob3VsZCBmb2xsb3cgeW91ciBh
cHByb2FjaD8NCj4gDQo+IFRoYXQgc2FpZCwgSSBhbSB3b25kZXJpbmcgd2hldGhlciB3ZSBzaG91
bGQganVzdCB1c2Ugb25lIHNldCBvZiBwcm9wZXJ0eQ0KPiBuYW1lLg0KDQpJTU8gbm93IHdlIGhh
dmUgdGhlIHBhaXINCiN4ZW4sc3RhdGljLWhlYXAte2FkZHJlc3MsIHNpemV9LWNlbGxzIGFuZCB4
ZW4sc3RhdGljLWhlYXAgZm9yIHN0YXRpYyBoZWFwLg0KYW5kIHRoZSBwYWlyDQojeGVuLHN0YXRp
Yy1tZW0te2FkZHJlc3MsIHNpemV9LWNlbGxzIGFuZCB4ZW4sc3RhdGljLW1lbSBmb3Igc3RhdGlj
DQptZW1vcnkgYWxsb2NhdGlvbiBmb3IgZG9tMGxlc3MuDQoNClNvIGF0IGxlYXN0IHRoZXNlIHR3
byBhcmUgY29uc2lzdGVudC4NCg0KSSBndWVzcyB0aGUgY29uY2VybiB5b3UgcmFpc2VkIGlzIHJl
bGF0ZWQgdG8gdGhlIHN0YXRpYyBzaGFyZWQgbWVtb3J5IGZvcg0KZG9tMGxlc3MsDQouLi4NCg0K
PiANCj4gSSBhbSBvcGVuIHRvIHN1Z2dlc3Rpb24gaGVyZS4gTXkgb25seSByZXF1ZXN0IGlzIHdl
IGFyZSBjb25zaXN0ZW50IChpLmUuDQo+IHRoaXMgZG9lc24ndCBkZXBlbmQgb24gd2hvIHdyb3Rl
IHRoZSBiaW5kaW5ncykuDQoNCkkgYW0gbm90IHN1cmUgaWYgUGVubnkgYW5kIFN0ZWZhbm8gaGF2
ZSBzb21lIHNwZWNpZmljIHJlcXVpcmVtZW50cw0KcmVnYXJkaW5nIHRoZSBzdGF0aWMgc2hhcmVk
IG1lbW9yeSB1c2FnZS4gU28gSSB3aWxsIHdhaXQgZm9yIFN0ZWZhbm8ncyBpbnB1dC4NCkJ1dCB5
ZWFoIHdlIG5lZWQgdG8ga2VlcCB0aGUgY29uc2lzdGVuY3kgc28gaWYgd2UgYXJlIGFncmVlZCB0
aGF0IEkgbmVlZCB0bw0KY2hhbmdlIHRoZSBiaW5kaW5nLCBJIHdpbGwgZG8gdGhlIGNvcnJlc3Bv
bmRpbmcgY2hhbmdlLg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBDaGVlcnMsDQo+
IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

