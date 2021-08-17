Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A04C3EE466
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 04:34:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167555.305872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFovN-0006iy-AC; Tue, 17 Aug 2021 02:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167555.305872; Tue, 17 Aug 2021 02:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFovN-0006gG-5q; Tue, 17 Aug 2021 02:33:57 +0000
Received: by outflank-mailman (input) for mailman id 167555;
 Tue, 17 Aug 2021 02:33:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t5rO=NI=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mFovL-0006gA-Gm
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 02:33:55 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.44]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba043d78-54a7-458a-936a-9d40ae40ac44;
 Tue, 17 Aug 2021 02:33:53 +0000 (UTC)
Received: from DU2PR04CA0195.eurprd04.prod.outlook.com (2603:10a6:10:28d::20)
 by VE1PR08MB5150.eurprd08.prod.outlook.com (2603:10a6:803:10a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Tue, 17 Aug
 2021 02:33:51 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::4a) by DU2PR04CA0195.outlook.office365.com
 (2603:10a6:10:28d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Tue, 17 Aug 2021 02:33:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Tue, 17 Aug 2021 02:33:50 +0000
Received: ("Tessian outbound 56612e04f172:v103");
 Tue, 17 Aug 2021 02:33:50 +0000
Received: from cf18db0b0abb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7B7F58C2-CD08-4D24-9C36-EEBB923F99D4.1; 
 Tue, 17 Aug 2021 02:33:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cf18db0b0abb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Aug 2021 02:33:45 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB4511.eurprd08.prod.outlook.com (2603:10a6:803:f9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Tue, 17 Aug
 2021 02:33:44 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c%5]) with mapi id 15.20.4415.022; Tue, 17 Aug 2021
 02:33:44 +0000
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
X-Inumbo-ID: ba043d78-54a7-458a-936a-9d40ae40ac44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vfo4ttKatBF8pMiVUpXM0i1hCTmwi72HRhJO+a0gxGc=;
 b=bqA56BvK/p7whPyaWzwseNrK7KYuuwmY0COmWppyjCUoQJNNjy3558R+egPLNZQ9b5KulYDytkPhqz1MXbmKSBRi13PkmBOGvoQsjehtu10DgXoJ5F97sKc0Knq8JcwsQtGBskSIkD8cwEQmCP/9YE5WE8RN6aZWQApKdCRvs6Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvSg1g8QukRcoJgvjXNwJNfGY1SxZ5K0aqz4uqODQHbXF4AZVf7OCQdrFSESHXPGyh4ZCcrNyX80nUCnfjb2HJ3XDqXx57QAX7mt9Dx7CTtM0on2JEscOEYAVq84MX4xCKPfRGgvTOWIKBXLCTo8eFwEAS2hACXOd9k9eFzP4cmPVk4fXJ3BafRdip2r3DxcPRmN2IfuBSK30W3kPzO+k/3QaDz+wZ+K+dBsYFoojyyCEKeZU3p+aaD2qyq+wSN1h84iOQqH9BwlvcrcftD95NjH5fnHAY6NXZ+ZkiJfcKXrD3i+QMuT1imOz/xArYPF28QIl5cA7XHIYzC8NWzTXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vfo4ttKatBF8pMiVUpXM0i1hCTmwi72HRhJO+a0gxGc=;
 b=O76hXoAIme6mCFe76sv98vdPhPNQfcwACN/GvIwEy+939IFYwyNmW2fwmZe+1YqCiXQjDCpUT86S8jn+mr6iYoW664BfbmcChiUKKsjgyVNLHrxs0UDQKPlf/yHN8z2glz0DY5Cbn+dG93/JIiQUure5Tcdi9egitdpIbrpishU+vmPhaQX+3wj72Qb2LQyks4cr9YtWq6wOWUAKhT1QNIJ9sezKx2e/CUYtuzK0EvWrJHWMwwITevMB1Bh63egdzfZmS25xJQ3kmGCqvWUvrTfTUGljpMHfDVFs1cl/I+ZqVRcUTS2cx4VLVmxQwwKwuPKJnC/qHtQlLBgoxVH3fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vfo4ttKatBF8pMiVUpXM0i1hCTmwi72HRhJO+a0gxGc=;
 b=bqA56BvK/p7whPyaWzwseNrK7KYuuwmY0COmWppyjCUoQJNNjy3558R+egPLNZQ9b5KulYDytkPhqz1MXbmKSBRi13PkmBOGvoQsjehtu10DgXoJ5F97sKc0Knq8JcwsQtGBskSIkD8cwEQmCP/9YE5WE8RN6aZWQApKdCRvs6Q=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH V4 08/10] xen/arm: introduce acquire_staticmem_pages and
 acquire_domstatic_pages
Thread-Topic: [PATCH V4 08/10] xen/arm: introduce acquire_staticmem_pages and
 acquire_domstatic_pages
Thread-Index: AQHXg5tbU50GA1cFbUmCTz4Yb/U8oatxfxqAgARG2HCAAL9iAIAAk6UA
Date: Tue, 17 Aug 2021 02:33:43 +0000
Message-ID:
 <VE1PR08MB5215E58AF3FE590068F9D0ADF7FE9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-9-penny.zheng@arm.com>
 <611fc504-c866-647e-01f3-0614238c3aca@xen.org>
 <VE1PR08MB5215022EC0300A85B0017EEFF7FD9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <481f4d7d-2ca6-e338-3b62-af86bd419b82@xen.org>
In-Reply-To: <481f4d7d-2ca6-e338-3b62-af86bd419b82@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: AF622BD1AC7D504CB782F078D660D191.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ce2508b4-7df4-4e25-8e66-08d9612772c1
x-ms-traffictypediagnostic: VI1PR08MB4511:|VE1PR08MB5150:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5150EC27FC307E54E249971CF7FE9@VE1PR08MB5150.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 l6epfWpG34qMmxcaCbN9aUJDm3Vmb7PCtQPdjf5AxfFKbASQxsAe6POz+50MZFhc/BVkrWGR4nN25Wyvr+KxjwfN8Si3KlfCxCkpLCmPXugRAnyvUQIowGFvvcN3kQCVGDlgct4H3FelqXT1WG+y7L/xPAnA3/m3HMsm630ItU6X26092mLaRU6hhpeG99s+r/IYP9ONcv10Xk2oS7NPT4GzLxbVJkVirhPSyCehVUc1VnoPfb/cSb0c53Fc3chSqodr4mTBi1ErQKpJmwJ3/GvZz8oCSlV0i7PLHbcKBrpDhT55GIZh0sApfKb0q8YJiZQWEjGTgq2pRAmxjd0G8aspdgf2pFNdbcdrEqr6qZ5wE02wPGyQ08fBzQDk05glRhSbQeIqLD2fI102i+KO7ADIstb0IzCFpxLxSuJxGjDAT/DTp5FklZW0JXgo9mwdAR+cXnWUAhXx/aVNu71ItGAW7uwR0p/KLB4IHtAIh0QXqYkfyThaErNn4fhAOQ4rNmA+KvW1JCh6z4OufCuwCHhfhTV99y6+zCSzWPR+m81iUO7Rj40idylZ/tCMI7TEGFztrMaR9i+WsS/ESanPbVXRsvYxbpOinA4UKjXOGrFDHSGXDQn4rWKS4g6kGh+I3RxkIAZwRFPwudKn68ntwKgRlZoE7BSqytxFYOsDczssp43nzgcVJHgRGPXNxbUq5kjfeLxSmoTJRWf5WDgb2g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(7696005)(66556008)(110136005)(5660300002)(8676002)(64756008)(186003)(4326008)(9686003)(122000001)(86362001)(33656002)(8936002)(38100700002)(26005)(66476007)(2906002)(66446008)(38070700005)(54906003)(76116006)(55016002)(316002)(478600001)(71200400001)(6506007)(52536014)(53546011)(66946007)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WXc3VktBOGhsQUVwZ2lzM3JTeWsvaDBhaGV2M01LdjFQaStxSmNNS3Z2MnVM?=
 =?utf-8?B?YW01WnhVS3JoQkRFTjJmckFLNGZqaWdIWlpvY3dLZVEwZjVudXE1cXpUSFBi?=
 =?utf-8?B?ZDVyZ2poazQydHFNVFdwdm9FcUZzbDlVNUU2RVFwUlQ4MFB4YTV1ckxKNm5P?=
 =?utf-8?B?QUsvNDAxUVRvS1BYMi82UmF6NFRQSVVwdEFGNTl1L3dZcnVNcmRxNlhCcHk5?=
 =?utf-8?B?dWZFc1BqZURnTDhJWTNYNCtGQzVxSUErNFo0Y3dXcHc5NzJWUjVEZ1R6M3oy?=
 =?utf-8?B?M0JNUlRNTnVxWmVQT2h5eHhRaEFVNXJlWnNZWGNQWW1YRFVRTW9MMmUxVkVX?=
 =?utf-8?B?OXNyb25GODBzOXBGZVNYY0xEcEViOUlNRWhGbTluSFZBSXRRaXpDNnlSSzFr?=
 =?utf-8?B?TzVMaHRrRnZodVJKY3JYeUFTTVFJcTBpM283WGZxbWlXd3pldUs1cVp1UWcx?=
 =?utf-8?B?a2RLZ3dKMHBZWTZHRFcveVAzdCtwOUMyZDBTallRWEtNT1llS0h2UjRrUWtE?=
 =?utf-8?B?MzBsV2haV3BmQUp0N3lid3ZyWFlnem96QmcwWGlBRGtpWm9iQWZJSDdFRVhi?=
 =?utf-8?B?VHo5elNES1BGNjdpaTlKdG55MkpvOTNJU0FkNm54b1BOZEdHNUF6eERnWXVZ?=
 =?utf-8?B?Zlg4ZWVKYmZ4UWN6WGU5UEU4S205VEZsL29TcmNPdTZDRS9yQVdORVFJQk5k?=
 =?utf-8?B?WVg3bDJZRGplQnZhcm4yL1ByOHBJNXRXdUsvVm9oQjhNT2wxdGF4SkZHSnBB?=
 =?utf-8?B?b2FrdkFJTnlaWmVlNFNPWXR4NXVzRWpMK2xIMHk2a25ueThTSEVrMkdlQmxS?=
 =?utf-8?B?akZSQWdoR3JpSVFnTWpPQ0V3cXprZFJ5ZXJXLzdZZVMrWlhic3VBZllHc2dW?=
 =?utf-8?B?TFVkMEZwR2NvVmxKWHRFa2V1K0REN2VWQ1R5YVF1L0lqekdPc3NESkFYcjM0?=
 =?utf-8?B?dEVuczJ2aDByYS9sTE9veVY0ZG9SYW1mTzk2YWpUb0lqNWUybGJXZld6SGJB?=
 =?utf-8?B?SkcrUktBZGIzRTlMWnRyTnpzejA4dWZCTGZxb0pOS3p0TTZxTDNydGRQTElP?=
 =?utf-8?B?ZENIQm1UUG9iUCtJVzVEd1Q1aHVhdzJzNXVCbG5Zb21CalRvR0tCbHBmdnY1?=
 =?utf-8?B?N1JlWkpKY2RtRTBlZExPWXp4V0dxRFdWM1E2Vy8vRXNaeGVPTHhVUmx3dE15?=
 =?utf-8?B?WGZ4VEkwYTlZSXhjNU13MklnUnQ3aTAyN0tUdHYrcTBMUksxSDRtT0N1SnJu?=
 =?utf-8?B?Mk1kM295RE1tOW1ndmRzNGU5T2hxRmYzMW9lQUYrcDAvK1lJTFpIbVAzTEI0?=
 =?utf-8?B?Y1d3WktoSHBlM0t0a3oreUdHUFFFY3Y5L053dk9Tb0Y1ODE0Qko0OFhMWE5H?=
 =?utf-8?B?eG5nQU95aE1hdmZQZEkrbWc3YmNST3ZKSjNCR25DNG1qRGlTSnlTZVZ6bStT?=
 =?utf-8?B?NEZUanJ6NUdVcnU2TVdJSzlsSDVxNG1WZXJZTEE2V0FwdGtlays1aXl6Rkp3?=
 =?utf-8?B?WFhudm5CMktkTjMwUW9DN1JhQWdvRi9oK3RlaHVyWDNKUzBwQTlrZ1l0c0Nx?=
 =?utf-8?B?M09nV0Z1UDI2UzlvZGhYOG5nWEhQSEZ3OVhyM3BhMy9LVHFFcmgxN3VINWp1?=
 =?utf-8?B?NWNFR0tIK3RnRW5RR0hpaGJrN1R0ZEdvcjFocFlKaUZjYlZtNTEwVk02YlE0?=
 =?utf-8?B?OVZhNk96KzA5eXFMYW9SdGxYR3pCd0NVckJZZURpTzIrbGZKZ2V3TUdmalV5?=
 =?utf-8?Q?DJ8/nlFpa8NX60rPVz4m5ZpeYO74GlF4Tx3VPf3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4511
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c2074ce8-c48e-4c54-c7b4-08d961276ece
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YUW1K8J+tDLRtr9vo6R0wy/2zLacLPG7l8KKRqb1P1pwHRWl/0kOhJYXP1A1sWZb1vtVXuBXqXDz3Qmv4oPfbtjbeL6x6NILUlKgy6w4Erf53n/xsbpW2U5PBUP7K5tEttRVPMv49raRtG3Jdt84VAREXUvSWwVtSjvVSM5nICFvTkaembIWmwbUh6aF20dDSPhelvP6ts6OOW3NUui9+6dPs7L8drKTqVfdWYkIU0oqj7bSq5sFdHuHH3uVDP/IbWzDUGgFbn50EvsY7zDusMfMKTWmYkgoLg/VH8UJZZXLdsXKm81DlN6Okn+v4ll65fDVxL3f9EOQcAJA7hSQ5iaFQhrf3FC17lAptowtjinqNxKk0kmv9P6r6hTYegXB/aBxVlSy/noD08L5z9Mc95YitAY5/bDvsVVQqk657rszE5+FW+/Sx7lEYjiKSGk9u/nrkDdw1Dz2uvuCfU1pFtyudXQMLUjcdF38ICbZMd8zVs4IpLAzrfzxEPfAv13arJ9adezSvabsURw0i2w9M/S3HFhTVEHGPQgOFdr6mIVNa7RzKZcCFZAFsnxg4sQDtwR46wrEhMSsyrmquOWIsA4XeSGdSmo7/y1NcPjlWCAKvl/xDoFuT3kJvMRc9z+tSLqFHH9IFqO++GK30fp+Wni63ecbDrNOXn3XXle1+EEABhb+GonbP353rV9XG8kc
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(36840700001)(46966006)(47076005)(86362001)(9686003)(82310400003)(33656002)(8936002)(8676002)(83380400001)(55016002)(336012)(478600001)(2906002)(36860700001)(316002)(7696005)(26005)(186003)(110136005)(54906003)(53546011)(5660300002)(52536014)(70586007)(6506007)(356005)(70206006)(81166007)(4326008)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 02:33:50.6482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2508b4-7df4-4e25-8e66-08d9612772c1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5150

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDE3LCAyMDIxIDE6NDQgQU0N
Cj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBCZXJ0cmFu
ZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8V2VpLkNo
ZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFY0IDA4
LzEwXSB4ZW4vYXJtOiBpbnRyb2R1Y2UgYWNxdWlyZV9zdGF0aWNtZW1fcGFnZXMNCj4gYW5kIGFj
cXVpcmVfZG9tc3RhdGljX3BhZ2VzDQo+IA0KPiANCj4gDQo+IE9uIDE2LzA4LzIwMjEgMDc6NDMs
IFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IEhpIEp1bGllbiwNCj4gDQo+IEhpLA0KPiANCj4gPj4+
ICt7DQo+ID4+PiArICAgIGJvb2wgbmVlZF90bGJmbHVzaCA9IGZhbHNlOw0KPiA+Pj4gKyAgICB1
aW50MzJfdCB0bGJmbHVzaF90aW1lc3RhbXAgPSAwOw0KPiA+Pj4gKyAgICB1bnNpZ25lZCBsb25n
IGk7DQo+ID4+PiArICAgIHN0cnVjdCBwYWdlX2luZm8gKnBnOw0KPiA+Pj4gKw0KPiA+Pj4gKyAg
ICAvKiBGb3Igbm93LCBpdCBvbmx5IHN1cHBvcnRzIHByZS1jb25maWd1cmVkIHN0YXRpYyBtZW1v
cnkuICovDQo+ID4+DQo+ID4+IFRoaXMgY29tbWVudCBkb2Vzbid0IHNlZW0gdG8gbWF0Y2ggdGhl
IGNoZWNrIGJlbG93Lg0KPiA+Pg0KPiA+Pj4gKyAgICBpZiAoICFtZm5fdmFsaWQoc21mbikgfHwg
IW5yX21mbnMgKQ0KPiA+Pg0KPiA+PiBUaGlzIGNoZWNrIG9ubHkgZ3VhcmFudGVlcyB0aGF0IHRo
ZXJlIHdpbGwgYmUgYSBwYWdlIGZvciB0aGUgZmlyc3QgTUZOLg0KPiA+PiBTaG91bGRuJ3Qgd2Ug
YWxzbyBjaGVjayBmb3IgdGhlIG90aGVyIE1GTnM/DQo+ID4+DQo+ID4NCj4gPiBIbW0sIERvIHlv
dSB0aGluayB0aGF0IGl0IHNob3VsZCBiZSBhbGwgY2hlY2tlZCwgdGhlIHdob2xlIHJhbmdlLCBb
c21mbiwNCj4gc21mbiArIG5yX21mbnMpLg0KPiA+IFNpbmNlIGl0IGlzIGluIGxpbmVhciBncm93
dGgsIG1heWJlIGFkZGluZyBhbm90aGVyIGNoZWNrIG9mICIhbWZuX3ZhbGlkKHNtZm4NCj4gKyBu
cl9tZm5zIC0gMSkiDQo+ID4gaXMgZW5vdWdoPw0KPiANCj4gVGhlIG9ubHkgcmVxdWlyZW1lbnQg
Zm9yIFhlbiBpcyB0byBwcm92aWRlIGEgdmFsaWQgc3RydWN0IHBhZ2UgZm9yIGVhY2ggUkFNDQo+
IHBhZ2UuIFNvIGNoZWNraW5nIHRoZSBmaXJzdCBhbmQgZW5kIHBhZ2UgbWF5IG5vdCBiZSBzdWZm
aWNpZW50IGlmIHRoZXJlIGlzIGEgaG9sZQ0KPiBpbiB0aGUgbWlkZGxlLg0KPiANCj4gTXkgcG9p
bnQgaGVyZSBpcyBlaXRoZXI6DQo+ICAgIC0gd2UgdHJ1c3QgdGhlIGNhbGxlcnMgc28gd2UgcmVt
b3ZlIHRoZSBtZm5fdmFsaWQoKSBjaGVjaw0KPiAgICAtIHdlIGRvbid0IHRydXN0IHRoZSBjYWxs
ZXJzIHNvIHdlIGNoZWNrIHRoZSBNRk4gaXMgdmFsaWQgZm9yIGV2ZXJ5IHBhZ2UNCj4gDQo+IE15
IHByZWZlcmVuY2UgaXMgdGhlIGxhdHRlciwgdGhlIG1vcmUgaWYgd2UgcGxhbiB0byB1cyB0aGUg
aGVscGVyIGFmdGVyIGJvb3QgaW4NCj4gdGhlIGZ1dHVyZS4gQW4gcG9zc2libGUgY29tcHJvbWlz
ZSBpcyB0byBhZGQgYSBjb21tZW50IHRoYXQgdGhpcyBmdW5jdGlvbg0KPiBuZWVkcyB0byBiZSBy
ZXdvcmtlZCBpZiB1c2VkIG91dHNpZGUgb2YgYm9vdC4NCj4gDQoNCk9rLiBJJ2xsIGRvIHRoZSB3
aG9sZSByYW5nZSBjaGVjayBhbmQgYWRkIHRoZSBjb21tZW50cy4NCg0KPiBDaGVlcnMsDQo+IA0K
PiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

