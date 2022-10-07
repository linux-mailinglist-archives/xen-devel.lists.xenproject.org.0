Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4786E5F76F5
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 12:33:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417683.662413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkf9-0005Ua-Ln; Fri, 07 Oct 2022 10:33:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417683.662413; Fri, 07 Oct 2022 10:33:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkf8-0005Iy-SX; Fri, 07 Oct 2022 10:33:02 +0000
Received: by outflank-mailman (input) for mailman id 417683;
 Fri, 07 Oct 2022 10:33:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uvLM=2I=epam.com=prvs=22797713c5=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1ogkf6-0004P4-H8
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 10:33:00 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 681f8a81-462b-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 12:32:57 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2978P173005817;
 Fri, 7 Oct 2022 10:32:53 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3k2a45sjk3-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 10:32:53 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com (2603:10a6:803:33::29)
 by AS8PR03MB7159.eurprd03.prod.outlook.com (2603:10a6:20b:2ea::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 7 Oct
 2022 10:32:48 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273]) by VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273%5]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 10:32:48 +0000
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
X-Inumbo-ID: 681f8a81-462b-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAWF34F6/1Z5NFhIU92EsNIuKvAHCkW0l1ZAL3J9XHQzNKRfa/+eXBlOItUEu1EuNuHhqgLyYYpZZ0OPwWVamACto75Odu7V5Snc8lRqch0MFgZisrtZ6/vTAebVIrW7Mct2ZOPeuduiUFDXIxmpCXNLsC2q18GiR6ggMcEeLbEDanhyOs3cC5sOUan5AiSovel6icOwDHUdWD6WmWPPeqdRei9s9pQpszojji9kFALNUjo/8iOoH9JnLqk5xXytRctwA5IHoWAxQWuZ4lzVHoWLc2GDhnhjw02jMu+FloO1BMe7yKJvneTkh0lFi2xYBkdLBtBBn035Ekf5T8FMNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6liqUes5WMbS739XSwLeXIGXWML/GuvqIhUsXx7+7IM=;
 b=fP4JoQPQA2FccAwNm1b7qcOB70DU262DZcuZdnv/99lIJJGzJnO4P1mxx5LVWG7k8eA+9XwIko8Qd3agM4Hcfa3W57rgfhpGNXbpdgU2KGzDX1uhaJ6Ciq9hNurpsnJPpWImgIM9BbU3ujgP+d4kWV9e5pQIDmhdu1eU1demyHhoiU2euf3IqtP+6AtpEnPoUNtH7LmkmvXYqEkHkW02N9g8NBbRvW0rk+mCTGPABC98VZcmKcdM1hTnpyx0gUBaraqzgpltI9hXHn19FnBRuBgY94V//U8OHRJM51hNmSsrshOY4sTraX18oaTplEf4xqjwWFbpWCHhc/JBvDWIMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6liqUes5WMbS739XSwLeXIGXWML/GuvqIhUsXx7+7IM=;
 b=nQhhycb2bTJVgqn9/BtPfUZBbRhsrTkvB4/4+i82Tgj0RJd6MjGalesKCqNNiP8f8Htz1hBFWc6x9/bZ5nuVAEEOKHRqM6lWTdyhmtr7d/vD4btpobSkbM3Ym2Yx7vzrFYpn6OXvlin7nxjgrgwiajONYAO+ZeNEjmgXKmIGkakUPL68ZRKUpbvn2bZ/mnRwJEm4YAuREtAi+oGngglqYL4RqSIArDEFIdU5KW7SOSeHbf326sIa9qfSbPdJyEnQlnwo4T0RGIJuhc3dvmzKug4TBLSufSHFe93TLj+TiBI0D6Q/ZDxil4EkrIWkRGMpolj9u8ezy4SD5cxNNBrrCg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mirela Simonovic <mirela.simonovic@aggios.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Subject: [PATCH 06/19] xen/arm: Freeze domains on suspend and thaw them on
 resume
Thread-Topic: [PATCH 06/19] xen/arm: Freeze domains on suspend and thaw them
 on resume
Thread-Index: AQHY2jgk49iXxKVTXku3T5cqXu57kw==
Date: Fri, 7 Oct 2022 10:32:48 +0000
Message-ID: 
 <4cbdda3b5c6cce54724a505da14ce968010d0958.1665137247.git.mykyta_poturai@epam.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1665137247.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|AS8PR03MB7159:EE_
x-ms-office365-filtering-correlation-id: 2949a854-bf23-4b54-6bf3-08daa84f4778
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Yo4+mauDxamzVgxHBr+xLAWQ+aqsN5BKGsPYjH43zOREW92cyQsA/uCCRrgdW436NLBLDYVWcKEZQ0mWv+QPkrQR1tdJQParLFMQKcuGvT+XZZMvueGmWkvsmn1yfoc0b5srw659XlcMWdhcEjIKe+zQ5KJ5wK4tKRINh3JjIi/pZfamzjEQvAiNF4ueMoGccaE7MisU3txgDsIopu+7id0DbF45lCVgDSMeEcJ5s6VAOPAsTJ+yqLiS07EG+UPT/rQGYmn65+Le5UrwRHVtHcp2uh4lbrBRUt3hs5vIEYvS+FJJ0qyhpA4w0iQjZptrPvC/ED5GCR5jzUKV17/n1UEmcFJFqWKl1InQBgcgCfZ/fSZnKhjMNYPNNv0jlpjbdMZMoaj3CBGBE48ZuPs7SXw1Bne3qiBTqYTv8bRxumGU3i/2Q2saziKC2BEgSrb94c13JPTvQ28TDQ6WE9FfDNZxyE3srtUjUR5H/6uBdMPbsGCn5zupDQXj0yY2tCEY8XPrk2w+yoTp+zU3O8bapUWs/zUUSHqiMjJqLgcNJ3G1zbhJTMXB3Ejd06x1brMDusbghvC0QqSr9IaW55EpqM76kWqPWlvwghWcvyhIv+ZQlPUqT+IJKbU48KmuOa4mw0AySySieQvYIg0TTVCscqNwCJ6H3nOAPnE5v+EVQ6AhroDJmEdWs4Hy8U/ZADeJQfZoKBQQYtDyVlRg3bi4LcFEQaXhYwhQSbgnycPVabi5pVKm5lTK45I/9AjMulAA
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199015)(2616005)(186003)(83380400001)(316002)(6916009)(2906002)(54906003)(86362001)(15650500001)(5660300002)(4744005)(8936002)(66446008)(41300700001)(66946007)(64756008)(76116006)(66556008)(91956017)(66476007)(8676002)(4326008)(71200400001)(478600001)(6486002)(6512007)(55236004)(6506007)(26005)(38100700002)(38070700005)(122000001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?45GfHVC/PYY/mvjWRUBeoe1tOGqCFX5Eg/IM6POszdXHzXmDRiAbHMx+8N?=
 =?iso-8859-1?Q?UUULPaauVs6dOLFF1qYGCqi5bwgoAoRwCSR3qL1muiOthPWzr/r0cjJ6ax?=
 =?iso-8859-1?Q?pSWbPtFpakv8LIxB3ez8zWwAHXVehZVZSf5PSeDGbU4oqrDoMv9MYt7DdP?=
 =?iso-8859-1?Q?2Rr4+xQGJl1taN7OuXqfX8fU3pgxqzyrA0eNQGA30kEZahMhiH18WSdVgh?=
 =?iso-8859-1?Q?jFUnqeS1GPCvcSxNJJXX6MVq+XbaJ864I62x1vHwGmUVH6OaLCymi2eQDP?=
 =?iso-8859-1?Q?wZ+piQebZdPcaT6bLsWhg0rAwk10RE+rho2gI1XsAFTUof8DMAByCezSoL?=
 =?iso-8859-1?Q?iPt/5D5MWf4ge338KqYDTJsc2qSyzS6jHLWtElC0nWqtcZnBP11rLtu8RL?=
 =?iso-8859-1?Q?WhwGK+qYxcYeKIwTLXOMr9vv9iFc70RJIi9GP2CJVWpGF3NihLEgrFNsuj?=
 =?iso-8859-1?Q?Jzd7z7+lgdmu6cbF0Kmt8KYkXt4w2Mwim7ZUZtmsnCrDj2pzPAS5Vs9O3w?=
 =?iso-8859-1?Q?gXCuiyG1LtvCIQ4WCq+J+Xs/I4JJiqE4/Pbv6UvpUaJVtOW8ud5tktO0Et?=
 =?iso-8859-1?Q?Okr1PSIXjHSN51z9rbgjcFtqmB+PujGEhW3SmmTXmYF01hTson6f687cl4?=
 =?iso-8859-1?Q?+iczfNayWZ/P0rlc2u525DGvpgZLC5gfdd6ng560XDSkpHbhNxqJO0MH+e?=
 =?iso-8859-1?Q?d9LvFy+vk2CdP9L7ZkhptM/RAXLeT49php9CcLsGuHnFWQo7e+++PkcVqX?=
 =?iso-8859-1?Q?QoTvfY99h2U3n0wuBi4Dk4eiJD0/rkg4ZFE6MPSUzNw8zEElvj2RjwxHQj?=
 =?iso-8859-1?Q?S6+cRAmkUpFxgjjWqZmIxy5IujMXKePZGrSyYAXBkZ40viBCx3WkN08iay?=
 =?iso-8859-1?Q?vga4Vt9G0+GNnDtqd1kVSPnCnAl97G7c1Qulq2jFdtUDE9NRTTJ1DdsC1u?=
 =?iso-8859-1?Q?nR5OlDbeXxU/frdGAv2DPDkJ4poE0fwBYEd3SLiSeIPPWbNa57L1kVHv9a?=
 =?iso-8859-1?Q?Xa5ze1vdqXuPz5ceeg2MbOclzVw5m+s4JH1NrQBbWofYEuvexfw3wG9hRo?=
 =?iso-8859-1?Q?uq4d247bFN1fAuimHPSUbxeNeX2RXzU60GJe6lZNQScOUSnz3fVsMdNSwW?=
 =?iso-8859-1?Q?986opIVXi2WQDRvU013c+JBVcAXn1hy+9iqIATEgomLUQRPu902iuq4cc/?=
 =?iso-8859-1?Q?wlH5JNrXtO22cktfiQ+qAmfpPRmzLlUbL5HqFsdnaXZuwqvAV6byOhc7IW?=
 =?iso-8859-1?Q?7xW0pxb6KyGAFH4cig4kTF6pbJPh8MT7SJsHep0869d5YHWPJfpC2bi4qH?=
 =?iso-8859-1?Q?pVCjssPyox6F77qosBcoNrrJTvimxGP6DCXq/holNGRG6rYK7M5PwKoRwd?=
 =?iso-8859-1?Q?lZrgC1BV+sKqu2+jfA9Krmp4YQNsKn4FbGo6yZCt372AQcFz8AciqWK/ot?=
 =?iso-8859-1?Q?nrgW5Fu47YxssdCHR7tsBR10VNFuuVR6KCGq9OdsinQ+2PTXQLswCdk55j?=
 =?iso-8859-1?Q?dyrka1gTwgx/lQyDruFYcfV35a5r9QZp733b4OFk5TnH+u9S8uaZviQsEp?=
 =?iso-8859-1?Q?8IO2sGI/1VBGjYFaSQA1Lra/6zL/L8btqptpUMCAVzpLv4ftQM0Gzd7m67?=
 =?iso-8859-1?Q?JhvbwpSLH3AUqYEvB94YYHCcaaS372fVNiOkjgyx+D7oCBpE0w59V+NA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2949a854-bf23-4b54-6bf3-08daa84f4778
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 10:32:48.0991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z94UDmqPX3jwR/Jr4Ki3HHWHbGzd7jAQPBoRiY60jCX33bweElqYZS/42MJcrAcrvGD80VnJUilbwRh8cmO0RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7159
X-Proofpoint-GUID: UrE49jw6OF5XZapyap_6tXY19TgLRAad
X-Proofpoint-ORIG-GUID: UrE49jw6OF5XZapyap_6tXY19TgLRAad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=632 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210070064

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Freeze and thaw of domains is reused as implemented for x86. In
addition, system_state variable is updated to represent the actual
state of the system.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
---
 xen/arch/arm/suspend.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index b09bf319d0..2b94816b63 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -137,6 +137,14 @@ static long system_suspend(void *data)
 {
     BUG_ON(system_state !=3D SYS_STATE_active);
=20
+    system_state =3D SYS_STATE_suspend;
+    freeze_domains();
+
+    system_state =3D SYS_STATE_resume;
+
+    thaw_domains();
+    system_state =3D SYS_STATE_active;
+
     return -ENOSYS;
 }
=20
--=20
2.37.1

