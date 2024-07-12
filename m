Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1F992F6A8
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 10:04:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757809.1166937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSBG3-0008PO-JN; Fri, 12 Jul 2024 08:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757809.1166937; Fri, 12 Jul 2024 08:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSBG3-0008Mj-GR; Fri, 12 Jul 2024 08:03:59 +0000
Received: by outflank-mailman (input) for mailman id 757809;
 Fri, 12 Jul 2024 08:03:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jF+a=OM=epam.com=prvs=3923533b25=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sSBG2-0008MY-Sp
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 08:03:58 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4857c9cc-4025-11ef-8776-851b0ebba9a2;
 Fri, 12 Jul 2024 10:03:56 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46BN52jq010289;
 Fri, 12 Jul 2024 08:03:41 GMT
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazlp17013014.outbound.protection.outlook.com [40.93.64.14])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 409wcd862p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jul 2024 08:03:40 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by PR3PR03MB6618.eurprd03.prod.outlook.com (2603:10a6:102:71::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 08:03:36 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.7741.033; Fri, 12 Jul 2024
 08:03:36 +0000
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
X-Inumbo-ID: 4857c9cc-4025-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SF94b1EGXomeU+co6LyQ1fjJQYh1ZODWKdZpC8AlF42DTR2+4kcYqH9O5uPPHYYkihejGOG676fC92m/1DA43+x5b/vveb/nCJm5U8bdVPW625AdGzOv/e1/W+dLMn3ROfZt3b9GadwohVEQHoJUJ6fFztOyl21PQdCT7uL4M5iJgmGadJrafJVgmKWq90ZD3U/juzIc5NlhUn7i2kcue8TemBj+q4qhJZs9+9QzGx5LbWXPWHhwkNhyc6THRvNoBFYsmxMS+k+SQy8yb9qxh0h3V3dhgPhj8UQzQKMtahS5m6LydfAA0cKl3NXi0HL8lCm4H6ObaIYAC2Ki4gei1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3PBS7FsMK7CjdCm2JWDE3hC69vUYNvHJ8MLPYv8/pY=;
 b=CuhTvRAlv0r/5muBsqF9aWry6tDBk7nZWkVr6nM68OdS5QWXsy6MfGJMsvSJflgoOIwnp1iySVo7KgKBFVUUFSQmDZM/jOYhlD3QQnY6xNxx70IfbtVDzJfHxuB9Hi2Wt7Gk7IPZfzNT/G6p8UNiDuScOnhuDkWurbRy00lKfh+IGlg+3FBzunXcngVRhEwJvDUIRTWrLLJraHRBkUvFFFVPuVBvRZOETFy0cnLrNkPPtXOfFtGh/Jt4Q0YHfandozoQDrDDDZUq670O8ks6MKWbs9CsFbn4UZV+625qDG87X0cV0cGCs8Xwl6L/CmgCg2aNUgp7lgyRL7I8PAlesQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3PBS7FsMK7CjdCm2JWDE3hC69vUYNvHJ8MLPYv8/pY=;
 b=K1LmVB3BrPict8KBpmxYGr1cA4LLFXzjCsOJTQOfT9HoA3thxRFRnzHTDo/VcG9EVU+VBtz640Oh0sK9XTU+PJfa5c+CZf/Tupl7GEDIwczXjHioiSSTqjoW+MPFpMab2LZwBRSU31zITBXOsCrkONlvhQob3ZuY/c28bsjWvLz5KGW4pbDNpuIr9FlvXTwAdlx3vpwlFHjUX5N/bpt4GYQX90UKrjPyShet/230jWfJhJLsBU1pyBoxGkLt6JL2mvsVCTvMsF1ax3bcgFDcz7psnWBdAsoce7OXLHI0d1OqlIm+NJ7tMwAlgGNDKRCwMADLLTHELbFvnzqOFyAO8g==
Message-ID: <5f5caff7-6963-48ef-b0a6-1c170271e569@epam.com>
Date: Fri, 12 Jul 2024 11:03:33 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 12/14] x86/ioreq: guard VIO_realmode_completion
 with CONFIG_VMX
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1720501197.git.Sergiy_Kibrik@epam.com>
 <e6e0f30ea69ecfed4d8de531fc42162162b3f6e5.1720501197.git.Sergiy_Kibrik@epam.com>
 <5fad5c8e-a7f0-4536-86ea-b74a3116d122@suse.com>
 <6fc22816-5f2c-4f87-a86b-09363f254e05@epam.com>
 <2b408be4-70e4-41a0-b15d-c4cab58198c2@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <2b408be4-70e4-41a0-b15d-c4cab58198c2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0045.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::19) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|PR3PR03MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 2059236f-b30e-44b1-13ec-08dca24921bc
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K2h1dkwxbmFzYkVNZWNMRDJqc3dPWE1tNGVXT29MNWV1ajF5VXdyYlFuNkxY?=
 =?utf-8?B?ajFwemV5YjhuU3NBYWk3R3dUVDNCZGZsdTRXSmlpVXZQV3d1bVpMRHpoR3Fr?=
 =?utf-8?B?SERzQm1SVUtCNzhnRzlTMHBPUHBETkZwd0hBa0h6UlkyVHNsb2ExeW9qUExm?=
 =?utf-8?B?VndMeTdTbjFkQVQ2RklobUVnekZQZ0Z1alFFcHk2ZFB4Q2RTUndjbksvN1di?=
 =?utf-8?B?bDdHR0hWSDVFTE9ZVCsvSWZiWWdsYWwwMjB0SjhUUEJtM2JON3ZBNjVGc2U2?=
 =?utf-8?B?MmxVWC9vaWNVV2JQdTVUd205anZ1UDBHc2VTYlZNR0tNeEtEZjBJODhKT1FU?=
 =?utf-8?B?RDROaGkzM3VhQitIOXh0cy9BWXpVR3I0bVlKYmwybmZBZlFLYWRMM0ZYL0lq?=
 =?utf-8?B?by9hM3p2b1EzZk94UEQxRStVKzIxRHVWMFU3c0E4YitWUWZMS0JOMVcrU21P?=
 =?utf-8?B?VVRtdkpBd1BRQjAzYUtpNTlOZXh6RUJmbXdpNnVHQ01XUTRybTVhSHFCekFP?=
 =?utf-8?B?dW5hNFp0cGhnWnR6SVAwTUJ6R3pVQjZQNDJVUWtRaTEwY3lHOTk3bng1ajFP?=
 =?utf-8?B?UGRaa1Rtd0pMN0k2bnpZZnZNcjVXMXI3N24ybktUNWVGblU0V2g2S0lQSm9W?=
 =?utf-8?B?bWlicGtGZ1FmL3NZS1NYcHBsN3d0SlRURHd2NVpsOE9UQmxYV1R0ZUVZWHJ0?=
 =?utf-8?B?Y1FvejNKeFJ5bEh6cUJNcW9CeldTVkszT3ZlZEZwMXhzb2JRcTFoUlpjRkJK?=
 =?utf-8?B?S3Q3RmJZblJobmxkdlI0SjVnYmExdElEaWVHUk1HT1p3VjFBRGY4L2lWVmFL?=
 =?utf-8?B?WE1KSGdRV3draFFUNWpncUhJUGJBbm9INjFyazhqQ1lYM2lqN0MrWGJjV1Np?=
 =?utf-8?B?RGJLa0Y0N0xxL2N4d24xS2s3S1E3WXNJL29tS2dyUHVndS80KzQ2Y29TbkR4?=
 =?utf-8?B?d2dHU2Fab1VqVW1IenFONG10WEJRUnE5THZoMVh1TUdRNzJRcE9IQ1BJTjZ0?=
 =?utf-8?B?ODVkQjU3VktlVkpuU3BkRnRmUnRMOGlUTlJJc2hYMitsZ2ZRYkdrS1NqWU9B?=
 =?utf-8?B?Q0lLd0lFWVo5d0trTWhXWjlrdHZiZkl5MTgyRDlQV3psN0hkY0tGVi8xT3FU?=
 =?utf-8?B?dTMrTlZNdWV4N2RNSHRab0V1TEdLaUNMditheWkxQnRiRWhJTStRcEhYZ1ZK?=
 =?utf-8?B?Y0lsK2pqbWVjSTlqSkZHZ3ZsRjE3YnJabERQbU1RdmQxWWVWbUROc0tTai92?=
 =?utf-8?B?YzZCQkJaYVpXbmNMb2RIczdYSlBYdXRVUGdRK1dhaU1LdEtEVWRra3A2Qnpp?=
 =?utf-8?B?VkJVdWFaa29JRGh6TXlLM2Vqb0pURzZLbldVRStBWDR6aEZlQmZnalFFdkRx?=
 =?utf-8?B?QzIyNVRFMkl1azlkSzFpNElHRXlhVGVCKzBkcEl2azJJbCtnaU5LRFpXc1Nk?=
 =?utf-8?B?dkc1a0tXVVlDS0Vqd3NXOU9UT3RGT25zZGhhSUtONG12cTJnZVRHRkdzbkdH?=
 =?utf-8?B?UytQcmMwOUNVWm83OXVhSVowR3I0MENlamUzc1B3VkJuSUxjU0Q5NWZ5SXpk?=
 =?utf-8?B?UG5FdWowNDdWbE5RSUVpTjZRdkVXcXlTWHZ6OTcvNkVxb2NVL2w0bWd6b0xT?=
 =?utf-8?B?Z3VaemhHaEVWUUp5RFVPbVpWbVBLRWlGazlBQUhKb2JZMlIrNy92bEFwVU9n?=
 =?utf-8?B?eUtTSXQrR1ZRWmhnVHd3K3d5ZlNsa0pIdi9jMW56NmdKcVBUbjYzZmVzQmFy?=
 =?utf-8?B?dTE4ZzZLRmN3bksxRUFUR0FXQWRIcDdpZ1RNNkxaTTV6d0g0R1dORVdJTlBV?=
 =?utf-8?B?T29RRmhCakxuTkM1bURWZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZnN0eXNHOVZ4aWxxcS8yY0xSaDREYVZ3QjZhcGwrdTZEZDdTTzlSTE0zbHFE?=
 =?utf-8?B?Z0NXRnJ0ay9SV0N3a2hsVnBhWDZGLzhWdmVVcFE5NUJxZWc3ZTRDaGdDemU3?=
 =?utf-8?B?UVIybk5IWFpiWHI3RFZKZ3VEaDJ2cU9HUVp5TFB1TnNPRW4rbEt1c3VSUTBB?=
 =?utf-8?B?QU4zanRUSFF3LzFWNnZ0TnFzS2Q5Y0JmZS9BM2VBNGpJMW14WjVMUW9IZmdY?=
 =?utf-8?B?Rnc1eDZBcUU5MVhSZEFkdEFOK0VWelhPN3pJemZ1cWVKRnhzZ1BwbXM4aWt4?=
 =?utf-8?B?STBGREZIMTVXTlFiWjNpYldDZ3BXV0Fzdkx5am5Rc2U0T000ay9jNU1QZHM2?=
 =?utf-8?B?cEdKSnF5OFQ3Y0w4VU92QXpacXE1cnYvTXlKQjltMzdLbjFpRFoxd3pydUQ1?=
 =?utf-8?B?aXlrQmwxSElOQW9kb0tVRlV0TW5tS2RKVUJTUFZPQzdLL0x0T0J1bm83KzBH?=
 =?utf-8?B?TG0vN25uMzhsc1hwRUl2Y0ZuV01FT1R4ZkNENDJrT1lldDFFbnVNS0I0ampV?=
 =?utf-8?B?QmRIUFNndyszQ28wKzV1VmxVSWhBbGEzY2FxakNWZTdRZHdRT2Q3R2pHNzQ5?=
 =?utf-8?B?THBPUEdpUU80MTZPVzBkV3BESFpXSzNPamliaWx3MzJFZjBwbEdLMUNPODEx?=
 =?utf-8?B?ZXJPMmxmMGY5Z2F3UzlRYzlXNS9zc1RwVDBQc0xVZlBibGU3NlVvWHhwOWxn?=
 =?utf-8?B?RUVHVUpiVU56UVBwSHNCQWxxWjJqSjlTd2xZYkovMXVhL013NFFNRmFPQlEv?=
 =?utf-8?B?NytxTUV4VlpZc0MyRUZwdmtLQTBDTllYZU10SmNlZEdkaDd2SG85M2MxNWc3?=
 =?utf-8?B?RUpmVmRKTmVVdkw1WjB3SFo0SWVoK2VoWXJCTkswRUdCT2FPY0dqR3o4aGlC?=
 =?utf-8?B?K05kWWdOYm1hbXhJaGQ5VTdQdzJ3NW1RNFByaUJlKzJqY3lpVnpaaWNFTkw3?=
 =?utf-8?B?bS9YcThzYjNtekUyLzJYY25KUzdZU055VmJYM25NbzIxZjRCeUZ0bkZtQVdZ?=
 =?utf-8?B?Q1piQjA2T3NnWDRWQVd3NEtrdEZ6M0FmUjVibE9YSFhFK1VURzZZZ29SR0pJ?=
 =?utf-8?B?dDhuTkxaRGxoTEtSMkI1MmRsWWkwVEMzQlpXR1hlYzl4MHRVdVRuRWNod3Vz?=
 =?utf-8?B?UkRsVVJ6TGkxem0xMkk0b3oyVWtDUG9vbUNITEtjb2xLWEJSQU1SdjcrcUJC?=
 =?utf-8?B?eVBHalNwOFZnWVIrVy9TWVRSc29ucCtFNXlRaXVPWUczY3BYN1l1RWRiWUlz?=
 =?utf-8?B?MFhoYlF6YjBWTGRDYVZ6L3Z1VDhJK21ZdmxjRVFPcmpCMHl2UlE2NTZTVXhS?=
 =?utf-8?B?S1pEOVdRajVvNk9XekEyRXNNVFViSlBSZndMbkQ4b29sS00yUDR5ZTdMd0E0?=
 =?utf-8?B?S0FSZ0pxWFhmNUhtd2dVaEd4UW96cFRvTDNBTlBhSnFuaUttekV2dlk0ekdy?=
 =?utf-8?B?N2puMGhFL1RYY3c4dEJGR003dm0zK1pybzVMY2tOSCtzaHV2UGk0UHpkeUhx?=
 =?utf-8?B?RzlUT0NEaUlvdmdtOXBtNmpsYTQ0NDJRWENYYXM4S0ZWd0o0ZmEvc0FJdGNt?=
 =?utf-8?B?a1F1MVRVaStqRHcxTWZZWXlmY2NkaFhUaG1MS0lmTVIvUVdQb0I0a3VoeUVa?=
 =?utf-8?B?Mi9RS05hc0tTR1ZhcjIrS3JEMlQvWFh4d3h4NjdPLzBPa2ZtemxBZlcyaUdR?=
 =?utf-8?B?enpjczNuN2hHUnlyRWM5b1dONzlrMVZyTVFnWVlwaHZOdTFIMnhONEVpWktK?=
 =?utf-8?B?OENuMkxIWThlU1RvVE5hWHZqdi9TdllCUGVMOUduYnNsN0l4cmwvZjZVR095?=
 =?utf-8?B?akk5ZjA5TnZmVkRpSHNUTEdYY2JZWU04b1BDc2tVd2ZtNWFuVGFEUTRtYXVx?=
 =?utf-8?B?SHZQL0xYK05YVGlGR3phWTUycUVuS01heCs3ZWpXT0s3NlI0OTVkT1dMYlZt?=
 =?utf-8?B?QlgwWmoyTlp1L3gvM1VaZ2huVWtjcXFxSVFtQ3dZNGZxWjBuaGV6eVk4Slh4?=
 =?utf-8?B?VGhZeG9Uc0p1cEtvdVRsUVNYNTJxa1k3QnJMbVFKM2kyZis5ZWJKWVJ1QkhJ?=
 =?utf-8?B?SmJRRmpEM1VjbWlNMXlwc0FycmhjelE2OVM0SDVUc0sxVmNLcndmMzJmWXJT?=
 =?utf-8?Q?d5bX5ibbTvvHvBTMKjXmpl1P2?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2059236f-b30e-44b1-13ec-08dca24921bc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 08:03:36.3514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1vrI5H74T8rkj1kwBm/yuOGV/uEafef0EzXw7kR8X7weyybXLX5EUlC8cpb8zieP7Qp8LNorANMxRjNBKL6COA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6618
X-Proofpoint-ORIG-GUID: 9JVCuZxdRqREY9RL4e1imC5H6uFEPQ7S
X-Proofpoint-GUID: 9JVCuZxdRqREY9RL4e1imC5H6uFEPQ7S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-12_05,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407120056

10.07.24 13:19, Jan Beulich:
>> looking through these changes once again I wonder why can't we just move
>> stub to the header like this:
>>
>> in xen/include/xen/ioreq.h:
>>
>> #ifdef arch_vcpu_ioreq_completion
>>
>> #ifdef CONFIG_VMX
>> bool arch_vcpu_ioreq_completion(enum vio_completion completion);
>> #else
>> static inline bool arch_vcpu_ioreq_completion(enum vio_completion
>> completion)
>> {
>>       ASSERT_UNREACHABLE();
>>       return true;
>> }
>> #endif
>>
>>
>> and avoid additional pre-processor variables & conditionals, because it
>> looks like we do need some kind of stub that does ASSERT_UNREACHABLE()
>> anyway.
> That's possible to do, yes, but not as long as you key it off of CONFIG_VMX.
> This arch-specific setting would better not be used in a common code header.
> You could introduce a helper CONFIG_* which VMX selects, at which point
> doing what you suggest is an option.
> 

ok, I'll try this option in next series, lets see how it will look

> However, in what you have above I can't figure why "#ifdef
> arch_vcpu_ioreq_completion" is still there.
> 

disregard it please, a copy-paste error

   -Sergiy

