Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 916897C7952
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 00:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616076.957895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3sD-0004OU-Bi; Thu, 12 Oct 2023 22:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616076.957895; Thu, 12 Oct 2023 22:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3sD-0004JQ-6v; Thu, 12 Oct 2023 22:09:41 +0000
Received: by outflank-mailman (input) for mailman id 616076;
 Thu, 12 Oct 2023 22:09:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hhgq=F2=epam.com=prvs=4649fa389a=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qr3sA-00016v-2l
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 22:09:38 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06aca185-694c-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 00:09:35 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39CKqPBg007501; Thu, 12 Oct 2023 22:09:32 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3tpr7cr8ed-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Oct 2023 22:09:32 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB8758.eurprd03.prod.outlook.com (2603:10a6:20b:53e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.41; Thu, 12 Oct
 2023 22:09:25 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076%4]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 22:09:19 +0000
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
X-Inumbo-ID: 06aca185-694c-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaNcNbe3UpKnrgHa3nrz9oOl2Vy+susreq27CaTZJj9u2jGjfLi6ObtW4P+JMm3uO502xVSAzmvfuAhUevajU1nRMSYO9FziXkqe2IT6zszxv9FJzYsDIkZFr6Y4cU2qcjdM21pWjDzCFxen6bv5GIilx17kCATnq51pRP/nkML5UjIuR5zhyJ22Xv+m8/ir5USK+QYR/YFpa9Oetm2G0Rv1o5G49nKsq0WaU9tW7jcpRLy1xdgQ48rkl46y5AbSAf77g311CFogdMp5DF568EPyj2/fVkJ+QacXNb8pSp2JZrpKy1tFvE0saHC9HmXFhXenlcgDAXZfq6jr2Ty/8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRrQIG2V9z8F0Ugjpn5uJ8rRJhFipg3lIxGypqk3JAM=;
 b=cASQHk4D/LfgjcZkc7yP1DafXTnNx5OtLu4GBSsFfaSGMDmf77j21xNQLhHXiTheC/Fyhi39LQD0KDy5SknhU5Uy6K+JjmN6QcnDem8OTVu/Ap0ahriwE8cCQjDjbBDVd2m1jKx6Djv0kKa0o2XOjTdVkEomVDZS6EJ8LiR4Hka+64RX/8qnVkaObpd0GERIZJLS8T4mUKHmKelDtgluKtEW3hTU40Uw8fZYJxuA66Bj/PcM0FsGkU/hlrW5yBZZMyQ03f7kaXSCeb2KBVielsBD0YWP5t7IRRs1f3BGCRQFD9j6DlkbzudsQMHSH63yxYP/pvkR/LGRRR6mecM/rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRrQIG2V9z8F0Ugjpn5uJ8rRJhFipg3lIxGypqk3JAM=;
 b=aQGJ9YDQJ/ZhLyA9sBWFVCaW/x1a4kT47xuQw4JE8lNl4Ijc7yvOaYAFZutCMb2UJTawhSqOmPposlBOeJreYrbAdOauKQOqbnMPM+e5rnVtSK680m8grPHSFb9GN8IbSED8BKnwQk8DngJZ7scG3SRVsLaEoUj3P+IZ82LxCcOE6nnE1UpzPHDcTfApPcTgaeAdFjnfSBmd4z/LNuhh9AtjImIlR9ozi0pdTjkaOoaD1nL6pwgi0Q+qSZ621sLTBwE2qs0slYpXpwVKQiy10ZTtICa58ympPN3cXrBvc+aYUnEwUCkBPg2WqHavuHrOtm/JXHUOlAh9v88FZ3RmKw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v10 10/17] vpci/header: handle p2m range sets per BAR
Thread-Topic: [PATCH v10 10/17] vpci/header: handle p2m range sets per BAR
Thread-Index: AQHZ/Vi+Y1LP9L+txUiVfqLkjSET0g==
Date: Thu, 12 Oct 2023 22:09:17 +0000
Message-ID: <20231012220854.2736994-11-volodymyr_babchuk@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB8758:EE_
x-ms-office365-filtering-correlation-id: b5a8b96e-dc9d-4030-7085-08dbcb6fe1a6
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +Fv8StPi9fs0dNdHZkYK/8YwBkxg/0pjjnMBOrB55iGM1J9b2xA9Hh6/RFIUGtWOtwPVDrHW+QGQBp7fLFKLp3KGdaJPYMgWXVNQ0eUSwdqDUxukKc5o0KHFm1Eoer4Y7w0D7tPHJB/gU0iC6Vb8mV61hllfA9zNyDR4/wtXvG78J+roTsPFuU3dlQB8P6haeZhjzbKA7AX1BtYpMnotdcj8TiCfT9coucBzCwZN5k844hQ/vabFfb10nac66DuB26DUxl+nltHuOeX13lWai7BYnbVO6e1DYrr6spXlUv6HNplArbTHKu2R/dtgLVy8YEXJIH0UuyEWv/4CLnSSi79AJ4/YYXJmjdd6GICd+gE3WOTRUEgowYY0bKltTei70T+Cjki6XEK/azAxJu/gWLed6WFlJ4OFajt2ussHHWPWyieC25MXsl1RC92H6JbLdL2+qTLChxfstIqR6v2qEe50UieUGrCasq6RPmvieaMwJYMjwfmr+rLrXIVZEVszqZ7IUQu0IhmmJOrNbvElqItCqmQkOdQ0XykZBWkYw+nDCkNRyowhWUPol5lcwUx6d40II2XaPTFEhSV1z04vQwj6g/h7JXLwo1ihj34/IkEL5N94q5PNKzRs9tK+tKzU
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(38070700005)(6916009)(5660300002)(41300700001)(316002)(83380400001)(86362001)(122000001)(38100700002)(66446008)(71200400001)(6486002)(26005)(1076003)(2616005)(54906003)(478600001)(76116006)(66556008)(66946007)(66476007)(64756008)(91956017)(2906002)(8936002)(8676002)(36756003)(30864003)(6512007)(55236004)(6506007)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?A6BoYlf4Yl4hwQ+zXyqY1iuOIGy+n6Rp9NQXmrZuN8BIrL8XEWnsBd6yuN?=
 =?iso-8859-1?Q?Z5K0YGaud0GLZVUpnasO6BPKDE9Q2wZKbaEKZSd15LyDBSJQAzMVxMo0Nz?=
 =?iso-8859-1?Q?dR2IHwKjR7N443qPPD04tHDbh8VovPdhPl/Yuc+YkfOfx5AvkhZ8RWR2wd?=
 =?iso-8859-1?Q?Qeju8wcH/rQ2IRCB0hauAnU57T0yIpm++G7TLfFC1aJsC+BJYmj8haXtdj?=
 =?iso-8859-1?Q?zP6D0BKWa+RDNbaxqgn9C/FIXftSW+D1nL3Zy1WAQJfJXM05V7zlXiljS6?=
 =?iso-8859-1?Q?kJ42fmCgJjusWkI2SN6kSdzGPjWm+QUIdC+p1F6wyqKI4rjcDeYsfUD8GX?=
 =?iso-8859-1?Q?JKzA5/mvA90A9gvZPDJomOCsSPHMMuwR+qkSyRWGSe54E3lyzfs6QbC4+Y?=
 =?iso-8859-1?Q?KyYTKXvST+0HCvqU2uc+a9JGGfBG/H6RLYR3koECCrHqjUoFs7XrsVompp?=
 =?iso-8859-1?Q?xb/2WwQ+3jSkgQU2kpu5YBN6U0kirAGRO6cmhZUCrS8550E2B8I+H7NAd9?=
 =?iso-8859-1?Q?/mMNwpPJv8jS+B0J/8Wdh97yuA8ihh/QxXa8YhFq7vdMogatVL9yz27i16?=
 =?iso-8859-1?Q?BoP9rbB+EpWrtYUZPdCXDY7OsX+F9QZ90jymcLj8vPiHpU0aMAIQzoKiIT?=
 =?iso-8859-1?Q?JfutnWCexONh+VzXSaziEoypzuJ9In9xznb0zgir+OQBlfvdnEjtTCkSC0?=
 =?iso-8859-1?Q?6AtQs25td6GKA758crUulhSmhQL49LmHGZXkXRFyFs4NNEPzLIsg3VwHxT?=
 =?iso-8859-1?Q?0+97fKdNrzmwa5QCc3Jdp8S6iyyV5HeLCvvBb0RUwGoPB4NMyX8juf3c8z?=
 =?iso-8859-1?Q?wOKiHfoUkJlh+5CIOaFaaNa47q5Bl7W/2+D9QRqcTc6trHbycpJpULS9GE?=
 =?iso-8859-1?Q?ABXGwB7Hoek6n76g79RhidMqIHi5rs4ltO8QccqzGLMBDY3WXKDE/OjmPQ?=
 =?iso-8859-1?Q?bAcnVEffHFJyyhXDWyNSYbP75ZYBGE66ODRv7mI9oV4mAaxIwzm3eZ7b4Z?=
 =?iso-8859-1?Q?7dNv2gmDFtjpCuiDLkEkv3DpE1g0R+XklFTDt2qVHgI3/p71KHZcMX1UhT?=
 =?iso-8859-1?Q?8nc9M2UXSB+V9dA/m5sAeGA+DuCOmEMWSn5FwQ0o9CEoZNZSOMnzS4Zonm?=
 =?iso-8859-1?Q?haL3QCr3scIT4V4/FLK/T8Zo2cU9SxidJ0r5dKce7Z48BBY3OQMnrrJZFy?=
 =?iso-8859-1?Q?t+0xNS0CtSOs/qBoIxduvlj0wbkl3bitmYhCing7vPrXubQouPd+5apgs/?=
 =?iso-8859-1?Q?4OFs3mH8bcGWd1js77t9c6H5RNdSLhH5rtZTD/VTX4AvCgCvlY7AAjsZ3g?=
 =?iso-8859-1?Q?S2diy8NTlZGmh0xf+EREqAOSVnQFs7ZBYrWjzQ3lsv0tJlN8OKZnR03dAW?=
 =?iso-8859-1?Q?NzqPAB+6R0ypJJ+l3+FVpfuFo5aeX8HNmqJS8k+XW/g7qLe5jFYaTEdYm3?=
 =?iso-8859-1?Q?lIwjLJHFOlT8NHbeWiGVzsU/hxIVE6U+gTWy0Q/TUSHop4VUO7/CM33rd9?=
 =?iso-8859-1?Q?7+oACnxy908eNVhE6yDhFEeSJYfJgfx/sa34WR+3zzcRR8ztjY4fkcgJSq?=
 =?iso-8859-1?Q?SDYlW8xdcnnCmx/9XV9UNCC/JGL7d4JjWbKjcS0lOkwGYp8XSQsgjL4lVj?=
 =?iso-8859-1?Q?JkmYurdOeHlpM8Ier0lEfwN1EAxGclS25QARFbeBsp206N/g8Bdgp8kQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a8b96e-dc9d-4030-7085-08dbcb6fe1a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 22:09:17.4861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2EF5nD5fsGbeDMa+RbYmSOt7+d3btMuHhdjnar5ClRcCexsT6CW27ySb37eTqzWPVevuy4yFNlVHLW2xh1nVFOMxcOWV7/3jwHEL/ALGYb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8758
X-Proofpoint-GUID: 5BoxB-Lt0e24MYwbLkVZvjwROgstqp0F
X-Proofpoint-ORIG-GUID: 5BoxB-Lt0e24MYwbLkVZvjwROgstqp0F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_14,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120186

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
In v10:
- Added additional checks to vpci_process_pending()
- vpci_process_pending() now clears rangeset in case of failure
- Fixed locks in vpci_process_pending()
- Fixed coding style issues
- Fixed error handling in init_bars
In v9:
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
 xen/drivers/vpci/header.c | 256 ++++++++++++++++++++++++++------------
 xen/drivers/vpci/vpci.c   |   6 +
 xen/include/xen/vpci.h    |   2 +-
 3 files changed, 184 insertions(+), 80 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 40d1a07ada..5c056923ad 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -161,63 +161,106 @@ static void modify_decoding(const struct pci_dev *pd=
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
+
+    if ( !pdev->vpci || (v->domain !=3D pdev->domain) )
     {
-        struct map_data data =3D {
-            .d =3D v->domain,
-            .map =3D v->vpci.cmd & PCI_COMMAND_MEMORY,
-        };
-        int rc =3D rangeset_consume_ranges(v->vpci.mem, map_range, &data);
+        read_unlock(&v->domain->pci_lock);
+        return false;
+    }
+
+    header =3D &pdev->vpci->header;
+    for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
+    {
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
+            /* Clean all the rangesets */
+            for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
+                if ( !rangeset_is_empty(header->bars[i].mem) )
+                     rangeset_empty(header->bars[i].mem);
+
+            v->vpci.pdev =3D NULL;
+
+            read_unlock(&v->domain->pci_lock);
+
+            if ( !is_hardware_domain(v->domain) )
+                domain_crash(v->domain);
+
+            return false;
+        }
     }
+    v->vpci.pdev =3D NULL;
+
+    spin_lock(&pdev->vpci->lock);
+    modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
+    spin_unlock(&pdev->vpci->lock);
+
+    read_unlock(&v->domain->pci_lock);
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
     ASSERT(rw_is_write_locked(&d->pci_lock));
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
+            write_unlock(&d->pci_lock);
+            process_pending_softirqs();
+            write_lock(&d->pci_lock);
+        }
+    }
     if ( !rc )
         modify_decoding(pdev, cmd, false);
=20
@@ -225,10 +268,12 @@ static int __init apply_map(struct domain *d, const s=
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
@@ -236,7 +281,6 @@ static void defer_map(struct domain *d, struct pci_dev =
*pdev,
      * started for the same device if the domain is not well-behaved.
      */
     curr->vpci.pdev =3D pdev;
-    curr->vpci.mem =3D mem;
     curr->vpci.cmd =3D cmd;
     curr->vpci.rom_only =3D rom_only;
     /*
@@ -250,33 +294,33 @@ static void defer_map(struct domain *d, struct pci_de=
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
@@ -292,14 +336,31 @@ static int modify_bars(const struct pci_dev *pdev, ui=
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
@@ -309,14 +370,21 @@ static int modify_bars(const struct pci_dev *pdev, ui=
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
@@ -356,27 +424,35 @@ static int modify_bars(const struct pci_dev *pdev, ui=
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
+
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
@@ -400,10 +476,10 @@ static int modify_bars(const struct pci_dev *pdev, ui=
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
@@ -597,6 +673,18 @@ static void cf_check rom_write(
         rom->addr =3D val & PCI_ROM_ADDRESS_MASK;
 }
=20
+static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *b=
ar,
+                            unsigned int i)
+{
+    char str[32];
+
+    snprintf(str, sizeof(str), "%pp:BAR%u", &pdev->sbdf, i);
+
+    bar->mem =3D rangeset_new(pdev->domain, str, RANGESETF_no_print);
+
+    return !bar->mem ? -ENOMEM : 0;
+}
+
 static int cf_check init_bars(struct pci_dev *pdev)
 {
     uint16_t cmd;
@@ -678,6 +766,10 @@ static int cf_check init_bars(struct pci_dev *pdev)
         else
             bars[i].type =3D VPCI_BAR_MEM32;
=20
+        rc =3D bar_add_rangeset(pdev, &bars[i], i);
+        if ( rc )
+            goto fail;
+
         rc =3D pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
                               (i =3D=3D num_bars - 1) ? PCI_BAR_LAST : 0);
         if ( rc < 0 )
@@ -728,6 +820,12 @@ static int cf_check init_bars(struct pci_dev *pdev)
                                    rom_reg, 4, rom);
             if ( rc )
                 rom->type =3D VPCI_BAR_EMPTY;
+            else
+            {
+                rc =3D bar_add_rangeset(pdev, rom, i);
+                if ( rc )
+                    goto fail;
+            }
         }
     }
     else
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index b20bee2b0b..5e34d0092a 100644
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
index 2028f2151f..18a0eca3da 100644
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
2.42.0

