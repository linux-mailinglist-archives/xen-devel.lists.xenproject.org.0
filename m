Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 439A036F67C
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 09:43:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120344.227606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcNnt-0005Dh-Eb; Fri, 30 Apr 2021 07:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120344.227606; Fri, 30 Apr 2021 07:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcNnt-0005DI-Au; Fri, 30 Apr 2021 07:43:13 +0000
Received: by outflank-mailman (input) for mailman id 120344;
 Fri, 30 Apr 2021 07:43:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VJvX=J3=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lcNnr-0005DC-Ae
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 07:43:11 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0a::631])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd6291ba-d7dc-4631-bd81-9af97993de19;
 Fri, 30 Apr 2021 07:43:08 +0000 (UTC)
Received: from DB6PR0201CA0018.eurprd02.prod.outlook.com (2603:10a6:4:3f::28)
 by AM8PR08MB5730.eurprd08.prod.outlook.com (2603:10a6:20b:1d5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Fri, 30 Apr
 2021 07:43:06 +0000
Received: from DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::86) by DB6PR0201CA0018.outlook.office365.com
 (2603:10a6:4:3f::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Fri, 30 Apr 2021 07:43:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT009.mail.protection.outlook.com (10.152.20.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Fri, 30 Apr 2021 07:43:05 +0000
Received: ("Tessian outbound 52fcc5bd9d3a:v91");
 Fri, 30 Apr 2021 07:43:05 +0000
Received: from 6618c25f8f31.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E677951B-5D0B-4ADC-A743-C8575827B340.1; 
 Fri, 30 Apr 2021 07:42:59 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6618c25f8f31.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Apr 2021 07:42:59 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB3086.eurprd08.prod.outlook.com (2603:10a6:803:46::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Fri, 30 Apr
 2021 07:42:56 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::4502:9762:8b3b:63d9%4]) with mapi id 15.20.4065.028; Fri, 30 Apr 2021
 07:42:56 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO4P123CA0501.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1ab::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Fri, 30 Apr 2021 07:42:56 +0000
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
X-Inumbo-ID: dd6291ba-d7dc-4631-bd81-9af97993de19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8mWuvGkwapgAk0R2YH82Gc/Yo4jqu8ktC4qkn3vmlA=;
 b=aSh8oQWyQS+3YBLqD67OdbbiV3ur3YppkPQTX1NnFQ5mJGn/xJYi8vo1TEbjh1jKB9bkb+qdzkDDr40FUw4gILkTETEBJmR34zSa/YCESD14COOlLQV2TkXA5w040XcyYc9Xjy6qqGKduAdUi8cG3nNz8LyAtUmMRUpZPOzY60Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: cddd7a2ed2441990
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMc1I63wrYhhkRONafGUNdawFkdpm5d3yvzLiF7dCkJEwbhPy8BqS7ZkZns9uWZnmMbkjkUtR/bkxo8HsPMLO4xLXiKeJpJehbbVwQG5Gte6r5BMgHhZlsWhrzbYO5+rio5qs0cOF2iM7+PcfWoG1low3yPihPtQQEGJ3K/J+Z+oc6FG6lXf3agXeZZ/Gmz4kpOTpIkhQSwuj3J7GuGBRhS/vI79Oq0nK9qYmXTHnZA/rkiMksu2whlSNQrHPdUEWy+4tDaCIesjhnpKJrNSO/sFwezxvEuf4/VDNSwpOcWIV9jBzOhNhieBeKLul44e/cQiYUvbL09v00eWC27qRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8mWuvGkwapgAk0R2YH82Gc/Yo4jqu8ktC4qkn3vmlA=;
 b=bT2ubH6Xf8F0HsBlGxLKPKD3dQR1bDwNy2170SaQnyG/2PAVXjA4pLUmu/v8ZTEPl7GFLzMgs13xnTV/si4NgW2eOpPj5L43DXOdMfyZNpRrpqZL8jKO8uxm0BiXiVUviSvGpGnYOnwH2F78Bw+OP4ZgO8IyteEqW0B5gkP1PEAeMEbNsaN1VfiABtMurompwVZJDMW3x5/4+1Ri/HuYeE7Yl1Gtaad73y7SOxNpyrpb2UB+sv0+yrYX/UTc8JFs9njUzwYxftDXHJQ+WP2KoIw11fTTZPtPggnZBr91umyYcadMdb0a8Vj8x8lsT0emThJuV8+QNw0ROGpSXjyjpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8mWuvGkwapgAk0R2YH82Gc/Yo4jqu8ktC4qkn3vmlA=;
 b=aSh8oQWyQS+3YBLqD67OdbbiV3ur3YppkPQTX1NnFQ5mJGn/xJYi8vo1TEbjh1jKB9bkb+qdzkDDr40FUw4gILkTETEBJmR34zSa/YCESD14COOlLQV2TkXA5w040XcyYc9Xjy6qqGKduAdUi8cG3nNz8LyAtUmMRUpZPOzY60Y=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH] public/gnttab: relax v2 recommendation
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <dcd9ede1-9471-6866-4ba7-b6a7664b5e35@suse.com>
Date: Fri, 30 Apr 2021 08:42:49 +0100
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5AE0C026-A231-473A-B5E7-2D8B1E8E1B45@arm.com>
References: <dcd9ede1-9471-6866-4ba7-b6a7664b5e35@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0501.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::20) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf8a7013-1db2-4970-0ce2-08d90bab9789
X-MS-TrafficTypeDiagnostic: VI1PR08MB3086:|AM8PR08MB5730:
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB5730734E551B77571F70CDDEE45E9@AM8PR08MB5730.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qhs4sSLcZwkGNM6GjMEYRuM1S/ugJ1ARDMdf4P4iKBo87UHZavjFecPn5AfgHN0RQxl9mmZtQLMIdIG7Rvq+Xqpw8mLTkRao2xeBpgnNubut4iInE7Yyj2Upc2/OFuVT6O7WH3xQYe+TTCd+SftP1oqwLzHEolzUH/e9B2Sj0xgqLkR6GtTtys/k1eGu9fuLsvrmryvRafhRh4pbvWg9GP0w27cJJeH4c+W4jYVAXweQXqGPm4m1PV10es529v0UcCkIkUw5MkMNfrZIvc4fFhcOIjIyKQLzC78KL+79aqAPBpD6x2tBkH6aL6NUGBdy7iZsKykvBM/Ae1497mstXpHDfq257NG54+pl1ghyI4SHs5rbMtPR+WDggZ56fXdXVFLquICtmxRwQnMhbjZtX5rJ1mwQgesxv7s/9vPhiL9d+VRH2f8VlK+eiwN3w3FOqTJJQ98vX7SOXuZKbN/T3Ozrc3r3SwEpOuisS9ltBciIG+7STRTu/lMeLPoXVaryGG4/bwa5hakGUAmv95kntNl6ZTuQiGMIE7J/ipvtStcGBtR2oyzwiP6IrMScOAizYkA6VD2GECqC7YZeYqBQYqjUEXnPjnW+Sb/LyuOL8O8ce/H+IxtO1oXw/KiJOuA3hswJn9nZH6lg/A+bmXmvJ19ezHryahb6bSFYWfWUadnaiDJ0lgyYjJq2z4EwRHOD
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(366004)(346002)(376002)(8936002)(52116002)(2906002)(186003)(86362001)(53546011)(16526019)(2616005)(956004)(8676002)(66556008)(7696005)(66946007)(6916009)(66476007)(33656002)(4744005)(6486002)(478600001)(38100700002)(316002)(38350700002)(36756003)(83380400001)(26005)(5660300002)(44832011)(4326008)(54906003)(6666004)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?us-ascii?Q?++fIY4dvPxAje5QSgIwoHZO0MWizjhayMCB6QXx8Ze1Yj3PLjHcq2IgfY6JE?=
 =?us-ascii?Q?Vnyw6nZKcBqsry+dFGI1M/5jnKLxdGP1LACF2VYxNk2ClelUPYZ1p4y6Ro6I?=
 =?us-ascii?Q?S4NvU0DF/Fh1lUm4GisR9Dkerch4IFPgV7nldMWhsph9RUpF35DGVrTeWVtq?=
 =?us-ascii?Q?MUwQdsgzd6dSa4MUehRGqrzg3nDPMew4qTQovyZCXqUD+C5tRjkLArebm0Lb?=
 =?us-ascii?Q?C7b6dV66lcgct/bEXwhpKhnU1WBxfFWrB4I+V9cZ5CmrtkWfHs4aKRPdi6Ze?=
 =?us-ascii?Q?aIdqRy7ngJrwKYc1trb0sccu1CQByqG1nDrtRcol4JOdK/+3jwK0WZBuYJb2?=
 =?us-ascii?Q?4mp4k0x0b/Kkaix90yk09ffVNTClurdc1KLJQgFxuaBtEVHJ5PO1KlCMzv1d?=
 =?us-ascii?Q?z4y4b7/a6WLABD1hhl/insKSvs0+UA8zrLv3X7srKqgoAaADJMu8M/KUTO6C?=
 =?us-ascii?Q?26uf2XVALCQL365p+XG5T6n7ywz0NX+Dje0aTQJ/jhXxtuJJ2MpCKeAV29WW?=
 =?us-ascii?Q?OhX4b+Objsp0RWBUlyRR0DlHQ6BOfALuzW1qX65rUFSSGPVegj8ZmC2UYx4o?=
 =?us-ascii?Q?UdfuK1C5OmbPzUQzUdMWRnkGJmWSwdHJfRN4j9Hn+IB4AHiQXKCcgPjIs4H3?=
 =?us-ascii?Q?YVmSCiLx8EELf7g6J10KdjMAEWvUk98aUu8pzA101EASoQy2bIECoWcgQNu3?=
 =?us-ascii?Q?mpoOOHCg+/sIiI30Sjn6/hdsmbSdWrCZ6zlU6/yaGB/AU8xsd9QK9HdisaKt?=
 =?us-ascii?Q?36LNcq6hUXWfs1+w2aqwTf5VwosPdtewy3byW5R6XtIQ79BFcVj7m4bsRL0Y?=
 =?us-ascii?Q?bg5PclYsK0K3eaOl7DI1IEJK24TeQHOkeHGTFfxCTplUeYIyn6iPnhu/hNt2?=
 =?us-ascii?Q?UdtQefucG9Tm2BhsY4Q0VOOZ4XSFYpw/+YghAPxuPpvKZM0L+t19XW8NOGyb?=
 =?us-ascii?Q?bj2h73gP7ocdP+uhkVDkVPGCoWe/R3L1J8tnAPO78MdzjWpOZ4Enwr0xy/Gt?=
 =?us-ascii?Q?NBpcNfmaZ090OFJPBgZdV9vdBrdoH2+UaE91YUOE8f8PmFh1a5Ui7Pw9WVD/?=
 =?us-ascii?Q?RbCAkTq4CsKDckvkb+kMpZxPun4NdeuVQb+NP++R895vDlvlymZ0CEj4SJX/?=
 =?us-ascii?Q?nRp/XgBMK9VMFlD/KwxcHe7Xu7vR6EEB1vlcNN8GqZo6Af2EvTopgBuC45yV?=
 =?us-ascii?Q?gkfovj+2egkvf+NbUTBQn9L04lqt61RdefLivdVC1Nw3VxRM9E3ve16vnprd?=
 =?us-ascii?Q?Q6vrwIqqeNSVxY4EO+TFDmZBmtBNuxHoFRVAyS3L2GknLwU9g5bk3LLDnvjJ?=
 =?us-ascii?Q?Tt60vly76KkJWdcrnVvrq5MC?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3086
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	451a255e-bead-4b70-b19d-08d90bab91f4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BB7sOrJZ5fMxyo+yLSI2usRS27/2G65iSjXFSCZKa/kUh+nE9mK6Lgc/gKr/jk+Cq7sMnEOKufeKYSyEl7BFoCOxzmNLQvH9aoOwAKjlQ2kh4iEKYwsSSYogGJLAfxl5aKbHqyjYiLerAhPvH6y9u0egTnMOFFyo8XvAzdgbyYNIZwci5RbwKxHWtZQToUWuaXrnq3YAb7yH/9fgfnFh4ZZ40mOBE9h40s3tVbVbgJ9eAUO/p8Yf/4AOKlfU0B+0YqFS597eavnXOG/N3j7+hE98KXjJGwKy8v+ASsNvT5/o2D/+RW+OoU+1e8qfw49Y4T2B7b1XiSr5MhQMnu/kuaiC6SptIv7Jiy8Ow+dqrwCKndWrKjkdmwXHxxJHwZG9qdiNnlnpD4lwQ4ZbMayucbXULjYKfNUwgQ56ofuOjh4mHgbyXagvnc3n8CzdSsCEMvJ74kgxS/yDcBAlsi1ozWdG+meb1ty9Hjl03E35ubujdVLkqh5/MbsvLTqSuGa+WR7oZvK0Nad6PWWKbqtNoF/Gp7Vc3+pwldh0EJCSQ7dhUYFcO93TmfRZu6jR0yoGJtsePSdyQACBF+jUzLjhaKxbcXO84Gttac/IKGP/6e3Iqd7szJQbQwtWM4i0Nv4Q/q/uo6vrwyACFnOI6ZNaQwDLhdeTL43MYwnsl0Uwoibw09L/VUkrFR8ehqsfSZNJ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(396003)(136003)(46966006)(36840700001)(4744005)(82310400003)(2906002)(6862004)(5660300002)(6666004)(478600001)(36860700001)(44832011)(54906003)(70586007)(81166007)(316002)(36756003)(26005)(83380400001)(47076005)(34020700004)(356005)(53546011)(186003)(6486002)(956004)(7696005)(33656002)(86362001)(8936002)(82740400003)(70206006)(2616005)(8676002)(4326008)(16526019)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 07:43:05.9220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8a7013-1db2-4970-0ce2-08d90bab9789
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5730



> On 29 Apr 2021, at 14:10, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> With there being a way to disable v2 support, telling new guests to use
> v2 exclusively is not a good suggestion.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> --- a/xen/include/public/grant_table.h
> +++ b/xen/include/public/grant_table.h
> @@ -121,8 +121,10 @@ typedef uint32_t grant_ref_t;
>  */
>=20
> /*
> - * Version 1 of the grant table entry structure is maintained purely
> - * for backwards compatibility.  New guests should use version 2.
> + * Version 1 of the grant table entry structure is maintained largely fo=
r
> + * backwards compatibility.  New guests are recommended to support using
> + * version 2 to overcome version 1 limitations, but to be able to fall b=
ack
> + * to version 1.
>  */
> #if __XEN_INTERFACE_VERSION__ < 0x0003020a
> #define grant_entry_v1 grant_entry
>=20

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


