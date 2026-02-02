Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OxcDn/NgGl3AgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:14:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3D3CEC59
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:14:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218790.1527648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwZV-0000hx-VA; Mon, 02 Feb 2026 16:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218790.1527648; Mon, 02 Feb 2026 16:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwZV-0000fo-SP; Mon, 02 Feb 2026 16:14:41 +0000
Received: by outflank-mailman (input) for mailman id 1218790;
 Mon, 02 Feb 2026 16:14:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hK3N=AG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vmwZU-0000fY-Bu
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:14:40 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 462c6c3a-0052-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:14:39 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AMBPR03MB11643.eurprd03.prod.outlook.com
 (2603:10a6:20b:731::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Mon, 2 Feb
 2026 16:14:37 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:14:37 +0000
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
X-Inumbo-ID: 462c6c3a-0052-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shO16K8qlpmAKUou+wywI6jUlhO3bRn6dl8Y4RfEaLr4kmZfGlYv2DqjP/wQbF3iGDAjnWb9+Ryd+4bY7DN7l30C3wWUHZ/uPFBgGvpTcPN2kRiEMEU6TFYEwYDf8tWZR1sfSV1rbJ0miYz2TvQRl+O6ZwklMFwCS+eqt/RhQn5+diW057rfJodfbzuJP77KSG35ZwXaPfMsgJtZ690AI3AgLztvu53L9FyS2Z3iVSZDuabhVl2hJocGL8ij+nqbBBkXwGE1t0J3NBLePA0gkv7f2cyfg0VEqQddluxNyZJKJPa5wwODrObhgVPpP3kic5yi0+LCkYwjw75HuihtOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Niz4ofKZc3THtjBwNmEvLV2JEHyF+HICBdHchBMQchc=;
 b=iUfeeQqtIesbLhFaos7FUNHn6WxP1kecpk7X1F8zUWZyq0C+4QRgVIcui+r/onz05BQOKDFFte4rQQp77s3zRUadmQSTPHqc6UAMCQ3ZYabibvjasSgNweXXbAJ6ftGCG5pPE7fn+5bOp5DATbZqnmbbU7BBjInC4epZgQwsnWQlx6iVPjcsZWxy9+JS/2sOlRJhOEHhpwr7HXP4i9FPng0OSRSgFi/LWssfwQNLztEZpOdskenWHOJLM/0pj+4nnfYdJVtOhno+TWpR3Mda9nHEcSUt1u2cjBrgakw70ywsYhxiwtB5marVDnxEjJeKhawKlb6c6go3yo6dIWHcoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Niz4ofKZc3THtjBwNmEvLV2JEHyF+HICBdHchBMQchc=;
 b=t3Uiau6mDhOC6qWIl+AEBAXChAHpl+hGrmQJRjZlXDO/HjaBNiNhmTE3JalO+Evf7LrbEQK4xgNRxU5MURjEnIHG5hjxzNRQ0t96VBAqXUKBzsmp3znQbMtBVRS7qi8hOQ4OpAfMAkpPwsdyomUVggEJxscFn+JLkBALehbGwgSjA/1ehV4w7lpwqixQG8HmQ4WPiJwViEa4NQlI9jyU1MJ0P5FkHpRv6AAZCEUBAZ1uuCD7Jzi4fkzDbBYudBqWqlXxkKadv/vdNQKlsmVfhAlQnJngEhYvEe+tZgaRcjvdRk4yJL/ALihwrrZRgRd9QOG3D8tqXusgQFTGstmgVA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: [RFC PATCH 00/19] GICv4 Support for Xen
Thread-Topic: [RFC PATCH 00/19] GICv4 Support for Xen
Thread-Index: AQHclF8GgI2Kr/X/QEO5wnP/6sbdXQ==
Date: Mon, 2 Feb 2026 16:14:37 +0000
Message-ID: <cover.1770046465.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AMBPR03MB11643:EE_
x-ms-office365-filtering-correlation-id: 35cadff6-f494-4ad0-e9ee-08de6276295a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VGNwbE1tVGtsVW9RVXdYWSs0MU1HNTdjUlpocy9ac3JpTGZ1NzJ2ZmFYZGhq?=
 =?utf-8?B?WEcrZVlVWU92cGhOTjQ0SW5SMnpmR29rY1B2VCttOHJQNHZXU2JQL09NdEpp?=
 =?utf-8?B?QnZzWGQ4QkxRN040bHdubVh6RERqejI2ZDcyQzNBNDhhanU0Y05GclFFTDho?=
 =?utf-8?B?SHdUWWNROEhkWjFtUjg3eWtYbHcxeWJ4Z2dYNjJpQ1JqU2FLbWFSOEtINUhI?=
 =?utf-8?B?cExwMUN6cG9qeHpuVjJXdms5VnVSOVBjcWhLMkRHTG9yeXpUME9ITHJGVHUw?=
 =?utf-8?B?SjluZWpHajZ2S2U5MDFBZDYveVZUelMzVG9NMVh3S2tVakhOSm80eG9uUEVE?=
 =?utf-8?B?b3R2ZEp3N3ZzNi95RDBZNW93b251SXl0VkdqRk9GeFc4emdYcjY2UEVnMEZD?=
 =?utf-8?B?MVJKY05KS0x4MDJINnoxSFZQUU43REJEczhhcmN2N2VsTEFFY2F0dmt5SmFi?=
 =?utf-8?B?SG94NTF5d1JOaGVNTVVzVldyUXJValZhd1lobG1uM0FPNmdxMzJIdVdHVEhu?=
 =?utf-8?B?WXJrdUVUT3ZQS2xYOGdoZXd1VG9iWDNwaVRMbDloZDNpdVp4ajlleVRXaXlp?=
 =?utf-8?B?dSthSElpZURjN0crWmRFQUVWemRSVXA3Y2xkYVU5cFcxckhFdVVWL005NWJE?=
 =?utf-8?B?SmwvZHdnSkI3N21VKy9DWW9FNmNqNlZvZ0ZNTVBPMFRpV0VWWkV3RElPR2xU?=
 =?utf-8?B?OENOdmZ3aEQxdFdoZnNKNEdYRHREZXQzbll6MUdUcVQzRU5zcjNSZk1lWkpv?=
 =?utf-8?B?bEF3SEpzTk9QNWIwMXJaNDRkQU1NUHo5d2R3aStXSnUzSVZ4ZDd4Z0JEbi9N?=
 =?utf-8?B?NHg3S01OcmpJOUVkM3BDZjBOWi90YUEwaFp4a0NlUzJIYXFsL3NKYm83a3l6?=
 =?utf-8?B?VHVKekhBQXFSL2RaaHd5UTdOSWtCS083V0ZRWTF6bWhuWUJHSE42SERKSmc4?=
 =?utf-8?B?Uy84Vi9BSHZ6QnlsVXIxdEpDUzk0MnMwSGZXaWRQRGk5aUpDYXJXQm5GM3N5?=
 =?utf-8?B?N0VheDdUUTl6ZjZFL09hNWV5bEhCVm8zYkNrbUp0VmJ0NU5BWkFwcmtneW13?=
 =?utf-8?B?M29PK2tPMEowS3E1ZjB2SHAwbXhNSnQwaXhUM243ZkVndXhJSjB3a0pzSC8w?=
 =?utf-8?B?aDhJYzUwcXNWZWp2VVJZMjR0aVJJZWhlUjRGNVVrVlFSUkRUanBvaURUODdG?=
 =?utf-8?B?ZkxKc0N0RmlFdUdIai83UFZ3UUZGbjlKcUR1Y055RTdxQnZtOGxGSi9hNCsw?=
 =?utf-8?B?TlhnamhVUnh1MDRwM2poaEJLendRUURBZk9mdHpkOWZ1bUtuUjlUT1A3eFJ0?=
 =?utf-8?B?dWlyWUU3SlNtakhUODd6YnpZMlZLaXd4Tlg2dHh1M0V0U1lpUXpmejFGaEw5?=
 =?utf-8?B?WlBkcHVNT1VtQlV3a00wTWZNWkUxdzgzVlhYM29RMFUxWThrb3hXbFNVNFY0?=
 =?utf-8?B?SzVLTzR6UXhoY0d6OUN0eTJWN1VTZEtDNEVCOUZxREFTYWhXNXFLRXZvbjBY?=
 =?utf-8?B?RGoxdlZUUDhMT1QyblNzSnNqdlh0eTRiMndzdXBPZS9LemNJOGhvbmxqMk5q?=
 =?utf-8?B?eUxTNUUxeEFFcVA1MWFpQ1cwSkVmZEhFNyttc0VQanoxRGxhTkFtamsxYlBY?=
 =?utf-8?B?azByRjZIVDRCaDJGWjdOSDdURDduNG5McGFXeGo2REhFSWc2L3BGRGxqWC83?=
 =?utf-8?B?Z1lGTVlpMy9DTWNCS1YyL3ZwTFYyKzhBMzM0YyszZVZRMWF5ZzBMb3k1RUM4?=
 =?utf-8?B?TWhla25KUHcrUWxuVjlUZHpGeUs3WFRHalRoUDgxSEZzV1prODFKSHpiS0Iw?=
 =?utf-8?B?ZzVrZFVWUjFHcTY2WDUrNVNGL1V6WjdlY05qYU1IQ1dhblJvbGo0SDhMUDd0?=
 =?utf-8?B?aGwyTk1MOUdGVTRsVTZZQ1ltU1pJOE40bjRFUm84WDlKenZrQUZzNlh1MG50?=
 =?utf-8?B?MVlmR3RQSUxxb2VwSTlWMzR5WjdKTnd3QWJTNVJadHlHWi9jNkJxcDVQb3k5?=
 =?utf-8?B?Ui8yb0Q0enNPMzg3TnVNWUpCY1U3UEwwOU1FS3U4aVVKZ3NlRDh6U2dPTG8r?=
 =?utf-8?B?WGV4alJBRlhUVmV5Z25hdXJLM2FtRUErd1V2Qmx5TFFrM1BHUnNUWW9rOHE2?=
 =?utf-8?B?U01SWTNZSW0zSHBvTm9WUmJ3d3lKWDd6RFE3SlBvR3I4cWJ0b2dRNnY2REF6?=
 =?utf-8?Q?WU+le/URg4FQIY+Jem6bD8I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dldjYkx5MHhHNmI1OU5RUW0vbDRrTkdMRnJqWEUxL1FxVU16YlViaHE1Y0dl?=
 =?utf-8?B?U1d6QUpSMEJkbTJYeGxKeWc2R0lManUwQmNDSW1lQ2phNkRJYjRGU0dXRGF5?=
 =?utf-8?B?Sjl2bzM0WW5SRmtzR3k0RlNZSFpCbTduS3FYQ2tIaXBxUXR3ancwZzVCVEZ6?=
 =?utf-8?B?MGZmVDY5czM5RkovTVNZRFNuUlI4cUdKUzRnWEdlWmRVRmR0SGtGTzBhZDFj?=
 =?utf-8?B?RWo4b2ZGVU40THNYQ2tFYTZmblQ3V3NsQms0SHM1aUJHb2YvZTNpUndDaVls?=
 =?utf-8?B?VXc1VVNxakFuYkM5OElxcXNjZGNLUmszQTJEWlM2QmVSMHo4UU13MnFLb001?=
 =?utf-8?B?MHRwR29FaWM0VjVwUlgrVWloRjVZdWZibDJjVzRoMmRyNjN5VjlJMzNZYStL?=
 =?utf-8?B?N3JsOW5QOG9lSlVoeUxqaWhNT3hrUk1OZ0xPQlNKOWJRSHlxck4xUVdZbTBl?=
 =?utf-8?B?ajZRWFp2bGZoMDhIRDVjeGplZzEybFoyakx0WlVzUDBqRFF3OGZDVzFHNHpQ?=
 =?utf-8?B?M3YxY3FUdXgydXlhSTFRUms0V0l0T29LcFNhcEVzMUh5QXRKY1RMK0tlVkk3?=
 =?utf-8?B?SmQ1WXFKRzdQWDJMbmNoVFRoVTIrS21EZ1YwbWttWHZCeitrOWorZ0JxVTMv?=
 =?utf-8?B?SE5mai92SnRDcnV3WVJwYW52UHZ2U0pCdXQxTlZvQ3VBRFRVOS9rbEZ2bnJr?=
 =?utf-8?B?bzhvZnVLT3c4ejNBZ2ZNcG1OTThybkpkY1FKVW9XZnpqME9rVy9yRVpQYzZ5?=
 =?utf-8?B?N2dnenJQV1c5dWdrVU5QUG9NU2hKa25UOUtWS3dESnlIQ0Z6TXNacU5jVWdN?=
 =?utf-8?B?SDJVRDBhRnlIVnpqUzlxaVBzODhHeWxtV2hHaWJlZzhNVUpJQTZkZnBnaW53?=
 =?utf-8?B?a0oySGlXN2VBQzh4WEFySUs5RE1icDAybUFmMDBDSldzTlo4czlCRHlwdjMv?=
 =?utf-8?B?Nm9WNHpIdHo4L0Q4dGViTGdlQjc5MkRYUlFDaUNlTnNOUTdqaGlRTzUwYXRW?=
 =?utf-8?B?Y3pDc0hhS2o3KzFXTHlCc2djWE5lMm1CNWViWmhwY1Y4VVE1b2JPOFJ0VkVW?=
 =?utf-8?B?RGIrSUZWWVU4TmRTZTF6Z2RPOGRHZ0E2VTB1VG9VMWhzYkI1bTdvUERGampF?=
 =?utf-8?B?WkJXOG95dW1sSTUrZWtwQ0d6UytQVElwN20zMnZ3dGJsN2QwMWwrSVdjRlJR?=
 =?utf-8?B?Q1MvWWl6YjJVSVBGNDRNSHByRHd4RTFyV01BZGhuMHM4VVp0MFJ1OVRDU3hL?=
 =?utf-8?B?ZWxJQTY3bmVzUmk4dEZLY1VDWjAvWXJadUthZUJVWjQzTkZnVjd3WVl2bXFP?=
 =?utf-8?B?Ykl3SXZuNEx2M01DWE1kVWVHOXdobTFza2FTOTVNdGdPZi9nMVMrU0NQRVZ1?=
 =?utf-8?B?Rk5ZYmZuQVFZajVNYnVUelliUkVqazZZeE5mT2svU05VdXByMnVIczJlM1Yy?=
 =?utf-8?B?UVZYdzhBM2ZWdUYraEZCenZYVUhHdUlWMjkxckF5VmtrdEYzVkQzRlRoRm5q?=
 =?utf-8?B?SWFyYmxVV09TcmVTRDJ6VC9OdzEza1BrcFlJZVU2WWxkemNhaUdOZmFFZ2N1?=
 =?utf-8?B?aFoxSkVuZ3ZkalpHRjRBKzFRbkpkZmU1NW9sek55Rm9Dem9hdEVQQ1Q5bmI0?=
 =?utf-8?B?Qnc3WUNnTFR3Y2tQYnpCRm1xdGxDbFExYUxKM0duUHJFMHBlR1RpUktEWFRZ?=
 =?utf-8?B?dmZ3Y21EWEZOeW5LS2pUWWl1aFhJZ253d0Q1WHB5dFFSZVpnbHRKdE1HbHNy?=
 =?utf-8?B?Q0tjTVhNSlQrdlhXZ2xpSFk1WVQ1MFFPRFkvVTNKVFVFa1pLRTI1a0ttNHox?=
 =?utf-8?B?UTIvZGxzK1hxSVVhc1ZQSlpsQmNYV3lzQjJtcEdodWZ3blBqTk1oV09uY1o0?=
 =?utf-8?B?Y2E2RnVxRVcwTnVhUGlUZnp6bHpUN2VDcmVtdnpVNzQ0MTN5eXpjUGVBTWlw?=
 =?utf-8?B?NXBFd0tHYVA3clF1WGNyamc3OGdkbTN4QjBFaTFNaGl5dnVZZDVTUDJYYlRM?=
 =?utf-8?B?MUhJRHdQOEpaTU1wc2pBa0ZyWStVVnZaand4dm4zb1RVU1Rqb0lPUlpvcFJ1?=
 =?utf-8?B?T3NZanJubko4TXV3WTB5Wjl5RlFYcS9BQkx4d1JqTHZMaHhtdmRMWG5GcDdP?=
 =?utf-8?B?U0dnWHc2N2VYSHQ4WE5ScVh2a2xjMkFHQXBqcDZldVQ5NzhDYmtFNDNMZUt4?=
 =?utf-8?B?TFRqVjBtYXBQc2dpbzV0R21iamRjOEk4bmhnb28rMG5IRDRJTVZTbGczQVJS?=
 =?utf-8?B?dmJGMFhxR0NIU2FTZkFpOVA5ZFBZUW9jMWJZK29zMmpXUHFLK1Z5bWR0ZXF3?=
 =?utf-8?B?L3dTZElCeGJOOUZqV256RmhqRTJDT1JyNVcvSENXQnliTkcwZUNOY3k3Zm5I?=
 =?utf-8?Q?WNUC5mtLJoLyJK1w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8E2BB8D71F7E64D983925F81303E7C2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35cadff6-f494-4ad0-e9ee-08de6276295a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 16:14:37.1904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XCe+qXYUn2Ldd9DlN8QgxbANrvAEGjjYeFtwYagtL77BcP9LZdS6CwV1IZ7/zSGzl6AUxFv6L80OSeW3yH8ZKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11643
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.41 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:xakep.amatop@gmail.com,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,epam.com:mid,epam.com:dkim];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[gmail.com,epam.com,kernel.org,xen.org,arm.com,amd.com,citrix.com,vates.tech,suse.com];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BD3D3CEC59
X-Rspamd-Action: no action

VGhpcyBzZXJpZXMgaW50cm9kdWNlcyBHSUN2NCBkaXJlY3QgTFBJIGluamVjdGlvbiBmb3IgWGVu
Lg0KDQpEaXJlY3QgTFBJIGluamVjdGlvbiByZWxpZXMgb24gdGhlIEdJQyB0cmFja2luZyB0aGUg
bWFwcGluZyBiZXR3ZWVuIHBoeXNpY2FsIGFuZA0KdmlydHVhbCBDUFVzLiBFYWNoIFZDUFUgcmVx
dWlyZXMgYSBWUEUgdGhhdCBpcyBjcmVhdGVkIGFuZCByZWdpc3RlcmVkIHdpdGggdGhlDQpHSUMg
dmlhIHRoZSBgVk1BUFBgIElUUyBjb21tYW5kLiBUaGUgR0lDIGlzIHRoZW4gaW5mb3JtZWQgb2Yg
dGhlIGN1cnJlbnQNClZQRS10by1QQ1BVIHBsYWNlbWVudCBieSBwcm9ncmFtbWluZyBgVlBFTkRC
QVNFUmAgYW5kIGBWUFJPUEJBU0VSYCBpbiB0aGUNCmFwcHJvcHJpYXRlIHJlZGlzdHJpYnV0b3Iu
IExQSXMgYXJlIGFzc29jaWF0ZWQgd2l0aCBWUEVzIHRocm91Z2ggdGhlIGBWTUFQVElgDQpJVFMg
Y29tbWFuZCwgYWZ0ZXIgd2hpY2ggdGhlIEdJQyBoYW5kbGVzIGRlbGl2ZXJ5IHdpdGhvdXQgdHJh
cHBpbmcgaW50byB0aGUNCmh5cGVydmlzb3IgZm9yIGVhY2ggaW50ZXJydXB0Lg0KDQpXaGVuIGEg
VlBFIGlzIG5vdCBzY2hlZHVsZWQgYnV0IGhhcyBwZW5kaW5nIGludGVycnVwdHMsIHRoZSBHSUMg
cmFpc2VzIGEgcGVyLVZQRQ0KZG9vcmJlbGwgTFBJLiBEb29yYmVsbHMgYXJlIG93bmVkIGJ5IHRo
ZSBoeXBlcnZpc29yIGFuZCBwcm9tcHQgcmVzY2hlZHVsaW5nIHNvDQp0aGUgVlBFIGNhbiBkcmFp
biBpdHMgcGVuZGluZyBMUElzLg0KDQpCZWNhdXNlIEdJQ3Y0IGxhY2tzIGEgbmF0aXZlIGRvb3Ji
ZWxsIGludmFsaWRhdGlvbiBtZWNoYW5pc20sIHRoaXMgc2VyaWVzDQppbmNsdWRlcyBhIGhlbHBl
ciB0aGF0IGludmFsaWRhdGVzIGRvb3JiZWxsIExQSXMgdmlhIHN5bnRoZXRpYyDigJxwcm94eeKA
nSBkZXZpY2VzLA0KZm9sbG93aW5nIHRoZSBhcHByb2FjaCB1c2VkIHVudGlsIEdJQ3Y0LjEuDQoN
CkFsbCBvZiB0aGlzIHdvcmsgaXMgbW9zdGx5IGJhc2VkIG9uIHRoZSB3b3JrIG9mIFBlbm55IFpo
ZW5nDQo8cGVubnkuemhlbmdAYXJtLmNvbT4gYW5kIEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2Vs
bHVAYXJtLmNvbT4uIEFuZCBhbHNvIGZyb20NCkxpbnV4IHBhdGNoZXMgYnkgTWFyayBaeW5naWVy
Lg0KDQpTb21lIHBhdGNoZXMgYXJlIHN0aWxsIGEgbGl0dGxlIHJvdWdoIGFuZCBuZWVkIHNvbWUg
c3R5bGluZyBmaXhlcyBhbmQgbW9yZQ0KdGVzdGluZywgYXMgYWxsIG9mIHRoZW0gbmVlZGVkIHRv
IGJlIGNhcnZlZCBsaW5lIGJ5IGxpbmUgZnJvbSBhIGdpYW50IH40MDAwIGxpbmUNCnBhdGNoLiBU
aGlzIFJGQyBpcyBkaXJlY3RlZCBtb3N0bHkgdG8gZ2V0IGEgZ2VuZXJhbCBpZGVhIGlmIHRoZSBw
cm9wb3NlZA0KYXBwcm9hY2ggaXMgc3VpdGFibGUgYW5kIE9LIHdpdGggZXZlcnlvbmUuIEFuZCB0
aGVyZSBpcyBzdGlsbCBhbiBvcGVuIHF1ZXN0aW9uDQpvZiBob3cgdG8gaGFuZGxlIFNpZ25lZC1v
ZmYtYnkgbGluZXMgZm9yIFBlbm55IGFuZCBMdWNhLCBzaW5jZSB0aGV5IGhhdmUgbm90DQppbmRp
Y2F0ZWQgdGhlaXIgcHJlZmVyZW5jZSB5ZXQuDQoNCk15a3l0YSBQb3R1cmFpICgxOSk6DQogIGFy
bS9naWN2NCBhZGQgbWFuYWdlbWVudCBzdHJ1Y3R1cmUgZGVmaW5pdGlvbnMNCiAgYXJtL2dpY3Y0
LWl0czogQWRkIEdJQ3Y0IElUUyBjb21tYW5kIGRlZmluaXRpb25zDQogIGFybS9pdHM6IEV4cG9y
dCBzdHJ1Y3QgaXRzX2RldmljZQ0KICBhcm0vaXRzOiBBZGQgdmxwaSBjb25maWd1cmF0aW9uDQog
IGFybS9pcnE6IEFkZCBodyBmbGFnIHRvIHBlbmRpbmdfaXJxDQogIGFybS9naWN2NC1pdHM6IEFk
ZCBWTFBJIG1hcC91bm1hcCBvcGVyYXRpb25zDQogIHhlbi9kb21haW46IEFsbG9jIGVub3VnaCBw
YWdlcyBmb3IgVkNQVSBzdHJ1Y3QNCiAgYXJtL2dpYzogS2VlcCB0cmFjayBvZiBHSUMgZmVhdHVy
ZXMNCiAgYXJtL2l0czogSW1wbGVtZW50IExQSSBpbnZhbGlkYXRpb24NCiAgYXJtL2l0czogS2Vl
cCB0cmFjayBvZiBCQVNFUiByZWdzDQogIGFybS9pdHM6IEFkZCBJVFMgVk0gYW5kIFZQRSBhbGxv
Y2F0aW9uL3RlYXJkb3duDQogIGFybS9naWM6IEFkZCBWUEVOREJBU0VSL1ZQUk9QQkFTRVIgYWNj
ZXNzb3JzDQogIGFybS9naWM6IFZQRSBzY2hlZHVsaW5nDQogIGFybS9pdHM6IFZQRSBhZmZpbml0
eSBjaGFuZ2VzDQogIGFybTogQWRkIGdpY3Y0IHRvIGRvbWFpbiBjcmVhdGlvbg0KICBhcm0vZ2lj
OiBGaXggTFIgZ3JvdXAgaGFuZGxpbmcgZm9yIEdJQ3Y0DQogIGFybS9naWN2NDogSGFuZGxlIGRv
b3JiZWxscw0KICBhcm0vZ2ljOiBBZGQgVlBFIHByb3h5IHN1cHBvcnQNCiAgYXJtL2dpY3Y0OiBB
ZGQgR0lDdjQgdG8gdGhlIGJ1aWxkIHN5c3RlbQ0KDQogeGVuL2FyY2gvYXJtL0tjb25maWcgICAg
ICAgICAgICAgICAgICAgfCAgICA2ICsNCiB4ZW4vYXJjaC9hcm0vTWFrZWZpbGUgICAgICAgICAg
ICAgICAgICB8ICAgIDEgKw0KIHhlbi9hcmNoL2FybS9kb20wbGVzcy1idWlsZC5jICAgICAgICAg
IHwgICAgMSArDQogeGVuL2FyY2gvYXJtL2RvbWFpbi5jICAgICAgICAgICAgICAgICAgfCAgIDE2
ICsNCiB4ZW4vYXJjaC9hcm0vZ2ljLXYyLmMgICAgICAgICAgICAgICAgICB8ICAgIDIgKy0NCiB4
ZW4vYXJjaC9hcm0vZ2ljLXYzLWl0cy5jICAgICAgICAgICAgICB8ICAzMzkgKysrKystLQ0KIHhl
bi9hcmNoL2FybS9naWMtdjMtbHBpLmMgICAgICAgICAgICAgIHwgIDE2OSArKystDQogeGVuL2Fy
Y2gvYXJtL2dpYy12My5jICAgICAgICAgICAgICAgICAgfCAgMjE1ICsrKystDQogeGVuL2FyY2gv
YXJtL2dpYy12NC1pdHMuYyAgICAgICAgICAgICAgfCAxMTM2ICsrKysrKysrKysrKysrKysrKysr
KysrKw0KIHhlbi9hcmNoL2FybS9naWMtdmdpYy5jICAgICAgICAgICAgICAgIHwgICAgNiArDQog
eGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2dpYy5oICAgICAgICAgfCAgICA0ICstDQogeGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL2dpY192M19kZWZzLmggfCAgIDIyICsNCiB4ZW4vYXJjaC9hcm0v
aW5jbHVkZS9hc20vZ2ljX3YzX2l0cy5oICB8ICAxMzkgKystDQogeGVuL2FyY2gvYXJtL2luY2x1
ZGUvYXNtL2dpY192NF9pdHMuaCAgfCAgMTE0ICsrKw0KIHhlbi9hcmNoL2FybS9pbmNsdWRlL2Fz
bS92Z2ljLmggICAgICAgIHwgICA3OSArLQ0KIHhlbi9hcmNoL2FybS92Z2ljLXYzLWl0cy5jICAg
ICAgICAgICAgIHwgICA2MCArLQ0KIHhlbi9hcmNoL2FybS92Z2ljLmMgICAgICAgICAgICAgICAg
ICAgIHwgICAzNyArLQ0KIHhlbi9jb21tb24vZG9tYWluLmMgICAgICAgICAgICAgICAgICAgIHwg
ICAxNCArLQ0KIHhlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oICAgICAgICAgIHwgICAgMiAr
DQogMTkgZmlsZXMgY2hhbmdlZCwgMjE3NCBpbnNlcnRpb25zKCspLCAxODggZGVsZXRpb25zKC0p
DQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9naWMtdjQtaXRzLmMNCiBjcmVhdGUg
bW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2dpY192NF9pdHMuaA0KDQotLSAN
CjIuNTEuMg0K

