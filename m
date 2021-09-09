Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC32405900
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 16:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183292.331381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOKzn-0005Uh-J4; Thu, 09 Sep 2021 14:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183292.331381; Thu, 09 Sep 2021 14:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOKzn-0005Sl-Fy; Thu, 09 Sep 2021 14:25:43 +0000
Received: by outflank-mailman (input) for mailman id 183292;
 Thu, 09 Sep 2021 14:25:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s+U0=N7=epam.com=prvs=9886b5da0c=roman_skakun@srs-us1.protection.inumbo.net>)
 id 1mOKzm-0005Sf-CE
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 14:25:42 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf24765e-1179-11ec-b1bc-12813bfff9fa;
 Thu, 09 Sep 2021 14:25:40 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 189E3jUb022402; 
 Thu, 9 Sep 2021 14:25:38 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 by mx0b-0039f301.pphosted.com with ESMTP id 3aykpp064p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 14:25:38 +0000
Received: from AM7PR03MB6593.eurprd03.prod.outlook.com (2603:10a6:20b:1b4::10)
 by AM6PR03MB5959.eurprd03.prod.outlook.com (2603:10a6:20b:e2::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 9 Sep
 2021 14:25:29 +0000
Received: from AM7PR03MB6593.eurprd03.prod.outlook.com
 ([fe80::7863:ae83:98b2:59d6]) by AM7PR03MB6593.eurprd03.prod.outlook.com
 ([fe80::7863:ae83:98b2:59d6%9]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 14:25:29 +0000
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
X-Inumbo-ID: cf24765e-1179-11ec-b1bc-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4GfDRmBZTUUX/ShchjpqnNtE/NY9eEmSUMhSLLmFVCXDW0KYtG6EtCLe4aytdgkNFJe22/GnDkfjuILn6/oBPrlJe+58PYyPiANXi9MLzEAux/cbkWCDOeni1tkHj/RW23qPCAp0wubbpwDy2mSSX8nbcnEieY94VP8OTPZrrON+DjOqOV4Jf0bnF1whdFCU1QQjbHKeIBBLpeVvY6LSTMs0j4CHDRUA6wboxCWKafqT6oeNsoB6LfS4fY60DfKAQ69UcvvQeYs4yM124TduZZCd8BRsZCKO1IYzjY5Hd+c3D768sQ27xcOUtqbg75628wD47hmixNY/nXIP46/2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=xM/+i8ftZh3y1yhrEYlxwAFDr8KH9cXmU7SVWDfOIHs=;
 b=ZjUPboLOhNzmEf1pSUHBS5L/+05zbHj98DfnPjdo/i4Sb+yF0weSB2x+82s0ik1bX1v4bsRF3UwDhD0tf3BicYP/6NCHnOnWnGwqmXBbSLJ0a2CBtnNmmsA7y0EhV0obECO12SM9kbTLxNKlALBYDe5EwBno0G1fQESzL4O4q+xUekB3Dw1V8weT6i367so1dXg7x0kandaPyJRdr2LMfD331KMfO8S465aPepWt2TRJMt6oIFTRMbN7fGfJB6/0xBy+ng20BV0ct7SqdwFJzrOhTbAIKgJH6WrLGYeVz4KF939GJpnl6Tg39XoZkDtIuwOTg2j87chmI8yDIDBFCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xM/+i8ftZh3y1yhrEYlxwAFDr8KH9cXmU7SVWDfOIHs=;
 b=Sdt66G1UeCaaE3m4iegWM6ArTz9pE1HJTxymg7gLnjcjsQxQHL7pmX5015bPSu/P9LsJ++FXX62UZD8UCQOpClQ0bcJC6eqXHW0+BuWjXzBqxL9/wW12pXqpMHAx1h68Fw8WKDpmvl3lyHzCRyWQPZ7s9js1pjQDq7iLJLBHL0f5Jn/cVm2bjlPZG04FX4kvJ/LrRZpCTciolviAo+RcMPWcZLIaCEmGxOzoKGlaHmL2cXn1tQZbJrxQjSZgQyE+9iD47O1pUKphcf+3lVqAzpbLqCHYQONq/esGifEFV4ZwxfFDjWvdMPf+0wtr35ApYXV3lyx1jPPLx9nWRdGh3Q==
From: Roman Skakun <Roman_Skakun@epam.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Andrii Anisov
	<Andrii_Anisov@epam.com>,
        Roman Skakun <rm.skakun@gmail.com>,
        Oleksandr
 Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: Disable IOMMU in Dom0
Thread-Topic: Disable IOMMU in Dom0
Thread-Index: AQHXnnd7IVjUu+L6S0mPq9naNxJ1FauOJ3YAgADDGouAAA7qgIAMwIiG
Date: Thu, 9 Sep 2021 14:25:29 +0000
Message-ID: 
 <AM7PR03MB6593E7F0C691F98E07B8141C85D59@AM7PR03MB6593.eurprd03.prod.outlook.com>
References: 
 <AM7PR03MB65936E5D0B25567D1B2FAECA85CC9@AM7PR03MB6593.eurprd03.prod.outlook.com>
 <alpine.DEB.2.21.2108311444310.18862@sstabellini-ThinkPad-T480s>
 <AM7PR03MB659358C0EBA9D71AEEF7A60885CD9@AM7PR03MB6593.eurprd03.prod.outlook.com>
 <179e4b7f-38d9-991d-3f99-64a74559986d@xen.org>
In-Reply-To: <179e4b7f-38d9-991d-3f99-64a74559986d@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 6f9836ef-1bd8-a00e-77c2-5b5617176f83
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c48b36da-45f1-4dbf-0594-08d9739dacc1
x-ms-traffictypediagnostic: AM6PR03MB5959:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB59594CD885E01F3CED5A585B85D59@AM6PR03MB5959.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MXXnr1cilkOPE8wLHkxfjjNVa4tRfq037O3wzDqCl9bS3oSHFZ7KjbZ0lk/rYy+m4/WOnVuaBuqBFnvzgDhiFlqFylRLh/DqBmurpSoayZUz8xodbV2GYCbJEYR1klyuqsRwcDb1hEVZMddMvav2YE+yDnOLG3feZTzqz31vItWY6Y47MXG8vKme7gOD4eAUtC3pKiu9jhRyrgY6QboEr3hNUtEA/Dbn0TPC5/pG4JVzgrdnN5KjsIht0NSRO0b3aABIyQsa0WowKVDZd4vOzaPT3gWzWHMWIxRcfyr/2CHoK0F+e1zA5Uq2wYnIUG5DUfIgLKxgJ3M1H2Pa/maO8ouTcuhyKqT0ALrK63ZsqMXuhOpFB+2YwYgk81vPiaADGLTKdCzX0Km8z8fWoTjGGgjWv9wxj8BheLHurfDzNz/fQMqondPC1V9QMROIYGWT8sWnepFxd2C4RvbN3iltUwcoO+u4i9hIsWurpc8MnV0vMHesdyJSl7YRwPDw91b+HdFI44P+ylrps2R9VU86op9SO1gCMAiQ/A/L1Of6Zqz9ElpsPx7mzl3xSxEqrF/tW49HHsNmOdJfuTaDADxSIj7Yu2DPc2utpTV6p/0gpzClKjOeGsityiy3BZro6zW1XjuTI3cKvloBoScPJUW1o1NLlcyBeVT/VS6Umu90XaN96Oq1Gdh2UKNvmDL1tVO8+esgPGqqJs/wsYBriLhscHXfegI/n2UreNAGZa3M80xv+FBn3YzRzSElWtnDBOCpq4JauImCWy0e6czBMBIIcbh76dJVexJ1qirCO1y5GldVycdPee2Jdv3wZfNIfu2oJIaANAn9hg1q+3WraZxmGQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6593.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39850400004)(376002)(8676002)(2906002)(6916009)(76116006)(91956017)(26005)(19627405001)(6506007)(53546011)(54906003)(71200400001)(55236004)(9686003)(52536014)(66446008)(5660300002)(66556008)(66476007)(7696005)(316002)(64756008)(66946007)(83380400001)(4326008)(33656002)(55016002)(166002)(38100700002)(122000001)(38070700005)(18265965003)(478600001)(966005)(86362001)(8936002)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?svjwp2paua5f8TtHscZRxfjoXKW2XOQtJCdO+nODgwf2L+4thqZwh15he0vr?=
 =?us-ascii?Q?GFdDMi3ffuF8zP2IFDa/xIhWouz993AhgIjdExVLjN4+67klc8jbDYpDDWgJ?=
 =?us-ascii?Q?nQAI45xsgyMqqTR0vB6Yzq4wiZf9DRUVucaR8bajhOdujJ6gUn2Fq09WiYGN?=
 =?us-ascii?Q?nHdsGKLCOE3BiohCmSl8yLsREb2mEqwuCxmk4qKXOknk6F0IS24n5v8p780l?=
 =?us-ascii?Q?AAWyJCiK+pStbVhxrklae1b85J9kXoWJ9FNptaufPeYjgMkAOD9OLOl5B+EY?=
 =?us-ascii?Q?LqSE2ricOOPqu3ZYa+iiNoHVQKBmn5rVf5WDcRYBiYs6wijKc7VUePYOHoiM?=
 =?us-ascii?Q?Y5oupko1ef8sYxgilDYd9EBCyV7ea5SEDNcBRE73kDjMoa3vPevIZf6t8GgZ?=
 =?us-ascii?Q?wQMj6LB7xfTUNZSYOcNb/rQUcinZrIgzUZwEHHJCfoYlFecPXJhmZBC3yCAw?=
 =?us-ascii?Q?vmQETfBJ0Z1zooIWDGCWp7p/n8XVWlHX9AeQ8WGgVaNMjLODZH1TMuRzhVZ0?=
 =?us-ascii?Q?bHCB/Y9b9rqjO9mA0R0R5xdwi360hT7D7idal9yjlcd9G18IiFGuC6cBjNbw?=
 =?us-ascii?Q?L2B0nHsd6o7521GggCA2WdIuSNJGPhmHcvWgkoSapj7ZVGrvLXVrBuVBnK1J?=
 =?us-ascii?Q?+KB4r4rgrnygLzNq+d5H7t6Jf+Io65GPIxH/IEw9SlhqClv9oeqPpADVxuJQ?=
 =?us-ascii?Q?rwQVDkDHOBhSBMilZPoR3psDdVC2jqoxHOGoxxcIUFOqfgNeFsWEaa5sTKpN?=
 =?us-ascii?Q?WBtT+R8GvM2pys17veTIOASvXVeUnljU6c27MVCcpXO+67ZhC4mOanTuGihN?=
 =?us-ascii?Q?/swqVsFiIbPQqkCcailxf90jkQo8rrIaHxJtGZHpF+WTZiinBFf1oNdUlf3/?=
 =?us-ascii?Q?jdXJ1why4S5e922CIiJqiFyLxOB49XltNKOE8HoqzqFFzeRZM3kSz1zoJVyY?=
 =?us-ascii?Q?JsCIAY7UWMtVp1s6dCZb0hs+npDxC96cLu0zJZAILD07tmNXsU/O/Zlw4M7n?=
 =?us-ascii?Q?TczeKIajVFU1CJ6MBHiXv3mB+38WmgCGHsC2dwcBnOgjpMe+CnXRpBCq6h3G?=
 =?us-ascii?Q?hz+spYy4WXL7UhuTLy/fC5xM1a0ukJflRz9n6B2jtTwLr86f+L8uDP6plLR4?=
 =?us-ascii?Q?p73OfBa7ZCrfU95EfUqUXaLPd6+ukXYfxC8DCluhzhj1nFPrIbcO/gZJppBA?=
 =?us-ascii?Q?CjblRrSWeJItZKRAfJjePleMUjk8uzhxVP0UqIMrTqx/lMKAQDJSfPuJ8EHs?=
 =?us-ascii?Q?bFzvEdgj+W13zRM0exrrP+1yuhwcEjXjNAQhxbWGv9cCQi0QeOFACzt/d+nk?=
 =?us-ascii?Q?xps=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM7PR03MB6593E7F0C691F98E07B8141C85D59AM7PR03MB6593eurp_"
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6593.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c48b36da-45f1-4dbf-0594-08d9739dacc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 14:25:29.4239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RRmEW+UpTEDAnDaBbT/Wo8IOE+zUnJtVj4qITsqX4FqwM/9DMCs1ka/swWMC8g05XMGi2HdQq2gmuJyvCzqGvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5959
X-Proofpoint-ORIG-GUID: BJZqtw0DytT34faNTsqi_o4Ai6Un9IWa
X-Proofpoint-GUID: BJZqtw0DytT34faNTsqi_o4Ai6Un9IWa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-09_05,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 clxscore=1011 phishscore=0
 malwarescore=0 adultscore=0 mlxlogscore=569 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109090088

--_000_AM7PR03MB6593E7F0C691F98E07B8141C85D59AM7PR03MB6593eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Thanks for the clarification!

I aim towards to prepare implementation for upstream to disable SWIOTLB for=
 IOMMU-protected devices in Dom0.
To provide this functionality need to add additional binding for each prote=
cted device in device-tree.
After this step, I will also prepare the patch to make ensure that ballooni=
ng code prepares all allocations below 4GB.

We are going to prepare this functionality only for device-tree based syste=
m configurations.
We don't have resources to support ACPI configuration.

Would you be ok with upstreaming only device-tree configuration?

Cheers,
Roman
________________________________
From: Julien Grall <julien@xen.org>
Sent: Wednesday, September 1, 2021 1:22 PM
To: Roman Skakun <Roman_Skakun@epam.com>; Stefano Stabellini <sstabellini@k=
ernel.org>
Cc: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>; Bertra=
nd Marquis <bertrand.marquis@arm.com>; Andrii Anisov <Andrii_Anisov@epam.co=
m>; Roman Skakun <rm.skakun@gmail.com>; Oleksandr Tyshchenko <Oleksandr_Tys=
hchenko@epam.com>
Subject: Re: Disable IOMMU in Dom0

Hi Roman

On 01/09/2021 10:59, Roman Skakun wrote:
>> If you have a setup  where Dom0 is not 1:1 mapped (which is not currentl=
y
>> possible with upstream  Xen but it is possible with cache coloring) and
>> uses the IOMMU to make  device DMA work like regular DomUs, then passing
>> XENFEAT_not_direct_mapped  to Linux would make it work. Without
>> XENFEAT_not_direct_mapped,  Linux would try to use swiotlb-xen which has
>> code that relies on  Linux being 1:1 mapped to work properly.
>
> I'm using 1:1 Dom0.
> According to your patch series, xen-swiotlb fops will be applied for all
> devices
> because XENFEAT_direct_mapped is active, as shown here:
> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.14/source=
/arch/arm64/mm/dma-mapping.c*L56__;Iw!!GF_29dbcQIUBPA!i7I0DxCbP4ibLDwzRkeFk=
gRQbKh-fVD9McLqabG1TzZs9smOVBeowPS_Iv_mvn3O$ [elixir[.]bootlin[.]com]
> <https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.14/sourc=
e/arch/arm64/mm/dma-mapping.c*L56__;Iw!!GF_29dbcQIUBPA!i7I0DxCbP4ibLDwzRkeF=
kgRQbKh-fVD9McLqabG1TzZs9smOVBeowPS_Iv_mvn3O$ [elixir[.]bootlin[.]com]>
>
> I agreed, that xen-swiotlb should work correctly, but in my case, I
> retrieved MFN here:
> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.14/source=
/drivers/xen/swiotlb-xen.c*L366__;Iw!!GF_29dbcQIUBPA!i7I0DxCbP4ibLDwzRkeFkg=
RQbKh-fVD9McLqabG1TzZs9smOVBeowPS_IgZgXPjC$ [elixir[.]bootlin[.]com]
> <https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.14/sourc=
e/drivers/xen/swiotlb-xen.c*L366__;Iw!!GF_29dbcQIUBPA!i7I0DxCbP4ibLDwzRkeFk=
gRQbKh-fVD9McLqabG1TzZs9smOVBeowPS_IgZgXPjC$ [elixir[.]bootlin[.]com]>
> which is greater than 32bit and xen-swiotlb tries to use bounce buffer
> as expected.
> It can lead to decrease a performance because I have a long buffer ~4MB.
>
> I thought, that we can disable swiotlb fops for devices which are
> controlled by IOMMU.

Yes you can disable swiotlb for devices which are controlled by the
IOMMU. But this will not make your problem disappear, it simply hides
until it bites you in a more subttle way.

 From what you wrote, you have a 32-bit DMA capable. So you always need
to have an address below 4GB. For foreign mapping, there is no guarantee
the Guest Physical Address will actually be below 4GB.

Today, the ballooning code only ask Linux to steal *a* RAM page for
mapping the foreign page. This may or may not be below 4GB depending on
how you assigned the RAM to dom0 (IIRC you had some RAM above 4GB).

But that's the current behavior. One of your work colleague is looking
at avoid to steal RAM page to avoid exhausting the memory. So foreign
mapping may end up to be a lot higher in memory.

IOW, you will need to be able to bounce the DMA buffer for your device.
If you want to avoid bouncing, the proper way would be to rework the
ballonning code so pages are allocated below 4GB.

Cheers,

--
Julien Grall

--_000_AM7PR03MB6593E7F0C691F98E07B8141C85D59AM7PR03MB6593eurp_
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
</div>
<div style=3D"box-sizing:border-box;font-family:&quot;Segoe UI&quot;, syste=
m-ui, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, sans-serif=
;font-size:14px">
<span style=3D"font-size:12pt"></span>Hi Julien,
<div><br>
</div>
<div>Thanks for the clarification!</div>
<div><br>
</div>
<div>I aim towards to prepare implementation for upstream to disable SWIOTL=
B for IOMMU-protected devices in Dom0.</div>
<div>To provide this functionality need to add additional binding for each =
protected device in device-tree.</div>
<div>After this step, I will also prepare the patch to make ensure that bal=
looning code prepares all allocations below 4GB.</div>
<div><br>
We are going to prepare this functionality only for device-tree based syste=
m configurations.</div>
<div>We don't have resources to support ACPI configuration.</div>
<div><br>
</div>
<div>Would you be ok with upstreaming only device-tree configuration?</div>
<div><br>
</div>
<div>Cheers,</div>
Roman
<div style=3D"font-size:12pt"></div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Julien Grall &lt;juli=
en@xen.org&gt;<br>
<b>Sent:</b> Wednesday, September 1, 2021 1:22 PM<br>
<b>To:</b> Roman Skakun &lt;Roman_Skakun@epam.com&gt;; Stefano Stabellini &=
lt;sstabellini@kernel.org&gt;<br>
<b>Cc:</b> xen-devel@lists.xenproject.org &lt;xen-devel@lists.xenproject.or=
g&gt;; Bertrand Marquis &lt;bertrand.marquis@arm.com&gt;; Andrii Anisov &lt=
;Andrii_Anisov@epam.com&gt;; Roman Skakun &lt;rm.skakun@gmail.com&gt;; Olek=
sandr Tyshchenko &lt;Oleksandr_Tyshchenko@epam.com&gt;<br>
<b>Subject:</b> Re: Disable IOMMU in Dom0</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Roman<br>
<br>
On 01/09/2021 10:59, Roman Skakun wrote:<br>
&gt;&gt; If you have a setup&nbsp; where Dom0 is not 1:1 mapped (which is n=
ot currently<br>
&gt;&gt; possible with upstream&nbsp; Xen but it is possible with cache col=
oring) and<br>
&gt;&gt; uses the IOMMU to make&nbsp; device DMA work like regular DomUs, t=
hen passing<br>
&gt;&gt; XENFEAT_not_direct_mapped&nbsp; to Linux would make it work. Witho=
ut<br>
&gt;&gt; XENFEAT_not_direct_mapped,&nbsp; Linux would try to use swiotlb-xe=
n which has<br>
&gt;&gt; code that relies on&nbsp; Linux being 1:1 mapped to work properly.=
<br>
&gt; <br>
&gt; I'm using 1:1 Dom0.<br>
&gt; According to your patch series, xen-swiotlb fops will be applied for a=
ll <br>
&gt; devices<br>
&gt; because XENFEAT_direct_mapped is active, as shown here:<br>
&gt; <a href=3D"https://urldefense.com/v3/__https://elixir.bootlin.com/linu=
x/v5.14/source/arch/arm64/mm/dma-mapping.c*L56__;Iw!!GF_29dbcQIUBPA!i7I0DxC=
bP4ibLDwzRkeFkgRQbKh-fVD9McLqabG1TzZs9smOVBeowPS_Iv_mvn3O$">
https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.14/source/a=
rch/arm64/mm/dma-mapping.c*L56__;Iw!!GF_29dbcQIUBPA!i7I0DxCbP4ibLDwzRkeFkgR=
QbKh-fVD9McLqabG1TzZs9smOVBeowPS_Iv_mvn3O$</a> [elixir[.]bootlin[.]com]
<br>
&gt; &lt;<a href=3D""></a>https://urldefense.com/v3/__https://elixir.bootli=
n.com/linux/v5.14/source/arch/arm64/mm/dma-mapping.c*L56__;Iw!!GF_29dbcQIUB=
PA!i7I0DxCbP4ibLDwzRkeFkgRQbKh-fVD9McLqabG1TzZs9smOVBeowPS_Iv_mvn3O$ [elixi=
r[.]bootlin[.]com]&gt;<br>
&gt; <br>
&gt; I agreed, that xen-swiotlb should work correctly, but in my case, I <b=
r>
&gt; retrieved MFN here:<br>
&gt; <a href=3D"https://urldefense.com/v3/__https://elixir.bootlin.com/linu=
x/v5.14/source/drivers/xen/swiotlb-xen.c*L366__;Iw!!GF_29dbcQIUBPA!i7I0DxCb=
P4ibLDwzRkeFkgRQbKh-fVD9McLqabG1TzZs9smOVBeowPS_IgZgXPjC$">
https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.14/source/d=
rivers/xen/swiotlb-xen.c*L366__;Iw!!GF_29dbcQIUBPA!i7I0DxCbP4ibLDwzRkeFkgRQ=
bKh-fVD9McLqabG1TzZs9smOVBeowPS_IgZgXPjC$</a> [elixir[.]bootlin[.]com]
<br>
&gt; &lt;<a href=3D""></a>https://urldefense.com/v3/__https://elixir.bootli=
n.com/linux/v5.14/source/drivers/xen/swiotlb-xen.c*L366__;Iw!!GF_29dbcQIUBP=
A!i7I0DxCbP4ibLDwzRkeFkgRQbKh-fVD9McLqabG1TzZs9smOVBeowPS_IgZgXPjC$ [elixir=
[.]bootlin[.]com]&gt;<br>
&gt; which is greater than 32bit and xen-swiotlb tries to use bounce buffer=
 <br>
&gt; as expected.<br>
&gt; It can lead to decrease a performance because I have a long buffer ~4M=
B.<br>
&gt; <br>
&gt; I thought, that we can disable swiotlb fops for devices which are <br>
&gt; controlled by IOMMU.<br>
<br>
Yes you can disable swiotlb for devices which are controlled by the <br>
IOMMU. But this will not make your problem disappear, it simply hides <br>
until it bites you in a more subttle way.<br>
<br>
&nbsp;From what you wrote, you have a 32-bit DMA capable. So you always nee=
d <br>
to have an address below 4GB. For foreign mapping, there is no guarantee <b=
r>
the Guest Physical Address will actually be below 4GB.<br>
<br>
Today, the ballooning code only ask Linux to steal *a* RAM page for <br>
mapping the foreign page. This may or may not be below 4GB depending on <br=
>
how you assigned the RAM to dom0 (IIRC you had some RAM above 4GB).<br>
<br>
But that's the current behavior. One of your work colleague is looking <br>
at avoid to steal RAM page to avoid exhausting the memory. So foreign <br>
mapping may end up to be a lot higher in memory.<br>
<br>
IOW, you will need to be able to bounce the DMA buffer for your device. <br=
>
If you want to avoid bouncing, the proper way would be to rework the <br>
ballonning code so pages are allocated below 4GB.<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM7PR03MB6593E7F0C691F98E07B8141C85D59AM7PR03MB6593eurp_--

