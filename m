Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EG0WKxLYkmnKywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 09:40:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EE3141A1A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 09:40:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233755.1537104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vru9T-0001v0-Vy; Mon, 16 Feb 2026 08:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233755.1537104; Mon, 16 Feb 2026 08:40:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vru9T-0001sV-TE; Mon, 16 Feb 2026 08:40:19 +0000
Received: by outflank-mailman (input) for mailman id 1233755;
 Mon, 16 Feb 2026 08:40:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sAgz=AU=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vru9S-0001sP-AY
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 08:40:18 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b177b78-0b13-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 09:40:12 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS7PR03MB5382.namprd03.prod.outlook.com (2603:10b6:5:2c7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Mon, 16 Feb
 2026 08:40:09 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 08:40:09 +0000
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
X-Inumbo-ID: 1b177b78-0b13-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJHQ4hwXAW5EsZWK54oIf6EZxZDAMeVt3eHqt7vX1WGGffQwa0qfA3/c64TfyxNun1e7JggPSl4pa1FTzn7UBZhWva6XYURPhZ+BW66wd8WzwYlYfd98t5YndwzwcijUH3XbF3sU3k0OF5ya5oUbwiiRJHtUVXLB+bLJgpzrAlNNhQB1HWl3mVGy7I87VtNRMc9Kj28ZwgqBpjiIu+IDt+O6hOSwfs7hSe/kQrfa8I4vVfAGE63BNB70akhvaJRhmleoUJTB1qBGLwPReB2cROTuD7EjchXNWfKJdkAomLDcbvSdLZv2VQVppi9Xu9ZQEkuRIoleA4oYTfSME9J6sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQ5gOKqOiwslbfWoKGVpK2q6gZHCh6dhlJIQZ0WpYxk=;
 b=XvErII5kzGFjUX3AyP30WUhpthZbzpMxxmIuqyH+qdpfZnesUC9Vth6gT0DRKLfO/9z7w6LTG1bX2scrQTM8AjyIY3bi4lnIIhfufdcVF089apNCz/2T6z4LXFY4SF+1KFbbLVZ/Fee2nDa7TEvgb+4iHWSWhbRX2Xn61gYWpo8e9R5cBGbzJYjMkSjxi/hzN/ruyvrKD1MT6OE6bxEgj10da4OvGvSbHIUwELmHkiJWQY/hZ55iPm4xE95tXh0f9oMQJjYHsUDIuMSD6RXsxDvCu7wi88r5Rug367q7xAgw1hlsaqGDtqdy69JAeuX+isYeKCkt7IoyXx/xZfYufA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQ5gOKqOiwslbfWoKGVpK2q6gZHCh6dhlJIQZ0WpYxk=;
 b=Df+nZ31bu8SXpYIqhu2zXsIbs32bbjP3NZ5nWfE+MoCfQJxUIdhPdXWpW/GnvQzECwCokkcKq4VffjXzFRDOs/l6cKoZBwndGe8NdvwsP0MBZ4JnZ0zdLtzoSzKrl8MYqIbPt/gLhUbSeffIlA7cVYAv7VKFaqfgwbzePesSs9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 16 Feb 2026 09:40:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: Cannot boot PVH dom0 with big initrd
Message-ID: <aZLX5R_rO9EOUr_m@Mac.lan>
References: <aY6iVr990vWeO2p5@mail-itl>
 <440f94be-77c0-4b28-b107-6efc3623a92f@suse.com>
 <aY9Jt1-jCWhStcxB@Mac.lan>
 <42b32172-9e28-40c1-a83c-ba37e17f5480@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42b32172-9e28-40c1-a83c-ba37e17f5480@suse.com>
X-ClientProxiedBy: MA3P292CA0046.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS7PR03MB5382:EE_
X-MS-Office365-Filtering-Correlation-Id: 31c1467f-3d6c-44a1-9825-08de6d36fdbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V3U2L3oyblNkSlZaaWtmd3J0MUFSbXpnRlJyYkhXSkk4SnVDMEdNT21tYTJl?=
 =?utf-8?B?cjlmQks0azlzN3RVY1ZWcmMyYzVrdFA0LzlOSHBIZ2dlNncraWtIMUNTdUVy?=
 =?utf-8?B?d1R4MlhSLzlaTlFJV1FWeWtDRVJpTTRnZk1LTVkvdUVtbUdKRDFxOWVQcDNt?=
 =?utf-8?B?UVZBamJuUzdDM2hndzF4Vnc1N3F2YnFBSEdVMTc1V1ltODhSYzdxRGdaRisx?=
 =?utf-8?B?UmphYmZQZHl2Nit4RkhjWEVjYjdyRWtmZzBCaC9LbDBoUzhxNFc5L2o3dmpG?=
 =?utf-8?B?NmhHYUg2TjlwdmhiMS9ZNHhGK0hPVkg0SW5nMysyMm9aNVh1S1lZMS85YWQ1?=
 =?utf-8?B?K2V5TDBENVpUNVlHcGpoZ3Brd0tHZStMYjhDdFJPbXdoVkVoQndwZDcyVEVu?=
 =?utf-8?B?Q2NUcDM3a1RkV0NkV21zci9TRHB1OTN3YjhkQ1VNTG5xNy9NZWtvRjRqY0VS?=
 =?utf-8?B?dkI5UVdGVmI4SU1zVmhEbHNma0J3L0NFU2dYUmNqVjE5b3F6ejR3K2lhclVK?=
 =?utf-8?B?TzNRdVpSaWY1cVBmNzU3Tkg4SlVBVXJxUFBmVUUveXNVS2NxMi9td2pPMTZC?=
 =?utf-8?B?ZExLVnp3Z2pkV2FlaEs0OHRpam5IWXhVUEJXK2JBaXk1Lzl5Q3FBbXA1MmJ5?=
 =?utf-8?B?NEplMjd0UFlNaFZsRGtpeHJ3Sy8wcXo5L2xGU0RyZ0g3bzJGWjFBSWR2b2Fu?=
 =?utf-8?B?MkVnUEh5aWNyMWV5cHdJczgvZnM2YWJJcmJVTzlkelFiTCtiNjcrUlhKMG12?=
 =?utf-8?B?b1RySEVSTWh3ekVKZFZjUWlwaGx1aGtya2RFRG4vWTlLSDJWS0J3VzN1N2NM?=
 =?utf-8?B?OWdpcUFOckhMTTB0VFAxNnRNZVdMeG00bmpsZjNsVEdYcVZkRTVJR056SjZD?=
 =?utf-8?B?cVB6Znh5SlNpQUt3UzN4a0ZtY2xUL0c5bWVuU0VpYzFkWmE1SEtmd0RLWnd2?=
 =?utf-8?B?QnhMNkxQT1ZwZ2tPMXVKbGlhaHUzc0xsb1hGSjZWaXlBREhYM0UvUkxXbDJV?=
 =?utf-8?B?WEEzNHNNUW8zVUhHamZCeXNVRkM3OFlCL2VrdGFiOUlVQWEwc3lMV2g5SDdp?=
 =?utf-8?B?c01uWE9KWXFyME5hcE1CeFUyRTRIalVMK1lQeXJhMk53VWoxY3RYcjZiTGN5?=
 =?utf-8?B?SWNLNGdwYmo3YUxiRHZXQXYwemlySEo0SkxINUtqMkc3VEZZTkx6dE1Pem9G?=
 =?utf-8?B?dVhRZ1hlaWVENThSN0pYcE5NZVpUcTBiQTJKcEhkbFdld2lkVDEvY3BzcG9Q?=
 =?utf-8?B?cVFQd3U1T1AxbSt2Vm5PQVFvTTl3WU5icXpBN2FtdTFuSzV1bWpUNzlxMmZY?=
 =?utf-8?B?Rmg0RU1IWk5YYUxDME42Ynd3OUxSUWgwYytXS1FuWHJnT0ZsZ3FtTEQzM2k0?=
 =?utf-8?B?emNMdzhhSXdvN2dlRkNjcXpWbG1scm5OV1JsTlQ2VFUrT00zdHBkeXZnZGhv?=
 =?utf-8?B?S0x2NmxuTi93T3o1b0VVRkhmUlFHbmVpZURJdFZJOGJSR3FvRWNNTllUTml5?=
 =?utf-8?B?elozMWNJRkZVT0ZWWTF4NERMTjVoQXBCTEhzeXd4dHV4VXVHeENrUEFHOE9t?=
 =?utf-8?B?cm1ZNDUyWjVmU3dSRUJCWk5XKzg0VW5RNExOc1lvVlQ5N1R3aUVXWlhUbzdR?=
 =?utf-8?B?aDd2Q1hJbEdHRFVBSVhUU2hPVXlzYmpRbW5UOEdvelN4cGdOaVRGUmRvS25p?=
 =?utf-8?B?TW4vYTFvdjl1QkozL3IzS3BLaDA5R2kwTmNhWFZKanhBcVZ6cmZlTHBiVnpa?=
 =?utf-8?B?ckFEcktsaHZmYVpRbHZaRk8wbFhmUStRZXIwRUZqR2RoaWZkSy9qTlBjckhr?=
 =?utf-8?B?MjRxbGE0VWJDbFpaRG9HcmJRdnhVVEdhNE1QcDdMb0ZOcDNncXJ4NWpjcDNE?=
 =?utf-8?B?VmlKbm13UU9iTmQwNHBydzRPYmkyaHFmTS9GZlZNNUZjVmNDVnExS0x2T0th?=
 =?utf-8?B?US9jVnBGZkgzayt2Qk9tOFRUTW96bVIwZmV6eVVWZnpYQVNSZ2oxQUNocU1a?=
 =?utf-8?B?RVl0WmtpMHN3WW5VWTUzYzhwWHQ0VXg5MzhBNWtnWGdrTDhNMkwwSmE5VFli?=
 =?utf-8?Q?GbIDZU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2VDRGhtaWsyM1hZb05PbFBXOVF0bzNVQ0tNVEdpRUpLbHRqT29XbDlaR1dh?=
 =?utf-8?B?RXF5Z1hxV3Y4N0RCWlQ0b0tsRWtFTXBPa01PVmQvUVJ6cFNoNDJja3ZXS1Zu?=
 =?utf-8?B?ejRvSVdVdk9YL3BrTTFxcXJqRndLenM0OHdKeng0OXhOTFdYei9oWmNEaUxa?=
 =?utf-8?B?N3ZRSjNxc3ZTRU11bS9NNW1Jb2E5Y3JjWEFKbmd2Uk5xTmU1N1FKQXl2VDNB?=
 =?utf-8?B?UkI2T1JmTndyL2hpVllERUluUWIyZURDbkhBdmFqR0greWV5UVh6eFJZWW1B?=
 =?utf-8?B?bHBscUF6RkI0NmoyS1VRbVlFZ05EZVdmQ1RjRE1JcGd5UnphZnN3VnR1SjBz?=
 =?utf-8?B?Z0RXcVlEdXp1OVErVFByT2JYYldpczVibEFzNXhEWjRnNzN6RXdtMTBYK3Bq?=
 =?utf-8?B?TGRzMEJ5czVXYXk1aXlDTXIrN2x4YkQrTmRlQlNxT2xidUlnaUU1eDhFbTc1?=
 =?utf-8?B?eUdrdFgyS1cxWkFYQ0FxRUpBTlJYRWRNNHpKL1lGQUM5NStmMThlUWg3eklO?=
 =?utf-8?B?QkoxTmQ5emxGM01sSXpvYUJxdnF0Q3ltQ2wrS1FyNTZZSk5GK3dBVHpISmVU?=
 =?utf-8?B?V0dDdTRNSkNZQXNaNEhjNHFPVGtmeDJaRzZZbXhnWnJNcXdOc2Z6a2NCc2xi?=
 =?utf-8?B?SDdXMmFlMU9UL1haNmhWZytEckQxMXB1SnpSR1lDMWVCVVRma2lac2x6TkFY?=
 =?utf-8?B?YXlVWEZPKzhtVzcxUzBjWHBIckNwZkdOWG40QTJyWi9EVWxsYyszOUJ0OEZo?=
 =?utf-8?B?Nm1XbVFQL1MyYTJyam52SkQxWGNGeGZiOHcyNi8yaUh0OGVCc1lKY0JreXFR?=
 =?utf-8?B?dDJ3a0VrbWswVXNGWGh0SkIzSEJJdlgrWjIzTGY5d3VwRWJKQThJb2xUeTZN?=
 =?utf-8?B?STlxYVE2VXpiYzVPZFpkNzNVcnRFZG1TUlpxUjVwZzdBMnFzbDUxWnpFU3pi?=
 =?utf-8?B?Qm9aYnBrMm43cUtnTW9KOU13aS8vZzlQZ2xBR3RTMWZjd21BazlBeWtpK1VK?=
 =?utf-8?B?RDU2cmsxaWJGYUdjUnI5RnhGZGs1c1VaSXlQMTluTkw5azdJWU02STM5bmly?=
 =?utf-8?B?bUtuZjNTYSt0S0l3MWFEMWo1QjBMMXlRVWpDSW8vMTArN2tLazZsSVVnUU5U?=
 =?utf-8?B?eXJiemh0WmNBV2h1Smo5NFdHYVZ2NitkYTNwa3o4c3BlQ2drVzgzb1pLZXVS?=
 =?utf-8?B?SzI5eEkxNDhTUVRYZEUxN282VlZSUndQQS9uRXpLQmdWbHJtMUVydnhsNlE0?=
 =?utf-8?B?NG5LYS9YallpNHZyRGpYRUpwQ01veWpVYjlaWFZNMEgwN05wcjZ2ZnBEbUpL?=
 =?utf-8?B?RUluVUtobUFIZHd0MldWbC9YTkZLQnV0K0cyUHFlWmlaNGJVYUVMNzF4YWVv?=
 =?utf-8?B?M1pUb3BpbXovN1hiTitRNWdwVU5KREJ0YlhqV0NYOWtZRHpLdmo0UGJpUEZm?=
 =?utf-8?B?KzNnbW9rN0FNQk5kd3BGVmR6allDK01VR3E0MEdITXYvSDBMd2xEY3kxMGc2?=
 =?utf-8?B?SlR3aDBqbENjYzdvSGhKRStyQTZyalZWVWpjWE5EV3hHY1ZzbmFTYWxudXE4?=
 =?utf-8?B?TE5mdjVrTUJVSWlTTm5qWDF2OC85Yng4OFdka01rRXVUNG40ZkMveXVvZ3Qr?=
 =?utf-8?B?b1R2NHRUbkNRWi9FWVN4amtYVzF0NHF6N2l5b2RFSm8wQVo2VS9kTXE0aElw?=
 =?utf-8?B?SHNUVXhVNGJpMXQydzY1d20ySXdYY20wQVE0WEhzdm81LzI4WFdoNW9oQ2Ni?=
 =?utf-8?B?MVpzUVJabEs2TTY0MHJmZkFUblk5ekR1M1JDLzRsd2o3MVhRc3lzbEFGVTV6?=
 =?utf-8?B?akdpVWhaeXBQMXJIWWg0MWRCMWdyNDJPTSt4eHNTd2pPYkNTWmNrcmY3TnhJ?=
 =?utf-8?B?SXhIL1FuTnArekdUMW4vMFNidWlVZ3duNS9VUGVVTTNxT05sZjR0MTB6K09N?=
 =?utf-8?B?M3IrOExnRk82alZuTjhDcGhwelhkNnVLSkxMNjB2Vmp2eHVabzUzSkk1MVFu?=
 =?utf-8?B?MjhmVzI5TFNqN2dEYmdOSXVMWnRZMmw1bHZEYjRtdVdMRWcvTElUQ1NPUEU3?=
 =?utf-8?B?cGN0dzhNdVBrSDhTUURIWHlYWkNhclNJVTR3alNFejhDWHJlS1A1TE9ydnBu?=
 =?utf-8?B?YmE5NFpUY3l3bGFBdnptK1RuVkYxaEZtNmppVVh4ZWVGQ0NtSzdabmRobzBX?=
 =?utf-8?B?SVN1OHNMMWtNdys3UXRaaldNSkdGcytxb01IN1VtUHEyM2tESWZJa0Vjdjcz?=
 =?utf-8?B?YnpQeTRnblA2MjhidHcyeU9DNW5ySmhkOWlkZmFUTWtOamQwU3NOS0Y1R0Z3?=
 =?utf-8?B?blB1YlVqNXh4UzhQTlhFSmR1aXJaQUFzWFRtejd6T0xIdmIrSjd5UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31c1467f-3d6c-44a1-9825-08de6d36fdbd
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 08:40:08.9298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4UkZ3w3ljY3IVDgDVQ2aLqn+mLYCDPtB8AQr+JdwfOZIzAj9VkVaCki2rMPaCcPWPIv0cHj24MxH9qjy67SA6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5382
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F1EE3141A1A
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 09:11:29AM +0100, Jan Beulich wrote:
> On 13.02.2026 16:56, Roger Pau Monné wrote:
> > On Fri, Feb 13, 2026 at 09:56:42AM +0100, Jan Beulich wrote:
> >> On 13.02.2026 05:02, Marek Marczykowski-Górecki wrote:
> >>> Hi,
> >>>
> >>> After fixing the xhci crash, I hit another issue - booting with 236MB
> >>> initrd doesn't work, I get:
> >>>
> >>>     (XEN) [    3.151856] *** Building a PVH Dom0 ***
> >>>     ...
> >>>     (XEN) [    3.593940] Unable to allocate memory with order 0!
> >>>     (XEN) [    3.597110] Failed to setup Dom0 physical memory map
> >>>     (XEN) [    3.599884] 
> >>>     (XEN) [    3.602482] ****************************************
> >>>     (XEN) [    3.605272] Panic on CPU 0:
> >>>     (XEN) [    3.607928] Could not construct d0
> >>>     (XEN) [    3.610692] ****************************************
> >>>     (XEN) [    3.613463] 
> >>>     (XEN) [    3.616035] Reboot in five seconds...
> >>>     (XEN) [    8.626565] Resetting with ACPI MEMORY or I/O RESET_REG.
> >>>
> >>> Full console log: https://gist.github.com/marmarek/c9dbc87bf07b76f2899781755762f565
> >>>
> >>> If I skip initrd, then it boots just fine (but dom0 is not happy about
> >>> that). 164MB initrd failed too, but 13MB started ok.
> >>> Just in case, I tried skipping XHCI console, but it didn't change
> >>> anything.
> >>>
> >>> Host has 16GB of memory, and there is no dom0_mem= parameter. Xen is
> >>> started from GRUB, using MB2+EFI.
> >>
> >> Hmm, yes, there's an ordering issue: Of course we free initrd space (as used
> >> for passing from the boot loader to Xen) only after copying to the designated
> >> guest area. Yet dom0_compute_nr_pages(), intentionally, includes the space in
> >> its calculation (adding initial_images_nrpages()'s return value). PV Dom0
> >> isn't affected because to load huge initrd there, the kernel has to request
> >> the initrd to not be mapped into the initial allocation.
> > 
> > Right, on PV dom0 we do not copy the image to a new set of pages, we
> > simply assign the pages where the initrd resides to the domain.  We
> > can't populate those pages in the p2m as-is, otherwise we would
> > shatter super pages.
> > 
> > I think the fix below should do it, it's likely the best we can do.
> 
> That's at best a workaround imo. We definitely can do better, and the bigger
> the initrd, the more important it may be that we actually do.

See the second patch I gave to Marek.  That one is slightly better by
accounting for the initial images space as part of the reserved space.

> One option may
> be to similarly use the pages directly (i.e. by assigning rather than
> copying), accepting that we may not be able to use large page mappings then
> for the respective GFN range.

Hm, there's always going to be a trade-off.  I think I would prefer
having 1G pages in the p2m, rather than a bit more memory due to
direct adding the initrd into the p2m.

Thanks, Roger.

