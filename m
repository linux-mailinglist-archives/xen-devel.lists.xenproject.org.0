Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B8768CDD8
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 05:00:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490834.759700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPF9L-0006py-Ex; Tue, 07 Feb 2023 04:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490834.759700; Tue, 07 Feb 2023 04:00:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPF9L-0006n3-AH; Tue, 07 Feb 2023 04:00:07 +0000
Received: by outflank-mailman (input) for mailman id 490834;
 Tue, 07 Feb 2023 04:00:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8+Lq=6D=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pPF9J-0006dp-IF
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 04:00:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7d00::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3d8418a-a69b-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 05:00:00 +0100 (CET)
Received: from AM5PR0301CA0036.eurprd03.prod.outlook.com
 (2603:10a6:206:14::49) by VE1PR08MB5568.eurprd08.prod.outlook.com
 (2603:10a6:800:1a8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Tue, 7 Feb
 2023 03:59:50 +0000
Received: from AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::16) by AM5PR0301CA0036.outlook.office365.com
 (2603:10a6:206:14::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35 via Frontend
 Transport; Tue, 7 Feb 2023 03:59:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT046.mail.protection.outlook.com (100.127.140.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.16 via Frontend Transport; Tue, 7 Feb 2023 03:59:49 +0000
Received: ("Tessian outbound 0d7b2ab0f13d:v132");
 Tue, 07 Feb 2023 03:59:49 +0000
Received: from 9943d359d7af.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7CBB64AE-74FE-4F7E-A432-07FAB8CCB7A2.1; 
 Tue, 07 Feb 2023 03:59:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9943d359d7af.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Feb 2023 03:59:39 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by DBBPR08MB6235.eurprd08.prod.outlook.com (2603:10a6:10:201::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Tue, 7 Feb
 2023 03:59:35 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab%3]) with mapi id 15.20.6064.025; Tue, 7 Feb 2023
 03:59:35 +0000
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
X-Inumbo-ID: e3d8418a-a69b-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vzc5y7p+/o0K9CTVJPDl+kbHvQnHxemFHQRdWA+ht1U=;
 b=qjGjk1wb4sQvsxJerN6ozREzxvMBUPBccsX1PUb9Co1GZlGybORHRPLmolKgc9bWD06/VsIplQ1Msu+uxquty9U/V+/7LVJOKALVrByLpcOR0/6cPP72C/YfiFAKBKB+weieQS8CkdxhkZd9lDfqbuAT+s38KCWINFaIvJBC7qQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3Ao80oD+nwDJBgL/uxtRfnIwVUTrC7MqeDxNcgq3kqp6nHorJapG8SIcp62v8m/PabRuKJ69UMbpsvimN9h4Mn0zR90xrDTrvW5fOFV8msyzWuMt7Z6tZhb7ZBR+g2iy1geoFYAlKg0pHrnGf064Ule19ChvBqo98tPyTl5fB9IusbTt1hBmg4CjTO8Kdgrp3Icg4s3OoFAodT10+7MgEn2ebqTVPOwDXPyp8ge+vSL3Jy8/EDPIQ8LBYPkcjLOXkySuQ7fCGkEvveNpUlqMvaCSaOfNuP65BrOH+IzSMNgPYu0c2zredc7krL9rVzdLci2Ztf2C3vRMKpKK164Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vzc5y7p+/o0K9CTVJPDl+kbHvQnHxemFHQRdWA+ht1U=;
 b=njyvZrD8KE7QXs9NuEZc2XPZx6NgOXS12XduI9rv+iKf8AMdCLZfhVIAYurDVR9btGAq2x6IYjktymPzjjqcuMtNPLpn2sIn5UyOVOzKD/q/9iZnF9PqPDpTOsCe1qQ4iMCwMedVkHrYuh8qfLjUgtGCQYE4C/5A653QbT1F3GcyvmNzRpl6vHVii17s+PNe/oeny2EU9tjfc4B0/iXLZwFFowIEAluQgg0SRyDlYINyYcWs4uJjyK543pIBEWsKi4Iryv9xecKnTDjjT+M1Dw7DEraJR0c2UNA2mTYxF9L8adJvt59kXAsIkmEox6mPjmEBlDYtgGHcxLVSqMZ2IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vzc5y7p+/o0K9CTVJPDl+kbHvQnHxemFHQRdWA+ht1U=;
 b=qjGjk1wb4sQvsxJerN6ozREzxvMBUPBccsX1PUb9Co1GZlGybORHRPLmolKgc9bWD06/VsIplQ1Msu+uxquty9U/V+/7LVJOKALVrByLpcOR0/6cPP72C/YfiFAKBKB+weieQS8CkdxhkZd9lDfqbuAT+s38KCWINFaIvJBC7qQ=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 15/40] xen/arm: move MMU-specific memory management
 code to mm_mmu.c/mm_mmu.h
Thread-Topic: [PATCH v2 15/40] xen/arm: move MMU-specific memory management
 code to mm_mmu.c/mm_mmu.h
Thread-Index: AQHZJxApcmRevH68lE+WQ8biO49P9K7BA/mAgAH2IVA=
Date: Tue, 7 Feb 2023 03:59:34 +0000
Message-ID:
 <AM0PR08MB4530246ADCB77E67CB5AB1B3F7DB9@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-16-Penny.Zheng@arm.com>
 <6aebebad-2b01-4bd6-8a2f-7be3591382d8@xen.org>
In-Reply-To: <6aebebad-2b01-4bd6-8a2f-7be3591382d8@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A54E8E911FDAAC4EA5E0FC13BDB08445.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|DBBPR08MB6235:EE_|AM7EUR03FT046:EE_|VE1PR08MB5568:EE_
X-MS-Office365-Filtering-Correlation-Id: 1401b7e0-b84a-486d-4df9-08db08bfc276
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lMW+hd28QzeYmMWEXLANKaDmjsINXO28SrVplQ80thaBL2JupEjI45puTveIjZHK4A2TJokjStwYBfn66PgRpLtkQtKk2HGU7HCptDSRzKp4IPCuFco+1aRXM7s8T+bMQu9NEe6VD3zR6FZhk0jHWotiLdg+2RSjs4/EkIdEwQL2uH1oaOG4vFDUEvpbAIGeqwyaz8mzGWjBDnKId6f0lAgloHXZCYwK6bPyqgYuV3Dmpht3xSGQXKvxRMiT6tV19TWqJcuMSxDXSnNyJc7zXY6aDlT+oUi/O0Ktk7NEERCjuSwXwthPtkPT4costAPuPEqb9ICFE1sKp88BTTxg9ttFQ85W93HFHXOMW7jgWrB7xZk2FIb2Wv0znRjtHQnhKAYtEtGHLUlDO+d1HtYnOF6fkMw6OiHs372PC3UF4hQMSt4vqxI8In7G8C2j1D9X0gA3CrGd/wp6jUFqz04yviH3sFkN0KzVlenumKQRN7+tj1VcJacI7kSekZ0M5qKsSSyVNBDtJ9heBjZ6XXLwRDzDybPSTGmGt8/MqKX8DojJTyfyAz+P8SEdJ8IZt7eXmfcHU8VkLpBVQp9Q1rC53cXR2riy/BNerbBAO7KW/MWu2z40Gwba17NARdBNrIwaY7MLht8AstCAVr8F8PkAJI+B4WwmE9nw9HBK7IQGYQ3jp2mamclWs4LHrw9Dd68ALsNe35IRE3CfmgMtHnhG4/Og1/LpyU9Yw1M28LL8WzBbjiuPIW6DLyVAydE9sqd17IPR1W8ilUZwMklLhnBTBA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199018)(76116006)(316002)(110136005)(83380400001)(54906003)(52536014)(66476007)(5660300002)(8936002)(66946007)(8676002)(64756008)(66446008)(66556008)(41300700001)(4326008)(478600001)(6506007)(9686003)(53546011)(26005)(186003)(7696005)(966005)(71200400001)(38070700005)(55016003)(33656002)(2906002)(38100700002)(122000001)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6235
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	57417aaa-c42c-4bc3-c4f5-08db08bfb92a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bZsCUKNr1Wnp6FWGiSihHJGhXOHodT2AzMz98zLsXhr0paQM8SWeDTx7Mj833Q2jjCYZFbJ0xN18nL6sDhjP8n0T5XjLyyw77sL8AlQWcdfoVn5i0jhpDCr5FLho8n71lR9sAzcxL0A8Zn9YW+xwl4F0x9FNX26ilQOwc77PNk6nTZ6xAp9EVIgYyp9wpnfsjV174mzojjf0Ev/MpGjRMYb2W583SlztTI90uM3CXcnaejwOBdas8wApkXxQ9q3ZRNfVLAM7DB+5ss2XJv96H1uepVTTPS4Vk/5Tx41BjjBK7E4pGpcDaSthXKk0SCZlngRxXno6nmZsrGfuWr81OaJYSNkn2df5aFAAl/W/sKkFGPnZ8F978a4lixitIp7zk5K7eFevaQ3WFYYy/Ilc/lbBDBEWqrLUrO/s/DhmJxHgfegcwevAr0pehru+fnvp+1h9U0a3A3+lPAlYfKzcq6Y4Shu++Orbg3HXf2WIlAdEXHcpWme3bZl8xyRi/6pnXa7v/qtcFn2MWv184F7Boc59kgHK2rAnJ/d2DsfVMeZonS+5Mk0kib8dJF9o7hWqWj+ybqHiMbb/pQCtGaPkROQDge/Chfg8MGxlHxpFt2qzG2djJRMycu/uklfunYObmhmPMrjCemnhkLL65xdqRRColrocmWFdr9U/TmEwdfjPqPicaX2wGb4df4mE0MazJlO0q5nhb8VZe3dDifFWQ8/B+M3Qi+T4JR/Td8fJiOqP+TKUWrWmaWmkdlVK76+aHCB8QFt3jwzHM0Q5n3IqcQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199018)(40470700004)(36840700001)(46966006)(70206006)(110136005)(4326008)(8676002)(316002)(8936002)(70586007)(6506007)(41300700001)(5660300002)(52536014)(356005)(81166007)(33656002)(36860700001)(86362001)(82740400003)(54906003)(53546011)(186003)(7696005)(26005)(107886003)(9686003)(2906002)(336012)(47076005)(82310400005)(55016003)(40480700001)(40460700003)(966005)(478600001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 03:59:49.6584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1401b7e0-b84a-486d-4df9-08db08bfc276
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5568

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVuIEdyYWxs
IDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSA2LCAyMDIzIDU6MzAg
QU0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IFN0
ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRyYW5kIE1h
cnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47DQo+IFZvbG9keW15ciBCYWJjaHVrIDxW
b2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxNS80
MF0geGVuL2FybTogbW92ZSBNTVUtc3BlY2lmaWMgbWVtb3J5DQo+IG1hbmFnZW1lbnQgY29kZSB0
byBtbV9tbXUuYy9tbV9tbXUuaA0KPiANCj4gSGksDQo+IA0KPiBPbiAxMy8wMS8yMDIzIDA1OjI4
LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBGcm9tOiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNv
bT4NCj4gPg0KPiA+IFRvIG1ha2UgdGhlIGNvZGUgcmVhZGFibGUgYW5kIG1haW50YWluYWJsZSwg
d2UgbW92ZSBNTVUtc3BlY2lmaWMNCj4gPiBtZW1vcnkgbWFuYWdlbWVudCBjb2RlIGZyb20gbW0u
YyB0byBtbV9tbXUuYyBhbmQgbW92ZSBNTVUtDQo+IHNwZWNpZmljDQo+ID4gZGVmaW5pdGlvbnMg
ZnJvbSBtbS5oIHRvIG1tX21tdS5oLg0KPiA+IExhdGVyIHdlIHdpbGwgY3JlYXRlIG1tX21wdS5o
IGFuZCBtbV9tcHUuYyBmb3IgTVBVLXNwZWNpZmljIG1lbW9yeQ0KPiA+IG1hbmFnZW1lbnQgY29k
ZS4NCj4gDQo+IFRoaXMgc2VudGVuY2UgaW1wbGllcyB0aGVyZSBpcyBubyBtbV9tcHUue2MsIGh9
IHlldCBhbmQgdGhpcyBpcyBub3QgdG91Y2hlZA0KPiB3aXRoaW4gdGhpcyBwYXRjaC4gSG93ZXZl
ci4uLg0KPiANCj4gDQo+ID4gVGhpcyB3aWxsIGF2b2lkIGxvdHMgb2YgI2lmZGVmIGluIG1lbW9y
eSBtYW5hZ2VtZW50IGNvZGUgYW5kIGhlYWRlciBmaWxlcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBlbm55
IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPiA+IC0tLQ0KPiA+ICAgeGVuL2FyY2gvYXJt
L01ha2VmaWxlICAgICAgICAgICAgIHwgICAgNSArDQo+ID4gICB4ZW4vYXJjaC9hcm0vaW5jbHVk
ZS9hc20vbW0uaCAgICAgfCAgIDE5ICstDQo+ID4gICB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20v
bW1fbW11LmggfCAgIDM1ICsNCj4gPiAgIHhlbi9hcmNoL2FybS9tbS5jICAgICAgICAgICAgICAg
ICB8IDEzNTIgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICAgeGVuL2FyY2gvYXJt
L21tX21tdS5jICAgICAgICAgICAgIHwgMTM3Ng0KPiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KPiA+ICAgeGVuL2FyY2gvYXJtL21tX21wdS5jICAgICAgICAgICAgIHwgICA2NyArKw0K
PiANCj4gLi4uIEl0IGxvb2tzIGxpa2UgdGhleSBhbHJlYWR5IGV4aXN0cyBhbmQgeW91IGFyZSBt
b2RpZnlpbmcgdGhlbS4gVGhhdA0KPiBzYWlkLCBpdCB3b3VsZCBiZSBiZXR0ZXIgaWYgdGhpcyBw
YXRjaCBvbmx5IGNvbnRhaW5zIGNvZGUgbW92ZW1lbnQgKElPVw0KPiBubyBNUFUgY2hhbmdlcyku
DQo+IA0KPiA+ICAgNiBmaWxlcyBjaGFuZ2VkLCAxNDg4IGluc2VydGlvbnMoKyksIDEzNjYgZGVs
ZXRpb25zKC0pDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL21tX21tdS5oDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL21tX21t
dS5jDQo+IA0KPiBJIGRvbid0IHBhcnRpY3VsYXIgbGlrZSB0aGUgbmFtaW5nLiBJIHRoaW5rIGl0
IHdvdWxkIG1ha2UgbW9yZSBzZW5zZSB0bw0KPiBpbnRyb2R1Y2UgdHdvIGRpcmVjdG9yaWVzOiAi
bW11IiBhbmQgIm1wdSIgd2hpY2ggaW5jbHVkZXMgY29kZSBzcGVjaWZpYw0KPiB0byBlYWNoIGZs
YXZvciBvZiBYZW4uDQo+IA0KWy4uLl0NCj4gPg0KPiA+IC0NCj4gPiAtLyogUmVsZWFzZSBhbGwg
X19pbml0IGFuZCBfX2luaXRkYXRhIHJhbmdlcyB0byBiZSByZXVzZWQgKi8NCj4gPiAtdm9pZCBm
cmVlX2luaXRfbWVtb3J5KHZvaWQpDQo+IA0KPiBUaGlzIGZ1bmN0aW9uIGRvZXNuJ3QgbG9vayBz
cGVjaWZpYyB0byB0aGUgTU1VLg0KPiANCg0KRnVuY3Rpb25zIGxpa2UsIGVhcmx5X2ZkdF9tYXBb
MV0gLyBzZXR1cF9mcmFtZXRhYmxlX21hcHBpbmdzWzJdIC8gZnJlZV9pbml0X21lbW9yeSBbM10g
Li4uDQp0aGV5IGJvdGggc2hhcmUgcXVpdGUgdGhlIHNhbWUgbG9naWMgYXMgTU1VIGRvZXMgaW4g
TVBVIHN5c3RlbSwgdGhlIGRpZmZlcmVuY2UgY291bGQgb25seQ0KYmUgYWRkcmVzcyB0cmFuc2xh
dGlvbiByZWdpbWUuIFN0aWxsLCBpbiBvcmRlciB0byBhdm9pZCBwdXR0aW5nIHRvbyBtdWNoICNp
ZmRlZiBoZXJlIGFuZCB0aGVyZSwNCkkgaW1wbGVtZW50IGRpZmZlcmVudCBNTVUgYW5kIE1QVSB2
ZXJzaW9uIG9mIHRoZW0uDQogDQpPciBJIGtlZXAgdGhlbSBpbiBnZW5lcmljIGZpbGUgaGVyZSwg
dGhlbiBpbiBmdXR1cmUgY29tbWl0cyB3aGVuIHdlIGltcGxlbWVudCBNUFUgdmVyc2lvbg0Kb2Yg
dGhlbShJIGxpc3QgcmVsYXRlZCBjb21taXRzIGJlbG93KSwgSSB0cmFuc2ZlciB0aGVtIHRvIE1N
VSBmaWxlIHRoZXJlLg0KDQpXZHl0Pw0KDQpbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDIzLTAxL21zZzAwNzc0Lmh0bWwgDQpbMl0gaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDIzLTAx
L21zZzAwNzg3Lmh0bWwgCQ0KWzNdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2
ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMy0wMS9tc2cwMDc4Ni5odG1sIA0KDQo+ID4gLXsNCj4gPiAt
ICAgIHBhZGRyX3QgcGEgPSB2aXJ0X3RvX21hZGRyKF9faW5pdF9iZWdpbik7DQo+ID4gLSAgICB1
bnNpZ25lZCBsb25nIGxlbiA9IF9faW5pdF9lbmQgLSBfX2luaXRfYmVnaW47DQo+ID4gLSAgICB1
aW50MzJfdCBpbnNuOw0KPiA+IC0gICAgdW5zaWduZWQgaW50IGksIG5yID0gbGVuIC8gc2l6ZW9m
KGluc24pOw0KPiA+IC0gICAgdWludDMyX3QgKnA7DQo+ID4gLSAgICBpbnQgcmM7DQo+ID4gLQ0K
PiA+IC0gICAgcmMgPSBtb2RpZnlfeGVuX21hcHBpbmdzKCh1bnNpZ25lZCBsb25nKV9faW5pdF9i
ZWdpbiwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodW5zaWduZWQgbG9uZylf
X2luaXRfZW5kLCBQQUdFX0hZUEVSVklTT1JfUlcpOw0KPiA+IC0gICAgaWYgKCByYyApDQo+ID4g
LSAgICAgICAgcGFuaWMoIlVuYWJsZSB0byBtYXAgUlcgdGhlIGluaXQgc2VjdGlvbiAocmMgPSAl
ZClcbiIsIHJjKTsNCj4gPiAtDQo+ID4gLSAgICAvKg0KPiA+IC0gICAgICogRnJvbSBub3cgb24s
IGluaXQgd2lsbCBub3QgYmUgdXNlZCBmb3IgZXhlY3V0aW9uIGFueW1vcmUsDQo+ID4gLSAgICAg
KiBzbyBudWtlIHRoZSBpbnN0cnVjdGlvbiBjYWNoZSB0byByZW1vdmUgZW50cmllcyByZWxhdGVk
IHRvIGluaXQuDQo+ID4gLSAgICAgKi8NCj4gPiAtICAgIGludmFsaWRhdGVfaWNhY2hlX2xvY2Fs
KCk7DQo+ID4gLQ0KPiA+IC0jaWZkZWYgQ09ORklHX0FSTV8zMg0KPiA+IC0gICAgLyogdWRmIGlu
c3RydWN0aW9uIGkuZSAoc2VlIEE4LjguMjQ3IGluIEFSTSBEREkgMDQwNkMuYykgKi8NCj4gPiAt
ICAgIGluc24gPSAweGU3ZjAwMGYwOw0KPiA+IC0jZWxzZQ0KPiA+IC0gICAgaW5zbiA9IEFBUkNI
NjRfQlJFQUtfRkFVTFQ7DQo+ID4gLSNlbmRpZg0KPiA+IC0gICAgcCA9ICh1aW50MzJfdCAqKV9f
aW5pdF9iZWdpbjsNCj4gPiAtICAgIGZvciAoIGkgPSAwOyBpIDwgbnI7IGkrKyApDQo+ID4gLSAg
ICAgICAgKihwICsgaSkgPSBpbnNuOw0KPiA+IC0NCj4gPiAtICAgIHJjID0gZGVzdHJveV94ZW5f
bWFwcGluZ3MoKHVuc2lnbmVkIGxvbmcpX19pbml0X2JlZ2luLA0KPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAodW5zaWduZWQgbG9uZylfX2luaXRfZW5kKTsNCj4gPiAtICAgIGlm
ICggcmMgKQ0KPiA+IC0gICAgICAgIHBhbmljKCJVbmFibGUgdG8gcmVtb3ZlIHRoZSBpbml0IHNl
Y3Rpb24gKHJjID0gJWQpXG4iLCByYyk7DQo+ID4gLQ0KPiA+IC0gICAgaW5pdF9kb21oZWFwX3Bh
Z2VzKHBhLCBwYSArIGxlbik7DQo+ID4gLSAgICBwcmludGsoIkZyZWVkICVsZGtCIGluaXQgbWVt
b3J5LlxuIiwgKGxvbmcpKF9faW5pdF9lbmQtDQo+IF9faW5pdF9iZWdpbik+PjEwKTsNCj4gPiAt
fQ0KPiA+IC0NCj4gDQo+IA0KPiBbLi4uXQ0KPiANCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL21tX21wdS5jIGIveGVuL2FyY2gvYXJtL21tX21wdS5jDQo+ID4gaW5kZXggNDNlOWExYmU0
ZC4uODdhMTIwNDJjYyAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vbW1fbXB1LmMNCj4g
PiArKysgYi94ZW4vYXJjaC9hcm0vbW1fbXB1LmMNCj4gPiBAQCAtMjAsOCArMjAsMTAgQEANCj4g
PiAgICAqLw0KPiA+DQo+ID4gICAjaW5jbHVkZSA8eGVuL2luaXQuaD4NCj4gPiArI2luY2x1ZGUg
PHhlbi9tbS5oPg0KPiA+ICAgI2luY2x1ZGUgPHhlbi9wYWdlLXNpemUuaD4NCj4gPiAgICNpbmNs
dWRlIDxhc20vYXJtNjQvbXB1Lmg+DQo+ID4gKyNpbmNsdWRlIDxhc20vcGFnZS5oPg0KPiANCj4g
UmVnYXJkbGVzcyBvZiB3aGF0IEkgd3JvdGUgYWJvdmUsIG5vbmUgb2YgdGhlIGNvZGUgeW91IGFk
ZCBzZWVtcyB0bw0KPiByZXF1aXJlIDxhc20vcGFnZS5oPg0KPiANCj4gPg0KPiA+ICAgLyogWGVu
IE1QVSBtZW1vcnkgcmVnaW9uIG1hcHBpbmcgdGFibGUuICovDQo+ID4gICBwcl90IF9fYWxpZ25l
ZChQQUdFX1NJWkUpIF9fc2VjdGlvbigiLmRhdGEucGFnZV9hbGlnbmVkIikNCj4gPiBAQCAtMzgs
NiArNDAsNzEgQEAgdWludDY0X3QgX19yb19hZnRlcl9pbml0IG5leHRfdHJhbnNpZW50X3JlZ2lv
bl9pZHg7DQo+ID4gICAvKiBNYXhpbXVtIG51bWJlciBvZiBzdXBwb3J0ZWQgTVBVIG1lbW9yeSBy
ZWdpb25zIGJ5IHRoZSBFTDIgTVBVLg0KPiAqLw0KPiA+ICAgdWludDY0X3QgX19yb19hZnRlcl9p
bml0IG1heF94ZW5fbXB1bWFwOw0KPiA+DQo+ID4gKy8qIFRPRE86IEltcGxlbWVudGF0aW9uIG9u
IHRoZSBmaXJzdCB1c2FnZSAqLw0KPiANCj4gSXQgaXMgbm90IGNsZWFyIHdoYXQgeW91IG1lYW4g
Z2l2ZW4gdGhlcmUgYXJlIHNvbWUgY2FsbGVycy4NCj4gDQo+ID4gK3ZvaWQgZHVtcF9oeXBfd2Fs
ayh2YWRkcl90IGFkZHIpDQo+ID4gK3sNCj4gDQo+IFBsZWFzZSBhZGQgQVNTRVJUX1VOUkVBQ0hB
QkxFKCkgZm9yIGFueSBkdW1teSBoZWxwZXIgeW91IGhhdmUNCj4gaW50cm9kdWNlZA0KPiBhbnkg
cGxhbiB0byBpbXBsZW1lbnQgbGF0ZXIuIFRoaXMgd2lsbCBiZSBoZWxwZnVsIHRvIHRyYWNrIGRv
d24gYW55DQo+IGZ1bmN0aW9uIHlvdSBoYXZlbid0IGltcGxlbWVudGVkLg0KPiANCj4gDQo+ID4g
K30NCj4gPiArDQo+ID4gK3ZvaWQgKiBfX2luaXQgZWFybHlfZmR0X21hcChwYWRkcl90IGZkdF9w
YWRkcikNCj4gPiArew0KPiA+ICsgICAgcmV0dXJuIE5VTEw7DQo+ID4gK30NCj4gPiArDQo+ID4g
K3ZvaWQgX19pbml0IHJlbW92ZV9lYXJseV9tYXBwaW5ncyh2b2lkKQ0KPiA+ICt7DQo+IA0KPiBE
aXR0bw0KPiANCj4gPiArfQ0KPiA+ICsNCj4gPiAraW50IGluaXRfc2Vjb25kYXJ5X3BhZ2V0YWJs
ZXMoaW50IGNwdSkNCj4gPiArew0KPiA+ICsgICAgcmV0dXJuIC1FTk9TWVM7DQo+ID4gK30NCj4g
PiArDQo+ID4gK3ZvaWQgbW11X2luaXRfc2Vjb25kYXJ5X2NwdSh2b2lkKQ0KPiA+ICt7DQo+IA0K
PiBEaXR0by4gVGhlIG5hbWUgb2YgdGhlIGZ1bmN0aW9uIGlzIGFsc28gYSBiaXQgb2RkIGdpdmVu
IHRoaXMgaXMgYW4gTVBVDQo+IHNwZWNpZmljIGZpbGUuIFRoaXMgbGlrZWx5IHdhbnQgdG8gYmUg
cmVuYW1lZCB0byBtbV9pbml0X3NlY29uZGFyeV9jcHUoKS4NCj4gDQo+ID4gK30NCj4gPiArDQo+
ID4gK3ZvaWQgKmlvcmVtYXBfYXR0cihwYWRkcl90IHBhLCBzaXplX3QgbGVuLCB1bnNpZ25lZCBp
bnQgYXR0cmlidXRlcykNCj4gPiArew0KPiA+ICsgICAgcmV0dXJuIE5VTEw7DQo+ID4gK30NCj4g
PiArDQo+ID4gK3ZvaWQgKmlvcmVtYXAocGFkZHJfdCBwYSwgc2l6ZV90IGxlbikNCj4gPiArew0K
PiA+ICsgICAgcmV0dXJuIE5VTEw7DQo+ID4gK30NCj4gPiArDQo+ID4gK2ludCBtYXBfcGFnZXNf
dG9feGVuKHVuc2lnbmVkIGxvbmcgdmlydCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgbWZu
X3QgbWZuLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIG5yX21mbnMs
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFncykNCj4gPiArew0K
PiA+ICsgICAgcmV0dXJuIC1FTk9TWVM7DQo+ID4gK30NCj4gPiArDQo+ID4gK2ludCBkZXN0cm95
X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVkIGxvbmcgZSkNCj4gPiArew0K
PiA+ICsgICAgcmV0dXJuIC1FTk9TWVM7DQo+ID4gK30NCj4gPiArDQo+ID4gK2ludCBtb2RpZnlf
eGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgcywgdW5zaWduZWQgbG9uZyBlLCB1bnNpZ25lZCBp
bnQNCj4gZmxhZ3MpDQo+ID4gK3sNCj4gPiArICAgIHJldHVybiAtRU5PU1lTOw0KPiA+ICt9DQo+
ID4gKw0KPiA+ICt2b2lkIGZyZWVfaW5pdF9tZW1vcnkodm9pZCkNCj4gPiArew0KPiANCj4gRGl0
dG8uDQo+IA0KPiA+ICt9DQo+ID4gKw0KPiA+ICtpbnQgeGVubWVtX2FkZF90b19waHlzbWFwX29u
ZSgNCj4gPiArICAgIHN0cnVjdCBkb21haW4gKmQsDQo+ID4gKyAgICB1bnNpZ25lZCBpbnQgc3Bh
Y2UsDQo+ID4gKyAgICB1bmlvbiBhZGRfdG9fcGh5c21hcF9leHRyYSBleHRyYSwNCj4gPiArICAg
IHVuc2lnbmVkIGxvbmcgaWR4LA0KPiA+ICsgICAgZ2ZuX3QgZ2ZuKQ0KPiA+ICt7DQo+ID4gKyAg
ICByZXR1cm4gLUVOT1NZUzsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgIC8qDQo+ID4gICAgKiBMb2Nh
bCB2YXJpYWJsZXM6DQo+ID4gICAgKiBtb2RlOiBDDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwN
Cg==

