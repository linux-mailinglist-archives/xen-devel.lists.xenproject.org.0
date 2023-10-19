Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D4E7CF963
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 14:52:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619311.964173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtSV1-0006Jm-71; Thu, 19 Oct 2023 12:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619311.964173; Thu, 19 Oct 2023 12:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtSV1-0006Gd-4C; Thu, 19 Oct 2023 12:51:39 +0000
Received: by outflank-mailman (input) for mailman id 619311;
 Thu, 19 Oct 2023 12:51:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8dTy=GB=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qtSUz-0006GX-Vl
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 12:51:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7d00::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c8c83d3-6e7e-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 14:51:35 +0200 (CEST)
Received: from DUZPR01CA0228.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::23) by PAXPR08MB7442.eurprd08.prod.outlook.com
 (2603:10a6:102:2b8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 19 Oct
 2023 12:51:33 +0000
Received: from DB1PEPF0003922F.eurprd03.prod.outlook.com
 (2603:10a6:10:4b4:cafe::6d) by DUZPR01CA0228.outlook.office365.com
 (2603:10a6:10:4b4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.25 via Frontend
 Transport; Thu, 19 Oct 2023 12:51:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF0003922F.mail.protection.outlook.com (10.167.8.102) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Thu, 19 Oct 2023 12:51:32 +0000
Received: ("Tessian outbound 028b72acc2da:v215");
 Thu, 19 Oct 2023 12:51:32 +0000
Received: from d0606dacfd85.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 72E21672-BEBF-4DF2-947E-59BA9D24C121.1; 
 Thu, 19 Oct 2023 12:50:57 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d0606dacfd85.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Oct 2023 12:50:57 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU5PR08MB10823.eurprd08.prod.outlook.com (2603:10a6:10:528::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Thu, 19 Oct
 2023 12:50:55 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338%7]) with mapi id 15.20.6886.034; Thu, 19 Oct 2023
 12:50:55 +0000
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
X-Inumbo-ID: 3c8c83d3-6e7e-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZE/IJLidMeOmhxNxkKOUN2tRTqP/zSdl32jB1XGwoFI=;
 b=qNSxiLxSXOqHohni5F3eh8oyQqeHomQmdg7fhTUBb36Kxuw2dKi2C92GwFgmRnBBV8C3qH05dK0R5in0Bx87f1eH3//K2cgCeP6JELRcJIklD9KiiE8KMvyiztnx4YXtIvPTnmorJWEM2N4roOdyspYqodWNDIikxX9yctUFtNM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 70ece8a6e7edcf12
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxW0Yhi2R+utCwZfBieRTtwmDrBQHv0rpXppvR5GRK+sZU4idn4TcBvhCjTmJrlUgcfvFrT8fqV9WWMBNepXTfh1UwkVy5SLVYrXyiCr74W22VCEMlvcT/pM+CyDNDqsg7Woj3oi6R8Ztm2qYnJ5I5ZFxgEHDpoZG/mTgYIHdgyROhrhvCp/KWt8nTntkM30e7a27ykZvm3a9y1bQD/ixQChfjq9284DYACeHR8wcWiiNzyVs+Hlx1XMe9qcYwKNcG4u/QTa4FbYBuLYWJUpg36/vl5M6SlKfuv9uiPgjGLlLctq+0jGjKUJRRFI97/+jxGcZPFCHd+AWQuP+yJgYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZE/IJLidMeOmhxNxkKOUN2tRTqP/zSdl32jB1XGwoFI=;
 b=Bhn4TylplhTSe7f3no5nARHkxqnADq/2VdHEJbLY4T3PbbTr9AgirmEtLDg/0UzhsW3LzADc4/VP0ydBCwNVNoCC8LwpCpr+6ZvbDVN2TsFpkVbmAW0+uyFohYio3lfM+eGd2+wr5fdeJRcj4F39ZUcU45dWViEOEiEdUDk5oARELLgoYJuVMLsyUb5O1R0i/EFmX134k00+2+jMRTUSeEhIcwgPk3ko6rIvqa8gUxIFkPlaoxCUPaYZWvZoWurOzPNT5nHm83AakXW6XMyQsp9CazIvVuc7vy5I8UdyXeAHOGscj2jindgyzVWyU09LvmafL9tKTyVrS6V6jEU49g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZE/IJLidMeOmhxNxkKOUN2tRTqP/zSdl32jB1XGwoFI=;
 b=qNSxiLxSXOqHohni5F3eh8oyQqeHomQmdg7fhTUBb36Kxuw2dKi2C92GwFgmRnBBV8C3qH05dK0R5in0Bx87f1eH3//K2cgCeP6JELRcJIklD9KiiE8KMvyiztnx4YXtIvPTnmorJWEM2N4roOdyspYqodWNDIikxX9yctUFtNM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Peter Hoyes
	<Peter.Hoyes@arm.com>
Subject: Re: [PATCH] tools/xendomains: Only save/restore/migrate if supported
 by xenlight
Thread-Topic: [PATCH] tools/xendomains: Only save/restore/migrate if supported
 by xenlight
Thread-Index: AQHaAorkpr2Fw+/rt0uploS+PCDdYw==
Date: Thu, 19 Oct 2023 12:50:52 +0000
Message-ID: <6F0D3115-C030-423E-ADBB-ADBB104E7BA3@arm.com>
References: <20230322135800.3869458-1-peter.hoyes@arm.com>
In-Reply-To: <20230322135800.3869458-1-peter.hoyes@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU5PR08MB10823:EE_|DB1PEPF0003922F:EE_|PAXPR08MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d1b493f-0375-4452-c394-08dbd0a21efa
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QbDdY403cFPd59OOioxbF1CpwWyqLnsX03z8BzSw64WZWAqbnGjhcFrxKsD3stNGC1vYzrq4alH2Jp5WBTvenbfgn06eCASRkWI0mW/e/exS2F88X5Em8OKKaw54KNo2Oa70EliRa0pXjtfuIZrMteibhATkR8xFjXr/RNtNv+2mADEEMcqrvp7zvZP+N3r/a63uJ07LevNbq4IVmVUEdENjm+A8S3q8vpad94Ab63wVoIdKVe97NlIX6v8Jj9WAIVCFAe5UCpQDN3pkB8Um15mj0XdSFFu3rfka6OfPN9m1+eGA/1XTLK4EKKeZmqPMaYC6eaNkGHwBw0zEOhLtic6y1xAxFRUIW3AqMq4rsedICK3QN3QFnEZmjhzvN3d3eM05E73LvfmLqRpYmSdfgLg2cC2ukv4BD5LTHW2N2ng+lj1OGypiHqltgi4paCjQlf/ndMv4oetWY/PxAmQQPPT6D1wEGQ+iLe0M8qsuOjPXFXp+CvpEo+Fp/J5KP0+x32h6cDWCV+Mz/V33NsHjINaYvxBiTYOYcg5jHlvdUw8DEUUko+6kumIPZk24BeDEMDPaD5+JSoglNl1QGWBCR8Mn5oW+IEHKox9JQnOnWFrp/xSXYP08PsaIUFF76huhzFATYQuNPCd30bE+lBBB5Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(136003)(366004)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(41300700001)(66476007)(6666004)(66556008)(478600001)(6486002)(66946007)(6916009)(54906003)(966005)(64756008)(76116006)(91956017)(38070700005)(6506007)(26005)(316002)(2616005)(33656002)(4744005)(8676002)(4326008)(8936002)(36756003)(5660300002)(2906002)(122000001)(6512007)(71200400001)(66446008)(83380400001)(86362001)(53546011)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AEC064744B972D4DAB3A1E5DAEF61035@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10823
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	68b860e6-15bf-48fa-ae43-08dbd0a20705
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	428QAM0ajCxi/R+xYyuXU3Ou6v9ssGAPpp0NHeMc5M+b259DJgcMqC4bWLKOsnHVcko68OhTV7HNgdMZo4g3+or2ToE0wGUTn1yZx5ktGZPwmnSCH/FQRIUHusO9/AZg/604Rm1YrEnNfO21F9hERCmKPjBC0XkSYCTFnNtSfRgrkCO3rhF3Rmb1JvP3qbjoD3aKMmTMmOz5eC2fR8xu3SgV5Aub7I6PE6/RvQukHBhZ3CZohxuNLMG8HaegJVlQnTjEy+F6wISicEacyJ6YPCSchmT/2tVg+ycbXHX1mUIhNDBxd9J9+vH+qLi9qblxHrTP5P0JWFwuTligRubbhnNAwOCQSGGbqsX/iEt6whgo5GUCnLqydx8C+2swY5clPxpWLEINeAyEkxsCGSzUwvyzMdu/bdUN95PvIgLmW+erf8wQGYfDkQsYft/VvuIKbRK2QyBO52yZkKcIeptU4gZS5267OfjGZ7iRA4K+sdLCqcFFYlFsmJrNSLZ1F+hZ9+iy4lL2y5XbogEwvr1KkDKIZ314VCHTRgM9BP4u77x/Hhxg0CHS6iqVXnOnfQu+yqW1+p1JpCOBDyAo25yqKE9fKcBdp7DL+k0qfIPGU+f9SMPj+eh4OfPC//dndlBZKS1wnW1wQbFzrwwP7BWy/bbNFjOstTY2xo99WuATLgfJg3vDkOVquw6n7YjM+j14JIPGCr8JinZXYkZ2/mAqge1qUMmT4fOOQUAyQP0CCok=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(39860400002)(136003)(230922051799003)(451199024)(82310400011)(1800799009)(186009)(64100799003)(36840700001)(46966006)(40470700004)(40480700001)(4744005)(2906002)(86362001)(4326008)(41300700001)(8676002)(70206006)(8936002)(6862004)(70586007)(40460700003)(5660300002)(36756003)(54906003)(316002)(33656002)(2616005)(356005)(26005)(81166007)(36860700001)(82740400003)(336012)(6512007)(83380400001)(6666004)(6506007)(53546011)(47076005)(966005)(6486002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 12:51:32.5774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d1b493f-0375-4452-c394-08dbd0a21efa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7442

DQoNCj4gT24gMjIgTWFyIDIwMjMsIGF0IDEzOjU4LCBQZXRlciBIb3llcyA8UGV0ZXIuSG95ZXNA
YXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBGcm9tOiBQZXRlciBIb3llcyA8UGV0ZXIuSG95ZXNAYXJt
LmNvbT4NCj4gDQo+IFNhdmluZywgcmVzdG9yaW5nIGFuZCBtaWdyYXRpbmcgZG9tYWlucyBhcmUg
bm90IGN1cnJlbnRseSBzdXBwb3J0ZWQgb24NCj4gYXJtIGFuZCBhcm02NCBwbGF0Zm9ybXMsIHNv
IHhlbmRvbWFpbnMgcHJpbnRzIHRoZSB3YXJuaW5nOg0KPiANCj4gIEFuIGVycm9yIG9jY3VycmVk
IHdoaWxlIHNhdmluZyBkb21haW46DQo+ICBjb21tYW5kIG5vdCBpbXBsZW1lbnRlZA0KPiANCj4g
d2hlbiBhdHRlbXB0aW5nIHRvIHJ1biBgeGVuZG9tYWlucyBzdG9wYC4gSXQgb3RoZXJ3aXNlIGNv
bnRpbnVlcyB0byBzaHV0DQo+IGRvd24gdGhlIGRvbWFpbnMgY2xlYW5seSwgd2l0aCB0aGUgdW5z
dXBwb3J0ZWQgc3RlcHMgc2tpcHBlZC4NCj4gDQo+IFVzZSBgeGwgaGVscGAgdG8gZGV0ZWN0IHdo
ZXRoZXIgc2F2ZS9yZXN0b3JlL21pZ3JhdGUgaXMgc3VwcG9ydGVkIGJ5IHRoZQ0KPiBwbGF0Zm9y
bS4gSWYgbm90LCBkbyBub3QgYXR0ZW1wdCB0byBydW4gdGhlIGNvcnJlc3BvbmRpbmcgY29tbWFu
ZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEhveWVzIDxQZXRlci5Ib3llc0Bhcm0uY29t
Pg0KPiAtLS0NCg0KSGkgQW50aG9ueSwNCg0KUmVnYXJkaW5nIHRoaXMgcGF0Y2gsIGlzIHRoZXJl
IGFueSB1cGRhdGU/DQoNCknigJltIGFza2luZyBqdXN0IGJlY2F1c2UgaGVyZSBodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVsL3BhdGNoLzIwMjMwMzIyMTM1ODAw
LjM4Njk0NTgtMS1wZXRlci5ob3llc0Bhcm0uY29tLyBpdCBzZWVtcyB5b3Ugd2VyZSB2b2x1bnRl
ZXJpbmcgdG8gZml4IHRoYXQgaW4gYW5vdGhlciB3YXkuDQoNCkNoZWVycywNCkx1Y2ENCg0KDQo=

