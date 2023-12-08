Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0F880A1F0
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 12:14:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650583.1016274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBYo8-0000XN-EE; Fri, 08 Dec 2023 11:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650583.1016274; Fri, 08 Dec 2023 11:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBYo8-0000Uh-Ai; Fri, 08 Dec 2023 11:14:12 +0000
Received: by outflank-mailman (input) for mailman id 650583;
 Fri, 08 Dec 2023 11:14:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SAoP=HT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1rBYo6-0000Ub-Cb
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 11:14:10 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7837cdf-95ba-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 12:14:08 +0100 (CET)
Received: from AM6PR08CA0008.eurprd08.prod.outlook.com (2603:10a6:20b:b2::20)
 by DB9PR08MB8266.eurprd08.prod.outlook.com (2603:10a6:10:3c6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Fri, 8 Dec
 2023 11:14:03 +0000
Received: from AM3PEPF0000A790.eurprd04.prod.outlook.com
 (2603:10a6:20b:b2:cafe::ff) by AM6PR08CA0008.outlook.office365.com
 (2603:10a6:20b:b2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Fri, 8 Dec 2023 11:14:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A790.mail.protection.outlook.com (10.167.16.119) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Fri, 8 Dec 2023 11:14:02 +0000
Received: ("Tessian outbound 20615a7e7970:v228");
 Fri, 08 Dec 2023 11:14:02 +0000
Received: from 8f35c5af7cb7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0D5AB2F5-181F-4ABE-8DA1-F75A873AA8CB.1; 
 Fri, 08 Dec 2023 11:13:25 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8f35c5af7cb7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Dec 2023 11:13:25 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DBAPR08MB5816.eurprd08.prod.outlook.com (2603:10a6:10:1b3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 11:13:24 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::52b2:83e5:f64a:ec3e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::52b2:83e5:f64a:ec3e%6]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 11:13:23 +0000
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
X-Inumbo-ID: e7837cdf-95ba-11ee-9b0f-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=kptN0rqWFsz4mohJ+9fRI8Hi+KmbUPQML+4vWNBDMaCZvc+ymTQgXZxTEDuPwD8KM+5sEEuDVafxI58m7dH+cC6kNiF6YgjosHvqQABorva+A4nB1KSYsbIcAELEh8c6sr4FaIYX1N3lOoxIJxoJa7mMxAJ4jDC8NK0gt14ZiWFBCbJMSO5ggs3TsyaQTtHVHkgrmkQeKvFaIbq9DPb8/VfWd6f0+Scx6KsZeNzdT5Z3hu9Nn2tRK82pQcnz8AR4+5I1A+zKkgFmjdNyv7tN9mJT0IeIwh7AFm8NDI429JFQVWdUlHHxXFmJ/6zeR0JZfiJxVhkqdZQDl9LDSq8IJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lh6oIpNrNqZh33XoexMEQY50zhTwEJ530smAROg6cA4=;
 b=FtlptEofs8G3y6k7quPeMRQkPIJqTNuT6m+zCQgyV/bM9eyUtQ7grA4nl9LUs8wLWpMallS4kOkS7fFUyLLs8RsJFPCc/XA4oLfF7WOZSMbJwNBYiJCOEtn4OEAH6rcwkXhiGRg0XTPPrTJsFbZyRGqS7YIRUZUHFJwtANWP0rbE+BGYQbx0DHCdRqRsql1ADT91gwbfq24ZdT9SG6QwtGF+2P+Ilb2ELb8U8VjnkdWj4sUtXH1/WoLs72ZoMTQqKdEmXTGstWuVoW2csSGxbt/CY3C+RzRAi7s0viW7iQ1C0k0WTc9reBbve5HrCMC5rFgSvUstso21vUWXzCMF1w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lh6oIpNrNqZh33XoexMEQY50zhTwEJ530smAROg6cA4=;
 b=b9nDn0XJeAUwQlimHGCOPouf0IXrPNqY+JKaSr8E0nARsOiRkAeV+6w/Uc/aeKWDYhVfZPR9f0ccQ5ZnxQJwT+VaOu1zrerIJPXVDI+I65yoCpEw9B4jn43UXK546BrCWiuqtwjSXMu0UO9/XRj551CGmhX33v0+TIKhDd3bfqQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4Bi1lw7b664S5QhJI2i0mdmcdkITmmkMwbbtgyUF5/yGQkLqGE7aj9I8cQ/erNuYM/QS+kR5hGcgDCGgU1Ba1wVjWnzRKjYp36O5d8cdVAoNrs+PKmVd7OANPoHi//OlSuQukZUnIEWJlLpMuJIy/t1EiubXkcWVUVOAtLBwh64OwRZvxvYFCpf/GWE0D4l8iDPJUqK38T3zzG+VAMUbfD/xOpvbWsSsMkY2/o8gIA5zwLbHHMZsN7I6qGYSvjkCQzoVcNbxPMno9dQTQZKaOAuSZGGDTLqHK5i/KUbH69TYCY1Ub7RqlBZYvd3ZuEs5WaYEHMw7Y3BEdEeJe0UzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lh6oIpNrNqZh33XoexMEQY50zhTwEJ530smAROg6cA4=;
 b=korgB3s/2/DCRNB/3aAtYQfb86TRDRjY9Qide84ljTldJ9Xaxm4wTT4r9sm/yr4eS/mNeb7WYVlBXEnnOzNIWjVowX9qQLfHCksFiJTGScuAuDUAu937mQ0hWZ5FeyoVbGgLvDy1IDe4lQlpwTVW8OK+bBJHZSUBca0dWlj+J5c/BbRPSBYLPbHqbxeaIAOpEnLxCpd1frMZpFsQdNqzuSDAJ2vAIibIEbiDOb2qkZEsLSMXMrk++a6drKykjByU17p4xRFOUa9nvfyBGrJk/wCj+ZTUZQrX5qJD9+nyeLFJ0h9E2tnJQCDNbDIjDZUowYAWqvAkNwO2EcfzYe3lUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lh6oIpNrNqZh33XoexMEQY50zhTwEJ530smAROg6cA4=;
 b=b9nDn0XJeAUwQlimHGCOPouf0IXrPNqY+JKaSr8E0nARsOiRkAeV+6w/Uc/aeKWDYhVfZPR9f0ccQ5ZnxQJwT+VaOu1zrerIJPXVDI+I65yoCpEw9B4jn43UXK546BrCWiuqtwjSXMu0UO9/XRj551CGmhX33v0+TIKhDd3bfqQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <6795d175-6486-44bd-b878-96535730a9bb@arm.com>
Date: Fri, 8 Dec 2023 19:13:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] automation: Add the expect script with test case
 for FVP
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, Michal Orzel <michal.orzel@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20231208054637.1973424-1-Henry.Wang@arm.com>
 <20231208054637.1973424-4-Henry.Wang@arm.com>
 <213f2b46-2668-4dae-8c57-269a73eff1bb@amd.com>
 <4609F9AA-44B6-40EA-A1A5-9D677679002D@arm.com>
 <0554806a-35c2-4abb-aa3c-3bab104c6c61@amd.com>
 <B9AFD918-42F6-4190-963B-E5A639D9F60E@arm.com>
 <2f34c0ec-0d94-48e2-bec0-faa96e1702f1@amd.com>
 <9F69A6E2-2D83-46AF-8AB6-C1B409F4ADE0@arm.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <9F69A6E2-2D83-46AF-8AB6-C1B409F4ADE0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0132.apcprd02.prod.outlook.com
 (2603:1096:4:188::15) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB7420:EE_|DBAPR08MB5816:EE_|AM3PEPF0000A790:EE_|DB9PR08MB8266:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dc32fd0-8c7b-4c62-42dc-08dbf7dec8c4
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tspTVlRR1rIfxJEiS7Q3LxdK/CclGbSyg7dx1VfdG+X9HRTQzhIjj9SNDPQMTlBulb8994Hq5AFPdyuXdYZeit7FEJHkFPtcUi6dc2kwl7/ll40LHOzEYW6KKq+a9MglJHaueoy7ab05AXrCUQwYdd15aQINNSvTMYC9JKEssU04xIxTZ2+HP6xtUdOSf3HcfB6L45zWJEpyn6C++w9opOHc3hH7uR0g09CecuIrMsZ/4FB67R1rJqN0LowtzCq48Z3dwACKRAGqesrslBI0n2+dDa3MnA43HVPkjSDCxYbjokH6YUz6VwLXZPLWCJ7Z3ikDWCGVT/E4+UYniWxrBFOq1l8fhDUZoFhvlyjwE514AK4WyfYKKOpYlywCR6wq5tO/RuZh3FoV23HGaIyhVwE8u7gngEMERncvoOyqokENnat7fdC2RzkByesOjl+v6wqwEtINK76HDIoNIVBrKDV5nZI1HqWPRKTl7O6YMEnIjjMgUciflPsLD6PT75uZocm1gsJTsxMXF6GKCYNUxLfbvmtTo00fMfs/ivDy/drDCsfM7U94z1HRI9OdKmyhqB2wSw8n+3RR5/2rosK0BlAJKyxPEU0zi+i/UVOnPa1F1U9h7Y6duWCyXsn3eSIJoQm4A9v7ZsZfaet7hS1nKA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(136003)(366004)(346002)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(36756003)(41300700001)(6512007)(6506007)(53546011)(2616005)(83380400001)(5660300002)(478600001)(6486002)(2906002)(66556008)(54906003)(66946007)(66476007)(316002)(31696002)(8936002)(8676002)(110136005)(4326008)(38100700002)(6666004)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5816
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	685508bd-fc92-4de0-6bcc-08dbf7deb189
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nOibPpQGXz9O/lYeCE17cGmIDdzahqjWj3YEb6KtJ6TRq2m4Kf2QjrxcZ2wYGXK3QZmBBz82fZKtfd24ENmz593G4B52n7qyIhf7H2sp1gO3yXm1xyIKkNzIiPX0qFyBfKvva7BJk2g+C7RtelDHAgv2BYVizu1EO/GE9hnxeNU4xq5ELgIq7gvo5P5uNX5t0nRP0mUpYlA5ZZDh7RsMgpemJ92Xsf94jHG7kIzASBXCU48RDwKjUpkyGJu/O2aexxZXDJ4NJ8iOuPMzZRbh+K9zTev2XrtvCIc9lIQBP3qN2k2QMRsj/EyNHenG1e+VaOx9MuvX8N2RsdtZt8akKL9PvHf8dus+ZNnPFNl7c4wVew9bQ4TXl6ZRJCBwfOl3mxTPMOBjItkgWtrYDkV1OPMGSccL9glVvuFZZ1ekp47naX8mCRZPVa5fnhbQG4H9mtSU7SsfS/o+NfrYoEJJ8p/ow85+oX6IHYLtwski1A6eRAqqgaWpDt3zABfHRwUG7+tJQMMi6YiANkOdJAIQ6EVGTuTeFcQh9iZJ+SdA0GroxRRl7UR3KhkItNbDPTpIwwf18ZBG6EuYaZD+ptkOjMVKw0gv2lgRIchqFYhBlmx536WbmZ6TDG6itHTUN08uKnweRPzUGonXXbhu/2giwKWDB3PkhgZPy5Nwfjd+QRpSA6UeFhjjEv0sH5FaEjFrxbNSdNnF+J/FGrq3l7tLCFYbnWTSEuy9Zo6VuGsRVWnqoYV6qM9AgIWhGZRe54KU6YjZVlWrLUHZyCtNdrIkcg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(376002)(39860400002)(230922051799003)(1800799012)(186009)(82310400011)(451199024)(64100799003)(40470700004)(36840700001)(46966006)(40480700001)(31686004)(40460700003)(6512007)(478600001)(6506007)(47076005)(2616005)(6666004)(81166007)(26005)(53546011)(336012)(110136005)(6486002)(8676002)(54906003)(4326008)(83380400001)(70206006)(70586007)(316002)(5660300002)(8936002)(82740400003)(356005)(36756003)(86362001)(41300700001)(2906002)(36860700001)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 11:14:02.5537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc32fd0-8c7b-4c62-42dc-08dbf7dec8c4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8266

Hi Henry and Michal,

On 2023/12/8 17:56, Henry Wang wrote:
> Hi Michal,
> 
>> On Dec 8, 2023, at 17:50, Michal Orzel <michal.orzel@amd.com> wrote:
>> On 08/12/2023 10:21, Henry Wang wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>>> On Dec 8, 2023, at 17:11, Michal Orzel <michal.orzel@amd.com> wrote:
>>>> On 08/12/2023 10:05, Henry Wang wrote:
>>>>>
>>>>> Hi Michal,
>>>>>
>>>>>> On Dec 8, 2023, at 16:57, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>>
>>>>>> Hi Henry,
>>>>>>
>>>>>> On 08/12/2023 06:46, Henry Wang wrote:
>>>>>>> diff --git a/automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp b/automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp
>>>>>>> new file mode 100755
>>>>>>> index 0000000000..25d9a5f81c
>>>>>>> --- /dev/null
>>>>>>> +++ b/automation/scripts/expect/fvp-base-smoke-dom0-arm64.exp
>>>>>>> @@ -0,0 +1,73 @@
>>>>>>> +#!/usr/bin/expect
>>>>>>> +
>>>>>>> +set timeout 2000
>>>>>> Do we really need such a big timeout (~30 min)?
>>>>>> Looking at your test job, it took 16 mins (quite a lot but I know FVP is slow
>>>>>> + send_slow slows things down)
>>>>>
>>>>> This is a really good question. I did have the same question while working on
>>>>> the negative test today. The timeout 2000 indeed will fail the job at about 30min,
>>>>> and waiting for it is indeed not really pleasant.
>>>>>
>>>>> But my second thought would be - from my observation, the overall time now
>>>>> would vary between 15min ~ 20min, and having a 10min margin is not that crazy
>>>>> given that we probably will do more testing from the job in the future, and if the
>>>>> GitLab Arm worker is high loaded, FVP will probably become slower. And normally
>>>>> we don’t even trigger the timeout as the job will normally pass. So I decided
>>>>> to keep this.
>>>>>
>>>>> Mind sharing your thoughts about the better value of the timeout? Probably 25min?
>>>>  From what you said that the average is 15-20, I think we can leave it set to 30.
>>>> But I wonder if we can do something to decrease the average time. ~20 min is a lot
>>>> even for FVP :) Have you tried setting send_slow to something lower than 100ms?
>>>> That said, we don't send too many chars to FVP, so I doubt it would play a major role
>>>> in the overall time.
>>>
>>> I agree with the send_slow part. Actually I do have the same concern, here are my current
>>> understanding and I think you will definitely help with your knowledge:
>>> If you check the full log of Dom0 booting, for example [1], you will find that we wasted so
>>> much time in starting the services of the OS (modloop, udev-settle, etc). All of these services
>>> are retried many times but in the end they are still not up, and from my understanding they
>>> won’t affect the actual test(?) If we can somehow get rid of these services from rootfs, I think
>>> we can save a lot of time.
>>>
>>> And honestly, I noticed that qemu-alpine-arm64-gcc suffers from the same problem and it also
>>> takes around 15min to finish. So if we managed to tailor the services from the filesystem, we
>>> can save a lot of time.
>> That is not true. Qemu runs the tests relatively fast within few minutes. The reason you see e.g. 12 mins
>> for some Qemu jobs comes from the timeout we set in Qemu scripts. We don't have yet the solution (we could
>> do the same as Qubes script) to detect the test success early and exit before timeout. That is why currently
>> the only way for Qemu tests to finish is by reaching the timeout.
>>
>> So the problem is not with the rootfs and services (the improvement would not be significant) but with
>> the simulation being slow. That said, this is something we all know and I expect FVP to only be used in scenarios
>> which cannot be tested using Qemu or real HW.
> 
> Ok, you made a point. Let me do some experiments to see if I can improve. Otherwise maybe
> we can live with this until a better solution.
> 
> Kind regards,
> Henry
> 

QEMU works like FVP enabled use_real_time flag. How about enable 
use_real_time flag in CI for most test cases, but disable it for
some time sensitive test cases? Normally, enable use_real_time
will give several times improvement of FVP performance.

Cheers,
Wei Chen

>>
>> ~Michal
> 

