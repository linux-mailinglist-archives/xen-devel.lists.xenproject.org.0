Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F83567FDB
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 09:31:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361845.591601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zUp-00067V-NJ; Wed, 06 Jul 2022 07:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361845.591601; Wed, 06 Jul 2022 07:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zUp-00064B-Iv; Wed, 06 Jul 2022 07:30:51 +0000
Received: by outflank-mailman (input) for mailman id 361845;
 Wed, 06 Jul 2022 07:30:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uO3f=XL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o8zUn-0003d3-3U
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 07:30:49 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00052.outbound.protection.outlook.com [40.107.0.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8df83c53-fcfd-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 09:30:48 +0200 (CEST)
Received: from DU2PR04CA0252.eurprd04.prod.outlook.com (2603:10a6:10:28e::17)
 by AS8PR08MB6534.eurprd08.prod.outlook.com (2603:10a6:20b:31c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Wed, 6 Jul
 2022 07:30:46 +0000
Received: from DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::4b) by DU2PR04CA0252.outlook.office365.com
 (2603:10a6:10:28e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20 via Frontend
 Transport; Wed, 6 Jul 2022 07:30:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT051.mail.protection.outlook.com (100.127.142.148) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 07:30:46 +0000
Received: ("Tessian outbound 6f9e7ef31fa8:v122");
 Wed, 06 Jul 2022 07:30:46 +0000
Received: from f4987bb6deaf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0B2CB3A1-A80E-472C-BB2D-C1C6540FF577.1; 
 Wed, 06 Jul 2022 07:30:40 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f4987bb6deaf.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 07:30:40 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PR2PR08MB4731.eurprd08.prod.outlook.com (2603:10a6:101:18::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 07:30:38 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.020; Wed, 6 Jul 2022
 07:30:38 +0000
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
X-Inumbo-ID: 8df83c53-fcfd-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iz9I8mQpE16MZ40HUFjlROiH8ATALrkXCu+wA3msSgJf0rC85/fvmF1Wtxk8szwNK2mas1jxx4YxNa4LqIln3vZ+fR7W63BU9iRrQpTx5PKhY8mHu8MH8gmEwDAwGp7oREb2kuQVhxwN0G05fZOZmg8bHwhLQrnEeUw2wUudEfvR1zIWIr6Zfb+BcpjDcp/3uaNtKwBbhl5wJACykhVUBKDhirCfWJiUdYGEIrV/IMAEzKVKaiR3i5Jy0GfFvM1eswtrU1SMzc/0LRj06BS7v0NQAsjOhK3mrVFI/PxcTo0m8tRCzZPqcjFLcPctKs96Jr8Gpfvecr5cmC5QW8LJWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8+WXyd/soauYcseDQOtImG425U3uzMpi+wvqiEpPRg=;
 b=MnGIL4v1chWq8Y2lE9Wfus91CZUblACVLy4/jEclEO/OwdC4z6feSL4tFzYhpzf7WaBaBGsjV4ferUhN2l2rAqf+RvxBcMIozU/GYY+2UVs4BhpC4KgDfHljunEwoj24RRkC2QwsPJaStczA1t2IY8HukeqjHFZVfw9qKRASvUeXYv2006wEAuODwNfuRjnOhrIZkZ1ArS++pslX2SPIFiSC/0CKBcZfbwdxcDzwKQ/3UWBR0sQFSlUBx7vbQjAkG4x7GKhdZOurXBMSOjewd4bNnFOUhVUzMEXvkIBMmPbtPcs/WNpB0R7Vg+eTdisiGQm4UIILfH7gxXn1HRdtZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8+WXyd/soauYcseDQOtImG425U3uzMpi+wvqiEpPRg=;
 b=NLFZw1TM0KBZbPP8+t/leNGWX5j8TzigoEiCnaakF6zumkgzEw9RNYjltN4EAsJUNSHmuemhIe5HBTRIe+sKM54gtWB4XnNxKT1gvWEbeMhu+OuahE9RT5g0qmD21JRjVURieI04SE/QBhohte7kb+/ejBzzuB7kTxNj6J1BNVk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUe5iVNxiweeDQ0lQcQIhmgTdo8Z3x/uRzA2Kvdz3vextZRjU0FRie+iCDQDoBaNtWprfJ/wU55I4znJvELhFi0GjIkOms6geVAy3i1VVUyqVoFDDJ7W5UhsA/KilYREH49BuDqaEyqL0gKAVrC9Su6b/t3YrmyPuyvkCt8DpYOs1SQJjkJ+AkgdA5c2quBS9DCC4OZiMx4vEj2+zdW54US6bsEXtyn3DLHBDgJW6CfRK5pNp7C/TaQwLcJoqrEBPgMIjq5YWiVL7v7808wRGzcm0GY1Yaz2DJNUCgcVZGtBkj5+6APkYHeDE4SQ2kjhAIT0yjvoGksXx7hbuS5djg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8+WXyd/soauYcseDQOtImG425U3uzMpi+wvqiEpPRg=;
 b=BFJCyOZIIEgtMeqcJhdTE05uGg4Wq7KyYIddoxx8ZpCTs8Y9JBeehHQzok/OasroeNO/TbLTaRvnmnxs9hsavkmehAAL90OOk+ve0S1teYjZtMe2i1AYsd6hcng2SrEGLqtIBM0CJkrautHrUNThM+2LgCldTsuzWnEe6057Ius9/XYkvelm31LiVO1TD1TdcnmbGhRuHQr5LCHKAW9TldXbu9XA4K/xbhhGpkhoqRRWp5lZc7hnMPSkxeBh2kRAdZ+cLMoyrffCRxKeIrri+HR1UNJsd04RLeDEDeZ74BH7JGg+U5DTJGeGKcJ9aO9bewKOJ2yyUWOcXteuoJvA6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8+WXyd/soauYcseDQOtImG425U3uzMpi+wvqiEpPRg=;
 b=NLFZw1TM0KBZbPP8+t/leNGWX5j8TzigoEiCnaakF6zumkgzEw9RNYjltN4EAsJUNSHmuemhIe5HBTRIe+sKM54gtWB4XnNxKT1gvWEbeMhu+OuahE9RT5g0qmD21JRjVURieI04SE/QBhohte7kb+/ejBzzuB7kTxNj6J1BNVk=
From: Henry Wang <Henry.Wang@arm.com>
To: Yuanjun Gong <ruc_gongyuanjun@163.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>
Subject: RE: [PATCH 1/1] tools/symbols: fix memory leak in
 build_initial_tok_table()
Thread-Topic: [PATCH 1/1] tools/symbols: fix memory leak in
 build_initial_tok_table()
Thread-Index: AQHYdM1wHtv6Z/xEr0qRtuqMggPoc61xJXTQ
Date: Wed, 6 Jul 2022 07:30:38 +0000
Message-ID:
 <AS8PR08MB7991A13520B0523B9B64C30992809@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220531082320.31294-1-ruc_gongyuanjun@163.com>
 <55be7afb-dc71-fa26-a1dd-59e573b9ac4c@suse.com>
In-Reply-To: <55be7afb-dc71-fa26-a1dd-59e573b9ac4c@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0927BF2F6FF13541BB795179E22B8C72.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 44ccd279-2333-4454-188a-08da5f217130
x-ms-traffictypediagnostic:
	PR2PR08MB4731:EE_|DBAEUR03FT051:EE_|AS8PR08MB6534:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PsM/f4o/Hyn5i0K9smNd5KqV2EwNy58Ky9+D+Ct8eX/41XXqOycPCF/TjbKuQOXxjWewo6cnNW4x2JwsvgGAUQ7ngPrishvaXqvgffWrvzWTr0cHnd+voSxSwF6Is/lXJWCrXEdAWMgATH6PdC+hQuzPrhVkz8neXudI7nVRumoPqbWpbsUbfHkKwJpagQp4INRyQtvQzVEoJIeQRdufCGv0WY96pgc48+h7uNCqp6bJk0FR0Q15yiIPyN4d8TtMgrp9vjwVbN+VE+k/G7SZHCgHbsA+ahpDhdRTQNh3p6+uNaGLoSRAxiPHUYQU7AuhZY8C1oGFblyKrIlN9fifDBVi4VqnmjSgHZYJmkIsUCy810B6FZZlR1BNNeUov3k/0bDJCW7b7yAGzE9PcG68qJcjrpfSE+H9EqphYgLOYTvL3JaznVAMgdAem2GJ549SmX7mbHFqZLck+B1BXPzY8gpxX4aTXa9Kd2e9SSajhxk8g9Vcj+Wlb6BSKWi1njOhe8pA4UdY1Hn/A/ipZ/QlhzVw/24rJYuER+4CBCCKA1Bc6BuEmJr3VqNAmu1Igw833n2iQZ9JTOksJ2rJI5vmZ78+ib1AHG3QlozdO9iR84zFL6SES8M3Gd66aT9f7J+5bz+eBjxdP5z8RLuIrCn0L0WWGwrXCTKKbqLFNA30nFDdZkLFDuJUpEGXwfEOQkAd+fPTUKmPK/Su44VAJ0X9c9iyvxgTEjIvj+lOFwRFZknHsopuT5D/YKNZDwPk3TreNG6xFO2amrYxRl9Pwu1WCtEd4OrYlEpdXICztQDFQJOd0dWE734spR5zswhV9qJp
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(83380400001)(41300700001)(52536014)(186003)(8936002)(6506007)(7696005)(86362001)(5660300002)(2906002)(38070700005)(66556008)(478600001)(55016003)(8676002)(33656002)(38100700002)(4326008)(64756008)(66446008)(66476007)(76116006)(66946007)(9686003)(26005)(316002)(53546011)(71200400001)(54906003)(122000001)(6916009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4731
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4c1fb843-da76-4e55-67d9-08da5f216c50
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	63khss9tVVg27zOQk42+9ylkdy2QpynhyOqQzpZ+AbUcZpbQpVMwF32mHJzx3iwoG6QCpG2KOop6d41lsXj/uVPEoUR2l7HaGXTxAfq8k2I2+zVNN4WW14RFut+JMWp1JKm93FbuCWYj83S/YwQc/XdPIStZRI6wpd7XJ4B7hyS/aZMMq/fEjwwBKDHe1yVOdZ8Vw4EFuLDbXqefERKdKPlfNFUSnz7fadHe5SsYkZs7AwFJk41Jn3wKc6pKdvUCJwIMkWKekwgAtaEeEOXSwedTJ6b1cWuGJ7jB3awjoq3Rh0NT7/+33vO+NWu5lCoSPRu5iHsHiLmDoZ2akoJVQeTvvpJJTgApCa2bGpttn0KnKzTBXXD6chQ0QXdqbevvKTVLOYC4TpTxXJf3EIYAZopC3U38YchPVi3YHPK58K3270kas3atA2XvBTouToY0yugUayqcx7eM0VPm7AjsWSnN4ldamevRTOuIupFscyqWUBSHQ0SSLtEwRqm3yIEDj8HNIWx4csDbs5DgA8P8sZoVOu59qdemUiL3uTkmc+gn4TvTh173FUvtbzmtPRr26J2qvZhbNEafJxqLPxBtpjqdSqhbPHyIPtT0IsKR469jIzmsxe0rFss/R+l6L0qxKkMHVbCdDjg9c72BYfqhppl+KCPsGy5/DtSU2Lpn7Jjei6Lp6a1SczssQEePEPcLhptTRjJXkjHyJ99jSeTDQP0rt2wyYe3aEtSF7TRiibM/BtKZ+cL/Q85C7dCJE//ysz4YHh5WyAeGrdenv62jq6y+MoV15uLbuqZ8kGHYMwAEC29p2T5pr4yOKA2EARr4
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966006)(36840700001)(40470700004)(107886003)(9686003)(47076005)(336012)(70206006)(8936002)(52536014)(6862004)(4326008)(8676002)(70586007)(5660300002)(41300700001)(7696005)(33656002)(86362001)(55016003)(40480700001)(82310400005)(6506007)(2906002)(186003)(26005)(53546011)(478600001)(82740400003)(83380400001)(81166007)(356005)(316002)(40460700003)(54906003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 07:30:46.3727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ccd279-2333-4454-188a-08da5f217130
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6534

SGksDQoNCkl0IHNlZW1zIHRoYXQgdGhpcyBwYXRjaCBoYXMgYmVlbiBzdGFsZSBmb3IgbW9yZSB0
aGFuIGEgbW9udGgsIHdpdGgNCmZ1cnRoZXIgYWN0aW9ucyBuZWVkIHRvIGJlIHRha2VuIGZyb20g
dGhlIGF1dGhvci4gU28gSSBhbSBzZW5kaW5nIHRoaXMNCmVtYWlsIGFzIGEgZ2VudGxlIHJlbWlu
ZGVyLiBUaGFua3MhDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzFdIHRvb2xzL3N5bWJvbHM6IGZp
eCBtZW1vcnkgbGVhayBpbg0KPiBidWlsZF9pbml0aWFsX3Rva190YWJsZSgpDQo+IA0KPiBPbiAz
MS4wNS4yMDIyIDEwOjIzLCBZdWFuanVuIEdvbmcgd3JvdGU6DQo+ID4gRnJlZSB0aGUgdGFibGVb
aV0uc3ltIGZpZWxkIG9mIHRoZSBpbnZhbGlkIHN5bV9lbnRyeSBzaW5jZQ0KPiA+IGl0IGlzIG1h
bGxvYydlZCBkYXRhLg0KPiANCj4gSXQgd291bGQgaGVscCBpZiB5b3Ugc2FpZCB3aGV0aGVyIHRo
aXMgd2FzIGp1c3QgYW4gb2JzZXJ2YXRpb24gZnJvbQ0KPiBlLmcuIHN0YXRpYyBjb2RlIGFuYWx5
c2lzIHZzIHlvdSBhY3R1YWxseSBoYXZpbmcgb2JzZXJ2ZWQgdGhlIHRvb2wNCj4gcnVubmluZyBv
dXQgb2YgbWVtb3J5LiBUaGlzIGlzIGEgc2hvcnQtbGl2ZWQgcHJvY2VzcyBhZnRlciBhbGwsIHNv
DQo+ICJsZWFraW5nIiBtZW1vcnkgaXMgbm90IG5vcm1hbGx5IG11Y2ggb2YgYSBwcm9ibGVtLg0K
PiANCj4gPiAtLS0gYS94ZW4vdG9vbHMvc3ltYm9scy5jDQo+ID4gKysrIGIveGVuL3Rvb2xzL3N5
bWJvbHMuYw0KPiA+IEBAIC00MjIsNiArNDIyLDggQEAgc3RhdGljIHZvaWQgYnVpbGRfaW5pdGlh
bF90b2tfdGFibGUodm9pZCkNCj4gPiAgCQkJCXRhYmxlW3Bvc10gPSB0YWJsZVtpXTsNCj4gPiAg
CQkJbGVhcm5fc3ltYm9sKHRhYmxlW3Bvc10uc3ltLCB0YWJsZVtwb3NdLmxlbik7DQo+ID4gIAkJ
CXBvcysrOw0KPiA+ICsJCQl9IGVsc2Ugew0KPiA+ICsJCQkJZnJlZSh0YWJsZVtpXS5zeW0pOw0K
PiANCj4gSW5kZW50YXRpb24gaXMgd3JvbmcgaGVyZS4NCj4gDQo+IEphbg0KPiANCg0K

