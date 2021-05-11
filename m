Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2401379BE5
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 03:12:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125564.236339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgGvt-00071r-JP; Tue, 11 May 2021 01:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125564.236339; Tue, 11 May 2021 01:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgGvt-0006zE-Ew; Tue, 11 May 2021 01:11:33 +0000
Received: by outflank-mailman (input) for mailman id 125564;
 Tue, 11 May 2021 01:11:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=03QD=KG=arm.com=henry.wang@srs-us1.protection.inumbo.net>)
 id 1lgGvr-0006z8-RA
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 01:11:32 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.70]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e1659dd-cab2-4c8b-95f5-d69fddf37212;
 Tue, 11 May 2021 01:11:28 +0000 (UTC)
Received: from AM6P194CA0009.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::22)
 by AM6PR08MB3623.eurprd08.prod.outlook.com (2603:10a6:20b:48::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Tue, 11 May
 2021 01:11:25 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::38) by AM6P194CA0009.outlook.office365.com
 (2603:10a6:209:90::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 11 May 2021 01:11:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 11 May 2021 01:11:25 +0000
Received: ("Tessian outbound 6c4b4bc1cefb:v91");
 Tue, 11 May 2021 01:11:24 +0000
Received: from 330094bf693b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C8932092-45C2-4C6B-A759-9ECF0221EE1D.1; 
 Tue, 11 May 2021 01:11:14 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 330094bf693b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 11 May 2021 01:11:14 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com (20.182.209.8) by
 PA4PR08MB6175.eurprd08.prod.outlook.com (20.182.210.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.29; Tue, 11 May 2021 01:11:11 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::19f9:d346:b9af:5cad]) by PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::19f9:d346:b9af:5cad%3]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 01:11:10 +0000
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
X-Inumbo-ID: 9e1659dd-cab2-4c8b-95f5-d69fddf37212
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDeA7xY/TEkGUE5p3O+Bl2PSZJbLEmyyQJcjtzDFJzQ=;
 b=hxw+/Vc00stMGv/7vbuTX0dDBuA60Wbt+X8a8k6A0UaOOaevewHrvk4aOXLrXZnoaBoCu0cCQ7U66hGzdyrpErm4QVAkn+/vFKZvAmocaeR9XYnHSsntvwnaR/fmoWHxY3nbLGcOxUDsh3X2ILqE/QYtvBZnvFqdyTrZt/CcVQI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/hUFG5pfIrbiROaUfsMjH6wBgq9k9CMpKFRqaxpMRIr3qfxk+pRvSA1ddmMehLs1XKD8dWppPffrhhUBCIzTUsWZayeqId/DeEt/Y/e1bFbLmArpFptj/n5Itnn6Z97UAOS4ElIHszUvxSj7VsFql96NH1YoHUP6yapbPB4427piNMQ1M0ysOCyXcZo+Z/wcAvG3CkaIb014tEPtamRFQdQ9TxZ7dWvr+0iXICcNNKrVA7KafcmQZxhduJ2GVgTsCNsFQr0AcE74dJgsI/RyKAChFtcRsfclrZmCtJt9Sq7m5J8OAeaSC5A79zSbfN6vrpAXG4bDUnsY0vmXgtseA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDeA7xY/TEkGUE5p3O+Bl2PSZJbLEmyyQJcjtzDFJzQ=;
 b=Jm7Zxv1XtwdqxOPx3CF6+Labh/sZ9YesyyaYO1ge6wkQneyWBOnrqoeLKe+4VxmNyUx4of5Z3IBEFL9CQ8SIJsE4p/UqNupgBCBV+niDcH0KS2J4fuO7UI4Ekd/P0Pl5hm5TYaJjpwhdbjIjSBj1Mp/jwKbB9mGj3zptciGwa6EvmngRr+EiavcPTGJjW4UHb2hwWGWpXH6NvOkSCz1YX1hQdZs1cbIgSJ91ZMJuIhD4ejCZdy3KMofTmnqmmyqcc1BhZDcBOPNcJNrdGgecVssVZWaYhgRBCwrUiKkDD2OHwOaYNMAw+sAZIQjFx/zPfHJjTOOkb8HJ5yQLYp+9Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDeA7xY/TEkGUE5p3O+Bl2PSZJbLEmyyQJcjtzDFJzQ=;
 b=hxw+/Vc00stMGv/7vbuTX0dDBuA60Wbt+X8a8k6A0UaOOaevewHrvk4aOXLrXZnoaBoCu0cCQ7U66hGzdyrpErm4QVAkn+/vFKZvAmocaeR9XYnHSsntvwnaR/fmoWHxY3nbLGcOxUDsh3X2ILqE/QYtvBZnvFqdyTrZt/CcVQI=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: RE: Discussion of Xenheap problems on AArch64
Thread-Topic: Discussion of Xenheap problems on AArch64
Thread-Index:
 Adc2dyA8lkZGRqbyRiSglHolanVkwQAFhaqAAACgy/AA4CfqgABHcHyAADhcqlAABznSAAGrycWAALiGZgAAEDKF4A==
Date: Tue, 11 May 2021 01:11:10 +0000
Message-ID:
 <PA4PR08MB6253F85E184CA51BDB99786992539@PA4PR08MB6253.eurprd08.prod.outlook.com>
References:
 <PA4PR08MB6253F49C13ED56811BA5B64E92479@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <cdde98ca-4183-c92b-adca-801330992fc5@xen.org>
 <PA4PR08MB62538BBA256E66A0415F0C7192479@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <f14aa1d6-35d2-a9a3-0672-7f0d3ae3ec89@xen.org>
 <PA4PR08MB62534C4130B59CAA9A8A8BF792419@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <PA4PR08MB6253FBC7F5E690DB74F2E11F92409@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <2a65b8c0-fccc-2ccc-f736-7f3f666e84d1@xen.org>
 <PA4PR08MB62537A958107CD234831E0B892579@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <ba649865-410b-e1be-39a3-c4cac802f464@xen.org>
In-Reply-To: <ba649865-410b-e1be-39a3-c4cac802f464@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: EB4512013D00F047AF3A17069222309E.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.112]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fff23869-810d-4394-e9c5-08d91419b27d
x-ms-traffictypediagnostic: PA4PR08MB6175:|AM6PR08MB3623:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB36235D433B17A304326F340192539@AM6PR08MB3623.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2582;OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VMLLJEK4d0RCkijhnMwaxbk4i6sVIO7qPzpPpmO7Lj+69NlHPKujVMyx7k2ZcNQf+KL16+kgFrXq5bEkFkPXrmh6Xtz73++dOWehQ6i+LWgAXMhQ7OONXaYPasb7I9AJoCJq7R9KEwrrtC1Qi9L4dX7JxpVbwviLuZWeXE8a8FUCckcM3HT8a1Dp5CQ7Wf0b+orcsPMlazhYjWrav07k9Nlp2TY1XBKGaCzd1fV/Lawao9jaS9agIXeMV3a7WJN+ZT7VgkMfV5NgfNFBY/9t33ffRUyU2qA5If9yByjZDPwIuJ+7c6ANl+LzXYX5uRurKPrNjkQ61FKBKDOSXcqsOekCoN4SdiXqMwgtMMyI+2/H+mO9oWq/LZyuSRh/ocbZb1Em5NcpxIZ7ilAoAJvHVeWOwX3VEdtRUtLEKvIIvJeo90Rpg7gRDVKv83rGgVsoQ4rJgKGUq4PRvwatBRCxgqoZ4COQ5FtHOBghRRE6Qy/T/YOdueF/6idltd3Bv0rIaerwtxTMsFJgZGrZEjLkwubGKTorBRusUpajbTHIDlJVgnEFgAcXFgzqlp8/Lrsr/YQ9AnBH3IWEm/BBgZXpZvG1JBUQG23kSCvs7NFU85w=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6253.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39850400004)(7696005)(2906002)(53546011)(66446008)(71200400001)(26005)(6506007)(54906003)(186003)(33656002)(76116006)(5660300002)(316002)(55016002)(4326008)(9686003)(110136005)(64756008)(66556008)(66946007)(52536014)(478600001)(8676002)(86362001)(38100700002)(122000001)(8936002)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?blJLd2Iyc2EvcWk3ZVJPQzR4QzdkZUlVZnY2T2o1QTNSQ3NRUWlGWUhydW5Q?=
 =?utf-8?B?YmRHYzc4eTlCNUwwYW9USDlScW5NaWEwM1pnUDUzOU91TkNGcTVBYkxyd2lF?=
 =?utf-8?B?ZVNpYUpvdzRpL0R3K2FSWjcyWDY2MloxdVFCdWI0eE5Cb1VOcEwrcG5JUFV3?=
 =?utf-8?B?bnJwdnVlOEwzZFBqbFZBR1RHdDIyMm95K0ZqQzNVWkk2ZnVZVWwzMjQrUDlI?=
 =?utf-8?B?ODJBT2IzTTR0WmdBbjAzWlF1UU94eTQvb1dhN2EvWnJKZFFCMkZJKytUZmJW?=
 =?utf-8?B?akEwQk5wT0tISVc5TTdiTjE1Z09tZ2kxOUhwc0lKQjlUQkFTN2YvcFVHUFpQ?=
 =?utf-8?B?bG0xSjF0QWprT3lpRG1qNEpISXNadGxSY0o1Rkl5ZFV5amQzckt0cUZiTEl5?=
 =?utf-8?B?Ynd0a1NCN3RLdjNTU3dJZUx5K1BBVTJEdEdOWTZkRWFMTGdSYklFS1pUNWZC?=
 =?utf-8?B?VUFwWlBOS2RrYkZvV3VBMFcraDhFSDBySlNwWjkvb1BWY0kwTFBaUWZSMFNW?=
 =?utf-8?B?STlTUFBFN3hlcHBKVEREWDFFRmFEY1I4K2EwbTFFV1oveVhxbzdCZzhQeGh5?=
 =?utf-8?B?U2NBcHJObVV2akFVRFRlUVdtL085OHFDTzJxb29rZXNDcnNXa09hYm5BMHFa?=
 =?utf-8?B?V0tWUk9YbmFzNFAwbFNXQjhIZnJ2Sm5HTHZHaWc4WGJhT3lHNU55K0l4aXQy?=
 =?utf-8?B?eUdTQUZFOGtiblVCNUFHcDNST2Y4RDhxeEF3U2J1Z0Y4WFBBV0xQcFM1Y0ht?=
 =?utf-8?B?cjBpelFXRVdZd2dqQ25pK2NZMHpkVkFDNmlaQTZTWXpicnRva2VWS2Z1eDlt?=
 =?utf-8?B?YUJ4YVVMcVlrMWNuSkdjUTN1dXUydlJpVWFaWkM3bW5oREVzNEswY1RlNGdU?=
 =?utf-8?B?eGIvQ01CdFBFRXlWOFdvaEdqQ3grQ2UvRXR0cVNVMnJVYy9YSG5yTVFQQi9P?=
 =?utf-8?B?TkJnN1IwOHJUOVV1dG9BUno2aDY2TW5UN1cyRVVYcDhmSnJGcDBKek96cW5p?=
 =?utf-8?B?eW52M3dTcFR1MHpGTGNEVDY0aU5EczB5aHFyYXVlZE5QUytqRmpQaXExTUdm?=
 =?utf-8?B?aEdOZTZnWm1OVkNuYkJodzllSHUwV0pqS0srVjdKMHpSSktHRjcvdWdmd285?=
 =?utf-8?B?dHRGMTBKRzR4QzFzQUtUazFyWHppZUlhbGNEbndoeU1KSzNRbzh0bGxqMVY3?=
 =?utf-8?B?TlRCa3hpU2xrL2hVYjlCVHBQSWVjOVl0a2Z3ZGVSUW4vaFJaK3ZKTmZoN2ZL?=
 =?utf-8?B?eTNxank5TVNEZUNlOXpBMWtpVUgra3A4Tm5UdEdKSHRYdXNVRjBnVnk1dEUr?=
 =?utf-8?B?NEhtdUNWWUFoaXJzRnQ1V1UxRDUzTklVdU0yQ1VZelJDeTlpT0xERm5OVkhq?=
 =?utf-8?B?SXFtRllUQ1dZUnk1TWNwUUV2YWcyTURmOXF2WjN6SnM3cXRwYVNtYmlZK0VE?=
 =?utf-8?B?SHE0alZPbGVHYVV3VHlHZWlxRjhpQnAzc01LTEV3Zk9qdTZUOW0wRmZGaFd5?=
 =?utf-8?B?UDdLMldzUFM1d3lYK21EU2M0dHFjYzYyK092UzdPSHlsUkJucWdaaXRpV3g0?=
 =?utf-8?B?dDQ5eDFyN3pHREpqd0Z0RzIxZ2x1R0tzazByWWVJUmt5aEllcjVWdUtwVXhW?=
 =?utf-8?B?OFh4K0wvMEQ2dklNc3NQOGJvb1JHZ21tY2phRnVPZGhzSzRMbkJET1N5bDkr?=
 =?utf-8?B?NksveDE5eFp1bFFuVkxIcjJ1aEtSa3MwZ000ZmJPVGtZb2dKNWd2RlFDMXRD?=
 =?utf-8?Q?WfT+E6M5JPfKBTH106h1t19v0mPhZMwlNmbSp1r?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6175
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a511d525-5b2f-491d-e872-08d91419aa0d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SS4E1sJDZxtx8yFi1dNU6823c7nqIVZfNfaJxzUmkOgDSm/9RsWALw8n7uyL7APIQFxLYtxyxTa8EzYknoaI89KDoJCJSMCJsXu9tNZsTTNhzgs9XCt4U7O//GtJeoBJAXJusqKM/KK+rBBCVuO1k7QMGTGXKxZ8ZHcevdFwvchUiFwMbe8FHmnThfJtXKkdBKf8tpaNLIjPu23dHMOjY8bTs8SrzmIjBDQiobmB0Gz7tWj7BWF9luOXK5/FbosgCZgY3MYNthbtTk13we3/Wq1qkLIIPE0PZ3Iq3edVrSZ2usnkcnoapNkYp+mOIFo1uBvGNJ4ZPWSIwsIy6jsyBHXJABtA/HEMy5eXNie4iPbGq0ZURWo8duYp1N8v8s/1UI5IOW8km2xrr3VvRlV4WeXUHt9969hHgM8O+p6/l6PyLA3hJioN6TMQVM7+HkKvj5oSA9lGYLsH0+rOGFeBZ2x7YiWzSXsoqqdzGKD3xjQXhAAoAWEXXYM0vEpR435XOy49u5FALPL4O3xuW/zUeHvicDn+8yAfTNWm69e2vTcQpxJ6uiLO9xobd48ETBs/XTUXMMudZC7g1aQ9mfWmYpSqB+lvOcV5c6oVUowRyXcdXnynyuHKO5jlL+5ouW/jADozzq9N3PXnqxQJmHU8VyDOZHj+/AEUTgBPYpJYFAA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39850400004)(46966006)(36840700001)(356005)(26005)(7696005)(82740400003)(5660300002)(33656002)(4326008)(316002)(6506007)(70206006)(53546011)(8676002)(70586007)(8936002)(2906002)(336012)(52536014)(110136005)(186003)(36860700001)(54906003)(55016002)(86362001)(9686003)(478600001)(47076005)(81166007)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 01:11:25.0350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fff23869-810d-4394-e9c5-08d91419b27d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3623

SGkgSnVsaWVuLA0KDQo+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IEhp
IEhlbnJ5LA0KPiANCj4gT24gMDcvMDUvMjAyMSAwNTowNiwgSGVucnkgV2FuZyB3cm90ZToNCj4g
Pj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gPj4gT24gMjgvMDQvMjAy
MSAxMDoyOCwgSGVucnkgV2FuZyB3cm90ZToNCj4gWy4uLl0NCj4gDQo+ID4gd2hlbiBJIGNvbnRp
bnVlIGJvb3RpbmcgWGVuLCBJIGdvdCBmb2xsb3dpbmcgZXJyb3IgbG9nOg0KPiA+DQo+ID4gKFhF
TikgQ1BVOiAgICAwDQo+ID4gKFhFTikgUEM6ICAgICAwMDAwMDAwMDAwMmI1YTVjIGFsbG9jX2Jv
b3RfcGFnZXMrMHg5NC8weDk4DQo+ID4gKFhFTikgTFI6ICAgICAwMDAwMDAwMDAwMmNhM2JjDQo+
ID4gKFhFTikgU1A6ICAgICAwMDAwMDAwMDAwMmZmZGUwDQo+ID4gKFhFTikgQ1BTUjogICA2MDAw
MDNjOSBNT0RFOjY0LWJpdCBFTDJoIChIeXBlcnZpc29yLCBoYW5kbGVyKQ0KPiA+IChYRU4pDQo+
ID4gKFhFTikgICBWVENSX0VMMjogODAwMDAwMDANCj4gPiAoWEVOKSAgVlRUQlJfRUwyOiAwMDAw
MDAwMDAwMDAwMDAwDQo+ID4gKFhFTikNCj4gPiAoWEVOKSAgU0NUTFJfRUwyOiAzMGNkMTgzZA0K
PiA+IChYRU4pICAgIEhDUl9FTDI6IDAwMDAwMDAwMDAwMDAwMzgNCj4gPiAoWEVOKSAgVFRCUjBf
RUwyOiAwMDAwMDAwMDg0MTNjMDAwDQo+ID4gKFhFTikNCj4gPiAoWEVOKSAgICBFU1JfRUwyOiBm
MjAwMDAwMQ0KPiA+IChYRU4pICBIUEZBUl9FTDI6IDAwMDAwMDAwMDAwMDAwMDANCj4gPiAoWEVO
KSAgICBGQVJfRUwyOiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4gKFhFTikNCj4gPiAoWEVOKSBYZW4g
Y2FsbCB0cmFjZToNCj4gPiAoWEVOKSAgICBbPDAwMDAwMDAwMDAyYjVhNWM+XSBhbGxvY19ib290
X3BhZ2VzKzB4OTQvMHg5OCAoUEMpDQo+ID4gKFhFTikgICAgWzwwMDAwMDAwMDAwMmNhM2JjPl0g
c2V0dXBfZnJhbWV0YWJsZV9tYXBwaW5ncysweGE0LzB4MTA4DQo+IChMUikNCj4gPiAoWEVOKSAg
ICBbPDAwMDAwMDAwMDAyY2EzYmM+XSBzZXR1cF9mcmFtZXRhYmxlX21hcHBpbmdzKzB4YTQvMHgx
MDgNCj4gPiAoWEVOKSAgICBbPDAwMDAwMDAwMDAyY2I5ODg+XSBzdGFydF94ZW4rMHgzNDQvMHhi
Y2MNCj4gPiAoWEVOKSAgICBbPDAwMDAwMDAwMDAyMDAxYzA+XQ0KPiBhcm02NC9oZWFkLm8jcHJp
bWFyeV9zd2l0Y2hlZCsweDEwLzB4MzANCj4gPiAoWEVOKQ0KPiA+IChYRU4pICoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioNCj4gPiAoWEVOKSBQYW5pYyBvbiBDUFUgMDoN
Cj4gPiAoWEVOKSBYZW4gQlVHIGF0IHBhZ2VfYWxsb2MuYzo0MzINCj4gPiAoWEVOKSAqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+IA0KPiBUaGlzIGlzIGhhcHBlbmlu
ZyB3aXRob3V0IG15IHBhdGNoIHNlcmllcyBhcHBsaWVkLCByaWdodD8gSWYgc28sIHdoYXQNCj4g
aGFwcGVuIGlmIHlvdSBhcHBseSBpdD8NCg0KTm8sIEkgYW0gYWZyYWlkIHRoaXMgaXMgd2l0aCB5
b3VyIHBhdGNoIHNlcmllcyBhcHBsaWVkLCBhbmQgdGhhdCBpcyB3aHkgSQ0KYW0gYSBsaXR0bGUg
Yml0IGNvbmZ1c2VkIGFib3V0IHRoZSBlcnJvciBsb2cuLi4NCg0KVGhhbmtzIGZvciB5b3VyIHBh
dGllbmNlLg0KDQpLaW5kIHJlZ2FyZHMsDQoNCkhlbnJ5DQoNCj4gDQo+IENoZWVycywNCj4gDQo+
IC0tDQo+IEp1bGllbiBHcmFsbA0K

