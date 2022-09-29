Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C7F5EEF7E
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 09:45:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413495.657171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odoDB-00038u-Rs; Thu, 29 Sep 2022 07:44:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413495.657171; Thu, 29 Sep 2022 07:44:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odoDB-00036S-Oc; Thu, 29 Sep 2022 07:44:01 +0000
Received: by outflank-mailman (input) for mailman id 413495;
 Thu, 29 Sep 2022 07:44:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YTqY=2A=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1odoD9-00036M-TP
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 07:44:00 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50051.outbound.protection.outlook.com [40.107.5.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 783748bb-3fca-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 09:43:55 +0200 (CEST)
Received: from DB6P195CA0011.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::21) by
 GV1PR08MB8057.eurprd08.prod.outlook.com (2603:10a6:150:97::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.19; Thu, 29 Sep 2022 07:43:51 +0000
Received: from DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::6c) by DB6P195CA0011.outlook.office365.com
 (2603:10a6:4:cb::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Thu, 29 Sep 2022 07:43:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT063.mail.protection.outlook.com (100.127.142.255) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Thu, 29 Sep 2022 07:43:50 +0000
Received: ("Tessian outbound 99ee3885c6d5:v128");
 Thu, 29 Sep 2022 07:43:50 +0000
Received: from 256e337ed6d5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5BAC8CD6-DF22-4F7B-976C-287930D5B757.1; 
 Thu, 29 Sep 2022 07:43:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 256e337ed6d5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Sep 2022 07:43:43 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by GV1PR08MB7940.eurprd08.prod.outlook.com (2603:10a6:150:9f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 07:43:40 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::6f9a:a2b6:e5d3:349e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::6f9a:a2b6:e5d3:349e%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 07:43:39 +0000
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
X-Inumbo-ID: 783748bb-3fca-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BzfxZfLWoX2YaoWKHDs5SonuZjOaz0FmF90jikMGAXh+wPsmj2cxgSEWQtu3+ZYeB3j0KXxzscZgJVVlDKYKtHoGf6LKVt7pdCwX0UrFQZ6iP2fLPATeKb/2m1TdpMCMXaV+cKFNcqFzOqyYRD+X8DMMXpPUulk16x2xbdbrmb7ywSP68Rb1DakLUBl5bS0JqDb2stu7cN92fp1kWkzIQ9SDNKkOtvu9yTrIAkLDcyCWIRzv/f7plr8Rjeld38oNg6Z89l1J0OC3ABSVyhRvLIe7M4SW3PxROHsRdWzL8JGen0tvZB4SXMZtB9UCFEH/h+d0o3Fez17pam8Vpo9+Sg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8IsjiY1jpjUkiqZ7otyvOXn4y+HtgkY331kkTtVr94=;
 b=dZjlJT/PRJys08Z+1moNhFFURMT3ZVj2ctsawKm6JhBbt33p0w28YaTouCRoF9CMl/Y09pFDfpp42eoo7JSw2YcQsio9tU5Artlcjnf7FyYf80115Nw+PG6bEoo/M7vghToeubrI5xdYTtwefqu3Z2Augz+7Sr/ihgBoTfI0EGQQTWUPbi/VpJVljWmNyr69I0FvRmle4ssgGKa5+9CRWyoHRwkpyFHKVb6iTHASzsUcAQXR3zRHgNvMi5tIqwpsxkaLOUjTHkwoGocW1JqO+H18Nx+7iG/zS4aPyGcwsLMbcD44Sn9BaqX6pxedijZGm8d1YYLZnNmUvQLsmPsXQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8IsjiY1jpjUkiqZ7otyvOXn4y+HtgkY331kkTtVr94=;
 b=98kvI0ghnatQBOTcIPqfqs5oVZll7ZZ98PppQw7ojLDiR2hkC8ZBcj6RVw7uGW6MNxVACt7k0nzcfMhL4s6HIdZvvX049WeLq0QU5pYk0e1BJ2MaLXoVFTyWyeth/vu3o/ytNKwKl0SleTrlQwpWwMMZXWaN6gt9XvYdBsXTbvo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 82dcdce4581aef09
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtJh0/zViZ360IlmV79+2Sf6qK+3CIjqfEvleqfAN0sFiAIQkhKOazDLBChEg5COVkyrECmn4HqzpWl6NIzmDB4DTa+twjeamArXCT7wMfO4z0ZmkjMi/vguOlCtVTnzOfERZOWKZRUXCbbg+yAp9FQYMwkz1DUDFGS2L2dmYcUw+QRHPEmSq7c60zxqggvQmi3CYHVZ9iu0S+H8G1JMyMIgaL2z55+VX+wuIfX0RJGkTO9DP+PMxDM82DNAgepWwcT8OYMdGLDYOQvv7EC2DNBpjCJEw4SYpNF4h8nzucrvgLKtw4UGhhEstsmZaiuhCG4x6jsss690Mi8waQF0nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8IsjiY1jpjUkiqZ7otyvOXn4y+HtgkY331kkTtVr94=;
 b=GK4tXkcaTQRhxewDPPVFRPtpSchLNnFM1kOMUvWVSTwJ4SlAdrVug2AVM4AlGc/8w88SW4REGEaGUPhDobjZOgVpPQ+ttv6Cx3Y3SQZ/FZ1w2jo+T0ae2uwo96bbcRsA9i/oqHFWtMBDS8TWTkSnp43B1qHQJH83d3wF7Vc9NhI4vPq0zdhhLQFgYqj8tDXZhltN+cYLn6aC5fYZrYDQxrMRM/VKCKA5ALEXi+Sp+9Hxhet5yaI0zfHG/V/jDy0g4E1FCEMlHq0EHGp+mh1NDw9hEW3aAGtuZTEMfMY1u04xlUcogIILaFw+gD7cDjj9HtC3J2P+Gj88j+65JzANKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8IsjiY1jpjUkiqZ7otyvOXn4y+HtgkY331kkTtVr94=;
 b=98kvI0ghnatQBOTcIPqfqs5oVZll7ZZ98PppQw7ojLDiR2hkC8ZBcj6RVw7uGW6MNxVACt7k0nzcfMhL4s6HIdZvvX049WeLq0QU5pYk0e1BJ2MaLXoVFTyWyeth/vu3o/ytNKwKl0SleTrlQwpWwMMZXWaN6gt9XvYdBsXTbvo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <72691b9b-761e-a89b-97df-afd5cf0ddebb@arm.com>
Date: Thu, 29 Sep 2022 15:43:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v5 2/6] xen/x86: move generically usable NUMA code from
 x86 to common
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220920091218.1208658-1-wei.chen@arm.com>
 <20220920091218.1208658-3-wei.chen@arm.com>
 <359e87d9-aec7-2198-86ab-1d0f76bf567d@suse.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <359e87d9-aec7-2198-86ab-1d0f76bf567d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0216.apcprd04.prod.outlook.com
 (2603:1096:4:187::18) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB7420:EE_|GV1PR08MB7940:EE_|DBAEUR03FT063:EE_|GV1PR08MB8057:EE_
X-MS-Office365-Filtering-Correlation-Id: ce829e70-e6a1-4114-b329-08daa1ee59dd
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /OJB98wG/kMNfehpjy6MCg/uM0JusIUdL+I9KyW2laSTLIjY8qbG01UsVmFWAx7pQbUU4lxvnrvOY1XzYa+O+kp+sGu1e8Q+docgc9AG85lJCv/N3scYZj3x8fNBWVwDsFKpe2mdSLoLUjG3nR93U/FMdxUQjw9fBHPIf9pJM+zkJPs9scHDaDbxiXpWyPaGTElG/77Q/UOWtOaqXqMu0tpQxzO5PyJ9Ze50bD2ZpcKLnmVldaBIaqIQx6FwsyFJFxke8/yPHg7yUcV5Z3RJMsLGYrNWmV/o/bLE+EsiGOx9Go14z/tPpuqINXC9Qj0CafyrcCZ9CWiO0S5v4d/Gmwlq0mrcWYcbSe3CBnuPjQlCQMRzYeOFRPlxfvKeHfixDPzRx5l6Y0IWk0w6OlDpBh5oPADo1M/nZ7qzOkpc/HYQbacRLntiGvYwiCsklz7/QxgmkFPcHGEFK1NRxq34JVErHEwNsCCFyMaI/llwEIydF01SWgAJtW6mlVQP2LmHFcTXKMC0GRdxQJiRPLZ7HqSGUtho0kf9uKZYN9n9j6jydrdoNxCwsRy85B5dIIGp8m3uh/95/fJZaPhIfRn58QZc3/XChu/srqbB6MzU85BDaccd/hD+v22PJyaIueDWfOuUIW4UYC49EMcRGMZinYrgrLaX2FxyizHEElIqYOyj7E3JY3Q3oD9ziMVXPmQVk3ikRrg9+K09JLN3jHmcMD7n5TcqqL6BxWSnWvV4tBSTNEBTYwviIT3YSl+GNaR04kSLgiXPBEjw4UyDjl7aAmBke8NylRFW+AaZtrYyuB7EarBaipXYScdt2fMdpUZ9
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199015)(31686004)(2616005)(66476007)(26005)(6512007)(186003)(38100700002)(478600001)(36756003)(6506007)(316002)(53546011)(6486002)(83380400001)(2906002)(6666004)(8936002)(6916009)(5660300002)(41300700001)(54906003)(66946007)(4326008)(8676002)(66556008)(86362001)(31696002)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7940
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	062c7779-9b27-491e-25f0-08daa1ee52ee
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cNZ6rY94jFsTvhS+6kfHB0lBmQSKwuBkuR2KztVP4DqEwZL4Uishj08RRc1ySAgwdKDdqaqplt/E8cUMiNO1j6zLi0OYYhtsXsKBtLmXV2pe6vQqY+SFHTIC8oLgK6dy8TYnnSWaWFRnMkbpJTQ8IR4FAOm8R6rsA3IjF0Hr8zbPdZ12BdYhKqxCy4yqFfVizqem76FnGEjK5wMiNY2Dr74dQusMD69f/7iZOF+BUk33AjkL9+xn4la0mNR4uwFnsoQJJ9HzAPT0gEO3owJt1V47uifxpkJcnyLL19vnmRxMgwrJOoRks+Js0cVLPxx7AW6UYcBRgr5jJSDmJRGTsAQGUHfNAv0UM/Z02dXGcLwrfjlyvWVaGrLObr1vI9zj9ziE/R8Do4I4cufqkBkSk6zQjFAbS+3MVOLXjeZr05BOuB71gyRAkZFkMwijuXwoR3X0h1SECCE5ZsEvAm3mK2BNCC4Axib7hn6ApFNSDUPeu60JTLypwSlec+lI3/eOEhX1DEPbfVtj9qznhJykzseTKhlEiix9Ae2tZM5j4rxxtmrwv1PD/qZ2pyTJKkhNfjiS40kscpv7BqlWpjDgN5IO6wfnnxi+cautg2gviBTHaNlHv5SDOH2wuCbAEFLVm8Ad2Z8HALpr50wJNLFmrhbt3c9ZQOCnQ3Qiwg4gsMzG0G/ifoBk/c554WanzDVabEAdyUO98283rHVs9Wcm4rOHUz6J5WdRaezoqYn1+QbPIFsSMci6tLieIOtM2kvtjIU6FDffCWrWMf3i1/m/HMlZl+3YUqXoI6r/6cAAGESMIu4SviQ7UcDvpbmGWlYOe1NkHLuI98W4MGybmpZLGA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199015)(46966006)(36840700001)(40470700004)(6666004)(54906003)(316002)(6862004)(86362001)(40460700003)(31696002)(8936002)(41300700001)(186003)(2616005)(8676002)(5660300002)(70586007)(70206006)(36756003)(4326008)(82740400003)(53546011)(6506007)(36860700001)(336012)(2906002)(6512007)(26005)(83380400001)(81166007)(47076005)(6486002)(31686004)(40480700001)(356005)(82310400005)(478600001)(21314003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 07:43:50.8180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce829e70-e6a1-4114-b329-08daa1ee59dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8057

Hi Jan,

On 2022/9/27 16:19, Jan Beulich wrote:
> On 20.09.2022 11:12, Wei Chen wrote:
>> There are some codes in x86/numa.c can be shared by common
>> architectures to implememnt NUMA support. Just like some
>> variables and functions to check and store NUMA memory map.
>> And some variables and functions to do NUMA initialization.
>>
>> In this patch, we move them to common/numa.c and xen/numa.h
>> and use the CONFIG_NUMA to gate them for non-NUMA supported
>> architectures. As the target header file is Xen-style, so
>> we trim some spaces and replace tabs for the codes that has
>> been moved to xen/numa.h at the same time.
>>
>> As acpi_scan_nodes has been used in a common function, it
>> doesn't make sense to use acpi_xxx in common code, so we
>> rename it to numa_scan_nodes in this patch too. After that
> 
> numa_process_nodes() now?

Oh, yes, I will update it.

> 
>> if we still use CONFIG_ACPI_NUMA in to gate numa_scan_nodes
>> in numa_initmem_init, that doesn't make sense. As CONFIG_NUMA
>> will be selected by CONFIG_ACPI_NUMA for x86. So, we replace
>> CONFIG_ACPI_NUMA by CONFIG_NUMA to gate numa_scan_nodes.
>>
>> As arch_numa_disabled has been implememnted for ACPI NUMA,
>> we can rename srat_disabled to numa_disabled and move it
>> to common code as well.
> 
> Please update the description: arch_numa_disabled() appears in patch 5
> only. Of course if you follow the comments to patch 2, the wording here
> would be correct again.
> 

I will update the description.

>> +static unsigned int __init extract_lsb_from_nodes(const struct node *nodes,
>> +                                                  nodeid_t numnodes)
>> +{
>> +    unsigned int i, nodes_used = 0;
>> +    unsigned long spdx, epdx;
>> +    unsigned long bitfield = 0, memtop = 0;
>> +
>> +    for ( i = 0; i < numnodes; i++ )
>> +    {
>> +        spdx = paddr_to_pdx(nodes[i].start);
>> +        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
>> +
>> +        if ( spdx >= epdx )
>> +            continue;
>> +
>> +        bitfield |= spdx;
> 
> Perhaps to be taken care of in a separate patch: We accumulate only
> the bits from the start addresses here, contrary to what the comment
> ahead of the function says (and I think it is the comment which is
> putting things correctly).

If one node has non-zero memory, the bit of end will >= the bit of 
start. As we use this function to calculate LSB, I don't think only
accumulate bits of start addresses will be a problem. Instead I think
we should modify this function comment to say why we only need to 
accumulate bits of start addresses.

> 
>> +        nodes_used++;
>> +        if ( epdx > memtop )
>> +            memtop = epdx;
>> +    }
>> +
>> +    if ( nodes_used <= 1 )
>> +        i = BITS_PER_LONG - 1;
> 
> Is this actually going to be correct for all architectures? Aiui
> Arm64 has only up to 48 physical address bits, but what about an
> architecture allowing the use of all 64 bits? I think at the very
> least we want BUILD_BUG_ON(PADDR_BITS >= BITS_PER_LONG) here.
> 

Ok I will add above BUILD_BUG_ON. And I also have question why can't
we use PADDR_BITS here directly?

>> +    else
>> +        i = find_first_bit(&bitfield, sizeof(unsigned long) * 8);
>> +
>> +    memnodemapsize = (memtop >> i) + 1;
> 
> Again perhaps the subject of a separate patch: Isn't there an off-by-1
> mistake here? memtop is the maximum of all epdx-es, which are
> calculated to be the first PDX following the region. Hence I'd expect
> 
>      memnodemapsize = ((memtop - 1) >> i) + 1;
> 
> here. I guess I'll make patches for both issues, which you may then
> need to re-base over.
> 

Thanks, I will wait your patches.

>> +static int __init cf_check numa_setup(const char *opt)
>> +{
>> +    if ( !strncmp(opt, "off", 3) )
>> +        numa_off = true;
>> +    else if ( !strncmp(opt, "on", 2) )
>> +        numa_off = false;
>> +#ifdef CONFIG_NUMA_EMU
>> +    else if ( !strncmp(opt, "fake=", 5) )
>> +    {
>> +        numa_off = false;
>> +        numa_fake = simple_strtoul(opt + 5, NULL, 0);
>> +        if ( numa_fake >= MAX_NUMNODES )
>> +            numa_fake = MAX_NUMNODES;
>> +    }
>> +#endif
>> +    else
>> +        return arch_numa_setup(opt);
>> +
>> +    return 0;
>> +}
>> +custom_param("numa", numa_setup);
> 
> Note that with this moved here at some point during your work (when
> allowing NUMA=y for Arm) you'll need to update the command line doc.
> 

I have prepared a patch for this doc in part#3 Arm part code.

>> +static void cf_check dump_numa(unsigned char key)
>> +{
>> +    s_time_t now = NOW();
>> +    unsigned int i, j, n;
>> +    struct domain *d;
>> +    const struct page_info *page;
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
>> +        /* Sanity check phys_to_nid() */
>> +        if ( phys_to_nid(pa) != i )
>> +            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
>> +                   pa, phys_to_nid(pa), i);
>> +    }
>> +
>> +    j = cpumask_first(&cpu_online_map);
>> +    n = 0;
>> +    for_each_online_cpu ( i )
>> +    {
>> +        if ( i != j + n || cpu_to_node[j] != cpu_to_node[i] )
>> +        {
>> +            if ( n > 1 )
>> +                printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
>> +            else
>> +                printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
>> +            j = i;
>> +            n = 1;
>> +        }
>> +        else
>> +            ++n;
>> +    }
>> +    if ( n > 1 )
>> +        printk("CPU%u...%u -> NODE%d\n", j, j + n - 1, cpu_to_node[j]);
>> +    else
>> +        printk("CPU%u -> NODE%d\n", j, cpu_to_node[j]);
>> +
>> +    rcu_read_lock(&domlist_read_lock);
>> +
>> +    printk("Memory location of each domain:\n");
>> +    for_each_domain ( d )
>> +    {
>> +        process_pending_softirqs();
>> +
>> +        printk("Domain %u (total: %u):\n", d->domain_id, domain_tot_pages(d));
>> +
>> +        for_each_online_node ( i )
>> +            page_num_node[i] = 0;
> 
> I'd be inclined to suggest to use memset() here, but I won't insist
> on you doing this "on the fly". Along with this would likely go the
> request to limit the scope of page_num_node[] (and then perhaps also
> vnuma and page).
> 

memset for page_num_node makes sense, I will do it before 
for_each_domain ( d ).
About limit the scope, did you mean, we should move:

"const struct page_info *page;
unsigned int page_num_node[MAX_NUMNODES];
const struct vnuma_info *vnuma;"

to the block of for_each_domain ( d )?


>> +        spin_lock(&d->page_alloc_lock);
>> +        page_list_for_each ( page, &d->page_list )
>> +        {
>> +            i = phys_to_nid(page_to_maddr(page));
>> +            page_num_node[i]++;
>> +        }
>> +        spin_unlock(&d->page_alloc_lock);
>> +
>> +        for_each_online_node ( i )
>> +            printk("    Node %u: %u\n", i, page_num_node[i]);
>> +
>> +        if ( !read_trylock(&d->vnuma_rwlock) )
>> +            continue;
>> +
>> +        if ( !d->vnuma )
>> +        {
>> +            read_unlock(&d->vnuma_rwlock);
>> +            continue;
>> +        }
>> +
>> +        vnuma = d->vnuma;
>> +        printk("     %u vnodes, %u vcpus, guest physical layout:\n",
>> +               vnuma->nr_vnodes, d->max_vcpus);
>> +        for ( i = 0; i < vnuma->nr_vnodes; i++ )
>> +        {
>> +            unsigned int start_cpu = ~0U;
>> +
>> +            if ( vnuma->vnode_to_pnode[i] == NUMA_NO_NODE )
>> +                printk("       %3u: pnode ???,", i);
>> +            else
>> +                printk("       %3u: pnode %3u,", i, vnuma->vnode_to_pnode[i]);
>> +
>> +            printk(" vcpus ");
>> +
>> +            for ( j = 0; j < d->max_vcpus; j++ )
>> +            {
>> +                if ( !(j & 0x3f) )
>> +                    process_pending_softirqs();
>> +
>> +                if ( vnuma->vcpu_to_vnode[j] == i )
>> +                {
>> +                    if ( start_cpu == ~0U )
>> +                    {
>> +                        printk("%d", j);
> 
> j being "unsigned int", would you mind switching to %u here and below?
> 

Ok, I will do it and below.

>> --- a/xen/include/xen/numa.h
>> +++ b/xen/include/xen/numa.h
>> @@ -18,4 +18,71 @@
>>     (((d)->vcpu != NULL && (d)->vcpu[0] != NULL) \
>>      ? vcpu_to_node((d)->vcpu[0]) : NUMA_NO_NODE)
>>   
>> +/* The following content can be used when NUMA feature is enabled */
>> +#ifdef CONFIG_NUMA
>> +
>> +extern nodeid_t      cpu_to_node[NR_CPUS];
>> +extern cpumask_t     node_to_cpumask[];
>> +
>> +#define cpu_to_node(cpu)        cpu_to_node[cpu]
>> +#define parent_node(node)       (node)
>> +#define node_to_first_cpu(node) __ffs(node_to_cpumask[node])
> 
> I can't spot a use of this - perhaps better drop than generalize (if
> done right here then along with mentioning this in the description)?
> 

Yes, there is no code using this macro anymore, I will delete it and 
mention it in the commit log.

Cheers,
Wei Chen


> Jan

