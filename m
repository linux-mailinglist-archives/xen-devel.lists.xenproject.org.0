Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMiWFEifzmlZpAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 18:54:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE4B38C39A
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 18:54:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1272241.1560034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8LIs-0004yr-0m; Thu, 02 Apr 2026 16:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1272241.1560034; Thu, 02 Apr 2026 16:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8LIr-0004vn-TF; Thu, 02 Apr 2026 16:53:57 +0000
Received: by outflank-mailman (input) for mailman id 1272241;
 Thu, 02 Apr 2026 16:53:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>) id 1w8LIp-0004vh-OD
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 16:53:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8LIp-0076RP-4h
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 18:53:55 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>)
 id 69ce9eff-bab6-0a2a0a5309dd-0a2a4502b5bc-40
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 18:53:55 +0200
Received: from [52.101.84.93]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Oleksandr_Tyshchenko@epam.com>)
 id 69ce9f22-42fa-0a2a45020019-3465545da5a1-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 18:53:55 +0200
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 (2603:10a6:20b:6cc::22) by AM9PR03MB6705.eurprd03.prod.outlook.com
 (2603:10a6:20b:2d6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 2 Apr
 2026 16:53:52 +0000
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::bbbf:5b9b:1043:4510]) by AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::bbbf:5b9b:1043:4510%5]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 16:53:52 +0000
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
 b=W2J5Sc7rq+8noD4ETOCtKt1UsXupyQPfdAhhQI9XyFkxQwAuE3D8W0RGF7e547UA0/JwShj+NkWVjAlt++Wg/vPDd+riDBY8riEcWCfI3m4ZuriH/7/FwJI5TUFMRgQA9wswrt11Jx2jvZDFjNofUXTp3mGRZGqkuVWu0YoWik8/gORYKYeVzwjHlkdkckjQbi8SV/LiYRJYBdc7qB7KLk0lKaZHiutPlDtNt8R+zXWS4Pzb1jfhe3znKKqS98PO+fB2fcOokLaOkMXqgIOMYO5vBMj1fJs94B7//SGRN5lapaicgk2X+yE1s0OcSeRSgkeCliRW555RQJxzkINPCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQqd8AKyR5za5xp0S+ghLRo8Ij748iWcoDWX/6XquFE=;
 b=sar5C4xs3MGF8INAz+FmDQHty4ILMm9d7XYEbMhl6faNWDeZmM+u7AzatUNjfKjJzDE5GwXFYvuL0DtZdjY9f1ziR+GjbzspCSwCPdumNN8o1jW+uEc8yG+U0ieuYGsr2UgXPAkTDZjGnXuAks08MZiuhELhWVTRAzglXQLo38KwLzT6IZC1YCI9R/3nOaNU0kNf83Pql6DvNpH4jUNFuno7UCR4tCMXR1bjGMbAzLBFNtn/GfYisCm9Qj4Ax1p+B3k4E03EhZmUoeYR3/XmDZsm2bBwAJro+ekiE/YTx85QoCEk56fZ0hyw5sanrX9b1PGV/z2SoUXpYCtmb28H0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQqd8AKyR5za5xp0S+ghLRo8Ij748iWcoDWX/6XquFE=;
 b=aElk5qmfZZJ9iZZUjNdBcZIqrEJhu+DjsLMIlE8gpr4yqf7i/rjBS2XBp3lArEFZ7R1GgI5GX6oDELY8iH1yVB1JHWvt1+CXvLdsxy0bQ7/HWgGSFTSUmeMfE7T4I0Hxs8dx/ATmeVsb+Z+VkFsTrUQsIDCj5+/DD/mhsF8/NjcUg+JeUUlg7v/j52f7wr8lHTScKP9hDmoGMB8+BNuSmHYjCEm0xzmYPnNdQwWvG5AVz+LV+WvHh047JLppRn7nAqze878TIzyRpbSA2VYjm5yUK3ntzF6cNPOGDNy/x7CAS6VDOZLuocn9jKZxcs6MCcTmo5OX4dkvpwyBgd5F+g==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH] xen/device-tree: Fix off-by-one bounds check in
 make_memory_node()
Thread-Topic: [PATCH] xen/device-tree: Fix off-by-one bounds check in
 make_memory_node()
Thread-Index: AQHcwpBhsnhldIRLa0qtQ6xVjLEK7LXLt/YAgABFcwA=
Date: Thu, 2 Apr 2026 16:53:52 +0000
Message-ID: <d7691062-3c01-4a70-a7b1-dd1534383119@epam.com>
References: <20260402110330.3580124-1-oleksandr_tyshchenko@epam.com>
 <865ae6a0-15e0-4a27-9537-0c5e6cb0a1cb@amd.com>
In-Reply-To: <865ae6a0-15e0-4a27-9537-0c5e6cb0a1cb@amd.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM4PR03MB11152:EE_|AM9PR03MB6705:EE_
x-ms-office365-filtering-correlation-id: 2f346556-2a2e-4e97-63bf-08de90d86b71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|42112799006|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 OyUHFqLHGmXS0nEZ0mPtQfZlxDy0sOtImGLzJGIMqEUDwxEXYrlroMW+EI7mUW6tu3HBvPnyld/77eMWvE4fNoNYltGVLt3V93VMwv1qfNIGlVM6CbKZV6s5BCFNl3ywyGgP5LC63UUv9nJ51vKsxTNIwcZ6Gpphdl2e3KR6hnQybLrVv446f0nfRxH8GztARidIVMMC+ZzEpYAbk3QBwiY4LH0JZYOSVq5NOcQE4XP7IZgGS11OdiP7dv9J64TIoQjopf92tnmDK0W0ItauHz3prCkD6nzkF6xjHpKd1Thm8byZc+6mAdGli4RmbFQxVUjLMc5fqSj5g33gzPV33nRQ1c9vH2RT/RmXBSNUljviTGe48fYIlJwgWOc+eMHF4loT7a6cqFq40z3oV8ezcqTMkGayRf+C6pKkgqXnEmEsynGVtzBkd+5nJDR2Y8IMP2e9JequMEf5FCZi9SSWtbCUbg3SqBRUl1CXD37lNoY8BSKQbf9S79zSyxhIKLMZq4I/XgNmetaYktUk1oayYhx1xgEbCk2LPMwp5Ij10QWAwXApc1+vfr+vx7nyPQAJ4T0vL8ZtWqvsy5LTE5HDedb/6WJ2KIoX2d30nJcmi+rMWK1GAwrfo2gsu/eRKGXt0lz/C9D7nPEdC0SWj5rkvxANDFE3maDPPjMtlVzzTAnRfEuaWgXqjJi6SWPVNMqjkgRq0LRLNoQIelHd/F/DCjvNtpNVy4Q0t3t8SOJ5EJduJbB2zMtc0A/4RCaZNly0M3MLkuVBHJ+Yp3HHH9Gn/M2vVOU5xpinfK3B7l5fi2g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR03MB11152.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(42112799006)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dzN6d1BSZkRaR3h4T29XR3d0dXNBYzJiOExTa0NENmtKK2dvZEVNVkg4Z3JF?=
 =?utf-8?B?eUpCbU1pZ25sck9YTnI1Z0plcU5ORWlkQ1BZVzd5ekxYUWdlclpXOW81a2Ir?=
 =?utf-8?B?L3JFYXcxWWFkMFV3czNTd25hZkduMmV1NTdzQXN4THlMdEZxUlVZbGJOZmt3?=
 =?utf-8?B?RlgwcTNmRURKYWdaYTdabm9iR2JWV0YweGdFQkhIQlVvVDVkSm13bEhuU2FD?=
 =?utf-8?B?enB3bE53dlNJcGc5SlZNczhSN05RY2lWa2N6OWNVRkxuQlV5VzUzUHlqT0c4?=
 =?utf-8?B?VE1iNE5zMzhYQXlsU1JuQUhsd1B4Z0MrNGVpTUQ4OUF3cTF1clNIZmNSeGdk?=
 =?utf-8?B?OSs3SUJKK0ZsVGxQdkN2bGVQS3l1ckQrdndpQUhEVW1VS0JHSmc3VE5GTFo3?=
 =?utf-8?B?WFpEMERYeG1JeDhVQllENUMyaGdmUllxZXViMEcwYk1UaWVROFpuSmtlNEZP?=
 =?utf-8?B?dFhzWTdTU2ZKbTdvd3MyWnJDMjRwb1M4TmhUcFFkWTlibmJEejU5RXFqTitZ?=
 =?utf-8?B?L0RXc005S0p0WnhmVTBXK1FMU0Z3NnZmUk5xK2hxeGtrWFlmbS8xaXpHc0py?=
 =?utf-8?B?c01nS0hrVWp4OXROUEtmOGVqcytwY3JIL1UyUjBPUGJQUU0yRkxHYzF6cG5G?=
 =?utf-8?B?aWV4T1BqdUQvRW8reTU3cXpMekc5Q0Y5UmFVeGV2QVVFR09ST0hMUmNQZC93?=
 =?utf-8?B?R2lSL01FVnlUOGZhYWVCckMxSVZFSVdkUlhwYUlWRXFCQ2dYeWYyNUtyVU15?=
 =?utf-8?B?cWJJVjQ4eGtEMk1TbmVJTWM5ZityQVh3UGpkZEdKU0R1Qm0vcFFtMlhKN1NP?=
 =?utf-8?B?QXFQNzFrT3NKdWk1WXlZQ21Bd0hOK21wbzFzcXNUTUVjSnN4YnFiNStMVUZU?=
 =?utf-8?B?N3dCZkprNWcyWk8rWlMwK1Z4Wms5M1RxaVg3SVFMTGdsS280YUFva0Vobzg2?=
 =?utf-8?B?MjJhZ2xqcDc5eEEzendZUG1ETEZ5ZHZhNG55aUczNEZQZWhMWGt1YkhVUUE3?=
 =?utf-8?B?cGxMMDdxY1VoZ0FrV2VsSE52KzNIQW5PR3VRQ3lJNTExLzB1elRwbUpxRVMw?=
 =?utf-8?B?clhhVzUxZ1RJdElxNjNyNDN5eldZbmdKei94TEQ5YVAzNkc0UmNpSlMvd3ds?=
 =?utf-8?B?REtkSHZFOFNiYTlaSGFBekJvcEp2V21QSW5RaUh5dXUzU3k3czhmRWI2MzhW?=
 =?utf-8?B?SnpZc3BoQkQxTVhsZ1NGNjJ2SktmUktQK1UxY1A0djFMWHlLU1EyWUdYUTJk?=
 =?utf-8?B?WmRtUllEVU5uWDN5b3lwaFZ3K3lwSmtobE5wakViM3JNanFoWG1WeGllZlp0?=
 =?utf-8?B?SE5QTVlsN1kvaUwxVXpjL3R3eHNxTjcwdFR2V2hOWW9hbHFjTlhiK0dUUHUx?=
 =?utf-8?B?dHVUOWJ5dkpZbGtrT2ltSy9nRjNkSDFEbW5oM3JRRkh0K2RHZ1JRS3ZnR0JO?=
 =?utf-8?B?aHlPMGphNjFNVVZidWkrT1I0R1g3M3hZV3BTWEpVdVQrckpWSTZJODR6V0Fv?=
 =?utf-8?B?VmNIMk9pZFNGKzdNL2RoV2JCSVk4empCcDJvakgrMnN2d21lb25wWkhZU3Uz?=
 =?utf-8?B?SFhVT0dUd1htL29wVUZWdVFCQmhCSU9ldWJmSmMwb2pkNVlhWng3U2FFMHV0?=
 =?utf-8?B?TmlxbnpkZ1lra25ldUZvSVRUMVBPTnBXUkRTUlg1NXZ0UVlRR3RISXNZUFlF?=
 =?utf-8?B?Zi9BS2RFRTBxSlZGdStMOWNIQ0M2WWsxbENCK0JZdDFicGtnbUw5b2FZY2dy?=
 =?utf-8?B?aEhJMUNRVUpuWTVsN2JQTkh5L3dWeFR4MnlvL1VvTkoybmkrdWFqb3U5NlFG?=
 =?utf-8?B?TnBadEVqdVZXRE83Wmc0QkZ4RWhvNFp0Wi9IRlBTL3B4TUdlbzdZUHJaUTlQ?=
 =?utf-8?B?UDZKYjMvNVZwMkorOTA0YWJxQ2lpL2NSaDRHV0h0UlhCM3lOTlRETmdqT3VL?=
 =?utf-8?B?WmtSVi9TL3hhMlFFVFVXY1llQ1gwM1orRFRPdXBsUEtoaHIxMzVuUk9RNHNR?=
 =?utf-8?B?NkR0dE42d2RFUGF1KzBRaEN2K0lDVVA4aWJNdkZ5cHQwRlpiRW5kcmx1ZllT?=
 =?utf-8?B?OXRPZEVVcUpMaDFBd0FWK3ZHREVtZklMZDcvNVJpOUUrQ0ZJUW1jbW05M3p1?=
 =?utf-8?B?ZHg5ZUxJcDdERTVRcHJ6KzBBSzd1Z1ZGYWpBRm5SbDBTOTJ3eVFaaUZpQXVC?=
 =?utf-8?B?aEh0ZXdpajdQUFVLUzdadGNwby9TU3hMRW02ZFk3WHFUbEwvSkRoZ2xhd0tk?=
 =?utf-8?B?VklaSjNMWmxERUh1c0h0UldkMHlHY25iM2lwLzdtNlNxUE53bHI1V2NmQlBq?=
 =?utf-8?B?aGpnaE5acTBMU0FKZkVYaUc3WXJQWFg0eGNNM3FTeDhrOElYdVQwN09sQWoy?=
 =?utf-8?Q?kJ7FDTbOM1axtJpk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E13DAD1AC91DCF4DA53DDEBFB502FE94@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4PR03MB11152.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f346556-2a2e-4e97-63bf-08de90d86b71
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 16:53:52.2753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HhmwlRvIX2vfjbfSOitoQSOmHXWqXaqSTs/SgDo4aZm8TmoFeclLTrp23PVC48BIEU4L5hBsCv+dExXEdpIpcnOdLNIrX6cj9A/eaieP77Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6705
X-purgate-ID: tlsNG-720697/1775148835-AF323CD1-DF0E7D9C/0/0
X-purgate-type: clean
X-purgate-size: 3092
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Oleksandr_Tyshchenko@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,epam.com:dkim,epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Oleksandr_Tyshchenko@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9BE4B38C39A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCk9uIDQvMi8yNiAxNTo0NSwgT3J6ZWwsIE1pY2hhbCB3cm90ZToNCg0KSGVsbG8gTWljaGFs
DQoNCj4gDQo+IA0KPiBPbiAwMi8wNC8yMDI2IDEzOjAzLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3
cm90ZToNCj4+IFdoZW4gYnVpbGRpbmcgWGVuIHdpdGggQ09ORklHX1NUQVRJQ19TSE09biwgYm9v
dGluZyBhIGhhcmR3YXJlDQo+PiBkb21haW4gd2l0aCBleGFjdGx5IE5SX01FTV9CQU5LUyAoMjU2
KSByZXNlcnZlZC1tZW1vcnkgcmVnaW9ucw0KPj4gY2F1c2VzIGEgcGFuaWM6DQo+Pg0KPj4gKFhF
TikgWGVuIEJVRyBhdCBjb21tb24vZGV2aWNlLXRyZWUvZG9tYWluLWJ1aWxkLmM6NDk3DQo+PiAo
WEVOKSBYZW4gY2FsbCB0cmFjZToNCj4+IChYRU4pICAgIFs8MDAwMDBhMDAwMDI4OWFhOD5dIG1h
a2VfbWVtb3J5X25vZGUrMHgxNzgvMHgyMzQgKFBDKQ0KPj4NCj4+IFRoaXMgb2NjdXJzIGR1ZSB0
byBhbiBvZmYtYnktb25lIGVycm9yIGluIHRoZSBib3VuZHMgY2hlY2tpbmcgb2YNCj4+IHRoZSBy
ZWcgYXJyYXkgaW4gbWFrZV9tZW1vcnlfbm9kZSgpLiBUaGUgY2hlY2s6DQo+PiAgICAgIEJVR19P
Tihucl9jZWxscyA+PSBBUlJBWV9TSVpFKHJlZykpOw0KPj4gaW5jb3JyZWN0bHkgdHJpZ2dlcnMg
d2hlbiB0aGUgYXJyYXkgaXMgZXhhY3RseSBmdWxsIChpLmUuLCB3aGVuDQo+PiBucl9jZWxscyA9
PSBBUlJBWV9TSVpFKHJlZykpLCBwcmV2ZW50aW5nIHRoZSAyNTZ0aCBhbmQgZmluYWwgdmFsaWQN
Cj4+IG1lbW9yeSByZWdpb24gZnJvbSBiZWluZyB3cml0dGVuLg0KPj4NCj4+IFdoZW4gQ09ORklH
X1NUQVRJQ19TSE09eSwgdGhpcyBidWcgcmVtYWlucyBoaWRkZW4gYmVjYXVzZQ0KPiBBRkFJQ1Qg
aXQgcmVtYWlucyBoaWRkZW4gYXMgbG9uZyBhcyB5b3UgZG9uJ3QgYWRkIE5SX1NITUVNX0JBTktT
IGJhbmtzLg0KPiBJbiB0aGF0IGNhc2UgeW91IHdpbGwgYWxzbyBoaXQgdGhpcyBwcm9ibGVtLg0K
DQpJIHRoaW5rLCB5b3UgYXJlIHJpZ2h0Lg0KDQo+IA0KPj4gRFRfTUVNX05PREVfUkVHX1JBTkdF
X1NJWkUgYWRkcyBleHRyYSBzcGFjZSBmb3IgU0hNIGJhbmtzLg0KPj4gVGhpcyBleHRyYSBjYXBh
Y2l0eSBwcmV2ZW50cyB0aGUgYXJyYXkgZnJvbSBldmVyIHJlYWNoaW5nIGl0cw0KPj4gbWF4aW11
bSBsaW1pdCB3aGlsZSBwcm9jZXNzaW5nIHRoZSAyNTZ0aCBtZW1vcnkgcmVnaW9uLg0KPj4NCj4+
IEZpeCB0aGlzIGJ5IGNoYW5naW5nIHRoZSBjb25kaXRpb24gdG8gc3RyaWN0bHkgZ3JlYXRlciB0
aGFuICg+KS4NCj4+IEFwcGx5IHRoZSBleGFjdCBzYW1lIGZpeCB0byBzaG1fbWVtX25vZGVfZmls
bF9yZWdfcmFuZ2UoKSB0bw0KPj4gcHJldmVudCB0aGUgc2FtZSBlcnJvci4NCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBh
bS5jb20+DQo+IFRoaXMgc2hvdWxkIGhhdmUgYSBGaXhlcyB0YWcuDQoNCkl0IHRvb2sgc29tZSBk
aWdnaW5nIHRvIGxvY2F0ZSB0aGUgZXhhY3QgY29tbWl0IHNpbmNlIHRoaXMgY29kZSBoYXMgYmVl
biANCm1vdmVkIGFuZCB1cGRhdGVkIHNldmVyYWwgdGltZXMuDQoNCkluaXRpYWxseSwgSSB0aG91
Z2h0IGFib3V0IDlhYWY0MzdjZDM2MSAoInhlbi9hcm06IGRvbid0IGFzc2lnbiBkb21VIA0Kc3Rh
dGljLW1lbSB0byBkb20wIGFzIHJlc2VydmVkLW1lbW9yeSIpLiBIb3dldmVyLCBsb29raW5nIGNs
b3NlbHkgYXQgdGhlIA0KZGlmZiwgdGhhdCBjb21taXQgb25seSBtb3ZlZCB0aGUgb2ZmZW5kaW5n
IEJVR19PTigpIGluc2lkZSBhIGxvb3AgcmF0aGVyIA0KdGhhbiBpbnRyb2R1Y2luZyBpdC4gVW5s
ZXNzIEkgYW0gbWlzdGFrZW4sIHRoZSBjb3JyZWN0IHRhcmdldCBmb3IgdGhlIA0KRml4ZXM6IGlz
IGNkODAxNWI2MzRiMCAoIkFSTS9kb20wOiBBdm9pZCB1c2luZyBhIHZhcmlhYmxlIGxlbmd0aCBh
cnJheSANCmluIG1ha2VfbWVtb3J5X25vZGUoKSIpLg0KDQpBcyBmb3Igc2htX21lbV9ub2RlX2Zp
bGxfcmVnX3JhbmdlKCksIDc4NDZmNzY5OWZlYSAoInhlbi9hcm06IExpc3QgDQpzdGF0aWMgc2hh
cmVkIG1lbW9yeSByZWdpb25zIGFzIC9tZW1vcnkgbm9kZXMiKSBzaW1wbHkgY29waWVkIHRoZSAN
CmV4aXN0aW5nIEJVR19PTigpIGxvZ2ljIGludG8gdGhlIG5ldyBmdW5jdGlvbi4NCg0KDQo+IFdp
dGggdGhhdDoNCj4gUmV2aWV3ZWQtYnk6IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5j
b20+DQoNClRoYW5rcw0KDQo+IA0KPiB+TWljaGFsDQo+IA0K

