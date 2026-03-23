Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBd1DzMMwWmtPwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 10:47:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4762EF4E5
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 10:47:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259120.1552437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4brS-0004Me-2S; Mon, 23 Mar 2026 09:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259120.1552437; Mon, 23 Mar 2026 09:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4brR-0004K2-TC; Mon, 23 Mar 2026 09:46:13 +0000
Received: by outflank-mailman (input) for mailman id 1259120;
 Mon, 23 Mar 2026 09:46:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1w4brQ-0004Jd-Ee
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 09:46:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4brO-008NEf-Tv
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 10:46:11 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69c10bd7-bab6-0a2a0a5309dd-0a2a450b9f10-46
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 10:46:10 +0100
Received: from [52.101.70.140]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69c10be2-ef63-0a2a450b0019-3465468c5ccc-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 10:46:10 +0100
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAVPR03MB9116.eurprd03.prod.outlook.com
 (2603:10a6:102:32f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 09:46:07 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 09:46:07 +0000
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
 b=zN0K+9VnPHKafNXF4A7/YpIb4KuP/d/JPFYk3ZBpDWRPSxTeiBL9ngT5r/o2XRHW4bzCfCXZMWwZ48+W8oGtSpm8G4XAtkz/WQYhd40ZsRi7X4ZCfe8wRCFNyctsZPOZCMUt35ElhgCYcqYRnQTkPGiZWo5t6T9WtlSKmaOYaJoop0H5GN7efUJnIMWinG2mEaCKY/3ODaeF9e7HEf1cDI1tnFUM86zIpZ3xPsCC7TUqSZQmVuGx34WZh8ftiWjk+KYOgSsaPAM1MwWfg5uKVof8rsljVtDo44OJvTH2uAZi56PRRHEersovjnmvwXH6FWoQZNwj/CwwMBjxFo1BaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0q0PiQZMLqqcTWoiLWBnffvBZD/sjOt+B4Icqn4BIa0=;
 b=mOeONoj+YhgTsGN2Fy4gW6htEVTp3UPAFuISNp3vKkGVKEvjQuMtb+HEJvuHQKVAohX1WKu4U7Lsay4Babk6a3bbexUDOkfeeTLPBZADCTSTnL4gPR380xQwxKpLQ26TsQ9o4dq1ijUNN+Yw0C7puwO56sWAK8IOgdd+08ACCb/80BdK9I6390Onsq94p5vp7KeQ0dUkcqclOdwHa5NIsTRJfNPTftCxghnhJ8iuEWPmvJvbuQZJGterLum3qcAVjKmGfxLyVDEjGd71G69K46PYTvay0igWpo5G5N9Jw7nxHkHE5y+hEQ5sjM081cBay1r6kJ0VqvK5BWEW5Hg+5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0q0PiQZMLqqcTWoiLWBnffvBZD/sjOt+B4Icqn4BIa0=;
 b=T1HDzRaDW/rSOcKwswfzqDU6Q8OvrwjD1AD8VvfSgeQgpoXZksH01ryEK+gNnGw/Iaemd9or21mU+M3lGS3VZM10Y7is6ShLJsF11IVu1f4/Gvp/PFnZgSNkLPUnLu1pyl7DpXMS/cDbxuyba7P/LHpRhNyw1Svk2x5IyzbSwghjbBEKglxB3LlNfdTPiRdhkcxuXe4rZhZD7oxAr49aGg7oiI/trZefZTgc15QnHwliwxuG41MTl8+PQSvIEM76Yja/Lze/1Ulxl0p+c9qPcSyJ6RCxk8JsYhrcEm0CRfkMFyGfxto0fk9oZtC2FfKSGLA7gMR+sP6MutTshV0rGQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 6/8] vpci: add SR-IOV support for PVH Dom0
Thread-Topic: [PATCH v2 6/8] vpci: add SR-IOV support for PVH Dom0
Thread-Index: AQHcr7UOJDdt9SAQzUinWXRod1IIzLW2apcAgAWJuwA=
Date: Mon, 23 Mar 2026 09:46:06 +0000
Message-ID: <ce48a214-e20a-4515-bc79-ecaca02a0eef@epam.com>
References: <cover.1772806036.git.mykyta_poturai@epam.com>
 <b4c86444970a65f56d20203fd77ee368e1eebfb9.1772806036.git.mykyta_poturai@epam.com>
 <436cf1f3-5b5b-4c55-8372-4cf7c7528a4e@amd.com>
In-Reply-To: <436cf1f3-5b5b-4c55-8372-4cf7c7528a4e@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAVPR03MB9116:EE_
x-ms-office365-filtering-correlation-id: f2c1de51-3286-4d66-ddc5-08de88c101a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|7053199007|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 p5fnaRld/DvW3mtOid5H8HZDZZRHUz1dRckvD8nitnSjomvgvmLp7zfnZKCGlwHPagNdc13jLDyMjPlaoiyU49DkyBJjR3oN+SnYMGizvoW6U0p4KFFECtFY4Mafpd9dAkkxx1gaEOibAXJpFvMlV6X6BhZcynaWyqmXVuTOMf1/7g2E6tFWFBdlW2A3Ai0OmyPJeJb9h9t+p6aSp3zjXL/9nzVHCihPE5r70SoEPbWr+2UalKFlJDGX8xwRg5aRWZQypMO3MXBgRntGzboAQNIyDNdvj/Cs1WL6FFP5uKfo1g/hTYkyOJz737E4mOfSCLrSS2R6dT8sQTVJaGMRzotXL1lnYmeDd/GhO0pEwgFYpliwWPLpFo4N9NzOxpGSUAE3D0/HmRcUF6lMryYQOopG3bALzwpi4m6PiG2zIAn07iG5vPs3UD7rO8e5FJ5q1HXKqO3Dv0SgAzGBWAYPjDIUK4qzA5kWZzUx19aMgJpuOMjJf3wu1eZOljsK35DOZovlzKvD5qQXOUfehyZOAmkhea6BGShkSx2wwPUKLyneA9VdgVdlAlVcfB6YD7Rg0i8Y3doMOmuXjDoFplwC/ukLPpeR4lQRYDK0nVIx4oN3O1rd2ta+St0EcuAdnHEGF6dU5nTUVLvDNAMJAks/Ie5gZFHDiiVkbWq8mDm03eTNo9TjDteNU0PzVPo2W19fExw0bkcSJvafJntIDdTNjOMP1HTW6LEGpjCqMoEOLi9G056fAJUSJdrtYiLW5S+HIQhMXFjJAZXpOgvC1esxxnR8CN1NDrUCBbfGAY3xS8s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OThGTEFFOGViNnJNVFptWHRlZFozK1NVVXNuOTFjVUZFaWhQcDZFNnRmdHcw?=
 =?utf-8?B?bW9lVXBuczVybVg4ZGIycGViOVJJc3lETndjVEZock5JTmJWQ1JXZ2Y2K3hi?=
 =?utf-8?B?dVN5U1E4OFhTWW5JbkVKM21rY2JxUFdkclE0clBlUWZURXBwa25WdVdkanVD?=
 =?utf-8?B?SDROMkNxbGpXL0JSZXZGSmkwd3o5NEVFUUJNdlFkNlZVWXJkYkE1ZDM5NWlQ?=
 =?utf-8?B?MDk4bks0blpqSUJHbFc3SDJtc0dEQ3EyQ0tGVUhWYkJXYlowbzdSL0p4dldv?=
 =?utf-8?B?VGE0bXJNV1hVZ0czbHB2M3drOEVIdXFOQnBSdmZVcXRadEFrNDljQS93dFpQ?=
 =?utf-8?B?VlpNRHZwWnZ4RmZwOFJtMDZRUXFwSlFtNWE3ZXJvcXFZNGxUNFBUbFRsQXpv?=
 =?utf-8?B?dXpHRUszMmQrWkx6UlpnTVF0SXpBekpwaWNmZmkyT0JDT1BWQ1RVcUJKNng4?=
 =?utf-8?B?d0hqVEhhSnowN0kyZmJsUzYzQ21NK3JGZ2Qzb3NDbk9WM3htS2RSTjRORWlw?=
 =?utf-8?B?UEc1YXMvMVBlSVlmdkZUV0VjdlIvWHNPcEFXVHVBZHIxUzlJUFJqaXN6bEEw?=
 =?utf-8?B?bWh2V0ZTNnFrSXl3aVZwYXlFUXMxQmp3Unk0STJaRTA1NzdBbnRHRytMOVpO?=
 =?utf-8?B?YTRnaUFra2RRVXNLOW03eGc0R09kZ09Idy9nVHdqZFpJS0svYkFKMWQvL1hF?=
 =?utf-8?B?cGFQUXo0NHFQdkk2K1Qvc3hnRWwvemxDRndVSi83Tzc3RzA2eWxLWVVsUWx1?=
 =?utf-8?B?OFo2Q1hDQ0tibVJOWmpEc1RSVmhyUWNJbzU5MmhlMmFQVGF6ZTE2U3lreTlp?=
 =?utf-8?B?Tm9EQmNXdnZESHVxNVd5dk9QUWtGTHVraXF3azFpemYyakwrWjFBYmFET2pj?=
 =?utf-8?B?aVlROFVxQXVqNm9BZHhFRktXV3lZWWtQVldkaHBDdmZVNkhPcjROeGhWQjdZ?=
 =?utf-8?B?VkdYOHRIZ01jRVR0ZTN5bmpCaWduYnVDa3FGWHhrKytUSTM4Qmx1S3dxMFM3?=
 =?utf-8?B?SXpyUnhtUkswQW1zZXlHZVdwanArd3ZYenJSeWJNRTZMSkluUTZQTmQzZ1NU?=
 =?utf-8?B?QTlLMVp1aDJ4U1B5Y29MNHVOU1plOWF3ODhuSU9yWDVIY21oSEpsRWtYR0RY?=
 =?utf-8?B?alZDRWhVMERBQk5ObWhJWDNHYW5ZcE5weFdGcTZUZUtFaWl0NlhGb1ZaL2Vp?=
 =?utf-8?B?ZWJxQWJZRnVIVVc3SU1rS3g2NWtkdnhUOHhlYXdQb29XZGZBSG5Oc1pvOVc1?=
 =?utf-8?B?dXJiRkp4SmZsZnlSZjYvMXo0bWZncGJndFV0UmZIaHBtUUR1MWRtZjBockJU?=
 =?utf-8?B?bVdrb0hnME9EZzJkRGlrcDF4L0l3RjNsUGJQa0RZaWxnRWZLMHVNS3JuUStQ?=
 =?utf-8?B?QkZrQlF1Y0VYRzFmc3JPNmxaL24zMVZoajRJd09Ka2h3U1pGSmlhamZqT3Vn?=
 =?utf-8?B?NDJDQzJ6NTN5Qk1PNk9nOGhmWFpUMnAwTlRDQnNEU29SWFdkN216NFlteHpk?=
 =?utf-8?B?S0hOTkwyL2NIQmxWUGx3YjRjd3J6MVIyZ1liOGY0NjF6NWpkR3U2bjNkRHlO?=
 =?utf-8?B?OUlzeFNZZDFTUEJ1Zmk0MC9icTNLSlFaR0RyRStTaWlvcnB6eTBuSVBmeWNs?=
 =?utf-8?B?b2dKZk02cEZ0aFBOMFBZdlNpSzhROVU2YTJtL1NvSlNRZjdqUDNLdUc5c1hz?=
 =?utf-8?B?enUyNG1Vai9OYWhBWGdBdzVsMTFXamFTN2huRmcyWXJWcFdzSGMyelVBUEgr?=
 =?utf-8?B?VXNrcm9wMWdmWUh5YjFlMTFESm5IUFhSQ3ZZMjMwOXhHdEcydGluSENLSU9z?=
 =?utf-8?B?bkVYdFhRZXlwRUlyRFhDNW1mOWlnS00ydG9DeUowNktJcHQ2eUw2cW1oV1hu?=
 =?utf-8?B?bXE1anFBKzhRZkNyVi9YelNBVjJ3SnZnTWtEMkZkeTN2TGo2cm9ZN0FMbExH?=
 =?utf-8?B?T3N0VVZtK3Bpd2g0OGtONi9MRzZvUGdkUmJUZW5EU0lnZHdqQ08rYnlLSkVR?=
 =?utf-8?B?RG5JanFoOFg0aDdVdXZaeDdXS0VRUXkxekVsL3dQakN0L3BrWVQrU2FuWk42?=
 =?utf-8?B?TUZyZTlmZDJjWE94U2RtL3JQNHZrSzdaVFcrZ1lFSkg3dDVQWU1sWG5vNmNq?=
 =?utf-8?B?RDIraXA0MGhkOGlVaHVwNEg5a3FVbXR4OGhYTnQyVnlncGY1Q1puNEU3dS91?=
 =?utf-8?B?eU1mRFFQd251VDNXZ2U2anhtVmw5azZuZW5pTFQ1RnJOUktuTERkaUl6aDQv?=
 =?utf-8?B?ak9PS2NMRElFdFhGcDZVUU5ZOVV3aTZiNEdOM3ErTUkxUUowRXVreXVtVkZH?=
 =?utf-8?B?TUJDdXBFTUw1dTM2UmI2M0xJbmRiTUdWS3hkWmlLaE5qTW9aYzQ5OGU5Ykxw?=
 =?utf-8?Q?co0Izod0h1Km5vBk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <27CA01859ED5F94D8B879AFBEDEEF879@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c1de51-3286-4d66-ddc5-08de88c101a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 09:46:07.0437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gie0TQxhrZjy1V0Kc8JdXxTkykHf2U3jSrdUucjtBtaoT2yLhQfjz2SM18V63yhqBdwyCj7om0FalHFydkiLdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9116
X-purgate-ID: tlsNG-42698a/1774259170-9A2B0112-99D22EB0/0/0
X-purgate-type: clean
X-purgate-size: 3520
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,epam.com:dkim,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8F4762EF4E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8xOS8yNiAyMzoxMSwgU3Rld2FydCBIaWxkZWJyYW5kIHdyb3RlOg0KPiBPbiAzLzkvMjYg
MDc6MDgsIE15a3l0YSBQb3R1cmFpIHdyb3RlOg0KPj4gRnJvbTogU3Rld2FydCBIaWxkZWJyYW5k
IDxzdGV3YXJ0LmhpbGRlYnJhbmRAYW1kLmNvbT4NCj4+DQo+PiBUaGlzIGNvZGUgaXMgZXhwZWN0
ZWQgdG8gb25seSBiZSB1c2VkIGJ5IHByaXZpbGVnZWQgZG9tYWlucywNCj4+IHVucHJpdmlsZWdl
ZCBkb21haW5zIHNob3VsZCBub3QgZ2V0IGFjY2VzcyB0byB0aGUgU1ItSU9WIGNhcGFiaWxpdHku
DQo+Pg0KPj4gSW1wbGVtZW50IFJXIGhhbmRsZXJzIGZvciBQQ0lfU1JJT1ZfQ1RSTCByZWdpc3Rl
ciB0byBkeW5hbWljYWxseQ0KPj4gbWFwL3VubWFwIFZGIEJBUlMuIFJlY2FsY3VsYXRlIEJBUiBz
aXplcyBiZWZvcmUgbWFwcGluZyBWRnMgdG8gYWNjb3VudA0KPj4gZm9yIHBvc3NpYmxlIGNoYW5n
ZXMgaW4gdGhlIHN5c3RlbSBwYWdlIHNpemUgcmVnaXN0ZXIuDQo+Pg0KPj4gQWxsb3cgZm9yY2lu
ZyB2cGNpX21vZGlmeV9iYXJzIHRvIG5vdCBkZWZlciB0aGUgYWN0dWFsIG1hcHBpbmcgY2hhbmdl
cywNCj4gDQo+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBzdWl0YWJsZS4gV2UgcGVyZm9ybSB0aGUg
cDJtIG9wZXJhdGlvbnMgaW4gYSBkZWZlcnJlZA0KPiBjb250ZXh0IGJlY2F1c2UgdGhleSBtYXkg
dGFrZSBhIGxvbmcgdGltZS4gQW5kIHNpbmNlIHRoZXkgbWF5IHRha2UgYSBsb25nIHRpbWUsDQo+
IHRoZSBsb2dpYyBpcyBpbnRlcnJ1cHRpYmxlOiBpbiBtYXBfcmFuZ2UoKSwgd2UgcGVyZm9ybSBh
IGdlbmVyYWxfcHJlZW1wdF9jaGVjaygpDQo+IGFuZCByZXR1cm4gLUVSRVNUQVJUIHNvIHRoYXQg
d2UgZ2l2ZSBhIGNoYW5jZSBmb3Igb3RoZXIgcGVuZGluZyB3b3JrIHRvDQo+IGNvbXBsZXRlLCBp
bmNsdWRpbmcgdGhlIHNjaGVkdWxlciBzb2Z0aXJxLiBJZiB2cGNpX3Byb2Nlc3NfcGVuZGluZygp
IHJldHVybnMNCj4gdHJ1ZSwgaXQgd2lsbCBiZSBjYWxsZWQgYWdhaW4gYW5kIGlzIGV4cGVjdGVk
IHRvIHJlc3VtZSB3aGVyZSBpdCBsZWZ0IG9mZi4gVGhlDQo+IHZjcHUgd29uJ3QgY29udGludWUg
dW50aWwgdnBjaV9wcm9jZXNzX3BlbmRpbmcoKSByZXR1cm5zIGZhbHNlLg0KPiANCj4+IHdoaWNo
IGlzIG5lZWRlZCB0byBmaXggdGhlIHNlcXVlbnRpYWwgY2FsbHMgdG8gdnBjaV9tb2RpZnlfYmFy
cyB3aGVuDQo+PiBlbmFibGluZyBWRnMgZnJvbSBEb20wLg0KPiANCj4gSSdtIGd1ZXNzaW5nIHlv
dSByZXNvcnRlZCB0byB0aGlzIGJlY2F1c2UgeW91IG5lZWQgdG8gcGVyZm9ybSBtdWx0aXBsZSBt
YXBwaW5nDQo+IG9wZXJhdGlvbnMsIGJ1dCB0aGUgdlBDSSBkZWZlcnJlZCBtYXBwaW5nIG1lY2hh
bmlzbSBvbmx5IHN1cHBvcnRzIGEgc2luZ2xlDQo+IG9wZXJhdGlvbj8gSWYgc28sIHRoaXMgaXMg
YW4gaXNzdWUgSSd2ZSBiZWVuIGF0dGVtcHRpbmcgdG8gcmVzb2x2ZSBmb3Igc29tZSB0aW1lDQo+
IHdpdGggdGhlIEJBUi13cml0ZS13aXRoLW1lbW9yeS1kZWNvZGluZy1lbmFibGVkIHNlcmllcyBb
MV0uIEluIHRoYXQgc2VyaWVzIEknbQ0KPiB3b3JraW5nIG9uIGludHJvZHVjaW5nIHRoZSBhYmls
aXR5IHBlcmZvcm0gbXVsdGlwbGUgbWFwcGluZyBvcGVyYXRpb25zLiBJJ20NCj4gYWxtb3N0IHJl
YWR5IHRvIHNlbmQgdjMgb2YgdGhlIEJBUi13cml0ZS13aXRoLW1lbW9yeS1kZWNvZGluZy1lbmFi
bGVkIHNlcmllcywNCj4gYW5kIEkgaG9wZSB5b3UgZG9uJ3QgbWluZCB0aGF0IEkgaW5jbHVkZSB5
b3VyIHBhdGNoICgidnBjaTogVXNlIHBlcnZjcHUgcmFuZ2VzDQo+IGZvciBCQVIgbWFwcGluZyIp
LiBZb3UgbWF5IGNvbnNpZGVyIHRoZSBwb3NzaWJpbGl0eSBvZiBiYXNpbmcgU1ItSU9WIG9uIHRo
aXMNCj4gd29yayBpZiBzdWl0YWJsZS4NCj4gDQo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy94ZW4tZGV2ZWwvMjAyNTA3MjMxNjM3NDQuMTMwOTUtMS1zdGV3YXJ0LmhpbGRlYnJhbmRAYW1k
LmNvbS9ULyN0DQo+IA0KDQpJ4oCZdmUgbG9va2VkIGF0IHlvdXIgY2hhbmdlcywgYnV0IHRoZXJl
IHNlZW1zIHRvIGJlIGEgcHVzaCBhZ2FpbnN0IA0KZHluYW1pY2FsbHkgYWxsb2NhdGluZyB0YXNr
cywgd2hpY2ggd291bGQgbm90IHdvcmsgd2l0aCBTUi1JT1YsIG9yIA0KcmVxdWlyZSBhIGxvdCBv
ZiB0YXNrIHN0cnVjdHMgdG8gYmUgcHJlYWxsb2NhdGVkIGFuZCB1c2VkIHZlcnkgcmFyZWx5Lg0K
DQo+IFJlZ2FyZGxlc3MsIHVsdGltYXRlbHkgd2UgbmVlZCB0byBmaW5kIGEgd2F5IHRvIHJldHVy
biBmcm9tDQo+IHZwY2lfcHJvY2Vzc19wZW5kaW5nKCkgZHVyaW5nIHRoZSBwb3RlbnRpYWxseSBs
b25nLXJ1bm5pbmcgcDJtIG9wZXJhdGlvbnMuDQo+IEFzIGFuIGFsdGVybmF0aXZlIHN1Z2dlc3Rp
b24sIGNvdWxkIHlvdSByZXR1cm4gZnJvbSBjb250cm9sX3dyaXRlX2NiKCkgYWZ0ZXINCj4gZWFj
aCBjYWxsIHRvIG1hcF92ZnMoKSwgYW5kIHNvbWVob3cgbWFrZSBpdCByZXN1bWUgd2hlcmUgaXQg
bGVmdCBvZmY/DQoNCknigJlsbCB0cnkgdGhpcyBhcHByb2FjaCwgdGhhbmtzLg0KDQotLSANCk15
a3l0YQ==

