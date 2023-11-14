Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 473387EB8AD
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 22:33:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633275.987944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r311P-0004Tv-Ep; Tue, 14 Nov 2023 21:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633275.987944; Tue, 14 Nov 2023 21:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r311P-0004SG-Bo; Tue, 14 Nov 2023 21:32:35 +0000
Received: by outflank-mailman (input) for mailman id 633275;
 Tue, 14 Nov 2023 21:32:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UjGx=G3=epam.com=prvs=5682536aec=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r311O-0004SA-0k
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 21:32:34 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 508c6330-8335-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 22:32:31 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AEIYm9T029508; Tue, 14 Nov 2023 21:32:11 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uce9y0agm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Nov 2023 21:32:10 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DBBPR03MB7132.eurprd03.prod.outlook.com (2603:10a6:10:20f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 21:32:06 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%5]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 21:32:06 +0000
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
X-Inumbo-ID: 508c6330-8335-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjtoCwFGh1bhBklzxDhGdf3z+2X7rhNz4dq83SqPzPZ8iVE07t585o1vZeCnsTVV22xTcceCX9NFfQFIjoG82kcRBPAntJqxx5NglScE8+7RgKw8rDlb3rAo515z750CHeeOtOhKklK/nVp63s8d0NzTDSAGzk+JgnmHhNOq+zlqZWLg5KFFFX0FnAXIf4zJnrVUEjmvfF7MPkuqd+MIJdHXocGtGpN6BPJDz7vgc0sZTMF3SXwHwD6NXXIPTBj+3wyOO7d1NRNA2cQg/9bGNIufLmpDUyS6bCSfHupIsTGH0UuudmZq9TAreBpur+vqYBj0j5nh9CapR/mCHBOKDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GD6941rI2V2b4dRSU+gFi73+GBMXJo2zUuzFUfNaLaI=;
 b=KX3Clz5Ml8vNNfZ6280/du6EIlfttByBHVoKj9kuwbzlui2anQCE6eVu0JWlRG07Vpx0fjcs6gCEJCITW05L/nfAB3yX6MnqMJD+24GYH+uDushkX07HjR/BaPlnbXphYlGBOFlVySX/f2TWHdtLCAny+XzFVh3ngkpn9atOsdsoGVpcRgAyZI2buRto5N/8Kqnkc0yxybr/l3S+g6zfcUH0bB8ymOqFpFZOIXrnlLwhpaZpVcdtLZXu+WgvUJCA0NAKVe5AIVDcR5pz4GTySHmOaCbifIKhrwLo1gFqBchzV00FsTia4267smbPX+RA4PUkucq4FFlHeFc9Yd+xUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GD6941rI2V2b4dRSU+gFi73+GBMXJo2zUuzFUfNaLaI=;
 b=laUnvRVAiEW/V0mUD7r1SbG6XOplAQ6ggamVhr04HXpvt4X63KVTZ2O4JDNLPf1LrM8ezahsVRyT1Jn7wXSNqo38fLBhhI7MvbhloPrit3SLFiK0Rcfr8MMhU/nQ3t8pRHTGgu7PCSUcnAD+SDGjImwTv5SL3/dFnABUkdGrfmV1Nzg8ONKfuj9b82Zu0Sz5cGS0d9s3MAqCDZIWztdc9VbgvKI8ekDSCGpIsSjRDlGVsWGd8WhyTCtAM3Ku0s57evEid886YUw7WqVsu1PkoxnGt9xGJGY+m6RtxGN3BYBzBleN7dTl0kfTSNDodhz4xQim73vRzepd0E3JsZ1Fqg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: David Woodhouse <dwmw2@infradead.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
        "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>,
        Hanna Reitz <hreitz@redhat.com>,
        "open
 list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
        "open list:Block layer
 core" <qemu-block@nongnu.org>
Subject: Re: [PATCH v1 1/7] xen-block: Do not write frontend nodes
Thread-Topic: [PATCH v1 1/7] xen-block: Do not write frontend nodes
Thread-Index: 
 AQHaFBZngjGHt2Wnc0CJ36bDt34c6LB08xWAgAAu5gCAAG5XgIAAGewAgAAIwICABKNGAA==
Date: Tue, 14 Nov 2023 21:32:05 +0000
Message-ID: <87sf5858dn.fsf@epam.com>
References: <20231110204207.2927514-1-volodymyr_babchuk@epam.com>
 <20231110204207.2927514-2-volodymyr_babchuk@epam.com>
 <f2f7751a9ea5597e9f7a1417b761fe0802892aa8.camel@infradead.org>
 <db50c864-a429-49af-9762-8bc17d5b0336@citrix.com>
 <0F786C80-FB37-4AEB-8314-3DB4AC4600E5@infradead.org>
 <d4eb2378-d276-47eb-a8a2-b3551020f814@citrix.com>
 <81BF040F-EE19-4367-9C4F-94FF2623C75B@infradead.org>
In-Reply-To: <81BF040F-EE19-4367-9C4F-94FF2623C75B@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DBBPR03MB7132:EE_
x-ms-office365-filtering-correlation-id: b6951589-d730-4fca-41fc-08dbe559261e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5SlfDFR/2VnrpC5Id6T8jTIs5S+Ng81OHTUIZzvbBWodKJ62M1mcCcb+tdFiwDk71WGQfINMT7uumpdRQRfxx+vKjzJuTUVQIOcf19Orhqh2gHenox8ljVqD/HBL3t7d6fMxMzTrzgTr51vCxfatu07n0DE4v/fFsdkeOb95sghwYYZesFLFZ3akehpMLA/K67hTk1THRHL8/G2Wa41ic4LNyyM/ZGqRcj4vBe+RAYkY8e5nSDxq7BFr4RU80qEnKBevzsVv3RIxGspPqptBk2YaIovZ79wBJudsh15Vq2rMKzRmXX6S4prpgv8iMB8PAfPlvAOMl5J8cvTr+J21iUctpH8+gtrRdOeDYiFQEkH6oINaPdoMsMaOx0JkmzC/yNfaif8i6Jta4z6+d7qB259BKZjN3PDolw4OA2adSKASF3Ga8YLnhPdBkNqgYp1CDprpNdiIEC8LVPcSHWk0qEbcF4WFNZrjHVzZr7o4NYfT5kIHuunoW/EDGSDURNY8xuHDUEzlLWNl3V8s9pJQFz5/aRSuRz7wF8OMitbOWYd2h/UI0n5v+O8LTc569eqIoge/caIEN7wva2CKxFyfXr9mvEZ6JkTWSYXx4rdHtgaYNE6TFe9sZaZGca6G/aLv
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(39860400002)(346002)(376002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(71200400001)(26005)(6506007)(55236004)(2616005)(6512007)(8676002)(5660300002)(4326008)(41300700001)(7416002)(8936002)(478600001)(2906002)(6486002)(91956017)(6916009)(316002)(66556008)(76116006)(66446008)(54906003)(66946007)(122000001)(64756008)(66476007)(86362001)(36756003)(38100700002)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?an5vXvY+DoXAkdLuD6J7t0Yoe0vuOyvbU4pmNqze7G6WlrnBm4Tqs8Dc9H?=
 =?iso-8859-1?Q?CdnQq2GuBqpvrZFiAW1a/LOFZi+q5a9KvLjNywBh1e/ntOI4VbzOs+Sa7t?=
 =?iso-8859-1?Q?pzJtykcCvqddjicYkMSJnh1wkopMYSakJEkDrYvHhnVQB9vPy4Q3UE9rrm?=
 =?iso-8859-1?Q?OyGFHl4rE/ytcklwaVKBezMgSofrTnTKqdjr1Trkrc8OGe3ixSAMoiyH6h?=
 =?iso-8859-1?Q?djp4BjiaB1eeBwG07hiIQ+4NNxKv14OOZ9eS2inpiPSPxCN6dmVHmvPdAr?=
 =?iso-8859-1?Q?ASR4CGTDhn/ImekKoFmXfdomaKpwgOMucgkczhM4UegKE85643IFEwBpqk?=
 =?iso-8859-1?Q?d+lBERK3togk8fKBPodJFEFf3SkyzG4KEikyhfJTC6TV7eTCWbfLYylJuR?=
 =?iso-8859-1?Q?x79wQ5JluE5oA6FkBJ/XRJPLEMkDD1lD/HNj/0tMAqSIpm/en4jPvtu0+g?=
 =?iso-8859-1?Q?1pKOHtpb9IO7A7OhCTR9ZP8uu0ZyED8daKBR3zlM6UP5zbjUja7yqfNFU1?=
 =?iso-8859-1?Q?LV7XLujL0cdihBRrSd+iLc5N7h88w5rWEnq4eaPeW87G22aZCWUhqPK/SP?=
 =?iso-8859-1?Q?m+FwMKtjrFxVm8Symb+I2m9JfMU66U3VLVeD6dyKin1DsdtkRNwt9kwJHl?=
 =?iso-8859-1?Q?LfmePaRYjzijG7UMzy5c5xgngMdpR6Abht6h0cqHOTnYJAn4BXvOlN1llg?=
 =?iso-8859-1?Q?ZQHW0OkSPDLLqrBI/GBG/SNg4F7EzI4z/d6q1tJzMIacSwm5a8AvjWE8Dx?=
 =?iso-8859-1?Q?w11R5G5/n0cYSOgRBR+TeX2PRPxAl4vZaRwUWAXVogQHE22Q7saic8kjOq?=
 =?iso-8859-1?Q?TLZczCMUQNG591dIBvC/F4xwOM2geW/8VZ+dqVLe6MU9KkZLD8FsXQ7Jgo?=
 =?iso-8859-1?Q?AAM5qbMFxkMvn9VDppQyOAMcWAogMxtQeksAh07oZomaKnrKzipB+YLPJW?=
 =?iso-8859-1?Q?HZm3LlOy+CCNqvoABbXxukWplPtLa/Czd6DmMRP+o2Pck9dFKltJfzCmi6?=
 =?iso-8859-1?Q?78sM6KJE+l1UT4IV5GD5I/uKglm8FMiL6oQ3Ejt9nOIJeOFtFLwexxDdDQ?=
 =?iso-8859-1?Q?O8CjJq2fcjB/bP5IoLphXCvP14LF44TVY8Bxk0fG72PxxlnebIwbYFKPEO?=
 =?iso-8859-1?Q?TqzbRGRRDgXcDhBzAybTysScnXpZAzKCjyIqPHtO2+2k0PVX7gE7OUZewv?=
 =?iso-8859-1?Q?gEQyWWrbl1rlWsDFyx+E44beS+x5C03Af+MDr8WbgxiXUTSzmtScKbmGfC?=
 =?iso-8859-1?Q?Ye0Z+lOn0SM2n7kR+obL+BKnOYkdsrEAAiRt3CrPcdw2WLwsVJ6vRUcXgN?=
 =?iso-8859-1?Q?KqmdZ89WZnc1avZPK8elwpGppRnySUPylHRlzEV+/XMfzGOD/4hMDRxiRw?=
 =?iso-8859-1?Q?Kg5UJ3MpHy74+q1vWctpeBFByacYfIuSlXaoXrK9BbnedIjNtTDb5ag8YC?=
 =?iso-8859-1?Q?21nwn39uO2dg3RIv413pxQ+qSToaZFotmPPwfVpzvhous5cAhF/Tgm/Xz1?=
 =?iso-8859-1?Q?sUhQ12ABYOsEHZuNBMVA/1WT8xejnqZvqTUsJ/RnfFStklzAJs5F6RrRvm?=
 =?iso-8859-1?Q?hm4PqtL22VoEaZh5pO3P1z3JPCyvZRgJFtYFoQGeS8tk8NZZAOMtqyiUe0?=
 =?iso-8859-1?Q?7hUIl1XxUvy4usyPx0A2iSjOIcYoUjBM2qivXluFb/Wy6a3w8NzC1gvg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6951589-d730-4fca-41fc-08dbe559261e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 21:32:05.6802
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zVnjFs1Cx29zcI2sOhPvk8r9rtF5Khwo30YOPhc5HMRPWU6MH9MOOB1EhFn5iANG7JCkbEzr2hob5arKRKzsTJxXotcxsAqMeFWcnrA2QL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7132
X-Proofpoint-GUID: 7TXFmSFJZ8g1Y4MIqHsTDLXTIuUb1Smj
X-Proofpoint-ORIG-GUID: 7TXFmSFJZ8g1Y4MIqHsTDLXTIuUb1Smj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_22,2023-11-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=877 malwarescore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311140157


Hi David,

David Woodhouse <dwmw2@infradead.org> writes:

> On 11 November 2023 16:51:22 GMT-05:00, Andrew Cooper <andrew.cooper3@cit=
rix.com> wrote:
>>On 11/11/2023 8:18 pm, David Woodhouse wrote:
>>> On 11 November 2023 08:43:40 GMT-05:00, Andrew Cooper <andrew.cooper3@c=
itrix.com> wrote:
>>>> Furthermore, the control domain doesn't always have the domid of 0.
>>>>
>>>> If qemu wants/needs to make changes like this, the control domain has =
to
>>>> arrange for qemu's domain to have appropriate permissions on the nodes=
.
>>> Right. And that's simple enough: if you are running QEMU in a
>>> domain which doesn't have permission to create the backend
>>> directory and/or the frontend nodes, don't ask it to *create*
>>> devices. In that case it is only able to connect as the backend for
>>> devices which were created *for* it by the toolstack.
>>>
>>> The criterion used in this patch series should be "did QEMU create this=
 device, or discover it".
>>>
>>
>>Yeah, that sounds like the right approach.
>
> I think we want to kill the xen_backend_set_device() function and
> instead set the backend as a property of the XenDevice *before*
> realizing it.

Not sure that I got this. Right now device is property of
XenBackendInstance. Are you proposing to make this other way around?

Right now I am looking for a place where to store the information of
XenDevice creator. My plan was to add "found_in_xenbus" property to
XenDevice and set it in xen_backend_device_create.

--=20
WBR, Volodymyr=

