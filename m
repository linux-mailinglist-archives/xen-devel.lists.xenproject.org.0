Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 399D8403583
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 09:35:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181543.328701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNs6I-0004x4-Pm; Wed, 08 Sep 2021 07:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181543.328701; Wed, 08 Sep 2021 07:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNs6I-0004u5-MG; Wed, 08 Sep 2021 07:34:30 +0000
Received: by outflank-mailman (input) for mailman id 181543;
 Wed, 08 Sep 2021 07:34:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GobK=N6=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mNs6H-0004tz-AA
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 07:34:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.81]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31fdb5b4-1077-11ec-b147-12813bfff9fa;
 Wed, 08 Sep 2021 07:34:27 +0000 (UTC)
Received: from AM6P191CA0072.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::49)
 by GV1PR08MB7314.eurprd08.prod.outlook.com (2603:10a6:150:1d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25; Wed, 8 Sep
 2021 07:34:18 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::b6) by AM6P191CA0072.outlook.office365.com
 (2603:10a6:209:7f::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 07:34:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 8 Sep 2021 07:34:18 +0000
Received: ("Tessian outbound 0ec886cb54dd:v105");
 Wed, 08 Sep 2021 07:34:17 +0000
Received: from e0baeef2aed7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 85FF79B3-9BA3-4458-AEF8-EC0CB6DB9A29.1; 
 Wed, 08 Sep 2021 07:34:08 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e0baeef2aed7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Sep 2021 07:34:08 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB6281.eurprd08.prod.outlook.com (2603:10a6:10:1f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Wed, 8 Sep
 2021 07:34:05 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4478.025; Wed, 8 Sep 2021
 07:34:05 +0000
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
X-Inumbo-ID: 31fdb5b4-1077-11ec-b147-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Z+hSZ9cAhQo5fyXkwP2E3uRS7GHreh4U+7Gx87EBjs=;
 b=2BOFqqVmTJNw0HYG2y+nk+x7tus10L5yedUbvS7Iyla+tade+y1M4TPr+9jYyhFEt/PpBTUPKKAgOhCyqMnrfoP8hW23dK02ANgbZmb0LZYVa+pLLsobfdrEEo45Vvh++I8lKeWrmgN6nz9VspbsLi0KudX8QgG7gr6kLwoIksA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSmxRL6x+q0cZxShWhZZ3qnp+XpEh6YPSINKOBd+6Szccvfs3HWHffP+h/z0QV1D1HBUHhM7P50a1SJOhQ3UdOxqaYk9urOZu3pqH9WSkWcb/bUgTnyoQtNQ/IBEyCiq8F/9NwUwIuf3zZ+EwoJJ+7u3SY2JEydo5YsElYUNhxSdZio2XGMjRTYbIYEsPZiI6TGRXmulxeMjgiiOwY9FUHwFmxEExaT7dpXSRlmYu6fqpnJIliqYeaRDer+A/Q5HWTSlWSRo1jpIpjMjk41BrO0CEeuy+kZtCGBTMvaQeBjGU2yuPqOGnLs8LWcHrQBEJ3dKLl8yR8XjjCRLuJNVdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=3Z+hSZ9cAhQo5fyXkwP2E3uRS7GHreh4U+7Gx87EBjs=;
 b=HKsK2fVoX30nujNdv6rfMgMAZpRd7mwaoClPT1cXVVms3N1B9CE5jRjZ/fuVVdWwlyGjaMu9S4wjOB78Uzu6M/PLA825nOFGtPf7jxVa51HfbE/N8Nlq7f906lqmmMOBBEFOYWEto1jH4KkoHhbq4L1J+dwO10qO1sHdA25knqo77WR/+4pBahzfcsvN8/cfUqQDz74JC9jRcSkf1JoKaU+xqL++h51nMFZdPRBHCe6Bjam9OGqu2ftxGIWtWkD3UYAAhF9P67Vh867xUzjwm9ImAjnRs1eIlLAtCeckMYXGxcRq7g5F9OxbK5DG/dZSCCPQ5NZtKvIV1fEXW1m0OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Z+hSZ9cAhQo5fyXkwP2E3uRS7GHreh4U+7Gx87EBjs=;
 b=2BOFqqVmTJNw0HYG2y+nk+x7tus10L5yedUbvS7Iyla+tade+y1M4TPr+9jYyhFEt/PpBTUPKKAgOhCyqMnrfoP8hW23dK02ANgbZmb0LZYVa+pLLsobfdrEEo45Vvh++I8lKeWrmgN6nz9VspbsLi0KudX8QgG7gr6kLwoIksA=
From: Wei Chen <Wei.Chen@arm.com>
To: Wei Chen <Wei.Chen@arm.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>
Subject: RE: [XEN RFC PATCH 23/40] xen/arm: introduce a helper to parse device
 tree memory node
Thread-Topic: [XEN RFC PATCH 23/40] xen/arm: introduce a helper to parse
 device tree memory node
Thread-Index: AQHXjps6uVXfLZKD7EKSvvhEptOzS6uINJ4AgAAs9PCAAHGGgIAAOFuQgBDWjrA=
Date: Wed, 8 Sep 2021 07:34:04 +0000
Message-ID:
 <DB9PR08MB68572B980E3E688F3E946C329ED49@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-24-wei.chen@arm.com>
 <alpine.DEB.2.21.2108271757250.17851@sstabellini-ThinkPad-T480s>
 <DB9PR08MB6857618112DC045293A449699EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <5c9a196a-8ac3-1173-f402-01d99ccc23e4@xen.org>
 <AS8PR08MB68531741D1035B35A19EF34F9EC99@AS8PR08MB6853.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB68531741D1035B35A19EF34F9EC99@AS8PR08MB6853.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B42AF9527E707E4F828EBE67411CFEAB.0
x-checkrecipientchecked: true
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c9698f87-b599-4132-5fc8-08d9729b1154
x-ms-traffictypediagnostic: DBBPR08MB6281:|GV1PR08MB7314:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<GV1PR08MB73142CD81206F45972F4CF499ED49@GV1PR08MB7314.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 U/DkNesgfc40VW7sjTPexyjjxeOVhyVtJwcu4O1SQV8iNfs+5ySPIUCtY5SpirDjMI1f3znBODsat65VCmeIoSP7/jRId6hWgx5IWiKw7txeZo6GPvcXNgyPZGswSAPz6qbf0+MtVu/I7AD0lBBOJ6RvmSrCnJKBsqyLC/NSQM93T0mUrEMztX5NYsmj84QxMDCxIfhCeRoRZkyAOePkwN7H+KrZvVDShS1KLGnKRKgtD6f5Goo1jgIAXIQ1sVu1+GzSQaQhLnx5BsCDChjw2sZdlNTYaxoHHj4QnH8sTieOlqp36XC29dZQTENvZyayGRfMHxFqYMxLwlxPN8bpyg+CcHUB6r/D/1xlxg+ua4vOvAeHhtwDfpHPrYp9Ebin14RoajlX2lidVkbN0GKxJCXajlX69epR8c3gSpuGHOAKBcYWU7eoP6reWHJ/vAmN/6wWd3am9fIS391ATtnMZN8V9PAjFuiZJxU0jCzLEOvjpCArFGNPlKoOgyJDPpsXtNq4obzgMaCmg0t5xCl/2bAkKK9PAHjQ5xxWBzq6d2ajiqXZron+HlNdqiXjlRdvKmy1kAjf/UyYPx9WAKPQYSGgVq02J3CQpKBKvhXOXxlBVPhV2SYPeCaXuJ2V7T1NyeF57VmGjHPNm+WajLFtFxONByq+BKqnpn45J0z25Jx+ZyVrISrQSQUcEtk/UQVpM2DEH1w0+/ZYaXpA/RF8W0zwsxm//s0dFNXEXm3AJY3zB7ylZYDpR6/dzK+yfCfnAVYuznhavO26drP5031EvxaIJfyHRcXklU6wtlBwWZ9RQGybpPqiOJVH+CrPYEcM8XRMf6XYR6VJ065oAq2D7Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(86362001)(2906002)(110136005)(316002)(5660300002)(9686003)(4326008)(55016002)(54906003)(33656002)(38070700005)(71200400001)(966005)(53546011)(6506007)(52536014)(186003)(66946007)(66446008)(66556008)(66476007)(64756008)(76116006)(8936002)(83380400001)(478600001)(26005)(8676002)(38100700002)(122000001)(7696005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6281
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b6b65d38-cc08-4940-3c67-08d9729b093c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u3fd9pt+5wWhVfuSJ/JSKWcjID+5fgu8Dk4BZOMbIsskenmu3h9RNuWNhonZP1BaTeEL2sHgqVZrpK8i6IsvJGnuNZ+xzl2Kd5KQGLjSGpyNPm0W5b5cVUp4wpNFw9mSn7jq3G0jsi8/aGx2775HS1lrlfhx6nY9p+wQ/xW2GX+uIyhSuVf89+Miqkbm8miIuwVc/drpyCUCfQ5IUOQ7CJ9s/w0y9y5+V+npY0DNJSBdpt+IhJo8LR/FgM9SObdEFE4a91AhxEYZVaBXhDTSOyfaa1ZJAPqRZ/Rfm38HAh9Za/WN1YIYSLvtT8a4wMauR2pHSSydijHTL4mpkrKjCu6n55oY+c5w+Ofsm6vTSQHZd2+xsg72sIg+ytE5UovbSO5Sj3RitYkUIjhWaoEm8sNqOxPUzoQSasJXju/CwdHopoO3P8E6qzWNGJDmuuynIxWWA9pFLke74WkUvERccFxBzY5hQe4zqAhI43FaZqVCAsIcbKd/N361wVFB6+HgdwX1kssxK1mON8Jlw3uXEeM1wREDBdFkVjWs5ty7Jt9Fl10RwUIT+NVjhQIzbDZWT/iF45+rsZkJ3GKzGWVDI0H80DUBx05elB7BZR8YbL9J5jBuS3gS+DauUSeFpBaAq9XZhlz7K1OSIF9L2kGEfy2HCzBqxDUAoHoZokVBmsYQJVXKJv8UwyfG4vg4G6MLT9Yxqsbkx8yXaCMWgOciy/jfZZbAhDbaY0HjxtsbbGnfpZp4iPkH6Xe4pFleiUilMlCs0GMzqrWBebMXcLgpG+QvZVfca/MUAsb/yeOOox68w802HBrf4VSH3A1j9Z3I7H7pW4T/ZeEu3M6NTrY6mg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966006)(36840700001)(52536014)(7696005)(336012)(9686003)(8936002)(54906003)(107886003)(82740400003)(186003)(966005)(26005)(33656002)(86362001)(55016002)(6506007)(5660300002)(478600001)(53546011)(8676002)(2906002)(47076005)(356005)(70206006)(70586007)(82310400003)(36860700001)(316002)(83380400001)(81166007)(110136005)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 07:34:18.3466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9698f87-b599-4132-5fc8-08d9729b1154
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7314

SGkgSnVsaWVuLCBTdGVmYW5vLCBKYW4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3Jn
PiBPbiBCZWhhbGYgT2YgV2VpDQo+IENoZW4NCj4gU2VudDogMjAyMeW5tDjmnIgyOOaXpSAyMTo1
OA0KPiBUbzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFN0ZWZhbm8gU3RhYmVsbGlu
aQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsgQmVydHJhbmQgTWFycXVpcw0KPiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29t
PjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTdWJqZWN0OiBSRTogW1hFTiBS
RkMgUEFUQ0ggMjMvNDBdIHhlbi9hcm06IGludHJvZHVjZSBhIGhlbHBlciB0byBwYXJzZQ0KPiBk
ZXZpY2UgdHJlZSBtZW1vcnkgbm9kZQ0KPiANCj4gSGkgSnVsaWVuLA0KPiANCj4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+DQo+ID4gU2VudDogMjAyMeW5tDjmnIgyOOaXpSAxODozNA0KPiA+IFRvOiBXZWkgQ2hlbiA8
V2VpLkNoZW5AYXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA+IDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPg0KPiA+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEJlcnRy
YW5kIE1hcnF1aXMNCj4gPiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+IFN1YmplY3Q6IFJlOiBbWEVOIFJGQyBQQVRDSCAyMy80
MF0geGVuL2FybTogaW50cm9kdWNlIGEgaGVscGVyIHRvIHBhcnNlDQo+ID4gZGV2aWNlIHRyZWUg
bWVtb3J5IG5vZGUNCj4gPg0KPiA+IEhpIFdlaSwNCj4gPg0KPiA+IE9uIDI4LzA4LzIwMjEgMDQ6
NTYsIFdlaSBDaGVuIHdyb3RlOg0KPiA+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4gPj4gRnJvbTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0K
PiA+ID4+IFNlbnQ6IDIwMjHvv73vv70477+977+9Mjjvv73vv70gOTowNg0KPiA+ID4+IFRvOiBX
ZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gPiA+PiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOw0KPiA+IGp1bGllbkB4ZW4ub3Jn
Ow0KPiA+ID4+IGpiZXVsaWNoQHN1c2UuY29tOyBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5N
YXJxdWlzQGFybS5jb20+DQo+ID4gPj4gU3ViamVjdDogUmU6IFtYRU4gUkZDIFBBVENIIDIzLzQw
XSB4ZW4vYXJtOiBpbnRyb2R1Y2UgYSBoZWxwZXIgdG8NCj4gcGFyc2UNCj4gPiA+PiBkZXZpY2Ug
dHJlZSBtZW1vcnkgbm9kZQ0KPiA+ID4+DQo+ID4gPj4gT24gV2VkLCAxMSBBdWcgMjAyMSwgV2Vp
IENoZW4gd3JvdGU6DQo+ID4gPj4+IE1lbW9yeSBibG9ja3MnIE5VTUEgSUQgaW5mb3JtYXRpb24g
aXMgc3RvcmVkIGluIGRldmljZSB0cmVlJ3MNCj4gPiA+Pj4gbWVtb3J5IG5vZGVzIGFzICJudW1h
LW5vZGUtaWQiLiBXZSBuZWVkIGEgbmV3IGhlbHBlciB0byBwYXJzZQ0KPiA+ID4+PiBhbmQgdmVy
aWZ5IHRoaXMgSUQgZnJvbSBtZW1vcnkgbm9kZXMuDQo+ID4gPj4+DQo+ID4gPj4+IEluIG9yZGVy
IHRvIHN1cHBvcnQgbWVtb3J5IGFmZmluaXR5IGluIGxhdGVyIHVzZSwgdGhlIHZhbGlkDQo+ID4g
Pj4+IG1lbW9yeSByYW5nZXMgYW5kIE5VTUEgSUQgd2lsbCBiZSBzYXZlZCB0byB0YWJsZXMuDQo+
ID4gPj4+DQo+ID4gPj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29t
Pg0KPiA+ID4+PiAtLS0NCj4gPiA+Pj4gICB4ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5j
IHwgMTMwDQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+Pj4gICAx
IGZpbGUgY2hhbmdlZCwgMTMwIGluc2VydGlvbnMoKykNCj4gPiA+Pj4NCj4gPiA+Pj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS9udW1hX2RldmljZV90cmVlLmMNCj4gPiA+PiBiL3hlbi9hcmNo
L2FybS9udW1hX2RldmljZV90cmVlLmMNCj4gPiA+Pj4gaW5kZXggMzdjYzU2YWNmMy4uYmJlMDgx
ZGNkMSAxMDA2NDQNCj4gPiA+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL251bWFfZGV2aWNlX3RyZWUu
Yw0KPiA+ID4+PiArKysgYi94ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jDQo+ID4gPj4+
IEBAIC0yMCwxMSArMjAsMTMgQEANCj4gPiA+Pj4gICAjaW5jbHVkZSA8eGVuL2luaXQuaD4NCj4g
PiA+Pj4gICAjaW5jbHVkZSA8eGVuL25vZGVtYXNrLmg+DQo+ID4gPj4+ICAgI2luY2x1ZGUgPHhl
bi9udW1hLmg+DQo+ID4gPj4+ICsjaW5jbHVkZSA8eGVuL2xpYmZkdC9saWJmZHQuaD4NCj4gPiA+
Pj4gICAjaW5jbHVkZSA8eGVuL2RldmljZV90cmVlLmg+DQo+ID4gPj4+ICAgI2luY2x1ZGUgPGFz
bS9zZXR1cC5oPg0KPiA+ID4+Pg0KPiA+ID4+PiAgIHM4IGRldmljZV90cmVlX251bWEgPSAwOw0K
PiA+ID4+PiAgIHN0YXRpYyBub2RlbWFza190IHByb2Nlc3Nvcl9ub2Rlc19wYXJzZWQgX19pbml0
ZGF0YTsNCj4gPiA+Pj4gK3N0YXRpYyBub2RlbWFza190IG1lbW9yeV9ub2Rlc19wYXJzZWQgX19p
bml0ZGF0YTsNCj4gPiA+Pj4NCj4gPiA+Pj4gICBzdGF0aWMgaW50IHNyYXRfZGlzYWJsZWQodm9p
ZCkNCj4gPiA+Pj4gICB7DQo+ID4gPj4+IEBAIC01NSw2ICs1Nyw3OSBAQCBzdGF0aWMgaW50IF9f
aW5pdA0KPiA+ID4+IGR0Yl9udW1hX3Byb2Nlc3Nvcl9hZmZpbml0eV9pbml0KG5vZGVpZF90IG5v
ZGUpDQo+ID4gPj4+ICAgICAgIHJldHVybiAwOw0KPiA+ID4+PiAgIH0NCj4gPiA+Pj4NCj4gPiA+
Pj4gKy8qIENhbGxiYWNrIGZvciBwYXJzaW5nIG9mIHRoZSBtZW1vcnkgcmVnaW9ucyBhZmZpbml0
eSAqLw0KPiA+ID4+PiArc3RhdGljIGludCBfX2luaXQgZHRiX251bWFfbWVtb3J5X2FmZmluaXR5
X2luaXQobm9kZWlkX3Qgbm9kZSwNCj4gPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFkZHJfdCBzdGFydCwgcGFkZHJfdCBzaXplKQ0KPiA+ID4+PiArew0KPiA+ID4+PiAr
ICAgIHN0cnVjdCBub2RlICpuZDsNCj4gPiA+Pj4gKyAgICBwYWRkcl90IGVuZDsNCj4gPiA+Pj4g
KyAgICBpbnQgaTsNCj4gPiA+Pj4gKw0KPiA+ID4+PiArICAgIGlmICggc3JhdF9kaXNhYmxlZCgp
ICkNCj4gPiA+Pj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gPj4+ICsNCj4gPiA+Pj4g
KyAgICBlbmQgPSBzdGFydCArIHNpemU7DQo+ID4gPj4+ICsgICAgaWYgKCBudW1fbm9kZV9tZW1i
bGtzID49IE5SX05PREVfTUVNQkxLUyApDQo+ID4gPj4+ICsgICAgew0KPiA+ID4+PiArICAgICAg
ICBkcHJpbnRrKFhFTkxPR19XQVJOSU5HLA0KPiA+ID4+PiArICAgICAgICAgICAgICAgICJUb28g
bWFueSBudW1hIGVudHJ5LCB0cnkgYmlnZ2VyIE5SX05PREVfTUVNQkxLUw0KPiBcbiIpOw0KPiA+
ID4+PiArICAgICAgICBiYWRfc3JhdCgpOw0KPiA+ID4+PiArICAgICAgICByZXR1cm4gLUVJTlZB
TDsNCj4gPiA+Pj4gKyAgICB9DQo+ID4gPj4+ICsNCj4gPiA+Pj4gKyAgICAvKiBJdCBpcyBmaW5l
IHRvIGFkZCB0aGlzIGFyZWEgdG8gdGhlIG5vZGVzIGRhdGEgaXQgd2lsbCBiZQ0KPiB1c2VkDQo+
ID4gPj4gbGF0ZXIgKi8NCj4gPiA+Pj4gKyAgICBpID0gY29uZmxpY3RpbmdfbWVtYmxrcyhzdGFy
dCwgZW5kKTsNCj4gPiA+Pj4gKyAgICAvKiBObyBjb25mbGljdGluZyBtZW1vcnkgYmxvY2ssIHdl
IGNhbiBzYXZlIGl0IGZvciBsYXRlciB1c2FnZQ0KPiAqLzsNCj4gPiA+Pj4gKyAgICBpZiAoIGkg
PCAwICkNCj4gPiA+Pj4gKyAgICAgICAgZ290byBzYXZlX21lbWJsazsNCj4gPiA+Pj4gKw0KPiA+
ID4+PiArICAgIGlmICggbWVtYmxrX25vZGVpZFtpXSA9PSBub2RlICkgew0KPiA+ID4+PiArICAg
ICAgICAvKg0KPiA+ID4+PiArICAgICAgICAgKiBPdmVybGFwcyB3aXRoIG90aGVyIG1lbWJsayBp
biB0aGUgc2FtZSBub2RlLCB3YXJuaW5nDQo+IGhlcmUuDQo+ID4gPj4+ICsgICAgICAgICAqIFRo
aXMgbWVtYmxrIHdpbGwgYmUgbWVyZ2VkIHdpdGggY29uZmxpY3RlZCBtZW1ibGsgbGF0ZXIuDQo+
ID4gPj4+ICsgICAgICAgICAqLw0KPiA+ID4+PiArICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5J
TkcNCj4gPiA+Pj4gKyAgICAgICAgICAgICAgICJEVDogTlVNQSBOT0RFICV1ICglIlBSSXg2NA0K
PiA+ID4+PiArICAgICAgICAgICAgICAgIi0lIlBSSXg2NCIpIG92ZXJsYXBzIHdpdGggaXRzZWxm
ICglIlBSSXg2NCItDQo+ID4gPj4gJSJQUkl4NjQiKVxuIiwNCj4gPiA+Pj4gKyAgICAgICAgICAg
ICAgIG5vZGUsIHN0YXJ0LCBlbmQsDQo+ID4gPj4+ICsgICAgICAgICAgICAgICBub2RlX21lbWJs
a19yYW5nZVtpXS5zdGFydCwNCj4gbm9kZV9tZW1ibGtfcmFuZ2VbaV0uZW5kKTsNCj4gPiA+Pj4g
KyAgICB9IGVsc2Ugew0KPiA+ID4+PiArICAgICAgICAvKg0KPiA+ID4+PiArICAgICAgICAgKiBD
b25mbGljdCB3aXRoIG1lbWJsayBpbiBvdGhlciBub2RlLCB0aGlzIGlzIGFuIGVycm9yLg0KPiA+
ID4+PiArICAgICAgICAgKiBUaGUgTlVNQSBpbmZvcm1hdGlvbiBpcyBpbnZhbGlkLCBOVU1BIHdp
bGwgYmUgdHVybiBvZmYuDQo+ID4gPj4+ICsgICAgICAgICAqLw0KPiA+ID4+PiArICAgICAgICBw
cmludGsoWEVOTE9HX0VSUg0KPiA+ID4+PiArICAgICAgICAgICAgICAgIkRUOiBOVU1BIE5PREUg
JXUgKCUiUFJJeDY0Ii0lIg0KPiA+ID4+PiArICAgICAgICAgICAgICAgUFJJeDY0Iikgb3Zlcmxh
cHMgd2l0aCBOT0RFICV1ICglIlBSSXg2NCItDQo+ID4gJSJQUkl4NjQiKVxuIiwNCj4gPiA+Pj4g
KyAgICAgICAgICAgICAgIG5vZGUsIHN0YXJ0LCBlbmQsIG1lbWJsa19ub2RlaWRbaV0sDQo+ID4g
Pj4+ICsgICAgICAgICAgICAgICBub2RlX21lbWJsa19yYW5nZVtpXS5zdGFydCwNCj4gbm9kZV9t
ZW1ibGtfcmFuZ2VbaV0uZW5kKTsNCj4gPiA+Pj4gKyAgICAgICAgYmFkX3NyYXQoKTsNCj4gPiA+
Pj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gPj4+ICsgICAgfQ0KPiA+ID4+PiArDQo+
ID4gPj4+ICtzYXZlX21lbWJsazoNCj4gPiA+Pj4gKyAgICBuZCA9ICZub2Rlc1tub2RlXTsNCj4g
PiA+Pj4gKyAgICBpZiAoICFub2RlX3Rlc3RfYW5kX3NldChub2RlLCBtZW1vcnlfbm9kZXNfcGFy
c2VkKSApIHsNCj4gPiA+Pj4gKyAgICAgICAgbmQtPnN0YXJ0ID0gc3RhcnQ7DQo+ID4gPj4+ICsg
ICAgICAgIG5kLT5lbmQgPSBlbmQ7DQo+ID4gPj4+ICsgICAgfSBlbHNlIHsNCj4gPiA+Pj4gKyAg
ICAgICAgaWYgKCBzdGFydCA8IG5kLT5zdGFydCApDQo+ID4gPj4+ICsgICAgICAgICAgICBuZC0+
c3RhcnQgPSBzdGFydDsNCj4gPiA+Pj4gKyAgICAgICAgaWYgKCBuZC0+ZW5kIDwgZW5kICkNCj4g
PiA+Pj4gKyAgICAgICAgICAgIG5kLT5lbmQgPSBlbmQ7DQo+ID4gPj4+ICsgICAgfQ0KPiA+ID4+
PiArDQo+ID4gPj4+ICsgICAgcHJpbnRrKFhFTkxPR19JTkZPICJEVDogTlVNQSBub2RlICV1ICUi
UFJJeDY0Ii0lIlBSSXg2NCJcbiIsDQo+ID4gPj4+ICsgICAgICAgICAgIG5vZGUsIHN0YXJ0LCBl
bmQpOw0KPiA+ID4+PiArDQo+ID4gPj4+ICsgICAgbm9kZV9tZW1ibGtfcmFuZ2VbbnVtX25vZGVf
bWVtYmxrc10uc3RhcnQgPSBzdGFydDsNCj4gPiA+Pj4gKyAgICBub2RlX21lbWJsa19yYW5nZVtu
dW1fbm9kZV9tZW1ibGtzXS5lbmQgPSBlbmQ7DQo+ID4gPj4+ICsgICAgbWVtYmxrX25vZGVpZFtu
dW1fbm9kZV9tZW1ibGtzXSA9IG5vZGU7DQo+ID4gPj4+ICsgICAgbnVtX25vZGVfbWVtYmxrcysr
Ow0KPiA+ID4+DQo+ID4gPj4NCj4gPiA+PiBJcyBpdCBwb3NzaWJsZSB0byBoYXZlIG5vbi1jb250
aWdvdXMgcmFuZ2VzIG9mIG1lbW9yeSBmb3IgYSBzaW5nbGUNCj4gTlVNQQ0KPiA+ID4+IG5vZGU/
DQo+ID4gPj4NCj4gPiA+PiBMb29raW5nIGF0IHRoZSBEVCBiaW5kaW5ncyBhbmQgTGludXggaW1w
bGVtZW50YXRpb24sIGl0IHNlZW1zDQo+IHBvc3NpYmxlLg0KPiA+ID4+IEhlcmUsIGl0IHNlZW1z
IHRoYXQgbm9kZV9tZW1ibGtfcmFuZ2UvbWVtYmxrX25vZGVpZCBjb3VsZCBoYW5kbGUgaXQsDQo+
ID4gPj4gYnV0IG5vZGVzIGNvdWxkbid0Lg0KPiA+ID4NCj4gPiA+IFllcywgeW91J3JlIHJpZ2h0
LiBJIGNvcGllZCB0aGlzIGNvZGUgZm9yIHg4NiBBQ1BJIE5VTUEuIERvZXMgQUNQSQ0KPiBhbGxv
dw0KPiA+ID4gbm9uLWNvbnRpZ3VvdXMgcmFuZ2VzIG9mIG1lbW9yeSBmb3IgYSBzaW5nbGUgTlVN
QSBub2RlIHRvbz8NCj4gPg0KPiA+IEkgY291bGRuJ3QgZmluZCBhbnkgcmVzdHJpY3Rpb24gZm9y
IEFDUEkuIEFsdGhvdWdoLCBJIG9ubHkgYnJpZWZseQ0KPiA+IGxvb2tlZCBhdCB0aGUgc3BlYy4N
Cj4gPg0KPiA+ID4gSWYgeWVzLCBJIHRoaW5rDQo+ID4gPiB0aGlzIHdpbGwgYWZmZWN0IHg4NiBB
Q1BJIE5VTUEgdG9vLiBJbiBuZXh0IHZlcnNpb24sIHdlIHBsYW4gdG8gbWVyZ2UNCj4gPiA+IGR0
Yl9udW1hX21lbW9yeV9hZmZpbml0eV9pbml0IGFuZCBhY3BpX251bWFfbWVtb3J5X2FmZmluaXR5
X2luaXQgaW50bw0KPiBhDQo+ID4gPiBuZXV0cmFsIGZ1bmN0aW9uLiBTbyB3ZSBjYW4gZml4IHRo
ZW0gYXQgdGhlIHNhbWUgdGltZS4NCj4gPiA+DQo+ID4gPiBJZiBub3QsIG1heWJlIHdlIGhhdmUg
dG8ga2VlcCB0aGUgZGl2ZXJzaXR5IGZvciBkdGIgYW5kIEFDUEkgaGVyZS4NCj4gPg0KPiA+IEkg
YW0gbm90IGVudGlyZWx5IHN1cmUgd2hhdCB5b3UgbWVhbi4gQXJlIHlvdSBzYXlpbmcgaWYgQUNQ
SSBkb2Vzbid0DQo+ID4gYWxsb3cgbm9uLWNvbnRpZ3VvdXMgcmFuZ2VzIG9mIG1lbW9yeSwgdGhl
biB3ZSBzaG91bGQga2VlcCB0aGUNCj4gPiBpbXBsZW1lbnRhdGlvbiBzZXBhcmF0ZWQ/DQo+ID4N
Cj4gPiBJZiBzbywgdGhlbiBJIGRpc2FncmVlIHdpdGggdGhhdC4gSXQgaXMgZmluZSB0byBoYXZl
IGNvZGUgdGhhdCBzdXBwb3J0cw0KPiA+IG1vcmUgdGhhbiB3aGF0IGEgZmlybXdhcmUgdGFibGUg
c3VwcG9ydHMuIFRoZSBtYWluIGJlbmVmaXQgaXMgbGVzcyBjb2RlDQo+ID4gYW5kIHRoZXJlZm9y
ZSBsZXNzIGxvbmcgdGVybSBtYWludGVuYW5jZSAod2l0aCB0aGUgY3VycmVudCBzb2x1dGlvbiB3
ZQ0KPiA+IHdvdWxkIG5lZWQgdG8gY2hlY2sgYm90aCB0aGUgQUNQSSBhbmQgRFQgaW1wbGVtZW50
YXRpb24gaWYgdGhlcmUgaXMgYQ0KPiA+IGJ1ZyBpbiBvbmUpLg0KPiA+DQo+IA0KPiBZZXMsIEkg
YWdyZWUuDQo+IA0KDQpJIGFtIGxvb2tpbmcgZm9yIHNvbWUgbWV0aG9kcyB0byBhZGRyZXNzIHRo
aXMgY29tbWVudC4gQ3VycmVudCAibm9kZXMiDQpoYXMgbm90IGNvbnNpZGVyZWQgdGhlIHNpdHVh
dGlvbiBvZiBtZW1vcnkgYWRkcmVzc2VzIG9mIGRpZmZlcmVudCBOVU1BDQpub2RlcyBjYW4gYmUg
aW50ZXJsZWF2ZWQuDQoNClRoaXMgY29kZSBleGlzdHMgaW4geDg2IE5VTUEgaW1wbGVtZW50YXRp
b24uIEkgdGhpbmsgaXQgbWF5IGJlIGJhc2VkIG9uDQpvbmUgZWFybHkgdmVyc2lvbiBvZiBMaW51
eCB4ODYgTlVNQSBpbXBsZW1lbnRhdGlvbi4gSW4gcmVjZW50IExpbnV4DQpjb2RlLCBib3RoIEFD
UEkvbnVtYS9zcmF0LmNbMV0gYW5kIHg4NiBOVU1BIGNvZGVbMl0gYXJlIG5vdCB1c2luZw0KIm5v
ZGVzIiB0byByZWNvcmQgTlVNQSBtZW1vcnkgYWRkcmVzcyBib3VuZGFyeS4gVGhleSBkb24ndCBk
ZXBlbmQNCm9uICJub2RlcyIgdG8gZG8gc2FuaXR5IGNoZWNrLg0KDQpUbyBmaXggaXQsIHdlJ2Qg
YmV0dGVyIHRvIHVwZ3JhZGUgdGhlIHg4NiBOVU1BIGRyaXZlci4gSXQgd2lsbCBtYWtlDQphIGdy
ZWF0IGFmZmVjdCBmb3IgWGVuLXg4Ni4gQW5kIEkgdGhpbmsgaXQgbWlnaHQgb3V0IG9mIHRoaXMg
c2VyaWVzDQpzY29wZS4gQ2FuIHdlIGNyZWF0ZSBhbm90aGVyIHRocmVhZCB0byBkaXNjdXNzIGFi
b3V0IGl0Pw0KDQpPciBjb3VsZCB5b3UgZ2l2ZSBtZSBzdWdnZXN0aW9ucyB0aGF0IHdlIGNhbiB1
c2Ugc29tZSBzaW1wbGUgd2F5cw0KdG8gZml4IGl0Pw0KDQpBbHNvLCBvbiBMaW51eCwgTlVNQSBp
bXBsZW1lbnRhdGlvbnMgZm9yIHg4NiBhcmUgZGlmZmVyZW50IGZyb20gQXJtNjQNCmFuZCBSSVND
LVYgaW1wbGVtZW50YXRpb25zLlszXQ0KDQpbMV0gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRz
L2xpbnV4L2Jsb2IvbWFzdGVyL2RyaXZlcnMvYWNwaS9udW1hL3NyYXQuYw0KWzJdIGh0dHBzOi8v
Z2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9hcmNoL3g4Ni9tbS9udW1hLmMN
ClszXSBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvZHJpdmVy
cy9iYXNlL2FyY2hfbnVtYS5jDQoNCj4gPiBDaGVlcnMsDQo+ID4NCj4gPiAtLQ0KPiA+IEp1bGll
biBHcmFsbA0K

