Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xs/pB9/njWlu8gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:46:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBB512E7C0
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:46:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229158.1535212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXxs-00051s-Ck; Thu, 12 Feb 2026 14:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229158.1535212; Thu, 12 Feb 2026 14:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXxs-0004ya-7U; Thu, 12 Feb 2026 14:46:44 +0000
Received: by outflank-mailman (input) for mailman id 1229158;
 Thu, 12 Feb 2026 14:46:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hp9h=AQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqXxr-0003LH-5m
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 14:46:43 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a504881a-0821-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 15:46:42 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BL1PR03MB6200.namprd03.prod.outlook.com (2603:10b6:208:319::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 14:46:39 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Thu, 12 Feb 2026
 14:46:39 +0000
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
X-Inumbo-ID: a504881a-0821-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrUbWAJgicB/4fCo9ltBjrJPVCFw/q5qRY5jl2uLYM/BYV54QqT8+HmMcXhd4vu39jH5Ebu4/5gHZAre5/M3SNMXMJnSW5eI4wfDiuY8LgQy1uSPkIhjsarcC3EtsMSjh1FjakHioxPBocfEfiPaaysDVyQHJnIEZ9kDJWt/atdufLGZe1XPrrpTcHSyDVCiW8DgoxryIxyzik+Q1IPSy9rT+wXKIuC7blJb2StL63X7iYDWBx1sQjtRSQqf8nsGkfp7HIvMryFzFX6r2ir78VAXUMcWbj5hJgqzHEXwy4hOjUXwG0hDYmb82l9VizyNhHrursJTy9ZD5gO/k/17ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3T8oymG73Snbnqn9O5cozXBum7bvjprNXvXR6x+JXf0=;
 b=KR8rh4oiZCdk/EAHKnBJyvy+vNhCrjmkGeFbiNE+5LzPqUmb/Ja8wXcbulb8M2j76rNpT2Tr2506WzPklWllFA3ucxFu9poYdgrNL7yUV0aoFEabmeWJ3LgnaV7M4XZPVONS8q2Qrw23k1qw5cYJARGGuNQ2QBskwyiuFqNUCl939uhWNV4IowPZBxSgtHWB5Vfk0EgwkqAe9uyXibkw92mC8Tuehsn5eZlOmsYiAQKQMg5ILeN/KuCHDq8ZSDc20c2tOmkNW0lvRHBf7hcruqV3BnyTcL9YOCQ0YSBX//hmmb3dd8PgKHhdmWhgGoyUSof7KuWmDjBZz2UQi1kgag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3T8oymG73Snbnqn9O5cozXBum7bvjprNXvXR6x+JXf0=;
 b=rY3/7yIguFN/rghPXIRk8ViKn/BXa6l1Sk+eIVnQBEUOM6LrM8QV6MM/O4OmxSNhSSy3XEA9cwGjscSQWK6oE2uBmanD4blvKyo22yq4zQgi5qa6MXkPrQz0D3y7btJOxxbC/eG3m2u17IpHWH1kz9xeOYzQahdY6KWzk4zW5No=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 5/5] cirrus-ci: add x86 XTF self-tests for macOS build
Date: Thu, 12 Feb 2026 15:46:18 +0100
Message-ID: <20260212144618.43200-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260212144618.43200-1-roger.pau@citrix.com>
References: <20260212144618.43200-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0080.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::26) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BL1PR03MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: c7779b5e-b4ae-4541-8d32-08de6a458751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmJJaHBKc3R6M0JHWFYzd1NydVZuaElNY252Z0N0NW1hMVMzcHk1aUUrKzFl?=
 =?utf-8?B?dWd4eDVXb0lERFI4SmNLSU5Cc0wrdSt4UHh4WUIwLyt6cjI0c0RKd2xYU3Rv?=
 =?utf-8?B?b2tXM0tOdnEwajI5Z3lrZzZEeFFLbEdZc25GdkZGU1kzSjU2aTl6L3pQVk54?=
 =?utf-8?B?aGdibld2ZExka2RlcUlPaXJSdkdlYVRrRXNFQUV0ZXFWNmFKWWUvVHdXRmxs?=
 =?utf-8?B?NXp4T0dmM1RDeFN5SGg5bHVLSlFUY3Y3QjV5K09FWTVBaUZ0bjFBTjFCUnMv?=
 =?utf-8?B?a21meDQ0QThWNzdVclh4cWtpZnFQLzA2M21Lbm4vMmdkakQ3cDFZeWhxWWt4?=
 =?utf-8?B?b0dqWC9DQy82L2pLYTlheTRONURHWEYyWkVmYmdZcWFyWHJadUJOS1lvK0h1?=
 =?utf-8?B?MEVvZ3M0S0o4UUtTNHl0RHlhWXlxaHd1cWdHdXR3SDFRY1drOWVac0xoY3Qv?=
 =?utf-8?B?Z3FzaDBSVk0rZ24xU0ZZc0t1ZmIwcmtCQ1RVQWFxM0hhU2VpSDkvNmgwdytj?=
 =?utf-8?B?N3QwQjdseXFmVzQvRkdUeVBQekVDQzU2aDJCanRGaSszQWN3MUVsbTRWcjlP?=
 =?utf-8?B?YnB3Z1l4Tk1ZWUI1K0pkUzBYQWIzVk0yK25yV1ZET0N2dE9nVDNGZU92V0xC?=
 =?utf-8?B?WmkxM2prN0FsYXdCMi92K295eWF1b2R6ZDE1dHI3LzdXdWhmMkc5bm10a3Nq?=
 =?utf-8?B?cjlpRWIzTWRGQmRwUWxCZEw5aGlIL3lCa2dMRlUxZWovSjVHL2NCc09tMGdX?=
 =?utf-8?B?NHgwdGJucTZwdlUxdzM1RVpiQmxsYXNNL3FIZmFya2pYR2V2MWg0Q0wwUGps?=
 =?utf-8?B?dldDdzZBMUZjVVc1NUlGQVhVbXJqNVpnK2Uxc3VQKzdhN3ZUUm1MdVBWTUNm?=
 =?utf-8?B?OHdZRkU4K09iMHZsTStxbi9jaFlvMDVVTHpjY1BudFpIS3ZsSDdqUXNTWDcz?=
 =?utf-8?B?UkxVUWVLK1RtRlEyUVlPWEV4UFVxS0g4MlorMzFPQ2hHT2N2cFpNbXNlTnJp?=
 =?utf-8?B?ODR0QjVUTVBiKytCT2xoam5saHNNQU1mZU5MeSswUXdmQk5KT3c2MlJhUGo1?=
 =?utf-8?B?QXZHdU5PS3hQZGFjZm1nNFB3Wk1yc2FUMlJ4aDRzRFBiMHpyTUUzQUZzK1Fi?=
 =?utf-8?B?MzNUdm92dFFLTS9jNjNhb01WSDFpR2hMa3ZKYkRVaXVQbEZSMnhWY3drTXhX?=
 =?utf-8?B?aHdsM25nL1BTT21TR0JiaVFTZ3BDVVZlRHRQSFlnYUpUQ0NlMWk3bU0waSsv?=
 =?utf-8?B?MkxIa2Y1OVl0SzE2T2lJS3I4aXFDMXU2MkR3NXQyRTUrRHNSZDZ3R29RMVRs?=
 =?utf-8?B?amJESmZraDVoM3VKV3c5U3ZQNkdLUzVPeDRIc0h1ZTdtdWVlM25PSjlFVWJU?=
 =?utf-8?B?WC9CNElhRVc3dm51ek5UUXBKNk5BWXVTdkpteXBLU1lvYXpLZ2k0Uk91RTNC?=
 =?utf-8?B?UTlPZ3IyalBNSVNoNXZnTlZYdFR4VW9jdGxTS2V2U1lYRnFFb1JWdnpOVG8v?=
 =?utf-8?B?SmxsRTZua2pyNUQ2TTd4SHB6QmZ4bExldlErN2NmeExyTlhmV205TU9UbFcw?=
 =?utf-8?B?UDF5T04rNHJsTk0vdEc4UFBFeGZ2TDY2clU5N2FkRmJnK2RLVk40UG10ZGo1?=
 =?utf-8?B?ZFAxbWNTNGhCdTU2UThQOU8xNlY5cWp6NG5sTTRWMzRzTzRaTDJhcFExclJ3?=
 =?utf-8?B?WjNZemIzdFl1ZDk2NXJGZjAwTkNWR01ESTV6d3dwUDk3T2lQNFRxekprTUJa?=
 =?utf-8?B?dTJqSUgvRmppM1ZVd1JCVERQbUxtSkZQcjhDSy85K1RHNU1tVmpuZE9JcEta?=
 =?utf-8?B?NVJpSkxrMURmSll6Q1ZZVXJ4ZUJHRmIxc3RFazYzWjFFSmxIb3djNE9HV3R6?=
 =?utf-8?B?WHBWTDVndDYvelJlOGF3NnRDTVoxd2ZHK00vazZzYlpQUkVnc0RCZkxyNW9X?=
 =?utf-8?B?NlhMVWJxZkNuS3dlVHlKMlovMW01ZWdIZUdRRzB0ekJWc2o1bVZFZDJwWW9r?=
 =?utf-8?B?WEs5ZGFFbVVYUkVGcXRrYzA1WEd1ZHpLVWU3UHFRVm9abzNLc1dlYlhTRE1p?=
 =?utf-8?Q?JL4kve?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTFGVEpqaEhVMGJ6WjEzYmpiaFZ2c0pmNTFWL2xLd0N4dWN0VTkzMkgvMG5h?=
 =?utf-8?B?R1dybk9mb2E0OWZRWEdGYjRPdmhweCtSaUJRSVJVOS94bElsTHRUaE9JZmJN?=
 =?utf-8?B?RUc1MTdlNzFjMWRCZllGQnlEK1pjTUJtdFdjWTZwU2dTcHZYdk5vN3AvbTFL?=
 =?utf-8?B?QWpLa2RHVVZhTlhHK1NmVFpuVnJkbnJHbHFCUW8xdTgyRklyQTZYWmlsRTlY?=
 =?utf-8?B?VUdpL09DMlVqNldHZzB3cVUvUyt4bUNmMGVscEhydVdORnZGT3lCeVNxOGRs?=
 =?utf-8?B?clM0SUZncU1uVDlHU0dtZG9EWmJ6MjNtNnBYaHRCSnlWK1VlRzIydEFMc0NC?=
 =?utf-8?B?a0RvSGtycktPVGRIYjVMVWZjTjhKdnRTRUlLcDlSWVBhUE82LzRPVXJLbXFl?=
 =?utf-8?B?OVNFMGlOY3ZEUGswdkhwTjhGQ1NJOVRXKzlmcjlsMXFMdCtaRUVhSTZ6Y1VP?=
 =?utf-8?B?YXY3RlRFSUd1ZUFyblNsNU40N1Z1MElBZFRkUCtRRDBOK05iTSsxdUJPSnU5?=
 =?utf-8?B?UlRuNUp5TGd2a25MemI4MW5LQmxpbEttbUdLWTNQYmJuY1Iyb0pocXBDQ2t5?=
 =?utf-8?B?WEZPVFZvU1ZGeTJUZE5rMDNOR3NZSWR6U3dHaGtFVVo3Nmg4bGVNWjByYklN?=
 =?utf-8?B?b1MyZTc1MlVkUzhqcVBKbU9mWExjSFRWaGJIMWR3enBQZXpDUVFJTTY0aDJ0?=
 =?utf-8?B?cEd1Y0pHc0phdUlTTm1OUjVIYVllUXAvaFFvR1FBcEJIRks5SmFtZEh1OFRz?=
 =?utf-8?B?OGlGVEtrWktqcFNuNEJvRWMzK0VLT3FOMzE4M1hvYStUbGxQYUtuaW4xV1Jy?=
 =?utf-8?B?clIrS1dxMFdFMS90dlNmNzNEa3dUVnlOc1RBY2s0TDJOK3ltZ3BrUjJpVDds?=
 =?utf-8?B?NFZNTi9vWFp4blFpTGtnVzZydWVFNWpKcm40aUpKdkswQ2x0WjFNQ3N1QXo4?=
 =?utf-8?B?Q1V4cjRKUTJ1aXk5akRvWnlUS2pSUmQwbkRPMkxmZFo5TFV1aTdRcEFTTzI5?=
 =?utf-8?B?dzROQnJLejZ6MVU0T2oxZGVHdVUwcm9lNjNJR2h2U1Rsc1MrbVBXTDhLMFdH?=
 =?utf-8?B?Tk11dFJTMzVJV01vdDVnaHFTcXMyTHByL0twU1BGcWVnd2xrZWpSRmhvR2Nm?=
 =?utf-8?B?Wm11ZXdPOGxPY2dDaEloZW02NGlsMWVncFIwRGxRUnJLa0tSSndFa3NDSVFR?=
 =?utf-8?B?S1ZlZDgrVzkzeVYvRklzNXpmSmxFa1JiaVFRdTFuLzFrQWdRNjd2bXBZUEc3?=
 =?utf-8?B?UnR4OExFWjVINkVVQXV3UDdFVURSaGYzdEdNK3ZDRS9vc3Nqd1prQ3I0cm1s?=
 =?utf-8?B?YVZsUTZSMjAyeXZXYlRuc29heDZ4ZXB3eDQzYUVMbDBNQnBQWWMrNTJUMnc5?=
 =?utf-8?B?WlJFREMvY3RERldHNmUwSGdxV3JQWjdTR1VkU2tXSDBwNEpFUk9wSXZHTGxY?=
 =?utf-8?B?RWhwQkpJRUU0NUFTcHphMkVqakpkcDAzWldpdnEvLzhtQUtPWG4vajNBNkRa?=
 =?utf-8?B?aXd6R1NHSzhCOWNGWk8zZFYrV24rVmJUUjBXYVRuN3M2em4xMXZBYUhHaTlC?=
 =?utf-8?B?blhnVEFmYmNGNU9ubFI3azYvU2s0ampvN08xNnBNKzBxRkkrZHNLUEtlTGll?=
 =?utf-8?B?TTNLY2hReGpmYy8wbGN0LzBIKzdtRElhNHNicDIraDQzd0gyYnliTUx2dDN3?=
 =?utf-8?B?S0x2eXZFSU1lc2FkRVhWaFgrWkVVcHdNMGo2N0V3eVF0eFFJOFlKK1EyYVFI?=
 =?utf-8?B?SzR0YXp2Z2F2REV6S0hJMzdEZlBjVXVlamNTZXFySGZkTFVVRit1WFR5TU5l?=
 =?utf-8?B?bUVKaHJSclVUV0VOY3pjWWllNU5lcFk0Nnh1SjRhRFIrZyt1SVl6TzFYNUVp?=
 =?utf-8?B?Q2lRVnAzaW1zQWVrTEhpQ1RLMTZlS3l6aVJ5NGVXZm9ZVSszbnlnK2NkTnl1?=
 =?utf-8?B?V3lBYUVVRzJuYVAvazVIUlRlRjk5K3orZnBhRHZaOFBUNVgvUVRaSVVhdDln?=
 =?utf-8?B?dm9nZVFRMG9RNzlCZ3NCeEwwR29ZUnVndmltRTJnaFQyMUlnMHVEVEF6WWsz?=
 =?utf-8?B?Zzh4L0ZuT3hFMHpYMFlEcVVhSUdBbFBFUmZ5cmwxclgvWUhiMkVnTFhWVzBY?=
 =?utf-8?B?TFJkVGNocUtJMlFlaXBQYlN0Uk5lMDZXZjRWcDhDMGo5VWxIYU80ckhRUURq?=
 =?utf-8?B?cTRqWXUxQStSMFhlMXRyNVdQVjhZWnpOcHVnd2hPaWJQeG9OcUE2Q0R5S29T?=
 =?utf-8?B?eVUvY3kzMTJOaFFGYnFvdS9zLzJDZFFkbjgrUnF2UU9vMFpFWDRzUlN2dHRw?=
 =?utf-8?B?dmVDL1BOVTF5dFlVQWhVSXE2dmJteTlxZnptbnhkb2FlYm1OQXIrZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7779b5e-b4ae-4541-8d32-08de6a458751
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:46:39.1216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZa7ZEH3lIehzsgfRiVN//I9B+Xh99n5TPMPEXYgFqeoPnpBU+4KppYSSxu5qnzgKqTH/GkABo29R5e7FYc8Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6200
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3FBB512E7C0
X-Rspamd-Action: no action

Like we do for the FreeBSD builds, introduce some basic smoke testing of
the built binary using the XTF selftest image.

Note this is only done for the x86 build, there's no ARM support in XTF
yet.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .cirrus.yml | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index b9608e71cca7..839c25149c9e 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -161,18 +161,19 @@ task:
 ## Test Jobs
 
 task:
-  name: 'FreeBSD: XTF selftest'
+  name: 'XTF selftest'
 
   << : *FREEBSD_ENV_PRODUCTION
 
   env:
     matrix:
-      FREEBSD_BUILD: $FREEBSD_LEGACY
-      FREEBSD_BUILD: $FREEBSD_PRODUCTION
-      FREEBSD_BUILD: $FREEBSD_CURRENT
+      BUILD: freebsd_full_$FREEBSD_LEGACY
+      BUILD: freebsd_full_$FREEBSD_PRODUCTION
+      BUILD: freebsd_full_$FREEBSD_CURRENT
+      BUILD: macos-x86_64
 
   depends_on:
-    - freebsd_full_$FREEBSD_BUILD
+    - $BUILD
     - xtf
 
   install_script: pkg install -y qemu-nox11 expect
@@ -187,7 +188,7 @@ task:
 
   fetch_script:
     - fetch https://api.cirrus-ci.com/v1/artifact/build/$CIRRUS_BUILD_ID/xtf/xtf.zip
-    - fetch https://api.cirrus-ci.com/v1/artifact/build/$CIRRUS_BUILD_ID/freebsd_full_$FREEBSD_BUILD/xen.zip
+    - fetch https://api.cirrus-ci.com/v1/artifact/build/$CIRRUS_BUILD_ID/$BUILD/xen.zip
     - unzip xtf.zip
     - unzip xen.zip
 
-- 
2.51.0


