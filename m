Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id El2QC9RgE2pz/QYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 22:34:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652FA5C42B3
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 22:34:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318873.1586804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRFWV-0005bt-N7; Sun, 24 May 2026 20:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318873.1586804; Sun, 24 May 2026 20:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRFWV-0005a4-KA; Sun, 24 May 2026 20:34:11 +0000
Received: by outflank-mailman (input) for mailman id 1318873;
 Sun, 24 May 2026 20:34:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wRFWT-0005Zi-4s
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 20:34:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRFWS-00GQ9I-H6
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 22:34:08 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1360bf-bab6-0a2a0a5309dd-0a2a4504e430-0
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 22:34:07 +0200
Received: from [40.107.74.109]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1360bd-1dec-0a2a45040019-286b4a6d19d3-3
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 22:34:07 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS3P286MB2325.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:152::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Sun, 24 May
 2026 20:34:01 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 20:34:01 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hR1P0BwZ/j/ImkyhYtDUQ2Tb9eD3vha4vqcr18X3Qi/pg3xBVAfOYmVon7pRybEvhj197i9B/HWiyFMyxOQZwociFqfPVTMYR5BxbgoNlo7g79m/tUSDC7BL41NWZ1SBvPFok8h0JQIxdq0hU1MRDhuJW9wSnkg8l/+Sd+WkIKkaA+4weyc+0YqKBqlq9dLXDRz/6I4QWumEIZjO42Zk4nBDfql4CK3i8cDtMWuHCEPOZ1/cB4BpTTsQxvf72Jjrm4grLtUhW90RUSK4iFGwaY91QKZ2eMudQs1PAHoQIaVg2W6AumdrDtizSBX7jZSF5Y67+sFTSHn6YaGgetCbBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEoMXAXyDkp2zpC2ykC8ZKgQzCk0LzpMSuPq0fsUMnw=;
 b=m3vadv8gj6mFQNmhxh+VYGg9tmT8EkdRANA8248K3SxI/gcW00Lr7mDBFfBDiuPAVmrX6NNqu1LwJiE0IKeN5S5ohd8beYL/bqNQ1YIFvK+OjgZY46ndoHXm3K5LWJRpUi9jJ/T1kaQhfF3awqtjQMt1MBXec1GEUaqQnzflQf+KnOpvjjZ5OsF6QB55+iZMaqfND0rf52JPtL7PUsFc1dY+xttdb76E/oAN5V9skpMY/KHsg9F2gnPbQqkFfpBxemqiFftFguKfkMqrN8uJ9T1+MxBgP/w/O8r9HMN/Vc3wLpilg4LRIMtLOeIW8NtkLqR9gutYnlHWeEOAxeTbCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEoMXAXyDkp2zpC2ykC8ZKgQzCk0LzpMSuPq0fsUMnw=;
 b=EPUIGVnYebSAf14XJcqg3MPRsDF67EklIt3DBEXy7AneS2HVzc1stvaR3KlmUOsdeGCFcR9Fnab8Ms+oFA9rafLeMyX7pAMcL/Vd2QwQIIiwCuJDkeDs9dH40KGfCk2yreWXrif9BcW9iGQ/DKIf1LbVmi8se56ffBg9xHSFo2g=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"anthony.perard@vates.tech" <anthony.perard@vates.tech>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, "julien@xen.org"
	<julien@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "jgross@suse.com"
	<jgross@suse.com>, "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"dfaggioli@suse.com" <dfaggioli@suse.com>, "gwd@xenproject.org"
	<gwd@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 07/21] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Topic: [PATCH 07/21] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Index: AQHc6xCjYQ+8FIQyC0GVlBooU9qyFbYdTBoAgABWAuA=
Date: Sun, 24 May 2026 20:34:01 +0000
Message-ID:
 <OS9P286MB7222D4520BDF3F2CCA4EAD8C820D2@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260524000209.292370-1-taka@valinux.co.jp>
 <20260524000209.292370-8-taka@valinux.co.jp>
 <50a4d56e-6adb-442c-ae98-1922315706ba@suse.com>
In-Reply-To: <50a4d56e-6adb-442c-ae98-1922315706ba@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|OS3P286MB2325:EE_
x-ms-office365-filtering-correlation-id: 8be777f4-5b39-4638-6e5c-08deb9d3ca3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|56012099003|18002099003|38070700021|4143699003;
x-microsoft-antispam-message-info:
 39+0XsAalCqadQ+nYiGqrycD/1MjsLrjc/iWGgtGykN14GVo4yuvTCsDvql9PkhWa++/WfZ2l07NaE6lZcT5xrS+TIRflqnzYFRW2E7saIRylWH6WcqPXNKfdv/uKDSpyaIIEn4TUuUTD3auJ6mqruHKOhnGRg/x4pXz7TpQ580oUUMu2QN2nVTEYExZdUC1u4LpBDv2H0u+MG7tjk55Zup6gcpWBOTs9R83iMASjQObbKzyNcnOTTHjK1JxB3+fw/E1+oR2sPaDBx4BIesmPKx0ykf++bwGIB7DXOKGQ6Owg49K3tidBDp/XfQ8ZhXOW1ZCphLiZo+uBISlJR8eQ4zBpoA2cs0kGzd//KpbW2Zv1y1jU5Er4EFMBdp+16YHpXG5ZGlOaTEvytLcqHyRJt1QruTrsYf7f5Jrw0ieazBapB2HduKQVKEi9Q5LROieTpvZdGE4MiIHYct3+Xpyxxrtof8tTh/PGjM2GGCqvNN9j44TCA77dMevE6i6eicS2NZPDqt2Wub9+f6vOh36R2yzsRwEsEdG7fuMJ/GlbiFkc1cNFfhyMEU+T8Isdkao0Q4M5XxRxKaoE9bn5PHk+EZ6Kkl6vtG2lZfkWBHgjadHFadED3xMXF8wV9sUui4P45NygswUyX2kbUeJPbv+E0RqYTKFCdC3xs7y4PMEzf/rCkIRJ5LyXZt9Xgo90hXTrllK217ekZsSnCihZ/HlQHdvFtAS3fEeBWiRS6imvkuiweCVZsCCJwzXeWwMLgQq
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(56012099003)(18002099003)(38070700021)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aGE2c1FNK3FNU3RISlhYTnByZXk1dzJlN1VINFlBWjBVS1FvYnhZbXM1bHdS?=
 =?utf-8?B?L05RbUhGQXNYVWJqRXNIOU9VK1RQZjRHM1dzV2RQT2NYbmg3ZE4yb2J3RUxU?=
 =?utf-8?B?bFVNb2RyNG1jWU5Ja0tvRXl1ZEREWG53ZnVYa2ZpQWRIcDZlclZRbFNvZStq?=
 =?utf-8?B?YjNDVUdRL2h2bGo3dTcvMlpNWjE2RWp0eHY5bTErTmZlbnZJWkJ3VFlrUndM?=
 =?utf-8?B?TDUzMENBNEI5am9pcU9PeW83Tkc1ZUZocmJwYjRkNng0L2NnQzUzSDdUNWhH?=
 =?utf-8?B?Y0kvSXJGNTgrZDZZL0lObzRleStzbHVac1JYa3NrMlhMYnpMbnB1SVFoZ0Qw?=
 =?utf-8?B?YkxwVHo3RkV6SmwzMEcxL1NReXhLYkxpSlg0VDhqb016dVhITjBPMmY2MTJx?=
 =?utf-8?B?dVZGMk56Y1FObWd2a0RRczRiZ3R4YTE5QnFWWitSN21FcERia2pqdTJnbWZs?=
 =?utf-8?B?dmJyaStWRzFYSmpNWE8yV2JBSmczeDkySWlXUHQvNVRjVk1IZitXbTVrb2o0?=
 =?utf-8?B?Y0VTTmU2d1FYODJYNUp3bVlPNWNEYys1eGUzdE4yK2VpeUtCVzZpMDg4QUto?=
 =?utf-8?B?MkpIRjF5cTYwTXZ0ZlZVUkhnQmZJTElPWmxwTG5Wb0NHOXdpQXpUOEN5UW9t?=
 =?utf-8?B?L1NvdTRGMmtzNE16YmwrV0ZDZk9nbzRpMitXSXpwcmNjVWtSQkpvdlY5RHhv?=
 =?utf-8?B?NlRBU0J0WG9xc2pldjZiR3dmUmxYUmRRZG10OWUzU1BIbW9iTlphbHFGdEw2?=
 =?utf-8?B?WCtOcFl4UHdFU0tpZW1RR2JpRFYyZkd5Qzd2SS9SVjNlOE5obkFybVE4MndP?=
 =?utf-8?B?c0w0NnYrVXA1QzNFY3IzRVpJVXR1RVgyM3lJOVR5UXpJWHRlMENXeTZZMUdZ?=
 =?utf-8?B?M2VJRVpkM3lXR1lzT2RSYTR4VTB6c2l5cFR5TWhYQ0RFb05ldzlGSWVJaUha?=
 =?utf-8?B?T2tsemFCTjhTWXB2bHpISHRCWGlpQ0RKMzNkQVU4NGYzT3FVK0swUjdJUDlB?=
 =?utf-8?B?YWR6bTAzc2JDS0o4cEVlTEdVajNSRUxKMjltSGhyc0tVRmR5R0g2TzhWVmJO?=
 =?utf-8?B?aGMvMHVlSHRJem8ydG1KTzdhWTk4ZG1DV1NyZjRraTEzUS9xSE1kL0pyTGRx?=
 =?utf-8?B?ZDdjT3pUc0VwQ3pVTkhrZEpCdEV3QXR0Q25EOU9CWmFKK0JXNmpTNFduYk82?=
 =?utf-8?B?U2h2bnk0Tm13UDQ0U2h5MzJidmpYY20xNUNNM2pPZkd4YkRwM0c2SFRzeUY4?=
 =?utf-8?B?RlpDMitxSkNBZjJVTVd5aGM4OG11d2ZaWGZMOEV5TlAwam82THlZb3hPSDdR?=
 =?utf-8?B?bDUyWjV4NjVrS1NQS29pdGtBUmNtRzJIOVk3R0VZM0hFNU5Sc0gxVlNaQkhk?=
 =?utf-8?B?a09kVkRoUVJ3L2s2REpiRUJTYmVCZGZIWit5dXIwM3JXd3FTRC92dU1wZFNU?=
 =?utf-8?B?aUl4VVdMNWNZNTRpYno1SmhIK0gzRmpFS1pGVkZUeWhGTzQ1NCsrT2pPOEhZ?=
 =?utf-8?B?ZDhNaytqVDZrSVZ5UWFCUC8xclQ5a2l4TEw2ZUFPNjkrMXdIbzFYTnMxNGdB?=
 =?utf-8?B?KzdUZ0F6TXdlbXlCWW5rVDVqWWdoc2FVcWY0R2w4c0dvMWxvZnl5eUZEbWJw?=
 =?utf-8?B?Q2tRZ1VPQjVzTC92TXdPeTVCK041cVNQeUVnSGhXNjFyWEZqdmhDb2h2ZjhV?=
 =?utf-8?B?UUVPVEZaOFYvbHRRWWIya3NMTG92aGpBdkVWTGdZemZkRkxsT2tsOC9EbVlk?=
 =?utf-8?B?eWNvRnUxUXZEU1RuZlN6ckxGWXk4WHRmeHFTLzd6ellyZFZvbjdNOWJXbUh6?=
 =?utf-8?B?SGhINTJUeGY3YmdsV0IzYzJZM3BuWXZRUmxPTXJOSDZVeGNTUEdiTTMyUDQx?=
 =?utf-8?B?ZUcyQlV6UWpCL2tjUVBKRHk2b2ZRY1BjY0hpYlB0TnhFZHJ3UjUzSTEzUW9Q?=
 =?utf-8?B?YVhqaTJIMzBUMS9QYUVNVDZjeXZtLzNBM0dzamk2YzNaN3VCQXNqOEsxL0Fz?=
 =?utf-8?B?bXhuR1JIeEdSNzEvWm4raDloTFpDY2Q4SVFoQ2F1Y3FtcXdaY0E2bU9jM1Ey?=
 =?utf-8?B?NzEyZEVMZkFZM0QrUHpLQkV2LzNWcjhZcXJKc1RvOFJmeis5TjJoYUl4VmNY?=
 =?utf-8?B?dnBkNksyLzNLWDgxOVBYT1IxWkNIV3E1ckxWUWQ3N3pPb1d6YjRSK3R0Slhm?=
 =?utf-8?B?d2swRWdieXNDZVAxdk5wZktUQmpOT3B5Y0FRSWNuZTVtV05mUXRBKzEwa0pY?=
 =?utf-8?B?NmRVMG1rTGJ5R2hVZzZDeENiNklWL0NqN0pjN2ZPOEtDZVVCamV3UnJEenhT?=
 =?utf-8?Q?Q0QWHQv9ACV8swWP5w?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be777f4-5b39-4638-6e5c-08deb9d3ca3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2026 20:34:01.5330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OqNIfpauWrycANGOJOpuOc0Uvh7cFBksImTGqwIUZSVZFnuxSaxrdO4uFF1fG+RB/ThLtk08al0OEp9t+B9fTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB2325
X-purgate-ID: tlsNG-ebf023/1779654847-4217E3FF-4C9A7B14/0/0
X-purgate-type: clean
X-purgate-size: 2662
X-Spamd-Result: default: False [0.91 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,valinux.co.jp:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.161];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 652FA5C42B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGVsbG8sDQoNCj4gPiAgeGVuL2FyY2gvYXJtL3NtcGJvb3QuYyAgICAgICAgICAgICAgICB8ICAg
NiArDQo+ID4gIHhlbi9jb21tb24vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAgIDcgKw0K
PiA+ICB4ZW4vY29tbW9uL2RldmljZS10cmVlL01ha2VmaWxlICAgICAgIHwgICAxICsNCj4gPiAg
eGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9jcHVfdG9wb2xvZ3kuYyB8IDMwNw0KPiArKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiA+ICB4ZW4vaW5jbHVkZS94ZW4vY3B1X3RvcG9sb2d5LmggICAg
ICAgIHwgIDQyICsrKysNCj4gPiAgNSBmaWxlcyBjaGFuZ2VkLCAzNjMgaW5zZXJ0aW9ucygrKQ0K
PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9jcHVfdG9wb2xv
Z3kuYw0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2luY2x1ZGUveGVuL2NwdV90b3BvbG9n
eS5oDQo+IA0KPiBOaXQ6IE5ldyBmaWxlcycgbmFtZXMgd2FudCB0byB1c2UgZGFzaGVzIGluIGZh
dm9yIG9mIHVuZGVyc2NvcmVzLg0KDQpvaywgSSB3aWxsIGZpeCB0aGlzIGluIHYyLg0KDQo+IA0K
PiA+IC0tLSBhL3hlbi9jb21tb24vS2NvbmZpZw0KPiA+ICsrKyBiL3hlbi9jb21tb24vS2NvbmZp
Zw0KPiA+IEBAIC0xODgsNiArMTg4LDEzIEBAIGNvbmZpZyBWTV9FVkVOVA0KPiA+ICBjb25maWcg
TkVFRFNfTElCRUxGDQo+ID4gIAlib29sDQo+ID4NCj4gPiArY29uZmlnIERUX0NQVV9UT1BPTE9H
WQ0KPiA+ICsgICAgICAgYm9vbCAiRGV2aWNlIHRyZWUgYmFzZWQgQ1BVIHRvcG9sb2d5IHN1cHBv
cnQgKFVOU1VQUE9SVEVEKSIgaWYNCj4gPiArVU5TVVBQT1JURUQgJiYgQVJNDQo+IA0KPiBJbnN0
ZWFkIG9mIG9wZW4tY29kaW5nIEFSTSBoZXJlIChhbmQgYWxzbyBpbiBwYXRjaCAwMyksIHBsZWFz
ZSBjb25zaWRlciB1c2luZw0KPiBhbm90aGVyIC4uLg0KDQpvaywgSSB3aWxsLg0KDQo+ID4gKyAg
ICAgICBkZXBlbmRzIG9uIEhBU19ERVZJQ0VfVFJFRV9ESVNDT1ZFUlkNCj4gDQo+IC4uLiBIQVNf
KiwganVzdCBsaWtlIHlvdSBtYWtlIHVzZSBvZiBhbiBleGlzdGluZyBvbmUgaGVyZS4NCg0KSG93
IGFib3V0IHRoaXM/DQoiZGVwZW5kcyBvbiBERVZJQ0VfVFJFRV9QQVJTRSINCg0KQW5kIEknbSB3
b25kZXJpbmcgb25jZSB0aGUgVU5TVVBQT1JURUQgdGFnIGNhbiBiZSByZW1vdmVkLCBJIHdvdWxk
IGxpa2UgdG8gZWxpbWluYXRlIERUX0NQVV9UT1BPTE9HWSBhbmQgbWFrZSB0aGUgQ1BVIHRvcG9s
b2d5IGZlYXR1cmUgYWx3YXlzIGVuYWJsZWQgd2hlbmV2ZXIgRGV2aWNlIFRyZWUgaXMgc3VwcG9y
dGVkLg0KDQo+ID4gLS0tIGEveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9NYWtlZmlsZQ0KPiA+ICsr
KyBiL3hlbi9jb21tb24vZGV2aWNlLXRyZWUvTWFrZWZpbGUNCj4gPiBAQCAtMTEsNCArMTEsNSBA
QCBvYmotJChDT05GSUdfRE9NQUlOX0JVSUxEX0hFTFBFUlMpICs9IGtlcm5lbC5vDQo+ID4gIG9i
ai0kKENPTkZJR19TVEFUSUNfRVZUQ0hOKSArPSBzdGF0aWMtZXZ0Y2huLmluaXQubw0KPiA+ICBv
YmotJChDT05GSUdfU1RBVElDX01FTU9SWSkgKz0gc3RhdGljLW1lbW9yeS5pbml0Lm8NCj4gPiAg
b2JqLSQoQ09ORklHX1NUQVRJQ19TSE0pICs9IHN0YXRpYy1zaG1lbS5pbml0Lm8NCj4gPiArb2Jq
LSQoQ09ORklHX0RUX0NQVV9UT1BPTE9HWSkgKz0gY3B1X3RvcG9sb2d5Lm8NCj4gPiAgb2JqLSQo
Q09ORklHX0RFVklDRV9UUkVFX05VTUEpICs9IG51bWEubw0KPiANCj4gQWdhaW4gZm9yIGhlcmUg
YW5kIChhcHBhcmVudGx5KSBhbiBlYXJsaWVyIHBhdGNoIGluIHRoZSBzZXJpZXM6IFRoaXMgZmls
ZSBsb29rcyB0bw0KPiBiZSBzb3J0ZWQgYWxwaGFiZXRpY2FsbHkuIFBsZWFzZSBkb24ndCBibGlu
ZGx5IGFkZCB0byB0aGUgZW5kLg0KDQpvaywgSSB3aWxsLg0KDQpUaGFua3MgZm9yIHlvdXIgYWR2
aWNlLg0K

