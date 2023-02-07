Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DC368CE48
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 05:42:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490851.759726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPFnC-0003vL-Vx; Tue, 07 Feb 2023 04:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490851.759726; Tue, 07 Feb 2023 04:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPFnC-0003t9-T5; Tue, 07 Feb 2023 04:41:18 +0000
Received: by outflank-mailman (input) for mailman id 490851;
 Tue, 07 Feb 2023 04:41:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8+Lq=6D=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pPFnB-0003t3-Bm
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 04:41:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7e1d153-a6a1-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 05:41:15 +0100 (CET)
Received: from DUZPR01CA0130.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::25) by DB9PR08MB8458.eurprd08.prod.outlook.com
 (2603:10a6:10:3d6::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Tue, 7 Feb
 2023 04:41:11 +0000
Received: from DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4bc:cafe::54) by DUZPR01CA0130.outlook.office365.com
 (2603:10a6:10:4bc::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35 via Frontend
 Transport; Tue, 7 Feb 2023 04:41:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT042.mail.protection.outlook.com (100.127.142.143) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.35 via Frontend Transport; Tue, 7 Feb 2023 04:41:11 +0000
Received: ("Tessian outbound baf1b7a96f25:v132");
 Tue, 07 Feb 2023 04:41:11 +0000
Received: from f44109f421b3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 58CB2DA3-BFAA-4A65-953C-F8C3EDAD0D7C.1; 
 Tue, 07 Feb 2023 04:41:05 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f44109f421b3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Feb 2023 04:41:05 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by GVXPR08MB7869.eurprd08.prod.outlook.com (2603:10a6:150:1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Tue, 7 Feb
 2023 04:41:02 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab%3]) with mapi id 15.20.6064.025; Tue, 7 Feb 2023
 04:41:01 +0000
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
X-Inumbo-ID: a7e1d153-a6a1-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7n6XQxCZb9v9WEalNy2ILrO3/Yijeb+Kvcd1gHK7j0=;
 b=yFY56P6y08ZexJAnfve4TtWI3Ti7653Xm9i0yd2MnyMmWyEVVKefJgl5xt74nkh4wvPu4TesW+gnGcvpdwFG0Z3JwXdJpCZf2xDeVvM6+vgBQFBY0Y1C2buZJfR3JLe7CSFc/wH87MpF+DGWq0q5k+zEq5aBsNz9evVWTwF0Wbs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQPKOnIYyPfwYxIWLVQrnVd64rDofufS8yZ7n0m1KVvSoUW65x+/vqHhTlgbVtowNEWAWOqXX48Xs0Qm9e/wqVRlVABqr7Bcntr4FWaEAM9RLX6XQFzsrfIzfDT8/0oIcToyjv+q0NjnOUNcTsUUPMgzbD+qQBtfGQanyb+TMxgRsPhnupFOtvqJD8IryWgwfG3eMPXwWh0TqPovMcb/grIHS2rgTjpQHINg/bCINKSEebAdSTQFiYIyCnkh6SEwAA9XVbXa2rhWSYIAVRs2n+fIGBpt3W6W0qsHgnZu9arKSLXuoQyQvbEhZDg1F/R+W3xqSR3qyP04t05odgnZLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7n6XQxCZb9v9WEalNy2ILrO3/Yijeb+Kvcd1gHK7j0=;
 b=biRGH51ymNMcE2zmxnil8KKyUk3CrPWXIB8fdLIaiXv7ne/WLJ9hfsqvOYZzlL8Hiihxa8JGCInkJ/ejzRj8jlAJvCbQ9saDGahi8nvvw3ob67U9HKFQhZswuuVK00KcVtW32DHgOGNuT+p3QsxVLuJKfewa04/wrivoTts+OYmUn1ILcuh5OXGxVtTBtyeNmEZf3iFjF9HyBku/yi00jxyXqBgrA2zp+JfRCbX8ThPGLnbuKlApYx60IgtnQibuf+R5hsnEOOofow78dIYiK+vHLcWuD3hFXiE2MSEUtwbX+pkDyGdkBnS0pU8r0Cxn/2NUcgtd9Hq0HAW98qhjoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7n6XQxCZb9v9WEalNy2ILrO3/Yijeb+Kvcd1gHK7j0=;
 b=yFY56P6y08ZexJAnfve4TtWI3Ti7653Xm9i0yd2MnyMmWyEVVKefJgl5xt74nkh4wvPu4TesW+gnGcvpdwFG0Z3JwXdJpCZf2xDeVvM6+vgBQFBY0Y1C2buZJfR3JLe7CSFc/wH87MpF+DGWq0q5k+zEq5aBsNz9evVWTwF0Wbs=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 16/40] xen/arm: introduce setup_mm_mappings
Thread-Topic: [PATCH v2 16/40] xen/arm: introduce setup_mm_mappings
Thread-Index: AQHZJxApt1qKOFucDkmJWOJS5upXDK7BBHYAgAIIgnA=
Date: Tue, 7 Feb 2023 04:40:59 +0000
Message-ID:
 <AM0PR08MB4530243FF7B6379BA0EF744AF7DB9@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-17-Penny.Zheng@arm.com>
 <906699b8-14ae-d038-3693-63338d7a52cf@xen.org>
In-Reply-To: <906699b8-14ae-d038-3693-63338d7a52cf@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 551B48383A2D1E44BF938ED4B8864A8C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|GVXPR08MB7869:EE_|DBAEUR03FT042:EE_|DB9PR08MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: e8f32b40-775a-4845-879e-08db08c5898f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pri7AWUz/y2ahCC8PlOoNlhrbfsDt/cuVGEiSQazyOn5Fy65tu7pMeS9Zdr4fb2aj63m2HchcjLE3vcYrqinSRd3PdNixPOV808M3bk7Wey1cjS6fl1d73ZsQ58P+yxxPamnNeLrAunniX6LMUVrmMONZu+4sOCl9ZMt25tfw7ScwHFZw9X4oMRyruRshmZc07hQfBMAr08OMweWl8Te17/PeP6HFo+tg2MZAfYxMMQckpyNsAfFIyyHSfOLyuZhcnUPwKI6exPMbxIy6cs19XRR2i42ox1FwCgnmx487Yl4OlXx/8Bo+1Ca0d9dV/0dGN5xbEdiTai5oltRbciI+KD2M4BJBk2Tp3BNtaXMQXMGUQb7T9WbQn3d2Mge6VrpUF3NJqC3UaRcNH4XfMzyPrpJ/VPMSRmBwg6ZpfJ+qozubuvYxTCGULS/U/UC0tHMYvVToS6JKwlxVaH1UVP6dLKm4EtFOGzHtWj95rWFYtaFIahCOVcdBv7eKEfkvEW0hOT9qJGpYiz0KHDg838EpIR5tnH8QyWFwExmq/mUcb9Xt1IlGLuFc8iU+ZgP687F9V7fxPArGkhGugxAm+1Kxw+REmKQzEfceoKKf1PizVUx8y28ctb751EsNB3aZkD8fwcmjEMpHMrjbbQBAr/nTWUTcRQZFqjM1Wfn56RjJsBkYGUhHSv6/ShPM2g9i6PyhXaiwjo7emb/ZAhCtFShY9+BWLu+ZlVlrgJp+lka9/I=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(451199018)(33656002)(316002)(86362001)(478600001)(54906003)(110136005)(71200400001)(5660300002)(55016003)(8936002)(66476007)(52536014)(2906002)(4326008)(76116006)(8676002)(66946007)(64756008)(66556008)(66446008)(41300700001)(38070700005)(122000001)(186003)(83380400001)(9686003)(38100700002)(7696005)(6506007)(53546011)(26005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7869
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7ccd800d-86e0-479a-6c92-08db08c58272
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yedI1mNtoai3hn3y1tbfi3OBCMScgFoUfMk78gmnVOV5JspEGMflDY0Jw4xc4GqxnNTw8q9NS8Cp0I/2+31dWaGw1cwI31lxCdDkD6wQRebzSP9KQlO3CbjIG8Bzi6KBHGmnzq0H2fYJ1OdxDn02B5TONdQdhPMEHdghNGaq/eUcUHezUcCUx+hvJ9j9fkMVFR/VTOr6NXDpalxgBzWTZABQQrdDckAboJl/Urk/+ldGMgxuH2w+0SWumX50CTrddnbbZID36Pp59JSe9kby5UV94VeZLjeq9n+7f1sQ/Ddz1tVoXvMNwmAw4znwKiPsrQR+i+jlfvXwf3pe5hhQ3/Jrh+6UKHK432Dk3S/MrogGQMd8hV5sJOj0RmZOQpB0G0tBn6YSvvx5HxS6QjMC2LZGQCEOlN8RLkD1tWLqesBkeKalaK2z2aNUXYCJquWjk8Ondp0XWCzaflZRKxKMRvaqzDeLL8tOoch89w5toF8W+KnhSgjJmWtVVZbe8dR33r74EdsZkhrIqFW32Eq44o+gUqyKuRbWlpaNeulFQX7Oa8plzb9yT3+uL2JiA+I50eAVKD8Z9/QVSmcFKb0cFbbKs815TdRSlaXcrBI+h/qVywT7usiuSywZVYBGxdRa0Ly6vtiEmeESt/yBtyou/4AmRL6xckmhE2ZAj6kMHmw/l5Vuv7YRllKLpBOV6CAKo6yMMeBlg0DSV/emxLDKbh2OxUFECvNDyksq5Lbh3lw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(478600001)(26005)(186003)(9686003)(7696005)(53546011)(8936002)(5660300002)(52536014)(40480700001)(41300700001)(55016003)(336012)(6506007)(107886003)(316002)(54906003)(110136005)(70586007)(70206006)(356005)(4326008)(83380400001)(8676002)(40460700003)(33656002)(36860700001)(47076005)(81166007)(82740400003)(2906002)(82310400005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 04:41:11.2365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f32b40-775a-4845-879e-08db08c5898f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8458

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSA2LCAyMDIz
IDU6MzIgQU0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNv
bT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRy
YW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47DQo+IFZvbG9keW15ciBCYWJj
aHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MiAxNi80MF0geGVuL2FybTogaW50cm9kdWNlIHNldHVwX21tX21hcHBpbmdzDQo+IA0KPiBIaSwN
Cj4gDQo+IE9uIDEzLzAxLzIwMjMgMDU6MjgsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IEZ1bmN0
aW9uIHNldHVwX3BhZ2V0YWJsZXMgaXMgcmVzcG9uc2libGUgZm9yIGJvb3QtdGltZSBwYWdldGFi
bGUgc2V0dXANCj4gPiBpbiBNTVUgc3lzdGVtLg0KPiA+IEJ1dCBpbiBNUFUgc3lzdGVtLCB3ZSBo
YXZlIGFscmVhZHkgYnVpbHQgdXAgc3RhcnQtb2YtZGF5IFhlbiBNUFUNCj4gPiBtZW1vcnkgcmVn
aW9uIG1hcHBpbmcgYXQgdGhlIHZlcnkgYmVnaW5uaW5nIGluIGFzc2VtYmx5Lg0KPiA+DQo+ID4g
U28gaW4gb3JkZXIgdG8ga2VlcCBvbmx5IG9uZSBjb2RlZmxvdyBpbiBhcm0vc2V0dXAuYywNCj4g
PiBzZXR1cF9tbV9tYXBwaW5ncyAsIHdpdGggYSBtb3JlIGdlbmVyaWMgbmFtZSwgaXMgaW50cm9k
dWNlZCBhbmQgYWN0IGFzDQo+ID4gYW4gZW1wdHkgc3R1YiBpbiBNUFUgc3lzdGVtLg0KPiANCj4g
aXMgdGhlIGVtcHR5IHN0dWIgdGVtcG9yYXJpbHk/DQo+IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTog
V2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4gLS0tDQo+ID4gICB4ZW4vYXJjaC9hcm0v
aW5jbHVkZS9hc20vbW0uaCAgICAgfCAgMiArKw0KPiA+ICAgeGVuL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL21tX21wdS5oIHwgMTYgKysrKysrKysrKysrKysrKw0KPiA+ICAgeGVuL2FyY2gvYXJtL3Nl
dHVwLmMgICAgICAgICAgICAgIHwgIDIgKy0NCj4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgMTkgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9h
cmNoL2FybS9pbmNsdWRlL2FzbS9tbV9tcHUuaA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS9pbmNsdWRlL2FzbS9tbS5oDQo+ID4gYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20v
bW0uaCBpbmRleCAxYjlmZGI2ZmY1Li45YjRjMDdkOTY1IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9h
cmNoL2FybS9pbmNsdWRlL2FzbS9tbS5oDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL21tLmgNCj4gPiBAQCAtMjQzLDYgKzI0Myw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX2lv
bWVtICppb3JlbWFwX3djKHBhZGRyX3QNCj4gPiBzdGFydCwgc2l6ZV90IGxlbikNCj4gPg0KPiA+
ICAgI2lmbmRlZiBDT05GSUdfSEFTX01QVQ0KPiA+ICAgI2luY2x1ZGUgPGFzbS9tbV9tbXUuaD4N
Cj4gPiArI2Vsc2UNCj4gPiArI2luY2x1ZGUgPGFzbS9tbV9tcHUuaD4NCj4gPiAgICNlbmRpZg0K
PiA+DQo+ID4gICAvKiBQYWdlLWFsaWduIGFkZHJlc3MgYW5kIGNvbnZlcnQgdG8gZnJhbWUgbnVt
YmVyIGZvcm1hdCAqLyBkaWZmDQo+ID4gLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20v
bW1fbXB1LmgNCj4gPiBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tbV9tcHUuaA0KPiA+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMC4uMWYzY2ZmNzc0Mw0KPiA+
IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbW1fbXB1
LmgNCj4gPiBAQCAtMCwwICsxLDE2IEBADQo+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wLW9yLWxhdGVyICovICNpZm5kZWYNCj4gPiArX19BUkNIX0FSTV9NTV9NUFVfXyAj
ZGVmaW5lIF9fQVJDSF9BUk1fTU1fTVBVX18NCj4gPiArDQo+ID4gKyNkZWZpbmUgc2V0dXBfbW1f
bWFwcGluZ3MoYm9vdF9waHlzX29mZnNldCkNCj4gPiArKCh2b2lkKShib290X3BoeXNfb2Zmc2V0
KSkNCj4gPiArDQo+ID4gKyNlbmRpZiAvKiBfX0FSQ0hfQVJNX01NX01QVV9fICovDQo+ID4gKw0K
PiA+ICsvKg0KPiA+ICsgKiBMb2NhbCB2YXJpYWJsZXM6DQo+ID4gKyAqIG1vZGU6IEMNCj4gPiAr
ICogYy1maWxlLXN0eWxlOiAiQlNEIg0KPiA+ICsgKiBjLWJhc2ljLW9mZnNldDogNA0KPiA+ICsg
KiBpbmRlbnQtdGFicy1tb2RlOiBuaWwNCj4gPiArICogRW5kOg0KPiA+ICsgKi8NCj4gPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYyBpbmRl
eA0KPiA+IDFmMjZmNjdiOTAuLmQ3ZDIwMDE3OWMgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gv
YXJtL3NldHVwLmMNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPiA+IEBAIC0xMDAz
LDcgKzEwMDMsNyBAQCB2b2lkIF9faW5pdCBzdGFydF94ZW4odW5zaWduZWQgbG9uZw0KPiBib290
X3BoeXNfb2Zmc2V0LA0KPiA+ICAgICAgIC8qIEluaXRpYWxpemUgdHJhcHMgZWFybHkgYWxsb3cg
dXMgdG8gZ2V0IGJhY2t0cmFjZSB3aGVuIGFuIGVycm9yIG9jY3VycmVkDQo+ICovDQo+ID4gICAg
ICAgaW5pdF90cmFwcygpOw0KPiA+DQo+ID4gLSAgICBzZXR1cF9wYWdldGFibGVzKGJvb3RfcGh5
c19vZmZzZXQpOw0KPiA+ICsgICAgc2V0dXBfbW1fbWFwcGluZ3MoYm9vdF9waHlzX29mZnNldCk7
DQo+IA0KPiBZb3UgYXJlIHJlbmFtaW5nIHRoZSBjYWxsZXIgYnV0IG5vdCB0aGUgZnVuY3Rpb24u
IFdoeT8NCj4gDQoNCkl0IGlzIGEgcmVvcmcgbWlzdGFrZS4gIE1NVS1yZWxhdGVkIGltcGxlbWVu
dGF0aW9uIGhhcyBiZWVuIG1pc3Rha2VubHkNCnB1dCBpbiBwcmV2aW91cyBjb21taXQgIltQQVRD
SCB2MiAxNS80MF0geGVuL2FybTogbW92ZSBNTVUtc3BlY2lmaWMNCm1lbW9yeSBtYW5hZ2VtZW50
IGNvZGUgdG8gbW1fbW11LmMvbW1fbW11LmgiKGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
YXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMy0wMS9tc2cwMDc3Ni5odG1sICkNClNvcnJ5IGZv
ciB0aGF0Lg0KSSdsbCBleHRyYWN0IHRoZSByZWxhdGl2ZSBjb2RlcyBmcm9tIHRoZSBwcmV2aW91
cyBjb21taXQ6DQonJycNCisvKiBCb290LXRpbWUgcGFnZXRhYmxlIHNldHVwICovDQorI2RlZmlu
ZSBzZXR1cF9tbV9tYXBwaW5ncyhib290X3BoeXNfb2Zmc2V0KSBzZXR1cF9wYWdldGFibGVzKGJv
b3RfcGh5c19vZmZzZXQpDQonJycNCg0KPiA+DQo+ID4gICAgICAgc21wX2NsZWFyX2NwdV9tYXBz
KCk7DQo+ID4NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

