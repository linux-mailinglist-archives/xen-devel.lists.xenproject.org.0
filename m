Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F21458D65
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 12:28:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228828.396017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp7Tg-00073f-Oa; Mon, 22 Nov 2021 11:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228828.396017; Mon, 22 Nov 2021 11:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp7Tg-000712-L0; Mon, 22 Nov 2021 11:27:16 +0000
Received: by outflank-mailman (input) for mailman id 228828;
 Mon, 22 Nov 2021 11:27:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJrQ=QJ=epam.com=prvs=1960b635ba=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mp7Te-00070w-Sp
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 11:27:14 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2336fa4e-4b87-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 12:27:13 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AMBMTNj027650;
 Mon, 22 Nov 2021 11:27:11 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cga9cg0kc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 11:27:11 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AM6PR03MB5444.eurprd03.prod.outlook.com (2603:10a6:20b:cb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Mon, 22 Nov
 2021 11:27:08 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::b121:f602:44b6:d445]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::b121:f602:44b6:d445%3]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 11:27:08 +0000
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
X-Inumbo-ID: 2336fa4e-4b87-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=efX9ff765zK9HPULJlJV+EFiiTZrZDvfvh7Y9B+p3YO/vYxBWeQmgTHlByYub5QJEtwsSUf8OeJW22xnltJlZ4NevnWGCT8vTkEYS78BvHiQjxVjkUwnbrCT/1PVMVLVRkiyO4h2donUqmAaEutgzbhU6cHhaANC6WUEiUG229i4LbhV4Mluvt7ATTst3+dU4ng7bU6FC1+wkJU2M5l8H4s+fxpgx8kDV332ioh7r/bhBYwxn1bo3iKJL1pAjfu6Eu5wGvmdPNo4FJ2DCgNdY2HuXbD4+Uv51v8YQgGIQSUX/OSD5MDYtEXemfwKq4VWl6NS4zlRvU3JyVMRqs52zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEQY6jR2gOzNvayT3tUbzzm2GEqQpjyo1tu8DQC3CWY=;
 b=hwyEBDLYfrJDPOIq/sSKWkFwGiMIWmewl30YyIj+4RWHh6UMz5oQZfKKVpdAtHKHwVtFyE8wmTWWBPDdWw9jSylnplr3xdGoLpG8aWkePf7USA1arz7H81OqHXHuHs6sC3esRNwIGXMW5wgMg/vN6ILmrm20UNkm3/RomSK/Gov2k2ty7iVc8FuKOUBjG8lnc2+g8jOdaalAHun3mXexcTaDJSVKw3ou5nrCInULXdalfwAtejm3uJs3MzsB+JveMLnE5GPnCuMIF8wIIF8qJavaM7Tj91W3XqUT9/56fDceBzJvlzoyJuFLi5rnUjPraSj/BlNMohn9zSqV8+khIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEQY6jR2gOzNvayT3tUbzzm2GEqQpjyo1tu8DQC3CWY=;
 b=T/sS/ubWtyWldtfiy2dtOYI0OBm38rTfYrFz1traTxaEqV9k3EOuH+NdEiHcz6KDp63QHOvBG6+o0f88qbW9FD4a0GOBM9Vh3eNv6n5m7zYkF+NVVZezdOOrpuw+uCEU6i6qOnQMx1MgpLb3Bdzvv7OHEN0ZJza3HOBKLggXvtXkQPtkNoq1TUqLV/8wI5rwYQHGGNEhzqTNBNIT882bJpDu05AqSC0apEzYAE39D3MCV/+afbAPtwH+x0A+QxY7Pwjjux7ViAU6skZLPvmCW3IsZGgWsJzUzVFj5I5nOZtSma83pbLRO2dWiYjWhRaCV4cFnVKfOnsHrJCZ06159g==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>
CC: "jbeulich@suse.com" <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH 1/2] rangeset: add RANGESETF_no_print flag
Thread-Topic: [PATCH 1/2] rangeset: add RANGESETF_no_print flag
Thread-Index: AQHX34NQb/OdxzJcEUqRnDxd7565ZKwPaLyA
Date: Mon, 22 Nov 2021 11:27:08 +0000
Message-ID: <a42dae31-e1e4-ed13-a0b0-be7d66286ceb@epam.com>
References: <20211122092825.2502306-1-andr2000@gmail.com>
In-Reply-To: <20211122092825.2502306-1-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10364008-ffa0-4165-5767-08d9adab0510
x-ms-traffictypediagnostic: AM6PR03MB5444:
x-microsoft-antispam-prvs: 
 <AM6PR03MB5444613CF617319E5FD2E71DE79F9@AM6PR03MB5444.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8b8QyO/9kdyy+hxfkEFRdZaAyj4JoUjT1bckJGEW/ds7aaC2bqU7f1iIdebOcfaAvOWdHAeVwynkDaaP0r3oliQFN0GaQ2plk5a6JBng0c28LUPknlbaA6iskbQcLUg9JBgugqayN5CHuYmD3fNcahuwiXR6Mpkh3XD43zGlq+UnCDt1Nmy4440ucjy39ZI+vXnQnIWYHnIi1RG4F//DRF+NQ7UnUleteIc/td3kMNpTNnO+inz/1R2HKPPkkJa2FKLjJcm6H3qnFpJw140MqXWjFYlPPTtUbvyfmD8/Uypau0z0kuUGWok4H0rJrGsnItu+/KeJX4D4+SJU9DAlucvrQxtGh6/1RRw3LfxEu7R2nftCkYe7oe6eb0Jc4L1BnJ4tvBQ1PYpZ2TVEssHUp8+lExxNUv1Fy1h+gewqIiaeK+8SszeBE6A40SqwTSk+mbLaba1qm3a1qD8x47flWefSRiNsRUkQ2XSJHAgZqnNtkjXgbc0GqjBCU56KAByh7nu6aABERaFLn210pCpr43iUuX0gIQDCTpVByjCxpf1Dn0gAaA2wFTrQdHbDGih4CusPYBTfy5bKEKBiNAz2pNy8EsT8T5QZk8AwJT2U3KC260ea870wO4t5CjqHQBHzhXxI/uSqEFlXo9Z+2AX379JhFL6FK3KCWJ2jfQyxt4dvLUuLueQsOsjqWmmOOmAj94j2IhC/8vrV3ijYl3lua2LGDh4uAB1RY3NNgBYAn+dupzDAMbjjmdoO9C9HWqyP
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(86362001)(5660300002)(107886003)(110136005)(31696002)(4326008)(36756003)(83380400001)(54906003)(316002)(53546011)(2616005)(6506007)(38070700005)(6512007)(6486002)(66946007)(76116006)(186003)(71200400001)(8676002)(508600001)(66446008)(2906002)(26005)(66476007)(66556008)(64756008)(38100700002)(122000001)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TUhoZFdTMW9QaGtXbGpHVWNsTVhLZDZPeWNTYzlVdmI0eDREWXNkZURGVkpl?=
 =?utf-8?B?cFA3UHlaQ3UwMDR4M3NaaUh0aFB0L3F1M3JvUFc0bC9iVzNCaDBVdElxTlRZ?=
 =?utf-8?B?VXpsenlIckY1cmZMMmZxTUN0RGNRalZianhveWIxSWJOZ21vT0dRMzBCdG5V?=
 =?utf-8?B?RnJmaTZCVHRzY1BzeHlwNStBSFJ1aVZnbzd5ZmNwd3pmSlZVYmRrbmlJeFJq?=
 =?utf-8?B?cmw1UmxPN1k4TGp5NlpMbDhhSTBsMEZkclJsMVlSRjFTcktuZ1dyZjZWWVNT?=
 =?utf-8?B?STQwL2VORHlEbnlidHFhdFlXcmpIZXB0OFF2dmxOMmdJN1kxMkdRU0dmeUVo?=
 =?utf-8?B?cnBzVjNlYmczb1M4MEhnenF5YjlPdFU4VHh6elNKY3VqdzUrNVhESkl6WU83?=
 =?utf-8?B?ZFFUVkpkTmJxZnFWaVNWWEZ4YU1BWU9UUEdMVGpoRjA4UTVLcE14S2JsYWhU?=
 =?utf-8?B?S3h5T290V0ROWWNpd0F4TGc2VWFvNkR5RnFHcG5oVXROWm4vcTVGbmxlamk2?=
 =?utf-8?B?TjdUZHRSYWdUZzk3Y252RDRnN29aTkxaWUtRVW5PbGlkNmNYcmNFTjgwbGdr?=
 =?utf-8?B?b1hiUFF5WTVTL3ZmVURIMDJZMUdFLzRuTTJpbmxtRnBTTzZIU25GeXp3a0ZS?=
 =?utf-8?B?YlUra3l4Y29OeFBxOGVmTGlWOVlZUzF4NEhJdUlrcVVwUjlKMHNYTi9BeUpJ?=
 =?utf-8?B?aDBHQVRVaVc3dnBpeFhsY1lpZnZpcTczZ3A5dmFUMVRDOFVTTEg4Qk9ReFlK?=
 =?utf-8?B?cGZEcmoxMDlvYW92dUd6TlhjVE84aHpoUFBxclNQbXVueDBtOWk1eEVLdi9u?=
 =?utf-8?B?d2NTdnh0MUlIQmZPd3AvMy9hRWx6MDBXY3RXcWJtRWVWMkEvZFRjdTlpRi9D?=
 =?utf-8?B?UmlQM21CVEVEN3ZyMlFDYlFHTitsR1Y5MmgwQzA2MG5KQU1pRGk2amdzcDZN?=
 =?utf-8?B?YlpzQnBXbCsyVEZzaENEeTA3RkdJRkxnSFlKUVUwZkJoWjJVOWh1V09GWGF0?=
 =?utf-8?B?d2gzQ0JWMjNsQ0tqczVlanJldkVsdlNoOXVGbWtmT1JDSFZvZzJlRUo4Wm80?=
 =?utf-8?B?aDgrNTF3V3RtTU9TdUdNWnNjcERzWWIvQmZraC9FalJhaXcxVXpxM2hXb1dN?=
 =?utf-8?B?eG50Q3RrNzdVSjJja3p4ZUd4ZktIVS9hcEZVcUlndDVETG5UQWQ2K2VjVzBp?=
 =?utf-8?B?NEsrUkVubkJ6ZUFWOVUzM1lWUlZROWxnMVZyVmtUUVdENE43VWdoOTNJMWVt?=
 =?utf-8?B?RG5EY25MYVIxajd4TXVzMmd6cHZpeXA4UWtGQ1hnNXVwQ3RMM3dQZEpmY0ty?=
 =?utf-8?B?VDlkKzJkVzQzZ00vSitRTE5udzEzZHJPY0FzaG5NTTQ1NzUyMWdwR2MrMWRn?=
 =?utf-8?B?S2xhVHlCWm1qNXo5NW9MZjJxOGQxcVdERng1dytnYzRFNUZNbS9nNkduRDE3?=
 =?utf-8?B?NUVSdXdXZjIrZ2xITmdWejVFNWFraXFkQ3hZZXhqMkVPeXdjdWFmc0tMeG5J?=
 =?utf-8?B?bUQwNnpPRlNyZUdVMno1akg4V1Y0aDZReHNuei9aeWE0QTFMYzlhQnlQak5o?=
 =?utf-8?B?aEpzMGx5TjVqYkxwdWt4MWxLK1BTbGE5b3ExMk9DTldzMlowUmVuVUU2VHl1?=
 =?utf-8?B?K0JpVWFmTWhPTGhzYTI4NDRLK0N1d01FZW82R01vdHV4TW1CTGhycXVBRkho?=
 =?utf-8?B?Zk1ZZFAzOE5MUUZyK21HTm1CMVRVQm52SlhwU05kekV6ZEIxNHMxWmFPaUR1?=
 =?utf-8?B?aitNOFpNUG80c0k5RTBpOHU0YUJhZ0NDQXpIVnBCTVJueXVROVZaaDVqZDM0?=
 =?utf-8?B?K29Vb1phT21VR0dvbC9MWXJFalM4NXJ5SjhydFZ1YUNCWWNHWDdzcENSR1RR?=
 =?utf-8?B?aUdZWFZoU2Q2VHcvUUNySFg5SE9qNFZvMlBqUGhaMGJsakdrWG44L3Z5T2xY?=
 =?utf-8?B?STVTZnBzdkZNNVNEUDZVRFQyWUdoSGFGTnZBZk90MnAxai9kZElpdzFWZVZB?=
 =?utf-8?B?bTFFN2t2Z1JNOE9icmw4UUc3UGFpLzBwVUZlYU1rUlVvajVKVWwvekx2SGt5?=
 =?utf-8?B?YmREV0VocFFQVFR5Si84Ti9uUDh5UW9KQ1h3UlpwVVBITXZRcVMycllhVnVJ?=
 =?utf-8?B?K3I5WkdHTnBTbXM5aEdIdDk5OHJiS2g0RDFIdXhDZ3Qyb0lrWWw4UlJ5a0Qv?=
 =?utf-8?B?M2prTEVIMmp5QUNrVnd6U1ByNDZXVTFUdStFYXh4Vi82ZVBSd3BGUmFTS3Jl?=
 =?utf-8?B?ZjhSeDNrVkRETitZc2JhWCtWV2ozWVNWdFowNjBXNnJicDVqV2ZzcWgwRFNE?=
 =?utf-8?B?V29ZbWp0SUlUbys4NEVqOGgzempSMk8vT2VHdUFYSEVPaUZ4ZnZXZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <09B504F4E7722242B5A11DDC8A78FA67@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10364008-ffa0-4165-5767-08d9adab0510
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2021 11:27:08.4739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VO7z4sOg55LPF8/pg3yIqKC2HzsdceUeb2E7Zf3kdXNMB69zmogoqd+jE1cK7wOOMak9NyELp6cr3ANTM4aDfLLl0nTFrlEZFTdQLrQ+pmXgeaPj/MeFu8jy/dUjY4Qo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5444
X-Proofpoint-GUID: n_7tq153qCmJfvXz6fK0973PZTnEnfGE
X-Proofpoint-ORIG-GUID: n_7tq153qCmJfvXz6fK0973PZTnEnfGE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_05,2021-11-22_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 clxscore=1015 phishscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111220059

DQoNCk9uIDIyLjExLjIxIDExOjI4LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4g
RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPg0KPg0KPiBUaGVyZSBhcmUgcmFuZ2Ugc2V0cyB3aGljaCBzaG91bGQgbm90IGJlIHBy
aW50ZWQsIHNvIGludHJvZHVjZSBhIGZsYWcNCj4gd2hpY2ggYWxsb3dzIG1hcmtpbmcgdGhvc2Ug
YXMgc3VjaC4gSW1wbGVtZW50IHJlbGV2YW50IGxvZ2ljIHRvIHNraXANCj4gc3VjaCBlbnRyaWVz
IHdoaWxlIHByaW50aW5nLg0KPg0KPiBTdWdnZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9s
ZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPiAtLS0NCj4gICB4ZW4vY29tbW9uL3Jh
bmdlc2V0LmMgICAgICB8IDMgKysrDQo+ICAgeGVuL2luY2x1ZGUveGVuL3Jhbmdlc2V0LmggfCAz
ICsrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1n
aXQgYS94ZW4vY29tbW9uL3Jhbmdlc2V0LmMgYi94ZW4vY29tbW9uL3Jhbmdlc2V0LmMNCj4gaW5k
ZXggODg1YjZiMTVjMjI5Li45Mzk4ODNhMWQxNDUgMTAwNjQ0DQo+IC0tLSBhL3hlbi9jb21tb24v
cmFuZ2VzZXQuYw0KPiArKysgYi94ZW4vY29tbW9uL3Jhbmdlc2V0LmMNCj4gQEAgLTU3NSw2ICs1
NzUsOSBAQCB2b2lkIHJhbmdlc2V0X2RvbWFpbl9wcmludGsoDQo+ICAgDQo+ICAgICAgIGxpc3Rf
Zm9yX2VhY2hfZW50cnkgKCByLCAmZC0+cmFuZ2VzZXRzLCByYW5nZXNldF9saXN0ICkNCj4gICAg
ICAgew0KPiArICAgICAgICBpZiAoIHItPmZsYWdzICYgUkFOR0VTRVRGX25vX3ByaW50ICkNCj4g
KyAgICAgICAgICAgIGNvbnRpbnVlOw0KPiArDQo+ICAgICAgICAgICBwcmludGsoIiAgICAiKTsN
Cj4gICAgICAgICAgIHJhbmdlc2V0X3ByaW50ayhyKTsNCj4gICAgICAgICAgIHByaW50aygiXG4i
KTsNCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9yYW5nZXNldC5oIGIveGVuL2luY2x1
ZGUveGVuL3Jhbmdlc2V0LmgNCj4gaW5kZXggMTM1ZjMzZjYwNjZmLi41NDM1NDBhODhiNmYgMTAw
NjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9yYW5nZXNldC5oDQo+ICsrKyBiL3hlbi9pbmNs
dWRlL3hlbi9yYW5nZXNldC5oDQo+IEBAIC01MSw2ICs1MSw5IEBAIHZvaWQgcmFuZ2VzZXRfbGlt
aXQoDQo+ICAgIC8qIFByZXR0eS1wcmludCByYW5nZSBsaW1pdHMgaW4gaGV4YWRlY2ltYWwuICov
DQo+ICAgI2RlZmluZSBfUkFOR0VTRVRGX3ByZXR0eXByaW50X2hleCAwDQo+ICAgI2RlZmluZSBS
QU5HRVNFVEZfcHJldHR5cHJpbnRfaGV4ICAoMVUgPDwgX1JBTkdFU0VURl9wcmV0dHlwcmludF9o
ZXgpDQo+ICsvKiBEbyBub3QgcHJpbnQgZW50cmllcyBtYXJrZWQgd2l0aCB0aGlzIGZsYWcuICov
DQo+ICsjZGVmaW5lIF9SQU5HRVNFVEZfbm9fcHJpbnQgMQ0KPiArI2RlZmluZSBSQU5HRVNFVEZf
bm9fcHJpbnQgICgxVSA8PCBfUkFOR0VTRVRGX25vX3ByaW50KQ0KPiAgIA0KPiAgIGJvb2xfdCBf
X211c3RfY2hlY2sgcmFuZ2VzZXRfaXNfZW1wdHkoDQo+ICAgICAgIGNvbnN0IHN0cnVjdCByYW5n
ZXNldCAqcik7DQpUaGlzIHdpbGwgYWxzbyByZXF1aXJlOg0KZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vcmFuZ2VzZXQuYyBiL3hlbi9jb21tb24vcmFuZ2VzZXQuYw0KaW5kZXggOTM5ODgzYTFkMTQ1
Li5lYTI3ZDY1MTcyM2IgMTAwNjQ0DQotLS0gYS94ZW4vY29tbW9uL3Jhbmdlc2V0LmMNCisrKyBi
L3hlbi9jb21tb24vcmFuZ2VzZXQuYw0KQEAgLTQzMyw3ICs0MzMsNyBAQCBzdHJ1Y3QgcmFuZ2Vz
ZXQgKnJhbmdlc2V0X25ldygNCiDCoMKgwqDCoCBJTklUX0xJU1RfSEVBRCgmci0+cmFuZ2VfbGlz
dCk7DQogwqDCoMKgwqAgci0+bnJfcmFuZ2VzID0gLTE7DQoNCi3CoMKgwqAgQlVHX09OKGZsYWdz
ICYgflJBTkdFU0VURl9wcmV0dHlwcmludF9oZXgpOw0KK8KgwqDCoCBCVUdfT04oZmxhZ3MgJiB+
KFJBTkdFU0VURl9wcmV0dHlwcmludF9oZXggfCBSQU5HRVNFVEZfbm9fcHJpbnQpKTsNCiDCoMKg
wqDCoCByLT5mbGFncyA9IGZsYWdzOw0KDQpPciB3ZSBqdXN0IHJlbW92ZSBCVUdfT04gbm93DQoN
ClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

