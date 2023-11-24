Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D63CB7F7818
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 16:49:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640806.999509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6YPS-000307-8Y; Fri, 24 Nov 2023 15:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640806.999509; Fri, 24 Nov 2023 15:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6YPS-0002xA-4g; Fri, 24 Nov 2023 15:48:02 +0000
Received: by outflank-mailman (input) for mailman id 640806;
 Fri, 24 Nov 2023 15:48:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG+4=HF=epam.com=prvs=569229df20=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r6YPQ-0002x4-73
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 15:48:00 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d628f58e-8ae0-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 16:47:58 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AODX7d2009043; Fri, 24 Nov 2023 15:47:50 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ujrwb1f8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Nov 2023 15:47:50 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by GV1PR03MB10314.eurprd03.prod.outlook.com (2603:10a6:150:16b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 15:47:46 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7025.020; Fri, 24 Nov 2023
 15:47:45 +0000
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
X-Inumbo-ID: d628f58e-8ae0-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RF4UKLAodQDaWXgQd0sa0kxc5qlq/J2a6MLIE4sID5tqCC+cnTCvlSGWrEbGfvMRNjODAjGfOEyISELo2tICpO4/esgrXnsxiybCaaS68zdXsC5JP0m+mQwvNPPOww859dhipkQEVpKUXLSU2IgqmS18jlfI/8Pmww2uC79mzV/Iinu9lXafysbnKX4opYz5YgYFRgBuVJpvODDtXvNuHY4l+Hnr8FOWxf3xz9ai8MZdqk6GSclN4uEmWb5yBIr6ZYG1LojkKsIRrq9WGeNH9x2/j3632/EqFu5r9NGLyU4aqKUt9lWRLrTE3XuuJoRr6+XtbcymXTfHS/MidlPOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6en3WvjYJusXWSWiY4NO+8cabS/2ZvY1/zSpJBI6n6U=;
 b=R2WV77jDO5wZGvN07XoeM76Heroqx0I418jG22zsY4L5fz9LGZLxqOTM/hNoUL4Is2urmR9n/SXWzwl5wh/ffSke1SC4btCvCNF4FT9nsioK7svklgcrtW2TkYZzVHadf4r/Qoh9QOSeYm4Oa4DjZ8ei8q94doIi8M6aMng0aPlkcn/jGvCJzfJrDri53EmnlCkbvw3WtCf3XdcstR9UsYGDO1cna7NxK4uZJyRJjpzTI2+7YVvhB0X6ktbjlpUJC7m3HiDK3gxBK97mWqGTpfSWPb9X6bhVT9CYQyvk4irg6cE83ONpYOW3JI8hQpsZjvJp4mRYli39lm/twyBCpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6en3WvjYJusXWSWiY4NO+8cabS/2ZvY1/zSpJBI6n6U=;
 b=PsUKIYMULBL7lcm12735xIg3/5AF9e4T5wpD3JLlibatSokhJuPYuAnGcsLQA1cH0DlV6Ci26cjZbU8BvjqLOjhRo6Mn4SBAajb6HKS0CeO31QKmx7d79eLsu051QfSWoRBQ/kdP9OCSUdUgmhzKgsUy61x3jHcKkRh5DxW8HQJV0mlOn4h2q3vUr1vPmBn/idprElMUVR2yREDxiun9RsMsIZnakVVNbTT1bgpvfIUUB++adfSrDL2TqkXKPEdEHAwYdlwLZsX/LosgB3qqppbuOxaCwB3Cr3IU6wVWKDUSihSycl5CzmghwwS1cIk38vk+nGhGc0+Ap5ytZpKxCA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Igor Mammedov <imammedo@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        David Woodhouse
	<dwmw@amazon.co.uk>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien
 Grall <julien@xen.org>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Anthony Perard
	<anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>,
        "open list:ARM TCG
 CPUs" <qemu-arm@nongnu.org>,
        "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 6/6] xen_arm: Add virtual PCIe host bridge support
Thread-Topic: [PATCH v2 6/6] xen_arm: Add virtual PCIe host bridge support
Thread-Index: AQHaHMeJqHnam8LJkECFe490J2r1JLCJanQAgAA18wA=
Date: Fri, 24 Nov 2023 15:47:45 +0000
Message-ID: <878r6nw3tr.fsf@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-7-volodymyr_babchuk@epam.com>
 <20231124133028.72ba1d6e@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231124133028.72ba1d6e@imammedo.users.ipa.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|GV1PR03MB10314:EE_
x-ms-office365-filtering-correlation-id: f4e3deeb-9259-4362-8474-08dbed04b3d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1I+d/DZR+WKWL6LgCQOcCUEtx6ElTipYBFy6LL+/UwNBwOAhUWiDh35oH4QdLpQ40PD/c9K+jAKtbwi9ic5BlX+KFXqfN17HsziMyhRVZ0FPiagTNItKLoBbmd4cBqTUXHrdLoUWrPyL8t3j0Vuwxdnp1VvNyhpEkOZOS9Yv5040x3B6/kcxH9R+yqA8yPCKpDjhv6iCYpugrT+xOhTJrmvUczxFHP9v8rAYg/FMUNITsSBzyqZBe135HmuKR7NtmHPp3yT0KB3Wv3n7n2YCOwf2J1tft/zrJOFkOXyQmoKFju3A4k5fQwqlV0WNbO7DZPr1qXrei78GTM30oBWmh4UZRnK2hgdaJo/v8NbBiu61YKhzYtbLrRPJ1xv0qMkEZl6hQEy6xPy6PM2hpqu4kbfblJ1RCUB/KsmI6MvqGgSZnuXOlUmgacS55PQn07WaU25GscxBliTHq4JzLEz6I2jCVyB39Wr3hvyOnydRPNrsgFGm4mYDyqS/t4rCtk1/5FIhF9d/d7Ef4qt21v3uFbeCkVhPCOdWI6ZQrOnnRwPpF1vGUxEZVrBZzEoNOTQpGfc9iYxG3YrSHb+1lFR8Ko6gQCsTXjsGey4vjggMq1IiCDzoCQ1VFM2G4079t/d7cp5TwLZqsa3FFiCBxUIT7UltL9pzI2BtaizLw5Q6lWk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(346002)(396003)(376002)(230273577357003)(230173577357003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(2616005)(36756003)(478600001)(122000001)(41300700001)(6486002)(38070700009)(86362001)(5660300002)(55236004)(316002)(71200400001)(6916009)(7416002)(6512007)(8936002)(8676002)(4326008)(6506007)(83380400001)(38100700002)(91956017)(66946007)(2906002)(76116006)(66446008)(64756008)(66476007)(54906003)(66556008)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?NueKAzqUxJUzyFE73pKhOoLQNvnnitlFLeQtpnMZaVhx+t5HuFVslf4i0C?=
 =?iso-8859-1?Q?iRBkiUH45yKcbe1EAYmGNyq+Kg1XWOSNnwKaqoTl9O1ozIxSjHlfC4Gctw?=
 =?iso-8859-1?Q?3UkQtLEvV6NCe/wi4f/4qRW210StLM1HBzGffy9bNqcJ3VfHeUx3dg1NbF?=
 =?iso-8859-1?Q?arE3F/ZePXxja16g4WLWbiQPI/UgHjOtoRFElK0R67RSdxJV2TVfJS+RZR?=
 =?iso-8859-1?Q?opjDoO+8sTvatUKlerAuSemQEXpi8oZ5bdY6ReWQ0XBuOlAsfbjnj4oQsw?=
 =?iso-8859-1?Q?AAql81Acih/P2XyyCd2vmLpA+1NgYsyywoZtRrbJQwlyYiFu6/uTbTVrmy?=
 =?iso-8859-1?Q?FxvkCr031kSalBKM4PHflBmvDuiqvx12B6ZvRwCSixoA8w5BZhwKw/xvQR?=
 =?iso-8859-1?Q?F/cw9+8eT8t6C69YCjd3RAuasq+0viamhQyGB0wjW0h7fHUdchDT7+jvNc?=
 =?iso-8859-1?Q?gWanPmGYejE4JcNuey0qWpFzwVahTVC1iXksxw2PhK16WaKPe2t+iG/+Hw?=
 =?iso-8859-1?Q?MdeLsXkK/E/kPPwIPy/KBdcXJAsop6aZGWMdvjhoTROu6fiuEmVBvTO3qd?=
 =?iso-8859-1?Q?vz8lScK0EraHgT3+9HTT2ytDH3o+dTFznKcuKYkEBN1P9I1GYa4uQ/PdAF?=
 =?iso-8859-1?Q?dCRQ4DegngMF4U+gZAKbpSmGB904TAdrwpfrX77XmGRZ67So2eN5iJ2ptD?=
 =?iso-8859-1?Q?vnsZqa45q7Rw146Z6UEb7X0n1mSahFkIejQUZDMekWZaK9j2+Ah8gctn2W?=
 =?iso-8859-1?Q?V9MABZZ9tNYwTIRKSJkeqp1/FP9B2ckyoR9HpAQKJFthB72mPE4Fv9sK7Y?=
 =?iso-8859-1?Q?IZQRZdEBeRxM3kR36qA6uuHcTuUDAmXGqzLIN+jvSVUYjLccgzRrsFhwfL?=
 =?iso-8859-1?Q?5yIjZNFiEU+xITzSDDTe+bFsygtShpce4IJ0Z46pnQqhwVzEzU1YCiKnCO?=
 =?iso-8859-1?Q?OuBKeO3dz8RTRVEHt34uYPY/DjtSzHuEQ1jMqFd1Ip1+ymloTJ9nrOyDBZ?=
 =?iso-8859-1?Q?ZTBO1yD5HCfe6Dq3oCP3oZwGa7yLIRm6VDGMjOF5+x8qf6cR55XY3fAyUz?=
 =?iso-8859-1?Q?4SIyoOFdrDgSYvcaX+RsPj1ly87U6ZwXF5IGDjcDJT0+kd6XtmXEadYFlT?=
 =?iso-8859-1?Q?9yLXEijHbR6VDOOa4Z8GiilxNUVIzyLU8o+3zPbhQMr/W/eC820AXAwq9+?=
 =?iso-8859-1?Q?/azrScFLZ1ZAxPMQayzTh4FB8RtVF8ATMSPSqHaPa6L0/jMzrl5Ao9cbRu?=
 =?iso-8859-1?Q?MJCVnEQidsNJwiWqD5PheX2p6iSmdNae4UlgJC0qKnrTiDyLUC/fWaXj5G?=
 =?iso-8859-1?Q?xrbl/rKK9lGn606LKGOm/sTSOzqcgrLDJKrDSRpbnRCIz43ZywTFWHqfk8?=
 =?iso-8859-1?Q?aWeBdmHIVJQRS5TDkKEJQXnpYx12ai45hJUhVpzKCNozl+SFhqiOxG7VrS?=
 =?iso-8859-1?Q?plP3aR/lKUkRi5jrOsgp4ou/yRJJUf2aAEiJiW0/HqROY5x20YobrQ/liu?=
 =?iso-8859-1?Q?mS0XIGbDYtikRQaBXV+wcj74EoJ673a734cwrVi0WPOg0wRg96W0vfjnIC?=
 =?iso-8859-1?Q?R1CvYRYs3NjdexSj8lrawKGoF9ZFV2APuAKxLtgN3dhAzoEaSHp7gZvM91?=
 =?iso-8859-1?Q?LIgkaDDuqLqqenFf6Grflaj4CRzJ9CiwMlVbYp2y0LXCNf+d2Jis/wmQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e3deeb-9259-4362-8474-08dbed04b3d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 15:47:45.5062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y4GDqJ0YCxc03kr+xr1CxRSicCN2JAgmkLRbDqjKeiV873MvHLoxALcDhl7RvUZgKqxA4BnFHvRdoElmDNQ8UoRJGaWeFxua0Ey/u0CiqVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10314
X-Proofpoint-GUID: a6Di1YzmVvK2815ctjganDuyuk_Jr3dB
X-Proofpoint-ORIG-GUID: a6Di1YzmVvK2815ctjganDuyuk_Jr3dB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-24_02,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 mlxlogscore=970 adultscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311240123


Hi Igor,

Thank you for the review,

Igor Mammedov <imammedo@redhat.com> writes:

> On Tue, 21 Nov 2023 22:10:28 +0000
> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com> wrote:
>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>=20
>> The bridge is needed for virtio-pci support, as QEMU can emulate the
>> whole bridge with any virtio-pci devices connected to it.
>>=20
>> This patch provides a flexible way to configure PCIe brige resources
>> with xenstore. We made this for several reasons:
>>=20
>> - We don't want to clash with vPCI devices, so we need information
>>   from Xen toolstack on which PCI bus to use.
>> - The guest memory layout that describes these resources is not stable
>>   and may vary between guests, so we cannot rely on static resources
>>   to be always the same for both ends.
>> - Also the device-models which run in different domains and serve
>>   virtio-pci devices for the same guest should use different host
>>   bridge resources for Xen to distinguish. The rule for the guest
>>   device-tree generation is one PCI host bridge per backend domain.
>>=20
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>=20
>> ---
>>=20
>> Changes from v1:
>>=20
>>  - Renamed virtio_pci_host to pcie_host entries in XenStore, because
>>  there is nothing specific to virtio-pci: any PCI device can be
>>  emulated via this newly created bridge.
>> ---
>>  hw/arm/xen_arm.c            | 186 ++++++++++++++++++++++++++++++++++++
>>  hw/xen/xen-hvm-common.c     |   9 +-
>>  include/hw/xen/xen_native.h |   8 +-
>>  3 files changed, 200 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
>> index b9c3ae14b6..d506d55d0f 100644
>> --- a/hw/arm/xen_arm.c
>> +++ b/hw/arm/xen_arm.c
>> @@ -22,6 +22,7 @@
>>   */
>> =20
>>  #include "qemu/osdep.h"
>> +#include "qemu/cutils.h"
>>  #include "qemu/error-report.h"
>>  #include "qapi/qapi-commands-migration.h"
>>  #include "qapi/visitor.h"
>> @@ -34,6 +35,9 @@
>>  #include "hw/xen/xen-hvm-common.h"
>>  #include "sysemu/tpm.h"
>>  #include "hw/xen/arch_hvm.h"
>> +#include "exec/address-spaces.h"
>> +#include "hw/pci-host/gpex.h"
>> +#include "hw/virtio/virtio-pci.h"
>> =20
>>  #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
>>  OBJECT_DECLARE_SIMPLE_TYPE(XenArmState, XEN_ARM)
>> @@ -58,6 +62,11 @@ struct XenArmState {
>>      struct {
>>          uint64_t tpm_base_addr;
>>      } cfg;
>> +
>> +    MemMapEntry pcie_mmio;
>> +    MemMapEntry pcie_ecam;
>> +    MemMapEntry pcie_mmio_high;
>> +    int         pcie_irq;
>>  };
>> =20
>>  static MemoryRegion ram_lo, ram_hi;
>> @@ -73,6 +82,7 @@ static MemoryRegion ram_lo, ram_hi;
>>  #define NR_VIRTIO_MMIO_DEVICES   \
>>     (GUEST_VIRTIO_MMIO_SPI_LAST - GUEST_VIRTIO_MMIO_SPI_FIRST)
>> =20
>> +/* TODO It should be xendevicemodel_set_pci_intx_level() for PCI interr=
upts. */
>>  static void xen_set_irq(void *opaque, int irq, int level)
>>  {
>>      if (xendevicemodel_set_irq_level(xen_dmod, xen_domid, irq, level)) =
{
>> @@ -129,6 +139,176 @@ static void xen_init_ram(MachineState *machine)
>>      }
>>  }
>> =20
>> +static void xen_create_pcie(XenArmState *xam)
>> +{
>> +    MemoryRegion *mmio_alias, *mmio_alias_high, *mmio_reg;
>> +    MemoryRegion *ecam_alias, *ecam_reg;
>> +    DeviceState *dev;
>> +    int i;
>> +
>> +    dev =3D qdev_new(TYPE_GPEX_HOST);
>> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>> +
>> +    /* Map ECAM space */
>> +    ecam_alias =3D g_new0(MemoryRegion, 1);
>> +    ecam_reg =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
>> +    memory_region_init_alias(ecam_alias, OBJECT(dev), "pcie-ecam",
>> +                             ecam_reg, 0, xam->pcie_ecam.size);
>> +    memory_region_add_subregion(get_system_memory(), xam->pcie_ecam.bas=
e,
>> +                                ecam_alias);
>> +
>> +    /* Map the MMIO space */
>> +    mmio_alias =3D g_new0(MemoryRegion, 1);
>> +    mmio_reg =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
>> +    memory_region_init_alias(mmio_alias, OBJECT(dev), "pcie-mmio",
>> +                             mmio_reg,
>> +                             xam->pcie_mmio.base,
>> +                             xam->pcie_mmio.size);
>> +    memory_region_add_subregion(get_system_memory(), xam->pcie_mmio.bas=
e,
>> +                                mmio_alias);
>> +
>> +    /* Map the MMIO_HIGH space */
>> +    mmio_alias_high =3D g_new0(MemoryRegion, 1);
>> +    memory_region_init_alias(mmio_alias_high, OBJECT(dev), "pcie-mmio-h=
igh",
>> +                             mmio_reg,
>> +                             xam->pcie_mmio_high.base,
>> +                             xam->pcie_mmio_high.size);
>> +    memory_region_add_subregion(get_system_memory(), xam->pcie_mmio_hig=
h.base,
>> +                                mmio_alias_high);
>> +
>> +    /* Legacy PCI interrupts (#INTA - #INTD) */
>> +    for (i =3D 0; i < GPEX_NUM_IRQS; i++) {
>> +        qemu_irq irq =3D qemu_allocate_irq(xen_set_irq, NULL,
>> +                                         xam->pcie_irq + i);
>> +
>> +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
>> +        gpex_set_irq_num(GPEX_HOST(dev), i, xam->pcie_irq + i);
>> +    }
>> +
>
>> +    DPRINTF("Created PCIe host bridge\n");
> replace DPRINTFs with trace_foo(), see 885f380f7be for example
>
>> +}
>> +
>> +static bool xen_read_pcie_prop(XenArmState *xam, unsigned int xen_domid=
,
>> +                               const char *prop_name, unsigned long *da=
ta)
>> +{
>> +    char path[128], *value =3D NULL;
>> +    unsigned int len;
>> +    bool ret =3D true;
>> +
>> +    snprintf(path, sizeof(path), "device-model/%d/pcie_host/%s",
>> +             xen_domid, prop_name);
>
> try to avoid usage of snprintf() in series
> see d2fe2264679 as an example
>

This whole function will be dropped in the next version.

>> +    value =3D xs_read(xam->state->xenstore, XBT_NULL, path, &len);
> maybe use g_autofree

I am not sure if this is a good idea, as xs_read() is provided by an
external library which uses plain old malloc().

>>      xen_create_virtio_mmio_devices(xam);
>> +    if (!xen_get_pcie_params(xam)) {
>> +        xen_create_pcie(xam);
>> +    } else {
>> +        DPRINTF("PCIe host bridge is not available,"
>> +                "only virtio-mmio can be used\n");
>
> so if something went wrong, it will be just ignored.
> Is it really expected behavior?
>

In the new version I reworked this section. Now we have 3 possible
outcomes:

1. No PCIe config was provided at all. This is fine, as user don't want
to use PCIe.

2. Full PCIe config was provided. We continue to creating the PCIe bridge.

3. Partial config was provided. This is an error and we exit.


--=20
WBR, Volodymyr=

