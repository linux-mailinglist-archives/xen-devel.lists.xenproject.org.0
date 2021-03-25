Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBAC348BC0
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 09:44:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101309.193666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPLam-0003oQ-Tz; Thu, 25 Mar 2021 08:43:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101309.193666; Thu, 25 Mar 2021 08:43:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPLam-0003o1-QX; Thu, 25 Mar 2021 08:43:48 +0000
Received: by outflank-mailman (input) for mailman id 101309;
 Thu, 25 Mar 2021 08:43:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Efs5=IX=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lPLak-0003nw-FA
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 08:43:46 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.48]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5eedced8-7bbe-46b4-8184-c846110e2055;
 Thu, 25 Mar 2021 08:43:44 +0000 (UTC)
Received: from DB6PR0801CA0049.eurprd08.prod.outlook.com (2603:10a6:4:2b::17)
 by AM5PR0801MB1666.eurprd08.prod.outlook.com (2603:10a6:203:3a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 25 Mar
 2021 08:43:42 +0000
Received: from DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::56) by DB6PR0801CA0049.outlook.office365.com
 (2603:10a6:4:2b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.28 via Frontend
 Transport; Thu, 25 Mar 2021 08:43:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT020.mail.protection.outlook.com (10.152.20.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Thu, 25 Mar 2021 08:43:42 +0000
Received: ("Tessian outbound 2220e7a8bae2:v89");
 Thu, 25 Mar 2021 08:43:42 +0000
Received: from ca65afb11c34.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 17B2DF11-8F4B-4C80-B011-DA3F9CD5A97C.1; 
 Thu, 25 Mar 2021 08:43:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ca65afb11c34.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 25 Mar 2021 08:43:31 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB7PR08MB3468.eurprd08.prod.outlook.com (2603:10a6:10:4a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Thu, 25 Mar
 2021 08:43:29 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d%7]) with mapi id 15.20.3955.025; Thu, 25 Mar 2021
 08:43:29 +0000
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
X-Inumbo-ID: 5eedced8-7bbe-46b4-8184-c846110e2055
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnNEsdtLlbYz3k5WD97YhSr/o82rgDf5spMg8YQLciU=;
 b=9Go/Y02Tp0L72U+OHZ82QQATCvdhH4LFmCRFYOuv7gxPrxiPs0o6QbsUcqDnZBLsUi1sFhb7153v0tTsWv58vXmeWs2k6y+hnwYgdn0Fytx9YV8OJGXG7q9smEEKUu25ARvdI6SRIWlwuHIcITTajwsZQ3N4idLWxJX4bme4m5g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1abb25f604239ff9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KoPjHbdGvDt80dD86zO+/QGLseLKG8DmxO89U5rvFDYSZDWTZlzoUifTxXLWbfPCZUFlVJvuTI9xdXn0Z5YRJ73jOZ5UBEX6/Md2X3l9dLGYWUT5QIgp+3QXqe/u+RJ5IYuCwnHKttQthd06IQlz81H7a/nbA4L9bTjudwIz8+A0ploZVBEi4A+SsrkHqOwXNDCAlVfASJ2TLvmpHCFxGg223OXPt0rWW6d9OrZ8up1ltWPwP8dBM5mhs6N8niLZu6dKpLRau8ESPRbgqYnpPEiCz2qD5VZwpFk4U4AbC2svAB/lEvNpL1sWD4qQ/aZcswc0ro6jP5MplVoktIkYyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnNEsdtLlbYz3k5WD97YhSr/o82rgDf5spMg8YQLciU=;
 b=bHM8gtqy8VwwWzx/J80Y+oIivTJ/QTmodoGJE4YR7SND7+VycMWOI/tItX65X1IbDLuFPWF+X409r1Vrxt/TsCLL0866YJF6sHJTHB714EW3PihLQcPB1oEaJtbyx6i3kiXLvNj3J/Vh/69pP1HG6ghhm+GUKvbo0iE1MknOiL7sHYkzxNS4UXoHyXOG7BV9tCu5OSfT9/cMTke5e7E9A6ygnzACtXszquIAvFguFItkqYLzXdnclxkcwP45qpc4LGwwsARIqu2gM8Sk1WJoFFh3jAyXwExm+8g6yTWG+IBUW4eAZeFGy13OGDxxA1icIz/rSxFW/52erJE971HCPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnNEsdtLlbYz3k5WD97YhSr/o82rgDf5spMg8YQLciU=;
 b=9Go/Y02Tp0L72U+OHZ82QQATCvdhH4LFmCRFYOuv7gxPrxiPs0o6QbsUcqDnZBLsUi1sFhb7153v0tTsWv58vXmeWs2k6y+hnwYgdn0Fytx9YV8OJGXG7q9smEEKUu25ARvdI6SRIWlwuHIcITTajwsZQ3N4idLWxJX4bme4m5g=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 0/5] xen/arm: smmuv1: Fix stream match conflict issue
Thread-Topic: [PATCH v2 0/5] xen/arm: smmuv1: Fix stream match conflict issue
Thread-Index: AQHXHzYZIkvPmBX7B0S2bJuXA88YyqqTn7UAgADHuQA=
Date: Thu, 25 Mar 2021 08:43:29 +0000
Message-ID: <B19CEE03-15B7-4A8C-9A2E-598268E53BB8@arm.com>
References: <cover.1616428314.git.rahul.singh@arm.com>
 <2e1af560-5657-32cf-ad6f-c94086e2309b@xen.org>
In-Reply-To: <2e1af560-5657-32cf-ad6f-c94086e2309b@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 360d917f-67cb-464b-aa1e-08d8ef6a1826
x-ms-traffictypediagnostic: DB7PR08MB3468:|AM5PR0801MB1666:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB1666B3CC043EF20ECEDCDEE3FC629@AM5PR0801MB1666.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2201;OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tZ7MMs6AQYP48YUQ3se4cRoFLGFIIihxEpKsiAXquaDtS4E2xnYohrzxnlP1BRoz3EY2+8b/dAGPnefROaLrbZdvlHqpJbJ6ba1N90LGmV1XxMQ/O/6FB6bY/bOiqXNDOYaqHUWS0qzYNBCghrsiXhF/MV8aCdq1VRbYOhMldYNaNkzgGa7vZvhSPLYSciaIpgTJXfbsBISPYXynVx+S+8lEU//sg2L7f3oFpE13Vl3lMZsIenLqYBNIxgps/LHkAhIxjw0xrcLI8ZzL9KqXL9pnYYG6D7UvufCOm8+xu3GnbRzDzOw2ozvJv5WIejvUkbL04nv++/kT4Ki9nrjnvi7tN8sNAQBn2DGboOPGAPUk/y1F+2HzQQv9T/qIwLHsY8gkDNUDkyex51dHq4kuQDlw7pltYIjgv0zwfkN55LBYpUZ2o6MRvX8RwYk9BAa3r/oLDTNHR9v82pmSCJjcuKbTdTXtBNxwg2C5fsPbjMg+qpBYwxGfIEDv201x1u+awHISjj/Rp5dFBaypdqAA4/au0p/Z+S21toShTTNcaAhvYjccu0tsVGhxtkmrsJZL+KHkMKh5rdprokfHUCuBkdfDZq3gmXEjvpLrUCTgibimZjX742sZI8vYHLlSl8WVicMsuYzMWjdo6whgx5WXjEfSf2H6YMsIA6VUNyAy/9bM5JquUC/OYCPyOPavou3D
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(66476007)(186003)(6506007)(66446008)(26005)(64756008)(8676002)(66556008)(38100700001)(6916009)(91956017)(478600001)(66946007)(33656002)(76116006)(83380400001)(53546011)(6512007)(36756003)(54906003)(2906002)(86362001)(71200400001)(6486002)(2616005)(8936002)(5660300002)(4326008)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?QRJXC6SqkDpQ6gFz48u87xXN1h/5ts385f7QFITV2vpMg1mpraFr/6hcpBAW?=
 =?us-ascii?Q?z9F2mShJEFyIzarFT9NRDbcb0nGX/VUWT15WkB5jEAl/5FuCkM+oc5VY35bk?=
 =?us-ascii?Q?zmWpzdmHwpTXC5Mk5cpW2hUbkltDKphAdmxlWnhpPYtod4hscMwnkxrw+rUL?=
 =?us-ascii?Q?iemTE86cq9SBt2T1CunUjHt+fMb0agN6mWMrWJXBIRQbv91FcKZqsWB5F5IB?=
 =?us-ascii?Q?jYtNJh6KCut5RWwsf4zDsEh92sUmooxKJEWpxyocL30TOCD1d/FFYfF/OpBa?=
 =?us-ascii?Q?pUTnp5bI3fl5tyGegxclCd/+BqoPaqFgjA3t/8Mra79haX3DtGdWzqmoCHev?=
 =?us-ascii?Q?qquBPbQUrlqKrfFeRs0MfBI0qui9gZCXGakAf2nMC0aIeCRmmMxhcbQJy5CS?=
 =?us-ascii?Q?pV4G2WGQsooL0DiflAoNe8lVbJyCtOHcjxInmB7UDG7Haf8k8o+HdLYPqQID?=
 =?us-ascii?Q?FnS3m7vxoJoFbZFePlF0uvSTUmdZpc+y7ZMFmQWoExSSYJzdyx8sun2AWi3S?=
 =?us-ascii?Q?eiCsgsRFK7qkxhB3UhfuSw/RaPADyPACrcKtWCby0D36/rI9pe8HcV3wDLpY?=
 =?us-ascii?Q?md4zZf8sJl736vrIDS6mXbcGVhx+O6aUI0siCbpsvLzxDga3jvaIIpp53dp5?=
 =?us-ascii?Q?CldHW01Ez+hRlMRvaXhq6WQLtB3nj/ZZZ8yi5ITIJgK1jdUslGFH6YA4+irV?=
 =?us-ascii?Q?lfqOQcoqyf5+nKZZuOOif71a8IDbMi6bfZJJnoV+MIy8/RRJzWmgCFX7glYh?=
 =?us-ascii?Q?e/rOS1wEpp+xTaSmQc4QKtoIKbWaJYEq9H56PlOpTFJVDcuXHF6F7/I2W2OH?=
 =?us-ascii?Q?rBwFgYdvTeHTaXoKhwaDoXI6IMy2ftu5W0y+PifrCu194LX17PQMt4Vz/sww?=
 =?us-ascii?Q?cye8UQfR24vKi5QUH69GB5eamAmmk1TRUckzf95Sq8TqIxp/bk6wnuxmYlA5?=
 =?us-ascii?Q?cY3YpGPWYeq5Eg+RngVhGvyqmYMIzv0bmJn9HwfSpR+QYproGwRaUAuyrS/k?=
 =?us-ascii?Q?CAwGe/R9h4j7sc5dvyE0VNQvsKxWsGf1i2IiDxCSuRQ7DyWuaBw4W9SsCX2S?=
 =?us-ascii?Q?LsA34pWuUNvQcV9c1qZLEP7a5GezFMUWoKUQAMYB/d7E3ebxkgz65zqNwRWh?=
 =?us-ascii?Q?EOEi6nqrlMphlND4LshDYV3JG6hQ7/w+THAsSpDn/oQoAVJEykpfUQIe0yGP?=
 =?us-ascii?Q?QcYuj1MUkJKeaxL9hz3J34K5+hxbLqlPGcqCcdwRuP+zG7hT8Uzk/hLZ9/zm?=
 =?us-ascii?Q?/+S1t5/mt5QN1Dr/QzHZUhj/6ThAr1wwlx8161b87CWCQS1ASU+wMSPykYN5?=
 =?us-ascii?Q?6nSJzQDlLyxC/IUinA9Ybx46?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <78022B0150B37D4B858941DEE5FBC459@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3468
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8b2de174-7ca5-4bb5-d6db-08d8ef6a108a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O1aFrZEDrL5ThaO8p0uKdcT51XgqTrJot5dgur0jREmIW503uMMjA8rAqYDghny76EbGt8+VMahj1kMuALVGB2ol9uhfx50Hk0iHZGtHFdBbc9AgQjT5AdKv5Akst/hoK+pDN/ieMaQkqcQS4Z9Co/3aybU3LtpwA/oDXabSpEltwPPWsRJ21o56xOL8luAdCGklWTraYF1DpmUUjEEV/AlTLOKhz4F1XhfALrS6Ur/Ia8qR4MWJXlym1ySMBSXcem00eSc48WuZ5agTeTng7t3wAfkKpjJeCACMsmeZSLo/zRUoe9XzyRkFr7eb5im4Y82V1eFcqMDtO3l8co63lFzSe5n0rrAXbSUICGlqazNI7A6UUVFxIXWCX3hwSMnTDhF67FiiowVMzC1gQ2qTz+Iq2SaRficolABhXC3SvMIKXlcz1IskYsnsgh6Ihbsw+oaDWJ7juxkwDGwjBOE2mmmshXYHqvTeMUTS5gBsbh3oV1XIojLghxEhxQNe0+ZXUxrjD1U/+quGkpNVfx7iwVc2P3R83LFYHIaa4iNkvWusUadcCotfjaMasV12DcCkPjszFGNNpIhbDGLtpdJyFpwJNlL5riCVyvusy7HwtuNqo4MXszLG9kGUeNkGQxwphgMy9HkjMbn3UapH2l+Ka/vZmOZSDW/JFrNIv7OLv40=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966006)(36840700001)(6486002)(86362001)(53546011)(6862004)(82310400003)(82740400003)(36756003)(81166007)(478600001)(83380400001)(336012)(4326008)(36860700001)(8936002)(2906002)(47076005)(6506007)(54906003)(6512007)(8676002)(26005)(107886003)(70586007)(33656002)(356005)(70206006)(2616005)(316002)(5660300002)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 08:43:42.3624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 360d917f-67cb-464b-aa1e-08d8ef6a1826
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1666

Hi Julien,

> On 24 Mar 2021, at 8:48 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> On 22/03/2021 16:11, Rahul Singh wrote:
>> This patch is the work to fix the stream match conflict issue when two d=
evices
>> have the same stream-id.
>> Approach taken is to merge the below commit from Linux driver to fix the
>> issue.
>> 1. "iommu/arm-smmu: Handle stream IDs more dynamically"
>>    commit 21174240e4f4439bb8ed6c116cdbdc03eba2126e
>> 2. "iommu/arm-smmu: Consolidate stream map entry state"
>>    commit 1f3d5ca43019bff1105838712d55be087d93c0da
>> 3. "iommu/arm-smmu: Keep track of S2CR state"
>>    commit 8e8b203eabd8b9e96d02d6339e4abce3e5a7ea4b
>> 4. "iommu/arm-smmu: Add a stream map entry iterator"
>>    commit d3097e39302083d58922a3d1032d7d59a63d263d
>> 5. "iommu/arm-smmu: Intelligent SMR allocation"
>>    commit 588888a7399db352d2b1a41c9d5b3bf0fd482390
>> Changes since v2:
>>  - Updated commit message to show the original author of the patch.
>>  - Added  Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>>  - Addded Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>   Rahul Singh (5):
>>   xen/arm: smmuv1: Handle stream IDs more dynamically
>>   xen/arm: smmuv1: Consolidate stream map entry state
>>   xen/arm: smmuv1: Keep track of S2CR state
>>   xen/arm: smmuv1: Add a stream map entry iterator
>>   xen/arm: smmuv1: Intelligent SMR allocation
>=20
> I went through the commit messages and they look good to me:
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>
>=20
> I have committed the series to my for-next/4.16 branch. They will be merg=
ed soon in staging.

Thanks.

Regards,
Rahul
>=20
> Cheers,
>=20
>>  xen/drivers/passthrough/arm/smmu.c | 423 ++++++++++++++++++-----------
>>  1 file changed, 262 insertions(+), 161 deletions(-)
>=20
> --=20
> Julien Grall


