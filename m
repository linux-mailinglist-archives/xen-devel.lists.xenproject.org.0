Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A60936624E8
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 12:59:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473567.734250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEqnf-0008Vn-Cd; Mon, 09 Jan 2023 11:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473567.734250; Mon, 09 Jan 2023 11:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEqnf-0008Tx-9s; Mon, 09 Jan 2023 11:58:47 +0000
Received: by outflank-mailman (input) for mailman id 473567;
 Mon, 09 Jan 2023 11:58:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LgaK=5G=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pEqnd-0008Tr-Ct
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 11:58:45 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2042.outbound.protection.outlook.com [40.107.105.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6816b93-9014-11ed-b8d0-410ff93cb8f0;
 Mon, 09 Jan 2023 12:58:43 +0100 (CET)
Received: from FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::19)
 by DU0PR08MB9370.eurprd08.prod.outlook.com (2603:10a6:10:420::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 11:58:37 +0000
Received: from VI1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:15:cafe::6f) by FR0P281CA0014.outlook.office365.com
 (2603:10a6:d10:15::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.11 via Frontend
 Transport; Mon, 9 Jan 2023 11:58:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT055.mail.protection.outlook.com (100.127.144.130) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Mon, 9 Jan 2023 11:58:36 +0000
Received: ("Tessian outbound 6e565e48ed4a:v132");
 Mon, 09 Jan 2023 11:58:35 +0000
Received: from 650a6f315a8d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A68F06F4-1A8C-421B-99BA-F79F4A4991A7.1; 
 Mon, 09 Jan 2023 11:58:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 650a6f315a8d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 09 Jan 2023 11:58:29 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by AS2PR08MB10156.eurprd08.prod.outlook.com (2603:10a6:20b:64e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 11:58:28 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 11:58:28 +0000
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
X-Inumbo-ID: f6816b93-9014-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mso8kklQ8Xtd7MdJcZvsl0oNwRmlZTQARRAzdSnXFls=;
 b=1rj0/wAR5l+cfJlEIFT6tChlNOMi4AO5oKtUMnABlaXblh3Nc+d53Y6zjbKGgWSqiXGE5qVICRd8hU70K2uxOQFHrdvO0TmuuhubBsBeJ+oUWR4c8SY9GCOyJMiDKTVQxGcdGcGUjHHBSfdazhZAsCJ1965HGf2QlFUU05bFHwU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fh6bQe1ISWjVQz5sKuDjU5rYItbpkwoojcdYRAJVp2P5OIukw9CUbzZWy7wIHsaA/Oo/tFxvq9m8eHiKUYRyIIy4PJ4AdRG3jC21ZmNnEk2LYo1V0HG5Cy+So2QMVzoe7RU6JUqQxR6so8+qnYwjZ/x59c6XU3zZZHRWBHSrNvqtJUeS9ohgmrdfo34Q1eLTCqrzPb5zWr1k6k75F3WaYugUJfW8ookD3fXwJlxAQfWXuXSvXNr7P44LZ3jisLi4T2Bq4swmYD9sdVP+t0UsQYpnu4ET3CYShmcqLluOngh+T7jLzrSg+1H+xzHb/YxXE7sKWvCdr4edE6amEEiG3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mso8kklQ8Xtd7MdJcZvsl0oNwRmlZTQARRAzdSnXFls=;
 b=M9by6Y/Xf43w6XylRpIvTLgWIKHiGm4eKszfjPFjra5Ggj3c68jzY+KbXMQN4yDE14cOj6QnVRegjfCGwlRUotC/jfTVr7mzVEYs74Vh8faj67Tfd9F/EntaM9M9JHL0OjWZVtrTCrGD4BDBIUVm4IxYvV9RCNTfHSjKEIdoq30KzHjBtUQSLeVZwwdAs85N0f9Enkz0CNKSmW6fzGxj2gVjLBG8Z2NnX0kvI8so833RL9Wz2zidZI5FziOOUtr99Ta5euFJf7nXKZ7DJq3fG/nR+RxgQFt+Np2NQl/dWfyQ8DyQEa/VJdIxbds7DjSfAQQzh9e9wfvjWhcynAHVsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mso8kklQ8Xtd7MdJcZvsl0oNwRmlZTQARRAzdSnXFls=;
 b=1rj0/wAR5l+cfJlEIFT6tChlNOMi4AO5oKtUMnABlaXblh3Nc+d53Y6zjbKGgWSqiXGE5qVICRd8hU70K2uxOQFHrdvO0TmuuhubBsBeJ+oUWR4c8SY9GCOyJMiDKTVQxGcdGcGUjHHBSfdazhZAsCJ1965HGf2QlFUU05bFHwU=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v1 06/13] xen/arm: assign shared memory to owner when host
 address not provided
Thread-Topic: [PATCH v1 06/13] xen/arm: assign shared memory to owner when
 host address not provided
Thread-Index: AQHY+J1pmmYEajWz5UynKX+c5rdEZK6UzwiAgAEQoXCAAGGAAIAACRWA
Date: Mon, 9 Jan 2023 11:58:28 +0000
Message-ID:
 <AM0PR08MB4530048C87F24524BDE2DCF8F7FE9@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
 <20221115025235.1378931-7-Penny.Zheng@arm.com>
 <d7f12897-c6cc-0895-b70e-53c0b88bd0f9@xen.org>
 <AM0PR08MB453041150588948050F718D4F7FE9@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <6db41bd2-ab71-422a-4235-a9209e984915@xen.org>
In-Reply-To: <6db41bd2-ab71-422a-4235-a9209e984915@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 31865A1BCDB07F428FCE5A5A1FA00D2F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|AS2PR08MB10156:EE_|VI1EUR03FT055:EE_|DU0PR08MB9370:EE_
X-MS-Office365-Filtering-Correlation-Id: 511d1500-78db-43ce-526b-08daf238d6cf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oyzQBFRJWcbgxsly5DSZ3uHhM26NnIL/SVn2l8KPOiKXhn0Bb1IpGyo0w5snISB8EwCMcIU/Z6Dd8C/6wOddNqxOcdsamH6fZMbtb804si+lKpuHFYRL0EwQdUgyiK2h+Ggkd5ewYRaK9rhjjm9WJCD4DBF8nVjQhVtFwBxgh3APW8aVGQ/vPT78HF7YWkD0t7xT/i4upkBAKr4GFhdQKHy4UutLjYzNsi9oGJI+psb32mxYnJG5FoY1dqNzCQLVJv30cYvsy3AA1OMbqQZubcxiT39e7zOf0/yoQ2lOi5N/g/2dGroJ2XFfcGHG0lBBis8LU+PgZqW6pmUJubo607LQGw9Y0kiCIUXPsmIdLTXfpCOaWo/Obv8eQ26MQinn61YmTkwPT9h/6wfLkkb6hCnGcaQqYpuX5tP45KkiG+yjUrxmUP+5En8/xc+ZZVqiAWl7Sxfhpa+nV2qQVtPcAYfA3aKq2MG7Bhzg64TBpESLYRbbP0nhhWPCrUn+oSYPfbU2ayX2c0Rs4cj+9Q2Q3whQttbZu4Wd56SJWFhjl9rFMuVzHPcxx8IDTfLwGUQB4BW/qJNqtXhkXaxP3ytM+ocrud4Bky60LH6oWphXOehm8t+frafMfN6an11ssfcO1POwz/G+2mMJf93SnG+dUC8+E4CLmGjIzBPRu95joiHphEnvrH7EeabWTZlJb1AE28NX+lyCTUzx2QZZW1jECA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199015)(86362001)(54906003)(110136005)(41300700001)(76116006)(66556008)(66946007)(66476007)(66446008)(4326008)(64756008)(8676002)(38100700002)(33656002)(122000001)(38070700005)(26005)(478600001)(7696005)(186003)(71200400001)(53546011)(6506007)(2906002)(5660300002)(8936002)(52536014)(316002)(55016003)(83380400001)(9686003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10156
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ceabb286-bc94-40b5-7b21-08daf238d200
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CA1dfNgqVzTJlC1qQy5OcPAx8W3E6CKQ5/9RoPQiigACLe3YwGCOjJa2udCJ9WMGis3xH8F4FMre2IUtFfrGUTx8PCw31xOCjOLvyQlc5swgjA8G4tBr1V7zcD57TV4fdvNysKupKbRHbPPuUW3KaCyc1iBnRldSbqKn50+XN2JccxKizbR+UF3FNoyp4T6ETC78BG4oEnNWnKbzWz4RR1gIt6TKmUQmuCQHsbZeh/M0BDC4DtHUbSNS2IGAjRbgrsLbE5ceKN32046wyM57yah0zqNrERGU2yhtVZ3eiNlA96KQsMy5vUpb1f4SklP38QDbeWdVL1dRfJwAmwG++UQADerj6VB2sZ+Yt8Ni6LivG+1bPPbDXSlLO2xDnmTN6JVng7WvPH63SG3rB1IkjWa20B6F9pERHRNS7qh+4mO04Evr544qQB0yLD/cvdKNQjC2TiKRywaBA/Wqi3YBj7vNbtmuiAHkLvppNxL22MU6LukdbEkBMcxfXlKTMBvfb8Ewy7GK/t/a+A3JK82CU9lSwJyso93ehG7Ow4qJoNPVSOMFprePlKGy0fbfNcv3IbkkqhJzFa27bxZUroTq4tW4DtuuxhUwaeVLLjpgULhuHydKtwbnxS88x343VjnPhRMkfG/nq4rcJpSo7Jz+GRdQTbSh/hynJhZQUmsvj5pnVZ6K12ZQrms7RDYwE+LinBufUADfpct9z2AWVZo3jw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(36840700001)(46966006)(40470700004)(70586007)(8676002)(4326008)(70206006)(316002)(7696005)(54906003)(110136005)(356005)(2906002)(5660300002)(40460700003)(8936002)(41300700001)(81166007)(47076005)(52536014)(86362001)(36860700001)(83380400001)(53546011)(6506007)(107886003)(33656002)(478600001)(40480700001)(55016003)(336012)(9686003)(186003)(82740400003)(26005)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 11:58:36.0941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 511d1500-78db-43ce-526b-08daf238d6cf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9370

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPg0KPiBTZW50OiBNb25kYXksIEphbnVhcnkgOSwgMjAyMyA2OjU4IFBNDQo+IFRv
OiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZw0KPiBDYzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBTdGVmYW5vIFN0
YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBCZXJ0cmFuZCBNYXJxdWlzIDxC
ZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+Ow0KPiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXly
X0JhYmNodWtAZXBhbS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgMDYvMTNdIHhlbi9h
cm06IGFzc2lnbiBzaGFyZWQgbWVtb3J5IHRvIG93bmVyDQo+IHdoZW4gaG9zdCBhZGRyZXNzIG5v
dCBwcm92aWRlZA0KPiANCj4gDQo+IA0KPiBPbiAwOS8wMS8yMDIzIDA3OjQ5LCBQZW5ueSBaaGVu
ZyB3cm90ZToNCj4gPiBIaSBKdWxpZW4NCj4gDQo+IEhpIFBlbm55LA0KPiANCj4gPiBIYXBweSBu
ZXcgeWVhcn5+fn4NCj4gDQo+IEhhcHB5IG5ldyB5ZWFyIHRvbyENCj4gDQo+ID4+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+DQo+ID4+IFNlbnQ6IFN1bmRheSwgSmFudWFyeSA4LCAyMDIzIDg6NTMgUE0NCj4gPj4gVG86
IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZw0KPiA+PiBDYzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBTdGVm
YW5vIFN0YWJlbGxpbmkNCj4gPj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBCZXJ0cmFuZCBN
YXJxdWlzDQo+ID4+IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBWb2xvZHlteXIgQmFiY2h1
aw0KPiA+PiA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjEgMDYvMTNdIHhlbi9hcm06IGFzc2lnbiBzaGFyZWQgbWVtb3J5IHRvIG93bmVyDQo+
ID4+IHdoZW4gaG9zdCBhZGRyZXNzIG5vdCBwcm92aWRlZA0KPiA+Pg0KPiA+PiBIaSwNCj4gPj4N
Cj4gPg0KPiA+IEEgZmV3IGNvbmNlcm5zIGV4cGxhaW5lZCB3aHkgSSBkaWRuJ3QgY2hvb3NlICJz
dHJ1Y3QgbWVtaW5mbyIgb3ZlciB0d28NCj4gPiBwb2ludGVycyAic3RydWN0IG1lbWJhbmsqIiBh
bmQgInN0cnVjdCBtZW1pbmZvKiIuDQo+ID4gMSkgbWVtb3J5IHVzYWdlIGlzIHRoZSBtYWluIHJl
YXNvbi4NCj4gPiBJZiB3ZSB1c2UgInN0cnVjdCBtZW1pbmZvIiBvdmVyIHRoZSBjdXJyZW50ICJz
dHJ1Y3QgbWVtYmFuayoiIGFuZA0KPiA+ICJzdHJ1Y3QgbWVtaW5mbyoiLCAic3RydWN0IHNobV9t
ZW1pbmZvIiB3aWxsIGJlY29tZSBhIGFycmF5IG9mIDI1Ng0KPiA+ICJzdHJ1Y3Qgc2htX21lbWJh
bmsiLCB3aXRoICJzdHJ1Y3Qgc2htX21lbWJhbmsiIGJlaW5nIGFsc28gYW4gMjU2LQ0KPiBpdGVt
DQo+ID4gYXJyYXksIHRoYXQgaXMgMjU2ICogMjU2LCB0b28gYmlnIGZvciBhIHN0cnVjdHVyZSBh
bmQgSWYgSSByZW1lbWJlcmVkIGNsZWFybHksDQo+IGl0IHdpbGwgbGVhZCB0byAibW9yZSB0aGFu
IFBBR0VfU0laRSIgY29tcGlsaW5nIGVycm9yLg0KPiANCj4gSSBhbSBub3QgYXdhcmUgb2YgYW55
IHBsYWNlIHdoZXJlIHdlIHdvdWxkIHJlc3RyaWN0IHRoZSBzaXplIG9mIGtpbmZvIGluDQo+IHVw
c3RyZWFtLiBDYW4geW91IGdpdmUgbWUgYSBwb2ludGVyPw0KPiANCg0KSWYgSSByZW1lbWJlcmVk
IGNvcnJlY3RseSwgbXkgZmlyc3QgdmVyc2lvbiBvZiAic3RydWN0IHNobV9tZW1pbmZvIiBpcyB0
aGlzDQoiYmlnIigyNTYgKiAyNTYpIHN0cnVjdHVyZSwgYW5kIGl0IGxlYWRzIHRvIHRoZSB3aG9s
ZSB4ZW4gYmluYXJ5IGlzIGJpZ2dlciB0aGFuIDJNQi4gO1wNCg0KPiA+IEZXSVQsIGVpdGhlciBy
ZXdvcmtpbmcgbWVtaW5mbyBvciB1c2luZyBhIGRpZmZlcmVudCBzdHJ1Y3R1cmUsIGFyZQ0KPiA+
IGJvdGggbGVhZGluZyB0byBzaXppbmcgZG93biB0aGUgYXJyYXksIGhtbW0sIEkgZG9uJ3Qga25v
dyB3aGljaCBzaXplDQo+ID4gaXMgc3VpdGFibGUuIFRoYXQncyB3aHkgSSBwcmVmZXIgcG9pbnRl
ciBhbmQgZHluYW1pYyBhbGxvY2F0aW9uLg0KPiANCj4gSSB3b3VsZCBleHBlY3QgdGhhdCBpbiBt
b3N0IGNhc2VzLCB5b3Ugd2lsbCBuZWVkIG9ubHkgb25lIGJhbmsgd2hlbiB0aGUgaG9zdA0KPiBh
ZGRyZXNzIGlzIG5vdCBwcm92aWRlZC4gU28gSSB0aGluayB0aGlzIGlzIGEgYml0IG9kZCB0byBt
ZSB0byBpbXBvc2UgYSAibGFyZ2UiDQo+IGFsbG9jYXRpb24gZm9yIHRoZW0uDQo+IA0KDQpPbmx5
IGlmIHVzZXIgaXMgbm90IGRlZmluaW5nIHNpemUgYXMgc29tZXRoaW5nIGxpa2UgKDJeYSArIDJe
YiArIDJeYyArIC4uLikuIDtcDQpTbyBtYXliZSA4IG9yIDE2IGlzIGVub3VnaD8NCnN0cnVjdCBu
ZXdfbWVtaW5mbyB7DQogICAgdW5zaWduZWQgaW50IG5yX2JhbmtzOw0KICAgIHN0cnVjdCBtZW1i
YW5rIGJhbmtbOF07DQp9Ow0KDQpDb3JyZWN0IG1lIGlmIEknbSB3cm9uZzoNClRoZSAic3RydWN0
IHNobV9tZW1iYW5rIiB5b3UgYXJlIHN1Z2dlc3RpbmcgaXMgbG9va2luZyBsaWtlIHRoaXMsIHJp
Z2h0Pw0Kc3RydWN0IHNobV9tZW1iYW5rIHsNCiAgICBjaGFyIHNobV9pZFtNQVhfU0hNX0lEX0xF
TkdUSF07DQogICAgdW5zaWduZWQgaW50IG5yX3NobV9ib3Jyb3dlcnM7DQogICAgc3RydWN0IG5l
d19tZW1pbmZvIHNobV9iYW5rczsNCiAgICB1bnNpZ25lZCBsb25nIHRvdGFsX3NpemU7DQp9Ow0K
TGV0IG1lIHRyeX4NCg0KPiA+IDIpIElmIHdlIHVzZSAic3RydWN0IG1lbWluZm8qIiBvdmVyIHRo
ZSBjdXJyZW50ICJzdHJ1Y3QgbWVtYmFuayoiIGFuZA0KPiA+ICJzdHJ1Y3QgbWVtaW5mbyoiLCB3
ZSB3aWxsIG5lZWQgYSBuZXcgZmxhZyB0byBkaWZmZXJlbnRpYXRlIHR3bw0KPiA+IHNjZW5hcmlv
cyhob3N0IGFkZHJlc3MgcHJvdmlkZWQgb3Igbm90KSwgQXMgdGhlIHNwZWNpYWwgY2FzZSAic3Ry
dWN0DQo+IG1lbWJhbmsqIiBpcyBhbHJlYWR5IGhlbHBpbmcgdXMgZGlmZmVyZW50aWF0ZS4NCj4g
PiBBbmQgc2luY2Ugd2hlbiBob3N0IGFkZHJlc3MgaXMgcHJvdmlkZWQsIHRoZSByZWxhdGVkICJz
dHJ1Y3QgbWVtYmFuayINCj4gPiBhbHNvIG5lZWRzIHRvIGJlIHJlc2VydmVkIGluICJib290aW5m
by5yZXNlcnZlZF9tZW0iLiBUaGF0J3Mgd2h5IEkNCj4gPiB1c2VkIHBvaW50ZXIgIiBzdHJ1Y3Qg
bWVtYmFuayoiIHRvIGF2b2lkIG1lbW9yeSB3YXN0ZS4NCj4gDQo+IEkgYW0gY29uZnVzZWQuLi4g
VG9kYXkgeW91IGFyZSBkZWZpbmluZyBhczoNCj4gDQo+IHN0cnVjdCB7DQo+ICAgICAgc3RydWN0
IG1lbWJhbmsgKjsNCj4gICAgICBzdHJ1Y3Qgew0KPiAgICAgICAgIHN0cnVjdCBtZW1pbmZvICo7
DQo+ICAgICAgICAgdW5zaWduZWQgbG9uZyB0b3RhbF9zaXplOw0KPiAgICAgIH0NCj4gfQ0KPiAN
Cj4gU28gb24gYXJtNjQgaG9zdCwgeW91IHdvdWxkIHVzZSAyNCBieXRlcy4gSWYgd2Ugd2VyZSB1
c2luZyBhbiB1bmlvbiBpbnN0ZWFkLg0KPiBXZSB3b3VsZCB1c2UgMTYgYnl0ZXMuIEFkZGluZyBh
IDMyLWJpdCBmaWVsZHMsIHdvdWxkIGJyaW5nIHRvDQo+IDIwIGJ5dGVzIChhc3N1bWluZyB3ZSBj
YW4gcmUtdXNlIGEgcGFkZGluZykuDQo+IA0KPiBUaGVyZWZvcmUsIHRoZXJlIGlzIG5vIG1lbW9y
eSB3YXN0ZSBoZXJlIHdpdGggYSBmbGFnLi4uDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBK
dWxpZW4gR3JhbGwNCg==

