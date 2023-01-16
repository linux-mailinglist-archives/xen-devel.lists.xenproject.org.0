Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB5A66BD72
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 13:02:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478581.741836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHOBD-0007hK-Ib; Mon, 16 Jan 2023 12:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478581.741836; Mon, 16 Jan 2023 12:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHOBD-0007ed-Fk; Mon, 16 Jan 2023 12:01:35 +0000
Received: by outflank-mailman (input) for mailman id 478581;
 Mon, 16 Jan 2023 12:01:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Os5i=5N=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pHOBB-0007dg-SR
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 12:01:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84144711-9595-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 13:01:32 +0100 (CET)
Received: from AS9PR06CA0297.eurprd06.prod.outlook.com (2603:10a6:20b:45a::35)
 by PR3PR08MB5579.eurprd08.prod.outlook.com (2603:10a6:102:82::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 12:01:29 +0000
Received: from AM7EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45a:cafe::b3) by AS9PR06CA0297.outlook.office365.com
 (2603:10a6:20b:45a::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 12:01:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT044.mail.protection.outlook.com (100.127.140.169) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 12:01:29 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Mon, 16 Jan 2023 12:01:28 +0000
Received: from db079eda02db.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 33F254A1-4B14-4B5F-B1A6-694CD7A891A8.1; 
 Mon, 16 Jan 2023 12:01:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id db079eda02db.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Jan 2023 12:01:23 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS4PR08MB7502.eurprd08.prod.outlook.com (2603:10a6:20b:4e6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 12:01:20 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b%3]) with mapi id 15.20.5986.023; Mon, 16 Jan 2023
 12:01:20 +0000
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
X-Inumbo-ID: 84144711-9595-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yomIzoPDfG9YMo+xQOuq41a+sPGuYd7VcrscX3EIA0=;
 b=TpazR9esVkL2/m84LDNb6+j2wzVNr+1xgYsdiATWVcOxI7MPJCUW/rAeKXdR+553TvZ1FK8EHx2hFwqmpuY/HpAHPG73vTl74aTc6rumZu8TF22VkPh6wZ3OGJsfuwG9XSTRW1Lh273iUkl/g9r6mL0pzdqS4GYr46Lw0ohEVnM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFZCmVrwNlCcBQEwgGCylnUrdcXuNkd5CR9nRrFlicM4mjOUL662M7f++sfulQhaIFwCoCSdZs4ih+OyEkDsAJu7Bg2Vm/e0pzG+MTYR56J7fy5TCJLkZmBkHL2fC6mKHdPxx25zz/WIjcFGdaipJlR/THWP0aDODdGMW35sqfmdHCpv/j5QmFhBBwS7MiBGZmZdStZJVYGqpE39pMBw1fOiMfMYuLvSVs7PpDZI0XjUjGLWVAKveuEqFBsDYyv1nCH+qstr+icaiol6cUC0UeFjk/FHcubI04uIUuvaRRB9jJ7pRBgctyQsZ11f7XkyksYljjC7do66XpQ+BlSCLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yomIzoPDfG9YMo+xQOuq41a+sPGuYd7VcrscX3EIA0=;
 b=R3KOGKSYJo+VVTh6dwUboHkTa8Zb+bnxtlSA54SPZgfJBP3SaGcsfdVQ4pXda3NsQpdxayQjxnrgBAj8V39iEauWGcH/IjyJcU6lMEJcD77PasEGcTeRWyvNeHTs7vmIwnT9GJ/ORVAsRU1VQvS8iGrUkK9jEQNtB35bWw84CiyPyBe4oQThATaflajG7TdNNkHu4QjuUcE4ZHD5Wyz6YO00Qp6M1MqCRc2xBaTJvyGM59N+AEnmASmRQu1FvVhXgcVi638oD1FKEKX37km60c4rggME3GE+Px5DLA4ecWwEnOBv55dR7vX8iO7g5N6bqgZRM8KSUiILB7apYZdpVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yomIzoPDfG9YMo+xQOuq41a+sPGuYd7VcrscX3EIA0=;
 b=TpazR9esVkL2/m84LDNb6+j2wzVNr+1xgYsdiATWVcOxI7MPJCUW/rAeKXdR+553TvZ1FK8EHx2hFwqmpuY/HpAHPG73vTl74aTc6rumZu8TF22VkPh6wZ3OGJsfuwG9XSTRW1Lh273iUkl/g9r6mL0pzdqS4GYr46Lw0ohEVnM=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 02/17] xen/arm: implement helpers to get and update
 NUMA status
Thread-Topic: [PATCH v2 02/17] xen/arm: implement helpers to get and update
 NUMA status
Thread-Index:
 AQHZJNEXNkX9GZxGhkCgYl8odWGCka6X2i6AgAJ2fxCAAB/FgIAGXWYAgAAf/4CAAAyvoA==
Date: Mon, 16 Jan 2023 12:01:20 +0000
Message-ID:
 <PAXPR08MB7420AE4FCCF31C35D3FA3EB49EC19@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20230110084930.1095203-1-wei.chen@arm.com>
 <20230110084930.1095203-3-wei.chen@arm.com>
 <9e32ffa1-1499-f9cd-7ca8-f9493b1269cb@suse.com>
 <PAXPR08MB7420E482CACC741B1BA976569EFD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <5a802657-a6e8-9cc3-fefb-09a7e68d1e5e@suse.com>
 <cb2ba9fe-e29f-c44e-9139-701f894060a8@arm.com>
 <7c5f0dea-4aed-d8f2-363f-758ecce0104f@suse.com>
In-Reply-To: <7c5f0dea-4aed-d8f2-363f-758ecce0104f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1FDC3684535F7D4DA5EFEE77E9A75181.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|AS4PR08MB7502:EE_|AM7EUR03FT044:EE_|PR3PR08MB5579:EE_
X-MS-Office365-Filtering-Correlation-Id: b5797e36-028b-46da-04d0-08daf7b966d3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GYgmiwYCypTfp8RvEAxNP5VDL7qukPbXEbXM/tt0lVH3WGJdzttQUXReRkpHhQDrp8bdB0KXTF/JrkmTfh9v5o1oacthGMsfRQW9pp4DKcYtv1Z91EdHUItYVXAU6w710ZFPs7Uyp9/DoccBtk8Wkwm3bimS4VULp3xm+8N7aVgpQPLSflXjCbCCeCscvKto/m4480pCPKBWIw7s0wjw9e8cqFOjaNuFS58aVZ9oE0tMzgykkEzrG/DkCmQjaEpDeI6sl7iSNdU7CKfSFVyBSn3xClKZBy6K/YsZ+d+K+DAy4D1GSBP0wqXFDfhwHAovEM03NQaDtb8+Xp89DiAFVsVcTPkcoIN/uEye3/VTqP2RZjdP+CyarzCTC2l/NrS/D6Ar4X1Afc2PXKWEYQAamP4xHBarx6xmpV72GHQ9g0FxRjMpkIxsKVmC3Wr74/ckpFJAPQ6MWDd6K9kBgV4sXzZj0OSJLcliB46Ba6Fi8tULz2K24To3wB6MSo3hwDuCQOQnSZtRdrRDtH+KIoDPZe+890HyZuWJvGHGR/Px7ogwnNPAH90gIyAQrRWuWm3khTjJMgyi/soIKP8GVF++EwRZYfhI6UUmQGkOd1LZ1HbXW4x4IuubfpdjRdQaM3Dx3/6BLFsTBOT0rgt2IbM9wvb775l/aiFqS8w2+Wisbi/Xot5J8lJE1s6a2Ej8CzIJzHXZKgrhKsXBcwT99IHJ3A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39850400004)(396003)(366004)(136003)(451199015)(55016003)(33656002)(41300700001)(66476007)(64756008)(5660300002)(66556008)(4326008)(66446008)(76116006)(83380400001)(15650500001)(66946007)(6506007)(8676002)(8936002)(52536014)(186003)(26005)(9686003)(478600001)(53546011)(6916009)(54906003)(7696005)(71200400001)(316002)(38070700005)(86362001)(2906002)(122000001)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7502
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b0cba299-a129-4561-03d3-08daf7b961a4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AnmF1jhUgzp3U7XVDZq4RAz0MwR5dyl8Ss07EE6o126N5m2meyJDRewty0iZJPzE/xk6Te2McbNSuK3BmWxVVFSjO0Ep7Dm01OtjL1wx6dwQ2L2T2ODIQMGeJY8uJxsgu8Wcpzbj/il6uqW7udtFfGmkHC3ow+DDOlF8ZuPQxj9wDRloA/hUg1vDYG4KdpdhZp0zn1Tml3EtXQ9o9f36GuSWPT52azuQ4hzf9rZa4y40Qfl/PnEilm7fAbzy5sVFImJsYro9f6+fApUOF+rA2PZ7okT0QgCec+7A++AfOV8K1mesiW7zSsRyYJgORo6QqdN2ywo6/C097dbF4//9wKSxYiMIUHaSIXti89HfXA8hMhJ7Z6scbVjf9N86MkcPErt1hNrrnW2VPRGMKq/BI3H4CdlCdrBXe+qej1g7p6fePq6ZYlDhRwxg37OIlgctzhJsoa9McTaLKW0D5HD41IlhK70VqDHzA9pdnhWixhlpuAadZxKJdF7qIK75UksJEEzq/mCt8GgZbt1gS5Xh2o/zgwKAFzvqVn871mZthKr08AGUlr0CkjZMxMNtaDFjc0Njqnly9EIvyIbBlb3eLDiwzgtV+kx2PokTz3UjVEPYQpi/T0WlkZ3Nby+a9Po/iW1cAoHixb/+VDGX6pyuakF4AVwXEmxp71BmGbmszSqRiQvi0vtfjqXMoTL7WpcNKa+0ytNPOAuhbe4iu9aPnA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(55016003)(40480700001)(33656002)(40460700003)(47076005)(41300700001)(8676002)(5660300002)(70586007)(70206006)(15650500001)(8936002)(52536014)(6862004)(83380400001)(26005)(478600001)(336012)(9686003)(186003)(53546011)(6506007)(4326008)(54906003)(316002)(7696005)(82310400005)(86362001)(356005)(82740400003)(2906002)(36860700001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 12:01:29.1681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5797e36-028b-46da-04d0-08daf7b966d3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5579

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyM+W5tDHmnIgxNuaXpSAxOToxNQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEp1bGllbg0KPiBH
cmFsbCA8anVsaWVuQHhlbi5vcmc+OyBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlz
QGFybS5jb20+Ow0KPiBWb2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5j
b20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgR2Vvcmdl
IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgV2VpDQo+IExpdSA8d2xAeGVuLm9y
Zz47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgeGVuLQ0KPiBkZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAyLzE3XSB4
ZW4vYXJtOiBpbXBsZW1lbnQgaGVscGVycyB0byBnZXQgYW5kIHVwZGF0ZQ0KPiBOVU1BIHN0YXR1
cw0KPiANCj4gT24gMTYuMDEuMjAyMyAxMDoyMCwgV2VpIENoZW4gd3JvdGU6DQo+ID4gSGkgSmFu
LA0KPiA+DQo+ID4gT24gMjAyMy8xLzEyIDE2OjA4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPj4g
T24gMTIuMDEuMjAyMyAwNzoyMiwgV2VpIENoZW4gd3JvdGU6DQo+ID4+Pj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPj4+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+DQo+ID4+Pj4gU2VudDogMjAyM+W5tDHmnIgxMeaXpSAwOjM4DQo+ID4+Pj4NCj4gPj4+PiBP
biAxMC4wMS4yMDIzIDA5OjQ5LCBXZWkgQ2hlbiB3cm90ZToNCj4gPj4+Pj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL251bWEuaA0KPiA+Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vaW5j
bHVkZS9hc20vbnVtYS5oDQo+ID4+Pj4+IEBAIC0yMiw2ICsyMiwxMiBAQCB0eXBlZGVmIHU4IG5v
ZGVpZF90Ow0KPiA+Pj4+PiAgICAqLw0KPiA+Pj4+PiAgICNkZWZpbmUgTlJfTk9ERV9NRU1CTEtT
IE5SX01FTV9CQU5LUw0KPiA+Pj4+Pg0KPiA+Pj4+PiArZW51bSBkdF9udW1hX3N0YXR1cyB7DQo+
ID4+Pj4+ICsgICAgRFRfTlVNQV9JTklULA0KPiA+Pj4+DQo+ID4+Pj4gSSBkb24ndCBzZWUgYW55
IHVzZSBvZiB0aGlzLiBJIGFsc28gdGhpbmsgdGhlIG5hbWUgaXNuJ3QgZ29vZCwgYXMNCj4gSU5J
VA0KPiA+Pj4+IGNhbiBiZSB0YWtlbiBmb3IgImluaXRpYWxpemVyIiBhcyB3ZWxsIGFzICJpbml0
aWFsaXplZCIuIFN1Z2dlc3RpbmcNCj4gYW4NCj4gPj4+PiBhbHRlcm5hdGl2ZSB3b3VsZCByZXF1
aXJlIGtub3dpbmcgd2hhdCB0aGUgZnV0dXJlIHBsYW5zIHdpdGggdGhpcyBhcmU7DQo+ID4+Pj4g
cmlnaHQgbm93IC4uLg0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4gc3RhdGljIGVudW0gZHRfbnVtYV9z
dGF0dXMgX19yZWFkX21vc3RseSBkZXZpY2VfdHJlZV9udW1hOw0KPiA+Pg0KPiA+PiBUaGVyZSdz
IG5vIERUX05VTUFfSU5JVCBoZXJlLiBZb3UgX2ltcGx5XyBpdCBoYXZpbmcgYSB2YWx1ZSBvZiB6
ZXJvLg0KPiA+Pg0KPiA+DQo+ID4gSG93IGFib3V0IEkgYXNzaWduIGRldmljZV90cmVlX251bWEg
ZXhwbGljaXRseSBsaWtlOg0KPiA+IC4uLiBfX3JlYWRfbW9zdGx5IGRldmljZV90cmVlX251bWEg
PSBEVF9OVU1BX1VOSU5JVDsNCj4gDQo+IFdlbGwsIHllcywgdGhpcyBpcyB3aGF0IEkgd2FzIGFz
a2luZyBmb3Igd2hlbiBtZW50aW9uaW5nIHRoZSBsYWNrIG9mIHVzZQ0KPiBvZiB0aGUgZW51bWVy
YXRvci4gSXJyZXNwZWN0aXZlIG9mIHRoYXQgSSByZW1haW4gdW5oYXBweSB3aXRoIHRoZSBuYW1l
LA0KPiB0aG91Z2guDQo+IA0KDQpIb3cgYWJvdXQgRFRfTlVNQV9ERUYgb3IgZG8geW91IGhhdmUg
c29tZSBzdWdnZXN0aW9ucyBmb3IgdGhlIG5hbWU/DQoNCkNoZWVycywNCldlaSBDaGVuDQoNCj4g
SmFuDQo=

