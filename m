Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B21C7741BB3
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 00:17:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556609.869269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEdT2-0005jG-HP; Wed, 28 Jun 2023 22:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556609.869269; Wed, 28 Jun 2023 22:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEdT2-0005gc-El; Wed, 28 Jun 2023 22:16:52 +0000
Received: by outflank-mailman (input) for mailman id 556609;
 Wed, 28 Jun 2023 22:16:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ay3k=CQ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qEdT1-0005gW-4l
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 22:16:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2082.outbound.protection.outlook.com [40.107.7.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79a396d8-1601-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 00:16:48 +0200 (CEST)
Received: from AS9PR06CA0172.eurprd06.prod.outlook.com (2603:10a6:20b:45c::35)
 by AM8PR08MB5619.eurprd08.prod.outlook.com (2603:10a6:20b:1d8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 22:16:18 +0000
Received: from AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::44) by AS9PR06CA0172.outlook.office365.com
 (2603:10a6:20b:45c::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.21 via Frontend
 Transport; Wed, 28 Jun 2023 22:16:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT022.mail.protection.outlook.com (100.127.140.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.20 via Frontend Transport; Wed, 28 Jun 2023 22:16:17 +0000
Received: ("Tessian outbound e2424c13b707:v142");
 Wed, 28 Jun 2023 22:16:17 +0000
Received: from 65d37b63d849.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EB84C7ED-6BCD-44DC-809E-99E11C799CDC.1; 
 Wed, 28 Jun 2023 22:16:10 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 65d37b63d849.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Jun 2023 22:16:10 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by VI1PR08MB9983.eurprd08.prod.outlook.com (2603:10a6:800:1c8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 28 Jun
 2023 22:16:07 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%5]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 22:16:06 +0000
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
X-Inumbo-ID: 79a396d8-1601-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YL+8vO1fPuHLtr+haOPeUDb5vAQltYsrQHcAvuNg/aE=;
 b=DCT09L562MCyjL1hZ775dummbATsJ0w1qu0Qhhy6B/M79R7HvGEEYrZ7nnEu6dGCWLm7Qdk9zXX1U3Q3TZ8UGUTV8BYDE/JvPlKnu4u8cjgN66GdUQCV2azt6AhpsGwBSLjMmoBoKVCjE71tlbG1xDahe3Who5PQTa0WHt0qcLM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e9fce5e95aea0427
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTzfgDISrDMYgDyR3972AqI0U5HCchRly27fn1syYQN41ITAcdwVsFS7SbyPJgRqdoYSEZvme6Ui6iTdeCo5Of+Iagm6A8arYrnJfk+VN7midsiaCq6zqz4jXKIU+r8EWEj0P0D18DTBuJslCR0KgAegEeWAoiuRlWza26C7LcWq3Aa59IMg2XDtukdayYrwJXXYMg2tF0mlzqTyEMTtczWumojgSmXP06nmrT1WbNavXxAQxzzVreS2io1bBSGoNeAq8ELYTsCRvIPwDHNeRYup3DdNnWvTv2ycB4Nsi33cJz3qURHXuteSk5qQZyK7nH1BytPjWQsG053L5p4lqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YL+8vO1fPuHLtr+haOPeUDb5vAQltYsrQHcAvuNg/aE=;
 b=VU9MswOXK3EY/0cSLlMAXlmtPMGTmJONquMn/Nt6JVTVJGsZCDZP/L8jEYw+Upl5CcTfjZ1zD2V8tKdgfmB1p76gdfvBBEzHuPT+0BAd6VPgzdcY39FQveVAdIZoKtS8kuVUn50zShTMEnqx70KoNDVCc1reFbKxZfWqY75k/adyfrsXNpNtTqt/9dWmn1JpHLBLg0UGtDqJeIHr93NQNsrSxYV6W4Jr0dF/5meazDlYs6Fc9LhyuRgbyXatXDYAkCVVjHuOegP2yUeBLV/Y0LC7ADGZS4uXOVLfPyaRPnprczuwFEn3gDkpUcEzmGS+n0N1a7TJhFzWoG4/TUi0Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YL+8vO1fPuHLtr+haOPeUDb5vAQltYsrQHcAvuNg/aE=;
 b=DCT09L562MCyjL1hZ775dummbATsJ0w1qu0Qhhy6B/M79R7HvGEEYrZ7nnEu6dGCWLm7Qdk9zXX1U3Q3TZ8UGUTV8BYDE/JvPlKnu4u8cjgN66GdUQCV2azt6AhpsGwBSLjMmoBoKVCjE71tlbG1xDahe3Who5PQTa0WHt0qcLM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <michal.orzel@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Henry Wang <Henry.Wang@arm.com>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 8/9] xen/arm: Allow the user to build Xen with USBAN
Thread-Topic: [PATCH 8/9] xen/arm: Allow the user to build Xen with USBAN
Thread-Index: AQHZqCVKqSS9NESvYkiMqVhGapxYkq+dCvMAgAFCKgCAAmPbgIAAGvUA
Date: Wed, 28 Jun 2023 22:16:06 +0000
Message-ID: <6D9B991F-C812-498C-97C8-5B6600022994@arm.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-9-julien@xen.org>
 <804682ce-ad88-34dc-1501-c9ff6347fb8b@amd.com>
 <f9afb315-34f8-0e1d-de67-5024fe7f616f@xen.org>
 <bfa85ebc-74a7-e693-6392-cee24302c19e@amd.com>
 <bedaa6de-5232-d497-a886-d3626f8efb0d@xen.org>
In-Reply-To: <bedaa6de-5232-d497-a886-d3626f8efb0d@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|VI1PR08MB9983:EE_|AM7EUR03FT022:EE_|AM8PR08MB5619:EE_
X-MS-Office365-Filtering-Correlation-Id: 5be733f7-4086-4d81-ed62-08db78254b69
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 t70yQa8/Wiycfmb1LSjelQTEJvlJTCTih5NH6ggn91WrIH26DxX4Mxbv5R0E7cUohqK8tAo4bwss+vBt1Di1U5t3ihAf2t2RnkvaVKdD4fNDDz+reIL0Mn4rd/zpV7wauydH2k/gptmhV4YST2T0eM6hOcU492b/Q0HwAJ0temAoUPt3A0OJiDDRTeKQr3YJAS8i8LZmou8N2Z4UMzK2/0s51wqalFz83qLIITzLXvbmrbgfIuceLgHIBr7vSEvBAFvdOlLz8DWI9ySbtv1Ni2g2NHel3gsSlaEUrgP3ymYLpaFk/4beQ1ycC+zA3J8PA//uNYXTpCh9ocwSJigvK94nUj+ufF6pm9ydkuXvIytB4C2n+znhyax2pyd9DaCZpB9z/zn4ZccI1iLx4y3GsLi4tzg0XfXrzknf8XR5k4nq5DDIIlEgrIoumUmT1gqLNPyGcgGLwno9GCYTMZdV1odZNw3Ii1ehzFWHRl4yQGTWPI/vFi9d5wp8vJVc7UgLXN5JPfh3XRgW5dj1W3theCkUH+HE4qxwrTYHkLp7A245lDjFMw8slHyzigzP9pf3s1CyLvKMkrpJH8qZnD3YTba65tjKLTHt1aayKEhCnLYEv91StqF6BJ11iMJI3QRyOPX9XDc2dQzWXp2O8sBucg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199021)(316002)(38100700002)(8936002)(8676002)(38070700005)(2616005)(33656002)(86362001)(6916009)(4326008)(36756003)(54906003)(66476007)(76116006)(83380400001)(66446008)(64756008)(66946007)(66556008)(41300700001)(2906002)(91956017)(71200400001)(5660300002)(6512007)(6486002)(186003)(26005)(478600001)(6506007)(66899021)(122000001)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6700186ED736C64AA5553DA8E7AEBA7D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9983
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	154130a3-182f-4a71-7c98-08db782544f7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fx3F41D3VE67uXZKeM0uZL0WQIj5YeeKfAe7djbQsZoDuioWBonCFhmVFEr4E8kXWMStYTB34wKrnbx2BB8cBORpuV+7D6qwq3eOpbdlqiSm5EwK1Fu0iDMIsSWy340VT918s3cGAWv+XOmdeLmaFyIb/x7i+fyyQC/ULzjem5h6hWiNIKFDprSg6O+LK0MJzve3zBdTCdTlJnPFbjk1CSsu1927pIMTJ3gG1dzTuzUCPJIwzT4iFpo70BHwHz4cu5Um+xapGzvoyX1qUz7nVxvkUExaF9Z/rMfYbu4z9WJrAQEnvl9hNwOjuIt22y6bZgc3XV9B6B6luJXDIWFIoCOhJkEXH57XVKJX/T1dy79GvO0nu9NLYrJkX48nR9VwOwJKBhnCMEenWD791i+SSg1/pOmah3UDhdvLwmE6V0VhNMVapeqq8+2i9NuNbVoSE/pGnvKkK332wPFaPn89YOuvGw3DBv9Yy30RyX8lwKOZN2XiFOuZoH6wGJFLC1RhVxKdEb0OG/Qy3osil+MMgYVGNk7yPujUXRbxMTF58/VmaHn3T8+uEIL3tReADlpBXoouAD/Ll05jXkiHS66nVi9aObmsJRE+MFyxvFxc3MJLrncojMLWuQBvAAjC38m5ztImZ8zws/20e2NZUKLNawr0+yRHJOfLISbLyleHzPrTkSgTMh+6g6GVnWZ6Syq/gB+USeLNQurALnzvm0J4bA2l8L5e8vhwdB2xXuKrmsOWuMGHPZ4DH42j00BuBgJt
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199021)(46966006)(40470700004)(36840700001)(36860700001)(53546011)(82310400005)(47076005)(107886003)(336012)(54906003)(6486002)(83380400001)(26005)(2906002)(2616005)(6512007)(478600001)(6506007)(186003)(5660300002)(356005)(6862004)(33656002)(70206006)(40460700003)(36756003)(70586007)(4326008)(81166007)(316002)(40480700001)(82740400003)(8936002)(8676002)(86362001)(41300700001)(66899021);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 22:16:17.6632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be733f7-4086-4d81-ed62-08db78254b69
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5619

DQoNCj4gT24gMjggSnVuIDIwMjMsIGF0IDIxOjM5LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMjcvMDYvMjAyMyAwOTowOSwgTWljaGFsIE9y
emVsIHdyb3RlOg0KPj4gSGkgSnVsaWVuLA0KPj4gT24gMjYvMDYvMjAyMyAxNDo1NiwgSnVsaWVu
IEdyYWxsIHdyb3RlOg0KPj4+IA0KPj4+IA0KPj4+IEhpLA0KPj4+IA0KPj4+IE9uIDI2LzA2LzIw
MjMgMTI6NTYsIE1pY2hhbCBPcnplbCB3cm90ZToNCj4+Pj4gDQo+Pj4+IA0KPj4+PiBPbiAyNS8w
Ni8yMDIzIDIyOjQ5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+PiANCj4+Pj4+IA0KPj4+Pj4g
RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4+Pj4+IA0KPj4+Pj4gVUJT
QU4gaGFzIGJlZW4gZW5hYmxlZCBhIGZldyB5ZWFycyBhZ28gb24geDg2IGJ1dCB3YXMgbmV2ZXIN
Cj4+Pj4+IGVuYWJsZWQgb24gQXJtIGJlY2F1c2UgdGhlIGZpbmFsIGJpbmFyeSBpcyBiaWdnZXIg
dGhhbiAyTUIgKA0KPj4+Pj4gdGhlIG1heGltdW0gd2UgY2FuIGN1cnJlbnRseSBoYW5kbGVkKS4N
Cj4+Pj4+IA0KPj4+Pj4gV2l0aCB0aGUgcmVjZW50IHJld29yaywgaXQgaXMgbm93IHBvc3NpYmxl
IHRvIGdyb3cgWGVuIG92ZXIgMk1CLg0KPj4+Pj4gU28gdGhlcmUgaXMgbm8gbW9yZSByb2FkYmxv
Y2sgdG8gZW5hYmxlIFhlbiBvdGhlciB0aGFuIGluY3JlYXNpbmcNCj4+Pj4+IHRoZSByZXNlcnZl
ZCBhcmVhLg0KPj4+Pj4gDQo+Pj4+PiBPbiBteSBzZXR1cCwgZm9yIGFybTMyLCB0aGUgZmluYWwg
YmluYXJheSB3YXMgdmVyeSBjbG9zZSB0byA0TUIuDQo+Pj4+PiBGdXJ0aGVybW9yZSwgb25lIG1h
eSB3YW50IHRvIGVuYWJsZSBVU0JBTiBhbmQgR0NPViB3aGljaCB3b3VsZCBwdXQNCj4+Pj4+IHRo
ZSBiaW5hcnkgd2VsbC1vdmVyIDRNQiAoYm90aCBmZWF0dXJlcyByZXF1aXJlIGZvciBzb21lIHNw
YWNlKS4NCj4+Pj4+IFRoZXJlZm9yZSwgaW5jcmVhc2UgdGhlIHNpemUgdG8gOE1CIHdoaWNoIHNo
b3VsZCB1cyBzb21lIG1hcmdpbi4NCj4+Pj4+IA0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVu
IEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4+Pj4+IA0KPj4+Pj4gLS0tLQ0KPj4+Pj4gDQo+
Pj4+PiBUaGUgZHJhd2JhY2sgd2l0aCB0aGlzIGFwcHJvYWNoIGlzIHRoYXQgd2UgYXJlIGFkZGlu
ZyA2IG5ldw0KPj4+Pj4gcGFnZS10YWJsZSAoMyBmb3IgYm9vdCBhbmQgMyBmb3IgcnVudGltZSkg
dGhhdCBhcmUgc3RhdGljYWxseQ0KPj4+Pj4gYWxsb2NhdGVkLiBTbyB0aGUgZmluYWwgWGVuIGJp
bmFyeSB3aWxsIGJlIDI0S0IgYmlnZ2VyIHdoZW4NCj4+Pj4+IG5laXRoZXIgVUJTQU4gbm9yIEdD
T1YuDQo+Pj4+PiANCj4+Pj4+IElmIHRoaXMgaXMgbm90IGNvbnNpZGVyZWQgYWNjZXB0YWJsZSwg
dGhlbiB3ZSBjb3VsZCBtYWtlIHRoZQ0KPj4+Pj4gc2l6ZSBvZiBjb25maWd1cmFibGUgaW4gdGhl
IEtjb25maWcgYW5kIGRlY2lkZSBpdCBiYXNlZCBvbiB0aGUNCj4+Pj4+IGZlYXR1cmVzIGVuYWJs
ZWQuDQo+Pj4+IEJvdGggb2YgdGhlc2UgZmVhdHVyZXMgYXJlIGVuYWJsZWQgb25seSBpbiBhIGRl
YnVnIGJ1aWxkIG9mIFhlbiwgc28NCj4+Pj4gYW5vdGhlciBvcHRpb24gd291bGQgYmUgdG8gaW5j
cmVhc2UgWGVuIHNpemUgb25seSBmb3IgYSBkZWJ1ZyBidWlsZC4NCj4+PiANCj4+PiBBdCBsZWFz
dCBVQlNBTiBjYW4gYmUgc2VsZWN0ZWQgd2l0aG91dCBERUJVRy4gRm9yIHRoYXQgeW91IG5lZWQg
dG8gYWRkDQo+Pj4gRVhQRVJULg0KPj4+IA0KPj4+IEFueXdheSwgZnJvbSB5b3VyIGNvbW1lbnQs
IGl0IGlzIG5vdCBjbGVhciB0byBtZSB3aGV0aGVyIHlvdSBkaXNsaWtlIHRoZQ0KPj4+IGV4aXN0
aW5nIGFwcHJvYWNoIChhbmQgd2h5KSBvciB5b3UgYXJlIE9LIHdpdGggdGhlIGluY3JlYXNlLg0K
Pj4gU29ycnksIEkgd2FzIHRyYXZlbGluZyBhbmQgZGlkIG5vdCBoYXZlIHRpbWUgdG8gY29tcGxl
dGUgcmV2aWV3Lg0KPj4gSSBjYW5ub3Qgc2VlIHdoeSBpbmNyZWFzaW5nIHRoZSBzaXplIHdvdWxk
IGJlIHByb2JsZW1hdGljIHNvIGl0IGlzIG9rLiBUaGF0IHNhaWQsIGl0IGNvdWxkIGJlDQo+PiBh
IGdvb2QgaWRlYSB0byB3cml0ZSBzb21lIGNvbW1lbnQgYWJvdmUgWEVOX1ZJUlRfU0laRSwgdGhh
dCB0aGlzIHZhbHVlIGlzIHNvbWV3aGF0IGV4YWdnZXJhdGVkLA0KPj4gc28gdGhhdCB3ZSBhcmUg
b24gdGhlIHNhZmUgc2lkZSBhdCB0aGUgdGltZSBvZiBhY3RpdmF0aW5nIGZlYXR1cmVzIGxpa2Ug
VUJTQU4vR0NPVi4NCj4gDQo+IFN1cmUuIEkgd2lsbCBhZGQgYSBjb21tZW50IGluIHRoaXMgcGF0
Y2guIEZvciAuLi4NCj4gDQo+PiBBbHNvLCBpdCB3b3VsZCBiZSBuaWNlIHRvIHVwZGF0ZSBjb21t
ZW50cyBpbiBoZWFkLlMgb2YgYm90aCBhcm0zMiBhbmQgYXJtNjQgYWJvdmUNCj4+IEdMT0JBTChz
dGFydCkgdGhhdCB3ZXJlIGxlZnQgc3RhdGluZzoNCj4+ICJBbGwgb2YgdGV4dCtkYXRhK2JzcyBt
dXN0IGZpdCBpbiAyTUIsIG9yIHRoZSBpbml0aWFsIHBhZ2V0YWJsZSBjb2RlIGJlbG93IHdpbGwg
bmVlZCBhZGp1c3RtZW50LiINCj4gDQo+IC4uLiB0aGlzIG9uZSwgSSBhbSB0aGlua2luZyB0byBk
cm9wIHRoZSBjb21tZW50cyBpbiBwYXRjaCAjNS4gVGhleSBkb24ndCBtYWtlIHNlbnNlIGFueW1v
cmUgYXMgd2UgY2FuIG5vdyBpbiB0aGVvcnkgZGVhbCB3aXRoIFhlbiB1cCB0byB0aGUgc2l6ZSBv
ZiBhIEwyIG1hcHBpbmcgKDFHQiBmb3IgNEtCKS4NCj4gDQo+PiBPdGhlciB0aGFuIHRoYXQ6DQo+
PiBSZXZpZXdlZC1ieTogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4NCj4gDQo+
IFRoYW5rcy4NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0KSGkg
SnVsaWVuLA0KDQpEb27igJl0IGtub3cgaWYgaXQgd2FzIHBvaW50ZWQgb3V0IGJlZm9yZSwgYnV0
IHRoZSBjb21taXQgbWVzc2FnZSBoYXMgYSB0eXBvIHMvVVNCQU4vVUJTQU4vDQoNCkNoZWVycywN
Ckx1Y2ENCg0KDQo=

