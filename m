Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 554932FD416
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 16:35:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71575.128268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2FWN-0006sJ-Ft; Wed, 20 Jan 2021 15:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71575.128268; Wed, 20 Jan 2021 15:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2FWN-0006ru-CY; Wed, 20 Jan 2021 15:35:47 +0000
Received: by outflank-mailman (input) for mailman id 71575;
 Wed, 20 Jan 2021 15:35:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ziLf=GX=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1l2FWL-0006rk-QS
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 15:35:46 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::617])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e25c865b-deb4-4f33-98e7-492141d76c8a;
 Wed, 20 Jan 2021 15:35:43 +0000 (UTC)
Received: from DB8PR04CA0008.eurprd04.prod.outlook.com (2603:10a6:10:110::18)
 by DBBPR08MB4523.eurprd08.prod.outlook.com (2603:10a6:10:c8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 15:35:38 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::37) by DB8PR04CA0008.outlook.office365.com
 (2603:10a6:10:110::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Wed, 20 Jan 2021 15:35:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 20 Jan 2021 15:35:38 +0000
Received: ("Tessian outbound e989e14f9207:v71");
 Wed, 20 Jan 2021 15:35:38 +0000
Received: from 892a50b84ab8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A0513DCE-EF92-426E-9964-7DBCEF8E2CAC.1; 
 Wed, 20 Jan 2021 15:35:30 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 892a50b84ab8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Jan 2021 15:35:30 +0000
Received: from PR3PR08MB5689.eurprd08.prod.outlook.com (2603:10a6:102:90::10)
 by PAXPR08MB6432.eurprd08.prod.outlook.com (2603:10a6:102:154::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 15:35:28 +0000
Received: from PR3PR08MB5689.eurprd08.prod.outlook.com
 ([fe80::850d:8ef2:87a1:8892]) by PR3PR08MB5689.eurprd08.prod.outlook.com
 ([fe80::850d:8ef2:87a1:8892%6]) with mapi id 15.20.3784.011; Wed, 20 Jan 2021
 15:35:28 +0000
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
X-Inumbo-ID: e25c865b-deb4-4f33-98e7-492141d76c8a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgX7WH8uCA5TKhaPCUskk2zmpPU/gi/wbrXQpKG9FLo=;
 b=G60p1tZ7jk49LDoTAAoh5ItriAnEmRr0ZIKsdupxGgGL7BxpTq7gCl+sAYzo7nhKRtrsDBafvNAu7+jWtlMzWMrtwZlEUvREK5v2W7SiMrDjrjYZYkoo3Gg+3nvhC9NtrKmNWQpiOM6wd/F7KHPnANGBq+E+lFUY/rLF+3WkVro=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 272ef9a8b07f6655
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atO3LTUFgUkAzBfcLDbgfm8ws6a0yjsh6StPy6DFUdu/4SK8VvKj8YmFNtFGwBvaTBrwj+SoEx4pRqNd5VADbqrv81iZJfBnz2Hu2OjXa9flhMRSkV5BQLUpA7L82OeYwKpKik6y0740aM54sVcGe9ynkeEYZbbYb4Q5zde6rQ8t3ksnx6J/T/RDyQh2TJoqvs1ebhWwp/8rCI8uXhgGZrLCo4xlXeMCIuD44k5qmWJJ1gKuh/Gz5wWd0Rq9s/3CPSNQa64Y3x3pHohJBQVHeoj+imkkV8J4Sv13KMO44avsroUMtiV6TiEoGmQ40lttoZPsK4qpod05jTX6kIJnYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgX7WH8uCA5TKhaPCUskk2zmpPU/gi/wbrXQpKG9FLo=;
 b=eUfadPmHBrzxcfKZkYqTrXVguLODUK4fWclv6YTzw9/MVvhJ5oLABfUH6c+grnwjy+Oo/OaUs2/5KOE7E8AiZE1NyIyBk063gvUNUCyAmMiZVJ/NihMQLwvzzKUWhsc0KfgkSVIw7u8t/nz0Cf59IjyShIqdq/I7DY7wFaEQcU9tUclQvYnepdz9UIpnxwOGE+fsp36p6TUMwHljKGA0WQoZTO9zQ0oLdCc/Xwi40oCq8iEs64kUMhYOpMTOGCm5WXNT5hCi/THpuvMFTwqE7iz5bUMLCnU9Ml8OgBYdhkiTjlOec8nAdCI1LQwYsaGmd53gGRQZOKPDGHlgDsj84g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgX7WH8uCA5TKhaPCUskk2zmpPU/gi/wbrXQpKG9FLo=;
 b=G60p1tZ7jk49LDoTAAoh5ItriAnEmRr0ZIKsdupxGgGL7BxpTq7gCl+sAYzo7nhKRtrsDBafvNAu7+jWtlMzWMrtwZlEUvREK5v2W7SiMrDjrjYZYkoo3Gg+3nvhC9NtrKmNWQpiOM6wd/F7KHPnANGBq+E+lFUY/rLF+3WkVro=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 10/10] xen/arm: smmuv3: Add support for SMMUv3 driver
Thread-Topic: [PATCH v5 10/10] xen/arm: smmuv3: Add support for SMMUv3 driver
Thread-Index: AQHW7zzXOT1AneIGYEWn6+xipuJr9KowpUeA
Date: Wed, 20 Jan 2021 15:35:28 +0000
Message-ID: <36CC7491-49C9-4B8F-A1E8-4B35A87DD5CF@arm.com>
References: <cover.1611153615.git.rahul.singh@arm.com>
 <b14ea889b0c27fec1b8843da91b570b0ccd66796.1611153615.git.rahul.singh@arm.com>
In-Reply-To:
 <b14ea889b0c27fec1b8843da91b570b0ccd66796.1611153615.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 84d15deb-2f9d-4763-a919-08d8bd5909a7
x-ms-traffictypediagnostic: PAXPR08MB6432:|DBBPR08MB4523:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB4523613E5D49C69016A536519DA20@DBBPR08MB4523.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3968;OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BwzQwjSNi01hhnwYqGW5/vOxs7GNDYpD+fTuEgZDwhMzJIrWrAgPQLXJ43pHhO1pokw7aYa1jbOs8luuO/u5Cta7bcskGPzpkxexhT4y7bwqCtA5mjUcF9vDCkw4ERXMSa5Yi516FwALiMDFz/M19ku8FVLpqYi5rCWzwk2lTOr4ES3zNxuRVytgmQpkqB/yhu+ByQsHZ2R2XOdP3TuXqQsp4m53lzAxGrMH0twQAOJ7pkh3KbQRcuBB6SHDmBUgGOPb2n/RDMKiBJ7l+Qg1ZCGSTttputYXcUV3kr7HqRdGp0BrTk2DkCSXOWy2u+fTMNLcNdjUQrNlddDWM0akZ8pP0OyKZx/+mTppUCKqPWKrtWdJ4hMpZqdijXsWSWUaAhQiWiWe/w+8IQBIreU0Iv9fsHlxIJLG/780OR3LB01fWa2ZeYIuAc1b9ye183zKDZSNTnNV7ndY9Xu3HblIZUAm8nF8gPJS6Gi9tRzeWYJc+M3tuqeaVe3VRsOft4O4PUVmCY8hfYYrnOvNz6X7dBpqmJfkdcdrWHTgNNPWwg6RF6ExX8SdtGc7Z7vBW9RA8VY3FuYvniRuJsMZpMZBwvcCoN4Z/VGXmKr5uGb4Z0oV0QmdI9MlDAjAZHUNGPiaRqG3B7I+4du4GdgbmvhhVeclxd04Vc+RIBBpP88rbeZQ/KZle1lCa7vj36j4jTPTPsYOexnhA55jpQanHJoApA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(30864003)(8676002)(6512007)(86362001)(478600001)(2616005)(4326008)(54906003)(7416002)(36756003)(64756008)(91956017)(66476007)(83380400001)(55236004)(5660300002)(6486002)(53546011)(66946007)(8936002)(37006003)(33656002)(186003)(71200400001)(2906002)(26005)(66446008)(76116006)(6506007)(66556008)(6636002)(316002)(6862004)(2004002)(45980500001)(559001)(579004)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?2HdNJK8t8bfwo4FN7IfEAZ6D5R5bKue2FR6szYq9LFzguELLzd7Z3/dOlWm5?=
 =?us-ascii?Q?D1BtzqDTSh/XLdPD9Ls8zgdRAPOV1ETqMioTNdRkK9sSQeC74aBrLDR6101b?=
 =?us-ascii?Q?jWkF7ccVXsow3DaUJ/zRLCuhFMdqncO4WHEC2P91/yLUEPZS0WAqviKcte/v?=
 =?us-ascii?Q?PJmwCwutfG2+oZRIHroYzoD7ncoTvMGPB+NgKHwIFsEZq/kBxpD3UwQt9UQb?=
 =?us-ascii?Q?2FVVbD6SVxmLy13sT0pmZtH1I6EAa5cb+lMy/5vMBenSAhZa4HniZiWwFVIl?=
 =?us-ascii?Q?QAasZ2RX2nbcOTIqiD/9lmCeLlFCKc4yF7FSw7fCG1evw8K/yOMyDJIt4C4h?=
 =?us-ascii?Q?EdZKzyHzHJL6f1qW0q5RI9VkXryRH1ws0tdXl6gSkrTMRKGa5SBHauQC/dj0?=
 =?us-ascii?Q?5iDQ9zGvyx3DrG6jyECC8ghZEH4xWw11pmt6xBLmx0Mg5S5PLuuZ154+c+rK?=
 =?us-ascii?Q?G+tOdPySW1ggofoLGAiORd+n6gxeak0GHwSIe4O7Y8NtITvTUB9lS8/l3CA3?=
 =?us-ascii?Q?JoqMzuXohwNfN9S+bo7BFuJI/qHOtXt2Qx3EyAl6CZUEyC/y+AnksatowrpV?=
 =?us-ascii?Q?whMd9WpGa0kZeig8S1QoZXmW8ggyAWBFM5wAFlHxQGIR4PJkXwLr5A3IeL74?=
 =?us-ascii?Q?zOxcP8i9n+BUsJwLohHZXmtT8RXUovoyrB6WCaJo5oPso0L24bCinI3M7SKN?=
 =?us-ascii?Q?n8syiQeZf/X3EnaEWjGL2+ipqzl/fQTBHgfPfgpyhUHIgsRkexIM3uueX36p?=
 =?us-ascii?Q?+5nzdRqeNQUcSZbOXhU6bQj4mrlLN8X5fSQGg+1a7nSxMACYSF3H+P8VXxrq?=
 =?us-ascii?Q?jrI3RPPAhaZaRX3kOcjpIzeeIUVeclyoEewbUDFE/qT2zgBFkPMUS9BcMwBJ?=
 =?us-ascii?Q?mAzgGXMp2ERWqv+ji+Kx1QskXIubsZ4JmSzxRCbMpU2smHz8uQnUL9sXHbeG?=
 =?us-ascii?Q?MniccxqGIAL0/VQqZDPVyCUFDhHsXyrNW2VFxIywIn7pAMRxtYMfBYMWAya/?=
 =?us-ascii?Q?CqXf?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D9D91AF95B575A4999D5071120645C16@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6432
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	85de7879-1eaf-4fb2-7d66-08d8bd5903b5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qR2yolX10bySYAQ7+wzhP6Pq/HTkqX8xMmn9D1ASmPEb25Zn8SJzJkzPGLsqvZiL4RcOC76qMZg1tHdYIOhAAA4oa5Rt+eiIWuGivujMLlcYcyMzmfxy7/3lTcyaaA6/CYdqWYXyuY4Kga/Dklo1g+vTx2KaENwrYw61QILEc+Q71ZegRuB93a/Bj8MtoM67Jul83WY4nLE1Qpuxt9c47w+UhrEbTPkbYW9hZNl3eO62iM+XBBI1WXgx/mUMeon8jV/9TWxLH08WJ6k2Af/pynl1TLfIlLCMqK1Reffd8XurXXKMgxvvAJmdSF0o0frhP10b7iTs8VpISzGtjylqu9E3m814xJBCCzvj7U11Xpe9E1aWFOzRvYeN/E6quL6Qlrvtoa1YGC3NeBvG3s8xkkBK/neIvULlxgICaPJBqsdVwAaiC0iBK3LfLe8iev6EO2QCtJintAQbtHfIPPoZ/YIs9LkcuWZ0DyPFL8qb3OR60TMgqOxpUf6YZYy62H74/GGd3yWtmItSqob1KT7dV3V1r1zcTaQKtH/oNR3wggK8lcqVXl1d+YlWoTt/8k72aH30MUr8UDFf3Hefk1A7Lw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(46966006)(83380400001)(5660300002)(70586007)(70206006)(478600001)(33656002)(86362001)(82310400003)(2616005)(107886003)(82740400003)(26005)(186003)(8676002)(54906003)(36756003)(37006003)(53546011)(81166007)(30864003)(2906002)(8936002)(6636002)(6512007)(6486002)(336012)(4326008)(47076005)(316002)(356005)(55236004)(6506007)(6862004)(2004002)(579004)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 15:35:38.4087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d15deb-2f9d-4763-a919-08d8bd5909a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4523

Hi Rahul,

> On 20 Jan 2021, at 14:52, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> Add support for ARM architected SMMUv3 implementation. It is based on
> the Linux SMMUv3 driver.
>=20
> Driver is currently supported as Tech Preview.
>=20
> Major differences with regard to Linux driver are as follows:
> 2. Only Stage-2 translation is supported as compared to the Linux driver
>   that supports both Stage-1 and Stage-2 translations.
> 3. Use P2M  page table instead of creating one as SMMUv3 has the
>   capability to share the page tables with the CPU.
> 4. Tasklets are used in place of threaded IRQ's in Linux for event queue
>   and priority queue IRQ handling.
> 5. Latest version of the Linux SMMUv3 code implements the commands queue
>   access functions based on atomic operations implemented in Linux.
>   Atomic functions used by the commands queue access functions are not
>   implemented in XEN therefore we decided to port the earlier version
>   of the code. Atomic operations are introduced to fix the bottleneck
>   of the SMMU command queue insertion operation. A new algorithm for
>   inserting commands into the queue is introduced, which is lock-free
>   on the fast-path.
>   Consequence of reverting the patch is that the command queue
>   insertion will be slow for large systems as spinlock will be used to
>   serializes accesses from all CPUs to the single queue supported by
>   the hardware. Once the proper atomic operations will be available in
>   XEN the driver can be updated.
> 6. Spin lock is used in place of mutex when attaching a device to the
>   SMMU, as there is no blocking locks implementation available in XEN.
>   This might introduce latency in XEN. Need to investigate before
>   driver is out for tech preview.
> 7. PCI ATS functionality is not supported, as there is no support
>   available in XEN to test the functionality. Code is not tested and
>   compiled. Code is guarded by the flag CONFIG_PCI_ATS.
> 8. MSI interrupts are not supported as there is no support available in
>   XEN to request MSI interrupts. Code is not tested and compiled. Code
>   is guarded by the flag CONFIG_MSI.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes since v2:
> - added return statement for readx_poll_timeout function.
> - remove iommu_get_dma_cookie and iommu_put_dma_cookie.
> - remove struct arm_smmu_xen_device as not required.
> - move dt_property_match_string to device_tree.c file.
> - replace arm_smmu_*_thread to arm_smmu_*_tasklet to avoid confusion.
> - use ARM_SMMU_REG_SZ as size when map memory to XEN.
> - remove bypass keyword to make sure when device-tree probe is failed we
>  are reporting error and not continuing to configure SMMU in bypass
>  mode.
> - fixed minor comments.
> Changes since v3:
> - Fixed typo for CONFIG_MSI
> - Added back the mutex code
> - Rebase the patch on top of newly added WARN_ON().
> - Remove the direct read of register VTCR_EL2.
> - Fixed minor comments.
> Changes since v4:
> - Replace the ffsll() with ffs64() function.
> - Add code to free resources when probe failed.
> ---
> ---
> MAINTAINERS                           |   6 +
> SUPPORT.md                            |   1 +
> xen/drivers/passthrough/Kconfig       |  11 +
> xen/drivers/passthrough/arm/Makefile  |   1 +
> xen/drivers/passthrough/arm/smmu-v3.c | 939 ++++++++++++++++++++++----
> 5 files changed, 830 insertions(+), 128 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5079b834c2..14240e8e1e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -249,6 +249,12 @@ F:	xen/include/asm-arm/
> F:	xen/include/public/arch-arm/
> F:	xen/include/public/arch-arm.h
>=20
> +ARM SMMUv3
> +M:	Bertrand Marquis <bertrand.marquis@arm.com>
> +M:	Rahul Singh <rahul.singh@arm.com>
> +S:	Supported
> +F:	xen/drivers/passthrough/arm/smmu-v3.c
> +
> Change Log
> M:	Paul Durrant <paul@xen.org>
> R:	Community Manager <community.manager@xenproject.org>
> diff --git a/SUPPORT.md b/SUPPORT.md
> index ab02aca5f4..5ee3c8651a 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -67,6 +67,7 @@ For the Cortex A57 r0p0 - r1p1, see Errata 832075.
>     Status, Intel VT-d: Supported
>     Status, ARM SMMUv1: Supported, not security supported
>     Status, ARM SMMUv2: Supported, not security supported
> +    Status, ARM SMMUv3: Tech Preview
>     Status, Renesas IPMMU-VMSA: Supported, not security supported
>=20
> ### ARM/GICv3 ITS
> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kc=
onfig
> index 0036007ec4..341ba92b30 100644
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -13,6 +13,17 @@ config ARM_SMMU
> 	  Say Y here if your SoC includes an IOMMU device implementing the
> 	  ARM SMMU architecture.
>=20
> +config ARM_SMMU_V3
> +	bool "ARM Ltd. System MMU Version 3 (SMMUv3) Support" if EXPERT
> +	depends on ARM_64
> +	---help---
> +	 Support for implementations of the ARM System MMU architecture
> +	 version 3. Driver is in experimental stage and should not be used in
> +	 production.
> +
> +	 Say Y here if your system includes an IOMMU device implementing
> +	 the ARM SMMUv3 architecture.
> +
> config IPMMU_VMSA
> 	bool "Renesas IPMMU-VMSA found in R-Car Gen3 SoCs"
> 	depends on ARM_64
> diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthrou=
gh/arm/Makefile
> index fcd918ea3e..c5fb3b58a5 100644
> --- a/xen/drivers/passthrough/arm/Makefile
> +++ b/xen/drivers/passthrough/arm/Makefile
> @@ -1,3 +1,4 @@
> obj-y +=3D iommu.o iommu_helpers.o iommu_fwspec.o
> obj-$(CONFIG_ARM_SMMU) +=3D smmu.o
> obj-$(CONFIG_IPMMU_VMSA) +=3D ipmmu-vmsa.o
> +obj-$(CONFIG_ARM_SMMU_V3) +=3D smmu-v3.o
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index 2dfadc6a65..dd0540bb5f 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -2,37 +2,263 @@
> /*
>  * IOMMU API for ARM architected SMMUv3 implementations.
>  *
> + * Based on Linux's SMMUv3 driver:
> + *    drivers/iommu/arm-smmu-v3.c
> + *    commit: ab435ce49bd1d02e33dfec24f76955dc1196970b
> + * and Xen's SMMU driver:
> + *    xen/drivers/passthrough/arm/smmu.c
> + *
> + * Major differences with regard to Linux driver are as follows:
> + *  1. Driver is currently supported as Tech Preview.
> + *  2. Only Stage-2 translation is supported as compared to the Linux dr=
iver
> + *     that supports both Stage-1 and Stage-2 translations.
> + *  3. Use P2M  page table instead of creating one as SMMUv3 has the
> + *     capability to share the page tables with the CPU.
> + *  4. Tasklets are used in place of threaded IRQ's in Linux for event q=
ueue
> + *     and priority queue IRQ handling.
> + *  5. Latest version of the Linux SMMUv3 code implements the commands q=
ueue
> + *     access functions based on atomic operations implemented in Linux.
> + *     Atomic functions used by the commands queue access functions are =
not
> + *     implemented in XEN therefore we decided to port the earlier versi=
on
> + *     of the code. Atomic operations are introduced to fix the bottlene=
ck of
> + *     the SMMU command queue insertion operation. A new algorithm for
> + *     inserting commands into the queue is introduced, which is
> + *     lock-free on the fast-path.
> + *     Consequence of reverting the patch is that the command queue inse=
rtion
> + *     will be slow for large systems as spinlock will be used to serial=
izes
> + *     accesses from all CPUs to the single queue supported by the hardw=
are.
> + *     Once the proper atomic operations will be available in XEN the dr=
iver
> + *     can be updated.
> + *  6. Spin lock is used in place of Mutex when attaching a device to th=
e SMMU,
> + *     as there is no blocking locks implementation available in XEN.Thi=
s might
> + *     introduce latency in XEN. Need to investigate before driver is ou=
t for
> + *     Tech Preview.
> + *  7. PCI ATS functionality is not supported, as there is no support av=
ailable
> + *     in XEN to test the functionality. Code is not tested and compiled=
. Code
> + *     is guarded by the flag CONFIG_PCI_ATS.
> + *  8. MSI interrupts are not supported as there is no support available
> + *     in XEN to request MSI interrupts. Code is not tested and compiled=
. Code
> + *     is guarded by the flag CONFIG_MSI.
> + *
> + * Following functionality should be supported before driver is out for =
tech
> + * preview
> + *
> + *  1. Investigate the timing analysis of using spin lock in place of mu=
tex
> + *     when attaching devices to SMMU.
> + *  2. Merged the latest Linux SMMUv3 driver code once atomic operation =
is
> + *     available in XEN.
> + *  3. PCI ATS and MSI interrupts should be supported.
> + *  4. Investigate side-effect of using tasklet in place of threaded IRQ=
 and
> + *     fix if any.
> + *
>  * Copyright (C) 2015 ARM Limited
>  *
>  * Author: Will Deacon <will.deacon@arm.com>
>  *
> - * This driver is powered by bad coffee and bombay mix.
> + * Copyright (C) 2020 Arm Ltd
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + *
>  */
>=20
> -#include <linux/acpi.h>
> -#include <linux/acpi_iort.h>
> -#include <linux/bitfield.h>
> -#include <linux/bitops.h>
> -#include <linux/crash_dump.h>
> -#include <linux/delay.h>
> -#include <linux/dma-iommu.h>
> -#include <linux/err.h>
> -#include <linux/interrupt.h>
> -#include <linux/io-pgtable.h>
> -#include <linux/iommu.h>
> -#include <linux/iopoll.h>
> -#include <linux/module.h>
> -#include <linux/msi.h>
> -#include <linux/of.h>
> -#include <linux/of_address.h>
> -#include <linux/of_iommu.h>
> -#include <linux/of_platform.h>
> -#include <linux/pci.h>
> -#include <linux/pci-ats.h>
> -#include <linux/platform_device.h>
> -
> -#include <linux/amba/bus.h>
> +#include <xen/acpi.h>
> +#include <xen/config.h>
> +#include <xen/delay.h>
> +#include <xen/errno.h>
> +#include <xen/err.h>
> +#include <xen/irq.h>
> +#include <xen/lib.h>
> +#include <xen/list.h>
> +#include <xen/mm.h>
> +#include <xen/rbtree.h>
> +#include <xen/sched.h>
> +#include <xen/sizes.h>
> +#include <xen/vmap.h>
> +#include <asm/atomic.h>
> +#include <asm/device.h>
> +#include <asm/io.h>
> +#include <asm/iommu_fwspec.h>
> +#include <asm/platform.h>
> +
> +
> +#define ARM_SMMU_VTCR_SH_IS		3
> +#define ARM_SMMU_VTCR_RGN_WBWA		1
> +#define ARM_SMMU_VTCR_TG0_4K		0
> +#define ARM_SMMU_VTCR_PS_32_BIT		0x0ULL
> +#define ARM_SMMU_VTCR_PS_36_BIT		0x1ULL
> +#define ARM_SMMU_VTCR_PS_40_BIT		0x2ULL
> +#define ARM_SMMU_VTCR_PS_42_BIT		0x3ULL
> +#define ARM_SMMU_VTCR_PS_44_BIT		0x4ULL
> +#define ARM_SMMU_VTCR_PS_48_BIT		0x5ULL
> +#define ARM_SMMU_VTCR_PS_52_BIT		0x6ULL
> +
> +/* Linux compatibility functions. */
> +typedef paddr_t		dma_addr_t;
> +typedef paddr_t		phys_addr_t;
> +typedef unsigned int		gfp_t;
> +
> +#define platform_device		device
> +
> +#define GFP_KERNEL		0
> +
> +/* Alias to Xen lock functions */
> +#define mutex spinlock
> +#define mutex_init spin_lock_init
> +#define mutex_lock spin_lock
> +#define mutex_unlock spin_unlock
> +
> +/* Device logger functions */
> +#define dev_name(dev)	dt_node_full_name(dev->of_node)
> +#define dev_dbg(dev, fmt, ...)			\
> +	printk(XENLOG_DEBUG "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
> +#define dev_notice(dev, fmt, ...)		\
> +	printk(XENLOG_INFO "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
> +#define dev_warn(dev, fmt, ...)			\
> +	printk(XENLOG_WARNING "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__=
)
> +#define dev_err(dev, fmt, ...)			\
> +	printk(XENLOG_ERR "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
> +#define dev_info(dev, fmt, ...)			\
> +	printk(XENLOG_INFO "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
> +#define dev_err_ratelimited(dev, fmt, ...)			\
> +	printk(XENLOG_ERR "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
> +
> +/*
> + * Periodically poll an address and wait between reads in us until a
> + * condition is met or a timeout occurs.
> + *
> + * @return: 0 when cond met, -ETIMEDOUT upon timeout
> + */
> +#define readx_poll_timeout(op, addr, val, cond, sleep_us, timeout_us) \
> +({ \
> +	s_time_t deadline =3D NOW() + MICROSECS(timeout_us); \
> +	for (;;) { \
> +		(val) =3D op(addr); \
> +		if (cond) \
> +			break; \
> +		if (NOW() > deadline) { \
> +			(val) =3D op(addr); \
> +			break; \
> +		} \
> +		udelay(sleep_us); \
> +	} \
> +	(cond) ? 0 : -ETIMEDOUT; \
> +})
> +
> +#define readl_relaxed_poll_timeout(addr, val, cond, delay_us, timeout_us=
)	\
> +	readx_poll_timeout(readl_relaxed, addr, val, cond, delay_us, timeout_us=
)
> +
> +#define FIELD_PREP(_mask, _val)			\
> +	(((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))
> +
> +#define FIELD_GET(_mask, _reg)			\
> +	((typeof(_mask))(((_reg) & (_mask)) >> (ffs64(_mask) - 1)))
> +
> +/*
> + * Helpers for DMA allocation. Just the function name is reused for
> + * porting code, these allocation are not managed allocations
> + */
> +static void *dmam_alloc_coherent(struct device *dev, size_t size,
> +				paddr_t *dma_handle, gfp_t gfp)
> +{
> +	void *vaddr;
> +	unsigned long alignment =3D size;
> +
> +	/*
> +	 * _xzalloc requires that the (align & (align -1)) =3D 0. Most of the
> +	 * allocations in SMMU code should send the right value for size. In
> +	 * case this is not true print a warning and align to the size of a
> +	 * (void *)
> +	 */
> +	if (size & (size - 1)) {
> +		printk(XENLOG_WARNING "SMMUv3: Fixing alignment for the DMA buffer\n")=
;
> +		alignment =3D sizeof(void *);
> +	}
> +
> +	vaddr =3D _xzalloc(size, alignment);
> +	if (!vaddr) {
> +		printk(XENLOG_ERR "SMMUv3: DMA allocation failed\n");
> +		return NULL;
> +	}
> +
> +	*dma_handle =3D virt_to_maddr(vaddr);
> +
> +	return vaddr;
> +}
> +
> +
> +/* Xen specific code. */
> +struct iommu_domain {
> +	/* Runtime SMMU configuration for this iommu_domain */
> +	atomic_t		ref;
> +	/*
> +	 * Used to link iommu_domain contexts for a same domain.
> +	 * There is at least one per-SMMU to used by the domain.
> +	 */
> +	struct list_head		list;
> +};
> +
> +/* Describes information required for a Xen domain */
> +struct arm_smmu_xen_domain {
> +	spinlock_t		lock;
> +
> +	/* List of iommu domains associated to this domain */
> +	struct list_head	contexts;
> +};
> +
> +
> +/* Keep a list of devices associated with this driver */
> +static DEFINE_SPINLOCK(arm_smmu_devices_lock);
> +static LIST_HEAD(arm_smmu_devices);
> +
> +static inline void *dev_iommu_priv_get(struct device *dev)
> +{
> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> +
> +	return fwspec && fwspec->iommu_priv ? fwspec->iommu_priv : NULL;
> +}
> +
> +static inline void dev_iommu_priv_set(struct device *dev, void *priv)
> +{
> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> +
> +	fwspec->iommu_priv =3D priv;
> +}
> +
> +static int platform_get_irq_byname_optional(struct device *dev,
> +				const char *name)
> +{
> +	int index, ret;
> +	struct dt_device_node *np  =3D dev_to_dt(dev);
> +
> +	if (unlikely(!name))
> +		return -EINVAL;
> +
> +	index =3D dt_property_match_string(np, "interrupt-names", name);
> +	if (index < 0) {
> +		dev_info(dev, "IRQ %s not found\n", name);
> +		return index;
> +	}
> +
> +	ret =3D platform_get_irq(np, index);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to get irq index %d\n", index);
> +		return -ENODEV;
> +	}
> +
> +	return ret;
> +}
>=20
> +/* Start of Linux SMMUv3 code */
> /* MMIO registers */
> #define ARM_SMMU_IDR0			0x0
> #define IDR0_ST_LVL			GENMASK(28, 27)
> @@ -402,6 +628,7 @@ enum pri_resp {
> 	PRI_RESP_SUCC =3D 2,
> };
>=20
> +#ifdef CONFIG_MSI
> enum arm_smmu_msi_index {
> 	EVTQ_MSI_INDEX,
> 	GERROR_MSI_INDEX,
> @@ -426,6 +653,7 @@ static phys_addr_t arm_smmu_msi_cfg[ARM_SMMU_MAX_MSIS=
][3] =3D {
> 		ARM_SMMU_PRIQ_IRQ_CFG2,
> 	},
> };
> +#endif /* CONFIG_MSI */
>=20
> struct arm_smmu_cmdq_ent {
> 	/* Common fields */
> @@ -613,8 +841,13 @@ struct arm_smmu_device {
> 		u64			padding;
> 	};
>=20
> -	/* IOMMU core code handle */
> -	struct iommu_device		iommu;
> +	/* Need to keep a list of SMMU devices */
> +	struct list_head		devices;
> +
> +	/* Tasklets for handling evts/faults and pci page request IRQs*/
> +	struct tasklet		evtq_irq_tasklet;
> +	struct tasklet		priq_irq_tasklet;
> +	struct tasklet		combined_irq_tasklet;
> };
>=20
> /* SMMU private data for each master */
> @@ -646,6 +879,9 @@ struct arm_smmu_domain {
> 	enum arm_smmu_domain_stage	stage;
> 	struct arm_smmu_s2_cfg	s2_cfg;
>=20
> +	/* Xen domain associated with this SMMU domain */
> +	struct domain		*d;
> +
> 	struct iommu_domain		domain;
>=20
> 	struct list_head		devices;
> @@ -984,6 +1220,7 @@ static void arm_smmu_cmdq_issue_cmd(struct arm_smmu_=
device *smmu,
> 	spin_unlock_irqrestore(&smmu->cmdq.lock, flags);
> }
>=20
> +#ifdef CONFIG_MSI
> /*
>  * The difference between val and sync_idx is bounded by the maximum size=
 of
>  * a queue at 2^20 entries, so 32 bits is plenty for wrap-safe arithmetic=
.
> @@ -1027,6 +1264,13 @@ static int __arm_smmu_cmdq_issue_sync_msi(struct a=
rm_smmu_device *smmu)
>=20
> 	return __arm_smmu_sync_poll_msi(smmu, ent.sync.msidata);
> }
> +#else
> +static inline int __arm_smmu_cmdq_issue_sync_msi(struct arm_smmu_device =
*smmu)
> +{
> +	return 0;
> +}
> +#endif /* CONFIG_MSI */
> +
>=20
> static int __arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
> {
> @@ -1069,7 +1313,7 @@ arm_smmu_write_strtab_l1_desc(__le64 *dst, struct a=
rm_smmu_strtab_l1_desc *desc)
> 	val |=3D desc->l2ptr_dma & STRTAB_L1_DESC_L2PTR_MASK;
>=20
> 	/* See comment in arm_smmu_write_ctx_desc() */
> -	WRITE_ONCE(*dst, cpu_to_le64(val));
> +	write_atomic(dst, cpu_to_le64(val));
> }
>=20
> static void arm_smmu_sync_ste_for_sid(struct arm_smmu_device *smmu, u32 s=
id)
> @@ -1184,7 +1428,7 @@ static void arm_smmu_write_strtab_ent(struct arm_sm=
mu_master *master, u32 sid,
> 						 STRTAB_STE_1_EATS_TRANS));
>=20
> 	arm_smmu_sync_ste_for_sid(smmu, sid);
> -	WRITE_ONCE(dst[0], cpu_to_le64(val));
> +	write_atomic(&dst[0], cpu_to_le64(val));
> 	arm_smmu_sync_ste_for_sid(smmu, sid);
>=20
> 	/* It's likely that we'll want to use the new STE soon */
> @@ -1231,7 +1475,7 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_=
device *smmu, u32 sid)
> }
>=20
> /* IRQ and event handlers */
> -static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
> +static void arm_smmu_evtq_tasklet(void *dev)
> {
> 	int i;
> 	struct arm_smmu_device *smmu =3D dev;
> @@ -1261,7 +1505,6 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, vo=
id *dev)
> 	/* Sync our overflow flag, as we believe we're up to speed */
> 	llq->cons =3D Q_OVF(llq->prod) | Q_WRP(llq, llq->cons) |
> 		    Q_IDX(llq, llq->cons);
> -	return IRQ_HANDLED;
> }
>=20
> static void arm_smmu_handle_ppr(struct arm_smmu_device *smmu, u64 *evt)
> @@ -1302,7 +1545,7 @@ static void arm_smmu_handle_ppr(struct arm_smmu_dev=
ice *smmu, u64 *evt)
> 	}
> }
>=20
> -static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
> +static void arm_smmu_priq_tasklet(void *dev)
> {
> 	struct arm_smmu_device *smmu =3D dev;
> 	struct arm_smmu_queue *q =3D &smmu->priq.q;
> @@ -1321,12 +1564,12 @@ static irqreturn_t arm_smmu_priq_thread(int irq, =
void *dev)
> 	llq->cons =3D Q_OVF(llq->prod) | Q_WRP(llq, llq->cons) |
> 		      Q_IDX(llq, llq->cons);
> 	queue_sync_cons_out(q);
> -	return IRQ_HANDLED;
> }
>=20
> static int arm_smmu_device_disable(struct arm_smmu_device *smmu);
>=20
> -static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
> +static void arm_smmu_gerror_handler(int irq, void *dev,
> +				struct cpu_user_regs *regs)
> {
> 	u32 gerror, gerrorn, active;
> 	struct arm_smmu_device *smmu =3D dev;
> @@ -1336,7 +1579,7 @@ static irqreturn_t arm_smmu_gerror_handler(int irq,=
 void *dev)
>=20
> 	active =3D gerror ^ gerrorn;
> 	if (!(active & GERROR_ERR_MASK))
> -		return IRQ_NONE; /* No errors pending */
> +		return; /* No errors pending */
>=20
> 	dev_warn(smmu->dev,
> 		 "unexpected global error reported (0x%08x), this could be serious\n",
> @@ -1369,26 +1612,44 @@ static irqreturn_t arm_smmu_gerror_handler(int ir=
q, void *dev)
> 		arm_smmu_cmdq_skip_err(smmu);
>=20
> 	writel(gerror, smmu->base + ARM_SMMU_GERRORN);
> -	return IRQ_HANDLED;
> }
>=20
> -static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
> +static void arm_smmu_combined_irq_handler(int irq, void *dev,
> +				struct cpu_user_regs *regs)
> {
> 	struct arm_smmu_device *smmu =3D dev;
>=20
> -	arm_smmu_evtq_thread(irq, dev);
> +	arm_smmu_gerror_handler(irq, dev, regs);
> +
> +	tasklet_schedule(&(smmu->combined_irq_tasklet));
> +}
> +
> +static void arm_smmu_combined_irq_tasklet(void *dev)
> +{
> +	struct arm_smmu_device *smmu =3D dev;
> +
> +	arm_smmu_evtq_tasklet(dev);
> 	if (smmu->features & ARM_SMMU_FEAT_PRI)
> -		arm_smmu_priq_thread(irq, dev);
> +		arm_smmu_priq_tasklet(dev);
> +}
> +
> +static void arm_smmu_evtq_irq_tasklet(int irq, void *dev,
> +				struct cpu_user_regs *regs)
> +{
> +	struct arm_smmu_device *smmu =3D dev;
>=20
> -	return IRQ_HANDLED;
> +	tasklet_schedule(&(smmu->evtq_irq_tasklet));
> }
>=20
> -static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
> +static void arm_smmu_priq_irq_tasklet(int irq, void *dev,
> +				struct cpu_user_regs *regs)
> {
> -	arm_smmu_gerror_handler(irq, dev);
> -	return IRQ_WAKE_THREAD;
> +	struct arm_smmu_device *smmu =3D dev;
> +
> +	tasklet_schedule(&(smmu->priq_irq_tasklet));
> }
>=20
> +#ifdef CONFIG_PCI_ATS
> static void
> arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
> 			struct arm_smmu_cmdq_ent *cmd)
> @@ -1495,6 +1756,7 @@ static int arm_smmu_atc_inv_domain(struct arm_smmu_=
domain *smmu_domain,
>=20
> 	return ret ? -ETIMEDOUT : 0;
> }
> +#endif /* CONFIG_PCI_ATS */
>=20
> static void arm_smmu_tlb_inv_context(void *cookie)
> {
> @@ -1525,7 +1787,7 @@ static struct iommu_domain *arm_smmu_domain_alloc(v=
oid)
> 	 * We can't really do anything meaningful until we've added a
> 	 * master.
> 	 */
> -	smmu_domain =3D kzalloc(sizeof(*smmu_domain), GFP_KERNEL);
> +	smmu_domain =3D xzalloc(struct arm_smmu_domain);
> 	if (!smmu_domain)
> 		return NULL;
>=20
> @@ -1563,7 +1825,7 @@ static void arm_smmu_domain_free(struct iommu_domai=
n *domain)
> 	if (cfg->vmid)
> 		arm_smmu_bitmap_free(smmu->vmid_map, cfg->vmid);
>=20
> -	kfree(smmu_domain);
> +	xfree(smmu_domain);
> }
>=20
>=20
> @@ -1576,6 +1838,44 @@ static int arm_smmu_domain_finalise_s2(struct arm_=
smmu_domain *smmu_domain,
> 	struct arm_smmu_s2_cfg *cfg =3D &smmu_domain->s2_cfg;
> 	typeof(&arm_lpae_s2_cfg.vtcr) vtcr =3D &arm_lpae_s2_cfg.vtcr;
>=20
> +	vtcr->sh =3D ARM_SMMU_VTCR_SH_IS;
> +	vtcr->irgn =3D ARM_SMMU_VTCR_RGN_WBWA;
> +	vtcr->orgn =3D ARM_SMMU_VTCR_RGN_WBWA;
> +
> +	BUILD_BUG_ON(PAGE_SIZE !=3D SZ_4K);
> +	vtcr->tg =3D ARM_SMMU_VTCR_TG0_4K;
> +
> +	switch (smmu->oas) {
> +	case 32:
> +		vtcr->ps =3D ARM_SMMU_VTCR_PS_32_BIT;
> +		break;
> +	case 36:
> +		vtcr->ps =3D ARM_SMMU_VTCR_PS_36_BIT;
> +		break;
> +	case 40:
> +		vtcr->ps =3D ARM_SMMU_VTCR_PS_40_BIT;
> +		break;
> +	case 42:
> +		vtcr->ps =3D ARM_SMMU_VTCR_PS_42_BIT;
> +		break;
> +	case 44:
> +		vtcr->ps =3D ARM_SMMU_VTCR_PS_44_BIT;
> +		break;
> +	case 48:
> +		vtcr->ps =3D ARM_SMMU_VTCR_PS_48_BIT;
> +		break;
> +	case 52:
> +		vtcr->ps =3D ARM_SMMU_VTCR_PS_52_BIT;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	vtcr->tsz =3D 64 - p2m_ipa_bits;
> +	vtcr->sl =3D 2 - P2M_ROOT_LEVEL;
> +
> +	arm_lpae_s2_cfg.vttbr  =3D page_to_maddr(smmu_domain->d->arch.p2m.root)=
;
> +
> 	vmid =3D arm_smmu_bitmap_alloc(smmu->vmid_map, smmu->vmid_bits);
> 	if (vmid < 0)
> 		return vmid;
> @@ -1589,6 +1889,11 @@ static int arm_smmu_domain_finalise_s2(struct arm_=
smmu_domain *smmu_domain,
> 			  FIELD_PREP(STRTAB_STE_2_VTCR_S2SH0, vtcr->sh) |
> 			  FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, vtcr->tg) |
> 			  FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, vtcr->ps);
> +
> +	printk(XENLOG_DEBUG
> +		   "SMMUv3: d%u: vmid 0x%x vtcr 0x%"PRIpaddr" p2maddr 0x%"PRIpaddr"\n"=
,
> +		   smmu_domain->d->domain_id, cfg->vmid, cfg->vtcr, cfg->vttbr);
> +
> 	return 0;
> }
>=20
> @@ -1650,6 +1955,7 @@ static void arm_smmu_install_ste_for_dev(struct arm=
_smmu_master *master)
> 	}
> }
>=20
> +#ifdef CONFIG_PCI_ATS
> static bool arm_smmu_ats_supported(struct arm_smmu_master *master)
> {
> 	struct device *dev =3D master->dev;
> @@ -1748,6 +2054,23 @@ static void arm_smmu_disable_pasid(struct arm_smmu=
_master *master)
>=20
> 	pci_disable_pasid(pdev);
> }
> +#else
> +static inline bool arm_smmu_ats_supported(struct arm_smmu_master *master=
)
> +{
> +	return false;
> +}
> +
> +static inline void arm_smmu_enable_ats(struct arm_smmu_master *master) {=
 }
> +
> +static inline void arm_smmu_disable_ats(struct arm_smmu_master *master) =
{ }
> +
> +static inline int arm_smmu_enable_pasid(struct arm_smmu_master *master)
> +{
> +	return 0;
> +}
> +
> +static inline void arm_smmu_disable_pasid(struct arm_smmu_master *master=
) { }
> +#endif /* CONFIG_PCI_ATS */
>=20
> static void arm_smmu_detach_dev(struct arm_smmu_master *master)
> {
> @@ -1830,8 +2153,10 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_=
device *smmu, u32 sid)
>=20
> 	return sid < limit;
> }
> +/* Forward declaration */
> +static struct arm_smmu_device *arm_smmu_get_by_dev(struct device *dev);
>=20
> -static struct iommu_device *arm_smmu_probe_device(struct device *dev)
> +static int arm_smmu_add_device(u8 devfn, struct device *dev)
> {
> 	int i, ret;
> 	struct arm_smmu_device *smmu;
> @@ -1839,14 +2164,15 @@ static struct iommu_device *arm_smmu_probe_device=
(struct device *dev)
> 	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>=20
> 	if (!fwspec)
> -		return ERR_PTR(-ENODEV);
> +		return -ENODEV;
>=20
> -	if (WARN_ON_ONCE(dev_iommu_priv_get(dev)))
> -		return ERR_PTR(-EBUSY);
> +	smmu =3D arm_smmu_get_by_dev(fwspec->iommu_dev);
> +	if (!smmu)
> +		return -ENODEV;
>=20
> -	master =3D kzalloc(sizeof(*master), GFP_KERNEL);
> +	master =3D xzalloc(struct arm_smmu_master);
> 	if (!master)
> -		return ERR_PTR(-ENOMEM);
> +		return -ENOMEM;
>=20
> 	master->dev =3D dev;
> 	master->smmu =3D smmu;
> @@ -1881,17 +2207,36 @@ static struct iommu_device *arm_smmu_probe_device=
(struct device *dev)
> 	 */
> 	arm_smmu_enable_pasid(master);
>=20
> -	return &smmu->iommu;
> +	return 0;
>=20
> err_free_master:
> -	kfree(master);
> +	xfree(master);
> 	dev_iommu_priv_set(dev, NULL);
> -	return ERR_PTR(ret);
> +	return ret;
> }
>=20
> -static int arm_smmu_of_xlate(struct device *dev, struct of_phandle_args =
*args)
> +static int arm_smmu_dt_xlate(struct device *dev,
> +				const struct dt_phandle_args *args)
> {
> -	return iommu_fwspec_add_ids(dev, args->args, 1);
> +	int ret;
> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> +
> +	ret =3D iommu_fwspec_add_ids(dev, args->args, 1);
> +	if (ret)
> +		return ret;
> +
> +	if (dt_device_is_protected(dev_to_dt(dev))) {
> +		dev_err(dev, "Already added to SMMUv3\n");
> +		return -EEXIST;
> +	}
> +
> +	/* Let Xen know that the master device is protected by an IOMMU. */
> +	dt_device_set_protected(dev_to_dt(dev));
> +
> +	dev_info(dev, "Added master device (SMMUv3 %s StreamIds %u)\n",
> +			dev_name(fwspec->iommu_dev), fwspec->num_ids);
> +
> +	return 0;
> }
>=20
> /* Probing and initialisation functions */
> @@ -1972,7 +2317,7 @@ static int arm_smmu_init_l1_strtab(struct arm_smmu_=
device *smmu)
> 	size_t size =3D sizeof(*cfg->l1_desc) * cfg->num_l1_ents;
> 	void *strtab =3D smmu->strtab_cfg.strtab;
>=20
> -	cfg->l1_desc =3D devm_kzalloc(smmu->dev, size, GFP_KERNEL);
> +	cfg->l1_desc =3D _xzalloc(size, sizeof(void *));
> 	if (!cfg->l1_desc) {
> 		dev_err(smmu->dev, "failed to allocate l1 stream table desc\n");
> 		return -ENOMEM;
> @@ -2118,6 +2463,7 @@ static int arm_smmu_update_gbpa(struct arm_smmu_dev=
ice *smmu, u32 set, u32 clr)
> 	return ret;
> }
>=20
> +#ifdef CONFIG_MSI
> static void arm_smmu_free_msis(void *data)
> {
> 	struct device *dev =3D data;
> @@ -2188,8 +2534,35 @@ static void arm_smmu_setup_msis(struct arm_smmu_de=
vice *smmu)
> 	/* Add callback to free MSIs on teardown */
> 	devm_add_action(dev, arm_smmu_free_msis, dev);
> }
> +#else
> +static inline void arm_smmu_setup_msis(struct arm_smmu_device *smmu) { }
> +#endif /* CONFIG_MSI */
>=20
> -static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
> +static void arm_smmu_free_irqs(struct arm_smmu_device *smmu)
> +{
> +	int irq;
> +
> +	irq =3D smmu->combined_irq;
> +	if (irq)
> +		release_irq(irq, smmu);
> +	else {
> +		irq =3D smmu->evtq.q.irq;
> +		if (irq)
> +			release_irq(irq, smmu);
> +
> +		irq =3D smmu->gerr_irq;
> +		if (irq)
> +			release_irq(irq, smmu);
> +
> +		if (smmu->features & ARM_SMMU_FEAT_PRI) {
> +			irq =3D smmu->priq.q.irq;
> +			if (irq)
> +				release_irq(irq, smmu);
> +		}
> +	}
> +}
> +
> +static int arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
> {
> 	int irq, ret;
>=20
> @@ -2198,22 +2571,24 @@ static void arm_smmu_setup_unique_irqs(struct arm=
_smmu_device *smmu)
> 	/* Request interrupt lines */
> 	irq =3D smmu->evtq.q.irq;
> 	if (irq) {
> -		ret =3D devm_request_threaded_irq(smmu->dev, irq, NULL,
> -						arm_smmu_evtq_thread,
> -						IRQF_ONESHOT,
> +		ret =3D request_irq(irq, 0, arm_smmu_evtq_irq_tasklet,
> 						"arm-smmu-v3-evtq", smmu);
> -		if (ret < 0)
> +		if (ret < 0) {
> 			dev_warn(smmu->dev, "failed to enable evtq irq\n");
> +			return ret;
> +		}
> 	} else {
> 		dev_warn(smmu->dev, "no evtq irq - events will not be reported!\n");
> 	}
>=20
> 	irq =3D smmu->gerr_irq;
> 	if (irq) {
> -		ret =3D devm_request_irq(smmu->dev, irq, arm_smmu_gerror_handler,
> -				       0, "arm-smmu-v3-gerror", smmu);
> -		if (ret < 0)
> +		ret =3D request_irq(irq, 0, arm_smmu_gerror_handler,
> +						"arm-smmu-v3-gerror", smmu);
> +		if (ret < 0) {
> 			dev_warn(smmu->dev, "failed to enable gerror irq\n");
> +			goto err_free_evtq_irq;
> +		}
> 	} else {
> 		dev_warn(smmu->dev, "no gerr irq - errors will not be reported!\n");
> 	}
> @@ -2221,18 +2596,30 @@ static void arm_smmu_setup_unique_irqs(struct arm=
_smmu_device *smmu)
> 	if (smmu->features & ARM_SMMU_FEAT_PRI) {
> 		irq =3D smmu->priq.q.irq;
> 		if (irq) {
> -			ret =3D devm_request_threaded_irq(smmu->dev, irq, NULL,
> -							arm_smmu_priq_thread,
> -							IRQF_ONESHOT,
> -							"arm-smmu-v3-priq",
> -							smmu);
> -			if (ret < 0)
> +			ret =3D request_irq(irq, 0, arm_smmu_priq_irq_tasklet,
> +							"arm-smmu-v3-priq", smmu);
> +			if (ret < 0) {
> 				dev_warn(smmu->dev,
> 					 "failed to enable priq irq\n");
> +				goto err_free_gerr_irq;
> +			}
> 		} else {
> 			dev_warn(smmu->dev, "no priq irq - PRI will be broken\n");
> 		}
> 	}
> +
> +	return 0;
> +
> +err_free_gerr_irq:
> +	irq =3D smmu->gerr_irq;
> +	if (irq)
> +		release_irq(irq, smmu);
> +err_free_evtq_irq:
> +	irq =3D smmu->evtq.q.irq;
> +	if (irq)
> +		release_irq(irq, smmu);
> +
> +	return ret;
> }
>=20
> static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
> @@ -2254,15 +2641,19 @@ static int arm_smmu_setup_irqs(struct arm_smmu_de=
vice *smmu)
> 		 * Cavium ThunderX2 implementation doesn't support unique irq
> 		 * lines. Use a single irq line for all the SMMUv3 interrupts.
> 		 */
> -		ret =3D devm_request_threaded_irq(smmu->dev, irq,
> -					arm_smmu_combined_irq_handler,
> -					arm_smmu_combined_irq_thread,
> -					IRQF_ONESHOT,
> -					"arm-smmu-v3-combined-irq", smmu);
> -		if (ret < 0)
> +		ret =3D request_irq(irq, 0, arm_smmu_combined_irq_handler,
> +						"arm-smmu-v3-combined-irq", smmu);
> +		if (ret < 0) {
> 			dev_warn(smmu->dev, "failed to enable combined irq\n");
> -	} else
> -		arm_smmu_setup_unique_irqs(smmu);
> +			return ret;
> +		}
> +	} else {
> +		ret =3D arm_smmu_setup_unique_irqs(smmu);
> +		if (ret) {
> +			dev_warn(smmu->dev, "failed to setup unique irqs\n");
> +			return ret;
> +		}
> +	}
>=20
> 	if (smmu->features & ARM_SMMU_FEAT_PRI)
> 		irqen_flags |=3D IRQ_CTRL_PRIQ_IRQEN;
> @@ -2270,10 +2661,16 @@ static int arm_smmu_setup_irqs(struct arm_smmu_de=
vice *smmu)
> 	/* Enable interrupt generation on the SMMU */
> 	ret =3D arm_smmu_write_reg_sync(smmu, irqen_flags,
> 				      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
> -	if (ret)
> +	if (ret) {
> 		dev_warn(smmu->dev, "failed to enable irqs\n");
> +		goto err_free_irqs;
> +	}
>=20
> 	return 0;
> +
> +err_free_irqs:
> +	arm_smmu_free_irqs(smmu);
> +	return ret;
> }
>=20
> static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
> @@ -2287,7 +2684,7 @@ static int arm_smmu_device_disable(struct arm_smmu_=
device *smmu)
> 	return ret;
> }
>=20
> -static int arm_smmu_device_reset(struct arm_smmu_device *smmu, bool bypa=
ss)
> +static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
> {
> 	int ret;
> 	u32 reg, enables;
> @@ -2297,7 +2694,7 @@ static int arm_smmu_device_reset(struct arm_smmu_de=
vice *smmu, bool bypass)
> 	reg =3D readl_relaxed(smmu->base + ARM_SMMU_CR0);
> 	if (reg & CR0_SMMUEN) {
> 		dev_warn(smmu->dev, "SMMU currently enabled! Resetting...\n");
> -		WARN_ON(is_kdump_kernel() && !disable_bypass);
> +		WARN_ON(!disable_bypass);
> 		arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
> 	}
>=20
> @@ -2401,25 +2798,32 @@ static int arm_smmu_device_reset(struct arm_smmu_=
device *smmu, bool bypass)
> 		return ret;
> 	}
>=20
> -	if (is_kdump_kernel())
> -		enables &=3D ~(CR0_EVTQEN | CR0_PRIQEN);
> +	/* Initialize tasklets for threaded IRQs*/
> +	tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
> +	tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
> +	tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_tasklet=
,
> +				 smmu);
>=20
> 	/* Enable the SMMU interface, or ensure bypass */
> -	if (!bypass || disable_bypass) {
> +	if (disable_bypass) {
> 		enables |=3D CR0_SMMUEN;
> 	} else {
> 		ret =3D arm_smmu_update_gbpa(smmu, 0, GBPA_ABORT);
> 		if (ret)
> -			return ret;
> +			goto err_free_irqs;
> 	}
> 	ret =3D arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
> 				      ARM_SMMU_CR0ACK);
> 	if (ret) {
> 		dev_err(smmu->dev, "failed to enable SMMU interface\n");
> -		return ret;
> +		goto err_free_irqs;
> 	}
>=20
> 	return 0;
> +
> +err_free_irqs:
> +	arm_smmu_free_irqs(smmu);
> +	return ret;
> }
>=20
> static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
> @@ -2470,8 +2874,10 @@ static int arm_smmu_device_hw_probe(struct arm_smm=
u_device *smmu)
> 	if (reg & IDR0_SEV)
> 		smmu->features |=3D ARM_SMMU_FEAT_SEV;
>=20
> +#ifdef CONFIG_MSI
> 	if (reg & IDR0_MSI)
> 		smmu->features |=3D ARM_SMMU_FEAT_MSI;
> +#endif
>=20
> 	if (reg & IDR0_HYP)
> 		smmu->features |=3D ARM_SMMU_FEAT_HYP;
> @@ -2496,7 +2902,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu=
_device *smmu)
> 		smmu->features |=3D ARM_SMMU_FEAT_TRANS_S2;
>=20
> 	if (!(reg & IDR0_S2P)) {
> -		dev_err(smmu->dev, "no translation support!\n");
> +		dev_err(smmu->dev, "no stage-2 translation support!\n");
> 		return -ENXIO;
> 	}
>=20
> @@ -2593,8 +2999,12 @@ static int arm_smmu_device_hw_probe(struct arm_smm=
u_device *smmu)
> 		smmu->oas =3D 48;
> 	}
>=20
> +	smmu->oas =3D min_t(unsigned long, PADDR_BITS, smmu->oas);
> 	smmu->ias =3D max(smmu->ias, smmu->oas);
>=20
> +	/* Xen: Set maximum Stage-2 input size supported by the SMMU. */
> +	p2m_restrict_ipa_bits(smmu->ias);
> +
> 	dev_info(smmu->dev, "ias %lu-bit, oas %lu-bit (features 0x%08x)\n",
> 		 smmu->ias, smmu->oas, smmu->features);
> 	return 0;
> @@ -2645,7 +3055,7 @@ static inline int arm_smmu_device_acpi_probe(struct=
 platform_device *pdev,
> static int arm_smmu_device_dt_probe(struct platform_device *pdev,
> 				    struct arm_smmu_device *smmu)
> {
> -	struct device *dev =3D &pdev->dev;
> +	struct device *dev =3D pdev;
> 	u32 cells;
> 	int ret =3D -EINVAL;
>=20
> @@ -2658,7 +3068,7 @@ static int arm_smmu_device_dt_probe(struct platform=
_device *pdev,
>=20
> 	parse_driver_options(smmu);
>=20
> -	if (of_dma_is_coherent(dev->of_node))
> +	if (dt_get_property(dev->of_node, "dma-coherent", NULL))
> 		smmu->features |=3D ARM_SMMU_FEAT_COHERENCY;
>=20
> 	return ret;
> @@ -2672,66 +3082,76 @@ static unsigned long arm_smmu_resource_size(struc=
t arm_smmu_device *smmu)
> 		return SZ_128K;
> }
>=20
> -static void __iomem *arm_smmu_ioremap(struct device *dev, resource_size_=
t start,
> -				      resource_size_t size)
> +
> +static void arm_smmu_free_structures(struct arm_smmu_device *smmu)
> {
> -	struct resource res =3D {
> -		.flags =3D IORESOURCE_MEM,
> -		.start =3D start,
> -		.end =3D start + size - 1,
> -	};
> +	if (smmu->cmdq.q.base)
> +		xfree(smmu->cmdq.q.base);
> +
> +	if (smmu->evtq.q.base)
> +		xfree(smmu->evtq.q.base);
>=20
> -	return devm_ioremap_resource(dev, &res);
> +	if (smmu->priq.q.base)
> +		xfree(smmu->priq.q.base);
> +
> +	if (smmu->strtab_cfg.strtab)
> +		xfree(smmu->strtab_cfg.strtab);
> +
> +	if (smmu->strtab_cfg.l1_desc)
> +		xfree(smmu->strtab_cfg.l1_desc);
> }
>=20
> static int arm_smmu_device_probe(struct platform_device *pdev)
> {
> 	int irq, ret;
> -	struct resource *res;
> -	resource_size_t ioaddr;
> +	paddr_t ioaddr, iosize;
> 	struct arm_smmu_device *smmu;
> -	struct device *dev =3D &pdev->dev;
> -	bool bypass;
>=20
> -	smmu =3D devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
> +	smmu =3D xzalloc(struct arm_smmu_device);
> 	if (!smmu) {
> -		dev_err(dev, "failed to allocate arm_smmu_device\n");
> +		dev_err(pdev, "failed to allocate arm_smmu_device\n");
> 		return -ENOMEM;
> 	}
> -	smmu->dev =3D dev;
> +	smmu->dev =3D pdev;
>=20
> -	if (dev->of_node) {
> +	if (pdev->of_node) {
> 		ret =3D arm_smmu_device_dt_probe(pdev, smmu);
> +		if (ret)
> +			goto out_free_smmu;
> 	} else {
> 		ret =3D arm_smmu_device_acpi_probe(pdev, smmu);
> 		if (ret =3D=3D -ENODEV)
> -			return ret;
> +			goto out_free_smmu;
> 	}
>=20
> -	/* Set bypass mode according to firmware probing result */
> -	bypass =3D !!ret;
> -
> 	/* Base address */
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (resource_size(res) < arm_smmu_resource_size(smmu)) {
> -		dev_err(dev, "MMIO region too small (%pr)\n", res);
> -		return -EINVAL;
> +	ret =3D dt_device_get_address(dev_to_dt(pdev), 0, &ioaddr, &iosize);
> +	if (ret)
> +		goto out_free_smmu;
> +
> +	if (iosize < arm_smmu_resource_size(smmu)) {
> +		dev_err(pdev, "MMIO region too small (%lx)\n", iosize);
> +		ret =3D -EINVAL;
> +		goto out_free_smmu;
> 	}
> -	ioaddr =3D res->start;
>=20
> 	/*
> 	 * Don't map the IMPLEMENTATION DEFINED regions, since they may contain
> -	 * the PMCG registers which are reserved by the PMU driver.
> +	 * the PMCG registers which are optional and currently not supported.
> 	 */
> -	smmu->base =3D arm_smmu_ioremap(dev, ioaddr, ARM_SMMU_REG_SZ);
> -	if (IS_ERR(smmu->base))
> -		return PTR_ERR(smmu->base);
> +	smmu->base =3D ioremap_nocache(ioaddr, ARM_SMMU_REG_SZ);
> +	if (IS_ERR(smmu->base)) {
> +		ret =3D PTR_ERR(smmu->base);
> +		goto out_free_smmu;
> +	}
>=20
> -	if (arm_smmu_resource_size(smmu) > SZ_64K) {
> -		smmu->page1 =3D arm_smmu_ioremap(dev, ioaddr + SZ_64K,
> +	if (iosize > SZ_64K) {
> +		smmu->page1 =3D ioremap_nocache(ioaddr + SZ_64K,
> 					       ARM_SMMU_REG_SZ);
> -		if (IS_ERR(smmu->page1))
> -			return PTR_ERR(smmu->page1);
> +		if (IS_ERR(smmu->page1)) {
> +			ret =3D PTR_ERR(smmu->page1);
> +			goto out_free;
> +		}
> 	} else {
> 		smmu->page1 =3D smmu->base;
> 	}
> @@ -2756,23 +3176,286 @@ static int arm_smmu_device_probe(struct platform=
_device *pdev)
> 	}
> 	/* Probe the h/w */
> 	ret =3D arm_smmu_device_hw_probe(smmu);
> -	if (ret)
> -		return ret;
> +	if (ret) {
> +		ret =3D -ENODEV;
> +		goto out_free;
> +	}
>=20
> 	/* Initialise in-memory data structures */
> 	ret =3D arm_smmu_init_structures(smmu);
> 	if (ret)
> -		return ret;
> +		goto out_free;
>=20
> 	/* Reset the device */
> -	ret =3D arm_smmu_device_reset(smmu, bypass);
> +	ret =3D arm_smmu_device_reset(smmu);
> 	if (ret)
> -		return ret;
> +		goto out_free;
> +
> +	/*
> +	 * Keep a list of all probed devices. This will be used to query
> +	 * the smmu devices based on the fwnode.
> +	 */
> +	INIT_LIST_HEAD(&smmu->devices);
> +
> +	spin_lock(&arm_smmu_devices_lock);
> +	list_add(&smmu->devices, &arm_smmu_devices);
> +	spin_unlock(&arm_smmu_devices_lock);
>=20
> 	return 0;
> +
> +
> +out_free:
> +	arm_smmu_free_structures(smmu);
> +	if (smmu->page1)
> +		iounmap(smmu->page1);
> +	if (smmu->base)
> +		iounmap(smmu->base);
> +
> +out_free_smmu:
> +	xfree(smmu);
> +
> +	return ret;
> }
>=20
> -static const struct of_device_id arm_smmu_of_match[] =3D {
> +static const struct dt_device_match arm_smmu_of_match[] =3D {
> 	{ .compatible =3D "arm,smmu-v3", },
> 	{ },
> };
> +
> +/* Start of Xen specific code. */
> +static int __must_check arm_smmu_iotlb_flush_all(struct domain *d)
> +{
> +	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
> +	struct iommu_domain *io_domain;
> +
> +	spin_lock(&xen_domain->lock);
> +
> +	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
> +		/*
> +		 * Only invalidate the context when SMMU is present.
> +		 * This is because the context initialization is delayed
> +		 * until a master has been added.
> +		 */
> +		if (unlikely(!ACCESS_ONCE(to_smmu_domain(io_domain)->smmu)))
> +			continue;
> +
> +		arm_smmu_tlb_inv_context(to_smmu_domain(io_domain));
> +	}
> +
> +	spin_unlock(&xen_domain->lock);
> +
> +	return 0;
> +}
> +
> +static int __must_check arm_smmu_iotlb_flush(struct domain *d, dfn_t dfn=
,
> +				unsigned long page_count, unsigned int flush_flags)
> +{
> +	return arm_smmu_iotlb_flush_all(d);
> +}
> +
> +static struct arm_smmu_device *arm_smmu_get_by_dev(struct device *dev)
> +{
> +	struct arm_smmu_device *smmu =3D NULL;
> +
> +	spin_lock(&arm_smmu_devices_lock);
> +
> +	list_for_each_entry(smmu, &arm_smmu_devices, devices) {
> +		if (smmu->dev  =3D=3D dev) {
> +			spin_unlock(&arm_smmu_devices_lock);
> +			return smmu;
> +		}
> +	}
> +
> +	spin_unlock(&arm_smmu_devices_lock);
> +
> +	return NULL;
> +}
> +
> +static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
> +				struct device *dev)
> +{
> +	struct iommu_domain *io_domain;
> +	struct arm_smmu_domain *smmu_domain;
> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> +	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
> +	struct arm_smmu_device *smmu =3D arm_smmu_get_by_dev(fwspec->iommu_dev)=
;
> +
> +	if (!smmu)
> +		return NULL;
> +
> +	/*
> +	 * Loop through the &xen_domain->contexts to locate a context
> +	 * assigned to this SMMU
> +	 */
> +	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
> +		smmu_domain =3D to_smmu_domain(io_domain);
> +		if (smmu_domain->smmu =3D=3D smmu)
> +			return io_domain;
> +	}
> +	return NULL;
> +}
> +
> +static void arm_smmu_destroy_iommu_domain(struct iommu_domain *io_domain=
)
> +{
> +	list_del(&io_domain->list);
> +	arm_smmu_domain_free(io_domain);
> +}
> +
> +static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
> +		struct device *dev, u32 flag)
> +{
> +	int ret =3D 0;
> +	struct iommu_domain *io_domain;
> +	struct arm_smmu_domain *smmu_domain;
> +	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
> +
> +	spin_lock(&xen_domain->lock);
> +
> +	/*
> +	 * Check to see if an iommu_domain already exists for this xen domain
> +	 * under the same SMMU
> +	 */
> +	io_domain =3D arm_smmu_get_domain(d, dev);
> +	if (!io_domain) {
> +		io_domain =3D arm_smmu_domain_alloc();
> +		if (!io_domain) {
> +			ret =3D -ENOMEM;
> +			goto out;
> +		}
> +		smmu_domain =3D to_smmu_domain(io_domain);
> +		smmu_domain->d =3D d;
> +
> +		/* Chain the new context to the domain */
> +		list_add(&io_domain->list, &xen_domain->contexts);
> +	}
> +
> +	ret =3D arm_smmu_attach_dev(io_domain, dev);
> +	if (ret) {
> +		if (io_domain->ref.counter =3D=3D 0)
> +			arm_smmu_destroy_iommu_domain(io_domain);
> +	} else {
> +		atomic_inc(&io_domain->ref);
> +	}
> +
> +out:
> +	spin_unlock(&xen_domain->lock);
> +	return ret;
> +}
> +
> +static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
> +{
> +	struct iommu_domain *io_domain =3D arm_smmu_get_domain(d, dev);
> +	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
> +	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(io_domain);
> +	struct arm_smmu_master *master =3D dev_iommu_priv_get(dev);
> +
> +	if (!smmu_domain || smmu_domain->d !=3D d) {
> +		dev_err(dev, " not attached to domain %d\n", d->domain_id);
> +		return -ESRCH;
> +	}
> +
> +	spin_lock(&xen_domain->lock);
> +
> +	arm_smmu_detach_dev(master);
> +	atomic_dec(&io_domain->ref);
> +
> +	if (io_domain->ref.counter =3D=3D 0)
> +		arm_smmu_destroy_iommu_domain(io_domain);
> +
> +	spin_unlock(&xen_domain->lock);
> +
> +	return 0;
> +}
> +
> +static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
> +				u8 devfn,  struct device *dev)
> +{
> +	int ret =3D 0;
> +
> +	/* Don't allow remapping on other domain than hwdom */
> +	if (t && t !=3D hardware_domain)
> +		return -EPERM;
> +
> +	if (t =3D=3D s)
> +		return 0;
> +
> +	ret =3D arm_smmu_deassign_dev(s, dev);
> +	if (ret)
> +		return ret;
> +
> +	if (t) {
> +		/* No flags are defined for ARM. */
> +		ret =3D arm_smmu_assign_dev(t, devfn, dev, 0);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int arm_smmu_iommu_xen_domain_init(struct domain *d)
> +{
> +	struct arm_smmu_xen_domain *xen_domain;
> +
> +	xen_domain =3D xzalloc(struct arm_smmu_xen_domain);
> +	if (!xen_domain)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&xen_domain->lock);
> +	INIT_LIST_HEAD(&xen_domain->contexts);
> +
> +	dom_iommu(d)->arch.priv =3D xen_domain;
> +	return 0;
> +
> +}
> +
> +static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
> +{
> +}
> +
> +static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
> +{
> +	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
> +
> +	ASSERT(list_empty(&xen_domain->contexts));
> +	xfree(xen_domain);
> +}
> +
> +static const struct iommu_ops arm_smmu_iommu_ops =3D {
> +	.init		=3D arm_smmu_iommu_xen_domain_init,
> +	.hwdom_init		=3D arm_smmu_iommu_hwdom_init,
> +	.teardown		=3D arm_smmu_iommu_xen_domain_teardown,
> +	.iotlb_flush		=3D arm_smmu_iotlb_flush,
> +	.iotlb_flush_all	=3D arm_smmu_iotlb_flush_all,
> +	.assign_device		=3D arm_smmu_assign_dev,
> +	.reassign_device	=3D arm_smmu_reassign_dev,
> +	.map_page		=3D arm_iommu_map_page,
> +	.unmap_page		=3D arm_iommu_unmap_page,
> +	.dt_xlate		=3D arm_smmu_dt_xlate,
> +	.add_device		=3D arm_smmu_add_device,
> +};
> +
> +static __init int arm_smmu_dt_init(struct dt_device_node *dev,
> +				const void *data)
> +{
> +	int rc;
> +
> +	/*
> +	 * Even if the device can't be initialized, we don't want to
> +	 * give the SMMU device to dom0.
> +	 */
> +	dt_device_set_used_by(dev, DOMID_XEN);
> +
> +	rc =3D arm_smmu_device_probe(dt_to_dev(dev));
> +	if (rc)
> +		return rc;
> +
> +	iommu_set_ops(&arm_smmu_iommu_ops);
> +
> +	return 0;
> +}
> +
> +DT_DEVICE_START(smmuv3, "ARM SMMU V3", DEVICE_IOMMU)
> +.dt_match =3D arm_smmu_of_match,
> +.init =3D arm_smmu_dt_init,
> +DT_DEVICE_END
> --=20
> 2.17.1
>=20


