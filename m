Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 770045B1A0D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 12:33:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403070.645045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWEqC-00028U-Ii; Thu, 08 Sep 2022 10:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403070.645045; Thu, 08 Sep 2022 10:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWEqC-000259-Fe; Thu, 08 Sep 2022 10:33:00 +0000
Received: by outflank-mailman (input) for mailman id 403070;
 Thu, 08 Sep 2022 10:32:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5itv=ZL=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oWEqA-000253-C5
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 10:32:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2044.outbound.protection.outlook.com [40.107.22.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99c9c0a4-2f61-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 12:32:55 +0200 (CEST)
Received: from AM6PR0502CA0059.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::36) by PR3PR08MB5787.eurprd08.prod.outlook.com
 (2603:10a6:102:90::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Thu, 8 Sep
 2022 10:32:54 +0000
Received: from AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::dc) by AM6PR0502CA0059.outlook.office365.com
 (2603:10a6:20b:56::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.15 via Frontend
 Transport; Thu, 8 Sep 2022 10:32:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT014.mail.protection.outlook.com (100.127.140.163) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 10:32:53 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Thu, 08 Sep 2022 10:32:53 +0000
Received: from 0760df3306f7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5066997B-6B8D-434C-8894-736714CDBEDD.1; 
 Thu, 08 Sep 2022 10:32:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0760df3306f7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Sep 2022 10:32:46 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DBAPR08MB5575.eurprd08.prod.outlook.com (2603:10a6:10:1a6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Thu, 8 Sep
 2022 10:32:43 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::85e5:3479:7350:9113]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::85e5:3479:7350:9113%6]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 10:32:42 +0000
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
X-Inumbo-ID: 99c9c0a4-2f61-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fx4ZgF4/Vw5mvI9/o4IsfpIYUJbzRjNtqBKS16agBH/lI/qhOz7we/Zx7TnvrNci3vRegtcQsNRFzWSMHL4VUxgFbh5Fn3ctfHvGplo+GYGJTzcF9JjvIR0Z1xEXlPJf0qEdHyRz7otQ6pwiuGYm205fGUFMpi2OoKLIrklm7Eldo0acDq9Ve1lagphYx2rJm2XiK1yL9iFzZ7tRNG3oDB6rvp3YbBV6ovbqpt52AHKW6bMesiJyW82PWBRejjmuqwQBjK2bq3aDcq1Uy0i1mWU+3jH+xau6ytWRWx7l1AcOQMsRRF3pwjqeGSnzTNg8HHhs/DX6cLkuHWxYwGjpUA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86mQ3s5PdSfQK/enWDVhI/uQV2rqmWgUz/s8WjUqcGs=;
 b=HPT068Q7Gk1FF45HX/Qz0FB7vuv9Eo6cAOS/It4IXQ9Pl0yVlJViw78UlWVMsxJfkIpNeQYfQXL+aowMerKtuSnB1N/cYSSmW9y+FGGmEeTBsNrO4NXVJKx4znhSB9dsCxpXuE2ONJcSDdVww/TgiQUYgvhNQVJ+d4ziquZCOF8YfavA4bkqEXby4JOARJtZ+uUmuD1TNiE5lPHk8m1pIW2AyI++fhTXw3cbyjmxaTRhvvWFr/quorlufiNrrC5K77FCpVhXeEqJBIcOvimlvDb6b9QbA1oooIkwbFAMXsrTRxWZsug70yRs9mzj/l5T3Jx4avLPE69H6YHdzlWHpg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86mQ3s5PdSfQK/enWDVhI/uQV2rqmWgUz/s8WjUqcGs=;
 b=BpiFDzNyXA0Z9sPdNDfu9E8zZbih6mgHk7tG50t9TEOVoUIWi0PLEu+0tefv2kA9mWIKloMHiMQYBjKKS0O71R8dqcHmSuSCaXPsz0wC0/nHx83rlV5F4eLFn6lx33wi/x03Q9zQ8Xe65Vu8iylYmDtpIWx1yfK7M/TUqalx49A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c1f1fded5b0d48c6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFUwsdOR+U+NH3omwrZM82SmNQunm5/B7t9BPGScikNHCVG3QptCRRqnm+AUAMFd0LAo5720rxKOslSpkj/rlNE6bXRtQwWapyxlQlQynN2coJ/GjmVE0z//AcpFuJGWTpHHrLrXEMS/oakgoTdM1SraJtGfeKTLs3JF4yPF80w+TPwqDjesq/FwksUMY+aeV5G6bMm26Dkc2mTtxC8djkRNSiyI+xKBd0lQjCvi/WS6oVvK85PLNF2xTMcwadLIekJKCRdKlO83riZGvrjLzOoWWHQFgLE4CkXgCBT9VDexFSDvBBe0C1kpwGryzDvvuXV0mK//AoXQBPFDKkPziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86mQ3s5PdSfQK/enWDVhI/uQV2rqmWgUz/s8WjUqcGs=;
 b=YsSUaqhU/OTi2l5HrWmAQfAy392Q6dv8cnXAi7g+xN0hgHJaGFnLHCdKOPC4HUOrnF10jaduFkbUkmzgPuhoBMFR6Dfqcf3UmSRnuigpdd6ArVVznjvEX3r332jXBaChZDIzmLcLaHTxzUOED7bwYTPKCZc9I6h/6o9CDg/MioXkDh0XYyu7bQgiO0I/DapYjUAmUTBo7ek0nwm5bFTgFQGG7XcLjFDCb2m5qJ+uqBSFf+XziznCv6KSGQGZ5ycYhnBdpw+iMOLKdJjlNa87rn/CVQwaqghjkm5ohJH5W/qRLn49LntEHfoAmGXj1D89ZtwjEEjN22qzPhJKjAK+8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86mQ3s5PdSfQK/enWDVhI/uQV2rqmWgUz/s8WjUqcGs=;
 b=BpiFDzNyXA0Z9sPdNDfu9E8zZbih6mgHk7tG50t9TEOVoUIWi0PLEu+0tefv2kA9mWIKloMHiMQYBjKKS0O71R8dqcHmSuSCaXPsz0wC0/nHx83rlV5F4eLFn6lx33wi/x03Q9zQ8Xe65Vu8iylYmDtpIWx1yfK7M/TUqalx49A=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <a5df9b8e-4925-30e0-e0de-4062ac4cf9f2@arm.com>
Date: Thu, 8 Sep 2022 18:32:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220902033121.540328-1-wei.chen@arm.com>
 <20220902033121.540328-3-wei.chen@arm.com>
 <f775642b-7b44-86b2-70df-540069bc6674@suse.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <f775642b-7b44-86b2-70df-540069bc6674@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0210.apcprd04.prod.outlook.com
 (2603:1096:4:187::7) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB7420:EE_|DBAPR08MB5575:EE_|AM7EUR03FT014:EE_|PR3PR08MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 28f03fdb-0cfb-40a3-d3c1-08da91857ce3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 G+GnSIDffmOHFlsPwlLE47EGKl5fuPvC8Jlc20xYVyiWW7zPQRz/mQI4GoyV+X4mDQEhgE6OeJqX4rrq/dnRd4ZgqMFu1cotkwZoL6kLYhys1zwKogcbVwnPAj5UwvibjGWB8hJkjWkDHSYiUd4Y+8govIuQ0rM99QLIcVX00q6TSEyAxNk1nzrNejZmuyBsmnrNL0O8AQ4ayqgV2j6CyXWyUoaFS5OzFomqf3WZ1OoT7zqUrYqWnvrZCJNaOJKpPe0E0tY3upJIeP84jzaA5vNKCFI9z2k18pyTi5hyrJQMOrqf2e+W1aw9g413ueXusxZb1gZHh91qdg4YYxSy+YxvAXGe/7w2xaqxaR9UUBY2Qiz/pBU4NLdx93fjAwtKxw3+IrDnTMstE+gtxGQiSNWotEtFPnN4EyJT2TfXk9+TT2EP2QK0JN3B1eRmU9D9z+RPDW3+g9Q+3F+pH+NqkVeMZwdBeioBhSsbjBXq9QinF33PxS7lCgQyDdoyV3zxZ6sGFB5Z/Cw2n7MgKBhKDZsFxAc3ala0GTwAul/l1AY8z/A42DGY9jV2EtkGopZQ/1SZms9tSa2tX0SlohGR14j7N/S2TjaYGEBBvY8cLf+FDHougamJStgRQnf2JmupF7FLT50vHGAJ8sx3x7jjXp2HKdbwjEua2QdR/QeoKCePmmhQtVHpIvFKWBUf5X4hnRFILAy5qP/zFjFYgyaQUC1Y4OIADom5p+ft/Ql9+uW28PEj/9Bn4p+mUNze74Ln1lEhBg1DUUVjIikLpwkHoJAZXKLgtqnQN04c7HQAJnU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(83380400001)(186003)(2616005)(41300700001)(6486002)(478600001)(6666004)(86362001)(6512007)(31696002)(26005)(53546011)(6506007)(38100700002)(54906003)(6916009)(316002)(8936002)(2906002)(4326008)(31686004)(8676002)(66556008)(66476007)(36756003)(66946007)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5575
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c6aa6c48-197f-49b1-4b32-08da918575f6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X3n9tnDH5SbIHrk+4G35cNmTu41/N8xBjybG00zjNdCXFeFiRtJxuSDYu13NFUZYXR5nfH6Wee/Fko7UOfFnlhT+4B0IuFz4LkvnyDmDOGM4o4VC4qsGcRrR7FlkSts0nX5Stw9qDMRquaCTD2mZjm/+EoSw2h+1sZcl9AVWEfSFZB7YdImwiKinn3fNK43budBZ6P2q0ic6NPxxoXdZ21eOIMBcHuUUT8iAh+VS53E3zJscRPyd8driXARkl3YSdUzTJctmc5X/pfBql1lUgitukb75mk0yMNkiPhC1nt+JNdJv7X1Vtbd67s1xIH9QURAXPOfFauAWzbTURUQ2GffixE4Hi9OP4mBvsTBh1PKXMDjG5NrXGry1OjyviwCd93yKm9i+/X0tNm7dmEZm7RlXg5OK8b0dJD7SCBdf261LQj1aton8cikTgncWxpmj2vclhRnrqLZEV/We7qTXlXxaOJltbctXGetEn57yDnxt/JekKKxSE//tTkcOemSVa/ic8b4Z50Nt4pMsNBD9PrNxLkTI/f/DvUv2Xmfzmr1gbJ0t6CSomK05U+q+usnFFjaPKMOqli7RKVMKiezToTEREmaV4RpgCKxwhQpYEeEtv6ufBxjItbZLZWp63H1ds1NkJMw1zm7hguh3yz1Ue/gme3UAreZU36JWxGcyHDkuNQWJJgHxC0l6CcMdxmtwzJ8SaKEwKh3WGX8zl1rHlW6SHJJehou9vtPN+VgyALbydfv3CiJSyJPXmATvXDaGUWjKr9gzIJv1ctuMcPnJOaPutEcSFqjTghyTTQCLKpA8RBLTQ8b49sI7QBIEBJu4
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(346002)(376002)(396003)(46966006)(36840700001)(40470700004)(316002)(2616005)(54906003)(82310400005)(31696002)(186003)(86362001)(356005)(81166007)(47076005)(336012)(6506007)(41300700001)(478600001)(6666004)(6512007)(26005)(6486002)(6862004)(8936002)(5660300002)(40460700003)(36756003)(2906002)(31686004)(40480700001)(36860700001)(53546011)(70586007)(70206006)(83380400001)(8676002)(82740400003)(4326008)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 10:32:53.7548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f03fdb-0cfb-40a3-d3c1-08da91857ce3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5787

Hi Jan,

On 2022/9/8 17:09, Jan Beulich wrote:
> On 02.09.2022 05:31, Wei Chen wrote:
>> --- /dev/null
>> +++ b/xen/common/numa.c
>> @@ -0,0 +1,442 @@
>> +/*
>> + * Generic VM initialization for NUMA setups.
>> + * Copyright 2002,2003 Andi Kleen, SuSE Labs.
>> + * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
>> + */
>> +
>> +#include <xen/init.h>
>> +#include <xen/keyhandler.h>
>> +#include <xen/mm.h>
>> +#include <xen/nodemask.h>
>> +#include <xen/numa.h>
>> +#include <xen/param.h>
>> +#include <xen/sched.h>
>> +#include <xen/softirq.h>
>> +
>> +struct node_data __ro_after_init node_data[MAX_NUMNODES];
>> +
>> +/* Mapping from pdx to node id */
>> +unsigned int __ro_after_init memnode_shift;
>> +unsigned long __ro_after_init memnodemapsize;
>> +uint8_t *__ro_after_init memnodemap;
>> +static uint8_t __ro_after_init _memnodemap[64];
> 
> These last two want to use nodeid_t instead of uint8_t. Originally
> the latter used typeof(*memnodemap) for (I think - iirc it was me who
> made it that way) this reason: That way correcting memnodemap's type
> would have propagated without the need for further adjustments.
> 

Thanks for this info, should I need to restore it to use
"typeof(*memnodemap)" in next version ?

>> +nodeid_t __read_mostly cpu_to_node[NR_CPUS] = {
>> +    [0 ... NR_CPUS-1] = NUMA_NO_NODE
>> +};
>> +
>> +cpumask_t __read_mostly node_to_cpumask[MAX_NUMNODES];
>> +
>> +nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
>> +
>> +bool __read_mostly numa_off;
> 
> The v3 review discussing this possibly becoming __ro_after_init didn't
> really finish (you didn't reply to my latest request there), but you
> also didn't change the attribute. Please clarify.
> 

I think I had answered your question by:
 >> I think yes, it will be used in numa_disabled and numa_disabled will
 >> be called in cpu_add."

And you replied me with:
 > In the original code I cannot spot such a path - can you please point
 > out how exactly you see numa_disabled() reachable from cpu_add()? I'm
 > clearly overlooking something ..."

But there is a time difference here, your reply was sent after I sent 
v3, maybe you didn't notice it

About the new question:
cpu_add will call srat_disabled, srat_disabled will access numa_off.
srat_disabled is a function without __init.

>> +static int __init populate_memnodemap(const struct node *nodes,
>> +                                      unsigned int numnodes, unsigned int shift,
>> +                                      nodeid_t *nodeids)
> 
> Can't this be pointer-to-const, and then also in the caller?
>

Yes, it's possible, I will fix it.

>> +static unsigned int __init extract_lsb_from_nodes(const struct node *nodes,
>> +                                                  nodeid_t numnodes)
>> +{
>> +    unsigned int i;
>> +    nodeid_t nodes_used = 0;
> 
> This once again is a variable which doesn't really hold a node ID (but
> instead is a counter), and hence would better be unsigned int (see
> ./CODING_STYLE).
>

Ok.

>> +    unsigned long spdx, epdx;
>> +    unsigned long bitfield = 0, memtop = 0;
>> +
>> +    for ( i = 0; i < numnodes; i++ )
>> +    {
>> +        spdx = paddr_to_pdx(nodes[i].start);
>> +        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
>> +        if ( spdx >= epdx )
>> +            continue;
>> +        bitfield |= spdx;
>> +        nodes_used++;
>> +        if ( epdx > memtop )
>> +            memtop = epdx;
>> +    }
>> +    if ( nodes_used <= 1 )
>> +        i = BITS_PER_LONG - 1;
>> +    else
>> +        i = find_first_bit(&bitfield, sizeof(unsigned long)*8);
> 
> Please add the missing blanks around * .
> 

Ok.

>> +    memnodemapsize = (memtop >> i) + 1;
>> +    return i;
> 
> Please add the missing blank line before the (main) return statement
> of the function.
> 

I'll fix him and other places, if there are any.

>> +int __init compute_hash_shift(const struct node *nodes,
>> +                              nodeid_t numnodes, nodeid_t *nodeids)
> 
> While I agree that nodeid_t can hold all necessary values, I still
> don't think a cound should be expressed by nodeid_t. As above - see
> ./CODING_STYLE.
> 

Ok.

>> +{
>> +    unsigned int shift;
>> +
>> +    shift = extract_lsb_from_nodes(nodes, numnodes);
>> +    if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
>> +        memnodemap = _memnodemap;
>> +    else if ( allocate_cachealigned_memnodemap() )
>> +        return -1;
>> +    printk(KERN_DEBUG "NUMA: Using %d for the hash shift.\n", shift);
> 
> This wants to be %u now. I'd also like to ask to drop the full stop
> at this occasion.

Ok, that makes sense.

> 
>> +    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
>> +    {
>> +        printk(KERN_INFO "Your memory is not aligned you need to "
>> +               "rebuild your hypervisor with a bigger NODEMAPSIZE "
>> +               "shift=%d\n", shift);
> 
> Again %u please.
> 

Ack.

>> +/* initialize NODE_DATA given nodeid and start/end */
>> +void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
> 
> Please capitalize the first letter of the comment (see ./CODING_STYLE).
> 

Ok.

>> +void __init numa_init_array(void)
>> +{
>> +    unsigned int i;
>> +    nodeid_t rr;
>> +
>> +    /*
>> +     * There are unfortunately some poorly designed mainboards around
>> +     * that only connect memory to a single CPU. This breaks the 1:1 cpu->node
>> +     * mapping. To avoid this fill in the mapping for all possible
>> +     * CPUs, as the number of CPUs is not known yet.
>> +     * We round robin the existing nodes.
>> +     */
> 
> Along with the style correction re-flowing of the text would have been
> nice, such the lines aren't wrapped seemingly randomly without utilizing
> permitted line length.
> 

I will adjust it.

>> +void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
>> +{
>> +    unsigned int i;
>> +    paddr_t start = pfn_to_paddr(start_pfn);
>> +    paddr_t end = pfn_to_paddr(end_pfn);
>> +
>> +#ifdef CONFIG_NUMA_EMU
>> +    if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
>> +        return;
>> +#endif
>> +
>> +#ifdef CONFIG_NUMA
>> +    if ( !numa_off && !numa_scan_nodes(start, end) )
>> +        return;
>> +#endif
>> +
>> +    printk(KERN_INFO "%s\n",
>> +           numa_off ? "NUMA turned off" : "No NUMA configuration found");
>> +
>> +    printk(KERN_INFO "Faking a node at %"PRIpaddr"-%"PRIpaddr"\n",
>> +           start, end);
>> +    /* setup dummy node covering all memory */
> 
> Please again capitalize the first character of the comment.
> 

Ok.

>> +static void cf_check dump_numa(unsigned char key)
>> +{
>> +    s_time_t now = NOW();
>> +    unsigned int i, j, n;
>> +    struct domain *d;
>> +    struct page_info *page;
> 
> Along with the various other style corrections perhaps add const here?
> 

I will add it.

>> +    unsigned int page_num_node[MAX_NUMNODES];
>> +    const struct vnuma_info *vnuma;
>> +
>> +    printk("'%c' pressed -> dumping numa info (now = %"PRI_stime")\n", key,
>> +           now);
>> +
>> +    for_each_online_node ( i )
>> +    {
>> +        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
>> +
>> +        printk("NODE%u start->%lu size->%lu free->%lu\n",
>> +               i, node_start_pfn(i), node_spanned_pages(i),
>> +               avail_node_heap_pages(i));
>> +        /* sanity check phys_to_nid() */
> 
> First char of comment again.
> 

Ok.

Thanks.
Wei Chen

> Jan

