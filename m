Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F7E8D3514
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 12:58:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731797.1137510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCH0m-0003e1-SC; Wed, 29 May 2024 10:58:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731797.1137510; Wed, 29 May 2024 10:58:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCH0m-0003bm-PK; Wed, 29 May 2024 10:58:28 +0000
Received: by outflank-mailman (input) for mailman id 731797;
 Wed, 29 May 2024 10:58:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XI+4=NA=epam.com=prvs=2879370e9d=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sCH0l-0003bg-Fh
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 10:58:27 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e9590a8-1daa-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 12:58:24 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TAV1vB008526;
 Wed, 29 May 2024 10:58:13 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ydatgwrg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 May 2024 10:58:12 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AM7PR03MB6546.eurprd03.prod.outlook.com (2603:10a6:20b:1bf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Wed, 29 May
 2024 10:58:08 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7611.013; Wed, 29 May 2024
 10:58:08 +0000
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
X-Inumbo-ID: 5e9590a8-1daa-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkD5/7oeVDZ9rHxeW6bDTYfDrWv+Jum0kzvmRX+ujoyAUj/rgA8HseLH6dwo1hqp6hjhwZIP7o14rNSjRzqja+7cuvE+RrkUrCsYRWPmYK4fD8X2YxYcrCnoWoAt0oIHSeE19DkdklUrs1orIp8dvwyK+E13vjEvWH4X2gUWFdc8ezn8sWfq36Y713Vo8KQM5o9kO7XcNPYOYWL1lQtGuPbrVemCl3cHOkcWC4bzxJoUWjN04GxmrXVyAvv98lbvyoVy0mwZoIu5Z5Plw5zvqr7kJtQ4Cz5kXABQ3WhoM20R9MvIg+ig8B2VBrA4jRTDNXBEQkfLFEJdtoYJc71v0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9ZdFziTF2PFL+iFVJdyZyFKsVyqu0l3iLUiWDYqcVE=;
 b=TrPbaWvigwsta+TbVRokoJbsfY4WEVbjQu+EeYu/Wqbgs1eHzsHgFVa6PoiIFDckwBquxQkcdzvRFk80ZJW1Ku4J0ClGUM6r2tGlcbhmFofirLRnKVylznTDrwjqcpSJCxhi90jdGkCJaIm1Dx58zxDCDtKUJPoKkgyPETqGjL/IAahv9n5o79n1bv02sUvfp7noYwsMku7HALCJHT0mkJNjzXAI+m89YoYpDwFSmABuX4yt9bbdoSbnCa1FXvKSYtF2e0pTiGHnuEOngDrooRfJZVMcONFtMB+o4hkDL8d+iLQod8VXkJGC32ldO5rHR3ryJfzgTWHrfbgQk4T1+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9ZdFziTF2PFL+iFVJdyZyFKsVyqu0l3iLUiWDYqcVE=;
 b=K4dwciVP30nCkdUUFFVFINT27SIx+6MUowaAp3tR1UwS91bef77yTep30Coj9+pwvH4abhdH5deQ/4+IotzPBTZtOA1PxPjY0jZcuoXO07FAI0VvNjWr2NNj3TpTTf5V2to9GSUV5SFN1AMjWDFsDRRYl8niaDmRt4N3bmap4RIWEqft3yqhI9uWtNeJWf9KgzQNDsSp1MI9AHfQV57A9kAM+AWPph2CandYyDX0LnHdbczd3g82IcMs0hU2Mbq95nwccQsO16/dEaulb3Ae5lgoqHkyQMdbZIZkeew6TztO2cG3kFGa3WyibGwjeRxskJWicJiWYwQXih9hyc6XFA==
Message-ID: <8d9fd413-fa35-429d-bc4b-8261671b9c6a@epam.com>
Date: Wed, 29 May 2024 13:58:06 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 12/15] x86/vmx: guard access to cpu_has_vmx_* in
 common code
To: Jan Beulich <jbeulich@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
        Paul Durrant <paul@xen.org>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <c1f40e8e9a35f7e9ba55adc44a9fe93d48749c92.1715761386.git.Sergiy_Kibrik@epam.com>
 <alpine.DEB.2.22.394.2405151748080.2544314@ubuntu-linux-20-04-desktop>
 <4f2c1486-1b58-4c8d-a74e-ad83bf9cc4c7@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <4f2c1486-1b58-4c8d-a74e-ad83bf9cc4c7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0025.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::6) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AM7PR03MB6546:EE_
X-MS-Office365-Filtering-Correlation-Id: 7279ca61-85ce-4636-f2da-08dc7fce398c
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K1JKcmM1cWhMR2lNSyt0OG82VTZTeXRJY2NwVEM2TEpjTUFpMmZpQm8vWWtU?=
 =?utf-8?B?QklERk9KRHdNRWx0cWhGSDRwR3AvaVB6Z2QxYTlsZTBPVzE2WlB1UG1jK3dP?=
 =?utf-8?B?amlJOUh4UHBHWUVOZWJzWjdMTnhwOVNPS0xtTk9BQU1SUVlKNXVLaGpHVFFy?=
 =?utf-8?B?UmduYTBXUXVaakZ3by93eFM5T3hmV3lsZThqZG05Y0RhbGExTlFGMUZuc2NQ?=
 =?utf-8?B?U0l0QXY0eE1RMW9vL1JCdWZKTjRiajNYZ0N4UytZR29wQXhFR3oreElGayt1?=
 =?utf-8?B?VXZram14R2dQc2NCakJFaUpnNWpYMXNOd3dEUVBtQ1ZUVHZDeUVneWZsemxI?=
 =?utf-8?B?Mk9qOGNKMVZRb3ZNUzBEZ2Z2YzZPRFFDQVF0Vk1yNTdCT3I1d1ZyeExIL0du?=
 =?utf-8?B?OUNDeHlCcC9XaTBoQ1dIdGpXUzJOWEk4SW9PYWcwdUlNTEtOVm5naEF3ajk1?=
 =?utf-8?B?dVBmUklkRzd3TlV1Q0RwMTg3ek04RGN5VzdmNlpPRjc0U2pEK1FabE50WjVa?=
 =?utf-8?B?ZHlFNURqZEtWQzIxOU9kV3I0eWpLVElMbkJSbEUvczRqY3RyTERWbWZNQUFx?=
 =?utf-8?B?U1BWRWY0ZWNndUt3ckw0cWQyOTFKZ1BLUzRUS2R1QkpqYnozOXhaWFU1NzJS?=
 =?utf-8?B?RkRzNWxLZ2tPbjhWa09mVGZYamhmT1UvK2JnRjl2Q1lzMkVCZmh6R2pjamVU?=
 =?utf-8?B?bTJqaWNodmVXTGJnMmlJMHZGZm9RZlFOcGFmanJBdFA5RXpSaml6THF4cGM3?=
 =?utf-8?B?R1ZFWmNYWHJUWjNMbEl1a0xZQjN2dXpheDVUY0NBdW9hZlpsbTlsUjk0OWpx?=
 =?utf-8?B?L2lNUCtTdW1VdVRQTkd4WE00MHBhVURtL0xaTzJWMHRDSTl6SW1FQ0lQWFVr?=
 =?utf-8?B?WFJQK05CZ0NkYlJyWDRCaFNSODNjRXZxNlNwL1E0cjdrcldnUU8yWUhPa29k?=
 =?utf-8?B?TTJoRmI1bFdYeDhzOStlRU96VU15eVlhL2hQQXpQeloyMkl5ZXdMTElDMksr?=
 =?utf-8?B?TTVXMVk3dWNSMlJVK0FBNzVpb2hBc2J3Z21iaThRb3lSZy9lbWIyeVI4YTZv?=
 =?utf-8?B?NzVxZnNTQ01vblZKc0FTTkQ1UHNFaXdrbHlFSUNCeDNaUVYrejhRalpHdS9z?=
 =?utf-8?B?eGw4L1BlQnpBbW10WlNOV0FNczFTcXd3bGRhK1dTSWIxNzB2NVp5am1OSElO?=
 =?utf-8?B?K0dOOU1DR0ZNYXlPaTBYTHRhb3UxanZGZzB1cHI5a2xRV01PVS9peUc1RDVM?=
 =?utf-8?B?Y1BOSW9UK1NRWW0rdUVLT0FiTUNrWHlmVzUrejV5K1lwNGgwaG90K2pySHV5?=
 =?utf-8?B?dTBUcGhEYlJRZlpGNmFwWTN0RktycXBYMTlzMjg5M05pT0FQUnp4c014Z2t2?=
 =?utf-8?B?UEZOTjRXOUZRMnFLbkRYQ0ZRaFpXSlN6bzE2MnNQUGpaNTBxREpJYjlZSzI4?=
 =?utf-8?B?QjgwdjdiT0V1Y1laV3dDZGgraWFhUWdtc3Bvem54QjZnOWJyV29leFlqMTlV?=
 =?utf-8?B?NWpqWU9QYlNxaFhjY203T0paTXlNZndkS0xRbnJwWWI3d0FMbXlsb1dxUXZV?=
 =?utf-8?B?ay9kRjd3Mk4wR3ViSlpEdjdjSDhCQmEvYWkxZEJoUXYxc05HNSs4bVFtQnph?=
 =?utf-8?B?a2szcVY5WGtYaXh0M085ODY0MU13RzZUYzdFM0xNU1JXbytQeDlQMUgyV2M3?=
 =?utf-8?B?RUNHVUI2cXcycUVoMW4vM0RacWdVakhUQU14TXovdkpQQUd1N201clBBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QnVmUXIyMUZDRUhYdG80b3pUSHlFc3NQc1c3aUFwVzJpMElKMHRnajl1Nzdp?=
 =?utf-8?B?K0p3ODRvb3NINExiSmkvdHFPSXpOdFM3eUVvOEJ5UFhoNWhYWHB1U21pWVVl?=
 =?utf-8?B?cGdwbHcwUHpTOUZ1ejRKb0sxckdiOW10dTY2aTVyWmpLTDI3U3lxMnhkNHNC?=
 =?utf-8?B?TnY2cnFHdnNMS29CNDZpMk1OZ2lvSDI4eVpaZ0lhbHljUDFQa3FNK1lrWS9Z?=
 =?utf-8?B?SVp1NElBdWhkVjV5SXl2eW1DcTU4OURSUG02dDdidGc1eWNUMHdJWlhTN0Ru?=
 =?utf-8?B?L3RicVV5dEVtdkd0eE0zQXFiN0JRanJrNVhuZlo4QTQvd0hQTnMybzh1dXB0?=
 =?utf-8?B?TTJpdmxmbjlpYXF1d3dOOGYxZWw2KzE1cG9CTmZhQ1ZoeTVZNGtsalVwUGs0?=
 =?utf-8?B?SkxEVXF2bXE2UldqS2x2bUIxTFhvblU1K0VWYldLWmE5V0JXTEpnU3REeWM3?=
 =?utf-8?B?SmZwWVpVQ056NGlOUVV4MHpBZjVHRFRFSC9PQnJkM2U5SUxYa0E5Y0d1MWVy?=
 =?utf-8?B?V1VmRFhrY0NOUks0VURka2wzMHZSTzY0QmFZMzJUY3dpa1FXdWdBVXJnMTBU?=
 =?utf-8?B?WnNPa2wrZENxS1k5cTlUQk8zd0RwZmE0dU9FSk1aeEp6MXlNS2UwZXNCa3d6?=
 =?utf-8?B?bjFhRWxmSEdvSll1VFFUSWFmcG9Qc2ZCRy9qUTllaWtDVyt1KzNhKzlFb0l4?=
 =?utf-8?B?d2JHc0NyK1JOYTNxVzIzMm9HRDBTS1lQRFZtVjBnVGZhWGE4YWVxcHNZRTV0?=
 =?utf-8?B?MU0wR2loZmVmUGt1YWhWT0pHVXphK1FGWE5yYWR2V0FrdFhtY1lCTWpiUXRj?=
 =?utf-8?B?TU9Sd2JObHk4MkZBbzM1UVR0UlpKalhaVkp3ZkkvNjF4bE9sWTZSRE9vNHRF?=
 =?utf-8?B?dW5IalBETExKWklTRXFReXh5TlVweXVCNkE4TFYrYnIxZ1lCOXNQY0kwRkhj?=
 =?utf-8?B?d2RqR1l3Q0x0T1BWdnhGSkpPZGNXaGxQTUVTYmJNMkFCMDhDbjU5cWlUSy9p?=
 =?utf-8?B?cXlLOVMrdEVQOHFzZTBDY09ia1dmbkcram1PVWpUdW8yV2dXTmRKMjBuaFl6?=
 =?utf-8?B?dENvZTBlVkNJR1dRM3ZxR0haZ1daSGp1Z2ZTQ0wrWmh4enZIVWpTc0Fab0tw?=
 =?utf-8?B?Wmd5R3gwRUFEajQ1M0JoVis1bkJuSkhqeDVReFhOQWtnNGdTamtsU3dGN2ph?=
 =?utf-8?B?M0NaZW5SK1Q4VVhIVElTT1FXWVdDSlJNRVB5VUpET2VXLzB3NWFCSEFBY0VW?=
 =?utf-8?B?eWh2Z0pqbzFyTHBJNWFld3BJc2FiZ3lOdVpTY2cyczVYL2dwVHBwNjRjUHRp?=
 =?utf-8?B?Z2RNajU0V1RISkN3Z01TNkN0RExrMm9JUHNSeGRxemRIUm9jWWFpNlVkcVhx?=
 =?utf-8?B?MkpVekhVTFhRZmk1anBtbDZxcXVmTzIxY3lPZjI4QWZIbFk5d3VoTDJSb1lv?=
 =?utf-8?B?YWF5THovbFlxVG1LcnkySndkVkRzRHJvOTVKQ3BVQlJUMUlUNHNieVJQeE9a?=
 =?utf-8?B?c2NLRUcxa211Rzd5QTkyWWVMSEptb09HU0ZSVVhEYkhSN0gyTnFYUDJUeUFj?=
 =?utf-8?B?RXlvWngxcVlzbGVLcVlTWGVDYXBJY1FIMmozZlBiMmFKREpUNzBFK2hnOFlw?=
 =?utf-8?B?Z3VjVVBVR2ZMVVVvTnJ0K2FNZzBqVWphS2swdW14OTdWVGxnQ0ljRnV6Q3Ir?=
 =?utf-8?B?YnBrcHFXN1ZOMGZBRVBuZGVSbTd0OVRmU2VZd2RxRWNoY3E5MVpaUkU4bFJB?=
 =?utf-8?B?TjViNkZwSWpwcWpPcURzOTBFK05RVzlEYkVTMTI3eWRyaVZkeklkT3JITHVO?=
 =?utf-8?B?aS82a2xOMGpIK0RuV0dOdjlUU2hEcWpMQVgyOEFVU05wUVpVa2FoSnVIdkJw?=
 =?utf-8?B?eThMTGRsRHM5SVczaDZlTFk5anJ2U1d4cHZuT05VczgydVFqV2RtR1FEMGd6?=
 =?utf-8?B?eUVtcXFuMmRPMWZ3UGlFb0VLcEJsUkl1TDJZUDFjSEk3T2toMkVFSHdteWd2?=
 =?utf-8?B?Q251VVE1Y1ZDNjdTS1FFWCttQlkzempCV1UwRUxqeUU4dis0OERzUTNQeThP?=
 =?utf-8?B?ZmxBYk5EYlpaNnA1Z0NscE1Pbm1QZUxlQ1RJeXRybWdDcnFaanNUcUhSNHFQ?=
 =?utf-8?B?ZVFrUlRzNCt0eExZaDBES0dPZEFiUGpub2wyem54MTRhc0JyTGhJTzZWY08z?=
 =?utf-8?B?Wmc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7279ca61-85ce-4636-f2da-08dc7fce398c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 10:58:08.6432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 628Rkm0rCXSfQhhP0PzdTrPy+2SPNnsAHtI8S/ov2vzYTE+zZ77eEAVUGI3DdyAdOhmJ+JxX3NIM/Txw33ysGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6546
X-Proofpoint-ORIG-GUID: HNoUSf3S63o46jq3_dqkQ71qifvvP9G5
X-Proofpoint-GUID: HNoUSf3S63o46jq3_dqkQ71qifvvP9G5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_07,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 clxscore=1011 mlxscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405290073

16.05.24 10:32, Jan Beulich:
> On 16.05.2024 02:50, Stefano Stabellini wrote:
>> On Wed, 15 May 2024, Sergiy Kibrik wrote:
>>> There're several places in common code, outside of arch/x86/hvm/vmx,
>>> where cpu_has_vmx_* get accessed without checking if VMX present first.
>>> We may want to guard these macros, as they read global variables defined
>>> inside vmx-specific files -- so VMX can be made optional later on.
>>>
>>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>> CC: Andrew Cooper <andrew.cooper3@citrix.com>
>>> CC: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Here I've tried a different approach from prev.patches [1,2] -- instead of
>>> modifying whole set of cpu_has_{svm/vmx}_* macros, we can:
>>>   1) do not touch SVM part at all, because just as Andrew pointed out they're
>>> used inside arch/x86/hvm/svm only.
>>>   2) track several places in common code where cpu_has_vmx_* features are
>>> checked out and guard them using cpu_has_vmx condition
>>>   3) two of cpu_has_vmx_* macros being used in common code are checked in a bit
>>> more tricky way, so instead of making complex conditionals even more complicated,
>>> we can instead integrate cpu_has_vmx condition inside these two macros.
>>>
>>> This patch aims to replace [1,2] from v1 series by doing steps above.
>>>
[..]
>>
>> I am missing some of the previous discussions but why can't we just fix
>> all of the cpu_has_vmx_* #defines in vmcs.h to also check for
>> cpu_has_vmx?
>>
>> That seems easier and simpler than to add add-hoc checks at the invocations?
> 
> I'd like to take the question on step further: Following 0b5f149338e3
> ("x86/HVM: hide SVM/VMX when their enabling is prohibited by firmware"),
> is this change needed at all? IOW is there a path left where cpu_has_vmx
> may be false, by any cpu_has_vmx_* may still yield true?
> 

This change is about exec control variables (vmx_secondary_exec_control, 
vmx_pin_based_exec_control etc) not been built, because they're in vmx 
code, but accessed in common code. The description is probably unclear 
about that.
Also build issues related to VMX can be solved differently, without 
touching cpu_has_vmx_* macros and related logic at all.
I can move exec control variables from vmcs.c to common hvm.c, this 
would be simpler change and directly related to problem that I'm having.

   -Sergiy

