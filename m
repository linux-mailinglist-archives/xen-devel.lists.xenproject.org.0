Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3922B75A37B
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 02:33:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566260.884890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHb6-0002hb-Sm; Thu, 20 Jul 2023 00:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566260.884890; Thu, 20 Jul 2023 00:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHb6-0002Wl-KO; Thu, 20 Jul 2023 00:32:48 +0000
Received: by outflank-mailman (input) for mailman id 566260;
 Thu, 20 Jul 2023 00:32:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5z78=DG=epam.com=prvs=156527e6f7=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qMHb2-0001JI-Nb
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 00:32:44 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f00b8948-2694-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 02:32:43 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36JMeiB9017190
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 00:32:41 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3rxgyx9k43-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 00:32:41 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB7783.eurprd03.prod.outlook.com (2603:10a6:20b:407::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Thu, 20 Jul
 2023 00:32:34 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85%3]) with mapi id 15.20.6588.035; Thu, 20 Jul 2023
 00:32:34 +0000
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
X-Inumbo-ID: f00b8948-2694-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYqEJpvxPZBlTonCwr9TjNiNyZ+rpTnSAEfBNglKZtr188G7UwvqgDBw1xMytIqehwuY+b3W4OOY1nGN/GFOl9ZojPxhKoAnPEbUwHHjTiu5WQmOmZvdfQVFUGpXkthaC6yHvupJx9E3pHF1IQHZD23pj++M43EtNg1xQPeER6/3C/C463rchSDIAAKkd72PKj2l/EEQvnfIB2F0oh6Jm/gkmfkxOZ0YEUCO5OW3nd9SzPcbu51JO5Yp2Rk4ZEpEU+9a4yWIYP4yofLDH1dgDFhq1dn3bJHG1ar5FtLNSRimGM+XpGPK+hwCxpZSFLcpdNnlQFAKvlaRw6TbsgeFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfSYFj3qCWK47xmolGi8XD+FB4uZs6VedMBJamb2Ugc=;
 b=YW1GaM+YsJ5rRQo1Gi6tsw4/8E3YqmuEcUaRqIud8EgGuVEe14aPx7Oe178L0dWT9/AE0SonYbGpOttEYOUYaUy5GqSlBBgoLhS0T4pGmm+JX8/PT4yrQbUq27fDV44Agei49v2gufcNR40J1jGv1+ykgrUBmkyPDceQyGamCpWVz9rfWyQCNB+++mGieWaJ44k9uvjxLRPVoITKssXhwvJisCJKOyw9m2RXBwma/6P1XnhGkNG/0HnrFFVlvIGXTGYN/rTqHT31uMdqUunBqH3p75XsuGJHlUOGO7VlwAUh+/LZqSq27VyZ0iUeCKP6lajSjBXlrJLbfyFSe/ZpfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfSYFj3qCWK47xmolGi8XD+FB4uZs6VedMBJamb2Ugc=;
 b=NPR0A6/NeRFbFCMCF/wH/kDzC2fdmn+ICsaLvWry6oOyoSP3AzmO2/nB0wu2zmCoPre3rGCo+AxlMkAqC9ZM24AAcTi+CHySrtU/gK6hHefL+SRVBSTD3MRw0rrCHC+890fIA1s5zIFKTysu9pu5q+UncorEPSNwxy14QWJpEU+gXiqS4478aOUqglqpkPIGRdLZDwiwzfDjFMTgD4oGXxgqe0Y8lE3XRlMDU1iwpFj7X6Cj34xZBaCIVpXEiZodY4B/9cO1KGFwJMNQ3qZ5UQwzop28N3Us6RrjxyH/vTFwgZgztC3BhYfN9iC4ovOyCY0a7iz0RMXRulLpOUBGmQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: [PATCH v8 07/13] vpci/header: handle p2m range sets per BAR
Thread-Topic: [PATCH v8 07/13] vpci/header: handle p2m range sets per BAR
Thread-Index: AQHZuqGsZnHxruBgBUyW03RT0neDNA==
Date: Thu, 20 Jul 2023 00:32:32 +0000
Message-ID: <20230720003205.1828537-8-volodymyr_babchuk@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB7783:EE_
x-ms-office365-filtering-correlation-id: 3e92be7c-f784-46f7-965c-08db88b8cf93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BK1LdzmU+hqekDAeNPKL4IDn/fEeCCv9qazQv56iSKag8/YWoRUwunYPSdwxh9jK+ajt2XX6FJrLMgtxy2BF7l2JCIlw2K69OER88KEDEZddVsXZR7Jn0kx9VN1WWNwrp1+/jJ9Km4WGEyLOHAykZXaXvdQqxTOy+HWnrtTZEZT/JDg7uZg9kFoaC8wyHkUlte9WAOg7BM1d9yU4twOXv/U8zjIS4k2z7fc1AyP4qGJFAFbd8QcPcWrHo91zAEVlZiMBKxKeCR2CkvXhQtcOnWATpX9S2cccpdQFJs6oirjyB4DEqbBYy+LDAnsG/pS6R/tHWOZSzdqarbji9IIQQJUuGFWEmvrl8sOlR9TUdd3ypWbnfVHCta9X/NEKFvH5uQUc7rFZffkzIzY/Pi8cP6jK7ko4Hzk0owMm6zSjREC4vuUguLnuUyxyqVRhs+cA7/pVxKrVoHFOqyzH6eiaJCEGp+XBGuqXUPxeUFUYPy7CbyFdPp4AEVd2jtI847pwP1s2eFdpmdE4mU9/d8Vg2+pdy6cAjgPZ34tKwaeBdpcnhgDJa9fMUEorsT4EzAf8AKp1jH1eXwOoe195a84ozqciZWZu6Z999STFlcwIT1pchDHXICFtYlwwEtRYvSbo
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199021)(55236004)(26005)(1076003)(6506007)(41300700001)(316002)(83380400001)(2616005)(107886003)(186003)(6512007)(6486002)(122000001)(478600001)(66946007)(71200400001)(4326008)(64756008)(38070700005)(66556008)(76116006)(66476007)(91956017)(6916009)(38100700002)(86362001)(5660300002)(66446008)(8936002)(8676002)(36756003)(30864003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?2CqbqWqG/524K9F4nPw4O4wGKQmJmSlw8DyE0zB0mTfVEwo4PxM2m3GAxZ?=
 =?iso-8859-1?Q?1Q3/3mqsh+95o75DmgM3bFH1HO3QbQD6zMb0Qgj7aFxyWGGUcNvGOI6CEM?=
 =?iso-8859-1?Q?jyVsOW7Hh47ihHcjV5Qo5CZSAlXhovur8+Y4bXZhGbAhg5eNyDoR3fSyo8?=
 =?iso-8859-1?Q?aw8LlJJvvwDmq6agYhxLsl1ds7EuQZxBzmcfGe2RAo9ZGY027sllv6SMx1?=
 =?iso-8859-1?Q?my0cb87I6qege6rKD8+s8H8/nnw4N6vtjB6/ha2N8XKC2m7BJGA8hOiLtf?=
 =?iso-8859-1?Q?Jczi3GAbuMhSbNUQDEoJsJVE55/Izeis0qsX80uY4qhfwYy9Lbq+OCC6Rh?=
 =?iso-8859-1?Q?fRQ9M9DcIzGUywpV+4cB5QRxIYGA/vVBJRQokCFdji+V53OrUBiggLJ18I?=
 =?iso-8859-1?Q?p0tAewYF9Wjg9rAtaftbefJnsDLZugBz+MNFkhEqTCdEAh9My+UF1Ya0cS?=
 =?iso-8859-1?Q?GZ92Os5yowwG8RLn79Dd6B95zo/1IU7UgwhGqMhmPBYVRv12jPBosDhwIv?=
 =?iso-8859-1?Q?Ucr4bngASup5VWg1rFQUwvqU/SeAAq3F/ah7PoA6OaaOt45hGNZPQ1jInA?=
 =?iso-8859-1?Q?hEx//Bt8uxy5e9mktAccSWUjQGYZeRpVTcDWwP8eF5l8lEOkrqzLEYdrTb?=
 =?iso-8859-1?Q?wTgJ7uQsQtJHCzzLcE1IlwXaL12w6BUH4niXJ/CpybG/E18xNRQbAsjf10?=
 =?iso-8859-1?Q?DpcD9j+IEDlauaenlwJHjN/gzQ8zHA+WQ9GfLWDDJwQqHwjrRZBSNZq4GW?=
 =?iso-8859-1?Q?+zsHlLIB3C3aqNM+UzrP/5r9JtwxVbusAVnhDhaaaLQPnzGpwItmPJAubJ?=
 =?iso-8859-1?Q?2j8B9X0ILhh6M8uyCbXWajNRE14Ieje2vZnMtTgcjX9hrNoNtyvW+c65nB?=
 =?iso-8859-1?Q?YYw3fuTI2/k4lRNw6p/gSknEG6gzoZmhbDJqzSO5uvAp1niU49iY512kv1?=
 =?iso-8859-1?Q?m7uEfNAPpuJgv8HyHeZjcmAimLQqHYw+xktg/zsMFVtx4HgO17E+swd1SS?=
 =?iso-8859-1?Q?A0pNMbwCkgPkf90k7X7BjiVhL1jZbrNhz/d7XFBNFFVHdrvHFju+vK6STM?=
 =?iso-8859-1?Q?VWNH25fGpc+yD1ljHOQyg3puSpUhCOqKgM9Raejn3a9OhMDNpVJbKRbEPL?=
 =?iso-8859-1?Q?pvSCrnmgmk+fYZWLE0yGiGpUixwrlrEeXundIS+Ce2Z44RsZ6K45QwC1T9?=
 =?iso-8859-1?Q?Nt/5WReQtsohZMJwX4toPZkt5qcuKTAhGK8GQudwy6Jz1JE19wGTDPYsVx?=
 =?iso-8859-1?Q?jJGk3uGaBEnD4eKEY4XEFk0THrsAAaLgK3aAsIpMBiLI1BN2PVSlp2a7oE?=
 =?iso-8859-1?Q?8oOg9qdYMzaMZMuvyM+KqYAbPNjth3kztJvaiVWRXKWLFyMdYlRiEu0QwP?=
 =?iso-8859-1?Q?UjvpgUBwGfYUsDw8eiJCcxKLEQ+Jva2bqoEu4iLCPaVg5vt3a0WBgzx6Hq?=
 =?iso-8859-1?Q?f8gqNiFqCUUk9/3/RQQ3ABFfH6JXhDq+3baVA6j4/nE6a/SoAjLEsw+x06?=
 =?iso-8859-1?Q?mJ6HVH278Sspp4xdyCriQSL6Lt3cmHOkwm6Ues82PqNkT/Yj6w7zTaMhcp?=
 =?iso-8859-1?Q?4YZggnxi2VtbvzbH0ktncvOP2671zweZdI58iyMAuTAJJEiZgCXkl3YF3b?=
 =?iso-8859-1?Q?o/8o3jEzQ5FILRUYFFka/1sdh/ZO7pTVBNYLnJ9QdmzQ9n2g9fYSr/Vg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e92be7c-f784-46f7-965c-08db88b8cf93
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 00:32:32.9924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oez4NfckEs57RyrUo/1qQTogW9Yip7DfAQWbsDZ2gNJj9eiMpm5G6Nea+VyT5xExOY6Y7NSQMFhCdtJ2zJYv36/VlZP0djs3cbC7gX+YZaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7783
X-Proofpoint-ORIG-GUID: v7awCBYqKbbJt-sdSLCk-QjslHKggHmC
X-Proofpoint-GUID: v7awCBYqKbbJt-sdSLCk-QjslHKggHmC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_16,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307200002

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Instead of handling a single range set, that contains all the memory
regions of all the BARs and ROM, have them per BAR.
As the range sets are now created when a PCI device is added and destroyed
when it is removed so make them named and accounted.

Note that rangesets were chosen here despite there being only up to
3 separate ranges in each set (typically just 1). But rangeset per BAR
was chosen for the ease of implementation and existing code re-usability.

This is in preparation of making non-identity mappings in p2m for the MMIOs=
.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Since v6:
- update according to the new locking scheme
- remove odd fail label in modify_bars
Since v5:
- fix comments
- move rangeset allocation to init_bars and only allocate
  for MAPPABLE BARs
- check for overlap with the already setup BAR ranges
Since v4:
- use named range sets for BARs (Jan)
- changes required by the new locking scheme
- updated commit message (Jan)
Since v3:
- re-work vpci_cancel_pending accordingly to the per-BAR handling
- s/num_mem_ranges/map_pending and s/uint8_t/bool
- ASSERT(bar->mem) in modify_bars
- create and destroy the rangesets on add/remove
---
 xen/drivers/vpci/header.c | 235 ++++++++++++++++++++++++++++----------
 xen/drivers/vpci/vpci.c   |   6 +
 xen/include/xen/vpci.h    |   3 +-
 3 files changed, 181 insertions(+), 63 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 5dc9b5338b..eb07fa0bb2 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -141,63 +141,106 @@ static void modify_decoding(const struct pci_dev *pd=
ev, uint16_t cmd,
=20
 bool vpci_process_pending(struct vcpu *v)
 {
-    if ( v->vpci.mem )
+    struct pci_dev *pdev =3D v->vpci.pdev;
+
+    if ( !pdev )
+        return false;
+
+    if ( v->vpci.map_pending )
     {
         struct map_data data =3D {
             .d =3D v->domain,
             .map =3D v->vpci.cmd & PCI_COMMAND_MEMORY,
         };
-        int rc =3D rangeset_consume_ranges(v->vpci.mem, map_range, &data);
-
-        if ( rc =3D=3D -ERESTART )
-            return true;
+        struct vpci_header *header =3D &pdev->vpci->header;
+        unsigned int i;
=20
         write_lock(&v->domain->pci_lock);
-        spin_lock(&v->vpci.pdev->vpci->lock);
-        /* Disable memory decoding unconditionally on failure. */
-        modify_decoding(v->vpci.pdev,
-                        rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.c=
md,
-                        !rc && v->vpci.rom_only);
-        spin_unlock(&v->vpci.pdev->vpci->lock);
-
-        rangeset_destroy(v->vpci.mem);
-        v->vpci.mem =3D NULL;
-        if ( rc )
-            /*
-             * FIXME: in case of failure remove the device from the domain=
.
-             * Note that there might still be leftover mappings. While thi=
s is
-             * safe for Dom0, for DomUs the domain will likely need to be
-             * killed in order to avoid leaking stale p2m mappings on
-             * failure.
-             */
-            vpci_remove_device(v->vpci.pdev);
+
+        for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
+        {
+            struct vpci_bar *bar =3D &header->bars[i];
+            int rc;
+
+            if ( rangeset_is_empty(bar->mem) )
+                continue;
+
+            rc =3D rangeset_consume_ranges(bar->mem, map_range, &data);
+
+            if ( rc =3D=3D -ERESTART )
+            {
+                write_unlock(&v->domain->pci_lock);
+                return true;
+            }
+
+            spin_lock(&pdev->vpci->lock);
+            /* Disable memory decoding unconditionally on failure. */
+            modify_decoding(pdev, rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY :
+                                       v->vpci.cmd, !rc && v->vpci.rom_onl=
y);
+            spin_unlock(&pdev->vpci->lock);
+
+            if ( rc )
+            {
+                /*
+                 * FIXME: in case of failure remove the device from the do=
main.
+                 * Note that there might still be leftover mappings. While=
 this
+                 * is safe for Dom0, for DomUs the domain needs to be kill=
ed in
+                 * order to avoid leaking stale p2m mappings on failure.
+                 */
+                v->vpci.map_pending =3D false;
+
+                if ( is_hardware_domain(v->domain) )
+                {
+                    vpci_remove_device(pdev);
+                    write_unlock(&v->domain->pci_lock);
+                }
+                else
+                {
+                    write_unlock(&v->domain->pci_lock);
+                    domain_crash(v->domain);
+                }
+                return false;
+            }
+        }
         write_unlock(&v->domain->pci_lock);
+
+        v->vpci.map_pending =3D false;
     }
=20
+
     return false;
 }
=20
 static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
-                            struct rangeset *mem, uint16_t cmd)
+                            uint16_t cmd)
 {
     struct map_data data =3D { .d =3D d, .map =3D true };
-    int rc;
+    struct vpci_header *header =3D &pdev->vpci->header;
+    int rc =3D 0;
+    unsigned int i;
=20
     ASSERT(rw_is_locked(&d->pci_lock));
=20
-    while ( (rc =3D rangeset_consume_ranges(mem, map_range, &data)) =3D=3D=
 -ERESTART )
+    for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
     {
-        /*
-         * It's safe to drop and reacquire the lock in this context
-         * without risking pdev disappearing because devices cannot be
-         * removed until the initial domain has been started.
-         */
-        read_unlock(&d->pci_lock);
-        process_pending_softirqs();
-        read_lock(&d->pci_lock);
-    }
+        struct vpci_bar *bar =3D &header->bars[i];
=20
-    rangeset_destroy(mem);
+        if ( rangeset_is_empty(bar->mem) )
+            continue;
+
+        while ( (rc =3D rangeset_consume_ranges(bar->mem, map_range,
+                                              &data)) =3D=3D -ERESTART )
+        {
+            /*
+             * It's safe to drop and reacquire the lock in this context
+             * without risking pdev disappearing because devices cannot be
+             * removed until the initial domain has been started.
+             */
+            write_unlock(&d->pci_lock);
+            process_pending_softirqs();
+            write_lock(&d->pci_lock);
+        }
+    }
     if ( !rc )
         modify_decoding(pdev, cmd, false);
=20
@@ -205,10 +248,12 @@ static int __init apply_map(struct domain *d, const s=
truct pci_dev *pdev,
 }
=20
 static void defer_map(struct domain *d, struct pci_dev *pdev,
-                      struct rangeset *mem, uint16_t cmd, bool rom_only)
+                      uint16_t cmd, bool rom_only)
 {
     struct vcpu *curr =3D current;
=20
+    ASSERT(!!rw_is_write_locked(&pdev->domain->pci_lock));
+
     /*
      * FIXME: when deferring the {un}map the state of the device should no=
t
      * be trusted. For example the enable bit is toggled after the device
@@ -216,7 +261,7 @@ static void defer_map(struct domain *d, struct pci_dev =
*pdev,
      * started for the same device if the domain is not well-behaved.
      */
     curr->vpci.pdev =3D pdev;
-    curr->vpci.mem =3D mem;
+    curr->vpci.map_pending =3D true;
     curr->vpci.cmd =3D cmd;
     curr->vpci.rom_only =3D rom_only;
     /*
@@ -230,33 +275,34 @@ static void defer_map(struct domain *d, struct pci_de=
v *pdev,
 static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_=
only)
 {
     struct vpci_header *header =3D &pdev->vpci->header;
-    struct rangeset *mem =3D rangeset_new(NULL, NULL, 0);
     struct pci_dev *tmp, *dev =3D NULL;
     const struct domain *d;
     const struct vpci_msix *msix =3D pdev->vpci->msix;
-    unsigned int i;
+    unsigned int i, j;
     int rc;
+    bool map_pending;
=20
     ASSERT(rw_is_locked(&pdev->domain->pci_lock));
=20
-    if ( !mem )
-        return -ENOMEM;
-
     /*
-     * Create a rangeset that represents the current device BARs memory re=
gion
-     * and compare it against all the currently active BAR memory regions.=
 If
-     * an overlap is found, subtract it from the region to be mapped/unmap=
ped.
+     * Create a rangeset per BAR that represents the current device memory
+     * region and compare it against all the currently active BAR memory
+     * regions. If an overlap is found, subtract it from the region to be
+     * mapped/unmapped.
      *
-     * First fill the rangeset with all the BARs of this device or with th=
e ROM
+     * First fill the rangesets with the BARs of this device or with the R=
OM
      * BAR only, depending on whether the guest is toggling the memory dec=
ode
      * bit of the command register, or the enable bit of the ROM BAR regis=
ter.
      */
     for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
     {
-        const struct vpci_bar *bar =3D &header->bars[i];
+        struct vpci_bar *bar =3D &header->bars[i];
         unsigned long start =3D PFN_DOWN(bar->addr);
         unsigned long end =3D PFN_DOWN(bar->addr + bar->size - 1);
=20
+        if ( !bar->mem )
+            continue;
+
         if ( !MAPPABLE_BAR(bar) ||
              (rom_only ? bar->type !=3D VPCI_BAR_ROM
                        : (bar->type =3D=3D VPCI_BAR_ROM && !header->rom_en=
abled)) ||
@@ -272,14 +318,31 @@ static int modify_bars(const struct pci_dev *pdev, ui=
nt16_t cmd, bool rom_only)
             continue;
         }
=20
-        rc =3D rangeset_add_range(mem, start, end);
+        rc =3D rangeset_add_range(bar->mem, start, end);
         if ( rc )
         {
             printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
                    start, end, rc);
-            rangeset_destroy(mem);
             return rc;
         }
+
+        /* Check for overlap with the already setup BAR ranges. */
+        for ( j =3D 0; j < i; j++ )
+        {
+            struct vpci_bar *bar =3D &header->bars[j];
+
+            if ( rangeset_is_empty(bar->mem) )
+                continue;
+
+            rc =3D rangeset_remove_range(bar->mem, start, end);
+            if ( rc )
+            {
+                printk(XENLOG_G_WARNING
+                       "Failed to remove overlapping range [%lx, %lx]: %d\=
n",
+                       start, end, rc);
+                return rc;
+            }
+        }
     }
=20
     /* Remove any MSIX regions if present. */
@@ -289,14 +352,21 @@ static int modify_bars(const struct pci_dev *pdev, ui=
nt16_t cmd, bool rom_only)
         unsigned long end =3D PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
                                      vmsix_table_size(pdev->vpci, i) - 1);
=20
-        rc =3D rangeset_remove_range(mem, start, end);
-        if ( rc )
+        for ( j =3D 0; j < ARRAY_SIZE(header->bars); j++ )
         {
-            printk(XENLOG_G_WARNING
-                   "Failed to remove MSIX table [%lx, %lx]: %d\n",
-                   start, end, rc);
-            rangeset_destroy(mem);
-            return rc;
+            const struct vpci_bar *bar =3D &header->bars[j];
+
+            if ( rangeset_is_empty(bar->mem) )
+                continue;
+
+            rc =3D rangeset_remove_range(bar->mem, start, end);
+            if ( rc )
+            {
+                printk(XENLOG_G_WARNING
+                       "Failed to remove MSIX table [%lx, %lx]: %d\n",
+                       start, end, rc);
+                return rc;
+            }
         }
     }
=20
@@ -341,7 +411,7 @@ static int modify_bars(const struct pci_dev *pdev, uint=
16_t cmd, bool rom_only)
                 unsigned long end =3D PFN_DOWN(bar->addr + bar->size - 1);
=20
                 if ( !bar->enabled ||
-                     !rangeset_overlaps_range(mem, start, end) ||
+                     !rangeset_overlaps_range(bar->mem, start, end) ||
                      /*
                       * If only the ROM enable bit is toggled check agains=
t
                       * other BARs in the same device for overlaps, but no=
t
@@ -350,12 +420,11 @@ static int modify_bars(const struct pci_dev *pdev, ui=
nt16_t cmd, bool rom_only)
                      (rom_only && tmp =3D=3D pdev && bar->type =3D=3D VPCI=
_BAR_ROM) )
                     continue;
=20
-                rc =3D rangeset_remove_range(mem, start, end);
+                rc =3D rangeset_remove_range(bar->mem, start, end);
                 if ( rc )
                 {
                     printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: =
%d\n",
                            start, end, rc);
-                    rangeset_destroy(mem);
                     return rc;
                 }
             }
@@ -380,10 +449,23 @@ static int modify_bars(const struct pci_dev *pdev, ui=
nt16_t cmd, bool rom_only)
          * will always be to establish mappings and process all the BARs.
          */
         ASSERT((cmd & PCI_COMMAND_MEMORY) && !rom_only);
-        return apply_map(pdev->domain, pdev, mem, cmd);
+        return apply_map(pdev->domain, pdev, cmd);
     }
=20
-    defer_map(dev->domain, dev, mem, cmd, rom_only);
+    /* Find out how many memory ranges has left after MSI and overlaps. */
+    map_pending =3D false;
+    for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
+        if ( !rangeset_is_empty(header->bars[i].mem) )
+        {
+            map_pending =3D true;
+            break;
+        }
+
+    /* If there's no mapping work write the command register now. */
+    if ( !map_pending )
+        pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
+    else
+        defer_map(dev->domain, dev, cmd, rom_only);
=20
     return 0;
 }
@@ -574,6 +656,19 @@ static void cf_check rom_write(
         rom->addr =3D val & PCI_ROM_ADDRESS_MASK;
 }
=20
+static int bar_add_rangeset(struct pci_dev *pdev, struct vpci_bar *bar, in=
t i)
+{
+    char str[32];
+
+    snprintf(str, sizeof(str), "%pp:BAR%d", &pdev->sbdf, i);
+
+    bar->mem =3D rangeset_new(pdev->domain, str, RANGESETF_no_print);
+    if ( !bar->mem )
+        return -ENOMEM;
+
+    return 0;
+}
+
 static int cf_check init_bars(struct pci_dev *pdev)
 {
     uint16_t cmd;
@@ -657,6 +752,13 @@ static int cf_check init_bars(struct pci_dev *pdev)
         else
             bars[i].type =3D VPCI_BAR_MEM32;
=20
+        rc =3D bar_add_rangeset(pdev, &bars[i], i);
+        if ( rc )
+        {
+            bars[i].type =3D VPCI_BAR_EMPTY;
+            return rc;
+        }
+
         rc =3D pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
                               (i =3D=3D num_bars - 1) ? PCI_BAR_LAST : 0);
         if ( rc < 0 )
@@ -707,6 +809,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
                                    rom_reg, 4, rom);
             if ( rc )
                 rom->type =3D VPCI_BAR_EMPTY;
+            else
+            {
+                rc =3D bar_add_rangeset(pdev, rom, i);
+                if ( rc )
+                {
+                    rom->type =3D VPCI_BAR_EMPTY;
+                    return rc;
+                }
+            }
         }
     }
     else
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index a97710a806..ca3505ecb7 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -38,6 +38,8 @@ extern vpci_register_init_t *const __end_vpci_array[];
=20
 void vpci_remove_device(struct pci_dev *pdev)
 {
+    unsigned int i;
+
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
=20
     if ( !has_vpci(pdev->domain) || !pdev->vpci )
@@ -63,6 +65,10 @@ void vpci_remove_device(struct pci_dev *pdev)
             if ( pdev->vpci->msix->table[i] )
                 iounmap(pdev->vpci->msix->table[i]);
     }
+
+    for ( i =3D 0; i < ARRAY_SIZE(pdev->vpci->header.bars); i++ )
+        rangeset_destroy(pdev->vpci->header.bars[i].mem);
+
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 486a655e8d..b78dd6512b 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -72,6 +72,7 @@ struct vpci {
             /* Guest view of the BAR: address and lower bits. */
             uint64_t guest_reg;
             uint64_t size;
+            struct rangeset *mem;
             enum {
                 VPCI_BAR_EMPTY,
                 VPCI_BAR_IO,
@@ -156,9 +157,9 @@ struct vpci {
=20
 struct vpci_vcpu {
     /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
-    struct rangeset *mem;
     struct pci_dev *pdev;
     uint16_t cmd;
+    bool map_pending : 1;
     bool rom_only : 1;
 };
=20
--=20
2.41.0

