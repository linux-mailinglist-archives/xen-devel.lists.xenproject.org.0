Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D65B94A41B5
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 12:05:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262956.455443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUUC-0004I6-RK; Mon, 31 Jan 2022 11:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262956.455443; Mon, 31 Jan 2022 11:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUUC-0004GH-O5; Mon, 31 Jan 2022 11:04:40 +0000
Received: by outflank-mailman (input) for mailman id 262956;
 Mon, 31 Jan 2022 11:04:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9o41=SP=epam.com=prvs=4030d24c28=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nEUUB-0004GB-DI
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 11:04:39 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94120eb6-8285-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 12:04:37 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20VAvqVg019369;
 Mon, 31 Jan 2022 11:04:33 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3dx7wu1cg7-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 11:04:33 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR03MB3072.eurprd03.prod.outlook.com (2603:10a6:802:2d::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 11:04:30 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 11:04:29 +0000
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
X-Inumbo-ID: 94120eb6-8285-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSEF1TrXwJO7J8LcTn6+zufAEygmwFVg8nB3rD6HjCvCWdNZIUhcxhancTXc6kV7XiWKWUf7e7fFPESP1XSxS2y7GwWTWfVSyOTf/qVR0TZ4jAITcKO6Isc0MPwYcd1qXQT9gFP7NP5ZcN+PSJNEycNmlJZc+7hBNUHzJgHazXYvNYb4/yjvYwAHGNgQd5arVqxx1QaKeC5iS7r9GlU/4jjFUhQDRfgSv8sAwW+1LUmx+wqZZ6dBA2YsZIyMvVcQ10Qn4HbNugy5HrGa4OYgpKUNcLDCpmz74B1EHwymLVB3Q/D2JLSJxmq68vKtcDQ0aqRimBKk/jbpo3j9VyGFMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GV6hcn/V+SP1tXURWiCpLqhF4V1XAc2YeHOg2UjwgFM=;
 b=WKBv/yQdXrB6iG1QC54GxskONSwbsSgQb2tqc3i7+F6Sk0wIp8633Oyyd6ra2uR13tbzvKuGYJAuB+PujhWCFS2BjcRSN9NpFY0MsU0lhxoHfzuji7PxZgzPRKGPMd/NzXuSsZJ64HOYOt9FwVa+ZVxdnRlgeEiR1L7/84iNEJ0No5mW2SI+JUt/VCefhtJsHLRYbFk7ghPs1PEBiyVWj7E+K9MJLfkWU4G94J5RfuZCk4rYaHbNeWCyVVy4W7zpNbP+Y8w7OqCyuk1vkAtin6dh/c0Yhp6XHhaBW3q+8ZQs3PIaJu9aC+FwxZhiHIS3MK3PZkv1SNn5KS+Ii/gxJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GV6hcn/V+SP1tXURWiCpLqhF4V1XAc2YeHOg2UjwgFM=;
 b=baZN3jx3YVYxHR+/hFwVGeeuCrhY4UGy/VbfV3WCZL79SJaNVSm+vZ3+i94IwQ2fx5dsvyucla6zdTOkH7WXs+QjAj6seWFm9ooeY7MHpO6j5PWqVH60LylOj7+spvlpHNAImc22GKOVx9L5CjtqhlfjgsNEOkuMNgeaGtVGgQpWRD2/4sCNyR1gQjKGHROnHD9TsXgWCoyIMKmagPk9UVFjig2tK6XvQe5/e1NJPpXWNterY1kbshxJ0ef8Ia0M/UmpOb5FGdZxo2FSxO1poPrWrAr5AlkcN7SLTrCGZgyTGNh+LZfFJoPACZZVSOHTrWaHrofSXc4IdM27b1wAWw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
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
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHX4ewHyWAyD811HEGp8pIjUuVWNaxfndGAgB2tWgCAAA7+AIAAA9kAgAACyIA=
Date: Mon, 31 Jan 2022 11:04:29 +0000
Message-ID: <5de61dc5-0292-de1b-fad2-aa99d5351043@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd7K+9fvnBz+WTXA@Air-de-Roger>
 <77c00154-646c-a2a3-98cb-be4324003446@epam.com>
 <c7e87ebd-2c56-d510-b08b-02d53f9158d1@epam.com>
 <3db8d85e-4b9e-ed0c-5053-cc953c835efc@suse.com>
In-Reply-To: <3db8d85e-4b9e-ed0c-5053-cc953c835efc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a90ada00-49d0-4eef-4cb2-08d9e4a97422
x-ms-traffictypediagnostic: VI1PR03MB3072:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR03MB307283FDDAB393DDFA891A09E7259@VI1PR03MB3072.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 AtTHTdpfhbpo+PtDjh5q7otcRmIITVS/Yc/5ruf28h9KjEi2IB+BAOuV9Td8EFGRVew5HpnCasO3Y4zipK6U4qaQm/o7KpSBcJlHvVzcuZsdDBRS33eJMwDbf2RYrPvd0oY1Ka0Kim8dwn/o96isV9WyRSF5y6WCrOWMPp+yW2za7DnpiDd6ZdDMXOQRyQgs+6HVPPSo5Bt491ufO6cyzbHsNJQQko0+pldyyrSsV51cu2EDbO2YdcmnfyOiUHMSPkEgEvs2Cd+9A5B3b/6XO6NB6JymhWYLrALHheRCpx64eTzAvTtDhMz6xpbcV/F0f/QASB22N2lj+5xkAFahHUTCwcdZnR/J6i4Fa4ZPp+dIlMjrNOmbzpueyBD5nK4Qc1VvCAWbmvEjb4GtNjCjKHUdQMvxOtIsEIVN2fo8uxkV30qu8W1vOTaG5Zji91DYXI22bvzQ6+zyM8hEfXBsff2ZLE9CZJVLtwluHipqPE7LB9goqKGHl5yBnfgpTjRmZYXJoK7XkzEEAV2X6YPTD15r/Lii3LPn9tH1Z0wRLHwgxmtBhxXG4/KiCWrX9Q2KzobRAfx4bTfB7Z7PwJ6oXpp8Uw1YYrpeoOA0pWRGk7gjZyb+OqMv964yqoC3MWt2U3XFNI6OcSHvB6CAxdRf+Y7lHQVJa8E851l5q6+sTZK6SClgXzRikQBD7HD+X3VsJIPwghHWIyMV2XCY8TIGVADHjaxzJx8cZ2MxDb38nnWfiMG5AxofBUYPFtlcxNJb
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(86362001)(64756008)(66446008)(107886003)(83380400001)(7416002)(2906002)(4326008)(54906003)(2616005)(76116006)(5660300002)(66946007)(316002)(31686004)(66556008)(8676002)(6916009)(91956017)(8936002)(66476007)(31696002)(53546011)(6506007)(6512007)(71200400001)(6486002)(38070700005)(38100700002)(122000001)(26005)(186003)(508600001)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QnFqQkNoYWVadXM4bWx0MS8xWGFpZmxld0MzTlZmdWdjZVY3U09tOXpJYnBr?=
 =?utf-8?B?N3h1YXg5WlZmNzY5QktCRnp0UTY2VXZuYjlybU5RZ1dMYlRpa25FTHhUR3Bi?=
 =?utf-8?B?L09xblMxUTB1UTVwS1lsWnduZGx3L2xjQmswK3FIV0FiQTRqRy96YmJybFd4?=
 =?utf-8?B?c29nZ1hSMFUzb3hEcXk3bXNOazJZVlVwMFNUZ3oxcEJpU0pRdW94TjZLbS9t?=
 =?utf-8?B?bzRsSk5CcDVYT0FQckx6bHF4cEZMbHdKVGphdHhIeFlOVzlFbitWSlk2YmF6?=
 =?utf-8?B?VjZoQlVnV2pMNDBLV0dtL0hhWlNlWENvRzUxQkg5akIrMDhIclczYnVhZjky?=
 =?utf-8?B?dEFsVkJuUHVFNFkyb2VJdDdVeTlaRXNpTHdoM0NvNnJQbXFyN3FpUWtKSnVW?=
 =?utf-8?B?ZWdiNmJMVEhvcGdGOHdvNHRpTXhGeHdWbTl3MFpiNkJGcWNBZ3NaekVld0tK?=
 =?utf-8?B?ckZYRHpRbDdrM3VPRzdMTUNsajFXT055N3JKSnJZaS9MaG11M3hjZlRFMUZy?=
 =?utf-8?B?eUNxT0VBemZScDdqdWF0bysyeG1WU2dtdDRGNnNQc1ZvU2VaMzNONHZ5RVFx?=
 =?utf-8?B?MDEwTTFIZG1Fbmc0R1l1VFFOZm1qUlkzNHVmUEpLL3E2YXNUSXV5Qk5tc1BM?=
 =?utf-8?B?YWdzbzdTZjVMT1dTb1J6NmN5dG1YVlk2bkxxZmVsbkpFdWwxdmpFMHRieUdJ?=
 =?utf-8?B?c0wwRjdaQStKT2IyZUMyazJwNmlTV3B4Rnk1dnFTWUZBbGpFTnFLWUFjeEtC?=
 =?utf-8?B?b2hUTjJlSEI1MWdyOCt5MmFxa0hxZG9semgrakVLZHJ1cW1iQ3RtdUs3QjFG?=
 =?utf-8?B?aFg2Ukh1OHErdm5qeTVVTm96cVlaRE95aUpZSlhqZUtWMFlsdGt1NTI0K2Ur?=
 =?utf-8?B?UTZRRUhjSUdLblFnYnhVZ2dlUWhKWncrekhOVEZxYmFYTFREaTRiWEI5dnU3?=
 =?utf-8?B?TFpkcmZrMVN2S1F1WWtKYTJCYWZnUG96S0YvcitoM0d2WTJ3RFVjRlArdVM3?=
 =?utf-8?B?Y1dRbElNWTIvdU9kaC9QK3I4TnBTNWdRUk5oVXRpUU1qR1ZLM0lhY0QwcVIy?=
 =?utf-8?B?bzFTNXBsVHljcjJFQ2IvRWhVUXhNYVZzOFlrZzRZTE5yTGsweEp0VnJwT3E1?=
 =?utf-8?B?WmFzSWtmTEhOd0ZwOStGalRnR25zSnZTZjB3eUxJR3A3R0pRRTFRTVV4cnZ1?=
 =?utf-8?B?MjNKbVdaZXJ2azJLaFFicCt5Yy93U3dQUURXNVRVTXZKelByYnJ6MVlna3lz?=
 =?utf-8?B?YmFJZzlaYVVpOHFiYVRHS25BNmVDQVU0T2dZclZ4ak5xdWVJYVFFaHVVanRM?=
 =?utf-8?B?c2Q4YUVzQ1lCZ0FJM0RJRko1WlNPa0dsOHEyM2VRY0ZPTFhXNEhkcUV0UERL?=
 =?utf-8?B?UDBqTTI2NXR0dG8wdWZoMk1BMGw4S2JMbnovaHV6RmcvRlA1VENXRjZGb3lV?=
 =?utf-8?B?eE5JekJrNFRRclNnc2owSm1RUzFkcFY3clVpRk8xbHRJbFloS0ZjYlliRHRt?=
 =?utf-8?B?M1hNWC9YR3g4L2diOTUwZGF0aWduUGtzT3lBeitIV0Z3alFMVUZjTnZWbWZI?=
 =?utf-8?B?dStDU1BLb3hIeTQwOFRMMnduSG5pWE5KSzBEaUhVVC9pbUVNZE41K0NJdGJC?=
 =?utf-8?B?WldTQjFYWm9jdmJ0UFowRkw4VkdER0ZTZ25DWGZGN3B6bkJuRUlyajdYY0FM?=
 =?utf-8?B?dXVWRUhYY3RXREZldEczZ0FKaGlMTVVQeXBTbVJFQnlmU3RnbVA5Z0Y0aWRl?=
 =?utf-8?B?THJ0ZVFTNzJlSzZPbUtnQmZqckZQS2J5V01YaFd0UlNyOVBZdVBPRnczTXF1?=
 =?utf-8?B?N1JBMzd5YjNQVVNiUEhPaDNlMFlPYS9FTWdrdEF5MFg5ZUJvNXZpeHh4WGRt?=
 =?utf-8?B?bWFCUlhOWmRmV2dENzVTNmhYcWtZaEVqOXcydW9FdWl5emQxRmc1NG0rck5U?=
 =?utf-8?B?dzJxQ0gyczRZRmxuamM5V0xHZElhREJxYjlIMHdvMTJGbFhJVVRBUkhXRHM5?=
 =?utf-8?B?Y1RJMS9NMFhMNmdEd1c2MkdvQWxsSkt6MkRNTVNDYXBEQks2NEdxK3pOdDVP?=
 =?utf-8?B?N0xyYWhYdWNqOENnWHBhTHdxdk5IeUdJbiswK1hZY3d4dDhCWnFrM29OdTZG?=
 =?utf-8?B?R0tXOTZicVB1d0FUNzh2R0g0bklVZG1iOGhjSVNJK3dnTG40eXV4aUpLRDFN?=
 =?utf-8?B?Zk85M2FvOEtQd3R3L3FyMzdwUjdFdW9jc2p4ZEd4Z3B0MksvdGU0c1V3VXdY?=
 =?utf-8?B?ZHQ0WVFGNEFNbkxyNzA1eTVRYWRLNFpQTnNwT0VGaWJxMWs5dDlhbEJzT2h2?=
 =?utf-8?B?cWJ2aU16MzQrS0VkZk5Kc0RTTDBYUi91V0FXdHg1UzlBZ0kzL09mUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A486BD27C646504996B3B8E0E3F1E944@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a90ada00-49d0-4eef-4cb2-08d9e4a97422
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 11:04:29.7215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GIcgN1dEnklh4EMTJpsmYoOApwT/1FDJLrvQ2JvNlTNbG2Uu1NX3nlPHOIYjb+LG4p+Bh4prTwWts/aX857BSbNL7E1pYhVi5IX9cZFO7TB7DNdmUlWgbiaULI2g0gD7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3072
X-Proofpoint-ORIG-GUID: HUhuXenRO7hrJlik34loRb4wnwhV8k2a
X-Proofpoint-GUID: HUhuXenRO7hrJlik34loRb4wnwhV8k2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310075

SGksIEphbiENCg0KT24gMzEuMDEuMjIgMTI6NTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAz
MS4wMS4yMDIyIDExOjQwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IE9uIDMx
LjAxLjIyIDExOjQ3LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+PiBIaSwgUm9n
ZXIhDQo+Pj4NCj4+PiBPbiAxMi4wMS4yMiAxNDozNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4+Pj4+ICtzdGF0aWMgdm9pZCBndWVzdF9yb21fd3JpdGUoY29uc3Qgc3RydWN0IHBjaV9kZXYg
KnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQo+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVpbnQzMl90IHZhbCwgdm9pZCAqZGF0YSkNCj4+Pj4+ICt7DQo+Pj4+PiArfQ0KPj4+Pj4g
Kw0KPj4+Pj4gK3N0YXRpYyB1aW50MzJfdCBndWVzdF9yb21fcmVhZChjb25zdCBzdHJ1Y3QgcGNp
X2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdm9pZCAqZGF0YSkNCj4+Pj4+ICt7DQo+Pj4+PiArICAgIHJldHVybiAweGZm
ZmZmZmZmOw0KPj4+Pj4gK30NCj4+Pj4gVGhlcmUgc2hvdWxkIGJlIG5vIG5lZWQgZm9yIHRob3Nl
IGhhbmRsZXJzLiBBcyBzYWlkIGVsc2V3aGVyZTogZm9yDQo+Pj4+IGd1ZXN0cyByZWdpc3RlcnMg
bm90IGV4cGxpY2l0bHkgaGFuZGxlZCBzaG91bGQgcmV0dXJuIH4wIGZvciByZWFkcyBhbmQNCj4+
Pj4gZHJvcCB3cml0ZXMsIHdoaWNoIGlzIHdoYXQgeW91IGFyZSBwcm9wb3NpbmcgaGVyZS4NCj4+
PiBZZXMsIHlvdSBhcmUgcmlnaHQ6IEkgY2FuIHNlZSBpbiB2cGNpX3JlYWQgdGhhdCB3ZSBlbmQg
dXAgcmVhZGluZyB+MCBpZiBubw0KPj4+IGhhbmRsZXIgZXhpc3RzICh3aGljaCBpcyB3aGF0IEkg
ZG8gaGVyZSB3aXRoIGd1ZXN0X3JvbV9yZWFkKS4gQnV0IEkgYW0gbm90IHRoYXQNCj4+PiBzdXJl
IGFib3V0IHRoZSBkcm9wcGVkIHdyaXRlczoNCj4+Pg0KPj4+IHZvaWQgdnBjaV93cml0ZShwY2lf
c2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcsIHVuc2lnbmVkIGludCBzaXplLA0KPj4+ICAg
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50MzJfdCBkYXRhKQ0KPj4+IHsNCj4+
PiAgICDCoMKgwqAgdW5zaWduZWQgaW50IGRhdGFfb2Zmc2V0ID0gMDsNCj4+Pg0KPj4+IFtzbmlw
XQ0KPj4+DQo+Pj4gICAgwqDCoMKgIGlmICggZGF0YV9vZmZzZXQgPCBzaXplICkNCj4+PiAgICDC
oMKgwqDCoMKgwqDCoCAvKiBUYWlsaW5nIGdhcCwgd3JpdGUgdGhlIHJlbWFpbmluZy4gKi8NCj4+
PiAgICDCoMKgwqDCoMKgwqDCoCB2cGNpX3dyaXRlX2h3KHNiZGYsIHJlZyArIGRhdGFfb2Zmc2V0
LCBzaXplIC0gZGF0YV9vZmZzZXQsDQo+Pj4gICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGRhdGEgPj4gKGRhdGFfb2Zmc2V0ICogOCkpOw0KPj4+DQo+Pj4gc28g
aXQgbG9va3MgbGlrZSBmb3IgdGhlIHVuLWhhbmRsZWQgd3JpdGVzIHdlIHN0aWxsIHJlYWNoIHRo
ZSBIVyByZWdpc3Rlci4NCj4+PiBDb3VsZCB5b3UgcGxlYXNlIHRlbGwgaWYgdGhlIGNvZGUgYWJv
dmUgbmVlZHMgaW1wcm92ZW1lbnQgKGxpa2UgY2hlY2tpbmcNCj4+PiBpZiB0aGUgd3JpdGUgd2Fz
IGhhbmRsZWQpIG9yIEkgc3RpbGwgbmVlZCB0byBwcm92aWRlIGEgd3JpdGUgaGFuZGxlciwgZS5n
Lg0KPj4+IGd1ZXN0X3JvbV93cml0ZSBoZXJlPw0KPj4gSG0sIGJ1dCB0aGUgc2FtZSBhcHBsaWVz
IHRvIHRoZSByZWFkcyBhcyB3ZWxsLi4uIEFuZCB0aGlzIGlzIG5vIHN1cnByaXNlLA0KPj4gYXMg
Zm9yIHRoZSBndWVzdHMgSSBjYW4gc2VlIHRoYXQgaXQgYWNjZXNzZXMgYWxsIHRoZSBjb25maWd1
cmF0aW9uIHNwYWNlDQo+PiByZWdpc3RlcnMgdGhhdCBJIGRvbid0IGhhbmRsZS4gV2l0aG91dCB0
aGF0IEkgd291bGQgaGF2ZSBndWVzdHMgdW5hYmxlDQo+PiB0byBwcm9wZXJseSBzZXR1cCBhIFBD
SSBkZXZpY2UgYmVpbmcgcGFzc2VkIHRocm91Z2guLi4gQW5kIHRoaXMgaXMgd2h5DQo+PiBJIGhh
dmUgYSBiaWcgVE9ETyBpbiB0aGlzIHNlcmllcyBkZXNjcmliaW5nIHVuaGFuZGxlZCByZWdpc3Rl
cnMuDQo+PiBTbywgaXQgc2VlbXMgdGhhdCBJIGRvIG5lZWQgdG8gcHJvdmlkZSB0aG9zZSBoYW5k
bGVycyB3aGljaCBJIG5lZWQgdG8NCj4+IGRyb3Agd3JpdGVzIGFuZCByZXR1cm4gfjAgb24gcmVh
ZHMuDQpSZXBseWluZyB0byBteXNlbGY6IGl0IGlzIHN0aWxsIHBvc3NpYmxlIHRvIGhhdmUgdnBj
aV9pZ25vcmVkX3tyZWFkfHdyaXRlfQ0KdG8gaGFuZGxlIGRlZmF1bHRzIGlmLCB3aGVuIHZwY2lf
YWRkX3JlZ2lzdGVyIGlzIGNhbGxlZCwgdGhlIGhhbmRsZXINCnByb3ZpZGVkIGlzIE5VTEwNCj4g
SXQgZmVlbHMgbGlrZSB3ZSBoYWQgYmVlbiB0aGVyZSBiZWZvcmU6IEZvciB5b3VyIGluaXRpYWwg
cHVycG9zZXMgaXQgbWF5DQo+IGJlIGZpbmUgdG8gZG8gYXMgeW91IHN1Z2dlc3QsIGJ1dCBhbnkg
c3VjaCBwYXRjaGVzIHNob3VsZCBjYXJyeSBSRkMgdGFncw0KPiBvciBhbGlrZSB0byBpbmRpY2F0
ZSB0aGV5J3JlIG5vdCBjb25zaWRlcmVkIHJlYWR5LiBPbmNlIHlvdSdyZSBhaW1pbmcNCj4gZm9y
IHRoaW5ncyB0byBnbyBpbiwgSSB0aGluayB0aGVyZSdzIG5vIGdvb2Qgd2F5IGFyb3VuZCB3aGl0
ZS1saXN0aW5nDQo+IHdoYXQgZ3Vlc3RzIG1heSBhY2Nlc3MuIFlvdSBtYXkga25vdyB0aGF0IHdl
J3ZlIGJlZW4gYml0dGVuIGJ5IHN0YXJ0aW5nDQo+IG91dCB3aXRoIGJsYWNrLWxpc3RpbmcgaW4g
dGhlIHBhc3QsIGZpcnN0IGFuZCBmb3JlbW9zdCB3aXRoIHg4NidlcyBNU1JzLg0KSSBhbHJlYWR5
IGhhdmUgYSBiaWcgVE9ETyBwYXRjaCBkZXNjcmliaW5nIHRoZSBpc3N1ZS4gRG8geW91IHdhbnQN
Cml0IHRvIGhhdmUgYSBsaXN0IG9mIGhhbmRsZXJzIHRoYXQgd2Ugc3VwcG9ydCBhcyBvZiBub3c/
IFdoYXQgc29ydCBvZg0Kd2hpbGUvYmxhY2sgbGlzdCB3b3VsZCB5b3UgZXhwZWN0Pw0KSSBkbyB1
bmRlcnN0YW5kIHRoYXQgd2UgZG8gbmVlZCBwcm9wZXIgaGFuZGxpbmcgZm9yIGFsbCB0aGUgUENJ
IHJlZ2lzdGVycw0KYW5kIGNhcGFiaWxpdGllcyBsb25nIHRlcm0sIGJ1dCB0aGlzIGNhbid0IGJl
IGRvbmUgYXQgdGhlIG1vbWVudCB3aGVuDQp3ZSBoYXZlIG5vdGhpbmcgd29ya2luZyBhdCBhbGwu
IFJlcXVlc3RpbmcgcHJvcGVyIGhhbmRsaW5nIG5vdyB3aWxsDQp0dXJuIHRoaXMgc2VyaWVzIGlu
dG8gYSBodWdlIGFtb3VudCBvZiBjb2RlIGFuZCB1bmRlZmluZWQgdGltZSBmcmFtZS4NCj4NCj4g
SmFuDQo+DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

