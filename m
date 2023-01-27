Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C2967E297
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 12:04:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485431.752651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLMXH-0000Xt-Bc; Fri, 27 Jan 2023 11:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485431.752651; Fri, 27 Jan 2023 11:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLMXH-0000VC-8M; Fri, 27 Jan 2023 11:04:47 +0000
Received: by outflank-mailman (input) for mailman id 485431;
 Fri, 27 Jan 2023 11:04:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JKSU=5Y=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pLMXF-0000Ta-Np
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 11:04:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2081.outbound.protection.outlook.com [40.107.22.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65afcf75-9e32-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 12:04:42 +0100 (CET)
Received: from AS8PR04CA0068.eurprd04.prod.outlook.com (2603:10a6:20b:313::13)
 by DB9PR08MB9948.eurprd08.prod.outlook.com (2603:10a6:10:3d0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 11:04:39 +0000
Received: from AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::1b) by AS8PR04CA0068.outlook.office365.com
 (2603:10a6:20b:313::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Fri, 27 Jan 2023 11:04:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT033.mail.protection.outlook.com (100.127.140.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Fri, 27 Jan 2023 11:04:39 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Fri, 27 Jan 2023 11:04:38 +0000
Received: from 35e18bb5e9c7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 39D4614B-5018-4448-9B88-75CF38E143BA.1; 
 Fri, 27 Jan 2023 11:04:33 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 35e18bb5e9c7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 27 Jan 2023 11:04:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB6459.eurprd08.prod.outlook.com (2603:10a6:10:256::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 11:04:23 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.6043.023; Fri, 27 Jan 2023
 11:04:23 +0000
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
X-Inumbo-ID: 65afcf75-9e32-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yr8Ewi+aEYg+FppOqBJ5NN8pgGWxGVq5zqHmAceUmPk=;
 b=iGGNuFTmLJRBBOyciKBVMO2FlIV2DEFKoWC4ANn/ONb60+/fYP7BO0eijdt1R27CaC1QDMFs+CYCrrfTGUQkRQ+duNE4+gNRBm9tOCsWSKe5DCBu0IqqIDH6+PFTwu0DECDjP7GkXdyP0/fiBR5nKII6YUVIPidTApNaIqBFz1Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uc31rkgnuo2O3lpb1Pun+1StVFCSG3V+6OwwlC0u2w8mYWRah0iqRJZg9w9N/wOOI1xFvtkCGeeDO94BuSHgN6sTb6W7tuCEtFCe59AXQ7S2fZVMB30xzwT/lLDLqKB3GLUI2Y8/gWL3FGfpS9oBkld0jSlddJ5oj/Y+CnBP/cPha5rdHY5Q0eQmb4GQXfewE8yV3fWV5SjxsshG3d6rdqPjizep8MefVL8kWWXaG7xHSZdiQH01T2jhOieCSDp6ThVRXuukRER4D3mnKYUimRjJ2iEx88orxsjf4ERFWehBauD1GwYVHWpuuT5+FNqETJc7BxVtqqgrWElzLZ8XXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yr8Ewi+aEYg+FppOqBJ5NN8pgGWxGVq5zqHmAceUmPk=;
 b=Q6Z4kT0pEdGYeiZFj+oC2BUDZ+FCwj13kpREfQHzPvAQy+xREmJG/1zk7TvIrJef3SCN7X0wzVkOK2tmOjf24UnlEU1rXVTLTY06piPpzvF8BmZ+8eSbIbd/0FjX/6DxBjtkpKntEfL0am84Kj1HNx31FRnTtlJtBmfnlAYeYYBPEv9ltoYXhkdSI5QujqJ5pKFON8GTkRgdnw8Z5pEF53R31e149W89AzJfywnZntZhwLAi19ZFoBkRsbV+GDXb1f3KpQ3Gfy7J0J04Ecs7X1vuoTljLPB19vL6lrhbkGfHYueAlloHjuiGlZpgTan/4XVHzPmFJXNz8IZVV0JbSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yr8Ewi+aEYg+FppOqBJ5NN8pgGWxGVq5zqHmAceUmPk=;
 b=iGGNuFTmLJRBBOyciKBVMO2FlIV2DEFKoWC4ANn/ONb60+/fYP7BO0eijdt1R27CaC1QDMFs+CYCrrfTGUQkRQ+duNE4+gNRBm9tOCsWSKe5DCBu0IqqIDH6+PFTwu0DECDjP7GkXdyP0/fiBR5nKII6YUVIPidTApNaIqBFz1Q=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 1/3] xen/arm: Reduce redundant clear root pages when
 teardown p2m
Thread-Topic: [PATCH 1/3] xen/arm: Reduce redundant clear root pages when
 teardown p2m
Thread-Index: AQHZKU4erKVguEhJ4EOF/N1uL2C1/a6nFMuAgAbbyYCABDoEcA==
Date: Fri, 27 Jan 2023 11:04:23 +0000
Message-ID:
 <AS8PR08MB79917007B583442AB6B43F9892CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230116015820.1269387-1-Henry.Wang@arm.com>
 <20230116015820.1269387-2-Henry.Wang@arm.com>
 <36821aa0-4e88-57f7-3f8b-35ba0529fabf@amd.com>
 <59f4d24a-44cf-fa8f-bdac-2af036f2cd30@xen.org>
In-Reply-To: <59f4d24a-44cf-fa8f-bdac-2af036f2cd30@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4FB410BE413FDF40973393DD219C82C1.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB6459:EE_|AM7EUR03FT033:EE_|DB9PR08MB9948:EE_
X-MS-Office365-Filtering-Correlation-Id: c09c80c6-7712-44ac-79a0-08db005648cb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dVWjZcOKmnoVyoBb8aeI513zDgrOik4o3+/G5pxwOt6XYvJ3IFsgBELlKQ5klfppgXuNAIxPB+Dy8Jhpxk9SjhFBOQeE/cDOJPvMPWtOZ8gkyP0YvcvsuB05NsLR5jU7IrgvH33wLI23Fv07FUkZDVHf7Eu6XoKj+c29oUt5dnAPzJaccVlA4XLE4Fd3Y1imM3QGtoZkw11l+Up6yhbDIoU2xL+GsRb/u0RVBEwBwx13CKS+fSCLb3gwOG5U+csY7aM9zMdd1uNoTyIYU6I2Lg9q+tSlBYkWPxcdAonHZtMpNcd01ehVTt4SCWLTc2QK1YtGEfsG6RB7fIXfRwLUq+URAsJvTIHK9sZEQ/Fwmibr8pKqWE4CuV4MYr7bl+OZe22ga8027P16mh1oPJQfFfw0B3VW2n0iVpzGyms0oxr3ZF9JtG/2sayajK5aElGpcKw9JATYumrQstVkyNRgIy4pWS074+Q7PVU2jdo39dLjBuJy2j8JgqrfSx4qkEijsladJ167vSGm7J8P1wF/jf3pDQFG46UL+UlFt/GsuTb3t9kKtMw1c7gwWQQ7EsTwz+8r5rt3p12lyXwvrnk3lXyaLvfZabLBUz/E2bdNErGMx7Oy4KNiAi2VbSlW7EVpJ5CXkJ3HiYvCKyq1c3IkIsSVg8Onx6QmSlad+sU6gDzR7qjpQd3U3hKYi7K/6TRrnbhbYh6iztzykfHQV45gJA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(451199018)(41300700001)(66476007)(66446008)(64756008)(66556008)(55016003)(83380400001)(86362001)(7696005)(316002)(38100700002)(38070700005)(122000001)(110136005)(54906003)(76116006)(8676002)(66946007)(71200400001)(6506007)(186003)(26005)(478600001)(4326008)(33656002)(9686003)(2906002)(8936002)(52536014)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6459
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b83e45b0-09a2-477c-965f-08db00563f8d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fz2vwi1el5Gg4scoKG08nOgM9Y8a0UrrgcsSHNODDEIXv2XkmZMUY9dbm+sKL9sXszHxZXRuwv1MDEMqfWbtrMDYyLoxux2Kp5TN2iPsDKKBRSslQybAQJtbT9uAVNWsIIdqwZgPO0B9O6NZGvglmxTBHLxwJapS57LNB0I5arHT4d4i+BqcKWVMLQVZqgbIzFno7WfKuRN2zgjrsO2D7LVYCuMGDecdsaRrARUzrtaD0LwGOQiMjRzb9F/ZyrCVjrN7AioF9pXIzVX9C0eZqZTsJW+9cvBG8S1IK4tYvKbXoJHx7XvHKI+cfwCUb5v+r+aruqduBKCYQERmQDYXjadVPiPveDQuQtDx6G0jz4ukA57PaM0+8NDz9x/Nuie8IEQG55sIxb2oy1/RfPwAzazSeliwgFRLrhDn485H7OVuowHelJlrQNe2iASm+U8HhvwTTmmIDWYd1X/jzq4YICcNxf0gUbMNAUXCqmFaY7r6WlRxNbJ6gnSHQP+PO71f80Wl/2dSKtkuJfuK0C3hFMX9RVbarvpaK02MFceHPWodGw9AUHvFZruyyr1ONpkc/zGm5apoFEL55HatXQucgk1IhMdkppaigjiNcGIy6vN3oYf1apEo4Vzw2zp6nUguMZnX+fiJyMHTqfaGXKKm7wJE6ftP5kIcjmgwr/tTJJaFmQwjTX/6+sRIM/svfraq8LWTkTKatJp9QBN9N03QDg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199018)(40470700004)(46966006)(36840700001)(83380400001)(36860700001)(336012)(40460700003)(86362001)(82740400003)(110136005)(316002)(54906003)(5660300002)(47076005)(55016003)(81166007)(40480700001)(33656002)(356005)(82310400005)(7696005)(9686003)(107886003)(478600001)(2906002)(26005)(8676002)(4326008)(8936002)(186003)(70586007)(70206006)(6506007)(52536014)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 11:04:39.0914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c09c80c6-7712-44ac-79a0-08db005648cb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9948

SGkgTWljaGFsIGFuZCBKdWxpZW4sDQoNCkFwb2xvZ2llcyBmb3IgdGhlIGxhdGUgcmVzcG9uc2Uu
DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gKyAgICBQUk9HUkVTUyhwMm1f
cm9vdCk6DQo+ID4+ICsgICAgICAgIC8qDQo+ID4+ICsgICAgICAgICAqIFdlIGFyZSBhYm91dCB0
byBmcmVlIHRoZSBpbnRlcm1lZGlhdGUgcGFnZS10YWJsZXMsIHNvIGNsZWFyIHRoZQ0KPiA+PiAr
ICAgICAgICAgKiByb290IHRvIHByZXZlbnQgYW55IHdhbGsgdG8gdXNlIHRoZW0uDQo+ID4gVGhl
IGNvbW1lbnQgZnJvbSBoZXJlLi4uDQo+ID4+ICsgICAgICAgICAqIFRoZSBkb21haW4gd2lsbCBu
b3QgYmUgc2NoZWR1bGVkIGFueW1vcmUsIHNvIGluIHRoZW9yeSB3ZQ0KPiBzaG91bGQNCj4gPj4g
KyAgICAgICAgICogbm90IG5lZWQgdG8gZmx1c2ggdGhlIFRMQnMuIERvIGl0IGZvciBzYWZldHkg
cHVycG9zZS4NCj4gPj4gKyAgICAgICAgICogTm90ZSB0aGF0IGFsbCB0aGUgZGV2aWNlcyBoYXZl
IGFscmVhZHkgYmVlbiBkZS1hc3NpZ25lZC4gU28gd2UNCj4gZG9uJ3QNCj4gPj4gKyAgICAgICAg
ICogbmVlZCB0byBmbHVzaCB0aGUgSU9NTVUgVExCIGhlcmUuDQo+ID4+ICsgICAgICAgICAqLw0K
PiA+IHRvIGhlcmUgZG9lcyBub3QgbWFrZSBhIGxvdCBvZiBzZW5zZSBpbiB0aGlzIHBsYWNlIGFu
ZCBzaG91bGQgYmUgbW92ZWQgdG8NCj4gcDJtX2NsZWFyX3Jvb3RfcGFnZXMNCj4gPiB3aGVyZSBh
IHVzZXIgY2FuIHNlZSB0aGUgY2FsbCB0byBwMm1fZm9yY2VfdGxiX2ZsdXNoX3N5bmMuDQo+IA0K
PiArMQ0KDQpJIHdpbGwgbW92ZSB0aGlzIGNvZGUgY29tbWVudCBibG9jayB0byB0aGUgcGxhY2Ug
dGhhdCB5b3Ugc3VnZ2VzdGVkIGluIHYyLg0KDQo+IA0KPiA+IEFwYXJ0IGZyb20gdGhhdDoNCj4g
PiBSZXZpZXdlZC1ieTogTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4NCj4gDQo+
IEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KDQpUaGFua3MgdG8g
Ym90aCBvZiB5b3UuIEkgd2lsbCBrZWVwIHRoZXNlIHR3byB0YWdzIHdpdGggdGhlIGZpeCBhYm91
dCB0aGUgYWJvdmUNCmluLWNvZGUgY29tbWVudCBwb3NpdGlvbi4NCg0KS2luZCByZWdhcmRzLA0K
SGVucnkNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

