Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKMUNfSDg2llowMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 18:37:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46581EB092
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 18:37:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221086.1529452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vngoo-0000uF-N4; Wed, 04 Feb 2026 17:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221086.1529452; Wed, 04 Feb 2026 17:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vngoo-0000rq-Iw; Wed, 04 Feb 2026 17:37:34 +0000
Received: by outflank-mailman (input) for mailman id 1221086;
 Wed, 04 Feb 2026 17:37:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f40U=AI=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vngon-0000rk-FP
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 17:37:33 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ec1615a-01f0-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 18:37:32 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA0PR03MB5419.namprd03.prod.outlook.com (2603:10b6:806:be::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 17:37:29 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 17:37:29 +0000
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
X-Inumbo-ID: 2ec1615a-01f0-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vFQEXobhGByPB+R2YTemotv9WtIDI578Z2MmBrImPTLWMMHx1iji7K/Gajc16V9OsKIu9Ct/ecfLeb3jTx9wZd4qhYifrNcDo4tgzD4HJ0nHo3AsXwBeR0Aqr22cspCoJUOcss0eo/oSLgxQaOIUJRBQlqyHtxNsRvD2sAi5kCjiphR3nfRTq16/SRoxIWVHJuN2gi5RQBgthOQ/UCzpq3WIyADWItuTg3g3qzMqSGEZrB9S69O8OIvYmgI8KSUjlhTQq5RIIhIHinhGvAy2tZ86KSvTkJrYNeX3ovrzFIEl8wNh7Ny8/bhe3bee+d65L7wvSrTWU+5A0sbKHVICuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6U/ryosRTKEgNX4VEJagqM9mQIADPuN7NRZapeOpZNg=;
 b=rwMxbEM+kx2hxVtCn2iSgWEOAjspGm4X0cUP95LkfkFQfecY9cSBsZqzqYvQKncpixZLyyZNBMYFB0zs/FpVPa66WteKtDti0NcFUKk2RkLToq423AhZx/e/egyziAaTeerLHc0JL6cBjI+DedgCnc8qpI/6rphY6J6AMiU/LV7BiYu+WmT290/AIt37HujY7GoRTOW5/A5nwuF3TziGt9VoNecjskgI61jOLpp8nBikENkBtv5v3diDougrym5h/tEkuLH0q7N6OalBzE0CcVecMjUYwFAVhT/zdSZs2SWi+WZkIXcgPXxHDsFfAfB7H0/1Sd/z+ksDqFadR3r1aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6U/ryosRTKEgNX4VEJagqM9mQIADPuN7NRZapeOpZNg=;
 b=nKwrpHQZphcL3YBXMNjg1pxfHkx+/CF2g2fmU+Am5JRIDVnWQhKA+UmA2Ddb6f/LGsZCxu2HqcjAjo/oBCZsvQtN9nC+alOJSWN0e9y3VlwZpTTZVdQx4u7xWQR/39TYZMUrY37+YyBJ61Lnp4rGOKHs7F8VTVBgoMWq+teF9GY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Feb 2026 18:37:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] xen: Add macOS hypervisor build support
Message-ID: <aYOD1ez4NeNXdrvu@Mac.lan>
References: <d923a50ff7870087347ef783516f3c2d2764dc6e.1770210872.git.bertrand.marquis@arm.com>
 <a3637eb3-ff0d-4a69-aa7e-e86be92b062b@suse.com>
 <5062E1F2-D023-4BF9-A829-BB996686B04C@arm.com>
 <aYNyrKA7bOiZQSZU@Mac.lan>
 <BDB5B69D-3E56-4F24-88C5-A96A3F860596@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BDB5B69D-3E56-4F24-88C5-A96A3F860596@arm.com>
X-ClientProxiedBy: MR1P264CA0168.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA0PR03MB5419:EE_
X-MS-Office365-Filtering-Correlation-Id: 3175bbdf-aedf-47fc-dc61-08de6414116b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2dTZzRHaTVYazJrQnVXOEtaUkM1bUUvb3MweVBwU094VmhNbGJ1QW1XVjdF?=
 =?utf-8?B?d1ZJYkpRREdLQXFVcUlqUyttTWFnUlphM21NME5GcVlHVUFmbnFXWlNuTEky?=
 =?utf-8?B?aysrNE9SUE95Wm1qWDhNeU5uZ3BuYk56T3ovVVdRTW5BOG1qdC9GaTg3VGRz?=
 =?utf-8?B?cG0wb2dGdktvSytqUWdVOVU3RU1OQjJYNjJ6bjJrZ2tWODd3Qy9kMFJlZWFh?=
 =?utf-8?B?aGJHUUY3bnozdHdTVFFCbWhPSThkSjhkZ2JMSkpzYWlUQytTKy9MNEdTdmhh?=
 =?utf-8?B?L1BjRml0VjRieFM0cDlCRm1PKzZrUGFocWpyVXp4MnZvb1VPSXZ1Q3NUeENH?=
 =?utf-8?B?ZUlHTGtMNDJvZ3IvRFhRMDNmQlNLOE5vTVEzNHBJSytQeTJVUHA5RmM3V2Ey?=
 =?utf-8?B?NFY2aWk1akFuNnB0dmpBTDFVdEdMdmZDTDhIdE01RUVZN0ZvTlM1NDNweUha?=
 =?utf-8?B?NC9KTTZjbXUyYjNhYm9xWmhKRkhuN29KUUpXM0ExUVVvM1JIYmRqVHN3bklr?=
 =?utf-8?B?R0txT1lNWDhINHJmZHhrcXV6ekNlMHhIcGpIbHdRdzVTY1VlQ3AvMlBYRklw?=
 =?utf-8?B?dHBZQ1gwTEgvMVhsaFNrazBlMDZtRWhmQWQxRGRBRDFscUFYTElmRWJQZWVo?=
 =?utf-8?B?MHZMb0JQL0VnU0U4Vy9Lb1M1Z04wUFlJRThNMWFwZzQwL2FIUHcvNER6Ykls?=
 =?utf-8?B?eWtBSDVCTFU5VHpyLzhQcjZjM2p6REsybHFHTGFxMFcyL3hZRGpSZER5MHhK?=
 =?utf-8?B?NDdZcDlvaHN4ajdLVG9BMVp3VGJkdTFaVWlKSi91dThobFBkOWFVK2tkZU4x?=
 =?utf-8?B?dFBSRHJoZkNCMS9FSFB1cXhYaVhQNHZaOFBuSU0ra3pHbk5ySHNOalNhZG1E?=
 =?utf-8?B?aGZSZVc2ajJKNG1DWGI3ZXdidnNFRnlFTU5OdnAvSlNQSWViMkJ3Y0FJZ2U2?=
 =?utf-8?B?M3VFVU8yWU5LeElUOGs3YU5VZGU4VVRBM2dpaXdQYi81VU9GVlVrTlhMTU5v?=
 =?utf-8?B?WWlOME5XUjV6aVR3Z3V2UFUzOWN5VUNMMHZwOGZOdC9weVZQbE9iNloxMTF0?=
 =?utf-8?B?aUZCNWdrQmJIV3YvRnFXZURxajdoNHcxK2hMVmVYV1JkT0ZSOTVmMnhmMWxT?=
 =?utf-8?B?NFBTNURkbXJYKzJmOVI4QjdlbUpjRXE5WTRzZnVBOEhjV0g4RmcvWDR3dE5h?=
 =?utf-8?B?d3lkN01SVkd1RDBEekxFN1F4SUhZTzV6TEFZR2ZEbzRnRlQvbENXS1V5THdR?=
 =?utf-8?B?SmxRRTdROCtVTHVxZEZHYmtMVkxiT3BQM1F6REllc2hMeDNxN2VWeGFpWGpT?=
 =?utf-8?B?US96dHVtUzFMSmxGeU55UTdNOTltQ2NZQlNlSXN5c1NrcERXUGx0L1ZRa3Zi?=
 =?utf-8?B?dUR2TUo5OXQ2U3RCZ1VKV2MvTHE3MmdyRFVObFNyNTBjOTV4Rkl5STJzYVFo?=
 =?utf-8?B?a0R0cTByKytlZzdTY2RTTGFPVVFrWCtpUThDdzhlcTczWTBrbVBYQitpMy8x?=
 =?utf-8?B?alROT2gvV1lseERYcVc1SlZhbW9jVHR6bzVqakUvaForWjJUb01BQ0FLazhT?=
 =?utf-8?B?Z2NoUytWQnBpenljMkhiUzNQUEpHQmNDK1pnN2NRY05WNjV4Sm5HU29ubXZv?=
 =?utf-8?B?Rnl5UnpjUW44bDJUT1ZiWjU4NlhrNUZWdWNvMXU0VWV2MThnbitROXpYUTNo?=
 =?utf-8?B?Z01Sa0FqM0M5bm5TOFhsQ0tIUXRjQnMyZHVHSUtOQTRkOW5jWjBGT1ZLQVVq?=
 =?utf-8?B?cHF1cHZsRzRWVnVSTWlOUDRKR0NOMG9qSXFPTHFhODhFWVlYTGhVOG9uR1Bw?=
 =?utf-8?B?Q2czUitpUmt5TkZ2UUZ3aDZjQ2FOd2dPdnZSN0RGcG1neHNOUXBGRHphQklS?=
 =?utf-8?B?czVqWkJRYmRyVWhaNTBTMm1KL0I0OWZrS3JwQXhsQkNnRUJCaWYvSVJ0eW1S?=
 =?utf-8?B?aXVvUHhsSHdtVW0yTGIzQXJDSFBsS1F3WnE5YmYyeVQyRVlBMHc5R0VleW9j?=
 =?utf-8?B?SHZ3YXdRc1Q4THAxRDZGc1p3aTVTZHZmZEJIUlIzU2dlcGJMUzc0aDljUzUr?=
 =?utf-8?B?b1B6STlJSjZjOUVpd1ZudTQ5bTk2TE1JYzl2WFA3aExScnh3MENlak1ENHpX?=
 =?utf-8?Q?BTNU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjNDMHd0T3J6ZTRpV2FXSG0wSUpFMnRGVUpOem5nM2xGRCtGcDN0VUE3b1Ny?=
 =?utf-8?B?N3pOeE4vblcxY2Z4S0Jkc0FRWmdRd3B6VUNscVozNU15cWI4S2FWR2JFcTV4?=
 =?utf-8?B?NXMzQnNFckhvanVIdzMzMmVvZHMrVlF0Q2FES0V5ZjFMQlpKclFCbjhJM0dx?=
 =?utf-8?B?R0Z3N25tVmo0bnR6TnVKNmNmVEo4V3NVdENUT25CSU1CQ05kQnVtd2ZoNFF0?=
 =?utf-8?B?YXRBM2JxUElEU1ZKcDIwVXMxa1lhSmQrUHZDTDg0NHNKTkIxR2E4YWhaYStG?=
 =?utf-8?B?eWM4RnB3WnpwS0hFcHFVd0dVTU5rcTZDU2RhaEl6bHgrL1oyN2hkbnFtSUpS?=
 =?utf-8?B?VllxZklIZVVZRzFpaldrbU1zZXVJSWVrSXRYVnhEd05TTStqM1Q0cUN4T0tT?=
 =?utf-8?B?RzBFSkxUUWEwdXVUaSszTGw4WTlSSXhDNlZkcTJUUE1DZUdFRDd6dVdkeitz?=
 =?utf-8?B?eHpPdnpzNDhjaUNYcDltWmRMcDBaMlhlYURtaytTaVYyblpPNTBWeWtjb0NG?=
 =?utf-8?B?Z1FZeVFaNWdtbXNaTCtmMk1pem1SK3I0Uld1cXNZNUtucXQzTGpKeXI0c256?=
 =?utf-8?B?UmlSQU9JSE9rVTRVcTN0TktKMlJka2dKNCtwWDFUZ0JpNXVrL2wvK2tvTVBN?=
 =?utf-8?B?cHhFVjhKc09TRUNlTURoUURPd2oweWVPWGN1bzJUVnhmeS9SOWRIV2srTTAx?=
 =?utf-8?B?MEcxdVRoWVpEL05LSysrV2U0dTh5enlINFJIeS9MWERIVU93Zlk3ZTB0QVNS?=
 =?utf-8?B?ZUFVTis4Sm02aS9vTmlOa1FwT0JQb2NuR2xkVFZNR3lINjRyTDI2QjRUeWJ6?=
 =?utf-8?B?d0pleG5PdEM3WWJVQjNIc2Rydi93emJGc0J6UHdoc0JaaWhGSll4R2wxd1c4?=
 =?utf-8?B?UGxqVzgxY0FLcnZFdDZKRHgwUEpFdWJaOEhVdzQyeU1VWUFRS25nVkI1VzM5?=
 =?utf-8?B?d3JGYkE3L041NG1pRnJRdzc5YW1iSThUWlV2RWhEbHNyT3daVlVLQlN5OFVI?=
 =?utf-8?B?S2hWNjh0MHpQdElVTENRN3pwTnovN1pQK1lUaG1LcWZwQW93ZkkvYjRvWVk4?=
 =?utf-8?B?Q1NXNHBHSDluRnp4bDl0NU9mZE1xTitITVNVd1QwMnBoZW4zb3dGNC9udHFU?=
 =?utf-8?B?ZlVFNlpuTEVNeCtLcTE3bDB6aFJxWWFqODdPQnV6d0d4Q0NSdEd2KzdObWVx?=
 =?utf-8?B?UXNHdHhueTVua2xuemxDemJZNFJBOHVQRUY4UmxRMXIwaFBONmlZbzVrOXR4?=
 =?utf-8?B?bTNIYzNyOTZMOTIwSWF1WTVXZzJTWnh1dmNHMnhobkgzaHBBWXdJc2J0SkFD?=
 =?utf-8?B?OTFRcjJkL1FYQVYwZ2hSSXBOeHFsTTFPZ1VtMEdGd1JsMzBKQzRuQlphSmhj?=
 =?utf-8?B?enI2ZkRreXU1WTJ0UlJOOEpkQUluSDlibDZYMjVEZGxrK0NWeEV4WVF5cGkv?=
 =?utf-8?B?RFAranFGeVo0dUJCcnI1MEtxN1lxb0NNVER1NkpkUmlNZHJOdUxjVEVta0lh?=
 =?utf-8?B?a2x6SE5qUll5bG82eXg4R2YyVHNtVVdvakk1V3FLcVZNSmRQUjRLKzZGOHR5?=
 =?utf-8?B?cWsyWTJ1NThUMm4zS3h0by9XcjdxMU1sWHVnWEh4bUoyWDJtaGhpYzZRUS9D?=
 =?utf-8?B?SjB1cHRIWFlTSHdXdWszZUIrWUlZb3YrMm1zc010eFlTRGJuQ1Y4dVJEYWFC?=
 =?utf-8?B?dlV4bUs2Wnkwa1lhbGg0VlM2UDRQNzZPTC9Rb1RRTVkvVmJGTHFaZ3J1UHB1?=
 =?utf-8?B?R0llOXRRR0JHU3FGMjFIWmZrYWpNTGZFYXAyTDh6YlJIZlo1Y3IzVTZXL1hu?=
 =?utf-8?B?YjcrZ1RsY1Y3d2hYb0FvM1FzdVRCYU9oMDFqTUw2NmMrMzBtZ2ZSUmJpT1Jp?=
 =?utf-8?B?TVJRV3BWVHFnZStGL3dZemdUcXJXaisrYjQ5a2kwdVF3Qkl3eU11NGZjYTZT?=
 =?utf-8?B?TnFuRDRSTWVYQk1YcnAyVzgraWlESHdoc2M1UkVaa0tVZ1BjMnRWLytSczlx?=
 =?utf-8?B?RzJzaEJzSGNWVUFnYlZUNjdJNkdqZHJISUF5d2Z1RkRmeVJJeTVQT3BFYTVx?=
 =?utf-8?B?T29wODlTblZocTZrMmdidCt3SVZWdU5xOGxBZWZraHBuR2R5VUlpSWd4NjhQ?=
 =?utf-8?B?ZDYrWC9mVFQvQ3RVWHJ4Yjc1WlRhc3VtVFA5RmtoREJyRm5zOHJvM1piY3Z4?=
 =?utf-8?B?cEMzUWI4c3VjUkFuZVc3TkNrTjE4ZEJ6aXlJWHJXeHdFUGFYTWZmbHVWVXg5?=
 =?utf-8?B?OVcyODF3YkgvV3p4b3ExQ1Y2bDBWL3J1MTZ4Y1ZSV2hrSnR6SVpXN3ltZzUz?=
 =?utf-8?B?T2V6QXlRbjhiSG1yaC9lUFhTY0FOenlrVi9KalQ2WnR4U1h1aVBNQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3175bbdf-aedf-47fc-dc61-08de6414116b
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 17:37:28.9621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4pAKOLWehmu956R9yFeGmQcs+8xZgZs2KMS5e81BdNnB5Vi8arfzoveg7UlKByb6wwcI+0NaTlHNOrF9mQK2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5419
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,Mac.lan:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 46581EB092
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 04:51:35PM +0000, Bertrand Marquis wrote:
> Hi Roger,
> 
> > On 4 Feb 2026, at 17:24, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Wed, Feb 04, 2026 at 03:45:33PM +0000, Bertrand Marquis wrote:
> >> Hi Jan,
> >> 
> >>> On 4 Feb 2026, at 16:31, Jan Beulich <jbeulich@suse.com> wrote:
> >>> 
> >>> On 04.02.2026 14:16, Bertrand Marquis wrote:
> >>>> --- /dev/null
> >>>> +++ b/config/Darwin.mk
> >>>> @@ -0,0 +1,4 @@
> >>>> +include $(XEN_ROOT)/config/StdGNU.mk
> >>> 
> >>> Darwin isn't really a GNU environment, is it? The definitions in that file
> >>> may be suitable, but perhaps a brief comment is warranted?
> >> 
> >> Yes this is only valid because we use brew in that case.
> >> I will add a comment.
> > 
> > Oh, so you end up building using the GNU toolchain provided by
> > homebrew and not the LLVM one?  Sorry, I was assuming that you did use
> > the native LLVM toolchain when possible.
> 
> I am using the GNU toolchain using brew.
> 
> That would also work using LLVM i guess but the dependency on other GNU
> tools like make and sed would still be there so you would need brew (or something
> else providing gnu make and sed for our build to work).

GNU make is provided by OSX Command Line tools, you shouldn't need to
install it from homebrew.  Same with sed, the one provided by OS X
which is FreeBSD sed should work with the Xen build system (at least
on x86 we attempt to not use GNU extensions to sed).

However, I don't know whether the LLVM toolchain in OS X will be
capable of producing ELF binaries - most likely not, it's likely
limited to the OS X Mach-O format.

> In any case you would require to include StdGNU.mk anyway.
> 
> I am not sure if renaming it is a good idea as you need something GNU friendly
> even if it is not a GNU thing so ....

Hm, yes, it's a POSIX environment plus a GNU compatible toolchain.

Thanks, Roger.

