Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABEA4AE044
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 19:01:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268496.462389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUmv-0007XS-QU; Tue, 08 Feb 2022 18:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268496.462389; Tue, 08 Feb 2022 18:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUmv-0007SF-Jq; Tue, 08 Feb 2022 18:00:25 +0000
Received: by outflank-mailman (input) for mailman id 268496;
 Tue, 08 Feb 2022 18:00:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TsJg=SX=epam.com=prvs=40387f30b1=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nHUms-00068L-Uo
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 18:00:23 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa8cc221-8908-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 19:00:20 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 218EgrT9015757;
 Tue, 8 Feb 2022 18:00:17 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3t5xrs6q-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 18:00:17 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by VE1PR03MB5613.eurprd03.prod.outlook.com (2603:10a6:803:12a::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 18:00:13 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0%6]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 18:00:13 +0000
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
X-Inumbo-ID: fa8cc221-8908-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/yYMu60zNdIqp3sIYHiLLxW1iQ/mMJaFpQBJySVIVjKMjBnhzHxjm54TPOJnd3ZPmFVnNT76N4UT0svt+78YJmj+8RBxO9dJ9iRxFP3rKZIWIwr0uBbAjgGbgQEnd37bVP+WaeJBGSSN9NjjqVDdLwIuGkih7cKK3UIb2by1ffvKgOcdcJvosNLDc6WNkrq+d4GU9R8Stp+3T9fXUTk1FhqENNvfHHK11ns2z7p9ubXN08loLkXw/AuTMw2/pAoOEfpoaI+MSxxAv4xfwfYIMKz/cxjhUypAEgPf5hM2vML8ib/kPl7xvuBIqXaCYOCSVW61zA5lte23YDD64CBYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oz8ls5jYpEH0zZ1iaWsjgXWp+zE0wyLWSst1sUoOmY8=;
 b=kU5YxXUpypTXS2Y6t5ar77Tg26uMcyuIAgFQfI9W8hC5HFQwNyNJB45Em15meaaelKZrG3uVBzqFrRnaHVFkc6JXsrKtjyxe4HyvmO2p0LxqufrAMbjOidziZb2Aemg78/YvogTJOblW6e4F/5IvSs9Qdb8mac8NBm2CT178kM1PKmIQDG12u2QlZJFFhXMTQ3VZ/96m400SbMQ1ixhtC+qEcO9/EAkYuCGqIlAgOfsmfKOFo1Rg6aIyPKi3VCC+oa1pFfBheefWd4shlxO/o7f4moswcqGqJKx20oc5poYPh9y3z2YnjgP//+3nkUgTMVzThvu+IExB9ucFhXKYQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oz8ls5jYpEH0zZ1iaWsjgXWp+zE0wyLWSst1sUoOmY8=;
 b=X+MsHsSczOmM7yw5IvGR0V8nO1anPEWIiCIV7Pk5vJqCuWEb4Paj5n/pSUD9PCEsLr+td6iDfu3/Vqh8STpjLKvrUUuApSGjSkvRxmZNpuFuWJjtiFuTMA+zGwq9vwqzbI1y7epa6PHyxLVrvoNdAYqt5qJ95fFGV2AKfiN9RUdBn1gPojbefyuK+MJr15ZhIzGc6qsBAy0/mK/5CVWMhfOyBR7/jr+Mm+WsdUd+42TZ8UPTkKnmZKv2ZwmtENWrvMkuCGisz2dAn5aCi7+Je62gxalZoamRKuou1qbFqjMF4koZ5eCTJr4Y7PWOlPA28B76lpNYWfF+RWe2ibNHag==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, Wei Liu <wl@xen.org>,
        George Dunlap <george.dunlap@citrix.com>,
        Nick Rosbrook
	<rosbrookn@ainfosec.com>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Juergen
 Gross <jgross@suse.com>
Subject: [RFC v2 7/8] tools/arm: add "arm_sci" option to xl.cfg
Thread-Topic: [RFC v2 7/8] tools/arm: add "arm_sci" option to xl.cfg
Thread-Index: AQHYHRW421V3hDnhNU+uBIx9/PfKVg==
Date: Tue, 8 Feb 2022 18:00:13 +0000
Message-ID: 
 <e138c3ed5de18e7b2a423254f3b55c1a5f22c572.1644341635.git.oleksii_moisieiev@epam.com>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1644341635.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c86fd87-1051-4555-8660-08d9eb2cdb00
x-ms-traffictypediagnostic: VE1PR03MB5613:EE_
x-microsoft-antispam-prvs: 
 <VE1PR03MB56130BE078F452D001BC0F4BE32D9@VE1PR03MB5613.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 CbIDa937LpIp4Ccm27Vusw4GZKDrT1VrjSsF3RQDM2BjY7MwjS+hTBbgbwW427+OIA8V3T0TLGomFsNhBmOE4gMR+fYmdCO97nan4Lvh/eLS8Pgr7vckkrtlq0M7e17Tr9FI4uqXdMmGrQLhTQmSNlKi3LLrQ9A/t/lvSaY8eq/vu5hCldLpPAU1wXFOsS2LnCl/SdZj/l5vHdC/YJc5K4nOeZ1xVJtvlJIqZod+gLKyqlXh6Oa5VTf3sF92rhFyb9eqFouW7tgxvfD3P38DpSvhTTfYfaaZGKfOQaqkm7IX2oPm9DlhZ1DeDtqYcFZQheS8RfZF65bpLt4VzXJlJYCtNZTB+dbVmmhvQ6xmz4hQM0vmx6HJLShJ7rkxmvhVq6NH91L5XuqERMnrfa/WiFBAz1oUqCTUvuDYP2Cno4DK/b6mJTJWJxJcH176vHXO90za7nN7Lo8/QS/Wvy+J4urPlxFASzs6eALbmvZBmdkwz8F7JS0u0hfsL1BLfCQNCti+jJGAYrIQbEUdQYL3HrNkec1LyBfX1H6/iGHzFQr4IXrnnMSfN4enqnLI42kI5mMHK9+ykUx5b5qvhTtAtAIipaxrAJTF6xDutjsoVbdISpGJ4ohGCILMklzzSx0at3Qn6Ln+w36WWSbpvgSXt3Iqd5yDJjrJ/zl0G5dc4tINb49VV3A+V7Bu0gISPrDQCled6fkQ3iRUOyfF5mZvKQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(71200400001)(6486002)(508600001)(66476007)(64756008)(86362001)(66556008)(316002)(122000001)(6916009)(6506007)(2616005)(5660300002)(6512007)(4326008)(83380400001)(54906003)(2906002)(26005)(186003)(8676002)(76116006)(38100700002)(66446008)(66946007)(8936002)(36756003)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?TjbVxtzLqxZNS/MSNWTT5fjduI0TtmR5B4Yx3MNKLMIiNlZQx/wFlV6Z83?=
 =?iso-8859-1?Q?PgzvMb6SS3dZlqTy8UrYuEh44zw91KPmwV9zn2Rqo+uw09rp3WijSC3jjZ?=
 =?iso-8859-1?Q?uBtMyTs2MQ+/dm0QM+K/+K91vuLP2yNzNxkVNiu6Y9RZwnuqiOORqaVQ88?=
 =?iso-8859-1?Q?MpJ0f8ahMikD5FIhThq9uCDOebXFAHb8DHLp6oiEx8jhHY0Ht8Bpvl0Ape?=
 =?iso-8859-1?Q?5i1tNCWRDsbX+mX5M7gfwEkrCyQQ6sXXoKt12o/5qYZ5SNEv2ctMP/p2Od?=
 =?iso-8859-1?Q?v8sntBB+jrRJkazT3Es3jsYJ56fY9rupKFWvSKSClHf9PiWjd4mjX4kXJk?=
 =?iso-8859-1?Q?2fPECHxu9nm1PIQEHr4ELP6iLzJwJfMv3GC1wp2sMFzKO8hGiMUCKttWId?=
 =?iso-8859-1?Q?BByxnE9NoeX06l3YvQ6HRjtxPzq0iJDnaxav4q97xNN5lU8cpVZymExWcp?=
 =?iso-8859-1?Q?QvjfpJ/dwkWRZyG0i7BRX5v24nR36bHLE63anmvsms2yWGb63lji2HyYB4?=
 =?iso-8859-1?Q?W6kyLBLhoQ1Cw0UEMzPNAvN43N58B7ntSCcAjU5q6qyw3sDCjRRIygCzD2?=
 =?iso-8859-1?Q?yK5vkk3IjYrVWbZX5AJmIhESOD4gxji0BHyQOZRsF8AcTLSITdDOJ18jl/?=
 =?iso-8859-1?Q?VTG6C64eLlzict/mxDPUKwJGEAykwrT9lDNtJhsN9J4UnXMlLW/R+0SaO1?=
 =?iso-8859-1?Q?NiwmYY6ZvkAXh/wLQVOaou0wqwIvf+TRKkmvVaCHrKQfOHabYOUIkcmeol?=
 =?iso-8859-1?Q?EEs4IoKK4ZS8QJ1Qnadoyu3HleJXXoPOCMq7ApxxYBuRzpZNjagX2bIs7C?=
 =?iso-8859-1?Q?Vrtvfgo59AfmKH2vs1ky6p9btOxhdtPqLKKAk4cgQK7mFdmlbPUhjX48pA?=
 =?iso-8859-1?Q?ozvcffU761QdfOrOvWGfIbWIwuTTqbZblxtyFXTshaBrVr1uTMUw5O0v5c?=
 =?iso-8859-1?Q?XBFT0J5mN/0CS/y/qcRXQFg1vfdw2bcuK9eSPzq6TjCIRneZOP//SC03IX?=
 =?iso-8859-1?Q?uq7rPAJkaNJzLIMbklJPb6oJu3BrjgkJFJUg8XATuHnDwvDcpMbEoR+4Bg?=
 =?iso-8859-1?Q?Ft5dQIggHPdOSGUhF7sydjV5V7LluD3EmIKQHFH3ZDmJPCwET5cq0qOSNF?=
 =?iso-8859-1?Q?ZVWsJvfbytXRzFsJPN3xw8RUlY4pS9bWrgD8WnZQVephIT6SZulx6w/69t?=
 =?iso-8859-1?Q?4qXYUVnYB2htQk6z6fl8ZY4J6mZDh0UX8X6zslto/XW3JYMYYf68/Vb6OZ?=
 =?iso-8859-1?Q?o3fBceN6ojjRlTm5ZiSOFwCGEo64V4j/yYLNZQzFzCH/mks+vZG8D3K/IH?=
 =?iso-8859-1?Q?/MUBVdeMJk+29XGB9OWyg7WXIUkgDmVrDWKsCg4sASuvUmdF3FhAMQT3ug?=
 =?iso-8859-1?Q?4qX3GUcJPuydvwPUkpZJMKazypFUFBNbF3qFKYI26jNrkKem2TRpf6eDF/?=
 =?iso-8859-1?Q?/auB+FLWG/kj9TjpmtsHrca7zkCdN+x4xTqPbvDX7S2jSa8JomiiNN7ttd?=
 =?iso-8859-1?Q?UIATiRvjtLkuh5j95uwl5eKQ2nL153st4pW2Jg/9qSh2qeOpbWWinm9S4f?=
 =?iso-8859-1?Q?3E9JiDcqM+CC103SxYkE+d1tvYTzjpgX1NMP5duGqZrLv14qUmvAoyWnIe?=
 =?iso-8859-1?Q?HkT7foWOHVhf9z9aEQnToRAvcRW0a3mQbhWcOnqLKW+apnqJsHCwLQku1b?=
 =?iso-8859-1?Q?fWo/HxjkAfizp2bSNd/elUhdrTj7fUAK1G3Jr0NnjWfua3BcHO6YPKkU+U?=
 =?iso-8859-1?Q?sNdpK9AN/dtmzNGm7kL9Kz4nY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c86fd87-1051-4555-8660-08d9eb2cdb00
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 18:00:13.4188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SWz4WbBiq1w8dOgLA0CkLEWHTc2hMe5VjUbHhGRJk/6+7HKr8dyrMXgh+RKMYbbF+gnvpHfKnW+Z2dSYO7WbzvT1x3y2Qt2vdpKI3vjaKzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5613
X-Proofpoint-GUID: wz6TY2sipT9sV7lH3pXo29mw_x7eIvka
X-Proofpoint-ORIG-GUID: wz6TY2sipT9sV7lH3pXo29mw_x7eIvka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202080106

This enumeration sets SCI type for the domain. Currently there is
two possible options: either 'none' or 'scmi_smc'.

'none' is the default value and it disables SCI support at all.

'scmi_smc' enables access to the Firmware from the domains using SCMI
protocol and SMC as transport.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---
 docs/man/xl.cfg.5.pod.in             | 20 ++++++++++++++++++++
 tools/golang/xenlight/helpers.gen.go |  2 ++
 tools/golang/xenlight/types.gen.go   |  7 +++++++
 tools/include/libxl.h                |  5 +++++
 tools/libs/light/libxl_types.idl     |  6 ++++++
 tools/xl/xl_parse.c                  |  9 +++++++++
 6 files changed, 49 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index ddf82cb3bc..f960e367c4 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1614,8 +1614,28 @@ This feature is a B<technology preview>.
=20
 =3Dback
=20
+=3Ditem B<arm_sci=3D"STRING">
+
+B<Arm only> Set ARM_SCI type for the guest. ARM_SCI is System Control Prot=
ocol
+allows domain to manage various functions that are provided by HW platform=
.
+
 =3Dover 4
=20
+=3Ditem B<none>
+
+Don't allow guest to use ARM_SCI if present on the platform. This is the
+default value.
+
+=3Ditem B<scmi_smc>
+
+Enables SCMI_SMC support for the guest. SCMI is System Control Management
+Inferface - allows domain to manage various functions that are provided by=
 HW
+platform, such as clocks, resets and power-domains. Xen will mediate acces=
s to
+clocks, power-domains and resets between Domains and ATF. Disabled by defa=
ult.
+SCP is used as transport.
+
+=3Dback
+
 =3Ditem B<force_assign_without_iommu=3DBOOLEAN>
=20
 If set, Xen allows to assign a devices even if it is not behind an IOMMU.
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/h=
elpers.gen.go
index 664933bbb8..6cf7725735 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1091,6 +1091,7 @@ if err :=3D x.DmRestrict.fromC(&xc.dm_restrict);err !=
=3D nil {
 return fmt.Errorf("converting field DmRestrict: %v", err)
 }
 x.Tee =3D TeeType(xc.tee)
+x.ArmSci =3D ArmSciType(xc.arm_sci)
=20
 if err :=3D x.ForceAssignWithoutIommu.fromC(&xc.force_assign_without_iommu=
);err !=3D nil {
 return fmt.Errorf("converting field ForceAssignWithoutIommu: %v", err)
@@ -1439,6 +1440,7 @@ if err :=3D x.DmRestrict.toC(&xc.dm_restrict); err !=
=3D nil {
 return fmt.Errorf("converting field DmRestrict: %v", err)
 }
 xc.tee =3D C.libxl_tee_type(x.Tee)
+xc.arm_sci =3D C.libxl_arm_sci_type(x.ArmSci)
 xc._type =3D C.libxl_domain_type(x.Type)
 switch x.Type{
 case DomainTypeHvm:
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/typ=
es.gen.go
index 2f7a088c3b..3b5c959215 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -443,6 +443,12 @@ TeeTypeNone TeeType =3D 0
 TeeTypeOptee TeeType =3D 1
 )
=20
+type ArmSciType int
+const(
+ArmSciTypeNone ArmSciType =3D 0
+ArmSciTypeScmi ArmSciType =3D 1
+)
+
 type RdmReserve struct {
 Strategy RdmReserveStrategy
 Policy RdmReservePolicy
@@ -512,6 +518,7 @@ NestedHvm Defbool
 Apic Defbool
 DmRestrict Defbool
 Tee TeeType
+ArmSci ArmSciType
 ForceAssignWithoutIommu Defbool
 Type DomainType
 TypeUnion DomainBuildInfoTypeUnion
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 2bbbd21f0b..30e5aee119 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -278,6 +278,11 @@
  */
 #define LIBXL_HAVE_BUILDINFO_ARCH_ARM_TEE 1
=20
+/*
+ * libxl_domain_build_info has the arch_arm.sci field.
+ */
+#define LIBXL_HAVE_BUILDINFO_ARCH_ARM_SCI 1
+
 /*
  * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
  * 'soft reset' for domains and there is 'soft_reset' shutdown reason
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_type=
s.idl
index 1080966c33..1878c115c3 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -480,6 +480,11 @@ libxl_tee_type =3D Enumeration("tee_type", [
     (1, "optee")
     ], init_val =3D "LIBXL_TEE_TYPE_NONE")
=20
+libxl_arm_sci_type =3D Enumeration("arm_sci_type", [
+    (0, "none"),
+    (1, "scmi_smc")
+    ], init_val =3D "LIBXL_ARM_SCI_TYPE_NONE")
+
 libxl_rdm_reserve =3D Struct("rdm_reserve", [
     ("strategy",    libxl_rdm_reserve_strategy),
     ("policy",      libxl_rdm_reserve_policy),
@@ -564,6 +569,7 @@ libxl_domain_build_info =3D Struct("domain_build_info",=
[
     ("apic",             libxl_defbool),
     ("dm_restrict",      libxl_defbool),
     ("tee",              libxl_tee_type),
+    ("arm_sci",          libxl_arm_sci_type),
     ("force_assign_without_iommu", libxl_defbool),
     ("u", KeyedUnion(None, libxl_domain_type, "type",
                 [("hvm", Struct(None, [("firmware",         string),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 67fa96d949..d53c9b1271 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2747,6 +2747,15 @@ skip_usbdev:
         }
     }
=20
+    if (!xlu_cfg_get_string (config, "arm_sci", &buf, 1)) {
+        e =3D libxl_arm_sci_type_from_string(buf, &b_info->arm_sci);
+        if (e) {
+            fprintf(stderr,
+                    "Unknown arm_sci \"%s\" specified\n", buf);
+            exit(-ERROR_FAIL);
+        }
+    }
+
     xlu_cfg_get_defbool(config, "force_assign_without_iommu",
                         &b_info->force_assign_without_iommu, 0);
=20
--=20
2.27.0

