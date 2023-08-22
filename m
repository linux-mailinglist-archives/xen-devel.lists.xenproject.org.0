Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D53DE7837C9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 04:13:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588038.919470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYGsq-0001VA-BJ; Tue, 22 Aug 2023 02:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588038.919470; Tue, 22 Aug 2023 02:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYGsq-0001Sv-7l; Tue, 22 Aug 2023 02:12:40 +0000
Received: by outflank-mailman (input) for mailman id 588038;
 Tue, 22 Aug 2023 02:12:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3hUC=EH=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qYGso-0001Sp-Nf
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 02:12:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c10450f-4091-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 04:12:35 +0200 (CEST)
Received: from DUZPR01CA0270.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::22) by DB3PR08MB9060.eurprd08.prod.outlook.com
 (2603:10a6:10:430::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 02:12:27 +0000
Received: from DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b9:cafe::b6) by DUZPR01CA0270.outlook.office365.com
 (2603:10a6:10:4b9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 02:12:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT014.mail.protection.outlook.com (100.127.143.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.15 via Frontend Transport; Tue, 22 Aug 2023 02:12:26 +0000
Received: ("Tessian outbound d084e965c4eb:v175");
 Tue, 22 Aug 2023 02:12:26 +0000
Received: from cf04edc68c22.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F557BFAD-C1E7-4766-BC20-174C3F54F0BC.1; 
 Tue, 22 Aug 2023 02:11:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cf04edc68c22.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Aug 2023 02:11:42 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB7683.eurprd08.prod.outlook.com (2603:10a6:150:62::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 02:11:35 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 02:11:33 +0000
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
X-Inumbo-ID: 5c10450f-4091-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sz04x7MikqIpqJE7huYTdA/1SCRnDCEzFbo1Pi515EU=;
 b=BS2sT37ciNDzCVt8+XNlJ8wnRHzzWYkX/Z9CH0T/abGLFscOjrDGO5fZYZ4KGHEs1Mxj8y23J/HfsTyryMtKJSnOd7fRu+NrMCqGUJ2d76kjOxWhoSHRbzGnj+0anhNsIfldAomOPqqMjKdFk43FpAXyviAHsFTY4qdnYH9b4c0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9177491152bf0778
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7QAXa/EYo/5Xeq4XkkuYamkLhGSu2C/9rddXqKTIbLczjExUg3JFKlN25UxfUfK+ymuqxu4LBdAC+9RjmGoWZuje4zw1weEjd0CAADsZOKtNxEnDDAz33q2N7G2j6Pa87wiER7UbyHd8CFL6W9qZUyGgtsIB8EcDIog+9sHz3GsbN5BMOEK7kEqryMFsSCXbC57rdSkf582ptX2mY7e3zVF4DM3VLSLl7Wnr47N3aPwQK+KvSQ2+NzwQdt5LuC4ZZ/SJ4oBebIWpCNu/Jn2R+1rPv0a4hsBllSG5YSEINNpFF0q896cuKKUb5AoO9PduMNmeHgZm0CI+7fG32jjyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sz04x7MikqIpqJE7huYTdA/1SCRnDCEzFbo1Pi515EU=;
 b=I0lEwfijTqAY+TibECIwkfq+XtuoefxvT6yjrahvAD68qBvj4NM7CopLC+mrHlq/rrrLyqzS0IxfYYQXZRKV5gCOx47hR9qYek1gvnqA2t7MhhSTlOD02eCKXwJocSeCPCLiqpL7F7ZAbVs2R4dDlbyTubwEri0tegMqsDf3uE/WaQRPB3tEh2L05wY7o/K90m5pYFrox8VRTrDxvFr21vwnd45EfTWVu9lwttKs7nNbimdZKU6jXliE3YpLvO261Zq2KA1Ds9VZkg3CaJMrEm3l517nlE10cnnhnj+HPgw/dq6Zpuv25H5C+YXnclMvyUK2ArnAFbFzOJQTNZv2cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sz04x7MikqIpqJE7huYTdA/1SCRnDCEzFbo1Pi515EU=;
 b=BS2sT37ciNDzCVt8+XNlJ8wnRHzzWYkX/Z9CH0T/abGLFscOjrDGO5fZYZ4KGHEs1Mxj8y23J/HfsTyryMtKJSnOd7fRu+NrMCqGUJ2d76kjOxWhoSHRbzGnj+0anhNsIfldAomOPqqMjKdFk43FpAXyviAHsFTY4qdnYH9b4c0=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
	<Penny.Zheng@arm.com>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v5 13/13] xen/arm: mmu: enable SMMU subsystem only in MMU
Thread-Topic: [PATCH v5 13/13] xen/arm: mmu: enable SMMU subsystem only in MMU
Thread-Index: AQHZzmeUay8NQ4kvrE+CkZdRGQuMz6/1UcMAgABNUIA=
Date: Tue, 22 Aug 2023 02:11:33 +0000
Message-ID: <FA20A514-B1D2-4FBA-97F4-93981E1F0636@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-14-Henry.Wang@arm.com>
 <67f4015f-fb63-f097-ce1b-ea6264232a1e@xen.org>
In-Reply-To: <67f4015f-fb63-f097-ce1b-ea6264232a1e@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB7683:EE_|DBAEUR03FT014:EE_|DB3PR08MB9060:EE_
X-MS-Office365-Filtering-Correlation-Id: e829f9f2-62bd-4ef5-a479-08dba2b53b08
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 L5k/a0OpLik7FdxDhVOpiSl0RGeOwC1K2uQUalI2dffT/RRe20OCUx7UeQ0mON27y4y39XtBJ8PoHhD1c7R5vip7ve3scOMuywUctLdefAKAezTCJHh+f/9+IpMVYvfPpg5YW98G/eEECJWay8N0PXMKBdS3cpom1PNBLNvCimCsGBmY2T97zQBp7CeTvQgXBw5gzjCbjxHws6Sm4GUHY9hQVVtO8MPnnvANggMBqJ5kbFHQmu0il0riRGXKBVTIuQZZ5DYoAzRxpBhzWYMBb6wnn/XEzYF9a59y3/Z/KZwJlsJyDt4tB3yv170Grw5BEXQ2HoLyGBsfsyF5PuD1hi4cXTdV0Gu3eyql4d6QJB7PXMAloIlVgxfvKwDVl1r5UTUAkr/hL1WSrONV0iDjs5KsLHQFLgtSnS2TCa2YPYdkeJa5LFAAn+mFPfE8732TXvKsgKQmxWRkzfb8Tu+Aehz2JxHBaJf6Gy0/wbxdyFDxaEVpszt/Jmcc1n9S+zoY6k1ywtcisbUKnf/Cr67/4eA0MKzytEktNb7pW2jxLjvZJnGaz+S6SfgC+MZdMezmbTWwJGuJ55LjbaRpkwrMhGH3VX4L10IFShXg2yzV1JUP96aBzDU/uUBZpF1WZwioMhZm0Li8iTZ9HRYvr++AvA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(136003)(346002)(39860400002)(186009)(1800799009)(451199024)(86362001)(33656002)(36756003)(122000001)(64756008)(316002)(66556008)(91956017)(66446008)(66476007)(6916009)(54906003)(76116006)(41300700001)(38100700002)(478600001)(66946007)(38070700005)(6486002)(6506007)(71200400001)(6512007)(53546011)(26005)(83380400001)(8676002)(4326008)(2906002)(2616005)(8936002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8190E7A2624D974581D3BD1410D96C5C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7683
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7e64c933-689d-465a-2dbd-08dba2b51b5b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ycr9L+L9wRgTupBlwR2hmHuBywwRUGovmzVHa+/gbE4NOU1bRbVhdYOg9z72Y+WAm5u9VwKeILxfrEZDFU/7FHJOJ1HGq9dt5bkLfEKL7alZbnbHCd81l0p/JEigjKNCBsgmNZWNAu0H0t4zHxcVS02z+zYjSbhCsNXC19tsXmMmjYxNPgrX6ajcsNI6UlWSfVOqIOhWxJMRwps3VLzsGOJ4mIyUBijzhUBHPGbXzEyxPN74dQs+AysNi3qK8uvMmdZtz7b0w4gs0AWkNxnMfRTZPkRp+rUTBEsB4T5deTkDoG9jL/CnNXww8Adg+hS09sNrHrVUOyMt6+6RY65jNsDLz8/UgBoYL4QevYMDZzyR9bJPMJdwX3SdG42fKN9U/Jt/Gj/hTyqZsHLO5Cw70bqM9CmrvWXeAohfS0wVdBNtYfP09h04GZO2G9aFo3xqCqmTI4WPiBCqS9P6tdUIHINLtuK27DWc3JId0eUMKGayN0HeYQorE5j0UdR588xMXRtq1FMLrz5v8Kn6IhgCzd/R7UIaz0Er9LRk+VkSE29GQGlBQr8IqwMn8pAyVY1VW6JiZkLa+gdc6Mi8ea+cjbHKox2V5Zbk4SnbA9iD4KjYS/+yQ6kfGSymSH7gnuu4OKka9tgkChkP7Zr9w/9iZTc2O8dTu5iQxkQpzkCZKYQ5mawUTTxwZGS3F5kZ47O0J8Ef33s0k+wqvwLsqbs+wl7nwoO4SPy6ZgGNLRi0V9c=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(82310400011)(186009)(1800799009)(451199024)(36840700001)(40470700004)(46966006)(33656002)(86362001)(40480700001)(36756003)(81166007)(478600001)(40460700003)(70206006)(54906003)(316002)(70586007)(41300700001)(82740400003)(356005)(6486002)(26005)(53546011)(6512007)(47076005)(336012)(2906002)(5660300002)(6862004)(8676002)(6506007)(36860700001)(4326008)(2616005)(83380400001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 02:12:26.6103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e829f9f2-62bd-4ef5-a479-08dba2b53b08
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9060

SGkgSnVsaWVuLA0KDQo+IE9uIEF1ZyAyMiwgMjAyMywgYXQgMDU6MzQsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiBPbiAxNC8wOC8yMDIzIDA1
OjI1LCBIZW5yeSBXYW5nIHdyb3RlOg0KPj4gRnJvbTogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5n
QGFybS5jb20+DQo+PiBTTU1VIHN1YnN5c3RlbSBpcyBvbmx5IHN1cHBvcnRlZCBpbiBNTVUgc3lz
dGVtLCBzbyB3ZSBtYWtlIGl0IGRlcGVuZGVudA0KPj4gb24gQ09ORklHX0hBU19NTVUuDQo+IA0K
PiAib25seSBzdXBwb3J0ZWQiIGFzIGluIGl0IGRvZXNuJ3Qgd29yayB3aXRoIFhlbiBvciB0aGUg
SFcgaXMgbm90IHN1cHBvcnRpbmcgaXQ/DQoNCkkgdGhpbmsgY3VycmVudGx5IHRoZXJlIGFyZSBu
byBoYXJkd2FyZSBjb21iaW5hdGlvbiBvZiBNUFUgKyBTTU1VLCBidXQNCnRoZW9yZXRpY2FsbHkg
SSB0aGluayB0aGlzIGlzIGEgdmFsaWQgY29tYmluYXRpb24gc2luY2UgU01NVSBzdXBwb3J0cyB0
aGUgbGluZWFyDQptYXBwaW5nLiBTbyB3b3VsZCBiZWxvdyByZXdvcmQgbG9va3MgZ29vZCB0byB5
b3U6DQoNCuKAnEN1cnJlbnRseSB0aGUgaGFyZHdhcmUgdXNlIGNhc2Ugb2YgY29ubmVjdGluZyBT
TU1VIHRvIE1QVSBzeXN0ZW0gaXMgcmFyZWx5DQpzZWVuLCBzbyB3ZSBtYWtlIENPTkZJR19BUk1f
U01NVSBhbmQgQ09ORklHX0FSTV9TTU1VX1YzDQpkZXBlbmRlbnQgb24gQ09ORklHX01NVS4iIA0K
DQo+IA0KPiBBbHNvLCBJIGFtIG5vdCBlbnRpcmVseSBjb252aW5jZWQgdGhhdCBhbnl0aGluZyBp
biBwYXNzdGhyb3VnaCB3b3VsZCBwcm9wZXJseSB3b3JrIHdpdGggTVBVLiBBdCBsZWFzdCBub25l
IG9mIHRoZSBJT01NVSBkcml2ZXJzIGFyZS4gU28gSSB3b3VsZCBjb25zaWRlciB0byBjb21wbGV0
ZWx5IGRpc2FibGUgSEFTX1BBU1NUSFJPVUdILg0KDQpJIGFncmVlLCBkbyB5b3UgdGhpbmsgYWRk
aW5nIGJlbG93IGFkZGl0aW9uIGRpZmYgdG8gdGhpcyBwYXRjaCBtYWtlcyBzZW5zZSB0byB5b3U/
DQpJZiBzbyBJIGd1ZXNzIHdvdWxkIGFsc28gbmVlZCB0byBtZW50aW9uIHRoaXMgaW4gY29tbWl0
IG1lc3NhZ2UuDQoNCmBgYA0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9LY29uZmlnIGIveGVu
L2FyY2gvYXJtL0tjb25maWcNCmluZGV4IDhhN2I3OWI0YjUuLmZkMjlkMTRlZDYgMTAwNjQ0DQot
LS0gYS94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KKysrIGIveGVuL2FyY2gvYXJtL0tjb25maWcNCkBA
IC0xMyw3ICsxMyw3IEBAIGNvbmZpZyBBUk0NCiAgICAgICAgZGVmX2Jvb2wgeQ0KICAgICAgICBz
ZWxlY3QgSEFTX0FMVEVSTkFUSVZFDQogICAgICAgIHNlbGVjdCBIQVNfREVWSUNFX1RSRUUNCi0g
ICAgICAgc2VsZWN0IEhBU19QQVNTVEhST1VHSA0KKyAgICAgICBzZWxlY3QgSEFTX1BBU1NUSFJP
VUdIIGlmIE1NVQ0KICAgICAgICBzZWxlY3QgSEFTX1BEWA0KICAgICAgICBzZWxlY3QgSEFTX1VC
U0FODQogICAgICAgIHNlbGVjdCBJT01NVV9GT1JDRV9QVF9TSEFSRQ0KYGBgDQoNCktpbmQgcmVn
YXJkcywNCkhlbnJ5DQoNCg==

