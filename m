Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJrkGDxre2mMEgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:14:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C67FEB0CA4
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:14:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216545.1526474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlSma-00006O-QH; Thu, 29 Jan 2026 14:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216545.1526474; Thu, 29 Jan 2026 14:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlSma-0008Vo-Mn; Thu, 29 Jan 2026 14:14:04 +0000
Received: by outflank-mailman (input) for mailman id 1216545;
 Thu, 29 Jan 2026 14:14:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XEJ3=AC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vlSmZ-0008Tl-Eo
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 14:14:03 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c05e0597-fd1c-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 15:13:58 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6541.namprd03.prod.outlook.com (2603:10b6:510:ba::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 14:13:53 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 14:13:53 +0000
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
X-Inumbo-ID: c05e0597-fd1c-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlRTtnW9iEwlVtBe1+KLnnb1kK4fWOPM7kh+353MqROwGkASVnIw10a53y/gGyGQoODMh+FkjohgnKKfCkDac3zZHxBCdTlIkm3zxrzli+5n0NQxZ2bR+YpQa6xzfkukxD6gGbFoBwsN9PRr1Ppi3Lt+go7PRIXb00ug3P4ajkVtXZ5VQVjZaz2SdgQqcqknr/hATvRrbCUrrMWao8Qxmaz+oSP0NMzA4jEo/VK0tADJlbSpVcNog3TtsERzmSZVub57hJ0mAeaaMMzfuoSUVJjoMDnAozhqecw+boI0sYAAzERBtRhIVn0gjkcLxU6AQzPtXa9Roe4xGe16xbgCXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y10wekK9zkyAtRMtkqQVbrQmf01sAz6zb5Z4qr9KuTk=;
 b=TQeVZgfJIqtZxg7attFV7/NC1mtXL/m4xWO4YnUrGnwve1Yz8FAMzOO+Puh1llZwM9aZ1xmMUTh1d8ONzJw2npdfxG7FxR2Z2bPB0zRu9nOg1Q4PTxJDFowcFEHEHOtuNtXk1d7+6UARyLIQSKjixzGnEkTENdLow+9+LSA4MtBXvnWbXXDinhY1UfPF+xn4tR8bTytZYU0qpzHFsrxHHKaCzzIzoZCVOZumfzmMSgivbXZatQ961ai41eN1IroU2t0zIIW/jeGlAL/0XrT/+l3/RDSShdiqnuyp3I7Mj2kxUzvL8Oj2RCMbJ4iA4VamsvrOBGDzeQ6LwVRstog9AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y10wekK9zkyAtRMtkqQVbrQmf01sAz6zb5Z4qr9KuTk=;
 b=HuaP7j0xROUebzLy+E/ZahccN2PfndM1bFMVJoCbdQMBzvMVFRUV5npOv3Uk/yqCrOlqGBvfSn2eS6OSOvg2RLy4n5B6xW1YXFj9Nj1M0qDO7qvq3rpArmDkSQqfXs7sS1Hkoaq4kqGy2KGkiwSHVgzUsrvzUYgVqbiSHp1IQRo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 29 Jan 2026 15:13:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v3 4/6] vPCI: really no ext-caps without extended config
 space
Message-ID: <aXtrHszjdhVsaRLZ@Mac.lan>
References: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
 <d7ef6302-9034-45da-97d7-25c76204b2fd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7ef6302-9034-45da-97d7-25c76204b2fd@suse.com>
X-ClientProxiedBy: MA3P292CA0019.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: a2e2549d-fe8d-4aae-ac52-08de5f40a1cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RkRVbVA0TVhlM0o4djQwRHlabkplUEpFcU9tN0ZiWWU3aDF2MDBaQWkyWHY1?=
 =?utf-8?B?alBXUFJwV1VvemdJMHBTT3JPdjZQeXFtcC9rMUM2d2x4MXVhSUhyYjFaWEVm?=
 =?utf-8?B?VXk2MXlGdHRSR0tzVWpuUkZVSVJVMG1iRFdkNXlFYzRqUnd3UUFwMUFIdVRL?=
 =?utf-8?B?TC8rU3QwSW81TTdDaS9KYmw5OGRiVmF0RzBBaWtXbDBwZ0gvMHJ3WlZ6Tmd3?=
 =?utf-8?B?RmIyaFZCWVZ5QUtmeXFXd3pQaHdIL2NZWVdsTXZPcEtSS2FHbHJ3UU00VnRY?=
 =?utf-8?B?cVN1K2NtbDI1YU9QNEQyVjRxSHNLQlUyMnNIbnJLVTF4NXVSYm9DQlhCdDVo?=
 =?utf-8?B?WmVpM2MvSE00dGRNZHhrQzAzZVRhaWxZak5YVUV6dnZoaTJRbGxCQ2FvcEdX?=
 =?utf-8?B?NC9Ec3VrMWt6U2tGZUlwc1hXc1RCbXZPVEs1WG1PSThMUWF0ODhtLzREOWho?=
 =?utf-8?B?QkdZeVFpYkh0ek9sNXcrNnEzSHNKRENCdko4RDkyYUJuK3hrWkN2NG42VWVM?=
 =?utf-8?B?S3JnbFZpODJaeithR3hSdDFRcUIxUlpmM0tDNjFqb1FoanMrN29UdEJ0aWJD?=
 =?utf-8?B?NVdXMkFzaFFYbzUyNDFiVzE5bkZjTG5hN2VqUzd4cHIzcEFGMVN6R1h6RUpv?=
 =?utf-8?B?ZFFmVTJ5cFdpbXRkdTlDOXJmdTc3V3pyazVPTkFhNXFQeks5ZmF5NEtkTXZG?=
 =?utf-8?B?V0V0dnkyNUF6dnVic2NhVitid0dFSU9zbzk5amcrZ05YaUhZREN3WDF0Yi85?=
 =?utf-8?B?OTFCTDZDNEJJS0JkNk02YlpheHFCUXRDbzJSVGkrSzVXdExUcWhjUTYrVzZD?=
 =?utf-8?B?b1NVNUZGTHcwcWw2UmZpcHBBVENLbzd5aDBGRGFUU3Y3VXZlOXc3anM2dXV3?=
 =?utf-8?B?SkVaSTFvR2hRMUJZSmdxdTRtclhZVGE2OXVVMm5ZRnIrM0ZiZTJDdFVmVmxh?=
 =?utf-8?B?NmJjMlJMdkViQzRNL0FWU1RxWmFKUDdYRXBBb1hnQks2cytIcUpqc1M2ZXBs?=
 =?utf-8?B?S0wrcTdnZG9RRjZ0aUdQTFROU29NakwwVWxuYlpxcGxiYVR2OENJQmZqRjF3?=
 =?utf-8?B?Rm5PMnVMbThZdUJTbTUxMFUrTkp3bEgvMFBrSUtvSEVOeTVrNUt6K1hQR3Nw?=
 =?utf-8?B?YmhnRTZucUp2Z25tU1VGSDNvTW9tU2VYS3ZveThGQllTUlpsYng2Qmx0S3hi?=
 =?utf-8?B?Tjc3aG1VbWNDL3E5KzlOVlNVMzl6dVdJZnIvSmxiRVVjQUpiY0Z2Q3JqVjFu?=
 =?utf-8?B?YnNXbU9odDRrZmN6c3BYWURnVG1DUXpVMzk1L0YyMGg0NGgyeWZDMkZZZTNS?=
 =?utf-8?B?SjdlaXM1SkVPc3ZUNnlpbUlRaXBVVVJSSytvRkVGWE9VQ2tEYW00OXgxODc4?=
 =?utf-8?B?Z3orb1NvRnprbHUvQkE2bU85YU5QcVJxUS9pNjdSdTI1ekVJUUlvcUlPNTFD?=
 =?utf-8?B?QXBWN3kreFZkUWRJb3NPOHgyYi9jN3hISzNPNTlyeVN5b0o1QnB1MHFmWTdQ?=
 =?utf-8?B?aDM4MmE1dWtOWk1sNXFPS2hLMXdkNGhuaXhkdHd3bUIzSnJaWFo3cThQb2o1?=
 =?utf-8?B?MGF5R2JtUmJSUFhMcVpkM1NSZ1R6KzcwQkcwT21BTFBaZWNxenBUN2JtYmI0?=
 =?utf-8?B?Mk80dG9UWlNPRmVMekRHeXdQQTRYNTV6YndFajhDTGZmS1dmNVFNbTk2WjJC?=
 =?utf-8?B?a1A4Y1FmWE5nQXhPRWVhUWd5TWZ1N1Q3SmNBK0w2UkxESlVFUG9Lc01hSUhH?=
 =?utf-8?B?eVlMeFhWb0Mvc09QMHFJVWFkUGxZTWE4b2hyNWxxMm4xVUR2ZzZmKzJaL2s5?=
 =?utf-8?B?LzQvTGFSajQ4TmpHdGl6cm5uUy9LQ2xpTWlzY3NER0p6bUt4cnpHUkJzcVlM?=
 =?utf-8?B?ZmQwUFQwQ3Z3SXdIOXR5WTVTTG45UGgreGVEdGhyUkdDL1R6NkFOQXVWdGFw?=
 =?utf-8?B?OHlXLzkrMmxGSDJuVHNVREV0bVRLYlkwakUzY0JNMmdJdDZjTXMrQzNuTlRv?=
 =?utf-8?B?a2FacXdtR3o4UzdRMFRXa1VEVjl2WTVTVlNTcWV1RmluSklIRUtic3NoMG1W?=
 =?utf-8?B?dmxwVWxyaHRwMm1EZlljcjFiZXZONm16V1B0emtNeGFrQVlTMWdZM0YwaXJW?=
 =?utf-8?Q?vcQ0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmVnN09lLzRPSkI2UHNzN2FWL3l2ZCtzc2w0dTZHNk51RzUyK3ZhVU9vQWVS?=
 =?utf-8?B?cDh6VnJqeHlnTGE3V2U2TlNKNWxNcEdhc2duSDlGejIzSE5UTHNrUUYzSjJu?=
 =?utf-8?B?anRiT2RDeE5jVnBaRndGRUJVbzJNMUp6c2NsUDczTWI0MEpYa0FQRUtKWXlZ?=
 =?utf-8?B?bEQ5d2FUUEtzNlNtTUEvT1B0SGtZaEtLemk2YXFGRkRsMmZSWE9VazZ4QXlx?=
 =?utf-8?B?dkg2TlVndHYvVk04U0dRMWN6M0U4dW95bEJwankzbUgxcTUxVTR6eGFqYjFD?=
 =?utf-8?B?cElOWTVDc2x4QTBWNFJVbjl3cTdVWmdnNnlVYVp1MWswOFB3TlNId0w4TzBy?=
 =?utf-8?B?TnlOc0d3dS9pL0hqd3VSRzF5eW0rdjF1dEdGZUZrZ0QxM1A3U2toVGdaZkxE?=
 =?utf-8?B?YXNxVWJ4TkUyUVFjY241aE92WHM0cjkydDBzQ05DQ3doVUY0Q09ldE9vbHVl?=
 =?utf-8?B?a0xMTjczUWt2NU96amt6RXFuSUE5TjZmVXM1Y0dKSEdNbGZBZU5HS0dUdlZK?=
 =?utf-8?B?bE9obUIxd21TNVM4QmFPSlBBVXVESFRNY2xqRjA2NEhocXdNY3ROV3hnZnFF?=
 =?utf-8?B?WmN2RWtCU1orYXVBNFMzN2JkTXFJSEEzRWZNdXAvYUl4a0pNdThBV0J1RjV6?=
 =?utf-8?B?Wmtoait2Z3FzVzJaYkdOcUhaTjJyQ0FvWFhPR1dXUHd6T0dwQnN0b1RxaGRB?=
 =?utf-8?B?VGk1OU1lVDVVakE5VHhXL0k3OHVZMTRFTWFyYnlnU2N0Qlg0N2l1dXJUbG5W?=
 =?utf-8?B?d1k1YVg1aXNub1lERnNNZmpqenhkM2RzUW5EeTdEcUxBcnZDQ0Y0ZlRIVWtO?=
 =?utf-8?B?czBPck1lZVFUTmNBbFAzWDVNTzEyL3hNdXh5RFlpZmZkOGxCS1crdXdVZzV6?=
 =?utf-8?B?Ui9ycWhkRVJ5Q1pJcTRWRW5sZ0U4R0lOcEQ1QWI1bWdSVE1rYzVveC9oalk0?=
 =?utf-8?B?L0IvdWhrZ0xGVENmVW9oMDFaVzY4eGVNeDI4bDFWeGxVQ0JIbVIwUUFxdEJp?=
 =?utf-8?B?RVcveGFQZmNxNFlNZUdwUnF5MVhNNjUyUUsxcHJMbVA5ZU5iN0lHbyt3eTZO?=
 =?utf-8?B?ZmJJeHNTU3BiOTFlMDNmL002Sk1wcG9PSlF3azR3MG5iRjlzOFY4QlFiZWZE?=
 =?utf-8?B?b1o2UXRDQWd2bDh1UG1sd0pjZnNOYSsyWWFzSmlONjRDMlNMRVBXYUtJbnE0?=
 =?utf-8?B?UlhuaDQxWWxxZTBOQ28ySzRNK0dkbDQ3V3dIZnhhSDBqV200ZGw5OEFvU1JM?=
 =?utf-8?B?a21vS3o3T2h5QktRK3ZpcmRxaUJHcUlOTnpHaDl1QUIwRi9mM1RlVDZvUVRr?=
 =?utf-8?B?S2NrazUzU3pySTY2cTlzc2RrK3dHUk9Tck1MTjFpSWhQaXVuZWhZempQZGpC?=
 =?utf-8?B?b21sUWxJQjRWUkx0WlpGRUdBM0l5Y0QyZ1AyNk5mL0RWdytmMjArdUZRZG5i?=
 =?utf-8?B?SXA2MzJCZnNrU3BhbzREOTN2OWhrd3FYNzQrc21abmpJZHY1STNLdlBnVlo1?=
 =?utf-8?B?S2NRMXRJZm0xaWlFUlp6SlBqU0VNQ1dEM0N5ZFRYbEh3cXVCdzFpdXExZUw2?=
 =?utf-8?B?UnBhU2tTLzVJYTJ2eE9JMVpSUHpIaFJMbmkrcWprQ0duS2ltcFQrY2NFYThs?=
 =?utf-8?B?bWVCaUZCWUpRc09obDd0Y2F4RjBOeVQ1UFl2eFlZUXcvMFV6ZWNkQUJTLzNG?=
 =?utf-8?B?UHpaK0dmOXR0VUlxRU9tM1NGK2Fnd2NmYlRndlVTYzg3QkQ4WkpIMEZoWENS?=
 =?utf-8?B?UTZJVlZqVlZyRWh5WmVZMmIwNlpaSlM2RGFYZ2FhOUZQYU9KeFpJc1BqSDFl?=
 =?utf-8?B?VVJkVXlSOUZOSjFHV2hGeDBZLzNTdjFNS0YwNWhIcEo1YWQ4SFVLTy9ldUlI?=
 =?utf-8?B?R3A2ZXZvclQveTdzN0FaMmwrelBuU2tIVXZtbmN6d3ZQTmlGRFo1Z1RLMy9G?=
 =?utf-8?B?V2oxZW16K2lVS3RNRkVzZ3RRYzhtVDRsdU9sTXR6aVFFeTFLV2g2aEdxUEtO?=
 =?utf-8?B?YU9zaFYzRkN4OE82RnlCQjBRRWdyczZnVTNMbytMbVQ5ZjdjMitEUy9idDdK?=
 =?utf-8?B?dG1kNmVXLzRnVGtjMHlVNlhuUGhpbEIwMHduQTl0Z0p0Uk5jd1o3d3hoWEdl?=
 =?utf-8?B?UjlGV3F0bHdHWnFzUzVXN3IzUEpzaWZlc0dZd1RqZDZDMEVNcXVwOFZrVHBh?=
 =?utf-8?B?TW54VzEyTGlLNWFmV3hLQTBUV0c0SHU2dkNTNnZ0QXM4QnIyVWJKZkVqcnB6?=
 =?utf-8?B?VUJIdUVsYUhrRTc3N05zOFVVdmVBL3lReDM2Z2FSRmg1N3BRbjMvS0txN2t1?=
 =?utf-8?B?ckZOUHpNbmVleU0vS1ZmeXZMSm9na29jdGNXTVZ1M0YvQUxGaVVyUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e2549d-fe8d-4aae-ac52-08de5f40a1cf
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 14:13:53.1439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7iYrr35wwzb9LWSaqA1PhlqDDkTW8vdWAVC2w6vZisGQXV9oBe0FnN9iAhh+hc8DQVL3j+1XaPD5/gEmucZ64g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6541
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,Mac.lan:mid,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C67FEB0CA4
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 02:09:27PM +0100, Jan Beulich wrote:
> For DomU-s, whether to emulate accesses to the first 32 bits of extended
> config space as read-as-zero or read-as-all-ones depends on whether a
> device actually has extended config space. If it doesn't, read-as-zero
> isn't correct; not getting this right may confuse functions like Linux
> 6.19-rc's pci_ext_cfg_is_aliased().
> 
> For Dom0 this then simply allows dropping a later conditional.
> 
> Fixes: a845b50c12f3 ("vpci/header: Emulate extended capability list for dom0")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

