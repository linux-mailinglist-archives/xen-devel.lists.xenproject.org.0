Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D49CA5AED57
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 16:31:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399924.641337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVZb7-0005xt-Ve; Tue, 06 Sep 2022 14:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399924.641337; Tue, 06 Sep 2022 14:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVZb7-0005vP-Ry; Tue, 06 Sep 2022 14:30:41 +0000
Received: by outflank-mailman (input) for mailman id 399924;
 Tue, 06 Sep 2022 14:30:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Bts=ZJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oVZb6-0005vJ-Mz
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 14:30:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80082.outbound.protection.outlook.com [40.107.8.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a649ed7-2df0-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 16:30:39 +0200 (CEST)
Received: from AS9PR04CA0160.eurprd04.prod.outlook.com (2603:10a6:20b:530::28)
 by AM9PR08MB6145.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Tue, 6 Sep
 2022 14:30:37 +0000
Received: from AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:530:cafe::17) by AS9PR04CA0160.outlook.office365.com
 (2603:10a6:20b:530::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18 via Frontend
 Transport; Tue, 6 Sep 2022 14:30:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT047.mail.protection.outlook.com (100.127.140.69) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 14:30:35 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Tue, 06 Sep 2022 14:30:35 +0000
Received: from a308c48dd9b1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E39CB183-FF5D-4EC4-948F-F4BFA95AD3AB.1; 
 Tue, 06 Sep 2022 14:30:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a308c48dd9b1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Sep 2022 14:30:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB8745.eurprd08.prod.outlook.com (2603:10a6:20b:55d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 14:30:27 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Tue, 6 Sep 2022
 14:30:27 +0000
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
X-Inumbo-ID: 7a649ed7-2df0-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NowjZdoPxQ9RUEE7cYxQR1Kx2LlPZnUswwaXumMrGE9hCVrUUFw+KwoSpL4EXgrFynJWQBCga9oDAoXOa0Yto4J96tvRQ/iFWdv9Z5c++F62fueqK8Iwdj5QCLLPl8RuSSw70lZJYqRIcFIr5s0gXb4v2HcUchA0ml3rHhnMNzSUJ/scgt71AWU/bIMNM/Gdj7306yE0Mp0b9jZ1lIIlk0Vz2ys+gbtNl92OQdIc2yUOSoA2qHVXcQ8sAPBQc8zYs5Vuiwdh9Ytn67cfKrU5AvaHvNjhLG/tdJx/QO3P0OTGdpF/tQ2Giwk+xCoRPj8sjQ7xknzc+v4ZizIWikctHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYrRyGRwB/wh2JUK5OtpOX1GoOrTZc0vCS1+BzEN9bc=;
 b=Gp1LB25Es6QlPN0rMpLEZLk8i3EifTAUjLIjXDYVQ9N9933UX3rwuB4C6p+9n6KXBjlg6sxVojC1pXHKR7BSeoY3pBswOSw3mgC76K2QhsMQjRh0jzd/R/U5T2anTM+SEQdqphQK6mkgAptz4RjKkZOduwvVZgN9NamFjTAml9ldtbNbTofZR+xX9fQj5vtWkC0HIaES/SsKZyIu9QH7SRszQPIEqP2moC9/rnMvFcf9vvgvtiSYXElLBksSjaozwN35M88MrHxHNnO55btc5UPNhl8ABv+2dWneaQ04CcTHfDe8XhRQ+yokOc6bCtV0zuCQQuo5sM0OtwcvQ60i4Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYrRyGRwB/wh2JUK5OtpOX1GoOrTZc0vCS1+BzEN9bc=;
 b=9CM9PRkbD+NQA1v/DG8z2FDSuuJB4okDnKs9RJQQgMjyKzaEgM2zBz+v6uevPmBL07BvbmWlgwvNh2TTlNtgbMVVDE1nXHeYiGnYJMZkpex2zSYTzaQyxl2Ln5cXgn4Xk7EczGHPWchfyQhXOLZF2Yhb1piI/9pORhcY6bjzPLM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aw7SiJ7DcIhlMK3EGma/dLveikmvRJ2qonXEvyNNicaStnQMSFVZb3+FcRYNnl4M4iya7p9ahW9QZRZDit5IoJqzEPt2eXuJTfZJGfXW5PDeocWO27v/vbk7XvyteONlfPFmBsd7Mbpj28AMlyVlSn7aslrP5pnMn0wQD7AczLRiwq44qTM5dlUE1t3wbpeuo1eGN/EpPMo3LXLPWJ1x4Yfgo6yJBy00wTdHESB7MMEWgwTgNNqFXie2HjNK1lOfwU8sTNz45lrFKQeDqABIWi1fRtXhnWRhkDSbFvMVKbYOMf9v5wryDOCHN8zAfyl9+qJyoNBp/46WAzmp9TevLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYrRyGRwB/wh2JUK5OtpOX1GoOrTZc0vCS1+BzEN9bc=;
 b=CMIS9sNdsEPxXJxe+vzHTEIj9So2e3TiH76+K7VC08mexiL5JFUqWtyZCgsk6yQm8oM6B3G1px/gM9njy9UrWo8qEdwPwo6t+/GEZUKzpl6LZpQ3lcAbcNgBpCQUYNl4HLqe4WpCFirz9vpcptxiYvbU8R3HUAe/YdpYjKWSdV0DKPs9Y/1wD80P+9I8Tu6S/EaqdXwiMoTId46GQN35I0vmPDMv2g9e3F3/oArPrWZKSUh6J75Op5gcCStY+QBeJqCuqm/uZYkAHnKu23EQQKteuPDb4sG177DBmxhFDaXw7WLYGm1lAdYUXE+qqJ5vr9Yn9lcjudb1+3dq5PXF7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYrRyGRwB/wh2JUK5OtpOX1GoOrTZc0vCS1+BzEN9bc=;
 b=9CM9PRkbD+NQA1v/DG8z2FDSuuJB4okDnKs9RJQQgMjyKzaEgM2zBz+v6uevPmBL07BvbmWlgwvNh2TTlNtgbMVVDE1nXHeYiGnYJMZkpex2zSYTzaQyxl2Ln5cXgn4Xk7EczGHPWchfyQhXOLZF2Yhb1piI/9pORhcY6bjzPLM=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jennifer Herbert
	<jennifer.herbert@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"wl@xen.org" <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Anthony
 PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [for-4.17 PATCH] acpi: Add TPM2 interface definition and make the
 TPM version configurable.
Thread-Topic: [for-4.17 PATCH] acpi: Add TPM2 interface definition and make
 the TPM version configurable.
Thread-Index: AQHYwfulNVt1Od0JyUqnzZeYC4k2ya3SdSuw
Date: Tue, 6 Sep 2022 14:30:27 +0000
Message-ID:
 <AS8PR08MB799126FFBF4F3012B2EBF32D927E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220830202706.1618386-1-jennifer.herbert@citrix.com>
 <0548fa97-5384-94e4-7329-b019e60555f4@citrix.com>
In-Reply-To: <0548fa97-5384-94e4-7329-b019e60555f4@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D1C06505EC665B4C916BD6A615069347.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c9fda72e-436a-46eb-c4a8-08da90145cf6
x-ms-traffictypediagnostic:
	AS2PR08MB8745:EE_|AM7EUR03FT047:EE_|AM9PR08MB6145:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 D/pX6qA89XrlGyUHxtGLlM3ltoe1rpuHGUrJU2ArtefsUG5FdB1WaBLj1HLY0UB0mtIIm4hYVNpztc2uumF/B5jPJ5sR8zATyebVM+Qjdjmzv80yZonLimxF/EWQspI506N++5pqZamExnz7LGIuRXFwhYtRkoig6RKwU/hOQr6tJzKRa83DfwM1bSl08AMZrEF5JySQfXnUaeyW2oMlKC3+CRXjKEs7uusdGGTCzG//bytPRk8qSTk8wYjufe2sA4Tyvd1rRVrr22zvAzUcTCPQpOdn8HnLwgnbefW40Na3LOED8y2uYuG4oyp3edVAdhnq6T1P0LF0hxZsiniMkIU8e9kHVTOaPSmEEeAnHX/TxTg/re45e0hrUzTEQYNgmNH64vT3E0n0ANtABtXS093g3lVGh1cZwk7GaHxkzEtK+Q350ljcSoNnhC4XxRh9sR6g/k/dY6/T1a1f9vsWPo39T15R725WLNPOD9EYWwwW+liPBPcTfbEu/Vai+C86KJimH03yjYcdYKVJlsu+3TG90ICGI28013jwCJ2TwyhznTPMhEFsNtZ06HOlL+KgaF455l/F86liHmPUa/Wr4gsX0Mi9E4JC22KVPJtkJ8hreWnaSJC0DMqtc0LuKyUYSga3uP7Urz+kE3AWHmJMxq/toITKERFuRv+4brT9IAHK4Wk0nQ/PvjQWfbKepxfcI2t8/OIBubyltgRtCwM7eJoPhb+aOb+z/vSEpyOMtwLYPMXBUhmUFJu4fjPYRYBnC3fm2NsA/pN+dE67GZcDMQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(186003)(316002)(38070700005)(38100700002)(66946007)(66556008)(66476007)(9686003)(66446008)(83380400001)(26005)(110136005)(4326008)(76116006)(8676002)(52536014)(7696005)(41300700001)(53546011)(64756008)(5660300002)(71200400001)(8936002)(86362001)(6506007)(55016003)(2906002)(122000001)(33656002)(478600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8745
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	442ff8cd-67ee-43c1-cc33-08da901457c7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HIhEwqa9AJey6oHycLr5Wka02f0/OXUOXsM54vwNFo6emhyRgRQZcFtfAWDL0qR5FJzGsNMotA+bkyFz7dud6RUY2YE1LfGze6vOLE3ARpQ78pdbYQ/MtxzjMhwrX9Li0AC/ByWXk0yxdA6rQ1/vGn/nTZzrH0O8nzJnSTS5EuZef1wMMUzj+vYh+XORPdkenV05c9d6BHJF2n18aSb8/LG3hSpeMBnCshjKN643bngcLcF678zTrQmTOUU3BzSjqZ+7DwUDYN5CU3iBz8DRm65NzUPG5pO0ZFSGFMHrSFPTiHNLPrXXmJH5zzthHMNYblm0Mmk6sxJeHkVIe6KmEIm3KNk7TqszvklDzWMnbYviO3a0s8WrroX5NUp1oPCT4SqCVHdePYtFTdk3mz8eD951qtdOzqTA4kHoR9tumCt+2/hy+MlEZ1aXONdM4ALArF9bg5cAlEbpmCiCvVIv5sEFgEhAbkFgKD/4s/ld4IuQH1uJlAnOEoZyZ9z8dlLiIRnQy1XzvnKD1HGCqCmLr8KIghDhuNPyRws5m1klXyLMnqsIaJd32aIWJnJao9MP6ACiY6xbkcHqIaHBAfz7hV0IXrjZUwUFv/iYt8iWboOadguoBMBMbILA+pc0n9adiqbimZBiVOCMgAcJZVEA38XzwcZD0wW/d273+VNAgCL/GlloMDvJxK5ny8QPwOsfJ8Toz2QNRMimwKw6UCHL5Nd1KUPt+oBc7kT2qN90eMXtF2Er3OSyIXIXVkr+0+VSH8KqpQux/3f61ds58hIsCg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(396003)(39860400002)(40470700004)(36840700001)(46966006)(8936002)(5660300002)(36860700001)(33656002)(2906002)(55016003)(52536014)(83380400001)(8676002)(40460700003)(82740400003)(40480700001)(4326008)(70586007)(70206006)(110136005)(316002)(86362001)(82310400005)(47076005)(81166007)(336012)(6506007)(26005)(186003)(41300700001)(356005)(478600001)(9686003)(7696005)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 14:30:35.9299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9fda72e-436a-46eb-c4a8-08da90145cf6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6145

SGkgQW5kcmV3LA0KDQooKyBBbnRob255IGFzIEkgYmVsaWV2ZSBoZSBpcyB0aGUgdG9vbHN0YWNr
IG1haW50YWluZXIpDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5k
cmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtm
b3ItNC4xNyBQQVRDSF0gYWNwaTogQWRkIFRQTTIgaW50ZXJmYWNlIGRlZmluaXRpb24gYW5kIG1h
a2UNCj4gdGhlIFRQTSB2ZXJzaW9uIGNvbmZpZ3VyYWJsZS4NCj4gDQo+IE9uIDMwLzA4LzIwMjIg
MjE6MjcsIEplbm5pZmVyIEhlcmJlcnQgd3JvdGU6DQo+ID4gVGhpcyBwYXRjaCBpbnRyb2R1Y2Vz
IGFuIG9wdGlvbmFsIFRQTSAyIGludGVyZmFjZSBkZWZpbml0aW9uIHRvIHRoZSBBQ1BJDQo+IHRh
YmxlLA0KPiA+IHdoaWNoIGlzIHRvIGJlIHVzZWQgYXMgcGFydCBvZiBhIHZUUE0gMiBpbXBsZW1l
bnRhdGlvbi4NCj4gPiBUbyBlbmFibGUgdGhlIG5ldyBpbnRlcmZhY2UgLSBJIGhhdmUgbWFkZSB0
aGUgVFBNIGludGVyZmFjZSB2ZXJzaW9uDQo+ID4gY29uZmlndXJhYmxlIGluIHRoZSBhY3BpX2Nv
bmZpZywgd2l0aCB0aGUgZGVmYXVsdCBiZWluZyB0aGUgZXhpc3RpbmcNCj4gMS4yLihUQ1BBKQ0K
PiA+IEkgaGF2ZSBhbHNvIGFkZGVkIHRvIGh2bWxvYWRlciBhbiBvcHRpb24gdG8gdXRpbGlzZSB0
aGlzIG5ldyBjb25maWcsIHdoaWNoDQo+IGNhbg0KPiA+IGJlIHRyaWdnZXJlZCBieSBzZXR0aW5n
IHRoZSBwbGF0Zm9ybS90cG1fdmVyaW9uIHhlbnN0b3JlIGtleS4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEplbm5pZmVyIEhlcmJlcnQgPGplbm5pZmVyLmhlcmJlcnRAY2l0cml4LmNvbT4NCj4g
DQo+IFdlJ3JlIHBhc3QgdGhlIDQuMTcgZmVhdHVyZSBzdWJtaXNzaW9uIGRlYWRsaW5lLsKgIEND
J2luZyBIZW5yeS4NCj4gDQo+IEhlbnJ5OiBUaGlzIGlzIGEgZmFpcmx5IHNpbXBsZSBjaGFuZ2Ug
YW5kIGEgY3JpdGljYWwgYnVpbGRpbmcgYmxvY2sgZm9yDQo+IGdldHRpbmcgV2luZG93cyAxMSBz
dXBwb3J0IG9uIFhlbi7CoCBHaXZlbiB0aGF0IGZlYXR1cmUgZnJlZXplIHdhcw0KPiBzbGlwcGVk
IHNldmVyYWwgd2Vla3MgZm9yIG90aGVyIHJlYXNvbnMsIHRoaXMgc2hvdWxkIGJlIGNvbnNpZGVy
ZWQgZm9yDQo+IGluY2x1c2lvbiB0b28uDQoNCldlIGRlbGF5ZWQgdGhlIGZlYXR1cmUgZnJlZXpl
IHRvIHRoaXMgRnJpZGF5LiBTbyBpdCBhY3R1YWxseSBkZXBlbmRzIG9uDQppZiB3ZSBjYW4gaGF2
ZSBlbm91Z2ggYmFuZHdpZHRoIGZvciBtYWludGFpbmVycyB0byBwcm92aWRlIGZlZWRiYWNrDQph
bmQgaWYgSmVubmlmZXIgY2FuIGZpeCB0aGVtIGluIHRpbWUuDQoNCktpbmQgcmVnYXJkcywNCkhl
bnJ5DQo=

