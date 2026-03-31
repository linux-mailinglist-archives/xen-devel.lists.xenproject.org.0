Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iD16KfaFy2l4IgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:29:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA2F36621D
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:29:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268734.1557951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UTQ-0002Oe-1R; Tue, 31 Mar 2026 08:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268734.1557951; Tue, 31 Mar 2026 08:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UTP-0002Lb-Uo; Tue, 31 Mar 2026 08:29:19 +0000
Received: by outflank-mailman (input) for mailman id 1268734;
 Tue, 31 Mar 2026 08:29:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <edwin.torok@citrix.com>) id 1w7UTO-0002LT-HS
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 08:29:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7UTN-006WKY-TV
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 10:29:17 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <edwin.torok@citrix.com>)
 id 69cb85dd-5cb7-0a2a0a5109dd-0a2a4507a18e-0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:29:17 +0200
Received: from [40.93.196.14]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <edwin.torok@citrix.com>)
 id 69cb85da-fd74-0a2a45070019-285dc40e814a-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:29:17 +0200
Received: from LV8PR03MB7422.namprd03.prod.outlook.com (2603:10b6:408:186::13)
 by SN7PR03MB7130.namprd03.prod.outlook.com (2603:10b6:806:32c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 08:29:12 +0000
Received: from LV8PR03MB7422.namprd03.prod.outlook.com
 ([fe80::2fda:1b59:40a8:fe4f]) by LV8PR03MB7422.namprd03.prod.outlook.com
 ([fe80::2fda:1b59:40a8:fe4f%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 08:29:12 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWezLmhSTk3xkx465wpON0+/Chxd+3VdVvIQn0kyl3+FgXcojZEyGAj4adnXvjvhSWCrrFOHy+OhfQ9C+8/q/PkBDU7XWwFmIrQkjMChI3rzdB8BC/uMK/dfAUeq6nRDcpPkbFpab/IBp7rdKdeQ81GyiKNRp6bicBBbyxWaJ/HSIgEKExwuhss6l/2eF1tH3r3l+0B54VJKMiIsUW/FEXZO5JNYf0rbJ6QsYBp8ZrRCMy+V9EnKK+T/0UoqmL5dY/q1yTQ6Kt23XvOFnlBph0jDekwIvqi/uCJTsbvnBqhMKPe/QKRO+EB1TVkw9GoG7rx/kqf3pVp1toO6KSqAFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5CgmOt4hNb5k5yIEzDjcG7+blEa41+bIyy12cG/PaY=;
 b=UZL+3F0L7H6S3s0wfUVivAffZXxyJdIoqwD+kniFnw3ibuPjJ3VbqpfBQD75QmxYxj3mGpd3Fy+7WsUEMcYzX7XuDqM7q/XCXlfnFaGIffDNrSHjyDLvREcQvfWL4Ddk8sZHgLp6pSmV4L/DgtClOCl4pOvJz0xZ1XVebOvrwjIHVOlFbRkAJAAM4kTMmeMFPGiYtyR2mTOQuDJK5cm4rdDx/xkmCs9/0T/8pcHBWtL0p9WJrT+nocFTrS6bFUh7IpPsS4TSUX2aJG5kzVdpdPN01eflmSKEbjRY4XRiDBA8rh+ZkZ07mT8nhy5pPinrAlJXjZ42qH3xVl+xUNnkuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5CgmOt4hNb5k5yIEzDjcG7+blEa41+bIyy12cG/PaY=;
 b=RCfSm1AyweBQhOZa0lm8prDcRhOXjjuRG0qrQFxLtKXhiPSbbyA6mRa6ey8WfyOBT/PJCwYU/Ruvkp3Rnnts7eQn/66TK4tkh0vV01O1+UBX/zeBwdlzJlaePZhggFd5SMtKunxbyCNWOWAxBzMoa908eRBPiz4SQRSMyi41MLE=
From: Edwin Torok <edwin.torok@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 2/5] CI: drop Ubuntu 16.04
Thread-Topic: [PATCH v1 2/5] CI: drop Ubuntu 16.04
Thread-Index: AQHcwGC+DQyaEB1zLUaIAlfbsyKd+7XINvGAgAAZKoA=
Date: Tue, 31 Mar 2026 08:29:12 +0000
Message-ID: <F51598F5-FFC7-49A5-9BF1-4AAC004036F1@citrix.com>
References: <cover.1774886602.git.edwin.torok@citrix.com>
 <587eb0701db6e5852e9628d0cb9db90250424c4a.1774886602.git.edwin.torok@citrix.com>
 <a49f9840-7b8b-46a1-b171-ad0e81da7455@suse.com>
In-Reply-To: <a49f9840-7b8b-46a1-b171-ad0e81da7455@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR03MB7422:EE_|SN7PR03MB7130:EE_
x-ms-office365-filtering-correlation-id: cd3bf23b-6e60-4561-66b4-08de8eff9654
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 jEb6stoVMGb95g1GxKZoG97Q6vIaP6cH+aOgnliRXMu962RR/Q/wlAQmrtzF9FEe440mdQfWqUl5CcWwhW1TCclt/p93pYIOH+LBSkt2LUGhvra+km3N9nDxcMkT70WnpAX6mnvnEmcCXWMMIEYPqIYBknENt4f8ClP+19dNibYrQt0UgsLchzkVx4rMsHX/peU8KI/GAAO1jTM1YYijPgcVNdMwaoWBQ6ZRt0PPB+1Kk6jQKJuKy/1f5LUdH+sNOAxpyfw31JDj/YhU5Pgu064K2HtDJi2sOwvoCQNZsisPRyy8MgdKyLGGpL4scjVj1UOimm69byK+VK/XL/BsqNqjL73inkYHeHszoV/XceAIM27v3/w159yL7ln0hokmSgKdes0kb4Lz7TzxU5SJ2mT217BKfFvXSJh7Ee7RhPX5IeFLRZWkRpoagcky+sjdzn73bzB1MEJF0gh06CJ6GxaTZaS8xwgGBhwuG+iZFQDYYKj5HPQHBUQ7d+21aJaiXkhHJRp+AYfjOvQRHR/e384/fJ+6mSwOOvqG737qfEZYAxRtT4nzVYXIYKfqqAqBni6oDRpXMpcW1I6gKx7AGdUsqiXHOq+Jc6LgyT3mgenTxY0Cyauldsw0+UKMsHxK6kquByAZVE6zKxy4PMrIeWhItru/Eh4257fcm4XHMhKYONqWNnGbauVFONuq/MHdT1XpWLHjhPiHhexFWZmQD0A3Ea/JX4bLD6iQ8eQ/RsFDJBxpclp9YeExP/4lxEV2R+fQkijVtX69+HjHGwNgwuJwO6o2Qms3EaHa2zynymKi2LnWbJF5T8MJJsC3BCNz
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR03MB7422.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RVN1WU5zWXM4R3ZUb3cycW9WRUxoU1BvZGNQcm9IM25ZTHlqV2lrdXdkMmV4?=
 =?utf-8?B?NWRjTTNrNG44WXFKbHRjY1M3RFQ4RG9Lc0JBQXNuUmowNFVOYTlSOFBZbGZu?=
 =?utf-8?B?cm5jZFJKc04xUit3TFRmcjJTRnQrcmhHT3lhWnliSk5zeDVxM1ZTV0NhZEcr?=
 =?utf-8?B?RXZTcEd3cWZPTU1HWC9sTGxNbnRaRDlCTHErYXBYVDdkNEZZSlVKaUZ4TllT?=
 =?utf-8?B?ZGlnRlozQXFrSTlHSTBEa2VoYWxjVGpjTDM2bzRaOFpoNC9jWnR0SDBHcHNE?=
 =?utf-8?B?WVhqYk1FU2xlUFBjZ3FFN2tXcW05R2IyS3ozUmpQUFJqMFFaWnV3MVBJMURL?=
 =?utf-8?B?UnllZFA0bEZSU1FheTNOMGVEc2M0TFZCeEE4aGZ1Y2FZTzZxNGVZVzRpZDEz?=
 =?utf-8?B?WWhMRTZvSHMrSzM1ZVVScjdiY2tJTGszUUEwSWM0SzFLd2hQcEQwc3dGMkIz?=
 =?utf-8?B?cjhXdlRQQUpZYlptYzlDa0kyOUVjek5XeFJRalQrTm5RWU43UDFXVUQvTUR5?=
 =?utf-8?B?VDVvdEFqT0dVcnFQTTY2cEI3WTBXWW0zQ0hPSDZjWE1WUFVIbjY1enM0TGtt?=
 =?utf-8?B?aXhaT2ZPZU9OR2pacUpVNjBHS0Nxd2djUFczZ2h2SFlSQmE5SEVJTHRwdTNY?=
 =?utf-8?B?bmVPNEVaK0k1Zis1NjYvSjlrcUZHK3l6R1doaThMb3Q5bWF6dFJmWXpUV0M0?=
 =?utf-8?B?VmlXSkJxMlRJQW5kTXVWcjRuL0R0ZHh4TUREcjliaDErUUJjQjNMNXlOZXRI?=
 =?utf-8?B?ckpZTitTTC8rRDFKWnpobnZBZ1RVYWhwUmtpbGI0dWNrNElwTTJxekt6RmYz?=
 =?utf-8?B?a3VZd05XOGZpVG5WNUlJV0RiZDltZUJWNHdkaCs4Q3NyWDNVNzA3ZEZZeXVF?=
 =?utf-8?B?d2hycDdUOEdVbERoUDgyUWgxTGFmb1huRlZIZkZySUxNVnhRa2NBVVVranJh?=
 =?utf-8?B?TEpHeVBkalcrU25QSDV3QmMvdTF2am9HaFdjOTZrYjhwU0crZEtabzRSNGVv?=
 =?utf-8?B?ZkxLVGpWUHZzMU90Z0hIM0ZMSmJFUFh1aFlVcG9XZFJqTUpqNDZHVHBDdE0w?=
 =?utf-8?B?VG5JNXVuVFR1ZDBldXlaR2tuVTVaSVdZSEtTT3FFbytFcTJLSGhzcEw1ZEhH?=
 =?utf-8?B?bG1jRS8xc0VFNVY3dW5qTVBCSlUvR0M2OWxRaklTTEIzL0lFUUZJNkVtbXNr?=
 =?utf-8?B?V3BjN0Z4TDhuZGJxS3RFeDFwcE5XbzhBbTBHc2s3ZlFWcnpyem4zZ05SSWQ1?=
 =?utf-8?B?TGVic2JXUFBzbFFRRGlqU3RGQ294c2hCT3ljaHROSDNBanpiVG5aZWVZRy9w?=
 =?utf-8?B?ZGpHbjY1dlRRWkhsOVZ4WTUwMTRwdEZoby9vMFFUU05aTS9nMktOS3pSZ2la?=
 =?utf-8?B?d25xRGgzNk1BcE9sazVpR2hMbjVOZVJOWGFEY2h1TExYczNIMmYrTzl3bjl1?=
 =?utf-8?B?VXB1RHBRS2FNTnE2S09mUktCV3JGcWdoejNJU3JOZWdONXBibHhnMWZIZXc2?=
 =?utf-8?B?Q0gzanlvbGVsby9odUtJOEcwN015NGNtMkNwL2xLMTZqRithSnVLOEovZDBV?=
 =?utf-8?B?MXJCcWJ6bHV1N1lnZExROXFsVW0yTXBpSm1UclYraUZWaWV2YlBxbEJUZkg0?=
 =?utf-8?B?dlozVE4vUE1sd0pHZE5aZVZONGo2UUhody9XSGlucFJ1MStQMlV1cXJtc1Vo?=
 =?utf-8?B?cVI1Q0ZzSjB5QlZzT1VLVm5VTzZ1T0pCZXEwcWcxY0pXcjFFV0psTkZDeXRF?=
 =?utf-8?B?K0tnN1p6U2pJalBhd2Z1R3hTU1VBZHFPNDE4R3FsV1duRUpXS2E0MTl3WENt?=
 =?utf-8?B?MTh0WExTZjEvSU1INGhSTVQrU0hLZUdpVS84QmRuYmVkMGJNdXJUUkx6WFVw?=
 =?utf-8?B?QmJ2SEZUK0pmUVo0djVnTG5VTkJXVUhqT1dBZkc3ZXhJbG0wOCtJNDRRZytC?=
 =?utf-8?B?Y09lRFRrdlN5Z3lNWjNCVi9IMUJRNDBrbXoyZjBaTk5VZFdqQlJtUHlXenp2?=
 =?utf-8?B?OXo4TXJXR2ZDNDl4Z2IxaWl2RkNIc0FTVXhwSDdKYi9TaEs3czNXWkFldllw?=
 =?utf-8?B?SFdwSm9IampORUpjYUJkN3RKQzA2aEJRQzEvS2IwSXdBMEs3TjFPVHNaYUNa?=
 =?utf-8?B?SysxaFZOY1VuU2xremdEYVozWVZKZUJrYVJ0OHlySllGL29SSjVKYkNUNmJa?=
 =?utf-8?B?dFZUUDFSS0Iva1J4QVY1eGhtcGIwWk9GbEpabGV4Y3NIeVhOeXFvWENXbE9P?=
 =?utf-8?B?c0ZVNUF5RjEwVjRsenlYaVJHaDZmMkl5aXdGSXRQM3hhelkvK2ZtU2F5WlVH?=
 =?utf-8?B?dXlnNENhTWNZWi9NTDhVejc4d3NTaUIwd1M5L1FTdkFCU3d6K1ZLdjBzYlRO?=
 =?utf-8?Q?iN8ado54xS0nQRuA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C5DCF010C80164DBF1B196A477DC2B4@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR03MB7422.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3bf23b-6e60-4561-66b4-08de8eff9654
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 08:29:12.2571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LRMdhJq3nA1+fBl/SPy/qJMkTYmLCkp61q5jan5HqgxKB7cJcx+ClFXFajVMaOjvD8RjlC+EHT7PatkODs4fcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7130
X-purgate-ID: tlsNG-ef75cf/1774945757-548BC303-CA02BAEF/0/0
X-purgate-type: clean
X-purgate-size: 6020
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:mid,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	APPLE_MAILER(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EBA2F36621D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQoNCj4gT24gMzEgTWFyIDIwMjYsIGF0IDA3OjU4LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMzAuMDMuMjAyNiAxODoxNywgRWR3aW4gVMO2csO2ayB3
cm90ZToNCj4+IFVidW50dSAxNi4wNCBpcyBFb0wgb24gMjAyNi0wNC0wMi4NCj4gDQo+IEl0IGdv
aW5nIEVPTCB2ZXJ5IHNvb24gaXMgYSBnb29kIHJlYXNvbjsgaXQgY2F1c2luZyAuLi4NCj4gDQo+
PiBJdCBmYWlscyB0byBidWlsZCB0aGUgZW11bGF0b3IgdGVzdHMsIHByb2JhYmx5IGR1ZSB0byBh
IGJpbnV0aWxzIHRoYXQgaXMgdG9vIG9sZDoNCj4+IA0KPj4gYGBgDQo+PiBnY2MgLW0zMiAtbWFy
Y2g9aTY4NiAtREJVSUxEX0lEIC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1zdGQ9Z251OTkgLVdhbGwg
LVdzdHJpY3QtcHJvdG90eXBlcyAtV25vLXVudXNlZC1idXQtc2V0LXZhcmlhYmxlIC1Xbm8tdW51
c2VkLWxvY2FsLXR5cGVkZWZzIC1XZXJyb3IgLU8yIC1mb21pdC1mcmFtZS1wb2ludGVyIC1EX19Y
RU5fSU5URVJGQUNFX1ZFUlNJT05fXz1fX1hFTl9MQVRFU1RfSU5URVJGQUNFX1ZFUlNJT05fXyAt
RF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAtbW5vLXRscy1kaXJlY3Qt
c2VnLXJlZnMgLWZuby1waWUgLWZuby1leGNlcHRpb25zIC1mbm8tYXN5bmNocm9ub3VzLXVud2lu
ZC10YWJsZXMgLWZmcmVlc3RhbmRpbmcgLW5vc3RkaW5jIC1JL2J1aWxkcy94ZW4tcHJvamVjdC9w
ZW9wbGUvZWR3aW50b3Jvay94ZW4vdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yLy4uLy4uLy4uL3Rv
b2xzL2Zpcm13YXJlL2luY2x1ZGUgLWZuby1zdGFjay1wcm90ZWN0b3IgLWcwIC1EXzE2IC1tcGNs
bXVsIC1tc3NzZTMgLW1wY2xtdWwgLWZmaXhlZC14bW0wIC1PcyAtRFZFQ19TSVpFPTE2IC1jIHNz
c2UzLXBjbG11bC5jDQo+PiAvdG1wL2NjaGhENm41LnM6IEFzc2VtYmxlciBtZXNzYWdlczoNCj4+
IC90bXAvY2NoaEQ2bjUuczoyMDI6IEVycm9yOiBqdW5rIGF0IGVuZCBvZiBsaW5lLCBmaXJzdCB1
bnJlY29nbml6ZWQgY2hhcmFjdGVyIGlzIGB7Jw0KPj4gL3RtcC9jY2hoRDZuNS5zOjIwMzogRXJy
b3I6IGp1bmsgYXQgZW5kIG9mIGxpbmUsIGZpcnN0IHVucmVjb2duaXplZCBjaGFyYWN0ZXIgaXMg
YHsnDQo+PiAvdG1wL2NjaGhENm41LnM6MjA1OiBFcnJvcjoganVuayBhdCBlbmQgb2YgbGluZSwg
Zmlyc3QgdW5yZWNvZ25pemVkIGNoYXJhY3RlciBpcyBgeycNCj4+IGBgYA0KPiANCj4gLi4uIGJ1
aWxkIGlzc3VlcyBpbiB0aGUgdGVzdCBibG9icyBpc24ndC4gVGhlIGhhcm5lc3MgaXMgc3BlY2lm
aWNhbGx5IGFibGUgdG8NCj4gY29wZSB3aXRoIGJsb2IgYnVpbGQgZmFpbHVyZXMuIEFub3RoZXIg
dGhpbmcgd291bGQgYmUgaWYgdGVzdF94ODZfZW11bGF0b3IuYw0KPiBmYWlsZWQgdG8gYnVpbGQg
KGJ1dCBzZWUgYmVsb3cpLg0KDQpUaGUgd2hvbGUgYnVpbGQgcGlwZWxpbmUgZmFpbGVkLCBtYXli
ZSBJIGV4dHJhY3RlZCB0aGUgd3JvbmcgcGFydCBvZiB0aGUgZXJyb3IgbWVzc2FnZS4NCmh0dHBz
Oi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvZWR3aW50b3Jvay94ZW4vLS9qb2JzLzEz
NjYxMjk2NDkwDQoNClVuZm9ydHVuYXRlbHkgdGhlIG91dHB1dCBpcyB0cnVuY2F0ZWQ6DQpgYGAN
CkpvYidzIGxvZyBleGNlZWRlZCBsaW1pdCBvZiA0MTk0MzA0IGJ5dGVzLg0KSm9iIGV4ZWN1dGlv
biB3aWxsIGNvbnRpbnVlIGJ1dCBubyBtb3JlIG91dHB1dCB3aWxsIGJlIGNvbGxlY3RlZC4NCmBg
YA0KDQpJdCBsb29rcyBsaWtlIEdDQyBhY2NlcHRlZCB0aGUgbWF2eDUxMmRxIGZsYWcsIGJ1dCB0
aGVuIGJpbnV0aWxzIGZhaWxlZCB0byBhc3NlbWJsZSB0aGUgb3V0cHV0Pw0KQWx0aG91Z2ggYXMg
eW91IHNheSBhbm90aGVyIHdheSB0byBhdm9pZCB0aGF0IHdvdWxkIGJlIHRvIGZpeCB0aGUgZ2Fz
IHZlcnNpb24gY2hlY2ssDQptb3JlIG9uIHRoYXQgYmVsb3cuDQoNCj4gDQo+IElzIHRoZSBhYm92
ZSByZXByZXNlbnRhdGl2ZSBvdXRwdXQgYW55d2F5IChpLmUuIGlzIHRoaXMgbm90IHBlcmhhcHMg
aW50ZXJsZWF2ZWQNCj4gb3V0cHV0IGZyb20gYSBwYXJhbGxlbCBidWlsZCk/IHNzc2UzLXBjbG11
bC5jLCBidWlsdCB3aXRoIC1tc3NzZTMgLW1wY2xtdWwgKGkuZS4NCj4gbm8gQVZYNTEyIG9wdGlv
bnMpLCBzaG91bGRuJ3QgcmVhbGx5IGludm9sdmUgYHsnLiBGdXJ0aGVybW9yZSB3ZSBzcGVjaWZp
Y2FsbHkNCj4gaGF2ZSBhIGNoZWNrIGluIHRoZSBNYWtlZmlsZSwgc2tpcHBpbmcgYnVpbGRpbmcg
YWx0b2dldGhlciB3aGVuIGdjYyBhbmQvb3IgZ2FzDQo+IGFyZSB0b28gb2xkLg0KPiANCj4+IFNh
bWUgdGVzdCBwYXNzZXMgb24gVWJ1bnR1IDE4LjA0Lg0KPiANCj4gSGFyZCB0byBiZWxpZXZlIHRo
YXQgdGhlcmUgd291bGRuJ3QgYmUgYXQgbGVhc3Qgc29tZSBmYWlsdXJlcy4gUGVyaGFwcyBzYWlk
DQo+IGNoZWNrIHByZXZlbnRzIHRoZSBhdHRlbXB0IHRvIGJ1aWxkIHRoZSBoYXJuZXNzIHRoZXJl
Pw0KDQpUaGUgcGFzc2luZyBidWlsZCBsb2dzIGFyZSBhdCBodHRwczovL2dpdGxhYi5jb20veGVu
LXByb2plY3QvcGVvcGxlL2Vkd2ludG9yb2sveGVuLy0vam9icy8xMzY2MTI5NjQ5NC92aWV3ZXIN
ClRoZXJlIGFyZSBmYWlsdXJlcyBhYm91dCB1bnJlY29nbmlzZWQgY29tcGlsZXIgZmxhZ3MsIHdo
aWNoIGFyZSBpbmRlZWQgaWdub3JlZDoNCmBgYA0KZ2NjOiBlcnJvcjogdW5yZWNvZ25pemVkIGNv
bW1hbmQgbGluZSBvcHRpb24gJy1tYXZ4NTEyZnAxNic7IGRpZCB5b3UgbWVhbiAnLW1hdng1MTJm
Jz8NCnRlc3RjYXNlLm1rOjE2OiByZWNpcGUgZm9yIHRhcmdldCAnYXZ4NTEyZnAxNi5iaW4nIGZh
aWxlZA0KbWFrZVs3XTogKioqIFthdng1MTJmcDE2LmJpbl0gRXJyb3IgMQ0KYGBgDQoNCj4gDQo+
PiBOb3RlOiB0aGUgbWluaW11bSB2ZXJzaW9uIG9mIGJpbnV0aWxzIG1pZ2h0IGhhdmUgdG8gYmUg
dXBkYXRlZC4NCj4+IFVidW50dSAxNi4wNCBoYWQgdmVyc2lvbiAyLjI2LjEsIHdoaWNoIHNhdGlz
ZmllcyB0aGUgPj0gMi4yNSByZXF1aXJlbWVudA0KPj4gaW4gdGhlIFJFQURNRSwgYW5kIHlldCBp
dCBmYWlsZWQgYXMgc2hvd24gYWJvdmUuDQo+IA0KPiBUaGUgaGFybmVzcyBpcyBzcGVjaWFsLCBh
cyBzYWlkLiBJbW8gd2Ugc2hvdWxkbid0IGJlIHVwZGF0aW5nIHRoZSByZXF1aXJlbWVudHMNCj4g
anVzdCBmb3IgaXQuIElmIGFueXRoaW5nLCB0aGUgbWVudGlvbmVkIGdjYy9nYXMgY2hlY2sgbWF5
IG5lZWQgdXBkYXRpbmcuIHtldmV4fSwNCj4gZm9yIGV4YW1wbGUsIHJlcXVpcmVzIGdhcyAyLjI5
IChpLmUuIGdjYzYgdGltZSBmcmFtZSkuDQoNCkkgdGhpbmsgdGhlIHByb2JsZW0gbWlnaHQgYmUg
dGhhdCB0aGUgY2hlY2tzIGFyZW7igJl0IGRvbmUgZm9yIHRoZSDigJhydW7igJkgdGFyZ2V0ICh3
aGljaCBpcyB3aGF0IEnigJltIGF0dGVtcHRpbmcgdG8gdXNlIGluIHRoZSBDSSk6DQpgYGANCiMg
U3VwcHJlc3MgYnVpbGRpbmcgYnkgZGVmYXVsdCBvZiB0aGUgaGFybmVzcyBpZiB0aGUgY29tcGls
ZXIgY2FuJ3QgZGVhbA0KIyB3aXRoIHNvbWUgb2YgdGhlIGV4dGVuc2lvbnMgdXNlZC4gRG9uJ3Qg
YWx0ZXIgdGhlICJydW4iIHRhcmdldCBkZXBlbmRlbmNpZXMNCiMgdGhvdWdoLCBhcyB0aGlzIHRh
cmdldCBuZWVkcyB0byBiZSBzcGVjaWZpZWQgbWFudWFsbHksIGFuZCB0aGluZ3MgbWF5IHdvcmsN
CiMgcGFydGlhbGx5IGV2ZW4gd2l0aCBvbGRlciBjb21waWxlcnMuDQoNClRBUkdFVC15IDo9ICQo
VEFSR0VUKQ0KDQppZm5lcSAoJChmaWx0ZXItb3V0IHJ1biUgY2xlYW4lIGRpc3RjbGVhbiwkKE1B
S0VDTURHT0FMUykpLCkNCmBgYA0KDQpUaGUgc2ltcGxlc3Qgc29sdXRpb24gaGVyZSB3b3VsZCBi
ZSB0byByZW1vdmUg4oCYcnVuJeKAmSBmcm9tIHRoZSBmaWx0ZXIgcnVsZXMuDQpJZiBpdCBpcyB1
c2VmdWwgSSBjYW4gaW50cm9kdWNlIGFuIGFsaWFzIGZvcmNlLXJ1biwgdGhhdCBjYW4gYmUgdXNl
ZCB0byBtYW51YWxseSB0cnkgdG8gcnVuIGFueXdheSAoYWx0aG91Z2ggdGhhdCBhdHRlbXB0IG1h
eSBpbiB0aGUgZW5kIGZhaWwsIGFzIHdpdGggVWJ1bnR1IDE2LjA0KS4NCldoYXQgZG8geW91IHRo
aW5rPw0KDQpCZXN0IHJlZ2FyZHMsDQrigJRFZHdpbg0KPiBBcyBkb2VzIFZQQ01QRVNUUklRLiBJ
DQo+IHNwZWNpZmljYWxseSBoYXZlIGEgbG9jYWwgcGF0Y2ggdG8gbWFrZSBpdCBwb3NzaWJsZSB0
byBidWlsZCB0aGUgaGFybmVzcyB3aXRoDQo+IHByZS1nY2M3IChJIGRvbid0IGhhdmUgYW55IGdj
YzYgYW55d2hlcmUsIHRvIHRoYXQgYm91bmRhcnkgbWF5IGJlIG9mZiBieSAxKS4gSQ0KPiBkaWRu
J3QgdGhpbmsgdGhpcyBoYWNrZXJ5IHdvdWxkIGJlIGFjY2VwdGFibGUgdXBzdHJlYW0uDQo+IA0K
PiBKYW4NCg0K

