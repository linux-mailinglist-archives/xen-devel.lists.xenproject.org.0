Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D02D4685F11
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 06:40:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488116.756039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN5qz-0000uy-6v; Wed, 01 Feb 2023 05:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488116.756039; Wed, 01 Feb 2023 05:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN5qz-0000sb-2h; Wed, 01 Feb 2023 05:40:17 +0000
Received: by outflank-mailman (input) for mailman id 488116;
 Wed, 01 Feb 2023 05:40:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tGJx=55=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pN5qx-0000sV-DQ
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 05:40:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e680eadf-a1f2-11ed-933c-83870f6b2ba8;
 Wed, 01 Feb 2023 06:40:14 +0100 (CET)
Received: from DB9PR02CA0017.eurprd02.prod.outlook.com (2603:10a6:10:1d9::22)
 by GV2PR08MB8076.eurprd08.prod.outlook.com (2603:10a6:150:7a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Wed, 1 Feb
 2023 05:39:59 +0000
Received: from DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::fb) by DB9PR02CA0017.outlook.office365.com
 (2603:10a6:10:1d9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24 via Frontend
 Transport; Wed, 1 Feb 2023 05:39:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT049.mail.protection.outlook.com (100.127.142.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.22 via Frontend Transport; Wed, 1 Feb 2023 05:39:58 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Wed, 01 Feb 2023 05:39:58 +0000
Received: from fb9d6ac4874c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 26F5AC15-6185-4D59-A10C-DE4A3B8618CB.1; 
 Wed, 01 Feb 2023 05:39:48 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fb9d6ac4874c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 01 Feb 2023 05:39:48 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by VI1PR08MB5326.eurprd08.prod.outlook.com (2603:10a6:803:12d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 1 Feb
 2023 05:39:45 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab%3]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 05:39:45 +0000
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
X-Inumbo-ID: e680eadf-a1f2-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxpFKNHzViWLAA9DiG4Oxyfyq64BtVV1CnamlGeQP+Y=;
 b=PK+oWnUkcJ8BbHzCVR1czHotJY5BhEBD+njgf1nvtTKQ+fvJNuWaaF8iYukCzPtDhQ6+7Rgt0bR9vpXjmmorDivYeXJV7v+G4j12iIViIgulaV6U7dMvqk2SNEEDiaqI8W33sxlfJzWt0z3sERIyypS1WUEJ1y77RwaNGS+CFM4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nl7io+6UkzJg9Vuok5eG3vzbeCVV8HE1O5L+N0ZyxBkuKNDSq4u5gkq6xD44djO3tUSc1HwN2ZtPEPuehB6JjF7AtxPUBYHz2UmyK9w+GfYNHfKuoHIGtG/8ynAZcw6mXS/ATyzdlZq324SPj+v92EIZyWg8BQa361qF3/5p1QcRRfKhE+h8zozi36ZUQIHLZqZ1Tniwmm1LftHwurpb6V4dNaDI10BKup4u6Tq7t/fYhjICiHR+5Q0/iAIWKgu9GJsfuSSOFDI9aeLld+91VP9VG3psmqwApTSrQOx54SdCfUkHfNlswf5FzkOxD+x7ie/1bdFU7RBIhYcbgxwhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxpFKNHzViWLAA9DiG4Oxyfyq64BtVV1CnamlGeQP+Y=;
 b=V+IaacA+j10K+dvrO6isV4CcC3+51OTBOwm/aR9qAvMWX1Ve/lHE0mmFFMHbVzCzKXitG0tOMlSeT+dZ+yz2qH28uYzyf2bknA0uOTFqeqDhU47h6fkGgxyKBKOxRjYnnRaW/tW/I4YN4owbGfdc+nnP17+gD35On8IwyrV7O+cgCFwxjMowx3BrsvTxPXuZ7qcIb9ZlZOTfcTxczhRRS7MVUBrR4VrT1gWUj+DTbPC1/dSQw+D+6r81jaMMQ/osSqfGOKEY4YBB0NQCPiCkT6s39QS3fcf7Ltx7e2p2URS5CPCeTNoV63Xk32VG6yXgh6acKH3LgZYyb59wxrZRwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxpFKNHzViWLAA9DiG4Oxyfyq64BtVV1CnamlGeQP+Y=;
 b=PK+oWnUkcJ8BbHzCVR1czHotJY5BhEBD+njgf1nvtTKQ+fvJNuWaaF8iYukCzPtDhQ6+7Rgt0bR9vpXjmmorDivYeXJV7v+G4j12iIViIgulaV6U7dMvqk2SNEEDiaqI8W33sxlfJzWt0z3sERIyypS1WUEJ1y77RwaNGS+CFM4=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "ayan.kumar.halder@xilinx.com"
	<ayan.kumar.halder@xilinx.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 11/40] xen/mpu: build up start-of-day Xen MPU memory
 region map
Thread-Topic: [PATCH v2 11/40] xen/mpu: build up start-of-day Xen MPU memory
 region map
Thread-Index:
 AQHZJxAhTWb1zeTHm029bSgcZo/2Yq6l4H6AgA7nVJCAAFMfgIAAHOxggAGXmACAARsywIAAc7oAgAFRxNA=
Date: Wed, 1 Feb 2023 05:39:45 +0000
Message-ID:
 <AM0PR08MB4530DD5EE9DD4339594F3FE9F7D19@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-12-Penny.Zheng@arm.com>
 <c30b4458-b5f6-f996-0c3c-220b18bfb356@xen.org>
 <AM0PR08MB453083B74DB1D00BDF469331F7D29@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <7931e70f-3754-363c-28d8-5fde3198d70f@xen.org>
 <AM0PR08MB45308D5CD69EBB5FE85A4B88F7D39@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <3c915633-ddb8-d1e4-f42e-064aaff168b2@xen.org>
 <AM0PR08MB45309F6DCB1B1E0975A741B7F7D09@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <509eafac-bbe7-ed18-ce11-3fede7ca691d@xen.org>
In-Reply-To: <509eafac-bbe7-ed18-ce11-3fede7ca691d@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4460F5F35D43C946BBD5A339B6084B94.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|VI1PR08MB5326:EE_|DBAEUR03FT049:EE_|GV2PR08MB8076:EE_
X-MS-Office365-Filtering-Correlation-Id: baeaa7b1-21f6-4767-ce03-08db0416c18c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YQ0PtNHaH53FJzyoHO+b5+2sIgyoVIS+EBf8NwL87GntckRSrWFy+zpjJuuVyKiz8FH7IddIB2Af4WIrugxvLx4yvFM5imQ9o3hBfmh1SsZMCI/co2I4sM5aPwoCU1x6C0R5SbUWgUbPCev7AApRKT1jc+8ZsTq+cJ+zg8Swg2ijnPPy4n48FenkNVryM6wlFz6hZ8wjSmGfsjSLBX/b/VbLWaRk9oyaCpxQNx77Hq6FfAnyNmA5QiG4rjBU/+t5OJD/zlF91nL14w8ATSVr0pigLhx/r7ASqqmrCHLl+CWAM9pg7DSl0n8XaoHlFMoSuEEHMOafETcX10tNOJ7A5D8YixPYsyNVCbCukgqcnXH6O8RDRCitu8bJmmIpElAhXQzFRyb8XMfvMqfCLU3MjqDK9t0LoBQQGsIlFEvW2pwL49RsIrSgxXJoUMriObLla0N1XnI2HeLkn7kC0qm5xgnwcSlRARUoIGDh2efVJu/3B5ddO1TBRKA2pLI1RxVPybXmEugdPb5I/m0j6vH1UUs44BXY8Hp/ciwWsRcvRuXw00hA4JIRbPMu3SeHT2iNyDKh3oktnyhzFj0ojf8lRDbRtvxl8afyvQv8TWvrUF5kfZ41ZIIcFUxqK/1sGNYkzArxxRDPcGiZ22IAIsufsdljCpPwg7sM5otIb0cPXM6DF4F8YEC47u3CHtvdBCjORehuZNb0qcy+Y3ZefndKyw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199018)(316002)(110136005)(8936002)(33656002)(55016003)(2906002)(52536014)(5660300002)(38070700005)(86362001)(122000001)(38100700002)(66946007)(66556008)(4326008)(66476007)(66446008)(64756008)(76116006)(8676002)(83380400001)(41300700001)(7696005)(478600001)(186003)(26005)(9686003)(53546011)(6506007)(71200400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5326
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6d3db0a5-c615-450f-6a95-08db0416b9c6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2xtmIhHISOY15rl6u7agtCaZNKlSJDFeftMe+QlO+j3O8NVzmHNJpEL848IFCCD7ZB2HL0oOx6nxryOS8mYJKEGbPtq92k1D912JokV0my5UlI3sWEKqWM+w2dmnVzTQTI3VghOWehm1Y350tntWFD6U6c1MvSg5kl6idFeA0hwPyept2rZ0SFj9CjiGRb3rjzy1J9ESyeQxRdybE2A/HQzqbbUWsRbezp7MctKVeAnGtSotobb03byHtNS/SdFJT6rRObr+O5nhQN+yPE0dHjIDo7vpSZitmoAqiS/RuLYI52lMgw6iV4U3egjp1Sfyx1+oTMNO0008CIgpt7R9wGafpW0qCHhRsZTXrw5Pk0+YmGRpuDaKEo39KTzMj67wOsR+20GgB0GfZ7TZA3JuATiMhy6+faURSRsDZei8nSldQ2PAUjTXczdNr4lodB0X5yS4CQmCPBp9ngsUf//JLGwu7MocxgcLwr8Ap/5JAcqVV7UhdShFP0brk3QJIb2pz3Vb3lRCyrMCd+fAqzc2SKArg4uHhODenQ7CV8+5coXKSUdZUBMDqy7T2uFKFD1jkP8t+A+Ye1k4jNmYYyUqzpXY8RucHp+fCCAmMiI6QJ9ZJNPGz+JPrhaJpOPjtuiozTL2lVdgJnhp9Gdqnv/aSP7vkxoDvLpTXwK4H2S4nIJKYRAHJs74sohqkDV26/gRHhxJDI0hJJIy03sKoMyE1w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199018)(36840700001)(40470700004)(46966006)(40460700003)(5660300002)(53546011)(6506007)(81166007)(356005)(186003)(9686003)(26005)(82740400003)(107886003)(82310400005)(316002)(52536014)(110136005)(40480700001)(33656002)(478600001)(70206006)(55016003)(7696005)(83380400001)(336012)(2906002)(4326008)(86362001)(8676002)(47076005)(70586007)(8936002)(36860700001)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 05:39:58.6079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baeaa7b1-21f6-4767-ce03-08db0416c18c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8076

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEphbnVhcnkgMzEsIDIw
MjMgNToyOCBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29t
PjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJh
bmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsNCj4gYXlhbi5rdW1hci5oYWxk
ZXJAeGlsaW54LmNvbQ0KPiBDYzogVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVr
QGVwYW0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDExLzQwXSB4ZW4vbXB1OiBidWls
ZCB1cCBzdGFydC1vZi1kYXkgWGVuIE1QVQ0KPiBtZW1vcnkgcmVnaW9uIG1hcA0KPiANCj4gDQo+
IA0KPiBPbiAzMS8wMS8yMDIzIDA0OjExLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBIaSBKdWxp
ZW4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKdWxp
ZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiA+PiBTZW50OiBNb25kYXksIEphbnVhcnkgMzAs
IDIwMjMgNTo0MCBQTQ0KPiA+PiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+
OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4+IENjOiBXZWkgQ2hlbiA8
V2VpLkNoZW5AYXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA+PiA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz47IEJlcnRyYW5kIE1hcnF1aXMNCj4gPj4gPEJlcnRyYW5kLk1hcnF1aXNAYXJt
LmNvbT47IFZvbG9keW15ciBCYWJjaHVrDQo+ID4+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNv
bT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxMS80MF0geGVuL21wdTogYnVpbGQgdXAg
c3RhcnQtb2YtZGF5IFhlbiBNUFUNCj4gPj4gbWVtb3J5IHJlZ2lvbiBtYXANCj4gPj4NCj4gPj4g
SGkgUGVubnksDQo+ID4+DQpbLi4uXQ0KPiA+Pg0KPiA+PiBJIHdvdWxkIHN1Z2dlc3QgdG8gaW52
ZXN0aWdhdGUgdGhlIGNvc3Qgb2YgImh1bnRpbmcgZG93biBlYWNoIHNlY3Rpb24iLg0KPiA+PiBE
ZXBlbmRpbmcgb24gdGhlIHJlc3VsdCwgd2UgY2FuIGRpc2N1c3Mgd2hhdCB0aGUgYmVzdCBhcHBy
b2FjaC4NCj4gPj4NCj4gPg0KPiA+IENvcnJlY3QgbWUgaWYgSSdtIHdyb25nLCB0aGUgY29tcGxp
Y2F0ZWQgdGhpbmdzIGluIGFzc2VtYmx5IHlvdSBhcmUNCj4gPiB3b3JyaWVkIGFib3V0IGlzIHRo
YXQgd2UgY291bGRuJ3QgZGVmaW5lIHRoZSBpbmRleCBmb3IgaW5pdGlhbCBzZWN0aW9ucywgbm8N
Cj4gaGFyZGNvZGVkIHRvIGtlZXAgc2ltcGxlLg0KPiANCj4gQ29ycmVjdC4NCj4gDQo+ID4gQW5k
IGZ1bmN0aW9uIHdyaXRlX3ByLCBpaywgaXMgcmVhbGx5IGEgYmlnIGNodW5rIG9mIGNvZGVzLCBo
b3dldmVyIHRoZQ0KPiA+IGxvZ2ljIGlzIHNpbXBsZSB0aGVyZSwganVzdCBhIGJ1bmNoIG9mICJz
d2l0Y2gtY2FzZXMiLg0KPiANCj4gSSBhZ3JlZSB0aGF0IHdyaXRlX3ByKCkgaXMgYSBidW5jaCBv
ZiBzd2l0Y2gtY2FzZXMuIEJ1dCB0aGVyZSBhcmUgYSBsb3Qgb2YNCj4gZHVwbGljYXRpb24gaW4g
aXQgYW5kIHRoZSBpbnRlcmZhY2UgdG8gdXNlIGl0IGlzLCBJTUhPLCBub3QgaW50dWl0aXZlLg0K
PiANCj4gPg0KPiA+IElmIHdlIGFyZSBhZGRpbmcgTVBVIHJlZ2lvbnMgaW4gc2VxdWVuY2UgYXMg
eW91IHN1Z2dlc3RlZCwgd2hpbGUgdXNpbmcNCj4gPiBiaXRtYXAgYXQgdGhlIHNhbWUgdGltZSB0
byByZWNvcmQgdXNlZCBlbnRyeS4NCj4gPiBUQkgsIHRoaXMgaXMgaG93IEkgZGVzaWduZWQgYXQg
dGhlIHZlcnkgYmVnaW5uaW5nIGludGVybmFsbHkuIFdlIGZvdW5kDQo+ID4gdGhhdCBpZiB3ZSBk
b24ndCBkbyByZW9yZyBsYXRlLWJvb3QgdG8ga2VlcCBmaXhlZCBpbiBmcm9udCBhbmQNCj4gPiBz
d2l0Y2hpbmcgb25lcyBhZnRlciwgZWFjaCB0aW1lIHdoZW4gd2UgZG8gdmNwdSBjb250ZXh0IHN3
aXRjaCwgbm90DQo+ID4gb25seSB3ZSBuZWVkIHRvIGh1bnQgZG93biBzd2l0Y2hpbmcgb25lcyB0
byBkaXNhYmxlLCB3aGlsZSB3ZSBhZGQgbmV3DQo+ID4gc3dpdGNoLWluIHJlZ2lvbnMsIHVzaW5n
IGJpdG1hcCB0byBmaW5kIGZyZWUgZW50cnkgaXMgc2F5aW5nIHRoYXQgdGhlDQo+IHByb2Nlc3Mg
aXMgdW5wcmVkaWN0YWJsZS4gVW5jZXJ0YWludHkgaXMgd2hhdCB3ZSB3YW50IHRvIGF2b2lkIGlu
IEFybXY4LVINCj4gYXJjaGl0ZWN0dXJlLg0KPiANCj4gSSBkb24ndCB1bmRlcnN0YW5kIHdoeSBp
dCB3b3VsZCBiZSB1bnByZWRpY3RhYmxlLiBGb3IgYSBnaXZlbiBjb21iaW5hdGlvbg0KPiBvZiBw
bGF0Zm9ybS9kZXZpY2UtdHJlZSwgdGhlIGJpdG1hcCB3aWxsIGFsd2F5cyBsb29rIHRoZSBzYW1l
LiBTbyB0aGUNCj4gbnVtYmVyIG9mIGN5Y2xlcy9pbnN0cnVjdGlvbnMgd2lsbCBhbHdheXMgYmUg
dGhlIHNhbWUuDQo+IA0KDQpJbiBib290LXRpbWUsIGl0IHdpbGwgYmUgYWx3YXlzIHRoZSBzYW1l
LiBCdXQgaWYgd2Ugc3RpbGwgdXNlIGJpdG1hcCB0byBmaW5kIGZyZWUNCmVudHJ5KGZvciBzd2l0
Y2hpbmcgTVBVIHJlZ2lvbnMpIG9uIHJ1bnRpbWUsIGhtbW0sIEkgdGhvdWdodCB0aGlzIHBhcnQg
d2lsbA0KYmUgdW5wcmVkaWN0YWJsZS4NCg0KPiBUaGlzIGlzIG5vdCB2ZXJ5IGRpZmZlcmVudCBm
cm9tIHRoZSBjYXNlIHdoZXJlIHlvdSBzcGxpdCB0aGUgTVBVIGluIHR3bw0KPiBiZWNhdXNlDQo+
IA0KPiA+DQo+ID4gSG1tbSwgVEJILCBJIHJlYWxseSByZWFsbHkgbGlrZSB5b3VyIHN1Z2dlc3Rp
b24gdG8gcHV0DQo+ID4gYm9vdC1vbmx5L3N3aXRjaGluZyByZWdpb25zIGludG8gaGlnaGVyIHNs
b3QuIEl0IHJlYWxseSBzYXZlZCBhIGxvdA0KPiA+IHRyb3VibGUgaW4gbGF0ZS1pbml0IHJlb3Jn
IGFuZCBhbHNvIGF2b2lkcyBkaXNhYmxpbmcgTVBVIGF0IHRoZSBzYW1lDQo+ID4gdGltZS4gVGhl
IHNwbGl0IGlzIGEgc2ltcGxlIGFuZCBlYXN5LXRvLXVuZGVyc3RhbmQgY29uc3RydWN0aW9uIGNv
bXBhcmVkDQo+IHdpdGggYml0bWFwIHRvby4NCj4gDQo+IEkgd291bGQgbGlrZSB0byBwcm9wb3Nl
IGFub3RoZXIgc3BsaXQuIEkgd2lsbCByZXBseSB0byB0aGF0IGluIHRoZSB0aHJlYWQgd2hlcmUN
Cj4geW91IHByb3ZpZGVkIHRoZSBNUFUgbGF5b3V0Lg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0N
Cj4gSnVsaWVuIEdyYWxsDQo=

