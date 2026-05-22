Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLmfD4+xEGpWcgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 21:42:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A15495B9848
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 21:42:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1317281.1586452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQVkX-00054n-Hq; Fri, 22 May 2026 19:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1317281.1586452; Fri, 22 May 2026 19:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQVkX-00052J-ET; Fri, 22 May 2026 19:41:37 +0000
Received: by outflank-mailman (input) for mailman id 1317281;
 Fri, 22 May 2026 19:41:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wQVkV-00052C-EC
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 19:41:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQVkU-008cgJ-CR
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 21:41:34 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a10b11e-2eae-0a2a0a5409dd-0a2a45059404-38
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 21:41:34 +0200
Received: from [52.101.69.96]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a10b16e-aaa8-0a2a45050019-34654560d123-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 21:41:34 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DU4PR03MB10816.eurprd03.prod.outlook.com (2603:10a6:10:58e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:41:29 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:41:28 +0000
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
 b=oY9DpL0I9y0b0dxQf7Gv3I9s/u2HOhCwS7z9Dt+ulu8WawWuNUHPNyOFa/plsWbZHgssadSTkWwOA9CP+6m5/BNV5s67uJIOFABRTOo7jOX75QV2XXllGvon859fd39LDd+HpbPnnm3oAnp/S7+96oEkvs5zk46DBUqWJ7IsKHlJeXIeNxsyDSdT5f37L18elIQKfn01lugRFhKsvBHQ+mfEGT2ZexKBjeuTjY1QbVrzZqOEiIf6psbxzcRtQ56L7BrpW86aY587QhpcpyVI2SbeMCzBlMkPHAJAJr04ThuNb8iXY1LYnhSJCMNSNj8bCxI8x7LvEn2xvoKiyLIuYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzlmfAAgr3EPxUJhCev4Z1FWalLvf1q6g2YgVqmnga0=;
 b=jqy2FqHys/Y6pwNiEaaazb8KYjet7j+obH3FePAf5mXlFAoYKkHqMQDylKjMYFWNq66V5ADeaDz11rQCEoywhl6VeMoJ55GnKnW+0kJHBvRWciroO0cYY64Xrf1iHeQJSzt+irlXQ/Wbh7m+BqIk9CwyTyB5shmjKfDix0jpeIvrVkbqrBdal9SUBK34Vy/evnDDlxq+yVsUpHXUKqH0vkHsh1uvrXV6YGxMC27XTN+5A+DmNG868uRnVCHQAjcD/RfFukCFw1AQZ0ZXPtXvaMA+MGsT4EJKLzYNbDeD78PEq1FclqAtw5nabwik+6sSt4LPejp2QtHz9ZHPtyz7yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzlmfAAgr3EPxUJhCev4Z1FWalLvf1q6g2YgVqmnga0=;
 b=L2ntnvs+7rIWYyU8tVIlTZ++DMyN2yuKa+k3DXe71MD0/Pc5VWdCSlUAHwvYZxI4y9b3OYvcRAxV5ezs+7S8KzlvmIpEA/q3fXTQdVAqRZCbL9WlucsrCaH7kAHWuI64WtOtf/7ggKd+2qDAAr6cm5x1HuLiRKNQrkOxca3DMw1v1saFYCyusGvoRz9qapiW5XJQ0xnjwDUHk3kY/A70Xfwe6xzzSiW4qH2k9vWgks3VnJPrTuz0/cSW5i4k9Uzdd04WF+m1BgjVr+zerPf9gf4VcIFxaGvrqjKko4Zjxov+KKgPDF/gwK9kQCN/fOXTjJOgH2iiYxL+LdEyBqB1Aw==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/decompress: resolve MISRA R5.5 identifier/macro name
 conflicts
Thread-Topic: [PATCH] xen/decompress: resolve MISRA R5.5 identifier/macro name
 conflicts
Thread-Index: AQHc6V8B/lHbglNK/EOVvgWJnFkvvbYZkMGAgADidwA=
Date: Fri, 22 May 2026 19:41:28 +0000
Message-ID: <4f264b66-2561-4d0e-ad84-9677ba243d01@epam.com>
References:
 <69ef81a2f85b35e6231ae389bf271cad2bbd7dfc.1779394622.git.dmytro_prokopchuk1@epam.com>
 <dc95a208-6721-4735-84af-4a3864e9d468@suse.com>
In-Reply-To: <dc95a208-6721-4735-84af-4a3864e9d468@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|DU4PR03MB10816:EE_
x-ms-office365-filtering-correlation-id: 751049d6-f9de-4221-b359-08deb83a1e49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|22082099003|56012099003|18002099003|38070700021|4143699003|11063799006;
x-microsoft-antispam-message-info:
 +DDPZx9dsskJSqHPh1TI5Usn6qk4w3EI5nYn2PewX4O0KBzBA1MtmYG2lrmom5JQEARaib0SqlPScn3Mwjn1oH1mZI2kED+6SvHbf5hrht11OysJGdlfpKNtuUF05m8236ikX/+40J2edGYQQCMHvTcFM5DkIgplp0SdkGDI/e8ptW/zgEqjif4rW07xl7y74RjXv8yufRLl7R+fZ1Klve/RQtFMqv6p1yNnHGtObDKIBJ92f7Drf6tmkYCSM3eHZa5aD367LBmq/GuMBYmIkqSRi7RHh/WxD/rw/vo0rt00JD6b6EJ1FsB9CkkTp1nVyWAJmB7kXkeo0JJXSYPN7MSzcFXNXzrd1UBPUSoLU7WXvds+OqkMarbVB5CFtvM0kFHra88SyoWUr+smSdecNYTn4ESMrFWHXA8v0LLrauw4OxdG6+gPkzfy//AdeHxKHYRJ/xdDUpdB7albhW7/Vl7Z7KPiRu2Y50luKP+bYkuK4PFTCmQLJQdkxpVGJEQdcrP1mFx3BevA0YbAwT0GU5tR8PdXaJOxadw6/5yqQiCSw1B10eYZbnsAZijp2H4WAUlpCO72/7ehL+pkdZfHIiq1sA1Hxv6L1X92UjOlZ2i/ijrYB2y+bR45fj0gOyI1UPKb7U1pun/ss9ZVzrPqgbVimPeHPV7mAv3rXivk0Sol26pVTvR5xo+fPArtXLJabLbghRS33+cHj1ieAxxPsJkQ00mwFlVzJXUq3hSyRfvRwZzqii5PcE/Q0LZwZ9/8
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(22082099003)(56012099003)(18002099003)(38070700021)(4143699003)(11063799006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N3luaGt0Nkhya1dySFliNnRYQ2c5VXVEcFNINkJIMWtLR3kzRXd6ZVFHZUp3?=
 =?utf-8?B?Ym5PZUlzUXRPUFdmeHN6VzVGRVYxZGpiTkxWZ2QyM0xaZ1hvR25MVUwvYWlW?=
 =?utf-8?B?MkE0RUcrazEyVkVIN0xVdUZpOURuTkNCbUJXVVRiNGZ4YWZhWXgzN2czSzFO?=
 =?utf-8?B?dm80VW5rZjhpY1F6YXdaUXFkNVRjU0lnOXVNTHRSQ2VLNmdGaHBtWXJZMDFK?=
 =?utf-8?B?OE5JcnR6a0t3akZVOE9LazZXU2gvWGFaWmJSa0pmT1hBZTRtNkJobDlYTytv?=
 =?utf-8?B?UTNLd1AvbnlqWXJFV1Y4b1FaYmhwVDBSWlhzTE5YQTBLQWdZRUdlYW1HdUhE?=
 =?utf-8?B?ZUwxL3U1V29KSDAwemova3RTUElHMlh4N1FYOFNlbmlnLzZyUHJ6K09ScytE?=
 =?utf-8?B?Q3M4aWpoNUU0TllTdXBnN2lwTGdSYndMTTlFQUNydmRLa1NWN0Y4SnJicUtO?=
 =?utf-8?B?ZlRMS1pGTjUxZFByVTRYSlRjZVVoaFpiS0Y2ZkZKSGZmWG1wRmNXQjFiZG9x?=
 =?utf-8?B?bktIY243Y0drc0JSMEZ1Uk9GUUtLNXdpcVpaQTBFanRTWFRuUmNBa0F2WmpI?=
 =?utf-8?B?eEFMLzVuWUN6U2ZGOTFTdEdaTEN3dHBMbEkrYXJabzVPVUFzZXFBMm03ODBa?=
 =?utf-8?B?OFExZ3V5d1pOQWViL2pKdkxpakd4bjUyZkk4aVkySUJRQ2JzdlY0NmJJVW0r?=
 =?utf-8?B?ODZpcjJSSHBaWUNUcVpUN0FqQ1d6a3pvT01FQlhPK3JjU0JYemNZU245QzBh?=
 =?utf-8?B?aC9WQlh1SEQ3c3NMbVRodmhWdXAwOGtXUFJzZ1FzL1UyZWFIOUlMWHZxWWJk?=
 =?utf-8?B?VmN4OTRYYVc0SHlwamJ0OUg1aVVyY0p2bGhUREViSnFyRlNwWWRlUmkvbmp2?=
 =?utf-8?B?Q3MyS2pHa1R5NGxxTjd1VlJ2aVRQZVVabFM3WU1kbnNHTzFFcVM5UnlVeHJm?=
 =?utf-8?B?KzlLYnZuaVJEL2VvbkpuNU93dDlQbFpvWUdsTWxWa0VQNXNXU2tnUElxN1Ay?=
 =?utf-8?B?RE5CU2RNVk5ZcEZOT0tDcDhCMWJjd3oxTTdxOCtBKzBBaGNpeUNHZDVwemVm?=
 =?utf-8?B?ZFhUK3hYcnhmRzVxUk9pczhMMmZnS0swdkswNHRodUNzMG5aVjRLWUFUMzQ4?=
 =?utf-8?B?amJhdUVIRUlqdGFvTlU4YzZySUVwSTk5ekYwN3lRK0Zlci8vR1prNWZpT01s?=
 =?utf-8?B?RVpWL2Ywek9XWkJNYzd5bWc3Z2U4aXBnUStzT2RISWZKU2dpODRZUmsxRHpB?=
 =?utf-8?B?UDg3WUNJMkp4ZlVSRGJRUzYrL2JnTk9GNU5ObThFUVlZWjNteWpCOG55UkxU?=
 =?utf-8?B?WTFvdVhFcElTaXhlUkNRb2xrOERjb2l6eXcyaTg3a2dmRDg5TW1UMWRKV0Fz?=
 =?utf-8?B?VVBWSThIeThNOWNmSHd3cmtIUnB6VnIwblpBb0dYbXZzdHRZU04xZzNiNk5v?=
 =?utf-8?B?N1ErbU0rR0FEejFyZXV6V09sTEorelB5d25udytGNVZZaEhhK3lRbDFzeEFl?=
 =?utf-8?B?SjNLRURIMitTaDVoKzhHZHRhaEl5THBkTllLTU9ua3h0MGVxRmNlekN5OVBC?=
 =?utf-8?B?M2ROa0NBMUU2SFlYSnQ3cXFLR052REpNNVRLUTFCOVlGZURxNkEzazU2VTIz?=
 =?utf-8?B?ZTdMQzI1QUVna25kbVduM2l4WFVkamw5RzJMU0w1T3YrelErL3dEcmNmVVND?=
 =?utf-8?B?NDB4cDNGU0doVzY1NzR2eVgyL2dVaWE3cE9jMkI0TzZGUEdXMi91VFVrcFE3?=
 =?utf-8?B?TmZadFFHSWVmTjRZbWRWbkxsaXgrd0srWGovZHJORW9yazIrVSt5SWFjbGhL?=
 =?utf-8?B?dU1HKzRFQzc2YmRoRjZ3TEQ0UFF2Q0FxNisranFueTMzN20zYkF1aFR5ZHhG?=
 =?utf-8?B?aFQ1WUpMcVpGSng1c3BhVVpuc1p3cExRQW1jVHF2enh5UE4wRXBhbjI4TnNo?=
 =?utf-8?B?MEtIbitabWxaRG5FR0tTeWFsYmVtMnpVclZlcTd2N29uRjRsN0RZMzlhRjRn?=
 =?utf-8?B?NUpKSlRGTDdTeW5ocGdQa2pDYzkzQUluZ0RjcmpGTE9ZbURrdkhqQVJkRmhK?=
 =?utf-8?B?R3ZhOVpsTXI0Q08zOUwvYWdRNWt1RGZCaUxVZWZ3blVmYXN4bDJERXIvK0Ns?=
 =?utf-8?B?aTd0R0tmUFFOSDBmaVg5eTNoY0w4WE9wZE40UHhJMTRicjY2d3Vmd0dTTmpE?=
 =?utf-8?B?Q0RUWWFadVZDVWI4U0U3OFA2L1VRNlo1c0NUS1J2b1Bmd3g2akloU2N1dHlk?=
 =?utf-8?B?WHQwQUhpTVgwdmRKSTJSNE9HNzJqWlVLaGtjcW1XelZKRFlsUDNsT3d4aW5I?=
 =?utf-8?B?Qjh5eW5nd2VXVmhRcVFiRk9FaTF2ZVFDVUtxd0dhV0hLUVViczZqWGZJVlZG?=
 =?utf-8?Q?ZHfz4QzyIhX9dkAI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <53A5757F6C9FE04BB4F1D4584E16C8E1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 751049d6-f9de-4221-b359-08deb83a1e49
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 19:41:28.8545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mKvKdaZbjom2ZFVW32QqavXY7xGirKGk2N7+rjRGwX6dXhpi//B3bmNGxduOQL4rVBxrgnHzTKRqQ9nBefF3ZQh0sETEwpfO9tiG01FpbvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10816
X-purgate-ID: tlsNG-c201ff/1779478894-E1599443-7EC581D5/0/0
X-purgate-type: clean
X-purgate-size: 2046
X-Spamd-Result: default: False [0.91 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.114];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A15495B9848
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGVsbG8gSmFuLA0KDQpPbiA1LzIyLzI2IDA5OjEwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24g
MjEuMDUuMjAyNiAyMjoxOCwgRG15dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4gQ29udmVydCAn
bWFsbG9jJyBhbmQgJ2ZyZWUnIG1hY3JvcyBpbiAnZGVjb21wcmVzcy5oJyBmcm9tIG9iamVjdC1s
aWtlDQo+PiB0byBmdW5jdGlvbi1saWtlIGZvcm0uDQo+Pg0KPj4gVGhlIG9iamVjdC1saWtlIG1h
Y3JvcyAnI2RlZmluZSBmcmVlIHhmcmVlJyBwZXJmb3JtIHVuY29uZGl0aW9uYWwgdGV4dA0KPj4g
cmVwbGFjZW1lbnQsIGNhdXNpbmcgY29uZmxpY3RzIHdpdGggc3RydWN0IGZpZWxkICdmcmVlJyBp
biAncGFnZV9pbmZvJw0KPj4gdW5pb25zLiBGdW5jdGlvbi1saWtlIG1hY3JvcyBvbmx5IG1hdGNo
IHdoZW4gZm9sbG93ZWQgYnkgcGFyZW50aGVzZXMsDQo+PiBhbGxvd2luZyAnZnJlZScgdG8gYmUg
dXNlZCBib3RoIGFzIGEgbWFjcm8gYW5kIGFzIGEgc3RydWN0IGZpZWxkIHdpdGhvdXQNCj4+IGNv
bmZsaWN0cy4NCj4gDQo+IEF0IHRoZSBzYW1lIHRpbWUgZnVuY3Rpb24tbGlrZSBtYWNyb3MgY2Fu
bm90IGJlIHVzZWQgdG8gZS5nLiBwYXNzIHRoZQ0KPiAodW5kZXJseWluZykgZnVuY3Rpb24gcG9p
bnRlciB0byBhIGZ1bmN0aW9uLiBMaWtlbHkgdGhlcmUgYXJlbid0IGFueQ0KPiBzdWNoIHVzZXMg
aGVyZSwgYnV0IGltbyB0aGlzIGFzcGVjdCBuZWVkcyBjb3ZlcmluZyBpbiBwYXRjaGVzIGxpa2UN
Cj4gdGhpcyBvbmUuDQpJIHdpbGwgc2VhcmNoIHRocm91Z2ggdGhlIFhlbiBjb2RlYmFzZSB0aGVz
ZSBtYWNyb3MuDQo+IA0KPj4gQXBwbHlpbmcgZnVuY3Rpb24tbGlrZSBmb3JtIHRvIGJvdGggJ21h
bGxvYycgYW5kICdmcmVlJyBlbnN1cmVzIGNvbnNpc3RlbnQNCj4+IG1hY3JvIHN0eWxlLg0KPiAN
Cj4gTm90IHF1aXRlLCBzZWVpbmcgLi4uDQo+IA0KPj4gLS0tIGEveGVuL2NvbW1vbi9kZWNvbXBy
ZXNzLmgNCj4+ICsrKyBiL3hlbi9jb21tb24vZGVjb21wcmVzcy5oDQo+PiBAQCAtOSw4ICs5LDgg
QEANCj4+ICAgI2luY2x1ZGUgPHhlbi90eXBlcy5oPg0KPj4gICAjaW5jbHVkZSA8eGVuL3htYWxs
b2MuaD4NCj4+ICAgDQo+PiAtI2RlZmluZSBtYWxsb2MgeG1hbGxvY19ieXRlcw0KPj4gLSNkZWZp
bmUgZnJlZSB4ZnJlZQ0KPj4gKyNkZWZpbmUgbWFsbG9jKGEpIHhtYWxsb2NfYnl0ZXMoYSkNCj4+
ICsjZGVmaW5lIGZyZWUoYSkgeGZyZWUoYSkNCj4+ICAgDQo+PiAgICNkZWZpbmUgbGFyZ2VfbWFs
bG9jIHhtYWxsb2NfYnl0ZXMNCj4+ICAgI2RlZmluZSBsYXJnZV9mcmVlIHhmcmVlDQo+IA0KPiAu
Li4gdGhlc2UgdHdvIGluIGNvbnRleHQ/IElPVyBpZiB5b3UgbWVhbiB0byBhY2hpZXZlIGNvbnNp
c3RlbmN5LA0KPiBjb252ZXJ0IHRoZXNlIChhbmQgd2hhdGV2ZXIgZWxzZSwgaWYgYW55dGhpbmcp
IGFzIHdlbGw/DQo+IA0KWWVzLCB0aGlzIG1ha2VzIHNlbnNlIGFzIHdlbGwuDQo+IEphbg0KDQpC
UiwgRG15dHJvLg==

