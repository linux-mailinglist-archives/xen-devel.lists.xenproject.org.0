Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A7367FD17
	for <lists+xen-devel@lfdr.de>; Sun, 29 Jan 2023 07:19:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486252.753672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pM10Z-0005l9-I7; Sun, 29 Jan 2023 06:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486252.753672; Sun, 29 Jan 2023 06:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pM10Z-0005iT-Et; Sun, 29 Jan 2023 06:17:43 +0000
Received: by outflank-mailman (input) for mailman id 486252;
 Sun, 29 Jan 2023 06:17:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hFYh=52=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pM10W-0005iM-Ti
 for xen-devel@lists.xenproject.org; Sun, 29 Jan 2023 06:17:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2041.outbound.protection.outlook.com [40.107.8.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0f61c95-9f9c-11ed-b836-f113854b840a;
 Sun, 29 Jan 2023 07:17:39 +0100 (CET)
Received: from DU2PR04CA0321.eurprd04.prod.outlook.com (2603:10a6:10:2b5::26)
 by AS8PR08MB9599.eurprd08.prod.outlook.com (2603:10a6:20b:619::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Sun, 29 Jan
 2023 06:17:29 +0000
Received: from DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::15) by DU2PR04CA0321.outlook.office365.com
 (2603:10a6:10:2b5::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33 via Frontend
 Transport; Sun, 29 Jan 2023 06:17:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT006.mail.protection.outlook.com (100.127.142.72) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.21 via Frontend Transport; Sun, 29 Jan 2023 06:17:28 +0000
Received: ("Tessian outbound 6e565e48ed4a:v132");
 Sun, 29 Jan 2023 06:17:28 +0000
Received: from fea346f21983.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B7C5DA6D-CD3F-420C-A835-E3EB487BD56D.1; 
 Sun, 29 Jan 2023 06:17:18 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fea346f21983.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sun, 29 Jan 2023 06:17:18 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by AS8PR08MB6023.eurprd08.prod.outlook.com (2603:10a6:20b:291::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.30; Sun, 29 Jan
 2023 06:17:16 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab%3]) with mapi id 15.20.6043.030; Sun, 29 Jan 2023
 06:17:16 +0000
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
X-Inumbo-ID: a0f61c95-9f9c-11ed-b836-f113854b840a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPEekBCBe5wnOeP6x05Y66zeXOv11u1Q8UedBbT537U=;
 b=MgCcyfhobLHXQDLD0WdHUclisI6pPj0cRZM1D1QcI57uefr3dxfP6azAZoiWePfu4ttQ2Uzj5P/06aafPcCZ6cJSqJsgFnEdBve+WFP9Yiza1CBg7D+g38j1JNcnR/kvw8WezVvzbm/CMdRD5ow6udCW28pSqfIfgNv4wMMmk4A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pm5GKsMJxyoUcKcahElJWHaZXVcy0i9U05zVKMO0osy22+U44oZWACnu1MAukShBMQFcNb/okadAynrut3aIDKCh2wi5lBbyTVPlRdyj/3zjUS6DhDq/PPUpG/QdACkA6OEodRXnIQEKRsxt1Z3n8LMvnEwvwk95r5ep5PPAJPzJ+4ieIZM0d+JKI7ClfRNmv3FJdgDwAn9BBtvfRr1CVeGqpoxlC3bgvX9oplKtb61NVVH0iLnJUdnpPi8xqG2mvSX8m67/p3dHksxUPQVE55ixH1HJAs++PHulRp+iBPPQMKyDU0yLCgoRnf4Bjer/CmQvyeo5mTKF0gjiuuLQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPEekBCBe5wnOeP6x05Y66zeXOv11u1Q8UedBbT537U=;
 b=QWEXJQqJRYBGPy+AU08jY2BfutX7u2CEC++CFCoPSLkJPvmP1jDmlTW5TWs+t2/K6XYr8Cd3hQSq3QuMGxXv+ECyU+VpOKAdtfdF/piC2b7XzjvMTFz7t5AbsrZxl6fmFwv7KIBHngv4m5/6T/Xz1P9dqXCbDt0CnBsjGDoPIuIzfjJAQY7/PPazbm/0i9uvAcWhp123UsVJDeTrllX5Idz5JgT0Sq+soMlr+WpHiN2Lj7/GntHR0OnrFEEehg94b/EmLdpfYAiS/4wxQnvBo41BrZkdVezpIBT+I6/0e3wYupmTOg2YVJdLLKQqvv7lRa5YNhyHS3/QZtVFElWtiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPEekBCBe5wnOeP6x05Y66zeXOv11u1Q8UedBbT537U=;
 b=MgCcyfhobLHXQDLD0WdHUclisI6pPj0cRZM1D1QcI57uefr3dxfP6azAZoiWePfu4ttQ2Uzj5P/06aafPcCZ6cJSqJsgFnEdBve+WFP9Yiza1CBg7D+g38j1JNcnR/kvw8WezVvzbm/CMdRD5ow6udCW28pSqfIfgNv4wMMmk4A=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 13/40] xen/mpu: introduce unified function
 setup_early_uart to map early UART
Thread-Topic: [PATCH v2 13/40] xen/mpu: introduce unified function
 setup_early_uart to map early UART
Thread-Index: AQHZJxAoM+nWeUC5lUC+09eIkdu2V66uAIMAgAb9FDA=
Date: Sun, 29 Jan 2023 06:17:16 +0000
Message-ID:
 <AM0PR08MB4530B7AF6EA406882974D528F7D29@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-14-Penny.Zheng@arm.com>
 <23f49916-dd2a-a956-1e6b-6dbb41a8817b@xen.org>
In-Reply-To: <23f49916-dd2a-a956-1e6b-6dbb41a8817b@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: AC0319E3917F92438C0E430FB536509B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|AS8PR08MB6023:EE_|DBAEUR03FT006:EE_|AS8PR08MB9599:EE_
X-MS-Office365-Filtering-Correlation-Id: 699712e6-355d-4603-ec43-08db01c07f83
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NYfLQzkiJmw17kic1oU5BhvctDArXU053QxJRLPyQ4UxVUF+fZt7P0+xWrhpBZ++5ELw8TF2NGfJZU7NVD20y6yi5HGbfVOyGA+vqP3j1wFboig+Jr5PP6ZkoV6nMGg9PLBmLeVV8zxS2AbYkxrs6tQUXlIsKMuvFOilMyFV1ArKc6/B7rYH9jrO3yJitdQJidJn0fG0ihr6W9Xl+RlmUrh0potVtjEDdbUdmxYq3rHQaYfVfgtpJ7CSdwIbS5u5YOdawsmCuBlKmrHWe2MUUQCkpRfSDbU7nn3tfRRfLlDZXECWxfan6GbZYi+Sf3VHbQec1OL/JQC8/A4CeZ9bhhsiNURFKnRWGZXU3UQY1QJ1WJ+7msh49dealKGAakBmrnmuax+xt7fmGQJMIGx/c4zi79/7oAH7xt0rtmtdt50eNe5B7r/KDdAsfio8tJzindBNVJY/873pJ+JnnAiJDiSyduuPexa3GTX88SHK+hIqEXDHGgBjVKlyMuJeANg7JJE6RjLbgQr4REAzFNe1zMqjHrtvDuI0NnIKGfCS2f+EoujNkKhi2pp/pDi4i3ywYhbHti1XttLMAuhm8ElaJWzEETz0EN6QK288htKiSUPNc8GMPIKbDzFenymImHVr7TniFiTtoTJ7ZKXVAZ4P4lxQz/lKyS92hLnQx+VEak2jfZ2DRyluCl5wMUgtkmUYN8DYA3VQDzdrcAOeJQAlSg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(451199018)(26005)(7696005)(71200400001)(6506007)(478600001)(41300700001)(9686003)(186003)(53546011)(54906003)(110136005)(316002)(4326008)(76116006)(66946007)(83380400001)(38100700002)(122000001)(64756008)(66446008)(66476007)(8676002)(66556008)(2906002)(55016003)(5660300002)(38070700005)(86362001)(8936002)(52536014)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6023
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9b194aa0-7d75-4844-6776-08db01c07842
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j0fA38QqESiDHyHoZ/smqc0VDyLFiFq1eQbsJNROnzNEa/uo2Bz+r8lGym5L0ARk5VQLVfl/FsGThUGCZ4vi7QfRFvesFwRH53KDMhFnMRaGvy0Y7JZ39ogehiGhoGu2j264zd40Ip9vzU87kzttEMC7R0YhZksf0YnV/IGkaHYnGKprXB7jTF8BpmheCpOBfjpznPqS3qhnxLZfOm5pHAIJg0McYkFKNQdz6QSy1yr7S8tLyasAdI2CNRwo8hTMPLbJoDcURm4lTRrHM9N1BpOjgj9D+W+eBgxTNL7hx5dPiSAStLwZ+QDcghgryNdffYUD7QNSyXjfeYG1iOvurtklfDQpkzvGpoxKwgbN9IOYPKLyN0KXuvRWs+/jFlYuVB9fe/LBBfqGr/8Mo42doyyIuUS97QgT5L2z3U5udglnY++vZVGzvGVXaWtBp41NPmH5M0F7leKOjQ967qbRpX4sCf+Zw6QFHE8sZO2Knxe9ZHNloNZwvSHq0QZNkijkOnn7zmwe2/U32ZggTCxRLV+VFOYVV3acJxSQUToriDeU6TVZV3ENAt36ZZLL5FtwtJ2krN7lqCrholzQden9aNIWUwBr9mjEj0IadRGGEqK4HlJQxTNGoSCpLeWErN4kLEcUfpEl3y+Yth5lmfiM+HrbFxVUIPjLX77UQOy/ErY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199018)(36840700001)(46966006)(8676002)(41300700001)(4326008)(107886003)(33656002)(55016003)(40480700001)(8936002)(52536014)(316002)(70206006)(70586007)(5660300002)(110136005)(54906003)(7696005)(83380400001)(2906002)(81166007)(26005)(186003)(9686003)(478600001)(6506007)(53546011)(36860700001)(86362001)(336012)(47076005)(356005)(82740400003)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2023 06:17:28.7757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 699712e6-355d-4603-ec43-08db01c07f83
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9599

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIEphbnVhcnkgMjUsIDIwMjMgMzowOSBBTQ0K
PiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgU3RlZmFu
byBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQgTWFycXVp
cyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsNCj4gVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9k
eW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEzLzQwXSB4
ZW4vbXB1OiBpbnRyb2R1Y2UgdW5pZmllZCBmdW5jdGlvbg0KPiBzZXR1cF9lYXJseV91YXJ0IHRv
IG1hcCBlYXJseSBVQVJUDQo+IA0KPiBIaSBQZW55LA0KDQpIaSBKdWxpZW4sDQoNCj4gDQo+IE9u
IDEzLzAxLzIwMjMgMDU6MjgsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IEluIE1NVSBzeXN0ZW0s
IHdlIG1hcCB0aGUgVUFSVCBpbiB0aGUgZml4bWFwICh3aGVuIGVhcmx5cHJpbnRrIGlzIHVzZWQp
Lg0KPiA+IEhvd2V2ZXIgaW4gTVBVIHN5c3RlbSwgd2UgbWFwIHRoZSBVQVJUIHdpdGggYSB0cmFu
c2llbnQgTVBVIG1lbW9yeQ0KPiA+IHJlZ2lvbi4NCj4gPg0KPiA+IFNvIHdlIGludHJvZHVjZSBh
IG5ldyB1bmlmaWVkIGZ1bmN0aW9uIHNldHVwX2Vhcmx5X3VhcnQgdG8gcmVwbGFjZSB0aGUNCj4g
PiBwcmV2aW91cyBzZXR1cF9maXhtYXAuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBa
aGVuZyA8cGVubnkuemhlbmdAYXJtLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8
d2VpLmNoZW5AYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHhlbi9hcmNoL2FybS9hcm02NC9oZWFk
LlMgICAgICAgICAgICAgICB8ICAyICstDQo+ID4gICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZF9t
bXUuUyAgICAgICAgICAgfCAgNCArLQ0KPiA+ICAgeGVuL2FyY2gvYXJtL2FybTY0L2hlYWRfbXB1
LlMgICAgICAgICAgIHwgNTINCj4gKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICAgeGVu
L2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Vhcmx5X3ByaW50ay5oIHwgIDEgKw0KPiA+ICAgNCBmaWxl
cyBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQv
aGVhZC5TDQo+ID4gaW5kZXggN2YzZjk3MzQ2OC4uYTkyODgzMzE5ZCAxMDA2NDQNCj4gPiAtLS0g
YS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0
L2hlYWQuUw0KPiA+IEBAIC0yNzIsNyArMjcyLDcgQEAgcHJpbWFyeV9zd2l0Y2hlZDoNCj4gPiAg
ICAgICAgICAgICogYWZ0ZXJ3YXJkcy4NCj4gPiAgICAgICAgICAgICovDQo+ID4gICAgICAgICAg
IGJsICAgIHJlbW92ZV9pZGVudGl0eV9tYXBwaW5nDQo+ID4gLSAgICAgICAgYmwgICAgc2V0dXBf
Zml4bWFwDQo+ID4gKyAgICAgICAgYmwgICAgc2V0dXBfZWFybHlfdWFydA0KPiA+ICAgI2lmZGVm
IENPTkZJR19FQVJMWV9QUklOVEsNCj4gPiAgICAgICAgICAgLyogVXNlIGEgdmlydHVhbCBhZGRy
ZXNzIHRvIGFjY2VzcyB0aGUgVUFSVC4gKi8NCj4gPiAgICAgICAgICAgbGRyICAgeDIzLCA9RUFS
TFlfVUFSVF9WSVJUVUFMX0FERFJFU1MNCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Fy
bTY0L2hlYWRfbW11LlMNCj4gPiBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkX21tdS5TIGluZGV4
IGI1OWM0MDQ5NWYuLmExOWI3Yzg3M2QNCj4gMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJt
L2FybTY0L2hlYWRfbW11LlMNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZF9tbXUu
Uw0KPiA+IEBAIC0zMTIsNyArMzEyLDcgQEAgRU5EUFJPQyhyZW1vdmVfaWRlbnRpdHlfbWFwcGlu
ZykNCj4gPiAgICAqDQo+ID4gICAgKiBDbG9iYmVycyB4MCAtIHgzDQo+ID4gICAgKi8NCj4gPiAt
RU5UUlkoc2V0dXBfZml4bWFwKQ0KPiA+ICtFTlRSWShzZXR1cF9lYXJseV91YXJ0KQ0KPiANCj4g
VGhpcyBmdW5jdGlvbiBpcyBkb2luZyBtb3JlIHRoYW4gZW5hYmxlIHRoZSBlYXJseSBVQVJULiBJ
dCBhbHNvIHNldHVwcyB0aGUNCj4gZml4bWFwIGV2ZW4gZWFybHlwcmludGsgaXMgbm90IGNvbmZp
Z3VyZWQuDQoNClRydWUsIHRydWUuDQpJJ3ZlIHRob3JvdWdobHkgcmVhZCB0aGUgTU1VIGltcGxl
bWVudGF0aW9uIG9mIHNldHVwX2ZpeG1hcCwgYW5kIEknbGwgdHJ5IHRvIHNwbGl0DQppdCB1cC4N
Cg0KPiANCj4gSSBhbSBub3QgZW50aXJlbHkgc3VyZSB3aGF0IGNvdWxkIGJlIHRoZSBuYW1lLiBN
YXliZSB0aGlzIG5lZWRzIHRvIGJlIHNwbGl0DQo+IGZ1cnRoZXIuDQo+IA0KPiA+ICAgI2lmZGVm
IENPTkZJR19FQVJMWV9QUklOVEsNCj4gPiAgICAgICAgICAgLyogQWRkIFVBUlQgdG8gdGhlIGZp
eG1hcCB0YWJsZSAqLw0KPiA+ICAgICAgICAgICBsZHIgICB4MCwgPUVBUkxZX1VBUlRfVklSVFVB
TF9BRERSRVNTDQo+ID4gQEAgLTMyNSw3ICszMjUsNyBAQCBFTlRSWShzZXR1cF9maXhtYXApDQo+
ID4gICAgICAgICAgIGRzYiAgIG5zaHN0DQo+ID4NCj4gPiAgICAgICAgICAgcmV0DQo+ID4gLUVO
RFBST0Moc2V0dXBfZml4bWFwKQ0KPiA+ICtFTkRQUk9DKHNldHVwX2Vhcmx5X3VhcnQpDQo+ID4N
Cj4gPiAgIC8qIEZhaWwtc3RvcCAqLw0KPiA+ICAgZmFpbDogICBQUklOVCgiLSBCb290IGZhaWxl
ZCAtXHJcbiIpDQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkX21wdS5T
DQo+ID4gYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZF9tcHUuUyBpbmRleCBlMmFjNjliMGNjLi43
MmQxZTA4NjNkDQo+IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkX21w
dS5TDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWRfbXB1LlMNCj4gPiBAQCAtMTgs
OCArMTgsMTAgQEANCj4gPiAgICNkZWZpbmUgUkVHSU9OX1RFWFRfUFJCQVIgICAgICAgMHgzOCAg
ICAvKiBTSD0xMSBBUD0xMCBYTj0wMCAqLw0KPiA+ICAgI2RlZmluZSBSRUdJT05fUk9fUFJCQVIg
ICAgICAgICAweDNBICAgIC8qIFNIPTExIEFQPTEwIFhOPTEwICovDQo+ID4gICAjZGVmaW5lIFJF
R0lPTl9EQVRBX1BSQkFSICAgICAgIDB4MzIgICAgLyogU0g9MTEgQVA9MDAgWE49MTAgKi8NCj4g
PiArI2RlZmluZSBSRUdJT05fREVWSUNFX1BSQkFSICAgICAweDIyICAgIC8qIFNIPTEwIEFQPTAw
IFhOPTEwICovDQo+ID4NCj4gPiAgICNkZWZpbmUgUkVHSU9OX05PUk1BTF9QUkxBUiAgICAgMHgw
ZiAgICAvKiBOUz0wIEFUVFI9MTExIEVOPTEgKi8NCj4gPiArI2RlZmluZSBSRUdJT05fREVWSUNF
X1BSTEFSICAgICAweDA5ICAgIC8qIE5TPTAgQVRUUj0xMDAgRU49MSAqLw0KPiA+DQo+ID4gICAv
Kg0KPiA+ICAgICogTWFjcm8gdG8gcm91bmQgdXAgdGhlIHNlY3Rpb24gYWRkcmVzcyB0byBiZSBQ
QUdFX1NJWkUgYWxpZ25lZCBAQA0KPiA+IC0zMzQsNiArMzM2LDU2IEBAIEVOVFJZKGVuYWJsZV9t
bSkNCj4gPiAgICAgICByZXQNCj4gPiAgIEVORFBST0MoZW5hYmxlX21tKQ0KPiA+DQo+ID4gKy8q
DQo+ID4gKyAqIE1hcCB0aGUgZWFybHkgVUFSVCB3aXRoIGEgbmV3IHRyYW5zaWVudCBNUFUgbWVt
b3J5IHJlZ2lvbi4NCj4gPiArICoNCj4gDQo+IE1pc3NpbmcgIklucHV0czogIg0KPiANCj4gPiAr
ICogeDI3OiByZWdpb24gc2VsZWN0b3INCj4gPiArICogeDI4OiBwcmJhcg0KPiA+ICsgKiB4Mjk6
IHBybGFyDQo+ID4gKyAqDQo+ID4gKyAqIENsb2JiZXJzIHgwIC0geDQNCj4gPiArICoNCj4gPiAr
ICovDQo+ID4gK0VOVFJZKHNldHVwX2Vhcmx5X3VhcnQpDQo+ID4gKyNpZmRlZiBDT05GSUdfRUFS
TFlfUFJJTlRLDQo+ID4gKyAgICAvKiBzdGFjayBMUiBhcyB3cml0ZV9wciB3aWxsIGJlIGNhbGxl
ZCBsYXRlciBsaWtlIG5lc3RlZCBmdW5jdGlvbiAqLw0KPiA+ICsgICAgbW92ICAgeDMsIGxyDQo+
ID4gKw0KPiA+ICsgICAgLyoNCj4gPiArICAgICAqIE1QVSByZWdpb24gZm9yIGVhcmx5IFVBUlQg
aXMgYSB0cmFuc2llbnQgcmVnaW9uLCBzaW5jZSBpdCB3aWxsIGJlDQo+ID4gKyAgICAgKiByZXBs
YWNlZCBieSBzcGVjaWZpYyBkZXZpY2UgbWVtb3J5IGxheW91dCB3aGVuIEZEVCBnZXRzIHBhcnNl
ZC4NCj4gDQo+IEkgd291bGQgcmF0aGVyIG5vdCBtZW50aW9uICJGRFQiIGhlcmUgYmVjYXVzZSB0
aGlzIGNvZGUgaXMgaW5kZXBlbmRlbnQgdG8NCj4gdGhlIGZpcm13YXJlIHRhYmxlIHVzZWQuDQo+
IA0KPiBIb3dldmVyLCBhbnkgcmVhc29uIHRvIHVzZSBhIHRyYW5zaWVudCByZWdpb24gcmF0aGVy
IHRoYW4gdGhlIG9uZSB0aGF0IHdpbGwNCj4gYmUgdXNlZCBmb3IgdGhlIFVBUlQgZHJpdmVyPw0K
PiANCg0KV2UgZG9u4oCZdCB3YW50IHRvIGRlZmluZSBhIE1QVSByZWdpb24gZm9yIGVhY2ggZGV2
aWNlIGRyaXZlci4gSXQgd2lsbCBleGhhdXN0DQpNUFUgcmVnaW9ucyB2ZXJ5IHF1aWNrbHkuDQpJ
biBjb21taXQgIiBbUEFUQ0ggdjIgMjgvNDBdIHhlbi9tcHU6IG1hcCBib290IG1vZHVsZSBzZWN0
aW9uIGluIE1QVSBzeXN0ZW0iLCANCkEgbmV3IEZEVCBwcm9wZXJ0eSBgbXB1LGRldmljZS1tZW1v
cnktc2VjdGlvbmAgd2lsbCBiZSBpbnRyb2R1Y2VkIGZvciB1c2VycyB0byBzdGF0aWNhbGx5DQpj
b25maWd1cmUgdGhlIHdob2xlIHN5c3RlbSBkZXZpY2UgbWVtb3J5IHdpdGggdGhlIGxlYXN0IG51
bWJlciBvZiBtZW1vcnkgcmVnaW9ucyBpbiBEZXZpY2UgVHJlZS4NClRoaXMgc2VjdGlvbiBzaGFs
bCBjb3ZlciBhbGwgZGV2aWNlcyB0aGF0IHdpbGwgYmUgdXNlZCBpbiBYZW4sIGxpa2UgYFVBUlRg
LCBgR0lDYCwgZXRjLg0KRm9yIEZWUF9CYXNlUl9BRU12OFIsIHdlIGhhdmUgdGhlIGZvbGxvd2lu
ZyBkZWZpbml0aW9uOg0KYGBgDQptcHUsZGV2aWNlLW1lbW9yeS1zZWN0aW9uID0gPDB4MCAweDgw
MDAwMDAwIDB4MCAweDdmZmZmMDAwPjsNCmBgYA0KDQo+ID4gKyAgICAgKi8NCj4gPiArICAgIGxv
YWRfcGFkZHIgeDAsIG5leHRfdHJhbnNpZW50X3JlZ2lvbl9pZHgNCj4gPiArICAgIGxkciAgIHg0
LCBbeDBdDQo+ID4gKw0KPiA+ICsgICAgbGRyICAgeDI4LCA9Q09ORklHX0VBUkxZX1VBUlRfQkFT
RV9BRERSRVNTDQo+ID4gKyAgICBhbmQgICB4MjgsIHgyOCwgI01QVV9SRUdJT05fTUFTSw0KPiA+
ICsgICAgbW92ICAgeDEsICNSRUdJT05fREVWSUNFX1BSQkFSDQo+ID4gKyAgICBvcnIgICB4Mjgs
IHgyOCwgeDENCj4gDQo+IFRoaXMgbmVlZHMgc29tZSBkb2N1bWVudGF0aW9uIHRvIGV4cGxhaW4g
dGhlIGxvZ2ljLiBNYXliZSBldmVuIGEgbWFjcm8uDQo+IA0KDQpEbyB5b3Ugc3VnZ2VzdCB0aGF0
IEkgc2hhbGwgZXhwbGFpbiBob3cgd2UgY29tcG9zZSBQUkJBUl9FTDIgcmVnaXN0ZXI/DQoNCj4g
PiArDQo+ID4gKyAgICBsZHIgeDI5LCA9KENPTkZJR19FQVJMWV9VQVJUX0JBU0VfQUREUkVTUyAr
IEVBUkxZX1VBUlRfU0laRSkNCj4gPiArICAgIHJvdW5kdXBfc2VjdGlvbiB4MjkNCj4gDQo+IERv
ZXMgdGhpcyBtZWFuIHdlIGNvdWxkIGdpdmUgYWNjZXNzIHRvIG1vcmUgdGhhbiBuZWNlc3Nhcnk/
IFNob3VsZG4ndA0KPiBpbnN0ZWFkIHByZXZlbnQgY29tcGlsYXRpb24gaWYgdGhlIHNpemUgZG9l
c24ndCBhbGlnbiB3aXRoIHRoZSBzZWN0aW9uIHNpemU/DQo+IA0KDQpUcnVlLCB3ZSBjb3VsZCBu
b3QgdHJlYXQgdWFydCBzZWN0aW9uIGxpa2Ugd2UgZG8gZm9yIHRoZSBzZWN0aW9uIGRlZmluZWQg
aW4geGVuLmxkcy5TLg0KQ09ORklHX0VBUkxZX1VBUlRfQkFTRV9BRERSRVNTIGFuZCBFQVJMWV9V
QVJUX1NJWkUgc2hhbGwgYm90aCBiZSBjaGVja2VkDQppZiBpdCBpcyBhbGlnbmVkIHdpdGggUEFH
RV9TSVpFLg0KDQo+ID4gKyAgICAvKiBMaW1pdCBhZGRyZXNzIGlzIGluY2x1c2l2ZSAqLw0KPiA+
ICsgICAgc3ViICAgeDI5LCB4MjksICMxDQo+ID4gKyAgICBhbmQgICB4MjksIHgyOSwgI01QVV9S
RUdJT05fTUFTSw0KPiA+ICsgICAgbW92ICAgeDIsICNSRUdJT05fREVWSUNFX1BSTEFSDQo+ID4g
KyAgICBvcnIgICB4MjksIHgyOSwgeDINCj4gPiArDQo+ID4gKyAgICBtb3YgICB4MjcsIHg0DQo+
IA0KPiBUaGlzIG5lZWRzIHNvbWUgZG9jdW1lbnRhdGlvbiBsaWtlOg0KPiANCj4geDI3OiByZWdp
b24gc2VsZWN0b3INCj4gDQo+IFNlZSBob3cgd2UgZG9jdW1lbnRlZCB0aGUgZXhpc3RpbmcgaGVs
cGVycy4NCj4gDQo+ID4gKyAgICBibCAgICB3cml0ZV9wcg0KPiA+ICsNCj4gPiArICAgIC8qIENy
ZWF0ZSBhIG5ldyBlbnRyeSBpbiB4ZW5fbXB1bWFwIGZvciBlYXJseSBVQVJUICovDQo+ID4gKyAg
ICBjcmVhdGVfbXB1X2VudHJ5IHhlbl9tcHVtYXAsIHg0LCB4MjgsIHgyOSwgeDEsIHgyDQo+ID4g
Kw0KPiA+ICsgICAgLyogVXBkYXRlIG5leHRfdHJhbnNpZW50X3JlZ2lvbl9pZHggKi8NCj4gPiAr
ICAgIHN1YiAgIHg0LCB4NCwgIzENCj4gPiArICAgIHN0ciAgIHg0LCBbeDBdDQo+ID4gKw0KPiA+
ICsgICAgbW92ICAgbHIsIHgzDQo+ID4gKyAgICByZXQNCj4gPiArI2VuZGlmDQo+ID4gK0VORFBS
T0Moc2V0dXBfZWFybHlfdWFydCkNCj4gPiArDQo+ID4gICAvKg0KPiA+ICAgICogTG9jYWwgdmFy
aWFibGVzOg0KPiA+ICAgICogbW9kZTogQVNNDQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS9lYXJseV9wcmludGsuaA0KPiA+IGIveGVuL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL2Vhcmx5X3ByaW50ay5oDQo+ID4gaW5kZXggNDRhMjMwODUzZi4uZDg3NjIzZTZkNSAxMDA2
NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZWFybHlfcHJpbnRrLmgNCj4g
PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZWFybHlfcHJpbnRrLmgNCj4gPiBAQCAt
MjIsNiArMjIsNyBAQA0KPiA+ICAgICogZm9yIEVBUkxZX1VBUlRfVklSVFVBTF9BRERSRVNTLg0K
PiA+ICAgICovDQo+ID4gICAjZGVmaW5lIEVBUkxZX1VBUlRfVklSVFVBTF9BRERSRVNTDQo+IENP
TkZJR19FQVJMWV9VQVJUX0JBU0VfQUREUkVTUw0KPiA+ICsjZGVmaW5lIEVBUkxZX1VBUlRfU0la
RSAgICAgICAgICAgIDB4MTAwMA0KPiANCj4gU2hvdWxkbid0IHRoaXMgYmUgUEFHRV9TSVpFPyBJ
ZiBub3QsIGhvdyBkaWQgeW91IGNvbWUgdXAgd2l0aCB0aGUgbnVtYmVyPw0KPiANCj4gQ2hlZXJz
LA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

