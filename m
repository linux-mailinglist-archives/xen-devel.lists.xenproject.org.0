Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5824A7E9CB0
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 14:02:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631580.985052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2WaT-0001uQ-6j; Mon, 13 Nov 2023 13:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631580.985052; Mon, 13 Nov 2023 13:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2WaT-0001ra-3i; Mon, 13 Nov 2023 13:02:45 +0000
Received: by outflank-mailman (input) for mailman id 631580;
 Mon, 13 Nov 2023 13:02:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTXO=G2=epam.com=prvs=56810bf7ac=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r2WaR-0001rU-PX
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 13:02:43 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed6d8a28-8224-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 14:02:41 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ADARw9l019551; Mon, 13 Nov 2023 13:02:26 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ua1hsvr8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Nov 2023 13:02:26 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by PAWPR03MB9738.eurprd03.prod.outlook.com (2603:10a6:102:2ed::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 13:02:22 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%5]) with mapi id 15.20.6977.028; Mon, 13 Nov 2023
 13:02:22 +0000
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
X-Inumbo-ID: ed6d8a28-8224-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkHRNeN+tO0UfriVYDlDqK5KbfR7ev/4T6NApol17koTz7KINxTR8FkhJiJp3cH8BywL+ComU6RGD4XCHvDDc9xF+q5jjoB9aGiAfxAvjynH2yEbRQWefnHzYfXi0HEnOQ0BkL1Li9me8n2juOw5GinW1FxNLXiA6pMcbNOiDgNAkb/NYsahs+FlK5akWGggmVc0Qn7cnQvf8kJ71KTk0g8JlS6x7bJEIgMxw4sEcBxbtxL0Y/pQG9VIc1rVay93NoERjnQrjxBcdv9kMHnsKTSFZPRfNuDLcr3KeT6MoDSw6Mtil84hd+eNRihDXxxzj8fCSq8S+CPSjT9etMQPLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0Bsvp0tx3SsNLe9WoHGxEV0h1Mr9my0t6sIA3cMthw=;
 b=BZgdk4xPs5178q3sqr4NJD5jPbNtE9NVBzSTpuaxrhClcr+GZy2MXZGvZ3QSkyO5oOlV5dOhsEOvRZLU7cKmhqHdimuzAldbdsWfTuCeBYKA7CvKfB6av6M5a4LudZM1/nT8zVU53BEL3wDgiZi+M8g1TXfWpB0PQ5CQ6WgPF6PprhzbpO+u9XUBIwAao6lMC9T6Wlowz+Hb0IcWdwh1eKKuGgLwDSgYQSU4MALVUbq+mFWOg45YpcST2ZyXP61wPFRz6/ezZ6bYOBqm9PBTiTSMXOlodBTN1blsNFMncDFTvmO5bY25DUek4KoxiBQLjLKdnRjr5zoyZI132R/78g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0Bsvp0tx3SsNLe9WoHGxEV0h1Mr9my0t6sIA3cMthw=;
 b=kS54Llb9yCmjZaAJKgOpkNNmeupdwSc9EbzhwiEX9JDk41VbtHrTCMSI16iEUN1RfGjXdgfEQxYvgPGEy5g7CPlGsyXVMCHx+c8BU5sRZoFkmLkLYVmUX88uROtOA7iNa5Me9eHKfh5Xvy3hZFwfG0FyllWPF15SgMygEkgSPuSrjeh7nJ8lTImiV4ooIcBGn7qEwjUWTEj7Eh211S7mHr/yvTDSg+VTAzD7uzObmgV5Z/BImvUHFrEQzbxJCyHOKHIDSCCBbxLYM07PFJRX4sC8LcquM0rKpk0MTvcJdp1AVGWmdOmAdtL9ouAkcnhXgN5QkSti0wLtEcKZ3vmGZg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: David Woodhouse <dwmw2@infradead.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        Paul Durrant
	<paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
        Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Richard
 Henderson <richard.henderson@linaro.org>,
        Eduardo Habkost
	<eduardo@habkost.net>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony
 Perard <anthony.perard@citrix.com>,
        "open  list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 3/7] xen: xenstore: add possibility to preserve owner
Thread-Topic: [PATCH v1 3/7] xen: xenstore: add possibility to preserve owner
Thread-Index: AQHaFBZoS99E/RofVU6d/7dbafCRirB09L6AgAI+uwCAAQc9AA==
Date: Mon, 13 Nov 2023 13:02:22 +0000
Message-ID: <8734x97qn6.fsf@epam.com>
References: <20231110204207.2927514-1-volodymyr_babchuk@epam.com>
 <20231110204207.2927514-4-volodymyr_babchuk@epam.com>
 <4481f0fe9eb282333fd967b7ece590ead78ccdba.camel@infradead.org>
 <9cdd033411f5c15920762808891f278001073c6b.camel@infradead.org>
In-Reply-To: <9cdd033411f5c15920762808891f278001073c6b.camel@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|PAWPR03MB9738:EE_
x-ms-office365-filtering-correlation-id: 7421e2ad-b6df-4fef-4cef-08dbe448c67e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mtFIG+3Cd2m5/X+G1HIDoTWu1iZJKH2TMAgB/D5okYTg/iaWmbHkBwOnbqNyhnDFRIKfWvH/5zXJQgesSG8sK5Mn9o0mR90eXSWTuMLDt/cGsMKuFqqvdsD4asolFk5tvswTLdDM9gxCXZZKX1Vv8bHAkG1cVmk2pwU39CN6QvjKtPVUv9hmMOU6HHHO7bZ8qcTeZi36hVtWeR4F7EtaPwKAnjAOFsFe9LJJaBtW5qEav1xXyBQcpePq3i9mijjyTK5mmN6F1TPcapYz6qjkC088VPZm4YTk/WOf3yM0/RkzdX36825+I5u2o+PdZO8j/A/S2IiA4B/DxNhLWpcd8F6oSZ9eAIpFd0qBjCfPE9O532wWy0Lz2jjjL7GJwui6P3t172B5skNJxo8zAdB+euNrl8qE3LoQ7O/CC+DwnqNkdpi/yilJEym/jeMogKfC6QUzPbghpHmvuBc6YBEYWb4iomMHYXM8+DzBMqclHqg0LvntdZkQ0vMyisnUXGEDl4puvfq3fpkvk47/a7L7+oivAJEztZmvA9y+p/48pURb3zJ8xycLvAT7Ns2oyL5zeMPPT1r5vasvqF//KuRSpZ8qsR2QgJUNNyTJKUSEh8C15SiDIMV7/p9QAMS+4rp+
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(366004)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(26005)(55236004)(6506007)(71200400001)(2616005)(6512007)(5660300002)(8676002)(8936002)(41300700001)(4326008)(7416002)(2906002)(4001150100001)(6486002)(478600001)(6916009)(91956017)(66446008)(54906003)(64756008)(66556008)(66946007)(76116006)(66476007)(122000001)(316002)(36756003)(86362001)(38100700002)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cXNOOGhONlJJUDhlRFZDWElWNzJWWHVjMHZyUUE3RXFBRGdFUDdTNEVvanN1?=
 =?utf-8?B?MnduK2NveEg5cGpSU0hYaksvYkV4ajEyNThlUE56ZG94SnYwNnFSa09LZy85?=
 =?utf-8?B?bHlXaWJxOEdvSGcvV2RrN09ERE03WWxNVDNQRmJzTTJUVjhpcHZvb21jSTQ3?=
 =?utf-8?B?UnUvVVA4cGJqL21aRHVJVHQya2YwZTEreUIvZmFLL0ZJdmdrV0lFd1duakVU?=
 =?utf-8?B?RXB0SmY2U2dWR1VUMFFSeTJLUSttZWQzRDNxbEpyM3Q0c1pISzlMWFVRN3Nu?=
 =?utf-8?B?M1hteDNoVW5TMjBnTkMrVzF6bU1oeWdJUnQzL0F3aHExSTNaTzl4VDkxTkJP?=
 =?utf-8?B?NEF1N2RxdTNoenpWYy9OZnFaVW4wOFYrS3pyUHhGcmN5OUEzZDYwN1pZbXp1?=
 =?utf-8?B?MGk1RkQvcTlRcUdOUXVDaHMyRUxqOUNVTzZLM3BvVjhIQVNiNVRIS2FaaTFr?=
 =?utf-8?B?MFZ6Wmx4aUtpaHpvN0NKTnRPME4rUjZQcitqWTUyRzBvK01hbVFqZVNXYmRp?=
 =?utf-8?B?d2J5djRiYnh1cUxHYS9qTzlYWVVpUnNrSy83ZVhkUW56bE91VnJBZHZwVjdC?=
 =?utf-8?B?SnRuVHlXTzBsR3d1cDVtQ1ZvRVk4eGxxY3o1VEdmVzlDVVhRNHNmV1B5RkFX?=
 =?utf-8?B?dkJtTGNFWWI1Mk5BdmI1NGI2NzJOYkt3SUcvd0dtYmdxTEVTZ2JqYlQrT29u?=
 =?utf-8?B?WFErdHp3YVU0dWI4OS9Ca1MzWUZ6Vzg5UE9sdkFqL2EwL1lUQ0xyRnQwRnFN?=
 =?utf-8?B?T0Z6NTNIL25IMllxZmx4ZHpHbTY2cHdVQUpuZWlMMGkrUFNwR1BuRVZSemI2?=
 =?utf-8?B?cVFMa1NBS1pkMFNleHFjM2E0OXlFRURWaTZNamg0d3c2cUJwZ1kvK01DcHpL?=
 =?utf-8?B?QmtOK0trQWRqNEZ0aDM4ZysxT3c3N0pSQlpuVkpaTFhPNWUySjZObE5iVk5I?=
 =?utf-8?B?SG5RL1hKdTBvSkM1WUxTa0FJZ0M2M3lvcVN6VFlIQUFaN2hwa2U0LzBBMWlx?=
 =?utf-8?B?OEd0VzBYYVpNYWNVSXJubTUyNkVGZW5kbVU1aGU5VW5lS29YYjNYd2JwZ3hv?=
 =?utf-8?B?SnU0YnRSMDE3Z3hsbW11R2lSSjU1MmozT3pkdDYwdFM3RytHbVVMaGxHR3Nw?=
 =?utf-8?B?SFl4bHRiQmZTU0VOZ2c5dUtzcG9HbCtmMHY2NGtHL1ZFZ2dramRnTjVLRXlV?=
 =?utf-8?B?SFZTRG15d2l0WTRhYXE5VjVJV1AxcXJQVEtjMHpXZk9KSXdNbjMvdk9vWFBo?=
 =?utf-8?B?TDFFNjQvNHR0dkZ4YUNscnZLa29YMnFtbkpUMDFMenRXVnZzN3NJc04rSTBR?=
 =?utf-8?B?ZDVaRDhubnVkWERzdjJCSUdsUXdRWnJ1STlYWVp2TmdWaXorb0t5OVJ2L0Ux?=
 =?utf-8?B?MEphSURhV2VaemtpeE9JL3pGOEhzcVVVS1FxTHFsS09Udnk0Z21jbVRoV2VQ?=
 =?utf-8?B?TzE2QmRMRWNoT0xQdTZkVFJkQU9WaThQSkV5dzNCUzhBNmd2TmhuaWY3OHJT?=
 =?utf-8?B?WVRZZkNkb3NrbjdrWlBWWllKMnZPT0RDNXZJdVYrY1lneDNCZDJ1ZnQ0blBT?=
 =?utf-8?B?dEtqbW1pNUxSUnY0UE9FYkl6OVNJZkt0Z0xTVDZjUk9DRkVwMVdTR2xFUWpj?=
 =?utf-8?B?aVpsRXVySkpIMFYybjcvbDVNVHhjWWl3VDlmV0V5ZmF1UEdIZUtFRS96aDdR?=
 =?utf-8?B?TzM1RTI3Q0xKWWUvYkpVUFFHSWsydzRGS1c4NTJCNytmb2w3dzRzemFnejI1?=
 =?utf-8?B?emtHTjdMaUZVaTRDeGppRGFiTFRXV1E1Q1hnZEF1Uzk1a2xja21HeU1BaFN6?=
 =?utf-8?B?T1RiUlhwTDRsWkxtdzB0WlNPcklHYnJhc056Z2lGc1lyS0JpdlNQMElQaXBl?=
 =?utf-8?B?VFU0OG5oZXNqWFprYzNpWmNqc3lPQTI0U24yb0k5ZE44bWtsYUFMTGFOQ1VZ?=
 =?utf-8?B?TUlzTzE1Zkt6L3I3M1NhaVI2RHl3allJVHRTa2NwTit0YWNaQXBBRkpJUFA1?=
 =?utf-8?B?NjA3TUNIM29mRVRremJDbmR5ZDBrRVRrSEpxb1F6ZnhSbDNTMlBQY2txR0Qz?=
 =?utf-8?B?aFAwam9JUy9UbHhmMEo5UElLT1RLMGhUTWM5UGRSTzU1UEI2VFlVamdPWU4w?=
 =?utf-8?B?TG82SWZaQW9pSXNZZmNDTnRoczhDL1lwZ3RYS09lWjgreUt6UHArV1FwNFpj?=
 =?utf-8?B?a3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D187F897717AE4DAA02C962164DA4E2@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7421e2ad-b6df-4fef-4cef-08dbe448c67e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 13:02:22.1769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xdILqG2dy5H+bFMGOmoLkqd2aRg8bIVMTn+iT3RRVpP8uWMEU58I1bfna1XadbCt4enXKdxsfUFq0ZZ/8OXXpvnGSutNGvwblFAYUhbdUFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9738
X-Proofpoint-ORIG-GUID: AUMvUFhYStGjO8aSxv2pBW2cp3sDsE0D
X-Proofpoint-GUID: AUMvUFhYStGjO8aSxv2pBW2cp3sDsE0D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-13_03,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=781 spamscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311130106

DQpIaSBEYXZpZCwNCg0KRGF2aWQgV29vZGhvdXNlIDxkd213MkBpbmZyYWRlYWQub3JnPiB3cml0
ZXM6DQoNCj4gW1tTL01JTUUgU2lnbmVkIFBhcnQ6VW5kZWNpZGVkXV0NCj4gT24gU2F0LCAyMDIz
LTExLTExIGF0IDExOjAxICswMDAwLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6DQo+PiANCj4+ID4g
LS0tIGEvaHcveGVuL3hlbi1vcGVyYXRpb25zLmMNCj4+ID4gKysrIGIvaHcveGVuL3hlbi1vcGVy
YXRpb25zLmMNCj4+ID4gQEAgLTMwMCw2ICszMDAsMTggQEAgc3RhdGljIGJvb2wgbGlieGVuc3Rv
cmVfY3JlYXRlKHN0cnVjdCBxZW11X3hzX2hhbmRsZSAqaCwgeHNfdHJhbnNhY3Rpb25fdCB0LA0K
Pj4gPiDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsNCj4+ID4gwqDCoMKgwqAgfQ0KPj4g
PiDCoA0KPj4gPiArwqDCoMKgIGlmIChvd25lciA9PSBYU19QUkVTRVJWRV9PV05FUikgew0KPj4g
PiArwqDCoMKgwqDCoMKgwqAgc3RydWN0IHhzX3Blcm1pc3Npb25zICp0bXA7DQo+PiA+ICvCoMKg
wqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgbnVtOw0KPj4gPiArDQo+PiA+ICvCoMKgwqDCoMKgwqDC
oCB0bXAgPSB4c19nZXRfcGVybWlzc2lvbnMoaC0+eHNoLCAwLCBwYXRoLCAmbnVtKTsNCj4+ID4g
K8KgwqDCoMKgwqDCoMKgIGlmICh0bXAgPT0gTlVMTCkgew0KPj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gZmFsc2U7DQo+PiA+ICvCoMKgwqDCoMKgwqDCoCB9DQo+PiA+ICvCoMKg
wqDCoMKgwqDCoCBwZXJtc19saXN0WzBdLmlkID0gdG1wWzBdLmlkOw0KPj4gPiArwqDCoMKgwqDC
oMKgwqAgZnJlZSh0bXApOw0KPj4gPiArwqDCoMKgIH0NCj4+ID4gKw0KPj4gDQo+PiBEb24ndCBz
ZWUgd2hhdCBzYXZlcyB5b3UgZnJvbSBzb21lb25lIGVsc2UgY2hhbmdpbmcgaXQgYXQgdGhpcyBw
b2ludCBvbg0KPj4gdHJ1ZSBYZW4gdGhvdWdoLiBXaGljaCBpcyB3aHkgSSdkIHByZWZlciBYZW5T
dG9yZSB0byBkbyBpdCBuYXRpdmVseS4NCj4NCj4gSSBzdXBwb3NlIG1heWJlIHlvdSBjb3VsZCBk
byBpdCBpbiBhIHRyYW5zYWN0aW9uICppZiogdGhlIHRyYW5zYWN0aW9uX3QNCj4geW91J3JlIHBh
c3NlZCBpbiBpc24ndCBhbHJlYWR5IFhCVF9OVUxMPw0KDQpZZXMsIEkgbmVlZCB0byBwYXNzICJ0
IiB0byB4c19nZXRfcGVybWlzc2lvbnMoKSwgb2YgY291cnNlLg0KDQo+IE9uZSBtaWdodCBhcmd1
ZSB0aGF0IHRoZSBta2RpcitzZXRfcGVybXMgaW4gbGlieGVuc3RvcmVfY3JlYXRlKCkgb3VnaHQN
Cj4gdG8gaGF2ZSBiZWVuIHdpdGhpbiB0aGUgc2FtZSB0cmFuc2FjdGlvbiAqYW55d2F5Kj8gDQoN
ClllcywgYWxsIG9wZXJhdGlvbnMgc2hvdWxkIGJlIHBlcmZvcm1lZCBpbnNpZGUgb25lIHRyYW5z
YWN0aW9uLg0KDQotLSANCldCUiwgVm9sb2R5bXly

