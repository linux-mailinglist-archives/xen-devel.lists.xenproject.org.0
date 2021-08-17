Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACF73EEB16
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 12:38:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167733.306207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFwUK-0007kM-Gf; Tue, 17 Aug 2021 10:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167733.306207; Tue, 17 Aug 2021 10:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFwUK-0007iX-DF; Tue, 17 Aug 2021 10:38:32 +0000
Received: by outflank-mailman (input) for mailman id 167733;
 Tue, 17 Aug 2021 10:38:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HpXX=NI=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mFwUJ-0007iR-2z
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 10:38:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.42]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbba4165-b484-4609-8c5a-ad36b18c53d1;
 Tue, 17 Aug 2021 10:38:28 +0000 (UTC)
Received: from AM6P193CA0130.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::35)
 by HE1PR0801MB1945.eurprd08.prod.outlook.com (2603:10a6:3:4f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.21; Tue, 17 Aug
 2021 10:38:26 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::54) by AM6P193CA0130.outlook.office365.com
 (2603:10a6:209:85::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 17 Aug 2021 10:38:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Tue, 17 Aug 2021 10:38:25 +0000
Received: ("Tessian outbound 8b41f5fb4e9e:v103");
 Tue, 17 Aug 2021 10:38:25 +0000
Received: from e207c82e2d23.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5806366B-013A-4DE0-93AA-991BADCF4F3C.1; 
 Tue, 17 Aug 2021 10:38:18 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e207c82e2d23.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Aug 2021 10:38:18 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6405.eurprd08.prod.outlook.com (2603:10a6:20b:332::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Tue, 17 Aug
 2021 10:38:18 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::6c11:19f8:1422:5dea]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::6c11:19f8:1422:5dea%3]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 10:38:17 +0000
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
X-Inumbo-ID: dbba4165-b484-4609-8c5a-ad36b18c53d1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7F8gfvnwmUxiQcItD5/pScr+v8xAjhIUmd/k4Jkob8=;
 b=RRV35ovrnhj8oHLSOMB5j2+eBFTpi9m9zttSltFL3nBlLebUNOaxvkjPpzkFqi0steZ6dwIcJ9aU17tKAB55vuVpI95i07mPhr79oFtXXjbOcKDvex+mRZfNsHmv7l8+ru63VmO9ptaxCtfztrZSJRtToMtObidSTyN/OWJ6j/g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0fed3ba36e3ec27a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkRD1NOunQ0FzBF/krbvAPtwibm20s/u4Tj8/wBRk/iG+CQiq8ZkAm6VjyQf769/enofJezadO379dBpRTJM1LWIdW+2LDlsccg2161TJnWEpPnWsbIbwwBy2AU2kBjth8iKiFhTaR9lQEYfBqQuQAq7tGI4U2yX14bw3emuKUP1z0Wpi/jkKH9E4L3Dx9/4i1BIgfQjA3aIElP1Qabm80sWNm5BIQ06zKOIOyCdQ8CsFpbSAO4Mq2ul+ZhsLFMH2RL9pGrGZV0NNXYdoCQV75+LfNaJIwfy4ubgN6ok5FPngh/GiRghvbZORpXlZ7cymuxHNCXrL37ExPUftlaw6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7F8gfvnwmUxiQcItD5/pScr+v8xAjhIUmd/k4Jkob8=;
 b=hNJXHvLXXGDCnvodhrLbnilTTFoTuGb9Fet+iejaABNNBSi6rwhjRCDQwaSd0IPpvlHjC5d7ooKAZZ7fuOAHr9kcAAJeq+ZLAGEVBD31eWxN9UT8Ttdv9edmShfXPZpzf0BW2X24SZyi9h9kxPgMiV2nG62ZA32lHiLqt1E3d1NOzSx8KNnzEDv99ZBXKdTdW/q2XAH0El5iRH2UbtMqCq3apLzge05PMeHl21oYH45GcZOXZ+PS4a/AjcvJ7k8b+3J2G38u+SGPWl6xwJkQwJ8ugkAKFOa66+7UQb6MPN5YxWAgRah8NcJdOIxdHc1xHmvrD9DDXG2et4j0IjvN5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7F8gfvnwmUxiQcItD5/pScr+v8xAjhIUmd/k4Jkob8=;
 b=RRV35ovrnhj8oHLSOMB5j2+eBFTpi9m9zttSltFL3nBlLebUNOaxvkjPpzkFqi0steZ6dwIcJ9aU17tKAB55vuVpI95i07mPhr79oFtXXjbOcKDvex+mRZfNsHmv7l8+ru63VmO9ptaxCtfztrZSJRtToMtObidSTyN/OWJ6j/g=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] xen/arm: smmu: Set/clear IOMMU domain for device
Thread-Topic: [PATCH] xen/arm: smmu: Set/clear IOMMU domain for device
Thread-Index: AQHXjrFrTVH+aiOPq0+hBS5mdWMgaKt3ipeA
Date: Tue, 17 Aug 2021 10:38:17 +0000
Message-ID: <12925B66-1446-4AC0-BC8D-A47581D08234@arm.com>
References: <20210811130356.1143743-1-andr2000@gmail.com>
In-Reply-To: <20210811130356.1143743-1-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 115363e0-8d14-42d9-5cbb-08d9616b2508
x-ms-traffictypediagnostic: AS8PR08MB6405:|HE1PR0801MB1945:
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB194537E5856C98E009B88B92FCFE9@HE1PR0801MB1945.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4714;OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4WV3GTtg4eZft9vabiRtazCvVa1LtouAkTvZD0aduj/ob+dMp2Rr9gcqGKLYI3qUgYJLnt6U6ZQa6b/NtX3uIc5L/kqbttPltFFm6yvQtqqVbCaR6USe60/NVkYKFghHv1O9tc650HFK9coqDsX0/S7GsP+CZBQprIsg92ojllDqvEVORq/Uc2JDWHLDMvIGiunpEwMcvpCEczpMUXTmXlhNSnUQSAz0nNLWDAPbYH7+YKwCBim7a9cn0WxBKAqu/Mceg2f/2eS81sMIPMmlh5xzPjM7ZhTh/iswEmNJIELKinQ+yZuV5E2Ify9v/uXfrPSoc+UVvvFk5O5qvIs/xaTFvVlIBIQc4yt83FNf7RnUFJg3zjUPfzcT1QGinn2bThlCHVMECsoEqTvoZwmcYh7G5j0rmG/3eIQkAdMDF09KLKhuEgMYt/+eQ8DKuKYCb1ffTv2+c2Py4Q+hNpc7LbyTYSR7/NglDv5oYHqaiZMTHbyFqrBfzrWH0pnFmCe8jQoKjwTIKnDocBrZW6lKyCY7AOBFxux3MUj5Yu1rVD3ePdkG8Zh438y7+OMaywpFdesx3NoKJQ38lYw2KO5UnKTKndoH/1UipPYwzDihblbnyrQGT49xStRptIMoLBqhVvItXU4zfdjE8jlN0w/D5q0y+/lloOkoVgAUkOXNTDb1HSsNPAmGieOz5fZvhDVN7NKqawWJm6LTDlfkQ1lsnGYxM4M6l91u6G2Ja/85igJ2r2diznfWGO/Z46d1ZDxV
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(2616005)(86362001)(83380400001)(26005)(4744005)(6916009)(186003)(478600001)(5660300002)(2906002)(38100700002)(76116006)(4326008)(71200400001)(122000001)(91956017)(8676002)(36756003)(66946007)(6486002)(33656002)(64756008)(66446008)(66476007)(66556008)(53546011)(8936002)(6506007)(6512007)(54906003)(316002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1fNu2T34FeFWN6yZBLEjAlmpiXBadxILcYl2GuGJ7cpl7nVw7K4ZE3VplKm9?=
 =?us-ascii?Q?qWGN5mW1LMyEgJcOqkbM3VWwL/YYjc8s8bJRp5OaMhr47qksJjyEvfdiVXv6?=
 =?us-ascii?Q?HKA2UAo/ovhyjzRjEfftWoiNYYnIx2lfBVkUHkokcjNGTe3KoCiUjgdSqxEi?=
 =?us-ascii?Q?LlTAYAJwuKAMSw9gISXax4IwjhWega6meXdp0nTcZfahiBjTSh/lte6UXYPE?=
 =?us-ascii?Q?vXcC/naPv1HCcGBzGGYgl3R5Mgc6tOOXmx4HYhpyVsSBDLH3JRueCMpGRkX+?=
 =?us-ascii?Q?S4L8vqpgKpuXbWQOEFNmstsYqGSlbkdgoHUFtnren3CcOW142WwhhxUdk6Wv?=
 =?us-ascii?Q?8fSn+WjU+JWzqp4UBZxxLjRrkebCtthzXFFaXbEVOw9+4xVdhkM0AOStZEBY?=
 =?us-ascii?Q?i0vMh9yrq+/QcD6R6/bhY+0+7BQf7sM80eJ+6IdDJkFRb6zsrTFvD2350TFH?=
 =?us-ascii?Q?Udg6h9yX/Ku8tLJ/kyh2lGJipqQTvekgxNCJy2xiSELHh1xQrRhL5pC2/Hqw?=
 =?us-ascii?Q?/aCmiyeb3HeYD0gIZAcALmAFk4hcw6wZYKww1QVr063CjJZENq+ZimQQsNJ/?=
 =?us-ascii?Q?kr5MOjCPCJ/+ganZVzIwR4nRsgc+xj1SvI9sJAOiZz671fvgr2CVvEQAbhRm?=
 =?us-ascii?Q?mudr8n30SBlxlgOp4MJmdQPYLSz3YOsO/T3DUy9QlCDft34228AHm7/PJ/gD?=
 =?us-ascii?Q?MSi4gMK8C+H3LyprXJcCag5MO5zaeD5ovE1VDdbFfJah9u4e0Twd31wJYk1X?=
 =?us-ascii?Q?lMCxLLGD7NrD/5pwF6QkAEbalJkBb57HCMb5BuzUVJ9QZSzvhNhOfMlAa/vS?=
 =?us-ascii?Q?JYzBV62/4h3wsKdreTTKXVqn1DQHg0yIv2XQs2o7E0nClXg2qyGK72CQjZwl?=
 =?us-ascii?Q?dcpFWe4gLNY2sO7XGsOfwn6HslPhoRT6k3QJJimH+0jcoZcPdIBtwF8qUErI?=
 =?us-ascii?Q?9Zncr2wqFYI03t4jc/VJywQLsY9GkYeHVBQ981aDRpe19m6eFvZrd7N4AIpR?=
 =?us-ascii?Q?SpPad8uZQfa8/Nho+2XFc8lgX3nBK+ms0cuS4w0Ef6huXI+fu34JY6gjR/2E?=
 =?us-ascii?Q?46h4PygTr+z+jJHz5B/p9frBXP4UoTblgY3cMQ2YciAFydjCYBjAFdK+x11n?=
 =?us-ascii?Q?CcLoC1MwMk+bTUhfocoIzgsXIwdxsfR2fiotInyFuEDN95Z/SaGw3WBqV6RW?=
 =?us-ascii?Q?cf5OlTtvwjtTBAqkoBz5/N2PgOqxR+QLS5uD/Traw7NaHGa8v3e/PaQSO9tF?=
 =?us-ascii?Q?hHUpZqgluAYIvcEo8U/nc+1/v15lqLkB98tvQFeBCWGJmwWjywtVRuG6d9N1?=
 =?us-ascii?Q?1Ge/YgQx+/v2PNmN2nYPCTrA?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2507BD3F5E280242851910C7A0FACAAC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6405
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ecd780a5-d4ee-4fc8-209b-08d9616b203e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pjW2J5a2UZ79BQUuA4AZnzVNu8knSTgOlNoo9os4cUlmjlHwbVfzIRjl+CTt5za8JH43Z6Ub9VN0yZ4Ja73BSE4m5N5wVMoNqsKhGUR28mFwhu5KmFu1siwdePwmRRnN3FpDHK7ZlxBE/gDiZHCS08RF8aRRY8/NobC1DjFMBXkV2zu5oM5mw+eeIH10M0BL533y2ZKIj41SFQTYbIlMbHsgAf8XN+ydRCnt8F+/DfgoSX5JgbD/QPjvewal21W2zxRLs5UmQvckRP3QW2B2eRjbTOS5bPnpDya8Y2OxDdqFQGfNM4Ffek7d9VkQJyLfrwOMOYbVy2c1M7YykpqCnYgcBV7E72Oz6+vrfRwpXZZa4z7XrgUd/BjduTGGzOSwhq6DJScOhsPItpVlPNi6Ycr3L1Zb20zd/6uqpSiwlDsNffoBKKS2fZYDiuMpkkt5AZ1hB+7EpGs9IdQ+wohY0WSPUSDvUBF3rXv+eNRubV4EdWRhhUz9yiDSZOQQQPFHiTzTtJkYJRV0z/DI8pyWFEunWalY2v29WwLqfo6XNRmb9slwVoiSYeQf3yDc4TgH8iT5qPqczYBB+zouNxVLdQIiM2zj8VqTKkhTAQU3OByq3hrTWUm06BH5m39r8CwiSHmpgXoG5sRqYK6pU8p0fxO1AoPEFS6zIsSXrD8tVJk3hk1q9q/Q0STHPMpx/vzh8A+SHTvDLM5fh9DxL9c9cA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39850400004)(136003)(46966006)(36840700001)(316002)(5660300002)(6512007)(6486002)(4744005)(54906003)(70586007)(478600001)(33656002)(70206006)(83380400001)(81166007)(36860700001)(356005)(82740400003)(8936002)(8676002)(53546011)(2616005)(4326008)(36756003)(6862004)(107886003)(47076005)(86362001)(336012)(26005)(186003)(6506007)(2906002)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 10:38:25.9716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 115363e0-8d14-42d9-5cbb-08d9616b2508
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1945

Hi Oleksandr,

> On 11 Aug 2021, at 2:03 pm, Oleksandr Andrushchenko <andr2000@gmail.com> =
wrote:
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> When a device is assigned/de-assigned it is required to properly set
> IOMMU domain used to protect the device. This assignment was missing,
> thus it was not possible to de-assign the device:
>=20
> (XEN) Deassigning device 0000:03:00.0 from dom2
> (XEN) smmu: 0000:03:00.0:  not attached to domain 2
> (XEN) d2: deassign (0000:03:00.0) failed (-3)
>=20
> Fix this by assigning IOMMU domain on arm_smmu_assign_dev and reset it
> to NULL on arm_smmu_deassign_dev.
>=20
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul=

