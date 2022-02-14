Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8055F4B528A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 15:01:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272307.467096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbuC-0006Yn-7r; Mon, 14 Feb 2022 14:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272307.467096; Mon, 14 Feb 2022 14:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbuC-0006Wx-4K; Mon, 14 Feb 2022 14:00:40 +0000
Received: by outflank-mailman (input) for mailman id 272307;
 Mon, 14 Feb 2022 14:00:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YsDI=S5=epam.com=prvs=4044e07e7c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nJbuA-0006Wr-Eh
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 14:00:38 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b782664-8d9e-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 15:00:36 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21EDcTaE011125;
 Mon, 14 Feb 2022 14:00:30 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e7r4vg31y-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 14:00:30 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM6PR03MB4216.eurprd03.prod.outlook.com (2603:10a6:20b:d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 14:00:26 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 14:00:26 +0000
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
X-Inumbo-ID: 7b782664-8d9e-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ChaaMQMM2DOy+wBqYPdhMigZFVjLXhLAOnj9TCIZIvLX6j5snbJYfEMGaHZErQmfJNdXX+BQbcBqrclIX+aLs3kCytR3+Ve1hroaQYDtLF7eW7f+Ktnl/rlG49CxTYa4yvUP+JfF6FUkhqBAvuBIcYJSP0UmizpDzZpyX5fEvzpCHPQ9b9lJRwS3hpwFT9NgFwowRDNsFPom9RqnKWGz6J8CAvUkDAGlJQMd213M7ccpKx9dZ4t/cCuNrrDErDc1TbK0563dHemrJ8Qb3twxDQqiGmLY1YY8KsvxxKbkgWCGX/sLGGOWXZXH/ejQ1cw7GjAO8cNR4ynktdpED3NjZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LH5Kg4IJ83tOpbc0TwklnadUm1djlfTwaOViIpKjrbg=;
 b=dmiXBCkKaq7MkdJWpIHzlFQtUQ1USkh+4RVUNqBRxReC6rcTiG1Ra/HFV5OL/VtJTk9k9aa/CzU7cmebur2Cm8g7f9Id40io9A6j2ZW3zNrUJweUjmXU7jb0w8HzQkT2x56GL81+M+pcBJxf0JakvlT9bIe29YpNepX693IWGW05g0SfzaTjpjgQe/D6eNNTgMCA/0mLpiff1pDuoamLiNN9KdX/jspTikG62tAx7TCboHDRhbof/O9f1gayBOAA20oW4OhBL1W1lu7nUp71RxMe+kUN/otnGCfBKY2FNWxchMX0wBoORTXb7r21dfDqDF1JfQ26O9HZFfWrRJ5Kxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LH5Kg4IJ83tOpbc0TwklnadUm1djlfTwaOViIpKjrbg=;
 b=jHlDTv/T4C53OtlEcktiVF1Eyj4wNYFOSgYAEB5zZFw+cRCQWJ40ZAj/UAgTRlg+oHKxNJiRgB6UBoqOzvIqDHIAXjPrXk93VJm9MeycB93eFYjfpnpaFNZ/MWsQyaCtCh1dt3LMvQiX2YBkb34GS+u0mOYBjxw8z5gkmF2BNDNSXHnza9VYQRhUAYPDn7GbvfQqbtp1z5cjPBpgGeC1hEsrV3zuGCelHRc0OtemjzwSsTB/g+cPcucmuONIxSJLZhICeZyPj7WfJsWaMqq3zIsBQsN4Tu6it/q+abyyoEf0Ady3CmYp2cf9rPXzBwtEdkfa9pZ2Ov5UsHXhCKQvig==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Thread-Topic: [PATCH] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: 
 AQHYHboQT3cBWYI1/EGunE7hOwop6ayM95MAgAD+qQCAAEaDAIAElIcAgAAQEwCAAAV1AIAABOQAgAABMICAAALZgIAAAzmAgAAWXYCAAARtAIAAAoIAgAABpICAAAWvgIAAA2aA
Date: Mon, 14 Feb 2022 14:00:26 +0000
Message-ID: <2a750ae8-9ca7-2e74-b878-11b98fcb4ca0@epam.com>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <YgU6Snk8GTytJXZp@Air-de-Roger>
 <c4666570-666e-6680-5ec2-adf1da51ad06@epam.com>
 <YgZLEMW9US9QjjYG@Air-de-Roger>
 <33fb1095-64ed-29ef-ba6b-cbde21d941f8@epam.com>
 <YgowIg5MvTaf2zsR@Air-de-Roger>
 <d8389a90-00c8-b34a-8488-b0f3fc5bde1b@epam.com>
 <Ygo40L4dMPJjZKRF@Air-de-Roger>
 <746860aa-c403-1eca-0a75-587c5d10c8c2@epam.com>
 <Ygo8M3Y6BLzljn15@Air-de-Roger>
 <114b8578-ee13-b67d-e282-d060187ef509@epam.com>
 <06baf0c8-d7d2-50b8-ea8f-1d422ceac728@suse.com>
 <6ccc7add-c13e-555f-b341-ce37118746e5@epam.com>
 <f0e202dd-1f6e-4aac-1381-a64a7fd12270@suse.com>
 <ba901778-ce63-12f2-0a54-d56998090200@epam.com>
 <3538350c-0a63-59fb-7bba-fe460c0f1607@suse.com>
In-Reply-To: <3538350c-0a63-59fb-7bba-fe460c0f1607@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 366ee319-094a-4eba-f899-08d9efc25a24
x-ms-traffictypediagnostic: AM6PR03MB4216:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB42162B19B9DAC93B43AAEC82E7339@AM6PR03MB4216.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ru2TSQjr0tTBKU/tVo1MqhT1DBkgTPaiPE3ndVKjsDFX3QX9CTJv2sIQoVNQmn4nRbdJg3xYKhWM3vJWOG4Kl/X30QBm9pktYPx3AEPZDU0MTYaQn1FyM9X6Z9EULfuSvBMghtQdoKV6MqZmFBi/35UCAklvPYokFMmNaRVA++SLplgxhqhktuR+ughQC5JEDs3q38bmJ6R6OnYSS1u2OrXjkDQBjgX+MYADrDRYfmsxm3KNFseIG2Vj3owJ/kWn0ojN20Ml7VT0LipvyYjfEUJvVEjeE+8fLJu6wvhrfsCxW9ih8p7VHcXdfP6Pk5NG2hiDquuyJisv/ZadA9hjjIFC0p7LTj7R9vcA1L+5tKVUrxhrpjWs1Vy0/Mve3YCFjMWzcfG9GER/7031IwIvQfwLQav8EEdIhOlLDldD6O2xD4OLFNW3lEJOd6F+iOs0PHpMka7W9NVKa51hXj9p7lmjQlUgNYvwWqM+eKd/5vvqX3lVLmdg+hHQd2DFAZASsFjGVLO2CFx+NTJ7km2fF0s6ya1WsQMcKoNxJqH0uBwXuuyLT5aeJM5rK51HdKZOE8rpEfoi4j4Jgufq0pKiWb84qJ3VUjcE5gEwjLHhG44rkltgMpq9CgN6ZpxjmnIwZjilU1e04j9bgCUqK4j++cciwwAO1nLwuQCmtI+qui2nGBQZnIS2uZ8gumiX8KJM/TQ1FzQkAr60E8qYVCdNC5lx5dwjPXJXi4lbr6TNLBp3AxP+joGNjel3kTh0vK6h
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(66946007)(66556008)(91956017)(4326008)(64756008)(66476007)(66446008)(8936002)(107886003)(2616005)(8676002)(2906002)(53546011)(38100700002)(71200400001)(6506007)(55236004)(6512007)(5660300002)(6916009)(54906003)(83380400001)(186003)(26005)(31696002)(6486002)(122000001)(36756003)(31686004)(86362001)(38070700005)(316002)(508600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dVlJeHdYVTZrenFGc2p4OFU5TUxSUmZpc1VxMktMOEpyZDlqc2w1a0ZTUm1V?=
 =?utf-8?B?WmVSR1BIWUZSanpzZS8vMVNCVU8yc3c2cWV4TXhiTTZEWU02ZG03OWhNM1lW?=
 =?utf-8?B?UmNGZlFrdkI3b1BRdEF1N0NyNzVZN0pORE5hMExFMncrTFV5SUNBRUJpb2F4?=
 =?utf-8?B?WGt6bThSQWRuWWJXeXRMamtzRHhKeDRwVnp2ZjVHUlhKdDJxOGNpMmsxT2c2?=
 =?utf-8?B?R0pFOVNuU2NRMkE4TFR2TDVCRHkySGJPd3piSWtzTVp0OHBiZTEvWWpqUjRz?=
 =?utf-8?B?MVdLQ0JtTzREUWtTRmo4TEorWTVwQTRxNXNDZnliWlVMeDh5aFo5SVY0K0oy?=
 =?utf-8?B?am1lcVFNUmlJS2hqQkhxVTQrNTZLejlDQ0hKaHFCNG1jNkx1bS9UQXplWW5P?=
 =?utf-8?B?ekRRRnFlZHVMYnR2MG9qRGpia2ZuVFlUS0E4T3RWa2xtQ1diRTQrY2V3U05X?=
 =?utf-8?B?ZzRadklxMHRURWJkR001Y1pJMEg5dCsvMnBxLzNSOXEzcUpqdXRYemF3WFEz?=
 =?utf-8?B?WFpyRXAyUWVkT25uWkJLU2gwUlUrZ1JtMVpWeVNTTUNBbllrR2h3RjFvZEJh?=
 =?utf-8?B?dmJyb0FpWHBYdlVZdFZwOUx5aEFpa0ZpM0VSRXF1T01GM0IxNEVHRno2YnFr?=
 =?utf-8?B?eEY1T1cramtWL2MwbXFjWVUvV2krQTVUSHQ0ekpBM3ZDeW9aOU5PWHluZDRC?=
 =?utf-8?B?eG40MHUzQ1ZVU3N3WjBRajRpUFV6cXF0c2h3Ym9mMkpJRDdLSXBJY21ZYnFD?=
 =?utf-8?B?UWtUS1poby82WWJMT3FBS25FdTJrWWlrOWg2cndESml2dFduTUxwUmQ4dXdN?=
 =?utf-8?B?alF6bkRZcXRzZXl5TC9ZT1A2WmJzMFdNNDJUaUVlT1NYQUtaeCs2SjV6Kytn?=
 =?utf-8?B?a1p4VUZtc01WUlNjd3NqTEQrdWEzaG5ldVU3ZjRmNXQvOXhDekY5b3FKeGtH?=
 =?utf-8?B?QzlKL1B4UDlRV2NkZWpxQTRzVURPUTNGQWJzcUdxTWFjWi9VTHdjZDdGRjY0?=
 =?utf-8?B?UzIrbS9Md1JyYzBhdmh0UjlGY2NzVGpvcXk2OGVGSUdPOGl6V2R0aEN0aGNX?=
 =?utf-8?B?VjUraGpHWTQvb1lpVnlvS1pmanUvNEx4UXQrYkk0aVJRTzVlVnZJeVFjWjBK?=
 =?utf-8?B?aUJaT3hEMG5pNEN4NDFrYjI3U3FjdW1XTVlWVjhlQzJsOWtlRjNsVUJrTXQz?=
 =?utf-8?B?OGF1L251ckNZbEdueDRNd3U3RGIxZmNSK1hHZWZvRHpQQnJtUjlyOURPckkv?=
 =?utf-8?B?aGlabzh4YUdIcitXUThFZUF6bS9Vazd4M0JPM1NvUHFJdk0xME5VQU5EeEox?=
 =?utf-8?B?bmo4cFVvZzdDOE04Q2dLcmNnOW5lY085UmtqMGNXbnV6US9DN21jOTNBSjAx?=
 =?utf-8?B?SXRzY1h1Mk5xbHBPS1dRNjE0OWV4a0Y0RENOU3BEY3BLYWFqNDIwUzcxVnkw?=
 =?utf-8?B?OEM1NDdPSFplOTgzdTNySHJuS0VBUG9laytuQjdJNThYSGJVcEI1VGd0ajY0?=
 =?utf-8?B?SzkwWTRtWVRTcHc2UCtEa2hEOUVWTFRVcW4vVC9Xa3RJNGFBMk5tYVk4Szc4?=
 =?utf-8?B?Zkt2VXM1ZEV3aWNxRWxTV3Y2SHd4RzZINmNuV0Fyd0ppQVpEZGRBeGhRWlQ0?=
 =?utf-8?B?WHdSQ3pnaWt3VU5MRzhXSURSODczODY0VVJvRTc1elhjQzYwNUhUZ3NiMWlr?=
 =?utf-8?B?a0F1Y0FkUEkrSHZPbXo5M0k3TTY3L3pwTUI2NmRpNm9VRCtqM2FhNmR5Y2Nx?=
 =?utf-8?B?YklzNWlJRjh4L2VBdWpaYngyRnhIVHJRQ2ZiNFdSTElWU2NVYmxRTGU4Yklw?=
 =?utf-8?B?RDZVRjBiSzNQZktKalEycUtGNjh5QmtjNzF4QlFKNnAzTktqTTR5cnFOc24w?=
 =?utf-8?B?Sitxb3AxeWs1VUJyQ0lCMnhTaCtRYWRoZi9jRXlubG94c1FIQVhka1Y4TU1J?=
 =?utf-8?B?M0ZBeWFmR2VLY2Nic21yMTJCRVlPdjUzK2pMK0hYaENYYmpwU013SS9WWXI1?=
 =?utf-8?B?cU5Fc1J4RDFaR2JXMjFCUXNuWEhsTDdlNFhXNDVRQ3hyVmR4eW9vcXRRVHNv?=
 =?utf-8?B?ZHpaT3p5UVp4bTNJS21odmFFNTYyaHZ5Z3hxY2xZaWVQcG1pbHppaWpkUmhw?=
 =?utf-8?B?R3ZWaVErWituQXRzM0xTVDZxcWVublFXOWVUbmt3Z3hLUy9CNXRFOW1hYW8r?=
 =?utf-8?B?Q0xkMFB3Z214R0pOMnhzWmR1L1FybkVXbGhvbUxSU1czOEx4a0s1NVIzc1lR?=
 =?utf-8?B?V1R1elhHaUZvUHZFS0hsRkNYNTBtL25xR05DMTZsd3hlYnROZDBzaCtud0d6?=
 =?utf-8?B?UXNTOXM2MUNveDk2dk9LR1ZiYk4yeWVKaGkwS2hXOVhIYmRONWxNZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2F73FA56FE31042ACD61865E2FB39C7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366ee319-094a-4eba-f899-08d9efc25a24
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 14:00:26.3764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uSspYGqF9qWO4pbZWrroizYNTeBizDtnIx0YrzVTivAOFX9HpBk2C/B8JBsD7R9LFsiqZtVo8L8nLeE9JU18bP1RYawC5cEA+yHbPMvn/3d8X7tTGvEGWH9+reht0YP6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4216
X-Proofpoint-ORIG-GUID: Dh4ySy6F4Q2_nMn_Cd0OMQ6Oklnf57iS
X-Proofpoint-GUID: Dh4ySy6F4Q2_nMn_Cd0OMQ6Oklnf57iS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_06,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202140086

DQoNCk9uIDE0LjAyLjIyIDE1OjQ4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTQuMDIuMjAy
MiAxNDoyNywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMTQuMDIu
MjIgMTU6MjIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE0LjAyLjIwMjIgMTQ6MTMsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAxNC4wMi4yMiAxNDo1NywgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAxNC4wMi4yMDIyIDEyOjM3LCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAxNC4wMi4yMiAxMzoyNSwgUm9nZXIgUGF1IE1v
bm7DqSB3cm90ZToNCj4+Pj4+Pj4gT24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgMTE6MTU6MjdBTSAr
MDAwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4+PiBPbiAxNC4wMi4y
MiAxMzoxMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+Pj4+PiBPbiBNb24sIEZlYiAx
NCwgMjAyMiBhdCAxMDo1Mzo0M0FNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90
ZToNCj4+Pj4+Pj4+Pj4gT24gMTQuMDIuMjIgMTI6MzQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6
DQo+Pj4+Pj4+Pj4+PiBPbiBNb24sIEZlYiAxNCwgMjAyMiBhdCAwOTozNjozOUFNICswMDAwLCBP
bGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+Pj4+Pj4+PiBPbiAxMS4wMi4yMiAx
Mzo0MCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+
Pj4+Pj4+PiAgICAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBtc2l4LT5tYXhfZW50cmllczsg
aSsrICkNCj4+Pj4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgIHsNCj4+Pj4+Pj4+Pj4+Pj4+Pj4g
ICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgdnBjaV9tc2l4X2VudHJ5ICplbnRyeSA9ICZt
c2l4LT5lbnRyaWVzW2ldOw0KPj4+Pj4+Pj4+Pj4+Pj4+IFNpbmNlIHRoaXMgZnVuY3Rpb24gaXMg
bm93IGNhbGxlZCB3aXRoIHRoZSBwZXItZG9tYWluIHJ3bG9jayByZWFkDQo+Pj4+Pj4+Pj4+Pj4+
Pj4gbG9ja2VkIGl0J3MgbGlrZWx5IG5vdCBhcHByb3ByaWF0ZSB0byBjYWxsIHByb2Nlc3NfcGVu
ZGluZ19zb2Z0aXJxcw0KPj4+Pj4+Pj4+Pj4+Pj4+IHdoaWxlIGhvbGRpbmcgc3VjaCBsb2NrIChj
aGVjayBiZWxvdykuDQo+Pj4+Pj4+Pj4+Pj4+PiBZb3UgYXJlIHJpZ2h0LCBhcyBpdCBpcyBwb3Nz
aWJsZSB0aGF0Og0KPj4+Pj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+Pj4+IHByb2Nlc3NfcGVuZGlu
Z19zb2Z0aXJxcyAtPiB2cGNpX3Byb2Nlc3NfcGVuZGluZyAtPiByZWFkX2xvY2sNCj4+Pj4+Pj4+
Pj4+Pj4+DQo+Pj4+Pj4+Pj4+Pj4+PiBFdmVuIG1vcmUsIHZwY2lfcHJvY2Vzc19wZW5kaW5nIG1h
eSBhbHNvDQo+Pj4+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4+Pj4gcmVhZF91bmxvY2sgLT4gdnBj
aV9yZW1vdmVfZGV2aWNlIC0+IHdyaXRlX2xvY2sNCj4+Pj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+
Pj4+PiBpbiBpdHMgZXJyb3IgcGF0aC4gU28sIGFueSBpbnZvY2F0aW9uIG9mIHByb2Nlc3NfcGVu
ZGluZ19zb2Z0aXJxcw0KPj4+Pj4+Pj4+Pj4+Pj4gbXVzdCBub3QgaG9sZCBkLT52cGNpX3J3bG9j
ayBhdCBsZWFzdC4NCj4+Pj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+Pj4+PiBBbmQgYWxzbyB3ZSBu
ZWVkIHRvIGNoZWNrIHRoYXQgcGRldi0+dnBjaSB3YXMgbm90IHJlbW92ZWQNCj4+Pj4+Pj4+Pj4+
Pj4+IGluIGJldHdlZW4gb3IgKnJlLWNyZWF0ZWQqDQo+Pj4+Pj4+Pj4+Pj4+Pj4gV2Ugd2lsbCBs
aWtlbHkgbmVlZCB0byByZS1pdGVyYXRlIG92ZXIgdGhlIGxpc3Qgb2YgcGRldnMgYXNzaWduZWQg
dG8NCj4+Pj4+Pj4+Pj4+Pj4+PiB0aGUgZG9tYWluIGFuZCBhc3NlcnQgdGhhdCB0aGUgcGRldiBp
cyBzdGlsbCBhc3NpZ25lZCB0byB0aGUgc2FtZQ0KPj4+Pj4+Pj4+Pj4+Pj4+IGRvbWFpbi4NCj4+
Pj4+Pj4+Pj4+Pj4+IFNvLCBkbyB5b3UgbWVhbiBhIHBhdHRlcm4gbGlrZSB0aGUgYmVsb3cgc2hv
dWxkIGJlIHVzZWQgYXQgYWxsDQo+Pj4+Pj4+Pj4+Pj4+PiBwbGFjZXMgd2hlcmUgd2UgbmVlZCB0
byBjYWxsIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcz8NCj4+Pj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+
Pj4+Pj4+PiByZWFkX3VubG9jaw0KPj4+Pj4+Pj4+Pj4+Pj4gcHJvY2Vzc19wZW5kaW5nX3NvZnRp
cnFzDQo+Pj4+Pj4+Pj4+Pj4+PiByZWFkX2xvY2sNCj4+Pj4+Pj4+Pj4+Pj4+IHBkZXYgPSBwY2lf
Z2V0X3BkZXZfYnlfZG9tYWluKGQsIHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5kZXZmbik7DQo+
Pj4+Pj4+Pj4+Pj4+PiBpZiAoIHBkZXYgJiYgcGRldi0+dnBjaSAmJiBpc190aGVfc2FtZV92cGNp
KHBkZXYtPnZwY2kpICkNCj4+Pj4+Pj4+Pj4+Pj4+IDxjb250aW51ZSBwcm9jZXNzaW5nPg0KPj4+
Pj4+Pj4+Pj4+PiBTb21ldGhpbmcgYWxvbmcgdGhvc2UgbGluZXMuIFlvdSBsaWtlbHkgbmVlZCB0
byBjb250aW51ZSBpdGVyYXRlIHVzaW5nDQo+Pj4+Pj4+Pj4+Pj4+IGZvcl9lYWNoX3BkZXYuDQo+
Pj4+Pj4+Pj4+Pj4gSG93IGRvIHdlIHRlbGwgaWYgcGRldi0+dnBjaSBpcyB0aGUgc2FtZT8gSmFu
IGhhcyBhbHJlYWR5IGJyb3VnaHQNCj4+Pj4+Pj4+Pj4+PiB0aGlzIHF1ZXN0aW9uIGJlZm9yZSBb
MV0gYW5kIEkgd2FzIGFib3V0IHRvIHVzZSBzb21lIElEIGZvciB0aGF0IHB1cnBvc2U6DQo+Pj4+
Pj4+Pj4+Pj4gcGRldi0+dnBjaS0+aWQgPSBkLT52cGNpX2lkKysgYW5kIHRoZW4gd2UgdXNlIHBk
ZXYtPnZwY2ktPmlkwqAgZm9yIGNoZWNrcw0KPj4+Pj4+Pj4+Pj4gR2l2ZW4gdGhpcyBpcyBhIGRl
YnVnIG1lc3NhZ2UgSSB3b3VsZCBiZSBPSyB3aXRoIGp1c3QgZG9pbmcgdGhlDQo+Pj4+Pj4+Pj4+
PiBtaW5pbWFsIGNoZWNrcyB0byBwcmV2ZW50IFhlbiBmcm9tIGNyYXNoaW5nIChpZTogcGRldi0+
dnBjaSBleGlzdHMpDQo+Pj4+Pj4+Pj4+PiBhbmQgdGhhdCB0aGUgcmVzdW1lIE1TSSBlbnRyeSBp
cyBub3QgcGFzdCB0aGUgY3VycmVudCBsaW1pdC4gT3RoZXJ3aXNlDQo+Pj4+Pj4+Pj4+PiBqdXN0
IHByaW50IGEgbWVzc2FnZSBhbmQgbW92ZSBvbiB0byB0aGUgbmV4dCBkZXZpY2UuDQo+Pj4+Pj4+
Pj4+IEFncmVlLCBJIHNlZSBubyBiaWcgaXNzdWUgKHByb2JhYmx5KSBpZiB3ZSBhcmUgbm90IGFi
bGUgdG8gcHJpbnQNCj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4gSG93IGFib3V0IHRoaXMgb25lOg0K
Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdnBjaS9oZWFk
ZXIuYyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+Pj4+Pj4+Pj4gaW5kZXggODA5YTZi
NDc3M2UxLi41MDM3M2YwNGRhODIgMTAwNjQ0DQo+Pj4+Pj4+Pj4+IC0tLSBhL3hlbi9kcml2ZXJz
L3ZwY2kvaGVhZGVyLmMNCj4+Pj4+Pj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIu
Yw0KPj4+Pj4+Pj4+PiBAQCAtMTcxLDEwICsxNzEsMzEgQEAgc3RhdGljIGludCBfX2luaXQgYXBw
bHlfbWFwKHN0cnVjdCBkb21haW4gKmQsIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LA0KPj4+
Pj4+Pj4+PiAgICAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzdHJ1Y3QgcmFuZ2VzZXQgKm1lbSwgdWludDE2X3QgY21kKQ0KPj4+Pj4+
Pj4+PiAgICAgICDCoHsNCj4+Pj4+Pj4+Pj4gICAgICAgwqDCoMKgwqAgc3RydWN0IG1hcF9kYXRh
IGRhdGEgPSB7IC5kID0gZCwgLm1hcCA9IHRydWUgfTsNCj4+Pj4+Pj4+Pj4gK8KgwqDCoCBwY2lf
c2JkZl90IHNiZGYgPSBwZGV2LT5zYmRmOw0KPj4+Pj4+Pj4+PiAgICAgICDCoMKgwqDCoCBpbnQg
cmM7DQo+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+ICsgQVNTRVJUKHJ3X2lzX3dyaXRlX2xvY2tlZCgm
cGRldi0+ZG9tYWluLT52cGNpX3J3bG9jaykpOw0KPj4+Pj4+Pj4+PiArDQo+Pj4+Pj4+Pj4+ICAg
ICAgIMKgwqDCoMKgIHdoaWxlICggKHJjID0gcmFuZ2VzZXRfY29uc3VtZV9yYW5nZXMobWVtLCBt
YXBfcmFuZ2UsICZkYXRhKSkgPT0gLUVSRVNUQVJUICkNCj4+Pj4+Pj4+Pj4gK8KgwqDCoCB7DQo+
Pj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC8qDQo+Pj4+Pj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgICogcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzIG1heSB0cmlnZ2VyIHZw
Y2lfcHJvY2Vzc19wZW5kaW5nIHdoaWNoDQo+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICog
bWF5IG5lZWQgdG8gYWNxdWlyZSBwZGV2LT5kb21haW4tPnZwY2lfcndsb2NrIGluIHJlYWQgbW9k
ZS4NCj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8NCj4+Pj4+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIHdyaXRlX3VubG9jaygmcGRldi0+ZG9tYWluLT52cGNpX3J3bG9jayk7DQo+Pj4+Pj4+
Pj4+ICAgICAgIMKgwqDCoMKgwqDCoMKgwqAgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKCk7DQo+
Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB3cml0ZV9sb2NrKCZwZGV2LT5kb21haW4tPnZwY2lf
cndsb2NrKTsNCj4+Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLyogQ2hl
Y2sgaWYgcGRldiBzdGlsbCBleGlzdHMgYW5kIHZQQ0kgd2FzIG5vdCByZW1vdmVkIG9yIHJlLWNy
ZWF0ZWQuICovDQo+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocGNpX2dldF9wZGV2X2J5
X2RvbWFpbihkLCBzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYuZGV2Zm4pICE9IHBkZXYpDQo+Pj4+
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggdnBjaSBpcyBOT1QgdGhlIHNhbWUg
KQ0KPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB7DQo+Pj4+Pj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmMgPSAwOw0KPj4+Pj4+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB9DQo+Pj4+Pj4+Pj4+ICvCoMKgwqAgfQ0KPj4+Pj4+Pj4+PiArDQo+Pj4+Pj4+Pj4+
ICAgICAgIMKgwqDCoMKgIHJhbmdlc2V0X2Rlc3Ryb3kobWVtKTsNCj4+Pj4+Pj4+Pj4gICAgICAg
wqDCoMKgwqAgaWYgKCAhcmMgKQ0KPj4+Pj4+Pj4+PiAgICAgICDCoMKgwqDCoMKgwqDCoMKgIG1v
ZGlmeV9kZWNvZGluZyhwZGV2LCBjbWQsIGZhbHNlKTsNCj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4g
VGhpcyBvbmUgYWxzbyB3YW50cyBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMgdG8gcnVuIHNvIGl0
ICptaWdodCoNCj4+Pj4+Pj4+Pj4gd2FudCBwZGV2IGFuZCB2cGNpIGNoZWNrcy4gQnV0IGF0IHRo
ZSBzYW1lIHRpbWUgYXBwbHlfbWFwIHJ1bnMNCj4+Pj4+Pj4+Pj4gYXQgKCBzeXN0ZW1fc3RhdGUg
PCBTWVNfU1RBVEVfYWN0aXZlICksIHNvIGRlZmVyX21hcCB3b24ndCBiZQ0KPj4+Pj4+Pj4+PiBy
dW5uaW5nIHlldCwgdGh1cyBubyB2cGNpX3Byb2Nlc3NfcGVuZGluZyBpcyBwb3NzaWJsZSB5ZXQg
KGluIHRlcm1zDQo+Pj4+Pj4+Pj4+IGl0IGhhcyBzb21ldGhpbmcgdG8gZG8geWV0KS4gU28sIEkg
dGhpbmsgd2UganVzdCBuZWVkOg0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiAgICAgICDCoMKgwqDC
oMKgwqDCoCB3cml0ZV91bmxvY2soJnBkZXYtPmRvbWFpbi0+dnBjaV9yd2xvY2spOw0KPj4+Pj4+
Pj4+PiAgICAgICDCoMKgwqDCoMKgwqDCoCBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMoKTsNCj4+
Pj4+Pj4+Pj4gICAgICAgwqDCoMKgwqDCoMKgwqAgd3JpdGVfbG9jaygmcGRldi0+ZG9tYWluLT52
cGNpX3J3bG9jayk7DQo+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+IGFuZCB0aGlzIHNob3VsZCBiZSBl
bm91Z2gNCj4+Pj4+Pj4+PiBHaXZlbiB0aGUgY29udGV4dCBhcHBseV9tYXAgaXMgY2FsbGVkIGZy
b20gKGRvbTAgc3BlY2lmaWMgaW5pdCBjb2RlKSwNCj4+Pj4+Pj4+PiB0aGVyZSdzIG5vIG5lZWQg
dG8gY2hlY2sgZm9yIHRoZSBwZGV2IHRvIHN0aWxsIGV4aXRzLCBvciB3aGV0aGVyIHZwY2kNCj4+
Pj4+Pj4+PiBoYXMgYmVlbiByZWNyZWF0ZWQsIGFzIGl0J3Mgbm90IHBvc3NpYmxlLiBKdXN0IGFk
ZCBhIGNvbW1lbnQgdG8NCj4+Pj4+Pj4+PiBleHBsaWNpdGx5IG5vdGUgdGhhdCB0aGUgY29udGV4
dCBvZiB0aGUgZnVuY3Rpb24gaXMgc3BlY2lhbCwgYW5kIHRodXMNCj4+Pj4+Pj4+PiB0aGVyZSdz
IG5vIHBvc3NpYmlsaXR5IG9mIGVpdGhlciB0aGUgZGV2aWNlIG9yIHZwY2kgZ29pbmcgYXdheS4N
Cj4+Pj4+Pj4+IERvZXMgaXQgcmVhbGx5IG5lZWQgd3JpdGVfdW5sb2NrL3dyaXRlX2xvY2sgZ2l2
ZW4gdGhlIGNvbnRleHQ/Li4uDQo+Pj4+Pj4+IEkgdGhpbmsgaXQncyBiYWQgcHJhY3RpY2UgdG8g
Y2FsbCBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMgd2hpbGUNCj4+Pj4+Pj4gaG9sZGluZyBhbnkg
bG9ja3MuIFRoaXMgaXMgYSB2ZXJ5IHNwZWNpZmljIGNvbnRleHQgc28gaXQncyBsaWtlbHkgZmlu
ZQ0KPj4+Pj4+PiB0byBub3QgZHJvcCB0aGUgbG9jaywgYnV0IHdvdWxkIHN0aWxsIHNlZW0gaW5j
b3JyZWN0IHRvIG1lLg0KPj4+Pj4+IE9rDQo+Pj4+Pj4+PiBJIHRoaW5rIGl0IGRvZXNuJ3QgYXMg
dGhlcmUgaXMgbm8gY2hhbmNlIGRlZmVyX21hcCBpcyBjYWxsZWQsIHRodXMNCj4+Pj4+Pj4+IHBy
b2Nlc3NfcGVuZGluZ19zb2Z0aXJxcyAtPiB2cGNpX3Byb2Nlc3NfcGVuZGluZyAtPiByZWFkX2xv
Y2sNCj4+Pj4+Pj4gSW5kZWVkLCB0aGVyZSdzIG5vIGNoYW5jZSBvZiB0aGF0IGJlY2F1c2UgcHJv
Y2Vzc19wZW5kaW5nX3NvZnRpcnFzDQo+Pj4+Pj4+IHdpbGwgbmV2ZXIgdHJ5IHRvIGRvIGEgc2No
ZWR1bGluZyBvcGVyYXRpb24gdGhhdCB3b3VsZCByZXN1bHQgaW4gb3VyDQo+Pj4+Pj4+IGNvbnRl
eHQgYmVpbmcgc2NoZWR1bGVkIG91dC4NCj4+Pj4+PiAgICAgwqDCoMKgIHdoaWxlICggKHJjID0g
cmFuZ2VzZXRfY29uc3VtZV9yYW5nZXMobWVtLCBtYXBfcmFuZ2UsICZkYXRhKSkgPT0gLUVSRVNU
QVJUICkNCj4+Pj4+PiAgICAgwqDCoMKgIHsNCj4+Pj4+PiAgICAgwqDCoMKgwqDCoMKgwqAgLyoN
Cj4+Pj4+PiAgICAgwqDCoMKgwqDCoMKgwqDCoCAqIEZJWE1FOiBHaXZlbiB0aGUgY29udGV4dCBh
cHBseV9tYXAgaXMgY2FsbGVkIGZyb20gKGRvbTAgc3BlY2lmaWMNCj4+Pj4+PiAgICAgwqDCoMKg
wqDCoMKgwqDCoCAqIGluaXQgY29kZSBhdCBzeXN0ZW1fc3RhdGUgPCBTWVNfU1RBVEVfYWN0aXZl
KSBpdCBpcyBub3Qgc3RyaWN0bHkNCj4+Pj4+PiAgICAgwqDCoMKgwqDCoMKgwqDCoCAqIHJlcXVp
cmVkIHRoYXQgcGRldi0+ZG9tYWluLT52cGNpX3J3bG9jayBpcyB1bmxvY2tlZCBiZWZvcmUgY2Fs
bGluZw0KPj4+Pj4+ICAgICDCoMKgwqDCoMKgwqDCoMKgICogcHJvY2Vzc19wZW5kaW5nX3NvZnRp
cnFzIGFzIHRoZXJlIGlzIG5vIGNvbnRlbnRpb24gcG9zc2libGUgYmV0d2Vlbg0KPj4+Pj4+ICAg
ICDCoMKgwqDCoMKgwqDCoMKgICogdGhpcyBjb2RlIGFuZCB2cGNpX3Byb2Nlc3NfcGVuZGluZyB0
cnlpbmcgdG8gYWNxdWlyZSB0aGUgbG9jayBpbg0KPj4+Pj4+ICAgICDCoMKgwqDCoMKgwqDCoMKg
ICogcmVhZCBtb2RlLiBCdXQgcnVubmluZyBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMgd2l0aCBh
bnkgbG9jayBoZWxkDQo+Pj4+Pj4gICAgIMKgwqDCoMKgwqDCoMKgwqAgKiBkb2Vzbid0IHNlZW0g
dG8gYmUgYSBnb29kIHByYWN0aWNlLCBzbyBkcm9wIHRoZSBsb2NrIGFuZCByZS1hY3F1aXJlDQo+
Pj4+Pj4gICAgIMKgwqDCoMKgwqDCoMKgwqAgKiBpdCByaWdodCBhZ2Fpbi4NCj4+Pj4+PiAgICAg
wqDCoMKgwqDCoMKgwqDCoCAqLw0KPj4+Pj4+ICAgICDCoMKgwqDCoMKgwqDCoCB3cml0ZV91bmxv
Y2soJnBkZXYtPmRvbWFpbi0+dnBjaV9yd2xvY2spOw0KPj4+Pj4+ICAgICDCoMKgwqDCoMKgwqDC
oCBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMoKTsNCj4+Pj4+PiAgICAgwqDCoMKgwqDCoMKgwqAg
d3JpdGVfbG9jaygmcGRldi0+ZG9tYWluLT52cGNpX3J3bG9jayk7DQo+Pj4+Pj4gICAgIMKgwqDC
oCB9DQo+Pj4+PiBJJ20gYWZyYWlkIHRoYXQncyBtaXNsZWFkaW5nIGF0IGJlc3QuIGFwcGx5X21h
cCgpIGlzIG1lcmVseSBhIHNwZWNpZmljDQo+Pj4+PiBleGFtcGxlIHdoZXJlIHlvdSBrbm93IHRo
ZSBsb2NrIGlzIGdvaW5nIHRvIGJlIHRha2VuLiBCdXQgcmVhbGx5IGFueQ0KPj4+Pj4gc29mdGly
cSBoYW5kbGVyIGNvdWxkIGJlIGFjcXVpcmluZyBhbnkgbG9jaywgc28gcmVxdWVzdGluZyB0byBw
cm9jZXNzDQo+Pj4+PiBzb2Z0aXJxcyBjYW5ub3QgZXZlciBiZSBkb25lIHdpdGggYW55IGxvY2sg
aGVsZC4NCj4+Pj4+DQo+Pj4+PiBXaGF0IHlvdSBpbnN0ZWFkIHdhbnQgdG8gZXhwbGFpbiBpcyB3
aHksIGFmdGVyIHJlLWFjcXVpcmluZyB0aGUgbG9jaywNCj4+Pj4+IG5vIGZ1cnRoZXIgY2hlY2tp
bmcgaXMgbmVlZGVkIGZvciBwb3RlbnRpYWxseSBjaGFuZ2VkIHN0YXRlLg0KPj4+PiBIb3cgYWJv
dXQ6DQo+Pj4+DQo+Pj4+IC8qDQo+Pj4+ICAgIMKgKiBGSVhNRTogR2l2ZW4gdGhlIGNvbnRleHQg
YXBwbHlfbWFwIGlzIGNhbGxlZCBmcm9tIChkb20wIHNwZWNpZmljDQo+Pj4+ICAgIMKgKiBpbml0
IGNvZGUgYXQgc3lzdGVtX3N0YXRlIDwgU1lTX1NUQVRFX2FjdGl2ZSkgdGhlcmUgaXMgbm8gY29u
dGVudGlvbg0KPj4+PiAgICDCoCogcG9zc2libGUgYmV0d2VlbiB0aGlzIGNvZGUgYW5kIHZwY2lf
cHJvY2Vzc19wZW5kaW5nIHRyeWluZyB0byBhY3F1aXJlDQo+Pj4+ICAgIMKgKiB0aGUgbG9jayBp
biByZWFkIG1vZGUgYW5kIGRlc3Ryb3kgcGRldi0+dnBjaSBpbiBpdHMgZXJyb3IgcGF0aC4NCj4+
Pj4gICAgwqAqIE5laXRoZXIgcGRldiBtYXkgYmUgZGlzcG9zZWQgeWV0LCBzbyBpdCBpcyBub3Qg
cmVxdWlyZWQgdG8gY2hlY2sgaWYgdGhlDQo+Pj4+ICAgIMKgKiByZWxldmFudCBwZGV2IHN0aWxs
IGV4aXN0cyBhZnRlciByZS1hY3F1aXJpbmcgdGhlIGxvY2suDQo+Pj4+ICAgIMKgKi8NCj4+PiBJ
J20gbm90IHN1cmUgSSBmb2xsb3cgdGhlIGZpcnN0IHNlbnRlbmNlOyBJIGd1ZXNzIGEgY29tbWEg
b3IgdHdvIG1heSBoZWxwLA0KPj4+IGFuZCBvciB1c2luZyAiYXMgd2VsbCBhcyIgaW4gcGxhY2Ug
b2Ygb25lIG9mIHRoZSB0d28gImFuZCIuIEkgYWxzbyBkb24ndA0KPj4+IHRoaW5rIHlvdSBtZWFu
IGNvbnRlbnRpb24sIGJ1dCByYXRoZXIgYSByYWNlIGJldHdlZW4gdGhlIG5hbWVkIGVudGl0aWVz
Pw0KPj4gICDCoC8qDQo+PiAgIMKgICogRklYTUU6IEdpdmVuIHRoZSBjb250ZXh0IGZyb20gd2hp
Y2ggYXBwbHlfbWFwIGlzIGNhbGxlZCAoZG9tMCBzcGVjaWZpYw0KPj4gICDCoCAqIGluaXQgY29k
ZSBhdCBzeXN0ZW1fc3RhdGUgPCBTWVNfU1RBVEVfYWN0aXZlKSB0aGVyZSBpcyBubyByYWNlIGNv
bmRpdGlvbg0KPj4gICDCoCAqIHBvc3NpYmxlIGJldHdlZW4gdGhpcyBjb2RlIGFuZCB2cGNpX3By
b2Nlc3NfcGVuZGluZyB3aGljaCBtYXkgdHJ5IHRvIGFjcXVpcmUNCj4+ICAgwqAgKiB0aGUgbG9j
ayBpbiByZWFkIG1vZGUgYW5kIGFsc28gdHJ5IHRvIGRlc3Ryb3kgcGRldi0+dnBjaSBpbiBpdHMg
ZXJyb3IgcGF0aC4NCj4+ICAgwqAgKiBOZWl0aGVyIHBkZXYgbWF5IGJlIGRpc3Bvc2VkIHlldCwg
c28gaXQgaXMgbm90IHJlcXVpcmVkIHRvIGNoZWNrIGlmIHRoZQ0KPj4gICDCoCAqIHJlbGV2YW50
IHBkZXYgc3RpbGwgZXhpc3RzIGFmdGVyIHJlLWFjcXVpcmluZyB0aGUgbG9jay4NCj4+ICAgwqAg
Ki8NCj4gSSdtIHN0aWxsIHN0cnVnZ2xpbmcgd2l0aCB0aGUgbGFuZ3VhZ2UsIHNvcnJ5LiBZb3Ug
bG9vayB0byBvbmx5IGhhdmUgcmVwbGFjZWQNCj4gImNvbnRlbnRpb24iPyBSZWFkaW5nIGl0IGFn
YWluIEknZCBhbHNvIGxpa2UgdG8gbWVudGlvbiB0aGF0IHRvIG1lIChub3QgYQ0KPiBuYXRpdmUg
c3BlYWtlcikgIk5laXRoZXIgcGRldiBtYXkgYmUgLi4uIiBleHByZXNzZXMgIk5vbmUgb2YgdGhl
IHBkZXYtcyBtYXkNCj4gYmUgLi4uIiwgd2hlbiBJIHRoaW5rIHlvdSBtZWFuICJOb3IgbWF5IHBk
ZXYgYmUgLi4uIg0KLyoNCiogRklYTUU6IGFwcGx5X21hcCBpcyBjYWxsZWQgZnJvbSBkb20wIHNw
ZWNpZmljIGluaXQgY29kZSB3aGVuDQoqIHN5c3RlbV9zdGF0ZSA8IFNZU19TVEFURV9hY3RpdmUs
IHNvIHRoZXJlIGlzIG5vIHJhY2UgY29uZGl0aW9uDQoqIHBvc3NpYmxlIGJldHdlZW4gdGhpcyBj
b2RlIGFuZCB2cGNpX3Byb2Nlc3NfcGVuZGluZy4gU28sIG5laXRoZXINCiogdnBjaV9wcm9jZXNz
X3BlbmRpbmcgbWF5IHRyeSB0byBhY3F1aXJlIHRoZSBsb2NrIGluIHJlYWQgbW9kZSBhbmQNCiog
YWxzbyBkZXN0cm95IHBkZXYtPnZwY2kgaW4gaXRzIGVycm9yIHBhdGggbm9yIHBkZXYgbWF5IGJl
IGRpc3Bvc2VkIHlldC4NCiogVGhpcyBtZWFucyB0aGF0IGl0IGlzIG5vdCByZXF1aXJlZCB0byBj
aGVjayBpZiB0aGUgcmVsZXZhbnQgcGRldg0KKiBzdGlsbCBleGlzdHMgYWZ0ZXIgcmUtYWNxdWly
aW5nIHRoZSBsb2NrLg0KKi8NCg0KPiBKYW4NCj4NCg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

