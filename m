Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB76418E96
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 07:14:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196322.349112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUixa-0004Ft-Ps; Mon, 27 Sep 2021 05:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196322.349112; Mon, 27 Sep 2021 05:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUixa-0004Cp-Mf; Mon, 27 Sep 2021 05:13:50 +0000
Received: by outflank-mailman (input) for mailman id 196322;
 Mon, 27 Sep 2021 05:13:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1Nw=OR=epam.com=prvs=9904516479=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mUixZ-0004Cj-Oa
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 05:13:49 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2416232-1f51-11ec-bc3d-12813bfff9fa;
 Mon, 27 Sep 2021 05:13:48 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18R3wS3B002968;
 Mon, 27 Sep 2021 05:13:47 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bat9013ep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 05:13:46 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5939.eurprd03.prod.outlook.com (2603:10a6:208:15e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 05:13:44 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 05:13:44 +0000
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
X-Inumbo-ID: b2416232-1f51-11ec-bc3d-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5EiGtdaFQRcAnwiMxVokVCXYW7jOac1pWmuQvhh9jrRWXRMtTRxm7UXOsLxxfyJ85S2KGEYN1+5AGF+s2kQxDaNfWEttAr2YHzU/WtR0nkssLkpoVOTxiVafmA3/p+yCdU/gbNsACQP94oUGaNXgOTuY+G0gnbxab4fzFoNO0uCquKDh8waxD+Pga2DK5Tyf3lh9zUUIPR8r1shgmHQe3evHiA5BVtODfj5qptgOUpkS3xviVVgeizNIxMz8u4c9ArxC9GFi0dzMJru+4doxCUaF7+NLxqOFB+w9HPNdve+WPVnHmIkxUXNamCMNI9ERYZ9bnCr86zr7U/ItGgZrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=0/znJzAAQQJ+c4hgRTIU8PEFLUy1MPlz0bgZAqDxVe4=;
 b=Yu2Xr+PiTjwk6skyW4OMk5pygP6ZBov+FiPsz5B3C0dxAXPJUoEBVtmxIUo+hwz2ZjnUHp6rmpHitifACL2mxB6bD+85lpT12/ynl+S4Z3p+jWoubsWGPwqwxvVVj5d8qf54eLulbx3nx7VonZ6cNP0oILRDN3BtGIVErhY+E2IuG5TN3Ukyx401yC2lBy42XEWMdUQ6ggMGT7GwcFwpfSEGfiTsi3Ewi5IPUxluAdWxkPq0GlC7puPNpLNnb8+Y4IrIDEro+tDVXKBhs9bjfQHztqQY/Gi7A83JznYPzT7+x5KL9fT5XsdEYX2FGR3AGfMRx+Z70ZDCibyWfZBBXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/znJzAAQQJ+c4hgRTIU8PEFLUy1MPlz0bgZAqDxVe4=;
 b=uQjvvzhNcSM0Vy+LEhCQBF9O3tl9gv9WqQslWXuk/ndQWhsRQMbQJqofWllDpogVae5MijTpdQSck0kXIhv6YhE3a758/VErQnoJ2/oAoxKFwN6L2FBFOPPWmq1yHNT4r4avkLrqbHL9f5F9vU0yLgcHVbZjgu+gtS7wvDfM9lCnXAAA5iOhnya2gC4HICANidNK6W8VltPIWwp27oRrKDH+OJrt/SdxtVC4eg/GuND+apeXZQb8tpZmVgHE3iGm8rlgcK/7AE1j8A0hTRFcBBC5xh54OiL5Zylx84t4n51n4YojE+JOsRE/FLYGdj43zbhlult/OUcxlt7joOqkQg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "jgross@suse.com" <jgross@suse.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "boris.ostrovsky@oracle.com"
	<boris.ostrovsky@oracle.com>,
        "julien@xen.org" <julien@xen.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        Anastasiia Lukianenko
	<Anastasiia_Lukianenko@epam.com>
Subject: Re: [PATCH v3 2/2] xen-pciback: allow compiling on other archs than
 x86
Thread-Topic: [PATCH v3 2/2] xen-pciback: allow compiling on other archs than
 x86
Thread-Index: AQHXsGDrkewW5NG+ZkqXauJ2P2aIyauyCpkAgACjoYCAAGJfAIAAjV+AgAO+J4A=
Date: Mon, 27 Sep 2021 05:13:43 +0000
Message-ID: <f0c88ffe-bcb2-be78-876c-4cd0dd550498@epam.com>
References: <20210923095345.185489-1-andr2000@gmail.com>
 <20210923095345.185489-2-andr2000@gmail.com>
 <alpine.DEB.2.21.2109231252270.17979@sstabellini-ThinkPad-T480s>
 <f62a1e2c-4253-c998-c206-6bb0681a84fb@epam.com>
 <7310d23e-4193-3f4c-06da-606b30e73f24@epam.com>
 <alpine.DEB.2.21.2109241258190.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109241258190.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6195a360-570d-4157-c45a-08d9817593db
x-ms-traffictypediagnostic: AM0PR03MB5939:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR03MB5939FAD0FAD9E41451E8EE9AE7A79@AM0PR03MB5939.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qE8N3wI+WTQqzaeBG2Ndg06vGNZ+zdOFU62Pl1KR7bLxI7zsf6LkkiifeNyhsQwVSv3VzCT25t/ReeZMNb03PGPBhdO7QZbelWGPwsYdO0S9eyJeYNWoT+Unw3XB3n4DnSNu7HuGhocmtcUlWKo8bapDqLVceS1dDWxMK9RgqPAJHQVXeJ8R/xjknlJiPcP7p1ym56AtaGKCBqt/zZRPxrwViwkV58HdgNY+YEWmcrRzUgEO7pQe0rt72MwyhtZd/m9O0u5FshnsHRvSi3aCbwokFF0SAQtvo8LbbhDABaFkUcWkN8Ln+G34DsMWEWoAtctHL9StasTGLlv3ynbElZCIdlB5IuZG3I9b69eSTf/Ep69BzJT9L/lxXSqn/glp4xka9CYrg8dWyWor9AZSzyg0gxJnGlZTD40BFj80ddl7bfOV4IS5Jna+WeO7bmvtZHhSSLAL1UfcwpUCGmnu/dOp/1o404OwRchSgdOiLY9+o7gOPLIX7zbBMYvxnKB3i/Rkv996z0tpDuVClfRwrqxvvr8wvQ87rpbUnsgDy1uHWcuhLAr1xZcPJb91YSu+6YWXPjhPNkRjDo60XU2fePjzw58rtxGMlBcszLaKU1C4DpLKWtIWW4yC/yu91PEaAu3+FRySwAT52/xSAFmpOPJ8WVuvR9Dl/y85I1cdWZ5677j78267VN5RDc1EyrBopU/C+3t+RQQxcyR+Mdxo7l8d9y/YOrIz/5RwbOlCv7rH+vYrl68Hr1XB7URu5JvT
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(6512007)(64756008)(66446008)(316002)(86362001)(76116006)(36756003)(91956017)(6486002)(66946007)(31696002)(6506007)(107886003)(83380400001)(66556008)(122000001)(66476007)(8676002)(4326008)(38070700005)(8936002)(38100700002)(31686004)(71200400001)(186003)(26005)(55236004)(53546011)(6916009)(2616005)(508600001)(2906002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dEFxVmJEUXVud0dNZGdmaG45cW9xV0ZxdnowQ09BQTc5bytqNHVlMHpjenMz?=
 =?utf-8?B?VEVDWFVhSk9RWGVqKzNSV0dVL1JLRXBYV1hiQ1pqRWNpRHBZZXY4eThPa1BH?=
 =?utf-8?B?VVEvK1lrZDdndjBJZVZvKzJVMFowWXhMZWFTTjVjSkpZTDdkQnFndFgxNXRh?=
 =?utf-8?B?cGhqc3MzYlhaUW1ic2N6ZHVqYk04VEpRL20vNUc0ZkZaUWNCMXNncStLWWJ1?=
 =?utf-8?B?V280L3ExTVAxUTRxWitRSUdkVmovdkdoVzlIMTlLeWpsdWNKMStocHcxWmRz?=
 =?utf-8?B?OUpCZlhEVDVydXhzbWovSzRXWHduWVIrbG03WnJ1d3hwMlh1aGZlMC9nQ0gr?=
 =?utf-8?B?Y3dDSmNDV0dOU01SOWxNRmIrUmF6UUVXdTJjeHdUeFJFbDhRT1ZWUkVlV1Vs?=
 =?utf-8?B?MlVBLzE4UnNpQWxZbWVHcyt6WEFpdi9oeWlITEJMRWRndGU0dENpd29GRjZL?=
 =?utf-8?B?a2pFUlpUR3puZkFrdkJvZWdhLzRBYmFXUzQ3T1l5QnZrWjhkdUxTR3JHUTlF?=
 =?utf-8?B?VXlVd0FnN2tEUGhpSXB1dVprdUs1enEyOHAwZ2sycGI5UnRhazZ6VUdGTUla?=
 =?utf-8?B?SUZVci9WZkRRbkJ5QzU3Z1FHQVFnWUVLSCs2OXk1dWtucCtwMjJWL0NyQ2R5?=
 =?utf-8?B?YUliTy9mUTZBMmhVVU9BVHlGZGJ6NDQ0bjdjckliangwTzlpN2Zzb05Bd1hJ?=
 =?utf-8?B?WXNvcitkanpnZDUvMC9NeU5BZEpvditzNTZoRjEySEkxNDNueEkweW5BNUJG?=
 =?utf-8?B?eThBZzQ5VWQ4UU1SM0ZUZ2g5L2M3cUQxWlRRMTFYZ29kN3BZQ0FodUZ5VHpq?=
 =?utf-8?B?N01wZnpMcGQ1bERheW9CRlpLL3VsQWEvMEY2WUdSRXJWYUxNMEhkM1p2dW9n?=
 =?utf-8?B?QUpQdnh3d2N1MVRtZG5Oa3pOODhOZDBBcm5OUmtnNktON1hTTWFzLzJPR0Rw?=
 =?utf-8?B?MldnbjU0VW8wOE9UN201d0lXelp3TGlSMEFsaDQ0TTd5QU11UnRxeTBLdUpX?=
 =?utf-8?B?VHVsVDBZV045S2RIVFZhUU12elkrc2Q0Ukk2YmU1WnJTUjBKZGZHU3Q0S29s?=
 =?utf-8?B?T29JdHNlUmpKbGVSc3RpQnNJZ0NCaHBMRkFJOVUzWS9JQU5oa3ZQUHBDVUtP?=
 =?utf-8?B?blBBWjRuK2c2QnJTajQ2Q3ZSMGJWaGNFWUxzakJVREcxZXpNdU9FR255ZG1w?=
 =?utf-8?B?LzczbGpTZmJ6c2lNR0E0NjlOR2xVMk1GTzZKL3l0OUM2b1BhZjljcTdnQ2ht?=
 =?utf-8?B?OGgvQXVRWmlLZ01JVXNDd0pUb0Q0bE5vWVJySHZLK2pNU1RoSlBhUFM0d1Ev?=
 =?utf-8?B?b3g2UjQ2R05JMm5iRXFaakxzVUk5VVM1WlprK2lkV3BCREM4ZDdBYVN5OGlM?=
 =?utf-8?B?N2dhSkN5UG9vcU9QSldwbFRrcWlncmtENGRYYWFvUjlxcGNnQS81aG9MNWll?=
 =?utf-8?B?dytOMERJb2VKYi82MzVzb3IvQ08yZ1FEcE1oaEdvZWgxUjBlVGFteEx5cjlq?=
 =?utf-8?B?TVNLRnRuZ0FwUW9oY0hSYmZSeUlORXNPZzFBcElrU2tNbnNvblQzUi8yb3d1?=
 =?utf-8?B?aXo1aFozNzN4SW9tcEF6ODhXVU1BTldQNWMzOE83Rm12aExhMERtMjNBR3FE?=
 =?utf-8?B?ZHg0cjJyakN0WU9ZN3hkYkt5cG1hS2hPalVyY0dRZUhrVlZWMXVsWTV3OU9h?=
 =?utf-8?B?WjU5S2xlM2xNNEFzeW5XQzJoZVB1eStHWHlzNmxBdFoyWENOODZveW1ZRTdm?=
 =?utf-8?B?NjBmQXlXcjZPdVBnMDdrRSt0dUhtMDE5dmNVaGw0RnkwdDJ2Y0RkUDgvL09I?=
 =?utf-8?B?UXQxem55TzVsaG9Fb0Fhdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <604D9059A0AF1B4AB0418BE6B8D5C0A3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6195a360-570d-4157-c45a-08d9817593db
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 05:13:43.9892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LsQrzfuHTsJw13emF8YbKq2lEWYTRfMYcAWMUKAUpwqgz0v469/BaOZjvGgOzIgMjB4cIEz2ASS0SihlRFe2WYHSXKHqy26IrEFDCzzUN0taa/9qddq9IikPwIHe6hj9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5939
X-Proofpoint-GUID: C9ZA00CNSrL44cOe5qJIUZjOehJhk5jk
X-Proofpoint-ORIG-GUID: C9ZA00CNSrL44cOe5qJIUZjOehJhk5jk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_01,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109270034

DQpPbiAyNC4wOS4yMSAyMzowNCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiBPbiBGcmks
IDI0IFNlcCAyMDIxLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IE9uIDI0LjA5
LjIxIDA4OjQ2LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+PiBPbiAyMy4wOS4y
MSAyMzowMCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+PiBPbiBUaHUsIDIzIFNlcCAy
MDIxLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+IEZyb206IE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4+
DQo+Pj4+PiBYZW4tcGNpYmFjayBkcml2ZXIgd2FzIGRlc2lnbmVkIHRvIGJlIGJ1aWx0IGZvciB4
ODYgb25seS4gQnV0IGl0DQo+Pj4+PiBjYW4gYWxzbyBiZSB1c2VkIGJ5IG90aGVyIGFyY2hpdGVj
dHVyZXMsIGUuZy4gQXJtLg0KPj4+Pj4gUmUtc3RydWN0dXJlIHRoZSBkcml2ZXIgaW4gYSB3YXkg
dGhhdCBpdCBjYW4gYmUgYnVpbHQgZm9yIG90aGVyDQo+Pj4+PiBwbGF0Zm9ybXMgYXMgd2VsbC4N
Cj4+Pj4+DQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmFz
dGFzaWlhIEx1a2lhbmVua28gPGFuYXN0YXNpaWFfbHVraWFuZW5rb0BlcGFtLmNvbT4NCj4+Pj4g
VGhlIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuIE9ubHkgb25lIHRoaW5nOiBvbiBBUk0zMiBJIGdl
dDoNCj4+PiBXRSBkbyBub3QgeWV0IHN1cHBvcnQgWGVuIFBDSSBwYXNzdGhyb3VnaCBmb3IgQVJN
MzINCj4gS2VlcCBpbiBtaW5kIHRoYXQgaXQgaXMgcG9zc2libGUgdG8gcnVuIEFSTTMyIGd1ZXN0
cyBvbiBhbiBBUk02NA0KPiBoeXBlcnZpc29yLg0KPg0KPg0KPj4+PiBkcml2ZXJzL3hlbi94ZW4t
cGNpYmFjay9jb25mX3NwYWNlX2hlYWRlci5jOiBJbiBmdW5jdGlvbiDigJhiYXJfaW5pdOKAmToN
Cj4+Pj4gZHJpdmVycy94ZW4veGVuLXBjaWJhY2svY29uZl9zcGFjZV9oZWFkZXIuYzoyMzk6MzQ6
IHdhcm5pbmc6IHJpZ2h0IHNoaWZ0IGNvdW50ID49IHdpZHRoIG9mIHR5cGUgWy1Xc2hpZnQtY291
bnQtb3ZlcmZsb3ddDQo+Pj4+ICAgICAgICBiYXItPnZhbCA9IHJlc1twb3MgLSAxXS5zdGFydCA+
PiAzMjsNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+DQo+Pj4+
IGRyaXZlcnMveGVuL3hlbi1wY2liYWNrL2NvbmZfc3BhY2VfaGVhZGVyLmM6MjQwOjQ5OiB3YXJu
aW5nOiByaWdodCBzaGlmdCBjb3VudCA+PSB3aWR0aCBvZiB0eXBlIFstV3NoaWZ0LWNvdW50LW92
ZXJmbG93XQ0KPj4+PiAgICAgICAgYmFyLT5sZW5fdmFsID0gLXJlc291cmNlX3NpemUoJnJlc1tw
b3MgLSAxXSkgPj4gMzI7DQo+Pj4+ICAgICANCj4+Pj4gICAgIA0KPj4+PiByZXNvdXJjZV9zaXpl
X3QgaXMgZGVmaW5lZCBhcyBwaHlzX2FkZHJfdCBhbmQgaXQgY2FuIGJlIDMyYml0IG9uIGFybTMy
Lg0KPj4+Pg0KPj4+Pg0KPj4+PiBPbmUgZml4IGlzIHRvIHN1cnJvdW5kOg0KPj4+Pg0KPj4+PiAJ
CWlmIChwb3MgJiYgKHJlc1twb3MgLSAxXS5mbGFncyAmIElPUkVTT1VSQ0VfTUVNXzY0KSkgew0K
Pj4+PiAJCQliYXItPnZhbCA9IHJlc1twb3MgLSAxXS5zdGFydCA+PiAzMjsNCj4+Pj4gCQkJYmFy
LT5sZW5fdmFsID0gLXJlc291cmNlX3NpemUoJnJlc1twb3MgLSAxXSkgPj4gMzI7DQo+Pj4+IAkJ
CXJldHVybiBiYXI7DQo+Pj4+IAkJfQ0KPj4+Pg0KPj4+PiB3aXRoICNpZmRlZiBQSFlTX0FERFJf
VF82NEJJVA0KPj4+Pg0KPj4+IFRoaXMgbWlnaHQgbm90IGJlIGNvcnJlY3QuIFdlIGFyZSBkZWFs
aW5nIGhlcmUgd2l0aCBhIDY0LWJpdCBCQVIgb24gYSAzMi1iaXQgT1MuDQo+Pj4NCj4+PiBJIHRo
aW5rIHRoYXQgdGhpcyBjYW4gc3RpbGwgYmUgdmFsaWQgdXNlLWNhc2UgaWYgQkFSNjQuaGkgPT0g
MC4gU28sIG5vdCBzdXJlDQo+Pj4NCj4+PiB3ZSBjYW4ganVzdCBza2lwIGl0IHdpdGggaWZkZWYu
DQo+Pj4NCj4+PiBJbnN0ZWFkLCB0byBiZSBvbiB0aGUgc2FmZSBzaWRlLCB3ZSBjYW4gaGF2ZToN
Cj4+Pg0KPj4+IGNvbmZpZyBYRU5fUENJREVWX1NUVUINCj4+PiAgICDCoMKgwqDCoMKgwqAgdHJp
c3RhdGUgIlhlbiBQQ0ktZGV2aWNlIHN0dWIgZHJpdmVyIg0KPj4+ICAgIMKgwqDCoMKgwqDCoCBk
ZXBlbmRzIG9uIFBDSSAmJiBBUk02NCAmJiBYRU4NCj4+PiBlLmcuIG9ubHkgYWxsb3cgYnVpbGRp
bmcgdGhlICJzdHViIiBmb3IgQVJNNjQgZm9yIG5vdy4NCj4gVGhpcyBpcyBhIHByZXR0eSBkcmFz
dGljIHNvbHV0aW9uLiBJIHdvdWxkIGJlIE9LIHdpdGggaXQgYnV0IEkgcHJlZmVyDQo+IHRoZSBz
b2x1dGlvbiBiZWxvdyA+PiAxNiA+PiAxNi4NCj4NCj4NCj4+IE9yLi4uIHRoZXJlIGFyZSBjb3Vw
bGUgb2YgcGxhY2VzIGluIHRoZSBrZXJuZWwgd2hlcmUgUENJIGRlYWxzIHdpdGggdGhlIDMyIGJp
dCBzaGlmdCBhczoNCj4+DQo+PiBkcml2ZXJzL3BjaS9zZXR1cC1yZXMuYzoxMDg6wqDCoMKgIMKg
wqDCoCBuZXcgPSByZWdpb24uc3RhcnQgPj4gMTYgPj4gMTY7DQo+PiBkcml2ZXJzL3BjaS9pb3Yu
Yzo5NDk6wqDCoMKgIMKgwqDCoCBuZXcgPSByZWdpb24uc3RhcnQgPj4gMTYgPj4gMTY7DQo+Pg0K
Pj4gY29tbWl0IGNmN2JlZTVhMGJmMjcwYTRlYWNlMGJlMzkzMjlkNmFjMDEzNmNjNDcNCj4+IERh
dGU6wqDCoCBTdW4gQXVnIDcgMTM6NDk6NTkgKjIwMDUqICswNDAwDQo+Pg0KPj4gW3NuaXBdDQo+
Pg0KPj4gICDCoMKgwqAgQWxzbyBtYWtlIHN1cmUgdG8gd3JpdGUgaGlnaCBiaXRzIC0gdXNlICJ4
ID4+IDE2ID4+IDE2IiAocmF0aGVyIHRoYW4gdGhlDQo+PiAgIMKgwqDCoCBzaW1wbGVyICI+PiAz
MiIpIHRvIGF2b2lkIHdhcm5pbmdzIG9uIDMyLWJpdCBhcmNoaXRlY3R1cmVzIHdoZXJlIHdlJ3Jl
DQo+PiAgIMKgwqDCoCBub3QgZ29pbmcgdG8gaGF2ZSBhbnkgaGlnaCBiaXRzLg0KPiBJIHRoaW5r
IHRoaXMgaXMgdGhlIGJlc3Qgb3B0aW9uDQoNCk9rLCBzbyBmb3IgYm90aCBwYXRjaGVzOg0KDQox
LiBJJ2xsIG1vdmUgQ09ORklHX1hFTl9QQ0lERVZfU1RVQiBpbnRvIHRoZSBzZWNvbmQgcGF0Y2gN
Cg0KMi4gSSdsbCB1c2UgPj4gMTYgPj4gMTYgdG8gZml4IDMyLWJpdCBhcmNoaXRlY3R1cmVzDQoN
Cg0KPg0KPg0KPj4gVGhpcyBtaWdodCBub3QgYmUoPykgaW1tZWRpYXRlbHkgY29ycmVjdCBpbiBj
YXNlIG9mIExQQUUgdGhvdWdoLCBlLmcuDQo+Pg0KPj4gNjQtYml0IEJBUiBtYXkgdG9sZXJhdGUg
NDAtYml0IGFkZHJlc3MgaW4gc29tZSB1c2UtY2FzZXM/DQo+IEl0IGlzIGNvcnJlY3QgZm9yIExQ
QUUgdG9vLCBpdCBpcyBqdXN0IHRoYXQgd2l0aCBMUEFFIGl0IHdvdWxkIGJlDQo+IHVubmVjZXNz
YXJ5Lg==

