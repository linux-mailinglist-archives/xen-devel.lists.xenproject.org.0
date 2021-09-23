Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8372C416702
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 22:58:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194586.346668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTVn1-00060t-IV; Thu, 23 Sep 2021 20:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194586.346668; Thu, 23 Sep 2021 20:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTVn1-0005z6-FD; Thu, 23 Sep 2021 20:57:55 +0000
Received: by outflank-mailman (input) for mailman id 194586;
 Thu, 23 Sep 2021 20:57:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ODo4=ON=epam.com=prvs=99007947d0=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1mTVmz-0005z0-V3
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 20:57:54 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eaf1b7e2-1cb0-11ec-ba8c-12813bfff9fa;
 Thu, 23 Sep 2021 20:57:52 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18NJ3W4P006666; 
 Thu, 23 Sep 2021 20:57:48 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51])
 by mx0b-0039f301.pphosted.com with ESMTP id 3b8tbnsj6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 20:57:47 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com (2603:10a6:102:201::14)
 by PAXPR03MB7700.eurprd03.prod.outlook.com (2603:10a6:102:206::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 20:57:46 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::24db:d530:e190:518b]) by PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::24db:d530:e190:518b%5]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 20:57:46 +0000
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
X-Inumbo-ID: eaf1b7e2-1cb0-11ec-ba8c-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXCymN6coiIwm/KNaWGODnzmA/OjGooOMRbOKRU2uzLnavdeBsPIvhsf+c8d7Lr6h9N2tAhRPGAmR8TvV8UCAC7vag4vPcBcyNWSEnv57pz3XfiN1ee7vdIEP64MltFYeXaObAxfSVaGXAyX51urXxB+tcU1O9Qpul7QsLvlpSI4zQ7UoM4YBx9FZhuU/e+Ydfx9nSaLvYEg1LcaQgNep3UaXUWbviVmJ7OpJraKCLgt13LZSIYvYydCuWWYiYZpSK1iPryeXJhRXWHfvJwfZHoIphUnoIGYnQHqSY+/hYg0zrmhwMkOsVEGQ2MasGx02wltdnsY8DlnBFio45WBhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=33YY/lzY/yKZw2ugpJeA/6jj2dtPeDssOR+MbSG/TjU=;
 b=S0LhuYmqkuxEA1GpwI2uykHWAuIMFAE7coutXM3DMcdtVz7ra8hzxWXZ4odqVKOzCYE65zJY31v5USPKcTmYm7Ri5PTULbjMYvZbRHWi401GdpXr833Tcwpbph+wokbxQ5GtB5bGGwaH/UlDjSaSnq6e1PXaTJMrAp6k/UNWpD6sQUSkq+cULbjg2rljnDTu0W2yoWaNSHq6/KI4PD++VVUgIEKrpnitfK2LPhQXq7almm9FTH5U+xnJK+JtvJQYj58qwpzPg0YLr8VTMsSK1szk5P24NUslTW77A2Ggqi3jb65vAahQkdiEJcEeh+AVsUqNcMVo5TJG8ddwA3hYTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33YY/lzY/yKZw2ugpJeA/6jj2dtPeDssOR+MbSG/TjU=;
 b=3PqFSxevHSLvgesYLrUra+/5k+VPaVVPLA+X+jGC/Wu4SnpL5Ds9mXzUM5Y4lybILgiay8C0V5NDovrDcoO/shvizxPAEPCXxK+g1bcphSxu0k9kGa5o0bM1BLyY5DD+QMEmLRlm0Nlms4jEx0vI5ecl4gpdjNqSlMZSUSwzwAhlP6sP5NG8YgKjWEfl4VcB2hXflV+TbtcHxuT+koHCnQZrwCPdfVjSMkrN3YLmgBp7onU/h1Ii1Cr/Hqsy4gHsQBZy7Cuv6k747//f+LVi1V/sXTJqTY2WJ+8fkp3CVM0u2lL5o5neL75DZ2IXuN5gALerkI2jkCoDkWe2PhT/+A==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksandr Tyshchenko <olekstysh@gmail.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Julien Grall <julien@xen.org>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH] xen/arm: optee: Allocate anonymous domheap pages
Thread-Topic: [PATCH] xen/arm: optee: Allocate anonymous domheap pages
Thread-Index: AQHXoyUNSkY32SPluU6N5DMbFmm656uyJ0MAgAAJFoA=
Date: Thu, 23 Sep 2021 20:57:45 +0000
Message-ID: <87bl4jrovq.fsf@epam.com>
References: <1630935741-17088-1-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2109231308200.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109231308200.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 27.2
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa924a4c-bb33-4751-8487-08d97ed4cb6e
x-ms-traffictypediagnostic: PAXPR03MB7700:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <PAXPR03MB77001B3D3646241774583DECE6A39@PAXPR03MB7700.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DJGYX3Q/kpgUqRN7/8AFVdrtHbGNq6BnItyo5NNwtsmsRuYdnSeYCQugSTCfkjJ8dNw1m9pWQeptlCfvCNM0tXCXDg/7GRYBVShph8lbWT77vrtPB7ShfGN80vlYFSFWj6ZVNET5pLNXJ1caav3keELDcNtJNuladw+GHEJpkCispOSMHmmT8Htcg6fs6oIipmihYJscoc3n4TKKv6FjKkLLejOq8E6WFzG4YUeq9d9WySbH1bkh/7AQ1hUKNxHcB1OIl2hjy0PWozVVEN7nPHUNvOULb+9LDNcbIV/FN+39T/9LnhmY3A9ZpoyQpIPgnbkqDmtMO0bUQT4xIQHncvDPmvi/yld+6aK+It8khHXJqFfAAvOazzf+4BMFwT06IBaxP4yQOg45B7t0s28VvNGt/GNLRftdZ+1ZRdNdupHFv18ATCenYLLIbNf2kTjR4J0sILWLH/AXg8uF3x+I95+ET6pimQX4Izem6nrALbmzBZ5V/pSATE3GnaxVqZBy9WjwFrQzbqZYcPe2SDNgldarRw5L4At6t9qaunJPJNu1Naid0FePElsbwc0/pRqJDWnRUtKP6NBpfNV9U/B354IFrqfszeZSgBZTuzsKVdNA96gau1iVRLLM7LdBlGieutlEz5eypGjN/MvoAQxGF4ZcFOlfKjRmxOa6SsfiS9atrlVR3HKf/qIm9K2zf6hVz7FK27e+PZ11K6OhdDIkdw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(6916009)(508600001)(64756008)(4326008)(83380400001)(6506007)(91956017)(122000001)(38100700002)(8936002)(38070700005)(76116006)(2616005)(6486002)(8676002)(5660300002)(71200400001)(55236004)(66556008)(66476007)(66946007)(6512007)(66446008)(54906003)(186003)(86362001)(26005)(36756003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?QVaiunLvcgeKju6E0TXHrF0eUsMoCO7X6Cht+4hHjxRo5cDnFdEJgdABxQ?=
 =?iso-8859-1?Q?0lHTIfYbaRvqEB31E6Vk2xcozRFZl5vVQZnc3MCeOpZISOSGdn1mq2SPZf?=
 =?iso-8859-1?Q?Sd+2I2zrwJj1wrqLPZ77USRm3QnxDQoH/fAK5VDHWyyTRfctB6Zy+6eepz?=
 =?iso-8859-1?Q?BLjICww4QZHaYk4zg/TbY7BYXCc/7k6BVVseNLgMtSfxpZTKXMTrLUT6uj?=
 =?iso-8859-1?Q?1nNgTsNyO+SD9fVaz0OkxQ2FTEtAQvrfi9aZ5cbPDmZL6ZoeQp/TDjkb6I?=
 =?iso-8859-1?Q?AvbD6hfVyDmpns1c2AkdULL4im1X1bW4tRCajYAzb4OOmJLFkWWUcbKVv6?=
 =?iso-8859-1?Q?+U/zPLz/S5ODcfn/blfsfOdFK/bXqh2Q4oxC2IHw6ETd4UszERD1D9e8KL?=
 =?iso-8859-1?Q?dTWBWwNNHPaywjZD/mlQyoCFNjWJK0Q4IrCjtlsjavWn2Ebc5wmclq5S8N?=
 =?iso-8859-1?Q?K1gHQUJ8hdQJJAEVjPBiiaHmRrY38Kqh3Vl3I4a0BLBSmW27HGcc/wiaC6?=
 =?iso-8859-1?Q?tqvH8+ihxHspr8OYcCZ+spQtakw15qEYTc5b6NAjSI+Tveoc1TYu22uX/i?=
 =?iso-8859-1?Q?OEmzW2Vd2/juJaFMSUATMAz/ftWoBUbhIWrmBKbJbfinL35rTm4slGxzjF?=
 =?iso-8859-1?Q?aU3nZ33P4imujJVB2rugfhIqltKelNSQsmBgSQJUq1vJhoqt5On/IGuS62?=
 =?iso-8859-1?Q?FrXeMWVzIejOJOKbPbeTxdb3tHr1k62imgkWVC8JByoU5gwnpJPLFwwg0n?=
 =?iso-8859-1?Q?k1qpbHloPrknDMl+Jd43svkwra61KW1pdZcXbTWvXLuczwplh3AkuUNVWK?=
 =?iso-8859-1?Q?MRL1zMqnTftxBmBjuc5AAfOOaCGPEQdbQcnA7mzUJ+7fD8s8N2vVF6Cwto?=
 =?iso-8859-1?Q?qxcsYfae+3R/58VDTfa8HREhRh8j5tknann9LJhka0G760ejP0+ades0Fb?=
 =?iso-8859-1?Q?3yA9Od3ivuVmZ+py2DFS0v3rFR6Gr+cM8J/v5GaWaVFwhPejpKpKoO5EZu?=
 =?iso-8859-1?Q?NPBKyIauc1v9VYizSBFpCtJ9oIYnuyyeXfuOB4UUpPqqAz5a5Hvnfx2Qzh?=
 =?iso-8859-1?Q?fFCt7wZo28IeIoBgR1o6ZADDiGrHJJ/rwVcsdWuVzA4dftXyUHoWjsRfWJ?=
 =?iso-8859-1?Q?8FjANnKBKDn1uT0pxm6/O90QTITlPSrBUWJJmFC0PvuhwPgrr9ejNtkySh?=
 =?iso-8859-1?Q?wpGaojl0cnzvpk/ZNKj5YXu74QkWyybvXagtjnaylFIneGAOAW5HEoBI94?=
 =?iso-8859-1?Q?ByI6NEnZk6683yCoMVwtOqOSggDqrg32QTLqWCKXWHyOksrGtU//Cc2YNP?=
 =?iso-8859-1?Q?Hrilho9orcgEX8vAcW+YWcvbPNKSbb4vtJD4njHJbFIuYV5v7stbJkTOn8?=
 =?iso-8859-1?Q?EIG9nWcPj7?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa924a4c-bb33-4751-8487-08d97ed4cb6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2021 20:57:45.9665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3zMsnTJ+6+cQvI9a3Vai/cmghYST7+PQBKIK6VQqnafKZN6hHGnaFUb2I3FWEdmgj5AWmvi8Iy/W72EQqFVaXntkgNU4LGEphnfjHV2RMq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7700
X-Proofpoint-GUID: 7fb6tsuwvivTm5ggAeiswI-hPLjbrlFn
X-Proofpoint-ORIG-GUID: 7fb6tsuwvivTm5ggAeiswI-hPLjbrlFn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_06,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1011 mlxscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109200000
 definitions=main-2109230120


Hi Stefano,

Stefano Stabellini <sstabellini@kernel.org> writes:

> On Mon, 6 Sep 2021, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>=20
>> Allocate anonymous domheap pages as there is no strict need to
>> account them to a particular domain.
>>=20
>> Since XSA-383 "xen/arm: Restrict the amount of memory that dom0less
>> domU and dom0 can allocate" the dom0 cannot allocate memory outside
>> of the pre-allocated region. This means if we try to allocate
>> non-anonymous page to be accounted to dom0 we will get an
>> over-allocation issue when assigning that page to the domain.
>> The anonymous page, in turn, is not assigned to any domain.
>>=20
>> CC: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Acked-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>
> Only one question, which is more architectural: given that these pages
> are "unlimited", could the guest exploit the interface somehow to force
> Xen to allocate an very high number of anonymous pages?
>
> E.g. could a domain call OPTEE_SMC_RPC_FUNC_ALLOC in a loop to force Xen
> to exaust all memory pages?

Generally, OP-TEE mediator tracks all resources allocated and imposes
limits on them.

OPTEE_SMC_RPC_FUNC_ALLOC case is a bit different, because it is issued
not by domain, but by OP-TEE itself. As OP-TEE is more trusted piece of
system we allow it to request as many buffers as it wants. Also, we know
that OP-TEE asks only for one such buffer per every standard call. And
number of simultaneous calls is limited by number of OP-TEE threads,
which is quite low: typically only two.

--=20
Volodymyr Babchuk at EPAM=

