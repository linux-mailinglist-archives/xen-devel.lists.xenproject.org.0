Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B50765141
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 12:32:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570994.893742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyHx-0003Db-4C; Thu, 27 Jul 2023 10:32:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570994.893742; Thu, 27 Jul 2023 10:32:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyHx-0003Ae-13; Thu, 27 Jul 2023 10:32:09 +0000
Received: by outflank-mailman (input) for mailman id 570994;
 Thu, 27 Jul 2023 10:32:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q9bz=DN=epam.com=prvs=1572de9637=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qOyHv-0003AY-Ps
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 10:32:07 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d477ef09-2c68-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 12:32:06 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36R9jbsI019300; Thu, 27 Jul 2023 10:32:02 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3s3p7xr5yk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jul 2023 10:32:01 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM7PR03MB6515.eurprd03.prod.outlook.com (2603:10a6:20b:1c0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 10:31:57 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 10:31:56 +0000
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
X-Inumbo-ID: d477ef09-2c68-11ee-b247-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TS6qD5nrfDxX23JYyCPhWAclKxBm5cSTudtUo89WA5WFqkG0sZuhVKB0VdJFOKCh/02tMfWxLEQX49BlHmg95pAq30R11hv6sWHiseBwKaYt+IYvrb/M5wwKSMo/muqg7uHPJiRPoyR/23jkMBznGsx8x0ejTITx8sMNgSEii8B5po7eNeTSOQEyrlbeRuMuOjB2cdusMeh9pGwi8804WcyilHLT5so6yZzRHQfRD5LO5iF8EaFZaYT8xWtdeRf4R25JHRRsRctbwu2xo9foJ0biYxdQ/VTd0nyBnnEFscy67hBomdxI4Jfx5EtBSM8E3re57uOVtoOdGSxEqptFcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLa84VPEgrBJX2PUmcYAtZebknww0/wNa0EDs0+4GFg=;
 b=QQ6dY3K+D+s+OVu8vrc5mOwob9Q4TvO7SVKveWkNSq9m55t75XwKU62hbt+2AZvPUcZZSbKEetms9M6ux9o2ehxUU/xYbgFun/vJ3FJhIy7frQ9z5Pdyotwn0MdZ05lvvpXYqkxTq7yR0rIi/LkuBJ4e+5Ro+HhrkMcILuB3mvcNecZYnJL5eHI4kzvf3SvH+RbJ8Sx+yfLzvVmhsDHe1D/q66MTd6DvNiHO+z0DcdWp5hzLziCa1edUYR8DCCKdyXNMVXxEzjEoL0Gp3Y2KlIj/hgiUbWgPWG+b8MU5JlXQYdx8Jzvuotof7rCibxL6JpBK4CXlADk25ubvqsuHwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLa84VPEgrBJX2PUmcYAtZebknww0/wNa0EDs0+4GFg=;
 b=ZNGI4h8KN8gmABtSJc3bAKI6VMY+QI3Qg2r4hdhiG4DKImYKTVm0rfWZGNvxcg4Llck/E0pNionFnoDNYGevYJ7aQu3XPrDOT0iJxtzegMOSfNca/I2DL5BoN6IQiVwozS56YPzCGKrIWrWe+pba4i62hDBhZwHs+nQO3x67wJw+z7k1J7Zf7jFvFtfEeApt0QwHpkgSUMd5+TjSeQ1GxBJ0CbMysQVrSzfZ62Qwpo/oWT0tru8vanmKiJtQUNAz2NRbJFK6sjOylvaOJbTTbdNMMRLyUhzV1DsXtHzav8llfxia5GZMJCghKGqbSxGyWKoRR9VNsiDak6676q2Nvg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Thread-Topic: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Thread-Index: 
 AQHZuqGrLMJPz1ipBEu4urExXp8yi6/CgxUAgAWEoICAA8vwgIAA+VsAgAB5WACAAC7UgA==
Date: Thu, 27 Jul 2023 10:31:56 +0000
Message-ID: <87r0otbq78.fsf@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
 <ZLkYdhOPLTmogXGq@MacBook-Air-de-Roger.local> <87ila7cvy2.fsf@epam.com>
 <ZMDox0WwumxMGnzV@MacBook-Air-de-Roger.local> <87y1j2b296.fsf@epam.com>
 <999aae1d-fb85-6550-9798-64cf88d7faf3@suse.com>
In-Reply-To: <999aae1d-fb85-6550-9798-64cf88d7faf3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6515:EE_
x-ms-office365-filtering-correlation-id: bee0e650-f86e-45d7-7208-08db8e8cb3ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QTwo0O6RXOLhW7tPgrpiXMhUaAYhLNyPgvMEw05bY6JUDFC1I98tUPzun1ttf5rBqys30Qza9LBtxR2ZZBVvwntmg6EF3koS+tr5HTekbU+MhomYA/6zjZfXw6pM5FVhFrvpBTnenZxdsHUYd0thDhXm5gsuGVLDPEUQACLS3enfWnedZAuRaKBxk0F8nUpsI1se7opmYH72ZANbJVoEpucKqgFCnAgT5jjDTHCiiKPRu9Cqx6/uoWGUXhZW7YT2IyLEkQuT2tcw5PVO7k9kvTKuiqk/eQIgrr9+BAOqWIrf1UncLTJQRVu8xM0tyAhsn+cvYEf90EEMyyrxQV8vZm5C1CxC2655nLig02JgUW/uj4JLVooOvOOjJeXhY3jC7XBNkI/u5Xag7jtjkz5GfOx273G6z8gJcwC5PmlFXIBtkaDjl5zZ4FLk4lXoytJn6DpMhDkd5joVEO5ES3iFiWOpUYkRGedvHl3RaEL5KxCMeKWlpQTXbglS6HRMAyKPDtc3heHjw1YMUtrBTPSaEWhIkl0CbaQTlsOK2iL4HvFeK0cuIV2ykvGkJx7847QTiWxM6IFfAv+v1tBqKT4v5zFlZsRGg5jjrAOfIJhcn27aBsstiH6IZH+VioF/qTFQ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(39860400002)(136003)(376002)(396003)(451199021)(86362001)(2906002)(8676002)(8936002)(38070700005)(83380400001)(5660300002)(316002)(91956017)(76116006)(64756008)(66946007)(66556008)(66476007)(66446008)(38100700002)(6916009)(4326008)(36756003)(2616005)(54906003)(122000001)(186003)(6486002)(26005)(53546011)(55236004)(6506007)(478600001)(71200400001)(41300700001)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MUFHc1hyVEdDaURhY29yclpQTjdkazFLSUh3TURMOVhiU0N4NFpKbXFaWHlj?=
 =?utf-8?B?VU9hNC9CMkF5N3FTRXBJYVhMaEVCcTdvYnROcldreUxBV1Q0OXZ2eWNkUitG?=
 =?utf-8?B?WVlPTU55aDJLdVpmNk5oSG9EOEMvMENURVVjbXVlbTZ3WjF1am54cERBNWZv?=
 =?utf-8?B?WHl5YjBXL05NNTNnRFNPUHp1NlJBODlxME5IcndjUWJKUkZtRUFOUC9mRzlU?=
 =?utf-8?B?RXdqSGV6V3l6dnE3ME5pcWRmMG9Bb0VRb09wdzdZcU9Yb2ZISDNRakhDWjVX?=
 =?utf-8?B?Yzg2dmRhZ1BvRGdNMVNkbDQwUHQ5c0c5YTM3SzFjOTd3VStxZlc1UEMwZVFF?=
 =?utf-8?B?Q1UxVVZHdkxVc0kwZUhtVEN5a2FtVy84dEJPMHdtc2JITGp6ekRYV2pnTXJK?=
 =?utf-8?B?MitFdTI2bnBDKy8wbjRSMEY1L2tqd3NYaEs1akFhZHFSYU8xdVBsVHJ0M1Vq?=
 =?utf-8?B?SFlUK1VTL3BFWEtsNS9qK3cyd2xuTDNBT1I0TnVLTW5iVVlUVTlkcVJHdTBv?=
 =?utf-8?B?cE9CNWZTSy9KREZpQU9hQ0lEZUJvRW9WUkRCSnpqS1lrRjNqZHVmN243a1pS?=
 =?utf-8?B?cWFqMVVyK0dFQkJTUDcyUk92eHBqalBNQUhzK0hQSnFxNTFvbXh4TzRmalZR?=
 =?utf-8?B?ZmxOSDRjOE84TnhEOHNLZG5qNUw4Y29BU0NEOXpnNS91YWN4WmQ2MkZXYjM0?=
 =?utf-8?B?WjV1N0V5aXlmekZDaVVEc0M4a3ZXelZDajErWjNadUVQOEF5enkvOWVRWVFN?=
 =?utf-8?B?WUxnYmNwNWp4VmhjWmJ3WnFLc2hnTjBpM0ZnMDlGOHF0VmhsNnFTQ3phU3or?=
 =?utf-8?B?TkoxTG5yK3EvWXBZa05MYitQSy9FMm0ya3BEdTZ4Z3E1dDBROWJUbHVVa0dZ?=
 =?utf-8?B?M3BkUGhNK3c2MmlaMjJLT2FNSGZ4VWNLWitubGFGUUJiUnNxSFdJZXAvdnFh?=
 =?utf-8?B?S1ZqNUN2Q0xKcTF1R0ZCNFlrVmM2cHFmTXpCTGVwK2NjTkJjZGZMaXR1QTIy?=
 =?utf-8?B?bDZSdHdqOGtsV0g2QnNYR1Q2ZE90WFM2eXpXNEE3WDZMYnlqUE9nbXJuU0Jo?=
 =?utf-8?B?MWl2SzdqQmNQKzRoT1JRK1l0Z1phYXVtQy8weVBoaFd0TFBDT1ltWkYzd0tL?=
 =?utf-8?B?UnVidW4weE96VjdNZW8zQ2Y4T2JTRXg3Y1ZFWURzbjVBWkxqRjJVVVQwLzFT?=
 =?utf-8?B?L2x1UEdaVmlqV0JyUERIMDJHaWhnT1Z6U1pkUlZKaEcvM3h2STZUWStvRVRl?=
 =?utf-8?B?QUtQT3FFYlR6bHRmZW9KVHZmcFowcU9GNmlqNVlUMEloNVhGczRBcUh0MjA5?=
 =?utf-8?B?amNTclMwbVlkbnRuZ0NEN0dwbE1kdWd4ZXFJSGh1ditXak01YW9sa0FoVmZw?=
 =?utf-8?B?THUzWnR0OXExdnhMY3hxbTk1NENWSFd6R1JjYkVXWG9MM1AwUHJPcDRiQWh2?=
 =?utf-8?B?dG5xaExGRHduNEpyTVJDbENlcjMxQWg4amVZMlUxOThqbWJNTDZKUTdUY1BB?=
 =?utf-8?B?cHBnakRvT2dtU0FDMnYwTnc2bjk5Rk9ya09vUFV3TTQ0anc0bG5mRHowQnZL?=
 =?utf-8?B?NHlUbmRZanBqK2dtQi9Kc1R0b3MyZHBDUm5lUHQwL2dMVHBSU2xqRXRtdWh3?=
 =?utf-8?B?b0g0bml0bERrZzB5UzNDVWRud1A1Q1hxUGJWNm1GZk9PUHpDME5sb24xc2FW?=
 =?utf-8?B?QUFBWC8vb2hHVnZTTTdnRnp1WU5RVWgvSXJldmtudmRFUmp4OExMTk85eUVl?=
 =?utf-8?B?VWJkK0Z1VkNtdTFwYXNvRUx1cVJzTUVIRTg2MVU0bDZMSGJuYkhpRW02RjNN?=
 =?utf-8?B?S3N6bVBMVWM0bUVKZ3NYWWFjdGxzWGswMFBxeVFURDJ2L1drYVNrZ09UYThh?=
 =?utf-8?B?T2IvbEhCalZaQWhRMnJsU1FvZWZnT1ovanZwU0k2WGVSVXFvekhTcmlJUXB5?=
 =?utf-8?B?dERsT0NDcGNOUVFBTXg3MGt6LzYzZy9Mb0ZRcXY0akhXdG5ydDliN2hMNUdE?=
 =?utf-8?B?TTFGRXVvbC9FTlNYVWdnV1ByWGJpMzZqRGNzVkVQd3VHSHNVcDVEWjFhQjZG?=
 =?utf-8?B?cXNaczNKaGloU0lud0dHQ3c4QjMyZWhnV1pyVFdKaEZSaU10OEhuejUrN05O?=
 =?utf-8?B?SHVhWGJvNUMzZ3J5NDFCUjc0b2xJNk9lNi9IcENsQ0M4TVpWOGZBMGUzQzhz?=
 =?utf-8?B?VGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCA321D02ADB224DAAA5E83265D7B780@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bee0e650-f86e-45d7-7208-08db8e8cb3ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 10:31:56.8434
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VGa/dd8rUJYw9kef2hYKHPhBgQQUu7ynAaVGVr0zB0lBKOO8ocobo14P73rK9nFyEpr3BYiRuKKlPgA0D1n3PQ0PtWBULLujjBP3/J80MFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6515
X-Proofpoint-GUID: EIii4BxC85ozcCG3VKTHB8jWZPmyZ5OJ
X-Proofpoint-ORIG-GUID: EIii4BxC85ozcCG3VKTHB8jWZPmyZ5OJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_06,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=738 spamscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307270094

DQpIaSBKYW4NCg0KSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cml0ZXM6DQoNCj4g
T24gMjcuMDcuMjAyMyAwMjo1NiwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+PiBIaSBSb2dl
ciwNCj4+IA0KPj4gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyaXRl
czoNCj4+IA0KPj4+IE9uIFdlZCwgSnVsIDI2LCAyMDIzIGF0IDAxOjE3OjU4QU0gKzAwMDAsIFZv
bG9keW15ciBCYWJjaHVrIHdyb3RlOg0KPj4+Pg0KPj4+PiBIaSBSb2dlciwNCj4+Pj4NCj4+Pj4g
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyaXRlczoNCj4+Pj4NCj4+
Pj4+IE9uIFRodSwgSnVsIDIwLCAyMDIzIGF0IDEyOjMyOjMxQU0gKzAwMDAsIFZvbG9keW15ciBC
YWJjaHVrIHdyb3RlOg0KPj4+Pj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVr
c2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4+PiBAQCAtNDk4LDYgKzUzNyw3IEBA
IHZvaWQgdnBjaV93cml0ZShwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcsIHVuc2ln
bmVkIGludCBzaXplLA0KPj4+Pj4+ICAgICAgICAgIEFTU0VSVChkYXRhX29mZnNldCA8IHNpemUp
Ow0KPj4+Pj4+ICAgICAgfQ0KPj4+Pj4+ICAgICAgc3Bpbl91bmxvY2soJnBkZXYtPnZwY2ktPmxv
Y2spOw0KPj4+Pj4+ICsgICAgdW5sb2NrX2xvY2tzKGQpOw0KPj4+Pj4NCj4+Pj4+IFRoZXJlJ3Mg
b25lIGlzc3VlIGhlcmUsIHNvbWUgaGFuZGxlcnMgd2lsbCBjYWwgcGNpZGV2c19sb2NrKCksIHdo
aWNoDQo+Pj4+PiB3aWxsIHJlc3VsdCBpbiBhIGxvY2sgb3ZlciBpbnZlcnNpb24sIGFzIGluIHRo
ZSBwcmV2aW91cyBwYXRjaCB3ZQ0KPj4+Pj4gYWdyZWVkIHRoYXQgdGhlIGxvY2tpbmcgb3JkZXIg
d2FzIHBjaWRldnNfbG9jayBmaXJzdCwgZC0+cGNpX2xvY2sNCj4+Pj4+IGFmdGVyLg0KPj4+Pj4N
Cj4+Pj4+IEZvciBleGFtcGxlIHRoZSBNU0kgY29udHJvbF93cml0ZSgpIGhhbmRsZXIgd2lsbCBj
YWxsDQo+Pj4+PiB2cGNpX21zaV9hcmNoX2VuYWJsZSgpIHdoaWNoIHRha2VzIHRoZSBwY2lkZXZz
IGxvY2suICBJIHRoaW5rIEkgd2lsbA0KPj4+Pj4gaGF2ZSB0byBsb29rIGludG8gdXNpbmcgYSBk
ZWRpY2F0ZWQgbG9jayBmb3IgTVNJIHJlbGF0ZWQgaGFuZGxpbmcsIGFzDQo+Pj4+PiB0aGF0J3Mg
dGhlIG9ubHkgcGxhY2Ugd2hlcmUgSSB0aGluayB3ZSBoYXZlIHRoaXMgcGF0dGVybiBvZiB0YWtp
bmcgdGhlDQo+Pj4+PiBwY2lkZXZzX2xvY2sgYWZ0ZXIgdGhlIGQtPnBjaV9sb2NrLg0KPj4+Pg0K
Pj4+PiBJJ2xsIG1lbnRpb24gdGhpcyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIElzIHRoZXJlIHNv
bWV0aGluZyBlbHNlIHRoYXQgSQ0KPj4+PiBzaG91bGQgZG8gcmlnaHQgbm93Pw0KPj4+DQo+Pj4g
V2VsbCwgSSBkb24ndCB0aGluayB3ZSB3YW50IHRvIGNvbW1pdCB0aGlzIGFzLWlzIHdpdGggYSBr
bm93biBsb2NrDQo+Pj4gaW52ZXJzaW9uLg0KPj4+DQo+Pj4gVGhlIGZ1bmN0aW9ucyB0aGF0IHJl
cXVpcmUgdGhlIHBjaWRldnMgbG9jayBhcmU6DQo+Pj4NCj4+PiBwdF9pcnFfe2NyZWF0ZSxkZXN0
cm95fV9iaW5kKCkNCj4+PiB1bm1hcF9kb21haW5fcGlycSgpDQo+Pj4NCj4+PiBBRkFJQ1QgdGhv
c2UgZnVuY3Rpb25zIHJlcXVpcmUgdGhlIGxvY2sgaW4gb3JkZXIgdG8gYXNzZXJ0IHRoYXQgdGhl
DQo+Pj4gdW5kZXJseWluZyBkZXZpY2UgZG9lc24ndCBnbyBhd2F5LCBhcyB0aGV5IGRvIGFsc28g
dXNlIGQtPmV2ZW50X2xvY2sNCj4+PiBpbiBvcmRlciB0byBnZXQgZXhjbHVzaXZlIGFjY2VzcyB0
byB0aGUgZGF0YSBmaWVsZHMuICBQbGVhc2UgZG91YmxlDQo+Pj4gY2hlY2sgdGhhdCBJJ20gbm90
IG1pc3Rha2VuLg0KPj4gDQo+PiBZb3UgYXJlIHJpZ2h0LCBhbGwgdGhyZWUgZnVuY3Rpb24gZG9l
cyBub3QgYWNjZXNzIGFueSBvZiBQQ0kgc3RhdGUNCj4+IGRpcmVjdGx5LiBIb3dldmVyLi4uDQo+
PiANCj4+PiBJZiB0aGF0J3MgYWNjdXJhdGUgeW91IHdpbGwgaGF2ZSB0byBjaGVjayB0aGUgY2Fs
bCB0cmVlIHRoYXQgc3Bhd25zDQo+Pj4gZnJvbSB0aG9zZSBmdW5jdGlvbnMgaW4gb3JkZXIgdG8g
bW9kaWZ5IHRoZSBhc3NlcnRzIHRvIGNoZWNrIGZvcg0KPj4+IGVpdGhlciB0aGUgcGNpZGV2cyBv
ciB0aGUgcGVyLWRvbWFpbiBwY2lfbGlzdCBsb2NrIGJlaW5nIHRha2VuLg0KPj4gDQo+PiAuLi4g
SSBjaGVja2VkIGNhbGxzIGZvciBQVF9JUlFfVFlQRV9NU0kgY2FzZSwgdGhlcmUgaXMgb25seSBj
YWxsIHRoYXQNCj4+IGJvdGhlcnMgbWU6IGh2bV9waV91cGRhdGVfaXJ0ZSgpLCB3aGljaCBjYWxs
cyBJTy1NTVUgY29kZSB2aWENCj4+IHZteF9waV91cGRhdGVfaXJ0ZSgpOg0KPj4gDQo+PiBhbWRf
aW9tbXVfbXNpX21zZ191cGRhdGVfaXJlKCkgb3IgbXNpX21zZ193cml0ZV9yZW1hcF9ydGUoKS4N
Cj4+IA0KPj4gQm90aCBmdW5jdGlvbnMgcmVhZCBiYXNpYyBwZGV2IGZpZWxkcyBsaWtlIHNiZmQg
b3IgdHlwZS4gSSBzZWUgbm8NCj4+IHByb2JsZW0gdGhlcmUsIGFzIHZhbHVlcyBvZiB0aG9zZSBm
aWVsZHMgYXJlIG5vdCBzdXBwb3NlZCB0byBiZSBjaGFuZ2VkLg0KPg0KPiBCdXQgd2hldGhlciBm
aWVsZHMgYXJlIGJhc2ljIG9yIHdpbGwgbmV2ZXIgY2hhbmdlIGRvZXNuJ3QgbWF0dGVyIHdoZW4N
Cj4gdGhlIHBkZXYgc3RydWN0IGl0c2VsZiBzdWRkZW5seSBkaXNhcHBlYXJzLg0KDQpUaGlzIGlz
IG5vdCBhIHByb2JsZW0sIGFzIGl0IGlzIGV4cGVjdGVkIHRoYXQgZC0+cGNpX2xvY2sgaXMgYmVp
bmcgaGVsZCwNCnNvIHBkZXYgc3RydWN0dXJlIHdpbGwgbm90IGRpc2FwcGVhci4gSSBhbSB0cnlp
bmcgdG8gYW5zd2VyIGFub3RoZXINCnF1ZXN0aW9uOiBpcyBkLT5wY2lfbG9jayBlbm91Z2ggb3Ig
cGNpZGV2c19sb2NrIGlzIGFsc28gc2hvdWxkIHJlcXVpcmVkPw0KDQotLSANCldCUiwgVm9sb2R5
bXly

