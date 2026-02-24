Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Gnk4FC61nWk7RQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 15:26:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE79418858D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 15:26:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240126.1541619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vutMt-0005Ig-Sh; Tue, 24 Feb 2026 14:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240126.1541619; Tue, 24 Feb 2026 14:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vutMt-0005Fn-PE; Tue, 24 Feb 2026 14:26:31 +0000
Received: by outflank-mailman (input) for mailman id 1240126;
 Tue, 24 Feb 2026 14:26:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lz8P=A4=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vutMs-0005Fg-72
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 14:26:30 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce861240-118c-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 15:26:29 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB6580.namprd03.prod.outlook.com (2603:10b6:806:1cb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 14:26:24 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 14:26:24 +0000
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
X-Inumbo-ID: ce861240-118c-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1keaC/Li05eccQ9IIX3eRGKIBgaY/uUn/TEoi/m3KP5GdT8mStTCHXvXOPgubQFboTQq18WmYmM65qRa8/shCnufuNoOpsJCnc02IqTsW0BbAp5e0f854VB16Hb1DSFCHknJXX+UCLl4IBmTPLopAumjJn2cGeMLlJm/tf4zIV6vs2s6ZDfD48ETg1loz+PSG1eX0LkHcyGPIUNQuqixuHECXmsgHYIrOyyWWiHycRiCUrxjsLMq/326RTF6xB7GqBRGo+onLO+KHRfBXj+nqD6m0W6rHlViJKo7LtIB2LvQJM8xvCxgkmiyf5sBixSAO5ZW7hJX66KW1HjGMcwbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19Bd8LEvftnJthG+o8hKaEYBpVLnInB6hlRHUhfQQxQ=;
 b=mrRZg3AIn2mOS2CmmWY36EAnsHcbEsTvO7UhUl2sRlTL9hFTJ1zCxdLD/wE9cwCkes8AcUG0PE4dd9495+bM4lfm5nLLS9E/YF7CEfD3cLyjsHLHRDSxJa0qt9HV6Dm5Qry0Uk0OmKE6nNcC/O3XSh8tPbtJi9u7TREhHypGB4X1hshJ8mhi3jkVG50X5kbfhuKgRwEaSNGse9yeskw63xfiwI8UNbc7TmxZi8YB9Nwf5sPOTpAdR/TymQ0Gf9HVjDYvdaJG3Yty+UjgBDaSRLnnjvdWHFQkeT4vuB3HRREvfXRx79J8/dGuI94kHN0/xvv5NEKKHILrOP0xC3NS3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19Bd8LEvftnJthG+o8hKaEYBpVLnInB6hlRHUhfQQxQ=;
 b=YGG5G6MQbH23WLx8kPZRBXu60dIeFJ+Af6rn1pdWsVVXgDI+Yq/iE+pn15Lv5ohNGA9nQ4f9+xSzxKHFOwSuOk/fUrrtk0tbY+yaETC7lgaPw/DukgA/YIvPqGf/ffNuszmQiU9EU26TPmrWsLw+/8gC3U7Y3Zw5TMWE7YpOCN8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 24 Feb 2026 15:26:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [RFC PATCH] x86/xen: Consider Xen PVH support in CONFIG_XEN_PVHVM
Message-ID: <aZ21DQLRzeyStl-0@macbook.local>
References: <7b17bfbb4b25a59514707f91546ce8c3a24369e0.1771929804.git.teddy.astie@vates.tech>
 <aZ2IB9gBo_DrZLSf@macbook.local>
 <962fa327-2e9f-41e5-8382-71ace6fb0a10@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <962fa327-2e9f-41e5-8382-71ace6fb0a10@vates.tech>
X-ClientProxiedBy: MR1P264CA0006.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB6580:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f689d0-5542-42b0-52bf-08de73b0b081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bm1uOUdweGRJVU16aXZKRWlZdHBWWkFiaDR5cnk5Y1BWUUJFbnQ1MjNTeWZU?=
 =?utf-8?B?WGRnWWQ5NmlWRS9uRVljS1pnWmozbW1BVjZ6cTVpWGtXd1d6ZVhEdlYwT1JN?=
 =?utf-8?B?dVVmQm8wTm54c3hocUNDb3k3bTdwZ3VnWjJFTjBodHA5dVc5b0pDWjBDTEs3?=
 =?utf-8?B?L1NxMjh1bzFRV1lhc2FVYTRUZ2pFMGhORE1JTmVUWmxweE9qNWFSck9MQ3Z6?=
 =?utf-8?B?aTIxMVF1aUE1QnY2NUlEWGdVTUgwWnpMR1NhcDFjblBFblkyaElWYW45L0FX?=
 =?utf-8?B?VnNwUEk3Ni9keGRCYm42VGgydmtaMlFUQ0M2aDI1OTFrVGMwQTR5N1k0Ukdh?=
 =?utf-8?B?bm94RTlMTWcvcmhUVi9OVjNwMldZMU5uWDg2UUJ4Q215WnJsOHRubk5ncWMv?=
 =?utf-8?B?TWJOZ2NFeDRLZjZrSjlpYzB0RmhQS092WEVBZVJNdjhxUWVCZHZIc3E2QkM1?=
 =?utf-8?B?QjZMMGZMZUVsRC9uMitvUlNXSVBoK1dkVFFybzB4ZktmOTlhdWhoSG9tOE1C?=
 =?utf-8?B?QzZuK1AzN2xiY3Rwc2pvWW1tSzEzZWtSb0F0d1Nka0lqTkhRcTdxSEYyRW4v?=
 =?utf-8?B?aFhhRDQrZlF0dU53ekRuU2hmck5KaG1PRWE4ZTR1WXl2V3hzc29ySGNkTEVL?=
 =?utf-8?B?ZFNod2tNMzNGZ0JYSEpSQlB3Z3ZrMHNzVVV5RWNMWDJCZUVFNkt1a1EvWHYv?=
 =?utf-8?B?RjFrVlZvaUs3NWpTK0RqbHlsdU1aaEhPakFMRTllN0pWeVI5dWJpOWR1ZHZl?=
 =?utf-8?B?NncxcUp0N01vS2NrbkUyanJIU0plK084UU0wRjBrUGVyT3RSSHJ3aWxoSlJo?=
 =?utf-8?B?QVE0M1I4SDJJT0k2cTE2dlNYTjRCVkVMTVRPbCtEb2RhM0hDYlZmWkdvUmhW?=
 =?utf-8?B?OXQxK1p6OWpSam0xL2VkMHU0cEtvWjh5cTNkMUZYR0hScTdYWXVuSFdHL2JY?=
 =?utf-8?B?aTB5OFZLbm1SNnpuYlhjQmxWNEEyTEVndlZBOE1YYnB4Rm04T1M4SXlMVXBl?=
 =?utf-8?B?bkVjRDRueHhNU1k0TUloR0c1SkRDVEs1V0RZY09RUVhGOHFhazdRZGZwRE9m?=
 =?utf-8?B?Qk9LMklQanJWR1F4RlVDaHFDVUdoc24rY1I4TGRudjVFekJtL2grV0gxSlpR?=
 =?utf-8?B?eWhwenJmUFNPT2txeHhPMHk0eWpSMzZvU1BXcFErTmtuM1JTOHdZazAvTGN3?=
 =?utf-8?B?QTd0bDZFQnFTN1dERzZoRndxaTU5QTRhM3pvcTFUd3EyOU81TXEvaXdaTHpp?=
 =?utf-8?B?NXFkRlBta0lvdmFvNnlVM0tQOTBFMzB6cFVKRktDQUNIOFlKRHpTZkplUlBN?=
 =?utf-8?B?Y21Yd1psRmkveWhkMnRkcTZkU2F0U3NaejZLRW84dFBQTnZTVU0vTUFJb3ls?=
 =?utf-8?B?UzVWTHNHaW5vb2VWRVAwMzdvQmdFSnBiTjF0dzI4WkoyM1lGcUR6WGJRc0My?=
 =?utf-8?B?N2ZaR0xHZlBmRHNNKzVpTmJ3Y1FvN2I2akZsSTBINzdCVUFZSW5LbW1EVno3?=
 =?utf-8?B?WXl6U0Fqc1l2cFBhRlQ0L2Z6WFFKQk9YWTFVUWx5ajBsM1o4OE9vSkdsbXBW?=
 =?utf-8?B?QlV6RmxYb2wrZERqNDdheWF3bkRRNmZjYm1LTXZvNTFQaW1Rak1zMUgvZGoz?=
 =?utf-8?B?VWEzSElNYjlIV3B1QnN4VVQwUjllOWJUZ204dlpBaVRLOHM0NFRSdjV3QXRY?=
 =?utf-8?B?OVJ0ZTJnVDJMcjRBT2JyTHY0WlFJQVB1QjM4dDllYkdLaDJiQ0RHdDY4NzBs?=
 =?utf-8?B?K0NEdElGUk5VV0h3c0cySlAycm5HdFRkR2E0end5c1FtdkEzbFFTVnFSNnoz?=
 =?utf-8?B?Q1RLZDE1N3V5SFN6TXBEd1FlQTV3aE1nM28zYzQxUUdPSnJidmJDTDNuSWp0?=
 =?utf-8?B?QVliZkZLeGVrUjFneHBnU2ZZdlZaWDJJNm5CZHRNNmJiMWc5NGpSZDR0aXZw?=
 =?utf-8?B?ZFZqalphNWN1ZENHVkxyTjJtT3p5TmNCa3BQcGxZd3pxU1dtR01SZXpHMC9y?=
 =?utf-8?B?TFg5dEdua0R5TzBjOVRqYmxCMUpaRk1nZDN4L1VSazJ4Z1F0RnFSeU1kaUV5?=
 =?utf-8?B?Y2RTZWM1U0QzS0FnWGQzZ3U3aVRheWhVbXdpdkhjcmhQRTllYSs3VW1BQXhm?=
 =?utf-8?Q?C438=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkZJT3JyTElTdEl3OEZlNVpRZzlzY09LTTBadUFKOThzSzRpRjhSbDZJN203?=
 =?utf-8?B?VzJ0TTE5ek9uS3hBbGpQQjNvamxGbG9NZTROZzVPdjVIZmJMNnNjakxWZTdu?=
 =?utf-8?B?blhQeE5xcG5SbHhXbG1LeXppbnlTc2puMFdVam45KyttZUJFY1JNVTVBbDlS?=
 =?utf-8?B?emlPY2YvWkE0Tzg0b25jdVBlWGhHcDRWNThvTkZtVnBWSmxUM3dleVV5MDhm?=
 =?utf-8?B?NkViTlVRK01wR09NUHdBcldBeGJEY2Qxc3VBZk1pN1ptNTJLNVZwS2NpVjFY?=
 =?utf-8?B?ZUZHWnR0cVd1am1pZlZZV1RSN1p3YkpGckdsMkVqQ0NPR3BmeXhuMGRIRTlt?=
 =?utf-8?B?bVh3YjZCa3VzWHpybjdKNktGUnF1R0p0K3E3L0VrSStNdEpsbERxVkk4cmdx?=
 =?utf-8?B?S2Z4QjFLZHdCSk1qWHMvc2dzQUpZWVlNMllhSjFxMnppUFF3S2lCcmtoRkxD?=
 =?utf-8?B?ZWpydC9ZT3prN2dsMHltajlKWFIrNGNvYi9sVnorVW1BcDBwRU0ydE84WXVO?=
 =?utf-8?B?R0l1Rm41NDFpOVRaTkVldWZ5TDQ5SzhBQW5jS2hFb1JtSW0vK1BlUzlvSnho?=
 =?utf-8?B?MGNoVzduY0YvZ0JhTUdBb3JqdXI3Zk5PaHNBdXJUcjRSTGZpZjF3bDhyYjcy?=
 =?utf-8?B?YWc4U0NlWXpoQXM2STBMemhuQ1VQUUpiS3phOVFRUHBXbWtvaTBQdTJnanJa?=
 =?utf-8?B?N015SCtiM0YveU5vWDVhTFVXeFNqWmVCdVZFTXoxY1ZpVlk5R25uc2VLNWJT?=
 =?utf-8?B?T1BZS0JMZm9wTlVxSkNCNldXRHRoelI0NCtnNWJNM203THdFbFVZTGc2eEVN?=
 =?utf-8?B?VzMvZFlrbGZFTGdSRWhEaEU2UUhRZU1BTzVqVlpQeG5ySzBocFgvYnVDOHp6?=
 =?utf-8?B?WUVSUUd3YlppeHl4Y1l5aE8vMTZ5a0VRNjhTaDFta3hYZTNkc0xUVC8rQnFB?=
 =?utf-8?B?a29ZbGpxQnRNT1JPT1l4dEhuNGNDaWZyeDdqcnF3RUY5UWpiZ244MkF2MVkr?=
 =?utf-8?B?ZUtCZExIUlVqeTdpZUdIN0VxOUVtUWVRSGNucnNYcllWSTVwdTlVaE91YmpK?=
 =?utf-8?B?Z1RsZlVzMVJCbURDQnFxbU16NC9xcjZGTDFZUUlSbGxUdTRMNkJIUG5Zdno4?=
 =?utf-8?B?NTJ3Tjc4QlBQQ2g4dnpVYlA3TkZYWVh6QXljQXZGUHZ4dDNHK0lBczhVQjNo?=
 =?utf-8?B?THpObmtkemcyMlNBZTBoNFo2U1pwRE11c3hpUTlIMU5iUVBrREVBN29NS21F?=
 =?utf-8?B?RTROeGpTVDh5NWc1Q2drMEhaeEU0N3hPdTVDUUtKbm1zc3dXRlM3NWl3d1BT?=
 =?utf-8?B?eFRObm1zNG85NitwbCtibHczeGlPMUNLeklxZ2dETlZIMGZ1d3BKaXg1Lyt0?=
 =?utf-8?B?MlZkOExWREFaZkJkeFI2eUNtTGtiMU9lMGg0eFArVmIxL3pYdmJnYjkrN0xn?=
 =?utf-8?B?Tkp6Tkt1Zk9HamFVbmJvT2lFaGQrRjR2Y1FvSU1tUGhiTWUvblkvZWZUNTJs?=
 =?utf-8?B?VjFrVzJpUzN4cjBPN3oxZ3k1bFl6WjVjVlhZT1dUY29uU2RMY3dxSGNFalgz?=
 =?utf-8?B?MjhGdTI3bVUydWZXaGh2bkVRditZMjJsN2lnT1pVK1hyUW9zVHB5eG4ycHlC?=
 =?utf-8?B?TDErUnZ4aXVyeEdtOUVFSWxxWVg3c0VTV0VlZDlzbkJkQXlsZUErZFlQaExX?=
 =?utf-8?B?NVdnRWxLRmQvSStYRndNcmpkeE4wRGtZakwydnBIQXdETWJQdGhPeHJhTGJy?=
 =?utf-8?B?TVVtc1hSek9ocFlGd0RucFhGYVozWlBrNXczYlpMMnc1S2pVVkRIQzRuam9B?=
 =?utf-8?B?Y3haS0VhTjZZT1A1ZlVjcERGZC82WHdJMWYyNGo3eVV3d1QxTTJkcHU5OEFk?=
 =?utf-8?B?N0tIN1dKT0MwdkNKWmRMa3IrR016VU54a0RONXR3VkVmb3l6K0MyVTAwVVln?=
 =?utf-8?B?cXN6VktSVmNYT21GRGdUa1Y1WFFIUjF5U3RVaDN5RFE3bUlmZzdrRkdjOC9X?=
 =?utf-8?B?MWx4ZnRyQjJFY2V1TVRnV2k4SFVSeU90anFNTSt0eGxSSG1MM0RadUE0bTQw?=
 =?utf-8?B?dk0rUmtLRXZjTWh6c0crY3l0UndLT25HbkZsM2JMOVV0eENOYVlQNDA5M1Qz?=
 =?utf-8?B?MGpVZllBRnpHMThQUkZxVzl0NWd0Zkdlb0xwa2Vwa1J3a245bWhhbGhwZCtW?=
 =?utf-8?B?KzVYVkx2M2tJZGJBaXFLRm8zdU1Rbk5mQVBuK1M3SEFHNzdraDNPODFFa0tM?=
 =?utf-8?B?eEh3QnN5V1dBTC9MdWpRTGxvZ1NQUlV0UUsrNit4Q1FFYUNqSWkyYlkrUEFD?=
 =?utf-8?B?dWo1eVdqRkJPUWd6aGk3MEkzdGJiUCtZK1N1M3liVEs0d044bXRSZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f689d0-5542-42b0-52bf-08de73b0b081
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 14:26:24.8113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EoA8z67s1FnrcHJXQSj82kLwOSB+AmXrncbCKFjITQcZFTYz9OXRVXjLKkzgCf9Tzy9e/h7NSEgWikg4tQOxIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6580
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
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,oracle.com:email,citrix.com:dkim,vates.tech:email,epam.com:email,suse.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AE79418858D
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:34:31PM +0000, Teddy Astie wrote:
> Le 24/02/2026 à 12:16, Roger Pau Monné a écrit :
> > On Tue, Feb 24, 2026 at 10:51:35AM +0000, Teddy Astie wrote:
> >> It's currently possible to build Linux with CONFIG_PVH|CONFIG_XEN_PVHVM
> >> and no CONFIG_XEN_PVH. That leads to inconsistent kernels that fails with
> >> "Missing xen PVH initialization" when booting using PVH boot method or
> >> display various errors and fail to initialize Xen PV drivers when booting
> >> with PVH-GRUB.
> >>
> >>      platform_pci_unplug: Xen Platform PCI: unrecognised magic value
> >>      ...
> >>      # modprobe xen-blkfront
> >>      modprobe: ERROR: could not insert 'xen_blkfront': No such device
> >>      # modprobe xen-netfront
> >>      modprobe: ERROR: could not insert 'xen_netfront': No such device
> >>
> >> When built without CONFIG_XEN_PVH, PVH-specific logic is disabled, hence when
> >> booting with e.g PVH-OVMF, Linux assumes we are a HVM guest, even when we aren't
> >> actually one (in the "with HVM emulated devices" sense).
> >>
> >> As it is actually possible to boot Xen PVH without CONFIG_PVH; and that most
> >> Xen-related logic exist within CONFIG_XEN_PVHVM; consider PVH guests support
> >> within CONFIG_XEN_PVHVM instead of CONFIG_XEN_PVH.
> > 
> > So the current CONFIG_PVH selection done by CONFIG_XEN_PVH is moot?
> > 
> >> Keep CONFIG_XEN_PVH as a shortcut to enable PVH boot, ACPI support and PVHVM.
> >>
> >> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> >> ---
> >> Cc: Juergen Gross <jgross@suse.com>
> >> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> >> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >>
> >> A tentative patch, I'm not sure of the way of dealing with the KConfig part,
> >> keeping CONFIG_XEN_PVH as a shortcut is interesting, but there may be other
> >> options.
> >>
> >> There are widespreadly used Linux distributions that have a similar configuration
> >> to this one, thus exhibit this issue i.e fail to boot.
> > 
> > Do you know the underlying cause of not enabling CONFIG_XEN_PVH?  Is
> > the default set to n on the defconfig?  Or are distros specifically
> > disabling this option on purpose?
> > 
> 
> I'm observing in these distros that
> 
>  > # CONFIG_XEN_PVH is not set
>  > CONFIG_XEN_PVHVM_GUEST=y
>  > CONFIG_XEN_PVHVM=y
> 
> Which makes CONFIG_XEN_PVH defaults to n.

We should possibly send a patch to those distros Kconfig to enable
CONFIG_XEN_PVH?  I think it's a bug on their side that Xen PVH is not
enabled.  Us trying to workaround this in our Linux Kconfig options
seem wrong.

Thanks, Roger.

