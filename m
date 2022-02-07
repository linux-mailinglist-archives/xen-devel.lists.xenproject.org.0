Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0E64ABEAF
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 13:57:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266885.460603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3Zw-0005yZ-6H; Mon, 07 Feb 2022 12:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266885.460603; Mon, 07 Feb 2022 12:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3Zw-0005wZ-2t; Mon, 07 Feb 2022 12:57:12 +0000
Received: by outflank-mailman (input) for mailman id 266885;
 Mon, 07 Feb 2022 12:57:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F54n=SW=epam.com=prvs=403792ff6c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nH3Zu-0005wR-JF
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 12:57:10 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74bd9234-8815-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 13:57:08 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 217BhOL2032550;
 Mon, 7 Feb 2022 12:57:05 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e31mpgtef-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 12:57:04 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by PA4PR03MB7213.eurprd03.prod.outlook.com (2603:10a6:102:bf::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 12:57:01 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 12:57:01 +0000
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
X-Inumbo-ID: 74bd9234-8815-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqJeWZVxv5dR2UW5/WswZ3tikfXRTbnVYm5VYXzY5K1qgjwmCesitapFUabDsg3CRgETCvehYuOR1RGxYhyvLDM793Y+KmQa4c2Pitg4NcqjC6LoVm7gaPaezsbR4v/FAW/ev9EAk6FsNUFG4JzIYmhfw0PQvUMAJ4ZDrNWRs/uY9Gt48JWGbGgobXIYrCijdAdRJr5YRgPvAMOb3qRozdUSg167ruJDyB2IRhCFl43a+VRf+U83Dqg+s5xVFN7jJqmezMtkIPSOhWO6u5w3Nd4mNgnPq8PD9xFDpfXcuk/VbX4m0rS6E2cMmgiEZXLkWAFG+o0yRRnE0+X5WReAhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtWl24wVUiCAmPhliY2OEMQ2kE9TkCcumqYM9tE56sw=;
 b=SiHspuD/BFJvoEIX95QdqQxykB+Ww9BFCO51o1WQG9oxH8Pv9QP6sTFG/iZQwbSC4QJxYy7HF3o5A+0EP4MjHO+hUiXLivaF5sATgxII+NnVQ7aI4q1Tsn/31XILhOZIo5HyB5rsQasiFFogsCPOsy8cUNCzSa5QrHOEfa3FIxwwS32Yw6WvPydcOHDzYFaTPvTtIXvB2TMKIl0JC10pLxgoXFzBKWlKtxmavcvgv0IJKnetPBUsSChuzXVSl5+KQ01HexVkK1kwryD2r2rcZ9+E7JQ3EPpCIf3fDz4I6IaTNkKw7uhbzNAfH5Nm4NMoFiB4hAHXVP+85dtlNk6Inw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtWl24wVUiCAmPhliY2OEMQ2kE9TkCcumqYM9tE56sw=;
 b=ALOu8SXUJ3Lm6xeH8f9slAc9Rk/AOBzg/m3MvqIcVLY8v5muYZKt+V6rb1ZQaBllTav/iICuEAGNvhU+UbqQH0MClKeBf+jJR25dTEuFiU/7sde5eLMTlromhuAkRK65OJs2mV/VT8+VpB5f9r4byjuA2Suka2O1IBnTfD9aQtihlizi2+QACBrgKzoaAKpC3noiAXPTDhdzFyfbODdhjRaFF0hdaNCVaE5S1Tjw/pTw5nzJepVaCBvZi8rc20fhkZyiTR9yMhXqlQhNbM1kIh4MUEQQz81DPkyzrlBhThLbUnEMuPM0Bzyz+l+m2DwszP1Z6ryWsyA8LIRivqfOWw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Index: 
 AQHYGZFc/MnzQOjwVEeBBUHLSW0md6yDBUkAgAASSACAAATYAIAAD/WAgAAKNgCAAAbfgIAABnuAgAAQvgCAAAMCAIAAAY4AgAADxICAABrnAIAABAgAgAR3CoCAABgPAIAABjkA
Date: Mon, 7 Feb 2022 12:57:00 +0000
Message-ID: <6787ff3d-aea1-d2d6-a1dd-96e80a29b8b5@epam.com>
References: <04726915-f39f-9019-436e-4399533c9fc3@suse.com>
 <9ed3f4ac-0a2d-ed45-9872-7c3f356a469e@epam.com>
 <c3a99712-cf7c-37da-aac1-f2ee00e6d53b@suse.com>
 <Yf0KcVD8W05A4fbB@Air-de-Roger>
 <1ed0e342-16cd-2f16-c05c-186667a22762@suse.com>
 <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
 <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
 <Yf0+3C9nF8+tewLw@Air-de-Roger>
 <c5fea3bb-834b-eeb7-d7a1-1ee609037a9f@epam.com>
 <a71b7835-cbbb-74bd-d25d-6824f6f10683@suse.com>
In-Reply-To: <a71b7835-cbbb-74bd-d25d-6824f6f10683@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ef655c3-f9fd-4667-7608-08d9ea395508
x-ms-traffictypediagnostic: PA4PR03MB7213:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB7213DD80700B127F37C60C66E72C9@PA4PR03MB7213.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 11JKtwgoj4UHh+QDRpRe8W6mxabdrdxPF9RTdXPPLAAR04aMFc9nCH/9R4wKChSc2EI2DUwgNWWhN6cdAi3dT3ynBtQBkaK3lqezxK6Po6AnbkntyFtHeJpxEaHfbFGpoOzMt/pcuoKHOxSvcNO85lzFvKsXp4sg4tzEaY5RldCDmc3CXcqM4RzeajzmY0R3XCvO1Aa24Bglt4YysB50XMG39X3VRM16eoyuiuYT3zXlPSVxvZtUwQ9IvRNmXxufqnxYbY0K4rxDK86vycg8GNrlt6f6ZbJGyvwKEZqRnd0Nd/EGn6j43vwGZavphEEDwP45q5yVyF4mKrZcbyoHTFbmKxSU/ExbosFuiId4XRVFB3D1NsleeqJ6J49PWobqSr3pl+ihSzRyW0lGrzpae6L9mzsF9Z92MMMmkc6RxEcMFJOYR+IjTpHkE/auIKinIQP9t26lH9yHIUQNeO8Z5Eui+CZySJL9GkKxCo3Dhi4G11Mvdwgt6uT/uIGUDhe6Q28vs4tpAUp4bzVEXivBRKCwoW48LRIUExBj/CJoTV7OTECTDvwDxx2/HM5cBKRjSFZ+W8c8i2DOyZeXvaukQWsMZw02mOrZEEqH7wOh4lhhpg71DtiM01VneM9TKvF97NG1gS01AzTSFWBpW0eAJkc8ZOHz7Lx/q/9RrPck3x+18Y/KzASSO7vPArdJjJ4mDYnnMutDw2DiAjnn08Fwjt5syeJ2n+NN8xBOXBRjSQpUyteW33OpnRltF5bywdFD
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(7416002)(2906002)(6486002)(38100700002)(6916009)(54906003)(4326008)(86362001)(122000001)(5660300002)(31696002)(38070700005)(6512007)(107886003)(508600001)(8676002)(6506007)(91956017)(76116006)(8936002)(66946007)(55236004)(53546011)(83380400001)(64756008)(36756003)(26005)(186003)(71200400001)(66556008)(66476007)(31686004)(66446008)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RWRmL2orUk9TY21tbk1iQTdiV1hVcm1xbXl4dDIwbXBYMVBhVXVIZ281bWtR?=
 =?utf-8?B?WlI2S0c3K1NxTjcyaTJzZDM4eHZtekg4ajl5RTRPUE5ZekZHOWhrL0F3bUZO?=
 =?utf-8?B?R0pPcDlEa21hQUIrVHR0aVpVTVBxZzFVMVpIb0licWV1WmlDMVBCeVJvTWRJ?=
 =?utf-8?B?bXVGV1I0bXBHYkJoVWxHQkoxQjBsbndqSGtOZzFHOFVEaXFZRDZmZGEyWVE1?=
 =?utf-8?B?QVdtUVJBMzBmUDZ3cDRLVkR6Y2ZsSW9KV1J3aWVUWTRVZTAyRGd1QmRoZy9E?=
 =?utf-8?B?ZUdlN0lpeWQrRlFBNktabTQ1bWU0SGZwV2k5anJXN3gzdFZRd3RaaVZrNDBq?=
 =?utf-8?B?RmpwNnZGelgzTE9IOXorblZZY2JUcGZiK1FhRUJzcjEwNmdRQndvK1BMVy9V?=
 =?utf-8?B?M042SDBpNkh1L3JPQnNSVnA4cXBwTHB2MzRyTlZpUGQxQ05TTXlJYzUrMTZE?=
 =?utf-8?B?RjFIOVd3YkMxRDVpTWlyVGZLdGxHbUwreDZyTUZmSmRmVUl5VlVFMVphOXE5?=
 =?utf-8?B?QXo5WG9JeWloTEFQKzF4RXA5akJrT1JiRFBuZ0xRY0s3a1d3UnZhWmN2OFdX?=
 =?utf-8?B?V2NCV0l1eXNFNW11eDFPd0xyTEdHaDh4cXpyc1Q4dmt0aTZiamozV2wwd1Az?=
 =?utf-8?B?NTZJbHpzQmprL0lZYVB6RnI4eXJFMUgzcjFSMkJ1VkxqOEJ3dFUxYnIvNlZH?=
 =?utf-8?B?QzlrY2R6VjF4L3ZCOGZnSmEvdkRVYmxpWkZzT3hpUFpQVmVRSVpTdmY4aUp0?=
 =?utf-8?B?bS8wWnY3ZUhUV0ZicEUzcjI0ZVFOSnJRQjFxVktvczc2MWhRQVFwTmtxVWZk?=
 =?utf-8?B?MTdrYlN3YlYxZzFkQThaS0ZvN0EwV1QyUHBJaHFCbEovNjlJMlNYeGJzbHR6?=
 =?utf-8?B?dzl6VlU5NHRuekRXdFVONzdVSTZLU2pzcG5rRTl1SjZwS1dDNFFaSnJna3NL?=
 =?utf-8?B?ZDZ1dDZjZTMxOWVjYXkvZ3prbGlWM2t4cDZsTFhnWjkrelk3Z1Bja09FUG52?=
 =?utf-8?B?S0I2SGtDNDJHY2hvaDhjdDUyOEE5NzJObnhpNnNZc2tqaFp5MkNZNWZxYU56?=
 =?utf-8?B?Zk50WEVvQnN0aVFHd0pHYkpzTC9za3B0RWlBdHhLcGltb2d1YXB6MnU0b2NV?=
 =?utf-8?B?bVBFQnRoeHBnYm0wMjMzTnFqZTM3V085cTFqeEViT0lhbUo5bFdQU0w2STFM?=
 =?utf-8?B?UUxMVjE0RGZDbkRTU3pkVk5SNTcvcklwamNIZXE5dnZKUktPdUp6L3V4WEhB?=
 =?utf-8?B?bG9kWlZ4eERxdjZMbTNuVDBFK2gwMTZ0NDZ1U1ErcCt3Ky95TWFrV1Q4RWN3?=
 =?utf-8?B?QmpLUWVHL21vWkZPTnJVSjBJVWhLMFdjK1FtbmNvaXIwb3ErRXRUcXJNYnJ1?=
 =?utf-8?B?OTluK3lHOCtick5uSjJnK2xWL25WbGFTalQzS2Y3dVNCR0FzZWpkaGE5cHh0?=
 =?utf-8?B?cE9oVUxNdjBUcEFmcHptMHZ0WEdTVWQ5UWJUNTlSTHlVWUtJVTU0M2xWSUt0?=
 =?utf-8?B?ZENSOVN4Z0FsTTVyS2ZKdTArWDBEYy8wWkwxL1p0VVIwRTVpOXJXdXBoUm9X?=
 =?utf-8?B?VDd2ZXhZbFlkNWt3ZXF3M3VHdm0xV3BCY25tU0pFL2IzalJwN0RmNlRIRHNG?=
 =?utf-8?B?VkZuZ29NNVV1cEo0anVhQVM5TjduclZwNHUzT2VRRG1teDJPL2ZMNWptSkxP?=
 =?utf-8?B?Z0wrWS92bCtrSy9UaDZZUkdaZTg1eFZsKzZOcVBKTW1aK24rQS9rMzN0aERk?=
 =?utf-8?B?a2pXSkNmWXZxdjRwZFJjL2lMdlQxZUgvQ0FSRUlXa053N1hmSlh1aTlTcStK?=
 =?utf-8?B?MGc3SHVQTHBnTk1Rb3RIQ1V5YXhqYVRWWWsxU2VJYUdEWFI5MURnMXovQ3Fq?=
 =?utf-8?B?VlJJczJtWEMrSmxOcUNDdWRBMG1yMnFKeFRjNnVTclZNbXBFVFovYzZjSlAz?=
 =?utf-8?B?ckFabWcxbkROVWxNNlpBSGZwMHZVK0hvc2dPN2lDbEFlWDB2Vks1ODIvMmUy?=
 =?utf-8?B?eFFMZnFVRjk3UHZqdVR4enRYVllhb2gwVnhZQmRPMDRkVEJRc2lYMTRkcGNE?=
 =?utf-8?B?TlZUN1A1Vlg4RjU3REprZDZtTVhMd2Foam5vaTdySzZaV2l0dGtQTGZzSWEw?=
 =?utf-8?B?THlBQmc1aFhvc056VkhTMnUvd1J6Y2Uwc1ZFQW9rZ1BLZ0c1WndSY21hR0U4?=
 =?utf-8?B?blVYdTdjSmlHNkZETGE3amdLM3c1Zm5YSFZyaDlnUnhMR0MvRHZuTDdDUVBZ?=
 =?utf-8?B?UE1WWjlLK3FsYkdFaENOZjdCWExCQWFtQmMvaE81Y1dvd2JQczdrMk1nb1Jq?=
 =?utf-8?B?eE0zWVY0dmJpVm1ZMEpzeEtDNmxQNU1Pa0RSTlNTdjRlS2hRa2JhQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC083524A4E8BF48B68D03E60EFA0D84@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef655c3-f9fd-4667-7608-08d9ea395508
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 12:57:00.9351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ifow1ic9dqnlq0yukzq+s+YMku1ruFMusRz3Whlf9zliJVSFePT+WZJMStwxBHAKSvSpaIlyvFKUnOXU+0KAzOg1cyKyen/pVZd/dyjjAieUT5FAip7VadUs050dUam
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7213
X-Proofpoint-GUID: nHxzycjJgjo-_NE9ysea566s9V9936rc
X-Proofpoint-ORIG-GUID: nHxzycjJgjo-_NE9ysea566s9V9936rc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_04,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 mlxlogscore=670 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070083

DQoNCk9uIDA3LjAyLjIyIDE0OjM0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDcuMDIuMjAy
MiAxMjowOCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiAxLiB2cGNpX3tyZWFk
fHdyaXRlfSBhcmUgbm90IHByb3RlY3RlZCB3aXRoIHBjaWRldnNfbG9jayBhbmQgY2FuIHJ1biBp
bg0KPj4gcGFyYWxsZWwgd2l0aCBwY2lfcmVtb3ZlX2RldmljZSB3aGljaCBjYW4gcmVtb3ZlIHBk
ZXYgYWZ0ZXIgdnBjaV97cmVhZHx3cml0ZX0NCj4+IGFjcXVpcmVkIHRoZSBwZGV2IHBvaW50ZXIu
IFRoaXMgbWF5IGxlYWQgdG8gYSBmYWlsIGR1ZSB0byBwZGV2IGRlcmVmZXJlbmNlLg0KPj4NCj4+
IFNvLCB0byBwcm90ZWN0IHBkZXYgZGVyZWZlcmVuY2UgdnBjaV97cmVhZHx3cml0ZX0gbXVzdCBh
bHNvIHVzZSBwZGV2c19sb2NrLg0KPiBJIHRoaW5rIHRoaXMgaXMgbm90IHRoZSBvbmx5IHBsYWNl
IHdoZXJlIHRoZXJlIGlzIGEgdGhlb3JldGljYWwgcmFjZQ0KPiBhZ2FpbnN0IHBjaV9yZW1vdmVf
ZGV2aWNlKCkuDQpOb3QgYXQgYWxsLCB0aGF0IHdhcyBqdXN0IHRvIGRlbW9uc3RyYXRlIG9uZSBv
ZiB0aGUgcG9zc2libGUgc291cmNlcyBvZiByYWNlcy4NCj4gICBJIHdvdWxkIHJlY29tbWVuZCB0
byBzZXBhcmF0ZSB0aGUNCj4gb3ZlcmFsbCBzaXR1YXRpb24gd2l0aCBwY2lkZXZzX2xvY2sgZnJv
bSB0aGUgaXNzdWUgaGVyZS4NCkRvIHlvdSBhZ3JlZSB0aGF0IHRoZXJlIGlzIGFscmVhZHkgYW4g
aXNzdWUgd2l0aCB0aGF0PyBJbiB0aGUgY3VycmVudGx5IGV4aXN0aW5nIGNvZGU/DQo+ICAgSSBk
b24ndCB2aWV3DQo+IGl0IGFzIGFuIG9wdGlvbiB0byBhY3F1aXJlIHBjaWRldnNfbG9jayBpbiB2
cGNpX3tyZWFkLHdyaXRlfSgpLg0KWWVzLCB0aGF0IHdvdWxkIGh1cnQgdG9vIG11Y2gsIEkgYWdy
ZWUuIEJ1dCB0aGlzIG5lZWRzIHRvIGJlIHNvbHZlZA0KPiAgIElmDQo+IGFueXRoaW5nLCB3ZSBu
ZWVkIHByb3BlciByZWZjb3VudGluZyBvZiBQQ0kgZGV2aWNlcyAoYXQgd2hpY2ggcG9pbnQNCj4g
bGlrZWx5IGEgbnVtYmVyIG9mIGxvY2sgdXNlcyBjYW4gZ28gYXdheSkuDQpJdCBzZWVtcyBzby4g
VGhlbiBub3Qgb25seSBwZGV2J3MgbmVlZCByZWZjb3VudGluZywgYnV0IHBkZXYtPnZwY2kgYXMg
d2VsbA0KDQpXaGF0J3MgeW91ciB2aWV3IG9uIGhvdyBjYW4gd2UgYWNoaWV2ZSBib3RoIGdvYWxz
Pw0KcGRldiBhbmQgcGRldi0+dnBjaSBhbmQgbG9ja2luZy9yZWZjb3VudGluZw0KVGhpcyBpcyBy
ZWFsbHkgY3J1Y2lhbCBmb3IgYWxsIHRoZSBjb2RlIGZvciBQQ0kgcGFzc3Rocm91Z2ggb24gQXJt
IGJlY2F1c2UNCndpdGhvdXQgdGhpcyBncm91bmQgd29yayBkb25lIHdlIGNhbid0IGFjY2VwdCBh
bGwgdGhlIHBhdGNoZXMgd2hpY2ggcmVseQ0Kb24gdGhpczogdlBDSSBjaGFuZ2VzLCBNU0kvTVNJ
LVggZXRjLg0KPg0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

