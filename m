Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF20455C09
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 13:59:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227380.393245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mngzU-0004Lc-R1; Thu, 18 Nov 2021 12:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227380.393245; Thu, 18 Nov 2021 12:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mngzU-0004J6-Mx; Thu, 18 Nov 2021 12:58:12 +0000
Received: by outflank-mailman (input) for mailman id 227380;
 Thu, 18 Nov 2021 12:58:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVvB=QF=epam.com=prvs=1956dce401=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mngzS-0004J0-Kk
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 12:58:11 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d358c38-486f-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 13:58:09 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AIBxM84029302;
 Thu, 18 Nov 2021 12:58:05 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cdk3n91mk-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 12:58:04 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6210.eurprd03.prod.outlook.com (2603:10a6:20b:15f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 12:57:33 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Thu, 18 Nov 2021
 12:57:33 +0000
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
X-Inumbo-ID: 2d358c38-486f-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHKSmrPHZii7roUUjt0yDrcze6JSWKslwu3/KSuqmrORwRrxb0pzdp/O6yLlCq1KSvRQRrHujWtzO/eqmKxgdBQoQU7ssI3lFki3e+jJ/jvu2ah2oGfNDTTWoibPsLajgAPfje9G5PNznzDr2baTf5kcIwPT49KrpGS6NN2KHO9cRfwH/8i2lDo7ghViVJhkM1zDu/e3gg1KwtjGfkiKLHN3fa8e5EGYKyZcNYsQOuPVkwrrP+JmhZR7VAKeryeA3omAa5ooY6g/JyxMQ8xScVFyjCc28PXpQryCEoHGYSVFjvvs3IIFnrtoyFd9YFXvhOuqtPdt9DzOjG5sEYNr9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZtzUd+RnnZy0RfKzNGaaaENRu5r2z3qxsQzfpKFpP4=;
 b=ICYXHziK0zHEC5GhaQgEI478k3eavHmdkBNt0mMGGh0R5OVlAZRx1VdlwqtIpTHMOaax+PhL6/1fOrOB80VM5/tKglfmEXnLQkYbIW10TWW7IYBMGn8sO4ayUPy5E+cLd7uFvOiGEBFoj2MK5hhqVjSs6Yu8jr5NAAAGvA4bEU7RdHC1sDFHAkG6WvOFxPL3ikwzWFZklJ9wSQAaieUwnLCYXaJD/+nxcB9E2yKBqsG0TeDz6fnijYawLC4BJNnUsReZIPBmoZhc7Cks8uofaOJNzyXmX5zIh9sUZ2uKKaJsxp6gHUs1nDlV90MjqEq3LGc9KaOJwk0cdYhiyyDctA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZtzUd+RnnZy0RfKzNGaaaENRu5r2z3qxsQzfpKFpP4=;
 b=DfNAxXZaFWgE9xJ3NrG8oAYDZNtOY4Z4bbg33dJnbztUGGY8usz8mLiggN+qPGgfgPa5p2A/C2FKTkmrBPYcH41ZlcZhhnrpZ9jRzMtklLqm/p1hthAEnlcTOAbyjCJ+F0KY0XRfwXMi87esFUcyc82Qt5E2yZanjDmPux3ezs4cJP7UOVWi4gr8HkuyPvKt73mCHTDp9aya7HaHMoCrF+4qxyeG4H4bYzAfM0ex8eHGHGcwuBI9nHoK0m90JsWhqtZRc7ygRlAwokkeSu0oa9MUuzdkCGFmYyJCgTj7uypXgjCG+hqDZ81UPyPkaLqCOP3amipQ/1qbv2MF1gbb3A==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Topic: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Index: 
 AQHX0hJIYALl/D9fL0OD6N0XGDJh2awE30EAgAD09oCAAAgGAIAABgyAgABY44CAAAjHAIAAAz2AgAA834CAAs9/AA==
Date: Thu, 18 Nov 2021 12:57:33 +0000
Message-ID: <4e6828d7-512c-2217-8c9a-a45f85a9d07d@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <5bd70935-4968-b8d4-4d6c-7ec0fc54ee6a@suse.com>
 <4e12f7de-19cb-bc79-4df0-6fb52538a944@epam.com>
 <5b47cd28-5264-9f24-38a0-e9dec6c2c1b4@suse.com>
 <b87a51d2-cd96-d0ac-8718-7f2b2feed531@epam.com>
 <ad01ebdc-7fb8-3c76-d953-08b73b4b0c25@epam.com>
 <fc1fdee4-e567-038f-a90b-127548a8da02@suse.com>
 <55a95ff3-6717-780b-25f9-c43728b6270b@epam.com>
 <8168668f-c89b-cc5b-295f-1d472164a5f6@xen.org>
In-Reply-To: <8168668f-c89b-cc5b-295f-1d472164a5f6@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7e5f218-a888-45cf-5911-08d9aa92fcf6
x-ms-traffictypediagnostic: AM0PR03MB6210:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB6210EDC1F107C732FC94654AE79B9@AM0PR03MB6210.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 L1x7/d4TQNnUKTsWPwqo0dTNTjMe/763Ouoib/NSpGwHQM1bhKicpOSG9XgqKHdzLlclIhqkhzo5o9nxetatsfQwGzyhTd+tAMPeLGkt3mGWfmQDB4UPNuIEG2WLG5/796CLo8lIVkiJJrUzAmK+AtiK6YDHb3h/d2R8/DS7mCKQIRI0ziyR8Q1Bb4CVwDbUWp4z7NzhWunXuM30tzPkiYTY1NXt3EY1Ots5rlZfxv+ps7o9pGOR0gZzmvaDX76JrVpgKwkQ+EhnsFL5hbrf08fZT1h8q/boBkI+AjZygv2bYEQnGq9yE8leflXPOgwRpm1lXUXALE4HT4fa4loBPH8jQefvdqDIrbFXlP7iL4KsDpxeWWNlvqx+AZHJ4GTX0urFtWD49UYSkPHz1hrqgVn+otZncqREcy3rcmYG81S9RF7OkWYCdXF0MMPW7qCaLN/cCEeLKs+soMRmdk53U7Ig9bMjO3NTgXiyMvM0ItFJDjByPcidqaKgc2csjNNLkMpIlXXMIbR0R+vIoHscGvgppzUod0qnJossz+h9j2IcXrWtu7MOVPxj7WkTT8x+lhkjOnbBj0TNIkDn5VhcNR4HHMELmDMyLf2t/ZFKf61nrg/fL0xJmQpJnZ6UQVSfTvWerltNyrW+iOY7j6myLzPfKiUTHUxt0L+WnNd1v6n2FM0jRndqxJ6eRE92NI3kWWg/7JJ6nzMZV6Pnm26g5cNQ93hSX045Zli7p389+5jMqJTuPZPj5R9/ZRswY5PP
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(54906003)(110136005)(6506007)(508600001)(53546011)(4326008)(86362001)(122000001)(36756003)(83380400001)(5660300002)(38100700002)(7416002)(6512007)(71200400001)(2906002)(107886003)(31686004)(186003)(2616005)(91956017)(76116006)(38070700005)(6486002)(26005)(66446008)(8936002)(64756008)(8676002)(66946007)(31696002)(66556008)(66476007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?akl1bDdHSE80aXZzTXpyVUFpZkg1Yy9Yc2VhVWx5dDNHRHBSZG1CWGlxdHJm?=
 =?utf-8?B?TmZKbER4eHJwZUxBaVl5WGxsWmdHbEVCQUpLeHp0TnRqc3E2NXdKbXVlNWRD?=
 =?utf-8?B?ZG5BVzBLdFZ4RWtmUGhBSGg2WktUcFViVzZzYitZRHJ5WHRTdUdRU1hCL2JD?=
 =?utf-8?B?N3Z5MnhkZWJIUnBOVVZNWURtUEswU2g0VE94Z1FZUDlSajNzak9YVDNVeGhu?=
 =?utf-8?B?K0YwOHZaT0hDU2gyYlZmYzBIbmZibE0xNTgvWTB0d1hteEtmY0tubEZqU3dT?=
 =?utf-8?B?TlJuTEkxbDNzV0M3QXQ5YUhnbFVWWUc2VnRlbXpJK1RjTXJyZ3B0UCtkamVx?=
 =?utf-8?B?cjM3bjU4TllDSjJoR0E2TVNwaFdmRm5VdTFFNUZ6QW83QTdlVTR5YXRkS0tz?=
 =?utf-8?B?WXJrQWxJNDJSUDY2ekNlR3hoSTFtRlYvTGVEcjl5TFlsVjBYVmtlODM1M0xS?=
 =?utf-8?B?Q3RDWlY3Ujl3c0pqUHNMc1BiUHhwTnNaVGRUWHJIenNNSGRJNFI0QnVYUE1X?=
 =?utf-8?B?TDJlRW9oQ0RicmJhTjNrZGlVNTRLcGIrd3NYcTRCSkdyTTFCUDc2STZ2b21L?=
 =?utf-8?B?cDV4bjBWSzl3b3o2Y3lndDFJYjIwMGs0OUE3SGhIbVZpRnhWajJQNXlMVWdT?=
 =?utf-8?B?NmplRzcvL3UrN05DT0NQZ25LSkNSY0dDTlBsUjZGbjZmL3pyb0VPc1IvZWZE?=
 =?utf-8?B?Zy9lVTZ5SlJoRDhWaWlQejA5aFBCdktTVXNXdFZicStKcnBJdlVTc21ZdE9r?=
 =?utf-8?B?RmkrYWJyTXJyVDZQTVJxbjRrV3ArakVsK2JrN0JPL2tpVTVkaWdyTkRKQitT?=
 =?utf-8?B?YUFaY2NPSjdCRzQvVzZRMis1VnRISWlRaFlDb0JnRnhtVnhGWDJJdFhUUmUv?=
 =?utf-8?B?endRRm4yZHg3L1pqakYzSDZiZVZ4V3ljZlduSHZVL1hvcmRGZjlRZTVVaTVL?=
 =?utf-8?B?MVUzbFJpdWg1WnFqY01GUmdlKzJZTVlJTUgrc0krbWFuTjkxTWZjcmxTbjBp?=
 =?utf-8?B?TXl2STVlQzlwZFhpa1BiczMvdjYxMzVTbGEzTDh4RDlhZDdKc080b0lObytE?=
 =?utf-8?B?R1RBbC9EMWsyWEFuNzlGbGRHOFQ0L0ZNZk9uVHJ1L1JmRC91WTYyblRRQTMv?=
 =?utf-8?B?bWtmU29NNU56Yk5EeUorV2Y2d3JrWEJidm9NUEw2Z3lLNmU2M3BhdzlkMVNz?=
 =?utf-8?B?b2ZmTFB3azdSUWxRT2ZnRFBmZlluL1ZOcXNMR0RPOUd4OEE3RGQzVEt2dTNY?=
 =?utf-8?B?NHJuRUhIRkY5ZXRvV2lDeUMrc1YrNmZIVXV3ZmZQMGhDMVk4bDFZMjJ3MWhs?=
 =?utf-8?B?Zy9HTnVOdEt0NitwWEUxRUY5NkZpa0dYV1FrRnRKbkR4MDBHemV0cEJtSGtj?=
 =?utf-8?B?M2dwWm9WeHhiMjRoQjJmZHNhVmlhN050bFdkTkRMckdZMHFkaHpsTTlSY2dC?=
 =?utf-8?B?Q0pic01RZEZTQkorek1scmM2UTE5RkZBM05JR2luLzFzZXN2TEZiUU9yQlZr?=
 =?utf-8?B?MlNTSzVsZVIrYms5MWFHQTJlVjdyb3J3YkZub0oyOCsyWmd6djFhUFZrNjYx?=
 =?utf-8?B?ZkcrNittelNnNUNHVU1CTlprdk1Cb1JFcDhLRUpVeUVvMzJnRVhYdjI0cHMx?=
 =?utf-8?B?Sm1aRXZOVGRWQ0dEZjhrVDhWOFhRcSs5RGZMZkUzQVB5Rmc0VGpEWlJ3K0Vl?=
 =?utf-8?B?alIrVzZtMXM5RGd1clZ1OVlrdnBuUDF2ZndVRmtXbjRkV0NZcjJjc3JucWht?=
 =?utf-8?B?b091UDlKMGxobmdkY3dUQW41aFdOL3ZwUDBhNGhxSkQyZm9yMGFKSHlCOG5a?=
 =?utf-8?B?d1IwMnUwd2cwMWZ1WWY3dmNTaUpDTXFHbnB4ZFh4LzBKMVVUUFAwVnBHOExE?=
 =?utf-8?B?enl1eWR4QmsvMmo0UXFhazRUTllLVy95dk1hUlhIdmFuZzF1Yi9Mdkg0NGRT?=
 =?utf-8?B?YlFXTnZ2WXBBaW5LRGgwZmwweGlnS3Z3SGdWZllWei9hUi9PVWdva211ZFpj?=
 =?utf-8?B?MHIvOUlORkhRWDY5SmxZWEIwVnF6UmhSNkdxdkZVSHZNYm5oSEZwdDdWSHdM?=
 =?utf-8?B?K1AyZTZZdENneFVDK3lLeVY0VUFNbUV1Qkt0bU5VOEUvaHJQTDRPTUlPN3o2?=
 =?utf-8?B?bnFmek1ML09TaTRqdXU3UVRSRFlUK05uWGw0WnVmcHI5c1k4Q0ZNd2Q1QVZy?=
 =?utf-8?B?cmhPZGpybzR3Y2RnQUdWTm9FZGhpS1BQUmt4SDBZSk4vbGFCRlp6NHQ3L2lL?=
 =?utf-8?B?NWxqQnRtYjkvVGQrUVFlY3RYNk9kSFNSb3dMN2xWQlpWVGxsUDVuT3JDNlVn?=
 =?utf-8?B?dDdBajNTbmlJVmQrMnozeHA0eGZIMEJPdmRYL3RZWHdVN0ZlSEpTQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A09C110230A47C419AFC12A985832006@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e5f218-a888-45cf-5911-08d9aa92fcf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 12:57:33.4480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I4ZRNbB+kAIFEu9Y0dcFLlQ4S2AB8PpGOPdOv9xNNyM5Q/uCYzQ6aivt0QaokOi18QGhOY+MOE3lGT0cnFPRS8K3zejOytmUr5h0nX8UWSf5nnJPMjCBhHrTJt1kJ4Sl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6210
X-Proofpoint-ORIG-GUID: BoRL1alqCXl_nqaV0S7Yy9RYg7mBPdHE
X-Proofpoint-GUID: BoRL1alqCXl_nqaV0S7Yy9RYg7mBPdHE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_05,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=928 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111180074

SGksIEp1bGllbiENCg0KT24gMTYuMTEuMjEgMjA6MDIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4g
SGkgT2xla3NhbmRyLA0KPg0KPiBPbiAxNi8xMS8yMDIxIDE0OjI0LCBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyB3cm90ZToNCj4+DQo+Pg0KPj4gT24gMTYuMTEuMjEgMTY6MTIsIEphbiBCZXVsaWNo
IHdyb3RlOg0KPj4+IE9uIDE2LjExLjIwMjEgMTQ6NDEsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IHdyb3RlOg0KPj4+Pg0KPj4+PiBPbiAxNi4xMS4yMSAxMDoyMywgT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gd3JvdGU6DQo+Pj4+PiBPbiAxNi4xMS4yMSAxMDowMSwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+Pj4+Pj4gT24gMTYuMTEuMjAyMSAwODozMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3Jv
dGU6DQo+Pj4+Pj4+IE9uIDE1LjExLjIxIDE4OjU2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+
Pj4+IE9uIDA1LjExLjIwMjEgMDc6NTYsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0K
Pj4+Pj4+Pj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVz
aGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IFdoZW4gYSB2UENJIGlzIHJl
bW92ZWQgZm9yIGEgUENJIGRldmljZSBpdCBpcyBwb3NzaWJsZSB0aGF0IHdlIGhhdmUNCj4+Pj4+
Pj4+PiBzY2hlZHVsZWQgYSBkZWxheWVkIHdvcmsgZm9yIG1hcC91bm1hcCBvcGVyYXRpb25zIGZv
ciB0aGF0IGRldmljZS4NCj4+Pj4+Pj4+PiBGb3IgZXhhbXBsZSwgdGhlIGZvbGxvd2luZyBzY2Vu
YXJpbyBjYW4gaWxsdXN0cmF0ZSB0aGUgcHJvYmxlbToNCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IHBj
aV9waHlzZGV2X29wDQo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgcGNpX2FkZF9kZXZpY2UNCj4+
Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGluaXRfYmFycyAtPiBtb2RpZnlfYmFycyAt
PiBkZWZlcl9tYXAgLT4gcmFpc2Vfc29mdGlycShTQ0hFRFVMRV9TT0ZUSVJRKQ0KPj4+Pj4+Pj4+
IMKgwqDCoMKgwqDCoMKgIGlvbW11X2FkZF9kZXZpY2UgPC0gRkFJTFMNCj4+Pj4+Pj4+PiDCoMKg
wqDCoMKgwqDCoCB2cGNpX3JlbW92ZV9kZXZpY2UgLT4geGZyZWUocGRldi0+dnBjaSkNCj4+Pj4+
Pj4+Pg0KPj4+Pj4+Pj4+IGxlYXZlX2h5cGVydmlzb3JfdG9fZ3Vlc3QNCj4+Pj4+Pj4+PiDCoMKg
wqDCoMKgwqDCoCB2cGNpX3Byb2Nlc3NfcGVuZGluZzogdi0+dnBjaS5tZW0gIT0gTlVMTDsgdi0+
dnBjaS5wZGV2LT52cGNpID09IE5VTEwNCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IEZvciB0aGUgaGFy
ZHdhcmUgZG9tYWluIHdlIGNvbnRpbnVlIGV4ZWN1dGlvbiBhcyB0aGUgd29yc2UgdGhhdA0KPj4+
Pj4+Pj4+IGNvdWxkIGhhcHBlbiBpcyB0aGF0IE1NSU8gbWFwcGluZ3MgYXJlIGxlZnQgaW4gcGxh
Y2Ugd2hlbiB0aGUNCj4+Pj4+Pj4+PiBkZXZpY2UgaGFzIGJlZW4gZGVhc3NpZ25lZA0KPj4+Pj4+
Pj4gSXMgY29udGludWluZyBzYWZlIGluIHRoaXMgY2FzZT8gSS5lLiBpc24ndCB0aGVyZSB0aGUg
cmlzayBvZiBhIE5VTEwNCj4+Pj4+Pj4+IGRlcmVmPw0KPj4+Pj4+PiBJIHRoaW5rIGl0IGlzIHNh
ZmUgdG8gY29udGludWUNCj4+Pj4+PiBBbmQgd2h5IGRvIHlvdSB0aGluayBzbz8gSS5lLiB3aHkg
aXMgdGhlcmUgbm8gcmFjZSBmb3IgRG9tMCB3aGVuIHRoZXJlDQo+Pj4+Pj4gaXMgb25lIGZvciBE
b21VPw0KPj4+Pj4gV2VsbCwgdGhlbiB3ZSBuZWVkIHRvIHVzZSBhIGxvY2sgdG8gc3luY2hyb25p
emUgdGhlIHR3by4NCj4+Pj4+IEkgZ3Vlc3MgdGhpcyBuZWVkcyB0byBiZSBwY2kgZGV2cyBsb2Nr
IHVuZm9ydHVuYXRlbHkNCj4+Pj4gVGhlIHBhcnRpZXMgaW52b2x2ZWQgaW4gZGVmZXJyZWQgd29y
ayBhbmQgaXRzIGNhbmNlbGxhdGlvbjoNCj4+Pj4NCj4+Pj4gTU1JTyB0cmFwIC0+IHZwY2lfd3Jp
dGUgLT4gdnBjaV9jbWRfd3JpdGUgLT4gbW9kaWZ5X2JhcnMgLT4gZGVmZXJfbWFwDQo+Pj4+DQo+
Pj4+IEFybTogbGVhdmVfaHlwZXJ2aXNvcl90b19ndWVzdCAtPiBjaGVja19mb3JfdmNwdV93b3Jr
IC0+IHZwY2lfcHJvY2Vzc19wZW5kaW5nDQo+Pj4+DQo+Pj4+IHg4NjogdHdvIHBsYWNlcyAtPiBo
dm1fZG9fcmVzdW1lIC0+IHZwY2lfcHJvY2Vzc19wZW5kaW5nDQo+Pj4+DQo+Pj4+IFNvLCBib3Ro
IGRlZmVyX21hcCBhbmQgdnBjaV9wcm9jZXNzX3BlbmRpbmcgbmVlZCB0byBiZSBzeW5jaHJvbml6
ZWQgd2l0aA0KPj4+PiBwY2lkZXZzX3tsb2NrfHVubG9jaykuDQo+Pj4gSWYgSSB3YXMgYW4gQXJt
IG1haW50YWluZXIsIEknbSBhZnJhaWQgSSB3b3VsZCBvYmplY3QgdG8gdGhlIHBjaWRldnMgbG9j
aw0KPj4+IGdldHRpbmcgdXNlZCBpbiBsZWF2ZV9oeXBlcnZpc29yX3RvX2d1ZXN0Lg0KPj4gSSBk
byBhZ3JlZSB0aGlzIGlzIHJlYWxseSBub3QgZ29vZCwgYnV0IGl0IHNlZW1zIEkgYW0gbGltaXRl
ZCBpbiBjaG9pY2VzLg0KPj4gQFN0ZWZhbm8sIEBKdWxpZW4sIGRvIHlvdSBzZWUgYW55IGJldHRl
ciB3YXkgb2YgZG9pbmcgdGhhdD8NCj4NCj4gSSBhZ3JlZSB3aXRoIEphbiBhYm91dCB1c2luZyB0
aGUgcGNpZGV2c197bG9ja3x1bmxvY2t9LiBUaGUgbG9jayBpcyBub3QgZmluZS1ncmFpbmVkIGVu
b3VnaCBmb3IgYmVlbiBjYWxsIGluIHZwY2lfcHJvY2Vzc19wZW5kaW5nKCkuDQo+DQo+IEkgaGF2
ZW4ndCB5ZXQgbG9va2VkIGF0IHRoZSByZXN0IG9mIHRoZSBzZXJpZXMgdG8gYmUgYWJsZSB0byBz
dWdnZXN0IHRoZSBleGFjdCBsb2NrLiBCdXQgd2UgYXQgbGVhc3Qgd2FudCBhIHBlci1kb21haW4g
c3BpbmxvY2suDQo+DQo+Pg0KPj4gV2Ugd2VyZSB0aGlua2luZyBhYm91dCBpbnRyb2R1Y2luZyBh
IGRlZGljYXRlZCBsb2NrIGZvciB2cGNpIFsxXSwNCj4+IGJ1dCBmaW5hbGx5IGRlY2lkZWQgdG8g
dXNlIHBjaWRldnNfbG9jayBmb3Igbm93DQo+DQo+IFNraW1taW5nIHRocm91Z2ggdGhlIHRocmVh
ZCwgeW91IGRlY2lkZWQgdG8gdXNlIHBjaWRldnNfbG9jayBiZWNhdXNlIGl0IHdhcyBzaW1wbGVy
IGFuZCBzdWZmaWNpZW50IGZvciB0aGUgdXNlIGNhc2UgZGlzY3Vzc2VkIGJhY2sgdGhlbi4gTm93
LCB3ZSBoYXZlIGEgdXNlIGNhc2Ugd2hlcmUgaXQgd291bGQgYmUgYSBwcm9ibGVtIHRvIHVzZSBw
Y2lkZXZzX2xvY2suIFNvIEkgdGhpbmsgdGhlIGV4dHJhIGNvbXBsZXhpdHkgaXMganVzdGlmaWVk
Lg0KSSB3b3VsZCBsaWtlIHRvIHVuZGVyc3RhbmQgd2hhdCBpcyB0aGlzIGxvY2sgc28gSSBjYW4g
aW1wbGVtZW50IHRoYXQgcHJvcGVybHkuDQpXZSBoYXZlIHRoZSBmb2xsb3dpbmcgb3B0aW9ucyBh
cyBJIGNhbiBzZWU6DQoNCjEuIHBjaWRldnNfe2xvY2t8dW5sb2NrfSAtIGNvbnNpZGVyZWQgdG9v
IGhlYXZ5LCBwZXIgaG9zdA0KMi4gcGRldi0+dnBjaS0+bG9jayAtIGJldHRlciwgYnV0IHN0aWxs
IGhlYXZ5LCBwZXIgUENJIGRldmljZQ0KMy4gV2UgbWF5IGNvbnZlcnQgcGRldi0+dnBjaS0+bG9j
ayBpbnRvIHIvdyBsb2NrDQo0LiBXZSBtYXkgaW50cm9kdWNlIGEgc3BlY2lmaWMgbG9jaw0KDQpU
byBiZXR0ZXIgdW5kZXJzdGFuZCB0aGUgc2NvcGUgb2YgdGhlIGxvY2s6DQoxLiBNTUlPIHRyYXAg
aGFuZGxlcnMgKHZwY2lfe3JlYWR8d3JpdGV9IC0gYWxyZWFkeSBwcm90ZWN0ZWQgd2l0aCBwZGV2
LT52cGNpLT5sb2NrDQoyLiB2cGNpX3Byb2Nlc3NfcGVuZGluZyAoU09GVElSUSBjb250ZXh0KQ0K
My4gSHlwZXJjYWxscyB3aGljaCBjYWxsIHBjaV97YWRkfHJlbW92ZXxhc3NpZ258ZGVhc3NpZ259
X2RldmljZQ0KNC4gQFJvZ2VyLCBkaWQgSSBtaXNzIHNvbWV0aGluZz8NCg0KQW5kIEkgZmVlbCB0
aGF0IHRoaXMgbmVlZHMgYSBkZWRpY2F0ZWQgcGF0Y2ggZm9yIHRoYXQ6IEkgYW0gbm90IHN1cmUg
aXQgaXMgYQ0KZ29vZCBpZGVhIHRvIGFkZCB0aGlzIGxvY2tpbmcgY2hhbmdlIGludG8gdGhpcyBw
YXRjaCB3aGljaCBzZWVtcyBub3Qgc28gcmVsZXZhbnQNCj4NCj4gQ2hlZXJzLA0KPg0K

