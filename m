Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142D26EEE5C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 08:31:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526486.818267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prYfL-0003ls-7g; Wed, 26 Apr 2023 06:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526486.818267; Wed, 26 Apr 2023 06:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prYfL-0003k9-3i; Wed, 26 Apr 2023 06:30:11 +0000
Received: by outflank-mailman (input) for mailman id 526486;
 Wed, 26 Apr 2023 06:30:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pNUB=AR=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1prYfJ-0003k3-HK
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 06:30:09 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9548c3d-e3fb-11ed-b224-6b7b168915f2;
 Wed, 26 Apr 2023 08:30:07 +0200 (CEST)
Received: from AM5PR0502CA0020.eurprd05.prod.outlook.com
 (2603:10a6:203:91::30) by AS2PR08MB9785.eurprd08.prod.outlook.com
 (2603:10a6:20b:606::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 06:30:05 +0000
Received: from AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::25) by AM5PR0502CA0020.outlook.office365.com
 (2603:10a6:203:91::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Wed, 26 Apr 2023 06:30:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT051.mail.protection.outlook.com (100.127.140.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.21 via Frontend Transport; Wed, 26 Apr 2023 06:30:04 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Wed, 26 Apr 2023 06:30:04 +0000
Received: from 3600f1817218.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F3B16A9D-BDA3-46E6-B0E8-8B4ADA33E056.1; 
 Wed, 26 Apr 2023 06:29:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3600f1817218.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Apr 2023 06:29:54 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB10378.eurprd08.prod.outlook.com (2603:10a6:10:3da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Wed, 26 Apr
 2023 06:29:51 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 06:29:51 +0000
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
X-Inumbo-ID: c9548c3d-e3fb-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHlVS/xIpZ4NMvOTHhO8WrzzPUxd4UXeced3AXVdTcQ=;
 b=XbYTDLrgoWps9WRCEV/a/gHy6Qs3HYeys/XTgjoXTRfkJIz0imRCw/NdiUtgQz0URm4pRwtyDqQpAgW4Wtn6PmwcrT85j67xxxrqVIFR8+PrlHORPiCxDcGTzqxdRKtGBPzJ545bOMRZpEz+NE5w8VGR8lDpi4w36wgRgCh8WGY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNmvRTN0enW9R5+nHOU0sMMi/Y9hdX6uoYuQ1xNsvv3FxSLz0ZmG/p8/1wzyXEpUxXv2SIIUi0HCNkWpH9O0TSfV/oQhErerzk9io3uMFT1WOEWX8rkNCj1yYufLg9t2Im2vVKF5+uS2hfrWZg9kkighGy03vhzIOKtmna/6iQLPegmvxRERDJtAWVWJwG4y+fS8PIXovN0bq8Nf0phenDqyxVwb70CdoK5o/KzIWKrFRz4nZ6C1mPFIGOIkrbUOPkaiU/6WpAmWY54982ygQJjQoMrfclKjPeuJy+2ufJmM5Zj6fXRMspdMjAQz5xfuTMTGFDcWs+Vya1thDB40iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHlVS/xIpZ4NMvOTHhO8WrzzPUxd4UXeced3AXVdTcQ=;
 b=N7hr8qgM/Eb0KxhqUrKkmr9qYu++TmqkARiDIHCf3Kb0wb3lzWcBd19Wl8dZ/dmoKJB/jMkCNeylAMQGepYGeOnNuRmxEvGCBW4HBdrAjv4ItLIftox1B1YLbc/KNc6+a2OkjXhhwdezHHQOzTKMwBPFwweXmbYeVMuymG+VRtY5hyjc7diFsuX7sGIFO0MFgVZN2lKjKeuEoXIHpseyOKubxkGBTKBY95SgkkWcZaViHB2lBe0Z84jd8bA0LmPlZRmRuARye7WATpcrhApSvHsSckk8xTUxCIZ6vyWQoqbR2cQ4WmxOHG3VSZ7wEXmuu6gES4A4umaDQQqV485CpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHlVS/xIpZ4NMvOTHhO8WrzzPUxd4UXeced3AXVdTcQ=;
 b=XbYTDLrgoWps9WRCEV/a/gHy6Qs3HYeys/XTgjoXTRfkJIz0imRCw/NdiUtgQz0URm4pRwtyDqQpAgW4Wtn6PmwcrT85j67xxxrqVIFR8+PrlHORPiCxDcGTzqxdRKtGBPzJ545bOMRZpEz+NE5w8VGR8lDpi4w36wgRgCh8WGY=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 09/17] xen/arm: introduce a helper to parse device tree
 NUMA distance map
Thread-Topic: [PATCH v4 09/17] xen/arm: introduce a helper to parse device
 tree NUMA distance map
Thread-Index: AQHZd0ulMpqFICe/LUiDVq6+aDsW9687tFqAgAFSIKA=
Date: Wed, 26 Apr 2023 06:29:51 +0000
Message-ID:
 <AS8PR08MB7991F2DDC4C13F33390557EA92659@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-10-Henry.Wang@arm.com>
 <188a01f0-a2d1-0f2d-4d01-61a259c790f1@suse.com>
In-Reply-To: <188a01f0-a2d1-0f2d-4d01-61a259c790f1@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7A22E85BB6A0284E94D4B6010A1BA705.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB10378:EE_|AM7EUR03FT051:EE_|AS2PR08MB9785:EE_
X-MS-Office365-Filtering-Correlation-Id: fba4ff46-f873-476f-f9d7-08db461fac30
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iYg2yE3xB/GZNd38kuBOShtpMdFCkLdg1Gj+vZ728QILwF4Tvml4z1MqUlkeLApAJmGCCB/yeWNeqyWvObqkHYFkbmecisX5TtJDC3vOqdUKdXAKyUMwpnonYuy7Kvri17dhEZAuw1P0Si+lV3FiUqTrFj9MsQOtffm7RwwZAaBNtcvh1hqVzv4qrMeDb3DyBg98WD/YasA26P/r6zu20FLSx2pQ0ycM8alKRlzPUuyoMt5DfffQP+5tpDTtxr4RG+lX6CYev/bTpMizFMcjIRbRA9LXtOiqkVPsXGQCijm9rPBqqvvgjaDuIfmmU+6aFAYKyX9aZRkHKyNvdHGKGRXxzPZUdqySrwypw8oURoNZ3rG8m31fvjlUK2B0Uqkur9OEYUhqiGhyhR1VIUZcEUuNBKaFD88/h+Gso+3g5xOoDhkQ3q4Rg8B+spYRT/3MlfA2vFFkL1hzwt8dyEcGuZlEpEZmIH61EVc2KJYyUJTNZPG3pkCW/Bz1IaPO64HZVM3vTafpp1h2yjXWtsy1sUy0DVJBAg/so5O0QCoxFxeVLcKtvWxP/D9b56ZSGfjhNPef2EMQ2KPJ+0EQOe/AAXM1cOFuDk/ySnBgOFD9dkc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(451199021)(66899021)(966005)(71200400001)(55016003)(2906002)(7696005)(83380400001)(86362001)(33656002)(66556008)(8936002)(66476007)(66946007)(316002)(478600001)(26005)(64756008)(66446008)(76116006)(6506007)(41300700001)(6916009)(9686003)(186003)(4326008)(38070700005)(122000001)(38100700002)(54906003)(8676002)(52536014)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB10378
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6e3fab54-047f-4583-ceb5-08db461fa443
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tFU/nPnz44DS2ugCYYoI+yW/0so50ILyEPvntCPdqAbFfDcJ6ozt7JUHmg6nuclzhtjv7G1zTtEfm4o+yWIAb1iptPI64IOqbSIxqAwsZJC2L8wp67Z2WWFpXnvT2l4MRpHcLHR0Jn5BC9rhnetRyiHP8Cksb63tf1S7f0NjlojgLDat7HJPI8QrIaDe+0SS0cnNAQoRQg8Fa9/kxe/S3LiFnq2Rclc121ZazhPkZBokUvg7sojboL6NyEneV6Q3EENeEyB2bvO0RXid628wHr9U/k8cBJi54w2EJ4xPTaNDN5m8TXqPtPVI1qbuHYGdcfHV6Vc+oFwp+PbtM2Dck7N4G3bCflsxs/cFNwkwV0tpV3ISCnUGXO/U4sx+IDoxqLXEVYsMpUEP8zBa5zZWjUY7hI3KyuqgemVCuLERd0gt9k5LTYPuW3aDdCqBZhAVPQgyq0rSoIEVr+HmJYzbfp6KezH+/ZGHXIUBsqNrBMnDlAa4qrXnCV2l0u+ZDmtVS3erAEFdW69x4gCBDcGv74VxTmfoxabXA1l9+/oq3gtdogmKgaRhqZtN2MCKl0woMfiGhS7lgE+GcB+D+VJukYN+w/Tt3Q60HA/7uG202JVlAIW3mJe2KwJ8ObiqrSWMzcvPU1hUIek3lKc2WV4dY2x1eNTsvFiC0UNdOZUKKbTseyVTErUOnJFzKuPlPL4VaQewL3exkojfd00fp2UxBgh9NeNLGoTyfVU3Td9w0uc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(9686003)(26005)(6506007)(186003)(66899021)(966005)(336012)(40480700001)(82310400005)(83380400001)(36860700001)(7696005)(40460700003)(55016003)(54906003)(316002)(41300700001)(52536014)(5660300002)(34070700002)(356005)(82740400003)(2906002)(33656002)(478600001)(86362001)(8936002)(4326008)(81166007)(47076005)(6862004)(70586007)(8676002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 06:30:04.9253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fba4ff46-f873-476f-f9d7-08db461fac30
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9785

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAwOS8xN10g
eGVuL2FybTogaW50cm9kdWNlIGEgaGVscGVyIHRvIHBhcnNlIGRldmljZQ0KPiB0cmVlIE5VTUEg
ZGlzdGFuY2UgbWFwDQo+IA0KPiA+ICsgICAgICAgIGRpc3RhbmNlID0gZHRfbmV4dF9jZWxsKDEs
ICZtYXRyaXgpOw0KPiANCj4gVXBvbiBzZWNvbmQgdGhvdWdodCBJIGNoZWNrZWQgd2hhdCBkdF9u
ZXh0X2NlbGwoKSByZXR1cm5zOiBZb3UncmUgc2lsZW50bHkNCj4gdHJ1bmNhdGluZyBoZXJlIGFu
ZCB0aGVuIC4uLg0KPiANCj4gPiArICAgICAgICAgICAgLyogQmktZGlyZWN0aW9ucyBhcmUgbm90
IHNldCwgc2V0IGJvdGggKi8NCj4gPiArICAgICAgICAgICAgbnVtYV9zZXRfZGlzdGFuY2UoZnJv
bSwgdG8sIGRpc3RhbmNlKTsNCj4gPiArICAgICAgICAgICAgbnVtYV9zZXRfZGlzdGFuY2UodG8s
IGZyb20sIGRpc3RhbmNlKTsNCj4gDQo+IC4uLiBoZXJlIGFnYWluLiBJcyB0aGF0IHJlYWxseSB0
aGUgaW50ZW50aW9uPw0KDQpCeSBodW50aW5nIGRvd24gdGhlIGhpc3RvcmljYWwgZGlzY3Vzc2lv
bnMgSSBmb3VuZCB0aGF0IHVzaW5nIGR0X25leHRfY2VsbCgpIGlzDQp3aGF0IEp1bGllbiBzdWdn
ZXN0ZWQgMiB5ZWFycyBhZ28gaW4gdGhlIFJGQyBzZXJpZXMgWzFdLiBHaXZlbiB0aGUgdHJ1bmNh
dGlvbg0KaGVyZSBpcyBmb3Igbm9kZSBpZCAoZnJvbS90bykgYW5kIGRpc3RhbmNlIHdoaWNoIEkg
YW0gcHJldHR5IHN1cmUgd2lsbCBub3QNCmV4Y2VlZCAzMi1iaXQgcmFuZ2UsIEkgdGhpbmsgdGhl
IHNpbGVudCB0cnVuY2F0aW9uIGlzIHNhZmUuDQoNCkhvd2V2ZXIgSSB1bmRlcnN0YW5kIHlvdXIg
cG9pbnQgaGVyZSwgdGhlIHNpbGVudCB0cnVuY2F0aW9uIGlzIG5vdCBpZGVhbCwgc28NCkkgd29u
ZGVyIGlmIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9ucyB0byBpbXByb3ZlLCBkbyB5b3UgdGhpbmsg
SSBzaG91bGQgY2hhbmdlDQp0aGVzZSB2YXJpYWJsZXMgdG8gdTY0IG9yIG1heWJlIEkgbmVlZCB0
byBkbyB0aGUgZXhwbGljaXQgdHlwZSBjYXN0IG9yIGFueQ0KYmV0dGVyIHN1Z2dlc3Rpb25zIGZy
b20geW91PyBUaGFua3MhDQoNClsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hp
dmVzL2h0bWwveGVuLWRldmVsLzIwMjEtMDgvbXNnMDExNzUuaHRtbA0KDQpLaW5kIHJlZ2FyZHMs
DQpIZW5yeQ0KDQo+IA0KPiBKYW4NCg==

