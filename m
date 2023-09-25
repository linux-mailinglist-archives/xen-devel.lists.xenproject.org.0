Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF387AE19F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 00:20:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608130.946435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qktw4-0000pP-4C; Mon, 25 Sep 2023 22:20:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608130.946435; Mon, 25 Sep 2023 22:20:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qktw4-0000mA-0Y; Mon, 25 Sep 2023 22:20:12 +0000
Received: by outflank-mailman (input) for mailman id 608130;
 Mon, 25 Sep 2023 22:20:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LToL=FJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qktw1-0000m4-Tv
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 22:20:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae8b871a-5bf1-11ee-9b0d-b553b5be7939;
 Tue, 26 Sep 2023 00:20:07 +0200 (CEST)
Received: from AS9PR06CA0378.eurprd06.prod.outlook.com (2603:10a6:20b:460::18)
 by DU0PR08MB8399.eurprd08.prod.outlook.com (2603:10a6:10:405::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 22:20:03 +0000
Received: from AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:460:cafe::8c) by AS9PR06CA0378.outlook.office365.com
 (2603:10a6:20b:460::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Mon, 25 Sep 2023 22:20:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT025.mail.protection.outlook.com (100.127.140.199) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.20 via Frontend Transport; Mon, 25 Sep 2023 22:20:02 +0000
Received: ("Tessian outbound 5c548696a0e7:v175");
 Mon, 25 Sep 2023 22:20:02 +0000
Received: from d428db695094.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F79AE8DF-75AA-4932-92E0-0AC9A2363052.1; 
 Mon, 25 Sep 2023 22:19:51 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d428db695094.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 25 Sep 2023 22:19:51 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB10124.eurprd08.prod.outlook.com (2603:10a6:800:1c6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 22:19:47 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 22:19:47 +0000
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
X-Inumbo-ID: ae8b871a-5bf1-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+A79WTnZ4wCEKv7zqjA6PY0bO8lRTiLZNyKKkz0WLo=;
 b=np2ngu3o1C636OSTBcs2EuPlkYyEPnEcAYjJZfqVReGidt+K/s0ACLEWwTpuMaDi293gpa/PfdqAnLFBTQf6lgL/jrLf/JeKV7EtZrECaR31sGFR2g47PFzbI2S2edy6lJyJn/Adv/JlyEWrME5Qp3hXEhkwtE2+anJwTSdpvlc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ebcb13f3513d96f5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGcgoNQyEdEVriuFoy5Eg2kz+3GpXR+GUW4kIibvgX0RIW2R71dq8x/cbw70Ihr5kQ9iNO3j4nsKfF7uvCytu/a8+nTL7AJnLId7FU8mDePDXmsZG98VTSuXc9sNglQCqcmD+WRrH5YsOL3WpKms7bORf0fS8TU8fXICsGM2/eticw5vOmkB2OP7FBSh2LEaYUqsYmWP+x5vRbsfQvHwJ4xaZWW9OKcjteALIGSYmhjL2cAR9N061wlFy2izAth3RngJKPxb1n3S9cUPbnhAB8FHdg7EQMsSk8x+/M0FP3IP6VDmJTBhfgFj16N9/1yQgNvVAgzImy2E2zr/gSnywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+A79WTnZ4wCEKv7zqjA6PY0bO8lRTiLZNyKKkz0WLo=;
 b=Zvf6tT0JsOumAWvXHFxxK88L26zoNC7W8cnOnqnrniRXhEXMo4gKZvGqNtrZ6S6quFqiwjgBkc73OgwLAqVwoSPP/0LDq9X9hq3Q7Xpvox9las04wt/rRkZGCX5o4cHPzIyWJ3MzYLn2rNuoX/bGorRq+FcyLKs1/IjuSlHQ3pu1i7wKQ/tQMHaEJkQwoy5JTLEzOH+WRqg2wtfLClDYkyzyvuRnM4XM2u9u4sZdOEqMgvdXql4QcFOk8UvKZvhgejfaL5avx040CEgsugq9j33c3jP20aGsDkGaALmWBc5nuTNd0sbNxMexXSDhAizyk+NjVVL5AN+rMeF/UYQqYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+A79WTnZ4wCEKv7zqjA6PY0bO8lRTiLZNyKKkz0WLo=;
 b=np2ngu3o1C636OSTBcs2EuPlkYyEPnEcAYjJZfqVReGidt+K/s0ACLEWwTpuMaDi293gpa/PfdqAnLFBTQf6lgL/jrLf/JeKV7EtZrECaR31sGFR2g47PFzbI2S2edy6lJyJn/Adv/JlyEWrME5Qp3hXEhkwtE2+anJwTSdpvlc=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [for-4.18] [PATCH v2] ARM: GICv3 ITS: flush caches for newly
 allocated ITT
Thread-Topic: [for-4.18] [PATCH v2] ARM: GICv3 ITS: flush caches for newly
 allocated ITT
Thread-Index: AQHZ7/5kPD04AjZsh0qcsfrVnvYmOQ==
Date: Mon, 25 Sep 2023 22:19:47 +0000
Message-ID: <9F5A8F55-DF3C-4D8D-AEB2-E009E6EB0C28@arm.com>
References: <20230922222710.1383808-1-volodymyr_babchuk@epam.com>
 <d4ab6108-b190-437e-bd15-af9afb086794@xen.org>
In-Reply-To: <d4ab6108-b190-437e-bd15-af9afb086794@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VI1PR08MB10124:EE_|AM7EUR03FT025:EE_|DU0PR08MB8399:EE_
X-MS-Office365-Filtering-Correlation-Id: 249f8313-5735-46fa-476c-08dbbe159065
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lliguGn9aFzZjlfrE+TRFIyZhNGh5yAcNkC7CorTy2u8Xr+ky3tjltpQhQdzAomYSVIkdiVGdh6ngAKF27L66C8TqDlddpVBl337Ai93l8pNhKzSGhhr1EYSa+kHUch8U8TlypaZhT9Jwfzkonr2YqIMMaP+sJceMxU2HL6GGyfrNgAXnHEpMNPBQnTVp3cwxyqK9X+B8b6tOMmXk7uvZybhvQpB9SqEVan+9rWJHdiJ4dZxxrcVrQuYJcsaNK84OJbSLD3Itufp+ZbflAd4hgSDjrJa3WzAvEj3ufyWDjUOFIOlg+U++7UkrcSPC9kzbjofn7yFEs6Q70SsdYCCIQ1I6Hz4wxvv5rlkyjVD/0F/njhMVxUq1YdmBnHXWDLMkickKzRb0wwsbhJG908Q96ldpOha3Vw4pKQ/bI0HuK5+C9s4AyQ99RZ1xxE+4joDTHchcKHyN4XdjiyBtdaJk6THNkiMddu0ntqQMEWl4vDvfCnFw1AtDgGW6rqvv8LhpvZigkYZnPVYYJc4dvWKk9QA7A2w061YMBv8ppIXHxrAB/+2zpwf766VtUHgbLosMJrFv6udnLZdK3DrUxwOjuTYksmOI91j0Jq5c4jMajtwIoeOrcqCRwLP3Xp9yLfnUNN4IH9BGiklxbz1EprcKw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(39860400002)(376002)(346002)(230922051799003)(1800799009)(451199024)(186009)(6506007)(6486002)(2906002)(83380400001)(122000001)(38070700005)(38100700002)(76116006)(54906003)(91956017)(64756008)(66446008)(6512007)(66946007)(66556008)(66476007)(71200400001)(5660300002)(26005)(53546011)(41300700001)(316002)(6916009)(8936002)(8676002)(4326008)(478600001)(2616005)(86362001)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A80B68C809DC34BA6FDE5460FC14FCB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10124
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	32ffc174-da01-43c6-82ed-08dbbe158709
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Xd9AcX4OKV+bdJDvVoa/JJexaDk+nGfKx1XNaOXAxHGBJH2yeF+7nU7pS/EQ8PzbJXv7dYLE+SZ+LWR0d4SObkMVSonh1RbC2RY8svddTxxm1ASfoK7tPmwIW2j/7NVwuV8oEqN9eiVJZx/M6iXDkOSICdeHBK9RY+jsUu4yhFzX6sHzNU6NeMnX2zBjES8WEVe+lhBAVy461AubyldG7lPDucgqyBoOJZPxuZ+hnewbDoqR62Bh6jZcHOB2A1KXWVPVyb3RoC2NUqYVM5SI38/0SsQj8a0wQxWgG90ddwtslPdkIBowyHcmPjdBQZ0dR/ugN1jhUjseDinwkFqHPr4lOyeN0a6k88RZFcUqvTbIj56PAAAuq5uGS+h6Niner150gLZrkiQvKbSQ48OdPR1vQic0tKOgT4GjJa+yy9EpLEFUYj2VgRifm6RroyaAHmJUDov746Hs1DROl7Qu5K79uKS3IFS1FZYA/lTngazThPb3Sp0w1VSuJgP9Q11zx1ah0UCNxFhNvn+n6XCTZc8CxVoj1sixNyV/UIYRMWpylnsWh18xCmONKkGi6DRQ8aB7PXVSXOdwJy/euv8A8rd8tayrM2sTVM7ndsVhaNrKOknH2Tr7HStCQsTnegHFONJdfWwXIBIkBmD1MGVf+Cmb4SWLjVHWYTsfjMlXA9E/J1pco0kUk/0Av9SkIsEhtmxclqUEcGFKlaBanJ87+p3JQBXiHaUVZNO6ErhIkSJdy6tqZ1BcObiRv6w7s3M
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(1800799009)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(26005)(40460700003)(478600001)(2616005)(336012)(36756003)(82740400003)(86362001)(356005)(47076005)(33656002)(36860700001)(83380400001)(6486002)(53546011)(81166007)(5660300002)(6506007)(6512007)(40480700001)(6862004)(2906002)(8676002)(4326008)(41300700001)(316002)(54906003)(70206006)(70586007)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 22:20:02.8735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 249f8313-5735-46fa-476c-08dbbe159065
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8399

SGkgSnVsaWVuLA0KDQo+IE9uIFNlcCAyNiwgMjAyMywgYXQgMDI6MzMsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiAoQWRkaW5nIFtmb3ItNC4x
OF0gaW4gdGhlIHRpdGxlIGZvciBIZW5yeSB0byBzcG90IHRoZSByZXF1ZXN0KQ0KDQpUaGFua3Mh
DQoNCj4gDQo+IE9uIDIyLzA5LzIwMjMgMjM6MjcsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOg0K
Pj4gSVRTIG1hbmFnZXMgRGV2aWNlIFRhYmxlcyBhbmQgSW50ZXJydXB0IFRyYW5zbGF0aW9uIFRh
YmxlcyBvbiBpdHMgb3duLA0KPj4gc28gZ2VuZXJhbGx5IHdlIGFyZSBub3QgaW50ZXJlc3RlZCBp
biBtYWludGFpbmluZyBhbnkgY29oZXJlbmNlIHdpdGgNCj4+IENQVSdzIHZpZXcgb2YgdGhvc2Ug
bWVtb3J5IHJlZ2lvbnMsIGV4Y2VwdCBvbmUgY2FzZTogSVRTIHJlcXVpcmVzIHRoYXQNCj4+IElu
dGVycnVwdCBUcmFuc2xhdGlvbiBUYWJsZXMgc2hvdWxkIGJlIGluaXRpYWxpemVkIHdpdGgNCj4+
IHplcm9lcy4gRXhpc3RpbmcgY29kZSBhbHJlYWR5IGRvZXMgdGhpcywgYnV0IGl0IGRvZXMgbm90
IGNsZWFucw0KPj4gY2FjaGVzIGFmdGVyd2FyZHMuIFRoaXMgbWVhbnMgdGhhdCBJVFMgbWF5IHNl
ZSB1bi1pbml0aWFsaXplZCBJVFQgYW5kDQo+PiBDUFUgY2FuIG92ZXJ3cml0ZSBwb3J0aW9ucyBv
ZiBJVFQgbGF0ZXIsIHdoZW4gaXQgZmluYWxseSBkZWNpZGVzIHRvDQo+PiBmbHVzaCBjYWNoZXMu
IFZpc2libGUgZWZmZWN0IG9mIHRoaXMgaXNzdWUgdGhhdCB0aGVyZSBhcmUgbm90DQo+PiBpbnRl
cnJ1cHRzIGRlbGl2ZXJlZCBmcm9tIGEgZGV2aWNlLg0KPj4gRml4IHRoaXMgYnkgY2FsbGluZyBj
bGVhbl9hbmRfaW52YWxpZGF0ZV9kY2FjaGVfdmFfcmFuZ2UoKSBmb3IgbmV3bHkNCj4+IGFsbG9j
YXRlZCBJVFQuDQo+IA0KPiBJIHdvdWxkIGNvbnNpZGVyIHRvIGFkZDoNCj4gDQo+IEZpeGVzOiA2
OTA4MmUxYzIxMGQgKCJBUk06IEdJQ3YzIElUUzogaW50cm9kdWNlIGRldmljZSBtYXBwaW5nIikN
Cj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNo
dWtAZXBhbS5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1h
em9uLmNvbT4NCj4gDQo+IEBIZW5yeSwgdGhpcyBwYXRjaCBzaG91bGQgYmUgbG93LXJpc2suIFdl
IGFyZSBjbGVhbmluZyAmIGludmFsaWRhdGluZyB0aGUgY2FjaGUsIHNvIHRoZXJlIHNob3VsZCBi
ZSBubyBjaGFuZ2UgZm9yIHBsYXRmb3JtIG5vdCByZXF1aXJpbmcgY2FjaGUgbWFpbnRlbmFuY2Uu
IFRoaXMgc2hvdWxkIGhvcGVmdWxseSBoYWQgc3VwcG9ydCBmb3IgbW9yZSBwbGF0Zm9ybS4gTm90
ZSB0aGF0IHRoZSBHSUN2MyBJVFMgZmVhdHVyZSBpcyBzdGlsbCBleHBlcmltZW50YWwuDQo+IA0K
PiBCYXNlZCBvbiB3aGF0IEkgd3JvdGUgYWJvdmUsIHdvdWxkIHlvdSBiZSBPSyB0byBoYXZlIHRo
aXMgcGF0Y2ggaW4gNC4xOD8NCg0KWWVzLCBJIHdhcyBhYm91dCB0byBhc2sgdGhlIHNhbWUgcXVl
c3Rpb24gYnV0IHNvbWVob3cgZm9yZ290IGl0LiBUaGlzIGlzIGEgcXVpdGUNCmxvdyByaXNrIHBh
dGNoIGFuZCBJIHRoaW5rIGl0IGlzIGZpbmUgdG8gaGF2ZSB0aGlzIGluIDQuMTgsIHNvIGlmIHRo
ZSAiRml4ZXPigJ0gdGFnDQpjYW4gYmUgYWRkZWQgb24gY29tbWl0LCBwbGVhc2UgYWxzbyBhZGQ6
DQoNClJlbGVhc2UtYWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCg0K
S2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGll
biBHcmFsbA0KDQo=

