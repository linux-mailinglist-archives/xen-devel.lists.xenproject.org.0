Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CDJKX5exmm+JAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 11:39:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB81342B51
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 11:39:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265349.1556323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w64bB-0000gC-9n; Fri, 27 Mar 2026 10:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265349.1556323; Fri, 27 Mar 2026 10:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w64bB-0000eC-6w; Fri, 27 Mar 2026 10:39:29 +0000
Received: by outflank-mailman (input) for mailman id 1265349;
 Fri, 27 Mar 2026 10:39:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1w64bA-0000e4-3j
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 10:39:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w64b9-002EiG-Fm
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 11:39:27 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69c65e57-bab6-0a2a0a5309dd-0a2a45079e16-40
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 11:39:27 +0100
Received: from [52.101.83.125]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69c65e5e-fd74-0a2a45070019-3465537d5ddf-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 11:39:27 +0100
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PA6PR03MB10548.eurprd03.prod.outlook.com
 (2603:10a6:102:3d9::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Fri, 27 Mar
 2026 10:39:24 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 10:39:24 +0000
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
 b=w1voaCGBE+Bb/B7nU+rE9N9tDGBCo0NGJHbdK9yKqD22rwgHrN+iwnrcPCp8t0Ek7UuHh8ElVVAoEdg3gNlzRml5gbFN+sirc/FdLu2UxSSaM4xUPJfg4ABr7sn0EiGrObZMQ7FO948TaCois1Q8IitSVBzrszzWc6FccdZ9UEWBtkqtPJC6o8fTLQsq7dRsg8RJDX0K349nGS/b83AdbggeXuW+JImPRMN1kKhA76iwXbXc8q4HJYAqRuNNwS7H+eDK2oOiE4EqDx76r2n57m/HpUVnRSj+jtd/ywpt02nAR4Fn15Mo1txbuphak5jSaNfVxmb1WOHV1CRbFECNQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ft+lreCixcMUMH0Zc1yPqDd0lnChZ3cmDDQLk6vYaZw=;
 b=QShyoZfStxi7lhFdR6HS2vpefs3FkhFv+UcmRkXhzQ102Yb1E3j0TbjSBWKlaGY6Exq6urwFgUSjr69Sb09FpdgnHyLMENITQR3dnXAQR56o5wr4V0NBW99UGwoieTKWB8g2Dfx1Oni7VucMOsGQ23T4/BYcn+8yaQD3cvM0MaL0UwHY2q2S/Y5q0/Y9ah2VdAWrikridDEtQonQ3RrGh4LAlmMnnvh4UmgAtBQWTZ7IPB/S7ScX0/V4WMGLnf4CBFGZXV54epL1kO32r9Vr7/HKfRuYYMkpE1TP7g9Co1MOxZieliLH2cMUZ2EO3niQwumBeJS6gyLptInTnckkoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ft+lreCixcMUMH0Zc1yPqDd0lnChZ3cmDDQLk6vYaZw=;
 b=vRVMEaywKqi3HjjPN3KHSHL+DaKwSKPQbbUlMx2UUbYIJLgZMY74MTszupw9TgcZI6qa0s0FQc+s0GIdGd6im00ILyqFIkSI5TmTh9k2RpiqJKD4ZxmjjpY/EI/vw7k3VJxFVNl8M6+WKT56F3eR/VwRkvH/uMZ72iB4G5mPiKcvWQZB2n/05diWawrfSQm9gsHXkZUibepJhkkq5n5xQ+ojgKaD6Hfh+bbCy0mO/ndJ0gsrQ34wVUENek6zCuzuAsjBcSutL+4+BxdC2tgpm2IWZOH4G6MRg8+kCoxh7RhvEH2NVCix7Snf46WPh1msZt+w+CWPzkNjuYR2RgxnPQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 3/5] arm/sysctl: Implement cpu hotplug ops
Thread-Topic: [PATCH v6 3/5] arm/sysctl: Implement cpu hotplug ops
Thread-Index: AQHcsgQgazJGD0vsMEiWnzOogqs2jLW8BwkAgAZA4oA=
Date: Fri, 27 Mar 2026 10:39:23 +0000
Message-ID: <eb459343-12a2-4fc1-b26c-efe4fa636aa9@epam.com>
References: <cover.1773307749.git.mykyta_poturai@epam.com>
 <206261ba0b60ebcff25e083c22d9e9b885645199.1773307749.git.mykyta_poturai@epam.com>
 <be38f4ce-48f8-459c-9bfc-caa60794a652@suse.com>
In-Reply-To: <be38f4ce-48f8-459c-9bfc-caa60794a652@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PA6PR03MB10548:EE_
x-ms-office365-filtering-correlation-id: 3128dad8-b54b-4868-4374-08de8bed1ce5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 Lr2VYan5T5MbBuYYyYFu9suijTWPpfNOKnbRjkk7+W0ofyaf238zxFzmzkgocXE6lYp1bkvg2gW1QkEUjCe1TR9Eqi5ipSEuxAntTU6X1GS1FM+7QPuF94JKcIQ+rPDO+uFbkNQShhvE6S0kRLrMl5ZJxbcnJPvBlKYJmQGuUdbmRx67nsGRdFEkturln3vyC/cSEIwerHNDXQrWCR4RKYHtc//wC8SHYD/gYkE0K676msR3AVVV3XtugM0RWfrHMqFyt2FAxoA+Um6rmZu6izM1pXp3briXZSdvEo4kCPiAO20HpOqNU8q/R8g5XdaK+GHBWYoOlXqJYySrSebasiA1LEtq6xQJT5/2QAHR9k1mK4T9SlSajfaNutlcepLbmveQA8zotqBx2331+ZZfy+ggFbhQq8JRzfpnIUwEhJdzy6eOMeArfKuuVWlcD61jTGwddfT0UsWcVOlodCkZR+As8SPtvB8+JTAQDgsvIPLmQ8rp/aaBAeDMOOJ+nbfFYN0iS8BHqHbrdaZW/IGx0JU2lQOiGvNv7NyOZN0UBWw4/OTjCirHoupnJsvHPKH27mvlyQQPRGgyN/GvurjLtP8CFRenakvVIAocfDFI4f2hvExOphHSWATGPkFd+2GoQGun9279EGTMLu60ra5xNJ11IqovYpmRo2K2b/m9r52R1WWknw/gjmPLBzfGzabZRAHy9wpURr+pPHrDPqUB8mqZa0C979xKjBTBPt1UAkYqwXGzBxjj2RWNNF/2/zQFFkoHsGwJjjPzvxjAbRZ+9WXsPXez78d2otR1CdGbDnA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?alVUUER0OUtUTUp0ZHQvZzRQbDlvVjgyQmdsUHZrWXhldVI2RG9kNkVxcUdJ?=
 =?utf-8?B?blh0aUhXTmYyV2N2dkIvZmdXZnNScUNVTXRQb1B1aEQ5cFdNOXZ6YTV4Nk5a?=
 =?utf-8?B?MG0zalJISTNINmFVYm5EVVZjQ3MzUm40WmlmWEF0V1ZoR0Zja1M0bGN6SzE5?=
 =?utf-8?B?T3Vvakd5RUV0SGc4Nk5ETVJWVEVmT214NlMzaUxoSTY4L240M3lSSnhoaTVs?=
 =?utf-8?B?dEcrV1IzZUJ5M21ZcHRBU04xRjRFVVNPMkh2eW1DbGY5cUdnZVJKZW9BZUNH?=
 =?utf-8?B?Z3RkUTlqZC9qRmpFdmhjcTM2TXdFbzBPbFpidis3Z2xSNWRYOS9LVGxrZzM0?=
 =?utf-8?B?d3hnUmZwZWcxd1FBNXVNcHBubVplMGdFTCtzWnZBTlk4cGJUVXBBZWlzRlcv?=
 =?utf-8?B?Y0h4RUtwdnFXWVlDUjRSNVhtdVdwNjlzL0ZsVm9LSy9mekZHZWpXVlM5elBQ?=
 =?utf-8?B?OUswVGRzYWovZk8rdVJseHpCN2pqd2QrQmlDYVFpNytJWXUvYkhUbnpYZDlU?=
 =?utf-8?B?R0VyR2JPdG1IZ29BUXlBVzRJRUxucUhDYi9NUXBiTTJOaWpLT1NrUFlDOXZB?=
 =?utf-8?B?Q1RTWkdGY3hiUFp0ZGs3SlpoVS9EYmhNU0VlL1p1UmVyOHU3N01IRXZ5ZGEv?=
 =?utf-8?B?ZWN1d1cyVEFWWDd1ZFNNOTdIdTI5aWMrb1RuVDNaZXk5V0QyaWdidGNYSGx6?=
 =?utf-8?B?RmZLZXE5TnJEK0I5TjZxODBGYklRTUxQNExNTWdkTVB4WnB2SkFzdUx1Wk1r?=
 =?utf-8?B?TmluS3ZYdm1HUCtBZUhHUUNxaFVacFAzZFlLL1ZHWGpGSnhIaGU1ODhXRzRu?=
 =?utf-8?B?d1F0UFd4U2MxckhnM3pyaGxodkxhRUl4M2puVVZJZHIwZkdVQWJJTFhKZWcy?=
 =?utf-8?B?QVJVWk9NQ1UxL1RBZXJsYUNGOFlSeE01TS8rNXlWRU5kT0s3bUcweU5NbTM3?=
 =?utf-8?B?WkkxbmZXRGNzTWwwVEdMTEFDYmtKbGp6VHh6eVB2emxJeFdkQWNiKzdDZ04x?=
 =?utf-8?B?VUs3QmZMWTh1YUtkUmtLSnF0eVZHaDBrdmZONzhQUG12OXF6MmVIcmRDSExQ?=
 =?utf-8?B?WTFNN0NSSm5pcFBWalhyTmx2bFVLV1hRY25VQk8wZHVHclV5S09HUmV1eHBJ?=
 =?utf-8?B?ZVFWVWV1NUxwZ210UnNQaC9uNGt3WGY4NXZqNUYvZEZxc2lkMlgyYlAwMGtO?=
 =?utf-8?B?OE5ZcHpaemRGMFVIdzlMU2h6Q2Iva0x2Njd6ejFsclAyTTRnbUIvOTI5TmNv?=
 =?utf-8?B?ZngrZUFvUzl1UU9QajQxOGtudzJOamxDODVlS2Z6RHRpZUNRYlIycXp5TUJJ?=
 =?utf-8?B?SEtBdFI4OGdPZHZxVDhlY1NheXk3SUprdjZtdDJRTVNJMlRPOVZieGlHRXZv?=
 =?utf-8?B?aUdCTklnUjEzYkZSTngzdkFDWVhiZGVWa05PcGpXWDc4WmFyTzF4SWxxTk9L?=
 =?utf-8?B?aFlSRFM0dXFaQjZ1MDdrTjhzZGtvcE1LWmVua0gweDROSnhnZStTazVRNEpT?=
 =?utf-8?B?SjVkUzNLREtRZXIvcFhYeTVhR3I2d05tMG1ZZDBrMWdvM3BkS1BFYks2Vldp?=
 =?utf-8?B?bmcyZUt1SFp0NmpYVDFkM3ZUQld3UmJUbGR0RThxTUNlaEp6bEw4bDdnbjY2?=
 =?utf-8?B?MkFpdy9PSXJZZUdySEIrOEd6eUtFV3paY3BVQXBEVUZjZEJxRldLaEZJUVJ6?=
 =?utf-8?B?NmVpcHNEaUhNRkFOT2l4U1BNaWdWRjlsdlpCR29QNHpONXg2SHZjbno0OGk0?=
 =?utf-8?B?K3FscmV3WVpzRXJhdENVZHlWUkd4TEpwL2hNdVZlOVNNblQ3WHArQkpPMzhi?=
 =?utf-8?B?ZzZ2VkpZZHJISmMrMVpMamRCMDJtWjhhajk0cXJxbHZ4VVh0dGhoVmw3cC91?=
 =?utf-8?B?UG9mKzNON0Z6Qm5LakxSZGtGeDB2Y2VoTHpDeHpmUldlbzNvS2c0UGJ5emlx?=
 =?utf-8?B?Z0Y1UXpJTGRtQmtUVU5LbmJDZTJSbGs4ZUwwY2xqeVpJNm44eC94NVFNcXNm?=
 =?utf-8?B?TmxHZFhJRXdyVVg4bXJmV0lCbjhDQitKVDJNN0g3MG56d1FsMCtqanh2WU0v?=
 =?utf-8?B?UEhxNWNaUTFka0Q2R0ROR29xWTgrV0dVRE5iUkV2K3BKcUFwemRxM0FRa3hN?=
 =?utf-8?B?MmNUdThXSEc2SlJtY1hZdkxwczVkL1lMNWxSZndscWFTeUwzZ2lscjY0dHRs?=
 =?utf-8?B?UzJ0QUZId056dUlDWkpNeUx0Ym4rUkxIODFkbXFnOTBMdDhidkRMOUFtMnV4?=
 =?utf-8?B?bk5lTkRrcFVySGhENTBqTHdMTU9pUFM1Ly9lbitEeGZFN01lTFoxMVJqc1hl?=
 =?utf-8?B?VEZEQlEvWk9yOEp6NzJwREFqZ0RpanZBdkh2eWUwcE9LbGgzbVBra25QZFVH?=
 =?utf-8?Q?24HH9GMOB9BcIyys=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A32E41926C63B84F80C15BD86860B4B1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3128dad8-b54b-4868-4374-08de8bed1ce5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2026 10:39:24.1244
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WbWOtawpt6F3vCm0uv1naGEyyEiOQBCwaAxdxqK0RgchMri+AstTXNRFkEgP+NKldp+4auIMXV8jRNxqvqendg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR03MB10548
X-purgate-ID: tlsNG-ef75cf/1774607967-4FAA5303-A7DC4345/0/0
X-purgate-type: clean
X-purgate-size: 12086
X-Spamd-Result: default: False [0.41 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,raptorengineering.com,wdc.com,gmail.com,apertussolutions.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,support.md:url,epam.com:dkim,epam.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.128];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EEB81342B51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8yMy8yNiAxMzowOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDEyLjAzLjIwMjYgMTA6
MzksIE15a3l0YSBQb3R1cmFpIHdyb3RlOg0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3NtcC5jDQo+
PiArKysgYi94ZW4vYXJjaC9hcm0vc21wLmMNCj4+IEBAIC00NCw2ICs0NCwxNSBAQCB2b2lkIHNt
cF9zZW5kX2NhbGxfZnVuY3Rpb25fbWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2spDQo+PiAgICAg
ICB9DQo+PiAgIH0NCj4+ICAgDQo+PiArLyoNCj4+ICsgKiBXZSBjdXJyZW50bHkgZG9uJ3Qgc3Vw
cG9ydCBTTVQgb24gQVJNIHNvIHdlIGRvbid0IG5lZWQgYW55IHNwZWNpYWwgbG9naWMgZm9yDQo+
PiArICogQ1BVIGRpc2FibGluZw0KPj4gKyAqLw0KPj4gK2Jvb2wgYXJjaF9jcHVfY2FuX3N0YXlf
b25saW5lKHVuc2lnbmVkIGludCBjcHUpDQo+PiArew0KPj4gKyAgICByZXR1cm4gdHJ1ZTsNCj4+
ICt9DQo+IA0KPiBTb21ldGhpbmcgYXMgc2ltcGxlIGFzIHRoaXMgd291bGQgYmUgbmljZSB0byBi
ZSBhbiBpbmxpbmUgZnVuY3Rpb24gKG9yLCBsZXNzDQo+IGRlc2lyYWJseSwgYSBtYWNybykuDQo+
IA0KPj4gLS0tIGEveGVuL2FyY2gveDg2L3BsYXRmb3JtX2h5cGVyY2FsbC5jDQo+PiArKysgYi94
ZW4vYXJjaC94ODYvcGxhdGZvcm1faHlwZXJjYWxsLmMNCj4+IEBAIC03MzUsNiArNzM1LDEyIEBA
IHJldF90IGRvX3BsYXRmb3JtX29wKA0KPj4gICAgICAgew0KPj4gICAgICAgICAgIGludCBjcHUg
PSBvcC0+dS5jcHVfb2wuY3B1aWQ7DQo+PiAgIA0KPj4gKyAgICAgICAgaWYgKCAhSVNfRU5BQkxF
RChDT05GSUdfQ1BVX0hPVFBMVUcpICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICBy
ZXQgPSAtRU9QTk9UU1VQUDsNCj4+ICsgICAgICAgICAgICBicmVhazsNCj4+ICsgICAgICAgIH0N
Cj4+ICsNCj4+ICAgICAgICAgICByZXQgPSB4c21fcmVzb3VyY2VfcGx1Z19jb3JlKFhTTV9IT09L
KTsNCj4+ICAgICAgICAgICBpZiAoIHJldCApDQo+PiAgICAgICAgICAgICAgIGJyZWFrOw0KPj4g
QEAgLTc2MSw2ICs3NjcsMTIgQEAgcmV0X3QgZG9fcGxhdGZvcm1fb3AoDQo+PiAgICAgICB7DQo+
PiAgICAgICAgICAgaW50IGNwdSA9IG9wLT51LmNwdV9vbC5jcHVpZDsNCj4+ICAgDQo+PiArICAg
ICAgICBpZiAoICFJU19FTkFCTEVEKENPTkZJR19DUFVfSE9UUExVRykgKQ0KPj4gKyAgICAgICAg
ew0KPj4gKyAgICAgICAgICAgIHJldCA9IC1FT1BOT1RTVVBQOw0KPj4gKyAgICAgICAgICAgIGJy
ZWFrOw0KPj4gKyAgICAgICAgfQ0KPj4gKw0KPj4gICAgICAgICAgIHJldCA9IHhzbV9yZXNvdXJj
ZV91bnBsdWdfY29yZShYU01fSE9PSyk7DQo+PiAgICAgICAgICAgaWYgKCByZXQgKQ0KPj4gICAg
ICAgICAgICAgICBicmVhazsNCj4gDQo+IEkgd29uZGVyIHdoZXRoZXIgb24geDg2IHRoaXMgcmVh
bGx5IHNob3VsZCBiZWNvbWUgYW4gb3B0aW9uYWwgdGhpbmcgKGFuZA0KPiBpZiBzbywgd2hldGhl
ciB0aGF0IHdvdWxkbid0IGJldHRlciBiZSBhIHNlcGFyYXRlIGNoYW5nZSB3aXRoIHByb3Blcg0K
PiBqdXN0aWZpY2F0aW9uKS4gU2VlIGFsc28gdGhlIGNvbW1lbnQgb24gY29tbW9uL0tjb25maWcg
ZnVydGhlciBkb3duIC0gYnkNCj4gdGhlIG5hbWUgb2YgdGhlIG9wdGlvbiwgYW5kIGdpdmVuIHRo
ZSBzdXBwb3J0IHN0YXR1cyB0aGUgY2hhbmdlIGFib3ZlIG1heQ0KPiBiZSBsZWdpdGltYXRlLCBi
dXQgbm90IHNvbWUgb2YgdGhlIHNpbWlsYXIgcmVzdHJpY3Rpb25zIGFkZGVkIGVsc2V3aGVyZS4N
Cj4gDQoNCk1heWJlIGZvcmNlIGl0IHRvIGJlIGFsd2F5cyBvbiBsaWtlIHg4NiB0aGVuPyBJIGRv
bid0IHJlYWxseSBoYXZlIGEgDQpqdXN0aWZpY2F0aW9uIGZvciBtYWtpbmcgaXQgb3B0aW9uYWwg
b24geDg2LCBpdCBqdXN0IGhhcHBlbmVkIGFzIHNpZGUgDQplZmZlY3Qgb2YgY3JlYXRpbmcgYSBj
b25maWcgb3B0aW9uLg0KDQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvc21wLmMNCj4+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9zbXAuYw0KPj4gQEAgLTQxOCwzNSArNDE4LDggQEAgdm9pZCBjZl9jaGVjayBj
YWxsX2Z1bmN0aW9uX2ludGVycnVwdCh2b2lkKQ0KPj4gICAgICAgc21wX2NhbGxfZnVuY3Rpb25f
aW50ZXJydXB0KCk7DQo+PiAgIH0NCj4+ICAgDQo+PiAtbG9uZyBjZl9jaGVjayBjcHVfdXBfaGVs
cGVyKHZvaWQgKmRhdGEpDQo+PiArYm9vbCBhcmNoX2NwdV9jYW5fc3RheV9vbmxpbmUodW5zaWdu
ZWQgaW50IGNwdSkNCj4+ICAgew0KPj4gLSAgICB1bnNpZ25lZCBpbnQgY3B1ID0gKHVuc2lnbmVk
IGxvbmcpZGF0YTsNCj4+IC0gICAgaW50IHJldCA9IGNwdV91cChjcHUpOw0KPj4gLQ0KPj4gLSAg
ICAvKiBIYXZlIG9uZSBtb3JlIGdvIG9uIEVCVVNZLiAqLw0KPj4gLSAgICBpZiAoIHJldCA9PSAt
RUJVU1kgKQ0KPj4gLSAgICAgICAgcmV0ID0gY3B1X3VwKGNwdSk7DQo+PiAtDQo+PiAtICAgIGlm
ICggIXJldCAmJiAhb3B0X3NtdCAmJg0KPj4gLSAgICAgICAgIGNwdV9kYXRhW2NwdV0uY29tcHV0
ZV91bml0X2lkID09IElOVkFMSURfQ1VJRCAmJg0KPj4gLSAgICAgICAgIGNwdW1hc2tfd2VpZ2h0
KHBlcl9jcHUoY3B1X3NpYmxpbmdfbWFzaywgY3B1KSkgPiAxICkNCj4+IC0gICAgew0KPj4gLSAg
ICAgICAgcmV0ID0gY3B1X2Rvd25faGVscGVyKGRhdGEpOw0KPj4gLSAgICAgICAgaWYgKCByZXQg
KQ0KPj4gLSAgICAgICAgICAgIHByaW50aygiQ291bGQgbm90IHJlLW9mZmxpbmUgQ1BVJXUgKCVk
KVxuIiwgY3B1LCByZXQpOw0KPj4gLSAgICAgICAgZWxzZQ0KPj4gLSAgICAgICAgICAgIHJldCA9
IC1FUEVSTTsNCj4+IC0gICAgfQ0KPj4gLQ0KPj4gLSAgICByZXR1cm4gcmV0Ow0KPj4gLX0NCj4+
IC0NCj4+IC1sb25nIGNmX2NoZWNrIGNwdV9kb3duX2hlbHBlcih2b2lkICpkYXRhKQ0KPj4gLXsN
Cj4+IC0gICAgaW50IGNwdSA9ICh1bnNpZ25lZCBsb25nKWRhdGE7DQo+PiAtICAgIGludCByZXQg
PSBjcHVfZG93bihjcHUpOw0KPj4gLSAgICAvKiBIYXZlIG9uZSBtb3JlIGdvIG9uIEVCVVNZLiAq
Lw0KPj4gLSAgICBpZiAoIHJldCA9PSAtRUJVU1kgKQ0KPj4gLSAgICAgICAgcmV0ID0gY3B1X2Rv
d24oY3B1KTsNCj4+IC0gICAgcmV0dXJuIHJldDsNCj4+ICsgICAgcmV0dXJuIG9wdF9zbXQgfHwg
Y3B1X2RhdGFbY3B1XS5jb21wdXRlX3VuaXRfaWQgIT0gSU5WQUxJRF9DVUlEIHx8DQo+PiArICAg
ICAgICAgICBjcHVtYXNrX3dlaWdodChwZXJfY3B1KGNwdV9zaWJsaW5nX21hc2ssIGNwdSkpIDw9
IDE7DQo+PiAgIH0NCj4gDQo+IFVubGlrZSBmb3IgQXJtLCB0aGlzIG1heSBpbmRlZWQgYmV0dGVy
IGJlIGFuIG91dC1vZi1saW5lIGZ1bmN0aW9uLg0KPiANCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9z
eXNjdGwuYw0KPj4gKysrIGIveGVuL2FyY2gveDg2L3N5c2N0bC5jDQo+PiBAQCAtNDksNiArNDks
NyBAQCBzdGF0aWMgdm9pZCBjZl9jaGVjayBsM19jYWNoZV9nZXQodm9pZCAqYXJnKQ0KPj4gICAN
Cj4+ICAgc3RhdGljIGxvbmcgY2ZfY2hlY2sgc210X3VwX2Rvd25faGVscGVyKHZvaWQgKmRhdGEp
DQo+PiAgIHsNCj4+ICsgICAgI2lmZGVmIENPTkZJR19DUFVfSE9UUExVRw0KPj4gICAgICAgYm9v
bCB1cCA9IChib29sKWRhdGE7DQo+PiAgICAgICB1bnNpZ25lZCBpbnQgY3B1LCBzaWJsaW5nX21h
c2sgPSBib290X2NwdV9kYXRhLng4Nl9udW1fc2libGluZ3MgLSAxOw0KPj4gICAgICAgaW50IHJl
dCA9IDA7DQo+PiBAQCAtODksNiArOTAsOCBAQCBzdGF0aWMgbG9uZyBjZl9jaGVjayBzbXRfdXBf
ZG93bl9oZWxwZXIodm9pZCAqZGF0YSkNCj4+ICAgICAgICAgICAgICAgICAgdXAgPyAiZW5hYmxl
ZCIgOiAiZGlzYWJsZWQiLCBDUFVNQVNLX1BSKCZjcHVfb25saW5lX21hcCkpOw0KPj4gICANCj4+
ICAgICAgIHJldHVybiByZXQ7DQo+PiArICAgICNlbmRpZiAvKiBDT05GSUdfQ1BVX0hPVFBMVUcg
Ki8NCj4+ICsgICAgcmV0dXJuIDA7DQo+PiAgIH0NCj4gDQo+IFRoZSAjLWVzIG9yIHByZS1wcm9j
ZXNzb3IgZGlyZWN0aXZlcyB3YW50IHRvIGJlIGluIHRoZSB2ZXJ5IGZpcnN0IGNvbHVtbi4NCj4g
DQo+IFNoYXJpbmcgInJldHVybiByZXQiIHdvdWxkIGFsc28gYmUgbmljZSwgaW1vLiBXb3VsZCBy
ZXF1aXJlIHJldCdzIGRlY2wgdG8NCj4gbW92ZSBhaGVhZCBvZiB0aGUgI2lmZGVmLiBBY3R1YWxs
eSAtIGlzIHRoZXJlIGFueXRoaW5nIHByZXZlbnRpbmcNCj4gDQo+ICAgICAgaWYgKCAhSVNfRU5B
QkxFRChDT05GSUdfQ1BVX0hPVFBMVUcpICkNCj4gICAgICAgICAgcmV0dXJuIDA7DQo+IA0KPiBh
dCB0aGUgdG9wIG9mIHRoZSBmdW5jdGlvbj8gUGVyaGFwcyBldmVuIHdpdGggQVNTRVJUX1VOUkVB
Q0hBQkxFKCkgYWRkZWQNCj4gaW4/DQo+IA0KPj4gQEAgLTExNSwyNCArMTE4LDI0IEBAIGxvbmcg
YXJjaF9kb19zeXNjdGwoDQo+PiAgIA0KPj4gICAgICAgY2FzZSBYRU5fU1lTQ1RMX2NwdV9ob3Rw
bHVnOg0KPj4gICAgICAgew0KPj4gLSAgICAgICAgdW5zaWduZWQgaW50IGNwdSA9IHN5c2N0bC0+
dS5jcHVfaG90cGx1Zy5jcHU7DQo+PiAgICAgICAgICAgdW5zaWduZWQgaW50IG9wICA9IHN5c2N0
bC0+dS5jcHVfaG90cGx1Zy5vcDsNCj4+ICAgICAgICAgICBib29sIHBsdWc7DQo+PiAgICAgICAg
ICAgbG9uZyAoKmZuKSh2b2lkICpkYXRhKTsNCj4+ICAgICAgICAgICB2b2lkICpoY3B1Ow0KPj4g
ICANCj4+IC0gICAgICAgIHN3aXRjaCAoIG9wICkNCj4+ICsgICAgICAgIGlmICggIUlTX0VOQUJM
RUQoQ09ORklHX0NQVV9IT1RQTFVHKSApDQo+PiAgICAgICAgICAgew0KPj4gLSAgICAgICAgY2Fz
ZSBYRU5fU1lTQ1RMX0NQVV9IT1RQTFVHX09OTElORToNCj4+IC0gICAgICAgICAgICBwbHVnID0g
dHJ1ZTsNCj4+IC0gICAgICAgICAgICBmbiA9IGNwdV91cF9oZWxwZXI7DQo+PiAtICAgICAgICAg
ICAgaGNwdSA9IF9wKGNwdSk7DQo+PiArICAgICAgICAgICAgcmV0ID0gLUVPUE5PVFNVUFA7DQo+
PiAgICAgICAgICAgICAgIGJyZWFrOw0KPiANCj4gQVNTRVJUX1VOUkVBQ0hBQkxFKCkgbG9va3Mg
dG8gYWxzbyBiZSB2YWxpZCB0byBiZSBhZGRlZCBoZXJlLCBzZWVpbmcgaG93DQo+IGRvX3N5c2N0
bCgpIG5vdyB3b3Jrcy4NCj4gDQo+PiAtLS0gYS94ZW4vY29tbW9uL0tjb25maWcNCj4+ICsrKyBi
L3hlbi9jb21tb24vS2NvbmZpZw0KPj4gQEAgLTYzNyw2ICs2MzcsMTIgQEAgY29uZmlnIFNZU1RF
TV9TVVNQRU5EDQo+PiAgIA0KPj4gICAJICBJZiB1bnN1cmUsIHNheSBOLg0KPj4gICANCj4+ICtj
b25maWcgQ1BVX0hPVFBMVUcNCj4+ICsJYm9vbCAiRW5hYmxlIENQVSBob3RwbHVnIg0KPiANCj4g
SSdtIG5vdCBoYXBweSB3aXRoIHRoaXMgcHJvbXB0LiBGb3IgeDg2IFNVUFBPUlQubWQgZGVjbGFy
ZXMgKEFDUEkpIENQVQ0KPiBob3RwbHVnIGFzIGV4cGVyaW1lbnRhbC4gVGhhdCdzIHBoeXNpY2Fs
IGhvdHBsdWcuIFRoZSBjb2RlIHlvdSdyZQ0KPiBmaWRkbGluZyB3aXRoLCBob3dldmVyLCBpcyBh
bHNvIHVzZWQgZm9yIHNvZnQte29mZixvbn1saW5pbmcuIFdoaWNoLA0KPiBlLmcuIHRvIGRpc2Fi
bGUgU01UIG9uIHg4NiwgbWF5IG5lZWQgdG8gYmUgdXNlZCBmb3Igc2VjdXJpdHkgcHVycG9zZXMu
DQo+IA0KPj4gKwlkZXBlbmRzIG9uIChYODYgfHwgQVJNXzY0KSAmJiAhRkZBICYmICFURUUgJiYg
IUhBU19JVFMNCj4gDQo+IFdoYXQgaWYgb24geDg2IEZGQSwgVEVFLCBvciBJVFMgZ2FpbiBhIG1l
YW5pbmc/DQo+IA0KPj4gKwlkZWZhdWx0IHkNCj4+ICsNCj4+ICsNCj4gDQo+IE5pdDogTm8gZG91
YmxlIGJsYW5rIGxpbmVzIHBsZWFzZS4NCj4gDQo+PiAtLS0gYS94ZW4vY29tbW9uL3N5c2N0bC5j
DQo+PiArKysgYi94ZW4vY29tbW9uL3N5c2N0bC5jDQo+PiBAQCAtNDgzLDYgKzQ4Myw1MiBAQCBs
b25nIGRvX3N5c2N0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9zeXNjdGxfdCkgdV9zeXNj
dGwpDQo+PiAgICAgICAgICAgICAgIGNvcHliYWNrID0gMTsNCj4+ICAgICAgICAgICBicmVhazsN
Cj4+ICAgDQo+PiArICAgIGNhc2UgWEVOX1NZU0NUTF9jcHVfaG90cGx1ZzoNCj4+ICsgICAgew0K
Pj4gKyAgICAgICAgdW5zaWduZWQgaW50IGNwdSA9IG9wLT51LmNwdV9ob3RwbHVnLmNwdTsNCj4g
DQo+IEkgZG9uJ3QgdGhpbmsgdGhpcyB2YXJpYWJsZSBpcyB2ZXJ5IHVzZWZ1bCB0byBrZWVwLiBJ
bnN0ZWFkIHVzZSAuLi4NCj4gDQo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgaHBfb3AgPSBvcC0+
dS5jcHVfaG90cGx1Zy5vcDsNCj4+ICsgICAgICAgIGJvb2wgcGx1ZzsNCj4+ICsgICAgICAgIGxv
bmcgKCpmbikodm9pZCAqZGF0YSk7DQo+PiArICAgICAgICB2b2lkICpoY3B1Ow0KPiANCj4gICAg
ICAgICAgdm9pZCAqaGNwdSA9IF9wKG9wLT51LmNwdV9ob3RwbHVnLm9wKTsNCj4gDQo+IHJpZ2h0
IGhlcmUsIGRyb3BwaW5nIHRoZSBhc3NpZ25tZW50cyBmdXJ0aGVyIGRvd24uDQo+IA0KPj4gKyAg
ICAgICAgcmV0ID0gLUVPUE5PVFNVUFA7DQo+PiArICAgICAgICBpZiAoICFJU19FTkFCTEVEKENP
TkZJR19DUFVfSE9UUExVRykgKQ0KPj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4gKw0KPj4gKyAg
ICAgICAgc3dpdGNoICggaHBfb3AgKQ0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAgY2FzZSBY
RU5fU1lTQ1RMX0NQVV9IT1RQTFVHX09OTElORToNCj4+ICsgICAgICAgICAgICBwbHVnID0gdHJ1
ZTsNCj4+ICsgICAgICAgICAgICBmbiA9IGNwdV91cF9oZWxwZXI7DQo+PiArICAgICAgICAgICAg
aGNwdSA9IF9wKGNwdSk7DQo+PiArICAgICAgICAgICAgYnJlYWs7DQo+PiArDQo+PiArICAgICAg
ICBjYXNlIFhFTl9TWVNDVExfQ1BVX0hPVFBMVUdfT0ZGTElORToNCj4+ICsgICAgICAgICAgICBw
bHVnID0gZmFsc2U7DQo+PiArICAgICAgICAgICAgZm4gPSBjcHVfZG93bl9oZWxwZXI7DQo+PiAr
ICAgICAgICAgICAgaGNwdSA9IF9wKGNwdSk7DQo+PiArICAgICAgICAgICAgYnJlYWs7DQo+PiAr
DQo+PiArICAgICAgICBkZWZhdWx0Og0KPj4gKyAgICAgICAgICAgIGZuID0gTlVMTDsNCj4+ICsg
ICAgICAgICAgICBicmVhazsNCj4+ICsgICAgICAgIH0NCj4+ICsNCj4+ICsgICAgICAgIGlmICgg
Zm4gKQ0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAgICAgIHJldCA9IHBsdWcgPyB4c21fcmVz
b3VyY2VfcGx1Z19jb3JlKFhTTV9IT09LKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgOiB4
c21fcmVzb3VyY2VfdW5wbHVnX2NvcmUoWFNNX0hPT0spOw0KPj4gKw0KPj4gKyAgICAgICAgICAg
IGlmICggIXJldCApDQo+PiArICAgICAgICAgICAgICAgIHJldCA9IGNvbnRpbnVlX2h5cGVyY2Fs
bF9vbl9jcHUoMCwgZm4sIGhjcHUpOw0KPj4gKw0KPj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4g
KyAgICAgICAgfQ0KPj4gKw0KPj4gKyAgICAgICAgLyogVXNlIHRoZSBhcmNoIGhhbmRsZXIgZm9y
IGNhc2VzIG5vdCBoYW5kbGVkIGhlcmUgKi8NCj4+ICsgICAgICAgIGZhbGx0aHJvdWdoOw0KPj4g
KyAgICB9DQo+PiArDQo+PiAgICAgICBkZWZhdWx0Og0KPj4gICAgICAgICAgIHJldCA9IGFyY2hf
ZG9fc3lzY3RsKG9wLCB1X3N5c2N0bCk7DQo+PiAgICAgICAgICAgY29weWJhY2sgPSAwOw0KPiAN
Cj4gVGhpcyBmb3JtIG9mIGZhbGxpbmcgdGhyb3VnaCBtYXkgYmUgYSBsaXR0bGUgcmlza3ksIHRv
d2FyZHMgc29tZW9uZSBub3QNCj4gbG9va2luZyBjbG9zZWx5IGVub3VnaCBhbmQgaW5zZXJ0aW5n
IGFub3RoZXIgY2FzZSBsYWJlbCBpbW1lZGlhdGVseSBhaGVhZA0KPiBvZiB0aGUgZGVmYXVsdCBv
bmUuIFdoaWxlIEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBhIHJlYWxseSBnb29kIHNvbHV0aW9uIHRv
DQo+IHRoaXMsIHBsZWFzZSBjb25zaWRlcg0KPiANCj4gICAgICB9DQo+ICAgICAgICAgIC8qIFVz
ZSB0aGUgYXJjaCBoYW5kbGVyIGZvciBjYXNlcyBub3QgaGFuZGxlZCBhYm92ZSAqLw0KPiAgICAg
ICAgICBmYWxsdGhyb3VnaDsNCj4gICAgICBkZWZhdWx0Og0KPiANCj4gaW5zdGVhZC4NCj4gDQoN
Ckp1c3Qgd2FudCB0byBjbGFyaXJmeSBpZiBJIGdvdCB0aGUgaWRlYS4gSXMgdGhpcyB3aGF0IHlv
dSBtZWFudD8NCg0KICAgICBzd2l0Y2ggKCBvcC0+Y21kICkNCiAgICAgew0KICAgICAuLi4uDQog
ICAgIGNhc2UgWEVOX1NZU0NUTF9jcHVfaG90cGx1ZzoNCiAgICAgew0KICAgICAuLi4uDQogICAg
IH0NCg0KICAgICAgICAgLyogVXNlIHRoZSBhcmNoIGhhbmRsZXIgZm9yIGNhc2VzIG5vdCBoYW5k
bGVkIGhlcmUgKi8NCiAgICAgICAgIGZhbGx0aHJvdWdoOw0KICAgICBkZWZhdWx0Og0KICAgICAg
ICAgcmV0ID0gYXJjaF9kb19zeXNjdGwob3AsIHVfc3lzY3RsKTsNCiAgICAgICAgIGNvcHliYWNr
ID0gMDsNCiAgICAgICAgIGJyZWFrOw0KICAgICB9DQoNCg0KPj4gLS0tIGEveGVuL3hzbS9mbGFz
ay9ob29rcy5jDQo+PiArKysgYi94ZW4veHNtL2ZsYXNrL2hvb2tzLmMNCj4+IEBAIC04MzUsNyAr
ODM1LDcgQEAgc3RhdGljIGludCBjZl9jaGVjayBmbGFza19zeXNjdGwoaW50IGNtZCkNCj4+ICAg
ICAgIGNhc2UgWEVOX1NZU0NUTF9nZXRkb21haW5pbmZvbGlzdDoNCj4+ICAgICAgIGNhc2UgWEVO
X1NZU0NUTF9wYWdlX29mZmxpbmVfb3A6DQo+PiAgICAgICBjYXNlIFhFTl9TWVNDVExfc2NoZWR1
bGVyX29wOg0KPj4gLSNpZmRlZiBDT05GSUdfWDg2DQo+PiArI2lmZGVmIENPTkZJR19DUFVfSE9U
UExVRw0KPj4gICAgICAgY2FzZSBYRU5fU1lTQ1RMX2NwdV9ob3RwbHVnOg0KPj4gICAjZW5kaWYN
Cj4+ICAgICAgICAgICByZXR1cm4gMDsNCj4gDQo+IElzIHRoZXJlIGEgcmVhc29uIHRoZSAjaWZk
ZWYgY2FuJ3Qgc2ltcGx5IGJlIGRyb3BwZWQ/DQo+IA0KPiBKYW4NCg0KLS0gDQpNeWt5dGE=

