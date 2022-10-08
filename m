Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD285F81CF
	for <lists+xen-devel@lfdr.de>; Sat,  8 Oct 2022 03:13:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418390.663191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogyOB-0005Uu-FG; Sat, 08 Oct 2022 01:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418390.663191; Sat, 08 Oct 2022 01:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogyOB-0005SM-CK; Sat, 08 Oct 2022 01:12:27 +0000
Received: by outflank-mailman (input) for mailman id 418390;
 Sat, 08 Oct 2022 01:12:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XOy/=2J=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ogyO9-0005SG-By
 for xen-devel@lists.xenproject.org; Sat, 08 Oct 2022 01:12:25 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2087.outbound.protection.outlook.com [40.107.104.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42e1a11e-46a6-11ed-964a-05401a9f4f97;
 Sat, 08 Oct 2022 03:12:22 +0200 (CEST)
Received: from DU2PR04CA0052.eurprd04.prod.outlook.com (2603:10a6:10:234::27)
 by DU0PR08MB8812.eurprd08.prod.outlook.com (2603:10a6:10:47b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Sat, 8 Oct
 2022 01:12:20 +0000
Received: from DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::8a) by DU2PR04CA0052.outlook.office365.com
 (2603:10a6:10:234::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Sat, 8 Oct 2022 01:12:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT042.mail.protection.outlook.com (100.127.142.143) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Sat, 8 Oct 2022 01:12:20 +0000
Received: ("Tessian outbound 86cf7f935b1b:v128");
 Sat, 08 Oct 2022 01:12:19 +0000
Received: from eee54d568dfc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7B8521BD-FB8D-44C9-B043-B47B83BB864F.1; 
 Sat, 08 Oct 2022 01:12:14 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eee54d568dfc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 08 Oct 2022 01:12:14 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB5903.eurprd08.prod.outlook.com (2603:10a6:102:e9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Sat, 8 Oct
 2022 01:12:12 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a%3]) with mapi id 15.20.5676.038; Sat, 8 Oct 2022
 01:12:12 +0000
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
X-Inumbo-ID: 42e1a11e-46a6-11ed-964a-05401a9f4f97
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Dk1BAApvvglQJ0oO3vW/NVw36ozmpNNFpjbF4SJonU274khCN+uojKlcvHGt7LW3KJvoRWatuEibQC4aNq8JjIMHBp/T3MT5GdXadeIQ/E4Wq0OCxbfdNiOTxZPZr7mkiMhNz+cFGYAxM5Em+WUa+zA/wB0RFhB8P/rNub1DtBo5WzKz/0XDmVVWMmm2RI6j6RVGT6BfU8LAxWgDRR3mlklxyoqLgvxrBWac8h5LW4O0ovxitLxeFhTGrMUzlVAFOHpw6C2Ps94j+ThLdWYAK9vMgpcSWhbJBnHO9EBob/eNCGiZNL++zFSMYRkkbnAVX/NxqFxiNwxOCwWtZuiLjg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNxP3LEs07NmCGRCKog1G1IpJpiFJh5GDDGw6HO/dAM=;
 b=hqE8F07Esk0Vh7lYlpQ6OKnD4ZS+mjeF7U9VWsONgBV4OlMUo2kqZONA3ZLXGs5POHOKyFJlgacmcnzbfB+5L/O7cjPuV+qVlKz1JGK9zravX3T2kra9JgNLzNkecq2Nr7IJlchChJ7x8TMPt+jKo4oVCm0ZDcP66c++IhlVaolHelLcYRw/jpKMujo3fs+WdqNx4NRt1y4PCdLbgEI3dg8BSz0STq1KROFWyEAFkSXhD37LiO19iOEaAyJXdHEv4T30hPHUo2/xKcn+t6quSKWQI2esjtJgH5W4XeVWlal4SL9oRdLbELYAHZnja+tBEcV99Gav9fWGcIk97h7Shw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNxP3LEs07NmCGRCKog1G1IpJpiFJh5GDDGw6HO/dAM=;
 b=Q34HWwHa8gh6n1AzgtH7m7D1a/nrZkJV3CLtBuxW48AMkyquUOo7zW6t3UMjpRtrcSd2z0FOYeQ9iYQ3iimwezixlVXhfC8FdOImWUG1+sJwDzLL/ziZ3vMRorDjgf0bHfSl+yBLOGmFmDQg/vnAK9oA/6kgFdS6FS7dOrXpyzI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RakXG8oEmmmveUDD5Eav12WRBFNlzPiGGbRwugUVItJGwsXibEbMP2EB5SPLp1HtSHUPhd3/EPRlAdMOTIxgcBXJX1SIgc3a/IBzGmcg6PJyUpqm9f0U1vpSBJ2smt8X6igSJk6aaJeIGWsCc1ObCuQrjb4k6j8rf7UF12QxFLzwoBFmSZqsFbRCD1RJvUDu/Ew8p3K2SSzTT1KFq3G35PxM4iQMR9N/YVYq2VVJksrNLw9Sy25pkSKrDQjyOzqxN1Gsx2T3e6JW7qdr5WE/KRQCzJAdgbX91dfM72uuFCEoP+8vwB+ESOqFivuCOMkJiw3frS2tgu2TeX+mUUplkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNxP3LEs07NmCGRCKog1G1IpJpiFJh5GDDGw6HO/dAM=;
 b=O4BgjhcWsGK5oKKYpsbdSDK45n8M2vUVgnhjIUymQeaFx2yNZn6jnf1riuM+wjOdYDEKLMGqmAEezG9BIFHUhexomtIftFYPy6s4upKAx84ogNzfGskz0s1OXixd3A7hHuCKMXHKTEXf7quX9tPl82cG1JC13J5mof+0bQdD4v6HCZXdqvOD/xoeRwGILaf0GELab9qbgKHCmAzKlQaJTFrXWcd8pwM8n0Q8BdhHXjCuRBhuqDBQD5pS5dX26w/bhDO+K00I7PPckN026GaKfghm6WCNDv6s/QhC/vEh0p+gR/RrIs7hy2lZhIkFT9+L+jGtN/ZvJgwb6YEq79Ct5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNxP3LEs07NmCGRCKog1G1IpJpiFJh5GDDGw6HO/dAM=;
 b=Q34HWwHa8gh6n1AzgtH7m7D1a/nrZkJV3CLtBuxW48AMkyquUOo7zW6t3UMjpRtrcSd2z0FOYeQ9iYQ3iimwezixlVXhfC8FdOImWUG1+sJwDzLL/ziZ3vMRorDjgf0bHfSl+yBLOGmFmDQg/vnAK9oA/6kgFdS6FS7dOrXpyzI=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Christopher Clark <christopher.w.clark@gmail.com>
Subject: RE: [PATCH] argo: Remove reachable ASSERT_UNREACHABLE
Thread-Topic: [PATCH] argo: Remove reachable ASSERT_UNREACHABLE
Thread-Index: AQHY2oOIAk0kP8Ly4EylVwyMRp/g6q4DWdEAgABVmDA=
Date: Sat, 8 Oct 2022 01:12:12 +0000
Message-ID:
 <AS8PR08MB7991432FC3C0643161277930925E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221007193124.20322-1-jandryuk@gmail.com>
 <a4524dcc-36ce-267a-afbd-5785eab73882@citrix.com>
In-Reply-To: <a4524dcc-36ce-267a-afbd-5785eab73882@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E7CB587E436A3F4FB5C3AC36D395DE91.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA4PR08MB5903:EE_|DBAEUR03FT042:EE_|DU0PR08MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: e31faa46-caec-4ae6-2460-08daa8ca25ff
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SzEZGZ1TGj5Wv4t6jPVkgRRzofezulwKnAjWekJero2k+FOs9683tiRmI4Il7bk34khACdJAFwGMKsNx22St5bL8fe3M6hoEv6F4rPuFY4EJ9dWqSthDNeBDf+EO7GcQMWfMO+LtwLdAp7/qhrgltxmk9cWnPJdH0M16Tk57mNOpVjb0JPvcjLNTJD+JWFPXS9fqUWGNeFnBHuUwbHu/DR5a848bnvQYxw3mBUKaTVK1ew2dU/nFrS1mHIAb8meQEdjB6vjUOEihw923CMZHcTloyYinv74cP+xySTnveB8A9GtR3lIgpqsyIoZccB05Kz0fcyVJqcU3eGg8IXStDMj4o5MkXfkoPWuZyTDg8sT/tLU8NinSVXDgpyAUGeRXBbG2yRfgL29IwsbogpoeBHo1wrnuyQeDe/Gf7V9YpP0oolHmtzOUp0sTd/l5WPS6XuCw/VuW2AZ/8YPrUA6Kr4k/J9/MOR3YkWG34g1vCup2lq8NDFJOSH4zGULXIa4YHD4CpNrOsaOigxm8bW16pSw7GKdZl4AcUtU2Q6lJNfSBfNqi0q2JoA5kyeXA6cmWsAIUpYmplz1AwVhQyQAl+q+6iHOy5pSE3fTWNCl0eZ7kugBHTh4fWzPwEt6YE0JVfzsU9V/GreAHss4+eUVjSpJpydUV9ZAHCG8xljJLQM95ztYElvAdc7H0Dur4ITBJ0HqSqUAaTT+wfp64ldFHBFlaDmWRI2WwzFVldI48qmFk7brAJii4CskzPphKzl04WtMVvho1dPOdBd1gDeOZvjXMjKhAEXU6GzObESGYDo4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(9686003)(38100700002)(41300700001)(2906002)(478600001)(26005)(186003)(55016003)(71200400001)(122000001)(8936002)(52536014)(316002)(38070700005)(33656002)(53546011)(86362001)(6506007)(7696005)(110136005)(66446008)(66476007)(64756008)(76116006)(5660300002)(966005)(66556008)(66946007)(8676002)(4326008)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5903
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	43e5137a-8ec3-44e1-b46d-08daa8ca21ad
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C+t/s2BgvjmYbADfUIjBU41+Fp63qYJWdA0PhmFmvwA2/A9Eaym9BXkGQUX1S1l68xX8JsnEowscPpUr+Qsqd/aDIMkvhscPlZauhrXIx19hh3rHmrgw8zIpsh6mpcYfTJImKSbr/Q+YsO0SpkT33w91rzBRHX4eMlzRvwFUZftjYByJLES/cbb1mB+2JlswbaSCvY4lM/OsaMykLO5tBvF+z2wNafo4cGiPh2w1ttEJlzXwBUnWNdqjIvEfZ/boA/F9g3xlg2Zl8IAuKEiJGIbcfiBTgYl+lqoYDh08Jn7LzcWMvPSBsuMqF6oUuDkj6WeE/ALBWu4Qig6XtB7S9BgxSBwHuTGQWFlLj2LgT5rC5lkfm48KJgAShdfDoSwVfb/zIBdpuLPymrjX2jRI6rrW5wvDCtCBdKdc7f86RgPC/P5dNEE52qPr6nLncViXwhvqNJOtO5LEnSGAiqjjE0MkN9UGkcP/v9QV1gRNil8omNOHYlykfeHhy3fH4zfGEXHF4BUxXxMitB3YyK63x20YmB1AcJcAZ4IPn78AF6zSgrzqKOZeo2PlySCE1gmPZJSGx59p4vx9ygxrYPtgQ0yfQXR5FV0+WE0lH/1y9lgKzML2tVKBNrpZFk782K/INVPN/Z7bnTCS1uvENbXVfN0FWIoixe/BTr3rLnV9MH20KMFigp8T+Zff/7snvTJGATul6NHZ9hySYwh+6HNPAzMhS1LTCg2fLaJoXIRJupRLuJCvgVItz/FOqA047f21CO+S4XQyjhthMLtYIsDEHcHqjXTakW4JCQG9Puid+Hs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(4326008)(82310400005)(110136005)(33656002)(86362001)(356005)(81166007)(2906002)(5660300002)(82740400003)(52536014)(41300700001)(70206006)(8936002)(70586007)(8676002)(316002)(26005)(40480700001)(36860700001)(55016003)(47076005)(9686003)(186003)(83380400001)(336012)(40460700003)(53546011)(6506007)(966005)(107886003)(7696005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2022 01:12:20.0684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e31faa46-caec-4ae6-2460-08daa8ca25ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8812

SGkgQW5kcmV3IGFuZCBKYXNvbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIXSBhcmdvOiBSZW1vdmUgcmVhY2hhYmxlIEFTU0VSVF9VTlJFQUNIQUJMRQ0K
PiANCj4gT24gMDcvMTAvMjAyMiAyMDozMSwgSmFzb24gQW5kcnl1ayB3cm90ZToNCj4gPiBJIG9i
c2VydmVkIHRoaXMgQVNTRVJUX1VOUkVBQ0hBQkxFIGluIHBhcnRuZXJfcmluZ3NfcmVtb3ZlDQo+
IGNvbnNpc3RlbnRseQ0KPiA+IHRyaXAuICBJdCB3YXMgaW4gT3BlblhUIHdpdGggdGhlIHZpcHRh
YmxlcyBwYXRjaCBhcHBsaWVkLg0KPiA+DQo+ID4gZG9tMTAgc2h1dHMgZG93bi4NCj4gPiBkb203
IGlzIFJFSkVDVEVEIHNlbmRpbmcgdG8gZG9tMTAuDQo+ID4gZG9tNyBzaHV0cyBkb3duIGFuZCB0
aGlzIEFTU0VSVCB0cmlwcyBmb3IgZG9tMTAuDQo+ID4NCj4gPiBUaGUgYXJnb19zZW5kX2luZm8g
aGFzIGEgZG9taWQsIGJ1dCB0aGVyZSBpcyBubyByZWZjb3VudCB0YWtlbiBvbg0KPiA+IHRoZSBk
b21haW4uICBUaGVyZWZvcmUgaXQncyBub3QgYXBwcm9wcmlhdGUgdG8gQVNTRVJUIHRoYXQgdGhl
IGRvbWFpbg0KPiA+IGNhbiBiZSBsb29rZWQgdXAgdmlhIGRvbWlkLiAgUmVwbGFjZSB3aXRoIGEg
ZGVidWcgbWVzc2FnZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEphc29uIEFuZHJ5dWsgPGph
bmRyeXVrQGdtYWlsLmNvbT4NCj4gDQo+IFdlJ3JlIGludG8gdGhlIDQuMTcgcmVsZWFzZSBwcm9j
ZXNzIG5vdy7CoCBBIGJ1Z2ZpeCBsaWtlIHRoaXMgb2J2aW91c2x5DQo+IHNob3VsZCBiZSBjb25z
aWRlcmVkLCBidXQgd2lsbCBuZWVkIGFwcHJvdmFsIGZyb20gdGhlIHJlbGVhc2UgbWFuYWdlci4N
Cj4gQ0MgSGVucnkuDQoNCkFuZHJldzogVGhhbmtzIGZvciB0aGUgaW5mb3JtYXRpb24hDQoNCkph
c29uOiBXb3VsZCB5b3UgbWluZCBhZGRpbmcgYSAiRml4ZXM6IiB0YWcgZm9sbG93aW5nIHRoZSBy
dWxlIGRlc2NyaWJlZA0KaW4gWzFdPyBUaGFua3MgdmVyeSBtdWNoISBXaXRoIHRoaXMgdGFnIGFu
ZCBwcm9wZXIgcmV2aWV3L2FjayBmcm9tDQptYWludGFpbmVyczoNCg0KUmVsZWFzZS1hY2tlZC1i
eTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0KDQpbMV0gaHR0cHM6Ly94ZW5iaXRz
Lnhlbi5vcmcvZG9jcy91bnN0YWJsZS9wcm9jZXNzL3NlbmRpbmctcGF0Y2hlcy5odG1sI2ZpeGVz
DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IH5BbmRyZXcNCj4gDQo+ID4gLS0tDQo+
ID4gIHhlbi9jb21tb24vYXJnby5jIHwgMyArKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vYXJnby5jIGIveGVuL2NvbW1vbi9hcmdvLmMNCj4gPiBpbmRleCA3NDhiODcxNGQ2Li45NzNl
MWU5OTU2IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9jb21tb24vYXJnby5jDQo+ID4gKysrIGIveGVu
L2NvbW1vbi9hcmdvLmMNCj4gPiBAQCAtMTI5OCw3ICsxMjk4LDggQEAgcGFydG5lcl9yaW5nc19y
ZW1vdmUoc3RydWN0IGRvbWFpbiAqc3JjX2QpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgQVNT
RVJUX1VOUkVBQ0hBQkxFKCk7DQo+ID4gICAgICAgICAgICAgIH0NCj4gPiAgICAgICAgICAgICAg
ZWxzZQ0KPiA+IC0gICAgICAgICAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7DQo+ID4gKyAg
ICAgICAgICAgICAgICBhcmdvX2RwcmludGsoIiVwZCBoYXMgZW50cnkgZm9yIHN0YWxlIHBhcnRu
ZXIgZG9taWQgJWRcbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3JjX2Qs
IHNlbmRfaW5mby0+aWQuZG9tYWluX2lkKTsNCj4gPg0KPiA+ICAgICAgICAgICAgICBpZiAoIGRz
dF9kICkNCj4gPiAgICAgICAgICAgICAgICAgIHJjdV91bmxvY2tfZG9tYWluKGRzdF9kKTsNCg0K

