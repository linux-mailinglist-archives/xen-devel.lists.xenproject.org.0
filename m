Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sL4FLO/wpmmSagAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 15:32:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EFB1F1840
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 15:32:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244841.1544204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxQm9-0004HI-E8; Tue, 03 Mar 2026 14:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244841.1544204; Tue, 03 Mar 2026 14:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxQm9-0004Ex-BL; Tue, 03 Mar 2026 14:31:05 +0000
Received: by outflank-mailman (input) for mailman id 1244841;
 Tue, 03 Mar 2026 14:31:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dwqp=BD=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vxQm8-0004Er-4l
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 14:31:04 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99a01732-170d-11f1-b164-2bf370ae4941;
 Tue, 03 Mar 2026 15:31:02 +0100 (CET)
Received: from SA3PR03MB7419.namprd03.prod.outlook.com (2603:10b6:806:39c::6)
 by DM6PR03MB5162.namprd03.prod.outlook.com (2603:10b6:5:24a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 14:30:57 +0000
Received: from SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc]) by SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc%6]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 14:30:57 +0000
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
X-Inumbo-ID: 99a01732-170d-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qd6lXoyfWFhzelmtfKUR0zKnWiMAyLFvxUXm381/AjpOkqgPf/wZgybZInGNz0HRWJio1nyjNl/K81xbDva4Mxr+ialCScyx+fU4v5JkVHDOOSY8wfF8MjNTREeq/xXxq9nCuVLRB3fHUAOP4leThJCwaSAI6edjDmMLtKbVYC25lhIuBwb5bZJNz/bFnrbvNwstmmjZ4WMDlBzRQQh3itsIjaYkehsrEdS/xr0Sfj7kFBODG0CXohAC6QoIFgiNUs6EYb0qP+JqFqLouDDjElwlDsMngQ8jovqoDcXt3c9WrFwCWlF9Qvrm43Zga+K+jz5jf++RQnxvxQYxqH/PYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNA/W/W10RAlFstbwozHjga1br7vkdyk0F1vsAPxDBI=;
 b=ZBZZ48hGWjkuvVd3Hn1tG5vPuOJ+qM7Vogl2eKEE6cq6SCyXvELvzANOlPGhUEruJVBSTQbXoA136Cw+K9it/X8V1udzOjw9XCfJixTqmAMyrwqj+t7OurCCiYhRuSu+JkDCNDDkgRaT0l6bhWdNdwdGhMpWLCLWWlwYml37vbzwtg0qrnLQVih0ggxS0IESyxMhDkyS1AwomYc8stCqe1Ctu/zX0iBplBRhH+woPtZ4dRj9/oEJaevplbiLwOLkZ42XNU1rxOU4FdvWi0vlzDf6Q7NUEKLDhlgB7T+ONCAbLGKW5OmJUCrZHE4MY9C+NA5QwtUw8SlSMDynBSdakg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNA/W/W10RAlFstbwozHjga1br7vkdyk0F1vsAPxDBI=;
 b=XgzCocSCK4Y6ukfRuzcdvbWOhjNs2Qdzlt8Gu0DkbjkHzgJGU0srMt75HZHESDSP1BRiEp9ffaMyenobq2PDEojhUDwsILv/QdBVzD9ncJnfTPvb0QwnKA5iY3YNy9tGsMpQIyCbFejnm80F0ORnSd3SnYSu5/cTMil52oMxtF0=
From: Edwin Torok <edwin.torok@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/4] tools/tests/x86_emulator: fix undefined behaviour
 in shift
Thread-Topic: [PATCH v2 3/4] tools/tests/x86_emulator: fix undefined behaviour
 in shift
Thread-Index: AQHcp9gCO67+yoRhk0SyNFZDTeRIWLWc3oEAgAAAhQCAAAXugA==
Date: Tue, 3 Mar 2026 14:30:57 +0000
Message-ID: <28F6CC85-F12E-4C13-B432-EBC6A0D21CCD@citrix.com>
References: <cover.1772189234.git.edwin.torok@citrix.com>
 <cdd62288eed6b147e6c3e6d2c402de36cf3ce42a.1772189234.git.edwin.torok@citrix.com>
 <02d59353-8d59-4151-8428-dd6458f9165b@suse.com>
 <803004bf-ab0b-412e-9892-e22db70e918d@suse.com>
In-Reply-To: <803004bf-ab0b-412e-9892-e22db70e918d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR03MB7419:EE_|DM6PR03MB5162:EE_
x-ms-office365-filtering-correlation-id: bf9cca10-afad-4f09-9685-08de79317bce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 6Lljb9aDSaAyyOxIMva/hhtrlSC7FTVRnjXZhXmUOVufi3J9eI73+ZkCxTt2RCCsE8YafKP60WTMlS2j2IjfNgLS/1qq20xDYGAr/Uh0XHAoMT1DJr2m2fFre7hxKcRqLqE/tf0pAue2UYcvY2eI/2FqrnH/xjfP9tvVfx9na0QoK8DBFQ9x4FrHDxxgWoQuwumXI48u3bkdYBr7eB0KYQViWl9ascVA0sQR+cu8hgx2jfq4RAm9bZdhrI7dFiVNBRbacQU48LXSs43bo0MfOlDrmERuYtiGMZ0QNiPCHY2ourmQsvhyx3X8qXYZoUN/Ble87WxWny0uTdyGyijw1Y0wBJbuqfyqzsjbAFTcqynzTZW5sRBzlvVEvugaMKiQ2+2CBII5z8cbRbsjvNja6UuR23b/k0/e1zYGfcxEvPf3pYQDkei1JnjHSBKWTLV0CQd/5lqB+MU7J/Lvf7EC3o5N/qaMnz/Y8RwqNbpTXMqXPRip9owiN+crTHP0pgKCXG+sTIsJsRIKCwtt7VLCp7gWz3Cy4fvH56X49WiuwB5e2VlvMRiaH1KhdACb5rQoiknjNJxXsJUwZqaWsb5SECAWQQgEt/qyWQLc4591MAGvc6Ac+eRJzMHlgH7DczOftXdCcK1KEs0GiCl1ynTMxwlbRacHswHgLJ/X7+v1p0z9uxbcr+16DALnlCV+iDVP7Px16/PQdFyiGfOkXKm20h+02ZiZlDMVHtprW+OE99zjLZ38Ta4dkJZ70YI9gMRfSyr0NOCYLZTs8G4ijpfvMSXTWuRxJ5Lq3JUzh2D2rIk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR03MB7419.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NFhPNUdpa2FkWWNMREYyVWZzbnA4UEgwU0FKTVRwaXZMMStGTFE1WGpDTDVU?=
 =?utf-8?B?UUFRNUZGOWcyTlVwK0ZrZjVvdnUrTnF4Zm9XRmVhQzY3UXN1SUZibHJHclpt?=
 =?utf-8?B?S2dXMHNFeVZGcThyVGNUengyTkNWWFlwU3gyZ2UxTTA1ZVN2WnlRVzM2SnNF?=
 =?utf-8?B?cEQ0VjQzKzB4Tm9YM3FuSFZCRGRYaXFLTHQydEFYbVBlMVBONS9pdi9nK2Vx?=
 =?utf-8?B?OWhSRTZXVmtwUG9hekc1Yi8xUGU0NVRxMm5VYTZrazlRcWplZ3l6SXRlRzZR?=
 =?utf-8?B?OVpEVGlmU2RJN1J0ZUJRcjJZL3EzdlJMbGt5dkNrTTh5UUlRTkN2YnIyWDRV?=
 =?utf-8?B?NUllS1duM3NsOU5BS3Z2NU1ucGVZeHRNNnFwRFFibCttWTc5cTE5MDFMRmRj?=
 =?utf-8?B?VDRMTzVYVDdPZ1B3WkVkT0h4UkpOOU1BbmFwY3g2bWFWMXBsdkcvemhrRit3?=
 =?utf-8?B?Z2hGT202UVJvME1WTFMxZFNmSjlRUFBZVE54MmIyUHJGVEE4TmVFRlZYSGY2?=
 =?utf-8?B?WU1lZWdubytQblhjODBtVkpjMFJ1eUlmYnZDM25TdjJIQUVKaGRjRFUvSnpL?=
 =?utf-8?B?L1U0L2VYV0ZUczhNTko0TldLMkNNTUlnbFpqQWxIeGNWajFUSTJGLzhnVC85?=
 =?utf-8?B?a3RsaDR0cjdqd20rR0hPbk5tVzA3b2lLekZWM1NLUC9mRGNGWWpZdFZPTmdZ?=
 =?utf-8?B?bzNJZS9WM0ZxU2cyTjVtRmhNZnQvbVpXSWRGK3l1a0NsODZteE94VFlIUlc2?=
 =?utf-8?B?cFFJdE05eWNMR0JGOVZReEc5NEhmWWhMS0dJMjZndGM4b2V0b0dlUHVkc2hp?=
 =?utf-8?B?dXRMbm91REdFenZxc0dlbDlYZGFGVXNSMmFoN1dhZzJhSk1CS1pkYytzeDB3?=
 =?utf-8?B?UXlsK0dvVkswSWZ0eE9CL0N5dDVOL3FkcFZZWllvS0pFUkI0VkRZTzFYTFR2?=
 =?utf-8?B?cmsxaTZTTzNQd2lNbzIrTzk1djB5QnBUbS9DNEpRdTBSWWtNUmpnNzhLRlpT?=
 =?utf-8?B?LzA1aTJkRy9jN3QxbkNWQUlyN3FpNkZDL2Q1YjZoK3hkY1dadHdwY2FKRVpw?=
 =?utf-8?B?U0gxQy9oMGFJaXhsVUVpSTZCYStod0tNR1lSdXlnZ2lpOU54bTY1RDhkeEk5?=
 =?utf-8?B?aGxheWlQQndFc3BTcHMzRmIwdFd3bkFSclF1dXV2c3VEbW5vSXBiaHU3NXNr?=
 =?utf-8?B?N1YwOHJ5UlVvWENsaGs3aW9MZFYyWndHYXBIYnNEV1F5ck5aY0pYWkRRaGR3?=
 =?utf-8?B?b0J0YUc4UjBDaDl2UlhINzBMUFM3czd2SnJQdEtubGZRVWs0QjZIV0dhb090?=
 =?utf-8?B?a2d4dFRyeTR3M1FwUDEyd0FzemxHQXQzU0E1ZjdFTFlYYkFRU2tRSDkvY1Zr?=
 =?utf-8?B?MUw5N283eU1RZ0JQYWxmTlZiWlc3ZVAra1IzeEhzc055aGRZVUd4akgybXFs?=
 =?utf-8?B?QlJjZWppTTFJUHJDcnU3NE5Gd0htTlNrL0JZd0ZpOGxVZWYwQWorNVdEZGk1?=
 =?utf-8?B?TGladzU1djl2eHpkUUlWcGRWTldKRzBwTGZrd3FvWkNTaVhvQ1hNcFdGZFQ1?=
 =?utf-8?B?MGE2LzZvU0R2Z2NabmlMWG4rakYvQ1ZaZzViNkdOaTM0bkdra0xHSWIwencz?=
 =?utf-8?B?ZFNWVldIaHBra1hQVm1kLytSY1N0VStFYXVjTlMydThWSjVtRit1aE5pRmxh?=
 =?utf-8?B?a2NrNjNGeUlvY291T2tYVWQ0UWpGZXIvTisxSzlhQjYrdjBwNkxXbHExNGhv?=
 =?utf-8?B?cFN6ckNxTkdVNzBhY3BISENYN2VON1AxOHdjN3Nad09ITlhLYk1VNXIxRHR2?=
 =?utf-8?B?bGtQRkJ6MmpWblhTTWRZRHJFTXc3VG1pcE52S0tvaG82RUk5ZC9qUmdKVnE0?=
 =?utf-8?B?SU16TUxUWkJENlJmVlZJRmwva1I2R1FmdjFXNW5iUERPZHQvY1BHUzlnQnl2?=
 =?utf-8?B?NW5PMWZ5K3djK1dXNmZmK3hMM2ltVHdhS001TDRCaW1UWlhuWUovblkybjdJ?=
 =?utf-8?B?Wlp2cXNBRk9FVFJNNENHUzhyQzFjOXlnRnl3V2J4VTdyY2VlVUxnbzE2Nk0y?=
 =?utf-8?B?TUZpR1hpWnlTbTd5VVQ4TUkzWGJNYTlqT2J1RmkxQmptSnNCZ1AzL3BOUk5D?=
 =?utf-8?B?TmlkM052SnpXU1U5SmJtd2d2NGFFTCtvb0FyZ2dlWUdITUtuRGlURGdCelZI?=
 =?utf-8?B?d25INWFFY2h0OWk3SDVDUVJMVmdQN2hNRlZQWkR6N25sU0dJbWl6OHpkcVIy?=
 =?utf-8?B?ODY4VnVWSGpIOWs1L0lKc0YyK3pCOVd4bWhsSlIyM1VOK2J3L1FkYVhtV1ZN?=
 =?utf-8?B?R2xORGFwRytsMXZFY1ZwWEFUZlFNUFoyREZSeHRtNlh5aTVTQ2M1OXpwK0pD?=
 =?utf-8?Q?/aGDlEfxhsd8Ejmo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <497A62DE0D27BE4DABB223FE2F2B30BB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR03MB7419.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9cca10-afad-4f09-9685-08de79317bce
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 14:30:57.0647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TXsf9+v0p3RIxAabjCWvq1yNc2eRUUcETu0pLvHtrSuX0tAmDnqSa3cHtdDCw+I1MKk1pVhweFlCELWpHRBXXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5162
X-Rspamd-Queue-Id: 24EFB1F1840
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	APPLE_MAILER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

DQoNCj4gT24gMyBNYXIgMjAyNiwgYXQgMTQ6MDksIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwMy4wMy4yMDI2IDE1OjA3LCBKYW4gQmV1bGljaCB3cm90
ZToNCj4+IE9uIDI3LjAyLjIwMjYgMTE6NTgsIEVkd2luIFTDtnLDtmsgd3JvdGU6DQo+Pj4gLS0t
IGEvdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL3Rlc3RfeDg2X2VtdWxhdG9yLmMNCj4+PiArKysg
Yi90b29scy90ZXN0cy94ODZfZW11bGF0b3IvdGVzdF94ODZfZW11bGF0b3IuYw0KPj4+IEBAIC0x
MTAwLDcgKzExMDAsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpDQo+Pj4gICAg
IHJlZ3MuZWRpICAgID0gKHVuc2lnbmVkIGxvbmcpcmVzOw0KPj4+ICAgICByYyA9IHg4Nl9lbXVs
YXRlKCZjdHh0LCAmZW11bG9wcyk7DQo+Pj4gICAgIGlmICggKHJjICE9IFg4NkVNVUxfT0tBWSkg
fHwNCj4+PiAtICAgICAgICAgKCpyZXMgIT0gKCgweDIyMzM0NDVGIDw8IDIpIHwgMikpIHx8DQo+
Pj4gKyAgICAgICAgICgqcmVzICE9ICgoMHgyMjMzNDQ1RlVMIDw8IDIpIHwgMikpIHx8DQo+PiAN
Cj4+IFdoeSB0aGUgTCB3aGVuIHJlcyBpcyBhbiBhcnJheSBvZiB1bnNpZ25lZCBpbnQ/IFdpdGgg
aXQgZHJvcHBlZCAoaGFwcHkNCj4+IHRvIGRvIHNvIHdoaWxlIGNvbW1pdHRpbmcpOg0KPj4gQWNr
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gDQo+IEkgc2hvdWxkIHBy
b2JhYmx5IGFkZCB0aGF0IG5ldmVydGhlbGVzcyBpdCdzIG5vdCBxdWl0ZSBjbGVhciB0byBtZSB3
aGF0IHVzZSBpdA0KPiBpcyB0byBjb21waWxlIHRoZSBoYXJuZXNzIHNvdXJjZSBpdHNlbGYgd2l0
aCBzYW5pdGl6ZXIgb3B0aW9ucy4NCg0KDQpJIHdhcyB0cnlpbmcgdG8gc2VlIHdoeSB0aGUgdGVz
dHMgd2VyZSBmYWlsaW5nIHdpdGggY2xhbmcsIGJ1dCBub3QgR0NDLg0KVGhhdCBjb3VsZCBhbHNv
IGJlIGJlY2F1c2UgY2xhbmcgdGFrZXMgZGlmZmVyZW50IChvcHRpbWlzYXRpb24pIGRlY2lzaW9u
cyBvbiBob3cgdG8gaGFuZGxlIHVuZGVmaW5lZCBiZWhhdmlvdXIuDQpJdCB0dXJuZWQgb3V0IHRo
YXQgdW5kZWZpbmVkIGJlaGF2aW91ciB3YXNu4oCZdCB0aGUgcmVhc29uIHRoZSByZXN1bHRzIHdl
cmUgZGlmZmVyZW50LCBidXQgSSBzZW50IHNvbWUgcGF0Y2hlcyB0byBmaXgNCnNvbWUgb2YgdGhl
IChjdXJyZW50bHkgbGF0ZW50KSBidWdzIGl0IHVuY292ZXJlZC4NCg0KPiBJIGNhbiBzZWUgdGhh
dA0KPiB0byBiZSB1c2VmdWwgZm9yIHRoZSBjb3JlIGVtdWxhdG9yIGZpbGVzIGNvbXBpbGVkIGlu
dG8gdGhlIGhhcm5lc3MgYmluYXJ5Lg0KPiANCg0KRm9yIHNhbml0aXNlcnMgbGlrZSB0aGUgbWVt
b3J5IHNhbml0aXNlcnMgKHdoaWNoIGRldGVjdHMgcmVhZHMgZnJvbSB1bmluaXRpYWxpemVkIHZh
bHVlcykgSSB0aGluayBpdCBpcyBiZXN0IHRvIGhhdmUgdGhlIHdob2xlIHByb2dyYW0gY29tcGls
ZWQgd2l0aCBpdA0KKHRoZSB1bmluaXRpYWxpc2VkIHZhbHVlIGNvdWxkIG9yaWdpbmF0ZSBpbiBh
IGRpZmZlcmVudCBmaWxlKS4gT3IgYXQgbGVhc3QgYXMgZmFyIGFzIHJlYXNvbmFibGUgKEnigJlt
IG5vdCByZWJ1aWxkaW5nIGxpYmMpLg0KQnV0IGV2ZW4gZm9yIHRoZSBhZGRyZXNzIHNhbml0aXNl
ciBhIGJ1ZmZlciBjb3VsZCBiZSBhbGxvY2F0ZWQgKGUuZy4gb24gdGhlIHN0YWNrKSBpbiBhIGRp
ZmZlcmVudCBmaWxlIHRoYW4gd2hlcmUgdGhlIGJ1ZyBpcy4NCg0KDQpCZXN0IHJlZ2FyZHMsDQri
gJRFZHdpbg0KDQo=

