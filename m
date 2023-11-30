Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D337FEDA0
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 12:13:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644548.1005692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8ez3-0001Gb-9B; Thu, 30 Nov 2023 11:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644548.1005692; Thu, 30 Nov 2023 11:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8ez3-0001DH-6H; Thu, 30 Nov 2023 11:13:29 +0000
Received: by outflank-mailman (input) for mailman id 644548;
 Thu, 30 Nov 2023 11:13:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EdXu=HL=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1r8ez1-0001DB-Ez
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 11:13:27 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ac2c041-8f71-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 12:13:25 +0100 (CET)
Received: from DB6PR0301CA0099.eurprd03.prod.outlook.com (2603:10a6:6:30::46)
 by DB5PR08MB10312.eurprd08.prod.outlook.com (2603:10a6:10:3c1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 11:13:15 +0000
Received: from DB5PEPF00014B9D.eurprd02.prod.outlook.com
 (2603:10a6:6:30:cafe::7c) by DB6PR0301CA0099.outlook.office365.com
 (2603:10a6:6:30::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24 via Frontend
 Transport; Thu, 30 Nov 2023 11:13:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9D.mail.protection.outlook.com (10.167.8.164) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Thu, 30 Nov 2023 11:13:15 +0000
Received: ("Tessian outbound 7671e7ddc218:v228");
 Thu, 30 Nov 2023 11:13:15 +0000
Received: from 06ee1fb0cfae.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C409ED06-5823-444F-8396-AF27C42BF44C.1; 
 Thu, 30 Nov 2023 10:54:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 06ee1fb0cfae.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 Nov 2023 10:54:24 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by GV2PR08MB8027.eurprd08.prod.outlook.com (2603:10a6:150:77::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 10:54:21 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::dda6:1756:643c:c836]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::dda6:1756:643c:c836%4]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 10:54:20 +0000
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
X-Inumbo-ID: 7ac2c041-8f71-11ee-9b0f-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PulTXjmZsRK9P/rUZD1WigcnfMqMtTDLOnU+JN0ic2eXLupFuw6xSfE2X4dvW30hmUXDULYfeAnyfBAOyKv3xukXmHfgfZ7884DtUjGE4PYWe+p7/1THQXer+6kzxrTsaKl95mWBv7YiRJjMDCtUotXSVme3H9t8LoMJI5+8C8wrk7QGMWukrvIItcWqT1DpQD6GNoBsk8KRS98CbOFTotOr9BYVuWa2iNM0bY3rBpN0sewyOpPQ5CfMTsfEHRpJnhuhVD1DhIS1QM71ya78uXPJl5N62GwTtdDm6OdIpPrHDcRrTDI0yZ6Kctcj1uSIdYNZHqSz4l3uvBzv8LSDXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xw3WCMG//pYU48orHwkaIfK5wXsX9TwTo3H83JPeCRk=;
 b=O3xV9knINmMSYvgEjMqOSf/hqQiv8PzQ/2CvCZ2+SaaB1kca/1WBcPu19CIstHuqBwBItP/dIZu+qZs1mSoK1s547r4qn/leeRg1Kz9Vm0cH72ZvRlhtPMW4GqBSwV8NoR0PVXdI6AWROfoG3qdkbxr/Bahd851xhvmwsFBqV6Se9YlO2rX7LpKTTBpeA9WRyebODWOrQ+P5os+qfJbupVHyjQmuab+EVT6qaHWgfBc0qzO01ZpARzbt9E5ZpCAWHNI2lioZWqzCPSOqnaWuajpcygZJVGFWnz8xFK36gWgiLSVEIjSmXqfzfN34Vq4a2UAG2+/6+l8FXqiEByQzHg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xw3WCMG//pYU48orHwkaIfK5wXsX9TwTo3H83JPeCRk=;
 b=Ox4C+7XIs/QJnCiEskFd2ztYJWVIP7bLIweorJ5s4OoVBgyltCshLYAo3lf1TWTQ6QCkQfft+sgt0XL3jSzvgTPzCJ92uWVsIHhBBuC09Y8DJpaYPAy5XiciUpAZn5FTSsZdZ68Zj67B1HoJtK3KzfOSusu4U2hfGIQ1FA50v20=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 270d803fee0d7e10
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMtrCW154c6quiSCNAHs9Dsk/tXvENlHCC1w3ZpyqFI21HhnxNv34VGhvtagE8hBjGLrvg9MS/RLfbBe+oMzk8zr5NO4SFRMNflmAelfJxqBeqNCL43aP5Yr2ar+VYr9iUeBdgJx6YbkafCW0ABdpDNeiyiUF6JtKs5Rrs6T/v9ufySPnUVAseagEFTvvVAXa3DqfsZiqV+zadIpgwubDFXa4Z/HGwhzfTiH+8GOg4vw7AGEa5cpRWybJTeOMp7FypnTgvkecnSSLoT7V7UjSoJlGx+HQoCbWAdtGxODmuny3SuJTNUj6QLpxz2cNOVIULkkZCJo7vlFpkMMuLOgzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xw3WCMG//pYU48orHwkaIfK5wXsX9TwTo3H83JPeCRk=;
 b=FCJ1IAeCmp4Joc1OaKFIrWhp5f2xiUHO0IpxTIrxYxQnF5/OuycOh9VW1vAlNNOLxJOZs+rjOa0Aw4hLYF88ruuQJT03aE3RFi5044BFTrQEdeDGhwng9TG9YxOHbNQCwcX1YIdmKmv4Nof1b4n5+nstNDVojdZDgxpsu8PL/2B/939kgMUlRIslCgH4sZJpYfF0n/vQ0dez1Xu+TgEUyYe1cbodkT26Nf3FSPhheFonR1PGt1/EjBLsAM9h7pOrGKPy/CEI5zAaTBdgcdspOCxaFn6uHx0SwN41+e/7kHoxQr41oLbxeC1epTvobCmwB8wTAiJ+Z6L/JyEEhEv8CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xw3WCMG//pYU48orHwkaIfK5wXsX9TwTo3H83JPeCRk=;
 b=Ox4C+7XIs/QJnCiEskFd2ztYJWVIP7bLIweorJ5s4OoVBgyltCshLYAo3lf1TWTQ6QCkQfft+sgt0XL3jSzvgTPzCJ92uWVsIHhBBuC09Y8DJpaYPAy5XiciUpAZn5FTSsZdZ68Zj67B1HoJtK3KzfOSusu4U2hfGIQ1FA50v20=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 00/10] Follow-up static shared memory PART I
Thread-Topic: [PATCH v4 00/10] Follow-up static shared memory PART I
Thread-Index: AQHZ5GUzsFszTp1+jEGlcEDs/85vrrAVVFeAgAARk4CAfbuvAIAADMEw
Date: Thu, 30 Nov 2023 10:54:20 +0000
Message-ID: <685867D0-3DD5-4040-AA45-CA321E9309B0@arm.com>
References: <20230911040442.2541398-1-Penny.Zheng@arm.com>
 <046aecc4-7270-0041-67dd-51614d2beee6@amd.com>
 <2124b9ea-4c74-780a-f97f-ca3b3d7c9b16@arm.com>
 <e78280bd-4070-4357-841e-acbb5cea1127@amd.com>
In-Reply-To: <e78280bd-4070-4357-841e-acbb5cea1127@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|GV2PR08MB8027:EE_|DB5PEPF00014B9D:EE_|DB5PR08MB10312:EE_
X-MS-Office365-Filtering-Correlation-Id: 31495628-a32e-4203-5bb6-08dbf1955959
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nfbpJ6NbbDcIggBMH9L0KL8qXBzImN13b2qlQPu6egNTgF88ibb50hH3yF9Wo080m5efIF5Eggr1WHBziVmythI7L3LThhEYo8T/H/BAhMRxn/o8h2ZXr2NRimo4yyySw0vIF1Pcj4CqKvWGYQ8+IRlb7mBti2E4H1rUH+yWhWU5K+u4CROqbnFBM/dowBb8tmsOH75VER7c9l4d/UzEAZLZHKOOvlR8PmJVWxm5RU1zeStSrLk9Z/rmvPTPbxUFLD+wfjORWhCPbB0WgvtkkYwYED8SiKbXeywhcsG63UyWCYfmg4Zy2QXDq/R2NZ6sGMROdDT3449oZMxCYOBAa+HRAoXk4CbcbTTp/AS/juHYJCNHWQmhJLqULtnUs15kDpwl6KI5iCw7V/59BwDyvLbJFOQprcUDR2HSb5gSkDA/QS6vy5ij8dD797d0Y7kiruy2ifTDDsy0qHBdLDHrv9YoHmOBwkyri2yFEXintvKN2Ah0hpcTzqMtkhcwfDfikx4gBp/dUcRsqLXEmSPQMV0XqLwgFePC9yJT9XNdYfgSEIlM8oZO2hlnksmZpUo1CKuOqsHyxLW2eu+v8Ev3ZSkCqoJ/X0j3hTU4C7na41quLWCTqr4QuA8ax/h/HCkpe3otvtbMSq7zw0hCaclXRCKSEbcn+0GFbo1yU365BoCb6oja2dMvmQp7z4SLqN3t
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(366004)(136003)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(41300700001)(2616005)(26005)(6512007)(83380400001)(66946007)(66476007)(66446008)(76116006)(6916009)(66556008)(64756008)(36756003)(5660300002)(54906003)(8676002)(122000001)(33656002)(8936002)(4326008)(316002)(86362001)(6486002)(202311291699003)(71200400001)(53546011)(6506007)(38070700009)(2906002)(478600001)(966005)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8027
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fde76407-a08a-488d-001a-08dbf192b522
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZwqLgA7HI++OnzDpDh96f5TT9T8Wl73nKiYdmoI/QVH/YZqgilmRjq3KDT9tUJ7pDaecd5Esno/05vOMSm/holyZrV0xP4d/02GkF/T1LBm0er4U9qvsTIsEhmPraSN29Jyzat7SO1+/hWPBMygX9RCroapJvn8TsniVj49OIsVXmDmmheiwS62AT1LJlvGDJLN+UREFvNRAFmkp5p+qaviLyBwCPhctRV2u2hjj2C0Ub71F0iamOveBWICj38Mv9TzHoCif7mU1FXdbS0hOh4ER5kZE4xmnzYX0xM5tJ+2vg4slcLl+x3bM8BzvAXSzSyfc1T7Uu/iPVIEwARGAKHSadvRmBC+um7cMyMnoYkBZQ9SW302BohBKwXf/lfQu38dNiPQIV5OGvN8Ru9aXZAWNcM8dCbcmsXlmsb4L6MfAUu0idRFD2Zx6JW2gtNHp2N/4Ij4ipwyfaKumwf4cOglaYgBnKhUkUU+a6mRZEv/hUiimvPpPDcrOj7wKehzFYTPc0+S7+U1cqVXCGNIF7MuZCW1TkCroPe3jid4cMd1BP9p73IYXQH3j3cfsXo0tndzyY5dd1WBOo7jodBPmfWbSQY4h6SZdrvr6hNMn5o5LSowFFSBe0dh+vumuI5xR6zgaRSxlJXf1Q6Xd/zHr99RIa1ehd6ZuFI8X+ucSrdatcjDaZ0gSpqZxjZAuz3yC0eaBC1HJ4VJqs9iwrwfrO149Kt1bxIwC+4uitYnKx2SyiMtpSruQ3KkPJzVLmQa8/DUmIlVlC2cuEEL9V3UXUg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39850400004)(346002)(376002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(40460700003)(26005)(336012)(6506007)(83380400001)(107886003)(53546011)(2616005)(6512007)(36860700001)(47076005)(6486002)(5660300002)(4326008)(6862004)(8676002)(8936002)(41300700001)(2906002)(966005)(478600001)(316002)(54906003)(70206006)(70586007)(202311291699003)(86362001)(33656002)(36756003)(81166007)(82740400003)(356005)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 11:13:15.4506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31495628-a32e-4203-5bb6-08dbf1955959
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10312

VGhhbmtzIGZvciB0aGUgcmVtaW5kZXIhDQpJ4oCZbGwgc2VuZCB0aGUgdXBkYXRlZCB2ZXJzaW9u
IEFTQVAgOikNCg0KVGhhbmtzLA0KUGVubnkNCg0KPiDlnKggMjAyM+W5tDEx5pyIMzDml6XvvIwx
ODowOe+8jE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+IOWGmemBk++8mg0KPiAN
Cj4g77u/SGkgUGVubnksDQo+IA0KPj4gT24gMTEvMDkvMjAyMyAxMjowNCwgUGVubnkgWmhlbmcg
d3JvdGU6DQo+PiANCj4+IA0KPj4gSGkgTWljaGFsDQo+PiANCj4+PiBPbiAyMDIzLzkvMTEgMTc6
MDEsIE1pY2hhbCBPcnplbCB3cm90ZToNCj4+PiBIaSBQZW5ueSwNCj4+PiANCj4+PiBPbiAxMS8w
OS8yMDIzIDA2OjA0LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4+Pj4gDQo+Pj4+IA0KPj4+PiBUaGVy
ZSBhcmUgc29tZSB1bnNvbHZpbmcgaXNzdWVzIG9uIGN1cnJlbnQgNC4xNyBzdGF0aWMgc2hhcmVk
IG1lbW9yeQ0KPj4+PiBmZWF0dXJlWzFdLCBpbmNsdWRpbmc6DQo+Pj4+IC0gSW4gb3JkZXIgdG8g
YXZvaWQga2VlcGluZyBncm93aW5nICdtZW1iYW5rJywgaGF2aW5nIHRoZSBzaGFyZWQgbWVtb3J5
DQo+Pj4+IGluZm8gaW4gc2VwYXJhdGUgc3RydWN0dXJlcyBpcyBwcmVmZXJyZWQuDQo+Pj4+IC0g
TWlzc2luZyBpbXBsZW1lbnRhdGlvbiBvbiBoYXZpbmcgdGhlIGhvc3QgYWRkcmVzcyBvcHRpb25h
bCBpbg0KPj4+PiAieGVuLHNoYXJlZC1tZW0iIHByb3BlcnR5DQo+Pj4+IC0gUmVtb3Zpbmcgc3Rh
dGljIHNoYXJlZCBtZW1vcnkgZnJvbSBleHRlbmRlZCByZWdpb25zDQo+Pj4+IC0gTWlzc2luZyBy
ZWZlcmVuY2UgcmVsZWFzZSBvbiBmb3JlaWduIHN1cGVycGFnZQ0KPj4+PiAtIEZpeCBkdXBsaWNh
dGVkIC9yZXNlcnZlZC1tZW1vcnkgbm9kZSBvbiBEb20wDQo+Pj4+IC0gTWlzc2luZyBzdGF0aWMg
c2htIG5vZGUgZGVjbGFyYXRpb24gb24gZ3Vlc3QgL21lbW9yeSBub2RlDQo+Pj4+IC0gTWlzc2lu
ZyAieGVuLG9mZnNldCIgZmVhdHVyZSwgd2hpY2ggaXMgaW50cm9kdWNlZCBpbiBMaW51eCBET0Nb
Ml0NCj4+Pj4gDQo+Pj4+IEFsbCBhYm92ZSBvYmplY3RzIGhhdmUgYmVlbiBkaXZpZGVkIGludG8g
dHdvIHBhcnRzIHRvIGNvbXBsZXRlLiBBbmQgdGhpcw0KPj4+PiBwYXRjaCBzZXJpZSBpcyBQQVJU
IEkuDQo+Pj4gDQo+Pj4gSnVzdCBsaWtlIEkgcG9pbnRlZCBvdXQgaW4gdGhlIHByZXZpb3VzIHJl
dmlzaW9uLCB0aGVyZSBpcyBhIGdpdGxhYiBDSSBmYWlsdXJlIG9uIHNoYXJlZC1tZW1vcnkgam9i
czoNCj4+PiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGF0Y2hldy94ZW4vLS9waXBl
bGluZXMvOTk5MDk4MjkzDQo+Pj4gRGlkIHlvdSBjaGFuZ2UgdGhlIGludGVyZmFjZSB0aGF0IGNv
dWxkIGxlYWQgdG8gdGhpcyAoSSBjYW5ub3Qgc3BvdCBhbnkgY2hhbmdlIGluIHRoZSBkb2NzIHJl
ZmlubWVudCkgPw0KPj4+IE5vIFhlbiBsb2dzIG1lYW5pbmcgdGhlIGVhcmx5IGJvb3QgZmFpbHVy
ZS4gUGxlYXNlIGNoZWNrLg0KPj4+IA0KPj4gDQo+PiBTb29vb29vIHNvcnJ5LiBJIG1pc3MtbG9v
a2VkIHRoYXQgY29tbWVudC4gSSBmb3VuZCB0aGF0IGJ1ZyBleGlzdHMgaW4NCj4+IGJvb3RmZHQu
Yy4NCj4+IGBgYA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMgYi94ZW4v
YXJjaC9hcm0vYm9vdGZkdC5jDQo+PiBpbmRleCA3ZDg2ZGZmZDQ1Li4yOTBkZDI3YmY0IDEwMDY0
NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYw0KPj4gKysrIGIveGVuL2FyY2gvYXJt
L2Jvb3RmZHQuYw0KPj4gQEAgLTUzMiw2ICs1MzIsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBwcm9j
ZXNzX3NobV9ub2RlKGNvbnN0IHZvaWQgKmZkdCwNCj4+IGludCBub2RlLA0KPj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHNpemUsIHRvdF9zaXplKTsNCj4+ICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOw0KPj4gICAgICAgICAgICAgICAgICB9DQo+PiArDQo+PiArICAg
ICAgICAgICAgICAgIGJyZWFrOw0KPj4gICAgICAgICAgICAgIH0NCj4+ICAgICAgICAgICAgICBl
bHNlIGlmICggcGFkZHJfYXNzaWduZWQgKQ0KPj4gICAgICAgICAgICAgIHsNCj4+IGBgYA0KPj4g
SSBhY2NpZGVudGFsbHkgZGVsZXRlIGEgYGJyZWFrO2AgaGVyZSwgYW5kIEkgd2lsbCBhbHNvIGNv
bW1lbnQgaW4gdGhlDQo+PiByZWxhdGVkIGNvbW1pdCBhbmQgZml4IGluIG5leHQgdmVyc2lvbiEN
Cj4+IA0KPiBXaGlsZSBzZWFyY2hpbmcgZm9yIHRoZSBwZW5kaW5nIHNlcmllcywgSSBub3RpY2Vk
IHRoaXMgb25lLg0KPiBJZiB5b3UgaGF2ZSB0aW1lIGFuZCB3YW50IHVzIHRvIHJldmlldyB0aGUg
c2VyaWVzLCBwbGVhc2Ugc2VuZCBhbiB1cGRhdGVkIHZlcnNpb24NCj4gYmFzZWQgb24gdGhlIHJl
Y2VudCBMdWNhJ3MgZG9tMGxlc3MgZmVhdHVyZXMgbW9kdWxhcml6YXRpb24uDQo+IA0KPiB+TWlj
aGFsDQo=

