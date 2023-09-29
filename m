Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A03987B381F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 18:50:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610638.950103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmGh5-0006zw-SM; Fri, 29 Sep 2023 16:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610638.950103; Fri, 29 Sep 2023 16:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmGh5-0006xE-PH; Fri, 29 Sep 2023 16:50:23 +0000
Received: by outflank-mailman (input) for mailman id 610638;
 Fri, 29 Sep 2023 16:50:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JGVc=FN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qmGh4-0006x8-B7
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 16:50:22 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46084e48-5ee8-11ee-878c-cb3800f73035;
 Fri, 29 Sep 2023 18:50:20 +0200 (CEST)
Received: from DB8PR03CA0025.eurprd03.prod.outlook.com (2603:10a6:10:be::38)
 by DB9PR08MB6684.eurprd08.prod.outlook.com (2603:10a6:10:26d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 16:50:16 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::80) by DB8PR03CA0025.outlook.office365.com
 (2603:10a6:10:be::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26 via Frontend
 Transport; Fri, 29 Sep 2023 16:50:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.15 via Frontend Transport; Fri, 29 Sep 2023 16:50:15 +0000
Received: ("Tessian outbound 6d14f3380669:v211");
 Fri, 29 Sep 2023 16:50:15 +0000
Received: from 9678217f690a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3DD5FF05-E79B-4C77-9233-ACBB3D9E6782.1; 
 Fri, 29 Sep 2023 16:49:44 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9678217f690a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 Sep 2023 16:49:44 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAWPR08MB9100.eurprd08.prod.outlook.com (2603:10a6:102:341::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 16:49:42 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404%4]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 16:49:41 +0000
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
X-Inumbo-ID: 46084e48-5ee8-11ee-878c-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7PvRLtURPRfUHdKaC3ynLf00Iq8JeFE1Je7gYdcfUA=;
 b=A7x+qR1KY1BVtI55oHm48uHPtjvBndOuoINj35jPrxAD7E3U5ab3/IrCGiwcUnfNwHUsJhmHQBHo5UG1ZlxnzXIx6VO6a2aaPyrW020FK+m4Cs8gd6ybPyj9o+QWM2r3Z5mlGeZ9WcxRc4xi9E8f3d2w4pbkeuojcr4Z0OYKIGc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a774492013e2920d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdsJOjblTCEOgGap7I32U5EeUO5mPjLKdurNroCxWtvz7E0/04uUBTSGctKGhX2YuV4DOZ4U2udOah1FyQeBEJthIFFe6zyBkxoRQm6QEHOi7eJac7gNr7rez1SRx1ZcSx4IhBgXIEC8LCMS8sn+he5hqirVzUBEzSMWK4ADWqZXCGS55zElH4P0AD1mZyuLHmCk/HP+NWn909bLwB9XFn2qvKWJz9Kp9CgCmR3P9BpN0zKJ6hjgtTbv8SuSvBufGe3U7meeUi9kt2hCHWON2gftB1xuVNiFtjq9gr59gtOBYb440Obewlgc9sayhZM4R6UbP8S8lUpnhuD2vJztpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7PvRLtURPRfUHdKaC3ynLf00Iq8JeFE1Je7gYdcfUA=;
 b=jtUvhIeYBeUQhjp+0lSJWQgWsQshYPh5TP+MQ4MGoYaXlzRjUMg0VnWMgb2fAXzGkS+CYG2vsVoP3SFsXPHzV0JOr2nOOJTOXCYs6cMtreFRLg89+elhoF0muTtExneSxeMaosKROFhy/WTZyM3k1T0Bh+1j8RPpNXDHTy7M8E0ZUAkT90SDI4MeaY95SQMdtD8oO+lixNs7EASCuFnvwDSTDRiVDXGr89jqfrrjtKS98OnPUF8yy1sFo5A7dIsV9cniz2HtNJBnn8St+kqdOe8PAPRO7OanG3/mpt+ul2mGIjXzqmXSCfyyuzcWOKYxJLeETNcEFdt37h2EwF09QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7PvRLtURPRfUHdKaC3ynLf00Iq8JeFE1Je7gYdcfUA=;
 b=A7x+qR1KY1BVtI55oHm48uHPtjvBndOuoINj35jPrxAD7E3U5ab3/IrCGiwcUnfNwHUsJhmHQBHo5UG1ZlxnzXIx6VO6a2aaPyrW020FK+m4Cs8gd6ybPyj9o+QWM2r3Z5mlGeZ9WcxRc4xi9E8f3d2w4pbkeuojcr4Z0OYKIGc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "michal.orzel@amd.com" <michal.orzel@amd.com>,
	"xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "consulting@bugseng.com"
	<consulting@bugseng.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Simone Ballarin
	<simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: Re: [XEN PATCH v2 0/3] docs/misra: add documentation skeleton to
 address MISRA C:2012 Dir 4.1
Thread-Topic: [XEN PATCH v2 0/3] docs/misra: add documentation skeleton to
 address MISRA C:2012 Dir 4.1
Thread-Index: AQHZ8uq6JQBfM1ccxUeWd6hakfVo37AyA/8A
Date: Fri, 29 Sep 2023 16:49:41 +0000
Message-ID: <4633BBCC-E0C9-4A93-8B26-D65C2DB65EFC@arm.com>
References: <cover.1695801813.git.nicola.vetrini@bugseng.com>
 <a8b3af7951ad68e02a25ea9347f9de4d@bugseng.com>
In-Reply-To: <a8b3af7951ad68e02a25ea9347f9de4d@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAWPR08MB9100:EE_|DBAEUR03FT010:EE_|DB9PR08MB6684:EE_
X-MS-Office365-Filtering-Correlation-Id: 25ba44b5-7b61-4267-9904-08dbc10c27cf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZLGFQkYFPSCwH6Fg9YUAEl2J1BFbsGOSpXQOSyfrcMhwOaUh12ssK9K3/GamnUU1xjwgEwLWkhFKXInLuc73k7bcJktmHzdv9fNiebV/AGbHD5nYtdJ6HAbKty9bEjdANN2M47Cx8GkTU3cIgI/NFKwe+jrnBaEHnHFwkfrucAQ7pKi2Rf/viueF42ByhP19q6dr4xS5fkdt38F4fkIajUwMQoCzTNV6C3oE1muBb+Bd+YTWwYQQUbMP57OFFK3KpBSa9ulE1IhPXGKBljaJHanfcKZV+nzNFEXhtv51rShbmOLsVdZKeIsWpYMHcu5bMF57wzQt8Rda5iCh0+TZO32fQ/e1Qz34EUcXoqIeUm11aaiQNt3+dcE59qc9vWLMuGonQv6Nwk17bcBfYtXMXMRPSpIIajTu5kSlpNoyCHEBn+8zX2o1WRT+MeRQwCjHVT2bi77q3fVBIwu2Sp0VgB5KofhdYEnS8Oys6AflzjBNw8/E8NbxoJVOCTdH3AR30oKXJTqbPxg8wp4nY0Xcmr1APvakhHBx2z+z4k7b9CtrbBp14FHTKxX8jFwL1y/EsnYf4niCHw3iUrRqbyduipIFNzQRlzgXSxSY0YtRuHNrYOGLtUbH32r3XgJinNTMpYGsh578MLwzk78f8vMIj7dhrLfemxFR0NDvoTadRMjkaJ4yX/3CAESzxlw62C8T
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(39860400002)(366004)(376002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6512007)(71200400001)(6506007)(83380400001)(122000001)(33656002)(86362001)(38100700002)(38070700005)(2616005)(36756003)(26005)(2906002)(5660300002)(4326008)(8676002)(8936002)(66556008)(66446008)(54906003)(64756008)(91956017)(66946007)(76116006)(6916009)(7416002)(41300700001)(316002)(6486002)(966005)(66476007)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC6879A234766B43942F37B8966E64B5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9100
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7674e479-2ca3-4629-c489-08dbc10c1374
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5LWUsmXKQ8j6L0/UHyZd4CTEDn5N+fdaHEmJPnxqcNzsvxhtHFJTohE+Jc+IB/u3H4Lp0RsQEmOiMdvoAnpjcVccxed/Al4TkPSz1rtXez5LADFaodrfYdenvlkmYdbh1yBZwr4sFmFpSMysKMH2RsbIMBE1jxZ34wMr7/PyPK3TXAPVAPfvA/I8+RqJQLPGrGHNlu+GTib7n49G2d1wwIzy/rk7knFuNsTlWQfdW2Z9Txqw/HyVC5Y3FRLN8omQ8ZEXNqlAQLA/jTNKxE18UsaBi97F34wWf2SmPmGfjuZPP23hxrfNdFa/xkrZo0pNwfZmnH1AGlXgmW7rjK/x3US1WpHQkiOAsrCn0XiLk8I7Hsj+MuUs6U+5XHLpKSlpu88X9/EpsDnYFDc5vUQZUxoIDwDFTX6d+B4Yech4Bj1dVSlrJyLUjHMs5tNIcOeHl/GHPm5o2rCOGNqMUFb4WrABAlncbxH+TNe6MR5ontR4uEkxBal6/jMh3pw+t++L7HiIQS9jWxOZT5e7+Ua33fR5CDAUCtVA7tf9oZcgsdrZI/dZVxzgsRUCert4g7Oft2dXC1nJtAcfP7aCF4ZGCVOomq2rvvm3T2prwDc+EX8LVuLcO4YP9CGjN3t2KLAhELQLB4zOkEq1gDaCMOKjAkf5qW3zMit0rhl8ho95KZXdzENBva5xSa1PFbiHE2lwgvBR2lDMxZgHGIqnhHKkOVq0cWv6pDIN0bpu1uB/NL/OmKMuiwD1gahdFBSXzf3iON7h99gPHJjW3mj0EGoSTg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(40460700003)(36860700001)(70586007)(316002)(54906003)(41300700001)(70206006)(47076005)(82740400003)(6862004)(8676002)(8936002)(356005)(81166007)(6506007)(6512007)(478600001)(966005)(26005)(6486002)(83380400001)(2616005)(336012)(4326008)(86362001)(2906002)(33656002)(5660300002)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 16:50:15.4742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ba44b5-7b61-4267-9904-08dbc10c27cf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6684

PiANCj4gQ0MtaW5nIEx1Y2EgYXMgd2VsbDoNCj4gSSdtIHRlc3RpbmcgdGhlIG5leHQgdmVyc2lv
biBvZiB0aGlzIHNlcmllcywgYW5kIEknbSBzZWVpbmcgYSBmYWlsdXJlIG9uIGNwcGNoZWNrDQo+
IGNvbnRhaW5lcnMgb24gdGhpcyBwaXBlbGluZSBbMV0uIEknbSBub3Qgc3VyZSBhYm91dCB3aGF0
IGlzIGNhdXNpbmcgdGhhdCBjb252ZXJzaW9uIHNjcmlwdA0KPiB0byBmYWlsLiBBbnkgcG9pbnRl
ciBpbiBkZWJ1Z2dpbmcgdGhpcyB3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lhdGVkLg0KPiANCj4g
WzFdIGh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvYnVnc2VuZy94ZW4vLS9w
aXBlbGluZXMvMTAyMDkxNzI4MA0KDQpIaSBOaWNvbGEsDQoNCkluIHRoZSBsb2dzIEkgY2FuIHNl
ZToNCg0KKyB4ZW4vc2NyaXB0cy94ZW4tYW5hbHlzaXMucHkgLS1ydW4tY3BwY2hlY2sgLS1jcHBj
aGVjay1taXNyYSAtLSAtajgwDQpObyBub3RlcyBmb3IgcnVsZSAyLjENCldBUk5JTkc6IENhbid0
IG9wZW4gL2J1aWxkcy94ZW4tcHJvamVjdC9wZW9wbGUvYnVnc2VuZy94ZW4veGVuL2RyaXZlcnMv
dmlkZW8vZm9udF84eDE0LmM6ICd1dGYtOCcgY29kZWMgY2FuJ3QgZGVjb2RlIGJ5dGUgMHg5ZiBp
biBwb3NpdGlvbiA3MjI4OiBpbnZhbGlkIHN0YXJ0IGJ5dGUNCldBUk5JTkc6IENhbid0IG9wZW4g
L2J1aWxkcy94ZW4tcHJvamVjdC9wZW9wbGUvYnVnc2VuZy94ZW4veGVuL2RyaXZlcnMvdmlkZW8v
Zm9udF84eDE2LmM6ICd1dGYtOCcgY29kZWMgY2FuJ3QgZGVjb2RlIGJ5dGUgMHg4MCBpbiBwb3Np
dGlvbiA1NDM2OiBpbnZhbGlkIHN0YXJ0IGJ5dGUNCldBUk5JTkc6IENhbid0IG9wZW4gL2J1aWxk
cy94ZW4tcHJvamVjdC9wZW9wbGUvYnVnc2VuZy94ZW4veGVuL2RyaXZlcnMvdmlkZW8vZm9udF84
eDguYzogJ3V0Zi04JyBjb2RlYyBjYW4ndCBkZWNvZGUgYnl0ZSAweDgwIGluIHBvc2l0aW9uIDQ0
MTA6IGludmFsaWQgc3RhcnQgYnl0ZQ0KRVJST1I6IEFuIGVycm9yIG9jY3VyZWQgd2hlbiBydW5u
aW5nOg0KL2J1aWxkcy94ZW4tcHJvamVjdC9wZW9wbGUvYnVnc2VuZy94ZW4veGVuL3Rvb2xzL2Nv
bnZlcnRfbWlzcmFfZG9jLnB5IC1pIC9idWlsZHMveGVuLXByb2plY3QvcGVvcGxlL2J1Z3Nlbmcv
eGVuL2RvY3MvbWlzcmEvcnVsZXMucnN0IC1vIC9idWlsZHMveGVuLXByb2plY3QvcGVvcGxlL2J1
Z3NlbmcveGVuL3hlbi9jcHBjaGVjay1taXNyYS50eHQgLWogL2J1aWxkcy94ZW4tcHJvamVjdC9w
ZW9wbGUvYnVnc2VuZy94ZW4veGVuL2NwcGNoZWNrLW1pc3JhLmpzb24NCg0KU28gSSB0aGluayB0
aGF0IHRoZSBydWxlcy5yc3QgZG9lc27igJl0IGhhdmUgdGhlIGV4cGVjdGVkIHN5bnRheCwgb24g
cGF0Y2ggMSB0cnkgdG8gbGVhdmUgdGhlIHRoaXJkIOKAmC3igJggb24gdGhlIHJ1bGUgMi4xOg0K
DQoqIC0gYERpciAyLjEgPGh0dHBzOi8vZ2l0bGFiLmNvbS9NSVNSQS9NSVNSQS1DL01JU1JBLUMt
MjAxMi9FeGFtcGxlLVN1aXRlLy0vYmxvYi9tYXN0ZXIvRF8wMl8wMS5jPmBfDQotIFJlcXVpcmVk
DQotIEFsbCBzb3VyY2UgZmlsZXMgc2hhbGwgY29tcGlsZSB3aXRob3V0IGFueSBjb21waWxhdGlv
biBlcnJvcnMNCi0NCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

