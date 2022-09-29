Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D864F5EF043
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 10:21:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413524.657216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odonN-0001Qc-UW; Thu, 29 Sep 2022 08:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413524.657216; Thu, 29 Sep 2022 08:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odonN-0001NQ-RY; Thu, 29 Sep 2022 08:21:25 +0000
Received: by outflank-mailman (input) for mailman id 413524;
 Thu, 29 Sep 2022 08:21:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YTqY=2A=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1odonL-00013i-QZ
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 08:21:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3a4e4a3-3fcf-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 10:21:22 +0200 (CEST)
Received: from DB6PR0202CA0006.eurprd02.prod.outlook.com (2603:10a6:4:29::16)
 by AM7PR08MB5383.eurprd08.prod.outlook.com (2603:10a6:20b:102::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Thu, 29 Sep
 2022 08:21:21 +0000
Received: from DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::26) by DB6PR0202CA0006.outlook.office365.com
 (2603:10a6:4:29::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19 via Frontend
 Transport; Thu, 29 Sep 2022 08:21:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT004.mail.protection.outlook.com (100.127.142.103) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Thu, 29 Sep 2022 08:21:20 +0000
Received: ("Tessian outbound 937eed45f6ed:v128");
 Thu, 29 Sep 2022 08:21:20 +0000
Received: from 0e9b5808d20b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 71A40CF7-2361-4EFF-B98A-4505285AF13E.1; 
 Thu, 29 Sep 2022 08:21:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0e9b5808d20b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Sep 2022 08:21:14 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by GV2PR08MB8051.eurprd08.prod.outlook.com (2603:10a6:150:79::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Thu, 29 Sep
 2022 08:21:11 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::6f9a:a2b6:e5d3:349e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::6f9a:a2b6:e5d3:349e%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 08:21:10 +0000
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
X-Inumbo-ID: b3a4e4a3-3fcf-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gQYiwSWvfAUJhGhAFyAYVHMYFbuv7AXPnt2jyAi/0lEygtRDmOpWyal8ym2Q3WL9WdQzmCXOWTB4yEr4kURq4IQa9sV9b7GsjixNTRDz1fVACuW4Bo0cLXvwnrXkNnAYQFOK4+TJDTSwJSWt5s2Z4Di9MRh7ODfGuH22D/i0Q8T5o7jdTAawiy4w4sTLTmzcdkCfUNP1VD6U2ZWzMsX13Xw9bLorcaPvVNEz94cSbn6hKX4vSjFcjWYSMqXM+zQq6OPLvlE8lq4ymDpGC3IXYk7JFqN0WPswQE3mIMBKL8yG6Eej+0dAo/uQ1l+z8UHjy8Ft5DZeCXl5sC12CN8l1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3e9ztFjUAK5abcVlWInf+/G3+btOG244YKSL8pbIpk=;
 b=Bzn0BjfsKj2V6iFul1rK5VLyExNgEXXSL9Svlgsp+6ItoYFhcQkIuHAY7KZHDzuF3nMQIdOLJK1h6QkOiRD+3YSx8ooXr8h2Ve9heHyCMMi9HAc1J5DXZ7eVZnofRioc47S7UREX8XvDDaSsNDoTzq6QbfF2neYNJNUR8Av0vKQ8lBeetOMI403A8em22mvI5e729rRqvB42KIj0U9PB8K3jHvjhkGgnMMC1Crta1F6V8cHv66zOq9CwX91VX83CH3qdfGm2pQCkUpgSf5c5y4UPOKlQQMnrv7r3vgV+C93jTTPPVx834yr7tNlaSwpKAsSVLcB7609Dp7tnipbihg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3e9ztFjUAK5abcVlWInf+/G3+btOG244YKSL8pbIpk=;
 b=0XpxxMHM/y7R35jWIe2gARI+qExcfBjUrsqzfReS8jbjdarNnZQBfDJu77aNkQ185oVQUrPLhufKV2fF+ZG3BTsIVoDJgWcOsYjWymXskp+kkMNOFNA2Ewk2/efpqAtek22MWbDsRdlhQHbwiccZ66Mes8nC81Iq4hkh9DUuASE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6c43a1fc89812db4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtB2f0UIFxNRpHn0F8lepaUnjxeGvJCvc7KB4BIavWJvzqSWrM7ofMCoadCJVfUDPp+sCbdX1jM9bR1bQyWE9kLkVTXpb4c1XztkXNhooNYr1Z6QbSci+OQIXBIITPwwvHbvTOvSY5BmLiCLp6+P8K5O+7jH93kZq0k3WLO11WG5l7xgAdoEzk930QSfYvNWJ9OsQLaF02WeXWLlcS96GNHXPAziWmZX0eAF4S0bzTfn9o6JCiRNgdPq6jxrzgxbr57GgCArynHu7yCi0cFkGNe5mZIkghz5OKQakD7Sgmiz1Z0775LJ8oC5zrMizh6fvziVhvF5Oworw5VEvevA+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3e9ztFjUAK5abcVlWInf+/G3+btOG244YKSL8pbIpk=;
 b=kEX4k7C4aveTBMhFkHyhL7ROodI8yucwqroXD7dIel9FTdjmlOu4+C03+5KBYWmF2Erw/jimJO5y1+CVbA9GDoAaxN4l0WxDQQfdPvt7xO7fwVgdbaUTAOd6Cr1j5I1pNsgHYSTNGsFfAbY86PkSSw+I0bNq/aVowB9unENqgASaBtNs88C4qIRMF/Pqpjw+adJL4Dp+8HfaqHysxokDnpCwYOnGHDc9hTguM81cBJosdup3p7ueO3KkMx4jCm2V5H5zg6T6AkTKMmvD+vY42bqYDaNLvTooTS6ZIkGbgN83SgNPdLMi6Qeue0vQEMinl4QtiY2oQdTZCi554Xeejg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3e9ztFjUAK5abcVlWInf+/G3+btOG244YKSL8pbIpk=;
 b=0XpxxMHM/y7R35jWIe2gARI+qExcfBjUrsqzfReS8jbjdarNnZQBfDJu77aNkQ185oVQUrPLhufKV2fF+ZG3BTsIVoDJgWcOsYjWymXskp+kkMNOFNA2Ewk2/efpqAtek22MWbDsRdlhQHbwiccZ66Mes8nC81Iq4hkh9DUuASE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <fc03f565-8c05-e310-fa0a-698ad7c569e3@arm.com>
Date: Thu, 29 Sep 2022 16:21:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v5 5/6] xen/x86: move NUMA scan nodes codes from x86 to
 common
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220920091218.1208658-1-wei.chen@arm.com>
 <20220920091218.1208658-6-wei.chen@arm.com>
 <5ac85819-9a1d-b8bc-d49d-13cb34a3e7e9@suse.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <5ac85819-9a1d-b8bc-d49d-13cb34a3e7e9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0184.apcprd06.prod.outlook.com (2603:1096:4:1::16)
 To PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB7420:EE_|GV2PR08MB8051:EE_|DBAEUR03FT004:EE_|AM7PR08MB5383:EE_
X-MS-Office365-Filtering-Correlation-Id: 24c732e9-0df5-4593-683b-08daa1f396f2
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GGt4VxIt3NAaYBxIqnZlVcsTLRRUu8WDySrNsAvoJwCZtzGJdB8N8oLQhP0/1OXfDavdiCzfS6cHe+kFG3YBkNqIXxIShUn+3tmKxODhbzFF18rhncyHfSd5cutuuwpzIFaLUkN3kBZfMBb3Mb33RxAjbEBZeDxlWvl+5RjeUehleRQDwR/Q66ts9SSSc/8KE4mMSz8W6VtinHYwIonhi7+7hb0jHQd2JE9hrob6mupyoboT3qfs3NWyShhK6iPjMvk1s3leWtZ2/mL16edeAYjLS8/9bjXwdQkv94bU1/N4y4gyEuIOefGrWM9788onxUNy3k97BWcfpITylwO0M0SZ6HfyXEMINDPiuU/EJP00l3fkuZQEa00TBVV33HSQxhIcnqfOH82S86yKx1KkT4naZGga32I//vlWSx2y+fMm2XiUjeK3dzH0A82CRmz4FvOMUYB+PZ7nWQJHek8j40nYXmg/CHq5tLb8MQqT4bgfN0utatzwsKgT7bQi7P8JeKvtu2RvEmOTd8vR1MmNURF7liMVyoUnzObt/uo8bw/SorwGekITbLuBlgMBsn2JBn8vFsbYg3qSa7NCO8Z3KLUYoo6SIvKWedHfnORBYH8/gzCp67yfPPUGbvBXQx1lI1H8slsHs+xw7kQU1nzE/IFO/9STYZb/SvUpqN44GfiKKSo7Qhpj+AbABJseRU+hVi2ovt3kjGnSJN8jRLlC8E73ZyXz7h7ZYk0Y63pdPJrLzJOfAh+X63UpvcHImH/xNmbZa6hIAHKwFgzd4lGhy8mRGOpjmCMI/6u8kIcg/l4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199015)(5660300002)(54906003)(53546011)(2906002)(6916009)(83380400001)(26005)(316002)(8936002)(6666004)(6512007)(4326008)(186003)(66476007)(66946007)(36756003)(8676002)(66556008)(2616005)(41300700001)(6506007)(6486002)(38100700002)(31696002)(478600001)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8051
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b8ad77c1-8140-4cb8-783c-08daa1f390c2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vN6FdkQDKii2O4bqiJjmXoOyDqgP4OXaDept+SiTcvT4YhtYXEEoVuGbY+3z4pc7A4alFr3+lDtEXBXvv4cBHg6tZE/zjqUc4bI1S6stRIt0ClSgy8dR5T7NKZW8CYwclbmXqxpcnsRRuMtiQuYLDgrRq5E0Fiadoya1E38FCEPG+fFalmGbHgGjKXXaRTIlcQZhA/rxKqyJlVIiE0YFXyRZyNF/v+3pvIsGrrw81tqi+JnY2aYT5CBM0Wt0qQ8zDBuOsqe3fQnqr0cgwmzsGsxWkQa4FTMv7y26CCP9CSp7iNA+aVLfr9Rnouub++E7m3H6wMEAwektrnoDlP75wnUaiyJPuCuRUMBmVKMmK/UNpKG3SLyaNIM0KG1OmRT/dgySL/hvPtdSdGCFRBOIV8iC2U3DO/8DWORmxC6gzWa98DmadN0eAhzjpvbG+4gJdqDrk2Wl1aI7/t6xsUALydHaOd2whOmS1xTwQhvyxJGFvByKrCKO3ouQ93nY5bfm2yfadQjUEk6y01qj+VLn7n67r2eCiDFgJViBy8OhL1hhvlrfk0nkd0MIuhN6ph5BCL86RGPtk5LhbHxbfpg1/4LUQTh9cScu4YzrbN1WK9Z/VPRFpkynvKBp1AwxySgNgxmk0N/+cTVffPDoydxisLhIp1ggpQU1v+aAwcvMNsQzHllXPCO9TNZC+16j5JuExNRh6i6/yVGe6gjVozmT1eu3KYQ33iSsO6sfB1GBESJ8LbkQJdv2UUOFYgRO6yLQd8a9pRZilpcK2N/qZ56LYMB5p21eKxY86BB4nlHFliw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199015)(46966006)(36840700001)(40470700004)(31686004)(82740400003)(81166007)(6486002)(54906003)(70206006)(31696002)(70586007)(40480700001)(356005)(82310400005)(8676002)(6506007)(4326008)(86362001)(316002)(478600001)(6666004)(36756003)(5660300002)(53546011)(8936002)(6512007)(6862004)(36860700001)(2906002)(2616005)(40460700003)(47076005)(41300700001)(186003)(336012)(26005)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 08:21:20.7940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c732e9-0df5-4593-683b-08daa1f396f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5383

Hi Jan,

On 2022/9/27 23:48, Jan Beulich wrote:
> On 20.09.2022 11:12, Wei Chen wrote:
>> +static bool __init nodes_cover_memory(void)
>> +{
>> +    unsigned int i;
>> +
>> +    for ( i = 0; ; i++ )
>> +    {
>> +        int err;
>> +        bool found;
>> +        unsigned int j;
>> +        paddr_t start, end;
>> +
>> +        /* Try to loop memory map from index 0 to end to get RAM ranges. */
>> +        err = arch_get_ram_range(i, &start, &end);
>> +
>> +        /* Reached the end of the memory map? */
>> +        if ( err == -ENOENT )
>> +            break;
>> +
>> +        /* Skip non-RAM entries. */
>> +        if ( err )
>> +            continue;
>> +
>> +        do {
>> +            found = false;
>> +            for_each_node_mask ( j, memory_nodes_parsed )
>> +                if ( start < nodes[j].end
>> +                    && end > nodes[j].start )
> 
> Nit: Style (placement of && and indentation). Does this actually need
> splitting across two lines?
> 

After covert from tab to spaces, yes, it doesn't need split into two 
lines. I will fix it.

>> --- a/xen/drivers/acpi/Kconfig
>> +++ b/xen/drivers/acpi/Kconfig
>> @@ -7,4 +7,5 @@ config ACPI_LEGACY_TABLES_LOOKUP
>>   
>>   config ACPI_NUMA
>>   	bool
>> +	select HAS_NUMA_NODE_FWID
>>   	select NUMA
> 
> While I might guess that you've chosen the insertion point to have
> things sorted alphabetically, I think here it would be more natural
> to select the wider option first and then also select the more
> narrow one.
> 

Ok, I will adjust the order.

> One further question though: How is this going to work for Arm64
> once it wants to support both the form of NUMA you're working to
> enable _and_ ACPI-based NUMA? There better wouldn't be a requirement
> to pick one of the two at build time - it would be nice for support
> of both forms to be able to co-exist in a single binary.

We are also working in this way. In part#3, we will check ACPI first,
only when ACPI is off, the DT NUMA will be used by Arm. If ACPI is on, 
we will skip DT NUMA.

Cheers,
Wei Chen

> 
> Jan

