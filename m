Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A62AF38E3BA
	for <lists+xen-devel@lfdr.de>; Mon, 24 May 2021 12:11:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131724.246047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ll7XL-00056Q-Dr; Mon, 24 May 2021 10:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131724.246047; Mon, 24 May 2021 10:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ll7XL-00053w-A6; Mon, 24 May 2021 10:10:15 +0000
Received: by outflank-mailman (input) for mailman id 131724;
 Mon, 24 May 2021 10:10:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tM/V=KT=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1ll7XJ-00053q-Vu
 for xen-devel@lists.xenproject.org; Mon, 24 May 2021 10:10:14 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.71]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d853f2f9-14ce-4504-917e-ed483488ba33;
 Mon, 24 May 2021 10:10:11 +0000 (UTC)
Received: from AM6P194CA0046.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::23)
 by DB7PR08MB3676.eurprd08.prod.outlook.com (2603:10a6:10:4d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 10:10:09 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::b3) by AM6P194CA0046.outlook.office365.com
 (2603:10a6:209:84::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Mon, 24 May 2021 10:10:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Mon, 24 May 2021 10:10:08 +0000
Received: ("Tessian outbound 3c287b285c95:v92");
 Mon, 24 May 2021 10:10:08 +0000
Received: from d58ca352fee6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 58B78053-CF44-4983-9605-7F314ED76FB2.1; 
 Mon, 24 May 2021 10:10:03 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d58ca352fee6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 May 2021 10:10:03 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB4176.eurprd08.prod.outlook.com (2603:10a6:803:ec::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 10:10:00 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 10:10:00 +0000
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
X-Inumbo-ID: d853f2f9-14ce-4504-917e-ed483488ba33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qrLhbNtUuHXCY/13qfnE+S4fUhnoLYb40Q5r3kqjPI=;
 b=A0C1PlZjcALDIkn9D5nUX00McLMeUDs87KGsJyKWMW+LnK9iGmjt8Z2ATtFEcR/rrWs3d0gNxN+RPl2lQCfCYC0rQmmjvjpveE9x0OO845ohGwfpC8LHN4+wVxIcSi0kmaUjydNqdV4n36O4OcxBHF29WhOOUURI+pYQYkSfK14=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYwOAXQNI0nwKyPKMJvPftpa/yUwTOsHPkYaj/oQwwvPg/hhJwVUk3KJ2Q0iiOPL4dLYdGzXltqHGLJ2ZQQErysvc5JzJUKXbh7e4J2YCxC4Cjj7MUgi522gLeLLesrPgmOT6beiY62uhxYE4W6BX2Df+RVOpwwdUdWnb30KYQTBcZPpeEtoSi6qKL1blL3eZQ9PAv6nUjefZnu1ZWL+wwWdcxMFAYqeBeCwqD97Litg2utwWHtPCiuyo+EZkgvI0b9rVpWnfS0kMCUz+us2vjc9BLZuBZW9LAtun8cpY9/cXhfO4cr13sNQNDKGACAE06eiACVybcUkPyYdE8DYfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qrLhbNtUuHXCY/13qfnE+S4fUhnoLYb40Q5r3kqjPI=;
 b=n3DSy6fkRSk3WXwoS2aNolibQzebo96RfIrLwjd5+Rx1AxmqVl7VZHFmCQfJJ05pAWz4m8+WQUBju0Rz3E2a07zzICfWHlXN9rQNiJ74R1Tm9yRxzhIezPNWRZKTb0yt5MPcF4+MiBD7Fzjd22QMwzvzbfVpPEcF5B1Oh+51uVPZn58fGVQJm7IKJcBHbR5sHDEnsyBFP/gSrrg1GtbTfIhjJ+zNdbMKyNC+BSsxRzA2GBjN+aWO1mT1Ns48aJxS2pQdTEPHDu/GffQy9QPKbGEeT1psVZp4DT8WwXszarCJQG5JMxzUptwOVHsw0slKJQSvFXwlQb0/X3Ur4XahSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qrLhbNtUuHXCY/13qfnE+S4fUhnoLYb40Q5r3kqjPI=;
 b=A0C1PlZjcALDIkn9D5nUX00McLMeUDs87KGsJyKWMW+LnK9iGmjt8Z2ATtFEcR/rrWs3d0gNxN+RPl2lQCfCYC0rQmmjvjpveE9x0OO845ohGwfpC8LHN4+wVxIcSi0kmaUjydNqdV4n36O4OcxBHF29WhOOUURI+pYQYkSfK14=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH 05/10] xen/arm: introduce alloc_staticmem_pages
Thread-Topic: [PATCH 05/10] xen/arm: introduce alloc_staticmem_pages
Thread-Index: AQHXS6W1I2rvO8FRzkm++uFejE9ZNKrpBh+AgAE7kqCACC9kgA==
Date: Mon, 24 May 2021 10:10:00 +0000
Message-ID:
 <VE1PR08MB521532DDD1CC4C8872AE08CFF7269@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-6-penny.zheng@arm.com>
 <e8e4148e-017b-955b-dd18-4576ce7c94ec@xen.org>
 <VE1PR08MB52156570D7795C3595674BE5F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
In-Reply-To:
 <VE1PR08MB52156570D7795C3595674BE5F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5306F2AFB5E29C48A661B4F303BF7BC8.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 22888666-a201-4f50-53a9-08d91e9c1c58
x-ms-traffictypediagnostic: VI1PR08MB4176:|DB7PR08MB3676:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB36760892DF109FF9E9BA9FC6F7269@DB7PR08MB3676.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2887;OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6w+Ys/EonNJw7kP4OWTFtJEiJxhBXGEuloILhP0VkwPTE5UQ911H8uK/XikWiWOYR/bLj5+PMgchqstrK9hOFxdY7ApJ4efgrRFQPHDrMbUmync60OXhCLWKFclgENuKSuv4y4wjKhFAbl/6MXb4ICx0Bd7cjBERVUD+ookBctmplBnZjl4Bu3+ZZ9oVulFkm15nOxw/KJwjVZiOD9IPNQmO5BaRLt4J7vFA08+VjXVEcs4cK3gmPPzc+lNDSImoAM2WjAh1yYDrBB1DtqThFVWB6c/9jhsQ63fNjF596k1dsLC4dmUO4TfNSjxoaywarbJgaz+azcMSZPh9rq+qWKdIrMvf8Q2LllrqpPjk7NHBJEMxVIREFffGKTHSAQFTXgC1P14XyGILFzYPGRsYATM6ptrdDN13O/rJy15k5yCToH3dcgmNx1xZ7h6ReBFzkZCJvriayudfx2lUwma10AYXAIpjdw0ju78QgBZE8beWDomy+tp1xPyzWCKQHm3PAwNHchM8A1B52CvNdpGplLNUpnrHDz6CpTGQ34+gBAIZ5V1K8gWT83FUxaAYVyQ+uEtHQwKo7/d2/d3SE3JiYGE4Th8z6kMX2+QmPnOHQ4k=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(8936002)(76116006)(8676002)(478600001)(33656002)(4326008)(9686003)(52536014)(66946007)(66476007)(66556008)(71200400001)(66446008)(64756008)(26005)(55016002)(53546011)(7696005)(6506007)(54906003)(186003)(5660300002)(38100700002)(83380400001)(86362001)(110136005)(2906002)(316002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?aUNPbEc1SUZwbGd1Z0U0dDlDa0RBcnIxUmY1cVVEYXJWUFlrbDZyMVNNYUtm?=
 =?utf-8?B?bkZaRlFyd1lUdSs1YkRTMTZNWTFiNlZSb3o3T3FEb0hjYUlMdjZiaWh1UUVq?=
 =?utf-8?B?RStvUzVEbS9QaVVNaUx1a09SMDBOVnRrZDZWWG5waHpmZ09GUUpMUDl5VmUv?=
 =?utf-8?B?NVhDbkc3d3ZGSlNSS1FzT1hMM2pNK1hHWVkva1hvZi9aOVhmQWIvODdhc1BV?=
 =?utf-8?B?a2lWQ2RBNkh0TjdXTnROL1M0TlRtZ3lSejYzbnIyOFk4ZkFib3VRYmpSWS9j?=
 =?utf-8?B?WllHaTFBV2xHam9ncDJpdmVhNm9TNmN5SHRKVGNtNlJvSXJyRVExa1FFU0Uy?=
 =?utf-8?B?eENTVEgzdW5IeDBvVnJpODhIUllOaVRrajJtOEVyc1hpd2pncVRHQW9nT1JX?=
 =?utf-8?B?eE5qUFRnclV2cXZPZlpBaEJjQTlwbFZEYjdKYTZZQ2pEOEMyeXovZGYxcHFV?=
 =?utf-8?B?MlM1VDJDLzFSeTVoL0o5Q09obXZEMjFKNTlJWHpoOFc0cFFPQVZocExoUG12?=
 =?utf-8?B?U3NJaitLT0ZqV082QVdzaGY0Mkg2a0hxODVmTkZ1WnFtT1hjblZNOVVlNTVB?=
 =?utf-8?B?WDdkT2NCWkg5UjYvTS9ISDl0MWo1YS9xWmNtbVBLL2V5enBxR08zZDlOeCth?=
 =?utf-8?B?ZWVETGQ5V2JGMUJCTXpqVVZUdjErVlREa04wVUR3VllKdmlzRG05b3BDVFYv?=
 =?utf-8?B?NmloVm81U21IcFQwRmdmdnkyYmwxVVlHOFZyUk9FZE93MStrNitDOElZaWVD?=
 =?utf-8?B?RjFHNk9zV05Ib2Y3R042RnRqaDV3NlZyTjc1TFZVdVlQd3VkdWp4L0RVUmph?=
 =?utf-8?B?WlVNWXViN3ZhbEZxYjNsdFYzY2lpbm5vTGpPdVBaQTc0Zk9TNjB0d1lYT0h5?=
 =?utf-8?B?dU5LT1YrS2hkM1h2TzBDdUxNR2pMQkNmZkhTbjlubWE2QnRKMC9ZN0JqdENE?=
 =?utf-8?B?NENPMnNzR0kzNGRkbEQ0Yzg0VUNiMWV6WEZCb2F3cnRiLzJVV2hZckpmbmNE?=
 =?utf-8?B?amxqRWdmd0x1RlVxemJHNEdWTE9GY096Znd3UWdlTWpJL3pTK2ZNSnZSUGdX?=
 =?utf-8?B?ZnV6b3NYRVBVdTVuWU5SUWhuME9RMWh4QXRSZU1XSzBpbnZ6dnd4UUg0a28z?=
 =?utf-8?B?VlpSNGFGM2NDb20wVGJqdGZVdy92d3hhNlp3dXlSQUYxQkJabkhJK05iRjh5?=
 =?utf-8?B?aEZzNTJlUWg5Tm5VdTNYaTl4OUJ5Um5QSVJJT1hJNVVkR0xkVjdvdkNGVmlK?=
 =?utf-8?B?b0NzZFA5a2tSa0xWMWE3bVFacUh5OTRHb1JuaGdFWk5nc24rbEE1aFhhd2dH?=
 =?utf-8?B?NTY3ek9ob09tbTJsb0labjFPWWlvV1N5cjJ4bTFGZlZ6Qy9HNmFNc1ExQ2hv?=
 =?utf-8?B?M1QyS0R3dEFKUFNVNitaek04NXZ2UitPSUIyTy9VU3JiWjBuS0lSUjdRU0VK?=
 =?utf-8?B?ZzlFdmZzaGRpTVpNdm1QNFdmc29xeitFaTd5a0J5NUxrTGRNTGhXanhNc3N0?=
 =?utf-8?B?dkZTc2c3M3orZkVlRDJXajFQWkliSndIYm9LdXNwRXR4MjZPTTZSTkdLUWx6?=
 =?utf-8?B?ZmdCT2FGMHRLT1BvZkh3aUR6bzd5dHl0TkhuMkNKd1pFL3djVVNEWkt1cmNV?=
 =?utf-8?B?eUZDNThtZ2UrRWtrRys0MlBvdTk5ZGdDYWxCYk5mR3k0Vkt6b1VOMjdiS002?=
 =?utf-8?B?eENHZXc0UmNYbEJMdGxodDFKQjNCNFVtVFA1LzBPVVp4bmt6NDBrQ3dZUms3?=
 =?utf-8?Q?ElyKgLoISp0nk0DunZn3VEE+qG0vdvBdWnfF+O6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4176
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b6351386-4a59-413b-439a-08d91e9c173f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tz+EaMeeD47CWrn0yAW+jCcCiQ9OjMFriu7vhbmWYmtJUlqjAWS5BL4UDw0l4H7Hl/SSYczFRndlEHD+8BY9ihruy3gIc3u/3sDGn02WphUVZIWeKKVqGBG/Edzw2lyax4wkuNYbI+3rvrkA1rgxt0uPjAhhKcqUNotNtI11aLYN6YH1LogH0Rr5MkmzwDpcbbUuaGlQO4ZDp8CjoRvw1Jb5Mjl5FMGGF66t2AiArI8nPoZhbZzUkilethW4olXiDXk015+MfNIq7iSflDYmgZg5iQzQPS7pSOuK8eJLQ2C+rqbUjMRUZBF4/PcyY3jTl5KgF8WlesUYq3cieid7NUe2L7NalQRyHcQkPBLjACx+8YJd5YbpafEU0VKzH7Hs/ozeMU9GL/27/6N1gOUHnxYBulWnF4tlVZaRGzxvK0Q9aXK4vAjFY7RIrm6/kyiK4VE/gjE+DMjgwXn1fQrwQgsEppPO9NRSiEMENbzaqvK/B8zECKyaCe4n1HD0N5aX/ajZ7fS6G71Qnu/AKFgwax7wXkq+bjQsHqsdqnQ8TZvhiL0VcEq/d4eiPc45oCaPPLoP/ED1j/ABzfhIDRyjYNy45Msv3RFHfrVvtOxtOWf5jKJYvNadoVACdory+MiPRGRbDcKCo+GwFfgyCMWH3qL6bGkeYKpwBx19Lwg3JOs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(39860400002)(36840700001)(46966006)(70586007)(356005)(8936002)(70206006)(82310400003)(9686003)(47076005)(83380400001)(86362001)(186003)(110136005)(36860700001)(5660300002)(478600001)(81166007)(8676002)(52536014)(82740400003)(7696005)(26005)(54906003)(336012)(53546011)(2906002)(55016002)(33656002)(6506007)(316002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 10:10:08.8258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22888666-a201-4f50-53a9-08d91e9c1c58
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3676

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGVubnkg
WmhlbmcNCj4gU2VudDogV2VkbmVzZGF5LCBNYXkgMTksIDIwMjEgMToyNCBQTQ0KPiBUbzogSnVs
aWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZzsNCj4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZw0KPiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVy
dHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgV2VpIENoZW4NCj4gPFdlaS5DaGVuQGFybS5jb20+OyBu
ZCA8bmRAYXJtLmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRDSCAwNS8xMF0geGVuL2FybTogaW50
cm9kdWNlIGFsbG9jX3N0YXRpY21lbV9wYWdlcw0KPiANCj4gSGkgSnVsaWVuDQo+IA0KPiA+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW5A
eGVuLm9yZz4NCj4gPiBTZW50OiBUdWVzZGF5LCBNYXkgMTgsIDIwMjEgNjoxNSBQTQ0KPiA+IFRv
OiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsNCj4gPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+ID4gQ2M6IEJlcnRyYW5k
IE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFdlaSBDaGVuDQo+ID4gPFdlaS5D
aGVuQGFybS5jb20+OyBuZCA8bmRAYXJtLmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDA1
LzEwXSB4ZW4vYXJtOiBpbnRyb2R1Y2UgYWxsb2Nfc3RhdGljbWVtX3BhZ2VzDQo+ID4NCj4gPiBI
aSBQZW5ueSwNCj4gPg0KPiA+IE9uIDE4LzA1LzIwMjEgMDY6MjEsIFBlbm55IFpoZW5nIHdyb3Rl
Og0KPiA+ID4gYWxsb2Nfc3RhdGljbWVtX3BhZ2VzIGlzIGRlc2lnbmF0ZWQgdG8gYWxsb2NhdGUg
bnJfcGZucyBjb250aWd1b3VzDQo+ID4gPiBwYWdlcyBvZiBzdGF0aWMgbWVtb3J5LiBBbmQgaXQg
aXMgdGhlIGVxdWl2YWxlbnQgb2YgYWxsb2NfaGVhcF9wYWdlcw0KPiA+ID4gZm9yIHN0YXRpYyBt
ZW1vcnkuDQo+ID4gPiBUaGlzIGNvbW1pdCBvbmx5IGNvdmVycyBhbGxvY2F0aW5nIGF0IHNwZWNp
ZmllZCBzdGFydGluZyBhZGRyZXNzLg0KPiA+ID4NCj4gPiA+IEZvciBlYWNoIHBhZ2UsIGl0IHNo
YWxsIGNoZWNrIGlmIHRoZSBwYWdlIGlzIHJlc2VydmVkDQo+ID4gPiAoUEdDX3Jlc2VydmVkKSBh
bmQgZnJlZS4gSXQgc2hhbGwgYWxzbyBkbyBhIHNldCBvZiBuZWNlc3NhcnkNCj4gPiA+IGluaXRp
YWxpemF0aW9uLCB3aGljaCBhcmUgbW9zdGx5IHRoZSBzYW1lIG9uZXMgaW4gYWxsb2NfaGVhcF9w
YWdlcywNCj4gPiA+IGxpa2UsIGZvbGxvd2luZyB0aGUgc2FtZSBjYWNoZS1jb2hlcmVuY3kgcG9s
aWN5IGFuZCB0dXJuaW5nIHBhZ2UNCj4gPiA+IHN0YXR1cyBpbnRvIFBHQ19zdGF0ZV91c2VkLCBl
dGMuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5n
QGFybS5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICAgeGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgfCA2
NA0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiAg
IDEgZmlsZSBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCspDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdp
dCBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgaW5k
ZXgNCj4gPiA+IDU4YjUzYzZhYzIuLmFkZjI4ODllNzYgMTAwNjQ0DQo+ID4gPiAtLS0gYS94ZW4v
Y29tbW9uL3BhZ2VfYWxsb2MuYw0KPiA+ID4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMN
Cj4gPiA+IEBAIC0xMDY4LDYgKzEwNjgsNzAgQEAgc3RhdGljIHN0cnVjdCBwYWdlX2luZm8gKmFs
bG9jX2hlYXBfcGFnZXMoDQo+ID4gPiAgICAgICByZXR1cm4gcGc7DQo+ID4gPiAgIH0NCj4gPiA+
DQo+ID4gPiArLyoNCj4gPiA+ICsgKiBBbGxvY2F0ZSBucl9wZm5zIGNvbnRpZ3VvdXMgcGFnZXMs
IHN0YXJ0aW5nIGF0ICNzdGFydCwgb2Ygc3RhdGljIG1lbW9yeS4NCj4gPiA+ICsgKiBJdCBpcyB0
aGUgZXF1aXZhbGVudCBvZiBhbGxvY19oZWFwX3BhZ2VzIGZvciBzdGF0aWMgbWVtb3J5ICAqLw0K
PiA+ID4gK3N0YXRpYyBzdHJ1Y3QgcGFnZV9pbmZvICphbGxvY19zdGF0aWNtZW1fcGFnZXModW5z
aWduZWQgbG9uZw0KPiA+ID4gK25yX3BmbnMsDQo+ID4NCj4gPiBUaGlzIHdhbnRzIHRvIGJlIG5y
X21mbnMuDQo+ID4NCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYWRkcl90IHN0YXJ0LA0KPiA+DQo+ID4gSSB3b3VsZCBwcmVmZXIgaWYgdGhp
cyBoZWxwZXIgdGFrZXMgYW4gbWZuX3QgaW4gcGFyYW1ldGVyLg0KPiA+DQo+IA0KPiBTdXJlLCBJ
IHdpbGwgY2hhbmdlIGJvdGguDQo+IA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludA0KPiA+ID4gK21lbWZsYWdzKSB7DQo+
ID4gPiArICAgIGJvb2wgbmVlZF90bGJmbHVzaCA9IGZhbHNlOw0KPiA+ID4gKyAgICB1aW50MzJf
dCB0bGJmbHVzaF90aW1lc3RhbXAgPSAwOw0KPiA+ID4gKyAgICB1bnNpZ25lZCBpbnQgaTsNCj4g
PiA+ICsgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGc7DQo+ID4gPiArICAgIG1mbl90IHNfbWZuOw0K
PiA+ID4gKw0KPiA+ID4gKyAgICAvKiBGb3Igbm93LCBpdCBvbmx5IHN1cHBvcnRzIGFsbG9jYXRp
bmcgYXQgc3BlY2lmaWVkIGFkZHJlc3MuICovDQo+ID4gPiArICAgIHNfbWZuID0gbWFkZHJfdG9f
bWZuKHN0YXJ0KTsNCj4gPiA+ICsgICAgcGcgPSBtZm5fdG9fcGFnZShzX21mbik7DQo+ID4NCj4g
PiBXZSBzaG91bGQgYXZvaWQgdG8gbWFrZSB0aGUgYXNzdW1wdGlvbiB0aGUgc3RhcnQgYWRkcmVz
cyB3aWxsIGJlIHZhbGlkLg0KPiA+IFNvIHlvdSB3YW50IHRvIGNhbGwgbWZuX3ZhbGlkKCkgZmly
c3QuDQo+ID4NCj4gPiBBdCB0aGUgc2FtZSB0aW1lLCB0aGVyZSBpcyBubyBndWFyYW50ZWUgdGhh
dCBpZiB0aGUgZmlyc3QgcGFnZSBpcw0KPiA+IHZhbGlkLCB0aGVuIHRoZSBuZXh0IG5yX3BmbnMg
d2lsbCBiZS4gU28gdGhlIGNoZWNrIHNob3VsZCBiZSBwZXJmb3JtZWQgZm9yIGFsbA0KPiBvZiB0
aGVtLg0KPiA+DQo+IA0KPiBPay4gSSdsbCBkbyB2YWxpZGF0aW9uIGNoZWNrIG9uIGJvdGggb2Yg
dGhlbS4NCj4gDQo+ID4gPiArICAgIGlmICggIXBnICkNCj4gPiA+ICsgICAgICAgIHJldHVybiBO
VUxMOw0KPiA+ID4gKw0KPiA+ID4gKyAgICBmb3IgKCBpID0gMDsgaSA8IG5yX3BmbnM7IGkrKykN
Cj4gPiA+ICsgICAgew0KPiA+ID4gKyAgICAgICAgLyoNCj4gPiA+ICsgICAgICAgICAqIFJlZmVy
ZW5jZSBjb3VudCBtdXN0IGNvbnRpbnVvdXNseSBiZSB6ZXJvIGZvciBmcmVlIHBhZ2VzDQo+ID4g
PiArICAgICAgICAgKiBvZiBzdGF0aWMgbWVtb3J5KFBHQ19yZXNlcnZlZCkuDQo+ID4gPiArICAg
ICAgICAgKi8NCj4gPiA+ICsgICAgICAgIEFTU0VSVChwZ1tpXS5jb3VudF9pbmZvICYgUEdDX3Jl
c2VydmVkKTsNCj4gPiA+ICsgICAgICAgIGlmICggKHBnW2ldLmNvdW50X2luZm8gJiB+UEdDX3Jl
c2VydmVkKSAhPSBQR0Nfc3RhdGVfZnJlZSApDQo+ID4gPiArICAgICAgICB7DQo+ID4gPiArICAg
ICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlINCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICJS
ZWZlcmVuY2UgY291bnQgbXVzdCBjb250aW51b3VzbHkgYmUgemVybyBmb3IgZnJlZSBwYWdlcyIN
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICJwZ1sldV0gTUZOICUiUFJJX21mbiIgYz0lI2x4
IHQ9JSN4XG4iLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgaSwgbWZuX3gocGFnZV90b19t
Zm4ocGcgKyBpKSksDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICBwZ1tpXS5jb3VudF9pbmZv
LCBwZ1tpXS50bGJmbHVzaF90aW1lc3RhbXApOw0KPiA+ID4gKyAgICAgICAgICAgIEJVRygpOw0K
PiA+DQo+ID4gU28gd2Ugd291bGQgY3Jhc2ggWGVuIGlmIHRoZSBjYWxsZXIgcGFzcyBhIHdyb25n
IHJhbmdlLiBJcyBpdCB3aGF0IHdlIHdhbnQ/DQo+ID4NCj4gPiBBbHNvLCB3aG8gaXMgZ29pbmcg
dG8gcHJldmVudCBjb25jdXJyZW50IGFjY2Vzcz8NCj4gPg0KPiANCj4gU3VyZSwgdG8gZml4IGNv
bmN1cnJlbmN5IGlzc3VlLCBJIG1heSBuZWVkIHRvIGFkZCBvbmUgc3BpbmxvY2sgbGlrZSBgc3Rh
dGljDQo+IERFRklORV9TUElOTE9DSyhzdGF0aWNtZW1fbG9jayk7YA0KPiANCj4gSW4gY3VycmVu
dCBhbGxvY19oZWFwX3BhZ2VzLCBpdCB3aWxsIGRvIHNpbWlsYXIgY2hlY2ssIHRoYXQgcGFnZXMg
aW4gZnJlZSBzdGF0ZQ0KPiBNVVNUIGhhdmUgemVybyByZWZlcmVuY2UgY291bnQuIEkgZ3Vlc3Ms
IGlmIGNvbmRpdGlvbiBub3QgbWV0LCB0aGVyZSBpcyBubyBuZWVkDQo+IHRvIHByb2NlZWQuDQo+
IA0KDQpBbm90aGVyIHRob3VnaHQgb24gY29uY3VycmVuY3kgcHJvYmxlbSwgd2hlbiBjb25zdHJ1
Y3RpbmcgcGF0Y2ggdjIsIGRvIHdlIG5lZWQgdG8NCmNvbnNpZGVyIGNvbmN1cnJlbmN5IGhlcmU/
IA0KaGVhcF9sb2NrIGlzIHRvIHRha2UgY2FyZSBjb25jdXJyZW50IGFsbG9jYXRpb24gb24gdGhl
IG9uZSBoZWFwLCBidXQgc3RhdGljIG1lbW9yeSBpcw0KYWx3YXlzIHJlc2VydmVkIGZvciBvbmx5
IG9uZSBzcGVjaWZpYyBkb21haW4uDQoNCj4gPiA+ICsgICAgICAgIH0NCj4gPiA+ICsNCj4gPiA+
ICsgICAgICAgIGlmICggIShtZW1mbGFncyAmIE1FTUZfbm9fdGxiZmx1c2gpICkNCj4gPiA+ICsg
ICAgICAgICAgICBhY2N1bXVsYXRlX3RsYmZsdXNoKCZuZWVkX3RsYmZsdXNoLCAmcGdbaV0sDQo+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmdGxiZmx1c2hfdGltZXN0YW1w
KTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgICAgIC8qDQo+ID4gPiArICAgICAgICAgKiBSZXNlcnZl
IGZsYWcgUEdDX3Jlc2VydmVkIGFuZCBjaGFuZ2UgcGFnZSBzdGF0ZQ0KPiA+ID4gKyAgICAgICAg
ICogdG8gUEdDX3N0YXRlX2ludXNlLg0KPiA+ID4gKyAgICAgICAgICovDQo+ID4gPiArICAgICAg
ICBwZ1tpXS5jb3VudF9pbmZvID0gKHBnW2ldLmNvdW50X2luZm8gJiBQR0NfcmVzZXJ2ZWQpIHwN
Cj4gPiBQR0Nfc3RhdGVfaW51c2U7DQo+ID4gPiArICAgICAgICAvKiBJbml0aWFsaXNlIGZpZWxk
cyB3aGljaCBoYXZlIG90aGVyIHVzZXMgZm9yIGZyZWUgcGFnZXMuICovDQo+ID4gPiArICAgICAg
ICBwZ1tpXS51LmludXNlLnR5cGVfaW5mbyA9IDA7DQo+ID4gPiArICAgICAgICBwYWdlX3NldF9v
d25lcigmcGdbaV0sIE5VTEwpOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICAgLyoNCj4gPiA+ICsg
ICAgICAgICAqIEVuc3VyZSBjYWNoZSBhbmQgUkFNIGFyZSBjb25zaXN0ZW50IGZvciBwbGF0Zm9y
bXMgd2hlcmUgdGhlDQo+ID4gPiArICAgICAgICAgKiBndWVzdCBjYW4gY29udHJvbCBpdHMgb3du
IHZpc2liaWxpdHkgb2YvdGhyb3VnaCB0aGUgY2FjaGUuDQo+ID4gPiArICAgICAgICAgKi8NCj4g
PiA+ICsgICAgICAgIGZsdXNoX3BhZ2VfdG9fcmFtKG1mbl94KHBhZ2VfdG9fbWZuKCZwZ1tpXSkp
LA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAhKG1lbWZsYWdzICYgTUVNRl9u
b19pY2FjaGVfZmx1c2gpKTsNCj4gPiA+ICsgICAgfQ0KPiA+ID4gKw0KPiA+ID4gKyAgICBpZiAo
IG5lZWRfdGxiZmx1c2ggKQ0KPiA+ID4gKyAgICAgICAgZmlsdGVyZWRfZmx1c2hfdGxiX21hc2so
dGxiZmx1c2hfdGltZXN0YW1wKTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgcmV0dXJuIHBnOw0KPiA+
ID4gK30NCj4gPiA+ICsNCj4gPiA+ICAgLyogUmVtb3ZlIGFueSBvZmZsaW5lZCBwYWdlIGluIHRo
ZSBidWRkeSBwb2ludGVkIHRvIGJ5IGhlYWQuICovDQo+ID4gPiAgIHN0YXRpYyBpbnQgcmVzZXJ2
ZV9vZmZsaW5lZF9wYWdlKHN0cnVjdCBwYWdlX2luZm8gKmhlYWQpDQo+ID4gPiAgIHsNCj4gPiA+
DQo+ID4NCj4gPiBDaGVlcnMsDQo+ID4NCj4gPiAtLQ0KPiA+IEp1bGllbiBHcmFsbA0KPiANCj4g
Q2hlZXJzLA0KPiANCj4gUGVubnkgWmhlbmcNCg0KQ2hlZXJzDQoNClBlbm55DQo=

