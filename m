Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2FA7ABBBB
	for <lists+xen-devel@lfdr.de>; Sat, 23 Sep 2023 00:28:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607010.945164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjocU-0001o7-PI; Fri, 22 Sep 2023 22:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607010.945164; Fri, 22 Sep 2023 22:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjocU-0001kv-Ly; Fri, 22 Sep 2023 22:27:30 +0000
Received: by outflank-mailman (input) for mailman id 607010;
 Fri, 22 Sep 2023 22:27:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xvxl=FG=epam.com=prvs=362941c556=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qjocT-0001kp-Bh
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 22:27:29 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35965004-5997-11ee-878a-cb3800f73035;
 Sat, 23 Sep 2023 00:27:27 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38MFIULN007803; Fri, 22 Sep 2023 22:27:22 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3t8tsekyv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 22:27:21 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS2PR03MB9444.eurprd03.prod.outlook.com (2603:10a6:20b:59b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Fri, 22 Sep
 2023 22:27:17 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::78ef:303c:8f74:957f]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::78ef:303c:8f74:957f%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 22:27:16 +0000
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
X-Inumbo-ID: 35965004-5997-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jULt63a5JHic0NVKsl3jEfoLv6h5XRUy7t4Tn1swxOflYqr0zUMa9QWPmhAJI8/ZILV9MvP4ROgy+BkNs3vOwDJ1tvIGm7jM6td29s1qgvP5ApwH8rZYeaCD+seS5cizzWu348fvOTb6Sw3YwOnaxiniDWdJlJj8gSHuj75G7QpIO8mKW1Fo1GV8C3bE5Z/adGh2Z2tsgkGiu3bLjC/taJ6GmVOBdWFLL7INGWVB3gh04gFcnpOioDNRKNfbRMY/qh7VI2jFkR16HhH+jhCUOSdCUj7M1ab1jcA6ul1OqRhHSUEDw+G9NCqUZcT7jM/01eO7rAE6/lAWtgoca4KpdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6VSbBxXyIlHorQ3Rjke6VWSGP5oamwT8jeSrL/OFptk=;
 b=RBHdZ+TPPdMV+U00SwhLV0HRWbm6VtUMSFXRluzllG44u3+noxHV+Pb5Oy6HzDup1d71wikloKjOx9M3hO0TZiZxuXqMMjPZi+XhdMeMwPFJcYbAj7dTMhna/oIWXEdI5Fyb86s8c7OnhA3ME0Eqo+LzGSDG9m9q8u++576w61WOZxvEY9uTvLUlc/FyzO2l7nUV5gRMfcwIS1mSnUPy5fyG7e3KJFOo1Ua7fBZGMq0z55AX91VwyNsfAz0i1VJbmwiSJeiHNAGABwJUv0NfBm8t8zgtEj0dU7dem9pIJ2qUWRaRF3zspU0LbsdSaWmeEBMDBqRzFnd/Mc5zxwTG/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VSbBxXyIlHorQ3Rjke6VWSGP5oamwT8jeSrL/OFptk=;
 b=RwPr9NBRPUCdWv2IUXeY0/7Pu9hioGgotp1l8+pUWAaRnvwkd8dzoG1UaMbqle/YDBjA9flyAOg+3H1yekVnln/BXFGB+ho6NtGNMrXR/Bg/EI2gODIp/jycWujksfYsQlWMnTGWj6Fr0zxW6xlvR73g/XvuU8A1zQNDiZydSoo5L667cja9dU7R/B2WR7NRs78Q2KHI6Ljnrc3W9/CaBnI0OMRcRAlrJorQeXh7MGtoIOHRKQE3glynBLO1oeGezL8Y4m9ooUqSK2VKjhEO8Xkv+cP/pTS2qHzG+PjBGlT3pgbg8Uwrv6lF725TdPAcvWogF1sxPi9IpW8g49K6gA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] ARM: GICv3 ITS: flush caches for newly allocated ITT
Thread-Topic: [PATCH v2] ARM: GICv3 ITS: flush caches for newly allocated ITT
Thread-Index: AQHZ7aPwbLIfEqCF/k2PKMU6gFIgCg==
Date: Fri, 22 Sep 2023 22:27:15 +0000
Message-ID: <20230922222710.1383808-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS2PR03MB9444:EE_
x-ms-office365-filtering-correlation-id: bafdcd41-b70e-499c-3774-08dbbbbb12f5
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8NCkCsU49S8q7txrb4I6wLPzlSMA6Icf72wGYmiTFXQkr5ginrHFLTo3PZJDvXUHYPtEVvGh2ZSmZ8kPwji3G03aKPIhTbN9Jqo3iJWllUHhHWX9wBQGlKWoTPbS7V5HlpQM7UgFjX1VDKV5EEAfaCGfcdxSZGxYI73JqR6VgPpb1Ezk7NNWkPZTBx2twBJ4FvPWNdJVf4bJrNXkdt61fpe9sLK0/PBnNQpNHmdBlFx/zv02AYOQzuNNV+nQ5N8esLV53yQeHWCdxri4+VdRZPrBKXkOFlTjVwCoRLKAPbSFQfIODbsA4K6b4lQyrFlSTM5TBit9fEE23Jk5BwbuvEylJ2OxEZFZAyeCoVm5cnG8VwjgjLQShclb4pC7uletf/74+FyOh2cR/uxd6dOfgQJXFc85wzmk9+2B7fnB5sVSdytvy6EQKHe4OZHIKAKo3USEN4YVBjJgjfBxeBS4+JfOsidz5fk/rp9K+di6sePWHEH5AWPJUH7eQ7RDENwWtU8XfoBi49ULeuBVdmfehQn3TUDpyTI7caJcPFknKugIreexwuZkTCsuO0jxDJDFc7WfwYQiPPCUbg+rw65fbDdsTMLEcbnvzrvJv34IszHvRGZ9YEHV4P3OxLA/NQEb
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(366004)(346002)(39860400002)(1800799009)(186009)(451199024)(6506007)(6486002)(55236004)(2616005)(5660300002)(8936002)(478600001)(6512007)(2906002)(66556008)(8676002)(76116006)(66946007)(54906003)(6916009)(71200400001)(64756008)(66476007)(66446008)(91956017)(316002)(4326008)(26005)(107886003)(41300700001)(38100700002)(1076003)(38070700005)(86362001)(36756003)(122000001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?8/Jd7zS8FCFowujn/Fqr0Yy8CZFkuTBdDS9hTP/bIX5bk603Sy+4tqZX6y?=
 =?iso-8859-1?Q?slefde1t/9Qo/jEbONYyhAau9rTYEI9idsd8trEkq+diDnDG4xUuoqP4bJ?=
 =?iso-8859-1?Q?yU5CzzN3r0FDT1S8aOElqzqS3xbsjCElXPBjKVFYYDgpjy3qWmhVb9MFxx?=
 =?iso-8859-1?Q?lEFu5UK7sDtgSVhTATjxstlBEepqJSOgoG2X5GCHgcqA8RHNRnNEKJecic?=
 =?iso-8859-1?Q?TMKZSeO66JqNoLcbOFPoAVIDl+VVJOJhIYTN41OLodDlunRnrJvUTi/mtA?=
 =?iso-8859-1?Q?tfdB61QRKVtA+29nCSoCWxnpVzrnbbdC2aVg2Qa1NHVkxy2jVOnYC6MjbG?=
 =?iso-8859-1?Q?0hJ8hhoLuahYYAhbEYGp46LrOWDBZGA+WDAw4zoUn0NR1m+Jm997T/GZsm?=
 =?iso-8859-1?Q?Cbq55tQ2ON8+rde4xb+lpTdgAyBuPgknktMhylpeUCwhgb6dPogjStiWWn?=
 =?iso-8859-1?Q?8dwOFzYH3AMsXzje02VhNira1g4IimYz+Y8DZfCdzJ2vptzbcuy+KYmfiN?=
 =?iso-8859-1?Q?Zg3cMoYjk/EvnjLGbhANZfFR3MzjGpNQAtlI34Hl5dyiLcqVKuiKARSBoA?=
 =?iso-8859-1?Q?Pne0mMAn4h0jaof4gsZvBADqn1kpS8BoWWL8efmjgRGw8lCI2npwhIiTjg?=
 =?iso-8859-1?Q?Ao41ei+ujtKV+5dnJ7GBuk7C89atfNcCVLT6/R5fg1sh/3B4TQuElJLLb+?=
 =?iso-8859-1?Q?IQFqZGwWQ6vNTQEi7+me7fZjAUgoWF7QiKHdt7QS41gng8Ty0+LSA5mtgM?=
 =?iso-8859-1?Q?Ncf6yM2som896xcaBlLtzdP+OKZVdv7DiyPoXOSDnJgAAeLGPoYqeuNJtE?=
 =?iso-8859-1?Q?0BnVeQvBV8r/Nm+cyg8vPJgKuFxW5++I/gXZPvo9GZ58voeAoHPuD0L529?=
 =?iso-8859-1?Q?UeI6/8LeyMWfkNOc4ATt0QJM4iJLjFr7kxdzr+Cck/yMT3u0HK8K55Iu5U?=
 =?iso-8859-1?Q?PyUHY8B1NalAcww/BbHn3tSTmBR/Cyi9o0h+Z/pGrH0gXLEBr6nxcnWA33?=
 =?iso-8859-1?Q?1iiXJdANHqnv43NeAzb3wyLKxKE9w2XQFS1//cj7WZSy+9mT6thc8UKMzj?=
 =?iso-8859-1?Q?7a7SwAi+cLXJMwdvUScFgYx+p/Jvkt4lMlwkiVBylosCoHwMH4Pkqz9uCl?=
 =?iso-8859-1?Q?9Wm5TgsyqpYM6IjcsdwpsuX/QIIiua0SCaXnlzg7mmOZgLd54n19RLLf7K?=
 =?iso-8859-1?Q?zaS2Q2d9W9ER7ZqGRMPAgN49xEXgn+BSVXJc20rF7LJbPt8DXqiYoCBUkF?=
 =?iso-8859-1?Q?qCwskdjqt5ugKDWksv7JDXnpIyU+j2fy5FF/nBk8DQx6jZcCecdqZ+I0DZ?=
 =?iso-8859-1?Q?nJcm9FJ4eq18NBMjB3yjLX6Ww9WGuKqyu2qHnWjenlynwlVnf5NPKIlJ6q?=
 =?iso-8859-1?Q?OnmTPuowb4KfV4wQsXna38zdb9WL7OpM8gTw7LDfUwmapRKr1k8gW36b/t?=
 =?iso-8859-1?Q?mlu+Dpgvor6ieLxJ4Rsgspt00UsRCOGt3ya/W5RisjzvxSoDjXOBIu9Cvd?=
 =?iso-8859-1?Q?o+AvDbGjSfAUSCTH7AoJ8ytQrt/3PqA3+t16gInCFV1OWGxPH0IkJaVtPt?=
 =?iso-8859-1?Q?t+ZEnKPRmpTp7gYcyqARnslPGV3JhXtNw6+o4Wfs+nMxHPBUIG7tLgABkx?=
 =?iso-8859-1?Q?xmqcFzX56MG+ewaAHgD3uWIN1qZFb8ZBYelRdjaz6mpLBwek+AtaIEQQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bafdcd41-b70e-499c-3774-08dbbbbb12f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 22:27:15.4037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rBXyZuzK/7Gr6sBjTNVmXW7ZgYE75LHgbySxoAzUlMxcxzXH2ck0ZcEOieNlgF1lSuL4MFSHctd+pAVmk4W0QuIDfkarw6sVigGF4TRx3UY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9444
X-Proofpoint-ORIG-GUID: qETIUVvZdxTWWTMGeBRN1MFhF9bkHUQH
X-Proofpoint-GUID: qETIUVvZdxTWWTMGeBRN1MFhF9bkHUQH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_19,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=747 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309220191

ITS manages Device Tables and Interrupt Translation Tables on its own,
so generally we are not interested in maintaining any coherence with
CPU's view of those memory regions, except one case: ITS requires that
Interrupt Translation Tables should be initialized with
zeroes. Existing code already does this, but it does not cleans
caches afterwards. This means that ITS may see un-initialized ITT and
CPU can overwrite portions of ITT later, when it finally decides to
flush caches. Visible effect of this issue that there are not
interrupts delivered from a device.

Fix this by calling clean_and_invalidate_dcache_va_range() for newly
allocated ITT.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

Changes since v1:
 - Use clean_and_invalidate_dcache_va_range() instead of
   clean_dcache_va_range()
 - Do this unconditionally
 - Do not rename  HOST_ITS_FLUSH_CMD_QUEUE into HOST_ITS_FLUSH_BUFFERS
---
 xen/arch/arm/gic-v3-its.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 3aa4edda10..8afcd9783b 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -685,6 +685,9 @@ int gicv3_its_map_guest_device(struct domain *d,
     if ( !itt_addr )
         goto out_unlock;
=20
+    clean_and_invalidate_dcache_va_range(itt_addr,
+                                         nr_events * hw_its->itte_size);
+
     dev =3D xzalloc(struct its_device);
     if ( !dev )
         goto out_unlock;
--=20
2.42.0

