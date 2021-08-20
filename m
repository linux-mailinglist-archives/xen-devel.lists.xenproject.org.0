Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAED23F249D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 04:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169170.309031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGtxx-0003mA-15; Fri, 20 Aug 2021 02:09:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169170.309031; Fri, 20 Aug 2021 02:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGtxw-0003ir-TI; Fri, 20 Aug 2021 02:09:04 +0000
Received: by outflank-mailman (input) for mailman id 169170;
 Fri, 20 Aug 2021 02:09:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pH7i=NL=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mGtxv-0003ij-O3
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 02:09:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.62]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9624f73b-015b-11ec-a677-12813bfff9fa;
 Fri, 20 Aug 2021 02:09:02 +0000 (UTC)
Received: from AM7PR03CA0017.eurprd03.prod.outlook.com (2603:10a6:20b:130::27)
 by AM0PR08MB5123.eurprd08.prod.outlook.com (2603:10a6:208:15b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 20 Aug
 2021 02:09:00 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::5d) by AM7PR03CA0017.outlook.office365.com
 (2603:10a6:20b:130::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 02:09:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 02:08:59 +0000
Received: ("Tessian outbound 8b41f5fb4e9e:v103");
 Fri, 20 Aug 2021 02:08:59 +0000
Received: from 1af4584afa08.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EEA73CC4-6ED8-44E4-B672-ECC5337AD723.1; 
 Fri, 20 Aug 2021 02:08:53 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1af4584afa08.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 02:08:53 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB6266.eurprd08.prod.outlook.com (2603:10a6:10:203::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Fri, 20 Aug
 2021 02:08:51 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 02:08:51 +0000
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
X-Inumbo-ID: 9624f73b-015b-11ec-a677-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsIS9oTWsfU76sly8sye5wCF2HYMJJQ1ZArZaVwsr3Q=;
 b=wotyO1nWhEWcyUYKQiQEojr9AcAfXAnphfiUTXERdukIPfMIhZJzlq38ueavP+Rz0mpT9Un0mrdzSLt9zjowCr1YL9I0CDJZeZ3JHbdR2/a56Gkb/jOfPGX2G66VNsqzRkzwoIg4IVDHNgqElvyuDNrmoCyl9o6hgWrvfU65AU0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UF8+ZRfrspxKy6t2XBBDyXX/bKjL1pYZSi3JDfuEpOfrZTYvW7dcndDp0jM0OhaYF08rO+GRmyTYjbNo/jGXisop7GaIOpz/ccfISMlzsJtHPrt+COrB46zxdtaRmdQ1VxKKgdXIxtWG200lPLctSToptbshg4JT2DDBpuXlzIeN34RzINfpcrZ2Q3/yW/2xpZroZ/nfVCWtM51TQeDmHmQi6WrjeRUubpTjXiZKVv+xhckwgjKZC16nDtFckVLXA9RocYjwG+etHNpQWGq5eDHB0Dv1TtYov/yZd2U6QXdWOFfSie3vFuzgrUqgRQK7ogcg6dyGruYm3jnsCugM3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsIS9oTWsfU76sly8sye5wCF2HYMJJQ1ZArZaVwsr3Q=;
 b=Jn4APk2hARu5MejBnXcG//QOm6uplsvDUkPEX55rLAGBcpT6vwhz377J404Df6544Z8arD7uvf+1D8jOLkdXz8JaMbmxEook5QuU9QSoC61vJqeKxRTnFHEMaJ1PdIeRpsXnEKuxCpMbnMtAY4p2DmHz5gTcO2N7muFKYW5/cLJbtHu1sOUY1vw3U9fIIT8iaUewHQls7f2y6yPwP5L+dEJ7kDLV38kEE5p+zrfRsnjwy73WcqPotaaJ0Aa8IFXglQSjC4Y2NWmY/+xMV2Y4NkNBRZOPG/vztP/CQoJnaZs+NX5qj9RBdNsU+L71QDy3LzBVk2PiMALA2ErrWc6BzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsIS9oTWsfU76sly8sye5wCF2HYMJJQ1ZArZaVwsr3Q=;
 b=wotyO1nWhEWcyUYKQiQEojr9AcAfXAnphfiUTXERdukIPfMIhZJzlq38ueavP+Rz0mpT9Un0mrdzSLt9zjowCr1YL9I0CDJZeZ3JHbdR2/a56Gkb/jOfPGX2G66VNsqzRkzwoIg4IVDHNgqElvyuDNrmoCyl9o6hgWrvfU65AU0=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 07/40] xen/arm: use !CONFIG_NUMA to keep fake NUMA
 API
Thread-Topic: [XEN RFC PATCH 07/40] xen/arm: use !CONFIG_NUMA to keep fake
 NUMA API
Thread-Index: AQHXjpsrCM0mCbgWfUKWYF7VHwpa+qt64JgAgADSDXA=
Date: Fri, 20 Aug 2021 02:08:51 +0000
Message-ID:
 <DB9PR08MB6857D0004A59BC90866AE4C89EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-8-wei.chen@arm.com>
 <e9a45fe3-e4b0-6533-8b41-ac3f10ef386a@xen.org>
In-Reply-To: <e9a45fe3-e4b0-6533-8b41-ac3f10ef386a@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 90576026A0A7BA48B6A6448DBCCD0EE7.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c76f6d39-5f47-45a0-4138-08d9637f7976
x-ms-traffictypediagnostic: DBBPR08MB6266:|AM0PR08MB5123:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB512398948E8B8C6B1F6F70AA9EC19@AM0PR08MB5123.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4714;OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OLcciTt99xQWFAp1J43T9vDHyaVkzXfOW6TacDIEujWPTAyt17TYeMvJZkTXTassnMtdShhQ7AalRDdY/d9gCrgpxni81cldKm7EUYt9XzuPtHiecEJShelxgaSCBee/EjIKJnDSGyV1kdIcIEOZVFi3ENbIYWOOduQ6dOfZcjfc2X5/aI2yiDNZcf1Hd4swx0evqEjTqH17cK5jkHSyokMDi7mit+qembeh3L36MO+lpS0yyQNCjHVcFAvltMu8K6g3LIvP02jYUXMCwEYtgRAIj/pVkqQYU6BC7mqFnIShYjQqxkhBfciwWjvmKI+pxLmxyRfk6QfOk2RiLH5d6mI/VC17eTw7gH0cDbsMZTlzXlMVV1a4Nj8QoTrIQIQKiP2Fbg1EglxGuzD+IAIV1Bp4hbjo6FNAEF04TPBIJH4hSt2H9s2NjhKIFKB9HcMmes92vFmk4FD5nh7U1ohPdNrPV1NuUGjQoEG/QX6n754//JAomij+YC/LA1Hm4OHDH4k9/bvvBC7XKfFYiJjaT7SG6sETuEIPdE0z0zKf5+s2SN7VP91od63hK1fFlg5qyrDFRB82fH57W/soHBGsQx2US5al5H0y0yJL7dBxkQwtxraByPLMFO3PWBV41fJtVbKj8D1bi2iUnLI7vTSXwnLu6sQXucEmDiQ1SdHsYOuGLpStZ4wXqwpcFbb9i/ZuUqay2poeFmqRBNCHaoJiiA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(396003)(376002)(136003)(366004)(7696005)(38100700002)(83380400001)(66556008)(33656002)(9686003)(26005)(8676002)(2906002)(122000001)(6506007)(52536014)(186003)(478600001)(66446008)(66476007)(4326008)(110136005)(64756008)(53546011)(76116006)(86362001)(316002)(5660300002)(38070700005)(8936002)(71200400001)(66946007)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cW9vNnVDRXJlK2JlRFcrOVY3aDZnU3k3UGdQczJvVUNaVE5uZHpYUVlRQkxX?=
 =?utf-8?B?bnVsaXJScUJsZzFiUzBaL3hackp0SVVvQ3dTeUwza0NjeVFXV0phK05tSWNh?=
 =?utf-8?B?YnZ4V0Q0S3ZaM0xQcVFrbHdlZEwxRE1PMVVmQUovdk9jb25CV2ZyYVpTYjFQ?=
 =?utf-8?B?U2ZWM2MxR1dtK29CTDF0dkRUeEg4alI5ZHdKMTJTRTZvT0hpR1JIZkM3d280?=
 =?utf-8?B?Qy9LajlLcEx6R2tMVGJ4cXN1STVqTytnKzY1L3E3M0JkNjhHYWZRNGh4RCtK?=
 =?utf-8?B?d0ZSMGxsTmFUZnZxMVlRRVBoM2pSUTlhUzhDRElMNTU1RXdFbmhKeWRLZGRJ?=
 =?utf-8?B?WUU3VjBmVERwYndwUCtJSkdRVjJRVHJPd01XRFpxTmR3WkNiM01WVEtxUm1z?=
 =?utf-8?B?RlM4WDIrMmNTSjNCeUhudldtOGxCblJ3T0VLeFBRQlFiUitycFVDcEhlK2lY?=
 =?utf-8?B?bW5sRUUrNUZMYStJSTkvMU1mMjdSRlk2SHlzKzd0b2Vpb1BvTkw3UnZwbGF6?=
 =?utf-8?B?RGY2VFpNamxBenJZMDBxcGl2S3NhSzQwSGlGWFZod2Q0VUZJbVJSeDZ0NkMv?=
 =?utf-8?B?YkdIVzNPUE5rZlRiTXIxSW1CaVo3eC9KQ09aMm9TMy8rRkJESkNmRXdGdkV0?=
 =?utf-8?B?OHozN1dwRzlKQ1I3bHl2MHJQUjFwR2V4QktHK2ZwR0RHTDM4T05lL3o0R1BJ?=
 =?utf-8?B?UTNSeWVGa040MVZlY2xWeExDRWpBcVJ4TURLSXd2dzBmSS9PQWZ2SDV2QW52?=
 =?utf-8?B?OVYwdHk5SkhYNDNERElNWE9JUlRVNU9zMm53VXlvNThKblpIdXkvQnRoN2ly?=
 =?utf-8?B?S2FTcUhITERBZHM1NGxaRVlvaTUyR0x5dkFFeDh4MXJ2Q3REelpmVGVRVXUz?=
 =?utf-8?B?S2NuSjU4a3ppbHVTbmtjTE1HNFoxREJZdlI4OXdKQWZkZ2VCNGtqYm9DSlR3?=
 =?utf-8?B?Wm8rblBITnY5Y1E1RUVyN0RJM2FyTVZNWUd3OG5iL2UvYmRwQ2hjRURYN25y?=
 =?utf-8?B?cTBjcFkyNjNVMVVLMFRsNGg4N1RsMnUvaWFEUkJYSCtNZEJ0dTRMcEE1MUZX?=
 =?utf-8?B?NjVvekplb0g2RkxtQUdHZHUvYmJ6WEhqK2ViQTRpY2xqVXVFbEIzNSsyM3dN?=
 =?utf-8?B?dGFyMjV6em9yTWNzRDFzZEo4VW12aEE0Mi9lUi84NHJ6a3BPbGxSQ0NFWlBI?=
 =?utf-8?B?L1NpbmxpKzZCMmU3a1lkUHhMZXFmd0dING1JSjJsTlI1aHViYnZqNjRubFJu?=
 =?utf-8?B?a1dsN0o5M1VGcTNLNnRNS1F0ejkzUEdOSmgrRWxFMThwYTFNbDBJbEpsSDJF?=
 =?utf-8?B?cWJUZzc2QTF4UTRYcGhKQXZGTEllSmlmV2pwYWkvRXZHdk52ZWtHa085QjF0?=
 =?utf-8?B?bzFnd1RMZlBFay9mNEdpd1prVld1UkN3Z2pkVVAyeGhCN3UxQzZuWUc4MzNo?=
 =?utf-8?B?aXkrRk04MjBQbUg4eTZ6RERDeEIwYzZrU0YrdzMrSDFIdW0xdlhmQ25IdW5V?=
 =?utf-8?B?M3dYRTEzZlFYQmpvOENUdnhaNVhGMVpieGY5aDJFdGs5dWxrczVjd25ZWFFX?=
 =?utf-8?B?N3N3SXB5ditaZFUwR21wSG5JRGRHMFBJMTc1QVhGWnhQS2ZvNUZUaE9vVU5L?=
 =?utf-8?B?OG1LVHBEUzJxOVI3UGFrQUk5UEhuU0pyZVhWY0F2VHpjSFZ4N2RTQ2FRRk1V?=
 =?utf-8?B?bmE2eWlvTmd4K3ZadldlVU1CYm9xWU5rVmhJTm02WjNuVC9lVmswOUVWUGp1?=
 =?utf-8?Q?2g1vwPMsww/nm9CyHdytbtqZnq3MkkhZsibZ+19?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6266
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ece1490a-396a-4d9d-62c8-08d9637f747b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tZFUj/wQnfDv7v6upqHVJLYKVu24PErROlPTvsadyXurgxqlWgh+t1zf/daB/pY7rj+gfuFX/xojN1OQwijvUlqHt5Of7GoDvquxO4roFDZ3pnxBXmrqj+JIytyeIUz0gHI2DA6/v5HY0wSwt6aXch4Ty1ntlxwQWl3JaKLw9kmmkhSNmYNe2KkPVobDBCX1WL3J7qMPibisT+Jesv96GnQHtWY51n6p42FPLKyUpbs09PunuFFCkO4TGWuo73cQqyWwnAGifoK0Iva43wKRa+9FMd12e0Bc1QWQQJzhVDxssh6ZPrGtjOscMjR60UHR9yK4nlE5UUGK2FPfRIWU9Qp9QZGhaoQw5j3AvLtvGAysJgTuWyLXyDE8ukXacqs1T/czb54jCUOXLLaEu4Lv327diRYqrzchUwUAFHgUsuly8M70SXNnrX6a3YSfeOHqfyonbzre2fCwEDn1YztXszWknzvuh01PnNE4+Qle4Iba9NZpzXZHtdi9ASJEKMarEXHfC8E9QaLkecQJM6CZz1EpVUDQxNUXPfReIJ0VT2sXBoZIMc/ZlceLSmUMQkgRn50ng3p3wA8Y3dpzDytjOStK427ZXf6dFfZoTgQxwjKYwKSZ38ousC1u7Kd4AZCUMoxB3DVIjF+2lnnkm6eyobmZe/uKKpSs/bi96zpMaysojwuHgmhYVt9Zr1pvw6J68ysfXstosHE9CZguGLTjoQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39850400004)(36840700001)(46966006)(5660300002)(82740400003)(81166007)(478600001)(70206006)(2906002)(186003)(8676002)(8936002)(70586007)(53546011)(36860700001)(6506007)(26005)(47076005)(52536014)(33656002)(82310400003)(4326008)(316002)(86362001)(83380400001)(55016002)(110136005)(336012)(9686003)(7696005)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 02:08:59.8335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c76f6d39-5f47-45a0-4138-08d9637f7976
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5123

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMTnml6UgMjE6MzQN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1bGljaEBzdXNlLmNvbQ0K
PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMDcvNDBdIHhlbi9hcm06IHVzZSAhQ09ORklHX05VTUEg
dG8ga2VlcCBmYWtlDQo+IE5VTUEgQVBJDQo+IA0KPiBIaSBXZWksDQo+IA0KPiBPbiAxMS8wOC8y
MDIxIDExOjIzLCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBPbmx5IEFybTY0IHN1cHBvcnRzIE5VTUEs
IHRoZSBDT05GSUdfTlVNQSBjb3VsZCBub3QgYmUNCj4gPiBlbmFibGVkIGZvciBBcm0zMi4NCj4g
DQo+IFdoYXQgZG8geW91IG1lYW4gYnkgImNvdWxkIG5vdCBiZSBlbmFibGVkIj8NCg0KSSBoYXZl
IG5vdCBzZWVuIGFueSBBcm0zMiBoYXJkd2FyZSBzdXBwb3J0IE5VTUEsIHNvIEkgdGhpbmsNCndl
IGRvbid0IG5lZWQgdG8gc3VwcG9ydCBBcm0zMiBOVU1BLiBJbiB0aGlzIGNhc2UsIHRoaXMgS2Nv
bmZpZw0Kb3B0aW9uIGNvdWxkIG5vdCBiZSBlbmFibGVkIG9uIEFybTMyLg0KDQo+IA0KPiA+IEV2
ZW4gaW4gQXJtNjQsIHVzZXJzIHN0aWxsIGNhbiBkaXNhYmxlDQo+ID4gdGhlIENPTkZJR19OVU1B
IHRocm91Z2ggS2NvbmZpZyBvcHRpb24uIEluIHRoaXMgY2FzZSwga2VlcA0KPiA+IGN1cnJlbnQg
ZmFrZSBOVU1BIEFQSSwgd2lsbCBtYWtlIEFybSBjb2RlIHN0aWxsIGNhbiB3b3JrDQo+ID4gd2l0
aCBOVU1BIGF3YXJlIG1lbW9yeSBhbGxvY2F0aW9uIGFuZCBzY2hlZHVsZXIuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiAg
IHhlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oIHwgNCArKysrDQo+ID4gICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNt
LWFybS9udW1hLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaA0KPiA+IGluZGV4IDMxYTZk
ZTRlMjMuLmFiOWM0YTI0NDggMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9u
dW1hLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaA0KPiA+IEBAIC01LDYg
KzUsOCBAQA0KPiA+DQo+ID4gICB0eXBlZGVmIHU4IG5vZGVpZF90Ow0KPiA+DQo+ID4gKyNpZiAh
ZGVmaW5lZChDT05GSUdfTlVNQSkNCj4gDQo+IE5JVDogV2UgdGVuZCB0byB1c2UgI2lmbmRlZiBy
YXRoZXIgdGhhbiAjaWYgIWRlZmluZWQoLi4uKQ0KPiANCg0KT0ssIEkgd2lsbCBjaGFuZ2UgcmVs
YXRlZCBjaGFuZ2VzIGluIHRoaXMgc2VyaWVzLg0KDQo+ID4gKw0KPiA+ICAgLyogRmFrZSBvbmUg
bm9kZSBmb3Igbm93LiBTZWUgYWxzbyBub2RlX29ubGluZV9tYXAuICovDQo+ID4gICAjZGVmaW5l
IGNwdV90b19ub2RlKGNwdSkgMA0KPiA+ICAgI2RlZmluZSBub2RlX3RvX2NwdW1hc2sobm9kZSkg
ICAoY3B1X29ubGluZV9tYXApDQo+ID4gQEAgLTI1LDYgKzI3LDggQEAgZXh0ZXJuIG1mbl90IGZp
cnN0X3ZhbGlkX21mbjsNCj4gPiAgICNkZWZpbmUgbm9kZV9zdGFydF9wZm4obmlkKSAobWZuX3go
Zmlyc3RfdmFsaWRfbWZuKSkNCj4gPiAgICNkZWZpbmUgX19ub2RlX2Rpc3RhbmNlKGEsIGIpICgy
MCkNCj4gPg0KPiA+ICsjZW5kaWYNCj4gPiArDQo+ID4gICAjZW5kaWYgLyogX19BUkNIX0FSTV9O
VU1BX0ggKi8NCj4gPiAgIC8qDQo+ID4gICAgKiBMb2NhbCB2YXJpYWJsZXM6DQo+ID4NCj4gDQo+
IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

