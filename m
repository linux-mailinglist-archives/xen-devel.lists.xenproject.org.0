Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AFA72DF95
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:33:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548006.855784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91KW-0003mv-0W; Tue, 13 Jun 2023 10:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548006.855784; Tue, 13 Jun 2023 10:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91KV-0003hc-R3; Tue, 13 Jun 2023 10:32:51 +0000
Received: by outflank-mailman (input) for mailman id 548006;
 Tue, 13 Jun 2023 10:32:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aRu4=CB=epam.com=prvs=05285d8c61=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1q91KT-0001il-Km
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:32:49 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a33706d1-09d5-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 12:32:47 +0200 (CEST)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 35DAO5Ke019280;
 Tue, 13 Jun 2023 10:32:38 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3r5yahmgn9-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 10:32:37 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB9706.eurprd03.prod.outlook.com (2603:10a6:10:44e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 13 Jun
 2023 10:32:32 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51%5]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 10:32:32 +0000
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
X-Inumbo-ID: a33706d1-09d5-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i682FnO/2vFekdQsH3XqEGLFo7+c87BEyM7znEYjuBIMEoCFzw7bLDfQJpDL9XASAuYmVXsJnCQ5OI1jV9woXxZJ4CUEPSkZWX8ASCcq0Us1EyHYz4RHPSfC4mJNzcFEHcNsiVz5rgaoovAdIzyMffHye+uGPW8xUzqUx7xGHWFVwt8EdkfWDnncQ8+3oY2tT5xM3QJVvz/tkyYhZlS4p+AP8hprDe4ye7OGd7odyJ9Lg1STNTumJW/X5xmtZgxTKe/6uLztztpZ5U2JBVgf3KpZhVMWPBkJ950rRuZtEbKXOwL4vVOu2nNyv3OAM/ezlvI28dQb5oPAJZquUEr/xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fpDlfsuLlhQ46EF1ZKjojVmfi+Mg0Uj5DZlq5hKl7Q=;
 b=CVziUQyJa5V5DbfS8EB8w4vSquLqS+7z3YSZX9BZzIvSc2q81SfQSCavXa68GHUyR8Mlg2DTNoo/fwGZHp2X+20Xu31gvBRQGc9Z/bWM59TJ9BfJDjymVeJ0aLwEu3+YvBxT+7EIJFMQt2jX/cNEkGQIApzc9esh5Qb6DY9E3UTFZO8SIiy4lg9wvSTY+hjNB2CzSbBmq5eOfc/+ojmRFVV5V1ycaQObXRCcI1n1OE97rKjnx8xxmAGUrZpGTRYRbCB2bRJ+60aOjpzIabsk5zhbXXaUMF+/9MHRGQdM7WMDWD/7ba2y7FbjbDWbZWhJEwJaghrPAEyM18yb4r69hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fpDlfsuLlhQ46EF1ZKjojVmfi+Mg0Uj5DZlq5hKl7Q=;
 b=HENW7E5vrl3CxFPEySgDfxfVQORodNhMPjHsgeaF4iQ7CzssAMp7pBFzJdoRtixln6rICsJoDF2oq/WblD24sqQWZlMSczzrqi9v5/Uw5LCFwSrt7dmif97WhZ5u7sWRBShrgbm177D3NaM/nd/Bpd1UUF60lv10TWPFtwHFtLRTBhjauzDNO5WoHHLiKA4JzcOwms/VoKQA3CkRW4NpHXyAIg6ofPQehwG6pYqwvbPFhKqoaxnFQ+IDmO9oL3rXqNUF7pBrQU+sSQfB/O8YihMxMG3JNrY3qTFxRZLCiIgaLWSFmPjR0WJleZI5Z51tlEaWR+RdCFanZub65R79hA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v7 06/12] vpci/header: handle p2m range sets per BAR
Thread-Topic: [PATCH v7 06/12] vpci/header: handle p2m range sets per BAR
Thread-Index: AQHZneJa4eA0vie3HEayzZAXloxz2A==
Date: Tue, 13 Jun 2023 10:32:28 +0000
Message-ID: <20230613103159.524763-7-volodymyr_babchuk@epam.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.40.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB9706:EE_
x-ms-office365-filtering-correlation-id: e3cfede5-87c7-42e5-bc26-08db6bf97edd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xNaS5P8be9C7m7mg/jCOzLJITnRwmkpjUyaQDXTw0vA02LJfEGHOLd6iN0o4fp0eu6Zpvm98NkazNj8ayT8Ej7l5sO1ZuWUfhiHpUl+1EyIKYsVYn4+WS27EffRcHuJc+hrPbW50XEIeLyHxx8ebF9rtmgheqXRoDT0iqSMc4qBUWUlm789wDyN0S4g6/NDAdDDv0TVFQfVkc77WcddDySgq9QnpeRoHsXC4RqyMccvZC9gU6KfcClx/S55JSxeb6Vy/kWgB+1Tn9ESz2DUXlPvVOTpQUIfi9WdpsTWMgT9H24Pxy3OTJBDby9gl/E61cTf9Mpyz/W938/Tu3eVPkNNHcGwwLIRrtLMskSmzmTfXrIuAknp/pWYgbmGmgMeT/sXP41TFeePGUyF9RcphRv2dnqaK0dFr0uf6WZ3wdtmnxOXsyUYf49puwAJuLDicKgX6O14I/PfYK/wMrQMCIXseMMeW7vf7q+Zb1qnpx3+s1KUcctTbGDDYSKnU+FZ7P/wKKNehaxwpmcdmZ1Dc+8lWSgWajTm5yYNe64lUxGgwKXUm815YyZPYZnMS88yqpyh3hFSCDqEZheq0cebtWLTK4Ntk3NqPSDCQZ7K2Bkihw0NmqUGIqnmu1rvbgEsZ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(91956017)(64756008)(76116006)(66556008)(66446008)(4326008)(6916009)(66476007)(71200400001)(5660300002)(66946007)(41300700001)(8936002)(8676002)(316002)(36756003)(54906003)(30864003)(83380400001)(478600001)(2906002)(6486002)(38100700002)(6666004)(186003)(6506007)(26005)(1076003)(6512007)(86362001)(55236004)(38070700005)(2616005)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?FeHgA9GOlWEF2kYD8c9JZF8O7gJwdNUSg71a/V+n5a4zaZuw3NUcNUVKNf?=
 =?iso-8859-1?Q?tv5vAMXYS/MvnScfFgZx8IaqrTBiNmdMl1/M1HlCvA6NgGiFp4M1Mvz3n3?=
 =?iso-8859-1?Q?OXjOATXiwS5Ys+ZCR1U8zuUX+Q7kGm80S8Q3ZeC8eQpz+J205II/TI4hq1?=
 =?iso-8859-1?Q?FR1mhJNAY/GQxLCOlFVpsSV+xP8eEIf5UoZaAJVQZUO3oMkDwjXh9T2OCs?=
 =?iso-8859-1?Q?hPs7C0RDibXf9vwC/+ILjH/PzNEhown44AsDKAywK3lkT71i75k671fs2K?=
 =?iso-8859-1?Q?9wArfD+dHKZJoDp/nGeQMVw5OsmXER9UcE/Trcw4/6j8phHb3vSMySc3K0?=
 =?iso-8859-1?Q?7PbdD02dhZ0vJK+L8GAC9rOb/Lxg7JPlBE8tJRqie2OcblK2rpaUPY6MVN?=
 =?iso-8859-1?Q?OvRCHGrDpGw+21vPAgItln18l8jkn8AurSkdTo8M/alEmZJiOfGq0Modik?=
 =?iso-8859-1?Q?MbbhAca760gEsQTuXlXV36RG56f1l7xNzhdZVCrFrL0OJ2Il4HpAFSTYPh?=
 =?iso-8859-1?Q?g7FoBwaiQ0TB2jLDMGZGX0msNjvSrO88Mf97LIHLjY/rDrbPdnmrBx1Z3a?=
 =?iso-8859-1?Q?KpopUtt9A/OgobwuFTtTeOmnsRcP/+dvRdelIks8FjzMkKXrt7+QQEkFBl?=
 =?iso-8859-1?Q?7KbVTYZ+j/z5qjIihfMfivvFWNyNLskuiBlCosYWToXc/Z5uw3R342vtoP?=
 =?iso-8859-1?Q?4l/HRx3rO0crLZJUUBrcQKgwOKaMODRnoVoODvdw2QEQhyFff1fvzLEL3M?=
 =?iso-8859-1?Q?4XGRwbHp97+gp5gV95Te/XsfHjWaiQrsRXi/+Y2Re1Ipjo2i+hINAcYw1T?=
 =?iso-8859-1?Q?uOWDJxaRXsiNwvIf+ebWps4YGtCRZP7L2J0r9Cf9SKi0PFXiyU7vZOkFQ2?=
 =?iso-8859-1?Q?Arq96KHciUV4xQ1dmRWzWBxS80hnzK0vFm5aHxsy6flB89vqGWz/TC+xGK?=
 =?iso-8859-1?Q?DAo+PLY0nWdN4gIDK1I8PRgZxkm8v4Al6zwqjDn8VJskhZsPJjzCvMtRrt?=
 =?iso-8859-1?Q?Sokto8pNAlSXLPW0LQ4a/TXQOcvClS24Nt/saaNivTfCs3kH5igpdipib8?=
 =?iso-8859-1?Q?IaHQKXj8U4H4ZYwnMmci4YNmrjofx7kTuYPKI42O6ZBW3IJjaaAxWBWMgd?=
 =?iso-8859-1?Q?HdLllb/bJ/IpPzyfCRc7qpk2D/gAnpJd46fyQ2YNUHsBlbaOsXgLm0KAG6?=
 =?iso-8859-1?Q?tT8kBEr1ehJ41wZETETYREZja4+qOMwGiTJCvpmujWyOOy/Y/31N3Cq2JN?=
 =?iso-8859-1?Q?gzjoHuGxAXGXxSHcsz3WMEhkzf2wdjSKPVSle4tEfTEyjMLKzGVsh0v4Xc?=
 =?iso-8859-1?Q?kAfMIqeTdeyOSpQY5pqeb3j0/ocsFA2i3Yf2uMGC+OwQrxQB2LFms1KzkA?=
 =?iso-8859-1?Q?YztSHsEctQY63uIa5uNVOAfUFzDflZqq21JpgfIoivOsfPYnTZ17AoU1Fj?=
 =?iso-8859-1?Q?L388DfztdcTt5EovtqFeDDLNMsyCK+HPo3cjAosmmzbQjZxLyQosaJ+LYv?=
 =?iso-8859-1?Q?NtN2D7yiUmtS7jnvVDlgE1YRZiOCWMWwi4ckT3NmnajXiMXFoYV7ybgTlY?=
 =?iso-8859-1?Q?ArFSXwcMF/FoMxuPGrH+mu528JtrlhIMDuYbT5oOBnVqjA1NWW4+QxiHO5?=
 =?iso-8859-1?Q?gThAMkh7n15tnbgOWZxozCbfXnaVD/9nWwJ1WRzACroZUGKI9+nLVBRg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3cfede5-87c7-42e5-bc26-08db6bf97edd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 10:32:28.4558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XsvG42tA7LQvOIzfliyyp11pXyvMgLeAvLkKvNclUWNmdqFsJRat6NphIucuHL+y4cQHH+T8wekFpeTNQOD9EOKVHxmUTWtCLgm4gc+Axa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9706
X-Proofpoint-GUID: Rm6fJ6vrkbwmHxpQZIsvhvklPZFcNp2N
X-Proofpoint-ORIG-GUID: Rm6fJ6vrkbwmHxpQZIsvhvklPZFcNp2N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_04,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306130093

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
 xen/drivers/vpci/header.c | 238 +++++++++++++++++++++++++++-----------
 xen/drivers/vpci/vpci.c   |   5 +
 xen/include/xen/vpci.h    |   3 +-
 3 files changed, 180 insertions(+), 66 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 8eebbf968b..8e722857d6 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -141,63 +141,102 @@ static void modify_decoding(const struct pci_dev *pd=
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
+    read_lock(&v->domain->vpci_rwlock);
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
-
-        read_lock(&v->domain->vpci_rwlock);
-        spin_lock(&v->vpci.pdev->vpci->lock);
-        /* Disable memory decoding unconditionally on failure. */
-        modify_decoding(v->vpci.pdev,
-                        rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.c=
md,
-                        !rc && v->vpci.rom_only);
-        spin_unlock(&v->vpci.pdev->vpci->lock);
-        read_unlock(&v->domain->vpci_rwlock);
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
+        struct vpci_header *header =3D &pdev->vpci->header;
+        unsigned int i;
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
+                read_unlock(&v->domain->vpci_rwlock);
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
+                read_unlock(&v->domain->vpci_rwlock);
+
+                if ( is_hardware_domain(v->domain) )
+                    vpci_remove_device(pdev);
+                else
+                    domain_crash(v->domain);
+
+                return false;
+            }
+        }
+
+        v->vpci.map_pending =3D false;
     }
=20
+    read_unlock(&v->domain->vpci_rwlock);
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
     ASSERT(rw_is_write_locked(&d->vpci_rwlock));
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
-        write_unlock(&d->vpci_rwlock);
-        process_pending_softirqs();
-        write_lock(&d->vpci_rwlock);
-    }
+        struct vpci_bar *bar =3D &header->bars[i];
+
+        if ( rangeset_is_empty(bar->mem) )
+            continue;
=20
-    rangeset_destroy(mem);
+        while ( (rc =3D rangeset_consume_ranges(bar->mem, map_range,
+                                              &data)) =3D=3D -ERESTART )
+        {
+            /*
+             * It's safe to drop and reacquire the lock in this context
+             * without risking pdev disappearing because devices cannot be
+             * removed until the initial domain has been started.
+             */
+            write_unlock(&d->vpci_rwlock);
+            process_pending_softirqs();
+            write_lock(&d->vpci_rwlock);
+        }
+    }
     if ( !rc )
         modify_decoding(pdev, cmd, false);
=20
@@ -205,10 +244,12 @@ static int __init apply_map(struct domain *d, const s=
truct pci_dev *pdev,
 }
=20
 static void defer_map(struct domain *d, struct pci_dev *pdev,
-                      struct rangeset *mem, uint16_t cmd, bool rom_only)
+                      uint16_t cmd, bool rom_only)
 {
     struct vcpu *curr =3D current;
=20
+    ASSERT(!!rw_is_write_locked(&pdev->domain->vpci_rwlock));
+
     /*
      * FIXME: when deferring the {un}map the state of the device should no=
t
      * be trusted. For example the enable bit is toggled after the device
@@ -216,7 +257,7 @@ static void defer_map(struct domain *d, struct pci_dev =
*pdev,
      * started for the same device if the domain is not well-behaved.
      */
     curr->vpci.pdev =3D pdev;
-    curr->vpci.mem =3D mem;
+    curr->vpci.map_pending =3D true;
     curr->vpci.cmd =3D cmd;
     curr->vpci.rom_only =3D rom_only;
     /*
@@ -231,30 +272,31 @@ static void defer_map(struct domain *d, struct pci_de=
v *pdev,
 static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_=
only)
 {
     struct vpci_header *header =3D &pdev->vpci->header;
-    struct rangeset *mem =3D rangeset_new(NULL, NULL, 0);
     struct pci_dev *tmp, *dev =3D NULL;
     const struct vpci_msix *msix =3D pdev->vpci->msix;
-    unsigned int i;
+    unsigned int i, j;
     int rc;
-
-    if ( !mem )
-        return -ENOMEM;
+    bool map_pending;
=20
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
@@ -270,14 +312,31 @@ static int modify_bars(const struct pci_dev *pdev, ui=
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
@@ -287,14 +346,21 @@ static int modify_bars(const struct pci_dev *pdev, ui=
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
@@ -327,7 +393,8 @@ static int modify_bars(const struct pci_dev *pdev, uint=
16_t cmd, bool rom_only)
             unsigned long start =3D PFN_DOWN(bar->addr);
             unsigned long end =3D PFN_DOWN(bar->addr + bar->size - 1);
=20
-            if ( !bar->enabled || !rangeset_overlaps_range(mem, start, end=
) ||
+            if ( !bar->enabled ||
+                 !rangeset_overlaps_range(bar->mem, start, end) ||
                  /*
                   * If only the ROM enable bit is toggled check against ot=
her
                   * BARs in the same device for overlaps, but not against =
the
@@ -336,12 +403,11 @@ static int modify_bars(const struct pci_dev *pdev, ui=
nt16_t cmd, bool rom_only)
                  (rom_only && tmp =3D=3D pdev && bar->type =3D=3D VPCI_BAR=
_ROM) )
                 continue;
=20
-            rc =3D rangeset_remove_range(mem, start, end);
+            rc =3D rangeset_remove_range(bar->mem, start, end);
             if ( rc )
             {
                 printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n=
",
                        start, end, rc);
-                rangeset_destroy(mem);
                 pcidevs_unlock();
                 return rc;
             }
@@ -362,10 +428,23 @@ static int modify_bars(const struct pci_dev *pdev, ui=
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
@@ -556,6 +635,19 @@ static void cf_check rom_write(
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
@@ -639,6 +731,13 @@ static int cf_check init_bars(struct pci_dev *pdev)
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
@@ -690,6 +789,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
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
=20
             header->rom_reg =3D rom_reg;
         }
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 4182c65eaa..b542ddaf7b 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -39,6 +39,7 @@ extern vpci_register_init_t *const __end_vpci_array[];
 void vpci_remove_device(struct pci_dev *pdev)
 {
     struct vpci *vpci;
+    unsigned int i;
=20
     if ( !has_vpci(pdev->domain) )
         return;
@@ -73,6 +74,10 @@ void vpci_remove_device(struct pci_dev *pdev)
             if ( pdev->vpci->msix->table[i] )
                 iounmap(pdev->vpci->msix->table[i]);
     }
+
+    for ( i =3D 0; i < ARRAY_SIZE(vpci->header.bars); i++ )
+        rangeset_destroy(vpci->header.bars[i].mem);
+
     xfree(vpci->msix);
     xfree(vpci->msi);
     xfree(vpci);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index e9170cc8ca..1e42a59c1d 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -75,6 +75,7 @@ struct vpci {
             /* Guest view of the BAR: address and lower bits. */
             uint64_t guest_reg;
             uint64_t size;
+            struct rangeset *mem;
             enum {
                 VPCI_BAR_EMPTY,
                 VPCI_BAR_IO,
@@ -162,9 +163,9 @@ struct vpci {
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
2.40.1

