Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CED24ED439
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 08:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296681.505076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZohL-0005vd-HU; Thu, 31 Mar 2022 06:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296681.505076; Thu, 31 Mar 2022 06:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZohL-0005sf-Dd; Thu, 31 Mar 2022 06:54:23 +0000
Received: by outflank-mailman (input) for mailman id 296681;
 Thu, 31 Mar 2022 06:54:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yrn=UK=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nZohJ-0005sX-JJ
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 06:54:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c9dda3f-b0bf-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 08:54:16 +0200 (CEST)
Received: from DB7PR05CA0001.eurprd05.prod.outlook.com (2603:10a6:10:36::14)
 by DBBPR08MB5546.eurprd08.prod.outlook.com (2603:10a6:10:c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Thu, 31 Mar
 2022 06:54:05 +0000
Received: from DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::2f) by DB7PR05CA0001.outlook.office365.com
 (2603:10a6:10:36::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.28 via Frontend
 Transport; Thu, 31 Mar 2022 06:54:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT039.mail.protection.outlook.com (10.152.21.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19 via Frontend Transport; Thu, 31 Mar 2022 06:54:04 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Thu, 31 Mar 2022 06:54:04 +0000
Received: from 44494e867adb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 610892D9-2D03-41E8-B291-A36F7F774343.1; 
 Thu, 31 Mar 2022 06:53:55 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 44494e867adb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 31 Mar 2022 06:53:55 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by DB9PR08MB6620.eurprd08.prod.outlook.com (2603:10a6:10:256::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Thu, 31 Mar
 2022 06:53:50 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::28c0:3e8d:dd75:80be]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::28c0:3e8d:dd75:80be%8]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 06:53:50 +0000
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
X-Inumbo-ID: 5c9dda3f-b0bf-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4ZkCxr2WQEwf+40Jam3tGGGoq7rkDWV89deoVcU61w=;
 b=53hPUN64Bf3LWxCkLbp8ukdORf+E9u287CvRZTEErgpyYrhTfziQlNN5iUqA7JwxXCxavC7SM2/XOmQLBmgCGZmTbCBeoBdRztkj06NV+rwVz7Rx2LU92GXFtq0hOZPYJHGCfvJyxSylFKH9H9YttZkhWXCYG7D2ZAuBG0G87nA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCkxOyCZDq+wvjFN2ykvEFiJaWoPqmQ5PIh2jBLXJjagCU5xojoJP3EuNA6I7mYAKWJh54yM0UvrWsvlj1/cIwyVDG9WjE2dGec7mELi9vbed9M1aTh1PkP+ng4ZNzf9aHxsplGA5+GEJbpozIeAQHtbXlNh7tUZKTACje1p/HkQudRtPFRAMXi4Vys+/P2Xj41dfTy5yzJiL+b4sKyL34IW4a0gNhnN7UzCljsV19vW+gq//kplXlM6BBteFMAE7xG2R14SWg4GOmfm+7Qh2QIN9L/G/RhsjOA02a1rc7KP2/WyIev8AiuktAcUwxuovgVbTTPlDJ5hpaEm4gCE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4ZkCxr2WQEwf+40Jam3tGGGoq7rkDWV89deoVcU61w=;
 b=h3y1lSfOolkDJ7iu3hSziYhya+PM+KVqUIlPFtf7pwIgDsetS8uuaYvqcy3bElpY84xUUiFfK+t5bekG8NzC/Ux1RlAOO7PYgNVc/5WU8PO5SNIFwbxoni34LgA7wVxpBUM2HMjnM1AOQ/MT/K/RqUdczqqC1sGPsghePhZ3KH0qdJcQ2RPypmLKWDOACcDonmQdzceFAqiLZgnv1zacfSAXS40738lFIeBECJxmw24vV+RTninnoLrhu1nR7SGlrDe7kIVz6C8mpVSAejlHH/LHN+33jzYCyG137hYR7FB/eYCiwb6gscQJnppBeiOHUK3hZX460IY0zzcNavJ2YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4ZkCxr2WQEwf+40Jam3tGGGoq7rkDWV89deoVcU61w=;
 b=53hPUN64Bf3LWxCkLbp8ukdORf+E9u287CvRZTEErgpyYrhTfziQlNN5iUqA7JwxXCxavC7SM2/XOmQLBmgCGZmTbCBeoBdRztkj06NV+rwVz7Rx2LU92GXFtq0hOZPYJHGCfvJyxSylFKH9H9YttZkhWXCYG7D2ZAuBG0G87nA=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1 4/5] xen/arm: retrieve reserved pages on
 populate_physmap
Thread-Topic: [PATCH v1 4/5] xen/arm: retrieve reserved pages on
 populate_physmap
Thread-Index: AQHYRBoGZuHI/fR8D0STTT8Q5XO5razXsUIAgAFYdpA=
Date: Thu, 31 Mar 2022 06:53:50 +0000
Message-ID:
 <DU2PR08MB73250905788FB3E6D9502962F7E19@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220330093617.3870589-1-Penny.Zheng@arm.com>
 <20220330093617.3870589-5-Penny.Zheng@arm.com>
 <570e0ca9-c07a-0fca-d146-82d655c792e6@suse.com>
In-Reply-To: <570e0ca9-c07a-0fca-d146-82d655c792e6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4C42B63A9067644E83361D52FD471B1C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d58069a3-810e-4ebd-4055-08da12e33ecc
x-ms-traffictypediagnostic:
	DB9PR08MB6620:EE_|DB5EUR03FT039:EE_|DBBPR08MB5546:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB5546DF914CF30E5795DF3A57F7E19@DBBPR08MB5546.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lZXHdUIpwFFDcRSCjCz5xM7rAxCBb/V1AJ5AW9KvKuoAnYEh80oumsrd3k5ddZ/oLhEc1X7MFPmZmA8rQgvtYlBA5rOEiG5AlB3fXkHt+ikhPLEHLABcw6JQZVgfViTtvYPPvnSx/Byq0vuHowlafp9gX4TqbuNHznrnclpkdfBWeiK55CCNbG0MLF+9IiRUy3c1aUzOdT5wfi4kRgkutQDRWO1C+FtTGTdPT4AlxdCRQZAEYHbFZKFvkEWMpcg29CWjOK3dtaF3SfKobcwBc0fZc61KomQoO9gu3lSwKiaVCFPqGPIjM0SCzxAbtJDHn9C+uGacEIHNi00djgg3qJU95igAcYHDHnNH+WGrK3Bv414nVwcLMrnZT6d/LMNpybC+QXZJ2tlWaCmBFJutT+pEKsMf1U/qADT4ZAzskS+EaxtSSEAvpwJnGsre1/5JWZhnqOHtxhaA8x/rMUo/MXY+hahX7vSUNOX+TqMhcOMlKwrufO/TupjZEs0zuDfrfF6r4/byyZkDWbCGI8y2qsognryniANzeHx1GHyzb8o5fkPtuOBhQFUTwsxfotw8vpxSRwhenb3AWlUHRdf8dQa3CcDZADIpqagJTcso1VYamphoDppr3C4GXcQg0gMlRrshSLGzIhzHsIbr7InIt4hxTDtBHEsGgKRPaxq7wGjg76dB2HTPA0OfcpD47ovn8Gt7Wll5xHoGRtD0BXeAdQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(55016003)(4326008)(71200400001)(508600001)(8676002)(66446008)(186003)(66556008)(66476007)(316002)(64756008)(66946007)(54906003)(76116006)(26005)(52536014)(2906002)(7696005)(8936002)(6506007)(6916009)(86362001)(38070700005)(38100700002)(5660300002)(53546011)(9686003)(122000001)(33656002)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6620
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	92341cd0-c100-41e8-bae9-08da12e33631
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BWa3tJfXFtmVEkT2jyV9QZFIn3//Ti1BOAfQ/yc4KvQc9XutrF3tlnlWYi7RHFNy0IqpDLWQFQHcjWrLBWf1f5AHQwYoLDGdDGL1qN9fjwYWkYm2AR6Lxc2cUtWyrvbalBr5eSRGpR57M1Q7XbpPu1NB5V6+zCcenId168Q03lg/lEjoyv0pjZD9Loq6RWoSvbaWcoqnh9iYknk3g2APe64XJJQv6UWWsyMoSPhccvTjqMEJJVQSr75tLPLge13wOfhhp1Z5PMf+Pau2bPJV7wV1INVFPFQy5kMId8tDXGcbvry/2ROAO625ic76edldXLnAJiEQoDscRRh2UDe0tvZudIWLgsn+xK+ohVUlez3ptxZk/07U2cwNbqq8rE+7xeh/V5xfe39dkCb82vEhyX0vzlpTcVx34hk0JsJxNN4HZTHs3KA0hUfHUt7+vCZPLbRvyzKXQIy0UzGQGN2gRhyGZOOHA7bkYuV4Z99S3b+yCDhAuzhkV1f9e2JcSU2/iGF4nGSDdBxRgGOqZA8BZkynPaGbavMikN0bLUAMIrIw4GJcyWvqfCR9cPhFK9fQWmBAT1sGOipB2zCEbzsb2h503rnENg3djif55YUNRoEiVxB+BPkUwanmh94t5idRZp/cKHRedMCYtnB0lXEOQQoYBTpMkH+tW37zeqsQedGrsx9HMVGSXmfkfBupKfpT
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(316002)(356005)(54906003)(86362001)(53546011)(55016003)(70206006)(6862004)(70586007)(4326008)(81166007)(82310400004)(9686003)(8676002)(7696005)(6506007)(40460700003)(33656002)(47076005)(83380400001)(508600001)(36860700001)(8936002)(336012)(26005)(186003)(52536014)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 06:54:04.6639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d58069a3-810e-4ebd-4055-08da12e33ecc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5546

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1hcmNoIDMwLCAyMDIy
IDU6NTkgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPiBDYzog
V2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5j
b20+Ow0KPiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgR2Vvcmdl
IER1bmxhcA0KPiA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgNC81XSB4ZW4vYXJtOiByZXRyaWV2ZSByZXNl
cnZlZCBwYWdlcyBvbg0KPiBwb3B1bGF0ZV9waHlzbWFwDQo+IA0KPiBPbiAzMC4wMy4yMDIyIDEx
OjM2LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiAtLS0gYS94ZW4vY29tbW9uL21lbW9yeS5jDQo+
ID4gKysrIGIveGVuL2NvbW1vbi9tZW1vcnkuYw0KPiA+IEBAIC0yNDksNiArMjQ5LDI2IEBAIHN0
YXRpYyB2b2lkIHBvcHVsYXRlX3BoeXNtYXAoc3RydWN0IG1lbW9wX2FyZ3MNCj4gKmEpDQo+ID4N
Cj4gPiAgICAgICAgICAgICAgICAgIG1mbiA9IF9tZm4oZ3Bmbik7DQo+ID4gICAgICAgICAgICAg
IH0NCj4gPiArI2lmZGVmIENPTkZJR19TVEFUSUNfTUVNT1JZDQo+ID4gKyAgICAgICAgICAgIGVs
c2UgaWYgKCBpc19kb21haW5fb25fc3RhdGljX2FsbG9jYXRpb24oZCkgKQ0KPiA+ICsgICAgICAg
ICAgICB7DQo+ID4gKyAgICAgICAgICAgICAgICBmb3IgKCBqID0gMDsgaiA8ICgxVSA8PCBhLT5l
eHRlbnRfb3JkZXIpOyBqKysgKQ0KPiA+ICsgICAgICAgICAgICAgICAgew0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgIHBhZ2UgPSBwYWdlX2xpc3RfcmVtb3ZlX2hlYWQoJmQtPnJlc3ZfcGFnZV9s
aXN0KTsNCj4gDQo+IEhvdyBkbyB5b3UgZ3VhcmFudGVlIHRoZSBwYWdlcyBhcmUgY29udGlndW91
cywgYXMgcmVxdWlyZWQgYnkgYSBub24temVybw0KPiBhLT5leHRlbnRfb3JkZXI/IERpZCB5b3Ug
cGVyaGFwcyBtZWFuIHRvIGZvcmJpZCBub24temVyby1vcmRlciByZXF1ZXN0cw0KPiBpbiB0aGlz
IGNvbmZpZ3VyYXRpb24/LA0KDQpUcnVlLCB0cnVlLCB0aGFua3MgZm9yIHBvaW50aW5nIHRoYXQg
b3V0Lg0KSSB3b3VsZCBub3QgaW50ZW5kIHRvIGFkZCBjb21wbGV4IGFsZ29yaXRobSBoZXJlIHRv
IGZpbmQgY29udGlndW91cyBwYWdlcyBvZiByZXF1ZXN0ZWQNCm9yZGVyLCBmb3JiaWRkaW5nIG5v
bi16ZXJvLW9yZGVyIHdpdGggZXJyb3IgbWVzc2FnZSBzaGFsbCBiZSBhZGRlZCBoZXJlLg0KDQo+
IA0KPiA+ICsgICAgICAgICAgICAgICAgICAgIGlmICggdW5saWtlbHkoIXBhZ2UpICkNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIGdkcHJp
bnRrKFhFTkxPR19JTkZPLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
Q291bGQgbm90IGFsbG9jYXRlIGd1ZXN0IHBhZ2UgbnVtYmVyICVseFxuIiwNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2ZuX3goX2dmbihncGZuKSkpOw0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsNCj4gDQo+IEFuZCBlYXJsaWVyIGFsbG9jYXRl
ZCBwYWdlcyBhcmUgc2ltcGx5IGxvc3QgLyBsZWFrZWQ/DQo+IA0KDQpUaGF0IHdhcyB1bmNvbnNp
ZGVyZWQsIHRoYW5rcyBmb3IgcG9pbnRpbmcgdGhhdCBvdXQuDQpTaW5jZSBub3cgd2UgYXJlIGZv
cmJpZGRpbmcgbm9uLXplcm8tb3JkZXIgcmVxdWVzdHMsIGVhcmxpZXIgYWxsb2NhdGVkIHBhZ2Vz
IHNoYWxsDQpub3QgbmVlZCB0byBiZSBjb25zaWRlcmVkLg0KIA0KPiBKYW4NCg0K

