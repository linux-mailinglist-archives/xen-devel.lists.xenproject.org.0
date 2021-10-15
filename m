Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC5F42F713
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 17:39:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210845.367853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbPHv-0000YV-JJ; Fri, 15 Oct 2021 15:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210845.367853; Fri, 15 Oct 2021 15:38:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbPHv-0000WA-G7; Fri, 15 Oct 2021 15:38:27 +0000
Received: by outflank-mailman (input) for mailman id 210845;
 Fri, 15 Oct 2021 15:38:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mbPHu-0000W4-3g
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 15:38:26 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.57]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf7e8320-ba37-4094-9159-efaeb2950d99;
 Fri, 15 Oct 2021 15:38:24 +0000 (UTC)
Received: from AM3PR07CA0123.eurprd07.prod.outlook.com (2603:10a6:207:7::33)
 by VE1PR08MB5872.eurprd08.prod.outlook.com (2603:10a6:800:1aa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 15:38:20 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:207:7:cafe::2) by AM3PR07CA0123.outlook.office365.com
 (2603:10a6:207:7::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.10 via Frontend
 Transport; Fri, 15 Oct 2021 15:38:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 15:38:19 +0000
Received: ("Tessian outbound b9598e0ead92:v103");
 Fri, 15 Oct 2021 15:38:18 +0000
Received: from 59317a685499.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AE7A8F88-E1B9-4D21-B3E4-9BFB92CA4F48.1; 
 Fri, 15 Oct 2021 15:38:10 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 59317a685499.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 15:38:10 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DBBPR08MB4728.eurprd08.prod.outlook.com (2603:10a6:10:d6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 15:38:05 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.031; Fri, 15 Oct 2021
 15:38:05 +0000
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
X-Inumbo-ID: bf7e8320-ba37-4094-9159-efaeb2950d99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pfsxNnsT4NIh6xme90gDPokatEedxm6Zp05Lsz7/0A=;
 b=eduStwWsks90kTD1OOQVOEwnmcHS4LbEa/oYIDz1NZGxGpZgGiNVW4BmpN0MzX93H4qpwXhaaPXDL5CU0yRTSRr4NzNMGhJMiZ7e8DQX/fpyNMSJDB8EFYPBbLKXsXWrquUMA4S3zZEdpDewgt2Hbksps53syo+pXZ0ZJYVoBfU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0790663c178d3d2b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJiz1BpyQ+yJG/b0H720f8cNAFIza2oG2956dqaXqYgQYOrUveZwsnW4BGnQXCRBETm76qOpQ9sspikug3l9qOomzXQIpJYWPmoEkq9ZfUI/DiBWNDSS++eiW4KXjz9pTkECgtTIAa7pOH3uZ5BBpGt7eQ7GuvUBz7mwSf0heNwFxs2+B4s58hBwEb5N6TV6HovpIWard2yNxH2KNXjLjUND7DjnxkcmK/yYW+1mx+FNKN3DaWAd6wvpzmPBHeVx2cYP1J2Pb90UpfmYPsGZD90N8Kn9iW3gHXGJrqu4w9/2QfiOtKYfw7Jy3vOKcZHTn4avkXZXdXQE2q05qHocXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pfsxNnsT4NIh6xme90gDPokatEedxm6Zp05Lsz7/0A=;
 b=iX5HnMp+RKxpMXlClOeIF3Ccjp0jLSrkGadgNn1UBK8HJXqXvDeDp8nLq6ikne+z/gPY5Ph2rbt/Bb4VENAMWjc1s1zpdS+VJ9QemIdtqO7HGfPPDkH0NRBLVRzAQEI0DrjquxJ0enYHe5iTfB3/0En0ZgnCisFZwreQvhSmGfS9ltB4Vtm3RhMPYO1GYBl3DP/BZtC+JY1yHgkYmLVKJHiUjGZEYYhKI69GicToMxDjR6yDoTFUBNHSwA5TLuB1FWOHC3wRCsdt1FCb7YfgW/HNOfg2hta/K0gzXaqZNxcmId0b1LQy/RlHggfURGKHTGHqIQEpVC2g1SHb2tNoww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pfsxNnsT4NIh6xme90gDPokatEedxm6Zp05Lsz7/0A=;
 b=eduStwWsks90kTD1OOQVOEwnmcHS4LbEa/oYIDz1NZGxGpZgGiNVW4BmpN0MzX93H4qpwXhaaPXDL5CU0yRTSRr4NzNMGhJMiZ7e8DQX/fpyNMSJDB8EFYPBbLKXsXWrquUMA4S3zZEdpDewgt2Hbksps53syo+pXZ0ZJYVoBfU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, "iwj@xenproject.org" <iwj@xenproject.org>,
	Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v7 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Thread-Topic: [PATCH v7 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Thread-Index: AQHXwcz8unryLt1qUEeMdpd7xMjDNavUHq6AgAAKLQCAAANQAIAABYQA
Date: Fri, 15 Oct 2021 15:38:05 +0000
Message-ID: <9B3E6929-AA14-48ED-BE4F-65B7C4913B51@arm.com>
References: <cover.1634305870.git.bertrand.marquis@arm.com>
 <847d430fdeb19e695176ddea71eeb11dcef8b23e.1634305870.git.bertrand.marquis@arm.com>
 <YWmQa4uMA8usiHcu@MacBook-Air-de-Roger.local>
 <801F3B48-BAA0-4520-8B41-E83627AA845C@arm.com>
 <406fbce4-9e5a-a661-bd6a-a65956886f26@xen.org>
In-Reply-To: <406fbce4-9e5a-a661-bd6a-a65956886f26@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ba29ec9c-7444-4241-b648-08d98ff1d04d
x-ms-traffictypediagnostic: DBBPR08MB4728:|VE1PR08MB5872:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB58725EB8FAED42BF033A3B449DB99@VE1PR08MB5872.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4jiG0lWYbZhEWdFVqsYGrN0dK16bHZ0JEO4AeWoTCfskNdv2ZVr52ASiA7lShzofqXA04Uq4DqG+BtQcb9Y8GKTFsDahm0uUBN7f3ubHdaVxhrQjZM1ByCOHV01T5TMRQByAUhAWYOKHSrTYoELnVc7CmJTIn+A2nOADxd+uBsa2WhxPAaWs7RMrt4cflYfryPbk76hTfqFmckgMffPFLoM4DzV0jhvzih7P/LzVeQKvAMeXym0Y6Hvi0Gz2jUIXOxNGDO21bKod9H0TblmXHfvDY5UhjCGXp/h5mSeKMgsaRMEFwVivcvpQAOA+H8OnqiaTwj/k3AJgCReuiAdyA1BV+Bq3NHrOOXBMsBwez4S491rssIGKvPgf1/siIK/zuRg80qTrct3b9Pyd6L62Pz4MMoTHO9EhDmwVhmMc9/QG7GDnrgbHiI4jQ7VEqf+YGoQ4ng8BbL/btNxXQ7lr72qdPPWDhxvqzVHN5bKw6jMyXPdPVmyH2M6rlbsuhw7cbkqKnT2R5dBnOikpWhzdby7Dwl/Rl3VxpYixPrOQgzDFkSne14V0t41ZixxFn28LXnCofU/yXvi5VMs2LABC8rLy61m2AfRVW4M02LZ7ywjpH8+Sf35/e5aRxS8SzkHbOsUKhj9X4dQtLIF8Li9uTXxsaPldBt73aSKEvzyMndWuIzpwULudTdOhwAQb8KDiiqGLXvTyo++en8lFdQ3g9i8WkHrSc7iTGuZyrjifkjDmKB7UFsgNlxgzSDufe+0a
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33656002)(186003)(6916009)(316002)(4326008)(54906003)(2906002)(38070700005)(6486002)(66476007)(66556008)(64756008)(83380400001)(7416002)(66946007)(66446008)(5660300002)(91956017)(38100700002)(76116006)(2616005)(8676002)(36756003)(26005)(8936002)(6512007)(71200400001)(6506007)(508600001)(53546011)(122000001)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BEC3A492C6F1EF4C9E24C39B62A90A1F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4728
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	df98dc9a-5d06-4c1d-1824-08d98ff1c7da
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZhF3sKnKYZuf9Ia9rSnyRbK9k8qugPQn9wl5Mu+pTJj5RB/HVuh+8FRx8zBm9qs3CWkcaHSjM/ID6JScxaGtksP4fgIuCNTvX4QuA1ii/EhzjJcinDVgcUyDAyB8I69vyx6o3GRpDMuIztGXn0GHiwQ9pw+wD/PKkf0cfsV7FYq/QU/6UDKnUToNs6HG7C3SxwOFJ2G9kNJYu+SpBnVN9jzSOsXMftBADEMyz1VSHU+20qGBX+TJB/+RYr/ZOMurmW6JCgjh98jeXTpqxm6TNr4yNrRq7ZSh8b0+P6xGuVrFrHWqB1WYwp/rQdKJLGjBlFT3HyLbG+lIhFeanpaVzR6ZepG8o5+liwxifSNeUZWNFl1rreNNL1q2M3nfy0vzJMJQsX1rsUXYYO04NAuo4gzA1U17RdOhZ2d/kiYv7rpJYPo+vrPUFCbjv6+jifZmmTw4uiUHFX+tE00zz6VSv3PGznAEeEglgoZ3DZUnThYQKuVrSuzXARC+RGRFfdGspsOeFmVmCyEV+ldsQustKX/suysKBrGuRc4v3vKRBxkZ3acsZcMnC3+TO/qUyUdEObPwIQscSiXbBAJoq6FeLP2HK4tG+oc32nN5q81ZKO+6K3d+mMtHmlRub2ZycYe3vJKTEBSd4FbulTTm7m86pRCuUh3ZZpd2XVd4IZZczjzq+dh59gaqW4TZ95PIbmk0JJlCQ5bRDMRjzF+QEYIpdw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36860700001)(186003)(36756003)(70206006)(6862004)(6512007)(81166007)(70586007)(336012)(356005)(2616005)(508600001)(6486002)(4326008)(2906002)(5660300002)(8676002)(54906003)(26005)(83380400001)(8936002)(33656002)(47076005)(86362001)(316002)(82310400003)(6506007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 15:38:19.2830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba29ec9c-7444-4241-b648-08d98ff1d04d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5872

SGkgSnVsaWVuLA0KDQo+IE9uIDE1IE9jdCAyMDIxLCBhdCAxNjoxOCwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBCZXJ0cmFuZCwNCj4gDQo+IE9uIDE1LzEw
LzIwMjEgMTY6MDYsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4gT24gMTUgT2N0IDIwMjEs
IGF0IDE1OjMwLCBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6
DQo+Pj4gDQo+Pj4gT24gRnJpLCBPY3QgMTUsIDIwMjEgYXQgMDI6NTk6MTlQTSArMDEwMCwgQmVy
dHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4gRnJvbTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdo
QGFybS5jb20+DQo+Pj4+IA0KPj4+PiBUaGUgZXhpc3RpbmcgVlBDSSBzdXBwb3J0IGF2YWlsYWJs
ZSBmb3IgWDg2IGlzIGFkYXB0ZWQgZm9yIEFybS4NCj4+Pj4gV2hlbiB0aGUgZGV2aWNlIGlzIGFk
ZGVkIHRvIFhFTiB2aWEgdGhlIGh5cGVyIGNhbGwNCj4+Pj4g4oCcUEhZU0RFVk9QX3BjaV9kZXZp
Y2VfYWRk4oCdLCBWUENJIGhhbmRsZXIgZm9yIHRoZSBjb25maWcgc3BhY2UNCj4+Pj4gYWNjZXNz
IGlzIGFkZGVkIHRvIHRoZSBYZW4gdG8gZW11bGF0ZSB0aGUgUENJIGRldmljZXMgY29uZmlnIHNw
YWNlLg0KPj4+PiANCj4+Pj4gQSBNTUlPIHRyYXAgaGFuZGxlciBmb3IgdGhlIFBDSSBFQ0FNIHNw
YWNlIGlzIHJlZ2lzdGVyZWQgaW4gWEVODQo+Pj4+IHNvIHRoYXQgd2hlbiBndWVzdCBpcyB0cnlp
bmcgdG8gYWNjZXNzIHRoZSBQQ0kgY29uZmlnIHNwYWNlLFhFTg0KPj4+PiB3aWxsIHRyYXAgdGhl
IGFjY2VzcyBhbmQgZW11bGF0ZSByZWFkL3dyaXRlIHVzaW5nIHRoZSBWUENJIGFuZA0KPj4+PiBu
b3QgdGhlIHJlYWwgUENJIGhhcmR3YXJlLg0KPj4+PiANCj4+Pj4gRm9yIERvbTBsZXNzIHN5c3Rl
bXMgc2Nhbl9wY2lfZGV2aWNlcygpIHdvdWxkIGJlIHVzZWQgdG8gZGlzY292ZXIgdGhlDQo+Pj4+
IFBDSSBkZXZpY2UgaW4gWEVOIGFuZCBWUENJIGhhbmRsZXIgd2lsbCBiZSBhZGRlZCBkdXJpbmcg
WEVOIGJvb3RzLg0KPj4+PiANCj4+Pj4gVGhpcyBwYXRjaCBpcyBhbHNvIGRvaW5nIHNvbWUgc21h
bGwgZml4ZXMgdG8gZml4IGNvbXBpbGF0aW9uIGVycm9ycyBvbg0KPj4+PiBhcm0zMiBvZiB2cGNp
IGFuZCBwcmV2ZW50IDY0Yml0IGFjY2Vzc2VzIG9uIDMyYml0Og0KPj4+PiAtIHVzZSAlenUgaW5z
dGVhZCBvZiBsdSBpbiBoZWFkZXIuYyBmb3IgcHJpbnQNCj4+Pj4gLSBwcmV2ZW50IDY0Yml0IGFj
Y2Vzc2VzIGluIHZwY2lfYWNjZXNzX2FsbG93ZWQNCj4+Pj4gLSBpZmRlZiBvdXQgdXNpbmcgQ09O
RklHXzY0QklUIGhhbmRsaW5nIG9mIGxlbiA4IGluDQo+Pj4+IHZwY2lfZWNhbV97cmVhZC93cml0
ZX0NCj4+Pj4gDQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5naEBh
cm0uY29tPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5t
YXJxdWlzQGFybS5jb20+DQo+Pj4gDQo+Pj4gVGhlIHZwY2kgYml0cyBsb29rcyBmaW5lIHRvIG1l
LCBzbzoNCj4+PiANCj4+PiBBY2tlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+DQo+PiBUaGFua3MNCj4+PiANCj4+PiBJIGhhdmUgb25lIHF1ZXN0aW9uIGhvd2V2
ZXIgcmVsYXRlZCB0byB0aGUgcGxhY2VtZW50IG9mIHRoZSB2cGNpIHNldHVwDQo+Pj4gY2FsbCBp
biBwY2lfYWRkX2RldmljZS4NCj4+PiANCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL3BjaS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+Pj4gaW5k
ZXggM2FhOGMzMTc1Zi4uMDgyODkyYzhhMiAxMDA2NDQNCj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvcGNpLmMNCj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNp
LmMNCj4+Pj4gQEAgLTc2Niw3ICs3NjYsMjEgQEAgaW50IHBjaV9hZGRfZGV2aWNlKHUxNiBzZWcs
IHU4IGJ1cywgdTggZGV2Zm4sDQo+Pj4+ICAgICAgICAgbGlzdF9hZGQoJnBkZXYtPmRvbWFpbl9s
aXN0LCAmaGFyZHdhcmVfZG9tYWluLT5wZGV2X2xpc3QpOw0KPj4+PiAgICAgfQ0KPj4+PiAgICAg
ZWxzZQ0KPj4+PiArICAgIHsNCj4+Pj4gKyNpZmRlZiBDT05GSUdfQVJNDQo+Pj4+ICsgICAgICAg
IC8qDQo+Pj4+ICsgICAgICAgICAqIE9uIEFSTSBQQ0kgZGV2aWNlcyBkaXNjb3Zlcnkgd2lsbCBi
ZSBkb25lIGJ5IERvbTAuIEFkZCB2cGNpIGhhbmRsZXINCj4+Pj4gKyAgICAgICAgICogd2hlbiBE
b20wIGluZm9ybSBYRU4gdG8gYWRkIHRoZSBQQ0kgZGV2aWNlcyBpbiBYRU4uDQo+Pj4+ICsgICAg
ICAgICAqLw0KPj4+PiArICAgICAgICByZXQgPSB2cGNpX2FkZF9oYW5kbGVycyhwZGV2KTsNCj4+
Pj4gKyAgICAgICAgaWYgKCByZXQgKQ0KPj4+PiArICAgICAgICB7DQo+Pj4+ICsgICAgICAgICAg
ICBwcmludGsoWEVOTE9HX0VSUiAiU2V0dXAgb2YgdlBDSSBmYWlsZWQ6ICVkXG4iLCByZXQpOw0K
Pj4+PiArICAgICAgICAgICAgZ290byBvdXQ7DQo+Pj4+ICsgICAgICAgIH0NCj4+PiANCj4+PiBJ
J20gbGlrZWx5IGxvc3QgaGVyZSwgYnV0IHNob3VsZG4ndCB0aGlzIGFsc28gYmUgZG9uZSBmb3Ig
ZGV2aWNlcyB0aGF0DQo+Pj4gYmVsb25nIHRvIHRoZSBoYXJkd2FyZSBkb21haW4gYW5kIGFyZSBh
c3NpZ25lZCB0byBpdCBpbiB0aGUgZmlyc3QNCj4+PiBicmFuY2ggb2YgdGhpcyBjb25kaXRpb25h
bD8NCj4+PiANCj4+PiBPciBlbHNlIHlvdSB3aWxsIGVuZCB1cCB3aXRoIGRldmljZXMgYXNzaWdu
ZWQgdG8gdGhlIGhhcmR3YXJlIGRvbWFpbg0KPj4+IHRoYXQgZG9uJ3QgaGF2ZSB2UENJIHNldHVw
IGZvciB0aGVtLg0KPj4gSSBtaWdodCBiZSB3cm9uZyBidXQgd2hlbiB0aGUgaGFyZHdhcmUgZG9t
YWluIGlzIGRlY2xhcmluZyB0aGUgZGV2aWNlcyB0aGV5IGFyZSBhZGRlZCB0byBoaW0uDQo+PiBU
aGVuIGxhdGVyIHdoZW4gdGhvc2UgZGV2aWNlIGFyZSBhc3NpZ25lZCB0byBhIGd1ZXN0LCB0aGV5
IGFyZSByZW1vdmVkIGZyb20gdGhlIGhhcmR3YXJlIGRvbWFpbi4NCj4gDQo+IEZyb20gbXkgdW5k
ZXJzdGFuZGluZywgd2hlbiB0aGUgZGV2aWNlIGlzIGluaXRpYWxseSByZWdpc3RlcmVkIHdlIHdv
dWxkIGdvIHRocm91Z2ggdGhlIGZpcnN0IGJyYW5jaCBiZWNhdXNlIHBkZXYtPmRvbWFpbiBpcyBu
b3QgeWV0IHNldC4NCj4gDQo+IFRoZSBlbHNlIHdvdWxkIGJlIHRha2VuIG9ubHkgd2l0aCBzdWJz
ZXF1ZW50IGNhbGwgb2YgUEhZU0RFVk9QX21hbmFnZV9wY2lfYWRkICYgY28uDQo+IA0KPiBGb3Ig
dGhlIGRldmljZSBhc3NpZ25tZW50LCBhIGRpZmZlcmVudCBwYXRoIHdvdWxkIGJlIHRha2VuLiBU
aGlzIHdvdWxkIGdvIHRocm91Z2ggdGhlIGRvbWN0bCBYRU5fRE9NQ1RMX2Fzc2lnbl9kZXZpY2Uu
DQo+IA0KPiBUaGVyZWZvcmUsIEkgdGhpbmsgUm9nZXIgaXMgcmlnaHQgYW5kIHRoZSBjYWxsIGJl
bG9uZ3MgdG8gdGhlIGZpcnN0IGJyYW5jaC4gT3RoZXJ3aXNlLCB3ZSB3b3VsZCBtaXNzIG91dCB0
aGUgdnBjaSBoYW5kbGVycyBpbiBzb21lIGNhc2VzLg0KDQpZZXMgd2Ugb25seSB3YW50IHRoaXMg
dG8gYmUgZG9uZSBvbmNlIG9uIHRoZSBmaXJzdCBjYWxsLg0KDQpTbyBpbiBmYWN0IGl0IHNob3Vs
ZCBiZSBkb25lIHdoZW4gcGRldi0+ZG9tYWluIGlzIE5VTEwgaW4gdGhlIGZpcnN0IGJyYW5jaC4N
Cg0KSSB3aWxsIGRvIHRoaXMgaW4gdjguDQoNClRoYW5rcyBhIGxvdCBmb3IgdGhlIGFuYWx5c2lz
LCBzYXlpbmcgaXQgbWFrZXMgdGhpbmdzIG1vcmUgY2xlYXIgOi0pDQoNCkNoZWVycw0KQmVydHJh
bmQNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

