Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF5mLxZrgGkd8AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 10:15:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA52C9FDD
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 10:15:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218421.1527163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmq0d-0002gw-Ga; Mon, 02 Feb 2026 09:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218421.1527163; Mon, 02 Feb 2026 09:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmq0d-0002fX-Dd; Mon, 02 Feb 2026 09:14:15 +0000
Received: by outflank-mailman (input) for mailman id 1218421;
 Mon, 02 Feb 2026 09:14:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTrP=AG=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vmq0b-0002fR-UR
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 09:14:14 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89591488-0017-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 10:14:12 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS6PR03MB989137.namprd03.prod.outlook.com (2603:10b6:8:368::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 09:14:09 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 09:14:03 +0000
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
X-Inumbo-ID: 89591488-0017-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAIA6HTUODEkNh3e2mGZgUYPHvxFxIs4G7Q5gYCnvleBURYT3t99FgRuCzUjx5Jaheh4e03k16H07nThX35ztjazTiuORySP7jD99KYS2nvPbEUM99l6F3IW9vcnOsGTv3XOGQmjNhpxG3K+l3Ir8Bv0ji2gcGbNMgB0pSBlFhtgWrjfq+tY54S5a9aqRtq+i1mXpdVPcQlkDBh+0yxpBEK9GzzcAb0ttxasdnll+qkAFen4AfPGNd8ChFGV/97GihHBk+XnpHFbfRTzmMgQ0VbOgY/z6e7fEgZdME5YpWM2EoTLgqG75XLZL8be0hC/tUd4jFCNaP8D+SRmq2Llqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KscddeO4ygpsCh4lDfZx/RSlXshv9qIhQplY2B/zqv8=;
 b=Dyqqv3xCHacTli/a3JUyZLJBEEs0x8Nw77x3e14o6BWBcmeEb4aU0mYImQASD7acSHDMvK5qBlKtRuNxFdPKW/dYw1KqAqU4oZVbZP8apU/yeaaHmCpbB0L48RtyH3P+dxIPy0W4DCkhTZm7wf4CpbMLH2f0mXrKrv2tAoBunbpwh1hVrzUv7XTHZrb7bRHpN29XSKD0Vdh+ZyZ0WV/gn8l8BuLG4pkUZNe/onfSxik9NAoTiIHEubsvegxWFPDOaRaGMLY+OoIgIBrlAD6Lv7G/U3aBgLZcOZ1DKQL8R3C8DBfN6IEXK3KvJ6KaZxZR7BoydQpHTVPyx+aEnZ4Gkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KscddeO4ygpsCh4lDfZx/RSlXshv9qIhQplY2B/zqv8=;
 b=FCZK1lJZzMHgxGwiNfA0TJcRleAK6UB+oWtwRfsk7eJk8jtKiJBSE+DXS5tW3iFiDrPVkZdlcZH5iDs9JByuGhTM5fg1oxG7IR+fq6OA2BVz7QQctAEBo10XID87nNFLNOcqCo3Xm+dAfiDpWMizQWFXtTwVyHK5CKhT0m4bYT0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 2 Feb 2026 10:14:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v3 5/6] x86/PCI: avoid re-evaluation of extended config
 space accessibility
Message-ID: <aYBq2EoeP_TGv_sK@Mac.lan>
References: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
 <a0b10d39-daae-4fc0-af42-a3794a96f9f5@suse.com>
 <b63b0f9e-93cd-4b55-a7c0-f8eab9df1947@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b63b0f9e-93cd-4b55-a7c0-f8eab9df1947@suse.com>
X-ClientProxiedBy: MA3P292CA0054.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS6PR03MB989137:EE_
X-MS-Office365-Filtering-Correlation-Id: 520de708-1bf1-4048-0885-08de623b6894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YnV6ay9qVVppSWRRbXhMOXZNTk1WT1lhajhEVEUzY3E2d1dralp6TUd6Yisx?=
 =?utf-8?B?azhKUUlCWEZoUnZQZFNwSnhNOG9MQTFMazExeWlrVytoTi9YUUxJdGVMaTZW?=
 =?utf-8?B?NXJZSGx1cEUvNVdwWGpzWkRTWmthTUROUjdYMXRlUkxCZmU3dlJVdUpBeU96?=
 =?utf-8?B?Snp5NDJOY0YySnA2WGdYclBRNXd4QmVuT2JKMDFmdkJ0OVNJdlhqOStMYTlt?=
 =?utf-8?B?blRYZUFEYXd3ZWZBcHJJazAzTzdBelVrSFBVNGE5ZHB6SnM1VThhV0lhaXZz?=
 =?utf-8?B?R0JTRDc4ZnJ4SEU3MHpiUldEVGQwWWpHY2tLcnVrZHZiVnVxeVlnc2J5V3BL?=
 =?utf-8?B?bUl2Sk5kRHIya2RoTVU2ZFFndnBzWHNSRU9NcmVrL29kQms5dHh2REpSZERI?=
 =?utf-8?B?ZUhkVXdCeDRLSk5haEw1NmFydzNDK0ZYRHdmdlhhMkdTY0UwYU9tNWVuQmNH?=
 =?utf-8?B?bDJHVXpiU1ZISWFzN05BYTFzT1JTbDVpSG1XUEN3SHpnT3VDZ1dVNnZVOXNS?=
 =?utf-8?B?bmRVWFI4T3lDQzloSkFZR1BFY3ZXeHowM3RQWFJLMExvRzNtbzY3OGRuTzBo?=
 =?utf-8?B?d1U2ODNoSzQvY1JDUjcrL1FQSkdvWTFXV0VWcTNqSHVjMERVanJlenNWUXRw?=
 =?utf-8?B?RWcxUDdBekxLT0VRNytaWUViRFNxZ2VYdGdVRFErN3c5MkJyRWdjbXBidVZx?=
 =?utf-8?B?QmdYSjAyMzVJTEdmMVJwdlRUUEZCOFQyWnhwdkJtZFoxNjdBYVdYYlRsZTh5?=
 =?utf-8?B?aE1EVDU4V3RaQ1hzRUVpSzA3aHE2NkF2RHdheDFTVS9NaFMyQTh4c0RIRVNI?=
 =?utf-8?B?ZTFMd3d1NEt6Z012TGxBRjlWKzljYjY0WEVBWFBaOUVqa0h5U2pxcG5zZVYy?=
 =?utf-8?B?czVOZm9nQXNTY1JDRHVXdDVpMXBEYktkZG12czJyT2c1cHQrbGhZNHlJWjJS?=
 =?utf-8?B?ek9ibURVbTZKREJ0d3ZCYWpqKzN6cGttK1hBRThaK1Z3SHl3R1lxYWhKVm9N?=
 =?utf-8?B?Wm9ueHpHbURleXkrN3QvWXU3b0dHQS9PYjRXUVpxNndRend1MVpnOFV2UlU4?=
 =?utf-8?B?SE1IVnUyMVlKRTNjMHZPb2hNZVJ3M1RpYU1jUEpDa092azRXU0F2VGkrWlMz?=
 =?utf-8?B?WUJGQWM1SUx6QzluNHhBK0ZtYkZaU0RIRkpNZUgwUUw5cWZ4dE9mbWc0ejky?=
 =?utf-8?B?RTFydk42Mm1JZkptQnl5ZjF2SWlyQXNPN2FqMFhMK1FSMU5lblBFcWNuckhO?=
 =?utf-8?B?eUhoZTVSaEtlblYyNXpFVFpSc0NjZEF2OGJEbno2Q1Q1cmdjZUxsQkhVejQy?=
 =?utf-8?B?ZmZCSGc3aEtXRG5ndkdYM3drUVRKZ0dHM1Y5SGhpZkxYaFJSamVNWWxrczZS?=
 =?utf-8?B?b2dFSll5alVONnVtTWxSbUhheFlXQVZuT2RHektNWE02aGhNWFNtUEJkVEw3?=
 =?utf-8?B?cXRUN0hxZDVSVXZZS0hWUFZtdGRrcnN1VWU0b2xNSk5qSGlrR3U5b0FxNmlC?=
 =?utf-8?B?b0psUkpzYkFvUk92cXBWSW93eDk1YitPR0pmNEphb1hLOG1jc1RYSjVRNEF6?=
 =?utf-8?B?Y2F4VXB1MEhKV3I5WmJkYXNsTkZNa0oyQWJXZlFjdU43cWNNdVlZcFAzUmd5?=
 =?utf-8?B?Q3BHOGFUV0VUMm9PdnEzMkZsZXgrQmhUTDArN3pOSmFYTGM4MTJSbjI3eXZ3?=
 =?utf-8?B?ck94dzRoVGxSd0xIUzlLZ0hwb1FwUFZsWVpabTdJU2tSQklIMHVja1FSRUNw?=
 =?utf-8?B?ZkFvRGNuSVVtSElVZ1poSWsyUzhDSGFmQTk0N1Q3QzROMlRlSiszM3lYMEEx?=
 =?utf-8?B?a0svZmxNSmp4d3U0MFhsU245Z1FjRmxKUkpaMmhzcTJ4eUZrdW8rRkJFbGxO?=
 =?utf-8?B?OC8vT3hjSlVwQUpnNGFlWG9malFoc1oralJmKzcydVJjam9WSW80R0l3YmRa?=
 =?utf-8?B?ZDBhNXgzZFFvY05qWXRRTG1VaTlUb1F3bkJiNXdxeGRja1JwWmRHRXNuTjRQ?=
 =?utf-8?B?dUtiZWZaVlNVUnFja041ZEJXdE5GTlY1M0FqRWpzdU1hYVAzYVdBYjVBZ3hD?=
 =?utf-8?B?bzlwSzJ2MTFoM1FQOVJ6UzRVbUF2MjFvS3VGbHhEcHpNMFlmZVdIaWFxSzJX?=
 =?utf-8?Q?gl5o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1ZtYkk2TlZuZFhSdGVpaWUxZk5TZUw4MnV2UTBwZWRsUU1FMDY2b1BYMWFN?=
 =?utf-8?B?WUxlUWtVcVc3YlFSeHJOeFdhUFFMRUo0THVTWU9JWUpjd2lHVVVwMTdYT0Vk?=
 =?utf-8?B?Z2N4OUR5YnRhUHJibHJmdmdGMEdDOWpsRzhSWkoyOVpERmE0OFpwSHBJRmhu?=
 =?utf-8?B?OElPRi9kWU0vZ2xrY29IUjFsVWFETUtNWldIaG0xRXJvQTgxTmpJays4QTRR?=
 =?utf-8?B?L3NUNVM2MjA4Si9FeW5hNGIvdzJDQ2toL1l5ZHlRUXFYYnFhQnJpWkdnQVZs?=
 =?utf-8?B?TGM2RWFNMmJzK0JtcTJjNEhneDdPQ1hhQWN0WVU0TWNWN1QrcU5lMnBEdWhS?=
 =?utf-8?B?dzNRUXhlMFM4Z1FRN3V2N0hJVGMwZlNhbjhDOFRlM0lRNDFqaDdUeTI2WWtl?=
 =?utf-8?B?WVlrTlN1djVWWm5jZHJ6Yk1wbHc0cmxFOFFnTkZpR2tUYjM1M25XLzVqMmdv?=
 =?utf-8?B?aFNoOXM3TEhJOStlbzU1eWc1ZVhGQ0E0T054dm5IZTRvNUxPNFYwaENYZ2dV?=
 =?utf-8?B?cTlTenBDc0dVdWd5OXhtZEx2KytCMXVucHBiU0ZOYVQ4eisxcFRMWVp0c1NB?=
 =?utf-8?B?ek1KWTJOcVpocldQWEtPdUVLamd5emdYb0pjWE9YQ24vRFN0ZGxJYmhGaTQz?=
 =?utf-8?B?N2lEVmtRY1VSUFRSZk1mK3hpZkhqQUFKczFLTTRGVXdWV1E0S1B2RnVQb1dU?=
 =?utf-8?B?VFMxQWRia1R6SHNlaXRXVkxDcWFXQXEyL0lzeHFja2VhcWV3OC9aTGZxcHZx?=
 =?utf-8?B?SHhCaG5semxUMTVGcVJEUHdJWEtwMTlFM2lnNTU5VnpOOUs5bGRYV2N4K3Rp?=
 =?utf-8?B?bGlIQnJUa3pKMGt0dVJ2VzhjYlRBWlRpY2dMOEF3eEZDWGdJUC93Wmp2Q3o1?=
 =?utf-8?B?cDBGR1V3RkNydWZ1ek96ZnpKT0JwNUNCSzAzT3VMVXVwQXJwaUVSQjFkSXhU?=
 =?utf-8?B?SWdSU1l3bVRKZEd4NkFwMncyT09kdXZQZ2hBUVpwdXgrS0JLTmY2VXJZV0t3?=
 =?utf-8?B?dk9zUVdsNVBBOUJGVDlyL29vVnovY0poRFRIbmRaN3hhRkUxVWhVNG1lUnpl?=
 =?utf-8?B?VzZkNWkxTGVCOXBWc1FoZXNZdHBvVkpTcHJzeDQxQ1VWTm9Jc0twM2V3N0lk?=
 =?utf-8?B?QjV1QzgyYzFCSUlxY2pGclhsYmo0Mm9qam5kOCt0T0RONkJud1dTaWxBWkM3?=
 =?utf-8?B?UExNZUxyZFNQT29hakxhTEVPZHJyK3VFWkV6ZDBTNi9CL0MwczVubWx0ZVZW?=
 =?utf-8?B?TmkxMEpTVkw0elVPd0FDWldJRTA1djFNcW1ocXF2OUtqOTRoVjJmaU1qMHhF?=
 =?utf-8?B?L0pZamVNR0wydEw3RC8xWkE2R054eVc0eXdRVW1mQkhhamlOVnRBQVJjTXFi?=
 =?utf-8?B?SlVqNWRWQjRFaUo2NlQwelVOYlhNSjVyYjlBR0hBNVhDbXZZNE1UUzkwK05q?=
 =?utf-8?B?LzNxa2QxMkdGMnY2SGF3RzN0OFliS3FmdDhvaXVjSHZ0Q09uRFpMWHl0OTAx?=
 =?utf-8?B?dGttWS9qOGlmc0ZyajRXYWY2WWxyMzhFSVpSNWZwM042QTZ3c1lRTTFsb3BJ?=
 =?utf-8?B?ZmF4R1BSdTB5OURiOHllc0tCRXpUOGo5SlJGR2lkYTNvWlozRndCME1IcjVT?=
 =?utf-8?B?OWR0Zkk4ZjI2ckh5U29FSEVkdjlSdkRvN0FvMWdhWm9PN1VSV1dkVHozaDhY?=
 =?utf-8?B?Sk1HcWZNWkJZbnRKdEJKUFh2aXQzYWIxMFErWmp0RHNLUW5KSHpYNVNDWU9N?=
 =?utf-8?B?YndsUDlyVGRjTE1mM3NjMXZGRThORTZSRllwSXJ5NVhHZDMrU0FOZzRGbkhB?=
 =?utf-8?B?cXVObzVwaEg1ZU9odTM0UVdVcm1aQ29Fd2prMGVyN0xpVU5ZelZ3cHdiWEZa?=
 =?utf-8?B?NncwbnBGNExDRDJRSGp6VU95RjRSdndUSlBEZXVPdERwNWVlakNnQUpZRklx?=
 =?utf-8?B?TkhkK0NQSVpJZ0lTMjVCYTl4R2N4cjl2akc4TXJuak1Ha1FtVS9uRkUwM0Yr?=
 =?utf-8?B?NHhqcklZRDYrdEhEaGgwR1MyRmh4aXZVNW5WamlZcTZzbG54SGFybWtQYW1R?=
 =?utf-8?B?eGhyTXpnUHpWcGVWNHBrTGN4d1lKQ0toUnA4R29sRkdzcC9sM09LZjJiUCtZ?=
 =?utf-8?B?dWZoUTBNVUFvZ2hhVDBPVlQvSjVaR2tweitlWEJ3akJJTGRrWkdNVzlVeXU4?=
 =?utf-8?B?eUlua2t2VHBxc2FXTnRHVXppQmRWRVJTK2FaNFF4RU1CeDRkK2FEVkVnYVpE?=
 =?utf-8?B?TlJSNFpVTVcyRHQ1cUJqNmJ3S1NXZnA3aXg2bkIzQVJyNnkzOHBXRS9FNU1w?=
 =?utf-8?B?NVhDUkVCOHBiUnlFOGFzbEYwUk03SmFlVEVPaFV5UGdPeWloc2t5UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 520de708-1bf1-4048-0885-08de623b6894
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 09:14:03.1740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkvfBuG10qk6oNyWTKr5ioXUtgA1T8pUxs4yu4L3arVTbAtNKJGB+HbAPIsM/lHa1TEvdWMYL93VYJU86Ud09g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR03MB989137
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
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,Mac.lan:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CCA52C9FDD
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 09:51:18AM +0100, Jan Beulich wrote:
> On 29.01.2026 14:10, Jan Beulich wrote:
> > @@ -160,10 +161,13 @@ int pci_mmcfg_arch_enable(unsigned int i
> >      return 0;
> >  }
> >  
> > -void pci_mmcfg_arch_disable(unsigned int idx)
> > +int pci_mmcfg_arch_disable(unsigned int idx)
> >  {
> >      const typeof(pci_mmcfg_config[0]) *cfg = pci_mmcfg_virt[idx].cfg;
> >  
> > +    if ( !pci_mmcfg_virt[idx].virt )
> > +        return 1;
> 
> Afaict this is what causes CI (adl-*) to say no here:
> 
> (XEN) [    4.132689] PCI: Using MCFG for segment 0000 bus 00-ff
> (XEN) [    4.132697] ----[ Xen-4.22-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
> (XEN) [    4.132700] CPU:    12
> (XEN) [    4.132702] RIP:    e008:[<ffff82d0405779bd>] pci_mmcfg_read+0x19e/0x1c7
> (XEN) [    4.132708] RFLAGS: 0000000000010286   CONTEXT: hypervisor (d0v0)
> (XEN) [    4.132711] rax: 0000000000300000   rbx: ffff808000300100   rcx: 0000000000000000
> (XEN) [    4.132714] rdx: ffff808000300100   rsi: 0000000000000000   rdi: ffff8304959ffcec
> (XEN) [    4.132716] rbp: ffff8304959ffd18   rsp: ffff8304959ffce8   r8:  0000000000000004
> (XEN) [    4.132718] r9:  ffff8304959ffd2c   r10: 0000000000000000   r11: 0000000000000000
> (XEN) [    4.132720] r12: 0000000000000100   r13: 0000000000000004   r14: ffff8304959ffd2c
> (XEN) [    4.132723] r15: ffff808000000000   cr0: 0000000080050033   cr4: 0000000000b526e0
> (XEN) [    4.132725] cr3: 0000000492a30000   cr2: ffff808000300100
> (XEN) [    4.132727] fsb: 0000000000000000   gsb: ffff8881b9a00000   gss: 0000000000000000
> (XEN) [    4.132729] ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
> (XEN) [    4.132733] Xen code around <ffff82d0405779bd> (pci_mmcfg_read+0x19e/0x1c7):
> (XEN) [    4.132734]  48 39 d3 72 ea 4c 01 e3 <8b> 03 89 c3 4d 85 f6 74 0d 41 89 1e b8 00 00 00
> (XEN) [    4.132744] Xen stack trace from rsp=ffff8304959ffce8:
> (XEN) [    4.132745]    0000000300000286 ffff830495bd8010 0000000000000003 ffff830495bd8010
> (XEN) [    4.132749]    ffff8304959ffdd0 ffff82d0405fa7ef ffff8304959ffd30 ffff82d040576877
> (XEN) [    4.132753]    000000000000000c ffff8304959ffd58 ffff82d04039b81d ffff8304959ffe28
> (XEN) [    4.132756]    0000000000000003 ffff830495bd8010 ffff8304959ffd80 ffff82d0405fa90b
> (XEN) [    4.132760]    ffff8304959ffdc8 ffff830495bd8010 ffff830498019650 ffff8304959ffdb8
> (XEN) [    4.132764]    ffff82d0403983e0 ffff830498019650 ffff8304959ffe28 ffff82d0405fa7ef
> (XEN) [    4.132767]    0000000000000018 ffffc9004002b900 ffff8304959ffdf8 ffff82d04039feba
> (XEN) [    4.132771]    ffff82d0405fa7ef ffff8304959ffe28 0000000000000000 ffffc9004002b900
> (XEN) [    4.132774]    0000000000000000 ffff8304959bb000 ffff8304959ffe78 ffff82d0405ff666
> (XEN) [    4.132778]    ffff82d0405713b8 00000000ffffffff 00a0fb0081f456e0 ffff8304959b3010
> (XEN) [    4.132782]    00000000c0000000 00000001ff000000 ffff8304959fff08 0000000000000040
> (XEN) [    4.132785]    000000ec00000001 ffff8304959fff08 ffff8304959a4000 0000000000000021
> (XEN) [    4.132789]    0000000000000000 ffffc9004002b900 ffff8304959ffef8 ffff82d0405711b2
> (XEN) [    4.132792]    0000000000000000 ffff888100456938 ffff8881001470b8 0000000000000018
> (XEN) [    4.132795]    0000000000000000 ffff8304959ffef8 ffff82d0406213f9 ffff8304959a4000
> (XEN) [    4.132799]    0000000000000000 ffff8304959a4000 0000000000000000 0000000000000000
> (XEN) [    4.132802]    ffff8304959fffff 0000000000000000 00007cfb6a6000d7 ffff82d0402012d3
> (XEN) [    4.132806]    0000000000000000 00000000ffffffff ffff8881001470b8 ffff888100b88900
> (XEN) [    4.132809]    ffffc9004002b900 ffff8881001470b8 0000000000000283 ffff888100456938
> (XEN) [    4.132813]    ffff888100065410 0000000000000000 0000000000000021 ffffffff81f7842a
> (XEN) [    4.132816] Xen call trace:
> (XEN) [    4.132819]    [<ffff82d0405779bd>] R pci_mmcfg_read+0x19e/0x1c7
> (XEN) [    4.132822]    [<ffff82d040576877>] F pci_conf_read32+0x55/0x5e
> (XEN) [    4.132826]    [<ffff82d04039b81d>] F pci_check_extcfg+0xb1/0x13b
> (XEN) [    4.132831]    [<ffff82d0405fa90b>] F physdev_check_pci_extcfg+0x11c/0x121
> (XEN) [    4.132833]    [<ffff82d0403983e0>] F drivers/passthrough/pci.c#iterate_all+0xa2/0xe2
> (XEN) [    4.132836]    [<ffff82d04039feba>] F pci_segment_iterate+0x4e/0x74
> (XEN) [    4.132839]    [<ffff82d0405ff666>] F do_physdev_op+0x362a/0x4161
> (XEN) [    4.132842]    [<ffff82d0405711b2>] F pv_hypercall+0x6be/0x838
> (XEN) [    4.132845]    [<ffff82d0402012d3>] F lstar_enter+0x143/0x148
> (XEN) [    4.132847] 
> (XEN) [    4.132848] Pagetable walk from ffff808000300100:
> (XEN) [    4.132851]  L4[0x101] = 0000000000000000 ffffffffffffffff
> 
> There is an important comment in pci_mmcfg_arch_disable():
> 
>     /*
>      * Don't use destroy_xen_mappings() here, or make sure that at least
>      * the necessary L4 entries get populated (so that they get properly
>      * propagated to guest domains' page tables).
>      */
> 
> Hence it is wrong to bypass
> 
>     mcfg_ioremap(cfg, idx, 0);

Hm, I see.  The L4 slot must be unconditionally populated before we
clone the idle page-table, otherwise the mappings won't propagate.

What about unconditionally populating the L4 slot in
subarch_init_memory()?  That seems less fragile than doing it in
pci_mmcfg_arch_disable().

Thanks, Roger.

