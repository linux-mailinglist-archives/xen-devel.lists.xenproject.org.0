Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A4E50FBA2
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 13:00:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313804.531559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIvO-0003xf-5C; Tue, 26 Apr 2022 11:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313804.531559; Tue, 26 Apr 2022 11:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIvO-0003vZ-1F; Tue, 26 Apr 2022 11:00:06 +0000
Received: by outflank-mailman (input) for mailman id 313804;
 Tue, 26 Apr 2022 11:00:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BNuI=VE=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1njIvM-0003A7-6F
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 11:00:04 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe05::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05bc11d6-c550-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 13:00:03 +0200 (CEST)
Received: from AM6P191CA0025.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::38)
 by PAXPR08MB7573.eurprd08.prod.outlook.com (2603:10a6:102:24f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 10:59:59 +0000
Received: from AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::1d) by AM6P191CA0025.outlook.office365.com
 (2603:10a6:209:8b::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13 via Frontend
 Transport; Tue, 26 Apr 2022 10:59:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT033.mail.protection.outlook.com (10.152.16.99) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Tue, 26 Apr 2022 10:59:58 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Tue, 26 Apr 2022 10:59:58 +0000
Received: from d9a305b031af.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D01BA725-81AB-41D3-986D-296903CEA585.1; 
 Tue, 26 Apr 2022 10:59:51 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d9a305b031af.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Apr 2022 10:59:51 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM9PR08MB6177.eurprd08.prod.outlook.com (2603:10a6:20b:283::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 10:59:49 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb%8]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 10:59:49 +0000
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
X-Inumbo-ID: 05bc11d6-c550-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3bV0rwMkei3xP2B21Qm5LGLf8dYE6TXpI/IbhNWhMs=;
 b=OVVUr+S1SblObs0ueg9cgFuCPSbKNJjrc1kGqseKkGqnR+QBo7XAUP1clQXwThNBtn1c4FjG5WJJ2zHb95xTq5pkIpNc+hddeYDFfO+LjomE7j86ljUucA0xaIRtu5UcpX+JLnp4IFVyGYwSw6atasJIM/4Zo+f2J+t5K2iU+Tw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 90c8565e809cb89c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ER0oBGjFfwndL5qkuE56CyJYTE6aw+UKLXs5RjO02bBCE6o1qyUmmRkcWN0WnK//Cyxptm7bibiAIpHux8t1zYCDerOEkB7ZwgW6P9qPcMMojEMCfGiczjDrUjz7s9wP0BCL9RNjqzKNHuec654hIf9tlZsTJjY1FsS5Fm1xaVuZ66UOmOSh4iyDl+loUIlYU7sLPGKzrTbEOnGEQCFmgAlZKLrFtZC0dxSmKJgSPlmE6SRKRpTWHG17qnp+qH6mht/FTjaNyrUC6D4DyO0frxNEgSVT0mEGXIWcgROtS39HoFxcK2Pajz19kSucPGST78qfPLki3ucs1N1EudlxnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3bV0rwMkei3xP2B21Qm5LGLf8dYE6TXpI/IbhNWhMs=;
 b=NX7LHT5D8cPr5Ianrtq/x+y5b3Y0tAXRkQo3M34o89e/z9nN+hRzNr3aQu1DwtOR5jA7t82i5nywDdO4IbIdmNlAQkdCxkGjXRVlQfhkQpDiohlUJBsi+P9wQCGEVfTx1lReD/s/PLxt/pDkQx8Ecae0bD+M1Kx9RmHsbrC8SwVox++REBFSDZsR6pB8ZfJ0w2a9PW4EpA4kqyy293mMQcJNCsagjhTnrCkdvQT3MUJBHlK03/P6J2BcvpCfNpGHRjcNZJ7JHJMACCFmMLyH11OCiyNtXAGA3dpaCPrZChpTfA0eBb8amOHtMQCb77rG8BoV8lFKnNUOOwkHlBw72Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3bV0rwMkei3xP2B21Qm5LGLf8dYE6TXpI/IbhNWhMs=;
 b=OVVUr+S1SblObs0ueg9cgFuCPSbKNJjrc1kGqseKkGqnR+QBo7XAUP1clQXwThNBtn1c4FjG5WJJ2zHb95xTq5pkIpNc+hddeYDFfO+LjomE7j86ljUucA0xaIRtu5UcpX+JLnp4IFVyGYwSw6atasJIM/4Zo+f2J+t5K2iU+Tw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <7d7fc887-20a3-49c3-0754-3bca3442ccce@arm.com>
Date: Tue, 26 Apr 2022 18:59:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 05/10] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON
 for phys_to_nid
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220418090735.3940393-1-wei.chen@arm.com>
 <20220418090735.3940393-6-wei.chen@arm.com>
 <6d666aa4-c0d3-b8ed-9fca-e9d2179564d3@suse.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <6d666aa4-c0d3-b8ed-9fca-e9d2179564d3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:4:197::12) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: ade1cad8-57b1-4f88-6c73-08da2773e79e
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB6177:EE_|AM5EUR03FT033:EE_|PAXPR08MB7573:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB7573DD76F6490F183B2D7FF09EFB9@PAXPR08MB7573.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lL/JIo3sY2B4jt9B5u+gOE3qsNDlth1Wm8XnpyLrGCoEDdecknA4my0Rfp8mpi9v7r44mAJQFTNvgteRAYjqNXi7LRzhiI/BHlXLYTpHmQu0OeFhK0lSE7mEwJXVcIS7cMuSQxd/mLIfT81fU9GQZOTUc3suMvx0cqBfjBB/JQjC23qPVSbjt0C7yTHn9iFnzYuXZg3bIcW+24fWoglrMaGVH+XE0KPS7AEQ6ky8jSxqBPobjZamxcemqgkuPdwr3mYOC478otMF/vd8A3SbdQBEQCUtGBeijuPUul+pclmHXU20x5zW5fKSDcuIY/uHPgW4CTV+HHJ7gB7vQejxwr6t8R3DiGbR9l51InnUH77mHRzviJEGtXcOXK7oE6zcSpagmduwdaQAL5N4xDJQc1bdITajfTaCxr7vywzxf8+nmY10xgClrrgI+eH79wsqaZMWWXwYYDq/k7o8mRCzrD1nSYpS5hDmtD4WQGtLeJOIym68mDfQb2+bdWGpS13vtT4uVGLZbTXBbot0pK56fLNjQGVcIqQPEbBCfPkeNcD7Y0QL3b27iWFrhoNqOxDBbZgRcoF4UKgQlupav+Bl7QHPAKv4BldvqQ00Du4u3PN+YmpJ22BYtRckn9DgFmZdS0lGCX8ftZO1V/b93aWbTEKL6OKohwfQxU7Istr+f1zgTsJlOZ3qIE1SkTRiPcuYDfabyyynqMlxhEFHWCvrgZEE57k8a8IrYA0fFSDwzPY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(26005)(508600001)(31696002)(54906003)(6916009)(66476007)(6506007)(6666004)(8676002)(4326008)(6512007)(86362001)(316002)(66946007)(66556008)(38100700002)(53546011)(6486002)(5660300002)(36756003)(186003)(2616005)(8936002)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6177
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6219f4c6-fb9f-414c-771a-08da2773e1c7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WNogcQ8tUh0+NRxGY9a6yCrt0YKicrTu+abH7p4vIIemamfMiYEa0orPnXteLgemu5MFq23nQbgDxEfsEWdBrycEG69eIwr/IUdgFL4M/+zOP67KNGAAurMDjBWCSp5C+So5ErwfuAGFENkT/LXh6nfEYLThSMX24u6wuHHdRni+TFclP0PQpL4umUo7wQFVf5Uz+Bz5glzAMEWDatu2z8Tyy/1FmEsPn5mw4H0Pwyw54/05rDZ1PP9omqPb6z8AIsck9RB8zgGKeb8DC5O2POtdy7t7Ot4+5UHiYKEeIXRWRyVaYOWFdM6/48TtkBmmrA3+hEzGiigwkYCfnQp53OcoCe6LF6RQ6EtWhEm2G3s9IwyvneM76Bi+mPGtMx79geM7Ia1IRsA/OFG+Zokj5E/2wib3WzqZirrWQ7wFToJNVIQFGepeO7/7031VU1qAkGvhQhdYeb9cHM9qijMSZoo/JvvUC1OBEBgwjietunhcyy08Uq+tpZQE7pEhVP13Mds3imaQLfgrnTQY0sf95pm0ez7fvALfN9TQStXBkCmW1c1maq21HMPDfWDBKpmc0dE+jVOxqFvriPyvlz4V3BPp3nSjPUupkYvZ9HB81IdYRfaU4d6ldH1oZ/EE+VZZ5H9CvXuI9S19a0PePXF8XiheHthagXpbCzXI+8giAO1aE5xkHyRZsOq0Kp/62A/C68wqT8mL7QnxCyWMmpgcqQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(5660300002)(82310400005)(36756003)(81166007)(53546011)(70586007)(54906003)(70206006)(316002)(6486002)(508600001)(8676002)(2906002)(356005)(86362001)(83380400001)(31686004)(26005)(6506007)(6512007)(6666004)(36860700001)(8936002)(6862004)(4326008)(40460700003)(336012)(186003)(2616005)(47076005)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 10:59:58.6363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ade1cad8-57b1-4f88-6c73-08da2773e79e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7573

Hi Jan,

On 2022/4/26 17:02, Jan Beulich wrote:
> On 18.04.2022 11:07, Wei Chen wrote:
>> VIRTUAL_BUG_ON is an empty macro used in phys_to_nid. This
>> results in two lines of error-checking code in phys_to_nid
>> that is not actually working and causing two compilation
>> errors:
>> 1. error: "MAX_NUMNODES" undeclared (first use in this function).
>>     This is because in the common header file, "MAX_NUMNODES" is
>>     defined after the common header file includes the ARCH header
>>     file, where phys_to_nid has attempted to use "MAX_NUMNODES".
>>     This error was resolved when we moved the definition of
>>     "MAX_NUMNODES" to x86 ARCH header file. And we reserve the
>>     "MAX_NUMNODES" definition in common header file through a
>>     conditional compilation for some architectures that don't
>>     need to define "MAX_NUMNODES" in their ARCH header files.
> 
> No, that's setting up a trap for someone else to fall into, especially
> with the #ifdef around the original definition. Afaict all you need to
> do is to move that #define ahead of the #include in xen/numa.h. Unlike
> functions, #define-s can reference not-yet-defined identifiers.
> 

I had tried it before. MAX_NUMNODES depends on NODE_SHIFT. But
NODE_SHIFT depends on the definition status in asm/numa.h. If I move 
MAX_NUMNODES to before asm/numa.h, then I have to move NODES_SHIFT as 
well. But this will break the original design. NODES_SHIFT in xen/numa.h 
will always be defined before asm/numa.h. This will be a duplicated 
definition error.

How about I move MAX_NUMNODES to arm and x86 asm/numa.h in this patch
at the same time? Because in one of following patches, MAX_NUMNODES and
phys_to_nid will be moved to xen/numa.h at the same time?

>> 2. error: wrong type argument to unary exclamation mark.
>>     This is because, the error-checking code contains !node_data[nid].
>>     But node_data is a data structure variable, it's not a pointer.
>>
>> So, in this patch, we use ASSERT instead of VIRTUAL_BUG_ON to
>> enable the two lines of error-checking code. And fix the left
>> compilation errors by replacing !node_data[nid] to
>> !node_data[nid].node_spanned_pages.
>>
>> Because when node_spanned_pages is 0, this node has no memory,
>> numa_scan_node will print warning message for such kind of nodes:
>> "Firmware Bug or mis-configured hardware?".
> 
> This warning is bogus - nodes can have only processors. Therefore I'd
> like to ask that you don't use it for justification. And indeed you

Yes, you're right, node can only has CPUs! I will remove it.

> don't need to: phys_to_nid() is about translating an address. The
> input address can't be valid if it maps to a node with no memory.
> 

Can I understand your comment:
Any input address is invalid, when node_spanned_pages is zero, because
this node has no memory?

Thanks,
Wei Chen

> Jan
> 

