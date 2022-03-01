Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7403D4C840D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 07:30:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280876.478966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOw1I-0003pK-Dh; Tue, 01 Mar 2022 06:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280876.478966; Tue, 01 Mar 2022 06:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOw1I-0003n5-AV; Tue, 01 Mar 2022 06:30:00 +0000
Received: by outflank-mailman (input) for mailman id 280876;
 Tue, 01 Mar 2022 06:29:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQ5=TM=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nOw1G-0003mx-Op
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 06:29:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02e5577f-9929-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 07:29:56 +0100 (CET)
Received: from DB7PR03CA0101.eurprd03.prod.outlook.com (2603:10a6:10:72::42)
 by AM8PR08MB6322.eurprd08.prod.outlook.com (2603:10a6:20b:361::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 1 Mar
 2022 06:29:55 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::46) by DB7PR03CA0101.outlook.office365.com
 (2603:10a6:10:72::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26 via Frontend
 Transport; Tue, 1 Mar 2022 06:29:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Tue, 1 Mar 2022 06:29:54 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Tue, 01 Mar 2022 06:29:54 +0000
Received: from 75cbe0c61b86.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 860FB1B7-6B12-4777-A6AE-3E08BE806D5C.1; 
 Tue, 01 Mar 2022 06:29:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 75cbe0c61b86.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 01 Mar 2022 06:29:48 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM8PR08MB6611.eurprd08.prod.outlook.com (2603:10a6:20b:36b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Tue, 1 Mar
 2022 06:29:36 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::89b3:80a2:2b58:f1aa]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::89b3:80a2:2b58:f1aa%4]) with mapi id 15.20.5017.026; Tue, 1 Mar 2022
 06:29:36 +0000
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
X-Inumbo-ID: 02e5577f-9929-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=569+K7VJtERt2TIYl+OHCZ9vzeGA5TWw0XVMsfKP690=;
 b=m5ixOASo2NsqKF5wrjjlVa9eoLG8c55zCzA1pxw9buASedo8dYVCQ6QVQaU4tPXLsXZXRzsN1/afAMDuwyqcO4MQ3N4qHhu70kq1yXcQ7M4+0L7mVLIRpWNKshIwPHYkjin00sLBKKzaPXSN2BTPAqhmAAa5y0/fEu48v9bXE58=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIcf+jGPgI4us+TiBWqTBxS2tFvAO4KkTAKgxhq8N1bo+6PIik9VdJNbatIWD7XgK00dF4ZqXaIokXRvODbSgWdJL/6SASGmERVwMwRJoQVxQXEOh7xO4KUV8w2micIBaQdur6WY3YjMgxATMExKLYVtugZL5haru3TOVNkUEMl0G19lvTyHfFMKi9L5cHpk8qTFM3mBgUioFLdDdglTq/6kEuByVFWe0ETd8Wd2YgdhBA+evwXT1bpfLVa9ufDTUqBu9TLz5s5iF90Z4ZEw26O5m8tB/55cemouKkCLn/ej6wF9tv4rZd33tbMv6ZGu+jEATjIMLlhGAmltDv7Vrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=569+K7VJtERt2TIYl+OHCZ9vzeGA5TWw0XVMsfKP690=;
 b=eQUPs3Jw+uaaOtjrqGlcw8VjpbmtpPIcuXzKDzY1y/YoMbVkq9KJlFMZpQ+x/+/cJbnL5DFnshtd9d9YvBNu9VH4O99KFAV82AODrDSFCTLo7Z4MyTw3tzj7hVKD/51UK2hDI8unQfb8HeZSzTp2mcUCTWlyOAGobpxxph5fo4f2bYlERAyQYERM4i9F0JMvHT36NjbIOe+s5C820fR70oNRIfVwUlv9bQwNgqh6eXDskrFIkDoD2PlzTfvctinsIC5E+XIVEn+SB4fYrFhIqvIwLVXa8otfcHwRdEqA6WJjeQYb+zls8S0OQbo1IgBC2iN83GDoGkzBJkgKb5UCwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=569+K7VJtERt2TIYl+OHCZ9vzeGA5TWw0XVMsfKP690=;
 b=m5ixOASo2NsqKF5wrjjlVa9eoLG8c55zCzA1pxw9buASedo8dYVCQ6QVQaU4tPXLsXZXRzsN1/afAMDuwyqcO4MQ3N4qHhu70kq1yXcQ7M4+0L7mVLIRpWNKshIwPHYkjin00sLBKKzaPXSN2BTPAqhmAAa5y0/fEu48v9bXE58=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Henry Wang <Henry.Wang@arm.com>, nd <nd@arm.com>
Subject: RE: Proposal for Porting Xen to Armv8-R64 - DraftA
Thread-Topic: Proposal for Porting Xen to Armv8-R64 - DraftA
Thread-Index: AdgpQxtXwh7LkfydTgiYk9bhMgU+ogAn0mUAABEK2UAAF1ylAACsO9Yw
Date: Tue, 1 Mar 2022 06:29:36 +0000
Message-ID:
 <PAXPR08MB74200F4B0B4EFFD5BE1A6E699E029@PAXPR08MB7420.eurprd08.prod.outlook.com>
References:
 <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2202241606450.239973@ubuntu-linux-20-04-desktop>
 <AS1PR08MB74269923288B75097392BDD99E3E9@AS1PR08MB7426.eurprd08.prod.outlook.com>
 <4c558f8f-56d4-0445-32d4-169bc5d0a3bc@xen.org>
In-Reply-To: <4c558f8f-56d4-0445-32d4-169bc5d0a3bc@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: AEAD95AB30517741B057DA32500378FD.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 86ebe9b8-4430-4631-d23d-08d9fb4ce63d
x-ms-traffictypediagnostic:
	AM8PR08MB6611:EE_|DB5EUR03FT064:EE_|AM8PR08MB6322:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB6322C283C05710115BDEF5EC9E029@AM8PR08MB6322.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sHxs9RTY5VY/gN5WFa2ed22E7XNPWYwduLoT3I2NLGGBYDZ4lwcP26i92rlhA3mVu42qG7GaOvcxyBCdca+6PDT6pBywXdoc1/Jx9bPR3lbRakgJ67c4rSK90K4DJ1dEMmdF2RPUgLkebEXQYizzp5lmO7JwJYMjFCui8V/UnJXFNafA0mAN/8xUoUj1pKZWyqAjo/UQ3sOEyW00NkSqzFAWXDOGlCdvz/Nux/iG/HdScfNoWTseNBLB4Y7lI2O7OBCUxpGUOwkVeQT+E4a1Y85bteH4msalhWkMu4CZEUp1WObAk20JdxJgS8NOop48S2hjsAANf5zykUoLF6jBisXhU0i8lteRdaYRu9g9WVikhG414ZUARCgDfrQW3lx1xHkCUh7piABGoIfiPDTQ36Qvg5UkDYOgrFrGePSjLx22y1g77PdRk+4XZNVzVhA9r6yNH7bD+nyyKpcf511MnyU4YIcoGkDq8LfoDhegkzChuLM4Lb7SE+ROKD+T9Z+AaweBjL06fQM+RJJ9hmCQ/Wkw3WPhfUSNoQ/kGof4X963RpIRRVdl9pQlSrDBUpJWCLgPc/fsVNLKbQKtNOsuBofn+IJu6XRbTGwkkzwmX7JjZAqary2FuRg3pCnx192ZToyjAdQoIZ+CXwLyoXkHGb4rtiF3YUTRVxKqjGzCWyAPJh3YA/Y5l/kIcQFJE1phpCG/gK+2ixdpg14dIgv7dQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(110136005)(52536014)(86362001)(55016003)(66446008)(8676002)(64756008)(33656002)(4326008)(186003)(26005)(66946007)(76116006)(66556008)(66476007)(83380400001)(316002)(6506007)(9686003)(122000001)(53546011)(7696005)(508600001)(38100700002)(8936002)(71200400001)(38070700005)(54906003)(5660300002)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6611
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0589c3a8-88ab-4ab0-67df-08d9fb4cdb2f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7XrtFoT8jl90XPuPhv41et1t7di1eYZmb8ZBPoBqVZn0NCsBoqhdOPUPNlzaO340r1sRK9H+uf6ClXpZ/ojYq0CEdxBlpa28HUgre1oBatlATTSqm9VPVKGY1BfZCVLcRiqc5Qi8R17OBqBjounuSH8EvynFQtRBbAEmvHvxeKif6SPT0MdreZZgF6PxPWaCa8uvNFlC6UvXeV3DuEhbmpQim+Z7S9jSIeDk26/hhMjA3ZRVnhU4OvIQtKaBLTkKM3f2XpUYalk8slq+wvP9x2Nv+1c9s9/M8ckaeiwDtWQVnN4p3jf7i5o9MRxm/XTcjW8sX2RrzYXnn9YHvpnOkitbcSVJN9ZIEclZ10/9PC7BFb1Cd9ZVzbK/8au8juIeeYJwlDndCGr3xb9Ph7gBG+SgVUcwArpHcdD5YhElvTR3KmLJFfyLb/mOvEQRdinKM0Xh6kA+4Azl6Cf2xWCtvGnLHJr0NmrCDJ/B1j1g8y5DZWM99lcmq2qr+0K+cuJ01pvhURj6z7Pg6IHeFS1sO29OHcpnupfRyR6/3EFsXp9Fhew/qcuBzVtRs+QCBMiFrGrruzW8vkBUDPeEht2FbPNZM/hwCg6MhQtEgUGOZ5kDaMSVPVO1UMACpgvpWZkQKWMcMnofPjulT4r/iyC+jRVx+Xy11NTo2BNjB4VIrXr2XaE913JCNePEXkBsmLc5
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(54906003)(8676002)(70586007)(70206006)(316002)(110136005)(8936002)(508600001)(36860700001)(52536014)(40460700003)(4326008)(81166007)(7696005)(53546011)(9686003)(5660300002)(47076005)(2906002)(6506007)(356005)(33656002)(55016003)(336012)(82310400004)(83380400001)(86362001)(186003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 06:29:54.8533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ebe9b8-4430-4631-d23d-08d9fb4ce63d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6322

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjLlubQy5pyIMjbml6UgNDoxMg0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4g
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmc7IEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFBl
bm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgSGVucnkgV2FuZw0KPiA8SGVucnkuV2Fu
Z0Bhcm0uY29tPjsgbmQgPG5kQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBQcm9wb3NhbCBmb3Ig
UG9ydGluZyBYZW4gdG8gQXJtdjgtUjY0IC0gRHJhZnRBDQo+IA0KPiBIaSBXZWksDQo+IA0KPiBP
biAyNS8wMi8yMDIyIDEwOjQ4LCBXZWkgQ2hlbiB3cm90ZToNCj4gPj4gPsKgwqDCoMKgIEFybXY4
LVI2NCBjYW4gc3VwcG9ydCBtYXggdG8gMjU2IE1QVSByZWdpb25zLiBCdXQgdGhhdCdzIGp1c3QN
Cj4gPj4gdGhlb3JldGljYWwuDQo+ID4+ID7CoMKgwqDCoCBTbyB3ZSBkb24ndCB3YW50IHRvIGRl
ZmluZSBgcHJfdCBtcHVfcmVnaW9uc1syNTZdYCwgdGhpcyBpcyBhDQo+IG1lbW9yeQ0KPiA+PiB3
YXN0ZQ0KPiA+PiA+wqDCoMKgwqAgaW4gbW9zdCBvZiB0aW1lLiBTbyB3ZSBkZWNpZGVkIHRvIGxl
dCB0aGUgdXNlciBzcGVjaWZ5IHRocm91Z2ggYQ0KPiA+PiBLY29uZmlnDQo+ID4+ID7CoMKgwqDC
oCBvcHRpb24uIGBDT05GSUdfQVJNX01QVV9FTDFfUFJPVEVDVElPTl9SRUdJT05TYCBkZWZhdWx0
IHZhbHVlIGNhbg0KPiBiZQ0KPiA+PiBgMzJgLA0KPiA+PiA+wqDCoMKgwqAgaXQncyBhIHR5cGlj
YWwgaW1wbGVtZW50YXRpb24gb24gQXJtdjgtUjY0LiBVc2VycyB3aWxsIHJlY29tcGlsZQ0KPiBY
ZW4NCj4gPj4gd2hlbg0KPiA+PiA+wqDCoMKgwqAgdGhlaXIgcGxhdGZvcm0gY2hhbmdlcy4gU28g
d2hlbiB0aGUgTVBVIGNoYW5nZXMsIHJlc3BlY2lmeWluZyB0aGUNCj4gPj4gTVBVDQo+ID4+ID7C
oMKgwqDCoCBwcm90ZWN0aW9uIHJlZ2lvbnMgbnVtYmVyIHdpbGwgbm90IGNhdXNlIGFkZGl0aW9u
YWwgcHJvYmxlbXMuDQo+ID4+DQo+ID4+IEkgd29uZGVyIGlmIHdlIGNvdWxkIHByb2JlIHRoZSBu
dW1iZXIgb2YgTVBVIHJlZ2lvbnMgYXQgcnVudGltZSBhbmQNCj4gPj4gZHluYW1pY2FsbHkgYWxs
b2NhdGUgdGhlIG1lbW9yeSBuZWVkZWQgdG8gc3RvcmUgdGhlbSBpbiBhcmNoX3ZjcHUuDQo+ID4+
DQo+ID4NCj4gPiBXZSBoYXZlIGNvbnNpZGVyZWQgdG8gdXNlZCBhIHByX3QgbXB1X3JlZ2lvbnNb
MF0gaW4gYXJjaF92Y3B1LiBCdXQgaXQNCj4gc2VlbXMNCj4gPiB3ZSB3aWxsIGVuY291bnRlciBz
b21lIHN0YXRpYyBhbGxvY2F0ZWQgYXJjaF92Y3B1IHByb2JsZW1zIGFuZCBzaXplb2YNCj4gaXNz
dWUuDQo+IA0KPiBEb2VzIGl0IG5lZWQgdG8gYmUgZW1iZWRkZWQgaW4gYXJjaF92Y3B1PyBJZiBu
b3QsIHRoZW4gd2UgY291bGQgYWxsb2NhdGUNCj4gbWVtb3J5IG91dHNpZGUgYW5kIGFkZCBhIHBv
aW50ZXIgaW4gYXJjaF92Y3B1Lg0KPiANCg0KV2UgaGFkIHRob3VnaHQgdG8gdXNlIGEgcG9pbnRl
ciBpbiBhcmNoX3ZjcHUgaW5zdGVhZCBvZiBlbWJlZGRpbmcgbXB1X3JlZ2lvbnMNCmludG8gYXJj
aF92Y3B1LiBCdXQgd2Ugbm90aWNlZCB0aGF0IGFyY2hfdmNwdSBoYXMgYSBfX2NhY2hlbGluZV9h
bGlnbmVkDQphdHRyaWJ1dGUsIHRoaXMgbWF5IGJlIGJlY2F1c2Ugb2YgYXJjaF92Y3B1IHdpbGwg
YmUgdXNlZCB2ZXJ5IGZyZXF1ZW50bHkNCmluIHNvbWUgY3JpdGljYWwgcGF0aC4gU28gaWYgd2Ug
dXNlIHRoZSBwb2ludGVyIGZvciBtcHVfcmVnaW9ucywgbWF5IGNhdXNlDQpzb21lIGNhY2hlIG1p
c3MgaW4gdGhlc2UgY3JpdGljYWwgcGF0aCwgZm9yIGV4YW1wbGUsIGluIGNvbnRleHRfc3d0aWNo
Lg0KDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

