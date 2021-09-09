Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029E6404418
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 05:55:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182574.330187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOB8o-0000C9-8M; Thu, 09 Sep 2021 03:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182574.330187; Thu, 09 Sep 2021 03:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOB8o-00008w-5N; Thu, 09 Sep 2021 03:54:22 +0000
Received: by outflank-mailman (input) for mailman id 182574;
 Thu, 09 Sep 2021 03:54:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/ytW=N7=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mOB8m-00008q-5S
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 03:54:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.46]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b09cd18-1121-11ec-b199-12813bfff9fa;
 Thu, 09 Sep 2021 03:54:17 +0000 (UTC)
Received: from DU2PR04CA0180.eurprd04.prod.outlook.com (2603:10a6:10:2b0::35)
 by DB6PR0802MB2311.eurprd08.prod.outlook.com (2603:10a6:4:87::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 03:54:16 +0000
Received: from DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::e) by DU2PR04CA0180.outlook.office365.com
 (2603:10a6:10:2b0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Thu, 9 Sep 2021 03:54:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT011.mail.protection.outlook.com (10.152.20.95) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 9 Sep 2021 03:54:15 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Thu, 09 Sep 2021 03:54:15 +0000
Received: from d037be74e984.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 04888784-824D-475B-A304-45662293B985.1; 
 Thu, 09 Sep 2021 03:54:10 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d037be74e984.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Sep 2021 03:54:10 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB8PR08MB5339.eurprd08.prod.outlook.com (2603:10a6:10:114::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Thu, 9 Sep
 2021 03:54:08 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4478.025; Thu, 9 Sep 2021
 03:54:08 +0000
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
X-Inumbo-ID: 9b09cd18-1121-11ec-b199-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8oybjAyomrzS4Eifsd/X85wSsOcjifh+5Oma4Ki+yg=;
 b=ccYRDVfF9A0DR0oeFXcEnMmH+FeJWHHTLP/t6li/tnywPlKAkoYgPUzWYmcE2vvelKZgZq157WZ1GCsi8Jldzo0EQDJlMyKbMxtbX4tNEfwvV2Y5P4QuMopMPeBynkVTTnP02JW35CMpaKSHJ8mIqIWvE7qZFKYBPPPdDNx1+U4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkmHvKqwZfh6bMkI8v44beoyuR9zEvzWbumigAVSi9VKSZ2KBU7NCJ/K/EZYqsptDi3oJCxAmlZyhcF3vLICh0NejGCfoVsKGUNtHwAsVWHLwOVbBqIdj6D8lYF9AWWszxukYXLu8H5Ky8gk8Dni3roiXYY/msAbeJXZ3hAf+bKHGtPx2mNDUzJGBM1b3gFieSBDdxrpKRA3NN4GN2Pm6GmhUh24Enr6RCthQh9ksIWnxaELGDUZcAQGb///F2JyldOgb6UWWjTWDfe41ycgLr62HDqx+72ydsgxQ0arwIA077bHmr7cIhDxHKw93uK9WjMMqL/f6v9P5lonsWOPvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=T8oybjAyomrzS4Eifsd/X85wSsOcjifh+5Oma4Ki+yg=;
 b=EyJj2WXnfamE+zzN1x+2gu52UMWo7BiPGHoquAlg0wc4mquH9Ph98svaGtMb7tsVwjEi8OmXIe+Ju7h2GaJiBCZXQ84Mdoahin+6pmr+Djzbm7WCbZJbcXSWBiAl0Zq+Se5E3/jP9lU22nmMWK/CbobtH153f4QFxDRuc2iw7sK0lcxc9KYzV/ne8aby+CLO/PXtS7Bk+1m+8+HwvhKQ3jqxe1rFfL6EV+Io3GKiyfhUvM2rCcvE3lLK4jIJSRxe0EFOb+jIfpuRqFmwMy/G7TPwxv8qF19lGrw5mQ22MW92188LKTGanTZ61ukMlZ8rkXgkIZ5+xY1h2yWuri42fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8oybjAyomrzS4Eifsd/X85wSsOcjifh+5Oma4Ki+yg=;
 b=ccYRDVfF9A0DR0oeFXcEnMmH+FeJWHHTLP/t6li/tnywPlKAkoYgPUzWYmcE2vvelKZgZq157WZ1GCsi8Jldzo0EQDJlMyKbMxtbX4tNEfwvV2Y5P4QuMopMPeBynkVTTnP02JW35CMpaKSHJ8mIqIWvE7qZFKYBPPPdDNx1+U4=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>
Subject: RE: [XEN RFC PATCH 23/40] xen/arm: introduce a helper to parse device
 tree memory node
Thread-Topic: [XEN RFC PATCH 23/40] xen/arm: introduce a helper to parse
 device tree memory node
Thread-Index:
 AQHXjps6uVXfLZKD7EKSvvhEptOzS6uINJ4AgAAs9PCAAHGGgIAAOFuQgBDWjrCAAQNtgIAAS/rA
Date: Thu, 9 Sep 2021 03:54:08 +0000
Message-ID:
 <DB9PR08MB6857B389B9B67FFE43C48C059ED59@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-24-wei.chen@arm.com>
 <alpine.DEB.2.21.2108271757250.17851@sstabellini-ThinkPad-T480s>
 <DB9PR08MB6857618112DC045293A449699EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <5c9a196a-8ac3-1173-f402-01d99ccc23e4@xen.org>
 <AS8PR08MB68531741D1035B35A19EF34F9EC99@AS8PR08MB6853.eurprd08.prod.outlook.com>
 <DB9PR08MB68572B980E3E688F3E946C329ED49@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109081458300.10523@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109081458300.10523@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 369D10C5F7DA6B468C6858BD0BBCA7DC.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 78f0b843-6e52-412f-5a30-08d973457e60
x-ms-traffictypediagnostic: DB8PR08MB5339:|DB6PR0802MB2311:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB231120E9CCA644D46F22B8979ED59@DB6PR0802MB2311.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HpfBWotXCbuOLWKUCqEsfPofsfIotW0JM8NewCwy71CxS/wOMF23NRIYkPPKajsInqdBeBACDl6cdpK1pABCkNHDOw3NhjjdyCWbZ+sVfEKekwKUJpVcTGOS2ewtptGDCsjYAEPrvBuXm1NrPPo4b1C5lp4rHPYwYwbgoCFr/YoqQTyLOAcsXgW/6G7cQ6opI7iOx2GHOUo2iPS+5Sqh54yqec+bZHnLEDYdWHQfMLAdASo2F6K9gAXBu+AP2r/4cKj3tDH1lojpH9UW4aSSNBRsyaNXMUe8vfmGv3QQ/XiW2TBfHAsxcHXuRrB6x1VtqGMmIOKKxz/OdW48VTeJx0DZ8kNYsPUFM3yjGXQvGeIzBV1lYoxaWRB9bDgP2wiCLGVowszWvnN2ycCb67un9fLps8R9b9FmWX2IQls4qUgeQqD21yeK9SBQvrxM+xQTV7XP6qmGFo2Yd9mQGNmPwG//J+6SKH3sOQhUddEzoV3cXXXeheh3+ef+R0To1CwG0VJI30++6NqyHDoCwkxUVnptCl3bIFp064/yIQlADtIpV/XHvXITa0x/ZqC/jeoSUYGLJ5mXrf+tSvkjvgs13gxuQU9N7Cu3nhZCZGSl+1GSyflNxwCjEH2eKZcu7z430F3LyICMcy3IgO872kCfe24RTIUr0knq3Xyjq9/wzJ+3C/bGIROL0ImfKfpwmJ2IiW10RBwftXUVDg6UWKlSOWLZ3NfGm0CKsdtcJ+Qahd4NBhMTN6gmrAsRvbMdJWgMd3uu094Z7JCBghbJohRs9a9wNZ0nDpo7RPT1J2KSR0pUdJfwn07OV3ZtFLWe87dwvcMEeGa/yms5+GezLteYCA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(33656002)(186003)(86362001)(7696005)(71200400001)(5660300002)(9686003)(122000001)(66476007)(38100700002)(26005)(76116006)(66946007)(6916009)(38070700005)(53546011)(316002)(2906002)(4326008)(8676002)(52536014)(66446008)(66556008)(64756008)(478600001)(83380400001)(55016002)(8936002)(6506007)(966005)(54906003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5339
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d287b816-f325-4212-c771-08d9734579ed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P5I644LU7xapFwFHyDLpHwokpOcmrFB+9epCGPqNi5RkqQQJWxU0yTVmYGqlUGQXYPqyYpootb/hMdOAhcvMAP6Ea6LSmpkmivje0hQHFVQgl6nzrL+73Xi9OgbusorZJJG+SnXoTUl9PdJwhaSk/RzSIY3aA4pFuV1zN7bNmvaBmpcVXFSIXVFU2fzzHyTXy4wAGIu7NX8+/wFHi8Q/J5bHT5NkH5mD7W3YzIu8sBwomGd7el7PwDo8tJ1qhMsWRvoLvMpGibNhbWPtQAz2KmXlDAcFUMNbi5psbEPnxBhIkR2lnXduXS5tTzbfpeKWA1+WALC/dHSfktK3hEO9faGDmEWRbO0fSDIpXtxdIfV+reeSC/QyXslv2NmRvgNgIaWqwi9ab249kivDcAy9UgcuO2oLepeFmpiccNLCwmcFaIMGGb7k3b0yW6w0cFeAH1+QWCu1vCSoZCFflrCx69FjoJz8Jy8Es7D/ZJ0yFQAbdf0LYbikCj4ShrtI1RMg6pf8Z76IhhOdQBlAX4MFnsfVULIsNbJNP7i3GncWKZdzbNFii5JUWa01q2VMeRC+BBZXf697pzACs7NrS06rOqVxp+oJBQDZ5po9CLY90E+qKyT6cHj3vw4UwdcPdvZKMhZXsu12ADXmEWNdsM+28uimbvobYLnidVWtD3HBx9Sm/Y/9DGZfXCZP1uk7jQZa0RpyEXii502tLkQyehsrURZAfE4arvtZlTlMiehzmQs9wLcFYDd40VC4mVlgwcfdXGe+7tXVRv/+sMyWHzCGb+YAo3YxZF9UKN7235F0qUPx9llROGyiRh+9shlv+U9yuR34LlpqIS0gOF+EZbrayw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(36840700001)(46966006)(26005)(8676002)(4326008)(83380400001)(966005)(8936002)(86362001)(33656002)(107886003)(186003)(36860700001)(81166007)(82740400003)(9686003)(55016002)(336012)(356005)(5660300002)(6862004)(47076005)(54906003)(478600001)(6506007)(52536014)(82310400003)(70206006)(316002)(7696005)(53546011)(70586007)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 03:54:15.9737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f0b843-6e52-412f-5a30-08d973457e60
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2311

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jnU
wjnI1SA2OjMyDQo+IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEJlcnRyYW5k
IE1hcnF1aXMNCj4gPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUkU6IFtYRU4gUkZDIFBBVENIIDIzLzQwXSB4ZW4v
YXJtOiBpbnRyb2R1Y2UgYSBoZWxwZXIgdG8gcGFyc2UNCj4gZGV2aWNlIHRyZWUgbWVtb3J5IG5v
ZGUNCj4gDQo+IE9uIFdlZCwgOCBTZXAgMjAyMSwgV2VpIENoZW4gd3JvdGU6DQo+ID4gPiA+ID4+
PiBAQCAtNTUsNiArNTcsNzkgQEAgc3RhdGljIGludCBfX2luaXQNCj4gPiA+ID4gPj4gZHRiX251
bWFfcHJvY2Vzc29yX2FmZmluaXR5X2luaXQobm9kZWlkX3Qgbm9kZSkNCj4gPiA+ID4gPj4+ICAg
ICAgIHJldHVybiAwOw0KPiA+ID4gPiA+Pj4gICB9DQo+ID4gPiA+ID4+Pg0KPiA+ID4gPiA+Pj4g
Ky8qIENhbGxiYWNrIGZvciBwYXJzaW5nIG9mIHRoZSBtZW1vcnkgcmVnaW9ucyBhZmZpbml0eSAq
Lw0KPiA+ID4gPiA+Pj4gK3N0YXRpYyBpbnQgX19pbml0IGR0Yl9udW1hX21lbW9yeV9hZmZpbml0
eV9pbml0KG5vZGVpZF90IG5vZGUsDQo+ID4gPiA+ID4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYWRkcl90IHN0YXJ0LCBwYWRkcl90IHNpemUpDQo+ID4gPiA+ID4+PiArew0K
PiA+ID4gPiA+Pj4gKyAgICBzdHJ1Y3Qgbm9kZSAqbmQ7DQo+ID4gPiA+ID4+PiArICAgIHBhZGRy
X3QgZW5kOw0KPiA+ID4gPiA+Pj4gKyAgICBpbnQgaTsNCj4gPiA+ID4gPj4+ICsNCj4gPiA+ID4g
Pj4+ICsgICAgaWYgKCBzcmF0X2Rpc2FibGVkKCkgKQ0KPiA+ID4gPiA+Pj4gKyAgICAgICAgcmV0
dXJuIC1FSU5WQUw7DQo+ID4gPiA+ID4+PiArDQo+ID4gPiA+ID4+PiArICAgIGVuZCA9IHN0YXJ0
ICsgc2l6ZTsNCj4gPiA+ID4gPj4+ICsgICAgaWYgKCBudW1fbm9kZV9tZW1ibGtzID49IE5SX05P
REVfTUVNQkxLUyApDQo+ID4gPiA+ID4+PiArICAgIHsNCj4gPiA+ID4gPj4+ICsgICAgICAgIGRw
cmludGsoWEVOTE9HX1dBUk5JTkcsDQo+ID4gPiA+ID4+PiArICAgICAgICAgICAgICAgICJUb28g
bWFueSBudW1hIGVudHJ5LCB0cnkgYmlnZ2VyDQo+IE5SX05PREVfTUVNQkxLUw0KPiA+ID4gXG4i
KTsNCj4gPiA+ID4gPj4+ICsgICAgICAgIGJhZF9zcmF0KCk7DQo+ID4gPiA+ID4+PiArICAgICAg
ICByZXR1cm4gLUVJTlZBTDsNCj4gPiA+ID4gPj4+ICsgICAgfQ0KPiA+ID4gPiA+Pj4gKw0KPiA+
ID4gPiA+Pj4gKyAgICAvKiBJdCBpcyBmaW5lIHRvIGFkZCB0aGlzIGFyZWEgdG8gdGhlIG5vZGVz
IGRhdGEgaXQgd2lsbCBiZQ0KPiA+ID4gdXNlZA0KPiA+ID4gPiA+PiBsYXRlciAqLw0KPiA+ID4g
PiA+Pj4gKyAgICBpID0gY29uZmxpY3RpbmdfbWVtYmxrcyhzdGFydCwgZW5kKTsNCj4gPiA+ID4g
Pj4+ICsgICAgLyogTm8gY29uZmxpY3RpbmcgbWVtb3J5IGJsb2NrLCB3ZSBjYW4gc2F2ZSBpdCBm
b3IgbGF0ZXINCj4gdXNhZ2UNCj4gPiA+ICovOw0KPiA+ID4gPiA+Pj4gKyAgICBpZiAoIGkgPCAw
ICkNCj4gPiA+ID4gPj4+ICsgICAgICAgIGdvdG8gc2F2ZV9tZW1ibGs7DQo+ID4gPiA+ID4+PiAr
DQo+ID4gPiA+ID4+PiArICAgIGlmICggbWVtYmxrX25vZGVpZFtpXSA9PSBub2RlICkgew0KPiA+
ID4gPiA+Pj4gKyAgICAgICAgLyoNCj4gPiA+ID4gPj4+ICsgICAgICAgICAqIE92ZXJsYXBzIHdp
dGggb3RoZXIgbWVtYmxrIGluIHRoZSBzYW1lIG5vZGUsIHdhcm5pbmcNCj4gPiA+IGhlcmUuDQo+
ID4gPiA+ID4+PiArICAgICAgICAgKiBUaGlzIG1lbWJsayB3aWxsIGJlIG1lcmdlZCB3aXRoIGNv
bmZsaWN0ZWQgbWVtYmxrDQo+IGxhdGVyLg0KPiA+ID4gPiA+Pj4gKyAgICAgICAgICovDQo+ID4g
PiA+ID4+PiArICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcNCj4gPiA+ID4gPj4+ICsgICAg
ICAgICAgICAgICAiRFQ6IE5VTUEgTk9ERSAldSAoJSJQUkl4NjQNCj4gPiA+ID4gPj4+ICsgICAg
ICAgICAgICAgICAiLSUiUFJJeDY0Iikgb3ZlcmxhcHMgd2l0aCBpdHNlbGYgKCUiUFJJeDY0Ii0N
Cj4gPiA+ID4gPj4gJSJQUkl4NjQiKVxuIiwNCj4gPiA+ID4gPj4+ICsgICAgICAgICAgICAgICBu
b2RlLCBzdGFydCwgZW5kLA0KPiA+ID4gPiA+Pj4gKyAgICAgICAgICAgICAgIG5vZGVfbWVtYmxr
X3JhbmdlW2ldLnN0YXJ0LA0KPiA+ID4gbm9kZV9tZW1ibGtfcmFuZ2VbaV0uZW5kKTsNCj4gPiA+
ID4gPj4+ICsgICAgfSBlbHNlIHsNCj4gPiA+ID4gPj4+ICsgICAgICAgIC8qDQo+ID4gPiA+ID4+
PiArICAgICAgICAgKiBDb25mbGljdCB3aXRoIG1lbWJsayBpbiBvdGhlciBub2RlLCB0aGlzIGlz
IGFuIGVycm9yLg0KPiA+ID4gPiA+Pj4gKyAgICAgICAgICogVGhlIE5VTUEgaW5mb3JtYXRpb24g
aXMgaW52YWxpZCwgTlVNQSB3aWxsIGJlIHR1cm4NCj4gb2ZmLg0KPiA+ID4gPiA+Pj4gKyAgICAg
ICAgICovDQo+ID4gPiA+ID4+PiArICAgICAgICBwcmludGsoWEVOTE9HX0VSUg0KPiA+ID4gPiA+
Pj4gKyAgICAgICAgICAgICAgICJEVDogTlVNQSBOT0RFICV1ICglIlBSSXg2NCItJSINCj4gPiA+
ID4gPj4+ICsgICAgICAgICAgICAgICBQUkl4NjQiKSBvdmVybGFwcyB3aXRoIE5PREUgJXUgKCUi
UFJJeDY0Ii0NCj4gPiA+ID4gJSJQUkl4NjQiKVxuIiwNCj4gPiA+ID4gPj4+ICsgICAgICAgICAg
ICAgICBub2RlLCBzdGFydCwgZW5kLCBtZW1ibGtfbm9kZWlkW2ldLA0KPiA+ID4gPiA+Pj4gKyAg
ICAgICAgICAgICAgIG5vZGVfbWVtYmxrX3JhbmdlW2ldLnN0YXJ0LA0KPiA+ID4gbm9kZV9tZW1i
bGtfcmFuZ2VbaV0uZW5kKTsNCj4gPiA+ID4gPj4+ICsgICAgICAgIGJhZF9zcmF0KCk7DQo+ID4g
PiA+ID4+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiA+ID4gPj4+ICsgICAgfQ0KPiA+
ID4gPiA+Pj4gKw0KPiA+ID4gPiA+Pj4gK3NhdmVfbWVtYmxrOg0KPiA+ID4gPiA+Pj4gKyAgICBu
ZCA9ICZub2Rlc1tub2RlXTsNCj4gPiA+ID4gPj4+ICsgICAgaWYgKCAhbm9kZV90ZXN0X2FuZF9z
ZXQobm9kZSwgbWVtb3J5X25vZGVzX3BhcnNlZCkgKSB7DQo+ID4gPiA+ID4+PiArICAgICAgICBu
ZC0+c3RhcnQgPSBzdGFydDsNCj4gPiA+ID4gPj4+ICsgICAgICAgIG5kLT5lbmQgPSBlbmQ7DQo+
ID4gPiA+ID4+PiArICAgIH0gZWxzZSB7DQo+ID4gPiA+ID4+PiArICAgICAgICBpZiAoIHN0YXJ0
IDwgbmQtPnN0YXJ0ICkNCj4gPiA+ID4gPj4+ICsgICAgICAgICAgICBuZC0+c3RhcnQgPSBzdGFy
dDsNCj4gPiA+ID4gPj4+ICsgICAgICAgIGlmICggbmQtPmVuZCA8IGVuZCApDQo+ID4gPiA+ID4+
PiArICAgICAgICAgICAgbmQtPmVuZCA9IGVuZDsNCj4gPiA+ID4gPj4+ICsgICAgfQ0KPiA+ID4g
PiA+Pj4gKw0KPiA+ID4gPiA+Pj4gKyAgICBwcmludGsoWEVOTE9HX0lORk8gIkRUOiBOVU1BIG5v
ZGUgJXUgJSJQUkl4NjQiLSUiUFJJeDY0IlxuIiwNCj4gPiA+ID4gPj4+ICsgICAgICAgICAgIG5v
ZGUsIHN0YXJ0LCBlbmQpOw0KPiA+ID4gPiA+Pj4gKw0KPiA+ID4gPiA+Pj4gKyAgICBub2RlX21l
bWJsa19yYW5nZVtudW1fbm9kZV9tZW1ibGtzXS5zdGFydCA9IHN0YXJ0Ow0KPiA+ID4gPiA+Pj4g
KyAgICBub2RlX21lbWJsa19yYW5nZVtudW1fbm9kZV9tZW1ibGtzXS5lbmQgPSBlbmQ7DQo+ID4g
PiA+ID4+PiArICAgIG1lbWJsa19ub2RlaWRbbnVtX25vZGVfbWVtYmxrc10gPSBub2RlOw0KPiA+
ID4gPiA+Pj4gKyAgICBudW1fbm9kZV9tZW1ibGtzKys7DQo+ID4gPiA+ID4+DQo+ID4gPiA+ID4+
DQo+ID4gPiA+ID4+IElzIGl0IHBvc3NpYmxlIHRvIGhhdmUgbm9uLWNvbnRpZ291cyByYW5nZXMg
b2YgbWVtb3J5IGZvciBhDQo+IHNpbmdsZQ0KPiA+ID4gTlVNQQ0KPiA+ID4gPiA+PiBub2RlPw0K
PiA+ID4gPiA+Pg0KPiA+ID4gPiA+PiBMb29raW5nIGF0IHRoZSBEVCBiaW5kaW5ncyBhbmQgTGlu
dXggaW1wbGVtZW50YXRpb24sIGl0IHNlZW1zDQo+ID4gPiBwb3NzaWJsZS4NCj4gPiA+ID4gPj4g
SGVyZSwgaXQgc2VlbXMgdGhhdCBub2RlX21lbWJsa19yYW5nZS9tZW1ibGtfbm9kZWlkIGNvdWxk
IGhhbmRsZQ0KPiBpdCwNCj4gPiA+ID4gPj4gYnV0IG5vZGVzIGNvdWxkbid0Lg0KPiA+ID4gPiA+
DQo+ID4gPiA+ID4gWWVzLCB5b3UncmUgcmlnaHQuIEkgY29waWVkIHRoaXMgY29kZSBmb3IgeDg2
IEFDUEkgTlVNQS4gRG9lcyBBQ1BJDQo+ID4gPiBhbGxvdw0KPiA+ID4gPiA+IG5vbi1jb250aWd1
b3VzIHJhbmdlcyBvZiBtZW1vcnkgZm9yIGEgc2luZ2xlIE5VTUEgbm9kZSB0b28/DQo+ID4gPiA+
DQo+ID4gPiA+IEkgY291bGRuJ3QgZmluZCBhbnkgcmVzdHJpY3Rpb24gZm9yIEFDUEkuIEFsdGhv
dWdoLCBJIG9ubHkgYnJpZWZseQ0KPiA+ID4gPiBsb29rZWQgYXQgdGhlIHNwZWMuDQo+ID4gPiA+
DQo+ID4gPiA+ID4gSWYgeWVzLCBJIHRoaW5rDQo+ID4gPiA+ID4gdGhpcyB3aWxsIGFmZmVjdCB4
ODYgQUNQSSBOVU1BIHRvby4gSW4gbmV4dCB2ZXJzaW9uLCB3ZSBwbGFuIHRvDQo+IG1lcmdlDQo+
ID4gPiA+ID4gZHRiX251bWFfbWVtb3J5X2FmZmluaXR5X2luaXQgYW5kIGFjcGlfbnVtYV9tZW1v
cnlfYWZmaW5pdHlfaW5pdA0KPiBpbnRvDQo+ID4gPiBhDQo+ID4gPiA+ID4gbmV1dHJhbCBmdW5j
dGlvbi4gU28gd2UgY2FuIGZpeCB0aGVtIGF0IHRoZSBzYW1lIHRpbWUuDQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiBJZiBub3QsIG1heWJlIHdlIGhhdmUgdG8ga2VlcCB0aGUgZGl2ZXJzaXR5IGZvciBk
dGIgYW5kIEFDUEkgaGVyZS4NCj4gPiA+ID4NCj4gPiA+ID4gSSBhbSBub3QgZW50aXJlbHkgc3Vy
ZSB3aGF0IHlvdSBtZWFuLiBBcmUgeW91IHNheWluZyBpZiBBQ1BJIGRvZXNuJ3QNCj4gPiA+ID4g
YWxsb3cgbm9uLWNvbnRpZ3VvdXMgcmFuZ2VzIG9mIG1lbW9yeSwgdGhlbiB3ZSBzaG91bGQga2Vl
cCB0aGUNCj4gPiA+ID4gaW1wbGVtZW50YXRpb24gc2VwYXJhdGVkPw0KPiA+ID4gPg0KPiA+ID4g
PiBJZiBzbywgdGhlbiBJIGRpc2FncmVlIHdpdGggdGhhdC4gSXQgaXMgZmluZSB0byBoYXZlIGNv
ZGUgdGhhdA0KPiBzdXBwb3J0cw0KPiA+ID4gPiBtb3JlIHRoYW4gd2hhdCBhIGZpcm13YXJlIHRh
YmxlIHN1cHBvcnRzLiBUaGUgbWFpbiBiZW5lZml0IGlzIGxlc3MNCj4gY29kZQ0KPiA+ID4gPiBh
bmQgdGhlcmVmb3JlIGxlc3MgbG9uZyB0ZXJtIG1haW50ZW5hbmNlICh3aXRoIHRoZSBjdXJyZW50
IHNvbHV0aW9uDQo+IHdlDQo+ID4gPiA+IHdvdWxkIG5lZWQgdG8gY2hlY2sgYm90aCB0aGUgQUNQ
SSBhbmQgRFQgaW1wbGVtZW50YXRpb24gaWYgdGhlcmUgaXMNCj4gYQ0KPiA+ID4gPiBidWcgaW4g
b25lKS4NCj4gPiA+ID4NCj4gPiA+DQo+ID4gPiBZZXMsIEkgYWdyZWUuDQo+ID4gPg0KPiA+DQo+
ID4gSSBhbSBsb29raW5nIGZvciBzb21lIG1ldGhvZHMgdG8gYWRkcmVzcyB0aGlzIGNvbW1lbnQu
IEN1cnJlbnQgIm5vZGVzIg0KPiA+IGhhcyBub3QgY29uc2lkZXJlZCB0aGUgc2l0dWF0aW9uIG9m
IG1lbW9yeSBhZGRyZXNzZXMgb2YgZGlmZmVyZW50IE5VTUENCj4gPiBub2RlcyBjYW4gYmUgaW50
ZXJsZWF2ZWQuDQo+ID4NCj4gPiBUaGlzIGNvZGUgZXhpc3RzIGluIHg4NiBOVU1BIGltcGxlbWVu
dGF0aW9uLiBJIHRoaW5rIGl0IG1heSBiZSBiYXNlZCBvbg0KPiA+IG9uZSBlYXJseSB2ZXJzaW9u
IG9mIExpbnV4IHg4NiBOVU1BIGltcGxlbWVudGF0aW9uLiBJbiByZWNlbnQgTGludXgNCj4gPiBj
b2RlLCBib3RoIEFDUEkvbnVtYS9zcmF0LmNbMV0gYW5kIHg4NiBOVU1BIGNvZGVbMl0gYXJlIG5v
dCB1c2luZw0KPiA+ICJub2RlcyIgdG8gcmVjb3JkIE5VTUEgbWVtb3J5IGFkZHJlc3MgYm91bmRh
cnkuIFRoZXkgZG9uJ3QgZGVwZW5kDQo+ID4gb24gIm5vZGVzIiB0byBkbyBzYW5pdHkgY2hlY2su
DQo+ID4NCj4gPiBUbyBmaXggaXQsIHdlJ2QgYmV0dGVyIHRvIHVwZ3JhZGUgdGhlIHg4NiBOVU1B
IGRyaXZlci4gSXQgd2lsbCBtYWtlDQo+ID4gYSBncmVhdCBhZmZlY3QgZm9yIFhlbi14ODYuIEFu
ZCBJIHRoaW5rIGl0IG1pZ2h0IG91dCBvZiB0aGlzIHNlcmllcw0KPiA+IHNjb3BlLiBDYW4gd2Ug
Y3JlYXRlIGFub3RoZXIgdGhyZWFkIHRvIGRpc2N1c3MgYWJvdXQgaXQ/DQo+ID4NCj4gPiBPciBj
b3VsZCB5b3UgZ2l2ZSBtZSBzdWdnZXN0aW9ucyB0aGF0IHdlIGNhbiB1c2Ugc29tZSBzaW1wbGUg
d2F5cw0KPiA+IHRvIGZpeCBpdD8NCj4gDQo+IEl0IGxvb2tzIGxpa2UgdGhhdCB3ZSB3b3VsZCBo
YXZlIHRvIHJlcGxhY2UgYWxsIHRoZSBub2RlLT5zdGFydCAvDQo+IG5vZGUtPmVuZCBjaGVja3Mg
d2l0aCBub2RlX21lbWJsa19yYW5nZSBjaGVja3MuIFRoZXJlIGFyZSBhIGZldyBvZiB0aGVtDQo+
IGluIHZhbGlkX251bWFfcmFuZ2UsIGNvbmZsaWN0aW5nX21lbWJsa3MsIGN1dG9mZl9ub2RlLA0K
PiBub2Rlc19jb3Zlcl9tZW1vcnkuIEl0IHdvdWxkbid0IGJlIHRyaXZpYWwuDQo+IA0KPiBBbHRo
b3VnaCBJIGRvIHRoaW5rIHRoYXQgbm9uLWNvbnRpZ3VvdXMgbWVtb3J5IGZvciBOVU1BIG5vZGVz
IGlzDQo+IGltcG9ydGFudCB0byBzdXBwb3J0LCB0aGUgcGF0Y2ggc2VyaWVzIGlzIGFscmVhZHkg
NDAgcGF0Y2hlcy4gSSBkb24ndA0KPiB0aGluayBpdCBpcyBhIGdvb2QgaWRlYSB0byBhZGQgb3Ro
ZXIgc2lnbmlmaWNhbnQgY2hhbmdlcyB0byBpdC4gSQ0KPiB3b3VsZG4ndCB1cGdyYWRlIHRoZSB4
ODYgTlVNQSBkcml2ZXIgbm93LiBJZiB3ZSBjYW4ndCBmaW5kIGEgYmV0dGVyIHdheSwNCj4gd2Ug
Y2FuIHByb2NlZWQgYXMgeW91IGFyZSBkb2luZyBpbiB0aGlzIHZlcnNpb24sIHdpdGggdGhlIGtu
b3duIGdhcCB0aGF0DQo+IHdlIGNhbid0IGRlYWwgd2l0aCBub24tY29udGlnaW91cyBtZW1vcnkg
Zm9yIE5VTUEgbm9kZXMsIGFuZCBmaXggaXQgd2l0aA0KPiBhIGZvbGxvdy11cCBzZXJpZXMgbGF0
ZXIuIEluIHRoYXQgY2FzZSB3ZSB3b3VsZCB3YW50IHRvIGhhdmUgYW4gZXhwbGljaXQNCj4gY2hl
Y2sgZm9yIG5vbi1jb250aWd1b3VzIG1lbW9yeSBmb3IgTlVNQSBub2RlcyBpbg0KPiBkdGJfbnVt
YV9tZW1vcnlfYWZmaW5pdHlfaW5pdCBhbmQgZXJyb3Igb3V0IGlmIGZvdW5kLg0KPiANCg0KWWVz
LCBJIHRoaW5rIHRoaXMgbWF5IGJlIGEgbW9yZSBhcHByb3ByaWF0ZSBtZXRob2QgYXQgcHJlc2Vu
dC4NCkkgd291bGQgYWRkIHNvbWUgY29kZSB0byBkbyBleHBsaWNpdCBjaGVjayBhbmQgZ2l2ZSB3
YXJuaW5nL2Vycm9yLg0KIA0KPiANCj4gPiBBbHNvLCBvbiBMaW51eCwgTlVNQSBpbXBsZW1lbnRh
dGlvbnMgZm9yIHg4NiBhcmUgZGlmZmVyZW50IGZyb20gQXJtNjQNCj4gPiBhbmQgUklTQy1WIGlt
cGxlbWVudGF0aW9ucy5bM10NCj4gPg0KPiA+IFsxXQ0KPiBodHRwczovL2dpdGh1Yi5jb20vdG9y
dmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvZHJpdmVycy9hY3BpL251bWEvc3JhdC5jDQo+ID4gWzJd
IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9hcmNoL3g4Ni9t
bS9udW1hLmMNCj4gPiBbM10NCj4gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Js
b2IvbWFzdGVyL2RyaXZlcnMvYmFzZS9hcmNoX251bWEuYw0KPiANCj4gDQo+IEluIGdlbmVyYWws
IEkgbGlrZSB0aGUgaWRlYSBvZiBzaGFyaW5nIGNvZGUgYXMgbXVjaCBhcyBwb3NzaWJsZSBiZXR3
ZWVuDQo+IGFyY2hpdGVjdHVyZXMgKHg4NiwgQVJNLCBldGMuKSBhbmQgYmV0d2VlbiBEVC9BQ1BJ
IGJlY2F1c2UgaXQgbWFrZXMgdGhlDQo+IGNvZGUgbWFpbnRhaW5hbmNlIGVhc2llciBhbmQgb25l
IG1pZ2h0IGV2ZW4gZ2FpbiBjZXJ0YWluIGZlYXR1cmVzIGZvcg0KPiBmcmVlLg0KPiANCj4gSG93
ZXZlciwgdGhlIGV4Y2VyY2lzZSBvZiBzaGFyaW5nIGNvZGUgc2hvdWxkbid0IHRha2Ugc2lnbmlm
aWNhbnQNCj4gYWRkaXRpb25hbCBlZmZvcnRzLiBJbiBmYWN0LCBpdCBzaG91bGQgZGVjcmVhc2Ug
dGhlIG92ZXJhbGwgZWZmb3J0Og0KPiBpbnN0ZWFkIG9mIHdyaXRpbmcgbmV3IGNvZGUgb25lIGp1
c3QgdGFrZSBleGlzdGluZyBjb2RlIGFuZCBtb3ZlIGl0IHRvDQo+IGNvbW1vbi4NCj4gDQo+IElu
IHRoaXMgaW5zdGFuY2UsIEkgdGhpbmsgaXQgd291bGQgYmUgZ29vZCB0byBiZSBhYmxlIHRvIHNo
YXJlIHRoZSBOVU1BDQo+IGluaXRpYWxpemF0aW9uIGNvZGUgYmV0d2VlbiB4ODYvQVJNIGFuZCBB
Q1BJL0RUIGlmIGl0IGRvZXNuJ3QgY2F1c2UNCj4gZXh0cmEgZWZmb3J0cy4NCj4gDQo+IEhlcmUg
dGhlIGV4dHJhIGVmZm9ydCB0aGF0IG15IHByZXZpb3VzIGNvbW1lbnQgbWlnaHQgY2F1c2UgZG9l
c24ndA0KPiBkZXJpdmUgZnJvbSB4ODYvQVJNIG9yIERUL0FDUEkgY29kZSBzaGFyaW5nLiBJdCBk
ZXJpdmVzIGZyb20gdGhlIGZhY3QNCj4gdGhhdCBvdXIgZXhpc3RpbmcgY29kZSBkb2Vzbid0IGRl
YWwgd2l0aCBub24tY29udGlnb3VzIG1lbW9yeSBmb3IgTlVNQQ0KPiBub2RlcyB1bmZvcnR1bmF0
ZWx5LiBUaGF0IGlzIHNvbWV0aGluZyB3ZSBuZWVkIHRvIGZpbmQgYSB3YXkgdG8gY29wZQ0KPiB3
aXRoIGFueXdheS4NCg0KWWVzLiBJIHBvc3RlZCBhYm92ZSBsaW5rcyBkaWRuJ3QgbWVhbiB0byBj
cmVhdGUgZGl2ZXJzaXR5IGZvciBBcm0veDg2Lg0KVGhvdWdoLCBJJ20gbm90IHN1cmUgZXhhY3Rs
eSB3aHkgTGludXggZG9lcyB0aGlzLiBCdXQgSSB0aGluayBmb3IgWGVuLA0Kd2Ugc3RpbGwgY2Fu
IHRyeSB0byBzaGFyZSBjb2RlIGZvciBBcm0veDg2IGFuZCBEVC9BQ1BJLg0KDQpDaGVlcnMsDQpX
ZWkgQ2hlbg0KDQo=

