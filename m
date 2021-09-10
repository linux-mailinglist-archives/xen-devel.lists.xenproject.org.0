Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB37406DDB
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 17:02:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184521.333191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOi22-0001mf-3J; Fri, 10 Sep 2021 15:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184521.333191; Fri, 10 Sep 2021 15:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOi21-0001kV-Vr; Fri, 10 Sep 2021 15:01:33 +0000
Received: by outflank-mailman (input) for mailman id 184521;
 Fri, 10 Sep 2021 15:01:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6NG=OA=epam.com=prvs=9887a95815=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mOi20-0001kP-7R
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 15:01:32 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb660664-1247-11ec-b250-12813bfff9fa;
 Fri, 10 Sep 2021 15:01:31 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18AExGmg010270; 
 Fri, 10 Sep 2021 15:01:25 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 by mx0b-0039f301.pphosted.com with ESMTP id 3b09kjg09b-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 15:01:24 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3472.eurprd03.prod.outlook.com (2603:10a6:803:25::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.26; Fri, 10 Sep
 2021 15:01:20 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 15:01:20 +0000
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
X-Inumbo-ID: fb660664-1247-11ec-b250-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kbb7fdK0k5JOMPjhSLtIRUdhGOAsT33+roZ2I0NqlE5CjX/Z8hrN9bJOzk12vGdgmUYZ0f0KdACUBXm+w4b1LxKchNaiDQVy0iD4Pusa8mJE1GAfzHziwK0NUYS+liu5Aq9FZHJFuzstE81hnIDdhDeYDgorEnzhCuhVRyknSsQBqXehLYkM1jECGXjtYlF/9W0VHt0USc14z77PFxdVs4EKN0smeHke36uCabuolywubWXC8XTIg6ekuDsKGyZplsqDjiNwdGMnbfa2LHRjgwiLnikNTGg/ZlOpBdcC8zd2nY+7BC5OystSueIZFvpf8PwK550juBX7JvAp/DGLsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=UsBQJVE9lvsH/VOk2QeEH2QTh48KUIp1w73HLPSBwT8=;
 b=HTN4oLr2RpTOQDHCPo+0B4RvaqmS/y7PfuAUiKI72Zo1whgm9U3Q4fLWwfK14T99rsD+gFRwYr2DqG+ITk1RwTbmxwP+g+DLTMdTLdmH9x1Y3TKzGj5OO8fCnHN09xwBeU4lPwIEHtwz4/6oGQ2IRPjvdYNQ/M2/VtV2cnB+D9TrklGkt1XDZnHpn/exzVhaCTsRmDYcccRzamaqJoKFmXhP9e7QLTfj92k/fnt3QMRQC3VbJhMhl2IqUj+4u/aDLItBqHUbufnamyXyn6j+Fb7E1Zqsuj274tf4CtCGPg/dMYfNg0ZOunFqqPmJE9IRlqKUrOgYGiwpgkwj4DSCrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsBQJVE9lvsH/VOk2QeEH2QTh48KUIp1w73HLPSBwT8=;
 b=H/EvRLThRnuW8fKJgure95rIsLmomy0pG5KXKbvQ7j7D1SGIZQsxJezAP/a9sQicsFEUeIMT6heNp32RudRWL7hVh1qwjyEMJsgDVKIsMszk0Drg6T11FGQ5+yJ9mF1/PdU0a5T9NGT9zuFT4jK0ZZYf7g5Xp/jcbdJNwqmovMa9WhSf53i59WNtwZKq+5wYhb2aeXtrkBdZi3WFtNjyYpgm41bxwGWKnyclbEncOqA/KeYUsTWPolWrS30PkWFl+q3HJ7lltRVMYx6xOTyr06lgwr16sHRRmjCpaiyR60DLDLCTX8t4Q1ED82rxxyADCEM1nxR+1emIhbTOlA9x1g==
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
Subject: Re: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's
 p2m
Thread-Topic: [PATCH 10/11] xen/arm: Do not map PCI ECAM space to Domain-0's
 p2m
Thread-Index: 
 AQHXoJ50hf+zXQhc2ka7YfmmERKX+aucB06AgAE4wYCAAAtRgIAADDiAgAAEjQCAAAWagIAAA+KAgAACjwA=
Date: Fri, 10 Sep 2021 15:01:20 +0000
Message-ID: <f1ff6186-c483-3de1-cbdf-ac96a6009d15@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-11-andr2000@gmail.com>
 <35f7faf6-db90-f279-8ed1-fa4ba96812fb@xen.org>
 <468a868c-1183-e05f-0c92-3cba172cecb3@epam.com>
 <9ec2c22c-b834-1c87-71af-236e13538c4a@xen.org>
 <15a930ff-77d5-b962-b346-c586a2769009@epam.com>
 <733cd423-14f5-c028-8fdd-39aed34cd352@xen.org>
 <3c3c253c-4af7-ea25-5f73-a0f7319dab50@epam.com>
 <34abe11e-c2f9-50ce-fb79-836bfcfb11e0@xen.org>
In-Reply-To: <34abe11e-c2f9-50ce-fb79-836bfcfb11e0@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ddda9c2e-73eb-4558-febe-08d9746bd96b
x-ms-traffictypediagnostic: VI1PR0302MB3472:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB347236CFF6F4AF4EEC359678E7D69@VI1PR0302MB3472.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2/uy8CDI0ZBwLctUS4oVT0cgSyQiz79JZvE+NfMJstvPjfIKtItxFnrHh9VyV0hyBZb1vOSiqHgYqPAd+xZjZuQOsmD+zn/K1p+o88097rNCup7tJ3PxI1Zw4/HsZyY2WFabBZdwp4UBeiL8AnDEboEU9X30Gl2U0Zy315maeI6bLt7xopLSsWbxxLxNYSXFtqtejAOZZmN7vC66/Hbx7Yky9BRy8AAo6WtmWF9UG9apOcbiRORI3+IeS/ayZfu0C3Ffyrc3OVjcqcVVEyUnxt3hUHcZsbsgDxjhsdzx6XwJ01fLY5lRq0kK7/hIBS8lGunnb//hvoVhTi0HE43uzsDQmehb6fn9rlJlcz4HhTEkTijbCinEbVGTZKWx+431Mzbft7kGxHHDEeN8i3iJtuWl+u5gO9jtZoNeKlpbH68bmARTcZ52RWy4S+7ISMGJTfadYIdTlYq9uTAf68kEfJZcUgWpFRNTukS2myVevuZSxmgCO/ncCTVkMASPfJ3gENEnl8e8OTgEaVIDUwU6CvThVUPGoOSQzA/W+Pd5hNM4fNUSBi4o4luncOiSIKBeqtprg9xmAk53lV/yIcmBSQ23VR2A8g+WLRRUqgzz3eBgCg3PI5zrUjkpQ4bNjEnolyDxF2J/PU3zrBHcY6Cs0Y2WHV1M5pIrNGquUTKMN5Hi9HO+GjdMPjIRDX4SaHxiS9jFyVD/X4fPDHG6siSnOnYEZWcIL0SLLow9sHl0kaiCV2CVvvaf+3aDwNcO1gbq
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(71200400001)(8676002)(6512007)(5660300002)(31686004)(66946007)(478600001)(86362001)(76116006)(26005)(36756003)(316002)(122000001)(186003)(54906003)(6486002)(38100700002)(64756008)(66476007)(83380400001)(55236004)(6506007)(66556008)(8936002)(53546011)(110136005)(2616005)(38070700005)(66446008)(31696002)(91956017)(2906002)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Uy9ST24xcHZvMXJWd3NxZndOb3BpODJNYVZRSHRZcW5GSGpMZWRrVEExQmNR?=
 =?utf-8?B?YzJDMVpCdUo1S3p3alNtVGMzVXAvdUd0eTgwNm9LTFJVTFJPZDdjWTlSMzBm?=
 =?utf-8?B?RGxQZWpUYndTVGNIZlNmb3R0VCs5c2REWlprZUJEaTg4d25ZU2xaT3ZjWXMz?=
 =?utf-8?B?T3BacDA4OXpic3lVRjBUNHg2YnBjSzd6UWh0MExSSEZ3Q2F0d1JHcVMxa1Zh?=
 =?utf-8?B?S0dMT0tTYUhGSDVsZFRieDlPMmZ5eEZ3dCs1bmpMZjBBWWxFVmc4eUcrTVBt?=
 =?utf-8?B?WGJCWWpuYzh0UlRSdVplcFdqSDdYcjJIWHJGRVdSVHlPVDdYOUdtUktOSUdk?=
 =?utf-8?B?UjZoNGNKMmNJelIvQnpJWUhNRW9PQWo0TFRqR001QnV3bkhjM0oxWFpGdWgy?=
 =?utf-8?B?MWM4b2hnNUVmNW0rcGpWMm8vUlJTTk9udE5xREp1RmRYNVRYWFhPdGVzY29O?=
 =?utf-8?B?amRySVNXbEZmbkhwU0NWajhiQ1poYm1zUHNFc0V0ZVhYSjhqTkJ1ak56bUVu?=
 =?utf-8?B?eXBFZURrV2hxcGZ5NDlPbmJ3b210bGJFVXYwYXJwTkdSZjEvbktFWmdHQmtL?=
 =?utf-8?B?ZHhqZVlwMG5JVjVNTzQ0S0tKWmVmc3NjaFBGeVNJUlRMV2NZMHI4RU1nVVEz?=
 =?utf-8?B?Z3ArUWs1Y0pyR2t0M0xQQnhPdVNTd0ZrcDJQSzkvNm51aEkrWlNSK0N3dHNZ?=
 =?utf-8?B?MnM3L0J1c0RYU1Q4a0NWVDd1VmhHNjdCdzhwSzJEcm9WU1BwSDE2Skl1bUpx?=
 =?utf-8?B?REFqdmN1MFVpVGgrTWI5NXVyQ1JUakFMdVpWZkhVcmRmU29jazc2T0I2M2lG?=
 =?utf-8?B?VjB6a1VMeDRiNEwrbE03YVZqRTZvbFprMTU4bWtYMFNSN1NxQ01PdGZiK20x?=
 =?utf-8?B?TlhXYXE4VTF1TEdqM2E4bERlVlprblpkdWxUQ21INXNUZmNJSnJpMjJ5cEtN?=
 =?utf-8?B?RjhGMUt3SU1JWGVSMm9lV0RtVTNMNUpTQ0Jma2p6S1hsbUREQ2x5UWtaUmRF?=
 =?utf-8?B?MkFvTEZRNkZWdlBVZmNKaWIrLzlqbklYTWY2WUoyeDdEWEE5TFk3amFWNUM4?=
 =?utf-8?B?VzJUS0Iwd1hDZTZ0SGE5STJLcjJRZHpKSlVUczljTkZLOVcwYWR1QkV6YTkw?=
 =?utf-8?B?VFFERFZwWlFjZk44M3JpV3J3YlE4Z3V1Y0NCTHJPMmsxbjFReWdydVdPY1Ro?=
 =?utf-8?B?SHFTYXNLSVIvZVdCSmxBS1JmQThRM0VsdCtJZ295REJrK3VzM1MvOFVSQVd1?=
 =?utf-8?B?R3lEVjZlNWppRkJWY2UxVEZlRmpaSFFlTHBHQ3dVUVN1L0JVS2dGWXRFbjdB?=
 =?utf-8?B?Z3piMkI5OUc5WTF5Y0RVZkpPNW56WVc5Z0tiMFhRbFNmY2E1aWFqbE9yM050?=
 =?utf-8?B?QXRjNFVHSlEvQ1hyNVVFYnFLeWZNV2hBTGl0M0djKzk1RTdoelJYRmgxbEJB?=
 =?utf-8?B?NWlhSit3bVZCT3hYRVp6WnJaVmFOaHEvaUJxUVhLcEtnbTdaT3dTQlBtaUpB?=
 =?utf-8?B?ZVlsVmpxYmtmL0hqVnMvSUwzR3dZa1dWUmwvWVpObGQzME9aY0pHMUc0OWU5?=
 =?utf-8?B?MzZPc0xFb0Z3WUVhZUpzeEZ0bHJrcEdtRlA3YXpJMmtuOVNHaHdJQkJKUjU1?=
 =?utf-8?B?TE43MC9ITWIxdmZmdGpHMytoNG1iTy9CYXFpMnp2WDFzVHFrQllvREs4UjM2?=
 =?utf-8?B?dStTS1djdXhRU0NFVkc1YVFHdzcycWtBaWNrOEV0Qi84eWgvbmc3dFhEblJ5?=
 =?utf-8?B?N01CNlhCdDJ1SXdlK2pvVnJCRXQxTXV6NkdhRFAySDAzaURyRXdMRzBmVWU4?=
 =?utf-8?B?UXVvcjFtU3hVa1Y5MFplUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B0565DB6AB1224DA65E13D67C440489@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddda9c2e-73eb-4558-febe-08d9746bd96b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 15:01:20.6437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kZsL1nHeEHeeOd63aRz3suyVTZezMB79/2AWds/mnuT67LP/JG/UVxO736MnoLIYsGIn7kOq2E2Gx4DjS0Zj0CWRd0wHsLjpteN2CXeYjiMVBByCccA6Jq63coPnvbe1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3472
X-Proofpoint-GUID: P2JD_tC0atxjC4MXtOUrouHomTu-lHnN
X-Proofpoint-ORIG-GUID: P2JD_tC0atxjC4MXtOUrouHomTu-lHnN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_06,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109030001 definitions=main-2109100086

DQpPbiAxMC4wOS4yMSAxNzo1MiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPg0KPg0KPiBPbiAxMC8w
OS8yMDIxIDE1OjM4LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IFtzbmlwXQ0K
Pj4NCj4+DQo+Pj4+PiBXaGF0IGRvIHlvdSBtZWFuIGJ5ICJ1c2VkIGJ5IERvbWFpbi0wIGNvbXBs
ZXRlbHkiPyBUaGUgaG9zdGJyaWRnZSBpcyBvd25lZCBieSBYZW4gc28gSSBkb24ndCB0aGluayB3
ZSBjYW4gbGV0IGRvbTAgYWNjZXNzIGFueSBNTUlPIHJlZ2lvbnMgYnkNCj4+Pj4+IGRlZmF1bHQu
DQo+Pj4+DQo+Pj4+IE5vdyBpdCdzIG15IHRpbWUgdG8gYXNrIHdoeSBkbyB5b3UgdGhpbmsgWGVu
IG93bnMgdGhlIGJyaWRnZT8NCj4+Pg0KPj4+IEJlY2F1c2Ugbm90aGluZyBpbiB0aGlzIHNlcmll
cyBpbmRpY2F0ZXMgZWl0aGVyIHdheS4gU28gSSBhc3N1bWVkIHRoaXMgc2hvdWxkIGJlIG93bmVk
IGJ5IFhlbiBiZWNhdXNlIGl0IHdpbGwgZHJpdmUgaXQuDQo+Pj4NCj4+PiDCoEZyb20gd2hhdCB5
b3Ugd3JvdGUgYmVsb3csIGl0IHNvdW5kcyBsaWtlIHRoaXMgaXMgbm90IHRoZSBjYXNlLiBJIHRo
aW5rIHlvdSB3YW50IHRvIGhhdmUgYSBkZXNpZ24gZG9jdW1lbnQgc2VudCBhbG9uZyB0aGUgc2Vy
aWVzIHNvIHdlIGNhbiBlYXNpbHkga25vdyB3aGF0J3MgdGhlIGV4cGVjdGVkIGRlc2lnbiBhbmQg
dmFsaWRhdGUgdGhhdCB0aGUgY29kZSBtYXRjaCB0aGUgYWdyZWVtZW50Lg0KPj4+DQo+Pj4gVGhl
cmUgd2FzIGFscmVhZHkgYSBkZXNpZ24gZG9jdW1lbnQgc2VudCBhIGZldyBtb250aHMgYWdvLiBT
byB5b3UgbWF5IHdhbnQgdG8gcmVmcmVzaCBpdCAoaWYgbmVlZGVkKSBhbmQgc2VuZCBpdCBhZ2Fp
biB3aXRoIHRoaXMgc2VyaWVzLg0KPj4+DQo+PiBQbGVhc2Ugc2VlIFsxXSB3aGljaCBpcyB0aGUg
ZGVzaWduIGRvY3VtZW50IHdlIHVzZSB0byBpbXBsZW1lbnQgUENJIHBhc3N0aHJvdWdoIG9uIEFy
bS4NCj4NCj4gVGhhbmsuIENhbiB5b3UgbWFrZSBzdXJlIHRvIGluY2x1ZGUgYXQgbGVhc3QgaW4g
YSBsaW5rIGluIHlvdXIgY292ZXIgbGV0dGVyIG5leHQgdGltZT8NCkkgd2lsbCB1cGRhdGUgdGhl
IGNvbW1pdCBtZXNzYWdlIHRvIGhhdmUgbW9yZSBkZXNjcmlwdGlvbiBvbiB0aGUgZGVzaWduIGFz
cGVjdHMNCj4NCj4+DQo+PiBGb3IgeW91ciBjb252ZW5pZW5jZToNCj4+DQo+PiAiDQo+Pg0KPj4g
IyBQcm9ibGVtIHN0YXRlbWVudDoNCj4+IFtzbmlwXQ0KPj4NCj4+IE9ubHkgRG9tMCBhbmQgWGVu
IHdpbGwgaGF2ZSBhY2Nlc3MgdG8gdGhlIHJlYWwgUENJIGJ1cyzigIsgZ3Vlc3Qgd2lsbCBoYXZl
IGENCj4+IGRpcmVjdCBhY2Nlc3MgdG8gdGhlIGFzc2lnbmVkIGRldmljZSBpdHNlbGbigIsuIElP
TUVNIG1lbW9yeSB3aWxsIGJlIG1hcHBlZCB0bw0KPj4gdGhlIGd1ZXN0IOKAi2FuZCBpbnRlcnJ1
cHQgd2lsbCBiZSByZWRpcmVjdGVkIHRvIHRoZSBndWVzdC4gU01NVSBoYXMgdG8gYmUNCj4+IGNv
bmZpZ3VyZWQgY29ycmVjdGx5IHRvIGhhdmUgRE1BIHRyYW5zYWN0aW9uLiINCj4+DQo+PiAiDQo+
Pg0KPj4gIyBEaXNjb3ZlcmluZyBQQ0kgSG9zdCBCcmlkZ2UgaW4gWEVOOg0KPj4NCj4+IEluIG9y
ZGVyIHRvIHN1cHBvcnQgdGhlIFBDSSBwYXNzdGhyb3VnaCBYRU4gc2hvdWxkIGJlIGF3YXJlIG9m
IGFsbCB0aGUgUENJIGhvc3QNCj4+IGJyaWRnZXMgYXZhaWxhYmxlIG9uIHRoZSBzeXN0ZW0gYW5k
IHNob3VsZCBiZSBhYmxlIHRvIGFjY2VzcyB0aGUgUENJDQo+PiBjb25maWd1cmF0aW9uIHNwYWNl
LiBFQ0FNIGNvbmZpZ3VyYXRpb24gYWNjZXNzIGlzIHN1cHBvcnRlZCBhcyBvZiBub3cuIFhFTg0K
Pj4gZHVyaW5nIGJvb3Qgd2lsbCByZWFkIHRoZSBQQ0kgZGV2aWNlIHRyZWUgbm9kZSDigJxyZWfi
gJ0gcHJvcGVydHkgYW5kIHdpbGwgbWFwIHRoZQ0KPj4gRUNBTSBzcGFjZSB0byB0aGUgWEVOIG1l
bW9yeSB1c2luZyB0aGUg4oCcaW9yZW1hcF9ub2NhY2hlICgp4oCdIGZ1bmN0aW9uLg0KPj4NCj4+
IFtzbmlwXQ0KPj4NCj4+IFdoZW4gRG9tMCB0cmllcyB0byBhY2Nlc3MgdGhlIFBDSSBjb25maWcg
c3BhY2Ugb2YgdGhlIGRldmljZSwgWEVOIHdpbGwgZmluZCB0aGUNCj4+IGNvcnJlc3BvbmRpbmcg
aG9zdCBicmlkZ2UgYmFzZWQgb24gc2VnbWVudCBudW1iZXIgYW5kIGFjY2VzcyB0aGUgY29ycmVz
cG9uZGluZw0KPj4gY29uZmlnIHNwYWNlIGFzc2lnbmVkIHRvIHRoYXQgYnJpZGdlLg0KPj4NCj4+
IExpbWl0YXRpb246DQo+PiAqIE9ubHkgUENJIEVDQU0gY29uZmlndXJhdGlvbiBzcGFjZSBhY2Nl
c3MgaXMgc3VwcG9ydGVkLg0KPj4gKiBEZXZpY2UgdHJlZSBiaW5kaW5nIGlzIHN1cHBvcnRlZCBh
cyBvZiBub3csIEFDUEkgaXMgbm90IHN1cHBvcnRlZC4NCj4+ICogTmVlZCB0byBwb3J0IHRoZSBQ
Q0kgaG9zdCBicmlkZ2UgYWNjZXNzIGNvZGUgdG8gWEVOIHRvIGFjY2VzcyB0aGUNCj4+IGNvbmZp
Z3VyYXRpb24gc3BhY2UgKGdlbmVyaWMgb25lIHdvcmtzIGJ1dCBsb3RzIG9mIHBsYXRmb3JtcyB3
aWxsIHJlcXVpcmVkDQo+PiBzb21lIHNwZWNpZmljIGNvZGUgb3IgcXVpcmtzKS4NCj4+DQo+PiAi
DQo+Pg0KPj4gVW5mb3J0dW5hdGVseSB0aGUgZG9jdW1lbnQgaGFkIG5vdCBiZWVuIHVwZGF0ZWQg
c2luY2UgdGhlbiwgYnV0IHRoZSBxdWVzdGlvbg0KPj4NCj4+IGJlaW5nIGRpc2N1c3NlZCBoYXMg
bm90IGNoYW5nZWQgaW4gdGhlIGRlc2lnbjogRG9tYWluLTAgaGFzIGZ1bGwgYWNjZXNzIHRvIHRo
ZSBicmlkZ2UsDQo+Pg0KPj4gWGVuIHRyYXBzIEVDQU0uIChJIGFtIHRha2luZyBkb20wbGVzcyBh
c2lkZSBhcyB0aGF0IHdhcyBub3QgdGhlIHRhcmdldCBmb3IgdGhlIGZpcnN0IHBoYXNlKQ0KPg0K
PiBIYXZpbmcgYW4gdXBkYXRlIGRlc2lnbiBkb2N1bWVudCBpcyBxdWl0ZSBpbXBvcnRhbnQuIFRo
aXMgd2lsbCBhbGxvdyByZXZpZXdlciB0byBjb21tZW50IGVhc2lseSBvbiBvdmVyYWxsIGFwcHJv
YWNoIGFuZCBzcGVlZCB1cCB0aGUgcmV2aWV3IGFzIHdlIGNhbiBtYXRjaCB0byB0aGUgYWdyZWVk
IGFwcHJvYWNoLg0KPg0KPiBTbyBjYW4gdGhpcyBwbGVhc2UgYmUgdXBkYXRlZCBhbmQgc2VudCBh
bG9uZyB0aGUgd29yaz8NCj4NCj4gSW4gYWRkaXRpb24gdG8gdGhhdCwgaXQgZmVlbHMgdG8gbWUg
dGhhdCB0aGUgY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIGNvbnRhaW4gYSBzdW1tYXJ5IG9mIHdoYXQg
eW91IGp1c3QgcGFzdGVkIGFzIHRoaXMgaGVscHMgdW5kZXJzdGFuZGluZyB0aGUgZ29hbCBhbmQg
YXBwcm9hY2ggb2YgdGhpcyBwYXRjaC4NCj4NCklmIHdlIGFyZSBvbiB0aGUgc2FtZSBwYWdlIG5v
dyB3aWxsIHlvdSBiZSBhYmxlIHRvIHJldmlldyB0aGUgcGF0Y2gNCg0Kd2l0aCByZXNwZWN0IHRv
IHRoZSBkZXNpZ24gZnJvbSBSRkM/DQoNCj4gQ2hlZXJzLA0KPg0KVGhhbmsgeW91LA0KDQpPbGVr
c2FuZHINCg==

