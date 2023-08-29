Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 994A278D050
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 01:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592510.925256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb807-0007Hb-1G; Tue, 29 Aug 2023 23:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592510.925256; Tue, 29 Aug 2023 23:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb806-0007Eq-UV; Tue, 29 Aug 2023 23:19:58 +0000
Received: by outflank-mailman (input) for mailman id 592510;
 Tue, 29 Aug 2023 23:19:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y18t=EO=epam.com=prvs=36058b40d2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qb805-0006kQ-AE
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 23:19:57 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f99a568-46c2-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 01:19:54 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TFMk9l021983; Tue, 29 Aug 2023 23:19:53 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ssdvpbm4f-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 23:19:52 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM7PR03MB6371.eurprd03.prod.outlook.com (2603:10a6:20b:1b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 23:19:45 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895%4]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 23:19:45 +0000
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
X-Inumbo-ID: 8f99a568-46c2-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FV3H8rZYXDYTzPS4fqPmNKu4UiDH88cmvzJfganFHNcaJVxsLWju/ssNqgImIEtggf1zJT271dGCtRGxG5AclA10mKqURanAW4rjNP+qsS81qA99k/sWFHMiAMkZIvvaXp7Zuge8WXGGhigQOWMBDwPJyIpXyTncymlzxxET2MeqtuSMLRWIOeJZH1DixiwaWjWMB60JBOHFTrWUNmxCwTr7DBJKTSkLW3YX9ijPVWQwM4vG710/qqP9QTYTdH2goy2pksfYPFdwScJztsItu3QyztmFKyPaQmFPbNG9aJH3/IwPmK6nQKuDmbf/VoUUyy3azCODyOgdkgZi5WGCkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1T2UJXkQjdsdtIQpkDJsKMdD2XLW/kPWKtbqM3Lrtc=;
 b=PMceko1KiTM0MD+7fjqEzTzoYyLXzxSOVNO0vDSkQAoD5r9flpU8i7BqsMxDti4p1YUscPA4pZ+7qiVAJJIV7aakb/ZjzOzuhFOBAF02fr4/9Vqe6jgwx1adShqGQNhv91W9Zw+zqhbNWTnw38d6fyFRY2HXxuJu6a0wbG73zughqWKDwn30k1Ok1dwL1F8IH4QYHSD7wAuvIySv+JH+YxAjxTPZdij+oLpgzjBd2RJexwZJpggUGP4tp7jbUp1cikXWK+o6t5qOZV0gt/S3mXSPGf5AlVsR6P8wd6QCIHY0oXDwT5XQr+/0WZGvk8SDS2q0PddiBBJoCFbTk1EL0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1T2UJXkQjdsdtIQpkDJsKMdD2XLW/kPWKtbqM3Lrtc=;
 b=o6eaGIYaRBzqMURQipCCq1FWuqmy8xx4McVRNSbC2kteHiDmB/Dm+BvL7b3HtxIzPo7zPY9X9HzFXtC0a/5DuMmocvY+gDShjrpl+txgw6oKGHKYr2NB99KASmynFSyca4GfLszs+PF1I/RotbpV6Hpa1eExcb9tmpmJwHLvXumNlCn5kqQx6ag/12vfdKDIqS1UvVkzpdDcgTOm0+Yw5MBIQg2WE0wwzjalPC7u5zssQg/BvzzgN9bdzHB+nlnW22o6YfFtydSAb0tLy3J2Fju4OL0zHM0yCvc6oLYfA0maAQ1pal2AZprh46TmlRsKWdVEHN3X8DwKB5XM8uTWig==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v9 08/16] vpci/header: handle p2m range sets per BAR
Thread-Topic: [PATCH v9 08/16] vpci/header: handle p2m range sets per BAR
Thread-Index: AQHZ2s9Ln5ZnmFXk3EWGqNE8Hf9gXg==
Date: Tue, 29 Aug 2023 23:19:44 +0000
Message-ID: <20230829231912.4091958-9-volodymyr_babchuk@epam.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6371:EE_
x-ms-office365-filtering-correlation-id: c1561186-e07b-4bac-dade-08dba8e66ecf
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KesU/7wVavgKYkVrseutGKfHbdscHa0FNs5OybRl7QonSLJklJ1V4sEiDO78JhLCechojgmiyp+mO1gojiF3VAu0paTZfH9O1F5Dd6xH/2Shzfqaf/ibJbM6/inlMRp+w1gpnlwBqn+5NFbuTWtj2VP+ZHB3m6moLBDalVSzyKgUioT0PxOqzHo2MtP5Vdr2OS8RN31raxi9EkjsC5P8bkjaosCDYgvT1ZsK5oKlURjph+B2ZZyXE7LpQY/S8o1mCX1GX2BIui7TXoafXHNpI7PrBWM35IvhxVnPeYDp+Mz8+INJmhC3614trKBtLo9tDWM9a4BlD1cu7Hpo7KXYbmv94heaUYqzcmmjeBP10/adJRKLcsOR8ja9fQG8UiyHO/JGxdarqP9O/GndMtclPiwsp2AWxyqNtqrumFivXE39Bah/jNS+8qlAdiMMbPtVGBCJraiIDKPT2dZg6sR+P3478CuCpq4jLsxzS6xNFD9ixO6GYnc6G0paPykSoXOoxy5coixzFjDtvt0svbbBSS9+h0nzMqswes2czKbn5hv0TI0Blp56qpcFukvHwbETPQM5upN79YC2+EbyirBW7piQeQz9XNiY9NAHvAPe1WJJUKWEzdikgPVJCSJls+cc
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199024)(1800799009)(186009)(71200400001)(6512007)(6506007)(6486002)(478600001)(55236004)(76116006)(1076003)(2616005)(26005)(30864003)(2906002)(6916009)(64756008)(66446008)(54906003)(316002)(5660300002)(66476007)(66556008)(91956017)(66946007)(41300700001)(83380400001)(8936002)(4326008)(8676002)(36756003)(38070700005)(38100700002)(86362001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?79rNKUuXOIB3QABFAfib10C2rC012XnASAHNBR5SUl31wpVu3KablOjZZ1?=
 =?iso-8859-1?Q?0X8fuRDe68ygdipt6pYU7dlg0kpcoOXnH/319Sa48zO8q108kdL/VdipLF?=
 =?iso-8859-1?Q?xZ27pUrW+Fo9qmw08jzxhBQFyNDYB5Rs6K7PphYlee1kU3XjNpOndSgoYh?=
 =?iso-8859-1?Q?eZ69a9G/b6ruRypRo214lZlbzkGywAvTlnNkU4OIAHPQB+glDSmVYlc02Y?=
 =?iso-8859-1?Q?qiKXRNfkL2EysmipY/E8I7Jz8ajoMQyozsDavpLCMxsIZCysVqeQdvjqYP?=
 =?iso-8859-1?Q?ureea8PWO88sK/l7Loch5ZujXLqFVBYr0gJrOSHiuvuKX8CvC0HYWj9ry2?=
 =?iso-8859-1?Q?6xe0S9W8fcLxbciZUMZG0USI56VvPkRuXc8XN31/ahr9H0LsQ6fYB4AqFK?=
 =?iso-8859-1?Q?PIBKYMD+gxcXRQiefiXeLEH4qRgn+wpbrMO4pGSHXJGGRF8NyfPL0OeKWZ?=
 =?iso-8859-1?Q?xCWqsYeS6aXOkNTjpybpHbGAhfqx6jrI1rVit89RU70aHMASdryfpIlZyV?=
 =?iso-8859-1?Q?yIGAGxWu+V6vP4CzPcxszufTCFcA/jW10wiOzjKQ4JDJ/m7dRtw/mVHlMG?=
 =?iso-8859-1?Q?kUY8Pqf1pA+zPGznGZZ7lRS9DZss6BDcEQsUruWUz6kIeYAKzzZS/gKyHl?=
 =?iso-8859-1?Q?63ZeKwrKYqFdqqE9oF/nAJ+47acqBY95ESY0zrVmUPwcihFxi0UaLCAQvm?=
 =?iso-8859-1?Q?cerGxOOh/25jW0gjTzNVW3YH5+1CXk7gsw2gajoXg591dFz4yHPUKIbqAv?=
 =?iso-8859-1?Q?LWn1MR2h3u/Ld1yB2l4l7CYP/YUP0ekcnNYJ5zFUXe2wK2WKQ0pZeCmNS2?=
 =?iso-8859-1?Q?LZoJFiFVXFeWfNNPhqCwPt/depKKHZtic8yZLuoPgkNSyeBPJzSbUE8xuT?=
 =?iso-8859-1?Q?8PmujVJ6V/O2XaXTTpLXzR1IVJORA1fsJgaCzqtxP/V0eNW6SxLnPSuKUO?=
 =?iso-8859-1?Q?vdnxL0/WFR2e3yWPJeYQkcYmE/vY8v+NEZG9IRuXgNiDosTYZk9sTYsxxG?=
 =?iso-8859-1?Q?J41Hy1+50Yj0SOUHUoGYCl4Pi4YrKev39snfFqfkDC6H4zA0s6jrR7lXPZ?=
 =?iso-8859-1?Q?NH7upyVLogNrBJbj4S6fqsOmmc4I1L6Ed7sdmpfqdVUibyAwQGJnh6txSx?=
 =?iso-8859-1?Q?jBp7GQYjwuuYQmz1GjZysXoudi9GoNNOxdANl1fvejwDzMp2wDve1VPOr/?=
 =?iso-8859-1?Q?q8PxD2Dy9LpuS32F4KZ3EGVFwGwYjgRnefZDNtuzlHhBORqN2L/zgWEYsC?=
 =?iso-8859-1?Q?E4YKEQnCn7N+noc628uMcjRiZAEkCPdAunrhnLcQv4L/jUsMQNrbYJM2B5?=
 =?iso-8859-1?Q?zb5sMfeuQc65ZRaxUHjK8A4TNb4QYIH/CvGcigtKPxCls5EzkBojtlpCt+?=
 =?iso-8859-1?Q?QVw1pGc4QDkf1T0q2GxeHcpMXG7KTcb1g/PqU5wWuR+v+qSoQCfvZsQ8IY?=
 =?iso-8859-1?Q?Jy1imU4Mt/qjuIKwpwpQZePcaauM/UaDe8vL+NJF4G4AMR8XL1lwDYmzeG?=
 =?iso-8859-1?Q?tp70F5xsA/zArlLuaSb5eSg71pI7VgkbG9O8ti5i+T/vBki+9oqqyB+DT1?=
 =?iso-8859-1?Q?8QN/ve72KObqvAUroS3hSmPw6782SQU8C0AhvCp3+P8z43LmRC45BO0I+g?=
 =?iso-8859-1?Q?bX4HZWip3g437Vzpy58hMmDo7tGQiKImIvQ3yqza0jUbhuktVo5h7KlA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1561186-e07b-4bac-dade-08dba8e66ecf
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 23:19:44.3700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SxMJXhYHRNSmyv2zdedX9zTxqM7n9BBXPdT+WHU7q5IlyEon13baRwK5I/AHHJppkxTjY9IdQVem//aiW5v0JiWR8U6qgWT1lWT4kAqdXxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6371
X-Proofpoint-ORIG-GUID: 51EHbfHAcAxSSBGUCrGxQHmnYd4IRMog
X-Proofpoint-GUID: 51EHbfHAcAxSSBGUCrGxQHmnYd4IRMog
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290202

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
Since v9:
- removed d->vpci.map_pending in favor of checking v->vpci.pdev !=3D
NULL
- printk -> gprintk
- renamed bar variable to fix shadowing
- fixed bug with iterating on remote device's BARs
- relaxed lock in vpci_process_pending
- removed stale comment
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
 xen/drivers/vpci/header.c | 252 ++++++++++++++++++++++++++------------
 xen/drivers/vpci/vpci.c   |   6 +
 xen/include/xen/vpci.h    |   2 +-
 3 files changed, 180 insertions(+), 80 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index e96d7b2b37..3cc6a96849 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -161,63 +161,101 @@ static void modify_decoding(const struct pci_dev *pd=
ev, uint16_t cmd,
=20
 bool vpci_process_pending(struct vcpu *v)
 {
-    if ( v->vpci.mem )
+    struct pci_dev *pdev =3D v->vpci.pdev;
+    struct map_data data =3D {
+        .d =3D v->domain,
+        .map =3D v->vpci.cmd & PCI_COMMAND_MEMORY,
+    };
+    struct vpci_header *header =3D NULL;
+    unsigned int i;
+
+    if ( !pdev )
+        return false;
+
+    read_lock(&v->domain->pci_lock);
+    header =3D &pdev->vpci->header;
+    for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
     {
-        struct map_data data =3D {
-            .d =3D v->domain,
-            .map =3D v->vpci.cmd & PCI_COMMAND_MEMORY,
-        };
-        int rc =3D rangeset_consume_ranges(v->vpci.mem, map_range, &data);
+        struct vpci_bar *bar =3D &header->bars[i];
+        int rc;
+
+        if ( rangeset_is_empty(bar->mem) )
+            continue;
+
+        rc =3D rangeset_consume_ranges(bar->mem, map_range, &data);
=20
         if ( rc =3D=3D -ERESTART )
+        {
+            read_unlock(&v->domain->pci_lock);
             return true;
+        }
=20
-        write_lock(&v->domain->pci_lock);
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
         if ( rc )
-            /*
-             * FIXME: in case of failure remove the device from the domain=
.
-             * Note that there might still be leftover mappings. While thi=
s is
-             * safe for Dom0, for DomUs the domain will likely need to be
-             * killed in order to avoid leaking stale p2m mappings on
-             * failure.
-             */
-            vpci_deassign_device(v->vpci.pdev);
-        write_unlock(&v->domain->pci_lock);
+        {
+            spin_lock(&pdev->vpci->lock);
+            /* Disable memory decoding unconditionally on failure. */
+            modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
+                            false);
+            spin_unlock(&pdev->vpci->lock);
+
+            v->vpci.pdev =3D NULL;
+
+            read_unlock(&v->domain->pci_lock);
+
+            if ( is_hardware_domain(v->domain) )
+            {
+                write_lock(&v->domain->pci_lock);
+                vpci_deassign_device(v->vpci.pdev);
+                write_unlock(&v->domain->pci_lock);
+            }
+            else
+            {
+                domain_crash(v->domain);
+            }
+            return false;
+        }
     }
+    read_unlock(&v->domain->pci_lock);
+
+    v->vpci.pdev =3D NULL;
+
+    spin_lock(&pdev->vpci->lock);
+    modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
+    spin_unlock(&pdev->vpci->lock);
=20
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
@@ -225,10 +263,12 @@ static int __init apply_map(struct domain *d, const s=
truct pci_dev *pdev,
 }
=20
 static void defer_map(struct domain *d, struct pci_dev *pdev,
-                      struct rangeset *mem, uint16_t cmd, bool rom_only)
+                      uint16_t cmd, bool rom_only)
 {
     struct vcpu *curr =3D current;
=20
+    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
+
     /*
      * FIXME: when deferring the {un}map the state of the device should no=
t
      * be trusted. For example the enable bit is toggled after the device
@@ -236,7 +276,6 @@ static void defer_map(struct domain *d, struct pci_dev =
*pdev,
      * started for the same device if the domain is not well-behaved.
      */
     curr->vpci.pdev =3D pdev;
-    curr->vpci.mem =3D mem;
     curr->vpci.cmd =3D cmd;
     curr->vpci.rom_only =3D rom_only;
     /*
@@ -250,33 +289,33 @@ static void defer_map(struct domain *d, struct pci_de=
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
=20
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
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
+     * First fill the rangesets with the BAR of this device or with the RO=
M
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
@@ -292,14 +331,31 @@ static int modify_bars(const struct pci_dev *pdev, ui=
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
+            struct vpci_bar *prev_bar =3D &header->bars[j];
+
+            if ( rangeset_is_empty(prev_bar->mem) )
+                continue;
+
+            rc =3D rangeset_remove_range(prev_bar->mem, start, end);
+            if ( rc )
+            {
+                gprintk(XENLOG_WARNING,
+                       "%pp: failed to remove overlapping range [%lx, %lx]=
: %d\n",
+                        &pdev->sbdf, start, end, rc);
+                return rc;
+            }
+        }
     }
=20
     /* Remove any MSIX regions if present. */
@@ -309,14 +365,21 @@ static int modify_bars(const struct pci_dev *pdev, ui=
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
+                gprintk(XENLOG_WARNING,
+                       "%pp: failed to remove MSIX table [%lx, %lx]: %d\n"=
,
+                        &pdev->sbdf, start, end, rc);
+                return rc;
+            }
         }
     }
=20
@@ -356,27 +419,34 @@ static int modify_bars(const struct pci_dev *pdev, ui=
nt16_t cmd, bool rom_only)
=20
             for ( i =3D 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
             {
-                const struct vpci_bar *bar =3D &tmp->vpci->header.bars[i];
-                unsigned long start =3D PFN_DOWN(bar->addr);
-                unsigned long end =3D PFN_DOWN(bar->addr + bar->size - 1);
-
-                if ( !bar->enabled ||
-                     !rangeset_overlaps_range(mem, start, end) ||
-                     /*
-                      * If only the ROM enable bit is toggled check agains=
t
-                      * other BARs in the same device for overlaps, but no=
t
-                      * against the same ROM BAR.
-                      */
-                     (rom_only && tmp =3D=3D pdev && bar->type =3D=3D VPCI=
_BAR_ROM) )
+                const struct vpci_bar *remote_bar =3D &tmp->vpci->header.b=
ars[i];
+                unsigned long start =3D PFN_DOWN(remote_bar->addr);
+                unsigned long end =3D PFN_DOWN(remote_bar->addr +
+                                             remote_bar->size - 1);
+
+                if ( !remote_bar->enabled )
                     continue;
=20
-                rc =3D rangeset_remove_range(mem, start, end);
-                if ( rc )
+                for ( j =3D 0; j < ARRAY_SIZE(header->bars); j++)
                 {
-                    printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: =
%d\n",
-                           start, end, rc);
-                    rangeset_destroy(mem);
-                    return rc;
+                    const struct vpci_bar *bar =3D &header->bars[j];
+                    if ( !rangeset_overlaps_range(bar->mem, start, end) ||
+                         /*
+                          * If only the ROM enable bit is toggled check ag=
ainst
+                          * other BARs in the same device for overlaps, bu=
t not
+                          * against the same ROM BAR.
+                          */
+                         (rom_only && tmp =3D=3D pdev && bar->type =3D=3D =
VPCI_BAR_ROM) )
+                        continue;
+
+                    rc =3D rangeset_remove_range(bar->mem, start, end);
+                    if ( rc )
+                    {
+                        gprintk(XENLOG_WARNING,
+                                "%pp: failed to remove [%lx, %lx]: %d\n",
+                                &pdev->sbdf, start, end, rc);
+                        return rc;
+                    }
                 }
             }
         }
@@ -400,10 +470,10 @@ static int modify_bars(const struct pci_dev *pdev, ui=
nt16_t cmd, bool rom_only)
          * will always be to establish mappings and process all the BARs.
          */
         ASSERT((cmd & PCI_COMMAND_MEMORY) && !rom_only);
-        return apply_map(pdev->domain, pdev, mem, cmd);
+        return apply_map(pdev->domain, pdev, cmd);
     }
=20
-    defer_map(dev->domain, dev, mem, cmd, rom_only);
+    defer_map(dev->domain, dev, cmd, rom_only);
=20
     return 0;
 }
@@ -595,6 +665,20 @@ static void cf_check rom_write(
         rom->addr =3D val & PCI_ROM_ADDRESS_MASK;
 }
=20
+static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *b=
ar,
+                            unsigned int i)
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
@@ -675,6 +759,10 @@ static int cf_check init_bars(struct pci_dev *pdev)
         else
             bars[i].type =3D VPCI_BAR_MEM32;
=20
+        rc =3D bar_add_rangeset(pdev, &bars[i], i);
+        if ( rc )
+            return rc;
+
         rc =3D pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
                               (i =3D=3D num_bars - 1) ? PCI_BAR_LAST : 0);
         if ( rc < 0 )
@@ -725,6 +813,12 @@ static int cf_check init_bars(struct pci_dev *pdev)
                                    rom_reg, 4, rom);
             if ( rc )
                 rom->type =3D VPCI_BAR_EMPTY;
+            else
+            {
+                rc =3D bar_add_rangeset(pdev, rom, i);
+                if ( rc )
+                    return rc;
+            }
         }
     }
     else
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 135d390218..412685f41d 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -38,6 +38,8 @@ extern vpci_register_init_t *const __end_vpci_array[];
=20
 void vpci_deassign_device(struct pci_dev *pdev)
 {
+    unsigned int i;
+
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
=20
     if ( !has_vpci(pdev->domain) || !pdev->vpci )
@@ -63,6 +65,10 @@ void vpci_deassign_device(struct pci_dev *pdev)
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
index 89f1e27f4f..d77a6f9506 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -72,6 +72,7 @@ struct vpci {
             /* Guest address. */
             uint64_t guest_addr;
             uint64_t size;
+            struct rangeset *mem;
             enum {
                 VPCI_BAR_EMPTY,
                 VPCI_BAR_IO,
@@ -156,7 +157,6 @@ struct vpci {
=20
 struct vpci_vcpu {
     /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
-    struct rangeset *mem;
     struct pci_dev *pdev;
     uint16_t cmd;
     bool rom_only : 1;
--=20
2.41.0

