Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2063D3AE5B8
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 11:13:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145406.267539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvFzQ-0002H0-CN; Mon, 21 Jun 2021 09:13:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145406.267539; Mon, 21 Jun 2021 09:13:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvFzQ-0002Ea-8z; Mon, 21 Jun 2021 09:13:08 +0000
Received: by outflank-mailman (input) for mailman id 145406;
 Mon, 21 Jun 2021 09:13:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNPZ=LP=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lvFzP-0002EQ-2u
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 09:13:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.57]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e1f01ae-940a-4cf8-97e2-55f3742dee54;
 Mon, 21 Jun 2021 09:13:05 +0000 (UTC)
Received: from AM5PR0701CA0014.eurprd07.prod.outlook.com
 (2603:10a6:203:51::24) by PA4PR08MB6080.eurprd08.prod.outlook.com
 (2603:10a6:102:ec::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 21 Jun
 2021 09:13:03 +0000
Received: from AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::8c) by AM5PR0701CA0014.outlook.office365.com
 (2603:10a6:203:51::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.7 via Frontend
 Transport; Mon, 21 Jun 2021 09:13:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT008.mail.protection.outlook.com (10.152.16.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Mon, 21 Jun 2021 09:13:02 +0000
Received: ("Tessian outbound 41e46b2c3cec:v96");
 Mon, 21 Jun 2021 09:13:02 +0000
Received: from 1c51224efe75.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F8D3370E-981F-4B5F-AFCA-152BEDEA9464.1; 
 Mon, 21 Jun 2021 09:12:36 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1c51224efe75.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Jun 2021 09:12:36 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6878.eurprd08.prod.outlook.com (2603:10a6:102:139::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Mon, 21 Jun
 2021 09:12:33 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025%8]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 09:12:33 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0001.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:150::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Mon, 21 Jun 2021 09:12:33 +0000
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
X-Inumbo-ID: 4e1f01ae-940a-4cf8-97e2-55f3742dee54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcB0ay7yLz754DCvA6zo75l+swGavIXx1xClsoBuoLQ=;
 b=vh624p/8m3RyYfPbOk5UPiZj7lqgUlBcSVk/6nDrDXjQYsXBvz/lb6civGJKNE7IYdp7h+TNgl51jXsThRIPga8ePhsUYHxplSqMmDxNC06myg4NWwb9bcJrWc5/5eT4+2vUvCnQWmeEHz+mNkyXhg4xS5AjUPQ2qWFA3+QwH3o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 479a7ecdb81ca24d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMz81y2Duil5IkpEudtPuDdDm+JjqFWDhb9NwaXM+UEvrvwYEiwa1EB8Nvxy5VB+hT53gcLYRLnMbwpG1HQlOFk6iLiAum4NDLWKP2XfKuFrN1jy3O+iix2Yh0MEcS618zQ0DXQS+8jwl/RdVdbQsQoWkE4g1K7YdQAqgEYuSgNmEUSGwgdUGtXzicvyGA9u9f9a/iVRFoJq98oBJDKw79dDDbAtKsLbjE8AihxgYJaLM3o/CH/oxwXHt+/lVf5ONwo/XGiK7TxUl4GFPnhi+t2JtgSw8dtgEYCAC2KHAY8oZkQo/wKoOGyv7rkNSChUeBTMWGFhMl8mXgpjJt+/yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcB0ay7yLz754DCvA6zo75l+swGavIXx1xClsoBuoLQ=;
 b=CM9KlHvuw1ubLXLFW+11kQNDebROkYQQcjku5J7VsTp5yE2jhS3lCM1TUFXvjJHj9GkplLnh8P3PjJf0jtfXxCrnNF4XbYpL3hpoFsKmAmhC1IepXzlYdRncaF3miVZCdHN9uNMqDX2lQndSagPirzt1qsFCfcJzNMFC4cro/bpoCgICCTEUAaI4cfZGTFaKvNYsdzKmY3JD+xase6roAup6wvgvjA95MlMtkgYwfjLBEMtXWQngYWXRPmu9nOEjZX+NsZ5KIO0v1/FaGj/deXaujP1n114NGZb7c0ICpwfCTBEA9kvu99Ia3lt4nQZ0zJMXNBcc6HvXtUPx0zmUWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcB0ay7yLz754DCvA6zo75l+swGavIXx1xClsoBuoLQ=;
 b=vh624p/8m3RyYfPbOk5UPiZj7lqgUlBcSVk/6nDrDXjQYsXBvz/lb6civGJKNE7IYdp7h+TNgl51jXsThRIPga8ePhsUYHxplSqMmDxNC06myg4NWwb9bcJrWc5/5eT4+2vUvCnQWmeEHz+mNkyXhg4xS5AjUPQ2qWFA3+QwH3o=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 07/10] tools/xenstored: delay_request: don't assume
 conn->in == in
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20210616144324.31652-8-julien@xen.org>
Date: Mon, 21 Jun 2021 10:12:27 +0100
Cc: xen-devel@lists.xenproject.org,
 raphning@amazon.co.uk,
 doebel@amazon.de,
 Julien Grall <jgrall@amazon.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2BDB4DB7-3132-48BD-A83B-4E5E7D9C48B9@arm.com>
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-8-julien@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::6) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d14ea80-9ac5-4c0c-cff9-08d93494c5c1
X-MS-TrafficTypeDiagnostic: PAXPR08MB6878:|PA4PR08MB6080:
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB6080DDC7DF8ADDDD00C06B3EE40A9@PA4PR08MB6080.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sfVxTA7cdRPC2Mqsaz2t7vYDuqDt8ELnTf8b5fxXzAfoSezIXP6J32SJKCR0iofEcl29VpM/mLBbxO9YWFGLj5CY9D8cQGeX+EBCebcnnAhgQSkcEXmH+0/KnQ/tLjAwF0JNEWspmqKfgI/a+8ImydiO5ICIx095xZSq9rjWLd3yzPzrmPanK+gWEOTwN5srmpcRTZhz2cdZ2jhNE7DxIxB5KIkUhlGg7vNcOfPuN4cZ0kRqI23Z99/HPQSz47BFkvbXcKLottqEgU/wM0fBWiIAVeCFBS4WL3s9J+hIu7ZfwSoXWeatEGobWa1BLHyF2mg/kVcxtDIVuHehxEbXzBogr49jDHx6StxBS/X+vywVn1qjplSSL79IG3LVat4LVfVCihW6ae2HR5oYRkZt6G1VA8syNOJ6f1mZpuj51LNaSrpYt+wg9D8NWWrhfkWJIhfUlY0oi5cVRDJ1lZC6BE0SOxtJYJopSlNTG8txJhDSJ/alFDaf3jsowHSG0R+6U4IVlzLahW7Dhhn7B5w9C4lh6vhpyeT/Y/m0vc51pHnCGMuZJrXC+glh13fxn+I8QhRgC3K9uH2jc/zUAAUyLm7J2Vmcq9XJjIDJ6PuhbRsbhXaQ26k4knX3Z5TtA0h86IQ1hnzUcqBV+WBBdjOV9IdkFyQ+VJhOhky65rKd8HGLF90YKSkLnByRlNx7wDw3
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(6666004)(6916009)(44832011)(8936002)(26005)(52116002)(8676002)(36756003)(86362001)(4326008)(33656002)(38100700002)(186003)(38350700002)(16526019)(6512007)(956004)(2616005)(54906003)(6486002)(66556008)(66476007)(478600001)(83380400001)(316002)(6506007)(66946007)(2906002)(53546011)(5660300002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?p5S3czgWt4DobJ2FMRH7Rj6/4WWiSoF+aohJLe0dL7mPJbsMNWJMAOE7Ru+f?=
 =?us-ascii?Q?3L1SsfzY47NzgchzfXde5cLl0dZL6O7j/R5vWk2f6TsKHdSX9E7Neg6l60gF?=
 =?us-ascii?Q?JvJZa6rif2wavqItCGh93bEQSV1ZiHSMuyQlg67XDR8f0RxbSB95zskKByAe?=
 =?us-ascii?Q?5H/Oe0lgYbJ4M7lCkcjpuoeCoNGkwAbUkYlH0VoA7u9ecKgvARWDv5kbocqq?=
 =?us-ascii?Q?o7EXaKuYQrcmey3t7cirZL3h83UIs3ZJdc5iWPwWtgHEz2Q9xGRiqV6FptSh?=
 =?us-ascii?Q?TMNsTtm9Ici76TT7QcQDDF2MeDuI2B/14sPPD0fa+nexrc8QRxluMKTRaMZ8?=
 =?us-ascii?Q?nPpWQlLoNTSML/nN96/bPnlIAGVL+Vjs7+6OuuxVKMHGM26UIDMSylIw2aPA?=
 =?us-ascii?Q?p6gQ/zb6mqOlv9xU1oFDDwzi3NgSCByKvHALQAnxB5OaQaUr+tuIWSHMZZdg?=
 =?us-ascii?Q?Ve78uJ8lwiCjsQ8Lp3W3LpFOriG+w8lXZwLN+kl9wCS7Wx0qCzxhXxomaRCh?=
 =?us-ascii?Q?a44MJLKoQat8B17/FEo+8OIqzEGbIV/D85fh2bxs+qfOGEPiaWYHU3D6NGVk?=
 =?us-ascii?Q?39j4fZrShDBuO2YgT1F7Wmc4OM9bThNMagkjdcpK3mHwiixF7v7/Vsb/SA1l?=
 =?us-ascii?Q?8Xb7jHgWOXOgarLmZjwH6OMJYhWMVbcVPUqZxy8sa9DHjaeryFN+af92IlJv?=
 =?us-ascii?Q?f03vLBXYVyvQY2x87zEjOeHu2Dn6/3uEZKZh7tD8uiThWxr0ZRHHF1fbPhko?=
 =?us-ascii?Q?Pq9lzrAK32NNwoIpyP5kfRCujGpP71TCCVSi638Mmo/4QlP45DPjW3OR4k+E?=
 =?us-ascii?Q?Fi4BRur4xo04LJXZKRLJO4tsb6AnHAs+k3+GpTkiCvo/1fETURCSi8zt+rhN?=
 =?us-ascii?Q?kiWHpilWnmrz1gPp4dNvT6tCXl4GmkbHAlgfgKgsJZ3+K7BK+qgcSX6VC8zB?=
 =?us-ascii?Q?RgORvyUpZnwoVhTyE2ytHPfynZmbOi76TZjWVgu7ONU70few+9NYlPBSERGe?=
 =?us-ascii?Q?0exPEHSCvU8YL3ZvV7EpXw/D9rw3khSub7LNr14imBUrlC9OICKQP7dMQsDh?=
 =?us-ascii?Q?9VmOHJHHZ8Dz8dd2lG5YSYTxTPSac7YfEuE2WlANJ0ncxi1LL1/O6PGkrFuo?=
 =?us-ascii?Q?SBpAVwgIS+3gH/rnWYUbRP1uHbRRe16K0v5oprnjcwtmNy1QoskjEwQ0Ch7C?=
 =?us-ascii?Q?L4eFoCuBxBhtHxthF4tJMxUvsT+ivgEcNx6UyshlQUa4F6C2iJcaVnaZKEpk?=
 =?us-ascii?Q?fWBDwZS9D9zmD9tnJa/4vL4ugdJ31UD1fc/X1B1MjLezLvf7mgN67aOlzC3Z?=
 =?us-ascii?Q?AhicBpyD8HnJWB3v5ywVyWE/?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6878
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9e5ebb3f-f28e-4f37-3663-08d93494b46e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hnecnqT37K0fpf+Q5XbMJSInwujIKfSHabVOsIcGhLZCIKcqQ4EwL9LJzYEoJcwEn/u+jHnt6d0RZ2mFihk6UrMPOyYSzEcFJHmPkv1VnGOZa53/9iQ2IMmQ2Jbe2Qz2RPhVeQpwTl7fWZ+2z3c7krsBivxhTDs6FcxZJgAzhI8ouW/b0F/zWjDGyCMXpgJbdWXhkESAaQp8QOFwLYawVS/8bf1sy3kB8/JS6ta/gxcAMHPZgfyOdJ5bQl7e/DtrKYKMsJyQnviAK3GG2pXy1OAZ2TjoDyn01SStJHFSjI+kmXYxX5KbF1/+am0Ke3qP7zqDz2CtDvnkgjdblHmOey0yMv5D4oX8alWFQf/I1OF/gAu1frbwmYw51BCz+H9Fe4/CrTy7NLAffN4Xz/EyRwWjHogkAVq1p+OyI79hLib62A/roVYvPermePRMMlCNV9R1OOuwlgxVyeCcqDYkAAa1xaZUDTYLAc1b/nwjyWVg3YWK3B/9VEy9KtDGRmnkbspiEewCMTTVLnYukaMC+yBLNwGCIQbT//Q6FeQKV/t4m5JCbKAipKDTnSTNpub4sXFr8gVX/af9ABtqf5eMcUs0f8xRHTpa0BvfMVFAiHdc3QDRYH2gHh5S2M6LBMMTwfwNKvGJYd5l961HuQ++LbiYH7IN7d8QOVRBHCSPOFA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(39850400004)(346002)(136003)(46966006)(36840700001)(70586007)(70206006)(44832011)(6666004)(36756003)(186003)(2906002)(336012)(47076005)(16526019)(82740400003)(6506007)(83380400001)(8936002)(107886003)(82310400003)(54906003)(5660300002)(316002)(356005)(36860700001)(4326008)(6512007)(6486002)(8676002)(33656002)(26005)(478600001)(2616005)(6862004)(956004)(81166007)(53546011)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 09:13:02.6723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d14ea80-9ac5-4c0c-cff9-08d93494c5c1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6080



> On 16 Jun 2021, at 15:43, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> delay_request() is currently assuming that the request delayed is
> always conn->in. This is currently correct, but it is a call for
> a latent bug as the function allows the caller to specify any request.
>=20
> To prevent any future surprise, check if the request delayed is the
> current one.
>=20
> Fixes: c5ca1404b4 ("tools/xenstore: add support for delaying execution of=
 a xenstore request")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> ---
> tools/xenstore/xenstored_core.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_c=
ore.c
> index 2e5760fe4599..a5084a5b173d 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -306,7 +306,9 @@ int delay_request(struct connection *conn, struct buf=
fered_data *in,
> 	delayed_requests++;
> 	list_add(&req->list, &conn->delayed);
>=20
> -	conn->in =3D NULL;
> +	/* Unlink the request from conn if this is the current one */
> +	if (conn->in =3D=3D in)
> +		conn->in =3D NULL;
>=20
> 	return 0;
> }
> --=20
> 2.17.1
>=20
>=20


