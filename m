Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09712400088
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 15:26:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178090.323960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM9Ct-0001kR-3z; Fri, 03 Sep 2021 13:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178090.323960; Fri, 03 Sep 2021 13:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM9Ct-0001iQ-0p; Fri, 03 Sep 2021 13:26:11 +0000
Received: by outflank-mailman (input) for mailman id 178090;
 Fri, 03 Sep 2021 13:26:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xv6v=NZ=epam.com=prvs=9880a75e98=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mM9Cr-0001iK-Aj
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 13:26:09 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f5458c4-0cba-11ec-af16-12813bfff9fa;
 Fri, 03 Sep 2021 13:26:08 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 183DEFG3022979; 
 Fri, 3 Sep 2021 13:26:05 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58])
 by mx0b-0039f301.pphosted.com with ESMTP id 3aumdq01ga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Sep 2021 13:26:05 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5697.eurprd03.prod.outlook.com (2603:10a6:208:176::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Fri, 3 Sep
 2021 13:26:00 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::641e:b269:6d21:b7f8]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::641e:b269:6d21:b7f8%5]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 13:26:00 +0000
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
X-Inumbo-ID: 7f5458c4-0cba-11ec-af16-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hj1sS21G0hxhYDsmoxMrwT9Qlg7scEdPifIVtS4F3i1kjyAgNjZaMfEkPZC98nywNJs5ZTNFsQ2LKnaRB7CeC366vj3wxXc7gLe4Nx3afpUKE8OWGDUHQtkLhCkz9JZI/P452D706ok2w1ABtQtNso+BWysdA2HsqpadlPPOnynj6JsiIup+0xEevir8wJDQCvBJTwW3fVtUYl+GfSdrc9dGstZGFjzhYXJKFS7Rj/dUocg8N7bN5/t/4XpWAt+Q0te/cbMQj6ByPQinaTaSUVAifRHoJ6wo5wo+WFw5LVprUEYqJzv8pAUNORGpdQYVlLrFqxZzVWfm3FlQiYxY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6rcs18nY5JhoWpG4h295efE9YtJvCF4tu+ICLvI9ne4=;
 b=Zg1lrU1sJVm30bzA/GuYNC9PKopgFumn/Fx+rN0/sUd3fBVJEPDsvaFm/FE0cy/N8m7yL3Tmr5evelVc4EPvygDUoZeIm/e8rWYVsmQw/LrEV2zREK7cMPSiBPwiRFs+ItnUmJyOaajiEaNfjydOZAx7LYUDHFs7GNOr/1gAKjI7kQgnqR/4p+2yr6mXuW7PgvFif2p6/GgG/D5I1/lrl/984omQUhmSRVZlXLpBwUGgu5pD2gJqmlTspIS0g5wBNsoHqEZSm1Lb4sNbAQYyLdY6T1k5VSB1hBUHmdOQYSYsHnTLvecX2PvtfpFmKc0SFWWfYnoDnCmqNmQKfcwp6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rcs18nY5JhoWpG4h295efE9YtJvCF4tu+ICLvI9ne4=;
 b=s9jGv3LBmF823BNOjmQjtyYOmsotUc2G0F1Io3nvVvh7L4LxIXnfGk43lFxT8OOgiyXAiqr9ZkkuU19V1W0GRVIYnj1qDNiJbJ/DLdjOypbPRee6G9u1BA3CsaxmmJYIG98O3V3gbQ/4AOJLauR9S7yhezMMVoS4/0YOoIUP9r7nf5Ccc1NtcAt5e+MagbfhVfZhQsohihMVqLTvOBKXTdvDG0W16t6HaWz2wM4BnZhM+OKNVDdXuZ/gIRWQTVMw04InLsni8/IJW9D2ADWWmRA+my9/i7TzcJXbD6oVC8G3zhIh6XU7E9Pdtla1MsWtsOh+cHe9U7kaQKfwdK8wVA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 05/11] xen/arm: Mark device as PCI while creating one
Thread-Topic: [PATCH 05/11] xen/arm: Mark device as PCI while creating one
Thread-Index: AQHXoJ5xoGQK6kA9E0qeGYyDKoX2LquSQMSAgAAMdoA=
Date: Fri, 3 Sep 2021 13:26:00 +0000
Message-ID: <44a860ea-a93e-6167-25df-12ac0ae6e134@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-6-andr2000@gmail.com>
 <1b890e67-c907-6678-bc98-d810231d9b50@suse.com>
In-Reply-To: <1b890e67-c907-6678-bc98-d810231d9b50@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a05e2d2-cb2d-4999-e15f-08d96ede5edc
x-ms-traffictypediagnostic: AM0PR03MB5697:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB56971682F0444905E6159138E7CF9@AM0PR03MB5697.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 WYBZqu6Hzj3obIrFV5DedsBYQDK7BfKPti6sZ2YpeDmiQc2rx4QfO1UsQ0mvtPgbA4JSwbdx8KL18NHgPI+eGC+ggRAwNGBjvA033fM9ptwHPAYpWvIpqufW++YCdHoWih8Ubhr84R/rZas99VwD90AjZwmZfNUCTYqoRyhbcWaC170X2+kRwfAzhYOlH7Fq5D1R30f8NlaKw/oonG+5EJPWp9vbtPh8HJ8eIuVg6utBaqNejkaXpAkQ+1WnN1Gaj+l1W2SDlqclSKBvD4rz1vcPG5vUtF/HToonl6MhclYm60b5n2UEIQV8+sW/dIHj+ZvRX/kimE89Lb191Axs+mYA7od+PeCdrvlm2aZ+aRIwcEzQT5GI6tob0rgPJf4AVn+mrQSA6nsJzu1ngVEBAocEwElI48QFWLnV+eO5Vi9ydLnbYUVnPxhiSumjCfLncAY6kew8iB05O5ciMj/X11v+Fci887qIhZdxMsRe72tmm9OqyrG02MD00FJjdfekUPNrzExGXn7kw8oELohEGW1ja337JHiKH3qDBTY6nvkets361VtR7GgqtTfXdd60DRuIz7hvoHToSMieb2OqOIEOwqvMLk9OaczmBY0c1BN+np3E3sNntrsaOpSqm84o9QoPhJI+MT0qy4Z9Q/UgtalmX/mJC9Hj5oqaFNgqCHtXlI2hjslBarFL7ZTc65RE4KL2JxUGmL096AuNdgsOORiuHnKc3AgoFzQWcgcA8ZdC+N7Fh/61NlknSshS5YdU
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(5660300002)(38100700002)(71200400001)(31696002)(8676002)(2616005)(508600001)(38070700005)(86362001)(110136005)(54906003)(2906002)(316002)(8936002)(4744005)(66476007)(66556008)(66446008)(64756008)(26005)(186003)(36756003)(53546011)(55236004)(6486002)(4326008)(6512007)(76116006)(66946007)(31686004)(91956017)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SEJQSXQvM3FtMEpQbm4rUFo1c3pNN0VrbUV3VG8rTnVaYU4rWjFVOCtDZmZJ?=
 =?utf-8?B?VCtudnVWTEdDNHJ0NmFKdGZidWk2YVpBQUpiRGU3L1U4cnZPQzBYQThkdkNM?=
 =?utf-8?B?VCs4VExibGM5eEh0bmdTVFJGSXU5dzEwTjRaaUJFZ0FWSTVBOVEyM0V6Y0J6?=
 =?utf-8?B?Q3Vud2d1d0FCTEZvV0pPekFWQ25oTUQ4UmlvbXhGMXR1N0lZSU1ZOVE1NFNB?=
 =?utf-8?B?WWJjY2dva1lBRDUwVCtWRzBUeEFXaGFOcjFmM0Y2akJjMUppMTJDUjM3V2ds?=
 =?utf-8?B?M0pRM3FsRDVFNjBaVDF6VTI0cUg4alF1SzRwMXU1cmpYMmtGZXplMy9pODNY?=
 =?utf-8?B?ZUtLT2o0MWNrVjh2SFdiNjRLTDF3TmFzSFQrK3dkcE9vSGJkRDdkQmdUcnlU?=
 =?utf-8?B?SVhRZ01oWjc4YzhMcEVqQWRsbXFmTEJRWXkwaDNGSGF2Q3ZCZmtPUVZpYWRU?=
 =?utf-8?B?TG1nWXd3Y0JuZkNtQWF3Rk1LeXlaNitKbWt6dHNDKzh6d1FwZzJnem16SHpk?=
 =?utf-8?B?RHJLblRKVUp3Q2JPKzFNNVZXRHBaR0Y3cXBtc2NIbHErWTRuR1Nuc1Y3elQy?=
 =?utf-8?B?UDNiQTVGZUJJQ3VEc3pmYkFIcE55RWNLVk5YUDdEanFkblowYjNXUC82M0lR?=
 =?utf-8?B?N2Fad2JNSTB4Z2w2eG1QR3habWpTWEpWbVpXd083WXMyWHBURzZsZG9ac0tL?=
 =?utf-8?B?N0lRRzdYY3BESkxZMjVvSmxVMlVjZ0tnU3FGZHZMUXhqajBzNk9JUlVBMlE0?=
 =?utf-8?B?UXlnSFB2cVlSWEFjRkRyZFFtbWVSRDRvb3ZRR2FVdG5MVVhCdzlBWk8vdlJz?=
 =?utf-8?B?dWovc0lhTVJ6SVRpU1A2VmZkUXFrUGVwQ3hhdXBXM2lRcmFORHdhN3U5ZUJo?=
 =?utf-8?B?MXI1akJld2dvY1hTUjRON3plaHZjSmN3OGpCL0tZRDNQNjYrM1JyWS9rU3dO?=
 =?utf-8?B?TWhTVmZCNURnV0JRcWFOUUp6QTBwQXRWOGlVVVdGaE1nTFo2MWwydDEzNWpE?=
 =?utf-8?B?WXNrc3ZxNHNTWUo4bXF0ZjFvazVDZXk3NTh3RTNOQ3REQ1N2YmdtbkN6b2tw?=
 =?utf-8?B?M3FmWGlSaFRRR094cTVxMTM2NGpzME5WalREd2NMT0dPaDg2eHVEUFI3MkNy?=
 =?utf-8?B?c0RHVVIrRWNvRFBLSVpPcjZLcmJKYzEvOG01bzN1Uno2SDdUZmJkN1EyNWpv?=
 =?utf-8?B?c2hxQmR4ek9yQW5Ga3FTc3JUdkZLZ2lpc0xsaW5ZQmdaaXQwSkJXOTlEVmhs?=
 =?utf-8?B?ZzlqSWF5dTNkUFdteld4dm4vNlFtd1hVRDRMSkRhY1U2aUNjRFdadEhSWkJW?=
 =?utf-8?B?Y1RlYTVQNjdTNU9qYzNkTVBIb3FNR0FQZTdYY0k0STJqS3g3ci9DdjFQa1cy?=
 =?utf-8?B?Snp4TmQ1cENDOUxpUk5RVHZkRnRWeHAxMFJvZ1pDcThTVTJRRWpEeXhiaXd4?=
 =?utf-8?B?NUpsa1VXVUFNbnY0d0lyQzEvMWVUejE0VDlDcGdKSlA0bisrTFBNY3NESFdV?=
 =?utf-8?B?Mlo4ZDE1dFBONzRsYkJvR0pKTHR1TkZra2hhbUF3OTBlTm0zanA4aXFySk1j?=
 =?utf-8?B?bjdaK3QrWmtGK2txZS9vMmlickZBbGY5cXRGNnNsTU5janZWbWJnVHB0Q1Nm?=
 =?utf-8?B?c0RuaUNvcndud3NhV3NKQTcxazRmMWtPMWMvdG9JYUpUOWsyVThWWFp1bCsr?=
 =?utf-8?B?MkRWOGNLV0R1MlI4VGwzVjk1c2U0RDRHQ0ZTaWdvazM0SWEwb1VLZ01RKzhQ?=
 =?utf-8?B?Sll6bWVhUnFoekc0aUpRM3Qzb0FSejh4NUE5ZEh3cHd0RW9OZjlPNjlDL3R2?=
 =?utf-8?B?Y3Bmay8xODI3YU1zblphUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8393431B4FC6854D8177E3F627909D6B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a05e2d2-cb2d-4999-e15f-08d96ede5edc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2021 13:26:00.1829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IqmHj1XaQZUerY+KO1cpz+hYk34BfmcSrDUhSZlxnheGjnhVsCqt6GkXnR3QnahTJMYoxnEEvuR7jwHhgu096VV9VpsqzH76jTHErQo6G2gki5aOxpApEch/iM6iLbjv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5697
X-Proofpoint-ORIG-GUID: H4sECB9vG4h-iOsAPH13KUqcJhN9pwlV
X-Proofpoint-GUID: H4sECB9vG4h-iOsAPH13KUqcJhN9pwlV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-03_05,2021-09-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 mlxlogscore=999 impostorscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109030082

DQpPbiAwMy4wOS4yMSAxNTo0MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAzLjA5LjIwMjEg
MTA6MzMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gLS0tIGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Bj
aS5jDQo+PiBAQCAtMTMwMSw2ICsxMzAxLDkgQEAgc3RhdGljIGludCBpb21tdV9hZGRfZGV2aWNl
KHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gICAgICAgaWYgKCAhaXNfaW9tbXVfZW5hYmxlZChw
ZGV2LT5kb21haW4pICkNCj4+ICAgICAgICAgICByZXR1cm4gMDsNCj4+ICAgDQo+PiArI2lmZGVm
IENPTkZJR19BUk0NCj4+ICsgICAgcGNpX3RvX2RldihwZGV2KS0+dHlwZSA9IERFVl9QQ0k7DQo+
PiArI2VuZGlmDQo+IFdoeSBoZXJlIGluc3RlYWQgb2YgaW4gYWxsb2NfcGRldigpPyBUaGUgZmll
bGQgc2hvdWxkIGJlIHZhbGlkIGJ5IHRoZSB0aW1lDQo+IHRoZSBuZXcgaXRlbSBnZXRzIGluc2Vy
dGVkIGludG8gdGhlIHNlZ21lbnQncyBsaXN0IG9mIGRldmljZXMsIGltby4NCg0KWWVzLCBtYWtl
cyBzZW5zZS4NCg0KVGhhbmsgeW91LA0KDQpPbGVrc2FuZHINCg0KPg0KPiBKYW4NCj4=

