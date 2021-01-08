Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C062EF19B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 12:51:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63388.112566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxqHy-0005Gu-2y; Fri, 08 Jan 2021 11:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63388.112566; Fri, 08 Jan 2021 11:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxqHx-0005GW-Vr; Fri, 08 Jan 2021 11:50:41 +0000
Received: by outflank-mailman (input) for mailman id 63388;
 Fri, 08 Jan 2021 11:50:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eC+b=GL=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kxqHv-0005GN-SL
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 11:50:40 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.88]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be57810f-f298-4eff-9310-3a9b27cb67cd;
 Fri, 08 Jan 2021 11:50:36 +0000 (UTC)
Received: from AM6P193CA0079.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::20)
 by HE1PR0802MB2297.eurprd08.prod.outlook.com (2603:10a6:3:ce::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 11:50:33 +0000
Received: from VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::26) by AM6P193CA0079.outlook.office365.com
 (2603:10a6:209:88::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 11:50:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT059.mail.protection.outlook.com (10.152.19.60) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 11:50:32 +0000
Received: ("Tessian outbound 76bd5a04122f:v71");
 Fri, 08 Jan 2021 11:50:32 +0000
Received: from d80e15621b01.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 07B86CAB-B7CF-43A3-B68A-AD8FFC0CD938.1; 
 Fri, 08 Jan 2021 11:50:27 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d80e15621b01.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Jan 2021 11:50:27 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com (2603:10a6:208:105::24)
 by AM0PR08MB5108.eurprd08.prod.outlook.com (2603:10a6:208:15e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.9; Fri, 8 Jan
 2021 11:50:22 +0000
Received: from AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::61dc:45c4:eef0:c88f]) by AM0PR08MB3747.eurprd08.prod.outlook.com
 ([fe80::61dc:45c4:eef0:c88f%6]) with mapi id 15.20.3721.024; Fri, 8 Jan 2021
 11:50:22 +0000
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
X-Inumbo-ID: be57810f-f298-4eff-9310-3a9b27cb67cd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfnNTMwcHHSPVRh8ieOd0qKdLiNn1oFTui9nLtxgof4=;
 b=DRkbIGBvkPUFP4qBgY8CjvrnE0A2f398olfp6xGI4xe38Mz9Y2L7j+NMNscAYqk1D/pb9oJhprdpCf97dJzlDDPpVW/MDnMvHqLPglSMmG5b60fF6+z3piQqTRUJULXQS9Qzv2AKd6r6YBwvWs/CIjEuXOJKSFE6+uI8xx/JYJE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlD1sEckiSnR4Dn4qQRbBOsbD1YhP+EjhmnU0a5bB964JgZpGN21+RT+NoVkmvVkLAvOojSCBErpQf6jOvbrcai11C0+yVAtmcOZRT2kqaxDq9NBi/rk+f761aLMTd3a/rjOabdTZihyi2FdZU5KeQwIUh17ZcOaoIusFhjh0wDcu6vwKoPEh/KwWXSRYWC20wGtMb9qN0Zvap3fywq6DTRrKRHtp1CqP+8yQ8LX3pZ5dnX8fgeZyAE8gF/1kKsmK11EJ+t4tvm5LWWCebjPBk5FF9eusYoC4OHrs5FcwdUUJDSAuVh5rqVJah8VnLGIlaYhjRiF+GQS3YF3nJ3qHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfnNTMwcHHSPVRh8ieOd0qKdLiNn1oFTui9nLtxgof4=;
 b=Wvdo43oSraqfPUSWkxr8Gg/BtFs1Vn8UWmsLM0sjUvx+PyquE8GFwAq0PQfEGpKGqFFWcYlQ49VWOgd4G3nGSW704wB/vRVvdp4HNXz1Nzy9X8fC0qwOiyKR1aDXztAzZIrL6rLMEI99hSiSyFxd0OXS9yCtNnz8wMkicPgv/cd20HDLzZTM4Ctuc52lNasLorKyXVU9O5NSZq0se627/Dla6lvBV/WJXiGqtYQ9JLLbMYoMl90vH1/AAUagszldsP+74CuC8RG9caMTKjvgI6OjLawlqc+OLb4r029mBu47CjGtLs5UVEAqCol5mUnHwEHynizzxsVuvgmZv8sL8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfnNTMwcHHSPVRh8ieOd0qKdLiNn1oFTui9nLtxgof4=;
 b=DRkbIGBvkPUFP4qBgY8CjvrnE0A2f398olfp6xGI4xe38Mz9Y2L7j+NMNscAYqk1D/pb9oJhprdpCf97dJzlDDPpVW/MDnMvHqLPglSMmG5b60fF6+z3piQqTRUJULXQS9Qzv2AKd6r6YBwvWs/CIjEuXOJKSFE6+uI8xx/JYJE=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Jiamei Xie <Jiamei.Xie@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH v2] xen/arm: Using unsigned long for arm64 MPIDR mask
Thread-Topic: [PATCH v2] xen/arm: Using unsigned long for arm64 MPIDR mask
Thread-Index: AQHW5Ye9XXgp495RdU+wSLeevk0NB6odnJIAgAAAs7A=
Date: Fri, 8 Jan 2021 11:50:22 +0000
Message-ID:
 <AM0PR08MB3747169FD88CFD00C5E38A039EAE0@AM0PR08MB3747.eurprd08.prod.outlook.com>
References: <20210108062953.2335932-1-wei.chen@arm.com>
 <a11a8270-68ab-066f-7799-511e72869e95@xen.org>
In-Reply-To: <a11a8270-68ab-066f-7799-511e72869e95@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 712C534C85C9604BB5E87447A3CEF01E.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [116.230.239.117]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 96a9cdc0-a881-4bc6-1716-08d8b3cb9aab
x-ms-traffictypediagnostic: AM0PR08MB5108:|HE1PR0802MB2297:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB229790627EC3412D4E573AC39EAE0@HE1PR0802MB2297.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nTGld9Le7Td75Eu/dAbMPtPivfq25fpGmxHCsbj8soDwBrwy/MB3zUDECOS8dna7iteb+9Q5x0NQH4ny2oR5ONQNveUOwYRh7B2CWT+/V4utdChtC/Pwj5fbr1JXrsrmLkXJjrYcjr+WvDfgc7ynqNZygLiSLlXyGz5rjDMp2eFxfJ5vWNjKkByIvnLHXr8DwFScEYnbySQhu/EXp63IvUzftJOhzRSAhRBi5DhGzUQFnKwCTt16mXIyvbss81JOg6KPtkjbtDVLawGBvTVJxUiKT6aKv8pcywLA13D6O+uMDe/T5wfE4PffakTFmmleSLKt4EryNdNaoQjrndaGBHVVZIZ2TzXdbQY1fH97qOmNo0rmIFeNnBouo6KUSVJtVVf/GbZneYEP0wcitgnlQg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3747.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39840400004)(376002)(366004)(396003)(316002)(26005)(2906002)(83380400001)(53546011)(5660300002)(66946007)(52536014)(186003)(66476007)(66446008)(110136005)(7696005)(8676002)(54906003)(66556008)(64756008)(6506007)(4326008)(76116006)(478600001)(71200400001)(86362001)(8936002)(9686003)(55016002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?K0JDbjBsMzdBNXpCbWtEdjg2YXM1VzVzZ0F6WTN0WmlMZUFUQ1VnWkVIR2NU?=
 =?utf-8?B?a21jSmpWcFBEby9YYW5MdU5ORXBZUFRaUGRmYU13MHBzR0lHbUJMWFl6MC9O?=
 =?utf-8?B?L25YczVRV002MVBmZUZEbW1PMWxjTmQzUW5JY0NVREQvTFR0R1lpM1JxYXI0?=
 =?utf-8?B?WXNEKzAvQkZ6MWpUY2QzSi9RWFVPZGp4Ykh0Rnd4dW1JbjFMZlp3ZXZ3RUN0?=
 =?utf-8?B?SmlXSlJDelBhSlh1RSt6b1BvdlMzWms4NEZYcGR0S1g3Nk9JYUN3V0daY3VZ?=
 =?utf-8?B?UmdGWUR6aXVneWFaYW43OE1pSFlEbUdOaXFEcUdjRXBTSjI4ZUtWRW1hZ2VD?=
 =?utf-8?B?d3llb1ovaHNkcm8rUndSZ0QzTWFPc05mM2hUNHh3eW9mY3pKNVRybVhIUThQ?=
 =?utf-8?B?V1J5NmtzYzJqQ05mc3hHSkpMVHdPL1F4a1B6Rm5BZTkvZDcvSExnaG1OaFhQ?=
 =?utf-8?B?TzhTMUFHMmZZK1ZXM3IwTXdlMWlPY0JlTkxHZEtoa0RYSFZSZW0vSHZFS2g3?=
 =?utf-8?B?MHBHRFBQOVdpT0Y2MjY1ZXorUmtYNVIwcGFZZXFrWjJSSXVwU1huODc1R2VJ?=
 =?utf-8?B?QnVFaGlEVXFCaDl3UnFwMU9JZytrWDloRHo3L1g3QVF6T2FxZ2hIT3gwcTZO?=
 =?utf-8?B?ajh6ZXMyVHpuMythdDB1THRUY05EQ3FHblNwa2JXVlVGcS85dTVCbmFSdlNn?=
 =?utf-8?B?TVk0dUxtSlhIVWJJelVQL25zam5qTkJENllQM0dYU2dpV1lpWVEyeWNJN3RB?=
 =?utf-8?B?RkpVRGhQMm1RYkFuK1poemRyazRjRmNwU0E2TGgvbWdBdHAwUEY1L3hHb25r?=
 =?utf-8?B?d0I3b2JTNUo2T0ZlS1RoRVltUFUwV25jTHloN3BtelVtNGFTRVpLaUo3Mng0?=
 =?utf-8?B?RzQzaWtEMnZOOUVVcEhHK3Y5c05hU2N0QTAxVVBDUXY2V3ZIT2NDbWtoWmh6?=
 =?utf-8?B?c2VGMlVYZ0tIaFBOU1lTcjRCWDk3UDRYOENOeWZkcnFKMS95cmlFdHk5eEgw?=
 =?utf-8?B?QW5uMGpOREhSQlVISVAwdU8yem0yck9hZllrNnFXK21EU0J2a21HaEdLam1M?=
 =?utf-8?B?WmdJK2tZYmlLWFk4Vkh4MDlmL21rWFQzMHZsdUhCelkwYXhXeU1DN2dUVHRF?=
 =?utf-8?B?b3hPSFF2OUNZcEpHMmY0OTQyb1NYNXVmUDk5WkxxUERINkFwaUthM1ZiYjRO?=
 =?utf-8?B?MTdjYzUyTkhHZG1mNEVndmFDM1BiTXN3M2lwaXNBRVUyMGF5ZXg0WkFJVi84?=
 =?utf-8?B?NkZVWm92c203cnB0bHJNRkF6aHNXRTlCdmZBWDVkNkw3L0RGWFJtSS9uVnhM?=
 =?utf-8?Q?1fpIwiS6DCg14=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5108
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7b687049-24e7-4c8a-5bd5-08d8b3cb94a9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HRr5eJEIaQTFOJnvEpRcY6WdsNpBgugcSWxUi++L/NC1JDC9x2cM4wOCjj7XRo1S5++yRy07rQUx+T+8kxtVfFiEFegmmd/SG7xaoNfRYPvK0sCDMRmruc8PjfFuk0RlkCg91gSgo5AHFvdEuJ0a4gN/9ohvttyLU2A70abG/qndXvpnKIU/+CsRUYDoiqeEaFOHB0Kc+s5Fh9ORNDHgeLf8oDsp8HbJ/5q3mNQ8TzuYaXXLoINdkIYnFMcx02XodMELZqbara0oLrhuytl1iA78gViD4YJQFWrH6Ia7IdxBHgVUDm41L5PpmMyHYQdKdnNtsPjRcNpqBHUfKJUljujCnP9OFDdy+CLbtDUofZXIpGYhlAIwZU1UCjz2V6GcPhY9twC9IHBiFyEvZAfzo2o3uPq7js9Zhhad0nh6xfnQ1TmLUTeq3xWcaKCeE2/AiSGriuTDz92JMTKsn29clwuxZQMpyH/2fml0nwM157Ijz/g9AKwzoYNWV4UuB6co
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966006)(8676002)(70206006)(70586007)(34020700004)(186003)(82310400003)(83380400001)(81166007)(356005)(82740400003)(2906002)(478600001)(336012)(33656002)(52536014)(5660300002)(86362001)(6506007)(110136005)(55016002)(7696005)(4326008)(316002)(47076005)(54906003)(9686003)(53546011)(8936002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 11:50:32.6302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a9cdc0-a881-4bc6-1716-08d8b3cb9aab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2297

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogMjAyMeW5tDHmnIg45pelIDE5OjQ2DQo+
IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZzsNCj4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZw0KPiBDYzogQmVydHJhbmQgTWFycXVp
cyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgUGVubnkgWmhlbmcNCj4gPFBlbm55LlpoZW5n
QGFybS5jb20+OyBKaWFtZWkgWGllIDxKaWFtZWkuWGllQGFybS5jb20+OyBuZA0KPiA8bmRAYXJt
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0geGVuL2FybTogVXNpbmcgdW5zaWduZWQg
bG9uZyBmb3IgYXJtNjQgTVBJRFIgbWFzaw0KPiANCj4gSGkgV2VpLA0KPiANCj4gSG93IGFib3V0
IHRoZSBmb2xsb3dpbmcgdGl0bGU6DQo+IA0KPiAieGVuL2FybTogRG9uJ3QgaWdub3JlIHRoZSBh
ZmZpbml0eSBsZXZlbCAzIGluIHRoZSBNUElEUiINCj4gDQoNClRoaXMgdGl0bGUgbWFrZXMgbW9y
ZSBzZW5zZS4NCg0KPiBPbiAwOC8wMS8yMDIxIDA2OjI5LCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBD
dXJyZW50bHksIFhlbiBpcyB1c2luZyBVSU5UMzIgZm9yIE1QSURSIG1hc2sgdG8gcmV0cmlldmUN
Cj4gPiBhZmZpbml0eVswLDEsMiwzXSB2YWx1ZXMgZm9yIE1QSURSX0VMMSByZWdpc3Rlci4gVGhl
IHZhbHVlDQo+ID4gb2YgTVBJRFJfRUwxIGlzIDY0LWJpdCB1bnNpZ25lZCBsb25nLiA+IFRoZSAz
Mi1iaXQgdW5zaW5nZWQNCj4gDQo+IHMvdW5zaW5nZWQvdW5zaWduZWQvDQo+IA0KDQp0aGFua3Mu
DQoNCj4gPiBpbnRlZ2VyIHdpbGwgZG8gdW5zaWduZWQgZXh0ZW5kIHdoaWxlIGRvaW5nIHNvbWUg
b3BlcmF0aW9ucw0KPiA+IHdpdGggNjQtYml0IHVuc2lnbmVkIGludGVnZXIuIFRoaXMgY2FuIGxl
YWQgdG8gdW5leHBlY3RlZA0KPiA+IHJlc3VsdCBpbiBzb21lIHVzZSBjYXNlcy4NCj4gPg0KPiA+
IEZvciBleGFtcGxlLCBpbiBnaWN2M19zZW5kX3NnaV9saXN0IG9mIEdJQ3YzIGRyaXZlcjoNCj4g
PiB1aW50NjRfdCBjbHVzdGVyX2lkID0gY3B1X2xvZ2ljYWxfbWFwKGNwdSkgJiB+TVBJRFJfQUZG
MF9NQVNLOw0KPiA+DQo+ID4gV2hlbiBNUElEUl9BRkYwX01BU0sgaXMgMHhGRlUsIGNvbXBpbGVy
IG91dHB1dDoNCj4gPiAgICAgIGY3YzogOTI3ODVjMTYgYW5kIHgyMiwgeDAsICMweGZmZmZmZjAw
DQo+ID4gV2hlbiBNUElEUl9BRkYwX01BU0sgaXMgMHhGRlVMLCBjb21waWxlciBvdXRwdXQ6DQo+
ID4gICAgICBmODg6IDkyNzhkYzc1IGFuZCB4MjEsIHgzLCAjMHhmZmZmZmZmZmZmZmZmZjAwDQo+
ID4NCj4gPiBJZiBjcHVfbG9naWNhbF9tYXAoY3B1KSA9IDB4MTAwMDAwMDAwVUwgYW5kIE1QSURS
X0FGRjBfTUFTSyBpcw0KPiA+IDB4RkZVLCB0aGUgY2x1c3Rlcl9pZCByZXR1cm5zIDAuIEJ1dCB0
aGUgZXhwZWN0ZWQgdmFsdWUgc2hvdWxkDQo+ID4gYmUgMHgxMDAwMDAwMDAuDQo+ID4NCj4gPiBT
bywgaW4gdGhpcyBwYXRjaCwgd2UgZm9yY2UgYWFyY2g2NCB0byB1c2UgdW5zaWduZWQgbG9uZw0K
PiA+IGFzIE1QSURSIG1hc2sgdG8gYXZvaWQgc3VjaCB1bmV4cGVjdGVkIHJlc3VsdHMuDQo+IA0K
PiBIb3cgYWJvdXQgdGhlIGZvbGxvd2luZyBjb21taXQgbWVzc2FnZToNCj4gDQo+ICJDdXJyZW50
bHksIFhlbiBpcyBjb25zaWRlcmluZyB0aGF0IGFsbCB0aGUgYWZmaW5pdHkgYml0cyBhcmUgZGVm
aW5lZA0KPiBiZWxvdyAzMi1iaXQuIEhvd2V2ZXIsIEFybTY0IGRlZmluZSBhIDNyZCBsZXZlbCBh
ZmZpbml0eSBpbiBiaXRzIDMyLTM5Lg0KPiANCj4gVGhlIGZ1bmN0aW9uIGdpY3YzX3NlbmRfc2dp
X2xpc3QgaW4gdGhlIEdJQ3YzIGRyaXZlciB3aWxsIGNvbXB1dGUgdGhlDQo+IGNsdXNlciB1c2lu
ZyB0aGUgZm9sbG93aW5nIGNvZGU6DQo+IA0KPiB1aW50NjRfdCBjbHVzdGVyX2lkID0gY3B1X2xv
Z2ljYWxfbWFwKGNwdSkgJiB+TVBJRFJfQUZGMF9NQVNLOw0KPiANCj4gQmVjYXVzZSBNUElEUl9B
RkYwX01BU0sgaXMgZGVmaW5lZCBhcyBhIDMyLWJpdCB2YWx1ZSwgd2Ugd2lsbCBtaXNzIG91dA0K
PiB0aGUgM3JkIGxldmVsIGFmZmluaXR5LiBBcyBhIGNvbnNlcXVlbmNlLCB0aGUgSVBJIHdvdWxk
IG5vdCBiZSBzZW50IHRvDQo+IHRoZSBjb3JyZWN0IHZDUFUuDQo+IA0KPiBUaGlzIHBhcnRpY3Vs
YXIgZXJyb3IgY2FuIGJlIHNvbHZlZCBieSBzd2l0Y2hpbmcgTVBJRFJfQUZGMF9NQVNLIHRvIHVz
ZQ0KPiB1bnNpZ25lZCBsb25nLiBIb3dldmVyLCB0YWtlIHRoZSBvcHBvcnR1bml0eSB0byBzd2l0
Y2ggYWxsIHRoZSBNUElEUl8qDQo+IGRlZmluZSB0byB1c2UgdW5zaWduZWQgbG9uZyB0byBhdm9p
ZCBhbnltb3JlIGlzc3VlLg0KPiAiDQo+IA0KPiBJIGNhbiB1cGRhdGUgdGhlIGNvbW1pdCBtZXNz
YWdlIHdoaWxlIGNvbW1pdHRpbmcgaWYgeW91IGFyZSBoYXBweSB3aXRoIGl0Lg0KPiANCg0KWWVz
LCB0aGF0IHdvdWxkIGJlIGdvb2QsIHRoYW5rIHlvdSB2ZXJ5IG11Y2ggOiApDQoNCj4gQ2hlZXJz
LA0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29t
Pg0KPiANCj4gDQo+ID4gLS0tDQo+ID4gdjEgLT4gdjI6DQo+ID4gMS4gUmVtb3ZlIGluYWNjdXJh
dGUgZGVzY3JpcHRpb25zDQo+ID4gMi4gVXBkYXRlIGV4YW1wbGUgZGVzY3JpcHRpb24NCj4gPg0K
PiA+IC0tLQ0KPiA+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNzb3IuaCB8IDYgKysrLS0t
DQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcHJvY2Vzc29yLmggYi94
ZW4vaW5jbHVkZS9hc20tDQo+IGFybS9wcm9jZXNzb3IuaA0KPiA+IGluZGV4IDg3YzgxMzYwMjIu
LjVjMTc2OGNkZWMgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNz
b3IuaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vcHJvY2Vzc29yLmgNCj4gPiBAQCAt
NzUsMTEgKzc1LDExIEBADQo+ID4NCj4gPiAgIC8qIE1QSURSIE11bHRpcHJvY2Vzc29yIEFmZmlu
aXR5IFJlZ2lzdGVyICovDQo+ID4gICAjZGVmaW5lIF9NUElEUl9VUCAgICAgICAgICAgKDMwKQ0K
PiA+IC0jZGVmaW5lIE1QSURSX1VQICAgICAgICAgICAgKF9BQygxLFUpIDw8IF9NUElEUl9VUCkN
Cj4gPiArI2RlZmluZSBNUElEUl9VUCAgICAgICAgICAgIChfQUMoMSxVTCkgPDwgX01QSURSX1VQ
KQ0KPiA+ICAgI2RlZmluZSBfTVBJRFJfU01QICAgICAgICAgICgzMSkNCj4gPiAtI2RlZmluZSBN
UElEUl9TTVAgICAgICAgICAgIChfQUMoMSxVKSA8PCBfTVBJRFJfU01QKQ0KPiA+ICsjZGVmaW5l
IE1QSURSX1NNUCAgICAgICAgICAgKF9BQygxLFVMKSA8PCBfTVBJRFJfU01QKQ0KPiA+ICAgI2Rl
ZmluZSBNUElEUl9BRkYwX1NISUZUICAgICgwKQ0KPiA+IC0jZGVmaW5lIE1QSURSX0FGRjBfTUFT
SyAgICAgKF9BQygweGZmLFUpIDw8IE1QSURSX0FGRjBfU0hJRlQpDQo+ID4gKyNkZWZpbmUgTVBJ
RFJfQUZGMF9NQVNLICAgICAoX0FDKDB4ZmYsVUwpIDw8IE1QSURSX0FGRjBfU0hJRlQpDQo+ID4g
ICAjaWZkZWYgQ09ORklHX0FSTV82NA0KPiA+ICAgI2RlZmluZSBNUElEUl9IV0lEX01BU0sgICAg
IF9BQygweGZmMDBmZmZmZmYsVUwpDQo+ID4gICAjZWxzZQ0KPiA+IC0tDQo+ID4gMi4yNS4xDQo+
ID4NCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

