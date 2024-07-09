Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEA892B293
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 10:49:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755969.1164515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR6XF-0005nl-7w; Tue, 09 Jul 2024 08:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755969.1164515; Tue, 09 Jul 2024 08:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR6XF-0005mH-5C; Tue, 09 Jul 2024 08:49:17 +0000
Received: by outflank-mailman (input) for mailman id 755969;
 Tue, 09 Jul 2024 08:49:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C54Y=OJ=epam.com=prvs=392098eeac=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sR6XD-0005mB-I3
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 08:49:15 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cdef5ed-3dd0-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 10:49:13 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46957K2L016013;
 Tue, 9 Jul 2024 08:49:02 GMT
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazlp17013014.outbound.protection.outlook.com [40.93.64.14])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 408fufu4xa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jul 2024 08:49:01 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AM9PR03MB7171.eurprd03.prod.outlook.com (2603:10a6:20b:263::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 08:48:58 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 08:48:58 +0000
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
X-Inumbo-ID: 1cdef5ed-3dd0-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YT4NeGaL5b5PhdE7+8pvco7LD8tqAxnRNWjeprRIRRG7a7VkqM9ABDPbdajOhOs4qEZ0LsvCecwrBu1hkVvRq3JBRK7HO2SIjVJaf7SHug8ktz5orE4ioAUilbn30ew8w9JXn1gMGjCaBRqtpmcuAe9l3I5Zhn6GP7NQto+sPMJayC8ThpVj6LMeTqyOx1bv+e9MWsW1uKJz8+0UdDgsNxaqaj83p+zYrcDrk/bd8ob/SXEe27rhNgZEhvDbc6Gvb2ou7bcNWnrWBa2erY/f3+6994oVDaT57vt2W6Jj8EaMTquSe9h2dz3o8zhXcpZZqbVmk5kZL1e+iA8wGWSVyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYFsTmprzQJOjUQ4ANJuZIhxXIQW9AFF7Y00DBCxNqw=;
 b=lj44rQGTzJwdpPKJIX3jomhqv6YgV6TT9jysba9F/LY6U5+orKPZNjX34f3FuyXiuJ5yOR27RnqAfKarTBAoZWd/iPoCGE4/VBOPvfEcw62LPW2nIIw4mLM0mtSQnK+sbns/ST7IRkJsrdc/YMZf/z0Ckmn0cleZTegDpMBEcgcogkn0qV7x3uzgh+xx5gCf1B3CCkgxvjffwazmpaQtF7L29VgzTyuDxSwFhdL59fdEWUNE9KUntZ4J68f33NE2IIYuDbEcoG18tgg3dagxVRgDfxHv96uU9rf7DVpaauU8MUI0Jo51yVOliUKFfLveRISREZHXelB0b6kmbLCTXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYFsTmprzQJOjUQ4ANJuZIhxXIQW9AFF7Y00DBCxNqw=;
 b=dYqHO6fVIyVx7843sfZDhqAFEKi6BBcOwwHvdIOIzPQnY04h+6UsLaFFH46yVEz8DtKfHOyMJemtHa8sgWHzf1EmMZzK/vSb8fGWnNvKYWwuQqZgfD5ejXN7sRxTAoj/iR1tngZmCRAhkjWKJcrdl5k0Bbct8/kNkm3myrMmRtt8toEhBCua0tfHNv46+T7ReTJYpOSzcWQcSCTyCZmaRR9B7RYLoN/Fw1noil0jSt2+Vc/lyRFR5l7F0xAVKXB0E68KR1XeMd0RiWqsELHYZNsXhta2tNnl0pTLaeyjljNcgpstjnAr2jTwf/s/dIn5cdSqDCqfiKVONswhnhWoaQ==
Message-ID: <17b9e68f-3464-46b7-893d-ca6c5ee26014@epam.com>
Date: Tue, 9 Jul 2024 11:48:56 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] x86/intel: optional build of TSX support
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        xen-devel@lists.xenproject.org,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240701082506.190941-1-Sergiy_Kibrik@epam.com>
 <08a33c85-419c-45c9-a54e-1198304fc6a1@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <08a33c85-419c-45c9-a54e-1198304fc6a1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0028.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::23) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AM9PR03MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a7ca157-1486-42fb-6b97-08dc9ff3f911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SHloNG5NYVpQT0c2ZWh3MWdkVkNCdWFkVGYzZzhXbmZ5WjhhZXArV1ZjZENu?=
 =?utf-8?B?c2F5OE5EcUc2cDQ2dnJ1S0pMbFJ4OHZJaldDaDZyUEF0MzNza2lWYnM2bmtY?=
 =?utf-8?B?Z0F1dWFRVFNjcXNoNVVhcUtOWGYrb21Vb09EckgyNi90QTA3V3Y4OC9hYTRw?=
 =?utf-8?B?SE92RGNBWk8rS1ZhTXAxbjRZS1phUElFZTR2aVdoZURjemY4c0hqdnhueVFJ?=
 =?utf-8?B?REx5ckVDY0pZUHNLNUp2bTVqU0ZZOFUzbUg1ZCsrcGhVcmJ3OGxzNzhDK0lZ?=
 =?utf-8?B?R1QyWUFsUjJwQ1F2ZnVhR3dIVWlBMkorYkZwRHNUdkFnMGNET3lPOXRlSktv?=
 =?utf-8?B?cStzMWxqNG9rQW9kdGtUbzdRSXlXZ1IwNVViRU9aSjFVY25XOWRPamw2L3hG?=
 =?utf-8?B?Uk1jWEpIMnNzMmZVams1Mzd1NzRTbDlIOWJYMGZyK25IQ1RtOFNWdktZbXd4?=
 =?utf-8?B?d2plN3ozek0rMmZhVitWanIzY05iVTdrMnBWUnRCZVgra0o5dnZZdFV2Z2ha?=
 =?utf-8?B?TGV5WTRrays2dGp4azB5YzJSdWxSbGx2YmVMQnZjRGw1Vmdhdjk3QWFySS9z?=
 =?utf-8?B?UlFjSkRKR1hVZUdiakJNMDR3N2ptWGU5QXIrOTNpT1VBMjRaN2Z2SVdlZjAw?=
 =?utf-8?B?bGdueXIyaU9OeCsvbjgxZWZiM0hjOGlmTTkvL1llajM1SDJKL1JIbUcwT1Nw?=
 =?utf-8?B?WlRlbTBod0FaWUkyVVZ4YW5HTFQ4eHd2Wml2b1ZPQWw2UksyS0gvKzZlT05n?=
 =?utf-8?B?UmVpYW1EK3BtMy9oQWh6SytWcmRITlI5NHN1NzVQUkZTM3ppd3hoZ3A1anVq?=
 =?utf-8?B?a2wyRnM2TzNlRHNjS2VtZXV3NjFQYnpGV2FVcGo4UVJLeTBnQkR1eDdFNlRI?=
 =?utf-8?B?NkxvTUUrblRrclVBN1ZTU1NlbjN3cUMxaU50WTdCQW9PdU5DdTEwVjQ2MVRF?=
 =?utf-8?B?TVBvSzlwS1dlM1F6dGxaNFN5V3VIY0xzWkFjcjB5R2x4RXBVR09HYzZSUHRF?=
 =?utf-8?B?Q1UzS0xWbDhGRHBsSGlMVnJtNGswdEY1RG54UXFEVFk3dUk3NWNQbXpWZzh5?=
 =?utf-8?B?c01tdzFVYm1TakN4U09MdDBIZnFWUU83d3Q0Ri9NRGl5VFJVVGszeC8xRDB3?=
 =?utf-8?B?MEgyMC9uaEEvYXFhTFcwNWNNbzdNL3pwYlpkWmJRNkU3U1dUOFZZUXNjQ0ZD?=
 =?utf-8?B?V1hsOGRoUi9KckdFQlFwNGFNNGc0dE8rLytCaVVlNm8vTURIZ1l6ZDEyOWd3?=
 =?utf-8?B?MnZpUHQ4QWNadWpFRm52VVdFb1NjZExVaXpwK2ZBa2Q1SENKcUdZcm1pdFor?=
 =?utf-8?B?eEJvS1NEaE9CUzRCZlg5eVJuODZ0TTJkOFdtcTVOS3BaamF0TWlkdHdjSGNF?=
 =?utf-8?B?bHBNOGNKbU5oTzZQK215Yk9abGFTRDVscHBGMm1naERndTFMTm9icUtzRkFZ?=
 =?utf-8?B?d251OVFBUDZmS0JWWk1GNkpQb2FrT25EeEUrZVpPTmZXYXAweEdmVlhLTGd5?=
 =?utf-8?B?L0xFa0dZRHFwMkV4S2hoS3dscGpmMW1BNkFxbkM3VGxmMU1ORXp6SzhlRFZ0?=
 =?utf-8?B?MkpmWVVSTGJiMHlIZEt6ZVJMeWJtZUcrald6SWlTWE11UEkrWVNWUnhkS0V4?=
 =?utf-8?B?aS84eU85b1JoMHZ2V2pKenBLcHhKMTBxUUI1LzJjbnhERDJOQm9NYXNWMjNu?=
 =?utf-8?B?ZnpsNWsvRWFsQ2dDeHRPTHBUR1o3ZDNCeElYRFZGN0ZzY2hTd3hDY0dPMVVV?=
 =?utf-8?B?c1NWUUFyOUJpTklkY29EcjQ4Um0yNXh6L2Z4VlRFY1RWdlB0L2lMZXFUL3lX?=
 =?utf-8?B?WXlOQmNFNk1RdVovdVFOdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MzE1K3NLZnludGNBa3FRVjJ0YTkzemlBaEhpQnBWbDhOdzhBR0lOY0p5dVRF?=
 =?utf-8?B?R2UvMW1OSDloT0ZEamVVS3E5LzlzcFkySllqN2pnaFE5dEdySjU5RzdPdXQ0?=
 =?utf-8?B?M3BraEljWEF1UWJkR0IrWFQrVGtSbUkxNzJiU2ZXRGN5RkhSYUgycXZTR0R2?=
 =?utf-8?B?WlRhblBrQVdaWHNJWkZHanBoTFQzVWM3R0Y4MU55Uk5vVGplSTlMNXg5ek1i?=
 =?utf-8?B?SGg1WkI2cFZ4YnYxMlIyaGV2ZTZDbW1DdndBRjFZU05vUTlUd0ZGVkNpRkpK?=
 =?utf-8?B?Vm9mV2pJQ2c5d1pQaUxwejNtV2lBNkZ6SUZsODE2bFdEdm5wcldIOXVPUHhy?=
 =?utf-8?B?YTJyR25NY2VtQVdpSGRxTHNKb1p6eWNRUzQ5OVR1Unl6a2R3TkN6d1RyK1h3?=
 =?utf-8?B?KzlKbUV6U1FXdzdoeExsOEY2Nlc0SjZPSlZvWFlBOE5NRXNZdGxGaS94ZnRM?=
 =?utf-8?B?MDhZa2FpdU85RDNDVTMrVWtWUkFuZU0vaDJDdStseDBRdXB4aVRsU1RVc2pW?=
 =?utf-8?B?R3prdW5UbWxabzRraUlpTWdrdVM3RWZ2Qk5DOC83VXZJUENET2VGMXo5S1k4?=
 =?utf-8?B?YWVKNk9NU3JEeUwyTVBNYjh5ZWxtZm16L3JzMmM3MXVhQ0xlRjVidWpaL2J2?=
 =?utf-8?B?Njdkd0J0MlRQZDZnQ1FpbzIwRVhSMEVVZ3lHVnRDRzdjUmZiNVlTS2p2SjZI?=
 =?utf-8?B?Z2VTQVMzaWIwV0puN1IrUlpjVUc5TnJZUis4bUdJbmxKUWpHOHo4MFIrSUwx?=
 =?utf-8?B?WWJ6c0hLc0NKUFZiTUtWRDF6d3luZFNzU1M2WTFoQU16TCtycVFMc2pWYUVo?=
 =?utf-8?B?ZmJuTVM2OUNZV0VvTTEycGF5T0gxcVcyUktOM1NVTTRadmYwYkRRMitXVXpm?=
 =?utf-8?B?ejRBYmdLRFlpSWsvSGlEN25Nck5tYTlzOWNiWVhNL1MwYWJkNGJ5bG9jdlBn?=
 =?utf-8?B?bXdrZXlTUklhbUVWazk4cUdUU3I5aFhHZ01FeExqUWtCbnNYSzFqa3JKNTla?=
 =?utf-8?B?YmJaRTgvRVMzM1Fyc1ZyRG0wM2Qydk9MNlpPdzN2ZzBtei8vYVJYcWY2bjVk?=
 =?utf-8?B?K0paZ3NkOFAwTVdUMzlEZkxKa3R5WnRPMzRRbG1TODRBUzNyYW9WQm1QRy8w?=
 =?utf-8?B?VjNoeEVYcHoxR3YxT0Y2UnVSKy9nZEpUdDIzRURvNldBd0twMEErdDZYekxU?=
 =?utf-8?B?dCtXb1V0SDBremxKRFIwcjczRGt6aWNEMVhOZmZRcEZVRTdCdGJmUDUxVlNt?=
 =?utf-8?B?V3pYeDRla0lKYXk4Z2RQK3JrZUhGa3g3Z1VKN2NtdmlZUkFnd2s2NGRyckdw?=
 =?utf-8?B?UUxwVHpVdlNROVhGQkM2RHE1cjQrTHptb2RjRExVN3pya0ZXeHlGalhqSmVY?=
 =?utf-8?B?V3VWVk9OandnVG1CekJ2NjJmUE5CTVpmR29NZE8xRVY3OEpHdUtHMitYYit1?=
 =?utf-8?B?aVhOdWFuWEltazMra0NpREVINTlFUFJ2S05sd0lhTlFxdnBFZlN4blMwU3NV?=
 =?utf-8?B?ZG5jd3dtR2oycHM5NCtQcmtmWW9sMDlhc0JlZUQ2anJzcktwMWtUMmxCbG5u?=
 =?utf-8?B?M3Y3bmNteDdkelQ0RHZZNE1uWmFSb2wyeldwQzNMcEtnZUFma2Z4RGVsTWdH?=
 =?utf-8?B?N295QXdKMzlZdlUrWlprU0VCMHFNeXVBaXBRVVFNNGRHcEtQNktwMlUyZmJ6?=
 =?utf-8?B?Z3YzTjBvYXlsRUdhbEZ2UjRnZjVJSkxpVTVKbEtKVDczd3R5VHA4VEJ6RmJr?=
 =?utf-8?B?T0pTVEk1RDRWM2FsYVFsclF2Mld1TlZ2SG9ZaG9oQWNJTlRnVlBUNXlTc013?=
 =?utf-8?B?NHhUbDArVkFiM1NXeXdBM1RhMXVZdUlMenBhZzM3VW1wNzN5R25hbk1rNmxV?=
 =?utf-8?B?cUhNblNkZlE1SnpvYU5zTWczMTBCZDhHM3F4ZkYxZWRDQ0NDU1FXTWI0Z3JC?=
 =?utf-8?B?dFJTbFBwWTlaYVJSK09nKzlLcjBISS9TcFhlSDE0aWJ1d1ZMMzBMcHYyYmNx?=
 =?utf-8?B?Q0preU0rejliT05VTHloMFBhT2VmRklxN084cnB1U0NDUVlRM3lKSnUxNjhS?=
 =?utf-8?B?d3d0QWtaQW9DamYvOUo5cm5DTytHQnYvYW43TDc1aTAwaWhHZUxaV1NUUHI4?=
 =?utf-8?Q?PBslYeGEpFExtp5l3MTjrdWw0?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a7ca157-1486-42fb-6b97-08dc9ff3f911
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 08:48:58.5958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkMTX5b+oCFQgg/ZeALBvFh1oI/orGqq87oRGACQS3jlcZzepS33aCXdT7aDzciCBd572xuLmkcx4PDrKP/p2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7171
X-Proofpoint-GUID: reSMpEsLwL_nTutmTQ8im3pY3E2Xycrg
X-Proofpoint-ORIG-GUID: reSMpEsLwL_nTutmTQ8im3pY3E2Xycrg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_15,2024-07-08_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 clxscore=1011 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090058

03.07.24 17:58, Jan Beulich:
> On 01.07.2024 10:25, Sergiy Kibrik wrote:
>> Transactional Synchronization Extensions are supported on certain Intel's
>> CPUs only, hence can be put under CONFIG_INTEL build option.
>>
>> The whole TSX support, even if supported by CPU, may need to be disabled via
>> options, by microcode or through spec-ctrl, depending on a set of specific
>> conditions. To make sure nothing gets accidentally runtime-broken all
>> modifications of global TSX configuration variables is secured by #ifdef's,
>> while variables themselves redefined to 0, so that ones can't mistakenly be
>> written to.
>>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Btw - any reason you didn't Cc Roger?
> 

oops, forgot to run add_maintainers.pl..
cc Roger

   -Sergiy

