Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6034B49FA4B
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 14:04:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261992.453960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDQuw-0000lo-6x; Fri, 28 Jan 2022 13:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261992.453960; Fri, 28 Jan 2022 13:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDQuw-0000jJ-3P; Fri, 28 Jan 2022 13:03:54 +0000
Received: by outflank-mailman (input) for mailman id 261992;
 Fri, 28 Jan 2022 13:03:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PBCP=SM=epam.com=prvs=402709c4a7=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nDQuv-0000jD-89
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 13:03:53 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc8ab71b-803a-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 14:03:51 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20SCwDNL001040;
 Fri, 28 Jan 2022 13:03:48 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dvgp3g8sx-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 13:03:47 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB7PR03MB4811.eurprd03.prod.outlook.com (2603:10a6:10:30::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Fri, 28 Jan
 2022 13:03:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.018; Fri, 28 Jan 2022
 13:03:39 +0000
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
X-Inumbo-ID: bc8ab71b-803a-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYPkp2wotfJH6v0xQwfAJiwZ9sn0mUDgPuvEiLMStuO8UAoRx4Ep/wy/3feRZjNfXOKD7nhASpykX1Vj/EFMLa+4Wm40p5MevQxs3osN7bT32dVdbIx+MSWtJIEl3AYhB41ObrkuIFNJwUZ9oGefbpFVLwoOSS00EwkYg7mgdV4boVA7JLgWPKJiUFvL8F60xFvMYGkrA3MIjWE6NzS9pxpbjy4Z+yxStZLBzf8IlsVT7R3xrA99W++KI2p2kzsKXw2TrRtHibwFRNT4y+sR7Bv1kDHRHX2aAJg4j1yMPUji0it+IgWxAOzNlWQWivePcPPeMibqzGGrSY2gM5/kNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXSRjk22+M9ygXSnobb9qzA0KqtxZcN9yE8wzySD7oU=;
 b=MtWzuMlH6VxIEfjh9YVyIpGbak1OS3loUPXH6HC8pYCN6qCrM/SPAONwV6bPKy07qTmCZ9Iu/cvsEeqAcuVj56OC4S6XS+UkK+YtU4DtlP3+OHrdKxPscgGpc5yXp14bEOZj5JQOfiFyt7RzbKlZ435D1IOfung91OEofRT1qcZnRamvl05KFJhA9gkVaycHKvZDEhhn9A+4moXAauJWrq7CrVfEbryGvd8SX0yjJwZVr8KCSIElNclsvI7HKAJXm81+hobWOeJbgdSzCzFZGVTPZN+wNQB2o561o0b6vRF+EWJVr2OFblo3WZ4xolYm3+zKBhDrxLEk0fXDw0r/qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXSRjk22+M9ygXSnobb9qzA0KqtxZcN9yE8wzySD7oU=;
 b=J1/l0LGvMamGYSy7hiI6NWGYQL6PUVk7llslkz4eYeryNkcLr9KvhVlXyUuU2x0FcSp4SqiturYkzs+regmeCzVZj0xAmxGguLeThQ/YjtCC4hZWCV0K8hcR5X1lAJTnHhRws3oLiTSkISA/v83ch+//NQWGaU9uEMD7sXH7wrqvoVfivmJqcu6ToBQi84sr3dTj4SC7PaDEVC+lIDDkcolwajheb0VzrccO0c5lw8//FmIwpNIw34BVydXIpr5Rjz3GVr6Swrv7CpcPo8RCUFTwYc2s9OX+7PJhAbmsMYp15ToPmHKLwaoOz3OnfTbe/SVg+CH/uKCXJ1b/xz34fg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
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
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 14/14] vpci: add TODO for the registers not explicitly
 handled
Thread-Topic: [PATCH v5 14/14] vpci: add TODO for the registers not explicitly
 handled
Thread-Index: AQHX4ewNiPcRmuDEOU6R/33b+PKQzqwUGDwAgE0mpACAAALxAIAXiUaA
Date: Fri, 28 Jan 2022 13:03:39 +0000
Message-ID: <4796e3f2-a472-f5b6-2841-5590407efd92@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-15-andr2000@gmail.com>
 <892d6148-e98f-def2-121b-922f1215a442@suse.com>
 <YeAo1sNve2iaJuzb@Air-de-Roger>
 <410f27c7-ed38-c1ff-ec2a-2ffd32e6751f@suse.com>
In-Reply-To: <410f27c7-ed38-c1ff-ec2a-2ffd32e6751f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6c1eada-3a23-4a32-0668-08d9e25e9ab4
x-ms-traffictypediagnostic: DB7PR03MB4811:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB4811674E6B39F20D94DED0D0E7229@DB7PR03MB4811.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RTB8efPHjErKTw5N90q6AOrX8C+lZLnbzKHa3iZoMECMB/A5rWZGjC3+8o0nQuXTIIEIaulskI5P2L1Ndj73Ztyeqq6Se0y6k4twl/uEwtRstr1lBsyY/A2YBHrRiAxxG5+NGK6hwwEyK8+y7Ts28HiPcQWDuRB8JfQlhmjcMIlmxmX+ojQ76GGxR3ZVBpGcO8mg5QGdoRF4eWdbkUl3GlJ7euRU1nrkTYmvEtwz6//cily+0Dqr9WIad/kleoJE86kYkq4/uhqXPqgm0bcPY80YH00OPdsbaZGbv55Un81GspevGfQ8xhCHpAKzDzxO2ZQpPK7V3XQofemPL7OoHSXlTjLc3celxptJZsKQCZRx9rel3MZlQio9qfllEvIVhaIwUqDtDvLbFIDb4XX321RF4jBBW571GHKzBM2WT9tIczbcOTPr8iPZCSo3Fa532w9dq4jYO1SfiO1mVCn6FV6lsOOoS1svroQ75bIC3D8+su94EuEl4wUGWWlPk2x+/5euNiZAUD5ySmQBiZAS8xXg5OO8UqLX+07PjksYMRs8RV8XpP3moAM5LumOHLtJzsaI51vLy/PpUfxWWsqDZZnipW209T8GjIwd0ZST84CVcG6F4/N/eZICDy1vQE4WWeEl6/FWkctY8LwUwvn0p6A8mADi/vdsAThDv/yfQWgz2rrwk7Rh2ekeb7g3gOrJpcxBE1nEieQcVAoZUjHaUoz04x358AlNH9gdPgsDpb1qsE96tvk86oZJg/pwE/Bi
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7416002)(122000001)(36756003)(31686004)(66446008)(2906002)(66556008)(66946007)(64756008)(66476007)(8676002)(91956017)(5660300002)(4326008)(8936002)(38100700002)(76116006)(53546011)(86362001)(83380400001)(38070700005)(316002)(6486002)(54906003)(110136005)(26005)(186003)(6512007)(2616005)(31696002)(71200400001)(508600001)(6506007)(107886003)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZUY3NjlIYi96VlFlWmJLSXF4TWtZTjN0SnhMRXZiT0QvK0xjaVFnS0E4ZDc3?=
 =?utf-8?B?RFpSS2p6YUZmRE1YdFFGT0hUYVkzWFg5c3hCdGFCcjZ6ZTFWU3VzVHdPc1ZC?=
 =?utf-8?B?Z2FNWHI1MmdIRVpld253elViU1YxcklrQk5hSkZwQmlnZGdsVVM0VXNKTlZm?=
 =?utf-8?B?YnorWG1vMTQ0QThTdmZnL1NCcUloYm9ra0VGNk11VTlneGpCeWExSFRJdU9k?=
 =?utf-8?B?bnpCN2lXYjd6RVlZNWQ2VCtXU1Y4TEJ3UmFSSmxGV1I1b3NzNittUnp0Rmoz?=
 =?utf-8?B?bHlVTnlsWGtkVkVYRzFpQVZ3VVRrUFN6UE5KMkl3RUoyTWdmNCt3NjJzTXdo?=
 =?utf-8?B?V2NXeEg3dEpJald5TmIvM291UHZ1MWtEekhoR1lKTU1iRHVWMkZMbklmV1Ez?=
 =?utf-8?B?enpxcVBmYll3VlptOEFjSENLd2VXelFFbk5vczhVdUUrUzNQRXRaVjJ0Q0RU?=
 =?utf-8?B?S1Ixc0I1bXgvNXR5L1dydXhNaDluN2p2Qm9OT0tlTWJkMzlOUlRWbWE3d0s0?=
 =?utf-8?B?SWF5VUFVdEdvWXRZWEF4OVgwTjVveWo5OHdVTlV1dm5TZmVGRWt0WWhVZFhs?=
 =?utf-8?B?T2EyQk1sVVFXTCtyM0tONHZxNnRuSmdGeXpDVlZ5dnp1TTE4VjhVeGJxZXI2?=
 =?utf-8?B?UC9KZ2xaNUNFY3J1OVViVkVlN0s2b0pXUVpreEIyUU1hZHVUaEE4bTN2VHY1?=
 =?utf-8?B?OVJHc2piWjMxazE0SXJ0RGVLM3grbHRVeDFYOHFteVRTaGtjNGtrU0dLRlJj?=
 =?utf-8?B?L3lsWmJ4K0MwbE5iNTRoMXAyTlp5VTZ0eXVpZlhJdi95d1RCYSs0YWtkY3c3?=
 =?utf-8?B?K0o3KytUNGNzWGF1bmU2c25rMlR0a0Yrb0tpT3VKbklDMUJLdmZ2blJZVnVa?=
 =?utf-8?B?Q2V5dW1tUzBGWUxvUDYrRk0yVXF1SWFaNVN5bFBWZjdkeGhVUVZiNFZud0RG?=
 =?utf-8?B?aXQwNTMxOHB5WTZvRGdpZWsvRHV0Qm9QWHpIWXJnb3JoMTI5a1Bva0ZkeDNF?=
 =?utf-8?B?c3dWUlh4WTA5eUd3WXZzcEoxV3hadmFSR3IwWlJmOG1rbDZBSUF3b3hWc0Ra?=
 =?utf-8?B?eCtiM29GKzU4eDdxdENvcFBNMkdHcjIxTzN5ZTZ1L0g1MWpTQk1PRnJXaXU4?=
 =?utf-8?B?U3NDNG91NFJUL3V3TTQ1STdrSU0xcklsWTg4VVg3OVhsNm1QMEkrZG9mT3Fj?=
 =?utf-8?B?Y1ppczdFYU9KMlgzYXVPTkZDNnhRZE5oWXZsM3VRZGJ0eFNEb3g5aVZkL01Z?=
 =?utf-8?B?eGpSUUtETkxPRHF0ei9RTU9jaEVjdUoxbWRodjJ6SUtGT3oxOTN5UHBmSHB3?=
 =?utf-8?B?bXNUeVUvNjJPVFA5UDJSRzBTSyt5YmlHYzBwQ09yRkpWYTlIQUxDV005MFFW?=
 =?utf-8?B?TWt4WW96WHNER21xTHRBby9NSEVMQ2RkNysvK1Q5RVpMZ3VOUzFKMkJkQTVm?=
 =?utf-8?B?Z1d6SW1LWkxsaG5ra2FWQmROTHhpZWtyWUFQZnBwdW1DbWx2SVNrZkw4L1Qr?=
 =?utf-8?B?blBaOVR5cWh6bGxFcG5wbEtJeW5yQXNtUFRXUGwrWEZ0L0taT0dmTTBOWTlO?=
 =?utf-8?B?K0h4akhJb1NxL0tqdzNZMkVyUGRqVnJaSWhnUWo4THlMSXF0ZE9OUmp3V0hj?=
 =?utf-8?B?bk9tQmRGdklXZE82WjltcWVnN2hleE1hUEVJRk1ndXlGVFhSbmVBQkwzQk53?=
 =?utf-8?B?QzBGQXg2NHA4SXZLWGMvTjd6UUp1YXdCUDBJLzByRi9VbGEycEZPaVhqeVU5?=
 =?utf-8?B?T0ltd0J5WC9RRklRUWpkN1BUdnF6VWRYTEJqRkZ4UnhoVkJzQ2RTdTFGdkI3?=
 =?utf-8?B?S0xvMDVKbXNhYnNVenA4OVZadEh2ZjJCMkFnQ0Z3d3ozblF1Z3FkaU5BTDlC?=
 =?utf-8?B?dVVmT3EvYm9ZSXpOUGt4ai9OTU9Bc3RCVzVqZFBIaHllbVQwRlhMTndWeENh?=
 =?utf-8?B?cTdVYWphUFRMSmFmdVJQemM1THF4Vk55bUxuSVlBRjl2Yys0RUZYNzBoSHhw?=
 =?utf-8?B?NEJpT2VPbjVQZTJCQnpiZ2dYd25nVm5Vdkx0QnZVSkpveUc5bEx0anJPbDNl?=
 =?utf-8?B?TlloalBScU9FSnYrWGdPdHdpZ3V0RjZzTmhHbi9KRzI0T1FuZ2tadVE4WFVM?=
 =?utf-8?B?VlF2Tkp1ZDl1bVZHZFlLUENHVk1EWFVOMUZhT2ptVDRDd2VBK1RReG4wZzJ6?=
 =?utf-8?B?SjZjUTJrcWRlMDJtRnlKVFB0bUhLNW1JTzAvaTJsdWU4UTBjcjhwUysvcTB4?=
 =?utf-8?B?STRKdUhXVnNqWmZOZUxBZENTSFJ2QkxJbHBGZEtyL3Zwd21LeGdXei9KaHpC?=
 =?utf-8?B?cXFHTVBKcG9ZbkhUWmpNWVRIanlIZHFzODd6NXc2clE5aWdOY1ZJUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F07871163E0B94E926929A3B4D964F8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c1eada-3a23-4a32-0668-08d9e25e9ab4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2022 13:03:39.9303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VsCd5PAw7kG32/DD+FlkoNQPM8rNaYQD1ZPKN5VQ9FWGVdwUk6wWQKn/l1su/UF9cIU1Mqk6qHz3bby5/L5ojflyUoy+nYXGTp3v6dEvxdMvRVUABtTyV1UACmVEP35K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4811
X-Proofpoint-GUID: EQ0dFmGOqZBdUl9ii7hNVvMuD85fbUpP
X-Proofpoint-ORIG-GUID: EQ0dFmGOqZBdUl9ii7hNVvMuD85fbUpP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_03,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 mlxlogscore=816 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201280083

SGVsbG8sIFJvZ2VyLCBKYW4hDQoNCk9uIDEzLjAxLjIyIDE1OjM4LCBKYW4gQmV1bGljaCB3cm90
ZToNCj4gT24gMTMuMDEuMjAyMiAxNDoyNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+IE9u
IFRodSwgTm92IDI1LCAyMDIxIGF0IDEyOjE3OjMyUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPj4+IE9uIDI1LjExLjIwMjEgMTI6MDIsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3Rl
Og0KPj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hj
aGVua29AZXBhbS5jb20+DQo+Pj4+DQo+Pj4+IEZvciB1bnByaXZpbGVnZWQgZ3Vlc3RzIHZwY2lf
e3JlYWR8d3JpdGV9IG5lZWQgdG8gYmUgcmUtd29ya2VkDQo+Pj4+IHRvIG5vdCBwYXNzdGhyb3Vn
aCBhY2Nlc3NlcyB0byB0aGUgcmVnaXN0ZXJzIG5vdCBleHBsaWNpdGx5IGhhbmRsZWQNCj4+Pj4g
YnkgdGhlIGNvcnJlc3BvbmRpbmcgdlBDSSBoYW5kbGVyczogd2l0aG91dCBmaXhpbmcgdGhhdCBw
YXNzdGhyb3VnaA0KPj4+PiB0byBndWVzdHMgaXMgY29tcGxldGVseSB1bnNhZmUgYXMgWGVuIGFs
bG93cyB0aGVtIGZ1bGwgYWNjZXNzIHRvDQo+Pj4+IHRoZSByZWdpc3RlcnMuDQo+Pj4+DQo+Pj4+
IFhlbiBuZWVkcyB0byBiZSBzdXJlIHRoYXQgZXZlcnkgcmVnaXN0ZXIgYSBndWVzdCBhY2Nlc3Nl
cyBpcyBub3QNCj4+Pj4gZ29pbmcgdG8gY2F1c2UgdGhlIHN5c3RlbSB0byBtYWxmdW5jdGlvbiwg
c28gWGVuIG5lZWRzIHRvIGtlZXAgYQ0KPj4+PiBsaXN0IG9mIHRoZSByZWdpc3RlcnMgaXQgaXMg
c2FmZSBmb3IgYSBndWVzdCB0byBhY2Nlc3MuDQo+Pj4+DQo+Pj4+IEZvciBleGFtcGxlLCB3ZSBz
aG91bGQgb25seSBleHBvc2UgdGhlIFBDSSBjYXBhYmlsaXRpZXMgdGhhdCB3ZSBrbm93DQo+Pj4+
IGFyZSBzYWZlIGZvciBhIGd1ZXN0IHRvIHVzZSwgaS5lLjogTVNJIGFuZCBNU0ktWCBpbml0aWFs
bHkuDQo+Pj4+IFRoZSByZXN0IG9mIHRoZSBjYXBhYmlsaXRpZXMgc2hvdWxkIGJlIGJsb2NrZWQg
ZnJvbSBndWVzdCBhY2Nlc3MsDQo+Pj4+IHVubGVzcyB3ZSBhdWRpdCB0aGVtIGFuZCBkZWNsYXJl
IHNhZmUgZm9yIGEgZ3Vlc3QgdG8gYWNjZXNzLg0KPj4+Pg0KPj4+PiBBcyBhIHJlZmVyZW5jZSB3
ZSBtaWdodCB3YW50IHRvIGxvb2sgYXQgdGhlIGFwcHJvYWNoIGN1cnJlbnRseSB1c2VkDQo+Pj4+
IGJ5IFFFTVUgaW4gb3JkZXIgdG8gZG8gUENJIHBhc3N0aHJvdWdoLiBBIHZlcnkgbGltaXRlZCBz
ZXQgb2YgUENJDQo+Pj4+IGNhcGFiaWxpdGllcyBrbm93biB0byBiZSBzYWZlIGZvciB1bnRydXN0
ZWQgYWNjZXNzIGFyZSBleHBvc2VkIHRvIHRoZQ0KPj4+PiBndWVzdCBhbmQgcmVnaXN0ZXJzIG5l
ZWQgdG8gYmUgZXhwbGljaXRseSBoYW5kbGVkIG9yIGVsc2UgYWNjZXNzIGlzDQo+Pj4+IHJlamVj
dGVkLiBYZW4gbmVlZHMgYSBmYWlybHkgc2ltaWxhciBtb2RlbCBpbiB2UENJIG9yIGVsc2Ugbm9u
ZSBvZg0KPj4+PiB0aGlzIHdpbGwgYmUgc2FmZSBmb3IgdW5wcml2aWxlZ2VkIGFjY2Vzcy4NCj4+
Pj4NCj4+Pj4gQWRkIHRoZSBjb3JyZXNwb25kaW5nIFRPRE8gY29tbWVudCB0byBoaWdobGlnaHQg
dGhlcmUgaXMgYSBwcm9ibGVtIHRoYXQNCj4+Pj4gbmVlZHMgdG8gYmUgZml4ZWQuDQo+Pj4+DQo+
Pj4+IFN1Z2dlc3RlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
DQo+Pj4+IFN1Z2dlc3RlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4+
PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1
c2hjaGVua29AZXBhbS5jb20+DQo+Pj4gTG9va3Mgb2theSB0byBtZSBpbiBwcmluY2lwbGUsIGJ1
dCBpbW8gbmVlZHMgdG8gY29tZSBlYXJsaWVyIGluIHRoZQ0KPj4+IHNlcmllcywgYmVmb3JlIHRo
aW5ncyBhY3R1YWxseSBnZXQgZXhwb3NlZCB0byBEb21VLXMuDQo+PiBBcmUgZG9tVXMgcmVhbGx5
IGFsbG93ZWQgdG8gdXNlIHRoaXMgY29kZT8gTWF5YmUgaXQncyBkb25lIGluIGENCj4+IHNlcGFy
YXRlIHNlcmllcywgYnV0IGhhc192cGNpIGlzIGhhcmRjb2RlZCB0byBmYWxzZSBvbiBBcm0sIGFu
ZA0KPj4gWDg2X0VNVV9WUENJIGNhbiBvbmx5IGJlIHNldCBmb3IgdGhlIGhhcmR3YXJlIGRvbWFp
biBvbiB4ODYuDQpUaGF0IGlzIGJ5IGludGVudGlvbjogd2UgZG8gbm90IHdhbnQgdG8gaGF2ZSB0
aGlzIGVuYWJsZWQgb24gQXJtIHVudGlsDQppdCBjYW4gcmVhbGx5IGJlIHVzZWQuLi4NCj4gSSdt
IG5vdCBzdXJlIGVpdGhlci4gVGhpcyBzZXJpZXMgZ2l2ZXMgdGhlIGltcHJlc3Npb24gb2YgZXhw
b3NpbmcgdGhpbmdzLA0KPiBidXQgSSBhZG1pdCBJIGRpZG4ndCBwYXkgYXR0ZW50aW9uIHRvIGhh
c192cGNpKCkgYmVpbmcgaGFyZGNvZGVkIG9uIEFybS4NCi4uLnNvIHdlIGVuYWJsZSB2UENJIG9u
IEFybSByaWdodCBhZnRlciB3ZSBhcmUgYWxsIHNldA0KPiBUaGVuIGFnYWluIHRoZXJlIHdlcmUg
YXQgbGVhc3QgMyBzZXJpZXMgaW4gcGFyYWxsZWwgb3JpZ2luYWxseSwgd2l0aA0KPiBpbnRlcmRl
cGVuZGVuY2llcyAoaWlyYykgbm90IHByb3Blcmx5IHNwZWxsZWQgb3V0IC4uLg0KU29ycnkgYWJv
dXQgdGhhdCwgd2Ugc2hvdWxkIGhhdmUgc2FpZCB0aGF0IGV4cGxpY2l0bHkNCj4NCj4gSmFuDQo+
DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

