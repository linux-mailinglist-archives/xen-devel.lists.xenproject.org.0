Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E2C3A28E9
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 12:02:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139806.258439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrHVF-0007kJ-LD; Thu, 10 Jun 2021 10:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139806.258439; Thu, 10 Jun 2021 10:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrHVF-0007iD-G9; Thu, 10 Jun 2021 10:01:33 +0000
Received: by outflank-mailman (input) for mailman id 139806;
 Thu, 10 Jun 2021 10:01:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mVv/=LE=epam.com=prvs=679567fbaa=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1lrHVD-0007hn-5Q
 for xen-devel@lists.xenproject.org; Thu, 10 Jun 2021 10:01:31 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7b03cec-e9bf-472a-b02f-b38ef5b50a53;
 Thu, 10 Jun 2021 10:01:30 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15A9xoOX000751; Thu, 10 Jun 2021 10:01:28 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52])
 by mx0b-0039f301.pphosted.com with ESMTP id 393b44gy63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 10:01:25 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7347.eurprd03.prod.outlook.com (2603:10a6:20b:268::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Thu, 10 Jun
 2021 10:01:16 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b459:9e8c:964b:a3d1]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b459:9e8c:964b:a3d1%6]) with mapi id 15.20.4195.031; Thu, 10 Jun 2021
 10:01:16 +0000
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
X-Inumbo-ID: e7b03cec-e9bf-472a-b02f-b38ef5b50a53
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oUuKFS68aWIdFI6Tyq14vHp5+H1TTWYUYKzevIt07H7I7aE7lBhp/FPUc3OImhzZCeBS6PFGdvPcc5oZH0j20sfLsntwmNvmSVNl3HqHGt7cEahykAlpUD06bRwKTy1ppSovQwSQT0VmAPpMEXmjS7JQkNMvvrWob80L2mfId8wiEsSkEuPZvAnIC8g490aK0SnlMfPOjDBKYag5VY3YlhxK2cvuMkjtmYHV1Bobn5YD6cUxtAeT+isGXFhmPqrDXvvi9YIf/gQUbSvDOf2d2KU8ymacK6G8QFvTq9bDrYpCwWqPytYQMuHMOewQRbI4hQ+koncITKspqmd7Mh4tJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyG66UZuq8U1OUofAufPfAzsja+kZ1kdTElr5MgJ/Ro=;
 b=bVNt+Rbxkmcu3EDZndQ4wNj71Ecl3nSWeOA5ZD0vPlIbhO9zNZxWgCtJhD5sT5C0P+qq/hJgqJDyCW78rH6pIZ3OYI3eoAT1dbnGbCsOGREHfZwBrfPr3fbnAClTm5hgaQbp/b6a9ulEp6STsbELf6Sv6/ZIGnvluMIh+wlbzP8EQ0XlcwPrDFcqwqFi2UhFe6vFHTJQdNiw7JwpKUWDAXEcCgX7J4VOIeMAISn1A5LKpOvcoxt8ePodu9npsEa5xwSI25BLDDb6E8uXq1Uu4hldtdZmaYsaRLmiJDQpGKvVFRLicL5pEdaWCi75lLgB0YWZsvjIlTKDuBLXHwolBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyG66UZuq8U1OUofAufPfAzsja+kZ1kdTElr5MgJ/Ro=;
 b=tNyCVJ7o/8pYXLa1acsCXmp54foWdHqxDdJgGFALhKYSR0cbiQCFSFgLx/f/ZD4YU9CCSZ9JEBlDPr2L7KEIMcrDREmcj2hTa8EHAOdoJ7uf1Csvp6YuDYQAYmuS2jx3upPBaqrqlHQ3FmTR+CLTskpvDZyDBjrCVWEoL1p2ws4JwajD4b/RPuE07gRNz/Mlb2wE6a5XTOOZ8Vkf0GNLw4cwph2Vw9GDyC1GxOfTL9lU7vXbubhbGxq/uRqhXaBoOh+94woc/gXghIxWgmcAjNM2YaA/r/3iWJVTUNsI5+om+yl505NscJ0G9BxCyZpprx0yQTA7pOC83Xgm00Dpwg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Jan
 Beulich <jbeulich@suse.com>
Subject: Re: SR-IOV: do we need to virtualize in Xen or rely on Dom0?
Thread-Topic: SR-IOV: do we need to virtualize in Xen or rely on Dom0?
Thread-Index: AQHXWQwW/O3obtZgqkmpGRvt7ZNDkasM6aMAgAAjXoA=
Date: Thu, 10 Jun 2021 10:01:16 +0000
Message-ID: <30955a5b-ee46-60d7-ae56-23dc7c91008c@epam.com>
References: <c10e16c9-ec42-336f-e838-caca49b39723@epam.com>
 <YMHFQA1L61ntKNRq@Air-de-Roger>
In-Reply-To: <YMHFQA1L61ntKNRq@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1116bc66-d735-4204-7e66-08d92bf6b020
x-ms-traffictypediagnostic: AM9PR03MB7347:
x-microsoft-antispam-prvs: 
 <AM9PR03MB7347B2F8406C9D98B63DC610E7359@AM9PR03MB7347.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 96NDF7GQkkLXszBWp4tn/RVKE7502UM3iyVEuf+Pm5VdjjibbIHhJUwmoWlBRBplR580GQ2Jj87X2r6inqHsj/ndV0kLa18HPhBUaEw3wUrU6JURObAz16VdrICp92OGM5KU3OJw/5iXk1AFnA4HgWdM93vxEhG3Aq0fWjN6KZ9Wb9cixcdOrJN2206dI2roYNOkpMWGgIngT0eGjr8GjpUv11NGaa92xeIDnbOaz2wPpd3S87kiXfMKDIXtR9sEhW3M4qeJ+XnMrLBAjNqW+XP9G7/250qZIIMlN/w3oNHkfpWfJRFXSsK4j8oHhdiyS+Afgy7uTdx0dz+hdwS8rx1OapVB3StWCmr5nH9yjdkc+H/8ayEEIsjF0jfJlvHTmQb0g1BkKoqiI4kp/c6uMtuS71SIBRMZEfa+i2E4KtFGhscFFIaFGukHansnKDsC8pZG8Mpn8VkP+DdmPJ6DWYuKkO5gW9UuGFORErGpXtlW07/khqsaDP3srDLg7sq94rtf95nxukYnP8A0OPAB/LSg7/TO0mdpr8nzX/CHl7LNc9qDmekKFo5FmX6kLT115zYVyr0fwOgcHNRRvmac8N/ZV8cgmEdrh3gGvpjU5inPx11EVZIuDTUMTmBv3YxHFaa3XPdwr/qvTp+CKZ5bSip3sJp6WNtjA7562O+uYO9XJjYdAxo4IiJnR1mM1an1vIcSi56Dfs0SLjP76S+DLjbLOwZXcyd4b6BYIsMb2v/nLBjMUoCkNdozPEB8p0zDSWKBKh203cLVFDPJT1cRRD4CHjbT8zHzz8/I1dYPVQ0Lh3G679h2yRu/wQ8RaLLWZminuWxqRY/kN1FFROYXRg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(8936002)(36756003)(31696002)(6486002)(478600001)(6512007)(54906003)(71200400001)(83380400001)(186003)(5660300002)(122000001)(86362001)(4326008)(91956017)(6916009)(316002)(66556008)(66446008)(66476007)(31686004)(64756008)(66946007)(2906002)(53546011)(76116006)(966005)(38100700002)(8676002)(2616005)(6506007)(26005)(21314003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?MFNwNTNURFlJZjJWOTcxSmJxQkpoY2RxcWdoOVVHanlneDhUNjVCbnBWYjZn?=
 =?utf-8?B?ZTNEU0NidGJKWHB6ZFJyT2IvRXc1MHFYNmpuNHN2dTNvT3UvckR1Q1VEZjFX?=
 =?utf-8?B?bm1oNkRPOEFmU2J2RHVzVUl3VVFHcDZTQ2JCeGJWQ3RWRVFTOTc5dlhlWlZj?=
 =?utf-8?B?cjdvSFR1ZEFjZDNwbUJxVXZ1bVZTSGJMSXZBLzNDbGt6aTRORHVaN0JrMEhR?=
 =?utf-8?B?OG5uT3h6Y2ZUUnk0aUx3S1FTQ2pKKzEwelhmSGNLRHVibjFWejkxczNTckhW?=
 =?utf-8?B?dTZENlBTZXo1amdRUTVsdURoeXBjQUd3WjhMaEFFVUhmR08wenllcjBxTHRo?=
 =?utf-8?B?M3dUaGU0OWZYY1g0L0dVWTVFU2tQZkc0Njh5NWRldXIvRnpGV2U4a0ZOVC96?=
 =?utf-8?B?KzNsM3I2N1lOSEYwbTZURUVka2g0L3hycTh4dFlHY25jT3RYSW4xbVduNUJi?=
 =?utf-8?B?NXhqa1JFQndFNTI1Q01NOHRONklKT3lMdzRPZjFZa3Y0am9JYW5vekhGODk0?=
 =?utf-8?B?THpYRnozSkhSNTQ3V3VrMko1V2xsQmE2ei83aWh3bGVJdHdVV2pvaE0rYTFq?=
 =?utf-8?B?Z1FVbGhYL3JJcjYrQm1mZHpDM0lKZ2hpbGx1aUhJdlZpNFNRSnVYTEI5blhr?=
 =?utf-8?B?SmJYSEdFUVlUeXc1SW5naGgyMGRCOGFtNmdqamVpL0pSNEM0eXdOczhUS1pi?=
 =?utf-8?B?SVViak92a29nekNUWWJEMmhjTmNhalBDUHVYQWw2V0tOMWxPbHl1d0l3Y1Vr?=
 =?utf-8?B?VWppT0JFdnhvUDdUTEFodGE3R3B2OUE5VnJ5QlBGVm04L3ltZXpTSGt3akpG?=
 =?utf-8?B?dEhpejNxNWMrbjZUSmtraGRSdzlLc2ZubVZTcHN1QzV1eXJicmNZZTIvWldQ?=
 =?utf-8?B?NVZQa2ovTjRrdnRKNTl6emYxTloxbks4N0FkWElkc3ZRT0dJZ2NlYm8zTytT?=
 =?utf-8?B?TjE5KzE4Q1ZMZ3pRRmFqa3M4dEZaTFpNZklHYmgySWFsWU1Td3JZeEdzNk9a?=
 =?utf-8?B?dVVUTFJOZ2w3R1JOZ3NGQ2x6QTlPRjdWT2FsR2o3V1F1ODlwQnNXY0llMjh3?=
 =?utf-8?B?bWx1cmc1em00cGYwWm9tcTgvcWZjTjY2RFNHVUdHSzIrTmNGU1VheDRPR0RJ?=
 =?utf-8?B?NE5TTFBCZW9ZWUlrU21reTE1ZnFJN1hzQXJSVEgyVlBSRVlFSDl3ZmpPcy9O?=
 =?utf-8?B?dXdnamVWMUpUdGhxRjJNTUJ2VktUMFB3cy9OTEg2eWczcjhuRWlZanExVEk2?=
 =?utf-8?B?MWhVODRRdjJBU2NGRWFicmhVVUxobm5oUWVrZzZMUG9CbDE5b2s0N28wbUVN?=
 =?utf-8?B?V0JKMXVmdUhtcG5FTEJONmlYazl4cDB4Q2dCc2pSNU9oSTlmSGdaODBDWFlU?=
 =?utf-8?B?cGNqUW1ramJ0MnprLzFpdk9xeUFrOG93TExmQ3NBS3hBS3ZXdm9iZlIrKy9s?=
 =?utf-8?B?MkQ2anV0R2YvcnJqVy8yZTNsUVJNVWxXSlRYWm1VWFcrN2JOTUpZL3Y5UXBJ?=
 =?utf-8?B?ZDROanF2Nk1wU1ZrNW9QWEdWTzNGUDJHayswT1drMGRYWG1Dc0FkS2ZOUHY5?=
 =?utf-8?B?SzdCejJaSWNabWJjeGkrODFlUk96aVpobFBCODUvNTh2QnUyNVdTZE5uM2lm?=
 =?utf-8?B?L3Q1WWRjVFJORGsxbnYvQ0UwdVE5SWYwNXVleVVCZTdlSFE1YU83UFkvTjNv?=
 =?utf-8?B?aTlZcS9ja0N0ZWxZSjByaEszcUluN01pVktaRENlc3QrUE5XcUlKWEFFUmFi?=
 =?utf-8?Q?VZeHVOKGFeN+LpvyzeCf8gAFF7/6/VdXtR28Hkx?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7745AE2CF679EC44B6EA1AB1ED518C54@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1116bc66-d735-4204-7e66-08d92bf6b020
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 10:01:16.5220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EO/HiYIaYSMP7t40Wufajwav7m8YGgh1qe9Ck+wDQQvLo4IUpYwGOYMYQqbVsY0yYCkimKbnQ5l3ydjNG+kFW3ZoDzPG72lUWXHaOBm5GP3Y46dC0LAxY1tYQg1a+fU7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7347
X-Proofpoint-ORIG-GUID: ysHWm0mYQL2LHm0pwD9Uro7oJpg975tf
X-Proofpoint-GUID: ysHWm0mYQL2LHm0pwD9Uro7oJpg975tf
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 mlxscore=0 malwarescore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106100065

SGVsbG8sIFJvZ2VyIQ0KDQpPbiAxMC4wNi4yMSAxMDo1NCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToNCj4gT24gRnJpLCBKdW4gMDQsIDIwMjEgYXQgMDY6Mzc6MjdBTSArMDAwMCwgT2xla3NhbmRy
IEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBIaSwgYWxsIQ0KPj4NCj4+IFdoaWxlIHdvcmtpbmcg
b24gUENJIFNSLUlPViBzdXBwb3J0IGZvciBBUk0gSSBzdGFydGVkIHBvcnRpbmcgWzFdIG9uIHRv
cA0KPj4gb2YgY3VycmVudCBQQ0kgb24gQVJNIHN1cHBvcnQgWzJdLiBUaGUgcXVlc3Rpb24gSSBo
YXZlIGZvciB0aGlzIHNlcmllcw0KPj4gaXMgaWYgd2UgcmVhbGx5IG5lZWQgZW11bGF0aW5nIFNS
LUlPViBjb2RlIGluIFhlbj8NCj4+DQo+PiBJIGhhdmUgaW1wbGVtZW50ZWQgYSBQb0MgZm9yIFNS
LUlPViBvbiBBUk0gWzNdIChwbGVhc2Ugc2VlIHRoZSB0b3AgMg0KPj4gcGF0Y2hlcykNCj4+IGFu
ZCBpdCAid29ya3MgZm9yIG1lIjogTVNJIHN1cHBvcnQgaXMgc3RpbGwgV0lQLCBidXQgSSB3YXMg
YWJsZSB0byBzZWUgdGhhdA0KPj4gVkZzIGFyZSBwcm9wZXJseSBzZWVuIGluIHRoZSBndWVzdCBh
bmQgQkFScyBhcmUgcHJvcGVybHkgcHJvZ3JhbW1lZCBpbiBwMm0uDQo+Pg0KPj4gV2hhdCBJIGNh
bid0IGZ1bGx5IHVuZGVyc3RhbmQgaXMgaWYgd2UgY2FuIGxpdmUgd2l0aCB0aGlzIGFwcHJvYWNo
IG9yIHRoZXJlDQo+PiBhcmUgdXNlLWNhc2VzIEkgY2FuJ3Qgc2VlLg0KPj4NCj4+IFByZXZpb3Vz
bHkgSSd2ZSBiZWVuIHRvbGQgdGhhdCB0aGlzIGFwcHJvYWNoIG1pZ2h0IG5vdCB3b3JrIG9uIEZy
ZWVCU0QNCj4+IHJ1bm5pbmcNCj4+IGFzIERvbWFpbi0wLCBidXQgaXMgc2VlbXMgdGhhdCAiUENJ
IFBhc3N0aHJvdWdoIGlzIG5vdCBzdXBwb3J0ZWQNCj4+IChYZW4vRnJlZUJTRCkiDQo+PiBhbnl3
YXlzIFs0XS4NCj4gUENJIHBhc3N0aG9yZ2ggaXMgbm90IHN1cHBvcnRlZCBvbiBGcmVlQlNEIGRv
bTAgYmVjYXVzZSBQQ0kNCj4gcGFzc3Rocm91Z2ggaXMgbm90IHN1cHBvcnRlZCBieSBYZW4gaXRz
ZWxmIHdoZW4gdXNpbmcgYSBQVkggZG9tMCwgYW5kDQo+IHRoYXQncyB0aGUgb25seSBtb2RlIEZy
ZWVCU0QgZG9tMCBjYW4gdXNlLg0KDQpTbywgaXQgaXMgc3RpbGwgbm90IGNsZWFyIHRvIG1lOiBo
b3cgYW5kIGlmIFBDSSBwYXNzdGhyb3VnaCBpcyBzdXBwb3J0ZWQNCg0Kb24gRnJlZUJTRCwgd2hh
dCBhcmUgdGhlIHNjZW5hcmlvcyBhbmQgcmVxdWlyZW1lbnRzIGZvciB0aGF0Pw0KDQo+DQo+IFBI
WVNERVZPUF9wY2lfZGV2aWNlX2FkZCBjYW4gYmUgYWRkZWQgdG8gRnJlZUJTRCwgc28gaXQgY291
bGQgYmUgbWFkZQ0KPiB0byB3b3JrLiBJIGhvd2V2ZXIgdGhpbmsgdGhpcyBpcyBub3QgdGhlIHBy
b3BlciB3YXkgdG8gaW1wbGVtZW50DQo+IFNSLUlPViBzdXBwb3J0Lg0KDQpJIHdhcyBub3QgYWJs
ZSB0byBmaW5kIGFueSBzdXBwb3J0IGZvciBQSFlTREVWT1BfWFhYIGluIEZyZWVCU0QgY29kZSwN
Cg0KY291bGQgeW91IHBsZWFzZSBwb2ludCBtZSB0byB3aGVyZSBhcmUgdGhlc2UgdXNlZD8NCg0K
SWYgdGhleSBhcmUgbm90LCBzbyBob3cgWGVuIHVuZGVyIEZyZWVCU0Qga25vd3MgYWJvdXQgUENJ
IGRldmljZXM/DQoNCkkgYW0gdHJ5aW5nIHRvIGV4dHJhcG9sYXRlIG15IGtub3dsZWRnZSBvZiBo
b3cgTGludXggZG9lcyB0aGF0DQoNCihkdXJpbmcgUENJIGVudW1lcmF0aW9uIGluIERvbWFpbi0w
IHdlIHVzZSBoeXBlcmNhbGxzKQ0KDQo+DQo+PiBJIGFsc28gc2VlIEFDUk4gaHlwZXJ2aXNvciBb
NV0gaW1wbGVtZW50cyBTUi1JT1YgaW5zaWRlIGl0IHdoaWNoIG1ha2VzDQo+PiBtZSB0aGluayBJ
DQo+PiBtaXNzIHNvbWUgaW1wb3J0YW50IHVzZS1jYXNlIG9uIHg4NiB0aG91Z2guDQo+Pg0KPj4g
SSB3b3VsZCBsaWtlIHRvIGFzayBmb3IgYW55IGFkdmlzZSB3aXRoIFNSLUlPViBpbiBoeXBlcnZp
c29yIHJlc3BlY3QsDQo+PiBhbnkgcG9pbnRlcnMNCj4+IHRvIGRvY3VtZW50YXRpb24gb3IgYW55
IG90aGVyIHNvdXJjZSB3aGljaCBtaWdodCBiZSBoYW5keSBpbiBkZWNpZGluZyBpZg0KPj4gd2Ug
ZG8NCj4+IG5lZWQgU1ItSU9WIGNvbXBsZXhpdHkgaW4gWGVuLg0KPj4NCj4+IEFuZCBpdCBkb2Vz
IGJyaW5nIGNvbXBsZXhpdHkgaWYgeW91IGNvbXBhcmUgWzFdIGFuZCBbM10pLi4uDQo+Pg0KPj4g
QSBiaXQgb2YgdGVjaG5pY2FsIGRldGFpbHMgb24gdGhlIGFwcHJvYWNoIGltcGxlbWVudGVkIFsz
XToNCj4+IDEuIFdlIHJlbHkgb24gUEhZU0RFVk9QX3BjaV9kZXZpY2VfYWRkDQo+PiAyLiBXZSBy
ZWx5IG9uIERvbWFpbi0wIFNSLUlPViBkcml2ZXJzIHRvIGluc3RhbnRpYXRlIFZGcw0KPj4gMy4g
QkFScyBhcmUgcHJvZ3JhbW1lZCBpbiBwMm0gaW1wbGVtZW50aW5nIGd1ZXN0IHZpZXcgb24gdGhv
c2UgKHdlIGhhdmUNCj4+IGV4dGVuZGVkDQo+PiB2UENJIGNvZGUgZm9yIHRoYXQgYW5kIHRoaXMg
cGF0aCBpcyB1c2VkIGZvciBib3RoICJub3JtYWwiIGRldmljZXMgYW5kDQo+PiBWRnMgdGhlIHNh
bWUgd2F5KQ0KPj4gNC4gTm8gbmVlZCB0byB0cmFwIFBDSV9TUklPVl9DVFJMDQo+PiA1LiBObyBu
ZWVkIHRvIHdhaXQgMTAwbXMgaW4gWGVuIGJlZm9yZSBhdHRlbXB0aW5nIHRvIGFjY2VzcyBWRiBy
ZWdpc3RlcnMNCj4+IHdoZW4NCj4+IGVuYWJsaW5nIHZpcnR1YWwgZnVuY3Rpb25zIG9uIHRoZSBQ
RiAtIHRoaXMgaXMgaGFuZGxlZCBieSBEb21haW4tMCBpdHNlbGYuDQo+IEkgdGhpbmsgdGhlIFNS
LUlPViBjYXBhYmlsaXR5IHNob3VsZCBiZSBoYW5kbGVkIGxpa2UgYW55IG90aGVyIFBDSQ0KPiBj
YXBhYmlsaXR5LCBpZTogbGlrZSB3ZSBjdXJyZW50bHkgaGFuZGxlIE1TSSBvciBNU0ktWCBpbiB2
UENJLg0KPg0KPiBJdCdzIGxpa2VseSB0aGF0IHVzaW5nIHNvbWUga2luZCBvZiBoeXBlcmNhbGwg
aW4gb3JkZXIgdG8gZGVhbCB3aXRoDQo+IFNSLUlPViBjb3VsZCBtYWtlIHRoaXMgZWFzaWVyIHRv
IGltcGxlbWVudCBpbiBYZW4sIGJ1dCB0aGF0IGp1c3QgYWRkcw0KPiBtb3JlIGNvZGUgdG8gYWxs
IE9TZXMgdGhhdCB3YW50IHRvIHJ1biBhcyB0aGUgaGFyZHdhcmUgZG9tYWluLg0KDQpJIGRpZG4n
dCBpbnRyb2R1Y2UgYW55IG5ldywgYnV0IFBIWVNERVZPUF9wY2lfZGV2aWNlX2FkZCB3YXMgZW5v
dWdoLg0KDQpUaGUgcmVzdCBJIGRpZCBpbiBYZW4gaXRzZWxmIHdydCBTUi1JT1YuDQoNCj4NCj4g
T1RPSCBpZiB3ZSBwcm9wZXJseSB0cmFwIGFjY2Vzc2VzIHRvIHRoZSBTUi1JT1YgY2FwYWJpbGl0
eSAobGlrZSBpdA0KPiB3YXMgcHJvcG9zZWQgaW4gWzFdIGZyb20geW91ciByZWZlcmVuY2VzKSB3
ZSB3b24ndCBoYXZlIHRvIG1vZGlmeSBPU2VzDQo+IHRoYXQgd2FudCB0byBydW4gYXMgaGFyZHdh
cmUgZG9tYWlucyBpbiBvcmRlciB0byBoYW5kbGUgU1ItSU9WIGRldmljZXMuDQoNCk91dCBvZiBj
dXJpb3NpdHksIGNvdWxkIHlvdSBwbGVhc2UgbmFtZSBhIGZldz8gSSBkbyB1bmRlcnN0YW5kIHRo
YXQNCg0Kd2UgZG8gd2FudCB0byBzdXBwb3J0IHVubW9kaWZpZWQgT1NlcyBhbmQgdGhpcyBpcyBp
bmRlZWQgaW1wb3J0YW50Lg0KDQpCdXQsIHN0aWxsIHdoYXQgYXJlIHRoZSBvdGhlciBPU2VzIHdo
aWNoIGRvIHN1cHBvcnQgWGVuICsgUENJIHBhc3N0aHJvdWdoPw0KDQo+DQo+IElNTyBnb2luZyBm
b3IgdGhlIGh5cGVyY2FsbCBvcHRpb24gc2VlbXMgZWFzaWVyIG5vdywgYnV0IGFkZHMgYSBidXJk
ZW4NCj4gdG8gYWxsIE9TZXMgdGhhdCB3YW50IHRvIG1hbmFnZSBTUi1JT1YgZGV2aWNlcyB0aGF0
IHdpbGwgaHVydCB1cyBsb25nDQo+IHRlcm0uDQoNCkFnYWluLCBJIHdhcyBhYmxlIHRvIG1ha2Ug
aXQgc29tZXdoYXQgd29yayB3aXRoIFBIWVNERVZPUF9wY2lfZGV2aWNlX2FkZCBvbmx5Lg0KDQo+
DQo+IFRoYW5rcywgUm9nZXIuDQoNClRoYW5rIHlvdSBmb3IgeW91ciB2YWx1YWJsZSBjb21tZW50
cywNCg0KT2xla3NhbmRyDQoNCj4NCj4+IFRoYW5rIHlvdSBpbiBhZHZhbmNlLA0KPj4gT2xla3Nh
bmRyDQo+Pg0KPj4gWzFdDQo+PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4LTA3L21zZzAx
NDk0Lmh0bWxfXzshIUdGXzI5ZGJjUUlVQlBBIW1JcExFdkJteFJvRldVZ1ljN01GQUYwMzJrREdk
ODk3TlA5dDZkMWZzYzl1Wm9MSFNXOTdHWDh4QVdLaHZsRkY4Q2V6bXZTWkdnJCBbbGlzdHNbLl14
ZW5wcm9qZWN0Wy5db3JnXQ0KPj4gWzJdDQo+PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19f
aHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L2Z1c2EveGVuLWludGVncmF0aW9uLy0vdHJl
ZS9pbnRlZ3JhdGlvbi9wY2ktcGFzc3Rocm91Z2hfXzshIUdGXzI5ZGJjUUlVQlBBIW1JcExFdkJt
eFJvRldVZ1ljN01GQUYwMzJrREdkODk3TlA5dDZkMWZzYzl1Wm9MSFNXOTdHWDh4QVdLaHZsRkY4
Q2YzWjhZazd3JCBbZ2l0bGFiWy5dY29tXQ0KPj4gWzNdIGh0dHBzOi8vdXJsZGVmZW5zZS5jb20v
djMvX19odHRwczovL2dpdGh1Yi5jb20veGVuLXRyb29wcy94ZW4vY29tbWl0cy9wY2lfcGhhc2Uy
X187ISFHRl8yOWRiY1FJVUJQQSFtSXBMRXZCbXhSb0ZXVWdZYzdNRkFGMDMya0RHZDg5N05QOXQ2
ZDFmc2M5dVpvTEhTVzk3R1g4eEFXS2h2bEZGOENmbmNJZGd2dyQgW2dpdGh1YlsuXWNvbV0NCj4+
IFs0XSBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly93aWtpLmZyZWVic2Qub3Jn
L1hlbl9fOyEhR0ZfMjlkYmNRSVVCUEEhbUlwTEV2Qm14Um9GV1VnWWM3TUZBRjAzMmtER2Q4OTdO
UDl0NmQxZnNjOXVab0xIU1c5N0dYOHhBV0todmxGRjhDY2VMT1BkeWckIFt3aWtpWy5dZnJlZWJz
ZFsuXW9yZ10NCj4+IFs1XSBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wcm9q
ZWN0YWNybi5naXRodWIuaW8vbGF0ZXN0L3R1dG9yaWFscy9zcmlvdl92aXJ0dWFsaXphdGlvbi5o
dG1sX187ISFHRl8yOWRiY1FJVUJQQSFtSXBMRXZCbXhSb0ZXVWdZYzdNRkFGMDMya0RHZDg5N05Q
OXQ2ZDFmc2M5dVpvTEhTVzk3R1g4eEFXS2h2bEZGOENkanFIUHhaUSQgW3Byb2plY3RhY3JuWy5d
Z2l0aHViWy5daW9d

