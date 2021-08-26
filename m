Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9468D3F82D2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 09:01:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172684.315110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9O1-0003Ge-Kj; Thu, 26 Aug 2021 07:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172684.315110; Thu, 26 Aug 2021 07:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9O1-0003En-HL; Thu, 26 Aug 2021 07:01:17 +0000
Received: by outflank-mailman (input) for mailman id 172684;
 Thu, 26 Aug 2021 07:01:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J+8W=NR=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJ9Nz-0003Eh-HH
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 07:01:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.82]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45add0eb-5233-426c-88ab-9fa262b63ea2;
 Thu, 26 Aug 2021 07:01:12 +0000 (UTC)
Received: from DB6P192CA0015.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::25) by
 AM7PR08MB5301.eurprd08.prod.outlook.com (2603:10a6:20b:dd::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17; Thu, 26 Aug 2021 07:01:11 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::15) by DB6P192CA0015.outlook.office365.com
 (2603:10a6:4:b8::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Thu, 26 Aug 2021 07:01:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 07:01:11 +0000
Received: ("Tessian outbound f11f34576ce3:v103");
 Thu, 26 Aug 2021 07:01:10 +0000
Received: from 8c9a9e9b987f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1122BCB2-8D60-4EDE-AAE9-276015895B6B.1; 
 Thu, 26 Aug 2021 07:01:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8c9a9e9b987f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Aug 2021 07:01:05 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB6092.eurprd08.prod.outlook.com (2603:10a6:10:20e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 07:01:04 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 07:01:04 +0000
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
X-Inumbo-ID: 45add0eb-5233-426c-88ab-9fa262b63ea2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aG/oHPh1bXGFCVAntyFRoLrQP26lDXfsyeDIp+0PemE=;
 b=JDyGM+HUAFy2NMCf+7GcjG6ZNF/stxfgTwoxJ8iVNRlBjZXZv8a0u9vSSrSHbDWE69jL7JrZSYccHjWP2NFkjgVCOJ9R/6BjpYxdhM5vZ9Lavd5LyX/8CRP1HOhHxXv2WZf0W27Zt3n8hlxmxukm67x/ium0b/NjQrngEnV+tnk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzlsQ56qMObz0twfRnBKzzZMEX3gDUneORsjfmjvyD1AJeJqw3LmAyaGWfeLV3Jq9SCfJm/qBiflfCJ19q5N7boGUawUlDH/U0dIdfSMlTef74/2/caC4iNx4TYZJjNytiuC/Q3r4S9cBCkon9iNIkT/MAycNr18TGpcBx0aVwfwtD4DCh2FhS0ajt8rQt50/tS80SgF/2QODmM/lT0Z5s2I0Mq06NNO6+jDc1jpBPso2HsAEzGCUbFxjl2FI+/+jFoFM1zrk3UeUiFlc1OZYjZbEtdsHwDT3nnAVHJwapMIWOflOhUnh2ytX5ECJ/8MVF+/u82TKoRP4c329iytQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aG/oHPh1bXGFCVAntyFRoLrQP26lDXfsyeDIp+0PemE=;
 b=oBoDKenTduNMcLfVDuKswjrLV+WKZ6kB7DTdWBbvOjGU4uZUxqVSzZp5E1ntSIgyKdLgRWc857ZNgV9Viw2XvzC00W3XyUwhJBkDypl7RQvyqR16YY9X8Q9bmFnTJzCpLZXJW90E0JIkQkD5nRzP80s5Vzf1QYIvTcmq+QhVAEAIdQIkQyGQw8qwUaOhqg08utLtS2P6lbsRYZLyHK9i2y2G+ngfm2hBKii+GkVgmVHylf4HZPNPTmFTHJ+CmxTNsSv2p0tXO2bTjhMlZhAOIwbByMqOVW1n5VfyXMU3BRW/aG/z115MBkTIeXI8anKGiwId82qrJsFk4GZYWCfSFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aG/oHPh1bXGFCVAntyFRoLrQP26lDXfsyeDIp+0PemE=;
 b=JDyGM+HUAFy2NMCf+7GcjG6ZNF/stxfgTwoxJ8iVNRlBjZXZv8a0u9vSSrSHbDWE69jL7JrZSYccHjWP2NFkjgVCOJ9R/6BjpYxdhM5vZ9Lavd5LyX/8CRP1HOhHxXv2WZf0W27Zt3n8hlxmxukm67x/ium0b/NjQrngEnV+tnk=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 24/40] xen/arm: introduce a helper to parse device
 tree NUMA distance map
Thread-Topic: [XEN RFC PATCH 24/40] xen/arm: introduce a helper to parse
 device tree NUMA distance map
Thread-Index: AQHXjps+iLbrOQu8n06b5z+EtCRt06uEVK0AgAEYLNA=
Date: Thu, 26 Aug 2021 07:01:03 +0000
Message-ID:
 <DB9PR08MB68573E5718286B9FC2B8A7AB9EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-25-wei.chen@arm.com>
 <e15cdda1-1665-4baa-5764-76e17dd3bb74@xen.org>
In-Reply-To: <e15cdda1-1665-4baa-5764-76e17dd3bb74@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C01FB56E69F9254E803C9101BC9C8F75.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9f8f1897-6795-4f17-4075-08d9685f4949
x-ms-traffictypediagnostic: DBBPR08MB6092:|AM7PR08MB5301:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM7PR08MB53016A1B5971BA6F3C8622799EC79@AM7PR08MB5301.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EaKx5lROh0K20MH3VbG90wVLBkweo+HCokXp00TSe9j6pImtOdq8lhErqyX4jlfIzPTVrPZfTe3J0H66+9PUHbMM5cvYxwkmzSfvHTUhm2KQrzrMhNAbGo8k0UksXmPo2rN33DNAgSGF28KsXMJnHxPWAiDJLtQ60w5qEeoUbFJgkPpsTPJcBQrbxCsUeMDFSzQfYoaVPqf4LE5IpAc1HpYgfmDjEI6j+NHOOu+Uyy3Nqx1Yhr5MnI6JlL6hr/pjYV5H9r3VmpFDnzBJBABr0WZrcsdmfr5siqmcRmwyE8HK58MNp7x3OhleGdfX1vQBd1mMCmeDLgglt2YhdaUmUdH3UijdKOLWcBow3epzcDG+4vEZgLwGRwXzHMOD11BfUKwPXkiiliWW7I0WDh/yFkf1ZqZabjd60G60tgF3gspIH0+gAenXlzJ/yoW2R8GA8RePy3G1dIbzLQco++tvqOGz60WmioPAYAjQrXVf0FlSAgAMmY19VY3lLTbEapFgH90P16cd1Cgk1YAmQP3IiW+tbumV6z8lFtDf0IhAzTM9qN2edIoKpI6MGNx8sO7TO468SqImqRm6xvcJJ2On478uWI7ymD828kdeOpcybFBgxMuurJqIDzfg9ESp9+xyuIp4uzsA1YYHnDYA4RidVTMisjrhFMnov6jSqiaQHIuEyqHU1/umlz/zWp2RDHcLvm/lxyhmKxPY41eZOzNXSw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39850400004)(346002)(136003)(396003)(122000001)(38070700005)(2906002)(71200400001)(186003)(110136005)(8676002)(8936002)(5660300002)(33656002)(7696005)(52536014)(66946007)(478600001)(55016002)(76116006)(4326008)(64756008)(66476007)(66446008)(316002)(9686003)(26005)(53546011)(38100700002)(6506007)(86362001)(66556008)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dE9KZm90cTNJUXRzZHZXKzVNYVJVK01PcThPRTEvRi9GUWE5eFlXdjBRNDBP?=
 =?utf-8?B?bVdldFA3UG56OHc3bTdxU285c25xdnV0UVpxQ1RNQjN5SEMwWHZCaFhDSEJP?=
 =?utf-8?B?OWgvRkVvNXJaSzZGT0Vna1hNUTJCMytWdkVUdUY2QlVTSlByVGExeStleUpW?=
 =?utf-8?B?dDhRTmYxMWEvemVrcmc4MjNUaGp0RkNsYXc1aHRabEJpZ29HZllsZmhvbUVt?=
 =?utf-8?B?d3lLc1pIaStjQUlwYXRkOGYrZGNROEo2Q0s3eVJHZTR0U05nN1c4NWhHMWFU?=
 =?utf-8?B?bExYVkZHSGVDL0N6STJJNFhsc3RNUk9ZTk5xd0NRc3p2NEx4aUUwYTZrWGlB?=
 =?utf-8?B?UFdPcWExRXVjNlNUcnkvMVR3cmlEWVRvV3BuYlFwYmhtcjlZKzZiTCt1MGRa?=
 =?utf-8?B?RnROOWtzNDZ3NWxMTFJBOTlIMnFvT2IycjZYYnZySUF5SVd1KzhwT1ljRUtB?=
 =?utf-8?B?Yy9CU2ZnZ2xvTjE2Z1ZHNld1aVpkVDBqK3NhUUcwN2RIWXhDSzVXa2dkbVZQ?=
 =?utf-8?B?Qm5YRGkxK3ZQQTFqemQwdGlQWVpESWtYdEw3L0dPajJqZEN0Mk0rQUdJc2l3?=
 =?utf-8?B?MUxyRkhJbjQwL2hYNmpqS3JMVFJXN1RpVDNNcWwyZUtLMGhUNXZ5UXAzU0dj?=
 =?utf-8?B?SmcyeGNKYXpITDkyckpJKzBLWFo2Umh0YXJSckxuRkFCa2NoQWVuS3YyRktP?=
 =?utf-8?B?b2ZyVmV4L255bG9ZVFhvZHVaQktyUW4waitMWFNOQTFvbWpzdk9qTURUOE1G?=
 =?utf-8?B?RVIyYUEzSC9KamdWSjVORGZYMnpDejNXZFBmd2dXWmx5RUg4QWlxam9MU0RJ?=
 =?utf-8?B?SlVsNmdHdHlLSk5zR2JJbU9iRENGTnhidm9hRG15NmpjMFByeUQxL2FCeVJm?=
 =?utf-8?B?RzgyWVROem5sSGVHdWpCc2Y5Q2hVcEFyVTh3bjIxMTk4YTR0YmR6MHVLazJh?=
 =?utf-8?B?L3J2UVRFWVVkb3F0VDBnS1hGRTY3ZXhpc2xJTVJpTThHUEdBK1JPM1U5WkY3?=
 =?utf-8?B?RjBUMWNENHJVK1MyNHhaZENzOFBGNDRlV3lmakthWm00cjEwUkI0QThkT1pC?=
 =?utf-8?B?aXZldVBmNUV2SG94MEFDZ1FhdS9vWFNCa3Zpa1NuK1hXblZ5S1U4UHUwU1Az?=
 =?utf-8?B?OHh2V1QzQkJVbjBtRXl5UEF2TlNWWXhtdDB0SmJyMjJPT1IwcnNxU2NlQTVq?=
 =?utf-8?B?NEo1OEYyTnJ1NWxOUmZ5VE42V0M0NkVqdTdIaW1zRzQ2RElWaEtlZEsrWEw4?=
 =?utf-8?B?TEdSWDNFRUF1YWxKTmV3dGlKai9CL0l3bmdPTGJBZXdFY2wzaUdWYStVbXA0?=
 =?utf-8?B?TFJ2b01DdXhoT2d4VUw1TWJHSTljRGp0K2tIanlleHFzWTZuVmJGWTI0a2ht?=
 =?utf-8?B?Q0d4SklBMEJVZUczZHVpTW5Eem40TGxnQWZMSjQ0V0djODRPWTlYeDN5QVJ4?=
 =?utf-8?B?SHdTVlBBMTd4VEN5eHEzVzUxZ1B3VVVsNFBDUDBLYUg2ajR4WWtDUjZMLzZF?=
 =?utf-8?B?b0hzSk9DM2V3M3ZiUjF1Nk5hSmFqdEh1ekVvczV5MHhkVlJQditaQWo0MU1u?=
 =?utf-8?B?YzNQWkJxZTlPQVdvNjN2cXpJb0JSd3Z2SFowR0lZaWhBQXR0RDREVFZMWm1W?=
 =?utf-8?B?ZlozWGlGUDFRbkl5RVErWDRhMUV0aENQYVRKbmFNZVlTT28rVFVlVVN1dlQy?=
 =?utf-8?B?SUplM2syZ3l0U0hNR0RRKzQxcDREczE1MStMMEZMRk0rclEvRW1VakExOFdo?=
 =?utf-8?Q?lRuHKTqCOxztUjw9DcxLgZVDBkCfeN3P4n77dY3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6092
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b06ef9fd-5da9-486b-537d-08d9685f4518
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WAwN4taaqYZdtdjvOaev8e1ibtb9kSwMBUp8oPHJLHE7cZECO79CXXOwY4Vzad+/T7hel2Ar+kCybHj+LoJQVbOXoeB2jmBhSEmSF+913Pk9CPiRedHWTKpJG/LWRlHHYNHsWaWTg0TN9r7UtnhCRscIVSU0e9b5Ht4HDgvt8tKPX/I+esz7sdlTzv4Rlt8gwL2LGN616Uyaf6CNalVQA00tsOILSjfALZ2acaJpnYBMSYnt2bIFkq0kW+L62yTOXfHLjponx0WaDk8z5QNJNaAwt4GEW9OHjeAr+/XCV9ceci7b7xTgj6YxkqvBsPh8rDdeAcdxjdQTxJh5Yw4fIKhW/WKcGDDQpqZ+lX60zFg/CN34tGbI7SKZ7Y6dejTq2BDzkl+gXAH6g03bKovKonA+sP/w2sWFaghxFa1/ByD28lFL1b6i68DN6Rb92e096SkCuXqvkR2rcum1GcTebLdonxEVFvJg+Y20zneMP/rNtxGSaeI3t3qMc4DlpdaS9GSx+v3QOtog48nLdcX5HA/FWClvCSEX8Vll7WcoxO+Ih7imHLtnr7YX7gJDIU2x9vBsZjRy0e1gkpG5+/FR7YDv2E+29u5RmYlf0OSDfJYKNWgRJ8mbA+4Pa0CUdbrlYM+In58F5KoSs0jtJomG+ExG6ow5boKb074ygQrIM7L1OLFZTuXvoMTX/lVSfLqA5Wbnju2O5/BjonhhkuA62Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(36840700001)(46966006)(5660300002)(9686003)(55016002)(478600001)(356005)(82740400003)(8936002)(86362001)(81166007)(33656002)(8676002)(83380400001)(52536014)(36860700001)(2906002)(316002)(336012)(4326008)(186003)(26005)(70206006)(53546011)(47076005)(7696005)(6506007)(110136005)(82310400003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 07:01:11.0285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8f1897-6795-4f17-4075-08d9685f4949
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5301

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjXml6UgMjE6NTYN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBCZXJ0cmFuZCBNYXJx
dWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBKYW4gQmV1bGljaA0KPiA8amJldWxpY2hA
c3VzZS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWEVOIFJGQyBQQVRDSCAyNC80MF0geGVuL2FybTog
aW50cm9kdWNlIGEgaGVscGVyIHRvIHBhcnNlDQo+IGRldmljZSB0cmVlIE5VTUEgZGlzdGFuY2Ug
bWFwDQo+IA0KPiBIaSBXZWksDQo+IA0KPiBPbiAxMS8wOC8yMDIxIDExOjI0LCBXZWkgQ2hlbiB3
cm90ZToNCj4gPiBBIE5VTUEgYXdhcmUgZGV2aWNlIHRyZWUgd2lsbCBwcm92aWRlIGEgImRpc3Rh
bmNlLW1hcCIgbm9kZSB0bw0KPiA+IGRlc2NyaWJlIGRpc3RhbmNlIGJldHdlZW4gYW55IHR3byBu
b2Rlcy4gVGhpcyBwYXRjaCBpbnRyb2R1Y2UgYQ0KPiANCj4gcy9pbnRyb2R1Y2UvaW50cm9kdWNl
cy8NCg0KT0sNCg0KPiANCj4gPiBuZXcgaGVscGVyIHRvIHBhcnNlIHRoaXMgZGlzdGFuY2UgbWFw
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+
ID4gLS0tDQo+ID4gICB4ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jIHwgNjcgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNjcgaW5z
ZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9udW1hX2Rldmlj
ZV90cmVlLmMNCj4gYi94ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jDQo+ID4gaW5kZXgg
YmJlMDgxZGNkMS4uNmUwZDFkM2Q5ZiAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vbnVt
YV9kZXZpY2VfdHJlZS5jDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL251bWFfZGV2aWNlX3RyZWUu
Yw0KPiA+IEBAIC0yMDAsMyArMjAwLDcwIEBAIGRldmljZV90cmVlX3BhcnNlX251bWFfbWVtb3J5
X25vZGUoY29uc3Qgdm9pZCAqZmR0LA0KPiBpbnQgbm9kZSwNCj4gPg0KPiA+ICAgICAgIHJldHVy
biAwOw0KPiA+ICAgfQ0KPiA+ICsNCj4gPiArLyogUGFyc2UgTlVNQSBkaXN0YW5jZSBtYXAgdjEg
Ki8NCj4gPiAraW50IF9faW5pdA0KPiA+ICtkZXZpY2VfdHJlZV9wYXJzZV9udW1hX2Rpc3RhbmNl
X21hcF92MShjb25zdCB2b2lkICpmZHQsIGludCBub2RlKQ0KPiA+ICt7DQo+ID4gKyAgICBjb25z
dCBzdHJ1Y3QgZmR0X3Byb3BlcnR5ICpwcm9wOw0KPiA+ICsgICAgY29uc3QgX19iZTMyICptYXRy
aXg7DQo+ID4gKyAgICBpbnQgZW50cnlfY291bnQsIGxlbiwgaTsNCj4gDQo+IGVudHJ5X2NvdW50
IGFuZCBpIHNob3VsZCBiZSB1bnNpZ25lZC4gbGVuIHVuZm9ydHVuYXRlbHkgY2FuJ3QgYmVjYXVz
ZQ0KPiBmZHRfZ2V0X3Byb3BlcnR5IGV4cGVjdHMgYSBzaWduZWQgaW50Lg0KPiANCg0KT0sNCg0K
PiA+ICsNCj4gPiArICAgIHByaW50ayhYRU5MT0dfSU5GTyAiTlVNQTogcGFyc2luZyBudW1hLWRp
c3RhbmNlLW1hcFxuIik7DQo+ID4gKw0KPiA+ICsgICAgcHJvcCA9IGZkdF9nZXRfcHJvcGVydHko
ZmR0LCBub2RlLCAiZGlzdGFuY2UtbWF0cml4IiwgJmxlbik7DQo+ID4gKyAgICBpZiAoICFwcm9w
ICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcNCj4gPiAr
ICAgICAgICAgICAgICAgIk5VTUE6IE5vIGRpc3RhbmNlLW1hdHJpeCBwcm9wZXJ0eSBpbiBkaXN0
YW5jZS1tYXBcbiIpOw0KPiA+ICsNCj4gPiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiAr
ICAgIH0NCj4gPiArDQo+ID4gKyAgICBpZiAoIGxlbiAlIHNpemVvZih1aW50MzJfdCkgIT0gMCAp
DQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HDQo+ID4gKyAg
ICAgICAgICAgICAgICJkaXN0YW5jZS1tYXRyaXggaW4gbm9kZSBpcyBub3QgYSBtdWx0aXBsZSBv
ZiB1MzJcbiIpOw0KPiA+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsgICAgfQ0KPiA+
ICsNCj4gPiArICAgIGVudHJ5X2NvdW50ID0gbGVuIC8gc2l6ZW9mKHVpbnQzMl90KTsNCj4gPiAr
ICAgIGlmICggZW50cnlfY291bnQgPD0gMCApDQo+IA0KPiBJIHVuZGVyc3RhbmQgdGhhdCBlbnRy
eV9jb3VudCBtYXkgYmUgMC4gQnV0IEkgY2FuJ3Qgc2VlIGhvdyBpdCBjYW4gYmUNCj4gbmVnYXRp
dmUgYXMgdGhlIHByb3BlcnR5IGxlbiBjYW5ub3QgYmUgKGV2ZW4gaWYgaXQgaXMgYSBzaWduZWQg
dHlwZSkuIFNvDQo+IEkgdGhpbmsgdGhpcyB3YW50cyB0byBiZSAiPT0gMCIuDQo+IA0KDQpGcm9t
IHRoZSBmZHRfZ2V0X3Byb3BlcnR5J3MgY29tbWVudCwgd2hlbiBwcm9wIGlzIE5VTEwsIHRoZSBs
ZW4gY2FuDQpiZSBuZWdhdGl2ZS4gQnV0LCB5ZXMsIHByb3A9PU5VTEwgY2hlY2sgd2lsbCBoYW5k
bGVkIGJlZm9yZSB0aGlzIGNvZGUuDQpuZWdhdGl2ZSBsZW4gd2lsbCBub3QgcmVhY2ggaGVyZS4g
SSBhbSBvayB0byBjaGFuZ2UgaXQgdG8gIj09IDAiDQoNCj4gPiArICAgIHsNCj4gPiArICAgICAg
ICBwcmludGsoWEVOTE9HX1dBUk5JTkcgIk5VTUE6IEludmFsaWQgZGlzdGFuY2UtbWF0cml4XG4i
KTsNCj4gPiArDQo+ID4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gKyAgICB9DQo+ID4g
Kw0KPiA+ICsgICAgbWF0cml4ID0gKGNvbnN0IF9fYmUzMiAqKXByb3AtPmRhdGE7DQo+ID4gKyAg
ICBmb3IgKCBpID0gMDsgaSArIDIgPCBlbnRyeV9jb3VudDsgaSArPSAzICkNCj4gPiArICAgIHsN
Cj4gPiArICAgICAgICB1aW50MzJfdCBmcm9tLCB0bywgZGlzdGFuY2U7DQo+ID4gKw0KPiA+ICsg
ICAgICAgIGZyb20gPSBkdF9yZWFkX251bWJlcihtYXRyaXgsIDEpOw0KPiA+ICsgICAgICAgIG1h
dHJpeCsrOw0KPiANCj4gWW91IGNhbiB1c2UgZHRfbmV4dF9jZWxsKCkgd2hpY2ggd2lsbCB1cGRh
dGUgdGhlIHBvaW50ZXIgZm9yIHlvdS4NCj4gDQoNClRoYW5rcw0KDQo+ID4gKyAgICAgICAgdG8g
PSBkdF9yZWFkX251bWJlcihtYXRyaXgsIDEpOw0KPiA+ICsgICAgICAgIG1hdHJpeCsrOw0KPiA+
ICsgICAgICAgIGRpc3RhbmNlID0gZHRfcmVhZF9udW1iZXIobWF0cml4LCAxKTsNCj4gPiArICAg
ICAgICBtYXRyaXgrKzsNCj4gPiArDQo+ID4gKyAgICAgICAgaWYgKCAoZnJvbSA9PSB0byAmJiBk
aXN0YW5jZSAhPSBOVU1BX0xPQ0FMX0RJU1RBTkNFKSB8fA0KPiA+ICsgICAgICAgICAgICAoZnJv
bSAhPSB0byAmJiBkaXN0YW5jZSA8PSBOVU1BX0xPQ0FMX0RJU1RBTkNFKSApDQo+ID4gKyAgICAg
ICAgew0KPiA+ICsgICAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcNCj4gPiArICAgICAg
ICAgICAgICAgICAgICJJbnZhbGlkIG5vZGVzJyBkaXN0YW5jZSBmcm9tIG5vZGUjJWQgdG8gbm9k
ZSMlZA0KPiA9ICVkXG4iLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgZnJvbSwgdG8sIGRpc3Rh
bmNlKTsNCj4gPiArICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gKyAgICAgICAgfQ0K
PiA+ICsNCj4gPiArICAgICAgICBwcmludGsoWEVOTE9HX0lORk8gIk5VTUE6IGRpc3RhbmNlIGZy
b20gbm9kZSMlZCB0byBub2RlIyVkDQo+ID0gJWRcbiIsDQo+ID4gKyAgICAgICAgICAgICAgIGZy
b20sIHRvLCBkaXN0YW5jZSk7DQo+ID4gKyAgICAgICAgbnVtYV9zZXRfZGlzdGFuY2UoZnJvbSwg
dG8sIGRpc3RhbmNlKTsNCj4gPiArDQo+ID4gKyAgICAgICAgLyogU2V0IGRlZmF1bHQgZGlzdGFu
Y2Ugb2Ygbm9kZSBCLT5BIHNhbWUgYXMgQS0+QiAqLw0KPiA+ICsgICAgICAgIGlmICh0byA+IGZy
b20pDQo+ID4gKyAgICAgICAgICAgICBudW1hX3NldF9kaXN0YW5jZSh0bywgZnJvbSwgZGlzdGFu
Y2UpOw0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiArICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4N
Cj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

