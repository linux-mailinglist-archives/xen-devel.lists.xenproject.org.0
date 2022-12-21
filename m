Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A67BB65320A
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 14:50:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467948.727014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7zTR-0001XR-T1; Wed, 21 Dec 2022 13:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467948.727014; Wed, 21 Dec 2022 13:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7zTR-0001Uw-PM; Wed, 21 Dec 2022 13:49:33 +0000
Received: by outflank-mailman (input) for mailman id 467948;
 Wed, 21 Dec 2022 13:49:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KbXi=4T=citrix.com=prvs=34759bb5a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p7zTP-0001Uq-JD
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 13:49:31 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 492a4be0-8136-11ed-8fd4-01056ac49cbb;
 Wed, 21 Dec 2022 14:49:29 +0100 (CET)
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 08:49:20 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB4989.namprd03.prod.outlook.com (2603:10b6:208:1a5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 13:49:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 13:49:17 +0000
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
X-Inumbo-ID: 492a4be0-8136-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671630569;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=3uoNZX2mf0/RXAhrZp96GWhUXLYGz3XFWetNqWH/k2c=;
  b=A7gFaMPzrtnJ4CLOl/zDRgE750Sr7DtGKsztqEeM8j24sh1792VlbOIN
   67XNtrjJjx+RWMzi8y2PgjY4YYhh9hEvrhGLXKBmmtqZ38NJdt1ykMBMG
   J+QERGpFEE6yu4oZKTww75RoTLhQwUX2NlaKUOPhRjZOJPoIlmohSKZPE
   c=;
X-IronPort-RemoteIP: 104.47.55.177
X-IronPort-MID: 88978893
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OZumd6AfuqyJCRVW/xjiw5YqxClBgxIJ4kV8jS/XYbTApDshhGBWm
 GRKDTiEaf/cNGqhedxyOdnj8B4P7MXXztRqQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WlC5wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw5Oh6HmZWx
 awjGnMBTzKSg/2ymbyec7w57igjBJGD0II3nFhFlGucJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuvDe7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr+fzHyrCNNJfFG+3qRjqlHNz1M9NCwLfBikgvLgzUG8B90Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHr7m9WX+bsLCOoluaJSkQBX8PY2kDVwRt3jX4iIQ6jxaKRNAzFqew14fxAWupn
 G/MqzUijbIOi8JNz7+84V3MnzOroN7OUxIx4QLUGGmi62uVebKYWmBh0nCDhd4oEWpTZgPpU
 KQs8yRG0N0zMA==
IronPort-HdrOrdr: A9a23:gQDXV6HWFYsSPtd8pLqE2ceALOsnbusQ8zAXPhZKOHlom62j5r
 uTdZEgv3LJYVkqKRYdcLy7SdC9qBDnlKKdg7NhWYtKNTOO0ACVxedZnOjfKhLbak/DH4VmpM
 FdmsZFeaXN5JtB4voSIjPVLz/t+re6GWmT5dvj8w==
X-IronPort-AV: E=Sophos;i="5.96,262,1665460800"; 
   d="scan'208";a="88978893"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7ehrLXtvFEvglXn2zjdTznj86nq2EoU9LiCwoFtTJ0q//pXLtk14IMvWv7YJaRZ2hEIGGg2VVCJnQj/L6Qf0Wc+4xqTcBtRN9DnDzNWPHg33dk2YugM8ZDGcMvPfWmDyQJizd/+GVdLdWQjcuSqUF9HjjH38Cj+61OnFTyuMjCr2DW+Lutu6RKHhexnC8dtTA4ADpu3eqJAtCNqSFmp7/dZCz83S9NIzyvWDnbpCPGlyyIIUFG57PlP3qKHIk8oH0C68dX66zFa/xF6pO1eBAuRC11y7GwTdpbVwbDNMxsvda0edgNp9px/lGx/J/mcCuJNsMD68uE7DYNy4S6FIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uoNZX2mf0/RXAhrZp96GWhUXLYGz3XFWetNqWH/k2c=;
 b=bIJQxgA9h5vKwJxWTSGR/LcNepDrVQCfAuqqPzF5/KlnVTHBjU0ZZieuyOcpRDO9hQODDclkuDbg4iWbxbdOyK5uNMzyaVCBFzASjz49UOslhTy4L6KZgFodn3jFt0pyxT9xgxW5Psm0bs4bbJVL7cVdjeuilDlb29pJONh/g0B191RsZ9ccSycJNpMByKC3So17f9A1l3C2vpFsxSTY8612Gbyc2OuMUXqwJUXDg2tyUoOqtI+0wzutOw8/3yXkf5+5DYyU2KNU2L1a7jZxXyPQU/6NcTj0RlDGRa3DwCSUXZsX0Gbgquf/1q784YVNHirU1GgqFz02+J7Ro490iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uoNZX2mf0/RXAhrZp96GWhUXLYGz3XFWetNqWH/k2c=;
 b=e17QTRR1CrvHKOtA5SDvBnPHEIeiDR2E18aMN74Fr9TFmEhpcLa5xxuLZ4IEk2TVaVsCigHVfjXeVPCCyD77++AWL9db8kksSbHne1oeW1KesdVBjrgORsg9MKyWcqASNiKrYmBoKHO+v8MJtVoyvTonZmFD2getbt9HI7HhLH4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 1/8] x86/paging: fold HAP and shadow memory alloc related
 fields
Thread-Topic: [PATCH 1/8] x86/paging: fold HAP and shadow memory alloc related
 fields
Thread-Index: AQHZFT+bjE/YAX9/X0eeHf49kbkoQK54W4gA
Date: Wed, 21 Dec 2022 13:49:17 +0000
Message-ID: <ef7d0d5d-de03-a0cb-351a-d4b0993b9268@citrix.com>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
 <660507f9-87fd-1061-1fa0-2aeb42ac2eef@suse.com>
In-Reply-To: <660507f9-87fd-1061-1fa0-2aeb42ac2eef@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB4989:EE_
x-ms-office365-filtering-correlation-id: b9d48037-3249-4bba-0077-08dae35a278e
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 QWODp4IuPGTkEzoCLLx2NdauU8xqFdoclVWp6V1bJcYBdagSqUgfdyDI/QCQO5KPEpPaibj3deVNPgGMn5kZz3cXM5GUInEFQNftGIucYH3qQM2RP+O9M7aJk2SA0022hqGJwIRooxaCt8UVOiBjLhIDsN9sSVeT9+sh9rvL/SjVWk9Y/zzaop94ILodcc1VcFRaxp13Zk7Z6UV4joivbHawcWyeCMtXATdwdEvcH8HRg81cgV2e1Ty6cgaUisybFJPYDY2hrBJ3ucOY2mrX+1jcvirpSoE5Q5yowwA5nDAezYMCgSTUuQdPTed+3JEQQWSP2iYUxTWFC2m9Ug7mDJ5rmfDv5oNNuC5f9L5ApBI/chJyL2/0YGWDsOUwO89iraeVYq6QWgM8J+eJuzaeGObdBFq0o8uq1ZUPUhP/dbTffr+E0sJC0qXPvquYdH0MH7bsQrygw7jlLVsCGZqm3E9emayTEyiT5/D6ShIHpftJ9zKPHrbWM4Wz5g4d+agKQhUDi8OuCYQcPq15s7tvn7RhXCO/x9jz64pSG3Sp6VJf33yvZJgqoCVatNSA6VZJE5bVemkSvgz9Enf1MfcAbE+UF6r3ZcfesU8edLw/v6uKeBDTvPKC9vJ5WTWJrKjLXd1FkFuTgVYwqDBkX7cK4jD+TPu4wdVsreTj/fwasU0ZtHPASMivakQHD5xFIQy4tGn1XGj/PnRgVpEsnPD/2BrWNNMMUeB8bwGqLVsSvtjMuch95NZXbEeBWQcSZoOXPrcvRLJpC09+3sE3hmSMXg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(451199015)(6506007)(478600001)(6486002)(36756003)(54906003)(71200400001)(2906002)(26005)(186003)(38070700005)(64756008)(41300700001)(31696002)(8676002)(4326008)(66446008)(66946007)(66556008)(5660300002)(76116006)(66476007)(316002)(91956017)(8936002)(110136005)(53546011)(122000001)(82960400001)(6512007)(31686004)(86362001)(38100700002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NXRMemVtTFNJQzIyRzhIMktvek5ReXBNenNGRWlac0d4VmI1UkNzR0piWWZW?=
 =?utf-8?B?Smw0OXIzVFJrRC9SWHVMYTVEYVg4ZWRMV25VTDVFN2UramZVVi9zUVZtQ2Vx?=
 =?utf-8?B?M2dDaXhkTWNaZGtmNXdnaXRjSkIxNkhWOFhWWVpzS2lORkJYb2ZidmtEOEQ3?=
 =?utf-8?B?dUdhTkdscVVCQnJPMXBmbVliRTQ3UW1HNFBqcVl2VUdRTStLa0NqOXliWVl3?=
 =?utf-8?B?Q0NWMGdIdTM2MitWTm0xWlVBVXRPVUxQRkdCTXlOQTJLZnl5dHZPZjhFUVA4?=
 =?utf-8?B?RFl5cDhpb3BOckc4UVlnSENwSHc0NFNaK3BSZHBpclhlODc3b0ovSEhpY0VV?=
 =?utf-8?B?UVZENjFKb3QyN0pwWkl4UUhEVnNMSXZ1bGo5dVF5b3ExQ1E2MVloM0MwZG5a?=
 =?utf-8?B?SFFCbjRFLzVhb1RDSk52SDRsUFQ0dCtuV0VaTUk0d1JRNE05eG05UG12Ykx3?=
 =?utf-8?B?VDU4STZySHRWT3J0c2tqRTZUbitRdGFta1lCYzVYK0ltcnV2bFJpZW1wNjBM?=
 =?utf-8?B?VU1GdHNZZ3dWYk5KS2lWbVZVeDhIVVZHek0rcFZ6YTRoT0tpWVJEbDNSY09K?=
 =?utf-8?B?ckkvNEh5elZVbHMvUkowYlhJdnJyYmZ5NWpQMm5RNG1DMmdHQ3U3ZEQydW4z?=
 =?utf-8?B?bXVlWmpUVGo4ZGVCTldSZVVWWUszNkFQRisyb2tXNDVTcStKV2kxbE0xVXFG?=
 =?utf-8?B?OHVnZDhMK1Y1T1RZbHdTQjR5R1IzaXRKUE53UkZoZk1BQ0JpYndOeDFpdS9C?=
 =?utf-8?B?QzBCYkZ2VVFISFRIMFpZSFNDZzBUcy90a2thaFpQV2JwczYzWThURkpvSC9N?=
 =?utf-8?B?T0YvUS9uT1hTY1VwWjVoUHI0U2VwNXp6dGt3dTZzOTloS3lWZXFzVWphNlF2?=
 =?utf-8?B?TWNuN2ErOXNFL3JGWWQxcDArTEdEZUVlV2lNTUd3cGFTUFRWcFNLc3hEaHBx?=
 =?utf-8?B?WFpPeGNrc2pFb2RpRHRPMVlsNTBoN2cvcm5xVlpMb2dSTFVjSERxbGFjVVEr?=
 =?utf-8?B?dDN3NWExTTlHclVEb1lCclF6ZVhITWlOYnlpL2dsSEZxUHR3bnV2QkN6dkNP?=
 =?utf-8?B?VndjY3pGSjdBeFVJV1Q2Lzg0dWkwVzZpYXQwSXNwdUJpVzZ2UDFneXdlODlN?=
 =?utf-8?B?SHZUSUovbkZKcUVkOUdQTVpKczNpcE5hV21jQVFTSng0dUxIK1Y3VEdpYWtS?=
 =?utf-8?B?cUZwd25mbXAwOXpPeGY3ME1hVUVWYk1tZys5TURSVk02NHpRNUNlMWFFUTQ3?=
 =?utf-8?B?OE83U0dUMkg0ckloemk1cnVJSFlUWDg1bXd0RnBaOExhV3VKRWNmTmZPa2oz?=
 =?utf-8?B?L2JpNUNhQUhIbHFIWTFjMGx6OXR4NlJMa0NyaitaeVduVmRIZXFrQ0VQUUJn?=
 =?utf-8?B?c2htL3VtOFN5a1d0Y2QxWGFMbTAyN2k0c1V3L1NuVzArc2xGZURTMTRVUDJJ?=
 =?utf-8?B?Y2drdkxuL2ZJMXJDQnN4dkRGQ1htbFB0WUlOeGVSc0lVTjdBNUxtZHV1WVNK?=
 =?utf-8?B?eStyYVYvQlZ1ZG1ULzVlRHRCeEZITVpWZFpZRnljWmhyM2FpMWM0R3pTWmcx?=
 =?utf-8?B?cU04b0xjSkFpYUVkUW5GWVNwdVNmYnB3NTl3NGp3RHBzZ1VLSGI1T3dyVXVV?=
 =?utf-8?B?Y1NYdUJ1djh6U29KeTlVTmVNTllRRWFJanJ1U3lYeWVibzJnVHBhRFY4KzJ4?=
 =?utf-8?B?WVkyOHhIeEpEZ1V0Z2o1MlpiTW9sRzZxT00vbFArQ1YvblFKNGIydFJlMW5S?=
 =?utf-8?B?TlJKWDB5VUtYREhIaU9lb1dWTDdTeVd6QUM1UUEwVDlnUlkxKzBZTGhsSUMx?=
 =?utf-8?B?K1hnTEpFMjl4bXh6cU5acEFSMUtuNVM3SmgvODJGNnVEWEZlMlpVRDJUREI2?=
 =?utf-8?B?Smk2azMvR0l6Q2VtS29uR2dMV1BYMjZsWFhaMWJLamljWEQzbjBleHZmMUx3?=
 =?utf-8?B?YlFrbzBzd05ENUxWeFlrMk1adlRuTlRKeVhPM3VJbUYxS05SV2JkcDFIVHY4?=
 =?utf-8?B?bVdGY1g2Mk1BRkVRUkxBM05nKzQwYUJpaUMyMWU2NXp4L0tRQUI4dEVIZEhH?=
 =?utf-8?B?SkRFUUZzSUp6eEVwVXFJbFpYUlQwSG1GYkJPY3RjUTlKeEhCV1FHV1BSdFNt?=
 =?utf-8?Q?yTdS0gI+M5uSCSSA4wCwOJkHu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0B4819C0285EF4FBD6CAED658E6E3CB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d48037-3249-4bba-0077-08dae35a278e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2022 13:49:17.6369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xkJ9qGurXdWJXIm4TWw2c6OmToYJwZsoCa6Q+ZjgRS3lWIhnrvFsFZCRm+F5yXpVjct4mksTjm01dv/3HO2OAfsCzQNyDoGN9Rol9lyFIRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4989

T24gMjEvMTIvMjAyMiAxOjI0IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gRXNwZWNpYWxseSB3
aXRoIHN0cnVjdCBzaGFkb3dfZG9tYWluIGFuZCBzdHJ1Y3QgaGFwX2RvbWFpbiBub3QgbGl2aW5n
IGluDQo+IGEgdW5pb24gaW5zaWRlIHN0cnVjdCBwYWdpbmdfZG9tYWluLCBsZXQncyBhdm9pZCB0
aGUgZHVwbGljYXRpb246IFRoZQ0KPiBmaWVsZHMgYXJlIG5hbWVkIGFuZCB1c2VkIGluIGlkZW50
aWNhbCB3YXlzLCBhbmQgb25seSBvbmUgb2YgSEFQIG9yDQo+IHNoYWRvdyBjYW4gYmUgaW4gdXNl
IGZvciBhIGRvbWFpbi4gVGhpcyB0aGVuIGFsc28gcmVuZGVycyBpbnZvbHZlZA0KPiBleHByZXNz
aW9ucyBzbGlnaHRseSBtb3JlIGxlZ2libGUuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+LCB3aXRoIHR3byBtaW5vcg0Kc3VnZ2VzdGlvbnMuDQoN
Cj4gLS0tDQo+IFF1aXRlIGxpa2VseSBtb3JlIGZvbGRpbmcgb2YgY29kZSBpcyBwb3NzaWJsZSB3
aXRoIHRoaXMuIEZvciBleGFtcGxlDQo+IHtoYXAsc2hhZG93fV9zZXRfYWxsb2NhdGlvbigpIGFy
ZSBub3cgeWV0IG1vcmUgc2ltaWxhciB0aGFuIHRoZXkgYWxyZWFkeQ0KPiB3ZXJlLg0KDQpUQkgs
IEkgdGhpbmsgaXQgd2FudHMgdG8gZ28gZnVydGhlciBzdGlsbC7CoCBwYWdpbmdfbWVtcG9vbCB3
YXMNCmludGVudGlvbmFsbHkgY29tbW9uIGJlY2F1c2UgYWxsIEhBUCBhcmNoaXRlY3R1cmVzIG5l
ZWQgaXQsIGFuZCBJIHJlYWxseQ0KZG9uJ3Qgd2FudCB0byBiZSBwbGF5aW5nIFhTQS00MTAgd2l0
aCBldmVyeSBuZXcgYXJjaGl0ZWN0dXJlLg0KDQpCdXQgdGhpcyBpcyBmaW5lIHRvIGRlZmVyIHVu
dGlsIGZ1cnRoZXIgd29yay4NCg0KPiAtLS0gYS94ZW4vYXJjaC94ODYvaW5jbHVkZS9hc20vZG9t
YWluLmgNCj4gKysrIGIveGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2RvbWFpbi5oDQo+IEBAIC0x
NzksMTAgKzE3Myw2IEBAIHN0cnVjdCBzaGFkb3dfdmNwdSB7DQo+ICAvKiAgICAgICAgICAgIGhh
cmR3YXJlIGFzc2lzdGVkIHBhZ2luZyAgICAgICAgICAqLw0KPiAgLyoqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKi8NCj4gIHN0cnVjdCBoYXBfZG9tYWluIHsN
Cj4gLSAgICBzdHJ1Y3QgcGFnZV9saXN0X2hlYWQgZnJlZWxpc3Q7DQo+IC0gICAgdW5zaWduZWQg
aW50ICAgICAgdG90YWxfcGFnZXM7ICAvKiBudW1iZXIgb2YgcGFnZXMgYWxsb2NhdGVkICovDQo+
IC0gICAgdW5zaWduZWQgaW50ICAgICAgZnJlZV9wYWdlczsgICAvKiBudW1iZXIgb2YgcGFnZXMg
b24gZnJlZWxpc3RzICovDQo+IC0gICAgdW5zaWduZWQgaW50ICAgICAgcDJtX3BhZ2VzOyAgICAv
KiBudW1iZXIgb2YgcGFnZXMgYWxsb2NhdGVkIHRvIHAybSAqLw0KPiAgfTsNCg0KRG8gd2Ugd2Fu
dCB0byBkcm9wIGhhcF9kb21haW4/wqAgSSBjYW4ndCBmb3JzZWUgbmVlZGluZyB0byBwdXQgYW55
dGhpbmcNCmJhY2sgaW50byBpdC4NCg0KPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vcGFnaW5nLmMN
Cj4gKysrIGIveGVuL2FyY2gveDg2L21tL3BhZ2luZy5jDQo+IEBAIC05NzksMTcgKzk4MCwxNyBA
QCBpbnQgX19pbml0IHBhZ2luZ19zZXRfYWxsb2NhdGlvbihzdHJ1Y3QNCj4gIA0KPiAgaW50IGFy
Y2hfZ2V0X3BhZ2luZ19tZW1wb29sX3NpemUoc3RydWN0IGRvbWFpbiAqZCwgdWludDY0X3QgKnNp
emUpDQo+ICB7DQo+IC0gICAgaW50IHJjOw0KPiArICAgIHVuc2lnbmVkIGxvbmcgcGFnZXM7DQo+
ICANCj4gICAgICBpZiAoIGlzX3B2X2RvbWFpbihkKSApICAgICAgICAgICAgICAgICAvKiBUT0RP
OiBSZWxheCBpbiBkdWUgY291cnNlICovDQo+ICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsN
Cj4gIA0KPiAtICAgIGlmICggaGFwX2VuYWJsZWQoZCkgKQ0KPiAtICAgICAgICByYyA9IGhhcF9n
ZXRfYWxsb2NhdGlvbl9ieXRlcyhkLCBzaXplKTsNCj4gLSAgICBlbHNlDQo+IC0gICAgICAgIHJj
ID0gc2hhZG93X2dldF9hbGxvY2F0aW9uX2J5dGVzKGQsIHNpemUpOw0KPiArICAgIHBhZ2VzID0g
ZC0+YXJjaC5wYWdpbmcudG90YWxfcGFnZXM7DQo+ICsgICAgcGFnZXMgKz0gZC0+YXJjaC5wYWdp
bmcucDJtX3BhZ2VzOw0KDQpBbnkgY2hhbmNlIEkgY2FuIHRhbGsgeW91IGludG8gaGF2aW5nIGEg
c2Vjb25kIHNwYWNlIGJlZm9yZSB0aGUgPSwgc28gd2UNCmdldDoNCg0KcGFnZXPCoCA9IGQtPmFy
Y2gucGFnaW5nLnRvdGFsX3BhZ2VzOw0KcGFnZXMgKz0gZC0+YXJjaC5wYWdpbmcucDJtX3BhZ2Vz
Ow0KDQpuaWNlbHkgYWxpZ25lZCB2ZXJ0aWNhbGx5Pw0KDQp+QW5kcmV3DQo=

