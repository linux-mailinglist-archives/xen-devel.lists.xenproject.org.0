Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6092D724451
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 15:24:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544074.849582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Wfw-0005iD-Q4; Tue, 06 Jun 2023 13:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544074.849582; Tue, 06 Jun 2023 13:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Wfw-0005fP-N7; Tue, 06 Jun 2023 13:24:40 +0000
Received: by outflank-mailman (input) for mailman id 544074;
 Tue, 06 Jun 2023 13:24:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PqjZ=B2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q6Wfu-0005fH-Qy
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 13:24:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b37b57e-046d-11ee-8611-37d641c3527e;
 Tue, 06 Jun 2023 15:24:36 +0200 (CEST)
Received: from DB3PR08CA0028.eurprd08.prod.outlook.com (2603:10a6:8::41) by
 PAWPR08MB8981.eurprd08.prod.outlook.com (2603:10a6:102:33e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 13:24:33 +0000
Received: from DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::33) by DB3PR08CA0028.outlook.office365.com
 (2603:10a6:8::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Tue, 6 Jun 2023 13:24:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT035.mail.protection.outlook.com (100.127.142.136) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.19 via Frontend Transport; Tue, 6 Jun 2023 13:24:32 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Tue, 06 Jun 2023 13:24:32 +0000
Received: from db55fb40a862.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F687C07B-95AE-4E9F-AD85-E298B11AFA94.1; 
 Tue, 06 Jun 2023 13:24:20 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id db55fb40a862.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Jun 2023 13:24:20 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB10346.eurprd08.prod.outlook.com (2603:10a6:20b:57e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 13:24:17 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6457:d14f:abe0:be0e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6457:d14f:abe0:be0e%4]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 13:24:17 +0000
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
X-Inumbo-ID: 7b37b57e-046d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/alJ0yr0DqSkDDfJatotMNbjqqDOddZoNdl8Kuo6dTU=;
 b=fDshiPYb90LWi5kWkQv6doD5pzEbb4IkPKFAZ+be/0qHZ1UwNjd2gBE6/kLFoHJeqSJ3asa0YqhMBSdqt0Uuo/AkumT+bQC+UQog2aY7e4+L6LAIS5jcsqdVbL4pgyeM1uTQVb3Fx6EZgnliqUR/8NQQdv0n/ruXSEJszItk56Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2a1db1a434f02c5a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1fORRKemvxZi/I3oC9xgiktAg/Ip2L+lIK/PQzrS8bqR1d9dzn/ygBIouBH98YfgREBn7Dtt/8T/Rc3PWjvjiY1jFvuS3nyZ51Tn5nAGu90Ia2h15x0SutHMbNTGoRhWnEmkcRoBqyXD6K7oOQtGZd4t4E/M+kEkglljRoMWpqDoA30R9eG6o9g0NAfpQWvNcVjJ9P5ZDPmRXy34PpjKuVFmE2znitKotLXhVYOvukS7SYL64fbtCv1meVEu577u/t0mOEYRxX8EkEcbuGpIH+ZiGZqmjBFxPobQE6ryytsaa+wxF7e1ejra7gdCfpoYrjlp3NUrbMsdgP4fW+oZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/alJ0yr0DqSkDDfJatotMNbjqqDOddZoNdl8Kuo6dTU=;
 b=ZOvqDdC5eK0T+60nzQBhS2wJ1L9NuGNhTTBwvUVyI2GPHj3vyD+qqZLoeyx9cT7XW11HQUbXFEgzq3c4wDNWd3dqDV4aTJJPapmAgq4FYO1M8cgxHEytZpwsTJIBP2EGiffS6EeulnTM6X0p2KX5VrDCUJfJmr2hzOUx46txIIEwqHF10tzi4jY1E8iI/fFW9CcWCk55pkbNq5kRgGlyegyKgZWTtKGelz3wYZk5cdXvgWQra6AtoDGJkRfNZOPd1dgwBaOJ8sG8lhDZkVAO41dmgO9YfwAyHklm8Ico99MMCWH4x0mncv8bBM8zQ3Cz9CIkOKHqTw6R0OY0NSwg2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/alJ0yr0DqSkDDfJatotMNbjqqDOddZoNdl8Kuo6dTU=;
 b=fDshiPYb90LWi5kWkQv6doD5pzEbb4IkPKFAZ+be/0qHZ1UwNjd2gBE6/kLFoHJeqSJ3asa0YqhMBSdqt0Uuo/AkumT+bQC+UQog2aY7e4+L6LAIS5jcsqdVbL4pgyeM1uTQVb3Fx6EZgnliqUR/8NQQdv0n/ruXSEJszItk56Q=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	Christian Lindig <christian.lindig@cloud.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v8 09/12] tools: add physinfo arch_capabilities handling
 for Arm
Thread-Topic: [PATCH v8 09/12] tools: add physinfo arch_capabilities handling
 for Arm
Thread-Index: AQHZk5EO/ZdBT4k0K0aZv7Y6q8RtUK99zTWA
Date: Tue, 6 Jun 2023 13:24:17 +0000
Message-ID: <01AD7206-23BD-49AF-87D1-B75AA91E1670@arm.com>
References: <20230531072413.868673-1-luca.fancellu@arm.com>
 <20230531072413.868673-10-luca.fancellu@arm.com>
In-Reply-To: <20230531072413.868673-10-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB10346:EE_|DBAEUR03FT035:EE_|PAWPR08MB8981:EE_
X-MS-Office365-Filtering-Correlation-Id: 39c8f675-969b-4de0-b032-08db66915d53
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jcOdNRAJAdDwOHKv6Z8wvJM8PdeNJD36d4IaQBKVt/8BNBWSPKSSi24/RvsF2x2gnO8jpIAiSA0IVsAyW8v+Ed1ATm7d0oXzPR03Ah02+uWCd61EtfAVd07clnsEy7CG/2jYZu046iHQiXaCRHkW5gf2+qfIxI/vUk0zsw6OctUX+fH6kTghnQwjXkahX81ipeHE3E12FRjJKHu99dNgUuHzSp46H+5buw23oiX7NAH1FFmYZxJ+HEKJ4DekYbTM2dJRr7BFyGTV6B4/o92//Qtwo+O0gRW8fJPzK9UbuWLLQNI3nTtJ9MnUAt4Lb54DzaHrZgIAGJ23rTcaHmvIUqcW/4z6ZP21M6shhEROhdKHGV5b4mj02UGpk72YMSD6GL1VToJhit2eGKWajMmgUrsUNMfnOdt2jDA0zwvmp3x9kGRzD4lA+yalemu11ztRXLxb/dZYZluACUgGCeRhU/nPajYvN1noi4HUxZ6debyYtAbxPHE6btO82jK1+k8cOo7iEs4aIhOCaVmex8vlM7/EL1rHVdSXPjS96qHfKb/3LzJoqL2f6LbQkOw7M/P8hVAS4vIl+lOWvIPNffXyT+KAwAe6O2UTZu+nPS3/vTQaNX+XvFo6bpXbr1sxwtoQuT6cf8+HVlir8ZZOO+LZVg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199021)(30864003)(2906002)(83380400001)(2616005)(38070700005)(33656002)(86362001)(36756003)(38100700002)(122000001)(6486002)(41300700001)(5660300002)(316002)(8936002)(8676002)(54906003)(478600001)(66556008)(91956017)(64756008)(66446008)(71200400001)(66946007)(76116006)(66476007)(4326008)(6512007)(53546011)(6506007)(6916009)(26005)(186003)(7416002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CF4BC59543F9C498088C92C59BC042F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10346
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9ac581ff-dfe7-4fee-96a3-08db6691548b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u1PaRrULAYu95v1TERDeKzDsyLmFGjC6zAXIqrC+296a6Q4ozOY9pA+8IYQi5qeP5lneiztbMikm0RMiacxQQw+0K+9sbQg2JwBsYqmW3Xq2RFvP6/ps2uJ0C9rOLT00UM9EvaHEjssY0GRfpEiMl4O1wdMH+WW17iHt5PgKcQ7Ev7TvdPgF1x/v7Sar/yCJFg4Vu44N6R1L3T+PVpBWgf6I2DcbEVtRgzf30A+SO63lpoeKB3mE6wZXR//2cuu8mSx6LLk8zvycSCGC2MbPfNFaa2kGSTHLzdbUO2C6OEreHQlRll/5fC3tGoMpwo8+ks7pgc2Gu0aglzw9/isASAaVPO8yoUmnacaWDiOpsIXpT2B7rZbTJzLz4aQEmfvFRYES9ESW3UxtNBz+mVRcDt3BiylVKA4wLBSxesv12WfASV7adu2IQdSsTQZ1jkj/fLr9aKBU116kD4X4HZXzSnijFvfbliHGpxzuDxvZ30EGKNpUs4vhmIXJuTkQqpumbRj4vPisF97nuITpgwuDRJlsA0biNowVNxkVgPFHP/I8oilz+/wugW0Sn8SwH2NTa+ckmLbKTPGBm3f1QR+06soS6W5FxWSkbTVvCyfXwo333IehagfJFXwTpNETeq3hmXKioXywcf9wJE95wscsqcHy/g1WfEH5nXaE9LQUZeuag/D2ImOx01vLgIL81Dgii4+45ddkySYCFijj5XlzZCHt57UeR2KtK3WlS4VmRvArH23lyDWaJ/hRSKTmIA5f
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(41300700001)(316002)(54906003)(356005)(81166007)(82740400003)(5660300002)(6862004)(2906002)(30864003)(4326008)(70206006)(70586007)(8936002)(8676002)(478600001)(6486002)(40460700003)(82310400005)(86362001)(2616005)(186003)(36756003)(26005)(53546011)(33656002)(336012)(36860700001)(40480700001)(47076005)(6512007)(6506007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 13:24:32.4957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c8f675-969b-4de0-b032-08db66915d53
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8981

DQoNCj4gT24gMzEgTWF5IDIwMjMsIGF0IDA4OjI0LCBMdWNhIEZhbmNlbGx1IDxMdWNhLkZhbmNl
bGx1QGFybS5jb20+IHdyb3RlOg0KPiANCj4gT24gQXJtLCB0aGUgU1ZFIHZlY3RvciBsZW5ndGgg
aXMgZW5jb2RlZCBpbiBhcmNoX2NhcGFiaWxpdGllcyBmaWVsZA0KPiBvZiBzdHJ1Y3QgeGVuX3N5
c2N0bF9waHlzaW5mbywgbWFrZSB1c2Ugb2YgdGhpcyBmaWVsZCBpbiB0aGUgdG9vbHMNCj4gd2hl
biBidWlsZGluZyBmb3IgYXJtLg0KPiANCj4gQ3JlYXRlIGhlYWRlciBhcm0tYXJjaC1jYXBhYmls
aXRpZXMuaCB0byBoYW5kbGUgdGhlIGFyY2hfY2FwYWJpbGl0aWVzDQo+IGZpZWxkIG9mIHBoeXNp
bmZvIGZvciBBcm0uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZh
bmNlbGx1QGFybS5jb20+DQo+IEFja2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFw
QGNpdHJpeC5jb20+DQo+IEFja2VkLWJ5OiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4ubGlu
ZGlnQGNsb3VkLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBl
cmFyZEBjaXRyaXguY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBmcm9tIHY3Og0KPiAtIGluIHhjLmMs
IGFkZCAiYXJtX3N2ZV92bCIgZW50cnkgdG8gdGhlIHB5dGhvbiBkaWN0IG9ubHkgb24gYXJtNjQu
DQo+ICAgKE1hcmVrKQ0KDQpIaSBNYXJlaywNCg0KQXJlIHlvdSBvayB3aXRoIHRoZSBjaGFuZ2Vz
IEnigJl2ZSBkb25lIHRvIGFkZHJlc3MgeW91ciBsYXN0IGNvbW1lbnQgb24gdjc/DQoNCkNoZWVy
cywNCkx1Y2ENCg0KPiBDaGFuZ2VzIGZyb20gdjY6DQo+IC0gRml4IGxpY2VuY2UgaGVhZGVyIGlu
IGFybS1hdGNoLWNhcGFiaWxpdGllcy5oLCBhZGQgUi1ieSAoQW50aG9ueSkNCj4gQ2hhbmdlcyBm
cm9tIHY1Og0KPiAtIG5vIGNoYW5nZXMNCj4gQ2hhbmdlcyBmcm9tIHY0Og0KPiAtIE1vdmUgYXJt
LWFyY2gtY2FwYWJpbGl0aWVzLmggaW50byB4ZW4tdG9vbHMvLCBhZGQgTElCWExfSEFWRV8sDQo+
ICAgZml4ZWQgcHl0aG9uIHJldHVybiB0eXBlIHRvIEkgaW5zdGVhZCBvZiBpLiAoQW50aG9ueSkN
Cj4gQ2hhbmdlcyBmcm9tIHYzOg0KPiAtIGFkZCBBY2stYnkgZm9yIHRoZSBHb2xhbmcgYml0cyAo
R2VvcmdlKQ0KPiAtIGFkZCBBY2stYnkgZm9yIHRoZSBPQ2FtbCB0b29scyAoQ2hyaXN0aWFuKQ0K
PiAtIG5vdyB4ZW4tdG9vbHMvbGlicy5oIGlzIG5hbWVkIHhlbi10b29scy9jb21tb24tbWFjcm9z
LmgNCj4gLSBjaGFuZ2VkIGNvbW1pdCBtZXNzYWdlIHRvIGV4cGxhaW4gd2h5IHRoZSBoZWFkZXIg
bW9kaWZpY2F0aW9uDQo+ICAgaW4gcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jDQo+IENoYW5n
ZXMgZnJvbSB2MjoNCj4gLSByZW5hbWUgYXJtX2FyY2hfY2FwYWJpbGl0aWVzLmggaW4gYXJtLWFy
Y2gtY2FwYWJpbGl0aWVzLmgsIHVzZQ0KPiAgIE1BU0tfRVhUUi4NCj4gLSBOb3cgYXJtLWFyY2gt
Y2FwYWJpbGl0aWVzLmggbmVlZHMgTUFTS19FWFRSIG1hY3JvLCBidXQgaXQgaXMNCj4gICBkZWZp
bmVkIGluIGxpYnhsX2ludGVybmFsLmgsIGl0IGRvZXNuJ3QgZmVlbCByaWdodCB0byBpbmNsdWRl
DQo+ICAgdGhhdCBoZWFkZXIgc28gbW92ZSBNQVNLX0VYVFIgaW50byB4ZW4tdG9vbHMvbGlicy5o
IHRoYXQgaXMgYWxzbw0KPiAgIGluY2x1ZGVkIGluIGxpYnhsX2ludGVybmFsLmgNCj4gQ2hhbmdl
cyBmcm9tIHYxOg0KPiAtIG5vdyBTVkUgVkwgaXMgZW5jb2RlZCBpbiBhcmNoX2NhcGFiaWxpdGll
cyBvbiBBcm0NCj4gQ2hhbmdlcyBmcm9tIFJGQzoNCj4gLSBuZXcgcGF0Y2gNCj4gLS0tDQo+IHRv
b2xzL2dvbGFuZy94ZW5saWdodC9oZWxwZXJzLmdlbi5nbyAgICAgICAgICB8ICAyICsNCj4gdG9v
bHMvZ29sYW5nL3hlbmxpZ2h0L3R5cGVzLmdlbi5nbyAgICAgICAgICAgIHwgIDEgKw0KPiB0b29s
cy9pbmNsdWRlL2xpYnhsLmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKysNCj4gLi4u
L2luY2x1ZGUveGVuLXRvb2xzL2FybS1hcmNoLWNhcGFiaWxpdGllcy5oIHwgMjggKysrKysrKysr
KysrKw0KPiB0b29scy9pbmNsdWRlL3hlbi10b29scy9jb21tb24tbWFjcm9zLmggICAgICAgfCAg
MiArDQo+IHRvb2xzL2xpYnMvbGlnaHQvbGlieGwuYyAgICAgICAgICAgICAgICAgICAgICB8ICAx
ICsNCj4gdG9vbHMvbGlicy9saWdodC9saWJ4bF9pbnRlcm5hbC5oICAgICAgICAgICAgIHwgIDEg
LQ0KPiB0b29scy9saWJzL2xpZ2h0L2xpYnhsX3R5cGVzLmlkbCAgICAgICAgICAgICAgfCAgMSAr
DQo+IHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbCAgICAgICAgICAgICAgICB8ICA0ICst
DQo+IHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkgICAgICAgICAgICAgICB8ICA0ICst
DQo+IHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jICAgICAgICAgICB8ICA4ICsr
LS0NCj4gdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jICAgICAgICAgICAgIHwgNDIg
KysrKysrKysrKysrKystLS0tLQ0KPiB0b29scy94bC94bF9pbmZvLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgOCArKysrDQo+IDEzIGZpbGVzIGNoYW5nZWQsIDg3IGluc2VydGlvbnMo
KyksIDIxIGRlbGV0aW9ucygtKQ0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvaW5jbHVkZS94
ZW4tdG9vbHMvYXJtLWFyY2gtY2FwYWJpbGl0aWVzLmgNCj4gDQo+IGRpZmYgLS1naXQgYS90b29s
cy9nb2xhbmcveGVubGlnaHQvaGVscGVycy5nZW4uZ28gYi90b29scy9nb2xhbmcveGVubGlnaHQv
aGVscGVycy5nZW4uZ28NCj4gaW5kZXggMGEyMDNkMjIzMjFmLi4zNTM5N2JlMmY5ZTIgMTAwNjQ0
DQo+IC0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC9oZWxwZXJzLmdlbi5nbw0KPiArKysgYi90
b29scy9nb2xhbmcveGVubGlnaHQvaGVscGVycy5nZW4uZ28NCj4gQEAgLTM1MDYsNiArMzUwNiw3
IEBAIHguQ2FwVm10cmFjZSA9IGJvb2woeGMuY2FwX3ZtdHJhY2UpDQo+IHguQ2FwVnBtdSA9IGJv
b2woeGMuY2FwX3ZwbXUpDQo+IHguQ2FwR250dGFiVjEgPSBib29sKHhjLmNhcF9nbnR0YWJfdjEp
DQo+IHguQ2FwR250dGFiVjIgPSBib29sKHhjLmNhcF9nbnR0YWJfdjIpDQo+ICt4LkFyY2hDYXBh
YmlsaXRpZXMgPSB1aW50MzIoeGMuYXJjaF9jYXBhYmlsaXRpZXMpDQo+IA0KPiAgcmV0dXJuIG5p
bH0NCj4gDQo+IEBAIC0zNTQwLDYgKzM1NDEsNyBAQCB4Yy5jYXBfdm10cmFjZSA9IEMuYm9vbCh4
LkNhcFZtdHJhY2UpDQo+IHhjLmNhcF92cG11ID0gQy5ib29sKHguQ2FwVnBtdSkNCj4geGMuY2Fw
X2dudHRhYl92MSA9IEMuYm9vbCh4LkNhcEdudHRhYlYxKQ0KPiB4Yy5jYXBfZ250dGFiX3YyID0g
Qy5ib29sKHguQ2FwR250dGFiVjIpDQo+ICt4Yy5hcmNoX2NhcGFiaWxpdGllcyA9IEMudWludDMy
X3QoeC5BcmNoQ2FwYWJpbGl0aWVzKQ0KPiANCj4gIHJldHVybiBuaWwNCj4gIH0NCj4gZGlmZiAt
LWdpdCBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC90eXBlcy5nZW4uZ28gYi90b29scy9nb2xhbmcv
eGVubGlnaHQvdHlwZXMuZ2VuLmdvDQo+IGluZGV4IGE3YzE3Njk5ZjgwZS4uM2Q5NjhhNDk2NzQ0
IDEwMDY0NA0KPiAtLS0gYS90b29scy9nb2xhbmcveGVubGlnaHQvdHlwZXMuZ2VuLmdvDQo+ICsr
KyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC90eXBlcy5nZW4uZ28NCj4gQEAgLTEwNzksNiArMTA3
OSw3IEBAIENhcFZtdHJhY2UgYm9vbA0KPiBDYXBWcG11IGJvb2wNCj4gQ2FwR250dGFiVjEgYm9v
bA0KPiBDYXBHbnR0YWJWMiBib29sDQo+ICtBcmNoQ2FwYWJpbGl0aWVzIHVpbnQzMg0KPiB9DQo+
IA0KPiB0eXBlIENvbm5lY3RvcmluZm8gc3RydWN0IHsNCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2lu
Y2x1ZGUvbGlieGwuaCBiL3Rvb2xzL2luY2x1ZGUvbGlieGwuaA0KPiBpbmRleCBjZmExYTE5MTMx
OGMuLjRmYTA5ZmY3NjM1YSAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvaW5jbHVkZS9saWJ4bC5oDQo+
ICsrKyBiL3Rvb2xzL2luY2x1ZGUvbGlieGwuaA0KPiBAQCAtNTI1LDYgKzUyNSwxMiBAQA0KPiAg
Ki8NCj4gI2RlZmluZSBMSUJYTF9IQVZFX1BIWVNJTkZPX0NBUF9HTlRUQUIgMQ0KPiANCj4gKy8q
DQo+ICsgKiBMSUJYTF9IQVZFX1BIWVNJTkZPX0FSQ0hfQ0FQQUJJTElUSUVTIGluZGljYXRlcyB0
aGF0IGxpYnhsX3BoeXNpbmZvIGhhcyBhDQo+ICsgKiBhcmNoX2NhcGFiaWxpdGllcyBmaWVsZC4N
Cj4gKyAqLw0KPiArI2RlZmluZSBMSUJYTF9IQVZFX1BIWVNJTkZPX0FSQ0hfQ0FQQUJJTElUSUVT
IDENCj4gKw0KPiAvKg0KPiAgKiBMSUJYTF9IQVZFX01BWF9HUkFOVF9WRVJTSU9OIGluZGljYXRl
cyBsaWJ4bF9kb21haW5fYnVpbGRfaW5mbyBoYXMgYQ0KPiAgKiBtYXhfZ3JhbnRfdmVyc2lvbiBm
aWVsZCBmb3Igc2V0dGluZyB0aGUgbWF4IGdyYW50IHRhYmxlIHZlcnNpb24gcGVyDQo+IGRpZmYg
LS1naXQgYS90b29scy9pbmNsdWRlL3hlbi10b29scy9hcm0tYXJjaC1jYXBhYmlsaXRpZXMuaCBi
L3Rvb2xzL2luY2x1ZGUveGVuLXRvb2xzL2FybS1hcmNoLWNhcGFiaWxpdGllcy5oDQo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMzg0OWU4OTc5MjVkDQo+IC0t
LSAvZGV2L251bGwNCj4gKysrIGIvdG9vbHMvaW5jbHVkZS94ZW4tdG9vbHMvYXJtLWFyY2gtY2Fw
YWJpbGl0aWVzLmgNCj4gQEAgLTAsMCArMSwyOCBAQA0KPiArLyogU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IExHUEwtMi4xLW9ubHkgKi8NCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjMg
QVJNIEx0ZC4NCj4gKyAqLw0KPiArDQo+ICsjaWZuZGVmIEFSTV9BUkNIX0NBUEFCSUxJVElFU19I
DQo+ICsjZGVmaW5lIEFSTV9BUkNIX0NBUEFCSUxJVElFU19IDQo+ICsNCj4gKyNpbmNsdWRlIDxz
dGRpbnQuaD4NCj4gKyNpbmNsdWRlIDx4ZW4vc3lzY3RsLmg+DQo+ICsNCj4gKyNpbmNsdWRlIDx4
ZW4tdG9vbHMvY29tbW9uLW1hY3Jvcy5oPg0KPiArDQo+ICtzdGF0aWMgaW5saW5lDQo+ICt1bnNp
Z25lZCBpbnQgYXJjaF9jYXBhYmlsaXRpZXNfYXJtX3N2ZSh1bnNpZ25lZCBpbnQgYXJjaF9jYXBh
YmlsaXRpZXMpDQo+ICt7DQo+ICsjaWYgZGVmaW5lZChfX2FhcmNoNjRfXykNCj4gKyAgICB1bnNp
Z25lZCBpbnQgc3ZlX3ZsID0gTUFTS19FWFRSKGFyY2hfY2FwYWJpbGl0aWVzLA0KPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWEVOX1NZU0NUTF9QSFlTQ0FQX0FSTV9TVkVf
TUFTSyk7DQo+ICsNCj4gKyAgICAvKiBWZWN0b3IgbGVuZ3RoIGlzIGRpdmlkZWQgYnkgMTI4IGJl
Zm9yZSBzdG9yaW5nIGl0IGluIGFyY2hfY2FwYWJpbGl0aWVzICovDQo+ICsgICAgcmV0dXJuIHN2
ZV92bCAqIDEyOFU7DQo+ICsjZWxzZQ0KPiArICAgIHJldHVybiAwOw0KPiArI2VuZGlmDQo+ICt9
DQo+ICsNCj4gKyNlbmRpZiAvKiBBUk1fQVJDSF9DQVBBQklMSVRJRVNfSCAqLw0KPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvaW5jbHVkZS94ZW4tdG9vbHMvY29tbW9uLW1hY3Jvcy5oIGIvdG9vbHMvaW5j
bHVkZS94ZW4tdG9vbHMvY29tbW9uLW1hY3Jvcy5oDQo+IGluZGV4IDc2YjU1YmY2MjA4NS4uZDUz
Yjg4MTgyNTYwIDEwMDY0NA0KPiAtLS0gYS90b29scy9pbmNsdWRlL3hlbi10b29scy9jb21tb24t
bWFjcm9zLmgNCj4gKysrIGIvdG9vbHMvaW5jbHVkZS94ZW4tdG9vbHMvY29tbW9uLW1hY3Jvcy5o
DQo+IEBAIC03Miw2ICs3Miw4IEBADQo+ICNkZWZpbmUgUk9VTkRVUChfeCxfdykgKCgodW5zaWdu
ZWQgbG9uZykoX3gpKygxVUw8PChfdykpLTEpICYgfigoMVVMPDwoX3cpKS0xKSkNCj4gI2VuZGlm
DQo+IA0KPiArI2RlZmluZSBNQVNLX0VYVFIodiwgbSkgKCgodikgJiAobSkpIC8gKChtKSAmIC0o
bSkpKQ0KPiArDQo+ICNpZm5kZWYgX19tdXN0X2NoZWNrDQo+ICNkZWZpbmUgX19tdXN0X2NoZWNr
IF9fYXR0cmlidXRlX18oKF9fd2Fybl91bnVzZWRfcmVzdWx0X18pKQ0KPiAjZW5kaWYNCj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGwuYyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGli
eGwuYw0KPiBpbmRleCBhMGJmN2QxODZmNjkuLjE3NWQ2ZGRlMGI4MCAxMDA2NDQNCj4gLS0tIGEv
dG9vbHMvbGlicy9saWdodC9saWJ4bC5jDQo+ICsrKyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGwu
Yw0KPiBAQCAtNDA5LDYgKzQwOSw3IEBAIGludCBsaWJ4bF9nZXRfcGh5c2luZm8obGlieGxfY3R4
ICpjdHgsIGxpYnhsX3BoeXNpbmZvICpwaHlzaW5mbykNCj4gICAgICAgICAhISh4Y3BoeXNpbmZv
LmNhcGFiaWxpdGllcyAmIFhFTl9TWVNDVExfUEhZU0NBUF9nbnR0YWJfdjEpOw0KPiAgICAgcGh5
c2luZm8tPmNhcF9nbnR0YWJfdjIgPQ0KPiAgICAgICAgICEhKHhjcGh5c2luZm8uY2FwYWJpbGl0
aWVzICYgWEVOX1NZU0NUTF9QSFlTQ0FQX2dudHRhYl92Mik7DQo+ICsgICAgcGh5c2luZm8tPmFy
Y2hfY2FwYWJpbGl0aWVzID0geGNwaHlzaW5mby5hcmNoX2NhcGFiaWxpdGllczsNCj4gDQo+ICAg
ICBHQ19GUkVFOw0KPiAgICAgcmV0dXJuIDA7DQo+IGRpZmYgLS1naXQgYS90b29scy9saWJzL2xp
Z2h0L2xpYnhsX2ludGVybmFsLmggYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX2ludGVybmFsLmgN
Cj4gaW5kZXggNTI0NGZkZTYyMzlhLi44YWJhM2UxMzg5MDkgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xz
L2xpYnMvbGlnaHQvbGlieGxfaW50ZXJuYWwuaA0KPiArKysgYi90b29scy9saWJzL2xpZ2h0L2xp
YnhsX2ludGVybmFsLmgNCj4gQEAgLTEzMiw3ICsxMzIsNiBAQA0KPiANCj4gI2RlZmluZSBESVZf
Uk9VTkRVUChuLCBkKSAoKChuKSArIChkKSAtIDEpIC8gKGQpKQ0KPiANCj4gLSNkZWZpbmUgTUFT
S19FWFRSKHYsIG0pICgoKHYpICYgKG0pKSAvICgobSkgJiAtKG0pKSkNCj4gI2RlZmluZSBNQVNL
X0lOU1IodiwgbSkgKCgodikgKiAoKG0pICYgLShtKSkpICYgKG0pKQ0KPiANCj4gI2RlZmluZSBM
SUJYTF9fTE9HR0lOR19FTkFCTEVEDQo+IGRpZmYgLS1naXQgYS90b29scy9saWJzL2xpZ2h0L2xp
YnhsX3R5cGVzLmlkbCBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfdHlwZXMuaWRsDQo+IGluZGV4
IGMxMDI5MmUwZDdlMy4uZmQzMWRhY2Y3ZDVhIDEwMDY0NA0KPiAtLS0gYS90b29scy9saWJzL2xp
Z2h0L2xpYnhsX3R5cGVzLmlkbA0KPiArKysgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX3R5cGVz
LmlkbA0KPiBAQCAtMTEzMyw2ICsxMTMzLDcgQEAgbGlieGxfcGh5c2luZm8gPSBTdHJ1Y3QoInBo
eXNpbmZvIiwgWw0KPiAgICAgKCJjYXBfdnBtdSIsIGJvb2wpLA0KPiAgICAgKCJjYXBfZ250dGFi
X3YxIiwgYm9vbCksDQo+ICAgICAoImNhcF9nbnR0YWJfdjIiLCBib29sKSwNCj4gKyAgICAoImFy
Y2hfY2FwYWJpbGl0aWVzIiwgdWludDMyKSwNCj4gICAgIF0sIGRpcj1ESVJfT1VUKQ0KPiANCj4g
bGlieGxfY29ubmVjdG9yaW5mbyA9IFN0cnVjdCgiY29ubmVjdG9yaW5mbyIsIFsNCj4gZGlmZiAt
LWdpdCBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbCBiL3Rvb2xzL29jYW1sL2xpYnMv
eGMveGVuY3RybC5tbA0KPiBpbmRleCBlNDA5NmJmOTJjMWQuLmJmMjNjYTUwYmIxNSAxMDA2NDQN
Cj4gLS0tIGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sDQo+ICsrKyBiL3Rvb2xzL29j
YW1sL2xpYnMveGMveGVuY3RybC5tbA0KPiBAQCAtMTI4LDEyICsxMjgsMTAgQEAgdHlwZSBwaHlz
aW5mb19jYXBfZmxhZyA9DQo+ICAgfCBDQVBfR250dGFiX3YxDQo+ICAgfCBDQVBfR250dGFiX3Yy
DQo+IA0KPiAtdHlwZSBhcm1fcGh5c2luZm9fY2FwX2ZsYWcNCj4gLQ0KPiB0eXBlIHg4Nl9waHlz
aW5mb19jYXBfZmxhZw0KPiANCj4gdHlwZSBhcmNoX3BoeXNpbmZvX2NhcF9mbGFncyA9DQo+IC0g
IHwgQVJNIG9mIGFybV9waHlzaW5mb19jYXBfZmxhZyBsaXN0DQo+ICsgIHwgQVJNIG9mIGludA0K
PiAgIHwgWDg2IG9mIHg4Nl9waHlzaW5mb19jYXBfZmxhZyBsaXN0DQo+IA0KPiB0eXBlIHBoeXNp
bmZvID0NCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkgYi90
b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpDQo+IGluZGV4IGVmMjI1NDUzNzQzMC4uZWQx
ZTI4ZWEzMGEwIDEwMDY0NA0KPiAtLS0gYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxp
DQo+ICsrKyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkNCj4gQEAgLTExMywxMiAr
MTEzLDEwIEBAIHR5cGUgcGh5c2luZm9fY2FwX2ZsYWcgPQ0KPiAgIHwgQ0FQX0dudHRhYl92MQ0K
PiAgIHwgQ0FQX0dudHRhYl92Mg0KPiANCj4gLXR5cGUgYXJtX3BoeXNpbmZvX2NhcF9mbGFnDQo+
IC0NCj4gdHlwZSB4ODZfcGh5c2luZm9fY2FwX2ZsYWcNCj4gDQo+IHR5cGUgYXJjaF9waHlzaW5m
b19jYXBfZmxhZ3MgPQ0KPiAtICB8IEFSTSBvZiBhcm1fcGh5c2luZm9fY2FwX2ZsYWcgbGlzdA0K
PiArICB8IEFSTSBvZiBpbnQNCj4gICB8IFg4NiBvZiB4ODZfcGh5c2luZm9fY2FwX2ZsYWcgbGlz
dA0KPiANCj4gdHlwZSBwaHlzaW5mbyA9IHsNCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1sL2xp
YnMveGMveGVuY3RybF9zdHVicy5jIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJz
LmMNCj4gaW5kZXggZjY4NmRiMzEyNGVlLi5hMDNkYTMxZjZmMmMgMTAwNjQ0DQo+IC0tLSBhL3Rv
b2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jDQo+ICsrKyBiL3Rvb2xzL29jYW1sL2xp
YnMveGMveGVuY3RybF9zdHVicy5jDQo+IEBAIC04NTEsMTMgKzg1MSwxNSBAQCBDQU1McHJpbSB2
YWx1ZSBzdHViX3hjX3BoeXNpbmZvKHZhbHVlIHhjaF92YWwpDQo+IGFyY2hfY2FwX2xpc3QgPSBU
YWdfY29uczsNCj4gDQo+IGFyY2hfY2FwX2ZsYWdzX3RhZyA9IDE7IC8qIHRhZyB4ODYgKi8NCj4g
LSNlbHNlDQo+IC0gY2FtbF9mYWlsd2l0aCgiVW5oYW5kbGVkIGFyY2hpdGVjdHVyZSIpOw0KPiAt
I2VuZGlmDQo+IA0KPiBhcmNoX2NhcF9mbGFncyA9IGNhbWxfYWxsb2Nfc21hbGwoMSwgYXJjaF9j
YXBfZmxhZ3NfdGFnKTsNCj4gU3RvcmVfZmllbGQoYXJjaF9jYXBfZmxhZ3MsIDAsIGFyY2hfY2Fw
X2xpc3QpOw0KPiBTdG9yZV9maWVsZChwaHlzaW5mbywgMTAsIGFyY2hfY2FwX2ZsYWdzKTsNCj4g
KyNlbGlmIGRlZmluZWQoX19hYXJjaDY0X18pDQo+ICsgU3RvcmVfZmllbGQocGh5c2luZm8sIDEw
LCBWYWxfaW50KGNfcGh5c2luZm8uYXJjaF9jYXBhYmlsaXRpZXMpKTsNCj4gKyNlbHNlDQo+ICsg
Y2FtbF9mYWlsd2l0aCgiVW5oYW5kbGVkIGFyY2hpdGVjdHVyZSIpOw0KPiArI2VuZGlmDQo+IA0K
PiBDQU1McmV0dXJuKHBoeXNpbmZvKTsNCj4gfQ0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvcHl0aG9u
L3hlbi9sb3dsZXZlbC94Yy94Yy5jIGIvdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5j
DQo+IGluZGV4IDk3MjhiMzQxODVhYy4uNDkxZTg4OTc3ZmQzIDEwMDY0NA0KPiAtLS0gYS90b29s
cy9weXRob24veGVuL2xvd2xldmVsL3hjL3hjLmMNCj4gKysrIGIvdG9vbHMvcHl0aG9uL3hlbi9s
b3dsZXZlbC94Yy94Yy5jDQo+IEBAIC0yMiw2ICsyMiw3IEBADQo+ICNpbmNsdWRlIDx4ZW4vaHZt
L2h2bV9pbmZvX3RhYmxlLmg+DQo+ICNpbmNsdWRlIDx4ZW4vaHZtL3BhcmFtcy5oPg0KPiANCj4g
KyNpbmNsdWRlIDx4ZW4tdG9vbHMvYXJtLWFyY2gtY2FwYWJpbGl0aWVzLmg+DQo+ICNpbmNsdWRl
IDx4ZW4tdG9vbHMvY29tbW9uLW1hY3Jvcy5oPg0KPiANCj4gLyogTmVlZGVkIGZvciBQeXRob24g
dmVyc2lvbnMgZWFybGllciB0aGFuIDIuMy4gKi8NCj4gQEAgLTg3MSw2ICs4NzIsNyBAQCBzdGF0
aWMgUHlPYmplY3QgKnB5eGNfcGh5c2luZm8oWGNPYmplY3QgKnNlbGYpDQo+ICAgICBjb25zdCBj
aGFyICp2aXJ0Y2FwX25hbWVzW10gPSB7ICJodm0iLCAicHYiIH07DQo+ICAgICBjb25zdCB1bnNp
Z25lZCB2aXJ0Y2Fwc19iaXRzW10gPSB7IFhFTl9TWVNDVExfUEhZU0NBUF9odm0sDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFhFTl9TWVNDVExfUEhZU0NBUF9wdiB9
Ow0KPiArICAgIFB5T2JqZWN0ICpvYmpyZXQ7DQo+IA0KPiAgICAgaWYgKCB4Y19waHlzaW5mbyhz
ZWxmLT54Y19oYW5kbGUsICZwaW5mbykgIT0gMCApDQo+ICAgICAgICAgcmV0dXJuIHB5eGNfZXJy
b3JfdG9fZXhjZXB0aW9uKHNlbGYtPnhjX2hhbmRsZSk7DQo+IEBAIC04OTcsMTcgKzg5OSwzNSBA
QCBzdGF0aWMgUHlPYmplY3QgKnB5eGNfcGh5c2luZm8oWGNPYmplY3QgKnNlbGYpDQo+ICAgICBp
ZiAoIHAgIT0gdmlydF9jYXBzICkNCj4gICAgICAgKihwLTEpID0gJ1wwJzsNCj4gDQo+IC0gICAg
cmV0dXJuIFB5X0J1aWxkVmFsdWUoIntzOmksczppLHM6aSxzOmksczpsLHM6bCxzOmwsczppLHM6
cyxzOnN9IiwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAibnJfbm9kZXMiLCAgICAg
ICAgIHBpbmZvLm5yX25vZGVzLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ0aHJl
YWRzX3Blcl9jb3JlIiwgcGluZm8udGhyZWFkc19wZXJfY29yZSwNCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAiY29yZXNfcGVyX3NvY2tldCIsIHBpbmZvLmNvcmVzX3Blcl9zb2NrZXQs
DQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIm5yX2NwdXMiLCAgICAgICAgICBwaW5m
by5ucl9jcHVzLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ0b3RhbF9tZW1vcnki
LCAgICAgcGFnZXNfdG9fa2liKHBpbmZvLnRvdGFsX3BhZ2VzKSwNCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAiZnJlZV9tZW1vcnkiLCAgICAgIHBhZ2VzX3RvX2tpYihwaW5mby5mcmVl
X3BhZ2VzKSwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAic2NydWJfbWVtb3J5Iiwg
ICAgIHBhZ2VzX3RvX2tpYihwaW5mby5zY3J1Yl9wYWdlcyksDQo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgImNwdV9raHoiLCAgICAgICAgICBwaW5mby5jcHVfa2h6LA0KPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJod19jYXBzIiwgICAgICAgICAgY3B1X2NhcCwNCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAidmlydF9jYXBzIiwgICAgICAgIHZpcnRfY2Fwcyk7
DQo+ICsgICAgb2JqcmV0ID0gUHlfQnVpbGRWYWx1ZSgie3M6aSxzOmksczppLHM6aSxzOmwsczps
LHM6bCxzOmksczpzLHM6c30iLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIm5yX25v
ZGVzIiwgICAgICAgICBwaW5mby5ucl9ub2RlcywNCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJ0aHJlYWRzX3Blcl9jb3JlIiwgcGluZm8udGhyZWFkc19wZXJfY29yZSwNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJjb3Jlc19wZXJfc29ja2V0IiwgcGluZm8uY29yZXNfcGVy
X3NvY2tldCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICJucl9jcHVzIiwgICAgICAg
ICAgcGluZm8ubnJfY3B1cywNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICJ0b3RhbF9t
ZW1vcnkiLCAgICAgcGFnZXNfdG9fa2liKHBpbmZvLnRvdGFsX3BhZ2VzKSwNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJmcmVlX21lbW9yeSIsICAgICAgcGFnZXNfdG9fa2liKHBpbmZv
LmZyZWVfcGFnZXMpLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgInNjcnViX21lbW9y
eSIsICAgICBwYWdlc190b19raWIocGluZm8uc2NydWJfcGFnZXMpLA0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgImNwdV9raHoiLCAgICAgICAgICBwaW5mby5jcHVfa2h6LA0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgImh3X2NhcHMiLCAgICAgICAgICBjcHVfY2FwLA0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgInZpcnRfY2FwcyIsICAgICAgICB2aXJ0X2NhcHMp
Ow0KPiArDQo+ICsjaWYgZGVmaW5lZChfX2FhcmNoNjRfXykNCj4gKyAgICBpZiAoIG9ianJldCAp
IHsNCj4gKyAgICAgICAgdW5zaWduZWQgaW50IHN2ZV92bF9iaXRzOw0KPiArICAgICAgICBQeU9i
amVjdCAqcHlfYXJtX3N2ZV92bDsNCj4gKw0KPiArICAgICAgICBzdmVfdmxfYml0cyA9IGFyY2hf
Y2FwYWJpbGl0aWVzX2FybV9zdmUocGluZm8uYXJjaF9jYXBhYmlsaXRpZXMpOw0KPiArICAgICAg
ICBweV9hcm1fc3ZlX3ZsID0gUHlMb25nX0Zyb21VbnNpZ25lZExvbmcoc3ZlX3ZsX2JpdHMpOw0K
PiArDQo+ICsgICAgICAgIGlmICggIXB5X2FybV9zdmVfdmwgKQ0KPiArICAgICAgICAgICAgcmV0
dXJuIE5VTEw7DQo+ICsNCj4gKyAgICAgICAgaWYoIFB5RGljdF9TZXRJdGVtU3RyaW5nKG9ianJl
dCwgImFybV9zdmVfdmwiLCBweV9hcm1fc3ZlX3ZsKSApDQo+ICsgICAgICAgICAgICByZXR1cm4g
TlVMTDsNCj4gKyAgICB9DQo+ICsjZW5kaWYNCj4gKw0KPiArICAgIHJldHVybiBvYmpyZXQ7DQo+
IH0NCj4gDQo+IHN0YXRpYyBQeU9iamVjdCAqcHl4Y19nZXRjcHVpbmZvKFhjT2JqZWN0ICpzZWxm
LCBQeU9iamVjdCAqYXJncywgUHlPYmplY3QgKmt3ZHMpDQo+IGRpZmYgLS1naXQgYS90b29scy94
bC94bF9pbmZvLmMgYi90b29scy94bC94bF9pbmZvLmMNCj4gaW5kZXggNzEyYjc2MzhiMDEzLi5k
ZGM0MmY5NmI5NzkgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL3hsL3hsX2luZm8uYw0KPiArKysgYi90
b29scy94bC94bF9pbmZvLmMNCj4gQEAgLTI3LDYgKzI3LDcgQEANCj4gI2luY2x1ZGUgPGxpYnhs
X2pzb24uaD4NCj4gI2luY2x1ZGUgPGxpYnhsX3V0aWxzLmg+DQo+ICNpbmNsdWRlIDxsaWJ4bHV0
aWwuaD4NCj4gKyNpbmNsdWRlIDx4ZW4tdG9vbHMvYXJtLWFyY2gtY2FwYWJpbGl0aWVzLmg+DQo+
IA0KPiAjaW5jbHVkZSAieGwuaCINCj4gI2luY2x1ZGUgInhsX3V0aWxzLmgiDQo+IEBAIC0yMjQs
NiArMjI1LDEzIEBAIHN0YXRpYyB2b2lkIG91dHB1dF9waHlzaW5mbyh2b2lkKQ0KPiAgICAgICAg
ICBpbmZvLmNhcF9nbnR0YWJfdjIgPyAiIGdudHRhYi12MiIgOiAiIg0KPiAgICAgICAgICk7DQo+
IA0KPiArICAgIC8qIFByaW50IGFybSBTVkUgdmVjdG9yIGxlbmd0aCBvbmx5IG9uIEFSTSBwbGF0
Zm9ybXMgKi8NCj4gKyNpZiBkZWZpbmVkKF9fYWFyY2g2NF9fKQ0KPiArICAgIG1heWJlX3ByaW50
ZigiYXJtX3N2ZV92ZWN0b3JfbGVuZ3RoICA6ICV1XG4iLA0KPiArICAgICAgICAgYXJjaF9jYXBh
YmlsaXRpZXNfYXJtX3N2ZShpbmZvLmFyY2hfY2FwYWJpbGl0aWVzKQ0KPiArICAgICAgICApOw0K
PiArI2VuZGlmDQo+ICsNCj4gICAgIHZpbmZvID0gbGlieGxfZ2V0X3ZlcnNpb25faW5mbyhjdHgp
Ow0KPiAgICAgaWYgKHZpbmZvKSB7DQo+ICAgICAgICAgaSA9ICgxIDw8IDIwKSAvIHZpbmZvLT5w
YWdlc2l6ZTsNCj4gLS0gDQo+IDIuMzQuMQ0KPiANCj4gDQoNCg==

