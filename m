Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5587AA604
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 02:23:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606649.944626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjTwM-0003DE-Iu; Fri, 22 Sep 2023 00:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606649.944626; Fri, 22 Sep 2023 00:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjTwM-0003BV-GC; Fri, 22 Sep 2023 00:22:38 +0000
Received: by outflank-mailman (input) for mailman id 606649;
 Fri, 22 Sep 2023 00:22:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xvxl=FG=epam.com=prvs=362941c556=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qjTwK-0003Al-8V
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 00:22:36 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f0d785e-58de-11ee-878a-cb3800f73035;
 Fri, 22 Sep 2023 02:22:33 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38LI4Anp004571; Fri, 22 Sep 2023 00:22:20 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3t8tshgnpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 00:22:20 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by GV2PR03MB9571.eurprd03.prod.outlook.com (2603:10a6:150:d0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Fri, 22 Sep
 2023 00:22:11 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::78ef:303c:8f74:957f]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::78ef:303c:8f74:957f%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 00:22:11 +0000
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
X-Inumbo-ID: 1f0d785e-58de-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9C0hK7FDQstp4e3f5TuF5aoLAWY7dFKAb5dvZW0eqkETn7m2Yr+78lB4BtIcZ7p7aRhWx3fUg95tSNHoYlY0HwY3o4YsS3xdM3JNd72PNZ1kbRqhYgSpBP/RXd6+UOHuC/iUVuflP1wZ8jkse/JS2prXEj2pv+hDsmkFyIaSdOFsKoTLUmB+V9p3qRuodi2+O+lzgz2hFy4Sy6gNes3OrLTzoIIRBwY2BEydFSgsnOPfJkjozFAxuHYQXUJLDv8ATQe6CWRzA5lTkvjjQe9VEGIjeyamp1U4dR4PcD/oQ+uHv0BhSWaQ/ZOQhK7LVAKhkcUh7DDzuWdxjigjrMJOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvbdx4I4KaKuUT27x1PSNP1d0aUtfPXenaL//QoDjIE=;
 b=XYip8JoHbfKE5c9qxhcoFkxQAuVVmxKg7ojw9O5qsztZEd1GZVKRddhOJ036vh97rI5ICVtnw3VmWd/H+u00sHICqv1/nFu0m/P6gIIYTAUBrQLYr2zrM3wuZHdDJjpxS8GWWWRaMHiYqaZExTGvpUqugOB9zx3x9Bc6qKHpLiBA2VuumrCJoweqoQhwp6Qvm4KiUhbsPFHyoP5DPF3KLLFi5PhmKlxW3Mztl4hPeT/gEWjAx/fAhWrlTQ8l7//UK96+pknfYb2eWh54zcHX4JLb77xKnRAWYrPwJwncYfr32kLwVU7x3UKiMcWj7Ki2nyvPhlxjM2fi7m0gbGC5bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvbdx4I4KaKuUT27x1PSNP1d0aUtfPXenaL//QoDjIE=;
 b=juYDrC72/a9wdWBDlDayLbvHl2nlgonq4JUGjsuAP05aN+/FZ8xEfYpaA7C+XrkxBYS+cIfqoL2wxqFTsSK6TjjxnXzQerD0ukfM1bgOvexsvsgWmAqTXVn7FXsjLrCuOSKl+6j879o+SqB4dxxk3Hvh5d+jqhXaCpV5NRqs9pHwpfUeERTVYuwEuTvPlhnakBzT/YrW38+KebjTNr7Yk7LMf9C7AumjOhefBSeGRhB3RP82SsoO3JopalCpGp0LKuNoid5z3rya/4Cw74DQ72dEiq2rNw8R/V8os2UcPk7l4u4lzmvLET0yiNoeUmN0XX1y2gDhobj94irL0eIOhg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Marc Zyngier <maz@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stewart
 Hildebrand <stewart.hildebrand@amd.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Julien
 Grall <julien@xen.org>
Subject: Re: [PATCH v1 2/3] ARM: GICv3 ITS: do not invalidate memory while
 sending a command
Thread-Topic: [PATCH v1 2/3] ARM: GICv3 ITS: do not invalidate memory while
 sending a command
Thread-Index: AQHZ6ux4LpE3chDIj0mOPudUv9951bAiHTaAgAAZXICAAA0EAIADt3gA
Date: Fri, 22 Sep 2023 00:22:11 +0000
Message-ID: <875y43f45p.fsf@epam.com>
References: <20230919112827.1001484-1-volodymyr_babchuk@epam.com>
 <20230919112827.1001484-3-volodymyr_babchuk@epam.com>
 <1614d73f-72b0-44f2-8e34-0e6c58a1a375@xen.org> <87fs3afcxb.fsf@epam.com>
 <597db9f5-b959-4b75-9410-0d0c16e3acda@xen.org>
In-Reply-To: <597db9f5-b959-4b75-9410-0d0c16e3acda@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|GV2PR03MB9571:EE_
x-ms-office365-filtering-correlation-id: fc77e32b-d2d7-4dfc-ab26-08dbbb01f6d5
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 EK5UpEgVcYaOJdKAUdHVn/PZJaPJEko8mnQYgHnWQdGM41kfKKWOc0+dp/o9e8HmeQjlCmr7o7staKYischc4iSUjVJDb7rOZzED8V2MZMEsLyCfT0AlgvnWVRmtDIP5wZ+XZJErww0v9II3yhTL3mGZIl1S4x1EpUEkHoJe1kbzTO44IXzQGSa4kbEflQgtxzQN3t+21jAaaSlOw6G6SZbKEjLeax28eZ8+nZp7J7YjXbkecij/sk8FtiIeqFO1RYPN3YN+jxuldF6Z9/Kdf7rqrIUtNh8qPuDwAKqJ3IJ4P0pcnOcmRY+ftTbUlukxBEwFGZ2hCMEPIZnWeNrGmx4AC1wLjojeuSvOeQTAJMs7+7oZZ+d5p/oSuJme6X+eHnRWoO0kWRgzDxexKcRwSrvCIanPAaJvzC6u3n8DGz8JcUhf8luzvghm/EcDMeqcrl0I40ZK08dFLJIw6ALn+AqHoFFx6KuA0EfB7IWKZ5TI3W8WtsfXGRKj+TuTI+31jAYxoCbA59jP8wOfy2CnAGcECJYUBQNeC/Qryg9FxhOc/9rqOEgvf6DZBXXPZlgvQ4VLBHdRyOvuUo3X10Bo8ZXUy3iHpShaySZ+NCcMMWGn1SMcOJhHjiCIpaTJ/C8Y
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(136003)(366004)(396003)(186009)(1800799009)(451199024)(5660300002)(6486002)(6506007)(8936002)(8676002)(53546011)(41300700001)(6916009)(66476007)(64756008)(6512007)(4326008)(66946007)(91956017)(54906003)(478600001)(76116006)(2906002)(66446008)(55236004)(66556008)(316002)(71200400001)(83380400001)(2616005)(26005)(38070700005)(36756003)(122000001)(38100700002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?tG07Aia49wHqYrawhXK/qSDiv/f/33+XWewNsmnPeHFG2WDb57bS3nptJS?=
 =?iso-8859-1?Q?CWLXzwTSUr4+75vHVWqgvjGXEAL8d6uu41lilKb600YC77lPN8mIslGi04?=
 =?iso-8859-1?Q?QBvx5r7Q/ssOLJ7Q0iyyU5G/7AwaSTRwZo3eokDPMV+SUbI5MzY1n3urye?=
 =?iso-8859-1?Q?Kl3ZANTqRKsmvm+AFBZYqOUMzPvEwsFoAGc9kk2uTHlN6tdyQ4llpDl5yf?=
 =?iso-8859-1?Q?jOjERhBzieQFEdTsqQhbcNikB6gszzx4jhVAYOrdWwCdHOF2hFKs3RIjea?=
 =?iso-8859-1?Q?ms+BaEKd7VV5xwnVk0EhNHlAtNc5lzX9OvN8YTYnAeoya+2cgwLHtH26VF?=
 =?iso-8859-1?Q?PBg9p8pktcPhqKJAMwR/0RUkWF62X4odfWakIk2oapowlmGZVQId8i7hU9?=
 =?iso-8859-1?Q?1tprP7tFVjcCRy7b8QerwQQP6PN3Z64cLmA39Xbbfk3fAC4u6yoQkUCe2p?=
 =?iso-8859-1?Q?6wmg7qI0XG3J5RiKVX6/QVtJQQr6G7Zl2OvRt+DT2LNXii9RDa51s2nWEt?=
 =?iso-8859-1?Q?o1J9wlp41qkRvSbqUIV5gmlzgAzKBr2sb9PuCxa5QQ5GVXo0pA0RwMgHiG?=
 =?iso-8859-1?Q?3EgSq4SRCZrbwb3DJlMYULu1RnbjIy77oiGapKgStyBgRvGILNPIC5/jHV?=
 =?iso-8859-1?Q?fHV/evLdpp0gxAaPbPN5VaQa5h1arxtJN10q8iqhpGcWQB5OzaBd1uY3k3?=
 =?iso-8859-1?Q?Ci+ZvfujsP7T9CQf79HhzFpwbjN6d/xQIxdwDB5Axs1wzK+ZoS0xn0RCzj?=
 =?iso-8859-1?Q?WqIHLmEnZcanYA96r/SUg8YFkh58if8ajFeCaCeQpd1FaFPFTRwGGwXrE/?=
 =?iso-8859-1?Q?LLbMPtv+6eklkSED6OWU4xihNEceIezXGb1iVAfPkfq+Zsir4Yj1lFc0kP?=
 =?iso-8859-1?Q?hBAwcZxs2NvHjUybucNdC8GOMwyP3u18b70mN97ESwo2AOQPwc0QOvxqkB?=
 =?iso-8859-1?Q?VwR4GK4TUd03KO4Kvwq/TNl1O+aW9V8M1Pct58TC6bjgZ6YNxZ5f+YpQ1i?=
 =?iso-8859-1?Q?dX6uqzaKV8UQNIAvp4D5fsFIdmAGdJTdghCSP9ewPMpvRzUrr8TUCphOzt?=
 =?iso-8859-1?Q?TyrSrgfXrosOxJNWYWKMtCXd19R1gIyHm0mfHmPSi76DTJUQVwmvM6oHQ5?=
 =?iso-8859-1?Q?yWRYWfRvlL+8s0iTQvaCa5QJPVXd21CCdmC57qxB1m4C/9m3Up2NQweaqP?=
 =?iso-8859-1?Q?MKNenlZZWLExEtzUjQqHeG8tfMHK3Yx9PrRi5O+6X8j3ooTOI0PozijDr3?=
 =?iso-8859-1?Q?SPe3NSFY7kseXA6JC/451NRb9pFOJ5CLfB0RXLLkaPMXqy5/T+co5GdeSj?=
 =?iso-8859-1?Q?r9v8z2FDFLpDW/HHlyrz/PMQkybCCOwypOcD3BC/skYkIvfO0+vJAIYGH/?=
 =?iso-8859-1?Q?Ab5sbDpR8/Y44tMPsJ+fZbAVraYqvnlN6zcCX60krnswmV7LRcN7pAGFC1?=
 =?iso-8859-1?Q?5H/CFaICiq4CN54M08/Wxas+s378Hil65JQVEGSYgu70tBgmlmLiMG7ZEj?=
 =?iso-8859-1?Q?k4HQANOlN5nvDqttjuV9pt1y5JNFERkNvm6Q82N50YnDDkWZtCeYfHM/7G?=
 =?iso-8859-1?Q?i5oAYWVjpilhUlkOYb1BeBuKYLv665YK6X4sYIjANFKvUtkKt11q1LXvD0?=
 =?iso-8859-1?Q?/uUNy87rc1DRrI3YJOAsT66MqQQ5/PYMlYA38U96bRmONgWLvRUbZEaw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc77e32b-d2d7-4dfc-ab26-08dbbb01f6d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 00:22:11.3391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ilg0sp04J3+AmO1vPyLRJkPK8Z48ew8Y2OW+UGq+M/c2wqY7NgraGOm8SJjOgEgdybMD277bg6d2fLc1X6SKxaiMFMgvmMIkuI6H8P0AxJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9571
X-Proofpoint-ORIG-GUID: A-lZ1J7XubCUusvzyOfDBFTItW3Bhii4
X-Proofpoint-GUID: A-lZ1J7XubCUusvzyOfDBFTItW3Bhii4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_20,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 mlxlogscore=378 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309220001


Hi Mark,

I am writing to you, because you are GICv3 maintainer in Linux. We are
updating ITS driver in Xen and we have a question about cache
maintenance WRT memory shared with ITS. As I can see, the Linux ITS
driver uses gic_flush_dcache_to_poc() all over the code. This boils down
to "dc civac" instruction which does both clean and invalidate. But do
we really need to invalidate a cache when we are sending an ITS command?
In my understanding it is sufficient to clean a cache only and Linux
uses clean&invalidate just out of convenience. Is this correct?

Below you can find our discussion about this.

Julien Grall <julien@xen.org> writes:

> On 19/09/2023 15:36, Volodymyr Babchuk wrote:
>> Julien Grall <julien@xen.org> writes:
>>> On 19/09/2023 12:28, Volodymyr Babchuk wrote:
>>>> There is no need to invalidate cache entry because we just wrote into =
a
>>>> memory region. Writing itself guarantees that cache entry is valid.
>>>
>>> The goal of invalidate is to remove the line from the cache. So I
>>> don't quite understand the reasoning here.
>>>
>> Well, I may be wrong, but what is the goal in removing line from the
>> cache? As I see this, we want to be sure that ITS sees data written in
>> the memory, so we should flush a cache line. But why do we need to
>> remove it from CPU's cache?
>
> I don't exactly know. From a brief look I agree with you. However, our
> driver is based on Linux where the clean & invalidate is also used. So
> I am a little be cautious to remove it.
>
> The way forward would be to ask the Marc Zyngier (GICv3 maintainer)
> why it was added in Linux. Then we can decide whether this can be
> removed in Xen.
>
> Cheers,


--=20
WBR, Volodymyr=

