Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2956BA1D0E1
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 07:21:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877451.1287593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcIV7-0003tq-LQ; Mon, 27 Jan 2025 06:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877451.1287593; Mon, 27 Jan 2025 06:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcIV7-0003rY-Ho; Mon, 27 Jan 2025 06:21:37 +0000
Received: by outflank-mailman (input) for mailman id 877451;
 Mon, 27 Jan 2025 06:21:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50Ot=UT=eviden.com=clement.mathieu--drif@srs-se1.protection.inumbo.net>)
 id 1tcIV6-0003B9-8t
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 06:21:36 +0000
Received: from smarthost1.eviden.com (smarthost1.eviden.com [80.78.11.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4f34483-dc76-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 07:21:34 +0100 (CET)
Received: from mail-vi1eur05lp2177.outbound.protection.outlook.com (HELO
 EUR05-VI1-obe.outbound.protection.outlook.com) ([104.47.17.177])
 by smarthost1.eviden.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 27 Jan 2025 07:21:33 +0100
Received: from AM8PR07MB7602.eurprd07.prod.outlook.com (2603:10a6:20b:24b::7)
 by AS1PR07MB8406.eurprd07.prod.outlook.com (2603:10a6:20b:4c6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 06:21:32 +0000
Received: from AM8PR07MB7602.eurprd07.prod.outlook.com
 ([fe80::fbd7:ca71:b636:6f9d]) by AM8PR07MB7602.eurprd07.prod.outlook.com
 ([fe80::fbd7:ca71:b636:6f9d%7]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 06:21:32 +0000
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
X-Inumbo-ID: f4f34483-dc76-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=eviden.com; i=@eviden.com; q=dns/txt; s=mail;
  t=1737958895; x=1769494895;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=A7aLgo+KE8CQRIFVKSD9yEnA6yy4B1DvAinfKaDQJGI=;
  b=tsM5qzVqOS5zVLKx1Xm6qRI830Q+wx7OistDFgp3mulrZ8HLXwNJ9y7W
   Xa8gXbe/6bDneMVbynO+8K6BbCVYjVQgTqIicc9IU/hbJoMYA3Z4ykaPs
   zC6Y7fAVIOhTcKCMSMykdJz3jR7RTLHPgIyEGsA8+fMun4CMZHlpVf4rb
   IgV1G1mPZ2ng00wzCj6suw/9DXBvZEmbVhFCmwkgiQi4iVM6v3eBX5k0K
   dAk3gYr7Yvz0VTUZpFuNpKZwZAXo8uLQfAG1K/8dFKi1kOGQvwuFzp+ol
   gQJUi+7RQN4TJPDDmxpwihhCDiqhzkpOTx+HQlI7OHT6inyJzxN/8fzq/
   g==;
X-CSE-ConnectionGUID: y/oOPrwXS2ix9Psz91TS8Q==
X-CSE-MsgGUID: fOwsJOJLRxW1pwS7kcSA+g==
X-IronPort-AV: E=Sophos;i="6.13,237,1732575600"; 
   d="scan'208";a="29567536"
X-MGA-submission: =?us-ascii?q?MDH0KEkmVaHLj+RZVEAn9maRKIMZyQj1GVP4Qp?=
 =?us-ascii?q?rMNxwbfSYJZzrsJjItgVpdykDPs/w5AktptIBFLeIjDwNnyver7CCr3t?=
 =?us-ascii?q?ujuG8RC2X6hwtdUUSy60FuoXE2m6BDKBEosWZZ3NgMdqiNha+t/kck7X?=
 =?us-ascii?q?RmrVs+vRM1BWDEeHrtTosQdw=3D=3D?=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FcjwogtPR4nB0hiy2MScdZemD4Cs1toui/ieQJgvmWPcfJm851DhVRmchiHyrWdrhB6jBfjZbTMc7R1xii+yELoyV3HA+CVPYV2PfteGWQR1BpDGDI2trsWe9D4ThRJqNAgvxI5ItkJLvZkC0IJgYm3DYGSPaPwqYBR7hfOnCoEjjqHxYkp2HZg5b5MHyPYEsxXXrK3zWO9krpRHwF2oMSUwchRYl0xRLxH9ZwOetNkDVQZOAZv/gEruZegBdGi696+a75B+RwGU2lmQaN1gCy4WpGMNjk+GoVkQM/rjEmFB8WGgbU6J5Fkp1TX1AJPRNDO5lvtKN/KSjUGaw3uViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7aLgo+KE8CQRIFVKSD9yEnA6yy4B1DvAinfKaDQJGI=;
 b=AaQsdC/Arrw3i/YbJoGAblsUTFGz1DNP8R3S8n2ZqREnrewkxBIHmppNPysXF2oyRnUkzTrW4SKBRChuLQUupGouRPjkjGSyyIWQ4OO7YiY8Ojy5iq950RR2dJSCnyWRvANlEn1jNZuc2hNNhlWsUgz97aGG5H1C8mr/JF2djcoLqWwn2s6LaRwx02TSb6QrAqac3L3lD1bL+KI/YDMCLywCP/Oi+6EXSJnn8EdTR11o8niKBU5NI6U3KItdDp/dHH7170g9OfGGuvT7go9HIn4N4rqYuuGvSpCe2KcDoCRKaj/99GoaOtoeoyEKFPuD3EPcO7gxsrpEgaDXjxzdIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eviden.com; dmarc=pass action=none header.from=eviden.com;
 dkim=pass header.d=eviden.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Eviden.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7aLgo+KE8CQRIFVKSD9yEnA6yy4B1DvAinfKaDQJGI=;
 b=brMjJoeQKQMvnZGUDTK0Ko4twa9CYCfhRWfVFMpkIaEQpIjnYQYYG8QX6uOSjAkzineH6JyTV+glEDw7af9eUXenWqYbdfMGu/MdW4u8KUeqbEcv6cXJ+fbeV/F14hj5DQqR/xabt6UE11YFbEXSTeBSdGZaiVK8HwrG++le/05iy7YlTF/jQ49y9WxuNz1EEv6TzCQyWMQlvZmtsSxDgmk8Q7w6FtBHEX9GbZZISCnuwxOwmR/VjtTbtFSgf9wDjNEAZoBdalc20J5lgj4D9xoZUZq/+sG1mB97dZU02jEgJm0gQZmpO1y0m49RCqD9UXu94eR/o2qNQYSIOD853A==
From: CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Yi Liu <yi.l.liu@intel.com>, Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>, Anthony PERARD
	<anthony@xenproject.org>, Gustavo Romero <gustavo.romero@linaro.org>, Jason
 Wang <jasowang@redhat.com>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <graf@amazon.com>, Richard Henderson
	<richard.henderson@linaro.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Bernhard Beschow <shentey@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
	=?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>, Alex Williamson <alex.williamson@redhat.com>,
	Paul Durrant <paul@xen.org>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?=
	<clg@redhat.com>
Subject: Re: [PATCH 7/9] hw/net: Have eTSEC device inherit from
 DYNAMIC_SYS_BUS_DEVICE
Thread-Topic: [PATCH 7/9] hw/net: Have eTSEC device inherit from
 DYNAMIC_SYS_BUS_DEVICE
Thread-Index: AQHbb1T6QlQEzX4gqEaQ2yn6FyHdDbMqKKoA
Date: Mon, 27 Jan 2025 06:21:32 +0000
Message-ID: <27e3a3fa-701f-4852-baf7-7237faa57df5@eviden.com>
References: <20250125181343.59151-1-philmd@linaro.org>
 <20250125181343.59151-8-philmd@linaro.org>
In-Reply-To: <20250125181343.59151-8-philmd@linaro.org>
Accept-Language: en-GB, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eviden.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR07MB7602:EE_|AS1PR07MB8406:EE_
x-ms-office365-filtering-correlation-id: 7650f0e2-ed63-4a09-b8b0-08dd3e9ad7af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dzlSNS8ra2hnbXhKdDgrbnZaWTBsc1VORUVCclBkSWFLL1lpVDhxY3RDNGox?=
 =?utf-8?B?YjJyWDRaVTBXZlFSOGdqMVpwdlFJcjhjQU5FQThyenl0Z01rM0xxL2srRDk2?=
 =?utf-8?B?SUlxT2UzRURWdkFFa2Fmb1pjNGJrcyt4dWhHMXk4VHQ3K3RaSGZ4dkFtMk9F?=
 =?utf-8?B?Njk1aGo0bmNKYjJNZzM3US82ZWxLVVlESVo4bVE2d1VzZmJjeFJDOWYrSEln?=
 =?utf-8?B?QTE2OTRqdENuZDUrZ3ZPajZSK2xyczVJZ2Fyd1d6TlFVdDlVZ3BoU1c1WFlC?=
 =?utf-8?B?YmwyN0NOMFMvYlYra3hjSUlOaXNybE1FUi90MlFyZFBYdW1wYnpENlkzTG1P?=
 =?utf-8?B?a2NkcmRSRkE3bmQ4ZUJUZDB0b1E1NFFSa25MQnFZM1lOU0VFZHg0U1crVUxz?=
 =?utf-8?B?dzY0UzhldTdRQXNRMkJqdERRU3RoamF2ak1HcTZmNWNMZUlzWjRWSURTbllk?=
 =?utf-8?B?MFEvWmNXQnA2T21KaEhSdGRaZG9iUmtOK0cwS3A1SGwzdkNRL0VOYitzMEN3?=
 =?utf-8?B?V0pZekVlYUVkeG4xbEZ3N05jSE1uS2x1NkFReVJpY1pwL0FGRmQ5bjVHdXha?=
 =?utf-8?B?QkJNdEEvZUVnRCtoSEdXNjNsNEthMjBja1VrTlNuZlROQlVQbXFVSDBDUUhr?=
 =?utf-8?B?cXVXNjkzSlBjRzQ4Vlo5VDZhZVEvRlIreUJCUTdqdmVvZjUrWitCOXpxRng1?=
 =?utf-8?B?T09xMk9SczVERElqcmovUUxKRkIzZklVcmFCcEt4UFN1ZzB5RUZ0Z2Rkc0Fx?=
 =?utf-8?B?SmhVT3EyOWsrcWVadXZBK2xIK0UzQkdLTWwzUUE3MHpoZ29nb1hjSEJDVTM0?=
 =?utf-8?B?QWJFd2oxcVo1UjFibS9mcStaTFZIR1ZIZFVZMFRWY2RHd3NhTmhMcG5FRllB?=
 =?utf-8?B?MlhaVlhLUGVHTHQ5RHFlUlhQeFdLdVRmUU9oMllsemhvWDRZREFWOEhvYVJ3?=
 =?utf-8?B?MC9VZC9vaytCMGlRZ1pNZC9uRGdSS1VLZkhzdUtXYnJMUFlTYy9ZMnoySlND?=
 =?utf-8?B?cy9WeHROWG9hVTkzdTVzOXNUaTRsU3JoRlV0c2VQU0F3czYxVHVlS1BkejJh?=
 =?utf-8?B?NER1Mkp3VnV3QnZQM3Y3R3NvdkhQVkRvSWJRZnJIL1Z0WDl0K0djNlV5dzND?=
 =?utf-8?B?NmF4ajBoeExFNGF0bHhLTG1OWkRqWGV6eFNFYWFrcHRxZkRHVGRFd2lkOTVs?=
 =?utf-8?B?U3F4dXVTT3h3aXRZcThhSW0vbS9PUVZhY0RMU0hZdklxNytmMEdMM2tOMWN6?=
 =?utf-8?B?VHJNRm91QTJTTHlsVitoRTRYcW1oeTJqRDhxQ2hZUVcrRGxIWklCOUM0QndG?=
 =?utf-8?B?YTgyelhqeG02SFdHZjB1TmZLWEdaVjlXUXI2TTFURVFueC9BUXpzajF4MXFF?=
 =?utf-8?B?MHBTcW00b3ZqNHlBUytjbjc3UHpzWXhyNFhzdkdmbk54STFIdDRwT0R6VkNO?=
 =?utf-8?B?RWwyOHVGaEl2dktRSXAwOGZMckFKNHZ1MVkwcmRYK1FldldsWkZaa2J0c2tR?=
 =?utf-8?B?eGhBUi9IdFFIN01IU2F6MithUzFGZzRNTzBQcHZBeks3d29FK1ZyREJhaHEy?=
 =?utf-8?B?SnpvZ01EaW5sOGRyZTh6SDFVcC8zcjJiNHk5Y3ZIRVhuMlNPZEZwcGVyZmIw?=
 =?utf-8?B?QWdQLy9xN2tpT05HVnI5U1ViQkQyYVd4LzlDY0lsandBSnZMSy9LaEhaM1du?=
 =?utf-8?B?ZXZNei9tajBHZzlIbnRHbktNTm9IZ3FxaytEOHN0Vzh1S3V4d0lwTk1Cc08z?=
 =?utf-8?B?QXc3NkdlczBZT1VsN2dmcGR5dXJoWXgrVnNObWdlWVNpM2VuL1ZBQnpjWkRi?=
 =?utf-8?B?OHNQdjk4S2Jmc0hDaS9IU09BRGZlK1lHdFBoY0NwOVVtMGxZa0tEY0Nub2sy?=
 =?utf-8?B?eUtiZktubUVRRnJRSlNaUzVESjdGRXVkMXI4Q1RFNExGZTVsSkk4VnVCSmJM?=
 =?utf-8?Q?k0PPuNIFnNFRsnLID4VZcHoyzOuKkG3d?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR07MB7602.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L1VQZU44b00yY2hIM1pDR2VFUURPaEl6RVVlV2NBY1o2dXNLSGQvS2pITUxR?=
 =?utf-8?B?cTV4UzlraDhxczg0Ny9VMG56VnA5Z2VKMXZSMENQR0luaVdHZkFjdUd3MnVL?=
 =?utf-8?B?RHF3L3BtR1F4ZUxjTU1tYXdLQTRJNzJYbUtLR29HOTRybVRUZEJhYjY0TzEy?=
 =?utf-8?B?Rk9wdHhuM3V6Tk55L3pSM0lNMk5IT0JraGtreTUySFkzazNYbVRHZXBkUExS?=
 =?utf-8?B?QXlOZi9UUjg2TG5oOXZ6K1Vvb2w4dDVkV1liZ21RWE1xMnNycmNUSjF0NFJT?=
 =?utf-8?B?MjlUMlJiTU56RzBqT0FiUFh1OGpxNDNYbk1uYmdWTjQ4UlhKeVVNSG1uWC9Z?=
 =?utf-8?B?TUoySDY1T2dMTmF5bzBlSWErVDR1REM3cFY3OHFETmlPMVNJNTEzVTVuRHZi?=
 =?utf-8?B?U1ovV1c5VWhwQkQzTkcrb01oOXEzUFB2ZEMzREJwUE9PWTcxWHU4cmFnK3BI?=
 =?utf-8?B?aHpuaWhGc2dEQlI3M04zeWVJYnRqekVKamRMMmJtMi9LYVNQdnFuMDFVY2RL?=
 =?utf-8?B?U1duTjl1SVlzTjZqcS85UkNBbzhZZERPTHI3enJmTHN2OVhDekROSXA1L2s1?=
 =?utf-8?B?YTMzUkd3YVFGTEhxYlNGSE50dGNpaDlkanovcS9NUURrSlhBU2lrNk5UcGcx?=
 =?utf-8?B?dldSZ3B5Z1FKWVpPQ1ovR3c2a2JWeHpDZmNFM3NWNE92QzNnSmFUSzlVS1dE?=
 =?utf-8?B?OC92WHRkTE5vMTRYU1dzRW1ZNHdleEIyaVJxYlZJUFQ5WkY3dUVJMktnRFhP?=
 =?utf-8?B?YXhyOGFOTzYrc1FhNHBvaHE2aklTTGxUTHlhQ0E0bFUwdnZNRHVJaE13d2lQ?=
 =?utf-8?B?bHl5dHBUQnErbjRQclFhZDhvNmtOYzR0ZkJJUUp3WmdxZFg3RmYya3lQSjNu?=
 =?utf-8?B?SWE2TTVqTllvNmMrdWhHd0NIRHFXV3l4NHN3ZHdUV1VmTGZLbUxwT1lBenZh?=
 =?utf-8?B?TGtxNC9tWFpDSkFXTk9pMDJzNTB4U2ZidENQMnkyOExqdHUvempLZkFVLytG?=
 =?utf-8?B?Y1UxeThUcEc5cHdsemlvMjQ1b1dKUVEzREVOcHJ5OHF4Q3lmb2tMbXV0dlRG?=
 =?utf-8?B?Wkw0dGwzZFRIdmVwUkNNamhoVmxUTUh3SVJNNGRGdVFkTWhjQkRLaUNSMXpI?=
 =?utf-8?B?cHpOeThzRjhxTDFSektyZ0FMVkNWSFBUVDF1N1dGUmI1SnZTMlpmSklGQ3Bl?=
 =?utf-8?B?M2FMbjBLTFYydlQ5U2dWNlpxN2NXcjY1SzZ6NzIrUW1TMW1RaEtiWHNqbEhs?=
 =?utf-8?B?S0lVWTRJaUdBaWlQajJ1d1BOdmVZb3huVm1XMWpvbytNdkp3bWtHUERWcG9M?=
 =?utf-8?B?OTc3SExLSWJ5TGpER05tbTMyRVRIbThMaDdiVHRjcGZZZUh6ZWhrZlQyS09a?=
 =?utf-8?B?RTltc0pBZm5pSHdWaEFHSVIzQnJnekJzUGpsYTVyWGRBQmUrVHFlczdDT2tT?=
 =?utf-8?B?N0pVQnN2VisybzArUmk5ekxXcExTQUw1elNHNURyTVBsRlFjMzZDZ2w5NWlz?=
 =?utf-8?B?Q2hUQXpvMTFicWlRLzBUU1V3TytLcUdjcjhWeXl0OUxOK3pQQVY4cHB5R2hY?=
 =?utf-8?B?WGtXaE9sbThidDJodmUxNHJGVy9HVitHQTRucHNJeENNdEdKc01GZDZ3QTMy?=
 =?utf-8?B?WmZ6Z25EWW5RMk5LQ1B5a2VoOUlrNkYyZWVyRVFTWWZMWlhoSDYrN3l3dVVi?=
 =?utf-8?B?QytkZUFOWlVycUMvdldFVDRwVkt4VHRldDdLRmVjSStGMGRZN0ZkdGdYenBB?=
 =?utf-8?B?SnpHYU9zMmZHdHNOWmtUcStnaXVabSsxYVlTL2liRWtUTVRiNi9zVExQbnUz?=
 =?utf-8?B?S0U1TEFscWROV203dE5CK2dTZ0FPWTVnN3NiTlNLbU82ZjFlakRUL1Urd3JH?=
 =?utf-8?B?Y2lkWlY3YVptTStqejQwMnVHZzk3VURTa2NtVkxRRFRoU1U2R3BmTGdWSElW?=
 =?utf-8?B?bXZJd1JqTHh3cWxJcDVid0pJZEdTQ2IyaE1xeDBsQ0o5UnFOK21IYkU5SVJM?=
 =?utf-8?B?cEtteW15ZCswTmQzNkhpajNlUUxyZzNMUlI1akJZVnFoYzZaeEZQaG5TUEtw?=
 =?utf-8?B?YWwrZFBrRlFhTlhSS3k1SVRTSktFd3hXTTFMYWk3a2tLNkY5aXN3akhxTUlQ?=
 =?utf-8?B?OWh4WDRyd1pKckVWWlArVzlhcDFxTThtVnlIZGc3bWVFVnVIZ2FWYXRHcjMr?=
 =?utf-8?Q?OGOVTIuSNGg8skwQgjM3OYg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9466E39CA70CF4E84280FEAF6D94478@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eviden.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR07MB7602.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7650f0e2-ed63-4a09-b8b0-08dd3e9ad7af
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 06:21:32.0894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7d1c7785-2d8a-437d-b842-1ed5d8fbe00a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vvtiiNwG5Y419TPTsWhUd3NiJylNuS3FRd/6ZGjWaNOElU0FrRiMsWa7ex5oEhDZcvN/b3ZHUdau8Cx7zfLMTXOs/34lwtLARJhaz9kp0hGYqhLcQdMFhJDqPcGyLj/W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR07MB8406

UmV2aWV3ZWQtYnk6IENsw6ltZW50IE1hdGhpZXUtLURyaWY8Y2xlbWVudC5tYXRoaWV1LS1kcmlm
QGV2aWRlbi5jb20+DQoNCg0KDQpPbiAyNS8wMS8yMDI1IDE5OjEzLCBQaGlsaXBwZSBNYXRoaWV1
LURhdWTDqSB3cm90ZToNCj4gQ2F1dGlvbjogRXh0ZXJuYWwgZW1haWwuIERvIG5vdCBvcGVuIGF0
dGFjaG1lbnRzIG9yIGNsaWNrIGxpbmtzLCB1bmxlc3MgdGhpcyBlbWFpbCBjb21lcyBmcm9tIGEg
a25vd24gc2VuZGVyIGFuZCB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPg0KPg0KPiBC
ZWNhdXNlIHRoZSBuZXR3b3JrIGVUU0VDIGRldmljZSBjYW4gYmUgb3B0aW9uYWxseSBwbHVnZ2Vk
IG9uIHRoZQ0KPiBUWVBFX1BMQVRGT1JNX0JVU19ERVZJQ0UsIGhhdmUgaXQgaW5oZXJpdCBUWVBF
X0RZTkFNSUNfU1lTX0JVU19ERVZJQ0UuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1h
dGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICAgaHcvbmV0L2ZzbF9l
dHNlYy9ldHNlYy5jIHwgNCArLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvaHcvbmV0L2ZzbF9ldHNlYy9ldHNl
Yy5jIGIvaHcvbmV0L2ZzbF9ldHNlYy9ldHNlYy5jDQo+IGluZGV4IDc4MWI5MDAzOTU0Li4zY2U0
ZmEyNjYyZCAxMDA2NDQNCj4gLS0tIGEvaHcvbmV0L2ZzbF9ldHNlYy9ldHNlYy5jDQo+ICsrKyBi
L2h3L25ldC9mc2xfZXRzZWMvZXRzZWMuYw0KPiBAQCAtNDI1LDE0ICs0MjUsMTIgQEAgc3RhdGlj
IHZvaWQgZXRzZWNfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqa2xhc3MsIHZvaWQgKmRhdGEpDQo+
ICAgICAgIGRjLT5yZWFsaXplID0gZXRzZWNfcmVhbGl6ZTsNCj4gICAgICAgZGV2aWNlX2NsYXNz
X3NldF9sZWdhY3lfcmVzZXQoZGMsIGV0c2VjX3Jlc2V0KTsNCj4gICAgICAgZGV2aWNlX2NsYXNz
X3NldF9wcm9wcyhkYywgZXRzZWNfcHJvcGVydGllcyk7DQo+IC0gICAgLyogU3VwcG9ydGVkIGJ5
IHBwY2U1MDAgbWFjaGluZSAqLw0KPiAtICAgIGRjLT51c2VyX2NyZWF0YWJsZSA9IHRydWU7DQo+
ICAgfQ0KPg0KPiAgIHN0YXRpYyBjb25zdCBUeXBlSW5mbyBldHNlY190eXBlc1tdID0gew0KPiAg
ICAgICB7DQo+ICAgICAgICAgICAubmFtZSAgICAgICAgICA9IFRZUEVfRVRTRUNfQ09NTU9OLA0K
PiAtICAgICAgICAucGFyZW50ICAgICAgICA9IFRZUEVfU1lTX0JVU19ERVZJQ0UsDQo+ICsgICAg
ICAgIC5wYXJlbnQgICAgICAgID0gVFlQRV9EWU5BTUlDX1NZU19CVVNfREVWSUNFLA0KPiAgICAg
ICAgICAgLmluc3RhbmNlX3NpemUgPSBzaXplb2YoZVRTRUMpLA0KPiAgICAgICAgICAgLmNsYXNz
X2luaXQgICAgPSBldHNlY19jbGFzc19pbml0LA0KPiAgICAgICAgICAgLmluc3RhbmNlX2luaXQg
PSBldHNlY19pbnN0YW5jZV9pbml0LA0KPiAtLQ0KPiAyLjQ3LjENCj4NCg==

