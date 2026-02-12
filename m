Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NMeH8KzjWl96AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 12:04:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B85B12CD4A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 12:04:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228713.1534839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqUUg-0005f2-Ut; Thu, 12 Feb 2026 11:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228713.1534839; Thu, 12 Feb 2026 11:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqUUg-0005c0-RE; Thu, 12 Feb 2026 11:04:22 +0000
Received: by outflank-mailman (input) for mailman id 1228713;
 Thu, 12 Feb 2026 11:04:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4gJ=AQ=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vqUUe-00057B-Ks
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 11:04:20 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92e9efaa-0802-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 12:04:18 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SA5PR03MB8401.namprd03.prod.outlook.com (2603:10b6:806:475::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 12 Feb
 2026 11:04:15 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 11:04:15 +0000
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
X-Inumbo-ID: 92e9efaa-0802-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HASgR8rxUQxOLf13m2q5S5lOUkM8JFFVKnXUxXMMD1y54CtQEw8pgSN5Jc6H5kQtmIuGCenqBuVFcz5+uaDL94HBHgu5f/uX9HbUjA1wLMc42u4EUrwX5FwB70Y1+0r3/MxpWicthd8P/m8G4wZZFobh1yv/aINVRkzzuoDo4Yo+yo9K4vu85tRgNEWCck+PoH6BwXdBAHdBkg/fha7IvyrhXJFPqLmXrW8wMA2tckRcatFY4/ijYQzIOu+B7TgHdkBeFzZs5QLgMXR652qZ0JSL3mQUdUT8diw8jIX4Adr4ZQHjlQZDjc8gwglAvSpe2QxCxTDXBY05fmTv7OKNXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqeU0iPf9kCYSr1Hu2Mtctw8FqSiO8/7mGSvdgUwPWE=;
 b=VafbCQoJOURns5uhWCpttoq/+X0ZTmVIB01wfelnKh1ZYnBndjV0CILktr+h7h69UwhKl8f/RUw1hut5J8jg7/KUx66YRiYUOWvWgSAt6P/gAg9PlID29t9C/5I7gOwqlQ5fbiG89vNX38yhEBXAhHcMuCKMvNvwqiybg2r53YkQHhoxCpe7b4zApgz8c2HG4CoortuyEgxIePDbMvvnOcQ4uNSEsziacLsg5VZ/XWd0hk6qxbcwuJGsDrLLsu+B523xwdR6MRqM8nXsUep7PB89y+53VQpMES6vFDtD32dQQybB0Jneg+4477LQvz57q8k9L4fMYZw7o9/mFbcz5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqeU0iPf9kCYSr1Hu2Mtctw8FqSiO8/7mGSvdgUwPWE=;
 b=hDwNw+47ejXg3lrambM5VVwiRS6koXUiqPGyWyo/+43s8u1mbW2gvtgye7nEJ/R2IXbtrD9oJaof9/9YxKgOeTSiqHevIkyfxH+o23kozUnBX9buNmUSb1Q0jFj0OB+m+mWTvjc8xSuq8/PYQnmQRFfWehxuDrtRxEoQjChgXb8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <840e8d6a-d0bf-4ef1-b66d-e009ea0df877@citrix.com>
Date: Thu, 12 Feb 2026 11:04:11 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.20] SUPPORT.md: extend "lifetime"
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b2d6108d-0035-4187-b83e-b63519d5cbac@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <b2d6108d-0035-4187-b83e-b63519d5cbac@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0400.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::28) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SA5PR03MB8401:EE_
X-MS-Office365-Filtering-Correlation-Id: 7517660e-cd40-48d0-49d3-08de6a2675dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VFJmcWR0MmNGby9SNnNJWFV0M3ZESWVWNFljdjlBSUc2ZWpkUkl4Wkp5RVNq?=
 =?utf-8?B?cEdmaTBtMlg4dVdNSUl2QVB0Z0R1bUZwQm5CV0k3cVorYlpnZWdBRG5Xck9R?=
 =?utf-8?B?TjNBZm9NNnRldDd1dXlKa25wd21tcUNsNDJiOWsvbE1pZnZZS1FOWlVkVE9n?=
 =?utf-8?B?cmM2TnhndGpNSFNZek1EZXBtQ0dLOTNCQ0dvOEk0SVpaTlhJUUdrUTNBUUJT?=
 =?utf-8?B?NHFRU2FWZW9hdlZ3OFFjTTBUbVRJYTRaNjl5UHFXSFpCUjNhcVhjRXU1TDRS?=
 =?utf-8?B?WTYxd01nY1VZdS9HNTM4aU8xYSt5UUFDTnFFZkR2eHBJbVdHb3NuTXlnNG1h?=
 =?utf-8?B?ekhzVlBQeXZEdHFxTkpXQnVFU0VTQmZXM2trQmdqSFpRRWg5OVA3YXBSQnpC?=
 =?utf-8?B?K3V3aWJCc1d0aDVPZGRBU1owQm1UZlhjYmZZbXd5NS9CWUtDNnE0bkVRQnZI?=
 =?utf-8?B?UVR1Vi95dzd6cWg0UlpYUDdMYVp1T1JUWEljNm5aMkZjQTFDSWZHbWd4YSt6?=
 =?utf-8?B?MldremFBdkgxVVZXSmNhSCsvNTFHK0JJRkhIRzI4UHV4bTAyQ1pxODRBMGty?=
 =?utf-8?B?cjBkSlZkemF1NU1ueGlINVVYZVdRakM0WGd0Q0R6VjArV0VLdDBoRW9Bd2Fk?=
 =?utf-8?B?ODBycEMxQTZKRU9rMGpYSDNkYngzNkhuSEl5SDdmR01lZ2taQkMxV0pwcEJ4?=
 =?utf-8?B?KzdYQ2JrcnBMUDRua2pEMFdYb2RxbWkzUmFZUmxIdExOZU4xRXN5eU1tS1hB?=
 =?utf-8?B?S1E2eDZYTTg2UFpzc3NiN25YWUVZZ0x5cHYwT0x4czVrWk1xNDY0N0dFbWY4?=
 =?utf-8?B?OHFSMjd1Y0cwWDNyTFFESzJYUGZ4MGI2Zjk1MkhSYlJEVjdCUUdYRXhadFlj?=
 =?utf-8?B?UExac3VXNCthbU0vZnJFbXk5K2RkMkpibG1iRVE5RndLWE9pUnhLTCswUzAw?=
 =?utf-8?B?WUxvSGJVQkRnRXk4ODZoRWhMczlZSHF5cWdTWldQTTVHQUVhOTRMVFRBRU1T?=
 =?utf-8?B?dk5LZWhzajQrWUdGLzFoa1A0ZkQ0RExDaEdrcFkzWDRNOS9RTlJUQ01Ta25s?=
 =?utf-8?B?ZWtTMUNDZ0tYNzM1T1VDc0YrRWxQYnQ2bmNNYm9Jb3FwNjZSb3NYbzdxeXE3?=
 =?utf-8?B?dTlUWmhTTDZoZzJrS3VpZ0JRbDdzRjFZUjVPTnZEM1Q0OWxpSGVrdUlVQnZr?=
 =?utf-8?B?ZlRXQURlcXFJV0JLZ3pnd0cvdVZhOEcxRnVGVWhKVWhoeXBYUThNbTRhalpM?=
 =?utf-8?B?OE0rWWd1eGZEQVRDY2tZclRxM3cwTnVjZVVhYUpwZlhsa2hUdkNPaEJiYjRF?=
 =?utf-8?B?bzROeVBGckZPdWlreHlxZEpyUDFDalpGUm5mSzNjbjluT2k4SHpJcHBHOC9F?=
 =?utf-8?B?SzQ4UlZkY3RqcEZzVmZUMDNFeHVKYlQzWDhFV0JqVkxmQk11WEljeUdub1lm?=
 =?utf-8?B?UGkrQmpyTk8vWi9ZMnhnWStxUllyQTNGeGdmQnVSSVZlRWY3RnNibmtmUGlo?=
 =?utf-8?B?M0NRdlNHbkhaWXFINDBJUHJUS1I0N1FEdVpRRVJLNCs1YlN3NElaMnpNWm5R?=
 =?utf-8?B?ak5rNU9UcVNkMFBvVVVrdGtZMEVkNGpPLy9TRHFSemlpOElkQlVYOW9odDFt?=
 =?utf-8?B?RW56MERMWU5hUS9HOVZJKzJHUWVXU3ZuWnV6U0xIUTVPVnFGMzlNMzdzRzFH?=
 =?utf-8?B?YnJrUGNaVE8wa0RmYjkrVFhlR1IwbDRFRHBXcDcrckE2Z1U1cDliaktsM2NX?=
 =?utf-8?B?bzdxN0ZSODBFcGJVSzgzVklHMmpFVldjWFNOcVJhRW81ckVkL0JLQlc0ZXdM?=
 =?utf-8?B?WFlhL2Y2YnNOWS84OHNDZnVlMklXUEUxQ0F4M3JuL0srRWM1c0xUbDlZZFBN?=
 =?utf-8?B?Z2Q1Q29JVTYwM2psdmNJdkxLQlVmUGhtczlKc0EzT3BVRWV6VWlQL0x6T1A0?=
 =?utf-8?B?T2pvb3dxNmNPVDd0VTFNdFQ5cXNic1orcFo5d2h2QXpoN2xGclE5V2ttc2tP?=
 =?utf-8?B?MGtLTUlxc3V0Zmk4d2crSlBQeFRmMzg2ejQ1U1BDN09YdG83YnY3R0FQc084?=
 =?utf-8?B?OWp6RXJGdTNaRjNmKzM5YXlqQ0pOSTdmek9mTGVTVElUZmF1SDNNMWlpbDFh?=
 =?utf-8?Q?dyqo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTVoY0xQM3ExTU9YREdTYVBYalJ6UzFBblhFWkF6bVJXbkhTOVZNN0EweDg0?=
 =?utf-8?B?ajVYZS9uaHBLMVlPaTJaZ0dTZTNnSVRPYTlMcnhiK0VnVzBzdEhZZDFNREVN?=
 =?utf-8?B?WDdFZkdqL0FLOWdYOXkzMWVIRHVKdTVnN0ZCMFl5RFl5OFFKak11b0dJQ3VJ?=
 =?utf-8?B?SkFPZlpJdXd4djMydzNaeXpPYnRpK3AyN0hKRi9HNnoxRWREM2R0M0ZtNVFX?=
 =?utf-8?B?SG1HYWFxNEY0eGs1V0U3dGwrbmpSRFBxNXhHeExLN2dpdVNHV0lLYVhiK080?=
 =?utf-8?B?SElTNnptZ0ljL1lnRzMzbmJFRnpnaU9YeWljd1ZQdkJwbE9DSFR6ODF3RFY1?=
 =?utf-8?B?OXdzUEFHMzV2QkRUL3A2dVpjMlhqaUJKdGJhSEVucnJlOWM5ZEZpV0J2K2dl?=
 =?utf-8?B?VWpsNE5TRVhvTFJHeVh5OXA3d1U4d04veCtEU3NhbWZITVRqVWN5eDNScGxw?=
 =?utf-8?B?OE53bEJSMVpjRFZhMSs3U3hqbGVOY0dsT3FVR1M4SEdGejhZelFQNVFoTGhL?=
 =?utf-8?B?U2xLbU93Yk9wOWp1K0dUWEZ6clg5SDFreU9Fbk1RTmxDWFAybHNWMWduRzFW?=
 =?utf-8?B?TXVoR0QvbVZ0aUVBZEtNa0EyV2owYmNpK2QxY0VDR01vUmEvTGFoRWxRSWJO?=
 =?utf-8?B?dDhZQjY3WUowR2FFanhaV3V5blhucEJ4V3haeG9BSFJPNWJDN0pBQk44VEF1?=
 =?utf-8?B?bjErbEh4bGMwd0liQzg0dzRoN3pIWmxYT2doVDRhWGZjMmkrY3hrSHR5blVL?=
 =?utf-8?B?WW1SaVdjZ1c2N3lvWFhZZ2N0R2JkdnlERHN6cXFOYjdmUk9DQUFZRzlpclRx?=
 =?utf-8?B?TmpTR2NXL0hjYnV2andIYUdxd2NtR2Jzcmxjcyswb0VVTjNxUUNaV3Z2Vzkv?=
 =?utf-8?B?VzRublk2cjIxdGx2U2tTa2w3ajBIZVp0aU1hU3pSQ2FYa21BWElKaHNmdmNH?=
 =?utf-8?B?ZWE0WStndWFudnRaYWVsTm9FZDg1bUFCMStYeFJCOVRZamxHNEwxV2thZU1P?=
 =?utf-8?B?Wnh4cUxZeWEvUnNuS0JSN0lEWDF6K3QvVVV5Tm92T0xCWGhHRmJwa2VtQjE4?=
 =?utf-8?B?eWF1eFZIaWYyd2w1RW9uVDloWDNzZEVtd2UreURUUHUzb1dPQjcrbUZNenpv?=
 =?utf-8?B?K1R1OGF3NHRsczhzVXB3Zi85cHI1ek1JU016LzJCa0lieHZvSnFqeGJRanR4?=
 =?utf-8?B?UUtUTS9LcVlBaG5SdkVWc1NqUzJzT0NQazNVeVg4c3RnQmNXeHBScTNKd0Mw?=
 =?utf-8?B?MkZQUHFMbnlWL01nQm96S2JyLzUwYmNzdldJdkl4dnErUTVlUTNHdXdGRFVR?=
 =?utf-8?B?am42VFRvZk56TnZhMkd1L25pZCtXVS9HYmdhc0tiVUQ4ZWRHSHUxOHpoV2M4?=
 =?utf-8?B?Q0tEbGRXaklWN2pvM3F6N09OSEhkNHhoSFNJNVQ5M2tQNU44QnFkbi9HNXJN?=
 =?utf-8?B?Nm1xUXN5SzJDSEdYNlZiV0JMRWdTRWd3ZHpkRUpGK3hkb1FCcFBnaVFibUo1?=
 =?utf-8?B?dzN1RjllNTZ1aHQ1bVgrdk9sRmNtcHRjYjBkU0hHVDJOUVZPUHVtdDZDRW55?=
 =?utf-8?B?cEhGM3VCeGU0amVOdmg4VXlXamZjMDYvUitLV2lmUjFwNDN3NDgvWGpCb3hR?=
 =?utf-8?B?bnI4b0wvcXk3ZTg0RjJ2N01veGI2MGhDNGxQdmVHWEx4YW5QSXpmdGJRMlBi?=
 =?utf-8?B?MkhDdWZTVXJtVXRydHpqYjZzVWVLLyt5cGtHa291WmJEbm52WTZ3WXFNeTQ5?=
 =?utf-8?B?NU5NalE0S01ZMGlFWnpIckx5RFRNd2g0QkpTaEVNamZwRVNkV1I3cW9qWmZP?=
 =?utf-8?B?Z2FTaGpocno4SitnYjdKZXFyTXlnRlZvaDVUZGZyeWtpY2dDWlJHWEpTTlk2?=
 =?utf-8?B?VXJiSFhmN0pGTUVBK1lKK3k1cHRDeUdlTmZVOFBueFFYc0MzYlRBVFZMWmZB?=
 =?utf-8?B?SEJqR05MbTFFcW9FREdFMVB4UWh4V0RjK3M0ODRYaU5WL1BLZHk0TVh5VG5I?=
 =?utf-8?B?bjJBN1lCSGtRNWQ3czJmR0RkTE8vNU5qZmZJb3VidnhBVGdScUFpYVI4ZnVU?=
 =?utf-8?B?Q0Vtc3MrMUdoR2NDOEFLMmNQYzdLcU80RjEzRGVLN2lSNUthdDBadlF2ajJw?=
 =?utf-8?B?OEUxOXRCVUVsV1ZFM210VDBuZ3o3Q0l2K1ZYandkZ3M3TDdTaVFGS0lvM2Ni?=
 =?utf-8?B?Q3pjam9SRjNaNGVJeWJ6VnAreDdiMGM3eStCNEVWNllwU0ZiWXFhU0s0SE52?=
 =?utf-8?B?dkFNTWR0S244RDdSaks4MGJYck9JcWdNVGFrTjVHL01mdVZJMWN4dTk2VlUw?=
 =?utf-8?B?d3FrUmo2MGJ5NDZZZURUaVp0ekVJY0NPMWlIS2ZRMEhoYnVoKzFKUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7517660e-cd40-48d0-49d3-08de6a2675dc
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 11:04:15.2391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FA7gp+8rGv6R42wIBlvW/lF9vm8v3cNSQuZnm/QQEjfGRGuCk1ImgVZYSf1Sdv20SXSKBLnah/6Skx3NnP23tAcY8zo2R+A6tQrdggYrFbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB8401
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:community.manager@xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0B85B12CD4A
X-Rspamd-Action: no action

On 12/02/2026 9:26 am, Jan Beulich wrote:
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -11,8 +11,8 @@
>  
>      Xen-Version: 4.20
>      Initial-Release: 2025-03-05
> -    Supported-Until: 2026-09-05
> -    Security-Support-Until: 2028-03-05
> +    Supported-Until: 2028-03-05
> +    Security-Support-Until: 2030-03-05

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>


