Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D683D7AE1D8
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 00:45:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608168.946503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkuK2-0000gb-PZ; Mon, 25 Sep 2023 22:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608168.946503; Mon, 25 Sep 2023 22:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkuK2-0000ei-MT; Mon, 25 Sep 2023 22:44:58 +0000
Received: by outflank-mailman (input) for mailman id 608168;
 Mon, 25 Sep 2023 22:44:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NadZ=FJ=epam.com=prvs=36323676f0=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qkuK0-0000eQ-Gp
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 22:44:56 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 250a59e3-5bf5-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 00:44:55 +0200 (CEST)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38PKds6H029004; Mon, 25 Sep 2023 22:44:37 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3tbcpb17s6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Sep 2023 22:44:37 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by PAWPR03MB10071.eurprd03.prod.outlook.com (2603:10a6:102:362::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 22:44:33 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076%4]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 22:44:33 +0000
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
X-Inumbo-ID: 250a59e3-5bf5-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7DLkEDmUCHuBu89IOuDPNwhevWe7NdkazX1murk+OMBCpjOkvHtKbqC9o6eyjr1TXM1EJXcqlSh+cyEBbn3jdi4z0JXO+ar2iKIIezX2FZ3fOnZIKaDBJYkhhTzX35lrDtbpfElnSkVfMkrypKh6I8FuIPQoPDVR+AtRTxGTyP5xzVcHlBU7QpBIsvjM04i/Vcv95Dlv1TwWwd7J7qVH0Cc8UofjiVnpWlYf8g6CczXPOiwsNuc00MQ9PO1abTUrZr/fTqKIVSgchod7gq6G8hZL2lECzrgyS0LU6CbtAMo6kR4iu+yvbsCR3eCESDnAwyDRTr4VYAAymg/QyUYbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxHux67opKt9joI8KxHRG9cAZ5QtG+PKsF6yLYmOPZo=;
 b=blRCtq7eOZaSjhoaXX7m3hjVSbO+UD0dBB0YnY8UiLID0+/NGbDmAnKaix/E8AAP4nu3pbIijZ2K/KB27+7nlqU9F4zugilWZCu7PDB+m5h/v2u/ouM7Bdv1H7UDHCqDUxBgKoEXZvobI1aMS1bCEHUpF2IOib39zxVdIvcGZOluhl8LX1uy25+rufcojsCYBzglWNOm+ZcKLE8KtFWPnf74C1NslvVzYUKd2sbXaRero7StETDa6c1XQT5cwt973wXzHOyupKXMyE31Fus/FvBqFgM1M+P8OgrGofG2qxCFGMMFGomuucBsudizG4Ev6rqIz6EsoB/5We7fkVFAzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxHux67opKt9joI8KxHRG9cAZ5QtG+PKsF6yLYmOPZo=;
 b=F4RQtn/Gv5UnPP2ezLSdr6BphB+gZWHCub6p4ScZIG9EqnFjlvQ92lz1S/x4QG5t1HfComsPPAVNrHpQFafyOHp4bYpavQw0C2SwjyROxNQm4rUXZx1cNkWGmnfHtv8TkSgwfK6QLN1SaDxa10/NOGinv5qwwEMTwXLRul/Y3uOrkwx89G+AUyHh2XdEf0FAlSQARdSLJGuaq3gfIKCZEOb6Dgd41OUFUttCvD0QbeeQ5M4Qg5kfglQKdMKGF2+AaoO+McLB6aqMi5+8lpgrXoWArpR3HS3JluwjpdaPANN6CYhn6q2VLlqoUZrLQhr7l7xrxQeMwZDJXK5VbecJYg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stewart
 Hildebrand <stewart.hildebrand@amd.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        Paul Durrant
	<paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v9 01/16] pci: introduce per-domain PCI rwlock
Thread-Topic: [PATCH v9 01/16] pci: introduce per-domain PCI rwlock
Thread-Index: AQHZ2s9KWF3JKCAv4U2Fm0C+oJYn+LAiUDyAgAn8FQA=
Date: Mon, 25 Sep 2023 22:44:32 +0000
Message-ID: <878r8teuup.fsf@epam.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-2-volodymyr_babchuk@epam.com>
 <ZQmro968jYGOb5sY@MacBookPdeRoger>
In-Reply-To: <ZQmro968jYGOb5sY@MacBookPdeRoger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|PAWPR03MB10071:EE_
x-ms-office365-filtering-correlation-id: 8859ec79-b98f-4b5e-865e-08dbbe18fc95
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 AMFzNZXgHmYj0KLwOqA7UG+Mo12JDdPtf/H2PqQQn0CVCMN8qH/k1LvHjjMvYRbdXNDXJdydUY8I1zKKsxpqsnd6EUFC2jxndvJV8mXKZFJ0SagGBFhF7O2JQNUwMHu4EQQz5l9tNTF0jdpL8mlqxosg9uBm5zjMwtR0JuYOYyDZ2WXwBJfZZeO/b7TXMKabiltfW1DmiaA8CbW3tPxESbnf/KPEjgWbxLAurJNCwYjF6SVwGTvXLgZ+NGNEsl96WCmwhFWHVFvmTQCtg4AD6FPiXl9tIa6URxWc+6JcFKjhlE0Oi/QbXG2HlCPx2qTG5dU9aHoilQn2jWnRGwzotInpmayHWxpJTV3k/Hp1ZSzf3W1IvAaOfy0nf15WDHD0PDCaoMJfhBstqwdTfcauMQ+QleVnJnJ4WJSfOTB2O1PFCgb9PxtUJpFVHCtYvVZpIbYIIvrt7z1uO9egMlkrAnRQZKxFSRjCCtt6+VqPjrZIiaw0iUbxp4QcbbFAJFy1N8A4l+qxePTNw+TDMAvQwCE9nZeWYRB++0N+k8xeEIIrWhu9eW6TtG6yKJ4vPZwWJErwV12aIQTYlKjVQaOhpmP/Ev5O/lYD2yC52uJbmKYS3mdBmQo8GTypmYmiwA2a
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(136003)(346002)(396003)(230922051799003)(451199024)(1800799009)(186009)(38070700005)(38100700002)(478600001)(83380400001)(6512007)(55236004)(26005)(2616005)(6506007)(6486002)(122000001)(71200400001)(91956017)(4326008)(8936002)(8676002)(76116006)(5660300002)(6916009)(66476007)(66556008)(41300700001)(66946007)(54906003)(64756008)(7416002)(2906002)(36756003)(86362001)(66446008)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eE1GL00wdU13Y3JyZ1dublQzckJVSHg2QisrTFhZTm1iNytDcjhQdW5veHh6?=
 =?utf-8?B?WGJDeE5JZFllTCtZdW00di9tWDRCbDc5WkJ6bU5pUENhaTV0a3l3YU50eW5B?=
 =?utf-8?B?cDRvQjJEY3FhTUxNY2I1YUpNQjZjeElJRUpoZ0kyenhWWFRZWlJLVk9rZDVw?=
 =?utf-8?B?RERKWkFsWWtuT0c2Sjk4SHcwL1dna2RZc3lpMWFsZUpIcVVYUlJSQXNSaXNx?=
 =?utf-8?B?QXREK01xcTl5Y25tNHVhaVZWaVBFMGd1dmNrYXFRdHlqMzlOZ3FrNUltdjB2?=
 =?utf-8?B?aldhalo3MTZyK0lXdXpxL0JFZ3g5VnlNblpSVnlxMk9GbTNHMGRUbzA2YVJF?=
 =?utf-8?B?SG04Mnpkcm1GSlkzMS81RU9pb3B5QUMxejdBYTRwM2lkdHFBaWpOQWZiUm5I?=
 =?utf-8?B?N1FuVGtrUnZJN2VKdjZSQytKWE54UVZDTGdkRWZ1NElhdEJjQ2dmdHN2YkdE?=
 =?utf-8?B?a1YxU0pUYzdDc2xHN0ZqVE5zZTBVcVJnRHptMG1sWDRZTFdQSDNBTWxabnY2?=
 =?utf-8?B?WXlEelJJUWpyVkdPczhBcnhuRnlTVitxR2EwaWIwNlo4ZklkMkhXcmxjak1G?=
 =?utf-8?B?VXkzVU10clhVeE1wMUdjVTh6eElFc2pYdTd0UnpLQUw3NVkvSkVtSVN2c0tV?=
 =?utf-8?B?T3ovVEdsQ0ZUNHp3RWZvclBDSHptUTlGc0MrVmdNYlRqTlB3VGRaMzhPNVRW?=
 =?utf-8?B?clZDb0doNmg5UGRyN2gvSHlpV0s4L041ZFhPeUtnSzA4ZmptUGg2S3JLNkkw?=
 =?utf-8?B?TDcxTVR2bVlERVAvMmFQcjV1dUhyYVV4NXRKd1l0N2loMnFSTURQckFWWmxJ?=
 =?utf-8?B?NXdWNlFFN29EbUxDQzRBRnhhZjI5ODlFSy9ER2d2dVpEWGRZQlNYNFpINHJZ?=
 =?utf-8?B?SXk0SlhGSE9vc0hMaHBiOG5HeDA4L0FpYkRpZFVkRWt1RjVwUk10bXVyZVZa?=
 =?utf-8?B?WE5PNENZNnVPZFRhTkIraUM4NzlsZXBmSStJR2hLYTFCS1NxQk85R3RhdHp3?=
 =?utf-8?B?ei9HUk02b0x3M2RWai93VnFYbS9HeW05cFNMV2VYTSt5Q1orcEJVaXExSmt5?=
 =?utf-8?B?eXg5elRNSllMWEZjSklCUFRuUVdFSkkxaythMjU0cjFZaTA0OTF4VFp0Q3R4?=
 =?utf-8?B?encrdi9UYXV4WXFveDh0MDJFSGtKVzVMM3UvZlNTOFM5bWo2aXVMcXIybmk4?=
 =?utf-8?B?WHhXaFgvQko2ekdzYkZhVjBLU2U0eGkwK2kybk43cytra3NhYk9oTXg4dkdx?=
 =?utf-8?B?UDV6cVA3ZWN5MXE0TDh4WDlsNzczYTJTczB0NjBTNlV3ZlE4RWdyTWVSMkxQ?=
 =?utf-8?B?dExkbGw2c3h5OVhvNGI3cGt5QWVqbm5WQVZZaExiNCtPOGVjcnQ3ZStmMUww?=
 =?utf-8?B?S2h6WE81QTZzb0J2WFBiZ0ZlVGJjYWpzQzZRTU5WaXYzd3lZSm10OFdMZDcr?=
 =?utf-8?B?dE9DRWp3elJsbkxyeDJ1VXRxeE1qeENrVkY1M1JRQy9ZNFFKN3JpNFFwQ2Uw?=
 =?utf-8?B?cE5lOExYQnNYTVFyOUtKcVRYbGh3K0J6NWpDam1BOGZzUHM5eDVWUDlOTG5N?=
 =?utf-8?B?ZUM1L2FRZ0Z5dDJHakgwelgyUTUyK3pWN1ZsN052SUUxN3FkUDZvZmpBbzVT?=
 =?utf-8?B?S2hkeWpLVnJPaEJ5UnFnc0Z0M0tsUDlSa0g4Yy9VeWxxSTcrcGJQTS82a0g5?=
 =?utf-8?B?b0NiWGxOMXFTb0dLb2d6ejBlR20yYVluZ0tuSS93Rk1RMExEV0dBMW5MOHNw?=
 =?utf-8?B?NTUrSDBSVDRwTytic0tKWWs3U1crc0FuOTI1cnF3emNlY1RWcGhBcm4vdkJE?=
 =?utf-8?B?ckZGRWpDTmV2dG9uek1kUUl6L25yRUtubUo5dkZNWWgzaU9uaEFzVWYxRnRF?=
 =?utf-8?B?UUQrdVJmWXpndVV3S0orZ2pTWG5oVFBGL0lkdHFWYzZ6WSt2aGswbmlzSy9w?=
 =?utf-8?B?eVRJdFZVemJKanY5UTg4OUFqdTNSL1haeE04Z2Y1cW9LWXc2bW52WGZzNndN?=
 =?utf-8?B?UVNWNjc1V0xxL1lBR1UxNUJwVDd0NG0zYXBLOVZSMk5WS2VSeVlVdEJkN081?=
 =?utf-8?B?K1RUODlTK1A3VENqWDZud3hONkNKbGRIWnRtUWYxU1hVK0tBa04zMVk4dFho?=
 =?utf-8?B?OXE0OEdEK2l0aUtLc25La0V2b3U2Sml1WmZid0JBNnlEWGhTd1gvZm0wRXo4?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5585DFABF9F00D42BAFF912FFB07EDD3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8859ec79-b98f-4b5e-865e-08dbbe18fc95
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 22:44:32.8724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WtHYPu8B4u/iP4ZGE0Eri91P5maAdyiDfm3Ckyo+JM8hDTJ0JLKGSmqmUmFiL1RdjlCPZjakjsBIYc25o3fLz8eTctIIJE+iubanSO06uMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB10071
X-Proofpoint-GUID: jiORYngfcMZgwoVDaseaYhj-bRrw8YWt
X-Proofpoint-ORIG-GUID: jiORYngfcMZgwoVDaseaYhj-bRrw8YWt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-25_18,2023-09-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 clxscore=1011 mlxscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309250175

DQpIZWxsbyBSb2dlciwNCg0KUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
IHdyaXRlczoNCg0KPiBPbiBUdWUsIEF1ZyAyOSwgMjAyMyBhdCAxMToxOTo0MlBNICswMDAwLCBW
b2xvZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+IEFkZCBwZXItZG9tYWluIGQtPnBjaV9sb2NrIHRo
YXQgcHJvdGVjdHMgYWNjZXNzIHRvDQo+PiBkLT5wZGV2X2xpc3QuIFB1cnBvc2Ugb2YgdGhpcyBs
b2NrIGlzIHRvIGdpdmUgZ3VhcmFudGVlcyB0byBWUENJIGNvZGUNCj4+IHRoYXQgdW5kZXJseWlu
ZyBwZGV2IHdpbGwgbm90IGRpc2FwcGVhciB1bmRlciBmZWV0LiBUaGlzIGlzIGEgcnctbG9jaywN
Cj4+IGJ1dCB0aGlzIHBhdGNoIGFkZHMgb25seSB3cml0ZV9sb2NrKClzLiBUaGVyZSB3aWxsIGJl
IHJlYWRfbG9jaygpDQo+PiB1c2VycyBpbiB0aGUgbmV4dCBwYXRjaGVzLg0KPj4gDQo+PiBUaGlz
IGxvY2sgc2hvdWxkIGJlIHRha2VuIGluIHdyaXRlIG1vZGUgZXZlcnkgdGltZSBkLT5wZGV2X2xp
c3QgaXMNCj4+IGFsdGVyZWQuIFRoaXMgY292ZXJzIGJvdGggYWNjZXNzZXMgdG8gZC0+cGRldl9s
aXN0IGFuZCBhY2Nlc3NlcyB0bw0KPj4gcGRldi0+ZG9tYWluX2xpc3QgZmllbGRzLg0KPg0KPiBX
aHkgZG8geW91IG1lbnRpb24gcGRldi0+ZG9tYWluX2xpc3QgaGVyZT8gIEkgZG9uJ3QgdGhpbmsg
dGhlIGxvY2sNCj4gY292ZXJzIGFjY2Vzc2VzIHRvIHBkZXYtPmRvbWFpbl9saXN0LCB1bmxlc3Mg
dGhhdCBkb21haW5fbGlzdCBmaWVsZA0KPiBoYXBwZW5zIHRvIGJlIHBhcnQgb2YgdGhlIGxpbmtl
ZCBsaXN0IGluIGQtPnBkZXZfbGlzdC4gIEkgZmluZCBpdCBraW5kDQo+IG9mIG9kZCB0byBtZW50
aW9uIGhlcmUuDQoNCllvdSBhcmUgY29ycmVjdC4gSSB3YXMgcmVmZXJyaW5nIHZlcnkgc3BlY2lm
aWMgY2FzZSBpbiByZWFzc2lnbl9kZXZpY2UoKQ0KSU9NTVUgZnVuY3Rpb25zLiBJdCBzZWVtZWQg
aW1wb3J0YW50IGZvciBtZSB3aGVuIEkgd3JvdGUgdGhpcy4gQnV0IHlvdQ0KYXJlIGNvcnJlY3Qs
IG5vIG5lZWQgdG8gbWVudGlvbiBwZGV2LT5kb21haW5fbGlzdCBleHBsaWNpdGx5Lg0KDQo+DQo+
PiBBbGwgd3JpdGUgYWNjZXNzZXMgYWxzbyBzaG91bGQgYmUgcHJvdGVjdGVkDQo+PiBieSBwY2lk
ZXZzX2xvY2soKSBhcyB3ZWxsLiBJZGVhIGlzIHRoYXQgYW55IHVzZXIgdGhhdCB3YW50cyByZWFk
DQo+PiBhY2Nlc3MgdG8gdGhlIGxpc3Qgb3IgdG8gdGhlIGRldmljZXMgc3RvcmVkIGluIHRoZSBs
aXN0IHNob3VsZCB1c2UNCj4+IGVpdGhlciB0aGlzIG5ldyBkLT5wY2lfbG9jayBvciBvbGQgcGNp
ZGV2c19sb2NrKCkuIFVzYWdlIG9mIGFueSBvZg0KPj4gdGhpcyB0d28gbG9ja3Mgd2lsbCBlbnN1
cmUgb25seSB0aGF0IHBkZXYgb2YgaW50ZXJlc3Qgd2lsbCBub3QNCj4+IGRpc2FwcGVhciBmcm9t
IHVuZGVyIGZlZXQgYW5kIHRoYXQgdGhlIHBkZXYgc3RpbGwgd2lsbCBiZSBhc3NpZ25lZCB0bw0K
Pj4gdGhlIHNhbWUgZG9tYWluLiBPZiBjb3Vyc2UsIGFueSBuZXcgdXNlcnMgc2hvdWxkIHVzZSBw
Y2lkZXZzX2xvY2soKQ0KPj4gd2hlbiBpdCBpcyBhcHByb3ByaWF0ZSAoZS5nLiB3aGVuIGFjY2Vz
c2luZyBhbnkgb3RoZXIgc3RhdGUgdGhhdCBpcw0KPj4gcHJvdGVjdGVkIGJ5IHRoZSBzYWlkIGxv
Y2spLiBJbiBjYXNlIGJvdGggdGhlIG5ld2x5IGludHJvZHVjZWQNCj4+IHBlci1kb21haW4gcnds
b2NrIGFuZCB0aGUgcGNpZGV2cyBsb2NrIGlzIHRha2VuLCB0aGUgbGF0ZXIgbXVzdCBiZQ0KPj4g
YWNxdWlyZWQgZmlyc3QuDQo+PiANCj4+IEFueSB3cml0ZSBhY2Nlc3MgdG8gcGRldi0+ZG9tYWlu
X2xpc3Qgc2hvdWxkIGJlIHByb3RlY3RlZCBieSBib3RoDQo+PiBwY2lkZXZzX2xvY2soKSBhbmQg
ZC0+cGNpX2xvY2sgaW4gdGhlIHdyaXRlIG1vZGUuDQo+PiANCj4+IFN1Z2dlc3RlZC1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+PiBTdWdnZXN0ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IFZvbG9keW15
ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4NCj4+IA0KPj4gLS0tDQo+PiAN
Cj4+IENoYW5nZXMgaW4gdjk6DQo+PiAgLSByZXR1cm5lZCBiYWNrICJwZGV2LT5kb21haW4gPSB0
YXJnZXQ7IiBpbiBBTUQgSU9NTVUgY29kZQ0KPj4gIC0gdXNlZCAic291cmNlIiBpbnN0ZWFkIG9m
IHBkZXYtPmRvbWFpbiBpbiBJT01NVSBmdW5jdGlvbnMNCj4+ICAtIGFkZGVkIGNvbW1lbnQgYWJv
dXQgbG9jayBvcmRlcmluZyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UNCj4+ICAtIHJlZHVjZWQgbG9j
a2VkIHJlZ2lvbnMNCj4+ICAtIG1pbm9yIGNoYW5nZXMgbm9uLWZ1bmN0aW9uYWwgY2hhbmdlcyBp
biB2YXJpb3VzIHBsYWNlcw0KPj4gDQo+PiBDaGFuZ2VzIGluIHY4Og0KPj4gIC0gTmV3IHBhdGNo
DQo+PiANCj4+IENoYW5nZXMgaW4gdjggdnMgUkZDOg0KPj4gIC0gUmVtb3ZlZCBhbGwgcmVhZF9s
b2NrcyBhZnRlciBkaXNjdXNzaW9uIHdpdGggUm9nZXIgaW4gI3hlbmRldmVsDQo+PiAgLSBwY2lf
cmVsZWFzZV9kZXZpY2VzKCkgbm93IHJldHVybnMgdGhlIGZpcnN0IGVycm9yIGNvZGUNCj4+ICAt
IGV4dGVuZGVkIGNvbW1pdCBtZXNzYWdlDQo+PiAgLSBhZGRlZCBtaXNzaW5nIGxvY2sgaW4gcGNp
X3JlbW92ZV9kZXZpY2UoKQ0KPj4gIC0gZXh0ZW5kZWQgbG9ja2VkIHJlZ2lvbiBpbiBwY2lfYWRk
X2RldmljZSgpIHRvIHByb3RlY3QgbGlzdF9kZWwoKSBjYWxscw0KPj4gLS0tDQo+PiAgeGVuL2Nv
bW1vbi9kb21haW4uYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsNCj4+ICB4ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jIHwgIDkgKystDQo+PiAgeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgICAgICAgICAgICAgICB8IDcxICsrKysrKysrKysrKysr
KysrLS0tLQ0KPj4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jICAgICAgICAg
fCAgOSArKy0NCj4+ICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCAgICAgICAgICAgICAgICAgICAg
IHwgIDEgKw0KPj4gIDUgZmlsZXMgY2hhbmdlZCwgNzggaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRp
b25zKC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RvbWFpbi5jIGIveGVuL2Nv
bW1vbi9kb21haW4uYw0KPj4gaW5kZXggMzA0YWEwNGZhNi4uOWIwNGEyMDE2MCAxMDA2NDQNCj4+
IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMNCj4+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMN
Cj4+IEBAIC02NTEsNiArNjUxLDcgQEAgc3RydWN0IGRvbWFpbiAqZG9tYWluX2NyZWF0ZShkb21p
ZF90IGRvbWlkLA0KPj4gIA0KPj4gICNpZmRlZiBDT05GSUdfSEFTX1BDSQ0KPj4gICAgICBJTklU
X0xJU1RfSEVBRCgmZC0+cGRldl9saXN0KTsNCj4+ICsgICAgcndsb2NrX2luaXQoJmQtPnBjaV9s
b2NrKTsNCj4+ICAjZW5kaWYNCj4+ICANCj4+ICAgICAgLyogQWxsIGVycm9yIHBhdGhzIGNhbiBk
ZXBlbmQgb24gdGhlIGFib3ZlIHNldHVwLiAqLw0KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9hbWQvcGNpX2FtZF9pb21tdS5jDQo+PiBpbmRleCBiZWE3MGRiNGI3Li5kMjE5YmQ5NDUzIDEw
MDY0NA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUu
Yw0KPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYw0K
Pj4gQEAgLTQ3Niw3ICs0NzYsMTQgQEAgc3RhdGljIGludCBjZl9jaGVjayByZWFzc2lnbl9kZXZp
Y2UoDQo+PiAgDQo+PiAgICAgIGlmICggZGV2Zm4gPT0gcGRldi0+ZGV2Zm4gJiYgcGRldi0+ZG9t
YWluICE9IHRhcmdldCApDQo+PiAgICAgIHsNCj4+IC0gICAgICAgIGxpc3RfbW92ZSgmcGRldi0+
ZG9tYWluX2xpc3QsICZ0YXJnZXQtPnBkZXZfbGlzdCk7DQo+PiArICAgICAgICB3cml0ZV9sb2Nr
KCZzb3VyY2UtPnBjaV9sb2NrKTsNCj4+ICsgICAgICAgIGxpc3RfZGVsKCZwZGV2LT5kb21haW5f
bGlzdCk7DQo+PiArICAgICAgICB3cml0ZV91bmxvY2soJnNvdXJjZS0+cGNpX2xvY2spOw0KPj4g
Kw0KPj4gKyAgICAgICAgd3JpdGVfbG9jaygmdGFyZ2V0LT5wY2lfbG9jayk7DQo+PiArICAgICAg
ICBsaXN0X2FkZCgmcGRldi0+ZG9tYWluX2xpc3QsICZ0YXJnZXQtPnBkZXZfbGlzdCk7DQo+PiAr
ICAgICAgICB3cml0ZV91bmxvY2soJnRhcmdldC0+cGNpX2xvY2spOw0KPj4gKw0KPj4gICAgICAg
ICAgcGRldi0+ZG9tYWluID0gdGFyZ2V0Ow0KPg0KPiBXaGlsZSBJIGRvbid0IHRoaW5rIHRoaXMg
aXMgc3RyaWN0bHkgYW4gaXNzdWUgcmlnaHQgbm93LCBpdCB3b3VsZCBiZQ0KPiBiZXR0ZXIgdG8g
c2V0IHBkZXYtPmRvbWFpbiBiZWZvcmUgdGhlIGRldmljZSBpcyBhZGRlZCB0byBkb21haW5fbGlz
dC4NCj4gQSBwYXR0ZXJuIGxpa2U6DQo+DQo+IHJlYWRfbG9jayhkLT5wY2lfbG9jayk7DQo+IGZv
cl9lYWNoX3BkZXYoZCwgcGRldikNCj4gICAgIGZvbyhwZGV2LT5kb21haW4pOw0KPiByZWFkX3Vu
bG9jayhkLT5wY2lfbG9jayk7DQo+DQo+IFdvdWxkbid0IHdvcmsgY3VycmVudGx5IGlmIHRoZSBw
ZGV2IGlzIGFkZGVkIHRvIGRvbWFpbl9saXN0IGJlZm9yZSB0aGUNCj4gcGRldi0+ZG9tYWluIGZp
ZWxkIGlzIHVwZGF0ZWQgdG8gcmVmbGVjdCB0aGUgbmV3IG93bmVyLg0KDQpBZ3JlZS4gSSBtb3Zl
ZCBgcGRldi0+ZG9tYWluID0gdGFyZ2V0YCBzbyBpdCBzaXRzIGJldHdlZW4gbGlzdF9kZWwoKSBh
bmQNCmxpc3RfYWRkKCkgY2FsbHMNCg0KDQotLSANCldCUiwgVm9sb2R5bXly

