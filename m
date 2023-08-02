Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE4E76D62D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 19:55:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575101.900872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRG4J-0006IU-G3; Wed, 02 Aug 2023 17:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575101.900872; Wed, 02 Aug 2023 17:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRG4J-0006Fq-CL; Wed, 02 Aug 2023 17:55:31 +0000
Received: by outflank-mailman (input) for mailman id 575101;
 Wed, 02 Aug 2023 17:55:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGWG=DT=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qRG4G-0006FX-Tt
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 17:55:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2864d76-315d-11ee-b262-6b7b168915f2;
 Wed, 02 Aug 2023 19:55:26 +0200 (CEST)
Received: from AS9PR06CA0034.eurprd06.prod.outlook.com (2603:10a6:20b:463::18)
 by VI1PR08MB5373.eurprd08.prod.outlook.com (2603:10a6:803:131::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 17:54:56 +0000
Received: from AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:463:cafe::d8) by AS9PR06CA0034.outlook.office365.com
 (2603:10a6:20b:463::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19 via Frontend
 Transport; Wed, 2 Aug 2023 17:54:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT055.mail.protection.outlook.com (100.127.141.28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.47 via Frontend Transport; Wed, 2 Aug 2023 17:54:54 +0000
Received: ("Tessian outbound d7adc65d10b4:v145");
 Wed, 02 Aug 2023 17:54:54 +0000
Received: from 8775f5645cc4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6A53934A-EED9-431F-960B-2B5F22A94A2B.1; 
 Wed, 02 Aug 2023 17:54:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8775f5645cc4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Aug 2023 17:54:48 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by VI1PR08MB10074.eurprd08.prod.outlook.com (2603:10a6:800:1be::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 2 Aug
 2023 17:54:45 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 17:54:45 +0000
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
X-Inumbo-ID: c2864d76-315d-11ee-b262-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGdoDvdQ15yG/UVpeZwNNtXlkuSiD2NZBrIKzlTlkgM=;
 b=vk4Vz8/sSewaf+GPLbdUbO3SnXBZOLwr0fbfoa6yxe0MXEsnLF+y0p8Nc9I+JDtmODtRgSBze9Mk0YGbLnwJUj9lrmECUf44eoIKGTCV0MA+0OitI+quv3+aJs6d0rKVlJZ8Cl39lTsLItLgxSXXFXCgT4WY9G5CRmBja9/wJuA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 34aaec0725b9895a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hq7mkhMMHaKEiSouS6on9WQCBUFTzQPQpmhNQeqi4oBE4bAVJhSy8sFDRqsMUHsGTJ+T5/zd2xDPxpC4ppb5sHO7C3y+mJ4NUcd3xQUS+JeDqhXSvlFBQm/qTBTAI4/ns9EWWtA/m7xnNBUFGShmU5jsU8zKxopb7aQCjrsayu+yWdiRquJCqjrMOCW+ru/8zjogpc+0KXA70INwNRJhgljmRNBCH4CrRmCrqyTRhwOmrT9Kmv/iCcEXs7lYSWpto46UFxnJnR+JePnUffYKsGFZQYSoMi8Q+4t0j9pFnt1V20Fo2j131H4Inam7zs6C33LnbAPcBLmy7OCVvTuXYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGdoDvdQ15yG/UVpeZwNNtXlkuSiD2NZBrIKzlTlkgM=;
 b=UU2AWFMODyzunHZ+5UbmT4aHKsPVYHdocSfudjTxv47lJ42vOKoUZtoHR1yYYNYhAI4nuu0EeIsrN3B0LRYyBDCg/4oa59HbHLayin3k+XrVopKUkjd5glcbWMZS7JHA+WV39DEHyWCuYPmm5gnGDEDiZB0aQqZ9cDQrCrQphamAvKaPJr4oudm2uShqeYEngy/q5j3dkP5wy1UERZco2x+ssKVeW1SHfSkHVFXMIgypcwX4CFHnZDuS0Fj/HI4Rk7JlDRhoYHILl31wRuqjJLFol8oGBpjXqtMSED9yqUOKlVMIbVy10XyujmWlpUvtBSpKZiTfKLu11Q9TFKm5ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGdoDvdQ15yG/UVpeZwNNtXlkuSiD2NZBrIKzlTlkgM=;
 b=vk4Vz8/sSewaf+GPLbdUbO3SnXBZOLwr0fbfoa6yxe0MXEsnLF+y0p8Nc9I+JDtmODtRgSBze9Mk0YGbLnwJUj9lrmECUf44eoIKGTCV0MA+0OitI+quv3+aJs6d0rKVlJZ8Cl39lTsLItLgxSXXFXCgT4WY9G5CRmBja9/wJuA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <michal.orzel@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Thread-Topic: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Thread-Index:
 AQHZxUjDKmzjB69oo0mbnCqJ2MJvKa/XEDgAgAAEZQCAAAGbgIAABJqAgAArPoCAAAQngA==
Date: Wed, 2 Aug 2023 17:54:43 +0000
Message-ID: <9B62D8DC-2425-42A4-A95F-BC41FA27238D@arm.com>
References: <20230802135350.745251-1-luca.fancellu@arm.com>
 <17bc595a-dc30-9e76-4d31-aad62f9c9672@amd.com>
 <3ED442CB-0569-4C9C-9770-39D2FE4852A0@arm.com>
 <8c8f2564-935b-e3c8-ad15-348135140a53@amd.com>
 <92AE30B2-B2CE-465F-A6FC-A86961BED85A@arm.com>
 <9d40bd81-dc3a-0288-8f8a-1de62dc30d1d@xen.org>
In-Reply-To: <9d40bd81-dc3a-0288-8f8a-1de62dc30d1d@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|VI1PR08MB10074:EE_|AM7EUR03FT055:EE_|VI1PR08MB5373:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ed789e5-04f1-4767-3c37-08db93819435
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tpo8iftuQ8pd61fSxpMlgL5ns5cw6eHChgVK3rCxzNb7UQ1JJv+jCDFS4oz3piv8iLXGppdGOtQVrFrYKgxiQcmceSLPi3pIb0//dSKp4LULW/j3zxn6mwyTH35jasvdoXKZutMmtjKdcpEVP6tHz6ghpXPTxKvGLU5SjGtfWCLJRe1YUZ9LdlrnZlMkpoiqv8nofeD9vKwRW+cF+vmgR9p5K7nxS4pRokIJqF19sALxt5Df0ZrQ/89srYVLh7CHRKELinYqApbqr4Yn7/G9cmw+8YV7PCQ94U88FhYsFJ9eO29Vitgjxt5nr9K1EmIPAMAhffSidc5+YUX1C5I/ZQymknrEx/JXR/5REDCzajp6yUv9h4fR4Hoo+qXss5PsA8rFsmAKZO7SYduNn/OfEyJ2bSGYPykl3Ckm9/K+YDzSWVsNw2/joO/2yPem1KLKXt/gw3vWtDgXPXlD1Vsyh+lGTGrTML0oirCsViG5okBH68wLQm2GL/NbZ1Lp2SnJJoOPe6Pnj+7IQavlm++JkWxXEP8i4hLW+iXbQqgcpKTKU6sEXWMMBowdQp3VqNBsUG99bQ7KRaZVGLdbUvU/6cIrNspOiGVenXGRGoTaRcc/EM7z6KAlm8+cwSafOHmjDcUClSNep+F1fZruFkEmfQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199021)(2906002)(8936002)(316002)(86362001)(66899021)(8676002)(5660300002)(38070700005)(41300700001)(33656002)(36756003)(6486002)(71200400001)(478600001)(122000001)(186003)(26005)(53546011)(6506007)(54906003)(83380400001)(2616005)(76116006)(66556008)(91956017)(66946007)(38100700002)(6512007)(64756008)(66476007)(4326008)(66446008)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B435A59441F6594CA6FE0D9AA0831D3F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10074
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e624f4c9-4e56-4441-1c35-08db93818da5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Zn3eBY21AdnPSopNI/1nMWnCQIQcVpFdoPRQkC5+Z8aY5s4/rL5sSR24wu6/J+Km53GRJAKK0hnn1opiR6uyevOKZ8R8C77ayCZx9OVXtRcrK6JUQY8AonO40jzVse+aOOO/U0/njEo6tRM2u0Zv73h+Rarc6SGXULDyPfJRHpwYh79veNsDWsP0mc8uKfVDgDsUTdj13zP/952AwORjIdyXm59fheoZZMh+S6i85rSP6+bgz4cAEkzlBQl+sEui530diXhFBFhvBq45Jo2UMEoTteEVNOGbh4f3R+QmjuOaW0akcpnCUqxGAjCVYr4VgEKcVYLRIXbIpWDBcvsCkAIv0OTmagyKYf5u88Duc5+3fMBoqiWdNXF4LPCip3LVSg8Xeh5YZFwXhQ0LOicleXEBsglGboubHAzdGFYlkce/8RthpBTs5Ck1FZqOSo1mPyAqG4z+eXe0mDY2wYGTz/Pdz+FRraGBvERlAsWrw/9BLL9OweNkr4RGR4GdpWCoT3Ewqzu7eJu4vd4K8zdCfo05dGVax5aMpGiAeaDEYgTePfV2paNjl8sD4qW4Rls0C3L6f8v4SG3EOTIfPBIvp12nm9+cQXa0KSVmiYnBjEbX2iBtWarRAxPveqZLBCRS5JATgS/swHYz/0d9unwEyv9eDDss2rZJ/ijtzMJsN7j8107It6pxmrrCr9sCSMe01NrVgP5/qloDK85P2jWXrpfF4tjolWvwMyFiBUyiweOilZh3mryGa1MFvP8XplD
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(136003)(376002)(82310400008)(451199021)(46966006)(40470700004)(36840700001)(40480700001)(336012)(40460700003)(2616005)(186003)(6512007)(316002)(86362001)(478600001)(54906003)(81166007)(33656002)(6486002)(70206006)(70586007)(356005)(4326008)(82740400003)(53546011)(6506007)(36756003)(41300700001)(26005)(107886003)(8676002)(5660300002)(8936002)(47076005)(6862004)(2906002)(66899021)(36860700001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 17:54:54.9013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed789e5-04f1-4767-3c37-08db93819435
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5373

DQoNCj4gT24gMiBBdWcgMjAyMywgYXQgMTg6MzksIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOg0KPiANCj4gSGkgTHVjYSwNCj4gDQo+IE9uIDAyLzA4LzIwMjMgMTY6MDUsIEx1
Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4gT24gMiBBdWcgMjAyMywgYXQgMTU6NDgsIE1pY2hhbCBP
cnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IEhpLA0KPj4+IA0K
Pj4+IE9uIDAyLzA4LzIwMjMgMTY6NDIsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+IA0KPj4+
PiANCj4+Pj4+IE9uIDIgQXVnIDIwMjMsIGF0IDE1OjI2LCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5v
cnplbEBhbWQuY29tPiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gSGkgTHVjYSwNCj4+Pj4+IA0KPj4+
Pj4gT24gMDIvMDgvMjAyMyAxNTo1MywgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4+PiANCj4+
Pj4+PiANCj4+Pj4+PiBJbnRyb2R1Y2UgS2NvbmZpZyBHSUNWMiB0byBiZSBhYmxlIHRvIGNvbXBp
bGUgdGhlIEdJQ3YyIGRyaXZlciBvbmx5DQo+Pj4+Pj4gd2hlbiBuZWVkZWQsIHRoZSBvcHRpb24g
aXMgYWN0aXZlIGJ5IGRlZmF1bHQuDQo+Pj4+Pj4gDQo+Pj4+Pj4gSW50cm9kdWNlIEtjb25maWcg
VkdJQ1YyIHRoYXQgZGVwZW5kcyBvbiBHSUNWMiBvciBHSUNWMyBhbmQgY29tcGlsZXMNCj4+Pj4+
PiB0aGUgR0lDdjIgZW11bGF0aW9uIGZvciBndWVzdHMsIGl0IGlzIHJlcXVpcmVkIG9ubHkgd2hl
biB1c2luZyBHSUNWMg0KPj4+Pj4+IGRyaXZlciwgb3RoZXJ3aXNlIHVzaW5nIEdJQ1YzIGl0IGlz
IG9wdGlvbmFsIGFuZCBjYW4gYmUgZGVzZWxlY3RlZA0KPj4+Pj4+IGlmIHRoZSB1c2VyIGRvZXNu
J3Qgd2FudCB0byBvZmZlciB0aGUgdkdJQ3YyIGludGVyZmFjZSB0byBndWVzdHMgb3INCj4+Pj4+
PiBtYXliZSBpdHMgR0lDdjMgaGFyZHdhcmUgY2FuJ3Qgb2ZmZXIgdGhlIEdJQ3YyIGNvbXBhdGli
bGUgbW9kZS4NCj4+Pj4+PiANCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNlbGx1IDxs
dWNhLmZhbmNlbGx1QGFybS5jb20+DQo+Pj4+Pj4gLS0tDQo+Pj4+Pj4geGVuL2FyY2gvYXJtL0tj
b25maWcgICAgICAgIHwgMTMgKysrKysrKysrKysrKw0KPj4+Pj4+IHhlbi9hcmNoL2FybS9NYWtl
ZmlsZSAgICAgICB8ICA0ICsrLS0NCj4+Pj4+PiB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMg
fCAgNCArKysrDQo+Pj4+Pj4geGVuL2FyY2gvYXJtL2dpYy12My5jICAgICAgIHwgIDQgKysrKw0K
Pj4+Pj4+IHhlbi9hcmNoL2FybS92Z2ljLmMgICAgICAgICB8ICAyICsrDQo+Pj4+Pj4gNSBmaWxl
cyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4+Pj4+IA0KPj4+
Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vS2NvbmZpZyBiL3hlbi9hcmNoL2FybS9LY29u
ZmlnDQo+Pj4+Pj4gaW5kZXggZmQ1N2E4MmRkMjg0Li5kYzcwMmYwOGFjZTcgMTAwNjQ0DQo+Pj4+
Pj4gLS0tIGEveGVuL2FyY2gvYXJtL0tjb25maWcNCj4+Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0v
S2NvbmZpZw0KPj4+Pj4+IEBAIC03OCw2ICs3OCwxNCBAQCBjb25maWcgQVJNX0VGSQ0KPj4+Pj4+
ICAgICAgICAgVUVGSSBmaXJtd2FyZS4gQSBVRUZJIHN0dWIgaXMgcHJvdmlkZWQgdG8gYWxsb3cg
WGVuIHRvDQo+Pj4+Pj4gICAgICAgICBiZSBib290ZWQgYXMgYW4gRUZJIGFwcGxpY2F0aW9uLg0K
Pj4+Pj4+IA0KPj4+Pj4+ICtjb25maWcgR0lDVjINCj4+Pj4+IFNvLCBub3cgaXQgd291bGQgYmUg
cG9zc2libGUgdG8gZGVzZWxlY3QgYm90aCBHSUMgZHJpdmVycyBhbmQgWGVuIHdvdWxkIG5vdCBj
b21wbGFpbiB3aGVuIGJ1aWxkaW5nLg0KPj4+Pj4gVGhpcyBtZWFucyB0aGF0IFhlbiB3b3VsZCBm
YWlsIG9uIGJvb3Qgd2l0aG91dCBhbnkgbWVzc2FnZSBhcyBpdCBoYXBwZW5zIGJlZm9yZSBzZXJp
YWwgZHJpdmVyIGluaXRpYWxpemF0aW9uLg0KPj4+Pj4gU2luY2UgaGF2aW5nIEdJQyBkcml2ZXIg
YnVpbHQgaW4gaXMgYSBtdXN0LWhhdmUgSSB0aGluayB3ZSBuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0
IGF0IGxlYXN0IG9uZSBpcyBlbmFibGVkLg0KPj4+PiANCj4+Pj4gSGkgTWljaGFsLA0KPj4+PiAN
Cj4+Pj4gSSB0cmllZCBhbmQgSSBoYWQ6DQo+Pj4+IA0KPj4+PiBTdGFydGluZyBrZXJuZWwgLi4u
DQo+Pj4+IA0KPj4+PiAtIFVBUlQgZW5hYmxlZCAtDQo+Pj4+IC0gQm9vdCBDUFUgYm9vdGluZyAt
DQo+Pj4+IC0gQ3VycmVudCBFTCAwMDAwMDAwMDAwMDAwMDA4IC0NCj4+Pj4gLSBJbml0aWFsaXpl
IENQVSAtDQo+Pj4+IC0gVHVybmluZyBvbiBwYWdpbmcgLQ0KPj4+PiAtIFplcm8gQlNTIC0NCj4+
Pj4gLSBSZWFkeSAtDQo+Pj4+IChYRU4pIENoZWNraW5nIGZvciBpbml0cmQgaW4gL2Nob3Nlbg0K
Pj4+PiAoWEVOKSBSQU06IDAwMDAwMDAwODAwMDAwMDAgLSAwMDAwMDAwMGZlZmZmZmZmDQo+Pj4+
IChYRU4pIFJBTTogMDAwMDAwMDg4MDAwMDAwMCAtIDAwMDAwMDA4ZmZmZmZmZmYNCj4+Pj4gKFhF
TikNCj4+Pj4gKFhFTikgTU9EVUxFWzBdOiAwMDAwMDAwMDg0MDAwMDAwIC0gMDAwMDAwMDA4NDE1
ZDAwMCBYZW4NCj4+Pj4gKFhFTikgTU9EVUxFWzFdOiAwMDAwMDAwMGZkNmM1MDAwIC0gMDAwMDAw
MDBmZDZjODAwMCBEZXZpY2UgVHJlZQ0KPj4+PiAoWEVOKSBNT0RVTEVbMl06IDAwMDAwMDAwODAw
ODAwMDAgLSAwMDAwMDAwMDgxNGYxYTAwIEtlcm5lbA0KPj4+PiAoWEVOKSAgUkVTVkRbMF06IDAw
MDAwMDAwODAwMDAwMDAgLSAwMDAwMDAwMDgwMDEwMDAwDQo+Pj4+IChYRU4pICBSRVNWRFsxXTog
MDAwMDAwMDAxODAwMDAwMCAtIDAwMDAwMDAwMTg3ZmZmZmYNCj4+Pj4gKFhFTikNCj4+Pj4gKFhF
TikNCj4+Pj4gKFhFTikgQ29tbWFuZCBsaW5lOiBub3JlYm9vdCBkb20wX21lbT0xMDI0TSBjb25z
b2xlPWR0dWFydCBkdHVhcnQ9c2VyaWFsMCBib290c2NydWI9MA0KPj4+PiAoWEVOKSBQRk4gY29t
cHJlc3Npb24gb24gYml0cyAyMC4uLjIyDQo+Pj4+IChYRU4pIERvbWFpbiBoZWFwIGluaXRpYWxp
c2VkDQo+Pj4+IChYRU4pIEJvb3RpbmcgdXNpbmcgRGV2aWNlIFRyZWUNCj4+Pj4gKFhFTikgUGxh
dGZvcm06IEdlbmVyaWMgU3lzdGVtDQo+Pj4+IChYRU4pDQo+Pj4+IChYRU4pICoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioNCj4+Pj4gKFhFTikgUGFuaWMgb24gQ1BVIDA6
DQo+Pj4+IChYRU4pIFVuYWJsZSB0byBmaW5kIGNvbXBhdGlibGUgR0lDIGluIHRoZSBkZXZpY2Ug
dHJlZQ0KPj4+PiAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
DQo+Pj4+IChYRU4pDQo+Pj4+IChYRU4pIE1hbnVhbCByZXNldCByZXF1aXJlZCAoJ25vcmVib290
JyBzcGVjaWZpZWQpDQo+Pj4gSGF2aW5nIGVhcmx5IHByaW50ayBlbmFibGVkIGFsbCB0aGUgdGlt
ZSBpcyBub3QgY29tbW9uIGFuZCBub3QgZW5hYmxlZCBpbiByZWxlYXNlIGJ1aWxkcyBGV0lLLg0K
PiANCj4gVGhlcmUgYXJlIGEgbG90IG9mIGluZm9ybWF0aW9uIHByaW50ZWQgYmVmb3JlIHRoZSBj
b25zb2xlIGlzIHByb3Blcmx5IGJyb3VnaHQgdXAuIEkgd29uZGVyIGlmIHdlIHNob3VsZCBsb29r
IGF0IGFkZGluZyBlYXJseSBjb25zb2xlIGxpa2UgTGludXggZG9lcz8NCj4gDQo+Pj4gU28gaW4g
Z2VuZXJhbCwgdXNlciB3b3VsZCBqdXN0IHNlZSAiU3RhcnRpbmcga2VybmVsIiBmcm9tIHUtYm9v
dCBhbmQgaGFkIHRvIGRlYnVnIHdoYXQncyBnb2luZyBvbi4NCj4+PiANCj4+Pj4gDQo+Pj4+IFdv
dWxkbuKAmXQgYmUgZW5vdWdoIHRvIHN1Z2dlc3QgdGhlIHVzZXIgdGhhdCBhdCBsZWFzdCBvbmUg
R0lDIG5lZWRzIHRvIGJlIHNlbGVjdGVkPyBJbiB0aGUgaGVscCBpdA0KPj4+PiBhbHNvIHN0YXRl
cyDigJxpZiB1bnN1cmUsIHNheSBZIg0KPj4+IEkgYWx3YXlzIHRoaW5rIGl0IGlzIGJldHRlciB0
byBtZWV0IHRoZSB1c2VycyBuZWVkcyBieSBwcmV2ZW50aW5nIHVud2lzZSBtaXN0YWtlcyBsaWtl
IHVuc2VsZWN0aW5nIGJvdGggZHJpdmVycy4NCj4+PiBBcyBhbHdheXMsIGl0IGlzIHVwIHRvIG1h
aW50YWluZXJzLg0KPj4gQW55d2F5IEkgdW5kZXJzdGFuZCB5b3VyIHBvaW50LCBkbyB5b3UgdGhp
bmsgc29tZXRoaW5nIGxpa2UgdGhhdCBjb3VsZCBiZSBvaz8gSeKAmXZlIGNoZWNrZWQgYW5kIGl0
IHdvcmtzLCBpdA0KPj4gY29tcGlsZSBvbmx5IGlmIGF0IGxlYXN0IG9uZSBHSUMgZHJpdmVyIGlz
IGVuYWJsZWQNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNo
L2FybS9zZXR1cC5jDQo+PiBpbmRleCAyNjRkMmYyZDRiMDkuLjg1YjRhN2YwODkzMiAxMDA2NDQN
Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vc2V0
dXAuYw0KPj4gQEAgLTEwOTYsNiArMTA5Niw5IEBAIHZvaWQgX19pbml0IHN0YXJ0X3hlbih1bnNp
Z25lZCBsb25nIGJvb3RfcGh5c19vZmZzZXQsDQo+PiAgICAgICAgcHJlaW5pdF94ZW5fdGltZSgp
Ow0KPj4gICsgICAgLyogRG9uJ3QgYnVpbGQgaWYgYXQgbGVhc3Qgb25lIEdJQyBkcml2ZXIgaXMg
ZW5hYmxlZCAqLw0KPj4gKyAgICBCVUlMRF9CVUdfT04oIShJU19FTkFCTEVEKENPTkZJR19HSUNW
MykgfHwgSVNfRU5BQkxFRChDT05GSUdfR0lDVjIpDQo+PiArICAgICAgICAgICAgICAgICB8fCBJ
U19FTkFCTEVEKENPTkZJR19ORVdfVkdJQykpKTsNCj4gcmFuZGNvbmZpZyBpbiBnaXRsYWIgd2ls
bCBub3cgcmFuZG9tbHkgZmFpbCBjb21waWxhdGlvbi4gSWYgd2Ugd2FudCB0byBlbmNvZGUgdGhl
IGRlcGVuZGVuY3kgdGhlbiBpdCBzaG91bGQgYmUgZG9uZSBpbiBLY29uZmlnLiBCdXQgSSBoYXZl
bid0IGxvb2tlZCBhdCBob3cgdG8gZG8gdGhhdC4NCg0KT2sgSeKAmWxsIGludmVzdGlnYXRlIGl0
LCBhcGFydCBmcm9tIHRoYXQsIGlmIEkgZmluZCBhIHBvc3NpYmxlIHdheSB0byBoYXZlIHRoYXQg
aW4gS2NvbmZpZywgZG8geW91IGhhdmUgYW55IG9iamVjdGlvbiBvbiB3aGF0IHRoaXMgcGF0Y2gg
aXMgZG9pbmcgYW5kIHRoZSBhcHByb2FjaCB0YWtlbj8NCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4g
LS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

