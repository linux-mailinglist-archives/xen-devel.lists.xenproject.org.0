Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4A9387B69
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 16:40:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129299.242723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj0t5-0007AP-ML; Tue, 18 May 2021 14:39:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129299.242723; Tue, 18 May 2021 14:39:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj0t5-00077D-Hc; Tue, 18 May 2021 14:39:59 +0000
Received: by outflank-mailman (input) for mailman id 129299;
 Tue, 18 May 2021 14:39:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tj/=KN=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lj0t4-000777-LN
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 14:39:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.68]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bac80553-c498-4bb2-b4c7-3b16a24ca9cf;
 Tue, 18 May 2021 14:39:56 +0000 (UTC)
Received: from DB8PR03CA0032.eurprd03.prod.outlook.com (2603:10a6:10:be::45)
 by DBBPR08MB4904.eurprd08.prod.outlook.com (2603:10a6:10:f2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 14:39:55 +0000
Received: from DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::3c) by DB8PR03CA0032.outlook.office365.com
 (2603:10a6:10:be::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 14:39:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT039.mail.protection.outlook.com (10.152.21.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 14:39:54 +0000
Received: ("Tessian outbound 3c5232d12880:v92");
 Tue, 18 May 2021 14:39:54 +0000
Received: from a31ab92ba805.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 041A91DC-A10D-4AF6-B7CD-9ED5ABA26EA1.1; 
 Tue, 18 May 2021 14:39:47 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a31ab92ba805.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 May 2021 14:39:47 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VE1PR08MB5600.eurprd08.prod.outlook.com (2603:10a6:800:1b0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Tue, 18 May
 2021 14:39:45 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::5ca9:87ed:e959:758a]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::5ca9:87ed:e959:758a%5]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 14:39:44 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0120.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:192::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 14:39:43 +0000
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
X-Inumbo-ID: bac80553-c498-4bb2-b4c7-3b16a24ca9cf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWeXAeQUtjtyw9RVs8UQWsQ4Zvnw+i9+BKnCk0yF7s0=;
 b=unEBeyqzuB7AkDVKIGm8oy8fw7o0FNkVs6fqXFT4SNt9kB20QSWOiATOGN7OByj/6zW6GJl0GcbU+xZqTBsF8ZDljJmYkMS63eAVpQhj+Q9XuBBQHIz4MzkTZCYNJDtnxJVZbEgN+2edEcypeu6lD5P+5e2EBnmNpKUyvZE0ivM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3d95174608c72e4d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVG5oXjQz/4EXyy0BYTXzqwHvJhkza9QqwmD7Qc+S+49W6H8vofLJnu9PjKoZYilqEMp9BmdKQxF2yyCRo9ZY5yjSkRnkGv5lgOBTWZO+EVAw7o8zrQxUC2g+9TCqtfbN3IuTlWTVCGJJME72j+oNZAflYyzVPoYP+5gbgo4mLWpu5pJYzFIlw0pIhO3I57KDT6u7m73HveLGU8CrQpP1icj99JQH5dXyhEJo7/5lh1tq4UlN5qOtN9SvX3kizvdNycMNy4b8zNfzeksQ6wvvBN3KqKaVHXoJA8pdEYyZVDjSxI8xSOy8jCVbgxbKas2yLxmKGmh1xm8NwZ2IGIkgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWeXAeQUtjtyw9RVs8UQWsQ4Zvnw+i9+BKnCk0yF7s0=;
 b=RQ8Qhnc5/7722vSeIHq1/V/KCCT5P/LXb8iMGGPflhQV/rOF/9bPLMkjHfwduVwIZJzKHhT991qtN6VlvQV3SqULMPwcTiUvCrsf4YpvorBpd/JU7wxveLFfQv6NBuVck2oLWlkHOXw8Jr5dZDmHC6UfgKA4g168I2uK8XPQuLgvbKjE5DDEpqnHVkl++af21RFJnqsLLnzpdw6AE9wpkZosExGE6dant2SzVvYW1yuQ6UMknhIEJQG1TRErYOqBkxeIUA6WwAShRtJCtQvOcGqHFc/AIkC+VEBemPvBo3zkpU+ufJ126mQJHCacKK9TGPt2cYXhITbCuUdbD9wBjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWeXAeQUtjtyw9RVs8UQWsQ4Zvnw+i9+BKnCk0yF7s0=;
 b=unEBeyqzuB7AkDVKIGm8oy8fw7o0FNkVs6fqXFT4SNt9kB20QSWOiATOGN7OByj/6zW6GJl0GcbU+xZqTBsF8ZDljJmYkMS63eAVpQhj+Q9XuBBQHIz4MzkTZCYNJDtnxJVZbEgN+2edEcypeu6lD5P+5e2EBnmNpKUyvZE0ivM=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v2 1/2] xen/char: console: Use const whenever we point to
 literal strings
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20210518140134.31541-2-julien@xen.org>
Date: Tue, 18 May 2021 15:39:36 +0100
Cc: xen-devel@lists.xenproject.org,
 Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: 7bit
Message-Id: <46179889-061C-43C2-843C-F8E7A687BA5D@arm.com>
References: <20210518140134.31541-1-julien@xen.org>
 <20210518140134.31541-2-julien@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0120.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::17) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc35bd78-b203-4da0-0fa7-08d91a0acd6f
X-MS-TrafficTypeDiagnostic: VE1PR08MB5600:|DBBPR08MB4904:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB4904FFCE63516CA62D768AB2E42C9@DBBPR08MB4904.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 k3i1SRzFurFamEel4iGqgejDA5jbcoIPMgF79Y9gcoe71ff6R4HwYLs80to6/TWgE/TRm0g6cW7AI2uNTVteJhFmYjYoCWC9VMH0WFdB0QiZn8yOfImttaeOBElKFSouZ9br4UuwLFK4sMv2JeMJooi5qILkyjNvBR8XmjZQfaeOu9Ib83Te+mx5L9D5tSUN99em9bQDpUX4+FKIGHJTkkqj10n3B84uqTSietaCJB5fPuWJziQXud+eaWQNYYUCk+XQ/w5lAqEMB6AyjbxWsKltqi0Agigm4vVxaSlGI5hxe2Tafo+ULEytMco2Ej8OdsdycZ9PYAVvVqhwferY+8IcGIaoJje+4YJAcpLpe9XeRMMVB9MN6/9NlrLfN12ZMi+ICrAvKuP1ASUbeTWs89JFI4a6ctVATxtZbY7szLVNsmFvsQnUKRagfJF0xaRfkVRHHGDcpklQf7E4fPKnxp0mhtwKMa228hz7BldpzgRqlQawZvoDOyqWGbDmYucozS68EJNyUK9EodrA22GhM7kSawqbu//qszy6pg22bdTye/5lA1mUN2SRufSr6moH/BsX1Ya53cyv1GROW51c8BvOeGlhh0W6MBBCS4VVJsEmwrDqp2QLH78lm6ZYQwApYloqYlIQKflySdTPFJzSOngD20WHED7vycPbvSfW0l73dN9XAGrtfYgNH9INnvKW
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39850400004)(52116002)(2616005)(6506007)(478600001)(53546011)(8676002)(33656002)(956004)(4326008)(186003)(6916009)(83380400001)(8936002)(16526019)(66946007)(86362001)(5660300002)(44832011)(66556008)(2906002)(38100700002)(38350700002)(6512007)(6486002)(26005)(66476007)(316002)(36756003)(54906003)(6666004)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?us-ascii?Q?yl3+OHLAnPkKfDbVeI6NbdBYGJR70zyOy004UoeanViKXbdNr4JTqTKHfM2W?=
 =?us-ascii?Q?c8jd13PsbQNrJpyA5O/hEYqYFnQx+kpBvBJRDO7WIu9i8c5Ikh04NzUawApF?=
 =?us-ascii?Q?AWXwdj0fhP7ZD5FYwXW6D4O896epSrfwCLgLZb+ufHhZsY8fxF/POL9pR27x?=
 =?us-ascii?Q?cH8zCXcTRzwwpyJLJYnVdIZgjRUxLyLdwLFf9yIBLftr0Z8N2x3ZsqMt5qYi?=
 =?us-ascii?Q?9i42HwRTiv90aElxn6zpW7wPDeZVeqJmTrq7eCRtQjGHxm3y6oDAug4/dD2r?=
 =?us-ascii?Q?m1oAzGG7CUXd5QCbPNmLi/BRTqVuquqtpNNbATXOX5ZVMhlbfXlb8cZuDt3S?=
 =?us-ascii?Q?L08+kiL1apJXd9M66ncIZX/hCogh3ViTxY8u62MI8pUR56f5zL5hkvqLQ4y9?=
 =?us-ascii?Q?Z233cvCsH/uuUrXx5f2xhVMonQ+fv2jnvGdUG5D2JvHY5C3NZNmP1Mazn+nJ?=
 =?us-ascii?Q?2c/UD4ritu8g4WfmxJwcig9pdXUuU8JxzrlCs5BMUafUItDZsdmhLWDZG5fk?=
 =?us-ascii?Q?34AsHdk8l6YMQnjcuQXtQiQNT1Tnaf6p29ANHtHlFxyeKedmv4Ro5P4QdeXg?=
 =?us-ascii?Q?XWTDtR+jr8yG9zOfoyfsREp66Nt/1mTFbYp6iIa/X12r1MhqvONoKhby9kJ9?=
 =?us-ascii?Q?E6v/xHIfpcMQh7Z+Ap+v+hIIEIqYdOys8g/ZScDPgITkg94f+waBKZxXtMgP?=
 =?us-ascii?Q?1vLVMBShpZt2RVbeYR7K87+ZPTWOYu0h0x0kPRvO2WoPkRf4mYzNgZDQl1Uf?=
 =?us-ascii?Q?xltT24K9KMCboNKrYO+MB+3PnS88xeBzQHwCHELvcsoznlcvH6+Zn7Mxwl41?=
 =?us-ascii?Q?GyCxqY2M4YC5m17u7grA7D1M3qQAAs/hV0tL+YsPrP3LSz5ZANCsvEJpbEwm?=
 =?us-ascii?Q?TC+zjCzotr+DOH/Q0JgR1Ecm057gfbu67fHdYyC5MftA2IZwiEQXMXleorWO?=
 =?us-ascii?Q?pHFXnHzgIB3eU6xkueSc86iPW+uylaC3dr/T56W6pE/l1iGMvfp0O9ycu/Wc?=
 =?us-ascii?Q?HHCNUy3jREGMjhRvcf9y6Jf3Wn2jhUyMoUHJ/X99NqbcQpF3vH57Os9tZ5/T?=
 =?us-ascii?Q?SpQq8/XanAYd+TNdEGciKdlm3wsFTdcE3ba1Oiikxs7ViYhkzC7qKMi/gXu3?=
 =?us-ascii?Q?2KWCu1ooOcYZnInjRdwKnl1nCih2rh35j0+kiS4cFozOuFlBcgw+Dnkkjiib?=
 =?us-ascii?Q?Gg9lu5/Cswt1QHUy80doi0boAVciDAUp8J9NgzeueRRLRBjcjtHI7RrUeU4L?=
 =?us-ascii?Q?aDK9gXOoNrQ0RX+4zj2T3Oj+W1KA2V93wzyzd6LVqmGC/qTVNJhen36sfF4h?=
 =?us-ascii?Q?leAVz9Ob5GLb9mqQ+1f58IQj?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5600
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	410e5e25-ab5a-4554-dc41-08d91a0ac6db
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+Pdofux9yY5lOJE0g+kX9ecaaDrpAnfoaGbHuLxBNIofp+rQDWHggcHW/lRsQomnF6tRUVGvIPVkSj/ROTslbz0rU+3Yb7Od4zQ1AMjK2gGF+18LxDQ4AE6KKgqzhkSFi4LfsWd6MSXZam3FrxLTbILxKhwg4JRD0f6N/fEWxEDx3Oahgq39n0ZML23BFkb2fU+vwklSqywj0liM4Zg+eLAULMfQdwAIv08o1NF6olmQAKHEgapA59sEg4/sqhQEL+FmHLEf5Q5FAnVtgViJeZEYm+EfRC1te8emj/bjhc3A/Ahb/gzBqJANTsOplLuCbvtne+nkAJ9Ldfr5p6KpMSkE75PiBalKMxZFa02MiYILNOILYnuSjAMZtK6a6xle6VHFe2h337tDUrX4MSql4as6edxcEhaY+UogDRY10RcdDQRdQsCm64CCce2qTwnOPetkGmkdX2kjEDgEUH4knyCoJEQJMC6KjlvyMQ9vFqbq8zFFJDmlFC+mJEyNO8NCURCDbBUwXt2uJhoBGbbcNmgZeQY38zi9KF/ayMLHkM8CjA2sw0yj6K5PpLkPRJn0E3YeyYKVwMx3N5fuj8TMtumr0MfM7Z0zhd2uvi0173uD7j4CnTzSQJY9eW9Q9yH3+hbRjOYIvnioWpx4f5RtXP2Jw4Xd6nc62yIG9zEK0Dk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(376002)(136003)(46966006)(36840700001)(83380400001)(6486002)(82310400003)(6506007)(2906002)(4326008)(47076005)(70206006)(70586007)(54906003)(53546011)(6666004)(33656002)(36756003)(956004)(2616005)(478600001)(86362001)(8676002)(6862004)(356005)(36860700001)(81166007)(82740400003)(5660300002)(336012)(26005)(8936002)(16526019)(316002)(186003)(44832011)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 14:39:54.8118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc35bd78-b203-4da0-0fa7-08d91a0acd6f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4904



> On 18 May 2021, at 15:01, Julien Grall <julien@xen.org> wrote:
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> Literal strings are not meant to be modified. So we should use const
> char * rather than char * when we want to store a pointer to them.
> 
> The array should also not be modified at all and is only used by
> xenlog_update_val(). So take the opportunity to add an extra const and
> move the definition in the function.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>    Changes in v2:
>        - The array content should never be modified
>        - Move lvl2opt in xenlog_update_val()
> ---
> xen/drivers/char/console.c | 7 ++++---
> 1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index 23583751709c..7d0a603d0311 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -168,10 +168,11 @@ static int parse_guest_loglvl(const char *s);
> static char xenlog_val[LOGLVL_VAL_SZ];
> static char xenlog_guest_val[LOGLVL_VAL_SZ];
> 
> -static char *lvl2opt[] = { "none", "error", "warning", "info", "all" };
> -
> static void xenlog_update_val(int lower, int upper, char *val)
> {
> +    static const char * const lvl2opt[] =
> +        { "none", "error", "warning", "info", "all" };
> +
>     snprintf(val, LOGLVL_VAL_SZ, "%s/%s", lvl2opt[lower], lvl2opt[upper]);
> }
> 
> @@ -262,7 +263,7 @@ static int parse_guest_loglvl(const char *s)
>     return ret;
> }
> 
> -static char *loglvl_str(int lvl)
> +static const char *loglvl_str(int lvl)
> {
>     switch ( lvl )
>     {
> -- 
> 2.17.1
> 

Hi Julien,

Seems good to me and very sensible.

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


