Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B27C42EAC2A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 14:45:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62006.109480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmeT-0005PG-OO; Tue, 05 Jan 2021 13:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62006.109480; Tue, 05 Jan 2021 13:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmeT-0005Or-K1; Tue, 05 Jan 2021 13:45:33 +0000
Received: by outflank-mailman (input) for mailman id 62006;
 Tue, 05 Jan 2021 13:45:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PMne=GI=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kwmeS-0005Om-Nx
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 13:45:32 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.48]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 688d20e0-46a8-4f95-97a2-5ace3e9fe656;
 Tue, 05 Jan 2021 13:45:30 +0000 (UTC)
Received: from AM5PR0202CA0007.eurprd02.prod.outlook.com
 (2603:10a6:203:69::17) by AM6PR08MB3574.eurprd08.prod.outlook.com
 (2603:10a6:20b:4e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.21; Tue, 5 Jan
 2021 13:45:28 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::dd) by AM5PR0202CA0007.outlook.office365.com
 (2603:10a6:203:69::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Tue, 5 Jan 2021 13:45:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.21 via Frontend Transport; Tue, 5 Jan 2021 13:45:26 +0000
Received: ("Tessian outbound 76bd5a04122f:v71");
 Tue, 05 Jan 2021 13:45:26 +0000
Received: from a76ec6be37ea.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 513F19B8-1662-480B-ACBE-93DB9B7375B9.1; 
 Tue, 05 Jan 2021 13:45:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a76ec6be37ea.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Jan 2021 13:45:21 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM0PR08MB3588.eurprd08.prod.outlook.com (2603:10a6:208:d5::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Tue, 5 Jan
 2021 13:45:19 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::61dc:45c4:eef0:c88f]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::61dc:45c4:eef0:c88f%6]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 13:45:19 +0000
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
X-Inumbo-ID: 688d20e0-46a8-4f95-97a2-5ace3e9fe656
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjDs4SnL011nDSgj30UJ/51rGm3GjlmwE9aR4KkaXXk=;
 b=LiZX38ZpcZaLf58P1XfdB2jG+HxgTSZQY4TTxWwV/0XK3jpgQMVY6lUE/QQUubDcd44QMGDVGw44fFzyALqhJraaDAXu3vlg+FX3iCPvw5lAs3PCWT6J4NfRBdcjpj8qoZzQ2TF6VSz4QzEc12u7zr5f2cWe1rGmZo1CRfQY5lo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bT+ajB1hBxkPrM2zhncmHU1C9x+suwxhr6o0aPgNVLAxuJqUCbVwD36I1NFhTmfO2EAULbtId+W52ySZ35Yvqxv592oixzFrrODmhyg9X1RxdzsW64aAM2X8zhzjdDbkklPbMTw7yKGaXM4JOt8aIw8OPDOA/YniaOYmX6XunqwD+SMN6r1hL92r3jv9ctUw8V5tScDcJK/GAjjGwjUvhWiDBHPFHPA1kdvzBHsysl9HetXyFx0adLjPqbKE1mgwRff33M8xTEIPojGBD8MEtS2QJbIhPLCYyrfGCJ40wUQid1uFittZ58uUPwqDUPyGdkDgTXUkZquRmRiSY9hB2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjDs4SnL011nDSgj30UJ/51rGm3GjlmwE9aR4KkaXXk=;
 b=AsRPOz+vZPm9Ug2U+dT5d10OCuFzeBiISVI+vU428FSm2FewFO6YeuGeqJNNV++4P5vBXi8aO55n5xuEXEJeOAtmyFcASwQl+oF/svtEeanWXDRqMmm52+61d3Y6+0hWyR82BJhCm+nmFQVYxGMO0trpwy7flDOIPw7IPp8ovdUflq2sxE9eoNwyRq1rYtiRSMK0/OC2dvDJAILPloikA/BkUxpgvZwYVk/Gi7Ublhjv0lNJrr7o8iPOo9x7wtjqdsDHMYyLB1PX+V71h29DdIB4fhB2MZYwwaU5ouYZ9FNKPki6u21qBhn51axYmXKTY5ge9VWNNd8Ea61GsncLAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjDs4SnL011nDSgj30UJ/51rGm3GjlmwE9aR4KkaXXk=;
 b=LiZX38ZpcZaLf58P1XfdB2jG+HxgTSZQY4TTxWwV/0XK3jpgQMVY6lUE/QQUubDcd44QMGDVGw44fFzyALqhJraaDAXu3vlg+FX3iCPvw5lAs3PCWT6J4NfRBdcjpj8qoZzQ2TF6VSz4QzEc12u7zr5f2cWe1rGmZo1CRfQY5lo=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Jiamei Xie <Jiamei.Xie@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH 2/2] xen/arm: Add defensive barrier in get_cycles for
 Arm64
Thread-Topic: [PATCH 2/2] xen/arm: Add defensive barrier in get_cycles for
 Arm64
Thread-Index: AQHW4zNBI7x1mwnbbkKoYtWrrgcLUaoY4jaAgAAo2uA=
Date: Tue, 5 Jan 2021 13:45:19 +0000
Message-ID:
 <AM0PR08MB3747011FC14F4BE627F3C7409ED10@AM0PR08MB3747.eurprd08.prod.outlook.com>
References: <20210105071946.1971229-1-wei.chen@arm.com>
 <20210105071946.1971229-2-wei.chen@arm.com>
 <522b798d-5f89-648e-bfe2-6fe36cc7a571@xen.org>
In-Reply-To: <522b798d-5f89-648e-bfe2-6fe36cc7a571@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F2BEA4A8A1A66B4CABE59386DEF59774.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [116.230.239.117]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e097e3ac-1c36-4e4b-da4d-08d8b1802969
x-ms-traffictypediagnostic: AM0PR08MB3588:|AM6PR08MB3574:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB35746B42CC92C4159F4D48039ED10@AM6PR08MB3574.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JIccjXKt888PedjCckKcWJ0SZabeGEmLX1/yNKFOc5exC55qkP49V0bn0r13WSh4YeXJuoQM7PY/Yj5A7b/01NXb77QGS++aN6a2mZh/B+H18GP7ZEkGLsR/BZi5gvbpROjIW5kfDWOz0ebUwdk8GjSbEfyILnvnCDrdzk/eF6pVO+PasLsU+9ZLjNpynudNJ1mU8I/8IP+Ym2CBQPbdz6i3sysQBh9II/D8SXAkQJlsdqN0SQSTKTj9x2OeoaMwaDWQuYuwU49gW09pyhge4iGD9bxRt7sGWNUVWBWscmMQQnRuuiSI8fMW8N/7j5I3Hz0e4UUTL7kcSUQUMJLWYooeqtyFdSdOyMzwFElvQS04deBlJ2byH0f8WtOG+q/BysCjGMX+6iFUcsqYW1XEMglSuuvLQDYLfvamJldMFjiSzMHPfJhFmNL1JCL8Alpme9hY3ORQ9mrIh58kvrRekOf8gdyO7nIuNpfABrV41Pl+M5pkJ3qPOcuz2Mo29DSS/FoDdlIWKChdEvrCpvDYvQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3747.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(66556008)(64756008)(86362001)(66446008)(76116006)(52536014)(66476007)(26005)(53546011)(186003)(6506007)(5660300002)(66946007)(83380400001)(4326008)(478600001)(966005)(316002)(110136005)(9686003)(7696005)(71200400001)(55016002)(8936002)(33656002)(2906002)(54906003)(8676002)(87944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?ME5wQm9Sdlhmckk1ZWNEVDMwS25uWXczdWNYT0dNZkd2MXlneml2V1NoVW12?=
 =?utf-8?B?US9seG5xRUFTRGxSVHl1dUFmUGdkdi81NWp4YVZvbW9sWnVCZXBnZEZUOUpt?=
 =?utf-8?B?UUFJUXY1ZjM3WE1vZWRQb2lXM1BGZVZ6cVA3cUg3WXEzTUQwQ3VJR0ZQQWFz?=
 =?utf-8?B?RmFuUm1iUng0UDk2VmRjdU84VGU2U3kwSS9oR29VdzcybW01anp4TExMWlpl?=
 =?utf-8?B?MWY5elUwbWhLaGRCeUdlcE9GTFpSU2k5WnQySFFkRkg0dXcrTytMdml5M1RL?=
 =?utf-8?B?WklyUWU1Y0xJSjQrRlVCam5pQnlBcVhOaHFkWTlpTmhpUzJkbExySHZpWEZ6?=
 =?utf-8?B?dGpnWlpVV3BiVk9yMUZaMGpPVTJ2SVEwRU0xTW40aXFNOS9vSTBveEgxUU1m?=
 =?utf-8?B?NFdsUkdjcE14eEloLzZJdnFoWXhIejdWdll3dlBaNVdtNzZjOGpPVVp0ZThi?=
 =?utf-8?B?S3hrT3lqM2RRVFZQWGErWnRmUTlDOHF2T21QZFZPVVhYUzBqNnFBbklwSVJJ?=
 =?utf-8?B?WTZkeTBBL1EyU2REOW4xZ29TZkJkclRzQUxTc0xaaVpvS2RkOVJkTE9xRnp1?=
 =?utf-8?B?OWFSZlFKbmdqcjB5VTFSNGRBSjREZ2I1TVQ4LytqUDB5UTBmMW9kOHQ3N1JF?=
 =?utf-8?B?QmNTUW94aXRadUlzb1hVK1BLS0ZMMXFYeXA3b0c0V2dIK1hjT1pFT2Vvdzlp?=
 =?utf-8?B?Nnh0RjZyTVhhTHlxL2xJbU9SZ0l6TW05c0VXTDlvalB0T2RHN0RtY250TGJD?=
 =?utf-8?B?OUgzYThvcjQ5cndvQjVja0MvS1NNVGNjVFJpYzE1eUFxRHNpUG5qb0pWQXg1?=
 =?utf-8?B?UDBHUlg5b3lVRHBBb2JST2t0M0dKNFZIQ1hiSHB3Rk1FQXo0ei9XbnNLQklz?=
 =?utf-8?B?MzZPZmN3bXVrV2h0WUFQVi9WN3lYbFhLOW1CU2ZWYS9FNlkxTENyQW1ISzQ1?=
 =?utf-8?B?QjNLRU05SDF6WCtwUUhFL0lLLzZxcVFXZFBNNHlaWHZzUGpqN29PRzl2TVhD?=
 =?utf-8?B?aGFrTXJ0NExMNys0TlpzSW9iSDI3NWttanV5NWFNVWUzVnA4Nk0ySFNJcXhJ?=
 =?utf-8?B?N2F0UW13UWhHTG16Q1h4cU9FZ1o1QTh0dC83VVk3U1FzSldHNWY0OXJSUjBR?=
 =?utf-8?B?U1dibGJudjg0Lys0eXIxaGI1cXBaMDFTbFQ4dEZIVlN5bHIwbXM2cVRIUlZP?=
 =?utf-8?B?ZHVOVldwR2NQKzF3UTdhSFF1NzZMcWt3aTdQdXBvWnFudVhJMlI5MlJXbzNM?=
 =?utf-8?B?Rm8ybmIwVFhVL2k5QlBMU3N0SW5vRDA0cTVsV21tRkY1WkUvWmkycjU4aVJp?=
 =?utf-8?Q?KaBYUbpTcNEOA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3588
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	53c2dd83-ee6f-4c5d-fa47-08d8b180247d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6PrpJ2RmOpCahpgEc+HNXxobDI+rv8BgO1JqSkn8Niuj7f94mBuX2tXGSYIinspmqu0HDRV2yUjgTSEM1udiVyO8wrtI/g2g8bML9mIRMqBSZmNH9qnFFfWrmA40yzcECDpVO+qbX+uChLA9Mw2dqiXIo7U7wK11PZfvbD7GtMOC1WRxfscxc5kWm9oVKe4dPgx0z7xx5VJE+hcU+Z68m48QxA6Vun51Tb0iRHCIXMtg/zaKj02zm6L0FxamS8TyXsLaTre+A8AkScDWZBtjEM1ZYarjWdRzRoMPyKXBstOrvIxd8Xz1JrafvZaJ7Odq5BqDtYKjfVP8FRmn/hcil/OEB3hz/nidEJujRTabivw9LfypiLAgbvIO4o78t16ZdP3fTusFl1MPUwownpdpHRIyo66IIZCJyX0dZqBylnk2+rsOFhGghokMySFumiNfzR36MNZvmcRCVO3WMnmBgIMsSb/dXaGiX1CK1fb+z9KT4B65yq5YZGgpCd4ZZpk1snmBIXO8G5gqOwYg/TwTkvE+t8CPXTb9I5pbdtEsezTiiSlUtzM285ikxehMskTp
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(46966006)(86362001)(316002)(186003)(70206006)(82740400003)(70586007)(6506007)(8936002)(110136005)(55016002)(47076005)(478600001)(966005)(52536014)(53546011)(33656002)(8676002)(81166007)(54906003)(9686003)(82310400003)(2906002)(7696005)(356005)(26005)(83380400001)(336012)(4326008)(5660300002)(87944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 13:45:26.6535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e097e3ac-1c36-4e4b-da4d-08d8b1802969
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3574

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQx5pyINeaXpSAxOToxNw0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmcNCj4gQ2M6IEJlcnRyYW5kIE1hcnF1
aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFBlbm55IFpoZW5nDQo+IDxQZW5ueS5aaGVu
Z0Bhcm0uY29tPjsgSmlhbWVpIFhpZSA8SmlhbWVpLlhpZUBhcm0uY29tPjsgbmQNCj4gPG5kQGFy
bS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSB4ZW4vYXJtOiBBZGQgZGVmZW5zaXZl
IGJhcnJpZXIgaW4gZ2V0X2N5Y2xlcyBmb3IgQXJtNjQNCj4gDQo+IEhpIFdlaSwNCj4gDQo+IE9u
IDA1LzAxLzIwMjEgMDc6MTksIFdlaSBDaGVuIHdyb3RlOg0KPiA+IEFzIHRoZSBkaWNzdXNzaW9u
IFsxXSBpbiBtYWlsaW5nIGxpc3QuIFdlJ2QgYmV0dGVyIHRvIGhhdmUNCj4gDQo+IEkgd291bGQg
c2F5ICJQZXIgdGhlIGRpc2N1c3Npb24gWzFdIG9uIHRoZSAuLi4iLiBJIHdvdWxkIGFsc28gc3Vn
Z2VzdCB0bw0KPiByZXBsYWNlIHRoZSAiLiIgd2l0aCAiLCIuDQo+IA0KPiA+IGEgYmFycmllciBh
ZnRlciByZWFkaW5nIENOVFBDVCBpbiBnZXRfY3ljbGVzLiBJZiB0aGVyZSBpcw0KPiA+IG5vdCBh
bnkgYmFycmllciB0aGVyZS4gV2hlbiBnZXRfY3ljbGVzIGJlaW5nIHVzZWQgaW4gc29tZQ0KPiA+
IHNlcWxvY2sgY3JpdGljYWwgY29udGV4dCBpbiB0aGUgZnV0dXJlLCB0aGUgc2VxbG9jayBjYW4g
YmUNCj4gPiBzcGVjdWxhdGVkIHBvdGVudGlhbGx5Lg0KPiANCj4gVGhpcyBjb21tZW50IHNlZW1z
IGEgbGl0dGxlIG9mZiBiZWNhdXNlIHdlIGRvbid0IGhhdmUgc2VxbG9jayBvbiBYZW4uIEkNCj4g
dGhpbmsgaXQgd291bGQgYmUgYmVzdCBpZiB5b3UgcmUtdXNlIHRoZSBMaW51eCBjb21taXQgYXMg
aXQgd291bGQgYmUNCj4gY2xlYXIgdGhhdCB0aGlzIGlzIGEgYmFja3BvcnQuDQo+IA0KPiBTb21l
dGhpbmcgbGlrZToNCj4gDQo+ICJJbXBvcnQgY29tbWl0IC4uLi4gZnJvbSBMaW51eDoNCj4gDQo+
IDxlbnRpcmUgY29tbWl0IG1lc3NhZ2UgaW5kZW50ZWQgYnkgb25lPg0KPiANCj4gV2hpbGUgd2Ug
YXJlIG5vdCBhd2FyZSBvZiBzdWNoIHVzZSBpbiBYZW4sIGl0IHdvdWxkIGJlIGJlc3QgdG8gYWRk
IHRoZQ0KPiBiYXJyaWVyIHRvIGF2b2lkIGFueSBzdXByaXNlLiINCj4gIg0KPiANCg0KWWVzLCB0
aGF0IHdvdWxkIGJlIGJldHRlci4gSSB3aWxsIGFkZCBpdCBpbiBuZXh0IHZlcnNpb24uIFRoYW5r
cy4NCg0KPiA+DQo+ID4gSW4gb3JkZXIgdG8gcmVkdWNlIHRoZSBpbXBhY3Qgb2YgbmV3IGJhcnJp
ZXIsIHdlIHBlcmZlciB0bw0KPiA+IHVzZSBlbmZvcmNlIG9yZGVyIGluc3RlYWQgb2YgSVNCIFsy
XS4NCj4gPg0KPiA+IEN1cnJlbnRseSwgZW5mb3JjZSBvcmRlciBpcyBub3QgYXBwbGllZCB0byBh
cm0zMiBhcyB0aGlzIGlzDQo+ID4gbm90IGRvbmUgaW4gTGludXggYXQgdGhlIGRhdGUgb2YgdGhp
cyBwYXRjaC4gSWYgdGhpcyBpcyBkb25lDQo+ID4gaW4gTGludXggaXQgd2lsbCBuZWVkIHRvIGJl
IGFsc28gZG9uZSBpbiBYZW4uDQo+ID4NCj4gPiBbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDIwLQ0KPiAxMi9tc2cwMDE4MS5odG1sDQo+
ID4gWzJdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIwLzMvMTMvNjQ1DQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHhl
bi9pbmNsdWRlL2FzbS1hcm0vdGltZS5oIHwgNDMNCj4gKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0v
dGltZS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS90aW1lLmgNCj4gPiBpbmRleCA1YzQ1MjllYmI1
Li4zZWY0ZTdjZDNkIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vdGltZS5o
DQo+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS90aW1lLmgNCj4gPiBAQCAtMTEsOSArMTEs
MjYgQEANCj4gPg0KPiA+ICAgdHlwZWRlZiB1aW50NjRfdCBjeWNsZXNfdDsNCj4gPg0KPiA+IC1z
dGF0aWMgaW5saW5lIGN5Y2xlc190IGdldF9jeWNsZXModm9pZCkNCj4gPiArLyoNCj4gPiArICog
RW5zdXJlIHRoYXQgcmVhZHMgb2YgdGhlIGNvdW50ZXIgYXJlIHRyZWF0ZWQgdGhlIHNhbWUgYXMg
bWVtb3J5IHJlYWRzDQo+ID4gKyAqIGZvciB0aGUgcHVycG9zZXMgb2Ygb3JkZXJpbmcgYnkgc3Vi
c2VxdWVudCBtZW1vcnkgYmFycmllcnMuDQo+ID4gKyAqLw0KPiANCj4gVGhlIGNvbW1lbnQgaXMg
YmVmb3JlIHRoZSAjaWZkZWYgd2hpY2ggc3VnZ2VzdHMgdGhlIG9yZGVyaW5nIGlzIHJlcXVpcmVk
DQo+IGZvciBBcm0gYXMgd2VsbC4gSSB3b3VsZCBzdWdnZXN0IHRvIGVpdGhlciBtZW50aW9uIHRo
YXQgb2RkaXR5IG9yIG1vdmUNCj4gdGhlIGNvbW1lbnQgYWZ0ZXIgdGhlICNpZmRlZi4NCj4gDQo+
ID4gKyNpZiBkZWZpbmVkKENPTkZJR19BUk1fNjQpDQo+ID4gKyNkZWZpbmUgcmVhZF9jbnRwY3Rf
ZW5mb3JjZV9vcmRlcmluZyh2YWwpIGRvIHsgXA0KPiA+ICsgICAgdTY0IHRtcCwgX3ZhbCA9ICh2
YWwpOyAgICAgICAgICAgICAgICAgICAgIFwNCj4gDQo+IFBsZWFzZSB1c2UgdWludDY0X3QgaGVy
ZS4NCg0KR290IGl0Lg0KDQo+IA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwNCj4gPiArICAgIGFzbSB2b2xhdGlsZSggICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcDQo+ID4gKyAgICAiZW9yICUwLCAlMSwgJTFcbiIgICAgICAgICAgICAg
ICAgICAgICAgICAgXA0KPiA+ICsgICAgImFkZCAlMCwgc3AsICUwXG4iICAgICAgICAgICAgICAg
ICAgICAgICAgIFwNCj4gPiArICAgICJsZHIgeHpyLCBbJTBdIiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcDQo+ID4gKyAgICA6ICI9ciIgKHRtcCkgOiAiciIgKF92YWwpKTsgICAgICAgICAg
ICAgICAgXA0KPiA+ICt9IHdoaWxlICgwKQ0KPiA+ICsjZWxzZQ0KPiA+ICsjZGVmaW5lIHJlYWRf
Y250cGN0X2VuZm9yY2Vfb3JkZXJpbmcodmFsKSBkbyB7fSB3aGlsZSAoMCkNCj4gPiArI2VuZGlm
DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW5saW5lIGN5Y2xlc190IHJlYWRfY250cGN0X3N0YWJsZSh2
b2lkKQ0KPiA+ICAgew0KPiA+IC0gICAgaXNiKCk7DQo+ID4gICAgICAgLyoNCj4gPiAgICAgICAg
KiBBUk1fV09SS0FST1VORF84NTg5MjE6IENvcnRleC1BNzMgKGFsbCB2ZXJzaW9ucykgY291bnRl
ciByZWFkDQo+ID4gICAgICAgICogY2FuIHJldHVybiBhIHdyb25nIHZhbHVlIHdoZW4gdGhlIGNv
dW50ZXIgY3Jvc3NlcyBhIDMyYml0IGJvdW5kYXJ5Lg0KPiA+IEBAIC0zNiw2ICs1MywyOCBAQCBz
dGF0aWMgaW5saW5lIGN5Y2xlc190IGdldF9jeWNsZXModm9pZCkNCj4gPiAgICAgICB9DQo+ID4g
ICB9DQo+ID4NCj4gPiArc3RhdGljIGlubGluZSBjeWNsZXNfdCBnZXRfY3ljbGVzKHZvaWQpDQo+
ID4gK3sNCj4gPiArICAgIGN5Y2xlc190IGNudDsNCj4gPiArDQo+ID4gKyAgICBpc2IoKTsNCj4g
PiArICAgIGNudCA9IHJlYWRfY250cGN0X3N0YWJsZSgpOw0KPiA+ICsNCj4gPiArICAgIC8qDQo+
ID4gKyAgICAgKiBJZiB0aGVyZSBpcyBub3QgYW55IGJhcnJpZXIgaGVyZS4gV2hlbiBnZXRfY3lj
bGVzIGJlaW5nIHVzZWQgaW4NCj4gPiArICAgICAqIHNvbWUgc2VxbG9jayBjcml0aWNhbCBjb250
ZXh0IGluIHRoZSBmdXR1cmUsIHRoZSBzZXFsb2NrIGNhbiBiZQ0KPiA+ICsgICAgICogc3BlY3Vs
YXRlZCBwb3RlbnRpYWxseS4NCj4gPiArICAgICAqDQo+ID4gKyAgICAgKiBUbyBwcmV2ZW50IHNl
cWxvY2sgZnJvbSBiZWluZyBzcGVjdWxhdGVkIHNpbGVudGx5LCB3ZSBhZGQgYSBiYXJyaWVyDQo+
ID4gKyAgICAgKiBoZXJlIGRlZmVuc2l2ZWx5LiBOb3JtYWxseSwgd2UganVzdCBuZWVkIGFuIElT
QiBoZXJlIGlzIGVub3VnaCwgYnV0DQo+ID4gKyAgICAgKiBjb25zaWRlcmluZyB0aGUgbWluaW11
bSBwZXJmb3JtYW5jZSBjb3N0LiBXZSBwcmVmZXIgdG8gdXNlIGVuZm9yY2UNCj4gPiArICAgICAq
IG9yZGVyIGhlcmUuDQo+ID4gKyAgICAgKi8NCj4gDQo+IFdlIGRvbid0IHVzZSBzZXFsb2NrIGlu
IFhlbiwgc28gdGhpcyBjb21tZW50IGxvb2tzIHF1aXRlIGNvbmZ1c2luZy4uIEkNCj4gdGhpbmsg
dGhlIGNvbW1lbnQgb24gdG9wIG9mIHJlYWNoX2NudHBjdF9lbmZvcmNlX29yZGVyaW5nKCkgaXMN
Cj4gc3VmZmljaWVudCwgc28gSSB3b3VsZCBkcm9wIHRoaXMgb25lLiBUaGUgYWx0ZXJuYXRpdmUg
aXMgdG8gZmluZCBhIHdheQ0KPiB0byBtYWtlIHRoZSBjb21tZW50IG1vcmUgWGVuIGZvY3VzZWQu
DQo+IA0KPiBBbHRob3VnaCwgSSBkb24ndCBoYXZlIGEgZ29vZCBzdWdnZXN0aW9uIHNvIGZhci4N
Cj4gDQoNCk9rLCBJIHdpbGwgZHJvcCBpdC4NCg0KPiA+ICsgICAgcmVhZF9jbnRwY3RfZW5mb3Jj
ZV9vcmRlcmluZyhjbnQpOw0KPiA+ICsNCj4gPiArICAgIHJldHVybiBjbnQ7DQo+ID4gK30NCj4g
PiArDQo+ID4gICAvKiBMaXN0IG9mIHRpbWVyJ3MgSVJRICovDQo+ID4gICBlbnVtIHRpbWVyX3Bw
aQ0KPiA+ICAgew0KPiA+DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwN
Cg==

