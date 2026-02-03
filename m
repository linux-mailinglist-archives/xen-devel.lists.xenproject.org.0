Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJyyIzLpgWkFMAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 13:25:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C88C5D8F92
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 13:25:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219256.1528174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnFS3-0000E5-CF; Tue, 03 Feb 2026 12:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219256.1528174; Tue, 03 Feb 2026 12:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnFS3-0000Bq-9Z; Tue, 03 Feb 2026 12:24:15 +0000
Received: by outflank-mailman (input) for mailman id 1219256;
 Tue, 03 Feb 2026 12:24:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RKol=AH=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vnFS1-0000Bg-RR
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 12:24:14 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c82667d-00fb-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 13:24:08 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB3PR0302MB9257.eurprd03.prod.outlook.com
 (2603:10a6:10:43c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 12:24:03 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 12:24:03 +0000
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
X-Inumbo-ID: 3c82667d-00fb-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A37x+kvd/hBJiuRaVj9PFAYIFtgouiaW9+rqhnQu03EFneGz6Jfsh08VMriVAwcbXTxBs5Z+H0maJ/eCFbLqcN+D2rfqDyQrFlKipa3bLymRYWHapXXLHJMhu/WL1wPptXRb39DcGL7PVol+h3m4vMWN1LrBw4sZuNEG2r6htyZ9YkyUbX2bHTXwRWXDCfe+9CzAtmAjUxQOKCFwF2qQ9SnZYn+NNizbtZNkkqXrArq52US6w1MRmJ/EiPE4XGAH9yaXecccyokqIGSZb/pcX4KN5MQIu7QtnYs/Mo19TJ1JeVXo5zl57AoPJGK8OtLrJKUUD4gJAA1Bt4q5GszaZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6+VJW02gqowwt+utBApCUMiE8ImrNq43Z+EttgAPHQ=;
 b=l9wSuqwlJt51TKjBbr6x2yccj6ez637yIjKo4or2JCd10zYUfdg3WMVP8IPLq61v9+DkWRvx3zWy/XqHGU5YVVZ+vu6aIH6s9npf6NrvBV9IHj0Se44FfIvcxoPU/XjLDp7Beb49tRZTidPu/S/rIsulyGQW/ZcMRhkTvWiaj/TGPOha5O7AvTOTQdwlt39EW6Fnna6EqZf/gMfZn7+STE7gFmIwfBAwxnL3yDaB+O4lYtjbEmWjgB2xDMP9Oajo2ZYtARCKuSc6v1YNVeYzmVi2L4DH1iFugz+I3Cg4mYck3XgSpmWE3af8CkbrJo5rfuo+f+lhAJuBbnMUEecEvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6+VJW02gqowwt+utBApCUMiE8ImrNq43Z+EttgAPHQ=;
 b=UZ7n+CsqmOUFQlqrVCefemjyAmWEMHIeuVfEMG+dDhmle9Xz/uj2q0kfpbbxGoq0tbTqAr8vWMG4PjF+eI1/4JlVIkcqb6FqjqypeDCQAXPt91qyKSpgVsXcFobj5hs7HfDs2uQSsXJbqA2BmOqTii2+TJMpAm8EJLSiwEzZNQxj7ymxY4A3b1hW39gHICGiP8hU54CFq+WGnJpl9XfYixiRCHH8RdXUA/O90AJs6ke9TfOiv9MBWAGb9nfApveUijk4HAyENV1NgrXzl04grXYeW8ata5ZG/3EpmyvFxwJhukm/rdm3D74f5K36JZGxiQLVLTUsl5yl9PyJ+NQ8Kg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 00/19] GICv4 Support for Xen
Thread-Topic: [RFC PATCH 00/19] GICv4 Support for Xen
Thread-Index: AQHclF8GgI2Kr/X/QEO5wnP/6sbdXbVwv1qAgAAn3QA=
Date: Tue, 3 Feb 2026 12:24:03 +0000
Message-ID: <88755b1b-a9c9-489a-80e3-e014244b108a@epam.com>
References: <cover.1770046465.git.mykyta_poturai@epam.com>
 <AC263D87-9EE3-4F32-BC5D-1A290781C48B@arm.com>
In-Reply-To: <AC263D87-9EE3-4F32-BC5D-1A290781C48B@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9257:EE_
x-ms-office365-filtering-correlation-id: 7be0326f-270a-4262-10eb-08de631f1e34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Vld4YXNSQWMvOFp4Z3IyNERwNmhhRlB6N0xydzh2VngvTEhtWnlRRlpXaHE0?=
 =?utf-8?B?NXNSWUtXdGwxZ3UvcU9WUEFweVdBUldyWnhHVzg5eFE4NDFuZlFZWDM1R2ZG?=
 =?utf-8?B?UlcyZUxaeTB5SEpNaE1jL2hlMnFSZ2tpR1NUL0JEY1Y5OHZXSEE0d2VqQWFB?=
 =?utf-8?B?dU9rWkZhM3gyT0J0bEZFVWNKVllLZmZvL0VQbm1zdW94WTFkUm1ma3FMRkpu?=
 =?utf-8?B?K3F2M0Z0b2lzWEZjSFZmOEdPeDNEcVd6V01JQ05FS21RUVNyMm45c01UZU55?=
 =?utf-8?B?ZFNLbisyTFVmSCsvV2VHaGR1eC80U3JvcGNVa1pXVDdqazB6RklhVE0rTEI5?=
 =?utf-8?B?UnlwQThwek9mbWw4NGRkTVNwejJKRzBXN29uQ1RhY0ZERDZVRTRJcWN3d2Rq?=
 =?utf-8?B?TE5XOWFmMW9FM2V2L2RLTzk3MXNGRTNZWU1udVhMcjU5R0lRTnNCYU55RTVL?=
 =?utf-8?B?ZGZPS2hyM2NtOURoS2I2Qi81OXNjMG5QaEcxNkFQbWxWTk9TTFZrYk1WMDFt?=
 =?utf-8?B?Y3JJVXVQY09xWkJGU3pDRFJsRXZ2R0pKZ3BKWVlaaG11REt6dDY0RUQ4czVw?=
 =?utf-8?B?VzlUM1IyYWZvaDhHNzBWVUgzR0tQTU01WE9TM2xOVk9NblZ5L1lCWm5CMTRu?=
 =?utf-8?B?VzZ4Ujl5UmxhcnV4S0RWcmVoL1ZtM1R3Z1hOcldGSXFuMzBBQVZ5NjhHTlFw?=
 =?utf-8?B?ZjF1OFdXNElJTVNnUlZsajRTV1JrcGZDUU9PWTlDWFY4Q1hHbmIrRTZhU2x0?=
 =?utf-8?B?OHMzUFJuU2xxd29qRmNPN3FCdjZTRlc0ZWxWVm1ZVll3M2xoL2VrejEzOUsy?=
 =?utf-8?B?Tm5zYmFzamwvVlhTdTRLZUZXRC9Idmk2S3p2MStRNktZVkFPbTA5REM5dXBw?=
 =?utf-8?B?Q2JrWGtaODEreStLMDhGUmcvZVNha1pXRTVhS0Rvd2t3cnNyOFU4VUlXbGlz?=
 =?utf-8?B?NVM1ZE9pdnZnMW9xRzcrak9jOU1Fb0lqSENlYm9PcHNQYTZDcHRhUkhSOHJJ?=
 =?utf-8?B?eEc1NFBpa05IWjNNTFYrdTg3WllCT1RXUno2UXdiVWdJcytHdlVzSldlZmJ1?=
 =?utf-8?B?V3Jva0RKeEE1U2wrdVlrZ2d3ZU9TMjczYy9KYS9BWFpBR0RsT0licHduTWhj?=
 =?utf-8?B?R0hodndXa0lJc0JhcTJrREpNSHJpWWJiZ1IzT3MxVENSV2hWQWgwRGs2Z0Iy?=
 =?utf-8?B?Q0taTkNUUVV4eGdWcjdQRzFvZk1zTjJCdW5lY2orN0VGUDl1NGo2UU4yeEU0?=
 =?utf-8?B?ZTk3NHNrNENTMEVRc0VtenBiaHFvd1ZJYlFBRVlhZHM1QzFMSy9jV3E5QjFr?=
 =?utf-8?B?MjcvZis5ZGdzNlVIVnJmYXdVUzcycG84YWJIYndvUWdHQjA5Wi9RaTdURWYr?=
 =?utf-8?B?UWlDOThteVdMcGdNdTczUno2Y3laWW04OHFDcTU5NllYaUdhNXp4RXo0TS9M?=
 =?utf-8?B?b0NxN25QQUhvNkwvWWYwK2FWTHJCbWNlNzR4UUplQ2FHLzJDZUV1ZWs5dTFz?=
 =?utf-8?B?ZUVPdUZSTE9sYnZXTTkzbmYyUWUySDNNS05Xck1hKzN1VWJNbWVsdDFsY2dW?=
 =?utf-8?B?NnRjdWRmdWRRUTRBNnVEK0JXR043ekhTM3ZlbEJpeFZzbndZQVkvaVE2Smho?=
 =?utf-8?B?cjZ3U1B3d3VrZ1d1VzNOZDdNN2RGNnl1L2dkK1JQU2tBYmpWK1JRenMvYzND?=
 =?utf-8?B?MG4wMHNCZnhpNWlPdDdrbWUxdnRLSUg0Zk9yTldhL2JldEpGaWY0cWpYY2Qx?=
 =?utf-8?B?Um9za0ViWUd4V0QyZUg5SkFJd3dLc2NxbGZmKy96WmtqQ2tGSysvdks4TXpU?=
 =?utf-8?B?bEZjeU1MT0VaZ0g3dFppa1EvbzlWc25UNlk1ZExNR3RvcCtLZE5zd1ZjZ2pE?=
 =?utf-8?B?WExwSlJXbkNVRDB2M3UzZ1N6ZTNDa0NNSEkwemkvMGJ3TkxLZzVBckRmcE5U?=
 =?utf-8?B?ZWVHMExPR0ZNUVRaaFdhc3NwZjhZbDRhS1dhNlpNWCtQRkl6MjB3aklQZkI1?=
 =?utf-8?B?eUZmK2RzV0VUWWJxYTdxeklnNnRTQTh2Y2tMNnUwOWJYcytuWDlMbXdsNHFB?=
 =?utf-8?B?ZnRwZmhHczIyYTAxUm0vT1FxellscnpSZU41SUQ1d1QwUTJkZkJhSjE5MmRu?=
 =?utf-8?B?NkdrekdOQzdPdElyV1h2SEhFWTNEVDZJSFJSajlhcnRyN0ZjRFNtUGMwbzhu?=
 =?utf-8?Q?WD38wvSLU3uJdIWRgVdbTw0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YjFQVEZqS1o4UmFDS0FYYi9qNm1TSWs3U3kwMkRtQklrb21wNTdZdDFoNVNM?=
 =?utf-8?B?OW1tTXhBSkJQL2lJWmxicEJxRjU0ZEM0KzFqeHRuSHp0dzlIS01yMFZ6cHVS?=
 =?utf-8?B?MkRGYTJRc3pENGp6RFEzaWZGZHBhc01Rb3BPSzE2eHdsNGhBaHBoT0lXNGd3?=
 =?utf-8?B?YjQ1TW9aNFV6U0oxSHFCTGUzWC9QWWdUMHlIa09DYnh4Z2dUUXlPeUlRNzR2?=
 =?utf-8?B?V0xySjVlZFFJWUx4Y24vQk1MOXViTFd4RkJ3RW14VHdWeFZ2YlJ0d1F5Z0Iz?=
 =?utf-8?B?L2xNcnBXc3BxVTNZZEFLd3o0eTlncSs0ZG5aci82UytBZEZ4RjNVZUhJYk90?=
 =?utf-8?B?VkR2ZTZKb09xTzRkK2Q2eVJvMFRZUTR4RG45VWt5RXFmRlJSOUNzNmUrVURw?=
 =?utf-8?B?Ri9VRjIrTVVCTjNuVktQTnB6M0hnbXdoYXVOMjMzK2pTVTRGa1BZckZrOE5P?=
 =?utf-8?B?Q2pYMjZ2dnNoY2dRRWxoemxPdnhLSDVFUHRQOGswZlprL29pV1FEVER3MHZC?=
 =?utf-8?B?ZnNnZ2N1QU1hNGxoMEVwbjRXZElGWStHUGR2UEtvRnJCN0R1dXhkOUZObFZv?=
 =?utf-8?B?Yk9VZSt2NnBrL3pocGRSQ25BV2JQcnM1YTF1eElBTlN6N0JKOW8yaVI5UERa?=
 =?utf-8?B?TjNVazB1UWtRcmdOaVpySng2VVAwWmdTWjgyZ1BBcVAyZXFrZ2JhcmRBd0xT?=
 =?utf-8?B?MHVucjRKV2dlbUpJK0gvbXoyRllGeHpYNFVEM0kyZGxPZGxBbmZNY2VnY1dO?=
 =?utf-8?B?eXNLWURVU3BSaURScWs1ZHcxNys1cnlnNmFkVGRrM2w2YTNQNXlqUGdPeUIz?=
 =?utf-8?B?eWVCbTZpTVE0WXdhY3l0b1kwMDB5c2hkOGRrNDExU2xsdU1McmwzNXV5ZmNq?=
 =?utf-8?B?UGxKQkM1MEJkMk5vbWtFVWdrSmdzL3c3SWhkRUtubE1xVkpkZUkwYmtrblJx?=
 =?utf-8?B?bjJib0h3WmlsbVBLYmR3aG11T2NTbEo2NDBDaXNhelRTWnNRbFNUNE5SNll5?=
 =?utf-8?B?VS9qYnlxcmdQS29KSXNtOVBtSHo1eDFEQml1SWIxYjFtbFpzTDFnanFoMFNo?=
 =?utf-8?B?OHlmbGRuRGVlVnJmaUEyL2pCalFvbWQ4QTMyaHQwNy9ORGRodUJLZFRjYmpp?=
 =?utf-8?B?d1BRWTBYb1ZOQ3ZRQ1libGxNTnVuZzVtVitLZXEvSERXQjBDalFsb0xIV0pq?=
 =?utf-8?B?bnd0Zk9FazBxTU0xWkdtck5PTHIzak5pMXU0M2Fmelo1UkxhNCtkVHJob0VV?=
 =?utf-8?B?bkZUeEo5UlpPWU1Pa0lRTWVCSDQra0Zmczcrak5hUEE2enJNL0F6VVJNOFRS?=
 =?utf-8?B?bnU3b2dvZ1pPWllkWDVtc3RWaTFJQVZONk1GbFFXVGZqVTh2THQ3RS9kbTg5?=
 =?utf-8?B?eE44MVVZb051cy9hU3lMRjZOeVEyaG5tLzhHRnVWQXNkM0dEQVZFekM5aXFz?=
 =?utf-8?B?cGpoTFRHMXg3Z0FSQXJwbnFCaHJQSFVuS0pldHU1UkMrVVFXcGtxQkdtZ3E0?=
 =?utf-8?B?TE9LREJudWVBcmdOOWFPb1NkQlU5eDBnY2xBa1lsdHpFbncwdmZqQm9DY3U3?=
 =?utf-8?B?cUFaeEIxZm52cGFFSkdBbkk3VVowTy9OTjk3bllsZG0zWC9Ib29RRU1XYzdy?=
 =?utf-8?B?SHZtdDI0NlNTWjM2WHMvOVFvUWR1N2hlSEp0Wm1weU5hRU9iUWUwZVg3UUxy?=
 =?utf-8?B?djJQUWZPODdOZ1VFaVRFbW1kMFAwcnNPam5hTE0zeldHa1NBc2VqYnp2NGlq?=
 =?utf-8?B?YjJlWjZjVURQRmRDdHRhck1zVVdudVF1UkdQL3VuL0R6SnNOU0U1di9MM25h?=
 =?utf-8?B?M1ptY3FnempYRG12ZXJQdHZ0Q1U3Z2VrYXVKWFNUUkgxVXl4cmpZc2tWVXJV?=
 =?utf-8?B?YWl2SnRxbFJiR3dPTGRzaHBjZGlaVE1yVnQrSVhONDhjQjJFSHR5eE0wZWtj?=
 =?utf-8?B?YzJ2VDJnQ0JoTGt1V2NXcE5CdkVsalpsWWlVa09Uelh3Q2Z5cnlBQkt4NGJN?=
 =?utf-8?B?OWoxTm1aVXgzKy9XbkRSLzI0cThaVHlQRmxFL1ZDZVYzWmFJQkhLQUVQQ3Bp?=
 =?utf-8?B?cHVOVWZWMjdJVTN1N3JGMC9zZmpnblJRZXNzUmk4cmkva04vSk9lZFVITHJD?=
 =?utf-8?B?N1FkMkdReHJ3SjJJcC9aVm01UmQvOE1TRkU0eW84SGhJRzBEUzBtditvZy9U?=
 =?utf-8?B?OGEvZXNVdnVEb09SanFLOXBDdXQ2d0pMcGxxMGtFVW5peURlTS9CZC9VaEJM?=
 =?utf-8?B?MUkyNk4wMEV0Tlg0SjRvQ2p2TzFCUVV0MlVsQ2huaWtKYzZJWmR5MWFPNDNQ?=
 =?utf-8?B?SWM1QnhodkF5QWl4Q2JNN2trSnN3OFdoM3JuWEZwZU1SQk4zMXdvaERYN202?=
 =?utf-8?Q?VeuOOOmxPTvBQo3k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE37FD52232AA14BBDE91C9BB017653A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be0326f-270a-4262-10eb-08de631f1e34
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 12:24:03.4725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 12mrXBNWCUymNXz8FVcZZUJ7MaQHUF1rdZfkVdcFch/xOnpjYgBYxb4tvU9hYvBOrzL7O74iy8P+M3vChlRXTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9257
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:xen-devel@lists.xenproject.org,m:xakep.amatop@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,kernel.org,xen.org,amd.com,epam.com,citrix.com,vates.tech,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C88C5D8F92
X-Rspamd-Action: no action

T24gMDMuMDIuMjYgMTI6MDEsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+IEhpIE15a3l0YSwN
Cj4gDQo+IFdlIGhhdmUgYSBudW1iZXIgb2Ygc2VyaWVzIGZyb20geW91IHdoaWNoIGhhdmUgbm90
IGJlZW4gbWVyZ2VkIHlldCBhbmQNCj4gcmV2aWV3aW5nIHRoZW0gYWxsIGluIHBhcmFsbGVsIG1p
Z2h0IGJlIGNoYWxsZW5naW5nLg0KPiANCj4gV291bGQgeW91IG1pbmQgZ2l2aW5nIHVzIGEgc3Rh
dHVzIGFuZCBtYXliZSBwcmlvcml0aWVzIG9uIHRoZW0uDQo+IA0KPiBJIGNvdWxkIGxpc3QgdGhl
IGZvbGxvd2luZyBzZXJpZXM6DQo+IC0gR0lDdjQNCj4gLSBDUFUgSG90cGx1ZyBvbiBhcm0NCj4g
LSBQQ0kgZW51bWVyYXRpb24gb24gYXJtDQo+IC0gSVBNTVUgZm9yIHBjaSBvbiBhcm0NCj4gLSBk
b20wbGVzcyBmb3IgcGNpIHBhc3N0aHJvdWdoIG9uIGFybQ0KPiAtIFNSLUlPViBmb3IgcHZoDQo+
IC0gU01NVSBmb3IgcGNpIG9uIGFybQ0KPiAtIE1TSSBpbmplY3Rpb24gb24gYXJtDQo+IC0gc3Vz
cGVuZCB0byByYW0gb24gYXJtDQo+IA0KPiBUaGVyZSBtaWdodCBiZSBvdGhlcnMgZmVlbCBmcmVl
IHRvIGNvbXBsZXRlIHRoZSBsaXN0Lg0KPiANCj4gT24gR0lDdjQuLi4NCj4gDQo+PiBPbiAyIEZl
YiAyMDI2LCBhdCAxNzoxNCwgTXlreXRhIFBvdHVyYWkgPE15a3l0YV9Qb3R1cmFpQGVwYW0uY29t
PiB3cm90ZToNCj4+DQo+PiBUaGlzIHNlcmllcyBpbnRyb2R1Y2VzIEdJQ3Y0IGRpcmVjdCBMUEkg
aW5qZWN0aW9uIGZvciBYZW4uDQo+Pg0KPj4gRGlyZWN0IExQSSBpbmplY3Rpb24gcmVsaWVzIG9u
IHRoZSBHSUMgdHJhY2tpbmcgdGhlIG1hcHBpbmcgYmV0d2VlbiBwaHlzaWNhbCBhbmQNCj4+IHZp
cnR1YWwgQ1BVcy4gRWFjaCBWQ1BVIHJlcXVpcmVzIGEgVlBFIHRoYXQgaXMgY3JlYXRlZCBhbmQg
cmVnaXN0ZXJlZCB3aXRoIHRoZQ0KPj4gR0lDIHZpYSB0aGUgYFZNQVBQYCBJVFMgY29tbWFuZC4g
VGhlIEdJQyBpcyB0aGVuIGluZm9ybWVkIG9mIHRoZSBjdXJyZW50DQo+PiBWUEUtdG8tUENQVSBw
bGFjZW1lbnQgYnkgcHJvZ3JhbW1pbmcgYFZQRU5EQkFTRVJgIGFuZCBgVlBST1BCQVNFUmAgaW4g
dGhlDQo+PiBhcHByb3ByaWF0ZSByZWRpc3RyaWJ1dG9yLiBMUElzIGFyZSBhc3NvY2lhdGVkIHdp
dGggVlBFcyB0aHJvdWdoIHRoZSBgVk1BUFRJYA0KPj4gSVRTIGNvbW1hbmQsIGFmdGVyIHdoaWNo
IHRoZSBHSUMgaGFuZGxlcyBkZWxpdmVyeSB3aXRob3V0IHRyYXBwaW5nIGludG8gdGhlDQo+PiBo
eXBlcnZpc29yIGZvciBlYWNoIGludGVycnVwdC4NCj4+DQo+PiBXaGVuIGEgVlBFIGlzIG5vdCBz
Y2hlZHVsZWQgYnV0IGhhcyBwZW5kaW5nIGludGVycnVwdHMsIHRoZSBHSUMgcmFpc2VzIGEgcGVy
LVZQRQ0KPj4gZG9vcmJlbGwgTFBJLiBEb29yYmVsbHMgYXJlIG93bmVkIGJ5IHRoZSBoeXBlcnZp
c29yIGFuZCBwcm9tcHQgcmVzY2hlZHVsaW5nIHNvDQo+PiB0aGUgVlBFIGNhbiBkcmFpbiBpdHMg
cGVuZGluZyBMUElzLg0KPj4NCj4+IEJlY2F1c2UgR0lDdjQgbGFja3MgYSBuYXRpdmUgZG9vcmJl
bGwgaW52YWxpZGF0aW9uIG1lY2hhbmlzbSwgdGhpcyBzZXJpZXMNCj4+IGluY2x1ZGVzIGEgaGVs
cGVyIHRoYXQgaW52YWxpZGF0ZXMgZG9vcmJlbGwgTFBJcyB2aWEgc3ludGhldGljIOKAnHByb3h5
4oCdIGRldmljZXMsDQo+PiBmb2xsb3dpbmcgdGhlIGFwcHJvYWNoIHVzZWQgdW50aWwgR0lDdjQu
MS4NCj4+DQo+PiBBbGwgb2YgdGhpcyB3b3JrIGlzIG1vc3RseSBiYXNlZCBvbiB0aGUgd29yayBv
ZiBQZW5ueSBaaGVuZw0KPj4gPHBlbm55LnpoZW5nQGFybS5jb20+IGFuZCBMdWNhIEZhbmNlbGx1
IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+LiBBbmQgYWxzbyBmcm9tDQo+PiBMaW51eCBwYXRjaGVz
IGJ5IE1hcmsgWnluZ2llci4NCj4+DQo+PiBTb21lIHBhdGNoZXMgYXJlIHN0aWxsIGEgbGl0dGxl
IHJvdWdoIGFuZCBuZWVkIHNvbWUgc3R5bGluZyBmaXhlcyBhbmQgbW9yZQ0KPj4gdGVzdGluZywg
YXMgYWxsIG9mIHRoZW0gbmVlZGVkIHRvIGJlIGNhcnZlZCBsaW5lIGJ5IGxpbmUgZnJvbSBhIGdp
YW50IH40MDAwIGxpbmUNCj4+IHBhdGNoLiBUaGlzIFJGQyBpcyBkaXJlY3RlZCBtb3N0bHkgdG8g
Z2V0IGEgZ2VuZXJhbCBpZGVhIGlmIHRoZSBwcm9wb3NlZA0KPj4gYXBwcm9hY2ggaXMgc3VpdGFi
bGUgYW5kIE9LIHdpdGggZXZlcnlvbmUuIEFuZCB0aGVyZSBpcyBzdGlsbCBhbiBvcGVuIHF1ZXN0
aW9uDQo+PiBvZiBob3cgdG8gaGFuZGxlIFNpZ25lZC1vZmYtYnkgbGluZXMgZm9yIFBlbm55IGFu
ZCBMdWNhLCBzaW5jZSB0aGV5IGhhdmUgbm90DQo+PiBpbmRpY2F0ZWQgdGhlaXIgcHJlZmVyZW5j
ZSB5ZXQuDQo+IA0KPiBJIHdvdWxkIGxpa2UgdG8gYXNrIGhvdyBtdWNoIHBlcmZvcm1hbmNlIGJl
bmVmaXRzIHlvdSBjb3VsZA0KPiBoYXZlIHdpdGggdGhpcy4NCj4gQWRkaW5nIEdJQ3Y0IHN1cHBv
cnQgaXMgYWRkaW5nIGEgbG90IG9mIGNvZGUgd2hpY2ggd2lsbCBoYXZlIHRvIGJlIG1haW50YWlu
ZWQNCj4gYW5kIHRlc3RlZCBhbmQgdGhlcmUgc2hvdWxkIGJlIGEgZ29vZCBpbXByb3ZlbWVudCB0
byBqdXN0aWZ5IHRoaXMuDQo+IA0KPiBEaWQgeW91IGRvIHNvbWUgYmVuY2htYXJrcyA/IHdoYXQg
YXJlIHRoZSByZXN1bHRzID8NCj4gDQo+IEF0IHRoZSB0aW1lIHdoZXJlIHdlIHN0YXJ0ZWQgdG8g
d29yayBvbiB0aGF0IGF0IEFybSwgd2UgZW5kZWQgdXAgaW4gdGhlIGNvbmNsdXNpb24NCj4gdGhh
dCB0aGUgY29tcGxleGl0eSBpbiBYZW4gY29tcGFyZWQgdG8gdGhlIGJlbmVmaXQgd2FzIG5vdCBq
dXN0aWZ5aW5nIGl0IGhlbmNlIHdoeQ0KPiB0aGlzIHdvcmsgd2FzIHN0b3BwZWQgaW4gZmF2b3Ig
b2Ygb3RoZXIgZmVhdHVyZXMgdGhhdCB3ZSB0aG91Z2h0IHdvdWxkIGJlIG1vcmUNCj4gYmVuZWZp
Y2lhbCB0byBYZW4gKGxpa2UgUENJIHBhc3N0aHJvdWdoIG9yIFNNTVV2MykuDQo+IA0KPiBDaGVl
cnMNCj4gQmVydHJhbmQNCj4gDQoNCkhpIEJlcnRyYW5kDQoNCkN1cnJlbnQgcHJpb3JpdGllcyBh
cmU6DQoNCi0gQ1BVIGhvdHBsdWcNCi0gU3VzcGVuZCB0byBSQU0NCi0gR0lDdjQgKHdlIHdpbGwg
Zm9sbG93IHVwIHdpdGggYmVuY2htYXJrcykNCi0gU1ItSU9WDQoNCg0KTVNJIGluamVjdGlvbiwg
ZG9tMGxlc3MgZm9yIHBjaSBhbmQgUENJIGVudW1lcmF0aW9uIGFyZSBsb3cgcHJpb3JpdHkgZm9y
IG5vdw0KDQpTdXNwZW5kIHRvIFJBTSBpcyBoYW5kbGVkIGJ5IE15a29sYSBLdmFjaA0KDQpTTU1V
IGFuZCBJUE1NVSBzdXBwb3J0IGFyZSBtZXJnZWQgYWxyZWFkeSBBRkFJVQ0KDQotLSANCk15a3l0
YQ==

