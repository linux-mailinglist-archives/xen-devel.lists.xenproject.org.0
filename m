Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBPfHtQ0j2lGMgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 15:27:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C88131370EF
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 15:27:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231097.1536409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqu8O-0003hZ-TL; Fri, 13 Feb 2026 14:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231097.1536409; Fri, 13 Feb 2026 14:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqu8O-0003ff-Pa; Fri, 13 Feb 2026 14:27:04 +0000
Received: by outflank-mailman (input) for mailman id 1231097;
 Fri, 13 Feb 2026 14:27:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/W2=AR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqu8N-0003fZ-8Y
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 14:27:03 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f79f183-08e8-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 15:27:02 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA6PR03MB7639.namprd03.prod.outlook.com (2603:10b6:806:43b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.12; Fri, 13 Feb
 2026 14:26:57 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Fri, 13 Feb 2026
 14:26:51 +0000
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
X-Inumbo-ID: 0f79f183-08e8-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+UC2+f1sGPON8dWwOgQvXuYRPipQpVKU/9FPMUVMUU+XWZQ8lXaJ/cFR2XEQcYQKYlMypXJG51jLbG/LLE2+eS+3OPhXWxNgdzU48iuubAslcHjRwp3qrjtrSO4SJ3dviKEi73RigHHOLd4p8cMV8Zq06apxxPwQRWRHzr+jGEayUmc20GugL6+6lZyuCyE6Ln12J1vdQeXrRt1iyMyt89XanB1jCqcHOLMp/hqPEmh/SVlFoM0aC2++dU/aAs6bi9lXr46j2nOv606exV8S+k5+GZlp9FwzztQr6HxMx74IjfK3YxfZK42wtHylOnbocF2VKVbB7rgCA5cP5SU9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rh5T2m86dtQrlWO11Ty4sdS+EaVag2KHwB9XaTaTNyU=;
 b=rmjFHwj6qdNE6LOOF6U5PuHT4oBCNsuZikRLtMucOVK17pGBHgxtLt94yuAesW/sV5SAHMPmH3k+yKo9EJFF/ySWKuzk0IJvbjt0SSAMaXCG1V5ac+FycbC1XknJD0cMChwXyyj6mS/owAFOSvf2W9S5SGDJz6wp/GqmDejKDMpsnn74d1zeQIGnYTA6MYdDBF6fKG8fdPEEpkbiFjpvbq8K8WNZ/H22qlvPZmSWj856ZViCDkgpRl9h+CWNvKURapqSkTTSVtJxJ2zJHiZiXGCiAUuLzOkdeB2hNA5i4iSjns85Cj3IuzS2He+OqEPaL2+TvU2KfMjyvAcfX3IA3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rh5T2m86dtQrlWO11Ty4sdS+EaVag2KHwB9XaTaTNyU=;
 b=ChdSUiJ9BIytHFTTnJXZwbFIZTfKlCdxLwpx9dK1u48pfhs2Po+Bq74aNJhMoj/rdPOsJPM/1sxX10Xv3PVIFf6tiprbSFZYxk1NmcRtv8beLxDW6RqEg2QQOdmiCA3+nBEB0YKxu++JjUlOUdODCxzCMUZ2/z/dz/HRrI571uE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 Feb 2026 15:26:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] x86: Make hvm_enabled a constant unless both PV and
 HVM are both compiled
Message-ID: <aY80qJVIZOjjqBOS@Mac.lan>
References: <20260213133732.132326-1-alejandro.garciavallejo@amd.com>
 <20260213133732.132326-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260213133732.132326-2-alejandro.garciavallejo@amd.com>
X-ClientProxiedBy: MA2P292CA0014.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::10) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA6PR03MB7639:EE_
X-MS-Office365-Filtering-Correlation-Id: f37833cd-29cd-4aad-ff0c-08de6b0bedc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVg5cEhJb2FxamMrc0xibFo2OWZUVi9wbjVtbGMyenl3OEd2cGRqemVwUlcv?=
 =?utf-8?B?dWw3cmxzdXFncy9iZVdwNTQxUXdVaEVaRUM1UjJMWThFaFY1RVFMaGhZdlUx?=
 =?utf-8?B?NGFOZndOUEdoWkJIT0E4cHZzK2s4SGNueWVsdGRlZ3FDc0FIRmZ0ZkR0czVG?=
 =?utf-8?B?SW9UdnVSVlo5S25BcDI4UkFlTGpySmhTamxXYjJFNFlWRUxOZFBrNTJ5eGRL?=
 =?utf-8?B?MmFkVDNKdlFCblFIK21hSmkweGgzRld5d2poSGkrTFFaRzhzYXZpRm5DUTRs?=
 =?utf-8?B?SXFCRTlZSWZ0L1dXMjl5UHY2WmNhNVdtd2tTTWxOZFk4U0ZpNlhuK3lFVDk5?=
 =?utf-8?B?VlNuZlpoeThmRDd0K3ZIK3htQmR5MzFUb2c1YnZqd1hpaW9BdXltQlBHSjE0?=
 =?utf-8?B?Q0I4b2I5bU5iZEpzcTNGblY1UU12TzU3YVR6ekNndVpIWk5vQVNoNHBLcktI?=
 =?utf-8?B?V3FZR2I4UWtJbEJRZ0tjOTVNbDB0ZDBySjBoY0RmalF2NFVkaXpqZnpMQktM?=
 =?utf-8?B?UThyUnpyQUY5UlN1M3g5ZUkxNkpUMndZbHJNanUzTGZqVmJRSFVwOHduWDQ0?=
 =?utf-8?B?LzJIbkV5VHVHMjd1MWJmWlhoVS9IdCtXTDZPSjJOVzVFb28xT2N5bzkybVhR?=
 =?utf-8?B?QTh2ZHRYQUU3TW0yS29MOGRXU3VFb3pKZ1U4c2hhZWtoVGMzNnNKckVpRzNz?=
 =?utf-8?B?WjZnUjgvR1I0UStxemNVMDV0Wkd6S25Sb2wza0NQQ0tvSjI5elpPQTRTQnhZ?=
 =?utf-8?B?cXNqWG9HVGdnR2xvTmRqUEoyRjVacTk2d25JME85OXgzZTZRa0owdENUZWds?=
 =?utf-8?B?SWdoZ09hcUsyWjNpOGpqWFpQSHlWcHJ3a3FLc3VzbE16bnZxaGx2azh1TTda?=
 =?utf-8?B?MDZ3emNrdEVqMmhVV2pUZUtDYWlKNHVhTURwUzN1MFBrVFQvWnpBWThvTmMr?=
 =?utf-8?B?WThlNWcyaUFwMWpUZEY3Y0ZnNm1kRjNZOFF2SnROT3BDV1dNazZJUzB3aUMy?=
 =?utf-8?B?c2NLVml6OVBIZDlRY3AzZG5Zc0NyV1BrM2ovNmNTclYyNGt0TlcxWFhIWVZo?=
 =?utf-8?B?RDdoYU5qVUVsNFprb1N6VUYwZ0VLb1RsdHMwdUdsQ0tJbXYvUmRJRWFBaTFj?=
 =?utf-8?B?Rk5PWjZBU0JPanZDQXZreldLREx3SEs1Nlp6QzU4dHpBV2hEL2xyRE05VEZI?=
 =?utf-8?B?b0pqTHhSMzFGRUw5SElvODF5QVo5dVEwU2c1bmZsRll1aTAxSk9YQ2U4VFVX?=
 =?utf-8?B?YzExVzhidXBWaXZKYWVyd0d4ZXVPTzNJK2svekpXMHNrSkdIbG1GLzE3YWZF?=
 =?utf-8?B?bEFycmJLSVZNRnZ2QWd6TDZSU1lXS0MyQXVGNnRwWHNFaVNSNC83U0NidUpQ?=
 =?utf-8?B?bngwWUwvMFJlTDdDWUpaVWFtSitIWS9NREdOTXluWE44LzZlblIrUjEzVWl6?=
 =?utf-8?B?UnRWU001dUlaWTA0UHFYU0xmSXdUbkhoakpGWUpkdi9TTWIyUjFtV2gzY1Y4?=
 =?utf-8?B?SzRGdG1vV21oZ29PWmlsZzFoMjVuT3VFeXVjbndMbG1JT2NIQkRjbWV3YXQ0?=
 =?utf-8?B?bTlzNVB4RjQ2QjJvSTU5N1UwVFpnNVB6SWlrSTVFM3haanlsYTFhVkduMTR2?=
 =?utf-8?B?MHJIUHo4bmRNZmFVcWtjamkxTVZOWFNGZ1ZJV1JraHBacTNYRTJETlk4SzY0?=
 =?utf-8?B?bWpWUk5sVnh4VzBUa1FaYmZ3WVlsc2xsVDlCbWZDWW5QTjlTVEF4NWYrNllD?=
 =?utf-8?B?bVlJeDNKNm1RaW4vdXZqdXpraGRxSzFSVjB2WVRWL1FPd0FJT0VKQkNNMzJw?=
 =?utf-8?B?Yll1bEZqWTlGQlB5eWJMU1EwVE5zUlFyeGhxZm40VnhreWpKWXJxMGJMcTlm?=
 =?utf-8?B?Sk4weEM2SXhwZ1A3a3FMWk5JTStwVkMrNFhQVFR0eThHTk9vZHNPWncrN0Ja?=
 =?utf-8?B?cmlqZFdkRW5lb3F2WTVPczFaOUliazVTRzNMbmpUYVpUT2VKU1JpNThGVWFF?=
 =?utf-8?B?VFpObjdxcUxMTG1tc214enAwVXZnZXRxN29CSDNwT0tuVFdkVGVSRHdRUjJE?=
 =?utf-8?B?Y1FNS1Y3UmE0dE5WZzJvOGtadFFFR0lUT3pPdDhzV0pjb25XVERwL0ZMRUJW?=
 =?utf-8?Q?Gf+s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkRTM3UrTXFyT2s1K0FNQ3F3MWlNelFnMmpoTTFxTjNsSjdDdXc2ZWxZWkFw?=
 =?utf-8?B?UnRzZERieGJib1VTVFNXcG1QUGhpTWU4OXNFcm8rUTdFeUcxMlJGNjBYSExK?=
 =?utf-8?B?V3hlK05wb0VYOGVZT09sZDZOT0dKcTF4ZmkyRkhKT2ZQaGJQeVNaUjFOOXVO?=
 =?utf-8?B?dUZIQWs2cUZRdGVWZ0p0Qll1T1BrMEw0RTg5YWJHcm9aRVhiQmRCVUdWaUtV?=
 =?utf-8?B?bGRiZHNMbEpDSVVRV0VVdU0zMzF4Q2RYZmYrc056MndlUVl0cFZtSVRlaUFD?=
 =?utf-8?B?TnE3VDVCWUJISlZENDlDTkNIVE9FMTFoUkEyanFhOXFSRURaUXZ2eVpBVEwx?=
 =?utf-8?B?MVVWdXpYZVdMdjFwcWZrYmFrSUlzcm91U0xTMkxUdlExOGxEUWRNNWhjSDVC?=
 =?utf-8?B?bnhhUXBNOU9IS0syREdoZXZreFdqaUVjTDNwZnhMOU5MSXJzdjAvYzlwMHdG?=
 =?utf-8?B?VGw5Um83VWkwNXpSb3IzNkRQbkppcVlsMjlacUFlaGJUTjJiZ1VqdXlKVzlQ?=
 =?utf-8?B?cUxpOFNlRnBvVHpGaUVVVG8velo1YUE5MmFScVRVQm5vSDg3YkY4VnJxNS9G?=
 =?utf-8?B?dWlyVkFrTVgvMXdScnJaMExrajRHZEUwREdick5adHc4M3lPdWlseFhmek1k?=
 =?utf-8?B?NUNpOHgrWFJSdlZBTFJHS0dRODJONnk0ektad2ZvZmhKdVZMc2ZrWERrRkVP?=
 =?utf-8?B?d2xtYks0bTlhLzdzUHNRTzNOQ3ZOUzdpcnZVbS9EdVFOZ3g5ZHR6eG4rblBt?=
 =?utf-8?B?M1dmdmtQMmQ4R0VvN0dSbUF2TlcvcUkvSElVbzgvdjl3eWJNV2tqMlpYT2lQ?=
 =?utf-8?B?M1lhSFpSUnU2eXBXTXBhaXNNQUFuRXA2K0F2Qi80S0RGYVFualVLN29PVlkz?=
 =?utf-8?B?K21SWWRiNmlndXkxQlNRc3BndUpTTGlLamtEZEw4bytkazNLYVJSZDRZMFhJ?=
 =?utf-8?B?ZmhaZE5YNm9WOEw5bGFjRVQ4QVBZNGZDUFArUGdrcHJhM3psSnhKUlhWRmE5?=
 =?utf-8?B?QkM0cnoySkJBNDZKTFIrT09TenU2V1Z4SkpSYjlWOUhVR2w3NDBEcHArcEdD?=
 =?utf-8?B?c3AyajRKZStPdG85ZDVYam9taVFhNmp4NEwzYThPUWQ0NFI4Sk5ZL2NSanRx?=
 =?utf-8?B?N0c1Zm5LUHF5bUx2WTIrUjhQZElmbjBLR3NTR2lDRmRQaE00a01vSWxkcnNk?=
 =?utf-8?B?bld6SHVPTW9GQ1Y4NE16WjJlbmNjWUxuVklocCtaVjFodldtMzB6MFY2ZnVp?=
 =?utf-8?B?UXpWT3FlTWM5c29nTjgrd080eWs3cXFPVng2Y1RRblQ2OHpwbWdIQ1lXNzRK?=
 =?utf-8?B?VFBFVkVHVVJLN0d6L1ZWajFTNjBzTU5KZjB3U256YXNIRU1vQ3I4bnBLYVdp?=
 =?utf-8?B?TW15TytPT1RrMlRyR3VoR29TSnhxVnp3TEhRL2oxcFpzMVd4WDdSdm8zRkZK?=
 =?utf-8?B?bzZPaHBZb2lGeXdPTk1uaDlKK0xUMWpBaTNCb2RtTDIrNEluNXh5cFQxN0RU?=
 =?utf-8?B?OWI0Y2doZ0YvaFpMd2grOXFQNkVxQXlaZGRsMkZTSzlKK0JCZngxakR5ck1M?=
 =?utf-8?B?TE9TazN4RmZPN01YNi9Da0RQb3B2c1NEbnViVzlZbDlhMXVjNWVwc0JtWVZE?=
 =?utf-8?B?Nm5idWhtT2ltVzNDck0wajRVVzFDT3ZtTmtjR1dRMGVkVUlHaGU3eHlEeVda?=
 =?utf-8?B?TytGTkFSTlhpTURBSjVTZFZFeHpRaEFjdHJEdjBTSkVpU1RNdGNBdFBKYW9k?=
 =?utf-8?B?NjhCR3FXZk8yZVdjSDF5N1Y0V2E3MEZuVDNWc01CV2dyYitKUS9aR0dsa3hM?=
 =?utf-8?B?U3pITkMyNitEeUhBc05pOFFYa0Q0bnFRWG5BamhvVUQwL2VkcmRTWXJrK1Uy?=
 =?utf-8?B?UHduQVhEdFNUY3kwZ2ZZcklCQkt2Vk1qNVBueldHamg3dXFOTVB5a0t6SExp?=
 =?utf-8?B?amtQWFRRd1lzTm1URWFUTGZOQi9odnNrem95RlNIZmJKTTBSc0NQc1lnMGE1?=
 =?utf-8?B?dnNRY1VUbVF0ZmRaTm16aThvZitEbFNkcllVOXFaenA2VUVzbk9QdTJmTjd6?=
 =?utf-8?B?NW56cXBGMTNZZkdETTB2dUhkT1d5QUY4U0M4V3gwbEU2NXlLeWRqRjYrVmNK?=
 =?utf-8?B?SzFYdXhLT1A3UVN1N3paaHhZOGZnaVRnVVNYbG1ZZFovOTlsZDJaNXFvelcx?=
 =?utf-8?B?YUJTQlJMaW9xN3RDeGhhbG00ZzVOdmFmQ0JpdVpjMEpuNnNXYld2ajdOMGM1?=
 =?utf-8?B?UEkyc0NDVHRDQy9POGRRMURZUkIxMGhDTUh4R0hqRTZhb1RQV1JuOGI4UGdy?=
 =?utf-8?B?MFN6MTRncmVyeDR4VDltNlpiMGpmU2x1NHJMRVk0OXA5QkhaczVRQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f37833cd-29cd-4aad-ff0c-08de6b0bedc3
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 14:26:51.3231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQipviM1le/oOZdpALes4MPQngxZb+X8040eKZxeo48q0nDUREIi1K3ewjgsE90ReYdmlUaL0T7idKT/rmkv/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7639
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,Mac.lan:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C88131370EF
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 02:37:29PM +0100, Alejandro Vallejo wrote:
> PV-shim already has hvm_enabled optimised to false, but there's no
> reason HVM-only builds can't benefit from the same optimisation as long
> as we add a boot-time panic in case HVM support is missed. Many branches
> go away, some in the potentially hot switch_cr3_cr4.
> 
> HVM-only:
>   add/remove: 0/1 grow/shrink: 1/9 up/down: 1/-162 (-161)
>   Function                                     old     new   delta
>   arch_do_physinfo                              79      80      +1
>   hvm_enabled                                    1       -      -1
>   symbols_offsets                            30732   30728      -4
>   symbols_names                             108029  108022      -7
>   symbols_sorted_offsets                     60656   60648      -8
>   flush_area_local                             571     562      -9
>   switch_cr3_cr4                               311     300     -11
>   init_xen_cap_info                             62      43     -19
>   arch_sanitise_domain_config                  885     863     -22
>   init_guest_cpu_policies                     1270    1247     -23
>   hvm_domain_initialise                       1127    1069     -58
>   Total: Before=3797004, After=3796843, chg -0.00%
> 
> With hvm_enabled const-ified, it's fine to take hvm_flush_guest_tlbs()
> outside the CONFIG_HVM ifdef and remove the stub. They compile to the
> same code after DCE.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>  xen/arch/x86/hvm/hvm.c             |  9 +++++++++
>  xen/arch/x86/include/asm/hvm/hvm.h | 30 +++++++++++++++---------------
>  2 files changed, 24 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 4d37a93c57..da56944e74 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -72,7 +72,9 @@
>  
>  #include <compat/hvm/hvm_op.h>
>  
> +#ifdef CONFIG_PV
>  bool __read_mostly hvm_enabled;

__ro_after_init?

> +#endif /* CONFIG_PV */
>  
>  #ifdef DBG_LEVEL_0
>  unsigned int opt_hvm_debug_level __read_mostly;
> @@ -173,9 +175,16 @@ static int __init cf_check hvm_enable(void)
>          svm_fill_funcs();
>  
>      if ( fns == NULL )
> +    {
> +        if ( !IS_ENABLED(CONFIG_PV) )
> +            panic("HVM support not detected and PV compiled-out\n");
> +
>          return 0;
> +    }
>  
> +#ifdef CONFIG_PV

CONFIG_HVM I think?

>      hvm_enabled = 1;

= true;

> +#endif /* CONFIG_PV */
>  
>      printk("HVM: %s enabled\n", fns->name);
>      if ( !hap_supported(&hvm_funcs) )
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> index 7d9774df59..dc609bf4cb 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -261,7 +261,11 @@ struct hvm_function_table {
>  };
>  
>  extern struct hvm_function_table hvm_funcs;
> +#if defined(CONFIG_PV) && defined(CONFIG_HVM)
>  extern bool hvm_enabled;
> +#else
> +#define hvm_enabled IS_ENABLED(CONFIG_HVM)
> +#endif
>  extern int8_t hvm_port80_allowed;
>  
>  extern const struct hvm_function_table *start_svm(void);
> @@ -399,6 +403,17 @@ static inline bool using_svm(void)
>  #define hvm_is_in_uc_mode(d) \
>      (using_vmx() && (d)->arch.hvm.vmx.in_uc_mode)
>  
> +/*
> + * Called to ensure than all guest-specific mappings in a tagged TLB are
> + * flushed; does *not* flush Xen's TLB entries, and on processors without a
> + * tagged TLB it will be a noop.
> + */
> +static inline void hvm_flush_guest_tlbs(void)
> +{
> +    if ( hvm_enabled )
> +        hvm_asid_flush_core();
> +}
> +
>  #ifdef CONFIG_HVM
>  
>  #define hvm_get_guest_tsc(v) hvm_get_guest_tsc_fixed(v, 0)
> @@ -498,17 +513,6 @@ static inline void hvm_set_tsc_offset(struct vcpu *v, uint64_t offset)
>      alternative_vcall(hvm_funcs.set_tsc_offset, v, offset);
>  }
>  
> -/*
> - * Called to ensure than all guest-specific mappings in a tagged TLB are 
> - * flushed; does *not* flush Xen's TLB entries, and on processors without a 
> - * tagged TLB it will be a noop.
> - */
> -static inline void hvm_flush_guest_tlbs(void)
> -{
> -    if ( hvm_enabled )
> -        hvm_asid_flush_core();
> -}

Is there any specific reason you only pick hvm_flush_guest_tlbs().
Given what you do with hvm_enabled you could probably generalize all
the dummy helpers in the !CONFIG_HVM section now?

Thanks, Roger.

