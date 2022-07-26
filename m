Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E47D581646
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 17:18:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375428.607805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGMKW-0001PI-Sp; Tue, 26 Jul 2022 15:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375428.607805; Tue, 26 Jul 2022 15:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGMKW-0001Ml-Pw; Tue, 26 Jul 2022 15:18:40 +0000
Received: by outflank-mailman (input) for mailman id 375428;
 Tue, 26 Jul 2022 15:18:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fK14=X7=epam.com=prvs=92061d7f5f=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1oGMKV-0001Md-0N
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 15:18:39 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 382bc73b-0cf6-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 17:18:37 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QE4SSu007640;
 Tue, 26 Jul 2022 15:18:27 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3hj7uyaffe-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 15:18:26 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by VE1PR03MB5616.eurprd03.prod.outlook.com (2603:10a6:803:11b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Tue, 26 Jul
 2022 15:18:21 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::d87f:d45e:b2c6:c21]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::d87f:d45e:b2c6:c21%6]) with mapi id 15.20.5458.024; Tue, 26 Jul 2022
 15:18:21 +0000
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
X-Inumbo-ID: 382bc73b-0cf6-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdE9KfUEryrVVcLn5YqzOMXnzpBZKCrl6mGmU3BmV7DskyWF3ELjR6M51q/CQODyTpWLUTsMW2KuuERKYjqGMbMCo7uGUYRRiOLXOGUQGKQ8vom/nMNW0yZ+3pcw0SCB6Llm2YfBewLFD1JXvcc1YWS8PkZaqq6bs6w3gyFEoGUp7u3rtPrkH4CZIgAtaidb6BKuT7j79ArfhVvGvLJmVPCzOQXifjGXjLlhi2J80gOCqo38EwYn3BQUzR7myrbdBCJx6TYiytOCgvhvGPkB94JpYwhGLGSFLllW4QJ1W0nHTvDhcjCFXwox2VWrkJtrksaHzK633mDEwO7WhtD+Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpcmGGqDjuqxt66c3UKMlaChzXpEtDoAbg6TvFyqMgk=;
 b=KPbPJVorF1XT3N5c32g/qy6EjkQ0JLViEWk/tgtTOPGRE11Dhi7x1e8zpsYCuyc08o6LCcVth19fkOYSc9z/YJlKeg3X8x4WHv6Wmita1mFf429PtIylz0+UWjRj7gNB0EtK05B54AP88HgO5u3tlkjoNOdZSWP9FtdbzmQKnTH8YAJ4wcvsJWbuTSCJlAGObIUwl/q9yUoL7kgSvQVifPlMdKOlhPLY81zrzF8v1ohAYVuHmB4VRNrhttr26VBQ/7VwONt6+GNSNPP7WBXufA9ZxtEjGKdkSkB9kC9DQzRmmQRSyIQWYVOPgDII4BHOF+HrwMKHJb8u5HbHLD07eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CpcmGGqDjuqxt66c3UKMlaChzXpEtDoAbg6TvFyqMgk=;
 b=r7P5QeDTik5u4fqrTGkZMX0FG53hIUHRkfOYUMQ9lxQ/OTZTwr5fucsjr104Sc2a3cxRaZDKLEhohY9nJJDbCv+jTAXJxxTWlMUNcjOlzmPNnGaIX5QuPOQ0XYA9jg8wntnhxbKjKeJc2TGN5Jke+J3sgf2ImiWAF6OxEButccOhYNkWHJdXh3CWXhh74zcsEM9gQpkFRLOvzbSjjNzyt8hZY89TH0PYMoNQnGHCq7BpwkkTwilO2mvRre3hZGs0uYp1H5OLQrGONeyfxktHKnTGzWj2oLOCpN2e6XlJ4Vz4B0kJwkie8gaZA/Yu2mHqpLdsfIrMzrV8qXW4D8xNjw==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Rahul Singh <rahul.singh@arm.com>
CC: xen-devel <xen-devel@lists.xenproject.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>,
        Paul Durrant <paul@xen.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Oleksandr Tyshchenko
	<olekstysh@gmail.com>
Subject: Re: [PATCH V7 00/11] PCI devices passthrough on Arm, part 3
Thread-Topic: [PATCH V7 00/11] PCI devices passthrough on Arm, part 3
Thread-Index: AQHYm5cHu+4wDbWHSk2myAxnsrAvWa2QtXSAgAAZPgA=
Date: Tue, 26 Jul 2022 15:18:21 +0000
Message-ID: <f40b4b7a-e285-dec8-9a48-12629f22d247@epam.com>
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <4B8A2C5D-194B-4C15-9F4A-C5703CCA5727@arm.com>
In-Reply-To: <4B8A2C5D-194B-4C15-9F4A-C5703CCA5727@arm.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47939d57-ad92-4281-4ab3-08da6f1a13a6
x-ms-traffictypediagnostic: VE1PR03MB5616:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /mN+IIlJSzFuDkvk/h7x8+IIe0UEBfPijb0ACrAioFngaZQDS9N/t/NzZlqO3ZnqoGl/g0eF9aQcLx5xZy2DtlLGaeNx6RLggkjzD5G8oWLooOkGhlVCkbbSBsjL7gmXBfeOMjSiKsHMA9Q0DAR+WuX0Rok1oxKRQ+McN1B7BQIJj8fSNWIjHwgXQJpZACfkHQrjWQUKQw9j/Vjmk+1NeOmHpZ3ALmq69SQc8Lk3lsiVkK4oDhH7JFARF+BL2tYJYd1pW2ar1qrtLdEwm22+m9qUL09YLi8H/81UPU3fwzZmiTvxNY+yOcLRQ0XtgbESVJHpTJTHZzY4vD4GtwPiiFuyYRx5U6Zb+7y5zfbW49zbuFuf1T/3SqkMweEbz2WL7h6uWuv5duN0fnEYyqy1N3rgT/Y7OrpZkzSxAi+dR2ABZhp2wKZ/5xrhROaJd1FDfzqLakO0yQgdj5hwlAPF3kgrsLMfa1lMzcg2yhcg1hpKQdFX0fapzAvZs0QfFwBighHcn5mFVcIKJ4/5iIoML1zOEE//ImsmaH/tDlPkVpnZc0e58lE/5O5Ja8oS5NiwO4Il+eW51P4wimc0mSyRd2U+pjBh9WoMo1NKAf4Uxkxi5jSG/YZlaXi2cKZyfHzK3VQYHkQwSXJp6jXr6yklGX8flh5szHiKGAJ4URuQ8yCean6pbJcrzmULO5ehlXUKWoSoVp6HWn/d6pVdIsLn6x7H8REhXtoEOv4ROADvwDw+kR4AQXkrxJ954rojPSXdZzFHfDvutbPb8ryPhUKtogt8xASR7yuPhuVUTbKlDcCOrPvsdOuAgWjOSdnjQ48OwliSuL6JJ5XTAhUhnNK0HHvVRfCEbbmMIYjG+Bq9aun1Xw5WQ0+ybvldILVCC6/kvD4ypc2y4VGIU5a/H5tcNwLgD+I3IQ1K7YvIl9i+An0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(122000001)(66476007)(83380400001)(91956017)(4326008)(66946007)(66446008)(36756003)(8676002)(38100700002)(66556008)(6916009)(54906003)(316002)(5660300002)(71200400001)(2616005)(26005)(6506007)(38070700005)(41300700001)(966005)(55236004)(76116006)(6512007)(186003)(53546011)(6486002)(2906002)(31686004)(478600001)(86362001)(31696002)(7416002)(8936002)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?L28wZlNzSXp4SjVLRGQ3T0ZVbi9OQ2Uzd0VzMDY0ZktEQkNkaGFjY05YZG5F?=
 =?utf-8?B?ZWxndzJ5Smh6djhIL2lETlptbU1WeDlYSnp6cFNWdC9FZ3lBeGdOQ3RuenhZ?=
 =?utf-8?B?dEdZckw4UHlPZ1U2NlRWSmQ3MnRwenVPbDBDWUxuRG02T1lreG81WTR3dlN4?=
 =?utf-8?B?dXcwSi94a3ovVEh6TWlHNVVadXZVQ3VkZkZiWXkzdFRzN1NVejVuVEFqcDdM?=
 =?utf-8?B?U1g5NkVkMm9YYk90YUxMTktQV1B4QTJtRWwraGhRWi8ySk94WU1MQ2NmK1Zh?=
 =?utf-8?B?aEdra0tSQkdqUnc3STZpUGd5TXIyZDdlWU1RMWlOOXdVc2FnbFQrV2ZFYzll?=
 =?utf-8?B?cFA1S2hwSGM3UlZISFlSNVJ6V0xKNGVsWlBxaVNQTFk3cUVoTzBxeWlJNWp5?=
 =?utf-8?B?ejF0cEM4Ti9hTXBPNnBoN2NWQnZXWmVRUzY2QWN3VHZrZ3hibFZJdnVMckE5?=
 =?utf-8?B?RHk0UEFRRXZYcmloRXJKVjJiUXVWdkM4NjBIcjlDR05xVHg3UG5TdWF5Q0hD?=
 =?utf-8?B?a2Q2NktHR256MVNvTno1bUVTRmJBaDBmZXJlajNiWXZQSHdJaFlkWGhWNzRY?=
 =?utf-8?B?YTVwZTh2dHVkZHVZRXFMTTNRRmZ2NVpoSjNRWjZUVWtacU5QUTBCVmRwWFQy?=
 =?utf-8?B?S0VBWE9qMXVRVk1QbVRSVGp2S0MrL1JTMWZsWHVOK25BWUkwL01PU3BaUUtT?=
 =?utf-8?B?TVBlQXQ3L0NsREVjRzk0VDlKaENaYnBTYnJhcnN5dHhGNGVhQUE0bndTMTI5?=
 =?utf-8?B?bzRGa3ZPOVg3RTN4YjJzeDQ5ZmViSjc2bG5GcmpiL3lKNjJzZS93ckV5OGd0?=
 =?utf-8?B?N09LblFBM0hZRDVZNTJoV0JMWnN2REJ5bEJNZnhDZlZLcUJhakljbDVWeVBK?=
 =?utf-8?B?YVlOTzFNNlNoWG1hR3FRemFUajBqcDNEekdCZEtIT0p5V2dWbXhqcTM3anE3?=
 =?utf-8?B?MTkyMm9yN2Z6UjhtdEErY2NDM2VpSWh6dDYyQ3JyOVJGOW5tT0E2WCtPRnZD?=
 =?utf-8?B?ZUdGOGJwZ1FESjhrWkF3V1hyTlVlZHB4WUFqNEVjS0xFTkh6T3lHOUlNS1pP?=
 =?utf-8?B?alU0bGtkWVZ3YXI5V2Z3cVZreU1YK1pPM3hhVzAvdG41SkdBRkZ4cmVJZEM1?=
 =?utf-8?B?a242R0g4UlRkMkpQV2dySUViYWt6S3RLS3pITk5QZ3hnOUljV1UzUHFaV2NJ?=
 =?utf-8?B?Q1pndll0RHJPdU04QWltcGNIUVBxU1Vma1hyR3YwNUloUGVRbi9LalN3NU5q?=
 =?utf-8?B?dHloTEVOamVld092aXNQM3lXQ3lscXRiL2toc2diaC9RbDdieVloQzdmZ3Ry?=
 =?utf-8?B?cTBpYnkxZ0lDekQ5Z21iejlRRHdwRTlFNkt2Sm04VHljdjI3RnFLTkpGS3p2?=
 =?utf-8?B?cXdUMi95d2lGSDFiZkhsWFd1SGRuakNuWm9sWDVDVXR5TGV6c09IZUx1cDh2?=
 =?utf-8?B?WGlDQlhGQmxPS1hVNXpwbjhKalJwLy9sZkd2dW5hTmZUek1ZUlFmYnZhUWF0?=
 =?utf-8?B?ZkJEM1J3dHpGT2VVdEcydTRVUWNaYkpvUmtwT1ZENExFQW1vejZad2grMzlO?=
 =?utf-8?B?eks5VFl2Tmt0bHNKTUs5ZHN2VVZSakwzS1NudEpycnpIRDJHTDZBazFXMEVi?=
 =?utf-8?B?eFZIZnRyaGVUQ0hsN3lid2tOTlBGZ2V3c1luelpUbW9hN001ZDZ6aWJEZTk3?=
 =?utf-8?B?emRTQUxHSDhRanV3Sy94aDZVL05ZKzZjeTRVaENZK081R3crY29aVzlBcXlG?=
 =?utf-8?B?ajFnOFpUV3dMS2I3dEx5b3VMbWovMFBDQ3FscnRab2hNT3FNR2s3UWN3UHZi?=
 =?utf-8?B?c0lrKytmeU9CQW1iQnBjNnUvdkJKNG10YUxSWFFuckRtQXRBOE1OcHdFYlpN?=
 =?utf-8?B?QjlINHExdFBRY1hVMWlnbys5TDZwclhSSTF6OVUxQUd4cTBIMW9VaG1HN3p1?=
 =?utf-8?B?bFN0NmdOMWpSL2tiZnpKM2haWUNuTG1UQ1ppdHYrUlY1VzRodk1WZXFGSEtk?=
 =?utf-8?B?TG81a1E4d3RiZkdFN1BGS1p4ZzlQdkZXaVkrSEZuU1lHbEVjTWJtbVpqTUo0?=
 =?utf-8?B?TnRSVWtPWjZMOWtpd3IzNGMzcWh5cEN5Y2xma1FDeTV3dEt5elg3czZxcWlN?=
 =?utf-8?B?bW5TTFU1Q1JXOS9ONlpIZXc3dENxVDVKMXorWFdIMWZNVmtQZU5aMkQ2aVho?=
 =?utf-8?Q?8i4Xt7GL9zI055b6cXNs1fQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F7215C67D7B42449DF4C0014FB8AA13@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47939d57-ad92-4281-4ab3-08da6f1a13a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 15:18:21.5219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xwjFb5Q+mxWi1EmJCyxLrhPE9qYeCvQKC8mD1oas8PDhGzBu08gjwx1XI6GKvn/VeQQg4FrDjiDRhrsYb3tpBUudcE0qHHUC/plXk4cQJWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5616
X-Proofpoint-ORIG-GUID: _V07lLF1YSgkZXRT9vaB7QnGfgcO5UH6
X-Proofpoint-GUID: _V07lLF1YSgkZXRT9vaB7QnGfgcO5UH6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 spamscore=0 mlxlogscore=692
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207260059

DQpPbiAyNi4wNy4yMiAxNjo0NywgUmFodWwgU2luZ2ggd3JvdGU6DQo+IEhpIE9sZWtzYW5kciwN
Cg0KDQpIZWxsbyBSYWh1bA0KDQoNCg0KPg0KPj4gT24gMTkgSnVsIDIwMjIsIGF0IDY6NDIgcG0s
IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc3R5c2hAZ21haWwuY29tPiB3cm90ZToNCj4+DQo+
PiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5j
b20+DQo+Pg0KPj4gSGksIGFsbCENCj4+DQo+PiBZb3UgY2FuIGZpbmQgcHJldmlvdXMgZGlzY3Vz
c2lvbiBhdCBbMV0uDQo+Pg0KPj4gMS4gVGhpcyBwYXRjaCBzZXJpZXMgaXMgZm9jdXNpbmcgb24g
dlBDSSBhbmQgYWRkcyBzdXBwb3J0IGZvciBub24taWRlbnRpdHkNCj4+IFBDSSBCQVIgbWFwcGlu
Z3Mgd2hpY2ggaXMgcmVxdWlyZWQgd2hpbGUgcGFzc2luZyB0aHJvdWdoIGEgUENJIGRldmljZSB0
bw0KPj4gYSBndWVzdC4gVGhlIGhpZ2hsaWdodHMgYXJlOg0KPj4NCj4+IC0gQWRkIHJlbGV2YW50
IHZwY2kgcmVnaXN0ZXIgaGFuZGxlcnMgd2hlbiBhc3NpZ25pbmcgUENJIGRldmljZSB0byBhIGRv
bWFpbg0KPj4gICBhbmQgcmVtb3ZlIHRob3NlIHdoZW4gZGUtYXNzaWduaW5nLiBUaGlzIGFsbG93
cyBoYXZpbmcgZGlmZmVyZW50DQo+PiAgIGhhbmRsZXJzIGZvciBkaWZmZXJlbnQgZG9tYWlucywg
ZS5nLiBod2RvbSBhbmQgb3RoZXIgZ3Vlc3RzLg0KPj4NCj4+IC0gRW11bGF0ZSBndWVzdCBCQVIg
cmVnaXN0ZXIgdmFsdWVzIGJhc2VkIG9uIHBoeXNpY2FsIEJBUiB2YWx1ZXMuDQo+PiAgIFRoaXMg
YWxsb3dzIGNyZWF0aW5nIGEgZ3Vlc3QgdmlldyBvZiB0aGUgcmVnaXN0ZXJzIGFuZCBlbXVsYXRl
cw0KPj4gICBzaXplIGFuZCBwcm9wZXJ0aWVzIHByb2JlIGFzIGl0IGlzIGRvbmUgZHVyaW5nIFBD
SSBkZXZpY2UgZW51bWVyYXRpb24gYnkNCj4+ICAgdGhlIGd1ZXN0Lg0KPj4NCj4+IC0gSW5zdGVh
ZCBvZiBoYW5kbGluZyBhIHNpbmdsZSByYW5nZSBzZXQsIHRoYXQgY29udGFpbnMgYWxsIHRoZSBt
ZW1vcnkNCj4+ICAgcmVnaW9ucyBvZiBhbGwgdGhlIEJBUnMgYW5kIFJPTSwgaGF2ZSB0aGVtIHBl
ciBCQVIuDQo+Pg0KPj4gLSBUYWtlIGludG8gYWNjb3VudCBndWVzdCdzIEJBUiB2aWV3IGFuZCBw
cm9ncmFtIGl0cyBwMm0gYWNjb3JkaW5nbHk6DQo+PiAgIGdmbiBpcyBndWVzdCdzIHZpZXcgb2Yg
dGhlIEJBUiBhbmQgbWZuIGlzIHRoZSBwaHlzaWNhbCBCQVIgdmFsdWUgYXMgc2V0DQo+PiAgIHVw
IGJ5IHRoZSBob3N0IGJyaWRnZSBpbiB0aGUgaGFyZHdhcmUgZG9tYWluLg0KPj4gICBUaGlzIHdh
eSBoYXJkd2FyZSBkb21haW4gc2VlcyBwaHlzaWNhbCBCQVIgdmFsdWVzIGFuZCBndWVzdCBzZWVz
DQo+PiAgIGVtdWxhdGVkIG9uZXMuDQo+Pg0KPj4gMi4gVGhlIHNlcmllcyBhbHNvIGFkZHMgc3Vw
cG9ydCBmb3IgdmlydHVhbCBQQ0kgYnVzIHRvcG9sb2d5IGZvciBndWVzdHM6DQo+PiAtIFdlIGVt
dWxhdGUgYSBzaW5nbGUgaG9zdCBicmlkZ2UgZm9yIHRoZSBndWVzdCwgc28gc2VnbWVudCBpcyBh
bHdheXMgMC4NCj4+IC0gVGhlIGltcGxlbWVudGF0aW9uIGlzIGxpbWl0ZWQgdG8gMzIgZGV2aWNl
cyB3aGljaCBhcmUgYWxsb3dlZCBvbg0KPj4gICAgYSBzaW5nbGUgUENJIGJ1cy4NCj4+IC0gVGhl
IHZpcnR1YWwgYnVzIG51bWJlciBpcyBzZXQgdG8gMCwgc28gdmlydHVhbCBkZXZpY2VzIGFyZSBz
ZWVuDQo+PiAgICBhcyBlbWJlZGRlZCBlbmRwb2ludHMgYmVoaW5kIHRoZSByb290IGNvbXBsZXgu
DQo+Pg0KPj4gMy4gVGhlIHNlcmllcyBoYXMgYmVlbiB1cGRhdGVkIGR1ZSB0byB0aGUgbmV3IFBD
SSh2UENJKSBsb2NraW5nIHNjaGVtZSBpbXBsZW1lbnRlZA0KPj4gaW4gdGhlIHByZXJlcSBzZXJp
ZXMgd2hpY2ggaXMgYWxzbyBvbiB0aGUgcmV2aWV3IG5vdyBbMl0uDQo+Pg0KPj4gNC4gRm9yIHVu
cHJpdmlsZWdlZCBndWVzdHMgdnBjaV97cmVhZHx3cml0ZX0gaGFzIGJlZW4gcmUtd29ya2VkDQo+
PiB0byBub3QgcGFzc3Rocm91Z2ggYWNjZXNzZXMgdG8gdGhlIHJlZ2lzdGVycyBub3QgZXhwbGlj
aXRseSBoYW5kbGVkDQo+PiBieSB0aGUgY29ycmVzcG9uZGluZyB2UENJIGhhbmRsZXJzOiB3aXRo
b3V0IHRoYXQgcGFzc3Rocm91Z2gNCj4+IHRvIGd1ZXN0cyBpcyBjb21wbGV0ZWx5IHVuc2FmZSBh
cyBYZW4gYWxsb3dzIHRoZW0gZnVsbCBhY2Nlc3MgdG8NCj4+IHRoZSByZWdpc3RlcnMuIER1cmlu
ZyBkZXZlbG9wbWVudCB0aGlzIGNhbiBiZSByZXZlcnRlZCBmb3IgZGVidWdnaW5nIHB1cnBvc2Vz
Lg0KPj4NCj4+ICEhISBPVDogcGxlYXNlIG5vdGUsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdo
byBpcyB0aGUgYXV0aG9yIG9mIGFsbCB0aGlzIHN0dWZmDQo+PiBoYXMgbWFuYWdlZCB0byBhZGRy
ZXNzIGFsbG1vc3QgYWxsIHJldmlldyBjb21tZW50cyBnaXZlbiBmb3IgdjYgYW5kIHB1c2hlZCB0
aGUgdXBkYXRlZA0KPj4gdmVyc2lvbiB0byB0aGUgZ2l0aHViICgyMy4wMi4yMikuDQo+PiBTbyBh
ZnRlciByZWNlaXZpbmcgaGlzIGFncmVlbWVudCBJIGp1c3QgcGlja2VkIGl0IHVwIGFuZCBkaWQg
dGhlIGZvbGxvd2luZyBiZWZvcmUNCj4+IHB1c2hpbmcgVjc6DQo+PiAtIHJlYmFzZWQgb24gdGhl
IHJlY2VudCBzdGFnaW5nIChyZXNvbHZpbmcgYSBmZXcgY29uZmxpY3RzKQ0KPj4gLSB1cGRhdGVk
IGFjY29yZGluZyB0byB0aGUgcmVjZW50IGNoYW5nZXMgKGFkZGVkIGNmX2NoZWNrIHNwZWNpZmll
cnMgd2hlcmUgYXBwcm9wcmlhdGUsIGV0YykNCj4+IGFuZCBwZXJmb3JtZWQgbWlub3IgYWRqdXN0
bWVudHMNCj4+IC0gbWFkZSBzdXJlIHRoYXQgYm90aCBjdXJyZW50IGFuZCBwcmVyZXEgc2VyaWVz
IFsyXSBkaWRuJ3QgcmVhbGx5IGJyZWFrIHg4NiBieSB0ZXN0aW5nDQo+PiBQVkggRG9tMCAodlBD
SSkgYW5kIFBWIERvbTAgKyBIVk0gRG9tVSAoUENJIHBhc3N0aHJvdWdoIHRvIERvbVUpIHVzaW5n
IFFlbXUNCj4+IC0gbXkgY29sbGVhZ3VlIFZvbG9keW15ciBCYWJjaHVrICh3aG8gd2FzIGludm9s
dmVkIGluIHRoZSBwcmVyZXEgc2VyaWVzKSByZWNoZWNrZWQgdGhhdA0KPj4gYm90aCBzZXJpZXMg
d29ya2VkIG9uIEFybSB1c2luZyByZWFsIEhXDQo+Pg0KPj4gWW91IGNhbiBhbHNvIGZpbmQgdGhl
IHNlcmllcyBhdCBbM10uDQo+Pg0KPj4gWzFdIGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19o
dHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMjAyMjAyMDQwNjM0NTkuNjgwOTYxLTEt
YW5kcjIwMDBAZ21haWwuY29tL19fOyEhR0ZfMjlkYmNRSVVCUEEhMVA5TGV5dEpDN2QzdG5TdVFD
ams3WXFJcWZaUHBHbHJjNkVTMWwxc1VBUGJmR2JlWWcyWU00Nzd4aVV5MG9UVTl5czdxdjlNSEQ2
R05EV0NlSEhHX3Fzci1OWSQgW2xvcmVbLl1rZXJuZWxbLl1vcmddDQo+PiBbMl0gaHR0cHM6Ly91
cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8yMDIy
MDcxODIxMTUyMS42NjQ3MjktMS12b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbS9fXzshIUdGXzI5
ZGJjUUlVQlBBITFQOUxleXRKQzdkM3RuU3VRQ2prN1lxSXFmWlBwR2xyYzZFUzFsMXNVQVBiZkdi
ZVlnMllNNDc3eGlVeTBvVFU5eXM3cXY5TUhENkdORFdDZUhIR2JTY1ROYjQkIFtsb3JlWy5da2Vy
bmVsWy5db3JnXQ0KPj4gWzNdIGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dp
dGh1Yi5jb20vb3R5c2hjaGVua28xL3hlbi9jb21taXRzL3ZwY2k3X187ISFHRl8yOWRiY1FJVUJQ
QSExUDlMZXl0SkM3ZDN0blN1UUNqazdZcUlxZlpQcEdscmM2RVMxbDFzVUFQYmZHYmVZZzJZTTQ3
N3hpVXkwb1RVOXlzN3F2OU1IRDZHTkRXQ2VISEdocEFtcmNNJCBbZ2l0aHViWy5dY29tXQ0KPj4N
Cj4gSSB0ZXN0ZWQgdGhlIHdob2xlIHNlcmllcyBvbiBBUk0gTjFTRFAgYm9hcmQgZXZlcnl0aGlu
ZyB3b3JrcyBhcyBleHBlY3RlZC4NCg0KDQpTb3VuZHMgZ3JlYXQhDQoNCg0KPg0KPiBTbyBmb3Ig
dGhlIHdob2xlIHNlcmllczoNCj4gVGVzdGVkLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hA
YXJtLmNvbT4NCg0KDQpUaGFuayB5b3UgZm9yIHRlc3RpbmchDQoNCg0KPg0KPiBSZWdhcmRzLA0K
PiBSYWh1bA0KDQotLSANClJlZ2FyZHMsDQoNCk9sZWtzYW5kciBUeXNoY2hlbmtvDQo=

