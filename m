Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MkPBoIR/WnvXAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 00:26:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AAF4EFCDE
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 00:26:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303118.1576662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wL7AG-0002Gy-5o; Thu, 07 May 2026 22:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303118.1576662; Thu, 07 May 2026 22:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wL7AG-0002F0-2j; Thu, 07 May 2026 22:25:52 +0000
Received: by outflank-mailman (input) for mailman id 1303118;
 Thu, 07 May 2026 22:25:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1wL7AD-0002Eu-PE
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 22:25:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wL7AD-00EUuj-5u
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 00:25:49 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69fd1136-2eae-0a2a0a5409dd-0a2a4504a6e2-44
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 00:25:49 +0200
Received: from [52.101.84.84]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69fd116c-1dec-0a2a45040019-34655454e297-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 00:25:49 +0200
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AMBPR03MB11798.eurprd03.prod.outlook.com
 (2603:10a6:20b:777::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 22:25:46 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3%4]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 22:25:46 +0000
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
 b=LPq+yMJiIueGkPQiBFuG4TJoXDBAPJFKnyYADOSTMpkLwrCr1PZjdcV5otB0TzHbvowLacGdSAynbC0fKjNZXBtSvf0KZmHtyX2uM1O9uZ75THJbOHlP9+OuUKOOsPc3OfdrsywZAkzibPkiO9b7GKQz9eOdgRjAPuUBSlW50GyMV5lyQefob22TDIrBPrxSCywAjHeTj++BMibZk2I47EDiaEwQUf7nrbtWUiRw5LcTwtv2Fudwf5/978hej6IggJBIDXt6FpdGmqpv3JWjf8dGkXXs8slLItBL+0g8SOXeL0Z2AJRO+tt/RDJbK43R0OSsc+IF/3YGFCvoCb/+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CYKkN6OC4hgWfFZ/Kcm5rwvZIFRl93FxEWOgd76wko=;
 b=yG4zRAJT16jQ9wckrEVQiVcvLreWEcBJ5qB6Bl5K3ljgVOv4/vw1/Jg8j6Mi7BnO/1UsRpYpAQRLkGUXhqdTuXIxPVRoMmccGdC+Y24oNAox0fk/NmDrw2+07kZoLAAYF/1dsOLK7Pd/Ny2Nep6xyXHWwupbOTpV8Tu3gwD2BmYCU/XRANtRCpx3+62oi6Qe78a7kmNYJsEHag2V4VVEocC+yb00HPaCRFkE00dJhqoq4MRhHCCaE977tEaEtcbgQfnrTcDH7Z2cTO/BrZgvqn3MkeTYiBH5whWi5Qr2tLcXOGfaO1xW+Aa1C5SL330X1VT7vzlMpIPIqhz8+2W23w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CYKkN6OC4hgWfFZ/Kcm5rwvZIFRl93FxEWOgd76wko=;
 b=Kbhrgk/aZZ2K3/3uIWrlM0KdbVzSIFAjN7Gv+zNzMM3XVEUMabmZz5n9uBRFuZdOiwLquDmyOT9QydiAw+wa18Zlq1zvQSW27hRRMHNS+9XouE4x1dyLvJ+BeKvPuHPH9wjIsAzwrHqW5QjA38PMSz7ISsFdiLR99SUwYgeeBAKXITCKj75F0waYn5aiXJWe1L7altmr3iWuQBGg3I/NOCCPRgchBfp0UqGaYd11l5zkePADGyI1nGqfQY9Ouob4qTHscOZCUAxoMTVdFWIldIta6YTtjWFsSKkSS0vLkfL+MdXHl73A2al8iwyRKwpxrNq1lU/zrzz1ZgrOa8uznA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Mykola Kvach <Mykola_Kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Rahul Singh
	<Rahul.Singh@arm.com>
Subject: Re: [PATCH v8 13/13] xen/arm: Add support for system suspend
 triggered by hardware domain
Thread-Topic: [PATCH v8 13/13] xen/arm: Add support for system suspend
 triggered by hardware domain
Thread-Index: AQHcwo4kFiAy6Uhk9ESItMHuQ9a0Lg==
Date: Thu, 7 May 2026 22:25:46 +0000
Message-ID: <87lddusvpy.fsf@epam.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
	<9b0f8922cd33df2b8e8038d639c1b8d8d73ce401.1775125380.git.mykola_kvach@epam.com>
	<4977CF18-39CC-4CC0-936A-890BAE5E8615@arm.com>
	<CAGeoDV8WkRGubF0qEXd4+PsXuabz3914G7bTYxTbaxZ2DsnY6w@mail.gmail.com>
In-Reply-To:
 <CAGeoDV8WkRGubF0qEXd4+PsXuabz3914G7bTYxTbaxZ2DsnY6w@mail.gmail.com>	(Mykola
 Kvach's message of "Tue, 5 May 2026 23:34:18 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AMBPR03MB11798:EE_
x-ms-office365-filtering-correlation-id: fd9eacf6-8686-410c-ec4d-08deac8795af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|376014|7416014|1800799024|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 ZGjTMYzy+gn5n32XqaLCcjYJU2Ab6pY5PNesSWVB1bzapjc8cnuvnD0l7MU3aBH70JUZRguxNWzDdnQPjO2q2cXgxqa7JVX/FUNfkHCsnt7kCchHsKcdicQB5BIsryuuOm21g+jEPFTcDU70XwQHSwmtCDqxGA1mE3XqDV0L90AzkT+21QoJV+90trfa6mfdKFXiUujDVazI2iLBeoRtuJ4zh5zelxw94PSOZLAIIKidaGjVa+8ezv7Fds2cELYzo6R0y+MMJfzTR6Qvb4eYlZqFSEA1fsspDm7XeNM7Pn6nsNwipCOBZloeBOIf9qjOlchYVLC+D4/H1UvIG12oGShcR8XqIe3Urc+loUgizg3UIqNT50GC9Y35E1xQqHReTBs6chrZVWU5rGH6QFrv8JxH00QG3TciA5o+S1HbvFita8ym5n+exgoEu2fJr1d4YIuPYTxGrsflQW130iZ/c2k0nZwtAblPe00GiXKGT+jwL9x0owNUcNeULsNdRqdVy/vOAj2nMiJwnnnpOq9ODrh61vw3c2fYzRbLe7bOVYgslRBL6+wVywJwicPpMQ+lgWTb/GZXP7ETssIWNRvZDsONvf3JhQ87rr76IZLALAcHu3CM3BZ+QBMF+eY0mhV6Gd0L//azYegFezfHa8dP9KPdt/IYB6Q6CBLEuRCzJ5YxvX6Ql/A7D66/mGTcLfnKvtq5l4ox4+8kfuSZnoL3wZ10gWYE6MR/MFhpxDirXaOl4+S+vHyyCCz6TnkkQwez
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(376014)(7416014)(1800799024)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NzlDMzk3ZnJTWU4yRDFJQktjOFVOVGxSNlFxcjVKd2hlLzQwMkNSYVlOZ2JU?=
 =?utf-8?B?bDVNYWpPNWFPMjFheXd5NS91Mkd2UE12MTNTeldNbHZOZlFsOXA4RTZXTzNt?=
 =?utf-8?B?ZllhNnVCVlNkNmJFKzdMM2ZDTzRKamhFQ1FVVWd1cVpvZmcwbnNtUzBGZkVz?=
 =?utf-8?B?Z2laY1o0VnhKbktLVENpZDF5OGNRNFkzSUFMVzZtTXVNWGFLMkdXMUNpdTVo?=
 =?utf-8?B?ZVJSaGEwZjZnRit4TTdiWE40TVRnc3cvSU01NGxBOXNrR1A2YU9JbkFBMXZT?=
 =?utf-8?B?dWVrZFM0TnVYUEhMSHc2ZG13aU5aaEtSUXRGcWRKa3dZZFVrRDhDWi9MSDJZ?=
 =?utf-8?B?WFNzVXRyY2lqaE5USldPUWF1WE5sQWl6Q1ZjYzdyR2tGU3NsK1JoaXd3K0VM?=
 =?utf-8?B?M2NFNXNOWXB5SlUreEJNc2NjRlpjU2c5ZDR0V2lmeWVLSkw2alNhZ3VZdFFW?=
 =?utf-8?B?UlZMdGV2Q0Z0N3hOejU5Z3MzZUUxTjQxekVRY2luREphMGY1czNNUE9kdGo5?=
 =?utf-8?B?K1V5a3JQYmlicm1UUERPQXJQUFlJU2dNcUE2NWdFajRzb09sM3cvZVpHaTJV?=
 =?utf-8?B?RnZrRGNpazZDM1l5TTYvN2Q0ZS83Tnh0ckJVZkxSR0RabU9zT0JuYkRNbWIv?=
 =?utf-8?B?anhmQTBFYUgwZFY5K3dRNnp4T1NJL01mdGFkK2ZWZ2ZpTHc1RENMUENOMkhv?=
 =?utf-8?B?WUYyY21STUg3eVl1YXpyYUF3Nzl4Z3ZsU3I4S2NReitueTF2ZTFrZTl2TzRk?=
 =?utf-8?B?eGd5NmNmaTJ0M0ZTUEhsZVJrZ2MyOVRYcnZSanlLczMrS2NJbERzd1hTMVMr?=
 =?utf-8?B?Q2dUdGd4MTIzSjhxVlhyZXV2TlFhTml4c1JTTXhlVkRWRG4xbThSb3BRaU5X?=
 =?utf-8?B?eWQrVUttbVhGc3lLT0ZSNVNZc0hWdVRtc0ZwVG9Gbk1uNGs4R3pOZGZGaHVB?=
 =?utf-8?B?MzdqT0RoQjk2TVc5SGszV3dvb0dKUjN4dDFOdURiVlpUTklRRXdYdTB6clZO?=
 =?utf-8?B?QWNYM2lSQTFEWVg2Y3RZQ1JpQXI4ZEpHc1dNN0VaSTczbjRDTkVMM29WcXl6?=
 =?utf-8?B?RlZpQTYxV01tOG1pL3l5NmpwNVVUbHNidHZ5ODJCaFNUb2JJOXppZnZ4d3lR?=
 =?utf-8?B?RzhLcnVBK2NPYXJ3aS9qYWN5aU9KODIxNEFEakxBYVVRVzVaYUtrcWNteU44?=
 =?utf-8?B?M1h6SVNncXFYWnpOZ3FmSGFCQUZTcWd5a0Exd2RFNW5SWTFIM0JLZkJOY2NO?=
 =?utf-8?B?aW4yMmJlVHl0dHE0ZDNEeUtMeHo3dXBUd3c2N1BVWlNuR25CdTZrektkWUtI?=
 =?utf-8?B?alFnZ2pDY1A2Z2VDQ0QySHJGQ1JMS0NLUWl2d281Vy9xcis5THEyY09jRDBh?=
 =?utf-8?B?dXhHeEgyYkVZWS9ZM0tnVjlyeEJoVjc5dktrZkdBNWpVMWl6YlExcE41YlNB?=
 =?utf-8?B?YlViL3FjK0FzZytab1UySVp4WVhnQ1hwcmdUcHg0VDJjQkg5MC9kdVZqY1ZC?=
 =?utf-8?B?Y3RoMEI1dURBanhkaTdkR2hyTnhzNGh5ckcwcE15a3pVNXRGRmg2aEZOYmM1?=
 =?utf-8?B?c2JyMk9VNTNhcUdHYUZVUFVhNFdLYXZ2ZjY3ZmgxZ1RyRkYySVBQd2VzVEp1?=
 =?utf-8?B?Z2VsdDBoUzZvRjVNL1N2LzlkT2pXb3pSeFNSQ0NLNkVwRC9NTjlrMC9UTmJS?=
 =?utf-8?B?cEs3Z3VpdGxLaEhCQm83azVPQWpRUWhqamh4ejYzdGZTNTN0YXlwU2VTcUp6?=
 =?utf-8?B?NDVBekc2OE9QM2UydFdKWWtPWFZ6YjFtVm85dW1vcGRxby9XWEh5N2FrUjVs?=
 =?utf-8?B?dzhWYVlqQWpGL3R3aUFwVHVWVitNTzhlU0ZIUGFJYUUzT2NhM1ljN2QvSTBq?=
 =?utf-8?B?VC9sK2JVQ2hmNnJGaXdCczdacDZFcmFRZ21iM3NtSjlaQVdPcUprdDZwNDlS?=
 =?utf-8?B?YTc4djJKUmthRE5idnRwdkxqZDV6U1pJSE9hNER5bmF1TU1ucDhoTnc2azB1?=
 =?utf-8?B?RU1OeDFoY2hSMzFTUGIvaERvcWI3K21KRGNVSzM0TW1YME4zeVNvTWp3bEpE?=
 =?utf-8?B?dzF5ektqTTYwNFZEMUVzditzSUNxRjRrbHlwOXNIaW5GR2h2dGNCWW5VOFlK?=
 =?utf-8?B?a3ZIWTY3RWw0ZHNKWVM1aUwzR0RLaU1nVlFOQTB5am1mNEdpT2g2UDBrdllE?=
 =?utf-8?B?TDUzU2lESWc5bzFlU3BFK3VzSmVCeHB2RXE0M3lLZGhVQk1aRUZTRHF3dVcy?=
 =?utf-8?B?RzRaSVFFcUw2K3FRM1g4cnhZUWpLMU1Cb3lrOEFodWJ1L2diUkJYYVg1bGw4?=
 =?utf-8?B?U1dCM20vbXpRWDZ2RFVoeVFWaEVBcXRWZXFlQmVuS1RpNFk2YVVqTjdMcmdh?=
 =?utf-8?Q?zX9PXFGe9HfbWPO4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D5B9ECFDCC7D1C4FBB58DFF6923C4A95@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd9eacf6-8686-410c-ec4d-08deac8795af
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 22:25:46.4463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MEr22BZnKpMMmNZqz8emgCcaTlfh8nfRs/Nk5nbh1/ffpsvsYShEKXuMlwSLKALeb6bFezydyGdVk4y5gtnsH17b1/NVkXsirZ1NpbbiWNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11798
X-purgate-ID: tlsNG-ebf023/1778192749-4846A3FF-882127CE/0/0
X-purgate-type: clean
X-purgate-size: 12662
X-Rspamd-Queue-Id: 52AAF4EFCDE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Mykola_Kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:Rahul.Singh@arm.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:mid,epam.com:dkim,system_suspend_tasklet.data:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

SGkgTXlrb2xhLA0KDQpNeWtvbGEgS3ZhY2ggPHhha2VwLmFtYXRvcEBnbWFpbC5jb20+IHdyaXRl
czoNCg0KWy4uLl0NCg0KPj4gPiArICAgIHN0YXR1cyA9IGNhbl9zeXN0ZW1fc3VzcGVuZCgpOw0K
Pj4gPiArICAgIGlmICggc3RhdHVzICkNCj4+ID4gKyAgICB7DQo+PiA+ICsgICAgICAgIHN5c3Rl
bV9zdGF0ZSA9IFNZU19TVEFURV9yZXN1bWU7DQo+PiA+ICsgICAgICAgIGdvdG8gcmVzdW1lX3Nj
aGVkdWxlcjsNCj4+DQo+PiBXaGVuIHdlIGhhdmUgYW4gZXJyb3IgYW5kIHdlIGdldCB0aGUgcmVz
dW1lX3NjaGVkdWxlciBwYXRoLCB3ZSBhcHBseSBiYWNrIHRoZQ0KPj4gY29udGV4dCBvZiB0aGUg
Z3Vlc3Qgc2F2ZWQgcHJldmlvdXNseSBpbiBkb19wc2NpXzFfMF9zeXN0ZW1fc3VzcGVuZCgpLCBz
byBhbSBJDQo+PiBjb3JyZWN0IHNheWluZyB0aGUgZ3Vlc3Qgd29u4oCZdCBnZXQgYW55IFBTQ0kg
ZXJyb3IgYmFjayBhbmQgd2UgcmVzdW1lIHRoZSBndWVzdA0KPj4gZnJvbSB0aGUgZ3Vlc3QgcmVz
dW1lIGVudHJ5cG9pbnQ/DQo+Pg0KPj4gSW4gY2FzZSwgc2hvdWxkIHdlIGhhdmUgYSBkaWZmZXJl
bnQgcGF0aCB0aGF0IHJldHVybnMgYSBQU0NJIGVycm9yIChQU0NJXyopIGludG8gdGhlIGd1ZXN0
DQo+PiB4MCwgYW5kIHNraXBzIHRoZSBjb250ZXh0IHJlc3RvcmU/DQo+DQo+IFlvdSBhcmUgcmln
aHQgYWJvdXQgdGhlIGN1cnJlbnQgY29udHJvbCBmbG93OiBvbmNlIHRoZSB2aXJ0dWFsDQo+IFNZ
U1RFTV9TVVNQRU5EIHJlcXVlc3QgaGFzIGJlZW4gYWNjZXB0ZWQgYW5kIHRoZSBkb21haW4gaGFz
IGJlZW4gcGFya2VkLCBhDQo+IGxhdGVyIGZhaWx1cmUgaW4gdGhlIFhlbi13aWRlIHN1c3BlbmQg
cGF0aCByZXN1bWVzIHRoZSBkb21haW4gdGhyb3VnaCB0aGUgbm9ybWFsDQo+IGRvbWFpbiByZXN1
bWUgcGF0aCwgcmF0aGVyIHRoYW4gcmV0dXJuaW5nIGEgUFNDSSBlcnJvciBmcm9tIHRoZSBvcmln
aW5hbCBjYWxsLg0KPg0KPiBUaGlzIGlzIGludGVudGlvbmFsIGluIHRoZSBjdXJyZW50IGRlc2ln
bi4gVGhlIHZpcnR1YWwgUFNDSSBTWVNURU1fU1VTUEVORA0KPiBwYXRoIHBhcmtzIHRoZSBkb21h
aW4gYW5kIHNhdmVzIGl0cyByZXN1bWUgY29udGV4dC4gVGhlIGFjdHVhbCBYZW4td2lkZSBob3N0
DQo+IHN1c3BlbmQgaXMgYSBzZXBhcmF0ZSBzdGVwIHRoYXQgaXMgYXR0ZW1wdGVkIG9ubHkgYWZ0
ZXIgYWxsIGRvbWFpbnMgYXJlDQo+IHN1c3BlbmRlZC4NCj4NCj4gU28gYSBmYWlsdXJlIGluIHRo
ZSBsYXRlciBYZW4td2lkZSBzdXNwZW5kIHN0ZXAgaXMgdHJlYXRlZCBhcyBhbiBhYm9ydCBvZiB0
aGUNCj4gaG9zdCBzdXNwZW5kIGF0dGVtcHQgYWZ0ZXIgdGhlIGRvbWFpbiBzdXNwZW5kIHdhcyBh
bHJlYWR5IGFjY2VwdGVkLiBUaGUgZG9tYWluDQo+IGlzIHRoZW4gcmVzdW1lZCB0aHJvdWdoIHRo
ZSBleGlzdGluZyBkb21haW4gcmVzdW1lIHBhdGgsIHNpbWlsYXJseSB0byB0aGUNCj4gdG9vbHN0
YWNrL3hsIHN1c3BlbmQtcmVzdW1lIGZsb3csIHJhdGhlciB0aGFuIGJ5IHJlLWVudGVyaW5nIHRo
ZSBndWVzdCBQU0NJDQo+IGNhbGwgcGF0aCBhbmQgbW9kaWZ5aW5nIHRoZSBzYXZlZCB2Q1BVIGNv
bnRleHQgYWdhaW4uDQo+DQo+IEkgYWdyZWUgdGhpcyBkZXNpZ24gaXMgbm90IG9idmlvdXMgZnJv
bSB0aGUgcGF0Y2guIEkgd2lsbCBjbGFyaWZ5IHRoZSBjb21taXQNCj4gbWVzc2FnZSBhbmQgY29t
bWVudHMuIElmIHlvdSBvciB0aGUgbWFpbnRhaW5lcnMgdGhpbmsgdGhhdCBmYWlsdXJlcyBiZWZv
cmUgdGhlDQo+IHBoeXNpY2FsIFNZU1RFTV9TVVNQRU5EIGNhbGwgc3VjY2VlZHMgc2hvdWxkIGJl
IHJlcG9ydGVkIGJhY2sgdGhyb3VnaCB0aGUNCj4gb3JpZ2luYWwgdmlydHVhbCBQU0NJIGNhbGws
IHRoZW4gdGhpcyB3b3VsZCByZXF1aXJlIGEgZGlmZmVyZW50IGZsb3cuIEkgd2FzDQo+IHRyeWlu
ZyB0byBhdm9pZCB0aGF0IGV4dHJhIGNvbXBsZXhpdHkgaW4gdGhpcyBzZXJpZXMuDQoNCkkgdGhp
bmsgdGhhdCB0aGVyZSBpcyBubyBzZW5zZSB0byByZXBvcnRpbmcgYW4gZXJyb3IgYmFjayB0byBn
dWVzdC4gUFNDSQ0KYWxsb3dzIHJlc3VtZSBhdCBhbnkgc3RhZ2UsIHNvIGl0IGlzIGFjY2VwdGFi
bGUgdG8gaGF2ZSBzdWNoIGJyaWVmICJzdXNwZW5kIg0KDQo+DQo+Pg0KPj4gPiArICAgIH0NCj4+
ID4gKw0KPj4gPiArICAgIC8qDQo+PiA+ICsgICAgICogTm9uLWJvb3QgQ1BVcyBoYXZlIHRvIGJl
IGRpc2FibGVkIG9uIHN1c3BlbmQgYW5kIGVuYWJsZWQgb24gcmVzdW1lDQo+PiA+ICsgICAgICog
KGhvdHBsdWctYmFzZWQgbWVjaGFuaXNtKS4gRGlzYWJsaW5nIG5vbi1ib290IENQVXMgd2lsbCBs
ZWFkIHRvIFBTQ0kNCj4+ID4gKyAgICAgKiBDUFVfT0ZGIHRvIGJlIGNhbGxlZCBieSBlYWNoIG5v
bi1ib290IENQVS4gRGVwZW5kaW5nIG9uIHRoZSB1bmRlcmx5aW5nDQo+PiA+ICsgICAgICogcGxh
dGZvcm0gY2FwYWJpbGl0aWVzLCB0aGlzIG1heSBsZWFkIHRvIHRoZSBwaHlzaWNhbCBwb3dlcmlu
ZyBkb3duIG9mDQo+PiA+ICsgICAgICogQ1BVcy4NCj4+ID4gKyAgICAgKi8NCj4+ID4gKyAgICBz
dGF0dXMgPSBkaXNhYmxlX25vbmJvb3RfY3B1cygpOw0KPj4gPiArICAgIGlmICggc3RhdHVzICkN
Cj4+ID4gKyAgICB7DQo+PiA+ICsgICAgICAgIHN5c3RlbV9zdGF0ZSA9IFNZU19TVEFURV9yZXN1
bWU7DQo+PiA+ICsgICAgICAgIGdvdG8gcmVzdW1lX25vbmJvb3RfY3B1czsNCj4+ID4gKyAgICB9
DQo+PiA+ICsNCj4+ID4gKyAgICB0aW1lX3N1c3BlbmQoKTsNCj4+ID4gKw0KPj4gPiArICAgIHN0
YXR1cyA9IGlvbW11X3N1c3BlbmQoKTsNCj4+ID4gKyAgICBpZiAoIHN0YXR1cyApDQo+PiA+ICsg
ICAgew0KPj4gPiArICAgICAgICBzeXN0ZW1fc3RhdGUgPSBTWVNfU1RBVEVfcmVzdW1lOw0KPj4g
PiArICAgICAgICBnb3RvIHJlc3VtZV90aW1lOw0KPj4gPiArICAgIH0NCj4+ID4gKw0KPj4gPiAr
ICAgIGNvbnNvbGVfc3RhcnRfc3luYygpOw0KPj4gPiArICAgIHN0YXR1cyA9IGNvbnNvbGVfc3Vz
cGVuZCgpOw0KPj4gPiArICAgIGlmICggc3RhdHVzICkNCj4+ID4gKyAgICB7DQo+PiA+ICsgICAg
ICAgIGRwcmludGsoWEVOTE9HX0VSUiwgIkZhaWxlZCB0byBzdXNwZW5kIHRoZSBjb25zb2xlLCBl
cnI9JWRcbiIsIHN0YXR1cyk7DQo+PiA+ICsgICAgICAgIHN5c3RlbV9zdGF0ZSA9IFNZU19TVEFU
RV9yZXN1bWU7DQo+PiA+ICsgICAgICAgIGdvdG8gcmVzdW1lX2VuZF9zeW5jOw0KPj4gPiArICAg
IH0NCj4+ID4gKw0KPj4gPiArICAgIGxvY2FsX2lycV9zYXZlKGZsYWdzKTsNCj4+ID4gKyAgICBz
dGF0dXMgPSBnaWNfc3VzcGVuZCgpOw0KPj4gPiArICAgIGlmICggc3RhdHVzICkNCj4+ID4gKyAg
ICB7DQo+PiA+ICsgICAgICAgIHN5c3RlbV9zdGF0ZSA9IFNZU19TVEFURV9yZXN1bWU7DQo+PiA+
ICsgICAgICAgIGdvdG8gcmVzdW1lX2lycXM7DQo+PiA+ICsgICAgfQ0KPj4gPiArDQo+PiA+ICsg
ICAgc2V0X2luaXRfdHRicih4ZW5fcGd0YWJsZSk7DQo+PiA+ICsNCj4+ID4gKyAgICAvKg0KPj4g
PiArICAgICAqIEVuYWJsZSBpZGVudGl0eSBtYXBwaW5nIGJlZm9yZSBlbnRlcmluZyBzdXNwZW5k
IHRvIHNpbXBsaWZ5DQo+PiA+ICsgICAgICogdGhlIHJlc3VtZSBwYXRoDQo+PiA+ICsgICAgICov
DQo+PiA+ICsgICAgdXBkYXRlX2Jvb3RfbWFwcGluZyh0cnVlKTsNCj4+ID4gKw0KPj4gPiArICAg
IGlmICggcHJlcGFyZV9yZXN1bWVfY3R4KCZjcHVfY29udGV4dCkgKQ0KPj4gPiArICAgIHsNCj4+
ID4gKyAgICAgICAgc3RhdHVzID0gY2FsbF9wc2NpX3N5c3RlbV9zdXNwZW5kKCk7DQo+PiA+ICsg
ICAgICAgIC8qDQo+PiA+ICsgICAgICAgICAqIElmIHN1c3BlbmQgaXMgZmluYWxpemVkIHByb3Bl
cmx5IGJ5IGFib3ZlIHN5c3RlbSBzdXNwZW5kIFBTQ0kgY2FsbCwNCj4+ID4gKyAgICAgICAgICog
dGhlIGNvZGUgYmVsb3cgaW4gdGhpcyAnaWYnIGJyYW5jaCB3aWxsIG5ldmVyIGV4ZWN1dGUuIEV4
ZWN1dGlvbg0KPj4gPiArICAgICAgICAgKiB3aWxsIGNvbnRpbnVlIGZyb20gaHlwX3Jlc3VtZSB3
aGljaCBpcyB0aGUgaHlwZXJ2aXNvcidzIHJlc3VtZSBwb2ludC4NCj4+ID4gKyAgICAgICAgICog
SW4gaHlwX3Jlc3VtZSBDUFUgY29udGV4dCB3aWxsIGJlIHJlc3RvcmVkIGFuZCBzaW5jZSBsaW5r
LXJlZ2lzdGVyIGlzDQo+PiA+ICsgICAgICAgICAqIHJlc3RvcmVkIGFzIHdlbGwsIGl0IHdpbGwg
YXBwZWFyIHRvIHJldHVybiBmcm9tIHByZXBhcmVfcmVzdW1lX2N0eC4NCj4+ID4gKyAgICAgICAg
ICogVGhlIGRpZmZlcmVuY2UgaW4gcmV0dXJuaW5nIGZyb20gcHJlcGFyZV9yZXN1bWVfY3R4IG9u
IHN5c3RlbSBzdXNwZW5kDQo+PiA+ICsgICAgICAgICAqIHZlcnN1cyByZXN1bWUgaXMgaW4gZnVu
Y3Rpb24ncyByZXR1cm4gdmFsdWU6IG9uIHN1c3BlbmQsIHRoZSByZXR1cm4NCj4+ID4gKyAgICAg
ICAgICogdmFsdWUgaXMgYSBub24temVybyB2YWx1ZSwgb24gcmVzdW1lIGl0IGlzIHplcm8uIFRo
YXQgaXMgd2h5IHRoZQ0KPj4gPiArICAgICAgICAgKiBjb250cm9sIGZsb3cgd2lsbCBub3QgcmUt
ZW50ZXIgdGhpcyAnaWYnIGJyYW5jaCBvbiByZXN1bWUuDQo+PiA+ICsgICAgICAgICAqLw0KPj4g
PiArICAgICAgICBpZiAoIHN0YXR1cyApDQo+PiA+ICsgICAgICAgICAgICBkcHJpbnRrKFhFTkxP
R19XQVJOSU5HLCAiUFNDSSBzeXN0ZW0gc3VzcGVuZCBmYWlsZWQsIGVycj0lZFxuIiwNCj4+ID4g
KyAgICAgICAgICAgICAgICAgICAgc3RhdHVzKTsNCj4+ID4gKyAgICB9DQo+PiA+ICsNCj4+ID4g
KyAgICBzeXN0ZW1fc3RhdGUgPSBTWVNfU1RBVEVfcmVzdW1lOw0KPj4gPiArICAgIHVwZGF0ZV9i
b290X21hcHBpbmcoZmFsc2UpOw0KPj4gPiArDQo+PiA+ICsgICAgZ2ljX3Jlc3VtZSgpOw0KPj4g
PiArDQo+PiA+ICsgcmVzdW1lX2lycXM6DQo+PiA+ICsgICAgbG9jYWxfaXJxX3Jlc3RvcmUoZmxh
Z3MpOw0KPj4gPiArDQo+PiA+ICsgICAgY29uc29sZV9yZXN1bWUoKTsNCj4+ID4gKyByZXN1bWVf
ZW5kX3N5bmM6DQo+PiA+ICsgICAgY29uc29sZV9lbmRfc3luYygpOw0KPj4gPiArDQo+PiA+ICsg
ICAgaW9tbXVfcmVzdW1lKCk7DQo+PiA+ICsNCj4+ID4gKyByZXN1bWVfdGltZToNCj4+ID4gKyAg
ICB0aW1lX3Jlc3VtZSgpOw0KPj4gPiArDQo+PiA+ICsgcmVzdW1lX25vbmJvb3RfY3B1czoNCj4+
ID4gKyAgICAvKg0KPj4gPiArICAgICAqIFRoZSByY3VfYmFycmllcigpIGhhcyB0byBiZSBhZGRl
ZCB0byBlbnN1cmUgdGhhdCB0aGUgcGVyIGNwdSBhcmVhIGlzDQo+PiA+ICsgICAgICogZnJlZWQg
YmVmb3JlIGEgbm9uLWJvb3QgQ1BVIHRyaWVzIHRvIGluaXRpYWxpemUgaXQgKF9mcmVlX3BlcmNw
dV9hcmVhKCkNCj4+ID4gKyAgICAgKiBoYXMgdG8gYmUgY2FsbGVkIGJlZm9yZSB0aGUgaW5pdF9w
ZXJjcHVfYXJlYSgpKS4gVGhpcyBzY2VuYXJpbyBvY2N1cnMNCj4+ID4gKyAgICAgKiB3aGVuIG5v
bi1ib290IENQVXMgYXJlIGhvdC11bnBsdWdnZWQgb24gc3VzcGVuZCBhbmQgaG90cGx1Z2dlZCBv
biByZXN1bWUuDQo+PiA+ICsgICAgICovDQo+PiA+ICsgICAgcmN1X2JhcnJpZXIoKTsNCj4+ID4g
KyAgICBlbmFibGVfbm9uYm9vdF9jcHVzKCk7DQo+PiA+ICsNCj4+ID4gKyByZXN1bWVfc2NoZWR1
bGVyOg0KPj4gPiArICAgIHNjaGVkdWxlcl9lbmFibGUoKTsNCj4+ID4gKyAgICB0aGF3X2RvbWFp
bnMoKTsNCj4+ID4gKw0KPj4gPiArICAgIHN5c3RlbV9zdGF0ZSA9IFNZU19TVEFURV9hY3RpdmU7
DQo+PiA+ICsNCj4+ID4gKyAgICBwcmludGsoIlJlc3VtZSAoc3RhdHVzICVkKVxuIiwgc3RhdHVz
KTsNCj4+ID4gKw0KPj4gPiArICAgIGRvbWFpbl9yZXN1bWUoZCk7DQo+PiA+ICt9DQo+PiA+ICsN
Cj4+ID4gK3N0YXRpYyBERUNMQVJFX1RBU0tMRVQoc3lzdGVtX3N1c3BlbmRfdGFza2xldCwgc3lz
dGVtX3N1c3BlbmQsIE5VTEwpOw0KPj4gPiArDQo+PiA+ICt2b2lkIGhvc3Rfc3lzdGVtX3N1c3Bl
bmQoc3RydWN0IGRvbWFpbiAqZCkNCj4+ID4gK3sNCj4+ID4gKyAgICBzeXN0ZW1fc3VzcGVuZF90
YXNrbGV0LmRhdGEgPSAodm9pZCAqKWQ7DQo+PiA+ICsgICAgLyoNCj4+ID4gKyAgICAgKiBUaGUg
c3VzcGVuZCBwcm9jZWR1cmUgaGFzIHRvIGJlIGZpbmFsaXplZCBieSB0aGUgcENQVSMwIChub24t
Ym9vdCBwQ1BVcw0KPj4gPiArICAgICAqIHdpbGwgYmUgZGlzYWJsZWQgZHVyaW5nIHRoZSBzdXNw
ZW5kKS4NCj4+ID4gKyAgICAgKi8NCj4+ID4gKyAgICB0YXNrbGV0X3NjaGVkdWxlX29uX2NwdSgm
c3lzdGVtX3N1c3BlbmRfdGFza2xldCwgMCk7DQo+PiA+ICt9DQo+PiA+ICsNCj4+ID4gLyoNCj4+
ID4gICogTG9jYWwgdmFyaWFibGVzOg0KPj4gPiAgKiBtb2RlOiBDDQo+PiA+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vdnBzY2kuYyBiL3hlbi9hcmNoL2FybS92cHNjaS5jDQo+PiA+IGluZGV4
IGJkODdlYzQzMGQuLjhmYjkxNzIxODYgMTAwNjQ0DQo+PiA+IC0tLSBhL3hlbi9hcmNoL2FybS92
cHNjaS5jDQo+PiA+ICsrKyBiL3hlbi9hcmNoL2FybS92cHNjaS5jDQo+PiA+IEBAIC01LDYgKzUs
NyBAQA0KPj4gPg0KPj4gPiAjaW5jbHVkZSA8YXNtL2N1cnJlbnQuaD4NCj4+ID4gI2luY2x1ZGUg
PGFzbS9kb21haW4uaD4NCj4+ID4gKyNpbmNsdWRlIDxhc20vc3VzcGVuZC5oPg0KPj4gPiAjaW5j
bHVkZSA8YXNtL3ZnaWMuaD4NCj4+ID4gI2luY2x1ZGUgPGFzbS92cHNjaS5oPg0KPj4gPiAjaW5j
bHVkZSA8YXNtL2V2ZW50Lmg+DQo+PiA+IEBAIC0yMzIsOCArMjMzLDcgQEAgc3RhdGljIGludDMy
X3QgZG9fcHNjaV8xXzBfc3lzdGVtX3N1c3BlbmQocmVnaXN0ZXJfdCBlcG9pbnQsIHJlZ2lzdGVy
X3QgY2lkKQ0KPj4gPiAgICAgaWYgKCBpc182NGJpdF9kb21haW4oZCkgJiYgaXNfdGh1bWIgKQ0K
Pj4gPiAgICAgICAgIHJldHVybiBQU0NJX0lOVkFMSURfQUREUkVTUzsNCj4+ID4NCj4+ID4gLSAg
ICAvKiBTWVNURU1fU1VTUEVORCBpcyBub3Qgc3VwcG9ydGVkIGZvciB0aGUgaGFyZHdhcmUgZG9t
YWluIHlldCAqLw0KPj4gPiAtICAgIGlmICggaXNfaGFyZHdhcmVfZG9tYWluKGQpICkNCj4+ID4g
KyAgICBpZiAoICFJU19FTkFCTEVEKENPTkZJR19TWVNURU1fU1VTUEVORCkgJiYgaXNfaGFyZHdh
cmVfZG9tYWluKGQpICkNCj4+ID4gICAgICAgICByZXR1cm4gUFNDSV9OT1RfU1VQUE9SVEVEOw0K
Pj4gPg0KPj4gPiAgICAgLyogRW5zdXJlIHRoYXQgYWxsIENQVXMgb3RoZXIgdGhhbiB0aGUgY2Fs
bGluZyBvbmUgYXJlIG9mZmxpbmUgKi8NCj4+ID4gQEAgLTI2Niw2ICsyNjYsOSBAQCBzdGF0aWMg
aW50MzJfdCBkb19wc2NpXzFfMF9zeXN0ZW1fc3VzcGVuZChyZWdpc3Rlcl90IGVwb2ludCwgcmVn
aXN0ZXJfdCBjaWQpDQo+PiA+ICAgICAgICAgICAgICJTWVNURU1fU1VTUEVORCByZXF1ZXN0ZWQs
IGVwb2ludD0lIyJQUklyZWdpc3RlciIsIGNpZD0lIyJQUklyZWdpc3RlciJcbiIsDQo+PiA+ICAg
ICAgICAgICAgIGVwb2ludCwgY2lkKTsNCj4+ID4NCj4+ID4gKyAgICBpZiAoIGlzX2NvbnRyb2xf
ZG9tYWluKGQpICkNCj4+DQo+PiBXaHkgaXNfY29udHJvbF9kb21haW4oKSBoZXJlIGFuZCBub3Qg
aXNfaGFyZHdhcmVfZG9tYWluKCkgPw0KPg0KPiBUaGUgdXNlIG9mIGlzX2NvbnRyb2xfZG9tYWlu
KCkgaXMgaW50ZW50aW9uYWwuDQo+DQo+IFRoZSBpbnRlbmRlZCBtb2RlbCBpcyB0aGF0IFhlbi13
aWRlIGhvc3Qgc3VzcGVuZCBpcyBvcmNoZXN0cmF0ZWQgYnkgdGhlDQo+IHByaXZpbGVnZWQgbWFu
YWdlbWVudC9jb250cm9sIGRvbWFpbi4gVGhlIGNvbnRyb2wgZG9tYWluIGNvb3JkaW5hdGVzIHRo
ZQ0KPiB0b29sc3RhY2sgc2lkZSwgYXNrcyBvdGhlciBkb21haW5zIHRvIGVudGVyIHN1c3BlbmQs
IGFuZCB0aGVuIGlzc3VlcyB0aGUgZmluYWwNCj4gU1lTVEVNX1NVU1BFTkQgcmVxdWVzdCB0byBY
ZW4uDQo+DQo+IFRoaXMgZG9lcyBub3QgaGF2ZSB0byBiZSB0aGUgc2FtZSBlbnRpdHkgYXMgdGhl
IGhhcmR3YXJlIGRvbWFpbi4gSWYgdGhlDQo+IGhhcmR3YXJlIGRvbWFpbiBpcyBzZXBhcmF0ZSwg
aXQgaXMgb25lIG9mIHRoZSBkb21haW5zIHRoYXQgdGhlIGNvbnRyb2wgZG9tYWluDQo+IHBhcmtz
IGJlZm9yZSB0aGUgZmluYWwgaG9zdCBzdXNwZW5kIHN0ZXAuDQo+DQo+IFRoZSBod2RvbS1zcGVj
aWZpYyBjaGVja3MgaW4gdGhpcyBwYXRjaCBoYXZlIGEgZGlmZmVyZW50IHB1cnBvc2U6IHRoZXkg
YXZvaWQNCj4gdGhlIG9sZCBod2RvbV9zaHV0ZG93bigpIHBhdGggZm9yIFNIVVRET1dOX3N1c3Bl
bmQgYW5kIGFsbG93IHRoZSBoYXJkd2FyZQ0KPiBkb21haW4gdG8gYmUgcGFya2VkIGFzIHBhcnQg
b2YgdGhlIHN1c3BlbmQgc2VxdWVuY2UuIFRoZXkgZG8gbm90IGRlZmluZSB0aGUNCj4gcG9saWN5
IGZvciB3aG8gaXMgYWxsb3dlZCB0byB0cmlnZ2VyIFhlbi13aWRlIGhvc3Qgc3VzcGVuZC4NCj4N
Cj4gVGhhdCBzYWlkLCB0aGlzIHBvbGljeSBtYXkgbm90IGJlIG9wdGltYWwgZm9yIGFsbCBjb25m
aWd1cmF0aW9ucywgZXNwZWNpYWxseQ0KPiB3aGVuIHRoZSBjb250cm9sIGFuZCBoYXJkd2FyZSBk
b21haW4gcm9sZXMgYXJlIHNwbGl0LiBJIHdvdWxkIGFwcHJlY2lhdGUgeW91cg0KPiB2aWV3LCBh
cyB3ZWxsIGFzIHRoZSBtYWludGFpbmVycycgdmlld3MsIG9uIHdoZXRoZXIgdGhlIHRyaWdnZXIg
c2hvdWxkIHJlbWFpbg0KPiBjb250cm9sLWRvbWFpbiBiYXNlZCwgYmUgdGllZCB0byB0aGUgaGFy
ZHdhcmUgZG9tYWluIGluc3RlYWQsIG9yIGJlIGV4cHJlc3NlZA0KPiB0aHJvdWdoIGEgc2VwYXJh
dGUgaG9zdC1zdXNwZW5kIGNhcGFiaWxpdHkvaGVscGVyLg0KDQoNCkhhcmR3YXJlIGRvbWFpbiBv
d25zIGFsbCB0aGUgaGFyZHdhcmUuIEhhcmR3YXJlIHNoYWxsIGJlIHB1dCB0bw0KcG93ZXItZG93
bi9zdXNwZW5kZWQgc3RhdGUgYmVmb3JlIHN1c3BlbmRpbmcgdGhlIFNvQywgc28gaXQgY2FuIGJl
DQpyZXN1bWVkIGFmdGVyd2FyZHMuIFlvdSBjYW4ndCBqdXN0IHBhdXNlIGhhcmR3YXJlIGRvbWFp
biBpbiB0aGUgc2FtZSB3YXkNCmFzIHBhdXNpbmcgYWxsIG90aGVyIGRvbWFpbnMuDQoNCihPZiBj
b3Vyc2UsIHdlJ2xsIGhhdmUgdGhlIHNhbWUgaXNzdWVzIHdpdGggZG9tYWluIHRoYXQgaGF2ZQ0K
cGFzc2VkLXRocm91Z2ggaGFyZHdhcmUsIGJ1dCBpbiB0aGlzIGNhc2UgRG9tMCBzaGFsbCBvcmNo
ZXN0cmF0ZSBwcm9wZXINCnN1c3BlbmQgc2VxdWVuY2UgZm9yIHRoZXNlKQ0KDQpbLi4uXQ0KDQot
LSANCldCUiwgVm9sb2R5bXly

