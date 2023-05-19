Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 226EF709A79
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 16:52:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537138.835974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q01SX-0005OM-CF; Fri, 19 May 2023 14:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537138.835974; Fri, 19 May 2023 14:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q01SX-0005Ly-9K; Fri, 19 May 2023 14:51:57 +0000
Received: by outflank-mailman (input) for mailman id 537138;
 Fri, 19 May 2023 14:51:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Umm=BI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q01SW-0005Lq-3S
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 14:51:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b10c1b3e-f654-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 16:51:53 +0200 (CEST)
Received: from DU2PR04CA0030.eurprd04.prod.outlook.com (2603:10a6:10:3b::35)
 by DB9PR08MB6442.eurprd08.prod.outlook.com (2603:10a6:10:259::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Fri, 19 May
 2023 14:51:47 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::a2) by DU2PR04CA0030.outlook.office365.com
 (2603:10a6:10:3b::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21 via Frontend
 Transport; Fri, 19 May 2023 14:51:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.21 via Frontend Transport; Fri, 19 May 2023 14:51:47 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Fri, 19 May 2023 14:51:47 +0000
Received: from f06b72459915.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 09040BA9-4DA2-49E7-A266-D1BD6F6464A1.1; 
 Fri, 19 May 2023 14:51:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f06b72459915.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 19 May 2023 14:51:35 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB4PR08MB9190.eurprd08.prod.outlook.com (2603:10a6:10:3fd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 14:51:33 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 14:51:33 +0000
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
X-Inumbo-ID: b10c1b3e-f654-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kitbsA1zlG6W+qc+6IX2A383irQKmXMjPHJcr6b9TrI=;
 b=n4XGIPmrJXv5T0UyjHLRwKr7yczOucGkB1Kkuk0k+TYtbetGucbhmHJfLyQ5l0ZPF0Mc/VyJxkErJBo0L3KJ6wcL67U5K9qbXo3PQfQmfvBZdovKVDdBElFGzAF1XtvAVGQRuyJF7qI1lPvIv9WtwcbLnncvAojhBBAqadPLVNQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7b2e81bb1b7df554
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+AMeJtkGSbBT4d4lDewMxsJQIK53hofJsDVy1+FTAhBtAvSVrjoE8pItf/n97DzRlYOhTgwo5egiMHub0UaX2vOS9zVG60ophsBpaXiGQzModXzi2jx8FSQ4rcZWYdehBMD8erzjZIgxZqfC0I1Xdi+HEQEvGgXa2SDLqqTqJtmRmQMoZHLsaua+vY0cfuoDfic/mp9M/5/MW+JSAXC+A9ZcE5HmveUfYZMrSbAhEDG5A+okJabqL63H++74asmLxm47cjKvncfEnwurlmC01H6Aof5Q12aFvG/50ANzdbPxAHvqFjiFvkfquGBcRCUzJPfAVVp4JfgE+Bk5zryWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kitbsA1zlG6W+qc+6IX2A383irQKmXMjPHJcr6b9TrI=;
 b=YPcjxZws80q/Cr0WfWz4RLRd++MZOS9wjoPI0eTV+DjBk4qVijaOkRFw6hAHfuJ9wG7cAe+uR9NBqNG5e86vJXDiwDDhTfpCCadyVBeSVUzGx761tvcbeEj0+qGVROb4R2HolrSWNtoa5FjLGQAkx8DaPiCF8llCF6h/IKFQrGdOzuSqoGi28j6aujH0qIK5uM3OXBAE3+x+zaYEDary4tjo4Vy/P5TjTyvZ5mvH+fO1hD8C2m5CxKZqxcgyBQzsxdJMkAXfrTexQ5CkgVnpO3CCfaPSNZTJx/ZnRGGmAeosSbUOZjExUlRakAjNnKSLN6n7eZasOi6UivI5+GqLfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kitbsA1zlG6W+qc+6IX2A383irQKmXMjPHJcr6b9TrI=;
 b=n4XGIPmrJXv5T0UyjHLRwKr7yczOucGkB1Kkuk0k+TYtbetGucbhmHJfLyQ5l0ZPF0Mc/VyJxkErJBo0L3KJ6wcL67U5K9qbXo3PQfQmfvBZdovKVDdBElFGzAF1XtvAVGQRuyJF7qI1lPvIv9WtwcbLnncvAojhBBAqadPLVNQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 01/12] xen/arm: enable SVE extension for Xen
Thread-Topic: [PATCH v6 01/12] xen/arm: enable SVE extension for Xen
Thread-Index: AQHZdnKBJmFHv6Wq8kSjvXctD+zlI69f6zCAgAHjioCAAAXEgIAAAV4A
Date: Fri, 19 May 2023 14:51:32 +0000
Message-ID: <AAE00F7D-612B-47AC-82F9-BEEE9CB17804@arm.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-2-luca.fancellu@arm.com>
 <1fb3c4a2-8bc7-45e4-7ccf-803157f1b3b1@xen.org>
 <86D7B5C8-2671-4359-A48D-E7D52B06565C@arm.com>
 <2f14dad9-25f5-7ac7-4ff5-d756e6f55718@xen.org>
In-Reply-To: <2f14dad9-25f5-7ac7-4ff5-d756e6f55718@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB4PR08MB9190:EE_|DBAEUR03FT062:EE_|DB9PR08MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fbb1383-819f-4613-18af-08db58789234
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 02QQO5B1dHaksqEYmeA8oif9NjE/HZ9FiIVoyTVFGI0Dwa4CjTaHI8SKePyCjNim4ryjyW0/CAJ3s0C4PKOWAlvma8mU3Rb+vX29qdDbVxOZWAOxwR580R9fjJTVGCsOPE1QXSV0Atx3TSCaYnYsmVq0/swaXqlyweWL/BvcY3+8Jk2WUv5rdlZNTkvTKZbZs0tEvS78skIyWwm1o1vr2XbTurbXEZSkPpg5QiUW9JHknVNxjoK3GlRm1sV7PgOxI8r7QmN55zwy+AxzQogOQnkSNhP8eEH4uDIY0lSUce+HuoKLCvLvIUgOdOTPhvJr/+69MdZ90E9hixRpK8ytQbFsuK7d/DIZhefJOq4mdVCmFWLQXPxm3mqCKcuPD++UYg7uUQlDpXbd9bZ8HBP0pVRbACVb7uYO/dN8RpCe9Y40HJFnbQcnjWXNwVMQkZN8cjNqPzUz5CBkxg1ol2rPJKN1Hx5RXXIzww105HjWPR4vRQWfnINjHJhP4Ejce4YL89hRpwI3gJjsElmMNeRTlwDoo+A3Nyt90gJ02EFUvLW9xwFy0AYT0gyaLw6RqgTDOxD6ClwwrkgkSnmeg6e//zbJSbW/b5+2R+UZvjcry6C4NeIt4hN6/3haireYnxhGQuTpP+rkm/svro60SWNSPMjGzZ01Xsetdlnh4wPKN78=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(396003)(136003)(39850400004)(451199021)(38070700005)(86362001)(33656002)(36756003)(54906003)(91956017)(316002)(66476007)(66446008)(64756008)(66556008)(66946007)(6916009)(76116006)(4326008)(478600001)(6486002)(71200400001)(8936002)(8676002)(5660300002)(41300700001)(2906002)(38100700002)(122000001)(186003)(2616005)(6506007)(6512007)(26005)(53546011)(83380400001)(66899021)(21314003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D3878CDF557084381970A3B5FB0AA01@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9190
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8e6433ab-ac20-4f33-7134-08db5878898f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DSOBuuuCKQJlrf6IrbBywH10R/xvDVmbVU3l/uWRjL2LqP2xauwU0XGCF3yZxmuwLQ/bh73W7ZI71nhni60UFu49P/WXZ/XjJm3ZdUdK0kFTEzO9tOk5rQKM2AsgP7EvHH7o2j0clyziSrWYGqCEbLWnx9u0HOXGmVP6BwU4SuSWSMiyd15PVW20IGfy6wAQbFG3oW57hN9N0u9zM4iSdiRrt/nUBOFmsi3tsXUI5yj+fQNp10XpmTCU1OTAgLlX8yTpt630iUYD4z/sMgu8wAiA0Vg/XfykTGsVreiGCX15Xupk+WcC7Hcnnhj1MP6eWfDi10g5IkRtRb9A54kgrpi08k0TAmLO5lMMmLGRPSTk9nTSHopVHA+BwZrfaf/4rf+rfDCf+ZfDqh4BwSswrdoJJAz9F1bJEeTEqwOvr7k7/NFp80mZQA3hBHPGxr8Zt/fopUqOMPrgU3ajAWO8dumTIMjrW7NyUSQEu3DbcDRAPANXPmV3zFtJboo9EDgzlfGR2piKO0wLSZZFZ2n7MTzRUbtMV0YOUk75wVK6G7iqc4j5rKElWwrKK2lraPuALDHBAYMvs14syxEZRm4Tuwp/u3ueFUL2Kc4OvUFFV2OH/7MLFpz/Hr9iwW4SOHPGZnCz2aRSvbRsI17jkg3WJ/ov9uJf9qVJd3uvdi1/Yi4SSA2llyTEM30DhwQMdsKM+PTB1CDUBL5uXqwEDQegOLPMJ3gCVe5vgynzoZv2Gy16SwCxw+dW0sOtqtBV8I6yuhwPxx9Lrs+UIt9W5HXbsA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(66899021)(33656002)(316002)(70206006)(70586007)(4326008)(54906003)(86362001)(478600001)(6486002)(36756003)(83380400001)(47076005)(6512007)(36860700001)(107886003)(53546011)(6506007)(26005)(2616005)(186003)(6862004)(336012)(8676002)(2906002)(8936002)(40480700001)(5660300002)(82310400005)(356005)(82740400003)(81166007)(41300700001)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 14:51:47.5108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fbb1383-819f-4613-18af-08db58789234
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6442

DQoNCj4gT24gMTkgTWF5IDIwMjMsIGF0IDE1OjQ2LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAxOS8wNS8yMDIzIDE1OjI2LCBM
dWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+IE9uIDE4IE1heSAyMDIzLCBhdCAxMDozNSwgSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4+ICAgLyoNCj4+Pj4gICAgKiBDb21t
ZW50IGZyb20gTGludXg6DQo+Pj4+ICAgICogVXNlcnNwYWNlIG1heSBwZXJmb3JtIERDIFpWQSBp
bnN0cnVjdGlvbnMuIE1pc21hdGNoZWQgYmxvY2sgc2l6ZXMNCj4+Pj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9hcm02NC9zdmUtYXNtLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvc3ZlLWFzbS5T
DQo+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNGQx
NTQ5MzQ0NzMzDQo+Pj4+IC0tLSAvZGV2L251bGwNCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2Fy
bTY0L3N2ZS1hc20uUw0KPj4+PiBAQCAtMCwwICsxLDQ4IEBADQo+Pj4+ICsvKiBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICovDQo+Pj4+ICsvKg0KPj4+PiArICogQXJtIFNW
RSBhc3NlbWJseSByb3V0aW5lcw0KPj4+PiArICoNCj4+Pj4gKyAqIENvcHlyaWdodCAoQykgMjAy
MiBBUk0gTHRkLg0KPj4+PiArICoNCj4+Pj4gKyAqIFNvbWUgbWFjcm9zIGFuZCBpbnN0cnVjdGlv
biBlbmNvZGluZyBpbiB0aGlzIGZpbGUgYXJlIHRha2VuIGZyb20gbGludXggNi4xLjEsDQo+Pj4+
ICsgKiBmaWxlIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vZnBzaW1kbWFjcm9zLmgsIHNvbWUgb2Yg
dGhlbSBhcmUgYSBtb2RpZmllZA0KPj4+PiArICogdmVyc2lvbi4NCj4+PiBBRkFJQ1QsIHRoZSBv
bmx5IG1vZGlmaWVkIHZlcnNpb24gaXMgX3N2ZV9yZHZsLCBidXQgaXQgaXMgbm90IGNsZWFyIHRv
IG1lIHdoeSB3ZSB3b3VsZCB3YW50IHRvIGhhdmUgYSBtb2RpZmllZCB2ZXJzaW9uPw0KPj4+IA0K
Pj4+IEkgYW0gYXNraW5nIHRoaXMgYmVjYXVzZSB3aXRob3V0IGFuIGV4cGxhbmF0aW9uLCBpdCB3
b3VsZCBiZSBkaWZmaWN1bHQgdG8ga25vdyBob3cgdG8gcmUtc3luYyB0aGUgY29kZSB3aXRoIExp
bnV4Lg0KPj4gSW4gdGhpcyBwYXRjaCB0aGUgbWFjcm9zIGFyZSBleGFjdGx5IGVxdWFsIHRvIExp
bnV4LCBhcGFydCBmcm9tIHRoZSBjb2Rpbmcgc3R5bGUgdGhhdCB1c2VzIHNwYWNlcyBpbnN0ZWFk
IG9mIHRhYnMsDQo+PiBJIHdhcyBub3QgZXhwZWN0aW5nIHRvIGtlZXAgdGhlbSBpbiBzeW5jIGFz
IHRoZXkgc2VlbXMgdG8gYmUgbm90IHByb25lIHRvIGNoYW5nZSBzb29uLCBsZXQgbWUga25vdyBp
ZiBJIG5lZWQgdG8NCj4+IHVzZSBhbHNvIHRhYnMgYW5kIGJlIDEwMCUgZXF1YWwgdG8gTGludXgu
DQo+IA0KPiBUaGUgZmlsZSBpcyBzbWFsbCBlbm91Z2gsIHNvIEkgdGhpbmsgaXQgd291bGQgYmUg
T0sgaWYgdGhpcyBpcyBjb252ZXJ0ZWQgdG8gdGhlIFhlbiBjb2Rpbmcgc3R5bGUuDQo+IA0KPj4g
VGhlIGZvbGxvd2luZyBtYWNyb3MgdGhhdCBhcmUgY29taW5nIGluIHBhdGNoIDUgYXJlIGVxdWFs
IGFwYXJ0IGZyb20gc3ZlX3NhdmUvc3ZlX2xvYWQsIHRoYXQgYXJlIGRpZmZlcmVudCBiZWNhdXNl
DQo+PiBvZiB0aGUgY29uc3RydWN0aW9uIGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIHN0b3JhZ2Ug
YnVmZmVycyBoZXJlIGFuZCBpbiBMaW51eCwgaWYgeW91IHdhbnQgSSBjYW4gcHV0IGEgY29tbWVu
dCBvbiB0aGVtDQo+PiB0byBleHBsYWluIHRoaXMgZGlmZmVyZW5jZSBpbiBwYXRjaCA1DQo+IA0K
PiBUaGF0IHdvdWxkIGJlIGdvb2QuIEFsc28sIGNhbiB5b3UgdXBkYXRlIGFyY2gvYXJtL1JFQURN
RS5MaW51eFByaW1pdGl2ZXM/IFRoZSBmaWxlIGlzIGxpc3RpbmcgcHJpbWl0aXZlcyBpbXBvcnRl
ZCBmcm9tIExpbnV4IGFuZCB3aGVuLg0KDQpTdXJlIEkgd2lsbA0KDQo+IA0KPj4+PiANCj4+Pj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9zdmUuYyBiL3hlbi9hcmNoL2FybS9hcm02
NC9zdmUuYw0KPj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4+PiBpbmRleCAwMDAwMDAwMDAw
MDAuLjZmM2ZiMzY4YzU5Yg0KPj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4+ICsrKyBiL3hlbi9hcmNo
L2FybS9hcm02NC9zdmUuYw0KPj4+PiBAQCAtMCwwICsxLDUwIEBADQo+Pj4+ICsvKiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLw0KPj4+IA0KPj4+IEFib3ZlLCB5b3UgYXJlIHVz
aW5nIEdQTC0yLjAtb25seSwgYnV0IGhlcmUgR1BMLTIuMC4gV2UgZmF2b3IgdGhlIGZvcm1lciBu
b3cuIEhhcHB5IHRvIGRlYWwgaXQgb24gY29tbWl0IGlmIHRoZXJlIGlzIG5vdGhpbmcgZWxzZSB0
byBhZGRyZXNzLg0KPj4gTm8gcHJvYmxlbSwgSSB3aWxsIGZpeCBpbiB0aGUgbmV4dCBwdXNoDQo+
Pj4gDQo+Pj4+ICsvKg0KPj4+PiArICogQXJtIFNWRSBmZWF0dXJlIGNvZGUNCj4+Pj4gKyAqDQo+
Pj4+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjIgQVJNIEx0ZC4NCj4+Pj4gKyAqLw0KPj4+PiArDQo+
Pj4+ICsjaW5jbHVkZSA8eGVuL3R5cGVzLmg+DQo+Pj4+ICsjaW5jbHVkZSA8YXNtL2FybTY0L3N2
ZS5oPg0KPj4+PiArI2luY2x1ZGUgPGFzbS9hcm02NC9zeXNyZWdzLmg+DQo+Pj4+ICsjaW5jbHVk
ZSA8YXNtL3Byb2Nlc3Nvci5oPg0KPj4+PiArI2luY2x1ZGUgPGFzbS9zeXN0ZW0uaD4NCj4+Pj4g
Kw0KPj4+PiArZXh0ZXJuIHVuc2lnbmVkIGludCBzdmVfZ2V0X2h3X3ZsKHZvaWQpOw0KPj4+PiAr
DQo+Pj4+ICtyZWdpc3Rlcl90IGNvbXB1dGVfbWF4X3pjcih2b2lkKQ0KPj4+PiArew0KPj4+PiAr
ICAgIHJlZ2lzdGVyX3QgY3B0cl9iaXRzID0gZ2V0X2RlZmF1bHRfY3B0cl9mbGFncygpOw0KPj4+
PiArICAgIHJlZ2lzdGVyX3QgemNyID0gdmxfdG9femNyKFNWRV9WTF9NQVhfQklUUyk7DQo+Pj4+
ICsgICAgdW5zaWduZWQgaW50IGh3X3ZsOw0KPj4+PiArDQo+Pj4+ICsgICAgLyogUmVtb3ZlIHRy
YXAgZm9yIFNWRSByZXNvdXJjZXMgKi8NCj4+Pj4gKyAgICBXUklURV9TWVNSRUcoY3B0cl9iaXRz
ICYgfkhDUFRSX0NQKDgpLCBDUFRSX0VMMik7DQo+Pj4+ICsgICAgaXNiKCk7DQo+Pj4+ICsNCj4+
Pj4gKyAgICAvKg0KPj4+PiArICAgICAqIFNldCB0aGUgbWF4aW11bSBTVkUgdmVjdG9yIGxlbmd0
aCwgZG9pbmcgdGhhdCB3ZSB3aWxsIGtub3cgdGhlIFZMDQo+Pj4+ICsgICAgICogc3VwcG9ydGVk
IGJ5IHRoZSBwbGF0Zm9ybSwgY2FsbGluZyBzdmVfZ2V0X2h3X3ZsKCkNCj4+Pj4gKyAgICAgKi8N
Cj4+Pj4gKyAgICBXUklURV9TWVNSRUcoemNyLCBaQ1JfRUwyKTsNCj4+PiANCj4+PiBGcm9tIG15
IHJlYWRpbmcgb2YgdGhlIEFybSAoRDE5LTYzMzEsIEFSTSBEREkgMDQ4N0ouYSksIGEgZGlyZWN0
IHdyaXRlIHRvIGEgc3lzdGVtIHJlZ2lzdGVyIHdvdWxkIG5lZWQgdG8gYmUgZm9sbG93ZWQgYnkg
YW4gY29udGV4dCBzeW5jaHJvbml6YXRpb24gZXZlbnQgKGUuZy4gaXNiKCkpIGJlZm9yZSB0aGUg
c29mdHdhcmUgY2FuIHJlbHkgb24gdGhlIHZhbHVlLg0KPj4+IA0KPj4+IEluIHRoaXMgc2l0dWF0
aW9uLCBBRkFJQ1QsIHRoZSBpbnN0cnVjaXRvbiBpbiBzdmVfZ2V0X2h3X3ZsKCkgd2lsbCB1c2Ug
dGhlIGNvbnRlbnQgb2YgWkNSX0VMMi4gU28gZG9uJ3Qgd2UgbmVlZCBhbiBJU0IoKSBoZXJlPw0K
Pj4gRnJvbSB3aGF0IEnigJl2ZSByZWFkIGluIHRoZSBtYW51YWwgZm9yIFpDUl9FTHg6DQo+PiBB
biBpbmRpcmVjdCByZWFkIG9mIFpDUl9FTDIuTEVOIGFwcGVhcnMgdG8gb2NjdXIgaW4gcHJvZ3Jh
bSBvcmRlciByZWxhdGl2ZSB0byBhIGRpcmVjdCB3cml0ZSBvZg0KPj4gdGhlIHNhbWUgcmVnaXN0
ZXIsIHdpdGhvdXQgdGhlIG5lZWQgZm9yIGV4cGxpY2l0IHN5bmNocm9uaXphdGlvbg0KPj4gSeKA
mXZlIGludGVycHJldGVkIGl0IGFzIOKAnHRoZXJlIGlzIG5vIG5lZWQgdG8gc3luYyBiZWZvcmUg
d3JpdGXigJ0gYW5kIEnigJl2ZSBsb29rZWQgaW50byBMaW51eCBhbmQgaXQgZG9lcyBub3QNCj4+
IEFwcGVhciBhbnkgc3luY2hyb25pc2F0aW9uIG1lY2hhbmlzbSBhZnRlciBhIHdyaXRlIHRvIHRo
YXQgcmVnaXN0ZXIsIGJ1dCBpZiBJIGFtIHdyb25nIEkgY2FuIGZvciBzdXJlDQo+PiBhZGQgYW4g
aXNiIGlmIHlvdSBwcmVmZXIuDQo+IA0KPiBBaCwgSSB3YXMgcmVhZGluZyB0aGUgZ2VuZXJpYyBz
ZWN0aW9uIGFib3V0IHN5bmNocm9uaXphdGlvbiBhbmQgZGlkbid0IHJlYWxpemUgdGhlcmUgd2Fz
IGEgcGFyYWdyYXBoIGluIHRoZSBaQ1JfRUwyIHNlY3Rpb24gYXMgd2VsbC4NCj4gDQo+IFJlYWRp
bmcgdGhlIG5ldyBzZWN0aW9uLCBJIGFncmVlIHdpdGggeW91ciB1bmRlcnN0YW5kaW5nLiBUaGUg
aXNiKCkgaXMgbm90IG5lY2Vzc2FyeS4NCj4gDQo+IFNvIHBsZWFzZSBpZ25vcmUgdGhpcyBjb21t
ZW50IDopLg0KPiANCj4+Pj4gICAgICAvKiBYWFggTVBVICovDQo+Pj4+ICAgICAgICAvKiBGYXVs
dCBTdGF0dXMgKi8NCj4+Pj4gQEAgLTIzNCw2ICsyMzEsNyBAQCBzdGF0aWMgdm9pZCBjdHh0X3N3
aXRjaF90byhzdHJ1Y3QgdmNwdSAqbikNCj4+Pj4gICAgICBwMm1fcmVzdG9yZV9zdGF0ZShuKTsN
Cj4+Pj4gICAgICAgIC8qIENvbnRyb2wgUmVnaXN0ZXJzICovDQo+Pj4+ICsgICAgV1JJVEVfU1lT
UkVHKG4tPmFyY2guY3B0cl9lbDIsIENQVFJfRUwyKTsNCj4+PiANCj4+PiBJIHdvdWxkIHByZWZl
ciBpZiB0aGlzIGNhbGxlZCBjbG9zZXIgdG8gdmZwX3Jlc3RvcmVfc3RhdGUoKS4gU28gdGhlIGRl
cGVuZGVuY3kgYmV0d2VlbiB0aGUgdHdvIGlzIGVhc2llciB0byBzcG90Lg0KPj4+IA0KPj4+PiAg
ICAgIFdSSVRFX1NZU1JFRyhuLT5hcmNoLmNwYWNyLCBDUEFDUl9FTDEpOw0KPj4+PiAgICAgICAg
LyoNCj4+Pj4gQEAgLTI1OCw2ICsyNTYsOSBAQCBzdGF0aWMgdm9pZCBjdHh0X3N3aXRjaF90byhz
dHJ1Y3QgdmNwdSAqbikNCj4+Pj4gICNlbmRpZg0KPj4+PiAgICAgIGlzYigpOw0KPj4+PiAgKyAg
ICAvKiBWRlAgKi8NCj4+PiANCj4+PiBQbGVhc2UgZG9jdW1lbnQgaW4gdGhlIGNvZGUgdGhhdCB2
ZnBfcmVzdG9yZV9zdGF0ZSgpIGhhdmUgdG8gYmUgY2FsbGVkIGFmdGVyIENQVFJfRUwyKCkgKyBh
IHN5bmNocm9uaXphdGlvbiBldmVudC4NCj4+PiANCj4+PiBTaW1pbGFyIGRvY291bWVudGF0aW9u
IG9uIHRvcCBvZiBhdCBsZWFzdCBDUFRSX0VMMiBhbmQgcG9zc2libHkgaXNiKCkuIFRoaXMgd291
bGQgaGVscCBpZiB3ZSBuZWVkIHRvIHJlLW9yZGVyIHRoZSBjb2RlIGluIHRoZSBmdXR1cmUuDQo+
PiBJIHdpbGwgcHV0IGNvbW1lbnRzIG9uIHRvcCBvZiBDUFRSX0VMMiBhbmQgdmZwX3Jlc3RvcmVf
c3RhdGUgdG8gZXhwbGFpbiB0aGUgc2VxdWVuY2UgYW5kIHRoZSBzeW5jaHJvbmlzYXRpb24uDQo+
IA0KPiBKdXN0IHRvIGNsYXJpZnksIGRvZXMgdGhpcyBtZWFuIHlvdSB3aWxsIGtlZXAgQ1BUUl9F
TDIgd2hlcmUgaXQgY3VycmVudGx5IGlzPyAoU2VlIG15IGNvbW1lbnQganVzdCBhYm92ZSBpbiB0
aGUgcHJldmlvdXMgZS1tYWlsKQ0KDQpUaGlzIGlzIGhvdyBJIGNoYW5nZWQgdGhlIGNvZGU6DQoN
Ci8qIENvbnRyb2wgUmVnaXN0ZXJzICovDQovKg0KKiBDUFRSX0VMMiBuZWVkcyB0byBiZSB3cml0
dGVuIGJlZm9yZSBjYWxsaW5nIHZmcF9yZXN0b3JlX3N0YXRlLCBhDQoqIHN5bmNocm9uaXphdGlv
biBpbnN0cnVjdGlvbiBpcyBleHBlY3RlZCBhZnRlciB0aGUgd3JpdGUgKGlzYikNCiovDQpXUklU
RV9TWVNSRUcobi0+YXJjaC5jcHRyX2VsMiwgQ1BUUl9FTDIpOw0KV1JJVEVfU1lTUkVHKG4tPmFy
Y2guY3BhY3IsIENQQUNSX0VMMSk7DQoNCi8qDQoqIFRoaXMgd3JpdGUgdG8gc3lzcmVnIENPTlRF
WFRJRFJfRUwxIGVuc3VyZXMgd2UgZG9uJ3QgaGl0IGVycmF0dW0NCiogIzg1MjUyMyAoQ29ydGV4
LUE1Nykgb3IgIzg1MzcwOSAoQ29ydGV4LUE3MikuDQoqIEkuZSBEQUNSMzJfRUwyIGlzIG5vdCBj
b3JyZWN0bHkgc3luY2hyb25pemVkLg0KKi8NCldSSVRFX1NZU1JFRyhuLT5hcmNoLmNvbnRleHRp
ZHIsIENPTlRFWFRJRFJfRUwxKTsNCldSSVRFX1NZU1JFRyhuLT5hcmNoLnRwaWRyX2VsMCwgVFBJ
RFJfRUwwKTsNCldSSVRFX1NZU1JFRyhuLT5hcmNoLnRwaWRycm9fZWwwLCBUUElEUlJPX0VMMCk7
DQpXUklURV9TWVNSRUcobi0+YXJjaC50cGlkcl9lbDEsIFRQSURSX0VMMSk7DQoNCmlmICggaXNf
MzJiaXRfZG9tYWluKG4tPmRvbWFpbikgJiYgY3B1X2hhc190aHVtYmVlICkNCnsNCldSSVRFX1NZ
U1JFRyhuLT5hcmNoLnRlZWNyLCBURUVDUjMyX0VMMSk7DQpXUklURV9TWVNSRUcobi0+YXJjaC50
ZWVoYnIsIFRFRUhCUjMyX0VMMSk7DQp9DQoNCiNpZmRlZiBDT05GSUdfQVJNXzMyDQpXUklURV9D
UDMyKG4tPmFyY2guam9zY3IsIEpPU0NSKTsNCldSSVRFX0NQMzIobi0+YXJjaC5qbWNyLCBKTUNS
KTsNCiNlbmRpZg0KaXNiKCk7DQoNCi8qIFZGUCAtIGNhbGwgdmZwX3Jlc3RvcmVfc3RhdGUgYWZ0
ZXIgd3JpdGluZyBvbiBDUFRSX0VMMiArIGlzYiAqLw0KdmZwX3Jlc3RvcmVfc3RhdGUobik7DQoN
Ck1heWJlIEkgbWlzdW5kZXJzdG9vZCB5b3VyIHByZWZlcmVuY2UsIGRvIHlvdSB3YW50IG1lIHRv
IHB1dCB0aGUgd3JpdGUgdG8gQ1BUUl9FTDINCnJpZ2h0IGJlZm9yZSB0aGUgaXNiKCkgdGhhdCBw
cmVjZWRlcyB2ZnBfcmVzdG9yZV9zdGF0ZT8NCg0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSAN
Cj4gSnVsaWVuIEdyYWxsDQoNCg==

