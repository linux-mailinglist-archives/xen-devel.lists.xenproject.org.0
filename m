Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A0D3E935B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 16:13:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166100.303340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDoyo-00023e-IA; Wed, 11 Aug 2021 14:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166100.303340; Wed, 11 Aug 2021 14:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDoyo-00020r-E4; Wed, 11 Aug 2021 14:13:14 +0000
Received: by outflank-mailman (input) for mailman id 166100;
 Wed, 11 Aug 2021 14:13:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fl7y=NC=epam.com=prvs=88576a6db5=roman_skakun@srs-us1.protection.inumbo.net>)
 id 1mDoym-00020l-4V
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 14:13:12 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 135cc3b8-fb27-4d25-b464-03e4532b2348;
 Wed, 11 Aug 2021 14:13:09 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BE797h002164; Wed, 11 Aug 2021 14:13:06 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 by mx0b-0039f301.pphosted.com with ESMTP id 3acg10r1fu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 14:13:05 +0000
Received: from AM7PR03MB6593.eurprd03.prod.outlook.com (2603:10a6:20b:1b4::10)
 by AM5PR0301MB2563.eurprd03.prod.outlook.com (2603:10a6:203:9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Wed, 11 Aug
 2021 14:13:03 +0000
Received: from AM7PR03MB6593.eurprd03.prod.outlook.com
 ([fe80::ec7b:2795:206b:9411]) by AM7PR03MB6593.eurprd03.prod.outlook.com
 ([fe80::ec7b:2795:206b:9411%3]) with mapi id 15.20.4394.025; Wed, 11 Aug 2021
 14:13:03 +0000
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
X-Inumbo-ID: 135cc3b8-fb27-4d25-b464-03e4532b2348
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=By8w4Ks1Vf78SAqh7MOtHZdBeOVp6cYkv7SZfqj+AZcMFRmCV7pV0Mv3fSWhSt4DLooell6d8+p5m6dtf5oPNFPSzz6vNb1Bj+vwdxX9iVsgY2O3Jtm+lItRMTupCK3rgpTLT7QmEQrYsJ2dTnwsn09ze3TqtHw7uiUKMfnw+R6jGklWhG8d97b/oqdALMS9C2HpIuj1gEpvLMiYSVNuMjsAx0Cz78C/4jOayy3vwGob+xggQWD6VYr8qNgdJryBd5g/Hc4WTEjSK7KcrPAEP4isTmR+wKu04PlKjsgwzbugiBjOc0cIfl/GmMoDFFq5Wmf8OxfAYzvn1qHgQ/0W4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hACsoYZa7Kkv1OQ4DYPclr6M2aPezXioJQ1H/vyUH5c=;
 b=ii9LtXA7dUrcqnfkXW2vT57xBLrSnL5iOU+1Y3T56y5RazNz4Z7q+gij4gdOsyzmg8yvxe5YtzTWl6adgjWBbt7hLZEaoRS7EeGEP4C0nOfnvCOU/g9nFRrdWQmUpaP99T7krNT4Pktw03Ecb3uRG6vwJ1U5GCq9q8xZZTWCHIq0V/QATpwMSd7a7iSgAmAst4YdF0Q4bbV1NxRaHP8Yh/lD5J8pafrqZOTovDvDZnKQJzDE2mFUGTjvocObpd4nBVGv5uvRwGGCF6PoL7wdJs7i7oO1ARZjydk9rVpbMelUVRBnh9OrgOMCQVMmQ+Z5vzXa8e7ShvHt8096cLovsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hACsoYZa7Kkv1OQ4DYPclr6M2aPezXioJQ1H/vyUH5c=;
 b=Y/M/zr8Z0oTPcVfSrOvgf6ymGpA2yUkk2XQOycHkAH6pZA2zUtB3JOt0yXWXFTD83Lt6NSCqXcht14hamP3FDjy0Mz2VBzGulkmBtVjYbWEwCW+yha2asvM/nQYhuJbM1X3z7XZ9dWA05VsYA2094Ai3QKkmQ6iqgeibRF2oRbBZLWaXUxQUyBvRyUUZu2+HdkmzbzJ8TXU+iI2/4tgjeB5hVvsopEML+M+0D9D4H6zOg3DTA030sZT08OPYS/yQq1EU4/zV0GZUa6DUBSHZ0nkF2P4ZRYaiNBxoWLxnm09e2KH0aXPOTsHz1iaDqz7ZsC/ooz2bGumdKtHSFR578Q==
From: Roman Skakun <Roman_Skakun@epam.com>
To: Julien Grall <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>,
        Andrii Anisov
	<Andrii_Anisov@epam.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Roman Skakun <rm.skakun@gmail.com>, Jan
 Beulich <jbeulich@suse.com>
Subject: Re: Disable swiotlb for Dom0
Thread-Topic: Disable swiotlb for Dom0
Thread-Index: AQHXjfwJK3kYIT7XAUWdmOu1AWm+tKts6kUAgAD/OfqAADJaAIAAJhCI
Date: Wed, 11 Aug 2021 14:13:03 +0000
Message-ID: 
 <AM7PR03MB6593834BA54AD8A126EF872185F89@AM7PR03MB6593.eurprd03.prod.outlook.com>
References: 
 <AM7PR03MB6593B4461B99297C8650CF1C85F79@AM7PR03MB6593.eurprd03.prod.outlook.com>
 <060b5741-922c-115c-7e8c-97d8aa5f46f4@xen.org>
 <AM7PR03MB65932619505158E3930D8E8785F89@AM7PR03MB6593.eurprd03.prod.outlook.com>,<d616081a-8c60-dcda-ac54-58c5be0c21ce@xen.org>
In-Reply-To: <d616081a-8c60-dcda-ac54-58c5be0c21ce@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6793211d-bb25-4d70-b059-08d95cd2220a
x-ms-traffictypediagnostic: AM5PR0301MB2563:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM5PR0301MB2563BC4EE13D3C90AB5347BA85F89@AM5PR0301MB2563.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zlyCi3FW7usoiKEADoOJTX+FT5L8WNqZGt6F0EUmNHM83kMrOwr0SBqzrAzXIy4ANpu3duuaD5dnXDc5plyxjdojS2PhVsApPUYQ6K1o1jPD/te+rSyfkoyjd3rOV872SkfNMVrT873pqVeWckC7ZwzfJtPubFvdBmo+moMBh2kYqRBzStQdPZ61yFE8OREpbQKuOZOt/9UAf1GFtZxSjYsbjhDUD6UftLlICPzoQQAgiGVM+Ncqqpnbc20sMFszjrjk2qPSmnJkUinluy8RpBOEmVQKtBEdRlTudsLb6CXxspbNiO/8uqbhurZ4tCjA0Lu3AZtsfDByAY4KwWiAbjTzBlzvcTJBJzlLkjF1P240C1t/X4sxOODK1sTqEEYaifGkOgs+HMaAdT9D2RUDZtOSmG/QJeVYvXxda2sYCnPPO5sao6wP+ltwtiybqhpzNnT3Kp2tupr0Q7EO8mA4gFzsIQriljs8ueg3XkW7zsmGrI43u6AnlWaImyRQd2k9OwA2QJxY7GoyWO5IP3Tf0Mdd3f2bJUQPo2Ip+1l9lxr4BMF2ReU7kbmWgzq2XHedfgU4Vfm1d6qHdB4eStINNamK/ZbNS4Mewlm0+aCavJtEQ5BnRK9YUwf8PfcOoDMe4uu+nZR63K0qcVznW7XatgkaLcmijqK3WujT35hUxLoLf+4Vmh0vDIyMjTPIhi3XH+lFAfRfS1qEdjD6y/ut2448XiXu76hxpHUWsybAjqWjzCf7X3kO7WLVqSAvmS4SxjoqpaaHMGrIwr5yyw15CMds6TYT3snvJVw2xYs4KruZEqB/QaMqiatlChPldQwV4PTMb0bbOyxR985EX5WzuB0Ww1p7/zdZQOtBVfKBTIo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6593.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(8936002)(478600001)(8676002)(66446008)(52536014)(122000001)(66946007)(33656002)(4326008)(66556008)(38100700002)(110136005)(53546011)(316002)(6506007)(38070700005)(26005)(54906003)(55016002)(9686003)(64756008)(166002)(186003)(2906002)(71200400001)(83380400001)(86362001)(18265965003)(76116006)(7696005)(19627405001)(91956017)(966005)(66476007)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?k3X/tuCS4ffcvyYF9+7Kd0EeNS6yLdnvIp79Zbom7Twb+vJP+67iU08G/bec?=
 =?us-ascii?Q?shbyo3WGfEa0U/ZDN60J6UEDjdVGM2bbKAuo39jk874NwfJ9jtU1n0fBe5Sh?=
 =?us-ascii?Q?938/wvV+AwOJxBgcFpZ02vumS3y1w3NFG+1LbXzxb/ydOciK571D7zPk9I6/?=
 =?us-ascii?Q?9f3u6IRDyMftg+rYWbHbyYfh7EsawOrqBG0bWbZ8d202wZ+dn2esj9iszXp7?=
 =?us-ascii?Q?oBLfAFHgDsLAOTRAmLPl3bY8ZJe1rMs6NToG5UazHAjuGThcC8KXLdJeAXGH?=
 =?us-ascii?Q?UNGa3P3AmkcDqMoVHH5Jlku+ZWrtH99F3AjK2wWfkEwNPFab31JsM47V8/zo?=
 =?us-ascii?Q?d8buUfeARjliEFVHSpoK0QCbadpZ2iQKHUxVhvb53clE78hImxZsJfW4pj4E?=
 =?us-ascii?Q?hq7Qcaj3GLoWRfayOKKLU/0W9hDhTmKoRni71U221WBhajurChI6wgnxt9my?=
 =?us-ascii?Q?IgIcll/XS8KBtJx4xojDp0SxOqfefJxW0e2UdaS4bR29dM0Y6W1zGZLsYaMK?=
 =?us-ascii?Q?/4ZtMr+qbXRrEh/Lsq6RnYS5iPawND0I7iB8QLL1ynTGCxGsdnyNJH2HQ+sz?=
 =?us-ascii?Q?d2gWyVYfkACi+4a/PaGsodrD+b5W/k5orHXo0kTc4eN9H+o1NhOlqIxYU5jw?=
 =?us-ascii?Q?iaLo65a1mnairj1UUwAGW1nZ6sXYbt8fdzocfUtJhrbnwFdnxwMRgPFsw0P4?=
 =?us-ascii?Q?ZcUSNOM5stKZq7HpmBy1MIKcnLeZDzrbPv1th8y6AsF/DoWPmGtyNMQ48jDP?=
 =?us-ascii?Q?qB9/NWeO39BNBIP3Hc381UHQOnt2jM07L2MDVu84ICYjjIY7JVWSZC+oRdHQ?=
 =?us-ascii?Q?lsfpYPGKKc+o+EE35MVNnWjxRHkH4IKhOfw/qEgTcVTXnopoES11NtybEnhO?=
 =?us-ascii?Q?lW8rFep2Gu+QP5NZYevnDcGE7AnHIypnEY3L/qA1OImeTCq4PoPb0QEg6fRQ?=
 =?us-ascii?Q?Kyz0hefPNBL1yVOaX43qgweme6gBlu0aMvy8fJNPUg/Mhe4X4Er0diJ9IWKI?=
 =?us-ascii?Q?bxlPgkM6bGmJNF78k3N7KZq3VNBjJ4lWLsQ8GC5HNSN6nxfNKmvTQNpeCEZG?=
 =?us-ascii?Q?2UW/m/7HFkkTxirGWPhHumdSqfIYlBDD32yR6i6mtAb3yTmp64L77uvYbhHr?=
 =?us-ascii?Q?mBaAb0NeYPenGtKNVhkUGYlYEw0dYo6WdRb20J159XOiIZlci0Gx1UHxJIqI?=
 =?us-ascii?Q?6G1H+BAvP/wJzaTejbk6G56yikmRftrRjRv42OPwidQg9PSGHttE4LAsVdgV?=
 =?us-ascii?Q?9t23khNj2MnRjYeUAnE4E4sKPvK7yfOcj+BTG5I6zZeKCX6/46M2Vq2/1VoA?=
 =?us-ascii?Q?p3c=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM7PR03MB6593834BA54AD8A126EF872185F89AM7PR03MB6593eurp_"
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6593.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6793211d-bb25-4d70-b059-08d95cd2220a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 14:13:03.1707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uWAyBEiMTFrQgC0mof3Z1YrIPDZYo+daujexEftLk+DzIZucNy9e78OI63Am5Gr3ae2pfd7/gazYg4lRn6msrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0301MB2563
X-Proofpoint-GUID: 8sgfpSsw19z4QEz_E0Tpn6AEPn9jIQt7
X-Proofpoint-ORIG-GUID: 8sgfpSsw19z4QEz_E0Tpn6AEPn9jIQt7
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-11_05:2021-08-11,2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 mlxlogscore=941 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108110095

--_000_AM7PR03MB6593834BA54AD8A126EF872185F89AM7PR03MB6593eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> Hi Roman,
Hi Julien,

>> Also, I added the log in xen_swiotlb_detect() and can see that swiotlb
>> still used (other devices within dom0 used too), when dom0 is direct map=
ped:
>>
>> [    1.870363] xen_swiotlb_detect() dev: rcar-fcp,
>> XENFEAT_direct_mapped, use swiotlb
>> [    1.878352] xen_swiotlb_detect() dev: rcar-fcp,
>> XENFEAT_direct_mapped, use swiotlb
>> [    1.886309] xen_swiotlb_detect() dev: rcar-fcp,
>> XENFEAT_direct_mapped, use swiotlb
>>
>> This means, that all devices are using swiotlb-xen DMA fops.
>> By the way, before applying this patches, dom0 always used swiotlb-xen
>> fops for initial domain by design.

>> This is expected because your domain is direct mapped.

May be, I don't understand right, Stefano reported the same issue when dom0=
 is not direct mapped,
but I have direct mapped dom0 and problem still exists.

>Ok. Would you be able to provide more information on where the dom0
>memory is allocated and the list of host RAM?

Host memory:
DRAM:  7.9 GiB
Bank #0: 0x048000000 - 0x0bfffffff, 1.9 GiB
Bank #1: 0x500000000 - 0x57fffffff, 2 GiB
Bank #2: 0x600000000 - 0x67fffffff, 2 GiB
Bank #3: 0x700000000 - 0x77fffffff, 2 GiB

dom0 memory map:
(XEN) Allocating 1:1 mappings totalling 2048MB for dom0:
(XEN) BANK[0] 0x00000048000000-0x00000050000000 (128MB)
(XEN) BANK[1] 0x00000058000000-0x000000c0000000 (1664MB)
(XEN) BANK[2] 0x00000510000000-0x00000520000000 (256MB)


>> We retrieved dev_addr(64b1d0000) + size > 32bit mask, but fcp driver
>> wants to use only 32 bit boundary address, but that's consequence.
>>
> Ok. So your device is only capable to do a 32-bit DMA. Is that correct?

Yes.

>> I think, the main reason of using bounce buffer is MFN address, not DMA
>> phys address.
>>
>I don't understand this sentence. Can you clarify it?

This address looks like the MFN because I'm using mapped grant tables from =
domU.

I've added the log and see the following:
with swiotlb:
[   78.620386] dma_map_sg_attrs() dev: rcar-du swiotlb, sg_page: fffffe0001=
b80000, page_to_phy: b6000000, xen_phys_to_dma: 64b1d0000

without swiotlb (worked fine):
[   74.456426] dma_map_sg_attrs() dev: rcar-du direct map, sg_page: fffffe0=
001b80000, page_to_phy: b6000000, xen_phys_to_dma: b6000000

I guess, need to figure out why we got a normal dom0 DMA address (b6000000)=
 and why 64b1d0000 when using swiotlb.

________________________________
From: Julien Grall <julien@xen.org>
Sent: Wednesday, August 11, 2021 1:30 PM
To: Roman Skakun <Roman_Skakun@epam.com>; sstabellini@kernel.org <sstabelli=
ni@kernel.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>; Andrii Anisov <Andrii_Anis=
ov@epam.com>; Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Oleksandr Tys=
hchenko <Oleksandr_Tyshchenko@epam.com>; Oleksandr Andrushchenko <Oleksandr=
_Andrushchenko@epam.com>; xen-devel@lists.xenproject.org <xen-devel@lists.x=
enproject.org>; Roman Skakun <rm.skakun@gmail.com>; Jan Beulich <jbeulich@s=
use.com>
Subject: Re: Disable swiotlb for Dom0



On 11/08/2021 09:49, Roman Skakun wrote:
> Hi, Julien!

Hi Roman,

>> > I have observed your patch here:
>> >https://urldefense.com/v3/__https://patchwork.kernel.org/project/xen-de=
vel/patch/alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad->>T480s/_=
_;!!GF_29dbcQIUBPA!kH5gzG1mxcIgDqMu2cVjTD3ggN9LiPN4OVinOnqrhLQrNr-mRb72udp2=
B5XBqZlW$ <https://urldefense.com/v3/__https://patchwork.kernel.org/project=
/xen-devel/patch/alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad->T=
480s/__;!!GF_29dbcQIUBPA!kH5gzG1mxcIgDqMu2cVjTD3ggN9LiPN4OVinOnqrhLQrNr-mRb=
72udp2B5XBqZlW$>[patchwork[.]kernel[.]org]
>> >
>> > And I collided with the same issue, when Dom0 device trying to use
>> > swiotlb fops for devices which are controlled by IOMMU.
>>
>>The issue Stefano reported was when the dom0 is not direct mapped.
>>However...
>
> I applied these patches:
> https://urldefense.com/v3/__https://github.com/torvalds/linux/commit/f507=
9a9a2a31607a2343e544e9182ce35b030578__;!!GF_29dbcQIUBPA!mZHMTZ8iSAfPg9D1VyO=
4mamUWVxP7K-H26d1jSf4qMsWkB3l92muGUIJPUgqgI9K$ [github[.]com]
> <https://urldefense.com/v3/__https://github.com/torvalds/linux/commit/f50=
79a9a2a31607a2343e544e9182ce35b030578__;!!GF_29dbcQIUBPA!mZHMTZ8iSAfPg9D1Vy=
O4mamUWVxP7K-H26d1jSf4qMsWkB3l92muGUIJPUgqgI9K$ [github[.]com]>
> https://urldefense.com/v3/__https://github.com/xen-project/xen/commit/d66=
bf122c0ab79063a607d6cf68edf5e91d17d5e__;!!GF_29dbcQIUBPA!mZHMTZ8iSAfPg9D1Vy=
O4mamUWVxP7K-H26d1jSf4qMsWkB3l92muGUIJPcdadGTB$ [github[.]com]
> <https://urldefense.com/v3/__https://github.com/xen-project/xen/commit/d6=
6bf122c0ab79063a607d6cf68edf5e91d17d5e__;!!GF_29dbcQIUBPA!mZHMTZ8iSAfPg9D1V=
yO4mamUWVxP7K-H26d1jSf4qMsWkB3l92muGUIJPcdadGTB$ [github[.]com]>
> to check this more pragmatically.
>
> Also, I added the log in xen_swiotlb_detect() and can see that swiotlb
> still used (other devices within dom0 used too), when dom0 is direct mapp=
ed:
>
> [    1.870363] xen_swiotlb_detect() dev: rcar-fcp,
> XENFEAT_direct_mapped, use swiotlb
> [    1.878352] xen_swiotlb_detect() dev: rcar-fcp,
> XENFEAT_direct_mapped, use swiotlb
> [    1.886309] xen_swiotlb_detect() dev: rcar-fcp,
> XENFEAT_direct_mapped, use swiotlb
>
> This means, that all devices are using swiotlb-xen DMA fops.
> By the way, before applying this patches, dom0 always used swiotlb-xen
> fops for initial domain by design.

This is expected because your domain is direct mapped.

>
>
>> Any reason to not use  the stable branch for 5.10? I don't know whether
>> your issue will be  fixed there, but the stable branch usually contains =
a
>> lot of bug fixes (including  security one). So it is a good idea to use
>> it over the first release  of a kernel version.
>
> Yes, sure, current BSP release based on 5.10 kernel:
> https://urldefense.com/v3/__https://github.com/xen-troops/linux/tree/v5.1=
0/rcar-5.0.0.rc4-xt0.1__;!!GF_29dbcQIUBPA!mZHMTZ8iSAfPg9D1VyO4mamUWVxP7K-H2=
6d1jSf4qMsWkB3l92muGUIJPVkpyAnu$ [github[.]com]
> <https://urldefense.com/v3/__https://github.com/xen-troops/linux/tree/v5.=
10/rcar-5.0.0.rc4-xt0.1__;!!GF_29dbcQIUBPA!mZHMTZ8iSAfPg9D1VyO4mamUWVxP7K-H=
26d1jSf4qMsWkB3l92muGUIJPVkpyAnu$ [github[.]com]>
> based on https://urldefense.com/v3/__https://github.com/renesas-rcar/linu=
x-bsp__;!!GF_29dbcQIUBPA!mZHMTZ8iSAfPg9D1VyO4mamUWVxP7K-H26d1jSf4qMsWkB3l92=
muGUIJPWPOIbVJ$ [github[.]com]
> <https://urldefense.com/v3/__https://github.com/renesas-rcar/linux-bsp/tr=
ee/v5.10.41/rcar-5.1.0.rc2__;!!GF_29dbcQIUBPA!mZHMTZ8iSAfPg9D1VyO4mamUWVxP7=
K-H26d1jSf4qMsWkB3l92muGUIJPQXMt_yV$ [github[.]com]>
> BTW, I specified the wrong kernel URL in the previous massage, sorry.
>
>> > Issue caused in xen_swiotlb_map_page():
>> > ```
>> > dev: rcar-fcp, cap: 0, dma_mask: ffffffff, page: fffffe00180c7400,
> page_to_phys: 64b1d0000,
>> > xen_phys_to_dma(phys): 64b1d0000
>> > ```
>>
>>I can't seem to find this printk in Linux 5.10. Did you add it yourself?
>
> Yes, it's my own log.

Ok. Would you be able to provide more information on where the dom0
memory is allocated and the list of host RAM?

>
>
>>This line suggests that the SWIOTLB tried to bounce the DMA buffer. In
>>general, the use of the bounce buffer should be rare. So I would suggest
>>to find out why this is used.
>>
>>Looking at the code, this suggests that one of the following check is fal=
se:
>>
>>/*
>>        * If the address happens to be in the device's DMA window,
>>* we can safely return the device addr and not worry about bounce
>>* buffering it.
>>*/
>>if (dma_capable(dev, dev_addr, size, true) &&
>>!range_straddles_page_boundary(phys, size) &&
>>!xen_arch_need_swiotlb(dev, phys, dev_addr) &&
>>swiotlb_force !=3D SWIOTLB_FORCE)
>>goto done;
>
> I checked this earlier and saw that dma_capable(dev, dev_addr, size,
> true)returns false as expected because
> we got dev_addr equals 64b1d0000 and according to this expression under
> dma_capable():
>
> ```
> dma_addr_t end =3D dev_addr + size - 1;
> return end <=3D min_not_zero(*dev->dma_mask, dev->bus_dma_limit);
> ```
> As result, DMA mask more than 32bit.
>> Let me start with that I agree we should disable swiotlb when we know
>> the device is protected. However, from what you describe, it sounds like
>> the same issue would appear if the IOMMU was disabled.
>
> Yes, it looks like a potential issue. This means that swiotlb should be
> worked correctly, when it's needed, agreed.
> But this is also potential improvement, and I presented this idea to
> discuss and create some patches.

You might be able to remove the Xen swiotlb but I am not sure you will
be able to remove the swiotlb completely if you have a device that only
supports 32-bit DMA.

>
>> Therefore, I think we should first find out why Linux wants to bounce
>> the DMA buffer.
>
> We retrieved dev_addr(64b1d0000) + size > 32bit mask, but fcp driver
> wants to use only 32 bit boundary address, but that's consequence.

Ok. So your device is only capable to do a 32-bit DMA. Is that correct?

> I think, the main reason of using bounce buffer is MFN address, not DMA
> phys address.

I don't understand this sentence. Can you clarify it?

Cheers,

--
Julien Grall

--_000_AM7PR03MB6593834BA54AD8A126EF872185F89AM7PR03MB6593eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;&nbsp;<span sty=
le=3D"background-color:rgb(255, 255, 255);display:inline !important">Hi
 Roman,</span><br>
</span><span style=3D"background-color: rgb(255, 255, 255); display: inline=
 !important; font-size: 12pt;">Hi&nbsp;</span><span style=3D"background-col=
or:rgb(255, 255, 255);display:inline !important"><span style=3D"font-family=
:Calibri, Arial, Helvetica, sans-serif;font-size:16px;background-color:rgb(=
255, 255, 255);display:inline !important">Julien,</span><br>
<br>
&gt;</span>&gt; Also, I added the log in xen_swiotlb_detect() and can see t=
hat swiotlb</span><br>
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt;
 still used (other devices within dom0 used too), when dom0 is direct mappe=
d:</span><br style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web =
(West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemF=
ont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;bac=
kground-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt;</sp=
an><br style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;backgroun=
d-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt;
 [ &nbsp; &nbsp;1.870363] xen_swiotlb_detect() dev: rcar-fcp,</span><br sty=
le=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&=
quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &qu=
ot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rg=
b(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt;
 XENFEAT_direct_mapped, use swiotlb</span><br style=3D"font-family:&quot;Se=
goe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif;font-size:14.6667px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt;
 [ &nbsp; &nbsp;1.878352] xen_swiotlb_detect() dev: rcar-fcp,</span><br sty=
le=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&=
quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &qu=
ot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rg=
b(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt;
 XENFEAT_direct_mapped, use swiotlb</span><br style=3D"font-family:&quot;Se=
goe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif;font-size:14.6667px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt;
 [ &nbsp; &nbsp;1.886309] xen_swiotlb_detect() dev: rcar-fcp,</span><br sty=
le=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&=
quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &qu=
ot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rg=
b(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt;
 XENFEAT_direct_mapped, use swiotlb</span><br style=3D"font-family:&quot;Se=
goe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif;font-size:14.6667px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt;</sp=
an><br style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;backgroun=
d-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt;&gt; This means, t=
hat all
 devices are using swiotlb-xen DMA fops.</span><br style=3D"font-family:&qu=
ot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI=
&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quo=
t;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt;
 By the way, before applying this patches, dom0 always used swiotlb-xen</sp=
an><br style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;backgroun=
d-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt;
 fops for initial domain by design.</span><br style=3D"font-family:&quot;Se=
goe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif;font-size:14.6667px;background-color:rgb(255, 255, 255)">
<br style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West Eur=
opean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Robo=
to, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-c=
olor:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"margin:=
0px;background-color:rgb(255, 255, 255);display:inline !important">&gt;</sp=
an><span style=3D"background-color:rgb(255, 255, 255);display:inline !impor=
tant">&gt;<span>&nbsp;</span></span>This
 is expected because your domain is direct mapped.<br>
</span><br>
May be, I don't understand right, Stefano reported the same issue when dom0=
 is not direct mapped,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
but I have direct mapped dom0 and problem still exists.&nbsp;<br>
<br>
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"margin:=
0px;background-color:rgb(255, 255, 255);display:inline !important">&gt;</sp=
an>Ok.
 Would you be able to provide more information on where the dom0</span><br>
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt;memory is allocate=
d
 and the list of host RAM?<br>
<br>
Host memory:<br>
<div>DRAM: &nbsp;7.9 GiB</div>
<div>Bank #0: 0x048000000 - 0x0bfffffff, 1.9 GiB</div>
<div>Bank #1: 0x500000000 - 0x57fffffff, 2 GiB</div>
<div>Bank #2: 0x600000000 - 0x67fffffff, 2 GiB</div>
Bank #3: 0x700000000 - 0x77fffffff, 2 GiB<br>
<br>
dom0 memory map:<br>
(XEN) Allocating 1:1 mappings totalling 2048MB for dom0:
<div>(XEN) BANK[0] 0x00000048000000-0x00000050000000 (128MB)</div>
<div>(XEN) BANK[1] 0x00000058000000-0x000000c0000000 (1664MB)</div>
<span>(XEN) BANK[2] 0x00000510000000-0x00000520000000 (256MB)</span><br>
</span><br>
<br>
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt;&gt; We retrieved =
dev_addr(64b1d0000)
 + size &gt; 32bit mask, but fcp driver</span><br>
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt;&gt; wants to use =
only
 32 bit boundary address, but that's consequence.</span><br style=3D"font-f=
amily:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot=
;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica=
 Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255, =
255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt;&gt;</span><br sty=
le=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&=
quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &qu=
ot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rg=
b(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;&nbsp;</span>Ok=
.
 So your device is only capable to do a 32-bit DMA. Is that correct?</span>=
<br>
<br>
Yes.&nbsp;<br>
<br>
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>&gt;
 I think, the main reason of using bounce buffer is&nbsp;MFN address, not D=
MA</span><br>
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt;<span style=3D"bac=
kground-color:rgb(255, 255, 255);display:inline !important">&gt;</span>
 phys address.</span><br style=3D"font-family:&quot;Segoe UI&quot;, &quot;S=
egoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, Bli=
nkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:1=
4.6667px;background-color:rgb(255, 255, 255)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">&gt;</span><span style=
=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&qu=
ot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot=
;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(=
255, 255, 255);display:inline !important">&gt;</span><br style=3D"font-fami=
ly:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Se=
goe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Ne=
ue&quot;, sans-serif;font-size:14.6667px;background-color:rgb(255, 255, 255=
)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><span style=3D"backgro=
und-color:rgb(255, 255, 255);display:inline !important">&gt;</span>I
 don't understand this sentence. Can you clarify it?</span><br>
<br>
This address looks like the<span style=3D"background-color:rgb(255, 255, 25=
5);display:inline !important">&nbsp;</span>MFN because I'm using mapped gra=
nt tables from domU.<br>
<br>
I've added the log and see the following:<br>
with swiotlb:<br>
<span style=3D"font-size: 12pt;">[ &nbsp; 78.620386] dma_map_sg_attrs() dev=
: rcar-du swiotlb</span><span style=3D"font-size: 12pt;">, sg_page: fffffe0=
001b80000, page_to_phy: b6000000, xen_phys_to_dma:
</span><span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystem=
Font, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 12pt; back=
ground-color: rgb(255, 255, 255); display: inline !important;">64b1d0000<br=
>
</span><br>
without swiotlb (worked fine):<br>
[ &nbsp; 74.456426] dma_map_sg_attrs() dev: rcar-du direct map, sg_page: ff=
fffe0001b80000, page_to_phy: b6000000,&nbsp;<span style=3D"margin:0px;font-=
size:12pt;background-color:rgb(255, 255, 255)">xen_phys_to_dma:<span>&nbsp;=
</span></span><span style=3D"margin:0px;font-size:12pt;font-family:&quot;Se=
goe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot=
;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, s=
ans-serif;background-color:rgb(255, 255, 255);display:inline !important"><s=
pan style=3D"font-family:Calibri, Arial, Helvetica, sans-serif;background-c=
olor:rgb(255, 255, 255);display:inline !important">b6000000</span></span><b=
r>
<br>
I guess, need to figure out why we got a normal dom0 DMA address (<span sty=
le=3D"background-color:rgb(255, 255, 255);display:inline !important">b60000=
00) and why&nbsp;<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Seg=
oe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, Blink=
MacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;background-co=
lor:rgb(255, 255, 255);display:inline !important">64b1d0000
 when using swiotlb.&nbsp;<br>
<br>
</span></span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Julien Grall &lt;juli=
en@xen.org&gt;<br>
<b>Sent:</b> Wednesday, August 11, 2021 1:30 PM<br>
<b>To:</b> Roman Skakun &lt;Roman_Skakun@epam.com&gt;; sstabellini@kernel.o=
rg &lt;sstabellini@kernel.org&gt;<br>
<b>Cc:</b> Bertrand Marquis &lt;bertrand.marquis@arm.com&gt;; Andrii Anisov=
 &lt;Andrii_Anisov@epam.com&gt;; Volodymyr Babchuk &lt;Volodymyr_Babchuk@ep=
am.com&gt;; Oleksandr Tyshchenko &lt;Oleksandr_Tyshchenko@epam.com&gt;; Ole=
ksandr Andrushchenko &lt;Oleksandr_Andrushchenko@epam.com&gt;;
 xen-devel@lists.xenproject.org &lt;xen-devel@lists.xenproject.org&gt;; Rom=
an Skakun &lt;rm.skakun@gmail.com&gt;; Jan Beulich &lt;jbeulich@suse.com&gt=
;<br>
<b>Subject:</b> Re: Disable swiotlb for Dom0</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
<br>
On 11/08/2021 09:49, Roman Skakun wrote:<br>
&gt; Hi, Julien!<br>
<br>
Hi Roman,<br>
<br>
&gt;&gt; &gt; I have observed your patch here:<br>
&gt;&gt; &gt;<a href=3D"https://urldefense.com/v3/__https://patchwork.kerne=
l.org/project/xen-devel/patch/alpine.DEB.2.21.2102161333090.3234@sstabellin=
i-ThinkPad-&gt;&gt;T480s/__;!!GF_29dbcQIUBPA!kH5gzG1mxcIgDqMu2cVjTD3ggN9LiP=
N4OVinOnqrhLQrNr-mRb72udp2B5XBqZlW$">https://urldefense.com/v3/__https://pa=
tchwork.kernel.org/project/xen-devel/patch/alpine.DEB.2.21.2102161333090.32=
34@sstabellini-ThinkPad-&gt;&gt;T480s/__;!!GF_29dbcQIUBPA!kH5gzG1mxcIgDqMu2=
cVjTD3ggN9LiPN4OVinOnqrhLQrNr-mRb72udp2B5XBqZlW$</a>
 &lt;<a href=3D"https://urldefense.com/v3/__https://patchwork.kernel.org/pr=
oject/xen-devel/patch/alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkP=
ad-&gt;T480s/__;!!GF_29dbcQIUBPA!kH5gzG1mxcIgDqMu2cVjTD3ggN9LiPN4OVinOnqrhL=
QrNr-mRb72udp2B5XBqZlW$&gt;[patchwork[.]kernel[.]org">https://urldefense.co=
m/v3/__https://patchwork.kernel.org/project/xen-devel/patch/alpine.DEB.2.21=
.2102161333090.3234@sstabellini-ThinkPad-&gt;T480s/__;!!GF_29dbcQIUBPA!kH5g=
zG1mxcIgDqMu2cVjTD3ggN9LiPN4OVinOnqrhLQrNr-mRb72udp2B5XBqZlW$&gt;[patchwork=
[.]kernel[.]org</a>]<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; And I collided with the same issue, when Dom0 device trying t=
o use<br>
&gt;&gt; &gt; swiotlb fops for devices which are controlled by IOMMU.<br>
&gt;&gt;<br>
&gt;&gt;The issue Stefano reported was when the dom0 is not direct mapped.<=
br>
&gt;&gt;However...<br>
&gt; <br>
&gt; I applied these patches:<br>
&gt; <a href=3D"https://urldefense.com/v3/__https://github.com/torvalds/lin=
ux/commit/f5079a9a2a31607a2343e544e9182ce35b030578__;!!GF_29dbcQIUBPA!mZHMT=
Z8iSAfPg9D1VyO4mamUWVxP7K-H26d1jSf4qMsWkB3l92muGUIJPUgqgI9K$">
https://urldefense.com/v3/__https://github.com/torvalds/linux/commit/f5079a=
9a2a31607a2343e544e9182ce35b030578__;!!GF_29dbcQIUBPA!mZHMTZ8iSAfPg9D1VyO4m=
amUWVxP7K-H26d1jSf4qMsWkB3l92muGUIJPUgqgI9K$</a> [github[.]com]
<br>
&gt; &lt;<a href=3D""></a>https://urldefense.com/v3/__https://github.com/to=
rvalds/linux/commit/f5079a9a2a31607a2343e544e9182ce35b030578__;!!GF_29dbcQI=
UBPA!mZHMTZ8iSAfPg9D1VyO4mamUWVxP7K-H26d1jSf4qMsWkB3l92muGUIJPUgqgI9K$ [git=
hub[.]com]&gt;<br>
&gt; <a href=3D"https://urldefense.com/v3/__https://github.com/xen-project/=
xen/commit/d66bf122c0ab79063a607d6cf68edf5e91d17d5e__;!!GF_29dbcQIUBPA!mZHM=
TZ8iSAfPg9D1VyO4mamUWVxP7K-H26d1jSf4qMsWkB3l92muGUIJPcdadGTB$">
https://urldefense.com/v3/__https://github.com/xen-project/xen/commit/d66bf=
122c0ab79063a607d6cf68edf5e91d17d5e__;!!GF_29dbcQIUBPA!mZHMTZ8iSAfPg9D1VyO4=
mamUWVxP7K-H26d1jSf4qMsWkB3l92muGUIJPcdadGTB$</a> [github[.]com]
<br>
&gt; &lt;<a href=3D""></a>https://urldefense.com/v3/__https://github.com/xe=
n-project/xen/commit/d66bf122c0ab79063a607d6cf68edf5e91d17d5e__;!!GF_29dbcQ=
IUBPA!mZHMTZ8iSAfPg9D1VyO4mamUWVxP7K-H26d1jSf4qMsWkB3l92muGUIJPcdadGTB$ [gi=
thub[.]com]&gt;<br>
&gt; to check this more pragmatically.<br>
&gt; <br>
&gt; Also, I added the log in xen_swiotlb_detect() and can see that swiotlb=
 <br>
&gt; still used (other devices within dom0 used too), when dom0 is direct m=
apped:<br>
&gt; <br>
&gt; [ &nbsp; &nbsp;1.870363] xen_swiotlb_detect() dev: rcar-fcp, <br>
&gt; XENFEAT_direct_mapped, use swiotlb<br>
&gt; [ &nbsp; &nbsp;1.878352] xen_swiotlb_detect() dev: rcar-fcp, <br>
&gt; XENFEAT_direct_mapped, use swiotlb<br>
&gt; [ &nbsp; &nbsp;1.886309] xen_swiotlb_detect() dev: rcar-fcp, <br>
&gt; XENFEAT_direct_mapped, use swiotlb<br>
&gt; <br>
&gt; This means, that all devices are using swiotlb-xen DMA fops.<br>
&gt; By the way, before applying this patches, dom0 always used swiotlb-xen=
 <br>
&gt; fops for initial domain by design.<br>
<br>
This is expected because your domain is direct mapped.<br>
<br>
&gt; <br>
&gt; <br>
&gt;&gt; Any reason to not use&nbsp; the stable branch for 5.10? I don't kn=
ow whether<br>
&gt;&gt; your issue will be&nbsp; fixed there, but the stable branch usuall=
y contains a<br>
&gt;&gt; lot of bug fixes (including&nbsp; security one). So it is a good i=
dea to use<br>
&gt;&gt; it over the first release&nbsp; of a kernel version.<br>
&gt; <br>
&gt; Yes, sure, current BSP release based on 5.10 kernel:<br>
&gt; <a href=3D"https://urldefense.com/v3/__https://github.com/xen-troops/l=
inux/tree/v5.10/rcar-5.0.0.rc4-xt0.1__;!!GF_29dbcQIUBPA!mZHMTZ8iSAfPg9D1VyO=
4mamUWVxP7K-H26d1jSf4qMsWkB3l92muGUIJPVkpyAnu$">
https://urldefense.com/v3/__https://github.com/xen-troops/linux/tree/v5.10/=
rcar-5.0.0.rc4-xt0.1__;!!GF_29dbcQIUBPA!mZHMTZ8iSAfPg9D1VyO4mamUWVxP7K-H26d=
1jSf4qMsWkB3l92muGUIJPVkpyAnu$</a> [github[.]com]
<br>
&gt; &lt;<a href=3D""></a>https://urldefense.com/v3/__https://github.com/xe=
n-troops/linux/tree/v5.10/rcar-5.0.0.rc4-xt0.1__;!!GF_29dbcQIUBPA!mZHMTZ8iS=
AfPg9D1VyO4mamUWVxP7K-H26d1jSf4qMsWkB3l92muGUIJPVkpyAnu$ [github[.]com]&gt;=
<br>
&gt; based on <a href=3D"https://urldefense.com/v3/__https://github.com/ren=
esas-rcar/linux-bsp__;!!GF_29dbcQIUBPA!mZHMTZ8iSAfPg9D1VyO4mamUWVxP7K-H26d1=
jSf4qMsWkB3l92muGUIJPWPOIbVJ$">
https://urldefense.com/v3/__https://github.com/renesas-rcar/linux-bsp__;!!G=
F_29dbcQIUBPA!mZHMTZ8iSAfPg9D1VyO4mamUWVxP7K-H26d1jSf4qMsWkB3l92muGUIJPWPOI=
bVJ$</a> [github[.]com]
<br>
&gt; &lt;<a href=3D""></a>https://urldefense.com/v3/__https://github.com/re=
nesas-rcar/linux-bsp/tree/v5.10.41/rcar-5.1.0.rc2__;!!GF_29dbcQIUBPA!mZHMTZ=
8iSAfPg9D1VyO4mamUWVxP7K-H26d1jSf4qMsWkB3l92muGUIJPQXMt_yV$ [github[.]com]&=
gt;<br>
&gt; BTW, I specified the wrong kernel URL&nbsp;in the previous massage, so=
rry.<br>
&gt; <br>
&gt;&gt; &gt; Issue caused in xen_swiotlb_map_page():<br>
&gt;&gt; &gt; ```<br>
&gt;&gt; &gt; dev: rcar-fcp, cap: 0, dma_mask: ffffffff, page: fffffe00180c=
7400, <br>
&gt; page_to_phys: 64b1d0000,<br>
&gt;&gt; &gt; xen_phys_to_dma(phys): 64b1d0000<br>
&gt;&gt; &gt; ```<br>
&gt;&gt;<br>
&gt;&gt;I can't seem to find this printk in Linux 5.10. Did you add it your=
self?<br>
&gt; <br>
&gt; Yes, it's my own log.<br>
<br>
Ok. Would you be able to provide more information on where the dom0 <br>
memory is allocated and the list of host RAM?<br>
<br>
&gt; <br>
&gt; <br>
&gt;&gt;This line suggests that the SWIOTLB tried to bounce the DMA buffer.=
 In<br>
&gt;&gt;general, the use of the bounce buffer should be rare. So I would su=
ggest<br>
&gt;&gt;to find out why this is used.<br>
&gt;&gt;<br>
&gt;&gt;Looking at the code, this suggests that one of the following check =
is false:<br>
&gt;&gt;<br>
&gt;&gt;/*<br>
&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp;* If the address happens to be in the d=
evice's DMA window,<br>
&gt;&gt;* we can safely return the device addr and not worry about bounce<b=
r>
&gt;&gt;* buffering it.<br>
&gt;&gt;*/<br>
&gt;&gt;if (dma_capable(dev, dev_addr, size, true) &amp;&amp;<br>
&gt;&gt;!range_straddles_page_boundary(phys, size) &amp;&amp;<br>
&gt;&gt;!xen_arch_need_swiotlb(dev, phys, dev_addr) &amp;&amp;<br>
&gt;&gt;swiotlb_force !=3D SWIOTLB_FORCE)<br>
&gt;&gt;goto done;<br>
&gt; <br>
&gt; I checked this earlier and saw that dma_capable(dev, dev_addr, size, <=
br>
&gt; true)returns false as expected because<br>
&gt; we got dev_addr equals 64b1d0000 and according to this expression unde=
r <br>
&gt; dma_capable():<br>
&gt; <br>
&gt; ```<br>
&gt; dma_addr_t end =3D dev_addr + size - 1;<br>
&gt; return end &lt;=3D min_not_zero(*dev-&gt;dma_mask, dev-&gt;bus_dma_lim=
it);<br>
&gt; ```<br>
&gt; As result, DMA mask more than&nbsp;32bit.<br>
&gt;&gt; Let me start with that I agree we should disable swiotlb when we k=
now<br>
&gt;&gt; the device is protected. However, from what you describe, it sound=
s like<br>
&gt;&gt; the same issue would appear if the IOMMU was disabled.<br>
&gt; <br>
&gt; Yes, it looks like a potential issue. This means that swiotlb should b=
e <br>
&gt; worked correctly, when it's needed, agreed.<br>
&gt; But this is also potential improvement, and I presented this idea to <=
br>
&gt; discuss and create some patches.<br>
<br>
You might be able to remove the Xen swiotlb but I am not sure you will <br>
be able to remove the swiotlb completely if you have a device that only <br=
>
supports 32-bit DMA.<br>
<br>
&gt; <br>
&gt;&gt; Therefore, I think we should first find out why Linux wants to bou=
nce<br>
&gt;&gt; the DMA buffer.<br>
&gt; <br>
&gt; We retrieved dev_addr(64b1d0000) + size &gt; 32bit mask, but fcp drive=
r <br>
&gt; wants to use only 32 bit boundary address, but that's consequence.<br>
<br>
Ok. So your device is only capable to do a 32-bit DMA. Is that correct?<br>
<br>
&gt; I think, the main reason of using bounce buffer is&nbsp;MFN address, n=
ot DMA <br>
&gt; phys address.<br>
<br>
I don't understand this sentence. Can you clarify it?<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM7PR03MB6593834BA54AD8A126EF872185F89AM7PR03MB6593eurp_--

