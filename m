Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A60C37683B
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 17:46:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124090.234200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lf2ff-0006mz-Cu; Fri, 07 May 2021 15:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124090.234200; Fri, 07 May 2021 15:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lf2ff-0006jS-91; Fri, 07 May 2021 15:45:43 +0000
Received: by outflank-mailman (input) for mailman id 124090;
 Fri, 07 May 2021 15:45:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ji/y=KC=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lf2fd-0006jJ-Du
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 15:45:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.72]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c0f2831-f004-4470-a482-091a921a21ee;
 Fri, 07 May 2021 15:45:38 +0000 (UTC)
Received: from AM6PR0502CA0043.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::20) by AS8PR08MB6646.eurprd08.prod.outlook.com
 (2603:10a6:20b:350::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Fri, 7 May
 2021 15:45:36 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::29) by AM6PR0502CA0043.outlook.office365.com
 (2603:10a6:20b:56::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Fri, 7 May 2021 15:45:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Fri, 7 May 2021 15:45:36 +0000
Received: ("Tessian outbound 9a5bb9d11315:v91");
 Fri, 07 May 2021 15:45:35 +0000
Received: from d05685a4c72a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 030FDC34-E323-4730-8C4A-781C7AC727CB.1; 
 Fri, 07 May 2021 15:45:26 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d05685a4c72a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 07 May 2021 15:45:26 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR0801MB2112.eurprd08.prod.outlook.com (2603:10a6:800:8c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.28; Fri, 7 May
 2021 15:45:24 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9%4]) with mapi id 15.20.4087.044; Fri, 7 May 2021
 15:45:23 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0379.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18f::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Fri, 7 May 2021 15:45:23 +0000
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
X-Inumbo-ID: 2c0f2831-f004-4470-a482-091a921a21ee
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcDk2yTj1V8Y63wIGJ70iSRdC+Auzgf93jwe7QFeIeo=;
 b=HsqivNOu0h8cGZUuIYO0xDimGiJG2ZewWrCEBST6TlXeFuicr+4pQRXEGqtyPqvdnG7GUhkbIpx+1iQIfI6q0rayCtJMk77yEeirHrdcFohzdrqf8JP3OCShmkdReYflO2PAV3QhVs4YZHwkGIQqkIDVK2bY2G2dxpEtPpbw2Jg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 098160f6ba61a2b8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hn91IHlrYHej6LBMXMZL+ldkGZdiRJJWoB8pMRrzmNPsy3oPrM/nVx3kNYLj9aDB1m/h4wem2yoq6b5bLf6XDIh9pzeT7FYw89pVHTkvi+TF0Z8b8sT/Py+Y4Cexlb5LM6DefIszBTQkJxQlQEkMMS72DoF6V9QgV7BA7cOKmW2G4mTsgrLZp3xLpXcQ0Nj2hjo8NQwmi6HH8ysa5/Ledu1dEW5jaN2b5Ov+pzjk0R/iq+G+eIdU7au7x0miSUpEBS6+BO8oQ3GUpqeEaN8jeQVetKPxs8O7skiUV1nLx9G36GjnRCEd5zneIPi0BPY2IT5n2FfMTgj84rt5SZfRIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcDk2yTj1V8Y63wIGJ70iSRdC+Auzgf93jwe7QFeIeo=;
 b=l2rL8FdI2oMHIzEoAsXYRAFiNoYJK5d1lXKo1jzaRyNWcdlJ1kms41d8jigMFYYleMtpDeeIAjKphQqcEvJWphm/qcVXWtaf1HPKudp98qxTci+Tn2FBvWJddTwbrUIF3ddQIv+4F5dY3ngI90xUM0O+b53jdNYMtUrfGJBzQy33vtEC25n5NtIw2rpc1MpH8MufLOBiAutYU/5zy5chdbZFdiqZt+6QolDZIuMjGCK2hUXGOCOd8W6Q7f3lFS6sB/fSFfCNNtazhXZmHjgnnjU0k9id2f36Mdbk9eLi5X/ChzsWQErwnfejIZPNnikFaKEnhrHOOzL7w5vwKWJ8SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcDk2yTj1V8Y63wIGJ70iSRdC+Auzgf93jwe7QFeIeo=;
 b=HsqivNOu0h8cGZUuIYO0xDimGiJG2ZewWrCEBST6TlXeFuicr+4pQRXEGqtyPqvdnG7GUhkbIpx+1iQIfI6q0rayCtJMk77yEeirHrdcFohzdrqf8JP3OCShmkdReYflO2PAV3QhVs4YZHwkGIQqkIDVK2bY2G2dxpEtPpbw2Jg=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH] tools/xenstored: Prevent a buffer overflow in
 dump_state_node_perms()
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20210506161223.15984-1-julien@xen.org>
Date: Fri, 7 May 2021 16:45:16 +0100
Cc: xen-devel@lists.xenproject.org,
 Julien Grall <jgrall@amazon.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <25AAA5C9-D7DB-4E04-99D3-57A50E2A2726@arm.com>
References: <20210506161223.15984-1-julien@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0379.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::6) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b45ad36-52d3-4da1-cc69-08d9116f282b
X-MS-TrafficTypeDiagnostic: VI1PR0801MB2112:|AS8PR08MB6646:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB664681ADBE65FAFE64EA4517E4579@AS8PR08MB6646.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3+jF7KLB+0RZZG3kG1XMdU2kEnbabeFY7NahnQxqKnwBDL7OsZYUGtuJv8Ev2dPwq+xy37TnirYeLKz7SIpwUWE8MjXAD3tXGtj/yHa0C87+eMSS/nadVvRTq3egcs01RmoluWZzX2swjCt/U8/fREthzBR12vfM3FnaUTtMHpeGVLlRMXXjfaQ73o3SEUnPVoq8Q0tJTvlVXzj/Mf59muidVxIx/2GX3QCcg7gIl9kWByW3ekRfWf3NGBwZ1KNYePhf9mYllt5d+e6DeJB8estW2kGkrtC84P1PCQ5lc4M07KrVMRYaCOBbaSuklQyF1uAI/jqhdwgjXysjohccDkEZcL7++CSjUDrXWCIhlS2WvsiDOR0mfFLTq6VZb0gO/KpkgRobB217fd4xXZIXxTPv2un5S4mGxlQQLpN/rcFZ657cmtUIKRb3V/1x01Bnd1dMPiAwHsZELZnVTxfrgITmxwOcc7dxbS9M7Rp1fQUZbE1ytRNdWV8VtYuaO8r8gNraN3Kr0sA6O2MJ0dOg6GJ0Z/Vz+sD2BiWYkeTkPXbHSnnu5HDZlpPD0nYnvXqpjM8UUVKi/hd0Zx8k3iXeUSVO/XzNqzPNcvy+KpyGzz/2aXodpFqp1Yz8hkW2Tjf4A1By5UWIIjAZmKvjkQTyR10vcadmoaGtUUtP12sPI4jc99GV9jFDmVkNsO6rqvMJ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(366004)(396003)(376002)(136003)(33656002)(2906002)(36756003)(2616005)(52116002)(83380400001)(53546011)(6506007)(956004)(4326008)(66476007)(66556008)(5660300002)(44832011)(26005)(186003)(38350700002)(66946007)(478600001)(6512007)(316002)(8936002)(54906003)(8676002)(16526019)(86362001)(38100700002)(6666004)(6486002)(6916009)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?us-ascii?Q?hwuGEKQvtPnvnhXIAK6wd+jf9Jy6XJovQqblvCvC2VQipWRe5AiAAOrHeREo?=
 =?us-ascii?Q?U1TZOfXt7A6FaHum9JuVVSDp6T8/KsXHgh7af1xdq0XCKanZHkihIl25D5bO?=
 =?us-ascii?Q?sEtlJwB0haLArs/x5Rpe/MI0Nl8Qs7YOH1UcQuCi1H5gnU+Q4TRR1438AFom?=
 =?us-ascii?Q?X6nkMeUH1UfZ7edGxbMblHKt5DM2pgVxTLTE4VpZG5E9DhXM3vzrxshjPwLs?=
 =?us-ascii?Q?5z03dkPXkfBBPQs86cQOf8OLufHM6J+tiKRTNASB84MI7W/AIOJTURWSEpwn?=
 =?us-ascii?Q?twFcvSCTpGnsxKwmTgezqw/H1rURy1mZX1VaRfkT89Pft/btdY2pDbHfzc1s?=
 =?us-ascii?Q?hH3x1oYoNBQAWlROoQ6jtUtkA0litVwmrKuFEDehyXzGyA9qtmRy9Vc4QUfM?=
 =?us-ascii?Q?9uq4qkJCa3Qd2/quKE/pgTVf9veBMg3goqCJ394RfUGh1vIhQFRKAJVJjnMd?=
 =?us-ascii?Q?x5wHMaXmxazkL8QahRtVvIXJ7yJF+Ounhs2sN7PiO2itYVo4OsthiJk9okZj?=
 =?us-ascii?Q?00e7u1/XaC59J4844SrfgLVGMRsNWykzx6oXPLMbIs4yENVWCgQXPngCnCi5?=
 =?us-ascii?Q?IzAK4lh9tp+DFA7y6CgPLKYuqcnqcOXIla5jLhFwiROFcfQBBI0IIYDAqDZo?=
 =?us-ascii?Q?eC8BAGdRey8Xlhf8XQGyE10+AZ3YQMKqm1kBKCaW5I2RomxEZCGmhSLCtZR+?=
 =?us-ascii?Q?PFYqDuA89Rat7cBPDhM6tGe5Tj1k//6NRd8UmyYDXsNOWiIibcO9lcwKksve?=
 =?us-ascii?Q?rRKSrwIlb+be27aL1ZvPSnvmTSDN7lcTijjwp3Ze1xG0znp+VJkjloQOELh6?=
 =?us-ascii?Q?YULAfwWXJuWjzQY2SkkvvGxyIGLar5Zk6MDl8ae36iMuRuTxnfa81c6WJuaX?=
 =?us-ascii?Q?1DeNSUHq4UCEfKl951cvFr9Gk5rdf7EBs1l1OurhUcoUJ09Gysh5YxQEgPdP?=
 =?us-ascii?Q?gARIZgGgas9nJmEikOdOpL50O1Xi0+WTjTbyvYHV6yjQMQcjBvNUkJY8VcBE?=
 =?us-ascii?Q?bjCRJDZ8/pzTSTNiSndQHGKKfkVZ6sACQ5RJNvsZCXunDK4NtuasIAC2hHlz?=
 =?us-ascii?Q?LiPA6A6LOI8KLrUn5NezS/Pl78euNZrbqmV1NpR5Yk56M+WDIx/W2i4saJRg?=
 =?us-ascii?Q?QcbHU/oNAkNDt7aCAys+dogU63KHxaLL/Zj4S4VO84Xqw+AhN8sXgs35uqdK?=
 =?us-ascii?Q?H5+RWqpK7NyqZS7HEylWJhTqhuqexVhxwDMueN6DOJOK6f/2kUkOqJEqUxSd?=
 =?us-ascii?Q?3AZV/pkdXqPqLrWMjVp8K9rt7MiccC7zp+DbEVXnDQF9sDhgFEl3FgYS5QR2?=
 =?us-ascii?Q?CSMY6Udx4t9buveVhedwzdQ+?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2112
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ff9bc706-9e9c-4b08-a616-08d9116f208a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yQ/NOuNdl1UN//sHxhn8hzbN2FiZEDrgOP9sR5dXEuHFWuM+yEgJ2CdfcmMsX9e/eXnC044WZXqGV7fzAdAciOJ9BOSwBhFrU6WeiNUHwP/YpzaTKxmVMAzGOcyiq/8lyVAuv5/dQEhON02Y2nvsE/x1Aaij/JSFr8A1QvMCBRT0VpcQ+LeYAxHrxQ5wAZnHjIawNCabqAIZcUJYH7V/KUP15KAB0tnizGY7oUD3YYrFCzYvAa14+WuFJvcGXCIS0sJTUQ0JN5p9FMObdIliLKcURuHAuxonGv6jspH1LQvjLkxnEoIBgcZuGJ62rSMOgoeJBqC6M3zD+AfadszGgtVtoFgfkZidFJpI8Hzsq5eRPe8rMf3ReG3w/DvqfCKMYuQOBaWyypXBcqTfpnyNbQmzm8AjylFcsKaAi1NEz9EdBnOE4qAjZs8ehLTM25h+SPyuTysitaB4WP8ubc78Mh2930OQ/iJH6uihZkacPRx4BDmZlP9REc8snOKxFM9dS+/B57Lfok9xnFCUa86NgmIBS55lfY2z3y83hlnjktNJIsy2Kk1heVM0qrq38Mb9wN/pHRituUMIKnad1FJzB5O27oJqT/9OXcqgxz2ZsbTUn5EcYEi2YpgyDLKRXQNYaTRdnoQH4a8B340n3aB+xNmn60XJ6y5WRwIgq6n+yTI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(376002)(346002)(36840700001)(46966006)(336012)(82310400003)(70206006)(54906003)(6486002)(478600001)(107886003)(8936002)(83380400001)(316002)(2906002)(26005)(86362001)(44832011)(956004)(6666004)(2616005)(70586007)(8676002)(6506007)(53546011)(33656002)(6862004)(6512007)(4326008)(16526019)(36756003)(81166007)(356005)(47076005)(5660300002)(82740400003)(36860700001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 15:45:36.1347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b45ad36-52d3-4da1-cc69-08d9116f282b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6646



> On 6 May 2021, at 17:12, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> ASAN reported one issue when Live Updating Xenstored:
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D873=3D=3DERROR: AddressSanitizer: stack-buffer-overflow on address =
0x7ffc194f53e0 at pc 0x555c6b323292 bp 0x7ffc194f5340 sp 0x7ffc194f5338
> WRITE of size 1 at 0x7ffc194f53e0 thread T0
>    #0 0x555c6b323291 in dump_state_node_perms xen/tools/xenstore/xenstore=
d_core.c:2468
>    #1 0x555c6b32746e in dump_state_special_node xen/tools/xenstore/xensto=
red_domain.c:1257
>    #2 0x555c6b32a702 in dump_state_special_nodes xen/tools/xenstore/xenst=
ored_domain.c:1273
>    #3 0x555c6b32ddb3 in lu_dump_state xen/tools/xenstore/xenstored_contro=
l.c:521
>    #4 0x555c6b32e380 in do_lu_start xen/tools/xenstore/xenstored_control.=
c:660
>    #5 0x555c6b31b461 in call_delayed xen/tools/xenstore/xenstored_core.c:=
278
>    #6 0x555c6b32275e in main xen/tools/xenstore/xenstored_core.c:2357
>    #7 0x7f95eecf3d09 in __libc_start_main ../csu/libc-start.c:308
>    #8 0x555c6b3197e9 in _start (/usr/local/sbin/xenstored+0xc7e9)
>=20
> Address 0x7ffc194f53e0 is located in stack of thread T0 at offset 80 in f=
rame
>    #0 0x555c6b32713e in dump_state_special_node xen/tools/xenstore/xensto=
red_domain.c:1232
>=20
>  This frame has 2 object(s):
>    [32, 40) 'head' (line 1233)
>    [64, 80) 'sn' (line 1234) <=3D=3D Memory access at offset 80 overflows=
 this variable
>=20
> This is happening because the callers are passing a pointer to a variable
> allocated on the stack. However, the field perms is a dynamic array, so
> Xenstored will end up to read outside of the variable.
>=20
> Rework the code so the permissions are written one by one in the fd.
>=20
> Fixes: ed6eebf17d2c ("tools/xenstore: dump the xenstore state for live up=
date")
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
> tools/xenstore/xenstored_core.c   | 26 ++++++++++++++------------
> tools/xenstore/xenstored_core.h   |  3 +--
> tools/xenstore/xenstored_domain.c |  2 +-
> 3 files changed, 16 insertions(+), 15 deletions(-)
>=20
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_c=
ore.c
> index d54a6042a9f7..f68da12b5b23 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -2447,34 +2447,36 @@ const char *dump_state_buffered_data(FILE *fp, co=
nst struct connection *c,
> 	return NULL;
> }
>=20
> -const char *dump_state_node_perms(FILE *fp, struct xs_state_node *sn,
> -				  const struct xs_permissions *perms,
> +const char *dump_state_node_perms(FILE *fp, const struct xs_permissions =
*perms,
> 				  unsigned int n_perms)
> {
> 	unsigned int p;
>=20
> 	for (p =3D 0; p < n_perms; p++) {
> +		struct xs_state_node_perm sp;
> +
> 		switch ((int)perms[p].perms & ~XS_PERM_IGNORE) {
> 		case XS_PERM_READ:
> -			sn->perms[p].access =3D XS_STATE_NODE_PERM_READ;
> +			sp.access =3D XS_STATE_NODE_PERM_READ;
> 			break;
> 		case XS_PERM_WRITE:
> -			sn->perms[p].access =3D XS_STATE_NODE_PERM_WRITE;
> +			sp.access =3D XS_STATE_NODE_PERM_WRITE;
> 			break;
> 		case XS_PERM_READ | XS_PERM_WRITE:
> -			sn->perms[p].access =3D XS_STATE_NODE_PERM_BOTH;
> +			sp.access =3D XS_STATE_NODE_PERM_BOTH;
> 			break;
> 		default:
> -			sn->perms[p].access =3D XS_STATE_NODE_PERM_NONE;
> +			sp.access =3D XS_STATE_NODE_PERM_NONE;
> 			break;
> 		}
> -		sn->perms[p].flags =3D (perms[p].perms & XS_PERM_IGNORE)
> +		sp.flags =3D (perms[p].perms & XS_PERM_IGNORE)
> 				     ? XS_STATE_NODE_PERM_IGNORE : 0;
> -		sn->perms[p].domid =3D perms[p].id;
> -	}
> +		sp.domid =3D perms[p].id;
>=20
> -	if (fwrite(sn->perms, sizeof(*sn->perms), n_perms, fp) !=3D n_perms)
> -		return "Dump node permissions error";
> +		if (fwrite(&sp, sizeof(sp), 1, fp) !=3D 1)
> +			return "Dump node permission error";
> +
> +	}
>=20
> 	return NULL;
> }
> @@ -2519,7 +2521,7 @@ static const char *dump_state_node_tree(FILE *fp, c=
har *path)
> 	if (fwrite(&sn, sizeof(sn), 1, fp) !=3D 1)
> 		return "Dump node state error";
>=20
> -	ret =3D dump_state_node_perms(fp, &sn, hdr->perms, hdr->num_perms);
> +	ret =3D dump_state_node_perms(fp, hdr->perms, hdr->num_perms);
> 	if (ret)
> 		return ret;
>=20
> diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_c=
ore.h
> index 1cdbc3dcb5f7..b50ea3f57d5a 100644
> --- a/tools/xenstore/xenstored_core.h
> +++ b/tools/xenstore/xenstored_core.h
> @@ -271,8 +271,7 @@ const char *dump_state_buffered_data(FILE *fp, const =
struct connection *c,
> 				     const struct connection *conn,
> 				     struct xs_state_connection *sc);
> const char *dump_state_nodes(FILE *fp, const void *ctx);
> -const char *dump_state_node_perms(FILE *fp, struct xs_state_node *sn,
> -				  const struct xs_permissions *perms,
> +const char *dump_state_node_perms(FILE *fp, const struct xs_permissions =
*perms,
> 				  unsigned int n_perms);
>=20
> void read_state_global(const void *ctx, const void *state);
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored=
_domain.c
> index 3d4d0649a243..580ed454a3f5 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -1254,7 +1254,7 @@ static const char *dump_state_special_node(FILE *fp=
, const char *name,
> 	if (fwrite(&sn, sizeof(sn), 1, fp) !=3D 1)
> 		return "Dump special node error";
>=20
> -	ret =3D dump_state_node_perms(fp, &sn, perms->p, perms->num);
> +	ret =3D dump_state_node_perms(fp, perms->p, perms->num);
> 	if (ret)
> 		return ret;
>=20
> --=20
> 2.17.1
>=20
>=20

Tested on FVP and another arm board, basic testing (run Xen, dom0, run one/=
two guests) - Everything fine.

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


