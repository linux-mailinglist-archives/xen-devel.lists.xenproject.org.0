Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E3D458CBB
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 11:50:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228768.395908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp6u3-0006h6-95; Mon, 22 Nov 2021 10:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228768.395908; Mon, 22 Nov 2021 10:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp6u3-0006e2-5a; Mon, 22 Nov 2021 10:50:27 +0000
Received: by outflank-mailman (input) for mailman id 228768;
 Mon, 22 Nov 2021 10:50:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJrQ=QJ=epam.com=prvs=1960b635ba=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mp6u1-0005ub-Nv
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 10:50:26 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdfc8c69-4b81-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 11:50:24 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AMAiWa0026581;
 Mon, 22 Nov 2021 10:50:21 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cg8wp09f3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 10:50:21 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AS8PR03MB6760.eurprd03.prod.outlook.com (2603:10a6:20b:294::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 10:50:18 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::b121:f602:44b6:d445]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::b121:f602:44b6:d445%3]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 10:50:18 +0000
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
X-Inumbo-ID: fdfc8c69-4b81-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8E9bRiHkTPwEgfJuINXtGGKAweugQ1gmqhq7BrZBJcy+wLba+6eUVMBNP6QckbQRwmucnX/x5VeBce7HskgkylEzdj53CQcAYIv6e3bNc6nBD2jP/q7cpaofCbs1Zj56O15IBd3AZG1RNzB82YVbHcvju9eZG2On+ktv+P+kELhDo+A9U/nIA6xXyomzuqxtRStMgPccXsAQlrZChyhlYwQXDSAXxOFL0G8/43QdoFpowU5fsWF4fdU51kl/EXavABRGhtl+es16G7832zmRY3PbXm3RAEGFci9AhJTKVqWZOYUGyiv7rOXpM+qcJvW+i8kMoyssDwrKcH6AEiGbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHyszV21KgT8vUZvQXpGOKYFZONbos1H5oe672i0Q+w=;
 b=R9gfKitcASAfODiBVjHReAwcXFjj3HSDXSnbnCt3FXP8Z3KdlfFRxQW8516Pv4DF7ggO95zDbdRfE/ffESxqUMOJhlILztIPCixhhewpRaqB0rErDZhtsgbYsK0mYSIsF3E1uUjK1a1UqohWq/wfz90C9YKuat/DMOXb3udKJ5/Gu66hDwhB29c66Pr+qRmLKdYoI+j9x4FNY8ymcC086vqMDOEidXfNVX2lUWIY8TA4VDIFwcjwhWBv8TW+JrLqATYKTp4cuGUrbCtbcNrKbceLd+w7+mkVVnSH+yc5p9kET1RrShyowVeisAej4BIQ77BxQcfIs7keY7av5zSzhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHyszV21KgT8vUZvQXpGOKYFZONbos1H5oe672i0Q+w=;
 b=dFNnSbs8AlcxDI+AcaHQuVEsbs7vSiXfS4hxOhDy/jCuCDBND6bo2B+KV2glBiix0c81+F5PLMQpgI4+5RaRbxpzFEMpgWkSCqqO5g7+D8KESdvLB6W/95sYppz3/ywlHaNNalv+PNKQk2bdB2T9kbCVeaGoE27dA05ZffE7w8DmeDZagEgn05KJuK8VUHNSYGv6/pN05uD4CobMwtpKPdnSU8TNzt+kNP2+7xafYv102hoZHmLxTZPgI+89ZU1E2cNfQF0NHwXwHZ2Fj2zD8wOPlOxum+DbaPrtCbjA5p1g8CLDXo9FoMnqpnlZfQ2LpecWkcgKx2XF5zXEjpMaaQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH 2/2] vpci: use named rangeset for BARs
Thread-Topic: [PATCH 2/2] vpci: use named rangeset for BARs
Thread-Index: AQHX34NSPeXhoB5iREudUJGr9f4eDKwPWBGAgAAEhQCAAAHcgA==
Date: Mon, 22 Nov 2021 10:50:18 +0000
Message-ID: <1d9d5540-5fe2-6897-1704-b296294afe6a@epam.com>
References: <20211122092825.2502306-1-andr2000@gmail.com>
 <20211122092825.2502306-2-andr2000@gmail.com> <YZtwj0OKrNaZ7s5X@Air-de-Roger>
 <f1aaedc6-73c5-e4ac-91c1-323f44d83687@suse.com>
In-Reply-To: <f1aaedc6-73c5-e4ac-91c1-323f44d83687@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fdcc31a3-77d3-4e5f-a8b0-08d9ada5dfbb
x-ms-traffictypediagnostic: AS8PR03MB6760:
x-microsoft-antispam-prvs: 
 <AS8PR03MB676050BC184DDBBD06C1AFB1E79F9@AS8PR03MB6760.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3fsJok7/W9Ia99cdgyGFpGDtyizpZkOD46CpgxQ8nf7nRJkkDJd8H6Ph3Gk8qs7vnHanMU/FYGrrDfmeHY1wvZLs6rFCrElKxwWRDWrW6e2L5DdhZ3OSj9iZeTkAvKWioGesPzQ1gbsU3dsMIQw+wCpYAkeqmmbUMYVm2CcvOXPFSLR/sftZsT8hn26DEvPmmRm9DNNCssHqDyyCaAcotR+kGOmCkSdwidoC0d3MnEjauytn+IzHy2EBGNwAfz90oCBKmnsdR0T24ArM+yye932ObTEEDJ0I0llESWazlAGMgN+aeBfnqfArIQsT8b9H5bISbM6tnd5K6OTVsK17SvntTMJGftb1DaPpRqavQuAUvSi15BvoaU2v7cR8BcKZQHQOsKPsXSYRb9LygWE6uOwPJcmaRj6F+/ugQsb8bf1wVTSjwgK1kG8PxMtqy7TJkrBGoWZ8y9i10BuLc3e52pGkzICUayBQUI78KRAR8o/MqxSU5tmfDmJlDPTbGhP+XK1Yu/zgSIN4a9AvgIKjPryfSi3IsWIcUD6WUq2bUyQdFWyKVerYIeAOKywjOSCj2K3XOPy6jPKEXIuJsEXK8Yp/IMIJfmy6PH5aCni7TWgiljxLXxdzRG3Wn2tq+Yo0CHoXKWDVKNZh4t4uS+IHx1O+njhF1Sq4qC1ugSlsnHmVlL7b7x2jUjbygVjTWihAlx3gfN0U8sq9zz0gbpxKK06hQX0HSa5F4++SFAa+deCltdUCs/f8ziagdip55C5U
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6512007)(186003)(53546011)(26005)(6486002)(316002)(38100700002)(122000001)(5660300002)(64756008)(36756003)(8936002)(66476007)(66556008)(66946007)(76116006)(2616005)(83380400001)(8676002)(2906002)(31696002)(38070700005)(31686004)(71200400001)(508600001)(107886003)(86362001)(66446008)(110136005)(54906003)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YzlySk8zRVNyVE9tZm0xOUJTWEMxa054a1RkK2V0SzRnYmM3ZzlmK3BOM3lH?=
 =?utf-8?B?ZkE2dE9iVGo4VGNiTmtEWDRqOW40MWtCcDVUckVkRTFXM2o1RThhUFVTSlov?=
 =?utf-8?B?UkRCVHR6aUtZU2dmR2ZPbVBpeGFVdzVveDg4OFI2Z05wb3RIOE9PL3JvQkdw?=
 =?utf-8?B?T2xsVmJjOElIU001dkZDbmNYYVZiSnRWLzRsczhrdktWeGNLdWRyWlBnclRu?=
 =?utf-8?B?OFFRaklydG1EZEJTSmhZTXE2cGJwaUZOY0Q0VjR3UmNNNmp1akpscW5UUHI3?=
 =?utf-8?B?V0o3YkFHT3NTNk9XMjRIam1rSE1tTkdyZTZueVdMZDI0N1JzWFlTaERYQVY3?=
 =?utf-8?B?Unkvd2NrVTd5clBYYVZXZEU5am1iY3pHQ09FTUZJOVdTSjZEbERZMjBNdUhI?=
 =?utf-8?B?VjdHaEtGa3NxdXJ4MWQwNlNZc3M2azhxOXpMRE1sb1E2cVNZMy9WcjhUWjZP?=
 =?utf-8?B?dEgvdmcrNTE4SFJjK1FuRVIxdWpWcDAzOWVBUWhSM2IxZm8xeHV6NDRCZDEw?=
 =?utf-8?B?bEZ0cVkvbVI2NUhseFZMYWdFQXNFeXpMbVJ2TC94SDF3c3RTNmYxVWdDZ25C?=
 =?utf-8?B?SUNadlBheCt5OWxCRE1sVkJaUzdETHBmeEQ5eHZPL3BuZmFpN3N2TjQyWlAw?=
 =?utf-8?B?MWNvQm5mY2ZCYktza3VHaytGUTlaK1RnUHdzSkczU0R3YjMrZDU0ZTVXdFc0?=
 =?utf-8?B?bXczUTNzU0Uya3ZWc3YrYkF1dkZWaGZoYjN2a21WS0VkR2xwRExXbjRjRE52?=
 =?utf-8?B?UHgxU2Z5eFFHNXc4Wi90QjBpaTVmelJjbGZIRC9pamJIR2ZWTnY5RW1rM3p2?=
 =?utf-8?B?ZjNRQjB4OWtFT2tUUEs5RVNBVlpla3o0MmNscG03cXpYVnlpcE1oM2RVZGRQ?=
 =?utf-8?B?WDB1VUMrV0hQRVd5ZW04SlN3VytwVkVRdjhZTVlVcUMxdGJCdlIrUWFZSVJJ?=
 =?utf-8?B?a3VNWHFGSDdYcllTYUlkZ014cUR6VEtaRTdkcWhiSllQSkNSZDYxdTZGOUdw?=
 =?utf-8?B?bVpFcEFlbWdGcytSZG5zRGtoblArcXRzblZnRVBFTmV2QVdadk43RTkrbjcy?=
 =?utf-8?B?d3ZFVjErbFZabFI1TWpxdERTWWJia1hCRTBoUWlTWFNaMVg3QzNBS1FIaC9u?=
 =?utf-8?B?cjNDSTNOSHlmOTFxYVhWcFhya29RK09YWUNtOXM4aU5ja0tvdUEwY295TTE4?=
 =?utf-8?B?T2praGRzSlJNUE51TElsLzcvajFEQ0thRm5laCtra3lENXp5d2RFcS94NUVI?=
 =?utf-8?B?ck9DL3ZFalEzcTdxR09zUDlKTFNCeHZaK1QxU2twZXozVGM5cUNkR3hxeHlH?=
 =?utf-8?B?ZGpQTi8ybWNHTkVZWkt3bGM0UnlWNEQ3NktiS2t1b1ZKWERuL1ZRQzMwNUNU?=
 =?utf-8?B?VGFFOWFlUmdyWVBDdXRqanNTZy9vQmwzOThDNkNWYmE0NU93SXlYblpSNVdQ?=
 =?utf-8?B?Z3RYeWYzbHdjMVFXR1k0UUpaYzJyRG5jUTg1ditUekhkbThpRHBxeVZ5WnBM?=
 =?utf-8?B?VUFYQnZXMllpZEhSbXI5ZzhIeWwrUFdCMXpLSVdrQ0pOcWFLMDNwa1RCM2Z3?=
 =?utf-8?B?VzJ1RVBqZkJLSzZMSTFHN08yRGUxTVNnS2ZmVnhhVmR4UXpEOE1ETStDbGt1?=
 =?utf-8?B?bzRwOUlLbno2eDlzMUwremxIK1d4dkRYeDNLZGFReDREM1MrTzZ2dWxsZk0w?=
 =?utf-8?B?T2xES3JRbVhtOXVuek9rUjJ2c2FWYmo3YUxDNStpUFUzTkNQdU9uTGZsMnI1?=
 =?utf-8?B?Y2ZzVkh2R3Z1ZXJVdk50QXl5RllJbXA3RndQN2oxcjRYVWFPSWxqSVBhVDJi?=
 =?utf-8?B?N0dtZERxb2lvZ3lHWTZBSjN0N2V4RC9LYXBrMjBndVFoSGs2VjZLS1JzOGRz?=
 =?utf-8?B?aUdrdnNYYVh4NDBLaXhGYTczZm9tRFRjVzFIdmo5RC8zeEw4OHA4OW9xSjBM?=
 =?utf-8?B?Sk02Y1IyUTZzTHhzRWFYMGZQNzl0R0lHNk9aVEJoallnRDRWOGdRK1B0S282?=
 =?utf-8?B?TXhDanE4bjlPdVBHcTNFN0hvZDlrSWNCd3oxbm9ZeDN1ei9wclRheTFCVFJj?=
 =?utf-8?B?TkpFa2E5aGZGY3lic3A3QUNwNEJKaWhNVUo0VUtBNXZsSHZRcEpsTkZ2dkVD?=
 =?utf-8?B?TkVPVmZMaTg5U3RnQ1NBTnRWeE5uUUZOREhMNjVFVUFmVGFzdXZJMDlHSm5K?=
 =?utf-8?B?dWxaSUNpd21lcy9NbkhDQ1grS2VjcWxpSDR4bHZ1NjhJUFFxWk12U09OVnVi?=
 =?utf-8?B?NkU3WHBhbUc0ZE9nRWt6b2JMQmN6ZWRCNXl5OG11UGJ3MkRXMzFlNE1DMUZO?=
 =?utf-8?B?QW4zYzh3VVI4a001UE1qaTJhK0FpVkluNWI1UERQWVEwZTBHODcyZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <571A6881FDF659498752E6E71947C57E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdcc31a3-77d3-4e5f-a8b0-08d9ada5dfbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2021 10:50:18.3616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NL1eQYwl8Ftoe01ZeH5C0N8FrESToORlhLChLP6yR80RwBD5+NUHodgD3LLBsEedpjRxZr1svhoN9NRGRxYGGcTh0rZSPz6VZ1Gc3Gv0Lbe3QCGGCwy0VohxN/YcyXCc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6760
X-Proofpoint-ORIG-GUID: n-QUKZtjSoWNx8U8HzVttZTYvxNd146G
X-Proofpoint-GUID: n-QUKZtjSoWNx8U8HzVttZTYvxNd146G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_04,2021-11-22_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111220056

DQoNCk9uIDIyLjExLjIxIDEyOjQzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjIuMTEuMjAy
MSAxMToyNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+IE9uIE1vbiwgTm92IDIyLCAyMDIx
IGF0IDExOjI4OjI1QU0gKzAyMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+
IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+PiArKysgYi94ZW4vZHJpdmVycy92
cGNpL2hlYWRlci5jDQo+Pj4gQEAgLTIwNiwxMiArMjA2LDE2IEBAIHN0YXRpYyB2b2lkIGRlZmVy
X21hcChzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwNCj4+PiAgIHN0YXRp
YyBpbnQgbW9kaWZ5X2JhcnMoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVpbnQxNl90IGNt
ZCwgYm9vbCByb21fb25seSkNCj4+PiAgIHsNCj4+PiAgICAgICBzdHJ1Y3QgdnBjaV9oZWFkZXIg
KmhlYWRlciA9ICZwZGV2LT52cGNpLT5oZWFkZXI7DQo+Pj4gLSAgICBzdHJ1Y3QgcmFuZ2VzZXQg
Km1lbSA9IHJhbmdlc2V0X25ldyhOVUxMLCBOVUxMLCAwKTsNCj4+PiArICAgIHN0cnVjdCByYW5n
ZXNldCAqbWVtOw0KPj4+ICsgICAgY2hhciBzdHJbMzJdOw0KPj4+ICAgICAgIHN0cnVjdCBwY2lf
ZGV2ICp0bXAsICpkZXYgPSBOVUxMOw0KPj4+ICAgICAgIGNvbnN0IHN0cnVjdCB2cGNpX21zaXgg
Km1zaXggPSBwZGV2LT52cGNpLT5tc2l4Ow0KPj4+ICAgICAgIHVuc2lnbmVkIGludCBpOw0KPj4+
ICAgICAgIGludCByYzsNCj4+PiAgIA0KPj4+ICsgICAgc25wcmludGYoc3RyLCBzaXplb2Yoc3Ry
KSwgIiVwcCIsICZwZGV2LT5zYmRmKTsNCj4+PiArICAgIG1lbSA9IHJhbmdlc2V0X25ldyhOVUxM
LCBzdHIsIFJBTkdFU0VURl9ub19wcmludCk7DQo+PiBZb3UgYXJlIHN0aWxsIG5vdCBhZGRpbmcg
dGhlIHJhbmdlc2V0IHRvIHRoZSBkb21haW4gbGlzdCwgYXMgdGhlIGZpcnN0DQo+PiBwYXJhbWV0
ZXIgcGFzc2VkIGhlcmUgaW4gTlVMTCBpbnN0ZWFkIG9mIGEgZG9tYWluIHN0cnVjdC4NCj4+DQo+
PiBHaXZlbiB0aGUgY3VycmVudCBzaG9ydCBsaXZpbmcgb2YgdGhlIHJhbmdlc2V0cyBJJ20gbm90
IHN1cmUgaXQgbWFrZXMNCj4+IG11Y2ggc2Vuc2UgdG8gbGluayB0aGVtIHRvIHRoZSBkb21haW4g
QVRNLCBidXQgSSBndWVzcyB0aGlzIGlzIGtpbmQgb2YNCj4+IGEgcHJlcGFyYXRvcnkgY2hhbmdl
IGFzIG90aGVyIHBhdGNoZXMgeW91IGhhdmUgd2lsbCBoYXZlIHRoZQ0KPj4gcmFuZ2VzZXRzIHBl
cm1hbmVudCBhcyBsb25nIGFzIHRoZSBkZXZpY2UgaXMgYXNzaWduZWQgdG8gYSBkb21haW4uDQo+
Pg0KPj4gTGlrZWx5IHRoZSBhYm92ZSByZWFzb25pbmcgKG9yIHRoZSBhcHByb3ByaWF0ZSBvbmUp
IHNob3VsZCBiZSBhZGRlZCB0bw0KPj4gdGhlIGNvbW1pdCBtZXNzYWdlLg0KSWYgSSBmb2xkIHRo
ZW4gdGhlcmUgaXMgbm8gcmVhc29uIHRvIGFkZCB0aGUgY29tbWVudCwgcmlnaHQ/DQo+IE9yLCBh
cyBhbHNvIHN1Z2dlc3RlZCBhcyBhbiBvcHRpb24sIHRoZW0gZ2V0dGluZyBhY2NvdW50ZWQgdG8g
dGhlIGRvbWFpbg0KPiBjb3VsZCBiZSBmb2xkZWQgaW50byB0aGUgcGF0Y2ggbWFraW5nIHRoZW0g
bG9uZy1saXZlZC4NCk9rLCBJIGNhbiBmb2xkIHRoaXMgcGF0Y2ggYW5kIGhhdmU6DQpAQCAtOTUs
MTAgKzEwMiwyNyBAQCBpbnQgdnBjaV9hZGRfaGFuZGxlcnMoc3RydWN0IHBjaV9kZXYgKnBkZXYp
DQogwqDCoMKgwqAgSU5JVF9MSVNUX0hFQUQoJnBkZXYtPnZwY2ktPmhhbmRsZXJzKTsNCiDCoMKg
wqDCoCBzcGluX2xvY2tfaW5pdCgmcGRldi0+dnBjaS0+bG9jayk7DQoNCivCoMKgwqAgaGVhZGVy
ID0gJnBkZXYtPnZwY2ktPmhlYWRlcjsNCivCoMKgwqAgZm9yICggaSA9IDA7IGkgPCBBUlJBWV9T
SVpFKGhlYWRlci0+YmFycyk7IGkrKyApDQorwqDCoMKgIHsNCivCoMKgwqDCoMKgwqDCoCBzdHJ1
Y3QgdnBjaV9iYXIgKmJhciA9ICZoZWFkZXItPmJhcnNbaV07DQorwqDCoMKgwqDCoMKgwqAgY2hh
ciBzdHJbMzJdOw0KKw0KK8KgwqDCoMKgwqDCoMKgIHNucHJpbnRmKHN0ciwgc2l6ZW9mKHN0ciks
ICIlcHA6QkFSJWQiLCAmcGRldi0+c2JkZiwgaSk7DQorwqDCoMKgwqDCoMKgwqAgYmFyLT5tZW0g
PSByYW5nZXNldF9uZXcocGRldi0+ZG9tYWluLCBzdHIsIFJBTkdFU0VURl9ub19wcmludCk7DQoN
Cj4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

