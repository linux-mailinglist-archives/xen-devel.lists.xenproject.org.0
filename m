Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGrMIkhejGmWlwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 11:47:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7521123921
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 11:47:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227221.1533560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq7kO-0002rK-5P; Wed, 11 Feb 2026 10:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227221.1533560; Wed, 11 Feb 2026 10:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq7kO-0002kI-1f; Wed, 11 Feb 2026 10:47:04 +0000
Received: by outflank-mailman (input) for mailman id 1227221;
 Wed, 11 Feb 2026 10:47:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qg4=AP=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vq7kN-0002Tg-7n
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 10:47:03 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff1a9dd2-0736-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 11:47:01 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CO1PR03MB7844.namprd03.prod.outlook.com (2603:10b6:303:271::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 10:46:58 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 10:46:58 +0000
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
X-Inumbo-ID: ff1a9dd2-0736-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fs9WtW0tvnK1koeI6dGfVdZRs3pDIIg5t4lZ/84J8ZF604TMhjfCM2+CAfrWjL5YncJ7WOt99s482J44fEOMFGBhhntpLj1wvHwlnHDkCI1LEmyMxGIMNJDN4lefYVDqAQ3welepVwC5yC7lLQ0X1kPWTnh/uQ/7BbHA4Vc4bas1fNqyPs/+zrtUPioG0a9W/Ww+crxOJVJBxJWk7JQaxJR2tcXn5qXYSQLRhZgt9U2+lUGFgJfHS3ijSZNM8t3bb6ztg0/ODZN9JwFj7RlvSkqnWibYRHc73JqDcxINfggQLWDY5wStWhWlSiMINjhaSbSQfm04G20fccVMkW83CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pns87Gx8A+ohsVWJBKd5VQPd6Y2znuMXUnLwimLmow=;
 b=Vf7DHn796zwAGbEar5gHsTxQUlpF5/dfFYVnqpr5l1DQ/RBJrflXhnymAkXWo6h9xZ/K6C3rvjdKQRFAi0ritaOC6RvPNStSCo1DS24XKRdXYeWTXjGn81GSLw4IZQIrNPj8yj1MjGz4IIU2VUTGaJfApcbVijtSCHzHRg3mBEblEH9scRc+MDP0CHLo2UdCdILTqqsBAncNFlLilTowR3ko5njQevxJOINOsvq5CxXv1zpFkoWwtYWiEawXGlF28rFrANvarOePa5vCya+9wxVwwJzecOBuUlgdP/x9aKV5EIJTQxgu+fwvLGRI93pbA9jZJGmk9lUGfF8x/rUuUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pns87Gx8A+ohsVWJBKd5VQPd6Y2znuMXUnLwimLmow=;
 b=ER/eliVzWxGyr0UDvCzAjXbDs4nGf893xU0GpyvGwGd3UQKaY7sMpgBA4fBJWeWjOVw3Vuk6yZzy1zDP0sN0PzwOvwhOkTuCyatrrVgOVGjkuQ+Z09nrqMlhmDCRqEmQ1qtdLd++vmgniQBUQsi98yRxUyaxvgrkZwUGjujxAVM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH 2/5] xen/tools: remove usages of `stat -s` in check-endbr.sh
Date: Wed, 11 Feb 2026 11:46:35 +0100
Message-ID: <20260211104638.7938-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260211104638.7938-1-roger.pau@citrix.com>
References: <20260211104638.7938-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0012.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CO1PR03MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: 972d5a60-4c94-4baa-c040-08de695ae153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?akQ0Nm5tUkRTYWdkUnRraDJLa1lmR1cycWhzRnhFK0lISkxMMloxY1RWLzNs?=
 =?utf-8?B?MlczaEtHcUdrSjRqeVlIQ1p2TVUrd3dJcGwxY1R2RHdhSU0yTWpOdVNQS3Q5?=
 =?utf-8?B?Vzc2WVV0dEZHVG03N21FWHo2aFBXRnAzdVlocTlkYTBRRk1veVd0VE1LZTdN?=
 =?utf-8?B?dXdvbmVoYWR4R0h2YzlmeGoxM0xLcHpqanYrbWFvazBUdXJWa1p4QXEzRGpG?=
 =?utf-8?B?M1pycFlUWVZUM0R5cFV1aENkeno0ZVRpTmtxSlQrK1h4SGtybjRRRWZCSkNm?=
 =?utf-8?B?Y3RYT0hmTnNHSW5VSUp1dlhQQUdvalhhWGQvYUR3SGxFZDliOEpwakplYmxT?=
 =?utf-8?B?MXZUK0R2MUFDd2ZIcGxyU0p1V1lkN0FVcS8rc2FZbzRXd2dJS2lCeUt3ZUVQ?=
 =?utf-8?B?L1AyQlhRT1JLNU1FS0RRUTdJMGJPa3lpYjh5REc0eFd4RkJzdlJJMGdXWlpU?=
 =?utf-8?B?d2tsSno5ZXhvdFE4VFdnNzFWREhJRVd0aFhXd25zWFpGdWh5RUNmeHZ4dW9x?=
 =?utf-8?B?NWVtRWtpOVJERDFzQjFGblBGM1NqNWJNUnBWVGh3U2tPMFcwQmhvdFFIakt2?=
 =?utf-8?B?bGJsb3N5NEdibHVWQkVyL2lKcEIrNW5CdUhzUWVDak5PRVhGNlh6QWM2bGk1?=
 =?utf-8?B?endFTHRaTGNFem14MHYxb1Ura3BYa1ppQmhXeFpEeWN5K3dWRzdqVlIxLy9n?=
 =?utf-8?B?Ri8ycDhaTlZIVFI2S3lNQW0rUDdIM1VsMTVOanJhbElSejRNNTRiT3R5dk5y?=
 =?utf-8?B?TzFEUDY1QkpXSmpJRVgzNko5NnF2M01HZndIcU5TRnh1d2ZoLzd1U3NMVFdB?=
 =?utf-8?B?TlJTdDh0YUkzU1RBdjNyR2tid09NNnVsZVN0WTRCT1VuWm1CaE5WSnZxYXBL?=
 =?utf-8?B?cTI0VEhwOG1nQVFJT0J6VEtqVEcwbmYzMjRDK2Y3cVFNRkk0eHczZjJtdzI3?=
 =?utf-8?B?S3RFZTU1d3RFcXhhZENGQUxMZ3BzaTM3MGRaTTdRek1JRXpsRG13MWpPYmlS?=
 =?utf-8?B?eDZOSzVab3NaWlo0a0ZGdllWRUVmSG9CQSs5a3V4bUhZNW5uSVhhc3hzRDdM?=
 =?utf-8?B?TW5EcWNGS0FtbEVMZ0VZMUxKQ1M1SWY2WjRGb2tMMkhER01pOU1weHJURzVU?=
 =?utf-8?B?RGthUEdIZVgrTGp4MFVpZ2dMV3B0VUErSStYSXFVODZEbUppZ1MwTHhBMzlB?=
 =?utf-8?B?Q0NybWlXd3dNTFA5b0xXY3ByMTJjUUpsMXV5RHBpcU9qMVU3YlBYSkNZbmxP?=
 =?utf-8?B?QVlmRGFXb3daelB2RUJmK1pES3RCU0hteEs1NS9kaUp1c0htS2xlS1JiNTdM?=
 =?utf-8?B?aWlBaFpRMDlTOTJjNHozZ2ZQVXJQSFE4Q0pHbWxqL1R0R2FIOVVqd1k1VUxF?=
 =?utf-8?B?a2RyOEJHMVI4dG5HTlB3OG5NVEpYdGE2aWlCN1FaUHV3aTFjSkRyNlZuaVo1?=
 =?utf-8?B?SVp3N2puSFN2aEhDVUxiTjBNZzc2RHJXdmJtS2J4cWJkUmVLOEFTR0NIcHJW?=
 =?utf-8?B?UVlveThEVUR0RDJ6ZHJpSks0T2lUb0d0Vy9KZnhSQUprKzFMYVg3cFFWTGV2?=
 =?utf-8?B?aFpVRGdnZ2FmY3NlZkN4dVo5NFo1UGg1bWNNN0xtbFJzYmFYSFprT1hmc3Mz?=
 =?utf-8?B?anZsUTVBWlhnbUxjaG5lYW5tZUkyUUw4UlIrM1psdEYvbGRva1BuSWVOU3FU?=
 =?utf-8?B?NjQvWjNPMkRRa1ZNOVl4NlpzZ3cyWjFMVnRvbDA3VDVwMHE1L0dHYmtmT0RG?=
 =?utf-8?B?WFNDWHJDNUU1bDBpK2dNTEpvSERVcGRjcUc0eitnNzF1ZnpHdEQ1WURFRTVN?=
 =?utf-8?B?Q1NwcWo1ek9sblhaVy9qWENCdFl2bjhUNTRTT05xWjhDdnorMWhVci92WU8y?=
 =?utf-8?B?bTVXV2E4bjRqSEprS3pTUEZwSzFlakNmeFNIaENxNTIwMzBkblNadUpOZWJD?=
 =?utf-8?B?bGRkRkdtRHVnVmpNTG1yQi9wT3dUTjlld2p5RkwvOWhkS0JNcWYxODBWeVc4?=
 =?utf-8?B?eVVXZnlhNHdyVUxNb3VuTXZlTlY0MEZ0dnl0MEpvZVlzQWlMa05sdGt3ZFE1?=
 =?utf-8?B?S1BPM2xxcTNpNHN1cjk0TDR2VkhzV1VEUm9GTGtSeVpkRmkzRUowU2dhZERU?=
 =?utf-8?Q?koxA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mi9EMisvSWFlTFkzVWQ4YXVoUllHeWlJbVpqREpVVi9OMm9Ydm05b3JRNVMr?=
 =?utf-8?B?YitWWHdVMmNRQWxKQzB4NndHeHJTVXUrd1N4V2lDNUFVVEMrTlFOcU1ycEY1?=
 =?utf-8?B?aUJqV0lzZFMyZ1NTWGpyT09mQ2xaWnV2VVpRTnN6emhqOEtzczV1a2F5N204?=
 =?utf-8?B?SkpWNVNxUDJINU5vc000MVJFdHQzYnZVWGNBSGpnMDJlQzBiVXF5Y1ZETWtW?=
 =?utf-8?B?aVFNTTZLNG14YkY0TGVIN3huS1gvTlpVcS9SZHBPS3F5aHgvQlM1NGN0ckpv?=
 =?utf-8?B?eGFOMDJJSXRjd252d05UY1NxL1VrbHYzVlUyQnVSQ3BkYUl4V29OTTBWNm5U?=
 =?utf-8?B?dDUyc1pSbklQUEw3SjBYL3BuUlNxNGpvZWxyOXdXME9pMDZUMUZJbDBTRjVu?=
 =?utf-8?B?ZmdRU1ViekM5enlNb0FnRkdKY0h2bC9KSE45NW9YdE5uZCtmSnppUm9kVUJW?=
 =?utf-8?B?OWdDUmxSaGdGYkhuYWJTZXIwVVZvL3pWK3YxYmpOb1I3SmlBT1QyM2w2bzNq?=
 =?utf-8?B?T3dYTllUV3dqSkY1dld5eExJL0pQck1hUnRQN0w4RkVUZXNWNkZYaWRxRVp5?=
 =?utf-8?B?Qm1GemU0VEV2MjZzWnBaWDZ2TUtYVE5MS1FKYzJyODRIZ2lJYVZVZ291Umk0?=
 =?utf-8?B?SFRzYkZSdnZFaEVEVVZGZDdMSlJrM0h3VDhPZmRIeDB3UzY2czgyYUNxSWV4?=
 =?utf-8?B?RndMZFlpOGtKaWRXekxMQ1ZIcVJEa21tZ3NrdFhjektQckxEbW1zcXlKQzlw?=
 =?utf-8?B?OEFhclRFd3JTZGZFYzBuNTd5dklLcEN3MDJuOWd4S3JxODdWdWFBcXpNeG8y?=
 =?utf-8?B?cUE5YlJrS2gyVk9kenZyYko4aVpGQkp5MWtRL2JXTW9hT1JNc1dKRWd0bWdq?=
 =?utf-8?B?c2RwQXNsTGJwUVl0b0QvemRnSGdqR0k5dVBxT0duOUkva0d3aVhVRG5WM04r?=
 =?utf-8?B?Q0FDNy9uT0l3SHozYXlIQnBzZlF6M0d2UEUyR3dBdkVPSnZSdmhpMVEzL0JL?=
 =?utf-8?B?TWwrNk9pbkNqSlVvb1VRSWFNT1NSUHpDSk5CaHlCWVZlQzc5eGVOOFZaWHRu?=
 =?utf-8?B?QjlONmdJZzBYd010VGRrbXhXc0lJeGRlWEtwdTFleStMaXpQcGRrb2NDQi83?=
 =?utf-8?B?ZS84VFkxS0NLaXl3UFlDNDMrT0F6ZDgvb3d3R0x4Y25na3Z5NFJoYzkzVkMx?=
 =?utf-8?B?WXkxTnVJd2JnVnBJMmhFSlhGanR6TSsxbVhjQkswNWtzWGhWcTMzM0lIQUow?=
 =?utf-8?B?R0x0WXQ5YnpGYTRSOHFTV2txdjV5OW5ONHhITDNLWHl1V2pyMjhqVWFIMUVM?=
 =?utf-8?B?QzhoVnlmOHNoWGVsNW5XWFFJOUVuZ0lQTWNRV3U5a2FTTUo0RXdvL0xTTWJ3?=
 =?utf-8?B?aEJBYWJRN3o2V1IxcWRZNEhCeWRhMTB1b0c1WG1Xd0hXY3FIMkNHd3gzMVlK?=
 =?utf-8?B?a1pWUklUZVVZaEEvR3g0WFljc1hNbmdKQkZMRlZlUEVQT3BjL0QzUkFuWEt5?=
 =?utf-8?B?Z1lJSVN0cHEzbE9FbmFWMnJEUlhtVC9La0xYOHZFMEpJZWZBQzJvMFY3a3pT?=
 =?utf-8?B?TS9WY2NkSVFTeDIzdjY3Tk5FM3ZFTkVlMitIVDJ6cUhRdGFINnE1YkdWN0tn?=
 =?utf-8?B?SXhBbXBTSzNJYU5MUTR1MnJzWnFsWm04STZmZjdpd3VIc3l6TnFUL0ZsaUNR?=
 =?utf-8?B?T1lMd0ppcDRkUnN1bjdsRzk2b2xKblZYVGZBMWx6Y0gvakxUREVaNWxPaFor?=
 =?utf-8?B?MXp1SjF3NDlFdGE3eFlOOEk3V1lKTGR5NElvK3Nka2tIQWI5b2FvdHBaVndZ?=
 =?utf-8?B?UjdLcDlRVzhjblI0VVhjcXJMR0ZwdEN0Rzk3TGhBTFZtbm1uMkpPblhZQUZR?=
 =?utf-8?B?MnV4c2owSnlMdTU0bFVwdnNTNmNKVmVVTDhlL0gwWVV4bnYyRXIrU2FnVmZv?=
 =?utf-8?B?ai94V2hBUTF6RmwyK0JTM2VIZmd4QytkdW02SzlYY3FCWFBlUjJ1bWJwQWdt?=
 =?utf-8?B?S1BucDRNOHo0K29mUnZvRzNxODQ0UnhUbUtBZ0lJMDVNRDN6SWFocW1mSTJY?=
 =?utf-8?B?YlJHc3czM1lmaE81OXNqNE9iU1lMZENWNmowKzlFZ3UrMG1XcG1xRUUwenRR?=
 =?utf-8?B?c1pTRy9laWtYWUpvVnMvekVST0ViajJEUzI3TmFScy9DaldnTDAxdmlYcUJU?=
 =?utf-8?B?NlZmbE9meTdIdDlER3FhZmwxVThMeHVESDd2NXFDMDNrdTIyUUkzRW40aVdO?=
 =?utf-8?B?MFNDL2ZwcklQQ05aZnkyZUZERVVWN2dpSnhtY085eGZUY0wydFY5bXN5aC90?=
 =?utf-8?B?NUNxRTdvTUJNQWNnWVJWRmR6WVc3U0g3OEZpUnl2WmNjZzJjL3RmQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 972d5a60-4c94-4baa-c040-08de695ae153
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:46:58.3182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5K8XwMACnLp51K79Bn2drxezldmE/+Mt3Hee7GBmavc6KD1X3VXJacGt+bO4TePfJYm4UODq5aocgVWSfHgiXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7844
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E7521123921
X-Rspamd-Action: no action

The `-s` option to stat is not POSIX compatible, and hence prevents the
check-endbr.sh script from running reliably.

The first instance of `stat -s` can be removed by fetching the section size
from the output of objdump itself, which the script already parses to get
the VMA values.

The other two instances can be replaced by counting the lines in the
respective files.  Those files contain list of addresses, so the size in
bytes is not strictly needed, we can count the number of lines instead.

Suggested-by: Bertrand Marquis <bertrand.marquis@arm.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/tools/check-endbr.sh | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/xen/tools/check-endbr.sh b/xen/tools/check-endbr.sh
index bf153a570db4..383d7e710a53 100755
--- a/xen/tools/check-endbr.sh
+++ b/xen/tools/check-endbr.sh
@@ -92,14 +92,15 @@ ${OBJDUMP} -j .text $1 -d -w | grep '	endbr64 *$' | cut -f 1 -d ':' > $VALID &
 #    check nevertheless.
 #
 eval $(${OBJDUMP} -j .text $1 -h |
-    $AWK '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1, 9), substr($4, 10, 16)}')
+    $AWK '$2 == ".text" {printf "bin_sz=%s\nvma_hi=%s\nvma_lo=%s\n", "0x" $3, substr($4, 1, 9), substr($4, 10, 16)}')
 
-${OBJCOPY} -j .text $1 -O binary $TEXT_BIN
-
-bin_sz=$(stat -c '%s' $TEXT_BIN)
+# Convert objdump hex reported .text size to decimal
+bin_sz=$(printf %u $bin_sz)
 [ "$bin_sz" -ge $(((1 << 28) - $vma_lo)) ] &&
     { echo "$MSG_PFX Error: .text offsets must not exceed 256M" >&2; exit 1; }
 
+${OBJCOPY} -j .text $1 -O binary $TEXT_BIN
+
 # instruction:    hex:           oct:
 # endbr64         f3 0f 1e fa    363 017 036 372
 # endbr32         f3 0f 1e fb    363 017 036 373
@@ -116,8 +117,8 @@ fi | $AWK -F':' '{printf "%s%07x\n", "'$vma_hi'", int('$((0x$vma_lo))') + $1}' >
 wait
 
 # Sanity check $VALID and $ALL, in case the string parsing bitrots
-val_sz=$(stat -c '%s' $VALID)
-all_sz=$(stat -c '%s' $ALL)
+val_sz=$(wc -l < $VALID)
+all_sz=$(wc -l < $ALL)
 [ "$val_sz" -eq 0 ]         && { echo "$MSG_PFX Error: Empty valid-addrs" >&2; exit 1; }
 [ "$all_sz" -eq 0 ]         && { echo "$MSG_PFX Error: Empty all-addrs" >&2; exit 1; }
 [ "$all_sz" -lt "$val_sz" ] && { echo "$MSG_PFX Error: More valid-addrs than all-addrs" >&2; exit 1; }
-- 
2.51.0


