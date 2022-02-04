Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7AD4A97E4
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 11:36:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265353.458703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFvwl-00045K-V7; Fri, 04 Feb 2022 10:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265353.458703; Fri, 04 Feb 2022 10:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFvwl-00042b-SA; Fri, 04 Feb 2022 10:36:07 +0000
Received: by outflank-mailman (input) for mailman id 265353;
 Fri, 04 Feb 2022 10:36:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+82=ST=epam.com=prvs=4034f0a382=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFvwk-00042V-Gj
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 10:36:06 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e5bf5d2-85a6-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 11:36:01 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2149uVbk021292;
 Fri, 4 Feb 2022 10:35:57 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e0w09s182-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 10:35:56 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM6PR03MB4279.eurprd03.prod.outlook.com (2603:10a6:20b:a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 10:35:52 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 10:35:52 +0000
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
X-Inumbo-ID: 3e5bf5d2-85a6-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2NvkHqx1wVvUvtsPev5bafIqT2ErVhc/tvXpfrzJfUx8xXwVupAZmSt5ErI9rJWhVlSayra91zFm3mFO5x4eXEanBdTq0kXpvafKb1H2TzSR9EzQGQ2YYHmzTHPOR1HXpsD8ILyMFdrJCkHA0ZK2Zo++Qsj5vJ6Pe+ID8sfUkXr0JrA7Lzn+3ApHSvHXH9OvdKALnuhNarTyqmbP1iIzjW/6fbIGApnD3uEJLs2DLNS+6NIBwrvt5rm8hd55dxe8h0eekjq3CSKJMSrlpN6LaknI6Yhxsmi9YNe0ep9Ne5o+midVRAX9mkQe8zT9QTYGb6oUba7IAyvGGNjS+uNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SF09O8UfeTOzQNVYbgCroZZsXaWMbZHA4mqoWfu9hsY=;
 b=nhcmZMFXZmmMKmLGK2+WdWofcb3CoamrmaHlqnpBaE/yuH8KjLcfCCC9x0YCw0gBhgKyMGd+vSN1uk8guXhnzjRwZble7XIBxyIarEQ7L3dXZa04gDbB57DZHpLPrE7bfk5mKuipAxIub4KxGX80+S59VgP4jgVUAcsGvEtxTFMJkpZ25iBLhk++uKkMgpVz/IPhwX6I4Pg7LjR3v7dqPUsJGaO/Lr6N1G0NIQLb9SIANzlYk1IyisY9XuLqohIQsO4ZU+3Vxwp9vYVzou2c37h0WIMx5vVRSM1WKm6DkYR7R2eqXkp9H9pf+0u2Nlm31EUCCAD/gYqjHQKBJE1V3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SF09O8UfeTOzQNVYbgCroZZsXaWMbZHA4mqoWfu9hsY=;
 b=EECdhlKz+PiLxaFC15MI+IiyT4JwVZqQYuv93cYggjSqGw1y4yE1Ylbagi7iW3qStIrA22c3TMGoOB9mkTmMGdYVTc+E7tXzdRuAG/x8nvUidGA2UpNPkng116Lu3rez0ziISL0koR4IBmuczs5LC5a8Gs0fhKS2nvSbVHCyEHl5X8v8fJiOD3fCx39amROTbXCml4TcrPXQ/Ik+XLKJgWI1r4J1w2PvZNKI9AKVVDcc+h83d9SOfu5AJYulZ29nINWFCIXjdQMsU8gkfva2c4PZEx5ZV4AjR4ppZ6aXqn9xtB5lbxQ2VgYnF1ozqZ47W9O1q3YpMjFRybz1p0mh1w==
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
Subject: Re: [PATCH v6 01/13] xen/pci: arm: add stub for is_memory_hole
Thread-Topic: [PATCH v6 01/13] xen/pci: arm: add stub for is_memory_hole
Thread-Index: 
 AQHYGZFbEg6Erttt1UCNei+XrySHEqyDFYiAgAAC4gCAAAsigIAAAbyAgAAC0oCAAAq4gA==
Date: Fri, 4 Feb 2022 10:35:52 +0000
Message-ID: <86e51f3c-6ef8-a86d-acf3-38334db430a7@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-2-andr2000@gmail.com>
 <000ac24e-fdac-855d-7fb4-2165a1192ea4@xen.org>
 <19e50632-5865-9a75-756b-88db85007e96@epam.com>
 <d9741ff0-2152-6792-5249-09e3b0960972@xen.org>
 <43cab3d0-1a62-dca0-0d2d-5ea8fe237b21@epam.com>
 <ad90a3df-7049-8ff2-979a-dec3b8c542a1@xen.org>
In-Reply-To: <ad90a3df-7049-8ff2-979a-dec3b8c542a1@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77ec2dd9-1e55-4b3c-3559-08d9e7ca1e29
x-ms-traffictypediagnostic: AM6PR03MB4279:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB427970C6B19388D3646AB601E7299@AM6PR03MB4279.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KPex9bBPuektC16nfTgI5mgwd0ls9/NL/SbyxZNz2TD4TB9GfKNQ39niX3AxQlgv88VMw9vEwC4079hnD5Ua9sszN7ba/OV+acOt2UTKX1m6x1y4ZqyU/7QSgldVQf2E8CvMp2wCfqysB1UsCCtiTjCxfcdlHQD6Yn5+AHMiz5ZpBb/zqSEdiDDa3bj0y6GpkB/oOuLt/dpTtFYS/W4h9a0uwDYuuvz4heg5rkFLtYY4RBITUQlfMT7UmJIWshnBl2tliarXx66y3nwjfSnhdq99Yj0bvu2RfspeSW4tVepUJ+zEWOP2WlZ2OHBEyo1lTybQFy6N/aSk1olMaLIDBO8IGA8GXLmutGkEkUrEDXVrgkbAY1DB1Zsb5CyBhe2Q3TL+fVS9YjwXOI7nVW1B/uAIS6QAl4PK+3jx4QcJrhSmdzTh7EuG9+RooI2v7ap75Y6ppanoUzJjNTc9cH3JDT4262GUAvaM4FfnxaK2gFQyjfKt29T0k5/5m9WqvcThARYdMR0GqA8a8VZ+FKp6wd+wuU/dG1T6KIWzfbXFQZZLmwH5v0WHS13A5arTJmUYvKfIODMcrQiTu3tAFB19cD41DuuIF7Q/mGm8jnYCRrlVbzH/cPTeVVN32m4p74oh6fqHbFiODAaTavzv70bUSxtw/lA7mu3kuG3+cSP0Js0IBAT9GHetmoomSUcdAlkyYSkzhGS/T/zxbGZ+gokiX8X/rmfltPLpNqTJwJ7Xcc1AhT3jMiplpE8Gv6slOiDN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66446008)(66476007)(186003)(107886003)(91956017)(71200400001)(64756008)(66946007)(6512007)(7416002)(53546011)(122000001)(2616005)(38100700002)(6506007)(66556008)(76116006)(31696002)(86362001)(26005)(38070700005)(83380400001)(4326008)(8936002)(508600001)(36756003)(5660300002)(6486002)(31686004)(54906003)(8676002)(2906002)(316002)(110136005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eDBObnNxQ2xZUk05bUFZYy8wbWRDdTJTSzY2M0xVb2JqZ2J3OXpNcFpFTW5j?=
 =?utf-8?B?Mlh0TkdXOGl4Z1BDNWdvWkFQNjF1SnlCUFk1bEZqR0I1TFJwYmpRR05yU2tZ?=
 =?utf-8?B?S2JvNkNSQks2RmRmeHJBeDN1eHUwVW5KcnpWdGhjZzFTM2N0VWNEcHZTV2Fh?=
 =?utf-8?B?VGFnNzNVTW1sZmozS283bzVNeGJKNTcwTGdBeUYxMVozd1dyWkNFRkc1djRC?=
 =?utf-8?B?REY0ZjR0amFkSFVkZjdtRjY4aGZVWFI5c0tGUXQ3cEpCQ2Y3TUx0UWdXbkdQ?=
 =?utf-8?B?RHNCak0zQXR3ZUhGcjNUVEd4ZHhTUkNzak0remphdE9jb3pUODZaRWtlbUo3?=
 =?utf-8?B?KzA5ZjdZRFVGVk5odDBCTG5GbWQvZG8vaEo3cUNHRjYrZW4wQnRvYzE4V3hF?=
 =?utf-8?B?cXZOS0FoRkRQTUh5TmJoVkh6T290VDJnOURPVjd0OUxtRVExdTFlRlNkQXdY?=
 =?utf-8?B?cW83MldCUlBZaGowRkN2ZDVoWUErWEdib2VaYldiZ1ZoeDk4eVVBSFJ4bEpS?=
 =?utf-8?B?bjI4eFIrSGVuOWowSWdCS1N5STkva0xoZHB0c0x3LzREeXRMeitRVXdnOFRX?=
 =?utf-8?B?amtsWTJySHR1cGtjSm1tWHlDR3VpNE1KOVB1R3JaWGdnbWhaeTV5TTBFcGts?=
 =?utf-8?B?NzEzazlOTVJDcXJyNlJwc1FxK1BPd3Z2MGpack13RjRQL1BlcklDeWVsVS9B?=
 =?utf-8?B?Y0hjdUJzbUZrT1RMNDJyT0NCc3piS0FJNUh6UzJPU09tR2pCYWdiQlg0dyt2?=
 =?utf-8?B?U0xoN3NuNS90dmFBR1RoRnVndnNRcVRMeXVKbitISGtuTmF1YlI1YXRiMXpM?=
 =?utf-8?B?QUd6U3B2bTR1Q1NpOWVWNU5LSjZLcHVuL0doRjM5UTNQbTdsZXVsNTZPMXlV?=
 =?utf-8?B?QWQranZEczBiRExVTFA5MFJYUmVGY3A4RDNrUDc3M3htZXVUVVpFS0VYams5?=
 =?utf-8?B?RUc1WkFicXdqM1NjZUNDcEMzY1JJUzhXQ0YyaEFjK0Z1M01UOGpyN2ozMmVk?=
 =?utf-8?B?S0pVRTRJd3ppalllcnFEekNYNW1waDNqS2VDNDZQWDVCS2VYQUt1V3BBenlX?=
 =?utf-8?B?R09FRlNDZy9sYXBPNS9lczc0YzRGNEJoNnFYQmdjV1QwZUwwMCswMWFQR3M0?=
 =?utf-8?B?cU1BcjJ6bUkwWFFRZHJzSzI5NlJoVWxrYkh4MEFqa3BhdFJFOS8rbG9XeTRQ?=
 =?utf-8?B?dFR6VW81Q3AxRDNhKzRBUXJmTXA0MmN6ck9Iekw3ekd4UlRFaU1sT0NqOXlV?=
 =?utf-8?B?aENxSXR6c1ByRmtvN2dNcXJHZ25od1hkWEt1VURnYmszbFJzQi94QW1FWkRa?=
 =?utf-8?B?RlpwaEhmS2VVWlN0Sy95aTVWZGs1V2RkRXIvRHVQYVdrellJV20rckxyNUk3?=
 =?utf-8?B?WE4yWVU5aUd0SThyb3pSWTlWK2sxbUJUd0dmcHhIa2RvVUYvZUNaNURQd0c1?=
 =?utf-8?B?Y0EvaFRZRjBRN3UzRWdzMzdVQU4yNzBWcUhRdDYyNS9tUnBrNDBLQjZqM3Ru?=
 =?utf-8?B?bnpVY0RDbm40Rzl6TmZCeWlLV2NsSG5LK3VlSVVIQUduTkNuL0Y0ZEhFVGkr?=
 =?utf-8?B?K0RZNVNiWVZLaWQvc0hOR0ltbVl6cGJFRzVwU1VLcFlseWwzWUxtRmY4ekNB?=
 =?utf-8?B?U0tLRlRtREFEQjZDV0h5NWllM0FNdGlVakxnSXMrNXMrTzV6V0g5QUIrRlZo?=
 =?utf-8?B?RVhkT0hiWjl0bXFINkpRV1JxZURCcTJocDI5ZnU2SDlsYlNTbUZLeWRGbTRM?=
 =?utf-8?B?TWFNRlp1L056V3FaRXo3d2VmajJQdDEvZjBBVmZ5a1ZwWjh6MTltY0htWlBh?=
 =?utf-8?B?NEN6ZGo5dFFnWEcxR3N1UVFheHBmT2xmdWRqc1NhNUFLL2dVMUt2QlRWaDhy?=
 =?utf-8?B?K0FPcm8wZ2VZRk5OSVZPbnZweXJyM0xidzl6dDFEK1EvRDVscmh4azVlTUc3?=
 =?utf-8?B?ZHNBejdVRndDbUxURDgyQ3JFQm1pVDVmdUIvYVk3bTA2RlpqeE1VWXV0eW50?=
 =?utf-8?B?ZStkQXZtT2VadGRHR2VuWGgxZEJ0MDdCMTdyOVh1TU16THdmSTUzR0xOVnlL?=
 =?utf-8?B?eVZXTjljakNKV3h3RUhBem5IaVdmbkpKZVBUampyWnpta1UwZzNGSmw5Zk40?=
 =?utf-8?B?ZjU3U0xHMFJwWHQzdXFpNDE0VjdBdWtqZkszaFBYeGxWZDMrQ2QxNW9uZ0x4?=
 =?utf-8?B?YlpCS05hakRGcldaMUNSK0pJODFhU3hKcVdqckhQOWFyazdvdmptMTJhUlJ6?=
 =?utf-8?B?b3d3bjlLcGR2angySXpkZkU5ak4va0VZWHBEZUdtbm9hcmJMbFpZbGswZ2R3?=
 =?utf-8?B?OFR4dko4YUhhdTJzZlpDRXVrbnNSSVdKcUZvWHZRd3pUc1NxT0lWUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21B1FA967559AA40BED244988E6900BF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ec2dd9-1e55-4b3c-3559-08d9e7ca1e29
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 10:35:52.4594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5QVKAQZOtHCsnPcHHfoffVFSLxC9RBzACtLrWc+fjcJvRR1SkZy58EHRsbKc7UNVObRNGWUmmhEVqmOj1WwyL428sMQkNaUo+M/op8JDE0HqlUHB2t2LLdl0ngFIaRQ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4279
X-Proofpoint-GUID: 0WZhHNr3WX-FLeh-kEe_G3qGZoxUarb0
X-Proofpoint-ORIG-GUID: 0WZhHNr3WX-FLeh-kEe_G3qGZoxUarb0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_04,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040057

DQoNCk9uIDA0LjAyLjIyIDExOjU3LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEhpLA0KPg0KPiBP
biAwNC8wMi8yMDIyIDA5OjQ3LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4g
Q291bGQgeW91IHBsZWFzZSBoZWxwIG1lIHdpdGggdGhlIGV4YWN0IG1lc3NhZ2UgeW91IHdvdWxk
IGxpa2UgdG8gc2VlPw0KPj4+DQo+Pj4gSGVyZSBhIHN1bW1hcnkgb2YgdGhlIGRpc2N1c3Npb24g
KCsgc29tZSBteSBmb2xsb3ctdXAgdGhvdWdodHMpOg0KPj4+DQo+Pj4gaXNfbWVtb3J5X2hvbGUo
KSB3YXMgcmVjZW50bHkgaW50cm9kdWNlZCBvbiB4ODYgKHNlZSBjb21taXQgNzVjYzQ2MGExYjhj
ICJ4ZW4vcGNpOiBkZXRlY3Qgd2hlbiBCQVJzIGFyZSBub3Qgc3VpdGFibHkgcG9zaXRpb25lZCIp
IHRvIGNoZWNrIHdoZXRoZXIgdGhlIEJBUiBhcmUgcG9zaXRpb25lZCBvdXRzaWRlIG9mIGEgdmFs
aWQgbWVtb3J5IHJhbmdlLiBUaGlzIHdhcyBpbnRyb2R1Y2VkIHRvIHdvcmstYXJvdW5kIHF1aXJr
eSBmaXJtd2FyZS4NCj4+Pg0KPj4+IEluIHRoZW9yeSwgdGhpcyBjb3VsZCBhbHNvIGhhcHBlbiBv
biBBcm0uIEluIHByYWN0aWNlLCB0aGlzIG1heSBub3QgaGFwcGVuIGJ1dCBpdCBzb3VuZHMgYmV0
dGVyIHRvIHNhbml0eSBjaGVjayB0aGF0IHRoZSBCQVIgY29udGFpbnMgInZhbGlkIiBJL08gcmFu
Z2UuDQo+Pj4NCj4+PiBPbiB4ODYsIHRoaXMgaXMgaW1wbGVtZW50ZWQgYnkgY2hlY2tpbmcgdGhl
IHJlZ2lvbiBpcyBub3QgZGVzY3JpYmVkIGlzIGluIHRoZSBlODIwLiBJSVVDLCBvbiBBcm0sIHRo
ZSBCQVJzIGhhdmUgdG8gYmUgcG9zaXRpb25lZCBpbiBwcmUtZGVmaW5lZCByYW5nZXMuIFNvIEkg
dGhpbmsgaXQgd291bGQgYmUgcG9zc2libGUgdG8gaW1wbGVtZW50IGlzX21lbW9yeV9ob2xlKCkg
YnkgZ29pbmcgdGhyb3VnaCB0aGUgbGlzdCBvZiBob3N0YnJpZGdlcyBhbmQgY2hlY2sgdGhlIHJh
bmdlcy4NCj4+Pg0KPj4+IEJ1dCBmaXJzdCwgSSdkIGxpa2UgdG8gY29uZmlybSBteSB1bmRlcnN0
YW5kaW5nIHdpdGggUmFodWwsIGFuZCBvdGhlcnMuDQo+Pj4NCj4+PiBJZiB3ZSB3ZXJlIGdvaW5n
IHRvIGdvIHRoaXMgcm91dGUsIEkgd291bGQgYWxzbyByZW5hbWUgdGhlIGZ1bmN0aW9uIHRvIGJl
IGJldHRlciBtYXRjaCB3aGF0IGl0IGlzIGRvaW5nIChpLmUuIGl0IGNoZWNrcyB0aGUgQkFSIGlz
IGNvcnJlY3RseSBwbGFjZWQpLiBBcyBhIHBvdGVudGlhbGx5IG9wdGltaXphdGlvbi9oYXJkZW5p
bmcgZm9yIEFybSwgd2UgY291bGQgcGFzcyB0aGUgaG9zdGJyaWRnZSBzbyB3ZSBkb24ndCBoYXZl
IHRvIHdhbGsgYWxsIG9mIHRoZW0uDQo+PiBJdCBzZWVtcyB0aGlzIG5lZWRzIHRvIGxpdmUgaW4g
dGhlIGNvbW1pdCBtZXNzYWdlIHRoZW4/IFNvLCBpdCBpcyBlYXN5IHRvIGZpbmQNCj4+IGFzIGV2
ZXJ5dGhpbmcgYWZ0ZXIgIi0tLSIgaXMgZ29pbmcgdG8gYmUgZHJvcHBlZCBvbiBjb21taXQNCj4g
SSBleHBlY3QgdGhlIGZ1bmN0aW9uIHRvIGJlIGZ1bGx5IGltcGxlbWVudGVkIGJlZm9yZSB0aGlz
IGlzIHdpbGwgYmUgbWVyZ2VkLg0KPg0KPiBTbyBpZiBpdCBpcyBmdWxseSBpbXBsZW1lbnRlZCwg
dGhlbiBhIGZhaXIgY2h1bmsgb2Ygd2hhdCBJIHdyb3RlIHdvdWxkIG5vdCBiZSBuZWNlc3Nhcnkg
dG8gY2FycnkgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLg0KV2VsbCwgd2Ugc3RhcnRlZCBmcm9tIHRo
YXQgd2Ugd2FudCAqc29tZXRoaW5nKiB3aXRoIFRPRE8gYW5kIG5vdw0KeW91IHJlcXVlc3QgaXQg
dG8gYmUgZnVsbHkgaW1wbGVtZW50ZWQgYmVmb3JlIGl0IGlzIG1lcmdlZC4NCldoYXQgZG8gSSBt
aXNzIGhlcmU/DQo+DQo+IENoZWVycywNCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

