Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37003313D17
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 19:19:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83022.153724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9B83-00088U-B7; Mon, 08 Feb 2021 18:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83022.153724; Mon, 08 Feb 2021 18:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9B83-000885-7e; Mon, 08 Feb 2021 18:19:19 +0000
Received: by outflank-mailman (input) for mailman id 83022;
 Mon, 08 Feb 2021 18:19:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oudU=HK=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l9B81-000880-Ke
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 18:19:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::604])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4bf4009-d991-48c1-b68a-043b25c0aca8;
 Mon, 08 Feb 2021 18:19:15 +0000 (UTC)
Received: from AM6PR04CA0051.eurprd04.prod.outlook.com (2603:10a6:20b:f0::28)
 by AM8PR08MB6323.eurprd08.prod.outlook.com (2603:10a6:20b:354::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 18:19:13 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::ec) by AM6PR04CA0051.outlook.office365.com
 (2603:10a6:20b:f0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend
 Transport; Mon, 8 Feb 2021 18:19:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Mon, 8 Feb 2021 18:19:12 +0000
Received: ("Tessian outbound 587c3d093005:v71");
 Mon, 08 Feb 2021 18:19:12 +0000
Received: from 8a16fee07ad1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4DE35D99-9F4A-4043-9DAF-E1415F98B7A3.1; 
 Mon, 08 Feb 2021 18:19:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8a16fee07ad1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 08 Feb 2021 18:19:07 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB6PR0802MB2151.eurprd08.prod.outlook.com (2603:10a6:4:84::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Mon, 8 Feb
 2021 18:19:04 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 18:19:04 +0000
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
X-Inumbo-ID: f4bf4009-d991-48c1-b68a-043b25c0aca8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkXB6+yAzqlmMcIig7zwuWmEpB7pxu6engCf19nVC9Y=;
 b=50ysvvDuqLlYJDWHzE46oA9cwSRVTWebmKt6kQjrCSuixX5wItLIOnO//leRr9YN4K00LKHJJGYFMh6p7hHYVqRTeYii7cg01ci2Uw7z5NmaGa4bKRSJ0S/rDcPU3hbHmMxU/GLsxY2ESng/wi6ePdji4SEKBnpY5eb96fAnNH0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: cbec2b7e418bc4b3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0EDkC7a5RkBLT1NtqDnWQIreSgwJ6mivuZEySCcBOoexhcxm7WQYOX9ua7UCD3t8k3huNBe8j/yVjEYV0fCbNjnYAcor/jav8xdk9QF5ch7yt0PF/61vp3uDEz1aMC+RW6uWkybgWLQAgu+zO4cTbkpuOyc/A+ABCkpxOPZqOsElGUDC2wG5FkNYOzFHWDCl1KC94swfD4wApEBv2uHCYi8IyMAv4f3HEfsqFteVpaq/lUzuTAk6B+5kQKBjf/3dnHwpCA0+wavdot1S5QUl8heosggPM9ZYQHTpTCZKmX+r+gpaW5CrE5BzSbVXQyjS1R1GPjONeO5AOLix9Ip0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkXB6+yAzqlmMcIig7zwuWmEpB7pxu6engCf19nVC9Y=;
 b=kNrwFaTsZdFBJnN0EltAnZ14dosOkMIoNty0bj4Bmyu1WMdIz+fK6fE0BrprsolCLGkcQAIgDUE1jbghlzq4WtrX+XdHOSXltrra5pYIlhbxnI5VQTjSIJYlYWd7q7SKwGyGJNRxr8TGg9NLs4dw0pBshKP49qq32iJW8n0cDxmlvbM3MH8v4hFm4dUJUbHN8bo8+iuaNOOHWBUOo9sOp58NM9FVywv91V04RXNZb1PoIhwA2iQ7xl1VRd766j1xxyrVv28pgaHfjQYa6af545MFYnnblFswE0VNScIRbmm5f50c+Jd8+sjn0RLh4AWMpH00zglgdF4QzJKjl7DFag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkXB6+yAzqlmMcIig7zwuWmEpB7pxu6engCf19nVC9Y=;
 b=50ysvvDuqLlYJDWHzE46oA9cwSRVTWebmKt6kQjrCSuixX5wItLIOnO//leRr9YN4K00LKHJJGYFMh6p7hHYVqRTeYii7cg01ci2Uw7z5NmaGa4bKRSJ0S/rDcPU3hbHmMxU/GLsxY2ESng/wi6ePdji4SEKBnpY5eb96fAnNH0=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, "lucmiccio@gmail.com"
	<lucmiccio@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: fix gnttab_need_iommu_mapping
Thread-Topic: [PATCH] xen/arm: fix gnttab_need_iommu_mapping
Thread-Index: AQHW/CCVIBhvrRIcEE2wSNDNMu6y5KpOkgeAgAABdICAAAIFgA==
Date: Mon, 8 Feb 2021 18:19:04 +0000
Message-ID: <3EEEACBE-2028-4DE9-A3BD-053FF82CFC75@arm.com>
References: <alpine.DEB.2.21.2102051604320.29047@sstabellini-ThinkPad-T480s>
 <C36DCA9F-1212-4385-AE66-7D41C586A313@arm.com>
 <7e963696-a21f-4c79-5f35-a342982bee86@xen.org>
In-Reply-To: <7e963696-a21f-4c79-5f35-a342982bee86@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 74da05d7-245f-40de-de3a-08d8cc5e0973
x-ms-traffictypediagnostic: DB6PR0802MB2151:|AM8PR08MB6323:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB63239C92B57A5010F00F8ECFFC8F9@AM8PR08MB6323.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bmLdN713cJQzy3wxX4KQn9ocxG8SdCZ2XkwUlDWBpQ1r6Rkq9o0C2aqvVM5VM/jJYv+XcD9SmLYFX+E8Ihh6ZVCPXgjYvss46FFQWz9cDNI/NAMCsiOoit7sU4qqCym7g8G0GH3Jv4ItJrf9tLzz06HpgvJ6AtVBeCUygK54tWCyroyffKhpf34vzlSGK6sHVmVv0QodfiaEPLpN8NKz3EemNnq7I+7Puc30ABegBVg3gIVIGS7ONDyULQ3M5Q7OY7LmQAKqYZJoOnmL2IJX2CViTOvNw0xzvbXUzuWPWmBQkb00f8ssOFIS0CO+QkAwWq79KfQWWejSq+dd7nmgEE3xn+3FyaUYzkeD61XWw1YwECDSvRpT6JQqiw/56B2lHWf+ITH247nJUVjQvJDcwYsErkl9BRpW9aeQIbVYi9PttlE9FSrZXTbLhOA0b7Zl/hm0mgDuZBe46hSARVbw4ukmPzmE+hAuC5MNKX3sX9Oxrt85axqy2GdeQALU3B1Squy+fzC9i1PjHdQqbSTty+3uNttgSYR/UUWZefrW6FcG5yNKR5wU/6T97kyQ38HjNZIdbjbPMiOlzdE4E6bfRA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(2616005)(83380400001)(4326008)(5660300002)(64756008)(66446008)(91956017)(71200400001)(76116006)(26005)(53546011)(86362001)(6506007)(8676002)(54906003)(66946007)(66476007)(66556008)(6486002)(478600001)(36756003)(6512007)(6916009)(33656002)(316002)(186003)(8936002)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?y8bv+tLgUxKAC75pguhHYzj7TY3FlEY5ZLkn7nqGqOJjZXIs9rO7Bmak6fcX?=
 =?us-ascii?Q?wppVWlvtfZwGP2chwtpK51dU7b7kco/VsAehJo7CVpr2lupP+6MRvoC0xbzE?=
 =?us-ascii?Q?GMGFwRIbfI6V5gTuwgGdxf//gFzamGK11rjoACtWomh408CUxC1geWrm5kvN?=
 =?us-ascii?Q?uTDsAwbGrPVKTOUNK3B8OLfzkNSaULpLVXirB88DBhpbRI4FtVaDHbIg3ihv?=
 =?us-ascii?Q?APA7Ks5HZ7kdec+Hv7wzCv6vLz+zSTdVxTcHDKJbkb8MI3RPEigDLSm+XT2n?=
 =?us-ascii?Q?ZJY2Vp3fftGcs5vhBvZ2KGpbL2XJNBPZC0SHoJea5tXfhfeKbdVAtHfdTJe9?=
 =?us-ascii?Q?uE/BelkFeesjnNa1+pxAZ/hzpglL2Y5er3bCukLdtSLjtF6xB4VhYHdViCqO?=
 =?us-ascii?Q?933oOhb0oVa1tjXJmwU8XFK4673Pzs88ZhnftpDjVCOtF+j9dp8FC7koc1ck?=
 =?us-ascii?Q?Cbdu2GYEnEqH+PVGvuLV7VlYdH5m65RjPAvJZXiGm40C0PhEd7TEcYmHhLw2?=
 =?us-ascii?Q?ubHREU4su/SnzHqMwtNw9lrSIezVzXN8aMLp7hsK/28XJJhGqo5l79EEmFZW?=
 =?us-ascii?Q?MID8JcuJOLca/y1AobX15QXa/0zDJ/x1gTrigqFb9pw2uj5U0yIs+RILbv04?=
 =?us-ascii?Q?4QbLvN6lmmBb4HiVyj3JUKCquKOpQOy1NMSx8Q4yAaBDaUSMjxJzDnD/+/Mz?=
 =?us-ascii?Q?Jw/kN5AEAv6ijhh8lHNR8mfmZLMyynGvnb4j2Hjgb1lMsqGFqa0bax/GY8YF?=
 =?us-ascii?Q?q2geSq+Tgb75gSa443Dm+DMc8zbEmm9cgIaWo5jRpmSchZQNOEcTR+OWmygF?=
 =?us-ascii?Q?QbrTAuYcaffkWUC87OyYwHNlgHlL5JKKsAeC/VNZxdwzK+/Gu2bUDNvGL6rC?=
 =?us-ascii?Q?mnpC1JwvEkYtXzAoCxGiR3hb/Fj4DPScic1TlnLE5XPLnA9nhj1Ym+mTEb1D?=
 =?us-ascii?Q?y5agEsJT+WHVV/2jEsHFk99yluBXp2mSbDFn4c/zUYCWgKvb3guRuN63sp8Z?=
 =?us-ascii?Q?AFCt8Oocn5VEepc5/XDNgoeQi9VEuWjpj5+SMsWVPVplAD5i0EVzjwkxgiXK?=
 =?us-ascii?Q?uIipqjrAsULT1lBqK6sE2EaJqrr90HXyn17bUt8J7887yYWw7+R378v/UyTO?=
 =?us-ascii?Q?KiSQXUywj5nDBuRf+BOt/KehX0YJDNuZFdMWWTKRh/ZTlI7JLFEEY9/+neli?=
 =?us-ascii?Q?jw3fxrSC5Ps5dXTDEZXMd+BWxedFfU+hF472PK4yVgeRB0llIcaloTiy4Cab?=
 =?us-ascii?Q?aiHP5X7GYsN9VgMJmI+NTyOGh1m4alAsWCdM/VbotWyXkyrHEbCfYSXf8D3L?=
 =?us-ascii?Q?tyyBD520revoU7sDO25vtZEn?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <87FAC6D2CAA15345911254B34322B9D9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2151
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e64ac90a-c1db-4aba-41b0-08d8cc5e0492
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	etX2MjU0Ss/5b1NzK1ruPTrqU8krbl4euZCV0+X1hoHRAqt3agOmeICGhAbm2RU9/ufxvpfVCWD11xa0bG52f6FCSNulkaq2pTIL7jHZU3NOMwaY55ba6bwgPpgN/z+lF7nGOQ1gB+Pnzl+S9SQAoCd2D9FpglkaDhhAXIjju51MESimsFpG8uSSPGgGmZC7TmYjz30Av9yRTOSNZWG2nuLginqDztVPjJ08MSZ5V8H4acn4pQtWIcfevYTvT/EgDQ/XfrtA4pGGUjqa0AVi2b++9DXDRFzXJh3sbMn/4g33PtwxRt1y/slBuXnvSl95fKcQufefHpd/IZQRjdsV6+XVXB1TSW6xuSdab4sOp9V3vF8cm9VzCBGNja/h8G3lHZn6AQnKx3nAgz2XBUVZPzbGlqMPD8NR/ZGnZUlPyb4iP0Ob8OHqm/oE+mhOnB0/PhHoOIDjU9ShQYtUjLcYCES50nlEdyGioUDLK+pNJxPXJU+9+vEjB16DBSJTSzRDckk2lBAZJLtTb7nV4JqwXepi/JtkQamfaPZot+LmZ3mV/QEjNmMUTOd+UD6+S8K3d8oPHEF23zjNLkkt2QNbr6N4LJJwfrKQPD4nuV3HBByjxNpNgoTP7INJpwkSA0KhqwGeTJuOoQ3C659c8kbRdUuOKOhgjzUQ0qvZ0rs9fMA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(39850400004)(36840700001)(46966006)(36756003)(316002)(86362001)(5660300002)(6486002)(6506007)(53546011)(8676002)(70586007)(70206006)(6512007)(107886003)(83380400001)(186003)(2616005)(47076005)(26005)(36860700001)(336012)(81166007)(82740400003)(478600001)(2906002)(33656002)(54906003)(8936002)(356005)(6862004)(4326008)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 18:19:12.8746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74da05d7-245f-40de-de3a-08d8cc5e0973
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6323

Hello Julien,

> On 8 Feb 2021, at 6:11 pm, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 08/02/2021 18:06, Rahul Singh wrote:
>>> On 6 Feb 2021, at 12:38 am, Stefano Stabellini <sstabellini@kernel.org>=
 wrote:
>>>=20
>>> Commit 91d4eca7add broke gnttab_need_iommu_mapping on ARM.
>>> The offending chunk is:
>>>=20
>>> #define gnttab_need_iommu_mapping(d)                    \
>>> -    (is_domain_direct_mapped(d) && need_iommu(d))
>>> +    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))
>>>=20
>>> On ARM we need gnttab_need_iommu_mapping to be true for dom0 when it is
>>> directly mapped, like the old check did, but the new check is always
>>> false.
>>>=20
>>> In fact, need_iommu_pt_sync is defined as dom_iommu(d)->need_sync and
>>> need_sync is set as:
>>>=20
>>>    if ( !is_hardware_domain(d) || iommu_hwdom_strict )
>>>        hd->need_sync =3D !iommu_use_hap_pt(d);
>>>=20
>>> iommu_hwdom_strict is actually supposed to be ignored on ARM, see the
>>> definition in docs/misc/xen-command-line.pandoc:
>>>=20
>>>    This option is hardwired to true for x86 PVH dom0's (as RAM belongin=
g to
>>>    other domains in the system don't live in a compatible address space=
), and
>>>    is ignored for ARM.
>>>=20
>>> But aside from that, the issue is that iommu_use_hap_pt(d) is true,
>>> hence, hd->need_sync is false, and gnttab_need_iommu_mapping(d) is fals=
e
>>> too.
>>>=20
>>> As a consequence, when using PV network from a domU on a system where
>>> IOMMU is on from Dom0, I get:
>>>=20
>>> (XEN) smmu: /smmu@fd800000: Unhandled context fault: fsr=3D0x402, iova=
=3D0x8424cb148, fsynr=3D0xb0001, cb=3D0
>>> [   68.290307] macb ff0e0000.ethernet eth0: DMA bus error: HRESP not OK
>> I also observed the IOMMU fault when DOMU guest is created and great tab=
le is used when IOMMU is enabled. I fixed the error in different way but I =
am not sure if you also observing the same error. I submitted the patch to =
pci-passthrough integration branch. Please have a look once if that make se=
nse.
>=20
> I belive this is the same error as Stefano has observed. However, your pa=
tch will unfortunately not work if you have a system with a mix of protecte=
d and non-protected DMA-capable devices.

Yes you are right thats what I though when I fixed the error but then I tho=
ught in different direction if IOMMU is enabled system wise every device sh=
ould be protected by IOMMU. My understanding might be wrong.

Regards,
Rahul

> Cheers,
>=20
> --=20
> Julien Grall


