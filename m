Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BF34A9B28
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 15:43:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265669.459096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFzo0-0006cY-4w; Fri, 04 Feb 2022 14:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265669.459096; Fri, 04 Feb 2022 14:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFzo0-0006am-1f; Fri, 04 Feb 2022 14:43:20 +0000
Received: by outflank-mailman (input) for mailman id 265669;
 Fri, 04 Feb 2022 14:43:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+82=ST=epam.com=prvs=4034f0a382=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFzny-0006ag-Ta
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 14:43:19 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9b77a1e-85c8-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 15:43:17 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 214ENmGq030566;
 Fri, 4 Feb 2022 14:43:13 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e15v902j4-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 14:43:12 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR03MB4480.eurprd03.prod.outlook.com (2603:10a6:803:58::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 14:43:07 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 14:43:07 +0000
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
X-Inumbo-ID: c9b77a1e-85c8-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awmKGqtwzJMxJpU4H0/u6isPskAuqT/h/a+uzc1nSyp4qJFlBACV31YfBK9peWz6MROnaK4mVeIPCf4RyM+8OppOZFDQULBA02Ey/SzrShM7rZARCA3HCki+PfjOYcrbqI7NsRWEUc5OXfECHjudO0fWz50Ghf+21U8JRLZF1YytMKUt1b6OrXG7/lZ4GbNfgd1FRAzjTpfqsBg9IcpaTp2aR4KYxNXHXl10nSvPaO2kfegn3anq7lH3JjWooPe5e2kBjF6ewaabHfd4qnjir93eTtB9SmK0Y8oOtqTXcUKdosggFvEqnzDq/R8uL7QCC8efDj/9BpdeUEYuZdpmxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jr/JeYFNvwkOH3TaAOWqQi8B6Ku515wim4Y54Gn8UFg=;
 b=aQ8A+QHSgsEbOiIfHiVXtafAOW41gXq7W7bteFsnjbCRQuRbsSNHUsAl3Wn027C+m//3LR9AOxAC38w6P365cMUOj4JFy8IaCUzngnsyxt3LKgfu/eqpEemRS9UZ/+S7Mcun6wKKsghGJNstsWCKaBTiuvEspxRi+esPprsr4pE/NgtGTtxlednK1RPWY7/elYL/V19GjRokNABOG6wrq7f4vBV56/hR7Qn7gWjKQZrBCVFG+MhE83NoXi9ovK3B/FlUh15bpiER1Ao1v5I4Sj4zQUksYDdsQPi6mLy308mirMRqIrSOBKv04C5aVbMXyZqcvjom1smbRY1aY98JpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jr/JeYFNvwkOH3TaAOWqQi8B6Ku515wim4Y54Gn8UFg=;
 b=eLNfmQ8wVZh7XngsbhQUyx+4pOgxfVVZnHxq9gsQumkryRawUCtWz562Gmm3tnVy2MyRwAjA9QKtbFoRBgYxnBfCx1MzIG/3VaSDPuVHroRewODStXP27yJicW/wZTS7+karjlJifqUURNJsJYvTh9wKr5EDHMeR07QG9J3QiYc7P2GMP07WAlehPgIG50ThsoVre3LHLd6TrojR8JlzuBI26f0siQz3VXBk2EAMT2zCUoztBjYm98pAVTV/xpcsPtSFrqObT9ZXC/N7Sm0xt54FZYSpLLPcQNez4NA/sMwpmpotss5a9+7znij+SGPcl3mA/p76C8KfaBFgzOiAwA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Jan Beulich
	<jbeulich@suse.com>
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
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Index: 
 AQHYGZFc/MnzQOjwVEeBBUHLSW0md6yDBUkAgAASSACAAATYAIAAD/WAgAAKNgCAAAbfgIAABnuAgAAQvgCAAAMCAIAAAY4AgAADxICAABrnAA==
Date: Fri, 4 Feb 2022 14:43:07 +0000
Message-ID: <3ad10a99-c706-b95f-1419-2c0c7cf37d58@epam.com>
References: <7209889d-8f17-61cc-72a4-97f6dbc1d54d@suse.com>
 <2cf022f8-b000-11b7-c6b9-90a56bc6e2ea@epam.com>
 <04726915-f39f-9019-436e-4399533c9fc3@suse.com>
 <9ed3f4ac-0a2d-ed45-9872-7c3f356a469e@epam.com>
 <c3a99712-cf7c-37da-aac1-f2ee00e6d53b@suse.com>
 <Yf0KcVD8W05A4fbB@Air-de-Roger>
 <1ed0e342-16cd-2f16-c05c-186667a22762@suse.com>
 <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
 <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
 <Yf0k6aoKK5G3iad1@Air-de-Roger>
In-Reply-To: <Yf0k6aoKK5G3iad1@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c8ad558-5114-425c-8b3b-08d9e7eca8a5
x-ms-traffictypediagnostic: VI1PR03MB4480:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR03MB44807893195BD4D2725553CDE7299@VI1PR03MB4480.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DsYrJltJ7Olkl7Jf1GFyfADpjPd4zAXkP2oNhtc/CjdKVBhLS4T+PDHrcg+r9QdlO/TOGwl1FGJsMH1i74gF/KXBJCZueUrQmnP2Xapq/23YHe7Bxm03hTWWkTpVED072BrffllED4gObh4H7GLPDPItXK6G9IJpeo4MWvI5zn9aRU2HeDkpcPNg5m2umd3Gsvvbwx19OC64ZZH+zDwPlVGJT07FiOzAjHsjRDyKTghLLGb6bAQweE3Mno5R2EXlpzhpsRZJdDWUoaVXbcdOq3rV9rzLT1g4VJa8Q5qPEyW1UkqGedgQUD10G3RBGzoLyzbEHwUJ8EfXqXWRvbV4ux8zd9Z2ciKr2Ecf2pzfv+6RJua5C8a0oxyzwpRj7UM6nfyGmx0dg0ovUyEwXt2LaoSr7j+aENskvBLwYVJkMChzFKfg+1eMAjSN4Ojnha3BsZ0HcgRe/J7y2xGndbxiz6UafCTFN4NBbZA2wRwUAu1/hxTXA0OjMnoGAQgvo35qcKQA0M1nDs0c//teKIi05AIWwj+qxjK5HE/hJ4DSs8bothXFCoJhCUxfeyadVKbMmocR0nWtXwpALWcZl/SAiVbHwkD8IpwWjkQoDQZibniLLnAE3dE1gSBWUN/spPjl49pv9HEP7EJgfIkASjgDPsoKp8qH5fnx9VwQxIJTFZSwJp/jn/HP5xb/6Vq/3ZFa5rixdRAVH94af6ptdMfsidsxNalyYEb18fYy8G8mxCZPdHNal1W4F+qQiMn9Oojf
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7416002)(6486002)(107886003)(316002)(31686004)(53546011)(2616005)(26005)(5660300002)(38070700005)(186003)(6506007)(122000001)(54906003)(508600001)(6512007)(8676002)(38100700002)(66946007)(66476007)(8936002)(83380400001)(36756003)(2906002)(91956017)(76116006)(86362001)(71200400001)(66556008)(66446008)(64756008)(31696002)(4326008)(110136005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UzBjOWhDdml4ay9oWVNPMC9mMFl6NTFwY0ZIMjJpMzF2REJvNCttOHJjbklX?=
 =?utf-8?B?ODVUaTB6U2JDUXlLaUNyMFgyOUJKUENjaTZDYm5GM0xUZGNMK0tGTXhVbkJW?=
 =?utf-8?B?c0JZM3JqNE9QRUhQdGEvcE9xKy9OdGt4clBOZVEwSGhYd2JtQ0ROMnNwTHNm?=
 =?utf-8?B?Mi9RalpCMnBRL05leVZJTkcrbjJjSkxhL2lHODh2L0ZCTndZeXkwelROajNI?=
 =?utf-8?B?MHhNYUt5bmNOQkhwMVNSdHFuUVc5NmZ3dTg0UVNKSU8vdXNQTEZOVVVWY2tK?=
 =?utf-8?B?WTRWNGZTUTNwMVpWWFYvbjhhM2QzcjNTckU4TEprZk91OVBPUlFZTkoreFJE?=
 =?utf-8?B?U0toOUR6aGUwSmpTSFBIUGR3SkUvSG9lRDdLQmw1ODd1NTFCTmM3WUhhOXY0?=
 =?utf-8?B?enplS3QyVHA3WlhNMVJONjlZRXkvZzdpVDB4WXY4RFM2ZCtyMmhVdE1xbURH?=
 =?utf-8?B?TnNMWXFLR1ZlVTJtTEc4VVgvenpRZGhscEt5bGIwN21YVndmdi9SYkdwc1VN?=
 =?utf-8?B?by9pVlJQRmE2L3hVZmFzOWFVQngzSHNBZjIvWC9PdnROWVdHMXRlZ2ZWV3Nk?=
 =?utf-8?B?a0M4VXl4eUlaVHZUVlFJM2Ezb1l0QTBOZnFvbm9lbG93b2c5SS9HQlhSMEdK?=
 =?utf-8?B?dDVrR28zOTducEVkMldLbTJyNlBWZEZLemJYSHYrS2FwRXM0aC82S3dQRjhH?=
 =?utf-8?B?M1V1NXpmd1Bnd1dYNHI3RkNpT3AveWtLaGlBSnUxNGxkMFNSRi9hVHhWRjlM?=
 =?utf-8?B?TmZrZHRBNkpIYVJoUnBldVI4Q05xeDBrQW40QlU5VWxzbDJNZU0zRzlUdElW?=
 =?utf-8?B?MGlJMHk4VENtcjF4VDg2bTBuTWJSbnJENGFIZnlMcGkzZmhKRU1KTDlCdG5L?=
 =?utf-8?B?TllNK0VJWEJIN1VlQ2lmNFVTVDhjbmFVUnVyMU9PSEJFSFV3TUJPTnNLWmta?=
 =?utf-8?B?VlpzSHh1NWRHODdieUFQU3p6TENhRWY4SFhxeDV2K0IxUE85eG4rQUd2UE9k?=
 =?utf-8?B?SXJYblQwcmVndE94VkZVWEdLYkRaTlRsekhlVHBaUmt5Mk5ZOElaMTUxc3Fy?=
 =?utf-8?B?VUdPNmlLUmU3aDdBTlZ5SnUzRk8rRUtCMzB3cEVTY2xBUUhBOU5sOFg0bFJW?=
 =?utf-8?B?OFgzTkNkVnVTTGpCY01meDBpY1M3bSt5TEw3S3B6NFFuVG4raThEU01wTXdK?=
 =?utf-8?B?V3ZuRW9OMTRWbFRuWitoZXBqa0ZmOUt3dDFtWTA1eWNYb25tN0xDeWNQSjZK?=
 =?utf-8?B?UVhDTS9ZOTJmTjAraHo1MnNSVGJCWGl2SGwxYUFIeWNjazJwN21IYWZJaUZy?=
 =?utf-8?B?cUsyNUJkRjhubWZiS2dpRms5RkdaWUJjaUxzaGt2dStvNStCVE9pdHBRYkJr?=
 =?utf-8?B?M0ZQYVgxWGhhS0dLQmZNc215YkpHQnRRdjd3ZnNBcG1HY2JpMHV2OTJJczI1?=
 =?utf-8?B?ODRLVmMrdWw3d20wdUpXQVROTmtIZWZjb0xXWWt5eEN3WnkyVFlqVUdORGVs?=
 =?utf-8?B?cWIwSzJiMndqK0ZKZ1BzdG0xOUZWUHFia05UVnlTWjFMMWN3WE1oazdkMHR6?=
 =?utf-8?B?eU9RWjBzVW9Uby9oVzMxdGY5L1hDK3BqSXMveTdIL1EyWUJ6dFB6UlZWNXJH?=
 =?utf-8?B?K0RpMzQybGFvdTMwY090ZlJhQUlNWTRIUmtBaThCZndmUGdNZE1xQXFUbk9Q?=
 =?utf-8?B?UnNWVnNsQmdmR3Z6dWlEeUFYb2h2blFoZmpQaGl4TWdlb1FtQytXSGlFT1hO?=
 =?utf-8?B?WmdhSnQ5K3NSR0QyS2JUWkVDRjArdXgvQTJDQWxlN28wcEsxczIyN09SS1JE?=
 =?utf-8?B?VFR6OWhIZk9mbWJCVDdlTzhqTmJQUVJUcDUzTUdaM0VvOWJFYVBKd2pDdlBh?=
 =?utf-8?B?M0lGMGtvQjFCQkhnUHd4Mks0Sm50RDR5UHZTMVpuVE5WV3NZZTYySHRITU00?=
 =?utf-8?B?ODY2YkV0WmhFZXFsdkZtdU02cXZVTHI1b0NUc0EwdEx5cjdzeVJyc3dLN1RD?=
 =?utf-8?B?NytQWUI2OWdDMWVkeGJHR1RVQkxJUFhnOU5HYXk0R2VQZHlyTk54NkJ1a3RK?=
 =?utf-8?B?UDZJYTlES2RYRG1oWEFUSGcyVC9ZRmk3RDF2Mld3WXdoS1g2N0ZCWHBWQVNC?=
 =?utf-8?B?ZkRnemxCVTZwWWZXd1liOWtYaGdWMFFDQ3c2OFZkZHdrYXpxRlZHcXovNFQw?=
 =?utf-8?B?ekQ2L1JTTy9ja0lncGx1YmpKcDdpK0dNOTFlR3B0ek1wc1RTQk9BZ3RiNURy?=
 =?utf-8?B?aXMzMWs3VnNIREx3elRVWTRyR0ZHYzFJZFl6UmQ1eHU4TmhnOXRVV2FNNktR?=
 =?utf-8?B?ZDFhSmJWNm9hNHBLZ1RnZ1dYVDlkNzIrMlNrK2t3emJCWFZBS0JFQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E35A4ACF7E29140AE4A80647C5CB41A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8ad558-5114-425c-8b3b-08d9e7eca8a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 14:43:07.6261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zxdDLDswhT/Mz3EpiCb+5lsettFgzpWuT17Re7M3CSFU6wYFSGhMvlBOvyH+AcMpK05P2rLYS5R18I/aiBat1vChmbqEEf4kbPMsp2q59iKjtvHlCX02EBDzaA0bkoMJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4480
X-Proofpoint-GUID: d17OWlLByjUBxrNU9ljJT5Et32CXVQ-A
X-Proofpoint-ORIG-GUID: d17OWlLByjUBxrNU9ljJT5Et32CXVQ-A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_06,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202040083

DQoNCk9uIDA0LjAyLjIyIDE1OjA2LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBGcmks
IEZlYiAwNCwgMjAyMiBhdCAxMjo1MzoyMFBNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+DQo+PiBPbiAwNC4wMi4yMiAxNDo0NywgSmFuIEJldWxpY2ggd3JvdGU6DQo+
Pj4gT24gMDQuMDIuMjAyMiAxMzozNywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+
Pj4+IE9uIDA0LjAyLjIyIDEzOjM3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+IE9uIDA0LjAy
LjIwMjIgMTI6MTMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+Pj4gT24gRnJpLCBGZWIg
MDQsIDIwMjIgYXQgMTE6NDk6MThBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+
IE9uIDA0LjAyLjIwMjIgMTE6MTIsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+
Pj4+Pj4gT24gMDQuMDIuMjIgMTE6MTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+Pj4+IE9u
IDA0LjAyLjIwMjIgMDk6NTgsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+
Pj4+PiBPbiAwNC4wMi4yMiAwOTo1MiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4+Pj4+PiBP
biAwNC4wMi4yMDIyIDA3OjM0LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+
Pj4+Pj4+PiBAQCAtMjg1LDYgKzI4NiwxMiBAQCBzdGF0aWMgaW50IG1vZGlmeV9iYXJzKGNvbnN0
IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1aW50MTZfdCBjbWQsIGJvb2wgcm9tX29ubHkpDQo+Pj4+
Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4+Pj4+Pj4+Pj4+ICAg
ICAgICAgICAgICAgfQ0KPj4+Pj4+Pj4+Pj4+ICAgICAgIA0KPj4+Pj4+Pj4+Pj4+ICsgICAgICAg
IHNwaW5fbG9jaygmdG1wLT52cGNpX2xvY2spOw0KPj4+Pj4+Pj4+Pj4+ICsgICAgICAgIGlmICgg
IXRtcC0+dnBjaSApDQo+Pj4+Pj4+Pj4+Pj4gKyAgICAgICAgew0KPj4+Pj4+Pj4+Pj4+ICsgICAg
ICAgICAgICBzcGluX3VubG9jaygmdG1wLT52cGNpX2xvY2spOw0KPj4+Pj4+Pj4+Pj4+ICsgICAg
ICAgICAgICBjb250aW51ZTsNCj4+Pj4+Pj4+Pj4+PiArICAgICAgICB9DQo+Pj4+Pj4+Pj4+Pj4g
ICAgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJWkUodG1wLT52cGNpLT5oZWFk
ZXIuYmFycyk7IGkrKyApDQo+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICB7DQo+Pj4+Pj4+Pj4+
Pj4gICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHZwY2lfYmFyICpiYXIgPSAmdG1wLT52
cGNpLT5oZWFkZXIuYmFyc1tpXTsNCj4+Pj4+Pj4+Pj4+PiBAQCAtMzAzLDEyICszMTAsMTQgQEAg
c3RhdGljIGludCBtb2RpZnlfYmFycyhjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdWludDE2
X3QgY21kLCBib29sIHJvbV9vbmx5KQ0KPj4+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgIHJj
ID0gcmFuZ2VzZXRfcmVtb3ZlX3JhbmdlKG1lbSwgc3RhcnQsIGVuZCk7DQo+Pj4+Pj4+Pj4+Pj4g
ICAgICAgICAgICAgICAgICAgaWYgKCByYyApDQo+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAg
ICAgew0KPj4+Pj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgc3Bpbl91bmxvY2soJnRtcC0+dnBj
aV9sb2NrKTsNCj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxP
R19HX1dBUk5JTkcgIkZhaWxlZCB0byByZW1vdmUgWyVseCwgJWx4XTogJWRcbiIsDQo+Pj4+Pj4+
Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGFydCwgZW5kLCByYyk7DQo+Pj4+
Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgIHJhbmdlc2V0X2Rlc3Ryb3kobWVtKTsNCj4+
Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOw0KPj4+Pj4+Pj4+Pj4+
ICAgICAgICAgICAgICAgICAgIH0NCj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAgIH0NCj4+Pj4+
Pj4+Pj4+PiArICAgICAgICBzcGluX3VubG9jaygmdG1wLT52cGNpX2xvY2spOw0KPj4+Pj4+Pj4+
Pj4+ICAgICAgICAgICB9DQo+Pj4+Pj4+Pj4+PiBBdCB0aGUgZmlyc3QgZ2xhbmNlIHRoaXMgc2lt
cGx5IGxvb2tzIGxpa2UgYW5vdGhlciB1bmp1c3RpZmllZCAoaW4gdGhlDQo+Pj4+Pj4+Pj4+PiBk
ZXNjcmlwdGlvbikgY2hhbmdlLCBhcyB5b3UncmUgbm90IGNvbnZlcnRpbmcgYW55dGhpbmcgaGVy
ZSBidXQgeW91DQo+Pj4+Pj4+Pj4+PiBhY3R1YWxseSBhZGQgbG9ja2luZyAoYW5kIEkgcmVhbGl6
ZSB0aGlzIHdhcyB0aGVyZSBiZWZvcmUsIHNvIEknbSBzb3JyeQ0KPj4+Pj4+Pj4+Pj4gZm9yIG5v
dCBwb2ludGluZyB0aGlzIG91dCBlYXJsaWVyKS4NCj4+Pj4+Pj4+Pj4gV2VsbCwgSSB0aG91Z2h0
IHRoYXQgdGhlIGRlc2NyaXB0aW9uIGFscmVhZHkgaGFzICIuLi50aGUgbG9jayBjYW4gYmUNCj4+
Pj4+Pj4+Pj4gdXNlZCAoYW5kIGluIGEgZmV3IGNhc2VzIGlzIHVzZWQgcmlnaHQgYXdheSkgdG8g
Y2hlY2sgd2hldGhlciB2cGNpDQo+Pj4+Pj4+Pj4+IGlzIHByZXNlbnQiIGFuZCB0aGlzIGlzIGVu
b3VnaCBmb3Igc3VjaCB1c2VzIGFzIGhlcmUuDQo+Pj4+Pj4+Pj4+PiAgICAgICBCdXQgdGhlbiBJ
IHdvbmRlciB3aGV0aGVyIHlvdQ0KPj4+Pj4+Pj4+Pj4gYWN0dWFsbHkgdGVzdGVkIHRoaXMsIHNp
bmNlIEkgY2FuJ3QgaGVscCBnZXR0aW5nIHRoZSBpbXByZXNzaW9uIHRoYXQNCj4+Pj4+Pj4+Pj4+
IHlvdSdyZSBpbnRyb2R1Y2luZyBhIGxpdmUtbG9jazogVGhlIGZ1bmN0aW9uIGlzIGNhbGxlZCBm
cm9tIGNtZF93cml0ZSgpDQo+Pj4+Pj4+Pj4+PiBhbmQgcm9tX3dyaXRlKCksIHdoaWNoIGluIHR1
cm4gYXJlIGNhbGxlZCBvdXQgb2YgdnBjaV93cml0ZSgpLiBZZXQgdGhhdA0KPj4+Pj4+Pj4+Pj4g
ZnVuY3Rpb24gYWxyZWFkeSBob2xkcyB0aGUgbG9jaywgYW5kIHRoZSBsb2NrIGlzIG5vdCAoY3Vy
cmVudGx5KQ0KPj4+Pj4+Pj4+Pj4gcmVjdXJzaXZlLiAoRm9yIHRoZSAzcmQgY2FsbGVyIG9mIHRo
ZSBmdW5jdGlvbiAtIGluaXRfYmFycygpIC0gb3RvaA0KPj4+Pj4+Pj4+Pj4gdGhlIGxvY2tpbmcg
bG9va3MgdG8gYmUgZW50aXJlbHkgdW5uZWNlc3NhcnkuKQ0KPj4+Pj4+Pj4+PiBXZWxsLCB5b3Ug
YXJlIGNvcnJlY3Q6IGlmIHRtcCAhPSBwZGV2IHRoZW4gaXQgaXMgY29ycmVjdCB0byBhY3F1aXJl
DQo+Pj4+Pj4+Pj4+IHRoZSBsb2NrLiBCdXQgaWYgdG1wID09IHBkZXYgYW5kIHJvbV9vbmx5ID09
IHRydWUNCj4+Pj4+Pj4+Pj4gdGhlbiB3ZSdsbCBkZWFkbG9jay4NCj4+Pj4+Pj4+Pj4NCj4+Pj4+
Pj4+Pj4gSXQgc2VlbXMgd2UgbmVlZCB0byBoYXZlIHRoZSBsb2NraW5nIGNvbmRpdGlvbmFsLCBl
LmcuIG9ubHkgbG9jaw0KPj4+Pj4+Pj4+PiBpZiB0bXAgIT0gcGRldg0KPj4+Pj4+Pj4+IFdoaWNo
IHdpbGwgYWRkcmVzcyB0aGUgbGl2ZS1sb2NrLCBidXQgaW50cm9kdWNlIEFCQkEgZGVhZGxvY2sg
cG90ZW50aWFsDQo+Pj4+Pj4+Pj4gYmV0d2VlbiB0aGUgdHdvIGxvY2tzLg0KPj4+Pj4+Pj4gSSBh
bSBub3Qgc3VyZSBJIGNhbiBzdWdnZXN0IGEgYmV0dGVyIHNvbHV0aW9uIGhlcmUNCj4+Pj4+Pj4+
IEBSb2dlciwgQEphbiwgY291bGQgeW91IHBsZWFzZSBoZWxwIGhlcmU/DQo+Pj4+Pj4+IFdlbGws
IGZpcnN0IG9mIGFsbCBJJ2QgbGlrZSB0byBtZW50aW9uIHRoYXQgd2hpbGUgaXQgbWF5IGhhdmUg
YmVlbiBva2F5IHRvDQo+Pj4+Pj4+IG5vdCBob2xkIHBjaWRldnNfbG9jayBoZXJlIGZvciBEb20w
LCBpdCBzdXJlbHkgbmVlZHMgYWNxdWlyaW5nIHdoZW4gZGVhbGluZw0KPj4+Pj4+PiB3aXRoIERv
bVUtcycgbGlzdHMgb2YgUENJIGRldmljZXMuIFRoZSByZXF1aXJlbWVudCByZWFsbHkgYXBwbGll
cyB0byB0aGUNCj4+Pj4+Pj4gb3RoZXIgdXNlIG9mIGZvcl9lYWNoX3BkZXYoKSBhcyB3ZWxsIChp
biB2cGNpX2R1bXBfbXNpKCkpLCBleGNlcHQgdGhhdA0KPj4+Pj4+PiB0aGVyZSBpdCBwcm9iYWJs
eSB3YW50cyB0byBiZSBhIHRyeS1sb2NrLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBOZXh0IEknZCBsaWtl
IHRvIHBvaW50IG91dCB0aGF0IGhlcmUgd2UgaGF2ZSB0aGUgc3RpbGwgcGVuZGluZyBpc3N1ZSBv
Zg0KPj4+Pj4+PiBob3cgdG8gZGVhbCB3aXRoIGhpZGRlbiBkZXZpY2VzLCB3aGljaCBEb20wIGNh
biBhY2Nlc3MuIFNlZSBteSBSRkMgcGF0Y2gNCj4+Pj4+Pj4gInZQQ0k6IGFjY291bnQgZm9yIGhp
ZGRlbiBkZXZpY2VzIGluIG1vZGlmeV9iYXJzKCkiLiBXaGF0ZXZlciB0aGUgc29sdXRpb24NCj4+
Pj4+Pj4gaGVyZSwgSSB0aGluayBpdCB3YW50cyB0byBhdCBsZWFzdCBhY2NvdW50IGZvciB0aGUg
ZXh0cmEgbmVlZCB0aGVyZS4NCj4+Pj4+PiBZZXMsIHNvcnJ5LCBJIHNob3VsZCB0YWtlIGNhcmUg
b2YgdGhhdC4NCj4+Pj4+Pg0KPj4+Pj4+PiBOb3cgaXQgaXMgcXVpdGUgY2xlYXIgdGhhdCBwY2lk
ZXZzX2xvY2sgaXNuJ3QgZ29pbmcgdG8gaGVscCB3aXRoIGF2b2lkaW5nDQo+Pj4+Pj4+IHRoZSBk
ZWFkbG9jaywgYXMgaXQncyBpbW8gbm90IGFuIG9wdGlvbiBhdCBhbGwgdG8gYWNxdWlyZSB0aGF0
IGxvY2sNCj4+Pj4+Pj4gZXZlcnl3aGVyZSBlbHNlIHlvdSBhY2Nlc3MgLT52cGNpIChvciBlbHNl
IHRoZSB2cGNpIGxvY2sgaXRzZWxmIHdvdWxkIGJlDQo+Pj4+Pj4+IHBvaW50bGVzcykuIEJ1dCBh
IHBlci1kb21haW4gYXV4aWxpYXJ5IHIvdyBsb2NrIG1heSBoZWxwOiBPdGhlciBwYXRocw0KPj4+
Pj4+PiB3b3VsZCBhY3F1aXJlIGl0IGluIHJlYWQgbW9kZSwgYW5kIGhlcmUgeW91J2QgYWNxdWly
ZSBpdCBpbiB3cml0ZSBtb2RlIChpbg0KPj4+Pj4+PiB0aGUgZm9ybWVyIGNhc2UgYXJvdW5kIHRo
ZSB2cGNpIGxvY2ssIHdoaWxlIGluIHRoZSBsYXR0ZXIgY2FzZSB0aGVyZSBtYXkNCj4+Pj4+Pj4g
dGhlbiBub3QgYmUgYW55IG5lZWQgdG8gYWNxdWlyZSB0aGUgaW5kaXZpZHVhbCB2cGNpIGxvY2tz
IGF0IGFsbCkuIEZUQU9EOg0KPj4+Pj4+PiBJIGhhdmVuJ3QgZnVsbHkgdGhvdWdodCB0aHJvdWdo
IGFsbCBpbXBsaWNhdGlvbnMgKGFuZCBoZW5jZSB3aGV0aGVyIHRoaXMgaXMNCj4+Pj4+Pj4gdmlh
YmxlIGluIHRoZSBmaXJzdCBwbGFjZSk7IEkgZXhwZWN0IHlvdSB3aWxsLCBkb2N1bWVudGluZyB3
aGF0IHlvdSd2ZQ0KPj4+Pj4+PiBmb3VuZCBpbiB0aGUgcmVzdWx0aW5nIHBhdGNoIGRlc2NyaXB0
aW9uLiBPZiBjb3Vyc2UgdGhlIGRvdWJsZSBsb2NrDQo+Pj4+Pj4+IGFjcXVpcmUvcmVsZWFzZSB3
b3VsZCB0aGVuIGxpa2VseSB3YW50IGhpZGluZyBpbiBoZWxwZXIgZnVuY3Rpb25zLg0KPj4+Pj4+
IEkndmUgYmVlbiBhbHNvIHRoaW5raW5nIGFib3V0IHRoaXMsIGFuZCB3aGV0aGVyIGl0J3MgcmVh
bGx5IHdvcnRoIHRvDQo+Pj4+Pj4gaGF2ZSBhIHBlci1kZXZpY2UgbG9jayByYXRoZXIgdGhhbiBh
IHBlci1kb21haW4gb25lIHRoYXQgcHJvdGVjdHMgYWxsDQo+Pj4+Pj4gdnBjaSByZWdpb25zIG9m
IHRoZSBkZXZpY2VzIGFzc2lnbmVkIHRvIHRoZSBkb21haW4uDQo+Pj4+Pj4NCj4+Pj4+PiBUaGUg
T1MgaXMgbGlrZWx5IHRvIHNlcmlhbGl6ZSBhY2Nlc3NlcyB0byB0aGUgUENJIGNvbmZpZyBzcGFj
ZSBhbnl3YXksDQo+Pj4+Pj4gYW5kIHRoZSBvbmx5IHBsYWNlIEkgY291bGQgc2VlIGEgYmVuZWZp
dCBvZiBoYXZpbmcgcGVyLWRldmljZSBsb2NrcyBpcw0KPj4+Pj4+IGluIHRoZSBoYW5kbGluZyBv
ZiBNU0ktWCB0YWJsZXMsIGFzIHRoZSBoYW5kbGluZyBvZiB0aGUgbWFzayBiaXQgaXMNCj4+Pj4+
PiBsaWtlbHkgdmVyeSBwZXJmb3JtYW5jZSBzZW5zaXRpdmUsIHNvIGFkZGluZyBhIHBlci1kb21h
aW4gbG9jayB0aGVyZQ0KPj4+Pj4+IGNvdWxkIGJlIGEgYm90dGxlbmVjay4NCj4+Pj4+IEhtbSwg
d2l0aCBtZXRob2QgMSBhY2Nlc3NlcyBzZXJpYWxpemluZyBnbG9iYWxseSBpcyBiYXNpY2FsbHkN
Cj4+Pj4+IHVuYXZvaWRhYmxlLCBidXQgd2l0aCBNTUNGRyBJIHNlZSBubyByZWFzb24gd2h5IE9T
ZXMgbWF5IG5vdCAobW92ZQ0KPj4+Pj4gdG8pIHBlcm1pdCh0aW5nKSBwYXJhbGxlbCBhY2Nlc3Nl
cywgd2l0aCBzZXJpYWxpemF0aW9uIHBlcmhhcHMgZG9uZQ0KPj4+Pj4gb25seSBhdCBkZXZpY2Ug
bGV2ZWwuIFNlZSBvdXIgb3duIHBjaV9jb25maWdfbG9jaywgd2hpY2ggYXBwbGllcyB0bw0KPj4+
Pj4gb25seSBtZXRob2QgMSBhY2Nlc3Nlczsgd2UgZG9uJ3QgbG9vayB0byBiZSBzZXJpYWxpemlu
ZyBNTUNGRw0KPj4+Pj4gYWNjZXNzZXMgYXQgYWxsLg0KPj4+Pj4NCj4+Pj4+PiBXZSBjb3VsZCBh
bHRlcm5hdGl2ZWx5IGRvIGEgcGVyLWRvbWFpbiByd2xvY2sgZm9yIHZwY2kgYW5kIHNwZWNpYWwg
Y2FzZQ0KPj4+Pj4+IHRoZSBNU0ktWCBhcmVhIHRvIGFsc28gaGF2ZSBhIHBlci1kZXZpY2Ugc3Bl
Y2lmaWMgbG9jay4gQXQgd2hpY2ggcG9pbnQNCj4+Pj4+PiBpdCBiZWNvbWVzIGZhaXJseSBzaW1p
bGFyIHRvIHdoYXQgeW91IHByb3Bvc2UuDQo+Pj4+IEBKYW4sIEBSb2dlcg0KPj4+Pg0KPj4+PiAx
LiBkLT52cGNpX2xvY2sgLSByd2xvY2sgPC0gdGhpcyBwcm90ZWN0cyB2cGNpDQo+Pj4+IDIuIHBk
ZXYtPnZwY2ktPm1zaXhfdGJsX2xvY2sgLSByd2xvY2sgPC0gdGhpcyBwcm90ZWN0cyBNU0ktWCB0
YWJsZXMNCj4+Pj4gb3Igc2hvdWxkIGl0IGJldHRlciBiZSBwZGV2LT5tc2l4X3RibF9sb2NrIGFz
IE1TSS1YIHRhYmxlcyBkb24ndA0KPj4+PiByZWFsbHkgZGVwZW5kIG9uIHZQQ0k/DQo+Pj4gSWYg
c28sIHBlcmhhcHMgaW5kZWVkIGJldHRlciB0aGUgbGF0dGVyLiBCdXQgYXMgc2FpZCBpbiByZXBs
eSB0byBSb2dlciwNCj4+PiBJJ20gbm90IGNvbnZpbmNlZCAoeWV0KSB0aGF0IGRvaW5nIGF3YXkg
d2l0aCB0aGUgcGVyLWRldmljZSBsb2NrIGlzIGENCj4+PiBnb29kIG1vdmUuIEFzIHNhaWQgdGhl
cmUgLSB3ZSdyZSBvdXJzZWx2ZXMgZG9pbmcgZnVsbHkgcGFyYWxsZWwgTU1DRkcNCj4+PiBhY2Nl
c3Nlcywgc28gT1NlcyBvdWdodCB0byBiZSBmaW5lIHRvIGRvIHNvLCB0b28uDQo+PiBCdXQgd2l0
aCBwZGV2LT52cGNpX2xvY2sgd2UgZmFjZSBBQkJBLi4uDQo+IEkgdGhpbmsgaXQgd291bGQgYmUg
ZWFzaWVyIHRvIHN0YXJ0IHdpdGggYSBwZXItZG9tYWluIHJ3bG9jayB0aGF0DQo+IGd1YXJhbnRl
ZXMgcGRldi0+dnBjaSBjYW5ub3QgYmUgcmVtb3ZlZCB1bmRlciBvdXIgZmVldC4gVGhpcyB3b3Vs
ZCBiZQ0KPiB0YWtlbiBpbiByZWFkIG1vZGUgaW4gdnBjaV97cmVhZCx3cml0ZX0gYW5kIGluIHdy
aXRlIG1vZGUgd2hlbg0KPiByZW1vdmluZyBhIGRldmljZSBmcm9tIGEgZG9tYWluLg0KPg0KPiBU
aGVuIHRoZXJlIGFyZSBhbHNvIG90aGVyIGlzc3VlcyByZWdhcmRpbmcgdlBDSSBsb2NraW5nIHRo
YXQgbmVlZCB0bw0KPiBiZSBmaXhlZCwgYnV0IHRoYXQgbG9jayB3b3VsZCBsaWtlbHkgYmUgYSBz
dGFydC4NCk9yIGxldCdzIHNlZSB0aGUgcHJvYmxlbSBhdCBhIGRpZmZlcmVudCBhbmdsZTogdGhp
cyBpcyB0aGUgb25seSBwbGFjZQ0Kd2hpY2ggYnJlYWtzIHRoZSB1c2Ugb2YgcGRldi0+dnBjaV9s
b2NrLiBCZWNhdXNlIGFsbCBvdGhlciBwbGFjZXMNCmRvIG5vdCB0cnkgdG8gYWNxdWlyZSB0aGUg
bG9jayBvZiBhbnkgdHdvIGRldmljZXMgYXQgYSB0aW1lLg0KU28sIHdoYXQgaWYgd2UgcmUtd29y
ayB0aGUgb2ZmZW5kaW5nIHBpZWNlIG9mIGNvZGUgaW5zdGVhZD8NClRoYXQgd2F5IHdlIGRvIG5v
dCBicmVhayBwYXJhbGxlbCBhY2Nlc3MgYW5kIGhhdmUgdGhlIGxvY2sgcGVyLWRldmljZQ0Kd2hp
Y2ggbWlnaHQgYWxzbyBiZSBhIHBsdXMuDQoNCkJ5IHJlLXdvcmsgSSBtZWFuLCB0aGF0IGluc3Rl
YWQgb2YgcmVhZGluZyBhbHJlYWR5IG1hcHBlZCByZWdpb25zDQpmcm9tIHRtcCB3ZSBjYW4gZW1w
bG95IGEgZC0+cGNpX21hcHBlZF9yZWdpb25zIHJhbmdlIHNldCB3aGljaA0Kd2lsbCBob2xkIGFs
bCB0aGUgYWxyZWFkeSBtYXBwZWQgcmFuZ2VzLiBBbmQgd2hlbiBpdCBpcyBuZWVkZWQgdG8gYWNj
ZXNzDQp0aGF0IHJhbmdlIHNldCB3ZSB1c2UgcGNpZGV2c19sb2NrIHdoaWNoIHNlZW1zIHRvIGJl
IHJhcmUuDQpTbywgbW9kaWZ5X2JhcnMgd2lsbCByZWx5IG9uIHBkZXYtPnZwY2lfbG9jayArIHBj
aWRldnNfbG9jayBhbmQNCkFCQkEgd29uJ3QgYmUgcG9zc2libGUgYXQgYWxsLg0KDQo+DQo+IFRo
YW5rcywgUm9nZXIuDQo=

