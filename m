Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A16BC9C3E60
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 13:22:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833686.1248873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tATQJ-0005oM-K4; Mon, 11 Nov 2024 12:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833686.1248873; Mon, 11 Nov 2024 12:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tATQJ-0005mG-GM; Mon, 11 Nov 2024 12:21:39 +0000
Received: by outflank-mailman (input) for mailman id 833686;
 Mon, 11 Nov 2024 12:21:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MjDS=SG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tATQI-0005kw-Dx
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 12:21:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20616.outbound.protection.outlook.com
 [2a01:111:f403:2613::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7df29a84-a027-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 13:21:35 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB9143.eurprd03.prod.outlook.com
 (2603:10a6:20b:5b2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 12:21:32 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%6]) with mapi id 15.20.8137.022; Mon, 11 Nov 2024
 12:21:32 +0000
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
X-Inumbo-ID: 7df29a84-a027-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMzo6NjE2IiwiaGVsbyI6IkVVUjA1LVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjdkZjI5YTg0LWEwMjctMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzI3Njk1LjMxMTMyNSwic2VuZGVyIjoibXlreXRhX3BvdHVyYWlAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2o8hIv5NurcgJ4n94VgSV/JsdqY2hioKVk9/CQq5SVwsjX/5NwNocIJ7FjmjtrEJ8Tj6MFXwPAYpjR6nDJCb+u02sfgs51DvDMB/GiuisIXG/ZECqytUXZbc/KYP+UZpGmi+0hhiq/Qgcmz+bikFttCNP/bas/rXaH0zX/KpCkDz7HZbyyhLyCUSZdr1onne31lp8u5MG+Ip0j/WQAKMmYfmB4zTUPLXMnmYbWvjQON3fqehmzcM/1d7s+axEONrNuK010B9PVbLegxDgI1uM5V2LcStaUHP6DygJ9/50n/2sFgND5W/N1jDvA6gKaphqOhmHixlqAYzKI+35g6Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xr+91tTKpUbVd+SK71h0guGfK6SqdYIMAO319HNtcK8=;
 b=nBitSAihMJOHDAGeqesdDnQm8cBZfrHntS1D1WlAcILKFSvOEqV54MHVNW0yyjz4flVzxwrXLCK4NN8YFMS9duNx6Qi7tJ9Zmzrj743jra2fcLSPym7PUL1phFnF6i0K75Xgps4sq24TQWxiTcP/tzAdnIFP+vgi4K6oz/uQT8gUukFu3g6SzUwpI0kuCZF8QrDqHcRJH0qjOuBkrWPGvvRIazMvAZ2GhYpOTblmUnyBeJRYZJgp4XHo7OWw2kTT2xj2h/ZM3hGLxXcR/ofE4vrNVax1F86PnozQqlNE+LUMDt5JYY4KafLWYt7qMCaChsVGn0kTtIHcsRc1jNLD3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xr+91tTKpUbVd+SK71h0guGfK6SqdYIMAO319HNtcK8=;
 b=TWOWeLa7rRVKHFXr2q96Jf1/LKyWQvAXPlC4KGVE+qV2uQHKdgkzIW5cYm/1KRKhZyzz4ldV03kTZxKu9jFDTiLbKIr1l1KZQl2Qf80kS6hN+2+hcgXgtrE7or5+XSXnERSRFTTyAu228y1fH0gSrTfmMe4js63HnPuAhd7PsUmvbOvFuZ6uvKsGc+PrXIP57d7Bjn/W0BYNG+EkrJHFxBt9jEB+ThhAIbi1JuVotUkxD8+pc2ZxnMGLMAdlocGZAI4U1baOq5fxDq6gZi5ouwTQlkl33QwfVvdJTeG+OO6rEqJw38f5nh2kZWa2neLoAe8mqQRYW/UuJIKcRQfrsg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] xen/vpci: Fix UB in mask_write
Thread-Topic: [XEN PATCH] xen/vpci: Fix UB in mask_write
Thread-Index:
 AQHbMCKf4QVge+H9k02dX4ZlwzpGqLKp9EiAgAACIoCAAChLAIAAD1kAgAAEXgCAAB6ggIAABvkAgAewKgA=
Date: Mon, 11 Nov 2024 12:21:32 +0000
Message-ID: <f5d8396b-26a7-476d-9871-63f603b983bd@epam.com>
References:
 <559dfac91b8f097bc59c4de194fd2ae2b5b4144c.1730880005.git.mykyta_poturai@epam.com>
 <ZyswF4grJSNcVqY_@macbook> <Zysx4ZwCUv62uTBw@macbook>
 <6d3f322f-7047-4033-95b5-86751a58cc70@suse.com>
 <65d2043f-5e6f-4d84-8241-eb28dd94fc45@epam.com> <ZytkOP_7nmeSVEYH@macbook>
 <7c57371b-803a-418b-97cb-55e79516eed4@epam.com> <ZyuDwnYj5-uCWrMy@macbook>
In-Reply-To: <ZyuDwnYj5-uCWrMy@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB9143:EE_
x-ms-office365-filtering-correlation-id: 10fd638a-7915-4035-ca9a-08dd024b60bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SGFsRXVGcTdzUkU5WW9GT3A1eFIrTEFzbktBTTNic0R5WEs0UVNJVTNJV3hE?=
 =?utf-8?B?QWh4bnRENmJVT1kvOVd5ZXhKbzk5Y2hyY3IwU0lRN1BiY3NQZkRxVzg3a3Qw?=
 =?utf-8?B?NmZsbG4vOG9mTndIeE9SRWdOZitWZjI4cjFLVnNiSWVRaXYwQXJjazFjV2xW?=
 =?utf-8?B?VVppMVRGaXVJWE5FSnBGRVdrcW0zN0UyK0ZhR01FQkVjN2ZtL3pzTFVJTzlX?=
 =?utf-8?B?cjVLY1lSRzZVakUyN0czTUgrbmlMQXlUTVB2Mkpta29ZMUIvMFBZMEZHZlJu?=
 =?utf-8?B?cFpON2ZRRFA3NDErMHN3Y2lUekhILzZmYW5IdWwwMnZ6bU5aeUhXVUtlck5x?=
 =?utf-8?B?MmIxRUZXTWY5QmxzbkFmZTI3MlVxSUhmeGdYdldaWS9PS3d2RHppZkRPL0hD?=
 =?utf-8?B?TXkxOTF5WjI1OG9TY3huL2xld04zb0crSlNyaHQ2VlBWb1o0MU5iMTg4cFVS?=
 =?utf-8?B?dktlNXk0MXBNbFlUZmtwcUs5V0o5WXd5NFJDc1JGK2JiQjhVVnpMU29ZL1hT?=
 =?utf-8?B?a1pnQnNQcXJOTngxVC9weDNPREdDRit0QWpBZVV6d3pvM2VmaWVqOFNVWjFY?=
 =?utf-8?B?YTJoODJ2cUtUR2VZQ1Q0QVlZWHAyQkJ6Sm9LVHpQWjZVSFNsOHV2bkc5REV0?=
 =?utf-8?B?dEpoNDN1T0F0eHdSNWM3V3ZSVUlZLzVBM1dtNnVGOGx5YnpVZ0cvbDZPRlVQ?=
 =?utf-8?B?RmVaNERiYlJwakpJNVRQdld6WExVWGMwa1Bob0R4UCtmQ0NyTjk4cGpoci9W?=
 =?utf-8?B?alI3NlNpc1FxV0ltRlNCRTVWQjFQeUxoL1N0Tm5rVjhSNXpYWFNTaDBUdnVs?=
 =?utf-8?B?S2dkT0ppNElVVzRyMEVHK3I0TVczaGxuWlhuY0F6bVZ2bFA2ZDBuR29pRFBB?=
 =?utf-8?B?dU41akxoY25lL0tKSlZ6MXhaNHBTQ3Mza1FJVm9IOSt1U0FmSUMxc0Rrb010?=
 =?utf-8?B?QkZ3U052QUVodE1XOHRmQjBSYm1YYm91NEQrcWV0TW4ya3hoNFFiUVYyaFN5?=
 =?utf-8?B?MHAwZW53SGV6OGo1YjFGbmcvYWdEK3Fxc3RQYjk4S2JmOWJYT3BYWjdZcnlm?=
 =?utf-8?B?b1A5Z3ZscUx6VURTV2NPbzZpQmVzc2JWMXdTeG5hNlhuOUp6bUZmTWZ2V3Ri?=
 =?utf-8?B?NzdKcGc0NmR5SWpSRXdsbFQ4RGZrUWFEQzBZK0FMWmhXL2hWRUVMS0VsYVdx?=
 =?utf-8?B?QzFPRlJLbDZTY0xHcFJXbGZaQUplWUczYjNhYzZCWUc5VFVDVU9qbHNnSVFy?=
 =?utf-8?B?ZkFXa0tUdzR2N2p3VEZQMmhqbTFOVm9SZWJnalJhdE0zUkw3ak5WdUdQSWlv?=
 =?utf-8?B?dENEdlptWjZubkRVWGRENC9RaGFzN3hSQTFLdFViTGtvanlIdlp4MGJvUU5W?=
 =?utf-8?B?Tld0S3EvZlZXQ2EzNk01RWxYRC9TNnJ6b1BLZndBTE9BL1BNNlJjWmVEUGpi?=
 =?utf-8?B?c21icEhHWHNNSjIwc2x5YTZZMDdaMlUzRVQ4aHZPVCtqeVlPT2tET2Z5aURu?=
 =?utf-8?B?a0pQSFZxSVNzR1J3Q0VjcFVTYk4venhvWnp4Y0ZnZkFVMldXVVd3K1FyR1d4?=
 =?utf-8?B?dGgzejF1SXAyU2FiSDhoYjNFdzNpMzl5RlpzelgvYkZ3VUNTZlZzeWRqK1Vw?=
 =?utf-8?B?b0JhZDJ5NnpRY29LTURxWWY5SnhRVmVvTmhuNkg4RkRJUVRwWjByLzZudVZW?=
 =?utf-8?B?cy9YM0V5bkZkYlpjZStoK1ozNXE5aEoyQkJhQzdTR2t2Zi84Qk9hcml5eGRz?=
 =?utf-8?B?VFM5OS9Ea3c3SmlOb1dFd2lsRkkrVnZCSDJvLzc3WjBBcFViaUR4S0lTMkY0?=
 =?utf-8?Q?SydI0G8p0niffq3eiuS7m1w1qMYpS5rBlT0z0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S1FLbFBrWkxsdG9abzg0Nyt4ZmhYdllqTWJlTVVUWThQZkhQMk0vN01oNEkx?=
 =?utf-8?B?MGZDV2h1VDFXWHBpQnd0TGZ1dVV3MWpRMEYxN1pKeWovRDFqV2JNSnhhQmsv?=
 =?utf-8?B?RnBWdGEwcFJ3NEZad1N5c2ZJLy9VK1FQeFdXcHcycUgrUWdDOGZaM2N0ekEw?=
 =?utf-8?B?WmJzd0tBMVJvWDBEOGU4dk1OczB0bVJ1YXcwZXo0eXhIbXJpSzY2ZzR4eUwx?=
 =?utf-8?B?UCs5ZS9sbjhRcUNEckJSR3l1dm9FaDRzN09xRXdQbWkwZEJ2U0Z6TkxHR0Rn?=
 =?utf-8?B?YzlvaFA5NDhPNGJBVm5Ja0FIL2RuQ0NSSmh0UVhjaVNPMkNZWi9saWNjaVVx?=
 =?utf-8?B?bVVKUDhtbmdtdUd1UzFhU3pnb1lGSlZZTElhVkVFTzNrdDNSaGlxRElWZnFv?=
 =?utf-8?B?eGh3MGxUL1dKWVpjdk5XOElzNUY2b2Rmd2N3Vm5ybXNsem9wZVFaYTFXTysx?=
 =?utf-8?B?Z3B5emwwRS93QzZRRTErYnV0bEI4eWJraXUyaTkyMmZLV2Q3c29SZmt2bzkw?=
 =?utf-8?B?TnMwUU5BK2dockFSQzFoRWthbmtkMXlsbXVrVm51NlJlbDFqOEE1YmY0cnpj?=
 =?utf-8?B?bUgxNDdOWXpycWo4UFFwOWlJUXJSNjB1RW1FOER4aVNzODBVWVlSWGVwcVpW?=
 =?utf-8?B?MzVQMC85TUZWMXNQV3oyUVBLZkJMWFFoWk1qZ1FZVHB5UUswODk0dTRhcDNs?=
 =?utf-8?B?ZTBESml5QnYwV0JFV0IxUWtEelZ0Q3NsSmZrSVRhRDNzOVR5bHhHejVNbFV4?=
 =?utf-8?B?S1duMDFCV1F0aXFuanBjVzZCYW1vUVUzMXB1eE9yQlRISjA4Zk9YQ3hsc2NE?=
 =?utf-8?B?QXMyWXZxaUo1L3drcG1reEJxRG9EQUpNTlBGK0tmOVNvRVV5a0NzMFlNYk5B?=
 =?utf-8?B?blhHNXZzdDFQaUJySTFGak82aUo2ZmtDNmFPUTgvMkQ0NkVDL2lQWHlsR2NN?=
 =?utf-8?B?aURJTkkrVHRJWUxhTkdCaXhJd1p1RDJxUWFJTVl5N29oRkdndnVuQ2tuTjJj?=
 =?utf-8?B?cnZtbTdXa0pBYlNrMEVZeTNNWFFLTlU0LzZPQ0VTazg4RkI1Z2xJSW9SZW9V?=
 =?utf-8?B?YVJyaDlnNHQ3ZWxOemdSRzhkNU5tb1R4Wko5aFozVzlqS3VCbkhIMSs1OVpN?=
 =?utf-8?B?TkpNRTZXWFlnVWRQdHl2Y1l2RUw0bjVqRzg0a2hGM2ZaUitzNWZyaW05MGJD?=
 =?utf-8?B?NU1YL0FYZ2lTNHNER1dhamhEbzdUTUtzZlh5bnpMZWhCdWNKNnB5ZWM5YkZl?=
 =?utf-8?B?RjlWSTI0cDlocEpubWFnSG5YRFQ4VDZuclc3YkxPcUVZT0FseGcwTXE4Q3hU?=
 =?utf-8?B?b3ptd29qMkltWUFIbUxmU2tGNzBVTGlmMmdZNjhDdGtnRjJOeTBsOVBJODBW?=
 =?utf-8?B?R1czVysrZmZvQVF4V21pWVR2KzQwSkxsZkJsOHA2eUFvMDR3VmJRdXpLeC9q?=
 =?utf-8?B?WWZncURhc3lpWG1vYzhESnNMYVNuNStpNGxXZXRKWUhPcE5LYzVwelg5bEFo?=
 =?utf-8?B?TFlHRU9rcFEvd1JWT2VSWnZiUWdNV2RYRTZsZEt5b05qYWp3dWxIeFhJTnh4?=
 =?utf-8?B?eFpOWWc4Ync4andQbWpxYUlZekFJWnlMbXYyNHQ2QVNnSnlnNkZ3NkhSekls?=
 =?utf-8?B?UTlkSWM5OXlRSkJVd1h4Rm5UNzFvdXMxUVJZU3I5RzhtVmJaN3lkNEMxM3R0?=
 =?utf-8?B?YVNxaS81di9YUW9CNFI3a1o2aTRQOHBtNkdkalFxVEx0R2hjL0FNT1BGRkUv?=
 =?utf-8?B?VmxrZXZSK1o5UEw2ZUxhaXAvNG5tcS9WZk51TE9BeHRiUFIwc3FnK1I4ZUVC?=
 =?utf-8?B?ZTRyamN4cGJ1d2Y5U294TzVIVzJhYWdzTzZrK242VWd0N0tVcDBTait0MXpu?=
 =?utf-8?B?d2J1aThNVU42L1ByME5lUi9zTWxPRkRjUXo3NTN4bnVPdlZSQjM4VVRzS3E2?=
 =?utf-8?B?dDBQRVlBMWZ5OERrc21IMFdFT0EzOFIzZ3BxdkM5LzJoOFFMdzQya1craEls?=
 =?utf-8?B?Y0pONStFTU50WGxxdGVQVDZiSVROM29mSklHc2p5S1BtbXRoWjA4MTV0dXp2?=
 =?utf-8?B?bnJYMXFnNEkxZHM5cGRvaklPaXY1cXVDL0pqR3RQSnJQU3p5RFpjRHJzYUhN?=
 =?utf-8?B?d2dGRlBwV1FhRjhCR3MyOVlLMWkrNDA1M1ppNGZrQmZaZ0RQK3VrR0NSc1pa?=
 =?utf-8?B?bXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D6E2148129E73438A13EEE8EC69FA19@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10fd638a-7915-4035-ca9a-08dd024b60bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2024 12:21:32.5282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NlQVBMLwvklmICUESRwbgFXe38H8UHeK2omGoT//QkFz8PDNJIP2kZ+Vx5Q5phCpYFdNRI4zqec2KT7hZYcfrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9143

T24gMDYuMTEuMjQgMTY6NTcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IA0KPiBMZXQncyB0
cnkgdG8gZmlndXJlIG91dCB3aGF0IGNhdXNlcyBtc2lfbWF4dmVjIHRvIGJlIDAgaW4geW91ciBj
YXNlDQo+IGFuZCB0aGVuIHdlIGNhbiBzZWUgaG93IHRvIGJldHRlciBkZXRlY3QgdGhpcy4gIElm
IG1zaV9tYXh2ZWMgbmVlZHMgdG8NCj4gYmUgY2hlY2tlZCBpdCBzaG91bGQgbGlrZWx5IGJlIGRv
bmUgaW4gaW5pdF9tc2koKS4NCj4gDQo+IFJlZ2FyZHMsIFJvZ2VyLg0KDQpIaSBldmVyeW9uZSwN
ClNvIEkgaGF2ZSBkb25lIHNvbWUgbW9yZSBpbnZlc3RpZ2F0aW9ucywgYW5kIEkgdGhpbmsgaXQg
ZmluYWxseSBtYWtlcyANCnNlbnNlLiBUaGUgcmVhbCBjYXVzZSBvZiBteSBjcmFzaGVzIHdhcyBh
IGxvbmctc3RhbmRpbmcgYnVnIGluIHlldCB0byBiZSANCnVwc3RyZWFtZWQgdnBjaSBwYXRjaGVz
IHdoZXJlIHRoZSByZWdpc3RlciB2YWx1ZSBhbmQgb2Zmc2V0IHdlcmUgc3dhcHBlZCANCmJ5IG1p
c3Rha2UuIEFuZCB0aGlzIGJ1ZyB3YXMgaGlkZGVuIGZvciBhIGxvbmcgdGltZSBiZWNhdXNlIG1h
c2tfd3JpdGUgDQpza2lwcGVkIGFjdHVhbGx5IGRvaW5nIGFueXRoaW5nLCByZXNwZWN0aW5nIHZl
Y3RvcnMgPSAwLCBzbyBJIGZhaWxlZCB0byANCnNwb3QgaXQgZnJvbSB0aGUgZ2V0LWdvLg0KDQpS
ZWdhcmRpbmcgbXNpX21heHZlYyB0aGVyZSBzZWVtcyB0byBiZSBhbiBpbXBsaWNpdCBkZXBlbmRl
bmN5IGJldHdlZW4gDQpDT05GSUdfSEFTX1ZQQ0kgYW5kIENPTkZJR19IQVNfUENJX01TSS4gSWYg
SEFTX1BDSV9NU0k9biwgdGhlbiANCnBkZXZfbXNpX2luaXQgZ2V0cyByZXBsYWNlZCB3aXRoIGEg
c3R1YiBhbmQgbXNpX21heHZlYyByZW1haW5zIDAsIGJ1dCBpdCANCmlzIHN0aWxsIHVzZWQgaW4g
Y29udHJvbF93cml0ZSB1bmNvbmRpdGlvbmFsbHkuDQoNCkkgc2VlIHR3byBwb3NzaWJsZSBzb2x1
dGlvbnMgdG8gdGhpczogZWl0aGVyIGFkZGluZyBhbiBleHBsaWNpdCANCmRlcGVuZGVuY3kgb3Is
IGlmIG1zaV9tYXh2ZWMgY2FuJ3QgYmUgMCBhbnl3YXksIGFsd2F5cyBpbml0aWFsaXppbmcgaXQg
DQp0byAxLiBCdXQgSSBhbSBub3Qgc3VyZSB3aGljaCBvbmUgaXMgYmV0dGVyLg0KDQpNeWt5dGE=

