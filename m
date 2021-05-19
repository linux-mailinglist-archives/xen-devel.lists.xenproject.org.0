Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D711238873B
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 08:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129864.243546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljFJE-0001DL-Hk; Wed, 19 May 2021 06:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129864.243546; Wed, 19 May 2021 06:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljFJE-0001BS-DO; Wed, 19 May 2021 06:03:56 +0000
Received: by outflank-mailman (input) for mailman id 129864;
 Wed, 19 May 2021 06:03:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TeaP=KO=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1ljFJC-0001BM-QO
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 06:03:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.88]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79e00011-461e-4369-9161-efd0e595be1e;
 Wed, 19 May 2021 06:03:53 +0000 (UTC)
Received: from AM5PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:203:2::30)
 by DB7PR08MB3292.eurprd08.prod.outlook.com (2603:10a6:5:1f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 06:03:50 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::a1) by AM5PR0701CA0068.outlook.office365.com
 (2603:10a6:203:2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.11 via Frontend
 Transport; Wed, 19 May 2021 06:03:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 06:03:49 +0000
Received: ("Tessian outbound ea2c9a942a09:v92");
 Wed, 19 May 2021 06:03:48 +0000
Received: from 01e3ef9e16dc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5A9DE626-8494-4A57-B32C-17C09B1E58F6.1; 
 Wed, 19 May 2021 06:03:42 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 01e3ef9e16dc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 May 2021 06:03:42 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB5536.eurprd08.prod.outlook.com (2603:10a6:803:13b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 06:03:35 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5%6]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 06:03:35 +0000
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
X-Inumbo-ID: 79e00011-461e-4369-9161-efd0e595be1e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIoj3AhThDtknK6f4+HF9yXlP2uS6wGNCvd8TbjyTTU=;
 b=Ub/8QLWt6mwW4vWahPvAgJEmdOmJa72HikNtqbk+0eyxVrtDdDETO5za+VEK1UXzpjaZjiFhQyh0tv6/dDty56IeoCyq7dHWoDH+wAvOJoh8FuGpAPw3Ux9wS5SlaLCKWpDqpVT2/3AYA9ih3U24pyEdQo6EDXSeNMCIY2ATzwk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fA59ABGY0p8mds1jnDoZbvbeFq8ILX7ACTwF8wRshxkzEQejFg8TsrXH4TLmKAK55iwUrhRV2BnKQVM/ZWBR6clUflzvrB/RJHPaaAm4WKhcUpssfBOjmbRcfkHL3JHWZStwLjJHDvGAWZfBtYT/FHWqBs0wDBgrcA5SQWE6XT7blOMRvXoqRjPJTulKHLhtw8jszVoBnJbtyZ4NVFvzIV9dLZb8laj4ZrgOZQaGklEGL4fwOsAKMG7HTYlT0xrU8Yi2xFdmSX9no9us/eQ3TiFXxONGihGSLIDmuD9h649Kyh8l4ga6m0oAvvn9OWrf/b6EgAQZ6+Sdwwxjs8MXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIoj3AhThDtknK6f4+HF9yXlP2uS6wGNCvd8TbjyTTU=;
 b=R/zpSYcKB/jaTk7DOPo0e8fa6mG2BvnrSfIUb14qp4QtUzjfzErx2mlLKXe8yq6RGo1kbvikH40agQ4dvWnUsp3h6smRJRufKD7Hp8T7JogaWb2DYaVjJoGL8EQwRyj0PXjK+gWw1RQlHsn+2e/9UhPwjeL1IEQ0gFod91lxDaSe9Hvw8ILD3aBflJxX74n86NWcZvqIzBx0w8S5hSOJ1dJXQEZBR4fJbSTVrezJn2Fs7VzVm0ngj0qk5c92GRSAPvLLwvPy+AaGevucJOFocjyBVqnupaU5boyG2DzSvxolhB7f2LWrJqam9eK+i68dmr5ahzgclx1NIIaMyIKMVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIoj3AhThDtknK6f4+HF9yXlP2uS6wGNCvd8TbjyTTU=;
 b=Ub/8QLWt6mwW4vWahPvAgJEmdOmJa72HikNtqbk+0eyxVrtDdDETO5za+VEK1UXzpjaZjiFhQyh0tv6/dDty56IeoCyq7dHWoDH+wAvOJoh8FuGpAPw3Ux9wS5SlaLCKWpDqpVT2/3AYA9ih3U24pyEdQo6EDXSeNMCIY2ATzwk=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH 07/10] xen/arm: intruduce alloc_domstatic_pages
Thread-Topic: [PATCH 07/10] xen/arm: intruduce alloc_domstatic_pages
Thread-Index: AQHXS6W/k/joZEkeaUiDjrfYH3jVEarpCkuAgAE/+8A=
Date: Wed, 19 May 2021 06:03:35 +0000
Message-ID:
 <VE1PR08MB521506E1668D332008260215F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-8-penny.zheng@arm.com>
 <d2d1c50f-16bb-778b-acdd-0684878c100f@xen.org>
In-Reply-To: <d2d1c50f-16bb-778b-acdd-0684878c100f@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E1D52A67E0E15E4D83FBC246C1848AE8.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 80cab728-f968-4116-c0e1-08d91a8bdf0e
x-ms-traffictypediagnostic: VI1PR08MB5536:|DB7PR08MB3292:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3292CEFA4256C8D57390A2DBF72B9@DB7PR08MB3292.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3968;OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gkwiEo3vkLUZEA+ucwEoKD5NoXdcQy1thvj5ddyeRgxQsUbsl2fdQrdgpswNUl5agcH2usVVLkrhTKvdP7nZ/jdtkWyPvWtTrZqO2/yiQisoWs/EwV5NOQGj4sM3oo99omjRgXYn4DhnRFG0bSirTOxr3Jq1fjbjNrrAdhRaZQ+6wWJ2/fkKcIzwgRdVoXgzWmez/FGfskOQeeUyholVAou59dzAszJpyDHPFxHyHjW1oNILmXMCvFEOzpPXKepVD50plQikCvuEUJh/ZEZGTQRSyLwVyZT7TkebHpMr75sf8A0ekp8X4B0+2lbkpHmpZ51kbtqHXjd44iijRx7JQSuenYa+j0TMDNOYfBmf0TJaiuvt95lIPHMpOdf2AmmqL6D21yVEEq5AUoI0tIObtLGLSvQVIPkkeU9GDWcfsVLKMPkLYNz9uLY1+0zNfrYL4rgXPuya/KGXDEPyTYyDbnhMyDoOCPjdBuy6cB9l4gUjgsTMpPprZlZq/h2o/s6y0P5nig5B4drCkGQ37Gj07D24V7fGu4AR/mxySGWQphs9kWllRArQihS0OV4TjTSb0siczux9kGBiichKUDDo/yX+iOM1rnS/n1NV7jPmlxw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(7696005)(2906002)(8936002)(66446008)(66476007)(478600001)(76116006)(66946007)(8676002)(110136005)(52536014)(53546011)(54906003)(26005)(186003)(64756008)(86362001)(6506007)(66556008)(9686003)(38100700002)(122000001)(55016002)(5660300002)(71200400001)(83380400001)(4326008)(316002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?YjcrV1l4OEJlK3VpS0FFK2hHRDVkRTNnT1NRY2l1MHlBS0RVRkMyRnBGRTlO?=
 =?utf-8?B?dTgxY0Z6Q3lIWDZ4SEhvcEJ2d2Q0M1FKZW1zWW9PTjJ6VGpSVjZrSFBic2Ur?=
 =?utf-8?B?WWFnaDJEcWVKSU50ZlhKbkFOVmJtUVNveGpPYk1RQURwQkc5Q1JrcEhZVWIy?=
 =?utf-8?B?bWNBSStVR3VNNHJmekMyZlEwR3hQcUsrVE96aGg1WVQ0WmFGTkZoMm5kTnpr?=
 =?utf-8?B?OHhtS1Z1bVZ1SWFJNHBicGF2RW9peXBTU1Z2OWFoTnJvK0g4dTVWdXFueFBG?=
 =?utf-8?B?b01Za25aL2l6b3BZTUt6NVVMYmN1aGEycnhFbWVSbVNHUVR3ZlJ5dktud1Z4?=
 =?utf-8?B?OFczREhiaHdDS0RlY1pUTEYwU0ZsbExOSUowejIwU3dOTGk0cVBPQmJreXUy?=
 =?utf-8?B?VENUdEhwaGZIVXNCT2ljMXgxQkpLM29XbEwyNFFtRWxOZFNIZll4cEdiUGZY?=
 =?utf-8?B?OE5xVXQ5VGo5RGVoMlRIMVRCamM2YVJ6U2dicCtkeW9MVTRyWjRtWDNPTEJC?=
 =?utf-8?B?S2daT1RCY1dGZGxmQ1BmTkJhVDd0SXA5UC96dTZuVCt6K09VaUtiY3I0Y2hW?=
 =?utf-8?B?eUxKdG5mTWU5eGVKUWZoNWhjc3crb1NTcEl3SCsxdDJ0Z2c3YndvRVhUVmto?=
 =?utf-8?B?OEFwem5SeVdEN0s3eW95Ulh0bUJpeTEzRVRac1pHTTc3VFJGclNPOVhwL0gy?=
 =?utf-8?B?U2JrMGVaVFhxUkxkL0FWMVRqTmlmeEYvc0p3a2xBVFdCRHN2Q2FOMFhDa0pR?=
 =?utf-8?B?SWxNeXY4bUdtdmNXOHJxYmhHVFBFRHVMUnFzMGNQNUlOeXZRL0JMdlJQdmNL?=
 =?utf-8?B?aWVmQUp3MlJJMnVtcm4wNE1ObG15ZS9jdm1wRWpFaUlwT0hRVUJFUy9RQzFx?=
 =?utf-8?B?K1A5Vm1zWGRFcmxzaDNTRWFmazA1Y2plSkNJSFpaRkJrVmkxTDB3M1J1aWVJ?=
 =?utf-8?B?a3Q0K05uMElacVpONWp1UkR5bFZjYzJFTlBHWThsWlBoYzNGQ250d0xKdnJQ?=
 =?utf-8?B?N0ZUK01mb3hnb25DalpCM0Q4VXFQcXlPbjE1UmVwdlVHRlMvQjM5YmVjVWZ2?=
 =?utf-8?B?M2UxcU4vRDdEd2ZtM00xS01vUGsxZTkwNTVFMWdhRG9ETXlmTVVRZ0dlR3VO?=
 =?utf-8?B?ajgwcVcvMGR0aWtHc1BFSWZMUG5iajlBT0NwdnhZNWZjT2dCbEY1a3U5bkMy?=
 =?utf-8?B?NzRoTU9adEQvbHljWDl5dWFEdU5mM2cycVk3UTFPdkZpd2Y5N05FVlk1OEVw?=
 =?utf-8?B?dzF6WU1pTjhZK3YrOW50QTUvMjhBczhxQ0dIdmJENjdDZmxJRGNsQVZKTDYv?=
 =?utf-8?B?QnFkams2YzFiLy9VN2tuVXpUV2hPSzRpVk1DVmkrK0pXbW1nK3JaWnRGazVp?=
 =?utf-8?B?RDN6bGRPMytjS3NidkNOdkZiQjBGbW9hYklmWHdhb0V3bHJpRmZhTWJwa1Bl?=
 =?utf-8?B?Vi8vTmdoK1JHamRVZ1VhR0NmdURGcGtQWjVDNjMzTEtUWUpYTWpyMzZrc2NU?=
 =?utf-8?B?UUV0OWZtaGc3Y0VEelR4S05lYTZwQ004T0EycFFYNnJjM21tZ3hkbUU0ZVdv?=
 =?utf-8?B?cFcxa3pCZFdWOFZsd0NBenZrOVA1U2FScjV2RzhmTzU2cFVkYWVRcFp4QnVE?=
 =?utf-8?B?WjR4Y1kyQ2dNeUFTdUJvNzBxWUhDMURlMUVoMEIxTThtUmo4c3hpc21jSFFu?=
 =?utf-8?B?di96T0VzNlFXOWlqT2RNVU0rTXhsc1JoRE94Qyt4UlBYaEYrd2lCdXlFNThT?=
 =?utf-8?Q?H9iswxBRZMWvn+8NR+mglm6H/PBYCCcIPl46cdq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5536
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	381b6a12-2696-4f87-86c4-08d91a8bd6bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pouN4ocJkxHXN8bS7zM6mDOCg5RCiRZ0kp6p+ttK1cjETMqLQl+yC1svD1TxaUOb8tF4F88ILfWMVTs2Wxpqpsgy9F4IwJ/PMXTPu591lY3t+ydPqqax+0EQ+p58hMUBkG5zLnSCPfDlF6criY32zz4ZMJJN8Pu9JugwAYOdyDDMDL+YwzYOYyyZrf8+bTdC669MswkQ7EXjwETeq1iR9edRBQX+fAxYS9VWB6mW+xiv10UXnbg88OJSWJjMD9BfsZa1BUzO1FBINjhKlFnQEB1rtmFioT7nESDQTiICRc8vmNRUaV/K1JdVBIZNRnkWxb65iNvPZmzbOHDmWNr3zQrLF8pNHBWP2FE4VfUzDRdp292Np5VkRNCoEQaG7UaKvmJrK9AWh0pMpbsJgqCDEdlQa1GSnaW320A6bxT8Cwj02O5EC5BrscNMDk6kfWV0oQCybbMx/uhZdkzsYg6SqA8Ot2QfT9oEADBNglItDQCDVX86VjGRX3JxocD3NsUmx2E52C78ySJ8az7WdW/NTzBcr9zXvJYi5S1vyseLYu3Tfp3qgyc3hq3dIiJDqjFaU4YWFvYGZVNtFybzh/N3Mnrt4+I3qO8RFWjCX1axJurr6QbZNhnXCzSJP0vKxX/KheahBweYY+RYpdptFnM38g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(46966006)(36840700001)(26005)(82740400003)(4326008)(52536014)(186003)(7696005)(6506007)(82310400003)(53546011)(86362001)(8676002)(81166007)(478600001)(70586007)(110136005)(54906003)(70206006)(5660300002)(36860700001)(316002)(336012)(33656002)(55016002)(9686003)(47076005)(2906002)(356005)(83380400001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 06:03:49.3944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80cab728-f968-4116-c0e1-08d91a8bdf0e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3292

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVHVlc2RheSwgTWF5IDE4LCAyMDIxIDY6
MzAgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBC
ZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8
V2VpLkNoZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IDA3LzEwXSB4ZW4vYXJtOiBpbnRydWR1Y2UgYWxsb2NfZG9tc3RhdGljX3BhZ2VzDQo+IA0KPiBI
aSBQZW5ueSwNCj4gDQo+IFRpdGxlOiBzL2ludHJ1ZHVjZS9pbnRyb2R1Y2UvDQo+IA0KDQpUaHh+
DQoNCj4gT24gMTgvMDUvMjAyMSAwNjoyMSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gYWxsb2Nf
ZG9tc3RhdGljX3BhZ2VzIGlzIHRoZSBlcXVpdmFsZW50IG9mIGFsbG9jX2RvbWhlYXBfcGFnZXMg
Zm9yDQo+ID4gc3RhdGljIG1tZW9yeSwgYW5kIGl0IGlzIHRvIGFsbG9jYXRlIG5yX3BmbnMgcGFn
ZXMgb2Ygc3RhdGljIG1lbW9yeQ0KPiA+IGFuZCBhc3NpZ24gdGhlbSB0byBvbmUgc3BlY2lmaWMg
ZG9tYWluLg0KPiA+DQo+ID4gSXQgdXNlcyBhbGxvY19zdGF0aWNtZW5fcGFnZXMgdG8gZ2V0IG5y
X3BhZ2VzIHBhZ2VzIG9mIHN0YXRpYyBtZW1vcnksDQo+ID4gdGhlbiBvbiBzdWNjZXNzLCBpdCB3
aWxsIHVzZSBhc3NpZ25fcGFnZXMgdG8gYXNzaWduIHRob3NlIHBhZ2VzIHRvIG9uZQ0KPiA+IHNw
ZWNpZmljIGRvbWFpbiwgaW5jbHVkaW5nIHVzaW5nIHBhZ2Vfc2V0X3Jlc2VydmVkX293bmVyIHRv
IHNldCBpdHMNCj4gPiByZXNlcnZlZCBkb21haW4gb3duZXIuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBQZW5ueSBaaGVuZyA8cGVubnkuemhlbmdAYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHhl
bi9jb21tb24vcGFnZV9hbGxvYy5jIHwgNTMNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gPiAgIHhlbi9pbmNsdWRlL3hlbi9tbS5oICAgIHwgIDQgKysrKw0K
PiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyBp
bmRleA0KPiA+IDBlYjlmMjJhMDAuLmYxZjEyOTZhNjEgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2Nv
bW1vbi9wYWdlX2FsbG9jLmMNCj4gPiArKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYw0KPiA+
IEBAIC0yNDQ3LDYgKzI0NDcsOSBAQCBpbnQgYXNzaWduX3BhZ2VzKA0KPiA+ICAgICAgIHsNCj4g
PiAgICAgICAgICAgQVNTRVJUKHBhZ2VfZ2V0X293bmVyKCZwZ1tpXSkgPT0gTlVMTCk7DQo+ID4g
ICAgICAgICAgIHBhZ2Vfc2V0X293bmVyKCZwZ1tpXSwgZCk7DQo+ID4gKyAgICAgICAgLyogdXNl
IHBhZ2Vfc2V0X3Jlc2VydmVkX293bmVyIHRvIHNldCBpdHMgcmVzZXJ2ZWQgZG9tYWluIG93bmVy
Lg0KPiAqLw0KPiA+ICsgICAgICAgIGlmICggKHBnW2ldLmNvdW50X2luZm8gJiBQR0NfcmVzZXJ2
ZWQpICkNCj4gPiArICAgICAgICAgICAgcGFnZV9zZXRfcmVzZXJ2ZWRfb3duZXIoJnBnW2ldLCBk
KTsNCj4gDQo+IEkgaGF2ZSBza2ltbWVkIHRocm91Z2ggdGhlIHJlc3Qgb2YgdGhlIHNlcmllcyBh
bmQgY291bGRuJ3QgZmluZCBhbnlvbmUNCj4gY2FsbGluZyBwYWdlX2dldF9yZXNlcnZlZF9vd25l
cigpLiBUaGUgdmFsdWUgaXMgYWxzbyBnb2luZyB0byBiZSB0aGUgZXhhY3QNCj4gc2FtZSBhcyBw
YWdlX3NldF9vd25lcigpLg0KPiANCj4gU28gd2h5IGRvIHdlIG5lZWQgaXQ/DQo+IA0KDQpJbiBt
eSBmaXJzdCBpbnRlbnQsIFRoaXMgdHdvIGhlbHBlciBwYWdlX2dldF9yZXNlcnZlZF9vd25lci8g
cGFnZV9zZXRfcmVzZXJ2ZWRfb3duZXINCmFuZCB0aGUgbmV3IGZpZWxkIGByZXNlcnZlZGAgaW4g
cGFnZV9pbmZvIGFyZSBhbGwgZm9yIHJlYm9vdGluZyBkb21haW4gb24gc3RhdGljIGFsbG9jYXRp
b24uIA0KDQpJIHdhcyBjb25zaWRlcmluZyB0aGF0LCB3aGVuIGltcGxlbWVudGluZyByZWJvb3Rp
bmcgZG9tYWluIG9uIHN0YXRpYyBhbGxvY2F0aW9uLCBtZW1vcnkNCndpbGwgYmUgcmVsaW5xdWlz
aGVkIGFuZCByaWdodCBub3csIGFsbCBmcmVlZCBiYWNrIHRvIGhlYXAsIHdoaWNoIGlzIG5vdCBz
dWl0YWJsZSBmb3Igc3RhdGljIG1lbW9yeSBoZXJlLg0KYCByZWxpbnF1aXNoX21lbW9yeShkLCAm
ZC0+cGFnZV9saXN0KSAgLS0+IHB1dF9wYWdlIC0tPiAgZnJlZV9kb21oZWFwX3BhZ2VgDQoNCkZv
ciBwYWdlcyBpbiBQR0NfcmVzZXJ2ZWQsIG5vdywgSSBhbSBjb25zaWRlcmluZyB0aGF0LCBvdGhl
ciB0aGFuIGdpdmluZyBpdCBiYWNrIHRvIGhlYXAsIG1heWJlIGNyZWF0aW5nDQphIG5ldyBnbG9i
YWwgYHN0cnVjdCBwYWdlX2luZm8qW0RPTUlEXWAgdmFsdWUgdG8gaG9sZC4NCg0KU28gaXQgaXMg
YmV0dGVyIHRvIGhhdmUgYSBuZXcgZmllbGQgaW4gc3RydWN0IHBhZ2VfaW5mbywgYXMgZm9sbG93
cywgdG8gaG9sZCBzdWNoIGluZm8uDQoNCi8qIFBhZ2UgaXMgcmVzZXJ2ZWQuICovDQpzdHJ1Y3Qg
ew0KICAgIC8qDQogICAgICogUmVzZXJ2ZWQgT3duZXIgb2YgdGhpcyBwYWdlLA0KICAgICAqIGlm
IHRoaXMgcGFnZSBpcyByZXNlcnZlZCB0byBhIHNwZWNpZmljIGRvbWFpbi4NCiAgICAgKi8NCiAg
ICBkb21pZF90IHJlc2VydmVkX293bmVyOw0KfSByZXNlcnZlZDsNCg0KQnV0IHRoaXMgcGF0Y2gg
U2VyaWUgaXMgbm90IGdvaW5nIHRvIGluY2x1ZGUgdGhpcyBmZWF0dXJlLCBhbmQgSSB3aWxsIGRl
bGV0ZSByZWxhdGVkIGhlbHBlcnMgYW5kIHZhbHVlcy4NCg0KPiA+ICAgICAgICAgICBzbXBfd21i
KCk7IC8qIERvbWFpbiBwb2ludGVyIG11c3QgYmUgdmlzaWJsZSBiZWZvcmUgdXBkYXRpbmcNCj4g
cmVmY250LiAqLw0KPiA+ICAgICAgICAgICBwZ1tpXS5jb3VudF9pbmZvID0NCj4gPiAgICAgICAg
ICAgICAgIChwZ1tpXS5jb3VudF9pbmZvICYgUEdDX2V4dHJhKSB8IFBHQ19hbGxvY2F0ZWQgfCAx
Ow0KPiANCj4gVGhpcyB3aWxsIGNsb2JiZXIgUEdDX3Jlc2VydmVkLg0KPiANCg0KcmVsYXRlZCBj
aGFuZ2VzIGhhdmUgYmVlbiBpbmNsdWRlZCBpbnRvIHRoZSBjb21taXQgb2YgIjAwMDgteGVuLWFy
bS1pbnRyb2R1Y2UtcmVzZXJ2ZWRfcGFnZV9saXN0LnBhdGNoIi4NCiANCj4gPiBAQCAtMjUwOSw2
ICsyNTEyLDU2IEBAIHN0cnVjdCBwYWdlX2luZm8gKmFsbG9jX2RvbWhlYXBfcGFnZXMoDQo+ID4g
ICAgICAgcmV0dXJuIHBnOw0KPiA+ICAgfQ0KPiA+DQo+ID4gKy8qDQo+ID4gKyAqIEFsbG9jYXRl
IG5yX3BmbnMgY29udGlndW91cyBwYWdlcywgc3RhcnRpbmcgYXQgI3N0YXJ0LCBvZiBzdGF0aWMN
Cj4gPiArbWVtb3J5LA0KPiANCj4gcy9ucl9wZm5zL25yX21mbnMvDQo+IA0KDQpTdXJlLg0KDQo+
ID4gKyAqIHRoZW4gYXNzaWduIHRoZW0gdG8gb25lIHNwZWNpZmljIGRvbWFpbiAjZC4NCj4gPiAr
ICogSXQgaXMgdGhlIGVxdWl2YWxlbnQgb2YgYWxsb2NfZG9taGVhcF9wYWdlcyBmb3Igc3RhdGlj
IG1lbW9yeS4NCj4gPiArICovDQo+ID4gK3N0cnVjdCBwYWdlX2luZm8gKmFsbG9jX2RvbXN0YXRp
Y19wYWdlcygNCj4gPiArICAgICAgICBzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIG5y
X3BmbnMsIHBhZGRyX3Qgc3RhcnQsDQo+IA0KPiBzL25yX3BmbnMvbmZfbWZucy8uIEFsc28sIEkg
d291bGQgdGhlIHRoaXJkIHBhcmFtZXRlciB0byBiZSBhbiBtZm5fdC4NCj4gDQoNClN1cmUuDQoN
Cj4gPiArICAgICAgICB1bnNpZ25lZCBpbnQgbWVtZmxhZ3MpDQo+ID4gK3sNCj4gPiArICAgIHN0
cnVjdCBwYWdlX2luZm8gKnBnID0gTlVMTDsNCj4gPiArICAgIHVuc2lnbmVkIGxvbmcgZG1hX3Np
emU7DQo+ID4gKw0KPiA+ICsgICAgQVNTRVJUKCFpbl9pcnEoKSk7DQo+ID4gKw0KPiA+ICsgICAg
aWYgKCBtZW1mbGFncyAmIE1FTUZfbm9fb3duZXIgKQ0KPiA+ICsgICAgICAgIG1lbWZsYWdzIHw9
IE1FTUZfbm9fcmVmY291bnQ7DQo+ID4gKw0KPiA+ICsgICAgaWYgKCAhZG1hX2JpdHNpemUgKQ0K
PiA+ICsgICAgICAgIG1lbWZsYWdzICY9IH5NRU1GX25vX2RtYTsNCj4gPiArICAgIGVsc2UNCj4g
PiArICAgIHsNCj4gPiArICAgICAgICBkbWFfc2l6ZSA9IDF1bCA8PCBiaXRzX3RvX3pvbmUoZG1h
X2JpdHNpemUpOw0KPiA+ICsgICAgICAgIC8qIFN0YXJ0aW5nIGFkZHJlc3Mgc2hhbGwgbWVldCB0
aGUgRE1BIGxpbWl0YXRpb24uICovDQo+ID4gKyAgICAgICAgaWYgKCBkbWFfc2l6ZSAmJiBzdGFy
dCA8IGRtYV9zaXplICkNCj4gPiArICAgICAgICAgICAgcmV0dXJuIE5VTEw7DQo+ID4gKyAgICB9
DQo+ID4gKw0KPiA+ICsgICAgcGcgPSBhbGxvY19zdGF0aWNtZW1fcGFnZXMobnJfcGZucywgc3Rh
cnQsIG1lbWZsYWdzKTsNCj4gPiArICAgIGlmICggIXBnICkNCj4gPiArICAgICAgICByZXR1cm4g
TlVMTDsNCj4gPiArDQo+ID4gKyAgICBpZiAoIGQgJiYgIShtZW1mbGFncyAmIE1FTUZfbm9fb3du
ZXIpICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBpZiAoIG1lbWZsYWdzICYgTUVNRl9ub19y
ZWZjb3VudCApDQo+ID4gKyAgICAgICAgew0KPiA+ICsgICAgICAgICAgICB1bnNpZ25lZCBsb25n
IGk7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IG5yX3BmbnM7IGkr
KyApDQo+ID4gKyAgICAgICAgICAgICAgICBwZ1tpXS5jb3VudF9pbmZvID0gUEdDX2V4dHJhOw0K
PiA+ICsgICAgICAgIH0NCj4gPiArICAgICAgICBpZiAoIGFzc2lnbl9wYWdlcyhkLCBwZywgbnJf
cGZucywgbWVtZmxhZ3MpICkNCj4gPiArICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgIGZyZWVf
c3RhdGljbWVtX3BhZ2VzKHBnLCBucl9wZm5zLCBtZW1mbGFncyAmIE1FTUZfbm9fc2NydWIpOw0K
PiA+ICsgICAgICAgICAgICByZXR1cm4gTlVMTDsNCj4gPiArICAgICAgICB9DQo+ID4gKyAgICB9
DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJuIHBnOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICAgdm9pZCBm
cmVlX2RvbWhlYXBfcGFnZXMoc3RydWN0IHBhZ2VfaW5mbyAqcGcsIHVuc2lnbmVkIGludCBvcmRl
cikNCj4gPiAgIHsNCj4gPiAgICAgICBzdHJ1Y3QgZG9tYWluICpkID0gcGFnZV9nZXRfb3duZXIo
cGcpOyBkaWZmIC0tZ2l0DQo+ID4gYS94ZW4vaW5jbHVkZS94ZW4vbW0uaCBiL3hlbi9pbmNsdWRl
L3hlbi9tbS5oIGluZGV4DQo+ID4gZGNmOWRhYWE0Ni4uZTQ1OTg3ZjBlZCAxMDA2NDQNCj4gPiAt
LS0gYS94ZW4vaW5jbHVkZS94ZW4vbW0uaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9tbS5o
DQo+ID4gQEAgLTExMSw2ICsxMTEsMTAgQEAgdW5zaWduZWQgbG9uZyBfX211c3RfY2hlY2sNCj4g
ZG9tYWluX2FkanVzdF90b3RfcGFnZXMoc3RydWN0IGRvbWFpbiAqZCwNCj4gPiAgIGludCBkb21h
aW5fc2V0X291dHN0YW5kaW5nX3BhZ2VzKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcN
Cj4gcGFnZXMpOw0KPiA+ICAgdm9pZCBnZXRfb3V0c3RhbmRpbmdfY2xhaW1zKHVpbnQ2NF90ICpm
cmVlX3BhZ2VzLCB1aW50NjRfdA0KPiA+ICpvdXRzdGFuZGluZ19wYWdlcyk7DQo+ID4NCj4gPiAr
LyogU3RhdGljIE1lbW9yeSAqLw0KPiA+ICtzdHJ1Y3QgcGFnZV9pbmZvICphbGxvY19kb21zdGF0
aWNfcGFnZXMoc3RydWN0IGRvbWFpbiAqZCwNCj4gPiArICAgICAgICB1bnNpZ25lZCBsb25nIG5y
X3BmbnMsIHBhZGRyX3Qgc3RhcnQsIHVuc2lnbmVkIGludCBtZW1mbGFncyk7DQo+ID4gKw0KPiA+
ICAgLyogRG9tYWluIHN1YmFsbG9jYXRvci4gVGhlc2UgZnVuY3Rpb25zIGFyZSAqbm90KiBpbnRl
cnJ1cHQtc2FmZS4qLw0KPiA+ICAgdm9pZCBpbml0X2RvbWhlYXBfcGFnZXMocGFkZHJfdCBwcywg
cGFkZHJfdCBwZSk7DQo+ID4gICBzdHJ1Y3QgcGFnZV9pbmZvICphbGxvY19kb21oZWFwX3BhZ2Vz
KA0KPiA+DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg0KQ2hlZXJz
LA0KDQpQZW5ueQ0K

