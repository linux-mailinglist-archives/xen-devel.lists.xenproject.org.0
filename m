Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76028276D6
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 19:01:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663679.1033769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMtud-0003ek-Lz; Mon, 08 Jan 2024 17:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663679.1033769; Mon, 08 Jan 2024 17:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMtud-0003cH-J0; Mon, 08 Jan 2024 17:59:47 +0000
Received: by outflank-mailman (input) for mailman id 663679;
 Mon, 08 Jan 2024 17:59:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ke4x=IS=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rMtuc-0003cB-5x
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 17:59:46 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b35721f7-ae4f-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 18:59:43 +0100 (CET)
Received: from AM9P195CA0021.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::26)
 by AS4PR08MB7901.eurprd08.prod.outlook.com (2603:10a6:20b:51c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 17:59:37 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::7) by AM9P195CA0021.outlook.office365.com
 (2603:10a6:20b:21f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21 via Frontend
 Transport; Mon, 8 Jan 2024 17:59:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.13 via Frontend Transport; Mon, 8 Jan 2024 17:59:36 +0000
Received: ("Tessian outbound 53c3c09c1e1b:v239");
 Mon, 08 Jan 2024 17:59:36 +0000
Received: from bba51d5a9036.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D5E4B4B7-4F8F-4F29-9457-B7012DEE26FB.1; 
 Mon, 08 Jan 2024 17:59:25 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bba51d5a9036.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 08 Jan 2024 17:59:25 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB7862.eurprd08.prod.outlook.com (2603:10a6:20b:52a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 17:59:21 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::74c4:3b74:f527:1f94]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::74c4:3b74:f527:1f94%7]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 17:59:21 +0000
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
X-Inumbo-ID: b35721f7-ae4f-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MEsokCjiubrnzXDLxd42t7HaIqbfuahXfKfHUCKK7FqhV+bnJ0Z4v8mHAgZfQUmBkf86Y+bbAMc4LYkiPQ7sTifnkRFzgL9bM6IV36ojtXUwlY34p9HP8FcKJHoEpRSSlLummIPZRjeQKiohiYgpr9l8wwbkznyP0J+yyQP65Coih4lPl5oVg55Y9veAtSthgROy/4Wth20CIh5hbdwpShBblnSTzRjv3kTXoTCcElxug1vJeX6+75yhhbe5Iq+C3dup8yB9uQq9uPzomls/lC12jMeBk+Mi14wcl0Vunqg7a4nsCV5RJjVcee18AWL//EC10/akz01ZN4aCYw4AqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YuDH++bEzz3T34mEndM8RJn2G9YNBCwjmYXZmnPo18=;
 b=n9Cqzv6KEA9mhMJm9MzigfeKmj6u3ZrgQWSIJHru/YZD1QxJcOPvj5pVMv1X0Fekdk0VCqLgzhw+tpEy+OC1pNojBrAttePpUHPFNx5GZdyYNuBPKIzmaXw2Win4zCrV5s2ov19quJpVcFTjyTCyFb4JBEI48WdNJZ6z889htHmXM7DQkUS+hSV6xlpjU/rFXiTf6Y7/EUFnNgmnuC6bDNJlHKx00tVLdqLKwFeYRQ3D2laGtk2DYlknqSKHOZgMIWLd/XDeSxcYNA2LrcvevTQjG+4zainigCH5Pjq7T3XuRz8f6zppALAuwNVkGQGiHYR1N6vdHmbr8ya4pWNmuQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YuDH++bEzz3T34mEndM8RJn2G9YNBCwjmYXZmnPo18=;
 b=iAV0GYersEVNDU0GpByFGP2XxqWmVfB/G8W6F+nShpvjhAzMqHUZn68TERovXMpp2KoLEbS+67K/uDY+jUvT1WeqqePpTVTqiXqJ/l5mnL20Ch750qdwnzxAMf9HOvuycJA1hRjAINR4TQdJak+1YTcOoa+YY/u9wWWwj6AeEl8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1411848e7fdd0eb4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ao7iVUlAlJG2YpdAAaGNOnKbHGrzSHQZTJh5Ny+vD975azncJ/Z5r5QULddx7HI60qVIoxWUBsXTwRolF5WaRJEWk8c9k4PBQYoo6bLbMWBB0NU9FOvJRQqS8D8171dmtgXdEvXN2/muGZIs9aMfakwE2DiRyuMPzHqiyzYLQTYrmzwd+hZE7aBM3A6RfadqhcC8DA71bm0XQ+lgY+Ey7wwaIqgTtgaxFfKb3llzzPAzi1oF+rRPgBDyk+rEgwIPwud7mVtcodJHYeaMeB2G3+EkIYVgQLV9hzZu1wfA5w4Y/Ed5nXc0vR79h8frIDZ4L3oSzfAzwdWWgVHv7f8Q1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YuDH++bEzz3T34mEndM8RJn2G9YNBCwjmYXZmnPo18=;
 b=PKHHyg5+onTCpiRP0A8yHV6NEzUrWrgxIsj7eGG66CX8uesxJz2L/dBFXCeLS6WkQTE98cc6v7/EZ0SwvzAcWXB0Voz40Y0e7jdLFju5zIjZbpKUsShTq1uSo51LpIx5wt9Cuf2RT31696Qag7j1aI2aKTJ8i9TVGxpPVqDFxqH2dE52C3NENNZUyIKrVudO+pyZyci1sBVRArdjiymR2ImLYy0PSvjkndardLAL53k6hjME/cW7rPuIdJIpNtwQZ+0ZcrlrfWTJmsHMQgKMDLlACttcHHqOvekSrAMSyjuptppZqYXUOp1NHpzuqAhANjDo0z9KeCBsf4rE4GcWMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YuDH++bEzz3T34mEndM8RJn2G9YNBCwjmYXZmnPo18=;
 b=iAV0GYersEVNDU0GpByFGP2XxqWmVfB/G8W6F+nShpvjhAzMqHUZn68TERovXMpp2KoLEbS+67K/uDY+jUvT1WeqqePpTVTqiXqJ/l5mnL20Ch750qdwnzxAMf9HOvuycJA1hRjAINR4TQdJak+1YTcOoa+YY/u9wWWwj6AeEl8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <Michal.Orzel@amd.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, George
 Dunlap <george.dunlap@cloud.com>
Subject: Re: Clang-format configuration discussion - pt 2
Thread-Topic: Clang-format configuration discussion - pt 2
Thread-Index:
 AQHaHhwDfni7SbjBtk6S7YLD/w4HebCaxpCAgAAF/YCAANA+AIABAccAgADjFACAABTvAIAp2VwAgAkMmQA=
Date: Mon, 8 Jan 2024 17:59:21 +0000
Message-ID: <EC1E1E69-3644-42AA-9095-672B4045778F@arm.com>
References: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
 <2E778E49-C2F5-421F-9598-CED15E7D4284@arm.com>
 <827e24a2-0ecd-48c4-becb-12129c4208dc@suse.com>
 <CA+zSX=b77av9rHwWHsRD8MAnprfXQiotUPPPKFDOU9cTOA2OzA@mail.gmail.com>
 <4ce995a3-78a1-49e5-881d-d6af10514673@xen.org>
 <b71c4e81-7026-40b2-ad76-ea4de5bbf6b3@suse.com>
 <52f25f40-ab42-4845-9912-81ce92cc4de6@xen.org>
 <alpine.DEB.2.22.394.2401021544050.1322202@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2401021544050.1322202@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB7862:EE_|AM4PEPF00027A6C:EE_|AS4PR08MB7901:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f7f3fe0-3146-4e27-5a11-08dc10739396
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VxJeOADd4IrWN5DL8Viwm0HfDOQOpNndso3VDJMYDFzt8Ff7L4MhWHr+6TMFmlQwkkpRVvqFuDg7yWWXpc7rRo2jNemJGRYC3Q1wMatyF2pVUtawdNKbe5pmhC65lNW4G51+t1FEpbx+RcD0tOyU7ccj3202EccmixpOy7GOnsWsMgn+UdmbUXqPnLC+H8UnbCcRRhRc1fH+EMYsSX6NhI9loof++ZTew8AuzKYnbaXd0kUZnV31KGa0tXxODvEhaKNIBLbiuPS6qtzfazzrCxFdiEz/ZeORer04EgkWyUj0e50PHTwvTrXyJfJWfeEd3EHtxorbHyq1MPuumCLNw2+Zcnz5z+ek9K/CBYf3MCdi/XBMRRcD+1uDtEwJpReJyS8N11xDY5RPGrcy8uP3oHqstC1byIH8BBbughS9a+nP667cuQi8l34zpYI7HEAyp+6bhUBkL9EIpX71FG93LPjlbPNL6JM8YnG7RLiyW9e8QZRWFQ/ixsOLyHcFvFk5LJFVNZk7ROqS6zcLXSrgbtHAFVodP8a+CntUvIxLyTnwUylnrNdjmF52KhB+5gkcjmM79+wkA0JsbfDAHxlyALsX95riA4y8Io4P71YvYyYVCwaKh1z1uiPzSCIc5XvkhEkEnGi8FfCdSLd35xWeVw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(6486002)(2616005)(26005)(478600001)(71200400001)(6512007)(6506007)(83380400001)(4744005)(5660300002)(2906002)(41300700001)(66446008)(66556008)(66946007)(64756008)(6916009)(316002)(76116006)(54906003)(91956017)(8936002)(8676002)(4326008)(66476007)(38070700009)(38100700002)(122000001)(36756003)(86362001)(33656002)(66899024)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <300D68267A0FC340A15CEEEB52DF523D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7862
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	84652c0c-7cd7-4ca8-e81c-08dc10738aa6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s6Tmfz1vEwCojx0/jVVAPGu7TgPFtUOa3nUo8EbZgE2rv7OKK0s5dqS5DoCxVanl5DH6CMCoV4EvFGUFemp2IofSq1gB2rTAzK1RAaPLXXK8BIEfcQNpqvYndSS5+tmXjWXcFBbRQYdld1vxkVLkAKVRJJl8dwEEhq8+UkM7JhDL4uPeJxxNzIDnxSxv6BYm2M+5pSMvJNn8deVtGzuHnC7xND6Y29ITQchbrQ1U1CF4pBffi4ahPzTUQrr+wUZH5DGfGIo9/kAu0JIAVmdRpGvHu8r9dv/wCZT4KF43B5yZqH6nkwJqyKdFsJkZLIknt5DVY5nqfkZQg4REWgEe1RyB+JCSAOzt129kDMsauIEzqFN6AzJuKWBiEBe4ZL2o8W1nksIRsvkbCs2+GYrBJFb0EabGB0G5hG/gBvHJatje981Nva1UxMi4Wbm9BiqszWfD9ofPWvFTvDTS/RC2l5bPnA+NSMxH6Ti4aMT/Go2egkvrNNwmgX7GaZlUFFD/azRx/VNIccllU4LKm+QOf2JYFKmSljIejpe9x6nP5BHDO42shjgH020sWf2yjK4zt4PVfJ7vb5wVWncOw3JIEk1/gGFA8e+UvJG23HxX0sx2MgVoFZ4+LcKCi4qtjqdaw4egFU6SJq5vudBj1X/6e9FR/RSm5KL4EB0fxw0d4YMVjtrSlDoZFiURokSwk2baGNduVElVeMsbVzpREChl0sZhsq9eEtuK4CBN40a8lBmQffgWsXMV0W1mOHAy05gc
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(186009)(1800799012)(82310400011)(451199024)(64100799003)(46966006)(40470700004)(36840700001)(107886003)(2616005)(66899024)(8936002)(8676002)(26005)(6506007)(6512007)(83380400001)(4744005)(336012)(41300700001)(6486002)(54906003)(86362001)(4326008)(36756003)(316002)(6862004)(2906002)(5660300002)(33656002)(70586007)(70206006)(478600001)(36860700001)(356005)(81166007)(47076005)(82740400003)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 17:59:36.2686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7f3fe0-3146-4e27-5a11-08dc10739396
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7901

>=20
>>>> I found the way we dealt with MISRA rules quite helpful. We had a week=
ly
>>>> meeting to discuss some of the rules and then the outcome was posted o=
n
>>>> the ML. Maybe we should do the same here? Any other suggestion how to
>>>> move?
>>>=20
>>> I have mixed feelings with meetings like the Misra ones. That's probabl=
y
>>> unavoidable because of it being a goal to move fast. I'm not sure the
>>> same applies here.
>>=20
>> I think in this situation is less about moving fast but more about makin=
g a
>> closure of the 3 years+ discussion about the coding style.
>=20
> Exactly. The meeting is useful to find alignment in a more fruitful way.
>=20
> We don't have many MISRA rules left to discuss anyway. We could discuss
> the codestyle changes after MISRA or in parallel.

Hi Stefano,

this is a very good idea, discussing that in a meeting would ease a lot the
explanation for the clang-format configurable.

Cheers,
Luca


