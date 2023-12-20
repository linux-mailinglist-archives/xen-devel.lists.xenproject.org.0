Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61809819B2D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 10:13:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657484.1026345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsdt-000232-Q2; Wed, 20 Dec 2023 09:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657484.1026345; Wed, 20 Dec 2023 09:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsdt-00020W-Mx; Wed, 20 Dec 2023 09:13:29 +0000
Received: by outflank-mailman (input) for mailman id 657484;
 Wed, 20 Dec 2023 09:13:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=peO6=H7=epam.com=prvs=6718298c4d=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1rFsdr-00020Q-Vt
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 09:13:28 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07c01238-9f18-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 10:13:26 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BK0jDs7001734; Wed, 20 Dec 2023 09:13:19 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3v37kem8r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Dec 2023 09:13:19 +0000 (GMT)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AM7PR03MB6610.eurprd03.prod.outlook.com
 (2603:10a6:20b:1b2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 09:13:15 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::3776:9f2d:8305:b645]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::3776:9f2d:8305:b645%6]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 09:13:15 +0000
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
X-Inumbo-ID: 07c01238-9f18-11ee-98eb-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvZLEOoJFxOz18FiBY/HtGUXW3TbnNU9jQ0wHOND/ywGAB8GFJTTzM88qevIW8soZG3bygUlTi3GfP8IrJ+jPvT1OeCWiIo/+hyF1WLQI+CimBmECXhKB9jzH7uXXyl+AtcIupyvC/2fxHS8v1aVrCEWhT9juF8AE5uHVB1tITLDtOfBnX/o5REFzqbhlKtNVjO89cW4+khD7jMvsUopvgEjO+hyWExORTzxctxNG9v9BLxHAw69W8yEh3Rq/anfex3YpULB2y1wkziIHqbi1P+9v9DD8+Hp/eYk6quApqYpGuAtYWFc24f8EFp16+6X/UKg4qCRWLx5DWmI+mPoow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nYCVnAYq1EfaHbpEnR7bK599CgxUfso7hCZ5+cKRcc=;
 b=QQ+KgTFXGuJVbqcB9oXCf+t4jsS2MlOY+bqYaqiBvuNVPfSCzlTscmCJ0yxttbzlsxPDPVJYJ2G0ZaP2QRKNCNJgFephm0FtPyrjhBJ+8CPQvHJQ8uFMM0R9j1PGatL9Q+ggyMb107gaFQlwIVck9PDnakfsw4mqaoWUZEoFblE3HF3jcRkB+RTdM7xmyHcabbL56lu9jQBq4tTTSNKb2S5r/oNiXaCMIyi+ejAyy97LkSHhxQPUqJYFKvbv51X7lqkQWPMWVVcNLbyFseoIccUzaBtzpqdRuQIqLgPV9XLLwjKCxVNgnbzISP3ffr4bZ9RnKsCPlrtJLzYGmDKa1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nYCVnAYq1EfaHbpEnR7bK599CgxUfso7hCZ5+cKRcc=;
 b=rXwa5Sj6smXLyZZV01P0DtYWr1A0u7NYChfHAG+13YDFSybtWYxd3oCWKgk5rgJuhT2ZWbzRq6xqGrETxoDFyvu2w18aQZqTnMWsmz+aTNNCeSp0j2G/Ud2NOA7AKZVMbFoxIT6QfnPuVu0k7FphsVaCvXarZ3fIJEYFldIU+Nix9vyNCdtAshf2NMHGQUUTNysRh61rFtthxz94ZjB2uUHZdGOLS1dkDZ8TvCbpG5VtzZ2IhGM/lAFbtb1XHHavDM2t6st1A1uapbzLDRQ665ZSjiLWxTFEUO8v3ZUGvkBltYMq324gbXIHIIse9ktUPMWgvSNQfOw5EvIhvgmM5g==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
        Juergen Gross
	<jgross@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH] xen/dm: arm: Introudce arm_inject_msi DM op
Thread-Topic: [RFC PATCH] xen/dm: arm: Introudce arm_inject_msi DM op
Thread-Index: AQHaMoIbfIb6LpTMIEGFPPk7JAqgfbCwp1oAgAAD9ICAAKqEgIAAjq6A
Date: Wed, 20 Dec 2023 09:13:15 +0000
Message-ID: <3a5df135-1bcf-41d7-b489-c5fd938b10d6@epam.com>
References: 
 <6a631756a126e73390f95b9e86c69e3286c92f59.1702991909.git.mykyta_poturai@epam.com>
 <cacbff18-f37d-42dc-ab8c-79409aa1d237@epam.com>
 <13b218b5-2d37-48de-9baa-cf2b99211bde@xen.org>
 <alpine.DEB.2.22.394.2312191641140.3175268@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2312191641140.3175268@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AM7PR03MB6610:EE_
x-ms-office365-filtering-correlation-id: 63935f35-41c7-4a90-b8aa-08dc013be609
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5SzdsAwsPdLkoLkMPDNCCeonK7nnqBvmPL/R+gHJqM8BEZ8Bxa5tNuoXaS8IV9w4u1Afew9wkJU68GRw795ZrEY4gKAtePdcPn1biec2Ok3WbsNr8uAVUpfe1AjcvusyqZmPG/otwp/oVows3wgD6e2wZLVzTwGpqG7nttIfcDrZ1oiMmLFFXlQUdHUmLTRSuQPvnUx9enu5TCePtecnhlQsIf07oI2IpuXBVIjq35/6bW9Dq0F7f2gOwMYLuiqFWwec9kLjJw/k2Vvv+0eMVYbdlsY68u7hI8kpkYWcS8Vt9gv7vbuMBHo3uKTAvkUUz77p3jXnvroP/tKkuB837B1rZWpJdnGmjW8GNTUvLvJpX4xNYi64xVj9+2WZb0Qt0d4obiEogH7ZT8KsCP3Qw59FzQB0gjn4F3s8EKXifl9iEnF3iDxgs/+jvcIsXw31qspd0fKBzWSDpEbczmcEtZdUbPazU8+9EejNrS0sxJuoPhQNaYDQuxlP/sl3+5x/RAIZJcUzToBjro13M2QBJyTYVWxEkj/WrkOeqAHK4tdGLAVw6eQ2foGsMFIh0uWVPIxf2Sd1qv9fUJk5yABBcw7nTl20+jADW3BvnaqSFV/HbYkmc9HgnsZ7zpUQg30DAgosQC01D0cJQbhO1fROsw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(2906002)(31696002)(41300700001)(86362001)(36756003)(38100700002)(122000001)(71200400001)(316002)(478600001)(54906003)(110136005)(6506007)(6512007)(66476007)(8936002)(8676002)(6486002)(66446008)(76116006)(66946007)(66556008)(64756008)(91956017)(4744005)(7416002)(5660300002)(26005)(4326008)(83380400001)(53546011)(2616005)(107886003)(38070700009)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MXRNWXY0REFPSy9xSzdKRHRFR1FRMUJJcmlzeG9nOXZYRnhtSUlBV3hReFVT?=
 =?utf-8?B?dU9kQVB2bEhDMURlWU92TmwzaVdrZ1A4YUZUMDhPNi9DR2N1WjFDUjZnMEQx?=
 =?utf-8?B?dFRsakEwbGRUZm44bnFIZ3UrMXFQazNIc3h5L25LRkRybjhhb1MwMTArOE0r?=
 =?utf-8?B?MElXYW4rRjVXaUNLc1hCN3hhSk8wazVqVUZWbU1GSmRYRVZEWjd4Z1pXVmdw?=
 =?utf-8?B?VnRnMWNoeEFrQ1VtazFpYmt2MzJuVlJWbjlIQmRqa25sNnBCZ0F1ZlM4cHJX?=
 =?utf-8?B?eUZQWUVlbUNSS2V4WTJiYXJTWUlJdHQvdVQ1SXVoNjBiZkFzLzBESlY1cVdQ?=
 =?utf-8?B?U25Iam1sRkxqblcvQ2lpQVpRVlZRbGRKNTd5dWQzSnozT0hHczVEZnRrQ2I0?=
 =?utf-8?B?WW8rT2wwdkNON2RNclBwaHc2Qk4wcG5ZMS9GRGptVnJZSW0wTThyVkNubHpx?=
 =?utf-8?B?TzR6MkpqYmhoQkJSWlZIYThyOWoycGpwZ3NaUDgxWm53VjV3eng3WFZ3aUk1?=
 =?utf-8?B?NnZodGo0L3V1bDM3R0lKSHJ5L2l3a20weERjMHBMM0R4czBnbHlPME5aOUVX?=
 =?utf-8?B?Y2V5QmlBbTl6UEx0MGlSc2p0TERITEhEZlN5YWcyS0N6d2NDZkEyQzlLanJG?=
 =?utf-8?B?OWRNbjQ2UnFYcEU0RDZpdStXdk4rdkFhTDNTNjBuK0M2QldaQWRvejB6VDlV?=
 =?utf-8?B?L25GRTE0bmtPeC95YWxMUGUvRlNRcnUzaGt0TzdZN0ZyOG04a1BzQ2sybFNq?=
 =?utf-8?B?bWRKVm56TkkvQXdTZSsrRW1BbEtRK0dkS3phSXZ5Tld6a3YvcFUrQVB5NjZj?=
 =?utf-8?B?K05XbldiMytyTGRiajlaMDZlcmhPTE0wanVMeU9vWGdsUEpreGs0d0NCaUow?=
 =?utf-8?B?UHk3bUJOQTRRWlpxeVZLczdPRXA2YmtOOG9DazVxS0dpbUJVQmNBeDJKVDFh?=
 =?utf-8?B?b1d6STk3clZHZTgvRFdNS3dSdlFNcXVhWUp3QUs2NlR5WFJQSUV6S0t3UTVG?=
 =?utf-8?B?VDRQOFNlQThQMzdYNGJWdGJNenR1TER1aE5XZDBXRXJNcExTaGY1aG5PUURP?=
 =?utf-8?B?Z3FFWDJackk2VlROVnZYdXJIQWtTRkFhaVVGUUJXMDJuQjQ5NE1NNktGNHEr?=
 =?utf-8?B?anZ0eEVmMW1lc2FCWG9Xb2lIMkpsT09DbERxZ21Ea1UrYjJoK3F0dllYQ0cv?=
 =?utf-8?B?dUp2U0FIUXFSVW1yRmt2bXZGWStNenVGaTlIVDk1U1B6WTF2MGx6Z3FlU0oz?=
 =?utf-8?B?emN0MzNoL3NaZjMzbnZDaHUwNGJOQXBDOUZnQlBCMU96TVRUUUtjQzhxWXF6?=
 =?utf-8?B?a0NLM21SK1dBMTBZYml5WWVJbzNEWFJ4UkVXTmdQSVpJODNoSlpFaHlqRGYx?=
 =?utf-8?B?NXlESnpNZENrbk1NVGlndkxxV2puZkdRbjBJTzgzd1RaM3p5bm1Jd1pMYy9y?=
 =?utf-8?B?b2c1SUNTY011U053WVlxQVNTVjJDNGM5Z25lMDNnaGFmcDdFREVZNWlFNEFy?=
 =?utf-8?B?SDlmcXVURk5xOU9UYkFyYVFJOVIvQVl4T3RRM09OTDBmYmVuSnE5RmpTU2ZZ?=
 =?utf-8?B?TlAxRXFiendockNYdjhsWFl3Sm0vRTkvT2FnMjlnbjNWbUJIbXU0V00xRHNM?=
 =?utf-8?B?QVBwTGY5aWhvdEtybVkzSVV4Mmdlam56U3BaYjNGWDR0U3dpT0Z3eDYxQW1V?=
 =?utf-8?B?WDUwODNYeEZXQnhjK1BQNHR0KzRMaExucFR0UGRYemk3K2NoUlZlZTZ3Tjdz?=
 =?utf-8?B?KzI2WEdSQ2J6SlpteWRGeGY1a3RjT09aVU9xVE15VFBwZjJQbE5VQk4zTWVL?=
 =?utf-8?B?QVJSaFJ6NThCQTc5WU9VK0NLTU5aT1RibDJJQThOQ1VEOVpPZ3pudWxBbTVa?=
 =?utf-8?B?YXB2eVROWFJXMlVHMGsrazVNMWxVNGZxTGdBTEc0ZnluazE1OWoxZHNKYzdC?=
 =?utf-8?B?b0NlaVZnZ0F3ajgrQjhFM0pXeTN4ZzcyVGZhUUdaUnBBNFltZHZzbndEb25Y?=
 =?utf-8?B?ZTZRZjkzYnVNa1RESmg5cWVacU9CcWswV2VTZWV4SjRmbkRrc2NpVkZOeHJC?=
 =?utf-8?B?TFpPcWNVUjUxL3Z5dDFqZjFOcW0zRE1LdFVvekZOK3dFdlFFNEduK2NYZENq?=
 =?utf-8?B?aUNpODR2L3I1cklINjRENGgyN3QrMnpid0hFYWZjQmp0MUtyekgyU0Y5QUlU?=
 =?utf-8?B?c3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF3CE581893F314890C06B473F8D56C2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63935f35-41c7-4a90-b8aa-08dc013be609
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2023 09:13:15.3828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r4spW1RoDY0l++HDO3j/CdgKhCjHQIDqx2GbSXQbjPHmQrbVEEF6bMUqQSuP1LepkzuKcFWiBcqxjHGWteiL2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6610
X-Proofpoint-GUID: _ajNP7Kh__kWJaJp7Tjd5kfVgHsaTd6g
X-Proofpoint-ORIG-GUID: _ajNP7Kh__kWJaJp7Tjd5kfVgHsaTd6g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=823 impostorscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312200064

DQpIaSwNCg0KT24gMjAuMTIuMjMgMDI6NDIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4g
T24gVHVlLCAxOSBEZWMgMjAyMywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4NCj4+IEJ1dCBRRU1V
IHNob3VsZCByZWFsbHkgbm90IG5lZWQgdG8gaW1wbGVtZW50IGEgZnVsbCBJVFMuIFdoYXQgaXQg
bmVlZHMgaXMgYQ0KPj4gd2F5IHRvIGZvcndhcmQgdGhlIE1TSSB0byBYZW4uIFRoYXQncyBpdC4N
Cj4gDQo+IEkgZnVsbHkgYWdyZWUgd2l0aCBKdWxpZW4NCj4gDQo+IA0KPj4gU3RlZmFubywgZG8g
eW91IGhhdmUgYW55IHN1Z2dlc3Rpb24gaG93IHRvIGRvIHRoaXMgaW4gUUVNVT8NCj4gDQo+IFll
cywgd2UganVzdCBuZWVkIHNvbWV0aGluZyBsaWtlIGh3L2kzODYveGVuL3hlbl9hcGljLmMgYnV0
IGZvciBBUk0NCg0KSXQgaXMgZXhhY3RseSBsaWtlIHhlbl9hcGljLmMuIEFsbCB0aGlzIGltcGxl
bWVudGF0aW9uIGRvZXMgaXMgZ2V0dGluZyANCnRoZSBNU0kgbWVzc2FnZXMgYW5kIGZvcndhcmRp
bmcgdGhlbSB0byBYZW4gdXNpbmcgdGhlIERNIG9wIGZyb20gdGhpcyBwYXRjaC4=

