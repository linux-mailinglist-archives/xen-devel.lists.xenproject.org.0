Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 069773F91DC
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 03:16:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173355.316321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQTl-0004A6-7X; Fri, 27 Aug 2021 01:16:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173355.316321; Fri, 27 Aug 2021 01:16:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQTl-00047T-3X; Fri, 27 Aug 2021 01:16:21 +0000
Received: by outflank-mailman (input) for mailman id 173355;
 Fri, 27 Aug 2021 01:16:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zv0+=NS=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJQTj-00047N-EM
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 01:16:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.62]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ffacee1-5c28-4286-94ad-34b043a7a9b9;
 Fri, 27 Aug 2021 01:16:16 +0000 (UTC)
Received: from DB6PR0202CA0014.eurprd02.prod.outlook.com (2603:10a6:4:29::24)
 by DB6PR0801MB1781.eurprd08.prod.outlook.com (2603:10a6:4:3c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Fri, 27 Aug
 2021 01:16:13 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::39) by DB6PR0202CA0014.outlook.office365.com
 (2603:10a6:4:29::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Fri, 27 Aug 2021 01:16:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 01:16:13 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Fri, 27 Aug 2021 01:16:13 +0000
Received: from 71a9586149b5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 87356C9B-D2AB-4381-90C8-FBD42D3301C0.1; 
 Fri, 27 Aug 2021 01:16:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 71a9586149b5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 27 Aug 2021 01:16:07 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB5980.eurprd08.prod.outlook.com (2603:10a6:10:206::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 27 Aug
 2021 01:15:53 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Fri, 27 Aug 2021
 01:15:53 +0000
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
X-Inumbo-ID: 3ffacee1-5c28-4286-94ad-34b043a7a9b9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+RoZc/RGv/NDI2sxe0nzGMPaWN89GU+f9KcN8sW1nA=;
 b=tnof0ipYyh3QUCYoHE67jFAwhnGuqdKP3cptaU7H6SZYt2mTkLzaA1DCYul5jtkkdHdeowGcquawQAr/Ac6ocC14oyvNihBMij3Mdlwc4ilvPbKhvBJsKHCBYxoyWnxtOaIJE8sMXrT2rexNgzM2kzwjsgOpzGyRb97ZmHWLEoQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QapLY6h7JZiNPIVskeMjsX4YsFSgiO8pm24cfqQPPw2hIhX+goYS9oEkTLw28mt1/++JvbEfoz/IAO0PovfWZ+D9Dgp3Nm/uvCRI3jleTSMJiNAp5nVGSv1x9wuNgZaYek4N0SwkDcJb6gJd+AjHAh8y0CApJWrOd3AMfCCagmmDNUOXDOJhKBm5htZtErpDWtoWSnj4d4/QxNZ81mYZxfvoW9ma6yxZeI+C1ViOjKwzjlZ62uEB7SKRq+3LriRV78m0N7hjoLdarZQW8qyE7PEviWEeFf+bRN4O+lGzlD878T20DFOh6XUmDIzNZdcaUxDZLHS07I050kdZuIZewA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+RoZc/RGv/NDI2sxe0nzGMPaWN89GU+f9KcN8sW1nA=;
 b=L382ITN4EXOpqS32V7CYVM4D3B5K4kaX/7sujtXAzNhVpgeFCZ2r98wKErd7klWeAwI9GO2ohv5ld1vNUetUbBULCZofEdqWcrbzbKF3fxcO7tJY8qRIe0mWY0l7jHOoH+Al9dzqPLPsqOZJPkDUyWvZ5sPAH7NqhpsImn7EU17mbMDvzsZ9hQ8KUvbbSD/O73zpBlzGEiwW81rIjxmz8Wh+gYYfMYGpz/UZkoAFVvDtZ5jkus/UA7pH0zQapXSbyNLzTPTWheBg2CpUPxHKlIo1sWUqNYApRcvjUgAdzazscVS7ecG/ElSdrNF6d108DxMZY7JP8oxKiEBOSr6hNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+RoZc/RGv/NDI2sxe0nzGMPaWN89GU+f9KcN8sW1nA=;
 b=tnof0ipYyh3QUCYoHE67jFAwhnGuqdKP3cptaU7H6SZYt2mTkLzaA1DCYul5jtkkdHdeowGcquawQAr/Ac6ocC14oyvNihBMij3Mdlwc4ilvPbKhvBJsKHCBYxoyWnxtOaIJE8sMXrT2rexNgzM2kzwjsgOpzGyRb97ZmHWLEoQ=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 16/40] xen/arm: Create a fake NUMA node to use
 common code
Thread-Topic: [XEN RFC PATCH 16/40] xen/arm: Create a fake NUMA node to use
 common code
Thread-Index: AQHXjps2iDGXvfLaHUqc/mpIlhQB9auGgcmAgAAdMqA=
Date: Fri, 27 Aug 2021 01:15:53 +0000
Message-ID:
 <DB9PR08MB685730382153A95577A3B7279EC89@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-17-wei.chen@arm.com>
 <alpine.DEB.2.21.2108261605470.24433@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2108261605470.24433@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6CCAE76F8ECF6646920D8A4A8737B294.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5195ba3d-09fa-4261-7f55-08d968f84317
x-ms-traffictypediagnostic: DBBPR08MB5980:|DB6PR0801MB1781:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB17819F41D79C8AEB745E8F339EC89@DB6PR0801MB1781.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 M1bXQWKpyJfEW0/iBXKSokFS/7DZewOrsyuIiclnkLkhCu/4NUMpAPCUGRfaYW3CweQ+zCLZ3jfgSeDiHpaqayEp54fFrCIW1VPeS61y0jkOvxxQJWZU5CVdpMja6XDf2fVG2tkU8Eto74mk46026h0VZQSgjsafuhNQefyjssRcwd6iqniuLQLUQB2yBxBIUrUpTBSnGDVv4GZr3VwNbYNYsqTDoR1FrVYUOA0f1twomTO686bb03bjv8Co5s1qgT4UA6d1sJbskQQeAuqPjakxMJIB0eYplbXxgPwUhfr4jCHHwaY9gEtjsbMrXQzgJxd6mucYa+QDyHwPhTyvVtYH2TBdHKGmcnlOWJPizgaWrvXWW0EDEeNQ6/X3W8qAAD9Crae9eRKptafKp+ACslo+JVL68WQyHpqVsHMdbLpno0PkpBUvD/DklGx7WBUzq02Yh7c8nNCWGKILRLKcsrkpcq9zndaxR7L81duygBK+1uoZjYFqnmTtq0aQ85J/UcreoVSfwfjVIEEsuUcua9ZF5DEngPQNLYtIqsm+qdkxnUInxbY3FYG1mledtq/G3MdI8RKU8dW11L2Js1tz9USXggAdxCgfquZtAQTtmW/dnjFWR/vaJtLsvPvRgYXJZXtMqZAenWgAk2Qu2CU4yO8mH8dFPIlWhQ6mXnOfodbqxgeb/HNawknQVTxgD+DlyQygM/lLVIsLH/bx25zAMQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(136003)(396003)(346002)(366004)(6506007)(53546011)(66446008)(2906002)(186003)(5660300002)(66946007)(6916009)(8936002)(64756008)(76116006)(66476007)(66556008)(71200400001)(52536014)(316002)(478600001)(26005)(83380400001)(4326008)(54906003)(38070700005)(86362001)(38100700002)(33656002)(122000001)(8676002)(7696005)(9686003)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?L2R1L0Q0a042cC9JbGRENzZqckZSTGcxQnJRNEZaYzM0V09qRW5JOTdkOUNX?=
 =?gb2312?B?YmxoWENISm1DQmtYckJyU0tsMG9SWkJkMk1UZnhqbU5xK0Z3TXdYU0dQTkJk?=
 =?gb2312?B?dC9OaWhYNnlJT2dzTWpmdmsyNVF0UVE1SnJDSjRZYVpabEFteEo4WnZmY3pt?=
 =?gb2312?B?YTZyeUpzakd6ZG9maHNLQk5PV1RQL2FsZGNON1B4YWliZEpNelBEMGwyM0tK?=
 =?gb2312?B?eHIyc0MrajlDRkFkU1BSRUFvOFBibFV2YmdUVlhYamc3RGt5RDBoWUJTd0tK?=
 =?gb2312?B?NVVLMS9nU00xZnhjNnl3UXRHWVpyU2M0VEo4Rkt1MFQ1aG9tOS9uT3kvbzJC?=
 =?gb2312?B?cE83a3pUdFZVREdUcFJXY1RXdHpmU0RQQi9lMXhKblpLOXNXbWZvTWxpUDNL?=
 =?gb2312?B?c2tWcW5jN0xWWWk0VW56OVdkM3R5ZzZ3NDJiekplT0NzdWdzeUswNUx3bUJY?=
 =?gb2312?B?eGFyc0ZWTUMvNDNiTmtGcnpvT0Q4TUlwa3hOd1lZajJVbXM1OEZsNXY2Zlo4?=
 =?gb2312?B?bG5yN2lPQWJUcTFDWmhBTzBDYVVXQ0d0bXRBaGpnZ0lxb0pkNENPUkFuK2p2?=
 =?gb2312?B?b2FMMDRjVnpWL040NUdkRjNtSXUvYzVYRzFqaVNiZGFYSUtyUzFsRm52NU9R?=
 =?gb2312?B?Zm1GZS9tTk95V1FWL3VoTTh6VW90THZGSTIzdnlSaTV1VDkyaXVuOFpSUmVN?=
 =?gb2312?B?TmhRTVUvN0dMNFVQRGo3Z1VqM1dLRnNVeCtFaHBWcGZUNDV4QWE5amg2Q3hh?=
 =?gb2312?B?TkhIS0RPRi9sZzRmc1ZneDRCY0x4RE5wQmZsVjkvS2RydjU3TnNWNUhVWUpp?=
 =?gb2312?B?R1c3KzVSUVdJelZsT3h2TVBQMnBtNHl4L2NJNGlWelNpNXJYd1paaktjQ1l3?=
 =?gb2312?B?dVNlNmN3cVRscm9udnBLSFliRGlyVy9zVFZqWFRJV2tPRldocFRPVjdlUEhr?=
 =?gb2312?B?eHgvM0JKVWN4SFlZNHFlajRMb3JvRGQ4RG1xOE9xbk8zRlBBQjN0Wk5LSnVE?=
 =?gb2312?B?WDdWZ1FCV0hqMlA1dTllaXVzbUN3eGNMWlBPV09wQUZDRG1uMnE2eTZTSTVa?=
 =?gb2312?B?L0xabHhpTG1VNGs5TW5PeWpDN3RxemF0YXhsRmpockwxelRGcDZTaFZwSkky?=
 =?gb2312?B?aEczUGI1Nk9yWjNPMFVickJxeHBGZHNMZy8vWlNaMm5XemZYaEhQNDJaY05o?=
 =?gb2312?B?MDRxOU1pV3M4UHVMbFEwZ1RXNEhvV1YxUmtrUWRzSmJLRHh2U1ZmaklQMWtK?=
 =?gb2312?B?bVQ2dms4SkpWdy9RUkZ5UHNpY3NIeTJxcFJ4eDhPRVRiOWlzc1F4VHRMTGJJ?=
 =?gb2312?B?T1E1ckE0WEg5VGVGYXFKTmIxQ0NIWVhRYk40RU5ESFB4NUZmVVllNkhHRnlK?=
 =?gb2312?B?R1p1NjFCbTJUOS9uTWZUYmJ5UXdEZGtKdzB6MzhvSGZxWGZ3RUtIdkUzME5y?=
 =?gb2312?B?c1YxbXZHcjZkYURnMmg3d2RhRzJGOHZkS0tzTlVMTGwwT3B5czZUUXYvcVBk?=
 =?gb2312?B?cUE3d0xzMit1MW1JRU9PRU9DK2tLSXpNbkhIOXFQYzRoUndGVnM1d3NOZU4w?=
 =?gb2312?B?NVQ4aVRYWDVzR1FXWThDend3VUxoQzdwQjNrRDl3NWFrYS9kc2pJeEIrVlY4?=
 =?gb2312?B?VmNXZjZrdVdUdWdBaXNSMExaQ04wcWM4ZWNHb0J2SkxJaEdCVU9lMjVSamVz?=
 =?gb2312?B?b1h3ZldGSlJrV0JSaVBLcXlpTEZXTUFSYmVEeGttazl5d0YweXJCam5KMlR2?=
 =?gb2312?Q?0dm4meikA+S9a1UXbQYr4Ku+h5QjhXExlTJ6WuG?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5980
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c3978c45-07d2-4584-7167-08d968f8373e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f8WeD637qnwxdJrIsFAQuVMW4v1w/5lzS1PmDC/WuUJVjr5sGvT+34APPSTTXuefaLkyuMv11TNq3bUNecEVKf0vg1BgTekIolMmY8tXrUPiD6uWIl47uc7NRWd6L3QHgMeyYWhOVBU9UrLiyP5BZ6OhMN9Y97XucbHsQLooBsh5W8m0+s55iAMs5exAywbumQ5yb6Z9v758UD4iapNxAASHnkz8dWPCXUMyHWDnm+yM/P4xFHGi8mK6EemW/Yh3kl0rvQZk8wo5qW2VoQG+C/tne5zao3YU9tYk1OSEXy24mFEAJuL3mIiZBJksVwGUw63yG5YFUK9btkI4RA4hvoz+Kuu0e7/7axz41BS1MYfwsET1FUcnL1BCerV60eq2BCsEiKW3o4oyyAVBSrmUnGALqeNt2zSUu4aB3+CQXOxnQMAYqL6uVE02N/+3H2iUZ2VERxgzLPm48x1Q2JA0swz3xFjlYpPCUfsKMi/5UInBVabDfliUvXFmbItmnZlOoEe20EstwJUVXEsxnYRYQh+QgKWr42EGIpw+LV0zoq01XT4fWrI/9ffuVRtBPraw0beq83Bh7ggEDoNJzGPMJ+ZZxe/tNweAZFrIizfwqRVZCb3qxH7B1mTyzcC2yg/WohZGXJhEOC/ePuJy9N+J1qpo5etjqsr/LPopFCFac/YELiVRjAfuMB5+IbwFbkXtoDbz3+P1UPFkZDkaR+98UA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39850400004)(136003)(36840700001)(46966006)(26005)(6862004)(52536014)(7696005)(81166007)(5660300002)(54906003)(83380400001)(8936002)(82310400003)(186003)(86362001)(6506007)(82740400003)(478600001)(8676002)(53546011)(47076005)(336012)(9686003)(356005)(55016002)(36860700001)(4326008)(70586007)(70206006)(316002)(2906002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 01:16:13.6347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5195ba3d-09fa-4261-7f55-08d968f84317
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1781

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jjU
wjI3yNUgNzoxMA0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGll
bkB4ZW4ub3JnOw0KPiBqYmV1bGljaEBzdXNlLmNvbTsgQmVydHJhbmQgTWFycXVpcyA8QmVydHJh
bmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMTYvNDBd
IHhlbi9hcm06IENyZWF0ZSBhIGZha2UgTlVNQSBub2RlIHRvIHVzZQ0KPiBjb21tb24gY29kZQ0K
PiANCj4gT24gV2VkLCAxMSBBdWcgMjAyMSwgV2VpIENoZW4gd3JvdGU6DQo+ID4gV2hlbiBDT05G
SUdfTlVNQSBpcyBlbmFibGVkIGZvciBBcm0sIFhlbiB3aWxsIHN3aXRjaCB0byB1c2UgY29tbW9u
DQo+ID4gTlVNQSBBUEkgaW5zdGVhZCBvZiBwcmV2aW91cyBmYWtlIE5VTUEgQVBJLiBCZWZvcmUg
d2UgcGFyc2UgTlVNQQ0KPiA+IGluZm9ybWF0aW9uIGZyb20gZGV2aWNlIHRyZWUgb3IgQUNQSSBT
UkFUIHRhYmxlLCB3ZSBuZWVkIHRvIGluaXQNCj4gPiB0aGUgTlVNQSByZWxhdGVkIHZhcmlhYmxl
cywgbGlrZSBjcHVfdG9fbm9kZSwgYXMgc2luZ2xlIG5vZGUgTlVNQQ0KPiA+IHN5c3RlbS4NCj4g
Pg0KPiA+IFNvIGluIHRoaXMgcGF0Y2gsIHdlIGludHJvZHVjZSBhIG51bWFfaW5pdCBmdW5jdGlv
biBmb3IgdG8NCj4gPiBpbml0aWFsaXplIHRoZXNlIGRhdGEgc3RydWN0dXJlcyBhcyBhbGwgcmVz
b3VyY2VzIGJlbG9uZ3MgdG8gbm9kZSMwLg0KPiA+IFRoaXMgd2lsbCBtYWtlIHRoZSBuZXcgQVBJ
IHJldHVybnMgdGhlIHNhbWUgdmFsdWVzIGFzIHRoZSBmYWtlIEFQSQ0KPiA+IGhhcyBkb25lLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4g
LS0tDQo+ID4gIHhlbi9hcmNoL2FybS9udW1hLmMgICAgICAgIHwgNTMgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgeGVuL2FyY2gvYXJtL3NldHVwLmMgICAgICAg
fCAgOCArKysrKysNCj4gPiAgeGVuL2luY2x1ZGUvYXNtLWFybS9udW1hLmggfCAxMSArKysrKysr
Kw0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDcyIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vbnVtYS5jIGIveGVuL2FyY2gvYXJtL251bWEuYw0KPiA+IGlu
ZGV4IDFlMzBjNWJiMTMuLjU2NmFkMWU1MmIgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJt
L251bWEuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9udW1hLmMNCj4gPiBAQCAtMjAsNiArMjAs
OCBAQA0KPiA+ICAjaW5jbHVkZSA8eGVuL2luaXQuaD4NCj4gPiAgI2luY2x1ZGUgPHhlbi9ub2Rl
bWFzay5oPg0KPiA+ICAjaW5jbHVkZSA8eGVuL251bWEuaD4NCj4gPiArI2luY2x1ZGUgPHhlbi9w
Zm4uaD4NCj4gPiArI2luY2x1ZGUgPGFzbS9zZXR1cC5oPg0KPiA+DQo+ID4gIHZvaWQgbnVtYV9z
ZXRfbm9kZShpbnQgY3B1LCBub2RlaWRfdCBuaWQpDQo+ID4gIHsNCj4gPiBAQCAtMjksMyArMzEs
NTQgQEAgdm9pZCBudW1hX3NldF9ub2RlKGludCBjcHUsIG5vZGVpZF90IG5pZCkNCj4gPg0KPiA+
ICAgICAgY3B1X3RvX25vZGVbY3B1XSA9IG5pZDsNCj4gPiAgfQ0KPiA+ICsNCj4gPiArdm9pZCBf
X2luaXQgbnVtYV9pbml0KGJvb2wgYWNwaV9vZmYpDQo+ID4gK3sNCj4gPiArICAgIHVpbnQzMl90
IGlkeDsNCj4gPiArICAgIHBhZGRyX3QgcmFtX3N0YXJ0ID0gfjA7DQo+ID4gKyAgICBwYWRkcl90
IHJhbV9zaXplID0gMDsNCj4gPiArICAgIHBhZGRyX3QgcmFtX2VuZCA9IDA7DQo+ID4gKw0KPiA+
ICsgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HDQo+ID4gKyAgICAgICAgIk5VTUEgaGFzIG5vdCBi
ZWVuIHN1cHBvcnRlZCB5ZXQsIE5VTUEgb2ZmIVxuIik7DQo+IA0KPiBOSVQ6IHBsZWFzZSBhbGln
bg0KPiANCg0KDQpPSw0KDQo+IA0KPiA+ICsgICAgLyogQXJtIE5VTUEgaGFzIG5vdCBiZWVuIGlt
cGxlbWVudGVkIHVudGlsIHRoaXMgcGF0Y2ggKi8NCj4gDQo+ICJBcm0gTlVNQSBpcyBub3QgaW1w
bGVtZW50ZWQgeWV0Ig0KPiANCg0KT0sNCg0KPiANCj4gPiArICAgIG51bWFfb2ZmID0gdHJ1ZTsN
Cj4gPiArDQo+ID4gKyAgICAvKg0KPiA+ICsgICAgICogU2V0IGFsbCBjcHVfdG9fbm9kZSBtYXBw
aW5nIHRvIDAsIHRoaXMgd2lsbCBtYWtlIGNwdV90b19ub2RlDQo+ID4gKyAgICAgKiBmdW5jdGlv
biByZXR1cm4gMCBhcyBwcmV2aW91cyBmYWtlIGNwdV90b19ub2RlIEFQSS4NCj4gPiArICAgICAq
Lw0KPiA+ICsgICAgZm9yICggaWR4ID0gMDsgaWR4IDwgTlJfQ1BVUzsgaWR4KysgKQ0KPiA+ICsg
ICAgICAgIGNwdV90b19ub2RlW2lkeF0gPSAwOw0KPiA+ICsNCj4gPiArICAgIC8qDQo+ID4gKyAg
ICAgKiBNYWtlIG5vZGVfdG9fY3B1bWFzaywgbm9kZV9zcGFubmVkX3BhZ2VzIGFuZCBub2RlX3N0
YXJ0X3Bmbg0KPiA+ICsgICAgICogcmV0dXJuIGFzIHByZXZpb3VzIGZha2UgQVBJcy4NCj4gPiAr
ICAgICAqLw0KPiA+ICsgICAgZm9yICggaWR4ID0gMDsgaWR4IDwgTUFYX05VTU5PREVTOyBpZHgr
KyApIHsNCj4gPiArICAgICAgICBub2RlX3RvX2NwdW1hc2tbaWR4XSA9IGNwdV9vbmxpbmVfbWFw
Ow0KPiA+ICsgICAgICAgIG5vZGVfc3Bhbm5lZF9wYWdlcyhpZHgpID0gKG1heF9wYWdlIC0gbWZu
X3goZmlyc3RfdmFsaWRfbWZuKSk7DQo+ID4gKyAgICAgICAgbm9kZV9zdGFydF9wZm4oaWR4KSA9
IChtZm5feChmaXJzdF92YWxpZF9tZm4pKTsNCj4gPiArICAgIH0NCj4gDQo+IEkganVzdCB3YW50
IHRvIG5vdGUgdGhhdCB0aGlzIHdvcmtzIGJlY2F1c2UgTUFYX05VTU5PREVTIGlzIDEuIElmDQo+
IE1BWF9OVU1OT0RFUyB3YXMgPiAxIHRoZW4gaXQgd291bGQgYmUgd3JvbmcgdG8gc2V0IG5vZGVf
dG9fY3B1bWFzaywNCj4gbm9kZV9zcGFubmVkX3BhZ2VzIGFuZCBub2RlX3N0YXJ0X3BmbiBmb3Ig
YWxsIG5vZGVzIHRvIHRoZSBzYW1lIHZhbHVlcy4NCj4gDQo+IEl0IG1pZ2h0IGJlIHdvcnRoIHdy
aXRpbmcgc29tZXRoaW5nIGFib3V0IGl0IGluIHRoZSBpbi1jb2RlIGNvbW1lbnQuDQo+IA0KDQpP
SywgSSB3aWxsIGRvIGl0Lg0KDQo+IA0KPiA+ICsgICAgLyoNCj4gPiArICAgICAqIEZpbmQgdGhl
IG1pbmltYWwgYW5kIG1heGltdW0gYWRkcmVzcyBvZiBSQU0sIE5VTUEgd2lsbA0KPiA+ICsgICAg
ICogYnVpbGQgYSBtZW1vcnkgdG8gbm9kZSBtYXBwaW5nIHRhYmxlIGZvciB0aGUgd2hvbGUgcmFu
Z2UuDQo+ID4gKyAgICAgKi8NCj4gPiArICAgIHJhbV9zdGFydCA9IGJvb3RpbmZvLm1lbS5iYW5r
WzBdLnN0YXJ0Ow0KPiA+ICsgICAgcmFtX3NpemUgID0gYm9vdGluZm8ubWVtLmJhbmtbMF0uc2l6
ZTsNCj4gPiArICAgIHJhbV9lbmQgICA9IHJhbV9zdGFydCArIHJhbV9zaXplOw0KPiA+ICsgICAg
Zm9yICggaWR4ID0gMSA7IGlkeCA8IGJvb3RpbmZvLm1lbS5ucl9iYW5rczsgaWR4KysgKQ0KPiA+
ICsgICAgew0KPiA+ICsgICAgICAgIHBhZGRyX3QgYmFua19zdGFydCA9IGJvb3RpbmZvLm1lbS5i
YW5rW2lkeF0uc3RhcnQ7DQo+ID4gKyAgICAgICAgcGFkZHJfdCBiYW5rX3NpemUgPSBib290aW5m
by5tZW0uYmFua1tpZHhdLnNpemU7DQo+ID4gKyAgICAgICAgcGFkZHJfdCBiYW5rX2VuZCA9IGJh
bmtfc3RhcnQgKyBiYW5rX3NpemU7DQo+ID4gKw0KPiA+ICsgICAgICAgIHJhbV9zaXplICA9IHJh
bV9zaXplICsgYmFua19zaXplOw0KPiANCj4gcmFtX3NpemUgaXMgdXBkYXRlZCBidXQgbm90IHV0
aWxpemVkDQo+IA0KDQpPaywgSSB3aWxsIHJlbW92ZSBpdC4NCg0KPiANCj4gPiArICAgICAgICBy
YW1fc3RhcnQgPSBtaW4ocmFtX3N0YXJ0LCBiYW5rX3N0YXJ0KTsNCj4gPiArICAgICAgICByYW1f
ZW5kICAgPSBtYXgocmFtX2VuZCwgYmFua19lbmQpOw0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiAr
ICAgIG51bWFfaW5pdG1lbV9pbml0KFBGTl9VUChyYW1fc3RhcnQpLCBQRk5fRE9XTihyYW1fZW5k
KSk7DQo+ID4gKyAgICByZXR1cm47DQo+ID4gK30NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPiA+IGluZGV4IDYzYTkwOGUzMjUu
LjNjNThkMmQ0NDEgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL3NldHVwLmMNCj4gPiAr
KysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPiA+IEBAIC0zMCw2ICszMCw3IEBADQo+ID4gICNp
bmNsdWRlIDx4ZW4vaW5pdC5oPg0KPiA+ICAjaW5jbHVkZSA8eGVuL2lycS5oPg0KPiA+ICAjaW5j
bHVkZSA8eGVuL21tLmg+DQo+ID4gKyNpbmNsdWRlIDx4ZW4vbnVtYS5oPg0KPiA+ICAjaW5jbHVk
ZSA8eGVuL3BhcmFtLmg+DQo+ID4gICNpbmNsdWRlIDx4ZW4vc29mdGlycS5oPg0KPiA+ICAjaW5j
bHVkZSA8eGVuL2tleWhhbmRsZXIuaD4NCj4gPiBAQCAtODc0LDYgKzg3NSwxMyBAQCB2b2lkIF9f
aW5pdCBzdGFydF94ZW4odW5zaWduZWQgbG9uZw0KPiBib290X3BoeXNfb2Zmc2V0LA0KPiA+ICAg
ICAgLyogUGFyc2UgdGhlIEFDUEkgdGFibGVzIGZvciBwb3NzaWJsZSBib290LXRpbWUgY29uZmln
dXJhdGlvbiAqLw0KPiA+ICAgICAgYWNwaV9ib290X3RhYmxlX2luaXQoKTsNCj4gPg0KPiA+ICsg
ICAgLyoNCj4gPiArICAgICAqIFRyeSB0byBpbml0aWFsaXplIE5VTUEgc3lzdGVtLCBpZiBmYWls
ZWQsIHRoZSBzeXN0ZW0gd2lsbA0KPiA+ICsgICAgICogZmFsbGJhY2sgdG8gdW5pZm9ybSBzeXN0
ZW0gd2hpY2ggbWVhbnMgc3lzdGVtIGhhcyBvbmx5IDENCj4gPiArICAgICAqIE5VTUEgbm9kZS4N
Cj4gPiArICAgICAqLw0KPiA+ICsgICAgbnVtYV9pbml0KGFjcGlfZGlzYWJsZWQpOw0KPiA+ICsN
Cj4gPiAgICAgIGVuZF9ib290X2FsbG9jYXRvcigpOw0KPiA+DQo+ID4gICAgICAvKg0KPiA+IGRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaCBiL3hlbi9pbmNsdWRlL2FzbS1h
cm0vbnVtYS5oDQo+ID4gaW5kZXggYjI5ODJmOTA1My4uYmI0OTVhMjRlMSAxMDA2NDQNCj4gPiAt
LS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL2Fz
bS1hcm0vbnVtYS5oDQo+ID4gQEAgLTEzLDYgKzEzLDE2IEBAIHR5cGVkZWYgdTggbm9kZWlkX3Q7
DQo+ID4gICAqLw0KPiA+ICAjZGVmaW5lIE5PREVTX1NISUZUICAgICAgNg0KPiA+DQo+ID4gK2V4
dGVybiB2b2lkIG51bWFfaW5pdChib29sIGFjcGlfb2ZmKTsNCj4gPiArDQo+ID4gKy8qDQo+ID4g
KyAqIFRlbXBvcmFyeSBmb3IgZmFrZSBOVU1BIG5vZGUsIHdoZW4gQ1BVLCBtZW1vcnkgYW5kIGRp
c3RhbmNlDQo+ID4gKyAqIG1hdHJpeCB3aWxsIGJlIHJlYWQgZnJvbSBEVEIgb3IgQUNQSSBTUkFU
LiBUaGUgZm9sbG93aW5nDQo+ID4gKyAqIHN5bWJvbHMgd2lsbCBiZSByZW1vdmVkLg0KPiA+ICsg
Ki8NCj4gPiArZXh0ZXJuIG1mbl90IGZpcnN0X3ZhbGlkX21mbjsNCj4gPiArI2RlZmluZSBfX25v
ZGVfZGlzdGFuY2UoYSwgYikgKDIwKQ0KPiA+ICsNCj4gPiAgI2Vsc2UNCj4gPg0KPiA+ICAvKiBG
YWtlIG9uZSBub2RlIGZvciBub3cuIFNlZSBhbHNvIG5vZGVfb25saW5lX21hcC4gKi8NCj4gPiBA
QCAtMzUsNiArNDUsNyBAQCBleHRlcm4gbWZuX3QgZmlyc3RfdmFsaWRfbWZuOw0KPiA+ICAjZGVm
aW5lIG5vZGVfc3RhcnRfcGZuKG5pZCkgKG1mbl94KGZpcnN0X3ZhbGlkX21mbikpDQo+ID4gICNk
ZWZpbmUgX19ub2RlX2Rpc3RhbmNlKGEsIGIpICgyMCkNCj4gPg0KPiA+ICsjZGVmaW5lIG51bWFf
aW5pdCh4KSBkbyB7IH0gd2hpbGUgKDApDQo+ID4gICNkZWZpbmUgbnVtYV9zZXRfbm9kZSh4LCB5
KSBkbyB7IH0gd2hpbGUgKDApDQo+ID4NCj4gPiAgI2VuZGlmDQo+ID4gLS0NCj4gPiAyLjI1LjEN
Cj4gPg0K

