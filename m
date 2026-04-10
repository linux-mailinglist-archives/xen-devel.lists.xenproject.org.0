Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOSLEx8Q2Wl+lggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 16:58:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A61113D8DD5
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 16:58:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279235.1563745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBDJ5-0002Bv-Av; Fri, 10 Apr 2026 14:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279235.1563745; Fri, 10 Apr 2026 14:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBDJ5-00029A-7p; Fri, 10 Apr 2026 14:58:03 +0000
Received: by outflank-mailman (input) for mailman id 1279235;
 Fri, 10 Apr 2026 14:58:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wBDJ3-000294-3o
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 14:58:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBDJ2-009EbJ-Fr
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 16:58:00 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 69d90fef-bab6-0a2a0a5309dd-0a2a4509a690-8
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 16:58:00 +0200
Received: from [40.107.162.134]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 69d90ff8-bf79-0a2a45090019-286ba2868d67-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 16:58:00 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DU5PR03MB10217.eurprd03.prod.outlook.com (2603:10a6:10:517::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Fri, 10 Apr
 2026 14:57:58 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.20.9745.035; Fri, 10 Apr 2026
 14:57:57 +0000
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
 b=GkmjMzr1jS/vtXJovCea+njdsGxZU1Od0qgeobygYU208C4lrE1ShZ/eEP2DdPEm2HyW/Mv5br68kvQElP+Goqj6S8VFZHEhgunzh5YZx7i9qcwBJIgBt1UrVAfXS5qUqsdj/05TGFPqX3zhzht+Xf73DxZJqmZcMs/vDekhUKGuJMVOf/41PJD2tcXgowIdKud4amYwT5T5aOYk51G40jyOZq6pv5AfEn+k/1epzi4JIVXVAIxG5NpK0PiAusI5ldRz4wHY5fwn483GpWWQWfxYFHdwiYdHQiaLOHixUWF8qNKigrdmK5n9cpDCBYtZPrJlfm/A6TQdO3X2lIDbKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cy01VKSGJ9Y4vrJwf6I1e7ONfe8U1/Lc4lQ6snnN6/I=;
 b=oiHPCql1E1mgtjgt4ZlNYMlgUJROELQyDB1yV6a0DCbi3d3/XPAZTWSANRc7fJwc+We9oE0g2p9Hs5mOMfZnLlMLYYSvsWRhno9UQ6tjGpvt6t2NnXI6ex6aWqx76Uv4x+XYCoy9p/50z/CEcUnz83yzqA3GeKfIaWOw+4XW8Pg884ROv9lgLaHBA0CjgN75CWXblVL09qeg4E4F+XrXpfGRwWV5r+T3pqfJ6QiVaBu1HLtXGUlExJgb99OJKvrChTFwlBOgj/TsGkG1WSojV4MPb21SK9d///s06X/c9NlTi7vt4tY4olwOmbiWADQZ3G78z+s/70Ljis4n3Q2jjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cy01VKSGJ9Y4vrJwf6I1e7ONfe8U1/Lc4lQ6snnN6/I=;
 b=E5WvZA0HHvpf18kUliT7TnvXOz7PJSN3BrZb/fsXvjSxXXLnnwwYR5VsrostvkItA/zEPAcp4CyMqiQUiZjMVXAnZUEd0Tr/A5xVjzFW/Jt10hAH/O0O/nz63wn3agqY1rPVvt4dUvy+Gz/pjddlXAoHZW1sa3E3ggpfwpLPijJ+ws80A9yUvsuFNAT09nfQI2DOOaxv/gD3+oMIPhBzgsFrHmMgCEpCX3ndjyAzcIKC8L0DFZpwzuyHO2pwW2nJ9ySfM4r0vPljgp/o9rslBEyO7upjTaVgBJiZU2VHtqLk+grzJDbhPHRGLSEeSrkj/wo/gKRPlAVgMSTsqDNAzw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] generic/altp2m: address violations of MISRA C Rule 2.1
Thread-Topic: [PATCH] generic/altp2m: address violations of MISRA C Rule 2.1
Thread-Index: AQHcyEeH3FAPJgz8C0q4McY6u5ZElbXXzxqAgACVLIA=
Date: Fri, 10 Apr 2026 14:57:57 +0000
Message-ID: <15aae6fc-35e3-4cf0-9e3c-bd2552db10e6@epam.com>
References:
 <8b5ca213a097f7b221b06b6173e4621563779a73.1775752149.git.dmytro_prokopchuk1@epam.com>
 <3b2daddd-9afc-4c75-92c0-f7c6ace3f735@suse.com>
In-Reply-To: <3b2daddd-9afc-4c75-92c0-f7c6ace3f735@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|DU5PR03MB10217:EE_
x-ms-office365-filtering-correlation-id: 0e36f140-06fe-4b63-f8e0-08de97118d68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|376014|1800799024|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 MnQYH3/8/JlqddH5mtTX8o+1PQFQlqpVB/+xBLyOG08AsAYHOPu0RE2JSZmWETn9ENAWinMIgSQr1J6Jg9SK87NJvHdzA4xsdGT+DEYRMvklh3sCBNuVGEYjP1ZDim/mP/Bz8t6kyQPqSr71TNdkZ1lkLlGMSntWoH1JGJ62J5F5B1xY27RK0mOAtOqxTIhjKqbfaGNrs0k2V24nxJc3IVoLD978r4/bfDBv8DTcKWz57gMm6ymt+N6XWVLrbC6/BO3KnM/ehZutPHDA8tzqJEPRyExVC4UE6MUItmTN9cvbjquuZfivKU2t4opD/MlQxXeYBMNx2CkuTHvnG4I8pTHUnk0lyRt+ctAwy+dPX+7WQzSospWaVFIEbRZbI/ru+ftaunCaY8VaJr7infx8UsxvDeddTbPdef5kEaW1styzoFiRQtDucEA6djFbwlpV6+Mz+y605S7oELhOO7pAQ0WCLO6C5scfkKJ5MBprP7gISNtauw5LPdChQqFS/GI2PbJmFD2PnsmRs8ha+CgiMTVcgQlw3laaakh6Z98ubv9l/dmPTYwbFqpNFGeqDUl00zSv/W8BADrBGOzzUfxQRHeIVIzdIqDJ2qKrK2n/PeMN4KV/+yuU+4bWOxV7BFYxAEw1ki5IKxb7sJrs9lzS2VmJZ9xkxth+r4irJ7VeCOe623qO5FcezpRVgos0+5qA90A0Eb32U0bbgLWsc3naCA3E4GlLCzUjjUAtJ+/75eQVb0/4AGpwAgkv9fb/CLANRDZWsOgisMRIzQycxVXycwHpyX0Zi6mIlqjlBDp94CM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WDdhSXVteVJJZWFrM2Z3MndmbFhEWlo0RE9ZTGxQQk1SdUNRb1NlWXdIck5K?=
 =?utf-8?B?VUViank5WXVHU01DOTdOb3BDRG9HaUhBY1FNSjBja2ptdlJrd1R1QnFkUk9G?=
 =?utf-8?B?QUVEOVM4VUZJTHJtb2tkQmt0aFhCekNweWpIeWo2ZTArRWtxVy9NeHpFOThG?=
 =?utf-8?B?eVcvMkNIVnhnSHRBSzlzd2h4ZTI2R1NWdUs5TnVhQjlIN2dRVVdpN0w2aWMx?=
 =?utf-8?B?QUVxTVd5NExvSzF6R21oQzVHZzA5ZFRma3NxRXVBNjlDR1BlbDJRcTVzR1ox?=
 =?utf-8?B?Z0ozR2lsRE40NGdxcVdNSnQyR3VQZTVQVHFjRUVSYmsyS2RVYmw5d0ZnQmhv?=
 =?utf-8?B?Sll1SFEycnl2ekc3TGxhT2hwejBhTS92M3AwQktDZ3N1RXU5ZnZubG9XWlI2?=
 =?utf-8?B?cVRLMk03Y0hxS0haL1RFSmFNdWYwME5IWHR6TEZ2Tk5RUUtlbEgra2FsM2JS?=
 =?utf-8?B?MFJSSGJZV0d6VUI2VGpjdklwSTRnQ1ZXLzd6UlhIaHhGaHYrdmwvd1pySzRh?=
 =?utf-8?B?RERHcS9jR2hiaE51VENRang5eUFKTDFBdHRCYWNtbW5WQ2R2Z0VDU2ZiM211?=
 =?utf-8?B?c3ZrY3NFTmQ1U2xyM1B5amYvNWRubDNheWpJQW85V2RFTFRDcDdaQStmRXpx?=
 =?utf-8?B?bWJtOXlFVkFUWldMS2lJa0JZUk40bDZyY3h4WVJxMTJLcUluaHVHVFFleVdE?=
 =?utf-8?B?bVFDWGxzbzkwbkk2MGI0a0lSa0YyUHlydVlLaWlhZHdrak53aE83c0NuRDMx?=
 =?utf-8?B?ekZnOHNMY0JmVGJrV0pVcGNoeHBtak10dkRyRDlRczBzU3lPN0gvb3dIU1Bq?=
 =?utf-8?B?TVJkZHUyd2FxWFVENXBzdVZpSFFQMHMwMk55VVJqK1VXWHFuLzRiL3Q5dXRS?=
 =?utf-8?B?dTNzcEkvbHhyTzZncUZrZlZmZFpLRXl5WGUyNG1ZVHNjWTk3VUo5WW1kRGMw?=
 =?utf-8?B?TEQ3dEs4SW5walFNc2hUK01PWDZLZWtBbldDN3RuL3Z4c3l2ZzcwSDVBek1F?=
 =?utf-8?B?ZnViZXA0cnBjYURYQmZEOWt1S0ZIdC94dUJ3U2I1dEZIVzF5SGxCMUN3cndK?=
 =?utf-8?B?R0VXcnlPWC9TaWRaQVc0SWozclRMUTFodXBSc0s2NUwvMkZEVzNqNEhRNU9D?=
 =?utf-8?B?eCtCWXAyWFM4cDBjN3lLbWl4RlJVNG1JMWhPZnVMTjk0cGJ1REJFQUVqcy9x?=
 =?utf-8?B?ZW1yVXZvNlZVWWVkb1J1dWRPMzUxRlZmajlJUlZydFNmN1MrQWJjTnBJamhO?=
 =?utf-8?B?b0VHQzE3WkdZaDhKV1dBNFdDNzJ1R1lkTzdjUjJBZm1KbGFudEg4OHdTaTFx?=
 =?utf-8?B?ZWhVR2w5WEdmbnFtR0JNdTExbi9QR1oxVloxWitoRU5DRkxvT1JrdmNhb2VQ?=
 =?utf-8?B?SjZiTGsvZzloS3Z0VGtEc1VFeTZsWEVObkNDbWRCbUJqaUwwdVBESWJnNjBV?=
 =?utf-8?B?bmJTMnZKejBjaVpPRjRKQnR2NjRoa2hrdnYva0JNeHlhL1BCYmoxT0lCOXRJ?=
 =?utf-8?B?Yzd6N0JGOHJia3pxTGtMQWorUG1zYS9jb1FWd2tYbXorTG10VlFQQjB2dHNM?=
 =?utf-8?B?OWJWSDVYeDNFc094aUQxKzc0MmdwUzlVZkNzbzl3QWZaZE02a281NVVoeDVw?=
 =?utf-8?B?NWdrTGpCU0wxZEdyMUVpRmM0TktHOTJMSmwvejJ3bGo1NTZpUmFGVkJRMXlY?=
 =?utf-8?B?UEhiTGV4bm9KYXBIZGdtTzR5elgwRysvaEJlWnk1MUFuZnZ5SVdtTlQ1bjlO?=
 =?utf-8?B?TEs1VFd6cXBiZjhFNlZwanljYVFya2hhOElSYzUvY2l2REVhTjExR3FWYWlW?=
 =?utf-8?B?S3lqZmZCTTdLQlhGRXMzTjh4clg0UTdBdDFodXVVeFF1ZTJSbDRzcThMQXQz?=
 =?utf-8?B?U1o2ZWN5N2h3Qmo0RHk4Y3M0N1JSczA1czZxTkk5cTVPTWo2S2xJN0tjVklD?=
 =?utf-8?B?MGtZZDUwSFg4NjEwZ3FKb1Q0dHZsa21IVkVZdkJ1OEpjRnZMbld5NG1YSDZ4?=
 =?utf-8?B?TkZmWE9mTTJBRlV0eUtHQnpJSzRUQnBhUjVDS1pWNkJqSFpzZmtrTUFNMkJ2?=
 =?utf-8?B?VWNFMUcyWjU3TFdUK0hmSlk4OTNhZEtTcWRBMmsycGVvSGNHREJvRWFNTFlk?=
 =?utf-8?B?aXM2YkVCU0F0TkNoeVU0d3ZBMUM3SVpBdk96aUF2dGF4Uk1mazdNYnphejI0?=
 =?utf-8?B?SVBSakN3bVg4K0FBQjlxOTdsdEZRZk5pTHVCZ3Z1QVdWWmxEMmd3MEpIaG1G?=
 =?utf-8?B?YW5EQm5zMEx5TTVSNGd0S3MvTHplOWQvRkd5R2R1Z292eTNXS0RBRjZEREhS?=
 =?utf-8?B?eitHeHV2eUJRc3hjakMvMEhPM3hKT0VZc0hBT2dXZGF5S21zYlhPekR2cUhJ?=
 =?utf-8?Q?U+Wqrggj0CxYKOlo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF57939B5260174B9A3ADA6817C7715B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e36f140-06fe-4b63-f8e0-08de97118d68
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2026 14:57:57.4889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sZv44myoDkVKfTE0yeAdNUDhvRCHdM56iP3YC7SeXYtyisJ6m4/LUEhLpkZHbgCeFMxO/uVwagiRfSJeEAJ1KhMdWveI0U4Y9c85B4OMR+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10217
X-purgate-ID: tlsNG-bad1c0/1775833080-2EB48152-B12B273E/0/0
X-purgate-type: clean
X-purgate-size: 2710
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:mid];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A61113D8DD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGVsbG8gSmFuLA0KDQpPbiA0LzEwLzI2IDA5OjA0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24g
MDkuMDQuMjAyNiAxOTozNywgRG15dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4gTUlTUkEgQyBS
dWxlIDIuMSBzdGF0ZXM6ICJBIHByb2plY3Qgc2hhbGwgbm90IGNvbnRhaW4gdW5yZWFjaGFibGUg
Y29kZSIuDQo+Pg0KPj4gSW4gY2VydGFpbiBidWlsZCBjb25maWd1cmF0aW9ucywNCj4gDQo+IENh
biB5b3UgZ2l2ZSBhbiBleGFtcGxlIHdoZXJlIC4uLg0KV2hlbiBjb25maWcgVk1fRVZFTlQgaXMg
ZW5hYmxlZCBhbmQgY29tcGlsZWQgYXJjaGl0ZWN0dXJlIChlLmcuIEFybTY0KSANCmRvZXNuJ3Qg
aGF2ZSBhbHRwMm0gaW1wbGVtZW50YXRpb24uDQo+IA0KPj4gdGhlIGZ1bmN0aW9uICdhbHRwMm1f
dmNwdV9pZHgoKScgaXMgZGVmaW5lZA0KPj4gYXMgYW4gaW5saW5lIGZ1bmN0aW9uIHRoYXQgY29u
dGFpbnMgdGhlICdCVUcoKScgbWFjcm8uIFRoaXMgcmVzdWx0ZWQgaW4gYQ0KPj4gdmlvbGF0aW9u
IGJlY2F1c2UgdGhlICdCVUcoKScgbWFjcm8gbWFrZXMgdGhlIGZ1bmN0aW9uIG5vbi1yZXR1cm5p
bmcuDQo+Pg0KVGhlIGNhbGwgdG8gImFsdHAybV92Y3B1X2lkeCgpIiBpcyBndWFyZGVkIGJ5IHRo
ZSBwcmVkaWNhdGUgImlmIA0KKGFsdHAybV9hY3RpdmUoZCkpIiwgd2hpY2ggYWx3YXlzIHJldHVy
bnMgImZhbHNlIiANCihjb21waWxlLXRpbWUtY29uc3RhbnQpIGluIGN1cnJlbnQgYnVpbGQgY29u
ZmlnOg0KDQogICAgIGlmICggYWx0cDJtX2FjdGl2ZShkKSApDQogICAgIHsNCiAgICAgICAgIHJl
cS0+ZmxhZ3MgfD0gVk1fRVZFTlRfRkxBR19BTFRFUk5BVEVfUDJNOw0KICAgICAgICAgcmVxLT5h
bHRwMm1faWR4ID0gYWx0cDJtX3ZjcHVfaWR4KHYpOw0KICAgICB9DQoNCkRDRSByZW1vdmVzIChz
aG91bGQgcmVtb3ZlKSB0aGlzIGVudGlyZSBicmFuY2gsIHNvIHRoZSBCVUcoKSBpcyBuZXZlciAN
CmFjdHVhbGx5IGluY2x1ZGVkIGluIHRoZSBmaW5hbCBiaW5hcnkuDQoNCkJ1dCwgdGhpcyBjb2Rl
IGlzIHN0aWxsIHByZXNlbnQgYWZ0ZXIgcHJlcHJvY2Vzc2luZyBhbmQgaXMgYW5hbHl6ZWQgYnkg
DQp0aGUgRWNsYWlyIHRvb2wgKHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciB0aGlzIGNvZGUgaXMgbGF0
ZXIgcmVtb3ZlZCBieSB0aGUgDQpEQ0UpLg0KDQpObyBpbmxpbmUgZnVuY3Rpb24gLS0+IG5vIGRl
dmlhdGlvbiAoRWNsYWlyIGlzIGhhcHB5KS4NCj4+IFRvIGVuc3VyZSBjb21wbGlhbmNlIHdpdGgg
TUlTUkEgQyBSdWxlIDIuMSwgdGhpcyBwYXRjaCByZW1vdmVzIHRoZSBpbmxpbmUNCj4+IGZ1bmN0
aW9uIGltcGxlbWVudGF0aW9uIGFuZCBpdHMgQlVHKCktYmFzZWQgdW5yZWFjaGFibGUgY29kZS4g
SXQgaXMgcmVwbGFjZWQNCj4+IHdpdGggYW4gdW5jb25kaXRpb25hbCBmdW5jdGlvbiBkZWNsYXJh
dGlvbiBmb3IgJ2FsdHAybV92Y3B1X2lkeCgpJy4NCj4gDQo+IC4uLiBhIGRlY2xhcmF0aW9uIGlz
IG5lZWRlZD8gVGhlIHNvbGUgbm9uLXg4NiByZWZlcmVuY2UgSSBzZWUgaXMgZnJvbQ0KPiBjb21t
b24vbW9uaXRvci5jLCBhbmQgdGhlIHNvbGUgcmVsZXZhbnQgS2NvbmZpZyBvcHRpb24gSSBjYW4g
c3BvdCBpcw0KPiBWTV9FVkVOVC4gV2hlbiB0aGF0J3Mgb2ZmLCB0aGUgZmlsZSB3b24ndCBiZSBi
dWlsdCBhdCBhbGwuDQo+IA0KPiBGdXJ0aGVyLCBCVUcoKSBhbmQgYSBmZXcgbW9yZSBjb25zdHJ1
Y3RzIGhhdmUgYSBkZWRpY2F0ZWQgZGV2aWF0aW9uDQo+IGFscmVhZHkgaW4gcGxhY2UuDQpJZiBz
bywgRWNsYWlyIHNob3VsZG4ndCByZXBvcnQgYSB2aW9sYXRpb24uLi4NCiAgSSBkb24ndCBtaW5k
IGEgdXNlbGVzcyBmdW5jdGlvbiB0byBiZSBzaHJ1bmsgKG9yLCBhcw0KPiBwZXIgYWJvdmUsIHBl
cmhhcHMgZXZlbiBkcm9wcGVkKSwgYnV0IHRoZSBqdXN0aWZpY2F0aW9uIHRoZW4gbmVlZHMgdG8N
Cj4gYmUgZGlmZmVyZW50Lg0KPiANCj4gSmFuDQoNCkJSLCBEbXl0cm8u

