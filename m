Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Bu7KCOjhWmSEQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 09:15:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D41EAFB550
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 09:15:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222889.1530571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voGzl-0007QO-K4; Fri, 06 Feb 2026 08:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222889.1530571; Fri, 06 Feb 2026 08:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voGzl-0007Ox-H7; Fri, 06 Feb 2026 08:15:17 +0000
Received: by outflank-mailman (input) for mailman id 1222889;
 Fri, 06 Feb 2026 08:15:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wPAo=AK=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1voGzk-0007Or-IS
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 08:15:16 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f40b9cf7-0333-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 09:15:10 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA0PR03MB5402.namprd03.prod.outlook.com (2603:10b6:806:b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 08:15:07 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 08:15:07 +0000
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
X-Inumbo-ID: f40b9cf7-0333-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZl1OIZCM93WhrAwePcVEoLK52b+swVbgd4Ux6HfhYDA97xLxbNsDmWdD9M+NPZAr9m6LkCzstMrewRGdheWK/EGYlavCtR++jXjM9XsbzNbhHcjeZ4zYoLs2Pl/lhqE7hq9JZlxY1AlMnsKE3WA8eqFWOuQky0DfkSB+AIlrEroZdmQj5FOPJ81Z5NhJc2zeLNG0tLvhfA7O+ZvgI3XimCzi5oj0lUc54cwPxfrN+t9IP+SqbgFRRuppKgFF5q/A1Z74Amsoa3efBxih3DTmyLxT4TB5B3dJ8a2hWtq10q0uCOojCksauzvLoSw5RiWUYCcqC620AXBTE3WDkp5yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFyHYnlCeziwmKXfVZeH/osv2ZsO8WuiR/tQbVYnudc=;
 b=HHVTv21gD9gKZc/HD/dw4RW5nDGslaYARIAfc+HsenF07FVu2J0wMxQ28FwugMgFNZdx574njzg7iLiSVVBjKLoIFn3UKf5yvjjxhPc5vO9MoteBmBw+OEB0NbWT2ah3hqOayGsDIMPFJAicZ7Ricp9s9icHCO9AYJ43Vt+2pQ0bGTJbpseRhlqJEmJp+ACYdhCa9BR8Qd5CSshWZE2zGR6k5Eu/WUf1Mq/NXqRTyxge5rsN3WA94DbMV9Qm3XPLD1I/8L41dQlsae/h7X5JPYoGK5gqHEBFTbyTlFTaEOEjvcejEauNQHuYaAvGHvwxQEQyUC5eVtvwNd1GdoTL1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFyHYnlCeziwmKXfVZeH/osv2ZsO8WuiR/tQbVYnudc=;
 b=sdw3Fzz2U7mWRCLRXJ81jgTmXYmQdW9wKmXmZBs+yLf5rvG/DHpH8dK6pMuQ1LZfPM87u6qYERtprxEy6Xtos4ReomD1bmWdpW32gezesVbSAJGEAMQYbpz+BK9XjZXcsd7i/OXj9QJp3mYOFtk7QvzHmj6ipY6PsA9EfLsKSfQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 Feb 2026 09:15:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com,
	andrew.cooper3@citrix.com, jason.andryuk@amd.com,
	alejandro.garciavallejo@amd.com
Subject: Re: [PATCH] x86/hvm: Add Kconfig option to disable nested
 virtualization
Message-ID: <aYWjB-fxIzdk0K6_@Mac.lan>
References: <20260206015032.4159672-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260206015032.4159672-1-stefano.stabellini@amd.com>
X-ClientProxiedBy: MR1P264CA0202.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA0PR03MB5402:EE_
X-MS-Office365-Filtering-Correlation-Id: eb819473-a3d2-4263-777c-08de6557d6e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHRHVXpuYUNLMXI2Mmg0SCtBSWRLSElLUDBVSk9yMXdoNytIVEVxR3ZQVkpL?=
 =?utf-8?B?OGlYQ2sxMmt1QVkydTcvR2k2WkVhOGEzcDNCNWlpRThGcXo0RHVySVhZbFNq?=
 =?utf-8?B?bDVTWVhtMi82ZUIrWmxDelh1cFNTNmpxZVhiWlJDNFlWWEdib0Uyb2s4ajdh?=
 =?utf-8?B?MFo3ZXlETkhOQ05JMThRbEdxcGxXZmxTT0M3QTl1OWZSZTRwWDhBcGFQMVJq?=
 =?utf-8?B?U0U3ZElhRHFlMTR3eUlINFBRUFJoTUt2TkdrcHF3eXptQkpmZVJYMXpaT2Vx?=
 =?utf-8?B?VEFQSkpQRWFvaU9rLzJRbUlGdmplMzFDZExaa1pYa3hocmdOQ21xT1FmSzRH?=
 =?utf-8?B?R0FocHlYVlRuUkk5dDd4WTZ6Szl1V2xORDR0akU5bm5Mc3BrTzlpRTlrVTdt?=
 =?utf-8?B?VW1NZEtnbFpuRTVhbUJSRi9sV0tsdVNyUWdSbHVZd3RlS3NjNnNLLzIwMzQ2?=
 =?utf-8?B?VDZzY1U4Vy96QnMyaGRYbUl1b09LQlp4VWZucjV3L0tYeFpvNWthd3JyR2tI?=
 =?utf-8?B?b1BvSmR3cXpDRUR4QzU0NXlmRDJYQ3REdHNHL2dFU0E3S285NVFFVTR1elNt?=
 =?utf-8?B?NENHR0t2enltdUljV292c3FuUlBmdGlZbnNkd0FrNnNiUjdHeG5seHpuRkxx?=
 =?utf-8?B?YjNVaUQ1a1g4Ums0VUhjL3NzNnJuMnJIbDJoc3hNMWpNeTdDSUhDNWorV3Qz?=
 =?utf-8?B?MVZzU3R4Rmo5Z0hpZnRVZUdWd0c0OFpoMG9JZ0pFMFV2QWR2ZFlmdDdReDVm?=
 =?utf-8?B?WnJkUVNITkNaQjB6enVMcFlZRmcyMGZWNzFvazQ2RjBxWmRZV0MyUTk2YzI2?=
 =?utf-8?B?Y01uMGJGcGlZK1hNWFNDTE5sSWhKMGtkOE5FL3FDT05XZnA5R2RWaEJZNXlp?=
 =?utf-8?B?SkQvc25PS0ZNZ0Y2Q2hvT0l4ZnVteVZrWTBveTM2N3NDbEVTUDR4RHJqemhx?=
 =?utf-8?B?aUgvNndCTUJMTFZtaXM5OGNOOEdXZ3VLYWRpSGxSci9uREFrTFppaUw4WW0y?=
 =?utf-8?B?V2l2NUg3ejQ2YzB1R2diejgyZEhXaHM1VmlhdWU0elZ6WHBNTlk0WG1yQkZD?=
 =?utf-8?B?OEVrWGRRYzU0ZEh3d3lUVDBCeTJKMVMyVlRQMFU4UkpNTEJ0Z1Y0UWhzRHB4?=
 =?utf-8?B?aURyT2RTTjhPMGRuM055OHhCdFljaFZzOXJHdWFCdkdpam5IaHViZlJqKzNP?=
 =?utf-8?B?SjY1NGNOL0RmejczSENyOC9VN253bllXSGcreThkTSthcnM5MkNwdEcrRGQy?=
 =?utf-8?B?anF0RlNkcHJySndHSkdxZXpybGRnV0p1NG5XRGQyeWsxcFY0Q0F2N3M3NVdl?=
 =?utf-8?B?emV1U2ptZ20xWDZObUsxZXU5a0Y4RTNnMXJtQ3BJMUVsSFViejQ3Y2JkUHZM?=
 =?utf-8?B?WHVwQ3h0MzY4NW80bXViRXdwSEtuSzhkMHIzQjg4NDF0dU96UlFZVm03Y2tj?=
 =?utf-8?B?a3Rad2F1TDhKMjdudE5udVp1VzFjbCtnTzBKNlgvVyt2Z3VaMmd3K3BpOGlv?=
 =?utf-8?B?aFpBa282MVkvYVNDeHowcVQzSzVzU2lwenRCZVQ0aXJza3M5bTY4V2xTMXMy?=
 =?utf-8?B?UDhDaXlUcURqTkZ2c1dlbmFReVJPUUFJMnBXdDJYQzZEQnp1VFY0cUw2RGcr?=
 =?utf-8?B?SENjWUxNTnlTbjNtdGIzUWlsNVhKZWdNRTlQdXBhOXV5emZTMG9qbGNEbjJH?=
 =?utf-8?B?cStFM25pYUFIeFRwd1VzNlhjRWpQaElUckR0WFJMRlVBRjZaQ1VPZktQYkx5?=
 =?utf-8?B?dlA0ckg4UnZGU2ErVHZ3anhzOXM4THlENFdNdm1jK1hKUDhNUlhpeldPVUE0?=
 =?utf-8?B?b3lVYjUvRWxldk13UTJ4aTZDbDFQOVU2K3dVcXp4bERNQWJ3cDhQaGo3S0RV?=
 =?utf-8?B?aGsxeko4R0pWUUp1OFZRZTZmZlFhNXdlamZPbDJHTEY4L2hSMEJZYjA0dHhD?=
 =?utf-8?B?MFQwY3ZCM1pEYzZtdXRaUlBUaVl6cTIwT1Avc0d4bDdpUDFEL3lCZlFDNThJ?=
 =?utf-8?B?WmlRY0tqZTIxdWNuUDk4dGFzbUpMVHZZdVpYMjAxUGYra2N1ZVdZYjE3V0tJ?=
 =?utf-8?B?YU5VUmhENmh6REtmVGJORUZWUVJrZEJoMzk2QnV1ejBmMTZjQlVHT281U3Iz?=
 =?utf-8?Q?G5bU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekxoYnhGTytHWUNWSmRaZmlXaFpzeTF0T3lkcVRvQlllaUJDMFlCcDdrRy8y?=
 =?utf-8?B?UUxBZktVUE9iNlUwKzRkTjBFaUQ3YnVnMHJyMlo2aWtwcGs0T3NNcndOelRC?=
 =?utf-8?B?WnpGNkFwTHIxcTMyeEx2L2NvREx2OTRvNHhaNjhmeUlJbldLcjhZMi9kQTNY?=
 =?utf-8?B?QVVDZkdmME1Jeks4U09nTVdpKzFsRVcvK0tHWGNtVy9QYUQwOGNWM0ZoRUhW?=
 =?utf-8?B?bjlKdExxUmRXMThGaThJdWRiTUcxc2FYYnN2dGsrdkRwTEx4djduRWwzY3V1?=
 =?utf-8?B?UXRGdlN4dmQ0VlhCVTJSdDlWemxaMFU5RFQzN3E2S2ljd2lTYWhocXdURnl4?=
 =?utf-8?B?NVZ1NzJYZ3hIUC9QSU5aYkNxMkNUMEJWVDIvTHJjMHd0bmtSSksvUUNnUVpm?=
 =?utf-8?B?L3VqczhIbDRPOEZPem5tZEtranVrOFRJY2swbVpXRVZEQ2NDdVVUV1RzM3hV?=
 =?utf-8?B?OVZPMmlHL0tFc1BKVzJ2dmJacVZ6TnJwZGFyM3BrWElqUWZ3Z25VQ3FaZUtz?=
 =?utf-8?B?QnI5ZC9nV01OZ09YdkxuUVRXMnNkVGhaVWNCM0lRQzh3YkM1NnRjY09NbCtn?=
 =?utf-8?B?cXh3MmJNVEFYcHR5aFZ4UkF6RS94dVlqZ0V4RTZxMUQwSDdtRHFRWE5LMVA4?=
 =?utf-8?B?SDROQkpZV2NkSDRrZUZoMTJUeUpUSFlWdEs5aUJFcWxNLzU0cmMwUjgwYm9m?=
 =?utf-8?B?LzV5djkyck9xSi9PS0drZlhicThyZXBuYnp3WXJ4c0JOd2tlMGlrMThoaXk1?=
 =?utf-8?B?OVpxSWErYU5wYUlyZGxTWUh1NmdmamZJVDVYcG9sZGZhQlhSUHZoN3pIVHBt?=
 =?utf-8?B?bi9DUnNiY2VYN1BqaHZZbEhrRzhPREdZZGk4M0xvWEtMRzkrSFhITTgyY2FQ?=
 =?utf-8?B?cURaRittYlRrSDdjZTVxNnppcEZDcFgyYXI4NjlqdU1yUC9jV3ZIS2pLbUp3?=
 =?utf-8?B?VEc5V21FMWl5Ymo0dXE1UEV5Z2hkbFRBcCsvdGZDSmhUNHYvR0lnOThRUFVQ?=
 =?utf-8?B?dS9PZEJMSU1tSURnUG9NQjVMdmpDNlBDMnI4UmJvUTlxUjZoZFgwOWpKOHZI?=
 =?utf-8?B?bjEvUnpDV2hWUDdtREVqUFZtY0pkZG5ZQmtqdEN3VTBLMFZBTnZ3cm01cEZw?=
 =?utf-8?B?KzFaeXd6aGtEcEVJR1hlUjRoVFVHTG50YVMxM0phMHRDZFF1L00xMWw3NTdS?=
 =?utf-8?B?MXJmTUc0OHVsTnlZWVQrUVRzalBLTDVmVGk3MWhIdXhINlJsVTNhU1hqTDRP?=
 =?utf-8?B?WU9EeGZRN0pHa0d0NVB3eFd6K3N4bzVKYkt1L1VORHozS1FQK0hjQ2ZMYUNQ?=
 =?utf-8?B?MWR6SlJKTk1iQlRScVJNQ3FYazhDWDNxcG42RlFGYjlLMXRuejhtN3JGODhB?=
 =?utf-8?B?MXdrbHpYeXVPV0t2bUJFMXlLc2NNS1NFRE1KV05EM1ZkNGMxRG5CeUp0Qkk3?=
 =?utf-8?B?SVMyKzBxaFROQko1dHhDMko4NGVYcG1DKzNqWUNmMit3a0hoNkNoNGtrRjly?=
 =?utf-8?B?aGsxUW1IQitXOW44NVJNcFhtU3ZyOXhFdFRTTk4zbWF6blRNdW1HeTBSbXJw?=
 =?utf-8?B?a1ZVMGdDemhZME0vUHl6L2JQSmI2NXRLUVlVb1ZsYldpR0xPSzZLYUJvQkdZ?=
 =?utf-8?B?WFRzTEY4L2dSb0VSN2lWaHJiSGdsUktranU1b2hhOVJMTjNGVU9JU2tqTjhW?=
 =?utf-8?B?NW5adm1UUTNHSDNEZjRBak90MlhaWU9hait2ZTJPN3VDWU5JZ3pOdG1KeEtp?=
 =?utf-8?B?c0VEVWpTMkpzbldYTGpYM09Wb0NLUzVuMDlWUElocWNRK2ZMd3hMTnVvRVNs?=
 =?utf-8?B?NjBlQ2tlTm8wL2tqTTgwcmdGeUUwODV3ZFhHQmViTmM3ZHdzNDJPeW1mMmZj?=
 =?utf-8?B?OUU4b2RZMDBhK3lNaklFVzBCRVl5dVlRY3VFMmRqcnhrU2xQTHRDR2RmTzV0?=
 =?utf-8?B?OSsrWDV3YUc3S3N2bzBvVW9JemNqdWg5ajR3YUx6eDRyMUlhbzFIYytYd0ND?=
 =?utf-8?B?emNmRXZvZ29kRjEvTG9vUjBqb3hUai84d1hIc3BtV3A3VWNGNWVhOW9TVytG?=
 =?utf-8?B?OUQ1bzBDZ1R4Y2dkWWdlT3B1Y1RtVWd2bDJWSDBoazl6ZmxUVW5DOFkzUzFv?=
 =?utf-8?B?a0NKSFVvQTFSc2UydWtuM1NaV0RlVXdwaHYxTUpLR0d0ZXh4Q3JWNkQ2bERp?=
 =?utf-8?B?YWdBSDBhZTQ4QTlEUnY1U0F3aTl5R0hTNzlpYnVUdGZsMVd2c1owQ2hMUkZB?=
 =?utf-8?B?U1g4dTRVT05HZnJXdUZkK2JBeGJzRnNaVlpTbzdRcWw1NnVpamtjV3NWV2Yr?=
 =?utf-8?B?L2VjeGxEdlVhUEpUcUVHZkg1VWNwSnEySTNzOS9qM0FjSHB6eHJoQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb819473-a3d2-4263-777c-08de6557d6e1
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 08:15:07.6455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gvj4eaQZWo5SEW5T1mhYOyR9RMhb7XfgtsBlvCUTL1xpkOrmS8lQYS9AYJ6NrzOW+g00cGhXKpZ5Ul2ssS+w2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5402
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
	FORGED_RECIPIENTS(0.00)[m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,Mac.lan:mid,citrix.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D41EAFB550
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 05:50:32PM -0800, Stefano Stabellini wrote:
> Introduce CONFIG_NESTED_VIRT (default y, requires EXPERT to disable)
> to allow nested virtualization support to be disabled at build time.
> This is useful for embedded or safety-focused deployments where
> nested virtualization is not needed, reducing code size and attack
> surface.
> 
> When CONFIG_NESTED_VIRT=n, the following source files are excluded:
> - arch/x86/hvm/nestedhvm.c
> - arch/x86/hvm/svm/nestedsvm.c
> - arch/x86/hvm/vmx/vvmx.c
> - arch/x86/mm/nested.c
> - arch/x86/mm/hap/nested_hap.c
> - arch/x86/mm/hap/nested_ept.c
> 
> Add inline stubs where needed in headers.
> 
> No functional change when CONFIG_NESTED_VIRT=y.

You also need to adjust arch_sanitise_domain_config() so it refuses to
create domains with the XEN_DOMCTL_CDF_nested_virt flag set when
CONFIG_NESTED_VIRT=n.  If you do that I think a bunch of the dummy
helpers that you add when CONFIG_NESTED_VIRT=n should also gain an
ASSERT_UNREACHABLE().

And IMO you will also need to add a new XEN_SYSCTL_PHYSCAP_nestedhvm
(or alike) to signal the toolstack whether the nested HVM feature is
available.  Much like we do for HAP/Shadow/gnttab availability.

> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  xen/arch/x86/hvm/Kconfig                 | 10 ++++++
>  xen/arch/x86/hvm/Makefile                |  2 +-
>  xen/arch/x86/hvm/svm/Makefile            |  2 +-
>  xen/arch/x86/hvm/svm/nestedhvm.h         | 44 +++++++++++++++++++++---
>  xen/arch/x86/hvm/svm/svm.c               |  6 ++++
>  xen/arch/x86/hvm/vmx/Makefile            |  2 +-
>  xen/arch/x86/hvm/vmx/vmx.c               | 10 ++++--
>  xen/arch/x86/include/asm/hvm/nestedhvm.h | 41 +++++++++++++++++-----
>  xen/arch/x86/include/asm/hvm/vmx/vvmx.h  | 30 ++++++++++++++++
>  xen/arch/x86/mm/Makefile                 |  2 +-
>  xen/arch/x86/mm/hap/Makefile             |  4 +--
>  xen/arch/x86/mm/p2m.h                    |  6 ++++
>  12 files changed, 137 insertions(+), 22 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
> index f32bf5cbb7..12b5df4710 100644
> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -92,4 +92,14 @@ config MEM_SHARING
>  	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
>  	depends on INTEL_VMX
>  
> +config NESTED_VIRT
> +	bool "Nested virtualization support" if EXPERT
> +	depends on AMD_SVM || INTEL_VMX
> +	default y
> +	help
> +	  Enable nested virtualization, allowing guests to run their own
> +	  hypervisors. This requires hardware support.
> +
> +	  If unsure, say Y.

If we go that route, I think nested virt should become off by default.
It's not security supported, and known to be broken in many areas.

I'm also unsure about whether this wants to be gated under EXPERT.
But I'm not sure I'm any good at knowing whether something should be
under EXPERT or not.

> +
>  endif
> diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
> index f34fb03934..b8a0a68624 100644
> --- a/xen/arch/x86/hvm/Makefile
> +++ b/xen/arch/x86/hvm/Makefile
> @@ -18,7 +18,7 @@ obj-y += irq.o
>  obj-y += mmio.o
>  obj-$(CONFIG_VM_EVENT) += monitor.o
>  obj-y += mtrr.o
> -obj-y += nestedhvm.o
> +obj-$(CONFIG_NESTED_VIRT) += nestedhvm.o
>  obj-y += pmtimer.o
>  obj-y += quirks.o
>  obj-y += rtc.o
> diff --git a/xen/arch/x86/hvm/svm/Makefile b/xen/arch/x86/hvm/svm/Makefile
> index 8a072cafd5..92418e3444 100644
> --- a/xen/arch/x86/hvm/svm/Makefile
> +++ b/xen/arch/x86/hvm/svm/Makefile
> @@ -2,6 +2,6 @@ obj-y += asid.o
>  obj-y += emulate.o
>  obj-bin-y += entry.o
>  obj-y += intr.o
> -obj-y += nestedsvm.o
> +obj-$(CONFIG_NESTED_VIRT) += nestedsvm.o
>  obj-y += svm.o
>  obj-y += vmcb.o
> diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
> index 9bfed5ffd7..a102c076ea 100644
> --- a/xen/arch/x86/hvm/svm/nestedhvm.h
> +++ b/xen/arch/x86/hvm/svm/nestedhvm.h
> @@ -26,6 +26,13 @@
>  #define nsvm_efer_svm_enabled(v) \
>      (!!((v)->arch.hvm.guest_efer & EFER_SVME))
>  
> +#define NSVM_INTR_NOTHANDLED     3
> +#define NSVM_INTR_NOTINTERCEPTED 2
> +#define NSVM_INTR_FORCEVMEXIT    1
> +#define NSVM_INTR_MASKED         0
> +
> +#ifdef CONFIG_NESTED_VIRT
> +
>  int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr);
>  void nestedsvm_vmexit_defer(struct vcpu *v,
>      uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2);
> @@ -57,13 +64,40 @@ int cf_check nsvm_hap_walk_L1_p2m(
>      struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
>      uint8_t *p2m_acc, struct npfec npfec);
>  
> -#define NSVM_INTR_NOTHANDLED     3
> -#define NSVM_INTR_NOTINTERCEPTED 2
> -#define NSVM_INTR_FORCEVMEXIT    1
> -#define NSVM_INTR_MASKED         0
> -
>  int nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack);
>  
> +#else /* !CONFIG_NESTED_VIRT */
> +
> +static inline int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr)
> +{
> +    return 0;
> +}
> +static inline void nestedsvm_vmexit_defer(struct vcpu *v,
> +    uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2) { }
> +static inline enum nestedhvm_vmexits nestedsvm_vmexit_n2n1(struct vcpu *v,
> +    struct cpu_user_regs *regs)
> +{
> +    return NESTEDHVM_VMEXIT_ERROR;
> +}
> +static inline enum nestedhvm_vmexits nestedsvm_check_intercepts(struct vcpu *v,
> +    struct cpu_user_regs *regs, uint64_t exitcode)
> +{
> +    return NESTEDHVM_VMEXIT_ERROR;
> +}
> +static inline void svm_nested_features_on_efer_update(struct vcpu *v) { }
> +static inline void svm_vmexit_do_clgi(struct cpu_user_regs *regs,
> +                                      struct vcpu *v) { }
> +static inline void svm_vmexit_do_stgi(struct cpu_user_regs *regs,
> +                                       struct vcpu *v) { }
> +static inline bool nestedsvm_gif_isset(struct vcpu *v) { return true; }
> +static inline int nestedsvm_vcpu_interrupt(struct vcpu *v,
> +                                           const struct hvm_intack intack)
> +{
> +    return NSVM_INTR_NOTINTERCEPTED;
> +}
> +
> +#endif /* CONFIG_NESTED_VIRT */
> +
>  #endif /* __X86_HVM_SVM_NESTEDHVM_PRIV_H__ */
>  
>  /*
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 18ba837738..0234b57afb 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -46,6 +46,10 @@
>  
>  void noreturn svm_asm_do_resume(void);
>  
> +#ifndef CONFIG_NESTED_VIRT
> +void asmlinkage nsvm_vcpu_switch(void) { }
> +#endif
> +
>  u32 svm_feature_flags;
>  
>  /*
> @@ -2465,6 +2469,7 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
>      .set_rdtsc_exiting    = svm_set_rdtsc_exiting,
>      .get_insn_bytes       = svm_get_insn_bytes,
>  
> +#ifdef CONFIG_NESTED_VIRT
>      .nhvm_vcpu_initialise = nsvm_vcpu_initialise,
>      .nhvm_vcpu_destroy = nsvm_vcpu_destroy,
>      .nhvm_vcpu_reset = nsvm_vcpu_reset,
> @@ -2474,6 +2479,7 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
>      .nhvm_vmcx_hap_enabled = nsvm_vmcb_hap_enabled,
>      .nhvm_intr_blocked = nsvm_intr_blocked,
>      .nhvm_hap_walk_L1_p2m = nsvm_hap_walk_L1_p2m,
> +#endif
>  
>      .get_reg = svm_get_reg,
>      .set_reg = svm_set_reg,
> diff --git a/xen/arch/x86/hvm/vmx/Makefile b/xen/arch/x86/hvm/vmx/Makefile
> index 04a29ce59d..902564b3e2 100644
> --- a/xen/arch/x86/hvm/vmx/Makefile
> +++ b/xen/arch/x86/hvm/vmx/Makefile
> @@ -3,4 +3,4 @@ obj-y += intr.o
>  obj-y += realmode.o
>  obj-y += vmcs.o
>  obj-y += vmx.o
> -obj-y += vvmx.o
> +obj-$(CONFIG_NESTED_VIRT) += vvmx.o
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 82c55f49ae..252f27322b 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -55,6 +55,10 @@
>  #include <public/hvm/save.h>
>  #include <public/sched.h>
>  
> +#ifndef CONFIG_NESTED_VIRT
> +void asmlinkage nvmx_switch_guest(void) { }
> +#endif
> +
>  static bool __initdata opt_force_ept;
>  boolean_param("force-ept", opt_force_ept);
>  
> @@ -2033,7 +2037,7 @@ static void nvmx_enqueue_n2_exceptions(struct vcpu *v,
>                   nvmx->intr.intr_info, nvmx->intr.error_code);
>  }
>  
> -static int cf_check nvmx_vmexit_event(
> +static int cf_check __maybe_unused nvmx_vmexit_event(
>      struct vcpu *v, const struct x86_event *event)
>  {
>      nvmx_enqueue_n2_exceptions(v, event->vector, event->error_code,
> @@ -2933,6 +2937,7 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
>      .handle_cd            = vmx_handle_cd,
>      .set_info_guest       = vmx_set_info_guest,
>      .set_rdtsc_exiting    = vmx_set_rdtsc_exiting,
> +#ifdef CONFIG_NESTED_VIRT
>      .nhvm_vcpu_initialise = nvmx_vcpu_initialise,
>      .nhvm_vcpu_destroy    = nvmx_vcpu_destroy,
>      .nhvm_vcpu_reset      = nvmx_vcpu_reset,
> @@ -2942,8 +2947,9 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
>      .nhvm_vcpu_vmexit_event = nvmx_vmexit_event,
>      .nhvm_intr_blocked    = nvmx_intr_blocked,
>      .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
> -    .update_vlapic_mode = vmx_vlapic_msr_changed,
>      .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
> +#endif
> +    .update_vlapic_mode = vmx_vlapic_msr_changed,
>  #ifdef CONFIG_VM_EVENT
>      .enable_msr_interception = vmx_enable_msr_interception,
>  #endif
> diff --git a/xen/arch/x86/include/asm/hvm/nestedhvm.h b/xen/arch/x86/include/asm/hvm/nestedhvm.h
> index ea2c1bc328..0372974b24 100644
> --- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
> +++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
> @@ -25,9 +25,21 @@ enum nestedhvm_vmexits {
>  /* Nested HVM on/off per domain */
>  static inline bool nestedhvm_enabled(const struct domain *d)
>  {
> -    return IS_ENABLED(CONFIG_HVM) && (d->options & XEN_DOMCTL_CDF_nested_virt);
> +    return IS_ENABLED(CONFIG_NESTED_VIRT) &&
> +           (d->options & XEN_DOMCTL_CDF_nested_virt);
>  }
>  
> +/* Nested paging */
> +#define NESTEDHVM_PAGEFAULT_DONE       0
> +#define NESTEDHVM_PAGEFAULT_INJECT     1
> +#define NESTEDHVM_PAGEFAULT_L1_ERROR   2
> +#define NESTEDHVM_PAGEFAULT_L0_ERROR   3
> +#define NESTEDHVM_PAGEFAULT_MMIO       4
> +#define NESTEDHVM_PAGEFAULT_RETRY      5
> +#define NESTEDHVM_PAGEFAULT_DIRECT_MMIO 6
> +
> +#ifdef CONFIG_NESTED_VIRT
> +
>  /* Nested VCPU */
>  int nestedhvm_vcpu_initialise(struct vcpu *v);
>  void nestedhvm_vcpu_destroy(struct vcpu *v);
> @@ -38,14 +50,6 @@ bool nestedhvm_vcpu_in_guestmode(struct vcpu *v);
>  #define nestedhvm_vcpu_exit_guestmode(v)  \
>      vcpu_nestedhvm(v).nv_guestmode = 0
>  
> -/* Nested paging */
> -#define NESTEDHVM_PAGEFAULT_DONE       0
> -#define NESTEDHVM_PAGEFAULT_INJECT     1
> -#define NESTEDHVM_PAGEFAULT_L1_ERROR   2
> -#define NESTEDHVM_PAGEFAULT_L0_ERROR   3
> -#define NESTEDHVM_PAGEFAULT_MMIO       4
> -#define NESTEDHVM_PAGEFAULT_RETRY      5
> -#define NESTEDHVM_PAGEFAULT_DIRECT_MMIO 6
>  int nestedhvm_hap_nested_page_fault(struct vcpu *v, paddr_t *L2_gpa,
>                                      struct npfec npfec);
>  
> @@ -59,6 +63,25 @@ unsigned long *nestedhvm_vcpu_iomap_get(bool ioport_80, bool ioport_ed);
>  
>  void nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m);
>  
> +#else /* !CONFIG_NESTED_VIRT */
> +
> +static inline int nestedhvm_vcpu_initialise(struct vcpu *v) { return 0; }
> +static inline void nestedhvm_vcpu_destroy(struct vcpu *v) { }
> +static inline void nestedhvm_vcpu_reset(struct vcpu *v) { }
> +static inline bool nestedhvm_vcpu_in_guestmode(struct vcpu *v) { return false; }
> +static inline int nestedhvm_hap_nested_page_fault(struct vcpu *v, paddr_t *L2_gpa,
> +                                                  struct npfec npfec)
> +{
> +    return NESTEDHVM_PAGEFAULT_L0_ERROR;
> +}
> +#define nestedhvm_vcpu_enter_guestmode(v) do { } while (0)
> +#define nestedhvm_vcpu_exit_guestmode(v)  do { } while (0)
> +#define nestedhvm_paging_mode_hap(v) false
> +#define nestedhvm_vmswitch_in_progress(v) false
> +static inline void nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m) { }
> +
> +#endif /* CONFIG_NESTED_VIRT */
> +
>  static inline bool nestedhvm_is_n2(struct vcpu *v)
>  {
>      if ( !nestedhvm_enabled(v->domain) ||
> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
> index da10d3fa96..8dc876a4c2 100644
> --- a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
> @@ -73,6 +73,8 @@ union vmx_inst_info {
>      u32 word;
>  };
>  
> +#ifdef CONFIG_NESTED_VIRT
> +
>  int cf_check nvmx_vcpu_initialise(struct vcpu *v);
>  void cf_check nvmx_vcpu_destroy(struct vcpu *v);
>  int cf_check nvmx_vcpu_reset(struct vcpu *v);
> @@ -199,5 +201,33 @@ int nept_translate_l2ga(struct vcpu *v, paddr_t l2ga,
>                          uint64_t *exit_qual, uint32_t *exit_reason);
>  int nvmx_cpu_up_prepare(unsigned int cpu);
>  void nvmx_cpu_dead(unsigned int cpu);
> +
> +#else /* !CONFIG_NESTED_VIRT */
> +
> +static inline void nvmx_update_exec_control(struct vcpu *v, u32 value) { }
> +static inline void nvmx_update_secondary_exec_control(struct vcpu *v,
> +                                                      unsigned long value) { }
> +static inline void nvmx_update_exception_bitmap(struct vcpu *v,
> +                                                unsigned long value) { }
> +static inline u64 nvmx_get_tsc_offset(struct vcpu *v) { return 0; }
> +static inline void nvmx_set_cr_read_shadow(struct vcpu *v, unsigned int cr) { }
> +static inline bool nvmx_intercepts_exception(struct vcpu *v, unsigned int vector,
> +                                             int error_code) { return false; }
> +static inline int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs,
> +                                         unsigned int exit_reason) { return 0; }
> +static inline void nvmx_idtv_handling(void) { }
> +static inline int nvmx_msr_read_intercept(unsigned int msr, u64 *msr_content)
> +{
> +    return 0;
> +}
> +static inline int nvmx_handle_vmx_insn(struct cpu_user_regs *regs,
> +                                       unsigned int exit_reason) { return 0; }
> +static inline int nvmx_cpu_up_prepare(unsigned int cpu) { return 0; }
> +static inline void nvmx_cpu_dead(unsigned int cpu) { }
> +
> +#define get_vvmcs(vcpu, encoding) 0
> +
> +#endif /* CONFIG_NESTED_VIRT */
> +
>  #endif /* __ASM_X86_HVM_VVMX_H__ */
>  
> diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
> index 960f6e8409..aa15811c2e 100644
> --- a/xen/arch/x86/mm/Makefile
> +++ b/xen/arch/x86/mm/Makefile
> @@ -7,7 +7,7 @@ obj-$(CONFIG_SHADOW_PAGING) += guest_walk_4.o
>  obj-$(CONFIG_VM_EVENT) += mem_access.o
>  obj-$(CONFIG_MEM_PAGING) += mem_paging.o
>  obj-$(CONFIG_MEM_SHARING) += mem_sharing.o
> -obj-$(CONFIG_HVM) += nested.o
> +obj-$(CONFIG_NESTED_VIRT) += nested.o
>  obj-$(CONFIG_HVM) += p2m.o
>  obj-y += p2m-basic.o
>  obj-$(CONFIG_INTEL_VMX) += p2m-ept.o
> diff --git a/xen/arch/x86/mm/hap/Makefile b/xen/arch/x86/mm/hap/Makefile
> index 67c29b2162..de1bb3abde 100644
> --- a/xen/arch/x86/mm/hap/Makefile
> +++ b/xen/arch/x86/mm/hap/Makefile
> @@ -2,5 +2,5 @@ obj-y += hap.o
>  obj-y += guest_walk_2.o
>  obj-y += guest_walk_3.o
>  obj-y += guest_walk_4.o
> -obj-y += nested_hap.o
> -obj-$(CONFIG_INTEL_VMX) += nested_ept.o
> +obj-$(CONFIG_NESTED_VIRT) += nested_hap.o
> +obj-$(CONFIG_NESTED_VIRT) += nested_ept.o

With this change nested_ept.o is no longer gated explicitly on
CONFIG_INTEL_VMX, which could cause build issues if you have a Kconfig
like:

CONFIG_INTEL_VMX=n
CONFIG_AMD_SVM=y
CONFIG_NESTED_VIRT=y

Does the code in nested_ept.o have dependencies on other files gated
by CONFIG_INTEL_VMX, and hence would fail at the linking stage?  And
even if it builds, the code in nested_ept.o would be unreachable I
expect.

Thanks, Roger.

