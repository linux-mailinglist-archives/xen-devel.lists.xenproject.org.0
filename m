Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521E49D6BD8
	for <lists+xen-devel@lfdr.de>; Sat, 23 Nov 2024 23:46:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842275.1257696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEysR-0008RK-6e; Sat, 23 Nov 2024 22:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842275.1257696; Sat, 23 Nov 2024 22:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEysR-0008Pr-34; Sat, 23 Nov 2024 22:45:19 +0000
Received: by outflank-mailman (input) for mailman id 842275;
 Sat, 23 Nov 2024 22:45:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iYdR=SS=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tEysO-0008Pk-UZ
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2024 22:45:17 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20616.outbound.protection.outlook.com
 [2a01:111:f403:2415::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9955056a-a9ec-11ef-a0cc-8be0dac302b0;
 Sat, 23 Nov 2024 23:45:12 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SA3PR12MB7952.namprd12.prod.outlook.com (2603:10b6:806:316::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Sat, 23 Nov
 2024 22:45:07 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8158.021; Sat, 23 Nov 2024
 22:45:07 +0000
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
X-Inumbo-ID: 9955056a-a9ec-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNTo6NjE2IiwiaGVsbyI6Ik5BTTExLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6Ijk5NTUwNTZhLWE5ZWMtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNDAxOTEyLjQ2MTU0OCwic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9LgAiHnG4jtGtRH+iKa3uJGm6jItq030xwuRvbwtxval6AqJIreQhTMvcSEOA2oUJC3uoPoAVfMoR+Ricl8v7/TxqsNMzGLANW70UkghLx7LWrhR0LGgw4bpK95n4Rb5pt5/U1GVhq94a9XWWQcqSmmCPqRtf1aU8PV1xxdddlHHRwxjFoIFbV/TmU9ubOpN1z1iY7O7VWaQBSIHzLcdxQ8XTvmofeQme+oP+eN1yj17lE/ONvtQUnzR58J1uC285UyoBwAeuYr7ufucFVIOWamq8dAhcSWiqyoZILBRv5jPFN18pbac9tZ8/Jy25aKYoPsz5i9E4lbfSEBYA1ttA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIsUFxLWVgrt9rFh1IDI86ze+7+xzkVzf2F9JNyc0xw=;
 b=NSvBjwW06LjgR2Ec9qip9+AYX5gopxNIwOz1QPIuX1aJICtKWlw9/ss8at8lFDwX1t1aZBkqtswqxqClXLTACAGzTBbqOxYA6X7dxyox364kn9jI6z8MWfGvQpLBVszyhN45lMJUlTkgInAStxs26iTveqOnYUCUSfw+sQoEJrE3hw1Lxlqq+LY+LcAAOR2em86OGVW53cAc27q3qfG9oc2JncU6bYo3R1wgr8cVhB6R2Yoz8+umLgkJ8NR22swkk4chQma8KtGMwPW6ONwR/N/ffNyZAf+bDxsou8QZ30R6q74ly1zEKAl7nxNactLeflJJ6CKSH+ntTOCy2hPnmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIsUFxLWVgrt9rFh1IDI86ze+7+xzkVzf2F9JNyc0xw=;
 b=fHyBcHs9cltxwizFDTZ0mLtJ5J0BoVYnBQbU7LSBQC6HBQQp6etzjeajzbfWA1mT8J7xXN/cOLYqtUyMKaRARlVSbgmiAzidOv7DF+1pTidMUh1ikFJCuur4rKpjO3f0bjBwCu5+XS/4lxVeE4eXbbXiKEEyfq96l9cW2tRlg5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <0b58ff6d-e3ed-43dd-8700-83fe989b5d7f@amd.com>
Date: Sun, 24 Nov 2024 02:44:58 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/sphinx: Fix FUSA indexing
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20241122164908.3240056-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20241122164908.3240056-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYP287CA0047.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23e::24) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SA3PR12MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: 286f6f8a-a5fc-4bec-9dad-08dd0c107a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0xVUHN3M3BjZWNWaGQxaFkvdzlwV095QmkwQTZWMmRzUm45QWs3L2lBS1pG?=
 =?utf-8?B?UWlZU0h4REhXelZhUlpiTld2QU54MjFpQjdUSWRxM3QvZ2szOUdWTGY4SndZ?=
 =?utf-8?B?NkxIUC83Nks2cElZYkFhbkt0WXpEQnZ5cnFpNEx3VmU5K09pbVprRDZSUUdq?=
 =?utf-8?B?dFZBbi84OUcxeENDaHVPRVZ2ajVTTXVUS0hXaGQyMVdaeUNLNXZSc25WUVNN?=
 =?utf-8?B?NTE3ZHI1NStpdHZQNmVkQ0ZpUkJscXpQc1d2cjZ5YUc4Z1hkNkFhcFNRQ2FU?=
 =?utf-8?B?UzlYMjBNZXJ6QmlMT1RkNlArZWU5SVdrYnp3U3AvWGdud0dPUlN6QU5YWS8v?=
 =?utf-8?B?Z3pzdE5NZGlwNVZFSThwcCsyNHhNQmU2bksxcHdtOW9Zbjc4dTVmWjExYXVL?=
 =?utf-8?B?eGVaMi9LckZrN2JxWVdUNGh3eERTTllxazZMa3BMdEkvWEEyWjA3QUhHMytV?=
 =?utf-8?B?Y0tZQlZhSW1sZGVnR3k5SXlvdUE4NEhiWkxHdnIvWWx1bWU0SFRNWXFGTjk4?=
 =?utf-8?B?TElGYkdzZ0xlWUtveDJUK0tSNDVZM2NocFBlMnQzdExDZndVRGF2YzBFcWY3?=
 =?utf-8?B?Uk1TMk84bVdnZjMrNXFBSGFHRkQzYjJYeDdJTzRpZE0xckw0K2tUbDZ2TUVx?=
 =?utf-8?B?VG4zK0EwK0d0MnR5NS9Ma0RzRXhTdEl3REtTTGNYNmQ2UlNDeHlVQitNVHJx?=
 =?utf-8?B?bXhjWStJM1ZJaVNZanV3TkVKTk1lN0wxN2pNVWlGVDR0d3BWbVRsdFAxS0pE?=
 =?utf-8?B?OVkyWTEvbFRZSEtFUVc2MzRBeXR2ODljS1BETUs4RVNjMFNQbGJXZHd5bmZr?=
 =?utf-8?B?czBoQmlzUkVTNWh1OXVGNzdCYUl4VmtoYjdHQnVxeHRyNjVKMlhQQmw3TmNH?=
 =?utf-8?B?R204eU9GTkNnZEYvclNzczFwZDB4cE1NMmp4SXA2aTVCTWpLSDdyOXdPcWZP?=
 =?utf-8?B?eDQ2VG5IYzlnVDg4aXQ1MlpDL1hGWDdrMDQzVkE5QjlWbi9oaGM1SkxsRnNt?=
 =?utf-8?B?UXo0V0lzRkxwMEIvemlrayt5c0pZOVB4enlaR0JrVHdCazhCZjhXVGhGaEEr?=
 =?utf-8?B?SmVyd0ZrUW1pYXVXZXBxMEE0czBwaDZ5MEFOOHU4RHJiMEVwR040OFNpN21R?=
 =?utf-8?B?b0hlSzRQQTlzM094OC90MmVYZDczVE42dTZ5d1ByQ2JQOGlveWRBd0p0dDA1?=
 =?utf-8?B?cmVEV3JkVkVaSVpkZlc2WFA4MWxibjRwc1A2VlJVU2pSTmZUK0NrOXMwQ2sr?=
 =?utf-8?B?a1VyREhheWFmbVdIZmROOGl4WW1USFRoKzRkZ0JYVkVzUk9id2hYUmZJOXlW?=
 =?utf-8?B?MHNrSTRSVmJyL1FrZExpMjZ4aFZtWW5nRTl5elpoYy9jTnlEUWRYVXl4ZEd2?=
 =?utf-8?B?SVJEaC93Q01XQ2VJeVdzOVRIUFEvU1N6VmZJSGRZbEZIVHlqam05ZFJuMmIr?=
 =?utf-8?B?ckZjUHVyL0cxOUkrd3pubGw5Zldwc3FuSkhtYkNDTDBCRVlNMWVJMHlyeS9W?=
 =?utf-8?B?eEF2NG5JY1VXU2RYU1M0RlRkc2ZmSytpZW5nWTR5N2ZUTk05VHd0eE9kZ3JI?=
 =?utf-8?B?aitKcURkMlRta25EWWE5bGdoS2tEekgvN0xpZDhqNzVTd0s0VzZIbERBaVp2?=
 =?utf-8?B?WmZaWlBHSnYwK2JDZC9QNFpUMmhpM0dsSWMyRzVaZ1JMcENjN1M0UmNpRXd1?=
 =?utf-8?B?OVVRRERWNnlPb1MrREFLRUR0cUkwYVF6Q0VMbm80RzY3R1I2V0o2SDhVUmJm?=
 =?utf-8?B?aE9QbStsbXR1eW9RcTBPb1owMjY3c0VsejZuTkdsZ0dOaW1xZWhoQ3F6ZERj?=
 =?utf-8?B?RnZ1TUZjWGJTK2V1YkpxQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzRFK05qcldNQS9acjBxcHpGcWp0YW1LYUJLK3oxdFZwVmxIL2cvcFNRaVpl?=
 =?utf-8?B?M3lmbm5pR2x3cG9nNUVpc2pCdVFRWnF5YWwrYlZmTFZnU01oU3ZneHhJRUE5?=
 =?utf-8?B?TTU2UTM3MTVWOEViaFdhcTA5aUthOTAxTHFHNGpYeGVOclM4UTJHMHVrdUN5?=
 =?utf-8?B?SldqazUycFJnQk1KUVZ4a2lhOUhHOFNKYVNDUTc3bG5pcEdrdVZSVEhJZFdu?=
 =?utf-8?B?STZhUFU5VE01ZGM5Y3BCaHk2UjdWcXMyZ0x5eHRHcDVkcE5kWDRnQ1NBUkhD?=
 =?utf-8?B?S3EzQ1JaWGdINGpZTzlsMzVRdG1iUGsyclZMVHY2SEM3MFkveDVsV2h3Z3FP?=
 =?utf-8?B?a0dRKzlzbFNyVUs5VVBheVdQTE9FZ1AzOENoblRMWEVNKzNoUi9UNmRyc3Zv?=
 =?utf-8?B?b3hjVEJES25PczViU3k2UXMxZGwyb29uRU5XMkdhZCs4UjZXWFY2TS9YY0hq?=
 =?utf-8?B?NkxTZU1OZXhYQTRHMnc4NElpVlFuc3dzNWNIYnhxU2hvc3JBdUMrMnJLSG45?=
 =?utf-8?B?T01SamhldjlkblhNRGRqVjdPU2MrS2tFeUU0dmFkZWpjVEhZMVgreWRSeCt0?=
 =?utf-8?B?MFJlUTJNbHI1YURVclFJNSs3dktnckpOREViQWRmWHo5U3VlRlE4UVZHZ3Vo?=
 =?utf-8?B?Q05hbFBMMG84WWZuT3JXSlJPMHBOWUdhbmwzNzVzclhLdCs2aUJOeGVOR1h3?=
 =?utf-8?B?bGo5L2FGQ010QVFGSnIzN3NQL1NyMXZwM0UzbEdod1Z6QXJublg5QWpkR2pC?=
 =?utf-8?B?dEdhSFBNc1BHRWFxL1dBQVZDYTd0WU5EVTAyZG1RWUJxa2ZPNEFacXpDVjgx?=
 =?utf-8?B?MTM1SllFclk1UlpRL1hvNlBFblNOTnAxZWdIYUdhcXBsd1l4NGlLNC80bzUw?=
 =?utf-8?B?K3VscENYVFBsRzBBemVjYjlocFZLL0hiQmVVK2J2ckUyRWdKQnZ0RVJkSW45?=
 =?utf-8?B?dzAyNzVwdHo2OS9qZFRJVVpLV3NhY3dxdlJBbCtscDBxejJqOU9ZVmUxSGpi?=
 =?utf-8?B?YUFBYlBhbnVyYyt0K2QwM1I2MHNSUklrdUxyWkRFWnRYS3A5SEx0RUExOFVE?=
 =?utf-8?B?SExVUm1aWk44d1Bqck1lQlVjSys3VnV6U3NCNGhPaFFVbnR6VjlFTkRwS0hK?=
 =?utf-8?B?dFNwUzhCNURTODh0aU5JakdIbWNONDNHeGt6U1dLVjNQeHlIeHl1dmQ3c3FS?=
 =?utf-8?B?ZkNOZ1Q2NGdtYVhCK3oyVEV2ckxnQjVZTVpDaGk5MU9FNEpqZzN5S3RnaWRU?=
 =?utf-8?B?MDhsMkRTZzdmRlZpZHA2b0d1UFpxYTJBaE5EZ0FxWFhmM2VQK0I4eDdDVXVG?=
 =?utf-8?B?a2VlNGxTejJWQU13RE14TW1qM0ZxQWJ0MGJFbFVtKzk4WFNEOG94blRRRk9r?=
 =?utf-8?B?c0NsWFBzaVY5K2xBL1E2Ymk2dmllQnF6ZTJIV0N3VGR2Q093S3ZqUFh4TS9p?=
 =?utf-8?B?TGhSQ25CbkZQZ2xRSk9HaDlFVWdYdEF0cWNidlYzamMvNk03b3p2ZFExeFFa?=
 =?utf-8?B?eTMxL3hJdGU5ajluWFloVUtSaGY4bU9IN1psK0JhK1N3b2t4ZU1FRDdZWkNn?=
 =?utf-8?B?bW9EUHJnRDNKQldzOExSWXRxUk5OMGZQKzdqMU10YnBvSW15VHJId0MxZTNI?=
 =?utf-8?B?dlBWTjh3NVJkTHJNRzFzQ3YyOERlamNFRmpHR3BBRGxuSHY1cW12SWdmOWNm?=
 =?utf-8?B?dFFwdzZ4ZGZhc0Q3UFl3ZWVUSFpIYjNiRW5SaktNRDdvTGI1d2Mrb1dYOEE0?=
 =?utf-8?B?KzVUaGFvWFpzNjRpS01nUW8zdDZOL2kyb2ZOMHRGeWVWSk5BdGkrZTY3Y1Rn?=
 =?utf-8?B?enFXaVJSNEIvWE1lNUhueHp6L2tBYllZdWUyV0YvUG5ZdzQwaHlFQUZKbnRE?=
 =?utf-8?B?bGd4bDlXVFpGbHVMR3puYzlGTUdZVmlRSXladSttTXlnRXZqYWNiL1NCK2V1?=
 =?utf-8?B?VnM3bmpSLzhMb2JVRlQ5YUNqUWY3QWhqYzdIMzc3dDNaMGdVZHlZNVV3ZXVq?=
 =?utf-8?B?NjExTUZnbmtCMTF6TGZEVFk0WStlLzJwSEFKWEZlWG9UcTJvaWt1SFlETFZk?=
 =?utf-8?B?cVJsVVV2ejgzV3o4bmZnM1JHNGt2NmZ0SWZGRFZOS0JFNzdmdzMrb2pBeU9L?=
 =?utf-8?Q?++/FFCodxhN36Bty1mIyenbUX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 286f6f8a-a5fc-4bec-9dad-08dd0c107a7d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2024 22:45:07.4148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dYCEwFEY+8ALDjBUWbAjSy7i/q3fkbudmmabmMVJ+dvleN/98i1cUbSSbfpyntmV0CH9jMAmQisQ3Gqhph3Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7952


On 22/11/2024 20:49, Andrew Cooper wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Sphinx complains:
>
>    docs/fusa/index.rst:6: WARNING: toctree contains reference to nonexisting document 'fusa/reqs'
>    docs/fusa/reqs/index.rst:6: WARNING: toctree contains reference to nonexisting document 'fusa/reqs/market-reqs'
>    docs/fusa/reqs/index.rst:6: WARNING: toctree contains reference to nonexisting document 'fusa/reqs/product-reqs'
>    docs/fusa/reqs/index.rst:6: WARNING: toctree contains reference to nonexisting document 'fusa/reqs/design-reqs/arm64'
>
>    docs/fusa/index.rst: WARNING: document isn't included in any toctree
>    docs/fusa/reqs/design-reqs/arm64/generic-timer.rst: WARNING: document isn't included in any toctree
>    docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst: WARNING: document isn't included in any toctree
>    docs/fusa/reqs/index.rst: WARNING: document isn't included in any toctree
>    docs/fusa/reqs/market-reqs/reqs.rst: WARNING: document isn't included in any toctree
>    docs/fusa/reqs/product-reqs/arm64/reqs.rst: WARNING: document isn't included in any toctree
>
> Fix the toctrees.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>


