Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH+BNJLHfGnaOgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 16:00:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B792BBD62
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 16:00:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1217650.1527040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlpyi-00080K-FI; Fri, 30 Jan 2026 15:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217650.1527040; Fri, 30 Jan 2026 15:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlpyi-0007xx-CK; Fri, 30 Jan 2026 15:00:08 +0000
Received: by outflank-mailman (input) for mailman id 1217650;
 Fri, 30 Jan 2026 15:00:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u48w=AD=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vlpyg-0007Ra-P8
 for xen-devel@lists.xenproject.org; Fri, 30 Jan 2026 15:00:06 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c2cdf50-fdec-11f0-9ccf-f158ae23cfc8;
 Fri, 30 Jan 2026 16:00:05 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB5329.namprd03.prod.outlook.com (2603:10b6:a03:22a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 14:59:35 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 14:59:35 +0000
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
X-Inumbo-ID: 5c2cdf50-fdec-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QdSFwI8CbbaT/VSru3+8GrBlUltiG64RR6XfFjabBRlFjJSzLGneaYqVtlVwVIWMR+auY9ncuHzMGVhjPdq/8XEs5EwfKRIeeTLC5tGxc7PHAZSjrbQ12I9kiVAHDiFE+s0B8ku+Fv3FF8h6wCnJ5InAT+WYtCimEtuyCdSJxxTLG97FeXWq8gYAQyBBxAA3qoD1qzOJXOLCR3qBFFgP/RqZHrH+yKyMX2fQzdP7Ag6fenZk/oiOXXQWe3GuUT5Za4sHt6Fa+X1CsNl78hmxx3wApwUWS+Kf4dTPgTvGxqpKgyU8PObOa7tIPoY4wSUy162C7F0dPtpGlpwb3crOww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iq7LypTnBSn8i0P1LD1jgEQls24ME2uQhILN6C907Xk=;
 b=jQUXci0zbhTSOKSo75UU3Ub75kMZxeJr9Xv3BT/aQLUZybSqoSO0UU8NfR4XfkNaM2az4C8UKimZZS3SJeP8e91NeyQ1BeV2rtpoCQzbXUtF1Jamv16xUfFbP1Ielh3miAch4JG6n+ZV5Hl87zWOALpihcBJ9Mix9s5kZqRwPiGeP9eTIzhIeNJ9R9V2TI140EOw3ALmZKKYxxGIgvs6F/4Pw6BM0BgqlNCiUbI8AoxdqzTHjf+EUt4sYlSl6KvCaMPN81mgqAaWlqm++bH4dj0arJQN0dG4h5M7eBRLCi90KptyiTy3MlyG/6Zs63UvVR/7DmEz4qr61OMYUfK7yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iq7LypTnBSn8i0P1LD1jgEQls24ME2uQhILN6C907Xk=;
 b=AJiE/oDdGtKikxtkVq8gku66Gh+tGBx+XZJQfl+INLAn8Dc7Xzwv47PvDyV6myhv+Oc4JMxWMLrh3vROJCFORt7JJoFZOS/lSFnab8JNcwxQuTpppq+L84bArshMc4KkiLYVqRgkB3tyS/YVxMX1qSmA5/CV0MXK8gtbyzzqx/w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v5 0/4] xen/mm: limit in-place scrubbing
Date: Fri, 30 Jan 2026 15:57:22 +0100
Message-ID: <20260130145726.85907-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0129.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB5329:EE_
X-MS-Office365-Filtering-Correlation-Id: 6793c20d-86f2-4277-280d-08de60102eb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGtqNFRISXUrQjRQVkMzSlZGbDlUV1NwNUFzcExHdzlEL1NuRXBHc0hqenNV?=
 =?utf-8?B?aDNTQWlaZFBUaWdQYTc5RVo1TTRDNVoyd2dhdzZUT3Vmd3VKVC9FMms3RjhS?=
 =?utf-8?B?RGwxU2c2K3hEenduaGdxdng2VHpiUU9vWnN0dkVtcG9NT2lqdDIwWTg5QUd5?=
 =?utf-8?B?VW9aUXpUMFhlWEdGMmc4UWtaWVNwTVQxNmlRVDh1TTUvekNmUzZ5S2dCbVhv?=
 =?utf-8?B?YWxPNGFmcjUxb3RKeFJ5MTkvaVRtVCs0ZUtJVHpUSXpRczBFRlFLbDJ1cTFQ?=
 =?utf-8?B?eU5vTmJySklOanFNZU9nQmRRSFJaWFlVbHJEeDlTQ2x4YWdKMm5mWFkzZ2xo?=
 =?utf-8?B?NE9Sb0UwRXh4aFh2TUg1blR4NnV0QnlSbHJhWWs1MkFFaWpzUEhUTlV5U1Jh?=
 =?utf-8?B?SytRUVgxd0hidHJLSEhweG0rdWNvNXpUeHRlbUlqY0RlY0NnVGxieEQwbHBG?=
 =?utf-8?B?bU1NK2YxR2NjdENocHY1aFdKK2xjeGJCK2Z3V1hLSmxkc0lnVzZaY0hRbzJZ?=
 =?utf-8?B?T25mTzg2dmZ0MzF2aDFJU3pQUEJqd2h2SlNVdWJlR0w4UFFmSHl1SUJEc0RM?=
 =?utf-8?B?ZTBPb0RRUWJ6OUJGdStlb1lGTno4bDd2eW0xN1MweDlnTmgwWFJUOUFCUWV6?=
 =?utf-8?B?ZThYT25PSXlwZ1ZxRCsxOUZxY2R4ZVdyVkpEYXAzZVlUYlA2MmxBOTBiSStS?=
 =?utf-8?B?V2VNNHRzbmR1a3RpRWsxNklZSC9iVWMrNEtYdkZYeTR6REFmZUNndExxbjZt?=
 =?utf-8?B?UmVORXhmRzdCeU9ZNmt1VllwN2dTemhCUjlmUWpKM3czVFBQV085NUttWDRC?=
 =?utf-8?B?QjlnNko1R2Flcy9Ud3phY0szUmVkaDFmRWJoUlVJM3NQMS9nL1FmU1BoMVBs?=
 =?utf-8?B?N1FRY2Jsd3dSMytkM0xPdzVYbnF0eEp6ZTY0SXRIV0JSaEdpZGN2ckREbW1a?=
 =?utf-8?B?R293NUQySDFRaVRud3E1ajBLN2t0MWNja1Q0TFVMcTNjZ1ZMRnJNZmlJS3Q4?=
 =?utf-8?B?ZXNTMzJIQ0FjS0RiMzlYUzhOL3dUeXJrQU0rQjZrMG1EcERZMHdUSUMyS0dT?=
 =?utf-8?B?SE9qdE5sS2lGWTlnN3pSamo1WFA5eGg3VUR0YjRXK1dnNFp5bGlidkd1RXUv?=
 =?utf-8?B?cXRrNkNXclNXSzFpUzJMQWJqanpIb1RRQnpzVmlPWTRnUSsyQ0w1aHF1am1L?=
 =?utf-8?B?dWVLaXFnYzYyVWNYVUF5ZktRTXQ5SUxCNzEzbmRTeWFWY2xyTElOTm9JeEc1?=
 =?utf-8?B?N1huVUtLeG1xd0FJeENGM3crR1B3Njd5NklxL0JNYmZKSk54OHZua0lvSzFm?=
 =?utf-8?B?bElrWUVvRmxsZGlwYi9UcWpYSlZnMFhpUmx4ajBicmlkN0xDKzRYa0hJL1hQ?=
 =?utf-8?B?T1BxSU03ckYyQndxT1VUQklUZnAxNEQ1dTUzQ1Y1Y1JWNWc1QWJQYXZJcGxO?=
 =?utf-8?B?OHZhbUloUU9Eb0NTOVoxKzAvU3gxS3pYOGN1MnlCa3hyZHh6VTFOY28vUEhj?=
 =?utf-8?B?a2N0OHhiSC9UVGhVR2JzbEczbEdqcTZnSTZqTUtxVk0rUFhKeU9GSGE5MTBw?=
 =?utf-8?B?QTR6VjB4SFBiVEN4aGx0NG9ja2RlaW9IaTcxQjk5REVYK0MveTlLZjJWSU52?=
 =?utf-8?B?K0ZPYXNQUUpOWWQyclB3Yml5TndCYml2NW00a2JWODNEczJIc0JOQjR1SEc3?=
 =?utf-8?B?WHZTVkFTRS9jT1BrRTZXaXdabnNLbEh4aG9BQ0NMZ1hoMDFYRWNUNk0yTVRk?=
 =?utf-8?B?MllQclNNVXdQV09QNVFsZEk4UG1jdWl5TGNWOVkySStpWThmUUV5Y3BpUVN1?=
 =?utf-8?B?bW56WXJQYWNEK3ZZdWJLbitIcGNreVJNaUFGUk5TQWhVV2s5ZS9DODBoS0Ft?=
 =?utf-8?B?V29MaXlkTU1aalBXMVdlZU1PTTJkMmFSbDVkcHJ5NitWSTFiZzJDTUZlakVo?=
 =?utf-8?B?dzhSN216UXZ1YmRoNGdhdEVwUkJoeTdpNmpoejlwUEo5NHptQjNSRkNucnNx?=
 =?utf-8?B?ZjRvaW1QK2kwcnZiUTYzVFVnTFJYOUpIZVkraitMbFlvODlYb0Yyb1cyNVpn?=
 =?utf-8?B?ZnJMbkY2emRyUWgwM3JFMjFnSFNvQjNNVzllL09VZ1NqcnVMVk5yUnVhZUxI?=
 =?utf-8?Q?AWZY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0l0LzNaWk15NDdrQkZvRmI4UGc4YlVkRVlZdXRnTm0xOGYzSGZ1UjNvaXpW?=
 =?utf-8?B?RzZLYldYNkREVmV2WUpSN1NxTHNsY0pFL2x0cEd1MktXakU3NmtHZ1ZYRTY0?=
 =?utf-8?B?QytKMWpGR3lYU3p4UkxaZnR1N0RVandlNTdMb2NCNXVjaTVjZkdoSEZtenJa?=
 =?utf-8?B?bytTVE9MMjh2bFNRWFVtZmIxSkRGY3dibVpDUlozd2lFeGF3dWZFYmlVMngy?=
 =?utf-8?B?ME5xTGJKbERxd0pNQitkRjJET1lMN1U5Y2ZpZjg2Ynkwdm1ibVJLSlpOdTNm?=
 =?utf-8?B?OGFwZ0ZzQmhGam05bGdLMFM1WmxGTk1PbGF3K0ZhSjBBaXc5dC83a3d6UFlD?=
 =?utf-8?B?Uk80MjV3bmlpK2ZlaGJCU3lEMkhkUFJteVNYeGxHSzJiU2xIcjIreVpIUnFw?=
 =?utf-8?B?MkcwMDRFYmcxa0M0dXBReWRlZkZNaE41OHpHVzJZOW1yNGpwN0RZcTFIc3Ja?=
 =?utf-8?B?VUorb1ZWUVVqVHYvOUYvVTUwb1FnSzBvTXNJMm1hMGZ0QXdZTjBXNk9KaXVs?=
 =?utf-8?B?Q2w1Z3pwY1prRnVjeVBiQkJaNCtmUG9iUzRoL2V1bmpiYlM1eVcreGk4bnp2?=
 =?utf-8?B?Q01adUFOZ2lQTjVON2ZyUzdoWHVVRHpiZ0xOZXhBMkZKc2pDWVpOZHZma2dp?=
 =?utf-8?B?L1l1M3RGaDRXTkd5WG5ZU0ZMNEg3MVNqbzEyelYrT1VrNThlekQ3Uit4R0NT?=
 =?utf-8?B?NmxocUFxOW8ybjFad2dhTG4vS0llbjh6RGVXQjFETHBPOE9SaGF1ck8ydWFZ?=
 =?utf-8?B?Sm95WEhJdXMyenNXL2MwY09uUFZZU0J6aHVZWDF5U3NrVXRYZi9Vd0JZK3Jm?=
 =?utf-8?B?a3dIaEVldHdTd0hNNENneWVmdW83eEduQjlSY3gzTkQzazRnZFFOSzBkcXVs?=
 =?utf-8?B?YmVMVnZaMUo5SklGSDRIN1hNLzk1Zkp6S3VMNWwyVlkvTnRiUkMxVnJSRjh1?=
 =?utf-8?B?NUlTdGM1NUJTLzl0by9lZ1ZaQVZPaGplbWhGaWVrMUl4M2plQ2VKKzRpMUFW?=
 =?utf-8?B?Ni96dUJXRnhzZGVMQW9yYUR3V0dsb1h1d1FGelV5WFlnYnFKYUUzOEFMREFw?=
 =?utf-8?B?N0g0OG83NE02MkJCcm8wM2o5bGdQQUVOcDB2TGNDaTNkUEtMZUxCMlU5Y0Vz?=
 =?utf-8?B?Nkwya1lob3VkV244bGtIeTRpdDRhZVUzMzJXb2UxcnRyU0lIbG1sN3pXajlh?=
 =?utf-8?B?NUVaWGRpVTVzMmpTNVVWclozOGgvTEROdnJid0hrWGQvelFZeXE2eFhzY3Za?=
 =?utf-8?B?Q0dHNUVTaTBqWWh3RUtENmVBd3Zjbm9GZzRMUG9BMWJ6aGRHOXhzZCtEQVph?=
 =?utf-8?B?Rk5hZjVHNlEwcDNCMWFxVVhtOE1rd2w3aWJrU0RjY291R3g3TnJvMzVnNXpL?=
 =?utf-8?B?UkE2L2RzbmYzU0pPekY1TDZmR0pHeFhhZFJQcm9EdlZDa1l3aGhNOXU5ZHh4?=
 =?utf-8?B?UGpXZ3c3by9KZlFadXRJMFRvdThQTnkwV0dNU0xGTXRkNXgraEU0YnNWYVFO?=
 =?utf-8?B?eDhpQy9oTHFnd3A4bmhwOVhYcm8xOTJGOG1DV0VHYkkweHc4ZWo4OUNQN3lY?=
 =?utf-8?B?SmJua0I4QzdqYUZxYzdsc0xxY0svZ1NZU0VBSDVkZjAyVjM4VXFkaGxNMkRD?=
 =?utf-8?B?K2JzUVJ4aENEbENUU2dSYzF6VExNTmkzWEhQZE1LY3ZtRCtpQy8xV3RZUlhP?=
 =?utf-8?B?NmlTSVJ6K3V0b2x6RW1qWUVyVWh1RElnYTlmbklXSjQ4ZjNDNTE2aDFSUDNx?=
 =?utf-8?B?T2NFRkpkeTNFbk1YY2hPc2JhNStZdlZkb3J6RFM3Q3BHRVJhb0o4S0pnT2hJ?=
 =?utf-8?B?czNyZU5iMUtvZzM2am1WTXRRSzVic0ZMMjgyNGFnYm1JZmtrR3pYYzh0aGVB?=
 =?utf-8?B?RmJudld0Zy9XdmJnNGFXL201NklERHJOSGpSczE0VmQyUVZGWk93QXh4czFF?=
 =?utf-8?B?akVKUUFCQlFwWUJEWWRNanEzRHE1N3UvRWd5cG1BM1ZlZWhEbE90dEwyUlJX?=
 =?utf-8?B?ZlZJNHFacjkzbU5wSmg0VUEwcFFFY1luOGo0Q2pwdW52ZVNuR0tFNjRka0FJ?=
 =?utf-8?B?MFFGa3YrVFNPclI5N3lLUEVLV0FKRUdCa09Ja0dKZFVVWXQ1Z25GRGFoN1Ur?=
 =?utf-8?B?b05QUVVBQ3NtSXJWZ093ZmtkYmdyV2NzN3h3eW85TXRJaitNT1c1NEpubWlP?=
 =?utf-8?B?bFYxZ1NFVy9jSnNCaWZyVis0Miswd2dJbFZFaWFxS20yeEhBa1JSWEp0eHV3?=
 =?utf-8?B?YVNicUEvZmVNUWhqVEZBMURBeWVyUng2VVVBLzhQQjFmK09tcVZOdFJ3aFJp?=
 =?utf-8?B?RzI2bTV6cklwZ1VMNEFOVk1JWWZKY3kzbUxTbFlCbS9oZzZDRlJ4Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6793c20d-86f2-4277-280d-08de60102eb7
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 14:59:35.5465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K8SzAgH/YVBW6Jmg/nGiUn0bv9CmpocVvwiTbrX3+smP6Gqjj2bJEezg9IKqXCZmPIbEpdISCYDrap8zp1IDfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5329
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	DKIM_TRACE(0.00)[citrix.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,kernel.org,xen.org,arm.com,amd.com,epam.com,vates.tech,suse.com,raptorengineering.com,wdc.com,gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7B792BBD62
X-Rspamd-Action: no action

Hello,

In XenServer we have seen the watchdog occasionally triggering during
domain creation if 1GB pages are scrubbed in-place during physmap
population.  The following series attempt to mitigate this by adding
preemption to page scrubbing in populate_physmap().  Also a new limit
and command line option to signal the maximum allocation order when
doing in-place scrubbing.  This is set by default to
CONFIG_PTDOM_MAX_ORDER.

Thanks, Roger.

Roger Pau Monne (4):
  xen/mm: remove aliasing of PGC_need_scrub over PGC_allocated
  xen/mm: enforce SCRUB_DEBUG checks for MEMF_no_scrub allocations
  xen/mm: allow deferred scrub of physmap populate allocated pages
  xen/mm: limit non-scrubbed allocations to a specific order

 docs/misc/xen-command-line.pandoc |  13 ++++
 xen/arch/arm/include/asm/mm.h     |  10 +--
 xen/arch/ppc/include/asm/mm.h     |  10 +--
 xen/arch/riscv/include/asm/mm.h   |  10 +--
 xen/arch/x86/include/asm/mm.h     |  18 ++---
 xen/common/domain.c               |  24 +++++++
 xen/common/memory.c               | 108 ++++++++++++++++++++++++++++--
 xen/common/page_alloc.c           |  32 +++++++--
 xen/include/xen/mm.h              |  14 ++++
 xen/include/xen/sched.h           |   5 ++
 10 files changed, 202 insertions(+), 42 deletions(-)

-- 
2.51.0


