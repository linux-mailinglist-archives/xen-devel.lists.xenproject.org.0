Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BB95EEDE7
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 08:30:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413489.657160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odn3e-000480-FX; Thu, 29 Sep 2022 06:30:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413489.657160; Thu, 29 Sep 2022 06:30:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odn3e-00044b-CT; Thu, 29 Sep 2022 06:30:06 +0000
Received: by outflank-mailman (input) for mailman id 413489;
 Thu, 29 Sep 2022 06:30:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YTqY=2A=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1odn3c-0003iZ-Dk
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 06:30:04 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061.outbound.protection.outlook.com [40.107.249.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25d9219b-3fc0-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 08:30:02 +0200 (CEST)
Received: from DBBPR09CA0035.eurprd09.prod.outlook.com (2603:10a6:10:d4::23)
 by AS8PR08MB9409.eurprd08.prod.outlook.com (2603:10a6:20b:5a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15; Thu, 29 Sep
 2022 06:29:49 +0000
Received: from DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::a8) by DBBPR09CA0035.outlook.office365.com
 (2603:10a6:10:d4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20 via Frontend
 Transport; Thu, 29 Sep 2022 06:29:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT036.mail.protection.outlook.com (100.127.142.193) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Thu, 29 Sep 2022 06:29:49 +0000
Received: ("Tessian outbound ce981123c49d:v128");
 Thu, 29 Sep 2022 06:29:48 +0000
Received: from 02771064c05e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2F5983F2-E2F5-4354-8EB3-E4441479A2C3.1; 
 Thu, 29 Sep 2022 06:29:42 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 02771064c05e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Sep 2022 06:29:42 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by VE1PR08MB5805.eurprd08.prod.outlook.com (2603:10a6:800:1aa::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 06:29:38 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::6f9a:a2b6:e5d3:349e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::6f9a:a2b6:e5d3:349e%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 06:29:38 +0000
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
X-Inumbo-ID: 25d9219b-3fc0-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=LAbOFx63XJRteHNltl+VRmxBDSki6THR2QhIW/AltE69fW4IJo2A666BE+9O9CklhNDNV4lLssaWpMDc915NijvHMc1wVgwVZAYhtUvOHyFzA0nHOtcckhsADR6IxiCFN2q82XPYF9Cs/n6OsBLGKcC2BiSNHLdLhKyjU2CHDHuOa9yqSnuuS8FEmEhC/flpaT3FPcyW9dlOGD16cYf2GB2blkM25VtMaOrfdnkFtSQjT08dg+PXU2eGxLtO8hvvPygnjasNA7+iFOoCc8ua4f3lq9GOWqWu/bIbROmClEAM27QCPutYkZxam5P+O9WOrsRw//WBFXZl3KUza9nAcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YAw0gVf/fUr4SLwG77Ds/8+6rISHbIekQQqTPtcWXk=;
 b=D61087EcXnVltQeGJpEONGx8E+yylfu22FmzWNWuUtdnmCENyy3mySfaIirX2pDEGU/s8XwueqeS0Ue6bKo6Ptvoi99VeYpNPq1YNlDOwigYXMEwvlTt7RWKtVBkBfqTvB1rV2cByd32oWOk74Y4es0mpOEMpc3Daup79mgRk1sB7HyAy63uTTOOZ6TsMP0Q3SMcW3CTKhOH6hpB8fYujn6sbLqNvorttCAfAukX/vTdZdhX+bP2aeMMBe5GajL80yg0y7RFxnJRnFsXZWS0fGXjhIgPPPEcIMnsLPJFYOq9Eo7AjVIffv1/pWJgyDBHmB/oP0FKBOgCre4SjATphg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YAw0gVf/fUr4SLwG77Ds/8+6rISHbIekQQqTPtcWXk=;
 b=OjZADj1KdM3OVo59iqqEfYUQb/76aeV4c+YqCoCx1bG8MOE3c6DNtSqTdwFzf4MzbHfLMwZb7tyRqMpcgkTNPy2HccuSeh/CbVIcYgi1qPk/CTuKlfuWKfJ3XtXmNDHuuVfHCF/BRdM3wIrq/YHIFNYEmTmw+XcDWb4b0CrpNWk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bda4f4f6d8e593a6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofV5m+GKBrTZ89k+aNHbnGc3dPoF5aORAxDLVVrySVTgHFaL3ZpQdyLvzzPLRY2rU6jXd9OCDMJl0wXIKRgpW/6k9HyJITy78j/JB04VWmQduQ0Iq5fnQ9IZtAItI+bq4dJjt9p2TjW7WX69q3bcicRKmCD5Wq1a8K0E8KTvKpRS3o8orRspLhEm8B797w/Z5dewU36At4kIaQ+yEH8evOneT12z+s3g495f7ZpVk/K4iW0BIsbV/ceJddvnFCbLkVC7YAcKKoS3ApuwvibZ15/eh+yQMIDJcblvKsTAaDw+BTTSKXyrmqm+hei1rZ4Bn/abNQLpFw07Gin5ptrRyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YAw0gVf/fUr4SLwG77Ds/8+6rISHbIekQQqTPtcWXk=;
 b=WYVmbnUDovp/JS1XTWQuB+MkL29g7AobLN5fivkp6FoF4TAXrLMdoBPZb77Uq/0URuXVxHc0V1R2ifkDkmc99DQRck1BHXFIIs2wMzqh8CkCjEqSs3fmfuvI2sQWKy6pZadavrVc9qkLoHE3kR//7Vd8BNpFDYtJ9oNv/Mt4jy4g5jlR+hviSwKfWyhqH5cG/BCQm0FW/C7IuZKZyqebOsmZrGwWAoY8eZwIHTMPdoMbMsP35DZN0osIFU8Hp8lsndu0dbV2TKjflRmEAMSXok8V3GuC/xEMWVsvGaEn5e0idL79qe76xLXgoRN7MvxzcC+6zjIgp9xe0h81H7IwRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YAw0gVf/fUr4SLwG77Ds/8+6rISHbIekQQqTPtcWXk=;
 b=OjZADj1KdM3OVo59iqqEfYUQb/76aeV4c+YqCoCx1bG8MOE3c6DNtSqTdwFzf4MzbHfLMwZb7tyRqMpcgkTNPy2HccuSeh/CbVIcYgi1qPk/CTuKlfuWKfJ3XtXmNDHuuVfHCF/BRdM3wIrq/YHIFNYEmTmw+XcDWb4b0CrpNWk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <1b2c0122-19d0-1478-0b51-6cb685a5273b@arm.com>
Date: Thu, 29 Sep 2022 14:29:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v5 1/6] xen/x86: Provide helpers for common code to access
 acpi_numa
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220920091218.1208658-1-wei.chen@arm.com>
 <20220920091218.1208658-2-wei.chen@arm.com>
 <5547335f-9e01-d461-f866-c0f823aa2814@suse.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <5547335f-9e01-d461-f866-c0f823aa2814@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0053.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::22)
 To PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB7420:EE_|VE1PR08MB5805:EE_|DBAEUR03FT036:EE_|AS8PR08MB9409:EE_
X-MS-Office365-Filtering-Correlation-Id: dc5879bb-8c46-4ec7-d26b-08daa1e40258
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ad9r48ar7JB5HCvJJ7tGJCTG28QYX+t7yAeB9p7v8flC9akgIiEHeEtUooDBbDI3Y3wmdmG8zehVeO+ORVT3qRERtnfh+w24sHK9MxTRpkC6soSxM/XU46XFlto2wCGzOEFJvmtwLfZpvn69d7nxK7/N48VHJX+mPoFM6364QoXLwekwseVLRULB6bO+eeXYq6/tYmEJJZX9wW65HKOxiEZKPAhsK2UAC4wmnmDNPfeyoTSlrbzD/Dvua5qpm5UFs8JWGiN4ULOtD/BGcOqMXq13cXJT6xGXt5k9aJem58Vx7Ocg8a9Fg3S6n9veQib5YMmxeMA22jqNVBxrIW/NKoWHdKmte5iWCFD1FIsIn2sH1uBleFsCDL7s9XHtpP9O6wfaYmyESm3/KobGZxcvdVRdQtJtikfFs6Ud0B7h5dHSm2O2j8tle9v5zA4iUyTmeX2HeaSeI1ZQpVVwtEHs/ka30Du3tzObwD/olqA43ZCzqYu9d4YChbfPfLLb7IqjmlcbzMF75aec2hiUDnO2q4Nt9bOxLx06FeUTM+qYLlwmTnDefok3NuBPYkkVOd73gOtmySZISxm27HSAm8k57QUbATk6X7gPuOGu2EfGgoDvhUHsLcqZKZGklNXnaVpyM9rnW3Vwk4X16xm1McCH+w00DcMn4hIVe/AzySX73wIKhFqCCgtQNdRGPdrPWBJGiz1ALtRTMkIze+0OL0SfzVBoI/GrZ48S3JjtNLW5VBCzAQJYR4IK+qDzWHFHz1D8DkxRVK2dTFU3FDlH1wcPoGyJFtl1ZM0x7QfXnb0f060=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199015)(31696002)(8676002)(4326008)(66946007)(66556008)(66476007)(86362001)(41300700001)(6666004)(83380400001)(186003)(2616005)(38100700002)(5660300002)(36756003)(26005)(53546011)(6506007)(8936002)(2906002)(6512007)(31686004)(478600001)(6916009)(6486002)(54906003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5805
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	581a831e-13b8-44e5-6ee1-08daa1e3fbfd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QYfSsSMM5zWcwS9Xu3KWHUQgGqSkt6G7wetjIVpQ+IrFY8cZMrc0OHuHajDwd+WStT/Q1WMqoq4HMBSraXzayE1IcQg/cBQxg7tPFhRfD3HQWdtbPQw/hd8tRwrsqj+nI5rmHCkCje7CQg/z00rtISBhAIO25QkFYz0Tdlibf9rdrSqdSuM7ovBj4caK2+h2zmbVr5GqNhTLhwiZZr65Iu4a9HZ+vKX5cdHOosKoIov7mz+tUah21Hsu0qEqk9mEt3sJQun2FGWPUQDLZAOzb7McOKsPpkXPjCj+/96NFuLe9fe/gC77zQk392CaPuptXN5dxCldlO98S1z4LDSqiKSNVN0b+27CSp3poaT8MH8PP2+fVh0SMvRRVumNV+62EfxACq2vGcUn810jTqpl3oOljakUQX+751PBe7HSsUhQ/ENq2xBt9aIOFA8tcGo7GuwcAsyzG/XWR6EmBFOPSCl2hB50F3Kf/AcX/8ZdIrZsbcjREB00SN4qeNgYgFKemKCuXUa5TAmG9pXK+ifPVejT1fupO2a5aLwr6CBWpIXLWGQvbYtU53ud6IqoRTcxIUg6QEplq1+MyMCNhDUY8wY7UPv16Cq7YTi5unLPqOEYyBPbqIZbFwVDKzoCqLqgRL93sGIh45OXQgU+fVo0egeqIdIlHTdzqutZf2nEagtqVAEvj65E/u//U5gwAQxEr+lN2/Gf9IOuiZoKZ95dc0pYz6BSGJN2QQ+ORqai3sEEqafTX0QqF2jp557zLr8XgnAFZe41W4L1w2s+ZmPTgyXCq1sVHiNhsnMlXxZetoISFP9hEOuWfxOdwAZKJPOP
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(31686004)(83380400001)(336012)(47076005)(2616005)(6862004)(36860700001)(5660300002)(31696002)(82740400003)(53546011)(8936002)(186003)(81166007)(70206006)(6512007)(36756003)(2906002)(26005)(356005)(82310400005)(478600001)(316002)(6486002)(70586007)(6506007)(40460700003)(4326008)(54906003)(40480700001)(8676002)(86362001)(41300700001)(6666004)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 06:29:49.0337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5879bb-8c46-4ec7-d26b-08daa1e40258
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9409

Hi Jan,

On 2022/9/27 15:37, Jan Beulich wrote:
> On 20.09.2022 11:12, Wei Chen wrote:
>> --- a/xen/arch/x86/numa.c
>> +++ b/xen/arch/x86/numa.c
>> @@ -50,9 +50,28 @@ nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
>>   bool numa_off;
>>   s8 acpi_numa = 0;
>>   
>> -int srat_disabled(void)
>> +int __init arch_numa_setup(const char *opt)
>>   {
>> -    return numa_off || acpi_numa < 0;
>> +#ifdef CONFIG_ACPI_NUMA
>> +    if ( !strncmp(opt, "noacpi", 6) )
>> +    {
>> +        numa_off = false;
>> +        acpi_numa = -1;
> 
> When making the v5 changes, did you go over the results to check they are
> actually consistent? I'm afraid they still aren't, because of the line
> above: Here we disable NUMA, but that doesn't mean there's broken firmware.

Yes, you're right. I had not realized it while I was modifying this patch.

> Therefore I guess I need to ask for another round of renaming of the two
> helper functions; I'm sorry for that. What you introduce ...
> 
>> +        return 0;
>> +    }
>> +#endif
>> +
>> +    return -EINVAL;
>> +}
>> +
>> +bool arch_numa_broken(void)
>> +{
>> +    return acpi_numa < 0;
>> +}
> 
> ... here wants to be arch_numa_disabled(), whereas the function currently
> named this way (in patch 5) wants to be e.g. arch_numa_unavailable() (or,
> using inverted sense, arch_numa_available()). Of course I'll be happy to
> see other naming suggestions for both functions, as long as they reflect
> the respective purposes.
> 
> Alternatively, to retain the current naming, the assignments to acpi_numa
> would need revising. But I think that would be the more fragile approach.
> 

Yes, I agree with you, I will rename these two functions. Your suggested 
names are reasonable, I will use them in next version.

Cheers,
Wei Chen

> Jan

