Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A873DE6F0
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 09:01:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163278.299127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAoQ7-00056B-Uy; Tue, 03 Aug 2021 07:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163278.299127; Tue, 03 Aug 2021 07:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAoQ7-00053j-Pu; Tue, 03 Aug 2021 07:00:59 +0000
Received: by outflank-mailman (input) for mailman id 163278;
 Tue, 03 Aug 2021 07:00:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b51O=M2=epam.com=prvs=884988f061=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mAoQ6-00053b-IR
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 07:00:58 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d034a02-f428-11eb-9a89-12813bfff9fa;
 Tue, 03 Aug 2021 07:00:57 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1736ueM4028064; Tue, 3 Aug 2021 07:00:54 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 by mx0a-0039f301.pphosted.com with ESMTP id 3a6xcbgagh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 07:00:54 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3874.eurprd03.prod.outlook.com (2603:10a6:208:6c::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Tue, 3 Aug
 2021 07:00:50 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d8d3:ecba:8917:1baa]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d8d3:ecba:8917:1baa%9]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 07:00:50 +0000
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
X-Inumbo-ID: 8d034a02-f428-11eb-9a89-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DhkHwAhqhgTR7pV+2V/vbaDjumSk27JhuFdxhl1hz9SU4AGgTbcvFgZfvvCF/xt1E7n217oKhYfO/pxJLC6+gtVJeJO9+xfj0GMy+FEKn+ZqsTr2nCO+4jJDvAn9RJmIF4HRnZ7kyvk5nW/UhLjfGaV7OVux+K8mS8tpBkTcNFlTHGtbRdb+LvPiAS7yOB82zbZ9cBSNlcxVxIKxESllxg/5xg0sp4OJwReL234HsJCoXyGxGTjOSvzco0x4kuz1sOMkJJM/HuiNIzlJ7nB+A9pFc5z95VDgSLvE3tyymFO3xp3jRVc+nvaXqrQGf4WLQi0rnSqo6jaY0mZFP4RTOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vktSTjSfHzp8jVpY2cqL8gHhom1nvCJYQhzHgeCEtU4=;
 b=WtDFZucKLQMRu6CKCm/ZAWPfYC0YAAt1IoMM2Bz3QMJaP7fl8Xx9CszIabt8vL0qIH7URllwUNpG78GPN7Rz3VbhADQrNRi4aDoR1UbIGxAOZ06DwPNegjQRd97/qb2hUqpLP7DEvHFJbOH3o+0UWGY1vnzkuQixCoMXqBfd+3jT7jqdcfvIo2L/MDP1l7AaccbBx9nQ+AMb8myE7zFWW6sM16+II91Z3YlVTjJ6QjdGyphnnCT0H/Mcnv4YiNjFgUDI8WeMzshJ00MwB6WL9E1AB7+12WxnraQ38v+FqkjmFRWrUaZJxlwRaOosfYWAEMz/6efKArvsX7FNEo17EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vktSTjSfHzp8jVpY2cqL8gHhom1nvCJYQhzHgeCEtU4=;
 b=qjauSJFxPtuaLCkh/cUDdTENhiTQV7Pkt9xNA40BZL8hi6H2PmxLrj+s7vMPwC9sBZnHb4c0zTJ0beSl0FC7/T1eimwgswf3Wx9wMy3wjSNq76SOpYE1Uckc2ruuuzAtgkNT3QIxbxJ0ztDS7A1AQovI0ZMelgcja3tCEbL+Mc2CnFut20RIRUHwEDrmbR4Zi54S5/3J7FHxiboduWDtAroyc5CrGz8uxdTHQwnJKWG3DQBvuTYOPBX9FNR9CjDC4fsl1YPOxJxB/tWfjFShyxPs6x/gVH5oEkisroqF2zyee/50/7/3X2Jo5fozPfFqGVsJdN1RwfBJo38qBxXFzg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Jens Axboe
	<axboe@kernel.dk>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3 1/3] xen/blkfront: read response from backend only once
Thread-Topic: [PATCH v3 1/3] xen/blkfront: read response from backend only
 once
Thread-Index: AQHXh6eJ91LWa/O//ESEGVadZuHLeatgmVWAgADB8IA=
Date: Tue, 3 Aug 2021 07:00:50 +0000
Message-ID: <1eae114b-46bc-8e97-0973-1c9aad72fc2e@epam.com>
References: <20210730103854.12681-1-jgross@suse.com>
 <20210730103854.12681-2-jgross@suse.com>
 <ce79a0a8-128d-1d50-d160-f612fbd52101@epam.com>
 <feabcdc6-4166-86d9-b449-42b4abd7e4ec@xen.org>
In-Reply-To: <feabcdc6-4166-86d9-b449-42b4abd7e4ec@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c69b93de-5be2-4908-ea3a-08d9564c6d9d
x-ms-traffictypediagnostic: AM0PR03MB3874:
x-microsoft-antispam-prvs: 
 <AM0PR03MB3874F5A68453A0F6359B096BE7F09@AM0PR03MB3874.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 feMRULD6KP+GHrkpXL6iEZocn/C8+DCmueOTYV3y/nv26HPvwvEC2JLPQ2mhBfrJ/1BmLVkxoORNjZan+nA1W0oTOEu0NKYqDqWpzr8AR2IZtUnEz402CcA9TA65lqt02Pxb73eER3TeDclC+r2wdDSdKnA30mqQQA9Ji5BgCD2iaUurF4FfJluzPMPOYEMx76k4+qn/delKEhmZp2hptVYs8KfSURnQbBh2OmaXYrF/tAxAwNDRk6XLP1WOsXwD8u8VRj5fz2RR9XQxfp6pkMEa7W8JohIjN+1sy38LZNMLxzc4hxQPpOVGokvNHFvm+T7JPHKqbNeammLsiSFPMRGQTXzZeIFNtZWUFff47Lf6y7YvXfSIRpult2H8ox0JRBDdswEyhPUfGv6NmoTVY1cm7lEVp8XchreGxSdoAW3YVp/VeRKUd9ZByrVTdBGwiDZlxZ7ifRLjrn+v4qeybIv79nIqvCc4GtzpqvvsVQ08lZs0clN7t6Qgv9DnmDD7K3OeMefNUgTxLFctahESjL4iibgVO8LW3hjPz+5fx4zNTVwiuN8zA+ytQEzc04FeaWIfp2pHVPbgFjqHu6GBaLNeQda572WsfFEkCwkuwVVPvrVeg75XeZ1ibILJiKE9GcRHOznuvIKyEKFodRmv5YWI88YPfuU4nYBMfhyRV/RyBjtnwemc1r8YzCO+qN5mbvrmuld1eQ6FIF0BgEwUkr1nc46c9MYqy8V5PxAzGG1dDvPr//XJanWhnNQDTHvI
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(86362001)(6486002)(8676002)(4326008)(71200400001)(8936002)(36756003)(31686004)(31696002)(478600001)(83380400001)(6512007)(110136005)(5660300002)(2616005)(54906003)(7416002)(122000001)(38100700002)(316002)(2906002)(38070700005)(53546011)(26005)(6506007)(186003)(91956017)(76116006)(66476007)(66556008)(64756008)(66446008)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NVZVelRhcUxOV2hLeFdGT3FLWXhwZk9iS2NjUjFXRnVDYW1JUjQwRmVBditR?=
 =?utf-8?B?ZHJGZGtPYWVTZk1iMG95RC9kVzRjNVdtR2ZLR01DU01BalJ2UGpiejh1b3Iv?=
 =?utf-8?B?eGRiekhEdnIyTVdhTjFDNW9ncW96QUdwYTVFOEl2L3ZiLzhSU21kVzdXZ0tN?=
 =?utf-8?B?UWJXeXBIczBLQmR2aVZla2FCYlNmK1FvbTlJSTkxSlNMaUZPMVdCczU3b0NV?=
 =?utf-8?B?amZlN05wNlBXdE80MWM1YWRUSDFPL1hleStvM0NEelpnNisxY1pmR3kydzNr?=
 =?utf-8?B?Z2ZCUXVIeDJOME5GU3dlVXdtN2FJa1p1cGlQUWRId2hxMTBucXE4cjkyM2ZT?=
 =?utf-8?B?c3dsd1hmdUNtczgrWlJ5aVZrOThtVkFUWjRVbFZHb0hrNWFWN0E3d2Jlcysr?=
 =?utf-8?B?Vm9kdFE4d3BiV1NQbnB2VTdQaWxpZWFnNmVCMFBRZEJWd1MrMnhpUFJFV2oy?=
 =?utf-8?B?SnBlSUl2NzlvanNPR1VnbU5Gc2RTc2paOWwzZ1VWOThDQXZvZWN5ekEwdlhm?=
 =?utf-8?B?czYvaDFaTkF5OXdCTGdUSlJQdW1QSFg0ZXRIRWNaSUgvTFJKSTN0RnFuc2w2?=
 =?utf-8?B?UTdSQzg1eDlvNTRjZTNYNjVXeDQ0WUJVTlJYVFg0MmpQbDNlc01FSVZ4b1U0?=
 =?utf-8?B?Z3YzRm5IK1J3SUMrTVFVWVkwU3lCL1ljbWthMDdIVndobmRLWlpScXdtcmgv?=
 =?utf-8?B?ZkVZNTFaZitOVVdTcmtURi9lc2xZZldhL1hpVEczbHg1TkNNUk1vRWRJeFd6?=
 =?utf-8?B?ODdoUkVINUJ5d1cxTExFVEdSVkJ0VGlnY3NiSUt1ZFJ1SFVudWhBRzF5dG5w?=
 =?utf-8?B?UzBGWlhvS3VaQWlWL0lEY0ZWRW04U2sybHlxT1Q5MDFvQ1ZZS3hKVHIvLzlX?=
 =?utf-8?B?VG4yeVFxTTBEMjNpdGNNdmNha0gzR1NuR3UwOXhPV2QvRXE5dHRCL0lYczQ2?=
 =?utf-8?B?WDh2RXJSV2pTWUtKV1IxNXlTYURVTTJBNjBuRVBtVTRYbTZDY0hWZHRQVHZq?=
 =?utf-8?B?R1U1T0ZwTWFSdHpPbEFWOUtEbURWSm9IKzZpejlCeHV4UFNoMjllbjFTUnds?=
 =?utf-8?B?RUNlbWR2TFhYYW9aRjQ5Y3hPM0E5Rk1nVTlVbEdRNldMREp0SVZtV0xhaFFF?=
 =?utf-8?B?emtxQm9iSFJGWkxYcEtQTEJiYVZaY0ZZUnI4b2dsYks2OTRBaGpBVUxyUE5J?=
 =?utf-8?B?bkF1a24zK1dMbU9WSUFzZEJvRGN0YzhoQzRFQnJEeXJvRmFtbERZb29YRmtL?=
 =?utf-8?B?cXRNSTNVVjRzei9YZHpUUlk4eGhsUVRLZnlESnJhcysydVpxRmt6aGY4MVZ1?=
 =?utf-8?B?bHNXRElURFBHMTVZRW5udkNzQUZ5OGRIWkxGNWRqRTA0MVlCbDVNK0lnWHl4?=
 =?utf-8?B?ZlU3TVNxVXlFc3ZDMC9BK09LeDROTEszaGJSK2lqT095Y0dyNDN6WDFTUkxL?=
 =?utf-8?B?Y0tYeGk5ZnNaSG02Tm0xT0V0ZUpzNWxBMXAyUnhmRnZnZUVqZVN0WjRjRnZp?=
 =?utf-8?B?eEozcHhOSzlkL3B5aUhGVWRBUlp6NVVKM3luMXpSTTVaZzgyRjR2YXpwdFBx?=
 =?utf-8?B?K2pxdUU5SmNwT2Z5VVZ2VUNGZXRBOVBMZ0xhTmUra3BVR0hmbEdESTJqbkJW?=
 =?utf-8?B?KzYwWEo4SnRyNE1xK1ROQUdVRE5ZMGhDSCt0N2FSa1dKVnA1S040TmN0bDl4?=
 =?utf-8?B?ZTBzZjRYeGVZOEwxYnp6ZlQySTltaTN5ZW5CVlZaNmsrSjVJUjYvZzlXeWpJ?=
 =?utf-8?Q?9GlrsdSuxmVey/O5VMlxf71tqcV7P1TGWJ53LIT?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <ABE9D0E51CD43A4EB5B76328157059AB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c69b93de-5be2-4908-ea3a-08d9564c6d9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2021 07:00:50.5736
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K2b3iOzMN4mh2YdpeV7Jt5S2ZZMlX4IEAmUQipfkOkpUAQ7pkVxgsVYgJF0eCfp1e6Hmb49vPElk81gOVg+KCkGlyLaXVg4N+o75kk2K2FggLwSgz34PK4BsufY+QGpL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3874
X-Proofpoint-GUID: rvfyED4WJCIGa0zAcWKOqfDVlOlTXb9N
X-Proofpoint-ORIG-GUID: rvfyED4WJCIGa0zAcWKOqfDVlOlTXb9N
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-03_02:2021-08-02,2021-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 clxscore=1011 suspectscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108030046

DQpPbiAwMi4wOC4yMSAyMjoyNiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSwNCj4NCj4gT24g
MDIvMDgvMjAyMSAxNTowNiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAz
MC4wNy4yMSAxMzozOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+PiBJbiBvcmRlciB0byBhdm9p
ZCBwcm9ibGVtcyBpbiBjYXNlIHRoZSBiYWNrZW5kIGlzIG1vZGlmeWluZyBhIHJlc3BvbnNlDQo+
Pj4gb24gdGhlIHJpbmcgcGFnZSB3aGlsZSB0aGUgZnJvbnRlbmQgaGFzIGFscmVhZHkgc2VlbiBp
dCwganVzdCByZWFkIHRoZQ0KPj4+IHJlc3BvbnNlIGludG8gYSBsb2NhbCBidWZmZXIgaW4gb25l
IGdvIGFuZCB0aGVuIG9wZXJhdGUgb24gdGhhdCBidWZmZXINCj4+PiBvbmx5Lg0KPj4+DQo+Pj4g
U2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4+IFJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+Pj4gQWNrZWQtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPj4+IC0tLQ0KPj4+IMKgwqAg
ZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYyB8IDM1ICsrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tDQo+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwg
MTcgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4t
YmxrZnJvbnQuYyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMNCj4+PiBpbmRleCBkODNm
ZWUyMWY2YzUuLjE1ZTg0MDI4NzczNCAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2Jsb2NrL3hl
bi1ibGtmcm9udC5jDQo+Pj4gKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYw0KPj4+
IEBAIC0xNDk2LDcgKzE0OTYsNyBAQCBzdGF0aWMgYm9vbCBibGtpZl9jb21wbGV0aW9uKHVuc2ln
bmVkIGxvbmcgKmlkLA0KPj4+IMKgwqAgc3RhdGljIGlycXJldHVybl90IGJsa2lmX2ludGVycnVw
dChpbnQgaXJxLCB2b2lkICpkZXZfaWQpDQo+Pj4gwqDCoCB7DQo+Pj4gwqDCoMKgwqDCoMKgIHN0
cnVjdCByZXF1ZXN0ICpyZXE7DQo+Pj4gLcKgwqDCoCBzdHJ1Y3QgYmxraWZfcmVzcG9uc2UgKmJy
ZXQ7DQo+Pj4gK8KgwqDCoCBzdHJ1Y3QgYmxraWZfcmVzcG9uc2UgYnJldDsNCj4+PiDCoMKgwqDC
oMKgwqAgUklOR19JRFggaSwgcnA7DQo+Pj4gwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgZmxh
Z3M7DQo+Pj4gwqDCoMKgwqDCoMKgIHN0cnVjdCBibGtmcm9udF9yaW5nX2luZm8gKnJpbmZvID0g
KHN0cnVjdCBibGtmcm9udF9yaW5nX2luZm8gKilkZXZfaWQ7DQo+Pj4gQEAgLTE1MTMsOCArMTUx
Myw5IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBibGtpZl9pbnRlcnJ1cHQoaW50IGlycSwgdm9pZCAq
ZGV2X2lkKQ0KPj4+IMKgwqDCoMKgwqDCoCBmb3IgKGkgPSByaW5mby0+cmluZy5yc3BfY29uczsg
aSAhPSBycDsgaSsrKSB7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBp
ZDsNCj4+PiDCoMKgIC3CoMKgwqDCoMKgwqDCoCBicmV0ID0gUklOR19HRVRfUkVTUE9OU0UoJnJp
bmZvLT5yaW5nLCBpKTsNCj4+PiAtwqDCoMKgwqDCoMKgwqAgaWTCoMKgID0gYnJldC0+aWQ7DQo+
Pj4gK8KgwqDCoMKgwqDCoMKgIFJJTkdfQ09QWV9SRVNQT05TRSgmcmluZm8tPnJpbmcsIGksICZi
cmV0KTsNCj4+DQo+PiBBcyBwZXIgbXkgdW5kZXJzdGFuZGluZyBjb3B5aW5nIGlzIHN0aWxsIG5v
dCBhbiBhdG9taWMgb3BlcmF0aW9uIGFzIHRoZSByZXF1ZXN0L3Jlc3BvbnNlDQo+Pg0KPj4gYXJl
IG11bHRpLWJ5dGUgc3RydWN0dXJlcyBpbiBnZW5lcmFsLiBJT1csIHdoYXQgcHJldmVudHMgdGhl
IGJhY2tlbmQgZnJvbSBtb2RpZnlpbmcgdGhlIHJpbmcgd2hpbGUNCj4+DQo+PiB3ZSBhcmUgY29w
eWluZz8NCj4NCj4gTm90aGluZyBhbmQsIEkgYmVsaWV2ZSwgeW91IGFyZSBuZXZlciBnb2luZyB0
byBiZSBhYmxlIHRvIGVuc3VyZSBhdG9taWNpdHkgd2l0aCBsYXJnZSBzdHJ1Y3R1cmUgKGF0IGxl
YXN0IGJldHdlZW4gZW50aXR5IHRoYXQgZG9lc24ndCB0cnVzdCBlYWNoIG90aGVyKS4NCj4NCj4g
SG93ZXZlciwgd2hhdCB5b3UgY2FuIGRvIGlzIGNvcHlpbmcgdGhlIHJlc3BvbnNlIG9uY2UsIGNo
ZWNrIHRoYXQgaXQgaXMgY29uc2lzdGVudCBhbmQgdGhlbiB1c2UgaXQuIElmIGl0IGlzIG5vdCBj
b25zaXN0ZW50LCB0aGVuIHlvdSBjYW4gcmVwb3J0IGFuIGVycm9yLg0KPg0KPiBUaGlzIGlzIGJl
dHRlciB0aGFuIHdoYXQncyBjdXJyZW50bHkgaW4gdHJlZS4gSU9XIHdlIG1heSBoYXZlIG11bHRp
cGxlIHJlYWQgc28gdGhlIGNvZGUgaXMgcHJvbmUgdG8gVE9DVE9VLg0KDQpBZ3JlZSwNCg0KVGhh
bmtzDQoNCj4NCj4gQ2hlZXJzLA0KPg==

