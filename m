Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFpiBrImzWlkaQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:07:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6589037BD68
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 16:07:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270363.1559051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wE6-0004ka-9O; Wed, 01 Apr 2026 14:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270363.1559051; Wed, 01 Apr 2026 14:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7wE6-0004i4-51; Wed, 01 Apr 2026 14:07:22 +0000
Received: by outflank-mailman (input) for mailman id 1270363;
 Wed, 01 Apr 2026 14:07:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1w7wE4-0004hy-IA
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:07:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7wE3-00GHo9-SN
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 16:07:19 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69cd2695-e002-0a2a0a5209dd-0a2a4503a766-12
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:07:19 +0200
Received: from [40.107.130.138]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69cd2697-02b3-0a2a45030019-286b828a08ea-4
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 16:07:19 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GVXPR03MB10247.eurprd03.prod.outlook.com
 (2603:10a6:150:15c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 14:07:17 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9745.027; Wed, 1 Apr 2026
 14:07:15 +0000
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
 b=TNip1FhlsVINwKipBAn0Oua4DeJMtbe3VkGzOmVRpbSubZ3pAVIQ6wFvf+A1Z/lz/T6vrA9HaN7p5vRPoMKnCXn0gNzeK+dt6BQmwNMjnke25ovHuspB06wrP13jNiT02njYAJO4C+zWqljo5c3d+A2rv6VUpSYkS4S4S0GIC2VGD1AUamBhfJNMVT1AHnHStWvRZ0YpANINzGvXClgdOnvhYZK4zhsxBC0MGpfM3IDYmmHnZbvvMkj+1UqrG1e//jM2Rm0sXHme4gr/AY12gKQS+9flFJT0BC2d3JrLwptpkbB8A+kAQWXTcnAQxE5DfZsz9gNLbUU4Nc3RD4xoCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9+z0TQLIKNTYmNzetCC+8epCDmJMvnYSr4IQDMSKGY=;
 b=o4oU0dihqDF5xYVZ1NPQoy/9GjXu8e4DRvR1aYfcnT87mNJ1ScFR53XVckfa4KKbZembcFB6MmX6wrE8RwL6gWsd4mKX7UH2Hzy35Gp+LKMGt5AR2H++c6H3Thc4XxV/ZzAsICCME8BuA0OH8GVXr+wHDM85xNxbUyuwSFiq0wlKkpWBTLQE2EFuFIJixExyBeXLgvN/CEY446FPUeq3a5QbYyK05QH2kl7f+VwysQyvhNfGEQKsjtuABwC0U+YUmVidAU4vrkHIexR90NGrhJq6lFNr+QWA5VHaqcbK/yJJLMNde6jAix+xFTWg6saVInWJL/j/3E19qFyNAzeGvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9+z0TQLIKNTYmNzetCC+8epCDmJMvnYSr4IQDMSKGY=;
 b=th3/5AOzZxrnIJ/yMV3NzoHchlpdn/GZt/YRxTjdUrUusOV7LLAYJVwNzfjDSXYcM+arSTzCdsRQXEzRs7n45Rp9oYD6bxxMLA1t207Ysdxa/fFEfnmGyWAPlyhvONN2KBtaFCSEQY2u5yriIpaYGXSQB/aut28BZKObKhSfuxunzM5axQlxPn9LVON2BDh8y7mn/JHZfsjd7Lw1r+R34qXd8DD0o12LEw72twz4qseCOrY8QJKQbbtayj5CrzrtlUZOC4WQsWOCFJlIhFZ8YV3iAfyphjfb1BeT7/LKevI+TRUYVGDx2QgcoU0x4QfXBUr7U6yOlgHQmHbrkZTagQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/8] vpci: add a wait operation to the vpci vcpu
 pending actions
Thread-Topic: [PATCH v2 4/8] vpci: add a wait operation to the vpci vcpu
 pending actions
Thread-Index: AQHcr7UNjpbdOXJQP0qdir/zrd85obXI3WYAgAEeNICAAAXvAIAAYLsA
Date: Wed, 1 Apr 2026 14:07:15 +0000
Message-ID: <13714c88-838b-4dc7-bc0b-b6ca590fd944@epam.com>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
 <ec941fbf4f8bde23fc3867e47f5ada028f8003aa.1772806036.git.mykyta_poturai@epam.com>
 <f546ae19-2107-469e-847b-7a4cde2c95fd@suse.com>
 <0275be7d-d1d9-47ee-bec2-bfbbb90b4bae@epam.com>
 <46f4a4c5-cc44-47d7-8d6d-03ddaa75bb7f@suse.com>
In-Reply-To: <46f4a4c5-cc44-47d7-8d6d-03ddaa75bb7f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GVXPR03MB10247:EE_
x-ms-office365-filtering-correlation-id: fac61236-a5e7-4ebe-8b1d-08de8ff7fa8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 0tDUqT14fYl5NiSSR+BUqniS4sgqzQZW21t+B2GJVvKr8tCyQM4rqrAp9WqdPMmtnF9b1ACnTWllpFRX0lwmnwGjHSMHbI2DrwAjmFLYxFL2d4Y5LjZc2sUF+nq8MAHNo52IxRIFVzf/REJtch5dxgK9XYK+AdzhSda9RdUwsiawLcX9yX3/4CsqB5NBhNcLZ4KdPUcDnDtOpJDRSjL+ywhRFP3iTNhn53P6+t240LxtYYwCYWiSP5g2/dGyGmLlntRPvwuJkmrlEnB4d3JaTgOdFR8aeYYvDeSzIEdg1TZEyNTTZrwijR6ziaSt2ltJxMCvGziKmGoQnHjFV2nJSg/GC7rWOmrjRjojlOHuYDFwNPTEp3qGc+AZMVGSB3O/ycJTI9PcBTGZPHYuPZyzHdbrsgVAkvMUQ8izhNrJoScnbnFBPWWVTcIgU4MsnTsUHsRc3YUdVuNfp+B5A3iU8e5XuHrAPhqTrwTTA2EimGin5qC9PEdlAQizUoSfQ7238vWtK5fs6XMq5c3u9tjTxikoXm4LuT1nCSE/roVKromwxOtTY/E/UtcK4RYZfmJSqa7pNpDo4wgHVh2yGbjSxoQ+Q5HgmEst5v2UP6vdMiuSvXXc9XuwKx03zNV0UeOYmJpTP26CJWdva+6NhUC2UtvHgN+G2PU/58KS1bJ4OeAEYcVQ0RJvye+08UAJmFqlgi8IuNGb48MHRFE3jZp5HOrRCaVP+n0kKkE+N/WhGlJH9VDPF3WAzcZGHMq+UNtWFVSnZ68DArFWl9oKzc9Mxc7aDlQ6D7XsgWeMIO/HXcU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U0dzVFpQTTYzQjV2eFV3WmVQUGhHS0MvaWxOSnc1Qy9DS0dtbG81K0lqU0ow?=
 =?utf-8?B?SmtDZVo2VUdWc2Zrd2VhRGdKUW5GUE1ZejBrZnBNdi9DZVI3aWdhUkxPanla?=
 =?utf-8?B?N3Rici96NllneWxDdnVTNGpFeDZhUyttazNEWTB6RGlkWThNNTI3ZWpjbnUx?=
 =?utf-8?B?dGhBaUwxTVhiTE04R2dDTmdVRFpxNzdGVUdlV1hNa0FwbTFvQWNVRlNYR0NX?=
 =?utf-8?B?TWY2YkVoUG53Lzd5bHRSR3VQYVpjekJ5YVhya3pBRS9uVXY5RjZtMExFTFQ5?=
 =?utf-8?B?OFJVQnJhcnVPRXZSRHdFUitBMUJ6b3JPN3p0RjczU1UwNEpaNXd3U2RjdFJU?=
 =?utf-8?B?TXJFakxERU9hQ1ZJQ0dUNFc2bXdpd01SZTdZZTF3Uk1TNUlYZ0dJUzcxQnBn?=
 =?utf-8?B?eHZXb1ZLN3Bra3dJTk5XeFMzcUNuUDN1V1Y5ZVpVY29vTHo1SXExSHlPVStw?=
 =?utf-8?B?dkIvcWpkYkEvLy9qZjlhWFlGU2FKeVUwbVlNTjdHQk9Qc1hJVkFoeEpZcHFJ?=
 =?utf-8?B?SzRvbGxnVCs4VFVUcENzYVRWSXZxQnllVjZKb01keE90UUtCR09UQ1E5a0lv?=
 =?utf-8?B?SlVtRkJmeHh2N1p3SmxBSXBOUmpBNUFoLzFzRGtIUVhlL25idVBoeEVDSnJu?=
 =?utf-8?B?ZEx5SklybkZyem5VSEJZL3VBVGFtemE0UldPalFnVHRHRVFQNXlhMDBQWW5R?=
 =?utf-8?B?N0tBRGd4YUplaGIwUE5pSDFzK2lxWkFTblJaUkErajVDMjk5ZStMdnpaRjhn?=
 =?utf-8?B?TWVzTXpLU2ZxSlhSZW5rdEhPVUsydUYzWHpPQ2xMaEV4bHlWcTJLUU1OQ3k2?=
 =?utf-8?B?WnRKNGFuS1JqVWdYWGRhVUZIV1ViNUZZVDFBSkg1T0tBNHhab1ZFNmhlUTBN?=
 =?utf-8?B?cEN4M3JuUTlyV0hVU1A2MHVJT0dSMTQyVzhsbHBmbUYzTTVTLzMvK1BJMjNO?=
 =?utf-8?B?RzMrWHp0Z1ZHelN4NFphZ3ZVVitnb25SdDJmQWFVZVlMZWE0eTZNVDhadVJX?=
 =?utf-8?B?V3FKR3R1S3RYRUJLSUNhdDRtVkRZRmNIK2tERjA2K0dkSTdDL0dVaWtTU3Bh?=
 =?utf-8?B?Wm45VWFZWElsRG1FVFpleVRZWlVheGtXZnFmeHpCWjk5RkhzYmw2YjRNbS9H?=
 =?utf-8?B?ajdWeGxQRW1BYU1yYld3cHZGWUtaOVI5aFBOeTJNYktIZXlxNHhZemlMOE1Z?=
 =?utf-8?B?K1pYVkY4aCs1YmdZVVhmNTdHOFNYRWRMS2FUT2FkVWJXdm85aE9MUGlhRHZG?=
 =?utf-8?B?dlRzWHdPTFJ0ZjBSaFZ4eWJ3ckNicUNvSWdNbGRUS1dXTDhCTzdDMEQwUi81?=
 =?utf-8?B?Rm5xYWgwdC81QWJJaGM0c3hpMnM3RU9KVjVQVkU5cTAzUlRtL2FVbjVxTE9M?=
 =?utf-8?B?b0o3aEwyTmpQVEJVWE1LYnBxTGJjalorU2xpcGFjQ0tucndCQjhHQVhSeklY?=
 =?utf-8?B?T3VZZG5Qa094NUluOUhiejE4NkpSNmY2ZzQ4b0pLZ2Rxb0tBVzhzdlExa2ha?=
 =?utf-8?B?YnFST01xMEJCbjEvUGJvR0xrZlBUdUN1elJYOFVSc2JGV1lTejBTcC8vbmV0?=
 =?utf-8?B?enhBcGJUb2c5UHJtam56a0tnL3ptdWF4SEs3bzM4NzNEa0pzUkxIaWxheFQw?=
 =?utf-8?B?eGdtN0x6QS8zL3BCeUo0VHRMMWE5TDBvVGlrbHlMdUJUalBoMXlhNk1XMnBR?=
 =?utf-8?B?cVpaUDFraWtLam8zV29ET2tCVWZvSzVvT0c0ZFVZeWZlME5odHNDVmlzeGVQ?=
 =?utf-8?B?eG9tQzFUS2xSMmJkd3hBMHZ3TlFQeDNoemdzZ3NpR2laYWVGZDk1dnRXdThK?=
 =?utf-8?B?bHBBUFlpSXJ0TWl3aHdmMURtQ2NnVVBhVk1yMUZLY3hGWXhwdys4emhrSnhY?=
 =?utf-8?B?cDdBN1QwQS85eWQyazFWdFZWV1k3a1ltNVFmNFp4bWtOVm5oN1AvVm55dHlS?=
 =?utf-8?B?aUxHTGFvbU9UT3BBRHdELzl1Y1Jua2k3VG5PWnpNTTREMCs5WGFvYTZoQnNa?=
 =?utf-8?B?UWJ4eUVyVTYrRkhrR1pzOFZBbmx4SjZUWk9LV0pvZEtVTEVZSXc2bU55RHlF?=
 =?utf-8?B?RlNGaWVwdjYwaXFOaWh1NUs0UlpURVJyVkZ5Tm5kcU01amQ4QTR1VXpFbC9l?=
 =?utf-8?B?dU9hZDJ1NVdlSmxHemw5alZIcTJvVXcvSnd4R1dON21TQ0dDVm9hdnRlZ0tB?=
 =?utf-8?B?M3BUMzc4WHprTmJwakFFcjJpVTU5Q0c0S2lGVTlQMnZxbjkrQjBmdmt3dU5x?=
 =?utf-8?B?Tm9ZVi9FUHZVbEVWdnAva0dyR21DUE55aHgyaG9DUEFvbTFuOGJFd3E5Qkdx?=
 =?utf-8?B?YTcybmhhbzY3K2ZhZ09ocWpiMXZQRGV3bTN3N05PVFlxRmRsZVVVUVFJT1FK?=
 =?utf-8?Q?jsLtfTiiWYT5hFYA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0430F22134C73B4D889B8DD8E66E1621@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fac61236-a5e7-4ebe-8b1d-08de8ff7fa8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 14:07:15.5907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j4BLoqlcC1Eyb7KLNl4i/S1DLszpmVNua7v/L/Ca0QY9eywSyO46rMNF6wrXoq4RRd3l6nmvUcUmCwd4r6g2yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10247
X-purgate-ID: tlsNG-33051d/1775052439-40369C9A-9EC1B4A1/0/0
X-purgate-type: clean
X-purgate-size: 10608
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:mid];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MAILSPIKE_FAIL(0.00)[192.237.175.120:query timed out];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6589037BD68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCk9uIDQvMS8yNiAxMToyMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAxLjA0LjIwMjYg
MDk6NTksIE15a3l0YSBQb3R1cmFpIHdyb3RlOg0KPj4gT24gMy8zMS8yNiAxNzo1NSwgSmFuIEJl
dWxpY2ggd3JvdGU6DQo+Pj4gT24gMDkuMDMuMjAyNiAxMjowOCwgTXlreXRhIFBvdHVyYWkgd3Jv
dGU6DQo+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+Pj4gKysrIGIveGVu
L2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+PiBAQCAtMTc1LDc2ICsxNzUsOTIgQEAgc3RhdGlj
IHZvaWQgbW9kaWZ5X2RlY29kaW5nKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1aW50MTZf
dCBjbWQsDQo+Pj4+ICAgIA0KPj4+PiAgICBib29sIHZwY2lfcHJvY2Vzc19wZW5kaW5nKHN0cnVj
dCB2Y3B1ICp2KQ0KPj4+PiAgICB7DQo+Pj4+IC0gICAgY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBk
ZXYgPSB2LT52cGNpLnBkZXY7DQo+Pj4+IC0gICAgc3RydWN0IHZwY2lfaGVhZGVyICpoZWFkZXIg
PSBOVUxMOw0KPj4+PiAtICAgIHVuc2lnbmVkIGludCBpOw0KPj4+PiAtDQo+Pj4+IC0gICAgaWYg
KCAhcGRldiApDQo+Pj4+IC0gICAgICAgIHJldHVybiBmYWxzZTsNCj4+Pj4gLQ0KPj4+PiAtICAg
IHJlYWRfbG9jaygmdi0+ZG9tYWluLT5wY2lfbG9jayk7DQo+Pj4+IC0NCj4+Pj4gLSAgICBpZiAo
ICFwZGV2LT52cGNpIHx8ICh2LT5kb21haW4gIT0gcGRldi0+ZG9tYWluKSApDQo+Pj4+ICsgICAg
c3dpdGNoICggdi0+dnBjaS50YXNrICkNCj4+Pj4gICAgICAgIHsNCj4+Pj4gLSAgICAgICAgdi0+
dnBjaS5wZGV2ID0gTlVMTDsNCj4+Pj4gLSAgICAgICAgcmVhZF91bmxvY2soJnYtPmRvbWFpbi0+
cGNpX2xvY2spOw0KPj4+PiAtICAgICAgICByZXR1cm4gZmFsc2U7DQo+Pj4+IC0gICAgfQ0KPj4+
PiAtDQo+Pj4+IC0gICAgaGVhZGVyID0gJnBkZXYtPnZwY2ktPmhlYWRlcjsNCj4+Pj4gLSAgICBm
b3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJWkUoaGVhZGVyLT5iYXJzKTsgaSsrICkNCj4+Pj4gKyAg
ICBjYXNlIE1PRElGWV9NRU1PUlk6DQo+Pj4+ICAgICAgICB7DQo+Pj4+IC0gICAgICAgIHN0cnVj
dCB2cGNpX2JhciAqYmFyID0gJmhlYWRlci0+YmFyc1tpXTsNCj4+Pj4gLSAgICAgICAgc3RydWN0
IHJhbmdlc2V0ICptZW0gPSB2LT52cGNpLmJhcl9tZW1baV07DQo+Pj4+IC0gICAgICAgIHN0cnVj
dCBtYXBfZGF0YSBkYXRhID0gew0KPj4+PiAtICAgICAgICAgICAgLmQgPSB2LT5kb21haW4sDQo+
Pj4+IC0gICAgICAgICAgICAubWFwID0gdi0+dnBjaS5jbWQgJiBQQ0lfQ09NTUFORF9NRU1PUlks
DQo+Pj4+IC0gICAgICAgICAgICAuYmFyID0gYmFyLA0KPj4+PiAtICAgICAgICB9Ow0KPj4+PiAt
ICAgICAgICBpbnQgcmM7DQo+Pj4+ICsgICAgICAgIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2
ID0gdi0+dnBjaS5tZW1vcnkucGRldjsNCj4+Pj4gKyAgICAgICAgc3RydWN0IHZwY2lfaGVhZGVy
ICpoZWFkZXIgPSBOVUxMOw0KPj4+PiArICAgICAgICB1bnNpZ25lZCBpbnQgaTsNCj4+Pj4gICAg
DQo+Pj4+IC0gICAgICAgIGlmICggcmFuZ2VzZXRfaXNfZW1wdHkobWVtKSApDQo+Pj4+IC0gICAg
ICAgICAgICBjb250aW51ZTsNCj4+Pj4gKyAgICAgICAgaWYgKCAhcGRldiApDQo+Pj4+ICsgICAg
ICAgICAgICBicmVhazsNCj4+Pj4gICAgDQo+Pj4+IC0gICAgICAgIHJjID0gcmFuZ2VzZXRfY29u
c3VtZV9yYW5nZXMobWVtLCBtYXBfcmFuZ2UsICZkYXRhKTsNCj4+Pj4gKyAgICAgICAgcmVhZF9s
b2NrKCZ2LT5kb21haW4tPnBjaV9sb2NrKTsNCj4+Pj4gICAgDQo+Pj4+IC0gICAgICAgIGlmICgg
cmMgPT0gLUVSRVNUQVJUICkNCj4+Pj4gKyAgICAgICAgaWYgKCAhcGRldi0+dnBjaSB8fCAodi0+
ZG9tYWluICE9IHBkZXYtPmRvbWFpbikgKQ0KPj4+PiAgICAgICAgICAgIHsNCj4+Pj4gKyAgICAg
ICAgICAgIHYtPnZwY2kubWVtb3J5LnBkZXYgPSBOVUxMOw0KPj4+PiAgICAgICAgICAgICAgICBy
ZWFkX3VubG9jaygmdi0+ZG9tYWluLT5wY2lfbG9jayk7DQo+Pj4+IC0gICAgICAgICAgICByZXR1
cm4gdHJ1ZTsNCj4+Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4+PiAgICAgICAgICAgIH0NCj4+
Pj4gICAgDQo+Pj4+IC0gICAgICAgIGlmICggcmMgKQ0KPj4+PiArICAgICAgICBoZWFkZXIgPSAm
cGRldi0+dnBjaS0+aGVhZGVyOw0KPj4+PiArICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEFSUkFZ
X1NJWkUoaGVhZGVyLT5iYXJzKTsgaSsrICkNCj4+Pj4gICAgICAgICAgICB7DQo+Pj4+IC0gICAg
ICAgICAgICBzcGluX2xvY2soJnBkZXYtPnZwY2ktPmxvY2spOw0KPj4+PiAtICAgICAgICAgICAg
LyogRGlzYWJsZSBtZW1vcnkgZGVjb2RpbmcgdW5jb25kaXRpb25hbGx5IG9uIGZhaWx1cmUuICov
DQo+Pj4+IC0gICAgICAgICAgICBtb2RpZnlfZGVjb2RpbmcocGRldiwgdi0+dnBjaS5jbWQgJiB+
UENJX0NPTU1BTkRfTUVNT1JZLA0KPj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZh
bHNlKTsNCj4+Pj4gLSAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZwZGV2LT52cGNpLT5sb2NrKTsN
Cj4+Pj4gKyAgICAgICAgICAgIHN0cnVjdCB2cGNpX2JhciAqYmFyID0gJmhlYWRlci0+YmFyc1tp
XTsNCj4+Pj4gKyAgICAgICAgICAgIHN0cnVjdCByYW5nZXNldCAqbWVtID0gdi0+dnBjaS5iYXJf
bWVtW2ldOw0KPj4+PiArICAgICAgICAgICAgc3RydWN0IG1hcF9kYXRhIGRhdGEgPSB7DQo+Pj4+
ICsgICAgICAgICAgICAgICAgLmQgPSB2LT5kb21haW4sDQo+Pj4+ICsgICAgICAgICAgICAgICAg
Lm1hcCA9IHYtPnZwY2kubWVtb3J5LmNtZCAmIFBDSV9DT01NQU5EX01FTU9SWSwNCj4+Pj4gKyAg
ICAgICAgICAgICAgICAuYmFyID0gYmFyLA0KPj4+PiArICAgICAgICAgICAgfTsNCj4+Pj4gKyAg
ICAgICAgICAgIGludCByYzsNCj4+Pj4gKw0KPj4+PiArICAgICAgICAgICAgaWYgKCByYW5nZXNl
dF9pc19lbXB0eShtZW0pICkNCj4+Pj4gKyAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4+Pj4g
ICAgDQo+Pj4+IC0gICAgICAgICAgICAvKiBDbGVhbiBhbGwgdGhlIHJhbmdlc2V0cyAqLw0KPj4+
PiAtICAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGhlYWRlci0+YmFycyk7
IGkrKyApDQo+Pj4+IC0gICAgICAgICAgICAgICAgaWYgKCAhcmFuZ2VzZXRfaXNfZW1wdHkodi0+
dnBjaS5iYXJfbWVtW2ldKSApDQo+Pj4+IC0gICAgICAgICAgICAgICAgICAgICByYW5nZXNldF9w
dXJnZSh2LT52cGNpLmJhcl9tZW1baV0pOw0KPj4+PiArICAgICAgICAgICAgcmMgPSByYW5nZXNl
dF9jb25zdW1lX3JhbmdlcyhtZW0sIG1hcF9yYW5nZSwgJmRhdGEpOw0KPj4+PiAgICANCj4+Pj4g
LSAgICAgICAgICAgIHYtPnZwY2kucGRldiA9IE5VTEw7DQo+Pj4+ICsgICAgICAgICAgICBpZiAo
IHJjID09IC1FUkVTVEFSVCApDQo+Pj4+ICsgICAgICAgICAgICB7DQo+Pj4+ICsgICAgICAgICAg
ICAgICAgcmVhZF91bmxvY2soJnYtPmRvbWFpbi0+cGNpX2xvY2spOw0KPj4+PiArICAgICAgICAg
ICAgICAgIHJldHVybiB0cnVlOw0KPj4+PiArICAgICAgICAgICAgfQ0KPj4+PiAgICANCj4+Pj4g
LSAgICAgICAgICAgIHJlYWRfdW5sb2NrKCZ2LT5kb21haW4tPnBjaV9sb2NrKTsNCj4+Pj4gKyAg
ICAgICAgICAgIGlmICggcmMgKQ0KPj4+PiArICAgICAgICAgICAgew0KPj4+PiArICAgICAgICAg
ICAgICAgIHNwaW5fbG9jaygmcGRldi0+dnBjaS0+bG9jayk7DQo+Pj4+ICsgICAgICAgICAgICAg
ICAgLyogRGlzYWJsZSBtZW1vcnkgZGVjb2RpbmcgdW5jb25kaXRpb25hbGx5IG9uIGZhaWx1cmUu
ICovDQo+Pj4+ICsgICAgICAgICAgICAgICAgbW9kaWZ5X2RlY29kaW5nKHBkZXYsIHYtPnZwY2ku
bWVtb3J5LmNtZCAmIH5QQ0lfQ09NTUFORF9NRU1PUlksDQo+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGZhbHNlKTsNCj4+Pj4gKyAgICAgICAgICAgICAgICBzcGluX3VubG9j
aygmcGRldi0+dnBjaS0+bG9jayk7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICAgICAgICAgICAvKiBD
bGVhbiBhbGwgdGhlIHJhbmdlc2V0cyAqLw0KPj4+PiArICAgICAgICAgICAgICAgIGZvciAoIGkg
PSAwOyBpIDwgQVJSQVlfU0laRShoZWFkZXItPmJhcnMpOyBpKysgKQ0KPj4+PiArICAgICAgICAg
ICAgICAgICAgICBpZiAoICFyYW5nZXNldF9pc19lbXB0eSh2LT52cGNpLmJhcl9tZW1baV0pICkN
Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHJhbmdlc2V0X3B1cmdlKHYtPnZwY2kuYmFy
X21lbVtpXSk7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICAgICAgICAgICB2LT52cGNpLm1lbW9yeS5w
ZGV2ID0gTlVMTDsNCj4+Pj4gKw0KPj4+PiArICAgICAgICAgICAgICAgIHJlYWRfdW5sb2NrKCZ2
LT5kb21haW4tPnBjaV9sb2NrKTsNCj4+Pj4gICAgDQo+Pj4+IC0gICAgICAgICAgICBpZiAoICFp
c19oYXJkd2FyZV9kb21haW4odi0+ZG9tYWluKSApDQo+Pj4+IC0gICAgICAgICAgICAgICAgZG9t
YWluX2NyYXNoKHYtPmRvbWFpbik7DQo+Pj4+ICsgICAgICAgICAgICAgICAgaWYgKCAhaXNfaGFy
ZHdhcmVfZG9tYWluKHYtPmRvbWFpbikgKQ0KPj4+PiArICAgICAgICAgICAgICAgICAgICBkb21h
aW5fY3Jhc2godi0+ZG9tYWluKTsNCj4+Pj4gICAgDQo+Pj4+IC0gICAgICAgICAgICByZXR1cm4g
ZmFsc2U7DQo+Pj4+ICsgICAgICAgICAgICAgICAgYnJlYWs7DQo+Pj4+ICsgICAgICAgICAgICB9
DQo+Pj4+ICAgICAgICAgICAgfQ0KPj4+PiAtICAgIH0NCj4+Pj4gLSAgICB2LT52cGNpLnBkZXYg
PSBOVUxMOw0KPj4+PiArICAgICAgICB2LT52cGNpLm1lbW9yeS5wZGV2ID0gTlVMTDsNCj4+Pj4g
ICAgDQo+Pj4+IC0gICAgc3Bpbl9sb2NrKCZwZGV2LT52cGNpLT5sb2NrKTsNCj4+Pj4gLSAgICBt
b2RpZnlfZGVjb2RpbmcocGRldiwgdi0+dnBjaS5jbWQsIHYtPnZwY2kucm9tX29ubHkpOw0KPj4+
PiAtICAgIHNwaW5fdW5sb2NrKCZwZGV2LT52cGNpLT5sb2NrKTsNCj4+Pj4gKyAgICAgICAgc3Bp
bl9sb2NrKCZwZGV2LT52cGNpLT5sb2NrKTsNCj4+Pj4gKyAgICAgICAgbW9kaWZ5X2RlY29kaW5n
KHBkZXYsIHYtPnZwY2kubWVtb3J5LmNtZCwgdi0+dnBjaS5tZW1vcnkucm9tX29ubHkpOw0KPj4+
PiArICAgICAgICBzcGluX3VubG9jaygmcGRldi0+dnBjaS0+bG9jayk7DQo+Pj4+ICAgIA0KPj4+
PiAtICAgIHJlYWRfdW5sb2NrKCZ2LT5kb21haW4tPnBjaV9sb2NrKTsNCj4+Pj4gKyAgICAgICAg
cmVhZF91bmxvY2soJnYtPmRvbWFpbi0+cGNpX2xvY2spOw0KPj4+PiArDQo+Pj4+ICsgICAgICAg
IGJyZWFrOw0KPj4+PiArICAgIH0NCj4+Pj4gKyAgICBjYXNlIFdBSVQ6DQo+Pj4+ICsgICAgICAg
IGlmICggTk9XKCkgPCB2LT52cGNpLndhaXQuZW5kICkNCj4+Pj4gKyAgICAgICAgICAgIHJldHVy
biB0cnVlOw0KPj4+PiArICAgICAgICB2LT52cGNpLndhaXQuY2FsbGJhY2sodi0+dnBjaS53YWl0
LmRhdGEpOw0KPj4+PiArICAgICAgICBicmVhazsNCj4+Pg0KPj4+IEFzIGp1c3QgaW5kaWNhdGVk
IGluIHJlcGx5IHRvIHBhdGNoIDYsIGJ1c3kgd2FpdGluZyBpc24ndCByZWFsbHkgYWNjZXB0YWJs
ZS4NCj4+PiBUaGlzIGlzIGV2ZW4gbW9yZSBzbyB3aGVuIHRoZSB3YWl0aW5nIGV4Y2VlZHMgdGhl
IHR5cGljYWwgbGVuZ3RoIG9mIGENCj4+PiBzY2hlZHVsaW5nIHRpbWVzbGljZS4NCj4+Pg0KPj4+
IEluIHRoYXQgb3RoZXIgcmVwbHkgSSBzYWlkIHRvIHB1dCB0aGUgdkNQVSB0byBzbGVlcCwgYnV0
IHlvdSBuZWVkIHRvIGJlIGNhcmVmdWwNCj4+PiB0aGVyZSB0b286IFRoZSBkb21haW4gbWF5IG5v
dCBleHBlY3QgaXRzIHZDUFUgdG8gbm90IG1ha2UgYW55IHByb2dyZXNzIGZvciBzdWNoDQo+Pj4g
YW4gZXh0ZW5kZWQgcGVyaW9kIG9mIHRpbWUuIFRoaXMgbWF5IG5lZWQgZG9pbmcgZW50aXJlbHkg
ZGlmZmVyZW50bHk6IE9uY2UgdGhlDQo+Pj4gY29tbWFuZCByZWdpc3RlciB3YXMgd3JpdHRlbiwg
eW91IG1heSB3YW50IHRvIHJlY29yZCB0aGUgdGltZSBhZnRlciB3aGljaA0KPj4+IGFjY2Vzc2Vz
IHRvIHRoZSBWRiByZWdpc3RlcnMgYXJlIHBlcm1pdHRlZC4gRWFybGllciBhY2Nlc3NlcyB3b3Vs
ZCBzaW1wbHkgYmUNCj4+PiB0ZXJtaW5hdGVkLiBZb3UgbWF5IHN0aWxsIGFkZGl0aW9uYWxseSBu
ZWVkIGEgdGltZXIsIGluIG9yZGVyIHRvIGtpY2sgb2ZmIEJBUg0KPj4+IG1hcHBpbmcgYWZ0ZXIg
dGhhdCB0aW1lLiAoWWV0IGJldHRlciB3b3VsZCAgYmUgaWYgdGhlIEJBUiBtYXBwaW5nIGNvdWxk
IGJlDQo+Pj4gZG9uZSBkdXJpbmcgdGhvc2UgMTAwbXMuIEFmdGVyIGFsbCB0aGF0IG1heSBiZSBh
IHJlYXNvbiB3aHkgdGhpcyBsb25nIGEgZGVsYXkNCj4+PiBpcyBzcGVjaWZpZWQ6IEZpcm13YXJl
IG9uIHRoZSBkZXZpY2UgbWF5IGFsc28gcmVxdWlyZSBzb21lIHRpbWUgdG8gc2V0IHVwIHRoZQ0K
Pj4+IEJBUnMgYWNjb3JkaW5nbHkuKQ0KPj4NCj4+IEkgYW0gbm90IHN1cmUgaXQgd291bGQgd29y
ayB0aGF0IHdheS4gSWYgd2UgbG9vayBhdCBob3cgbGludXgNCj4+IGluaXRpYWxpemVkIHNyaW92
LCBpdCB3cml0ZXMgVkZFIGFuZCBNU0UgYml0cywgd2FpdHMgMTAwbXMgYW5kIHRoZW4NCj4+IGV4
cGVjdHMgVkZzIHRvIGJlIG9wZXJhdGlvbmFsLiBJZiB0aGV5IGFyZSBub3Qgb3BlcmF0aW9uYWwg
YXQgdGhhdA0KPj4gbW9tZW50LCB0aGVuIGl0IGNvbnNpZGVycyB0aGUgb3BlcmF0aW9uIGZhaWxl
ZCBhbmQgcmVtb3ZlcyBhbGwgVkZzLiBJZg0KPj4gd2UgYWxzbyB3YWl0IDEwMG1zIGJlZm9yZSBl
bmFibGluZyBhY2Nlc3MsIHRoZSBwcm9iYWJpbGl0eSBvZiBhIGd1ZXN0DQo+PiB0cnlpbmcgdG8g
YWNjZXNzIHNvbWV0aGluZyBiZWZvcmUgd2UgYWxsb3cgaXQgd291bGQgYmUgdmVyeSBoaWdoLg0K
PiANCj4gV2VsbCwgbm90IHJlYWxseS4gT3VyIGNvdW50aW5nIG9mIHRoZSAxMDBtcyBuZWNlc3Nh
cmlseSBzdGFydHMgYmVmb3JlIERvbTAncy4NCj4gRnVydGhlcm1vcmUgaXQgbWF5IGJlIGFjY2Vw
dGFibGUgKG9yIGV2ZW4gYXBwcm9wcmlhdGUpIHRvIHN0YWxsIHByZW1hdHVyZQ0KPiBhY2Nlc3Nl
cyAoYmVjYXVzZSB0aGV5IHNob3VsZG4ndCBvY2N1ciBpbiB0aGUgZmlyc3QgcGxhY2UpLCBieSBi
bG9ja2luZyB0aGUNCj4gdkNQVSBhdCB0aGF0IHBvaW50LiBBIG1pZGRsZSByb3V0ZSBtYXkgYmUg
cG9zc2libGU6IFRlcm1pbmF0ZSBhY2Nlc3NlcyBpbiwNCj4gc2F5LCB0aGUgZmlyc3QgOTBtcywg
YW5kIHN0YWxsIHRoZSB2Q1BVIGZvciBhbnkgYWNjZXNzIHBhc3QgdGhhdCwgYnV0IGJlZm9yZQ0K
PiB0aGUgMTAwbXMgZXhwaXJlZC4NCj4gDQoNCklzIHRoZXJlIGFueSByZWFsIGJlbmVmaXQgdG8g
ZG9pbmcgYWxsIHRoaXMgd29yayBpbnN0ZWFkIG9mIGp1c3Qgd2FpdGluZyANCmZvciBEb20wIHRv
IHJlZ2lzdGVyIHRoZSBGVnM/IEltcGxlbWVudGluZyBpdCB0aGUgd2F5IHlvdSBkZXNjcmliZWQg
DQp3b3VsZCByZXF1aXJlIGEgcmVsYXRpdmVseSBjb21wbGV4IHN0YXRlIG1hY2hpbmUgYW5kIHR3
byB0aW1lcnMgcGVyIA0Kc3Jpb3YtY2FwYWJsZSBkZXZpY2UuIEFuZCB3aWxsIGFsc28gcHJvYmFi
bHkgcmVxdWlyZSBzb21lIGhhY2tzIHRvIA0KaGFuZGxlIHBhcnRpYWxseSBpbml0aWFsaXplZCBW
RnMgaW4gWGVuLiBUaGlzIGFkZHMgYSBsb3Qgb2Ygd29yayBhbmQgDQptYW55IHBvc3NpYmxlIGJ1
Z3MgZm9yIG5vdCBhIGxvdCBvZiBiZW5lZml0IGluIG15IG9waW5pb24uDQoNCi0tIA0KTXlreXRh

