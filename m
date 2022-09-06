Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19345AF70B
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:39:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400196.641861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgI7-00039U-LI; Tue, 06 Sep 2022 21:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400196.641861; Tue, 06 Sep 2022 21:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgI7-00032C-17; Tue, 06 Sep 2022 21:39:31 +0000
Received: by outflank-mailman (input) for mailman id 400196;
 Tue, 06 Sep 2022 21:39:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Bts=ZJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oVgG4-0000Cs-5F
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:37:26 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2046.outbound.protection.outlook.com [40.107.104.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52214944-2de9-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 15:39:25 +0200 (CEST)
Received: from DB8P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::14)
 by AS8PR08MB5925.eurprd08.prod.outlook.com (2603:10a6:20b:23d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Tue, 6 Sep
 2022 13:39:22 +0000
Received: from DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::17) by DB8P191CA0004.outlook.office365.com
 (2603:10a6:10:130::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Tue, 6 Sep 2022 13:39:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT008.mail.protection.outlook.com (100.127.142.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 13:39:22 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Tue, 06 Sep 2022 13:39:22 +0000
Received: from 45ba75dd94ea.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2DAA1697-7755-4562-9DB6-B556C53A27F9.1; 
 Tue, 06 Sep 2022 13:39:16 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 45ba75dd94ea.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Sep 2022 13:39:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Tue, 6 Sep
 2022 13:39:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Tue, 6 Sep 2022
 13:39:15 +0000
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
X-Inumbo-ID: 52214944-2de9-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Cd85VEMN9pp0Eko9Acsa9JaTC5VjEvXegEXy6tY4IdSoO4OLQcXk6pNv8P8oL4L8sgIlb3Ks5Kw9HcKUz0f7NUNEt7T5L0h7WLcwiwJpwpKnmwOv6zHhtTJawn8Eb3+21AAs/FhEj7TL5gr8JUa3xJmkDk35RjKvzv8uVwHak5+aDyeIj7aaKMTWosRcpy0IZTv6S6iQg+Rwu062/K/ht4PpJ8iX0+htRt2KRZSDLUJhZ9/etxU1CNaHN3a3qykxosMm/jjEPiYDb+QooWQ1COsdXX7A9kDnQILdbcGzyj3pp+14VN3a7c+Cg9vnggQ3fTbJi3Yozb1SDEpKhEQojA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVAlHBxa9WEe0XuoVY9Uw69t/Lji3A7G+OQ0S4NLccQ=;
 b=H9SXldM2KfDSa5PNSHABhd5HKx7LxMZGjh4Ki9cElbsFx4dCcacgmFHyiRrE98QYWe+19iXKVYaUShYvn8P1VySzbfw6u9HTPoUqETsTdGnoxyygokVC9+C4cK3wSjqk0XO27m6pkTBt9egeYzKi0YVicyKfXGd2l2SzqNH4dg9XV0TiccZs0Yc6VXa0ndukbsgj9V2LubwuOGlmw8RgzfOBJvney28Q46lGRwd5ifUEZMiGgQMQkchv+N3Sb2od7VGJo5cnQD7MXFqm3Zuaw6Te/bkvfB03jZBioF8pjSEe7cguCapUJh6g7YEOCCO+OTIlOdHOP5/VyaY6/ljkbw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVAlHBxa9WEe0XuoVY9Uw69t/Lji3A7G+OQ0S4NLccQ=;
 b=ZEXJrBJ3ivSJ/npKiigwhNkNQjF40pFFKSg0CPTtwb4fU+JrOAhbVwIMtDAXNOlN3LJoVJX0RxShdYSwUlJCYPsOJh2sbdgOhxjuEzYJ7TnyZ5FGXEoO4oXnTbuNzooukslznTT/ljJiE3aJlbZVXsXj0z6yEgdX0stx7LetGzc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPaVyECqfOwxfk9qt7xaGPPieg5IXlJI8bxTI3elFNAryx8CpF/6sdYYyD72BzvzSoY2E/3ocmliFZeXOMuYWRPW3NOzvx0xZN6QkVcSMbU6mPVBNLG3Qbpj8uA3v26PMii+fwEgSMEu1OYnlOhq1+03nZJtsk7kbtnn2mzZxKXjJlwbzXUyuHjp51XXAy9wiIf2YPdQkOkWVE0rwg3JwRLsAx3M14kMQfZLH04JcBerMVNzeZ+g3yKq6mRehq/umtQYva/RP9ZIxAkzYjFuAW+SceZ1MQHK/LrFyQTU/2n5LSapeTJElZL1Za6MOFVl27B9jG2kbSOjaFcLA8qBDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVAlHBxa9WEe0XuoVY9Uw69t/Lji3A7G+OQ0S4NLccQ=;
 b=nqMwpL1F8s2ShKWHr8qdgzG2O9Gq6dB8rkCvvTV0KXAu1TGrjIWwwsLH/AOVRG8du8VYhm4LH7Mz3FEoRBSRFzCDDiBFRqZ2yUAkonwmkoLHJHqIkXfaPd6GEFPmcLdjM3fHftGI/OwZkDcKKafEUqWKfEf+vNl+jOiGhDiEdVBXwDbtrnHIQRqlcqc26zF7F3/ZEhPVKaX6eSworHgHqfw9BExasC2JjyBCYLa0c11KmogKrMcQThcgeexHZ2KMds4mndU3PEZxiBPyQ9uIZuFNV1aXyBjnGbBRL0KokacBfU/wdufD3CWhPnfB+o8kqeCZylJBz9PUCF7dsM5G5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVAlHBxa9WEe0XuoVY9Uw69t/Lji3A7G+OQ0S4NLccQ=;
 b=ZEXJrBJ3ivSJ/npKiigwhNkNQjF40pFFKSg0CPTtwb4fU+JrOAhbVwIMtDAXNOlN3LJoVJX0RxShdYSwUlJCYPsOJh2sbdgOhxjuEzYJ7TnyZ5FGXEoO4oXnTbuNzooukslznTT/ljJiE3aJlbZVXsXj0z6yEgdX0stx7LetGzc=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 3/4] xen/arm: Handle reserved heap pages in boot and
 heap allocator
Thread-Topic: [PATCH v2 3/4] xen/arm: Handle reserved heap pages in boot and
 heap allocator
Thread-Index:
 AQHYwPj6dlOKXE+k5kuuj2vKrDnG5K3RJT6AgAB0+PCAAIHpAIAAAbyAgAA7oYCAAA2RAA==
Date: Tue, 6 Sep 2022 13:39:14 +0000
Message-ID:
 <AS8PR08MB7991257101D33E17C66CD0F2927E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220905072635.16294-1-Henry.Wang@arm.com>
 <20220905072635.16294-4-Henry.Wang@arm.com>
 <57082fec-e9ce-eeda-d051-d75a4bc35909@xen.org>
 <AS8PR08MB79915EEF32D662929B1657A3927E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e4b2721b-8ddc-080f-e602-a3c02b2a13f8@xen.org>
 <AS8PR08MB7991B12952F889C8C44540D2927E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <60a55b4b-4bf5-7325-e603-6abdc56234e3@xen.org>
In-Reply-To: <60a55b4b-4bf5-7325-e603-6abdc56234e3@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4A80D8DCD9C86E4ABCD61424155355CC.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1a79888a-8432-4868-db93-08da900d3508
x-ms-traffictypediagnostic:
	PA4PR08MB6032:EE_|DBAEUR03FT008:EE_|AS8PR08MB5925:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 n39a4i1zSjFJkOSpmscS54yEn5RGFOqcv/LrYe5wtgFdNWbV3Lmc2H0M5Qus09EHTE3NHeSu/RwctuOEzuQ0ds5z8DxbhcbSjsz9dMg2YlaAYrD9PdekLUChYbZAB7V6NCC249GFPcZBO30rIVgNx7FVap3GguqSIjBSZFC3bpWquz5yTXL62Ifhr5WPhkjx8JmnCv+DKD6K8KnF8Y/ZRHVsuNlHNGOW+hGRebej0MBsB2U6N1M9xVRVxWfwfdInKqH09xvEqPTAnbOL7PpqfaT35UO7RDqd3gyqrDAcjMA1QfzOjcIJQhXjgXCCbXGypmZ/71uykqrO/Xsp9JWKStSAJwoik7oNL5xU2jQjDcJootM7olMK6QLLrlrg5TuxL/R2Fqiu6HRU8Micltv9/DqwVq5aDYaXqGS6q4MyX0t1ZLURZqJrKA+1Nc7QW+7pZlTnB13XMpR2MpupCYpvdXSJh4ugWhEct1zQikvptbLTCZhYP1fXstqkk6jGRNKD8jUBRHwgMV8hPEwqXqw+ni/5pHAufhoiOivi+vBcLPeNNfCSQLapQE4gH9wqQpBhoc+5romHdPBq3UAtK5I4ozoBQpiu7SA5firDNAq36ulBd0R1LiQY1AAEctWgmqlnMwVY/tIxMolF1a6wOOSVwgVBDciuU/0oZareYIentkUhiH1i0xeAQqcthuqT0CyyGIQ3S8MHG/9Ku7nXKkKrGebAHU3vOJXca7t+xcF0GotmKFPB/ZkH6/oNzEUi7xwgJwpTAkyweuxcnceX/VIDHQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(39860400002)(396003)(366004)(26005)(83380400001)(5660300002)(52536014)(2906002)(8936002)(6506007)(7696005)(41300700001)(33656002)(9686003)(86362001)(71200400001)(186003)(478600001)(38070700005)(8676002)(55016003)(66446008)(66556008)(66946007)(76116006)(54906003)(110136005)(316002)(66476007)(64756008)(38100700002)(4326008)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	25a15f10-d255-4c6a-a4a8-08da900d308c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	05TXMvAndogZI3fqzq/csrXDizBk7pA5JuKKkMrNU0jau+BwY5pjDICLB3nt4CpripYjk2ZCQnwUif/pZTnJgNcVeCxjmZbbfKQZDiYEctUqxMSHSDFe5ROHWC86AUHQvde5ylTWsYXorkV9HCQWs15Ar/Ad97bWUGcjjVqDVJO0NzmusdjgFHKxAyDZpMkjWjCTTjTj1r8HXIvh0WPtVh0Xo0iRI9jZyuL97XSOl+79dm9+JQmxjMzO+QX08zx6wpbsG95NZJVIT3PCpBmw00fcPxv85o5/topWmFUAVHJI4/jenBuKoujdxZLtfaaUeXtA+cUdT92fMKTZbvO4Vrdaj0r/9Kon0HpUtBiPhgEn223XFUi7tO95bJ2eh9C3MAA4EWebXnwMIe4TrNp6VrfojcjvzqEOzesOLm47MsJ6eCto0f0EaUOXTAwzrYx6yeyX90jl5HO2LJXdXAQNFLaw1YVXPXP8RCSRtPQk8df20767BRfy7LeemDKoUuXQWab0QvxUEwiY2qLSwvPmmc8vHD3IFj9yvZcUIsgrr45EM15/C8Uw+Xg3/AuIpExh1xRxgu2ibZHtroF626P+0JCSeaCbtFrhdgc57L+Qfo/W8AQ+Q/k9QUFlmdg2pCZVoJYQ362tsrFOJgoRCkUsLxc8ejdHvi9an9gHxoT7PnSPVOS9J1O4RqTCOwJMdgLF0BQr2Nlrl3A8SH2JfqUslVreHgqxR31vaC8/L/00xRPJO4tPyYeac0hEYrY94fqM46gQuhAS5IUpnuRcXrrVwg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(396003)(136003)(46966006)(36840700001)(40470700004)(316002)(82740400003)(33656002)(70586007)(70206006)(8676002)(4326008)(86362001)(81166007)(36860700001)(356005)(83380400001)(47076005)(41300700001)(6506007)(7696005)(478600001)(26005)(107886003)(9686003)(40480700001)(55016003)(40460700003)(110136005)(54906003)(2906002)(82310400005)(336012)(186003)(8936002)(5660300002)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 13:39:22.4937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a79888a-8432-4868-db93-08da900d3508
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5925

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4gSSBhZ3JlZSB3ZSBuZWVkIHRvIHJlcXVpcmUg
NjRLQiBhbGlnbm1lbnQsIGFuZCBjdXJyZW50bHkgd2UgYXJlIGZvbGxvd2luZw0KPiA+IHRoaXMg
YmVjYXVzZSB3ZSBhcmUgZG9pbmcgMzJNQiBhbGlnbm1lbnQuDQo+IEhtbW0uLi4gSSB0aGluayB3
ZSBhcmUgdGFsa2luZyBhYm91dCB0d28gZGlmZmVyZW50IHRoaW5ncyBoZXJlLiBXaGF0IEkNCj4g
YW0gcmVmZXJyaW5nIHRvIGlzIHRoZSBhbGlnbm1lbnQgb2YgdGhlIHN0YXJ0L2VuZCBvZiB0aGUg
cmVnaW9uIHByb3ZpZGVkDQo+IGJ5IHRoZSBhZG1pbi4NCg0KQWhoIHNvcnJ5IG15IGJhZCwgeWVh
aCBJIHNob3VsZCBhZGQgdGhlIGFsaWdubWVudCByZXF1aXJlbWVudCBpbiBkdC1iaW5kaW5nLg0K
V2lsbCBkbyB0aGF0IGluIHYzLg0KDQo+IA0KPiBbLi4uXQ0KPiANCj4gPj4gTm90ZSB0aGF0IHRv
IGhhbmRsZSBhcm0zMiwgeW91IHdpbGwgYWxzbyBuZWVkIHRvIGV4Y2x1ZGUgdGhlIHhlbmhlYXAN
Cj4gYXJlYS4NCj4gPg0KPiA+IFdoZW4gSSBpbXBsZW1lbnQgdGhlIGNvZGUsIEkgZm91bmQgdGhh
dCB0aGUgYXJtMzIgWGVuaGVhcCBleGNsdWRpbmcNCj4gbG9naWMNCj4gPiBzb21laG93IGNhbiBi
ZSByZXVzZWQuDQo+ID4NCj4gPiBTbyBJIHRoaW5rIEkgdHJpZWQgdG8gcmV1c2UgYXMgbXVjaCBh
cyBjdXJyZW50IGNvZGUuIFdvdWxkIGJlbG93DQo+ID4gcG9wdWxhdGVfYm9vdF9hbGxvY2F0b3Io
KSBzZWVtIG9rIHRvIHlvdT8NCj4gDQo+IEkgd291bGQgcHJlZmVyIGlmIHRoZXkgYXJlIHNlcGFy
YXRlIGJlY2F1c2UgdGhlIGxvZ2ljIGNhbiBiZSBzaW1wbGlmaWVkDQo+IHdoZW4gdXNpbmcgdGhl
IHN0YXRpYyBoZWFwICh0aGUgeGVuaGVhcCBjYW5ub3QgYWNyb3NzIGEgcmVnaW9uKS4NCg0KSSB0
aGluayB3aGV0aGVyIHNlcGFyYXRlIHRoaXMgbG9naWMgb3Igbm90IGlzIHBlcnNvbmFsIHRhc3Rl
LCBJIGRpZCBtaXNzDQp0aGUgInhlbmhlYXAgY2Fubm90IGFjcm9zcyB0aGUgYmFuayIgcGFydCBz
byBJIGFncmVlIHlvdXIgc3VnZ2VzdGlvbg0KaXMgYmV0dGVyLCBidXQgSSB0aGluay4uLg0KDQo+
IA0KPiBTb21ldGhpbmcgbGlrZToNCj4gDQo+IGZvciAoIGkgPSAwOyBpIDwgYmFua3MtPm5yX2Jh
bmtzOyBpKysgKQ0KPiB7DQo+IA0KPiAjaWZkZWYgQ09ORklHX0FSTV8zMg0KPiAgICAgIGlmICgg
KGJhbmtfc3RhcnQgPj0gbWZuX3RvX21hZGRyKGRpcmVjdF9tZm5fc3RhcnQpICYmDQo+ICAgICAg
ICAgICAgIGJhbmtfZW5kIDwgbWZuX3RvX21hZGRyKGRpcmVjdF9tZm5fc3RhcnQpICkNCg0KLi4u
IHRoaXMgaXMgcHJvYmFibHkgd3Jvbmcgb3IgSSBtaXN1bmRlcnN0b29kPyBJTUhPIHRoZSB4ZW5o
ZWFwDQppcyBhbHdheXMgc21hbGxlciAob3IgZXF1YWwpIHRoYW4gdGhlIGJhbmssIGJhc2VkIG9u
IHRoZSBsb2dpYyB0aGF0DQpmaW5kaW5nIGEgY29udGlndW91cyB4ZW5oZWFwIGluIGEgYmFuay4N
Cg0KU28gdGhlIGNvZGUgSSBwcm9wb3NlIHdvdWxkIGJlOg0KYGBgDQpAQCAtNzEyLDEyICs3MTIs
MzcgQEAgc3RhdGljIHZvaWQgX19pbml0IHBvcHVsYXRlX2Jvb3RfYWxsb2NhdG9yKHZvaWQpDQog
ew0KICAgICB1bnNpZ25lZCBpbnQgaTsNCiAgICAgY29uc3Qgc3RydWN0IG1lbWluZm8gKmJhbmtz
ID0gJmJvb3RpbmZvLm1lbTsNCisgICAgcGFkZHJfdCBzLCBlOw0KKw0KKyAgICBpZiAoIGJvb3Rp
bmZvLnN0YXRpY19oZWFwICkNCisgICAgew0KKyAgICAgICAgZm9yICggaSA9IDAgOyBpIDwgYm9v
dGluZm8ucmVzZXJ2ZWRfbWVtLm5yX2JhbmtzOyBpKysgKQ0KKyAgICAgICAgew0KKyAgICAgICAg
ICAgIGlmICggYm9vdGluZm8ucmVzZXJ2ZWRfbWVtLmJhbmtbaV0udHlwZSAhPSBNRU1CQU5LX1NU
QVRJQ19IRUFQICkNCisgICAgICAgICAgICAgICAgY29udGludWU7DQorDQorICAgICAgICAgICAg
cyA9IGJvb3RpbmZvLnJlc2VydmVkX21lbS5iYW5rW2ldLnN0YXJ0Ow0KKyAgICAgICAgICAgIGUg
PSBzICsgYm9vdGluZm8ucmVzZXJ2ZWRfbWVtLmJhbmtbaV0uc2l6ZTsNCisjaWZkZWYgQ09ORklH
X0FSTV8zMg0KKyAgICAgICAgICAgIC8qIEF2b2lkIHRoZSB4ZW5oZWFwLCBub3RlIHRoYXQgdGhl
IHhlbmhlYXAgY2Fubm90IGFjcm9zcyBhIGJhbmsgKi8NCisgICAgICAgICAgICBpZiAoIHMgPD0g
bWZuX3RvX21hZGRyKGRpcmVjdG1hcF9tZm5fc3RhcnQpICYmDQorICAgICAgICAgICAgICAgICBl
ID49IG1mbl90b19tYWRkcihkaXJlY3RtYXBfbWZuX2VuZCkgKQ0KKyAgICAgICAgICAgIHsNCisg
ICAgICAgICAgICAgICAgaW5pdF9ib290X3BhZ2VzKHMsIG1mbl90b19tYWRkcihkaXJlY3RtYXBf
bWZuX3N0YXJ0KSk7DQorICAgICAgICAgICAgICAgIGluaXRfYm9vdF9wYWdlcyhtZm5fdG9fbWFk
ZHIoZGlyZWN0bWFwX21mbl9lbmQpLCBlKTsNCisgICAgICAgICAgICB9DQorICAgICAgICAgICAg
ZWxzZQ0KKyNlbmRpZg0KKyAgICAgICAgICAgICAgICBpbml0X2Jvb3RfcGFnZXMocywgZSk7DQor
ICAgICAgICB9DQorDQorICAgICAgICByZXR1cm47DQorICAgIH0NCg0KICAgICBmb3IgKCBpID0g
MDsgaSA8IGJhbmtzLT5ucl9iYW5rczsgaSsrICkNCiAgICAgLyogVGhlIG9yaWdpbmFsIGxvZ2lj
IGluIHBvcHVsYXRlX2Jvb3RfYWxsb2NhdG9yKCkqLw0KYGBgDQoNCktpbmQgcmVnYXJkcywNCkhl
bnJ5DQoNCg==

