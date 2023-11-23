Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 139787F55CD
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 02:21:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639340.996582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5yNu-0003tl-Am; Thu, 23 Nov 2023 01:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639340.996582; Thu, 23 Nov 2023 01:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5yNu-0003pz-7B; Thu, 23 Nov 2023 01:20:02 +0000
Received: by outflank-mailman (input) for mailman id 639340;
 Thu, 23 Nov 2023 01:20:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B0YW=HE=epam.com=prvs=5691553e4c=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r5yNs-0003oV-Bt
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 01:20:00 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69ad604d-899e-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 02:19:57 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 3AN0fnsp011906;
 Thu, 23 Nov 2023 01:19:44 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uh4u5c03k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Nov 2023 01:19:44 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by PA4PR03MB7248.eurprd03.prod.outlook.com (2603:10a6:102:10e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Thu, 23 Nov
 2023 01:19:38 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7025.020; Thu, 23 Nov 2023
 01:19:38 +0000
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
X-Inumbo-ID: 69ad604d-899e-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9IY+3Fvh61NM11e2qIF7T5j8332jUFpHEeoaTeybn0olozVhAoR9TUu7QrUI1VUDVFR/FI1a3fdfcxQid5E5KlEwc/Pf1/nrTFPjbz///i31cXqoRn1vWIufX2hMxEXdXsVsoTuemEkJjsY39DSIuy2YY9nT67owExAnM+FhONRRK4f3354e3mu9yK+Gere/aJu8CmuDVhn6uCX2xeS4cWW7vWYVpGfrpDfzi5fjamXkdFMU6LkNbEKeX2YNSyiXIB7AKuXDGV1aqUXOpTyOoqvKzeT+TwQOYNjKrUBtOIDi3Gm+zisLTf1Q12nNbVCeoCxj+B0vHuGl80pKrk5ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5TmEmqeOWJEXSOfUhZZc+TeOdEiYVqPoGoDsR2syFO8=;
 b=CuoT0mq//FXRahmeWYFNdcCU38197v+nbV1AXIDwGm/Gnk2O8YYLAmLC/whE1JSjcWcbWzloqO1KURbfGpdmHU9tEpsmUTExnBCVD+OiZz4T/0i0Zpy5+LMDvKNwd9Fi+zkk7whZiz6rbYrW7bv9Pj/fkfDijGECja1MozfJtkXDRBAJXlcN66QZvOEdfg+aiFGvNMDCGghPhaL4wBXrqwPZ4nSxZDIQdRU87CsWlUOxICHGsGf/QIBfhLq9c/PwVPmdfNBRLkBQ1L28+t/2+P3SSWlq2AfBsjHYGHguqchllNnOOCZNRD0KbCIfdsbOcpJ7SW2SrJtJPhhFQ9dKRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TmEmqeOWJEXSOfUhZZc+TeOdEiYVqPoGoDsR2syFO8=;
 b=mdfi7w5Ve9xRm6TnJDbqVOiPcfc28eHb7xPAKK96+oeWN5bZ50JjQfTepr0mCdKgnTHEzRihPezZXpEdyaR5muXb7BDVVzjhKdoFivK4WZ0TBynSV01fZfKauK9gowuTWLVU1eePBqIujsVR41W9c+GmESWRH07y1x+akdMPkyS+vzHim3/venzrgsNlm8fGAf13TRcMLStq0lvA0vzQewzWneMtSLBbn6k6wudGvruJ5oa6aX64B3ZphOHE0mmgv+O6N5WeOohmUdA6EdQj7DOTj9vWPzrSNtTqcsdT3QapoqhF23KiA0V2g+gAPwN3q+1w4e4yR0QTDCIxVvXsgw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: David Woodhouse <dwmw2@infradead.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>, Paul Durrant
	<paul@xen.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Richard
 Henderson <richard.henderson@linaro.org>,
        Eduardo Habkost
	<eduardo@habkost.net>,
        Anthony Perard <anthony.perard@citrix.com>,
        "open
 list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/6] xen: xenstore: add possibility to preserve owner
Thread-Topic: [PATCH v2 3/6] xen: xenstore: add possibility to preserve owner
Thread-Index: AQHaHMeI3Gf8Xs6dHUOphRyadMs2o7CG9fUAgAAktAA=
Date: Thu, 23 Nov 2023 01:19:38 +0000
Message-ID: <87v89txo46.fsf@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-4-volodymyr_babchuk@epam.com>
 <777dd8fb393464bcac2130210ef2a538a2e606f9.camel@infradead.org>
In-Reply-To: <777dd8fb393464bcac2130210ef2a538a2e606f9.camel@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|PA4PR03MB7248:EE_
x-ms-office365-filtering-correlation-id: 6fea7cfc-0352-4aec-6d8e-08dbebc24303
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RuqT1a+fbuHO8JDwj6i01Uax01rHFfOvPgaC0FlKxiRz+z3ezRr5RUBnpwOAN3knRp8FoqBOlNH8fV4rzRA31xHGK3aLDT1KTyhXcoPBz+pMT5y07P5yxEUzA3XkWlxUuUPHMuXVPhWEjqCPF5t9qJE08VOsLJ/Hta1jAr7ypJBJpTUayZtx8vHIBSUO/PkxAsyrlVV4IPa/BgDPtEV+Ly2WfXpz3mV5AZBnCsU0AHr06UDWZeoARBygNZcF9eUSklKbUvIZiAQzoTC0okd/SflSDfwUOjW0WNRAZMJn/JaadqcsTNqkTkXQ9YPq7aG3mkVjws7YgqaVyfXk/bMonoE9WQfWEOWxtvz3W+sF8LRZ/qeCvhdv1kgi94GaZY4wEJY8pc8OUKtazsKgZRJqFWisOhK1/FKlk5Lvj1KV2fvhjnrOASidIf0FnJbVj96Cy98RZ7gFVXMOXK0iih8P3iTs0Rx1w9onUUJuWAgXY3x02Now71og4rVppXZ/RJxlPVNWELNJWWzHSk8KJU5LHtYmR/JnQTp78uBK/yzhPae7sW+nqsymhljOkxkpadQf8IKzZZv6fEKEoCvoLSupQ1hvwnnrnwSQ7+etdlvA0gqAlc5DTzgHTPYYdCMjzVpE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(396003)(346002)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(26005)(55236004)(6506007)(6512007)(2616005)(91956017)(4326008)(76116006)(66946007)(54906003)(8936002)(64756008)(66446008)(316002)(6916009)(8676002)(66476007)(38100700002)(66556008)(122000001)(478600001)(6486002)(71200400001)(7416002)(2906002)(4001150100001)(5660300002)(86362001)(41300700001)(36756003)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TnR3eTNJWTdkejZGTHk4QUsrYW91QnJ2NnN6MnhuZ2JBR1Iyd3kyNjJTM0Q2?=
 =?utf-8?B?SG4wMkxJWXo2WTMwaEdLTXhWYXhWb2VhdTYwbHQyRkJmMFN1OXFRMWtZOEhH?=
 =?utf-8?B?eDVOcjhqZk8xY25QZG01ODMvQ3hUZGxpK3JqdlJuZ2xLRlNIM2tjZWFoTTFk?=
 =?utf-8?B?V2ViOWVkT3FLbnZySkFPR3dFZTBSR3pETTgzdmZDdzNZK3pNelF1Rnh0dkJS?=
 =?utf-8?B?L3JDR3pJRUhIQ0c5VFFUcEkxb3FHRzkyT0lSNHkvWGg5eGtGaXlHdjJiZTdQ?=
 =?utf-8?B?d0dKZVpOenU4cndtUG9qQkJiUE1OdmJaZ0NYaW8wQXU1VzdYL2RVSlR1NzF6?=
 =?utf-8?B?R0xCd0ZkTmtvRGFlWlpRR0tHR0dlbTVpUnhaYmp3ZXBLTzFmNWF6RXZIZE9M?=
 =?utf-8?B?Q1VFWllBRm0vRGlIZTJraVZRZ1VaMEdQMWdJUWtCRWFVSEt6SzVoWng3R2tr?=
 =?utf-8?B?SHpza2g2ZTdsaFRZa0RBemJxWDVBZTBCVk9OTkxQWC9LUG0xTnZhMDhMQWVJ?=
 =?utf-8?B?ZGR3dmVjR3FwMURxOTlzbWJXVTExMEVQTDZtWmxnMnJ5c1NqUUpwcm9URTdh?=
 =?utf-8?B?Zzd5MWh6dCtoWDRiYXV5UDFIQjNaMXdYdWozSytUWjdUWWppWFFtd0xRMlZR?=
 =?utf-8?B?Vlh3bUVOdktuR2NUQ2c1QjE0aWNrdjBENnJCaU1hYTV3c205Szc2U0NVT25z?=
 =?utf-8?B?TXIvYXNyMEpvWXNsbXdZME8rSG9QZ1NUdml4U3AvSFhPcFFucmZVeE9weTll?=
 =?utf-8?B?YkZ2YlJ5VWhZcG5LN1JOdFNabUlCSFdMZ2p6VTZtSWtDUmR3K2JRaUZ1SE4y?=
 =?utf-8?B?TUtTM0J5NGpvRHJvbHFtQ1Z6NC9VeVFaRmV4QVl3emxIbE9CU3l2dXJuUjVJ?=
 =?utf-8?B?eTRobkNFS2J0eDZxVk8xYWpvQ1NIbmkvellqV2V2eURHMEo2MzkwS0lUWUgw?=
 =?utf-8?B?NzljMXZQQUQ5YU9QaytEZlNndk5vallIRnVwMlB5SVY5WUxJWnNqWDQyaGNM?=
 =?utf-8?B?eXlkdG1zUkUyRzA3Njg1OC85MjQ2c2Y5NWVITXJvZjZuVXVPUkxGWFEwZm5M?=
 =?utf-8?B?Z09FRElNd1FjdTAvLzFvc3R1OHMxWUR3S3pnZHY2WWNRWXhzVWtjd2taRm5j?=
 =?utf-8?B?K05VSTk1VEJwUHNBUDhlQXRUMzN4UkhqK3c4Vm1PQ3Z1aWY1V29KRExsckpF?=
 =?utf-8?B?V1RnZHRWcjRIMVoxZ3JESVBLZEwvTU5CMTJ0NVA4WlQvUTVUQkF4blRNaEgy?=
 =?utf-8?B?NUt4WkpybHBwTmFFeXoyNUxiaUgxcnFnZXRkc3QvTG96aUQ4TXROekZoVk5n?=
 =?utf-8?B?dmVXOUpwRnUvK3RLRWdIZklZeVpERGJnRjVCV2RlL0FsampNaDhyM1lGWEh5?=
 =?utf-8?B?YjV2ZmxORnUvWjZZNWZ0bjZzOFdPQXFXaDJZTEdFMmhFTW1JWi9jMTB5Vnds?=
 =?utf-8?B?WlpoVnNablRhNUREVmhrM01LUG9YSmFQbG9YbVhPT0I2V1dpVzZNNURnZzBz?=
 =?utf-8?B?ZC9tenBzVEF1WTdIaE1pYXc4SEMwVklJVjlXcS9rYUFpVy9sSWFxSUdkSE16?=
 =?utf-8?B?K3NHeVhuZklMdEtFUjF3cXJqMHhuYy92SUZHYlRuN3J2aWVEOFBUano2eEl2?=
 =?utf-8?B?SUVTOFU4NElKdFlTWDRNYjk0WXp6ZFZic3NKMWQzb0NBZzJ0azNCeWQzQ1JB?=
 =?utf-8?B?Q1dDblRLV1piYkdNbWEvOGhmQ2ljVWR5WHhyQzArR1FTM3dnL09LNTMwNDlQ?=
 =?utf-8?B?VWM5YU1lNEFvcWprKzdlWVdPZE9NYTVmaGM2NFNmbTdENVV4eXFJRnZxa2Zi?=
 =?utf-8?B?NjJZR2g3aENhNlNHUlRBcm04ZEp3dFZSK3BsV0F1azkzTVkzMitqSmM2cS9N?=
 =?utf-8?B?QnZ1SkJURkgrV0RuWkFjb1FGclVOZkRHdlBINzhobFRrNzNRVE9uTXpCZnRm?=
 =?utf-8?B?eURoeVd6aExFOFFLNXJCWk9rOUhHM1ptNXZVcTlveWRXS3dRQnN3RVR5S29l?=
 =?utf-8?B?ZGtEWlZVSXhuaU9GUmxldGhJYTBnYW9yZWRDUFFMbkZLckM3VnNDY3Ftd2FB?=
 =?utf-8?B?T0hQUnpaMnhHUS9FcWlVMERJSFMzcDNQc2paRmhQdmd4MXZxWm9KMFl4Z2Zr?=
 =?utf-8?B?dU5FTWwyZXBvbXUrSjZWMDJkK2Z2MDcwbGl1UVNsRmtYblpHdDhRRE1sS3pw?=
 =?utf-8?B?WlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <918AB3AA138BC54C929529B30E2706B7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fea7cfc-0352-4aec-6d8e-08dbebc24303
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 01:19:38.3516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5IOVQtSFRMGMh4TgvGztFb/WDB1U3peZuLcuLl+qVtmqUvQj9IwqhkFn16uThHtY6WNkdFgHM/u3G68Eicx06YMT/Q/W7nm6i/k5kpfB3/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7248
X-Proofpoint-GUID: 2V1gzoitA9mTMzcSZlbeW7GVizLNKw6h
X-Proofpoint-ORIG-GUID: 2V1gzoitA9mTMzcSZlbeW7GVizLNKw6h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_18,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 bulkscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 spamscore=0 suspectscore=0 malwarescore=0 mlxlogscore=599 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311230008

DQpIaSBEYXZpZCwNCg0KRGF2aWQgV29vZGhvdXNlIDxkd213MkBpbmZyYWRlYWQub3JnPiB3cml0
ZXM6DQoNCj4gW1tTL01JTUUgU2lnbmVkIFBhcnQ6VW5kZWNpZGVkXV0NCj4gT24gVHVlLCAyMDIz
LTExLTIxIGF0IDIyOjEwICswMDAwLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+IA0KPj4g
LS0tIGEvaHcveGVuL3hlbi1vcGVyYXRpb25zLmMNCj4+ICsrKyBiL2h3L3hlbi94ZW4tb3BlcmF0
aW9ucy5jDQo+PiBAQCAtMzAwLDYgKzMwMCwxOCBAQCBzdGF0aWMgYm9vbCBsaWJ4ZW5zdG9yZV9j
cmVhdGUoc3RydWN0IHFlbXVfeHNfaGFuZGxlICpoLCB4c190cmFuc2FjdGlvbl90IHQsDQo+PiDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsNCj4+IMKgwqDCoMKgIH0NCj4+IMKgDQo+PiAr
wqDCoMKgIGlmIChvd25lciA9PSBYU19QUkVTRVJWRV9PV05FUikgew0KPj4gK8KgwqDCoMKgwqDC
oMKgIHN0cnVjdCB4c19wZXJtaXNzaW9ucyAqdG1wOw0KPj4gK8KgwqDCoMKgwqDCoMKgIHVuc2ln
bmVkIGludCBudW07DQo+PiArDQo+PiArwqDCoMKgwqDCoMKgwqAgdG1wID0geHNfZ2V0X3Blcm1p
c3Npb25zKGgtPnhzaCwgdCwgcGF0aCwgJm51bSk7DQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHRt
cCA9PSBOVUxMKSB7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7DQo+
PiArwqDCoMKgwqDCoMKgwqAgfQ0KPj4gK8KgwqDCoMKgwqDCoMKgIHBlcm1zX2xpc3RbMF0uaWQg
PSB0bXBbMF0uaWQ7DQo+PiArwqDCoMKgwqDCoMKgwqAgZnJlZSh0bXApOw0KPj4gK8KgwqDCoCB9
DQo+PiArDQo+PiDCoMKgwqDCoCByZXR1cm4geHNfc2V0X3Blcm1pc3Npb25zKGgtPnhzaCwgdCwg
cGF0aCwgcGVybXNfbGlzdCwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBBUlJBWV9TSVpFKHBlcm1zX2xpc3QpKTsNCj4+IMKg
fQ0KPg0KPiBJZiB0aGUgZXhpc3RpbmcgdHJhbnNhY3Rpb24gaXMgWEJUX05VTEwgSSB0aGluayB5
b3Ugd2FudCB0byBjcmVhdGUgYQ0KPiBuZXcgdHJhbnNhY3Rpb24gZm9yIGl0LCBkb24ndCB5b3U/
DQoNCkkgbXVzdCBzYXkgdGhhdCB5b3VyIGNvbW1lbnQgaXMgdmFsaWQgZXZlbiB3aXRob3V0IG15
DQpjaGFuZ2VzLiB4ZW5zdG9yZV9ta2RpcigpIGNhbGxzIHFlbXVfeGVuX3hzX2NyZWF0ZSwgcHJv
dmlkaW5nIGp1c3QgcGxhaW4NCiIwIiAobm90IGV2ZW4gWEJUX05VTEwpIGFzIGEgdHJhbnNhY3Rp
b24sIGJ1dCBhY3R1YWwgeGVuc3RvcmUgaW50ZXJmYWNlDQppbXBsZW1lbnRhdGlvbiwgbGlrZSB4
c19iZV9jcmVhdGUoKSwgaXNzdWUgbXVsdGlwbGUgY2FsbHMgdG8gbG93ZXINCmxheWVyLCBwYXNz
aW5nICJ0IiBkb3dud2FyZHMuIEZvciBleGFtcGxlLCB4c19iZV9jcmVhdGUoKSBjYWxscw0KeHNf
aW1wbF9yZWFkLCB4c19pbXBsX3dyaXRlIGFuZCB4c19pbXBsX3NldF9wZXJtcygpLiBJZiBjYWxs
ZWQgZnJvbQ0KeGVzbnRvcmVfbWtkaXIoKSwgdGhvc2UgdGhyZWUgb3BlcmF0aW9ucyB3aWxsIGJl
IG5vbi1hdG9taWMuIEkgZG9uJ3QNCmtub3cgaWYgdGhpcyBjYW4gbGVhZCB0byBhIHByb2JsZW0s
IGJlY2F1c2UgYXBwYXJlbnRseSBpdCB3YXMgc28gZm9yIGENCmxvbmcgdGltZS4uLg0KDQotLSAN
CldCUiwgVm9sb2R5bXly

