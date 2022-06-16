Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C72E54DF94
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 12:57:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350544.576920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1nAu-0002B3-Ar; Thu, 16 Jun 2022 10:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350544.576920; Thu, 16 Jun 2022 10:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1nAu-000292-7l; Thu, 16 Jun 2022 10:56:32 +0000
Received: by outflank-mailman (input) for mailman id 350544;
 Thu, 16 Jun 2022 10:56:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gudg=WX=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1o1nAs-00028w-B5
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 10:56:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f81bbeec-ed62-11ec-bd2c-47488cf2e6aa;
 Thu, 16 Jun 2022 12:56:27 +0200 (CEST)
Received: from DB6PR07CA0188.eurprd07.prod.outlook.com (2603:10a6:6:42::18) by
 AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.14; Thu, 16 Jun 2022 10:56:23 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::12) by DB6PR07CA0188.outlook.office365.com
 (2603:10a6:6:42::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.9 via Frontend
 Transport; Thu, 16 Jun 2022 10:56:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Thu, 16 Jun 2022 10:56:23 +0000
Received: ("Tessian outbound 6f53897bcd4e:v120");
 Thu, 16 Jun 2022 10:56:23 +0000
Received: from 9868e40b23ce.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 76F92342-7DCC-49F8-9C52-AECFFFAAC730.1; 
 Thu, 16 Jun 2022 10:55:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9868e40b23ce.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 16 Jun 2022 10:55:59 +0000
Received: from DB7PR08MB2986.eurprd08.prod.outlook.com (2603:10a6:5:1e::14) by
 AM6PR08MB3335.eurprd08.prod.outlook.com (2603:10a6:209:4c::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.13; Thu, 16 Jun 2022 10:55:56 +0000
Received: from DB7PR08MB2986.eurprd08.prod.outlook.com
 ([fe80::8cfc:33ec:e3ef:ebeb]) by DB7PR08MB2986.eurprd08.prod.outlook.com
 ([fe80::8cfc:33ec:e3ef:ebeb%3]) with mapi id 15.20.5332.020; Thu, 16 Jun 2022
 10:55:56 +0000
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
X-Inumbo-ID: f81bbeec-ed62-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lo+hmxwralDP4lF54ah1tH9VAQvhmZX4+dCbG77nGzF9DZklckMk+UWWBKDVFW4rR5YML1EaLrJfTkZJ7m2+6WfGBMALPzfvjnyGNYjOKfWWEWWYlzzUtmdhYWWvKoXnBrJyVEZYqmajGxdXl8mHagaAeavc3rumI26Fcq3tjU1lVq64jPIkieDDuozIPyu/uvtL7ac8hlboUotQZ7P8PE04kb8gtKI9skesypg1uiUgYbPva81dl5IAa2esEwzXC3ZYSopybV237ieivRhJ/pW0Ag/HSNgN+uZ6hdFl8ORlCjSgxNN54nPWTfkfUsYrJfd8/WKKa+g1znpQar8lzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnT+k9wLLW9bNIoLd/BEczpkgmZl1ZO94X5qi6ahdWc=;
 b=mZjtEI+i2YlPFEPAF9e/IRLi4uEJWd0YvnCrunbHNGIrMNpPQ06vzJxGtLQh/vl8HNM2b/CcUKiSGxBaKrQlq4Likz7sz0nX0dYTX72wl9rUqW2H7EvjNBSjs+G4qN3SUzEjrSKqmn+5OUyug8pDQv8zkx6Y7PjGD5XYPwTIa0ekaqxmHpySMOS6fZlyulPERwyieVHJGxgIcSYMeqlLYQr5Bxx6RkOllfviI83j1J5UnJrp2yFRUgQJYKsgg55N/JsD+7dHZ+LCL8muwUGKwpkIpKGVj0myw2gE8e/kH0K5ihpIXYvZyi+uNivgdoCciDzK0mJTbgDf8SVIp0BH3A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnT+k9wLLW9bNIoLd/BEczpkgmZl1ZO94X5qi6ahdWc=;
 b=hrJnzXsXU7HD1mdg8d0xC03LvnsWTQtKVBTFMT+Hq2IF/t0wMei70LfgtJZOW4rCIt6j4P0/ipTx+EjG/tGOnt0BJReylS1YceGctMa9d/raWh02VxEQmbpslpFeLfrZ0LUfpXu4cKL19JWXDtVNtbgVPRqTA39sgsupeqNsDC4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQc3rp0BLtq03yp3NUP6qk9grbNoV2jz015rv8yR3jIVjj5VEG17IqEavrEa0+FPyZFi1amsWYkcZpkUm4vx1XdX2323brlbosiucKshlutL3QwgIQiNgZAN6EDoso7HjYknUehZRF4kEGeIhv8yh5UcrlDbfCqkGdx9wAT5KLl3gL29G64xCfkkIHT21UQV53dBOgB1POjBM6+mOZRC01SgqRbXKoYvIdFpS1y20CFbIcZrmXQ2y0CsxqWjH+YG001Xy6WGfqsYn8cZRd1l4GypFKZY7Irx8yW8TRwjTeVHzV6sdGUp8wXmcZZwjtX4/gldETYjkjcT29Fce0L1tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnT+k9wLLW9bNIoLd/BEczpkgmZl1ZO94X5qi6ahdWc=;
 b=gG/yH49kMXZQo2md0VDODGayhYfheVwmhODOEqk0z0DYe2H7b6WYZU1b8vAt45sDO7R9CMcpJpD8IPYhrs3MV6b9EZLIC8ypywETAOeCCQAObb7j0fazECJzB2EXoC4lVU7NUm62AUyXcCxM6Av5TsDqeTvjAgYRKsXq2SkqaHNz5ku/ShbJ01wcJBSo2nhkcAsqd5ymuMINSmQ9UkXfkwNywZLvFLUTwPurvoa7scCcUCjEB+ChM14fe4i8YTILWirbAgOGE/CVxACV+TZhpZjHLGjv+fB3zg4hbYkcAlVC7As/ceoPH3xH9z2nMklpeu47icwWqUaea0jU8I0Hcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnT+k9wLLW9bNIoLd/BEczpkgmZl1ZO94X5qi6ahdWc=;
 b=hrJnzXsXU7HD1mdg8d0xC03LvnsWTQtKVBTFMT+Hq2IF/t0wMei70LfgtJZOW4rCIt6j4P0/ipTx+EjG/tGOnt0BJReylS1YceGctMa9d/raWh02VxEQmbpslpFeLfrZ0LUfpXu4cKL19JWXDtVNtbgVPRqTA39sgsupeqNsDC4=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Mykyta Poturai <mykyta.poturai@gmail.com>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: smmuv1: remove iommu group when deassign a
 device
Thread-Topic: [PATCH] xen/arm: smmuv1: remove iommu group when deassign a
 device
Thread-Index: AQHYWlIekEFYa4Z+ZkOKg6prrRxnv60EB7eAgALvxoCABl1EgIBEoW2AgAA0fAA=
Date: Thu, 16 Jun 2022 10:55:56 +0000
Message-ID: <029EEEE1-69E1-42A9-90D3-BEC18CD5B7BC@arm.com>
References: <b6af8c10-9331-eec8-9a77-cd192829a6f2@xen.org>
 <20220616074805.538720-1-mykyta_poturai@epam.com>
In-Reply-To: <20220616074805.538720-1-mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5c420485-6993-4335-2b6c-08da4f86da69
x-ms-traffictypediagnostic:
	AM6PR08MB3335:EE_|DBAEUR03FT026:EE_|AM6PR08MB3542:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3542CCA818BA20CB80768F4AFCAC9@AM6PR08MB3542.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6QYxt0AlRh7jmuf4jH4/4NiseTvjOyXbbagt0Fq8K1jJXOsY79KGktt+myRXqZi7Xk2JNzlqAn9SZktEW3x57xO0uZ/+i6a//WibBGspoCtaWsnErLnF8sjHavW8dcwcSWwANd8SgNwOJ7K7NwTqKpuRAFQ3EjXc2HixhHcvCClBeLEksjr2eJkETdqURJYwGur+g2jSPsXLuZo6QAbZWjmY/Q2JOABXQCtilFs7twlLAgTuqoLTOZWgRx98R8pUpitXv2z3zcWSq1cSbdXJ3E0S3AvPTaFi9jPGPCo9HqxoxwYuNd5kYyxkf1kScsVLAaznpVvaAzeCQelbbYGKl6zXTElNv86ZQMlbcVx+zKrKQwobHNqd3d1VbWgkKPMDUGuBEcJj21F+WyQmBDgSEGvhMJizYY96xSKC5H0PPfIg0kZYeF+MD5hzc1Oibhr5E/65cCVis6J9/t/kHavN2uzVS66HnqgHRUHNL4MH2NA9ePJRucVqyRS1MG5UhzFupOixOzNuohAIyoc5keWTyCAvl3w+XCZY9ZCUMyrmM+begdADcCQtByTYg4eCE7rin1Sr//5WGckB47Ex6nQK0JWafP7v76t526cIQ6yycW/CDr5GHqleEEZlOgXouNEQwJD2oad90sKyPrPg0cQjfrdgLW3PBVdI3bivTGIKyzQPidZ/eNp1GuoHBmD6xGI3gA/AiccbcLAgEU4F9X6Y6GGHrvqNUur1Zh/m21U4p+EAhIGiGpDQaaHpVIbx1sPZ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2986.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(83380400001)(76116006)(64756008)(8676002)(66946007)(6486002)(33656002)(5660300002)(2906002)(66446008)(508600001)(91956017)(38070700005)(66556008)(71200400001)(66476007)(8936002)(26005)(4326008)(2616005)(6506007)(36756003)(122000001)(54906003)(186003)(316002)(6916009)(53546011)(38100700002)(6512007)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1018AC48961434BA06F11A557F2B1A2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3335
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b2b030e9-5401-485b-120f-08da4f86ca46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ckY1DHzpz4g71Gws0qIn/ezS0sqV+AVLdJyiAZgVJbv0fZx7uGmoRarThapscDgu/KxIE/wiWy+Pul3kLbHOdiJmcJpCluTIIVlHyC0m28K7hiCXVdstuteGhW7wWxyLjiN5GnL7CIu+Qko1X0Xe7pzPmUXIOf9SgpznE0Nei8PL7Cb7/9mHdxO1w8aoBteDxsPXJtDL1XKTanbwvE10IbWK8vJBGQ3jNMVRlz1TXF+LzxS0z8gCfg3JGupyal4B42dUXxyZ83WSeoTFgngVxfE5/2eUk2k7f4qQskTsqRgfyyFHqdoXYDGTw2TWT1Vs1zMe/F9KBoVE7UDp59uXPJRPMHznRdSqBaZgzC//ZEPl7/K/nrsKFOae6rkESFWhnRwAd+3geYyhDnOxlGRlCE10nraBx9REiqh5x47WP3FzyDuRbeG3WW/N5GWiDB8T3OjZ+SInjyeDNInGiC+x09m15lXi810Fy2skeOsGiNXuw4BujsOGPl91F5pU0xYKL2/2WKecsEMo+Q26i3G/8d1LF5qMSk16npfpyYXs8y5RPHYFpVO4BRbOSXYbfagyOicFImQhS/wb6pA07jvdUgBLR/n9+UXBYDDXKjPhK640sOI4Ay2WD+uTAd6apNLoK/+4PnuX5nVholQ7p0viSMTckildgW44mBm3ypCVXQCYSw6TsT0fpjBbMZWYhDkh
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(46966006)(36840700001)(40470700004)(6512007)(186003)(26005)(2616005)(316002)(83380400001)(81166007)(336012)(356005)(82310400005)(47076005)(36860700001)(498600001)(2906002)(8936002)(53546011)(6486002)(6862004)(36756003)(40460700003)(8676002)(5660300002)(4326008)(6506007)(70206006)(54906003)(33656002)(70586007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 10:56:23.4883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c420485-6993-4335-2b6c-08da4f86da69
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542

SGkgTXlreXRhLA0KDQo+IE9uIDE2IEp1biAyMDIyLCBhdCA4OjQ4IGFtLCBNeWt5dGEgUG90dXJh
aSA8bXlreXRhLnBvdHVyYWlAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IEhpIEp1bGllbiwgUmFo
dWwNCj4gSSd2ZSBlbmNvdW50ZXJlZCBhIHNpbWlsYXIgcHJvYmxlbSB3aXRoIElNWDggR1BVIHJl
Y2VudGx5LiBJdCB3YXNuJ3QgcHJvYmluZw0KPiBwcm9wZXJseSBhZnRlciB0aGUgZG9tYWluIHJl
Ym9vdC4gIEFmdGVyIHNvbWUgZGlnZ2luZywgSSBjYW1lIHRvIHRoZSBzYW1lDQo+IHNvbHV0aW9u
IGFzIFJhaHVsIGFuZCBmb3VuZCB0aGlzIHRocmVhZC4gSSBhbHNvIGVuY291bnRlcmVkIHRoZSBv
Y2Nhc2lvbmFsDQo+ICJVbmV4cGVjdGVkIGdsb2JhbCBmYXVsdCwgdGhpcyBjb3VsZCBiZSBzZXJp
b3VzIiBlcnJvciBtZXNzYWdlIHdoZW4gZGVzdHJveWluZw0KPiBhIGRvbWFpbiB3aXRoIGFuIGFj
dGl2ZWx5LXdvcmtpbmcgR1BVLg0KPiANCj4+IEhtbW1tLi4uLiBMb29raW5nIGF0IHRoZSBjb2Rl
LCBhcm1fc21tdV9hbGxvY19zbWVzKCkgZG9lc24ndCBzZWVtIHRvIHVzZQ0KPj4gdGhlIGRvbWFp
biBpbmZvcm1hdGlvbi4gU28gd2h5IHdvdWxkIGl0IG5lZWQgdG8gYmUgZG9uZSBldmVyeSB0aW1l
IGl0IGlzIGFzc2lnbmVkPw0KPiBJbmRlZWQgYWZ0ZXIgcmVtb3ZpbmcgdGhlIGFybV9zbW11X21h
c3Rlcl9mcmVlX3NtZXMoKSBjYWxsLCBib3RoIHJlYm9vdCBhbmQgZ2xvYmFsDQo+IGZhdWx0IGlz
c3VlcyBhcmUgZ29uZS4gSWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgZGV2aWNlIHJlbW92aW5n
IGlzIG5vdCB5ZXQNCj4gc3VwcG9ydGVkLCBzbyBJIGNhbid0IGZpbmQgYSBwcm9wZXIgcGxhY2Ug
Zm9yIHRoZSBhcm1fc21tdV9tYXN0ZXJfZnJlZV9zbWVzKCkgY2FsbC4NCj4gU2hvdWxkIHdlIHJl
bW92ZSB0aGUgZnVuY3Rpb24gY29tcGxldGVseSBvciBqdXN0IGxlZnQgaXQgY29tbWVudGVkIGZv
ciBsYXRlciBvcg0KPiBzb21ldGhpbmcgZWxzZT8NCj4gDQo+IFJhaHVsLCBhcmUgeW91IHN0aWxs
IHdvcmtpbmcgb24gdGhpcyBvciBjb3VsZCBJIHNlbmQgbXkgcGF0Y2g/DQoNClllcywgSSBoYXZl
IHRoaXMgb24gbXkgdG8tZG8gbGlzdCBidXQgSSB3YXMgYnVzeSB3aXRoIG90aGVyIHdvcmsgYW5k
IGl0IGdvdCBkZWxheWVkLiANCg0KSSBjcmVhdGVkIGFub3RoZXIgc29sdXRpb24gZm9yIHRoaXMg
aXNzdWUsIGluIHdoaWNoIHdlIGRvbuKAmXQgbmVlZCB0byBjYWxsIGFybV9zbW11X21hc3Rlcl9m
cmVlX3NtZXMoKSANCmluIGFybV9zbW11X2RldGFjaF9kZXYoKSBidXQgd2UgY2FuIGNvbmZpZ3Vy
ZSB0aGUgczJjciB2YWx1ZSB0byB0eXBlIGZhdWx0IGluIGRldGFjaCBmdW5jdGlvbi4NCg0KV2ls
bCBjYWxsIG5ldyBmdW5jdGlvbiBhcm1fc21tdV9kb21haW5fcmVtb3ZlX21hc3RlcigpIGluIGRl
dGFjaCBmdW5jdGlvbiB0aGF0IHdpbGwgcmV2ZXJ0IHRoZSBjaGFuZ2VzIGRvbmUgDQpieSBhcm1f
c21tdV9kb21haW5fYWRkX21hc3RlcigpICBpbiBhdHRhY2ggZnVuY3Rpb24uDQoNCkkgZG9u4oCZ
dCBoYXZlIGFueSBib2FyZCB0byB0ZXN0IHRoZSBwYXRjaC4gSWYgaXQgaXMgb2theSwgQ291bGQg
eW91IHBsZWFzZSB0ZXN0IHRoZSBwYXRjaCBhbmQgbGV0IG1lIGtub3cgdGhlIHJlc3VsdC4NCg0K
ZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jDQppbmRleCA2OTUxMTY4M2I0Li5kYTNhZGY4ZTdm
IDEwMDY0NA0KLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYw0KKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYw0KQEAgLTE1OTgsMjEgKzE1OTgsNiBA
QCBvdXRfZXJyOg0KICAgICAgICByZXR1cm4gcmV0Ow0KIH0NCiANCi1zdGF0aWMgdm9pZCBhcm1f
c21tdV9tYXN0ZXJfZnJlZV9zbWVzKHN0cnVjdCBhcm1fc21tdV9tYXN0ZXJfY2ZnICpjZmcpDQot
ew0KLSAgICBzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11ID0gY2ZnLT5zbW11Ow0KLSAgICAg
ICBpbnQgaSwgaWR4Ow0KLSAgICAgICBzdHJ1Y3QgaW9tbXVfZndzcGVjICpmd3NwZWMgPSBhcm1f
c21tdV9nZXRfZndzcGVjKGNmZyk7DQotDQotICAgICAgIHNwaW5fbG9jaygmc21tdS0+c3RyZWFt
X21hcF9sb2NrKTsNCi0gICAgICAgZm9yX2VhY2hfY2ZnX3NtZShjZmcsIGksIGlkeCwgZndzcGVj
LT5udW1faWRzKSB7DQotICAgICAgICAgICAgICAgaWYgKGFybV9zbW11X2ZyZWVfc21lKHNtbXUs
IGlkeCkpDQotICAgICAgICAgICAgICAgICAgICAgICBhcm1fc21tdV93cml0ZV9zbWUoc21tdSwg
aWR4KTsNCi0gICAgICAgICAgICAgICBjZmctPnNtZW5keFtpXSA9IElOVkFMSURfU01FTkRYOw0K
LSAgICAgICB9DQotICAgICAgIHNwaW5fdW5sb2NrKCZzbW11LT5zdHJlYW1fbWFwX2xvY2spOw0K
LX0NCi0NCiBzdGF0aWMgaW50IGFybV9zbW11X2RvbWFpbl9hZGRfbWFzdGVyKHN0cnVjdCBhcm1f
c21tdV9kb21haW4gKnNtbXVfZG9tYWluLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgYXJtX3NtbXVfbWFzdGVyX2NmZyAqY2ZnKQ0KIHsNCkBAIC0xNjM1LDYg
KzE2MjAsMjAgQEAgc3RhdGljIGludCBhcm1fc21tdV9kb21haW5fYWRkX21hc3RlcihzdHJ1Y3Qg
YXJtX3NtbXVfZG9tYWluICpzbW11X2RvbWFpbiwNCiAgICAgICAgcmV0dXJuIDA7DQogfQ0KIA0K
K3N0YXRpYyB2b2lkIGFybV9zbW11X2RvbWFpbl9yZW1vdmVfbWFzdGVyKHN0cnVjdCBhcm1fc21t
dV9kb21haW4gKnNtbXVfZG9tYWluLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgYXJtX3NtbXVfbWFzdGVyX2NmZyAqY2ZnKQ0KK3sNCisgICAgICAgc3RydWN0
IGFybV9zbW11X2RldmljZSAqc21tdSA9IHNtbXVfZG9tYWluLT5zbW11Ow0KKyAgICAgICBzdHJ1
Y3QgYXJtX3NtbXVfczJjciAqczJjciA9IHNtbXUtPnMyY3JzOw0KKyAgICAgICBzdHJ1Y3QgaW9t
bXVfZndzcGVjICpmd3NwZWMgPSBhcm1fc21tdV9nZXRfZndzcGVjKGNmZyk7DQorICAgICAgIGlu
dCBpLCBpZHg7DQorDQorICAgICAgIGZvcl9lYWNoX2NmZ19zbWUoY2ZnLCBpLCBpZHgsIGZ3c3Bl
Yy0+bnVtX2lkcykgew0KKyAgICAgICAgICAgICAgIHMyY3JbaWR4XSA9IHMyY3JfaW5pdF92YWw7
DQorICAgICAgICAgICAgICAgYXJtX3NtbXVfd3JpdGVfczJjcihzbW11LCBpZHgpOw0KKyAgICAg
ICB9DQorfQ0KKw0KIHN0YXRpYyBpbnQgYXJtX3NtbXVfYXR0YWNoX2RldihzdHJ1Y3QgaW9tbXVf
ZG9tYWluICpkb21haW4sIHN0cnVjdCBkZXZpY2UgKmRldikNCiB7DQogICAgICAgIGludCByZXQ7
DQpAQCAtMTY4NCwxMCArMTY4MywxMSBAQCBzdGF0aWMgaW50IGFybV9zbW11X2F0dGFjaF9kZXYo
c3RydWN0IGlvbW11X2RvbWFpbiAqZG9tYWluLCBzdHJ1Y3QgZGV2aWNlICpkZXYpDQogDQogc3Rh
dGljIHZvaWQgYXJtX3NtbXVfZGV0YWNoX2RldihzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb21haW4s
IHN0cnVjdCBkZXZpY2UgKmRldikNCiB7DQorICAgICAgIHN0cnVjdCBhcm1fc21tdV9kb21haW4g
KnNtbXVfZG9tYWluID0gZG9tYWluLT5wcml2Ow0KICAgICAgICBzdHJ1Y3QgYXJtX3NtbXVfbWFz
dGVyX2NmZyAqY2ZnID0gZmluZF9zbW11X21hc3Rlcl9jZmcoZGV2KTsNCiANCiAgICAgICAgaWYg
KGNmZykNCi0gICAgICAgICAgICAgICBhcm1fc21tdV9tYXN0ZXJfZnJlZV9zbWVzKGNmZyk7DQor
ICAgICAgICAgICAgICAgcmV0dXJuIGFybV9zbW11X2RvbWFpbl9yZW1vdmVfbWFzdGVyKHNtbXVf
ZG9tYWluLCBjZmcpOw0KIA0KIH0NCg0KUmVnYXJkcywNClJhaHVs

