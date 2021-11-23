Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3E845A929
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 17:44:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229772.397274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpYuR-0002Mc-Jc; Tue, 23 Nov 2021 16:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229772.397274; Tue, 23 Nov 2021 16:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpYuR-0002KH-Fd; Tue, 23 Nov 2021 16:44:43 +0000
Received: by outflank-mailman (input) for mailman id 229772;
 Tue, 23 Nov 2021 16:44:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRmA=QK=epam.com=prvs=19611c0f38=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mpYuQ-0002KB-1U
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:44:42 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6e1017f-4c7c-11ec-9787-a32c541c8605;
 Tue, 23 Nov 2021 17:44:40 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1ANFDF4g020298;
 Tue, 23 Nov 2021 16:44:37 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cgy2phcwp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 16:44:37 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6068.eurprd03.prod.outlook.com (2603:10a6:208:166::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 16:44:33 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 16:44:33 +0000
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
X-Inumbo-ID: a6e1017f-4c7c-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EShTJGM7q7Y8ZWXq3bwiTO8JxQz3l/AYLEF1CiPu5R7B7xeNRv7iOqD1lGVjfAytCDM6rdJ9RrBlcaqAh7j7X7Qy1JoSR2qne4uKpDMIhrec17RzZetr4DJIKMeNx6Q5N3laxzbHKsnHt7zSChdj4OilScPnplHbq0sFcNHokd0r/lKWaZ5IjjrkhqyqgyxLKp9xca5nFuiYlaxZnU5yWkG9MvBA33/rhnR4S5Ix5rLpxYpHWe+rPnDibkJR1nsBwCFibz9vF95B2Be5FiqsYTk+oiAm3ToZYs31sO6o6ZqvVB9lznuT1H+XlFYaF3ux5u8O3EiRAsxMps28TSR50g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+/gV1yzbKWHlXm9d6UM4DKOw3Z7lrkKkJYWhzrEFmA=;
 b=DhMY9QX7DJNAf+M8hS0H4ZXCTUi7SjLBgxN6/yUZK8C8WMs6nLwDZTkOk2fwlzNMUDZOh27I700aoD+/KOFEb2J09Hh76H+OqZ7fq8Mc/KDcdRkPZsmltru4Ok9jv+FxTq8NGyulnj+ulZKXriimcuYW1/nn8P90eOb4UMq5lOXX7KyGNIAB2MIyhTff4ulBTy6TYLPwswSPOmfrYVrvymo7l/jrhHMboeh5BXRiGHHitqXpugp/h0LPBcNl8voy1Fq9JzG0JiRLJ2gaCoPDiaakjoWisI9JaR82ExPzD5vAqO+CPMEbGBH8dGN1/DGLtCyiyjdULR0CYYmTXMqNaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+/gV1yzbKWHlXm9d6UM4DKOw3Z7lrkKkJYWhzrEFmA=;
 b=jR7941Fqm3WVynNUZMquuRm3T57FGIoepq9pJVFvTOJqKutHf2i3xmo2sIHPZRPdNxiKrO2VudZ3jSxKauPg3PlrsSH/TC6ac/j8p4HKn6LGej/dL6yEjM46wtXkxIhdLpEQUncPGc0NY9V+w6DP9eJfcpH0HEoh2yIN377pQReXlKuAtPA/gkNiRpM7u9Ker4lYpecFUUvX7mFB8snZp4/eyULQIcszFCuMKEigEWTtbeFjzhOHC1LcqBQFQ5k5GgeRFzxHmtF3T6cP7Rkspdo4q1usmE5sESRH0GjrI9y+PPcD9jev8D3vlDmo+67EYaLKGl58XzJhMMeAZHoidw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 2/7] xen/arm: add pci-domain for disabled devices
Thread-Topic: [PATCH v6 2/7] xen/arm: add pci-domain for disabled devices
Thread-Index: 
 AQHX0g8QVTbfP59mVU+LM2unTUGOtawGkRQAgADLYgCAAPUEgIAAofWAgAbUDQCAAA7WAIAADxaAgADd7ICAAKBPgIAACwWA
Date: Tue, 23 Nov 2021 16:44:32 +0000
Message-ID: <bfd5d305-b315-2f6d-455d-dd3ba071d0b2@epam.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-3-andr2000@gmail.com>
 <86cabc8a-cbf2-84d4-4162-7d5591d127c5@xen.org>
 <de155886-d039-4c45-0407-47f38f8cd75d@epam.com>
 <ab95fc39-d1b2-be80-8245-85161a8271e1@xen.org>
 <072848c8-54da-cb73-3b8a-0c35826cc812@epam.com>
 <e66c4189-acdf-c32f-4b50-51c8aaab4efd@xen.org>
 <315b1308-5adc-c4f3-6150-1060dbac5f4f@epam.com>
 <9f8e424d-ad1c-2d32-a470-68b275adf22c@xen.org>
 <0aff1bbb-eaf8-4deb-0808-d7db5f1ba8f5@epam.com>
 <ab73f2e5-11d1-7cb4-89ab-74ef5eb1d32d@xen.org>
In-Reply-To: <ab73f2e5-11d1-7cb4-89ab-74ef5eb1d32d@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d202f75-0042-4f04-e354-08d9aea086dc
x-ms-traffictypediagnostic: AM0PR03MB6068:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB60684AFC7B60F2D27D3C7E15E7609@AM0PR03MB6068.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QKn3eGnCl4OOuuCBvrD1I0xm861HnfPNRCiaL2o5iUzH2g/CoUklb0lTnHuLxjyigpRxI+qLgfJ0ACknf32en2F6/syCqhtX2x+xkrS7ET/c06Z/dSDs+2Bjc/ByGArW+WyOnyKJLs/X5ztvVZcyNrwBFiLmDDarMQshrwodX/jfvnDgEaS6fiyZeyfS7GdFlEXOYvbEos4mNO70r/ZIhebFgjeIkP85Ml4xaCxOyTN+9XFqIoeBaDjsSi/5Tr2Q6ASlayS5aqZNzNTaiGXO1WLSixwf/BGmCQqXPNAJbwUTD1T7/JnEiBiZtdjwyp8BUgHFpEqqFuLhvFkk0hYM6/S0Q7vT584pH26+mZOTE56WKH1S7x9OHBpNFCdQDDnuENkOaEoXsPvogeQUW59HlpymsYFHBiIeSsi4HnFx2PV592ZZ8WCOKGxLhiMTu+6EA7kljF3a3pT0oDQ2p8qEo64hTB4OCcx+WwwGnN9O3oRHyVkPgHnrIpFjo3etsg8SDBqazSeUBgMnjWm5weNpY+W4qPmOTZNSsB+FOfQa0gvnFnqXzGZHEehEUythjSxg5cqeQYgiW3xvOF7cv3L1UaEiZ9/5dBWonvVY6achM0/z7OpUPpdeLxvl+Q9XdqEzFgCOavrema/2IvyuZMsAHtJd55CNpUcjwzFRt+bxzUrdH9Avd4fnTPaSBY3zsSbFwPn5liHvz6Ji4xNE25rcDVshFNDUZI7CpuudNS1QjFgUtStE6T/psmxI3+UKcmMe
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(71200400001)(66446008)(110136005)(6486002)(5660300002)(91956017)(83380400001)(2906002)(122000001)(64756008)(66556008)(66476007)(66946007)(31686004)(107886003)(6512007)(6506007)(38100700002)(31696002)(86362001)(316002)(186003)(53546011)(8936002)(8676002)(38070700005)(508600001)(36756003)(4326008)(76116006)(54906003)(26005)(7416002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QXhZN0FsZ2dHTWZ0anVUalMxZDJHaU9SMkR0QXFzSnI0Q0ZHdThYU2dpNGV3?=
 =?utf-8?B?UnVjV3NzM3JiSWtnQW5HdUZDVUp1YVdTTWY5S2xsb0hkaXZQYW9zZ3NzR2tT?=
 =?utf-8?B?RmVHVW5kNTFHTmJzWTRMaDdTTG04enNLM2tOL2xKRnE1T1NnV3RWQlM5TjRL?=
 =?utf-8?B?OTdBY3h6dmg3cXlCdnVQU0ZQQ0s4VDRCMzd3Q1BVcThlaVB5ZHZTeFRiRC9h?=
 =?utf-8?B?QzQ5SUQyaW9JL3JHYThxZlBRZXJ2YmJSVW5HRDllaTR0MzlYV0lRQ0tJUzkw?=
 =?utf-8?B?RnpRa0tVYWxoeXNSSUFkMkJiNUhDOGhZWExEUG5BV0FsdnB4ZkdwS1IrcjdN?=
 =?utf-8?B?QkF2di94Q3R2ZFIxR1VFMzZkUGpuWEQvRWVLbEM3NHZoM1FRU3hwMm9Cbnlm?=
 =?utf-8?B?dWtndEhaY2ljdEZBbE02NjU4U0hwSjFnNFN0bWtKTVNpV1BadTFCRC92UlQy?=
 =?utf-8?B?b0tCakw2dmF5V0xiNnl5cmx2T3BheFViVUhac0svVjY5Rmp3YzY5LzNoOHhj?=
 =?utf-8?B?QnFKaUdZYk5uNmhTbmJaSXQ4OG91RVNwZFp1R21kV0pkUmlBV3NtU0R6R2tL?=
 =?utf-8?B?V2J5bVdwcmwvcVFjckE3YnIvMWtUTVY2WC9wMW9GcEVyM0hhNzV2d0x0Nml4?=
 =?utf-8?B?bHVkVW5YVmpUNXVnM0dDRVZCV2pnSjJWMjBjRmgzcC9JanQxZU8rdmFPUEdG?=
 =?utf-8?B?d3Z6NkJLWm9qQWd0QXRLWkFCQm9HK0llQksvTVZUcmwyZUorSm0zQTNGQjN1?=
 =?utf-8?B?OXZOQmRjdGpNT0dMeHhNUFpVenRucjl2M3VVRGZrR1c4NHAwSmxKUEJFUkJy?=
 =?utf-8?B?ak8wN2dwV2xKNEYrWU53eGhQSWhqbzFJTkNReHkwbTB2eTA4T21xNUxLRjZ1?=
 =?utf-8?B?Wnc4YjVzTS9wNU00RUNkTnJIVVpsYzlBcW5wRWdkQVRqcTJuUndmRWp2RnVI?=
 =?utf-8?B?cDNtSkRYZ1FyR2lpOG1JaU1TcjN5WUFGZndBVitDZTV0NkZZVUM5aU50Zk9U?=
 =?utf-8?B?Z0JORTVoUEhVaitQbEdGajZ3WVh4N2VkK1VSTlZXd1FqMXI1cWM4NkxZSURP?=
 =?utf-8?B?MFNuWDcvRU12VmhpRHFybzlBVUxEZXF5ODU0bkZpYkFMMW82aGVzV3UrNU5l?=
 =?utf-8?B?WkpOOVNYMCsvSmJGRnhMaFl2L3RHZ25pYVAyd2syT3c2T2hnN1p5SWpacm4v?=
 =?utf-8?B?THNqSWtXcklySGdmNFdZellCV1pnU2wwV1loeVJZU00xTzlpam1IWllBM3Fj?=
 =?utf-8?B?TlAyb0RIQkpuVU82UkNzWHRqOUhaVThHYjVKenNrMGZpQ1pGWEtTNFE3ZE4v?=
 =?utf-8?B?cXMxenJQYTNkZHpRYjZyMitvMUV0WmkwbEVRSDhObFI5aWhPYi9SbzFOb3VB?=
 =?utf-8?B?QmlDNjNhSVdZUklxam11R3pYQzd5RWdtVVVxNG9zVlJHTUppckJaMUlYRTRu?=
 =?utf-8?B?Qk44NkhXUjZ3eEZuQklkWTJXRzlYeWsyYUpaMWFPZmZad05MWjdMSWxxK1NC?=
 =?utf-8?B?eCtnN3hVckJEb0JQOW5SSjBTVXlLWWNFcUIwb29rcUJXRWhodDhhSjVHNVhL?=
 =?utf-8?B?eWxreHVkMDF3elJadkE1dzRLZ2U5SVZjRm9RWE45ZEQvSGtWREdlZDlLY1gr?=
 =?utf-8?B?akhqWWZINS94eUd4dytxeGE4M3ljUk1QcFg5enRRajR0SlBkMGoyamFaZXdt?=
 =?utf-8?B?cWlRaGs2eWNSeVFEQ2pJNnFlL2NKMGJWQy90a2JRTUZ2V0UzdVl1Q0RSM0Fj?=
 =?utf-8?B?M1AwLytma2c5bnlCamMyQzlrSVRjWHBGZGN2ckdhR0h2VWF3N1BPOFlQSU53?=
 =?utf-8?B?NzlsR2lkd1BvNDJCTDhtQTIxQ1R2NC9oNHlHcGpOcGE3U2NleHVMMjladS9r?=
 =?utf-8?B?aHZaVm5qa1RFbjExaGZXRUR6bFV0cU1UNnd3d2dXTTQ5K3J0Zk9mdWZ1TDAz?=
 =?utf-8?B?MXRGc2JvM3AyeHlRS1NyTU9EWkh6SWRQRnJTeWh1bjN1OUF4THR3VU9hN0tu?=
 =?utf-8?B?TzVGcGJBV3BiN0ZYVHdBWERFbllKenJMUGRRVnh2TnAzdzNWcVhqT29jamI3?=
 =?utf-8?B?UXFFcGdzanlqRlUvcStXc05NZzdjLytWRUkyVmRLbk9zVFNPTFJuK1J4a3pJ?=
 =?utf-8?B?SGVPNTJhbUk1SE0rbUV2N2EzMC9SV2QvWEFKZVY0OTdBdWxnVjMvU1VhMmU0?=
 =?utf-8?B?Rk5jckhBYllzS2dOMUJ1QVZqN1cxL3BEOG1tSFI1bktRTUkvanJoejgwdTIy?=
 =?utf-8?B?YlJHaEZTT0VKUmFzd0VxemVlWWZpSWFvTjltN2owbkFZNFBqdzhGemkyeGVD?=
 =?utf-8?B?T0kzbjZWZ1NHM3FUMHRtYXMwSmpCNWlOUWh0TG42STQ2eTA2bHVmdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CDC51D6F28D374587380E699ED8727E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d202f75-0042-4f04-e354-08d9aea086dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2021 16:44:32.8307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P/qqzNInQUFJwspZsfDM0ApiTIwIrhmH+EZBTzTmhu1YgKll23ot8au+MZlGDBSTj4OHVD3nBelbFsmcjSj2KkpWUT7Cpub/zDVGxg0/sJhqbLiHjZjXVKWMKF46k36r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6068
X-Proofpoint-ORIG-GUID: FGdKwCUtuSgDqhb-N7TMULlAUaBAFOH8
X-Proofpoint-GUID: FGdKwCUtuSgDqhb-N7TMULlAUaBAFOH8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-23_06,2021-11-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 clxscore=1015 bulkscore=0 mlxlogscore=679 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111230085

SGksIEp1bGllbiENCg0KT24gMjMuMTEuMjEgMTg6MDUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4g
SGkgT2xla3NhbmRyLA0KPg0KPiBPbiAyMy8xMS8yMDIxIDA2OjMxLCBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyB3cm90ZToNCj4+DQo+Pg0KPj4gT24gMjIuMTEuMjEgMTk6MTcsIEp1bGllbiBHcmFs
bCB3cm90ZToNCj4+PiBIaSwNCj4+Pg0KPj4+IE9uIDIyLzExLzIwMjEgMTY6MjMsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAyMi4xMS4yMSAxNzoyOSwgSnVsaWVuIEdy
YWxsIHdyb3RlOg0KPj4+Pj4gSSB3b3VsZCBwcmVmZXIgdG8gZ28gd2l0aCBteSB3YXkuIFRoaXMg
Y2FuIGJlIHJlZmluZWQgaW4gdGhlIGZ1dHVyZSBpZiB3ZSBmaW5kIERldmljZS1UcmVlIHRoYXQg
bWF0Y2hlcyB3aGF0IHlvdSB3cm90ZS4NCj4+Pj4gT2ssIHNvIGp1c3QgdG8gbWFrZSBpdCBjbGVh
cjoNCj4+Pj4gwqDCoCA+YSBQQ0kgZGV2aWNlIHdvdWxkIGFsd2F5cyBiZSBkZXNjcmliZWQgYXMg
YSBjaGlsZCBvZiB0aGUgaG9zdGJyaWRnZXMuIFNvIEkgd291bGQgcmV3b3JrIHRoZSAnaWYnIHRv
IGFsc28gY2hlY2sgaWYgdGhlwqBwYXJlbnTCoHR5cGXCoGlzwqBub3TCoCJwY2kiDQo+Pj4NCj4+
PiBUaGF0J3MgY29ycmVjdC4gVGhhbmsgeW91IQ0KPj4gT2ssIHNvIGhvdyBhYm91dA0KPj4gwqAg
wqDCoMKgIGlmICggaXNfcGNpX3Bhc3N0aHJvdWdoX2VuYWJsZWQoKSAmJiBkdF9kZXZpY2VfdHlw
ZV9pc19lcXVhbChub2RlLCAicGNpIikgKQ0KPj4gwqAgwqDCoMKgIHsNCj4+IMKgIMKgwqDCoMKg
wqDCoMKgIGJvb2wgc2tpcCA9IGZhbHNlOw0KPj4NCj4+IMKgIMKgwqDCoMKgwqDCoMKgIC8qDQo+
PiDCoCDCoMKgwqDCoMKgwqDCoMKgICogSWYgdGhlIHBhcmVudCBpcyBhbHNvIGEgInBjaSIgZGV2
aWNlLCB0aGVuICJsaW51eCxwY2ktZG9tYWluIg0KPj4gwqAgwqDCoMKgwqDCoMKgwqDCoCAqIHNo
b3VsZCBhbHJlYWR5IGJlIHRoZXJlLCBzbyBub3RoaW5nIHRvIGRvIHRoZW4uDQo+PiDCoCDCoMKg
wqDCoMKgwqDCoMKgICovDQo+DQo+IFRoaXMgY29tbWVudCBpcyBhIGJpdCBjb25mdXNpbmcuDQpE
byB5b3UgaGF2ZSBzb21ldGhpbmcgb24geW91ciBtaW5kPw0KPiBJIHRoaW5rIHdoYXQgbWF0dGVy
IGlmIHRoZSBwYXJlbnQgaXMgYSAicGNpIiBkZXZpY2UsIHRoZW4gdGhlIGN1cnJlbnQgbm9kZSBt
dXN0IG5vdCBiZSBhIGhvc3RicmlkZ2UuIFNvIHdlIGNhbiBza2lwIGl0Lg0KQnkgc2tpcHBpbmcg
eW91IG9ubHkgbWVhbiB3ZSBkbyBub3QgbmVlZCB0byBhZGQvYXNzaWduICJsaW51eCxwY2ktZG9t
YWluIiwgcmlnaHQ/DQo+IEhvd2V2ZXIuLi4NCj4NCj4+IMKgIMKgwqDCoMKgwqDCoMKgIGlmICgg
bm9kZS0+cGFyZW50ICYmIGR0X2RldmljZV90eXBlX2lzX2VxdWFsKG5vZGUtPnBhcmVudCwgInBj
aSIpICkNCj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2tpcCA9IHRydWU7DQo+Pg0KPj4g
wqAgwqDCoMKgwqDCoMKgwqAgaWYgKCAhc2tpcCAmJiAhZHRfZmluZF9wcm9wZXJ0eShub2RlLCAi
bGludXgscGNpLWRvbWFpbiIsIE5VTEwpICkNCj4+IMKgIMKgwqDCoMKgwqDCoMKgIHsNCj4+IEkg
cGxheWVkIHdpdGggYSBzaW5nbGUgaWYgYW5kIGl0IGxvb2tzIHNjYXJ5Li4uDQo+DQo+IC4uLiBo
b3cgYWJvdXQgaW50cm9kdWNpbmcgYW4gaGVscGVyIHRoYXQgd2lsbCByZXR1cm4gdHJ1ZSBpZiB0
aGlzIG5vZGUgaXMgbGlrZWx5IGFuIGhvc3RicmlkZ2U/DQpUaGlzIGlzIHlldCBhIHNpbmdsZSB1
c2Ugb2Ygc3VjaCBhIGNoZWNrOiB3aHkgd291bGQgd2UgbmVlZCBhIGhlbHBlciBhbmQgd2hhdCB3
b3VsZCB0aGF0DQpoZWxwZXIgZG8/DQo+DQo+IENoZWVycywNCj4NClRoYW5rIHlvdSwNCk9sZWtz
YW5kcg==

