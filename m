Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 430BB416ACE
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 06:23:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194851.347182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTcj4-0001rZ-1t; Fri, 24 Sep 2021 04:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194851.347182; Fri, 24 Sep 2021 04:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTcj3-0001ov-UX; Fri, 24 Sep 2021 04:22:17 +0000
Received: by outflank-mailman (input) for mailman id 194851;
 Fri, 24 Sep 2021 04:22:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTcj2-0001op-BF
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 04:22:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.73]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42a149e4-f3d1-4a43-862d-6328430a4f54;
 Fri, 24 Sep 2021 04:22:13 +0000 (UTC)
Received: from AM6PR10CA0020.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::33)
 by AS8PR08MB6390.eurprd08.prod.outlook.com (2603:10a6:20b:31b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 04:22:12 +0000
Received: from AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::e6) by AM6PR10CA0020.outlook.office365.com
 (2603:10a6:209:89::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Fri, 24 Sep 2021 04:22:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT063.mail.protection.outlook.com (10.152.16.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 04:22:11 +0000
Received: ("Tessian outbound a77cafe56b47:v103");
 Fri, 24 Sep 2021 04:22:10 +0000
Received: from ba69f07cbf5d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A811D178-BB77-4615-B5D3-BF1A83F15D30.1; 
 Fri, 24 Sep 2021 04:21:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ba69f07cbf5d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 04:21:59 +0000
Received: from PAXPR08MB6864.eurprd08.prod.outlook.com (2603:10a6:102:132::14)
 by PR2PR08MB4668.eurprd08.prod.outlook.com (2603:10a6:101:1e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 04:21:51 +0000
Received: from PAXPR08MB6864.eurprd08.prod.outlook.com
 ([fe80::14c4:e1c6:bc6d:77be]) by PAXPR08MB6864.eurprd08.prod.outlook.com
 ([fe80::14c4:e1c6:bc6d:77be%6]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 04:21:51 +0000
Received: from [10.169.190.22] (203.126.0.113) by
 SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 04:21:48 +0000
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
X-Inumbo-ID: 42a149e4-f3d1-4a43-862d-6328430a4f54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70BDfoH8abFUJ4M2MbLLGe5j0d8DOpxenlSyI3vyyvs=;
 b=Ig43jKYQwXTYjHau/4p+BpK1E71DmCSodBQSeVu/7+/hkh0vef2jLEZZ49vI907OMgA1S1UgCVqtAFToyAH7gs3SbUxQQ2cqTAgMNK0zN7nmv7aFAxuj7XUi6We2xoW8NigAhd6EsR45/uyAtJ8Rp3tBxewY4cN04f2l/8hFx4Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 18c2473c1d1b7452
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IrHjkxOIP9NzLUAeor0glvLZIm4eq+OjwjunGFAnvGhjAdbrGtvd+rfWog76SK2dkFbZ3jQyQvVbIIEeB89GXb0qS52TuDp2NISou0Ga+4OoOVRVRtxLZeoBYeeADj31TCrmXRYzCUhhLTl4EAM8KEbMhrjjvfvG/1726/xyVg+7Nvk5UJ3QRxMK6o+U1pv3LyksHC1RDO6Erv09KsPO6tRdFH46CemS6J5gwsrV0ixu9f7qKUQGxzuK5jOV0RxJxwjJmIC9FJBRvriHq3b2/jjvejjyShgcYsMj9vhUNrV2bSpLYzYLX5pU/r3sLMYK1Y+a3mEGXamTJXH2wyXwOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=70BDfoH8abFUJ4M2MbLLGe5j0d8DOpxenlSyI3vyyvs=;
 b=C6BRpxlsDcbMg9FRXZMXIOdCaytzB1YRNyJYz/zCShJlYJwGA9RCxR0Oq8dTNnR2LbMQQO9hKdsgZbMgg5JGSCbjHzKaHE7tKC6AE3NukiJc0LFWlwT3O5PBWM3XjhwzxSj3rmWEQKrSZk0zz/xxgStLtYjGbqpfmDokRA5XAclXKwpXF4VRx/NlfMBldsb7X7BqV64Bgmty1X9cjzRbjFQ6hHCKt0HDBUYxWTm2m5CN0wF3/ACagZ8Ck3yC17iR3UXb6GJOgmL6xIW+VjxaIb+ASHnVC9GPGmsiaLMwmpxXh7UPyt0iBAQgq22FuF6sdkcqpZfa9NL/Zj/QXbqMJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70BDfoH8abFUJ4M2MbLLGe5j0d8DOpxenlSyI3vyyvs=;
 b=Ig43jKYQwXTYjHau/4p+BpK1E71DmCSodBQSeVu/7+/hkh0vef2jLEZZ49vI907OMgA1S1UgCVqtAFToyAH7gs3SbUxQQ2cqTAgMNK0zN7nmv7aFAxuj7XUi6We2xoW8NigAhd6EsR45/uyAtJ8Rp3tBxewY4cN04f2l/8hFx4Q=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Message-ID: <d4a91b84-5a71-e554-8bac-850946bd5b28@arm.com>
Date: Fri, 24 Sep 2021 12:21:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 09/37] xen/x86: introduce two helpers to access memory
 hotplug end
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, Bertrand.Marquis@arm.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 wl@xen.org
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-10-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231727560.17979@sstabellini-ThinkPad-T480s>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <alpine.DEB.2.21.2109231727560.17979@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To PAXPR08MB6864.eurprd08.prod.outlook.com (2603:10a6:102:132::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61d8cc8b-e784-448e-faa5-08d97f12e18d
X-MS-TrafficTypeDiagnostic: PR2PR08MB4668:|AS8PR08MB6390:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB63906E3018818C45727841D69EA49@AS8PR08MB6390.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bKYYsccn17M1ULiCa86iVP9qsWr/Klh7uDE5nealHjyy3nnAmLY0jZU/vwlMltUCL0nkfaidRyJAVYgHENY8LRcANtawxme2wEo1Og6xlWLpxw51vKsljYl/Ph/TlHxkDYW4v7ni6KJcBpPwOgCrvo249aUm9SNCmJUZQBh8EHU5Kse1TtNpGsq60/weisiQrplv4g86sie1kV1ls5UPSWpGSPYPol21S0370BlUkdWtTZGa6+sBRNJZX3JHP2/LbZYzk2TYWxJpfMfKTX33tTef1ykaNZ6PELc8Q948auciZigy66ZHTE7Gs0Lzi6l6gxX748X/w2OSpW8BPstQDjXm3TrUIDmzO6KWzU/1Lv5aWfqvc68usG7nKQ/gj/4LYJ8puzob35u3Ht20klqYc3DEbUmG6oYDMvNqH8MZtRixwYY/BIPtKX4lWFTkhZ3KJR/fIGPsUaXOiOo8SbU2K8Z9KfLhFo4b9Hd7y7qN8vm8V51Of1CTmqt53e6xNDpYwM7PRuo+9uBnQPHn7ATI3tW6+aY/ql5cSTLV6eRAUlsq8MP4MQ72UMTfWePQYBGSA6DYOWoghV7t7ohCCQ7wmOAsHvqKJNM8w5eijPxk7S505b3GqPdi/nZirzDp66X8FFrr7u15ENreSbZdaT/6zIEzsHUZJS/bykc7MNQw9VgkPLmDxm9pSCkaQqEkbAVOrZnW/IDGbaObJ66ArRsAFS80SqNfx0gPjxfeOClYB3M=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6864.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(186003)(31696002)(316002)(16576012)(53546011)(66946007)(26005)(66476007)(66556008)(2906002)(6666004)(31686004)(4326008)(8936002)(6916009)(5660300002)(38100700002)(86362001)(956004)(2616005)(8676002)(6486002)(508600001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4668
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	75e81188-7b3b-411e-a791-08d97f12d4fd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mkMY7qvB9p0nIHB6Y+F9as1OzrU6U1+j3D/LhPslcXNEX3gy3NHG7yuCOAoJu2qPJN27fXBA5qYPvvEfr4euoD5y+jGdPGGIKR1lfqdEGhJms14gwmO3XOJ86KaQTTQk4ZyEH5yQ6JZfNs5ByG1agbuJZok0IgAD9EwCS+ejitHlLhZw/RhGrF9MKzE6sMhBtbdUviUZLF65cOA1jaiHZIlxRMT133X/YHX508eqnQi8Qo7UEftXid7WrBkJMSF5PzfA3+ueyX7teeRhYe1UFqK8dKK1WdDUTKGUWZkqauPW8yM5zRkoCj86WvuNms4cQC/oADKZohi4BPTv9WjVEBio9kqrb1+mvU7N1wZyA7/8iVksLgpDOvzxtLYPkbyvTu20a8KTlgL9ZMJxFI7HbiapEfde6lvH7w+P82TvKcrZ7zdpqw8YW8VkRc3o3aGaJjqGC92khahEVs0fF20Z6zvCrba08O9eKw3SgIqtl+jpZZJJCebbNenjm4g+H/pt2xBqYfflQF6kx7eN5diIHrftR4zbeYqtrffS24sJ0+9HKvZOsv25tbw0boMgvDUV9CofMwqmol7iVTQAz46SOFvwd7St8DQri8bfatnFH3XTU6mMT8hPyZ4D+lYQtgsFJrb1NeXdZsDqb9UJBUcSacx31k+LNf1VjmD2jgDip2eMVqA4F18VsTawvRCEdxbx5z3jN+qOL+Ammt+yXq+2I116/a7VPWZRH1qJlOhOlAs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6862004)(316002)(70586007)(508600001)(2616005)(8936002)(6486002)(31686004)(8676002)(6666004)(26005)(82310400003)(70206006)(83380400001)(4326008)(16576012)(31696002)(5660300002)(186003)(36756003)(81166007)(86362001)(47076005)(53546011)(356005)(36860700001)(956004)(336012)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 04:22:11.9363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d8cc8b-e784-448e-faa5-08d97f12e18d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6390



On 2021/9/24 8:29, Stefano Stabellini wrote:
> +x86 maintainers
> 
> On Thu, 23 Sep 2021, Wei Chen wrote:
>> x86 provides a mem_hotplug to maintain the end of memory hotplug
>                              ^ variable
> 
>> end address. This variable can be accessed out of mm.c. We want
>> some code out of mm.c can be reused by other architectures without
>                         ^ so that it can be reused
> 
>> memory hotplug ability. So in this patch, we introduce these two
>> helpers to replace mem_hotplug direct access. This will give the
>> ability to stub these two API.
>                              ^ APIs
> 
> 

OK

>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> ---
>>   xen/include/asm-x86/mm.h | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
>> index cb90527499..af2fc4b0cd 100644
>> --- a/xen/include/asm-x86/mm.h
>> +++ b/xen/include/asm-x86/mm.h
>> @@ -475,6 +475,16 @@ static inline int get_page_and_type(struct page_info *page,
>>   
>>   extern paddr_t mem_hotplug;
>>   
>> +static inline void mem_hotplug_update_boundary(paddr_t end)
>> +{
>> +    mem_hotplug = end;
>> +}
>> +
>> +static inline paddr_t mem_hotplug_boundary(void)
>> +{
>> +    return mem_hotplug;
>> +}
>> +
>>   /******************************************************************************
>>    * With shadow pagetables, the different kinds of address start
>>    * to get get confusing.
>> -- 
>> 2.25.1
>>

