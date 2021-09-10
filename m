Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC093406D01
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 15:40:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184431.333066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOglM-0002BM-Bn; Fri, 10 Sep 2021 13:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184431.333066; Fri, 10 Sep 2021 13:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOglM-00028t-8C; Fri, 10 Sep 2021 13:40:16 +0000
Received: by outflank-mailman (input) for mailman id 184431;
 Fri, 10 Sep 2021 13:40:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6NG=OA=epam.com=prvs=9887a95815=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mOglL-00028n-6V
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 13:40:15 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ff4861d-123c-11ec-b23b-12813bfff9fa;
 Fri, 10 Sep 2021 13:40:14 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18ACsPxE006763; 
 Fri, 10 Sep 2021 13:40:11 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 by mx0b-0039f301.pphosted.com with ESMTP id 3b07s685yh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 13:40:11 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7347.eurprd03.prod.outlook.com (2603:10a6:20b:268::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 13:40:08 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 13:40:08 +0000
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
X-Inumbo-ID: 9ff4861d-123c-11ec-b23b-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkrVU1ej+anzw8ZTLdpW3ZOMgs920Aqdiz+JNpj2/kUmZRpdCwG82VlrXu6t8MUuZTzj168aXa/Zajyk3Eqy0TrVr6VFUbOPYvs5EMYQRij+TC7ptihU3Y67+TF1JLZyEuP48EGIdDcPX7BL2WJOWrJ1ON9Oqd7A0O/c2XQVfMy95H9PURUm4ToetR56Hw8ZVUjisjBaoOLya0N6hPZHIgIg0q5CQFAax0p8X9rQuwKIaPCKH2oau/ydcwh7mKR5DMAbb8XIEmbLCWs7fLoBpPdG5VmwpqvZLSZ0YQK+XRkVM2Z8fFPyBwsqx3iUKJsny1/iLFOuHtesNZC+AddFtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OlePrKkrCb9/MDgXM37LTRZB+WEk5eclca8hSeLEvXo=;
 b=h2x+sQWH+GBN2bFnT4ue21GIsW31Z0xq6rUorfkMmZDZWED0+U37GyKnQehp85Ngxr92rHumvOPVSHzbcK65QX2Br2yKUOuEkxmscTqzhoOgRNCGFTcCQ8gvBIFA922P30xTubZamP08uY6vZ8V7L+QJDsc3PgYe/lIM6qaABmRyVQ/xEPI4VLSv4MLNVkSF0j83tkHpdPT2dJ/a28CnAQA40gt3vArSGktmCjuxgrgtCGyUEKCcCdWYCllWj9oRkCXJkHaQWAlWkIZlQ4hpqBwnzTZd/9AW+7MqTmhles/tv6yu7+N182IzdFIlWHG21BCoP+aOs1aEauv+H5piSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlePrKkrCb9/MDgXM37LTRZB+WEk5eclca8hSeLEvXo=;
 b=eJoZNZoqK413hKRnVI2WhkxzhwWE5f+onaG1dzRTek8oIgISVsvVaQYmWB+BQ+fLm6lZTBIXKLrBJ73cgY1/0p1XhZFxvnZEacrUFnCFz7e0kf7yPsurFlPZTLK0Xquadn7wfViLeHMiYFwP2r0LOG7uqi18Qrtec+S+KefBApTI/povm8rHmDThqcRWXpIcpvXV4x2tktC/JHwM+KAzOXIY4iCaRTcwWJYDsyl6SuJhGQCt5q754soQGIUw2ZRQgatuzWDIQiofSZJV8aVHTqHv511vqoaR2HQqb/mc00GVKjfjyB99V/rP8l/U9Zj9LOkw93GezQQ3Lk69twf2CA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Index: 
 AQHXoJ6eIuPEzuAZLUmx1GA90MGEBKucAxCAgAEt4ACAABanAIAAAwIAgAABgYCAAAHPAIAAAcgAgAABzYA=
Date: Fri, 10 Sep 2021 13:40:08 +0000
Message-ID: <52da7955-ead7-f404-6e51-7d1ee7bc3142@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-10-andr2000@gmail.com>
 <247bd41c-98e6-f898-8216-e36b22158636@xen.org>
 <8db7ab42-d361-5b20-c648-7af9d0cdaad9@epam.com>
 <d7ecd474-fe0a-2bca-717e-cb82c89358ea@xen.org>
 <ad8ef71c-a834-daff-7ad8-b7c3f718a3e2@epam.com>
 <6810eefb-b6d0-9557-7bdd-80ac381e467b@xen.org>
 <7263f268-7f90-e561-4679-f78185c88cd8@epam.com>
 <0eb861db-eaf4-0919-4f54-64f448f1cdfe@xen.org>
In-Reply-To: <0eb861db-eaf4-0919-4f54-64f448f1cdfe@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e3b3be9-6e64-4ab1-8e2d-08d974608191
x-ms-traffictypediagnostic: AM9PR03MB7347:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB7347BD8F266EB4A82CDB13D8E7D69@AM9PR03MB7347.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9vjJ5k/nPt0t9hWw+0nNz+m1nQdXjv/Pjq82qHppjkXHldgUyFuOKy7xB1xB0M55v/4vdoei8Jh9YLp1+MbP6BV3IOCBDQ1vAZMheTLdlT14Fl6ZeiDoOKcuh1hLgOGqMVSAL0NCpeQSgFJLxgiiLEVO0k4yAEi8ACsD8fQbUsVKXnoQnUdIZtMa7IeHAVP3OjqybXmUObjgdVsC48e56y4xadB8FPJjgGiC0B7AN4DxmWVpg4SfpbtBxG1GIABjID6f5d15meViJPqmKU6BSCQpltfUdIdA4iUm7/G7UnNbqNk5ODUjH1qSwcMxmNweZySTXT1pE5I3POJ1++31kxwz1j3IaHDmTKxsO6Qjk23SH96Z6uAippULDFYZbPYxC5ZNVxOarPD+Gf9Nu/bbCG9nFO00r2IknVaGPFdMv3s2diEWl51PqzbpJKrF8/v0QCSR0VP5teX+JjaH+Edqf86AlUNj+JRDyv2T5kgnbWpWhdJrzCqZ3nr1eS+bQtm6z9CVJ/lrlqjrkufCtD9g63mmJE0tglrnoxFJqHhModIlrZok/1G02oScpTTlTh7N0qePXYyxs7khvoTgxIAaWRiwpdfNZdLCtSSubczTH/eduYqE7wz6eITgKnCDIi6aZlUBooY1yiL409BLa7p00TRKeASh5C3UZAbNMODj6WGsJ9dlJ4d75txqH6zz1uJ3wIDWATMRDxqcPB46GpHuZzoTaHsY6FXkz/Qym+lFPT4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(66946007)(66476007)(38100700002)(66556008)(64756008)(316002)(66446008)(6512007)(76116006)(2616005)(91956017)(31696002)(83380400001)(31686004)(478600001)(186003)(5660300002)(86362001)(26005)(71200400001)(4326008)(53546011)(122000001)(55236004)(38070700005)(54906003)(8676002)(6506007)(110136005)(6486002)(2906002)(8936002)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RWlXSDMrWnE3M0tLWm5nOTRtZmh3aVpzdHFEVHM4NkZDRTVES2p6dHMvYUVZ?=
 =?utf-8?B?Z0VKRE9LVFBWd0FpM3dLREpBSHk2T2t0QjFvNURFT0RzU2htVStLckFhN2Jv?=
 =?utf-8?B?WDJrT1BYYjhIcnRCRFUyUDVRdHNyWnA5MVBxbDVXS3BFYlVXUHZNR09SbnN4?=
 =?utf-8?B?NnN4MG5oeEFueGd0ek5RVEpyMGtoNlcrRm9kSFFlanJBMmdzcjlmVG10NW5I?=
 =?utf-8?B?TDdJeVRHaFFiQnJBSXprNE1NREJWTUlBblMreWluQ0I1TzRZdW1vRTgxV2Iw?=
 =?utf-8?B?VDBxemF6bmZLRDFKOHJDT3IwVGZZMzVDVEQ1MFlLYnBZcjdzTk1CYlZRL1ln?=
 =?utf-8?B?Y0cvOUVuYVl6RkVpaEw5bndkMmJjZHhScDhGU3h1UWlmbW1GSFhZZ2NWcEFK?=
 =?utf-8?B?SU1mTXZmaGxjTWZFMG9hQ0pPYjZRdkNLSlpwWXR1dEZKKzBKMmVGNGlvWEpX?=
 =?utf-8?B?UmNBbmxiaFQxdFRSSjNCdHE0akF3YUYxeU9zTkJsaFRhSEhwNnBXbzJ6OHQx?=
 =?utf-8?B?amZVLzdVMTE3OUlhRjc3bFlBYWRGTXhPcGdUVThzdjg1K0U0WWZEVlFDQzFi?=
 =?utf-8?B?ZjBpRWdSZ0s5TEhWZk45YlpHTHRDSVdtN2tob3dheWlLUy9GdEtORHBiUUVK?=
 =?utf-8?B?QUxWQVFtUE1ocHBiejJuWHJxZk43SGlzcnYwV3UxZlN1OUMyNVoyUlkyakNr?=
 =?utf-8?B?WkdPZDhiMC9MMmVwaXoxRTdXUkhGbWQ4WkI2RktDOHY2aHdQUzZSTjlGdkJq?=
 =?utf-8?B?c2RTSStPVHVOSS9FbkNGNzZ6ckYvbHlGWnRFQ1JJaWRoYlRyQWZnRUdBZFlw?=
 =?utf-8?B?U3pMcDlVU3dSdytuR1RoY3FWQU1keTc0VFJxQUxDNXBGL3BMQTFNUWZHVzda?=
 =?utf-8?B?V21SdGVYY2g0b0haS2JpSjJiUFZneTFud3pFbk1CRWwwU0VQb2NHclJ0em5V?=
 =?utf-8?B?UkV6RmxYTysvNzk0Q3pYYVE1dFVHdkN5L3lxSUhZT01lVHI2ZVdHU3F0VGtS?=
 =?utf-8?B?SjF4Uk9iYVVHeGFNK2N6QTRJVklMcmVuaklEK2t1ZzhJN0dCUFVoVEJKd0Zt?=
 =?utf-8?B?MGhBTjdGQ1o1NzgyNDBvT0hTeTJWbHlNOUtPdXdJbEx2SW1kVFRMY3R4elVH?=
 =?utf-8?B?YkMzU2lkTkFZVGJXTk5ORnE5MGVpYU8wbDBjVkRJWlhsVUpmM3NuRS82ZVdr?=
 =?utf-8?B?KzR6N2ZEQVNZYkZaYXdSczkwa0dQWFJ3NHpMaWxzbFp3c2dkK2JDK0xIT2JE?=
 =?utf-8?B?cldKd3lUeVRnZUhLT25LVHVGUlZNZ2hFUUlpdXNoZ2VKR2F1eGNsTlpGd2No?=
 =?utf-8?B?Nm5odmt3MVdETzY5N1QrenMvWnhRNmRKQ0RVYjNkejM4NUpVTkROSm5hUWln?=
 =?utf-8?B?cE94b2dxRkZmUEJ1WUZBZTVFNkROVmQrVXhlSkZPMTBPQjhSbnk1MnprLzdY?=
 =?utf-8?B?Z1ZGZnVaOHk1WUZ1bjNNeEVQcDdIbEVjbVJGd1JUNmwvVjdRMC9RbEdBdmtO?=
 =?utf-8?B?VCtocy85VHorWEl6dUZYSDFucnBzWU1uNzVINkxXUklGSjA0ZEFmL3dQN2tv?=
 =?utf-8?B?RnVsUUV0Wk9wSC9KUDMyM25vYkU0Rm15RU5Gc3FjN2R2VDBlN1FIR1pqVGdu?=
 =?utf-8?B?ZUdyOG56MnE5Y2ZVS0c4VVM2dE1QY1AyZ3RQNGY3bHFiMXJIKzlPSndNMXZs?=
 =?utf-8?B?V0VqREZNelBCY1NIYUFkM0NQejFOVGRIbVU3dVdyQUNmcmdSRGFxaGpCY3dz?=
 =?utf-8?B?YzRQTzBPRlozZk84RXJsTUVvaEQwRFo4WTFkNVdqeUFlNmNkRFFhTjBXR1JH?=
 =?utf-8?B?NEJoc2VzVVdLUnJyZkdKZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFCEA36F29000A469A3776AC3C440A97@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3b3be9-6e64-4ab1-8e2d-08d974608191
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 13:40:08.7067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZBU7zRyUNexKrsc72jcd6Rv7YdgkSncG1zaIPlSRjPHrDyApb+vL1slDx/ZWp9vzv+l2Y0kfiVJnj9LCw13tGQUBgQhEfFQHfcrpvvBOC/R9/PqebI3fmwKMvbYN2q+I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7347
X-Proofpoint-GUID: gXIo9RXHwuG4YUyny2NU1_C23pMyFUJD
X-Proofpoint-ORIG-GUID: gXIo9RXHwuG4YUyny2NU1_C23pMyFUJD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_04,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100079

DQpPbiAxMC4wOS4yMSAxNjozMywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPg0KPg0KPiBPbiAxMC8w
OS8yMDIxIDE0OjI3LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IEhpLA0KPj4N
Cj4+IE9uIDEwLjA5LjIxIDE2OjIwLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4NCj4+Pg0KPj4+
IE9uIDEwLzA5LzIwMjEgMTQ6MTUsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+
PiBIaSwgSnVsaWVuIQ0KPj4+DQo+Pj4gSGksDQo+Pj4NCj4+Pj4gT24gMTAuMDkuMjEgMTY6MDQs
IEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gT24gMTAvMDkvMjAyMSAx
Mjo0MywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4gSGksIEp1bGllbiEN
Cj4+Pj4+DQo+Pj4+PiBIaSBPbGVrc2FuZHIsDQo+Pj4+Pg0KPj4+Pj4+IE9uIDA5LjA5LjIxIDIw
OjQzLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+Pj4+IEhpIE9sZWtzYW5kciwNCj4+Pj4+Pj4N
Cj4+Pj4+Pj4gT24gMDMvMDkvMjAyMSAwOTozMywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3Jv
dGU6DQo+Pj4+Pj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2Fu
ZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gSW4gb3JkZXIgdlBDSSB0
byB3b3JrIGl0IG5lZWRzIGFsbCBhY2Nlc3MgdG8gUENJIGNvbmZpZ3VyYXRpb24gc3BhY2UNCj4+
Pj4+Pj4+IChFQ0FNKSB0byBiZSBzeW5jaHJvbml6ZWQgYW1vbmcgYWxsIGVudGl0aWVzLCBlLmcu
IGhhcmR3YXJlIGRvbWFpbiBhbmQNCj4+Pj4+Pj4+IGd1ZXN0cy4NCj4+Pj4+Pj4NCj4+Pj4+Pj4g
SSBhbSBub3QgZW50aXJlbHkgc3VyZSB3aGF0IHlvdSBtZWFuIGJ5ICJzeW5jaHJvbml6ZWQiIGhl
cmUuIEFyZSB5b3UgcmVmZXIgdG8gdGhlIGNvbnRlbnQgb2YgdGhlIGNvbmZpZ3VyYXRpb24gc3Bh
Y2U/DQo+Pj4+Pj4NCj4+Pj4+PiBXZSBtYWludGFpbiBod2RvbSdzIGFuZCBndWVzdCdzIHZpZXcg
b2YgdGhlIHJlZ2lzdGVycyB3ZSBhcmUgaW50ZXJlc3RlZCBpbg0KPj4+Pj4+DQo+Pj4+Pj4gU28s
IHRvIGhhdmUgaHdkb20ncyB2aWV3IHdlIGFsc28gbmVlZCB0byB0cmFwIGl0cyBhY2Nlc3MgdG8g
dGhlIGNvbmZpZ3VyYXRpb24gc3BhY2UuDQo+Pj4+Pj4NCj4+Pj4+PiBQcm9iYWJseSAic3luY2hy
b25pemVkIiBpcyBub3QgdGhlIHJpZ2h0IHdvcmRpbmcgaGVyZS4NCj4+Pj4+IEkgd291bGQgc2lt
cGx5IHNheSB0aGF0IHdlIHdhbnQgdG8gZXhwb3NlIGFuIGVtdWxhdGVkIGhvc3RicmlkZ2UgdG8g
dGhlIGRvbTAgc28gd2UgbmVlZCB0byB1bm1hcCB0aGUgY29uZmlndXJhdGlvbiBzcGFjZS4NCj4+
Pj4gU291bmRzIGdvb2QNCj4+Pj4+DQo+Pj4+Pj4NCj4+Pj4+Pj4NCj4+Pj4+Pj4+IEZvciB0aGF0
IGltcGxlbWVudCBQQ0kgaG9zdCBicmlkZ2Ugc3BlY2lmaWMgY2FsbGJhY2tzIHRvDQo+Pj4+Pj4+
PiBwcm9wZXJseSBzZXR1cCB0aG9zZSByYW5nZXMgZGVwZW5kaW5nIG9uIHBhcnRpY3VsYXIgaG9z
dCBicmlkZ2UNCj4+Pj4+Pj4+IGltcGxlbWVudGF0aW9uLg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNo
ZW5rb0BlcGFtLmNvbT4NCj4+Pj4+Pj4+IC0tLQ0KPj4+Pj4+Pj4gwqDCoMKgwqAgeGVuL2FyY2gv
YXJtL3BjaS9lY2FtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTEgKysrKysrKysrKysNCj4+
Pj4+Pj4+IMKgwqDCoMKgIHhlbi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtY29tbW9uLmMgfCAxNiAr
KysrKysrKysrKysrKysrDQo+Pj4+Pj4+PiDCoMKgwqDCoCB4ZW4vYXJjaC9hcm0vdnBjaS5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTMgKysrKysrKysrKysrKw0KPj4+Pj4+Pj4g
wqDCoMKgwqAgeGVuL2luY2x1ZGUvYXNtLWFybS9wY2kuaMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAg
OCArKysrKysrKw0KPj4+Pj4+Pj4gwqDCoMKgwqAgNCBmaWxlcyBjaGFuZ2VkLCA0OCBpbnNlcnRp
b25zKCspDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wY2kv
ZWNhbS5jIGIveGVuL2FyY2gvYXJtL3BjaS9lY2FtLmMNCj4+Pj4+Pj4+IGluZGV4IDkxYzY5MWI0
MWZkZi4uOTJlY2IyZTA3NjJiIDEwMDY0NA0KPj4+Pj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3Bj
aS9lY2FtLmMNCj4+Pj4+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9wY2kvZWNhbS5jDQo+Pj4+Pj4+
PiBAQCAtNDIsNiArNDIsMTYgQEAgdm9pZCBfX2lvbWVtICpwY2lfZWNhbV9tYXBfYnVzKHN0cnVj
dCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZSwNCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIGJhc2UgKyAoUENJX0RFVkZOKHNiZGZfdC5kZXYsIHNiZGZfdC5mbikgPDwgZGV2Zm5fc2hp
ZnQpICsgd2hlcmU7DQo+Pj4+Pj4+PiDCoMKgwqDCoCB9DQo+Pj4+Pj4+PiDCoMKgwqDCoCArc3Rh
dGljIGludCBwY2lfZWNhbV9yZWdpc3Rlcl9tbWlvX2hhbmRsZXIoc3RydWN0IGRvbWFpbiAqZCwN
Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBwY2lfaG9zdF9icmlk
Z2UgKmJyaWRnZSwNCj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0
cnVjdCBtbWlvX2hhbmRsZXJfb3BzICpvcHMpDQo+Pj4+Pj4+PiArew0KPj4+Pj4+Pj4gK8KgwqDC
oCBzdHJ1Y3QgcGNpX2NvbmZpZ193aW5kb3cgKmNmZyA9IGJyaWRnZS0+c3lzZGF0YTsNCj4+Pj4+
Pj4+ICsNCj4+Pj4+Pj4+ICvCoMKgwqAgcmVnaXN0ZXJfbW1pb19oYW5kbGVyKGQsIG9wcywgY2Zn
LT5waHlzX2FkZHIsIGNmZy0+c2l6ZSwgTlVMTCk7DQo+Pj4+Pj4+DQo+Pj4+Pj4+IFdlIGhhdmUg
YSBmaXhlZCBhcnJheSBmb3IgaGFuZGxpbmcgdGhlIE1NSU8gaGFuZGxlcnMuDQo+Pj4+Pj4NCj4+
Pj4+PiBEaWRuJ3Qga25vdyB0aGF0Og0KPj4+Pj4+DQo+Pj4+Pj4geGVuL2luY2x1ZGUvYXNtLWFy
bS9tbWlvLmg6Mjc6I2RlZmluZSBNQVhfSU9fSEFORExFUsKgIDE2DQo+Pj4+Pj4NCj4+Pj4+Pj4g
U28geW91IG5lZWQgdG8gbWFrZSBzdXJlIHdlIGhhdmUgZW5vdWdoIHNwYWNlIGluIGl0IHRvIHN0
b3JlIG9uZSBoYW5kbGVyIHBlciBoYW5kbGVyLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBUaGlzIGlzIHF1
aXRlIHNpbWlsYXIgdG8gdGhlIHByb2JsZW0gd2UgaGFkIHdpdGggdGhlIHJlLWRpc3RyaWJ1b3Ig
b24gR0lDdjMuIEhhdmUgYSBsb29rIHRoZXJlIHRvIHNlZSBob3cgd2UgZGVhbHQgd2l0aCBpdC4N
Cj4+Pj4+Pg0KPj4+Pj4+IENvdWxkIHlvdSBwbGVhc2UgcG9pbnQgbWUgdG8gdGhhdCBzb2x1dGlv
bj8gSSBjYW4gb25seSBzZWUNCj4+Pj4+Pg0KPj4+Pj4+IMKgwqDCoCDCoMKgwqAgLyogUmVnaXN0
ZXIgbW1pbyBoYW5kbGUgZm9yIHRoZSBEaXN0cmlidXRvciAqLw0KPj4+Pj4+IMKgwqDCoCDCoMKg
wqAgcmVnaXN0ZXJfbW1pb19oYW5kbGVyKGQsICZ2Z2ljX2Rpc3RyX21taW9faGFuZGxlciwgZC0+
YXJjaC52Z2ljLmRiYXNlLA0KPj4+Pj4+IMKgwqDCoCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTWl82NEssIE5VTEwpOw0KPj4+Pj4+DQo+Pj4+Pj4g
wqDCoMKgIMKgwqDCoCAvKg0KPj4+Pj4+IMKgwqDCoCDCoMKgwqDCoCAqIFJlZ2lzdGVyIG1taW8g
aGFuZGxlciBwZXIgY29udGlndW91cyByZWdpb24gb2NjdXBpZWQgYnkgdGhlDQo+Pj4+Pj4gwqDC
oMKgIMKgwqDCoMKgICogcmVkaXN0cmlidXRvcnMuIFRoZSBoYW5kbGVyIHdpbGwgdGFrZSBjYXJl
IHRvIGNob29zZSB3aGljaA0KPj4+Pj4+IMKgwqDCoCDCoMKgwqDCoCAqIHJlZGlzdHJpYnV0b3Ig
aXMgdGFyZ2V0ZWQuDQo+Pj4+Pj4gwqDCoMKgIMKgwqDCoMKgICovDQo+Pj4+Pj4gwqDCoMKgIMKg
wqDCoCBmb3IgKCBpID0gMDsgaSA8IGQtPmFyY2gudmdpYy5ucl9yZWdpb25zOyBpKysgKQ0KPj4+
Pj4+IMKgwqDCoCDCoMKgwqAgew0KPj4+Pj4+IMKgwqDCoCDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qg
dmdpY19yZGlzdF9yZWdpb24gKnJlZ2lvbiA9ICZkLT5hcmNoLnZnaWMucmRpc3RfcmVnaW9uc1tp
XTsNCj4+Pj4+Pg0KPj4+Pj4+IMKgwqDCoCDCoMKgwqDCoMKgwqDCoCByZWdpc3Rlcl9tbWlvX2hh
bmRsZXIoZCwgJnZnaWNfcmRpc3RyX21taW9faGFuZGxlciwNCj4+Pj4+PiDCoMKgwqAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWdp
b24tPmJhc2UsIHJlZ2lvbi0+c2l6ZSwgcmVnaW9uKTsNCj4+Pj4+PiDCoMKgwqAgwqDCoMKgIH0N
Cj4+Pj4+PiB3aGljaCBJTU8gZG9lc24ndCBjYXJlIGFib3V0IHRoZSBudW1iZXIgb2YgTU1JT3Mg
d2UgY2FuIGhhbmRsZQ0KPj4+Pj4NCj4+Pj4+IFBsZWFzZSBzZWUgdmdpY192M19pbml0KCkuIFdl
IHVwZGF0ZSBtbWlvX2NvdW50IHRoYXQgaXMgdGhlbiB1c2VkIGFzIGEgdGhlIHNlY29uZCBhcmd1
bWVudCBmb3IgZG9tYWluX2lvX2luaXQoKS4NCj4+Pj4NCj4+Pj4gQWgsIHNvDQo+Pj4+DQo+Pj4+
IDEpIFRoaXMgbmVlZHMgdG8gYmUgZG9uZSBiZWZvcmUgdGhlIGFycmF5IGZvciB0aGUgaGFuZGxl
cnMgaXMgYWxsb2NhdGVkDQo+Pj4+DQo+Pj4+IDIpIEhvdyBkbyBJIGtub3cgYXQgdGhlIHRpbWUg
b2YgMSkgaG93IG1hbnkgYnJpZGdlcyB3ZSBoYXZlPw0KPj4+DQo+Pj4gQnkgY291bnRpbmcgdGhl
IG51bWJlciBvZiBicmlkZ2UgeW91IHdhbnQgdG8gZXhwb3NlIHRvIGRvbTA/IEkgYW0gbm90IGVu
dGlyZWx5IHN1cmUgd2hhdCBlbHNlIHlvdSBleHBlY3QgbWUgdG8gc2F5Lg0KPj4NCj4+IE9rLCBz
byBJJ2xsIGdvIG92ZXIgdGhlIGRldmljZSB0cmVlIGFuZCBmaW5kIG91dCBhbGwgdGhlIGJyaWRn
ZXMsIGUuZy4gZGV2aWNlcyB3aXRoIERFVklDRV9QQ0kgdHlwZS4NCj4+DQo+PiBUaGVuIEknbGwg
YWxzbyBuZWVkIHRvIGV4Y2x1ZGUgdGhvc2UgYmVpbmcgcGFzc2VkIHRocm91Z2ggKHhlbixwYXNz
dGhyb3VnaCkgYW5kIHRoZSByZXN0IGFyZSB0aGUgYnJpZGdlcyBmb3IgRG9tYWluLTA/DQo+DQo+
IFdoYXQgeW91IHdhbnQgdG8ga25vdyBpZiBob3cgbWFueSB0aW1lcyByZWdpc3Rlcl9tbWlvX2hh
bmRsZXIoKSB3aWxsIGJlIGNhbGxlZCBmcm9tIGRvbWFpbl92cGNpX2luaXQoKS4NCj4NCj4gWW91
IGludHJvZHVjZWQgYSBmdW5jdGlvbiBwY2lfaG9zdF9pdGVyYXRlX2JyaWRnZXMoKSB0aGF0IHdp
bGwgd2FsayBvdmVyIHRoZSBicmlkZ2VzIGFuZCB0aGVuIGNhbGwgdGhlIGNhbGxiYWNrIHZwY2lf
c2V0dXBfbW1pb19oYW5kbGVyKCkuIFNvIHlvdSBjb3VsZCBpbnRyb2R1Y2UgYSBuZXcgY2FsbGJh
Y2sgdGhhdCB3aWxsIHJldHVybiAxIGlmIGJyaWRnZS0+b3BzLT5yZWdpc3Rlcl9tbWlvX2hhbmRs
ZXIgaXMgbm90IE5VTEwgb3IgMC4NCg0KT2ssIGNsZWFyLiBTb21ldGhpbmcgbGlrZToNCg0KIMKg
wqDCoCBpZiAoIChyYyA9IGRvbWFpbl92Z2ljX3JlZ2lzdGVyKGQsICZjb3VudCkpICE9IDAgKQ0K
IMKgwqDCoMKgwqDCoMKgIGdvdG8gZmFpbDsNCg0KIMKgwqDCoCAqZmluZCBvdXQgaG93IG1hbnkg
YnJpZGdlcyBhbmQgdXBkYXRlIGNvdW50Kg0KDQoNCiDCoMKgwqAgaWYgKCAocmMgPSBkb21haW5f
aW9faW5pdChkLCBjb3VudCArIE1BWF9JT19IQU5ETEVSKSkgIT0gMCApDQogwqDCoMKgwqDCoMKg
wqAgZ290byBmYWlsOw0KDQo+DQo+IENoZWVycywNCj4NClRoYW5rIHlvdSwNCg0KT2xla3NhbmRy
DQo=

