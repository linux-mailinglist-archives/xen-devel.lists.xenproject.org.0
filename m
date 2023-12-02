Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C24C4801972
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 02:27:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645832.1008263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Emv-0002gw-E8; Sat, 02 Dec 2023 01:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645832.1008263; Sat, 02 Dec 2023 01:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Emv-0002Wk-6b; Sat, 02 Dec 2023 01:27:21 +0000
Received: by outflank-mailman (input) for mailman id 645832;
 Sat, 02 Dec 2023 01:27:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVJG=HN=epam.com=prvs=6700ee1bd8=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r9Ems-000272-T2
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 01:27:19 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edc4a75c-90b1-11ee-98e5-6d05b1d4d9a1;
 Sat, 02 Dec 2023 02:27:17 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B1NLGv2008549; Sat, 2 Dec 2023 01:27:14 GMT
Received: from eur03-dba-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2169.outbound.protection.outlook.com [104.47.51.169])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uqfjgj05q-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 02 Dec 2023 01:27:14 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB8599.eurprd03.prod.outlook.com (2603:10a6:10:3e6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Sat, 2 Dec
 2023 01:27:09 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7046.027; Sat, 2 Dec 2023
 01:27:09 +0000
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
X-Inumbo-ID: edc4a75c-90b1-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJ8P1LR0sHZ0c63MAEMiae1onWOKXr68uT2ZXgD/7RSnk/3zwyF/DD/aBZH1CsGHEBJzdPPVwH9hdONRJ73lp/vgYO1GoZ0wylmwMq1axear86DTDrjaMBZ1CQv70imOC8OcXq4j6CAWzzUt1lc+n/XEW3HMpMHAUAqUNE7hNHoqW8K4YKp1PPiGtocp4a8PUiwSAEFXq7aG4aTZmHOAxnWurqcRu3JRK3U/q07MefbhMPIS/Hz7oX9VBDSMi4OatzdZDalI2NPLZqwkozOJZpfU64hDff5PKpLbQh0XR8aVt48DOtcnDPxIJycNQEL/1eDX1/C3h8RLxlgi8Ga2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JZJ4KNkIkIzlijRLVq+YijCSEjROoN8dREC9RVL4YU=;
 b=eU5RxjpI8ooCAk0V2nT0qfntZrlj9CFAcWJ1Fmp49Ffp7EoDVGs1+QqCX7rJtFkResp3oMRGXQ1HSLjz/5oyNrKuvHEXDlCcEFre5KquO5Iv/XGtCPWmgovRkuRTsUr9BnSDFUs+ER6ocpMsSbt4UY++GRKvmpQjz/LlLfoH5uT01wu9IJqlDu9I8yZTTzci9muE85WZTYT9uayjC5pOuRCO29wG2CWJK6//PNIHIyHgMNO97x8BoHuEqqXFGBbnvGoD/qh9pc9URcj8G3SFDbXvXA8T2o5T5wMx8VaFD5ZwJQoQIidLRlkJWn1luoUi2GZOHP5VgiWGvdb3plwWSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JZJ4KNkIkIzlijRLVq+YijCSEjROoN8dREC9RVL4YU=;
 b=Gnrv63yCISztxCQ2XP19Dnfrz17fRPZWzYohEHGTfL/bbgEG0loSmBHO+U8/TABph3rSF9kAr5LSsZKNJ2hedCG2qzOWSwz8kZizaL+RTU5bAUWM9r+G4TStBCdgwnHfdg0e4QRzJZJ+3bfpfFGT4sDETnku1sFj4jMq2RXoFkLYTGEyUVgDM0XrSYFYGLbPqO7ZAB4gcOQs8d2iQKSi0SB7G6boZO3wki+S5rfcv8z33AWR/m1jSSCnxXsL0Etiw+yplrxJ5R6yPxJz9B01BtLoIgQkRwpFN591av7C23cB5RKZA1h63tyqskmq0vsCqI8S1OpWeQbiNpLU5TYZ+g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        "Daniel P. Smith" <dpsmith@apertussolutions.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v11 11/17] vpci/header: program p2m with guest BAR view
Thread-Topic: [PATCH v11 11/17] vpci/header: program p2m with guest BAR view
Thread-Index: AQHaJL6om72B3RYnP0aRq1inaCmShA==
Date: Sat, 2 Dec 2023 01:27:05 +0000
Message-ID: <20231202012556.2012281-12-volodymyr_babchuk@epam.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8599:EE_
x-ms-office365-filtering-correlation-id: 28c3a8a2-7ce8-453b-af25-08dbf2d5cd8e
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 peh66Gl38lFbeQ7++fR9s6DvKkkNl42E8JKcVxQX55SpMMRCmyQys8KdRUNqIbJMgJW+mFJ41RTGl08XcXEzOpOnsp/hUYs4kTg75K7RlT9e3sROz6yedFVIhcQ2ONou4z8hAxQ20XadoqlytwobXees7G2mKwt0+IrKMcNQhXzpBbUR7EbnlhkEBwD/R9QL4SlU5k99QRiBuyTUa/RMncDmIaQxLw4ehrR9kSE1WAXkwYmFHAIFIhwGKQR4t6AefpmC8J75UfKBqvazEzy4uTVem1up437hk1okHEy8yeV8TvgOLAkW5JMqnG7E5SQ5yM0Oh2AgkuhTYMMLoZlDX6Fv6/EjQeGukGQ7TapZy+1bRiv3ITF/YMlr6eo5gTjII72vkinqbh43NcTiR//QxjOSn12ssgrTDNjyMvAsUrY6mD/COpodsMl5skRTnl6HuXHkQ92THfuYnvs406lTQCA15SzgnRHYbwScHrjQJZbCRy5b0CYg/DXAkoY3q5evaOpCiQrkpQo4yUR8X89ktUlj0QJXEUAj2thGVSKJy1yyTjKo74182kssPXLkT5XwkkeLSAmXBtkVhgs34v8kDjLrngCWT3XvduMsupTKWbbxhtm97EjMuTXqOl7+cmXxvz4S7hOS4snm7jEbGHvXBM2Kn6SFD+4sRj1swUkw0FA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(230273577357003)(230173577357003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(86362001)(4326008)(8676002)(8936002)(2906002)(30864003)(38070700009)(41300700001)(36756003)(2616005)(107886003)(1076003)(6512007)(6506007)(55236004)(83380400001)(6486002)(478600001)(26005)(71200400001)(6666004)(38100700002)(122000001)(316002)(91956017)(54906003)(64756008)(66446008)(6916009)(66476007)(66556008)(76116006)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?dF9536ehMnXKgtonKO0GR6mnGuk8C055hgxSQXsq/2mGy1biysrurt/UpW?=
 =?iso-8859-1?Q?LWSc3EQxeTM/m9Wh3cfCjsOiqyKrz7kJ576zx5pX+jeLOfITZ/jIQAJG60?=
 =?iso-8859-1?Q?7DxsjaV9HVhCBAOT5IkxNRdI6f5NFUx9h2jY4Ld+wmKuv5GP8oNZ3D+pFf?=
 =?iso-8859-1?Q?BlLudxoWPN3EMkvTcTiTt8et51gusSTJwTdedX45glc8FzG7n3ZDTAet22?=
 =?iso-8859-1?Q?FF6Mb5wFWiS7R7o8reRlcJfFzLgEfsISO9Ddfix1ujuwJifb2IOoN51otV?=
 =?iso-8859-1?Q?PKUrmyjvuiiRKOHLRZNluM6e09oYHyUVwRG43Ck1ZBPbJul/o7pf6w2XsI?=
 =?iso-8859-1?Q?P2nWHN3bpDusKTTCc2XbqWXn6abEqk7AzNwly8F2FOxy3AS/Ai0B8RWXFc?=
 =?iso-8859-1?Q?A4Y2dLMUxQCob2NJxt79MlwHWGEHyMuIoFdwB8vV2dO0+mapafyuJWM3ln?=
 =?iso-8859-1?Q?PwG1bYU3BjKIfA9ZGtuU5lg1DA6zvtbMib2EFPmrjSfkToqsmhSg3YwpdU?=
 =?iso-8859-1?Q?RD3OtXwwllR4J55epmdMQqEz9X4q2FZ1jKnvZunpaX8cwbKO4jvoD34q0W?=
 =?iso-8859-1?Q?ipU3z1kdI/mTDRZVDU4tGLfwcGu8UqiteI8zpd4KYrihdtJrPtUdyhemsh?=
 =?iso-8859-1?Q?TCKwxVZI9Taf0LZf11PFs0N3Fj5iIzZMSGCpLth02PK1BLnxPWduHH2RU9?=
 =?iso-8859-1?Q?FUKh4uCm7jrvxCl1d9cHllHXT3Hnz49QWzlBBxmq214H8RVMUQaL7X+sUg?=
 =?iso-8859-1?Q?E7tsUtO577JqsU/zQvx06jmJsXZX33EikrKmgR1WAUUZmGkdzQe58gnz2S?=
 =?iso-8859-1?Q?z6Yig8InGi3YeYvbXCpjpPkU5zK09GxAQw/PeZJVvl0pZrvXz2vWUmqEoV?=
 =?iso-8859-1?Q?zVNyvtyrsC8aY8byY7dpxdrzy7ENUQqoh81nm8FXTnK5JbxGENLwV/U9kD?=
 =?iso-8859-1?Q?PzXgf1Xxom1ds/DhzVkjRsPz4sGOFlyEo0OHx+OMEoOOG1FrfGwTuJcPtN?=
 =?iso-8859-1?Q?6GvYrG6EMbssbSx8oUbyl0W+tie6NZsuKGeSFXS9g4iEtKD0w+HTxGW0xB?=
 =?iso-8859-1?Q?A08t68C0eMPfD7qRbHf5W4npX2TzNOHqeiwnJC6gXtOsLgq56B/4TATV9a?=
 =?iso-8859-1?Q?vI4U6jsasKfCwixql6/HU0sPmKnWybysSg23lUN4N0mwL4gbIVlloGusHT?=
 =?iso-8859-1?Q?ZCvXqVmMrzl8dITjxZ3LfQCslp8xKXgUOyaid2UkP/AOkFzfw+n7An0PCk?=
 =?iso-8859-1?Q?oF+1D5MOsNywc35aXGfUeToIvoGnJiAF8BIwR50qT4Ci7hy8Kzh2+kpgNC?=
 =?iso-8859-1?Q?1ugn5QpJgtHXlMOlB/SO8Wk0eWaHtrkruNXN0OhHpME+vXj9B2OkM2j0rA?=
 =?iso-8859-1?Q?WIo0ReCgEEKwtLrjcPwzLwWsQ9i5Rv4e0UmMMPAZGlmBSJnC1Zst1Ii4+Y?=
 =?iso-8859-1?Q?pNC1T7qFTZCGtSBAwQKH3HiCwJcaDUKbDQin77X8W1DG+AYH0MhkNdoJlk?=
 =?iso-8859-1?Q?ug10evq3vv7RXWuXJb7c7NyIJ/rH4XKTkBscO6ClxYmvsiyt30BnB2gt9b?=
 =?iso-8859-1?Q?JpPx79QUnvQlW9hQ8paF+o9iNGiZ1hh8nr4R3qIsdIxc2o6/ZcyEQzzWt6?=
 =?iso-8859-1?Q?jy4GgtNVelgm7mhy/ubGLq8zADg8SNBTnNZdXFrdVmozqPvOMXeqV0Hw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c3a8a2-7ce8-453b-af25-08dbf2d5cd8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 01:27:05.6553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c45RotjQVgWwH7ivQzjwrjyQeVc+xLGpUI+d5Rc3CgKUgOwSHYeNbp9OvckWzAzoh8i4wGBRjbFKWtg1jUvuZfYLupRPQDSNxG556BMkK84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8599
X-Proofpoint-GUID: zCpSr2_hKR2E1wjHDHosQKpIg6EeqP3W
X-Proofpoint-ORIG-GUID: zCpSr2_hKR2E1wjHDHosQKpIg6EeqP3W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020008

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Take into account guest's BAR view and program its p2m accordingly:
gfn is guest's view of the BAR and mfn is the physical BAR value.
This way hardware domain sees physical BAR values and guest sees
emulated ones.

Hardware domain continues getting the BARs identity mapped, while for
domUs the BARs are mapped at the requested guest address without
modifying the BAR address in the device PCI config space.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
In v11:
- Add vmsix_guest_table_addr() and vmsix_guest_table_base() functions
  to access guest's view of the VMSIx tables.
- Use MFN (not GFN) to check access permissions
- Move page offset check to this patch
- Call rangeset_remove_range() with correct parameters
In v10:
- Moved GFN variable definition outside the loop in map_range()
- Updated printk error message in map_range()
- Now BAR address is always stored in bar->guest_addr, even for
  HW dom, this removes bunch of ugly is_hwdom() checks in modify_bars()
- vmsix_table_base() now uses .guest_addr instead of .addr
In v9:
- Extended the commit message
- Use bar->guest_addr in modify_bars
- Extended printk error message in map_range
- Moved map_data initialization so .bar can be initialized during declarati=
on
Since v5:
- remove debug print in map_range callback
- remove "identity" from the debug print
Since v4:
- moved start_{gfn|mfn} calculation into map_range
- pass vpci_bar in the map_data instead of start_{gfn|mfn}
- s/guest_addr/guest_reg
Since v3:
- updated comment (Roger)
- removed gfn_add(map->start_gfn, rc); which is wrong
- use v->domain instead of v->vpci.pdev->domain
- removed odd e.g. in comment
- s/d%d/%pd in altered code
- use gdprintk for map/unmap logs
Since v2:
- improve readability for data.start_gfn and restructure ?: construct
Since v1:
 - s/MSI/MSI-X in comments
---
 xen/drivers/vpci/header.c | 79 +++++++++++++++++++++++++++++----------
 xen/include/xen/vpci.h    | 13 +++++++
 2 files changed, 73 insertions(+), 19 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 7c84cee5d1..21b3fb5579 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -33,6 +33,7 @@
=20
 struct map_data {
     struct domain *d;
+    const struct vpci_bar *bar;
     bool map;
 };
=20
@@ -40,13 +41,24 @@ static int cf_check map_range(
     unsigned long s, unsigned long e, void *data, unsigned long *c)
 {
     const struct map_data *map =3D data;
+    /* Start address of the BAR as seen by the guest. */
+    unsigned long start_gfn =3D PFN_DOWN(map->bar->guest_addr);
+    /* Physical start address of the BAR. */
+    mfn_t start_mfn =3D _mfn(PFN_DOWN(map->bar->addr));
     int rc;
=20
     for ( ; ; )
     {
         unsigned long size =3D e - s + 1;
+        /*
+         * Ranges to be mapped don't always start at the BAR start address=
, as
+         * there can be holes or partially consumed ranges. Account for th=
e
+         * offset of the current address from the BAR start.
+         */
+        mfn_t map_mfn =3D mfn_add(start_mfn, s - start_gfn);
+        unsigned long m_end =3D mfn_x(map_mfn) + size - 1;
=20
-        if ( !iomem_access_permitted(map->d, s, e) )
+        if ( !iomem_access_permitted(map->d, mfn_x(map_mfn), m_end) )
         {
             printk(XENLOG_G_WARNING
                    "%pd denied access to MMIO range [%#lx, %#lx]\n",
@@ -54,7 +66,8 @@ static int cf_check map_range(
             return -EPERM;
         }
=20
-        rc =3D xsm_iomem_mapping(XSM_HOOK, map->d, s, e, map->map);
+        rc =3D xsm_iomem_mapping(XSM_HOOK, map->d, mfn_x(map_mfn), m_end,
+                               map->map);
         if ( rc )
         {
             printk(XENLOG_G_WARNING
@@ -72,8 +85,8 @@ static int cf_check map_range(
          * - {un}map_mmio_regions doesn't support preemption.
          */
=20
-        rc =3D map->map ? map_mmio_regions(map->d, _gfn(s), size, _mfn(s))
-                      : unmap_mmio_regions(map->d, _gfn(s), size, _mfn(s))=
;
+        rc =3D map->map ? map_mmio_regions(map->d, _gfn(s), size, map_mfn)
+                      : unmap_mmio_regions(map->d, _gfn(s), size, map_mfn)=
;
         if ( rc =3D=3D 0 )
         {
             *c +=3D size;
@@ -82,8 +95,9 @@ static int cf_check map_range(
         if ( rc < 0 )
         {
             printk(XENLOG_G_WARNING
-                   "Failed to identity %smap [%lx, %lx] for d%d: %d\n",
-                   map->map ? "" : "un", s, e, map->d->domain_id, rc);
+                   "Failed to %smap [%lx %lx] -> [%lx %lx] for %pd: %d\n",
+                   map->map ? "" : "un", s, e, mfn_x(map_mfn),
+                   mfn_x(map_mfn) + size, map->d, rc);
             break;
         }
         ASSERT(rc < size);
@@ -162,10 +176,6 @@ static void modify_decoding(const struct pci_dev *pdev=
, uint16_t cmd,
 bool vpci_process_pending(struct vcpu *v)
 {
     struct pci_dev *pdev =3D v->vpci.pdev;
-    struct map_data data =3D {
-        .d =3D v->domain,
-        .map =3D v->vpci.cmd & PCI_COMMAND_MEMORY,
-    };
     struct vpci_header *header =3D NULL;
     unsigned int i;
=20
@@ -185,6 +195,11 @@ bool vpci_process_pending(struct vcpu *v)
     for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar =3D &header->bars[i];
+        struct map_data data =3D {
+            .d =3D v->domain,
+            .map =3D v->vpci.cmd & PCI_COMMAND_MEMORY,
+            .bar =3D bar,
+        };
         int rc;
=20
         if ( rangeset_is_empty(bar->mem) )
@@ -235,7 +250,6 @@ bool vpci_process_pending(struct vcpu *v)
 static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
                             uint16_t cmd)
 {
-    struct map_data data =3D { .d =3D d, .map =3D true };
     struct vpci_header *header =3D &pdev->vpci->header;
     int rc =3D 0;
     unsigned int i;
@@ -245,6 +259,7 @@ static int __init apply_map(struct domain *d, const str=
uct pci_dev *pdev,
     for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar =3D &header->bars[i];
+        struct map_data data =3D { .d =3D d, .map =3D true, .bar =3D bar }=
;
=20
         if ( rangeset_is_empty(bar->mem) )
             continue;
@@ -310,12 +325,16 @@ static int modify_bars(const struct pci_dev *pdev, ui=
nt16_t cmd, bool rom_only)
      * First fill the rangesets with the BAR of this device or with the RO=
M
      * BAR only, depending on whether the guest is toggling the memory dec=
ode
      * bit of the command register, or the enable bit of the ROM BAR regis=
ter.
+     *
+     * For non-hardware domain we use guest physical addresses.
      */
     for ( i =3D 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar =3D &header->bars[i];
         unsigned long start =3D PFN_DOWN(bar->addr);
         unsigned long end =3D PFN_DOWN(bar->addr + bar->size - 1);
+        unsigned long start_guest =3D PFN_DOWN(bar->guest_addr);
+        unsigned long end_guest =3D PFN_DOWN(bar->guest_addr + bar->size -=
 1);
=20
         if ( !bar->mem )
             continue;
@@ -335,11 +354,25 @@ static int modify_bars(const struct pci_dev *pdev, ui=
nt16_t cmd, bool rom_only)
             continue;
         }
=20
-        rc =3D rangeset_add_range(bar->mem, start, end);
+        /*
+         * Make sure that the guest set address has the same page offset
+         * as the physical address on the host or otherwise things won't w=
ork as
+         * expected.
+         */
+        if ( PAGE_OFFSET(bar->guest_addr) !=3D PAGE_OFFSET(bar->addr) )
+        {
+            gprintk(XENLOG_G_WARNING,
+                    "%pp: Can't map BAR%d because of page offset mismatch:=
 %lx vs %lx\n",
+                    &pdev->sbdf, i, PAGE_OFFSET(bar->guest_addr),
+                    PAGE_OFFSET(bar->addr));
+            return -EINVAL;
+        }
+
+        rc =3D rangeset_add_range(bar->mem, start_guest, end_guest);
         if ( rc )
         {
             printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
-                   start, end, rc);
+                   start_guest, end_guest, rc);
             return rc;
         }
=20
@@ -351,12 +384,12 @@ static int modify_bars(const struct pci_dev *pdev, ui=
nt16_t cmd, bool rom_only)
             if ( rangeset_is_empty(prev_bar->mem) )
                 continue;
=20
-            rc =3D rangeset_remove_range(prev_bar->mem, start, end);
+            rc =3D rangeset_remove_range(prev_bar->mem, start_guest, end_g=
uest);
             if ( rc )
             {
                 gprintk(XENLOG_WARNING,
                        "%pp: failed to remove overlapping range [%lx, %lx]=
: %d\n",
-                        &pdev->sbdf, start, end, rc);
+                        &pdev->sbdf, start_guest, end_guest, rc);
                 return rc;
             }
         }
@@ -365,8 +398,8 @@ static int modify_bars(const struct pci_dev *pdev, uint=
16_t cmd, bool rom_only)
     /* Remove any MSIX regions if present. */
     for ( i =3D 0; msix && i < ARRAY_SIZE(msix->tables); i++ )
     {
-        unsigned long start =3D PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
-        unsigned long end =3D PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
+        unsigned long start =3D PFN_DOWN(vmsix_guest_table_addr(pdev->vpci=
, i));
+        unsigned long end =3D PFN_DOWN(vmsix_guest_table_addr(pdev->vpci, =
i) +
                                      vmsix_table_size(pdev->vpci, i) - 1);
=20
         for ( j =3D 0; j < ARRAY_SIZE(header->bars); j++ )
@@ -424,8 +457,8 @@ static int modify_bars(const struct pci_dev *pdev, uint=
16_t cmd, bool rom_only)
             for ( i =3D 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
             {
                 const struct vpci_bar *remote_bar =3D &tmp->vpci->header.b=
ars[i];
-                unsigned long start =3D PFN_DOWN(remote_bar->addr);
-                unsigned long end =3D PFN_DOWN(remote_bar->addr +
+                unsigned long start =3D PFN_DOWN(remote_bar->guest_addr);
+                unsigned long end =3D PFN_DOWN(remote_bar->guest_addr +
                                              remote_bar->size - 1);
=20
                 if ( !remote_bar->enabled )
@@ -512,6 +545,8 @@ static void cf_check bar_write(
     struct vpci_bar *bar =3D data;
     bool hi =3D false;
=20
+    ASSERT(is_hardware_domain(pdev->domain));
+
     if ( bar->type =3D=3D VPCI_BAR_MEM64_HI )
     {
         ASSERT(reg > PCI_BASE_ADDRESS_0);
@@ -542,6 +577,10 @@ static void cf_check bar_write(
      */
     bar->addr &=3D ~(0xffffffffULL << (hi ? 32 : 0));
     bar->addr |=3D (uint64_t)val << (hi ? 32 : 0);
+    /*
+     * Update guest address as well, so hardware domain sees BAR identity =
mapped
+     */
+    bar->guest_addr =3D bar->addr;
=20
     /* Make sure Xen writes back the same value for the BAR RO bits. */
     if ( !hi )
@@ -793,6 +832,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
         }
=20
         bars[i].addr =3D addr;
+        bars[i].guest_addr =3D addr;
         bars[i].size =3D size;
         bars[i].prefetchable =3D val & PCI_BASE_ADDRESS_MEM_PREFETCH;
=20
@@ -814,6 +854,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
             rom->type =3D VPCI_BAR_ROM;
             rom->size =3D size;
             rom->addr =3D addr;
+            rom->guest_addr =3D addr;
             header->rom_enabled =3D pci_conf_read32(pdev->sbdf, rom_reg) &
                                   PCI_ROM_ADDRESS_ENABLE;
=20
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 18a0eca3da..c39fab4832 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -205,6 +205,19 @@ static inline paddr_t vmsix_table_addr(const struct vp=
ci *vpci, unsigned int nr)
            (vpci->msix->tables[nr] & ~PCI_MSIX_BIRMASK);
 }
=20
+static inline paddr_t vmsix_guest_table_base(const struct vpci *vpci,
+                                             unsigned int nr)
+{
+    return (vpci->header.bars[vpci->msix->tables[nr] &
+           PCI_MSIX_BIRMASK].guest_addr & PCI_BASE_ADDRESS_MEM_MASK);
+}
+
+static inline paddr_t vmsix_guest_table_addr(const struct vpci *vpci,
+                                             unsigned int nr)
+{
+    return vmsix_guest_table_base(vpci, nr) +
+           (vpci->msix->tables[nr] & ~PCI_MSIX_BIRMASK);
+}
 /*
  * Note regarding the size calculation of the PBA: the spec mentions "The =
last
  * QWORD will not necessarily be fully populated", so it implies that the =
PBA
--=20
2.42.0

