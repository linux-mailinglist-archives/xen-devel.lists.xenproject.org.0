Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDqcOnP2cWmvZwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 11:05:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAA064FAC
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 11:05:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210688.1522311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1virZ7-00077J-Ua; Thu, 22 Jan 2026 10:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210688.1522311; Thu, 22 Jan 2026 10:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1virZ7-00075b-Qe; Thu, 22 Jan 2026 10:05:25 +0000
Received: by outflank-mailman (input) for mailman id 1210688;
 Thu, 22 Jan 2026 10:05:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paBm=73=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1virZ6-00075V-Ld
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 10:05:24 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd3fcd8a-f779-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 11:05:23 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6502.namprd03.prod.outlook.com (2603:10b6:a03:38e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 10:05:15 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 10:05:14 +0000
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
X-Inumbo-ID: dd3fcd8a-f779-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXXw03V9QtBm0dB5stzl0iVhWiz19MQmGmfxhHZFNDjVBzGl/OQZfFrUkyJzu5IruLMgrgatnwwCXFE3LPsss0Puk9+loxnTQzJcpmap7zDp8L5Pb37ZNZLNIgbF3oNauhS3rF5s7zMpOocdfGbP3oacHRTP13cFTiZqx5ftJUWxZd10rzIbiv2M0yfbalcoCbnrS04ZAfhAecLdYFRp3vyIC8BVRam+0yn679RQZ5ikRKlEw7D6Kq24Ow1Bcf5+akiFlEwA2MuAkQhkqw91TW6VOPTwwPCUIUpDe652Jx8W48LHa14R1irz1yupj8pp/ZNH5PSeCijrN5IuX55v1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2P0OrTzrEB8z8isqkI+y7pRtgtDM55aReYKK6wcLRyw=;
 b=sleFYB/lvV0XXcoshUYj+7jkaosrcK8nWyzLekr0kEtUDpw8yLbjcNBbVK4KVtHopO4pkGAipKbQtrd12Z1ONZFYwE1uxVtW8TebjWSLRp7YRDH40MS+xfqaci4R75k+XOTOWrj75wjJljU+6sWgGusXtPaoT8+4LEf7p4H3rJiu4oS2nicV9xJGLru+lw86uIpvA4ckpLmGOeevBos1idXRCAH3fXvonq7x9LyLVXAbNFFezbJHePw/Ed0/iudmn/b+veFNpnamdEoM8nlfX+YPG3082FeqLVnmLUcCloa82UBRw+Z8bDxXCUR3RDfXKce6nVeyVS+fx1OW+4skmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2P0OrTzrEB8z8isqkI+y7pRtgtDM55aReYKK6wcLRyw=;
 b=PV1/C4NEQr3JhfVErujSIcyhpVxXMbDNoZuYA8oGvjQE0Q8jBZuRl2KiX+1Tgf/7ZD5j7zKvK/IF0fubz+VVzGXoy6MsVVtLAgFuw8m2A8iDBRuhEOvMLNPkX+HoIX5e2L77KFGPebQ/IJNm8WIz3o3Vtl6XJlVGet1vDAs8KD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 22 Jan 2026 11:05:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 7/8] x86/HPET: drop .set_affinity hook
Message-ID: <aXH2VGI_gtiAKfF9@Mac.lan>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
 <5e09670f-dd80-4dfe-a8d6-182545b744ee@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e09670f-dd80-4dfe-a8d6-182545b744ee@suse.com>
X-ClientProxiedBy: PA7P264CA0076.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:349::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6502:EE_
X-MS-Office365-Filtering-Correlation-Id: 8185b18e-8351-4847-5f3a-08de599dbcd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QW9EOFhCM0hFQldhQS85YkVSK3dJcjMrajhZbCtmUDgybXhUNEFEMHNpTmVJ?=
 =?utf-8?B?ajZSaEorVlFvWjVWWmVlNXFIR0tYcnhrNGpyQVptY0F1YklyL2Juby9jaVN4?=
 =?utf-8?B?bG55Y3FmRlVOTGFzaXJQMVEwM28xRVdqekpxNkRQSjgwdU0zczVWNkRzTEJZ?=
 =?utf-8?B?b1ZXV3FOdnZ3T204RGM2NzNsdUEyMDdoZ21COXJhSWQ1dnFFN1QxeXpOL0Nl?=
 =?utf-8?B?NXkvUUUyNThPbGMxelRHeUFLbEg4VlpMamdZNWVMMTk1MFRtSnVNaEJ0WWZk?=
 =?utf-8?B?ekhRMllrK0Z1S1BRWUtUcFlNYnoreDVtODN1TFZUR2x5Nzg2aVdCTlI3ejFv?=
 =?utf-8?B?NEx6SUd5cC9qUEFWanRVQ004aktTRnZPM0h0emdGb082YytCeTJudmFVVCtJ?=
 =?utf-8?B?RGZtT1h3SXk2T0QrN1ZyMTdLK2oxdjZrQlpMbzhPT01pcG9jU1F6OGduZUg4?=
 =?utf-8?B?NmRhbkwwb2ZOUElLdElTTy9lSTM0VWczVVVlNTBhMzdwTm9QSG02VnY4YnQx?=
 =?utf-8?B?NTJzVWI0U0xJVDBuL1NiOWtMcDJLcG93ZUR0b00rM2lVY0crV0p1NGdhNDln?=
 =?utf-8?B?aWtqWGJVNVJ6WnJPaXZuOXlyVzVCUWp2VDE2eWFrZmpWLzJvY2g3OFpHeE45?=
 =?utf-8?B?QXZxclE3WkQzcHFBTSsyMmlUYUhJUHdKS3ZpU1JYZ2tXRFdPdkNYWi9Wd1I2?=
 =?utf-8?B?VXZ5V1FMOTNxcFZrNjFtKzhlL1RnbWN2WDFzTklCQTdKQ2taMTB5dkdLZm9E?=
 =?utf-8?B?WFY0SzlxRHo2SVBGdFcwWnBSM253U1lhd0Uybk5uaFUvd0JBelhra1JYMXkx?=
 =?utf-8?B?aE1JOEhJcVYyditGQittK1dOSk85MTQwWUZBMjBiU0h2dHU0L2tqMkdod1Vp?=
 =?utf-8?B?V21jeStZWHZ5MktMaVdzbmRMbzBHZXlWR3hlSFhCOTNLSWFLQXd3b0Zib3Bj?=
 =?utf-8?B?YXk5UUdTcndMendwYW90TEt2VUI4d1RnSnZ4S25PYXpLaWloZHdMeHRmY3NK?=
 =?utf-8?B?czdTeHU2UHExaVIzalNrMWRHZ3BGTWZBemxBZWZGZlJCWDNLZk5sblY0Ylhr?=
 =?utf-8?B?UE1lZ1lqOEJEQXZaWklmYlRKTFNaL2QySlcrNk4vMFQ5TzJob2VJNkpLWkc3?=
 =?utf-8?B?aGV2aEI2ZTAvS1UyWDc0VmpoVkhmdlEyV1hPQjlmWklYaG5nZmVEMHRhUEpw?=
 =?utf-8?B?cW9wWko0bnBJa0d2WiszQmFKQ0RmNEhQR1RzalJzY21QVU9EQlIxVnZJUVhR?=
 =?utf-8?B?SW5yRWFGNmJXWUJocTNnZlFFRVdRVHlrbFRHUDgxM1drMEFFQXRKOGdjdERN?=
 =?utf-8?B?SVp2RHFreUE4dmpDUU1neWRzb0JtemVuVzR2a2NPOTRodi9nWWhpdzd0SnRi?=
 =?utf-8?B?ZUZvSUQyLy93SDQ2UWc5ZHZ1RkUzUUJra21aazU5WGhkOWRQTHVRekFGRVFW?=
 =?utf-8?B?STJaV2ZvSmtHc0FYOVg3allEOUJKckQ4b3JEcUtCdlFFMERyM0RvSGhFRytu?=
 =?utf-8?B?cGpYcFMrWk1lWUhSUGJEaG9RUWNDMlprMDRHaUljZXU1eFRweVBxbWFINWN6?=
 =?utf-8?B?RWphYVg1d0JYS2F5NFZGVVpuVVlaT2VFSy9mVy96UURkZ2Z4b2JOMGxwejVa?=
 =?utf-8?B?SnlKRjFuV1B3UWRoTXBEbDM3NTZMcVFwM2RPd3h0VVpUS21pZFlnMkl0Y3p4?=
 =?utf-8?B?aGVsMzMwdm1WQXdBVkZoTWV1bnpnbEJZb1F4V1lHcUNRMVhxOE5NWUx4Nzll?=
 =?utf-8?B?RHJvWnJ2Z21jUExzUVNmM0M1U3B4MHBKT3crbWhRNUJPVWREZGhpK3J5S0Jn?=
 =?utf-8?B?bXpZcXUxVXJ1UEIra0Q2TFo1Mmd3R2NCcGsraUZvbHlEcUlaeHB2Qy85RWhN?=
 =?utf-8?B?Q3JjcXp3L2x6MzNZVzdwNzNGZGVScGcyRTVnSVVpK2k2V1VRbDFnenNBTkJS?=
 =?utf-8?B?azBldlZSWVlKU1RxbjFITi9nOFFuR2hHOHFFWHhRM0FQNERvdTJOdCtkT1F1?=
 =?utf-8?B?NnJVVVhSV0dyZjFXOTQ3ZDNRZnA3ZDI0dEU4eUJ0cmVKTmpSdDJKWHRpWE9Z?=
 =?utf-8?B?T3kwVDc3U1hJN0lrSTRlNThCVnI5a2NXSXprbzRaNkRjdFE0NnlDV1VrLzZw?=
 =?utf-8?Q?Nna8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ai9obUNsaTVIR3ZRcVV6REdEd09NOU9YWTBnbWk0VzE0NlZIYm41YlBsek9T?=
 =?utf-8?B?K0JuV3lIWVRTT1NNZk85NUtjRzAzWGpyZFFsR3NvUFU3ZG13ajFrRVk4ZXpw?=
 =?utf-8?B?bmhQRTRJZkVDMzlsenBTR1dUZFphRURJZzNyRk5VVnk1QzJTZzVLVVdZaXVM?=
 =?utf-8?B?Q1dzTUVsZ1lYM2JJZ1RsZmVFd2RUM3lFQ0FPcFVDWWtPR0RZeTg2cmkxbCti?=
 =?utf-8?B?bU84MExwb0JQT293OUlIMzJmelVSNEtUVXpuMTBYcXBKYTMvZFVCMTBhdUM3?=
 =?utf-8?B?MmtOdFRQYnd3Uzh0ZzExamRIRzdFWWI0YjJLWWhrV2l4UFVGSUd4N3R4Nm93?=
 =?utf-8?B?cUUza213RUVxVkt2L0JTRWFXYVFUL3JBbzVadXI5RmNPSWFwSlgyTXdIVk9D?=
 =?utf-8?B?THRnTEM0WmpRNGJPelVTODdkcHo2RzZzYnUzODNxYmJETU5VVXh4Q21GRlBj?=
 =?utf-8?B?NkdrcjdLTEZQbDl0eGJjT2hBdml4MTZTN1MrcFA5R2JlYTZ2c0RxaldFVkgz?=
 =?utf-8?B?V3BRbmR4ZjNhcTNaWWRJQ1ViT0FGMkhMREczWU5xbTZzMjZ0U2p0NkxTUFZx?=
 =?utf-8?B?ZjF4R2t0bHl3alpNU1ZYbml2SXlzYk41bjR0bkhoUUZ0eXg0SnBreE1OOTlN?=
 =?utf-8?B?alRzOUhKcEV1eVNqODdYSDNBYmJJcTBKNXlCeERNTEw4RE5OeXFHdkx4c2lO?=
 =?utf-8?B?b2htb2EzZXBEVFJCLy9Tc3k4bmp0NEFmVVY3MUNUV3c4ZUpCRWJqVUtKalVD?=
 =?utf-8?B?RnFncUZuRzR6WWNyc0JyWk5hVTBzZkM3c2I3TEJGMVZUbzBBUHdaZWtEeXBV?=
 =?utf-8?B?VzYzUzF2NEY1TFd1cUFiZXpOYjFJblRJajFITC9iaFZZV0tHVWhsT2w1dVZl?=
 =?utf-8?B?MmlnOTJPUHVBMmxqdEw1UmpGQXNBT3UrRC9UYzBKbDZQSzNSdncvOXErZmxX?=
 =?utf-8?B?eDlTSmQxVUk0MWJUaHBHMjcvNzRWSnRoOEowZmtxdTRHZmUxWFRRZ1Zyc21x?=
 =?utf-8?B?S1BwVEtZUGNUbUtSZmtiV0tLZmhYNjJxVGxwTFpHZStKWW1SNnZIaEdNbXFx?=
 =?utf-8?B?bWE2THk5KzJJaUxuSWIxQ2JtMGU0TnFQUW9rRU1iNFVDTlE0Q05OVU02TWVK?=
 =?utf-8?B?MkNWVTl5SFdOYmNuR2VNUnhvY0dVVDhYUS9JU0JxejEzRWNpYTduUTJNb0Q1?=
 =?utf-8?B?YXhCRTdBeGRLaHlweE05Vm5BR3NxcmNPcVRoa3dkaFdqZmRVZ2U1elpSVWNo?=
 =?utf-8?B?WndZSmtVWFRoVktVSzFITitXbS83Z3o1QzVLOHhIa1IzNmR6RXZJTDFEbmZ1?=
 =?utf-8?B?ZXZpV3ZNRWdJdDFhVnpBbVJGZHl1ZTIwVTNMd3N0bVlwM2ZZM2RJQUJWMndP?=
 =?utf-8?B?MEFpdFNTZFExYkJ4QlNGYXpCQ0ttaEx2cUQ2YXlZSzV3SENwSlNoam9vS3ZE?=
 =?utf-8?B?emdZVzBDQlc5RW5ZUXBGWis5bjREeUo5MnpEd2lHNVBsL3BYRkI4TmxvZWto?=
 =?utf-8?B?MHI5VjlUOVpGcEdJR2dIOFMxbzhkSFF4NUx1NnN6ZCtlbFFDWW1pSmQxWjMw?=
 =?utf-8?B?RHdidml0aW5wOUhPUWljck5CcFZ3QnFRVGVSb0FpelFvbE5SWndOSEdVaEFr?=
 =?utf-8?B?VXlCREsvUFo2NThxODlwYmZXVHVJNE9qNy9aeXRQNkNMdmdObmZGaVU0SW5V?=
 =?utf-8?B?K1ZLcnFxTVg3RXBHdGNPVmlZZ2lEMEZkMDRWOFgrZ2dUVlhHSFoweFN0eGV4?=
 =?utf-8?B?cDhSa2tmVmFWNDdVelZqTCs1TkNLOGhWUmx4Yzc3dGFJR2hrNmd4S3BFZ3li?=
 =?utf-8?B?ZkE2SjRyaytRcjZlNFlzeE5oSk5jZVcrV0c5ZklodDFzbnd3NmdPNVJPSTZh?=
 =?utf-8?B?Q0UyNWFvaldUYUNxdU1NbzcyT2NpWlFNQ3h0YkpvZlB5ZkVqWnNwRVRhTmp3?=
 =?utf-8?B?YWRxWHJQYlhiNk1xc3czM1I5TlpDMmptS0JZSlV5SUllb3Rsb1AwQlVoYXcy?=
 =?utf-8?B?eUFPekZPcTk5S3MyRFFhanBWRThHcVFFaFY1akNuRHFiYkFubTl5eEVPK0Ir?=
 =?utf-8?B?bTduaUt1VkhaSmlYRmI4ODZrWVg2U1Bnb1hWcWVHMSt4QjNjVmQ4bVBTWWJm?=
 =?utf-8?B?MzhmN3MrVHVYYndwVlBtR2E4VjYzMGFxZ3dxNmpNMGxEd0hUNHpQb2I3YUpp?=
 =?utf-8?B?ejNGbmdoTTQrdUZQWGU4dU5JSG5JUVJxb0xXRFRURVp6Mm1peW1HbTRvYktv?=
 =?utf-8?B?Nk53SmpjTzhGR1FRUXl0WTUwdFpGQnVoQURFOG9sVlNIVm1uQUcwYXdoc3RJ?=
 =?utf-8?B?OEdpZ3R0TGhsRHpQTTAzZVVQRnlPUzYxZnZHVGhtRENuSjJKT2tNdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8185b18e-8351-4847-5f3a-08de599dbcd0
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 10:05:14.8365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6JGAn4PFzh8LcL/Dh9qI7N2YwXRNr7fMKfhaFNDtfYNZj67RZtet+/8TiwnwFJqZgjdm4hB92QErBhHFJBHoMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6502
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,Mac.lan:mid,citrix.com:email,citrix.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3EAA064FAC
X-Rspamd-Action: no action

On Mon, Nov 17, 2025 at 03:39:50PM +0100, Jan Beulich wrote:
> No IRQ balancing is supposed to be happening on the broadcast IRQs. The
> only entity responsible for fiddling with the CPU affinities is
> set_channel_irq_affinity(). They shouldn't even be fiddled with when
> offlining a CPU: A CPU going down can't at the same time be idle. Some
> properties (->arch.cpu_mask in particular) may transiently reference an
> offline CPU, but that'll be adjusted as soon as a channel goes into active
> use again.

Hm, we where likely pointlessly migrating the HPET vector in
fixup_irqs() previous to this change, but such movement shouldn't be
fatal, just pointless.

> Along with adjusting fixup_irqs() (in a more general way, i.e. covering all
> vectors which are marked in use globally), also adjust section placement of
> used_vectors.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

