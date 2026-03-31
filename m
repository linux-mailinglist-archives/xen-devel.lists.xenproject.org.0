Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAkoL/Moy2n8EQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E3B36330F
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 03:52:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268221.1557527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OGo-0007qP-Pd; Tue, 31 Mar 2026 01:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268221.1557527; Tue, 31 Mar 2026 01:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7OGo-0007nP-IR; Tue, 31 Mar 2026 01:51:54 +0000
Received: by outflank-mailman (input) for mailman id 1268221;
 Tue, 31 Mar 2026 01:51:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1w7OGm-0007nJ-Ov
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 01:51:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7OGl-000oDK-0v
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 03:51:51 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb288a-e002-0a2a0a5209dd-0a2a4506a066-24
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:51:50 +0200
Received: from [52.101.66.109]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <milan_djokic@epam.com>)
 id 69cb28b6-3034-0a2a45060019-3465426d3ab7-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 03:51:50 +0200
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com (2603:10a6:803:c2::20)
 by PAWPR03MB9202.eurprd03.prod.outlook.com (2603:10a6:102:342::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:51:48 +0000
Received: from VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30]) by VI1PR03MB5088.eurprd03.prod.outlook.com
 ([fe80::8471:b7dd:8a1c:c30%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:51:48 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iEo0ZPjJYR3BxdblNM13gx19TrALIerrTcr/k846edYuaBBgupePmSXTl4tqJfTArTu8OiyWj+TKmuGN127vvEWcgJQ1H5SlkvFPMirLaSk3iW6GEkPA6xzmFjtg50kX4NJ54QlBUdoP6gpx2maig3iWFGB4DX38WMv6WP1fuzO9L5g1WPxDR+L/YsC/AU9CXhV02Oye/fupmZMDHLRxeGNVnuwtU2IaG2uozsFJfpWz/da8a5AgqgjFys7uqTndfPczuTQBZPxrlLcC2g09KMKkPOOv3OUZbs1fFZl112ovpDuVl63Y3u1qMc0P7MYWj6cQhvWoDcRoRohcC7WdXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1V4lSzQ+oc1K0UJmqyacChxdIgp0F4+8wJdNEg6E2TQ=;
 b=pVXjCfdWpC9oIZZ0fIrJDPsvnP11yTD8h2FuhVfNqaFigw39OJcUxbap4TZLVb0Dmk775YZLMHpgJDvKm+5BC5swkGZpqcg9llk6lPLSwYCY8rOOzc0oEf9atzEbTTTh54sp0QquMM/KbNFuXscA0Xc1KsZR9jDAH7RH1A+eLLDpgDKvOHlY1LGYtBPJjLX/PuRbUGt70w5ZIGYtSZlOI1Er4m4EPd6bOPdLrRJR4/SQFO/P77yyvrlYWre5onaN0uSPoCOzXeuG082qSQCvSD3OGYf9ibIkW2tJNggI1A4II7qykS4Ig58fJGWO5yFDaWOR3BCA/GpRm75PkdMOMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1V4lSzQ+oc1K0UJmqyacChxdIgp0F4+8wJdNEg6E2TQ=;
 b=F0XTam0b05FCBlLK4xCtN3eRViJBuqdDy/zu42tq9xlfMoQiniXdf3md4+C5tro0nmgtvj9xjktybxnNsKqBozAounBSXY9A1gIzpfCiVzcZxvvY1MkGdku+wKMpO/GjzzRzc2XY5VXL38uh1u6+3uwrHVMfhxV/u4yEyROLh+jyl2K1u1mZUbHlPsBinhHyhoJABU4rg+hYRK4Rngx9417Y0MWv3RTfaEiIgz2btNVyL3v7PT/VRDogAffIhEObrpJM3X1W4p3O1bhtnKOEvBtw8h1uGvlfoggul93iN27vrl4SgmL20MGd4CxNAm6MNu5XMp9eYG/WgZZQQwB7lw==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Milan Djokic <milan_djokic@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Nick Rosbrook
	<enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>, Juergen Gross
	<jgross@suse.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v3 00/23] Add SMMUv3 Stage 1 Support for Xen guests
Thread-Topic: [PATCH v3 00/23] Add SMMUv3 Stage 1 Support for Xen guests
Thread-Index: AQHcwLDvq2DoOU/dgEydgvmFX6euvA==
Date: Tue, 31 Mar 2026 01:51:48 +0000
Message-ID: <cover.1774918270.git.milan_djokic@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
In-Reply-To: <cover.1774305918.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB5088:EE_|PAWPR03MB9202:EE_
x-ms-office365-filtering-correlation-id: 447d46bc-5641-4d7b-472f-08de8ec8121b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 Z8OcQ0k4uIQvQcG5yNREHkocHMdKExTQPtR4DwzBGGoseU3DX+xLJAoszvAAX15n5oYPilZhP56M4Y6hhQC1y+37E339xvMHCfTTSEuvmNAiqJZfQCuEUJwDLMhWlXj9bMu1m+jQTPbtdYtMVasxu2rkkqwMBWJibnNvwg3xMUDRUZMMJTPgKo0mpDwpagPSZmJJErpiS9iQXEuauXKo3GOmlUbomuTiQpd77ZuXS3q6AnslxfkH/jgbbTOyCLTzW58gh4ymBDnQmTGCrZTcjXwr4ZFssCvAVUNGy6Cqd3pg/lFcovjt4tpfIDmmSqZvKg7DwivEwILB//H9PeZUwECdqJfFlg9CJtSSao0/8nCdB4q9UMaob2W01nGmt7wSgFWIeZLSfo1i5K4fbN7XBinwAVXl5VmiILDVliBeU/jzP+mdskb37sH+fTtJ9JJlEJ7AojKrEAivrQY6eXJgA2Mf2lUjhr+1vPq2/a/fnwQOXq4/14AYZPG4yOxurl6/vvBx4MFOXKrHSi1cOqkLC1TwDT805LcyXYa3Z+ykjBgPsphgyLoTx/mRQ2Td9Z0uqVF3e9o5lNbCXB/ebQPiHVVFJvjW4pE6SNQf4ZLWl6up7glp8j2EIcrlF1tFq+284QXVt9+MJabOIdCj2fEIWpWywCCz/BOdZ76TAbOEjD6lodPaadlvSYMAve0FBOBWKpapuvfxp5eC/aSwE5o9KA5w4ycTZd84nkLPl6A6GxvLQQq8dhUqzgcDJ42DV3BrHH0ZtiILvx0CyEIYQlD9IvTqnzYCy3PFmdyBwcf2myo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB5088.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WVlVQU9vamlvTlc3VE10ZjJCK0NSeHBDMHA5NDJybTN4WFM5WGNWRDBUME5T?=
 =?utf-8?B?N2tuQU0vcktuSUhTQXdIQWFORm4yKzljZXFRQWxGaEJvWnVtaUVla2lrYXFk?=
 =?utf-8?B?ZU4yVGZuS3VOTSsyWUxjTVp5YWdvaU55cjh1V29rd3U4OXNjR2FKV01TSEJh?=
 =?utf-8?B?RndlU09GWXc3dHNsR285VGpCOFpUbWRXOW1ZU2liS3B5NG9DNjNiQzBNNUJY?=
 =?utf-8?B?UmJrbmV0QjBXVXdLQ0M3aXg4MFd3M01QWGJWUEg5L25YTXorRTJNcTBRUy9t?=
 =?utf-8?B?VVp1V1BHVG1VNEU4TGE0TzJtZFFGYUY5eTl3KzlBQll4eUJpelFmcUcrckhp?=
 =?utf-8?B?aFR1SWdYVUgrb0JKV2pqQ0s5S2kxMjRrMm8wNjI5eGhHYzQzdzZXOThFVWls?=
 =?utf-8?B?NVZNMXFIc09WRXhlYkZFNUxja0laSEtGZXlMN2ZMQlR6ME9HVGFOMHdUQldL?=
 =?utf-8?B?NjlxTWdOWGVBa1haM296dGQ1YWpWS1JESUU1REdZQjQ3RTJLWit5ell1NU5Y?=
 =?utf-8?B?R1ZRWXQ3a2pLclBIL1ZnSHBZNE5ZVndKUUNxTW9iRlJKV1Uvam1LRW03SmVS?=
 =?utf-8?B?S21aRVk1VlVFYVFIcFA4WUZvQmJ6UVZTejFiY3ExZGhoVk9JSlFxbXZDd3NV?=
 =?utf-8?B?Tm1WaTAvSjMzTWNLdmRyRFVXRzh1c01HWkM3Skl2WktKelhVTVd1WkYrK1dp?=
 =?utf-8?B?UTg2WTFXZFdBZlVFeW45NzRoTGlreCtad0hlU2Z2eG0vQVUxZ2RPbFFOK1dk?=
 =?utf-8?B?SEU4aXJnYldPY1RiZXVqdnNCeVRleE1GZG9oZFg0WVUwaXlBbVY1ZjJnYStL?=
 =?utf-8?B?SE5HbkE5d0hHZnk3TWVZUGVVN2xGaU1hbHBTRHpxK0J0NjBmWmRyQ0ptWjFW?=
 =?utf-8?B?dDA5cmZzeGRwNkpOaDhkUmVDWGdyenNueUUrUVNBUHlJUUs0UzlPemkrSGZq?=
 =?utf-8?B?OWpWbktmTkJ6VjdxVkZxa3YvNTZGZkdiNkR1RTZIMDAyZ1BzbGhkWWUwWDVz?=
 =?utf-8?B?QzJtYlhySXlvbkxJZ3lScGl0WXZqcXRJblRkdWFzdjF4UW1uSC9BSXlSL0k3?=
 =?utf-8?B?QW5TVEJVOXFkOTBRMHVXS29xS3d2M3RINWIxalpTR09VVnJGNnVXd3dianNn?=
 =?utf-8?B?b1AzQlBxekJyTEJTbGhwdFBLK2VBcDZDMWpZRVg2ZnB0MmNoK1pueTBvWUgw?=
 =?utf-8?B?Qm1EUS9xdkovK01XSmVRY0VLUDZIRHErbVdld0E0dkQreTVRUmpqTERmaVdV?=
 =?utf-8?B?eFFpSWVCaG5ubGRUbER5RUd0MWo1Yk1YcEpFcGVKY2dNRnFFbXJMbVR0eFV4?=
 =?utf-8?B?ZGdvWElUMXdrRWo5T2xicFo1K0Q4RFVRMlIzZlA3Y0JyZWZFRVRvc0tOdFdo?=
 =?utf-8?B?bkFZZk1laklzUys1bEpxWjZCNE5zZDFTNnNoZnQvcmF3OUZzdFE3TVJkcFh1?=
 =?utf-8?B?OS9jTGhyUVNlQWxmd3EyVEVkaGFWSmFPU0dEeHhKMytKZzBLcWFXNEFSeVpZ?=
 =?utf-8?B?RXNQWVRzd3d5TnZOSHZhUVFjM3lqdFZtUThhWDQ2cHo3dmRibStERFQydVdD?=
 =?utf-8?B?bitRc2JVZ2JveWZocWFGUyt5cFFmZnRTTWVJdHpWVXl5c3E3clBtWUpFT0o5?=
 =?utf-8?B?Vk1BTGtwdU9WUUVDTG96UzhlZE40UnI0RE9zV1FMWXNveTdzbzZGSHF5UTls?=
 =?utf-8?B?cGxTcHRCMzM1TTEvL3d2S1VlYUwyb21MWmd6eWo2b01Oem9wdmtTb3Nrb3hE?=
 =?utf-8?B?cERXVXFJUTNxc202ZDBXc2o4TUt6bWd5N3JaVTg1dTVjVk80WWpVZ05WNi9s?=
 =?utf-8?B?dE1HRmpzSWFmeFF3MFNBaDVUL3VwQnFCUEU2ODgvWStWWjZNZUZERU5rdzNj?=
 =?utf-8?B?Mmw0djVYUzJhN0pxVUZPN1U0NWhEaHBocWJudVlCYjdFenZyak8zUFhCd2Vk?=
 =?utf-8?B?a2N4Z3pGRmxicjRNMXZBUGZ6SFlHRlZiK2FObnNJVHJTRnhWclVINWkwbThp?=
 =?utf-8?B?RDVJandGMkRQQnNmSWVIZkJRUGM4NW1jV0YyREZ3ZmJ1amd3dW9xdzkvNzYz?=
 =?utf-8?B?VGd4d1lrcUJEa3RiajZNWTNKY0txVFA2c2ZTdzFZbXZJZlV5dWk4akxML3hq?=
 =?utf-8?B?S0lpQVBCMGthUHlJQTdHUEkrWWxRYThvbEtETnhJaVJvSzh4R1Qyc1NaclVO?=
 =?utf-8?B?Q3BXZk03UTNlS0dtL2xHU3IwMG90V1RQNmtNT0tvQ0F2VC83K2ZFMFZGVTc3?=
 =?utf-8?B?d3NFVWg3UmNHQS9xSXpSYzc0M2YrSUhBM3draXdDREkwZkxCSGhpQlpESGJu?=
 =?utf-8?B?SkhrQWN1dG1FQ0pscjBYRFVuZktaanBHMG9CS2ZBQ0VkcDlWVzVPdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E59AF8B5C7BF84FA02C71C8A65CAC40@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB5088.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 447d46bc-5641-4d7b-472f-08de8ec8121b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 01:51:48.1555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O/DdulF7JoIzS0/pSPHbHxCiwG/OqL+9vd+cqRY3fk62XaXu57H+z/Tb9ev4Z9SS5PpJDdbJrULCMQorOTB4Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9202
X-purgate-ID: tlsNG-16d1c6/1774921910-787801C2-BDBD1400/0/0
X-purgate-type: clean
X-purgate-size: 8126
X-Spamd-Result: default: False [-0.09 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:milan_djokic@epam.com,m:bertrand.marquis@arm.com,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:enr0n@ubuntu.com,m:gwd@xenproject.org,m:jgross@suse.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[milan_djokic@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 50E3B36330F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VGhpcyBwYXRjaCBzZXJpZXMgcHJvdmlkZXMgZW11bGF0ZWQgU01NVXYzIHN1cHBvcnQgaW4gWGVu
LCBlbmFibGluZyBzdGFnZS0xDQp0cmFuc2xhdGlvbiBmb3IgdGhlIGd1ZXN0IE9TLg0KDQpTdGFn
ZSAxIHRyYW5zbGF0aW9uIHN1cHBvcnQgaXMgcmVxdWlyZWQgdG8gcHJvdmlkZSBpc29sYXRpb24g
YmV0d2VlbiBkaWZmZXJlbnQNCmRldmljZXMgd2l0aGluIE9TLiBYZW4gYWxyZWFkeSBzdXBwb3J0
cyBTdGFnZSAyIHRyYW5zbGF0aW9uIGJ1dCB0aGVyZSBpcyBubw0Kc3VwcG9ydCBmb3IgU3RhZ2Ug
MSB0cmFuc2xhdGlvbi4gVGhlIGdvYWwgb2YgdGhpcyB3b3JrIGlzIHRvIHN1cHBvcnQgU3RhZ2Ug
MQ0KdHJhbnNsYXRpb24gZm9yIFhlbiBndWVzdHMuDQoNClRoaXMgcGF0Y2ggc2VyaWVzIHJlcHJl
c2VudHMgYSBjb250aW51YXRpb24gb2Ygd29yayBmcm9tIFJhaHVsIFNpbmdoOg0KaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3hlbi1kZXZlbC9jb3Zlci9jb3Zlci4xNjY5ODg4
NTIyLmdpdC5yYWh1bC5zaW5naEBhcm0uY29tLw0KT3JpZ2luYWwgcGF0Y2ggc2VyaWVzIGlzIGFs
aWduZWQgd2l0aCB0aGUgbmV3ZXN0IFhlbiBzdHJ1Y3R1cmUsIHdpdGggdGhlIGFkZGl0aW9uDQpv
ZiB0cmFuc2xhdGlvbiBsYXllciB3aGljaCBwcm92aWRlcyAxOk4gdklPTU1VLT5wSU9NTVUgbWFw
cGluZywgaW4gb3JkZXIgdG8NCnN1cHBvcnQgcGFzc3Rocm91Z2ggb2YgdGhlIGRldmljZXMgYXR0
YWNoZWQgdG8gZGlmZmVyZW50IHBoeXNpY2FsIElPTU1Vcy4NCg0KV2UgY2Fubm90IHRydXN0IHRo
ZSBndWVzdCBPUyB0byBjb250cm9sIHRoZSBTTU1VdjMgaGFyZHdhcmUgZGlyZWN0bHkgYXMNCmNv
bXByb21pc2VkIGd1ZXN0IE9TIGNhbiBjb3JydXB0IHRoZSBTTU1VdjMgY29uZmlndXJhdGlvbiBh
bmQgbWFrZSB0aGUgc3lzdGVtDQp2dWxuZXJhYmxlLiBUaGUgZ3Vlc3QgZ2V0cyB0aGUgb3duZXJz
aGlwIG9mIHRoZSBzdGFnZSAxIHBhZ2UgdGFibGVzIGFuZCBhbHNvDQpvd25zIHN0YWdlIDEgY29u
ZmlndXJhdGlvbiBzdHJ1Y3R1cmVzLiBUaGUgWGVuIGhhbmRsZXMgdGhlIHJvb3QgY29uZmlndXJh
dGlvbg0Kc3RydWN0dXJlIChmb3Igc2VjdXJpdHkgcmVhc29ucyksIGluY2x1ZGluZyB0aGUgc3Rh
Z2UgMiBjb25maWd1cmF0aW9uLg0KDQpYRU4gd2lsbCBlbXVsYXRlIHRoZSBTTU1VdjMgaGFyZHdh
cmUgYW5kIGV4cG9zZSB0aGUgdmlydHVhbCBTTU1VdjMgdG8gdGhlDQpndWVzdC4gR3Vlc3QgY2Fu
IHVzZSB0aGUgbmF0aXZlIFNNTVV2MyBkcml2ZXIgdG8gY29uZmlndXJlIHRoZSBzdGFnZSAxDQp0
cmFuc2xhdGlvbi4gV2hlbiB0aGUgZ3Vlc3QgY29uZmlndXJlcyB0aGUgU01NVXYzIGZvciBTdGFn
ZSAxLCBYRU4gd2lsbCB0cmFwDQp0aGUgYWNjZXNzIGFuZCBjb25maWd1cmUgaGFyZHdhcmUuDQoN
ClNNTVV2MyBEcml2ZXIoR3Vlc3QgT1MpIC0+IENvbmZpZ3VyZSB0aGUgU3RhZ2UtMSB0cmFuc2xh
dGlvbiAtPg0KWEVOIHRyYXAgYWNjZXNzIC0+IFhFTiBTTU1VdjMgZHJpdmVyIGNvbmZpZ3VyZSB0
aGUgSFcuDQoNClRoZSBmaW5hbCBwYXRjaCBzZXJpZXMgY29tbWl0IHByb3ZpZGVzIGEgZGVzaWdu
IGRvY3VtZW50IGZvciB0aGUgZW11bGF0ZWQNCklPTU1VIChhcm0tdmlvbW11LnJzdCksIHdoaWNo
IHdhcyBwcmV2aW91c2x5IGRpc2N1c3NlZCB3aXRoIHRoZSBtYWludGFpbmVycy4NCkRldGFpbHMg
cmVnYXJkaW5nIGltcGxlbWVudGF0aW9uLCBmdXR1cmUgd29yayBhbmQgc2VjdXJpdHkgcmlza3Mg
YXJlIG91dGxpbmVkDQppbiB0aGlzIGRvY3VtZW50Lg0KDQotLS0NCkNoYW5nZXMgaW4gdjI6DQog
LSBVcGRhdGVkIGRlc2lnbiBhbmQgaW1wbGVtZW50YXRpb24gd2l0aCB2SU9NTVUtPnBJT01NVSBt
YXBwaW5nIGxheWVyDQogLSBBZGRyZXNzZWQgc2VjdXJpdHkgcmlza3MgaW4gdGhlIGRlc2lnbiwg
cHJvdmlkZWQgaW5pdGlhbCBwZXJmb3JtYW5jZQ0KICAgbWVhc3VyZW1lbnRzDQogLSBBZGRyZXNz
ZWQgY29tbWVudHMgZnJvbSBwcmV2aW91cyB2ZXJzaW9uDQogLSBUZXN0ZWQgb24gUmVuZXNhcyBS
LUNhciBwbGF0Zm9ybSwgaW5pdGlhbCBwZXJmb3JtYW5jZSBtZWFzdXJlbWVudHMgZm9yDQogICBz
dGFnZS0xIHZzIHN0YWdlLTEtbGVzcyBndWVzdHMNCi0tLQ0KDQotLS0NCkNoYW5nZXMgaW4gdjM6
DQogLSBCdW1wIGRvbWN0bCB2ZXJzaW9uLCBhZGRlZCBleHBsaWNpdCBwYWRkaW5nIGZvciB0aGUg
bmV3IGRvbWN0bCBzdHJ1Y3R1cmVzDQogLSBSZW1vdmUgdW5uZWNlc3NhcnkgY2hhbmdlcyBhY2Nv
cmRpbmcgdG8gcmV2aWV3IGNvbW1lbnRzDQogLSBBZGQgIkFSTSIgcHJlZml4IGZvciB2SU9NTVUg
S2NvbmZpZyBvcHRpb25zLCBzaW5jZSBvbmx5IEFSTSBhcmNoaXRlY3R1cmUgaXMNCiAgIHN1cHBv
cnRlZCBhdCB0aGlzIHBvaW50IA0KIC0gUmUtZ2VuZXJhdGUgZ28gY29kZQ0KIC0gQWRkIG1pc3Np
bmcgY29tbWl0IHNpZ24tb2ZmIHRhZ3MNCi0tLQ0KDQpKZWFuLVBoaWxpcHBlIEJydWNrZXIgKDEp
Og0KICB4ZW4vYXJtOiBzbW11djM6IE1haW50YWluIGEgU0lELT5kZXZpY2Ugc3RydWN0dXJlDQoN
Ck1pbGFuIERqb2tpYyAoMyk6DQogIHhlbi9hcm06IHZJT01NVSB2U0lELT5wU0lEIG1hcHBpbmcg
bGF5ZXINCiAgbGlieGwvYXJtOiBJbnRyb2R1Y2UgZG9tY3RsIGNvbW1hbmQgZm9yIElPTU1VIHZT
SUQvdlJJRCBtYXBwaW5nDQogIGRvYy9hcm06IHZJT01NVSBkZXNpZ24gZG9jdW1lbnQNCg0KUmFo
dWwgU2luZ2ggKDE5KToNCiAgeGVuL2FybTogc21tdXYzOiBBZGQgc3VwcG9ydCBmb3Igc3RhZ2Ut
MSBhbmQgbmVzdGVkIHN0YWdlIHRyYW5zbGF0aW9uDQogIHhlbi9hcm06IHNtbXV2MzogQWxsb2Mg
aW9fZG9tYWluIGZvciBlYWNoIGRldmljZQ0KICB4ZW4vYXJtOiB2SU9NTVU6IGFkZCBnZW5lcmlj
IHZJT01NVSBmcmFtZXdvcmsNCiAgeGVuL2FybTogdnNtbXV2MzogQWRkIGR1bW15IHN1cHBvcnQg
Zm9yIHZpcnR1YWwgU01NVXYzIGZvciBndWVzdHMNCiAgeGVuL2RvbWN0bDogQWRkIFhFTl9ET01D
VExfQ09ORklHX1ZJT01NVV8qIGFuZCB2aW9tbXUgY29uZmlnIHBhcmFtDQogIHhlbi9hcm06IHZJ
T01NVTogQWRkIGNtZGxpbmUgYm9vdCBvcHRpb24gInZpb21tdSA9IDxzdHJpbmc+Ig0KICB4ZW4v
YXJtOiB2c21tdXYzOiBBZGQgc3VwcG9ydCBmb3IgcmVnaXN0ZXJzIGVtdWxhdGlvbg0KICB4ZW4v
YXJtOiB2c21tdXYzOiBBZGQgc3VwcG9ydCBmb3IgY21kcXVldWUgaGFuZGxpbmcNCiAgeGVuL2Fy
bTogdnNtbXV2MzogQWRkIHN1cHBvcnQgZm9yIGNvbW1hbmQgQ01EX0NGR0lfU1RFDQogIHhlbi9h
cm06IHZzbW11djM6IEF0dGFjaCBTdGFnZS0xIGNvbmZpZ3VyYXRpb24gdG8gU01NVXYzIGhhcmR3
YXJlDQogIHhlbi9hcm06IHZzbW11djM6IEFkZCBzdXBwb3J0IGZvciBldmVudCBxdWV1ZSBhbmQg
Z2xvYmFsIGVycm9yDQogIHhlbi9hcm06IHZzbW11djM6IEFkZCAiaW9tbXVzIiBwcm9wZXJ0eSBu
b2RlIGZvciBkb20wIGRldmljZXMNCiAgeGVuL2FybTogdklPTU1VOiBJT01NVSBkZXZpY2UgdHJl
ZSBub2RlIGZvciBkb20wDQogIHhlbi9hcm06IHZzbW11djM6IEVtdWxhdGVkIFNNTVV2MyBkZXZp
Y2UgdHJlZSBub2RlIGZvciBkb20wbGVzcw0KICBhcm0vbGlieGw6IHZzbW11djM6IEVtdWxhdGVk
IFNNTVV2MyBkZXZpY2UgdHJlZSBub2RlIGluIGxpYnhsDQogIHhlbi9hcm06IHZzbW11djM6IEFs
bG9jIHZpcnEgZm9yIHZpcnR1YWwgU01NVXYzDQogIHhlbi9hcm06IHZzbW11djM6IEFkZCBzdXBw
b3J0IHRvIHNlbmQgc3RhZ2UtMSBldmVudCB0byBndWVzdA0KICBsaWJ4bC9hcm06IHZJT01NVTog
TW9kaWZ5IHRoZSBwYXJ0aWFsIGRldmljZSB0cmVlIGZvciBpb21tdXMNCiAgeGVuL2FybTogdklP
TU1VOiBNb2RpZnkgdGhlIHBhcnRpYWwgZGV2aWNlIHRyZWUgZm9yIGRvbTBsZXNzDQoNCiBkb2Nz
L2Rlc2lnbnMvYXJtLXZpb21tdS5yc3QgICAgICAgICAgICAgfCAzOTAgKysrKysrKysrKw0KIGRv
Y3MvbWFuL3hsLmNmZy41LnBvZC5pbiAgICAgICAgICAgICAgICB8ICAxMyArDQogZG9jcy9taXNj
L3hlbi1jb21tYW5kLWxpbmUucGFuZG9jICAgICAgIHwgICA5ICsNCiB0b29scy9nb2xhbmcveGVu
bGlnaHQvaGVscGVycy5nZW4uZ28gICAgfCAgIDIgKw0KIHRvb2xzL2dvbGFuZy94ZW5saWdodC90
eXBlcy5nZW4uZ28gICAgICB8ICAgNyArDQogdG9vbHMvaW5jbHVkZS9saWJ4bC5oICAgICAgICAg
ICAgICAgICAgIHwgICA1ICsNCiB0b29scy9pbmNsdWRlL3hlbmN0cmwuaCAgICAgICAgICAgICAg
ICAgfCAgMTIgKw0KIHRvb2xzL2xpYnMvY3RybC94Y19kb21haW4uYyAgICAgICAgICAgICB8ICAy
MyArDQogdG9vbHMvbGlicy9saWdodC9saWJ4bF9hcm0uYyAgICAgICAgICAgIHwgMjMwICsrKysr
LQ0KIHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfdHlwZXMuaWRsICAgICAgICB8ICAgNiArDQogdG9v
bHMveGwveGxfcGFyc2UuYyAgICAgICAgICAgICAgICAgICAgIHwgICA5ICsNCiB4ZW4vYXJjaC9h
cm0vZG9tMGxlc3MtYnVpbGQuYyAgICAgICAgICAgfCAgNzIgKysNCiB4ZW4vYXJjaC9hcm0vZG9t
YWluLmMgICAgICAgICAgICAgICAgICAgfCAgMzQgKw0KIHhlbi9hcmNoL2FybS9kb21haW5fYnVp
bGQuYyAgICAgICAgICAgICB8IDEwMyArKy0NCiB4ZW4vYXJjaC9hcm0vZG9tY3RsLmMgICAgICAg
ICAgICAgICAgICAgfCAgMzQgKw0KIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9kb21haW4uaCAg
ICAgICB8ICAgNCArDQogeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2lvbW11LmggICAgICAgIHwg
ICA3ICsNCiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vdmlvbW11LmggICAgICAgfCAxMTMgKysr
DQogeGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb20wbGVzcy1idWlsZC5jIHwgIDU1ICstDQogeGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvS2NvbmZpZyAgICAgICAgIHwgIDEzICsNCiB4ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hcm0vTWFrZWZpbGUgICAgfCAgIDIgKw0KIHhlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2FybS9zbW11LXYzLmMgICB8IDM2OSArKysrKysrKy0NCiB4ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9hcm0vc21tdS12My5oICAgfCAgNDkgKy0NCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9hcm0vdmlvbW11LmMgICAgfCAgOTYgKysrDQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJt
L3ZzbW11LXYzLmMgIHwgOTU4ICsrKysrKysrKysrKysrKysrKysrKysrKw0KIHhlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2FybS92c21tdS12My5oICB8ICAzMiArDQogeGVuL2luY2x1ZGUvcHVibGlj
L2FyY2gtYXJtLmggICAgICAgICAgIHwgIDE1ICstDQogeGVuL2luY2x1ZGUvcHVibGljL2Rldmlj
ZV90cmVlX2RlZnMuaCAgIHwgICAxICsNCiB4ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmggICAg
ICAgICAgICAgfCAgMjQgKy0NCiB4ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCAgICAgICAgICAgICAg
ICAgfCAgIDYgKw0KIHhlbi94c20vZmxhc2svaG9va3MuYyAgICAgICAgICAgICAgICAgICB8ICAg
NCArDQogeGVuL3hzbS9mbGFzay9wb2xpY3kvYWNjZXNzX3ZlY3RvcnMgICAgIHwgICAyICsNCiAz
MiBmaWxlcyBjaGFuZ2VkLCAyNjQ2IGluc2VydGlvbnMoKyksIDUzIGRlbGV0aW9ucygtKQ0KIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL2Rlc2lnbnMvYXJtLXZpb21tdS5yc3QNCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3Zpb21tdS5oDQogY3JlYXRlIG1vZGUg
MTAwNjQ0IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS92aW9tbXUuYw0KIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vdnNtbXUtdjMuYw0KIGNyZWF0ZSBt
b2RlIDEwMDY0NCB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vdnNtbXUtdjMuaA0KDQotLSAN
CjIuNDMuMA0K

