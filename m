Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A92348CD9
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 10:29:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101348.193780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPMIF-0000k9-PI; Thu, 25 Mar 2021 09:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101348.193780; Thu, 25 Mar 2021 09:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPMIF-0000jj-ME; Thu, 25 Mar 2021 09:28:43 +0000
Received: by outflank-mailman (input) for mailman id 101348;
 Thu, 25 Mar 2021 09:28:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Cl2=IX=epam.com=prvs=3718c8f974=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1lPMID-0000je-EW
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 09:28:41 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f3bd140-c810-4168-ab2d-83fd8b1c7e1f;
 Thu, 25 Mar 2021 09:28:40 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12P9NQEx018346; Thu, 25 Mar 2021 09:28:35 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2055.outbound.protection.outlook.com [104.47.0.55])
 by mx0b-0039f301.pphosted.com with ESMTP id 37gquh00e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 09:28:35 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6242.eurprd03.prod.outlook.com (2603:10a6:20b:15c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Thu, 25 Mar
 2021 09:28:30 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::3541:4069:60ca:de3d]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::3541:4069:60ca:de3d%7]) with mapi id 15.20.3977.025; Thu, 25 Mar 2021
 09:28:30 +0000
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
X-Inumbo-ID: 3f3bd140-c810-4168-ab2d-83fd8b1c7e1f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaRcxmFgj/cXrRnW8/NXrsWF+Zv5JBwy/LwCT4HMwdDsuHVmI7/E+oYpQVTnfwzRuVgpLuxwzZZc0B5vCQtLozXN38/AVvqcmBGbd7ezFcTo7zCLI085D3zS4FKTbUrytN023L1zSTrg/r14a05EtwGxEEXF+7mUbLeeBOdFA5rwFSCTPqCjWQFokc7EPN591pUbcwVDGOMrHrHqI8syBTsoR8asR0dK9lHgbHHzRWXmmjnz+Kq3Lqbu/5nPwfXQOPPnx0ah+Raa96M9KF2QeHxvKZU5hKf7CUeL79OjECOu6eiZKNqNPPyZk7XvOVqCDoDG+Fia665Us3lsaiUfNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYoz0eaZeMRr/a30xcAnxfAG7E9hg9U1TCQQ+Vp8ZLs=;
 b=TCvgBRD21o1awWFfbRbcR34YRiOf451OQe04B5rlRKwUUvFutka6IHBXqIHXayuFCUqGR6LWjQk0k/d7tBnRLivFm4jiRr+ePeZ3Gyczve5BkbES4ZSp2FlTQFWZXP82nw6L2xWt6ph65zdGZnV1Hj/fRF3UNR8T1RvgjPN1Pz7b3VGF0ZwVvudPWqizCurZvMYE7AnJU/jDTXHO0SULAIZtAJL4tE7if3Ip5390WqED4GifjWD2oxTI7BiDU1sZF3KoO6Ehx+bpqma6YFtsbN4SJHMbKbYHgHwCQ98VudLL2P+re+AZeM8VjF+Xwve7o3rwhPzsxYVHXa2I6voy3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYoz0eaZeMRr/a30xcAnxfAG7E9hg9U1TCQQ+Vp8ZLs=;
 b=IbBwQ578eIEfvNcFNsG14wrg+NQrXh4lcGKmjuhGJNHKzyA+Bybe76Qo+BotO6R07FBKMO/s9pTuaV329lQPknf3Os0/J3S50/GgcOzcrf/p2FOGRj7pA57KEM2z5kTC+9uutt5EJ2v8O4YhnMU67Na7XuZr4DD6tnNUcKYx57ztXzO8ZRG2k6gpSDFl3RLqDJORdyducO/wSDKTS7hZdzKZuPLfJV/14maPM2AuAaesgh0LMf6w0ijaQG7EH7G6Lx4502qM4KRcHA9J/m13DyqB5rYes/AcHeiWaUvh4b//DDABL+G0+wGuobniG0JIRQNjQXyhXRzy8BlaeLVTxA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
CC: Wan Jiabing <wanjiabing@vivo.com>, David Airlie <airlied@linux.ie>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kael_w@yeah.net" <kael_w@yeah.net>
Subject: Re: [PATCH] drivers: gpu: drm: xen_drm_front_drm_info is declared
 twice
Thread-Topic: [PATCH] drivers: gpu: drm: xen_drm_front_drm_info is declared
 twice
Thread-Index: AQHXIT8BvTrvCJoLoEahz8MTVepQQaqURIKAgAAoGoCAAANUgA==
Date: Thu, 25 Mar 2021 09:28:29 +0000
Message-ID: <4f1747c4-6578-4962-f51d-6d3827d0034d@epam.com>
References: <20210325061901.851273-1-wanjiabing@vivo.com>
 <e45d6b24-5e74-17f6-eb18-c6e51fed923a@epam.com>
 <CAKMK7uEpNexmDYar36ZEX0hbHoxH3Y+_D42NqjRwAqxpiCXHRA@mail.gmail.com>
In-Reply-To: 
 <CAKMK7uEpNexmDYar36ZEX0hbHoxH3Y+_D42NqjRwAqxpiCXHRA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2863edb-7a33-45ec-e46a-08d8ef705a31
x-ms-traffictypediagnostic: AM0PR03MB6242:
x-microsoft-antispam-prvs: 
 <AM0PR03MB6242E1236847121F3466646CE7629@AM0PR03MB6242.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MRU+qsgURxdNHl1ibgUaqwdbS1DLJ6axIEaqTlgpBt7Q7fNRUUfitz4MIlLXLd7UL9Iu4+UIitrbV6Y+LVbRzAvMFvv0ekplVxeunDnMQst6MJYZXh347UBwmVQbnWpR6epsEQpEmjZ5rkz9NjoZn+UpGGu5VhjHdEaEUjS1Rxngfzi0aprklW2eCzs0LQyL408icMni9WukImqm6KMJgmsbXnQvlGGJXoW3GZ0Yl6ROnkhhiALskkMyviPNWI6i8u59fJF9B9arHT+ewA5Pv5hSX5S8CfZtZU//iV1A2zrWsw/zps5P3Fvn+KdJzVR7Xf9pKoiVQ/OqsdVn5VBTNsDe38CiPS+TRfDP/p6Ouzq+bIK1caHC8qo07aBdqFOvSu46WiLwCDx7pvoWSrUFELegtpW3eJK8YGjtkSbL4a9WI0xv5NxK710obgw0dUW5P1E+Kn1U7uqvhym5EBlVEK8q11WmlGz5cs9lnHKMxgOA34Pj8tPGA7MddMg89l1GgWyLyFLORW5NFH08FzDhcBjQchi1wZIf80CkrrTPTFkaGDSykWoFlqxvyVeYgAtrfmyPdp0ZwqsqZAVaWkcS4uouvL5Zfn91uKq5PBsnCbIy5kRkamjXYZ82uYIhB73Q8cEb2v2y1rSM5arjDDBoT02FHS94tNgq8EZ6F4fY9tic3c4eQxgLLJh8XHyyWMdC+Adst6+72CNEDI4aTLXu7wmrLnyZXiMG78n9ObPXURo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(2616005)(6486002)(966005)(8676002)(316002)(6506007)(8936002)(4326008)(31686004)(36756003)(71200400001)(478600001)(53546011)(38100700001)(64756008)(83380400001)(66476007)(66446008)(66556008)(31696002)(76116006)(66946007)(5660300002)(6512007)(26005)(7416002)(110136005)(186003)(86362001)(2906002)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?YXJWb2JsanFHMUMyelJ6OWJaVm5UTy90VUpVU0Q4N0hJb1JBL0tDeTBYZW5Y?=
 =?utf-8?B?NDl2VW1iMG9xMEdzV0JKRUszWG1jSjc4ck0yTmdRVlhJY2w4N2svMjJMeDRy?=
 =?utf-8?B?R2V0QjR4QXB0b00ybUFTczZURWpGRG5aOEtMb09YY0xoSzVhN2Vpd0JiU3hr?=
 =?utf-8?B?a3hEQWRwbzl2ZGltaS9MSGhvWFNsei9YMFNoME0yVnFxYWF3K2hkTU5saGx1?=
 =?utf-8?B?bDBycUlmSDdYQVBpUDd6dU14MWlacjdQcmplWGQyd3pOSHlXU251QVMyTnF0?=
 =?utf-8?B?T09Ha0FwUmpXTkd6Vmlmb0QvNDQwcU80anBIVkRrNDdodU1CUUQ1RTcrOFJ3?=
 =?utf-8?B?SVVVUUwyNlExYW50ak9QZFRFa0Y5OUYxR2o5azJVbmRGYnp5b0s2TkZUNkFI?=
 =?utf-8?B?a1o2ZWNxWDVNcjJIcGxEU2ZHdWUrc0UxbHBIeEtoUXJpQlhib2hwRWwyWXZS?=
 =?utf-8?B?d0VGdnNhWWhHb3NIVHk3Y2d1MEt2NkZlYVNGVXV1dXlDN2NxVUc1dCtXTExB?=
 =?utf-8?B?OExPMHl0eGkrSE5NWENWMWVUdnJuUVk0aGVFL0hoa0d0cHhtOGJzalEvK2xw?=
 =?utf-8?B?ZEovSSs2STdjNmgvV3FSeVVIazhSVWdHWVN3UDlwaTdFVHdjTFJ0R0h5aGxE?=
 =?utf-8?B?a2VFSFRPaFI2OFBnV21pL3hCV1hDRW80emtFc2JuNHhLc2pJNG9MZUdJMjFX?=
 =?utf-8?B?blppOUJqWkJUQml5Zk0yeVo3THh6VTlIck1sZWVMWWZGUVdDZXhmZmtjcTVo?=
 =?utf-8?B?d0pZbVEzeFYvbFVHcmxqbUY4UzJSVkQrcDhlTktqOHAvUWNWQzZUWTZDV09U?=
 =?utf-8?B?dm5FVFlCdmdLaENQcjhsNDYvM3Jwb0JQcjk2eHpFRWZQV1pHUVY2NlNscXVX?=
 =?utf-8?B?Z0pkc3BRQXBZU1UvRlFWQ3BsbFlPWnhHRStlOWJxMFhpUTBYZnkzYzBVWDdu?=
 =?utf-8?B?WHVxTDU4THNjYVZIWEtVcUhiZStiWHN2bW94YUpGclBPcUh3bVRMVWphdkl3?=
 =?utf-8?B?WWR6aG5yZE1ZekRRbGZOSUpJajlrV2MxUUtwUFVXREtNK1FmZXdDNUJ4czdJ?=
 =?utf-8?B?Wk9BN0o5VzRLa1NlOFJOVFRhN0V4TVpub2ZrZnVraWhLRCtqc20wdnBHbndW?=
 =?utf-8?B?bnQ0a3ZFRlhsSEJncHEwZlExOFBuRk9jSDFoTi9XUlRwWHplMUEvS3RFTWtT?=
 =?utf-8?B?aXpPSXVvQ0tkSXFnb1V5Y0p4ZmptQkVvZE1xRld5VW9FWkxadDBnL0kxQmtY?=
 =?utf-8?B?b3NlN2NzVEFIS0hjQ1R4eU5OVTZUNEY4MS96bjlYQzRWQVZCdm1KTy9yeUQ2?=
 =?utf-8?B?L2JNWGp6elBpSitoRDZzZkpaZkJkUHpNTzNYWVd3b1c1dWtjNWErc0VKRGlr?=
 =?utf-8?B?MFhtekZNb2ZFWGlpV2lObjJNa2szL1ZCY2l0RnlOd2w1U0c3WUwwTy9YMWx6?=
 =?utf-8?B?eDFjNHMrUDlPSXpwQjB1SFpOSU1CQzFYL1NBWmg4Y0JvVmkrVGZsNUdrR1lt?=
 =?utf-8?B?amd4c2hFc29uQ1F5TituUEZ0L2NjYXM2cHNtWVY3RjUzTzVUZzRXRzhWdWR6?=
 =?utf-8?B?MHVYMTdCYW1TZDhFTDZaWEtHR2syUHNOTkhyQ2tJanFNSmNzY0xZT1kwd2p2?=
 =?utf-8?B?WjFROFRzOUNDY1dlaXhZelA2cCtya01jUnVHMlQrUTZyNEw5VmZJUzlxMXdt?=
 =?utf-8?B?dFhBSmx5di9xbmVtVndaaGFTa1E3T05FNG56bXMrZzR6Q1BsUmdNY3hhM1BP?=
 =?utf-8?Q?1Mht6ITVpj5kPEjWZYUvkUANjhE/NtsAUeUunhr?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FDE5AD638AED24DB25128A5783265F1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2863edb-7a33-45ec-e46a-08d8ef705a31
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 09:28:30.0305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tCK8YxA7kzzlFmCmaMkm/kubi0FqItAPaE7cy+NzP4Id8thpLKXYIBRm+xHvRQgbowxGQrAJ3e6ebAsUeOwLbL+skdAvJRStxyo5YQyUKCh2ek335yrNkK2UfVL0+Yoh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6242
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 clxscore=1011 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=986 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250071

SGksIERhbmllbCENCg0KT24gMy8yNS8yMSAxMToxNiBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToN
Cj4gT24gVGh1LCBNYXIgMjUsIDIwMjEgYXQgNzo1MyBBTSBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
bw0KPiA8T2xla3NhbmRyX0FuZHJ1c2hjaGVua29AZXBhbS5jb20+IHdyb3RlOg0KPj4gSGksDQo+
Pg0KPj4gT24gMy8yNS8yMSA4OjE5IEFNLCBXYW4gSmlhYmluZyB3cm90ZToNCj4+PiBzdHJ1Y3Qg
eGVuX2RybV9mcm9udF9kcm1faW5mbyBoYXMgYmVlbiBkZWNsYXJlZC4NCj4+PiBSZW1vdmUgdGhl
IGR1cGxpY2F0ZS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFdhbiBKaWFiaW5nIDx3YW5qaWFi
aW5nQHZpdm8uY29tPg0KPj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2gsDQo+Pg0KPj4gUmV2aWV3
ZWQtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0Bl
cGFtLmNvbT4NCj4+DQo+PiBXaWxsIGFwcGx5IHRvIGRybS1taXNjLW5leHQtZml4ZXMNCj4gZHJt
LW1pc2MtbmV4dC1maXhlcyBpcyB0aGUgd3JvbmcgdHJlZSwgYnVnZml4ZXMgb3V0c2lkZSBvZiB0
aGUgbWVyZ2UNCj4gd2luZG93IGJlbG9uZyBpbnRvIGRybS1taXNjLWZpeGVzLiBQbGVhc2UgY29u
c3VsdA0KPg0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9kcm0ucGFnZXMu
ZnJlZWRlc2t0b3Aub3JnL21haW50YWluZXItdG9vbHMvY29tbWl0dGVyLWRybS1taXNjLmh0bWwq
d2hlcmUtZG8taS1hcHBseS1teS1wYXRjaF9fO0l3ISFHRl8yOWRiY1FJVUJQQSFuZktOWHJCLXlI
cWF4ZUg2bkMzbUV3MjhIRkZJMXA1ZmM1Q1pLRUZlb1FQV1hFaFpDcHZNcXZXOEV0RmZUcXRIUGlO
Z3BZNFMtZyQgW2RybVsuXXBhZ2VzWy5dZnJlZWRlc2t0b3BbLl1vcmddDQo+DQo+IFdlIG5lZWQg
dG8gaGFyZC1yZXNldCBkcm0tbWlzYy1uZXh0LWZpeGVzIGJhY2ssIHBsZWFzZSByZS1hcHBseSB0
aGUNCj4gcGF0Y2hlcyAoYm90aCBvZiB0aGVtKSB0byBkcm0tbWlzYy1maXhlcy4gQWxzbyBhZGRp
bmcgZHJtLW1pc2MNCj4gbWFpbnRhaW5lcnMuDQpTb3JyeSBmb3Igc2NyZXdpbmcgdGhpbmdzIHVw
LCB3aWxsIHJlLWFwcGx5IGJvdGggcGF0Y2hlcyB0byBkcm0tbWlzYy1maXhlcw0KPiAtRGFuaWVs
DQo+DQo+PiBUaGFuayB5b3UsDQo+Pg0KPj4gT2xla3NhbmRyDQo+Pg0KPj4+IC0tLQ0KPj4+ICAg
IGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9jb25uLmggfCAxIC0NCj4+PiAgICAx
IGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9jb25uLmggYi9kcml2ZXJzL2dwdS9kcm0veGVu
L3hlbl9kcm1fZnJvbnRfY29ubi5oDQo+Pj4gaW5kZXggM2FkYWNiYTlhMjNiLi5lNWY0MzE0ODk5
ZWUgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2Nv
bm4uaA0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9jb25uLmgN
Cj4+PiBAQCAtMTYsNyArMTYsNiBAQA0KPj4+ICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yOw0KPj4+
ICAgIHN0cnVjdCB4ZW5fZHJtX2Zyb250X2RybV9pbmZvOw0KPj4+DQo+Pj4gLXN0cnVjdCB4ZW5f
ZHJtX2Zyb250X2RybV9pbmZvOw0KPj4+DQo+Pj4gICAgaW50IHhlbl9kcm1fZnJvbnRfY29ubl9p
bml0KHN0cnVjdCB4ZW5fZHJtX2Zyb250X2RybV9pbmZvICpkcm1faW5mbywNCj4+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKTsNCj4N
Cj4=

