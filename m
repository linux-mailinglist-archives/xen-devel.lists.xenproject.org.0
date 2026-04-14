Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JSxAMAg3mk1ngkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 13:10:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B293F92A5
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 13:10:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281609.1564462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCbf1-0003At-I9; Tue, 14 Apr 2026 11:10:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281609.1564462; Tue, 14 Apr 2026 11:10:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCbf1-00037q-F0; Tue, 14 Apr 2026 11:10:27 +0000
Received: by outflank-mailman (input) for mailman id 1281609;
 Tue, 14 Apr 2026 11:10:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wCbf0-00037k-FV
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 11:10:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCbez-00G8q2-RM
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 13:10:25 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69de209d-5cb7-0a2a0a5109dd-0a2a45098ab4-8
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 13:10:25 +0200
Received: from [52.101.83.106]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69de20a1-bf79-0a2a45090019-3465536a65de-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 13:10:25 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GV1PR03MB8405.eurprd03.prod.outlook.com
 (2603:10a6:150:54::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 11:10:21 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 11:10:21 +0000
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
 b=YQ1aOJRECjA+VYr/t1Y4A5VptQqULxLDcM/v6Qs/Dzv3cfISXcO5FYhPM3rXCqef1V1WeUm6zbh8QgU4NWZR2cjs47tNin5fOAUNZh+MN2RySnoeoU/pq7f6tc8XyivrQsDZCV+QjoB+adFtMR0EVBN6AORYr75Cwjl+XKY5a9kmSrRlkL+HIScncQhwuyC+p2O1K/ekxWtM27g8WUwJyhYwOa/KfIuEhmmsMR6vOPZzP2/ye7a+4PENKeeejNBI3jNg3Ghs9iob2+791GQQ10D3jiPyIJUHqaFKTGS//BKDQXtxW75D14Lcvt2Ze6Fo1KdWzFqj0xM7TbyMKN+GWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScHZun5Ls8cTAvbEzw8uZSH5eJY0bYlpTajuRZ84vIs=;
 b=efIuZvgfDFhd9FWkEHhu3OyDYG9SiWSStK2GtGoYMpUyrHZ2j1rKbNKInpxB0eZ/FpZAg/oQLzQlNGdMYzrCxOZkNH3M0x/WFKZW32IjODMo40pbqdPC6I1xbAaYV5WyTe5l072mXW+cJxE2Y5dfFdzm6xEQXFo7qix5J4DQTf53fdAGB1BJ9D4IRUzr0oK1ZSr7d6ZwXfoPyUTpqAgihtqvpEaRr1VFIrJ+yoVZECyII3/0izHs93Cjvdgu7Pc3ESxL4lbLvcgWl2SUq4uSgbOauWWQbW6BzbGVPJxKHRX14Mdgrz50+LV5oyRg88vLiQBhGunuPOK04JBmPyuGkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScHZun5Ls8cTAvbEzw8uZSH5eJY0bYlpTajuRZ84vIs=;
 b=ILyCAsOJu8AiXZV/jz6JpVQrD6YFiQGDFwgL+ZKFNL3OLRvQCfWMMEEEnSCFsNAo6KxKRalndGyNUGwMH9NudszsD/ilc20qNcULr0kOUmgMaie7oLnGofIJeykGELm2hzkYIFhpRBo+RpR9NFFZz86Uy49okyUeNoXuakM46BKxYEqwo9+uR0Jj3a9aNEZuiTtx1IXm9L/g/cBhejuuHL03jF7NYB+ZdE/nz1wUji2LoMvDgw2US9zkpymNPxJLuLKqIPZ8fOEydDBV03clLgzGt8/3ghXgRwityKWmtI+RFvmMW/fMrvwKcq5jICfQlmQuDiFA9Px3b76tPGk/9A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Ruslan Ruslichenko <ruslichenko.r@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Ruslan Ruslichenko
	<ruslan_ruslichenko@epam.com>, Dario Faggioli <dfaggioli@suse.com>, Juergen
 Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: Re: [PATCH] xen/sched: fix scheduler callback verification on init
Thread-Topic: [PATCH] xen/sched: fix scheduler callback verification on init
Thread-Index: AQHcyQvWtY5A3fOflECcuP5RifO+2rXebHgA
Date: Tue, 14 Apr 2026 11:10:21 +0000
Message-ID: <358dc4fb-139b-4000-99cb-c9271e90437d@epam.com>
References: <20260410164039.1000284-1-ruslichenko.r@gmail.com>
In-Reply-To: <20260410164039.1000284-1-ruslichenko.r@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GV1PR03MB8405:EE_
x-ms-office365-filtering-correlation-id: 6f7fd0ee-993c-4f6d-74d3-08de9a166b3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 5BbLC2fMONsGXO++0PbRz0E2ny+yzjzjBb6++wowca9CfU8JFemfAphMTYaRFQo23wC15V+3mTN9Ep1CCLfxnCYB3bBi77kwvMaZt7fjm2pWfCCQvJoUHSRsPnqL0ptJIILUKzJq/dE1PJ2+xcd1EOM25aud/NdmOBl1yeBu4TQEcjPX4t9Bhg/TsOY6ukx3/qW7bLrHky24xRCQiQlw2vaxdSc0hDr8U/FMwHYYUiThdqTjgidScPoqot8Ff04KwwpHtDiw17Vqn/AHdEt1CRvy/dyUYOF+yc/+AU84kgT6bGr+FG+Ifc+fCZjJXgl+cfyvYmCzj/0Hf/jqRKgB6GuVO97YKhw+JBg/jksRd3Wh/ogbW8TZyflduPAKA7tFNCAZI0CvffUwuj/nejzvlL8wfvONS5Q2kdfzRf4xWZXOioJoomVtGG0vka/+9yEnf1VCIvqkcDCUiZJivp9T5o04rTIX/aMEktry6ItyVNu4FHLmT0eRlzwcxJxjmOsTbJofSNImIOH1TrRxJT0YQSgWYqiR2Q9QGQto0jB8fiO6dxz1RopIOCKU1M537JHVf8wlTXzd3CqmMv8MSg64Zi+ROYSJU5khPeCExZ0HAgpnwqVS5ZMiO/8Yrj8qtcI5L6g5iKwxxHwQl+rzQlSduGwldz+NYtKiKZ363ok040wOlCtQ/t0hA4u55dDqZZ9DIEDA2bCB2WSRzyR+jV9UTslMgfNyeIugY6dJy3IiIYESSYaLpdIoidwlc/6m9+UNMH6Isy0VUXq3R9RKOoCSa7legL/EMpY0iEEG1B9LFyc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UEpJdWh2enlpNXBPVFpCTXpuRGxTTkU0RzJtQ2Z2Y0xteWo4N3o4a0E3OEg2?=
 =?utf-8?B?Q1BWYXU0UVFOeE5pVG1mMVhDYzRGNVFXUXJxUUNNMWlSVTFiR2VvUFp4Wjdo?=
 =?utf-8?B?VmQyZjFONVhmVzg1KzdUdm1sL1F5c05nK0RIR0xNaGw1WFB4N1Y2TUdTVDZZ?=
 =?utf-8?B?NjdlM0ZxK1BuclJvMmxWc0ZEOTZQbUdLSEVRaHVHQkpPdEwxY0Z2MlBSTE41?=
 =?utf-8?B?UkVKOFF4TXZERitXbk1JMitONGNQdFkvYjMzQTU5Z3ZRWkc5SjhLWkhXYjlM?=
 =?utf-8?B?bU9jeGMvY2Vvd1E1ODJQUTBqNFVVOU40dU80U05XMFROQlorTHl2V1laaTk5?=
 =?utf-8?B?Z1FSaTU1M1FQaG5CNExWV21MZ2ZSZVIzZHN3aWhxSjRQZkRLYkFWbWVnZVkv?=
 =?utf-8?B?N0ZpQmNvUHpZa1BZN3ZpaUhNUmV0T1FiUXl6eWZtSWV6Wm5JMTdCY3JUY0ti?=
 =?utf-8?B?YmhabEIxejFrczNYQ1JyeFhtZGZpU29SZUcwSEJndGtPekdIQWFwODhxQXU1?=
 =?utf-8?B?RjlLNW8yN1JFOFZVVUEvcWdnRVZvMnFIUUdGc2RkcnFrTGdCZmluSkhYR3Zk?=
 =?utf-8?B?MXR3em84YzRMbkdYSlppdWRKM2dPeVRnM01FQTVQSHREN1lTS2hJTGlHOHFC?=
 =?utf-8?B?YmVOc3VNRitUcnV6dUQwNzltVzV5T0lNRHk0S2wxM0hndHhldGMzYUEzWVpv?=
 =?utf-8?B?Z1ZqMjVxelpBWFkvYUFZRGJiSFUxTGpzM1B6WGdBVU5icG4zbXUraFZTVFBk?=
 =?utf-8?B?bUhXc2F1UTVKWXdaNGxFbWtYelk1K1VMVVVxbklIVFpES1JYaEYvdkdCdW82?=
 =?utf-8?B?b3VONys2NnRPWTZiUWJVUk56Vk4wMmhDTmQ0dDB5NjQwR2dEdi9sWUV3REZP?=
 =?utf-8?B?MGdMd1A4cnN3anFueDEvTHl4TkpZT0lSVHIyM3g2R1J0Z2xEMFJ3aGpQZHhG?=
 =?utf-8?B?MFpvUmhwU044SFhqdS9oU2tIWkIrQlp6eURUTVZKRk52V25IaEhodjZmNHdv?=
 =?utf-8?B?SmIzOGVmckdBVzBuY0l3RmJlNXI2anpCY3VWYm9QeERKaFBuaTlqeXdJY1Nx?=
 =?utf-8?B?UlhQMWlqVVRoSkJVai9FdjRnWkFDUGFDS3NueEdqeEpXdW1OTW51OUdlZzFy?=
 =?utf-8?B?ZnAwRWE1QXpYVXc4VzJOem9WeGloOXgvUXp1N253YTk2QzZuOXJKQk4xRWRY?=
 =?utf-8?B?b1R3T3FMc3p3WUVGZ200RzZINmpBb0xCT1ROakROd0s0dkh1WGNMdWQrRGwz?=
 =?utf-8?B?NkJqMy9OYzlaRkhRNkU4aDdTS2tNay8vblQ1RlREazRsT0VxT2lyUGZjbWFC?=
 =?utf-8?B?cVA4MDBDYzZFcTNBLzk2dFFDTmxYZFI3U3hnb09VLzRUSE12QjZXejhJaks4?=
 =?utf-8?B?cXU0ZFNSVlZkeGlhWDlaTXQzZzAyem9TSnVhTmp2emJ0a3dTaFkwOG8raUpB?=
 =?utf-8?B?TGZzSi96NFRJMDBCTUQ2bDdweE5jQ3g0MTJEMmM5amlzNS9wYTVFWGJpa3du?=
 =?utf-8?B?L1d0V1hYV3Arc1ZFVVdWTUh5elowa1RzREtzYWJ1Z01JeW1kcm1Dcm5MNHdF?=
 =?utf-8?B?V2FUaDNraXJNQSt0YmE0OTRianN5dU9iZngvK1NxNlFyaExHM1Rqb2RvZnh5?=
 =?utf-8?B?a2JmVHZXU2YxWnhaTlZHM1lTNXdZdHBTTDVXM2NHdFpZTmw0ZVZBdWk1eElC?=
 =?utf-8?B?ZUl5RHlDT3R5MTBPTFdrU3ZiRVB5UVAwNzlYNHdCYWEwU28wVmllallFM25h?=
 =?utf-8?B?QzlBZFcvU2R4aUJ0WTV2S2JEUzJmZDZrbkRRTVFyKzJkNW91Q0RoTUdLUWFP?=
 =?utf-8?B?REJtKzZtYUpEV3FyamZkQ0I1QXlybCs1T2cwNlI5S2wyQjdPeFhuRm1XK3Bx?=
 =?utf-8?B?YmNVeDlWa3NiaFZ4SWdFMXptOFFoaWVLL21kYTVWbmJNa3ZUOTNZbTc2OWJ2?=
 =?utf-8?B?WmtuZzc2UzVsOG9SZGZ2OFJqN1lIRnFLb3JMMWlQRXozSS9rY1kxb1J6S3F4?=
 =?utf-8?B?OFMvaEhKenMwMnlacEQxRTFpWXJKMVdYOHJPZjA5WWt4YkxyQ28yTW93cHRw?=
 =?utf-8?B?NTVBMi9hMEVvVHQxTG9SNW9ocVpyZVAxU1J5cStPQysxSkcrMnRLcnFoWC93?=
 =?utf-8?B?TjJLUks1T2NHYjlhMXNkOVR4VDY2VmVBSGNBU1J2N3FCOTdZSHhPNGhKQi9Z?=
 =?utf-8?B?VVBPTGpieWxvOWpVVWN3d3YvVGJyU05XNEpEQ2ExdDg5dVpUR3lmSDNYZjRz?=
 =?utf-8?B?aVEzd1dKdVMyaUpjcVVaT1E0TWx0VFdSVDFFU0pqY1Nyd0o5YzY1R0ZmeGhs?=
 =?utf-8?B?MzRLQlNIK0M0a1BQWk9PUlUxeG1USlpwWjVhWC9ybXJ5SVlMM2crV0VMbllM?=
 =?utf-8?Q?96vrETohOzQ0Utyg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3EF6F05B197F954BA0C603700E015ABF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7fd0ee-993c-4f6d-74d3-08de9a166b3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 11:10:21.2051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w82+Txnn1ECUo4J0knUeiRFhJSlZl+sStffX/A4aEcX91wMw3fE9++OVujB3OOfbklEYS2s3RMpGpQIGvgP09Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8405
X-purgate-ID: tlsNG-bad1c0/1776165025-5515D152-5B9C06BE/0/0
X-purgate-type: clean
X-purgate-size: 3006
X-Spamd-Result: default: False [0.41 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
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
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ruslichenko.r@gmail.com,m:xen-devel@lists.xenproject.org,m:Volodymyr_Babchuk@epam.com,m:ruslan_ruslichenko@epam.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:ruslichenkor@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:email,epam.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 50B293F92A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gNC8xMC8yNiAxOTo0MCwgUnVzbGFuIFJ1c2xpY2hlbmtvIHdyb3RlOg0KPiBGcm9tOiBSdXNs
YW4gUnVzbGljaGVua28gPFJ1c2xhbl9SdXNsaWNoZW5rb0BlcGFtLmNvbT4NCj4gDQo+IER1cmlu
ZyBjb3JlIHNjaGVkdWxlciBpbml0aWFsaXphdGlvbiwgZWFjaCByZWdpc3RlcmVkIHNjaGVkdWxl
cg0KPiBpcyBzYW5pdHkgdGVzdGVkIGluIHR3byBzdGVwczoNCj4gDQo+IC0gaXQgbXVzdCBwcm92
aWRlIHJlcXVpcmVkIGNhbGxiYWNrcyAoZS5nLiBpbml0LCBkb19zY2hlZHVsZSkuDQo+IC0gaWYg
Z2xvYmFsX2luaXQgY2FsbGJhY2sgaXMgcHJlc2VudCwgaXQgbXVzdCBzdWNjZWVkLg0KPiANCj4g
SWYgYW55IG9mIHRoZSBzdGVwcyBmYWlsLCBzY2hlZHVsZXIgZW50cnkgaXMgY2xlYXJlZCBpbiBn
bG9iYWwNCj4gJ3NjaGVkdWxlcnMnIGFycmF5Lg0KPiANCj4gSG93ZXZlciwgaW4gdGhlIGN1cnJl
bnQgaW1wbGVtZW50YXRpb24sIGlmIHZlcmlmaWNhdGlvbiBmYWlscyBkdXJpbmcNCj4gdGhlIGZp
cnN0IHN0ZXAsIHRoZSBzY2hlZHVsZXIgZW50cnkgaXMgY2xlYXJlZCBidXQgdmVyaWZpY2F0aW9u
DQo+IHNlcXVlbmNlIGlzIG5vdCBpbnRlcnJ1cHRlZC4gVGhpcyBsZWFkIHRvIE5VTEwgcG9pbnRl
ciBkZXJlZmVyZW5jZQ0KPiB3aGVuIHN1YnNlcXVlbnQgcmVxdWlyZWQgY2FsbGJhY2tzIHZlcmlm
aWVkLCBhbmQgcG9zc2libGUgZHVyaW5nDQo+IHRoZSBzZWNvbmQgc3RlcC4NCj4gDQo+IFRoZSBw
YXRjaCBmaXhlcyB0aGUgY3Jhc2hlcyBieSBhZGRpbmcgY2hlY2sgaW5zaWRlIHNjaGVkX3Rlc3Rf
ZnVuYw0KPiBtYWNybyBhbmQgc2tpcHBpbmcgdGhlIGNhbGwgdG8gYSBnbG9iYWxfaW5pdCBpZiBm
aXJzdCBzdGVwIGRpZCBub3QgcGFzcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJ1c2xhbiBSdXNs
aWNoZW5rbyA8UnVzbGFuX1J1c2xpY2hlbmtvQGVwYW0uY29tPg0KPiAtLS0NCj4gICB4ZW4vY29t
bW9uL3NjaGVkL2NvcmUuYyB8IDUgKysrKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hl
ZC9jb3JlLmMgYi94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPiBpbmRleCBhNTdkNWRkOTI5Li40
MjcwYzg5NDkxIDEwMDY0NA0KPiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPiArKysg
Yi94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPiBAQCAtMzAxNyw3ICszMDE3LDcgQEAgdm9pZCBf
X2luaXQgc2NoZWR1bGVyX2luaXQodm9pZCkNCj4gICAgICAgZm9yICggaSA9IDA7IGkgPCBOVU1f
U0NIRURVTEVSUzsgaSsrKQ0KPiAgICAgICB7DQo+ICAgI2RlZmluZSBzY2hlZF90ZXN0X2Z1bmMo
ZikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiAtICAgICAgICBpZiAoICFzY2hl
ZHVsZXJzW2ldLT5mICkgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiArICAgICAgICBpZiAo
IHNjaGVkdWxlcnNbaV0gJiYgIXNjaGVkdWxlcnNbaV0tPmYgKSAgICAgICAgXA0KPiAgICAgICAg
ICAgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4g
ICAgICAgICAgICAgICBwcmludGsoInNjaGVkdWxlciAlcyBtaXNzZXMgLiVzLCBkcm9wcGVkXG4i
LCBcDQo+ICAgICAgICAgICAgICAgICAgICAgIHNjaGVkdWxlcnNbaV0tPm9wdF9uYW1lLCAjZik7
ICAgICAgICAgXA0KID4gICAgICAgICAgICAgICBzY2hlZHVsZXJzW2ldID0gTlVMTDsgICAgICAg
ICAgICAgICAgICAgICAgICBcDQoNCk1heWJlIGl0IHdvdWxkIGJlIGNsZWFuZXIgdG8ganVzdCBh
ZGQgImNvbnRpbnVlIiBoZXJlPw0KDQo+IEBAIC0zMDM0LDYgKzMwMzQsOSBAQCB2b2lkIF9faW5p
dCBzY2hlZHVsZXJfaW5pdCh2b2lkKQ0KPiAgIA0KPiAgICN1bmRlZiBzY2hlZF90ZXN0X2Z1bmMN
Cj4gICANCj4gKyAgICAgICAgaWYgKCAhc2NoZWR1bGVyc1tpXSApDQo+ICsgICAgICAgICAgICBj
b250aW51ZTsNCj4gKw0KPiAgICAgICAgICAgaWYgKCBzY2hlZHVsZXJzW2ldLT5nbG9iYWxfaW5p
dCAmJiBzY2hlZHVsZXJzW2ldLT5nbG9iYWxfaW5pdCgpIDwgMCApDQo+ICAgICAgICAgICB7DQo+
ICAgICAgICAgICAgICAgcHJpbnRrKCJzY2hlZHVsZXIgJXMgZmFpbGVkIGluaXRpYWxpemF0aW9u
LCBkcm9wcGVkXG4iLA0KDQotLSANCk15a3l0YQ==

