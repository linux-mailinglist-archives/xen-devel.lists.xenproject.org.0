Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2325845970
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 14:58:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674453.1049369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVXZi-0004nB-OD; Thu, 01 Feb 2024 13:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674453.1049369; Thu, 01 Feb 2024 13:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVXZi-0004kb-Kt; Thu, 01 Feb 2024 13:57:54 +0000
Received: by outflank-mailman (input) for mailman id 674453;
 Thu, 01 Feb 2024 13:57:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ae5+=JK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rVXZg-0004kP-Lv
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 13:57:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2612::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3791333-c109-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 14:57:51 +0100 (CET)
Received: from AS4P191CA0024.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::18)
 by DU0PR08MB8114.eurprd08.prod.outlook.com (2603:10a6:10:3ea::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Thu, 1 Feb
 2024 13:57:42 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::7b) by AS4P191CA0024.outlook.office365.com
 (2603:10a6:20b:5d9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.26 via Frontend
 Transport; Thu, 1 Feb 2024 13:57:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Thu, 1 Feb 2024 13:57:42 +0000
Received: ("Tessian outbound 67699c3f02bc:v228");
 Thu, 01 Feb 2024 13:57:41 +0000
Received: from 70e782ea9825.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8C0B5C65-24A4-470F-8E58-CFC52442F710.1; 
 Thu, 01 Feb 2024 13:57:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 70e782ea9825.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Feb 2024 13:57:35 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AM8PR08MB6436.eurprd08.prod.outlook.com (2603:10a6:20b:365::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Thu, 1 Feb
 2024 13:57:32 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::2257:5fcb:b449:fff0]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::2257:5fcb:b449:fff0%7]) with mapi id 15.20.7228.029; Thu, 1 Feb 2024
 13:57:31 +0000
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
X-Inumbo-ID: e3791333-c109-11ee-8a43-1f161083a0e0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RebIadRljAgFs028uav5E26E4uUm1S5wG3Rqm5TwYCX1y3MZjhIrLu/nQFWLkN2A6zmHagK5h17lH2nIIXBFpKVqFHMGy/WyW13xabJWoKg4cg7DCstAMWl9UCFeVKYyCce8SaqPoQ1nAZQZAP3le0Sq+EX4puccLR+aHTaB9v1l50Sec4bWOw7dDhkAmg4ZCBXNacppCdO0JzPm0TqUY6X5KWT4ix1E/u9HBkYU/qbhWY8hZ+6EgrtkysJoyavMFH/5DAhAz86Dylw2T+9Rh4Qg7Mu6WqczVMnl5ZQiqc287Rs7dTioPZkQ8i5qiqrlhg++Q23GSCqz85nS4KQxVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPdfunecO54m0x8EuWLfnmbInPCoKzwASsxqOyKq7ZI=;
 b=XwE9IqFSuKf7gmRZMUv74pKtVMLmlcsbtL7Dci8Ce755cCINvl0cNu5Wmu39wUdSFBvKCNbNGa9QjwdHQPxh2GawmYZbIMSqr4aFf1DfwZquNzG0+wOgxEoAHnwvtizehKUsAR4FfddaLsxDU24mRaxn/H+zdL7tfVoUep43mnPhotwnbAKkCgc8NjeRVla02/iCN59Q+LVczULVdErNdXM5jDxQEBD3NnKQvyWUjszJ9p6T3CBzhDpS17bnuAAgKf+Z4f5K/KafttFdmhttUI+jKPGF7dkfUFYtAKUciqHpGCoR76bOVgIJw25c/RsyQel74f9cTR7IznOGTGDwVg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPdfunecO54m0x8EuWLfnmbInPCoKzwASsxqOyKq7ZI=;
 b=UHxWHfO2T3NRY34cQPcWSeMshqjkm+/GJ9rzvgXKmJzZj6vIFxtGvnFa6AciiiGos+pSL1N2u/2+H6XAsX2zdRfEtzAr23iO5J65AXgyPgjqb1AKESTh4ap38AL+tHdiZ3Y+XbP4aT/nY0SMXyuWfXFV3H/yPP1P0CZj8g8b2bQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6c0886f16c02cd39
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5i957EnDgbHQNi6S7QRufRbugdrh0UnaMBiiyOsj4TdpPKpPZAsqMSRnQ6f6gMzF/C+8BWcLFaI0HD4upfqJq4GAf9W9/nH5kE3i+7bllXFaIxorKl9eQe9SfeT6Zxsz54LgxoPCSpye/095LIn+rPYgeYD8QtTeUHa2qzi5Uc3g07+nKUMONuj2RavuMR/z1NlMPAoz8twr2Y0iQtTc5bS7+qVeQW6M0wzqZpYmZnNRM2ftJaT5+gpm6gCfUhK4/CdZUEcmePIIGaWQq7o28Wmez9T+r7qaMgJx787+A/zvh//n1ahU2NrEPtzPWxKwMCUdMk47/PPwmy45kRsKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPdfunecO54m0x8EuWLfnmbInPCoKzwASsxqOyKq7ZI=;
 b=YsWkx8amtRh6FupGKgyFvPxgzXwhuuuYKSvzV5s0LfARF87+cvDq/ppCZs+5TiHG71CuMe2SlGEAykkV+AOenfkaZIHl0ldllWBEldzMLRz/DYbd/NAMxxggh4oxRw2h2B90Cym2flZHu/XuelIordQ+NWpAr68BM3KXrIvlrvXSaEJU6h8ZJuYcrtVSA3bU/OGa+LEE8no90lIWsHZ6BDtFcboBbZjSYj1/BizR9jeos1enH91Be3OA2brM7SwfpCelmp67tB4seZqB/SPxJZdiP1PrTj9FyPmsRoa3rKBtTucIkdGyMFfiyW8qrOM5syprTm7pxfq7V1jokEM4Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPdfunecO54m0x8EuWLfnmbInPCoKzwASsxqOyKq7ZI=;
 b=UHxWHfO2T3NRY34cQPcWSeMshqjkm+/GJ9rzvgXKmJzZj6vIFxtGvnFa6AciiiGos+pSL1N2u/2+H6XAsX2zdRfEtzAr23iO5J65AXgyPgjqb1AKESTh4ap38AL+tHdiZ3Y+XbP4aT/nY0SMXyuWfXFV3H/yPP1P0CZj8g8b2bQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v3] xen/arm: ffa: reclaim shared memory on guest
 destroy
Thread-Topic: [XEN PATCH v3] xen/arm: ffa: reclaim shared memory on guest
 destroy
Thread-Index: AQHaSTVKNVT0ywRTlE22Kr4Xf5r90LD1mryA
Date: Thu, 1 Feb 2024 13:57:31 +0000
Message-ID: <6980D75D-544A-4A3B-906B-DC27D68A260B@arm.com>
References: <20240117110618.2183977-1-jens.wiklander@linaro.org>
In-Reply-To: <20240117110618.2183977-1-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AM8PR08MB6436:EE_|AM3PEPF00009B9B:EE_|DU0PR08MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: f02cef81-20ea-4208-e491-08dc232dc25e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Tgv5bWFUrsH84yBUGu4f4tGmbiwJmFkjgxQq7njGjtmIlJRJ5i0PGcZilKgqzZ08BcNdQDCF5m3IO04tWjM3042TZKQd6gwpFFyuiDJlO5/hRJV2aEYix2v6qmIbEkwJtbXOJwZOL7S55RxWmeVepNeCv8GiSSz7FDcLFYBSN4mm6Qq2zNTL4JNm6SpgAJCBCtHHVkeVzjevnnPCN1lx8eC4ZSMvCSBvvdhFR0b36883wZBWIZeCmcdYUG2t3I9IjaJKfIe7lfVbvcDhxumlFURguZQhpT8G6Pq9Eid/d+EehAqIAdl30mZCm0eMChlsO2iOqgMgm6InopjAAlgRPLWuiTaxqg8FFA/AdJgE2tISaEJ7Mga1MAdugEuiT1vj33AF/L84Pw6AIjb0dMV81yLhEZ0S6NSII5aqU9NtLqcsW838MS6HPNK1LMArGpCOnDYlpkc5sNiA6qg2J4i3WjFqHrK+tDUwWJStLg7udeY76XWk5fjyJVSS40BKaYhUJXgp8RWPU04FwQxptchCLll+d+E2r47tKBmLgy9l+2csM4ve2LPNbiCtpo5XFi977vCAC9j0gRHBy3XnggZUFvzZQdbu9G3PFxrIr73Gn6BpXUYKjXPWuqQpn4dAifB5MZjs5mnVATPB40aG8cn/bA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(366004)(39860400002)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(41300700001)(2616005)(83380400001)(36756003)(6506007)(53546011)(38070700009)(478600001)(71200400001)(122000001)(6512007)(38100700002)(6486002)(54906003)(30864003)(2906002)(66556008)(8936002)(76116006)(66476007)(66446008)(6916009)(316002)(64756008)(86362001)(66946007)(5660300002)(4326008)(33656002)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ABB3DC4E3B824841A0F4843DC1BD1EBE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6436
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	acc22d59-8db2-4f11-f3f5-08dc232dbc43
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5evtEcsVpog9Rq/wRscMIJeqUydbn4MHjr9z5gMRKfxtosFgfckWt07as6Vk4oYHgzgyPrbpilb8KXy0Aqp9LA6LYPre8WIgBo7y/nARKijvQuD+/o88hX2L/yU0bnMFKPbLRuucZ1Hv9OBOIvT6zR4d2RpJhFwv/G9c0RdLC0ZCGLc1YQULvmmqOqsNRxFpfwY7ka21ByVR/FSjnYLqNXfH6dN2VDh4ULbICFa1ixQ65DEhFG0zBEGuGpCrHruzjRF4+7P0bPpv/yFRGtFpeKOILj1vdbF3kiXZMNsM3b2vUZcPzmA11htAfuWYv/uPYl/+3TYgayMOLU4mqUc3GYxxZns6vYUUZzTb/KlZYoXNN4dV+QGvz6tIpng3tdAsMOlmtYTeUr702OXVjO9gpd76mRDwTmC651x0ORLsWL1i55by3qyBtX83RR1tMCH75BwXXFUUU8w7eG54A/jxxYcp1WgQ22htV+FknPhidHjnzT4TEsUSVB6C2wx6boILTNUFmEgljkfY8T0OwS17Jk3Q1i/dfZzxP8wC5f3DoKC34QfBGtGtF8QWFJrJuhJ8ud9GwyJBD1JSLA+N7XpFp9EUi2E9Y5vLqifEVKrDtsbsesHkik7Z5WMDyjq9cxcYZAmfYBdDyMa2n9B0gqIurClO3PWWJ6/Aza+YzGiMREk6Os5IHKed1C/E0J97puYlS3J6ckji2dhKs53WN8uuRyuM4EzTwYTWm1LhTkElnmP9BhtBHPF8q6+jUiZTmDqL
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(346002)(136003)(230922051799003)(186009)(1800799012)(451199024)(82310400011)(64100799003)(46966006)(40470700004)(36840700001)(83380400001)(41300700001)(47076005)(6512007)(107886003)(6506007)(336012)(2616005)(8676002)(26005)(356005)(36860700001)(4326008)(81166007)(82740400003)(5660300002)(8936002)(478600001)(54906003)(30864003)(53546011)(2906002)(70586007)(6486002)(70206006)(316002)(6862004)(33656002)(36756003)(86362001)(40460700003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 13:57:42.0642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f02cef81-20ea-4208-e491-08dc232dc25e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8114

Hi Jens,

> On 17 Jan 2024, at 12:06, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> When an FF-A enabled guest is destroyed it may leave behind memory
> shared with SPs. This memory must be reclaimed before it's reused or an
> SP may make changes to memory used by a new unrelated guest. So when the
> domain is teared down add FF-A requests to reclaim all remaining shared
> memory.
>=20
> SPs in the secure world are notified using VM_DESTROYED that a guest has
> been destroyed. An SP is supposed to relinquish all shared memory to allo=
w
> reclaiming the memory. The relinquish operation may need to be delayed if
> the shared memory is for instance part of a DMA operation.
>=20
> The domain reference counter is increased when the first FF-A shared
> memory is registered and the counter is decreased again when the last
> shared memory is reclaimed. If FF-A shared memory registrations remain
> at the end of of ffa_domain_teardown() a timer is set to try to reclaim
> the shared memory every second until the memory is reclaimed.
>=20
> A few minor style fixes with a removed empty line here and an added new
> line there.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>=20
> v3:
> - Mentioning in the commit message that there are some style fixes
> - Addressing review comments
> - Refactor the ffa_domain_teardown() path to let
>  ffa_domain_teardown_continue() do most of the work.
>=20
> v2:
> - Update commit message to match the new implementation
> - Using a per domain bitfield to keep track of which SPs has been notifie=
d
>  with VM_DESTROYED
> - Holding a domain reference counter to keep the domain as a zombie domai=
n
>  while there still is shared memory registrations remaining to be reclaim=
ed
> - Using a timer to retry reclaiming remaining shared memory registrations
> ---
> xen/arch/arm/tee/ffa.c | 253 +++++++++++++++++++++++++++++++++--------
> 1 file changed, 204 insertions(+), 49 deletions(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 0793c1c7585d..80ebbf4f01c6 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -54,6 +54,7 @@
> #include <xen/mm.h>
> #include <xen/sched.h>
> #include <xen/sizes.h>
> +#include <xen/timer.h>
> #include <xen/types.h>
>=20
> #include <asm/event.h>
> @@ -144,6 +145,12 @@
>  */
> #define FFA_MAX_SHM_COUNT               32
>=20
> +/*
> + * The time we wait until trying to tear down a domain again if it was
> + * blocked initially.
> + */
> +#define FFA_CTX_TEARDOWN_DELAY          SECONDS(1)
> +
> /* FF-A-1.1-REL0 section 10.9.2 Memory region handle, page 167 */
> #define FFA_HANDLE_HYP_FLAG             BIT(63, ULL)
> #define FFA_HANDLE_INVALID              0xffffffffffffffffULL
> @@ -384,11 +391,6 @@ struct ffa_ctx {
>     unsigned int page_count;
>     /* FF-A version used by the guest */
>     uint32_t guest_vers;
> -    /*
> -     * Number of SPs that we have sent a VM created signal to, used in
> -     * ffa_domain_teardown() to know which SPs need to be signalled.
> -     */
> -    uint16_t create_signal_count;
>     bool rx_is_free;
>     /* Used shared memory objects, struct ffa_shm_mem */
>     struct list_head shm_list;
> @@ -402,6 +404,15 @@ struct ffa_ctx {
>     spinlock_t tx_lock;
>     spinlock_t rx_lock;
>     spinlock_t lock;
> +    /* Used if domain can't be torn down immediately */
> +    struct domain *teardown_d;
> +    struct list_head teardown_list;
> +    s_time_t teardown_expire;
> +    /*
> +     * Used for ffa_domain_teardown() to keep track of which SPs should =
be
> +     * notified that this guest is being destroyed.
> +     */
> +    unsigned long vm_destroy_bitmap[];
> };
>=20
> struct ffa_shm_mem {
> @@ -436,6 +447,12 @@ static void *ffa_tx __read_mostly;
> static DEFINE_SPINLOCK(ffa_rx_buffer_lock);
> static DEFINE_SPINLOCK(ffa_tx_buffer_lock);
>=20
> +
> +/* Used to track domains that could not be torn down immediately. */
> +static struct timer ffa_teardown_timer;
> +static struct list_head ffa_teardown_head;
> +static DEFINE_SPINLOCK(ffa_teardown_lock);
> +
> static bool ffa_get_version(uint32_t *vers)
> {
>     const struct arm_smccc_1_2_regs arg =3D {
> @@ -853,7 +870,6 @@ static int32_t handle_partition_info_get(uint32_t w1,=
 uint32_t w2, uint32_t w3,
>             goto out_rx_release;
>         }
>=20
> -
>         memcpy(ctx->rx, ffa_rx, sz);
>     }
>     ctx->rx_is_free =3D false;
> @@ -992,53 +1008,75 @@ static void put_shm_pages(struct ffa_shm_mem *shm)
>     }
> }
>=20
> -static bool inc_ctx_shm_count(struct ffa_ctx *ctx)
> +static bool inc_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
> {
>     bool ret =3D true;
>=20
>     spin_lock(&ctx->lock);
> +
> +    /*
> +     * If this is the first shm added, increase the domain reference
> +     * counter as we need to keep domain around a bit longer to reclaim =
the
> +     * shared memory in the teardown path.
> +     */
> +    if ( !ctx->shm_count )
> +        get_knownalive_domain(d);
> +
>     if (ctx->shm_count >=3D FFA_MAX_SHM_COUNT)
>         ret =3D false;
>     else
>         ctx->shm_count++;
> +
>     spin_unlock(&ctx->lock);
>=20
>     return ret;
> }
>=20
> -static void dec_ctx_shm_count(struct ffa_ctx *ctx)
> +static void dec_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
> {
>     spin_lock(&ctx->lock);
> +
>     ASSERT(ctx->shm_count > 0);
>     ctx->shm_count--;
> +
> +    /*
> +     * If this was the last shm removed, let go of the domain reference =
we
> +     * took in inc_ctx_shm_count() above.
> +     */
> +    if ( !ctx->shm_count )
> +        put_domain(d);
> +
>     spin_unlock(&ctx->lock);
> }
>=20
> -static struct ffa_shm_mem *alloc_ffa_shm_mem(struct ffa_ctx *ctx,
> +static struct ffa_shm_mem *alloc_ffa_shm_mem(struct domain *d,
>                                              unsigned int page_count)
> {
> +    struct ffa_ctx *ctx =3D d->arch.tee;
>     struct ffa_shm_mem *shm;
>=20
>     if ( page_count >=3D FFA_MAX_SHM_PAGE_COUNT )
>         return NULL;
> -    if ( !inc_ctx_shm_count(ctx) )
> +    if ( !inc_ctx_shm_count(d, ctx) )
>         return NULL;
>=20
>     shm =3D xzalloc_flex_struct(struct ffa_shm_mem, pages, page_count);
>     if ( shm )
>         shm->page_count =3D page_count;
>     else
> -        dec_ctx_shm_count(ctx);
> +        dec_ctx_shm_count(d, ctx);
>=20
>     return shm;
> }
>=20
> -static void free_ffa_shm_mem(struct ffa_ctx *ctx, struct ffa_shm_mem *sh=
m)
> +static void free_ffa_shm_mem(struct domain *d, struct ffa_shm_mem *shm)
> {
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
>     if ( !shm )
>         return;
>=20
> -    dec_ctx_shm_count(ctx);
> +    dec_ctx_shm_count(d, ctx);
>     put_shm_pages(shm);
>     xfree(shm);
> }
> @@ -1306,7 +1344,7 @@ static void handle_mem_share(struct cpu_user_regs *=
regs)
>         goto out_unlock;
>     }
>=20
> -    shm =3D alloc_ffa_shm_mem(ctx, page_count);
> +    shm =3D alloc_ffa_shm_mem(d, page_count);
>     if ( !shm )
>     {
>         ret =3D FFA_RET_NO_MEMORY;
> @@ -1350,7 +1388,7 @@ static void handle_mem_share(struct cpu_user_regs *=
regs)
>=20
> out:
>     if ( ret )
> -        free_ffa_shm_mem(ctx, shm);
> +        free_ffa_shm_mem(d, shm);
> out_unlock:
>     spin_unlock(&ctx->tx_lock);
>=20
> @@ -1401,7 +1439,7 @@ static int handle_mem_reclaim(uint64_t handle, uint=
32_t flags)
>     }
>     else
>     {
> -        free_ffa_shm_mem(ctx, shm);
> +        free_ffa_shm_mem(d, shm);
>     }
>=20
>     return ret;
> @@ -1486,6 +1524,41 @@ static bool ffa_handle_call(struct cpu_user_regs *=
regs)
>     }
> }
>=20
> +static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start,
> +                              uint16_t end, uint16_t sp_id)
> +{
> +    unsigned int n;
> +
> +    for ( n =3D start; n < end; n++ )
> +    {
> +        if ( subscr[n] =3D=3D sp_id )
> +            return true;
> +    }
> +
> +    return false;
> +}
> +
> +static void vm_destroy_bitmap_init(struct ffa_ctx *ctx,
> +                                   unsigned int create_signal_count)
> +{
> +    unsigned int n;
> +
> +    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
> +    {
> +        /*
> +         * Skip SPs subscribed to the VM created event that never was
> +         * notified of the VM creation due to an error during
> +         * ffa_domain_init().
> +         */
> +        if ( is_in_subscr_list(subscr_vm_created, create_signal_count,
> +                               subscr_vm_created_count,
> +                               subscr_vm_destroyed[n]) )
> +            continue;
> +
> +        set_bit(n, ctx->vm_destroy_bitmap);
> +    }
> +}
> +
> static int ffa_domain_init(struct domain *d)
> {
>     struct ffa_ctx *ctx;
> @@ -1501,11 +1574,14 @@ static int ffa_domain_init(struct domain *d)
>     if ( d->domain_id >=3D UINT16_MAX)
>         return -ERANGE;
>=20
> -    ctx =3D xzalloc(struct ffa_ctx);
> +    ctx =3D xzalloc_flex_struct(struct ffa_ctx, vm_destroy_bitmap,
> +                              BITS_TO_LONGS(subscr_vm_destroyed_count));
>     if ( !ctx )
>         return -ENOMEM;
>=20
>     d->arch.tee =3D ctx;
> +    ctx->teardown_d =3D d;
> +    INIT_LIST_HEAD(&ctx->shm_list);
>=20
>     for ( n =3D 0; n < subscr_vm_created_count; n++ )
>     {
> @@ -1515,65 +1591,141 @@ static int ffa_domain_init(struct domain *d)
>         {
>             printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %u=
 to  %u: res %d\n",
>                    get_vm_id(d), subscr_vm_created[n], res);
> -            ctx->create_signal_count =3D n;
> -            return -EIO;
> +            break;
>         }
>     }
> -    ctx->create_signal_count =3D subscr_vm_created_count;
> -
> -    INIT_LIST_HEAD(&ctx->shm_list);
> +    vm_destroy_bitmap_init(ctx, n);
> +    if ( n !=3D subscr_vm_created_count )
> +        return -EIO;
>=20
>     return 0;
> }
>=20
> -static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start,
> -                              uint16_t end, uint16_t sp_id)
> +static void send_vm_destroyed(struct domain *d)
> {
> +    struct ffa_ctx *ctx =3D d->arch.tee;
>     unsigned int n;
> +    int32_t res;
>=20
> -    for ( n =3D start; n < end; n++ )
> +    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
>     {
> -        if ( subscr[n] =3D=3D sp_id )
> -            return true;
> -    }
> +        if ( !test_bit(n, ctx->vm_destroy_bitmap) )
> +            continue;
>=20
> -    return false;
> +        res =3D ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_id=
(d),
> +                                     FFA_MSG_SEND_VM_DESTROYED);
> +

I think here we should dinstinguish cases depending on the error received:
- retry: we should keep the bit set and retry later
- other: unset the bit as there is not much we can do but log it.

The interrupted case can happen, we handle that already in the direct messa=
ge
request but we will get back here if that does not work after some retries =
so
putting it in the other category is ok i think.

> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "%pd: ffa: Failed to report destruction of=
 vm_id %u to %u: res %d\n",
> +                   d, get_vm_id(d), subscr_vm_destroyed[n], res);
> +        }
> +        else
> +        {
> +            clear_bit(n, ctx->vm_destroy_bitmap);
> +        }
> +    }
> }
>=20
> -/* This function is supposed to undo what ffa_domain_init() has done */
> -static int ffa_domain_teardown(struct domain *d)
> +static void reclaim_shms(struct domain *d)
> {
>     struct ffa_ctx *ctx =3D d->arch.tee;
> -    unsigned int n;
> +    struct ffa_shm_mem *shm, *tmp;
>     int32_t res;
>=20
> -    if ( !ctx )
> -        return 0;
> +    list_for_each_entry_safe(shm, tmp, &ctx->shm_list, list)
> +    {
> +        register_t handle_hi;
> +        register_t handle_lo;
>=20
> -    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
> +        uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
> +        res =3D ffa_mem_reclaim(handle_lo, handle_hi, 0);

Same here as for the VM_DESTROYED, there are some error code that we should
not reiterate on as they will also fail next time:
- invalid parameters: stop and log an error, this will always fail
- no memory: for now I would say do the same as invalid parameter with a co=
mment
 maybe because we could retry and memory coud be available next time
- abort: stop and log an error, this is a major fault on the other side
- denied: retry.

> +        if ( res )
> +        {
> +            printk(XENLOG_G_INFO "%pd: ffa: Failed to reclaim handle %#l=
x : %d\n",
> +                   d, shm->handle, res);
> +        }
> +        else
> +        {
> +            printk(XENLOG_G_DEBUG "%pd: ffa: Reclaimed handle %#lx\n",
> +                   d, shm->handle);
> +            list_del(&shm->list);
> +            free_ffa_shm_mem(d, shm);
> +        }
> +    }
> +}
> +
> +static void ffa_domain_teardown_continue(struct ffa_ctx *ctx, bool first=
_time)
> +{
> +    struct ffa_ctx *next_ctx =3D NULL;
> +
> +    send_vm_destroyed(ctx->teardown_d);
> +    reclaim_shms(ctx->teardown_d);
> +
> +    if ( ctx->shm_count )
> +    {

If i do understand right you only retry if there are remaining SHM to recla=
im but what
if you have destroy messages that were not sent successfully, shouldn't we =
reiterate
in that case to send the destroy message again ?

> +        printk(XENLOG_G_INFO "%pd: ffa: Remaining unclaimed handles, ret=
rying\n", ctx->teardown_d);
> +
> +        ctx->teardown_expire =3D NOW() + FFA_CTX_TEARDOWN_DELAY;
> +
> +        spin_lock(&ffa_teardown_lock);
> +        list_add_tail(&ctx->teardown_list, &ffa_teardown_head);
> +        /* Need to set a new timer for the next ctx in line */
> +        next_ctx =3D list_first_entry(&ffa_teardown_head, struct ffa_ctx=
,
> +                                    teardown_list);
> +        spin_unlock(&ffa_teardown_lock);
> +    }
> +    else
>     {
>         /*
> -         * Skip SPs subscribed to the VM created event that never was
> -         * notified of the VM creation due to an error during
> -         * ffa_domain_init().
> +         * domain_destroy() might have been called (via put_domain() in
> +         * reclaim_shms()), so we can't touch the domain structure anymo=
re.
>          */
> -        if ( is_in_subscr_list(subscr_vm_created, ctx->create_signal_cou=
nt,
> -                               subscr_vm_created_count,
> -                               subscr_vm_destroyed[n]) )
> -            continue;
> +        xfree(ctx);
>=20
> -        res =3D ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_id=
(d),
> -                                     FFA_MSG_SEND_VM_DESTROYED);
> -
> -        if ( res )
> -            printk(XENLOG_ERR "ffa: Failed to report destruction of vm_i=
d %u to  %u: res %d\n",
> -                   get_vm_id(d), subscr_vm_destroyed[n], res);
> +        /* Only check if there has been a change to the teardown queue *=
/
> +        if ( !first_time )
> +        {
> +            spin_lock(&ffa_teardown_lock);
> +            next_ctx =3D list_first_entry_or_null(&ffa_teardown_head,
> +                                                struct ffa_ctx, teardown=
_list);
> +            spin_unlock(&ffa_teardown_lock);
> +        }
>     }
>=20
> +    if ( next_ctx )
> +        set_timer(&ffa_teardown_timer, next_ctx->teardown_expire);
> +}
> +
> +static void ffa_teardown_timer_callback(void *arg)
> +{
> +    struct ffa_ctx *ctx;
> +
> +    spin_lock(&ffa_teardown_lock);
> +    ctx =3D list_first_entry_or_null(&ffa_teardown_head, struct ffa_ctx,
> +                                   teardown_list);
> +    if ( ctx )
> +        list_del(&ctx->teardown_list);
> +    spin_unlock(&ffa_teardown_lock);
> +
> +    if ( ctx )
> +        ffa_domain_teardown_continue(ctx, false /* !first_time */);
> +    else
> +        printk(XENLOG_G_ERR "%s: teardown list is empty\n", __func__);
> +}
> +
> +/* This function is supposed to undo what ffa_domain_init() has done */
> +static int ffa_domain_teardown(struct domain *d)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    if ( !ctx )
> +        return 0;
> +
>     if ( ctx->rx )
>         rxtx_unmap(ctx);
>=20
> -    XFREE(d->arch.tee);
> +    ffa_domain_teardown_continue(ctx, true /* first_time */);
>=20
>     return 0;
> }
> @@ -1739,6 +1891,9 @@ static bool ffa_probe(void)
>     if ( !init_sps() )
>         goto err_free_ffa_tx;
>=20
> +    INIT_LIST_HEAD(&ffa_teardown_head);
> +    init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0=
);
> +
>     return true;
>=20
> err_free_ffa_tx:
> --=20
> 2.34.1
>=20

Regards
Bertrand



