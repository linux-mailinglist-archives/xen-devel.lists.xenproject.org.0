Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCq4I2FKDGpUdgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:32:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB8757DADF
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 13:32:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312802.1582902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPIga-0005CH-JF; Tue, 19 May 2026 11:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312802.1582902; Tue, 19 May 2026 11:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPIga-00059N-G0; Tue, 19 May 2026 11:32:32 +0000
Received: by outflank-mailman (input) for mailman id 1312802;
 Tue, 19 May 2026 11:32:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPIgZ-00059G-CX
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 11:32:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPIgY-00DHHs-EQ
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:32:30 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0c4a4b-e002-0a2a0a5209dd-0a2a4503acba-20
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:32:30 +0200
Received: from [52.101.57.44]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a0c4a4c-672d-0a2a45030019-3465392c5ab5-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 13:32:30 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB5828.namprd03.prod.outlook.com (2603:10b6:303:91::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 11:32:26 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 11:32:26 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TsxpjyZvmwRJYQpiB6L1s5GcBoSSn8DWCCuQFjYCWXd3G8zifkHYSikRUJbnKOozemf56oSLkq6epHQQ+7kCOZ0MX4u6YpijlIhXMHJdKCJk9nJOI1AOzLU+B+eb9SD/QGA8si3l4M6jUehd5opOGiTFzmhziDmaPN/sX1vAV3v7OJHKfr5kzhiyH/1uRkhVeqdmPgdmo7EhWvJM41WqNdsYT6ovsG5ktCRNB1G3Pzp683O3mJhBBKbzpUMSry37ZzjGeEbg81q3XAPezgPcWGhfwvPM38zyFRjFjYk5W1muq/zZ11HWhglHr3TLPRSDGjqhQuGCgCmAyvMYl9paYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WAbIv+4bWbzinbg5n0TFSM9rzZ8PYFF9uqE1KnJFXs=;
 b=SRbCZwyqFu/KEo9A2EHwO/ktTDL/u8pIxQhCMfY9X+kuSR4E554SV3eZsIpwfz/fJyAFBJ+ts+1Clo31e516/TjUxu4w2XwpV23A2s+pvgAyDJA4nHwUcg7cVEzvXVAropH92jFR//RXP8WL6ABCSTjoo/D+xws/axulH97puxDXz7upiAQc9oKQZCfCKvF1sNidmVn5svg9pHYJ1mozwCbvYSVfp4tG12qTNtjxXYfFFPdl9TgmHKVchtSwgcWT/IcDDExTgjaiDa7UTA/UrN6dyVu+nJrl6qBkVAhE3Gp2Ef8uWnsHMfLmPHajY7qBLlL5BErCPVcDeaGEF6gvkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WAbIv+4bWbzinbg5n0TFSM9rzZ8PYFF9uqE1KnJFXs=;
 b=WDiLIaHo9azWUMdar7ArxQY7gEnhooVPwnUQkeETza2kXfKHley7F49DAN9v5GQoE7r4KREzLPtea8kBj1Poq62Ni64kvpRoKbsmcxoWcc8eK7Nz6NVjbpw5wd0Fb2PX18nZRLMhEJTYtqIS/1OYP6M4BXZNUW3r2Aaj9ucg0tQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e65d9be5-f788-42d1-9117-eef70303a1a4@citrix.com>
Date: Tue, 19 May 2026 12:32:22 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 2/3] xen/domain: fix UBSAN null pointer dereference in
 vcpu_info_reset()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
References: <cover.1779179301.git.oleksii.kurochko@gmail.com>
 <09ae75638f9e7991163ed3633e7a60461d93da70.1779179301.git.oleksii.kurochko@gmail.com>
 <2be07ba3-879b-4c79-8103-b4951ab4cf53@suse.com>
 <bedfec37-4c74-40dc-904e-b80e33461be7@gmail.com>
 <e77cb8b3-35ce-4fc1-b98c-d4e889502acf@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e77cb8b3-35ce-4fc1-b98c-d4e889502acf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0391.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB5828:EE_
X-MS-Office365-Filtering-Correlation-Id: aaabedb2-182f-44a8-a513-08deb59a4d9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	BK4oeFdXNHrlmcyqRczSW9vWuc0NQv6bnMKgLxvtXCZb04iAcVHfykAfP+zuYDFlEu2fSlI7p2WKnvit2bPwHD75e+dd+xx7HRknf7tXDUb6WU9K7HBzyKAzhSd+hetQACb0UfDVLpTzKblfO6qj0nWcayVsiSoKgRrLs6nmLszZvhKPDAZpwvVQ58cANa2B/jDiEq0wp8ZFxqDo03bvKUkaGn1LYXx1626myZ6S9abxgVuhnPckYYLuion9dtPq5dbJNCmrL012jwRDLiUIfeoYzsH2H62qJXslPrB2vtBhNoqoGhcX/+ZTqBIawzYtMxqjUE5MgmrGNW+CxZkrJgG5KZs5/vcs6G8AUSlAb/9Ivswq2QSkPG+C2iP9kOKgwc/2FgVII59px+OFebMoMbhBcxH9e36aSCgK9GzedcJxkSRKI8xR25imLFtEngf7+nJ8zyXQSouBQafNTJ7HYFQVL8Q4Gw2dIENJWv3EeasbK3rTm8qn9sk3RETyajdnSAe36St9eDQTJSH+zk43NQFHI0bhmj3D38B7yxOcr9/ktLYuS6pg96/mKFBmSZViH3Tzz7kxnVgmA3O9HbnVzNuQqoaHamlSV0WNrvkVMUpnvXtPTIQm/6F5BNILmsoF60igInFqR7zxBr56MBA97j6VWOzRP6Se4PQXOcUibrLdaeEaY951GdhI3SPVRn4F
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUtsYVBLMnJaQ0xlRUlnamIzY2Ruc3ZnRHo4dUIvQVREbHI3WXU0aFpUMXFn?=
 =?utf-8?B?Q1ZJNWIzS1J6cld0bTVjR0ZQOUxQSnZUNDlPNGVobkk3N05hTWhsWC90azFZ?=
 =?utf-8?B?TVV3dWlmTnFTVmZrTkVpMFF4eEo2S25GWWp2ZWpNWldzdHFLMkw0VGZNeWta?=
 =?utf-8?B?NnpVbkxGKy9GRzFkb29aMllHRUR0QXVVcHVuNzFGanZCam84QU45U1FnZmVt?=
 =?utf-8?B?UExGMUtEMjdISmhEK3ZzRFhOcnhwTE1QVXVFQ0RhMnRjWlN6NzdnK3R4TDcz?=
 =?utf-8?B?Zk1FSGFwMmNFb3hmZ2hIcnpGV1FWSU9PSUp3R1ZZRkFlV2ZDNEY1bjg3blN2?=
 =?utf-8?B?dVpLdkdTVG5iaDlyamFDd0VnV0UxL3Y0NTFpbkZoTDUreTVLTjZPaFJ2VGRO?=
 =?utf-8?B?TFZMb3IzRkxkNVdrdWNBYU9CeUl2Nk1jaEVMWnhwTnB2cUlBZ2s3eVl6WGM5?=
 =?utf-8?B?WFFZQ0pJSzVnYVB4U2gvRExoS0tVNVdUOVZXVDh0bUl3U3Q0YnROclFyWG51?=
 =?utf-8?B?UjlPa2lOeEk5LzBxVUdBWDJHOS9yWHBGNVpGN0o2WHRSM2thZkFuT2V0dFBx?=
 =?utf-8?B?NnhzS0RlTG5NWFhUakJkcnFGQThZTnJkU2RpWTUzZEhyOVlzbjZURlYweGQy?=
 =?utf-8?B?SVFONnpsd3d4NFd2UHZuRXRLNmg1eTYzSS9LM0FKRDFubldBLzFFWGJ5blFS?=
 =?utf-8?B?MDlVM1I2aThnVEsvV3Z4LzkrNGUxbFVDTERCWVV4WDM3UjR5OXg4cytUbzJJ?=
 =?utf-8?B?NSsxY0d6RER5WUVnY1JTYVJHRFBOdzVvWVRkSGtaeW11dEdmeWtreGdLU20w?=
 =?utf-8?B?d05aTDNtVGRHajJxcUM1aVNoSFVmM2NNa01WQTFTMk5RckJ1UjluUGJ3M0Fa?=
 =?utf-8?B?UjBITElqMEFvQUxlZk1BS1c0NmRxM3lnYUh6QVAxbzh5QVVjQkVhUldybTBF?=
 =?utf-8?B?amFYOWtEK2RrYnFuVGZuSW01ZlN3ZytmOTFQeG1PNjRkT3VDc3VpWlNhZ1JO?=
 =?utf-8?B?SmNKbEpKZ3ZqVEEvUnBxcXgrVmRlRE4vZHd1MlFyTExGQ1lPNXc2UkhGSkx3?=
 =?utf-8?B?VDVTeUlNSjRYRERsa3hzTUppcGExZTN3UXh4bGFENWtOVW4xdEl0LzhEeUdk?=
 =?utf-8?B?Y1poOTM2Tk0vdFRZakRlQTluejNwRnBUb1I0cWNPRFdkSTlHODZiZWZCZU1n?=
 =?utf-8?B?ODhLeWg1SGRvcS91R2E1UFNsaWF4RVBiVmYvVWNTQnVSTVhXbFA5NjZ0QzFx?=
 =?utf-8?B?aTZKd0JFOHh1bW1TL3NrU2dtZXhPWGpvbHQvbVZjNXRDN3A4dFFLWkVlZE8v?=
 =?utf-8?B?L25xa3FzWkdNaDhpb090UVNqeStpelBLQ1ZneSsyVElvWHFIdzFMVGhLek81?=
 =?utf-8?B?M3daTUs2K2R3OG95UHVWTjZ2a3pLcWJWZjRpMStuUlZiVzAzYVh2SFpYRmE0?=
 =?utf-8?B?c1R6bkw0TnRleTlXTktGd0tDM3AwemE5VzkwSmQwU3JsR2RnUUFPU3RveWho?=
 =?utf-8?B?OW1tSERtWlQ5VnFoVTd4bGhMR3A1TEsvUVVnY25mUitWN04yRGFVc0J6VHhL?=
 =?utf-8?B?RTRuR3pyZUtQUzNJWjhhL0pKNGh2Uko2TDVkYnpBVVNMa21BZktOR2t1TmQ0?=
 =?utf-8?B?KzR4SjBEYm56MXcwWTMrL2hvNFNYL0k1V1lwMXhLL0FNUG8vbTlaOU5mUGdN?=
 =?utf-8?B?ZVhjUzJCV21tQ1RISjQxdmJoOUFVcXZkWU5kb2Jacms4dDh3ay9LOC8wR21I?=
 =?utf-8?B?by9wMno1ZjBEckRVbU16cWw5aERlNm1Ra1hTS2hkYm1xZGVyTkNhdFFVN2Ur?=
 =?utf-8?B?bGhOMnArYUx5eVpLY3BucVM2c3puZnlQZ0swbFdzcDZFZXgxbTBUb3N0Q3ZP?=
 =?utf-8?B?SjFQeHJ0dUdxS29oMTN3a2x0SkZBTkNjL0xiNmRMaFV3RzBuVS9HOUlJM1M4?=
 =?utf-8?B?K20vZE54QlAwc1JrMEhnOE5xQkgycUduWW9LS1IveWxTMk5YWk92c1BCS01J?=
 =?utf-8?B?d1VYRVJrdWp0ME5nWjFnNVIzaDh3YjBmWEZRMHVOL1dJOGlXUjZEZXRsZjE3?=
 =?utf-8?B?SXBXa0JsZ0pFSVZCZ0QzZDVZekFpeE8yK2NZSUR2NmhNeTN5S085R0w3NjVU?=
 =?utf-8?B?RkgvTFQ5Rk1XTVNlUVlSQnR3UTVjZzJlUlF0TjcyUllwRktiS3kzQy83ZEhj?=
 =?utf-8?B?bHJHRWVIcmsyQ2R5K3Yrbm9EazFmdC9lL2VUZ0lkdEFaN3RiTGRwd0EzS05W?=
 =?utf-8?B?QWNIM1N5Nk5WaDZIMFdJVWlHajF2QVJUcFRFTEQ3RFpPWUtOWlR6TXdHWkNM?=
 =?utf-8?B?aXlXTndTbGpnbVlmNXFEQTlQcjlieDhvNzY3UVFKSzhWaStodEU5N3JyaE14?=
 =?utf-8?Q?bH2jQ6kdAprpkre8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaabedb2-182f-44a8-a513-08deb59a4d9d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 11:32:26.6029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aaCA8lWH8Y84pLKOjwkDz7PJvNvOSd5AkEJSkx+e8yC1bAO3FTjM/J2e8t+qbCoKTQpOBvORump7616ST5nmQPrcUPJmGgnN2+SrixK77/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5828
X-purgate-ID: tlsNG-33051d/1779190350-38D73938-BA4EA418/10/73395122804
X-purgate-type: spam
X-purgate-size: 2987
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,suse.com];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:baptiste.le-duc@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:mid,citrix.com:dkim];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DEB8757DADF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 12:22 pm, Oleksii Kurochko wrote:
>
>
> On 5/19/26 12:55 PM, Oleksii Kurochko wrote:
>>
>>
>> On 5/19/26 11:37 AM, Jan Beulich wrote:
>>> On 19.05.2026 10:39, Oleksii Kurochko wrote:
>>>> vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot
>>>> inside
>>>> the domain's shared_info page for vcpus with id <
>>>> XEN_LEGACY_MAX_VCPUS,
>>>> and falls back to dummy_vcpu_info for vcpus beyond that limit.
>>>>
>>>> However, it does not guard against d->shared_info being NULL.  The
>>>> shared_info() macro expands to a member access through d->shared_info,
>>>> so when an architecture does not allocate a shared_info page the
>>>> dereference triggers UBSAN:
>>>>    UBSAN: Undefined behaviour in common/domain.c:325:10
>>>>    member access within null pointer of type 'struct shared_info_t'
>>>>
>>>> Extend the existing fallback condition to also cover the case where no
>>>> shared_info page has been allocated, mapping the vcpu to
>>>> dummy_vcpu_info
>>>> instead. This is the correct behaviour: dummy_vcpu_info already serves
>>>> as the safe stand-in for vcpus that have no usable shared_info slot.
>>>>
>>>> Fixes: 295514ff75506 ("common: convert vCPU info area registration")
>>>
>>> I question this, largely (but not only) because I also ...
>>>
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>>>> ---
>>>> RISC-V does not allocate a shared_info page at the momemnt because its
>>>> guests run in dom0less mode and do not use the Xen PV ABI, so
>>>> d->shared_info remains NULL throughout domain lifetime.
>>>
>>> ... question this mode of operation. Yes, you may (for now) be able
>>> to get
>>> away without, but e.g. event channels will want supporting at some
>>> point.
>>> Which will require a shared info page. Better put that in place
>>> right away,
>>> even if the guests you test with don't use it (yet). Certain other
>>> common
>>> code also assumes d->shared_info to never be NULL for an alive domain.
>>>
>>
>> Would it be fine than to allocate it in arch_domain_create() ... :
>>
>>      if ( (d->shared_info = alloc_xenheap_pages(0, 0)) == NULL )
>>          goto fail;
>>
>>      clear_page(d->shared_info);
>>
>> ... but without calling share_xen_page_with_guest() after that
>> allocation as share_xen_page_with_guest() isn't implemented at the
>> moment?
>
> Or could it be an option for all arch-s move allocation of
> d->shared_info to domain_create() in common just after
> arch_domain_create()?
>
> The only question if share_xen_page_with_guest() could be ifdef-ed
> somehow so not to block new ports to implement it from the start.

shared_info is an x86-PV-ism which escaped into HVM and then infected
ARM too.

Sadly it's ABI there, but this is one of many areas where I really want
RISC-V not to inherit the mistakes of prior ports.

~Andrew

