Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD08801982
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 02:27:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645845.1008389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9EnB-0006TU-4s; Sat, 02 Dec 2023 01:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645845.1008389; Sat, 02 Dec 2023 01:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9En9-0006HX-TT; Sat, 02 Dec 2023 01:27:35 +0000
Received: by outflank-mailman (input) for mailman id 645845;
 Sat, 02 Dec 2023 01:27:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVJG=HN=epam.com=prvs=6700ee1bd8=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r9En4-000271-1m
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 01:27:30 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f43a1941-90b1-11ee-9b0f-b553b5be7939;
 Sat, 02 Dec 2023 02:27:28 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B20exWe004068; Sat, 2 Dec 2023 01:27:17 GMT
Received: from eur02-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur02lp2040.outbound.protection.outlook.com [104.47.11.40])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uqt8mg1hm-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 Dec 2023 01:27:16 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB8599.eurprd03.prod.outlook.com (2603:10a6:10:3e6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Sat, 2 Dec
 2023 01:27:12 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7046.027; Sat, 2 Dec 2023
 01:27:11 +0000
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
X-Inumbo-ID: f43a1941-90b1-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a7JNZrgUj2PpAz83t3yqhrFYTPLO4rXqg7kb8Q4pBN4HbrufLP4SJ4iLVUCxVJN3ZfVut9dNYGQrLxa8q2WtAXdWsJzpO7LMO8aXVJ/SdfvgYjnfSL+WBev0qngdPf+1lBR9FPM3tDXAtRAR+Ee7XPFaSqxON05xEjftqc1hT7U6SbxfIf2roWgFSAH+7C0keMoBu3SN5wUizyG1/9g/9a8YlyIDFtqAixqm07Qc8rmPwtuHPK4gCFzhz+PGWol5rS6apY67mAQxQTmsA777YWnwZ95PVIbRNt8c7/duo9p0ClkWMGUE2bsLATb9eg8afvBSiH/hSGxf6hMfd+iAog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XatSDoliS1e0RbDS2pE/RuspFe++g/oP6bCvkIjzp1E=;
 b=abI954K3Uifyls8k+aJGfmF0dmXIPoWk2DxTsFFSIYdNCO2gPCMFKWDG8KVZEUybqP65HqnwvjGEXCESFHwBngCgwRpqt6OPtFzzEAfm18IBH1MhsCMNhfi0y2+9GHRxLjyqfDB/0D/vrZxYwe2V3Ksqs76f3yfntNi/p5Vl8545kZJkm/jck2Ww1IeIdYV9Vpu3NOtFMxIvcvoA8s2HPGco73Pg61TaUSBn68wv0DKDRmZ8PwIvu8sy8gYccliAT65FkorlYR7Sy+TnqRlRwL7wL1Hyt5Mc/JoErNJFh1EQ7g4+yE3HUhGX5JjRVpAxiG9al0j4Yx9TaU6vlJTFNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XatSDoliS1e0RbDS2pE/RuspFe++g/oP6bCvkIjzp1E=;
 b=D+OJHAAGRkqvdCWVlTPVNB+fNN15PrS5EPAtV7rbdZvjfOaXilPaRLZGN0c0jdPwl2s7P0+cie9fEe4cPT3W99R+xF0jPDKEJN1GEBdmThXtoRmMUPOxjzFn38vPtTSjsYnYLCpeLPANhEkgK7CEmY69uwBW9ppFSm3vipIJQysCsTs05v70Kp5FzR0AH8wGecAzOvoAHR+UZK3vq6lYwJN8zFnQRF4V4J/HeeEyMGmX4PwJ6RqFDVRxVW2hadBU572eEbW8zjp/8siU7zjn2dkpTo8OBzVHV6GLZuWrXmz18ESY1OYo9ZqkcfttvxWO0BfqOl6UKTrFXi15g5zsxw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v11 17/17] arm/vpci: honor access size when returning an error
Thread-Topic: [PATCH v11 17/17] arm/vpci: honor access size when returning an
 error
Thread-Index: AQHaJL6qzrPLCvUkHkyTdIPsJJSlOA==
Date: Sat, 2 Dec 2023 01:27:07 +0000
Message-ID: <20231202012556.2012281-18-volodymyr_babchuk@epam.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8599:EE_
x-ms-office365-filtering-correlation-id: 790126c9-ae6d-448f-9d16-08dbf2d5cf17
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 C4StpRTQe8cgl5GLJroaSGZQ6WbA4kMVH1CAH1Uy7+0GXoUQk79KPVPtfPZmpgiGjSy+R6vZUpeaY7iwc/5JPsreQFy8Ru0QLYb/XXaYbyx3wnwqCe5xOMFkQLQKXRL9byZHbVoiOljnXEUQ2rmaBUT/lLdE27pW+TwuOfpv/r2rnxcOuLyIytC/7Pdoy7U4AUsoA2yj90NUrkqTe8EGWL5RdQwPuiyhSf9YSAj8m+cypu/SqQRGvAw43P6jO9dpVXtB+KVEFO4CXml+wkjoxaf4a+mABsRAdou7MW3q6yHPGOUbI6wlx5qFEgZ/MYJIoPwMmbF85KO4CeUUrq8D8RZixt9lUM10prrFqjaeK7NxzGCWoVit/ARCv82n9BhPzbmEQMBOusBGIGHxoiLwNg75XAXfBIyHLEjpZ/EY8wZeGV8PuafTmqtBkc3mWg56PeYYOa98BHi+1W9dp096QFLMdkrmeIEKMuL+VVQO06HvnL6D21R5N9FXsjDga76zsyiPNfcicnjurQbcmnBsrgvmOGiOL9w6ACWn7fFNPTzmB2lRFjvMFELyrKUGILImM1DnSIz8493kPmMZTTfQLXkf4QoEzop5nGLzAfkYVu+7WplHG9oBZW9zPrbD1vyX
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(86362001)(4326008)(8676002)(8936002)(2906002)(38070700009)(41300700001)(36756003)(2616005)(107886003)(1076003)(6512007)(6506007)(55236004)(83380400001)(6486002)(478600001)(26005)(71200400001)(6666004)(38100700002)(122000001)(316002)(91956017)(54906003)(64756008)(66446008)(6916009)(66476007)(66556008)(76116006)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?+E7IAylV0uyncK6YgKmckpXLsfqpzaiALM40OTSFAnjy4uEb54ptwhvqCJ?=
 =?iso-8859-1?Q?Xpr0Iv3o2BsPsBKbMRQ6BbyX/h73b7csYJcCqXpHz4Zt5BpDq2+JwsYi6O?=
 =?iso-8859-1?Q?mwwH7y/iBNwvAcX4Oi627U51rO1O8lqdU2oRJxFPWcnx7/7JQPXx6ul2Mn?=
 =?iso-8859-1?Q?okU9UrBaQve50DdCuEOu2qDT+UOUcOT7b8d5jswbi6sVLScAsnIMD+zAcU?=
 =?iso-8859-1?Q?cBv9FnfRVrWKTSut4VZgmWXeormoMV40pYfuraQTkVWUtxnRI72Xevy571?=
 =?iso-8859-1?Q?ZHo+IDrhTkcP4dFlFVRwt16o0ST85j/01cGKp/IY7BnMhJOzdquvbynthx?=
 =?iso-8859-1?Q?UF6PkqaHWoBn+WIlLdkTx1nZJ7i8WpKwwuGr9e2yiX1jt04zQLIOQB+cuy?=
 =?iso-8859-1?Q?VwlUz2UF+20qKeOtUhllXgH/QD1DIpvKt4ctaN/KiGEbC0welmbjqFoz7Q?=
 =?iso-8859-1?Q?63YxFNM7dxiRnTQH7r+JFGNVeU61ReKnvmEHl03w3eh5AY2RJDp5gKaQCK?=
 =?iso-8859-1?Q?agAQdMcdfsLoVj5D3kTqjdMYGwSQ3oPYzlGl9Ab8B1z4ReQujQkUMiKtmc?=
 =?iso-8859-1?Q?bbEFot3Vnxroth0S1vLs98zPnrnx95qeRZnlfDf7OxjiDRYGPogxBAPmLk?=
 =?iso-8859-1?Q?uLZRCVthDQRz8naSirFBYAd8AYeYpMUZAaRZAdBymUHllkT0evAGd82lOU?=
 =?iso-8859-1?Q?tWm2m++XQRmO65y0MM5J3+9X5nj4NMhLMrW6mwrv/cvDjsNe5kiI3vfxcE?=
 =?iso-8859-1?Q?jabKhoi3QVO4Z3uFEPK5XXpTPN4ChG+mJtCsUw9tCu1kqwBpvUmg8b6cn1?=
 =?iso-8859-1?Q?YmC9UkwC09bIRY2M6vQJ+AHWXdITzgVC7+BlEJNdudsSb15/CJb0jxSJXt?=
 =?iso-8859-1?Q?o1k9Zx5mFqEExMODd4j4qVrAChCJ+z1SXKR7zHrxWN27NrqnyY44vGxyaM?=
 =?iso-8859-1?Q?QWtig6mRKN5i0FzgpDsQOS9WHfB4QHUydVvu31PMG9hqLMSOHe/f3zy8qF?=
 =?iso-8859-1?Q?0sCYGSVDWjiUl9j4EXF5u1XI/TMaYjBlNulDDGAAM9t/5WTQvr1OrdmQ50?=
 =?iso-8859-1?Q?aM/qHGfKvkFV4zVE6dLOJITAIKYOL+p2NVXCxsH+Qnt/lje3zDgKbNPSj5?=
 =?iso-8859-1?Q?ftMDu3wT/blm4Wyg+OZ+Pa+NTUJiVnsWQ0rHHhQJHlPIMJVXgYKH5KLZgf?=
 =?iso-8859-1?Q?6w8vm6lvApa+OI3Wwt44OGeCfUC3VPflHZkBN5QQiT85Qab7THxwdNytLl?=
 =?iso-8859-1?Q?LsUElZHjHwosbf5ydNHfWfgZWL7h9ch/EDAaPwnxJ/wj2wqOBiefMbqXZT?=
 =?iso-8859-1?Q?e65N/s1N84Purq6nkojIa91JJh3A4dNtk4dh2hsvn0Ey8DSdmmziWUs8hC?=
 =?iso-8859-1?Q?PcPNRQpZbuBVeXFBr0dxvwccwB59AA9lFZQ7WcjAReijZoZnoEu+Ud3GV4?=
 =?iso-8859-1?Q?ZGNkJYPaNN4GXJINfRT5R+peJedtXSn8+j873OJkCiq+PV5kEII5FwfKy+?=
 =?iso-8859-1?Q?6opjzdhppY6yZMRR8f1N/ctcz7nq/YD9zwpTdoePl658ej2lju2AlQzlo3?=
 =?iso-8859-1?Q?08Bc9UyAU3q2PbxyZ77OcDxgc5iHDDuZzgEINJoj7OrdjMa/uUJtP2KG9g?=
 =?iso-8859-1?Q?WwI3XWtgMIEJMPLmUxoTpbHyqn1pargQvzEZFHilAkXTX/Jc0x/E5otQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 790126c9-ae6d-448f-9d16-08dbf2d5cf17
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 01:27:07.6995
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FCKmHkfcEAC9BPZLtu1lgyIBg1B9zq6mz9O28MTUqGKQbSJ3apN0gDh3ZCMZuce75KhEh+g9r5w9OjFxRFimJZbO7yqdnrIDoG44IcoZKmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8599
X-Proofpoint-ORIG-GUID: SIiNy1jAmIhYwptOJd8C2gwuStlBMK-X
X-Proofpoint-GUID: SIiNy1jAmIhYwptOJd8C2gwuStlBMK-X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=824 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020008

Guest can try to read config space using different access sizes: 8,
16, 32, 64 bits. We need to take this into account when we are
returning an error back to MMIO handler, otherwise it is possible to
provide more data than requested: i.e. guest issues LDRB instruction
to read one byte, but we are writing 0xFFFFFFFFFFFFFFFF in the target
register.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/vpci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index b6ef440f17..05a479096e 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -42,6 +42,8 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *in=
fo,
 {
     struct pci_host_bridge *bridge =3D p;
     pci_sbdf_t sbdf;
+    const uint8_t access_size =3D (1 << info->dabt.size) * 8;
+    const uint64_t access_mask =3D GENMASK_ULL(access_size - 1, 0);
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
=20
@@ -49,7 +51,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *in=
fo,
=20
     if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa, &sbdf) )
     {
-        *r =3D ~0UL;
+        *r =3D access_mask;
         return 1;
     }
=20
@@ -60,7 +62,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *in=
fo,
         return 1;
     }
=20
-    *r =3D ~0UL;
+    *r =3D access_mask;
=20
     return 0;
 }
--=20
2.42.0

