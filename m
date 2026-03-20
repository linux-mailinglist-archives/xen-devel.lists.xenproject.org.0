Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKdaBKgLvWkO5gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 09:56:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 648B22D7932
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 09:56:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257857.1552108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3VdH-000488-De; Fri, 20 Mar 2026 08:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257857.1552108; Fri, 20 Mar 2026 08:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3VdH-00045O-Az; Fri, 20 Mar 2026 08:55:03 +0000
Received: by outflank-mailman (input) for mailman id 1257857;
 Fri, 20 Mar 2026 08:55:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AYjX=BU=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1w3VdF-00045I-LC
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 08:55:01 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 628efb2f-243a-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Mar 2026 09:54:20 +0100 (CET)
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by PAVPR03MB9066.eurprd03.prod.outlook.com (2603:10a6:102:323::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Fri, 20 Mar
 2026 08:54:17 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 08:54:17 +0000
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
X-Inumbo-ID: 628efb2f-243a-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3ByAROf6KJvB0cb2/j/3gRG6IGlhuWFtwtpcazrCP1tBIWni5bCXrHRx3+5jtDf0xCtDARq/McPUozUO7zZk3+fOyLwU1N3PCTd0OkkcQrgGuSMRtbb6Q0gjyYLO1817dQEHv4Csrcx+bJNWPh8xSPHqCw/hR9TZm2zY4YE5cgWsH3YBR/Cknd6FxrXqaKMCuYjN8dPwse27SgHS2pRSmXIFy6AzCF+JxEqZTSJsAkXpsgqidTojlQDAB0++IflP6AzG/QB7WbqUPi6gec+TKv5SDm7tV6eIbcmBbloC4MbgTWTPEbFHv4raZAljPr2c+JZelG7czaU0uS+8p/lCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/bU8wI65kc+5Xbu7+4cTwVoNX7u03CmcuXMU1FqfgE=;
 b=kX2JvfSAbER6Ppu3l54k7c+iejrNwwTfttjI/B9ckP/ZCGZyAykZCmbhZtwHMTlfeMEEX3yzw2UmWbex8IgSHxGB1Xz/adGF7DEmgpqMRFjqsem1AkxoR3u5w6Nq+awb06omTDNsvlV3YSdGeJWo1xowC8YrH014o78IyII0U7OnDwj7BoIpdwha/Z/lQ+6R6vX1L58VzJQkBYTv7IKyVboDYso+sl8XX9rUitvefVW7gkkVr2DD5EGEP5fnJTuQX784DDGfM91fZmXyV6kKeXEwHbewEfo/DJWTEQgMSFQjSP4x3QxWYbQGB/ntEU8np494G2dlvH/EJr4Hpqhhsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/bU8wI65kc+5Xbu7+4cTwVoNX7u03CmcuXMU1FqfgE=;
 b=ROQrwd7AnSZahUKigyeNIlCNwsk+LgZUgSa8Gy2BwDSmita6LNGqsZcDDeYV6rFpfqksu95Y2K/omd8Itu8bbfPXL6rPDv2nxYUTqT7U/WxO4+qr93YKm5KLt2ENbDhTHfZm4fLufbPpoiWQeWLCInOqAvWYZvuNWV8PoAlrugO8JCMwM5OjVianK3rR0LoyIItzSEtxE/zSqpfyR/bo/9mcFD8VTI8Vz3+NBgLQbk8PzLHVXV9L81fBjUrsflsRT9svyxBI3b9Tg0J4DIOl2B0XBuCUoDoVZ0T3KetBO1POutp5eVqEEdobdF25EAQJQkmn//DFP0xLWchZay8Sag==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jens Wiklander
	<jens.wiklander@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] arm/tee: rename variable to address MISRA C Rule 5.3
Thread-Topic: [PATCH] arm/tee: rename variable to address MISRA C Rule 5.3
Thread-Index: AQHct91SP+heAl5ESUaIOkxQ7VfzerW3Cw6AgAATegA=
Date: Fri, 20 Mar 2026 08:54:17 +0000
Message-ID: <73aa8397-90b8-41ea-89df-05317499489f@epam.com>
References:
 <e7fd1f75146e7faa520414c4ffc1bd9572914039.1773951370.git.dmytro_prokopchuk1@epam.com>
 <2E014D71-DFD1-46BD-9715-D6EEB0E3ED31@arm.com>
In-Reply-To: <2E014D71-DFD1-46BD-9715-D6EEB0E3ED31@arm.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|PAVPR03MB9066:EE_
x-ms-office365-filtering-correlation-id: 3d85f2da-f085-4e50-d91a-08de865e44d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|1800799024|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 ylUNeRA2nG8AMpJRgHk/2pZfttMvLMQJ9BWUFKrDDX5fSQcp0d8ACPEJtOwGVwoVLYfzcs9WzZ6+0nAuSWd3QgQ6QUgHoAYo+HNjd6PZK2FTZtKDugziDeYgIxX3kof6/qTL0x17tiCRAwHM9Qae9ZjmUGUvkW+QRkEZnjG/fsqphjSRq5txFms2zHbzb6GlNngoepNk12W1uOwnsaQHpwELulPGwz9izdfCLUOkErE/0899l/JiUUNxbfDJiiq2mrkfFsZjGXUjS8OAxpeZbXYMxwPIIa1D+opjh/ggrUTryGYIo/hpK/fRtuv4bLJ2cfl3KVODzPZMdoYyyd/c7o7m4iW/EOYeMtRVN9vqJtEruI8zBnnY/h5rzR5OsQkVs1PatK3iJExtBT6Uu3pqCuVj7xbcVE4q5yNWx+wUTpDpcJyuUAh3E2F13mYli0mgcqTEAIredujIrEplTwQO6cOjZZSpn4b14AgeFfm/lqtEtC59jPeEYwtFbE78ZDdsgimRqbHxRkoxmH6VcPsXMwLg0yKJ7F90ZJBOJbIaJyTTpYSdC7+16bu5gQ5VXcXMIlWzlrf7FCy+hCk+3L8uGbw8aKGrj7+ZWqRSDKCwOlHa1lFPrvafN+5r8+rDjOAKQol8gtbxHl4czLiJwpU2+iSWcpqi7ZS2ZBfXLdl2iZkDpkz/2DBnEKjaGl/VK4R2wNyyIOq352UaoCFVEgpTU73DveLNTmVSHv+v+RTLTb0dAJ56ji1kfahb0EHVMyHzXOJGvBsgFpU3JGfNMlclRvFsLyv0rYegma//CfU+VU0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aE9SOENLMzdUSHdxVHZIelNwREkxdUl1YUJJSkc4TDRTSFFENjNLdDZTUk5L?=
 =?utf-8?B?V0VHZmZpUDl1S3lETjhPWk5yS3Fpb1picDlLbUM4RGNIVFNWTkpyeUdTd2Rh?=
 =?utf-8?B?amN5YVNMZHF2dk93dEMxZ3lBSDBOV1lqSmlJbzBVMlNJZUxQWnFzV2Mwa2lq?=
 =?utf-8?B?eFVBNWh3V1NNNmpqYnlpdzg3b1VxcWNxN2dwNWw1R00rbG1DbUorQ29FcHZL?=
 =?utf-8?B?eThIeHdFOVF6RHZ6TjAxZmNaNlRsKzE3Yzc4cGlySGorQk56OXBTV2gyVlFS?=
 =?utf-8?B?aW1KRElJTzFhWFhqQU1PbXB6VFI0R3EvSnlWQXJJV3BiT2lpSmNvejZGSC9z?=
 =?utf-8?B?WDBmM05ZcWZGaEVxcVZtdFY1bHBYMlkwSTZsc2dEbHJzeXBNaGRldGxJTlN3?=
 =?utf-8?B?ZE5GUzZLZFI5azhSUGxVcXBVUUJSRWdRNFBzM1p2bzdpaFB2Q2E3NTNYNGxN?=
 =?utf-8?B?bDExbmhGejdpa25wc1BBZGN0WnVPWGh3enI0MTU1RitzVUxkcUg5Q0g0YTBy?=
 =?utf-8?B?cSt3NXFXY0ZrVjhKSFBwR09lY1FVcFVxQkZWdXNEWkNsTGp2OHhsQVhTcGpw?=
 =?utf-8?B?RkNLQVRzUlNsNE5lZEgxMnRMWDUvZllhUnh0UVZ0ekFTeTEzKzZQWlFrNlNL?=
 =?utf-8?B?a0YvRjNNR2xSSTUvUy9TVmgzaDdqVWo4MUs4L29uUk5Cbng1UkJ6akgzcXZI?=
 =?utf-8?B?eThRQVJFVTV1dVVWc1NhV2NnMUVEYW9JaWZvMk9BMWNrSFJBb3pEeGxIc0du?=
 =?utf-8?B?WE50NW5GR0c5bGYrZTMxVFhJVW1HNzdUbERiSTl2Qmx6YW1KSHM1Q254R2hF?=
 =?utf-8?B?RThQVmhMZkMydGgwbDA5SUQzd2NrR2pTNlZxeHpMTElBSFBvd3piV3VDOG4y?=
 =?utf-8?B?aE55SkpzeE9JWTB3TUh6YnVrN1dYYmZ6SGl4V3Z5Y0dBQ3AzMGE1QTY3WG1X?=
 =?utf-8?B?M21DUlVlUW4xdkpXQTRNdHpkdkNHUkFvTERVTG5XRHpZR0IrbGhRMEdzZW56?=
 =?utf-8?B?cnVzL2pXeStMaVA5Wm5jc1JSOU0rNXlYVnlRWGhVSkhVU25Dai9LV0k4M2p3?=
 =?utf-8?B?OGMxYlJ2UXZaZ2tMU1RiSTZhNUF4RkpUbnJ2cFRpbU85SFkxdERHNFNEWmdn?=
 =?utf-8?B?alF2T0VzZG9IaW9LUFVDTFc1aEJzbEJ0NXQzZWt3QytpTC83YTNtaUNrTU9i?=
 =?utf-8?B?Q0VhbnVUc3A5T013NlUzR3JnV1ZDR04yY1dJTCtsSWVFc09TQTJUNFhneGo4?=
 =?utf-8?B?Z2Z1Y0g5SDArODJaNE44QW9Xb2NYdWM5S0xsVkIwbEF3Qy9lSUp5dVo5QzU1?=
 =?utf-8?B?aWI1SXZmQ2psTDgrZGZCZnlLK290akY3Vm5GNE45WW55ckxaQmFleHpMd05z?=
 =?utf-8?B?MGM0eUdTVUFMRmdwSHJEZ2doYlY2TlZ0WUVVdXpIZnFOaHBKVWxhOHc4OEZL?=
 =?utf-8?B?WkdiVi9RTTE4QisvaUFRcWdUSytKMUJhSWJKZ1JOaWVpQmVKYklmM3JhODFW?=
 =?utf-8?B?SUMyK2NpRlluaHVoSE5LWkk1SUJyMlVCck16MnRRd0YzZzJ5Qy9YV3VRZ09n?=
 =?utf-8?B?WlJIZzVjengrNzJnY3NkSmdiUkpCYVRSUDJPVzdUdmw3Q1VkcWo5cHhSMHdQ?=
 =?utf-8?B?MGZvSmpIRkRWcklmOGdQUStoWFBQQ3FXbCtUZk1UUHd1SjF0RklUbThEUXJq?=
 =?utf-8?B?TUN1d3R2WGx5cGpJbk4rQzcyclQwYS8yQ1ZKRWZEN0RENnJ1enZNMDNHWkxB?=
 =?utf-8?B?VEh6N1RPYytmQUk0cHh5cVlKRGw4WHpsYjBKN2d2dlJ0akNGTUdtK0dzZjl1?=
 =?utf-8?B?RUR4UTR6Y09FdmlGSjR2d1ZlUjh2LzlDUXpYQ2xmbWw0dXVjNUtNWC8vcFo4?=
 =?utf-8?B?UWdZcDlyRUF5NGtnOGxlTktobGpnSkhyZloxNW5oenRyMDJiSzVGNHBQb0hw?=
 =?utf-8?B?d0U5ckxVTjhGU29EeTNlR0FPN0c5NnhNM3NSUGlHMUl6RGZCOHpQNTNyU0o2?=
 =?utf-8?B?NmFvejVIV29FMGtQd3FmbzMyR3lWRmNsK1VSRC9zOEl1VDcxbEg2VXVSRmNV?=
 =?utf-8?B?V2JUc3RiaHJkdnp0NnVsamVlWkpVRmkwMTZ5VVhIajArbVlPNjdIdFN3L0NM?=
 =?utf-8?B?Q0xZb0VnQ09VM2NnRlBhYm1Kd2lEbVVKMlBXNDRWZllGWDMzemlqLzNGZ0hm?=
 =?utf-8?B?U1pIbXNvZWsyQkN1TGc1YlJJWmU2SnlyUkQwcklDbGZabXVxaE9ITlNZbGhu?=
 =?utf-8?B?MWJUYVBkRU9Hb2xXRnRiQS9xcWdETUZLU3JUWHpiRFZPeWIwV0p5a0U2aFZk?=
 =?utf-8?B?RXN6MXNyUHlqRGUyQk5TWUZBaWxzSHRuRm12QkRTS2lzKytKNkNkblNidWk3?=
 =?utf-8?Q?CeEB8T6GY3/d+Hqc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E8017002BB0EC4892FD3B0565A3851F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d85f2da-f085-4e50-d91a-08de865e44d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 08:54:17.2667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9t3PlGdtd1aJHg5UeN0joibvYK1YcQMXFiigaaY9+rDeerHKWxiwXc9tuaf8UrWcDNQ5dtWWYjwZiOy7KypaRiOzpVQ+TFILep71x4hq8kk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9066
X-Spamd-Result: default: False [-1.09 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:xen-devel@lists.xenproject.org,m:Volodymyr_Babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 648B22D7932
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCk9uIDMvMjAvMjYgMDk6NDQsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+IEhpIERteXRy
bywNCj4gDQo+IA0KPj4gT24gMTkgTWFyIDIwMjYsIGF0IDIxOjE2LCBEbXl0cm8gUHJva29wY2h1
azEgPGRteXRyb19wcm9rb3BjaHVrMUBlcGFtLmNvbT4gd3JvdGU6DQo+Pg0KPj4gVGhlIGxvY2Fs
IHZhcmlhYmxlICdmZmFfdm1fY291bnQnIHNoYWRvd3MgdGhlIGdsb2JhbCB2YXJpYWJsZSwgZGVj
bGFyZWQNCj4+IGluICd4ZW4vYXJjaC9hcm0vdGVlL2ZmYV9wcml2YXRlLmgnLCB0aGVyZWZvcmUg
aXQgaXMgcmVuYW1lZA0KPj4gJ2ZmYV92bTJ2bV9jb3VudCcuDQo+IA0KPiBJIGhhdmUgYSBwYXRj
aCBpbiBteSBxdWV1ZSB0byBzb2x2ZSB0aGlzIChJIGFtIGp1c3QgcmVtb3ZpbmcgdGhlIGZmYV8g
cHJlZml4IGZyb20gdGhlIGxvY2FsDQo+IHZhcmlhYmxlcyBidXQgZG9lcyB0aGUgc2FtZSBhcyB5
b3VycykgYW5kIGEgcGF0Y2ggdG8gc29sdmUgdGhlIG90aGVyIG1pc3JhIGlzc3VlIGluIG9wdGVl
DQo+IGJ1dCBoYXBweSB0byB0byB1c2UgeW91cnMgaWYgeW91IHdhbnQgaW5zdGVhZC4NCj4gDQo+
IEkgd2FzIHdhaXRpbmcgZm9yIHRoZSBwZW5kaW5nIGZmYSBzZXJpZSB0byBwdXNoIHRoZW0gKHNo
b3VsZCBiZSBtZXJnZSBzb29uKQ0KPiANCj4gVGhpcyBwYXRjaCB3aWxsIG5vdCByZWJhc2UgY2xl
YW5seSBvbiB0b3Agb2YgdGhhdCBzZXJpZSB3aGljaCBpcyBjaGFuZ2luZyBmZmFfcGFydGluZm8g
Y29kZS4NCj4gDQo+IERvIHlvdSB3YW50IHRvIHdhaXQgYW5kIHJlYmFzZSBvciBhYmFuZG9uIGFu
ZCB1c2UgdGhlIG9uZSBpbiBteSBzZXJpZSBpbnN0ZWFkID8NCj4gDQo+IEkgYW0gb2sgd2l0aCBl
aXRoZXIgc29sdXRpb24gOi0pDQo+IA0KPiBDaGVlcnMNCj4gQmVydHJhbmQNCg0KSGkgQmVydHJh
bmQsDQoNCmxldHMgdXNlIHlvdXIgcGF0Y2ggc2VyaWVzLg0KDQpCUiwgRG15dHJvLg==

