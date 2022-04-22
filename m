Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BAE50B034
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 08:10:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310695.527613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhmU0-0001Xh-D9; Fri, 22 Apr 2022 06:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310695.527613; Fri, 22 Apr 2022 06:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhmU0-0001Ur-A5; Fri, 22 Apr 2022 06:09:32 +0000
Received: by outflank-mailman (input) for mailman id 310695;
 Fri, 22 Apr 2022 06:09:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZwqJ=VA=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nhmTy-0001Ul-N9
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 06:09:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7d00::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c35e3782-c202-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 08:09:26 +0200 (CEST)
Received: from DB8PR06CA0052.eurprd06.prod.outlook.com (2603:10a6:10:120::26)
 by DU0PR08MB7787.eurprd08.prod.outlook.com (2603:10a6:10:3b8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 22 Apr
 2022 06:09:23 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::d7) by DB8PR06CA0052.outlook.office365.com
 (2603:10a6:10:120::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13 via Frontend
 Transport; Fri, 22 Apr 2022 06:09:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Fri, 22 Apr 2022 06:09:23 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Fri, 22 Apr 2022 06:09:23 +0000
Received: from cd95b13914ef.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7B2F4CB4-8EA6-4887-ABC5-7EA95DBB1F78.1; 
 Fri, 22 Apr 2022 06:09:16 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd95b13914ef.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 22 Apr 2022 06:09:16 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB6PR0802MB2551.eurprd08.prod.outlook.com (2603:10a6:4:9f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Fri, 22 Apr
 2022 06:09:15 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb%8]) with mapi id 15.20.5164.025; Fri, 22 Apr 2022
 06:09:14 +0000
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
X-Inumbo-ID: c35e3782-c202-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gu8TCVTwwBYGYf7B9H9RVveLQMMJB0IZehu9UilohK0=;
 b=1GWo32YHQ4J+ZaYZ/OzS31qZnhtMrq4npSGgZ6ilhvVgsE+EhxAZ29tQ38mKIZa16nzVoaWk9BmIL6ahGhM9/FeSw9eFZtMjt3KMqnwvycwcDxCZoqnUEN5nWpSta5SAcOFBtsQIAwnYx0HGoZ8arJKyyi4LwcE0JC2IFt6UrnA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 668e0e87570d323a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSZBl703RrcrfmuzgOSk1VYuWINjjWxEp0bk59yzB7npsmO4JPenpBE7do5GsIR/vrQtephJ4aE3t2jHKG0GPZ5YdCEdc/PPq0PwWcsO3Heo/O+eXk5zMJdKzJCcQe6SQ9qyzudmcDtl9OxLJobH3J9ue4s5Sc6ieWK8a9N4vEDs8JkA6NeUY4K6OoZgoBH+Fy2PYZK3R0aeKe3eq94qCPZepdiJd2ulfPIRmmEbdOnyfel3lPnk+pNhKq80ndEkoQJDpUvyT1TGYZGvE9aqxQlSHgqWPvmWoCkEgsYnW0oihbnSP78KGvlm+YUnlkq7bwIQxNJSwI9N5sfVby6b8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gu8TCVTwwBYGYf7B9H9RVveLQMMJB0IZehu9UilohK0=;
 b=Nmx9Ka8UJIFbDa0AKg5FYQRZbUlwA/L7649KeC/kQIEA0IR1VgLAu7yFzzqfLiaVAJ+Iy1nN7JBHfGOb/DdCS2ProbGKACz4zh6cLNsQm2jFO/iHGlbNkNJ4oBhuTo63Mo0eGCKfuUGi1MQ79KLvvcpL4fdYS3hItdl4aNR3hbrjRbbpR6KnhtVNtSXacASRmdQsHZu10FEgVWM/RVsY53W3FD8L6434ENlvXudfzvYQh2HRdCcOlPYDW6C4hk8tX/EESw0rgJJH8i4EnHe4e2aHq2YUNpHD04No6LnHlWs+BjTD1vvx5Acl0w3OL3l/I5MpLBXRmQ9dSRvVwSTmdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gu8TCVTwwBYGYf7B9H9RVveLQMMJB0IZehu9UilohK0=;
 b=1GWo32YHQ4J+ZaYZ/OzS31qZnhtMrq4npSGgZ6ilhvVgsE+EhxAZ29tQ38mKIZa16nzVoaWk9BmIL6ahGhM9/FeSw9eFZtMjt3KMqnwvycwcDxCZoqnUEN5nWpSta5SAcOFBtsQIAwnYx0HGoZ8arJKyyi4LwcE0JC2IFt6UrnA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <6cd916fc-4a10-0a1e-afa6-9e4e6f0ea999@arm.com>
Date: Fri, 22 Apr 2022 14:09:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Proposal for Porting Xen to Armv8-R64 - DraftB
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Penny Zheng <Penny.Zheng@arm.com>
References: <PAXPR08MB742064F5F00A18E09DEF66B69E1A9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2204141613340.915916@ubuntu-linux-20-04-desktop>
 <PAXPR08MB7420786607A15FA5027BF4579EF29@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2204191752390.915916@ubuntu-linux-20-04-desktop>
 <PAXPR08MB742058D3041BA2D97AA05F1D9EF59@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2204201403180.915916@ubuntu-linux-20-04-desktop>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <alpine.DEB.2.22.394.2204201403180.915916@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0048.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::17) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 8567e62e-0714-40eb-dde6-08da2426a5a8
X-MS-TrafficTypeDiagnostic:
	DB6PR0802MB2551:EE_|DB5EUR03FT025:EE_|DU0PR08MB7787:EE_
X-Microsoft-Antispam-PRVS:
	<DU0PR08MB7787AE136378169C8FE26BBA9EF79@DU0PR08MB7787.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6rQHwwJIWC3WMHyUDkVyp4x23kYDwYmLe5Uu1M7zhSFDjmJPMxtHFpKq19vTLN2WaAMm2JEDzA2NtAvL1ZlJ/NOUbr70jMptewIgRZVm9em+SUk+PYRBYnUP7RwlwdEj1BD6Uf94XOYEBeQ24NGmXXRkFhLJMhMj+2QBs3ZHaHCqbhRVy4KNga0AaufrHphhjEVCQ3hIdEYIpMRliYweQhB5s2eRToBOLctzv1KN6nlYWrTLAcpxprOi7zo47foydcKqnkbDsLAaoM+JzzzZS9XOhBjw+M7xorGuNhDyLSMN+3XC+PbEFevcoNoMhUkKoNg7aFIeaKRvebzVzLEdHg9k3F0RJ6+Egnclzzd6mJ4G5T4xAdyVk0Kv5PKG7W0C2Pe0DYOxqQ5F+O+bDzcD4EEx6ipkbzl+lzlZOau+DWsLBAPBTFVzaCxUjKND9dXw82Oux9G6VQkMhrqREN4k9a0fQchD9pFCnJ0i++cCVicljNOA21fdboVAA6Ldvbx6NVrn4Kr7Nlr0Dv0z2PE09VW3n9+MvXUX/OFUph8auGB+luHp7RuniNKGylIaW3vAkuNZN2Ydme0vrQNCi1LPj8inW5g+sDP3BYtL2oqZku8G2UPrLv2i2Zh3s1CimRksSiCKBErHUPeGSha74JTEYJEsbS6ixsc+HlSmJt7VVt3VPqIb1Foedy85GWqsX19LQ+w/EoLKEJ1aMlG8y+ijHolz0z0MhLcwKX1r8Ak+4CI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(2906002)(6486002)(31696002)(66556008)(30864003)(86362001)(6506007)(8676002)(38100700002)(6916009)(83380400001)(316002)(6512007)(54906003)(66476007)(31686004)(6666004)(66946007)(4326008)(53546011)(5660300002)(186003)(26005)(508600001)(2616005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2551
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8b5ed803-963c-47bf-c946-08da2426a091
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kSedImfGllEytYakeusATPWqwecKz0JERNcVdCdwsgCOBvgBM2k1jyW1JcQ7OCoszKhzoWpHCjAT+RIyn6t+WYHMgZwMXsdk87nH0f2ti/aXw34F1uOfG18hqioT4KNT4+r17xNso+8EXGkOLC8THARLYTW41SlusDGhOL4F8AlginqdNuuy7vFDngA6y1Hc7DQuUlU01rW0+3zd7m6Ieo/uFGIttHpsZOpXFP9vZJV8ePhlAPlk18hfJz402EMMB4ofW77EdhDwntBxqo0KGUY0MLDK9dKlgICN+uj4wxaAb7TaXh30al9gztIb+DAJD2p7LVPAkCFNPintyaNUmN7sTIHpZ6f3o5tcUZr863pc0u2sbHXNtrqnaOfdTTyGRQ86bqs19xK+gKTXAKq25cHmgdBt8CqS7J/N6GhouO5LQtHu2/4G8yAyt5Jk7/c8yU9IYegsCwCBAXoCdxr6o3cOV2lTcEA44P+tlEPvI0SYDK+7+bu0YwdYSsMldntPzCShcZzINYWfP5xtWet9IK6LMSDZp77RChPpj3l0vMWw8Wb4bY3kF9U6DsVdgf1Lr7RjVdvtFt3D8REMTPPUqXsWuTC66XvEHlJm6E6JFOGG+i6vwGxI9/KTmgYEu+0kMBqcer5pwLInoeVAkpw9VJygttVq31JZ0y3sLNhvmvDaC4xrGj0LthAmp8AF7k+iDPOxdLVAOBTj0lDBeccL1w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(40460700003)(2616005)(36860700001)(336012)(70586007)(6506007)(2906002)(36756003)(6666004)(6862004)(6486002)(356005)(6512007)(53546011)(31686004)(186003)(26005)(47076005)(70206006)(508600001)(86362001)(31696002)(54906003)(30864003)(8676002)(82310400005)(5660300002)(4326008)(8936002)(316002)(81166007)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 06:09:23.2926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8567e62e-0714-40eb-dde6-08da2426a5a8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7787

Hi Stefano,

On 2022/4/21 5:08, Stefano Stabellini wrote:
> On Wed, 20 Apr 2022, Wei Chen wrote:
>>> On Tue, 19 Apr 2022, Wei Chen wrote:
>>>>>> ### 3.2. Xen Event Channel Support
>>>>>>      In Current RFC patches we haven't enabled the event channel
>>> support.
>>>>>>      But I think it's good opportunity to do some discussion in
>>> advanced.
>>>>>>      On Armv8-R, all VMs are native direct-map, because there is no
>>>>> stage2
>>>>>>      MMU translation. Current event channel implementation depends on
>>>>> some
>>>>>>      shared pages between Xen and guest: `shared_info` and per-cpu
>>>>> `vcpu_info`.
>>>>>>
>>>>>>      For `shared_info`, in current implementation, Xen will allocate
>>> a
>>>>> page
>>>>>>      from heap for `shared_info` to store initial meta data. When
>>> guest
>>>>> is
>>>>>>      trying to setup `shared_info`, it will allocate a free gfn and
>>> use a
>>>>>>      hypercall to setup P2M mapping between gfn and `shared_info`.
>>>>>>
>>>>>>      For direct-mapping VM, this will break the direct-mapping
>>> concept.
>>>>>>      And on an MPU based system, like Armv8-R system, this operation
>>> will
>>>>>>      be very unfriendly. Xen need to pop `shared_info` page from Xen
>>> heap
>>>>>>      and insert it to VM P2M pages. If this page is in the middle of
>>>>>>      Xen heap, this means Xen need to split current heap and use
>>> extra
>>>>>>      MPU regions. Also for the P2M part, this page is unlikely to
>>> form
>>>>>>      a new continuous memory region with the existing p2m pages, and
>>> Xen
>>>>>>      is likely to need another additional MPU region to set it up,
>>> which
>>>>>>      is obviously a waste for limited MPU regions. And This kind of
>>>>> dynamic
>>>>>>      is quite hard to imagine on an MPU system.
>>>>>
>>>>> Yeah, it doesn't make any sense for MPU systems
>>>>>
>>>>>
>>>>>>      For `vcpu_info`, in current implementation, Xen will store
>>>>> `vcpu_info`
>>>>>>      meta data for all vCPUs in `shared_info`. When guest is trying
>>> to
>>>>> setup
>>>>>>      `vcpu_info`, it will allocate memory for `vcpu_info` from guest
>>> side.
>>>>>>      And then guest will use hypercall to copy meta data from
>>>>> `shared_info`
>>>>>>      to guest page. After that both Xen `vcpu_info` and guest
>>> `vcpu_info`
>>>>>>      are pointed to the same page that allocated by guest.
>>>>>>
>>>>>>      This implementation has serval benifits:
>>>>>>      1. There is no waste memory. No extra memory will be allocated
>>> from
>>>>> Xen heap.
>>>>>>      2. There is no P2M remap. This will not break the direct-mapping,
>>>>> and
>>>>>>         is MPU system friendly.
>>>>>>      So, on Armv8-R system, we can still keep current implementation
>>> for
>>>>>>      per-cpu `vcpu_info`.
>>>>>>
>>>>>>      So, our proposal is that, can we reuse current implementation
>>> idea
>>>>> of
>>>>>>      `vcpu_info` for `shared_info`? We still allocate one page for
>>>>>>      `d->shared_info` at domain construction for holding some initial
>>>>> meta-data,
>>>>>>      using alloc_domheap_pages instead of alloc_xenheap_pages and
>>>>>>      share_xen_page_with_guest. And when guest allocates a page for
>>>>>>      `shared_info` and use hypercall to setup it,  We copy the
>>> initial
>>>>> data from
>>>>>>      `d->shared_info` to it. And after copy we can update `d-
>>>>>> shared_info` to point
>>>>>>      to guest allocated 'shared_info' page. In this case, we don't
>>> have
>>>>> to think
>>>>>>      about the fragmentation of Xen heap and p2m and the extra MPU
>>>>> regions.
>>>>>
>>>>> Yes, I think that would work.
>>>>>
>>>>> Also I think it should be possible to get rid of the initial
>>>>> d->shared_info allocation in Xen, given that d->shared_info is for the
>>>>> benefit of the guest and the guest cannot access it until it makes the
>>>>> XENMAPSPACE_shared_info hypercall.
>>>>>
>>>>
>>>> While we're working on event channel PoC work on Xen Armv8-R, we found
>>>> another issue after we dropped d->shared_info allocation in Xen. Both
>>>> shared_info and vcpu_info are allocated from Guest in runtime. That
>>>> means the addresses of shared_info and vcpu_info are random. For MMU
>>>> system, this is OK, because Xen has a full view of system memory in
>>>> runtime. But for MPU system, the situation becomes a little tricky.
>>>> We have to setup extra MPU regions for remote domains' shared_info
>>>> and vcpu_info in event channel hypercall runtime. That's because
>>>> in current Xen hypercall concept, hypercall will not cause vCPU
>>>> context switch. When hypercall trap to EL2, it will keep vCPU's
>>>> P2M view. For MMU system, we have vttbr_el2 for vCPU P2M view and
>>>> ttbr_el2 for Xen view. So in EL2 Xen has full permissions to access
>>>> any memory it wants. But for MPU system, we only have one EL2 MPU.
>>>> Before entering guest, Xen will setup vCPU P2M view in EL2 MPU.
>>>> In this case, when system entry EL2 through hypercall, the EL2
>>>> MPU still keeps current vCPU P2M view and with Xen essential
>>>> memory (code, data, heap) access permissions. But current EL2 MPU
>>>> doesn't have the access permissions for EL2 to access other
>>>> domain's memory. For an event channel hypercall, if we want to
>>>> update the pending bitmap in remote domain's vcpu_info, it will
>>>> cause a dataabort in EL2. To solve this dataabort, we may have
>>>> two methods:
>>>> 1. Map remote domain's whole memory or pages for shared_info +
>>>>     vcpu_info in EL2 MPU temporarily for hypercall to update
>>>>     pending bits or other accesses.
>>>>
>>>>     This method doesn't need to do context switch for EL2 MPU,
>>>>     But this method has some disadvantages:
>>>>     1. We have to reserve MPU regions for hypercall.
>>>>     2. Different hypercall may have different reservation of
>>>>        MPU regions.
>>>>     3. We have to handle hypercall one by one for existed and
>>>>        new in future.
>>>>
>>>> 2. Switch to Xen's memory view in EL2 MPU when trap from EL1 to
>>>>     EL2. In this case, Xen will have full memory access permissions
>>>>     to update pending bits in EL2. This only changes the EL2 MPU
>>>>     context, does not need to do vCPU context switch. Because the
>>>>     trapped vCPU will be used in the full flow of hypercall. After
>>>>     the hypercall, before returning to EL2, the EL2 MPU will switch
>>>>     to scheduled vCPU' P2M view.
>>>>     This method needs to do EL2 MPU context switch, but:
>>>>     1. We don't need to reserve MPU regions for Xen's memory view.
>>>>        (Xen's memory view has been setup while initialization)
>>>>     2. We don't need to handle pages' mapping in hypercall level.
>>>>     3. Apply to other EL1 to EL2 traps, like dataabort, IRQ, etc.
>>>
>>>
>>> Both approach 1) and 2) are acceptable and in fact I think we'll
>>> probably have to do a combination of both.
>>>
>>> We don't need to do a full MPU context switch every time we enter Xen.
>>> We can be flexible. Only when Xen needs to access another guest memory,
>>> if the memory is not mappable using approach 1), Xen could do a full MPU
>>> context switch. Basically, try 1) first, if it is not possible, do 2).
>>>
>>> This also solves the problem of "other hypercalls". We can always do 2)
>>> if we cannot do 1).
>>>
>>> So do we need to do 1) at all? It really depends on performance data.
>>> Not all hypercalls are made equal. Some are very rare and it is fine if
>>> they are slow. Some hypercalls are actually on the hot path. The event
>>> channels hypercalls are on the hot path so they need to be fast. It
>>> makes sense to implement 1) just for event channels hypercalls if the
>>> MPU context switch is slow.
>>>
>>> Data would help a lot here to make a good decision. Specifically, how
>>> much more expensive is an EL2 MPU context switch compared to add/remove
>>> of an MPU region in nanosec or cpu cycles?
>>>
>>
>> We will do it when we get a proper platform.
>>
>>>
>>> The other aspect is how many extra MPU regions do we need for each guest
>>> to implement 1). Do we need one extra MPU region for each domU? If so, I
>>> don't think approach 1) if feasible unless we come up with a smart
>>> memory allocation scheme for shared_info and vcpu_info. For instance, if
>>> shared_info and vcpu_info of all guests were part of the Xen data or
>>> heap region, or 1 other special MPU region, then they could become
>>> immediately accessible without need for extra mappings when switching to
>>> EL2.
>>>
>>
>> Allocate shared_info and vcpu_info from Xen data or heap will cause memory
>> fragmentation. We have to split the Xen data or heap and populate the pages
>> for shared_info and vcpu_info, And insert them to Guest P2M. Because Armv8-R
>> MPU doesn't allow memory overlap, this will cause at least 2 extra MPU
>> regions usage. One page could not exist in Xen MPU region and Guest P2M
>> MPU region at the same time. And we definitely don't want to make the entire
>> Xen data and heap accessible to EL1. And this approach does not solve the
>> 100% direct mapping problem. A special MPU region might have the same issues.
>> Except we make this special MPU region can be accessed in EL1 and EL2 at
>> runtime (it's unsafe), and update hypercall to use pages from this special
>> region for shared_info and vcpu_info (every guest can see this region, so
>> it's still 1:1 mapping).
>>
>> For 1), the concern is caused by our current rough PoC, we used extra MPU
>> regions to map the whole memory of remote domain, whose may have serval
>> memory blocks in the worst case. We have thought it further, we can reduce
>> the map granularity to page. For example, Xen wants to update shared_info
>> or vcpu_info, Xen must know the address of it. So we can just map this
>> one page temporarily. So I think only reserve 1 MPU region for runtime
>> mapping is feasible on most platforms.
> 
> Actually I think that it would be great if we can do that. It looks like
> the best way forward.
> 
> 
>> But the additional problem with this is that if the hypercall are
>> modifying multiple variables, Xen may need to do multiple mappings if
>> they are not on the same page (or a proper MPU region range).
> 
> There are not that many hypercalls that require Xen to map multiple
> pages, and those might be OK if they are slow.

Ok, I will update it in Draft-C.

