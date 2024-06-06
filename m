Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2158FDFC3
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2024 09:30:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735941.1142076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF7Zp-0007YN-PD; Thu, 06 Jun 2024 07:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735941.1142076; Thu, 06 Jun 2024 07:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF7Zp-0007Wm-LU; Thu, 06 Jun 2024 07:30:25 +0000
Received: by outflank-mailman (input) for mailman id 735941;
 Thu, 06 Jun 2024 07:30:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QPv7=NI=epam.com=prvs=28876dbbc5=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sF7Zn-0007Wd-Vg
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2024 07:30:24 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1a91063-23d6-11ef-90a2-e314d9c70b13;
 Thu, 06 Jun 2024 09:30:22 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45608dIR014527;
 Thu, 6 Jun 2024 07:30:16 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3yjtc5j51u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jun 2024 07:30:16 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DB9PR03MB7796.eurprd03.prod.outlook.com (2603:10a6:10:2c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.13; Thu, 6 Jun
 2024 07:30:11 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7656.012; Thu, 6 Jun 2024
 07:30:11 +0000
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
X-Inumbo-ID: a1a91063-23d6-11ef-90a2-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lkq6tBEzDV/YLpVWMcsAZdR15IoNq6y9yJcqLlJaysVRZ7AwcCDQRvBS0YoXIMQ4o6AQQNIaVqdiCIQ/v98F0W7yi1tjJnCeEpM96gCXHJ2xhD21EHBNNWKv6bO6F5TfLLzTtI9rjWFYp+8IrV3xOUkL6p3q7U+H7i3NBlAYfLkUfMKJIvv4EzvWJnHKCSyhWLlcQHFzOxNR83KcUminA1NAhs3L1sbQjXjv6r9mq1U3QSuxqaxnOrMfHWd97SuD2aPCzTTuH5pIFWgeutqiEJxEaHJh98Vj4Ym0VqAPzyRtepnv7tprBQvnUY2tVq+srGxlq5+SBQjNFohFwt508Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUtPU55NXqE4SI1MEQTwSG3nl6/RUMeNXZ23bFy+jt8=;
 b=kg6x2t3Ycj7n15zFSZGIg6wYxinQ0Wj9j2Z7hO+o3XefjeXvOpHhUGIT7texdXR/AgH6epW8mcPPWqkPFoBglK5E4nw2/ynicf7G1VCT1mGmxy89o+L55d/AddKX7hRJoebmhwWrn1TsNCOmjxgm2s+nU7S1SmBn6Djj452wWI+r5PXxk7lvVxKO/UvBcrWTrviclnb6QmLbY4U30Jo3viOLWbzDjSmrQoDx0O4Q8Bw3KY5kfMT3CIUzI37JUKNOcW6WaNf1kRnt+3BNx1g5cPYNE6BTpKpOxEKgWvz8Bu1ZlvG4KQlCdSfOOu4A7ySpFbcAr8ZYc4m1fDklnPGjrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUtPU55NXqE4SI1MEQTwSG3nl6/RUMeNXZ23bFy+jt8=;
 b=PtNZGrQGnChzaXpa9+mMjXDVne9Om3PTvEB/g5Z1dWpLzqu0G1/n7dLE/6dM5aW1niBxCEYJry8qTaXoEwHVJYkFsoIVPgfuYfaDkK78I/vkn2lL9bL3zXW2Jqg2fwCZ3iuNgxCF/fDpMzBK6YGPxOBysLtT4Ckpl6gvW8Wus/hdhRieAOlVn1ibVjqTuWRvaZnWAboXxxziN6ii08UCnYe7gLpuk6s41l0RabY71/DZCw4W+5bCAzz48xJ5aOacAJTkE7rIW0Pv8YV1NnNLwuxlSUV37q+jn2ktNDAy/+7Jmwm04QvtOibYBSkivLZHDGK3yqivcvVkSEQhEgEGlA==
Message-ID: <c66966da-bbe3-432e-8a2f-809bf434db39@epam.com>
Date: Thu, 6 Jun 2024 10:30:09 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] x86/cpufreq: separate powernow/hwp cpufreq code
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20240604093406.2448552-1-Sergiy_Kibrik@epam.com>
 <5cb13d1a-1452-4542-b50d-23e6a9d9d3ef@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <5cb13d1a-1452-4542-b50d-23e6a9d9d3ef@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0042.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::14) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|DB9PR03MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c2ed06-0232-4a22-1980-08dc85fa7fb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?clEvcm41Y0hwV20waUFXcTVheTNUVHJrOWhuR2JaL2xReWVmbDBIL3J3UEVG?=
 =?utf-8?B?amxMT2o5OGdJNUduUi9uTEc2V2tPK1dDbGdsb1ZsaG1kL0hEZzRkQkZTY05P?=
 =?utf-8?B?RTA1UmlxcUZDeDBUT01qNTZpVmhGRFdTc3YySkpjQUJKdCsrL2plQnRjd2Rw?=
 =?utf-8?B?RXFRUEhPTkxJVkxHUSt0V2Qra202cmZ1OC9ReUVvd0paRnFkdC9xdzhhdlRr?=
 =?utf-8?B?Y1NqQ2ZiaERGaEhZN3NCcEw2RDFTVUhCOEhKdWlwNTFUb3plQjNOUno2MUxu?=
 =?utf-8?B?ZE9Jc3J3R0txM2VleHE1cnN4OXNFUXluZmtpRjkwb1BoNGZ4Wk5SN1IwTDdu?=
 =?utf-8?B?aTFVNk5KWEhwUDRjY0pzM0lvNTRIYlBRb1YraFltM2RxWCtYZ1ZXT1hROE83?=
 =?utf-8?B?MUs0TlRvTnFIemlUTE1mYkxaa3dVQUNIZDFCZVlBT1JXa0FEUzlia3V5QWR2?=
 =?utf-8?B?UXZJWVhJeHovSFBPWXovTXVkTHNzSFFVcWZ3OU5WNHhYUzdaMldmNkZlVjNy?=
 =?utf-8?B?YkpaNERSZXJ1TmRGT2R6ZDRiKytBYzBsRHNmaWx2ajJxSjRsMHZ3amhYM2FE?=
 =?utf-8?B?TjRJS0NWb2dBdmhybWdNQUtRZ2hGbVVGa3FxR0EvV1FDNHB4dzRMQmRnaXlY?=
 =?utf-8?B?MlZjYWpsZCtHalZkb2NLaGVPMjQvVGxIU0s2N0R2RHN3TzJMTFJrUnRJNU5z?=
 =?utf-8?B?azB4RWM5SFlSSmh1T0xUWTZ5blJUUnJkZjAva1FoVnAzZk5SYkZ5NTc3dHFv?=
 =?utf-8?B?cUJlejcxZmVjZmxBN25wT3Q5SjZ3MmI2SmFhd3ozazBzYWNKSUNWa3dyOE1u?=
 =?utf-8?B?bEJxeHJqSkFOMkZXeU5JcC9LeCtrYWFNNDBTaXl2aFRMOGxqVUpUL1FJTzFU?=
 =?utf-8?B?ZVA2MnAvT2NIZEoySWlUVlB3ZzVXRFdocXVWVnZyMHZuWWJwNitwWmREeEZo?=
 =?utf-8?B?YTE1eGFaNWkzOTlPY3AwMWhwTzE5dGVzNFR6YXp5OWZwWXppSm9TODVmNTc3?=
 =?utf-8?B?VFh3UTJWYURTR3IwbDhldDJ5WWJKdTQ5N09Rb1I5Q3BYVlJiN25GVjhqSWhr?=
 =?utf-8?B?aXJWbUhPM2VlS3JWR2Vpd1k1dzFIR0ZVV0hWZFUyMkxZcFZ0NHcrTTNEYUhE?=
 =?utf-8?B?Qm5lR003eDBpYUhiaXJEams0SkpVbjM2aytOQWY1UDA1RXdqa2UyaVJVelJq?=
 =?utf-8?B?eTYwZmU4ekMzY2oyTTFlbzN3MjVocEdWeWtwQW1pZGEwcmZ6KyszWXVvSnlB?=
 =?utf-8?B?eUZtQ3E2RGFHTGVTdi9uV05OSHZkOU1XR1ZEVUtOamsvSTMzaXlLUTBoQ0Qx?=
 =?utf-8?B?bm9tc1VmdUh2VnBaVGhTRXRwN2pveXpuRWJLdlNwZnJmUE14SDBIOE9vNStj?=
 =?utf-8?B?aGNJQlFnS0xSVjl5K2w2WDJuNTJEalJBY2NybWF0YlpyV1U4RE85R3E3c05N?=
 =?utf-8?B?bnI4SE1nRVhLN2VpVmJGbUhhUVgvV1FyeHQ2M1ZOVUlEZ1ozV0w4SC9DUHJv?=
 =?utf-8?B?RzRlRVg0bzVPQTk0TElML09xVEpSRVF5SmtEQVVkT0FTY2RtS201Q0loVy8y?=
 =?utf-8?B?Qm10K3lVcXUzdFFpN3JFbnhiZm9Jc21XZzRMelRnM3pmbHFIcVZGaERXMG15?=
 =?utf-8?B?NFduTGx2ZThGNnp0WklVbDFXSkNpT3lrbEd1NGxES1M1Z0toSDdiSnJGSWd1?=
 =?utf-8?B?WGJOZjcrMUJEeUlsc3VLNUJ4MWhmeDRpcndUY252VEx5Q1dMUGZ6dDhlamtM?=
 =?utf-8?Q?kL52LtLTDIxZa4HApfc2/vBR+pQKwybN8Q5+ase?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WWVMSHJQZFFoT2tFUjVVU25WcmFOaWtVTUY1c2xMTXFSTSs5dHhLQ1VjZjlz?=
 =?utf-8?B?a1c2WVVnZFBObnlLS3Q1ZEpaektTSThOQmFWd0dPdUd4T0tUOERaMlpaZkIr?=
 =?utf-8?B?bXlzanlzZCsvTVYya3V5K2ZreTBUOCtVVDZ6cVVrbDZBUjZHSlhLcThRZWZR?=
 =?utf-8?B?VVM1bWF3cTZ6SVMrS2hMNFVFNE0yb2M5Z0NSb3hHRUpLdlJ5TDRtK1JUbnJw?=
 =?utf-8?B?VVh0TWlkWFJzUjd4NDFSdFI2b281Q2Y5cGhWeXU2UlVBUUQybENiZmFqc1VO?=
 =?utf-8?B?WThCaGduQ3FlS0JTVVhtcDM3RHBKbkxBRFF5b0ZSRklNcHlNQmZWMTd6Ky8x?=
 =?utf-8?B?NEF4cW01V2hPc3Rjc0MrUW1PUXk0ZHp0YnlXa0o2Yy9zQTdXNEFWTzZ5R2t4?=
 =?utf-8?B?WTkrbmlJeVZJMGNjKy93MFlyM0RJdG11TWJOdGYxeGR6Y1NMNGJoRkcyMDBP?=
 =?utf-8?B?M3h2ZkRxMldhREx4S3k4VHFWUWNzWkNxL0lKUTdnZ0FOcXk0ajBqWEJzL3Yr?=
 =?utf-8?B?VzB1OHVZc2czdlRIYnlaWFoxZjl6c252UUEvckxxNmF4b3NPZDJRczVJeWMx?=
 =?utf-8?B?K1ZYVU1jczN1WnJpY2NWcXpBV09ScWJkdHNUTDA4cVpLb3crTFJxcmVwa1ZL?=
 =?utf-8?B?czlBamJDRGl2RktFaEhQditOMDlHZUVhS0NrSk5IVjkrZFZISXArTXhxbWFT?=
 =?utf-8?B?K0Z6TEpIeERtZ01hdDhUQ0NwSVVWWGR6VE9Zc0JzN3MxN2FhNDdrRzgyMkdG?=
 =?utf-8?B?dVdLWWk3TlJ5YXhzclJnaFdKdUo4VGp2akJ5VDVNODJVcmNHRnBQUXMxMEo3?=
 =?utf-8?B?amYyL0FPUkJTZDZ0b1k1STNWWkUvdXBlcjBRTVRXd1JEQmJpdjZDSG4rZXYz?=
 =?utf-8?B?ejVucGZWMHlhdmVXSzhMTkhhbGJBamJmNDlLTVdmRGw4cVEzbzR4UEZ4MERH?=
 =?utf-8?B?bnppZ0xaemVoTlU3dkpza0dvVXZTVWErRVpZQUJ5VVN5Zm1OK2ZDSTh3UitZ?=
 =?utf-8?B?U2FYdVdHWDRzNUZTbkM5N29vN1dpTUVSYWMyNTQzU0poRTJ3cDVzNFhSZ1V4?=
 =?utf-8?B?eFFML1RId2tFOWZleTZGK0ZMNkhUTDJFeXRHaGJrNTVzYzBxMm9ZMVF0SGJ2?=
 =?utf-8?B?ZkNHUVpoZ0V5U2EzTlpnS3NoU25ENVF5UmJPRGtpTmY4aUwvRFlMbUYydWda?=
 =?utf-8?B?VVhrclQ0bkRYc1ZEdXp1ODFsRjB3cC9GV0p2VGltakk4UCtCeHdkNTRsUXZ2?=
 =?utf-8?B?UXBzNDB1cFExWWhaQ0c0dTUzVFN5dUY3NTNTSW8rMEZpMkxWalJHbWJzZHpv?=
 =?utf-8?B?ejh6MUdGZnZGU25PQXBqQnBSQ250L1FBYkIrWUI4alNXU3lTSkpXd1d0SGJS?=
 =?utf-8?B?WnlDYkZrNDhwcHU4WlR4dVBrNzY0cDhDSGhhejhWbGtncEk0THpocytNWXpp?=
 =?utf-8?B?M2Zpb3lSNE42MWdvUS9oMnZwWWw4ZzRHM2Z5V0NNdVlWR25zZkk0bWE1MUtL?=
 =?utf-8?B?c01NOGRKTkkvN3V2a3RBVGY2ZE5UM3RidStTcEQyd1lVakxleDVrMEQ4SHND?=
 =?utf-8?B?bGtXOXByZTg4UGZuL0Q2NGtnY1FnMWdPMm5uMHdWK2FCc3ZTUVltWGJYZHJ2?=
 =?utf-8?B?blhnM3dqV25SeGRIVDIyMWplV290N3F4UzRZbzNJRXkvNU5lcXRWdWdNRHZk?=
 =?utf-8?B?NkMzZmRNY1RVZlY5eWswU242QStRSDNDemJqb1gxTW1xNVh4cXl1aWtmRTVr?=
 =?utf-8?B?dUpHL1ZsT29iWHhiQVlUeHM2ejFzb0xlY0UvdDlaOVpWY2NtT01qYmVJeWww?=
 =?utf-8?B?aWRQN3ZmT3Y0UnM3WmdFRVdHMVhUYmVucElQU3kvWTZEOHJYa0JrOGZtM2Ey?=
 =?utf-8?B?VHB5V2FUUEpXM3dtc1RBQzZoQW5HMDg5b3ZTV3JKalNDbndtTk1ySkdxQUNW?=
 =?utf-8?B?dXNSVzhlT2lUK0dRM2ZzOGV6SlhPNDByYnQ4SjdoekwvL3BMZlhYOHZ3Qlpo?=
 =?utf-8?B?bTNsaWdXdlhQR29CM2xtMGM5ZXBoVWIyNGViWER0WmxOeUFTeW9yWE9RVFdn?=
 =?utf-8?B?c2ZmbVNYNDhLRmVmclBJTGJkNDZmRDhTUEdVcHFmWW44aXFkQ0F5SkJnL3p6?=
 =?utf-8?Q?gsynea555df8JnLxEaAL21kcv?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c2ed06-0232-4a22-1980-08dc85fa7fb8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 07:30:11.1851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xKcuzUKt+m+xPmzjPsoB+y4W0sx6LLVFF1qOqmc0mxg4MMm9rCBL9b3/vqfrDLiqIX6ustM2ZQ/nsO2HBAEXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7796
X-Proofpoint-GUID: ESA80f-pxfkORFiDthoLL_Rncyw71zqE
X-Proofpoint-ORIG-GUID: ESA80f-pxfkORFiDthoLL_Rncyw71zqE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_01,2024-06-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=994
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1011 adultscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406060053

06.06.24 10:08, Jan Beulich:
> On 04.06.2024 11:34, Sergiy Kibrik wrote:
>> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
>> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
>> @@ -657,7 +657,7 @@ static int __init cf_check cpufreq_driver_init(void)
>>   
>>           case X86_VENDOR_AMD:
>>           case X86_VENDOR_HYGON:
>> -            ret = powernow_register_driver();
>> +            ret = IS_ENABLED(CONFIG_AMD) ? powernow_register_driver() : -ENODEV;
>>               break;
>>           }
> 
> What about the Intel-specific code immediately up from here?
> Dealing with that as well may likely permit to reduce ...
>

you mean to guard a call to hwp_register_driver() the same way as for 
powernow_register_driver(), and save one stub? ?

   -Sergiy


