Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EA42D4505
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 16:07:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48389.85563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn13i-0003y2-NC; Wed, 09 Dec 2020 15:07:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48389.85563; Wed, 09 Dec 2020 15:07:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn13i-0003xd-Js; Wed, 09 Dec 2020 15:07:14 +0000
Received: by outflank-mailman (input) for mailman id 48389;
 Wed, 09 Dec 2020 15:07:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiOm=FN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kn13g-0003xY-Kg
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 15:07:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.59]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c2d57fb-eb6b-40e8-a81e-103580190b4d;
 Wed, 09 Dec 2020 15:07:11 +0000 (UTC)
Received: from DB6P195CA0017.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::27) by
 VI1PR0802MB2319.eurprd08.prod.outlook.com (2603:10a6:800:a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Wed, 9 Dec
 2020 15:07:08 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::7b) by DB6P195CA0017.outlook.office365.com
 (2603:10a6:4:cb::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 9 Dec 2020 15:07:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 15:07:08 +0000
Received: ("Tessian outbound 665ba7fbdfd9:v71");
 Wed, 09 Dec 2020 15:07:08 +0000
Received: from b5cfdc04e386.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2D6D664A-BE66-4963-A460-5F9959E9EDE0.1; 
 Wed, 09 Dec 2020 15:06:30 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b5cfdc04e386.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Dec 2020 15:06:30 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3036.eurprd08.prod.outlook.com (2603:10a6:5:18::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Wed, 9 Dec
 2020 15:06:28 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 15:06:28 +0000
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
X-Inumbo-ID: 2c2d57fb-eb6b-40e8-a81e-103580190b4d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQe/52FD9Izyodr3+axSsuM6wzeIQcXtUpqM2gZ6Dog=;
 b=bjhIPopUmU3YbhCv6z56plku4LR3WJs45iYTU9pL48H3phbxeDwTLAoTcn8uah5G0abAYEJHbJhx0x7PSkKgQpNZPhxvobQT+ewgJwt1ST/bK/9hXofLSJPL2PiRTpv5TBS1K56YDecMFl+n8FrpdCLw6i7wxbMRPv9rhAOPKSk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 82d7be83f3a6fc3f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eutjk7iEUPMRYhg/ukCpVnKCMRetMJSbIB32Zw7RCdsKubWQ8RPd2DF6+WkJjr0hYbcHimWjMQra8Wt7KBe1Pk5+cOcFX/3OcyRv2B90IAbUs4F5QAMIUhS8qkjPY/cL5sKN1TONLldyrRljDR8o20o7cYY13zLjXEGJRswZF5rdtAkRDSJTQEpAdtrNVrVDgU6nqb/6LXirWc7DNPwVK6tGlWzsSSpdRSrIpbNVqIq2g9DI6kgOQStvBTNf0Rlr/SIQuRT+69chS8b3nNK78GipM8XURbQTLRMavYKz7r+LdpiR06cy1Vuj+Eg7R1cVf/VY3gqawJOYptbdNTrc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQe/52FD9Izyodr3+axSsuM6wzeIQcXtUpqM2gZ6Dog=;
 b=cddb0VBF4GRwi/LPh+bRinUifyhD0FgaZ93KusMdY78rAJA6Z4lxGKHVjLzIRJumGXNLletZblQ4T/x+LGaBBHUURYPCUcXSH4T9L9pIhIzYmS/I6Do4qxOvdvurT6hi5R6p1x5VJ75slw1rf+mYeaolXuc9U0iUCAOVSSIqFVk03IPR5AvdRKw31HOzzo+7fnFDVdEsdfA3QjlSkQY/2EyBMb+jPSZdflq4noaEc2kIJHAziCYlR/Mnbt7rZG0+kbvjnx0tG3dQ5SfHAlo+7kMycKtaGzOHGtwZJSUqMytt+tjq/0IYmdjL8Zfhl8mHaaYyo9b4iviCDfGTnjw1Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQe/52FD9Izyodr3+axSsuM6wzeIQcXtUpqM2gZ6Dog=;
 b=bjhIPopUmU3YbhCv6z56plku4LR3WJs45iYTU9pL48H3phbxeDwTLAoTcn8uah5G0abAYEJHbJhx0x7PSkKgQpNZPhxvobQT+ewgJwt1ST/bK/9hXofLSJPL2PiRTpv5TBS1K56YDecMFl+n8FrpdCLw6i7wxbMRPv9rhAOPKSk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 7/8] lib: move bsearch code
Thread-Topic: [PATCH v2 7/8] lib: move bsearch code
Thread-Index:
 AQHWqSYUW6jKcf9JAUabryyJK6872KnOWaMAgAERSYCABxiQgIAAHyEAgAEQxgCAFABlAIADGMmAgABP5wCAAAergIAAA00A
Date: Wed, 9 Dec 2020 15:06:28 +0000
Message-ID: <CBC505FF-7D23-4AC5-9EAD-91E833EB6B45@arm.com>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <87a20884-5a76-a664-dcc9-bd4becee40b3@suse.com>
 <44ffc041-cacd-468e-a835-f5b2048bb201@xen.org>
 <2cf3a90d-f463-41f8-f861-6ef00279b204@suse.com>
 <2419eccf-c696-6aa1-ada4-0f7bd6bc5657@xen.org>
 <77534dc3-bdd6-f884-99e3-90dc9b02a81f@citrix.com>
 <59a4e1c1-ea39-1846-92ae-92560db4b1fb@xen.org>
 <e0782c3b-9958-3792-eab9-d3fd6708225f@suse.com>
 <5fc44865-2115-947c-bd22-b51d7f17d39c@xen.org>
 <689373AE-AF16-429F-818C-0467485E5748@arm.com>
 <80ee54b1-5fd1-2aa8-606f-279c4b81a7ad@suse.com>
In-Reply-To: <80ee54b1-5fd1-2aa8-606f-279c4b81a7ad@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 76bc1d98-afc4-45d7-5c09-08d89c5418fe
x-ms-traffictypediagnostic: DB7PR08MB3036:|VI1PR0802MB2319:
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB23194A80731BF016FE209C759DCC0@VI1PR0802MB2319.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 40TKpLQdEt6dVTaPWrUm0e0jeejM4MOo8gl6maFe+Qogf2aR8U3QmgGtMyHNQZA5mnUT5GEpDIjcySllANYKvhYT3OorJ0bQ1Ler9z0nsTE79vLhPmKXLS6ItlLwK8680egWvEsftEcaQ5Bc6ej6rQwz50AU6Ao9M4hg3f46iKVqumdkosMPhFp6a/sSg5U/SjVyAdqdVmgDeJn6lxhtd/597z5679KAO5EF6JM1NY5Wy1tzG3NQcFuKsiNnUdJ/X6W2GZaE4ZQbuYzXTSfsrxnGZ32vA44wcTe0PcdM8lEOChOKdI4Gen4p0KcvI/La68kL1fX5YujXrhQe1RcTDtdght0wDXM+S7dNO/ClH04XbXntnL6guJSd07Bx3l54
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(54906003)(6916009)(71200400001)(66946007)(6512007)(33656002)(8676002)(316002)(2616005)(66476007)(2906002)(53546011)(86362001)(36756003)(478600001)(83380400001)(26005)(6486002)(8936002)(91956017)(6506007)(186003)(66446008)(5660300002)(4326008)(76116006)(66556008)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?jAa6TZMuSYzs9jH+7buaTUwV1Ol9M4XHPH05iD/Lrf8QnhwSfKyqSm/EGDuo?=
 =?us-ascii?Q?bcLd3ANKKsUu/02XrQ6V3D+KSrwHHjp4SuGTUql5QABWqOK5hR4FBWVOVEP0?=
 =?us-ascii?Q?AxTTE7o7AWtgvdZMx4ffDkV3Rqihe+XdeRMcgPg56BITVTZvUM7aC6vmzldL?=
 =?us-ascii?Q?GJn7ygDZbroCnSpw310oZDYlItIJWGOk659GOSh6V5ASocV/7T+ava5BTKIg?=
 =?us-ascii?Q?p+lXmQb2+NmWJn9dJSfs+aTyCaj+Vdt7UZT4qOLjzA3lYtybBwWQo+BUnRrC?=
 =?us-ascii?Q?VBIg4esDfJN2ovToz/uTJKlbLbtAmg0HO7P9ajnQBcTZnqwLPdRALW8Ibeuu?=
 =?us-ascii?Q?Q8zBQr4wm79d6+2MeIGfky7gdP9YdrB0tsKho3x8o1wKgwYPa0TaLxYMTsn2?=
 =?us-ascii?Q?xAqASjBxcb3FM61fiu7V8bLSDjSDRtFcCFml9Fl2qmzdk1Q3e5FrI1O9yBbI?=
 =?us-ascii?Q?smERPbLOToqbjlH8I1+EFunMACze0LH7d8ZpR3RAkHSNx61cEMKaF8YNJuin?=
 =?us-ascii?Q?BaEmUKTzNMB0jL/1X+k7CU4eAsTVMU7KeMWmMDa8Hqsc7zx5YhYnlt47Peha?=
 =?us-ascii?Q?wdfUWq7rHnhvNeTRod9zDK1Ga5cXlPReUueUT+gH0Uu/OkhhwcE7DuYXbiIX?=
 =?us-ascii?Q?gSQWgPK68Y+d3H5SPefeCjDZeq0ZGsWPZVCB4lJoMsicsL6v/zardJ0ICOsC?=
 =?us-ascii?Q?u/plg19iW1deJzADXVQIj3e/+Gi9qKZgNyQQ9lO1cXv612gtd+Q550bnLSku?=
 =?us-ascii?Q?hj1DgTvT2dP3TSUKta0ozuzlQT1jNtdhh72FsSqFbwiWib/CyGTT6CudVH95?=
 =?us-ascii?Q?nVrDLhTyYCzXOPSYGZhSpiIVrcG79FJS6eBizz7TUd1HU1j0/50L5D+Yc5yq?=
 =?us-ascii?Q?C6IgGiMA7WS1QUZ4D22DBuIzJILNOY3Bw2Fz3e9nGw3m+FelwiIz72pm7sSg?=
 =?us-ascii?Q?hIicB89YX7h9+WJjUfCgbHGsOP/w5EcDGe42s+CP069AssCLIntNBJvQxjoX?=
 =?us-ascii?Q?PhIO?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DB9792C7A7B0CE43B9045AD735A0E178@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3036
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	16b370c6-94fc-4795-86d9-08d89c540166
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/5e+Fqjj6SFkVNL7Gr6DHR8lLsOWp75ekUv0I+PxK0w0L+GWsN1mkkprlwYjiAxZE2DncZfcqKLhHsVpndWpRic9VNoTZ7t3+GZ2E+Cio3FaQJ12RTS9Ph3M+CbdQetSvPBlcC0Zl5Oi0TDyGeGOYT0Q5CepwXIg5y9E/vSMsC28T4YY74tkmV6bAsY32cGfeHbPC2buP2svvyvqkM932rStW70KflyxzQrDwEoFRBucSKK/2pdUXWTDz3lPl8cPN0MbjoeyCBaFvO1xBejCG6+lf1J36psKMTQwBYeD8Nk9fb0bepceyRLPeaP6010Esq/ucT/xFgHzrWF3GhQ5roD3qgezA1RihQRjOypmkDQyn+WSk13ymutchz4wghDVbhyg23aCOBoWViZvYUT25w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(46966005)(6862004)(8936002)(81166007)(70206006)(83380400001)(5660300002)(47076004)(8676002)(2906002)(356005)(6486002)(54906003)(86362001)(186003)(70586007)(26005)(508600001)(6512007)(336012)(36756003)(33656002)(82310400003)(6506007)(53546011)(4326008)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 15:07:08.3364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76bc1d98-afc4-45d7-5c09-08d89c5418fe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2319

Hi Jan,

> On 9 Dec 2020, at 14:54, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 09.12.2020 15:27, Bertrand Marquis wrote:
>>> On 9 Dec 2020, at 09:41, Julien Grall <julien@xen.org> wrote:
>>> On 07/12/2020 10:23, Jan Beulich wrote:
>>>> On 24.11.2020 17:57, Julien Grall wrote:
>>>>> On 24/11/2020 00:40, Andrew Cooper wrote:
>>>>>> On a totally separate point,  I wonder if we'd be better off compili=
ng
>>>>>> with -fgnu89-inline because I can't see any case we're we'd want the=
 C99
>>>>>> inline semantics anywhere in Xen.
>>>>>=20
>>>>> This was one of my point above. It feels that if we want to use the
>>>>> behavior in Xen, then it should be everywhere rather than just this h=
elper.
>>>> I'll be committing the series up to patch 6 in a minute. It remains
>>>> unclear to me whether your responses on this sub-thread are meant
>>>> to be an objection, or just a comment. Andrew gave his R-b despite
>>>> this separate consideration, and I now also have an ack from Wei
>>>> for the entire series. Please clarify.
>>>=20
>>> It still feels strange to apply to one function and not the others... B=
ut I don't have a strong objection against the idea of using C99 inlines in=
 Xen.
>>>=20
>>> IOW, I will neither Ack nor NAck this patch.
>>=20
>> I think as Julien here: why doing this inline thing for this function an=
d not the others
>> provided by the library ?
>> Could you explain the reasons for this or the use cases you expect ?
>>=20
>> I see 2 usage of bsearch in arm code and I do not get why you are doing =
this for
>> bsearch and not for the other functions.
>=20
> May I ask whether you read Andrew's quite exhaustive reply to Julien
> asking about this? Apart from this, it was Andrew who had asked to
> inline bsearch(), and I followed that request. The initial version
> of this series didn't have any inlining of these library functions
> (which, after all, also isn't the goal of the series).

I just did (sorry missed that one in the history).

But seeing where this is called and the look of the code with this
change i do not really think that the complexity introduced by this
will make a real win in terms of performance/code size but it does
make this complex.

So I would rather have the inline part out but the code is right:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

so that this is unblocked.
Regards
Bertrand

>=20
> Jan


