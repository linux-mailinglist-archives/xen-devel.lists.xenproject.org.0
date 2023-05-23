Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4FE70D407
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 08:33:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538223.838020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1LYy-0000Bk-Kh; Tue, 23 May 2023 06:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538223.838020; Tue, 23 May 2023 06:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1LYy-00008B-H8; Tue, 23 May 2023 06:32:04 +0000
Received: by outflank-mailman (input) for mailman id 538223;
 Tue, 23 May 2023 06:32:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIFg=BM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1q1LYw-000085-JQ
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 06:32:02 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84af7b4a-f933-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 08:31:58 +0200 (CEST)
Received: from AM5PR04CA0021.eurprd04.prod.outlook.com (2603:10a6:206:1::34)
 by DB3PR08MB9111.eurprd08.prod.outlook.com (2603:10a6:10:43c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 06:31:56 +0000
Received: from AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::bc) by AM5PR04CA0021.outlook.office365.com
 (2603:10a6:206:1::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29 via Frontend
 Transport; Tue, 23 May 2023 06:31:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT064.mail.protection.outlook.com (100.127.140.127) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.14 via Frontend Transport; Tue, 23 May 2023 06:31:55 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Tue, 23 May 2023 06:31:55 +0000
Received: from b6b94f1fd7ca.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 61D0EAB4-BA31-46E5-ADE3-611831B8E445.1; 
 Tue, 23 May 2023 06:31:46 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b6b94f1fd7ca.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 May 2023 06:31:46 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB7905.eurprd08.prod.outlook.com (2603:10a6:10:3b3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 06:31:43 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%4]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 06:31:42 +0000
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
X-Inumbo-ID: 84af7b4a-f933-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ruz11yEVISzMnnmv3xI0C/m+aDQpZaUTIWLpZzpQ1CE=;
 b=Q3ST0mC9I5t8cgDwvlVVQRiWdLkNFDdYC6AGww7quxhDBoOo8vxfsMUDBiqO2kMwak37cCwVGQQxbrBxha1fxjCxnPxwhhDAi3ZGHMiMXyw019y3frg6SZgVbLOAa5MXf8tCINy9Zi46OHnfgI3nBTVluAcB1wnC4OFiiY1/KJQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RytE2Vd1ocT3dEjlro2Ga7nVCunQA6VxtMRt66YBDPos84riKr2Vgg+NEQK2pf4Gm056K8dbufQcYRUY3uwxWltvkzIfiCBdhdEqxSBl/KudVOO7xdjeC6w+euXc0enxmcZeaR1hOUj8dZ92lRkvtBkd9RC+GI1vuoNhWJ5duUV/uru97yCO+hHjXl8TdJD77u1mXMhawMy4qgvi4lFqXVqIbdqwWQ/mXjAkLObEgjqsrY1Jrvh5go8M/eYWbc6yyJFYEes7W8XERw+jZKqjjZ/BnWXdbCWWDRqMS+6PUdtH9h0AgoDLr9YO/FnoAlmqcZM36EDKnHtcvBdKu38bTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ruz11yEVISzMnnmv3xI0C/m+aDQpZaUTIWLpZzpQ1CE=;
 b=KqRU2eA/zE7enuAps12QlUoZpcCR2q/IHhG8NeGeu8F02PjklsPM7WTKJYlfTnxqUZs+3lqN548BhVwdFWAVDJRpWCNjTd7RPdWCPKNPQNbqlUv4uQ2J2g+2Hhgzs4x0Sn2db3wFERzv2l+PzQQYXQPTsoDoOAMtIN1TS/hlJwk0A5AlWV5YHipaQuIXx6q9vyoWXHNPx9ivSt8TrwNFc6n9kxn1UiQxFTxOJxiUQUQ6lRRvlB5kgCpmI6HDlUbnkMSt2SmnuwsFmyQ9mxAtuVwV11qAW/S2zDN3vaMi76d1YgZ16EUCCFfhkt6X3hsUV785faIOmoRDbyViR12+4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ruz11yEVISzMnnmv3xI0C/m+aDQpZaUTIWLpZzpQ1CE=;
 b=Q3ST0mC9I5t8cgDwvlVVQRiWdLkNFDdYC6AGww7quxhDBoOo8vxfsMUDBiqO2kMwak37cCwVGQQxbrBxha1fxjCxnPxwhhDAi3ZGHMiMXyw019y3frg6SZgVbLOAa5MXf8tCINy9Zi46OHnfgI3nBTVluAcB1wnC4OFiiY1/KJQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH v4 09/17] xen/arm: introduce a helper to parse device tree
 NUMA distance map
Thread-Topic: [PATCH v4 09/17] xen/arm: introduce a helper to parse device
 tree NUMA distance map
Thread-Index:
 AQHZd0ulMpqFICe/LUiDVq6+aDsW9687sveAgAFTkCCAACNagIAAAPgggAADbgCAKli08A==
Date: Tue, 23 May 2023 06:31:41 +0000
Message-ID:
 <AS8PR08MB79919CD7C233345113F8D5C992409@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-10-Henry.Wang@arm.com>
 <e03bbb52-1a19-7d18-4abe-75bbef8a0aee@suse.com>
 <AS8PR08MB799117EDD6BAB892CAB870A192659@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <13635377-e296-370d-121b-5b617dc210bc@suse.com>
 <AS8PR08MB7991DCE0DFC850FEA920BF8C92659@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <c195ef53-1151-1fb2-0cf9-f6f47d20b75e@suse.com>
In-Reply-To: <c195ef53-1151-1fb2-0cf9-f6f47d20b75e@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5630A10A977B5749875297F31FB003CF.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB7905:EE_|AM7EUR03FT064:EE_|DB3PR08MB9111:EE_
X-MS-Office365-Filtering-Correlation-Id: 36abae3f-6c1a-4150-ae35-08db5b576788
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WYNVUyO2xZkXRWvOcfqidybVCvyjQ7wj+fl8kNi2Xmu32h9LcMmIiwRfh/Prl8qNxvyahEPRlStwBRjhKxkHazAtcxgFdRGdYYNSC179Tl+4itTwKoVVuZgLiSotz+y4rjkdb0F3eWpTOk2d7b0tIyUmfUxHL8M7xrs/IQ0lMXPeMPEbvqrB4ep5jZ5/HBqNASVNEoCiaWNxNAdMrg2ssF3QUKvzW9dDYXvCm7DwWUserFwEQnU4vpUI0X8sC/W4mJM6m073QEJM6XcNRZp1s8Jje0V+epag6KxPo0FM9jr/+P6PubCsgp/sbZvQo2Y6osR8B4o3tmVDnT05ZJhJjyTjAQ4KnIID1n/16z6zJUztKDbd/Rz20TwY7N5NhgHazc3PbaNBy04LHUzgqKyBpVba7eIpSZLURUP2x6nTBuFE8aFY6rGokaOdBNE5SQHUBwaFc0BvPrKDXfbXFIEJz3olI9wUSlbINNxZO+Rjla65Tg7czfo7EZoS9C6pJmrv0/8OzrQoCBcpZCPa/jKf13u6Oen6YsSAmR6+DDr5hkDYgj9802xKR6YVxOTvgmWtJ4akmnuqN5mGtGz91yXg8mxgj+qg7/LspfCf/1aQ1eho3rXQc4+uo+uXtQljEG8g
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(451199021)(5660300002)(52536014)(8936002)(8676002)(83380400001)(33656002)(2906002)(186003)(122000001)(38070700005)(38100700002)(86362001)(55016003)(6506007)(26005)(9686003)(54906003)(71200400001)(316002)(478600001)(66476007)(66446008)(4326008)(6916009)(64756008)(66556008)(66946007)(76116006)(7696005)(41300700001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7905
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	691f5c2b-71a7-4b80-d439-08db5b575f2c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DPV/WmRW6t7ZPzyyq4FQabS1GN0FZ1/IXWOH4pvgJfpl6JKZKey3nG9UAUoL00H4pQLYvJwlFzSOIW68Svvk/2Jvsm1CSog//Va7IrHCJJ8yfA7e8uCF1SJbXKeuWgGuDQR3hvbZZ0Alytm0+t+9f1r8Bt3yCcl0E4rXK2SdzYwfDSi7I1Jyq3ORaiGgF1732Nv1v1KIYeXU0BXyA7VLhsnWr0z2saY9YqiO4IMQ/Rdn9O9YpVoB19VL43mGvxFN/cURbuXJ1fMOiBKOEjO/LZ9X/HV9zllUFk8OxTBk5rZ2jeolbXFxL6KoUfHpo9Yq71cSPoNzkrGp0MU2RoWgZrX0iKYZPPtWqjUCdW0v+dlWbE9NQgb9Q60n5NPFZ2sHanVlGqz0cfhWUTIAmjya8Vven7tbv/mtsG21fzymHl/6TGXKislM2USE9Y95g6kDR4QFxa03FRCMY24E2ZQNxORp5533yeGR+6nPoazS5zU2ZrxIVm6DkMrztRETDChw7k7hj6guxJngxm24ZGr0/qYbNVWS2R7DwbeG0do6cuWj+62nClScuhxEPizBh2eAfVnLqSXDpgN1j2NosD05hv2ruTU0iwivHtIHlb4X5poXa1jh/PK9fh/+kSbiXcvEoGSaCryyC4l5oY8zPHATCDyhU82Gtegxoy77BMSnAdyz35Xd5RF9M/T96iY5rNfOavtfRn+8yHcmbQ5AXXtRuaS+nyv/Y64Asb1b22iX35/ZMzzxgllEOMn0dHMoEuJ+
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(136003)(376002)(346002)(451199021)(46966006)(40470700004)(36840700001)(186003)(316002)(33656002)(86362001)(6506007)(26005)(9686003)(2906002)(8676002)(8936002)(6862004)(40480700001)(55016003)(5660300002)(40460700003)(52536014)(41300700001)(7696005)(478600001)(36860700001)(54906003)(356005)(82740400003)(336012)(81166007)(82310400005)(70206006)(4326008)(47076005)(70586007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 06:31:55.9412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36abae3f-6c1a-4150-ae35-08db5b576788
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9111

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjQgMDkvMTddIHhlbi9hcm06IGludHJvZHVjZSBhIGhlbHBlciB0byBwYXJzZSBkZXZp
Y2UNCj4gdHJlZSBOVU1BIGRpc3RhbmNlIG1hcA0KPiANCj4gPj4+Pj4gKyAgICAgICAgLyogVGhl
IGRlZmF1bHQgdmFsdWUgaW4gbm9kZV9kaXN0YW5jZV9tYXAgaXMNCj4gPj4gTlVNQV9OT19ESVNU
QU5DRQ0KPiA+Pj4+ICovDQo+ID4+Pj4+ICsgICAgICAgIGlmICggb3Bwb3NpdGUgPT0gTlVNQV9O
T19ESVNUQU5DRSApDQo+ID4+Pj4NCj4gPj4+PiBBbmQgdGhlIG1hdHJpeCB5b3UncmUgcmVhZGlu
ZyBmcm9tIGNhbid0IGhvbGQgTlVNQV9OT19ESVNUQU5DRQ0KPiA+PiBlbnRyaWVzPw0KPiA+Pj4+
IEkgYXNrIGJlY2F1c2UgeW91IGRvbid0IGNoZWNrIHRoaXMgYWJvdmU7IHlvdSBvbmx5IGNoZWNr
IGFnYWluc3QNCj4gPj4+PiBOVU1BX0xPQ0FMX0RJU1RBTkNFLg0KPiA+Pj4NCj4gPj4+IE15IHVu
ZGVyc3RhbmRpbmcgZm9yIHRoZSBwdXJwb3NlIG9mIHRoaXMgcGFydCBvZiBjb2RlIGlzIHRvIGNo
ZWNrIGlmIHRoZQ0KPiA+PiBvcHBvc2l0ZQ0KPiA+Pj4gd2F5IGRpc3RhbmNlIGhhcyBhbHJlYWR5
IGJlZW4gc2V0LCBzbyB3ZSBuZWVkIHRvIGNvbXBhcmUgdGhlIG9wcG9zaXRlDQo+ID4+IHdheQ0K
PiA+Pj4gZGlzdGFuY2Ugd2l0aCB0aGUgZGVmYXVsdCB2YWx1ZSBOVU1BX05PX0RJU1RBTkNFIGhl
cmUuDQo+ID4+Pg0KPiA+Pj4gQmFjayB0byB5b3VyIHF1ZXN0aW9uLCBJIGNhbiBzZWUgeW91ciBw
b2ludCBvZiB0aGUgcXVlc3Rpb24uIEhvd2V2ZXIgSQ0KPiBkb24ndA0KPiA+PiB0aGluaw0KPiA+
Pj4gTlVNQV9OT19ESVNUQU5DRSBpcyBhIHZhbGlkIHZhbHVlIHRvIGRlc2NyaWJlIHRoZSBub2Rl
IGRpc3RhbmNlIGluIHRoZQ0KPiA+PiBkZXZpY2UNCj4gPj4+IHRyZWUuIFRoaXMgaXMgYmVjYXVz
ZSBJIGh1bnRlZCBkb3duIHRoZSBwcmV2aW91cyBkaXNjdXNzaW9ucyBhbmQgZm91bmQNCj4gWzJd
DQo+ID4+IGFib3V0DQo+ID4+PiB3ZSBzaG91bGQgdHJ5IHRvIGtlZXAgY29uc2lzdGVudCBiZXR3
ZWVuIHRoZSB2YWx1ZSB1c2VkIGluIGRldmljZSB0cmVlDQo+IGFuZA0KPiA+PiBBQ1BJDQo+ID4+
PiB0YWJsZXMuIEZyb20gdGhlIEFDUEkgc3BlYywgMHhGRiwgaS5lLiBOVU1BX05PX0RJU1RBTkNF
IG1lYW5zDQo+ID4+IHVucmVhY2hhYmxlLg0KPiA+Pj4gSSB0aGluayB0aGlzIGlzIGFsc28gdGhl
IHJlYXNvbiB3aHkgTlVNQV9OT19ESVNUQU5DRSBjYW4gYmUgdXNlZCBhcw0KPiB0aGUNCj4gPj4g
ZGVmYXVsdA0KPiA+Pj4gdmFsdWUgb2YgdGhlIGRpc3RhbmNlIG1hcCwgb3RoZXJ3aXNlIHdlIHdv
bid0IGhhdmUgYW55IHZhbHVlIHRvIHVzZS4NCj4gPj4NCj4gPj4gVGhlIFsyXSBsaW5rIHlvdSBw
cm92aWRlZCBkaXNjdXNzZXMgTlVNQV9MT0NBTF9ESVNUQU5DRS4NCj4gPg0KPiA+IEkgaW5mZXJy
ZWQgdGhlIGRpc2N1c3Npb24gYXMgIndlIHNob3VsZCB0cnkgdG8ga2VlcCBjb25zaXN0ZW50IGJl
dHdlZW4gdGhlDQo+IHZhbHVlDQo+ID4gdXNlZCBpbiBkZXZpY2UgdHJlZSBhbmQgQUNQSSB0YWJs
ZXMiLiBNYXliZSBteSBpbmZlcmVuY2UgaXMgd3JvbmcuDQo+ID4NCj4gPj4gTG9va2luZyBhdA0K
PiA+PiBMaW51eCdlcyBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvbnVtYS50eHQsIHRoZXJlJ3Mg
bm8gbWVudGlvbiBvZiBhbg0KPiA+PiB1cHBlciBib3VuZCBvbiB0aGUgZGlzdGFuY2UgdmFsdWVz
LiBJdCBvbmx5IHNheXMgdGhhdCBvbiB0aGUgZGlhZ29uYWwNCj4gPj4gZW50cmllcyBzaG91bGQg
YmUgMTAgKGkuZS4gbWF0Y2hpbmcgQUNQSSwgd2l0aG91dCByZWFsbHkgc2F5aW5nIHNvKS4NCj4g
Pg0KPiA+IEkgYWdyZWUgdGhhdCB0aGUgTlVNQSBkZXZpY2UgdHJlZSBiaW5kaW5nIGlzIGEgbGl0
dGxlIGJpdCB2YWd1ZS4gU28gSSBjYW5ub3QNCj4gPiBzYXkgdGhlIGNhc2UgdGhhdCB5b3UgcHJv
dmlkZWQgaXMgbm90IHZhbGlkLiBJIHdvdWxkIGxpa2UgdG8gYXNrIEFybQ0KPiBtYWludGFpbmVy
cw0KPiA+IChwdXR0aW5nIHRoZW0gaW50byBUbzopIG9waW5pb24gb24gdGhpcyBhcyBJIHRoaW5r
IEkgYW0gbm90IHRoZSBvbmUgdG8gZGVjaWRlDQo+IHRoZQ0KPiA+IGV4cGVjdGVkIGJlaGF2aW9y
IG9uIEFybS4NCj4gPg0KPiA+IEJlcnRyYW5kL0p1bGllbi9TdGVmYW5vOiBXb3VsZCB5b3UgcGxl
YXNlIGtpbmRseSBzaGFyZSB5b3VyIG9waW5pb24gb24NCj4gd2hpY2gNCj4gPiB2YWx1ZSBzaG91
bGQgYmUgdXNlZCBhcyB0aGUgZGVmYXVsdCB2YWx1ZSBvZiB0aGUgbm9kZSBkaXN0YW5jZSBtYXA/
IERvDQo+IHlvdQ0KPiA+IHRoaW5rIHJldXNpbmcgdGhlICJ1bnJlYWNoYWJsZSIgZGlzdGFuY2Us
IGkuZS4gMHhGRiwgYXMgdGhlIGRlZmF1bHQgbm9kZQ0KPiBkaXN0YW5jZQ0KPiA+IGlzIGFjY2Vw
dGFibGUgaGVyZT8gVGhhbmtzIQ0KPiANCj4gTXkgc3VnZ2VzdGlvbiB3b3VsZCBiZSB0bywgcmF0
aGVyIHRoYW4gcmVqZWN0aW5nIHZhbHVlcyA+PSAweGZmLCB0byBzYXR1cmF0ZQ0KPiBhdCAweGZl
LCB3aGlsZSBrZWVwaW5nIDB4ZmYgZm9yIE5VTUFfTk9fRElTVEFOQ0UgKGFuZCBvdmVyYWxsIGtl
ZXBpbmcNCj4gdGhpbmdzDQo+IGNvbnNpc3RlbnQgd2l0aCBBQ1BJKS4NCg0KU2luY2UgaXQgaGFz
IGJlZW4gYSB3aGlsZSBhbmQgdGhlcmUgd2VyZSBubyBmZWVkYmFjayBmcm9tIEFybSBtYWludGFp
bmVycywNCkkgd291bGQgbGlrZSB0byBmb2xsb3cgeW91ciBzdWdnZXN0aW9ucyBmb3IgdjUuIEhv
d2V2ZXIgd2hpbGUgSSB3YXMgd3JpdGluZyB0aGUNCmNvZGUgZm9yIHRoZSAic2F0dXJhdGlvbiIs
IGkuZS4sIGFkZGluZyBiZWxvdyBzbmlwcGV0IGluIG51bWFfc2V0X2Rpc3RhbmNlKCk6DQpgYGAN
CmlmICggZGlzdGFuY2UgPiBOVU1BX05PX0RJU1RBTkNFICkNCiAgICAgICAgZGlzdGFuY2UgPSBO
VU1BX01BWF9ESVNUQU5DRTsNCmBgYA0KSSBub3RpY2VkIGFuIGlzc3VlIHdoaWNoIG5lZWRzIHlv
dXIgY2xhcmlmaWNhdGlvbjoNCkN1cnJlbnRseSwgdGhlIGRlZmF1bHQgdmFsdWUgb2YgdGhlIGRp
c3RhbmNlIG1hcCBpcyBOVU1BX05PX0RJU1RBTkNFLA0Kd2hpY2ggaW5kaWNhdGVzIHRoZSBub2Rl
cyBhcmUgbm90IHJlYWNoYWJsZS4gSU1ITywgaWYgaW4gZGV2aWNlIHRyZWUsIHdlIGRvDQpzYXR1
cmF0aW9ucyBsaWtlIGFib3ZlIGZvciBBQ1BJIGludmFsaWQgZGlzdGFuY2VzIChkaXN0YW5jZXMg
Pj0gMHhmZiksIGJ5IHNhdHVyYXRpbmcNCnRoZSBkaXN0YW5jZSB0byAweGZlLCB3ZSBhcmUgbWFr
aW5nIHRoZSB1bnJlYWNoYWJsZSBub2RlcyB0byByZWFjaGFibGUuIEkgYW0NCm5vdCBzdXJlIGlm
IHRoaXMgd2lsbCBsZWFkIHRvIHByb2JsZW1zLiBEbyB5b3UgaGF2ZSBhbnkgbW9yZSB0aG91Z2h0
cz8gVGhhbmtzIQ0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBKYW4NCg==

