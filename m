Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAA+FprleWm60wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 11:31:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6159F7E7
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 11:31:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215352.1525554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl2po-00051i-MJ; Wed, 28 Jan 2026 10:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215352.1525554; Wed, 28 Jan 2026 10:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl2po-0004zL-J4; Wed, 28 Jan 2026 10:31:40 +0000
Received: by outflank-mailman (input) for mailman id 1215352;
 Wed, 28 Jan 2026 10:31:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4J3=AB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vl2pn-0004zF-Qh
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 10:31:39 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 849aca90-fc34-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 11:31:34 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH7PR03MB6971.namprd03.prod.outlook.com (2603:10b6:510:12e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 10:31:30 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 10:31:30 +0000
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
X-Inumbo-ID: 849aca90-fc34-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRejn8p3mcbJ0EEjmdEV0T1tQnRLq+QExxy/aci13OkCh+MN7dc/N2aKZS2QOLCn9lhTndoBefWLaudyDjq6t1oKldHC11Sk5Ao/DNjtyzXwvSpMPKYIoP7x9pEXe8P+zPaM+Oq8tPJoha+D1gSRRsyzHIi6ti44R+iJyZl3MxrS4LL5OMgTKXrgJKlLr50Bqn92iZ6C6+HbDUEJWb3WjBHsiYJlf3rPTYx4OFi4wqJrJODOnCG6sgQUw5hD88pgYmZjKjZ+IET9j2NyIo0WmGNO2dp9sj/elnYFEvVfIhvvr6NCgWnXfvBDncEvZc2CdiQ9iGDeZQ0JhpxcavnwNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQBTXLz/b3hK4vODRGQJoS4ez4gWttWrXtaYtuOrxI0=;
 b=LWUiiEFfftCahSmHYpG+ZuI29ya5WYaGagUXNCkJ5Bkvvpd5Mp6X9m+EGwjpxBSqJdLAusk5T9cIQ20tDmvF1vlublnk1/45mZD56xMC6/zym6aa5VrmE+hR0JjCav1l1kuyF2mqpaME6RJZo2scJJ43yqbMM1tUa03ihpVJwfGBfqU5ctJwU/siKl8Z+uchUyIzaA6ftNi7hHaPvDinTnrlZS381vJQtOgCrYr5+amok8fIg5EvUPgCbCuiPjcEldhJI7LesToBKJSF/sR49i8jxTVLaB6ucH3aX6wt2NwIImf9Y0B6nd0fP5gECf0gxzu9tefroschlJt/3Y5xAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQBTXLz/b3hK4vODRGQJoS4ez4gWttWrXtaYtuOrxI0=;
 b=eTvk8zAPq8LaAl24TcCnLTr+7YWy6UszyWHIPjbBYQG+jHw1/XpbpYsWE0EM3v7rRtw8hV/vuKcYN+ZcxMOwkJj8XxnALS3d/BFDD9zs1bm3xwOPDWw3TFtX+5RJVldeI3dcbcuDnN7uPL6AkVXAo1m3byGOALQt5ZMeqRbKoc0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 28 Jan 2026 11:31:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH] CODING_STYLE: Establish a policy with regards to
 copyright notices
Message-ID: <aXnlfguNkm_Wuqig@Mac.lan>
References: <20260127182403.141459-1-alejandro.garciavallejo@amd.com>
 <aXnEdQxyevj-wMuv@Mac.lan>
 <DG03YWKDDNUC.1622RXX7ZJUW8@amd.com>
 <aXnZsg9mRD_atvt2@Mac.lan>
 <DG057RNBOT01.25ODFMNGWAZMO@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DG057RNBOT01.25ODFMNGWAZMO@amd.com>
X-ClientProxiedBy: MR1P264CA0031.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH7PR03MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: cb1ff30d-edb3-463e-8ec9-08de5e586656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZVFTNlk1U2FWNUwyVjhLSHdWbGZQYTRZV2ZBNmxTejJIN25UU0FwTHJOMWRB?=
 =?utf-8?B?MUsxc29qK2UrQzQrSUpDN0tVSlRrci9ibEFWVlFjZko5MnVXUVZ1UnoyOE9m?=
 =?utf-8?B?ZDZCSTZ4Snp4RU52OGVIa3YzaHFaTC9ZWDlWUVd1RVFJb0gwM0ZibmRuckwr?=
 =?utf-8?B?cGVRZGh5bndUTnNkdzBaZzZJQ1ZGZUJ4Wll4UkFLelRCUHNQdHhYaWJVWkhR?=
 =?utf-8?B?UU5iaVFKK0pvQmpZT2dMOXVBVnZ6SVZORmpBS3hhSFgwNTVIMjB5OWkyY0N3?=
 =?utf-8?B?NS9FK1d6bHIwNzZjWXl3Q2o4Y2lOMVpSZUNJVmpmQmJVbXR2YlZrcjJRODRV?=
 =?utf-8?B?L2dyMy9FU3ZzdFJKOVk0Tm1udWNhSjFaM1pwUThtOEZjbUp6QkdVd0F1ay9l?=
 =?utf-8?B?N0ZJRTZleEJqVDhvTTRzR0tEekVBS1l2UHJqdGlLOEVOdVZWKzl1M3FPV2R6?=
 =?utf-8?B?UHNleVBlV1UxT1dmdmExZ25USHZKWWtCWTdzeEx4ai9GMTV6SVZHMkx4ZmlS?=
 =?utf-8?B?Slg0QVFTUldsZW0rTzlJZWlzcStqOGxnS0IrT09TOVJlU1BOWTRneTVMTVpt?=
 =?utf-8?B?aitJQjQ0aG9ORXJuZkJ4VHhkUDVxazExWXM1QStUc3dlUFVqdzhua2EvU2I1?=
 =?utf-8?B?RnQzbzhDcENYS1lERnZNVndlRWUzY21CdGhralR5RGk1aXpHb0lqZTdiMCtv?=
 =?utf-8?B?NzdKMmtud29oNVIyWkM5eitXMnF6dUhoSXdlcjF3cDBMWmRvRjBSUzA2V04z?=
 =?utf-8?B?MnU3YlMvd0VxK3VXZXU2WE5SWXpxZ3k1UHM4UDhtM3BOdFNTNlFMMnVSTXZS?=
 =?utf-8?B?bVZmMjJ1a3hnNGVIckxKWUVTWkhBMzhCY3BMWnNnVnN0aEJQL1JhdFBzZ3Ry?=
 =?utf-8?B?Nml6T1hWaFFMTCtuL3p3RWVWNDBneHhYZXNzRFBFWndrT0JlRFk0U3VqK2du?=
 =?utf-8?B?M3dPVW5QS254SkJrell5ajZsTjZYaU5STEtIMUcrdzk0OVE4UVJpeS8rc09o?=
 =?utf-8?B?dWdlMkxRTmQyZVNiTDZHSnZ2UUtHbmNqek03VmdPZkZNTHdyRXNFMnBQTDNT?=
 =?utf-8?B?djZGTjVHZmI0SzNpVDdxdnBCS0lGNUNuYWtPU0RsczVndEV3Z3ZRbDdoQWpx?=
 =?utf-8?B?OE1wWk4xcTc1YWR2aFQxdm4zaytLMVlFTVlUcUdUS1ZHQjVva2FZRExIZndW?=
 =?utf-8?B?Ly9rMGIxRFdqdEFjNDFqczExRTg2dnM0TjdIbTUvVlN2VjRPZUNrMVJwRU51?=
 =?utf-8?B?VXRXbml0eGRUa2xqT3A0WEhCUTFMSWZEK0RGTmFvOTVDTzBrMURGVHFVeThW?=
 =?utf-8?B?N1RBSnI5bmVXMGt1YzJsK3JJOVA5RFAzd1pUajVDQ0Fvbm9mOFZnSjhHTEhP?=
 =?utf-8?B?NHJnMklLblozZWlXK3cxY243OE9LeUJLcjl4aFZiTng1RHpBSE9oYldhdXM3?=
 =?utf-8?B?Q1Ztd1hzRm5DNlAxYXFYd0RtM1JKQjlsQXQyTmtZZ0w0cmE4VWh2RjN0c3NV?=
 =?utf-8?B?VTlleXR3NWdIbG1jTDduQ21wb0EvbnM4RzhjWkpkaXBEQlBiRktDaUQ2cldV?=
 =?utf-8?B?ZEdHNlErQkFrc1NJd1JsQ3dFMTEyR01TZHhTV0tyV0s3ZzdGcU50SlFvZkpF?=
 =?utf-8?B?T09aYzRJNFBmaVJ5ODhORGhWUjl3OGhKRGRLZmNxUWRobEFiZzQwT3FNNEZq?=
 =?utf-8?B?OFNwdHlwVFIremVRZjhHZDNhMW4xcERheE9LTWZxbU16L21UbVZKdzMrV1My?=
 =?utf-8?B?TGNnS3N4QmNBUnJNRHF6UGxMalBmdFFxTFU3b3EzWDMxd1hCeWR0cXkvMHBI?=
 =?utf-8?B?OWVJNGRKb0luMGZCaWNTOTU2UnhPcmV2NjNxVkpLdHoxTU5ST3dDMzFuTWpG?=
 =?utf-8?B?aHBSMEZLMzgvV0M4OUtRRnV3YkFqamxPd1diaTFzalRUNSs5aDg3TTl2Uk52?=
 =?utf-8?B?b09rREtPWWNENFplTk9EREN2WUlxdmtpdXFZSHB4ZGVsVUpBWnBhd2R1UWI0?=
 =?utf-8?B?TWlRWlhIWlFZWEp3ZjhkM3VpcFVjVVlKTUw3UXVCak9NU1B5aWc1T1dhMHAv?=
 =?utf-8?Q?zmfDXr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0Y3dnJkeTJndWhzd2VEeUkvSDM2YWNoMVZtWEhFNkR0N3BoaEtUOFgvTTRr?=
 =?utf-8?B?TmFLVm8wdXZHMUhjRFFpMDJaalFxUmg4RjUxZ0ZHTVhuZVdOQytoWDdOdUxx?=
 =?utf-8?B?VmlQZlAzVWZiWit3SktyNWxaejEzdnoxcXRoR3pOY3lqTndqMGVEYWJqM0dk?=
 =?utf-8?B?eGFFZmJKb1ZDMzN6Qys4SnVKMjRBVXRlQmkvVnF2UE5GSVJ6ZXpyU0JHK3RT?=
 =?utf-8?B?OVlpMDdIYjkzYzBIY3IrZk9SUE1VM0pRZStEaTQrWEtNaGw3ZW9OQzFZRGp1?=
 =?utf-8?B?UCtPU1JKVmpqZDhHYlhHejI0N2tDc3loYTBESDdVcmY0cHExVDRRL2h5Qzky?=
 =?utf-8?B?WWprUHFTS1BxV0I3Vmt3NjJFYW5TZ2dKNmh3cnVjanBWb1VzZjBRanRTdEw0?=
 =?utf-8?B?bm9OSXZkNXRxeko4VTh5RVlGdU5jaWIvTWpjQVZzRlFhQmxJQXNrNDFRT2Ux?=
 =?utf-8?B?TFo3L09hTndzM1ZZM25rMjYrNkJVUmJDWDAzbVpYbkV1WHZma2VNb1JkNGV3?=
 =?utf-8?B?WHp4cUR4Slg0WmFhUktCNzcvSzdLWTR2dDJwdlF3U0sxTk1CelBjekxmNzda?=
 =?utf-8?B?RmZQVjI4VDhQOGZ3VzFIc1JHL0wxMGV1MnFDeDU3cFhsS1RFK1dVNVZHd0lH?=
 =?utf-8?B?aWpIOHNxbGhGKzNzUm8vb0dWL0dvektqazl5REVoL0ZQa3VBV2tubTNia0Ev?=
 =?utf-8?B?TFIveEQ5cnZPb2F5OWxvbExqSWRhQks2NGhpa25wRlVwM0ZIdmpFR0JhMlJM?=
 =?utf-8?B?SjJ0Nk5UUWtFcTUzQlRKUDduZThUeDFvMmVXK3JzRjRaUXIzUVB5VkhXNXd2?=
 =?utf-8?B?T0ljQWlLQUd2SkQxbW1VaDI1ZWlQSXBGMHE3bDV4NmoyQnZEclY5Z1B2OGJ4?=
 =?utf-8?B?SHB1T1lYOC9PR09ueEpSWWhYSkFlTU9UcmRiVUVnNDk2ZHhwKzhDN2ZlSEN1?=
 =?utf-8?B?U1dzQ2pGVnBJUGo5L1dHbmhwdUQvSFR3Zkw4WW5GY29ySDMxT3kvaVo3eTk2?=
 =?utf-8?B?S3p2a29LRlN6Ny9qcm1aRVVjSlRTbHI3UkhUWHlWV2hqRy8vdWl4NjRIbnBT?=
 =?utf-8?B?MHN0bVVEZnVMd2JFMmtSTVFuYmxxY1hRcnhVbWNzcVU0cEt3aGxOMGdLeGYw?=
 =?utf-8?B?REpwRlVpNGtzYXpXV2VyRkpHcTNuTFQvWjJtT21NdmFOUURSUDJuanMwa3Fo?=
 =?utf-8?B?MTVUN2NtWEUvRVpOVEFaNmMzUWxQVWdSTE5ROFYxRDNNMit1dTBabm9SVWwx?=
 =?utf-8?B?ci9mR1pFSVFxb0tuMWtuaXpzMXV2bkJ6SnpBK2lra3ljNEFVTVozSFpHM1B2?=
 =?utf-8?B?Y0RBQWF2aE82Wld6OHRROHZCUDZGMVU0TXFHR1BHRklXMUxnVjhjaFdPNVY2?=
 =?utf-8?B?VFg0ZEVIalg1QzFHOS9xa3dpZEFMeFlSU3hqcEx6QnVpNW5QYXJ6eEJHZ3ho?=
 =?utf-8?B?QnI4N0VHbS9Nd2pIMkxQVkF5TzdLVkhMYkdwb0tWN0EwUWZ2NmdjeGV1SzFK?=
 =?utf-8?B?ZEdzOEVibUJreUM0cnNpaEdTV1NtMzM5MEdrREZ6UEpHZy9HRDdTb1o4QzRm?=
 =?utf-8?B?SHlGdjlaa3FBL0xMN2x3QWh0Rkp5WDFVSXlPSFBUaGxORlNSQ3JOV3JMc3hH?=
 =?utf-8?B?a3B0NE1vWlNHd3RTbnNDaWxXWFpWcU1ycXpIcDZzN1pHRVYyYWxJWGhrYk1n?=
 =?utf-8?B?WmRQY1RNRlY5aGJYbysrUzJkY1A3NW1SNTlYcnVkMXJqamNNWjN1djBRQmVW?=
 =?utf-8?B?VUdWQ09mUG9LRzVPdzE5ZzQwTU1YcHNDQlBCaHNJWGh4eHhNUVFVazJ2akQ4?=
 =?utf-8?B?VjNhTmJiRVNGMXVENWcweERxekNhTTg0K09jczRWWXQzRFB2bnpBVm0zOXhz?=
 =?utf-8?B?ZzdEQmFuQzE1MXI2NVdrTXFneGQ2d2laUjNBaVVNeGJmMmY1Y09BbEYxc256?=
 =?utf-8?B?Njg1ajY1NUlJWkJiMXdyUVlLZ1ZlYU5tcDVlOVhaNjNicUhJUGpISk14VDBM?=
 =?utf-8?B?b2tpL0FqdzZHamlWQkMzQThhTENSdWtvcVNkSU8xNnJ1QmV1cnQwbUxSZmVo?=
 =?utf-8?B?d1YzSkkreUJ2RjJTTlVLdDhVMG5lYnVtN1Fid0JDMjc1Rys4R1NGU1dkSmox?=
 =?utf-8?B?OURmV0l5R1MrUkJWaFM4MS9vbngyS0xWUFFucng5RDRMN2JNcm1GWi9heFYw?=
 =?utf-8?B?MlUvUkdTOU9ud1BqYXdVNUVBYmRSbjBkM3NlSGdSTTBDa3hvM2c5TnJSU1Jx?=
 =?utf-8?B?L0I5NU43V09aRmFMNm8yb2FzenVKMldSbjdNVWVNVXdUaUlrWmRDRE5FMHpr?=
 =?utf-8?B?dHgxaXd3NW1TN1RwQ2JMc0lLRVpFeFRMQlVXZTErVWFoaU1Hc1pXZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1ff30d-edb3-463e-8ec9-08de5e586656
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 10:31:30.2208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: el6+7VjP/y9g526FjkxpQ6KPDueT+d8uYh0+O3vvdINyArYuopdrVSlYMpT+wG4DJwCgmLKJdf2oPccljSnDgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6971
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,llvm.org:url,citrix.com:dkim,lwn.net:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3F6159F7E7
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 11:16:39AM +0100, Alejandro Vallejo wrote:
> On Wed Jan 28, 2026 at 10:41 AM CET, Roger Pau Monné wrote:
> > On Wed, Jan 28, 2026 at 10:18:03AM +0100, Alejandro Vallejo wrote:
> >> Hi,
> >> 
> >> On Wed Jan 28, 2026 at 9:10 AM CET, Roger Pau Monné wrote:
> >> > On Tue, Jan 27, 2026 at 07:24:01PM +0100, Alejandro Vallejo wrote:
> >> >> This patch modifies CODING_STYLE to severely discourage use of copyright
> >> >> notices when their presence is not legally mandatory.
> >> >> 
> >> >> Copyright notices are redundant on commit, misleading from the time the file
> >> >> receives contributions from anyone not represented by such notice, and actively
> >> >> harmful for attribution by the time the original code is long gone. They are
> >> >> plain wrong when added on code motion.... the list goes on.
> >> >> 
> >> >> All attribution worth keeping is version-controlled through Signed-off-by,
> >> >> Co-authored and the like, DCO and the cumulative contents of git history.
> >> >> License banners have already been superseded by the contents of licenses/ and
> >> >> SPDX tags.
> >> >> 
> >> >> Other FOSS projects have already moved away from explicit copyright notices
> >> >> where possible, and severely discourage their use when not.
> >> >> 
> >> >> Apache and LLVM take active issue with copyrighted contributions and Chromium
> >> >> takes issues with copyrighted contributions not attributed to the project. Some
> >> >> Linux subsystem maintainers already frown upon copyright notices too, even if
> >> >> it hasn't reached the point of being a mandated requirement yet.
> >> >> 
> >> >> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> >> >> ---
> >> >> The actual changes are almost verbatim from the LLVM guideline, but it's not
> >> >> exact. Wording can be adjusted as needed. I care about the core of the proposal.
> >> >> Saying "please, drop the notice" on contributions where it's clearly not a
> >> >> legal requirement, or have the contributor state that it is a legal requirement
> >> >> and why. For fairness sake for all contributors to the project.
> >> >> 
> >> >> I'd prefer taking the Apache approach for new contributions, but I want
> >> >> some discussions to happen first.
> >> >> 
> >> >> Thoughts?
> >> >> 
> >> >> Relevant examples:
> >> >> 
> >> >>   - LLVM: They banned copyright notices, unless part of a vendored
> >> >>     components.
> >> >>     - Links:
> >> >>       - https://llvm.org/docs/DeveloperPolicy.html#embedded-copyright-or-contributed-by-statements
> >> >>     - Relevant quote:
> >> >>         The LLVM project does not accept contributions that include
> >> >>         in-source copyright notices except where such notices are
> >> >>         part of a larger external project being added as a vendored
> >> >>         dependency.
> >> >> 
> >> >>   - Apache: They banned optional copyright notices and relegated
> >> >>             mandatory notices to a NOTICES file that also contains an
> >> >>             Apache copyright notice. See links.
> >> >>     - Links:
> >> >>        - https://www.apache.org/legal/src-headers.html
> >> >>        - https://infra.apache.org/licensing-howto.html#mod-notice
> >> >>     - Relevant quote:
> >> >>         If the source file is submitted with a copyright notice included
> >> >>         in it, the copyright owner (or owner's agent) must either:
> >> >>           * remove such notices, or
> >> >>           * move them to the NOTICE file associated with each applicable
> >> >>             project release, or
> >> >>           * provide written permission for the ASF to make such removal
> >> >>             or relocation of the notices.
> >> >> 
> >> >>   - btrfs: They are highly discouraged.
> >> >>     - Links:
> >> >>       - https://lore.kernel.org/20220909101521.GS32411@twin.jikos.cz/
> >> >>       - https://lwn.net/ml/linux-fsdevel/20221026074145.2be5ca09@gandalf.local.home/
> >> >>       - https://archive.kernel.org/oldwiki/btrfs.wiki.kernel.org/index.php/Developer's_FAQ.html#Copyright_notices_in_files.2C_SPDX
> >> >>       - https://lwn.net/Articles/912355/
> >> >>     - Relevant quote:
> >> >>       Let's say it's OK for substantial amount of code. What if somebody
> >> >>       moves existing code that he did not write to a new file and adds
> >> >>       a copyright notice? We got stuck there, both sides have different
> >> >>       answer. I see it at minimum as unfair to the original code authors
> >> >>       if not completely wrong because it could appear as "stealing"
> >> >>       ownership.
> >> >> 
> >> >> There's more cases of other projects taking similar stances.
> >> >> ---
> >> >>  CODING_STYLE | 18 ++++++++++++++++++
> >> >>  1 file changed, 18 insertions(+)
> >> >> 
> >> >> diff --git a/CODING_STYLE b/CODING_STYLE
> >> >> index aae5a47ac2..97f80245ed 100644
> >> >> --- a/CODING_STYLE
> >> >> +++ b/CODING_STYLE
> >> >> @@ -24,6 +24,24 @@ license, e.g.:
> >> >>  
> >> >>  See LICENSES/ for a list of licenses and SPDX tags currently used.
> >> >>  
> >> >> +Copyright notices
> >> >> +-----------------
> >> >> +
> >> >> +Copyright for the code in the Xen Project is held by the respective
> >> >> +contributors. Because you (or your company) retain ownership of the code you
> >> >> +contribute, you know it may only be used under the terms of the open source
> >> >> +license you contributed it under: the license for your contributions cannot be
> >> >> +changed in the future without your approval.
> >> >
> >> > The usage of such direct language here, by using you to refer to the
> >> > reader / contributor, set a different tone from the rest of the
> >> > document.  Maybe something like:
> >> >
> >> > "Copyright for the code in the Xen Project is held by the respective
> >> > contributors.  The author of the code is the owner of it as stated in
> >> > the DCO.  The project cannot retroactively change the copyright of
> >> > contributions, unless explicitly accepted by all authors of the
> >> > code."
> >> 
> >> Ack for the tone. The particulars of the wording might need tweaking even in
> >> this version to constraint the scope of "contribution", "the code", and so on.
> >
> > Yeah, it probably needs even more integration to make sure the terms
> > used match the rest of the document.  I didn't take much care into
> > that, as I was writing this in the email reply and didn't have much
> > context.
> >
> >> -----------------
> >> 
> >> I have the same question for you I asked Jan elsewhere.
> >> 
> >> There's 1 question in 2 forms I'd like to have an answer to from a core
> >> maintainers.
> >> 
> >> Would you be willing to ack a change along these lines?
> >>   1. to a Copyright Notice policy within CODING_STYLE.
> >
> > I'm fine with that.
> >
> >>   2. to the relegation of existing notices to a NOTICES file in the style of
> >>      Apache. Apache in particular mandates the file not be touched unless
> >>      absolutely required for legal reasons.
> >
> > Hm, that might be more complicated.  I am however not a lawyer, don't
> > expect the rants below to have any kind of legal base.
> 
> Neither am I, for the public record.
> 
> >
> > What about the public headers in xen/include/public?  I don't think we
> > can just remove the copyright notices from those files and place them
> > in a top level NOTICES file.  Then OSes would copy the headers
> > without the NOTICES file and end up effectively dropping the original
> > copyright notices.
> >
> > Also, what about people importing files from Xen into different
> > projects (apart from the public headers)?  If we remove the copyright
> > notices the imported files won't have them either, and people is not
> > simply going to pickup the top level Xen NOTICES and import it into
> > their project?
> >
> > How does Apache deal with people importing their code into separate
> > projects, do they mandate the NOTICES file to also be included as part
> > of any code import?
> 
> They do. It's part of the Apache license. See point 4.d:
> 
> 	https://www.apache.org/licenses/LICENSE-2.0
> 
> This would require some sort of ammendment to xen/COPYING.
> 
> OTOH, to avoid being a PITA to Linux and others by changing how we do things
> it'd be sensible to keep the existing headers on everything under xen/include/
> public/ for being-a-good-citizen reasons.
> 
> Anyone actively copying an internal file (say, msi.c) would thus be forced to
> also copy NOTICES, but that's a heck of a lot rarer and not much to ask.

Possibly a very dummy question, but won't our NOTICES file be fairly
big and complex?  If we have to move every single variation of the
different copyright headers we currently have in the tree.  We have
GPL-2 only, >= GPL-2, MIT, LGPL, BSD... Each with a possibly different
set of copyright owners.

Also, would we need to somehow reference which notices go with which
files in the tree?  Otherwise we would effectively loose tracking of
the specific copyright owners of each file I fear.  Figuring those out
would need to be done by going back to the last commit before the
copyright notices were removed.

Thanks, Roger.

