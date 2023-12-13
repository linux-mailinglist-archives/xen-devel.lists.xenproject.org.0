Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9B7812379
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 00:45:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654256.1020964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDYum-00043O-13; Wed, 13 Dec 2023 23:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654256.1020964; Wed, 13 Dec 2023 23:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDYul-0003x7-ST; Wed, 13 Dec 2023 23:45:19 +0000
Received: by outflank-mailman (input) for mailman id 654256;
 Wed, 13 Dec 2023 23:45:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FVP7=HY=epam.com=prvs=67111d5ab2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1rDYuk-0003et-I4
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 23:45:18 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa0628d6-9a11-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 00:45:16 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BDJ2iKa012660; Wed, 13 Dec 2023 23:45:05 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uy0y4vams-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 23:45:04 +0000 (GMT)
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB8666.eurprd03.prod.outlook.com (2603:10a6:20b:54c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 23:44:59 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 23:44:59 +0000
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
X-Inumbo-ID: aa0628d6-9a11-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itAaYzhZY9Wp/aQ+boY7W3UK35VF9yEAd1O3Yh+a5ht6XbJ1UcQGystEJmxWmt+EeLQifxECsIQNhFDXba8N0HSI2YOvL1EhGbgcMCW/SXocdyLnrmLi5p/+Ar+TsyoczQFYzDjaNLkY08iuqXH4fUwwkhQennoVtqu7xuHCciDJnnrBz+7MBNqReGFz8NrUge9jVPh8qlzsRG7Ba0sGFYkeCnggPyDdNGOVfqUoOw4tdQjKUEAqMdTYx+fKn5V4gAzyhZYZRHfFpGobDdy7wCsv7fpEBEc6mKBMXdaP7eBl/MihXjCD03FgyOeCjNkyESs+KoKpV7yMtVm8sLYQGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpRsE4hzDvT+283KhRaNySn9/iNEhYA8xfPItLgPBVE=;
 b=VmtLGRjOOiKw1o/IzNQWy+yT2ygjytJaqQPk8ZT9hA7o5+cPM3vJxD3BtrDjA+06itBLMwKmcy15e5qW6RxxYlwVms/FTE1YX9BHAZ5+K1Zak5GM3DmBgo+4AQH3HY58ApVuVTCHcujxMiE0xPUPueekt5sJqwnslmqZ1hOiBuucXJS1OtFzCFf8lMeXePrfv8wB0tnGIZv9WedJta23p1y04494wGZqwrsJm10siyhTeyXFs/viCfLfV8qR48UVUi4+BAH43QRGqW1+nMXoLomaXfDQ4P6wmlG0JC5+FngztxPWjatVV4he4eIAVSM4GjcN6zq+Ux/CZqilr+M+aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpRsE4hzDvT+283KhRaNySn9/iNEhYA8xfPItLgPBVE=;
 b=ZiXlOtY3tY+OhOdjLJz4pYh/qD46uQ7jnrfMli/Byp3YPkKTWJGClY+MdAxH0LIo4kZBFhVLCsxyXcfSS0P2i/KteX5ynqARprFIxEkmcThDeze8T7SsU39ioKRZ16ETFn2+5bovuucZxe1fXvg8offyVnsrV8CIVi5gE7KlEMr0zT5aEzYfZ8zqFZYB14v+uEKiJnkEAirXN8UyIARpgzCrABPTS4ITIwqVLMYOO+0b4UfFB8//wmxmluLztL+4HWbY7LN/B/ko2WPysDAiktB+tshVF8fKCKhHYKr1Q/l/fkkMP0RfvyGpVBb7c425lwbmFKOPdYPlM5h1cLZQNA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
        Anthony PERARD
	<anthony.perard@citrix.com>,
        Juergen Gross <jgross@suse.com>
Subject: [RFC,FUTURE 3/3] tools: libxl: use "vslot" parameter when assigning a
 PCI device
Thread-Topic: [RFC,FUTURE 3/3] tools: libxl: use "vslot" parameter when
 assigning a PCI device
Thread-Index: AQHaLh5hhUhc1caE+UyL8B+mLfWnJg==
Date: Wed, 13 Dec 2023 23:44:58 +0000
Message-ID: <20231213234345.779722-4-volodymyr_babchuk@epam.com>
References: <20231213234345.779722-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231213234345.779722-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.43.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB8666:EE_
x-ms-office365-filtering-correlation-id: 1ef081db-9247-460f-e608-08dbfc358489
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hPQQZDrRDl3eLGjHCj3alzVLu3Gfff2aS6wxGU0SX7NlbZDiFpn1WxFzdVaCnYKJXTl1VXtTUDSXLpOrqgYEoXpCyO4ks5/tYsb06c0QN5Al4m0kkE6/II8JfuGeoXDDw7HeMBbN3y2u3lAvGP67hCYvYA9uPB7wwMKDMq91LS8krEJqn/cspPluht1mtzEjhBPeHxQqg//KWAvKFgeRcGf8OfgCmszsDMHnKwi/TCrWmTkM8p9Qz9POFWs5uga2nt9YRd0UsE3AoUyLgYyrA03Ss7e1x43qtA5tLX+izT3NVWAKEmgUnR+nlU4YB+aPsxg3Ruf0HPkKA2Nzbe4GsP+qPHTvP5FVHhi1eFS4AFXmLE06v38oylEh4/sSFu096qkoku8n9tnKGrGrJYGe80tZwY3RsclfA/ku++OiT55EQOMeoEBzuzVfyHQy8Z/gjbdGR2kF6zvmar/xbFC2Z73ioKt0Y+35mNxjGO76tMZcBppZtup8PdvQIUyj+VF90nOXhu1Nrj+DC49Jj1RpQFAd1jAV27uO+7gA+SU1My24r3zC1r7S/3+RE+jbb77AxyjoiM7BQsrk9InYW6t637batrEW765pV0OpH9P5W3XOs8JHRsdhRK1/HQyTBHlQ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(396003)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(1076003)(26005)(2616005)(71200400001)(6506007)(6512007)(55236004)(83380400001)(5660300002)(8936002)(41300700001)(2906002)(4326008)(478600001)(6486002)(66556008)(8676002)(76116006)(66946007)(91956017)(316002)(6916009)(54906003)(64756008)(66446008)(66476007)(86362001)(122000001)(38100700002)(36756003)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ASbcbR7+SLkXhVLuTiwMCdSAHP85ravYLOYZXXt1fHi1bQ8dQd8MQa3Gas?=
 =?iso-8859-1?Q?2USLgNSHPspBx5kIW1xik7RU5yFJjsmVVpk3vcTIf4duGJBSEGabEAXCAW?=
 =?iso-8859-1?Q?j++DcmoWImJtkR0sEzQBPFhzi5a4rI4cjoq6RUMRjOhaNwFnz/TkTQaIGc?=
 =?iso-8859-1?Q?s61ckoaHlf0RQWYwNc2/28yQfYB25MpJ8UF8lcyrAKQfYwNFFFHoTWkxg1?=
 =?iso-8859-1?Q?Z1EjupkMrmZE4iVX51RDOaA3Uc40xFBSOPpPxJUjnSQ9/UhgvEHD7Z6Exy?=
 =?iso-8859-1?Q?MrmWRfh0Qixy3RuQdFWNy5sE2eUim35ArayCzoZ0qBAh9gexcMqCVRMoFb?=
 =?iso-8859-1?Q?s9j2uj0OXXDQnXf8buZpTCd7euxeMI5sfwNUnBGblSMtx4MT/H+fCe86AS?=
 =?iso-8859-1?Q?DXyNaW8NeXye6ldwMkAQCkmXX/woGE3RVez1OcdFdvg+uwavXYMo4q/S5W?=
 =?iso-8859-1?Q?3FrA53Io/kvjUcnkEmTpSqpC8YFvuV56v7Am+H0HgVwxwuCq7vzcp76uSg?=
 =?iso-8859-1?Q?dBuAQiz2SYu356sBQIxYZMnmH5RoEb1GhM7EnYT/iBGiXuarAo4R5X3uxl?=
 =?iso-8859-1?Q?Jyz/AHaN7Lp3piNstUKer8vE0/KDRBvVw/nPF5PpYyWHp8b1O2zfsI5f7T?=
 =?iso-8859-1?Q?zTiE5EYMtFTxlUQGk02XtpFSVsv4dCpyqlXZCGl08osEF6AT7R191b1gMk?=
 =?iso-8859-1?Q?zi9YMZFCoaHlYpCE9RFqQhYDSRWoLRlZ1bg12D/LguJ7RntULIUta+2RC+?=
 =?iso-8859-1?Q?/UTrmBprE2TuAD1S8WVrWIpMi57DCscG8o387532N3Qudh7W1qZAH7+bS7?=
 =?iso-8859-1?Q?XjSQR/noi+ejVmGw6uYHAzuWXSIzNBSXysjMiT/IsreP+2zVqb5uNsrL6x?=
 =?iso-8859-1?Q?6hWyYvPpxW91Jz0tgvs9ZfkO/jfWMzsBYaXUCvs6o3toRZt5Ju6I4kbtf6?=
 =?iso-8859-1?Q?beYCRNPAAjcoaGJPo+oYPAvhsYtMi07i1iWS6Xpy+oDQF9wD/vJARDn/JO?=
 =?iso-8859-1?Q?y6it6+9eCakW4Sp3mGiXl5sSgH+d5CUbCL4wUUweTIyIdGaUrm7dSLgZw+?=
 =?iso-8859-1?Q?JCbqZgmgnWw9SxraWy5FWMD6/CJB06Kwf1wAgCcjuINWQWg2DHnf76bDbc?=
 =?iso-8859-1?Q?KZGDKbMwiG01ZLp2uX51nL8PdGvqqAprjEf0Iubemlk7IHPV1/ztvCSmWW?=
 =?iso-8859-1?Q?S/W4HAbMsoAHxybVOJFPVVnShgVMMJz+a+n2WjphPu+Y3i/Qu8HsJ/oVz5?=
 =?iso-8859-1?Q?NkB/b2pd2m3cEl1NMuTOY0MrHQlbrruNJ3AwSayqv1+yJ1YkqODHvekNC8?=
 =?iso-8859-1?Q?9ucbyTM0xvTphpZWj31B6L8Ydk+vUzQcF2vvfzTO1ObcbajemqR4CLkQEF?=
 =?iso-8859-1?Q?sLTCV7uxzC87PnoFsiWmGqOO0/G986DVjxQ0n61ONDRYAAaoKpkwcm4e5Y?=
 =?iso-8859-1?Q?UBSNclOCqo5JaM69ImTs378Sg4FL/UH6mpX5XMwJFJ4R3Gpq4f16Xt8HJ2?=
 =?iso-8859-1?Q?CG0PxF8M2NXplgRbUBCPXLnol7kQ1BiSYE48VPW1TAWo+MZIjFd/n30bTs?=
 =?iso-8859-1?Q?k12jh1Vbn0HnxNDDKPVPopjgorSj1Yl8f8RWEvg8GZLpgVBJIUkP6TLRza?=
 =?iso-8859-1?Q?+KcW4wuL8zS8+MVlz6Z7Dzx5xSg3miOg8x6ZZaLYlpUhK46pqOqsGc9w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef081db-9247-460f-e608-08dbfc358489
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 23:44:58.5066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VgNq8jdL/4lbhXmekqRDzCZqyxNT/kLCet0DjsG9Ie2r30n3dlDLmJSh5WIzS8b6rTeaxQbzEcQ5P8T1foEgjxS+yonqaGWpysGNdb5zsDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8666
X-Proofpoint-GUID: aQJr0MHTZ6mVGRNP0WHuntxA_k-knlLQ
X-Proofpoint-ORIG-GUID: aQJr0MHTZ6mVGRNP0WHuntxA_k-knlLQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312130168

Now, when "assign_device" domctl supports providing a virtual SBDF, we
can leverage "vslot" option from PCI_SPEC_STRING and pass user
requested function number to the hypervisor.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 tools/libs/light/libxl_pci.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 723e577ef5..13c7b12343 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1421,6 +1421,7 @@ static void pci_add_dm_done(libxl__egc *egc,
     uint32_t flag =3D XEN_DOMCTL_DEV_RDM_RELAXED;
     uint32_t domainid =3D domid;
     bool isstubdom =3D libxl_is_stubdom(ctx, domid, &domainid);
+    uint32_t vsbdf =3D XEN_DOMCTL_DEV_SDBF_ANY;
=20
     /* Convenience aliases */
     bool starting =3D pas->starting;
@@ -1524,12 +1525,16 @@ out_no_irq:
             rc =3D ERROR_FAIL;
             goto out;
         }
-        r =3D xc_assign_device(ctx->xch, domid, pci_encode_bdf(pci), NULL,=
 flag);
+        if (pci->vdevfn)
+            vsbdf =3D pci->vdevfn;
+
+        r =3D xc_assign_device(ctx->xch, domid, pci_encode_bdf(pci), &vsbd=
f, flag);
         if (r < 0 && (hvm || errno !=3D ENOSYS)) {
             LOGED(ERROR, domainid, "xc_assign_device failed");
             rc =3D ERROR_FAIL;
             goto out;
         }
+        LOGD(DEBUG, domainid, "Got vSBDF %x", vsbdf);
     }
=20
     if (!libxl_get_stubdom_id(CTX, domid))
--=20
2.43.0

