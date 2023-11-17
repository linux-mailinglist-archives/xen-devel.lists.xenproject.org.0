Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF447EEA4B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 01:23:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634767.990245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3me2-00018H-Hj; Fri, 17 Nov 2023 00:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634767.990245; Fri, 17 Nov 2023 00:23:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3me2-00015u-El; Fri, 17 Nov 2023 00:23:38 +0000
Received: by outflank-mailman (input) for mailman id 634767;
 Fri, 17 Nov 2023 00:23:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1XSP=G6=epam.com=prvs=568571a16b=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r3me0-00015Y-39
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 00:23:36 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8aad8723-84df-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 01:23:34 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AGNXLKt015452; Fri, 17 Nov 2023 00:23:27 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3udhuvt6ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 00:23:26 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by GV1PR03MB8765.eurprd03.prod.outlook.com (2603:10a6:150:8b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 00:23:21 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7002.021; Fri, 17 Nov 2023
 00:23:20 +0000
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
X-Inumbo-ID: 8aad8723-84df-11ee-98dc-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RtcfnA9GRcpryy0wVpIHgHX5LtSARekptl7sZc/iL9danjuH8/MJ6fiXpW8k/sT223AtHkfB1oggnOpxXNahmzcBOaabZGPJoBUlIk2mLoVfdIKJ7dBy2QAq10w+r0w/vC38AHOAu9Mfk5nmIW2noaypbJ/0JmOh4jp+xaaNFqY5NAD3CrwDyhGRk4yXPxQECvcGF/SSqvGDVU1rY33RKtZrRYEkFlN8LmvifOQqE1T+CHo0SdmlVikUc4/uqyjNIM5p11KGKpDNM1Bt3E4L8xomFsJKH22xWnCYfhX7aCJMiTPxWp6DyiOFSXf45kcQA+3XSZz5Fazn3pi84qCjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzYVP+bjllP06yFDXRnAeEPwHMmHpAPVPwmTc967Exs=;
 b=S72oVX0MGbmaV3XPv4Jg8wYJJ8qyYlDHn91mBj062h+3hJ1bPzeYqeUwGMhjGuD96h8pGU7no7mp5foE+zprvPLqwbemHuX2ztDHIHNULknROfHL7QmOmQcU2f8YenNjYvczPg6g8IfdjvV/+dM3Y2LGf3i7rAn6oPVpj+yl6Io4NdrbHpDw5PryKLcy66vOqRKpB07nve5u0fqZEhMoaBuTNEOJtDzfCPs957LyaWqVGqRq7mWdSaGIlPSpV1dLExxBY3AC1LtJXipZ3fJYdMmk+WMQ6hKpxeKtiC+ffxaMIbsiehV1N4JGnfKvmtXsnZaYEs13QbHg9i6ph0FTDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzYVP+bjllP06yFDXRnAeEPwHMmHpAPVPwmTc967Exs=;
 b=PdZ9aoVz53uFqjbB/nu2JLgnoOHVw13kgTPE0Z2IcQuc7rHUcqsZQscfPfH9n8d/3tk5MqQJQSI7rl+Ox8/VLY6VLH2qYsmdMD3NkVikg5Y8S+3hhh/dziScA+gvBH4JAqU5Ma8Uz6HvZqcAwewRYKfUHuOPu8k8rNhtsaTdZlZdki99NS58N0ZUIRq4GLLccqZOkc3dCG5ApcjMGGKivu7Lpgou2zPo84eu6wjN870zq9JYLrljwrZIvCznPOhUEom0Og3Dk0iSQq2AHnuN2gEyGbSTamN5SHRuTcNjzcHrTbjH7QQDwD3ZcTi18UA500rFAVneI/n2u5Wpt7w+ZQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Julien Grall
	<julien@xen.org>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Bertrand
 Marquis <bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        "vikram.garhwal@amd.com" <vikram.garhwal@amd.com>,
        Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: Re: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for
 virtio-pci
Thread-Topic: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for
 virtio-pci
Thread-Index: AQHaF7/0FLT7PaxCl0mKzTq8kNpAxLB7mIqAgABuuwCAAP6dAIAAjTaAgAAVo4A=
Date: Fri, 17 Nov 2023 00:23:20 +0000
Message-ID: <87h6ll4493.fsf@epam.com>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
 <20231115112611.3865905-3-Sergiy_Kibrik@epam.com>
 <f4523916-f8aa-4f3c-a148-2fc73b0c5fa4@xen.org>
 <a5ce647b-f372-41ee-b1d2-b6ff16c3d1a0@epam.com>
 <alpine.DEB.2.22.394.2311151518500.160649@ubuntu-linux-20-04-desktop>
 <875y2168ki.fsf@epam.com>
 <alpine.DEB.2.22.394.2311161504440.773207@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2311161504440.773207@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|GV1PR03MB8765:EE_
x-ms-office365-filtering-correlation-id: d8f019e3-cb1c-4b76-159f-08dbe703675c
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DLBtAXZxcWJ4UbP6Aq0JmiWvkd4WQuOc8MTaCj3pDU3fqJY7nyokGYgiG3U92CjIho6XJ/LhkV/9+miv0N/mQrTgbUFOg4Lu+BIvxxRDO1ltk+29eBGT7ijR1YntWeDlONY6nZ6NtaIV0iA1zACDn8XeiKn/rAUcA3Jyz6EYWbqE/K7pfcNcZBioz+KyTMa3y9eX1i2VxUJblb1935QJg3If5+npYvkocrpEMjlDucchj23Yj4nq6fGy4qnqonHPER0qro4q0k2uTWHzyCfvOauNqzE+4lKaUVuxh70UOy8ZnqcYxkujCs0uCtj/N9g8bEwPntpl+F8/O1hQu7sxtaqP8WoZMsTuSBMkyVRp+19c5MnF+7l5O8coAS7VGGM5ifa24yEU2hzqGnLVJyKKj8Airm14ykdI+Y/XS3sPqeb6TM2idC7KYy9aNbaeSqkjcOckOEi/nauAnrsS3LXQ+Xuf345NSYI9U6oxMrW2SMVMCNhITpL2iGIKpWZML3jLm9PIQOe6B+J9eZHlgW2pOwVlYO9B4+nT21umpgFqoWR/vx/OfjrLBe02PSX7p1l+UxTADrFJF2iBI0dTx6M+cZwau5XwSprfDz8UzcnjTNPWFuyB5RL2uGyiLlizYb1h
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(346002)(136003)(376002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(53546011)(55236004)(71200400001)(478600001)(83380400001)(2616005)(6512007)(6506007)(26005)(6486002)(6916009)(316002)(66946007)(76116006)(66476007)(66446008)(64756008)(54906003)(66556008)(91956017)(8676002)(8936002)(38070700009)(5660300002)(38100700002)(2906002)(86362001)(4326008)(41300700001)(122000001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?hAYJ3xVK/FwR6hzqG5DT0FFstiDFm2s/hvifBEKzXe0M1FsuKOz9fUlixx?=
 =?iso-8859-1?Q?o60Nj7rnRpKCic3PVmcayFZRtTFHVZJGArMLgebzRi9qkmL+e6auYTwjKJ?=
 =?iso-8859-1?Q?vix2RrogvMbbLgaRFfratnW5TPrCLx4mJhTBFAdRwHQJC4Ktvut/E/KpKz?=
 =?iso-8859-1?Q?iVcwrQ0D8phEz8p0h7uhL7j3aMhzebUC9JACKyto5Q4ddFUucMhwLX/KY5?=
 =?iso-8859-1?Q?c6mXyw5qGoe2OS6QtUWSncuG+AdDXlNse/vONGkUhGApdwTrups++r8G4P?=
 =?iso-8859-1?Q?aMYdhmeKRyo4fTWOzxWyVZpdJZo68ppB9Q81cE6fvY8S8aJOHFFdrLtRyg?=
 =?iso-8859-1?Q?w5Xiw/4V9GWScBJZTRm00Zx/meQ9ir+D+l5K4yXCQGCdW+dw+C2IvKfDmt?=
 =?iso-8859-1?Q?4h3ky/a/xvuh/SGtT4G9rjZKCCaGxOmwe6pJuSlwsI4IZJ424/CZ3FpdnM?=
 =?iso-8859-1?Q?VpSawBCwFMJtXfS1YBqhNLbFGq2Rq3f6Ct+Z4qxdm7Ag0fkkN8yxP59Go+?=
 =?iso-8859-1?Q?0QIP8vVHB2YF5NX7fH1M9g9ZaVOJdIwyoRGm6sMAggY8yrRVbX7fs49mzZ?=
 =?iso-8859-1?Q?z0SChZVwFXZv8IMyZckOZHUplDeiF915s1eMJozvIBqDrpd8bEJQjphD6x?=
 =?iso-8859-1?Q?oy4IdtgFsqEA74Ylhx/EqpSBxkEi/l1iWGGaSHoTSQpdbbPx0W+Ty6f7Mb?=
 =?iso-8859-1?Q?GGroLPfA8L++y1UyK+Nbuk4azcDuxdPk5MWlzhSz2hmaKgJMAzTsXxO8RH?=
 =?iso-8859-1?Q?KFp/hR3La2mYzR0Vdr1WuZiIdH154t2ypyTVZieocxq4tAQn2Ton113weu?=
 =?iso-8859-1?Q?KIvrrDoFlsrG8P+cXrhTbWc67scRncTtH3nA1VD+sKgk5BbfoLo0wREJzw?=
 =?iso-8859-1?Q?FZ+UuHkW2y4sxD8bjocofwlzBdJGn0DerzTDG/SmXHAEFsGwa5RdNG/t+F?=
 =?iso-8859-1?Q?Sl97yEH8vko1JMZlH8nW3uv5ztw/p2YXZDC3gqTgy6xfqm2AbeddUxnHya?=
 =?iso-8859-1?Q?5tLE1AeA83zpaLDqXpqFkyxcDTXqmuTscHBNUo3NTZDRzrst9cQ2HXKLiw?=
 =?iso-8859-1?Q?N+OZjWVY7RJEoZL/MtHvUd1X1saKBpwxuvREtR+XT2Ug//6OdXr9nVgpnQ?=
 =?iso-8859-1?Q?7Ybyk2TB21OVfRECwIUKtXDLmDzcsALhRwBTRhCsLXWubP9usSU4YjClOW?=
 =?iso-8859-1?Q?c1VUDS9E1ksoYJXLMtOWeSV+Kjmie5oLd/TgJcNQyCQQRB88F8DlcQlJE1?=
 =?iso-8859-1?Q?IwBf7h5jU2geqfksgn7EG6UswgSO7hQUEWrHNZ0BRxdlU61gurZxaffCXC?=
 =?iso-8859-1?Q?9Rv/AQZOJLlsb3N9JCGJ+G7EZu0Axth2CZ/7oCQvluyOX0hszsk0e31Zvl?=
 =?iso-8859-1?Q?tTzmTU1HCJbQ5Uw/wBLy7pQZSI7t5mQ/iJVif7xD3tr7+6aF3A/7qI/M8F?=
 =?iso-8859-1?Q?FyyqyR+vkXGXGxNLKjiCPAxOJYobZMcWnFiYig5Y4LP1NjZRLWaYxR1uS9?=
 =?iso-8859-1?Q?eG7KPFjs9qOH9h7D/Iptf8RgsDTy83y4CgsEXcAfUB8IJXAB53+RgapxuI?=
 =?iso-8859-1?Q?iznf+XuuxMv1JN6TV+At1ZpCpA0jvLD1e6BRGn5ruBKpo5sPiC4JOTFlQV?=
 =?iso-8859-1?Q?QgO0zS6z5w0VLH6jSpse/1sDqyOu64VN2pT88cpbq0swM1PAzcsVKh0A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f019e3-cb1c-4b76-159f-08dbe703675c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 00:23:20.7495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FUao/bt/mBn+YXW+dRmY4EJzubVgTRUSpfDKBDsHLb5b1U84VNByHH6LcpNHpBdN7JrubNnjUE9zMtrDZ8qwIEpfrDtrMPl9G/CcUGOFNOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8765
X-Proofpoint-GUID: oPh3WBxziuWjx4_GNnKpKjalTNgvqQdE
X-Proofpoint-ORIG-GUID: oPh3WBxziuWjx4_GNnKpKjalTNgvqQdE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_24,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170000


Hi Stefano,

Stefano Stabellini <sstabellini@kernel.org> writes:

> On Thu, 16 Nov 2023, Volodymyr Babchuk wrote:
>> Hi Stefano,
>>=20
>> Stefano Stabellini <sstabellini@kernel.org> writes:
>>=20
>> > + Stewart, Vikram
>> >
>> > On Wed, 15 Nov 2023, Oleksandr Tyshchenko wrote:
>> >> On 15.11.23 14:33, Julien Grall wrote:
>> >> > Thanks for adding support for virtio-pci in Xen. I have some questi=
ons.
>> >> >=20
>> >> > On 15/11/2023 11:26, Sergiy Kibrik wrote:
>> >> >> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> >> >>
>> >> >> In order to enable more use-cases such as having multiple
>> >> >> device-models (Qemu) running in different backend domains which pr=
ovide
>> >> >> virtio-pci devices for the same guest, we allocate and expose one
>> >> >> PCI host bridge for every virtio backend domain for that guest.
>> >> >=20
>> >> > OOI, why do you need to expose one PCI host bridge for every stubdo=
main?
>> >> >=20
>> >> > In fact looking at the next patch, it seems you are handling some o=
f the=20
>> >> > hostbridge request in Xen. This is adds a bit more confusion.
>> >> >=20
>> >> > I was expecting the virtual PCI device would be in the vPCI and eac=
h=20
>> >> > Device emulator would advertise which BDF they are covering.
>> >>=20
>> >>=20
>> >> This patch series only covers use-cases where the device emulator=20
>> >> handles the *entire* PCI Host bridge and PCI (virtio-pci) devices beh=
ind=20
>> >> it (i.e. Qemu). Also this patch series doesn't touch vPCI/PCI=20
>> >> pass-through resources, handling, accounting, nothing. From the=20
>> >> hypervisor we only need a help to intercept the config space accesses=
=20
>> >> happen in a range [GUEST_VIRTIO_PCI_ECAM_BASE ...=20
>> >> GUEST_VIRTIO_PCI_ECAM_BASE + GUEST_VIRTIO_PCI_TOTAL_ECAM_SIZE] and=20
>> >> forward them to the linked device emulator (if any), that's all.
>> >>=20
>> >> It is not possible (with current series) to run device emulators what
>> >> emulate only separate PCI (virtio-pci) devices. For it to be possible=
, I=20
>> >> think, much more changes are required than current patch series does.=
=20
>> >> There at least should be special PCI Host bridge emulation in Xen (or=
=20
>> >> reuse vPCI) for the integration. Also Xen should be in charge of form=
ing=20
>> >> resulting PCI interrupt based on each PCI device level signaling (if =
we=20
>> >> use legacy interrupts), some kind of x86's XEN_DMOP_set_pci_intx_leve=
l,=20
>> >> etc. Please note, I am not saying this is not possible in general,=20
>> >> likely it is possible, but initial patch series doesn't cover these=20
>> >> use-cases)
>> >>
>> >> We expose one PCI host bridge per virtio backend domain. This is a=20
>> >> separate PCI host bridge to combine all virtio-pci devices running in=
=20
>> >> the same backend domain (in the same device emulator currently).
>> >> The examples:
>> >> - if only one domain runs Qemu which servers virtio-blk, virtio-net,=
=20
>> >> virtio-console devices for DomU - only single PCI Host bridge will be=
=20
>> >> exposed for DomU
>> >> - if we add another domain to run Qemu to serve additionally virtio-g=
pu,=20
>> >> virtio-input and virtio-snd for the *same* DomU - we expose second PC=
I=20
>> >> Host bridge for DomU
>> >>=20
>> >> I am afraid, we cannot end up exposing only single PCI Host bridge wi=
th=20
>> >> current model (if we use device emulators running in different domain=
s=20
>> >> that handles the *entire* PCI Host bridges), this won't work.
>> > =20
>> >
>> > We were discussing the topic of vPCI and Virtio PCI just this morning
>> > with Stewart and Vikram. We also intend to make them work well togethe=
r
>> > in the next couple of months (great timing!!)
>> >
>> > However, our thinking is to go with the other approach Julien
>> > suggested: a single PCI Root Complex emulated in Xen by vPCI. QEMU wou=
ld
>> > register individual PCI devices against it.
>> >
>> > Vikram, Stewart, please comment. Our understanding is that it should b=
e
>> > possible to make QEMU virtio-pci work with vPCI with relatively minor
>> > efforts and AMD volunteers to do the work in the next couple of months
>> > on the vPCI side.
>> >
>> >
>> > Although it should be possible to make both approaches work at the sam=
e
>> > time, given that it would seem that EPAM and AMD have very similar
>> > requirements, I suggest we work together and collaborate on a single
>> > approach going forward that works best for everyone.
>> >
>> >
>> > Let me start by saying that if we can get away with it, I think that a
>> > single PCI Root Complex in Xen would be best because it requires less
>> > complexity. Why emulate 2/3 PCI Root Complexes if we can emulate only
>> > one?
>>=20
>> Well, in fact we tried similar setup, this was in the first version of
>> virtio-pci support. But we had a couple of issues with this. For
>> instance, this might conflict with PCI passthrough devices, with virtio
>> devices that have back-ends in different domains, etc. I am no saying
>> that this is impossible, but this just involves more moving parts.
>>=20
>> With my vPCI patch series in place, hypervisor itself assigns BDFs for
>> passed-through devices. Toolstack needs to get this information to know
>> which BDFs are free and can be used by virtio-pci.
>
> I'll premise that I don't really have an opinion on how the virtual BDF
> allocation should happen.
>
> But I'll ask the opposite question that Julien asked: if it is Xen that
> does the allocation, that's fine, then couldn't we arrange so that Xen
> also does the allocation in the toolstack case too (simply by picking
> the first available virtual BDF)?

Actually, this was my intention as well. As I said in the another email,
we just need to extend or add another domctl to manage vBFDs.

--=20
WBR, Volodymyr=

