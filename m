Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182994AE043
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 19:01:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268495.462379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUmu-0007E7-8x; Tue, 08 Feb 2022 18:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268495.462379; Tue, 08 Feb 2022 18:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUmu-0007BF-29; Tue, 08 Feb 2022 18:00:24 +0000
Received: by outflank-mailman (input) for mailman id 268495;
 Tue, 08 Feb 2022 18:00:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TsJg=SX=epam.com=prvs=40387f30b1=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nHUmr-00068L-Uj
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 18:00:22 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa4697a8-8908-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 19:00:20 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 218EgrT7015757;
 Tue, 8 Feb 2022 18:00:16 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3t5xrs6q-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 18:00:15 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by VE1PR03MB5613.eurprd03.prod.outlook.com (2603:10a6:803:12a::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 18:00:12 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0%6]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 18:00:12 +0000
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
X-Inumbo-ID: fa4697a8-8908-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2KNhFxlgCVQ3hz6aHDPUNPiLYciaW/Wx82wVBnPSTn9Glspe4Pvd752Yhup5TeOWcEarzDyeZ8JH+S9nLgSfODgcCeuXYnE/pm/3TP68wgaXif26CW9PGeHXpil9dBdE+Y+ksydH8sO2MUg07mCqpnQ6ku/kKKkClNX0z8BqQodUK4Ax4HL2+SdIv688PiQkyWkGoR84mg2aYba18FflVp75FCmVzmRFYq3BCXdB9Kk66wM6lNw6JAEq/uNB6AlCKRNvLSgeqKPOIMvcIO4yDtfQcZlKpVsppn5tghhbGNDTdX/8qa62BEzlJubYRqQqnM8m0dcU5Aq5EpxU1BBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HALhPv+64kbkAOfpSs3FqZOqYi5IDheOGLf5PgXphVE=;
 b=ccvM4G7+MTrS7txnx2sAe5VH+pF/x2c/AzFZz1U6sVlCWvmGc+kPWEYtWT5l1h5kD4jEzUPfy9JiyLraxAqIFHOANtGq7UJsUF+551WYEDKsiyBPFW1DdYJAqwUYbTgcHF5zAKYtBzU85KFcYbYD6dnCg+uEsNF8RFk1smy5K8FuO/dmrN3/L6CTV9ofMJz0IXDiINl6MZhXfzkURBUv/2YpgnL9HaUdrHWEcv4WRREwHZrhAKcr3aSqAN+2rKpcRQ9uW0/CyrD9aFwE5ejiSWvKOchkxINP8jKSzpRsBpJnXNOrojeZ3mNiNenxY7sRudlw83bV/IThXVtcsA07Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HALhPv+64kbkAOfpSs3FqZOqYi5IDheOGLf5PgXphVE=;
 b=ieLdGr4y1e7909uSLGz0HjamxFFs996NCd0HBilnPNN3C4vpjB8MWumuTRXf7qf0BAMKkOoDQHabEX9cZWJW7tSqcGXopofHS4nVPtRiEhYFduhpTO6b752KBb7plNHPJAuGp0lW/0RZaqjnrC2zswJtLC30tSZvzqOhU3Ba7W4V1GdmX4ueU2YugSEBX4BJkjHulIifGYOFhZ+se6BshIXAYIzEFDlY1PEdj56z5qKAIOU1jBCfAbBmaoUjr+r/p86XyOhQr+l1L2jnHt+gVPnAYCUX+NBOb/w78rHPxf3mocV8P3vLmTKC+sU4+SWlFUobNpTRbZg0Xz+gt4vOiw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, Wei Liu <wl@xen.org>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Nick Rosbrook
	<rosbrookn@ainfosec.com>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Juergen
 Gross <jgross@suse.com>, Paul Durrant <paul@xen.org>
Subject: [RFC v2 6/8] tools/arm: Introduce force_assign_without_iommu option
 to xl.cfg
Thread-Topic: [RFC v2 6/8] tools/arm: Introduce force_assign_without_iommu
 option to xl.cfg
Thread-Index: AQHYHRW3O86755dYV0qSgPdVO9oeMQ==
Date: Tue, 8 Feb 2022 18:00:12 +0000
Message-ID: 
 <d333126d12f2281f8df92e66cfba1c9eb2425dca.1644341635.git.oleksii_moisieiev@epam.com>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1644341635.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1406799b-d4c3-4d19-7fe5-08d9eb2cda71
x-ms-traffictypediagnostic: VE1PR03MB5613:EE_
x-microsoft-antispam-prvs: 
 <VE1PR03MB5613836C8024C6A467271A41E32D9@VE1PR03MB5613.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 593+KpeE3vja2YgkOiTpjRnUJLKsUnuEshoh2Z+V4mqsiSo09+3zRaS1Vrpv8dZ1iF/MqnsrWN/6uJj3IPvFXeyHgMPPFhyLjYLtQdCHGvz3x5MiTEdThKVlcsWcAOBYCm70PN/BkdRouDMixd5PCS6IYkW6v0vjahDLiDE9ZZwKve/jGlk2h7pfJp6pgQ3x5deUnaR+GPL7KbZsW53Jre8is0NkCBSmdLjMjk0FXgej+AILfM8vZFYtTPg23/1ci2UDpCHDNLGlWw/rIPAsYNvNyIXnLKKQDX5LVvQ09PhoGojoAHPRVhrbaCXc/l93tIS1rMB2FEc/lJruP+iKuym+aaruKVbACuzf4dVe98myH+NmviMnY3WtQ7EaDurHQvEz7xd7LZX30lJE9LbMVziWg2Jycy3yyIGOFNrff7HgxmMc4F4OBJFidDNLokEjZyBS3hU/GlkvugonmB/eXwyAouXPctx4J6XtcUnhOls9BBKDwNgun5ZY9DroINfjiWFDy8hq1Xjcm/eKoMVBsFovONlsF88xcVB5UJLSV8Cs2tGeOepWnfYDHEOXzi595m3+Y2qsHkCBbtXSDTK9nEcY7SW/nWEOMdBqzEs7nrThcYj63kObyzkok3T/66q3MddGajmE+q9iww35HLMfC8Aoyfhfrt9HIfGHyg+iOUjaAJXJXp5EHL2oNK11D/wzlvO8BRKM9VsrZijYDtwKSw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(71200400001)(6486002)(508600001)(66476007)(64756008)(86362001)(66556008)(316002)(122000001)(6916009)(6506007)(2616005)(5660300002)(6512007)(7416002)(4326008)(83380400001)(54906003)(2906002)(26005)(186003)(8676002)(76116006)(38100700002)(66446008)(66946007)(8936002)(36756003)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?H5luS7cGOqtky8dqBSfDdIBF46ch9LNqepgA9GrqaX4ojMAXig0k8+s4qo?=
 =?iso-8859-1?Q?f5lKGI9tUPDokXwTEGqrRhc2ZBpIKSOO2/P560SJXgreqWgV27tF0ReiU1?=
 =?iso-8859-1?Q?+qF9up8uSuYejI2F8a0sO9Zv6AxP3ijoB8mrmZ/VsCw68+c/tSmyEeHezX?=
 =?iso-8859-1?Q?ib09zKso5FC5Aa8vibGerdJVaaz9MmIr5TjbxzQJ4llz/Y2GOk5Bx8gyLN?=
 =?iso-8859-1?Q?2cxMhw/FQF2HTsHrtKW8spAgwjJNYhHAotUKsZBNxbgsvqUak67wtc3VFX?=
 =?iso-8859-1?Q?x1TCx+H7WEkSfH5Vs3SoGdOvEVqIWsEgh6O61XSPNO3IC9prDEbqFLKECo?=
 =?iso-8859-1?Q?MaiTb2NvgBgFoK+EcBSvVBr4Q4CEIdUQ3CehkEcW22ruuLu6bADw7Ourfy?=
 =?iso-8859-1?Q?uIaTITO97i8FtNa39qQJ8G/IoxF4nwU03NMfn5z/6tJaelToWW0c06rfkG?=
 =?iso-8859-1?Q?1t2dKwIdKNgulenR6CNB+lMNb6PSW4KeZpcnUVsjtMo7Z1rqihaAxx/D3P?=
 =?iso-8859-1?Q?6mBf5iV/sukO9xCu/VSkSMnUaIhEXphzPaIVHkHc6HHfbJCjZy5xDDcqf9?=
 =?iso-8859-1?Q?ZwADwtD66UiXcZe/oVJtQGyaN5258jhSDzDcDGRnmHl0N0uEOQlHhb/zbl?=
 =?iso-8859-1?Q?sUBQaAGZRlpdvlbuJbN8Myp6UovCN5VctfPlJmbQPAHp+M5BE6RO0EQaCx?=
 =?iso-8859-1?Q?+Im/m1o+VHxofRcAKlbaUZnKb/X4tXjpl5S2kcSrRXddJza2hmXPaZaPmu?=
 =?iso-8859-1?Q?o/douwHmz2iK5LO8aCFNy67JzrnG1UUJB/+9d5dtJfDb9Q5eXAoNuvZKVp?=
 =?iso-8859-1?Q?lEHt2Fq7+w5NRDVZnEbpSLkDBV6AwfYnU0CR6kQrYKut7BIULwCk+D7b+Z?=
 =?iso-8859-1?Q?fuwr77PA62dO+U9UJviqXtYIEX+ROh9Pp87puCa8M0KAHuYuTua/oh7Shr?=
 =?iso-8859-1?Q?2HpC8Z/mUq7gMG2edV07HWNE+AaYGFSSXKo7mycjJwn2w+z6dM+VVbcSFT?=
 =?iso-8859-1?Q?d/auZ/4pDKBctfoO9tkZU2rPN5tjwdnoFWNyKu48bnlvJk6BwNpksZDK+v?=
 =?iso-8859-1?Q?QZaMTgJMoBA4HMLj989wUEK+10FJ2B9R8wfJ6CggN13udtavg7XZq5j9nn?=
 =?iso-8859-1?Q?ab1tKkS7GSn54N9SVnKPMyM6sr2JJQt+wvV115FFS71vchWfq1dE00dBAT?=
 =?iso-8859-1?Q?2s4wbDT3+vRzGM6Ws2BheIoql9OqOdmxbHqCOceS/4XA3PwMun56ytPN0i?=
 =?iso-8859-1?Q?4AOsTvQUcRGCGaCWhoje2F1GeePOgoFVCYQiLIjWCMUljubHbWh5CUHbDa?=
 =?iso-8859-1?Q?NOhuLPmvKiQ13AhvBX/nczL7sJ3KjAgWxVa10NdKwQs2L4sx+COje5FPsz?=
 =?iso-8859-1?Q?hxS5hl61VR8utIanAezbLu/SCv4omYchkh9jU2lVbBxdprOsC0V4C3Elll?=
 =?iso-8859-1?Q?TtaXvbzCZF2VCvgcbk+YYDwZEmI2jLq0jXINdRulSET2eJg9akGcOO4Sgc?=
 =?iso-8859-1?Q?LgK2xh7NUGvKZ9eS8YqFZfGUC8tgVByzxa9iLzfgHmgREV2dSc+s2ic+mP?=
 =?iso-8859-1?Q?BAAzWx9+6ORWxRpX5Wnpc9lJdPlL4A8/s7KWFi/TQb5g53HCJpn+s2ep2v?=
 =?iso-8859-1?Q?56INYeOXeg2/paMEIgURJsTJYfvRkuu3FbZzSibmroOAVcVsPi5CFgtFrc?=
 =?iso-8859-1?Q?XpXJS/MPfRNIino0QqhCITWz8X1Oqe2SOabs/Idumn9HLtJdwiJAqz1tZy?=
 =?iso-8859-1?Q?20zcihE3kJaDurxmiq2s2QCDo=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1406799b-d4c3-4d19-7fe5-08d9eb2cda71
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 18:00:12.4970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5DOSt7gwUuwIgKy6ZRyHgGtHxhKXNGVsOzC7tpi3/KuMPnoQfP0vUyJNjT1bel8QlNHtM6Avhi8jw+8ypNYye3goNyRILoMTWNdhNh7rJAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5613
X-Proofpoint-GUID: bzJlSQfioNgt_-ErlNy4ipphN0IvOoPY
X-Proofpoint-ORIG-GUID: bzJlSQfioNgt_-ErlNy4ipphN0IvOoPY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202080106

If set, Xen is allowed to assign the devices even if they are not under
IOMMU.
Can be confugired from dom.cfg in the following format:
force_assign_without_iommu =3D 1

This parameter has the same purpose as xen,force-assign-without-iommu
property in dom0less archtecture.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---
 docs/man/xl.cfg.5.pod.in              |  9 +++++++++
 tools/golang/xenlight/helpers.gen.go  |  5 +++++
 tools/golang/xenlight/types.gen.go    |  1 +
 tools/libs/light/libxl_arm.c          |  3 +++
 tools/libs/light/libxl_types.idl      |  1 +
 tools/xl/xl_parse.c                   |  3 +++
 xen/common/domain.c                   |  2 +-
 xen/drivers/passthrough/device_tree.c | 19 +++++++++++++++++--
 xen/drivers/passthrough/iommu.c       |  5 ++++-
 xen/include/public/domctl.h           |  5 ++++-
 xen/include/xen/iommu.h               |  3 +++
 11 files changed, 51 insertions(+), 5 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index b98d161398..ddf82cb3bc 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1614,6 +1614,15 @@ This feature is a B<technology preview>.
=20
 =3Dback
=20
+=3Dover 4
+
+=3Ditem B<force_assign_without_iommu=3DBOOLEAN>
+
+If set, Xen allows to assign a devices even if it is not behind an IOMMU.
+This renders your platform *unsafe* if the device is DMA-capable.
+
+=3Dback
+
 =3Dback
=20
 =3Dhead2 Paravirtualised (PV) Guest Specific Options
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/h=
elpers.gen.go
index b746ff1081..664933bbb8 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1091,6 +1091,11 @@ if err :=3D x.DmRestrict.fromC(&xc.dm_restrict);err =
!=3D nil {
 return fmt.Errorf("converting field DmRestrict: %v", err)
 }
 x.Tee =3D TeeType(xc.tee)
+
+if err :=3D x.ForceAssignWithoutIommu.fromC(&xc.force_assign_without_iommu=
);err !=3D nil {
+return fmt.Errorf("converting field ForceAssignWithoutIommu: %v", err)
+}
+
 x.Type =3D DomainType(xc._type)
 switch x.Type{
 case DomainTypeHvm:
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/typ=
es.gen.go
index b1e84d5258..2f7a088c3b 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -512,6 +512,7 @@ NestedHvm Defbool
 Apic Defbool
 DmRestrict Defbool
 Tee TeeType
+ForceAssignWithoutIommu Defbool
 Type DomainType
 TypeUnion DomainBuildInfoTypeUnion
 ArchArm struct {
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index eef1de0939..c5090e2b32 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -101,6 +101,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         return ERROR_FAIL;
     }
=20
+    if (libxl_defbool_val(d_config->b_info.force_assign_without_iommu))
+        config->iommu_opts |=3D XEN_DOMCTL_IOMMU_force_iommu;
+
     return 0;
 }
=20
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_type=
s.idl
index 2a42da2f7d..1080966c33 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -564,6 +564,7 @@ libxl_domain_build_info =3D Struct("domain_build_info",=
[
     ("apic",             libxl_defbool),
     ("dm_restrict",      libxl_defbool),
     ("tee",              libxl_tee_type),
+    ("force_assign_without_iommu", libxl_defbool),
     ("u", KeyedUnion(None, libxl_domain_type, "type",
                 [("hvm", Struct(None, [("firmware",         string),
                                        ("bios",             libxl_bios_typ=
e),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 117fcdcb2b..67fa96d949 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2747,6 +2747,9 @@ skip_usbdev:
         }
     }
=20
+    xlu_cfg_get_defbool(config, "force_assign_without_iommu",
+                        &b_info->force_assign_without_iommu, 0);
+
     parse_vkb_list(config, d_config);
=20
     xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 093bb4403f..f1f19bf711 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -512,7 +512,7 @@ static int sanitise_domain_config(struct xen_domctl_cre=
atedomain *config)
=20
     if ( iommu )
     {
-        if ( config->iommu_opts & ~XEN_DOMCTL_IOMMU_no_sharept )
+        if ( config->iommu_opts >> XEN_DOMCTL_IOMMU_MAX )
         {
             dprintk(XENLOG_INFO, "Unknown IOMMU options %#x\n",
                     config->iommu_opts);
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthroug=
h/device_tree.c
index 98f2aa0dad..103608dec1 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -198,6 +198,7 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struc=
t domain *d,
 {
     int ret;
     struct dt_device_node *dev;
+    struct domain_iommu *hd =3D dom_iommu(d);
=20
     switch ( domctl->cmd )
     {
@@ -238,6 +239,16 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, stru=
ct domain *d,
             return -EINVAL;
=20
         ret =3D iommu_add_dt_device(dev);
+
+        /*
+         * iommu_add_dt_device returns 1 if iommu is disabled or device do=
n't
+         * have iommus property
+         */
+        if ( (ret =3D=3D 1) && (hd->force_assign_iommu) ) {
+            ret =3D -ENOSYS;
+            break;
+        }
+
         if ( ret < 0 )
         {
             printk(XENLOG_G_ERR "Failed to add %s to the IOMMU\n",
@@ -275,10 +286,14 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, str=
uct domain *d,
=20
         ret =3D iommu_deassign_dt_device(d, dev);
=20
-        if ( ret )
-            printk(XENLOG_G_ERR "XEN_DOMCTL_assign_dt_device: assign \"%s\=
""
+        if ( ret ) {
+            if ( hd->force_assign_iommu )
+                ret =3D -ENOSYS;
+            else
+                printk(XENLOG_G_ERR "XEN_DOMCTL_assign_dt_device: assign \=
"%s\""
                    " to dom%u failed (%d)\n",
                    dt_node_full_name(dev), d->domain_id, ret);
+        }
         break;
=20
     default:
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iomm=
u.c
index 6334370109..216a9058c0 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -193,6 +193,8 @@ int iommu_domain_init(struct domain *d, unsigned int op=
ts)
     hd->node =3D NUMA_NO_NODE;
 #endif
=20
+    hd->force_assign_iommu =3D opts & XEN_DOMCTL_IOMMU_force_iommu;
+
     ret =3D arch_iommu_domain_init(d);
     if ( ret )
         return ret;
@@ -534,6 +536,7 @@ int iommu_do_domctl(
 {
     int ret =3D -ENODEV;
=20
+
     if ( !is_iommu_enabled(d) )
         return -EOPNOTSUPP;
=20
@@ -542,7 +545,7 @@ int iommu_do_domctl(
 #endif
=20
 #ifdef CONFIG_HAS_DEVICE_TREE
-    if ( ret =3D=3D -ENODEV )
+    if ( ret =3D=3D -ENOSYS )
         ret =3D iommu_do_dt_domctl(domctl, d, u_domctl);
 #endif
=20
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index b85e6170b0..bf5f8c5b6b 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -81,8 +81,11 @@ struct xen_domctl_createdomain {
 #define _XEN_DOMCTL_IOMMU_no_sharept  0
 #define XEN_DOMCTL_IOMMU_no_sharept   (1U << _XEN_DOMCTL_IOMMU_no_sharept)
=20
+#define _XEN_DOMCTL_IOMMU_force_iommu 1
+#define XEN_DOMCTL_IOMMU_force_iommu  (1U << _XEN_DOMCTL_IOMMU_force_iommu=
)
+
 /* Max XEN_DOMCTL_IOMMU_* constant.  Used for ABI checking. */
-#define XEN_DOMCTL_IOMMU_MAX XEN_DOMCTL_IOMMU_no_sharept
+#define XEN_DOMCTL_IOMMU_MAX XEN_DOMCTL_IOMMU_force_iommu
=20
     uint32_t iommu_opts;
=20
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 6b2cdffa4a..a9cf2334af 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -330,6 +330,9 @@ struct domain_iommu {
      * necessarily imply this is true.
      */
     bool need_sync;
+
+    /* Do not return error if the device without iommu is assigned */
+    bool force_assign_iommu;
 };
=20
 #define dom_iommu(d)              (&(d)->iommu)
--=20
2.27.0

