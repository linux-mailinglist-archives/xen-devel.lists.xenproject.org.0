Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 237093888B9
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 09:52:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129927.243654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljH0E-0007aV-64; Wed, 19 May 2021 07:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129927.243654; Wed, 19 May 2021 07:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljH0E-0007Y3-2r; Wed, 19 May 2021 07:52:26 +0000
Received: by outflank-mailman (input) for mailman id 129927;
 Wed, 19 May 2021 07:52:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TeaP=KO=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1ljH0C-0007Xx-Uz
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 07:52:25 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.64]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ea648ae-681b-4c27-9b61-e3ed3956048f;
 Wed, 19 May 2021 07:52:23 +0000 (UTC)
Received: from AS8PR04CA0046.eurprd04.prod.outlook.com (2603:10a6:20b:312::21)
 by AM6PR08MB3285.eurprd08.prod.outlook.com (2603:10a6:209:4b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 07:52:21 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::f0) by AS8PR04CA0046.outlook.office365.com
 (2603:10a6:20b:312::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Wed, 19 May 2021 07:52:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 07:52:21 +0000
Received: ("Tessian outbound 3c5232d12880:v92");
 Wed, 19 May 2021 07:52:20 +0000
Received: from 3656df387953.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 85BB060B-384B-4004-AB82-DAF8700CAAD7.1; 
 Wed, 19 May 2021 07:52:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3656df387953.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 May 2021 07:52:15 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR0802MB2494.eurprd08.prod.outlook.com (2603:10a6:800:b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 07:52:10 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5%6]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 07:52:10 +0000
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
X-Inumbo-ID: 4ea648ae-681b-4c27-9b61-e3ed3956048f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oz/j1/U/AkMxxZ8CB/mK3KXR+dZo3nuUFYqFkmitehk=;
 b=v0VQh8h6WZ8g6mgy1vuglGuzxktI6qwdEuhJJlvLy0lzaOoAMP/3bBno9DnedtoKRqm8Z8z/zy8qo8bV/jJ3lqYqZgA6ceFDQoHXNnLr2C91mzgExJyQSbNHXtOezILcCCFHd4jrV5rHtMqYUakcgagbXwYxi4rJf2DqgIXyavI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3WNb1OKLzo0Urf7dyCuOTG602qvCfWfyv3jsWpIYBXCI01A9IgYBgIKxGamdpixKNn/b311AeuTScT/roJHb4o40blgrUuVqK1Ot1/PreYEQ5N1ELLcZ8muKegB1A2ZwizM6NtTfP+ItUAs9zyDEnp0169cjkmNrEoW2pYADxyqwqaCSMn2Vb8sfJIExNGP4tiE2lsYlrkKZnwLlYhhddDMz4hlsaLpRpglVqmLSVnp4NtZrHESXj8gDKQP0YKZFn1y6nH7hpLOTAgzyJzewHDikfvhlPUTaCdlUXWUaGbJWm1YHLsc3hlYoB5eS1d1sCe/qsVnHmacQjQ8WH6PSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oz/j1/U/AkMxxZ8CB/mK3KXR+dZo3nuUFYqFkmitehk=;
 b=WEjeunWmegZVsjmdlCIjJqB7DliDwm6GaT6QGos2wVlcOarrRUTYh5q5wwbbFuATeI9ezMAlKmn1w+wKWc6IqltG6byk14/GZeeeEPgjnlbOS4LGOZPWtIl/8WFb/mnZWTjYFU1UeAaJkngOf6f20QF8kj4lNMaLyHgjoEnDPB7MIARTBrza4FHImH3GUiciKJkUeJduCC/1RshyUF6ODXL1NHk+40ISlcqe2L0ushUbXtEu4uSe3Em2NHb3MofPiuHwrdfpBl0jZn0xtj7dIE53K5JOqrPgeXIkrAb/KM0oUV7F5SrShLJ3wVO3+ziKQZK/JkpHMrvgrh9sWjAXhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oz/j1/U/AkMxxZ8CB/mK3KXR+dZo3nuUFYqFkmitehk=;
 b=v0VQh8h6WZ8g6mgy1vuglGuzxktI6qwdEuhJJlvLy0lzaOoAMP/3bBno9DnedtoKRqm8Z8z/zy8qo8bV/jJ3lqYqZgA6ceFDQoHXNnLr2C91mzgExJyQSbNHXtOezILcCCFHd4jrV5rHtMqYUakcgagbXwYxi4rJf2DqgIXyavI=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
Subject: RE: [PATCH 07/10] xen/arm: intruduce alloc_domstatic_pages
Thread-Topic: [PATCH 07/10] xen/arm: intruduce alloc_domstatic_pages
Thread-Index: AQHXS6W/k/joZEkeaUiDjrfYH3jVEaro2ToAgAAR3sCAADv/gIABQxZg
Date: Wed, 19 May 2021 07:52:10 +0000
Message-ID:
 <VE1PR08MB5215CB5102529F32DC695CFDF72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-8-penny.zheng@arm.com>
 <7e4706dc-70ea-4dc9-3d70-f07396b462d8@suse.com>
 <VE1PR08MB521528492991FDFC87AC361BF72C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <75275b2f-9de3-944a-d55c-a62bbbf1bb8c@xen.org>
In-Reply-To: <75275b2f-9de3-944a-d55c-a62bbbf1bb8c@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A02319949143924B889E8A3D2B2F1646.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 35666b76-6cb8-41b3-fa71-08d91a9b0868
x-ms-traffictypediagnostic: VI1PR0802MB2494:|AM6PR08MB3285:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3285BCB1A0BB62FD7E063D31F72B9@AM6PR08MB3285.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MKiD0eqfe+5RdB7nNt74CEELZppI89O9ghAnV92/SZ1AwsZAEuXc5b5KgiBkqdFBdXR7dYqHk8rz0gmfjLwqP0azdr/p/g+ZvbGhzUq4F8DVIeW1YYPDdz6tLmHTQzotXGF5JsUmJYEv+XtHlYyft8+zmmANwE4Kt2VU5A/aa+oelW7WGwmNpWmK35RS5wHcKuryuaVq8LIJeubXRpAE8b9nU34fH7Pz1z/bQI4/a3oI/yb5bSZT+1yllNP2IK0Vl2NNeNmf4QW31AN4a+K/g2Nw3YAXm2Kk1rXvqsopnbvXT/LOxwnkqEWNvwNBnLwuJefc/64bsY23JD+K/EU3rHkTcqhDehj78WsuXtgfA5+/Y+FNf7yUFTdBhICqG8HE+l+djsLyMkG0TMUmK5W0EXTIN1X3V7lSoCPONKuu/NZFMGTMpMh1geMtfpFDAELrMtqNjg9Dr47fP0Vqg0xCv8dZNAlf7z4+fHM1jAmv6dM+REHDOArFpAh/+ktjf5M8YCBU4DQMXwyxXWkbdwjiYwy/LwwaUtDFBSUECwrQ6qQnnXR84eyrwusGHXjnyeqZtlUFD9nRQhLf3x1bB7+DTjAp/epptG4cr62giB256Yo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(52536014)(186003)(6506007)(2906002)(55016002)(122000001)(38100700002)(110136005)(7696005)(54906003)(53546011)(71200400001)(83380400001)(9686003)(26005)(5660300002)(64756008)(66476007)(66556008)(66446008)(478600001)(8936002)(86362001)(316002)(8676002)(76116006)(33656002)(4326008)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?Q2dWbEl4Q1VzdE1OQm5kT0t0VGYrLzducnR6RnQ0RWRjUEdOeWNtQnVkQTlV?=
 =?utf-8?B?U1BuOGtjZ1FqQTFtdnJkdEhOOGVZQ1JrbFhPdDJIWEpzWFE0SERYcHd2NFJW?=
 =?utf-8?B?c0V0NXBMR2lJRUludTRkY3doMjFYM1MxWlUrK01jZGZJSGFHSU9VSHdLZVE5?=
 =?utf-8?B?WTZaRUpEaU1SWThpOGVQa3RjTWhrbGx2dDAyS2ZoTm4vZHJoRGRxaEJ6RWNY?=
 =?utf-8?B?dXNUS3BjWi83N2R1blBaRHI2cFBhMityRUxtb0RFSmFieE14TDRQTHpIQ0VE?=
 =?utf-8?B?ZmZCaUh4eFlHWGZ4TU52ZmFwQ0dORSs0aFluQU0wWHIvaU1taW02UkFXZ3k2?=
 =?utf-8?B?OTh3dUxIMWNWQnFDQ0lxdXFWSFc3cE5vUVBjaG4vaGk5TS8xNWhoSVJZNHlM?=
 =?utf-8?B?VDNJSGdCOGJMODdTVWdkVWx1cUU3R0p2cEcyYTFzcHByblFQREYyRFBFbE5J?=
 =?utf-8?B?VEZyTGtpckJKU3lUZzdJQ2dKMmVZZGk2Zlc2MHlUQ2w4aldHYUp5anBUamNQ?=
 =?utf-8?B?Z0hsR09XVU9uWUJwOEpBMEwzTlpjSWdGL3F1WHVnVWJwczIzS1NGRllIOE9r?=
 =?utf-8?B?MVRNNEJaUE15U1RtMzFJSlo2TGtheGRGdlM1QlB3N0lDS2xrQXorLy9UeHNE?=
 =?utf-8?B?M2M0RGJLU0pKWkkvWjZWVUpMZUpTK1V0Qk45MThtTGtidUxGWDJhTW5UWFFP?=
 =?utf-8?B?R2c2dEhsR2JXNTNuUW5LNnpSRGh2Vmh5MzY1aWZ2TndUN3VFbnJ0L3JOaXQ2?=
 =?utf-8?B?WXNtOEpoYlBPSzVuKzlicTdOMEpUZjhaOEo4dWlpVi9ReVBJY2syMXBFUVlH?=
 =?utf-8?B?YzhhUWhmdU1GclhxWXBpZmJTay8zWVI2SFVWai9md1FoR05zYWgzdTlxSmk2?=
 =?utf-8?B?bUZMTGhLVVFEZEI3ZHJyVkt6OEFwSUx6MzVjV05TanRIN0Q0cHBab3JWSFIz?=
 =?utf-8?B?UWVrYTJ1amk3SEV0NlNJRmYzdzlmTTZNYUg4eXdpdnIrVXNsUEUyQkxlNEdG?=
 =?utf-8?B?R1dqNm5pQzlxOG5wdklBdmpnZnhVWllib0RVWm9wWnR6aXd2QVBYN0x4TEZj?=
 =?utf-8?B?b3NCbWwvUEw3ZUZWd3ZoYVN3RnpHSDBLeDdUOTZ6dEFGKzE3RUJBcm1ZenRm?=
 =?utf-8?B?VWJLYWFTekx5VGVIckNmc0w2ZHlIL0d1M1E0SzdOMTZrakFlZEZhYUNYV21J?=
 =?utf-8?B?OC8wYlJidFJLWkM4bWtMVUY3N2loQnlhcGg3cHVRL20vRFM3d1lrT1RXTUNX?=
 =?utf-8?B?OTRUaklPYTUwSmcvVEc3TVlmYzdhRURVcDltSEhaNmNLN1A0KzlDU2QrbmRP?=
 =?utf-8?B?QVNicmYwaEljbGhKcVF3cTQ0ZngxdGk0cW1EM1VJU2p5N3NYMVlnYm1aOEFC?=
 =?utf-8?B?M2FqM01Yb2kwRnNnc2dJQmVoelRMYVZDTjdLNFNhWHY5b0RLQUM0OFNLbWla?=
 =?utf-8?B?U1VDcHp2WXZ5L1pHZFFiMVRuWC8vQXNPMXFhbzNSRjRLRTgwLzJla0ZMVG1S?=
 =?utf-8?B?eHAraWRHNWErU1JvbkFNRnFNTE5FaWpDdDBDeXE5Tjh4NFdyUENEckZramgw?=
 =?utf-8?B?QXAzcjlyaW4xNThGdzl0Wk55ZVZlbkc3UVQycFRhbXVYRm0yam5vb0lqUUVD?=
 =?utf-8?B?R1lRVUNwTkdjV1JFWCtSZGJoUU1iZGtBcm1hQUNSeTNDcWN5aXBRQmdxNDBF?=
 =?utf-8?B?bW5OcmRpSjFMUklvSXdTK3VhUzNhMXY1YURJWVB0c09BMnV4VVQ0MllqREQ4?=
 =?utf-8?Q?CtvkpvGppjyckQRKUX5DpeIkxrjO5MOofhJGv+Y?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2494
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	938458ba-e00c-48bc-d612-08d91a9b021a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WBSpnQqi3HVxHaN031snA7ZWooCA2Y6V9ffO9w+EQRSBph2dkG6b6kSEEgmyaXM6ou8rC1zVIDcQSjKwZ4ZLCQmE8dWULxdl/7qOtJDl5L+Uy1oJfnzL4aOpPzbrGVGafAuh6HsET+86p0VwHekFXJRoaS2TT0B6NOQ2Y+tks+P4YllD1iboslfj4sM3AQLa41gubXfggqTo6Hq78y0+LlayXB3MPu13vhnufnviI2ftzNBvquyfnVp2Ne0IfqGxGksPi41dF9GGAmkdoVvQddZZZvJitfJuSlZdLKhcG84oiav4FsF1IH6UafXubh5cH3Y2pi4EC/6BRyVSORj+rFjmN3byNu7PKsYXFNssHPEJG8b5+ARl0MFPFCDIqWw+qG7E6daoi57ykslqDGdw9ByVFHZWZK4+DclhmS2hM8EzAFEtq/WzpXnEdXBpWDX1u5AHid/QzsUNTDhIlnUp+PzE2T+KdXxItxj+CQrgc7xQvSnCt5fhD+7sF4TpUmqjYdPV7Y5InbSCtuah3qUT2wbsC6DiAZH5W2FeWrYZsNJ1rIro9ePzTNVIpBwo3QLdAgL7F7N5c/WCDFGajNYg1doKhPuyN6QHIxIP3gQNFhpKTZW7u36kehOOIlxw/08VMPIXJG172adFxx+zA9r1/6mMqOzho+ktmUoshhuGZxk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(46966006)(36840700001)(86362001)(110136005)(336012)(9686003)(5660300002)(54906003)(316002)(2906002)(8676002)(52536014)(82310400003)(4326008)(107886003)(6506007)(70206006)(53546011)(26005)(82740400003)(83380400001)(8936002)(36860700001)(47076005)(55016002)(186003)(356005)(7696005)(33656002)(70586007)(81166007)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 07:52:21.2196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35666b76-6cb8-41b3-fa71-08d91a9b0868
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3285

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVHVlc2RheSwgTWF5IDE4LCAyMDIxIDg6
MTMgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQu
TWFycXVpc0Bhcm0uY29tPjsgV2VpIENoZW4NCj4gPFdlaS5DaGVuQGFybS5jb20+OyBuZCA8bmRA
YXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gc3N0YWJlbGxpbmlA
a2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDA3LzEwXSB4ZW4vYXJtOiBpbnRydWR1
Y2UgYWxsb2NfZG9tc3RhdGljX3BhZ2VzDQo+IA0KPiBIaSBQZW5ueSwNCj4gDQo+IE9uIDE4LzA1
LzIwMjEgMDk6NTcsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+
IFNlbnQ6IFR1ZXNkYXksIE1heSAxOCwgMjAyMSAzOjM1IFBNDQo+ID4+IFRvOiBQZW5ueSBaaGVu
ZyA8UGVubnkuWmhlbmdAYXJtLmNvbT4NCj4gPj4gQ2M6IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRy
YW5kLk1hcnF1aXNAYXJtLmNvbT47IFdlaSBDaGVuDQo+ID4+IDxXZWkuQ2hlbkBhcm0uY29tPjsg
bmQgPG5kQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiA+
PiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiA+PiBTdWJqZWN0OiBS
ZTogW1BBVENIIDA3LzEwXSB4ZW4vYXJtOiBpbnRydWR1Y2UgYWxsb2NfZG9tc3RhdGljX3BhZ2Vz
DQo+ID4+DQo+ID4+IE9uIDE4LjA1LjIwMjEgMDc6MjEsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+
Pj4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4gPj4+ICsrKyBiL3hlbi9jb21tb24v
cGFnZV9hbGxvYy5jDQo+ID4+PiBAQCAtMjQ0Nyw2ICsyNDQ3LDkgQEAgaW50IGFzc2lnbl9wYWdl
cygNCj4gPj4+ICAgICAgIHsNCj4gPj4+ICAgICAgICAgICBBU1NFUlQocGFnZV9nZXRfb3duZXIo
JnBnW2ldKSA9PSBOVUxMKTsNCj4gPj4+ICAgICAgICAgICBwYWdlX3NldF9vd25lcigmcGdbaV0s
IGQpOw0KPiA+Pj4gKyAgICAgICAgLyogdXNlIHBhZ2Vfc2V0X3Jlc2VydmVkX293bmVyIHRvIHNl
dCBpdHMgcmVzZXJ2ZWQgZG9tYWluIG93bmVyLg0KPiA+PiAqLw0KPiA+Pj4gKyAgICAgICAgaWYg
KCAocGdbaV0uY291bnRfaW5mbyAmIFBHQ19yZXNlcnZlZCkgKQ0KPiA+Pj4gKyAgICAgICAgICAg
IHBhZ2Vfc2V0X3Jlc2VydmVkX293bmVyKCZwZ1tpXSwgZCk7DQo+ID4+DQo+ID4+IE5vdyB0aGlz
IGlzIHB1enpsaW5nOiBXaGF0J3MgdGhlIHBvaW50IG9mIHNldHRpbmcgdHdvIG93bmVyIGZpZWxk
cyB0bw0KPiA+PiB0aGUgc2FtZSB2YWx1ZT8gSSBhbHNvIGRvbid0IHJlY2FsbCB5b3UgaGF2aW5n
IGludHJvZHVjZWQNCj4gPj4gcGFnZV9zZXRfcmVzZXJ2ZWRfb3duZXIoKSBmb3IgeDg2LCBzbyBo
b3cgaXMgdGhpcyBnb2luZyB0byBidWlsZCB0aGVyZT8NCj4gPj4NCj4gPg0KPiA+IFRoYW5rcyBm
b3IgcG9pbnRpbmcgb3V0IHRoYXQgaXQgd2lsbCBmYWlsIG9uIHg4Ni4NCj4gPiBBcyBmb3IgdGhl
IHNhbWUgdmFsdWUsIHN1cmUsIEkgc2hhbGwgY2hhbmdlIGl0IHRvIGRvbWlkX3QgZG9taWQgdG8g
cmVjb3JkIGl0cw0KPiByZXNlcnZlZCBvd25lci4NCj4gPiBPbmx5IGRvbWlkIGlzIGVub3VnaCBm
b3IgZGlmZmVyZW50aWF0ZS4NCj4gPiBBbmQgZXZlbiB3aGVuIGRvbWFpbiBnZXQgcmVib290ZWQs
IHN0cnVjdCBkb21haW4gbWF5IGJlIGRlc3Ryb3llZCwgYnV0DQo+ID4gZG9taWQgd2lsbCBzdGF5
cyBUaGUgc2FtZS4NCj4gPiBNYWpvciB1c2VyIGNhc2VzIGZvciBkb21haW4gb24gc3RhdGljIGFs
bG9jYXRpb24gYXJlIHJlZmVycmluZyB0byB0aGUNCj4gPiB3aG9sZSBzeXN0ZW0gYXJlIHN0YXRp
YywgTm8gcnVudGltZSBjcmVhdGlvbi4NCj4gDQo+IE9uZSBtYXkgd2FudCB0byBoYXZlIHN0YXRp
YyBtZW1vcnkgeWV0IGRvZXNuJ3QgY2FyZSBhYm91dCB0aGUgZG9taWQuIFNvIEkNCj4gYW0gbm90
IGluIGZhdm9yIHRvIHJlc3RyaWN0IGFib3V0IHRoZSBkb21pZCB1bmxlc3MgdGhlcmUgaXMgbm8g
b3RoZXIgd2F5Lg0KPiANCg0KVGhlIHVzZXIgY2FzZSB5b3UgYnJpbmcgdXAgaGVyZSBpcyB0aGF0
IHN0YXRpYyBtZW1vcnkgcG9vbD8gDQoNClJpZ2h0IG5vdywgdGhlIHVzZXIgY2FzZXMgYXJlIG1v
c3RseSByZXN0cmljdGVkIHRvIHN0YXRpYyBzeXN0ZW0uDQpJZiB3ZSBicmluZyBydW50aW1lIGFs
bG9jYXRpb24sIGB4bGAgaGVyZSwgaXQgd2lsbCBhZGQgYSBsb3QgbW9yZSBjb21wbGV4aXR5LiAN
CkJ1dCBpZiB0aGUgc3lzdGVtIGhhcyBzdGF0aWMgYmVoYXZpb3IsIHRoZSBkb21pZCBpcyBhbHNv
IHN0YXRpYy4gDQoNCk9uIHJlYm9vdGluZyBkb21haW4gZnJvbSBzdGF0aWMgbWVtb3J5IHBvb2ws
IGl0IGJyaW5ncyB1cCBtb3JlIGRpc2N1c3Npb24sIGxpa2UNCmRvIHdlIGludGVuZCB0byBnaXZl
IHRoZSBtZW1vcnkgYmFjayB0byBzdGF0aWMgbWVtb3J5IHBvb2wgd2hlbiByZWJvb3RpbmcsDQpp
ZiBzbywgcmFtIGNvdWxkIGJlIGFsbG9jYXRlZCBmcm9tIGRpZmZlcmVudCBwbGFjZSBjb21wYXJl
ZCB3aXRoIHRoZSBwcmV2aW91cyBvbmUuDQpBbmQgaXQga2luZHMgZGVzdHJveXMgc3lzdGVtIHN0
YXRpYyBiZWhhdmlvci4gDQoNCm9yIG5vdCBnaXZpbmcgYmFjaywganVzdCBzdG9yZSBpdCBpbiBn
bG9iYWwgdmFyaWFibGUgYHN0cnVjdCBwYWdlX2luZm8gKltET01JRF1gIGxpa2UgdGhlDQpvdGhl
cnMuIA0KDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0KDQpDaGVlcnMNCg0K
UGVubnkgWmhlbmcNCg==

