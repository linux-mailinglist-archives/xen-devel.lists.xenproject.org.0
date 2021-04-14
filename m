Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A66A35EBB4
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 06:24:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110221.210379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWX3s-00042J-Ut; Wed, 14 Apr 2021 04:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110221.210379; Wed, 14 Apr 2021 04:23:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWX3s-00041u-Re; Wed, 14 Apr 2021 04:23:32 +0000
Received: by outflank-mailman (input) for mailman id 110221;
 Wed, 14 Apr 2021 04:23:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yF16=JL=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lWX3r-00041p-Th
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 04:23:32 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.63]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42f9fc25-541c-4d93-a9ff-86152b60fdef;
 Wed, 14 Apr 2021 04:23:28 +0000 (UTC)
Received: from DBBPR09CA0025.eurprd09.prod.outlook.com (2603:10a6:10:d4::13)
 by VI1PR0802MB2302.eurprd08.prod.outlook.com (2603:10a6:800:9e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 04:23:22 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::d3) by DBBPR09CA0025.outlook.office365.com
 (2603:10a6:10:d4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Wed, 14 Apr 2021 04:23:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 14 Apr 2021 04:23:21 +0000
Received: ("Tessian outbound 47ca92dabae7:v90");
 Wed, 14 Apr 2021 04:23:21 +0000
Received: from 02fdcd940f54.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6F500746-8BFC-4782-917A-B911113A60C4.1; 
 Wed, 14 Apr 2021 04:23:10 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 02fdcd940f54.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 14 Apr 2021 04:23:10 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB3343.eurprd08.prod.outlook.com (2603:10a6:803:46::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Wed, 14 Apr
 2021 04:23:06 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9%4]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 04:23:06 +0000
Received: from [192.168.0.11] (82.8.129.65) by
 LO2P265CA0367.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a3::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21 via Frontend Transport; Wed, 14 Apr 2021 04:23:05 +0000
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
X-Inumbo-ID: 42f9fc25-541c-4d93-a9ff-86152b60fdef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sT+B/WxYxeliHMZY1kqp18MVG23xqileWEBiXhbJ4qg=;
 b=vHEc4joJ20pli5HSlsGUOgaUqVqjua+SJ9Uo0/xB/ukpjU7CazJk8OrzjxVeg/hFgWCeajZSYBSiVjL3z2dQqCWtT+3MclGDP4VZhrNgRTbPHI4EAoUH/nlqSbsl3vJN6KtoFKLiAlBz+OiaWwZXUCJYAAjLXMRkJgYKR/Pvd54=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b8c121e8c0bd8ed1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N387U4VQGU9825so8WDoUUxf9AODYwLlUryruauTiaflbyXfkUw7YcwFfYUK0z8YAT2+GmmJP+s7nxiTBWW3aCml94BQHbCLdwQ+OyP3PkOqbMkkbOqavE7p7p1t/+WSk75h6CKhZKRJdE7k9nEazyiWivk7a0J7WIEBhdF76he0o+UQOL+0M4KsxeGV5YnxPIBFx3CeRolE3O5jmdMEVgLGg94Rz5srpGfkJXzrQmuRJcRFnEf76SABVH3IeEdXpOaOEKRt0fSKuWkvcn55pew9qjeVG85W1I2Rr2+P/czoTACCfL2AK2PsKeHxMx289b1sRpEmFv1jm9bTi0W2IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sT+B/WxYxeliHMZY1kqp18MVG23xqileWEBiXhbJ4qg=;
 b=RHTYQJ1ozRxR/yZ7Kw+I+5FSAaLMCrWiHR6smdeJ6TRWMcA0b/VycASDQBiYdSfb4oYqH+y29BNNP8A34UVHsSH4QQKR3ewRRSSLWuPIGE3ox6u8NXAKPpeqaJiCqmrTkj/r2+cxKDLO9/54Ixsb+zanLtJuCmCLfRGt9XbdhgSBqvIjtPsPmJv4a6EantU3wQidtCtTvGzOq2LUBvu0dkUmM3Fb7JlKubKyENz3tqBKfbO5RUZoalVHsM8wDF07ENvgqlCAsVd1n+JQtOrjsS30h3AiA6qczLEj6SZCRLE9bJANyv2UyPxk4CNrPbs1gI+hSxtKgEjoE48u/o40OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sT+B/WxYxeliHMZY1kqp18MVG23xqileWEBiXhbJ4qg=;
 b=vHEc4joJ20pli5HSlsGUOgaUqVqjua+SJ9Uo0/xB/ukpjU7CazJk8OrzjxVeg/hFgWCeajZSYBSiVjL3z2dQqCWtT+3MclGDP4VZhrNgRTbPHI4EAoUH/nlqSbsl3vJN6KtoFKLiAlBz+OiaWwZXUCJYAAjLXMRkJgYKR/Pvd54=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v3 1/4] xen/arm: Move dom0 creation in domain_build.c
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <5a2f6160-d13b-b554-6e12-2318dfa3a5d3@xen.org>
Date: Wed, 14 Apr 2021 05:22:55 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <28282330-02B8-4931-8670-690E86D26E9A@arm.com>
References: <20210412105243.23354-1-luca.fancellu@arm.com>
 <20210412105243.23354-2-luca.fancellu@arm.com>
 <5a2f6160-d13b-b554-6e12-2318dfa3a5d3@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P265CA0367.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::19) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22a599bc-b0c7-47c2-b03e-08d8fefd09ef
X-MS-TrafficTypeDiagnostic: VI1PR08MB3343:|VI1PR0802MB2302:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB2302C07B2CCF6D6BB954541EE44E9@VI1PR0802MB2302.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ish5wM+kEbgnTO7hVHZ0EEJwpfU5aPMX3YCFAj7yOVA7m9YZyrBbgylHXggajt4Ty5s3j5XOFlNuWjG/roRM9GKwG/4mrbkAbjVtfJDWQKKwb1TkLyStoi6p9XK6GmSaIw5skqqk0rvc1x6rI7cqoAlf7DD0iIrbFpBPp+gSu682C6ydPbTk87GoleQ7h9YyA9t2Ot523V0XdhawlR8utaESs/gRuYF9Hfw/eHo0DH6XerKuBQJXoTUMp14nTBHGNOoMBzL2X3j0r+C0QRoMRg17Et6N8Gd0CSbFe/DQmc2/AR9C52jwQH6u5n+6/l6iNpaHYq04Ivl1Snt9QJd60jpbVZVmJUen4XeReweBTTzLtjPqo4apjDj0h71E6Kl5uKCszQOwxQqxlNRMJ0zN0JFqr3PhZPpnuDWqvbP8aHk9TDJhYhudfJPKb8mlcIadeyPeYleXT2VQvIOKhskqZtGDqq6W0XBPt/tpGBKTfKTzzke7cA1as5pU1YT0Hib3DZUKaWR6JyExdFoh6UTX+g1fF8rEh9RpywUDbjZDiQ8VWVpLwfwcN3qrWZkpfwRpla8CdfIvVkIP8le0FTouNoNyUGLWGfOf5Owj52XbQh0M1MHTTrG9zZ5fuaZ9apezlgxX7vnxv/evOUGQkaTQxqLkTJKZii+Fky1/TW1cMnsc6Q7fGcPIxJgRSJVq5cNU
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(346002)(136003)(396003)(366004)(33656002)(186003)(52116002)(478600001)(16526019)(956004)(53546011)(2616005)(66476007)(8936002)(6486002)(86362001)(8676002)(66946007)(6666004)(6916009)(66556008)(38350700002)(2906002)(316002)(54906003)(38100700002)(36756003)(4326008)(83380400001)(44832011)(16576012)(5660300002)(26005)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?us-ascii?Q?EVBYmOTA5zUsisI0MsYaLsLrZVNdYyT/FIW3j+hASi5GZIwLcgXjdcyFHAq0?=
 =?us-ascii?Q?bR7DpNn230Z7bJN4P3kHK065CUjV2OM0VSfknsW3GZVJ6W95TfbdtETZ0WBT?=
 =?us-ascii?Q?dN1Xumhxo9pw0w7yHfhKVB6UA8NCKhlEhN/R5nPXvy6/ar2FPju5k2jQ8XLO?=
 =?us-ascii?Q?jsqK+msUReaswsq9IDT91H8lqxKYr+6if+s1GCzi37ZUEqz23Mc8fyP2aHhd?=
 =?us-ascii?Q?ojTV76adVVdlkFXXPKy8+Y+u4/trw8QOMjoHGCQfXBhsqXNAxLECkF4+fB25?=
 =?us-ascii?Q?ghMzpaCiF9bJm7VrstZVFIIc9Hhb1goDKxxQkCKDtQUTZ86T/8dePVepwiol?=
 =?us-ascii?Q?q3z1MkEmXcDZyW6+BM40H6Dqtcm50E0wImotKOT2IRq4SQAIzmTLgQXiCB8B?=
 =?us-ascii?Q?TLLedGSUIK79PGPYL3J0orvWY0LQTAt4LI7iqkpg/8YmOakRt/H7IOVNk1zN?=
 =?us-ascii?Q?4LHQjyadQ1e75kGTf7KyOB6um1/KLoMkiw/edXBNtnHUA+XNwNzynGcl+IPt?=
 =?us-ascii?Q?hZsrUfcU3MXJ4E5zvvHYK5v8xLm3V7jsxNlZletiYgeBmXl8NASqHXkUzL0f?=
 =?us-ascii?Q?lNVP8GrTRYrx8+gIf36yolRaU0tin2nsjfo8KeqHNKEmnUlApWmU9kOeu8vG?=
 =?us-ascii?Q?Y+oIFiTD/rDxq+L73Ai1Vh7XIrBMPQlDZMI/N42ATk7nXmqpB+RMyd1cSfTh?=
 =?us-ascii?Q?YpuvD6ZDMVTvWgyMR/yUauycLIdwvFuqqllB3I8pKAgXSjXbTTQuX6gmWU2s?=
 =?us-ascii?Q?1XQFddY79CG4qHAX8vZdSaw5WnwfC6E55GYyIHGVyQ2xxUgUZILYN2rGrWR5?=
 =?us-ascii?Q?QXO5f2z8DBV803CoDI5o/yv/k4nL+A++1fEOiy51axMwK7HsjMXYHPI6CPa3?=
 =?us-ascii?Q?gTbb2HubeMGCJE0QFzAkhBa9GtYlY2zeccbH0XvVjXEPSXQIhjKWiKVSk5R7?=
 =?us-ascii?Q?4WKi3Ky1fjDmtR+cMVNwaJ8sZvRdPAFiAhJZS9Ug2zi0kMSDMFnHRavienOP?=
 =?us-ascii?Q?M0SzzFCYxxWmcvipmVPthgHR/DhX4aR7Y8Mo9Y9bUuCCGotZhPJL02vwiAIZ?=
 =?us-ascii?Q?1GXNXof7ghSvDPTvzOErRUmhyUonvk6lSW/dmCUDm5SHJCrNDrE7iHFByWGx?=
 =?us-ascii?Q?rfv3CglQWLKBpywxFM4y05fQMAzEQmWJ95fV7Nu77Sa4An2iEBuwqx80VN2o?=
 =?us-ascii?Q?wRxu5yTsWdHLh7aOWfzk0ElTBT6r2O0NSgqOX1z7jRi430wFId+du+WKZwZm?=
 =?us-ascii?Q?Hn+4UAS2+6am/IzUwg8npitFrbzJbCR/opt4AeGZVw0OTg9FpZBoQZVgUwWl?=
 =?us-ascii?Q?1JTrup9QHa1lwXIUqiqOlxV7?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3343
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b3fa310e-7832-4543-731e-08d8fefd0079
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MrrtACyzP7unaTjlOZA7lfLqXaB5Gl0S8YnpQ9mV3RN8bbaArzVK+g4PKEkkNjLVrXfmNZKRSzjYJUMG4TkJlvyT77jJSsS0grpJJgR5c6Z9Cwnvq1Vr79gfW5KvXyoMUSLCp+Y0+Oa6Uua3CgCF1l1zQqA6+B/QFBgTg17OQ5fTZOu0y09YLGNX8zcSeWbW0mLvUcJEyONC48b4xa9tru0SewPo/g5UhK5ktLZElSgkQmySz+Mq5KE5+8tjBIkRs8fVdbTe9zFzLd/+7l2VFGseyuHI9Rwn0r9NGG0sAHv8HlT3FX+M8rJpBn0g9jYgTnR8O3+vy+5CmnwiAMU4IpA+1+sYqqBQ0fTEZdMkDiEnxVMmRp1e2UdlscTU0ZNOlBdy0g74jBgw1syixbawf34suvAhhdhIwsX8eX+QhYOKPXuQEoSDdUH3L8WciNGULXEB/12CGD3O49+oCf+xEA/US9Ua8wGZpVgyZng6cl+58jMDUhKTAHHv05+593WeuwCQ822JlCjQaMNd8ADCgHvSJ9Ks+UJOaxhT4E3SYWs1F7HJ8OjblDjjf4Iox6Bh94kdFOPvd2RrfcAq0UAp+ZBOzj64sadhUAhwQzLVREhNyKpJuG/Zz4yuQsKG+Giq2n6o9UAFK/jGrJYeo1jZ2Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39850400004)(396003)(36840700001)(46966006)(86362001)(36860700001)(478600001)(82740400003)(26005)(47076005)(70206006)(6666004)(6862004)(956004)(44832011)(2906002)(54906003)(83380400001)(53546011)(5660300002)(16526019)(2616005)(70586007)(336012)(8936002)(316002)(8676002)(4326008)(81166007)(36756003)(356005)(186003)(82310400003)(16576012)(6486002)(107886003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 04:23:21.9739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22a599bc-b0c7-47c2-b03e-08d8fefd09ef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2302



> On 13 Apr 2021, at 17:40, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 12/04/2021 11:52, Luca Fancellu wrote:
>> Move dom0 creation and start from setup.c to domain_build.c
>> on a dedicate function.
>=20
> s/dedicate/dedicated/
>=20
> I would also suggest to add "No functional changes intended" to make clea=
r this is only code movement.
>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> v3 changes:
>> - move create_dom0 function after construct_dom0 and
>>   make construct_dom0 static
>> ---
>>  xen/arch/arm/domain_build.c | 38 ++++++++++++++++++++++++++++++++++++-
>>  xen/arch/arm/setup.c        | 29 +---------------------------
>>  xen/include/asm-arm/setup.h |  2 +-
>>  3 files changed, 39 insertions(+), 30 deletions(-)
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 374bf655ee..359957dc1b 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -21,6 +21,7 @@
>>  #include <asm/device.h>
>>  #include <asm/kernel.h>
>>  #include <asm/setup.h>
>> +#include <asm/tee/tee.h>
>>  #include <asm/platform.h>
>>  #include <asm/psci.h>
>>  #include <asm/setup.h>
>> @@ -2520,7 +2521,7 @@ void __init create_domUs(void)
>>      }
>>  }
>>  -int __init construct_dom0(struct domain *d)
>> +static int __init construct_dom0(struct domain *d)
>=20
> This wants a sentence in the commit message. How about the following comm=
it message:
>=20
> "
> Move dom0 create and start from setup.c to a dedicated function in domain=
_build.c.
>=20
> With this change, the function construct_dom0() is not used outside of do=
main_build.c anymore. So it is now a static function.
>=20
> No functional changes intended.
> "
>=20
> If you agree with the new commit message. I can modify while commiting it=
:

Hi Julien, yes I agree, since I have to push a v4, I can add the modificati=
ons above in that

Cheers,
Luca

>=20
> Reviewed-by: Julien Grall <jgrall@amazon.com>
>=20
> Cheers,
>=20
> --=20
> Julien Grall


