Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 518C651537A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 20:19:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317622.537038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkVCW-0003I3-9u; Fri, 29 Apr 2022 18:18:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317622.537038; Fri, 29 Apr 2022 18:18:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkVCW-0003G9-68; Fri, 29 Apr 2022 18:18:44 +0000
Received: by outflank-mailman (input) for mailman id 317622;
 Fri, 29 Apr 2022 18:18:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CdjT=VH=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nkVCU-0003G3-Nt
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 18:18:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb3b58bc-c7e8-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 20:18:40 +0200 (CEST)
Received: from AS9PR06CA0235.eurprd06.prod.outlook.com (2603:10a6:20b:45e::34)
 by VI1PR08MB3600.eurprd08.prod.outlook.com (2603:10a6:803:85::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 29 Apr
 2022 18:18:35 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45e:cafe::1d) by AS9PR06CA0235.outlook.office365.com
 (2603:10a6:20b:45e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15 via Frontend
 Transport; Fri, 29 Apr 2022 18:18:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Fri, 29 Apr 2022 18:18:34 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Fri, 29 Apr 2022 18:18:34 +0000
Received: from b60667392f89.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CBBDCFC8-4861-4EEB-93C1-60C863EF024C.1; 
 Fri, 29 Apr 2022 18:18:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b60667392f89.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 Apr 2022 18:18:27 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by VE1PR08MB4752.eurprd08.prod.outlook.com
 (2603:10a6:802:a4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 29 Apr
 2022 18:18:24 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::6c39:76a0:c05c:2938]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::6c39:76a0:c05c:2938%11]) with mapi id 15.20.5186.026; Fri, 29 Apr
 2022 18:18:24 +0000
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
X-Inumbo-ID: cb3b58bc-c7e8-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NJijWWK2bj0bW3SVosC2DiKliVNoKzON6Ci1MY6ERzpmEPWIcMsqc5EnMGn5bcQ2vwNOc3KitLb+x9XWtjmTB204Q/TfSIDRi4SNcJqQDgMd+CRVIlzVCtFbNGOufOcm6FcjVt6d3orCI/784Z6V7bs7M70JR25s/W4jB++UGU/5DVR6yMFZGtCRiocOiwT3zO6baOxw2enTalHgFN9c9rEhXJr+40dmjxhv5J835xCTePYXRwEAI3iMyTRZFiKWoV0Ebo//IsXVyLx1rKaI/hNZBX4z3dQA8hicXhEhcICu1kXR85hQ/y+z9ofRjLP63kuOpEC0fWEXz1LTSu5JwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qsTGaAa0fiIKj3RJZoNLhnEkA6ti42zy9E1mk+YvjfE=;
 b=Rq7YIQkf7ZZDXQt1QZi5hJkPJxf9Db3IwnV3VHJJ0KA5kePm8SZiGzw0UuxjJagDyUGQWNiHduHGR62vZ8YMCHpnppyc9P+G1jvU3s6XUKMhUYTIA+9s7Z924vStr8iLMsza5nk5nsHPyRDfk/1h4CoHtqurCKkVQsidNBlpwyllWyuWG5iZyuF47GEUsClJDaCmbtjwsqaUdp5Nif6MgOvl+cxQiNTG0l49JaUwDSQPDtZ/XBgs7IF2Pwb/bbhUa/Wtp1Sd1tWINmPmHkJS4MUdeOZ6zMu71QyvqJ4XaIFcBcvvX06pVAtN2gyV+5xMzPVPfCi6/Jhqj2uky1h1ng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsTGaAa0fiIKj3RJZoNLhnEkA6ti42zy9E1mk+YvjfE=;
 b=jPPmFP1q5cXxzDbZdoqsHiiV771aXO6+sUGRSD3qXNlJe0dt94AT/BxWGK4bEZj4YccFbuwuZDCTAnbtOQB2RLL8l6dV1+Te97z4temUgbTMJjcJdkNxSTxf51GqdOiYg0v+VuNaB7RgqUqsEu3FijcA7iv1iuFdOizfe2LWtYM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 06f721cd32c5e485
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOs3pnVo7S5P/bGoAbK48r+l7NaKDVmFZ4VOJ76Ge7+kwAQxuCswHl1HbI7z8pfyfK6qVldjHoAI/scLJAYEIywTccYa7zplt4Qgpc3UMbK1e4WTS5odMzC8ZRxj1gLP97RnlE0ogxMi7KlwK+EHwDn6JowNElgMGIJan1OrbzaefzPP/4pYQsgM4i2AIgMIeD7S3DKirvxNMq5n8jF0A2r0A8KCJRFBMxy6VKz34t7ppGJMpdm+0kwBXb8Z7pzJMfRH+z8i3aHQuXKHpWKmay02NU6TvO8IKZW3pyzGhNIIrTXd4t/m83c8FPtTH6KFIaWYM0CIbaJfjaEke2vm0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qsTGaAa0fiIKj3RJZoNLhnEkA6ti42zy9E1mk+YvjfE=;
 b=EyFY5OhbJRPvoV9HW1yh8IeXeSblxNqwCxB06yFKheyqrJxeP/9IyxiO2YlCGvmLTnh8aqWY6PWwRp7WHTX94A8e1NriNBJlZjVVkOn7wyrM9VfDe+Ypvw5QJeZz+cwnZEhC6zXwnW8F3HwDI7tsUSgHCQ1g6HB68v54BV2DFdBZuJuJN6qdyJNSLDdKVozLohBamvr/5XEVLBHQ3DsLAKUolTxzUAVKP6dfbl/byBf5gETrBZCOV1CyiBRRd/1QCwTupI6Z77fFiGBK9/tl5IKzD87ZHB9103qwcNLZfBgf9K2dSmEROwO+OV3S9NtUTfaogYnFzskxjkv1SFSU7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qsTGaAa0fiIKj3RJZoNLhnEkA6ti42zy9E1mk+YvjfE=;
 b=jPPmFP1q5cXxzDbZdoqsHiiV771aXO6+sUGRSD3qXNlJe0dt94AT/BxWGK4bEZj4YccFbuwuZDCTAnbtOQB2RLL8l6dV1+Te97z4temUgbTMJjcJdkNxSTxf51GqdOiYg0v+VuNaB7RgqUqsEu3FijcA7iv1iuFdOizfe2LWtYM=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/acpi: don't expose the ACPI IORT SMMUv3 entry to dom0
Thread-Topic: [PATCH] arm/acpi: don't expose the ACPI IORT SMMUv3 entry to
 dom0
Thread-Index: AQHYWlGqg8d+SR8SokCgQy1GM9ERN60EFAcAgAMiW4A=
Date: Fri, 29 Apr 2022 18:18:24 +0000
Message-ID: <780400E5-C22A-471E-BB19-C2F3B24112F1@arm.com>
References:
 <e11c57909782c60a6914d81e9c9893ff1712cc5b.1651075724.git.rahul.singh@arm.com>
 <c3b83cd4-7633-7aee-ab40-9eff26a4f801@xen.org>
In-Reply-To: <c3b83cd4-7633-7aee-ab40-9eff26a4f801@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: dac9cf9d-b3e1-4ee3-44a2-08da2a0cac55
x-ms-traffictypediagnostic:
	VE1PR08MB4752:EE_|VE1EUR03FT054:EE_|VI1PR08MB3600:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB36000EA9BBCCF50138C17CEDFCFC9@VI1PR08MB3600.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7lseIDxMvUaTEzHlobO+3ipEcDZRju1ovzHwZLLnFTvvoJWsUB9WvaFEOU1h5HZM+AuWZWdibg1dq/edA+gIKwHmH29L9jeB5u2fheaUh+3NoFB6cp+ThxfOhXQ75Zf8il9owJLedF64Py11NWKq6+el662kCLS5VsrzFr1CkIm76DUbpw8Zuy9bR7ri2aQGTYjw/t7rruS1zD5BtJJjeHxDCRpiksmIKjWbN8153SO9ZpgQNKbTwJyxiUiRjlbIqstE8sGng47br+HV5AaJl05oV4RgpaykGiduyP2+I7hVyVrVMCRiu0nSaQpGJ4O6KLXNXAH0SO3V5Xr5ydoMYMM7/JPE6BaUhXSRS8G1v3tHdfjUUAlkBqstG1jYVSfo+NgMh+N28SJ1fbcv2dFcEn9f6R1zFBt08WxeWi6P5rCGMxebehz2R23SdvDBVGgbZE4/VF5A94Mse660yNvTrPHgajMQ8olbyWJu2yLkTQgPjpS2v/8PG8RoyEo84RpeadixfxmY1eBwQGnAmjo/WKWi93Y5gCaFqKoxhL1Q0beVP0gLA3SfLWvz1MlAOm9iKXXrzVRpYXCZMi0IKQLAGa1dad3izaOxAvSvsZF68d1bE022PCg8xVTIyqB+GHIER5HuOI9kgvXRNzzET5U+5wvQm0DdDZOAgjhJPeq5AST8T5qtC53557+zr/HF2Jwe6cMcNuTIM4yfwjEQPvE2sJFuRmd63psmj4HISSWiJOctNehioqOKIGiNPnqmmZ+m
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(8936002)(66446008)(66476007)(66946007)(71200400001)(66556008)(64756008)(76116006)(91956017)(508600001)(6486002)(38070700005)(8676002)(38100700002)(6916009)(54906003)(316002)(5660300002)(86362001)(83380400001)(36756003)(2616005)(2906002)(186003)(6512007)(53546011)(6506007)(26005)(33656002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <721FDC76CDBC234BA3BE69E036D8AA4B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4752
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7413aa9d-6932-4308-8c71-08da2a0ca661
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jYqP0gdgbtbu12n8C4NSaa7lWHb+TIhbwcAWLJer+JK99swZiY0r5j66WKKHLW20km8phDwKFtUJs0GoBpmhOvBvGu96G2ZRGK11IdEz/BOX6jHI7TVf18GkpfWG81tpnxFDO1ZBj83ktsPIgEVJBZ2nVXiuOgVEuIbh8Jv7/UowB+wDe4X9aCEcRfTohGitjHbUk4z+N8kFvN/L4kPNU2Q1WXec015AJ9EL7hP8NGQ+yrzptfADVEuR3nvRdAsMBxGRYP8MitrXtu/OXGygaFlVRRsty/BzE+3HQlstK23sPhPdm/ufiWxoYdKKkEhYAVcGkpAizghJFyiBA2vgVhStVJlho3gXIsvY5nDbuFK7j5oEQhxCVTsqiJclYAKsA5NaO9RstVVgE04pOequyAmLM0rIQuUAoQmXyXF9t/TEfphdOl0D8s5xj/c4RpvmY1/XVnXtgV5aQXFaHkhh6jdBOeBIqaYSLX/+TJVq5Pvo5AAFffDnlXTU+mYYLm/HhzmMETSL9WGYDAyb0qTnV/FYUvFgN1+orpY5jlh27BHU92SUMAHNhLPC+ANhKiQupQSA3i1NFxF4dVB9qw+sGeqtA5xEi9wByBph/802pypwpwKU+f4KOeQCCVbLsU5WdJO4e/OA4ioQIO/7SWJ+wDFlxq7hBfp3rN84UfdfncU8fpbL/gw1HBBzmPFl55MD
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(186003)(36756003)(5660300002)(36860700001)(70206006)(2906002)(33656002)(316002)(83380400001)(8676002)(4326008)(6862004)(70586007)(8936002)(54906003)(2616005)(40460700003)(336012)(107886003)(6486002)(86362001)(47076005)(508600001)(82310400005)(81166007)(356005)(26005)(6512007)(53546011)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 18:18:34.4192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dac9cf9d-b3e1-4ee3-44a2-08da2a0cac55
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3600

SGkgSnVsaWVuLA0KDQo+IE9uIDI3IEFwciAyMDIyLCBhdCA3OjI2IHBtLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIFJhaHVsLA0KPiANCj4gT24gMjcvMDQv
MjAyMiAxNzoxMiwgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiBYZW4gc2hvdWxkIGNvbnRyb2wgdGhl
IFNNTVV2MyBkZXZpY2VzIHRoZXJlZm9yZSwgZG9uJ3QgZXhwb3NlIHRoZQ0KPj4gU01NVXYzIGRl
dmljZXMgdG8gZG9tMC4gRGVueSBpb21lbSBhY2Nlc3MgdG8gU01NVXYzIGFkZHJlc3Mgc3BhY2Ug
Zm9yDQo+PiBkb20wIGFuZCBhbHNvIG1ha2UgQUNQSSBJT1JUIFNNTVV2MyBub2RlIHR5cGUgdG8g
MHhmZi4NCj4gDQo+IExvb2tpbmcgYXQgdGhlIElPUlQgc3BlYyAoQVJNIERFTiAwMDQ5RSksIDI1
NSAoMHhmZikgaXMgbWFya2VkIGFzIHJlc2VydmVkLiBTbyBJIGRvbid0IHRoaW5rIHdlIGNhbiAi
YWxsb2NhdGUiIDB4ZmYgdG8gbWVhbiBpbnZhbGlkIHdpdGhvdXQgdXBkYXRpbmcgdGhlIHNwZWMu
IERpZCB5b3UgZW5nYWdlIHdpdGggd2hvZXZlciBvd24gdGhlIHNwZWM/DQoNClllcyBJIGFncmVl
IHdpdGggeW91IDB4ZmYgaXMgcmVzZXJ2ZWQgZm9yIGZ1dHVyZSB1c2UuIEkgZGlkbuKAmXQgZmlu
ZCBhbnkgb3RoZXIgdmFsdWUgdG8gbWFrZSBub2RlIGludmFsaWQuIA0KTGludXgga2VybmVsIGlz
IG1vc3RseSB1c2luZyB0aGUgbm9kZS0+dHlwZSB0byBwcm9jZXNzIHRoZSBTTU1VdjMgb3Igb3Ro
ZXIgSU9SVCBub2RlIHNvIEkgdGhvdWdodCB0aGlzIGlzIHRoZSBvbmx5IHBvc3NpYmxlIHNvbHV0
aW9uIHRvIGhpZGUgU01NVXYzIGZvciBkb20wDQoNCklmIHlvdSBoYXZlIGFueSBvdGhlciBzdWdn
ZXN0aW9uIHRvIGhpZGUgdGhlIFNNTVV2MyBub2RlIEkgYW0gb2theSB0byB1c2UgdGhhdC4NCj4g
DQo+PiBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4NCj4+
IC0tLQ0KPj4geGVuL2FyY2gvYXJtL2FjcGkvZG9tYWluX2J1aWxkLmMgfCA0MCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKw0KPj4gMSBmaWxlIGNoYW5nZWQsIDQwIGluc2VydGlvbnMo
KykNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYWNwaS9kb21haW5fYnVpbGQuYyBiL3hl
bi9hcmNoL2FybS9hY3BpL2RvbWFpbl9idWlsZC5jDQo+PiBpbmRleCBiYmRjOTBmOTJjLi5lYzBi
NWIyNjFmIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2FjcGkvZG9tYWluX2J1aWxkLmMN
Cj4+ICsrKyBiL3hlbi9hcmNoL2FybS9hY3BpL2RvbWFpbl9idWlsZC5jDQo+PiBAQCAtMTQsNiAr
MTQsNyBAQA0KPj4gI2luY2x1ZGUgPHhlbi9hY3BpLmg+DQo+PiAjaW5jbHVkZSA8eGVuL2V2ZW50
Lmg+DQo+PiAjaW5jbHVkZSA8eGVuL2lvY2FwLmg+DQo+PiArI2luY2x1ZGUgPHhlbi9zaXplcy5o
Pg0KPj4gI2luY2x1ZGUgPHhlbi9kZXZpY2VfdHJlZS5oPg0KPj4gI2luY2x1ZGUgPHhlbi9saWJm
ZHQvbGliZmR0Lmg+DQo+PiAjaW5jbHVkZSA8YWNwaS9hY3RhYmxlcy5oPg0KPj4gQEAgLTMwLDYg
KzMxLDcgQEAgc3RhdGljIGludCBfX2luaXQgYWNwaV9pb21lbV9kZW55X2FjY2VzcyhzdHJ1Y3Qg
ZG9tYWluICpkKQ0KPj4gew0KPj4gYWNwaV9zdGF0dXMgc3RhdHVzOw0KPj4gc3RydWN0IGFjcGlf
dGFibGVfc3BjciAqc3BjciA9IE5VTEw7DQo+PiArIHN0cnVjdCBhY3BpX3RhYmxlX2lvcnQgKmlv
cnQ7DQo+PiB1bnNpZ25lZCBsb25nIG1mbjsNCj4+IGludCByYzsNCj4+IEBAIC01NSw2ICs1Nyw0
NCBAQCBzdGF0aWMgaW50IF9faW5pdCBhY3BpX2lvbWVtX2RlbnlfYWNjZXNzKHN0cnVjdCBkb21h
aW4gKmQpDQo+PiBwcmludGsoIkZhaWxlZCB0byBnZXQgU1BDUiB0YWJsZSwgWGVuIGNvbnNvbGUg
bWF5IGJlIHVuYXZhaWxhYmxlXG4iKTsNCj4+IH0NCj4+ICsgc3RhdHVzID0gYWNwaV9nZXRfdGFi
bGUoQUNQSV9TSUdfSU9SVCwgMCwNCj4+ICsgKHN0cnVjdCBhY3BpX3RhYmxlX2hlYWRlciAqKikm
aW9ydCk7DQo+IA0KPiBBdCBzb21lIHBvaW50IHdlIHdpbGwgbmVlZCB0byBhZGQgc3VwcG9ydCB0
byBoaWRlIHRoZSBBUk0gU01NVSBkZXZpY2UgYW5kIHBvc3NpYmx5IHNvbWUgZGV2aWNlcy4gU28g
SSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gY3JlYXRlIGEgZnVuY3Rpb24gdGhhdCB3b3Vs
ZCBkZWFsIHdpdGggdGhlIElPUlQuDQoNCk9rLiBMZXQgbWUgYWRkIHRoZSBmdW5jdGlvbiBpbiBu
ZXh0IHZlcnNpb24uDQo+IA0KPj4gKw0KPj4gKyBpZiAoIEFDUElfU1VDQ0VTUyhzdGF0dXMpICkN
Cj4+ICsgew0KPj4gKyBpbnQgaTsNCj4gDQo+IFBsZWFzZSB1c2UgdW5zaWduZWQgaW50Lg0KQWNr
Lg0KPiANCj4+ICsgc3RydWN0IGFjcGlfaW9ydF9ub2RlICpub2RlLCAqZW5kOw0KPiANCj4gQ29k
aW5nIHN0eWxlOiBQbGVhc2UgYWRkIGEgbmV3bGluZS4NCg0KQWNrLiANCj4gDQo+PiArIG5vZGUg
PSBBQ1BJX0FERF9QVFIoc3RydWN0IGFjcGlfaW9ydF9ub2RlLCBpb3J0LCBpb3J0LT5ub2RlX29m
ZnNldCk7DQo+PiArIGVuZCA9IEFDUElfQUREX1BUUihzdHJ1Y3QgYWNwaV9pb3J0X25vZGUsIGlv
cnQsIGlvcnQtPmhlYWRlci5sZW5ndGgpOw0KPj4gKw0KPj4gKyBmb3IgKCBpID0gMDsgaSA8IGlv
cnQtPm5vZGVfY291bnQ7IGkrKyApDQo+PiArIHsNCj4+ICsgaWYgKCBub2RlID49IGVuZCApDQo+
IA0KPiBXb3VsZG4ndCB0aGlzIG9ubHkgaGFwcGVuIGlmIHRoZSB0YWJsZSBpcyBzb21laG93IGNv
cnJ1cHRlZD8gSWYgc28sIEkgdGhpbmsgd2Ugc2hvdWxkIHByaW50IGFuIGVycm9yIChvciBldmVu
IHBhbmljKS4NCg0KT2suDQo+IA0KPj4gKyBicmVhazsNCj4+ICsNCj4+ICsgc3dpdGNoICggbm9k
ZS0+dHlwZSApDQo+PiArIHsNCj4+ICsgY2FzZSBBQ1BJX0lPUlRfTk9ERV9TTU1VX1YzOg0KPiAN
Cj4gQ29kaW5nIHN0eWxlOiBUaGUga2V5d29yZCAiY2FzZSIgc2hvdWxkIGJlIGFsaWduZWQgdGhl
IHRoZSBzdGFydCBvZiB0aGUga2V5d29yZCAic3dpdGNo4oCdLg0KQWNrLiANCj4gDQo+PiArIHsN
Cj4+ICsgc3RydWN0IGFjcGlfaW9ydF9zbW11X3YzICpzbW11Ow0KPiANCj4gQ29kaW5nIHN0eWxl
OiBOZXdsaW5lLg0KDQpBY2suIA0KPj4gKyBzbW11ID0gKHN0cnVjdCBhY3BpX2lvcnRfc21tdV92
MyAqKW5vZGUtPm5vZGVfZGF0YTsNCj4+ICsgbWZuID0gcGFkZHJfdG9fcGZuKHNtbXUtPmJhc2Vf
YWRkcmVzcyk7DQo+PiArIHJjID0gaW9tZW1fZGVueV9hY2Nlc3MoZCwgbWZuLCBtZm4gKyBQRk5f
VVAoU1pfMTI4SykpOw0KPj4gKyBpZiAoIHJjICkNCj4+ICsgcHJpbnRrKCJpb21lbV9kZW55X2Fj
Y2VzcyBmYWlsZWQgZm9yIFNNTVV2M1xuIik7DQo+PiArIG5vZGUtPnR5cGUgPSAweGZmOw0KPiAN
Cj4gJ25vZGUnIHBvaW50cyB0byB0aGUgWGVuIGNvcHkgb2YgdGhlIEFDUEkgdGFibGUuIFdlIHNo
b3VsZCByZWFsbHkgbm90IHRvdWNoIHRoaXMgY29weS4gSW5zdGVhZCwgd2Ugc2hvdWxkIG1vZGlm
eSB0aGUgdmVyc2lvbiB0aGF0IHdpbGwgYmUgdXNlZCBieSBkb20wLg0KDQpBcyBvZiBub3cgSU9S
VCBpcyB1bnRvdWNoZWQgYnkgWGVuIGFuZCBtYXBwZWQgdG8gZG9tMC4gSSB3aWxsIGNyZWF0ZSB0
aGUgSU9SVCB0YWJsZSBmb3IgZG9tMCBhbmQgbW9kaWZ5IHRoZSBub2RlIFNNTVV2MyB0aGF0IHdp
bGwgYmUgdXNlZCBieSBkb20wLg0KPiANCj4gRnVydGhlcm1vcmUsIGlmIHdlIGdvIGRvd24gdGhl
IHJvYWQgdG8gdXBkYXRlIG5vZGUtPnR5cGUsIHdlIHNob3VsZCAwIHRoZSBub2RlIHRvIGF2b2lk
IGxlYWtpbmcgdGhlIGluZm9ybWF0aW9uIHRvIGRvbTAuDQoNCkkgYW0gbm90IHN1cmUgaWYgd2Ug
Y2FuIHplcm8gdGhlIG5vZGUsIGxldCBtZSBjaGVjayBhbmQgY29tZSBiYWNrIHRvIHlvdS4gDQo+
IA0KPj4gKyBicmVhazsNCj4+ICsgfQ0KPj4gKyB9DQo+PiArIG5vZGUgPSBBQ1BJX0FERF9QVFIo
c3RydWN0IGFjcGlfaW9ydF9ub2RlLCBub2RlLCBub2RlLT5sZW5ndGgpOw0KPj4gKyB9DQo+PiAr
IH0NCj4+ICsgZWxzZQ0KPj4gKyB7DQo+PiArIHByaW50aygiRmFpbGVkIHRvIGdldCBJT1JUIHRh
YmxlXG4iKTsNCj4+ICsgcmV0dXJuIC1FSU5WQUw7DQo+PiArIH0NCj4gDQo+IFRoZSBJT1JUIGlz
IG5vdCB5ZXQgcGFyc2VkIGJ5IFhlbiBhbmQgQUZBSUsgaXMgb3B0aW9uYWwuIFNvIEkgZG9uJ3Qg
dGhpbmsgd2Ugc2hvdWxkIHJldHVybiBhbiBlcnJvci4NCg0KQWNrLiANCg0KUmVnYXJkcywNClJh
aHVsDQoNCg==

