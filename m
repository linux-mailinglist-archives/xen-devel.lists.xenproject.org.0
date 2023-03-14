Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A67D36BA109
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 21:57:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509832.786415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcBhM-0001vj-0G; Tue, 14 Mar 2023 20:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509832.786415; Tue, 14 Mar 2023 20:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcBhL-0001to-SJ; Tue, 14 Mar 2023 20:56:43 +0000
Received: by outflank-mailman (input) for mailman id 509832;
 Tue, 14 Mar 2023 20:56:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ugWp=7G=epam.com=prvs=7437a4d9da=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1pcBhK-0001PN-1W
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 20:56:42 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6002c49-c2aa-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 21:56:37 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32EKchDp017378; Tue, 14 Mar 2023 20:56:36 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3pb0520156-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 20:56:35 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by PAXPR03MB7967.eurprd03.prod.outlook.com (2603:10a6:102:21a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 20:56:31 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e%4]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 20:56:31 +0000
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
X-Inumbo-ID: b6002c49-c2aa-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A75yNUZY7TFYc8MqS2xbkx9820TE4p03QsYhwvDwJceTcShrdZv7AK+0gzdqetMeJXNGRTfTDiWcJqWx9wCklXHTEWMIVACcFVeRq5TM1Lcns9hl5y83t9eDB06AUghwi/ll4Um7AIZbgTeD/hhtDy8NezgFnLVYgsGsVA84XR89eCYXm6uRp1ooKF3RaIAOxMjq5NiJLRXlbb9ZLQbHlrqmCCLPQuBZ6dTk7qMCaOhyVP0sF+emBSzumhKuNQ7JgRXSFZRmC0wswS/HXjfdcT+Auh85ehXwRSdLX6XbyK5txtINdPv6JC+w6YxT0BTdcuyiI+ISCqZaRwlk8WTfkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQPuJAI8PAXGvKTZe3ed59NbyldzeM5G1uslGFxDTuU=;
 b=O1qk2JsQoh7mjTZ+X7BQTKpKfycIQNoy/qfeAPHRBWWoUEBENrzfUYpLgud8zrzt8esGhlM1N/AZKw0mrje+RHHGuxkA02iSJ3gvZQUWigx7rhV+poWegVnN5zafMg00UFpZZEIac1CGKK25PhX9FVucBfAgXMAk3JNR4pGyRWzwgLLMs1DkMoqHsNpdN5R7RKyCWw31uXd0qu1/mV6EFk/0KzVSZpG4ewsKo/+P7YSzokr9vgPYZAjvVQttaXa1Ni+ZJS+qp8tAYXmbSu+ZNzJ3MHs62tXb13ZmtQ/plssIfx6t2zl3MW3HTOsoCvTYphrize6/VwGdwkv2l3RXkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQPuJAI8PAXGvKTZe3ed59NbyldzeM5G1uslGFxDTuU=;
 b=UiTw8jzdxgvZxtmFry3mjQvEo5+fhDcUaJIM16EMoUp0YQyPgQFnCWRP5HkbdVD+FQbk6Zrg1Rq6Q2PPP/aD7TAjlM0ZFW3c4Za4A48wsa/sL9nzXsKAVz29ckN8lURquHgsjmJmLsd7/EW4FpXqWrneK++EJ0J4kdkJ1lWqOyb2xOZzSwP3H4kyTwI8WRmoAxrpclY2MGpWOPgePOqFogvrRQMdcdD3TpNa+DvgP9yF0GBYjdy51sydfBg+Z5PpL6LlJFlJ/pcQYdhYAEbe10WQas4Ju5iJywbTbt55nML72w0Ylaxe1FU8UETiN+icEvdaq1vra4fS9qC1gR33vQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v3 5/6] vpci: use reference counter to protect vpci state
Thread-Topic: [PATCH v3 5/6] vpci: use reference counter to protect vpci state
Thread-Index: AQHZVrdzxSa6ccK6DkSWhcHx4QyzSw==
Date: Tue, 14 Mar 2023 20:56:30 +0000
Message-ID: <20230314205612.3703668-6-volodymyr_babchuk@epam.com>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.39.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|PAXPR03MB7967:EE_
x-ms-office365-filtering-correlation-id: 26255621-4380-46a2-ab63-08db24ce9701
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qRSf0D0XD2GpdU2bv50hNlcA57M76+JincdXVf8vD+N5EpfrOHfX0K3HzcZsy3EgrZF2fLnQlTExI/3jy8h/BvT012FbrJDASZ2CLot/bdBeeXA3b3FgTEswr7VOrd9JZXTxAGqVk/f8zsgvSoKtv4CFPr5/fKQ8eRZw9i5unNCCt2GTBCL5IVA2DO/dIKOK+FaYN3qPyfL3EwEd8zRPPc5E3NUDqq9ZEqDaKtRvURy+QXEfx9ZOn0LVLbtCcPSicf21B36XCjWL80HUm8UKb7gxiqUBxfW9DlH1T/eR+M1c1tkff1EDBd6D/v/herLtx+sHh2yp15w9Be7k044Lbs225mMWTasXEYMfY+1RK0o9qazRbTvDJ2Cmg6g8EueppUZWwYOiiC5qWV0HMwUChAvztA0j8NTC59GVZ6T+Vao1UT96qLXFFzNC6vxx4UiHCnPkBsMmItuBSNgKBB453Po8rYUpmwE0WsA93WZMrI+i/8hlj/siamDsFgnrMEIm9wq4NshqrQBZ92QsAJtXtaVhxkTa7hvXlLSJWG6A7uzBBJZ3gTq9du+ClbgCvBI2q07XKz4USOdWThwsUVX/MypkqZq+QHGIz18Wuk29Y57OaoqpwBkCs0LvS97Ytz6cn6cMK/e8JV1NLqjW+EsEPMvyh+fLQLbAyH53CVXB5qePO1B1pS6M64BskJM1RirQ9m4GhD7IaQEUjvcrJHXF+A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199018)(54906003)(316002)(86362001)(36756003)(38070700005)(38100700002)(478600001)(122000001)(55236004)(83380400001)(6512007)(6506007)(2616005)(1076003)(186003)(26005)(5660300002)(6486002)(91956017)(41300700001)(6916009)(71200400001)(76116006)(64756008)(8936002)(8676002)(2906002)(66556008)(66476007)(66946007)(66446008)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?FvQ3q/HyvvcHjFSbDmpNzjloqqdajZkphgF8raWBKm9/zb2hdGrJFDKR8q?=
 =?iso-8859-1?Q?rQonixFYSry3FNJUpqg62OepXf5/PrI/DYTwVRTNASiAaQDuQiajd32iY7?=
 =?iso-8859-1?Q?AVGz62YHW8j2ZxE2ZYWiFc4Omcybm3kXH3MMGlUxBBcLf4syDWtPpcr+Ft?=
 =?iso-8859-1?Q?KcxXGarxIgiXkbx5bLcE3kLqTiXGzV6/Z/ticrWEzEOHfphhfr6QRU0PF4?=
 =?iso-8859-1?Q?xBVwP4uRHZASKwTT9mmVXkxAyCLGhKwHSab9eUukJzS23s+2UUEFEC/mlX?=
 =?iso-8859-1?Q?nr5bytgphYR7tRjyx+g5f+vX+XZm3ahfD7UalqTaYzWPBZP1GR6DigF1gi?=
 =?iso-8859-1?Q?S15I6ZmshFiYL4OQ82P2l0SCHlSYge7Nfi7jFJ9zuqYcx6Gkgu3bxhN8ly?=
 =?iso-8859-1?Q?+1zgXxeCOKs2TYVvWCeni4zCmsaSmDX/C3qTOWPR+oB4QYfZAyfhzXD9oX?=
 =?iso-8859-1?Q?XGGGxLahqLp4VTlj6noDHdckJLkwZESjdaUQ34L5aAcJKPtkkbaS9bOklM?=
 =?iso-8859-1?Q?nr9v9K+3Xfe5QB2BD8UJcKhYU1v+VwdMlvQQlyLek9FsAHTeDxLe72ROF0?=
 =?iso-8859-1?Q?Xf92qVJqG73G15O8NSs4mwofKwoRMS1dAnBft1qmWQd98Xtj6vxwhcxqMA?=
 =?iso-8859-1?Q?RbpDReqmkce6k/j8mQVhEBZxMhKGJcF4IScbGVLT0mW9Mj9Gfnm3e+GRt1?=
 =?iso-8859-1?Q?hBxZagpv0RttrQbCmtxucdlIVEwCmsz7x4UQiG5RGJBXwyPlyLp7jYbrUO?=
 =?iso-8859-1?Q?yimWxIJ5XPheli+zGNjsqWGm3OrMTPDaApAaRI7v56DkYf7H8NPfAmIqEi?=
 =?iso-8859-1?Q?cs0Ls+h3Xq0fzT1y+DxDkLZ/4T3cjjMswJbQcgXoXwFqgPp+4mc0WSnNUz?=
 =?iso-8859-1?Q?8YK8IIJ85OmUD0TMtSPRq6S3cakBW3qvo19uv40IMpImVIqwtp1k0WTNkC?=
 =?iso-8859-1?Q?8/v5Mava4sEpZixjKcq348EVLZt3liNE+rFFXMIgG+Chy5rxDCq1RCjzbb?=
 =?iso-8859-1?Q?tYJ6hmIe91PL3y6f0Cxu4uHUmVYU7PzsZID/PXItg6a0xOkAXT1d31Oruf?=
 =?iso-8859-1?Q?PZboDcj3GWWeVU/2somFWxNHH9uO+TPEKHsjjVahw/wrypX7TqgociTZmJ?=
 =?iso-8859-1?Q?6mu4lO2W9U+AItHeGCqlyz5rB7k5QeUsp9zl5CXCLYECoRH5StHpL86Jjk?=
 =?iso-8859-1?Q?rXWJ6XkEgVPn3W+nititDRoun3oqTEVgQc9khyNbadMN2edUni7fNWwzYZ?=
 =?iso-8859-1?Q?XkJTgIzP6ocnoNwhDvDDZanumgid9FR+T84nUpSaxm9DdDLoVxXxtD3Qsq?=
 =?iso-8859-1?Q?VQoF3PsZKqIuXNOqUINkwalrGg+pI1Xn9XOsZHoOfXqXncrpFgzLGp8dnG?=
 =?iso-8859-1?Q?+Wc+UMQhb9Zl15nMGmBBt7Ep8cLYtHGQUcSwrFKgAxtJ1pEO1kG+VOFz+d?=
 =?iso-8859-1?Q?yoT+9FDqHl99qCR6bCPmgof+0r9ak8kenqZf6pHr7xNYWSULykz07yEVhz?=
 =?iso-8859-1?Q?UDoHcphkSv46+OAp03Aw6cZiJOJRkKLeUEx4fKv96B66G1plGezLZaolpZ?=
 =?iso-8859-1?Q?J0bGJAq/7Lwm26uIs8iGQy5EDJqGkk3zvrsrRfsLaXOgp7LzAfzDHDlcIV?=
 =?iso-8859-1?Q?0HCkYFOSYiaxL42vGrIz9z1A6fJTFzZjYeFndzk2r9qJ8ibjlrTC8mgw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26255621-4380-46a2-ab63-08db24ce9701
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 20:56:30.6514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U+yqjCsWYLdanZWrAoJ8UjOLqhwKwV2ARK/YwxdqbO5o37mM5Uz2h1Ik2Rs4LiAdhSZO70sI2nI+YANvZn+ZKu8qVpIopuzkaQcpfU32Fn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7967
X-Proofpoint-ORIG-GUID: 2uH3HCuWR2ZzSu7IWt3Rd_WKDmon7GdU
X-Proofpoint-GUID: 2uH3HCuWR2ZzSu7IWt3Rd_WKDmon7GdU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_14,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=754
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140168

vPCI MMIO handlers are accessing pdevs without protecting this
access with pcidevs_{lock|unlock}. This is not a problem as of now
as these are only used by Dom0. But, towards vPCI is used also for
guests, we need to properly protect pdev and pdev->vpci from being
removed while still in use.

For that use pdev reference counting.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Suggested-by: Jan Beulich <jbeulich@suse.com>

---

v3:
 - Moved from another patch series
---
 xen/drivers/vpci/vpci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 199ff55672..005f38dc77 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -62,6 +62,7 @@ void vpci_remove_device(struct pci_dev *pdev)
     xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
     pdev->vpci =3D NULL;
+    pcidev_put(pdev);
 }
=20
 int vpci_add_handlers(struct pci_dev *pdev)
@@ -72,6 +73,8 @@ int vpci_add_handlers(struct pci_dev *pdev)
     if ( !has_vpci(pdev->domain) )
         return 0;
=20
+    pcidev_get(pdev);
+
     /* We should not get here twice for the same device. */
     ASSERT(!pdev->vpci);
=20
--=20
2.39.2

