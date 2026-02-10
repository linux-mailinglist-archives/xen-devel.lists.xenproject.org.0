Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMEnOnAfi2lBQQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 13:07:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEA911A8B5
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 13:07:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226347.1532888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpmVy-0002MV-GD; Tue, 10 Feb 2026 12:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226347.1532888; Tue, 10 Feb 2026 12:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpmVy-0002L4-DH; Tue, 10 Feb 2026 12:06:46 +0000
Received: by outflank-mailman (input) for mailman id 1226347;
 Tue, 10 Feb 2026 12:06:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjf6=AO=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vpmVw-0002Ky-RT
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 12:06:44 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6879f5b-0678-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 13:06:43 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV3PR03MB7610.namprd03.prod.outlook.com (2603:10b6:408:284::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 12:06:40 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 12:06:40 +0000
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
X-Inumbo-ID: f6879f5b-0678-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCxAQMUitVa3XgOiDK3DmsRUmrqmUtabtjzpgwIzIdGVczPqZGVqUCs3wm4YYiSciaVVN1fYR0QM8dz3IZDuitHqDEqCw8M6chRnILsGCePKBl204wiJQokmDw+eGc1kw5thyZwCz17VVygekqTwWs5L2R8MTTFwG5LlfiGwHxXnh2fyx8W2rVF8r46+0HL45iEhDOv+qQbZf9dSaq8aPrntvsNsqms3NRq3ujnaflhlVF3PXLBVN3ygvfB7wwYGJzYlDCTFCcQOVVPlDrSLYNsvPznQQvs1KowYN0yRQ+2DcCZJgg7FNwvW6qCSn+98a/YGPQa6+0R/LOWn5x7DWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=audc2GUtnsvMNydrjwYSDXe78K+2d8mcLp7KKS2jBEI=;
 b=KsJkkKP+o3Ayc/PxVU+19IQFp11o71ki5/F3PlNBxo3VHfRPd2i3sz+jsCFTk2EAquxEG3JuxfUfUr7TeKNSJ2usqD11/t6VhdMCuG+STW6juhz9mEqdXWJVPDV/MIzA9TJUFxHsZiH3sXv4sWzzHdpTYm94CX1+fwTAbekGCvB5SXoKBljPT8qQR06myEXn8x1+mFrT/eOCVRYZvq452GwwoQEXBEt4GIhYsgKQCVhIgREILs/ab6Ejk3vot21DmEiuB9kRJHBd+92imxgZcYrZObhWSzmvjEt8Nah0JuhttVSX7MgSGeio3Rk+ywlbqg49dHarCpKuX8ocEH92Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=audc2GUtnsvMNydrjwYSDXe78K+2d8mcLp7KKS2jBEI=;
 b=Zz7pp0Z61QMQyotcRmoajI3MhaTb3GLnJnwFwuw6k02hB7VAUSMj98vQ+uyszLd1HhLNRyZX81RuNk9Kn8scArrLjE9bEqDB65RUxfCROVgTGiX86hGoiKOcnNk3on5O5ALR3eo1tOGORXla7yVQ17DPqvyvgMwv0YOKRevC6Bk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 10 Feb 2026 13:06:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 03/12] x86: Add cpu_vendor() as a wrapper for the host's
 CPU vendor
Message-ID: <aYsfTHM_kV8t5Vqp@Mac.lan>
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-4-alejandro.garciavallejo@amd.com>
 <aYrwUj1uaEgGL9hl@Mac.lan>
 <DGB7R5PAW92W.390IRWRSC3QE9@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGB7R5PAW92W.390IRWRSC3QE9@amd.com>
X-ClientProxiedBy: MR2P264CA0151.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::14) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV3PR03MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: d5ad4003-fd60-4afc-f856-08de689cd946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aE1EN2RRM29MVFNMT20wdUlnK1dLQTV3bFhGVEFFek1WUFRBckU2NVZRdUlx?=
 =?utf-8?B?Rk01cmxVSXNlaFZVdjlyOFo0WkNtdEpFWEFlVTdKYTFmdlJDVGtReVI3SXl5?=
 =?utf-8?B?VkFRbW9nM3BIK0RBSUEvYW5FT3liQ0x5NnVtVGJkQkszMGRFeGNYKzcxUmI0?=
 =?utf-8?B?YVZPUVJ5Y21WTXY3RzRTcVFoRlFrQ2ZHOU10N2w5OGR5QnorRWMwQzZRT1pZ?=
 =?utf-8?B?RDdsRFJ3Z0JtWTR2WGJ4NmJQSWxFTXZmQ3hIWnFOREU2RW45UUVPUFVBRWVv?=
 =?utf-8?B?R3RuZDREYmlUY1ZtNUxMMXZIajRXTGkvZFYzMkJidWRBYTVFN1B1RFV1YnZV?=
 =?utf-8?B?Q1hQVFV2Wks1L3NJa2szc1cvaVAwenBJNHNDeTlZUVVsZmtDV3FsMVVJb2RD?=
 =?utf-8?B?VDBqdHBNcVhDc2JSNEdBdDJGNkRMSDIvNDMyZzMybnZMMUxHL0gxU0dWeVd0?=
 =?utf-8?B?ZXRPTW1Bd2lWOHEyRERxZVBXNy8wQXg5eXpjWFM5TVVqKy91N3dqWkFHRzEr?=
 =?utf-8?B?OUJTV2cwZUpiWmJxZExZMU5XMHBHZlZ2WW5YMnRpVHVrZ2ErTjA5bXZ2c1Bn?=
 =?utf-8?B?K0FNdkpGamFuNThNWmhQSmwrWG53WUhySDNiR0RKbzNYMit1MGp2dVVCcmV5?=
 =?utf-8?B?N0FNZGxIdWN6YmxuV1dMZVBFenZ6L3pnSEZJRWZITmRqYW5wRFY0UGZoOC9z?=
 =?utf-8?B?ZHZSRVM3YUNMZHZpVDdLRy9wTVhvdTZwT3hzck5rTWFIam5uQUtyenEwTUcx?=
 =?utf-8?B?VWxwa3V0Wm5YUUVTRG5DMUNxR1h4SXEzcEhEb2wrRnBJOTJhcnhvV1g4WUlF?=
 =?utf-8?B?bnZwR0tBT3QzRVJsR1JtRWVDSUpGVFZxWTY0ZEtvVVJ0d04wMFpLUy95RlNX?=
 =?utf-8?B?M0NkNW05Y0NGYm9hcFBEbHFzQll5ZVBSdFQ2L3IySDBTNXAyaG9SdlJZRjRu?=
 =?utf-8?B?elhjUnNRZCtIOUNzRW1uYUZKUFJwWFhjWWxBekwxVkxZWUEyM0RFL1ZNS1Ev?=
 =?utf-8?B?S3ZzMXdXN3VNYy9nUHErVHN3andLTzlZOWd1ekdwNk8rbEE3V3ZaUG5vUXVu?=
 =?utf-8?B?SWFXQnRYdHJJNVRDeWhkWE5Vb09UNmtDMVhDN3ZlSXdjR0hhVmViZWV0VjlB?=
 =?utf-8?B?cEpycjhzR1lLSWZhd3F2MGk2VEF4OVJYdTFNWG80WldWT0JyMjU1ZTNJeHlE?=
 =?utf-8?B?bUFiRE1UNnk0Z01HT2VzR3FFeEU4YzFORjNSTExMT1RXTzhwSVBSN3d5Zllx?=
 =?utf-8?B?b0YxMUY3aGt4SXdsb3FvT3Y5cmxsZlgvNDNRcERaUTZDVlo1eFVna2tWZ2ZM?=
 =?utf-8?B?VS9ZcEcrMS9IYmh1cjh5UGt1eVZZSzRBVkNwLzFybjFyZ2VUcXVsd0dOS3Fo?=
 =?utf-8?B?T3VOS2ZweE9vZittbzZVTGxmcUdudGpmVlFuaDNjT1F4NjFKdWljV1J1TDUy?=
 =?utf-8?B?ejFJUmV6UTZVVUFJMnZ0QlM1VHBYR2hzOVh6YmYzQjMwNldERjdHdHE1TkJm?=
 =?utf-8?B?ZnQ4NExaTFhCZFkyMEtBTjA0dzk3L0VXMWFmLyt5T0RqZVZwZ285Ykd5cFpv?=
 =?utf-8?B?d1hjTGRlZExiemRJRGlYMU81Mkl5UTRqREpXMXFmcHQrSUR0UG5rTVJ0LzYy?=
 =?utf-8?B?YUszM3NIdStCMXhpNWpyNmp4Z1JaOFRrSlcxQnNUbjRyOXE0UnZuYVRCb1Zx?=
 =?utf-8?B?SnUzNEFnTHpTcjJTSlNkeG5uZ0xUQ3lVbzZzL0JVb0o5QTg0UFgwbUFjYWhO?=
 =?utf-8?B?SVQ5aFhONUdmOXd4RHB5NGE0R2lsUnZwbHgyWm5XYmRsTmZxd2FoS2FjT2VB?=
 =?utf-8?B?NWVpakkzR2xqcHlRWStWak9jdjRVVTN2NHJTQUxYdG1kNTQ4L1dPTzNpVkVG?=
 =?utf-8?B?RTRwc0xpRVNvdWI4bkxrVXAyYUVya0twM3UxSkJBODJMbVpxenJwMkIvN2VY?=
 =?utf-8?B?S3Zad0sxZlFxSnFudjJ6NEFxc2tucUxEWGNoUThhSUtrVFpnMjV0Qkw0NDRy?=
 =?utf-8?B?TEppaG40aERDaDZXTjRnNm1WQWxBZStyNjNEU2hwYm1QNy9CMHJ6TWVLRWtF?=
 =?utf-8?B?cHNocXVYMW9ZZ1REZU5IaTBCR1lWZ1FqT1F6d0RpZDNMbTl0S1o5dnhIOHhZ?=
 =?utf-8?Q?Z7/I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDR5R3R5T1VxaFgvR3I2OEM1U01KVHZRbWVIZHlFdHRrTWdSbFZUYTFBd051?=
 =?utf-8?B?SEp0NVNvOVJieUgxa3N5MzRFSzFFZlpjN1I5QkIzZzZ2N1psb0U1RllXZ1dI?=
 =?utf-8?B?QWtBZmNRelpmVGxldU1CZUQreE9TVU5wNlJtbi9vZ29hamhhUzhxeFZjanJL?=
 =?utf-8?B?WnZ3cmVLSTdmbldHT1RhRFZtRDErMzBxTUsyVjJTUEtZOXN6Szg3ak8zbGhL?=
 =?utf-8?B?QkVrN0dmRmlES2ZMUG9qZ2FMNy9SazNwcG1HWmF4Z04yeUtxcTRnRUxJSlll?=
 =?utf-8?B?d0lKUUF1OWZSNTNWNCtMSWVqM1NJUldaVitQcTQwZUFHSDJncDBrNE5hY2Fj?=
 =?utf-8?B?ZU9pYVc5bVR2bXIyd1BWV2R6cUVoaW5tRGEzTEZnTE5UZFpuTkp6b2xZWmNr?=
 =?utf-8?B?dzVtSjVzSmlhbThSeCtVY1FZTjNPS2JhT3F0bTMwRjdLMzBlT05xRE5ydW0z?=
 =?utf-8?B?SWdHVnhyZmo3Z0MxSFpqYms4bGdRNGFmRmxZR0NWNTRPaHZkSFh5OGVEdFFa?=
 =?utf-8?B?N3VVd2dUT2E3enlINVZyYlpEcUZQUUhBdW0wSWxMNUN0MDBrNStLWnlEM012?=
 =?utf-8?B?bEhReWlTRUlScVZjemU0cjdHcnloNlprbGtKS0xoak1HV3pDZGlzUmhDUHQy?=
 =?utf-8?B?Y0VEUWJsOENRZzlVWHZ1eG4vQitIWG9ocE1uT2JkVFllZnd5ZXhwNXFXT3RG?=
 =?utf-8?B?T3cvYUxRK0tEVGZkT3l1YWlLRy9rYWF0d2VpK2RCUCtHNHdVL1pYNklhME5P?=
 =?utf-8?B?bE4veWVWTHBXYXZzSzQ5UmJiYlJrdDZHajZFQy8yTXFFRjN2SFhibjFsa2JD?=
 =?utf-8?B?ZTYvQ0ZlQThjY1BReTd6am95K1hXa3VIQm42eVEwUGI0d3k5VDlDYSt5TzFB?=
 =?utf-8?B?c3U3NlVJazZKRWFBTkE0OGdXZnhTaVZQZnJscUhkWHoyeUdnc3JqMkFQWFM1?=
 =?utf-8?B?eWxabW5Pc0JEQ3dwSVVZVS92cTZYZTVoT1MzcVJiYVNtUUR2c3l0T3NBMUxl?=
 =?utf-8?B?SHBqWTFJRFZ5Z0dUVlNFbVI2cEkxK3JGam81WDQ1OHV1d0EycmFUNm1QeExZ?=
 =?utf-8?B?Z2hKMXJIZ3pBSm1nZm1jWnVOVkdBRjFtR1duTkd4OUxWZm1rcnlyaWVncXBs?=
 =?utf-8?B?Rm81d1BJZitGTjZBaTlxM1kvMFgxa0NncjJ2OXBFZVNHVnNTd3dIckhnaTF0?=
 =?utf-8?B?cEhjTG5ldmFLZUljNGQ0cWZnNDRXMmVzS1dPUlo3cEhVaVNSNUxkVFlNeXd0?=
 =?utf-8?B?cy81anFLN3JrWDNlWWRHa0NWK1JoZk5TMER1VHZMWDdGOEZwd1RSOTAwdnZl?=
 =?utf-8?B?ejFnclRqT0RLSWNQRzNUOGxZY1JJbjVndUk4OTZKbWVvNXplMldWK2grS2R4?=
 =?utf-8?B?V1gzMWdhS3JqK3lqM0l4ZUI4T1k2a1M4dzRYOU1mK0NXUXpKOXFIUjdFQXAw?=
 =?utf-8?B?K3FXMHpLTnpEWCtRZi9yRE94aW84ejhzNjlOMEtvbEpaQ2wrSEs4UnlJby9j?=
 =?utf-8?B?Mk9JVWdGTjQyVFhYNWhqRHJ4WEMxaUlyb1dkTGZ2SmxqK3VJR3ROSmhOSis3?=
 =?utf-8?B?Zm1ybHF1YUpxYjdFWUZ0eVRPdGdoWWRYS3lTT2JCK05XWjBCMU4yQWt4M25F?=
 =?utf-8?B?V0FhMk1xZjRNN2pKRmpaYXNJOUZDRTBpRlNyZmxKM1FMeWpNV2w0SjlEaEJ1?=
 =?utf-8?B?L1ZsaVVpMXhZcEZUaldEbCtnV0ZOOFZhYk5rL2N1UUxvYkpyQlB6Z2c2SmMr?=
 =?utf-8?B?U2c2LzA3ZExkQlMrczhaWlczdk5CWTdmOUk0RlVkMGorYktISERDMHlGYVg2?=
 =?utf-8?B?R2tpclpSdStnMEthcE52eTdyaUJ2cE9vekxJZWo1Q2RkTnkzbHl6K3FVZ0Va?=
 =?utf-8?B?QWRSTG81QTlCNVVDSkNsZk1PT2I3cmVuUkRBM011UXNkQisva0piUndQK2Vk?=
 =?utf-8?B?Q3NJdGVoOWJlSXRZUW5zRzNpUXJ5ekFRZUdOZzRENHQxVk5WNVp2SEpTTGtL?=
 =?utf-8?B?ZGVqYk9lKzRjN0VkL3NxeVVCQU9TYkRhMWZZK3AzNXlTbjUvbWo2ekdyclkv?=
 =?utf-8?B?cG9oclYvSWIrcjVFTTlFYktYemVzRmNXdmlDZ3dhWWpSTlVKcjdVdUhIL2Nw?=
 =?utf-8?B?TEdYOEt6STRiMDIybm5MZEZwQXdyMk1OZldnTmVidW1vNHBqTmVBWFhhUXk1?=
 =?utf-8?B?Y3NpbUV3SkxDUkdCNXd1MENGeThKNUt3MlNHL0Z2NzBBRHQ5WHBZakJUOSs4?=
 =?utf-8?B?cE9ZclFwMjJlVnFZbURuWEE4cmFaWklBa0pBSGkzdm8rYzVnKzhkZ3dmOW5H?=
 =?utf-8?B?emhlQ0pBQ1ZFYWlpMnN0VW9yNjR6ajY1UFRtajJaVG96VHlHVTVnUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ad4003-fd60-4afc-f856-08de689cd946
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 12:06:40.4961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7tXRzSTNh1mtwYi3djOjtmKqFk9h3zZValte+Pq5tdMki9zrj+oJzT9aKMZ3asf+1QMUBVNKSShJJsy18H96lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7610
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,Mac.lan:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EFEA911A8B5
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 11:35:20AM +0100, Alejandro Vallejo wrote:
> On Tue Feb 10, 2026 at 9:46 AM CET, Roger Pau Monné wrote:
> > On Fri, Feb 06, 2026 at 05:15:25PM +0100, Alejandro Vallejo wrote:
> >> Introduces various optimisations that rely on constant folding, Value
> >> Range Propagation (VRP), and Dead Code Elimination (DCE) to aggressively
> >> eliminate code surrounding the uses of the function.
> >> 
> >>   * For single-vendor+no-unknown-vendor builds returns a compile-time
> >>     constant.
> >
> > This is kind of misleading IMO. It will possibly allow such
> > optimization for Intel or AMD, but not for Hygon/Centaur/Shanghai, as
> > for those CPUs you will always end up selecting either Intel or AMD as
> > a requisite (so X86_ENABLED_VENDORS will never have only a single bit
> > set).
> >
> > Not saying it's bad, but I think the comment above should be adjusted
> > a bit to notice that such compile time optimizations for single vendor
> > builds will only be applicable to Intel or AMD builds.
> 
> You can't build a Hygon-only hypervisor with these changes. I can rewrite the
> commit message to clearly state which vendors are subject to the optimisation,
> though I'd fully expect users to notice they just can't deselect AMD when
> building for Hygon.

Yes, right, I guess someone would notice that right now it's not
possible to select just Hygon for example, and that it always pulls
AMD.

In theory it should be possible to decouple the set of supported CPUs
in X86_ENABLED_VENDORS from the set of support code that you build the
hypervisor with.  IOW: it should be possible to build an hypervisor
with CONFIG_AMD & CONFIG_HYGON that only has CONFIG_HYGON in
X86_ENABLED_VENDORS.  For the purpose of enabling secondary vendors
(like Hygon) to also take advantage of such build time
optimizations.

> >
> >>   * For all other cases it ANDs the result with the mask of compiled
> >>     vendors, with the effect of performing DCE in switch cases, removing
> >>     dead conditionals, etc.
> >> 
> >> It's difficult to reason about codegen in general in a project this big,
> >> but in this case the ANDed constant combines with the values typically
> >> checked against, folding into a comparison against zero. Thus, it's better
> >> for codegen to AND its result with the desired compared-against vendor,
> >> rather than using (in)equality operators. That way the comparison is
> >> always against zero.
> >> 
> >>   "cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON)"
> >> 
> >> turns into (cpu_vendor() & X86_VENDOR_AMD) in AMD-only builds (AND +
> >> cmp with zero). Whereas this...
> >> 
> >>   "cpu_vendor() == X86_VENDOR_AMD"
> >> 
> >> forces cpu_vendor() to be ANDed and then compared to a non-zero value.
> >> 
> >> Later patches take the opportunity and make this refactor as cpu_vendor()
> >> is introduced throughout the tree.
> >> 
> >> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> >> ---
> >>  xen/arch/x86/cpu/common.c             |  6 +++++-
> >>  xen/arch/x86/guest/xen/xen.c          |  4 ++++
> >>  xen/arch/x86/include/asm/cpufeature.h | 27 +++++++++++++++++++++++++++
> >>  3 files changed, 36 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
> >> index ebe2baf8b9..6f4e723172 100644
> >> --- a/xen/arch/x86/cpu/common.c
> >> +++ b/xen/arch/x86/cpu/common.c
> >> @@ -328,7 +328,11 @@ void __init early_cpu_init(bool verbose)
> >>  	*(u32 *)&c->x86_vendor_id[4] = edx;
> >>  
> >>  	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
> >> -	switch (c->x86_vendor) {
> >> +	if ( c->x86_vendor != cpu_vendor() )
> >> +		panic("CPU vendor not compiled-in: %s",
> >> +		      x86_cpuid_vendor_to_str(c->x86_vendor));
> >
> > I think you want to print both the current compiled in support plus
> > the host vendor as part of the panic message.
> 
> The mask of supported vendors, you mean? That could be helpful.

Yes, print both c->x86_vendor and cpu_vendor() as part of the error
message.

> >
> >> +
> >> +	switch (cpu_vendor()) {
> >>  	case X86_VENDOR_INTEL:    intel_unlock_cpuid_leaves(c);
> >>  				  actual_cpu = intel_cpu_dev;    break;
> >>  	case X86_VENDOR_AMD:      actual_cpu = amd_cpu_dev;      break;
> >> diff --git a/xen/arch/x86/guest/xen/xen.c b/xen/arch/x86/guest/xen/xen.c
> >> index 77a3a8742a..ec558bcbdb 100644
> >> --- a/xen/arch/x86/guest/xen/xen.c
> >> +++ b/xen/arch/x86/guest/xen/xen.c
> >> @@ -57,6 +57,10 @@ void asmlinkage __init early_hypercall_setup(void)
> >>          cpuid(0, &eax, &ebx, &ecx, &edx);
> >>  
> >>          boot_cpu_data.x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
> >> +
> >> +        if ( cpu_vendor() != boot_cpu_data.x86_vendor )
> >> +            panic("CPU vendor not compiled-in: %s",
> >> +                  x86_cpuid_vendor_to_str(boot_cpu_data.x86_vendor));
> >
> > Is this going to be useful?  I fear the panic here might happen even
> > before the console is setup, so a user won't get any output from Xen
> > at all.
> 
> It is true that early_cpu_init() is invoked immediately after serial is
> set up, so any other vendor check ends up being fairly useless.
> 
> OTOH, thinking about it may stand to reason to have:
> 
>   1. A very early panic in assembly, like that of missing nx.
>   2. Have this early hypercall setup nonsense present ONLY when INTEL && AMD
>      are both enabled. It really makes no sense to probe when you have
>      explilcitly compiled for a single vendor.

If you don't probe at all, then yes, you would need an assembly-like
message.  However given the hypercall page initialization is likely to
be used mostly in pv-shim mode, not even the assembly message would
get out I'm afraid, as the code to print such message only outputs to
the VGA and the serial, but not to the Xen PV console provided in shim
mode.  pv-shim runs inside of a PVH container, that doesn't have
emulated serial or VGA.

You could implement early PV console support to print such message,
but it seems simpler to me to defer the panic until early_cpu_init()
for the sake of simplicity.

> 
> >
> > Would it be fine to allow such mismatch in the hypercall setup, just
> > for the sake of getting the console page setup so that
> > early_cpu_init() can print a proper error message?
> >
> > Allowing the vendor mismatch here won't require any extra code, it's
> > just the selection of the instruction to use to call into Xen when
> > running in guest/shim mode.
> 
> It'd be fine, yes. Maybe with a comment noting we can use vm{m,}call whether
> or not cpu_vendor() == 0 because the instruction itself is supported by HW.
> 
> OTOH, I could also fully drop the dynamic detection logic on AMDLIKE-only or
> INTELLIKE-only builds like I mentioned above.

That would still leave us in a difficult situation w.r.t printing
anything to warn the user in case of mismatch.

> I sort of like that second option, as it allows removing hypercall.S and
> hook it to the real hypercall machinery, that at that point can have the
> alternatives removed.

I think you possible need a way to cope with vendor mismatch in the
early hypercall setup, just enough so that you can get into
early_cpu_init() to panic and print an error message.

Thanks, Roger.

