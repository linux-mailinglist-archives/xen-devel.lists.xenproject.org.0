Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 355099B7FCB
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 17:17:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828824.1243845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Xqv-0004ve-Po; Thu, 31 Oct 2024 16:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828824.1243845; Thu, 31 Oct 2024 16:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Xqv-0004uA-Lq; Thu, 31 Oct 2024 16:16:53 +0000
Received: by outflank-mailman (input) for mailman id 828824;
 Thu, 31 Oct 2024 16:16:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E5d+=R3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t6Xqt-0004tc-NA
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 16:16:51 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2416::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8527f84e-97a3-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 17:16:45 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by BL3PR12MB9052.namprd12.prod.outlook.com (2603:10b6:208:3bb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 16:16:40 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 16:16:40 +0000
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
X-Inumbo-ID: 8527f84e-97a3-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNjo6NjBkIiwiaGVsbyI6Ik5BTTExLUNPMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6Ijg1MjdmODRlLTk3YTMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzkxNDA1LjU4OTcwNiwic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbiLlGXejenp8xQHMkT/WmUpJfasMM50Chdyk3FlKXcfsANJ3mMWUUkEizCL2saoBEOBNSRKxGNqscGZHZL0qci6DqoBMf38MEQbC4KCYomKjhNEjj8zzLKoIn9v7bjQqnPy3rz74cSc3zhraR+vpAMNBxWN9Bhf/hx9htbrKClElyWmLVemc4etATuPqnwzMMlRqe69Ssvx8km+NvOHV8tPkGV+zWGI/rOvPJZ4nZUKPjqu4z0W9bEYYdaQS54ymDq+gfgEIMKikKSkjKKu9eeoANHRon6keuYphEMBIGfAff0kO4Ww72IEvzQkYCd7Uv3eLJpwMTQ7tefaJ57ajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oK5ePHj6R+IDnWymbnFgCkGrzL2PdFwud30AGjWldYQ=;
 b=DJnCvaQlpKfYbkL7OjdmmJX9dG7iJNx6d7GhOZakYylG+uvYrCRkCjPeMucJ7+QKH477TOpHubK/TBbSSPg9H5pbKqQyJUWtqKf/tK9m5lOEHTqAW7O7wwFJYCG4Sd+R3zDIGFNbkPyqiioNgrlCDr7RCjn9u+vEks8DEEMWlowUwXZzQcQGsQw8ac4rU2mm0Vwkrdf9zCiN2XAkM20Zb5fjn/+mdg5ieSIhsPoTFiMPTaGKqFEV9dVAmvtWUGOx/4gjnCoLnwpAzHUL0nmINYj4+IGNZZyGGxSL37kj1NDwGtw/mS9QGzPJKbCUoM6zh60zN1MaoX6Vt0uBUrfHBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oK5ePHj6R+IDnWymbnFgCkGrzL2PdFwud30AGjWldYQ=;
 b=g8dElTVhvuK3phNToM6WQflhwVPH+lIKyHY4BGl2kbGA7XfukEOoCJE5SBWUTKMzxQ9l5WoxaW4f6A5tZ3345tNj7X41rWvrF/Yv4nzQ9Nfgl8UEpI58nhWkvaOIydf7XIvNPTMo9AbH9cgWaYpanmgv65Xm/KShytDSifa3QNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <dc16b377-bf99-4afb-87fa-2bc45cdfa62d@amd.com>
Date: Thu, 31 Oct 2024 16:16:35 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <julien@xen.org>
Cc: Julien Grall <julien.grall.oss@gmail.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-5-ayan.kumar.halder@amd.com>
 <FE41FD6C-EBCE-4EDA-ADD4-E09A58773763@arm.com>
 <CAJ=z9a1d2vzXh-fK5E2z-k4SOjE0cjJUGfFnaJiobvQpS+Y5Rw@mail.gmail.com>
 <3963FE44-9ED1-4462-BD42-DA1B1A5040C5@arm.com>
 <8ee005f3-baf7-408a-b084-833475ced50d@xen.org>
 <19C963C9-97C2-442D-B9AC-9CE7CF3B50F2@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <19C963C9-97C2-442D-B9AC-9CE7CF3B50F2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0055.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::6) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|BL3PR12MB9052:EE_
X-MS-Office365-Filtering-Correlation-Id: 53859b3a-2dc3-4b45-0c3d-08dcf9c766c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mld1NGdhYXNtR1BHTFZmazdnQU85TlFFSTducFhtQ0hrK3RtY1hXcjZnekYy?=
 =?utf-8?B?Z1hPQWZqNm85R1BVdlZXSlZLcnNFWWU3bWxlVnFsaFAzNktvREhXOW11QWdw?=
 =?utf-8?B?U3BWblJtOW5zT0ZQbGc4d1QwNXBUT24yZVNYK0lOZFIyeWVoak4raEw0azFB?=
 =?utf-8?B?RDhkNWlCV0gvTnlHaWxDVzk0aVA4Tzd6bWpzaERab1pQTzlkY2hsTjJEMFpE?=
 =?utf-8?B?OEpnemphbHNGNm5hMldXSUNBNmI2S3QwUm5oWC9sL3J2RlY3Wi9MazlOWTVZ?=
 =?utf-8?B?S0M5SzMxZ01YWWNuUHFodzBianNuRVl0R1R0dWRYVTBXREpVSnZoUXlmby9O?=
 =?utf-8?B?QlhjV2NhLzlKYnhzdTE3Y2prYVZqZGRoSm5DaXpCMkYyQkExRWNqaC9VYXIz?=
 =?utf-8?B?RElTVlZySXF6K29wVG5PaGN6UXhRWmh2NGd5dUZHbVZqTy9wcUdhQVNFQ1pt?=
 =?utf-8?B?RXhEWXNvSWZld0hBYkJhb2ZJZWQrWDNqL29yNU5obEpKNXcyZGlVOGdxN3Az?=
 =?utf-8?B?SjBpTHdLbS9EcjBVa0dvS0t0amF6L0FISjhaN29wN1VoVkcvREU5TG1FQ2dy?=
 =?utf-8?B?RDdKWGFVYUtBUmVIbEZHVXpCSUQ4dG13b0I2TDVzNFJCQ1p4YkQzekZZUW9E?=
 =?utf-8?B?NmNid2liaHI3TDgxVGczRUxjeW05RmhmVk15SW15Yk83cjJNL3lkUENrQ0c1?=
 =?utf-8?B?RnBlUlVEeTlka1psNUx6eno0Wi8vS3YzUzdyUWwzbUk4aUNwMFJ6WFd0YUx3?=
 =?utf-8?B?YUlTenQ2TGdZamhlYzVYNjVMdXRlM2JaeXF6SjBFQ0JDZ0hObzBBcFllR2E3?=
 =?utf-8?B?T2M4clN1alZJejFyNG9nR2lISEJkdVRjSGlXZys1RTloNzRoOFp5dTJ6bi9y?=
 =?utf-8?B?MXVweUppWjBtUkx3L3E1dHJ3bEpFYWFORUNaMWNMMFl1ZUY5RHpEL2RXcHVX?=
 =?utf-8?B?RmlnN0FFc2t2Vno4bkJNYjlNR2VYbG5QSFVSZnpCRzdwUEVmWDcvci9ITzZu?=
 =?utf-8?B?enNteC84anRSY2ZrMnBMMTlRY01QOEcrSW9OYlZ2TERvaWQ0TkZVUXFlWE1q?=
 =?utf-8?B?bXM3SjJOK1FMVzBVSTJERzU4d3k2TnhwSU41VUlkdUxNTGF6WExiMnVFa2c1?=
 =?utf-8?B?d1MyTThra2tscGgxcEhXeGRiK21KMlVpcmw3bnpYb0RqZFh1WCtFdGV0TTBR?=
 =?utf-8?B?bW5JQy8xdG1WMThDV2pWd3p2Y2dDTXE5QmR6L3REMk9TTStyYURXSmpTcWJj?=
 =?utf-8?B?VksxMi90SmthY0VDOWhNUFpxSnQ0T2swTUJCbExWUUIwZEpQQXh2NHFqNzhV?=
 =?utf-8?B?TEhEa1ZoTDI0ck5wRkwzZTZFQkxWSGJzRmZJbFJ6SjlESFpJdk9XN1hRT1ls?=
 =?utf-8?B?VytNM2ZieE50SHVteGw3aVJWTGdOUEY1V254RnV0RzdPYmZ2RzRPODJRTnZN?=
 =?utf-8?B?NmFMbE93VXMwdmxHcG9ma0RWYldRYTkrTDA2dTNJa3MyZlRUbXgxbG9OSXpr?=
 =?utf-8?B?MW5TcFJtK0tCamV1V2ljeUJnaFA1QlhUejhrSDhjNmF1aUZMRmNBSnYySGRF?=
 =?utf-8?B?QVVjaVBnN2hOSEtLZnpYVVI4NnZXbVZtWXZUb2o3b1hzOGNhRVRISlNQWTZI?=
 =?utf-8?B?RTJKTWs4NDdkYWhqZXUrS1kzTUMyNndRVktUdFM4Q0ZxeFphNXdqb2ZHbllR?=
 =?utf-8?Q?VPxzOHDqT7bvVHycrBdq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFVGVDUxeWVoZm1qZ3NtTzcwMWlmU2ZrL09iLzVTdHIzeDFaRERCWXFTTkQv?=
 =?utf-8?B?STNlUzI3bkFqTFNQRU9wbUY5QjZnNEhXY0NVdzAwSnZYMjNISi92eGdVSDhY?=
 =?utf-8?B?Vi9sY25yT0JpSWxNRFVCbHc4cmlDRnZXbGhRdU5QcWdYRVN1UGlDdGJGSU42?=
 =?utf-8?B?aFllRnlESGxoV01ORTBHcUM1UHU2SUg5YSs4U1N5OGNja1Zwd1FVLy95dm1l?=
 =?utf-8?B?K0tyR0hzQTI3U1VyOWQrcUp5emhWTnFJek9uSU5pNG9LZUkxY1pjTXJQRkpZ?=
 =?utf-8?B?cUNPRzNJT2VCZXhueEtaOWpwT0dGYTdwV3RPY09TNUJHVit6NVNHMmk0ZnEy?=
 =?utf-8?B?aDdvY3ZPL3lGSEp6dkR0ci96RWxLY1pZVU4waUN1OTlJL0RTRE16TWpESmVC?=
 =?utf-8?B?clA1TFowR1lHdm1yRCt5Q1p5bGZuZGU4SUFqMVdRRXFCME9Td2pQL3RBQTRs?=
 =?utf-8?B?OFVYY1BmUlJmYzhvU200YmFiTkc2N1VseXNvRXdMNkxlb3V4dzRKVnMvQ0Vi?=
 =?utf-8?B?R3YrM2tDK1dqejBzK3dMMmt1WjhFb0IxNExtZk5CQ3NubHVtTnMxSmZLTmc2?=
 =?utf-8?B?N2tKNEowWDl3OVcyNjhMQWtRbklnVWxOZGt3bjl1b3dqZEJBeXdETW1ZaFd1?=
 =?utf-8?B?aW1EV1ltN3loekpNTjVzUjBySzk5N0tZMGRBSjhVRzhhY1NxTFlkQVdTSlFT?=
 =?utf-8?B?MzM4RUZ1Tmd6WWxOdjhmT3drWkZvYm5sSGJaWVk1YjNlMDJJNGhxY2wwdktG?=
 =?utf-8?B?eS9vVklZcTJSYzhkZmlKUHV1MU54K01XaEw2aURqZzZRaFVCTXZzczBqUzdR?=
 =?utf-8?B?aUdEU01rOVJESlFwTml3WENXVUFIcm5QcFcxeXVXbEJsZmwwT1hMOFF0Qzhv?=
 =?utf-8?B?ckZQbEIzWUZ0VklnVWZFOS9JeXFXUW1ES2toTDVlbzlXOTREWFcwaExKR2dX?=
 =?utf-8?B?eDZOQzA2eStBYS9vWGhVbDdUaHVjaEMyZnMrbmhPTGZHOVlrenlGcTkybjh4?=
 =?utf-8?B?RVlpS2pua0pnb0M2V0g5V3EyNzdkeW1vV1V0Y25VSytVSTdlZUllYjJ3R2RS?=
 =?utf-8?B?SXNHR0ZmSWk0dmZ5ZG5jamNOVmM5eXFUVjZxTzVBaDNkeCt4SHRYY3pZeitH?=
 =?utf-8?B?Unk4WmdDcC84bEgzc1JEMHRBZWN0MFE4RFlmZUxMNE1xdGdjUi94Z0kzZ2NQ?=
 =?utf-8?B?QXlGU0N1c1lQdGJzdmVaalVKblNBazJJYnBwQWtSYWVDVmUrYk0yYmVuYkpa?=
 =?utf-8?B?VU4zdHk2V0JVQk83UkszNmxESDZEV1ZxSHVOR2V3K2FDbllTZmJyNyt5WnY3?=
 =?utf-8?B?RGpTakhOTVBJZFRUTElDNzNpWHJ6U0lQbVRvbk55Q2Q3aitLWW9hL0pvTzVP?=
 =?utf-8?B?SjhvOWxKMGw0aWptWldXd3dpVmNudXV4d2hQd0FFbDBaN0N4SFo5UXF5VElL?=
 =?utf-8?B?NHI4U1BrN1BxNVFlZXFxV1dnMFJPa1V1RGpaeVlzSm1MUjY4L3A0citmajVW?=
 =?utf-8?B?TVBaRXZvUi9SRit5ZTlCZTFHdldSRVdxMTgxSExSb2R5ck5QOUR2eXBFVWl5?=
 =?utf-8?B?ZENyeGtJSk1aZGVGWnMzdm5sem9XY0czOTBIUlQ4Qk03amJ1Wk0zZzcrWnhX?=
 =?utf-8?B?eHhpY3JvdFMvZzVvTEcyeUIrN0JQdEZpZWwzWGhvcmhMVi9IOXROSU1iMmMy?=
 =?utf-8?B?RTFvUzZ0TGpBeUZvN3RWeVlvYi9tbld6VnAzeWp5R1FGMDI0dkdLTjd1amR4?=
 =?utf-8?B?aVZCRC9QY2xraElCR2R0T2JKVmpETER3NTdtQ2J2ZE9DT2djT3VacVJHLzVS?=
 =?utf-8?B?dnVrRFA2RXRadjhyK2xZdytlSFF3Zk5KUUx5alFRejU0Vjh6dHlmV2dnMmpN?=
 =?utf-8?B?L1hPYTVsM2ordjVSUUxzZ1FwS2J1OVlJOC9wNFlCSDJQUmJKQmtpTkdVWVZw?=
 =?utf-8?B?VVJ4ZVZpOWZZSW5JblNoUjZob3Y1blpFaEp2VnRnZHpNS2VMTEtTcEtEcEEx?=
 =?utf-8?B?SFhaSTVBN3kxYU8wd2pFRUxhMkR2aWJPb3dSekhyUGNMMldmWEd0U3NkeGFl?=
 =?utf-8?B?SFpNZ0hTVVFvZ0MwVm9ySkg0WGwydUFoVE5OT2J0YzhROUdadlZPTmxrS0RQ?=
 =?utf-8?Q?BqSR2CBwd3pSDZkBH5SRYE7fs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53859b3a-2dc3-4b45-0c3d-08dcf9c766c7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 16:16:40.1133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRvqVRVd4/jTlliV+gbBAjkCm+kied9UEgilLI8YxooMn1MK6fev9Ddw/iHNqGTFoh4h9kdeFO7F4DXTKiKxmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9052


On 30/10/2024 10:51, Luca Fancellu wrote:
> Hi Julien,
Hi Luca/Julien,
>
>> On 30 Oct 2024, at 10:32, Julien Grall <julien@xen.org> wrote:
>>
>> On 30/10/2024 10:08, Luca Fancellu wrote:
>>> Hi Julien,
>>>> On 30 Oct 2024, at 09:52, Julien Grall <julien.grall.oss@gmail.com> wrote:
>>>>
>>>> On Wed, 30 Oct 2024 at 09:17, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>>>> Hi Ayan,
>>>>>
>>>>> While I rebased the branch on top of your patches, I saw you’ve changed the number of regions
>>>>> mapped at boot time, can I ask why?
>>>> I have asked the change. If you look at the layout...
>>> Apologies, I didn’t see you’ve asked the change
>> No need to apologies! I think I asked a few revisions ago.
>>
>>>>> Compared to https://patchwork.kernel.org/project/xen-devel/patch/20230626033443.2943270-25-Penny.Zheng@arm.com/:
>>>>
>>>> ... you have two sections with the same permissions:
>>>>
>>>> xen_mpumap[1] : Xen read-only data
>>>> xen_mpumap[2] : Xen read-only after init data
>>>> xen_mpumap[3] : Xen read-write data
>>>>
>>>> During boot, [2] and [3] will share the same permissions. After boot,
>>>> this will be [1] and [2]. Given the number of MPU regions is limited,
>>>> this is a bit of a waste.
>>>>
>>>> We also don't want to have a hole in the middle of Xen sections. So
>>>> folding seemed to be a good idea.
>>>>
>>>>>> +FUNC(enable_boot_cpu_mm)
>>>>>> +
>>>>>> +    /* Get the number of regions specified in MPUIR_EL2 */
>>>>>> +    mrs   x5, MPUIR_EL2
>>>>>> +
>>>>>> +    /* x0: region sel */
>>>>>> +    mov   x0, xzr
>>>>>> +    /* Xen text section. */
>>>>>> +    ldr   x1, =_stext
>>>>>> +    ldr   x2, =_etext
>>>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_TEXT_PRBAR
>>>>>> +
>>>>>> +    /* Xen read-only data section. */
>>>>>> +    ldr   x1, =_srodata
>>>>>> +    ldr   x2, =_erodata
>>>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_RO_PRBAR
>>>>>> +
>>>>>> +    /* Xen read-only after init and data section. (RW data) */
>>>>>> +    ldr   x1, =__ro_after_init_start
>>>>>> +    ldr   x2, =__init_begin
>>>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5
>>>>>          ^— this, for example, will block Xen to call init_done(void) later, I understand this is earlyboot,
>>>>>                but I guess we don’t want to make subsequent changes to this part when introducing the
>>>>>                patches to support start_xen()
>>>> Can you be a bit more descriptive... What will block?
>>> This call in setup.c:
>>>      rc = modify_xen_mappings((unsigned long)&__ro_after_init_start,
>>>                               (unsigned long)&__ro_after_init_end,
>>>                               PAGE_HYPERVISOR_RO);
>>> Cannot work anymore because xen_mpumap[2] is wider than only (__ro_after_init_start, __ro_after_init_end).
>> Is this because the implementation of modify_xen_mappings() is only able to modify a full region? IOW, it would not be able to split regions and/or merge them?
> Yes, the code is, at the moment, not smart enough to do that, it will only modify a full region.
>
>>> If that is what we want, then we could wrap the above call into something MMU specific that will execute the above call and
>>> something MPU specific that will modify xen_mpumap[1] from (_srodata, _erodata) to (_srodata, __ro_after_init_end)
>>> and xen_mpumap[2] from (__ro_after_init_start, __init_begin) to (__ro_after_init_end, __init_begin).
>> I think it would make sense to have the call mmu/mpu specific. This would allow to limit the number of MPU regions used by Xen itself.
>>
>> The only problem is IIRC the region is not fixed because we will skip empty regions during earlyboot.
> Yes, but I think we can assume that X(_srodata, _erodata) and Y(__ro_after_init_start, __init_begin) won’t never be empty for Xen?
>
> In that case, the call to mpumap_contain_region() should be able to retrieve the full region X and the partial region Y and
> a specific function could modify the ranges of both given the respective indexes.
>
> Code in my branch: https://gitlab.com/xen-project/people/lucafancellu/xen/-/blob/r82_rebased/xen/arch/arm/mpu/mm.c#L382

Can we keep the current patch as it is ? We can revisit 
enable_boot_cpu_mm() when we enable start_xen() for mpu.

I can send a respin once we are aligned.

- Ayan


