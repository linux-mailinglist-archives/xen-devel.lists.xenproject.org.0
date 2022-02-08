Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 346474AD5D9
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 11:52:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268145.461942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHO6v-0006Zk-CM; Tue, 08 Feb 2022 10:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268145.461942; Tue, 08 Feb 2022 10:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHO6v-0006X9-7e; Tue, 08 Feb 2022 10:52:37 +0000
Received: by outflank-mailman (input) for mailman id 268145;
 Tue, 08 Feb 2022 10:52:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHO6t-0006UC-Md
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 10:52:35 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37edfa71-88cd-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 11:52:34 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2189EAPR015894;
 Tue, 8 Feb 2022 10:52:30 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3nq28f5s-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 10:52:29 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB7PR03MB4585.eurprd03.prod.outlook.com (2603:10a6:10:1e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 10:52:22 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 10:52:22 +0000
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
X-Inumbo-ID: 37edfa71-88cd-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXOwJ3wKHU0E1wI13LklGynN59Fq6GRxhG5jeHNT8CEKf6xophhfNEnPdzO5z/vbM/jAhEexVTQjU3tey89Yai44d2r4oFOJQgfMjIx7wJ16zqTnbXwTJnkix/ST+Riv9R166BpHi8lm6Ta5NTjcTTn9c5ag/COhzHW6zMYY8kfFlCqVwFW2OnFleJaV04hGn5deSxU3LWWMHArg/9fBFGGwlKuv6UsgVVoG9ye3Hg1EgHpVKZ1P6lstiAFLqxXAa3bxMVaaAxmW7onv/HGIzlevaHnueiSb/LcMd37bq4GvV9YwH9VifL7dX2URMIlj9NqON2vm1pvcE1E+nxR7EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9SZfZxGTTty1EpuGtyOLVp5vR8yWfkL0Fvzux6fbUM=;
 b=npjTR5vgDI8ca6A2AWItVJk2RQtTetiP11797ggJAdZ5WMFHJZ2TkBfTMWYckFbgtTdwRr8QhlixrgHp4rfSk7jNQKYHi4ZMUZvmcTpoheFbasP8N74vTu+TWlizg3zu+vJrVkBiqp6ooz6F+BrINaHft9XzW9QPi9hQn6vEipCnhCjILFWORKNG1cJ/jWa7+QSwwSSl9INLHTlZ9qYtsQK+lGf4KJ/bYfdkaF3pasoQX3MhDmp4ByrtKLwoJbi6/mKdiBuZ5S/L5IZLwFxAhMAAphhLViiU0FugysVGXjCoAXYZTWTxDj+DBD254cuONKfLqPc25h6aBeZjmdGQDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9SZfZxGTTty1EpuGtyOLVp5vR8yWfkL0Fvzux6fbUM=;
 b=FCB1obXX4lEU+xGaapgq9g9Ic2WmNzJfyZZgTtuY7Wul3JQenJitIp4uxGD2q/dkiof2FNoVJ4xz+inkOchH0XZ8EUp24lcBJv7IrrhTcNflSIPDVBTkrO+3uGGHQ7pSkBl2hcQsI1H6MTMlDZHKdjVJIM2XLRHyzSiqQGgp4emmf6zD4UYa7H1371biyxs0jzmUelspZ6a8rzlAXcnpVe9n6zPr4y5S4rB+xZZprLE4+hSnbNxRAizWwC/GzLMGvGkH9S1zp3dqKqf+8lnVY69rh+dDsz6PXV9zodcZa5AbqVoP8rSzrKi49d9oeI3Y6HG2XCgMg+2AWwkphboqPg==
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
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 05/13] vpci: add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v6 05/13] vpci: add hooks for PCI device assign/de-assign
Thread-Index: 
 AQHYGZFdYv4W1RdbQkeQtzN+PyKqmqyITGQAgAENNICAAAt2AIAAA+uAgAAEsACAAAMyAIAABAgAgAADmACAAAHqgIAABl2A
Date: Tue, 8 Feb 2022 10:52:22 +0000
Message-ID: <15022045-bc92-e3df-b005-aeec5e36a078@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-6-andr2000@gmail.com>
 <16cea1df-3d0f-d404-2b88-aab47ad5548b@suse.com>
 <3fe6dbe3-51c6-f87f-23f9-cf2e1a924326@epam.com>
 <582ee8f9-7b01-4adc-6a8a-ce8b1dffd534@suse.com>
 <e225553b-b29c-0448-fb9f-f8b513d9f77d@epam.com>
 <0fd8a0ac-dc91-287e-536e-1684892837ab@suse.com>
 <9f58a8ff-44b4-3249-5858-9988644b2d4e@epam.com>
 <15c16171-f196-38d2-370c-38627935a21b@suse.com>
 <20762939-6b7e-ff60-7c1a-d47c4767ff4f@epam.com>
 <10cd89b5-a804-3354-26d8-bc271bd9c5e6@suse.com>
In-Reply-To: <10cd89b5-a804-3354-26d8-bc271bd9c5e6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0456b45d-b442-4ead-fc5e-08d9eaf115d2
x-ms-traffictypediagnostic: DB7PR03MB4585:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB4585C35A207D2D7A4F219BFFE72D9@DB7PR03MB4585.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 HjH/zP8uIo3J+lwqb9Cmku4u8Ws3jnbAIdnXnU9rCvzGUL85gHgwP++aoSyv3Ano7WO7Fp3MuOdwe0auIY2S4Vk6m0pW4fm9DamhT5nVKX6rJSnHWEzs49gqpqcdsw3FhhCO/B1cYBpXjORA0tIC/jw0RueGHqPtHBZkuC4NdHiBpRmkdY5HjHe2+f8m5UZvxEhUJJsMbRnmKyiUmB8EXkrLEmvOZPeB7XvINDqWyWhTZ/HK/VAIddM5zZVe7QT9OjB3BoESUwKqMGCPcEbuwHrFYo0wlAdAq6+YayTypePiI3Lz9xNOW7yMeXoepEJ6WfjfUlPh3KUdj/qVU//uuxJYFHdKjI1OvIawuP7dwNmRbsX/XoVo9V6idlHmr2xr56jzIY4betFChVDPYU6o8tL0srs3LR+274W+3IEczV0RlCZ1BV5NMM//NtoSEw4J6/hBSckviwNKBEi5rv0yW7OFwDIV2odHdd8LInHN4FC6w+3O3gYBwFoTpXT6SUkgtxiys4dCEaEsLZYeY4rIumgsihAtcIQyCDjRgYajXPmyrNVU19N2emi+SlZfF6AkSmIitLArPcinvP5FvnwVlwTtc7He9/yHdGIJ+RaC6e2JWjCcUi4ElUKm92ITIU8lZ66R5R7JqBISIqmXb2aAXWaZbBgQZVbhsZnbH2goagAi1ZpBelwYjFo0s8CY+n2wwlwFzu7yA4/12QFk5A5xKUrXQ5VknzwQHjfzxSXZkl36g3kXIRJxecsTbzXataJv
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(55236004)(36756003)(26005)(508600001)(38100700002)(38070700005)(6512007)(31686004)(31696002)(6506007)(71200400001)(186003)(86362001)(54906003)(6916009)(83380400001)(316002)(107886003)(53546011)(64756008)(8936002)(66946007)(8676002)(91956017)(66556008)(66476007)(6486002)(122000001)(2906002)(7416002)(5660300002)(76116006)(4326008)(66446008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cjQwZzYxRC92ZmpKQnhxUUJ6MEFWaUw4aDFQUzIxUXNEb3Q5ODhTR0thMUIy?=
 =?utf-8?B?YzkrdXltU2llanArdmFocVZWTUdLRUlETFRXK2QrZE9sMy9SdGZxdEZYQVpm?=
 =?utf-8?B?VTdiTEVsbUhlV0RpN0t3QmtaYmFzeXhMT0o3L3puZG1CZWZ6bWZpa2I4RE9W?=
 =?utf-8?B?bFRjSkU3YzU4SE1peXNWWUJUWk54T0FzODdzRm9qNzZSNFJRMjg5U3ZVNGVa?=
 =?utf-8?B?YlZTcDVxRjRoNmZUVFVqaDYya1RGY3BEMmlTZyt1SU9QR2d0K2t4ZnhjenBq?=
 =?utf-8?B?OFQ1eno4MkV4UEVIOUp5aVhEc1ZQNUZoeitBdjJ6b2gvTE54YWwyWEJUTjh2?=
 =?utf-8?B?cy81QlRhbVF3YThXdjVtc2RnS3hqc1JxSWNuVkd5S284Q2tvejRnWk9zdUdO?=
 =?utf-8?B?aTVocEtEdm5OcFZvQ0Qva1FKR0hzNkl3S2dVa0Y4SVZHM2U3VnlZd21qL210?=
 =?utf-8?B?eTlNUVBKRjhVRGU3V25CUWl6RE9Lang0emNKeEZLZ3RoWTFNVE96eTNVQ0Fw?=
 =?utf-8?B?K0tKTzhzZEplZldmVnNVNktmQzN5UGxxL2ljbXVySmRoUGpnWStzdXlXNTJu?=
 =?utf-8?B?SWVGNFhhTGRXODZyMXlKYVJva09nalJUSE9FbGx1L2RHcXRUQ0ZOeFdwaFhz?=
 =?utf-8?B?elowaWIydnZnc3pzRlFNSGx3M0lWT2U3aGRNcnBVQUtUSE9abzlPTkF1UmxW?=
 =?utf-8?B?d2V2cEtudFJJQnNkRUNYb1ViZFRsSm81M1BXSHc4cGJSMGhKR2VTd3AzWWkv?=
 =?utf-8?B?V3hWc2wycFVkbElhc2RORTRSVUpZUW5LZmR6emV5b3JVTDErR1JpTGhQWnBv?=
 =?utf-8?B?T3dWbG1KZXA2aU1iSTQ0MXFhbktDN0M2RnhzZldJTGVVN0dNeFZ2NUwxV2c4?=
 =?utf-8?B?RmYyc0l0M2ZWNy9HaUd0V21KQW1KWTZLenBXUzZZUGpVdGlJVXNaU1RvWDlY?=
 =?utf-8?B?bTNnZGNPWFIwS1gyZzBBVUR5bnNsVDVIb1owbVFWdk1JYTJXdWcxMEZlVXBD?=
 =?utf-8?B?RC9xVEFPMWpxSFE4L01wNHZ1dmhCdFVzc1pwNnFNVEdKeDErRHF2TDNhUU1p?=
 =?utf-8?B?RiswUk5YTlBJK29vRUFUQ0cvUkl3N1pwWXkzNE91VGs5TllodVhZSnZHZVJn?=
 =?utf-8?B?Q01vbk0xeHB6T3FEOWVjbHhsTUVKakQwNXhlRU95VGo3aUUxNndkWHNyeTYv?=
 =?utf-8?B?ZjNrcmZXNTF0TkpReW1SeXZtVHllVjQxMnIrWElXTHpGMThBdFA0SUhhb3BI?=
 =?utf-8?B?Z2JqeFVOalVNVlVuc1MzQ0V2QjMzb0wvREQvdHJPY1B5UERhNkh3MVZhcWla?=
 =?utf-8?B?dm1LYUlmU2dGT3k3WUtyWE5mU3BHZVYwRU5zUW5PNGRhSU5FeFVodGY1NU5l?=
 =?utf-8?B?ZTVFck5Ma3lIQjIyUmtrSlBTeFU1SW1NcVA0UUljbE04TFhNWlFPaG45eGxH?=
 =?utf-8?B?c04rTmtCdVJ5TG55MTNHNjVvb01TamNYZ2IvbkFOVytvNFpTU2g3ZDBjaEV1?=
 =?utf-8?B?MFN5Y0dzMExGZEpnQzgzbk52eDRwbThsNW9Nemp2d0R4TGgya1p6T3dyUVNL?=
 =?utf-8?B?aFcxam5oc1VsZmZBZlh4TkpQU2pZS09BclhaK3NSYk5DVDA5NkhBOEp4b1R4?=
 =?utf-8?B?NFN3N1gySllyTXJ2aXVkR09DL254c3ppN2NvQisrYTdkYnRUV0J2d3c5eEd2?=
 =?utf-8?B?WHliQTB6N2V0K1ozWFUxcmpxbzlRSXRWaXdEYW55aXA0V0UrSHhZSjVsK00w?=
 =?utf-8?B?ODlpSVhtT1NTKzZ5YWllZDhuT2VUSGNvai9XTG1sakI3R1ZTTnYweG5wK0M2?=
 =?utf-8?B?a2g1QnQwNEg3NVJ3eThhSXJXc3RmZlJpMHk3ODgvOXRWZjRkeFY0VktkOGVi?=
 =?utf-8?B?blgzOWg4ejR6OGdyZXFFMC9NSUF4dGpFVTNPMmw0eFJqd1UzL3dtUThxTG85?=
 =?utf-8?B?TzE4Nkwrazd5REo0UHZSczRndUVLenNMV1dxRlVoVWxKaUdzeGc1NGo2eVVR?=
 =?utf-8?B?dGEvV1ZBcVdsbEN6WWtMWjVTNkhVdE16K3U4cndsTC9yemhncFE2cXpUejJk?=
 =?utf-8?B?Nml4ZWUya2VQeUFJd2hoNWJNaDhsN1djNVBhanA5MExscmRObjh6N3M0NjFQ?=
 =?utf-8?B?dlFkWHdIZlI2THl4ZVdxWjJ6Y0IzSzBKNldGVmp0OHlIcHNPVnVvTmRUNjZo?=
 =?utf-8?B?K2R2dWR2S2lGTkR3SkdaTmEzRnc2VDdLakg0T1NQak81L3F5V2sxaXhKU1la?=
 =?utf-8?B?eGE3WkZiT25WN010QnpKOXRxS1M3TWhjaVRxNENXV1A4eHRvM2UvRVJRZURx?=
 =?utf-8?B?R2JZcGx0eHArVytiK3JkcThjdzQ1LzNnVzZHOGFwdFJkU0xZUW5TZU5GczFi?=
 =?utf-8?Q?ySEMQveU4YlceJa0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7560D7732A8EBA45A000C84578642DC0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0456b45d-b442-4ead-fc5e-08d9eaf115d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 10:52:22.2396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HAIVv+t+Q6AYMilkirs1BDLCnDLfgByQVETR1IlRhz+LsgqQ+XJ9RDYeQyy1OWujlJu+9TH7/KeW+qtOFelobl1aaSMfxdYn0EAWMEnaiF7etglc4sVzivnLjpB+74pO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4585
X-Proofpoint-ORIG-GUID: dT7P-Lm6FLRc6h2UBmcL98tM6uHxb6fj
X-Proofpoint-GUID: dT7P-Lm6FLRc6h2UBmcL98tM6uHxb6fj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_03,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080064

DQoNCk9uIDA4LjAyLjIyIDEyOjI5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDguMDIuMjAy
MiAxMToyMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMDguMDIu
MjIgMTI6MDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA4LjAyLjIwMjIgMTA6NTUsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwOC4wMi4yMiAxMTo0NCwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAwOC4wMi4yMDIyIDEwOjI3LCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAwOC4wMi4yMiAxMToxMywgSmFuIEJldWxpY2gg
d3JvdGU6DQo+Pj4+Pj4+IE9uIDA4LjAyLjIwMjIgMDk6MzIsIE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIHdyb3RlOg0KPj4+Pj4+Pj4gT24gMDcuMDIuMjIgMTg6MjgsIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPj4+Pj4+Pj4+IE9uIDA0LjAyLjIwMjIgMDc6MzQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IHdyb3RlOg0KPj4+Pj4+Pj4+PiBAQCAtMTUwNyw2ICsxNTExLDggQEAgc3RhdGljIGludCBhc3Np
Z25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4sIHUz
MiBmbGFnKQ0KPj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwY2lfdG9f
ZGV2KHBkZXYpLCBmbGFnKTsNCj4+Pj4+Pj4+Pj4gICAgICAgICAgIH0NCj4+Pj4+Pj4+Pj4gICAg
ICAgDQo+Pj4+Pj4+Pj4+ICsgICAgcmMgPSB2cGNpX2Fzc2lnbl9kZXZpY2UoZCwgcGRldik7DQo+
Pj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+Pj4gICAgICAgIGRvbmU6DQo+Pj4+Pj4+Pj4+ICAgICAgICAg
ICBpZiAoIHJjICkNCj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICBwcmludGsoWEVOTE9HX0dfV0FS
TklORyAiJXBkOiBhc3NpZ24gKCVwcCkgZmFpbGVkICglZClcbiIsDQo+Pj4+Pj4+Pj4gVGhlcmUn
cyBubyBhdHRlbXB0IHRvIHVuZG8gYW55dGhpbmcgaW4gdGhlIGNhc2Ugb2YgZ2V0dGluZyBiYWNr
IGFuDQo+Pj4+Pj4+Pj4gZXJyb3IuIElTVFIgdGhpcyBiZWluZyBkZWVtZWQgb2theSBvbiB0aGUg
YmFzaXMgdGhhdCB0aGUgdG9vbCBzdGFjaw0KPj4+Pj4+Pj4+IHdvdWxkIHRoZW4gdGFrZSB3aGF0
ZXZlciBhY3Rpb24sIGJ1dCB3aGF0ZXZlciBpdCBpcyB0aGF0IGlzIHN1cHBvc2VkDQo+Pj4+Pj4+
Pj4gdG8gZGVhbCB3aXRoIGVycm9ycyBoZXJlIHdhbnRzIHNwZWxsaW5nIG91dCBpbiB0aGUgZGVz
Y3JpcHRpb24uDQo+Pj4+Pj4+PiBXaHk/IEkgZG9uJ3QgY2hhbmdlIHRoZSBwcmV2aW91c2x5IGV4
cGVjdGVkIGRlY2lzaW9uIGFuZCBpbXBsZW1lbnRhdGlvbg0KPj4+Pj4+Pj4gb2YgdGhlIGFzc2ln
bl9kZXZpY2UgZnVuY3Rpb246IEkgdXNlIGVycm9yIHBhdGhzIGFzIHRoZXkgd2VyZSB1c2VkIGJl
Zm9yZQ0KPj4+Pj4+Pj4gZm9yIHRoZSBleGlzdGluZyBjb2RlLiBTbywgSSBzZWUgbm8gY2xlYXIg
cmVhc29uIHRvIHN0cmVzcyB0aGF0IHRoZSBleGlzdGluZw0KPj4+Pj4+Pj4gYW5kIG5ldyBjb2Rl
IHJlbGllcyBvbiB0aGUgdG9vbHN0YWNrDQo+Pj4+Pj4+IFNheWluZyBoYWxmIGEgc2VudGVuY2Ug
b24gdGhpcyBpcyBoZWxwaW5nIHJldmlldy4NCj4+Pj4+PiBPaw0KPj4+Pj4+Pj4+IFdoYXQncyBp
bXBvcnRhbnQgaXMgdGhhdCBubyBjYWxsZXIgdXAgdGhlIGNhbGwgdHJlZSBtYXkgYmUgbGVmdCB3
aXRoDQo+Pj4+Pj4+Pj4gdGhlIGltcHJlc3Npb24gdGhhdCB0aGUgZGV2aWNlIGlzIHN0aWxsIG93
bmVkIGJ5IHRoZSBvcmlnaW5hbA0KPj4+Pj4+Pj4+IGRvbWFpbi4gV2l0aCBob3cgeW91IGhhdmUg
aXQsIHRoZSBkZXZpY2UgaXMgZ29pbmcgdG8gYmUgb3duZWQgYnkgdGhlDQo+Pj4+Pj4+Pj4gbmV3
IGRvbWFpbiwgYnV0IG5vdCByZWFsbHkgdXNhYmxlLg0KPj4+Pj4+Pj4gVGhpcyBpcyBub3QgdHJ1
ZTogdnBjaV9hc3NpZ25fZGV2aWNlIHdpbGwgY2FsbCB2cGNpX2RlYXNzaWduX2RldmljZQ0KPj4+
Pj4+Pj4gaW50ZXJuYWxseSBpZiBpdCBmYWlscy4gU28sIHRoZSBkZXZpY2Ugd29uJ3QgYmUgYXNz
aWduZWQgaW4gdGhpcyBjYXNlDQo+Pj4+Pj4+IE5vLiBUaGUgZGV2aWNlIGlzIGFzc2lnbmVkIHRv
IHdoYXRldmVyIHBkZXYtPmRvbWFpbiBob2xkcy4gQ2FsbGluZw0KPj4+Pj4+PiB2cGNpX2RlYXNz
aWduX2RldmljZSgpIHRoZXJlIG1lcmVseSBtYWtlcyBzdXJlIHRoYXQgdGhlIGRldmljZSB3aWxs
DQo+Pj4+Pj4+IGhhdmUgX25vXyB2UENJIGRhdGEgYW5kIGhvb2tzIGluIHBsYWNlLCByYXRoZXIg
dGhhbiBzb21ldGhpbmcNCj4+Pj4+Pj4gcGFydGlhbC4NCj4+Pj4+PiBTbywgdGhpcyBwYXRjaCBp
cyBvbmx5IGRlYWxpbmcgd2l0aCB2cGNpIGFzc2lnbi9kZS1hc3NpZ24NCj4+Pj4+PiBBbmQgaXQg
cm9sbHMgYmFjayB3aGF0IGl0IGRpZCBpbiBjYXNlIG9mIGEgZmFpbHVyZQ0KPj4+Pj4+IEl0IGFs
c28gcmV0dXJucyByYyBpbiBhc3NpZ25fZGV2aWNlIHRvIHNpZ25hbCBpdCBoYXMgZmFpbGVkDQo+
Pj4+Pj4gV2hhdCBlbHNlIGlzIGV4cGVjdGVkIGZyb20gdGhpcyBwYXRjaD8/DQo+Pj4+PiBVbnRp
bCBub3cgaWYgYXNzaWduX2RldmljZSgpIHJldHVybnMgYW4gZXJyb3IsIHRoaXMgdGVsbHMgdGhl
IGNhbGxlcg0KPj4+Pj4gdGhhdCB0aGUgZGV2aWNlIGRpZCBub3QgY2hhbmdlIG93bmVyc2hpcDsN
Cj4+Pj4gTm90IHN1cmUgdGhpcyBpcyB0aGUgY2FzZToNCj4+Pj4gICAgwqDCoMKgIGlmICggKHJj
ID0gaW9tbXVfY2FsbChoZC0+cGxhdGZvcm1fb3BzLCBhc3NpZ25fZGV2aWNlLCBkLCBkZXZmbiwN
Cj4+Pj4gICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcGNpX3RvX2RldihwZGV2KSwgZmxhZykpICkNCj4+Pj4gaW9tbXVfY2FsbCBjYW4gbGVhdmUg
dGhlIG5ldyBvd25lcnNoaXAgZXZlbiBub3cgd2l0aG91dA0KPj4+PiB2cGNpX2Fzc2lnbl9kZXZp
Y2UuDQo+Pj4gRGlkIHlvdSBjaGVjayB0aGUgYWN0dWFsIGhvb2sgZnVuY3Rpb25zIGZvciB3aGVu
IGV4YWN0bHkgdGhlIG93bmVyc2hpcA0KPj4+IGNoYW5nZSBoYXBwZW5zLiBGb3IgYm90aCBWVC1k
IGFuZCBBTUQgaXQgaXMgdGhlIGxhc3QgdGhpbmcgdGhleSBkbywNCj4+PiB3aGVuIG5vIGVycm9y
IGNhbiBvY2N1ciBhbnltb3JlLg0KPj4gVGhpcyBmdW5jdGlvbmFsaXR5IGRvZXMgbm90IGV4aXN0
IGZvciBBcm0geWV0LCBzbyB0aGlzIGlzIHVwIHRvIHRoZQ0KPj4gZnV0dXJlIHNlcmllcyB0byBh
ZGQgdGhhdC4NCj4+DQo+PiBXUlQgdG8gdGhlIGV4aXN0aW5nIGNvZGU6DQo+Pg0KPj4gc3RhdGlj
IGludCBhbWRfaW9tbXVfYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCB1OCBkZXZmbiwN
Cj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHBjaV9kZXYgKnBkZXYsDQo+PiAgIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHUzMiBmbGFnKQ0KPj4gew0KPj4gICDCoMKgwqAgaWYgKCAhcmMgKQ0KPj4gICDCoMKgwqDCoMKg
wqDCoCByYyA9IHJlYXNzaWduX2RldmljZShwZGV2LT5kb21haW4sIGQsIGRldmZuLCBwZGV2KTsg
PDw8PDwgdGhpcyB3aWxsIHNldCBwZGV2LT5kb21haW4NCj4+DQo+PiAgIMKgwqDCoCBpZiAoIHJj
ICYmICFpc19oYXJkd2FyZV9kb21haW4oZCkgKQ0KPj4gICDCoMKgwqAgew0KPj4gICDCoMKgwqDC
oMKgwqDCoCBpbnQgcmV0ID0gYW1kX2lvbW11X3Jlc2VydmVfZG9tYWluX3VuaXR5X3VubWFwKA0K
Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZCwgaXZyc19t
YXBwaW5nc1tyZXFfaWRdLnVuaXR5X21hcCk7DQo+Pg0KPj4gICDCoMKgwqDCoMKgwqDCoCBpZiAo
IHJldCApDQo+PiAgIMKgwqDCoMKgwqDCoMKgIHsNCj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBwcmludGsoWEVOTE9HX0VSUiAiQU1ELVZpOiAiDQo+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAidW5pdHktdW5tYXAgZm9yICVwZC8lMDR4OiUwMng6JTAyeC4ldSBm
YWlsZWQgKCVkKVxuIiwNCj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGQsIHBkZXYtPnNlZywgcGRldi0+YnVzLA0KPj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgUENJX1NMT1QoZGV2Zm4pLCBQQ0lfRlVOQyhkZXZmbiksIHJldCk7DQo+PiAg
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG9tYWluX2NyYXNoKGQpOw0KPj4gICDCoMKgwqDCoMKg
wqDCoCB9DQo+PiBTby4uLi4NCj4+DQo+PiBUaGlzIGlzIElNTyB3cm9uZyBpbiB0aGUgZmlyc3Qg
cGxhY2UgdG8gbGV0IElPTU1VIGNvZGUgYXNzaWduIHBkZXYtPmRvbWFpbi4NCj4+IFRoaXMgaXMg
c29tZXRoaW5nIHRoYXQgbmVlZHMgdG8gYmUgZG9uZSBieSB0aGUgUENJIGNvZGUgaXRzZWxmIGFu
ZA0KPj4gbm90IHJlbHlpbmcgb24gZWFjaCBJT01NVSBjYWxsYmFjayBpbXBsZW1lbnRhdGlvbg0K
Pj4+ICAgIE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGUgcm9sbC1iYWNrIGlzDQo+Pj4+IGV4
cGVjdGVkIHRvIGJlIHBlcmZvcm1lZCBieSB0aGUgdG9vbHN0YWNrIGFuZCB2cGNpX2Fzc2lnbl9k
ZXZpY2UNCj4+Pj4gZG9lc24ndCBwcmV2ZW50IHRoYXQgYnkgcmV0dXJuaW5nIHJjLiBFdmVuIG1v
cmUsIGJlZm9yZSB3ZSBkaXNjdXNzZWQNCj4+Pj4gdGhhdCBpdCB3b3VsZCBiZSBnb29kIGZvciB2
cGNpX2Fzc2lnbl9kZXZpY2UgdG8gdHJ5IHJlY292ZXJpbmcgZnJvbQ0KPj4+PiBhIHBvc3NpYmxl
IGVycm9yIGVhcmx5IHdoaWNoIGlzIGRvbmUgYnkgY2FsbGluZyB2cGNpX2RlYXNzaWduX2Rldmlj
ZQ0KPj4+PiBpbnRlcm5hbGx5Lg0KPj4+IFllcywgYnV0IHRoYXQncyBvbmx5IHBhcnQgb2YgaXQu
IEl0IGF0IGxlYXN0IG5lZWRzIGNvbnNpZGVyaW5nIHdoYXQNCj4+PiBlZmZlY3RzIGhhdmUgcmVz
dWx0ZWQgZnJvbSBvcGVyYXRpb25zIHByaW9yIHRvIHZwY2lfYXNzaWduX2RldmljZSgpLg0KPj4g
VGFraW5nIGludG8gYWNjb3VudCB0aGUgY29kZSBzbmlwcGV0IGFib3ZlOiB3aGF0IGlzIHlvdXIg
ZXhwZWN0YXRpb24NCj4+IGZyb20gdGhpcyBwYXRjaCB3aXRoIHRoaXMgcmVzcGVjdD8NCj4gWW91
IGRpZCBub3RlIHRoZSBkb21haW5fY3Jhc2goKSBpbiB0aGVyZSwgZGlkbid0IHlvdT8NCldoaWNo
IGlzIEFNRCBzcGVjaWZpYyBpbXBsZW1lbnRhdGlvbiB3aGljaCBjYW4gYmUgZGlmZmVyZW50IGZv
cg0Kb3RoZXIgSU9NTVVzLiBZZXMsIEkgZGlkLg0KPiBUaGUgc25pcHBldCBhYm92ZQ0KPiBzdGls
bCBtYXRjaGVzIHRoZSAiZGV2aWNlIG5vdCBhc3NpZ25lZCB0byBhbiBhbGl2ZSBEb21VIiBjcml0
ZXJpYSAod2hpY2gNCj4gY2FuIGJlIHRyYW5zbGF0ZWQgdG8gIm5vIGV4cG9zdXJlIG9mIGEgZGV2
aWNlIHRvIGFuIHVudHJ1c3RlZCBlbnRpdHkgaW4NCj4gY2FzZSBvZiBlcnJvciIpLiBTdWNoIGRv
bWFpbl9jcmFzaCgpIHVzZXMgYXJlbid0IG5pY2UsIGFuZCBJJ2QgcHJlZmVyIHRvDQo+IHNlZSB0
aGVtIGdvIGF3YXksIGJ1dCBzYWlkIHByb3BlcnR5IG5lZWRzIHRvIGJlIHJldGFpbmVkIHdpdGgg
YW55DQo+IGFsdGVybmF0aXZlIHNvbHV0aW9ucy4NClRoaXMgc21lbGxzIGxpa2Ugd2UgZmlyc3Qg
bmVlZCB0byBmaXggdGhlIGV4aXN0aW5nIGNvZGUsIHNvDQpwZGV2LT5kb21haW4gaXMgbm90IGFz
c2lnbmVkIGJ5IHNwZWNpZmljIElPTU1VIGltcGxlbWVudGF0aW9ucywNCmJ1dCBpbnN0ZWFkIGNv
bnRyb2xsZWQgYnkgdGhlIGNvZGUgd2hpY2ggcmVsaWVzIG9uIHRoYXQsIGFzc2lnbl9kZXZpY2Uu
DQoNCkkgY2FuIGhhdmUgc29tZXRoaW5nIGxpa2U6DQoNCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9wY2kuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQppbmRl
eCA4ODgzNmFhYjZiYWYuLmNjNzc5MDcwOWE1MCAxMDA2NDQNCi0tLSBhL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL3BjaS5jDQorKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KQEAg
LTE0NzUsNiArMTQ3NSw3IEBAIHN0YXRpYyBpbnQgZGV2aWNlX2Fzc2lnbmVkKHUxNiBzZWcsIHU4
IGJ1cywgdTggZGV2Zm4pDQogwqBzdGF0aWMgaW50IGFzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFp
biAqZCwgdTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbiwgdTMyIGZsYWcpDQogwqB7DQogwqDCoMKg
wqAgY29uc3Qgc3RydWN0IGRvbWFpbl9pb21tdSAqaGQgPSBkb21faW9tbXUoZCk7DQorwqDCoMKg
IHN0cnVjdCBkb21haW4gKm9sZF9vd25lcjsNCiDCoMKgwqDCoCBzdHJ1Y3QgcGNpX2RldiAqcGRl
djsNCiDCoMKgwqDCoCBpbnQgcmMgPSAwOw0KDQpAQCAtMTQ5MCw2ICsxNDkxLDkgQEAgc3RhdGlj
IGludCBhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywgdTgg
ZGV2Zm4sIHUzMiBmbGFnKQ0KIMKgwqDCoMKgIEFTU0VSVChwZGV2ICYmIChwZGV2LT5kb21haW4g
PT0gaGFyZHdhcmVfZG9tYWluIHx8DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBwZGV2LT5kb21haW4gPT0gZG9tX2lvKSk7DQoNCivCoMKgwqAgLyogV2UgbmVlZCB0
byByZXN0b3JlIHRoZSBvbGQgb3duZXIgaW4gY2FzZSBvZiBhbiBlcnJvci4gKi8NCivCoMKgwqAg
b2xkX293bmVyID0gcGRldi0+ZG9tYWluOw0KKw0KIMKgwqDCoMKgIHZwY2lfZGVhc3NpZ25fZGV2
aWNlKHBkZXYtPmRvbWFpbiwgcGRldik7DQoNCiDCoMKgwqDCoCByYyA9IHBkZXZfbXNpeF9hc3Np
Z24oZCwgcGRldik7DQpAQCAtMTUxNSw4ICsxNTE5LDEyIEBAIHN0YXRpYyBpbnQgYXNzaWduX2Rl
dmljZShzdHJ1Y3QgZG9tYWluICpkLCB1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLCB1MzIgZmxh
ZykNCg0KIMKgIGRvbmU6DQogwqDCoMKgwqAgaWYgKCByYyApDQorwqDCoMKgIHsNCiDCoMKgwqDC
oMKgwqDCoMKgIHByaW50ayhYRU5MT0dfR19XQVJOSU5HICIlcGQ6IGFzc2lnbiAoJXBwKSBmYWls
ZWQgKCVkKVxuIiwNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZCwgJlBDSV9TQkRG
MyhzZWcsIGJ1cywgZGV2Zm4pLCByYyk7DQorwqDCoMKgwqDCoMKgwqAgLyogV2UgZmFpbGVkIHRv
IGFzc2lnbiwgc28gcmVzdG9yZSB0aGUgcHJldmlvdXMgb3duZXIuICovDQorwqDCoMKgwqDCoMKg
wqAgcGRldi0+ZG9tYWluID0gb2xkX293bmVyOw0KK8KgwqDCoCB9DQogwqDCoMKgwqAgLyogVGhl
IGRldmljZSBpcyBhc3NpZ25lZCB0byBkb21faW8gc28gbWFyayBpdCBhcyBxdWFyYW50aW5lZCAq
Lw0KIMKgwqDCoMKgIGVsc2UgaWYgKCBkID09IGRvbV9pbyApDQogwqDCoMKgwqDCoMKgwqDCoCBw
ZGV2LT5xdWFyYW50aW5lID0gdHJ1ZTsNCg0KQnV0IEkgZG8gbm90IHRoaW5rIHRoaXMgYmVsb25n
cyB0byB0aGlzIHBhdGNoDQo+DQo+IEphbg0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

