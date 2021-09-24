Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75063416B12
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 06:46:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194909.347293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTd6Q-0002El-PN; Fri, 24 Sep 2021 04:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194909.347293; Fri, 24 Sep 2021 04:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTd6Q-0002Cs-MB; Fri, 24 Sep 2021 04:46:26 +0000
Received: by outflank-mailman (input) for mailman id 194909;
 Fri, 24 Sep 2021 04:46:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTd6P-0002Ci-EP
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 04:46:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.74]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5de2cc84-1cf2-11ec-baa8-12813bfff9fa;
 Fri, 24 Sep 2021 04:46:24 +0000 (UTC)
Received: from AM6PR10CA0003.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::16)
 by AM0PR08MB5025.eurprd08.prod.outlook.com (2603:10a6:208:15e::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Fri, 24 Sep
 2021 04:46:22 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::63) by AM6PR10CA0003.outlook.office365.com
 (2603:10a6:209:89::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Fri, 24 Sep 2021 04:46:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 04:46:21 +0000
Received: ("Tessian outbound c21c48fbc857:v103");
 Fri, 24 Sep 2021 04:46:20 +0000
Received: from ed3464f4dcd4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A6075550-3637-4EED-8A6F-1B3EB3CA1173.1; 
 Fri, 24 Sep 2021 04:46:09 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ed3464f4dcd4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 04:46:09 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB9PR08MB6505.eurprd08.prod.outlook.com (2603:10a6:10:23e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 04:46:07 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 04:46:07 +0000
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
X-Inumbo-ID: 5de2cc84-1cf2-11ec-baa8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HayqveibyC0u7zRGugoPlW+XlwdFa78evUZyH0bKnaI=;
 b=WTNfbb5JPGmQCdqf+Xt2zST7Co/yfg+v0KNXTvHEi8cn+ewBO24hkjwWhgiUgA/VU21lhAvrtJSQoGykjnCCQZdYnfpoxq1QWv9hFScf4P9a9r2nxGD4RcpKah3g8cORm1yaiwhSNVB/N72iT2qowgaf5ohkQfAP7mJf/7SOJEA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+xgJtQ+PlLC4BvFNjbnRB3g62fpsZoOEF7wML7BBEQRyY20Ufqbn55CmbK5JPAk4/LdexiwWQULwWzEadFAIYiiaRq1yxFhi1h7R5WZYFnOT1y9BG+JzFz0M/7KBkp3QvafK5mxkutK4/DUtuB29JW1kLh4lAqOOdJWtkTap9ky7LpQb3hcd8clS+f1AF6V4qHOfWvvlzuQTnsrK/4LtkxQDY9d7egiDyww6xriV8QJigfOahM4W5LXtbEH88xfKpmPy/mG+5HZrjhWM42gyeeKUc4Fe7HvHOW/VnQDNBLFK13U2pg2RuFTPc2aHyUpzw/sVu/DchNk3ZWmJmprnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=HayqveibyC0u7zRGugoPlW+XlwdFa78evUZyH0bKnaI=;
 b=IfIs68GX5bkZ1NmSehJ68o8N4Qx/1sb570xo2KePaykFKkDFXs6id8dCSIlHBsSMHaUfua1cOzz9FyZ/mGZWHsNMgDZRI1GyEvWBj1CJH36WN8Rw+zJr4I+UL7tyIn7IBIpwVdSFb5SS9rUA/VhZm+9MY8V+cVvWRSzELuU5Uaalqz9OpSe2DGQgDxLD0yHXzhyET1fATQO0xuv3b2Cq/tRFsU414eO8aRwzP9G1SfisF+z/v15JmGnDq5POY3ngYDIxzOAEYdemfN8r4tv4l+/OGu0bKCIOX90C4esdHmfm76GKhI3IVdsjdNSDTsV/+dQ18HpWXJJ8z3kmoTcPYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HayqveibyC0u7zRGugoPlW+XlwdFa78evUZyH0bKnaI=;
 b=WTNfbb5JPGmQCdqf+Xt2zST7Co/yfg+v0KNXTvHEi8cn+ewBO24hkjwWhgiUgA/VU21lhAvrtJSQoGykjnCCQZdYnfpoxq1QWv9hFScf4P9a9r2nxGD4RcpKah3g8cORm1yaiwhSNVB/N72iT2qowgaf5ohkQfAP7mJf/7SOJEA=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 29/37] xen/arm: introduce a helper to parse device tree
 processor node
Thread-Topic: [PATCH 29/37] xen/arm: introduce a helper to parse device tree
 processor node
Thread-Index: AQHXsHMy8BVdIW2w9kGY+s/rVXmgtKuye2oAgAAhuZA=
Date: Fri, 24 Sep 2021 04:46:07 +0000
Message-ID:
 <DB9PR08MB6857B805811A0A010C4706B89EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-30-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231940110.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109231940110.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5552BC78E3C6B64C98A2D794C2EE5CE7.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 20478977-87bd-4d9a-9af0-08d97f1641d6
x-ms-traffictypediagnostic: DB9PR08MB6505:|AM0PR08MB5025:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB50257AF5F50F0B6FF02BF66A9EA49@AM0PR08MB5025.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mDBlIQQPHQTDpjWsalKvOny82wmtLvjhpk0uioD13qxBjUWS7d+WZTzQ3vJa4VLFOjuM/gsD/QeoDlGKzkfFwCOmbRSn/VMzqlSi9ytFKaP+j0Ku0/lGWLpHhvV2Z1NelRZplc5DwC+isStKMh7oXsZmwnj2P7uwfNypgxXEfpbXmj98pqryf2zlLNvoRaAXsB1mVudXV1NiLBDL0/RYFmtArjDVnlOywRngtqqsmgVBhMRGQTEsmM6Xo8UEyOomqt55/ShKsJD7jBe8+TuJDXcUrvgRm7O+1wibGyl5sXuS9611bGUxcM3rewN2d6e8IL5vtuf4wlIg/vvAxef2ZYRzit8iskjQv4Zm0gXV5Mt323iVoOpF2cXu0ZyzB+zC3pEajg2e1o6i4bpT1GOO3+OV233Zxu7gtit6+C/pMtUKH96or5nceWwOhcdfb3R9eOhS3lAhCQA4iA/KzoFkyBWxZZV8bq9OvMKEAZ+o/QdM4wP/ucmuneGh7UzEOqaSBqZvgwpQjNTIOObPPr7vMF9p8eJiZHkuKqzT2hAvVvjwoI+B8/ZJZeLr5FxknHi3tX6N8tnlPwuA18c1PFamTZ316HWO9dXeGziJxTTfY1b3Z5FsrRw8i62/sze4V4/TtJ5kUOgDc6HqXLk/xCzTcqh3NWsYjz4R3qoAn/j2QMK+w2uFTrKu3cm6hQW0IsC3asqRErlJu+pIkC5Jr0BKji+YGzBDCRGPNaNb9266FClYVlZAAZLucjjBlWhOeUg3sqLlAVmEhWXo/y5JUVzjnjmGtICiiofekZyIE/gzNDLQy3nC6/iZ+Z6IvQ1SxtrR
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52536014)(8936002)(122000001)(33656002)(5660300002)(83380400001)(316002)(38100700002)(4326008)(9686003)(8676002)(55016002)(66446008)(64756008)(54906003)(66556008)(76116006)(6506007)(2906002)(66476007)(66946007)(186003)(53546011)(86362001)(71200400001)(26005)(508600001)(38070700005)(6916009)(7696005)(2004002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6505
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d6f0f171-03ff-46c4-2745-08d97f16392d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tA884DfCAEYwI+MKsuCrkGrdqx0sF51Z6Z0Llg3flrtyjTS/VsVVtSLN//kT+B3HvQNJDgvsySNyJeTZnFaAPa1xOGx/5by2qZk4GMx24dh6SbjFM6hSgDp6FkreutpVE9Cm9cQGcWzTHt7Y78QeGTZoZCTi82CZMoapppN3GAPRwd55eFUXHjYdkyYUcLOTPLZ/W2X0xUapJaraEFAu9hV+aV5cW6miWGiRar/OQKm8DgPWvKlRXuRgaqYR9kMEIAyDQsMttUzj0/VDGGUyttAqRjzyf91I86je3E87hk1xioPuXHxpIBoTe0jQ9rs6etIDn5c+TAze/cf227T6oG/3N3t3JfUhxx5VhRQKd4PAET+XLQ+QezNPUxeJFbJRpp1Y866xeTCd6zq+x3P2kvmfxA8qgs+aOTZ44YmALir8zP+hqEe4O34aOxui6L5hqqpy/41WPttbJy24Em+Z+2hOSSs7mMGnAdkZrmi5rA2VVXW+GwnE2BhO7xToz97xkgidv6YiUFYQlc+ShHA8v1vjsYMonXtdPuD5XlXTA2P9DzteHO3zQ8jQNumzXCY6pPUvA/7RA9DjQ+xF0wc4+pIe//cMUaoopC35ZbnajV5Z19pP7pT1jU8POWXejPsQc7xphK4G0ZH2M8PSGHoRYRvep8R6IGbE0O4gKGAWvAm5dK/LVFJkIEq6Df3Rp7HHN1ahV1y6CoMy1EjqXNUVij6Ww2OsGi1BmmXYwB6XTR/5em2nil3Fze8CbmG/gKT/sEbXSvtED6mB0pXqrtakHS89QtADS5WUZwOSDrmYROXlHofh/NBRMuJxTOtLDjbY
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(82310400003)(316002)(70206006)(83380400001)(6862004)(86362001)(26005)(186003)(55016002)(8676002)(356005)(8936002)(33656002)(70586007)(47076005)(53546011)(52536014)(9686003)(81166007)(36860700001)(54906003)(6506007)(336012)(7696005)(4326008)(508600001)(2906002)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 04:46:21.9657
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20478977-87bd-4d9a-9af0-08d97f1641d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5025

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gU2VudDogMjAyMcTqOdTCMjTI1SAxMDo0NQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGllbkB4ZW4ub3JnOw0K
PiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMjkvMzddIHhlbi9hcm06IGludHJvZHVjZSBhIGhlbHBlciB0byBwYXJzZSBk
ZXZpY2UNCj4gdHJlZSBwcm9jZXNzb3Igbm9kZQ0KPiANCj4gT24gVGh1LCAyMyBTZXAgMjAyMSwg
V2VpIENoZW4gd3JvdGU6DQo+ID4gUHJvY2Vzc29yIE5VTUEgSUQgaW5mb3JtYXRpb24gaXMgc3Rv
cmVkIGluIGRldmljZSB0cmVlJ3MgcHJvY2Vzc29yDQo+ID4gbm9kZSBhcyAibnVtYS1ub2RlLWlk
Ii4gV2UgbmVlZCBhIG5ldyBoZWxwZXIgdG8gcGFyc2UgdGhpcyBJRCBmcm9tDQo+ID4gcHJvY2Vz
c29yIG5vZGUuIElmIHdlIGdldCB0aGlzIElEIGZyb20gcHJvY2Vzc29yIG5vZGUsIHRoaXMgSUQn
cw0KPiA+IHZhbGlkaXR5IHN0aWxsIG5lZWQgdG8gYmUgY2hlY2tlZC4gT25jZSB3ZSBnb3QgYSBp
bnZhbGlkIE5VTUEgSUQNCj4gPiBmcm9tIGFueSBwcm9jZXNzb3Igbm9kZSwgdGhlIGRldmljZSB0
cmVlIHdpbGwgYmUgbWFya2VkIGFzIE5VTUENCj4gPiBpbmZvcm1hdGlvbiBpbnZhbGlkLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4gLS0t
DQo+ID4gIHhlbi9hcmNoL2FybS9NYWtlZmlsZSAgICAgICAgICAgfCAgMSArDQo+ID4gIHhlbi9h
cmNoL2FybS9udW1hX2RldmljZV90cmVlLmMgfCA1OCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspDQo+ID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL01ha2VmaWxlIGIveGVuL2FyY2gvYXJtL01ha2Vm
aWxlDQo+ID4gaW5kZXggNDFjYTMxMWI2Yi4uYzUwZGYyYzI1ZCAxMDA2NDQNCj4gPiAtLS0gYS94
ZW4vYXJjaC9hcm0vTWFrZWZpbGUNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vTWFrZWZpbGUNCj4g
PiBAQCAtMzYsNiArMzYsNyBAQCBvYmoteSArPSBtZW1fYWNjZXNzLm8NCj4gPiAgb2JqLXkgKz0g
bW0ubw0KPiA+ICBvYmoteSArPSBtb25pdG9yLm8NCj4gPiAgb2JqLSQoQ09ORklHX05VTUEpICs9
IG51bWEubw0KPiA+ICtvYmotJChDT05GSUdfREVWSUNFX1RSRUVfTlVNQSkgKz0gbnVtYV9kZXZp
Y2VfdHJlZS5vDQo+ID4gIG9iai15ICs9IHAybS5vDQo+ID4gIG9iai15ICs9IHBlcmNwdS5vDQo+
ID4gIG9iai15ICs9IHBsYXRmb3JtLm8NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL251
bWFfZGV2aWNlX3RyZWUuYw0KPiBiL3hlbi9hcmNoL2FybS9udW1hX2RldmljZV90cmVlLmMNCj4g
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAuLjI0MjhmYmFlMGIN
Cj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL251bWFfZGV2aWNlX3Ry
ZWUuYw0KPiA+IEBAIC0wLDAgKzEsNTggQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjANCj4gPiArLyoNCj4gPiArICogQXJtIEFyY2hpdGVjdHVyZSBzdXBwb3J0IGxh
eWVyIGZvciBOVU1BLg0KPiA+ICsgKg0KPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjEgQXJtIEx0
ZA0KPiA+ICsgKg0KPiA+ICsgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNh
biByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQ0KPiA+ICsgKiBpdCB1bmRlciB0aGUgdGVy
bXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMiBhcw0KPiA+ICsg
KiBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4NCj4gPiArICoNCj4g
PiArICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2ls
bCBiZSB1c2VmdWwsDQo+ID4gKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBl
dmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mDQo+ID4gKyAqIE1FUkNIQU5UQUJJTElUWSBvciBG
SVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUNCj4gPiArICogR05VIEdl
bmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4NCj4gPiArICoNCj4gPiArICog
WW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGlj
IExpY2Vuc2UNCj4gPiArICogYWxvbmcgd2l0aCB0aGlzIHByb2dyYW0uIElmIG5vdCwgc2VlIDxo
dHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4NCj4gPiArICoNCj4gPiArICovDQo+ID4gKyNp
bmNsdWRlIDx4ZW4vaW5pdC5oPg0KPiA+ICsjaW5jbHVkZSA8eGVuL25vZGVtYXNrLmg+DQo+ID4g
KyNpbmNsdWRlIDx4ZW4vbnVtYS5oPg0KPiA+ICsjaW5jbHVkZSA8eGVuL2xpYmZkdC9saWJmZHQu
aD4NCj4gPiArI2luY2x1ZGUgPHhlbi9kZXZpY2VfdHJlZS5oPg0KPiA+ICsNCj4gPiArLyogQ2Fs
bGJhY2sgZm9yIGRldmljZSB0cmVlIHByb2Nlc3NvciBhZmZpbml0eSAqLw0KPiA+ICtzdGF0aWMg
aW50IF9faW5pdCBmZHRfbnVtYV9wcm9jZXNzb3JfYWZmaW5pdHlfaW5pdChub2RlaWRfdCBub2Rl
KQ0KPiA+ICt7DQo+ID4gKyAgICBpZiAoIHNyYXRfZGlzYWJsZWQoKSApDQo+ID4gKyAgICAgICAg
cmV0dXJuIC1FSU5WQUw7DQo+IA0KPiBmZHRfbnVtYV9wcm9jZXNzb3JfYWZmaW5pdHlfaW5pdCBp
cyBjYWxsZWQgYnkgZmR0X3BhcnNlX251bWFfY3B1X25vZGUNCj4gd2hpY2ggaXMgYWxyZWFkeSBw
YXJzaW5nIE5VTUEgcmVsYXRlZCBpbmZvLiBTaG91bGQgdGhpcyBzcmF0X2Rpc2FibGVkDQo+IGNo
ZWNrIGJlIG1vdmVkIHRvIGZkdF9wYXJzZV9udW1hX2NwdV9ub2RlPw0KPiANCg0KQWgsIHllcywg
aXQncyBhIGdvb2Qgc3VnZ2VzdGlvbiwgSSB3aWxsIGFkZHJlc3MgaXQgaW4gbmV4dCB2ZXJzaW9u
Lg0KDQo+IA0KPiA+ICsgICAgZWxzZSBpZiAoIG5vZGUgPT0gTlVNQV9OT19OT0RFIHx8IG5vZGUg
Pj0gTUFYX05VTU5PREVTICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBiYWRfc3JhdCgpOw0K
PiA+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArICAgIG51
bWFfc2V0X3Byb2Nlc3Nvcl9ub2Rlc19wYXJzZWQobm9kZSk7DQo+ID4gKyAgICBmd19udW1hID0g
MTsNCj4gPiArDQo+ID4gKyAgICBwcmludGsoS0VSTl9JTkZPICJEVDogTlVNQSBub2RlICUiUFJJ
dTciIHByb2Nlc3NvciBwYXJzZWRcbiIsIG5vZGUpOw0KPiA+ICsNCj4gPiArICAgIHJldHVybiAw
Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICsvKiBQYXJzZSBDUFUgTlVNQSBub2RlIGluZm8gKi8NCj4g
PiArc3RhdGljIGludCBfX2luaXQgZmR0X3BhcnNlX251bWFfY3B1X25vZGUoY29uc3Qgdm9pZCAq
ZmR0LCBpbnQgbm9kZSkNCj4gPiArew0KPiA+ICsgICAgdWludDMyX3QgbmlkOw0KPiA+ICsNCj4g
PiArICAgIG5pZCA9IGRldmljZV90cmVlX2dldF91MzIoZmR0LCBub2RlLCAibnVtYS1ub2RlLWlk
IiwgTUFYX05VTU5PREVTKTsNCj4gPiArICAgIGlmICggbmlkID49IE1BWF9OVU1OT0RFUyApDQo+
ID4gKyAgICB7DQo+ID4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIk5vZGUgaWQgJXUgZXhj
ZWVkcyBtYXhpbXVtIHZhbHVlXG4iLCBuaWQpOw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF4gUFJJdTMyDQo+IA0KPiANCj4gPiArICAgICAgICByZXR1cm4gLUVJTlZB
TDsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4gKyAgICByZXR1cm4gZmR0X251bWFfcHJvY2Vzc29y
X2FmZmluaXR5X2luaXQobmlkKTsNCj4gPiArfQ0KPiA+IC0tDQo+ID4gMi4yNS4xDQo+ID4NCg==

