Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 069DC419626
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 16:21:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196941.349852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUrUz-0003wK-NT; Mon, 27 Sep 2021 14:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196941.349852; Mon, 27 Sep 2021 14:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUrUz-0003to-KB; Mon, 27 Sep 2021 14:20:53 +0000
Received: by outflank-mailman (input) for mailman id 196941;
 Mon, 27 Sep 2021 14:20:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1Nw=OR=epam.com=prvs=9904516479=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mUrUz-0003ti-1v
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:20:53 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e8897d4-1f9e-11ec-bc4d-12813bfff9fa;
 Mon, 27 Sep 2021 14:20:52 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18RDvol1014855; 
 Mon, 27 Sep 2021 14:20:48 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bbf3hg6tt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 14:20:47 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7074.eurprd03.prod.outlook.com (2603:10a6:20b:2dc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 14:20:44 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 14:20:44 +0000
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
X-Inumbo-ID: 1e8897d4-1f9e-11ec-bc4d-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ecy+SwcG2eZsQDltZKSXT8hNdM7Qhvjfk3xs2RTnYCoFeZA22oRUf1FjeUnDTg3SJFqboi3X0nKn+jurgvVzQtGwfOUEhgWakKLsPWiWNm0WFccN49umJiZzmFdGowLuwo9TpDhK7ANXB3jxq/KZdM/5gtGFFU/kjo81TTHZS0M67sdxhqFYe2IlGoeni0dAbR9UwHhnHiKmHDBBeZykvdgjfK3bed2miys7AkjMjBORpJepf3z/XMKKx7jGFM8HHu34L8WQf2rSuuwrlueFMs7nQ3CWedDYlvtqy7iJ9ol/7WgoxPMbiDqEs7VcRTSy8CZYHYCLH9goAxI/LXkJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wXAQV8+kQ/itzK45s1YY/EqBxz8tyUcP1XPq5UjuqVc=;
 b=OkZGVXrvU4ikVJkWatiDcXCXXBufCVRUHcWj9Is7Pvbkflg0xPS5yP42KgR889kC0pmi8pTL/L3aZrjouBSE0l4HSifBy4Rlq4i5xdJbMTv+7CgNXaxlZwyWQkqeLFO/x/SgPYvh31LawfSQHTv00sBAurSsa+4OHRNDvT8XQlhdtVYPBEgD/6gx2dsm56aVzyU5Fmb9cJ647NJjgCOHZJjB5984Z6uzohKohzdjfRCAzEH8JVQUuxJsTzet1L+Nbvfb9JfxJ4p6q0WWmNwRxAu8yOyak0iZPXGkqvZTCb1T0ELpWG+E7KWNlD9TTJ8NFGQ6K/YM28uRNdPHN3VmUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXAQV8+kQ/itzK45s1YY/EqBxz8tyUcP1XPq5UjuqVc=;
 b=klR/8SG1RxJVBeP++EXA8GLjBIHoAc769Qq0HNOXa7AVruyTOom/qhMILxhdrpWZrW+0jJrV8HhWRI8yCcdWLm5NSpj1nb461CuetBdcHE1sn8DQ1bKRyKq5KBF6div4g3caQ9VrZQgFdKmpi8jipoYujBeiCTxoADLUDooY8gDRdCBLTzTboINcjLNdgXCAlEpvwAIf9qzkkp32vbv6zzo0d7NHe8lc73CweO5C8/AVqndY46Gs9keaREfeD/KOgF2tEA/FKvapblIwAWgXzDk8xEUZ3xpKKc/igw8R/zWUpV0PoCdEejJD49T1h9UPNrwYj1VXZn6pIXOqj1zUfw==
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
Subject: Re: [PATCH v2 11/11] xen/arm: Translate virtual PCI bus topology for
 guests
Thread-Topic: [PATCH v2 11/11] xen/arm: Translate virtual PCI bus topology for
 guests
Thread-Index: 
 AQHXsHpEqeYVqdD8fU+X35KPuXAnA6u3xY6AgAAKMQCAABgZgIAAAowAgAACGoCAAAOoAIAAA10AgAABPwA=
Date: Mon, 27 Sep 2021 14:20:44 +0000
Message-ID: <e2c8947a-8389-320e-f896-1a7254bb189e@epam.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-12-andr2000@gmail.com>
 <df675ecd-3774-4b5e-241b-0a68e36c99f9@suse.com>
 <d08a9d34-5f75-f266-f8fb-95594fb0a8b0@epam.com>
 <3dcba7a0-6984-a9bf-6121-5003bbc2ccaa@suse.com>
 <27378eb1-7dad-29a4-a136-c9e5e55a2067@epam.com>
 <299f330a-3a99-e87a-d182-762247371e3d@suse.com>
 <e0ee94e4-4076-ac51-f5a8-d895220d1522@epam.com>
 <67bf6cff-5e1f-0770-f212-b6bc0d82838e@suse.com>
In-Reply-To: <67bf6cff-5e1f-0770-f212-b6bc0d82838e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61fb08e7-ba6a-4343-8146-08d981c1fe69
x-ms-traffictypediagnostic: AM9PR03MB7074:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB7074FB8E68CBDE61A45DF1D2E7A79@AM9PR03MB7074.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /e1oM/wWdRqe+JpEKqWPzWod8usD87nqSrv3zbhFBJr5AkTaWBFaD0mYcxjWwx9A0rbtRjKL9vV2h54oUWwirpquKEP5Fqjsh+fwHa7rYWvRC6FRJQ7ouPvsEhtjiOJ77ZEodgXz0lbpGOW7hhXSUtEIbunQB1uWXWKTWkd5tyvQJ36bOeJe4mk5YAEEaYK6LJbGjWDk8ejNaavxDUeVsCiSS8H/nSqDw5BdGwg4eJ167J3zU6mx4ob+VqesUdeo7jQQJ+13obd7oP59fScyctuBYk8OwYiZC+CYxYQcbqsMAb9Pk1yp6CiE+3C+ksrsLx0UdHe/YEujVO7g//nMbI16Y80/aP/qR72FneEtVVL3tL3ld0GfYJGiu4F4T0Be0utzIShU6wCfi0Dcl0kEDds8b17Ddi0pLSRpjVB2CPVk5qOEQ51SyN+/por1xyPsEMgtgpVg/ZyX/J0IfP936oSYSZFv9/L6c6ptY7a+MrziFkMNmKQCvEsWAqQEPNG43p39VGLEL9heBnIUATgkbDrRak2JHdDuwYbNv65DnHD6kywm4/cuJLVOkzwiSHrZ40PJQzBCvfKThMqy6TfVny2VhfewoIAxgQf+tB9Z1Ou7P6X16QzCdqeZesp1rDQaC6SU/NEQJ2Z9KI9Xy+2DtAt0xfgZdh9zf6FeJtxPh+/2kMPQ90I3a03oak1zL5IVAz6DIZWrTDuz2CQh1zsw8wEFPjiB1Owf4awJ7oe+a097yk+5V3DQBXUIMJbrJD2K
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(6512007)(66446008)(316002)(64756008)(86362001)(122000001)(76116006)(36756003)(91956017)(6486002)(66946007)(31696002)(6506007)(107886003)(66556008)(83380400001)(8676002)(4326008)(38070700005)(8936002)(66476007)(38100700002)(71200400001)(186003)(55236004)(31686004)(26005)(53546011)(6916009)(2906002)(508600001)(2616005)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U3ZDSXRoNXVvSktmaTJGMEp5cEVoWHVId1NRbkx1bktnM2ExWmJ2Mk03c3Bk?=
 =?utf-8?B?aFBiRlc3M0JhY0dwb1F1dFNCWWJCZXZSa1RZRlJpZXV3bkdxUjc0Y0FIM09r?=
 =?utf-8?B?Z3ZZSWVRM1NaWDB4QTR1TVBxZGNvRDJsTVBzdGpBSzAzcVN0OFdibzI4N1g2?=
 =?utf-8?B?TEkxWFp3VC9kVTJwbm03VXRneTI5UUxDSEtkTEJjTlQ3eFFuNW4ybHZLajVE?=
 =?utf-8?B?OWRxNWlxdGp0VS9MT2t5bUtYdXU0UGxuM3V4MWZ2NkQzUWRUMkhweGdSbXMy?=
 =?utf-8?B?cWNuckdvTXVsT01QTjRYQjRvOTJQZ1JhN3hOL2hkcFRqY2xNV0RadnBPaUJJ?=
 =?utf-8?B?VVducEpLVm1pb3pPNXRLS2s3RTRaam1ZdndQTFVtSWU0VDRYRGx4OWJmTElE?=
 =?utf-8?B?cEROQXJqVVluSDc2d2NPVmNvWTNBQ3BLeTNidGNQWnhqYndBNy93UTByQS9x?=
 =?utf-8?B?Y0YwV1JpTXhoVWczL3U2RFJIRDF2bDUxOXF2RW03bVNhSGhCNWYxNGlNelUw?=
 =?utf-8?B?TmpLMXMxUmtRWjRmR3kwUXZaK1hpODJtUDBEV2ZzcnorMHY5NmxsRUYzSHRu?=
 =?utf-8?B?Q2JyM2VhK05MZkZvLzZINzg2UWhuYStwWkhQNVVYaXV5M3U0NjJOTXc0eXVl?=
 =?utf-8?B?cFRJQkQ0bEZyTUd2NFJSY09VZ250WVdESVAvbjk3Z3VlZVNuSU5zVDh1QVVi?=
 =?utf-8?B?U294eCtuL1FSVTNFQTdvY3NPazFxWFJPSjdIdUtJRksvZGpBaEJmNkJLK1lR?=
 =?utf-8?B?OEtQZTlOcXV5Z29qWWFmQVVSY1drVlpDRnRKT1pjOVdoYnZxd2REOGNzWFBm?=
 =?utf-8?B?ekZGd0RkNmVZUjlJbzlaQzhoWFNjd2R1Sy85ZUdYMzc0RnFKZ1RXWk5SSEhH?=
 =?utf-8?B?ajhVWXRxSjludU1vNzNHUzZQVUg4ci9seTc1SHJqQ2lrdm5yUWdFWjJzTUJN?=
 =?utf-8?B?dXlUeDdmUVkyK0pISm5scno5czk0d2E2WXlwb1NnajMxUy83TnBVS0gyVFZw?=
 =?utf-8?B?OGpkRGNuTDAxVzExRXV5ckFMcG4rMmtWOG5MYmJPMzlhdDlMSW91a0NLYVZX?=
 =?utf-8?B?TFJRZVdnakdwZ1hQczg4RXYxd211b2t4ZXUyK0l2VllVdEdFaEtYYkRyWnhH?=
 =?utf-8?B?RnNpL0lSM1VYZXpiMyt1NFpUVmpCUFREWjZBajZzbXA3OUhkcVpFV2gvWENT?=
 =?utf-8?B?cnU5c0VkV1Y1TFFMMndOb0RPelRTcHpGcUFSYVlzQmZmWmhuNFBlT3pPazRF?=
 =?utf-8?B?Qnpja3R2eHAzWDk4eGdXVE5tM1plaHZXWDVHeitvc1hEeUNWUi9Vdml5cmpU?=
 =?utf-8?B?TktreVdNNkhFNndabmRoYlJBT05uUUZMVE1ydHcxeEZzaVUxNFovSTBRVUZ0?=
 =?utf-8?B?bGxTVUxRMVorY0xxUTRIelNrd1htcmo3a1hnOG1iS0R4WVp0VWNaZ2xZSExO?=
 =?utf-8?B?U3RhZGlRMjk4YnhuRUphUWFtenc4QmFKbGtSeHVFVWhNOTZLNndaTlRYS1lH?=
 =?utf-8?B?YlphY25xNFJMMHNLWTdDRXlFSVhPdjFoWmNud3BUbCsvV1BScnphbDluNHdW?=
 =?utf-8?B?VmM4N2t5bWxReG1JM3UxY3lHREQyaTB2RFprbHNXOTVCTzAyREVzNzRsSFo1?=
 =?utf-8?B?OHEwamdiWkJmV1czaHZEK000cHZDMGxTZGtqbkwxWU5zd2tpL2hSeitWSEV3?=
 =?utf-8?B?d2hudUxabmR2VHdSaUFLRFh1elA1OFErWkdsRElTNGl4RHV2UUdwSUhMekd4?=
 =?utf-8?B?RDJsSlNZdHA3M0JBZjF5UUZCMzlkdWgvTDdkUE5EdjJsYzBJbisxejU4SG1u?=
 =?utf-8?B?K3BJb1EyUUlUdW5GQ0x6dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B6DD71F2D68ED44BCD240159EC379D1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61fb08e7-ba6a-4343-8146-08d981c1fe69
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 14:20:44.5708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GobgtISrZoPIcFlc1HvXYXWaVmXTiwnlq08zYW4GH/t4MpbhX/V4vHA/jtFY8kfagXeDgGcIR5HAvG1E2NUIM2apYZIDyUisyh5FZqA3pN71Syfsw0sSI7/Ky7IUexr6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7074
X-Proofpoint-GUID: 9JznE2oD4tko5epW91P-3ObeCvhRyUWe
X-Proofpoint-ORIG-GUID: 9JznE2oD4tko5epW91P-3ObeCvhRyUWe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_06,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109270098

DQpPbiAyNy4wOS4yMSAxNzoxNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI3LjA5LjIwMjEg
MTY6MDQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMjcuMDkuMjEgMTY6
NTEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI3LjA5LjIwMjEgMTU6NDMsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAyNy4wOS4yMSAxNjozNCwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+PiBPbiAyNy4wOS4yMDIxIDE0OjA4LCBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAyNy4wOS4yMSAxNDozMSwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+Pj4+Pj4+IE9uIDIzLjA5LjIwMjEgMTQ6NTUsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdy
b3RlOg0KPj4+Pj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+Pj4+
Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+Pj4+Pj4+PiBAQCAtODkw
LDYgKzg5MCwzMSBAQCBpbnQgcGNpX3JlbW92ZV92aXJ0dWFsX2RldmljZShzdHJ1Y3QgZG9tYWlu
ICpkLCBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4+Pj4+ICAgICAgICAgIHJldHVy
biAwOw0KPj4+Pj4+Pj4gICAgICB9DQo+Pj4+Pj4+PiAgICAgIA0KPj4+Pj4+Pj4gKy8qDQo+Pj4+
Pj4+PiArICogRmluZCB0aGUgcGh5c2ljYWwgZGV2aWNlIHdoaWNoIGlzIG1hcHBlZCB0byB0aGUg
dmlydHVhbCBkZXZpY2UNCj4+Pj4+Pj4+ICsgKiBhbmQgdHJhbnNsYXRlIHZpcnR1YWwgU0JERiB0
byB0aGUgcGh5c2ljYWwgb25lLg0KPj4+Pj4+Pj4gKyAqLw0KPj4+Pj4+Pj4gK2Jvb2wgcGNpX3Ry
YW5zbGF0ZV92aXJ0dWFsX2RldmljZShzdHJ1Y3QgdmNwdSAqdiwgcGNpX3NiZGZfdCAqc2JkZikN
Cj4+Pj4+Pj4gV2h5IHN0cnVjdCB2Y3B1LCB3aGVuIHlvdSBvbmx5IG5lZWQgLi4uDQo+Pj4+Pj4+
DQo+Pj4+Pj4+PiArew0KPj4+Pj4+Pj4gKyAgICBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWlu
Ow0KPj4+Pj4+PiAuLi4gdGhpcz8gSXQncyBhbHNvIG5vdCByZWFsbHkgbG9naWNhbCBmb3IgdGhp
cyBmdW5jdGlvbiB0byB0YWtlIGENCj4+Pj4+Pj4gc3RydWN0IHZjcHUsIGFzIHRoZSB0cmFuc2xh
dGlvbiBzaG91bGQgYmUgdW5pZm9ybSB3aXRoaW4gYSBkb21haW4uDQo+Pj4+Pj4gQWdyZWUsIHN0
cnVjdCBkb21haW4gaXMganVzdCBlbm91Z2gNCj4+Pj4+Pj4gQWxzbyAtIGNvbnN0IHBsZWFzZSAo
YXMgc2FpZCBlbHNld2hlcmUgYmVmb3JlLCBpZGVhbGx5IHdoZXJldmVyIHBvc3NpYmxlDQo+Pj4+
Pj4+IGFuZCBzZW5zaWJsZSkuDQo+Pj4+Pj4gT2sNCj4+Pj4+Pj4+ICsgICAgc3RydWN0IHZwY2lf
ZGV2ICp2ZGV2Ow0KPj4+Pj4+Pj4gKyAgICBib29sIGZvdW5kID0gZmFsc2U7DQo+Pj4+Pj4+PiAr
DQo+Pj4+Pj4+PiArICAgIHBjaWRldnNfbG9jaygpOw0KPj4+Pj4+Pj4gKyAgICBsaXN0X2Zvcl9l
YWNoX2VudHJ5ICggdmRldiwgJmQtPnZkZXZfbGlzdCwgbGlzdCApDQo+Pj4+Pj4+PiArICAgIHsN
Cj4+Pj4+Pj4+ICsgICAgICAgIGlmICggdmRldi0+c2JkZi5zYmRmID09IHNiZGYtPnNiZGYgKQ0K
Pj4+Pj4+Pj4gKyAgICAgICAgew0KPj4+Pj4+Pj4gKyAgICAgICAgICAgIC8qIFJlcGxhY2Ugdmly
dHVhbCBTQkRGIHdpdGggdGhlIHBoeXNpY2FsIG9uZS4gKi8NCj4+Pj4+Pj4+ICsgICAgICAgICAg
ICAqc2JkZiA9IHZkZXYtPnBkZXYtPnNiZGY7DQo+Pj4+Pj4+PiArICAgICAgICAgICAgZm91bmQg
PSB0cnVlOw0KPj4+Pj4+Pj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4+Pj4+Pj4gKyAgICAgICAg
fQ0KPj4+Pj4+Pj4gKyAgICB9DQo+Pj4+Pj4+IEZvciBhIERvbVUgd2l0aCBqdXN0IG9uZSBvciBh
dCBtb3N0IGEgY291cGxlIG9mIGRldmljZXMsIHN1Y2ggYSBicnV0ZQ0KPj4+Pj4+PiBmb3JjZSBs
b29rdXAgbWF5IGJlIGZpbmUuIFdoYXQgYWJvdXQgRG9tMCB0aG91Z2g/IFRoZSBwaHlzaWNhbCB0
b3BvbG9neQ0KPj4+Pj4+PiBnZXRzIHNwbGl0IGF0IHRoZSBzZWdtZW50IGxldmVsLCBzbyBtYXli
ZSB0aGlzIHdvdWxkIGJ5IGEgcmVhc29uYWJsZQ0KPj4+Pj4+PiBncmFudWxhcml0eSBoZXJlIGFz
IHdlbGw/DQo+Pj4+Pj4gTm90IHN1cmUgSSBhbSBmb2xsb3dpbmcgd2h5IHRvcG9sb2d5IG1hdHRl
cnMgaGVyZS4gV2UgYXJlIGp1c3QgdHJ5aW5nIHRvDQo+Pj4+Pj4gbWF0Y2ggb25lIFNCREYgKGFz
IHNlZW4gYnkgdGhlIGd1ZXN0KSB0byBvdGhlciBTQkRGIChwaHlzaWNhbCwNCj4+Pj4+PiBhcyBz
ZWVuIGJ5IERvbTApLCBzbyB3ZSBjYW4gcHJveHkgRG9tVSdzIGNvbmZpZ3VyYXRpb24gc3BhY2Ug
YWNjZXNzDQo+Pj4+Pj4gdG8gdGhlIHByb3BlciBkZXZpY2UgaW4gRG9tMC4NCj4+Pj4+IFRvcG9s
b2d5IGhlcmUgbWF0dGVycyBvbmx5IGluIHNvIGZhciBhcyBJJ3ZlIHN1Z2dlc3RlZCB0byBoYXZl
IHNlcGFyYXRlDQo+Pj4+PiBsaXN0cyBwZXIgc2VnbWVudCwgdG8gcmVkdWNlIGxvb2sgdGltZXMu
IE90aGVyIG1ldGhvZHMgb2YgYXZvaWRpbmcgYQ0KPj4+Pj4gZnVsbHkgbGluZWFyIHNlYXJjaCBh
cmUgb2YgY291cnNlIHBvc3NpYmxlIGFzIHdlbGwuDQo+Pj4+IEFoLCB3aXRoIHRoYXQgdGhhdCBy
ZXNwZWN0IHRoZW4gb2YgY291cnNlLiBCdXQgbGV0J3MgYmUgcmVhbGlzdGljLg0KPj4+PiBIb3cg
bWFueSBQQ0kgZGV2aWNlcyBhcmUgbm9ybWFsbHkgcGFzc2VkIHRocm91Z2ggdG8gYSBndWVzdD8N
Cj4+Pj4gSSBjYW4gYXNzdW1lIHRoaXMgaXMgcHJvYmFibHkgbGVzcyB0aGFuIDEwIG1vc3Qgb2Yg
dGhlIHRpbWUuDQo+Pj4+IEJ5IGFzc3VtaW5nIHRoYXQgdGhlIG51bWJlciBvZiBkZXZpY2VzIGlz
IHNtYWxsIEkgc2VlIG5vIHByb2ZpdCwNCj4+Pj4gYnV0IHVubmVlZGVkIGNvbXBsZXhpdHkgaW4g
YWNjb3VudGluZyB2aXJ0dWFsIGRldmljZXMgcGVyIHNlZ21lbnQNCj4+Pj4gYW5kIHBlcmZvcm1p
bmcgdGhlIHJlbGV2YW50IGxvb2t1cC4gU28sIEkgd291bGQgZ28gd2l0aCBhIHNpbmdsZSBsaXN0
DQo+Pj4+IGFuZCAiYnJ1dGUgZm9yY2UgbG9va3VwIiB1bmxlc3MgaXQgaXMgY2xlYXJseSBzZWVu
IHRoYXQgdGhpcyBuZWVkcyB0byBiZQ0KPj4+PiBvcHRpbWl6ZWQuDQo+Pj4gSnVzdCB0byByZXBl
YXQgbXkgaW5pdGlhbCByZXBseTogIkZvciBhIERvbVUgd2l0aCBqdXN0IG9uZSBvciBhdCBtb3N0
DQo+Pj4gYSBjb3VwbGUgb2YgZGV2aWNlcywgc3VjaCBhIGJydXRlIGZvcmNlIGxvb2t1cCBtYXkg
YmUgZmluZS4gV2hhdCBhYm91dA0KPj4+IERvbTAgdGhvdWdoPyIgSWYgdGhlIGNvZGUgdXNlcyB0
aGUgc2ltcGxlciBmb3JtIGJlY2F1c2UgaXQncyBvbmx5DQo+Pj4gZ29pbmcgdG8gYmUgdXNlZCBm
b3IgRG9tVSwgdGhlbiB0aGF0J3MgZmluZSBmb3Igbm93LiBCdXQgc3VjaCBsYXRlbnQNCj4+PiBp
c3N1ZXMgd2lsbCB3YW50IHJlY29yZGluZyAtIGUuZy4gYnkgVE9ETyBjb21tZW50cyBvciBhdCB0
aGUgdmVyeQ0KPj4+IGxlYXN0IHN1aXRhYmxlIHBvaW50aW5nIG91dCBpbiB0aGUgZGVzY3JpcHRp
b24uDQo+PiBBcyB3ZSBkbyBub3QgZW11bGF0ZSB2aXJ0dWFsIGJ1cyB0b3BvbG9neSBmb3IgRG9t
MCB0aGVuIGl0IGlzDQo+Pg0KPj4gY2xlYXJseSBzZWVuIHRoYXQgdGhlIGNvZGUgbWF5IG9ubHkg
aGF2ZSBpbXBhY3Qgb24gRG9tVXMuDQo+Pg0KPj4gQnV0IGFueXdheXMsIHZpcnR1YWwgYnVzIHRv
cG9sb2d5IGZvciBEb21VcyBpcyBlbXVsYXRlZCB3aXRoDQo+Pg0KPj4gYSBzaW5nbGUgc2VnbWVu
dCAwLiBXZSBoYXZlIGEgc2luZ2xlIGxpc3Qgb2YgdmlydHVhbCBTQkRGcywNCj4+DQo+PiBhZ2Fp
biwgZm9yIHZpcnR1YWwgc2VnbWVudCAwLCB3aGljaCBtYXBzIHRob3NlIHZpcnR1YWwgU0JERnMN
Cj4+DQo+PiB0byBwaHlzaWNhbCBTQkRGcy4gU28sIHdlIGdvIG92ZXIgdGhlIGxpc3Qgb2Ygdmly
dHVhbCBkZXZpY2VzDQo+Pg0KPj4gYXNzaWduZWQgdG8gdGhhdCBndWVzdCBhbmQgbWF0Y2ggdGhl
IHZpcnR1YWwgU0JERiBpbiBxdWVzdGlvbiB0bw0KPj4NCj4+IGl0cyBjb3VudGVycGFydCBpbiBE
b20wLiBJIGNhbid0IHNlZSBob3cgdGhpcyBjYW4gYmUgb3B0aW1pemVkIG9yDQo+Pg0KPj4gbmVl
ZHMgdGhhdCBvcHRpbWl6YXRpb24gYmVjYXVzZSBvZiB0aGUgZmFjdCB0aGF0IERvbTAgbWF5IGhh
dmUNCj4+DQo+PiBtdWx0aXBsZSBzZWdtZW50cy4uLg0KPj4NCj4+IFNvLCBob3cgd291bGQgdGhh
dCBjb21tZW50IGxvb2sgbGlrZT8NCj4gV2VsbCAtIGlmIHRoZSBwbGFuIGlzIHRoYXQgdGhpcyBj
b2RlIHdvdWxkIG5ldmVyIGJlIHVzZWQgZm9yIERvbTAsDQo+IHRoZW4gYWxsIGlzIGZpbmUgYXMg
aXMsIEkgZ3Vlc3MuIEJ1dCBhcyB5b3UgY2FuIHNlZSB0aGUgRG9tMCBwbGFucw0KPiBvbiBBcm0g
d3J0IHZQQ0kgd2VyZW4ndCBjbGVhciB0byBtZSBhdCBhbGwuDQoNCkl0IGlzIGFsbCBuZXcgdG8g
YWxsIG9mIHVzIDspIE5vIHByb2JsZW0uDQoNCg0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCg0KT2xl
a3NhbmRyDQo=

