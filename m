Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EFE4A3E4A
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 08:42:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262762.455123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nERJl-0002PW-MT; Mon, 31 Jan 2022 07:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262762.455123; Mon, 31 Jan 2022 07:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nERJl-0002Ng-Ir; Mon, 31 Jan 2022 07:41:41 +0000
Received: by outflank-mailman (input) for mailman id 262762;
 Mon, 31 Jan 2022 07:41:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9o41=SP=epam.com=prvs=4030d24c28=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nERJj-0002NW-Bw
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 07:41:39 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37be4695-8269-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 08:41:37 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20V6MQ7J029645;
 Mon, 31 Jan 2022 07:41:28 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dwv7tuej5-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 07:41:27 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by PA4PR03MB6782.eurprd03.prod.outlook.com (2603:10a6:102:e3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 07:41:23 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 07:41:23 +0000
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
X-Inumbo-ID: 37be4695-8269-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWyO+f81NAP83MK3p2r5HOiYg1lchKSTirM/epj4qH6uD56ZxXOOHVGzhRi6R7XRCO6caM1/ylpcN1dCe4vFVGT247tVYM7nQC2Ca6XFuNrUaJAxzj6LJnbFW5ZdnMdco0qWeGUA0AyoRSX/xzcyIAzpiAUdjzgGjMN8b95GATEncF/in20mOFMBkkSZhC0eezoaWL51HOuP7c9cWr2X3X3Zvtz8KZ9XQlz/kbw7tSLRwtci0Gi0gHw8iitJupMoYG6CYP+quWPo/NK+VAtTpopLKC62q4Go5cqSFQWyBOvP/Zj5GpW5bzky2JDjisJT/Xo8YkV0Wo69qSS/ByKZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KiuWFYK5QE6qJRwZY0N7jLLlp94MU1I9d7owCW9pn2k=;
 b=kxVeK34v00PDKaxY8sZu4QdoHjxAgbH4PAwjowfM43GjDFS+zpxeuZzGygPq04EYmAKlt9qfGK1GIO8PktYc7q07Wvo7+KBbJZkcZZ3aT7qQGyZaGhTVCe2AIwNxwU0zej6FFjBMnsL/vq+zn4Ung7lXolWo3Qdb65CjLCMUjgWxcbjmVFUdz3im5Rp4DN1P2hOC/+aLq54Y0B4D0zILcOfEKLVEb7yfhAmhuLjvFA4d1P8kIdY0Y0NX/d+rfpH/dc/sRCvRNkRT+hbuFzvrEEGxRQFOaA8Lg/qoUabW8o6/Z0fLLwNwtrZG9AOVMc8QwMQ63nVBcK0GG+pjW4gK4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiuWFYK5QE6qJRwZY0N7jLLlp94MU1I9d7owCW9pn2k=;
 b=o0EeNFjJ8BnMZXTRoAWU5e2MkKWnYy2tc2j7L1YAVYI/db8367l/wCnm5KhZF6kHBCpzbhDuht4jdQ6JOXqNhsejrBLehrpf/fJvpb+HNOqFFzMmK6vL1JGyG1u7PypgJ4S/YtTBINRG8+cuCo9ZEJ+BIKRAdjYunkIwOc5NynJ9xS4mFPDH8tnE6yQkPh7X0WfopM/ZOrSZjXCF+paxKZTheGjrnnJHCe3ICWV7tR+RYAAjb8uKhzxWtC5XDa+AsY+sOaQZas8VkuJkpWrW6NFhEtvWMKMbOMPF73FhNEyWKur8F1E9lJEvkSdpb5XTOQPd5PZLYipAabc9m6Uo3Q==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Jan Beulich
	<jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
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
        Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [PATCH v5 03/14] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v5 03/14] vpci: move lock outside of struct vpci
Thread-Index: AQHX4ewHDku9OOCAtECwEMPLB4JkU6xeOMoAgAGIjICAFZt4gIAAKsoAgAegcgA=
Date: Mon, 31 Jan 2022 07:41:23 +0000
Message-ID: <7f6085ae-c929-5bb7-378c-4c98bf00542c@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-4-andr2000@gmail.com> <Yd2ffPULbmNpSmaD@Air-de-Roger>
 <d738229b-11ed-db77-f313-5f1618ed95a1@suse.com>
 <5f00c94d-069d-ea5f-aa1b-1861fe8a7cef@epam.com>
 <YfEszsdqeDkWT3ja@Air-de-Roger>
In-Reply-To: <YfEszsdqeDkWT3ja@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1091dfac-9051-49c1-2694-08d9e48d147b
x-ms-traffictypediagnostic: PA4PR03MB6782:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB6782B130BDF8B5BD837E55C7E7259@PA4PR03MB6782.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GAik9aHt+v+bOtYXld2P1SK2HC51NroZ0KC2bmBjIboN3iiln3ccRquYr6nhO7gyPY1I+ENi1rjj8Dak6mtZwXPTdltKtGMhwhW65p9zjjKeFlqEZ1ikvR8eIFxGaaM+gpFyOMlhYxhRVMIjKtL6REeYevIMsFKQLN/tXi/uhkgSk0JoPkwiUAtYsHaIsmb3D8acHnyHhY209tEu2XJLdmmEtADlLzNWf7RS3Qg3b30vfKTvfJmPCVTDNSnkLCV2aQa+MsytTK1d0RKur+hqebBAC29rZvyLi1TnlHjvRy82X9K/PXM5KsxEmBECxrOT9dgZsXDEvBya1w5EtSIpFmUuKCvAtQ2RFJsMon+1bDAVzEGHvel9GgKjYc0992yodPNKXZIRxdgt6H7515t18TEFq9wlbMXMbig0jompPvRyOhNsHTEnMWg4E5f2AeIFgovmhrgSVuJVEHV+zFhJpxkxDl4Y8D+Kpe9gm4nTUomTCPd48CrL4RCMRRHzWnkRr4z3DnEQVXPtmd8+aty86owy7S3ny+tpK95pEBcRsP+Mrdb3gy20Fw3lPwoGtufmq3ZKZVmq5o14+QrbUMB/++6fF8dM+UBYkQLwdxLtInKJIo1Cqprqks7qHUmq3jCIqWdp3qfubpsTJJZbFTp6FYN/gMkyUBHzf5ySiyy+1un6mVwIWHu2MWPgvWBvgFfYz7tP/c0lNDQOcLPqVi4p0hWlyUkPcGKMoQJrlGpjt0EjzWQqSzg5MJmFR+vqd/Ax
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(64756008)(8936002)(8676002)(66946007)(66556008)(66476007)(66446008)(76116006)(4326008)(36756003)(53546011)(122000001)(38100700002)(91956017)(71200400001)(31686004)(6506007)(6486002)(316002)(5660300002)(7416002)(508600001)(110136005)(6512007)(54906003)(83380400001)(2906002)(186003)(26005)(31696002)(2616005)(86362001)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U0J4dWtRMVpsRzBNZGRNN1YvQ0J3OGhmYkRPVzloUThWSStlaFBiU2VWTmh0?=
 =?utf-8?B?aytMLzJTaHNxRzdJVmZRSjJDSkJFSkY0TFVDcmgrbWJFbnVxaENwWDNObmxq?=
 =?utf-8?B?YlRVajJFZ0xNTGlVczljQUFLTG1zY1FOTTlwL0J0bldUY3duakZDREFTamZz?=
 =?utf-8?B?cVIyME9sZG5rWEdvSjJSTGhIa3hQWjgrc2FkR0ZRTDRHMGcrQktTMnNFdzBp?=
 =?utf-8?B?ZkVVTG5CbThScXhrVzRXMG95U09pVzUzV3l6ZVl5bm5hd3hpK2pFNkUvc2RT?=
 =?utf-8?B?eUtBWVhaU1ZUTE01ODVkYWRRQTdMZ0l1NG96ME1ndjJ5dkY2djd0YTByWnVv?=
 =?utf-8?B?amJBUmtiSDVWT082QkV3cVVpMUtrdDMyY2p3TG1TSGNnbkh2ZWZweWloenFP?=
 =?utf-8?B?VUpoOFdTR1hmcXlnWDJwaXpxWkMwWlhsQU1XYWxKcVdEc2JGMU0rQ3hGbnI3?=
 =?utf-8?B?TmdyQXZJNjdLS1pNVXNlcG1EQ1B5VUxEWHhTZDBLUWR5ckFvZ0c0OXdOUXVV?=
 =?utf-8?B?azN4ZzFtcC92cmViK3ZYallhNjM5cDR0MnhJREhCYnY5TzlSVjUvM29MbjRq?=
 =?utf-8?B?a3RkSmw2SlpRMFBGQjVMckdXeURnL3RCQ2NwQzAzR2RCWWVxSHBGRTcwQnRr?=
 =?utf-8?B?eXRwK2JabXBLVHJOM2Y1YWxYVUpuaVd3MUZDTzNoQ2ZOdzlyZGhrM1NNMGo2?=
 =?utf-8?B?N0dnbnA0VjU2ZUdxaTlOTVhSSm96TjA0SEpVSnh3THJNNmszUmJWYjVsTXdV?=
 =?utf-8?B?MjJYMFBPWDVqY1VaSXkvTEdtYTZNSlJKOVZlZUl2dlp6YUJ6UXRZSmRYQzA1?=
 =?utf-8?B?ZUNwaFlPSm1QR20rOVFIajlxQTJaMFU5NER3TVVicWFrZnZZRWlSQUJIMm5K?=
 =?utf-8?B?aS8zaGZzek41V0VvcjZkaFFoT2pHWERQZkJpam45R1BENzZxV0RjSEJ5N2RG?=
 =?utf-8?B?ektnb0V3eUlYcExVUU5DeCtsQ0N6N2s1MkVVakp1N2lDanFCSTJNcUovUlBX?=
 =?utf-8?B?UVltaDNvanRna3JDZGI0Z3k3M3dIV1c2bUtnbW4wTkszekdzc3lYRDA0TlZ3?=
 =?utf-8?B?M0UxbExOcnZtU0VDNGdrREU2VXljRDJ3WmVXN2xQNFYrVFhGamFUVHVtVngz?=
 =?utf-8?B?WGk0SEpiQmdjMFBhM1MyRWFIYXowUDNYWEZHb0h2L3BDN2dqYTdKSE9SQ1g0?=
 =?utf-8?B?YWNwWkRaOU81VGZIanUvUGprS3JQVE9rc3NHQmZ3Qy9uak5pZjRyN0ErTDJv?=
 =?utf-8?B?U2NYalRQTENLd1pWN210ckpub1VwT2E1Rk5ETHRaMXhONWtIUWxabjcxY1o3?=
 =?utf-8?B?VVVTNDdrUlFwNFRSNmFtYkFLY0Z2MHFzeTZPcEJ2bmREeXJJbWZjbkk0TGYy?=
 =?utf-8?B?NXhIbXNXMU44MnZtTE8xUGdlaTlMeUlXN1hSVVJUQWt0T0Z4ZEtFdUFNZEgy?=
 =?utf-8?B?L2JCaUJjdGl5dnh5NkN3elRuUEcwTFZaQkVuYUc5aVRTeVlhNEJFMEVFb2sz?=
 =?utf-8?B?cEE4Q1VmMWU4Unp2NklZaWVQTmNVSC9YNlFEb0pjUCtRbHZuWmswWmcyVE5I?=
 =?utf-8?B?Z1c5d0w3eU0yNFd6bHVCODFmYWV4YXRtalYxSWlXQmF6MFVaZXhKWDJnSEJN?=
 =?utf-8?B?bUROeG9UaTJUSktrcmFBcWo4Ync1KzRPMSt1aWFrRDNINFc2ZUlNNzcwRkRI?=
 =?utf-8?B?Snl2cVp5UHpUZ1JUUk5kQTB3cnp0S012TkcxU0RadDNqMzcxUlA3Z0dmV2tV?=
 =?utf-8?B?bklVd0N4RDFxWFRxUEFLTjJRWnIyYUFHUEZVaGZaMktVeVpTSGFVOVZ3bVFm?=
 =?utf-8?B?VWdSVjByaVZoWVNXaEx1SVp4ZEpmcWZVWFZLbGlsZVB0cFd0UFJLb1JCb0x0?=
 =?utf-8?B?ODlHV1phYmFhb3lHNWlLT1VJTmtzS3lIL2dqUER3TXhlUHZ1OStoVUNFYVQz?=
 =?utf-8?B?QkZWK0ZSdVBjNUl4YnAzbk9vYmFjanBsS0dEY3pvSk1ESlhidEo2QUEyY1FP?=
 =?utf-8?B?RFhob1JBQ01Ud0psL2FOYy9jdHAyak9WWm5oSTY2bTZjaFp5dzVHbC9lbWhZ?=
 =?utf-8?B?SURPSWdrd3MveW03VjM5MTIyZkQ1RnFyWnhya1ZYaThOK3ZYcXJPS0N2NnpF?=
 =?utf-8?B?ekV0TDlUOEdLamJyRmZvWmVKYXNoODZGb1ZyVUtvdGFJaUFMVXpuMkRLVmd0?=
 =?utf-8?B?dG51UUZ2QUluVWlxM290TzdnZGx3NVR6Q29PNFhNTTZkOGhSMERSS3lIM1B6?=
 =?utf-8?B?ZzBiTkZEMEFxTEhBbmVwVEhxWEVEVVdheFNFc1dLTEozRGpZSHE1VjlhN1pi?=
 =?utf-8?B?S0h2YWl2TXZGWENHYi9qWFBmcHBDbys4dy95NU1TdUJCNU0yK1lpZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BD90A66C817B345A3DFF08F62BB0287@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1091dfac-9051-49c1-2694-08d9e48d147b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 07:41:23.3522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /alsrOCzzmMTBnFpBm8o17NhGX7rDbLm/yC9blCYLQhq3IhtmDk33u+Z6DVWwNMPStkD6ku7KczVhJmhjP4ZuCuLus5JNxbcaf941s1uEdZOfnFmQXxAaR45RV3+sDif
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6782
X-Proofpoint-ORIG-GUID: 1VEWCCEI0or2Vhh8KS81L3G8UdBoCAUQ
X-Proofpoint-GUID: 1VEWCCEI0or2Vhh8KS81L3G8UdBoCAUQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_02,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxscore=0 clxscore=1015 suspectscore=0 adultscore=0
 mlxlogscore=884 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310051

SGksIEphbiwgUm9nZXIhDQoNCk9uIDI2LjAxLjIyIDEzOjEzLCBSb2dlciBQYXUgTW9ubsOpIHdy
b3RlOg0KPiBPbiBXZWQsIEphbiAyNiwgMjAyMiBhdCAwODo0MDowOUFNICswMDAwLCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IEhlbGxvLCBSb2dlciwgSmFuIQ0KPj4NCj4+IE9u
IDEyLjAxLjIyIDE2OjQyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAxMS4wMS4yMDIyIDE2
OjE3LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+PiBPbiBUaHUsIE5vdiAyNSwgMjAyMSBh
dCAwMTowMjo0MFBNICswMjAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+
IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyBiL3hlbi9kcml2ZXJzL3ZwY2kv
dnBjaS5jDQo+Pj4+PiBpbmRleCA2NTc2OTdmZTM0MDYuLmNlYWFjNDUxNmZmOCAxMDA2NDQNCj4+
Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+Pj4+PiArKysgYi94ZW4vZHJpdmVy
cy92cGNpL3ZwY2kuYw0KPj4+Pj4gQEAgLTM1LDEyICszNSwxMCBAQCBleHRlcm4gdnBjaV9yZWdp
c3Rlcl9pbml0X3QgKmNvbnN0IF9fc3RhcnRfdnBjaV9hcnJheVtdOw0KPj4+Pj4gICAgZXh0ZXJu
IHZwY2lfcmVnaXN0ZXJfaW5pdF90ICpjb25zdCBfX2VuZF92cGNpX2FycmF5W107DQo+Pj4+PiAg
ICAjZGVmaW5lIE5VTV9WUENJX0lOSVQgKF9fZW5kX3ZwY2lfYXJyYXkgLSBfX3N0YXJ0X3ZwY2lf
YXJyYXkpDQo+Pj4+PiAgICANCj4+Pj4+IC12b2lkIHZwY2lfcmVtb3ZlX2RldmljZShzdHJ1Y3Qg
cGNpX2RldiAqcGRldikNCj4+Pj4+ICtzdGF0aWMgdm9pZCB2cGNpX3JlbW92ZV9kZXZpY2VfaGFu
ZGxlcnNfbG9ja2VkKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+Pj4gICAgew0KPj4+Pj4gLSAg
ICBpZiAoICFoYXNfdnBjaShwZGV2LT5kb21haW4pICkNCj4+Pj4+IC0gICAgICAgIHJldHVybjsN
Cj4+Pj4+ICsgICAgQVNTRVJUKHNwaW5faXNfbG9ja2VkKCZwZGV2LT52cGNpX2xvY2spKTsNCj4+
Pj4+ICAgIA0KPj4+Pj4gLSAgICBzcGluX2xvY2soJnBkZXYtPnZwY2ktPmxvY2spOw0KPj4+Pj4g
ICAgICAgIHdoaWxlICggIWxpc3RfZW1wdHkoJnBkZXYtPnZwY2ktPmhhbmRsZXJzKSApDQo+Pj4+
PiAgICAgICAgew0KPj4+Pj4gICAgICAgICAgICBzdHJ1Y3QgdnBjaV9yZWdpc3RlciAqciA9IGxp
c3RfZmlyc3RfZW50cnkoJnBkZXYtPnZwY2ktPmhhbmRsZXJzLA0KPj4+Pj4gQEAgLTUwLDE1ICs0
OCwzMyBAQCB2b2lkIHZwY2lfcmVtb3ZlX2RldmljZShzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+
Pj4+ICAgICAgICAgICAgbGlzdF9kZWwoJnItPm5vZGUpOw0KPj4+Pj4gICAgICAgICAgICB4ZnJl
ZShyKTsNCj4+Pj4+ICAgICAgICB9DQo+Pj4+PiAtICAgIHNwaW5fdW5sb2NrKCZwZGV2LT52cGNp
LT5sb2NrKTsNCj4+Pj4+ICt9DQo+Pj4+PiArDQo+Pj4+PiArdm9pZCB2cGNpX3JlbW92ZV9kZXZp
Y2VfbG9ja2VkKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+PiBJIHRoaW5rIHRoaXMgY291bGQg
YmUgc3RhdGljIGluc3RlYWQsIGFzIGl0J3Mgb25seSB1c2VkIGJ5DQo+Pj4+IHZwY2lfcmVtb3Zl
X2RldmljZSBhbmQgdnBjaV9hZGRfaGFuZGxlcnMgd2hpY2ggYXJlIGxvY2FsIHRvIHRoZQ0KPj4+
PiBmaWxlLg0KPj4gVGhpcyBpcyBnb2luZyB0byBiZSB1c2VkIG91dHNpZGUgbGF0ZXIgb24gd2hp
bGUgcHJvY2Vzc2luZyBwZW5kaW5nIG1hcHBpbmdzLA0KPj4gc28gSSB0aGluayBpdCBpcyBub3Qg
d29ydGggaXQgZGVmaW5pbmcgaXQgc3RhdGljIGhlcmUgYW5kIHRoZW4gcmVtb3ZpbmcgdGhlIHN0
YXRpYw0KPj4ga2V5IHdvcmQgbGF0ZXIgb246IHBsZWFzZSBzZWUgW1BBVENIIHY1IDA0LzE0XSB2
cGNpOiBjYW5jZWwgcGVuZGluZyBtYXAvdW5tYXAgb24gdnBjaSByZW1vdmFsIFsxXQ0KPiBJIGhh
dmUgc29tZSBjb21tZW50cyB0aGVyZSBhbHNvLCB3aGljaCBtaWdodCBjaGFuZ2UgdGhlIGFwcHJv
YWNoDQo+IHlvdSBhcmUgdXNpbmcuDQo+DQo+Pj4gRG9lcyB0aGUgc3BsaXR0aW5nIG91dCBvZiB2
cGNpX3JlbW92ZV9kZXZpY2VfaGFuZGxlcnNfbG9ja2VkKCkgYmVsb25nIGluDQo+Pj4gdGhpcyBw
YXRjaCBpbiB0aGUgZmlyc3QgcGxhY2U/IFRoZXJlJ3Mgbm8gc2Vjb25kIGNhbGxlciBiZWluZyBh
ZGRlZCwgc28NCj4+PiB0aGlzIGxvb2tzIHRvIGJlIGFuIG9ydGhvZ29uYWwgYWRqdXN0bWVudC4N
Cj4+IEkgdGhpbmsgb2YgaXQgYXMgYSBwcmVwYXJhdGlvbiBmb3IgdGhlIHVwY29taW5nIGNvZGU6
IGFsdGhvdWdoIHRoZSByZWFzb24gZm9yIHRoZQ0KPj4gY2hhbmdlIG1pZ2h0IG5vdCBiZSBpbW1l
ZGlhdGVseSBzZWVuIGluIHRoaXMgcGF0Y2ggaXQgaXMgc3RpbGwgaW4gbGluZSB3aXRoIHdoYXQN
Cj4+IGhhcHBlbnMgbmV4dC4NCj4gUmlnaHQgLSBpdCdzIGdlbmVyYWxseSBiZXN0IGlmIHRoZSBj
aGFuZ2UgaXMgZG9uZSB0b2dldGhlciBhcyB0aGUgbmV3DQo+IGNhbGxlcnMgYXJlIGFkZGVkLiBP
dGhlcndpc2UgaXQncyBoYXJkIHRvIHVuZGVyc3RhbmQgd2h5IGNlcnRhaW4gY2hhbmdlcw0KPiBh
cmUgbWFkZSwgYW5kIHlvdSB3aWxsIGxpa2VseSBnZXQgYXNrZWQgdGhlIHNhbWUgcXVlc3Rpb24g
b24gbmV4dA0KPiByb3VuZHMuDQo+DQo+IEl0J3MgYWxzbyBwb3NzaWJsZSB0aGF0IHRoZSBjb2Rl
IHRoYXQgcmVxdWlyZXMgdGhpcyBpcyBjaGFuZ2VkIGluDQo+IGZ1cnRoZXIgaXRlcmF0aW9ucyBz
byB0aGVyZSdzIG5vIGxvbmdlciBhIG5lZWQgZm9yIHRoZSBzcGxpdHRpbmcuDQpPaywgc291bmRz
IHJlYXNvbmFibGUNCkkgd2lsbCBub3Qgc3BsaXQgdGhlIGZ1bmN0aW9ucyB3aXRob3V0IHRoZSBv
YnZpb3VzIG5lZWQNCj4NCj4gVGhhbmtzLCBSb2dlci4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

