Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGGcNTuae2nOGAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 18:34:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8BBB2F67
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 18:34:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216939.1526840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlVtx-00015C-Kk; Thu, 29 Jan 2026 17:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216939.1526840; Thu, 29 Jan 2026 17:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlVtx-00012b-HL; Thu, 29 Jan 2026 17:33:53 +0000
Received: by outflank-mailman (input) for mailman id 1216939;
 Thu, 29 Jan 2026 17:33:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XEJ3=AC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vlVtw-00012V-Ix
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 17:33:52 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac79fe23-fd38-11f0-b160-2bf370ae4941;
 Thu, 29 Jan 2026 18:33:51 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by IA3PR03MB8455.namprd03.prod.outlook.com (2603:10b6:208:53c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 29 Jan
 2026 17:33:48 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 17:33:48 +0000
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
X-Inumbo-ID: ac79fe23-fd38-11f0-b160-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qK0C72eA66ZCJzqCiNMo7F4Z8WWGEt1mrNKMx7htRLHA//hajPGxHwY01PP0AKAi/7LV6r+ohnrs6Fm/ozDdW4F5EjD07XFjbvZZk0C/+StNrfzx4XJEwzngVZ6j1DCtgO3uYgJlE+LUaJuPgq2ynw9Nw4Q504RYETXkBqYy4HnEwUm9fYhC2JOr9612B6UB99+pltgTUhuTArRWyxlTDwx2bN2vCaYxo8BjaRd+sJfkJF9uSKlrHfBblJc08FPwRoVIWy4hEolWxT63iGjSkxVYZsZOOxr4f7h3j7PpSUki1ifnZRSAz2lrbUgV/bhb51yJ3DmxvO4uCTwMhhmb4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWHjyiGi6yM4GUU8FOEpWD4BhCr0Dthkr0JJUa2/YuU=;
 b=GmQgGjphKGFKbUkZEpJbxLHhjHGwzlqTjHry1U2GigoMtfYtCSwXIA+WFIZR8VwFheGekXrCbyo+pdUnFM8sFxKfNGDb5B6+QZUtPsSQAupVJGFYHvmEC9+tE71mPsi/bAkxHc4VgXNQf1o6Yb6e5onN3i2c6LuAT+Vcg78lHqPG4YLPswSYo0MSs3h73EqYT7eDu2ZupbczznSWeXMkGT75N2I7RQIoHjpJH3XOMe7TwijIqU3byVeelMzyM+6OpewKY6+T77vUFbzAMQ01Xc8ySHAS6rPk53T1jSzz24A4cQXDY4CJ7LDjDPdNDuOu3QSeLmk9rdEKPbY0Lvcqyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWHjyiGi6yM4GUU8FOEpWD4BhCr0Dthkr0JJUa2/YuU=;
 b=BO1ftad+LJEZ7EYIV0cWWzOyoWcY5pQDv7snvTkA1finNWKNyJ/3b49JrENnqS9dUfj9TJ9+wdjxEaxf3Ib+b60aquScI28Awb6smVzDDrPWj/gAiImMqRsVCotjSXkHKtoeKRPgjY3Ipx6Kw0eZyQqZniwqtW1kuV0jNZekWFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 29 Jan 2026 18:33:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 2/3] xen/mm: allow deferred scrub of physmap populate
 allocated pages
Message-ID: <aXuZ-Hic5EMgGhPE@Mac.lan>
References: <20260128120339.47373-1-roger.pau@citrix.com>
 <20260128120339.47373-3-roger.pau@citrix.com>
 <baee2f62-786b-4ed3-9ff4-cde3a06c4eb9@citrix.com>
 <aXoQHCRoakqtJrlc@Mac.lan>
 <163e1fed-8a06-4078-aaff-8f0ad0ce6601@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <163e1fed-8a06-4078-aaff-8f0ad0ce6601@suse.com>
X-ClientProxiedBy: PR3P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|IA3PR03MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bb20d02-e0e3-450e-898e-08de5f5c8f52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXFWc1B3eUw4UWdwT0FUY2dQY3VKb2Y3Ny9qc1ZodFRCQ1JScWh5c09XUjgx?=
 =?utf-8?B?bkQ1QmFiNHhRdTRnRzVleGk4RWlZOVg4T25kOVhKcE94ZzU5YytLUERPYitp?=
 =?utf-8?B?NlJLeGxqVCtlYVhFbXBCbXZUWHhYT0tWV0NYekRwdHRIcmEwY3JTY2NVdDRJ?=
 =?utf-8?B?KzY2b05MZ0xPR2JEcDJoZUV4UmptVnJuZXUrZ3dzOG9MNnR0a2tScmRVdUVm?=
 =?utf-8?B?ejJTRGdIWnFaVUkxOHkvOXhzaU9WMnVNUUVhWFNTR0czc3FuUzNLampIb2pp?=
 =?utf-8?B?NFRLWlBQQXQrTDBDb1NtQm9XOXNjSm1nZkZEYzZVV1N5aDJ3U3p6STRFNC9w?=
 =?utf-8?B?bmtRWE04MXp6SFMyVDU5Y2RFUGxGUjh3VU9hbWZKbTVWSkUzS2t1WWloV0lD?=
 =?utf-8?B?YU9heVFGYTBSZ3dpYjFKK3hQVlhyN0xnM2xnb0VCUjI5SWdnK1J0WGROYVA2?=
 =?utf-8?B?cDNWNkRvYTl2MHZKSTdIRkRidmpWRzJCQlNFczdKZVN2VUNPWGRIQVo4bWMx?=
 =?utf-8?B?TDkzZ1B4T1MwbmQ2SVQvZU9QWVJweFE2Zmg4YUErZ1FuMjBPWnVRUGUxVlRl?=
 =?utf-8?B?VXBJa3VMYWsyMkRCdGdydGpjRE5CVmFjMlJkTUlwYTRybjhsdjBXYkdUSUVw?=
 =?utf-8?B?MzA0dDJybjdhbDFkUVZydi83TDdNWWkwTlVMc3N1SmtTM3BUaXVnSnJlQXlu?=
 =?utf-8?B?TXI2U2NLZlN3c3BUN05kWm1nc05RSVVLOVFnUG44S282aFQ2bDJxRURQSGpW?=
 =?utf-8?B?MUtkZEhTaFpRbUFRK0RDd0YxNDBNWlRmMkt4WnNkd1l3WXlPd3ZoWHUxVVll?=
 =?utf-8?B?U2NCV0ZKSk13eTFEY2ZsYTVYMG54d1pzL1RRY2lZWHFrWmlMaWVaNDEvLzMw?=
 =?utf-8?B?dFUwNnZLRHFXVE1xQnhHN3FSRXlsZHhaZU9Ud083TVVzWldzQm5heFU2M2Ro?=
 =?utf-8?B?VUU1WXVNNVBhUklKVy95WTdMb3BjWVVjZnZYdnJDQjZvdnV2dmx1ei9jZGVV?=
 =?utf-8?B?cGJFMWVMMm1rMTJveS9BUVd6cWV0MHRCQ1ZFTDU0OFpmMkE0UVN4bTROcWJ4?=
 =?utf-8?B?cjQ2SkM1dWlCeXc1cEo4TGN3a3pmY3VyUUV5ckhkMXByaFlvWTYzRHR4TWZS?=
 =?utf-8?B?Mk1UOTN0NVZGVWpXRGtnOFo0Z09EdzJkc3dsZkU1TmQ1MmZ1T0hvR3k3YmFY?=
 =?utf-8?B?SE1kY3NLTm4remRrWDlSUGpFejZnNGxVNWYzLzROTldlUXNraHl2UlBNd3Nu?=
 =?utf-8?B?cmpUYjcvdHR1T05pa0dBQzdCeVJvWVFIWXp6WGs3VEp4ZklkSHgwT051WlV3?=
 =?utf-8?B?MkJHY2FFWGpEYllXcHNreVRQcEJNUFZNWHphdSt5eURUcEVEckxOSmtBQ0Nm?=
 =?utf-8?B?R2V2WXNVV0RYUllzdTduT2R2MUhPVWlDTzFrK2tLYUJxeENCb2V0L1dyWjlw?=
 =?utf-8?B?T1kxaWlvNnh0UUdmam9qNG9XMEVHQWpidmVqKzFkWmdSZWNjUklUVEM2bEpI?=
 =?utf-8?B?VW4xN09WZkdzdCtvaExsMW9BOFJOWWdSZVZxOFRmSFhvUDNIL1dNVWhFRGpr?=
 =?utf-8?B?bE1OdHpKTGN1WW1maXNGYk5Tb1k1RU8vc1ZYeC8vQTRXSDViMHRScWJDcXlB?=
 =?utf-8?B?dDIvZXd0WEloN0kzSXhDSXhBUnhod21tY2VoRXhLQ2o0UDFCc2hYNW9yWjNO?=
 =?utf-8?B?MXgrUW5xbDhadG13d3NYNnFzQ1J2eHhTcW9KVjcvS052QldkU3JKR3VxVmVq?=
 =?utf-8?B?QURTRVRUbFdmTmJlcnRBM2Y3QnJWTXpIbXRhelR4SnhSMEthMnNHNEZxc3RN?=
 =?utf-8?B?bXlRZlZ5VGU5b3paRHRlMWgrR2tGbEw5OWJYa29jTzYrWnlLMjduWmRDRjE3?=
 =?utf-8?B?eWdyT2IvTFcxSG1FQ29oQmdHYytmeEtMVllWU0N4TmI2eFpseXhBMXJ2VHNa?=
 =?utf-8?B?eWZqSUs2R05keVJLSDdZR0RZUVkya01lSysrQTQxeGxOQjFKaFRVSEZPeWJV?=
 =?utf-8?B?ZjNmTFA3NVVPZDlDSkpQSlpiTDJWZm81UnBuTndGdWJuT0lsYzBJMnduT3NZ?=
 =?utf-8?B?S3Z2MFRJaDRhcTZjWVBEclpWV0NpWmFIbHRKU3V4UU5Jb0JzeU4zZmNJeFRV?=
 =?utf-8?Q?zShw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RU0vOUNjNHJ3Znl5OEVGOEMvd0w3OW94L0xHQjNjYXdVUmZXaUo0Z05za0NJ?=
 =?utf-8?B?QmFiVUZIcXh1ekZYclAxNmp0ZmtmVU8rbXRXbFBpUFlIVG5XU2gxWm9LZ29V?=
 =?utf-8?B?SktSNVZQNExNRytpQjVlTzltSXdNY1NDTHlDWXNxV0lQd3IxWUJ2TGllRzVB?=
 =?utf-8?B?SlVFdmxqVGJTbU9jd0dXaWhVNGw5OG9NQ24zenVtNWtieVIvdVFzS2RFdlp6?=
 =?utf-8?B?SG1sU1pSZGV3cDA0bEN4Z0JLVnNaUUZoY1FuQUozYVcybHpxQUhTdE9JRktF?=
 =?utf-8?B?QzRGWE1UTHo3VHdwdWRiSjlVSlN2eUd4NGZMdmRuL2g0OHc1Y0h3YThFWE51?=
 =?utf-8?B?K0s2WXAxTVVPaUpXNVNvaTF3MFk5TmhGWmUzdHFRRllzcEtRcHVycktFSzNw?=
 =?utf-8?B?RzNoM3lVRXJIVkRZUzNVVGpFQ3g5NThrbUpudk5XdlhQbnZ6MEtQckczVjI1?=
 =?utf-8?B?QUdPM2x0KzFheTY1MW5rQUUrYVhvalg3U1VxTEtaU0pKWVRQZW5rRVpPb1Y0?=
 =?utf-8?B?VURVRlVQNC9kRWJFUXdnS0R1aTZTcTVINGFPK0t3Z3lnS1JLZFdRZnhSdXhG?=
 =?utf-8?B?aDE5NkpnbEZScXArbDNTUC9SNTRPMityMDVpK0tDcmZNS3ZKVWtydGFiNDZz?=
 =?utf-8?B?MWpxTWFuUE56NEVlN3FnQlUrWkdnblhCNG8wanV1M0VTZW5sYXpBQll6bUFS?=
 =?utf-8?B?RnhBS3cxUUhXUXdlcDhkMmcxa1o1WWNabFJ5d3hWV3UxWmN5eU1DVjFNUFlM?=
 =?utf-8?B?dWVMb3F6THdmY0RyTHM0VGdPRitKWTJFNlR1cUxjUllpbEFSYXd6MmFTdkRX?=
 =?utf-8?B?NURldUlEQTl2T3RYVWxFQlRSa09Sa3BuTVZ1SHA0WkloVUk0TDU5d0pJWFJM?=
 =?utf-8?B?ZlVzb1IzWm1seEhqeVk4dnFHU2hadkNyeVo1RXFzeFkwU2FpZmZhK2piVHBL?=
 =?utf-8?B?OGIwK0MyVVhmWHo1QTZTT0tySit6ME1aOFZOVVNFTHptaWh5VEMrc0xtRmpY?=
 =?utf-8?B?c1ZYd3cyNE5kMFBOV2hvYWZpOVd2citKQWtkWTREY3FPYUNJQkxxYkwyb2NL?=
 =?utf-8?B?YlhUV2VoZmlLV29yQ1UxZVdRc0RsaU9sMGRiUFdRd09pKzVabEpReFlKU1dY?=
 =?utf-8?B?KzBlRDRWMVFIQlpOdFlFdUdxVDRkTFQ5T2lvQ0NkTnN0Tnl3cWgrMUx0UkFz?=
 =?utf-8?B?TFE1ZkVBODkvcmI3eGpmT25FVmxrRTQ0elNsdE05Sm9sdVNKUko1aWt2aURL?=
 =?utf-8?B?dnJYOEVuTW84RUhqMWZxbmhockZNeGorOFBlSXNRUW4xUWtub0tmaW9mODNi?=
 =?utf-8?B?RGVoZEdRT3ZsOG54VS9KTHVGVWUwUUYrUWFtRnBOUDY2Wnl5SUkzL0d5R3Uz?=
 =?utf-8?B?VEdabjVobTB0WkYxUUVuWlVhU2pWTGFyVUlJeDFKRHRJK3V3azZwYmhvcjJo?=
 =?utf-8?B?ZXIzRWtPQlluV01LN3lTZVMzL3JNdFhiRlkwQkJ2ME1ZMnNvM0VvRVB4Y0lM?=
 =?utf-8?B?cS9vRHpuSW5rbW9ZWndyU2FmV3U2YkhnRzRod2I4REVRMFhlMHBaV2ZKQ203?=
 =?utf-8?B?Y1dpVXh0S1owdmpaUXoySDFnSnpLdDJCUDlYZzVvRHZCVnlpck53R0pMTE9D?=
 =?utf-8?B?eW5jdE02cFphMUZCU2JBMVBneS9tdXpaVEgzTzF3WnJWcjhzMGxwMWRranBG?=
 =?utf-8?B?aWw5RzhRWnVrbWVUVHh3YlhMVGJaQThzOTFMUWZNRUFPOUlLRFNObVUzT1F0?=
 =?utf-8?B?M1ZqNFI4aE5EZ2pKNTMzNE9UK0J6TmZ3ZmhkUkMyM1Y3dXJBRWx1dDJaeHNK?=
 =?utf-8?B?MHFEN0RpY3dJMFhWMTJXa3diTkIyTWNOazd2UlZqeHloQkM2OVdMRHRRaXFF?=
 =?utf-8?B?VDczaU5ZSUpkdHA2MnduRFY4TzVlUkllZW11TW8vOFlvOVpmdjQ5YUlIYlVu?=
 =?utf-8?B?c0FBZEVPd1c2ZXBkbzVTbC90NVZ3S2pubVVpS3RaWDZFb25QK2d4UWFzSGNq?=
 =?utf-8?B?RXc1d0VkY1pMaDV1anV2OVJCWUZPZU9rbVRHckVoa29oOTRqOHBtSUhhVnVD?=
 =?utf-8?B?NzE5VFovaUlrQlJycVUxZmdFS28wVEszbEV6SjdYUWFrRGVuQ2Z6c2JuS0c4?=
 =?utf-8?B?bWcyR1Z3MnlUVTUvS1pzL01WMmFRYzJrMmxlM0JHTlRXZHIxYjQ0NlFnUFAy?=
 =?utf-8?B?NWJIa3U1UkVMUmVyRE9CdDRIdk5ha2lYaUp6dUM4QVd6Z1dLd2RtT0NSZlZw?=
 =?utf-8?B?N29UbE9waHpWMXZMcDlRZzd5Y2Z6UHJBa1hvTGdnSXNIaTBLZkNSbWtQeU5B?=
 =?utf-8?B?c3drRG5UR2x0S3k4cUg2STZsbjd2L3ZXaVJ3R3Y3d29mTmMvTlFTdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb20d02-e0e3-450e-898e-08de5f5c8f52
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 17:33:48.1251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KPDnoq4huSj2mbD6WcVouiPIrxPlkzFFKh/Z/Rta/1qcBGPjLHfcmi7vAW+WtXHb6KqZ8sDakavB74wI5L/wpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8455
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,Mac.lan:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3E8BBB2F67
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 03:34:11PM +0100, Jan Beulich wrote:
> On 28.01.2026 14:33, Roger Pau Monné wrote:
> > On Wed, Jan 28, 2026 at 12:44:26PM +0000, Andrew Cooper wrote:
> >> In principle we could assert that it's already NULL in _domain_destroy()
> >> which might help catch an error if it gets set early but the domain
> >> destroyed before getting into the domlist, but that seems like a rather
> >> slim case.
> > 
> > Given my understanding of the logic in the XENMEM_ hypercalls, I think
> > toolstack can still target domains in the process of being destroyed,
> > at which point we need to keep a final cleanup instance
> > _domain_destroy(), or otherwise adjust XENMEM_populate_physmap
> > hypercall (and others?) so they can't target dying domains.
> 
> Considering that these requests will fail for dying domains because of the
> check in assign_pages(), it may indeed make sense to have another earlier
> check for the purposes here. Otoh doing this early may not buy us very
> much, as the domain may become "dying" immediately after the check. Whereas
> switching stash_allocation()'s if() to
> 
>     if ( d->pending_scrub || d->is_dying )
> 
> looks like it might do.

Oh, I didn't notice the check in assign_pages().

I think a check in stash_allocation() together with a call to
domain_pending_scrub_free() in domain_teardown() (which is after
setting d->is_dying) should be enough to ensure the field is clear
when reaching _domain_destroy().  The call to
domain_pending_scrub_free() in _domain_destroy() can be replaced with
an ASSERT(!d->pending_scrub) then.

Thanks, Roger.

