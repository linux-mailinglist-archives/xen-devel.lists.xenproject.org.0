Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1BC3AE568
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 10:57:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145382.267491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvFjb-0006Uo-Ps; Mon, 21 Jun 2021 08:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145382.267491; Mon, 21 Jun 2021 08:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvFjb-0006Re-LD; Mon, 21 Jun 2021 08:56:47 +0000
Received: by outflank-mailman (input) for mailman id 145382;
 Mon, 21 Jun 2021 08:56:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNPZ=LP=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lvFja-0006RY-Gw
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 08:56:46 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.55]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43b038ea-db58-457f-88fc-df8a44ca6c2e;
 Mon, 21 Jun 2021 08:56:44 +0000 (UTC)
Received: from DB7PR03CA0086.eurprd03.prod.outlook.com (2603:10a6:10:72::27)
 by AM6PR08MB5125.eurprd08.prod.outlook.com (2603:10a6:20b:e2::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Mon, 21 Jun
 2021 08:56:33 +0000
Received: from DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::66) by DB7PR03CA0086.outlook.office365.com
 (2603:10a6:10:72::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18 via Frontend
 Transport; Mon, 21 Jun 2021 08:56:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT026.mail.protection.outlook.com (10.152.20.159) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Mon, 21 Jun 2021 08:56:33 +0000
Received: ("Tessian outbound f945d55369ce:v96");
 Mon, 21 Jun 2021 08:56:33 +0000
Received: from 5c0fb2f4340d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8AF347C4-D08C-415E-97F8-44E4AEE21DDF.1; 
 Mon, 21 Jun 2021 08:55:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5c0fb2f4340d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Jun 2021 08:55:57 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB6269.eurprd08.prod.outlook.com (2603:10a6:102:ed::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Mon, 21 Jun
 2021 08:55:55 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025%8]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 08:55:54 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0086.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:190::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19 via Frontend Transport; Mon, 21 Jun 2021 08:55:54 +0000
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
X-Inumbo-ID: 43b038ea-db58-457f-88fc-df8a44ca6c2e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrAjr5G1UUQrp36qRjGeyweSc9U2mkXfIlhg8j21I1Q=;
 b=gK6TsYMnVUmTFMM7OOv5twDkqNtjgm5BaKO5zv9YUlqGoREUYdi3LIliPIdcWMiTrrXaZGZXNXpa4MrCIJE3lKxRcjdpTZFAy7FOB4at2ugJmRYqmi3B67Uywfc+pIW0/x8iCVNH6YnHnIeJohVmLnWemsjN7cwgnwVEYOIG5uw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7d035d1fd5171091
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Arr2vYD7lJ7Bxsz5sfUCYhRlaYksr90xhoSo0MilaGCn7i3/Qpk0udrF5qfwGH8cH66vWHToFVGgSkJO4L1/pemHsa01eIBGqH4LD8kK39IaHQwpiEQwr+DOkqWlNxFz21nLdZJjxLtPIibq3qoKCk1WNgMmf6Vz1NYZDzuG7XHkQo+nZqxDcGQ1CJLbPJjd0SK4+12124x0GUaEAR/pb4M+u7udE7GDOyqamD+bdOZ7soUGSc7Yy04nGmiDsOv9ntR6Phm7IMbwIarI9rE1Zk+1LqhvSmn7TiM93VKpNHaEFmUZ3kvVKmSzMcBnRDImjb5OwL/aegVYD7vgrvQYOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrAjr5G1UUQrp36qRjGeyweSc9U2mkXfIlhg8j21I1Q=;
 b=hXAbiQf6+1AIvsHYYBaoM5ggs2TE5jPz2zZXGRtdOLVyHT7MgeebPdfh58WsTzuB6uDfEwaaXEglX1HYuiMsCgw90liwbkBQMbBzCvSEaLoYIPsTTsLE9oG+2aIVzNJXb8afd9DasWPO4sfwEcvjUsbqN+l7p09hToUgEI1fzLWYZs0viCQtLbit/l/Muedmr8JEkhaX9eySa38+8/L/1mpyE9Hv1D8mzr/0gDAIdoZiBsyYlv+MmcUC/0qE3bBe8GR0e4XosusIrIUhFc4Pp5arhenN24AkAF8+1Rt6eMaKJawh0E3qobAgh9GU6yQuKoJ9Xoj7mwtDiuFQEJnzeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrAjr5G1UUQrp36qRjGeyweSc9U2mkXfIlhg8j21I1Q=;
 b=gK6TsYMnVUmTFMM7OOv5twDkqNtjgm5BaKO5zv9YUlqGoREUYdi3LIliPIdcWMiTrrXaZGZXNXpa4MrCIJE3lKxRcjdpTZFAy7FOB4at2ugJmRYqmi3B67Uywfc+pIW0/x8iCVNH6YnHnIeJohVmLnWemsjN7cwgnwVEYOIG5uw=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 03/10] tools/xenstore: Don't assume conn->in points to the
 LU request
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20210616144324.31652-4-julien@xen.org>
Date: Mon, 21 Jun 2021 09:55:48 +0100
Cc: xen-devel@lists.xenproject.org,
 raphning@amazon.co.uk,
 doebel@amazon.de,
 Julien Grall <jgrall@amazon.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4316B0AD-5F89-4D04-8996-00836AE3991A@arm.com>
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-4-julien@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0086.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::19) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fff5baee-4c45-4519-2844-08d934927849
X-MS-TrafficTypeDiagnostic: PA4PR08MB6269:|AM6PR08MB5125:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB5125AC08B94D9148C84DF9FDE40A9@AM6PR08MB5125.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QOPBLZ1bYBpiIbr1DTbPawQ+d50MPth+nTH2/UGbg8qQ9LoMsZ6/ZhtjpCvoLm2EsDiEreaHeUQSOntwN5OyUHiYZvJDGZVQbOZpqr9p0klXemxeoOmPgnZiJgyfvu1rD0kDDVzBCF2szaQ3IOIKKBg+OJNpCN8dgXJ1x47xEB4B+sqou8EzzEMReE4yHHmMNIL3d8y3zdFnJKmNyNXrbHeG1RonrhnVDQ2KyZ9VjanwqOVCKKDmVaUF3gJZPDyc9YtUiGQs+g7L7/ElOZdjUwm2JLHwUCxE0GWP+e+hInGQztnvlm+VufQGquacyAYlfPOMLub3mSRL/nwwvhkwT/S8ftC8Anxlzk0yl8WCWOTXue/HPLSs3+uH03tveEpHp2N0bXQrZsN01MbToEqDwFJn7VOrM4aP9gA1RShUHnN61CaDAo+d5HDuNgufy7m7RW3u1UF8RapZZAnp+c+ykNuVf93NJSeNS6QggQTt6Yy26pOuP13bYlcVL7HJHSjZEPcfLsYHtyJ9ujjwbA04CnJuXlkcfg0q6WTquAh1wEh7szJvjtpFR/+1F1YhN7bOpNpESZJVqRTHrp98stmKqE74DWTMAfnkP8W3FOy98CS7XETxVrZHIL/XNsalZOX3BbQZw5WY1l+QiinnXYH3hAZrZ4MdiMRlpNSUE3k1WDebutMyz759HdKcI1uxrj5n
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(36756003)(83380400001)(86362001)(956004)(4326008)(2616005)(38100700002)(16526019)(6916009)(44832011)(6512007)(8936002)(38350700002)(53546011)(8676002)(498600001)(66946007)(66476007)(66556008)(2906002)(26005)(186003)(52116002)(54906003)(6666004)(6506007)(33656002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?SmkOpIXoV1vrW0UPUVaYmsjc/15FfIgjltaYTA1zY8lhxXUDqGjvziVu4K5y?=
 =?us-ascii?Q?zZaeI7Az6scLD3oKlPUjWDG1oH4aXTWjSrlmjpvoKPhkc5Ox0M31PpGey7xn?=
 =?us-ascii?Q?YySXwVvIYL7+0jMRbL/sgSZxTaRHAfXeCPsMDW1JgMO+VOfZ82AK9tLZ19t0?=
 =?us-ascii?Q?tZGQVrMe4wbAGW503NP7OU1+L/q34LXjVcSJwNt30Tf3WE8J22oXDJJNjAPN?=
 =?us-ascii?Q?PmvyYjygfoRmnDQUHl4UZHwwVmuFvRiqzEik3a3ScwIh7Jk8DjPYooVAK44q?=
 =?us-ascii?Q?uNtiWOyd7hntZ4ARZkTijPiLEjpDkbykDdvKFhKkeHBU3tu/OJSXcW4HMzjo?=
 =?us-ascii?Q?C0mWU75qhwgYWNm8cS6X6rOKKYhEyUnTaFJpGL/rlXCYtLuAZddRm7NQIV0E?=
 =?us-ascii?Q?ZbYiNu/FZXby5vEo/PKW0WOGSO3Tc+yzq3gTdFMUdXoGA0CiOoHvwBZUtnbH?=
 =?us-ascii?Q?s/lRlzMVl8JEGlNCcKExJbnJJrIJLm8Agt7I16zSakKGt04+6bsczwAXyh+z?=
 =?us-ascii?Q?US/S3zBWj6wlABfw09wacR2agkS8fR25nx+iRb4yWmrpbRhxDq6SOP7xmcdD?=
 =?us-ascii?Q?14pgLN9eOZBXLjugectCnhXY+OpURvXUGmSsE3j/VdyY6nrR2aLnpPjSgt4Q?=
 =?us-ascii?Q?d5TXKc4FvtuPd60Du5S3PBCOBfwFovqm9xmuiMylTmfVofNkciwvgBp8N6cG?=
 =?us-ascii?Q?2FIQGoSKzAjOOBkBmJNcXCGYZs8TZ8jLfTLhvwVi9q/jWv7zaugIEQP+Okn4?=
 =?us-ascii?Q?rGKJORwGccEFNT9Yz6F6yFAkA0YL3aBTH0tML8UdYdz2sRI/psbHbrpd9DRy?=
 =?us-ascii?Q?JWw2ZIDvWVCJvX2PiUVtsZxtwc7XdG5lEeIMr/EclU/noaxqxltY/DO2ai3s?=
 =?us-ascii?Q?Pxg3lak1ZBAWq4EzqSpyKKs+46ksSXQ3WoncKXJ976ypf7HGcopqTCsRT/Qg?=
 =?us-ascii?Q?dn30qexwH4fLvCqrvLO4y+8xcAXaINR5dzUZRmnfeOFgi+9S9imLHEfiYMh1?=
 =?us-ascii?Q?t+XyZaxiouJsFcaWxIT1gww6k9owxBS9asLxwGxEqjqVrKLW4O/f8Z4sfbfr?=
 =?us-ascii?Q?kBln4MbYeAdb4VgKbXkyVDrU1C3RVuEyUbM684ult0Dey3NsLk3JxRt25n5z?=
 =?us-ascii?Q?40PBifp5W/EfmqNRsD0Pz0CLzNFJqpbW7orVN2uriLqgwlVOZ7FRasQWk2EL?=
 =?us-ascii?Q?CJLbImUxTbbxxk8/ZJmT0gMzv34TxZ5EBPec6G9Qk4tVLArkpcllTEMFOBCM?=
 =?us-ascii?Q?FunRXmyZaZ66BvolD6MvviF7p71l43YQCff2ki3+4BKBjX2oN5hc/gcnJFKt?=
 =?us-ascii?Q?N0tTWn5gYFWZfLK5SSx0fBZn?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6269
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aa27fa23-f775-4cec-8157-08d9349260fe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5sudh+ayAKEgMyUzYYn7B3vhdaHbTgOHjx6ZCJsJ5Q4k/xjxcnWvXEaYuJHU8bEGsvNvl28srHb4uNDZvOAstxkzi6RnS+tmcBumM2J03u+uw8rtvEGKWIrOXZ3v6ZGgzlzG8+vxqwsai28do/3MS7OCwVEuvmZJI6dA2Nm/hRrSzAOsojUYvvLjfHSnEbzjk9o4TGdlZh44bc5T1BoDjYzwpPheeJ5LoUz7IS/vOfTqrKhacnQI0ig92h1T4yFXTXw3rQn8L24dDeaV7iPeNfOnGFkisgQ7W8VEZZj7CCwSdPll8MuCn2jtJydn+W/gmpZYNSq43nHsIMj18bzQuAq8lE6POe/9UawbcGgyzxky4kYsQ0LkpG6nrA+rUwBkyBpS0mo9Zi8lf3EHfqvrCZ+wAQgry9ePPVqcVqfvMiiRODvU3JjrPsIRKVzYO1hmcGr0LZ+1IK0dIXZnLMNFsjNk16o64L1MAUr9wyKsGuF2qXiFZt2e4QZ4diz6xl9CVeFoNOLkKbaG7htyOLfWplkuQ7ZjSNHjVH33oPYITe77evGuIGUul/FayiZgti960N04Ppto+RPWmZseutcI7hRIowfi5iWq4tQ9aAfWj+QndTU0TGYlLQ92Pxu5MNpvkavsl2q0FPelDmw8dJcNyB7gp2TR2pDEQQKDVRIe0kk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(36840700001)(46966006)(8936002)(53546011)(6506007)(6512007)(82740400003)(70206006)(316002)(70586007)(478600001)(336012)(54906003)(86362001)(4326008)(8676002)(47076005)(83380400001)(36860700001)(2906002)(956004)(44832011)(36756003)(33656002)(107886003)(6666004)(356005)(6862004)(82310400003)(16526019)(186003)(2616005)(6486002)(5660300002)(26005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 08:56:33.7495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fff5baee-4c45-4519-2844-08d934927849
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5125



> On 16 Jun 2021, at 15:43, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> call_delayed() is currently assuming that conn->in is NULL when
> handling delayed request. However, the connection is not paused.
> Therefore new request can be processed and conn->in may be non-NULL
> if we have only received a partial request.
>=20
> Furthermore, as we overwrite conn->in, the current partial request
> will not be transferred. This will result to corrupt the connection.
>=20
> Rather than updating conn->in, stash the LU request in lu_status and
> let each callback for delayed request to update conn->in when
> necessary.
>=20
> To keep a sane interface, the code to write the "OK" response the
> LU request is moved in xenstored_core.c.
>=20
> Fixes: c5ca1404b4 ("tools/xenstore: add support for delaying execution of=
 a xenstore request")
> Fixes: ed6eebf17d ("tools/xenstore: dump the xenstore state for live upda=
te")
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20
> ----
>=20
> This is fixing bugs from two separate commits. I couldn't figure out
> how to split in two patches without breaking bisection.
> ---
> tools/xenstore/xenstored_control.c | 41 ++++++++++++++++++++++++++++--
> tools/xenstore/xenstored_control.h |  3 +++
> tools/xenstore/xenstored_core.c    | 17 +++----------
> 3 files changed, 46 insertions(+), 15 deletions(-)
>=20
> diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstore=
d_control.c
> index d08a2b961432..7acc2d134f9f 100644
> --- a/tools/xenstore/xenstored_control.c
> +++ b/tools/xenstore/xenstored_control.c
> @@ -50,6 +50,9 @@ struct live_update {
> 	/* For verification the correct connection is acting. */
> 	struct connection *conn;
>=20
> +	/* Pointer to the command used to request LU */
> +	struct buffered_data *in;
> +
> #ifdef __MINIOS__
> 	void *kernel;
> 	unsigned int kernel_size;
> @@ -100,6 +103,7 @@ static const char *lu_begin(struct connection *conn)
> 	if (!lu_status)
> 		return "Allocation failure.";
> 	lu_status->conn =3D conn;
> +	lu_status->in =3D conn->in;
> 	talloc_set_destructor(lu_status, lu_destroy);
>=20
> 	return NULL;
> @@ -110,11 +114,34 @@ struct connection *lu_get_connection(void)
> 	return lu_status ? lu_status->conn : NULL;
> }
>=20
> +unsigned int lu_write_response(FILE *fp)
> +{
> +	struct xsd_sockmsg msg;
> +
> +	assert(lu_status);
> +
> +	msg =3D lu_status->in->hdr.msg;
> +
> +	msg.len =3D sizeof("OK");
> +	if (fp && fwrite(&msg, sizeof(msg), 1, fp) !=3D 1)
> +		return 0;
> +	if (fp && fwrite("OK", msg.len, 1, fp) !=3D 1)
> +		return 0;
> +
> +	return sizeof(msg) + msg.len;
> +}
> +
> #else
> struct connection *lu_get_connection(void)
> {
> 	return NULL;
> }
> +
> +unsigned int lu_write_response(FILE *fp)
> +{
> +	/* Unsupported */
> +	return 0;
> +}
> #endif
>=20
> struct cmd_s {
> @@ -658,6 +685,8 @@ static bool do_lu_start(struct delayed_request *req)
> {
> 	time_t now =3D time(NULL);
> 	const char *ret;
> +	struct buffered_data *saved_in;
> +	struct connection *conn =3D lu_status->conn;
>=20
> 	if (!lu_check_lu_allowed()) {
> 		if (now < lu_status->started_at + lu_status->timeout)
> @@ -668,8 +697,9 @@ static bool do_lu_start(struct delayed_request *req)
> 		}
> 	}
>=20
> +	assert(req->in =3D=3D lu_status->in);
> 	/* Dump out internal state, including "OK" for live update. */
> -	ret =3D lu_dump_state(req->in, lu_status->conn);
> +	ret =3D lu_dump_state(req->in, conn);
> 	if (!ret) {
> 		/* Perform the activation of new binary. */
> 		ret =3D lu_activate_binary(req->in);
> @@ -677,7 +707,14 @@ static bool do_lu_start(struct delayed_request *req)
>=20
> 	/* We will reach this point only in case of failure. */
>  out:
> -	send_reply(lu_status->conn, XS_CONTROL, ret, strlen(ret) + 1);
> +	/*
> +	 * send_reply() will send the response for conn->in. Save the current
> +	 * conn->in and restore it afterwards.
> +	 */
> +	saved_in =3D conn->in;
> +	conn->in =3D req->in;
> +	send_reply(conn, XS_CONTROL, ret, strlen(ret) + 1);
> +	conn->in =3D saved_in;
> 	talloc_free(lu_status);
>=20
> 	return true;
> diff --git a/tools/xenstore/xenstored_control.h b/tools/xenstore/xenstore=
d_control.h
> index 6842b8d88760..27d7f19e4b7f 100644
> --- a/tools/xenstore/xenstored_control.h
> +++ b/tools/xenstore/xenstored_control.h
> @@ -20,3 +20,6 @@ int do_control(struct connection *conn, struct buffered=
_data *in);
> void lu_read_state(void);
>=20
> struct connection *lu_get_connection(void);
> +
> +/* Write the "OK" response for the live-update command */
> +unsigned int lu_write_response(FILE *fp);
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_c=
ore.c
> index 607187361d84..41b26d7094c8 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -272,15 +272,10 @@ static int undelay_request(void *_req)
>=20
> static void call_delayed(struct connection *conn, struct delayed_request =
*req)

Here the conn parameter is not needed anymore, or am I missing something?

Cheers,
Luca

> {
> -	assert(conn->in =3D=3D NULL);
> -	conn->in =3D req->in;
> -
> 	if (req->func(req)) {
> 		undelay_request(req);
> 		talloc_set_destructor(req, NULL);
> 	}
> -
> -	conn->in =3D NULL;
> }
>=20
> int delay_request(struct connection *conn, struct buffered_data *in,
> @@ -2375,7 +2370,7 @@ const char *dump_state_buffered_data(FILE *fp, cons=
t struct connection *c,
> 	struct buffered_data *out, *in =3D c->in;
> 	bool partial =3D true;
>=20
> -	if (in && c !=3D lu_get_connection()) {
> +	if (in) {
> 		len =3D in->inhdr ? in->used : sizeof(in->hdr);
> 		if (fp && fwrite(&in->hdr, len, 1, fp) !=3D 1)
> 			return "Dump read data error";
> @@ -2416,16 +2411,12 @@ const char *dump_state_buffered_data(FILE *fp, co=
nst struct connection *c,
>=20
> 	/* Add "OK" for live-update command. */
> 	if (c =3D=3D lu_get_connection()) {
> -		struct xsd_sockmsg msg =3D c->in->hdr.msg;
> +		unsigned int rc =3D lu_write_response(fp);
>=20
> -		msg.len =3D sizeof("OK");
> -		if (fp && fwrite(&msg, sizeof(msg), 1, fp) !=3D 1)
> +		if (!rc)
> 			return "Dump buffered data error";
> -		len +=3D sizeof(msg);
> -		if (fp && fwrite("OK", msg.len, 1, fp) !=3D 1)
>=20
> -			return "Dump buffered data error";
> -		len +=3D msg.len;
> +		len +=3D rc;
> 	}
>=20
> 	if (sc)
> --=20
> 2.17.1
>=20
>=20


