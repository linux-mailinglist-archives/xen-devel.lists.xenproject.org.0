Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WER3LXTncWkONAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:01:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4498163B0F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:01:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210522.1522170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viqYl-0000Em-5R; Thu, 22 Jan 2026 09:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210522.1522170; Thu, 22 Jan 2026 09:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viqYl-0000Ca-1k; Thu, 22 Jan 2026 09:00:59 +0000
Received: by outflank-mailman (input) for mailman id 1210522;
 Thu, 22 Jan 2026 09:00:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paBm=73=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viqYj-0000CO-RS
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 09:00:57 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbad8b9e-f770-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 10:00:55 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH0PR03MB6097.namprd03.prod.outlook.com (2603:10b6:610:b8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 09:00:50 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 09:00:50 +0000
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
X-Inumbo-ID: dbad8b9e-f770-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+zzs3O8eitSAFql7SaePECkpQtXbp/X1VCsAueDWTHwhnsKtW78uY+4TiGlXyd1kFuWXHNPZJvohLG2opi0RDyQ0vbbaiY2C14XIUGwR3jrF39hgQgzJ/eFmF6Z5keL8da1MP0FUOldwNht68Hkl2ecOLtbuCgvxc++gtomkt6hw/soLxulaokGu3wJ9l+7q0BH9EX8Hih/akrHsV8/2f4ZNMwcH21z3qgNEhq7Bh2CWhu8c4zYOwczgaJjkzXwngLNGJT99TZguS9tKLre2Q9eZRJ06Z6M2FgCv7mGDK8pWIFOCJZ38cfA59/k0EkxYUsiegsHJtOm5EqsmYTJdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3vaAuAOpN+ljOXQh5R2SPVbD4JdpTaE3Ki3qgQEFaY=;
 b=SULWPunwnBF4VWExJlB+dLaryGxBmtqd7qRme/t5VV0dNmeK1nmSGObUN/EDj726NWe06DxVhWffzRZXYbSg24vyfwAW9FP/K1mFQW81vytNObxGozN8a8bcO+gmVkN8SQMu9jzobjQAldNsO9BnAOMaw5Pb1iieTriGz1rEg7ULS40RxiW+d37tAcCjcNVaiNj/ap3UtdiXE0cGYf7qFM3wSmPRLTf1tSFxMk9DXZYTGPxKO/q/UdDEZV0Awbg/NYd14aySfEe8WDNfr8ENGitHsF7QyQiUL2b076OasnHwGho2rxPBIjnmIQtgoqDmB4R1y7J9dB+vDj7n/LU9qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3vaAuAOpN+ljOXQh5R2SPVbD4JdpTaE3Ki3qgQEFaY=;
 b=g+4VrX8I/U2GpIokrMJ6sdZbcoZNm1kEJtp8TSrbodSHZmQIqmDYYF5Z7kEW9JkrWhT4hIRawezUVOjvAYHoeysCsyxCPI2NgcP5XzPNClyeu+LEez1biEwBHt20DBf077EYrJMLfuCm+I1i1qsYI428AS916LCuEoJL4HLGpiA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 22 Jan 2026 10:00:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 4/8] x86/HPET: reduce hpet_next_event() call sites
Message-ID: <aXHnPg0cCOQHbC8g@Mac.lan>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
 <f9133ee9-7797-493d-825b-ded56c17cfc2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9133ee9-7797-493d-825b-ded56c17cfc2@suse.com>
X-ClientProxiedBy: MA2P292CA0006.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:1::7)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH0PR03MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: 62be205a-86a6-4f91-2f1a-08de5994bda8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3pmQ0JvVjR0TXF4OE9tODNTYzRXWVNZUVRKUGhLTTZBeU9zVGdtbU1xSVgx?=
 =?utf-8?B?Z3hJWXlKdmlXVzlQazBiNWVwUUlMZVVQOUwyVWNkbGlWODdJeWtOZDhqYVhj?=
 =?utf-8?B?YVl6ZlhLUkNmVkFLRHlKWFFTMk5qb2QxT0VMR3l4MWdGSTFZMUJPckxTTmNI?=
 =?utf-8?B?Q04xY2dSUlVmbGJMUU1kOGRhWFR4c2tYenFQcGYrM0tXSmJRaUpZQkxrUXd5?=
 =?utf-8?B?MVFOMVJseUZpdHI3TTVYVjYyRkV3WFp5QW1YM05CeGhBUmI2dEtNVFB4QjRw?=
 =?utf-8?B?eGZMWmp2Wkh6NFRyWEVzUTV6T3NpdGUrTFVzMW56MWU3Y2ErSTAwZmExa3hq?=
 =?utf-8?B?MzV0bVJsVXFvaGdHcW05Z1l1eTlQSjBubVExRmthRHJHVHJ5SzltNG1zMUV4?=
 =?utf-8?B?WWduQmhJTDA0NmJMbHVkU05XSWJid2FmZ3lZbUpEODhzbUdTWGtPL2RNSnYx?=
 =?utf-8?B?bzBBTjE3YWxtdUo3RE5iekNCRHVYVyt5QWRBVWRvU2xRcytiYTQwNmJoVlNo?=
 =?utf-8?B?ZnB1VEZjdzczSkp3T0hlalphNGpHK1lYQmtLcTZXNjlYM2Z4a2tQdmtoR2lM?=
 =?utf-8?B?WnZJUDRKRHpFTFVKOFhEczAyUTFZU2t3Z21abGtCSmtHelNkUnhhQ0hWcnRO?=
 =?utf-8?B?by95NXNSSWdXWGt3WU9XdWNpSFNLNWZtdzcwMUJrbHhEeFdvclJEcllDZVE5?=
 =?utf-8?B?cm1wcTIwK1BuUUNvTi9xYmxPSE9pOGpFQm5aK1VCeExoTFBLcXFLQmtpZGNL?=
 =?utf-8?B?bTZrSVRoLzV6bEpic2pIaHhUWTFUeTMrVk8wZTkrZlllMzMyY2lzZGRkNmxI?=
 =?utf-8?B?RkpTQ1VKYTNBeGJyRERBdHNSMEdMcTlJM3hDL0psdHdPYkFVM3ZDUGNNYjF5?=
 =?utf-8?B?MGMvS1BiUEh6Z0krLzN6TmpNK09ad29BWGE3aE1JZTZsWlBYakNtdmwyd2NK?=
 =?utf-8?B?N1NlcEczcXNMN1lZSkYxL25iUVRTTWJrenRVdXE2clIwZ3NmMkt3SmFobno0?=
 =?utf-8?B?VGdHcVNHVUdIVk5qVTlGM2ZpNE9nbTdZMFJBQmh0ejltdjJkazI2ZGo5QnJq?=
 =?utf-8?B?aXBOL1Q4cXZlZGR3U3J3K0xPc0pXcnpQZUhQdmlMK1NjSjR1cTl5UU1SVzI3?=
 =?utf-8?B?Sm5jbzNZcEJmUE9weSsxcFdpSzdacm1HWHJ1OXA1NjhmUEhXaUdBSDZZbTd5?=
 =?utf-8?B?elpPODN1ZGpEN0FDdEdBcW4vakdjc0pwZm91V215VDc0dEpoYmJvK2U2SlQy?=
 =?utf-8?B?YnFOWEFCUU1wN0hHU0VMelpVRWNJMzF6OWhRWEIyZlNYWlBEMnhpdHl3Zno3?=
 =?utf-8?B?R1EvcVhyUGVtNVo2S1B0RHZnUWZFMTJkWFlSM3BNajRpeU8zMk51Y01FbkVH?=
 =?utf-8?B?cDBBR1R0bWpOcjdQZURhMEJTVEhWbEhvRE9Tb0t2K2hRMVVVTGlzMjlFaG9y?=
 =?utf-8?B?NkVKajFOTVgrcGI3WkRHMjRKcXlWbzBlUmxaSlBMalRkNXcwS2dGMEpSNWl1?=
 =?utf-8?B?MUI1Q0RHYVpnK1ZZUUVoUXNoNWowTExoNVRJSmcrNFZNd05OVFN3M0trQjlP?=
 =?utf-8?B?MDZoazNoaWlCWEl1bmhPT0RSNFpWTmN2MSswU0Erc1BESzFCdG9lb3ZkREtn?=
 =?utf-8?B?UTZ6eGlxMytRZkFNcDRFZmJWaTJEZlpBcWdIWE5IV1VtL1NETENMUUpjVjdC?=
 =?utf-8?B?SXFBN0xrN1ZVS2QvTWR1M1liSkkyTWE5TUhBb0RnR056UktzRllXZWNmTkIv?=
 =?utf-8?B?VlRyM1NDUS84MlJaUXk0STZMUTcxcnhUMlhqNWFWc3BockpMcXVvN3lvdGhO?=
 =?utf-8?B?R1hXRElVazVpbGxEak9JLzhPSkdHUFQ5SEloYmRIUmZNT3ZyWjBBc2hiVVJX?=
 =?utf-8?B?S3JpVDE5amZiakRTWXlycFlzeEZrSzB3Njk3aGFOeHFpemx1VGNZVFJvUGhQ?=
 =?utf-8?B?eThJTUloUGMrSkFmbEVqYzJadkVqUGZSdGZhbmxKTkI3ZmVNQytuR2Qxanl6?=
 =?utf-8?B?aWlLZ05ocjJyc1RiS1Y1NmZDUkhEb1lCQjRaS0VwU1ErSzdTYzI5T0JGSWtm?=
 =?utf-8?B?K2s4cnBDNnZWa2JocjU5cGV4YmFRc2txMFNhM1RzZ1liaVplK0JyMk9XdE9i?=
 =?utf-8?Q?2kJc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzZLdVF4NWt3Q0kwZWNrVmFjK1pnZC9RN052ZlJrVmxrdmRHTmZiaHJVTDZ6?=
 =?utf-8?B?NWZDdGxBbEk3dVJCd0NVbWZwb1pGblRDWGFPWm1VNXp3M3dtTmZOZWh0eWJS?=
 =?utf-8?B?Vk5pVEw0MFMyWVVWWk9BdXRjOGlhK3p3b1lJbThzRnNaZEprYnZJZWVKRE1u?=
 =?utf-8?B?VWxGVlAveXRtWXFqZXNGMjNUVWl5OGxZVFFVSlJDaWhaakVlVHplaSs4Y0Rt?=
 =?utf-8?B?ZlBNTHV4S3VOTDMza1ZWQmVDeEJDaUkvb2NyZGJyOGFjZWxNbUtuUDJ2Nm5p?=
 =?utf-8?B?TnlRMlJoaXhlREpnc2ZOOFQzRmNVUjZwNXllZmxYS3V4eE4yTkg0MDJMVExM?=
 =?utf-8?B?cWRPVENDQmE5YmZUbnAweXg3YlNGWWg2WXBGZUJqR2ZwU2dua25tQ3ZsMW1R?=
 =?utf-8?B?bUFySXhQa2lQaXErdk9reFlXUDlKVGp5SHR1SHFSMTVRZVVhdy9vTkR0R255?=
 =?utf-8?B?VVRac2RSOUZ5VjRoZENqZEpaWEdtN05nRXc1T0g0K1dhVytnd1IxNlNUOFEz?=
 =?utf-8?B?Z2dSOG02WldIdE81VEhiOHlwN0xLRDFOY0pRSDRmd3QrZlE4dDZRVThwck9u?=
 =?utf-8?B?R25qc1ZGWW9vdDU1K1A2Y1JvVEdudERoTXh1Y2N4aFcrc1NtVTVmS2p2UnBH?=
 =?utf-8?B?bDc0NHA3WFM5S3NTZENkR3cza1Z2amZZVjQwRVp6RVFORGF5NS9CaDF4M3FE?=
 =?utf-8?B?U0hOeHU2U2pyYVlCektFL21VQjk0Z1lHaUJBbXlNVUZwQkVEQmVyckcraXkz?=
 =?utf-8?B?bWE2ODZJRjVBTGtoTFhIT0JkTkQ2K0NHRjVjMFlybTRHQzdSL3lkMXNMVWhl?=
 =?utf-8?B?US9ESVJjQjJpdVZrUDRzR0xBVm9VUmsvQmZwalRmRzNxazNjRDVMSUFPSTEx?=
 =?utf-8?B?R1J4R2ovQnNPNjRWdDF2ajRseklQOU5RcWJteVI2cE96M3FwUjBiM1F5YzRH?=
 =?utf-8?B?R1ZCcWVuU2FqVEZPTEJMZWhiSUVBOHBXaHhPY3luOUh5ZXJFNjlwNnB4U0J1?=
 =?utf-8?B?V21mRjdZWEFROHRIKzNpVXc0U2JBTGpXSEJ3RW9PRTNKdTZUVHBKclQ4bnZD?=
 =?utf-8?B?RGx5dDJLK0lpd1RFQjN0NjR1d3V1aUZucHBXNmg4c3RkcWlDVFpBMGxqaktt?=
 =?utf-8?B?NWVScURHWEpZaWRFMk1mdFlaS2R5RnVYSGdqd094RnRsejFVSnhMYjlaM1o5?=
 =?utf-8?B?RDMvM2V3a25IY2tIaHN5K2I4aXBmOHVGVzB1a1ROK0liSGtNa1U0c3lEYllR?=
 =?utf-8?B?SS85QkV5dWlQdDFnd3ptTmlWa3puSWE3MWVLQmNWS2FlQ3FKM2FySE5KZDNk?=
 =?utf-8?B?YWlLZzh2b3pGbGdzRkxqRVlBZ2hrNmFrSjlFYVJnMFFnb29oODhkUFp6WC9s?=
 =?utf-8?B?OTQ5QjNMYStSOE5HOWY5VnVJRUhxdHVTL2JMQWJyL29lSXZBK0NqWjRiVS9Q?=
 =?utf-8?B?cmNDd0RpemFpU3RPWVJtVFFhTEZVTldiRm94NG9DSjhHMUpZZm81MVp4S1Nq?=
 =?utf-8?B?WEttQVlDOFM1bDNjQ0JBR3ZkZnlXRGF2c29Oajczbno3Q3J0c2M1T2dWbjZB?=
 =?utf-8?B?UTFKUjJaazlOY3ZLWUZYdGh3OHB6WjlkK1BydFowUTJzL1NXK2x6SURkYVQr?=
 =?utf-8?B?T0U5N2EweStpVHVBYW5NbU0ydzlqdTNUNGdhMm5POEtoaGRXWlFFNTFQdTJC?=
 =?utf-8?B?Ump3SEhTeGpwQkpaWjgrZitqLzZndmFIR0JBZGZibXFNOVovOVZPcFdkY0RH?=
 =?utf-8?B?V2xzMTdML3h6YWRMOThKMHdCdGtOb3NwOXhURTdoblJFWXRUM3ZucnVuTFI1?=
 =?utf-8?B?Zi9iTEhteVZTTmFsd2tLTmxwWDFjNWwvWGQ3VWN5TXR5R2RESUdITlUraisv?=
 =?utf-8?B?cEJ3Qld3TGQwTnl2ZTdoSS85KzM0L1BqdUpTS2FCSDJWR0FtMitWQ2RTUHlt?=
 =?utf-8?B?UTNzdHIrRzYxZUV6SDMvVkJDL0pYblRBQitrbkVMZjNRd3FXWDQvQzBVUUpD?=
 =?utf-8?B?Q21mYnNIQTV4WHFZZXV1Q3RwSkFLcTdWN21hdE8wVzZpdGFSaTd0akxhM2hI?=
 =?utf-8?B?WlRURzMycWo2ZVE3blpIU1VVeklhOTh3T3BEdEt0c2tMdlhKTnJFNXB2YjFv?=
 =?utf-8?B?c2taRDBNa3ZaV1IrYmF0emI1TUkrYWlleldzdHBFNjk2VnQ3U3ZEbzlNcG8w?=
 =?utf-8?B?U3VGK1RJVEFrd3doSWpSZzVOVC9GU011dG1NQVVlSTNBNXBzY1ZJM1NkNndF?=
 =?utf-8?B?a0FzTW9tYUNCUW5KdFFibFVCdm0xTTVndlBySllQT1Rpa25TTzlVRXJqYWJY?=
 =?utf-8?B?WURqcDQ3cGZGa3ZlcTdSQmc2Z2duYnkwN3p6K1IvSTNhbjZWUWRSUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62be205a-86a6-4f91-2f1a-08de5994bda8
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 09:00:50.6490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SHYzYtj64fCBafytVv75uAPqfvLWmUk0WKg06oBoTGRd+FcE9DFl+P2iF9Zx145XXm8wbQiwGQZhxzchx5YYaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	RSPAMD_URIBL_FAIL(0.00)[citrix.com:query timed out,suse.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[jbeulich.suse.com:query timed out];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:email,citrix.com:dkim,Mac.lan:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 4498163B0F
X-Rspamd-Action: no action

On Mon, Nov 17, 2025 at 03:38:43PM +0100, Jan Beulich wrote:
> I'm surprised gcc doesn't manage to do that: At least in debug builds two
> call sites exist, just like source code has it. That's not necessary
> though - by using do/while we can reduce this to a single call site. Then
> the function will be inlined.
> 
> While improving code gen, also switch the function's 2nd parameter to
> unsigned.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

