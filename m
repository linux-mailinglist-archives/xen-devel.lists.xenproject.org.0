Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 225CB7CBA6F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 07:57:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618036.961247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsd3z-0003ol-2s; Tue, 17 Oct 2023 05:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618036.961247; Tue, 17 Oct 2023 05:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsd3y-0003l3-W7; Tue, 17 Oct 2023 05:56:18 +0000
Received: by outflank-mailman (input) for mailman id 618036;
 Tue, 17 Oct 2023 05:56:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qhkS=F7=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qsd3x-0003kh-Au
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 05:56:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfc48caf-6cb1-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 07:56:11 +0200 (CEST)
Received: from DUZP191CA0030.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::19)
 by DBBPR08MB5881.eurprd08.prod.outlook.com (2603:10a6:10:208::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 05:56:05 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4f8:cafe::1b) by DUZP191CA0030.outlook.office365.com
 (2603:10a6:10:4f8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Tue, 17 Oct 2023 05:56:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Tue, 17 Oct 2023 05:56:05 +0000
Received: ("Tessian outbound fdf44c93bd44:v211");
 Tue, 17 Oct 2023 05:56:05 +0000
Received: from 1ec46d503c1b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CC41F592-AF83-40BC-BC24-C1F21C46E806.1; 
 Tue, 17 Oct 2023 05:55:53 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1ec46d503c1b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Oct 2023 05:55:53 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VE1PR08MB5677.eurprd08.prod.outlook.com (2603:10a6:800:1ab::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 05:55:50 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 05:55:48 +0000
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
X-Inumbo-ID: dfc48caf-6cb1-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGlFlyPhBSk+mEKeA6Qqh/qZxQrBEuDjqmQUvjFIPrg=;
 b=X2UgUDRaWtI9emO/nDgxQ3LA66ITna4gSwFW3wEcimrh5S507JihwzgshGc8oTl8PvHUeH2H/TpcS7T9q8Ttu740EGPwgNpT/jyQqVroAcePGYCTUbwfWc4qfG8JBxhSxRmH+LtEHyo0YJ5Y4rbvz1an9AeHykSmNS6I3/aQEuA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f9dc8dcd90e3cf9f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbnj77DURGSTpkV6C4JjOBj/iYmLh23RKy70HJFomn7jyz5y+FdlbEy0hIU2LZVwEbEvDk6jdUZvChU9SGuZgHecm6f5ogdidZQzbMZe6NrF6KNoN7GzbPq1kVjr/FDQi9U7vIXgAWy4/IU+SxqVjNbzFMCgLbdcFWy84QQ/omFEgz0yAardjiYo1nkh7FNymFFTP8JyYU5IalZZSPjVxJcCfDvPVy6aIqrDBKvmgY9SXBF/enWhs3YAxdhSfxCh/TO3TFNSXq7pi9Qym9JAQNlwxm1V2ky/IiC+wBcYzJf4br4Xb7Q2E/NWrOyHRzlLDBvGsMkccKPsPvKUjmfVMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGlFlyPhBSk+mEKeA6Qqh/qZxQrBEuDjqmQUvjFIPrg=;
 b=mKX1/hgnhMHpCNcIIdFTZ39jTHqlQs4ZZI5Z5V6uUHyRZJ6bYCb3RqdNZyqu/kMuqW9b6RjqpMsndnzSEzNkHG5r8aJBqRtG5Kg/DDxmuGa5m3rHDZ3OC0+iHTHIilUST+uEaa7x5ickeNuHz+tv6r++3YnM3pg30jsVxShunDC4k+PtGW7qSWheza3EblxQxEbdfWRcq4hQe1vSkBx9uplfV3C/sZ2pp3ZzNTKHc3GyxatECLybGnMQXEsydCEoHbLD29n3Oo+7STB2TGSvyNfSWR5DgUzjoBX+SUXCK3GvBHlTiccVzl7IvxUB5gh3okSZRdZax5PDT4fpn8Om6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGlFlyPhBSk+mEKeA6Qqh/qZxQrBEuDjqmQUvjFIPrg=;
 b=X2UgUDRaWtI9emO/nDgxQ3LA66ITna4gSwFW3wEcimrh5S507JihwzgshGc8oTl8PvHUeH2H/TpcS7T9q8Ttu740EGPwgNpT/jyQqVroAcePGYCTUbwfWc4qfG8JBxhSxRmH+LtEHyo0YJ5Y4rbvz1an9AeHykSmNS6I3/aQEuA=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Penny
 Zheng <Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v7 8/8] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Thread-Topic: [PATCH v7 8/8] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Thread-Index: AQHZ+kyDxYKGSy7Hi0WFFm+WJG77tLBID9YAgAV4qIA=
Date: Tue, 17 Oct 2023 05:55:48 +0000
Message-ID: <038DAAA9-25B5-4DDD-8206-35C3BCF69360@arm.com>
References: <20231009010313.3668423-1-Henry.Wang@arm.com>
 <20231009010313.3668423-9-Henry.Wang@arm.com>
 <af6a376c-a224-45d7-9972-d69ee44239d6@xen.org>
In-Reply-To: <af6a376c-a224-45d7-9972-d69ee44239d6@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VE1PR08MB5677:EE_|DBAEUR03FT025:EE_|DBBPR08MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: 04b773ed-9dbb-436c-cf37-08dbced5c05c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iKq0q3S1QkZhbDOUeHMlzqE9chE1XUZR0bC41a9M05LmDkgGykZCQaiMmMNt6XwN85ToL6wIflo6QNfIvgCwMqCcxyJfdZ2jf50OSk47fB3luPEPGpJydlqIt6HutOotUyxrAdbVZ8FQyy12BXEAHtXLNDmv1eA5X447f1gSyt3bxoIO12DBcee+PX3oFXJ9L9UtZ5I52Vfxlkwynq4DILfePnS1hUoIrCu0WMNcFui/exxJpMjBqR3CeyJA7YXcqvChyDpX7W/bEFRpyo5Y82m+x+g8c7tcduWtR3Z7fNQ7BGW50vh98IQNjtOfdyV+DuB6rrFz99Hu1LpvcDrHF/VPE6gpjX4BowmbiH4JW6ouNI2zU3HVkX+WfSG0jk/xQ1U6p9u3QhDogsd/72gH4mb/MvtCKck63ANsGMr9Rcvo6Dmr+Pcx9KVvb/KWfPBctaufn8E92SkacsGpdttx7Z334yzVWJt+2rJsqosexbfyWOALdD8869ry1j4qjkucZt2SOkEy5PPm5ufN5s+2GwD584+W+ItBFaRojxTU3bzEjS/ckTWl1iciAb0fvtgjtAN8rbLoVm8YV8HPG4auFB7F70QpEE+w0lkpvUCttUKMrxLmDuINXJCnodB18AJ/p6hAbOHru+DrjJACaMOYcw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(376002)(366004)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(316002)(66556008)(66476007)(66946007)(54906003)(76116006)(91956017)(6916009)(66446008)(64756008)(38070700005)(4326008)(8936002)(8676002)(38100700002)(6512007)(53546011)(2616005)(6486002)(71200400001)(6506007)(83380400001)(122000001)(478600001)(33656002)(26005)(36756003)(2906002)(5660300002)(86362001)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C038786ADA5B645B6ECAE5E70F7FE34@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5677
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7e884d9d-14ad-4c1a-d20d-08dbced5b684
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zZqDVJ29tbLof9Ad/FJIr1oNrG97AFHLenlYMUM4fc8wtl1HyDqAowReT5FVGKHsDggc0EA4AnG8oe4F2wfSr+h726c1DnH6bMpbs2ANE6EooaBXaQdqkoKjlMEO7a4YNxUBn+LIDQ6ngkWYypfSfc0vOFc9ihJ6cVdgKp40E9kE4krsosK/qxigvhwrWRxt1rYGCqEETbUpEIi92W7vyRXBS6MqN+lEg2K9STFPQlnR4mg22lFHffeTR2JYMvC2alTOfl8gh/cCLoLMaPsTeJSItCxTWdrt/Kfbzf1pPv17piCNZZQtJ1RcgNxTAy3AmNcsyX9l42bLzpWo5picBNniE3pM7x0j3TGXSlhu8zXvpNxg2nSSzL+rrMNsERRFwRgYw1q2csDp5OxfFDRI/4CQNsolW8n4Jt4URKaUpCpW/NDctqX+3b+TL41b97YLV/yXM+slLt/7W1seI33bD/Yd9PoGpdQazQJl2UCCp/CaQHMDPShqgL/Nu8MzHm3teQujPoVtV4hAkTJepk+Jw65o5qkLj5i13wFY6KMqlD216VPM6psWtawodL9ejwwme9p5XOUV+EQrzeVjSVhUAhTK7BjTekZ0pynP5C24MUP6pljZMDtojTKT+rt0FEeE8j+ea7zInsnFUG/scSLrSdHKCTzqELIvOo87ynGn+itewL6kZqLCVWgahkrpEpEZn6OpKXSoXP/4YBtdd4l3Bm5w2pQsULB1QZ9BNspBHDttDG9vstXEi7cctwGd2Olk
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(186009)(1800799009)(82310400011)(451199024)(64100799003)(46966006)(40470700004)(36840700001)(47076005)(83380400001)(8676002)(8936002)(36860700001)(6506007)(70586007)(6486002)(70206006)(478600001)(336012)(54906003)(26005)(6512007)(2616005)(53546011)(2906002)(33656002)(5660300002)(36756003)(86362001)(356005)(82740400003)(6862004)(4326008)(316002)(81166007)(41300700001)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 05:56:05.3564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b773ed-9dbb-436c-cf37-08dbced5c05c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5881

SGkgSnVsaWVuLA0KDQo+IE9uIE9jdCAxNCwgMjAyMywgYXQgMDI6MjIsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgSGVucnksDQo+IA0KPiBPbiAwOS8xMC8y
MDIzIDAyOjAzLCBIZW5yeSBXYW5nIHdyb3RlOg0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL3AybS5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3AybS5o
DQo+PiBpbmRleCA5NDA0OTVkNDJiLi5hOTYyMmRhYzlhIDEwMDY0NA0KPj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL3AybS5oDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9h
c20vcDJtLmgNCj4+IEBAIC0xOSw2ICsxOSwyMiBAQCBleHRlcm4gdW5zaWduZWQgaW50IHAybV9y
b290X2xldmVsOw0KPj4gICNkZWZpbmUgUDJNX1JPT1RfT1JERVIgICAgcDJtX3Jvb3Rfb3JkZXIN
Cj4gDQo+IFlvdSBzZWVtIHRvIHVzZSBQMk1fUk9PVF9PUkRFUiB0byBhbGxvY2F0ZSBwMm0tPnJv
b3QgaW4gYXJtL3AybS5jLiBIb3dldmVyLCBhcyBJIG1lbnRpb25lZCBiZWZvcmUsIEkgZG9uJ3Qg
dGhpbmsgdGhlIGRlZmludGlvbiBvZiBwMm0tPnJvb3QgaXMgc3VpdGFibGUgZm9yIHRoZSBNUFUu
IEkgdGhpbmsgdGhlIHR3byBmdW5jdGlvbnMgdXNpbmcgcDJtLT5yb290IHNob3VsZCBiZSBtb3Zl
ZCBpbiBtbXUvcDJtLmMgYW5kIFAyTV9ST09UX09SREVSIHNob3VsZCBiZSBtb3ZlZCBpbiBtbXUv
cDJtLmguDQoNCldoaWxlIHdvcmtpbmcgb24gdGhpcywgSSBub3RpY2VkIHRoYXQgaWYgd2UgbW92
ZSBwMm1fZmluYWxfdGVhcmRvd24oKSAob25lIG9mIHRoZSB0d28NCmZ1bmN0aW9ucyB5b3UgbWVu
dGlvbmVkIHRoYXQgY29uc3VtaW5nIHAybS0+cm9vdCksIHdlIGFsc28gbmVlZCB0byBtb3ZlIHRo
ZSBzdGF0aWMNCmZ1bmN0aW9uIHAybV9mcmVlX3ZtaWQoKS4gVGhpcyBzZWVtcyByZWFzb25hYmxl
IGFzIG9uIE1QVSB3ZSBvbmx5IGhhdmUgZG9tMGxlc3MNCmRvbVVzIHNvIHdlIGRvbuKAmXQgcmVh
bGx5IG5lZWQgdG8gZnJlZSB2bWlkLiBIb3dldmVyLCBpZiBwMm1fZnJlZV92bWlkKCkgaXMgbW92
ZWQgdG8NCm1tdS9wMm0uYywgd2UgaGF2ZSB0d28gY29uc3VtZXJzIG9mICJzdGF0aWMgc3Bpbmxv
Y2tfdCB2bWlkX2FsbG9jX2xvY2vigJ0gYW5kDQoic3RhdGljIHVuc2lnbmVkIGxvbmcgKnZtaWRf
bWFzayIuDQoNClNvIEkgYW0gd3JpdGluZyB0aGlzIGVtYWlsIGp1c3QgdG8gY29uZmlybSB0aGF0
IGFyZSB5b3UgZmluZSB3aXRoIGV4cG9zaW5nIHRoZXNlIHR3bw0KZ2xvYmFsIHZhcmlhYmxlcz8g
VGhhbmtzIQ0KDQpUaGUgb3RoZXIgY29tbWVudHMgc2VlbSBmaW5lIGFuZCBJ4oCZdmUgZml4ZWQg
YWxsIG9mIHRoZW0uDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5

