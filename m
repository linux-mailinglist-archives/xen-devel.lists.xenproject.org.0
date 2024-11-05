Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7A99BCC3C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 12:55:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830188.1245101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8I8q-0001ib-P9; Tue, 05 Nov 2024 11:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830188.1245101; Tue, 05 Nov 2024 11:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8I8q-0001gt-MK; Tue, 05 Nov 2024 11:54:36 +0000
Received: by outflank-mailman (input) for mailman id 830188;
 Tue, 05 Nov 2024 11:54:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R/xQ=SA=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1t8I8o-0001gn-SY
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 11:54:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2612::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6eee0e0-9b6c-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 12:54:30 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PAWPR03MB8916.eurprd03.prod.outlook.com (2603:10a6:102:334::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 11:54:27 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 11:54:27 +0000
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
X-Inumbo-ID: b6eee0e0-9b6c-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMjo6NjFkIiwiaGVsbyI6IkVVUjA1LUFNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImI2ZWVlMGUwLTliNmMtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODA3NjcwLjMwMzgwMSwic2VuZGVyIjoiZ3J5Z29yaWlfc3RyYXNoa29AZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+FUR8iqZpWH7auno61YBJkcCNiGr4kyJIclAUcwNQiIjSscrecU80y9OAneTn/JNZ32XM+SNz4b8dFziiHV4ZJpXT5A3pSQ+OMnQ0/niJlNepodTXFt1iTH+tVxyFkWnsIWMnUV07PTL57vOBXh2hPP7e1pVVy1QJhmxl46gguRP7sVauFGe2+hc7pLR5LjSgtIBuUlz/7mTHsKBlJJ4wa2zC1m+HIbvmdxKdYOXrH7kttgRMFnRuSOFptR4MbVbnsnDS2Ka8zzXgqhgzf+m1PlvzKSGLRXvzuFIrXvjz0Cezm1mJ36inykikvpiAJ3T5Z2I/aYMt1dIrKH7DFPKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWwn/w7cYHisTNMosxeKZHSNUmz08gj0lC1qtbW3YNg=;
 b=ietg/k6rOpddJFmEz5GUJVITcMOh3uyerUfqXn/cIrTn+lybrb7aFpMMT4VMApUT+tFvgMjvxW2uUF2WI0eXPFyWJDYF5BnrlpYVvZRgcWZwS/pDkI1SC5c7wxR72XABxbXCf8Xl0jG8XPQHCPhS/GM/ree45xtpxQwY9RLBbiGycS8mZSRsKQLF0CNBYHq1u4Bnjv2uV0hpbEh/dBhU1yBM7JhTdn7lFeWKCtkaZLmAvr8HyCnFGV9uQG5xnNCi1WcgHD/EelZ0ensowrTt8McLPK4tL19ALtVXeteJa34HsE7yk5MtRW4l7pvREXfZQNPePlN/kTgd73lEEte3sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWwn/w7cYHisTNMosxeKZHSNUmz08gj0lC1qtbW3YNg=;
 b=f7Hua2vp3+5BGPNW5tmE+FzB3XawY+UKLTML5blQDXZPkbFMvMpOgjIvmeLM2BpjKQyKTt3W7ngq8SYMQkdmHHKV4D8+idBK+taHyGVJ5oi7+g/64BvYy9FeyNKf9b0C1z+L5YE7BCk30mr/lc5U1BM5r+DBAu96OXfZI1qAk7ZFJKBrwZJT0sJ6zgCnSVJLEwqA5yS7ILyxqHxTD0P4wNRWseQ8tabTjcANah9jGLq/EqWk9L6hsiHT49Qc9C1GssYPEcqiOCXEfMDMfv9/Fc2ZLgKJOBmS/iEdf2Hj0fPp5FYNxBymMizC/KpS/kQrVSlXb5mWwEkjTzVJQEH5TQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <23cfbbfc-45d9-4a45-850c-56c3d796956b@epam.com>
Date: Tue, 5 Nov 2024 13:54:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/device-tree: Let DT reserve map entries
 overlap reserved-memory
To: Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org, Luca Fancellu <luca.fancellu@arm.com>
Cc: tpearson@raptorengineering.com, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1727388925.git.sanastasio@raptorengineering.com>
 <302647e409d91ea7ed39e568dadeedc572976c3b.1727388925.git.sanastasio@raptorengineering.com>
 <1ae100b3-17f0-4ac5-beb3-fdd2f12adee7@amd.com>
 <a127edbb-8006-466d-a529-1b7a80af21b1@epam.com>
 <418b801a-0a1c-406a-99ab-7e3bf81374b2@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <418b801a-0a1c-406a-99ab-7e3bf81374b2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::16) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PAWPR03MB8916:EE_
X-MS-Office365-Filtering-Correlation-Id: e87bccd1-33a2-4144-14a6-08dcfd909978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VThLOThoWHdSNmJPanZqcWQzcjNNS0RPTy9qYVZBWCt6cDVBcFZrWE9lSFdX?=
 =?utf-8?B?Yy9EaXZiN3dLTHNMUFVaZTFQMlI0V21MVFVyUEhGQXVMeUdUclFrV3ZGNHR0?=
 =?utf-8?B?ZWVaYjd6NzVGdmJ0NTV6N2FCRnlyd2wwVzkxRzZqbklQRFhNMWE3RmMvbFFM?=
 =?utf-8?B?c2FGT1pNRW15M29QQzhmRHo4eVYzaktGRXYyQzRSamg2cEhBclNmdjBiMk5Q?=
 =?utf-8?B?ckRLR05rUDFDNVlVc3ZoZVdQd1ZYZlNaWUhNQmZyZ2JhZGtHWmhXaXBNSlgz?=
 =?utf-8?B?ekk5dXJ4cm1Ja1pLN3lnZ2V5SHNkQjY0ZUg2TUNIUmZmeEN1ZFF1OS9KUDBm?=
 =?utf-8?B?SzZGSUFEbmNhNURGeUY3ZjNXMi9TdWtKS3o3Rjk2T2lwWk5IckhjNThLSzZT?=
 =?utf-8?B?Y1hRUUZJNERiM2FpOHJHZ0FPOWp6WlY1RlRDZDRxTFZSWmhycUNTeTJVeWVL?=
 =?utf-8?B?RnRXOWtqOHBaTklWNHdwNEJTODM5Z3AxcnVmL2JBenVDWGVwb3h1UTBSZDli?=
 =?utf-8?B?aFJ0SDU4b1BNNDdtUDg3T3QzME1JQmhQU004ekdIalFHOFkxaUtHVXRyUVNG?=
 =?utf-8?B?Q0JjcmlTRU9xa0k3TytySWxxZG9INEdjZW56ZTlEK051bmo3T3FBUmFFbWNB?=
 =?utf-8?B?Q0hGZGxpNkZycjh1TCtuWlVYWXU2RGFTVVVXaVNZTzdmL1RDU3RRTVFMeWRz?=
 =?utf-8?B?QXRtd2xjaGl6NElocHJ1cmt3ZWIzQnoxWDhGUWpSOEVTeUxvdDIrVzZWbUoz?=
 =?utf-8?B?c094aWwyUmJ4VGo2UGJxek5ZR0dyK09jR2RGd2FzQ09OeTdFUXc0U2Y4Zzkr?=
 =?utf-8?B?NHJwdUkyb3p6eEQzaHhTblpYbGR2WGxZc28vY3RpVFdOVThMZVIzZkVsRDJk?=
 =?utf-8?B?cERrbVNLU1lFK0FDNENEdkRJb0Z3TlBPTXJWUFpObjRPWmYwbGJvU0hLYlBz?=
 =?utf-8?B?bUNDdTRBdkVTTE42OW1JWitlcjVpc283d09CZTFoSGlFZ2ZpcEhlUGlzbmNR?=
 =?utf-8?B?MmM5VXlEbzNXbVI5dUZUSDVYVVl5Q1p5VktiZ1dGUlJ4YW1SYUJkSXNEUkpM?=
 =?utf-8?B?TEdvNWt6UFJQYXdYamxraE1ncFZpei9uWnZQVDR4a0ZBdHRSZ0NUZmtuMGw1?=
 =?utf-8?B?ZXB2Rjd2Yk55Tk5rTi90WSthWXZEdW9RanMrMzhWZHVpS2p4L2Ribm41L0Rj?=
 =?utf-8?B?YVB6VnlwbG9uS0E1MnpxeUgxU2ttb2poQXBGOVJJcmVMU1FoM2ZTc1h1Z0F1?=
 =?utf-8?B?Sm56T0FZaE12S1ZaZzNCT21NaGpiczVNUzByWGFmTmlWOFdkZ295c0dpZml0?=
 =?utf-8?B?RjFRKzZjajdFQUFXaUVkZHp5MFdLbk5TRFB6OGZJelZRbVlmeHVRSEs0am9N?=
 =?utf-8?B?TERoVSt0Mk54ZmI4ZEpUMm9aRGpsZ3pQTC84OEU0WWlQeWJMNWVxa0oxNzc4?=
 =?utf-8?B?VGZzWWFmczh3NmY2QkprRFBCeEhsTVBVR3lidmUzYzVHSWIrTnd2cWhxQkNp?=
 =?utf-8?B?Mkd0TE5STGhTTzNPdk5YaytFbzBtNFFPZjJMOXBBT1VvYlh1bitMd1dVU0sx?=
 =?utf-8?B?QVZBMEs4SFc2Rm5NWFI0dGdRUFpvd2dhVGNvSVEvclFuVFF2TVA4MHRnQUJa?=
 =?utf-8?B?U3A4cS94cWFOY1Y3b0NuTkpSK1ptTGd6R3lUcXN0UlpiU2RpMjdnN1Zac2hH?=
 =?utf-8?B?ZEFISGpSQ0s2UnhkZzRTY1MrbjhybTN0WnBZZ01Ba1dIR3A3eC9wcTF5WXBN?=
 =?utf-8?Q?DZW7hAxsyGEqYiIP/o7Lmpd4RFJ0SUKEa2QuRNn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K25mY2pHWWJvOHlKS2xFT1BRZDd1QjRhMGMwcHhLS21tMXhiT1ZLWjY5Yk1C?=
 =?utf-8?B?MjBySk9RQllSWGlkTTJBVHdNa3ZJZjRuR1FTL0Fwc1hhY0k1QVZNZkYwZ0ZT?=
 =?utf-8?B?dzBuMGtLWlZhL3lzanRmZWhKSzNjVFMwUmZITGNvOW9wS0NDT3JpdGhid280?=
 =?utf-8?B?RUszVjczTzcvTllVT1pjMEVFaERQaEV0dmVLZE4vOFltTXF0dkIxSzRPMHFU?=
 =?utf-8?B?U2dGWXpXR1J4NDIzalBzL2NTUzR1TVRjODArUU1JRldHSDlLQmlPUEZTNjN4?=
 =?utf-8?B?NUxHdk1JNkFsZTZsdmRRdlBtd2NqZFlOTWRrTjVwZ05EdDljZVN2TUJJdEMx?=
 =?utf-8?B?eFppRW9McjVxQjNTVzJvcmg0dEowUVU5N09tbCtESGI5N3VZZU5HTkt3Q3BF?=
 =?utf-8?B?UDIxMVE1NGEzaHRrbm5qVTgweERiN1A0Y0QyRmMrbGRtR0RFWHFKSktCaDU5?=
 =?utf-8?B?c05Jdm9TSG9Bc1NkNkt3cjdzM0RJYkVJTTZUUWxYU3I2bThJZURLaVMwbVBU?=
 =?utf-8?B?ZzN0aG5mYm5PR0lFNFRUQ2lzd29Id0t5NG9hUUR1S0VNL2RUbnl0SFBPN3hI?=
 =?utf-8?B?ckZjU3R0UmU2V04xenl6L2I1bmhpejNDVGpZMUdBMzRYYlIwVnBVMlJIcWpN?=
 =?utf-8?B?eDNlUjgrTTNGSjhhamRUUWVTN2t5TXlRajFFcE52V01aM2Z3TkJXMTRXcjVI?=
 =?utf-8?B?b1lyc0pTemdkUzkwWXFtK25pTG11OXhMR0ViOU1ydXJpbnA3bEpWNnN6S1A5?=
 =?utf-8?B?L05RVUV0Zld1WFhDZU9iZ0NnUEliLy9kd2oveHM0TlNQdHlsRjBGUTFyMVV4?=
 =?utf-8?B?SVdzMEVBNHdrelZqVmYrc2lXZ3pPb1gvYlNnWGp5OXo4c0dRbW5aZnNVYXBu?=
 =?utf-8?B?alRpZzRRU1FXNEtsZmVFWWh4aWhrYXNvNTlXTTZvZW9wb0VpVHNidTR1MXJN?=
 =?utf-8?B?Q2JHcThIeFh1dmJUak55RTJnN0pNZkc5eEpXMzBmcnBVdzdEaGhMNjdTTXRw?=
 =?utf-8?B?aTdjYjY4ZGJrQVdLbXB6TTRCS1RXcmJwYkFwNEZkUVJ0Nzc0Z1VQTjM4MGZj?=
 =?utf-8?B?NjNEUjlTSloxc2dQR2VSTm1DS1RqT1BQcFRpVkFZb2szY0ZKZjJZaW9FbDNT?=
 =?utf-8?B?NHpTMG1MR3NENUxiMERFS2JVTHFtczA1TjVtalRFY3hrdHlCWU9qZUdZQmhv?=
 =?utf-8?B?cXJNVTQvcDEyTUVoZlkxMk5zVTRvejFYenAwaWI3L2ZmZDFnRkNnejRodmxN?=
 =?utf-8?B?UHZ2dmdEZ2NKMTV6VmxrdDlLN3lPeW5wNG5ZZVJxWml1WXdUUS9MMmZWcExu?=
 =?utf-8?B?N1VpUkRvNHpGdUd3Z2NGeTNvRVdjbDhCUWJMdU1NYkd1V3NxZ25YeHV3cmxM?=
 =?utf-8?B?ekFCNFErckJFdVA5RXBxVFdsa2xnM2h0eVd6Rmp1QngvN1NCRWdPK1kvdEty?=
 =?utf-8?B?MXpoZCtqc0Q5cTN0OWdmSDcveW9jcVoyRUFxZHJSOGhhRlJ4RDBGaWdZK0Np?=
 =?utf-8?B?SkVBa3IzbUJpbGhuRTJEbTc1RGZ2TkRZclB4ZzZtM0hUM0JNR3NMQVI4V2I0?=
 =?utf-8?B?dVpFSDJNL2hINkpMMzJWWldOcTgvUk8zYTNydGVQbkJndFk5R1dBNXpkelpJ?=
 =?utf-8?B?ZEprVEx4Y2JTWnIwZEd2a1FMWjJhalBFQkRxR1NWd2FNQ1QvWk1EN1VYdUdq?=
 =?utf-8?B?OTRtclVlN1JMbWFhanNpaEoxVTA2dmJyVHlieUQzWTJXYVdSQmhGWThSV21Z?=
 =?utf-8?B?eDV6MjJsMUN5Ynk0YkVoL0RxNk9vMTRSWG9EaUpXRG5ONDNYVVdrOHRMU3FB?=
 =?utf-8?B?VmVORWRVaGw4am5KQmdLN2YrRHR2aURHaTRrTi9RZUpZa3lnR0tvQzZmMlhK?=
 =?utf-8?B?dzg3U3gyNUpsTEpIVUozUFZ6OEZrTGY2cXM4c2FCTTNYZDRBMkkwRkRYZnhI?=
 =?utf-8?B?dTJBT2ZEMk9ZUmNPUHJLbWJuYlBJSmdCZXBjMFdxVkYvaVl6SlBUQjNqNUpP?=
 =?utf-8?B?dko3THlwLzNvbXJ4TlovK2p4dkRVU0plSmMrcXdtaHYxREZRQ1Y1Z3B0MWdw?=
 =?utf-8?B?YmtRZ0V1SHdjQkhGWDZHdjNyZDlWY0VXOElXY2puY1ZNRVRabk9iTTNpNnJs?=
 =?utf-8?B?MDRWRHMzS0I2SDlkR2M1d0xyMkxCTVcyY2NmSHRZSG12dzFnVjdMdVA1TFJs?=
 =?utf-8?B?NHc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e87bccd1-33a2-4144-14a6-08dcfd909978
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 11:54:27.3258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IT1dCTTrmZ8e5u2lTQAO77jti8EZpjqaU5IiyGJsQwdiqYLudOFx34KLmYmi2uCHbeNvoMRKnx3X5elR4hleYb5aeudXLWStKz6nn1SKQTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB8916



On 05.11.24 12:42, Michal Orzel wrote:
> 
> 
> On 04/11/2024 13:39, Grygorii Strashko wrote:
>>
>>
>> Hi All,
>>
>> On 04.11.24 12:49, Michal Orzel wrote:
>>>
>>>
>>> On 27/09/2024 00:24, Shawn Anastasio wrote:
>>>>
>>>>
>>>> Commit 53dc37829c31 ("xen/arm: Add DT reserve map regions to
>>>> bootinfo.reserved_mem") changes the way reserve map regions are tracked,
>>>> and as a result broke bootfdt's ability to handle device trees in which
>>>> the reserve map and the `reserved-memory` node contain the same entries
>>>> as each other, as is the case on PPC when booted by skiboot.
>>>>
>>>> Fix this behavior by moving the reserve map check to after the DT has
>>>> been parsed and by explicitly allowing overlap with entries created by
>>>> `reserved-memory` nodes.
>>>>
>>>> Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to bootinfo.reserved_mem")
>>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>>> ---
>>>>    xen/common/device-tree/bootfdt.c  | 28 +++++++++++++++++++++++-----
>>>>    xen/common/device-tree/bootinfo.c | 11 +++++++++--
>>>>    xen/include/xen/bootfdt.h         |  3 ++-
>>>>    3 files changed, 34 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
>>>> index 911a630e7d..2a51ee44a3 100644
>>>> --- a/xen/common/device-tree/bootfdt.c
>>>> +++ b/xen/common/device-tree/bootfdt.c
>>>> @@ -177,7 +177,7 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
>>>>        {
>>>>            device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
>>>>            if ( mem == bootinfo_get_reserved_mem() &&
>>>> -             check_reserved_regions_overlap(start, size) )
>>>> +             check_reserved_regions_overlap(start, size, NULL) )
>>>>                return -EINVAL;
>>>>            /* Some DT may describe empty bank, ignore them */
>>>>            if ( !size )
>>>> @@ -590,14 +590,36 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
>>>>        if ( nr_rsvd < 0 )
>>>>            panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
>>>>
>>>> +    ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
>>> This should be moved before fdt_num_mem_rsv so that the program flow makes sense. In your case nr_rsvd is
>>> not used immediately after.
>>>
>>>> +    if ( ret )
>>>> +        panic("Early FDT parsing failed (%d)\n", ret);
>>>> +
>>>>        for ( i = 0; i < nr_rsvd; i++ )
>>>>        {
>>>> +        const struct membanks *overlap = NULL;
>>>>            struct membank *bank;
>>>>            paddr_t s, sz;
>>>>
>>>>            if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &sz) < 0 )
>>>>                continue;
>>>>
>>>> +        if ( check_reserved_regions_overlap(s, sz, &overlap) )
>>>> +        {
>>>> +            if ( overlap == bootinfo_get_reserved_mem() )
>>>> +            {
>>>> +                /*
>>>> +                 * Some valid device trees, such as those generated by OpenPOWER
>>>> +                 * skiboot firmware, expose all reserved memory regions in the
>>>> +                 * FDT memory reservation block (here) AND in the
>>>> +                 * reserved-memory node which has already been parsed. Thus, any
>>>> +                 * overlaps in the mem_reserved banks should be ignored.
>>>> +                 */
>>>> +                 continue;
>>> I think this is incorrect. Imagine this scenario:
>>> /memreserve/ 0x40000000 0x40000000;
>>> and /reserved-memory/foo with:
>>> reg = <0x0 0x7FFFF000 0x0 0x1000>;
>>>
>>> You would ignore the entire region described with /memreserve/ even though it overlaps just the last page.
>>>
>>> The problem you're describing is about regions that match 1:1 in /memreserve/ and /reserved-memory/.
>>> Therefore I think you should check that the overlapped regions match exactly.
>>>
>>
>> I've also discovered an issue with Commit 53dc37829c31 ("xen/arm: Add DT reserve map
>> regions to bootinfo.reserved_mem") - the bootloader adds Initrd in
>> FDT reserved map which then conflicts with Initrd module (ARM64).
>>
>> This patch, as is, doesn't fix an issue for me:
>>
>> (XEN) Checking for initrd in /chosen
>> (XEN) Initrd 0000000084000040-0000000086152ac6
>> (XEN) Region: [0x00000084000040, 0x00000086152ac6) overlapping with mod[2]: [0x00000084000040, 0x00000086152ac6)
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 0:
>> (XEN) FDT reserve map overlapped with membanks/modules
>> (XEN) ****************************************
>>
>> So I did fast try of Michal Orzel suggestion and it seems working for me.
>> And if it's working for PPC - may be that's it (feel free to incorporate). Diff below.
>>
>> (XEN) Checking for initrd in /chosen
>> (XEN) Initrd 0000000084000040-0000000086152ac6
>> (XEN) RAM: 0000000048000000 - 00000000bfffffff
>> (XEN) RAM: 0000000480000000 - 00000004ffffffff
>> (XEN) RAM: 0000000600000000 - 00000006ffffffff
>> (XEN)
>> (XEN) MODULE[0]: 0000000048080000 - 00000000481ec000 Xen
>> (XEN) MODULE[1]: 0000000048000000 - 000000004801e080 Device Tree
>> (XEN) MODULE[2]: 0000000084000040 - 0000000086152ac6 Ramdisk
>> (XEN) MODULE[3]: 0000000048300000 - 000000004a300000 Kernel
>> (XEN) MODULE[4]: 0000000048070000 - 0000000048080000 XSM
>> (XEN)  RESVD[0]: 0000000060000000 - 000000007fffffff
>> (XEN)  RESVD[1]: 00000000b0000000 - 00000000bfffffff
>> (XEN)  RESVD[2]: 00000000a0000000 - 00000000afffffff
>> ...
>> (XEN) *** LOADING DOMAIN 0 ***
>> (XEN) Loading d0 kernel from boot module @ 0000000048300000
>> (XEN) Loading ramdisk from boot module @ 0000000084000040
>> (XEN) Allocating 1:1 mappings totalling 256MB for dom0:
>> (XEN) BANK[0] 0x00000050000000-0x00000060000000 (256MB)
>> ...
>>
>>
>> ---
>> diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
>> index f2e6a1145b7c..10e997eeca8d 100644
>> --- a/xen/common/device-tree/bootinfo.c
>> +++ b/xen/common/device-tree/bootinfo.c
>> @@ -124,6 +124,30 @@ static bool __init meminfo_overlap_check(const struct membanks *mem,
>>        return false;
>>    }
>>
>> +static bool __init meminfo_is_exist(const struct membanks *mem,
>> +                                         paddr_t region_start,
>> +                                         paddr_t region_size)
>> +{
>> +    paddr_t bank_start = INVALID_PADDR, bank_end = 0;
>> +    paddr_t region_end = region_start + region_size;
>> +    unsigned int i, bank_num = mem->nr_banks;
>> +
>> +    for ( i = 0; i < bank_num; i++ )
>> +    {
>> +        bank_start = mem->bank[i].start;
>> +        bank_end = bank_start + mem->bank[i].size;
>> +
>> +        if ( INVALID_PADDR == bank_start || region_end <= bank_start ||
>> +             region_start >= bank_end )
>> +            continue;
>> +
>> +        if ( region_start == bank_start && region_end  == bank_end)
>> +            return true;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>>    /*
>>     * TODO: '*_end' could be 0 if the module/region is at the end of the physical
>>     * address space. This is for now not handled as it requires more rework.
>> @@ -154,6 +178,29 @@ static bool __init bootmodules_overlap_check(struct bootmodules *bootmodules,
>>        return false;
>>    }
>>
>> +static bool __init bootmodules_is_exist(struct bootmodules *bootmodules,
>> +                                             paddr_t region_start,
>> +                                             paddr_t region_size)
>> +{
>> +    paddr_t mod_start = INVALID_PADDR, mod_end = 0;
>> +    paddr_t region_end = region_start + region_size;
>> +    unsigned int i, mod_num = bootmodules->nr_mods;
>> +
>> +    for ( i = 0; i < mod_num; i++ )
>> +    {
>> +        mod_start = bootmodules->module[i].start;
>> +        mod_end = mod_start + bootmodules->module[i].size;
>> +
>> +        if ( region_end <= mod_start || region_start >= mod_end )
>> +            continue;
>> +
>> +        if (region_start == mod_start && region_end == mod_end)
>> +            return true;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>>    void __init fw_unreserved_regions(paddr_t s, paddr_t e,
>>                                      void (*cb)(paddr_t ps, paddr_t pe),
>>                                      unsigned int first)
>> @@ -201,6 +248,37 @@ bool __init check_reserved_regions_overlap(paddr_t region_start,
>>        return false;
>>    }
>>
>> +bool __init check_reserved_regions_is_exist(paddr_t region_start,
>> +                                            paddr_t region_size)
>> +{
>> +    const struct membanks *mem_banks[] = {
>> +        bootinfo_get_reserved_mem(),
>> +#ifdef CONFIG_ACPI
>> +        bootinfo_get_acpi(),
>> +#endif
>> +#ifdef CONFIG_STATIC_SHM
>> +        bootinfo_get_shmem(),
>> +#endif
>> +    };
>> +    unsigned int i;
>> +
>> +    /*
>> +     * Check if input region is overlapping with reserved memory banks or
>> +     * ACPI EfiACPIReclaimMemory (when ACPI feature is enabled) or static
>> +     * shared memory banks (when static shared memory feature is enabled)
>> +     */
>> +    for ( i = 0; i < ARRAY_SIZE(mem_banks); i++ )
>> +        if ( meminfo_is_exist(mem_banks[i], region_start, region_size) )
>> +            return true;
>> +
>> +    /* Check if input region is overlapping with bootmodules */
>> +    if ( bootmodules_is_exist(&bootinfo.modules,
>> +                                   region_start, region_size) )
>> +        return true;
>> +
>> +    return false;
>> +}
>> +
>>    struct bootmodule __init *add_boot_module(bootmodule_kind kind,
>>                                              paddr_t start, paddr_t size,
>>                                              bool domU)
>> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
>> index 16fa05f38f38..b8db1335be6c 100644
>> --- a/xen/include/xen/bootfdt.h
>> +++ b/xen/include/xen/bootfdt.h
>> @@ -159,6 +159,8 @@ extern struct bootinfo bootinfo;
>>
>>    bool check_reserved_regions_overlap(paddr_t region_start,
>>                                        paddr_t region_size);
>> +bool check_reserved_regions_is_exist(paddr_t region_start,
>> +                                     paddr_t region_size);
>>
>>    struct bootmodule *add_boot_module(bootmodule_kind kind,
>>                                       paddr_t start, paddr_t size, bool domU);
>>
>>
>>
>>
> 
> I don't think there is a need for introduction of that many functions. For a simple exact matching case
> we can opencode the logic a bit. On top of Shawn patch, the minimal version would look as follows:
> 
> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
> index d35b2629e5a1..759c790888f9 100644
> --- a/xen/common/device-tree/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -586,14 +586,14 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
> 
>       add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
> 
> -    nr_rsvd = fdt_num_mem_rsv(fdt);
> -    if ( nr_rsvd < 0 )
> -        panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
> -
>       ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
>       if ( ret )
>           panic("Early FDT parsing failed (%d)\n", ret);
> 
> +    nr_rsvd = fdt_num_mem_rsv(fdt);
> +    if ( nr_rsvd < 0 )
> +        panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
> +
>       for ( i = 0; i < nr_rsvd; i++ )
>       {
>           const struct membanks *overlap = NULL;
> @@ -605,19 +605,33 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
> 
>           if ( check_reserved_regions_overlap(s, sz, &overlap) )
>           {
> -            if ( overlap == bootinfo_get_reserved_mem() )
> +            unsigned int j;
> +            bool match = false;
> +
> +            if ( overlap != reserved_mem )
> +                panic("FDT reserve map overlapped with membanks/modules\n");

No it will not work this way - as overlap I observe is with Initrd which is *Module* (Not reserved memory).
That's why i've had to add new functions.

> +
> +            /*
> +             * Some valid device trees, such as those generated by OpenPOWER
> +             * skiboot firmware, expose all reserved memory regions in the
> +             * FDT memory reservation block (here) AND in the
> +             * reserved-memory node which has already been parsed. Thus, any
> +             * matching overlaps in the mem_reserved banks should be ignored.
> +             */
> +            for ( j = 0; j < overlap->nr_banks; j++ )
>               {
> -                /*
> -                 * Some valid device trees, such as those generated by OpenPOWER
> -                 * skiboot firmware, expose all reserved memory regions in the
> -                 * FDT memory reservation block (here) AND in the
> -                 * reserved-memory node which has already been parsed. Thus, any
> -                 * overlaps in the mem_reserved banks should be ignored.
> -                 */
> -                 continue;
> +                if ( (overlap->bank[j].start == s) &&
> +                     (overlap->bank[j].size == sz) )
> +                {
> +                    match = true;
> +                    break;
> +                }
>               }
> -            else
> -                panic("FDT reserve map overlapped with membanks/modules\n");
> +
> +            if ( match )
> +                continue;
> +
> +            panic("FDT reserve map partially overlaps with /reserved-memory\n");
>           }
> 
>           if ( reserved_mem->nr_banks < reserved_mem->max_banks )
> 
> Let's wait for Shawn test and other DT maintainers opinion.
> 
> ~Michal
> 

