Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4B73386FA
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 08:58:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96878.183749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKcgZ-0007gL-Kt; Fri, 12 Mar 2021 07:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96878.183749; Fri, 12 Mar 2021 07:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKcgZ-0007fw-HT; Fri, 12 Mar 2021 07:58:15 +0000
Received: by outflank-mailman (input) for mailman id 96878;
 Fri, 12 Mar 2021 07:58:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YiLV=IK=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lKcgX-0007fo-EN
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 07:58:13 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::62a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7d64351-ef96-4cc5-a8d2-c8cbcfce4a86;
 Fri, 12 Mar 2021 07:58:11 +0000 (UTC)
Received: from AM5PR0202CA0010.eurprd02.prod.outlook.com
 (2603:10a6:203:69::20) by DB9PR08MB6844.eurprd08.prod.outlook.com
 (2603:10a6:10:2a6::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 07:58:09 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::d9) by AM5PR0202CA0010.outlook.office365.com
 (2603:10a6:203:69::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 07:58:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Fri, 12 Mar 2021 07:58:09 +0000
Received: ("Tessian outbound e7a0046930fb:v71");
 Fri, 12 Mar 2021 07:58:08 +0000
Received: from f2bd0746487e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4E1696EB-1BEC-45C5-8F10-3B514756F1D2.1; 
 Fri, 12 Mar 2021 07:58:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f2bd0746487e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 12 Mar 2021 07:58:03 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB4045.eurprd08.prod.outlook.com (2603:10a6:803:dd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.29; Fri, 12 Mar
 2021 07:58:01 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3912.030; Fri, 12 Mar 2021
 07:58:00 +0000
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
X-Inumbo-ID: b7d64351-ef96-4cc5-a8d2-c8cbcfce4a86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRHEgE2s3aK/DfilkpZqg2QbZfFmk6MMUG7VO5LcJ+I=;
 b=4MNHjQZRLgtM0rE/5NnPXYFdOXqBumoHM1QhC3CONxMM4+lV/bej+FiY1FQyUGNwLnPh56KwMAGiP9uMQOGjT9sEp/tuk/mt0Q8khrO0223VZKW858gX3MfQiqtiYTJxnFAs8Wh6KUQL2EfBxIhZSsKa3f21hmv3E0qT6p9SAiI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ead942b6c3717a04
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDPltf6DzK79ih4iKbgCxcWv/TiHgZwHq5YRDJcbbl07o8TiHacmsbmcKxRLkQz2iKdFDf+OASXsJ8wEWk834SWEGakAsNZvhNij8NLHPLp30NhgPlDqpD7Sn6EiwAwkGf7o5PdEJLu/68uqUZHJWAqHaduUUIT+v/pp+cp4ZoiJZMdUIW6Q2/TUZaqXKLfnYtjL1wiEiw2+ZgXwPajfdHSZpOkKI+MSnynTtspNCUEO2qw8pPVEQSjEKPBqUleXes6Mej0wL0QEPlofL7vSpR+svNnasGLP5TPbDxzT87MgaTHQPp5fENCgVJMh4RKZwF+sLqlxjBxxq+grqTZsyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRHEgE2s3aK/DfilkpZqg2QbZfFmk6MMUG7VO5LcJ+I=;
 b=jPJFx1pGnxGv9ikAlTMj08QBI0/+X7TIJrl/bAMUAS5tsiRQ7F6Bk2pHSylCchgfEgVJqmfZDcjjoJq5bB2NbzL9xpEUKKy/bUnjL15GlDfg97E2sA5/Tn2Y9XKEbikgwc65s3UP+3LXC6hmA4CARGLFHh3CM4hNaAMrFodNZHZVL9U/IuLbBsc3eHM74bkjKtBjefajHK/JkC1b+YoauZL4iyVKvF6ZE7IFYLlMNvVXqJsRwT4+IS08GJqP84s3ygE+jgrVwYrWGwNPZuB+4SXZUQ6AtATUgBYP8Obga2LNJN2iz/NLc4ZHR0wl3nmAtl8LbEJQxHr6VnmPwnEUlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRHEgE2s3aK/DfilkpZqg2QbZfFmk6MMUG7VO5LcJ+I=;
 b=4MNHjQZRLgtM0rE/5NnPXYFdOXqBumoHM1QhC3CONxMM4+lV/bej+FiY1FQyUGNwLnPh56KwMAGiP9uMQOGjT9sEp/tuk/mt0Q8khrO0223VZKW858gX3MfQiqtiYTJxnFAs8Wh6KUQL2EfBxIhZSsKa3f21hmv3E0qT6p9SAiI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 0/5] xen/arm: smmuv1: Fix stream match conflict issue
Thread-Topic: [PATCH 0/5] xen/arm: smmuv1: Fix stream match conflict issue
Thread-Index: AQHXFRDsfmQEpjwmUkeZqlC6XkDzOqqAALUA
Date: Fri, 12 Mar 2021 07:58:00 +0000
Message-ID: <40B7A7BD-6E2F-4493-A9FC-1BFFCBC237AF@arm.com>
References: <cover.1615312254.git.rahul.singh@arm.com>
In-Reply-To: <cover.1615312254.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [2a01:cb10:335:200:4546:4473:bf12:4b83]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1e17348a-2282-40d0-1b00-08d8e52c93a8
x-ms-traffictypediagnostic: VI1PR08MB4045:|DB9PR08MB6844:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB684431932875CB1A137923039D6F9@DB9PR08MB6844.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:972;OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XAuy//kdZrFyX2S7Kv13VGLIEnhQR50TKeTbQA7rcrwO9mChimega4D2F81Ql37RKp5vs2mPIXNs4RZRTdB67kPoKOkBKIKPj5wInn4RatV+L/XixmnKR1OjUrwu03fgtp4Z+on0JzAjU1vlX59oGDuga21rNTdzLHU1KGdud7hA5D0TGyJq5Ga+l/SDFKZE7VHxZi/1fca2txu3x+vwOLfUufODjabLXLD21gsqtnKL5e6rR/UEBB7AQpVcXSn3uHvoyCT6O27HorDopuD56gJ3QTwBDemHdAu8XSh84/Ry5YFN3/VQDqwHeKy4fnIOCZjCEuTGIrdDzxfglT39f+m/bvOMvMENctV5epO1s2XCGn13cAK2ewmXG0qmd227rcg9q4ZL1m+3vP4/TI4SIshtRPdvsm/wkXiwX0TN9wNPobyCqjU/Vr7m6BCQnzRVN4g8Bx5q7PmzYguGRDaxnQGS0kb7Ssmn4ycrbjncZIXGT4cWrbhEPTqjdFoQmWV4qsZ1TXYX5leigj24jIrtPYNEgsFmVzpHG+hKzzFAlawRVoTCumF/+Cxsm1U5wPtTFNr+ADf2NxvcVwCbDbok0w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39850400004)(376002)(136003)(346002)(6506007)(6512007)(4326008)(36756003)(6636002)(83380400001)(6486002)(66556008)(86362001)(186003)(5660300002)(316002)(33656002)(8936002)(54906003)(71200400001)(2906002)(8676002)(66446008)(6862004)(64756008)(478600001)(2616005)(76116006)(91956017)(66946007)(66476007)(53546011)(37006003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?kKIJykfW8DCgEVGDLBQCCCC13HFPjqaq7e20utybi7EDYz2INEbzJo7ykTpX?=
 =?us-ascii?Q?TaAlqbgMwfsT1sIatG5GIql+0XItXPzOGqNFjWzkjKsT96akMrP1ToTXGftm?=
 =?us-ascii?Q?rzgcB5QBoMoAqQSA2qPiJC2NSEX6ZRARmaycMcU265M8xiK6wnXyjW+3Ksqi?=
 =?us-ascii?Q?RaCLLcGCnCfIpqOCUm7NvyedV53kpmohtd0ZSoTaPpON8maRPv4/M0erIAxq?=
 =?us-ascii?Q?1ueevv6Qg5iXLGSpNKRcQYI0Px975T0YiQI61AL8WcgiFSwO+k8y9PXLGiBE?=
 =?us-ascii?Q?/B/R//LfPmUSSMKuV5CTLv2qt6s26rLN02zfT0kFavg2yUIutaK07J0jMPsZ?=
 =?us-ascii?Q?tfhLj+C99uMFsSP1qeBvddpvUunxHt/tpYOBF6JWOVM84TIa71EOxXpeY2MO?=
 =?us-ascii?Q?lQeE0qck7eKWw+6CAfNnLHkVY6IEO5aFjyI1UWOP6zTXdquLJrSHWBbmMs5w?=
 =?us-ascii?Q?C9mOnObxpFViHbuMsBIoP1XXL/WQraGkNgb1W5UJeuol0qvSRNHRQFH86iNJ?=
 =?us-ascii?Q?CPLQqN411rEJ6KHLULRZYiF94oR9Kc2HGRfVIjg0R6NkKfaayZZBUSL3n+4h?=
 =?us-ascii?Q?aQNrKA1hKWVFwEAcKB7U7pZLTyt6p3D0n+nr+6TWWA9i8GEjHwVabFN2ufu/?=
 =?us-ascii?Q?zKWopYa7vDYcfWMP+eGix33KBGASqeEtc5B0M7fhMdKLXx4sjhDGY+th6eXa?=
 =?us-ascii?Q?l7faudn6DA8b0Uwvy22qSIlNPLS3DcHzW5yeGou5YnfodWUqO07s/006DSn4?=
 =?us-ascii?Q?8pVaY1WYhAO4lWJSfORpGLSZCxh+wDY05vcs7ZLz9moL2enRsso7S6K5C7B4?=
 =?us-ascii?Q?w4Ew3neDjiQnp2lzcX2VYwzy1ajk2wnUZFFAQ5dBdian+ePXIBO4VUBWIr7W?=
 =?us-ascii?Q?bgiPUJeCoAzyou7ynaWiUc2FVhaA2VQ+ydn8tyomskkVafVaOxZLlYYjnMnk?=
 =?us-ascii?Q?anoZbURCFzaJySPqGYQT55NPEUucT9aV+ppOX9Bzku+n7komBklbM0UKiK4I?=
 =?us-ascii?Q?VJ9CkbISrMgP2+0lU1pKF82WOluGGG3a3scAy4/RuylVEGMDIpUDzWxhGvta?=
 =?us-ascii?Q?W0d68BTHNf9xdn8UobgUyFv1qntFQ3W+Y1n6Yfliid7lJS2tOBPNE6Mxs/WT?=
 =?us-ascii?Q?+Z84PttntkNxuQU+cPzjS23KhYKVmR4CSN99AUaDRAADiB5x3RHgTDRtYZVa?=
 =?us-ascii?Q?rXkbtrRL0VXwyGs+IFN8PueCYfGhtkuhiC3lKoG/PVJM8LAksYHL9DFlvQB3?=
 =?us-ascii?Q?VXuamh773+9f/LLExZumlLxMItH1Fwzky9FDO7oJitwpv6KAJQ+VgklecOeG?=
 =?us-ascii?Q?9g7QrbuQQTooihPkzpAMK5iplTy49YQnuPPWGSVH74EF3ClKN5ap0PGeXaX7?=
 =?us-ascii?Q?Y9tWrvYSyXVi6EnKhf7Z4aNkmrcx?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <84E759FD70BCBA41B0604B4F3CCC3183@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4045
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6ccc7805-0428-4d98-21b2-08d8e52c8eb4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	La12LJ0N/gNUMRyJ/XDhI7z1kEyFWNzOJQcs8pqmrtD/QRpno5CEFb1DKFD0RqNW93ja5Ybw7sOAC/u/1C6v8ZVzcoy8xDxlyoTf6r/4iNJA97TyL/9V0do3qpH1voajUlM7XrERiucfXbEbdhjEy+fsNyfaf+9atpmVzmh78jFf3MATaL60AAvsxsCnkeUWTF/Ra9o+W+XnBCie/ZyLuwECxYuB4Tx0975KHVj5ksonONB1DphOaydQHy2OCFWl6Aj7Mny7IkGTElg39gGFO1JSR0PzH6WCZ34Q/YmAEHy+02xUD+XBeYVjZmWw5/meZyGzFGV4G/eCa+aVjYoC+JyqFfF8JKHNqVVJEDyfZ+KD/OFfknsmluVWPSfs4pfMQT1rssqrynHVxOKaASjVviZC1e0MDSacrliVOvEHW4KjsykREY7j+zc7ra/lJvRAFG5rONoAJnXoDAwzzgzcJRIIF9J8TAJhMhTMtsH653dBblYq7iEs5jUfFH0C3VDRZyQQFE9b723/qg6XKnSJ7lupKxpdtPfYnISpnor5kFQV9bpmzMc1p8Gn+j7IwRehYzkEc6qUC5zputLl+NdTPnOj4tHTv5TlsRyZUq4GWW9YpB83eGY3DZH2RRm2ORAZ5PforOqOyKL/jMZ5BchxFdNjzi8Y4ejcMGUnukGVoZk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(376002)(346002)(36840700001)(46966006)(81166007)(6486002)(316002)(47076005)(107886003)(36860700001)(6512007)(54906003)(8676002)(82310400003)(6506007)(86362001)(53546011)(356005)(5660300002)(83380400001)(2616005)(2906002)(8936002)(37006003)(336012)(36756003)(70586007)(4326008)(70206006)(26005)(33656002)(6862004)(6636002)(186003)(478600001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 07:58:09.0245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e17348a-2282-40d0-1b00-08d8e52c93a8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6844

Hi Rahul,

> On 9 Mar 2021, at 19:19, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> This patch is the work to fix the stream match conflict issue when two de=
vices
> have the same stream-id.
>=20
> Approach taken is to merge the below commit from Linux driver to fix the
> issue.
>=20
> 1. "iommu/arm-smmu: Handle stream IDs more dynamically"
>    commit 21174240e4f4439bb8ed6c116cdbdc03eba2126e
> 2. "iommu/arm-smmu: Consolidate stream map entry state"
>    commit 1f3d5ca43019bff1105838712d55be087d93c0da
> 3. "iommu/arm-smmu: Keep track of S2CR state"
>    commit 8e8b203eabd8b9e96d02d6339e4abce3e5a7ea4b
> 4. "iommu/arm-smmu: Add a stream map entry iterator"
>    commit d3097e39302083d58922a3d1032d7d59a63d263d
> 5. "iommu/arm-smmu: Intelligent SMR allocation"
>    commit 588888a7399db352d2b1a41c9d5b3bf0fd482390
>=20
> Rahul Singh (5):
>  xen/arm: smmuv1: Handle stream IDs more dynamically
>  xen/arm: smmuv1: Consolidate stream map entry state
>  xen/arm: smmuv1: Keep track of S2CR state
>  xen/arm: smmuv1: Add a stream map entry iterator
>  xen/arm: smmuv1: Intelligent SMR allocation
>=20
> xen/drivers/passthrough/arm/smmu.c | 423 ++++++++++++++++++-----------
> 1 file changed, 262 insertions(+), 161 deletions(-)

For the whole serie:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> --=20
> 2.17.1
>=20


