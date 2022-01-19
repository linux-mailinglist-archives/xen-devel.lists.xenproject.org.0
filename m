Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D29C493648
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 09:25:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258756.446012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA6Go-0006Sh-Cn; Wed, 19 Jan 2022 08:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258756.446012; Wed, 19 Jan 2022 08:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA6Go-0006QW-8I; Wed, 19 Jan 2022 08:24:42 +0000
Received: by outflank-mailman (input) for mailman id 258756;
 Wed, 19 Jan 2022 08:24:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CaTf=SD=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nA6Gm-0006QQ-Ln
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 08:24:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dbaad90-7901-11ec-9bbc-9dff3e4ee8c5;
 Wed, 19 Jan 2022 09:24:38 +0100 (CET)
Received: from DB6PR0501CA0031.eurprd05.prod.outlook.com (2603:10a6:4:67::17)
 by HE1PR0802MB2217.eurprd08.prod.outlook.com (2603:10a6:3:c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 08:24:26 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::8e) by DB6PR0501CA0031.outlook.office365.com
 (2603:10a6:4:67::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Wed, 19 Jan 2022 08:24:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Wed, 19 Jan 2022 08:24:25 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Wed, 19 Jan 2022 08:24:25 +0000
Received: from 5894f04a59d0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 57931595-5B60-47F0-88EA-0F89CE9CB624.1; 
 Wed, 19 Jan 2022 08:24:15 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5894f04a59d0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Jan 2022 08:24:15 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DBBPR08MB6236.eurprd08.prod.outlook.com (2603:10a6:10:20c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 08:24:13 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%6]) with mapi id 15.20.4888.013; Wed, 19 Jan 2022
 08:24:13 +0000
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
X-Inumbo-ID: 3dbaad90-7901-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJPq4LA+48QB9n3yPWRQlfEKr37PxNYKSCHYHSgRDCk=;
 b=NsqqaWpTLLKZLnpxmCr3butyCu6gL3cQRrva2/aUhnTHtd8A3EKvaSupfXPxbHV0N9jgEZQPQAqQYqovJxlRkRALy3MaKh4rq/fb2sr/JEy+e+wQDyZJuYG18HcUOToQc5V8MDswMe8AOrvijAnFnGuNMDw+gwuJZJ9lXD/FASE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=erfniPX4O+Y+ayoV3I65hQNYcHL+P0FsfXqm/qRHIviFe7PpKn5n63duCapzP5bpY8CbegCG+gFcquD6m8oI/TGGei0ZwpHJyUxEfJoBnJwCBrYsd1MZFu01s6zGEi5NOQl8v0BMQF6ltb2dSfUgzjVjNkEF7UKhFnrE5uwJlZWGQms7ETeBkTXBzUXhO8BGK+at4Bv8Z+VRXizpynRFPX6s9np1f8nFM2RhcfUywckZgNYZFsgS4CrLfU/lsC2IdelA4j6/W2JETxTI0azCUr1nW1rgWgmJEmb8u7B+61x1YUyIHvxhVtMvPTcGhqSiy6WSzHbkIboy55bcJUtbzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJPq4LA+48QB9n3yPWRQlfEKr37PxNYKSCHYHSgRDCk=;
 b=c7AQRCMQEemMr+Z2Z+x9X09q7MFDiFMy3Yjbcn3o1d4mbPoUiCPAW4JiDbuyC0pUJrF6zJgz/sG+zDHmp81M7k140epK4ig4u+HEix7K0hqrIZ5Buho8MHFIj8/pXVOG3FFsVvVhj9nnFWamcHAciSeLmFII1iMvEO9/d5jtMn/RIDDhk9KII8TsE6Famke2RRcavrDYRhr5wiYuiiLAzLTT3/DaT7tkgDyIQOhRnN+KjT7xy5gO9RztoYqra2EvSfGZJOYZ6VPUrgkF/SyJdYTPrzQhLpMM54pM6B8CihddiOpnCSQAIlhyRdCLJ0zdDEiSfFiFiAwoHXJKIC9pWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJPq4LA+48QB9n3yPWRQlfEKr37PxNYKSCHYHSgRDCk=;
 b=NsqqaWpTLLKZLnpxmCr3butyCu6gL3cQRrva2/aUhnTHtd8A3EKvaSupfXPxbHV0N9jgEZQPQAqQYqovJxlRkRALy3MaKh4rq/fb2sr/JEy+e+wQDyZJuYG18HcUOToQc5V8MDswMe8AOrvijAnFnGuNMDw+gwuJZJ9lXD/FASE=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 08/37] xen/x86: add detection of discontinous node memory
 range
Thread-Topic: [PATCH 08/37] xen/x86: add detection of discontinous node memory
 range
Thread-Index: AQHXsHMRZjZ8eZQrbkW8SEq2x0f00Kxpq6IAgAD9ltCAAAtIAIAAA/Jg
Date: Wed, 19 Jan 2022 08:24:13 +0000
Message-ID:
 <PAXPR08MB742002F6C5AFF45266EDB6769E599@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-9-wei.chen@arm.com>
 <3fe681fa-d01f-d5df-23f2-6c6d8089fd8a@suse.com>
 <PAXPR08MB74209486B9983A392AB66E059E599@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <ee91673b-9bbf-c4fa-583d-a080f5f5426d@suse.com>
In-Reply-To: <ee91673b-9bbf-c4fa-583d-a080f5f5426d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3A34716C815B524AABBB099FCD307CD4.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 566986b1-03dd-495f-0fe8-08d9db251ad0
x-ms-traffictypediagnostic:
	DBBPR08MB6236:EE_|DB5EUR03FT031:EE_|HE1PR0802MB2217:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB22177E320DDDFA471DF073E09E599@HE1PR0802MB2217.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RY+sPsSt5hQMoJEGLSTYD838pK2mgco/Fg2cLZz7xt4l67qGQLQdZ48RgSZfRPp94iCTnxFshO0CXXZ/uDOg+nL85Lj0PyndmlheH5JYQu5eDjVys1z6hiI0w8E2I9fOBDCslmT8Wn7u5tLX3ZaGnJNnTvMBVl5fZB+ajlCZ+Eott3JE8R4owSBGFAkdiVBMZxfa7x6B8e+O5H+uYk75A8Sk5uf7U29C6GX/6Z3dh9VMJn5qF0yC9VU/btlNj618MBrbDhsKlIEhcERPk12Rs1lRbrcmWz0PL1Sso6hcmBj1Ttge6F8JD0rbsi6JAcQEXlf5g1dcQIEuqA80DmAj2pk5YrBwo1vBRuW8Es4RM3LWAb4fNztusAdcjx4TlODL/Fo5UAg4HlTspkW94r/oYjAt4esS3CVYyTZ8NjQjt2FHXuxDj3Od411ObV3ndECt/m697UD2AiAHSSFXq+JE+wVI5hDWj62r924g1D9ilmiaAlYkdzdLw1megiCstKL4PAY0AYxvD7b0rOPvEUB4VTCMMtGEtByPDeoCIo3aez/ZCgbmkoHV5VdT/cUuZjaAgmlJeZm00evoF2NNQVBu1LObcZF3jl1JJIktnk69LhR/TeVBvIPV9YtoJwVU5+JpMBq67dj8JoIHhiRffX1EOUnNHxwdeQl+L78zT/aA5UQFGmwoXPBS92WZxHCnQXCrKFFJjlxm7WN4eUJWkNNgzbL34CRnMilcYDQdXSZH2lsSq/JZkkV/yEn0K/Lae2lkw4+uNmkUt1KxGPooaYbrVPTV7zIq8uDETZyryEEzvKE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(9686003)(2906002)(5660300002)(38100700002)(52536014)(122000001)(6916009)(8936002)(6506007)(316002)(7696005)(66446008)(53546011)(83380400001)(76116006)(66476007)(66556008)(8676002)(966005)(186003)(66946007)(4326008)(38070700005)(26005)(33656002)(64756008)(55016003)(71200400001)(508600001)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6236
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	51a069e8-8b48-4578-0e5c-08d9db25133d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	etQq7YMlZQOxxOBkKv7R+MTEBWHVxqUIOvzeWc1tjrnvig4aSHw1psgUtEX/ZNF/zkgNe6JiFklzwEOcdtsPsMkznsqaAIB7Vnu9mKyWMnNlkb4vFHnH4nGg6GIQY9uPuzU88QTG1L3lRU/L/y9c0x33MonVwvBbTz8GqrxgEHCkbZdFffJQKE4zInQ5cPYoHmRrqCZU/UKyjYyfog49HoyPHSIumY6HBxhw3qz6EVCebKyvALaIovkTD11ss5TXgN+CcV/ikvZ1ZSLkYUyybWvLtbLxHRpIaKXTiB1gVZijiVD6GeIan5rZEJRq05J/Mib7FifflIVU0Y4aZ9T3eBsovFZCBnrFHIgXnGnoeVXsc4Q3sd0h1New+shP2NE/q4Z6C51j8ABXrIiu/3EryP7G2W1namOKikxMQMYSOlAIjARid87KFlqjw2H7b7rNeFSYuc5lmaSN4p9FBWwu6gzGQiO4+aXnDmJwDUGHMobCtQswb+p3qCKgLlM3RNju80VlJJHGgC2V/nFXapiax+SmNPe+oRV49llUDKAFNx+V0ZivgwDJOEt5RX0R8xSHueBdBXzDjrl4KzsWXuBalHe+8T0251RJFiZuL1YZVHZCiNxVCCZkxCyRu12hqLgLkZUuyDtcoHv1XLbbqz+q0JEUFXyUoupGmCWQX5fEH0h4a3ryCnE8NbBO1G71nzvvNGCS30DhB/xvIx8typZA9XcRDr0lpkQgmmEb7nJfiVTvsA8KFt4Ph5yaxWgqis3SoEV2sSxozqclQWCKQtR8rlHj1CNv0tj2PYc1/6KaBg3xt1arDqK0xWElcNzFIFoNGB+YiV3HnB6HQExvxKJRu3x0qnNa6nScbdLcF31tnyw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700002)(55016003)(82310400004)(36860700001)(40460700001)(47076005)(52536014)(86362001)(83380400001)(7696005)(508600001)(966005)(53546011)(6506007)(26005)(5660300002)(4326008)(336012)(81166007)(8936002)(8676002)(70206006)(70586007)(316002)(186003)(9686003)(6862004)(356005)(33656002)(2906002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 08:24:25.9595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 566986b1-03dd-495f-0fe8-08d9db251ad0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2217

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDHmnIgxOeaXpSAxNjowMQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDA4LzM3XSB4ZW4veDg2OiBhZGQgZGV0ZWN0aW9uIG9mIGRpc2NvbnRpbm91
cyBub2RlDQo+IG1lbW9yeSByYW5nZQ0KPiANCj4gT24gMTkuMDEuMjAyMiAwODozMywgV2VpIENo
ZW4gd3JvdGU6DQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4g
Pj4gU2VudDogMjAyMuW5tDHmnIgxOeaXpSAwOjEzDQo+ID4+DQo+ID4+IE9uIDIzLjA5LjIwMjEg
MTQ6MDIsIFdlaSBDaGVuIHdyb3RlOg0KPiA+Pj4gT25lIE5VTUEgbm9kZSBtYXkgY29udGFpbiBz
ZXZlcmFsIG1lbW9yeSBibG9ja3MuIEluIGN1cnJlbnQgWGVuDQo+ID4+PiBjb2RlLCBYZW4gd2ls
bCBtYWludGFpbiBhIG5vZGUgbWVtb3J5IHJhbmdlIGZvciBlYWNoIG5vZGUgdG8gY292ZXINCj4g
Pj4+IGFsbCBpdHMgbWVtb3J5IGJsb2Nrcy4gQnV0IGhlcmUgY29tZXMgdGhlIHByb2JsZW0sIGlu
IHRoZSBnYXAgb2YNCj4gPj4+IG9uZSBub2RlJ3MgdHdvIG1lbW9yeSBibG9ja3MsIGlmIHRoZXJl
IGFyZSBzb21lIG1lbW9yeSBibG9ja3MgZG9uJ3QNCj4gPj4+IGJlbG9uZyB0byB0aGlzIG5vZGUg
KHJlbW90ZSBtZW1vcnkgYmxvY2tzKS4gVGhpcyBub2RlJ3MgbWVtb3J5IHJhbmdlDQo+ID4+PiB3
aWxsIGJlIGV4cGFuZGVkIHRvIGNvdmVyIHRoZXNlIHJlbW90ZSBtZW1vcnkgYmxvY2tzLg0KPiA+
Pj4NCj4gPj4+IE9uZSBub2RlJ3MgbWVtb3J5IHJhbmdlIGNvbnRhaW5zIG90aGUgbm9kZXMnIG1l
bW9yeSwgdGhpcyBpcyBvYnZpb3VzbHkNCj4gPj4+IG5vdCB2ZXJ5IHJlYXNvbmFibGUuIFRoaXMg
bWVhbnMgY3VycmVudCBOVU1BIGNvZGUgb25seSBjYW4gc3VwcG9ydA0KPiA+Pj4gbm9kZSBoYXMg
Y29udGlub3VzIG1lbW9yeSBibG9ja3MuIEhvd2V2ZXIsIG9uIGEgcGh5c2ljYWwgbWFjaGluZSwg
dGhlDQo+ID4+PiBhZGRyZXNzZXMgb2YgbXVsdGlwbGUgbm9kZXMgY2FuIGJlIGludGVybGVhdmVk
Lg0KPiA+Pj4NCj4gPg0KPiA+IEkgd2lsbCBhZGp1c3QgYWJvdmUgcGFyYWdyYXBoIHRvOg0KPiA+
IC4uLiBUaGlzIG1lYW5zIGN1cnJlbnQgTlVNQSBjb2RlIG9ubHkgY2FuIHN1cHBvcnQgbm9kZSBo
YXMgbm8gaW50ZXJsYWNlZA0KPiA+IG1lbW9yeSBibG9ja3MuIC4uLg0KPiA+DQo+ID4+PiBTbyBp
biB0aGlzIHBhdGNoLCB3ZSBhZGQgY29kZSB0byBkZXRlY3QgZGlzY29udGlub3VzIG1lbW9yeSBi
bG9ja3MNCj4gPj4+IGZvciBvbmUgbm9kZS4gTlVNQSBpbml0aWFsaXp0aW9uIHdpbGwgYmUgZmFp
bGVkIGFuZCBlcnJvciBtZXNzYWdlcw0KPiA+Pj4gd2lsbCBiZSBwcmludGVkIHdoZW4gWGVuIGRl
dGVjdCBzdWNoIGhhcmR3YXJlIGNvbmZpZ3VyYXRpb24uDQo+ID4NCj4gPiBJIHdpbGwgYWRqdXN0
IGFib3ZlIHBhcmFncmFwaCB0bzoNCj4gPiBTbyBpbiB0aGlzIHBhdGNoLCB3ZSBhZGQgY29kZSB0
byBkZXRlY3QgaW50ZXJsZWF2ZSBvZiBkaWZmZXJlbnQgbm9kZXMnDQo+ID4gbWVtb3J5IGJsb2Nr
cy4gTlVNQSBpbml0aWFsaXphdGlvbiB3aWxsIGJlIC4uLg0KPiANCj4gVGFraW5nIGp1c3QgdGhp
cyBwYXJ0IG9mIHlvdXIgcmVwbHkgKHRoZSBpc3N1ZSBjb250aW51ZXMgbGF0ZXIpLCBtYXkgSQ0K
PiBhc2sgdGhhdCB5b3UgdXNlIGEgY29uc2lzdGVudCB0ZXJtIHRocm91Z2hvdXQgdGhpcyBzaW5n
bGUgcGF0Y2g/IE1peGluZw0KPiAiaW50ZXJsYWNlIiBhbmQgImludGVybGVhdmUiIGxpa2UgeW91
IGRvIG1heSBtYWtlIHBlb3BsZSB3b25kZXIgd2hldGhlcg0KPiB0aGUgdHdvIGFyZSBpbnRlbmRl
ZCB0byBleHByZXNzIHNsaWdodGx5IGRpZmZlcmVudCBhc3BlY3RzLiBQZXJzb25hbGx5LA0KPiBh
cyBwZXIgbXkgc3VnZ2VzdGlvbiwgSSdkIHByZWZlciAiaW50ZXJsZWF2ZSIsIGJ1dCBJJ20gbm90
IGEgbmF0aXZlDQo+IHNwZWFrZXIuDQo+IA0KDQpTb3JyeSwgSSBhbSBub3QgYSBuYXRpdmUgc3Bl
YWtlciB0b28sIEkgaGFkIGNoZWNrZWQgZGljdCBmb3IgaW50ZXJsYWNlZA0KYmVmb3JlIEkgdXNl
ZCBpdC4gaHR0cHM6Ly93d3cubWVycmlhbS13ZWJzdGVyLmNvbS90aGVzYXVydXMvaW50ZXJsYWNl
ZA0KDQpPYnZpb3VzbHksIEknbSBwcm9iYWJseSB1c2luZyBpdCBpbmNvcnJlY3RseSBhbmQgbWFr
aW5nIGl0IGhhcmRlciB0bw0KdW5kZXJzdGFuZCwgSSB3aWxsIHVzZSAiaW50ZXJsZWF2ZSIgaW4g
bXkgcGF0Y2hlcy4NCg0KVGhhbmtzLA0KV2VpIENoZW4NCg0KDQo+IEphbg0KDQo=

