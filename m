Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3278D38A08A
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 11:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130784.244784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljebp-0002st-4V; Thu, 20 May 2021 09:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130784.244784; Thu, 20 May 2021 09:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljebp-0002qK-0X; Thu, 20 May 2021 09:04:49 +0000
Received: by outflank-mailman (input) for mailman id 130784;
 Thu, 20 May 2021 09:04:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yP7T=KP=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1ljebn-0002qC-Cx
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 09:04:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::62a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f81b8b64-054b-4446-897a-a3943bfad6d1;
 Thu, 20 May 2021 09:04:45 +0000 (UTC)
Received: from AM0PR04CA0079.eurprd04.prod.outlook.com (2603:10a6:208:be::20)
 by DB8PR08MB5452.eurprd08.prod.outlook.com (2603:10a6:10:111::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.31; Thu, 20 May
 2021 09:04:35 +0000
Received: from AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:be:cafe::1d) by AM0PR04CA0079.outlook.office365.com
 (2603:10a6:208:be::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Thu, 20 May 2021 09:04:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT063.mail.protection.outlook.com (10.152.16.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Thu, 20 May 2021 09:04:34 +0000
Received: ("Tessian outbound 504317ef584c:v92");
 Thu, 20 May 2021 09:04:34 +0000
Received: from dc81d4b26ba6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DFC8C732-C9E0-4F39-94E7-E6DC7235103D.1; 
 Thu, 20 May 2021 09:04:27 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dc81d4b26ba6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 May 2021 09:04:27 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VE1PR08MB4750.eurprd08.prod.outlook.com (2603:10a6:802:a2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Thu, 20 May
 2021 09:04:16 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5%6]) with mapi id 15.20.4129.035; Thu, 20 May 2021
 09:04:16 +0000
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
X-Inumbo-ID: f81b8b64-054b-4446-897a-a3943bfad6d1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwPz95NhtCV37vbe+vi/Qn9VoI07rjzr2lu7RSjYEfk=;
 b=Wevpf66CHWPx/NK7M8ldL/o1YH51LSDBuuj5gLoIQWfBduBDF2VA83YgRy2TMYl9zm7DvR9epiMZm5qbVpxyZomENa0RjoV/U8LMnLRXD/9xINVV3i3umezr1ozKpN5FDz/sQ2utvLUUIY2R/u4+GFEVImfaXqKxgN24ieo5zmc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buU7t/fXWLKqWsCEaf5y86A4wotaB9wvLGh9iiPyiHqUjw0EISCdvodxX+jVdr/xt/kjGkDXHdm7cKMZF2kyUNhC9zExuzQhWpi1QH5IMWKzAenP0L445gymV6hW+MHKgfRWoRj/A47ggyDl/QT1T3f9Tx2N5bw0MlIK020HDgk5migL49LmOjQE8KpeUOqEQjmsjiEmpLW4YJsJ6u9hq2xOaPD+Ak+RDjGEIivQIlN70Q1GBpYE0TRyxlARC7+/p26ikkdSoAqvn4ptMAXK0jg1Vo3Sg4lCo2emLpQS6st2FaKuTNq2s7fuVvlZvsMApZiGRmg+1XTPIhK7N3F1Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwPz95NhtCV37vbe+vi/Qn9VoI07rjzr2lu7RSjYEfk=;
 b=REy8WCaX3RaaqzOzggj3EOaGWBgqSZJt/q3eBTuma/yomoTIRMbgFj87fDsDAZepNK2h96dm1FnUiddvAwG7Y9QNotVbm8/Ug9twHlT3P8cire1KQiVnAb7h9vWuXkj8uV5idFtI9Gc/LKkku/HqW4R/AvTxsMXjgJvq31rxX2GNEX64r8zzVcQhO1yPV95mOvy5MtVT4pgSPygBGtPn2sYQp3qtSX5bD48KPpTTJDmGq0cdB0I5DUyy0KXLX07PBkEmzmUeOhykxAbuXfgmMi/48CwHFL7fZO4nD9tZ1YfzWtz4ADuGcUhENHpiTb0KiXvJD9POFyILfzvhuY4AYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwPz95NhtCV37vbe+vi/Qn9VoI07rjzr2lu7RSjYEfk=;
 b=Wevpf66CHWPx/NK7M8ldL/o1YH51LSDBuuj5gLoIQWfBduBDF2VA83YgRy2TMYl9zm7DvR9epiMZm5qbVpxyZomENa0RjoV/U8LMnLRXD/9xINVV3i3umezr1ozKpN5FDz/sQ2utvLUUIY2R/u4+GFEVImfaXqKxgN24ieo5zmc=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>
Subject: RE: [PATCH 04/10] xen/arm: static memory initialization
Thread-Topic: [PATCH 04/10] xen/arm: static memory initialization
Thread-Index: AQHXS6WzoKPo0e3K4EKgzRPDOGKP8Kro0+kAgAAm7iCAABMkgIADBSKg
Date: Thu, 20 May 2021 09:04:15 +0000
Message-ID:
 <VE1PR08MB52152D4CD1542D0B35CF95CDF72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-5-penny.zheng@arm.com>
 <dbffa647-37e2-93b6-4041-a1344aeb1837@suse.com>
 <VE1PR08MB5215E7203960F535BC857F5CF72C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <f9776245-0a33-4cb8-fd5a-f7be8ab38b78@suse.com>
In-Reply-To: <f9776245-0a33-4cb8-fd5a-f7be8ab38b78@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 510BFB9C37BA57438A6E2DCD4C118F7D.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e4c7848e-dedc-4186-b245-08d91b6e49b5
x-ms-traffictypediagnostic: VE1PR08MB4750:|DB8PR08MB5452:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB5452F335CA0DDB82265308C2F72A9@DB8PR08MB5452.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 f82Uk5vL5fEDsHZuLHBaTOQLdrwlIPYDZj8VIphi/nm9ZdKpWi0xZHnFYxsnzfOqYxjh96jC5qlMIX6h75tbPfloqDr0HwHqaKa9STjMCgzEM9Rij3DjDkgTfdx2qVDrmrpwIKDGCn2VOWPUvBTn42JxMzo1pQwyyIeuk3JNXuvnoS0le2ps8c93AVg8dw0OwvasDgn42AFttMjjX5Xn0vjqkadDmNxjTXdVHirF4VauLSguy6BGU6WaXPWuHU87bNYq0KEK/fa/SS8ZaN9jb6tLkFD9oAbfoWLYVmuXugN6+ZBtm1aqGXC1pZjhmuxnt549kfzmkvXP040PeVTeEFatTY0gV8RgpwHmWt70wF3UkLvfBIAhp3/D3zcbVcsFoeWZ7Tq3CpZHYLZ5VryGSTwjf2BVfBsjYCKnNESi9mRtnA7uN0mC0Ekw/OMiol2Zv5HRQ7pbo73DklmLnQ6SMAhhSunyvn5MuRhPiGlofsJjZchFXkTcrDqtTXFZQQ1PXB6fmfbg0X6ESWQsJWbAV8wiHJAhba9ON1aVa4R0VsnfHQzIylxXDrY8GGBShTFC/ouret5Da+H1MY4Ky3CPQj903dKoBiHUmKijeKABaPk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(66476007)(7696005)(478600001)(26005)(66556008)(8936002)(66446008)(2906002)(64756008)(8676002)(186003)(86362001)(54906003)(9686003)(6506007)(4326008)(6916009)(76116006)(52536014)(5660300002)(38100700002)(55016002)(53546011)(122000001)(71200400001)(66946007)(316002)(33656002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?TW94Y2I0KzZKbTZ4VUlIYnVNa2ZzQTdDM0l0R2JyLzZZazFTaDVFRE02bVJ1?=
 =?utf-8?B?TXh6T3BNV0x3VWZ6RXowckFvRVRHcmxFeXhhMFc3VUQrc0FxN0ZNRWYrZ3lG?=
 =?utf-8?B?U09kNzRDVVVVMytoVnVXR2lkdmxmcEpzNCttNnAxdXByUVZHcGs3dmtTbWlZ?=
 =?utf-8?B?T3hnOVgzSEFWbk1vaStYUzUzRWlvMkNPWHZSdVN6TUhCNDcvaFc3K3ZQK3Np?=
 =?utf-8?B?ZXFGaEJXcDJuYnNHZ1pZKzdrV0V1LzZsV1pmSUZkVG0wd0hYWUc4MUhSVjBQ?=
 =?utf-8?B?RStkYmVxb1V6TlZ5Ry9jV0U1ZFFpV2I2aDlhK1pzeUVKaVFPR0JTOTJ3YXh0?=
 =?utf-8?B?NDhUR0JmRURZMmRPL0JkMEVJajkzYVpia1JWQ3ZNZG1Iakp5amRMdEFlRXQ3?=
 =?utf-8?B?dnFBNm51Y0svOVVlaWE3UU9QQmhmOUZRVXgxVmZEVmtxemVDdEZWeGVNbEF3?=
 =?utf-8?B?dGtraHVYQ0tTRUJFVEVoZGlzQUtRSFVMM1BFV2N3NUd0ay9MODdBZlFEU2sr?=
 =?utf-8?B?dnZPQkdpRnJyWUwvamVaY3lyZFJtcGExY1ZtRXVGMVFJM2JkY1dhd05wOThu?=
 =?utf-8?B?ZTdTTFhjdE9ZZExPVm9zZXc1YkNRWG51V09rYU5XQzBPSHJNVytmM3BXcUEr?=
 =?utf-8?B?cUw1aEEyb3BwZk1SUG5mUDRXQ1N3cnZoMmlmRE9TWXZGZHUzK2o4WVc5eG5X?=
 =?utf-8?B?bklLSjkwajVPYXFUUFIwTlRxMDhIbjFtRFQvbHY3RDdha0xUcWhMQmdvcHp4?=
 =?utf-8?B?N1FZV3B6N0pZRkl0RjNKeEhIa2xUeHhnNW9sNjRqeFVqeVZzeFpkNy90MkZS?=
 =?utf-8?B?cDZVdGYvYVk0VXR4ai9ySHMvQUpsczhRNlJTc1R5Y29Yd2FLZlNLRmJoQVdp?=
 =?utf-8?B?cEluNmVuVGl2a0wxZzlxaWtuZlVVbG9LL3I4M2lIdW9NTHdLZEhId1RFeTEx?=
 =?utf-8?B?V3l1S2JzVW5IeGdiS0taWWloeU9jSTZ6Uy95am5lWDZnaFE1WW15MzZuSGs4?=
 =?utf-8?B?ZEd2a2RuUnUzQ09PdjQ3emdWNUNibUNBSEpHcmFzdzVPQ3laYVBJMEdiTXpY?=
 =?utf-8?B?VzNxd1JYK2tBWXJSOWhiVFNRQVptWGxUM1AwN3Q5SmJId01uWE1iNERwUDNr?=
 =?utf-8?B?SzJiN1p3S25SRUMzc0lvREd0b3Y4TFZmcG1FT1REUEs2Z1VqV1pHdGZxNEdV?=
 =?utf-8?B?TXZoWDlqZmR1ckZqYy9mZmF6TEdNalUrdzljLzcyTjNiMTJVNnBJTEMvREdE?=
 =?utf-8?B?eXkvWFJHSkpwMC9Ldy9kU25YakZWUno5OHkydTFBOVVuTitKYlcvbm1UYnF1?=
 =?utf-8?B?R1dzQmVCcHVnTFhadjZaNWhINE5ObVNWOEVwUVc5ZzlFa3NmcTQ4MEkxaTFS?=
 =?utf-8?B?YndZK2x4UXRaRlpTOWxkNjY3SThMblMySUJ1bEFGV3dWbGoxRUM3MDkrekpi?=
 =?utf-8?B?VG1rSjl3aHhkd05RanhRY3lOZU5STXZ6QVNISSs2Vk9oczV6MHhoWHM2VTlx?=
 =?utf-8?B?T2FxYkw4czViamRXUHk2M2U0dG0yaGt3eFdHTERBUURHT0J2dDV5bjZEUGRk?=
 =?utf-8?B?ekhhYStKVjZ1cEJtc08ybVkweHlEb0swc0VBdW1KSVAzV0NJMXVhVUJIcWhC?=
 =?utf-8?B?dFpmY0FxaDR0QUZBRXhLTmovdUJ0bXNUempWOWN0d2IxZnM3c2JuUEZFLzFs?=
 =?utf-8?B?ZlkrbEpyMkFFYzljQ0NpSWlTR2kvaHcrMGxBTzA3OWhPNU5kTWRlTmhBRjRF?=
 =?utf-8?Q?7PLi/T4G9o4zsdfS4hANE3vUGZ4DaHzuNSP7cAN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4750
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4f7ed585-e383-4adf-d2ce-08d91b6e3ea1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3E6TaYjNeAb/J88t4uRIzoDKjtRUl7BxL45+f1Oh3LcYlQYFtqT8FMpFyg6wmzOdpT6WEkkE/Y4X7eTCmyIADQW+iOa2vA9bU3bX6AcTPtQuN2ekMgtLHWUfrzhpdWTVsgCOFKuapHSeNR2HLDzw+YrZRW4Z07bWhKC/h1RgrRkgOC2DavKitTTmnE+9GxuFO5fSsay3BjrZc5rqVNc2OWU6R8NUFNGD+RylZ9rLmDO6ONKQXHWHkex3z69A93xiAa7lesltDxCIaOBmPoznR+3ClpbAYeapjfswb/uAe8yQNH6Bg7j3Iyu4C0TqBC+iizkPwP11+N40VcNUK/RZ4zJ1z9Rksn4pJo9p6P5Oo1Bts385j1qRquHdsNkAAT3TDZ2xcFAXAk3skQqmPeux+HvxztICT0O4l2V+ylTPhKBAmwMHNmkptANoa/bUF2cV1/bP52IP/YkchTlLAnV7ritlyTVgaYDTd/tXavhsiENIHWkDvLVrpiyalnN5Z3oqrjp4YIlJr3V140jiIbzLnPT9zRJ0IblbAzYp+B4jqbMyyvrbaW9/l2MrifoFAwX7T1/9uBNdwL0E9rSIOT/C3bS3qrJsz7LHyliDov9qA+ZPcywZkX1IG+4ujSUyCYeNnUzFBd4wX411YuaTpIexC3DDeh+bJJqAbwPpSZR/+FA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(36840700001)(46966006)(82740400003)(54906003)(6506007)(26005)(6862004)(186003)(55016002)(52536014)(9686003)(5660300002)(70586007)(336012)(47076005)(70206006)(8676002)(7696005)(53546011)(478600001)(82310400003)(356005)(36860700001)(86362001)(83380400001)(316002)(8936002)(2906002)(81166007)(4326008)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 09:04:34.6023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c7848e-dedc-4186-b245-08d91b6e49b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5452

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMTgsIDIwMjEgNjo0
MyBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+IENjOiBCZXJ0
cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8V2Vp
LkNoZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIDA0LzEwXSB4ZW4vYXJtOiBzdGF0aWMgbWVtb3J5IGluaXRpYWxpemF0
aW9uDQo+IA0KPiBPbiAxOC4wNS4yMDIxIDExOjUxLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPj4g
RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiBUdWVzZGF5
LCBNYXkgMTgsIDIwMjEgMzoxNiBQTQ0KPiA+Pg0KPiA+PiBPbiAxOC4wNS4yMDIxIDA3OjIxLCBQ
ZW5ueSBaaGVuZyB3cm90ZToNCj4gPj4+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBzdGF0aWMgbWVt
b3J5IGluaXRpYWxpemF0aW9uLCBkdXJpbmcgc3lzdGVtDQo+ID4+PiBSQU0gYm9vdA0KPiA+PiB1
cC4NCj4gPj4+DQo+ID4+PiBOZXcgZnVuYyBpbml0X3N0YXRpY21lbV9wYWdlcyBpcyB0aGUgZXF1
aXZhbGVudCBvZiBpbml0X2hlYXBfcGFnZXMsDQo+ID4+PiByZXNwb25zaWJsZSBmb3Igc3RhdGlj
IG1lbW9yeSBpbml0aWFsaXphdGlvbi4NCj4gPj4+DQo+ID4+PiBIZWxwZXIgZnVuYyBmcmVlX3N0
YXRpY21lbV9wYWdlcyBpcyB0aGUgZXF1aXZhbGVudCBvZg0KPiA+Pj4gZnJlZV9oZWFwX3BhZ2Vz
LCB0byBmcmVlIG5yX3BmbnMgcGFnZXMgb2Ygc3RhdGljIG1lbW9yeS4NCj4gPj4+IEZvciBlYWNo
IHBhZ2UsIGl0IGluY2x1ZGVzIHRoZSBmb2xsb3dpbmcgc3RlcHM6DQo+ID4+PiAxLiBjaGFuZ2Ug
cGFnZSBzdGF0ZSBmcm9tIGluLXVzZShhbHNvIGluaXRpYWxpemF0aW9uIHN0YXRlKSB0byBmcmVl
DQo+ID4+PiBzdGF0ZSBhbmQgZ3JhbnQgUEdDX3Jlc2VydmVkLg0KPiA+Pj4gMi4gc2V0IGl0cyBv
d25lciBOVUxMIGFuZCBtYWtlIHN1cmUgdGhpcyBwYWdlIGlzIG5vdCBhIGd1ZXN0IGZyYW1lDQo+
ID4+PiBhbnkgbW9yZQ0KPiA+Pg0KPiA+PiBCdXQgaXNuJ3QgdGhlIGdvYWwgKGFzIHBlciB0aGUg
cHJldmlvdXMgcGF0Y2gpIHRvIGFzc29jaWF0ZSBzdWNoDQo+ID4+IHBhZ2VzIHdpdGggYSBfc3Bl
Y2lmaWNfIGRvbWFpbj8NCj4gPj4NCj4gPg0KPiA+IEZyZWVfc3RhdGljbWVtX3BhZ2VzIGFyZSBh
bGlrZSBmcmVlX2hlYXBfcGFnZXMsIGFyZSBub3QgdXNlZCBvbmx5IGZvcg0KPiBpbml0aWFsaXph
dGlvbi4NCj4gPiBGcmVlaW5nIHVzZWQgcGFnZXMgdG8gdW51c2VkIGFyZSBhbHNvIGluY2x1ZGVk
Lg0KPiA+IEhlcmUsIHNldHRpbmcgaXRzIG93bmVyIE5VTEwgaXMgdG8gc2V0IG93bmVyIGluIHVz
ZWQgZmllbGQgTlVMTC4NCj4gDQo+IEknbSBhZnJhaWQgSSBzdGlsbCBkb24ndCB1bmRlcnN0YW5k
Lg0KPiANCg0KV2hlbiBpbml0aWFsaXppbmcgaGVhcCwgeGVuIGlzIHVzaW5nIGZyZWVfaGVhcF9w
YWdlcyB0byBkbyB0aGUgaW5pdGlhbGl6YXRpb24uDQpBbmQgYWxzbyB3aGVuIG5vcm1hbCBkb21h
aW4gZ2V0IGRlc3Ryb3llZC9yZWJvb3RlZCwgeGVuIGlzIHVzaW5nIGZyZWVfZG9taGVhcF9wYWdl
cywNCndoaWNoIGNhbGxzIGZyZWVfaGVhcF9wYWdlcyB0byBmcmVlIHRoZSBwYWdlcy4NCg0KU28g
aGVyZSwgc2luY2UgZnJlZV9zdGF0aWNtZW1fcGFnZXMgaXMgdGhlIGVxdWl2YWxlbnQgb2YgdGhl
IGZyZWVfaGVhcF9wYWdlcyBmb3Igc3RhdGljDQptZW1vcnksIEknbSBhbHNvIGNvbnNpZGVyaW5n
IGJvdGggdHdvIHNjZW5hcmlvcyBoZXJlLiBBbmQgaWYgaXQgaXMgZG9tYWluIGdldCBkZXN0cm95
ZWQvcmVib290ZWQsDQpQYWdlIHN0YXRlIGlzIGluIGludXNlIHN0YXRlKFBHQ19pbnVzZSksIGFu
ZCB0aGUgcGFnZV9pbmZvLnYuaW51c2UuZG9tYWluIGlzIGhvbGRpbmcgdGhlDQpkb21haW4gb3du
ZXIuDQpXaGVuIGZyZWVpbmcgdGhlbiwgd2UgbmVlZCB0byBzd2l0Y2ggdGhlIHBhZ2Ugc3RhdGUg
dG8gZnJlZSBzdGF0ZShQR0NfZnJlZSkgYW5kIHNldCBpdHMgaW51c2Ugb3duZXIgdG8gTlVMTC4N
Cg0KSSdsbCBjbGFyaWZ5IGl0IG1vcmUgY2xlYXJseSBpbiBjb21taXQgbWVzc2FnZS4NCg0KPiA+
IFN0aWxsLCBJIG5lZWQgdG8gYWRkIG1vcmUgZXhwbGFuYXRpb24gaGVyZS4NCj4gDQo+IFllcyBw
bGVhc2UuDQo+IA0KPiA+Pj4gQEAgLTE1MTIsNiArMTUxNSw0OSBAQCBzdGF0aWMgdm9pZCBmcmVl
X2hlYXBfcGFnZXMoDQo+ID4+PiAgICAgIHNwaW5fdW5sb2NrKCZoZWFwX2xvY2spOw0KPiA+Pj4g
IH0NCj4gPj4+DQo+ID4+PiArLyogRXF1aXZhbGVudCBvZiBmcmVlX2hlYXBfcGFnZXMgdG8gZnJl
ZSBucl9wZm5zIHBhZ2VzIG9mIHN0YXRpYw0KPiA+Pj4gK21lbW9yeS4gKi8gc3RhdGljIHZvaWQg
ZnJlZV9zdGF0aWNtZW1fcGFnZXMoc3RydWN0IHBhZ2VfaW5mbyAqcGcsDQo+ID4+IHVuc2lnbmVk
IGxvbmcgbnJfcGZucywNCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBi
b29sIG5lZWRfc2NydWIpDQo+ID4+DQo+ID4+IFJpZ2h0IG5vdyB0aGlzIGZ1bmN0aW9uIGdldHMg
Y2FsbGVkIG9ubHkgZnJvbSBhbiBfX2luaXQgb25lLiBVbmxlc3MNCj4gPj4gaXQgaXMgaW50ZW5k
ZWQgdG8gZ2FpbiBmdXJ0aGVyIGNhbGxlcnMsIGl0IHNob3VsZCBiZSBtYXJrZWQgX19pbml0IGl0
c2VsZiB0aGVuLg0KPiA+PiBPdGhlcndpc2UgaXQgc2hvdWxkIGJlIG1hZGUgc3VyZSB0aGF0IG90
aGVyIGFyY2hpdGVjdHVyZXMgZG9uJ3QNCj4gPj4gaW5jbHVkZSB0aGlzIChkZWFkIHRoZXJlKSBj
b2RlLg0KPiA+Pg0KPiA+DQo+ID4gU3VyZSwgSSdsbCBhZGQgX19pbml0LiBUaHguDQo+IA0KPiBE
aWRuJ3QgSSBzZWUgYSAybmQgY2FsbCB0byB0aGUgZnVuY3Rpb24gbGF0ZXIgaW4gdGhlIHNlcmll
cz8gVGhhdCBvbmUgZG9lc24ndA0KPiBwZXJtaXQgdGhlIGZ1bmN0aW9uIHRvIGJlIF9faW5pdCwg
aWlyYy4NCj4gDQo+IEphbg0KDQpDaGVlcnMNCg0KUGVubnkNCg==

