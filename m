Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 724763AE5F1
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 11:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145413.267551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvG8P-0003j2-60; Mon, 21 Jun 2021 09:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145413.267551; Mon, 21 Jun 2021 09:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvG8P-0003hr-1G; Mon, 21 Jun 2021 09:22:25 +0000
Received: by outflank-mailman (input) for mailman id 145413;
 Mon, 21 Jun 2021 09:22:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNPZ=LP=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lvG8N-0003gK-Qq
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 09:22:24 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.48]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 561844a9-3f4f-435c-859b-e3846f904d11;
 Mon, 21 Jun 2021 09:22:22 +0000 (UTC)
Received: from DU2PR04CA0009.eurprd04.prod.outlook.com (2603:10a6:10:3b::14)
 by DB9PR08MB7115.eurprd08.prod.outlook.com (2603:10a6:10:2c8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 21 Jun
 2021 09:22:18 +0000
Received: from DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::f0) by DU2PR04CA0009.outlook.office365.com
 (2603:10a6:10:3b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18 via Frontend
 Transport; Mon, 21 Jun 2021 09:22:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT011.mail.protection.outlook.com (10.152.20.95) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Mon, 21 Jun 2021 09:22:18 +0000
Received: ("Tessian outbound 7799c3c2ab28:v96");
 Mon, 21 Jun 2021 09:22:18 +0000
Received: from 974aac4ca62c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C20CD189-0122-4808-8FDD-CCB16E8F0B0C.1; 
 Mon, 21 Jun 2021 09:21:40 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 974aac4ca62c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Jun 2021 09:21:40 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB5998.eurprd08.prod.outlook.com (2603:10a6:102:e9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Mon, 21 Jun
 2021 09:21:37 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025%8]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 09:21:37 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0118.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:192::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19 via Frontend Transport; Mon, 21 Jun 2021 09:21:37 +0000
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
X-Inumbo-ID: 561844a9-3f4f-435c-859b-e3846f904d11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KB2l6Hom7Es/jr83vEc+nSM1AX8WyJrcuMmjibanQNg=;
 b=CfXAGeSE0aoHFIijnHEdMvwyDPmagaHr05EmLbKi5lY+SZdGbPyY3OrlrA9oePeyn2ZWxcfIDb5Nw8Abo7CM03wc+VnF/Luokp5GgrpR1hhrNVq1/NU9dFWK2z322qv0a6I231qk59DU6MDhKB2vI0wQ/eestRae8BuTgLBBTuQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2680b739582b2fe3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1NBlhoIWdRUlt337C6ofn7gNERra7U+s5TEWAGOvtT2UHPK2qzpza1h5rWIRlYlgqwcf9oWwDRX7M5+6yDORxIn6R6ueEXpVLN6/HrHs8ym3sIU0zM4ZxoYLQy8WdZi2bsZnsyYTyS4IUEkCNDx8q6cTm3v3cnWmqP3E5GsAGy7kfBe3U/8E8wcpe/YsPncXZgiiYsRKjgKdqvmIoWQvAIQbwk74sDiY3R6nQrMuHeC49/y3nUgDabkZA63dbR9GdNlN37V7Icwk7EB1Q+URnP6k9SWPVZBOjNbctgiZPlgTE0wr+IyieXB4HoJaWfqueGUvCqIKTpy8bTLBHIkrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KB2l6Hom7Es/jr83vEc+nSM1AX8WyJrcuMmjibanQNg=;
 b=SNTb0LsB+j5Eb5r6Uz1c5o5L2Ok3dnrGdPMcQ6RKaxje70JHmtSNo6kGHp3jr8Jp1eonzTP/rZeQ/RCL1J4V5ukbvsQYchMbDRL9OwWuF18bPDAYlt0my6hMdXAU6OvjSj5vUY8BvehkeLzFJocJsuUYXS8sSunfZ1PAAtTqA74w/rhHxPJTtXN3UFPewxh3TVs+CjW3qKetprVgB7Q0WddDLEiQA3xrQiwmU0XMKY2eY9y3qz46052LvVVlktcfFekSB5HRBWG5wd+ca24NQoklsxduKzSi80SuoL4ScxpIc2JLHSJ8Iv8ZkWtl6eBQg9QoBcdoHAWp3GnZ/z64OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KB2l6Hom7Es/jr83vEc+nSM1AX8WyJrcuMmjibanQNg=;
 b=CfXAGeSE0aoHFIijnHEdMvwyDPmagaHr05EmLbKi5lY+SZdGbPyY3OrlrA9oePeyn2ZWxcfIDb5Nw8Abo7CM03wc+VnF/Luokp5GgrpR1hhrNVq1/NU9dFWK2z322qv0a6I231qk59DU6MDhKB2vI0wQ/eestRae8BuTgLBBTuQ=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 08/10] tools/xenstored: Extend restore code to handle
 multiple input buffer
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20210616144324.31652-9-julien@xen.org>
Date: Mon, 21 Jun 2021 10:21:30 +0100
Cc: xen-devel@lists.xenproject.org,
 raphning@amazon.co.uk,
 doebel@amazon.de,
 Julien Grall <jgrall@amazon.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F12B315C-8C0C-4EEE-A3DE-209C8F9EA04E@arm.com>
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-9-julien@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0118.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::15) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a31ee7f-a1f0-4db6-effa-08d9349610dd
X-MS-TrafficTypeDiagnostic: PA4PR08MB5998:|DB9PR08MB7115:
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB7115327C904E184C97D907B4E40A9@DB9PR08MB7115.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mBxxaTpu8nFzeGn0CfzuJ6nA1GCrw4jesTkR4HB+16Ot85oeIe5OLUX0K6S/80urDgAAQSg16Mn26nrGn4MopdWrr5FjHOwPmHOL+dydAkWyUQrKRKu97EEKrJzWMAmNK/llz0hqisiIFjKdT0Fe/Nba+47n3L/1iMtbybhkqYwosWLKbJSumhpg+2WoAQvEoTfoMAQH81tjMAbXeQ1D4nFB+HtypWLNgPnt/CxLMWUU5KTvE2f3eHd2X/BrFQT1KJTDV/cotw2cbTwPqWYS6T7sqcE+9kqHCPhYLNzkqc+GQXnoAkRzkQ2OHdwXuL+T51YmSUJxUfT3IdjEVera/OC+AwiIYEfyNJYVOQlZ2T52gHl3bU00903mJj2iD3e3wPJrosWpz9PgZdmibz13Dtnh/R79R5uEfCLHMb/Y4Qj90+wm6HpQrrT1pp0XIgtGDWcJru0aVeWrnCUPn90tgyBiR1V6JUxkgWXOQzEMwRTEE1C5qJsazfsuOzBBJrgc/mDsutgFi/Ux6fexlKEfmw5L8x9494hrL+PqSfW+kZlOhnKRz1ICdCec+t2MFIKyjmUlZmzwl9y60YNcJUzM2Waf5OqOZ8YhoyuAGBQXu5K/OoQW36MN9MzZgG4nyjKnOSKAswwHpQnHPX+1YbQCPFN/zQngxlg0F6aLJnVjpPeyyI9PKEWSSc0B3POGpX5N
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(44832011)(956004)(2616005)(2906002)(16526019)(316002)(6512007)(33656002)(83380400001)(52116002)(5660300002)(186003)(26005)(478600001)(53546011)(66476007)(6506007)(66946007)(54906003)(66556008)(86362001)(4326008)(6666004)(6916009)(38100700002)(38350700002)(8676002)(6486002)(8936002)(36756003)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?hJ42lcwhpwYZu0nr3SU4y1Q/IRwKbOmJ7jqpThMoRwJiHILpVXN5DnVi6mAa?=
 =?us-ascii?Q?Piv8COVZtTfP0mjFhf1fs18W3v/iyvEJucyIGXb7+4oAPUzWLZB0Tdwu9NYh?=
 =?us-ascii?Q?iu2BERh6+5skJN134Z7kXkqhTSKY7IeX9QW9GpzFXPBxsq29lJk+SaP5oHLJ?=
 =?us-ascii?Q?a2lyGjMcDTc/sL0075uzVtKH8Nr9lwb3G9xWngaF3koR6eX9ik8pzcuQ4ccE?=
 =?us-ascii?Q?9davK1UEmGSMUqhwbwHuDPoJKYnxyPTJyh+s2O3AXrUU5KxDmrAcbgy6xmKS?=
 =?us-ascii?Q?HWqzmi6MwtiHF1cLfGdq8XcIRLlL+ZbgTFolYKNbJleTq+KoLeQOGtxVfaAo?=
 =?us-ascii?Q?hIQtLkkz/GpaqNtaazS5iwFKoC6BNF7xl0P8tVjeftIUB0PHLfjmxVNsASMj?=
 =?us-ascii?Q?n+85MNCM1QQMcix5370pxlqwzK9OW6Qdgy5uXisgs1+vC0jBwM3bnmPgzji5?=
 =?us-ascii?Q?WToZD6CvTDQdb+nmHdPh47CC2fKz+h20chAFR+B4r9Zx+IcrhwXx3GEI2D4z?=
 =?us-ascii?Q?i6rsoLNWvbyQr7IaQKsZVlMqa2f3QGp93DtVTKWkR1BOzpjuWSzW5BiCjZgD?=
 =?us-ascii?Q?3HTuoQSGBEIgrcz0YIXIasXx3/kGmvScsecMf6w/vJv8JLUce1dMI5jjymjO?=
 =?us-ascii?Q?u3iiyLYBuPCNgh89KNEYEMX9qUczrEBEFOBEIC3GcVeXwP5egnjfCQ6rxVpD?=
 =?us-ascii?Q?F7qFarJzc80J1qjOXs93SsIUGiHlA881nKCS2lOaPZT4+wUK4ybq4dmLjDrm?=
 =?us-ascii?Q?Yf7s4eCQQN76wBeyxdcQEwMFXVLDAb4EWomsCPCf796D5wAjysUrf0CCtrj7?=
 =?us-ascii?Q?m6VZiZxjuWIEDYquRwcj2dE8O3QY/3zs4K/mEa2mDElR2H/snCfIGmDNFO/B?=
 =?us-ascii?Q?6vhBO7xqIkU1HTg+jsm/htSDJG7g0V7bjs/FJ5Bt1nJs/qfobOK6E+gwZyvH?=
 =?us-ascii?Q?SsHJ8ClO6teHsnELWxYpuNBh5ySCNFHVIurPyHMjUQc/DwbJIPwT5GwMFjal?=
 =?us-ascii?Q?Ffs/D8ONAAE++Oe7hHBOyBSnIMzDz8UbaE9gSEjCLy28iU9bXpBlRev5mwDU?=
 =?us-ascii?Q?PW5glEejloI4nxC1SGFHtCV+bPlU6kAN/2NmgbOzV0qiNmuWxMp0cyqRAoD/?=
 =?us-ascii?Q?pQsjzkDkooasDE8p3UvezkKIwT5BD1AgA2qNS5e1SrW6ArF7gSWbw1AgyYDj?=
 =?us-ascii?Q?mVfdAPV17UhP4X/AIDNJlzAYJzRRkqMFtZfCvcIWiiRD7CtTnXwvQeQJjAYT?=
 =?us-ascii?Q?g6YJBM8EgE+rNI5OKtiPE1BXgVdRGbnvbzQeM+B8ivsuW/qv+fC79mgzTiiF?=
 =?us-ascii?Q?H7zuhN++IbRTwZUFtLnzCdLU?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5998
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e0dbd496-c424-4ff0-2f46-08d93495f88d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lJ60TPyke9PkClMZ7oJvUuFnipLyRRXQMRdv6IQH3sccLu2qkX54y/2B02RD0aPbgo8ocg02JHB0NeUd2FSTZJe3CUMO7AQeS0lFxS7yytaKb59eb8SrAUtUpl6+d2mlGyvBHA3Mab/HVqri/QNnEtVVtGZrTNYR5OLXfqk4UDjee+Bb5vKMjcYSU6c4QXn32+5DrJh2q1D/M0WNSXLIqPAZXKKYYUZFQAgfZMj45nFiyzb3Er9oXjBefbcrNBzUEcVDZ4scEicaPKNk7XRMh6X/9NAHCE3Ob09EPWLiJ2/T2/2PjQuqtMDOQ7IShRDNktzZYat5Z7Axc2rScRsLqs7SJwzzuBnM7ZvN/bM0m2ZpdlE8nDO8DQw9G+/kjQD6hbbrdgCdMbtvZgPJx4J6Pm2Ly+6ur/cJfuIYUc8NAzOr2Ngn94wmZZXuzzX5Dr4NmbN1yvwgkAdcPYKVUn4/jwxb1T1Jg4IYD7cwnuIwkoGLBhTj70eaNZlLbuhyvDq6pYGPfoxVbJOl9vDa2B3MFMEK4wJd970wVU3rZqTr3YfiVuDHmH+/JM6alPd6OWmztnEdGI8J2xKEIiOWfEMO9qPsFT1CR8zW4WWoZYAgv/RWIDas9ZCwI2AVbwYvUMxxk7C6BOTxnQzsTp9yI02iLhAeKy5rAht39YCtur72WLM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(46966006)(36840700001)(36756003)(186003)(47076005)(54906003)(70206006)(70586007)(6486002)(4326008)(2906002)(82310400003)(316002)(82740400003)(44832011)(86362001)(8676002)(8936002)(5660300002)(16526019)(36860700001)(6862004)(6506007)(356005)(53546011)(336012)(2616005)(81166007)(107886003)(956004)(6512007)(6666004)(26005)(83380400001)(478600001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 09:22:18.2225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a31ee7f-a1f0-4db6-effa-08d9349610dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7115



> On 16 Jun 2021, at 15:43, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Currently, the restore code is considering the stream will contain at
> most one in-flight request per connection. In a follow-up changes, we
> will want to transfer multiple in-flight requests.
>=20
> The function read_state_buffered() is now extended to restore multiple
> in-flight request. Complete requests will be queued as delayed
> requests, if there a partial request (only the last one can) then it
> will used as the current in-flight request.
>=20
> Note that we want to bypass the quota check for delayed requests as
> the new Xenstore may have a lower limit.
>=20
> Lastly, there is no need to change the specification as there was
> no restriction on the number of in-flight requests preserved.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> ---
> tools/xenstore/xenstored_core.c | 56 ++++++++++++++++++++++++++++-----
> 1 file changed, 48 insertions(+), 8 deletions(-)
>=20
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_c=
ore.c
> index a5084a5b173d..5b7ab7f74013 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -1486,6 +1486,10 @@ static void process_message(struct connection *con=
n, struct buffered_data *in)
> 	enum xsd_sockmsg_type type =3D in->hdr.msg.type;
> 	int ret;
>=20
> +	/* At least send_error() and send_reply() expects conn->in =3D=3D in */
> +	assert(conn->in =3D=3D in);
> +	trace_io(conn, in, 0);
> +
> 	if ((unsigned int)type >=3D XS_TYPE_COUNT || !wire_funcs[type].func) {
> 		eprintf("Client unknown operation %i", type);
> 		send_error(conn, ENOSYS);
> @@ -1515,6 +1519,23 @@ static void process_message(struct connection *con=
n, struct buffered_data *in)
> 	conn->transaction =3D NULL;
> }
>=20
> +static bool process_delayed_message(struct delayed_request *req)
> +{
> +	struct connection *conn =3D req->data;
> +	struct buffered_data *saved_in =3D conn->in;
> +
> +	/*
> +	 * Part of process_message() expects conn->in to contains the
> +	 * processed response. So save the current conn->in and restore it
> +	 * afterwards.
> +	 */
> +	conn->in =3D req->in;
> +	process_message(req->data, req->in);
> +	conn->in =3D saved_in;
> +
> +	return true;
> +}
> +
> static void consider_message(struct connection *conn)
> {
> 	if (verbose)
> @@ -1582,7 +1603,6 @@ static void handle_input(struct connection *conn)
> 	if (in->used !=3D in->hdr.msg.len)
> 		return;
>=20
> -	trace_io(conn, in, 0);
> 	consider_message(conn);
> 	return;
>=20
> @@ -2611,14 +2631,20 @@ void read_state_buffered_data(const void *ctx, st=
ruct connection *conn,
> 	unsigned int len;
> 	bool partial =3D sc->data_resp_len;
>=20
> -	if (sc->data_in_len) {
> +	for (data =3D sc->data; data < sc->data + sc->data_in_len; data +=3D le=
n) {
> 		bdata =3D new_buffer(conn);
> 		if (!bdata)
> 			barf("error restoring read data");
> -		if (sc->data_in_len < sizeof(bdata->hdr)) {
> +
> +		/*
> +		 * We don't know yet if there is more than one message
> +		 * to process. So the len is the size of the leftover data.
> +		 */
> +		len =3D sc->data_in_len - (data - sc->data);
> +		if (len < sizeof(bdata->hdr)) {
> 			bdata->inhdr =3D true;
> -			memcpy(&bdata->hdr, sc->data, sc->data_in_len);
> -			bdata->used =3D sc->data_in_len;
> +			memcpy(&bdata->hdr, sc->data, len);
> +			bdata->used =3D len;
> 		} else {
> 			bdata->inhdr =3D false;
> 			memcpy(&bdata->hdr, sc->data, sizeof(bdata->hdr));
> @@ -2629,12 +2655,26 @@ void read_state_buffered_data(const void *ctx, st=
ruct connection *conn,
> 							bdata->hdr.msg.len);
> 			if (!bdata->buffer)
> 				barf("Error allocating in buffer");
> -			bdata->used =3D sc->data_in_len - sizeof(bdata->hdr);
> -			memcpy(bdata->buffer, sc->data + sizeof(bdata->hdr),
> +			bdata->used =3D min_t(unsigned int,
> +					    len - sizeof(bdata->hdr),
> +					    bdata->hdr.msg.len);
> +			memcpy(bdata->buffer, data + sizeof(bdata->hdr),
> 			       bdata->used);
> +			/* Update len to match the size of the message. */
> +			len =3D bdata->used + sizeof(bdata->hdr);
> 		}
>=20
> -		conn->in =3D bdata;
> +		/*
> +		 * If the message is not complete, then it means this was
> +		 * the current processed message. All the other messages
> +		 * will be queued to be handled after restoring.
> +		 */
> +		if (bdata->inhdr || bdata->used !=3D bdata->hdr.msg.len) {
> +			assert(conn->in =3D=3D NULL);
> +			conn->in =3D bdata;
> +		} else if (delay_request(conn, bdata, process_delayed_message,
> +					 conn, true))
> +			barf("Unable to delay the request");
> 	}
>=20
> 	for (data =3D sc->data + sc->data_in_len;
> --=20
> 2.17.1
>=20
>=20


