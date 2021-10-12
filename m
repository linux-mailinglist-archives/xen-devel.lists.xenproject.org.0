Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6DE429B83
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 04:30:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206679.362309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma7Xn-0007Mi-Ft; Tue, 12 Oct 2021 02:29:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206679.362309; Tue, 12 Oct 2021 02:29:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma7Xn-0007Kp-CU; Tue, 12 Oct 2021 02:29:31 +0000
Received: by outflank-mailman (input) for mailman id 206679;
 Tue, 12 Oct 2021 02:29:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O3og=PA=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1ma7Xl-0007Kj-Js
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 02:29:29 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.80]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 384d0788-2b04-11ec-8102-12813bfff9fa;
 Tue, 12 Oct 2021 02:29:27 +0000 (UTC)
Received: from AM6PR08CA0028.eurprd08.prod.outlook.com (2603:10a6:20b:c0::16)
 by AM4PR08MB2628.eurprd08.prod.outlook.com (2603:10a6:205:c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Tue, 12 Oct
 2021 02:29:24 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::a2) by AM6PR08CA0028.outlook.office365.com
 (2603:10a6:20b:c0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Tue, 12 Oct 2021 02:29:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 02:29:23 +0000
Received: ("Tessian outbound a8bfe25d7364:v103");
 Tue, 12 Oct 2021 02:29:23 +0000
Received: from 954cb03bd255.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CD500A6E-C049-49F8-9839-A86FB5553C2E.1; 
 Tue, 12 Oct 2021 02:29:17 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 954cb03bd255.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Oct 2021 02:29:17 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB3406.eurprd08.prod.outlook.com (2603:10a6:803:7b::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 02:29:16 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::41d6:b115:3b22:2cd]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::41d6:b115:3b22:2cd%2]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 02:29:16 +0000
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
X-Inumbo-ID: 384d0788-2b04-11ec-8102-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVIEyy3QOklML/pa/qDqtFCqZ+r61uQKBWWmHlqHiIM=;
 b=rtsOKu7541/JLwq15EHCHNBJbs6q1oYXl46lbX3Lg4153Hs7Hy6/Un/23TBNWnDIR2LxrP2G63jK4RdHxSJkiCo9x0UnTJLjXAn3IKKEfbbxKe9XcBu7sk7DqFpyRofc1D06iacKeSEAwvuwb5y0Gc4aPELNGAYwtrPcQGdKqEY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbDdndyRPOL04CiBixPaJGbKIyFOrDRyWJs+4GBv0xttl5lNDKIppVqiroN8lT8zupmJkNnZmgdTJx6NZtXC6/RkADMFgjYYuYyACOEsDG/NRzNnqWcFiK/l/yZCy+HSd31XLHzTcMAhsGiOkwLksWvtqUuUKYwM7+nc4IMpwPrzHkJ5LHR0CryD64DBucZM0GFJ5acARcdg2bMR21F3dFuNJitI5AsYaT/IWMUDoHTh7c/yx8JgT6b+LXhhNzDw/qGolWCXfbTpqTto85to2NPG3X7RlTSjqLCZJwRNPGYeMO8rIBBrJvRtfq2eGNkShKGUxQ97fjHXrnbKfqykbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVIEyy3QOklML/pa/qDqtFCqZ+r61uQKBWWmHlqHiIM=;
 b=FVThkmEXe1yROp7MJvNy6llF0sw+UoCKVky+q7Y2cA+3sQRyxIx8ZjUXs+auJ/iMgtDryjdkf4CREAYFQXVMtTPoHAY9IH9v15QwiJvxNBV+tPvzYG586Ybu3vHa5j0lLaq43bnB1KVyI4R4AjkGM81h4dunrJ0hvCJHKt69Xmxtj5IBt7oL8o3lKFkBA1ckSEPlgPC5qaY4GMZe1i4vmxXmVAw3XBvbTy096q2GqtvcOLYwUXVroCsJPalsi7SGlBCXZXc5zksPzpHXMdF0X8aq4AhQMkS898MmJjkmHuIR3oFjsiEoghCgcrWTVpPqBM3tCSlEnmjUg5j+aNKehw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVIEyy3QOklML/pa/qDqtFCqZ+r61uQKBWWmHlqHiIM=;
 b=rtsOKu7541/JLwq15EHCHNBJbs6q1oYXl46lbX3Lg4153Hs7Hy6/Un/23TBNWnDIR2LxrP2G63jK4RdHxSJkiCo9x0UnTJLjXAn3IKKEfbbxKe9XcBu7sk7DqFpyRofc1D06iacKeSEAwvuwb5y0Gc4aPELNGAYwtrPcQGdKqEY=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: RE: [PATCH 10/11] xen/arm: device assignment on 1:1 direct-map domain
Thread-Topic: [PATCH 10/11] xen/arm: device assignment on 1:1 direct-map
 domain
Thread-Index: AQHXsCjEx0HGlBpA+Em1L92CXDXaB6uxe3AAgBj87fCAA0mcAIAA/Yeg
Date: Tue, 12 Oct 2021 02:29:15 +0000
Message-ID:
 <VE1PR08MB521558584344ED4A7D97CA4AF7B69@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210923031115.1429719-1-penny.zheng@arm.com>
 <20210923031115.1429719-11-penny.zheng@arm.com>
 <c6730ec5-53c7-9bf2-4620-eefbc7c7c4a3@xen.org>
 <VE1PR08MB5215A1D5695F388F17C367D4F7B39@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <9237c85c-87d0-14ac-07ce-244958add7d3@xen.org>
In-Reply-To: <9237c85c-87d0-14ac-07ce-244958add7d3@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 63436D5B58CE0448AB37AF11C4E5BC46.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 91237540-c42c-4fe3-9b4b-08d98d281b02
x-ms-traffictypediagnostic: VI1PR08MB3406:|AM4PR08MB2628:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM4PR08MB262844155A70FA86F2B4AA3EF7B69@AM4PR08MB2628.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wqLrc215ejlKxvqMGTvRV4cuDK1v8GklhK7UwmTzMnU0K/ed1F2+EWUijcB6Qe1bCd1XMweoala7NgKDsm37ud3RPwJHLui3S6vZsEl605/uHhwrq15Ikd+N26x+3ugIKYK82fs05uZm3vHwCmno42F5RuDtgylsZSu/gLluuVYyn3AlGqKzHva9GB9oJs35lJ6aNp99FcaCfQM5A5Y6AIw85/+MPEAzooHXYnmgq5qHn1YvJ7yekWhl6UxhPG3BwdiI/ZhEFo1+ag5bQjIDHLFx6u4bBqIoum8A5RpsfC5H8PPu5Nre2DGIdJVixAio+rMPKq2dl85IxWONp/7DHnPD6cSF8LM62C2e0NJYCGy9SLbxuTyMxKvGAVt/QTPAWkWjPWyMdB9P970BqurF1NFJQcGU572LKZRFjFKxbSKqWf8NsDfsc8kWULaFJRzaJmsaKRm2OPriguRB1svcAHKWj3TrSNiwsJK9g4OemryoZ1y+AyCc2YGEwrKvVrqqnd0He7cUltnvY+/LqPpkRtMCeMuMDwgM1Ev3QteG6u26InP1nOfhJJ5iFrmFk1Hr72hmR1k6CtZ0VYv+t8MFccgxEePRj0D4RLROGsNl6cgh7p/qG3iSHSmrKuOn8JxWb2PyRpCySpkgHgAYKPx++HEIsZeuTL3hOWBpoWA2H+ZHwlPXGCpm2EzAaGnLqTxePe6EyfYzY1Rcm/ZKs25m3A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(9686003)(110136005)(4326008)(38100700002)(26005)(52536014)(5660300002)(55016002)(54906003)(33656002)(38070700005)(8936002)(122000001)(186003)(66446008)(508600001)(66556008)(316002)(66946007)(8676002)(76116006)(2906002)(64756008)(83380400001)(6506007)(71200400001)(53546011)(86362001)(7696005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3406
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f386a2d5-7be0-40b8-277c-08d98d281638
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4zQsdqTPQgJrgFF3zlt19k4U9BYsbsOKZkx2ChNhau7cYtTk4wg/N2+GfjjEqeMco4mJ66VsFxGp8KqakC1Qq+9hbK33f0PeZJZex661BbIx/u6vZHnEhpKwXdaC/8C21ZcLRxfeq7SFkgHyKZWMY2M96I8HvFKmbA/yKUAddrQ0+pFSzcVBu4uz0u2xSCpVn3yNB8c9NqeGYKjjov9PS1tZoTJpOlH06KUU4EqZ/B0el9UuxFr4ARk+MFdD2GOAfB09BGeotIki54tjD8QSdV7JMTHRUGq7F8g4+eVbIy4CHTBJXESh5iUkfnw5MXa/wZNwATWCRW8wdXdvL07BJU5ZG/JA6eD1uCA4j9n5jjCxi6n/49HpAhbYf0lvky0tyYK3rZ6gU/FJq9Mg+abEyd7KQ9MTd8+lzygjsDjj+Y4nWRXNDMDC3J5hEHTfl/Jz06tz8OB30IXmXP3pxzFbWD9Hn6nx1xhSKbpDGNodMVGdUVDlCuiL4VNHtYdRKd+Xfo+4hXXUYLAKRMSE/i+D8irtHnkowwJkwITkXaPbLsWLjnZ124Bb/5vobhR4hhL2AkA/bjEQjl40QhRCuBwlnWKnupOx6XfAqB4HOjldoCHOCeN/VgQGI1xYHjM0EiZYsDuwbje47hIxFX8hTXn+qqfnww5ATfRuhYY+elxQYAzdL2PE9BlTQIloBSrOfgedNBpiXxUxxEgrpQuZh8KeVw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(356005)(47076005)(83380400001)(53546011)(6506007)(54906003)(336012)(9686003)(316002)(110136005)(4326008)(5660300002)(81166007)(55016002)(86362001)(7696005)(508600001)(8936002)(70206006)(52536014)(8676002)(26005)(36860700001)(2906002)(186003)(82310400003)(33656002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 02:29:23.9820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91237540-c42c-4fe3-9b4b-08d98d281b02
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2628

SGkganVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDExLCAyMDIx
IDc6MTQgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENj
OiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0K
PiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxMC8xMV0geGVuL2Fy
bTogZGV2aWNlIGFzc2lnbm1lbnQgb24gMToxIGRpcmVjdC1tYXANCj4gZG9tYWluDQo+IA0KPiAN
Cj4gDQo+IE9uIDA5LzEwLzIwMjEgMTA6NDAsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IEhpIEp1
bGllbg0KPiANCj4gSGkgUGVubnksDQo+IA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4+IFNl
bnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMjMsIDIwMjEgNzoyNyBQTQ0KPiA+PiBUbzogUGVubnkg
WmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+Ow0KPiA+PiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmcNCj4gPj4gQ2M6IEJlcnRyYW5kIE1hcnF1
aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFdlaSBDaGVuDQo+ID4+IDxXZWkuQ2hlbkBh
cm0uY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIDEwLzExXSB4ZW4vYXJtOiBkZXZpY2Ug
YXNzaWdubWVudCBvbiAxOjENCj4gPj4gZGlyZWN0LW1hcCBkb21haW4NCj4gPj4NCj4gPj4gSGks
DQo+ID4+DQo+ID4+IE9uIDIzLzA5LzIwMjEgMDg6MTEsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+
Pj4gVXNlciBjb3VsZCBkbyBkZXZpY2UgcGFzc3Rocm91Z2gsIHdpdGgNCj4gPj4+ICJ4ZW4sZm9y
Y2UtYXNzaWduLXdpdGhvdXQtaW9tbXUiIGluIHRoZSBkZXZpY2UgdHJlZSBzbmlwcGV0LCBvbg0K
PiA+Pj4gdHJ1c3RlZCBndWVzdCB0aHJvdWdoIDE6MSBkaXJlY3QtbWFwLCBpZiBJT01NVSBhYnNl
bnQgb3IgZGlzYWJsZWQgb24NCj4gPj4gaGFyZHdhcmUuDQo+ID4+DQo+ID4+IEF0IHRoZSBtb21l
bnQsIGl0IHdvdWxkIGJlIHBvc3NpYmxlIHRvIHBhc3N0aHJvdWdoIGEgbm9uLURNQSBjYXBhYmxl
DQo+ID4+IGRldmljZSB3aXRoIGRpcmVjdC1tYXBwaW5nLiBBZnRlciB0aGlzIHBhdGNoLCB0aGlz
IGlzIGdvaW5nIHRvIGJlIGZvcmJpZGRlbi4NCj4gPj4NCj4gPj4+DQo+ID4+PiBJbiBvcmRlciB0
byBhY2hpZXZlIHRoYXQsIHRoaXMgcGF0Y2ggYWRkcyAxOjEgZGlyZWN0LW1hcCBjaGVjayBhbmQN
Cj4gPj4+IGRpc2FibGVzIGlvbW11LXJlbGF0ZWQgYWN0aW9uLg0KPiA+Pj4NCj4gPj4+IFNpZ25l
ZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPiA+Pj4gLS0tDQo+
ID4+PiAgICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAxMiArKysrKysrKy0tLS0NCj4g
Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+
ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiA+
Pj4gYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgaW5kZXggYzkyZTUxMGFlNy4uOWE5ZDI1
MjJiNyAxMDA2NDQNCj4gPj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiA+
Pj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+ID4+PiBAQCAtMjA3MCwxNCAr
MjA3MCwxOCBAQCBzdGF0aWMgaW50IF9faW5pdA0KPiA+PiBoYW5kbGVfcGFzc3Rocm91Z2hfcHJv
cChzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLA0KPiA+Pj4gICAgICAgIGlmICggcmVzIDwgMCAp
DQo+ID4+PiAgICAgICAgICAgIHJldHVybiByZXM7DQo+ID4+Pg0KPiA+Pj4gKyAgICAvKg0KPiA+
Pj4gKyAgICAgKiBJZiB4ZW5fZm9yY2UsIHdlIGFsbG93IGFzc2lnbm1lbnQgb2YgZGV2aWNlcyB3
aXRob3V0IElPTU1VDQo+ID4+IHByb3RlY3Rpb24uDQo+ID4+PiArICAgICAqIEFuZCBpZiBJT01N
VSBpcyBkaXNhYmxlZCBvciBhYnNlbnQsIDE6MSBkaXJlY3QtbWFwIGlzDQo+ID4+PiArIG5lY2Vz
c2FyeSA+ICsNCj4gPj4gKi8NCj4gPj4+ICsgICAgaWYgKCB4ZW5fZm9yY2UgJiYgaXNfZG9tYWlu
X2RpcmVjdF9tYXBwZWQoa2luZm8tPmQpICYmDQo+ID4+PiArICAgICAgICAgIWR0X2RldmljZV9p
c19wcm90ZWN0ZWQobm9kZSkgKQ0KPiA+Pg0KPiA+PiBkdF9kZXZpY2VfaXNfcHJvdGVjdGVkKCkg
d2lsbCBiZSBhbHdheXMgZmFsc2UgdW5sZXNzIHRoZSBkZXZpY2UgaXMNCj4gPj4gcHJvdGVjdGVk
IGJlaGluZyBhbiBTTU1VIHVzaW5nIHRoZSBsZWdhY3kgYmluZGluZy4gU28gSSBkb24ndCB0aGlu
aw0KPiA+PiB0aGlzIGlzIGNvcnJlY3QgdG8gbW92ZSB0aGlzIGNoZWNrIGFoZWFkLiBJbiBmYWN0
Li4NCj4gPj4NCj4gPj4+ICsgICAgICAgIHJldHVybiAwOw0KPiA+Pj4gKw0KPiA+Pj4gICAgICAg
IHJlcyA9IGlvbW11X2FkZF9kdF9kZXZpY2Uobm9kZSk7DQo+ID4+DQo+ID4+IC4uLiB0aGUgY2Fs
bCBzaG91bGQgYWxyZWFkeSBiZSBhIE5PUCB3aGVuIHRoZSBJT01NVSBpcyBkaXNhYmxlZCBvcg0K
PiA+PiB0aGUgZGV2aWNlIGlzIG5vdCBiZWhpbmQgYW4gSU9NTVUuIFNvIGNhbiB5b3UgZXhwbGFp
biB3aGF0IHlvdSBhcmUNCj4gPj4gdHJ5aW5nIHRvIHByZXZlbnQgaGVyZT8NCj4gPj4NCj4gPg0K
PiA+IElmIHRoZSBJT01NVSBpcyBkaXNhYmxlZCwgaW9tbXVfYWRkX2R0X2RldmljZSB3aWxsIHJl
dHVybiAxIGFzIGVycm5vLg0KPiA+IFNvIHdlIGNvdWxkIG5vdCBtYWtlIGl0IHRvIHRoZSB4ZW5f
Zm9yY2UgY2hlY2suLi4NCj4gDQo+IEkgZGlzYWdyZWUuIFRoZSBjaGVjayBpczoNCj4gDQo+IGlm
ICggcmVzIDwgMCApDQo+ICAgIHJldHVybiByZXM7DQo+IA0KPiBHaXZlbiB0aGF0IHJlcyBpcyAx
LCB3ZSB3b3VsZG4ndCByZXR1cm4gYW5kIG1vdmUgdG8gY2hlY2sgd2hldGhlciB0aGUNCj4gYXNz
aWdubWVudCBjYW4gYmUgZG9uZS4NCj4gDQo+ID4NCj4gPiBTbyBJIHRyaWVkIHRvIG1vdmUgYWxs
IElPTU1VIGFjdGlvbiBiZWhpbmQgeGVuX2ZvcmNlIGNoZWNrLg0KPiA+DQo+ID4gTm93LCBkZXZp
Y2UgYXNzaWdubWVudCB3aXRob3V0IElPTU1VIHByb3RlY3Rpb24gaXMgb25seSBhcHBsaWNhYmxl
IG9uDQo+ID4gZGlyZWN0LW1hcCBkb21haW5zLA0KPiANCj4gSXQgaXMgZmluZSB0byBhc3NpZ24g
YSBub24tRE1BIGNhcGFibGUgZGV2aWNlIHdpdGhvdXQgZGlyZWN0LW1hcHBpbmcuIFNvIHdoeQ0K
PiBkbyB5b3Ugd2FudCB0byBhZGQgdGhpcyByZXN0cmljdGlvbj8NCg0KSSB1bmRlcnN0YW5kLg0K
SWYgaXQgaXMgZmluZSB0byBhc3NpZ24gYSBub24tRE1BIGNhcGFibGUgZGV2aWNlIHdpdGhvdXQg
ZGlyZWN0LW1hcHBpbmcsIHRoZSBmb3JtZXINCmNvbW1pdCBjb250YWluaW5nIHRoZSBmb2xsb3dp
bmcgY2hhbmdlcyBuZWVkcyBmaXguDQoNCiAgICAgICAgIGlmICggZHRfZmluZF9jb21wYXRpYmxl
X25vZGUobm9kZSwgTlVMTCwgIm11bHRpYm9vdCxkZXZpY2UtdHJlZSIpICkNCiAgICAgICAgew0K
ICAgICAgICAgICAgaWYgKCBpb21tdV9lbmFibGVkICkNCiAgICAgICAgICAgICAgICBkX2NmZy5m
bGFncyB8PSBYRU5fRE9NQ1RMX0NERl9pb21tdTsNCiAgICAgICAgICAgIGVsc2UgaWYgKCBkX2Nm
Zy5mbGFncyAmIFhFTl9ET01DVExfSU5URVJOQUxfZGlyZWN0bWFwICkNCiAgICAgICAgICAgICAg
ICB3YXJuaW5nX2FkZCgiUGxlYXNlIGJlIHN1cmUgb2YgaGF2aW5nIHRydXN0ZWQgZ3Vlc3RzLCB3
aGVuIGRvaW5nIGRldmljZSBhc3NpZ25tZW50IHdpdGhvdXQgSU9NTVUgcHJvdGVjdGlvblxuIik7
DQogICAgICAgICAgICBlbHNlDQogICAgICAgICAgICAgICAgcGFuaWMoIkFzc2lnbiBhIGRldmlj
ZSBidXQgSU9NTVUgYW5kIGRpcmVjdC1tYXAgYXJlIGFsbCBkaXNhYmxlZFxuIik7DQogICAgICAg
IH0NCg0KRGVmaW5pdGVseSBubyBwYW5pYyB3aGVuIElPTU1VIGFuZCBkaXJlY3QtbWFwIGFyZSBh
bGwgZGlzYWJsZWQuDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

