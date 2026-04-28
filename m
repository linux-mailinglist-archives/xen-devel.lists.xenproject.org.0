Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EG9dLX+08GlwXgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 15:22:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 259E1485BEA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 15:22:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296200.1572622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHiNu-0005VI-OH; Tue, 28 Apr 2026 13:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296200.1572622; Tue, 28 Apr 2026 13:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHiNu-0005St-L6; Tue, 28 Apr 2026 13:21:54 +0000
Received: by outflank-mailman (input) for mailman id 1296200;
 Tue, 28 Apr 2026 13:21:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wHiNs-0005Sn-FY
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 13:21:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHiNr-001pIg-Rg
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 15:21:51 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 69f0b46e-2eae-0a2a0a5409dd-0a2a4504e1fc-8
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 15:21:51 +0200
Received: from [52.101.69.120]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 69f0b46f-1dec-0a2a45040019-346545783204-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 15:21:51 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DB5PR03MB11368.eurprd03.prod.outlook.com (2603:10a6:10:656::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 13:21:49 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 13:21:49 +0000
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
 b=FF7tagXKDG4WYWXZErORG29LrusMfiGqhca8h7ev0L8sMyCJy0cg1JzbVr5OeAQQPNCKaz6qRGiWzHzHyeIWaEj5i6xTxCq69nNHMUJMDI3bEH5sYqY2LU+mjh0msGv10dX14gUS5hSV6nAoFKwzsXXeQqT/J8+yIwzMegz3qga7evKrSY2/PHBdtJRMR/RGzpash+NPLWd/Gv6NPVr/BuQPNRdJ/SB63P6o7V32fqaTiyDhe6/k7we1f6Y+y3xRYgpE245vLmzR99YHqaggoJ347IXMy53M/8JBwh2X/4xhMxADKU3Wh5ev60lhBSE9WT3FqbCVSBnunzCTVTp+9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvU6MtZJZYtq11B+jLckyBEof32K8q1k6vrQLP49FB8=;
 b=xMGPvoxRfIcleR+q6hgPwUKIHb0BNN0jpHx4J4CmAzPd6hjynGvMLKRxrDO0RHDchHkWi7Hl4M2kb8+CHSJu0/3TkOFroVJSvre8PByYAR9UvQ3zRE6g5glCh0SIQL8FOKH9StovrHiXcZR54jOTTUYVwNmPPibIP0cxWP8Nid1n4cRrY3SP/LFPzNLJFSWctpAS3/lHMoC74JiNLhgV22RxkrZp4s0+pF2/2Kx0xFxhQaxIrGynrW7ukk9Hyj4bDjFatwDZ3Aplhs0ALjf/3dUzdr4ZE3NCrFCly6bBACeqdZ007t50nP32gQL9oJKB3w5AaUdWfFa/RM9PAAy1dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvU6MtZJZYtq11B+jLckyBEof32K8q1k6vrQLP49FB8=;
 b=dVyNvdEXQ+bEfvDh51P7ryZMZl6TYDW0P5U7Jiuy4N/6/0ZwuOTwBZjA9xY7rnnY+GSrFcmoIL74hrON0jfdhR/zdgmBAq9g42XuW8XoAO40WRw6u1cMd0yTcGTHhoKlb4fzEvWSp8smqdX+MRcuccjeZRhozLDfcJMaCHeuf2eIhohepxMXM7V4TCVMddKOE9h1X6cxQBVTKPpj/c4AHHzB/BPI8J9XuNxuq+Mk3LrKz7Pshu10iECOCOz4mCD2OgbXc7/CCcRXvuOZVx8yPObVrrUxi5EU2rTEBcmbP+/kmDdNbp/2S5no0tkniJ1D6whFfat3GMY6YuX+4fszCA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] hypfs: remove unreachable statement in the
 'hypfs_get_entry_rel()'
Thread-Topic: [PATCH] hypfs: remove unreachable statement in the
 'hypfs_get_entry_rel()'
Thread-Index: AQHcyDlVyOevPxMGvE2K9zY95LxHD7XhYbqAgBMxwgA=
Date: Tue, 28 Apr 2026 13:21:49 +0000
Message-ID: <e413691c-d124-4eb2-9155-2c30d553edc1@epam.com>
References:
 <341811ced2943fb79d0235c27781c564c7bdaf02.1775749146.git.dmytro_prokopchuk1@epam.com>
 <3f832c12-5a02-418d-b420-23ed3cf798db@suse.com>
In-Reply-To: <3f832c12-5a02-418d-b420-23ed3cf798db@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|DB5PR03MB11368:EE_
x-ms-office365-filtering-correlation-id: 841f8b26-fa38-420c-674a-08dea5291aad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|42112799006|376014|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 UU6ybRYRq4Mn7AvLpQXBlmeWz0z7BkQymMn7hQHhINZ3kO1oFoaAXsEXxipJUvrvR2XrJVc72aMGWAFIABIW50CQcVKgo7ztU4SyWHxw4VdI5QikNronxsOhTn8bpbWfaUkZlFJWJGEzCDrfe8LDvH8DCYENo94PXNA7rqNJkv1hTKmzd2jkEh1mvNxPAsmW3u3PG4dY+017X+KxZHhBy/bngJmIi5bgXniFG3tkd2VTMrCU8qSqW7NCwZm9+TAiAEcnHuRRj3Q/nA1mnhusgIoqyFsBTAERB1Tfw+P4o1/EpQ+ZVma5OU4O5Fo/nd7oDXSifMDzzzXCAE0w8fbu3hTX0kHYprAoR6oxsyoacTY4kBT8ZXOfTLbcbb04XUtY5bF97MGdvUk1zNclKmqyMzeq8/iYRCETEzWRUpWnbt3CUQ5h/1X8IDqfFm4CqgVMkTbeKTjNTnnBhbDs1l6DDDir/Hz/N2M/wCuYvb5Yg1m83XgvKM93hp/jquQX1YJ1saVms2/fo68d3ucNbPLlN5ljAnYNLqiKVSozNtRVHXl/MEeesxmduleYSrVYns7wKZdwpWXambHQ//EPbSJ7oTMA/3YIzd3EoQ7m4PkJ1veDi9VlWjx9QwGIsVzZXHfueGqMtyr7EmAYaJlonoWOlY4lItIkO5cd7o6pMKrabn0j4x4Dqu1foE+8njmZs75mxaQCGY62EF02EB0q8+3no2J2J8HMXNvQIhnFgvw1G0AIAr7gJ/wotE3pChm0KA1B5eQhcw2rOjutTVDJTIUDHg3jQH5t9NBYoutN/75gV8g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cWZPWjFRaU0rNTE0ZUQ2MWRHbFdjbnRoMDRzazdOQitGMXB2Vy9RbjNwTWZ6?=
 =?utf-8?B?NzRMa1RES2w5VGo5Ni9KdEwzYm9ieTB4YitydmJDYmsvdXViRVBGay9PTGhr?=
 =?utf-8?B?K01OOS9vb1ZkZ3QrMlZkd2djR1lJd2tiRFBjNVlDSmV4RXo4cTVZMlA1Yk9t?=
 =?utf-8?B?R2Jtc2FoRmNhTnh4ZUVYNUlhMWcrUGM5NW9YTE4wOHU0NVFrWDFTUEZjcTdx?=
 =?utf-8?B?ZXdDSlNVOVVFQ1pRTjBzN2QwdU82bWR5eElHSG9jT216TkMrazB5QzBrM0th?=
 =?utf-8?B?WEhLVmd0N2h3VCt0dXBsY1ZScFdTTjVCMHN0U2FtaTI5dXkyL3dWVkNjS3Qr?=
 =?utf-8?B?NmIxSzFGS3g3MllHWTA0Q1NUT3VuN1ZSSFZpeURaMk9ISG1rQ09wRWdkNVVV?=
 =?utf-8?B?OVgwcTVXS1paRVBVRnRxc2txdzBHOUpLNitQN1lCSGJpeVluOGNrVDRjRjk2?=
 =?utf-8?B?Y1g1WnZLb3RNaCtUcVVoYXRpZ3djT2ZlN05VVmtaT2FVTmU4UlBpZGM4K1pB?=
 =?utf-8?B?ZXhGYlVwbTI4MVB2T2pscnhrV2VoQmJ5bmdBcUZ0ZHNKeDhlWEQwMWU5b05D?=
 =?utf-8?B?enJJUVhZZFdEMXZwZzRNSm1sRmg0ZVRCT3NkMTdMYS9wR25BR2F2RHlZdTdS?=
 =?utf-8?B?UiszcVZxMWk3VXE1bjgzOUltdHFrdkxRVkpCOG41Q1VBRUJhVk8xWU1aSkg0?=
 =?utf-8?B?cVJTWlpGU3NHeFVvSXV2UTJvQ0I2ZTZzaW5uWW5ZYTZNb1ZxYlZRVUIxVjBR?=
 =?utf-8?B?NURnUVBpV1JsZG5DTmlucU5ERnJxUWNkUzZTWHZzeEkxNUVyUkdab2Z0bU1l?=
 =?utf-8?B?bjZKUjJoVkRjNDFLaHBBeWNKL3JiR3h5cndSbjdYRFZMbmpQRExobERCRHVF?=
 =?utf-8?B?UzFqeU5pc3Nnc3FhUHpSSGl1ZVBFd29ucVdiWnM2c1hRb3B6L0V6YUVMSUFo?=
 =?utf-8?B?YWx0dS9XWmhRNzZ4UEFlUnIxZnpOcXpiVy9CRW02MDM5SzluWnpQdHUxbUFF?=
 =?utf-8?B?ait1U08wZ1haWVdHYzZ0bjR3c2ozNys0MldodnJTbVVvRktybUUxMUcrZnpv?=
 =?utf-8?B?OTVjMFM3ZldHUThVTTNnaVd2Zm1BbitpMkk1VG5SS2ZlMG9ZUXNkMkMwYVgr?=
 =?utf-8?B?emdvU1o1ekw2OUZoalk4UG5WSC9sV1IvcmhtU1NjMVAxTysrT2ppeEtJL2JL?=
 =?utf-8?B?U2xGdHAvZURRRzliOEpwcXoxKzlnQUF2TUp4V3haQzlJN2FMZ29WZDJ6NmFG?=
 =?utf-8?B?c3kwN0hxVm1IREtvLzZmQWNadUEvNmcybi9NM2xwS21Jangyd1ZhMkhiVm9y?=
 =?utf-8?B?U0wzVGpyTC9QbWNJNWZJbUhRaUdxQkRsMTlBT2tTbHBTd1Z3MHhhcExDaDJW?=
 =?utf-8?B?dHhIZUtma1ZRdlJIdm55ZjhFSWY2UGltN20zRVA0ZWFsUklnc090a2pSaFlp?=
 =?utf-8?B?U2VtbmZoM3FiNDBpUG1YM3doRkRlMEdSQlRNb1RkTGkyM0dBN1BtZXZoR0N0?=
 =?utf-8?B?eUpWSHNPSUR1UFlwRmFUWjNZSjZXYVppN29hTis0WFB2RU55ZHhMaVNhU0lh?=
 =?utf-8?B?eFhEQzFNUExESENlU0FTeVpnUERWcXdpTkl0M2pFUXg5dTFKWG1NNVlIbFBQ?=
 =?utf-8?B?Tml0WlpkTWIycVF5RnBsNmVna2REelhuV2FkeXptUUU2YllieFk5K1dpVHBW?=
 =?utf-8?B?WmUwTWJ5dnE4U2R1TmpjK2NxMkM0RjhXUktYV1VjelFiMXRSbHZtNmxYbXp0?=
 =?utf-8?B?a1Vzd3FhSHdhcWZIZEpZa1JGbTBrREszTXNmS092RklwaTNqRjZsUWc5aXlH?=
 =?utf-8?B?V1d3WUFSZzQxR3JyK3ZtbUlMU3RTeldRdGdMaGpkNk9XNDgvSkg2MXdIMW1y?=
 =?utf-8?B?c1ptcDhFUzZJSHRjTnN3Ky9aTjV2dTJoNnFyRDNuL05Vckp0MmxRN282Mmsv?=
 =?utf-8?B?MTNidTIrcW9wMUMzeEhkWEFJdHZRWkRPUXVEai9WWDczN3IxYnpuY0tHbUQ3?=
 =?utf-8?B?cXVKTHorS012R3dZdjlVekEzMnlIRUovbHhSS0hOL0NFVi9tOWhDaVBrYjVk?=
 =?utf-8?B?RDQ3ZDkxWXBrbzhsejZMUEg3NkVVNTlSKzJoUWt6a0IvVnhxcjZSRzduNkZG?=
 =?utf-8?B?cnh3YXliUmdpd1JPQkpzNWpGeEdOQWlkRzFpdUJIaGVJZGowNzA0L0poNUtG?=
 =?utf-8?B?dlkrRThxVWxGTENCV0xOUVM0U0xXczlwVlViVkU4dGVPd2w1QXd4eGRNYVVV?=
 =?utf-8?B?cFNtejkxLzFVV2dtN2d2UFZWaDliaTM0ay9tTGRSUnpPbXRhMzhSZEt3eThJ?=
 =?utf-8?B?ODE0U3hzdFNialVYTFUzMTdieWxrSFQxSnZxM2tEMTJSeHJnWjBPRWZvTG4r?=
 =?utf-8?Q?N9MS4cPj3m8AQVUE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C012A5D82B6BF42B2D569AFDF9DFA63@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 841f8b26-fa38-420c-674a-08dea5291aad
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 13:21:49.2558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qnBkad2DkUmpUMsGcN+V5DYlSkG/xvh/3HytMXYCAY5yU2eClv3sxfEmtHdOBzkpUVyJeGmDSJgXH4K45DN/9anCEDKi3wreTL9q9GA3gSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR03MB11368
X-purgate-ID: tlsNG-ebf023/1777382511-289723FF-F3F5B634/0/0
X-purgate-type: clean
X-purgate-size: 1286
X-Rspamd-Queue-Id: 259E1485BEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:dkim,epam.com:mid];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

DQoNCk9uIDQvMTYvMjYgMTE6MTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwOS4wNC4yMDI2
IDE3OjU1LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiAtLS0gYS94ZW4vY29tbW9uL2h5
cGZzLmMNCj4+ICsrKyBiL3hlbi9jb21tb24vaHlwZnMuYw0KPj4gQEAgLTM0Nyw4ICszNDcsNiBA
QCBzdGF0aWMgc3RydWN0IGh5cGZzX2VudHJ5ICpoeXBmc19nZXRfZW50cnlfcmVsKHN0cnVjdCBo
eXBmc19lbnRyeV9kaXIgKmRpciwNCj4+ICAgICAgICAgICBwYXRoID0gZW5kICsgMTsNCj4+ICAg
ICAgICAgICBkaXIgPSBjb250YWluZXJfb2YoZW50cnksIHN0cnVjdCBoeXBmc19lbnRyeV9kaXIs
IGUpOw0KPj4gICAgICAgfQ0KPj4gLQ0KPj4gLSAgICByZXR1cm4gRVJSX1BUUigtRU5PRU5UKTsN
Cj4+ICAgfQ0KPiANCj4gSG93IGNlcnRhaW4gYXJlIHdlIHRoYXQgbm8gc3VwcG9ydGVkIGNvbXBp
bGVyIGluIGFueSBtb2RlIG9mIGNvbXBpbGF0aW9uIG1pZ2h0DQo+IGlzc3VlIGEgZGlhZ25vc3Rp
YyBmb3IgdGhlIHRoZW4gbWlzc2luZyAicmV0dXJuIiBhdCB0aGUgZW5kIG9mIGEgZnVuY3Rpb24N
Cj4gcmV0dXJuaW5nIG5vbi12b2lkPyBJbW8gd2UgbWlnaHQgYmUgYmV0dGVyIG9mZiBhZGRpbmcg
QVNTRVJUX1VOUkVBQ0hBQkxFKCkgYW5kDQo+IGtlZXBpbmcgdGhlICJyZXR1cm4iIHRoYXQncyB0
aGVyZS4NCg0KWW91IGhhdmUgYSBnb29kIHBvaW50LiBXaGlsZSBJIGRvbid0IHRoaW5rIG1vZGVy
biBjb21waWxlcnMgYXJlIG5haXZlIA0KZW5vdWdoIHRvIG1pc3MgdGhpcywgYnV0IEkgY29tcGxl
dGVseSBhZ3JlZSB3aXRoIHlvdSB0aGF0IGJlaW5nIGV4cGxpY2l0IA0Kd2l0aCBBU1NFUlRfVU5S
RUFDSEFCTEUoKSBpcyBiZXR0ZXIgYXBwcm9hY2guIEknbGwgdXBkYXRlIHRoZSBwYXRjaC4NCg0K
QlIsIERteXRyby4NCg0KPiANCj4gSmFuDQo=

