Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 911AB67FCE2
	for <lists+xen-devel@lfdr.de>; Sun, 29 Jan 2023 06:39:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486246.753663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pM0PR-0000gD-GM; Sun, 29 Jan 2023 05:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486246.753663; Sun, 29 Jan 2023 05:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pM0PR-0000d7-CI; Sun, 29 Jan 2023 05:39:21 +0000
Received: by outflank-mailman (input) for mailman id 486246;
 Sun, 29 Jan 2023 05:39:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hFYh=52=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pM0PQ-0000d1-1l
 for xen-devel@lists.xenproject.org; Sun, 29 Jan 2023 05:39:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4544d95d-9f97-11ed-b8d1-410ff93cb8f0;
 Sun, 29 Jan 2023 06:39:17 +0100 (CET)
Received: from DU2PR04CA0194.eurprd04.prod.outlook.com (2603:10a6:10:28d::19)
 by GV1PR08MB7778.eurprd08.prod.outlook.com (2603:10a6:150:56::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.25; Sun, 29 Jan
 2023 05:39:13 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::d7) by DU2PR04CA0194.outlook.office365.com
 (2603:10a6:10:28d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33 via Frontend
 Transport; Sun, 29 Jan 2023 05:39:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.30 via Frontend Transport; Sun, 29 Jan 2023 05:39:12 +0000
Received: ("Tessian outbound 43b0faad5a68:v132");
 Sun, 29 Jan 2023 05:39:11 +0000
Received: from 6d33aa5ad35e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0D9A5BE2-A010-446A-BEED-E06D20D6A0FE.1; 
 Sun, 29 Jan 2023 05:39:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6d33aa5ad35e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sun, 29 Jan 2023 05:39:05 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by DB9PR08MB7627.eurprd08.prod.outlook.com (2603:10a6:10:30b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Sun, 29 Jan
 2023 05:39:02 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab%3]) with mapi id 15.20.6043.030; Sun, 29 Jan 2023
 05:39:02 +0000
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
X-Inumbo-ID: 4544d95d-9f97-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OcMZ91hUBqDTO5GgFqXDvrwtpeYKr7DWVKaUqUqvkE=;
 b=E+1EHupc7d/IAqyCYYamF7ttmNN1lZNd6nt6e7+4zbQ9j4kO7KcHKQ/+ZB43D1XWDP+1FyiywDMsifFrQImzLf9diY9NxS6eiyfd4fpe4SEUmiwYnjyjtHnANhnOoszJPOAH7RwRt1VMDjuBf5MCF58pQYrX46N8rW7oFXPZ8/A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUon5c2cAQIbJKtl/QuNHdbjObS1mpCbO7n1iD2A95VMHqjRhthJDk9gn/y4tw+99i7YG5BzIazUnNImXwO2KzQeaJmw0iDg+qXbUMAS1lFLQTswHumxFaR2pz/guM6QEX3A/LPzhK8tK2dU+aGW/v8rif4VSe3KifCfG/hz29t6LsPKLpECy4Or5ph8PISl5zdJlo1kYkBQ9k6Y8jIghCmEHASHiU3x2vuiCQ2XYfPpmU63DXOxI9m85rqHY1bgqTUCpIuy9xovbWMcX+erSfJucD8hDg9i7LwPxIBn6nXJQYDn4NkQEA8N6GlRK28XVKQcj4JUd0wwoANCrfbnMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OcMZ91hUBqDTO5GgFqXDvrwtpeYKr7DWVKaUqUqvkE=;
 b=NFbudj2eVOXvaKUrDHZLCFoCZijCnpb2ZL+F7PNA4HgtLa2di6OqaiTf8gvPpZLlcWIUy346LpL2kLywDLDek6plxG+ayI/lyQDKgnr5G0m/CFV3Qj2B8/KixX1XUKApASvhFO8bdVLBXAvc3QcgBEdzCaxusKhOGVO7Sq/LDrbuxweq20MOTB/y1MyNTBD+Zdby2ldAVr4vjd8ueweGIAMiU3A7T0ejWwNWE9qtFP+ExknQrMpv1R11+0dWhDXBn0tT+VOzFVzcFwTZwgWR2pnwxdt78SLzZKA+YjsT5qbYb8NHL6naBcbgoS119Ak1HbEDHdbVMBahiVN8eO8XBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OcMZ91hUBqDTO5GgFqXDvrwtpeYKr7DWVKaUqUqvkE=;
 b=E+1EHupc7d/IAqyCYYamF7ttmNN1lZNd6nt6e7+4zbQ9j4kO7KcHKQ/+ZB43D1XWDP+1FyiywDMsifFrQImzLf9diY9NxS6eiyfd4fpe4SEUmiwYnjyjtHnANhnOoszJPOAH7RwRt1VMDjuBf5MCF58pQYrX46N8rW7oFXPZ8/A=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 11/40] xen/mpu: build up start-of-day Xen MPU memory
 region map
Thread-Topic: [PATCH v2 11/40] xen/mpu: build up start-of-day Xen MPU memory
 region map
Thread-Index: AQHZJxAhTWb1zeTHm029bSgcZo/2Yq6l4H6AgA7nVJA=
Date: Sun, 29 Jan 2023 05:39:02 +0000
Message-ID:
 <AM0PR08MB453083B74DB1D00BDF469331F7D29@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-12-Penny.Zheng@arm.com>
 <c30b4458-b5f6-f996-0c3c-220b18bfb356@xen.org>
In-Reply-To: <c30b4458-b5f6-f996-0c3c-220b18bfb356@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 109BBDD9E31E1B4DAF02D6B564F5F2E0.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|DB9PR08MB7627:EE_|DBAEUR03FT028:EE_|GV1PR08MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: 73cbe5c9-5115-467e-41ea-08db01bb268d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +Q99jpXKqXvPTxQb1zxw//oYXofHsJDuHuxNCmtANi5EdqbSPw84/+pE7nYlZCulwIYVBYylFCq3baufkAXd+Ke1YSP5RCwMmtnfClueQHF1j33LJ1aOesWg2RRubD7tRDpgLQ2Q8dWCfwkuEeU0zn80id9wZXWqGIsNREF0dD391s/e1ynFf3YalOQ80chAF8vG9YeKysasdiHYuwR9Y83wTRomcLB+2pnfaFSuYhfjGLwNa7p1vsD35Qcp19EHbAD+veVhBIWWOAlboCBB0T5rQfea5El2a+r1VjT0M/OB/rErQiV3zjo7FbTCJrUjZ6lSGM9MMePM3w3J+5HEH51qb1wpVYUVhVK34Kot0IagTuWmjST4Bk+FJynT0Gwcgqo5xslPXUnnOowhwsUQJnC7TtUSiKOI9Bwf64qCci18LtTIKLTAoNKhpYiSKFpw5g3rbf7NJYNyINYjqk5pSC/jTD1CVy0h2qgJPLI+yyEey+Ocb8jmjSi1gRPSLjXaJC2smsmrmPXO2l0VHt58H/k+4Fx0A0kZWrEMFnl2403n2RHq/aEa3dQxmCs+fMx4/TbcJtrBqMc0EiGZx6vcHR8VbnzTgb5MzW7opuaah23rxNljq3v8EFvFL+X7WAO3Ej8vdm+cwiYUOpF0e0rM4ZQARyAHYAgoY3Bk7Knhhbkl0zIzJGYfBv1poHJqxUgckJeCfbUNzOcrCTkWS2s2Pw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199018)(478600001)(38100700002)(4326008)(64756008)(66556008)(66946007)(66476007)(6506007)(66446008)(83380400001)(76116006)(54906003)(110136005)(8676002)(316002)(122000001)(7696005)(186003)(9686003)(26005)(53546011)(33656002)(5660300002)(55016003)(52536014)(41300700001)(38070700005)(86362001)(71200400001)(8936002)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7627
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9695860d-9cb2-4cd6-0273-08db01bb20c5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y4ZSgHGcZ2k1frR58iwqBQklL/dBovENkAjC2vAyh52Cah/zaAWFHVRSnPJiGKdarsBfs2/VyuPA6UodYox4XYnV5xGIzX8fSoDwURKmO334oKSMpHjHXXQYwxpS10J62gSDzijqmOmUqkA33LhcD8kPDr+5AYRIfkqnLQbhIiXQPM7RYTQc8ftlrC4ztJQVW/6nP2IXSQheb7q+jMDIOQvOPV9iskeV91gJUdaKpDgIxJmpwW8UEvlQya40liQvBlrInWwqNLvP32bpQelr0bCWyUnpcDuMv1X+FukHDgpcqU9154CzrGivnMF8DAR6EglEiLwPL9jz93FPlpU3yWc8MUP2fcOi+jRTIoP6kLsTpbOIrRhRAQKXPj8HKYF49igx6giSFnfhrXcgUlV59V+pmuP5Ab9tEkqJtKPaYyrJFqAv2k49KDtR9chCxAvT572ugQ9+e8flKrSncQyKN4fg6cImNm4ZD90hpzEiVgTE/xSeYlf8SRiCUIkZIR9ExuD9oRxXn4ppO6gnKAdbBeo9HkM7lPyr3iOrxaE4nUiCsXnmgEdYqZlDJDESHx7HAWQjL/QzNOyakmuHaY9j3K9XsjBjrD/yQn530966hcmtbbq/M6Gnited+Ux9rw6sqeMMk/4X5uRU2l9P8X685PKNnWKVMSc9M4g/w6Y+9ZQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199018)(46966006)(36840700001)(8936002)(336012)(70206006)(70586007)(47076005)(7696005)(8676002)(4326008)(53546011)(9686003)(26005)(186003)(33656002)(2906002)(82310400005)(86362001)(54906003)(36860700001)(52536014)(41300700001)(83380400001)(55016003)(478600001)(110136005)(316002)(6506007)(107886003)(81166007)(40480700001)(82740400003)(5660300002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2023 05:39:12.0360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73cbe5c9-5115-467e-41ea-08db01bb268d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7778

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgSmFudWFyeSAxOSwgMjAyMyAxMTowNCBQTQ0K
PiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgU3RlZmFu
byBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQgTWFycXVp
cyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsNCj4gVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9k
eW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDExLzQwXSB4
ZW4vbXB1OiBidWlsZCB1cCBzdGFydC1vZi1kYXkgWGVuIE1QVQ0KPiBtZW1vcnkgcmVnaW9uIG1h
cA0KPiANCj4gSGkgUGVubnksDQo+DQoNCkhpIEp1bGllbg0KDQpTb3JyeSBmb3IgdGhlIGxhdGUg
cmVzcG9uc2UsIGp1c3QgY29tZSBiYWNrIGZyb20gQ2hpbmVzZSBTcHJpbmcgRmVzdGl2YWwgSG9s
aWRheX4NCiANCj4gT24gMTMvMDEvMjAyMyAwNToyOCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4g
RnJvbTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+ID4NCj4gPiBUaGUgc3Rh
cnQtb2YtZGF5IFhlbiBNUFUgbWVtb3J5IHJlZ2lvbiBsYXlvdXQgc2hhbGwgYmUgbGlrZSBhcyBm
b2xsb3dzOg0KPiA+DQo+ID4geGVuX21wdW1hcFswXSA6IFhlbiB0ZXh0DQo+ID4geGVuX21wdW1h
cFsxXSA6IFhlbiByZWFkLW9ubHkgZGF0YQ0KPiA+IHhlbl9tcHVtYXBbMl0gOiBYZW4gcmVhZC1v
bmx5IGFmdGVyIGluaXQgZGF0YSB4ZW5fbXB1bWFwWzNdIDogWGVuDQo+ID4gcmVhZC13cml0ZSBk
YXRhIHhlbl9tcHVtYXBbNF0gOiBYZW4gQlNTIC4uLi4uLg0KPiA+IHhlbl9tcHVtYXBbbWF4X3hl
bl9tcHVtYXAgLSAyXTogWGVuIGluaXQgZGF0YQ0KPiA+IHhlbl9tcHVtYXBbbWF4X3hlbl9tcHVt
YXAgLSAxXTogWGVuIGluaXQgdGV4dA0KPiANCj4gQ2FuIHlvdSBleHBsYWluIHdoeSB0aGUgaW5p
dCByZWdpb24gc2hvdWxkIGJlIGF0IHRoZSBlbmQgb2YgdGhlIE1QVT8NCj4gDQoNCkFzIGRpc2N1
c3NlZCBpbiB0aGUgdjEgU2VyaWUsIEknZCBsaWtlIHRvIHB1dCBhbGwgdHJhbnNpZW50IE1QVSBy
ZWdpb25zLCBsaWtlIGJvb3Qtb25seSByZWdpb24sDQphdCB0aGUgZW5kIG9mIHRoZSBNUFUuDQpT
aW5jZSB0aGV5IHdpbGwgZ2V0IHJlbW92ZWQgYXQgdGhlIGVuZCBvZiB0aGUgYm9vdCwgSSBhbSB0
cnlpbmcgbm90IHRvIGxlYXZlIGhvbGVzIGluIHRoZSBNUFUNCm1hcCBieSBwdXR0aW5nIGFsbCB0
cmFuc2llbnQgTVBVIHJlZ2lvbnMgYXQgcmVhci4gDQoNCj4gPg0KPiA+IG1heF94ZW5fbXB1bWFw
IHJlZmVycyB0byB0aGUgbnVtYmVyIG9mIHJlZ2lvbnMgc3VwcG9ydGVkIGJ5IHRoZSBFTDINCj4g
TVBVLg0KPiA+IFRoZSBsYXlvdXQgc2hhbGwgYmUgY29tcGxpYW50IHdpdGggd2hhdCB3ZSBkZXNj
cmliZSBpbiB4ZW4ubGRzLlMsIG9yDQo+ID4gdGhlIGNvZGVzIG5lZWQgYWRqdXN0bWVudC4NCj4g
Pg0KPiA+IEFzIE1NVSBzeXN0ZW0gYW5kIE1QVSBzeXN0ZW0gaGF2ZSBkaWZmZXJlbnQgZnVuY3Rp
b25zIHRvIGNyZWF0ZSB0aGUNCj4gPiBib290IE1NVS9NUFUgbWVtb3J5IG1hbmFnZW1lbnQgZGF0
YSwgaW5zdGVhZCBvZiBpbnRyb2R1Y2luZyBleHRyYQ0KPiA+ICNpZmRlZiBpbiBtYWluIGNvZGUg
Zmxvdywgd2UgaW50cm9kdWNlIGEgbmV1dHJhbCBuYW1lDQo+ID4gcHJlcGFyZV9lYXJseV9tYXBw
aW5ncyBmb3IgYm90aCwgYW5kIGFsc28gdG8gcmVwbGFjZSBjcmVhdGVfcGFnZV90YWJsZXMNCj4g
Zm9yIE1NVS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVu
Z0Bhcm0uY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29t
Pg0KPiA+IC0tLQ0KPiA+ICAgeGVuL2FyY2gvYXJtL2FybTY0L01ha2VmaWxlICAgICAgICAgICAg
ICB8ICAgMiArDQo+ID4gICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TICAgICAgICAgICAgICAg
IHwgIDE3ICstDQo+ID4gICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZF9tbXUuUyAgICAgICAgICAg
IHwgICA0ICstDQo+ID4gICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZF9tcHUuUyAgICAgICAgICAg
IHwgMzIzDQo+ICsrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gICB4ZW4vYXJjaC9hcm0vaW5j
bHVkZS9hc20vYXJtNjQvbXB1LmggICAgIHwgIDYzICsrKysrDQo+ID4gICB4ZW4vYXJjaC9hcm0v
aW5jbHVkZS9hc20vYXJtNjQvc3lzcmVncy5oIHwgIDQ5ICsrKysNCj4gPiAgIHhlbi9hcmNoL2Fy
bS9tbV9tcHUuYyAgICAgICAgICAgICAgICAgICAgfCAgNDggKysrKw0KPiA+ICAgeGVuL2FyY2gv
YXJtL3hlbi5sZHMuUyAgICAgICAgICAgICAgICAgICB8ICAgNCArDQo+ID4gICA4IGZpbGVzIGNo
YW5nZWQsIDUwMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiA+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9hcm02NC9oZWFkX21wdS5TDQo+ID4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTY0L21wdS5oDQo+ID4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL21tX21wdS5jDQo+ID4NCj4gPiArLyoNCj4gPiAr
ICogTWFjcm8gdG8gY3JlYXRlIGEgbmV3IE1QVSBtZW1vcnkgcmVnaW9uIGVudHJ5LCB3aGljaCBp
cyBhDQo+ID4gK3N0cnVjdHVyZQ0KPiA+ICsgKiBvZiBwcl90LCAgaW4gXHBybWFwLg0KPiA+ICsg
Kg0KPiA+ICsgKiBJbnB1dHM6DQo+ID4gKyAqIHBybWFwOiAgIG1wdSBtZW1vcnkgcmVnaW9uIG1h
cCB0YWJsZSBzeW1ib2wNCj4gPiArICogc2VsOiAgICAgcmVnaW9uIHNlbGVjdG9yDQo+ID4gKyAq
IHByYmFyOiAgIHByZXNlcnZlIHZhbHVlIGZvciBQUkJBUl9FTDINCj4gPiArICogcHJsYXIgICAg
cHJlc2VydmUgdmFsdWUgZm9yIFBSTEFSX0VMMg0KPiA+ICsgKg0KPiA+ICsgKiBDbG9iYmVycyBc
dG1wMSwgXHRtcDINCj4gPiArICoNCj4gPiArICovDQo+ID4gKy5tYWNybyBjcmVhdGVfbXB1X2Vu
dHJ5IHBybWFwLCBzZWwsIHByYmFyLCBwcmxhciwgdG1wMSwgdG1wMg0KPiA+ICsgICAgbW92ICAg
XHRtcDIsIFxzZWwNCj4gPiArICAgIGxzbCAgIFx0bXAyLCBcdG1wMiwgI01QVV9FTlRSWV9TSElG
VA0KPiA+ICsgICAgYWRyX2wgXHRtcDEsIFxwcm1hcA0KPiA+ICsgICAgLyogV3JpdGUgdGhlIGZp
cnN0IDggYnl0ZXMocHJiYXJfdCkgb2YgcHJfdCAqLw0KPiA+ICsgICAgc3RyICAgXHByYmFyLCBb
XHRtcDEsIFx0bXAyXQ0KPiA+ICsNCj4gPiArICAgIGFkZCAgIFx0bXAyLCBcdG1wMiwgIzgNCj4g
PiArICAgIC8qIFdyaXRlIHRoZSBsYXN0IDggYnl0ZXMocHJsYXJfdCkgb2YgcHJfdCAqLw0KPiA+
ICsgICAgc3RyICAgXHBybGFyLCBbXHRtcDEsIFx0bXAyXQ0KPiANCj4gQW55IHBhcnRpY3VsYXIg
cmVhc29uIHRvIG5vdCB1c2UgJ3N0cCc/DQo+IA0KPiBBbHNvLCBBRkFJQ1QsIHdpdGggZGF0YSBj
YWNoZSBkaXNhYmxlZC4gQnV0IGF0IGxlYXN0IG9uIEFSTXY4LUEsIHRoZSBjYWNoZSBpcw0KPiBu
ZXZlciByZWFsbHkgb2ZmLiBTbyBkb24ndCBuZWVkIHNvbWUgY2FjaGUgbWFpbnRhaW5hbmNlPw0K
PiANCj4gRkFPRCwgSSBrbm93IHRoZSBleGlzdGluZyBNTVUgY29kZSBoYXMgdGhlIHNhbWUgaXNz
dWUuIEJ1dCBJIHdvdWxkIHJhdGhlcg0KPiBwcmVmZXIgaWYgdGhlIG5ldyBjb2RlIGludHJvZHVj
ZWQgaXMgY29tcGxpYW50IHRvIHRoZSBBcm0gQXJtLg0KPiANCg0KVHJ1ZSwgYHN0cGAgaXMgYmV0
dGVyIGFuZCBJIHdpbGwgY2xlYW4gZGF0YSBjYWNoZSB0byBiZSBjb21wbGlhbnQgdG8gdGhlIEFy
bSBBcm0uDQpJIHdyaXRlIHRoZSBmb2xsb3dpbmcgZXhhbXBsZSB0byBzZWUgaWYgSSBjYXRjaCB3
aGF0IHlvdSBzdWdnZXN0ZWQ6DQpgYGANCmFkZCBcdG1wMSwgXHRtcDEsIFx0bXAyDQpzdHAgXHBy
YmFyLCBccHJsYXIsIFtcdG1wMV0NCmRjIGN2YXUsIFx0bXAxDQppc2INCmRzYiBzeQ0KYGBgDQoN
Cj4gPiArLmVuZG0NCj4gPiArDQo+ID4gKy8qDQo+ID4gKyAqIE1hY3JvIHRvIHN0b3JlIHRoZSBt
YXhpbXVtIG51bWJlciBvZiByZWdpb25zIHN1cHBvcnRlZCBieSB0aGUgRUwyDQo+ID4gK01QVQ0K
PiA+ICsgKiBpbiBtYXhfeGVuX21wdW1hcCwgd2hpY2ggaXMgaWRlbnRpZmllZCBieSBNUFVJUl9F
TDIuDQo+ID4gKyAqDQo+ID4gKyAqIE91dHB1dHM6DQo+ID4gKyAqIG5yX3JlZ2lvbnM6IHByZXNl
cnZlIHRoZSBtYXhpbXVtIG51bWJlciBvZiByZWdpb25zIHN1cHBvcnRlZCBieQ0KPiA+ICt0aGUg
RUwyIE1QVQ0KPiA+ICsgKg0KPiA+ICsgKiBDbG9iYmVycyBcdG1wMQ0KPiA+ICsgKiA+ICsgKi8N
Cj4gDQo+IEFyZSB5b3UgZ29pbmcgdG8gaGF2ZSBtdWx0aXBsZSB1c2Vycz8gSWYgbm90LCB0aGVu
IEkgd291bGQgcHJlZmVyIGlmIHRoaXMgaXMNCj4gZm9sZGVkIGluIHRoZSBvbmx5IGNhbGxlci4N
Cj4gDQoNCk9rLiBJIHdpbGwgZm9sZCBzaW5jZSBJIHRoaW5rIGl0IGlzIG9uZS10aW1lIHJlYWRp
bmcgdGhpbmd5Lg0KDQo+ID4gKy5tYWNybyByZWFkX21heF9lbDJfcmVnaW9ucywgbnJfcmVnaW9u
cywgdG1wMQ0KPiA+ICsgICAgbG9hZF9wYWRkciBcdG1wMSwgbWF4X3hlbl9tcHVtYXANCj4gDQo+
IEkgd291bGQgcmF0aGVyIHByZWZlciBpZiB3ZSByZXN0cmljdCB0aGUgdXNlIG9mIGdsb2JhbCB3
aGlsZSB0aGUgTU1VIGlmIG9mZiAoc2VlDQo+IHdoeSBhYm92ZSkuDQo+IA0KDQpJZiB3ZSBkb24n
dCB1c2UgZ2xvYmFsIGhlcmUsIHRoZW4gYWZ0ZXIgTVBVIGVuYWJsZWQsIHdlIG5lZWQgdG8gcmUt
cmVhZCBNUFVJUl9FTDINCnRvIGdldCB0aGUgbnVtYmVyIG9mIG1heGltdW0gRUwyIHJlZ2lvbnMu
DQoNCk9yIEkgcHV0IGRhdGEgY2FjaGUgY2xlYW4gYWZ0ZXIgYWNjZXNzaW5nIGdsb2JhbCwgaXMg
aXQgYmV0dGVyPw0KYGBgDQpzdHIgICBcbnJfcmVnaW9ucywgW1x0bXAxXQ0KZGMgY3ZhdSwgXHRt
cDENCmlzYg0KZHNiIHN5DQpgYGANCg0KPiA+ICsgICAgbXJzICAgXG5yX3JlZ2lvbnMsIE1QVUlS
X0VMMg0KPiA+ICsgICAgaXNiDQo+IA0KPiBXaGF0J3MgdGhhdCBpc2IgZm9yPw0KPiANCj4gPiAr
ICAgIHN0ciAgIFxucl9yZWdpb25zLCBbXHRtcDFdDQo+ID4gKy5lbmRtDQo+ID4gKw0KPiA+ICsv
Kg0KPiA+ICsgKiBFTlRSWSB0byBjb25maWd1cmUgYSBFTDIgTVBVIG1lbW9yeSByZWdpb24NCj4g
PiArICogQVJNdjgtUiBBQXJjaDY0IGF0IG1vc3Qgc3VwcG9ydHMgMjU1IE1QVSBwcm90ZWN0aW9u
IHJlZ2lvbnMuDQo+ID4gKyAqIFNlZSBzZWN0aW9uIEcxLjMuMTggb2YgdGhlIHJlZmVyZW5jZSBt
YW51YWwgZm9yIEFSTXY4LVIgQUFyY2g2NCwNCj4gPiArICogUFJCQVI8bj5fRUwyIGFuZCBQUkxB
UjxuPl9FTDIgcHJvdmlkZXMgYWNjZXNzIHRvIHRoZSBFTDIgTVBVDQo+ID4gK3JlZ2lvbg0KPiA+
ICsgKiBkZXRlcm1pbmVkIGJ5IHRoZSB2YWx1ZSBvZiAnbicgYW5kIFBSU0VMUl9FTDIuUkVHSU9O
IGFzDQo+ID4gKyAqIFBSU0VMUl9FTDIuUkVHSU9OPDc6ND46bi4obiA9IDAsIDEsIDIsIC4uLiAs
IDE1KQ0KPiA+ICsgKiBGb3IgZXhhbXBsZSB0byBhY2Nlc3MgcmVnaW9ucyBmcm9tIDE2IHRvIDMx
ICgwYjEwMDAwIHRvIDBiMTExMTEpOg0KPiA+ICsgKiAtIFNldCBQUlNFTFJfRUwyIHRvIDBiMXh4
eHgNCj4gPiArICogLSBSZWdpb24gMTYgY29uZmlndXJhdGlvbiBpcyBhY2Nlc3NpYmxlIHRocm91
Z2ggUFJCQVIwX0VMMiBhbmQNCj4gPiArUFJMQVIwX0VMMg0KPiA+ICsgKiAtIFJlZ2lvbiAxNyBj
b25maWd1cmF0aW9uIGlzIGFjY2Vzc2libGUgdGhyb3VnaCBQUkJBUjFfRUwyIGFuZA0KPiA+ICtQ
UkxBUjFfRUwyDQo+ID4gKyAqIC0gUmVnaW9uIDE4IGNvbmZpZ3VyYXRpb24gaXMgYWNjZXNzaWJs
ZSB0aHJvdWdoIFBSQkFSMl9FTDIgYW5kDQo+ID4gK1BSTEFSMl9FTDINCj4gPiArICogLSAuLi4N
Cj4gPiArICogLSBSZWdpb24gMzEgY29uZmlndXJhdGlvbiBpcyBhY2Nlc3NpYmxlIHRocm91Z2gg
UFJCQVIxNV9FTDIgYW5kDQo+ID4gK1BSTEFSMTVfRUwyDQo+ID4gKyAqDQo+ID4gKyAqIElucHV0
czoNCj4gPiArICogeDI3OiByZWdpb24gc2VsZWN0b3INCj4gPiArICogeDI4OiBwcmVzZXJ2ZSB2
YWx1ZSBmb3IgUFJCQVJfRUwyDQo+ID4gKyAqIHgyOTogcHJlc2VydmUgdmFsdWUgZm9yIFBSTEFS
X0VMMg0KPiA+ICsgKg0KPiA+ICsgKi8NCj4gPiArRU5UUlkod3JpdGVfcHIpDQo+IA0KPiBBRkFJ
Q1QsIHRoaXMgZnVuY3Rpb24gd291bGQgbm90IGJlIG5lY2Vzc2FyeSBpZiB0aGUgaW5kZXggZm9y
IHRoZSBpbml0IHNlY3Rpb25zDQo+IHdlcmUgaGFyZGNvZGVkLg0KPiANCj4gU28gSSB3b3VsZCBs
aWtlIHRvIHVuZGVyc3RhbmQgd2h5IHRoZSBpbmRleCBjYW5ub3QgYmUgaGFyZGNvZGVkLg0KPiAN
Cg0KVGhlIHJlYXNvbiBpcyB0aGF0IHdlIGFyZSBwdXR0aW5nIGluaXQgc2VjdGlvbnMgYXQgdGhl
ICplbmQqIG9mIHRoZSBNUFUgbWFwLCBhbmQNCnRoZSBsZW5ndGggb2YgdGhlIHdob2xlIE1QVSBt
YXAgaXMgcGxhdGZvcm0tc3BlY2lmaWMuIFdlIHJlYWQgaXQgZnJvbSBNUFVJUl9FTDIuDQogDQo+
ID4gKyAgICBtc3IgICBQUlNFTFJfRUwyLCB4MjcNCj4gPiArICAgIGRzYiAgIHN5DQo+IA0KPiBb
Li4uXQ0KPiANCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3hlbi5sZHMuUyBiL3hlbi9h
cmNoL2FybS94ZW4ubGRzLlMgaW5kZXgNCj4gPiBiYzQ1ZWEyYzY1Li43OTk2NWEzYzE3IDEwMDY0
NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMNCj4gPiArKysgYi94ZW4vYXJjaC9h
cm0veGVuLmxkcy5TDQo+ID4gQEAgLTkxLDYgKzkxLDggQEAgU0VDVElPTlMNCj4gPiAgICAgICAg
IF9fcm9fYWZ0ZXJfaW5pdF9lbmQgPSAuOw0KPiA+ICAgICB9IDogdGV4dA0KPiA+DQo+ID4gKyAg
LiA9IEFMSUdOKFBBR0VfU0laRSk7DQo+IA0KPiBXaHkgZG8geW91IG5lZWQgdGhpcyBBTElHTj8N
Cj4gDQoNCkkgbmVlZCBhIHN5bWJvbCBhcyB0aGUgc3RhcnQgb2YgdGhlIGRhdGEgc2VjdGlvbiwg
c28gSSBpbnRyb2R1Y2UNCiJfX2RhdGFfYmVnaW4gPSAuOyIuIA0KSWYgSSB1c2UgIl9fcm9fYWZ0
ZXJfaW5pdF9lbmQgPSAuOyIgaW5zdGVhZCwgSSdtIGFmcmFpZCBpbiB0aGUgZnV0dXJlLA0KaWYg
c29tZW9uZSBpbnRyb2R1Y2VzIGEgbmV3IHNlY3Rpb24gYWZ0ZXIgcm8tYWZ0ZXItaW5pdCBzZWN0
aW9uLCB0aGlzIHBhcnQNCmFsc28gbmVlZHMgbW9kaWZpY2F0aW9uIHRvby4NCg0KV2hlbiB3ZSBk
ZWZpbmUgTVBVIHJlZ2lvbnMgZm9yIGVhY2ggc2VjdGlvbiBpbiB4ZW4ubGRzLlMsIHdlIGFsd2F5
cyB0cmVhdCB0aGVzZSBzZWN0aW9ucw0KcGFnZS1hbGlnbmVkLg0KSSBjaGVja2VkIGVhY2ggc2Vj
dGlvbiBpbiB4ZW4ubGRzLlMsIGFuZCAiLiA9IEFMSUdOKFBBR0VfU0laRSk7IiBpcyBlaXRoZXIg
YWRkZWQNCmF0IHNlY3Rpb24gaGVhZCwgb3IgYXQgdGhlIHRhaWwgb2YgdGhlIHByZXZpb3VzIHNl
Y3Rpb24sIHRvIG1ha2Ugc3VyZSBzdGFydGluZyBhZGRyZXNzIHN5bWJvbA0KcGFnZS1hbGlnbmVk
Lg0KDQpBbmQgaWYgd2UgZG9uJ3QgcHV0IHRoaXMgQUxJR04sIGlmICJfX3JvX2FmdGVyX2luaXRf
ZW5kICIgc3ltYm9sIGl0c2VsZiBpcyBub3QgcGFnZS1hbGlnbmVkLA0KdGhlIHR3byBhZGphY2Vu
dCBzZWN0aW9ucyB3aWxsIG92ZXJsYXAgaW4gTVBVLg0KIA0KPiA+ICsgIF9fZGF0YV9iZWdpbiA9
IC47DQo+ID4gICAgIC5kYXRhLnJlYWRfbW9zdGx5IDogew0KPiA+ICAgICAgICAgIC8qIEV4Y2Vw
dGlvbiB0YWJsZSAqLw0KPiA+ICAgICAgICAgIF9fc3RhcnRfX19leF90YWJsZSA9IC47DQo+ID4g
QEAgLTE1Nyw3ICsxNTksOSBAQCBTRUNUSU9OUw0KPiA+ICAgICAgICAgICooLmFsdGluc3RyX3Jl
cGxhY2VtZW50KQ0KPiANCj4gSSBrbm93IHlvdSBhcmUgbm90IHVzaW5nIGFsdGVybmF0aXZlIGlu
c3RydWN0aW9ucyB5ZXQuIEJ1dCwgeW91IHNob3VsZCBtYWtlDQo+IHN1cmUgdGhleSBhcmUgaW5j
bHVkZWQuIFNvIEkgdGhpbmsgcmF0aGVyIHRoYW4gaW50cm9kdWNlIF9faW5pdF9kYXRhX2JlZ2lu
LA0KPiB5b3Ugd2FudCB0byB1c2UgIl9laW5pdGV4dCIgZm9yIHRoZSBzdGFydCBvZiB0aGUgIklu
aXQgZGF0YSIgc2VjdGlvbi4NCj4gDQo+ID4gICAgIH0gOnRleHQNCj4gPiAgICAgLiA9IEFMSUdO
KFBBR0VfU0laRSk7DQo+ID4gKw0KPiANCj4gU3B1cmlvdXM/DQo+IA0KPiA+ICAgICAuaW5pdC5k
YXRhIDogew0KPiA+ICsgICAgICAgX19pbml0X2RhdGFfYmVnaW4gPSAuOyAgICAgICAgICAgIC8q
IEluaXQgZGF0YSAqLw0KPiA+ICAgICAgICAgICooLmluaXQucm9kYXRhKQ0KPiA+ICAgICAgICAg
ICooLmluaXQucm9kYXRhLiopDQo+ID4NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGll
biBHcmFsbA0KDQpDaGVlcnMsDQoNCi0tDQpQZW5ueSBaaGVuZw0K

