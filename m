Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B5266BA27
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 10:21:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478483.741707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLfq-0001no-Lf; Mon, 16 Jan 2023 09:21:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478483.741707; Mon, 16 Jan 2023 09:21:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLfq-0001kv-Ho; Mon, 16 Jan 2023 09:21:02 +0000
Received: by outflank-mailman (input) for mailman id 478483;
 Mon, 16 Jan 2023 09:21:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Os5i=5N=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pHLfo-0001kp-IP
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 09:21:00 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2070.outbound.protection.outlook.com [40.107.14.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15f8da1f-957f-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 10:20:58 +0100 (CET)
Received: from AM5PR0201CA0015.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::25) by DU2PR08MB10186.eurprd08.prod.outlook.com
 (2603:10a6:10:46c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Mon, 16 Jan
 2023 09:20:45 +0000
Received: from AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::48) by AM5PR0201CA0015.outlook.office365.com
 (2603:10a6:203:3d::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 09:20:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT005.mail.protection.outlook.com (100.127.140.218) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 09:20:45 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Mon, 16 Jan 2023 09:20:44 +0000
Received: from d3c8cdb384b6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9751E32E-072B-4172-A80A-8874C680B298.1; 
 Mon, 16 Jan 2023 09:20:33 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d3c8cdb384b6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Jan 2023 09:20:33 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by GVXPR08MB7822.eurprd08.prod.outlook.com (2603:10a6:150:3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 09:20:31 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::72d6:6a74:b637:cc5b%3]) with mapi id 15.20.5986.023; Mon, 16 Jan 2023
 09:20:30 +0000
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
X-Inumbo-ID: 15f8da1f-957f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhM+jXBFcFHhJjrttRCB+P3RodE670Fip/KL5D8rZyo=;
 b=EzISAtW/nRMflJZJvhrOZHyCqZhQCYfnMo68YQl5uk2faQQbgqgfJfp8dMy8Ox5dbdlgtIuZnmd7B3BvkLOyHRKkhwRr7pFYx1Y/kUaulIDo27UipFlLxs6cuJMa9XBF+CUbfNLYGet1V46ZPGvJ5O5I2ksA7Tk3XYFwRaW/6TI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c4b931767f79c115
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlrDW2/mCJ4i6KnXm5KYweBro/e6pZGNetvGoJSUkXqxoBOk5v9jF4DrLOdbcFTUiOm6jgkC4XljHtIU6J5G6uwmYQCh4IHReZjsCn7AHrQ+6+x2TzfVJ/ffwYtXBhIMmD4hWKN2JPJBt19LO/IvCBxll2YzpNM6j8p9bCCY5nxy+O0/gYqeJwr1RVOTYImu+Aemz0Y/BfclRc7CUx9ED6SbIO9N7W8Dao7FOTwRnGEbeCWuE7DliA/rv/AsDcAMynO15HIckCz1gnivZg/vqnxRvaVbl1d4g23E9quLLebwNIPamvTpaQYcSj6QMWImKngWye3znLewWV4n7PnYvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhM+jXBFcFHhJjrttRCB+P3RodE670Fip/KL5D8rZyo=;
 b=TA7grINL4s7QWCAAEqQ/tB8fp0MXXSKGnHZjvkUJ0VTfibMmI6tNDUGNy1+53ngOErmx1M1FQevwwgD1IbbBO5FgAwUHifrEOBTqNYvzLFWEqrxPOcgRBLmhCVeACH15iSdOCt35zDDUrLYUK2cvaWx1kpxvH/dUHaRPo7ubxa/8vGTZNG76UeF8IIcIQZyUsQK9+kZKRrMNG6q70ZZdL5IXjXX7efMONEhWOkrugvLshn3mWML/NQFxa9qGFC7fXQjzrqPc6U7mL5Z36AMCwsvDJzyJD8QGhCgzaEzDXyzk3uYa55rS3wSBxsOATEgGA/BttU2MXkY7oo0/RLrqcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhM+jXBFcFHhJjrttRCB+P3RodE670Fip/KL5D8rZyo=;
 b=EzISAtW/nRMflJZJvhrOZHyCqZhQCYfnMo68YQl5uk2faQQbgqgfJfp8dMy8Ox5dbdlgtIuZnmd7B3BvkLOyHRKkhwRr7pFYx1Y/kUaulIDo27UipFlLxs6cuJMa9XBF+CUbfNLYGet1V46ZPGvJ5O5I2ksA7Tk3XYFwRaW/6TI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <cb2ba9fe-e29f-c44e-9139-701f894060a8@arm.com>
Date: Mon, 16 Jan 2023 17:20:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 02/17] xen/arm: implement helpers to get and update
 NUMA status
To: Jan Beulich <jbeulich@suse.com>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230110084930.1095203-1-wei.chen@arm.com>
 <20230110084930.1095203-3-wei.chen@arm.com>
 <9e32ffa1-1499-f9cd-7ca8-f9493b1269cb@suse.com>
 <PAXPR08MB7420E482CACC741B1BA976569EFD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <5a802657-a6e8-9cc3-fefb-09a7e68d1e5e@suse.com>
Content-Language: en-US
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <5a802657-a6e8-9cc3-fefb-09a7e68d1e5e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:404:42::24) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB7420:EE_|GVXPR08MB7822:EE_|AM7EUR03FT005:EE_|DU2PR08MB10186:EE_
X-MS-Office365-Filtering-Correlation-Id: d843a37f-daa7-4b48-42cf-08daf7a2f2ae
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NRb10WlaMXOSoz1Qg/Y2cwiVJmg/uplwgkNXY9V062pRqIDCCP3F2Grt/vo091YyLWsdWiqrLHDCKg0tXiynApITkGMGKIWemgRylfiGuF3Nb8bghK6J4NPm9OLIqt8Wg3/DBoZL8AE7h1n/CjkKNPfPQUz35HHHe22WllUdH72f0bH3DCQjVD3XaYTX67E/wZJM8mQJLvT0GpUXluFCCcfRrtFTOTZRdxlEOEln3RLkBNJ+IbkdXVA+UFLMJzfJmOD6eLYhkGXVh3DbW/ECExs3Bcg9xvUtbIJVRHfQd1zewEhcNuR2F2oOhHrBCe90+0jfWgsudFbCUG3Na+J5vvTUg/ZlpIcolpHDF4WmSpTmPPSWD4vlhlY7Accb0HUielRuY+rLeNUA2l5Gt4eHRjMhC5JWcf5vNkiPl6uFp2DAxYVYrWRPbJ5wev65npqDqUFfL904cT9C+AB6Yv027FOuz8lpBa/DMRR30GP7T1cR6d4LDB27cO3eP6/Elsq+nKj0j4LujHt0jLGtcBSrJbyL6QTXBltREwlPgrmTxpdC7do8CaqQlujkX1yUoKLgO6bsd/zBcQ2h4hKdNOqa4UhIqkSC13tNNF90HvhF7lb0FrqyYz9jDsCGC5DvmI6ZSmE0UOSqjLgyfIplEYVqSVGMR0BGjXy8KthB3ekG5icPM6cfnyLg5mXIgOfOPF44HSRBWJqlt5QrJvQ9Ugrhu+9aelkS59/Llx36CmRrU6I=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199015)(8936002)(31686004)(26005)(41300700001)(66556008)(66946007)(6916009)(8676002)(66476007)(4326008)(15650500001)(6506007)(2906002)(53546011)(316002)(2616005)(6666004)(36756003)(5660300002)(54906003)(86362001)(478600001)(6486002)(186003)(83380400001)(6512007)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7822
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bcd24e08-df85-4ff7-d085-08daf7a2e943
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sY/6bLdZB9gf0Y9MWmiInkh29/HJhn234jwlK17GSNIqTKDMgOMtEHhST+uYSyjc3UZ1ELbS/hCKh4iBySHC6q80jHgGDGLsaA6DBclkpLTSCUYYX6/O29IRzXn5uIsvmkyjggqdyabayFI2Jm9RgI/ENbXT+GQb9oogPwfLeFzoSOHh2/cn9N8xLiCIYEnCDufwznPdmMd9QWyMY3rYAF4IeAdUNmdFN5HxnMGK2fYuUJJYKtKGhLrttF++w1vWA/mwsBDJZhqXe8T1Oj1cMnYCbGZVNijkDkVRGtybcf/T5w42BdAzqbuht4tNtSeDauJV70ZMiwKt39ZFinogQVu2OjPNhedeFrYWb9GLWGjr3rP9ZuyzkOYw7+tHJMdR28cik7nY1G/Wfhg8k1RHa3em6Q9mV3H5yziLft38dL2IEY3gof+UCuddxAE4lNIT3XBA/kI54MOZykHYEJdiyJ+UU5auz6m23o5MngQ4YoD4o44E0qXUwIOIq85OzFCVvetOccD2YMXk1c+657PUOzK7UjCrFgTuGef6+mtiOn2UOzKB7OtYjDGTbrrnaf9dxTU9+n4TmNDcAnbdgYQwnX6+JXqKT+0mZ6LyubuD81xDz49+1hHQw1NNyxg3+ZU6Z7pKPhj/rPbqjqbjLXLF0+ScP3M9eC87XqriNCczY2RtbBvWtPXt81N9w6rMpT590pYGJ0upvF82r10LUINI6BGPFYfDJDQ5S8yIWm41/fM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(46966006)(36840700001)(40470700004)(31686004)(83380400001)(82310400005)(70206006)(2616005)(41300700001)(70586007)(47076005)(186003)(8676002)(4326008)(6512007)(26005)(36756003)(31696002)(86362001)(53546011)(5660300002)(36860700001)(82740400003)(8936002)(6862004)(81166007)(54906003)(478600001)(6506007)(336012)(40480700001)(316002)(2906002)(15650500001)(6486002)(6666004)(40460700003)(356005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 09:20:45.3834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d843a37f-daa7-4b48-42cf-08daf7a2f2ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10186

Hi Jan,

On 2023/1/12 16:08, Jan Beulich wrote:
> On 12.01.2023 07:22, Wei Chen wrote:
>>> -----Original Message-----
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: 2023年1月11日 0:38
>>>
>>> On 10.01.2023 09:49, Wei Chen wrote:
>>>> --- a/xen/arch/arm/include/asm/numa.h
>>>> +++ b/xen/arch/arm/include/asm/numa.h
>>>> @@ -22,6 +22,12 @@ typedef u8 nodeid_t;
>>>>    */
>>>>   #define NR_NODE_MEMBLKS NR_MEM_BANKS
>>>>
>>>> +enum dt_numa_status {
>>>> +    DT_NUMA_INIT,
>>>
>>> I don't see any use of this. I also think the name isn't good, as INIT
>>> can be taken for "initializer" as well as "initialized". Suggesting an
>>> alternative would require knowing what the future plans with this are;
>>> right now ...
>>>
>>
>> static enum dt_numa_status __read_mostly device_tree_numa;
> 
> There's no DT_NUMA_INIT here. You _imply_ it having a value of zero.
> 

How about I assign device_tree_numa explicitly like:
... __read_mostly device_tree_numa = DT_NUMA_UNINIT;

>> We use DT_NUMA_INIT to indicate device_tree_numa is in a default value
>> (System's initial value, hasn't done initialization). Maybe rename it
>> To DT_NUMA_UNINIT be better?
> 
> Perhaps, yes.
> 
>>>> --- a/xen/arch/x86/include/asm/numa.h
>>>> +++ b/xen/arch/x86/include/asm/numa.h
>>>> @@ -12,7 +12,6 @@ extern unsigned int numa_node_to_arch_nid(nodeid_t n);
>>>>
>>>>   #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
>>>>
>>>> -extern bool numa_disabled(void);
>>>>   extern nodeid_t setup_node(unsigned int pxm);
>>>>   extern void srat_detect_node(int cpu);
>>>>
>>>> --- a/xen/include/xen/numa.h
>>>> +++ b/xen/include/xen/numa.h
>>>> @@ -55,6 +55,7 @@ extern void numa_init_array(void);
>>>>   extern void numa_set_node(unsigned int cpu, nodeid_t node);
>>>>   extern void numa_initmem_init(unsigned long start_pfn, unsigned long
>>> end_pfn);
>>>>   extern void numa_fw_bad(void);
>>>> +extern bool numa_disabled(void);
>>>>
>>>>   extern int arch_numa_setup(const char *opt);
>>>>   extern bool arch_numa_unavailable(void);
>>>
>>> How is this movement of a declaration related to the subject of the patch?
>>>
>>
>> Can I add some messages in commit log to say something like "As we have
>> Implemented numa_disabled for Arm, so we move numa_disabled to common header"?
> 
> See your own patch 3, where you have a similar statement (albeit you mean
> "declaration" there, not "definition"). However, right now numa_disabled()
> is a #define on Arm, so the declaration becoming common isn't really
> warranted. In fact it'll get in the way of converting function-like macros
> to inline functions for Misra.
> 

Yes, I think you're right. This may also seem a little strange,when we 
disable NUMA, there are two headers have numa_disabled statement. I will 
revert this change. And I also will covert the macro to a static inline 
function.

Cheers,
Wei Chen

> Jan

