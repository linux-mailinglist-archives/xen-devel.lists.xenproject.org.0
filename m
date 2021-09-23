Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B97415F25
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 15:03:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194159.345967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTONj-0001Dt-PB; Thu, 23 Sep 2021 13:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194159.345967; Thu, 23 Sep 2021 13:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTONj-0001Av-M1; Thu, 23 Sep 2021 13:03:19 +0000
Received: by outflank-mailman (input) for mailman id 194159;
 Thu, 23 Sep 2021 13:03:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/6DS=ON=epam.com=prvs=9900839950=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mTONh-0001An-ML
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 13:03:17 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e1ff9fc-1c6e-11ec-ba32-12813bfff9fa;
 Thu, 23 Sep 2021 13:03:16 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18NChDOr000644;
 Thu, 23 Sep 2021 13:03:12 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52])
 by mx0b-0039f301.pphosted.com with ESMTP id 3b8r9uggbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 13:03:11 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR0302MB3217.eurprd03.prod.outlook.com (2603:10a6:208:2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 23 Sep
 2021 13:03:09 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 13:03:09 +0000
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
X-Inumbo-ID: 9e1ff9fc-1c6e-11ec-ba32-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQMsbxw4Z1DmLBnZM9hqkVbBb5XPOfwDh3aNBqBu1pdXlppOCFJVJwiOWJGOxVdt0FDrL9FExXYtld5CkY0PGwUrjADaPaQ7LN1YxpeuqdukbjbX4/G3C2s/xfRuEzyrOxilAzDlmvPwT2odSkO9E0pcBp+5CfLiJMnBFE6RVussnUlB5pMDMqHJ+76o0H+B8ogABau+sErs0rZ3mY3oLllcyInUU32uv0zva/PN4R8Ob7mS9vcnPaVG4TeePBhYJslJm9SGbyDORvfoDA2Csx5/cUYhr8pzZXqFDXXWfbb5xmrZFdeFl8zlCJ4T9UxxqcCto8kbBJMCL8G8on7n4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gDW9yuq4Iug2NRkjjA7yR7nq+UKZzimaAIQHqisNjy0=;
 b=JSyL+2J5uLI7IPcF0ulSVpRTsbvx6PzfyxW0i5tdnHJBzjpMHV02QzERHiNv9aDqmyKfbJ+7FVpThGKPMqTnv0t5ypoSrHtHh+alhxZHl8zTvhXYHk2KvBretNal1vzxos+9pPz+FNn57tcWbQ9UcmPJjwZnsocNoTYN0tQs1d2Qp5Mh+Lz9xZen4x34RYtW/rmKwJGTFKrlHmUvMzixZl5OCS7qCtvp8QPSw1u2v+UIGmggf0sxcXjm0r0SUAgsIrewH9bs7OQBHFaArK2S/lhDb5Dn8KJ1UyOzmQHzwuaxHQ49iiiijIIsU27oBdhmt+cMg3Z2vBr2Tk31HLWXaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDW9yuq4Iug2NRkjjA7yR7nq+UKZzimaAIQHqisNjy0=;
 b=rZIRohMUgE6mpqbJqoYiDx37RSTklyaZ4vSk30e+n92pRRddhxQUV0NFhg+Y0WN+/9p0TpJoi0VKX+YU+esx250WnwuEe44iQDAwa7PtqxZFUmUnNfP/YbGH8+Qbf7N4RCf9dCy0IR2GyBvP1pfOY/4h4PfZk8Ae0R13r4bCiRyUk3UV8zX/zQv5Pwsu5YjGGtP5O3AS5jOncxueX41ckITmdJ1OIiicFQX8fAk3Wl/Mqj1i+AGsqwcXcEDH/HboDIK+TWscrCZ5pYaJbdEIxizGMFXR2PYoDS+JGXcWWACuWkGdCmI2YCKuo60aeW373WIqEdtz6eowa9UngdqH7A==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
        Rahul Singh
	<rahul.singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        "andre.przywara@arm.com"
	<andre.przywara@arm.com>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 11/17] xen/arm: PCI host bridge discovery within XEN on
 ARM
Thread-Topic: [PATCH v2 11/17] xen/arm: PCI host bridge discovery within XEN
 on ARM
Thread-Index: AQHXsHtbREhsUX85MESzoUZXILt9Yg==
Date: Thu, 23 Sep 2021 13:03:09 +0000
Message-ID: <e2634706-3198-3224-371c-3d13210a35c9@epam.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
 <c837d73b1fc8953ab48d36609482cf84832b7827.1632307952.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109221836190.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109221836190.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37247253-d8a1-4686-ad5d-08d97e927e0c
x-ms-traffictypediagnostic: AM0PR0302MB3217:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR0302MB3217EDF130A006A2A5A6FA47E7A39@AM0PR0302MB3217.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ETU3E1/E4Bl+6vVk2nAmlQjvp05VKeb8TMQaWCn56QBUlkGjkoU2tih+4eZZEMkJiL2cZ6EWaab12qjRxXqiF5kabtwEZ2AZeqozuqidu/DUzj0j9Kj0B3qq3as1S6sTHPbH4sL19Qp++IIuqevpfllMOn90UhFTBElqzFvbXM/MYU2gdd/lQiQZ9EA3aZJResTleb5wgP4yMbWnIyjLQ5KWea2NthSLSjet6UqnrVzoIGY19qGsAkZWlH0t+W5XWO4rXd6jzEVz74Q1hpZHThnIatZ9qtOUW3xFyVEfSyFxrq77s4SEHqWPgPDhKkTjeafwNRa9iszZgtxVDgHzKhfm1/oatuaoLA6pO0Bxe3FPbgToMrzpdxZVJCWgnwmGCWxDIKigIcgpnzcg0GEUla/Lx01h4CSOvJ3FtC+3/oLEn98tho9XaRjTXbgShckLrSuHFDnT9oRH/oLTYfVYSln1ZQWossiPzwcpZgcJASsWUlRnPkavxCmLLCb8p0WDkADmxo5O7LfZcJAJTz+DZIVhbvlt8jYzKEfIqRQcV2aCSty50aYAAOJyEZM4tnGuV/FWWuvPDYOTI8i8rAAbDBGT4f4L0EWdzu0BFztFeo+50wGXoUMFNsR+I3UVk9hGyN6r47BmUiCxUMNdQGQ8/PT2MD6tFGQ+mlo3Tv3ES87qg5wi17ePWCDCpQc6jzzSoEoCVYe38zAUl6wVVSmHtviiXBv1C+10ER0gkYDOhVzwlsLir9gZu0FMEiRK9cYD
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(316002)(6506007)(54906003)(71200400001)(4326008)(2906002)(8936002)(186003)(2616005)(66446008)(91956017)(64756008)(66556008)(38100700002)(86362001)(6486002)(8676002)(31686004)(36756003)(508600001)(110136005)(6512007)(5660300002)(66476007)(38070700005)(26005)(107886003)(76116006)(122000001)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Mnk0Z0RzdCs3V2RsOFVIM1djQTNtNEM1MERZT2ZFNnhvL2ZOdnlMSTg0Szdn?=
 =?utf-8?B?KzZxZ2xSOGtVK2R3SlhwV2JjSUJ0YmF1ZFRERkluL2NQdmVYL0hHeC91Nm1F?=
 =?utf-8?B?dURHK2FaNnNJcm5yT3RmaWswS21zWmRxNGJycGdKdGtjVmlxMUgxdHBlMGxG?=
 =?utf-8?B?RWxVTkNsM0FXY05yQUJPdTJ5dHF2VXllQUVuN0pCd3hVdmtJQ0M2djRScmV0?=
 =?utf-8?B?aFNuNnNibE5NbEk2UTlLT25xVEtnTVNSRTBBamtmeC9NUHpQNjJ3c0wxQjJK?=
 =?utf-8?B?T3NoVWlQdXNUekI1VHo5b3B2U2wrYTNDWFo2dDdER0xTcS9XREJEQ3g5MjBJ?=
 =?utf-8?B?WDNJMExjQzdWbGFtUXNRZ05YRVJSeXRsNytGZklIQm5tWGJicDNieWdPRFll?=
 =?utf-8?B?Y3pxODJBWGR4S2RnYzBFbkNYVldQNUtPeGRXM0h6NlBlOG1aRkc1UzJ6UnZE?=
 =?utf-8?B?S1E4cG9pV3hNaURyUjd0ZVdrTXp1NjJlWThBSWEvNjM5Z2czVi80eW1nZUg3?=
 =?utf-8?B?RVlwQ1B5aEhoeTJGQnUxQjU1cHkzQjV4QitObWwxSkNWaFF4UWtWRG51OVdE?=
 =?utf-8?B?ZUJmVEJrMS9rMExKRmtzSkV1Ryt1K01nVVpQbnZFdkg3MUY2djJSaTFmQnRJ?=
 =?utf-8?B?YlNpaXU2OHJ5a1Q2dTdzQXo5QXp0UnEvb3V2TUErRG9GUWFYOXZPNmU1amtv?=
 =?utf-8?B?ajYxbzIveWxSMEgxN1JrY29xZ1FWTXkrMTA1UWRTV2ZNYWpUYjVwSy85Mnoz?=
 =?utf-8?B?YzZQV1Vuc005ZExZVzZXclFiUU8zQ0hXdjBmVEIrZys0RDdEMEZBUHY3dDRU?=
 =?utf-8?B?dk91T1NVVFNodnBXQW9lL1dPL01QTld5Z21MYnpoTldpVVB5UGQ0bm5xZEJ0?=
 =?utf-8?B?bit0V2JRY1k4TEJVUjRFNWVoQnBXWDViL09yT0M1dUtzZk5qb1hyY1pzU1g4?=
 =?utf-8?B?SlFBblR5NjAzVnB4VGdNd0RUdGpyZE5EcjFRZFpvN08zU3I2dndmUktrdnlQ?=
 =?utf-8?B?aUxSaVpwZUEwekRYWXFYVml5SmthbXFYMGF1eGEvNWpXVnF1Rmh0SUtwNTJE?=
 =?utf-8?B?VjhVVFgrRXZVUEdyQlpjbGZoWXhDMW5OaVVheDJKMisyRVY2dDNzekxXQ1VE?=
 =?utf-8?B?YlNRa1Jac0dVMlgyenpCeCtaYjJzdXNvbjFtbDM1SVFmd2xGOUtZelpITGpZ?=
 =?utf-8?B?bXl0UDBiNExaWmtwMHZTS3BuK3NiTW9vbHpDL3AyTjlNZUVnRDJ0UUQyTno1?=
 =?utf-8?B?N0FQVzJ4Mk1pNWZyUnViTmkrYVBSeGVUWDZtRS82NWlKTmpZajF6engzWXZ2?=
 =?utf-8?B?V1VSeGhzTS9mS2lEa256WW8yOU5TbkMyVURlSmpCenZRTlI1QVN1Wm9Hd3R5?=
 =?utf-8?B?a2dCUEJOWW16cHZiZjhsRnZFQk45RkdPMXhKYmJ4NHVpWFNPQUNzTEFNS0Ni?=
 =?utf-8?B?Lyt4WWhMY1VXVFNkWEFSeTlOOWZBcVpRQ2pPaytyZ1ZyM21yVlJEbG8zZGlK?=
 =?utf-8?B?L1ZUYmlHNlEwQ2ovTzhoK3lZOCtwSDJNTndaYm1MeEJzdkMzMC9zbDl3eW42?=
 =?utf-8?B?VmJxbTNPQXpzQTZ2S0NhdERzL1dZc2VnM01MSzhXTHR2R3RLUDM4YzJlai96?=
 =?utf-8?B?L0pIQTdtQXBYMkhLRHNBYjdFZTh2T3l4dVg2dkVETGlqZ0xoM05OUG9Jcy84?=
 =?utf-8?B?TmMraUFTeDRzZVFNN2JFZzR6WmlENUJrTGhNSkhPZzViTFE5VUlrRXRpUnVM?=
 =?utf-8?Q?ifMDo09E0cFXt6leKzMnBvG7r3amOv9eXCYXu2n?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79945C8FC58612419D4727C4428F9BD6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37247253-d8a1-4686-ad5d-08d97e927e0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2021 13:03:09.3814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SxvaWdH5yM68pKHAdyHyovMD/jaHn4v4W6URXfdvPr/N1j+dp7CmzaBjX/By7gv6z73jTPV91Re7yNZQzaSnhDX8lRv4psQ5InKpvjPi8rsNtSbd5FBNVQ3VJB+us5yv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3217
X-Proofpoint-GUID: j_nOWS5M5mRPjH0JnH7hUKC8wh_ToXX5
X-Proofpoint-ORIG-GUID: j_nOWS5M5mRPjH0JnH7hUKC8wh_ToXX5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_04,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109200000
 definitions=main-2109230082

SGksIFN0ZWZhbm8hDQoNCltzbmlwXQ0KDQoNCj4+ICt9Ow0KPj4gKw0KPj4gKy8qIERlZmF1bHQg
RUNBTSBvcHMgKi8NCj4+ICtleHRlcm4gY29uc3Qgc3RydWN0IHBjaV9lY2FtX29wcyBwY2lfZ2Vu
ZXJpY19lY2FtX29wczsNCj4gSWYgd2UgdXNlIGNvbnRhaW5lcl9vZiBhbmQgZ2V0IHJpZCBvZiBz
eXNkYXRhLCBJIHdvbmRlciBpZiB3ZSBnZXQgYXZvaWQNCj4gZXhwb3J0aW5nIHBjaV9nZW5lcmlj
X2VjYW1fb3BzLg0KPg0KPg0KPj4gK2ludCBwY2lfaG9zdF9jb21tb25fcHJvYmUoc3RydWN0IGR0
X2RldmljZV9ub2RlICpkZXYsIGNvbnN0IHZvaWQgKmRhdGEpOw0KPiBUaGlzIHNob3VsZCBiZSBz
dGF0aWMgYW5kIG5vdCBleHBvcnRlZA0KPg0KPg0KPj4gK2ludCBwY2lfZ2VuZXJpY19jb25maWdf
cmVhZChzdHJ1Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlkZ2UsIHVpbnQzMl90IHNiZGYsDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHJlZywgdWludDMyX3QgbGVuLCB1
aW50MzJfdCAqdmFsdWUpOw0KPiBhbHNvIHRoaXMNCj4NCj4NCj4+ICtpbnQgcGNpX2dlbmVyaWNf
Y29uZmlnX3dyaXRlKHN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZSwgdWludDMyX3Qgc2Jk
ZiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgcmVnLCB1aW50MzJf
dCBsZW4sIHVpbnQzMl90IHZhbHVlKTsNCj4gYWxzbyB0aGlzDQo+DQo+DQo+PiArdm9pZCBfX2lv
bWVtICpwY2lfZWNhbV9tYXBfYnVzKHN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZSwNCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3Qgc2JkZiwgdWludDMyX3Qg
d2hlcmUpOw0KPiBhbHNvIHRoaXMNCj4NCj4+ICAgc3RhdGljIGFsd2F5c19pbmxpbmUgYm9vbCBp
c19wY2lfcGFzc3Rocm91Z2hfZW5hYmxlZCh2b2lkKQ0KPj4gICB7DQo+PiAgICAgICByZXR1cm4g
cGNpX3Bhc3N0aHJvdWdoX2VuYWJsZWQ7DQo+PiAtLSANCj4+IDIuMTcuMQ0KDQpBbGwgdGhlIGFi
b3ZlIGlzIHN0aWxsIG5lZWQgdG8gYmUgZXhwb3J0ZWQgYXMgdGhvc2UgYXJlIGdvaW5nIHRvIGJl
IHVzZWQNCg0KYnkgb3RoZXIgYnJpZGdlJ3MgaW1wbGVtZW50YXRpb25zLCBzZWUgWnlucU1QIGZv
ciBpbnN0YW5jZSBsYXRlciBpbiB0aGUgc2VyaWVzLg0KDQpJJ2xsIHBvc3QgYSBzbmlwcGV0IGZy
b20gdGhlIGZ1dHVyZToNCg0KLyogRUNBTSBvcHMgKi8NCmNvbnN0IHN0cnVjdCBwY2lfZWNhbV9v
cHMgbndsX3BjaWVfb3BzID0gew0KIMKgwqDCoCAuYnVzX3NoaWZ0wqAgPSAyMCwNCiDCoMKgwqAg
LmNmZ19yZWdfaW5kZXggPSBud2xfY2ZnX3JlZ19pbmRleCwNCiDCoMKgwqAgLnBjaV9vcHPCoMKg
wqAgPSB7DQogwqDCoMKgwqDCoMKgwqAgLm1hcF9idXPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgPSBwY2lfZWNhbV9tYXBfYnVzLA0KIMKgwqDCoMKgwqDCoMKgIC5yZWFkwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgID0gcGNpX2dlbmVyaWNfY29uZmlnX3JlYWQsDQog
wqDCoMKgwqDCoMKgwqAgLndyaXRlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA9
IHBjaV9nZW5lcmljX2NvbmZpZ193cml0ZSwNCiDCoMKgwqDCoMKgwqDCoCAubmVlZF9wMm1fbWFw
cGluZ8KgwqDCoMKgwqDCoCA9IHBjaV9lY2FtX25lZWRfcDJtX21hcHBpbmcsDQogwqDCoMKgIH0N
Cn07DQoNCkRUX0RFVklDRV9TVEFSVChwY2lfZ2VuLCAiUENJIEhPU1QgWllOUU1QIiwgREVWSUNF
X1BDSSkNCi5kdF9tYXRjaCA9IG53bF9wY2llX2R0X21hdGNoLA0KLmluaXQgPSBwY2lfaG9zdF9j
b21tb25fcHJvYmUsDQpEVF9ERVZJQ0VfRU5EDQo=

