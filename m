Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB304C80C8
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 03:12:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280792.478850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOrz0-00084h-Kx; Tue, 01 Mar 2022 02:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280792.478850; Tue, 01 Mar 2022 02:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOrz0-000824-Fq; Tue, 01 Mar 2022 02:11:22 +0000
Received: by outflank-mailman (input) for mailman id 280792;
 Tue, 01 Mar 2022 02:11:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hqSu=TM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nOryz-00081w-9y
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 02:11:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e13ab0c3-9904-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 03:11:20 +0100 (CET)
Received: from AS8PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:20b:311::29)
 by AM0PR08MB4977.eurprd08.prod.outlook.com (2603:10a6:208:163::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 1 Mar
 2022 02:11:15 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::1d) by AS8PR05CA0024.outlook.office365.com
 (2603:10a6:20b:311::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26 via Frontend
 Transport; Tue, 1 Mar 2022 02:11:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Tue, 1 Mar 2022 02:11:14 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Tue, 01 Mar 2022 02:11:14 +0000
Received: from e10361762603.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CCC3FD07-384E-4587-84B1-5CA6A48FBC65.1; 
 Tue, 01 Mar 2022 02:11:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e10361762603.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 01 Mar 2022 02:11:03 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com (2603:10a6:102:e4::8)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 02:11:02 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::41e8:ebec:d794:38aa]) by PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::41e8:ebec:d794:38aa%3]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 02:11:02 +0000
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
X-Inumbo-ID: e13ab0c3-9904-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1M0ztFQTIMrYG4qXh093u/gOQoSpWuTTq08M3JdIO4=;
 b=bQtm0we41TxzxY0PZBWRvBGmaQ5jQl9uJQ8C4QShxtoF1HamP6WkmupuVzFTqszKlv3hEQY0ckw/2rHb8cT9FMbOwkBN+TdgVb46IJxtJPt/kOyCGlwbJUq6mQKExlwxPZhn/aKUw/wcovIC3GLMKjctQ8qAK29n5Xxi26jMhuI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVROYPzukAoSRBIqR/dsUYshNl/B7yIiq1fq0YbeTHut9zYfuYi8TaZVxFsTgBzndmLPXiRARKxswG4T3KOPmAbsCmMgNFYsZbZv4CuHtFgLj4tpfaEcA6NDRXQEUelmC3t/UlN7kIoZvNfMVx8SnKPfiDAWuguTIh4BpU8SJk8z1lxTjYpL4/i0YCPqgXKdyGWq9KQSEXk8RM8M4FrBJZ7mdHZtfWy5p0CBygy9hsv//HWdjcndDJSYw13Bk6gvhIP7uyCwmPGqzwaHv2xRT2P5+i3XGu0S9OVRcaNr9+2ZrfUGTA4DhyAeZGZ7uWtzgOzL2R5rSHn4clRluEOQoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1M0ztFQTIMrYG4qXh093u/gOQoSpWuTTq08M3JdIO4=;
 b=C8SzN9ZEfFVTtOdOg0oaVxrM2c8D4WW5BCC+ozirU4QOQkjK3Cb3K3HZYRdYCbSiaYFFXDtLUWQOP7Z1I/5x58H5+lrMDo/diUvEhWy12r5aSLNImJtaBMsMJ7PQeKEpVmCxkRDoNnLuQ9aNv99vWJs25C4OBEu6gY4w0+oXgVeNSieubYmtYSlURt1Tb1soLlYX9Km8Ih1/UVfqmHRLcq8f/NnBI6elteuLtOBwnip87RcIVZy7yZfcEyOiG4gMLl5WXaHOos2bNZBbM0YaGn0LVxv57E1irQ0dwg1Sz+Fi6yvtahstcHq7l98W6eVpjHvvkfTQJYLOFZ9JbeV8vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1M0ztFQTIMrYG4qXh093u/gOQoSpWuTTq08M3JdIO4=;
 b=bQtm0we41TxzxY0PZBWRvBGmaQ5jQl9uJQ8C4QShxtoF1HamP6WkmupuVzFTqszKlv3hEQY0ckw/2rHb8cT9FMbOwkBN+TdgVb46IJxtJPt/kOyCGlwbJUq6mQKExlwxPZhn/aKUw/wcovIC3GLMKjctQ8qAK29n5Xxi26jMhuI=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Penny Zheng <Penny.Zheng@arm.com>
Subject: RE: [RFC PATCH 0/2] Introduce reserved Xenheap
Thread-Topic: [RFC PATCH 0/2] Introduce reserved Xenheap
Thread-Index: AQHYKR4hoR5C+vQhgEqBFutamuKD06yktMKAgAPYnoCAAMi0gIAAcnyQ
Date: Tue, 1 Mar 2022 02:11:00 +0000
Message-ID:
 <PA4PR08MB6253D51D60CC4078083D0AAC92029@PA4PR08MB6253.eurprd08.prod.outlook.com>
References: <20220224013023.50920-1-Henry.Wang@arm.com>
 <6269ec3d-039e-d68f-771d-c5e088631410@xen.org>
 <PA4PR08MB625324910ED4D40383191F9D92019@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <48a0712c-eff8-dfc1-2136-59317f22321f@xen.org>
In-Reply-To: <48a0712c-eff8-dfc1-2136-59317f22321f@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 246FB3B4631C3149BD9E89E7691D8904.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a5b55eb6-df59-4d2f-e80e-08d9fb28c395
x-ms-traffictypediagnostic:
	AM6PR08MB3542:EE_|VE1EUR03FT045:EE_|AM0PR08MB4977:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB49778E06D3B38931F56D4CF892029@AM0PR08MB4977.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 djP+4P/jrjr2962OUuU6B/ey/pW3tZpZuUOd3nnKGXE7CsthXLQ7zT3YMy2mntrdY10q7ZhGUuQdK6kZGiSBMi9WdEYFkTFfbgogeRGhXexBV49dCjPK1nHY5QDvIWoUN2L0ak5VBgkcI/JywkDcvpE/zy8j/a2n8RxAx+ak/g7HzpjBIjUr9hWrdTSeyGT47PsJfSTGZxOAnYuOxsOYIhFTydPGyLTOf5MaxgwpOw2G0c8NvuOju5AR0t8KUBbwFRAefjIIYWw7oylXh1XSLRqGIU3CxCLLp2xceoil6Hs6OpKNynX3om+iJFgmvFzm58rgSHVZmO43z/rQnhmD7TgbIIqipYTBRriM+EUiJ+etLzrmUbQ4xM/ftGp7hK/fgKYpnxp/oZTJOvz1w/b8UYlBfWGcgaORdZSLPHXDct1v6SGyX1NYzO8Wj3Vpkgzx29UCIczZXnIBZCPR9fz8uJxCcHGo2a9p3HM+Zz4Yc9EyIKAct+JKWXLm0LakpPyAeSYeBTh2itKycSwUYjy+Csf0CZxjSYm3NAhdHr5jtqwrnW27EfxTfs6PsJzl0ZDpcK4V9JaAWecHMthIVZ366yDN5YvNloLKLj2wMgyedB9i7ccaq7f2eph0t2YPosz3itJTuy60I5k1tEMfyqrVv5lNj1dwD+TiJIS8Uu0TFUFssiwstg1BPHcK7u8s+WROPg3IaPCbl/bblMdPe8kGoA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6253.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(55016003)(71200400001)(33656002)(316002)(83380400001)(508600001)(38070700005)(86362001)(6506007)(7696005)(54906003)(110136005)(64756008)(66446008)(53546011)(76116006)(8676002)(66946007)(4326008)(66556008)(186003)(66476007)(26005)(9686003)(122000001)(38100700002)(2906002)(5660300002)(52536014)(8936002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1c20fdce-515c-43ef-9527-08d9fb28bc17
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pufZlOQGZKNpqsmbPWczj3LLcCQTs/zR0rAb7kjfQn83R4ejLzHcW8HOPADS5yBzOjG0thRCwNHRkKEdBD36ZszY1d2zIeHhL6+5LDXWHE5GzEGTF1X20ETxTTPMAFHBH+Ew9DSrwh/7Rp0ahL4V+GrxlKAb1BQip4lY8AkInaIJzZTnVCNS/cM3ZFVDcPd++wxSsUZQYlqFzcWzGcXMkWY/wGEMZfiOG9Pa6G1fzyXE/qAp1xzbJY9/4ueTbXLes/i/qaRUC1INccWt+2bWB2+i9hQ5CNVmoWIxo16Ng4Bx5tJ7nAj6LMyGPuYtGkU41zJjfBAJMt6gdlpmp7RpmV9GaGdjHv9/KzFykWzZFQgjKEjY7mqkx4AozuJhoAlxgbGXnegpqbRxL30YiY6fyjvogDCZWuk0yO7kkG7PEAQyVl6lkL93Lw0cueYLj+QPco/JP5lQ8kIS+h7gugeBJXFtRYUYrPiFPGaTb0d4fn9hTFidOHoWakV5+7SoREfLk8ZFMcPCJ0Sg9upscqB8ZKM4C96bJAczvE9iMyJQJTR176xbpcZpsSeFF81rpz2C3ReGj3Y+OZtpNpWtqbm5xIuWO2UZIeirpzXu0H4CBflXfcFFEGYAk7nJyzlc0jYXB+k4Dk6rnZY0CllJesihp8f4VCqs1tvZBszKxpUH8X0UpnVINA6FSFB7v2aI35ON
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(82310400004)(4326008)(8676002)(2906002)(70586007)(33656002)(5660300002)(53546011)(6506007)(70206006)(8936002)(7696005)(52536014)(9686003)(36860700001)(86362001)(40460700003)(336012)(316002)(81166007)(110136005)(356005)(55016003)(26005)(47076005)(186003)(54906003)(508600001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 02:11:14.6874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b55eb6-df59-4d2f-e80e-08d9fb28c395
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4977

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IE9uIDI4LzAyLzIwMjIgMDc6MTIsIEhlbnJ5IFdh
bmcgd3JvdGU6DQo+ID4gSGkgSnVsaWVuLA0KPiANCj4gSGkgSGVucnksDQo+IA0KPiA+PiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPg0KPiA+PiBIaSBIZW5yeSwNCj4gPj4NCj4gPj4gT24gMjQvMDIvMjAyMiAwMTozMCwg
SGVucnkgV2FuZyB3cm90ZToNCj4gPj4+IFRoZSByZXNlcnZlZCBYZW5oZWFwLCBvciBzdGF0aWNh
bGx5IGNvbmZpZ3VyZWQgWGVuaGVhcCwgcmVmZXJzIHRvIHBhcnRzDQo+ID4+PiBvZiBSQU0gcmVz
ZXJ2ZWQgaW4gdGhlIGJlZ2lubmluZyBmb3IgWGVuaGVhcC4gTGlrZSB0aGUgc3RhdGljIG1lbW9y
eQ0KPiA+Pj4gYWxsb2NhdGlvbiwgc3VjaCByZXNlcnZlZCBYZW5oZWFwIHJlZ2lvbnMgYXJlIHJl
c2VydmVkIGJ5IGNvbmZpZ3VyYXRpb24NCj4gPj4+IGluIHRoZSBkZXZpY2UgdHJlZSB1c2luZyBw
aHlzaWNhbCBhZGRyZXNzIHJhbmdlcy4NCj4gPj4NCj4gPj4gSW4gWGVuLCB3ZSBoYXZlIHRoZSBj
b25jZXB0IG9mIGRvbWhlYXAgYW5kIHhlbmhlYXAuIEZvciBBcm02NCBhbmQNCj4geDg2DQo+ID4+
IHRoZXkgd291bGQgYmUgdGhlIHNhbWUuIEJ1dCBmb3IgQXJtMzIsIHRoZXkgd291bGQgYmUgZGlm
ZmVyZW50OiB4ZW5oZWFwDQo+ID4+IGlzIGFsd2F5cyBtYXBwZWQgd2hlcmVhcyBkb21oZWFwIGlz
IHNlcGFyYXRlLg0KPiA+Pg0KPiA+PiBTa2ltbWluZyB0aHJvdWdoIHRoZSBzZXJpZXMsIEkgdGhp
bmsgeW91IHdhbnQgdG8gdXNlIHRoZSByZWdpb24gZm9yIGJvdGgNCj4gPj4gZG9taGVhcCBhbmQg
eGVuaGVhcC4gSXMgdGhhdCBjb3JyZWN0Pw0KPiA+DQo+ID4gWWVzIEkgdGhpbmsgdGhhdCB3b3Vs
ZCBiZSBjb3JyZWN0LCBmb3IgQXJtMzIsIGluc3RlYWQgb2YgdXNpbmcgdGhlIGZ1bGwNCj4gPiBg
cmFtX3BhZ2VzYCBhcyB0aGUgaW5pdGlhbCB2YWx1ZSBvZiBgaGVhcF9wYWdlc2AsIHdlIHdhbnQg
dG8gdXNlIHRoZQ0KPiA+IHJlZ2lvbiBzcGVjaWZpZWQgaW4gdGhlIGRldmljZSB0cmVlLiBCdXQg
d2UgYXJlIGNvbmZ1c2VkIGlmIHRoaXMgaXMgdGhlDQo+ID4gY29ycmVjdCAob3IgcHJlZmVycmVk
KSB3YXkgZm9yIEFybTMyLCBzbyBpbiB0aGlzIHNlcmllcyB3ZSBvbmx5DQo+ID4gaW1wbGVtZW50
ZWQgdGhlIHJlc2VydmVkIGhlYXAgZm9yIEFybTY0Lg0KPiANCj4gVGhhdCdzIGFuIGludGVyZXN0
aW5nIHBvaW50LiBXaGVuIEkgc2tpbW1lZCB0aHJvdWdoIHRoZSBzZXJpZXMgb24NCj4gRnJpZGF5
LCBteSBmaXJzdCB0aG91Z2h0IHdhcyB0aGF0IGZvciBhcm0zMiBpdCB3b3VsZCBiZSBvbmx5IHhl
bmhlYXAgKHNvDQo+IGFsbCB0aGUgcmVzdCBvZiBtZW1vcnkgaXMgZG9taGVhcCkuDQo+IA0KPiBI
b3dldmVyLCBYZW4gY2FuIGFsbG9jYXRlIG1lbW9yeSBmcm9tIGRvbWhlYXAgZm9yIGl0cyBvd24g
cHVycG9zZSAoZS5nLg0KPiB3ZSBkb24ndCBuZWVkIGNvbnRpZ3VvdXMgbWVtb3J5LCBvciBmb3Ig
cGFnZS10YWJsZXMpLg0KPiANCj4gSW4gYSBmdWxseSBzdGF0aWMgZW52aXJvbm1lbnQsIHRoZSBk
b21oZWFwIGFuZCB4ZW5oZWFwIGFyZSBib3RoIGdvaW5nIHRvDQo+IGJlIHF1aXRlIHNtYWxsLiBJ
dCB3b3VsZCBhbHNvIGJlIHNvbWV3aGF0IGRpZmZpY3VsdCBmb3IgYSB1c2VyIHRvIHNpemUNCj4g
aXQuIFNvIEkgdGhpbmssIGl0IHdvdWxkIGJlIGVhc2llciB0byB1c2UgdGhlIHJlZ2lvbiB5b3Ug
aW50cm9kdWNlIGZvcg0KPiBib3RoIGRvbWhlYXAgYW5kIHhlbmhlYXAuDQo+IA0KPiBTdGVmYW5v
LCBCZXJ0cmFuZCwgYW55IG9waW9uaW9ucz8NCj4gDQo+IE9uIGEgc2VwYXJhdGUgdG9waWMsIEkg
dGhpbmsgd2UgbmVlZCBzb21lIGRvY3VtZW50YXRpb24gZXhwbGFpbmluZyBob3cgYQ0KPiB1c2Vy
IGNhbiBzaXplIHRoZSB4ZW5oZWFwLiBIb3cgZGlkIHlvdSBmaWd1cmUgb3V0IGZvciB5b3VyIHNl
dHVwPw0KDQpOb3Qgc3VyZSBpZiBJIGZ1bGx5IHVuZGVyc3RhbmQgdGhlIHF1ZXN0aW9uLiBJIHdp
bGwgZXhwbGFpbiBpbiB0d28gcGFydHM6IEkgdGVzdGVkDQp0aGlzIHNlcmllcyBvbiBhIGRvbTBs
ZXNzIChzdGF0aWMgbWVtKSBzeXN0ZW0gb24gRlZQX0Jhc2UuDQooMSkgRm9yIGNvbmZpZ3VyaW5n
IHRoZSBzeXN0ZW0sIEkgZm9sbG93ZWQgdGhlIGRvY3VtZW50YXRpb24gSSBhZGRlZCBpbiB0aGUN
CmZpcnN0IHBhdGNoIGluIHRoaXMgc2VyaWVzIChkb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jv
b3RpbmcudHh0KS4gVGhlIGlkZWEgaXMNCmFkZGluZyBzb21lIHN0YXRpYyBtZW0gcmVnaW9ucyB1
bmRlciB0aGUgY2hvc2VuIG5vZGUuDQoNCiAgICAgY2hvc2VuIHsNCisgICAgICAgICN4ZW4sc3Rh
dGljLW1lbS1hZGRyZXNzLWNlbGxzID0gPDB4Mj47DQorICAgICAgICAjeGVuLHN0YXRpYy1tZW0t
c2l6ZS1jZWxscyA9IDwweDI+Ow0KKyAgICAgICAgeGVuLHN0YXRpYy1tZW0gPSA8MHg4IDB4ODAw
MDAwMDAgMHgwIDB4MDAxMDAwMDAgMHg4IDB4OTAwMDAwMDAgMHgwIDB4MDgwMDAwMDA+Ow0KICAg
ICBbLi4uXQ0KICAgICB9DQoNCigyKSBGb3IgdmVyaWZ5aW5nIHRoaXMgc2VyaWVzLCB3aGF0IEkg
ZGlkIHdhcyBiYXNpY2FsbHkgcGxheWluZyB3aXRoIHRoZSByZWdpb24gc2l6ZQ0KYW5kIG51bWJl
ciBvZiB0aGUgcmVnaW9ucywgYWRkaW5nIHByaW50a3MgYW5kIGFsc28gc2VlIGlmIHRoZSBndWVz
dHMgY2FuIGJvb3QNCmFzIGV4cGVjdGVkIHdoZW4gSSBjaGFuZ2UgdGhlIHhlbmhlYXAgc2l6ZS4N
Cg0KPiANCj4gPj4NCj4gPj4gRnVydGhlbW9yZSwgbm93IHRoYXQgd2UgYXJlIGludHJvZHVjaW5n
IG1vcmUgc3RhdGljIHJlZ2lvbiwgaXQgd2lsbCBnZXQNCj4gPj4gZWFzaWVyIHRvIG92ZXJsYXAg
dGhlIHJlZ2lvbnMgYnkgbWlzdGFrZXMuIEkgdGhpbmsgd2Ugd2FudCB0byBoYXZlIHNvbWUNCj4g
Pj4gbG9naWMgaW4gWGVuIChvciBvdXRzaWRlKSB0byBlbnN1cmUgdGhhdCBub25lIG9mIHRoZW0g
b3ZlcmxhcHMuIERvIHlvdQ0KPiA+PiBoYXZlIGFueSBwbGFuIGZvciB0aGF0Pw0KPiA+DQo+ID4g
VG90YWxseSBhZ3JlZSB3aXRoIHRoaXMgaWRlYSwgYnV0IGJlZm9yZSB3ZSBhY3R1YWxseSBpbXBs
ZW1lbnQgdGhlIGNvZGUsDQo+ID4gd2Ugd291bGQgbGlrZSB0byBmaXJzdGx5IHNoYXJlIG91ciB0
aG91Z2h0cyBvbiB0aGlzOiBPbmUgb3B0aW9uIGNvdWxkIGJlIHRvDQo+ID4gYWRkIGRhdGEgc3Ry
dWN0dXJlcyB0byBub3RlcyBkb3duIHRoZXNlIHN0YXRpYyBtZW1vcnkgcmVnaW9ucyB3aGVuIHRo
ZQ0KPiA+IGRldmljZSB0cmVlIGlzIHBhcnNlZCwgYW5kIHRoZW4gd2UgY2FuIGNoZWNrIGlmIHRo
ZXkgYXJlIG92ZXJsYXBwZWQuDQo+IA0KPiBUaGlzIHNob3VsZCB3b3JrLg0KDQpBY2suDQoNCj4g
DQo+ID4gT3Zlcg0KPiA+IHRoZSBsb25nIHRlcm0gKGFuZCB0aGlzIGxvbmcgdGVybSBvcHRpb24g
aXMgY3VycmVudGx5IG5vdCBpbiBvdXIgcGxhbiksDQo+ID4gbWF5YmUgd2UgY2FuIGFkZCBzb21l
dGhpbmcgaW4gdGhlIFhlbiB0b29sc3RhY2sgZm9yIHRoaXMgdXNhZ2U/DQo+IA0KPiBXaGVuIEkg
cmVhZCAiWGVuIHRvb2xzdGFjayIsIEkgcmVhZCB0aGUgdG9vbHMgdGhhdCB3aWxsIHJ1biBpbiBk
b20wLiBJcw0KPiBpdCB3aGF0IHlvdSBtZWFudD8NCg0KTm9ub25vLCBzb3JyeSBmb3IgdGhlIG1p
c2xlYWRpbmcuIEkgbWVhbiBhIGJ1aWxkIHRpbWUgdG9vbCB0aGF0IGNhbiBydW4NCm9uIGhvc3Qg
KGJ1aWxkIG1hY2hpbmUpIHRvIGdlbmVyYXRlL2NvbmZpZ3VyZSB0aGUgWGVuIERUUyBmb3Igc3Rh
dGljDQphbGxvY2F0ZWQgbWVtb3J5LiBCdXQgbWF5YmUgdGhpcyB0b29sIGNhbiBiZSBwbGFjZWQg
aW4gWGVuIHRvb2wgb3IgaXQgY2FuDQpiZSBhIHNlcGFyYXRlIHRvb2wgdGhhdCBvdXQgb2YgWGVu
J3Mgc2NvcGUuDQoNCkFueXdheSwgdGhpcyBpcyBqdXN0IGFuIGlkZWEgYXMgd2UgZmluZCBpdCBp
cyBub3QgZWFzeSBmb3IgdXNlcnMgdG8gY29uZmlndXJlDQpzbyBtYW55IHN0YXRpYyBpdGVtcyBt
YW51YWxseS4NCg0KPiANCj4gPg0KPiA+IEFsc28sIEkgYW0gd29uZGVyaW5nIGlmIHRoZSBvdmVy
bGFwcGluZyBjaGVjayBsb2dpYyBzaG91bGQgYmUgaW50cm9kdWNlZA0KPiA+IGluIHRoaXMgc2Vy
aWVzLiBXRFlUPw0KPiANCj4gSSB3b3VsZCBkbyB0aGF0IGluIGEgc2VwYXJhdGUgc2VyaWVzLg0K
DQpBY2suDQoNCktpbmQgcmVnYXJkcywNCg0KSGVucnkNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4g
LS0NCj4gSnVsaWVuIEdyYWxsDQo=

