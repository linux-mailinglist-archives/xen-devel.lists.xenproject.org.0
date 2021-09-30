Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0917C41D7A6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 12:26:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199740.353980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVtGy-0003zL-QY; Thu, 30 Sep 2021 10:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199740.353980; Thu, 30 Sep 2021 10:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVtGy-0003xO-NB; Thu, 30 Sep 2021 10:26:40 +0000
Received: by outflank-mailman (input) for mailman id 199740;
 Thu, 30 Sep 2021 10:26:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y4Rr=OU=epam.com=prvs=0907a041b9=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mVtGx-0003xC-DO
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 10:26:39 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04f08620-6463-480c-aa20-9bcf9e789e86;
 Thu, 30 Sep 2021 10:26:38 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18UAEEXM006447; 
 Thu, 30 Sep 2021 10:26:36 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bdba281ps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 10:26:35 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7425.eurprd03.prod.outlook.com (2603:10a6:20b:260::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.19; Thu, 30 Sep
 2021 10:26:33 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::e966:6290:5736:b7bd%7]) with mapi id 15.20.4566.015; Thu, 30 Sep 2021
 10:26:33 +0000
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
X-Inumbo-ID: 04f08620-6463-480c-aa20-9bcf9e789e86
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3OVLi6bkRblPVHNZbv4G6c9zAOyJyG/MGz4cdRNd3NxuR3kAOlYliSCM5UtaYbEXAUwzrtNilu55RGF0nzxQKkK2T1hVfIFERUf0TMlkQAgz74jqVXEb4fw+cqsRoXefdfOF9ut8TkQ4M4IBnSXnYrWNtm9avvxcp3xXOcrJYc7e1jb5S3dEX+n2zpwQFRk6uwZhUx1+w8fO4d1WNjz2+hEgrsN0d+H4B/WItNNye2N2JkiIsx5G2f4itj5/hE1EQbjV+GtyHd5WXce3Dq2zqFJTE+IUnnRZhBHth83cjSg7Fa5DoK8OaDV3fyIuR3hWsaf1Tn52YAUqn6q+VqBRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gr6/izDEWd/J5qmLzgFi9em5E0EfdM6Ox5sG+11pNEU=;
 b=CkfEj2NT17lmKWpzlf7q5JtkUYvC97EIYXIfFQdA06kbAnqRLtVXXZZJ7mjd5HdCSgXMdEFxrCJuJ520mLPFiXV22coSBzFebQhL3EmjWpxyxqnDua6S6HH/tCfN+jSczBy5A1U2YghaW80k41o+LcP8cBGnGZWanWN9Hx6ogsyzowgaWU+f49Yy5+dzscSLyo0bIesqcC2uNpYUiNZUBMYIMuXpz5hyMR/DRqIIi5Q9dUTMNLkqLT3+DR7swXM1rYXlQfTngbNkqy/lfDmrqAYVDCfy677u2rS0i14sMvaDOVfRPz6G0K2l+NPyOMp6HRf9wAr0jg4pgQrZdGJhTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gr6/izDEWd/J5qmLzgFi9em5E0EfdM6Ox5sG+11pNEU=;
 b=W6rqw4VDugOowYSa/eF5Ug3YLnhHuTvb8rKzPsANXzb91x0XHGe3AD6DE5q0PxCtZt+XVBoJkKhIaNK3Tarssc1CbNPG4qkn8KPiDlJr/Q203dewbDPYKzcnr/k+zYUeKY3epusDb0h+FIbOrPSsekPCmbVNMK9JDs8Ng0S0phDne4YPeAwJLvCY1Pu6siBod2GQGg9yQYg+gHICmrhulZF/2atcC4465mVLxRefhpVUy7zAe1VuzYF8p24/l3Wf4frNjaJbbbDCbBCx3Jogwgbp0FRZaibxhBaVcvxtPr8zj7fZQsBKQUSbe1dS8ZkM3SiXSh1r98DYMbOO3JwpaQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
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
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 10/11] vpci: Add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v3 10/11] vpci: Add initial support for virtual PCI bus
 topology
Thread-Index: AQHXtdAlOCu2AnkIOUC4Prsocox3squ8RSWAgAAMGACAAA2QAIAAANkA
Date: Thu, 30 Sep 2021 10:26:33 +0000
Message-ID: <939859eb-8358-5363-337b-926b13324350@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-11-andr2000@gmail.com>
 <ef2c008f-7682-1549-8d27-712b04fbd84f@suse.com>
 <603e2cdf-748f-f18b-99f4-44ddf3c0b9c1@epam.com>
 <84368ff1-64f5-418f-6a49-5098b7edf119@suse.com>
In-Reply-To: <84368ff1-64f5-418f-6a49-5098b7edf119@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f97947b5-0227-4631-042e-08d983fcc675
x-ms-traffictypediagnostic: AM9PR03MB7425:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB7425DC8FB0491AEC5F799B1CE7AA9@AM9PR03MB7425.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 VMI9N0n8tk3CvtenElmRRK7+9B7xN4COtyGDy+RZeezl9dlHZ5iLO152JtggEJbodoCdRLs5g0/3hl9l3Sy82ryGMhz6mQg53cAVx/ktTymTOUFHTXNewlrJU0mT6nG2O8U8uJ8ZDilu/1BUf++Y/8rjQzG5IuoKNuVjBzJ+rUtPvoQzcFQ07qv+EFo0zdo4kP98H+9Ottx3GwhZ6vhj9JCxR/fYqXy0qMcYxoJXR3gUWPq7hkQaOcRfPuXYEdnVWRxdFHNVsxUbxfEC9GNh3fbu/pa+IkjjS1EEPGLL/SugyE7ZzUS4AZDrTQ4//rM5VhF4DvfVBjkttGEvtbcJk4zlVo/LmMWY8QYueQ52kZ/VmhQh4xgRwV3eOeH7a/nZUMYmfjmxjq7/CooQC7Re/YhwYrtHo6PfQQOUygVtJr+BqX01+feKnIgab7pJ5fcSHW3gcL6I1DSkg4AZhGtvJLvumIqk9y5e8Pin/RErQ6F06kohG1HbJXUpDZvZrlTV+QghK8RPHSXu2qTz8FlLRRjc6ILcHC7JmWKLcqBEUZg1EJs1rlU/Cl9IzFFwGkcD2zvaDnFZCue4vPBhY3Tew7aWEP7PLZsp5VrdunpB/NONaAkK86PPDL7lnhyCnKSCyAdome3srjm9d/8bxpcTEgBGNKpIZyUcN1uZtQBrs8m/tQzh4OwQJRaS197LQYEY5DKO/TzC4b0m+ttI6gbGz2MYyqKENPuS0dpGYE6hU6jIhHlxtOsn3rKK9uKh6pgk
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(316002)(8676002)(122000001)(26005)(4326008)(36756003)(53546011)(83380400001)(2906002)(54906003)(6506007)(71200400001)(6916009)(5660300002)(6486002)(64756008)(66946007)(186003)(107886003)(76116006)(55236004)(66556008)(38070700005)(91956017)(31696002)(31686004)(86362001)(2616005)(66476007)(6512007)(508600001)(66446008)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SW1HWXFLQlozMVpWdWVmamtJSWFKK1V1SmJ2ci9PNlJMSHZ6TzRKd203clp0?=
 =?utf-8?B?QzZNbmlhTm15aHFuM0RocWs0YjZwR2xZdmVURWpUUnY2bS9WNUhEcCszY0Jp?=
 =?utf-8?B?T3hjeWZBb1EzWFJPczRQMVNvNVN3M0hUNFB3ZnNqL2dGeGs0MHpadUF3NzlC?=
 =?utf-8?B?SWUxZ1dSbnB1aGlUVzJEWm9adXZhOERNS1pjejV5TGlUSkxvUzFUM3YyQ3Zj?=
 =?utf-8?B?NDgxOFRMUkVQM1FteHAzNjRlTXhwQ3ZIWjRFU1E0d3oyTm92QnVGNlF4dTBD?=
 =?utf-8?B?bWNHNWhsVHVYNlpPRG91Y0pCdTRVSTFxeTIzb3ZmYXRUdXl6L3dBT3AvQlVV?=
 =?utf-8?B?S2lsTU1kN29abjBieitXNDdrd3hCcFlGd08vdEtqWlNpZmxCUmJkQU5DUmtr?=
 =?utf-8?B?R0cvT29sR2JURHg5dVlHczllNHowU2ZqVkVFdVVPeGN4T1JidDFDYzdwRkhT?=
 =?utf-8?B?cDNsUTE3d1poSFoza0lWTEQ1djJ2aFUyUzlaSHhwVTBFZUd5aW4xNEZkemJk?=
 =?utf-8?B?T3NTVXJoMTFxVFlWd1FJY0F5M0w5c3Z5c29tNEVWL2FTckMxdzNxYks3cnNS?=
 =?utf-8?B?SmZZS1hlUHZ1aEs3dENBUUJ2c1lpMHJMNzZBNlRUK0tpYjhCYzBnVGE0SCtm?=
 =?utf-8?B?ZVljamFXdjY0NkdzR0l2dE9PRWVKL3J5MVo1S0Nza0dmbkxndWJHY3c3eitm?=
 =?utf-8?B?RSswYk5GcDVRcGY2MnkxYy9uZUo5ajYxaTQ1K2EyaTJ0OEY4a3g4NU0zTGQ1?=
 =?utf-8?B?YXdUdlBmTloyME01QzBqYnlMZFhoaXlqNmx0WWxmaWFOTHZIYVVuSklQSyt5?=
 =?utf-8?B?Wm5xdElEMDRqSDJRYmpSK2dxWmM3aThreHZ4bDYzbERBQXFzZmtjWFFXcFB3?=
 =?utf-8?B?K0l4aDFXN3pBS0Jmc3pSeDNiMlZIc1Q3NjRQV2NjZU56STlvMHdpbzYwMEpv?=
 =?utf-8?B?cjA3YjJocTh1K2Jqb0RGc3Qrb3NYT1BTVCtUMkZsWjFLRkd0VDlsSTRYVEoz?=
 =?utf-8?B?dHZzZldsRFFKbmQzOVdHendMOVpNdC96ejhoZnI4N3k4c0JUeXdRbVVQWDdu?=
 =?utf-8?B?VFFFdXVjL3FCT1ZCazhMUWllVDArbmM3eUZiZmZYZ0F3VG14UFQ2bTFXZytn?=
 =?utf-8?B?RjVXYzVTTDdMcDc5cmtKT2lBdUdRc0UvSTR0LzQreFJ0U0FZc292R1JmSjdl?=
 =?utf-8?B?T0dUNXV5Mnh1RHBLL1RpL2VlUnFtVytFOEJIbzhyNmVTYVhueC9wZGdvVmQy?=
 =?utf-8?B?RDA2Z2NNL3dWMzFacHRFeHV4T0xrOHdaVDNQU3JVa2dlMk5kWEN1SWt3K1o5?=
 =?utf-8?B?d3MwU1pIanZmeVVBZStsamhVWHVpOFNKYkM3bTduMWdFM3JKMW05Y283V0s3?=
 =?utf-8?B?Rk11TGhpRURMdUJZWUd3MmVzeVhYbzY1YnU2SnJTZWZvQXo5U3BEdXdiS1FL?=
 =?utf-8?B?b3lCWDJ5ZCs0QWlFM1NURWtIUkphZlduZmt4anBtVGxiRkdSanFKT3RqWi94?=
 =?utf-8?B?SUJyR3p6OElQSGR3eGpFZmlHMkdGQk9kbjM0VFRuU1RDSVFOcTMwdmVmZ1Y0?=
 =?utf-8?B?YmtGMWQxRDc3dng1VHlqRGRvVk9aYkhBc2cxOHJMb3RpdUdoS1pucjdROWVh?=
 =?utf-8?B?ZDFiTjJLaVlCd25rVUltVFM4WkppYzJtR0dDRjUzSG5NRXJoVy9pVnU5emIx?=
 =?utf-8?B?UUZrVFJ1RUFUbENJV2dwNzFKNU1hS2FLZ3Y1WEt1OHdqeThuTW1DWjFhaW9L?=
 =?utf-8?B?ODRvd2VxWW5TNDJMYjZaUWZhaEFJTTRwVGt4N0VMeUwzYzhvVE9JUXlMb0dz?=
 =?utf-8?B?d0pWdk9MbnZVYmhqbmRlUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6C715EEF6FE55498778AC8575B143DE@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f97947b5-0227-4631-042e-08d983fcc675
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 10:26:33.2717
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tFifY7LdZ015TtTmlm4xcuXChwvDRu10K5gjhxicTMy5Fkx+a7hvTx9TRAm/9N2KkTSsOXOr6E8L6RGg1yZsBu7BLN7huq/mVSYnQGt9G9PWgreUy3MOtY9LTBdNeI40
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7425
X-Proofpoint-ORIG-GUID: O36zuhWDuTfCoEl2WmBjYvKz-R1JW7Uv
X-Proofpoint-GUID: O36zuhWDuTfCoEl2WmBjYvKz-R1JW7Uv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_03,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109300064

DQoNCk9uIDMwLjA5LjIxIDEzOjIzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMzAuMDkuMjAy
MSAxMTozNCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAzMC4wOS4yMSAx
MTo1MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMzAuMDkuMjAyMSAwOTo1MiwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL3BjaS5jDQo+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+Pj4+
IEBAIC04MzEsNiArODMxLDY2IEBAIGludCBwY2lfcmVtb3ZlX2RldmljZSh1MTYgc2VnLCB1OCBi
dXMsIHU4IGRldmZuKQ0KPj4+PiAgICAgICAgcmV0dXJuIHJldDsNCj4+Pj4gICAgfQ0KPj4+PiAg
ICANCj4+Pj4gKyNpZmRlZiBDT05GSUdfSEFTX1ZQQ0lfR1VFU1RfU1VQUE9SVA0KPj4+IE1heSBJ
IGFzayB3aHkgdGhlIGNvZGUgZW5jbG9zZWQgYnkgdGhpcyBjb25kaXRpb25hbCBoYXMgYmVlbiBw
dXQgaGVyZQ0KPj4+IHJhdGhlciB0aGFuIHVuZGVyIGRyaXZlcnMvdnBjaS8/DQo+PiBJbmRlZWQg
dGhpcyBjYW4gYmUgbW92ZWQgdG8geGVuL2RyaXZlcnMvdnBjaS92cGNpLmMuDQo+PiBJJ2xsIG1v
dmUgYW5kIHVwZGF0ZSBmdW5jdGlvbiBuYW1lcyBhY2NvcmRpbmdseS4NCj4+Pj4gK3N0YXRpYyBz
dHJ1Y3QgdnBjaV9kZXYgKnBjaV9maW5kX3ZpcnR1YWxfZGV2aWNlKGNvbnN0IHN0cnVjdCBkb21h
aW4gKmQsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4gK3sNCj4+Pj4gKyAgICBzdHJ1
Y3QgdnBjaV9kZXYgKnZkZXY7DQo+Pj4+ICsNCj4+Pj4gKyAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5
ICggdmRldiwgJmQtPnZkZXZfbGlzdCwgbGlzdCApDQo+Pj4+ICsgICAgICAgIGlmICggdmRldi0+
cGRldiA9PSBwZGV2ICkNCj4+Pj4gKyAgICAgICAgICAgIHJldHVybiB2ZGV2Ow0KPj4+PiArICAg
IHJldHVybiBOVUxMOw0KPj4+PiArfQ0KPj4+IE5vIGxvY2tpbmcgaGVyZSBvciAuLi4NCj4+Pg0K
Pj4+PiAraW50IHBjaV9hZGRfdmlydHVhbF9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgY29uc3Qg
c3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+ICt7DQo+Pj4+ICsgICAgc3RydWN0IHZwY2lfZGV2
ICp2ZGV2Ow0KPj4+PiArDQo+Pj4+ICsgICAgQVNTRVJUKCFwY2lfZmluZF92aXJ0dWFsX2Rldmlj
ZShkLCBwZGV2KSk7DQo+Pj4gLi4uIGluIHRoaXMgZmlyc3QgY2FsbGVyIHRoYXQgSSd2ZSBtYW5h
Z2VkIHRvIHNwb3Q/IFNlZSBhbHNvIGJlbG93IGFzDQo+Pj4gdG8gdXAgdGhlIGNhbGwgdHJlZSB0
aGUgcGNpZGV2cy1sb2NrIGJlaW5nIGhlbGQgKHdoaWNoIGF0IHRoZSB2ZXJ5DQo+Pj4gbGVhc3Qg
eW91IHdvdWxkIHRoZW4gd2FudCB0byBBU1NFUlQoKSBmb3IgaGVyZSkuDQo+PiBJIHdpbGwgbW92
ZSB0aGUgY29kZSB0byB2cGNpIGFuZCBtYWtlIHN1cmUgcHJvcGVyIGxvY2tpbmcgdGhlcmUNCj4+
Pj4gKyAgICAvKiBFYWNoIFBDSSBidXMgc3VwcG9ydHMgMzIgZGV2aWNlcy9zbG90cyBhdCBtYXgu
ICovDQo+Pj4+ICsgICAgaWYgKCBkLT52cGNpX2Rldl9uZXh0ID4gMzEgKQ0KPj4+PiArICAgICAg
ICByZXR1cm4gLUVOT1NQQzsNCj4+PiBQbGVhc2UgYXZvaWQgb3Blbi1jb2RpbmcgbGl0ZXJhbHMg
d2hlbiB0aGV5IGNhbiBiZSBzdWl0YWJseSBleHByZXNzZWQuDQo+PiBJIGZhaWxlZCB0byBmaW5k
IGEgc3VpdGFibGUgY29uc3RhbnQgZm9yIHRoYXQuIENvdWxkIHlvdSBwbGVhc2UgcG9pbnQNCj4+
IG1lIHRvIHRoZSBvbmUgSSBjYW4gdXNlIGhlcmU/DQo+IEkgd2Fzbid0IGhpbnRpbmcgYXQgYSBj
b25zdGFudCwgYnV0IGF0IGFuIGV4cHJlc3Npb24uIElmIHlvdSBncmVwLCB5b3UNCj4gd2lsbCBm
aW5kIGUuZy4gYXQgbGVhc3Qgb25lIGluc3RhbmNlIG9mIFBDSV9GVU5DKH4wKTsgSSdkIHN1Z2dl
c3QgdG8NCj4gdXNlIFBDSV9TTE9UKH4wKSBoZXJlLg0KR3JlYXQsIHdpbGwgdXNlIHRoaXMuIEl0
IGlzIGluZGVlZCBkb2VzIHRoZSBqb2IgaW4gYSBjbGVhciB3YXkuDQpUaGFuayB5b3UhIQ0KPiAg
IChNeSBydWxlIG9mIHRodW1iIGlzOiBCZWZvcmUgSSB3cml0ZSBhIGxpdGVyYWwNCj4gbnVtYmVy
IGFueXdoZXJlIG91dHNpZGUgb2YgYSAjZGVmaW5lLCBhbmQgbm90IDAgb3IgMSBvciBzb21lIHN1
Y2gNCj4gc3RhcnRpbmcgYSBsb29wLCBJIHRyeSB0byB0aGluayBoYXJkIGhvdyB0aGF0IG51bWJl
ciBjYW4gaW5zdGVhZCBiZQ0KPiBleHByZXNzZWQuIFN1Y2ggZXhwcmVzc2lvbnMgdGhlbiBvZnRl
biBhbHNvIHNlcnZlIGFzIGRvY3VtZW50YXRpb24gZm9yDQo+IHdoYXQgdGhlIG51bWJlciBhY3R1
YWxseSBtZWFucywgaGVscGluZyBmdXR1cmUgcmVhZGVycy4pDQpTb3VuZHMgZ29vZA0KPiBKYW4N
Cj4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

