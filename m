Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D208D7F53B8
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 23:51:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639262.996375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5w3z-0008Vj-Tr; Wed, 22 Nov 2023 22:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639262.996375; Wed, 22 Nov 2023 22:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5w3z-0008Tl-R2; Wed, 22 Nov 2023 22:51:19 +0000
Received: by outflank-mailman (input) for mailman id 639262;
 Wed, 22 Nov 2023 22:51:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hBnL=HD=epam.com=prvs=56903895d3=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r5w3z-0008Tf-1t
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 22:51:19 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a455fe5c-8989-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 23:51:16 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AMMdC3N015332; Wed, 22 Nov 2023 22:51:04 GMT
Received: from eur03-dba-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2169.outbound.protection.outlook.com [104.47.51.169])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uhkw3152t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Nov 2023 22:51:03 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM7PR03MB6354.eurprd03.prod.outlook.com (2603:10a6:20b:1b0::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Wed, 22 Nov
 2023 22:50:59 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7025.020; Wed, 22 Nov 2023
 22:50:59 +0000
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
X-Inumbo-ID: a455fe5c-8989-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpCr3EcZzWgvT3Sy7H6nx7eSIVDMAHC0wFXIHNa3+MbpjiALJtFxh0MkMwt7GRgij2XwI9L4o8VNlwHnBfh+XrW52RXxg1fsq87UNem9fCJ4kTN2AUegLBB1SQkPN+Swn7fTGNWRjLJHapiT4dbmDnx/zG01j6C/RhiaeTnA5vu2SRJ2YyXOs7z7vlqbyOK3ZUbIWeCRvQ0zxo1hwHkNSuwg/POqReHKJyJa5lJhs8jo9hagbVOPx72PrFkbN4UgT5JVIXav1icbqS7cHTOM45DqTFb8kDGQfv7bRJLYNcAiMUC+iW4tIgDhuR0OSEoI7SLc3wHHVWVCLyMFdEq5NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fu6XQbDtjyOpbQ5xLRtKKFWfHV+6B+hlHG+VdzqjaKQ=;
 b=X1eO6yT6kdNCo4oo122VRA/E/a2CCEH4/1gWrPsdPjZ3Tm89zPfCQUMVXExb8WdvNDAdXBnCtiLRxpNauWRjjMU8iGrJjvTEP3mc3965CcON5iFJS6XcbuTAmi9eoWiGsycmSgUFvfkffdkL7ooglUiz46wq+WH+M0s+L3hfsSOoCpq8SSNfYZRkImKQ1RHLDZphwtYeJ1Lec5INt04cau2VIRqTVeMQXOKTto91QNhQ2FKwOEMVJmA6uqZkVr2bpeDWzK3KkJ6wlBz3xpFuA+0dASo3LrT5F+dMweXDSriDbE3xQo0kSde4HjFn4rVFjjkVtxUV8e2IltDOorSbfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fu6XQbDtjyOpbQ5xLRtKKFWfHV+6B+hlHG+VdzqjaKQ=;
 b=VA/7x3z1QDtawAxWp4FQ7L9CFwtprcI/A8pZ5qBzylV9UnNMrnmJAAhyV+py5MxW5QdU5KIy2x8XCW5fhgTbzscQjA7cv8dOXepQ6tsoJj7KAOoi/4mzE2BvR+oiLVGdrNOPXg/9bxhI/20NLmO+4vGlFLTyDLS+u9+8lxFtmcUnA79fyox1JM752pRz4iq0oL2GwUGnkkzdnIA9V1KcfkQx8uMvSueYy/73oDaEN94FlFJUkJ7g8GpEjRTdie/Yn1v4dC9FAqWVYAI3bkg2UbQMR0BV1gNo/ydQLYZWoRsk2pjMhOmzso/SA+8hAqWcacYrL0ptgGi3PM0S3RkNJg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "paul@xen.org" <paul@xen.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        David Woodhouse
	<dwmw@amazon.co.uk>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien
 Grall <julien@xen.org>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
        =?iso-8859-1?Q?Marc-Andr=E9_Lureau?=
	<marcandre.lureau@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>, Jason
 Wang <jasowang@redhat.com>,
        "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>,
        "open list:Block layer core"
	<qemu-block@nongnu.org>
Subject: Re: [PATCH v2 2/6] xen: backends: touch some XenStore nodes only if
 device...
Thread-Topic: [PATCH v2 2/6] xen: backends: touch some XenStore nodes only if
 device...
Thread-Index: AQHaHMeI7KczK4z02kGE/beB6udNwrCGkgaAgABg54A=
Date: Wed, 22 Nov 2023 22:50:59 +0000
Message-ID: <87fs0x1jxp.fsf@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-3-volodymyr_babchuk@epam.com>
 <02fcd3c2-afe2-43f4-8a15-7caa85a147f5@xen.org>
In-Reply-To: <02fcd3c2-afe2-43f4-8a15-7caa85a147f5@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6354:EE_
x-ms-office365-filtering-correlation-id: 4c74207c-3b30-465f-d588-08dbebad7edd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 L4nzxN0at5FdR5hMfsSzIyfqiQds8AB4LuwU2MXzqvEa9b7Wz+02i+JaVYmaEb2kMIrHuNnijSF2vzJfHL29UNCHgtEJUClAqroqiuH27a4xktvNnSzAqZk/ycP10t952LcYr4/Bs61fV1hi9kXMJHCZuSzmri2duM0rPV97gFTfzS70Lj2hIg5A3wvkOp2U8Nqhm/PeHbytMgxMzjtd0REiuIfcGBmfZHwaGomg6nrLzRY3HVd/O3UrJOWTWxYIfAgsb4k2VIBlsInzpcBXlqSNGSqReEq2ji+8AuWKVy2nFxbTE5Rzqp+dJPCr4OphUS3sHNKgnSRBASlBscVyxvUWvvgHpd6ywWEjjbDyioOQrWSSRARMb39yQk9cpRQJzNB1RwkmVbW0W40eX/6yIJkMtQG+CmN6L0+Rgfby6+tX94VLDEGB0CbidAVZI225+ZbgTVtlWeZp1CVYl8KGNfialdS8ZDvKMCVXzvxS0HVXf6kL3NsUNotoam++8y6PH1OBZKwsKrZUFRqucypYIFi0VmvO3egQgUr3mZNteA0ug2w/j2o28iSAa3b67xwxJaSi6lj3wjW9mmOd93GCfLx5f4N3h7f0uk12t6U6uyrjAPOEBHa0LnPXpx3m7Vih
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(39860400002)(346002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(7416002)(2906002)(71200400001)(86362001)(6506007)(478600001)(2616005)(26005)(55236004)(53546011)(6512007)(66556008)(66476007)(66446008)(64756008)(316002)(54906003)(6916009)(8676002)(4326008)(8936002)(36756003)(66946007)(6486002)(91956017)(76116006)(122000001)(38100700002)(83380400001)(5660300002)(38070700009)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?YknbYz9NTEt73koG4aY87fZYnT7NIa2ctA+cTW1Jvg/qVjWyH9jBNONwsB?=
 =?iso-8859-1?Q?NMFrWb+RJcfkmGO0JB8jIaEyzTRhOglj+hcwTZp7UJD3NePbaS3kJBwnZu?=
 =?iso-8859-1?Q?16vqvEBsAxX0JddrgAmCb0UVsI4TVsL8DWnYNPcWvOZSSQQNZzaLWLda0+?=
 =?iso-8859-1?Q?SQQwHtoQrqoZ7Jj+T1YjmkWpFGIjKrOL2973QOue9GsENkK83NCkk3b2XX?=
 =?iso-8859-1?Q?/E9zgHhTRWpKAqfswR5VpJkb7VxBE7iydCJD86RL81uOAY92V6vu47V+ao?=
 =?iso-8859-1?Q?TipBn+MSADEg0/nIVTba6YRa9XczeHdzoPmqJuNlludsZ8au1hlpycMVs2?=
 =?iso-8859-1?Q?EtPskGpYp/DdET7rGRhjlvacHHnIJItgNDqVu6unT8It6mU+CUE2qxb5j/?=
 =?iso-8859-1?Q?JTHSvt8L4mxrqM7s20qOkC7R4pFVLlC4YW1aKKkqLgRIokH2Z+RaOviY6e?=
 =?iso-8859-1?Q?zfVE5Z0b9cDPmKN/e9F0qd98EVdFjz7GBJ3B1Vv6kuSbxdsUnwlPW/296+?=
 =?iso-8859-1?Q?C4Ggki65n4H8rGDqaM2wmyDKT9DJd8ug+keJlRa7nDwBVb/UgXcZRV4oSw?=
 =?iso-8859-1?Q?gkaDlKVBy2q6xAsd/RyV9ZlDXj1iq/2Lr0Ft4rjNSsbEL82rfdtc0hlQtH?=
 =?iso-8859-1?Q?ae+mUjvQ4sJtCgmiL7vDySZRABYllNElm9Yyb23zOijCg5dV4jfGVqZPou?=
 =?iso-8859-1?Q?ROEUw0HrNn5PTOyba/pHysdKpAlsThrmDxH/QLP1KSaEv8n5LpdW5loNWJ?=
 =?iso-8859-1?Q?PKKkUjSNscHkmorrhHJc8td4EVEUs1klYPO4vYLzmjkPVNPmJiz6mYI5K2?=
 =?iso-8859-1?Q?WxT27cdrciljwNcxpoZL3oGhIo9PDl4DW/b8Rm4Iv7pjkvLHpcY6eSyMvO?=
 =?iso-8859-1?Q?zTlq8VLJJhyaZ+lP2C/bcKKopFPCbzbUdTvSZk5C9XxPsyOqU13ge+McFH?=
 =?iso-8859-1?Q?pam1Vb5RvZQ8kBk8d85jRFMB+s/TbiXlPhsAWJ4D6/QkY9/1YoVfz4Enu9?=
 =?iso-8859-1?Q?IXtQSC4XQ9aosSFBgVxnmW3xZMEZvopUMyjrYHJAIoVdZdSHVp5+zEQr2/?=
 =?iso-8859-1?Q?Q5dIBSLdQdjD/RIimEX7Iz0hQtErRA43Vc3r3oqRZxDV/w/m2poRrIJpvN?=
 =?iso-8859-1?Q?YHbsdLYXJEoNRqrnfsJih2KyvL3OpQ5iIRJKMb9KhxHEfAn/U6dZmU63Ex?=
 =?iso-8859-1?Q?6Gt3ixLtxF9nSbxOZaVK1/mYRkBwjpRBSEAc5Qtaq3KAkiV7vunukigHhP?=
 =?iso-8859-1?Q?DMRuQ4nen6nT+wO+z4WpurH6G6yBEYhUU/IBBiLxpG3fKUOn9veS0atb3r?=
 =?iso-8859-1?Q?dder1d3WgIzTBw2v6XYDyUmpW7dUs3W1dg7VW8objE+XdBU2/KYz5/Ig88?=
 =?iso-8859-1?Q?oD5r8rCMyfdSKCBdZeFW4/IOUT91GpUVK+cUt7pVi3pP22ZKmIpt+zW/z/?=
 =?iso-8859-1?Q?Qh/2LESqwtJPt3fXW4s3hOoQeYgLkz2hw4Cc/O3nqAww7294MJbSYO3S5E?=
 =?iso-8859-1?Q?mNifrCwAJlS0CoV45/JS/+9WM2R4eD9GVS3iXVi4MXgtlHqFamej/4Yesj?=
 =?iso-8859-1?Q?Jh+tjpF7JvpEEebLYhODYYrZ6SMqkq8eICERodf7p1GgmZzSGnPTnC2JqZ?=
 =?iso-8859-1?Q?/QbzoLdbZU1s4qAj5ACdVsmJa+Ybri3NCzUKpitl/jv7IqVxMnarEceA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c74207c-3b30-465f-d588-08dbebad7edd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 22:50:59.2907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eCLUVjJVrgAM0TD8IhxGNvnI/2SL/DOGVZezbgMNrbN96oTgVZ9lQfhPewhCchYgnHe+Z3ey70If0euvV5UInyOQeli1cmWLIEuyNm72YWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6354
X-Proofpoint-ORIG-GUID: Qjx8yhmtka4ON3rEmWgfzSzT2wYnNRwZ
X-Proofpoint-GUID: Qjx8yhmtka4ON3rEmWgfzSzT2wYnNRwZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_18,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=0 mlxlogscore=948 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220166


Hi Paul,

Paul Durrant <xadimgnik@gmail.com> writes:

> On 21/11/2023 22:10, Volodymyr Babchuk wrote:
>> was created by QEMU
>> Xen PV devices in QEMU can be created in two ways: either by QEMU
>> itself, if they were passed via command line, or by Xen toolstack. In
>> the latter case, QEMU scans XenStore entries and configures devices
>> accordingly.
>> In the second case we don't want QEMU to write/delete front-end
>> entries for two reasons: it might have no access to those entries if
>> it is running in un-privileged domain and it is just incorrect to
>> overwrite entries already provided by Xen toolstack, because toolstack
>> manages those nodes. For example, it might read backend- or frontend-
>> state to be sure that they are both disconnected and it is safe to
>> destroy a domain.
>> This patch checks presence of xendev->backend to check if Xen PV
>> device is acting as a backend (i.e. it was configured by Xen
>
> Technally *all* XenDevice objects are backends.
>

Yes, you are right of course. I'll rephrase this paragraph in the next
version.

--=20
WBR, Volodymyr=

