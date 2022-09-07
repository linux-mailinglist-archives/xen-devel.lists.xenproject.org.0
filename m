Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827CA5B0531
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 15:34:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401740.643657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvBu-0002pL-V6; Wed, 07 Sep 2022 13:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401740.643657; Wed, 07 Sep 2022 13:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvBu-0002lp-Pu; Wed, 07 Sep 2022 13:34:06 +0000
Received: by outflank-mailman (input) for mailman id 401740;
 Wed, 07 Sep 2022 13:34:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2HvF=ZK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oVvBt-0002lh-5j
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 13:34:05 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00087.outbound.protection.outlook.com [40.107.0.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd7a2088-2eb1-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 15:34:04 +0200 (CEST)
Received: from DB6PR0801CA0049.eurprd08.prod.outlook.com (2603:10a6:4:2b::17)
 by VE1PR08MB5872.eurprd08.prod.outlook.com (2603:10a6:800:1aa::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 13:34:01 +0000
Received: from DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::91) by DB6PR0801CA0049.outlook.office365.com
 (2603:10a6:4:2b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 13:34:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT058.mail.protection.outlook.com (100.127.142.120) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 13:34:00 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Wed, 07 Sep 2022 13:34:00 +0000
Received: from 27396e6e561f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 97AA8E2B-3527-43F7-903E-630C36689147.1; 
 Wed, 07 Sep 2022 13:33:50 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 27396e6e561f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Sep 2022 13:33:50 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAWPR08MB9448.eurprd08.prod.outlook.com (2603:10a6:102:2e3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.16; Wed, 7 Sep
 2022 13:33:44 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 13:33:44 +0000
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
X-Inumbo-ID: bd7a2088-2eb1-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VbrYs81XDThBxU7zKwjmR5dRW7NtHi/VC9Guxe3GcKvIjVTR19IYzVsovwiuOIUDmtr+uhst8d7qWnz0LTZZ2CD7nm+EDH+y2oYjnDElregdC6+ZZtaPnbyw2sn+KcC6egJKophVt+GCFqzAEjZvY4eH9OAEfb4lWVxi0QddahNlkdrNVtvz6+/6aNs/mB69tA5hq4TnKkz7c37zq7hqkYkW9+lwyL/LwTc97UzyCiQVy87WpHsi8C8h1urG4TN8PP5WA2FND64uGmb+XUxI2KWC+dtqH9MbXgRK7s18YoeKZgsc8kmdCeeGl/zNQ9yvucOBRQxUAJzy+vwmiVURZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuZzUcl6bP6YQegikl/YSnNYl1eEsfkj4+jFTbGGkAY=;
 b=LM8oSe+zjxiTSA5cgDfcpeWMbnDnORE7E5m7lJMEzv213Eyh4YguUK6DaOfcpP7W9JZiJGzyqBRmF7pBpXTl2EyIowjlaq/CGDwAAFH4pDWqF+dB0qDpeVokv6hjHQK/kVbVWe6Py3BPEo5d46e5eBBwWkstG/+SILEwGfhzRdaTvft4DxR2jnqYMlVPwWEdCVPoCuKYsQ7ICgWq8TcseQsrIiirqGuHa7NA2BDFbe/4QXiqze2EUvp14oVqgAYQbVAvHfsBA3ts5rMVT9P2Rj2fkv3D3WVz/jsZXNHne79RjAPQ7WoxnkFFtfsb3F+n2htof8/uwWDw7me06M59fQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuZzUcl6bP6YQegikl/YSnNYl1eEsfkj4+jFTbGGkAY=;
 b=FJQ4syXa7V8IRtiLO/ZSkI7kePJJmpId1LEFeP/hjqgS8EO1JVjnEQWYukoF6YVH9xUSlrAM3Glu2k7BCI0iSRdsnCSdpzuPsm7asa/BRAoAL9nzudlTiv2edAEE4CiWADpUNUuQK1AptWPLAtQ5NXIjKE4rMTL2vNt+xol3N9Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2818d83e49491b65
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gxf0UmPBhDBzuf10JlfM2ndCQccpnLnkAX0S4D9vkXH47LdU8gO7NKp2tm3S2jnseFFP4fMY9mcoCK7LiOFuSdUr5Htx3JAyVAgYyZ86s1tKDH6lVJpf0xCu9yV8NpERGjAX8wgrROzF6qImRn1Xk2rvgz3E5wdSouo1XuOGh+CHLgYopTOalj3eVWU92tEQ+ZgCGTo/KpQEWi2AgW34TPfT+jpRCJ3ORg5LCQ6G0I9X9/VgRVIgI1Pf8LLZq0JQ+V91TDglzaevd0SHaL6J1DJenwbW/dFpUpL8Aw7cMqc2xp0uQYBhAhAfl1DXKvrwbMuhQB46DpW1O7jXzdJzhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuZzUcl6bP6YQegikl/YSnNYl1eEsfkj4+jFTbGGkAY=;
 b=k968bPOJXbuedz0YlyyvAcMObmlKMf1z4k/9Qc0OIU2azF9Y18uxZOTdqsoSsOscrQYFy5tr4uQG0fIqEivwZblQIEPt516UBM1ixh1l8GSfxN0xMvC2YFOPOagRpaWHeLUBwvcGXnmE88q/3v+t6aPeQioMZrAWDnWEbvx6MgWPNcQHDoX7CqIMduNRWa9Yl9nei6AzG9ECLyOL9J72Zd0MVavexdb99Tog8gVZsmVbNxLrKyOMPOVrA2TNaYfcj88GXPuQ5Wltd+zUWNzG+3o/T5FvosVTrQ47rU2KPu874G/JEcTi3CryzcJVFPgYFOf32fEb/Bc/6tfvTEjNGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yuZzUcl6bP6YQegikl/YSnNYl1eEsfkj4+jFTbGGkAY=;
 b=FJQ4syXa7V8IRtiLO/ZSkI7kePJJmpId1LEFeP/hjqgS8EO1JVjnEQWYukoF6YVH9xUSlrAM3Glu2k7BCI0iSRdsnCSdpzuPsm7asa/BRAoAL9nzudlTiv2edAEE4CiWADpUNUuQK1AptWPLAtQ5NXIjKE4rMTL2vNt+xol3N9Y=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Penny Zheng <Penny.Zheng@arm.com>
Subject: Re: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Topic: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Thread-Index:
 AQHYwpUJ4p6pfICa8EGhkwL2mg6iHK3T1xaAgAAKD4CAAAVdgIAAAr4AgAAA5ICAAAbIgIAABXCAgAAA4QCAAAB+gA==
Date: Wed, 7 Sep 2022 13:33:43 +0000
Message-ID: <4B69D9F9-04AC-4042-AF74-F51630816208@arm.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-3-Henry.Wang@arm.com>
 <968529ba-3a9d-0812-1a5f-430d467e827f@xen.org>
 <9a66b6df-bc37-d836-8175-3b98be07c696@amd.com>
 <e5e9a62d-6072-463e-6c4c-8d94aa29589b@xen.org>
 <a29a07fd-40ad-602f-9a79-a36783ada947@amd.com>
 <e8bf68b1-0217-c8cd-4864-ea7fe415fb0a@xen.org>
 <b0b85a1c-ff00-ea06-a960-e49799d507eb@amd.com>
 <ED046919-0B75-48C6-900F-44F3295553B7@arm.com>
 <7997786c-78ff-47df-12de-d1fe38e5624d@amd.com>
In-Reply-To: <7997786c-78ff-47df-12de-d1fe38e5624d@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ad1ba62f-d2f7-4664-5f98-08da90d59fa8
x-ms-traffictypediagnostic:
	PAWPR08MB9448:EE_|DBAEUR03FT058:EE_|VE1PR08MB5872:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pq0VWNlThaGLTTG/P1uY1rgpAWY0axcR2FvFsaHbW6uOHXMpkHe1vcJTPyIyAplTpjsJUFV4gL/OC/Lj1K9wERnHLtT18aQluluydRWoKiRDDX0JW8Dg9OMe7GaVeS7xtuYEzANsZYGyJ00p58fRktyoLfsjcwMqbfrPOWbO/moyOSCeJGjrinOJvtGzafbqd2IOqOKaBFNneUT7mMzTlMM7xDS1N9PTXyk41/wJKeKP5vuoc1tXMtzv99lUge04HUr6fhVrhmMxDCCYKc0O7ybEJ3s2CkxuXmZ0/JYcgP/SdcxPEIkyprIF5wNqH+k51TOw6DZs8gRIHcXkzNi48pOeUDzUOLv57Z+fQ9tkOyYXz0qnAfjrvUNG6wH+tFJBRJZrVFq+sWGUG6GRdxNaltkAIrANJOjMnWcsMB1gTevYuY7YA8mcZTCSj9fhjV/6NiMMuzFci+9BIgUq1IAv42OU53nMAyMeVP8ck/Byg369v7d2870tb4jSF6wijip5ErIRBp2kBBCzhpEBbUJ5bieZPwcR2Hffr0PvHVFAjT6i2NXx+VgrozwzarizSpiRlHnAcz4qV2w+kkKh+miIiiZ0s+nk3jOpIpLUl0oMR0RGQkU6KC9EEx2nmd2kUfq6pYUkD48rNmnuI3qlQwxB3tIKSZCJ8Qkpf3gDLjvh+cAE2VFGbwh2C6I08vsKAPzdbHavAoSSjcW8z5tYRoYOEdwoaME1VHERJRghQQIsyTqR0V+K/LQljelkqvFWkRzujoUQNpHU1K2fg368oL7j1z+AO5SeIgnF+9M9Ew8T0rars68vIqMfKSzGx9bg85O6+P82OiLqy4Dk9tqDQeW48A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(366004)(39860400002)(346002)(36756003)(2616005)(53546011)(5660300002)(8936002)(26005)(186003)(86362001)(33656002)(6486002)(478600001)(6512007)(41300700001)(71200400001)(6506007)(966005)(38070700005)(66446008)(38100700002)(45080400002)(122000001)(91956017)(66946007)(316002)(76116006)(83380400001)(54906003)(8676002)(2906002)(6916009)(66556008)(66476007)(4326008)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <911B95FBB040F7439FA7EEC13D3F82EC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9448
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e6d1011c-b3c8-4830-4f73-08da90d595ad
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wyo7YWY/nYL4lKWa/plGHViuYj87Il75lJ/NjHgoTOEdB4kF638iMU68fHJEoU41pGVhV/YFFtNGIscqj1GUbmlvt9onKKYBC/Q3rOG9RUiKn2AcwCTDSsQq3/MWq5dyux/tEjRJ0j7wKNtvCSPyOdeJT3CdsfhtMleW3BumJszxiFY75923cvdTDY3KAIzy8nwLbSBmGDcUaV0FSTa06jXUmqGWK48TFKAQp4ToE1irwtbiH/fOWHlnbr8QVuGq133I5CEeUAfHWZn3iyyKB95GUiztNJAOJXhf6r8OTFHY76VkZGPdf9gEM2JioWyq7xx3hSB0w3w3O+VmmUkw1msXethrVUlhIMpU2mk6ZD8NSNOeupo3eyItTBUys3MpdfQfes19kFV4pukJbhc+ppkFWLL69QpnztVlOdsCLXgstZdbxXZ0IptJ1h/PbKC5eyXn8g58DRgqevgeS2JYdz3JIgmAXGp0vpfKyG2lhDFGc47yRSthlHq1kVH29M5b+TTWmAvSmzUw9WfDeQ+C/ziqpeeBnF5HO/xTt16vpyoaOB5vIGWjHflcK8o/EJnobkSXD3Sdqmj+kU2HBh207Uxb6aZP7Y7Cg0+Q3vRsS/iJYYcOQ+C4Mu8obdVjDaeuOqN5gPqCvuXbMiEG26YlUfIVprQbcTEh11RFacRL3vR9IMoANb6VUt1U2FQnjFhevx88gp9B4aVGWTxLr9Y59vlDor91FnQEhULLfYUB1HrO68cYhZoP3TzGg7hdHW13bs6NNcMlVufdIxGrOBGOodzMvk/16m91ijAOnn7blaM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(396003)(346002)(376002)(36840700001)(40470700004)(46966006)(54906003)(336012)(47076005)(41300700001)(316002)(2616005)(40480700001)(8676002)(70206006)(70586007)(186003)(4326008)(86362001)(6506007)(36756003)(33656002)(53546011)(478600001)(6486002)(966005)(26005)(6512007)(40460700003)(6862004)(8936002)(2906002)(36860700001)(5660300002)(82310400005)(45080400002)(81166007)(83380400001)(356005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 13:34:00.7392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad1ba62f-d2f7-4664-5f98-08da90d59fa8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5872

DQoNCj4gT24gNyBTZXAgMjAyMiwgYXQgMTQ6MzEsIE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVs
QGFtZC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAwNy8wOS8yMDIyIDE1OjI4LCBCZXJ0
cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gDQo+PiBIaSBNaWNoYWwsDQo+PiANCj4+PiBPbiA3IFNl
cCAyMDIyLCBhdCAxNDowOSwgTWljaGFsIE9yemVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4gd3Jv
dGU6DQo+Pj4gDQo+Pj4gDQo+Pj4gT24gMDcvMDkvMjAyMiAxNDo0NSwgSnVsaWVuIEdyYWxsIHdy
b3RlOg0KPj4+PiANCj4+Pj4gT24gMDcvMDkvMjAyMiAxMzo0MSwgTWljaGFsIE9yemVsIHdyb3Rl
Og0KPj4+Pj4gDQo+Pj4+PiANCj4+Pj4+IE9uIDA3LzA5LzIwMjIgMTQ6MzIsIEp1bGllbiBHcmFs
bCB3cm90ZToNCj4+Pj4+PiBbQ0FVVElPTjogRXh0ZXJuYWwgRW1haWxdDQo+Pj4+Pj4gDQo+Pj4+
Pj4gT24gMDcvMDkvMjAyMiAxMzoxMiwgTWljaGFsIE9yemVsIHdyb3RlOg0KPj4+Pj4+PiBIaSBK
dWxpZW4sDQo+Pj4+Pj4gDQo+Pj4+Pj4gSGkgTWljaGFsLA0KPj4+Pj4+IA0KPj4+Pj4+PiBPbiAw
Ny8wOS8yMDIyIDEzOjM2LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+
IEhpIEhlbnJ5LA0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBXaGlsZSByZXZpZXdpbmcgdGhlIGJpbmRp
bmcgc2VudCBieSBQZW5ueSBJIG5vdGljZWQgc29tZSBpbmNvbnNpc3RlbmN5DQo+Pj4+Pj4+PiB3
aXRoIHRoZSBvbmUgeW91IGludHJvZHVjZWQuIFNlZSBiZWxvdy4NCj4+Pj4+Pj4+IA0KPj4+Pj4+
Pj4gT24gMDcvMDkvMjAyMiAwOTozNiwgSGVucnkgV2FuZyB3cm90ZToNCj4+Pj4+Pj4+PiArLSB4
ZW4sc3RhdGljLWhlYXANCj4+Pj4+Pj4+PiArDQo+Pj4+Pj4+Pj4gKyAgICBQcm9wZXJ0eSB1bmRl
ciB0aGUgdG9wLWxldmVsICJjaG9zZW4iIG5vZGUuIEl0IHNwZWNpZmllcyB0aGUgYWRkcmVzcw0K
Pj4+Pj4+Pj4+ICsgICAgYW5kIHNpemUgb2YgWGVuIHN0YXRpYyBoZWFwIG1lbW9yeS4gTm90ZSB0
aGF0IGF0IGxlYXN0IGEgNjRLQg0KPj4+Pj4+Pj4+ICsgICAgYWxpZ25tZW50IGlzIHJlcXVpcmVk
Lg0KPj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+PiArLSAjeGVuLHN0YXRpYy1oZWFwLWFkZHJlc3MtY2Vs
bHMgYW5kICN4ZW4sc3RhdGljLWhlYXAtc2l6ZS1jZWxscw0KPj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+
PiArICAgIFNwZWNpZnkgdGhlIG51bWJlciBvZiBjZWxscyB1c2VkIGZvciB0aGUgYWRkcmVzcyBh
bmQgc2l6ZSBvZiB0aGUNCj4+Pj4+Pj4+PiArICAgICJ4ZW4sc3RhdGljLWhlYXAiIHByb3BlcnR5
IHVuZGVyICJjaG9zZW4iLg0KPj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+PiArQmVsb3cgaXMgYW4gZXhh
bXBsZSBvbiBob3cgdG8gc3BlY2lmeSB0aGUgc3RhdGljIGhlYXAgaW4gZGV2aWNlIHRyZWU6DQo+
Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+ICsgICAgLyB7DQo+Pj4+Pj4+Pj4gKyAgICAgICAgY2hvc2Vu
IHsNCj4+Pj4+Pj4+PiArICAgICAgICAgICAgI3hlbixzdGF0aWMtaGVhcC1hZGRyZXNzLWNlbGxz
ID0gPDB4Mj47DQo+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICN4ZW4sc3RhdGljLWhlYXAtc2l6ZS1j
ZWxscyA9IDwweDI+Ow0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBZb3VyIGJpbmRpbmcsIGlzIGludHJv
ZHVjZSAjeGVuLHN0YXRpYy1oZWFwLXthZGRyZXNzLCBzaXplfS1jZWxscw0KPj4+Pj4+Pj4gd2hl
cmVhcyBQZW5ueSdzIG9uZSBpcyB1c2luZyAje2FkZHJlc3MsIHNpemV9LWNlbGxzIGV2ZW4gaWYg
dGhlIHByb3BlcnR5DQo+Pj4+Pj4+PiBpcyBub3QgInJlZyIuDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+
IEkgd291bGQgbGlrZSBzb21lIGNvbnNpc3RlbmN5IGluIHRoZSB3YXkgd2UgZGVmaW5lIGJpbmRp
bmdzLiBMb29raW5nIGF0DQo+Pj4+Pj4+PiB0aGUgdHJlZSwgd2UgYWxyZWFkeSBzZWVtIHRvIGhh
dmUgaW50cm9kdWNlZA0KPj4+Pj4+Pj4gI3hlbi1zdGF0aWMtbWVtLWFkZHJlc3MtY2VsbHMuIFNv
IG1heWJlIHdlIHNob3VsZCBmb2xsb3cgeW91ciBhcHByb2FjaD8NCj4+Pj4+Pj4+IA0KPj4+Pj4+
Pj4gVGhhdCBzYWlkLCBJIGFtIHdvbmRlcmluZyB3aGV0aGVyIHdlIHNob3VsZCBqdXN0IHVzZSBv
bmUgc2V0IG9mIHByb3BlcnR5DQo+Pj4+Pj4+PiBuYW1lLg0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBJ
IGFtIG9wZW4gdG8gc3VnZ2VzdGlvbiBoZXJlLiBNeSBvbmx5IHJlcXVlc3QgaXMgd2UgYXJlIGNv
bnNpc3RlbnQgKGkuZS4NCj4+Pj4+Pj4+IHRoaXMgZG9lc24ndCBkZXBlbmQgb24gd2hvIHdyb3Rl
IHRoZSBiaW5kaW5ncykuDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4gSW4gbXkgb3BpbmlvbiB3ZSBzaG91
bGQgZm9sbG93IHRoZSBkZXZpY2UgdHJlZSBzcGVjaWZpY2F0aW9uIHdoaWNoIHN0YXRlcw0KPj4+
Pj4+PiB0aGF0IHRoZSAjYWRkcmVzcy1jZWxscyBhbmQgI3NpemUtY2VsbHMgY29ycmVzcG9uZCB0
byB0aGUgcmVnIHByb3BlcnR5Lg0KPj4+Pj4+IA0KPj4+Pj4+IEhtbW0uLi4uIExvb2tpbmcgYXQg
WzFdLCB0aGUgdHdvIHByb3BlcnRpZXMgYXJlIG5vdCBleGNsdXNpdmUgdG8gJ3JlZycNCj4+Pj4+
PiBGdXJ0aGVybW9yZSwgSSBhbSBub3QgYXdhcmUgb2YgYW55IHJlc3RyaWN0aW9uIGZvciB1cyB0
byByZS11c2UgdGhlbS4gRG8NCj4+Pj4+PiB5b3UgaGF2ZSBhIHBvaW50ZXI/DQo+Pj4+PiANCj4+
Pj4+IEFzIHdlIGFyZSBkaXNjdXNzaW5nIHJlLXVzYWdlIG9mICNhZGRyZXNzLWNlbGxzIGFuZCAj
c2l6ZS1jZWxscyBmb3IgY3VzdG9tIHByb3BlcnRpZXMgdGhhdCBhcmUgbm90ICJyZWciLA0KPj4+
Pj4gSSB0b29rIHRoaXMgaW5mbyBmcm9tIHRoZSBsYXRlc3QgZGV2aWNlIHRyZWUgc3BlY3MgZm91
bmQgdW5kZXIgaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/
dXJsPWh0dHBzJTNBJTJGJTJGd3d3LmRldmljZXRyZWUub3JnJTJGc3BlY2lmaWNhdGlvbnMlMkYm
YW1wO2RhdGE9MDUlN0MwMSU3Q21pY2hhbC5vcnplbCU0MGFtZC5jb20lN0M4M2RhMWViOWQzMjQ0
MWNiOWU4MTA4ZGE5MGQ0ZjJkNiU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdD
MCU3QzAlN0M2Mzc5ODE1NDE1Mzk4NTE0MzglN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lq
b2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4w
JTNEJTdDMzAwMCU3QyU3QyU3QyZhbXA7c2RhdGE9M005YVQzTGpDRU9oWlVIV1NiZ1NTbUtwcFkx
V2lvbjRUVDNCZUtMbldTbyUzRCZhbXA7cmVzZXJ2ZWQ9MDoNCj4+Pj4+ICJUaGUgI2FkZHJlc3Mt
Y2VsbHMgcHJvcGVydHkgZGVmaW5lcyB0aGUgbnVtYmVyIG9mIDx1MzI+IGNlbGxzIHVzZWQgdG8g
ZW5jb2RlIHRoZSBhZGRyZXNzIGZpZWxkIGluIGEgY2hpbGQgbm9kZSdzIHJlZyBwcm9wZXJ0eSIN
Cj4+Pj4+IGFuZA0KPj4+Pj4gIlRoZSAjc2l6ZS1jZWxscyBwcm9wZXJ0eSBkZWZpbmVzIHRoZSBu
dW1iZXIgb2YgPHUzMj4gY2VsbHMgdXNlZCB0byBlbmNvZGUgdGhlIHNpemUgZmllbGQgaW4gYSBj
aGlsZCBub2Rl4oCZcyByZWcgcHJvcGVydHkiDQo+Pj4+IA0KPj4+PiBSaWdodC4gQnV0IHRoZXJl
IGlzIG5vdGhpbmcgaW4gdGhlIHdvcmRpbmcgc3VnZ2VzdGluZyB0aGF0DQo+Pj4+ICNhZGRyZXNz
LWNlbGxzIGFuZCAjc2l6ZS1jZWxscyBjYW4ndCBiZSByZS11c2VkLiBGcm9tIFsxXSwgaXQgaXMg
Y2xlYXINCj4+Pj4gdGhhdCB0aGUgbWVhbmluZyBoYXMgY2hhbmdlZC4NCj4+Pj4gDQo+Pj4+IFNv
IHdoeSBjYW4ndCB3ZSBkbyB0aGUgc2FtZT8NCj4+PiBJIHRoaW5rIHRoaXMgaXMgYSBtYXR0ZXIg
b2YgaG93IHNvbWVvbmUgcmVhZHMgdGhlc2Ugc2VudGVuY2VzLg0KPj4+IEkgZG8gbm90IHRoaW5r
IHRoYXQgc3VjaCBkb2N1bWVudHMgbmVlZCB0byBzdGF0ZToNCj4+PiAiVGhpcyBwcm9wZXJ0eSBp
cyBmb3IgdGhlIHJlZy4gRG8gbm90IHVzZSBpdCBmb3Igb3RoZXIgcHVycG9zZXMuIg0KPj4+IFRo
ZSBmaXJzdCBwYXJ0IG9mIHRoZSBzZW50ZW5jZSBpcyBlbm91Z2ggdG8gaW5mb3JtIHdoYXQgaXMg
c3VwcG9ydGVkLg0KPj4+IA0KPj4+IE9uIHRoZSBvdGhlciBoYW5kLCBsb29raW5nIGF0IFsxXSB0
aGVzZSBwcm9wZXJ0aWVzIGdvdCBuZXcgcHVycG9zZXMNCj4+PiBzbyBJIHRoaW5rIHdlIGNvdWxk
IGRvIHRoZSBzYW1lLiBOb3cgdGhlIHF1ZXN0aW9uIGlzIHdoZXRoZXIgd2Ugd2FudCB0aGF0Lg0K
Pj4+IEkgdGhpbmsgaXQgaXMgZG9hYmxlIHRvIGp1c3QgaGF2ZSBhIHNpbmdsZSBwYWlyIG9mICNh
ZGRyZXNzLyNzaXplIHByb3BlcnRpZXMuDQo+Pj4gRm9yIGluc3RhbmNlIHhlbixzaGFyZWQtbWVt
IHJlcXVpcmluZyBqdXN0IDB4MSBmb3IgYWRkcmVzcy9zaXplDQo+Pj4gYW5kIHJlZyByZXF1aXJp
bmcgMHgyLiBUaGlzIHdvdWxkIGp1c3QgaW1wbHkgcHV0dGluZyBhZGRpdGlvbmFsIDB4MDAuDQo+
PiANCj4+IEkgdGhpbmsgd2Ugd2FudCBpbiBnZW5lcmFsIHRvIHJlZHVjZSBjb21wbGV4aXR5IHdo
ZW4gcG9zc2libGUuDQo+PiBIZXJlIHdlIGFyZSBhZGRpbmcgYSBsb3Qgb2YgZW50cmllcyBpbiB0
aGUgZGV2aWNlIHRyZWUgd2hlcmUgd2Uga25vdyB0aGF0DQo+PiBpbiBhbGwgY2FzZXMgaGF2aW5n
IG9ubHkgMiB3aWxsIHdvcmsgYWxsIHRoZSB0aW1lLg0KPj4gDQo+PiBJIGFtIG5vdCBjb252aW5j
ZWQgYnkgdGhlIGFyZ3VtZW50cyBvbiBub3QgdXNpbmcgI2FkZHJlc3MtY2VsbHMgYW5kIHdpbGwN
Cj4+IGxlYXZlIHRoYXQgb25lIHRvIFN0ZWZhbm8NCj4+IA0KPj4gQnV0IGluIGFueSBjYXNlIHdl
IHNob3VsZCBvbmx5IGFkZCBvbmUgcGFpciBoZXJlIGZvciBzdXJlLCBhcyB5b3Ugc2F5IHRoZQ0K
Pj4gb25seSBpbXBsaWNhdGlvbiBpcyB0byBhZGQgYSBjb3VwbGUgb2YgMCBpbiB0aGUgd29yc3Qg
Y2FzZS4NCj4gSSBhZ3JlZS4gVGhlIG9ubHkgZHJhd2JhY2sgaXMgdGhlIG5lZWQgdG8gbW9kaWZ5
IHRoZSBhbHJlYWR5IGludHJvZHVjZWQgcHJvcGVydGllcw0KPiB0byBiZSBjb2hlcmVudC4NCg0K
QWdyZWUsIHNvbWVvbmUgd2lsbCBuZWVkIHRvIGRvIGEgcGFzcyBvbiB0aGUgd2hvbGUgZG9jIHdo
aWNoIG1pZ2h0IGJlIGVhc2llciB3aXRoIGFsbCB0aGluZ3MgaW4uDQoNCkNoZWVycw0KQmVydHJh
bmQNCg0KPiANCj4+IA0KPj4gQ2hlZXJzDQo+PiBCZXJ0cmFuZA0KPj4gDQo+Pj4gDQo+Pj4+IA0K
Pj4+PiBDaGVlcnMsDQo+Pj4+IA0KPj4+PiAtLQ0KPj4+PiBKdWxpZW4gR3JhbGwNCg0K

