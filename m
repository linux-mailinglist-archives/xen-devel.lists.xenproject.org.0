Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76357F2271
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 01:43:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637424.993214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ErB-0006BI-QM; Tue, 21 Nov 2023 00:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637424.993214; Tue, 21 Nov 2023 00:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ErB-00068A-NP; Tue, 21 Nov 2023 00:43:13 +0000
Received: by outflank-mailman (input) for mailman id 637424;
 Tue, 21 Nov 2023 00:43:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/eqD=HC=epam.com=prvs=5689374ac6=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r5Er9-0005t0-R9
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 00:43:12 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f05aab08-8806-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 01:43:09 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AL0OCqg028597; Tue, 21 Nov 2023 00:42:57 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ug3tmuhrq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Nov 2023 00:42:57 +0000
Received: from AM0PR03MB3699.eurprd03.prod.outlook.com (2603:10a6:208:4b::31)
 by PAXPR03MB8143.eurprd03.prod.outlook.com (2603:10a6:102:2bb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Tue, 21 Nov
 2023 00:42:51 +0000
Received: from AM0PR03MB3699.eurprd03.prod.outlook.com
 ([fe80::8e16:90d9:e422:f352]) by AM0PR03MB3699.eurprd03.prod.outlook.com
 ([fe80::8e16:90d9:e422:f352%7]) with mapi id 15.20.7002.027; Tue, 21 Nov 2023
 00:42:51 +0000
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
X-Inumbo-ID: f05aab08-8806-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6IIWs5jVqXEaokbFu53TDZtrcmZD9beYxqNQPZ8iG0cUYMM9wPyKV0hzvb86HOyMzoxNm7t4AT7wkKl8PoYRw9QDDElFS60860bxzTr7BAA/J3dUtmoclLNgEhr6ShM2qoJzYww9jDCTgf+jXiXyBsoELPW4cCz3or/64sym0VCFHyTkQ6LCeNHyCsI+x59s0ADBcDkVgvqkgRdfPNaHykBgpxk7Z/+GKjjPFC4s3W+v5v7O7gaKn2IPH7n/JaGmI0Yu//Z4aew0PBtJHh4nonIcxhK6BXVIMk92je1Wc+kxtvJoe1ehWFzjv9kvthbj2mSSlTv/IvQsFIICu1SOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NlqiU2KpMUfzMqvO05ohk5EBTPYD7tyvu4/9yTd/ico=;
 b=RYPi8ZjCe59FWzJin2X1Jj4g60HYzZCLnV69s3+u89AxPoBYcPouAhXqzYLyQOYmMJd0KruN5BKVsB9zSEv2hRYi8QYSjKzwCVznhK19RXAk/oqrNLBJM7xboa9Dzd+hoXf9bPvMXHuQktmU6B8dEB4ZKmbM7KALq1HUW0BVT5alb6Ag0/Br9Dx4XkIr7u7WlBGUtUumYixu4smpPjzn48vETS+cZ9QpnRuxu+KW8DkFvFSB34alGxDr4FJbPDsWxwxOmy/IYTaHWCuHz3Le8o0PBMGd32fA41yYyhkaa9xu7MWynQJTRkNfJElASC+rLqw5T2OL39QAT2znrD8+Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlqiU2KpMUfzMqvO05ohk5EBTPYD7tyvu4/9yTd/ico=;
 b=FEigqpKGZn199k5Dzm7yfSHX74POIFvRLrPLiaY1+bMOyeJhUf2ZIUzo0IZWd4z60UG6YaaUDh0rsqLIjDJ/Y/tNvGUO6/UpFGsprd0iGk0iKebk5Yy3Y/iDJ2IT/7Kjn01hXmXIS/32n9jim2KrSYP0tlBx+QB68x/p/N6k1JqGSH3uP2Tcae/fKyK28IZsOzfRPo3j9LJl4XtvzlC/s+4jQLj67NYyJcW9e4T675ibSitILlGXsNA3Nig+8vGvtbT3vfU4zMoqZJmgfpkkheRKf3bHSvioCT0JscoiaKTA6/qtLdlkp43Ip+9o1EzxSxbXtIL9tvRo5IY2m8y6bA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>,
        Stewart Hildebrand
	<stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v10 13/17] vpci: add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v10 13/17] vpci: add initial support for virtual PCI bus
 topology
Thread-Index: 
 AQHZ/Vi+wP3QsyKZ0EartcLXqtnBRLB9UyCAgAB7YgCAAAiUAIAAEHKAgADZXQCAAEyPgIAAGSwAgAAczgCAAAOwAIAALzmAgASxF4A=
Date: Tue, 21 Nov 2023 00:42:51 +0000
Message-ID: <87ttpg0wdx.fsf@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-14-volodymyr_babchuk@epam.com>
 <d6a58e73-da51-40f1-a2f7-576274945585@xen.org>
 <alpine.DEB.2.22.394.2311161513210.773207@ubuntu-linux-20-04-desktop>
 <87o7ft44bv.fsf@epam.com>
 <alpine.DEB.2.22.394.2311161651090.773207@ubuntu-linux-20-04-desktop>
 <87a5rc4gk7.fsf@epam.com> <770aaef8-09f4-480a-95b8-cc0448ad07ff@xen.org>
 <8734x43zxi.fsf@epam.com>
 <alpine.DEB.2.22.394.2311171339010.773207@ubuntu-linux-20-04-desktop>
 <87edgo2f6j.fsf@epam.com>
 <alpine.DEB.2.22.394.2311171633190.773207@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2311171633190.773207@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB3699:EE_|PAXPR03MB8143:EE_
x-ms-office365-filtering-correlation-id: dd0a33e3-2cb7-43ca-2ccb-08dbea2acadf
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vESx8LSo8c3BSNSoxw8MDAwTfruhhiqNrpJfKuKMZHrsYgKPHnioEcg0hmp0OU8ABdpKN5dnHwTeqcV1vLvy4k/7EuN44A3Qo7pVaFZEYBPfYc/ms7E8KM8QiWOi2HA09+XF3Y2mgI4tCtWSazZgDz4x1qSIKz4EuwQSqNwCTXGe9K3wt9BgClIW0fTCFgDTyTahHjSU45JyPcBvQemeOTLQ1driaxs7yVddg3bxnD3RfQfBW0hr9zjIIGP6JwJLRppkJ49rJEBRezswfihnJrBQjCb43dsEhDf7UC/ov3gnp0uwLyxAsZYIJS+b6q9ab75MJLCPsh7uSt0Gmge9POpTP99qkjOTK/IAKyf6LXNy8CMm9m6g6/hUDwZkLzRZ+BeksepqLYPCqys7VeOD9XRRkk1B9ChNQCZcEKZZ06CuoG7Fw1Ge/G0UWLGkb+YW9TqvBxct/LWYprnYnhDF2sdK7QPx/5ZjIJKEhGVSsr5E/yxcwoCJZ2dfqmQ6beI0/hLNBn15GmtHC3OcsY/e/WFy02vn1VHHgAOrLwYj9TAThLCJvlmIGqvVPxhVBMlR325sNgNobEiv7o0CRJju2umqW81QeIYHx97M0AdJ1+nu7oB1n7+qZcj706hxjRmn
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3699.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(2616005)(38070700009)(86362001)(71200400001)(91956017)(6486002)(6506007)(76116006)(66556008)(66476007)(66446008)(64756008)(6916009)(66946007)(316002)(54906003)(36756003)(122000001)(66899024)(53546011)(6512007)(55236004)(26005)(83380400001)(2906002)(5660300002)(478600001)(41300700001)(8936002)(38100700002)(8676002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?fcpD8eWnZ6108rNOdmaBnt1jsc7baqIdt4btwG4Wu23UEm+NsEyxV5syaU?=
 =?iso-8859-1?Q?rHysoi1KQLKHNvJE9UUIHgGOgb6boVXFSqRCgDYBjiY+LiyFEaPd2qZQTP?=
 =?iso-8859-1?Q?xBiZx67b2UyE6LaiCHqUeIXVU+hQU8Muc3JpodHGG4D2pQXqykxJYfPJFF?=
 =?iso-8859-1?Q?9DlLt1xYtOnl2AHjRiCQwqnlGfQYuZRG3ApL1md92XeJyzIlsnseA4z09O?=
 =?iso-8859-1?Q?yxH/zacmK68/TO0Xxd8vSY7RBGJ/PIclF3yWL7MoQeCPMh0ULKA095c46N?=
 =?iso-8859-1?Q?ll6+4RBQbREwPYznscV6snCWwvHO9hT0pUytZCnXyLLL2bzjPCVm3Ci3EL?=
 =?iso-8859-1?Q?hSO63wJH4+wkm/xgR8jyg7MWoF2sv9cAFmf+QUY9gJ4BFh5FNzjyFO6bnF?=
 =?iso-8859-1?Q?5zzTphz4mzPrhCjpyOh8jLq/6Kmw+Ar6KnrYEZkg2NZ16WY4tBnXVjX6An?=
 =?iso-8859-1?Q?ZnmA3rsQU67HtVPJNkNjI/vhF0w5wIZTaip8P4v/oX02BpOnHMvxwdYQM9?=
 =?iso-8859-1?Q?xgS0ys4IZM/qKOeo46A7fcEwqmeQm8Bhx9q94j2y0yBbD4B4VNDPAhUYFd?=
 =?iso-8859-1?Q?flhdDaDDahJkqRzWJgtY7JncOqW3zXRmc97Lcf3pa4YJXb5vHpcxIQxkFv?=
 =?iso-8859-1?Q?G/yR4E5CwKP45bVJoSTMl4HMmipTvz1c0XvLC6UpmfvuHA4fRu8zKIzgkq?=
 =?iso-8859-1?Q?1Z4mR8t9tq2mip85X//QI7pduzJ8r7X7nO71JifnYH84bMTApyqaLpl43z?=
 =?iso-8859-1?Q?1qsxp8M2OUcSsVuO6Bz5DYJFXqQzn13Bhx5LAu930lh+tfgTpKhmATNq5e?=
 =?iso-8859-1?Q?g0fJm3+SSckaZmrTxwKZ35H+1RRTI7aCs+fOaEqOoy/wLScSSrXp4SrZHC?=
 =?iso-8859-1?Q?IeHp+/jnyFi2pmKI3zpJwUc5NVjSEt4V+4YakvOnCifjmT0VNm8Ws0vfTk?=
 =?iso-8859-1?Q?MvyeGLed7yvEP/k/QASkAPsXzxDYTQhnSvJ4yarHy8GY6icbljjVTtEllr?=
 =?iso-8859-1?Q?DV8AVRjqcQqDSsYX+83DljhRv/MwXmVzSDEpIN0tFubwlklo52ImAVAbn8?=
 =?iso-8859-1?Q?K1fLe7mjZko/fuXNdJSpFqFRquYZq2RoDzdq7VphtFKuTMmzeFuS/2uY+W?=
 =?iso-8859-1?Q?Dwp3BEZBtz4RcZwSVm4P0i5568isSOIkQUP18uSSTMg6hbE0ougZakvQTA?=
 =?iso-8859-1?Q?TlPMxnxvvzheBdxS8X3M+X7hPlVJ1lr/TnhiylIh76LPoVkDG9u2Ys5x5d?=
 =?iso-8859-1?Q?l5T61CPuCh+8GaRDX9yahrDA+L4EqW+khi4NUsOplQ7+mW304F2Tji1oga?=
 =?iso-8859-1?Q?UM2XqLnZJ9fDmXQ+1Juqjy9gmxTusZr98tLf3UdAkUCi8wedBb8xTfK5jj?=
 =?iso-8859-1?Q?E1DEEU2JYVc1cKRApRUgPK4EDGVzhjcm3CO9Wl1QXywwplg4ojZhLxTIVe?=
 =?iso-8859-1?Q?HekraTJ/M6gKRYO63pA1Z2r7fuUpH4uKxja8n1YRiNEr9nb8ROKByoYnwK?=
 =?iso-8859-1?Q?IgXGkDpyRbZdvZC+GbVI2kvADOmImMq42GJ9/YFc6N0w+ZTIML/XZwEv/h?=
 =?iso-8859-1?Q?gVG4SE7yDPZ7tFaPJ0ck5apEyB6lLbaHu1XZ9gVN3pkBG2Ccya5OEwfo4C?=
 =?iso-8859-1?Q?HmsScIob11tkj2E6MYevV4SDZuZhJtPkFm8HR8W09K26fcluQ5ZUCuXw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3699.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd0a33e3-2cb7-43ca-2ccb-08dbea2acadf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 00:42:51.6018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7kJclyQ4OVZebg0k19YXCs5Hq54GhaN/us91cVgWl2+Pru+MG16eAIfw+Rmmf/tsGNYvEvW9rjk5aV2pv5tYJ4xW3MayzZ6qVf4H4tWMuQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8143
X-Proofpoint-GUID: oXxfyi1AJzXitjFXzkZRTVzdrKHU__jV
X-Proofpoint-ORIG-GUID: oXxfyi1AJzXitjFXzkZRTVzdrKHU__jV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_22,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210001


Hi Stefano,

Stefano Stabellini <sstabellini@kernel.org> writes:

> On Fri, 17 Nov 2023, Volodymyr Babchuk wrote:
>> > On Fri, 17 Nov 2023, Volodymyr Babchuk wrote:
>> >> Hi Julien,
>> >>=20
>> >> Julien Grall <julien@xen.org> writes:
>> >>=20
>> >> > Hi Volodymyr,
>> >> >
>> >> > On 17/11/2023 14:09, Volodymyr Babchuk wrote:
>> >> >> Hi Stefano,
>> >> >> Stefano Stabellini <sstabellini@kernel.org> writes:
>> >> >>=20
>> >> >>> On Fri, 17 Nov 2023, Volodymyr Babchuk wrote:
>> >> >>>>> I still think, no matter the BDF allocation scheme, that we sho=
uld try
>> >> >>>>> to avoid as much as possible to have two different PCI Root Com=
plex
>> >> >>>>> emulators. Ideally we would have only one PCI Root Complex emul=
ated by
>> >> >>>>> Xen. Having 2 PCI Root Complexes both of them emulated by Xen w=
ould be
>> >> >>>>> tolerable but not ideal.
>> >> >>>>
>> >> >>>> But what is exactly wrong with this setup?
>> >> >>>
>> >> >>> [...]
>> >> >>>
>> >> >>>>> The worst case I would like to avoid is to have
>> >> >>>>> two PCI Root Complexes, one emulated by Xen and one emulated by=
 QEMU.
>> >> >>>>
>> >> >>>> This is how our setup works right now.
>> >> >>>
>> >> >>> If we have:
>> >> >>> - a single PCI Root Complex emulated in Xen
>> >> >>> - Xen is safety certified
>> >> >>> - individual Virtio devices emulated by QEMU with grants for memo=
ry
>> >> >>>
>> >> >>> We can go very far in terms of being able to use Virtio in safety
>> >> >>> use-cases. We might even be able to use Virtio (frontends) in a S=
afeOS.
>> >> >>>
>> >> >>> On the other hand if we put an additional Root Complex in QEMU:
>> >> >>> - we pay a price in terms of complexity of the codebase
>> >> >>> - we pay a price in terms of resource utilization
>> >> >>> - we have one additional problem in terms of using this setup wit=
h a
>> >> >>>    SafeOS (one more device emulated by a non-safe component)
>> >> >>>
>> >> >>> Having 2 PCI Root Complexes both emulated in Xen is a middle grou=
nd
>> >> >>> solution because:
>> >> >>> - we still pay a price in terms of resource utilization
>> >> >>> - the code complexity goes up a bit but hopefully not by much
>> >> >>> - there is no impact on safety compared to the ideal scenario
>> >> >>>
>> >> >>> This is why I wrote that it is tolerable.
>> >> >> Ah, I see now. Yes, I am agree with this. Also I want to add some
>> >> >> more
>> >> >> points:
>> >> >> - There is ongoing work on implementing virtio backends as a
>> >> >> separate
>> >> >>    applications, written in Rust. Linaro are doing this part. Righ=
t now
>> >> >>    they are implementing only virtio-mmio, but if they want to pro=
vide
>> >> >>    virtio-pci as well, they will need a mechanism to plug only
>> >> >>    virtio-pci, without Root Complex. This is argument for using si=
ngle Root
>> >> >>    Complex emulated in Xen.
>> >> >> - As far as I know (actually, Oleksandr told this to me), QEMU has
>> >> >> no
>> >> >>    mechanism for exposing virtio-pci backends without exposing PCI=
 root
>> >> >>    complex as well. Architecturally, there should be a PCI bus to =
which
>> >> >>    virtio-pci devices are connected. Or we need to make some chang=
es to
>> >> >>    QEMU internals to be able to create virtio-pci backends that ar=
e not
>> >> >>    connected to any bus. Also, added benefit that PCI Root Complex
>> >> >>    emulator in QEMU handles legacy PCI interrupts for us. This is
>> >> >>    argument for separate Root Complex for QEMU.
>> >> >> As right now we have only virtio-pci backends provided by QEMU and
>> >> >> this
>> >> >> setup is already working, I propose to stick to this
>> >> >> solution. Especially, taking into account that it does not require=
 any
>> >> >> changes to hypervisor code.
>> >> >
>> >> > I am not against two hostbridge as a temporary solution as long as
>> >> > this is not a one way door decision. I am not concerned about the
>> >> > hypervisor itself, I am more concerned about the interface exposed =
by
>> >> > the toolstack and QEMU.
>> >
>> > I agree with this...
>> >
>> >
>> >> > To clarify, I don't particular want to have to maintain the two
>> >> > hostbridges solution once we can use a single hostbridge. So we nee=
d
>> >> > to be able to get rid of it without impacting the interface too muc=
h.
>> >
>> > ...and this
>> >
>> >
>> >> This depends on virtio-pci backends availability. AFAIK, now only one
>> >> option is to use QEMU and QEMU provides own host bridge. So if we wan=
t
>> >> get rid of the second host bridge we need either another virtio-pci
>> >> backend or we need to alter QEMU code so it can live without host
>> >> bridge.
>> >>=20
>> >> As for interfaces, it appears that QEMU case does not require any cha=
nges
>> >> into hypervisor itself, it just boils down to writing couple of xenst=
ore
>> >> entries and spawning QEMU with correct command line arguments.
>> >
>> > One thing that Stewart wrote in his reply that is important: it doesn'=
t
>> > matter if QEMU thinks it is emulating a PCI Root Complex because that'=
s
>> > required from QEMU's point of view to emulate an individual PCI device=
.
>> >
>> > If we can arrange it so the QEMU PCI Root Complex is not registered
>> > against Xen as part of the ioreq interface, then QEMU's emulated PCI
>> > Root Complex is going to be left unused. I think that would be great
>> > because we still have a clean QEMU-Xen-tools interface and the only
>> > downside is some extra unused emulation in QEMU. It would be a
>> > fantastic starting point.
>>=20
>> I believe, that in this case we need to set manual ioreq handlers, like
>> what was done in patch "xen/arm: Intercept vPCI config accesses and
>> forward them to emulator", because we need to route ECAM accesses
>> either to a virtio-pci backend or to a real PCI device. Also we need
>> to tell QEMU to not install own ioreq handles for ECAM space.
>
> I was imagining that the interface would look like this: QEMU registers
> a PCI BDF and Xen automatically starts forwarding to QEMU ECAM
> reads/writes requests for the PCI config space of that BDF only. It
> would not be the entire ECAM space but only individual PCI conf
> reads/writes that the BDF only.
>

Okay, I see that there is the
xendevicemodel_map_pcidev_to_ioreq_server() function and corresponding
IOREQ_TYPE_PCI_CONFIG call. Is this what you propose to use to register
PCI BDF?

I see that xen-hvm-common.c in QEMU is able to handle only standard 256
bytes configuration space, but I hope that it will be easy fix.

--=20
WBR, Volodymyr=

