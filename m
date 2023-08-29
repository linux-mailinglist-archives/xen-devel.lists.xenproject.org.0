Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2143378D044
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 01:20:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592514.925287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb809-0007xg-OL; Tue, 29 Aug 2023 23:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592514.925287; Tue, 29 Aug 2023 23:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb809-0007qB-Iw; Tue, 29 Aug 2023 23:20:01 +0000
Received: by outflank-mailman (input) for mailman id 592514;
 Tue, 29 Aug 2023 23:19:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y18t=EO=epam.com=prvs=36058b40d2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qb807-0006kQ-CO
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 23:19:59 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91395310-46c2-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 01:19:57 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TFMk9p021983; Tue, 29 Aug 2023 23:19:55 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ssdvpbm4f-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 23:19:55 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM7PR03MB6371.eurprd03.prod.outlook.com (2603:10a6:20b:1b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 23:19:48 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895%4]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 23:19:48 +0000
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
X-Inumbo-ID: 91395310-46c2-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+E0+htBOuRqUkOXEOH0PhRZYcgmKQUqttJGKIJRnaonfSlB02lCzplD+ZVXLVVL6442sA88tyBwDqB8OZZvD4wgT5TO3TGh9dLiTXqX5mEgYQ2/U76z9NDfuGavqGNXlEzxa8S0DVT3wETa/fhWAZOenuf776bGcVu9nCHGxjcgjzqLhfzezm9A88DlViR14zIaS0sJAk3hYyaZQ2JI5pg+ifS1negLstRxRMEh7471ye6biLql1UOkbPTXZINFy6v9zeXfJ+ZoAyCivOVoyK668iTuE7CzgRQKqC7VceYFovtBuQl6epUHRCjPWnFYJ42MuZFddX2ZRVJhSBAvQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yi13S8hn57H9+SZArk4saLc0rRHuoOULjXT1oxZYZRk=;
 b=moR5GxUVlhOgAP5lHmGfUM2ihkIhSTVWebcDAvvxgrsDHQGia/sMr/unYTTnpqcEZn6esviCuw+c7x3Pv3lzvfurVADpXaxXWTp+ouaBILzx1hSmwY2A14Jnz1RAaQKZCGVn3IIKlEpW9eOJMFE3w+SFkWlBd/gzIoe2i40LzY1zywSwA2dvI7Lut4HPEq2RvqP4p3uyOHkwVag2lmKY6N0gqOC7J4yKDq4EZ1X2xTA6Cn/YWNALWWXRtjmPtbFhJhzD4MHszRLK5Q0jSPSFE1AQQevaIdDmCsp82BwJb0oGL66gLoDuqV7JkaoRW6KGs93TPIJf1dDgyUcZIAz80A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yi13S8hn57H9+SZArk4saLc0rRHuoOULjXT1oxZYZRk=;
 b=dX3UFhNJRTa68AjCy+w5L8tncG354AUvN5Vye+BsFdWpgjSaadLPtv5AarUOQqldyDh2kuc4NpGgzomx+0rGODc3ZlGxWHJzjx+7xw4c5w5Bxgzq3NZumaJqZCSFOXb/SGWMFymm+8DThMZo1tjuzIAukjS9rY8gZkVMEU0fjrlWDI4xMOiGhEkn1ga2tPqyPJCyn9PI8sAymZK+hclvcNdYboMovXtRvhTV306J5eydca02mvPajSRmHnWp6sDDwSh3dhdwO3bhfkco0eX0Xr2PbYdp5oASyrdbHrwZiuFYgqyBH5ZHfinnCQPJhf944O5T5KoWbY5Syi1+sqSSkg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v9 15/16] xen/arm: vpci: check guest range
Thread-Topic: [PATCH v9 15/16] xen/arm: vpci: check guest range
Thread-Index: AQHZ2s9NAWcA6L4O6U+PqFV61kFyWA==
Date: Tue, 29 Aug 2023 23:19:47 +0000
Message-ID: <20230829231912.4091958-16-volodymyr_babchuk@epam.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6371:EE_
x-ms-office365-filtering-correlation-id: c40aa71a-dea3-465e-8813-08dba8e67048
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nce5vjY9Bj7S0RfJjidE5Ey36FrFrSjWBJ8HsoJgONqTUkX/GHNCLXztGOelXZfj7CzMzS24tETH4OD22SWHCIG+dkzxR2yY2JaRHrVvmpbFcTnCJyu/lOIOWfTpT5UpSJPJI06M8u0k8wwLiFZ/fN8g+rkwoEO9VvXyTn/jGc63Gl90gRleaWpPPqvIqjmn5tSk97+XbruNOG3L+tr/rIA2Pq4ixWUufp5+lYrhnnEaoCijuefXRlNIvcZuJZRX0FRcJ5SOnNF3ZQzyxFWNS4+2JBD3o6tpUyKrKqFPCBIjje7I7G+qT1OuiTxz9DjF1yfMuUUjDQAHBAY0UZFDON6nIQOskLgcga5ExiY3SPOugMNLAIy9GVuO6vl5CbkLupL+s+YYZjtKk0+irr5lmmf7GEwypd43K2QPOqjx4byjezu+KBNDj1i71WNNtCeKODHmrCqZdpnaITwiIGl6wq8sUefuXuvSByy6HqAHypsrXpuMWXdi4M0yvTBQ1HB3hTiXZ0E5vKomV/Md1k2yCArLvk2dmodgvwYEfWlTesScw+xXUDiCteeLozbnYzSt/RAv+aJs03jkXg1jyikCsHau6WuOy/A/Q8/Yboo5CBkHz8zTGRdRuJyzBZNqJYg1
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199024)(1800799009)(186009)(71200400001)(6512007)(6506007)(6486002)(478600001)(55236004)(76116006)(1076003)(2616005)(26005)(4744005)(2906002)(6916009)(64756008)(66446008)(54906003)(316002)(5660300002)(66476007)(66556008)(91956017)(66946007)(41300700001)(83380400001)(8936002)(4326008)(8676002)(36756003)(38070700005)(38100700002)(86362001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?v3AAlS0/O+hVoALSrmYskDyzgHKG9tnCFfK0g1fMGoPPYIkL4OEv/qZIQL?=
 =?iso-8859-1?Q?wWWvRuQrxj0j8tRA0LbxiPavBlCGPuRBvW002OhWolk6Lszxk4emN5vqlr?=
 =?iso-8859-1?Q?KXP8MxjgW2OxJLA8iVG64VzjaBQc/cznAcMm+347uUm7spITSMvo1Bb+XK?=
 =?iso-8859-1?Q?quKxk3WeGhCbSlT0hOiK0kDQ6mceUsRGW8rCSeI7+R70YVxXbTlAdikQFk?=
 =?iso-8859-1?Q?HZ+Rimd1ksco6RPpfXHyUlc9KdRwv0Dq5j4Y9ctmtXgKG1p8i0OUjglD5K?=
 =?iso-8859-1?Q?hZ03M0Kt8iVwuCF/97m9Sd0ajDtynQN8j97LH632EcP7+aao4MD7+ugHgE?=
 =?iso-8859-1?Q?R2XQmuED2K32MkxcB+BQ6+OpLMIT7UkRte8mlgbanf0lQyV15bWyJ/uaxu?=
 =?iso-8859-1?Q?e8KEQ02EI9w04g+lEBdk2OANAKU4kKPO7e8zXy+bpVf2thlAttQCl5BbqL?=
 =?iso-8859-1?Q?l5/WSX9Eu8AS31TETJSdb3BMqDL5ALaOP1tF3Yi9tuXyCJ0c34uKti6UUP?=
 =?iso-8859-1?Q?lJrHFzMYt4pU/p5tkdvD88dqM5MN/3uSNjz3EIuaYKZ5Gjak8VDk1jvtUn?=
 =?iso-8859-1?Q?m8IAcB0it0W2vTlKTgS/kWPKDhYth6ME/abS7nLo6WmCdvGe6BUpabUC8J?=
 =?iso-8859-1?Q?x08I85BdPzAOH8pW12EaTPDFW5Mjkn/ugqeuACRt3KlcJuKPtK8uUWM/6s?=
 =?iso-8859-1?Q?s+LqNSbJXOkCFF32IbYrpUA4RC7wgO3xPZpjQhWxwMQmJkRhdUx0fAhqU0?=
 =?iso-8859-1?Q?JgSP9kdgB2USpGttJ3HtnrvIBNM0MmhsXO6Vs6FHW7x42FWrYB2R13mLm8?=
 =?iso-8859-1?Q?OVKCFE77BH65BCM/XS6gdRKHy88LhEtk3SVMMhbYaSHAAmU1/O7VtB7+ao?=
 =?iso-8859-1?Q?D8Tvq0o1FFpauF8YdOOwYn9HtY/fc5Ww1MK/eQM+3YRrq1MG47kc5qC4G3?=
 =?iso-8859-1?Q?FLhKF9nVVdFrGloOANaxVnOkVE0CeCr2MV7G87SgbnIwyo+SBHg3FdCfIu?=
 =?iso-8859-1?Q?3XCrZ0zF/pqRMhVocRRhWg3xIaiNuIwmgu50kElRUkxyyHKEySUaMJRL5H?=
 =?iso-8859-1?Q?8c2PGJN8FWu8wH3ZMIahLY59TOcIxuX2AIkYHGpJ73j6LCgnOg5VKnVYgm?=
 =?iso-8859-1?Q?w3t99Rk62Rnf22im7DktL6rdnOB0jI5LOVppJ4m///LudZ9qf90u9G1QUo?=
 =?iso-8859-1?Q?0VIkZkwxkJQXYhlrDyRvqp079r7OxXHztSBmkq8FhbSUvB9IzstcsUmaS6?=
 =?iso-8859-1?Q?GCUW8AxM20W7dauiD8PkRyAxcnVacLy+LXnPPiO4W+TB3MnxRL2e2ca0TZ?=
 =?iso-8859-1?Q?T9/JvIXY4+F8PuR/3ltZv8ywDqHlhc8QFUcqu5t7n8GPvLWUmYSwahn1tx?=
 =?iso-8859-1?Q?7dHNbDrU+ls+uziWB1x0RnklyO17ltZAXsXsvFWF8Rb6r0gq3tWgnwZGiR?=
 =?iso-8859-1?Q?7xWL0C7dN1gsRfdU5mdh6/5b/+csNkMIDXxkZsIKWcU3aKgx1jtrhrcxsN?=
 =?iso-8859-1?Q?BUNtsJ78qwFhC8xS3WhIx3uyJXNNJH6MgiAGEo813WHVdhzLlOKbtkEH5L?=
 =?iso-8859-1?Q?L18HOywf6FH1KiUK0N7SBk3NXneB7ZOoMP8h/pjxWKgJb/iiGmxUZIljUB?=
 =?iso-8859-1?Q?I/H1GkgM5jtazSyFZErIiMYGIG807/lINN75Qw5MQwG4Vvj6Az1SzW2A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c40aa71a-dea3-465e-8813-08dba8e67048
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 23:19:47.1794
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gytcEUZUjVKHGaY2dSVtG+1lgSDsEAeVWo0uaQpqp8wFJWoLkVSXTPav+fygCR/hXkPL4DzN+11mZhDA/mfmu96o/FrtL23coUBEB+OFbUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6371
X-Proofpoint-ORIG-GUID: aFHW6Lc_ErMGQ8h4n_X-XZDPu2KyqPqd
X-Proofpoint-GUID: aFHW6Lc_ErMGQ8h4n_X-XZDPu2KyqPqd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290202

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Skip mapping the BAR if it is not in a valid range.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/drivers/vpci/header.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 1d243eeaf9..dbabdcbed2 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -345,6 +345,15 @@ static int modify_bars(const struct pci_dev *pdev, uin=
t16_t cmd, bool rom_only)
              bar->enabled =3D=3D !!(cmd & PCI_COMMAND_MEMORY) )
             continue;
=20
+#ifdef CONFIG_ARM
+        if ( !is_hardware_domain(pdev->domain) )
+        {
+            if ( (start_guest < PFN_DOWN(GUEST_VPCI_MEM_ADDR)) ||
+                 (end_guest >=3D PFN_DOWN(GUEST_VPCI_MEM_ADDR + GUEST_VPCI=
_MEM_SIZE)) )
+                continue;
+        }
+#endif
+
         if ( !pci_check_bar(pdev, _mfn(start), _mfn(end)) )
         {
             printk(XENLOG_G_WARNING
--=20
2.41.0

