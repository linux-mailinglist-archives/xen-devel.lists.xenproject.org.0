Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 605406ECB4C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 13:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525317.816439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pquMf-000670-Cv; Mon, 24 Apr 2023 11:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525317.816439; Mon, 24 Apr 2023 11:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pquMf-00065J-9N; Mon, 24 Apr 2023 11:28:13 +0000
Received: by outflank-mailman (input) for mailman id 525317;
 Mon, 24 Apr 2023 11:28:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qjkp=AP=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pquMd-000659-Ox
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 11:28:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1659c9f2-e293-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 13:28:08 +0200 (CEST)
Received: from AS9PR01CA0006.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::9) by AM9PR08MB6177.eurprd08.prod.outlook.com
 (2603:10a6:20b:283::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 11:28:01 +0000
Received: from AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:540:cafe::82) by AS9PR01CA0006.outlook.office365.com
 (2603:10a6:20b:540::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 11:28:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT016.mail.protection.outlook.com (100.127.140.106) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.19 via Frontend Transport; Mon, 24 Apr 2023 11:28:01 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Mon, 24 Apr 2023 11:28:00 +0000
Received: from d5ec309458ec.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 77C487B9-331A-47C6-852C-F304CB758D08.1; 
 Mon, 24 Apr 2023 11:27:51 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d5ec309458ec.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Apr 2023 11:27:51 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com (2603:10a6:150:a9::12)
 by GV2PR08MB8368.eurprd08.prod.outlook.com (2603:10a6:150:bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Mon, 24 Apr
 2023 11:27:48 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::b95e:f68f:2747:5b86]) by GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::b95e:f68f:2747:5b86%6]) with mapi id 15.20.6319.032; Mon, 24 Apr 2023
 11:27:48 +0000
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
X-Inumbo-ID: 1659c9f2-e293-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HNfPZNksNZ3bEr9x5KOupK8IIm1iWP0K1b0Fs9XyX8=;
 b=woKwccxJbk5elUvqfpOlJjpYTAFuh8Efbd9ObDinrzmXyPdXsbFtfPMfEryJjVuC1eWDDTOzgudPU7vGxJ25Id0fjmIcKC9lF9htGA36iV2eK8xtR/Y7Z25L87KrGoJKg7+JI85U77yActx5ehK+ziz3rsvwwqB3F+nKg97mcq8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6hI7WMrWYdH3gTN+iqXsHKEhRVlS5mI8xmfc0rw6/giUTt/NwIAB+jdp6D0EZBhuumXlwloB+1kZQROLRJDpCjm13JRarW7inhpNVXhms1xO+8ZQhBFKTf/yRd6xvkXKQWfSQ9E0txgOQywrNUN7rfEDWGjdrjeV/TYm/xXdjkx9IsVSxso5XfA0w9BHB4TMnZSeZ+BwDBacabfan77LJcquMduS2887iCbnJ79iW0btJx3+kjk1cKJV89ByyATNSqQCAvHaCPzQQmx8ll2X2olk1v/HOucVfKp4siXr8/gHvyaJHG9fGObCQf0pOqLNEFy3CsEzyl+CbZQbTj03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HNfPZNksNZ3bEr9x5KOupK8IIm1iWP0K1b0Fs9XyX8=;
 b=VaOkRLj9qPDgih8a4KNEwt4Psd7FNF1ugWSI13BGVXUMaAUnsELs9/SElN1R/qnn+mkSCYCSM0vSi7cS2Na/a1/GwNZHKRBOvCzYnXs4Op0s/4/mZ4g8offUFZaBzPSDxpoJ7WGQQwFHIBPFmF3gyfzeA8SXrVtxfm341vlhFaNtlphsAxwFAIyC2To5JAaCZPaNTBHgEFgJMMZ+HeKU9u1gJadeeYU9UHR6+1LdpWfntTtWIvCep/F7QKAf4OIS5MmR9/5aC5f8NRtG764OPKBK9LfkF2Z0qxF0ME2IL2cLiKVfxHRTkVfsyrAsldSfkegex0W8DzlEx0lVQE5dlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HNfPZNksNZ3bEr9x5KOupK8IIm1iWP0K1b0Fs9XyX8=;
 b=woKwccxJbk5elUvqfpOlJjpYTAFuh8Efbd9ObDinrzmXyPdXsbFtfPMfEryJjVuC1eWDDTOzgudPU7vGxJ25Id0fjmIcKC9lF9htGA36iV2eK8xtR/Y7Z25L87KrGoJKg7+JI85U77yActx5ehK+ziz3rsvwwqB3F+nKg97mcq8=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 03/17] xen/arm: implement node distance helpers for Arm
Thread-Topic: [PATCH v3 03/17] xen/arm: implement node distance helpers for
 Arm
Thread-Index:
 AQHZc3rmCrt50C+BaEmmIgaK9uo9ea80IxGAgAFPzpCAABDqgIAC3lpQgAG3XoCAADcqoIAABVQAgAABqiA=
Date: Mon, 24 Apr 2023 11:27:48 +0000
Message-ID:
 <GV2PR08MB800157DF99EDBC2447D50EF292679@GV2PR08MB8001.eurprd08.prod.outlook.com>
References: <20230420112521.3272732-1-Henry.Wang@arm.com>
 <20230420112521.3272732-4-Henry.Wang@arm.com>
 <ac54e04c-58b7-d0c9-2443-bb09258c8bc8@suse.com>
 <AS8PR08MB79912F294EDAC48F835FBB7A92609@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <bdf33169-4e29-8c50-ff76-16d05df81a14@suse.com>
 <AS8PR08MB7991576C75D0D4482595E7E292669@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e06fc93f-293f-a873-c9b9-2d5c941168f9@suse.com>
 <GV2PR08MB8001D4A1EA5B854CA065B34992679@GV2PR08MB8001.eurprd08.prod.outlook.com>
 <63976a6a-f984-6c75-c3b7-34cd81eff33f@suse.com>
In-Reply-To: <63976a6a-f984-6c75-c3b7-34cd81eff33f@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A1D4F59BF895754CA9E2A022AF22F642.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	GV2PR08MB8001:EE_|GV2PR08MB8368:EE_|AM7EUR03FT016:EE_|AM9PR08MB6177:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed83273-8952-4da5-311a-08db44b6f673
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +MidMhPO2ugkkLZdQPGYwu4W0J9goytZPtTwWqijlqC+ey5Cy4c8S/tjoyjBhScqbciLcRA78jDVG7zLuu+FdXkOINA91OfZlwbdwOXEcOsuIVMwwp3i/dgrKTfBLTC9pW87/nUxR014wAKYyxV+VF2XSj1PxxGLf3k5klbiSWQlSrVLrCOVgufMBLdprDPGzZFmFY10IgaLAwOU99dxjKwcggQxyOKXc6zKDDtbwWnXsT1DTB0dgO9cxksHIT50+TdaRpGxeu7tpnW329472HzFDl8g3b8wLATDag6Pv1/ZYxFPsZ7tkh3DvUOuAYGfuJAcT6HoAt/gTpK7OMq5GoJ+Ql6MHlibBAuTlxRAQbIfMklN6zmkL/o+P2HXAEstJ/eBlt4u/6qOO8+dTOW97EEeeXxQvid/L0KkVzU+bf134iEkxLPn0Jg4I3yIG1ccwn91QxhtCKqu2/WqKAYpKXshPVhQoXEUL47Wshl+w+fMmHjFU0Wbg3x9PAGz8scPq189k6A7DK4iQfTkczINKwVFTZecskE+vVxiutv7m5iQguLMCybcdtClkaF/swVwF2dbLLrQp8b7IHFUNcOH5dSDREdl1mpAZ8UxOP94YUs53vmpxoy6W1VvPemjBx8i
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8001.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199021)(54906003)(71200400001)(316002)(66476007)(66556008)(66946007)(66446008)(76116006)(64756008)(6916009)(4326008)(86362001)(478600001)(55016003)(7696005)(8936002)(8676002)(38100700002)(52536014)(122000001)(5660300002)(83380400001)(6506007)(9686003)(2906002)(26005)(41300700001)(38070700005)(186003)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8368
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7d108584-7a59-45bf-50f7-08db44b6ee9f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N/TjvsqIoAM9hw0RNwwNWGZi4uBcjkP1y5TgXB50QdwK4Y9opX6W8pq6UZXqytgY3TN2pFZiQP8BRBvMQKGdQx90qRaVtabnLru2aC+waHg4ZwOS/FLxPQa5nurSVr00S5BFb9vQq129r/aHmMQS8EDDNxAKhqjE9PA90wZggk0DXWvMubYdkEzTgaY2RjKgQYNK89MHS+M+rGa+jUyYKM3tSdQvIFX5SIWUBkWbs3u/gPY/z3wZB+2KIsaVBxPfQ3Wa7OrSx7VfGGGFKfRq3OTLiyj45ux4CMJ48dgyhgJEzV0hwlDWNbG3Yg37czCEu5XnNFzsqLUqo7HW9CpoOuh5Dqu/bUyFP+O6U8SZ6CzJmnYFUoD4RuMRpocUgo3Hm+N6puVwE4NS4cVcNKeEQlI6xM2b/6nAJ6+pqJL0cLtb4Qk/CjnOnCMRczk41I3sS7DlFjasy5cGRmFfS7mpXhrb/igPAGIYH/inxEf2qZjcG7dqlHIlhB/94y8EL770z4NQM8cQTt7XjhQj3m8PEi5o/MU5IBqau8coiw2Mwd6brhMN8tk7zzhapDh4y0/XvQPBUQRc63Z1ozzzZqeqdI5ln9oY4KlSFP7Bg8Q5S9txxTP1xfSpQhE6WzDdQzlbR2DssAYQXUFbz8Tj6i1/gcEO4Ivdt0HmgiJcob+Jfeu1GaH2k8D7U2OSEzW/oxAzsfzOb8hCZlYiSN38WBLReg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199021)(36840700001)(46966006)(40470700004)(478600001)(40460700003)(54906003)(86362001)(186003)(7696005)(26005)(82310400005)(9686003)(6506007)(55016003)(40480700001)(33656002)(4326008)(316002)(82740400003)(83380400001)(70206006)(70586007)(36860700001)(2906002)(336012)(356005)(41300700001)(81166007)(8676002)(6862004)(8936002)(5660300002)(47076005)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 11:28:01.1913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed83273-8952-4da5-311a-08db44b6f673
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6177

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwMy8xN10g
eGVuL2FybTogaW1wbGVtZW50IG5vZGUgZGlzdGFuY2UgaGVscGVycyBmb3INCj4gQXJtDQo+ID4+
PiBDb3JyZWN0LCBJIGFncmVlLiBJIGFkZGVkIGEgbnVtYV9pbml0X2Rpc3RhbmNlKCkgZnVuY3Rp
b24gKGluIHBhdGNoICMxMikgdG8NCj4gPj4+IHNldCBhbGwgdmFsdWVzIHRvIE5VTUFfTk9fRElT
VEFOQ0UuIFRoZSBudW1hX2luaXRfZGlzdGFuY2UoKSB3aWxsIGJlDQo+ID4+PiBjYWxsZWQgaW4g
dGhlIGJlZ2lubmluZyBvZiBudW1hX2luaXQoKS4NCj4gPj4NCj4gPj4gV2h5IGRvIHlvdSBuZWVk
IGEgZnVuY3Rpb24gZm9yIHRoaXM/IEFzIHNhaWQsIHRoaXMgYXJyYXkgY2FuIGJlIHByZS1zZXQg
YXQNCj4gPj4gY29tcGlsZSB0aW1lICh1bmxlc3MgSSdtIG92ZXJsb29raW5nIHNvbWV0aGluZyku
DQo+ID4NCj4gPiBTb3JyeSBJIG92ZXJsb29rZWQgdGhpcyBjb21tZW50LCBjb3JyZWN0IG1lIGlm
IEkgYW0gd3JvbmcsIGJ1dCBJSVVDIHdlDQo+ID4gY2FuIG9ubHkgcHJlLXNldCB0aGUgMkQgYXJy
YXkgdG8gMCBhdCB0aGUgY29tcGlsZSB0aW1lLiBDb3VsZCB5b3UgcGxlYXNlDQo+ID4gZWxhYm9y
YXRlIGEgYml0IG1vcmUgYWJvdXQgdGhlIGNvZGUgaW4geW91ciBtaW5kPyBUaGFua3MhDQo+IA0K
PiBzdGF0aWMgdW5zaWduZWQgY2hhciBfX3JvX2FmdGVyX2luaXQNCj4gbm9kZV9kaXN0YW5jZV9t
YXBbTUFYX05VTU5PREVTXVtNQVhfTlVNTk9ERVNdID0gew0KPiAgICAgWzAgLi4uIE1BWF9OVU1O
T0RFUyAtIDFdID0geyBbMCAuLi4gTUFYX05VTU5PREVTIC0gMV0gPQ0KPiBOVU1BX05PX0RJU1RB
TkNFIH0NCj4gfTsNCj4gDQo+IG9yIGV2ZW4gKGxpbWl0aW5nIHJlZHVuZGFuY3kgYSBsaXR0bGUp
DQo+IA0KPiBzdGF0aWMgdW5zaWduZWQgY2hhciBfX3JvX2FmdGVyX2luaXQNCj4gbm9kZV9kaXN0
YW5jZV9tYXBbXVtNQVhfTlVNTk9ERVNdID0gew0KPiAgICAgWzAgLi4uIE1BWF9OVU1OT0RFUyAt
IDFdID0geyBbMCAuLi4gTUFYX05VTU5PREVTIC0gMV0gPQ0KPiBOVU1BX05PX0RJU1RBTkNFIH0N
Cj4gfTsNCg0KWWVhaCB5b3UgYXJlIGNvcnJlY3QuIEkgbWFkZSBhIG1pc3Rha2UgdGhhdCBtaXNz
aW5nIHRoZQ0KIlswIC4uLiBNQVhfTlVNTk9ERVMgLSAxXSIgaW4gdGhlIGxlZnQgc2lkZSBvZiAi
PSIgaGVuY2UgbXkgY29tcGlsZXINCmNvbXBsYWluZWQuLi4gVGhhbmtzIGZvciB5b3VyIHBhdGll
bmNlLg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBKYW4NCg==

