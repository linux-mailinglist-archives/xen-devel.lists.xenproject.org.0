Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB086EDDEB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 10:26:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525875.817370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prE0U-0003lP-5y; Tue, 25 Apr 2023 08:26:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525875.817370; Tue, 25 Apr 2023 08:26:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prE0U-0003io-3A; Tue, 25 Apr 2023 08:26:38 +0000
Received: by outflank-mailman (input) for mailman id 525875;
 Tue, 25 Apr 2023 08:26:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xGP=AQ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1prE0S-0003ii-2i
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 08:26:36 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe13::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e28411e7-e342-11ed-8611-37d641c3527e;
 Tue, 25 Apr 2023 10:26:33 +0200 (CEST)
Received: from DU2PR04CA0178.eurprd04.prod.outlook.com (2603:10a6:10:2b0::33)
 by GV2PR08MB9278.eurprd08.prod.outlook.com (2603:10a6:150:d9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Tue, 25 Apr
 2023 08:26:30 +0000
Received: from DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::60) by DU2PR04CA0178.outlook.office365.com
 (2603:10a6:10:2b0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34 via Frontend
 Transport; Tue, 25 Apr 2023 08:26:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT054.mail.protection.outlook.com (100.127.142.218) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.20 via Frontend Transport; Tue, 25 Apr 2023 08:26:30 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Tue, 25 Apr 2023 08:26:30 +0000
Received: from 5dd4d10e891f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 477280AE-0E8D-4396-955F-1D0F3C144578.1; 
 Tue, 25 Apr 2023 08:26:24 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5dd4d10e891f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Apr 2023 08:26:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS4PR08MB7904.eurprd08.prod.outlook.com (2603:10a6:20b:51f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 08:26:19 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 08:26:19 +0000
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
X-Inumbo-ID: e28411e7-e342-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ew55h3Vy9ekmQe3Hh6t5Kw5P88pW2WZD7F4/8+FfPWA=;
 b=GredgnArhFHlRmDoyr+MRLBceAP15F9ZfAxt0UoABarO3/jzkX2QoO/t2KipkCmi96/hIhhj3SSAtQRsMPbtrTZIThITcIsaahApSdoKGfadQbgMPRzV9BCHsTY7/tqL3fTi01ham0fD2grRTSWbaATNf+G3U5klBleKrNAmfQU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKDlecFhgg4LyS886cD/jrP5mjQEwHLUTR2T+6pBsltV1EI0znT/B2WDBzBy5hFBhTgwglXNQ4quPuhRYXMgqH6C6BrQonkLMYr/B39qKslKlD8vNUTXI6LT5xGTvryykjZAVAClGMfF43It3wP9h5tVq8rTR/t55y3ED5dyz/ZanF+5Y28VagpluWb8gr9fIgYIR13UNst9EJJWMWgDjAwsqBlB+omp6emBhAWUQ38eelCgwKINQMoB4rk6ESpVazaU+Cct6bSROEfTT6e+kB8IFMvrEz3ArCGiLb3XQxKtqq5k6o65BnfSBryEv1GeVafMa5AP/nqTydUYGlTLpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ew55h3Vy9ekmQe3Hh6t5Kw5P88pW2WZD7F4/8+FfPWA=;
 b=CdkgZBf1W2HM8lx8GFhuXaUt7xz+pEYDOXqACLXI+6F1gIZSxl6e66bowQgde0cENLUEbGTwGDat1Iz+pvJskMfahkKbxtKirfo4c8DpxF50MAYLBtrzjMnaQCnm8lJKRsGyqV19tQTryRt/sAnhNdvp/kPLLQh2q/BBu+ASF9e2SqUieakwbu21Na5E2EdWdBgZnUcbiVUnie4zh6dqemr3ngLZr58bTJfdgbOj1PZAhfOe8poo1m5wT5Aj/k+ukDPwV+I8c39PX2dzqMHEMv7KOCXJkpjonhFQuA5p76md++z2l6CII91PjTe6ONn/BTPxO1N8Z+OtepqPW+YcAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ew55h3Vy9ekmQe3Hh6t5Kw5P88pW2WZD7F4/8+FfPWA=;
 b=GredgnArhFHlRmDoyr+MRLBceAP15F9ZfAxt0UoABarO3/jzkX2QoO/t2KipkCmi96/hIhhj3SSAtQRsMPbtrTZIThITcIsaahApSdoKGfadQbgMPRzV9BCHsTY7/tqL3fTi01ham0fD2grRTSWbaATNf+G3U5klBleKrNAmfQU=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 07/17] xen/arm: introduce a helper to parse device tree
 processor node
Thread-Topic: [PATCH v4 07/17] xen/arm: introduce a helper to parse device
 tree processor node
Thread-Index: AQHZd0ufawBJr94Nqk2Kxm6Mb2Kjtq87ruWAgAAAlXA=
Date: Tue, 25 Apr 2023 08:26:19 +0000
Message-ID:
 <AS8PR08MB7991CBEDDE9F0B0EC0F8B86092649@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-8-Henry.Wang@arm.com>
 <8ce925a1-dadd-79c3-3b0f-c3ab45b1a669@suse.com>
In-Reply-To: <8ce925a1-dadd-79c3-3b0f-c3ab45b1a669@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4A2618C576249E408050BFE7E4C45171.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS4PR08MB7904:EE_|DBAEUR03FT054:EE_|GV2PR08MB9278:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a559cc-0118-4efa-355f-08db4566c561
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YuMRyfiNh8UwQ2FWPdEugOIvT6FJ3FDGTeGXFnYbZE0h+hoEAnAk5A+lCw8evXK0CljfNhK+8h1lo9ClVun57sJFgF5vQjZN4Un4l4y0pT6sDamS6ao3CHrljqRwe9RgryQeep91QOfB/3F+GJsiRYL8nPv3dFFzfGmha0AM+GQbFriKZVki3YpGA7TtIGdnDz7kGq+u3W1PNbR3lVnOE5PQdpay2xzT2uqgBBZig56BBPJCshhHLy9mopMOp2zSPaNgNz2wVoqhQkMpAmLkFF3ElyUb1kN81XWHMscNMDV5ssaY6CCSGTJf5l6Ww8xeYV47jrME7Rp+AGY3U4Wj1X2tgcvSJuCRnogXUQsBv4WD7BnyvJ2avCtu+2AekngYsrDSWdTdnkIu8Cai37YwUPrxTktpdW4JnAooOgTcCvZUajqcc6wMgdntwHvq/uDrFj/sqVCGmi5uBjOa8ZtXK4RtDV6lpdvK+T7HKCWyKHnNVdq3mBVYeX9x0jji5VVB1NW3GWjxqjPkIFWxqgRio6ufVJTQEt/QnhrCkxZ+mOmjR9hjLekV/4EdVnwiwiBl6Mdzb0075tUbZOJGkwDcVeqQD9ZmkKxodUMTS1RxkWzJIsAfFOFPdBNpWqMuFD04
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(451199021)(38100700002)(122000001)(6506007)(9686003)(26005)(55016003)(186003)(8936002)(83380400001)(33656002)(4744005)(2906002)(8676002)(52536014)(5660300002)(478600001)(54906003)(7696005)(71200400001)(38070700005)(316002)(4326008)(6916009)(66556008)(76116006)(64756008)(41300700001)(66446008)(66946007)(86362001)(66476007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7904
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	31c533c1-e833-475c-6e94-08db4566bee9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y86NQp7eFAnfoodh21BwfIqvZKC1m6Ssn5ERuRLcwqg1X6W01iPxFgIEsrSH2OqkP4n9cpaYFyMdjRGQPOofksD3LoWASYQ5MNgpXIs3PXhEjvyWRyOCO+jnS6CO/TH1zHbsytOxbOxlrW9XtaRX/2mneUW1UrbL0juG6db7pfI4/+64MineKJ1O2SnZdtsop/3Mo3micMOU05O5dSxdjiuVwNHFe8k042hBsNtkqu9+F919Xr5a3jR7EQZOFEyJPEB4XBlVidtQq0jcqD3RVt8FXN5TMwjhGugYnfdKqsAmL2iv9ii8zXvg3YCOCQRPpavsC6zOMt2WbVXynWhkkdp+juZyjj572yrcysnm52mCWLEysyzBw7v6K7ZzEKR+6KaZ7TzZQoNwHI2iOJ5AAIvHc1cTsJnpy3kQ1UBXnvYK7sntRHXWjjzw+CVueRlUk0szt3DGZXcR/is6OHqU0sqRmgYI0eaSHKvZtP4aWwofeA3UXL1g3HO4dWkqyCyg3Oiw80nqN+NfKFBDCTY13rS5QsaWSgK4tRho7mRxtAge6Vf0ESU/jOrtW32i6wg9xKo7LLECtW52KjzRYe831H4xVV5aBlMgpGTcIpV5Q9iOr/ZwcNBMADP9extzm9GrzAVV5M0xORDhBFoy/AG9TKp/hiQNx5cGCH+yFq1ikClJOWA9W36AgyM8OZ6nDFJAiPIyDC3bjEyoKxmShwZ3BQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199021)(46966006)(40470700004)(36840700001)(54906003)(478600001)(40460700003)(5660300002)(52536014)(8936002)(8676002)(6862004)(2906002)(4744005)(86362001)(33656002)(82310400005)(40480700001)(55016003)(4326008)(82740400003)(316002)(70206006)(70586007)(356005)(41300700001)(81166007)(336012)(186003)(36860700001)(26005)(6506007)(9686003)(83380400001)(7696005)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 08:26:30.3520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a559cc-0118-4efa-355f-08db4566c561
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9278

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAwNy8xN10g
eGVuL2FybTogaW50cm9kdWNlIGEgaGVscGVyIHRvIHBhcnNlIGRldmljZQ0KPiB0cmVlIHByb2Nl
c3NvciBub2RlDQo+IA0KPiA+ICB4ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jIHwgNjQN
Cj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDQgZmlsZXMgY2hhbmdl
ZCwgNzQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHhlbi9hcmNoL2FybS9udW1hX2RldmljZV90cmVlLmMNCj4gDQo+IEFzIGFza2VkIGZvciBp
biB2YXJpb3VzIG90aGVyIGNvbnRleHRzLCBtYXkgSSBwbGVhc2UgYXNrIHRoYXQgbmV3IGZpbGVz
DQo+IHByZWZlciBkYXNoZXMgb3ZlciB1bmRlcnNjb3JlcyBpbiB0aGVpciBuYW1lcz8gQWRkaXRp
b25hbGx5IHNob3J0IGJ1dA0KPiBzdGlsbCBkZXNjcmlwdGl2ZSBuYW1lcyBhcmUgaW1vIHRvIGJl
IGdlbmVyYWxseSBwcmVmZXJyZWQ7IGluIHRoZSBjYXNlDQo+IGhlcmUgaG93IGFib3V0IG51bWEt
ZHQuYz8NCg0KU291bmRzIGdvb2QgdG8gbWUuIEkgd2lsbCBmb2xsb3cgeW91ciBzdWdnZXN0aW9u
IGlmIHRoZXJlIHdpbGwgYmUgbm8NCmV4cGxpY2l0IG9iamVjdGlvbiBmcm9tIG90aGVyIG1haW50
YWluZXJzLiBUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uDQphcyBhbHdheXMgOikNCg0KS2luZCBy
ZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gSmFuDQo=

