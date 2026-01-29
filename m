Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLatDIV/e2kQFAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 16:40:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CEDB195F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 16:40:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216754.1526689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlU8J-0003aM-Jn; Thu, 29 Jan 2026 15:40:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216754.1526689; Thu, 29 Jan 2026 15:40:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlU8J-0003Ya-Gp; Thu, 29 Jan 2026 15:40:35 +0000
Received: by outflank-mailman (input) for mailman id 1216754;
 Thu, 29 Jan 2026 15:40:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XEJ3=AC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vlU8I-0003Xy-BJ
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 15:40:34 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6510eef-fd28-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 16:40:29 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM6PR03MB5113.namprd03.prod.outlook.com (2603:10b6:5:1f0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 15:40:26 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 15:40:26 +0000
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
X-Inumbo-ID: d6510eef-fd28-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rRDQiOQofRzgWsRb6++YbTm+raasV/Puw5g6wUqlQTk1Gy2/uF6b89IoPHL0MfCbp5GVSJEfagb2VoT2pwHXYY5tJQzkn17gC3uY+cxifaG7teNX/as5E4IoOZ978mAj+WFSn61ber8EAfpFSuHa2y/C0vU5/pChOg6uqP38oRJVlCVznQ1i0+H4jIdNtgTHzhF3BsMp3ihihBOGW3hnml/ytUatgVN76i47uIQHKM9CyTT+5tru44C+QQWbsgQ17yrTIWzuSkbINvWELCyDnBQfWrgwLyxJSNxiiyJKbOAxgOq0OFcCwB3bY2tSDAo8knXniSBXRjxGHF9ql8Bzew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dwL8rrY/y++f5OGvSXoGfG00JAjbmmn1Q+mF9wl2pA=;
 b=XFrRzp86MQDoe02ZIec0XqGkY6xJwGN/fQK41WzqiVJia6z765S2lyROjpgQyVTDYxezIlOAxkXf6dGNT48r7kOJMYu0JwaXc/mf/mzXrm9HJEAtoOIhvhLMB7yNx3QN6cNuyAYeJ8w+sXaTGX5qGU0f3Wa1TW5qNATwBT7qFp8t+8W3rQWcej2DdJuszIwOdTz04OEzuLHu8cq8iKFu3iff0wdghIn2pBAQ0M2HxGwUd13nuof3rse55Rv85qXI+SLALEfsGk64yEe0hzQ+K2LI/IPohi8IBDsaYPN/9+nU9nDkQuSySJHbOwbI7tj6W+zx9zOfh7DFId578R4j+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dwL8rrY/y++f5OGvSXoGfG00JAjbmmn1Q+mF9wl2pA=;
 b=eTzmyjywoWKTZLR0IVTblbnyMTn9vzYIlBZKZtKbyyNVABnUonB15r7/6op5OZkLw2HSDKJAAnggs9JoVpYIjWy8HBe0f23rQb8mWnXK+7lWwHJfFDZDiwjJmNvphzjMKEsTvayGVb5HCbn2aF8Ny0thwgZHRX0HzzmsfJxhP8w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 29 Jan 2026 16:40:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v3 6/6] vPCI: re-init extended-capability lists when
 MMCFG availability changed
Message-ID: <aXt_Z4INxG6fgsjx@Mac.lan>
References: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
 <d6f1c261-5af7-4fcd-b95f-af8baa67ba64@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d6f1c261-5af7-4fcd-b95f-af8baa67ba64@suse.com>
X-ClientProxiedBy: MA3P292CA0073.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::13) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM6PR03MB5113:EE_
X-MS-Office365-Filtering-Correlation-Id: a63217c5-129b-4089-d698-08de5f4cb90e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnZZM0JyOTNxdFlNTU0xclZRZ29TeXoxbzlWQjdZNlowc3Y5UE43YkZ3cFl1?=
 =?utf-8?B?Z29nRU80Y3cwSG5qbCt2NmtBRlJDT0RNc0pmM0tNQnl0VkJtNEhDSzdqVkE4?=
 =?utf-8?B?M2h0KzlvVGNxZllYYjlsWWxCcU5MRkY1VmdZRU9rMmhYNDNTbFV3bTFlOWk2?=
 =?utf-8?B?dmVYRDhnUDU0VVZ2Y2lJV3B2MDloT1JVc3VTazJIOUVnSFlDZ0daS3pOUlJi?=
 =?utf-8?B?OVAyRGl0cFY1elozMFhyRnFCUXU4WTF4bmZEcWFxZzBEQ09VUFpBaC9aYXBZ?=
 =?utf-8?B?TnQ0bENhREh6RDA4dVNSRUp6U3FGWHBFNktzYmdmaEpXWklPNzkyVlZ2UEdV?=
 =?utf-8?B?R3RYaG9Bb0VuYWkrWjJtUnpuL0daclVHclR0NWp3bDRQbWgzcGorSjBaUy9k?=
 =?utf-8?B?RGwzYmdYRjREdXRWdGp2OWREMDN2dUNFUUU0YWY1bWg5S1hnZU5XZDRudUZy?=
 =?utf-8?B?OFIrOTFScm94MDlyUnpZaDYrNXhHMWVkRk9rME5LcWpKNW5CL0xyRTNoQlhi?=
 =?utf-8?B?WFRHbXNvZTg5SzZKM3lJdTAwRTEwTHhFNXYwUkI2NHZWOHY0MWx6STV1S3c1?=
 =?utf-8?B?YWtlTGtsR2V1VXltQnNKbmZ2VUdtcWE1NVRuMmtLRG5FRkVwdk82dGR2MlZo?=
 =?utf-8?B?WDluRHlQbWo0dys5eXU4RkNrRWw0bDNiWG9BSHVlVkJhU0JPOVdBUjhpdFhh?=
 =?utf-8?B?a2QwTGR4ZklwekRRd2QzSXQ1V2NZMkhKeWIrSWplR2VxdTI3SXpBdTd2RnN2?=
 =?utf-8?B?MURTY2x1RnlCTkhtRWdqQXZjK3Y5STlYN1JyY29oa3RoZGVRVUJGMnNHNkFx?=
 =?utf-8?B?T1dlUmxPUG5lRkJ6eWlSVTRadkFxRGFVcUJBL0VWSmp6c21ZSUNmR0lRclp3?=
 =?utf-8?B?bTF6eGU5WUo2VnN2VWlRNDhKdVR3ZGU5aUttVkx5bVBSL24zMEIxRUR2N1pw?=
 =?utf-8?B?MU9BTkxBajdQbHRueXNxeFY3NHFyQjdEc3BWZ3dpT1dpRWg1aTZRcUhvSmxE?=
 =?utf-8?B?bDZpOVYvRlRhZldZbVkvb2dEbjhWUWpKOGVGVVFFSWJVcnhIVEhYcVoxUTND?=
 =?utf-8?B?N1FUcisvVjNQbUJNMDBMMEhya2hLK21sd1RDcDJEVlN5SmNyVC9mWkhBZXRj?=
 =?utf-8?B?eVpvNXIreEs4dk1XSnFtOThpSEpFa290N1ZWaThwSStibzlvODFMbUJEYXQ3?=
 =?utf-8?B?WnJ4dXhCQkVock9vcHNyeGJQSDZrak0ybkNndnBjREtqV1JzakRYSTJuaE4z?=
 =?utf-8?B?ZWs0K3dNajB4elV6TUIvb2N4YVlCMDBPS2tGejRqTXpDTXpDZndNZnNBL291?=
 =?utf-8?B?MnliWXE3S0h1YUk2YUVYbmZ5dXh1VzJvTmtuOG53UW0zcW51eldqY3V1N2Iw?=
 =?utf-8?B?N0FRUEVzMXZVd25HaEVLSEpPL0J3NDhsSGxYUDYrOUQvZDBpOVhjOEcrcTRY?=
 =?utf-8?B?K01iQVpRYzEyRFZ0VzQ1SHV0MFpqdjVFb3lEZjZabGFRdUVsYzBKY2tudUtt?=
 =?utf-8?B?bHltclByRWlXSWw2NXBHenoyV1JwUzdQSkJYYm10b3dXZkFEQWpMRlBFNDF5?=
 =?utf-8?B?NVZlc1U0N0lvaGJoSXJIbGw2QjhqMHpMNmJmam16L3dvU2NOZnd1OWp0WlJU?=
 =?utf-8?B?UGRmSFFkcDRFUitUMEswbHdPZ2h1WjRoMVBYOVlCY2VzaEQxbVUxTjJXRWJu?=
 =?utf-8?B?NmkvTnNOaEhZWlEvTjh6UG9xWFRMUVEwcEJlejRGcXI4aWVJSzR2RzNsRzRL?=
 =?utf-8?B?ZXQ1enl3N3FFcGhDVkpjKzRHNFFyajY5OThZa0VCUlVhTHFqUXh6eTMwMWdm?=
 =?utf-8?B?VVYrUEhCVm81RmkzMFpOcVdFYlljZk5EUXFocGV5M3BYMkZCY3c1azdmajRt?=
 =?utf-8?B?Qlp0cExwU2ZUKzVJSWhmUDcrMXA4MHBjclVPbm45TVVlTUZ1Rm52NUY2Q0Jj?=
 =?utf-8?B?cmxXZ3NkQnRjOG1aYVc5SkttZGNkOHp5MllsVU1YUkkzKytFWU9ZSmw0V2xI?=
 =?utf-8?B?Z2p2QnVPcVBVS2hQZWY1M0h0bEJKcDY1d3JkVWJSak9oa1Y2MWZ5Wm5sTW5D?=
 =?utf-8?B?ZlRrQjRmRWdaU2hLN21MVXJjOHlUZFFrUDVJNlZ1eUF3NWNHVno2VFE5VnBX?=
 =?utf-8?Q?NroM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFRkVjhRMWgzNDFyS2ZNWXZEdUZLdWFLMjFhWENaaHVrek0xRzVyc05BeXV6?=
 =?utf-8?B?bnFhRGVhSFlKNE5YeVdxVkt5Z3JwcDJ2RWVLUlNhV0Y1aTZZb2NlNW5TNHho?=
 =?utf-8?B?ekxYaURDQWhidXNVQmNXK2R2NkRTRWU2M2puUFJ1YTRTVkZCQ2lLWGZWNk9B?=
 =?utf-8?B?N1ljRkhIb2loMm1oeXY4RXp2S1ZGbjNsK05yQjhRbWFYUUJQOFcxbFMrZEJi?=
 =?utf-8?B?YXJ6bWd2OVlvcVU4eStEa3p4UzhYaW4rTTJLTTRWSUZCSXdMcHNqMHBxYUYw?=
 =?utf-8?B?TXNhSjNkdnU0OXRiTlNNSlI2UVNQL1pXNUJaOFVJWmpNUkpaTWRpdDFLSmJH?=
 =?utf-8?B?TmlKVGp5czI2YjVoRzA3ekcxUzdZNFYvblcxUUFjeFozdk42N2xqRWtOZ295?=
 =?utf-8?B?VVljemtncm1ONlloV1duZTVlUGpuNWRzT1laQys4cVVTSXYvb3dUZFQrR1Jl?=
 =?utf-8?B?RGpqUHhBMmFqNWRKZjY4UHVKeUt1eU5QbzVVd3Q2cWF0OEFpQ0dhVWN0Yy93?=
 =?utf-8?B?K2s0RWtSTWZJVFNoZitwS2d2Y3NhYXJhempKaUJTNnp1SmRwVVoydFArME5T?=
 =?utf-8?B?aGtKbjBnT1pUN3E0ZHJWZzlNWHJoWElLa3dMUklDbVlhK2N6M3RtOUpUNUdw?=
 =?utf-8?B?Y1hlWjh2eE91eVpoYkd2b3REMU5aOUxuN25rb09PNXcrVktVeWlFd1JIZFcv?=
 =?utf-8?B?dWVDQ3d3Vnh1ajgvdlhOaGF2Q2IzTElIM3djaW1OQmcwaTJ5bGpBVDBvaFZD?=
 =?utf-8?B?RzVVY3laWElZNGk4YzRkbVFQbnMzZlFXbUR2OU1LcnR4ZlQ3bWlubEU1Qk5p?=
 =?utf-8?B?ZXYwb2JMK1dCQzFDUjNmSEdhUmE3NW81TWgvYkdCM3lNYjdQaU8yWkkxVnh4?=
 =?utf-8?B?ckk1MXZIUXozZFFXUGV5LzBVMXBvTDg4MVZoTXlJQ2QyZDNCcmRKVGpEam5o?=
 =?utf-8?B?WE1NUkZLWWhzaFNiSHNzUVRkNmVXN3VIS3loQWRNVFh4Y3Y1VkcyZSt4N28z?=
 =?utf-8?B?S1BzUkxaVk9KZ3NpTkY0cG1kZ3A5aitHZ1A2c1o2VlN6SlV2RGV0eXFvTjFG?=
 =?utf-8?B?ckdyOVlMYjhLSG44YkF0K3hsejhacHRhV3drUC9XNnU1ZytIL2RmUjV4UmVL?=
 =?utf-8?B?R0w0VnkvZnAwcE5TZXVSOGQ4UlB1MDhJTGpHTU5hVlFRRDErOEVZQndsR2N2?=
 =?utf-8?B?OWNWdy9sNHpzNytGeUhUUkZ2STRmSU43UzQrZFR2Rm1uZ0ZKcUtRRGZQMFda?=
 =?utf-8?B?WlRHT3R1N1FmQ3hUaHdielphUGJhUzNoNGZOaFY5TTZTYTNrNXA5L0tJVzJn?=
 =?utf-8?B?TFRSLzdUQmFuQUVwZUwvRkR5NXlpaWNEWnhKM0xtMnpsdHp3bExZUHhrNktk?=
 =?utf-8?B?ZHExNEJ1ZHU5dUlUSVhJYUJNVU84RlR5UnRuTXlUNHZ4SmgzRVN0ZGlFR2hJ?=
 =?utf-8?B?T2MxcEdWditDSlpZeTVUd1dFcy95SG4yZ3JoeUxCd2VRbFA2VXVFM010WW9O?=
 =?utf-8?B?aTRDSmI5cE9kb1ZlYlJyWWIwTGRDZFA0UjByemRWM3FmR1YzTEF4b0R4TDh1?=
 =?utf-8?B?TCtBY0tUb285aCtoOE1HR3E3RDM2bS8xdk1oL3ROd28vWTdOTGtjTzZXN3dG?=
 =?utf-8?B?bVV2QWF4dEFlMG1kQmQ4a0Z4TUI3K3pHTUxtYVExKzkreEJKWWc4TlBuZUZV?=
 =?utf-8?B?elFIcWY3NXA4Sk0rUU5yTlc0ZkpYdm5oUldwTWFzcEsrbDV2V2RrYlhLTDlG?=
 =?utf-8?B?Zk9lTzVsMUlnZDRpeFdSNTl1Z2dlcnNSeWRhWllDOENCSFhMeFhESHRiMzhD?=
 =?utf-8?B?ZzNraGhFSDRtc3RrTU9XRzJNdjRJeGJyTjZPckp3Tkh2Z0NCalpYOGVKQ2Rv?=
 =?utf-8?B?NysxZDRkaFFpbU1tR2pOSWpzaUwveE9BaGE2RGcwMGs0cW8yQ055VjVocmNS?=
 =?utf-8?B?NnVSS3I3dXAvWXVmNXJQc3J0WkVqdjBBY09oN1VhcElIT1pYZVhwZTRPdGZB?=
 =?utf-8?B?Z3hVSUZ5bWZDUk50dmVjWFNuZWhEeklrZnZGN3NkZUlZTU1xN0NNeU40bkpH?=
 =?utf-8?B?UGMrSjNlNGVQYVQrMnIrQldkb0FscVVWMGxPV1MvOW9JRktWZ3hMQ2VsQSsx?=
 =?utf-8?B?d29icTVrQy9CLy9meUJSODM2Unc2dy9mc2ZNOU1UK285ZmtXakhtU0o0MDh1?=
 =?utf-8?B?L2ExT1RRVnkvdEhFbmEzNGFzZ3RuZGo1Y2piRjhHVTU1TUVld0NyUGc3Uy8v?=
 =?utf-8?B?NHg1WkttdmRZM2hQN0tWUlAvb1h4Z0prM0dWa3oveWNsV3dZTEFiYW80TS93?=
 =?utf-8?B?UTd5UWs2TW44cDVzR1RFNk44WXhSNTVrUjFGZndETit3QlRwLzVYZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a63217c5-129b-4089-d698-08de5f4cb90e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 15:40:26.2598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vrhwxFuHA5Xt0tltP+y5KQpascGEunknfRRHBeghOlHY9OkbmXMOtNiHdg2hV7o5vfxjrYDczLAU83ZUAUjvXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5113
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,Mac.lan:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 96CEDB195F
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 02:10:34PM +0100, Jan Beulich wrote:
> When Dom0 informs up about MMCFG usability, this may change whether
> extended capabilities are available (accessible) for devices. Zap what
> might be on record, and re-initialize the list.
> 
> No synchronization is added for the case where devices may already be in
> use. That'll need sorting when (a) DomU support was added and (b) DomU-s
> may run already while Dom0 / hwdom still boots (dom0less, Hyperlaunch).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> vpci_reinit_ext_capability_list()'s return value isn't checked, as it
> doesn't feel quite right to fail the hypercall because of this. At the
> same time it also doesn't feel quite right to have the function return
> "void". Thoughts?
> ---
> v3: New.
> 
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -8,6 +8,8 @@
>  #include <xen/guest_access.h>
>  #include <xen/iocap.h>
>  #include <xen/serial.h>
> +#include <xen/vpci.h>
> +
>  #include <asm/current.h>
>  #include <asm/io_apic.h>
>  #include <asm/msi.h>
> @@ -169,7 +171,10 @@ int cf_check physdev_check_pci_extcfg(st
>  
>      ASSERT(pdev->seg == info->segment);
>      if ( pdev->bus >= info->start_bus && pdev->bus <= info->end_bus )
> +    {
>          pci_check_extcfg(pdev);
> +        vpci_reinit_ext_capability_list(pdev);
> +    }
>  
>      return 0;
>  }
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -869,6 +869,18 @@ static int vpci_init_ext_capability_list
>      return 0;
>  }
>  
> +int vpci_reinit_ext_capability_list(const struct pci_dev *pdev)
> +{
> +    if ( !pdev->vpci )
> +        return 0;
> +
> +    if ( vpci_remove_registers(pdev->vpci, PCI_CFG_SPACE_SIZE,
> +                               PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE) )
> +        ASSERT_UNREACHABLE();
> +
> +    return vpci_init_ext_capability_list(pdev);

Isn't this missing the possible addition or removal of managed
extended capabilities?  IOW: on removal of access to the extended
space the vPCI managed capabilties that have is_ext == true should
call their ->cleanup() hooks, and on discovery of MMCFG access we
should call the ->init() hooks?

Thanks, Roger.

