Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70296671137
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 03:33:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480095.744297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHyGH-0000GN-G7; Wed, 18 Jan 2023 02:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480095.744297; Wed, 18 Jan 2023 02:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHyGH-0000Dd-Cx; Wed, 18 Jan 2023 02:33:13 +0000
Received: by outflank-mailman (input) for mailman id 480095;
 Wed, 18 Jan 2023 02:33:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BRoI=5P=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pHyGF-0000DX-Tr
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 02:33:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2086.outbound.protection.outlook.com [40.107.6.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7242eafc-96d8-11ed-b8d0-410ff93cb8f0;
 Wed, 18 Jan 2023 03:33:09 +0100 (CET)
Received: from AS9PR07CA0048.eurprd07.prod.outlook.com (2603:10a6:20b:46b::15)
 by DB3PR08MB9060.eurprd08.prod.outlook.com (2603:10a6:10:430::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 02:33:05 +0000
Received: from AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46b:cafe::1b) by AS9PR07CA0048.outlook.office365.com
 (2603:10a6:20b:46b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.12 via Frontend
 Transport; Wed, 18 Jan 2023 02:33:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT053.mail.protection.outlook.com (100.127.140.202) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Wed, 18 Jan 2023 02:33:04 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Wed, 18 Jan 2023 02:33:04 +0000
Received: from 3b798216bb1c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0EF9643B-A6D2-43F3-BFF8-36CE9C4C663A.1; 
 Wed, 18 Jan 2023 02:32:59 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3b798216bb1c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 Jan 2023 02:32:59 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DU0PR08MB9202.eurprd08.prod.outlook.com (2603:10a6:10:416::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.22; Wed, 18 Jan
 2023 02:32:52 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b%3]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 02:32:52 +0000
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
X-Inumbo-ID: 7242eafc-96d8-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfpTWE0qauED++MI8wxFRNNT3Ne56BXzu+NnU94osI4=;
 b=ZoLbjxbAD0cXRjbIrVWyLjOKkdjXFQE79ya5Y9uQ9muwSGhntoZLcZ3W6I1KBJHpiPh8bR0k2whN57OXhQ9g5M/c9HXgNbPlduHZBGe3JLV6+Gn+lN69HmBQgIgQsQoqRL2JqLAPrKggXedzvvMF/x9CxG/39rzwUGR4yqA9UqI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjpXHS8Thh10GUptMlO/zqdeupRof5nIh7dJq5pX+0mnGOdLiLDIWV/WhWY9WoFnfRdGdi7/t9dJcCltZEq7EBoO8FLlFrHVV94/ytdCB1OUxyi/J55rxiJhs0/R7W5P8US33fCTxA4JREGXxGPL8n7xhGQoRCc8vs/z2IvI/hRZzeUIsouvGKH/sJ/vBg17A5cKxao9j7ZQjituZoQHRe9Cpz5nR0ARh1n26+rKtiZjqkAhllsSyBN3SfRPVARDoIQFxwxRl+M0RIYwzNHHYjl8an9J21lOvTv2oeHiUecjtDlUqorVSf9ZbSMsmOwK6WIdJ0KDJB6weYiHDFXhaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfpTWE0qauED++MI8wxFRNNT3Ne56BXzu+NnU94osI4=;
 b=ax0C9XmBrW2EkIm145W8W6hozsXIEMIjilRS5bU82B16P21FZYSbr6gbXggWAbtJiq7uqJZ/Z00/DZcjOddzJwwEsZbliGuaR4oIazPaRAoWTDnNXt09PIjHBwUBysKTsY3B+o4DjbOv36mDXuS23KGbvc1aGGUjgZDWDkh1OHnmHuKDSX+2Rz/jiBGsMflk9iZm9iALnNPZvd5//KXg7k2fOITQWsAEPqhqAzt+aj6edBBQshGnDCk2mMGyKFUg5XcGl1VLEMCCg3gdDPLA9gIswU4T1TLeFstOMGDN7M/cw1IlmQieNQoVPPa0yTfzsTZDhYo127Kgg56GZiK4pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfpTWE0qauED++MI8wxFRNNT3Ne56BXzu+NnU94osI4=;
 b=ZoLbjxbAD0cXRjbIrVWyLjOKkdjXFQE79ya5Y9uQ9muwSGhntoZLcZ3W6I1KBJHpiPh8bR0k2whN57OXhQ9g5M/c9HXgNbPlduHZBGe3JLV6+Gn+lN69HmBQgIgQsQoqRL2JqLAPrKggXedzvvMF/x9CxG/39rzwUGR4yqA9UqI=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 03/40] xen/arm: adjust Xen TLB helpers for Armv8-R64
 PMSA
Thread-Topic: [PATCH v2 03/40] xen/arm: adjust Xen TLB helpers for Armv8-R64
 PMSA
Thread-Index: AQHZJxAWg7D0kl7RH0mt7T+dlRngQa6jRWqAgAA2W9A=
Date: Wed, 18 Jan 2023 02:32:52 +0000
Message-ID:
 <PAXPR08MB742081B2438A4B30229CDDE19EC79@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-4-Penny.Zheng@arm.com>
 <759544c9-7783-c61d-75bd-0a9dab364be2@xen.org>
In-Reply-To: <759544c9-7783-c61d-75bd-0a9dab364be2@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D71A659A272AD046892AB173C7B8FDFA.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|DU0PR08MB9202:EE_|AM7EUR03FT053:EE_|DB3PR08MB9060:EE_
X-MS-Office365-Filtering-Correlation-Id: afb3aed7-2313-426c-e228-08daf8fc53da
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 B97T+H6x2vvWeXiXF8qJxHAEC8Frbl4Psh/kAQatIfMm3cxYcYuE2LvS8R7WF52Rvz0IGszjI2x5FMYNa62SSEBmcv6+H6kqkw74oJxwi8sn9mfGk0N2y6pPGX0hCTPoJfSeXS4p67NYCbyHKBJwfWwCp+xWg7lTKwTsRK4CwXKSXV9usXbehlA2CGo7cb44t2qKYlu/GMbAgNxr1x2bCIz3FcBFVbCyHW2XkdD3pAjsW2Fl0MmTt9tebgk4cKj/3j+hPDM3I926woUKflwdwHNU/N2lgB05AwVzK49hafIS25dX38wUr4e2SECwpzFlQE2LUW7A437jotPcJACHqTmcoRc44LAppeMVxof89XOVsoxrr2CJiuyk8hsPNUedki4K9TY0AxMqF5IlBnQP0ad/nkm4xXigXEQ2JT7V2Pq/9pqHHXqX/5966xfFDMajjzG1QraHC6LKXpbn7RLcQFOYHDDILUMLreB+orNkmXChUEtCzuvby9StTPBvIDdZWVru+el6QkH/r7H48zv2p4E61fuOZCqS4ZvSyve0DXM+VKmxaq7GP376Gm1iSoQHaHJ4nTlo7jIKuyGBzcmzukH6qMmmsVUq3CPsRCRF+lWLcraQqNBY//CTUVjVLNmSO8kujbl0WZb9/MPJpyKTM6Gzs5ImusZQeAo8xgnR2ltxI9BA4yxO2pdyJfpxD+fR4Lmqmq5KqSEpeiQO6rpGTQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(451199015)(110136005)(316002)(54906003)(8936002)(52536014)(66946007)(5660300002)(4326008)(66446008)(76116006)(66556008)(33656002)(83380400001)(41300700001)(66476007)(38070700005)(38100700002)(122000001)(86362001)(53546011)(55016003)(71200400001)(26005)(6506007)(186003)(7696005)(478600001)(9686003)(8676002)(2906002)(64756008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9202
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f062ab26-a084-4de1-fdae-08daf8fc4c95
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8aVuUaG06s7aOoWJRY6kKvuS80HVjWsb7O4jTWRkb5S/Vg4qV/N8fzxEi0P2GKpy0yk+yfzwf+7Dss6lhbdRNRT3LurWu4yneG1qxndAA+2xxepti89lFwj11wLj5bKAQ/nFK9YNnBTZT8V9zRg8McITLU0tEBQBC3q/L+fwm5k3IgsjvojcIZTMhrsECmcSVqOwdZ/QOGMiNdOj8QChfOXBNKngiCmjZTRQ0KhZjstt2tOiDEpdeY2wKwmAH7uM3kKO6ZkkvQoU0ptkegocM7SqnDfMTRKOFFDAlgrSOzUF5hqZwGK4OCEOzyAwNnLtn67x/aGUzyBm4wQD3lQuUWHP6tuxAROZ2woe0OvTQk6VCPaaHV+1r0mBvzejY1KXhCF9CVqU5iQVr/LDi/n1By/LqFWp5QEXRXGXRCboDpX5pBBwuT4+QIPnutGBciJBpw3GiCFIa+OxU/HmMaPROVClO9U2jaOkK7AswmBn2SwDR3pVaHCvcKgN7ZV9gajzF+qGwR1j0XiXbAPwx9PLxYPmjMaObEZUzdKLRRjeTmLLUzAOEnbJJki0aM5UJpisKHgp7vXUgBK7pYU/GuKz8aRXYEpUBZtd9WxQ68jJa3aiPRDOUZl3Jqjom+zWqcynx7XSmJ7xzYMk1b7s0JLdNGwootLS8WlUKG8I9a5q7L/3o8h6HO+3eMUmhMEs0EAfh4reTc7KQwS+DB3DtwjgOA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199015)(40470700004)(46966006)(36840700001)(40480700001)(33656002)(55016003)(40460700003)(47076005)(70206006)(6506007)(8676002)(41300700001)(4326008)(83380400001)(70586007)(53546011)(478600001)(186003)(8936002)(107886003)(336012)(9686003)(52536014)(26005)(7696005)(110136005)(54906003)(316002)(5660300002)(82310400005)(356005)(36860700001)(2906002)(81166007)(82740400003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 02:33:04.8022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afb3aed7-2313-426c-e228-08daf8fc53da
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9060

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjPlubQx5pyIMTjml6UgNzoxNw0K
PiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcNCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgU3RlZmFu
byBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQgTWFycXVp
cyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsNCj4gVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9k
eW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAzLzQwXSB4
ZW4vYXJtOiBhZGp1c3QgWGVuIFRMQiBoZWxwZXJzIGZvciBBcm12OC0NCj4gUjY0IFBNU0ENCj4g
DQo+IEhpLA0KPiANCj4gT24gMTMvMDEvMjAyMyAwNToyOCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+
ID4gRnJvbTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4NCj4gPiAgRnJvbSBBcm0g
QVJNIFN1cHBsZW1lbnQgb2YgQXJtdjgtUiBBQXJjaDY0IChEREkgMDYwMEEpIFsxXSwNCj4gPiBz
ZWN0aW9uIEQxLjYuMiBUTEIgbWFpbnRlbmFuY2UgaW5zdHJ1Y3Rpb25zLCB3ZSBrbm93IHRoYXQN
Cj4gPiBBcm12OC1SIEFBcmNoNjQgcGVybWl0cyBhbiBpbXBsZW1lbnRhdGlvbiB0byBjYWNoZSBz
dGFnZSAxDQo+ID4gVk1TQXY4LTY0IGFuZCBzdGFnZSAyIFBNU0F2OC02NCBhdHRyaWJ1dGVzIGFz
IGEgY29tbW9uIGVudHJ5DQo+ID4gZm9yIHRoZSBTZWN1cmUgRUwxJjAgdHJhbnNsYXRpb24gcmVn
aW1lLiBCdXQgZm9yIFhlbiBpdHNlbGYsDQo+ID4gaXQncyBydW5uaW5nIHdpdGggc3RhZ2UgMSBQ
TVNBdjgtNjQgb24gQXJtdjgtUiBBQXJjaDY0LiBUaGUNCj4gPiBFTDIgTVBVIHVwZGF0ZXMgZm9y
IHN0YWdlIDEgUE1TQXY4LTY0IHdpbGwgbm90IGJlIGNhY2hlZCBpbg0KPiA+IFRMQiBlbnRyaWVz
LiBTbyB3ZSBkb24ndCBuZWVkIGFueSBUTEIgaW52YWxpZGF0aW9uIGZvciBYZW4NCj4gPiBpdHNl
bGYgaW4gRUwyLg0KPiANCj4gU28gSSB1bmRlcnN0YW5kIHRoZSB0aGVvcnkgaGVyZS4gQnV0IEkg
d291bGQgZXhwZWN0IHRoYXQgbm9uZSBvZiB0aGUNCj4gY29tbW9uIGNvZGUgd2lsbCBjYWxsIGFu
eSBvZiB0aG9zZSBoZWxwZXJzLiBUaGVyZWZvcmUgdGhlICNpZmRlZiBzaG91bGQNCj4gYmUgdW5u
ZWNlc3NhcnkuDQo+IA0KPiBDYW4geW91IGNsYXJpZnkgaWYgbXkgdW5kZXJzdGFuZGluZyBpcyBj
b3JyZWN0Pw0KPiANCg0KWWVzLCB5b3UncmUgcmlnaHQsIGFmdGVyIHdlIHNlcGFyYXRlIGNvbW1v
biBjb2RlIGFuZCBNTVUgY29kZSwgdGhlc2UNCmhlbHBlcnMgd2lsbCBiZSBjYWxsZWQgaW4gTU1V
IHNwZWNpZmljIGNvZGUgb25seS4gV2Ugd2lsbCBkcm9wIHRoaXMNCnBhdGNoIGluIG5leHQgdmVy
c2lvbi4NCg0KQ2hlZXJzLA0KV2VpIENoZW4NCg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxp
ZW4gR3JhbGwNCg==

