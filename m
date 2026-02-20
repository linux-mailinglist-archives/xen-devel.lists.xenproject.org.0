Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCzfOMR6mGnlJAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 16:16:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F25168D07
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 16:16:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237263.1539642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtSEk-0005xX-M7; Fri, 20 Feb 2026 15:16:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237263.1539642; Fri, 20 Feb 2026 15:16:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtSEk-0005w9-Ih; Fri, 20 Feb 2026 15:16:10 +0000
Received: by outflank-mailman (input) for mailman id 1237263;
 Fri, 20 Feb 2026 15:16:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rFK=AY=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vtSEi-0005tw-H9
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 15:16:08 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 134cf66f-0e6f-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 16:16:06 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by BLAPR03MB5603.namprd03.prod.outlook.com (2603:10b6:208:29b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 20 Feb
 2026 15:16:01 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 15:16:01 +0000
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
X-Inumbo-ID: 134cf66f-0e6f-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQKEjY+Il9z3jsjfQHToHRnphTNeZV0OOqIpmvmBkfIbVibkZo3aJSWhLfjsBgtXtGCRjoSU4gBIF9cWdCQsr0MIYtjGoPTVJVmBgkQu+g5ZJQh6tustQDRPzPM6ndmasdYJdyCDgy2i6CJ2M4xaIQd3dhJlEpXpQBveQ+5jzZV1vnCs6YWeW05rKPufwlS9ertwtLBmOgEUjL0EtoVC2/HcIH+gdGFW+DkptBx+TkJWoht19XDAF+iQveafLZeixiX/PYlfSk+xoUrnUMgB40Rfok3KvYgYoAL3MRJcSYire401YXf8tfhCIZCaBhZIgIubBKQB8aHa9KQDY5HeOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnAMwIXEOQS5x1d/x0X5GM1M9e9QKzI6y6Zq9KNIbq4=;
 b=v0XqWJMh6rfMRLQgetI7AfQl65ul04PDysER6ySSHN9ONpTC6K7knCA0s7O/7demQnHHMJkWjkiVMAS82urdWVo6FDizxbCe8PvD5f8rOubHrSWYmaiWMbaenwlJDWRenrChlemQP61CosXeOvFr/R1L4KdBXpN4mIQ1i86j69FLEZ5jHa3TgkDZq8iVLKwJzEIu+krTRtj50HzFfQDdI/skpD4Oh9hc9WbqzWF2ZaKItIZwmcQf0kDGeVheQwgdBm/hxx+gneN2eAMnGBgQGmGgEhV5uNcCCEkM6ZjukJ1wFnIjuZVRmyV0CfFlRemmZzEFYilQqgcKT+w9wrHywQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnAMwIXEOQS5x1d/x0X5GM1M9e9QKzI6y6Zq9KNIbq4=;
 b=vrJXkZ1NfCyOGDlR+6evkca56i9p/vnjWVY7jeNy+kBwfLBbGx1cYS9MAR/jQH/sI3d6lPMkSxLhlK/evOLTvkmAtES08x6x6et4C9I22xTep8Pi6R+nsusTHBacnUpNGuDwr/CpRi89iBdARX2p4yPgwPZECqN14Mfg8Lm+KPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bbf12b95-3d39-4624-98b2-60876bc42fe3@citrix.com>
Date: Fri, 20 Feb 2026 15:15:58 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v3 10/12] x86/shadow: make monitor table create/destroy
 more consistent
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
 <dee5be5d-a997-cd80-aa67-ca2f5c68bada@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <dee5be5d-a997-cd80-aa67-ca2f5c68bada@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0005.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::13) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|BLAPR03MB5603:EE_
X-MS-Office365-Filtering-Correlation-Id: ed8ee1ec-6536-41ce-658a-08de7092f4ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUYrZnJXTllmeGtYU2VXRTczTnJDdmZ0RUI2bHlaZ3NOczBSZjhPeDNMdmNB?=
 =?utf-8?B?Tm1TVk9GT1Fiajl6OGNxV0pZcUk5RnJxNkJtUU9oY2g3QWdpdlVpNzIxNGE2?=
 =?utf-8?B?STlKM2VEbGNvSEtyYWdZOWpIK0pFeEtkc3hLZ2hIYStScDAwd1N5elVmL0J0?=
 =?utf-8?B?YTBna2lmaTV3aGZvVmNwcWZJSVBWTEt4dDEzTEs5T0RlQUwyMlBLdkR3NDJN?=
 =?utf-8?B?MkVPRG9tOHVzVDZ6dVAxeDhtbXBGS29ZTDJxK25BTEtuRFl0WTVvcFNxUUwv?=
 =?utf-8?B?Q2x3QUVScWt3dmthdzZac2lpdmd0eWxROFdQNzdJN3dMOEpZQ29rU2NBZjZY?=
 =?utf-8?B?UWo5bTBHeW5YRXBuQXhIUnc3czBXcGphK1hid1dCTzlSRThCcWpvaGI1UStl?=
 =?utf-8?B?d0JkRXdhSW1ILy9oRkdyU1hBTGNqTWJHUVV4TkQ5YjhqblVWVEU1NUdGNXpK?=
 =?utf-8?B?ckF0eFpZU0lKRnU5eDlJV3d5YjVyaU84blpVQks4Z1ZLR3JXWVJ0Y1pNbVI1?=
 =?utf-8?B?Y3VaZUc4c0NxVm9HTFZFTyt6TXdRTVFlbHVGdGlZdzVJYkJqMkZZQWFwRUYz?=
 =?utf-8?B?RkhKaTQzU1UwbmZmUGFvNzZmZllYVlBtYXNKVVBiTUNIdzJYa1RSeHpDWFFG?=
 =?utf-8?B?NGNsdUFBbnY0SS9BMjFQbE9tMmJXSHhjQk9zMHVJNlRYTGNmOTdKdjZCcEFz?=
 =?utf-8?B?ZnBUcmNPVGZDWnZ2MjFiNDh5UGs5YWtyWGZPejhua3Q1c2svMnlVUzloTGJY?=
 =?utf-8?B?UGd6Q1MxemxqSUpKUDU5Mk1aWG56UlpkRkJiUDhKeUhhczF3akE0R1dDdlFr?=
 =?utf-8?B?cGhpcnVncnhYcUZ3RmdOanNXQU5YRFRoS1JySW1HZVFJRkI1T1RDVFB3NHF0?=
 =?utf-8?B?OSt0Z3JLZkd0UlBad0dMWDJKLzZoSXIydDFXZ0JSWm1zWUw1YVB3QXZlNUpx?=
 =?utf-8?B?Z3p1SU9CVDFDYTdteWROUUo0MW9hSDZ5OEE2cXViVmJyci84WXBMUFVhMFly?=
 =?utf-8?B?emZkQUNDZUFNUkdaNjVKZTRhYVVKd3JWdm5QamZXRU5ZMUd5MzNiRTc3TkhG?=
 =?utf-8?B?RlF6RUdHbTRTb09KVTg5ekZES1FuM2RITCtpa0JTNEx4QkR3OEFQYnlqdGtL?=
 =?utf-8?B?bDhnbS9aeDRXckQrNHhiOFB5WjU1amZvczZ3MlVZSG1yQzhiekJvTVFxZXc2?=
 =?utf-8?B?TENLdzR5aU9hemQ3OTNYRk5uWDVCajhvMHMyK0g3L1ZkblRrWHdQZEhHRXcv?=
 =?utf-8?B?RWZ2ZG9WTnpiQ1hVUjZLZmdsV24rWWdkKzFZOFNSTEFSOXpJSGYybk11RjNH?=
 =?utf-8?B?N3RSR3VmT3d1NWFBNUp1djY0UksvQ1NyNDZMY3FTakQ1MVVFM3BJODI3aTNK?=
 =?utf-8?B?aWRyT1BJdHpCZzhMQ1BRcDNpcmpLTWtqZFV2VmRRcmpKTjhraWx5b2xqZjJK?=
 =?utf-8?B?T2ZBZmYzR04yNHJWWFF6VWh0dzJVZnYrdTFUTU9PRFlSN3dpUGR2cmlZVGpI?=
 =?utf-8?B?bWZYSVVUc0RCdmxKZHcvaDJHR3lMZ0NwZ0c2amw0a3R3cmFPZkZsYnExb1k5?=
 =?utf-8?B?L1VqRXNVeFZQSXJ3UldsTDlJME9tdFRmQ3d1L0s5NERGa3dQTmZvOGFSQ0VV?=
 =?utf-8?B?NFVjd2lLZlNQOXZTZXM0NGpkVDNpQkwyMXRXUDJvanVsNERNelNQUlk4MHRB?=
 =?utf-8?B?UXhlVmJGV3hEOGV4REM0V3dHUWxvZ3FrUGlpRllwQUxRc3RXMHpIWVl0cjBx?=
 =?utf-8?B?c2gvTWNLZXJaU3piVkMvdWJjWUVWZUIyaE9qemtCdmhzRjRuaGJUQnZhZTlJ?=
 =?utf-8?B?ODVEeXgrbkt2ZXhFK3oyOUdmVzl0VmY3OGsxbTIwQzZXR3pvMVFza1RzRDcr?=
 =?utf-8?B?dk9UWFk1ZERzQWowZTk1eEdLZG9rR3ZVM2JNNXBlRXpoMWJ0QWpUOUNIbGlG?=
 =?utf-8?B?ejVyOWYxRlF2cHM5aGlwbnNGTzB0WnJQRzdNeTVSUEhlSGxNT0JwbWQyNG5v?=
 =?utf-8?B?SjIzTi9YTnNxS0pzcDM0YUZaNVRWYVQ4b1pyNmdaY2U1Uk5KR1owV0d6akJT?=
 =?utf-8?B?aXBQSVRNbDk2aDdFOGxkQWswYmU5V0k0cCtiZGZhdktvM3B4UVdZblFycTA5?=
 =?utf-8?Q?wDBE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3NFVmg1bWd1Y1o1ZmRrS3djdUc3bkNVaG55SDNoVkxxKzZVWWVPS1c1ak4y?=
 =?utf-8?B?RmhXVkdKWFczRGpnRjVVY0RuVDBzcWRlbThTTkdnYU90dnBaU2s4ZjNteTRW?=
 =?utf-8?B?REJOZHdldGRaRldXVndnR1YrU2JBbUEyWitrZjJtd1Q4VXBURUtmclk1UzJ5?=
 =?utf-8?B?a21oekZHU1ZkajBEak1rVWN1bzlyUlVRNGxuazlyblpXS0N4dnVacUNEdFJZ?=
 =?utf-8?B?QXlZUEMzd0JEWDgvaVh4NnBPT1I1dkpzSmdZTWtpc1NzNExQY3ZqUHp2dnBW?=
 =?utf-8?B?VVZMdmtUeGsvcGJSaUErNGNBTGN6RFVqZ0ZJVm13dkJvWURPR0xhTi9xaEl0?=
 =?utf-8?B?N2ZFVWpNcmp4eTNMU3VHdUlPWXVSUi8xSXdzSnNHckNEK2FEVUtPeTBWanVx?=
 =?utf-8?B?WmIydkxuRXU2eWxMZ2F1WU5EbmJPa3RwYkJtNGZCN2ZFMVE2NjAzd1lTeFRN?=
 =?utf-8?B?N01VcllCMFJXTm9La1l0T0ZRVHMvNisvUGVzUkxUL3pTbzhzMGV1amZXaW1K?=
 =?utf-8?B?MnBpallwb1V1Smg5ei9BOW96VEl3MDNyU0p2aThPbGFkdmZnSnJjWTJYUEpU?=
 =?utf-8?B?QXlCT2RLSm5WZDdhMHBSZXpwMkdCbkVMSkJ6UUFreDQybnBZTGpBbTFYNmV4?=
 =?utf-8?B?YkV4bjNYVEwzSUN1aTZJQmttbXlZaitDR0cvNkpUcFZ1emdISDJXMmFIa3Bl?=
 =?utf-8?B?WmNFZkh6M0VZZmRoakNVQVRBWTY5Yll1YTRiVHFxdnpwNGtsYXRjM2RVWlBJ?=
 =?utf-8?B?SzdwdlJPemg5WXNQMEtnY0JObkpUVERldVhSZ2NXVTNEVHdJNW9qZXczc3Rt?=
 =?utf-8?B?RndqTXFnUlYwc1piN2VoT1lrb0JUOEpjR093ckdrTkVhVFp4UzBaa0grRTJG?=
 =?utf-8?B?UmhtcExrM2YyVWg0MzVaSkNXMlc5ZzBSM0NCUDk2VkdsUXVOTkVJWnNtaEpX?=
 =?utf-8?B?OGdiTVlSNW5DS01paDVONk5MZG4xYjhqNUsycFhBNm5ENVJhUG5tblJvZEtQ?=
 =?utf-8?B?SE5pWUJYbThvdVkwdWNldDRrZDdOWW04aFNBZCtpaTd0aWwrSitvbG85VVlp?=
 =?utf-8?B?MUovMjhlL3h3SFhLUlEyS0NKUmFCOEsrZEdhdmNCVGJjUXJOU2hwWU5xeUg0?=
 =?utf-8?B?U1pzUDE5S2N6UDY1YlVYanpwYkdBS0ErMEdYeDd3c3RkUzNaNFBKeDlxYTBL?=
 =?utf-8?B?c3YxQnNvMnRTaGgrcDZRN1ZKY3AwVWNnVlp6bkRPQ2VhQWhjMlhsWW5VRjR2?=
 =?utf-8?B?Qms4UWVyeENkN2kzSHlnRk1VQVBHakRpMWFDZkgxTXcwbUNSTkFFWG83QkZ2?=
 =?utf-8?B?VllRWVVqTnkrN1hDa0lHVXZWOXYyaCtTbWpodXNIOEtQdG40YlNCMzAwb1Mv?=
 =?utf-8?B?MGNnOHJoSFVEempPK1h1MGlNVWVNSnVHRjZ3MUJmQ0lrd2ttWW5mRzZqOVJy?=
 =?utf-8?B?aVpDdHdyc05lYWw2cHNGelVCRTU0S3FvaUorSWEySFJPRGw3M1JLVE9nQjlw?=
 =?utf-8?B?WkNHQU85VTZOZUIyMXdKQUxaY1E3M2VMZXRRaTFxSFY5YzFGU0d5VkhZeW9q?=
 =?utf-8?B?T1piaWlpU2N4c080MjRTb256RzdqemRneWUvN3picmNRclFjTk9Uc2cxcWZ6?=
 =?utf-8?B?VzhxYjNvM3MrS3NWZFdGekhqUXlhdmpLWkZsUnBCSStrR1hLY3lHMk1PR3Zp?=
 =?utf-8?B?TkVPNEpHMVkrNTVLS2JVYUgza0E1ZmRFUGFHUmdnN2pVcmpBUGtNcGdvdk9D?=
 =?utf-8?B?eVVxRFhjeSt1Q2YyZlFtY3g1VGtMa1E1N0JSYllXVTNLQ0hyci84K0pPdTNV?=
 =?utf-8?B?R1N2b3ZpNnhPZDg5QUlXSFVQNEphVXhoa3BKWVVFMGZ0bzFoY01RQTZKQ2VZ?=
 =?utf-8?B?MTd3aU9oeFhIUGx1ZFhMNFJMWFByTVQ4eEZySUlLK2F0VVR4Q2VBVHltNW52?=
 =?utf-8?B?OVBUYTJoVlZhRk12ZVBPdDUxdTNiK0loVU9VeU1NM2l3UWc1VUJ1aml1Y1Uz?=
 =?utf-8?B?R1J2VFcwQVkvUkhVWXRicm1zei9oRTNpSEZsMmptMGJ6V3M1R0FkQkM2UnlC?=
 =?utf-8?B?QnVhTEk0dGhaOEQ2ZzhKNWIyYU11azZXK3VldEhlNy9tSFlZaTVHTUQzWEpi?=
 =?utf-8?B?ei9iS0hqZWlGemxEWmFJY3d3MW9FSVB2WGNCMWZLajVTMU1lQVo5MTUyYTJW?=
 =?utf-8?B?dndDWEZDZkE5RW1IWEtOc3cyZzNUMnlqR3ZvcFhLS2dxbFQ4b1gxTURyajNn?=
 =?utf-8?B?Z3AzYy9XU3ZxeHRIak44dUk1QzdLK0tuZjNZeXlCbWJWUGMzOXNEL0hmZ2pW?=
 =?utf-8?B?TnU4azBwQnBoY05BUUVpNGVJMVozL2s4RDZVMkl1OWpNM3VLLy9TalBDbjJB?=
 =?utf-8?Q?kn0tQ092SFtzeIsA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed8ee1ec-6536-41ce-658a-08de7092f4ff
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 15:16:01.1730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GnNEXpygelNWJPnATQpy8coAVru1HmTla7/ZmZEc03jp5i7dzaBtEoj2O4wf1xzHweAoxg6w2Fz+p8KB4pDew6StMV+Ix+jkeagJEHB0Hz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5603
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:wl@xen.org,m:roger.pau@citrix.com,m:george.dunlap@citrix.com,m:tim@xen.org,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 59F25168D07
X-Rspamd-Action: no action

On 16/05/2023 8:41 am, Jan Beulich wrote:
> While benign at present, it is still a little fragile to operate on a
> wrong "old_mode" value in sh_update_paging_modes(). This can happen when
> no monitor table was present initially - we'd create one for the new
> mode without updating old_mode. Correct this in two ways, each of which
> would be sufficient on its own: Once by adding "else" to the second of
> the involved if()s in the function, and then by setting the correct
> initial mode for HVM domains in shadow_vcpu_init().
>
> Further use the same predicate (paging_mode_external()) consistently
> when dealing with shadow mode init/update/cleanup, rather than a mix of
> is_hvm_vcpu() (init), is_hvm_domain() (update), and
> paging_mode_external() (cleanup).
>
> Finally drop a redundant is_hvm_domain() from inside the bigger if()
> (which is being converted to paging_mode_external()) in
> sh_update_paging_modes().
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

