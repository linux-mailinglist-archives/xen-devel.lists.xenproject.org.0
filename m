Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF92145330A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 14:42:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226277.390963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmyiU-0001We-OZ; Tue, 16 Nov 2021 13:41:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226277.390963; Tue, 16 Nov 2021 13:41:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmyiU-0001UD-K7; Tue, 16 Nov 2021 13:41:42 +0000
Received: by outflank-mailman (input) for mailman id 226277;
 Tue, 16 Nov 2021 13:41:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0oQI=QD=epam.com=prvs=1954156bad=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mmyiS-0001U7-Rh
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 13:41:40 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb633fbd-46e2-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 14:41:38 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AGDD24Y030799;
 Tue, 16 Nov 2021 13:41:34 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ccd2788f0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 13:41:34 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4579.eurprd03.prod.outlook.com (2603:10a6:208:c5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Tue, 16 Nov
 2021 13:41:30 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 13:41:30 +0000
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
X-Inumbo-ID: eb633fbd-46e2-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJ5mOTlnzYYi7HhVK9972iTJYRe20EfwP13o9qZWH8TDm2uErYt4sXQMAQSAiQFXTlSiF1atuNWJB9SdJboWIgFv5enIXym3XRKFs12D4j+sjdhr8YI8H9UB/ktCi0l/xviu7lCENQTUSEfciAeTq8X8wFreWJs4gNX1lUTNsZ0PwHnesGLU3HH75X3/mIkob6ltNWHJxqymJrrCUKh9FXmiB0EnBY4p/zBX6a9MPdkSZP7lkBr85Ig1ycbB615IokJYqLhKGXGrlM5hmwhWZOn9xIHglcC92d30l8mPZUbuJaYH9tWsFN4Z5EswaSivi5o+OR6b0ZbumPyOYzXi8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TO7qUF6d0KnACzIH4mdxDQsOkzpgR0lYLPc5a6UECY=;
 b=NvuvTtOHHM8bK+B+nVzMtrU92pc+MkBf4zRNf9hFz0Hfz/Rkfip9QYQFdDtJ152mA+EBmocQyVGD5el3elXsOP3mdnlsOaOZyzhORKWuSye6Qe+NMS1ENmUmyYdw+ABD/ZqjyweJ2ksdh3/gp23DvpmLFKFAaLpSIgsNzAJZsn/voLWZK7S5del7sgiivVQcEGDieGwwkFbUmZ6DkPKNBaTFCLWY7ETDnjRgwXRhdr3uvDktTjAs4EoVHCEs2cHIyVl1o/5hCe+zFh+4eHFcBCtnM30/72VQg3gJE+DxKZU2HkgKggPRvuxt5mDL1ORmZl9q7rf5NlTh8CWIES0bgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TO7qUF6d0KnACzIH4mdxDQsOkzpgR0lYLPc5a6UECY=;
 b=pQylPmVa4YpZIX9waHD+f6zqyovEOfkEo7xoadl/uHpHiZ/EI5ZIwSYlIJ+GhEwwTW26D6nZBfWWMCLxafUpwFozaAqLFMUuvC32vK+eSaVRgtJyPxHm1pwN5d3AKyx41YxUINZxgEavRq6dTxA7X8WPCQf3Idl8QWzCMfDzBCqMoCk+IpWFf5vo45nszqu5vJi+2mvtbJ1JpdpHhiesA3mXy7rPe7orW1Ma5ZQspn1BDwRpAb5+Np/QyF0wTMskaq8UDUfaIYBDjkG/VjjIqQj1+SstswSQx5m9AxLYz+paUnSiJS8do94WdRaxdoY/YL3S5ap5ixMf8ZJSRJpTGw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>
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
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Topic: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Index: AQHX0hJIYALl/D9fL0OD6N0XGDJh2awE30EAgAD09oCAAAgGAIAABgyAgABY44A=
Date: Tue, 16 Nov 2021 13:41:29 +0000
Message-ID: <ad01ebdc-7fb8-3c76-d953-08b73b4b0c25@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <5bd70935-4968-b8d4-4d6c-7ec0fc54ee6a@suse.com>
 <4e12f7de-19cb-bc79-4df0-6fb52538a944@epam.com>
 <5b47cd28-5264-9f24-38a0-e9dec6c2c1b4@suse.com>
 <b87a51d2-cd96-d0ac-8718-7f2b2feed531@epam.com>
In-Reply-To: <b87a51d2-cd96-d0ac-8718-7f2b2feed531@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 637351ba-ec92-44ee-725d-08d9a906cbb9
x-ms-traffictypediagnostic: AM0PR03MB4579:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB457972F98AD4EFA3CC9DDC2AE7999@AM0PR03MB4579.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZXKDuHSWiKU5v8Myfc+Z2z70dU/2QQJNE1LJB0+qZjEfWQX4f20yKfkttpqrkH091be6UsujZGbqYgMlfy7kcjRDb6gbHjv2uOTGf8lof2KtIm82FXYuFm8nXeE1WK8Bpkyx5NlQBUirThZtn8Ns/fHlHX8XJAaKHw4SyZgfwDy+as4IB3j6aR/P5dJvHB8rVYBt50Vn1oa4WvqF3Z1FEgjdTaF7yHii4S8VFP5CnfMv3mEepgatonQZInA9QjvC2o8YrvvsYDW1bd0VGpWxrqvJC2JxqVQrXjdskCeKTYnQVvjIfDEbFi0LT/dC2Kfzq0PNc8F79gwtAzl61l+ko1oE3sQtNcEhxh2rK0fkpCMaZ5hwtRywE88AD5HsxRuUws2+CaASjp17EDd03zaX+6b4S6L7abWukw/iFxW6XMwUZGrZXOzBV/tLgbP5759zXwSSo9PquVVRrpL7Qbfm5xCqlTcGxukTSnpnaLV4g79Mx96tC1IXN4LGi/rbgieBP4BC/AMrvDQkdn/rVQGa6pztrkbqTNL+ifZC1Ze0h4o11hZNYGNZ5qlgF+vwNlUU+JGGA/6oBUEko2LgFiKb3MOEN3s6c8msMiQPxcwCilgSAHX3F9m/KOHkQTxDVwYslkqy82+Vu4fatBvqxIfkFRUmr0/b8YlCPoy+zdvq2HrFOApWTN9o/O2iEGsHRy8NvlRGB5IJApTtY5JojgKsN53jew61tA2DRFUe3+RJg9t2pldjV9kc7NXogwj5/mci
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(54906003)(8676002)(316002)(86362001)(110136005)(6512007)(186003)(76116006)(31696002)(91956017)(31686004)(7416002)(122000001)(2616005)(508600001)(5660300002)(6506007)(83380400001)(38100700002)(107886003)(53546011)(71200400001)(8936002)(66476007)(2906002)(64756008)(66556008)(38070700005)(26005)(66446008)(4326008)(6486002)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YWpKdXVwd2U2d0grVG9tQm94YzhRd1YvRklKRm1lV1N4WnRJaEVRQ2VFdkY5?=
 =?utf-8?B?bFg1NjNqNHY2N0tDcHFEaGo1Qkg4b2hUenJXTmxmL1dhNlhGRHVibXh5RjRv?=
 =?utf-8?B?TXZjSkNKcVNWdUJaT0xjbEhIZ2dzTEpDVmtOVmpBREU4aHpublJoNGtaU05w?=
 =?utf-8?B?eTNBM2V3SnZnaVVFeS9CaWpMRVFuZ1ZqUGZQdGdhZldVa2JUbURHQ1RscEtT?=
 =?utf-8?B?aTkxN2c5ZkNFVWdrUnlYc2ZFa090Lzd4eDFIVFF2QnBKV2M4Y0I2L2gvZmNv?=
 =?utf-8?B?QUI0dmw2L0dveGN3djgvSEZVZlZrUThHVGtWRFM5UFdMb0twbmVad0syU0Fa?=
 =?utf-8?B?cUxjK3FrTk5OQ25uN1BHSXpQSGFWRzh1emwvckRiSVlKUVJoSlpxZU9ZOVp3?=
 =?utf-8?B?Q1NVS3dsOFVTTFMrODF4VG9wY0wvZU1VdlQvWFdVcWNZeGJJV0l5QkZ6SXhr?=
 =?utf-8?B?UTBvdkZybXp0QlY1MlNQYVltM1J6RTJQTThBLzBqTnB5clIzbHIyUThkYmZL?=
 =?utf-8?B?RkYyaEM3UjFVZlhoeW9ZMURtRXZxWXZ6SnpQUk5GRFRhVjErRDFRVWZoOVlB?=
 =?utf-8?B?cDlnQWwyeWRZdFYrMTB1NmdXblZQdW5uVVA4Y25sSFdzUkdWL0JKKzRKakhm?=
 =?utf-8?B?UlBNNmZBY0pnLzZ6K2ZTR1NVZHRRRU1vbVJGekdMYmhSQUJuSnZRbkw1WmJL?=
 =?utf-8?B?UGIrSXBIZ2w1cmY4RHEwWTZYUzJHcTMwdG5lb0p2MTFQbWJxUllCRzFFelky?=
 =?utf-8?B?WjJsMGJQendlWmdLeVlScVpRcThNelpNR3kzN2dnZ1NEUjNLVERZZ1RFRG9Q?=
 =?utf-8?B?ZnFabUtMbFpIVjV6V3R3QWdsQ1RaaC9oUzFmYjJrcWdsLy95VGhEeitLT3A0?=
 =?utf-8?B?b2lmcytSZmo2cXFteTU4NUp1WFk2TmN1aDlLejhROGRyYmZBWDIwcjhTUmRm?=
 =?utf-8?B?S01lZ213WjJDaFVTNlZjeTdjbkJJVWpvQmhxN1BaN0czdUhJMmJ0UlNhYi91?=
 =?utf-8?B?cTRHZWR5T3JtdU55ZS9pVzUxRGszMUlCMmhYcE8ySjk5YVp4bVArZ1d4dU5Z?=
 =?utf-8?B?azJnNGU1bFoxMnN5eEt6WEFuUVNJRHFJcVkvVDUvNXlyMURuTnB6ZnF0Vklz?=
 =?utf-8?B?NEEveW1ZMkgxWndzYktpWDFQZXRVWXdMTzBSRmJmN2RvdnFnT3NxZ2ZGRVds?=
 =?utf-8?B?VTlnUHlML0pEc3p6TEFUZGVHdFdQUWozdUlEVlRvNFd6eTRnNGlaZVQycEV4?=
 =?utf-8?B?UEZIRHVsK01LckJJQkJYeStOZHFNVHZPS2NOVnE5S3NnQUZqeEIwVGJpaEMz?=
 =?utf-8?B?aGlrY2wvSTMrN005Kzk3RXlKQlcxTmE3ZU5vMFJiM09UYVBKM2RpUUhCbzRk?=
 =?utf-8?B?bjRuSEZ4NHhmNWh3RElOeFllamhmU3oxcEtxK0s1eHE1VHBwZFVlSnVEYkll?=
 =?utf-8?B?QkV6enZ2N3c0WjVmRy9mU1hwTTEvRGZWakh0Z3BsSTAvVGErbE9tNnQrY080?=
 =?utf-8?B?NHJlK0lTZXBoK2ZUOTZ5YlMweFk1NkFqaGdkOE5wdnAzWmxQcDFDNFppOEp4?=
 =?utf-8?B?LzFaRmJNQmRZU2VXdEdOSjliNElxc0FoSkhrRVpGa2pmK3ZldUdmYzBXakVx?=
 =?utf-8?B?anBFZWJOWHBmRk9WcGlRMEFsZHBhQmNJWGZ3blZTOUU0VmhESm9sOVFZbEVz?=
 =?utf-8?B?MTRqcHJJNDhFYkczUzBSemlBazRkQWJ2Y3NnRmZidEgwai9xTkcrajMyVDhj?=
 =?utf-8?B?SjhEZlFSZkNyOFRiKyswLzFGQnhydTJNTVgxS3FLNFBPNXdhN21DUXN5MEF3?=
 =?utf-8?B?TWkwN3hiMy9lMFJsazV5RkFsemtrOEh3RWgrU2RuTkk0a0J1TW9vNjU0SXBU?=
 =?utf-8?B?aWw4TE9sUmU1akRJTkpzeDVMMzIyd3NVYThBazdYVmVBcUwxZTVlYkFKTFpk?=
 =?utf-8?B?Rm5VWnZndkkyNloyN0dmODhmcGlOTCttOGprdEUzRVFqZWl4Z2VVejJXVS9O?=
 =?utf-8?B?RUx0aVh2YTErTnNQRnE0c3FoVkdVWFdGZDgxdEF3UUlRVWFXVmdtbnBOeWpo?=
 =?utf-8?B?Zm4vU1VzR2g0ZGpjVnl0SDIvaWxBRUdSL0oxbytwWHZwd2xZcExpZjRZNFQ0?=
 =?utf-8?B?UC8xenZobmhWOWhPWHV3QmtYOW4zcStRbUhFVkZRK3haUWZKcHVLR1VJVkIr?=
 =?utf-8?B?MUtyeUxJcFhOZCt1Z3hqQmFUUnVKTnVRU0Q5L3ZESU1CRjMzZDkzaWxrNStG?=
 =?utf-8?B?SGVlYklnWVlaTjl4QTNTN2JpbXF0c0FCdWVlU3Q3TW5jTVdDQTBuenZGajNS?=
 =?utf-8?B?R0NQbWFDbFhWNHpiNnlXY2tCbFBZMjhkbTV1WllmRmpRc1FGaXphQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFBF94DED2D955469B09C8ABA6C94408@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 637351ba-ec92-44ee-725d-08d9a906cbb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 13:41:30.0789
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BDGij+YEnaBTG+Axzim52+DwBIvkZRjmGguEOCBskLzGRvjGPcOjItcUqw4burL9V7KApSr2xIMpAYFBCOZgf8iNbn94SJsOtJTzP641Gp18k7hnb/5r98jkmc+LEQR0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4579
X-Proofpoint-ORIG-GUID: 4zO_9wO0GCQtuHuWv2DAtg9Y9A--9VxC
X-Proofpoint-GUID: 4zO_9wO0GCQtuHuWv2DAtg9Y9A--9VxC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-16_02,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=642 spamscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 mlxscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111160069

DQoNCk9uIDE2LjExLjIxIDEwOjIzLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4N
Cj4gT24gMTYuMTEuMjEgMTA6MDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMTYuMTEuMjAy
MSAwODozMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4gT24gMTUuMTEuMjEg
MTg6NTYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAwNS4xMS4yMDIxIDA3OjU2LCBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4+DQo+Pj4+PiBX
aGVuIGEgdlBDSSBpcyByZW1vdmVkIGZvciBhIFBDSSBkZXZpY2UgaXQgaXMgcG9zc2libGUgdGhh
dCB3ZSBoYXZlDQo+Pj4+PiBzY2hlZHVsZWQgYSBkZWxheWVkIHdvcmsgZm9yIG1hcC91bm1hcCBv
cGVyYXRpb25zIGZvciB0aGF0IGRldmljZS4NCj4+Pj4+IEZvciBleGFtcGxlLCB0aGUgZm9sbG93
aW5nIHNjZW5hcmlvIGNhbiBpbGx1c3RyYXRlIHRoZSBwcm9ibGVtOg0KPj4+Pj4NCj4+Pj4+IHBj
aV9waHlzZGV2X29wDQo+Pj4+PiAgICAgICBwY2lfYWRkX2RldmljZQ0KPj4+Pj4gICAgICAgICAg
IGluaXRfYmFycyAtPiBtb2RpZnlfYmFycyAtPiBkZWZlcl9tYXAgLT4gcmFpc2Vfc29mdGlycShT
Q0hFRFVMRV9TT0ZUSVJRKQ0KPj4+Pj4gICAgICAgaW9tbXVfYWRkX2RldmljZSA8LSBGQUlMUw0K
Pj4+Pj4gICAgICAgdnBjaV9yZW1vdmVfZGV2aWNlIC0+IHhmcmVlKHBkZXYtPnZwY2kpDQo+Pj4+
Pg0KPj4+Pj4gbGVhdmVfaHlwZXJ2aXNvcl90b19ndWVzdA0KPj4+Pj4gICAgICAgdnBjaV9wcm9j
ZXNzX3BlbmRpbmc6IHYtPnZwY2kubWVtICE9IE5VTEw7IHYtPnZwY2kucGRldi0+dnBjaSA9PSBO
VUxMDQo+Pj4+Pg0KPj4+Pj4gRm9yIHRoZSBoYXJkd2FyZSBkb21haW4gd2UgY29udGludWUgZXhl
Y3V0aW9uIGFzIHRoZSB3b3JzZSB0aGF0DQo+Pj4+PiBjb3VsZCBoYXBwZW4gaXMgdGhhdCBNTUlP
IG1hcHBpbmdzIGFyZSBsZWZ0IGluIHBsYWNlIHdoZW4gdGhlDQo+Pj4+PiBkZXZpY2UgaGFzIGJl
ZW4gZGVhc3NpZ25lZA0KPj4+PiBJcyBjb250aW51aW5nIHNhZmUgaW4gdGhpcyBjYXNlPyBJLmUu
IGlzbid0IHRoZXJlIHRoZSByaXNrIG9mIGEgTlVMTA0KPj4+PiBkZXJlZj8NCj4+PiBJIHRoaW5r
IGl0IGlzIHNhZmUgdG8gY29udGludWUNCj4+IEFuZCB3aHkgZG8geW91IHRoaW5rIHNvPyBJLmUu
IHdoeSBpcyB0aGVyZSBubyByYWNlIGZvciBEb20wIHdoZW4gdGhlcmUNCj4+IGlzIG9uZSBmb3Ig
RG9tVT8NCj4gV2VsbCwgdGhlbiB3ZSBuZWVkIHRvIHVzZSBhIGxvY2sgdG8gc3luY2hyb25pemUg
dGhlIHR3by4NCj4gSSBndWVzcyB0aGlzIG5lZWRzIHRvIGJlIHBjaSBkZXZzIGxvY2sgdW5mb3J0
dW5hdGVseQ0KVGhlIHBhcnRpZXMgaW52b2x2ZWQgaW4gZGVmZXJyZWQgd29yayBhbmQgaXRzIGNh
bmNlbGxhdGlvbjoNCg0KTU1JTyB0cmFwIC0+IHZwY2lfd3JpdGUgLT4gdnBjaV9jbWRfd3JpdGUg
LT4gbW9kaWZ5X2JhcnMgLT4gZGVmZXJfbWFwDQoNCkFybTogbGVhdmVfaHlwZXJ2aXNvcl90b19n
dWVzdCAtPiBjaGVja19mb3JfdmNwdV93b3JrIC0+IHZwY2lfcHJvY2Vzc19wZW5kaW5nDQoNCng4
NjogdHdvIHBsYWNlcyAtPiBodm1fZG9fcmVzdW1lIC0+IHZwY2lfcHJvY2Vzc19wZW5kaW5nDQoN
ClNvLCBib3RoIGRlZmVyX21hcCBhbmQgdnBjaV9wcm9jZXNzX3BlbmRpbmcgbmVlZCB0byBiZSBz
eW5jaHJvbml6ZWQgd2l0aA0KcGNpZGV2c197bG9ja3x1bmxvY2spLg0KQXMgYm90aCBmdW5jdGlv
bnMgZXhpc3RlZCBiZWZvcmUgdGhlIGNvZGUgSSBpbnRyb2R1Y2UgSSB3b3VsZCBwcmVmZXIgdGhp
cyB0byBiZQ0KYSBkZWRpY2F0ZWQgcGF0Y2ggZm9yIHY1IG9mIHRoZSBzZXJpZXMuDQoNClRoYW5r
IHlvdSwNCk9sZWtzYW5kcg==

