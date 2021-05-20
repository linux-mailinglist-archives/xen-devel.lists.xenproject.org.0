Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C1E38A005
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 10:41:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130728.244715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljeEE-0005Qb-LM; Thu, 20 May 2021 08:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130728.244715; Thu, 20 May 2021 08:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljeEE-0005Nh-I2; Thu, 20 May 2021 08:40:26 +0000
Received: by outflank-mailman (input) for mailman id 130728;
 Thu, 20 May 2021 08:40:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yP7T=KP=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1ljeEC-0005Na-An
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 08:40:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.62]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 085aee99-1923-47d1-b6b4-20d16fea9a61;
 Thu, 20 May 2021 08:40:21 +0000 (UTC)
Received: from DB6PR0301CA0100.eurprd03.prod.outlook.com (2603:10a6:6:30::47)
 by AM0PR08MB5315.eurprd08.prod.outlook.com (2603:10a6:208:18e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 08:40:20 +0000
Received: from DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::75) by DB6PR0301CA0100.outlook.office365.com
 (2603:10a6:6:30::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Thu, 20 May 2021 08:40:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT027.mail.protection.outlook.com (10.152.20.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Thu, 20 May 2021 08:40:20 +0000
Received: ("Tessian outbound 0f1e4509c199:v92");
 Thu, 20 May 2021 08:40:19 +0000
Received: from 1f7cd618013a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A1A07728-D74C-489F-B569-8ACEE9411D98.1; 
 Thu, 20 May 2021 08:40:09 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1f7cd618013a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 May 2021 08:40:09 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB2672.eurprd08.prod.outlook.com (2603:10a6:802:1c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.28; Thu, 20 May
 2021 08:40:07 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5%6]) with mapi id 15.20.4129.035; Thu, 20 May 2021
 08:40:07 +0000
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
X-Inumbo-ID: 085aee99-1923-47d1-b6b4-20d16fea9a61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9wtlUhWO35YfeOykc3hwJSJu2Gmu6QDo3KokY3O7i4=;
 b=ypFJFIdUKGE39AxMr7zKxKCCQ0Y2/xHDKAfWXkEFo7m1DCllEsjOOgCwyd2EypZqX7GIiSLp9KfLMruEIT+6cLM/Ss/UgwwaesFKPifpYCBEgXMCmBzHkem8b5G6B0+HMcQWKcq5J5karlQHXUsvJh2DN6ZvdnRND+D5vNT6/3c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QVnT0Z/hM1oIwRGYYubCb4N4p5pXSl1MbffliZBVS2k/h30OlQb2D2ExO+1EQTbQw3izB+HRKfFBGxfHVfC9ZfWjRW0r5AI1Icbzi8oCyt5ZSV0vyj6GZ4oQN6tBC2kag+WNC+qJmReenJ3xxcyEtvKlK8kDIxeISfLXXkMV+jbb1NVpdpO9Pt/T8RNEMKLv7IB3geiN49rLI1Tz6eMw/DrHpjw9ZZycWkSXh192TSukq2Oqjyh7LLwQ4ufg69TiP5HdhwCUGp5P2LUSKGmbUIeBd9zF0QhntnOqDL4I9hd9tUPviEDwzT3iLX+giT8Q/4lKGHW2LTsRs+oJtvBMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9wtlUhWO35YfeOykc3hwJSJu2Gmu6QDo3KokY3O7i4=;
 b=DBidUJdGNWV1ChXj5PW9y0rX2iV4fy+3Buq5z+LgV2Si4F9NtSztALL0tETahyQvOyRvpKllQZ1QkIHP42J11A+qsMuYk+17+haamiqjCntn+GKmYFZXU+Znzd6OJGIdY9tElPKkwCaxENNR4iGkpql7DKtCJn+srtEmjS6LOQm1B7jQVlcZC/HsKjAcV8UvAqGgAemBQpD3Q9crDHQeCfpyhmb3tNnGhVGMtBn+vzpQlkoYZKOWyf8ia8hstc1rxkDa8salzPugrZ+MPbZ92xTov3wM18ldgdvoY4gZaO+bydTP23BgA0F5xRljPxcrh7JgFvU7cxP54o4Sg6J5/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9wtlUhWO35YfeOykc3hwJSJu2Gmu6QDo3KokY3O7i4=;
 b=ypFJFIdUKGE39AxMr7zKxKCCQ0Y2/xHDKAfWXkEFo7m1DCllEsjOOgCwyd2EypZqX7GIiSLp9KfLMruEIT+6cLM/Ss/UgwwaesFKPifpYCBEgXMCmBzHkem8b5G6B0+HMcQWKcq5J5karlQHXUsvJh2DN6ZvdnRND+D5vNT6/3c=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH 03/10] xen/arm: introduce PGC_reserved
Thread-Topic: [PATCH 03/10] xen/arm: introduce PGC_reserved
Thread-Index: AQHXS6W8Xfb+Jc0d2U+rpPnqyW8lIKro/c8AgAEW9PCAASMugIAArd6wgAAeryA=
Date: Thu, 20 May 2021 08:40:07 +0000
Message-ID:
 <VE1PR08MB5215E19BFE3E7F329229D8E7F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-4-penny.zheng@arm.com>
 <bc6a20ef-675d-bbd6-74f7-4ecc45805ee7@xen.org>
 <VE1PR08MB5215F3ECA8B5D9624E34A794F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <2f4eb08e-261b-70c4-bcbc-e08db36a50a9@xen.org>
 <VE1PR08MB52155DD56E548E98AE937CE8F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
In-Reply-To:
 <VE1PR08MB52155DD56E548E98AE937CE8F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CCD544482997E74FAD1A226D6DFF10FD.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 52698d92-1f68-4db6-9c74-08d91b6ae6b2
x-ms-traffictypediagnostic: VI1PR08MB2672:|AM0PR08MB5315:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB5315D0331B078610B418A279F72A9@AM0PR08MB5315.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hLwQ5qZs7UyqAabZltMX2pKhhMJqdJxbOJgZzNA8yIsMXeWWZ918Kwb1HifABNI1602+ydK5+gPzT9wWeJIgqho9aKr31Ogt+IOMUk3cy/zSX/RHkCK/maH/NQQAxdf1NFpzVFC4OjAmlOWNTzC0CmrDbna4Oi6BR5YM4DGOdXxFvppL75IkVcOfeUzLr1693JE+Bh+XBCiImzXr45dwheYq5C2hN+xo5J05jJTLEv0TKohXso4fsJHfQIpPOh6Z4C51kpWiSQeJki9tNDrs+8U+44w0MmH/2ohXtU2PNsHa/e+c4gdWhVnn5931D2yLhSqg1mLpSXx1HM/FvLze8tWy1LGFi5eCBJIl9Cn4OCBDfQ/orZjUaPkDcLlmGzrt50wwOWyafqoJoeT8e2dyO97qJEDXSpMTMh7g0vMBoo5TbZzBrR5A9TEiVeFfFLfdkBEU0lvkX8wnbRCmaolwBozoekHjzkp+pRespUcB/kMAgS4Ts78E8GmHCnNNWNGGqWVcJw3+fjzRatHI+ocH5eBq1MaIKZpj52/tcech5K6kZOMA+zgHejCEUVdWDj6ooqZZKfzpkcqj6lh0UD34xnkkxdmWc1t7UPd5Y11S9ZA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(9686003)(53546011)(2906002)(64756008)(5660300002)(55016002)(66446008)(26005)(52536014)(7696005)(33656002)(2940100002)(478600001)(6506007)(76116006)(66946007)(122000001)(83380400001)(54906003)(8676002)(66556008)(4326008)(71200400001)(186003)(110136005)(86362001)(8936002)(66476007)(316002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?VXJLUnF6SzdydjBjRlBGQXNMSHB3dG11VmNHUFl3OWlyVzZmN2JrZkZmS1Nz?=
 =?utf-8?B?YWVoMm5RSGVjdVRCWk9kOTVpa3BRV0FvTWNPYU9xTlNkVktlOUd3RFBaaTJX?=
 =?utf-8?B?b2ZaTWdtRnU5MjNYQXZGZTZiNW5lVzJDNUN1R2d2Zk5oQVpwL1hvMk9rU21Y?=
 =?utf-8?B?SU5laDJST2FKeWVFK281RHhYTG5KMU9oaXFUalZDV1JnVkMzYnlCRDdkRms0?=
 =?utf-8?B?eWRQZkR3bS9kUHd6eHJpY1FpSnhTVG8yV0ZmUGhwWEpTV3k2T0ZlcWU3VWZr?=
 =?utf-8?B?ZVpmakxzUlpCL3FNenBvc2xHeTZiczFTcndyMXJGbno5VG1OZVpWS1pKKzMy?=
 =?utf-8?B?UzFIWHdTRE1iamJYRWdudXFrdlZzMTFzcUl1cFUxSTFweG9NMjRkamFrNTJP?=
 =?utf-8?B?dlZoaGNtVjFFRXZNZWF1YllEYkpHOTN4YXZTNFcxVHVHTlFrYWNaaGQ4L3hx?=
 =?utf-8?B?Qnh5bTYydlBiMDd0eUNic3oyc3o2aTdqdngvcUMzSjFIY0wydk1kaThjVkxO?=
 =?utf-8?B?bEpDeFRoeGVjRi9iL0M0REFyU3Y5VnAwZTRoUkM5aW1YN1pqcFZQUE5LUVFx?=
 =?utf-8?B?dzhwY2g5OVlYdklqbmFYbXZyWVppWHJKM3dHVlhKUFR4eCtFMlpoRGVVQ0FQ?=
 =?utf-8?B?dThTcGVHWG9hbFNwVmhUQTdXQVk0dUgrMFJyU2t6aFkzNEpQRnNCQXFUOWNN?=
 =?utf-8?B?NUdROGt6bWhPUllvMGFYb3RNM0VBaXpHTE9hUHEvMU1XL1ZlZ1cwVUZRTjdY?=
 =?utf-8?B?VWhoZU1JakpqZm8zdUxKREdiRk9YU3BRVjVnSGFvU2ZLQWZ1MmNtZ2dnZ0VI?=
 =?utf-8?B?RlUyQU51NElVSXNtOS9idGFlbnoxQk5zdzdDenhOYVh0NmE5NjUvdjZaekp5?=
 =?utf-8?B?MGJGSW1SMEZGSUtZWUZZUEw4aE9MakNjR3ZSREkwSCtJVnc3Z2FGeExkM2RV?=
 =?utf-8?B?MWx1VWJibVl1YXNNY0FPbFBrYUh2YXFzT1V0YTdrcTlkZDdwYmVrbWlyVWhn?=
 =?utf-8?B?ZkZHbjhQY0ppTGtVeWU4MzdaejF1YmtOSVRHTVAxcHEvYnR3NXVoNWFteHNu?=
 =?utf-8?B?bXM1TWIwd0d1M2N3SUNXZGZwQU5leFQ2UUVpN1FlSGMvNEhXNXRpd1Mrek1h?=
 =?utf-8?B?Z2JLYjlMN2llUHpnY2JaZDJTR1lUWTM4K0xOcFdEM2VUWlhVdEVUaEpxNHFj?=
 =?utf-8?B?dlByN052QnlkRjNhNmtlWi8ybmh1WGEzMHdPczlMNm14WTY2YWRpU2FVRm1t?=
 =?utf-8?B?T0ZjZjZqR2w0Z1luV2Vob3F4SXpFSG1LYkxOcFhlTExKK2tvT0xRTmxvRVh0?=
 =?utf-8?B?NUFSNXNtNzJwTnA5YWJCNjgzZVlKZXEwNis5bnF4aTlnVWE2RlVJWldIVTJa?=
 =?utf-8?B?cGdqMEVHTE0vdWlnZFZ0NXlqYVhFYnpxS0x6ZXZDRkRzYWJjTjlXdWdoVTE1?=
 =?utf-8?B?U1VxRjhzbWIveHFZSjRIaE9CVHg0ditLR0UrQVdQMnZIK0FjNGtFNHp4bjBJ?=
 =?utf-8?B?b25URjV6TUxLRmEyQ2VuVVFxUlBzWnYzRWpDKzBrajFsbUdNUlErNFlWRTZG?=
 =?utf-8?B?c29zZjQzMmZySVkrRWFkczloOE5DU3d4MXp6dzZiYWVBMVJZNUh3cEY2c3dN?=
 =?utf-8?B?cHc0b0cxZ1dDekdjT2pBbmUzVjErS1RNbElRdmxHVm5UZEEwT0pRbXBWZmlI?=
 =?utf-8?B?V0VaTHllREZnM3lOazl1QWNYY0dHbHNISWppVzRkd0ZCaHBDNlVsajRIZmZt?=
 =?utf-8?Q?KElDwHMYgNcGII9uN9QLh2MGstddd9sIxthHEvh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2672
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	21e42153-eb96-4b3d-892b-08d91b6adf3c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xeRQ+vJUqXXHcyoFdN91d4O+/FNElBvFUIbBf3pjg6SBU7067Xyhy2HS8AfsSUtNVZJCL8N7lNnV3ZkzJ+T+K6aoLq9QOaqCVKvSsVe7x+F/oFqjrU7gZ68ZVmzMYjYcSamDFrqSau2uzhpWesxajm41Z+bWrvQK+vMsOWuiA+u5i3sFlc2z0EoAu1/H6kUiGUpvXS+6uCr5IocD16Ixthf1RekarErabtQ3hyxldsSuarSqm/FCx58ngEqSq/HdF94rg/WIk2HyW1HMM+1ZeHgtOLBC+dxhg6PT1deeHN2vqAVzZs3NDvtMjpSqLoIOb2b2cDgMvVZj9Q3U6hGV9qMbRrvAdb/1l6xFINj9/swhRuyDLESEMq/MLkiDrl+ee4KB3uOK0izDlY1tqdSG4ee7pDyVkxQC9j9Jsd79OVDtOmw/3vpES29kU254aLW/92DqPjPWur2GgE5Y3kJf8tqc81VQBt+3M6Pw3HZ7/w9gZ0mwA0J6/rPYzFCWVfjdjrgFIMemjYo+uFhiyS5RLm3N3tQGoXJTpWH38hIQSdFVWrtZi/6KfNTQQ0ZIKy8y60GWErSj+NWuWof62mP/5ia8l36sGISdg28wFD5saF5ycUnKm7AcCb7LQEgB6qYB/3PgHOQu9FdVNugBtqkGeqtVSam8fJBA7AVkX7P9a5M=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(36840700001)(46966006)(86362001)(52536014)(36860700001)(2906002)(70586007)(53546011)(70206006)(82310400003)(33656002)(5660300002)(55016002)(26005)(6506007)(356005)(9686003)(2940100002)(82740400003)(4326008)(81166007)(478600001)(336012)(186003)(47076005)(8676002)(110136005)(316002)(8936002)(54906003)(7696005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 08:40:20.0494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52698d92-1f68-4db6-9c74-08d91b6ae6b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5315

SGkganVsaWVuIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBlbm55
IFpoZW5nDQo+IFNlbnQ6IFRodXJzZGF5LCBNYXkgMjAsIDIwMjEgMjoyMCBQTQ0KPiBUbzogSnVs
aWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZzsNCj4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZw0KPiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVy
dHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgV2VpIENoZW4NCj4gPFdlaS5DaGVuQGFybS5jb20+OyBu
ZCA8bmRAYXJtLmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRDSCAwMy8xMF0geGVuL2FybTogaW50
cm9kdWNlIFBHQ19yZXNlcnZlZA0KPiANCj4gSGkgSnVsaWVuDQo+IA0KPiA+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4N
Cj4gPiBTZW50OiBUaHVyc2RheSwgTWF5IDIwLCAyMDIxIDM6NDYgQU0NCj4gPiBUbzogUGVubnkg
WmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmc7DQo+ID4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZw0KPiA+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA+IDxXZWkuQ2hlbkBhcm0u
Y29tPjsgbmQgPG5kQGFybS5jb20+DQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAwMy8xMF0geGVu
L2FybTogaW50cm9kdWNlIFBHQ19yZXNlcnZlZA0KPiA+DQo+ID4NCj4gPg0KPiA+IE9uIDE5LzA1
LzIwMjEgMDQ6MTYsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+ID4gSGkgSnVsaWVuDQo+ID4NCj4g
PiBIaSBQZW5ueSwNCj4gPg0KPiA+ID4NCj4gPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+ID4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4gPj4gU2Vu
dDogVHVlc2RheSwgTWF5IDE4LCAyMDIxIDU6NDYgUE0NCj4gPiA+PiBUbzogUGVubnkgWmhlbmcg
PFBlbm55LlpoZW5nQGFybS5jb20+Ow0KPiA+ID4+IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZzsgc3N0YWJlbGxpbmlAa2VybmVsLm9yZw0KPiA+ID4+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA+ID4+IDxXZWkuQ2hlbkBh
cm0uY29tPjsgbmQgPG5kQGFybS5jb20+DQo+ID4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCAwMy8x
MF0geGVuL2FybTogaW50cm9kdWNlIFBHQ19yZXNlcnZlZA0KPiA+ID4+DQo+ID4gPj4NCj4gPiA+
Pg0KPiA+ID4+IE9uIDE4LzA1LzIwMjEgMDY6MjEsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+ID4+
PiBJbiBvcmRlciB0byBkaWZmZXJlbnRpYXRlIHBhZ2VzIG9mIHN0YXRpYyBtZW1vcnksIGZyb20g
dGhvc2UNCj4gPiA+Pj4gYWxsb2NhdGVkIGZyb20gaGVhcCwgdGhpcyBwYXRjaCBpbnRyb2R1Y2Vz
IGEgbmV3IHBhZ2UgZmxhZw0KPiA+ID4+PiBQR0NfcmVzZXJ2ZWQNCj4gPiB0byB0ZWxsLg0KPiA+
ID4+Pg0KPiA+ID4+PiBOZXcgc3RydWN0IHJlc2VydmVkIGluIHN0cnVjdCBwYWdlX2luZm8gaXMg
dG8gZGVzY3JpYmUgcmVzZXJ2ZWQNCj4gPiA+Pj4gcGFnZSBpbmZvLCB0aGF0IGlzLCB3aGljaCBz
cGVjaWZpYyBkb21haW4gdGhpcyBwYWdlIGlzIHJlc2VydmVkDQo+ID4gPj4+IHRvLiA+IEhlbHBl
ciBwYWdlX2dldF9yZXNlcnZlZF9vd25lciBhbmQgcGFnZV9zZXRfcmVzZXJ2ZWRfb3duZXINCj4g
PiA+Pj4gYXJlIGRlc2lnbmF0ZWQgdG8gZ2V0L3NldCByZXNlcnZlZCBwYWdlJ3Mgb3duZXIuDQo+
ID4gPj4+DQo+ID4gPj4+IFN0cnVjdCBkb21haW4gaXMgZW5sYXJnZWQgdG8gbW9yZSB0aGFuIFBB
R0VfU0laRSwgZHVlIHRvDQo+ID4gPj4+IG5ld2x5LWltcG9ydGVkIHN0cnVjdCByZXNlcnZlZCBp
biBzdHJ1Y3QgcGFnZV9pbmZvLg0KPiA+ID4+DQo+ID4gPj4gc3RydWN0IGRvbWFpbiBtYXkgZW1i
ZWQgYSBwb2ludGVyIHRvIGEgc3RydWN0IHBhZ2VfaW5mbyBidXQgbmV2ZXINCj4gPiA+PiBkaXJl
Y3RseSBlbWJlZCB0aGUgc3RydWN0dXJlLiBTbyBjYW4geW91IGNsYXJpZnkgd2hhdCB5b3UgbWVh
bj8NCj4gPiA+Pg0KPiA+ID4+Pg0KPiA+ID4+PiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVuZyA8
cGVubnkuemhlbmdAYXJtLmNvbT4NCj4gPiA+Pj4gLS0tDQo+ID4gPj4+ICAgIHhlbi9pbmNsdWRl
L2FzbS1hcm0vbW0uaCB8IDE2ICsrKysrKysrKysrKysrKy0NCj4gPiA+Pj4gICAgMSBmaWxlIGNo
YW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+Pj4NCj4gPiA+Pj4g
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaCBiL3hlbi9pbmNsdWRlL2FzbS1h
cm0vbW0uaA0KPiA+ID4+IGluZGV4DQo+ID4gPj4+IDBiN2RlMzEwMmUuLmQ4OTIyZmQ1ZGIgMTAw
NjQ0DQo+ID4gPj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaA0KPiA+ID4+PiArKysg
Yi94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgNCj4gPiA+Pj4gQEAgLTg4LDcgKzg4LDE1IEBAIHN0
cnVjdCBwYWdlX2luZm8NCj4gPiA+Pj4gICAgICAgICAgICAgKi8NCj4gPiA+Pj4gICAgICAgICAg
ICB1MzIgdGxiZmx1c2hfdGltZXN0YW1wOw0KPiA+ID4+PiAgICAgICAgfTsNCj4gPiA+Pj4gLSAg
ICB1NjQgcGFkOw0KPiA+ID4+PiArDQo+ID4gPj4+ICsgICAgLyogUGFnZSBpcyByZXNlcnZlZC4g
Ki8NCj4gPiA+Pj4gKyAgICBzdHJ1Y3Qgew0KPiA+ID4+PiArICAgICAgICAvKg0KPiA+ID4+PiAr
ICAgICAgICAgKiBSZXNlcnZlZCBPd25lciBvZiB0aGlzIHBhZ2UsDQo+ID4gPj4+ICsgICAgICAg
ICAqIGlmIHRoaXMgcGFnZSBpcyByZXNlcnZlZCB0byBhIHNwZWNpZmljIGRvbWFpbi4NCj4gPiA+
Pj4gKyAgICAgICAgICovDQo+ID4gPj4+ICsgICAgICAgIHN0cnVjdCBkb21haW4gKmRvbWFpbjsN
Cj4gPiA+Pj4gKyAgICB9IHJlc2VydmVkOw0KPiA+ID4+DQo+ID4gPj4gVGhlIHNwYWNlIGluIHBh
Z2VfaW5mbyBpcyBxdWl0ZSB0aWdodCwgc28gSSB3b3VsZCBsaWtlIHRvIGF2b2lkDQo+ID4gPj4g
aW50cm9kdWNpbmcgbmV3IGZpZWxkcyB1bmxlc3Mgd2UgY2FuJ3QgZ2V0IGF3YXkgZnJvbSBpdC4N
Cj4gPiA+Pg0KPiA+ID4+IEluIHRoaXMgY2FzZSwgaXQgaXMgbm90IGNsZWFyIHdoeSB3ZSBuZWVk
IHRvIGRpZmZlcmVudGlhdGUgdGhlICJPd25lciINCj4gPiA+PiB2cyB0aGUgIlJlc2VydmVkIE93
bmVyIi4gSXQgbWlnaHQgYmUgY2xlYXJlciBpZiB0aGlzIGNoYW5nZSBpcw0KPiA+ID4+IGZvbGRl
ZCBpbiB0aGUgZmlyc3QgdXNlciBvZiB0aGUgZmllbGQuDQo+ID4gPj4NCj4gPiA+PiBBcyBhbiBh
c2lkZSwgZm9yIDMyLWJpdCBBcm0sIHlvdSBuZWVkIHRvIGFkZCBhIDQtYnl0ZSBwYWRkaW5nLg0K
PiA+ID4+DQo+ID4gPg0KPiA+ID4gWWVhaCwgSSBtYXkgZGVsZXRlIHRoaXMgY2hhbmdlLiBJIGlt
cG9ydGVkIHRoaXMgY2hhbmdlIGFzDQo+ID4gPiBjb25zaWRlcmluZyB0aGUgZnVuY3Rpb25hbGl0
eSBvZiByZWJvb3RpbmcgZG9tYWluIG9uIHN0YXRpYyBhbGxvY2F0aW9uLg0KPiA+ID4NCj4gPiA+
IEEgbGl0dGxlIG1vcmUgZGlzY3Vzc2lvbiBvbiByZWJvb3RpbmcgZG9tYWluIG9uIHN0YXRpYyBh
bGxvY2F0aW9uLg0KPiA+ID4gQ29uc2lkZXJpbmcgdGhlIG1ham9yIHVzZXIgY2FzZXMgZm9yIGRv
bWFpbiBvbiBzdGF0aWMgYWxsb2NhdGlvbiBhcmUNCj4gPiA+IHN5c3RlbSBoYXMgYSB0b3RhbCBw
cmUtZGVmaW5lZCwgc3RhdGljIGJlaGF2aW9yIGFsbCB0aGUgdGltZS4gTm8NCj4gPiA+IGRvbWFp
biBhbGxvY2F0aW9uIG9uIHJ1bnRpbWUsIHdoaWxlIHRoZXJlIHN0aWxsIGV4aXN0cyBkb21haW4g
cmVib290aW5nLg0KPiA+DQo+ID4gSG1tbS4uLiBXaXRoIHRoaXMgc2VyaWVzIGl0IGlzIHN0aWxs
IHBvc3NpYmxlIHRvIGFsbG9jYXRlIG1lbW9yeSBhdA0KPiA+IHJ1bnRpbWUgb3V0c2lkZSBvZiB0
aGUgc3RhdGljIGFsbG9jYXRpb24gKHNlZSBteSBjb21tZW50IG9uIHRoZSBkZXNpZ24NCj4gZG9j
dW1lbnQgWzFdKS4NCj4gPiBTbyBpcyBpdCBtZWFudCB0byBiZSBjb21wbGV0ZT8NCj4gPg0KPiAN
Cj4gSSdtIGd1ZXNzaW5nIHRoYXQgdGhlICJhbGxvY2F0ZSBtZW1vcnkgYXQgcnVudGltZSBvdXRz
aWRlIG9mIHRoZSBzdGF0aWMNCj4gYWxsb2NhdGlvbiIgaXMgcmVmZXJyaW5nIHRvIFhFTiBoZWFw
IG9uIHN0YXRpYyBhbGxvY2F0aW9uLCB0aGF0IGlzLCB1c2VycyBwcmUtDQo+IGRlZmluaW5nIGhl
YXAgaW4gZGV2aWNlIHRyZWUgY29uZmlndXJhdGlvbiB0byBsZXQgdGhlIHdob2xlIHN5c3RlbSBt
b3JlIHN0YXRpYw0KPiBhbmQgcHJlZGljdGFibGUuDQo+IA0KPiBBbmQgSSd2ZSByZXBsaWVkIHlv
dSBpbiB0aGUgZGVzaWduIHRoZXJlLCBzb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkuIFNhdmUgeW91
ciB0aW1lLA0KPiBhbmQgSeKAmWxsIHBhc3RlIGhlcmU6DQo+IA0KPiAiUmlnaHQgbm93LCBvbiBB
QXJjaDY0LCBhbGwgUkFNLCBleGNlcHQgcmVzZXJ2ZWQgbWVtb3J5LCB3aWxsIGJlIGZpbmFsbHkN
Cj4gZ2l2ZW4gdG8gYnVkZHkgYWxsb2NhdG9yIGFzIGhlYXAsICBsaWtlIHlvdSBzYWlkLCBndWVz
dCBSQU0gZm9yIG5vcm1hbCBkb21haW4NCj4gd2lsbCBiZSBhbGxvY2F0ZWQgZnJvbSB0aGVyZSwg
eG1hbGxvYyBldmVudHVhbGx5IGlzIGdldCBtZW1vcnkgZnJvbSB0aGVyZSwgZXRjLg0KPiBTbyB3
ZSB3YW50IHRvIHJlZmluZSB0aGUgaGVhcCBoZXJlLCBub3QgaXRlcmF0aW5nIHRocm91Z2ggYGJv
b3RpbmZvLm1lbWAgdG8NCj4gc2V0IHVwIFhFTiBoZWFwLCBidXQgbGlrZSBpdGVyYXRpbmcgYGJv
b3RpbmZvLiByZXNlcnZlZF9oZWFwYCB0byBzZXQgdXAgWEVODQo+IGhlYXAuDQo+IA0KPiBPbiBB
Uk0zMiwgeGVuIGhlYXAgYW5kIGRvbWFpbiBoZWFwIGFyZSBzZXBhcmF0ZWx5IG1hcHBlZCwgd2hp
Y2ggaXMgbW9yZQ0KPiBjb21wbGljYXRlZCBoZXJlLiBUaGF0J3Mgd2h5IEkgb25seSB0YWxraW5n
IGFib3V0IGltcGxlbWVudGluZyB0aGVzZSBmZWF0dXJlcw0KPiBvbiBBQXJjaDY0IGFzIGZpcnN0
IHN0ZXAuIg0KPiANCj4gIEFib3ZlIGltcGxlbWVudGF0aW9uIHdpbGwgYmUgZGVsaXZlcmVkIHRo
cm91Z2ggYW5vdGhlciBwYXRjaCBTZXJpZS4gVGhpcw0KPiBwYXRjaCBTZXJpZSBJcyBvbmx5IGZv
Y3VzaW5nIG9uIERvbWFpbiBvbiBTdGF0aWMgQWxsb2NhdGlvbi4NCj4gDQoNCk9oLCBTZWNvbmQg
dGhvdWdodCBvbiB0aGlzLiANCkFuZCBJIHRoaW5rIHlvdSBhcmUgcmVmZXJyaW5nIHRvIGJhbGxv
b24gaW4vb3V0IGhlcmUsIGhtbSwgYWxzbywgbGlrZQ0KSSByZXBsaWVkIHRoZXJlOg0KIkZvciBp
c3N1ZXMgb24gYmFsbG9vbmluZyBvdXQgb3IgaW4sIGl0IGlzIG5vdCBzdXBwb3J0ZWQgaGVyZS4N
CkRvbWFpbiBvbiBTdGF0aWMgQWxsb2NhdGlvbiBhbmQgMToxIGRpcmVjdC1tYXAgYXJlIGFsbCBi
YXNlZCBvbg0KZG9tMC1sZXNzIHJpZ2h0IG5vdywgc28gbm8gUFYsIGdyYW50IHRhYmxlLCBldmVu
dCBjaGFubmVsLCBldGMsIGNvbnNpZGVyZWQuDQoNClJpZ2h0IG5vdywgaXQgb25seSBzdXBwb3J0
cyBkZXZpY2UgZ290IHBhc3N0aHJvdWdoIGludG8gdGhlIGd1ZXN0LiINCg0KPiA+ID4NCj4gPiA+
IEFuZCB3aGVuIHJlYm9vdGluZyBkb21haW4gb24gc3RhdGljIGFsbG9jYXRpb24sIGFsbCB0aGVz
ZSByZXNlcnZlZA0KPiA+ID4gcGFnZXMgY291bGQgbm90IGdvIGJhY2sgdG8gaGVhcCB3aGVuIGZy
ZWVpbmcgdGhlbS4gIFNvIEkgYW0NCj4gPiA+IGNvbnNpZGVyaW5nIHRvIHVzZSBvbmUgZ2xvYmFs
IGBzdHJ1Y3QgcGFnZV9pbmZvKltET01JRF1gIHZhbHVlIHRvIHN0b3JlLg0KPiA+ID4NCj4gPiA+
IEFzIEphbiBzdWdnZXN0ZWQsIHdoZW4gZG9tYWluIGdldCByZWJvb3RlZCwgc3RydWN0IGRvbWFp
biB3aWxsIG5vdA0KPiA+ID4gZXhpc3QNCj4gPiBhbnltb3JlLg0KPiA+ID4gQnV0IEkgdGhpbmsg
RE9NSUQgaW5mbyBjb3VsZCBsYXN0Lg0KPiA+IFlvdSB3b3VsZCBuZWVkIHRvIG1ha2Ugc3VyZSB0
aGUgZG9taWQgdG8gYmUgcmVzZXJ2ZWQuIEJ1dCBJIGFtIG5vdA0KPiA+IGVudGlyZWx5IGNvbnZp
bmNlZCB0aGlzIGlzIG5lY2Vzc2FyeSBoZXJlLg0KPiA+DQo+ID4gV2hlbiByZWNyZWF0aW5nIHRo
ZSBkb21haW4sIHlvdSBuZWVkIGEgd2F5IHRvIGtub3cgaXRzIGNvbmZpZ3VyYXRpb24uDQo+ID4g
TW9zdGx5IGxpa2VseSB0aGlzIHdpbGwgY29tZSBmcm9tIHRoZSBEZXZpY2UtVHJlZS4gQXQgd2hp
Y2ggcG9pbnQsIHlvdQ0KPiA+IGNhbiBhbHNvIGZpbmQgdGhlIHN0YXRpYyByZWdpb24gZnJvbSB0
aGVyZS4NCj4gPg0KPiANCj4gVHJ1ZSwgdHJ1ZS4gSSdsbCBkaWcgbW9yZSBpbiB5b3VyIHN1Z2dl
c3Rpb24sIHRoeC4g8J+YiQ0KPiANCj4gPiBDaGVlcnMsDQo+ID4NCj4gPiBbMV0gPDdhYjczY2Iw
LTM5ZDUtZjhiZi02NjBmLWIzZDc3ZjMyNDdiZEB4ZW4ub3JnPg0KPiA+DQo+ID4gLS0NCj4gPiBK
dWxpZW4gR3JhbGwNCj4gDQo+IENoZWVycw0KPiANCj4gUGVubnkNCg0KQ2hlZXJzDQoNClBlbm55
DQoNCg==

