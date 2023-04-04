Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A516D63CC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 15:49:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517878.803823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjh1t-00066O-5Y; Tue, 04 Apr 2023 13:48:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517878.803823; Tue, 04 Apr 2023 13:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjh1t-00064g-2E; Tue, 04 Apr 2023 13:48:57 +0000
Received: by outflank-mailman (input) for mailman id 517878;
 Tue, 04 Apr 2023 13:48:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMxR=73=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pjh1r-000645-2z
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 13:48:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7d00::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ea399f3-d2ef-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 15:48:51 +0200 (CEST)
Received: from DU2PR04CA0327.eurprd04.prod.outlook.com (2603:10a6:10:2b5::32)
 by DU0PR08MB9824.eurprd08.prod.outlook.com (2603:10a6:10:443::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 13:48:49 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::dc) by DU2PR04CA0327.outlook.office365.com
 (2603:10a6:10:2b5::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22 via Frontend
 Transport; Tue, 4 Apr 2023 13:48:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.22 via Frontend Transport; Tue, 4 Apr 2023 13:48:48 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Tue, 04 Apr 2023 13:48:48 +0000
Received: from b5273e95bc26.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C0E0D05A-41F1-4CB3-8A13-790796B09FB8.1; 
 Tue, 04 Apr 2023 13:48:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b5273e95bc26.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 04 Apr 2023 13:48:37 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by DU0PR08MB9396.eurprd08.prod.outlook.com (2603:10a6:10:423::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 13:48:34 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::7b58:72de:8c37:5104]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::7b58:72de:8c37:5104%6]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 13:48:34 +0000
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
X-Inumbo-ID: 6ea399f3-d2ef-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yu4G5C5PAz4602WPmtEDrxcOgB32F/GfLy1j4u4kXq4=;
 b=ChSO1tDiwBHwHSg4cspdN2v239HQfqI+k3VD3oq2iNo5a2J22+UolWFWprwAbHyg4Kk7xxWWi17R9oZTVYf4zg4fUsf0lNobqlXRMUgwoK/2wRy3dPfapJdsoR6CZ8yEFOQOXxWCEm0O9npWKiyWGbYxdNilUAQwEWBVDwpyLmU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8a7c52f910f13e3e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y77Pmyo5vpXOmzKkJG6aKdl4TwdtzFrg5QSdlxAubVExdq/OevnWC5wlV5EnYeNzQ0OcrH1cSRI7JRpaURti++raDcHth06HESKl7yIBTByJxDL9oZ4vWD0TCowVkAj6eaXO2909yR4P7CYhdaNreqfawhHxX5/o7GcB9ji/hgiPYSwDyqSisrDmuiYKd3U4iyWjCJwjjSMgUJg7uiZ0nta7sDiFOkLKUMmfWDSRnDtQ4HlpNJ0kBL1WT/BvOM1gEMgQp3cycSIyr25BdOG0LrINCjbSji3nSpDSHuAffUAg5AcZ5xKuTGZsEsDMHd0OG9a19MxRLUbNchSQMZG8fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yu4G5C5PAz4602WPmtEDrxcOgB32F/GfLy1j4u4kXq4=;
 b=j2WZ6zbuRzT8+PlbW470uczrj7E7v1D+xhwtFA2MbAthaofo8Ly/xZ6mCRxnhDl7z2o9CrVXqHnbzl06xla8S8s5w2bg3LW2L2d6nE8Ii9i+vJDmPGusXNeCWNHMhGgCJTKr8UIom4/5FDYp65jwtq2REeg4IvszYCoffLUalNaseG6a7pNfrd9iyBDxICwrpqDngU5sTHoXGM/Fspk/jAbW2Aqe5wBKhRIkmEBRvHQw6dlN7NYGa8HRpmTTbysw/b5DcwWzN4TJ81Ya6ySMndGxmJiO/KSzcQgn7CWBWdqcqA7qcEJ5WRyvxPMcJWbrXvIIVasCrxJ7MQVDFPZx1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yu4G5C5PAz4602WPmtEDrxcOgB32F/GfLy1j4u4kXq4=;
 b=ChSO1tDiwBHwHSg4cspdN2v239HQfqI+k3VD3oq2iNo5a2J22+UolWFWprwAbHyg4Kk7xxWWi17R9oZTVYf4zg4fUsf0lNobqlXRMUgwoK/2wRy3dPfapJdsoR6CZ8yEFOQOXxWCEm0O9npWKiyWGbYxdNilUAQwEWBVDwpyLmU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@cloud.com>
Subject: Re: [PATCH v4 10/12] xen/tools: add sve parameter in XL configuration
Thread-Topic: [PATCH v4 10/12] xen/tools: add sve parameter in XL
 configuration
Thread-Index: AQHZYJtmX5JG1Zpok0mjr+irvDjf6q8U92AAgAY/qIA=
Date: Tue, 4 Apr 2023 13:48:34 +0000
Message-ID: <328A9CBD-5FCE-481B-93AF-D139963488D5@arm.com>
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
 <20230327105944.1360856-11-luca.fancellu@arm.com>
 <9bd2924b-bb4a-440d-ae31-0253e66c56e5@perard>
In-Reply-To: <9bd2924b-bb4a-440d-ae31-0253e66c56e5@perard>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|DU0PR08MB9396:EE_|DBAEUR03FT019:EE_|DU0PR08MB9824:EE_
X-MS-Office365-Filtering-Correlation-Id: d29897bf-f5a4-4ab3-b278-08db35135169
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KDc67oFzZs6C6dfrCcNHtXqvDa74BtN+tpfKg+oDzBewcVhCJndnH34TiE/t5j6PtFfxfPxUUHv4PK2+ohM23NAR2c6e5ItqF2wm43nj6jswniBBT0vv6zpTs4E0PIx9fdFlQ72sISliZhn0N1mpgyLsV8oYt+KlaPORkEMZxX4F4YHJ3ob30Vt7s8gNb8dCiZJLnz/lv4Pd2yCIioCjAjq3zttHOlyfMwZGsu0vHr2rJqMZKzXF3EtKy/TgR/9VqpF+Uzqs9wFUZi9vqzqI9QQJ47fnmJGAj+E0lr4fElhg1UrHGrZStwdcpJSa/tTaKVF4MJF6IXaU/jyx0xflt6SdJ8IQ37c0V7BEPxJT5gZ7AwW5tKeeK8BCWUU8bYXTFHzsQU1goF2bsa6xBjA9SNv/UKVbFiUhrKpM6kALWitSRj2Kk2OqJ0VSadfMbxD6AFHvbRTmoNej58TkA+3Q/iMz6KPHN1kcFMr3JNiyz38ock6j8v9yl/nHLD/4SOqIfznmNs/vdyTQnIujNBDmJTpHKhmt+7ZyVDlaaAUG9GuPsFwYTKRmVURMtAtJUW9y2mzqgiWnZOBP5h/oOI2pv0oYYVuYwFOyBcao7gDcHm1QxdWg55iCu5A41giQMtJ+ViA84hTE7gJK1tncRNh6aQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199021)(38070700005)(6512007)(26005)(6506007)(33656002)(86362001)(36756003)(53546011)(122000001)(2616005)(83380400001)(38100700002)(186003)(66446008)(66556008)(91956017)(66476007)(66946007)(64756008)(478600001)(76116006)(2906002)(6916009)(4326008)(5660300002)(8676002)(316002)(41300700001)(8936002)(71200400001)(54906003)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <73907EEA8D744543B8238637242D9E44@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9396
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	21826133-0d7d-48dc-9e91-08db351348b2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qVuSKC7yfB3hKC7oQ9H9IbOO/rcNRFE2jmBjPAlkK/gDZRQYi5GJGCClfkON6RGSbBGms2b38BJrkAd8Snr6YTCCE/H0aewV9jdVjnDRe9V4exr0v52hZXSYlLbJqbBwmPuz+K3m90K0o6WycmO/9QB5NMs8xwrFa7Z0ZlFzGtmJEnoqiSICF8Jg3+8k+Nfo8CQN3CbfogSRj3egIMUuEIaEVsIc+eXA9wqwIBRLwid6YsgspyEclXANNeambWBlLSY5+pRfaqFkVfCTTX6QuaeZpK2lcQCBouG5OUpkJm7Rxx5NHG3TevYsjk9/ThmhNP4JcXqB7s1D6JeChqGbwSmBbUuu/vSD2tj8d4VVjFmMBsLElKS4Yt9vBGrGLQ2RygKXQRd0evsHkCnjmO3yemfUOyMrVHZNudlR66Nk7KO29LOM+HkB2XdN/ArzK/Qof8LSPGj/gRX8fmtT3c1twHG6rwVWwBlG9s44qAfI5edmzsElFNeL/+WiCP//pPkHEa7jtqz2QpeNNjN/ywXO14LluR+kvI4wQvao3xfq/eUO44jMSYo9aSb4HqbnLw9tCIEdXtREPfPFQE77NlKW6m75lS6D5KuwYdLMs/FJ62PgVeW0Xd0j2841PKanzkjulOZlmw9AeIOT+on6D5Lz1qdsMX20bT0HfbnrAljlIdqfqTJI4k33k8Osy7la8/4bBcuUXpUgALqeaQOOt76HlQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(36840700001)(46966006)(40470700004)(186003)(82310400005)(26005)(107886003)(53546011)(6506007)(41300700001)(4326008)(336012)(2616005)(70586007)(316002)(6512007)(70206006)(47076005)(54906003)(478600001)(40460700003)(8676002)(6486002)(36756003)(82740400003)(356005)(33656002)(81166007)(86362001)(6862004)(2906002)(36860700001)(83380400001)(8936002)(5660300002)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 13:48:48.8808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d29897bf-f5a4-4ab3-b278-08db35135169
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9824

DQoNCkhpIEFudGhvbnksDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcNCg0KPiBPbiAzMSBNYXIg
MjAyMywgYXQgMTU6MjMsIEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29t
PiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgTWFyIDI3LCAyMDIzIGF0IDExOjU5OjQyQU0gKzAxMDAs
IEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEvZG9jcy9tYW4veGwuY2ZnLjUu
cG9kLmluIGIvZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluDQo+PiBpbmRleCAxMGYzNzk5MGJlNTcu
LmFkZjQ4ZmU4YWMxZCAxMDA2NDQNCj4+IC0tLSBhL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5pbg0K
Pj4gKysrIGIvZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluDQo+PiBAQCAtMjk1Miw2ICsyOTUyLDE3
IEBAIEN1cnJlbnRseSwgb25seSB0aGUgInNic2FfdWFydCIgbW9kZWwgaXMgc3VwcG9ydGVkIGZv
ciBBUk0uDQo+PiANCj4+ID1iYWNrDQo+PiANCj4+ICs9aXRlbSBCPHN2ZT0iTlVNQkVSIj4NCj4+
ICsNCj4+ICtUbyBlbmFibGUgU1ZFLCB1c2VyIG11c3Qgc3BlY2lmeSBhIG51bWJlciBkaWZmZXJl
bnQgZnJvbSB6ZXJvLCBtYXhpbXVtIDIwNDggYW5kDQo+PiArbXVsdGlwbGUgb2YgMTI4LiBUaGF0
IHZhbHVlIHdpbGwgYmUgdGhlIG1heGltdW0gbnVtYmVyIG9mIFNWRSByZWdpc3RlcnMgYml0cw0K
Pj4gK3RoYXQgdGhlIGh5cGVydmlzb3Igd2lsbCBpbXBvc2UgdG8gdGhpcyBndWVzdC4gSWYgdGhl
IHBsYXRmb3JtIGhhcyBhIGxvd2VyDQo+IA0KPiBNYXliZSBzdGFydCBieSBkZXNjcmliaW5nIHdo
YXQgdGhlICJzdmUiIHZhbHVlIGlzIGJlZm9yZSBpbXBvc2luZw0KPiBsaW1pdHMuIE1heWJlIHNv
bWV0aGluZyBsaWtlOg0KPiANCj4gICAgU2V0IHRoZSBtYXhpbXVtIHZlY3RvciBsZW5ndGggdGhh
dCBhIGd1ZXN0J3MgU2NhbGFibGUgVmVjdG9yDQo+ICAgIEV4dGVuc2lvbiAoU1ZFKSBjYW4gdXNl
LiBPciBkaXNhYmxlIGl0IGJ5IHNwZWNpZnlpbmcgMCwgdGhlIGRlZmF1bHQuDQo+IA0KPiAgICBW
YWx1ZSBuZWVkcyB0byBiZSBhIG11bHRpcGxlIG9mIDEyOCwgd2l0aCBhIG1heGltdW0gb2YgMjA0
OCBvciB0aGUNCj4gICAgbWF4aW11bSBzdXBwb3J0ZWQgYnkgdGhlIHBsYXRmb3JtLg0KPiANCj4g
V291bGQgdGhpcywgb3Igc29tZXRoaW5nIGxpa2UgdGhhdCBiZSBhIGdvb2QgZXhwbGFuYXRpb24g
b2YgdGhlICJzdmUiDQo+IGNvbmZpZ3VyYXRpb24gb3B0aW9uPw0KDQpZZXMgSSBjYW4gY2hhbmdl
IGl0LCBhIG5lZWQgdG8gZG8gaXQgYW55d2F5IGJlY2F1c2UgSSB0aGluayBhbHNvIGhlcmUsIHRo
ZSBzdWdnZXN0aW9uDQpGcm9tIEphbiBjYW4gYXBwbHkgYW5kIHdlIGNvdWxkIHBhc3MgYSBuZWdh
dGl2ZSB2YWx1ZSB0aGF0IG1lYW5zIOKAnG1heCBWTCBzdXBwb3J0ZWQNCmJ5IHRoZSBwbGF0Zm9y
bSINCg0KPiANCj4+ICtzdXBwb3J0ZWQgYml0cyB2YWx1ZSwgdGhlbiB0aGUgZG9tYWluIGNyZWF0
aW9uIHdpbGwgZmFpbC4NCj4+ICtBIHZhbHVlIGVxdWFsIHRvIHplcm8gaXMgdGhlIGRlZmF1bHQg
YW5kIGl0IG1lYW5zIHRoaXMgZ3Vlc3QgaXMgbm90IGFsbG93ZWQgdG8NCj4+ICt1c2UgU1ZFLg0K
Pj4gKw0KPj4gKz1iYWNrDQo+PiArDQo+PiA9aGVhZDMgeDg2DQo+PiANCj4+ID1vdmVyIDQNCj4+
IGRpZmYgLS1naXQgYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX2FybS5jIGIvdG9vbHMvbGlicy9s
aWdodC9saWJ4bF9hcm0uYw0KPj4gaW5kZXggZGRjN2IyYTE1OTc1Li4xNmE0OTAzMWZkNTEgMTAw
NjQ0DQo+PiAtLS0gYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX2FybS5jDQo+PiArKysgYi90b29s
cy9saWJzL2xpZ2h0L2xpYnhsX2FybS5jDQo+PiBAQCAtMjExLDYgKzIxMSw4IEBAIGludCBsaWJ4
bF9fYXJjaF9kb21haW5fcHJlcGFyZV9jb25maWcobGlieGxfX2djICpnYywNCj4+ICAgICAgICAg
cmV0dXJuIEVSUk9SX0ZBSUw7DQo+PiAgICAgfQ0KPj4gDQo+PiArICAgIGNvbmZpZy0+YXJjaC5z
dmVfdmwgPSBkX2NvbmZpZy0+Yl9pbmZvLmFyY2hfYXJtLnN2ZTsNCj4gDQo+IFRoaXMgdHJ1bmNh
dGUgYSAxNmJpdCB2YWx1ZSBpbnRvIGFuIDhiaXQgdmFsdWUsIEkgdGhpbmsgeW91IHNob3VsZCBj
aGVjaw0KPiB0aGF0IHRoZSB2YWx1ZSBjYW4gYWN0dWFsbHkgZml0Lg0KPiANCj4gQW5kIG1heWJl
IGNoZWNrIGBkX2NvbmZpZy0+Yl9pbmZvLmFyY2hfYXJtLnN2ZWAgdmFsdWUgaGVyZSBpbnN0ZWFk
IG9mDQo+IGB4bGAgYXMgY29tbWVudGVkIGxhdGVyLg0KDQpZZXMgSSBjYW4gZG8gaXQsIG9uZSBx
dWVzdGlvbiwgY2FuIEkgdXNlIGhlcmUgeGNfcGh5c2luZm8gdG8gcmV0cmlldmUgdGhlIG1heGlt
dW0NClZlY3RvciBsZW5ndGggZnJvbSBhcmNoX2NhcGFiaWxpdGllcz8NCkkgbWVhbiwgaXMgdGhl
cmUgYSBiZXR0ZXIgd2F5IG9yIEkgY2FuIGdvIGZvciB0aGF0Pw0KDQo+IA0KPj4gKw0KPj4gICAg
IHJldHVybiAwOw0KPj4gfQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9saWdodC9s
aWJ4bF90eXBlcy5pZGwgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX3R5cGVzLmlkbA0KPj4gaW5k
ZXggZmQzMWRhY2Y3ZDVhLi5lZjRhODM1OGU1NGUgMTAwNjQ0DQo+PiAtLS0gYS90b29scy9saWJz
L2xpZ2h0L2xpYnhsX3R5cGVzLmlkbA0KPj4gKysrIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF90
eXBlcy5pZGwNCj4+IEBAIC02OTAsNiArNjkwLDcgQEAgbGlieGxfZG9tYWluX2J1aWxkX2luZm8g
PSBTdHJ1Y3QoImRvbWFpbl9idWlsZF9pbmZvIixbDQo+PiANCj4+ICAgICAoImFyY2hfYXJtIiwg
U3RydWN0KE5vbmUsIFsoImdpY192ZXJzaW9uIiwgbGlieGxfZ2ljX3ZlcnNpb24pLA0KPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICgidnVhcnQiLCBsaWJ4bF92dWFydF90eXBlKSwN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKCJzdmUiLCB1aW50MTYpLA0KPiAN
Cj4gSSB3b25kZXIgaWYgcmVuYW1pbmcgInN2ZSIgdG8gInN2ZV92bCIgaGVyZSB3b3VsZCBtYWtl
IHNlbnNlLCBzZWVpbmcNCj4gdGhhdCAic3ZlX3ZsIiBpcyBhY3R1YWxseSB1c2VkIGluIG90aGVy
IHBsYWNlcy4NCg0KWWVzIEkgY2FuIHJlbmFtZSBpdCBhcyBzdmVfdmwsIEkgd2lsbCBhbHNvIGNo
YW5nZSB0aGUgdHlwZSB0byDigJxpbnRlZ2VyIg0KDQo+IA0KPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXSkpLA0KPj4gICAgICgiYXJjaF94ODYiLCBTdHJ1Y3QoTm9uZSwgWygibXNy
X3JlbGF4ZWQiLCBsaWJ4bF9kZWZib29sKSwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF0pKSwNCj4+IGRpZmYgLS1naXQgYS90b29scy94bC94bF9wYXJzZS5jIGIvdG9vbHMveGwv
eGxfcGFyc2UuYw0KPj4gaW5kZXggMWY2ZjQ3ZGFmNGUxLi4zY2JjMjNiMzY5NTIgMTAwNjQ0DQo+
PiAtLS0gYS90b29scy94bC94bF9wYXJzZS5jDQo+PiArKysgYi90b29scy94bC94bF9wYXJzZS5j
DQo+PiBAQCAtMTIsNiArMTIsNyBAQA0KPj4gICogR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIGZvciBtb3JlIGRldGFpbHMuDQo+PiAgKi8NCj4+IA0KPj4gKyNpbmNsdWRlIDxhcm0t
YXJjaC1jYXBhYmlsaXRpZXMuaD4NCj4gDQo+IENvdWxkIHlvdSBhZGQgdGhpcyBoZWFkZXJzIGFm
dGVyIHB1YmxpYyBvbmVzPw0KDQpZZXMNCg0KPiANCj4+ICNpbmNsdWRlIDxjdHlwZS5oPg0KPj4g
I2luY2x1ZGUgPGludHR5cGVzLmg+DQo+PiAjaW5jbHVkZSA8bGltaXRzLmg+DQo+PiBAQCAtMTMx
Miw4ICsxMzEzLDYgQEAgdm9pZCBwYXJzZV9jb25maWdfZGF0YShjb25zdCBjaGFyICpjb25maWdf
c291cmNlLA0KPj4gICAgICAgICBleGl0KEVYSVRfRkFJTFVSRSk7DQo+PiAgICAgfQ0KPj4gDQo+
PiAtICAgIGxpYnhsX3BoeXNpbmZvX2Rpc3Bvc2UoJnBoeXNpbmZvKTsNCj4+IC0NCj4+ICAgICBj
b25maWc9IHhsdV9jZmdfaW5pdChzdGRlcnIsIGNvbmZpZ19zb3VyY2UpOw0KPj4gICAgIGlmICgh
Y29uZmlnKSB7DQo+PiAgICAgICAgIGZwcmludGYoc3RkZXJyLCAiRmFpbGVkIHRvIGFsbG9jYXRl
IGZvciBjb25maWd1cmF0aW9uXG4iKTsNCj4+IEBAIC0yODg3LDYgKzI4ODYsMjkgQEAgc2tpcF91
c2JkZXY6DQo+PiAgICAgICAgIH0NCj4+ICAgICB9DQo+PiANCj4+ICsgICAgaWYgKCF4bHVfY2Zn
X2dldF9sb25nIChjb25maWcsICJzdmUiLCAmbCwgMCkpIHsNCj4+ICsgICAgICAgIHVuc2lnbmVk
IGludCBhcm1fc3ZlX3ZsID0NCj4+ICsgICAgICAgICAgICBhcmNoX2NhcGFiaWxpdGllc19hcm1f
c3ZlKHBoeXNpbmZvLmFyY2hfY2FwYWJpbGl0aWVzKTsNCj4+ICsgICAgICAgIGlmICghYXJtX3N2
ZV92bCkgew0KPj4gKyAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAiU1ZFIGlzIG5vdCBzdXBw
b3J0ZWQgYnkgdGhlIHBsYXRmb3JtXG4iKTsNCj4+ICsgICAgICAgICAgICBleGl0KC1FUlJPUl9G
QUlMKTsNCj4gDQo+ICJFUlJPUl9GQUlMIiBpcyBhICJsaWJ4bF9lcnJvciIsIGluc3RlYWQgZXhp
dCB3aXRoICJFWElUX0ZBSUxVUkUiLg0KDQpPayBJIHdpbGwgdXNlIHRoZSByaWdodCB0eXBlDQoN
Cj4gDQo+PiArICAgICAgICB9IGVsc2UgaWYgKCgobCAlIDEyOCkgIT0gMCkgfHwgKGwgPiAyMDQ4
KSkgew0KPj4gKyAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLA0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgIkludmFsaWQgc3ZlIHZhbHVlOiAlbGQuIE5lZWRzIHRvIGJlIDw9IDIwNDggYW5kIG11
bHRpcGxlIg0KPj4gKyAgICAgICAgICAgICAgICAgICAgIiBvZiAxMjhcbiIsIGwpOw0KPj4gKyAg
ICAgICAgICAgIGV4aXQoLUVSUk9SX0ZBSUwpOw0KPj4gKyAgICAgICAgfSBlbHNlIGlmIChsID4g
YXJtX3N2ZV92bCkgew0KPj4gKyAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLA0KPj4gKyAgICAg
ICAgICAgICAgICAgICAgIkludmFsaWQgc3ZlIHZhbHVlOiAlbGQuIFBsYXRmb3JtIHN1cHBvcnRz
IHVwIHRvICV1IGJpdHNcbiIsDQo+PiArICAgICAgICAgICAgICAgICAgICBsLCBhcm1fc3ZlX3Zs
KTsNCj4+ICsgICAgICAgICAgICBleGl0KC1FUlJPUl9GQUlMKTsNCj4+ICsgICAgICAgIH0NCj4+
ICsgICAgICAgIC8qIFZlY3RvciBsZW5ndGggaXMgZGl2aWRlZCBieSAxMjggaW4gZG9tYWluIGNv
bmZpZ3VyYXRpb24gc3RydWN0ICovDQo+IA0KPiBUaGF0J3Mgd3JvbmcsIGJlc2lkZSB0aGlzIGNv
bW1lbnQgdGhlcmUncyBub3RoaW5nIHRoYXQgc2F5IHRoYXQNCj4gYGJfaW5mby0+YXJjaF9hcm0u
c3ZlYCBuZWVkcyB0byBoYXZlIGEgdmFsdWUgZGl2aWRlZCBieSAxMjguDQo+IGBiX2luZm8tPmFy
Y2hfYXJtLnN2ZWAgaXMganVzdCBvZiB0eXBlIHVpbnQxNl90IChsaWJ4bF90eXBlLmlkbCkuDQo+
IA0KPiBCVFcsICJ0b29scy94bCIgKHhsKSB1c2UganVzdCBvbmUgdXNlciBvZiAidG9vbHMvbGli
cy9saWdodCIgKGxpYnhsKSwgc28NCj4gaXQncyBwb3NzaWJsZSB0aGF0IG90aGVyIHVzZXJzIHdv
dWxkIHNldCBgc3ZlYCB0byBhIHZhbHVlIHRoYXQgaGF2ZW4ndA0KPiBiZWVuIGNoZWNrZWQuIFNv
IEkgdGhpbmsgYWxsIHRoZSBjaGVjayB0aGF0IHRoZSBgc3ZlYCB2YWx1ZSBpcyBjb3JyZWN0DQo+
IGNvdWxkIGJlIGRvbmUgaW4gbGlieGwgaW5zdGVhZC4NCg0KU3VyZSBJIHdpbGwgZG8gdGhhdA0K
DQo+IA0KPiANCj4+ICsgICAgICAgIGJfaW5mby0+YXJjaF9hcm0uc3ZlID0gbCAvIDEyOFU7DQo+
PiArICAgIH0NCj4+ICsNCj4+ICsgICAgbGlieGxfcGh5c2luZm9fZGlzcG9zZSgmcGh5c2luZm8p
Ow0KPj4gKw0KPj4gICAgIHBhcnNlX3ZrYl9saXN0KGNvbmZpZywgZF9jb25maWcpOw0KPj4gDQo+
PiAgICAgZF9jb25maWctPnZpcnRpb3MgPSBOVUxMOw0KPiANCj4gVGhhbmtzLA0KPiANCj4gLS0g
DQo+IEFudGhvbnkgUEVSQVJEDQoNCg==

