Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F99458CDE
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 12:00:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228790.395951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp731-0000pm-1R; Mon, 22 Nov 2021 10:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228790.395951; Mon, 22 Nov 2021 10:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp730-0000na-Ub; Mon, 22 Nov 2021 10:59:42 +0000
Received: by outflank-mailman (input) for mailman id 228790;
 Mon, 22 Nov 2021 10:59:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJrQ=QJ=epam.com=prvs=1960b635ba=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mp72z-0000nU-F6
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 10:59:41 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4922b6f9-4b83-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 11:59:39 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AMAsPuq021674;
 Mon, 22 Nov 2021 10:59:36 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cg8hmrfee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 10:59:36 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AM6PR03MB3608.eurprd03.prod.outlook.com (2603:10a6:209:38::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 10:59:33 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::b121:f602:44b6:d445]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::b121:f602:44b6:d445%3]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 10:59:33 +0000
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
X-Inumbo-ID: 4922b6f9-4b83-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTaMGxODocEGpjjJfmqC45UaFgCHso1Po7XT8Y4pewu+SvSE8GJuHxjOwPBimbLQbQEjg1ssoHoScY5+aXq8GIsBgZhHF+slCk746rpUKKEXZsDFWctWg0hNF9XMb5Eui8MO5sELD7j+GJGI9SlWWpFC2qGB0J0a/J2SNEkDfX7ptbv8bd5JWh5Vf3cEi1CYpQNknvr6rRvoNSZlhn87Ccf0qbSUL3uOCxNbAS+V+oeIbGCydQ7iU6ydfBoUlUhCTi6F5yelMQEaX3I7I6fNiX1OGAq5afB5fpSKVPu8NzVl/QXRf6CYdkrNK7kWFXAz1A0KbvJUp2yB9bjQ78BQTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBq+nZhvrgME/r1E16pAlev2cFaLl10SPqFI3WkmRfQ=;
 b=c1iPUvJCdFI7+OC4voxRMNyXryDmawNHxDVePJe0SDx1pCTR8oSA7YGKhLb254Zd5imIj9W1Z2qLovSUAIdgZXvfWJEhep/+N5dRrSEG6lDGZu1zNZ4UJw40FqtEITQ9/qVc5wu/RQmK2BNcpVjrdTTtCH58RJ62hotQw1xMSgw42C4NBT6QO5EL2YcqP9wT6q1Z8bdvb8nP6R6YRjTLfnadsPAPb2mPyeh+qlMxdCj/OO0xd/Iu4y5dWyR6dezQiETh8XYGcM9mGzHkg/L6S6MZeUeS1fE6SkIQfZ575KGG7stORti/NRncqtNsy8ACl/+OHPz5cmKwpq6mKiUaMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBq+nZhvrgME/r1E16pAlev2cFaLl10SPqFI3WkmRfQ=;
 b=p/fxDjAfZGTi9FHSV1rsHdua5pevr3jXpAGe4swYaatjpZ6hjeXVwBeiHdLGlL2wc2CjQNb7ALt9pjReTg1CCtt7XOH5g6m/mPsKDW18mrZfgBhNdQ/cSGB9gKi/PrwvnKsitESFHD9lr+LYoURj3rnXjsBH2iOGTlaNDWl3NXjbqvo5oHj4Qj91A0LP8i3vLIRRj5K+KsB7/IvWOnxxvBFHh03+x1dw9HyqlnSGjcQfaLDQzgxEr/WVP86CA6uVvzT9PwFgbEG39l3u42riN4ZO7MogC8Mj5H1qrOxI2rMRSRnjETRLZRzslQTdnlWRwREp5JA0F1NVQaULs1L3gQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH 2/2] vpci: use named rangeset for BARs
Thread-Topic: [PATCH 2/2] vpci: use named rangeset for BARs
Thread-Index: AQHX34NSPeXhoB5iREudUJGr9f4eDKwPWBGAgAAEhQCAAAHcgIAAATqAgAABWoA=
Date: Mon, 22 Nov 2021 10:59:33 +0000
Message-ID: <90fe8b04-4bc3-2d10-e94e-70e5e28c9780@epam.com>
References: <20211122092825.2502306-1-andr2000@gmail.com>
 <20211122092825.2502306-2-andr2000@gmail.com> <YZtwj0OKrNaZ7s5X@Air-de-Roger>
 <f1aaedc6-73c5-e4ac-91c1-323f44d83687@suse.com>
 <1d9d5540-5fe2-6897-1704-b296294afe6a@epam.com>
 <a0345cce-5b44-6cdb-681f-002403893e31@suse.com>
In-Reply-To: <a0345cce-5b44-6cdb-681f-002403893e31@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 933a72c7-3fcd-4de1-71cd-08d9ada72a5e
x-ms-traffictypediagnostic: AM6PR03MB3608:
x-microsoft-antispam-prvs: 
 <AM6PR03MB3608DFA581AF85EE1C29A1C9E79F9@AM6PR03MB3608.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:283;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vvSmT/Wu9zImUQnSigs+v6ujiO/qYC1Kq2q4V3kEISRata4Sga6ApGzW0fvEJGhP4X/5XJ9E/cBiTGtePeK2bA8tjCRM+SMCQQpdKUT6baLWjUwdjFTiQ2oxSia31JliGxRh9SQNNfK7yXUcvHTh+Bt5o0wznoR/OIwLwD47SqJG2cevG8tqS7h8HVfGvYUCrwuFz4jOR5LyPHMs7Zp6cP6pfifP4hjJTJ4seisUpwIz+3yBoPB9Fmnu+mmSLVHaDrbwMEECd34QwY854ZUcDLKMJOZb/aHkTkmz+maQvAmvdu4LS8s99La5LGQm12xwHy8Mzso5gBvVHi37ZdnMUrLUW1VthbD0nO+IIw2ze8mIdi0kwAP5waHrYhoV4iywoV7kt5Mffbjrkq8Z1SyMZmG0M9V0mjN9sqtQPh9bdcIQXgeqQeVqzlIZNrJAHIWCv0xnMNaUz5cUOtSI0oh6KN3X1UBdbjAHsLy7puONB2CiGyHbuOpT/vNyKOZ3tIOlDg3rgnfpZgYapYeOD9H2ZS4Jwkm3YDZ8fSetaubKLjGfd9y15fUVfHwY/qrlon8KJMmDHiWIoIEPjp17sKmvxkMGTK0wqMq39FC/6gSSifv8d3XbcdjRlCysCldL8PlHaEn/H6cUf+rkjvI44820S3OoYMvkXALgDinwUMsnjqESt7cnPClPqTzEwKHyuj/7t50xO/VWyEvMYpv1eif8+FpS/lVeZR5ScXHiyWKix7GW+8ubZjShzJKwJjNAWuzv
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(6486002)(186003)(71200400001)(31696002)(36756003)(76116006)(4326008)(86362001)(53546011)(8676002)(31686004)(122000001)(5660300002)(66446008)(2906002)(26005)(6506007)(2616005)(6916009)(6512007)(316002)(66946007)(64756008)(66556008)(66476007)(38070700005)(107886003)(8936002)(54906003)(38100700002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eEY5NFJiOWNJNFh0dmZROTVUclBtbHkrRU1GemtpcDRrNkZ5MW1jeCtUU01J?=
 =?utf-8?B?T2hNc3JhSFVpaWhLa0VCMGhtdXgxc29ocEJCNWtJK0NIOHl6SFVBQ1NEMEc5?=
 =?utf-8?B?QVZTLzZZczZNWWpWYytnK3d0RHpBN1JKTVQzRXFlcWV0YWt3QXhSRlFiaTlQ?=
 =?utf-8?B?cS9DY2JQdndMUkhHc3BNajZ4T2NMRW5UWjdsTVNrSWNaV242emZCdTN1TUVM?=
 =?utf-8?B?WXFaWVhoUXJldXJrTXBnL0Vlc0syTkRqWkRIc2NIMVlYYXV4cDRkOFpiWndX?=
 =?utf-8?B?Rldib043S1VEaTQ0dlZ3bzNZZmZWTXdvZlFuQVBzeldGdjRqVzRIQy9ZRll4?=
 =?utf-8?B?Z1FOdkd1b2ZPbVREeXBtRVBNK2ZxVHZyYzJSZ21aUEp0S3J5QmIzYTkxUmdJ?=
 =?utf-8?B?SFFnQnBtMjg1WTYweGNTWGdNWFpJVEw4dCs3QlU3d013RUEyVXIrTVIydHlD?=
 =?utf-8?B?bXVxeVVDcHdxYXRtM0MyMndPWXI4aEpkZHl1VUhscVpaSzRnbng1UnE3Y2N1?=
 =?utf-8?B?b09vMVRVZzltOUFRL0QvRzI4MzJWNG82Z0VjNUo5LzRETkl0UUNSWnhObW1U?=
 =?utf-8?B?dmdMY0ZIRjJOSjVzQ0Y4Wm9LT2dDL1F1c1ZuZkQzcUhOZVV3QVVCN3dyeXFP?=
 =?utf-8?B?eEpFZUlFZS94dnVnWDdMYXNaVzJMQ1EvS2x4TVdlckFjaGtrY1ZsWUM5Z0lX?=
 =?utf-8?B?S2hVL21kNVhqYlhvZWl1R3hwRGFjYTVXRW9qVUdZZXlQSDNJcjBZNkVBR0Jv?=
 =?utf-8?B?M2g1QVh2djFuc3M0LzNhc0M2Vi9WZ0FjZVJhNkFyZTIwa1NrbGRHQ0MxdHVW?=
 =?utf-8?B?OEtGMDNtN3VwOVVxWUFjRlEyWkJVcjh4R011Skk3UlJDYkc4cnhEbTVDSW05?=
 =?utf-8?B?eUhoNkVCU1o3Z2JiNkt2M1QxQThYTjJlRlh4cHFQaHREU0NCTkhtLzRqM1Bo?=
 =?utf-8?B?cTBNbUVQMGJUNG0vc3ZRTU9vUExKaEZlTkVJWDgyWU1kRDlkamFqZDEwYUp1?=
 =?utf-8?B?NnNscnJXWEQvckp4RDFpMjkvOXlkMi9hY2RtMWZUUDBrUno3R1ZnNWUzZnNp?=
 =?utf-8?B?Nml2eld1bmYvbmhpdTNRU0UzcU9ZUlRVR0ZnQWh4dFFybVEwSlpNSTNVdGVq?=
 =?utf-8?B?Z1UxVC9YUzRIVHZCMm13YUprSDZadlJvT1UzS2doZlRhVlROa3BNV1JqVVYy?=
 =?utf-8?B?bFhGY3ZmY1BMMC9NaWRXdUZTSDBrNDN5Q3ZIbmt3dVRmM2NqNGNnMHBDOEEr?=
 =?utf-8?B?NUJUM0lSMWIvdDFmWGdGcmpxNVVjTk1OL2hmY09aV2tYbHJkbE9qYTMxV3gy?=
 =?utf-8?B?MGRUZmF4VHp4amhxRlljQzEwcXNiWmZNUDlkeWt4UVk0cGloMUxScW5IRE1W?=
 =?utf-8?B?eVFYQVM0MjROT2tNaFFEV01OdUtCOUpzdnhtS1FBeUR5RzFMcWhsZEpoRlNr?=
 =?utf-8?B?VlpuWVE4ckpsdEhEUVJHSWdyS29zd3FYQXZVZi9KRlFNSlkxVERqZjAwa1N3?=
 =?utf-8?B?MEVOSlVSM1RzY3JaWC9BL3E1WUFIUnN5bGtFeDVVRWtkVzhGWmFKd2FydG1T?=
 =?utf-8?B?TW5rQjh3elhjSzdnaEFXRmdZTnNJWk1IcXNlZm5TRGd5dlljakJ1YjJRREtZ?=
 =?utf-8?B?cWNhSE9leGUxbWpTNzJQT0QreWtvRVd2SDB0bzJKZjFNZTFCd2tJcHpZdmsx?=
 =?utf-8?B?eU9SZXJKaVk2cWlQcnlvRzNrVW5NR2pLNHp1MEdBSEJJUnlZL2s0ZElDalRF?=
 =?utf-8?B?dFlOeVdVZ2o3NW13Q2xMd0ZZVmthM2hDSHJwNG91RURuTkNra016Wjc5QVU5?=
 =?utf-8?B?a0hQQTRaeGFRSlpLZTA4VjczVGZxTEIvU2FSak9WdXZUZ3JaY2ZGbzdBTndC?=
 =?utf-8?B?M295WEI5WFVaaTJWSVlqWlI0ZEYycm5pTU1lKzBaMGE5bHErcXM1d1g3WGJF?=
 =?utf-8?B?aEJkVE4zeHFtekVjVCs1NjI3b1RFeFNpdG5SSHcxdWNUdU9DSTN2aWRmS0xa?=
 =?utf-8?B?NkJpQnh3WWZma013QVJEZGFveGJKRUhzWCs4bDF5TEtLY2hieTJHbmpJWUQ1?=
 =?utf-8?B?dlQzZkNFdUtpT1Z4YnBiMkRQbG10RmFqc3ZoZS9YSzdtTnRUM0xkRXZHL0o0?=
 =?utf-8?B?VmFTbTBuSzEweXNUNXd2MzNkZG5jK2dWRTM3bTNXQkFHSVZqZ1VnVElQclU4?=
 =?utf-8?B?RlE0VXg1NHl2YVdndGNRZy84cXZZSVk0OWV0cG1PcFRKNWNxM3d0TkZEQklM?=
 =?utf-8?B?dTlBUm9iQ1lPZnIyMUNQT0Z2SEhtVnJVZkZLV0dzOHlubDc0bHhNd3ZKWG9U?=
 =?utf-8?B?aWlFQ29SeGxnbjdMc3ZxajJDSkdXaTV3eGN4dktnc0p4YVk4RjVwQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8AA05DEB3AABC443B53728AC6FFE0DCD@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 933a72c7-3fcd-4de1-71cd-08d9ada72a5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2021 10:59:33.0984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7/JsP5IDu7rgFb+iZ4+bjjlutPMpWoY4yzcTDaCp950blaw/ao9GLoz+Dc1Wdilz7bXtB0xTFjCI6OO89F+l3Oi5ZIPDESdKGukCucd9OzFD9h8RYaPjAhhE8mRKH8ws
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB3608
X-Proofpoint-GUID: pgPzPRvTKRBFAchmx1SflG8LdR_Sypeh
X-Proofpoint-ORIG-GUID: pgPzPRvTKRBFAchmx1SflG8LdR_Sypeh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_04,2021-11-22_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111220057

DQoNCk9uIDIyLjExLjIxIDEyOjU0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjIuMTEuMjAy
MSAxMTo1MCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMjIuMTEu
MjEgMTI6NDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIyLjExLjIwMjEgMTE6MjcsIFJv
Z2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+IE9uIE1vbiwgTm92IDIyLCAyMDIxIGF0IDExOjI4
OjI1QU0gKzAyMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4gLS0tIGEv
eGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9o
ZWFkZXIuYw0KPj4+Pj4gQEAgLTIwNiwxMiArMjA2LDE2IEBAIHN0YXRpYyB2b2lkIGRlZmVyX21h
cChzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwNCj4+Pj4+ICAgIHN0YXRp
YyBpbnQgbW9kaWZ5X2JhcnMoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVpbnQxNl90IGNt
ZCwgYm9vbCByb21fb25seSkNCj4+Pj4+ICAgIHsNCj4+Pj4+ICAgICAgICBzdHJ1Y3QgdnBjaV9o
ZWFkZXIgKmhlYWRlciA9ICZwZGV2LT52cGNpLT5oZWFkZXI7DQo+Pj4+PiAtICAgIHN0cnVjdCBy
YW5nZXNldCAqbWVtID0gcmFuZ2VzZXRfbmV3KE5VTEwsIE5VTEwsIDApOw0KPj4+Pj4gKyAgICBz
dHJ1Y3QgcmFuZ2VzZXQgKm1lbTsNCj4+Pj4+ICsgICAgY2hhciBzdHJbMzJdOw0KPj4+Pj4gICAg
ICAgIHN0cnVjdCBwY2lfZGV2ICp0bXAsICpkZXYgPSBOVUxMOw0KPj4+Pj4gICAgICAgIGNvbnN0
IHN0cnVjdCB2cGNpX21zaXggKm1zaXggPSBwZGV2LT52cGNpLT5tc2l4Ow0KPj4+Pj4gICAgICAg
IHVuc2lnbmVkIGludCBpOw0KPj4+Pj4gICAgICAgIGludCByYzsNCj4+Pj4+ICAgIA0KPj4+Pj4g
KyAgICBzbnByaW50ZihzdHIsIHNpemVvZihzdHIpLCAiJXBwIiwgJnBkZXYtPnNiZGYpOw0KPj4+
Pj4gKyAgICBtZW0gPSByYW5nZXNldF9uZXcoTlVMTCwgc3RyLCBSQU5HRVNFVEZfbm9fcHJpbnQp
Ow0KPj4+PiBZb3UgYXJlIHN0aWxsIG5vdCBhZGRpbmcgdGhlIHJhbmdlc2V0IHRvIHRoZSBkb21h
aW4gbGlzdCwgYXMgdGhlIGZpcnN0DQo+Pj4+IHBhcmFtZXRlciBwYXNzZWQgaGVyZSBpbiBOVUxM
IGluc3RlYWQgb2YgYSBkb21haW4gc3RydWN0Lg0KPj4+Pg0KPj4+PiBHaXZlbiB0aGUgY3VycmVu
dCBzaG9ydCBsaXZpbmcgb2YgdGhlIHJhbmdlc2V0cyBJJ20gbm90IHN1cmUgaXQgbWFrZXMNCj4+
Pj4gbXVjaCBzZW5zZSB0byBsaW5rIHRoZW0gdG8gdGhlIGRvbWFpbiBBVE0sIGJ1dCBJIGd1ZXNz
IHRoaXMgaXMga2luZCBvZg0KPj4+PiBhIHByZXBhcmF0b3J5IGNoYW5nZSBhcyBvdGhlciBwYXRj
aGVzIHlvdSBoYXZlIHdpbGwgaGF2ZSB0aGUNCj4+Pj4gcmFuZ2VzZXRzIHBlcm1hbmVudCBhcyBs
b25nIGFzIHRoZSBkZXZpY2UgaXMgYXNzaWduZWQgdG8gYSBkb21haW4uDQo+Pj4+DQo+Pj4+IExp
a2VseSB0aGUgYWJvdmUgcmVhc29uaW5nIChvciB0aGUgYXBwcm9wcmlhdGUgb25lKSBzaG91bGQg
YmUgYWRkZWQgdG8NCj4+Pj4gdGhlIGNvbW1pdCBtZXNzYWdlLg0KPj4gSWYgSSBmb2xkIHRoZW4g
dGhlcmUgaXMgbm8gcmVhc29uIHRvIGFkZCB0aGUgY29tbWVudCwgcmlnaHQ/DQo+IEknZCBzYXkg
eW91IHN0aWxsIHdhbnQgdG8ganVzdGlmeSB0aGUgY2hhbmdlIGZyb20gImFub255bW91cyIgdG8g
Im5hbWVkIGFuZA0KPiBhY2NvdW50ZWQiLg0KIk1ha2UgdGhlIHJhbmdlIHNldHMgcGVybWFuZW50
LCBlLmcuIGNyZWF0ZSB0aGVtIHdoZW4gYSBQQ0kgZGV2aWNlIGlzDQphZGRlZCBhbmQgZGVzdHJv
eSB3aGVuIGl0IGlzIHJlbW92ZWQuIEFsc28gbWFrZSB0aGUgcmFuZ2Ugc2V0cyBuYW1lZA0KYW5k
IGFjY291bnRlZC4iDQoNCldpbGwgdGhpcyB3b3JrIGluIHRoZSBjb21taXQgbWVzc2FnZT8NCj4N
Cj4gSmFuDQo+DQo+DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

