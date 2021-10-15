Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD5942EECF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 12:31:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210238.367015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKUm-00063n-Fk; Fri, 15 Oct 2021 10:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210238.367015; Fri, 15 Oct 2021 10:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKUm-000620-C0; Fri, 15 Oct 2021 10:31:24 +0000
Received: by outflank-mailman (input) for mailman id 210238;
 Fri, 15 Oct 2021 10:31:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mbKUl-00061u-7p
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:31:23 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::625])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec829e53-f65f-4f37-9af9-8ace4576edc5;
 Fri, 15 Oct 2021 10:31:22 +0000 (UTC)
Received: from DB3PR06CA0014.eurprd06.prod.outlook.com (2603:10a6:8:1::27) by
 AM0PR08MB3764.eurprd08.prod.outlook.com (2603:10a6:208:ff::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.24; Fri, 15 Oct 2021 10:31:19 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::a9) by DB3PR06CA0014.outlook.office365.com
 (2603:10a6:8:1::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 10:31:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 10:31:18 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Fri, 15 Oct 2021 10:31:18 +0000
Received: from 7e3cc61e7a8f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E942B3FE-F1FD-4428-9F0E-C4C7FAEEC4B8.1; 
 Fri, 15 Oct 2021 10:31:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7e3cc61e7a8f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 10:31:13 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB7PR08MB3561.eurprd08.prod.outlook.com (2603:10a6:10:42::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 10:31:11 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.031; Fri, 15 Oct 2021
 10:31:11 +0000
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
X-Inumbo-ID: ec829e53-f65f-4f37-9af9-8ace4576edc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIWSyGfbbxj4QSzA8fWcb9mpKcyMiqPrc5/Z1rq0sfo=;
 b=JV0lRAR9/RBGqoTEyhXwagOStUbKoxKzW1jU1olSJMBk7HSqwzhnrwVHxAsqejiRsube3eVGnATpFCa80/C4+09TIctHPHnYDQ256146UMSAdpqMwUSsiUStcs1qkL4Ls05Pp6xaG3jZh9CG4nJ1poghlAUo63NPIcxmMpWpYFo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b85bcb25d5ceae19
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fdg7L8nANXVFXbscVGgXsrX6ghKb23tMsGRqvfI3GWgNyQMRDPVjV6ZXPOEIovXEkuapj8/9jeOOa0ScsA1WFgkFQ293l8TTtCIyy5IJA8JXLVx2GJCwTG2nflIqck8UlGzFa2kAIudNpfjqm0UtktRBPgekt2hkEFC5iIUIBBw46ACl4zoAE1W5MZ0fWwtEpSdRTxPNj1hKvaqRHMHr7JRt4IZd7Co/aCpiOyn/Vhs5FUYdFVC5LF5P+iJp0X6XuXYIkyfrINIne94HIT2ZPEvLlR98dj01uoj/Q4UISzgMsNNHx6od+6Iyg3pWWL5SEjzxSi7cTddjGSuMnCC5Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIWSyGfbbxj4QSzA8fWcb9mpKcyMiqPrc5/Z1rq0sfo=;
 b=BgguVq6W2r/iYuWNkhvHSQgMAMHbRgN3y6E1vVrdZRLO5o7ph9D7SIecV+ubjmNCFmrSb56yp+5Cmx0t9tcVyP3TS9FbYA/OoUMjP+I5OS5xNL+ywXY1U8UgwFhDSCNytNCAcbYl7HG+6Cwzr8fgIKgLHq9zUceQnYQD9bCDWcm/b2qQrNiVGJc5Ut9I+rTsnWXhbr0CN2REHFc9+TbenYf5Ca5jDVr+OXiej6btzAUOTTSOaCyLMN6DKmCx582DMk/V/9AFcJeyXeIpE99KtacQjirRWoOjjTTquvohmb0qADGBfDvXFXR466UF5XTaWug2uVJkslaSHWz1XSKpaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIWSyGfbbxj4QSzA8fWcb9mpKcyMiqPrc5/Z1rq0sfo=;
 b=JV0lRAR9/RBGqoTEyhXwagOStUbKoxKzW1jU1olSJMBk7HSqwzhnrwVHxAsqejiRsube3eVGnATpFCa80/C4+09TIctHPHnYDQ256146UMSAdpqMwUSsiUStcs1qkL4Ls05Pp6xaG3jZh9CG4nJ1poghlAUo63NPIcxmMpWpYFo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index: AQHXwQrjS6mPrKT7Q06z3N66FcsDAKvTvGsAgAAWOICAAAekAIAAAy0A
Date: Fri, 15 Oct 2021 10:31:11 +0000
Message-ID: <59D40B50-EB18-40C3-ACCE-C727A4A7B1B6@arm.com>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
 <YWk8uP/YuSee1MfG@MacBook-Air-de-Roger.local>
 <CD9B29B0-31FD-4E09-93E3-7124C724BC23@arm.com>
 <YWlVxAPcuWVHtxsR@MacBook-Air-de-Roger.local>
In-Reply-To: <YWlVxAPcuWVHtxsR@MacBook-Air-de-Roger.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: befe4c0f-e0e8-4942-616e-08d98fc6ecdc
x-ms-traffictypediagnostic: DB7PR08MB3561:|AM0PR08MB3764:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB37649F9BD0C374DDBC57309A9DB99@AM0PR08MB3764.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 J76Sskwzc/TX1BxzcjSxQJEtymuFnmIqVWnYDib7W9WOqURrmU2c3Eh+ZxRxAM+6Ixe0cmK5nfAg5ws1skYUXHZo5LpWI1sR13sCvSaydIE4RrpACHGYKvJvvi6k33pkpUGi9Q7ds7ClhAbJiOY94GwB8gSJLGub9fGbRAjSV9Bor5FUYTHrWPg2rDM/t1OGojKOsS4ehZyN8wXTmfwOUnWDAbt7OpFAbYmB7WwBzre3BkvBZjD3GROCBp80mQqX3gK24Gi9mRp0lWhjBPy5WinRx+VtikESu2JBfrWJGLXBDw8J6mu6gPD38/jYq+LaBB+5tClcsoRRPW4uaz8VhtF5/tHYpN55E+EUyZjfjvAhDA2XFdLWB5dcaSTivrNYop6DadTrCuhm3lotKuRpX4XSaLwEGAkDz8/lp4c0i2L1tDjbtP+PTXHlvcmGs567jm/QhaXafR+gaBbvzwXsRgj7drycYwAZjIZiFLuGtnThbc+BCRuFcN4gBnM2tnIMq0/r0odmvG05dOuDSvsdXhfCxFkUzBb+RNbr7fZF1Mc9psFrFrq8Cjumoo2wIhp4a00ktoUeIxWE9gHD6e+fgO6Y0oVXj+nV6Hndi9dcErPNSq2ngrtPTelPgSCpvLiqrlT+f2WxmUSnB0IGmjbXXjERVPsWTSS+lbX+De1Vtu6buQm2zqhcG5yaedSgMYaE/653WrPmeVGB5292re/7w7pl0K4lk8I4qV9mGEkriCgfe/yTUXruDsocTQ2a0zlD
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(7416002)(6916009)(36756003)(6512007)(66946007)(66556008)(66476007)(38070700005)(64756008)(66446008)(186003)(122000001)(26005)(6486002)(86362001)(2906002)(76116006)(38100700002)(91956017)(5660300002)(54906003)(8676002)(53546011)(508600001)(316002)(83380400001)(6506007)(33656002)(2616005)(4326008)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2AC9878C6C0D4A45A110CD923B7B66E8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3561
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	62f761e8-7943-4090-0147-08d98fc6e856
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dxBhOH/qJGDo5XChKxzQ2mSDMJbj8/8slGmEiB971UF2BnaVaZVcPMDWnL4sqC7UGBSsinYxP+/jKtkyVrF00InzeEFaHHCyvd3RSmsu+gwlKqNTyxag8pwKpfq01jzfgmS004crbf8FPDFLoEORR1dDAODaEDt0i+NCDhnpsVjoDPzyjfXfEz9W23m2RU4wiTBxlmVwXatANMKb+bBOwYgUaHnZMydYib69XGTGX2H50MbgzrtEK7evSubE/RhzNt/7xPm6VUkP30ghlf7ftMaPN2yqxeGAK0uWAsky2LKM6mlwpuNHwIr3Xv3fY+3Vw2YZ0ER9En3DVS1KjnOlx7KsHTIkl6sSpdCgQaS7/smi6EDtGyGPaZhE9v34PeqQ9khx478ersQz8BHvvUnRidhnbNfPRO/W1Lws76A053XXKbdjl74KAzLtOKCuLJZSfOVYF1ec1TJ4eSrdXqE6l0c6DVv5zYS2IeIUqbGxU9QKDl2v1+TRsrU3HBz/Axctc70fZf6ETOmSCPeHAMkbyMVHoZiXPi/6hSfvJLxqsiYGRvfck3YDtL54UisMfcfqdMfkwcfqMNtU9mTZI9W/kT1vtf3sNaW+ovLCBe1HMCfGM/2FSe1z3VL3U2Z7dmU4ZRFTpbkckjHLKc7n4cKsXt5TblrWOnWQOMV1KbxGm9yrW/9i1t5hn94hPujuiuLU/US0LOwcMEjN9qtgNWFyMA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(82310400003)(2906002)(107886003)(336012)(70586007)(6862004)(8936002)(6506007)(6512007)(70206006)(356005)(47076005)(36860700001)(4326008)(5660300002)(36756003)(26005)(186003)(33656002)(81166007)(316002)(53546011)(86362001)(6486002)(508600001)(54906003)(8676002)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 10:31:18.9688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: befe4c0f-e0e8-4942-616e-08d98fc6ecdc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3764

SGksDQoNCj4gT24gMTUgT2N0IDIwMjEsIGF0IDExOjE5LCBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIE9jdCAxNSwgMjAyMSBhdCAw
OTo1MjoyOEFNICswMDAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gSGkgUm9nZXIsDQo+
PiANCj4+PiBPbiAxNSBPY3QgMjAyMSwgYXQgMDk6MzIsIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiBUaHUsIE9jdCAxNCwgMjAyMSBh
dCAwMzo0OTo1MFBNICswMTAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+PiBGcm9tOiBS
YWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4NCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMN
Cj4+Pj4gaW5kZXggM2FhOGMzMTc1Zi4uOGNjNTI5ZWNlYyAxMDA2NDQNCj4+Pj4gLS0tIGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvcGNpLmMNCj4+Pj4gQEAgLTY1OCw3ICs2NTgsNyBAQCBpbnQgcGNpX2FkZF9kZXZpY2Uo
dTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbiwNCj4+Pj4gICAgICAgICAgICAgICAgICAgY29uc3Qg
c3RydWN0IHBjaV9kZXZfaW5mbyAqaW5mbywgbm9kZWlkX3Qgbm9kZSkNCj4+Pj4gew0KPj4+PiAg
ICBzdHJ1Y3QgcGNpX3NlZyAqcHNlZzsNCj4+Pj4gLSAgICBzdHJ1Y3QgcGNpX2RldiAqcGRldjsN
Cj4+Pj4gKyAgICBzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IE5VTEw7DQo+Pj4+ICAgIHVuc2lnbmVk
IGludCBzbG90ID0gUENJX1NMT1QoZGV2Zm4pLCBmdW5jID0gUENJX0ZVTkMoZGV2Zm4pOw0KPj4+
PiAgICBjb25zdCBjaGFyICpwZGV2X3R5cGU7DQo+Pj4+ICAgIGludCByZXQ7DQo+Pj4+IEBAIC03
NTIsNiArNzUyLDE5IEBAIGludCBwY2lfYWRkX2RldmljZSh1MTYgc2VnLCB1OCBidXMsIHU4IGRl
dmZuLA0KPj4+PiANCj4+Pj4gICAgY2hlY2tfcGRldihwZGV2KTsNCj4+Pj4gDQo+Pj4+ICsjaWZk
ZWYgQ09ORklHX0FSTQ0KPj4+PiArICAgIC8qDQo+Pj4+ICsgICAgICogT24gQVJNIFBDSSBkZXZp
Y2VzIGRpc2NvdmVyeSB3aWxsIGJlIGRvbmUgYnkgRG9tMC4gQWRkIHZwY2kgaGFuZGxlciB3aGVu
DQo+Pj4+ICsgICAgICogRG9tMCBpbmZvcm0gWEVOIHRvIGFkZCB0aGUgUENJIGRldmljZXMgaW4g
WEVOLg0KPj4+PiArICAgICAqLw0KPj4+PiArICAgIHJldCA9IHZwY2lfYWRkX2hhbmRsZXJzKHBk
ZXYpOw0KPj4+PiArICAgIGlmICggcmV0ICkNCj4+Pj4gKyAgICB7DQo+Pj4+ICsgICAgICAgIHBy
aW50ayhYRU5MT0dfRVJSICJTZXR1cCBvZiB2UENJIGZhaWxlZDogJWRcbiIsIHJldCk7DQo+Pj4+
ICsgICAgICAgIGdvdG8gb3V0Ow0KPj4+PiArICAgIH0NCj4+Pj4gKyNlbmRpZg0KPj4+IA0KPj4+
IEkgdGhpbmsgdnBjaV9hZGRfaGFuZGxlcnMgc2hvdWxkIGJlIGNhbGxlZCBhZnRlciBjaGVja2lu
ZyB0aGF0DQo+Pj4gcGRldi0+ZG9tYWluIGlzICE9IE5VTEwsIHNvIEkgd291bGQgbW92ZSB0aGlz
IGNodW5rIGEgYml0IGJlbG93Lg0KPj4gDQo+PiBPbiBhcm0gdGhpcyB3b3VsZCBwcmV2ZW50IHRo
ZSBkb20wbGVzcyB1c2UgY2FzZSBvciB0byBoYXZlIHRoZSBQQ0kNCj4+IGJ1cyBlbnVtZXJhdGVk
IGZyb20gYW4gb3RoZXIgZG9tYWluLg0KPiANCj4gdnBjaV9hZGRfaGFuZGxlcnMgd2lsbCB0cnkg
dG8gYWNjZXNzIHBkZXYtPmRvbWFpbiwgc28gcGFzc2luZyBhIHBkZXYNCj4gd2l0aG91dCBkb21h
aW4gYmVpbmcgc2V0IGlzIHdyb25nLg0KDQpSaWdodCBhbmQgdGhlIGluaXRpYWwgY29tbWVudCBm
cm9tIFJhaHVsIGluIHRoZSBjb2RlIGlzIHNheWluZyBzby4NCkkgd2lsbCBtb3ZlIHRoZSBibG9j
ayBpbnNpZGUgdGhlIGlmLg0KDQo+IA0KPj4gQG9sZWtzYW5kcjogY2FuIHlvdSBjb21tZW50IG9u
IHRoaXMgb25lLCB5b3UgbWlnaHQgaGF2ZSBhIGJldHRlcg0KPj4gYW5zd2VyIHRoYW4gbWUgb24g
dGhpcyA/DQo+PiANCj4+PiANCj4+Pj4gKw0KPj4+PiAgICByZXQgPSAwOw0KPj4+PiAgICBpZiAo
ICFwZGV2LT5kb21haW4gKQ0KPj4+PiAgICB7DQo+Pj4+IEBAIC03ODQsNiArNzk3LDkgQEAgb3V0
Og0KPj4+PiAgICAgICAgICAgICAgICAgICAmUENJX1NCREYoc2VnLCBidXMsIHNsb3QsIGZ1bmMp
KTsNCj4+Pj4gICAgICAgIH0NCj4+Pj4gICAgfQ0KPj4+PiArICAgIGVsc2UgaWYgKCBwZGV2ICkN
Cj4+Pj4gKyAgICAgICAgcGNpX2NsZWFudXBfbXNpKHBkZXYpOw0KPj4+IA0KPj4+IEknbSBzbGln
aHRseSBsb3N0IGF0IHdoeSB5b3UgYWRkIHRoaXMgY2h1bmssIGlzIHRoaXMgc3RyaWN0bHkgcmVs
YXRlZA0KPj4+IHRvIHRoZSBwYXRjaD8NCj4+IA0KPj4gVGhpcyB3YXMgZGlzY3Vzc2VkIGEgbG90
IGluIHByZXZpb3VzIHZlcnNpb24gb2YgdGhlIHBhdGNoIGFuZA0KPj4gcmVxdWVzdGVkIGJ5IFN0
ZWZhbm8uIFRoZSBpZGVhIGhlcmUgaXMgdGhhdCBhcyBzb29uIGFzIGhhbmRsZXJzDQo+PiBhcmUg
YWRkZWQgc29tZSBiaXRzIG1pZ2h0IGJlIG1vZGlmaWVkIGluIHRoZSBQQ0kgY29uZmlnIHNwYWNl
DQo+PiBsZWFkaW5nIHBvc3NpYmx5IHRvIG1zaSBpbnRlcnJ1cHRzLiBTbyBpdCBpcyBzYWZlciB0
byBjbGVhbnVwIG9uIHRoZQ0KPj4gZXJyb3IgcGF0aC4gRm9yIHJlZmVyZW5jZXMgcGxlYXNlIHNl
ZSBkaXNjdXNzaW9uIG9uIHY0IGFuZCB2NSB3aGVyZQ0KPj4gdGhpcyB3YXMgYWN0dWFsbHkgYWRk
ZWQgKHRvIG11Y2ggcmVmZXJlbmNlcyBhcyB0aGUgZGlzY3Vzc2lvbiB3YXMNCj4+IGxvbmcgc28g
aGVyZSBbMV0gYW5kIFsyXSBhcmUgdGhlIHBhdGNod29yayB0aHJlYWQpLg0KPiANCj4gcGNpX2Fk
ZF9kZXZpY2UgYmVpbmcgc29sZWx5IHVzZWQgYnkgdHJ1c3RlZCBkb21haW5zLCBJIHRoaW5rIGl0
IHdvdWxkDQo+IGJlIGZpbmUgdG8gcmVxdWlyZSB0aGF0IHRoZSBkb21haW4gZG9lc24ndCBwb2tl
IHRoZSBQQ0kgY29uZmlnIHNwYWNlDQo+IHVudGlsIHRoZSBjYWxsIHRvIHBjaV9hZGRfZGV2aWNl
IGhhcyBmaW5pc2hlZC4gRWxzZSBpdCdzIGxpa2VseSB0byBnZXQNCj4gaW5jb25zaXN0ZW50IHJl
c3VsdHMsIG9yIG1lc3MgdXAgd2l0aCB0aGUgZGV2aWNlIHN0YXRlLg0KDQpBY2suDQoNCj4gDQo+
IEluIGFueSBjYXNlLCBzdWNoIGFkZGl0aW9uIG5lZWRzIHNvbWUga2luZCBvZiByZWFzb25pbmcg
YWRkZWQgdG8gdGhlDQo+IGNvbW1pdCBtZXNzYWdlIGlmIGl0J3MgcmVhbGx5IHJlcXVpcmVkLg0K
DQpXaXRoIHRoZSBjb2RlIG1vdmluZyBpbnNpZGUgdGhlIGZvbGxvd2luZyBlbHNlIGFuZCBwY2lf
Y2xlYW51cF9tc2kgYmVpbmcNCmVtcHR5IGZvciBub3cgb24gYXJtLCBJIHdpbGwgcmVtb3ZlIHRo
ZSBwY2lfY2xlYW51cF9tc2kgYXMgaXQgZG9lcyBub3QNCnJlbGF0ZWQgZGlyZWN0bHkgdG8gdGhp
cyBjaGFuZ2UgZm9yIG5vdyBhbmQgbWlnaHQgY2hhbmdlIHRoZSBiZWhhdmlvdXIgb24geDg2Lg0K
DQpJZiB0aGlzIGlzIG5lZWRlZCBhdCBzb21lIHBvaW50IGR1ZSB0byBhcm0sIHRoaXMgd2lsbCBi
ZSBkb25lIG9uY2UgbXNpIHN1cHBvcnQgd2lsbCBiZSBhZGRlZC4NCg0KUmVnYXJkcw0KQmVydHJh
bmQNCg0KPiANCj4gVGhhbmtzLCBSb2dlci4NCg0K

