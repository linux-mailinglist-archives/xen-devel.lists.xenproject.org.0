Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2506A3E7C83
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 17:40:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165391.302266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDTq8-0003vQ-OP; Tue, 10 Aug 2021 15:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165391.302266; Tue, 10 Aug 2021 15:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDTq8-0003s6-Kz; Tue, 10 Aug 2021 15:38:52 +0000
Received: by outflank-mailman (input) for mailman id 165391;
 Tue, 10 Aug 2021 15:38:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+WCD=NB=epam.com=prvs=885647387c=roman_skakun@srs-us1.protection.inumbo.net>)
 id 1mDTq6-0003s0-DB
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 15:38:50 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e459304-f9f1-11eb-9fbd-12813bfff9fa;
 Tue, 10 Aug 2021 15:38:49 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17AFZnb1017234; Tue, 10 Aug 2021 15:38:46 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2054.outbound.protection.outlook.com [104.47.6.54])
 by mx0a-0039f301.pphosted.com with ESMTP id 3abndeskbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Aug 2021 15:38:46 +0000
Received: from AM7PR03MB6593.eurprd03.prod.outlook.com (2603:10a6:20b:1b4::10)
 by AM7PR03MB6152.eurprd03.prod.outlook.com (2603:10a6:20b:134::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Tue, 10 Aug
 2021 15:38:42 +0000
Received: from AM7PR03MB6593.eurprd03.prod.outlook.com
 ([fe80::ec7b:2795:206b:9411]) by AM7PR03MB6593.eurprd03.prod.outlook.com
 ([fe80::ec7b:2795:206b:9411%3]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 15:38:42 +0000
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
X-Inumbo-ID: 0e459304-f9f1-11eb-9fbd-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQLXdBn3ydZTc/rao22RbHqPolJQoSyAJJ4IwG7bb+MU+6jNpPBgfD014GcrBgYk0aCiIdun/rav4yIHBKaZYqTtjSnWiXhzvERN3i62PmM9B63bwA4hI89b+m+WobKd/MXQZ06gsRjsCzFNmCrcjWcOYaXM/lgtZ95GvsFIHsYFc1ro+qFG7r2bpYG9gnxZBsrMUGXhCeBkotL4wCC1g7UNTifPNCz4E9yANkcjrtUSNY03WbKmelnyzNaVojZfAlhdlWwLuwOObDg6Ew4eYPuasn3mJe7TnXdWhV4Gtczcs6hyTRXc7vclXvEbSgRJJgjHCM8tKHX4UiOzhdyhZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8yHShqa4/XyGig7OsoZWyemFpNUfJEEIWDrQk+XoH4=;
 b=UpGG4+/t8bPEijG2HsLGKjfqXZxbozwYebJeNeVmPW3q5J9kHYBrPNdtcHjKRG6p35uEJZbPYexC8Rcz/pCKGV5s0Ov0uFeiPbRIQrVbP+r4mo+2a0sxW+Y9iTRySSPRUyu4d5/7f2N7W3UdaLsEdEh+VatLrkM5qL/8GJzJ5GaNrBXS60QC7ZmeEh98QdWqOmz91neG7QtTbKWWhHbb3iXet49syyqf9QXBDAzPcmYNpJLREDGZBUnbpTcSg/KYjK+zxi77y4ku0UylreDADWc0fgp+ADEpoPp4XzVMCatXb4aKWSQR2yzd35SlDZy3poPVflUTzS2dJyJggHqJbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8yHShqa4/XyGig7OsoZWyemFpNUfJEEIWDrQk+XoH4=;
 b=rpFJc4De0PdfYT0QK0+33LrXwTc5KXp1h+goy035Yz9NpyQ230lu3fTR59JvIYMImpwsKNCgx+KeBEXwCvL1Bcjin2zCt4Y1K0nA5zKlGznow9Qh8nHPVbpmGbFQuxyiK1pbiRBdXLq8oRSGBwqvq4BKnhn/H6M2H4TgmYkafxwz8442Ic8S9uiXRByfdzeHl58McSkO8jiZ1RwrI8DCnYrErl1PgYwdPtZx33uRGzFCysxTs4ahOoLlcKO0MvdJCImPZ2hFfsDf87A7yJBPWGO6RHGr1Nggab85IvOeJh0fSy09stwSjShyGMTL16+yxyCM+aw46CnPIQbaQ57Ilg==
From: Roman Skakun <Roman_Skakun@epam.com>
To: "sstabellini@kernel.org" <sstabellini@kernel.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>,
        Andrii Anisov
	<Andrii_Anisov@epam.com>, Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Roman Skakun <Roman_Skakun@epam.com>,
        Roman
 Skakun <rm.skakun@gmail.com>, Jan Beulich <jbeulich@suse.com>
Subject: Disable swiotlb for Dom0
Thread-Topic: Disable swiotlb for Dom0
Thread-Index: AQHXjfwJK3kYIT7XAUWdmOu1AWm+tA==
Date: Tue, 10 Aug 2021 15:38:42 +0000
Message-ID: 
 <AM7PR03MB6593B4461B99297C8650CF1C85F79@AM7PR03MB6593.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60e4db10-10dc-46b6-e65f-08d95c14eea2
x-ms-traffictypediagnostic: AM7PR03MB6152:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM7PR03MB6152925D723208DC0292930B85F79@AM7PR03MB6152.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TqstzImNseCQ95e46SDfHZAjqJFTtmsn01R1Q0VA16TRj3ETPgOsvvpNLKHN9Iblv+0jw4Mpwfm5Rz7JJiMKJ1ND8hhLfvcPDoIc+kczQIkn9tYOgvg6Dk+ykB67e6c4tvNwEWwytjhXjRV+YWD9OVKIlRo70YIOZ9AVVhJC5PpLO0JxwL78xR61aeLr6wxehpPT3PuiCqpxhMAAWhaabWSSqKCBteqFCfsiT8fdrMLsXm72aoKhAYbQdwwL9QJFxDK84oiZP0h6Gbq74SSfkUttjF5h/4XBYZLd++xlVzgVb9H3uw89m494GXpZvLfhzLaEhAOe1oJEuFWL5+iQNQUHM7nC5f29FmbWuO0bsS9kcKi7eG0RucnzusLRfejgIM/zvnpE5RdJLfntFSSF4MUKr1Zk5W4b8dBm5REEb1HEHaFRWR6DqLwB7sL+wVgasNrsJTc14GaDTi8xfC8oOtxDuTS2ouGDlZvH18zztUOhHwQ1RfBZCCypzxCz5aV0al3p/jRPSwbqjXQj4mv2hzYI2AIelTMALMC4hJr4bCutbewljcMmN07dukS9r1zkJKjUcCRDqpSJ2zNeN9wGUMVsv0BO+sr5ZQZXKLzPQ0/C+DEIyZ8mEm4YFIuz3dHuvfmBBH7e75lEf3GO84PySJBQd4PYJQJ64umWX8bHHG/Xpk+zjgQq/fqw0kYThndUlDq9Joc+JKg0/t6e4Xt67+3mkc1KTjH7tm64X4wZyF0dsvsHiLoIRkwbDYOlKzTjNNpkJtD2ZRVHRlx1fVr1koWDrRImBWrEHcGUzHM2ROIvCPMz9BtWtuVglO9gmJlVk+W/e8UeDue3wiHCjTn3/A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6593.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(8676002)(76116006)(54906003)(316002)(186003)(966005)(5660300002)(6916009)(64756008)(91956017)(38100700002)(66446008)(55016002)(6506007)(8936002)(66556008)(122000001)(66946007)(66476007)(4326008)(478600001)(33656002)(71200400001)(9686003)(52536014)(2906002)(7696005)(38070700005)(86362001)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?tBX26GKiGzc0htU5PouHfWseI7DlQcY7cgCp1Nm/ruW160YA3UQOu9BgTV?=
 =?iso-8859-1?Q?b+BpuZ1DRpbtstqDT1TtUZtmx++kgcSLfsYIgXHlrJkdtcFwD1TaXvf5e5?=
 =?iso-8859-1?Q?ztb+dM/+Hl/5g+fhFYZ/4sha6aBIsRIWOfLBoIPyhIUGpA+FEDyH9ncqaL?=
 =?iso-8859-1?Q?Lkqtyzi/lh59xT3H8yTiQbqFl5+/n9gXe9RM2GkBopieoZx05IA2n6PaPI?=
 =?iso-8859-1?Q?JzC7cjIwPiM/HfesvnojzKci0aBb57K8+ubcfrOL4VZaMPvKJwkpe+L85p?=
 =?iso-8859-1?Q?HTsGGxt4B0hcnk3NiUJuvlBhjOv9QjvDRQwWuzQmUOYyfb3M12ReAsFR8+?=
 =?iso-8859-1?Q?G76SWwdI1ClDRUdFjzkUa3GZ7A06fWy+qDOKlA2C9TYzdbMdMk9AaVsvQF?=
 =?iso-8859-1?Q?o8rGINBDxXyrrg0TNlZi7INlqAqvBTlubmm0CDYhRS/vrbG0XJh44ylWJL?=
 =?iso-8859-1?Q?ESi2Nw6yusifesQOav568hTmFtAZRC9lsgBqZRTD9dEO02lUiqFStLAI05?=
 =?iso-8859-1?Q?1VaaT9tK7TU1DGcsqzSvbCd34tx2Fsg7/TYGTC1LiEXzQTsUEZ2VBDfuTt?=
 =?iso-8859-1?Q?0tRyHy95SnKpTMsHf0IKSJ2WVH9PF236gj9uDI2vExR8ylDKw6QYPIcTkw?=
 =?iso-8859-1?Q?s8Ll32bwzpMP1hiGP1dqZuatZTxPFqzalq3a0hhwD/+R7NUZMFGcqA6Vg/?=
 =?iso-8859-1?Q?GxN2lknm6tXSq2CcD4BDnQupWUTqw3IG5QY/E7pDb0AqUDbxxMASS6uiuF?=
 =?iso-8859-1?Q?nnAcy/5+U4b9m1MvArLSWSti2wF6YpYCVZVUiaNn1Xb+/CZb1NuByFovzN?=
 =?iso-8859-1?Q?X6p7WBmSwOwiY4EUdz4Oiqun0wTEyYW/9CEbKy82qHsxXc4hEud8ehRhS/?=
 =?iso-8859-1?Q?oNwyv5+q9qW5RkFgqGVm9rwf72m/SUEM1JwwDzz6gU7BFRKk0lRut71NKH?=
 =?iso-8859-1?Q?X6ni7Zha4PDUF74nt7Z3Jr/Bdq7+y4NrVA1THLfW3/fRCYbyNAa3AznpMW?=
 =?iso-8859-1?Q?YUcq9Mbo+dHfhtV6utBY+tjzN15F+gjBsR5j5uuVP/iVD5kQZ83+rDFd3j?=
 =?iso-8859-1?Q?zMgpRo1kBPniU9dDJJ7AdycRXHIszUt6CQcmgkO/dxiZs0IeSmyOWI5pNM?=
 =?iso-8859-1?Q?6rdZsdo4wXv8B9TVn/69X3T/7H4cA2fLgZHxpCtIrKT0ps2RT+WBDqAbG1?=
 =?iso-8859-1?Q?jFNG/Rhy73pGy4taCmBGSqu7Xxevqc8yvlRqluVl4ASX/UZJkTq1USB87I?=
 =?iso-8859-1?Q?858G+8OzOzwJMtmDyzZGS4yFnPbzXPFRnOEq/BStFHrQr3mXEVzMyNdixb?=
 =?iso-8859-1?Q?lLzOi3aQFhR+J36MVLRzNWF9qVah2kWz72EbOgGxRhIl2e0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6593.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e4db10-10dc-46b6-e65f-08d95c14eea2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2021 15:38:42.0906
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dMvI1914xAp3RJtpwH240vyelefZ/0dMY8fUaTeN3Ymc9+kHKpf/HpUXg76W1++kk0h0NI93F6quY7cWqhBcTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6152
X-Proofpoint-ORIG-GUID: 0H97bXjibEO1HMK180Ujm-223xUyLHXa
X-Proofpoint-GUID: 0H97bXjibEO1HMK180Ujm-223xUyLHXa
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-10_07:2021-08-10,2021-08-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=874 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108100099

Hi, Stefano!=0A=
=0A=
I have observed your patch here:=0A=
https://patchwork.kernel.org/project/xen-devel/patch/alpine.DEB.2.21.210216=
1333090.3234@sstabellini-ThinkPad-T480s/=0A=
=0A=
And I collided with the same issue, when Dom0 device trying to use=0A=
swiotlb fops for devices which are controlled by IOMMU.=0A=
=0A=
Prerequisites:=0A=
https://github.com/xen-project/xen/tree/stable-4.15=0A=
https://github.com/torvalds/linux/tree/v5.10=0A=
=0A=
Issue caused in xen_swiotlb_map_page():=0A=
```=0A=
 dev: rcar-fcp, cap: 0, dma_mask: ffffffff, page: fffffe00180c7400, page_to=
_phys: 64b1d0000, =0A=
xen_phys_to_dma(phys): 64b1d0000=0A=
```=0A=
=0A=
There is retrieved MFN(0x64b1d0000), which belongs to DomU. Dom0=0A=
swiotlb couldn't proceed to this address and throws the log:=0A=
=0A=
```=0A=
[=A0 =A099.504990] rcar-fcp fea2f000.fcp: swiotlb buffer is full (sz: 36864=
00 bytes), total 32768 (slots), used 64 (slots)=0A=
```=0A=
=0A=
Temporary, I resolved this issue by disabling swiotlb for dom0 at all=0A=
because sure that all devices goes through IOMMU, but this mention can=0A=
be true only for me.=0A=
=0A=
But, I think of a more reliable way is to declare a special IOMMU=0A=
property in xen dts for each device. If the device controlled by IOMMU=0A=
not need to set swiotlb fops in arch_setup_dma_ops.=0A=
What do you think about it?=

