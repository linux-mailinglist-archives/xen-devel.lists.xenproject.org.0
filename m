Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3FD7C7959
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 00:15:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616090.957925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3y2-0002Sn-0V; Thu, 12 Oct 2023 22:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616090.957925; Thu, 12 Oct 2023 22:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3y1-0002QG-Tj; Thu, 12 Oct 2023 22:15:41 +0000
Received: by outflank-mailman (input) for mailman id 616090;
 Thu, 12 Oct 2023 22:15:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hhgq=F2=epam.com=prvs=4649fa389a=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qr3sH-00016v-Sm
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 22:09:46 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c3c9fdf-694c-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 00:09:44 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39CG29eO021659; Thu, 12 Oct 2023 22:09:33 GMT
Received: from eur03-am7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2232.outbound.protection.outlook.com [104.47.51.232])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3tpcc6c048-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Oct 2023 22:09:32 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB8758.eurprd03.prod.outlook.com (2603:10a6:20b:53e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.41; Thu, 12 Oct
 2023 22:09:27 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076%4]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 22:09:27 +0000
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
X-Inumbo-ID: 0c3c9fdf-694c-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q61p4uwi9nQLGSZCjjCKGrRLgMeuRGRt3tscWNCw+a9xalu2e7d4GFNOwtaAH+A9sjype9LLDeTRcV8pY3l+haaA6NfrMSzd2DrdEOFAwOCyYRTIz0VyinBXU7CTTREDxer/dEYptydIR4ces7c8ts6FV+Vax/GDUuDRCH+rer9Veg7mUuohB4UDy4q5sUJLYwvTxKuAmRi3B8098U5+3GxmwdGdYWEldKwZObJi1SAiFm5aq7/fIeVutZVFVWf6T2V+S/zbkisplmJaGUHOuAF/LpHa6pFYwCr3fY7XlAp6TfsBk4AgY48+5buvF/4n+j6QHD1W6o/l++zIlc4LPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEhXn9ctGp3Gi+ciQHEpitWLa9ZFpk23aJZmdmWltD4=;
 b=XPaooHPLc7CSLX3+UjB9mfDODvmggXJWfekf9a0Qg6ljPaOsJ2sXLZz3qnaszOd6iXZc+O8nkCiiDih/G+Smg7EIybXhbpsij819X87tXjNUt+F9kKzKi0wNWpksF303XumAOt0LPfc7ypSbPSX8tw4Q0PHz7X62H71eN/6UHTelBu6KqwsrYYZbbXG5/8VfNwFTs/UZD/W5iEosdA6zSbfB5SQRM1XC6mp3xD3+WTWtIT1/ESWjHAdjrMbiPistsUX8nMIRZ60qZ6q7xtf2NSwNuR0ktOXSoRvsIJeBGvsPyHoWLm9f/LgXlfhCG6eDbsAC7LMaR09D5tCf3k4bew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEhXn9ctGp3Gi+ciQHEpitWLa9ZFpk23aJZmdmWltD4=;
 b=rrzUp/i1au7Pj2pr8aXijdoteTMcXvmKKZY9RuNfH/RrbXkJ4sqFw+3UeBKENKNe18ODqfajWpWigJ0/20B4B3kQliCWTOK4cfzuAAtoZGaLDN+/DztEKoKnpcdWWRknHaJmzPF7qtJG/2mfa6j/9ogENLFlPQCZcZ13jayL4q0kTqjSfA/digLbvHz/BCOwZhbtSsDKQMJLeM5whrLZ+NT9Y1g0n2EaimoUUAfGuAiwSBQgjzUTitcxjBcDLSgiegSa2d6bv4I5eUfMQz29ESurSath/B4QKcYncZZkocxOi2PdGBIHKePLF8OelesEaa7XeBGottlukpN5/23S0g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v10 13/17] vpci: add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v10 13/17] vpci: add initial support for virtual PCI bus
 topology
Thread-Index: AQHZ/Vi+wP3QsyKZ0EartcLXqtnBRA==
Date: Thu, 12 Oct 2023 22:09:18 +0000
Message-ID: <20231012220854.2736994-14-volodymyr_babchuk@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB8758:EE_
x-ms-office365-filtering-correlation-id: af23428e-e030-405d-370e-08dbcb6fe672
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KGvcqEzkj68c298YWAZf1r/swsRacm2Nb8MF4H656bvNkjJAmeM0e/F/wJ7vpEUKI6l0F+YFBjsPTyQEtKlTg24AuyYJ4TvqVydZ/kY5QkqEYBExanVQOijSZu6bS/b4hDf7RqpFeKpgqrsmtGzCQV0wseW22Fdaxm5DyNF00wvg91OTan+RvZd1D3vi6ng6/cbpATq0UtakxWhXTRSZumiHnH0M+nE0pyctlEBy1jAVP4jILCdrk/lKd5UM9tbX/wi5fQDh/69G2lAenDCNGriAwxDp/z6TufKckQ4mF9tGTfK9rDg/aYdeqrgG3yOrXo4j/TNBOUxbGLi5gG3IWDjC4qrkLDgmnhf4REy/ddKajqLbQRgXcoF9GS5hbShKCFAe30riX+MKXluvn8206FNQw789TAWrIE3enlKszmOS/bazpT2NhoMpgHraB+UZ3R196m6dFaBaRNCnK5lydVHu+jOG8s8jyYMK1AO6Qzugc1eQJCgyU78bMK452AMnvM+7bQZFgXliNp/ooe6MGrwAkFdkNaB+zYhGLIPY7HKAJcWp7pp3olo/DTbvNcJv6Cn9JSailUEFbKP1JmNGxfJHvcFOUDwVfPrvTw4uqbd/iSbg+aIPG8CD6IwGWhFJ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(38070700005)(6916009)(5660300002)(41300700001)(316002)(83380400001)(86362001)(122000001)(38100700002)(66446008)(71200400001)(6486002)(26005)(1076003)(2616005)(54906003)(478600001)(76116006)(66556008)(66946007)(66476007)(64756008)(91956017)(2906002)(8936002)(8676002)(36756003)(6512007)(6666004)(55236004)(6506007)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?MNkZ4Fr7Jqg1k7q+9gBDkwE8fmQcvMpmhPLS6rvj/7ko+dLHfDRWh+Zrdc?=
 =?iso-8859-1?Q?RqCSnShNFsxttDNVkqNZgMNIjAYu4drhDGW6HE7iIdoxBlpsNF4DFnUC+b?=
 =?iso-8859-1?Q?L5pWq2R3Com7JeoWCGuuKBVl28lBuoVzO8lx2nWGUdUMx65r/js9/AS07l?=
 =?iso-8859-1?Q?MGHBw4RHhBv06smtykceYKLWaUFiQ06oJI+H+3gNfljt3GM78syW6vuPeH?=
 =?iso-8859-1?Q?+nxJ3ofjUhyMZl+PmbmzlEPsvUSdyG3uKqEi/LYPBvh8Mtac0wus4jV4cJ?=
 =?iso-8859-1?Q?3NIcAATSw3JF8ClZrenadaLv58QJyL8dKuTN9zTpGV2z2KpB7Ek/gpIXEj?=
 =?iso-8859-1?Q?ImTbEL11myZJgksL7JcYqT4YjnCDKv158FFl8R7nIhBlQIRmY1QyhpLAbq?=
 =?iso-8859-1?Q?Uv69o3d8hyZkIIYh1xG34jgNleycNDqbAGZhBXscWt0K9BnN9WZ8AJzOWy?=
 =?iso-8859-1?Q?Keg+unh8ZVg+/zK8gbjTEVvwVZW3ZsP19oroHows74lQ/lipV6K+9Ui/h5?=
 =?iso-8859-1?Q?RZ78J+2jj1wEEkbKHZUV8mXDcrup863SPVAzohKvfW0x7Xw+mmVKWK4MII?=
 =?iso-8859-1?Q?Lnj8R/1xMv0AEPJ0jcWs6FR97OOrYgBFPASwhALNHF8DcknUApQovlcz2t?=
 =?iso-8859-1?Q?yAz9STFYD+zZ2BEvjB9JJArTSb2DhdoqctFf9zRdSh+kciI5cFaeLga8kZ?=
 =?iso-8859-1?Q?f8+dLrb/goJ46oDiFoVXjohTZwaVJr71gG2h+F1v8qA+jtjSsAZy5sbQto?=
 =?iso-8859-1?Q?IU9uRjgQICXuD/pv7mDvA1lknTpIggOAt6exGbIFLyTYHRvHkb+DHDd4oo?=
 =?iso-8859-1?Q?nllAN8s/PUMEjE/UHB9zJx3nBJiOh3z0ZOuwovKUU6rZLxOZ+K17ovh8fa?=
 =?iso-8859-1?Q?feXE1cuUygwI4N6jnxZMVoDvFiHnDJW0nPJGiQkIo2lYFdQO10nNpt7p8o?=
 =?iso-8859-1?Q?Am07EdL/wv0VP5UgMKhMGFAx2GTmoWOhJzErzvYgyS+bzTjJk9PQ32tEvz?=
 =?iso-8859-1?Q?tSQaeNPwDdBe/aXEOHTXhDgDY3OJwipYBS5t1G3MuGdFffCW4rRvGDMIwg?=
 =?iso-8859-1?Q?usy2MTNTARVkxkOIomZCxisbV21Vw5FMcN0l7UjKVgVVOB3TdGxTZOVJea?=
 =?iso-8859-1?Q?jE5T1LnTQ+Z0jZQFnFjHB2/zCWwoaNhvDNV0YfyplKalgqZsu1nbCz+vZQ?=
 =?iso-8859-1?Q?6CPMmbdoSJrYJIIF2/ICKe1VWCRmCW0VZtwseSVz433dT9Af6bZff4x11O?=
 =?iso-8859-1?Q?rcRZ2CT3bHsWR7mMOyjHIKOC0tnFW6OKRI6rNscpiJ2xuvNst9sB6ABiBu?=
 =?iso-8859-1?Q?JAmGmxMSKVJWxAu0zCZCp+5EGwTaQm6CDEFyPZo4kiw4jSeCx2NM04Mo2x?=
 =?iso-8859-1?Q?BXaxfDJzo7ZUlvnGEjW0A4eXSAPnJFtoUXmI1d8+JQbjde1fqu9leDoNWA?=
 =?iso-8859-1?Q?jaQl2CscIziAPifi70hc+dbNwh1e0U7JFaS+j4mSyI8fdhV76NNHzuYP0m?=
 =?iso-8859-1?Q?Czn11RWrBVVS61IpvXzhMJfp91vNMnBDRxeel9lEmGTpLO76fRvW3FROCG?=
 =?iso-8859-1?Q?Ut8491PW+psRwXvCcEQrZI9djWLIw5F71HmW4DzBzYbC3BtjGeXgF8qLI/?=
 =?iso-8859-1?Q?LTb7Up80zq9Qw9R4kfVLf/5jk2tX6fCsjhGAzUP6rbAPNJlu9RlV92JQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af23428e-e030-405d-370e-08dbcb6fe672
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 22:09:18.5386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1qb5iQm3iKkzV2GNG76/ui4kQvK+5WOfYB6TtYRmZgC1gGCcUyvwUeh1pGcmTo/Ihtqm7DzeZtDRQoMxoiadQFKkX7qyHDkHKuCV/qw+WuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8758
X-Proofpoint-GUID: sRrPYYwi133mn3eTIeNbZIwA1anw6OwG
X-Proofpoint-ORIG-GUID: sRrPYYwi133mn3eTIeNbZIwA1anw6OwG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_14,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310120186

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Assign SBDF to the PCI devices being passed through with bus 0.
The resulting topology is where PCIe devices reside on the bus 0 of the
root complex itself (embedded endpoints).
This implementation is limited to 32 devices which are allowed on
a single PCI bus.

Please note, that at the moment only function 0 of a multifunction
device can be passed through.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
In v10:
- Removed ASSERT(pcidevs_locked())
- Removed redundant code (local sbdf variable, clearing sbdf during
device removal, etc)
- Added __maybe_unused attribute to "out:" label
- Introduced HAS_VPCI_GUEST_SUPPORT Kconfig option, as this is the
  first patch where it is used (previously was in "vpci: add hooks for
  PCI device assign/de-assign")
In v9:
- Lock in add_virtual_device() replaced with ASSERT (thanks, Stewart)
In v8:
- Added write lock in add_virtual_device
Since v6:
- re-work wrt new locking scheme
- OT: add ASSERT(pcidevs_write_locked()); to add_virtual_device()
Since v5:
- s/vpci_add_virtual_device/add_virtual_device and make it static
- call add_virtual_device from vpci_assign_device and do not use
  REGISTER_VPCI_INIT machinery
- add pcidevs_locked ASSERT
- use DECLARE_BITMAP for vpci_dev_assigned_map
Since v4:
- moved and re-worked guest sbdf initializers
- s/set_bit/__set_bit
- s/clear_bit/__clear_bit
- minor comment fix s/Virtual/Guest/
- added VPCI_MAX_VIRT_DEV constant (PCI_SLOT(~0) + 1) which will be used
  later for counting the number of MMIO handlers required for a guest
  (Julien)
Since v3:
 - make use of VPCI_INIT
 - moved all new code to vpci.c which belongs to it
 - changed open-coded 31 to PCI_SLOT(~0)
 - added comments and code to reject multifunction devices with
   functions other than 0
 - updated comment about vpci_dev_next and made it unsigned int
 - implement roll back in case of error while assigning/deassigning devices
 - s/dom%pd/%pd
Since v2:
 - remove casts that are (a) malformed and (b) unnecessary
 - add new line for better readability
 - remove CONFIG_HAS_VPCI_GUEST_SUPPORT ifdef's as the relevant vPCI
    functions are now completely gated with this config
 - gate common code with CONFIG_HAS_VPCI_GUEST_SUPPORT
New in v2
---
 xen/drivers/Kconfig     |  4 +++
 xen/drivers/vpci/vpci.c | 63 +++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/sched.h |  8 ++++++
 xen/include/xen/vpci.h  | 11 +++++++
 4 files changed, 86 insertions(+)

diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
index db94393f47..780490cf8e 100644
--- a/xen/drivers/Kconfig
+++ b/xen/drivers/Kconfig
@@ -15,4 +15,8 @@ source "drivers/video/Kconfig"
 config HAS_VPCI
 	bool
=20
+config HAS_VPCI_GUEST_SUPPORT
+	bool
+	depends on HAS_VPCI
+
 endmenu
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 5e34d0092a..7c46a2d3f4 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -36,6 +36,52 @@ extern vpci_register_init_t *const __start_vpci_array[];
 extern vpci_register_init_t *const __end_vpci_array[];
 #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
=20
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+static int add_virtual_device(struct pci_dev *pdev)
+{
+    struct domain *d =3D pdev->domain;
+    unsigned long new_dev_number;
+
+    if ( is_hardware_domain(d) )
+        return 0;
+
+    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
+
+    /*
+     * Each PCI bus supports 32 devices/slots at max or up to 256 when
+     * there are multi-function ones which are not yet supported.
+     */
+    if ( pdev->info.is_extfn && !pdev->info.is_virtfn )
+    {
+        gdprintk(XENLOG_ERR, "%pp: only function 0 passthrough supported\n=
",
+                 &pdev->sbdf);
+        return -EOPNOTSUPP;
+    }
+    new_dev_number =3D find_first_zero_bit(d->vpci_dev_assigned_map,
+                                         VPCI_MAX_VIRT_DEV);
+    if ( new_dev_number =3D=3D VPCI_MAX_VIRT_DEV )
+    {
+        write_unlock(&pdev->domain->pci_lock);
+        return -ENOSPC;
+    }
+
+    __set_bit(new_dev_number, &d->vpci_dev_assigned_map);
+
+    /*
+     * Both segment and bus number are 0:
+     *  - we emulate a single host bridge for the guest, e.g. segment 0
+     *  - with bus 0 the virtual devices are seen as embedded
+     *    endpoints behind the root complex
+     *
+     * TODO: add support for multi-function devices.
+     */
+    pdev->vpci->guest_sbdf =3D PCI_SBDF(0, 0, new_dev_number, 0);
+
+    return 0;
+}
+
+#endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
+
 void vpci_deassign_device(struct pci_dev *pdev)
 {
     unsigned int i;
@@ -46,6 +92,13 @@ void vpci_deassign_device(struct pci_dev *pdev)
         return;
=20
     spin_lock(&pdev->vpci->lock);
+
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    if ( pdev->vpci->guest_sbdf.sbdf !=3D ~0 )
+        __clear_bit(pdev->vpci->guest_sbdf.dev,
+                    &pdev->domain->vpci_dev_assigned_map);
+#endif
+
     while ( !list_empty(&pdev->vpci->handlers) )
     {
         struct vpci_register *r =3D list_first_entry(&pdev->vpci->handlers=
,
@@ -101,6 +154,13 @@ int vpci_assign_device(struct pci_dev *pdev)
     INIT_LIST_HEAD(&pdev->vpci->handlers);
     spin_lock_init(&pdev->vpci->lock);
=20
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    pdev->vpci->guest_sbdf.sbdf =3D ~0;
+    rc =3D add_virtual_device(pdev);
+    if ( rc )
+        goto out;
+#endif
+
     for ( i =3D 0; i < NUM_VPCI_INIT; i++ )
     {
         rc =3D __start_vpci_array[i](pdev);
@@ -108,11 +168,14 @@ int vpci_assign_device(struct pci_dev *pdev)
             break;
     }
=20
+ out:
+    __maybe_unused;
     if ( rc )
         vpci_deassign_device(pdev);
=20
     return rc;
 }
+
 #endif /* __XEN__ */
=20
 static int vpci_register_cmp(const struct vpci_register *r1,
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 57391e74b6..84e608f670 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -462,6 +462,14 @@ struct domain
 #ifdef CONFIG_HAS_PCI
     struct list_head pdev_list;
     rwlock_t pci_lock;
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    /*
+     * The bitmap which shows which device numbers are already used by the
+     * virtual PCI bus topology and is used to assign a unique SBDF to the
+     * next passed through virtual PCI device.
+     */
+    DECLARE_BITMAP(vpci_dev_assigned_map, VPCI_MAX_VIRT_DEV);
+#endif
 #endif
=20
 #ifdef CONFIG_HAS_PASSTHROUGH
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 60bdc10c13..4a53936447 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -21,6 +21,13 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
=20
 #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
=20
+/*
+ * Maximum number of devices supported by the virtual bus topology:
+ * each PCI bus supports 32 devices/slots at max or up to 256 when
+ * there are multi-function ones which are not yet supported.
+ */
+#define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
+
 #define REGISTER_VPCI_INIT(x, p)                \
   static vpci_register_init_t *const x##_entry  \
                __used_section(".data.vpci." p) =3D x
@@ -155,6 +162,10 @@ struct vpci {
             struct vpci_arch_msix_entry arch;
         } entries[];
     } *msix;
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+    /* Guest SBDF of the device. */
+    pci_sbdf_t guest_sbdf;
+#endif
 #endif
 };
=20
--=20
2.42.0

