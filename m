Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPdcGS0Jg2lLgwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 09:54:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DC3E35A1
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 09:54:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220231.1528940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnYdJ-0004nu-DL; Wed, 04 Feb 2026 08:53:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220231.1528940; Wed, 04 Feb 2026 08:53:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnYdJ-0004kn-AZ; Wed, 04 Feb 2026 08:53:09 +0000
Received: by outflank-mailman (input) for mailman id 1220231;
 Wed, 04 Feb 2026 08:53:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f40U=AI=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vnYdH-0004kh-Ha
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 08:53:07 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e91a2dc1-01a6-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 09:53:02 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DSWPR03MB989106.namprd03.prod.outlook.com (2603:10b6:8:35e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 08:52:59 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 08:52:59 +0000
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
X-Inumbo-ID: e91a2dc1-01a6-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2n477eoNcdo8yqC1oQxZhhEo0xebWOy0j7LF4VtQX9+mZ1o/udL7muhLtVn6dYtgS4kE30A/8IKQlfOCRreL9ltDv8PklU4YX/pHyV9Z6C785FCIcWviKt4Sq9UXcLPjkcubPlwcdtTPZ1eFINO6vHo5qc9NGt1I6+613Fn6hsDH210twAzXZPX7TZH/s1mYB7IxsJgAgQfHearT6BeJhr8YEQg1UYYf69T/IgKYzbJkYelPH0lRaAiACJK0LkjEsRiNs7agadm65SaOBKs3S5Fwkp4ewQv3AepC7ilrKX/bZKQg7GGHkuOI13brNWTsVaO+4arvkGISpb2O5g2YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQUqNzThM+++QWdMuml2lvMt1NkU4HlSkQhvbexpV8U=;
 b=bzAs2dGmcUZyXn0sP+hGwmeoa4sBHw95v6nzpmsP3uGPRb06MMBkgS5plQIrf4usdr6h63qSpxyjswSCl9+YEL82EBFVo8Fk5RvPKfSvO3FH8PCHhouXJ0FXkojIV+ZTw+xxvaZsLWLQADorV11F32O5YW8QIwQ+nlxnKeJlO9iM8y3d854EEvtjld/6Vcc4JLvv486sBvFJwCrO3QvWb4XhW6JTcO38kuN4TOCrWFCvfDlo7IzQqAIowGWJ8t62ikE8XNPDLHpLbEKXcXc+R00UEB0kWCA1teMPZl9He9by+iWxtkye1YWaKAsgTV77nrWVstgolPZFgzZb6T+L6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQUqNzThM+++QWdMuml2lvMt1NkU4HlSkQhvbexpV8U=;
 b=zPQJa7nQ1UVVQ/OouCOKgAruHB/Utv4FyM0Y2MQ3PhUFvM+CoXm7zLg4OtNQDHGBWuyUAiOZqL1fWOsGsJZjDHyj21/VUlWABjxAc9lkVI7tigdeq8E6GUwscH6bNct1n8PY/ov3pDMSKCW8ZD8ZzieGR5wuRf0x0ZIUgjyPVvA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Feb 2026 09:52:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/domain: adjust limitation on shared_info allocation
 below 4G
Message-ID: <aYMI6H7eq8SBG0Gv@Mac.lan>
References: <20260203101017.56962-1-roger.pau@citrix.com>
 <aYHL0CChPShMUtHw@Mac.lan>
 <b7c3ef89-6f5a-4062-8e16-091abcf9acd2@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7c3ef89-6f5a-4062-8e16-091abcf9acd2@citrix.com>
X-ClientProxiedBy: MR1P264CA0219.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DSWPR03MB989106:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a3d0f43-83ca-4978-3b90-08de63cacc2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2lvTHZHWE9GdUhGajF5c25QeGZTMm9GaVBJZjVkc3U2M2tiS09sWWRzM2F4?=
 =?utf-8?B?SVZmSkR4b3JaUVpSUnVwb1lSei9UdmtDNWl0dU1lRDAxYlZPa0p6U0NLVXZ2?=
 =?utf-8?B?bisyTU9sOW5aRTI3ZWJpdUxYa3d6TTlGMnowTXNFSHdyaHo5RjAyMzJQOTJF?=
 =?utf-8?B?OVRHbFZ2MGxSVUYxd3RiTU9taDY3a0E2cms4Z3hGT3Y1d2VROHBhekNnb1dh?=
 =?utf-8?B?NFJDRVVmcThGZEh2c2l3RjVwSlM0ei80ckFvY1hiVE5NMGZmZDVZM0FVVVZM?=
 =?utf-8?B?b1RzUjByOG5wa3ltbU1HOE04cVZONGY0OVBISFRZVnFCeERmRS9WRkQvaGdX?=
 =?utf-8?B?c3Y4V1J0NFgvUWQyS1VLYzU3RWlYOFB3WjJNMEVnaElmZUdGQkQ2dDcwRW41?=
 =?utf-8?B?d2dieDNwcVRoTmphVVpRYkNxK0VYWlJNUGRIVnJlV01KY2ZHeTFyZkhnK3Bi?=
 =?utf-8?B?am1oWHU3ZXlvcFJjUzZ2bnRzRTlkOEYzVU1xSTFhL0s1VUZDQjJra3BRenVU?=
 =?utf-8?B?UzhXZTBXblk3SVg0L1l4eFM2c0FnSUtoMnF0eWwxSlBMRXVOQXBhSGpZU05p?=
 =?utf-8?B?amV6MThodkw5R0FNNVdqYTJLSHBSUXBVU0JPRmIyVU5ZRkE1SU9OTWluMytX?=
 =?utf-8?B?b2NIWmdGYW9jbVlxQzlOcjh3NWQyWUdCbWVVVHorWHFHSXl4REJZWlRleEIy?=
 =?utf-8?B?YUtqYXE4bEJtcnd2STl6cmFwc3pIRTFIZ0FLbnRFVmtIZFpuellmRlhDQkli?=
 =?utf-8?B?K3JyUXVJa0RpUHdIU3lTeW52aGFDNm10dmJBRVNIa1dQSWQ1bG44REdUV1Bk?=
 =?utf-8?B?Q1NNV0ZTU0NIY1lRSUdKdGthVjVPSlNtNm1zK3A5TDI2ZWFqWE9IcjZyczB5?=
 =?utf-8?B?VGVXckxZMUY0VURpZjgwbnpOU1Fia01ib2x2dEdLbGJGMUljVGluK2ZXTHJr?=
 =?utf-8?B?bmQ4LzcvZUxjUStZZWNxd0RYNndiazd2WkNSQkV0WjEvSHE2b2lhOEpjcVZS?=
 =?utf-8?B?TDdiRTY5UEE2cHVmSExPcSt1UkRSM0xyQXh2ZnhLcHcvd2VZRVdrQ0dwMTJL?=
 =?utf-8?B?NGlaM3B3bHJvVzZyc2d4ZTlFUSt3MzJyNGZ0TWhHYVVzbnh3eWsyRWgvUlJR?=
 =?utf-8?B?MHBpRDh5RWpWdVhKQlBpM2hJVXlhMTNOUHAvTzBveCtzbWZpVlk0SVJjeTRx?=
 =?utf-8?B?cElNYnljQ2d5T3pneVRlZ0hueFFqY1l5YVk5UFJaMXpsTFdrbEw4VTZndFc5?=
 =?utf-8?B?ZGVYcm8yaHhKRVhvOWNhaU5UbGtzaDlLOWZFVEg5OUswaFZIVVpmSkdqZVBK?=
 =?utf-8?B?V1BZVUYxKzJuSnUwTU1NWHhaTGRtMFI2dnI5bUwyUlhRTVhvTmVMdkdvWXhi?=
 =?utf-8?B?dWhrdHhXU0thMm85bmR2Qm1KR2V2MkxibDNOdk5vQTE3R3JRMlRUL0RxUWgw?=
 =?utf-8?B?NnR2TjByajh6Q0JCRXFaaWx6cVptWjNrOURITGcrZmcrYmxVQk9iVkxMOHpT?=
 =?utf-8?B?RlMrUkFNcTNGTXdJUzRlazgzd2gzMktMaUlxSExERkF4eU5zRlZMMTZFNWRt?=
 =?utf-8?B?M2tnZlZsVUg4ZXRPKzFMcXJLMkxGRjYvWnVhUXlhY2IrOFB3T2trQnBTWnpD?=
 =?utf-8?B?OVdyeVRHakZUczI0aVZpbWlLaFNMY09QczRrZWZsSG1RNzZlcmxFcHdNUlhR?=
 =?utf-8?B?L3BEanViZlRyUmcySldxMTl4TGRDOEtpT2tJSyt0TkJwMUZ1ZmIxblJCNmNU?=
 =?utf-8?B?a2lWc3lQL1F0Nmt5Z1p0dlB0UXJDdjVrdVRHendDdElXZ3gvRlRvY1A0SGty?=
 =?utf-8?B?Z3lGa1AvT3RqT3UrUUZubmFTN0UvZ29CR2hTTHNMR0ozWGxaWUF2bm5wRjE2?=
 =?utf-8?B?c3hIWDZvSWptQ2dLcEwrUzc5TEhpZVEvM1l6Q01sYU9lTVRtNWpQQVAvYkFr?=
 =?utf-8?B?eGNNRkxBV3NwNzMvRGRvSXJxOWZlOUVpMndiOFh2elRMUDBpRHVMcm82aTRv?=
 =?utf-8?B?RXIxRXBqNXZkeGE5MHMzVC9velhWT25ub1RTQWJGMW9TT05Db21JT3R3Tytu?=
 =?utf-8?B?QzBCbFNlZGM1dUZEeElvWEIvRGRESW1WcWJrSG1qNmF3b0lXczJFODIxcjhH?=
 =?utf-8?Q?sbTs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0VTcWlnaEk0QWpzZCtidUkwV3ZwVUNldVRwVDRRSkRoQWE0MjNmNDJEa05T?=
 =?utf-8?B?RHlLTEZaVUM1YjFsVGVRVUVnYXNoVW1zUWhHUHJ1OUd4OWIwYU5YT0VpeXgy?=
 =?utf-8?B?TEw1dlRrbVd0WDgzcEF0YWhzdWE0dFVaZkYrOHZYSHoycDU2eUNuR3Q1RzRi?=
 =?utf-8?B?cmlvc1VGdC9IQVZrOURiOWhuVUMzQ2YyWlFJK29TU1poMDZpa0NEYmUwNmVJ?=
 =?utf-8?B?OVZzdi9Hdm5aQ2p6RUdOS2FqYWtLM3FWekhtTHFCUmc5V29PY3JIdGFLWGQy?=
 =?utf-8?B?ZEVrREdIc0dQUzFuaXZWVUdMWVZoTnBWaEhVQitJZmpsWVh3Y3NnVUxpVExM?=
 =?utf-8?B?dnNYL095R3ZqekxES0UxbE44bW9YOTJIdVhaRG5FUm5xYVRmT2FuUHo5eFBG?=
 =?utf-8?B?MlhsYkE1cEtSTWlhVWdPK1N2ek1EMC9ia21ESVo3Z2haUExmeG5yYldQdGR5?=
 =?utf-8?B?V0VPR3Y4Z3Z0NXVUZE1ic2xRZkNHWXBHMXJyTDE4a0hKSGIzcHpuSmZLdTdr?=
 =?utf-8?B?di9kL1RLalRWNElhVE5ZYjE1eGh2b1NMbGphNjNKRGd0NXpXYUNLT0JMU1NX?=
 =?utf-8?B?YTdVNHFVbi9BajI2SkZhVGt4Wm9OUk1sS3VBcDZRNXV5emVCczlJVEQ0cXlv?=
 =?utf-8?B?aVRLZlRFdUcxeFdVT1c1Nms5angzcUJqSHFXMGdVbjQxNjNSa0dDODhNTW9o?=
 =?utf-8?B?aFlmYndkelJnNGZqem4rRmUvVFhhYS85NnBrMWxrZGVvVXd5amlBVUl4aDVo?=
 =?utf-8?B?b2xmeWd5VkpUS1RjS0JHeFhrSGcweG9OT1UyQ2lmYis5dUtrT1F6Zmt6QTZP?=
 =?utf-8?B?RDF1cS9JekhKVFV4dEduSGJ5eWwzbVg4WGJPRW53cXkrSzBtSXZ0ZkhBWERq?=
 =?utf-8?B?VnVkZHVCUTQwWjVhcUx4UG83b0N4RTVIbitvNmw2OEtJeUlXRGZ0eWxPRnA4?=
 =?utf-8?B?YmVBTVpQMEY5L1UrTGFqTlZ1d0xqZFY4MTV4M0dYTlJOQVpXSlFMU2FaUlBP?=
 =?utf-8?B?VFR1bFE0RE5aaFYzZUhtN21vaTFWTXNnZUUrRlpvU3poKzNxUGNVajI0Z3Z0?=
 =?utf-8?B?SVl1MWV3S0xPMUJodFU5TXZjN0dRV0VjQjJ6ckdCREhqaVVPaGxtZTRHSmhj?=
 =?utf-8?B?bFA5ZXVUa29YOTdsREdiL3RVbmJQN2c1UGRhN1NDTnpRNkM0azQwN09TODVs?=
 =?utf-8?B?YWFOdldmSE5XM0E4RmgwTU9sTEllOUcxdDN5VFVqWm5UaTIzVHcxUjRZVzJm?=
 =?utf-8?B?YWUzK21McjVKN2doRVZ5MXJ3NlFvRVNKSmhIVkl1MlFyKzQ5eXBMN3FFOXdG?=
 =?utf-8?B?eTNqTlg0aXVaQUltOEFkWTloaEpkb1pZY3RUWFUvRzhSdzBQQWtpOUtYZTBr?=
 =?utf-8?B?UVUrZVRTRnlydnljWXZZMmhyRGtJNDBwYy9reFpGVkJ5UkV1V25kZXp3bHhr?=
 =?utf-8?B?My84Rm5SUm9EdkhRL2FjYTBDd3NpcU00UnltajJsTkdNTUE2b1dDUDdJbEpW?=
 =?utf-8?B?TkpRMXJ2MzdyN1BkbnY4ajdzeWVaVGtITlduS215K2I3MmdJSStSajV2WkNx?=
 =?utf-8?B?MzBWMk9nUWNjY2p4K2Z5S2s3OEprQ3pBNDU3TExjbXJXekwxRGVVR01pN3Bh?=
 =?utf-8?B?d0tnTnhRTndtTW9IMVJDajY1bU52V1Uvc2Z5U2M1SGlVaXhiMTViQ1JFVUcz?=
 =?utf-8?B?cVkyMHp4b0JSNVZKTDN4VjJxd1hXcTJIL1dGTDhjOEIyc0ZzbE9lNVdSSlBx?=
 =?utf-8?B?VGhHMDkwazBDMXRaVXAxcVhQRjNxMlpFVGFPQ3NuV3hGWmVvMDJTYVRNazV0?=
 =?utf-8?B?WEd2Ly9LZ1RUWDRNMzFub1dNZzV4Yy9iZkpYa0VJYXcxS1V2NDRBaXZ2MHgx?=
 =?utf-8?B?K0xUV2VibmJQZGl4V3ZTTW9OSitUclRicFU2Z29kbWxNN2pncThseGpBTjBl?=
 =?utf-8?B?WEljMlB0a1VPQWlaVjNmN00wRmw3aXB4Z09Memw4UEdjUk5yZVJWTTY1dmFL?=
 =?utf-8?B?NElQV2IwM2preCthT3UvTnRpRVRpS3IwUTVFMVhTQjF6aTBPSGlTVkZZVy9R?=
 =?utf-8?B?WGVLWjBZUDlrSFpmSjBXN0ZhMEovTElFS0h3ZFFUTWIwUFV5UGFCVzgxUTlC?=
 =?utf-8?B?S1dvYzhZVEdROFNJckJkMnZEVE9oTDJMSW5BKzBCSHBEcFNXQ2JBL0VVV0JS?=
 =?utf-8?B?U3RQdjF1ajI1QkNPdUxGUDJEOExpbXJCeEJSYkZNcEo1N21oSjkxRForUi9z?=
 =?utf-8?B?TWs2Tm9YV0h3bHRyTGh2UnBvTU9JS1RyNTZYMEhSR3Bmd2N5YjJFdE90S25S?=
 =?utf-8?B?bW1nZ1Z0dFVIdXY2b1kvZG9YcmEwd2RqYzV6UXZQc0N4Y1dsYm1Hdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a3d0f43-83ca-4978-3b90-08de63cacc2a
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 08:52:59.5436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aaIcP1riajx7lRIfGKF+ZjXqPa7G0Hh3qllrx0tMkZWqj56YlFgRjc6DPvlB68NcyzAV/t2Pbyel5lbMD5BIbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR03MB989106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B5DC3E35A1
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 09:41:21AM +0100, Andrew Cooper wrote:
> On 03/02/2026 10:20 am, Roger Pau Monné wrote:
> > On Tue, Feb 03, 2026 at 11:10:17AM +0100, Roger Pau Monne wrote:
> >> The limitation of shared_info being allocated below 4G to fit in the
> >> start_info field only applies to 32bit PV guests.  On 64bit PV guests the
> >> start_info field is 64bits wide.  HVM guests don't use start_info at all.
> >>
> >> Limit the allocation address restriction to 32bit PV guests only.
> >>
> >> Fixes: 3cadc0469d5c ("x86_64: shared_info must be allocated below 4GB as it is advertised to 32-bit guests via a 32-bit machine address field in start_info.")
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> ---
> >>  xen/arch/x86/domain.c | 9 ++++++---
> >>  1 file changed, 6 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> >> index edb76366b596..4163568043b1 100644
> >> --- a/xen/arch/x86/domain.c
> >> +++ b/xen/arch/x86/domain.c
> >> @@ -882,10 +882,13 @@ int arch_domain_create(struct domain *d,
> >>          goto fail;
> >>  
> >>      /*
> >> -     * The shared_info machine address must fit in a 32-bit field within a
> >> -     * 32-bit guest's start_info structure. Hence we specify MEMF_bits(32).
> >> +     * For 32bit PV guests the shared_info machine address must fit in a 32-bit
> >> +     * field within the guest's start_info structure. Hence we specify
> >> +     * MEMF_bits(32).
> >>       */
> >> -    if ( (d->shared_info = alloc_xenheap_pages(0, MEMF_bits(32))) == NULL )
> >> +    if ( (d->shared_info =
> >> +          alloc_xenheap_pages(0, is_pv_32bit_domain(d) ? MEMF_bits(32)
> >> +                                                       : 0)) == NULL )
> > Sorry, this is wrong, it's too early to know whether the domain is 32
> > or 64bit.
> 
> It's probably fine to have this become an unrestricted xenhelp
> allocation, and for switch_compat() to make a restricted allocation and
> copy.

Yeah, that's what I'm doing.  It turns out to be a bit more
complicated that I originally anticipated, because you also need to
reset the v->vcpu_info_area.map filed to point to the new page.

> When constructing a PV32 guest in practice, the set_compat hypercall is
> only moments after from the domain create, and it doesn't matter if we
> discover lowmem exhaustion marginally later
> 
> That way we don't have a PV32-ism continuing to impact the all VMs.

Indeed, that's my approach, just took me a bit more than expected
because of the already taken references to the shared_info page by the
time switch_compat() is executed.

Regards, Roger.

