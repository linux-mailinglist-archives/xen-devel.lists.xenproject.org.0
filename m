Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EA7801976
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 02:27:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645835.1008295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Emx-0003Xl-TI; Sat, 02 Dec 2023 01:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645835.1008295; Sat, 02 Dec 2023 01:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9Emx-0003K7-Li; Sat, 02 Dec 2023 01:27:23 +0000
Received: by outflank-mailman (input) for mailman id 645835;
 Sat, 02 Dec 2023 01:27:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jVJG=HN=epam.com=prvs=6700ee1bd8=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r9Emu-000271-OH
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 01:27:20 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed77f349-90b1-11ee-9b0f-b553b5be7939;
 Sat, 02 Dec 2023 02:27:17 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B20exWc004068; Sat, 2 Dec 2023 01:27:15 GMT
Received: from eur02-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur02lp2040.outbound.protection.outlook.com [104.47.11.40])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uqt8mg1hm-5
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
X-Inumbo-ID: ed77f349-90b1-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCQtJj4C3OyLvyP07sjtYz/XMAIavCGvgfPgqI078Uw4ifiMe2Ks+WDclK3kAA8fmW54UUckTOzQdf0l8lzcfjY89SmN8z6sl+pgCd9HRA/6UDrpwsC6tUwgaeyXOXq8mVWtMuvkL7wIsnh8I1GablCWsxfDc1+CRUlGOyKWhag6t9QVi5zmFPjPMpoQ2c2Qp77v1sIPhGeRsXH2+z7M2r67U04qM/VseKQl2gZt2Tsch5pSlVioaFbWMbeaT7cMixrDxe/wZ4QipHV9V6NN4Jwd4/FymYiEn/EXyKu5OO+QhgJDvhrwBefjXbi9ElqsulJMsSjakmS9pW/GiVj2gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3pAsw+LQMW37ya9xY/fsEtMgle4eyEFHTErMj7PTwA=;
 b=UjyMO+dt5QnyuFZ1My3/vv+m+fj4UzGRzGlkr1lOiaKOPtJguC9oKSMvVZBJhMCG8yL6GSyFq81QgJKMdsFpcesFeSQNkmB74gqsjmchQyl0C3eDpcOfm6RHWhm95JDUfB53y1Ogr30MWRncLI0EFchySU3O9nl7xUNUD98ZU6l35O1WwoGiHC8GTOiFnzdwYAuUeFKNuiwFERL6imOm7J94CxNYtuyQRrF6QdL/J9Kh+AJDthNcoa+cs7xKWvkWV7+jRk9kW9kVsFtqO8B6uk4J4tqZYNvdjyppEpptPm7bBpvsLW/p4duIdx9iWGJnSme1jQeoRAzTWruFEbih0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3pAsw+LQMW37ya9xY/fsEtMgle4eyEFHTErMj7PTwA=;
 b=lNrTyzTZs3cOeRQ8SMNKIowGFqODO2etAm86cg3flk9Tz/BppgSo271B3C5/42D3YCCD5JG5edmBFfrkeIlh6eHZlh1NrENsCj2Na8tbYZE+9lPuMXKrMicF8/tjx5zb/Tpo1xiL0m1yQDKHiVjh5ewP6ssyBZ8mRAXQajGjiJaiTxn0XhkiNm8Pi90FGwpo3d2tqOEpfQi/5mw7GseIHs2Lp2BAmmIEhXHwTe2rlOxvujPMEs5g78+PcT8U5X3xUK0Pmwyj6ecXCTvu+3KkCntcTpzTNwzaN65HGDMdp5PT9FjIV1jehRdoqlb/dvbeVhpekjWHBRsk7ntJ8kmLHQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v11 12/17] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v11 12/17] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Index: AQHaJL6pbF2piO+GXk2gsbpguvwtEw==
Date: Sat, 2 Dec 2023 01:27:05 +0000
Message-ID: <20231202012556.2012281-13-volodymyr_babchuk@epam.com>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB8599:EE_
x-ms-office365-filtering-correlation-id: 7eeb0784-d548-49f3-edaa-08dbf2d5cdcd
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3E8QrFBpn4d2JTFqbXNlmc+7Y5PmnvBKTQWcUZG/y7btkyH54A+cFcPtVBXSJR6yOImji76Nn/miJN2JMoeMWOfT1T3ZWXdUEjai/hbFhT9hbKKaYrDneFHtgVP16JQxTqU2SMKPpmrFV5plS1z8y1YgYR1F6zS2PR3SV8Xe8dsA/LXULHA+fNgkYlXiokvxA0pA+00Z68xsmGdhg1p9F7rcpo6jvjaWMOsUHK3+z3mOd0Lh3PcjC24fjLq9p9bhoRGZTvuPIbn/V9JsSyOGvUbzHZem+zYAZae0kf9/0gObSWNq+fnEqYwzdL5E/tI11NBmHHOrL+q487cTTbKycNilwRjj4QI3HENyCOMYz8CCBfUU18R/yzFyShNG/jQH+S+JAda8Zc+IjnrGtGh+U7UWMFJftFYcuJqhiBs92JniKzWS0uZln0D6WM90aCexM0KIX0tQhdkbObct4GOd/dmZAvrGx6mrWHRwJ2tL5uuf9Ca2VSNwuWL2v8lq5ZmLK9GVrSbksb/KjEyPJf/rr+U9hYOVt2bjX2HqTG3QbAijr1Sm8WykrHTWtcx4k1SHg9GE6WArNIZhyEeZWurih54D1QJKM4HogbfI8b8SH9DrwSl8jSB0LS5cdv0gykde+O62AQAN8+RELsZacs4DGWrsGn9DOdcp1VcejnkGOpo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(230273577357003)(230173577357003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(86362001)(4326008)(8676002)(8936002)(2906002)(38070700009)(41300700001)(36756003)(2616005)(107886003)(1076003)(6512007)(6506007)(55236004)(83380400001)(6486002)(478600001)(26005)(71200400001)(6666004)(38100700002)(122000001)(316002)(91956017)(54906003)(64756008)(66446008)(6916009)(66476007)(66556008)(76116006)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?LFbhjfAeQtPViVq9hvudyKubyzH56K+b0vUaMLbp6E/HmsGzeOFPs8MMj7?=
 =?iso-8859-1?Q?IIJ2F225wxlWQCe5O7XCyXMTJGsU9POIElFhT77Y52xE40AenBP0ViYLws?=
 =?iso-8859-1?Q?ssAjFEQvn7cM1xO2W7xzrE19UN+HwoS32fx+czCcRQjH4CpowhTb71wcOW?=
 =?iso-8859-1?Q?E6+HdvXb2YLN+kLkZv1GqsXcKshEOKgveQkuCRtAQsyRXDRXDkdTcVEpuc?=
 =?iso-8859-1?Q?2Qdg0pRE0YK9cie5kkTttseYAQUhjjwLPSnKrXqqRdUEa/b/YXBsQzNKmk?=
 =?iso-8859-1?Q?nbZmPjXsx94Vla62IlXjQGcDXDvf7kCKm2e6Oe21POX0GepJ5LP4Zr9BQ7?=
 =?iso-8859-1?Q?G5u6760ZfdKk2I1pHicGcw6wUl5s3rc2/oeukRbzXKZdSB7JwbgG/LwVNz?=
 =?iso-8859-1?Q?JAf4t4e/ZjEWZ7ZaABCq4e1ZpJAgdsqKuCiuZmzKjFOnyo7Mmf1fHTTTQ8?=
 =?iso-8859-1?Q?u4kn/LJ7qoN5AIT3heXE2z1SFnfRapTKqCm0yYPc2cTNMwqFbJUEG1xxIc?=
 =?iso-8859-1?Q?kFN00OM1vF3/cEMaxpxDBoKXsLtxjAKR7ZrWi8EcLxyLHbAYkTio5moNEr?=
 =?iso-8859-1?Q?wL5QmADXX9CKVdP18zibJWpKDRk1KkLBD/vbsn1u0v8HIvq7+jyP9xOsHW?=
 =?iso-8859-1?Q?PubVNABm0Han+JeLJPUBl+1HJLYZIDvohnv0xg0gT/PBNLqD/f/nW6QA3z?=
 =?iso-8859-1?Q?OvteMKUGwMuYhFPDVeViFPm0ZpRRp/WjYmMrFvR6+6jZSMkbseVlKjpABB?=
 =?iso-8859-1?Q?490ZX5ueTcxGCqfeAyzmYVSgg/PGMrigtecbMGJ6MNoOmK75YA5FOBk1iW?=
 =?iso-8859-1?Q?EpL5IeYNbD0X2hL8yniQ1lpxBARF96mKjgGRPNCD66toh/iVe5T7l/iWQz?=
 =?iso-8859-1?Q?Z41+h46nksvMdSAkIP7OHzQLAMFLJ4VLwz8abQ1AYr1cX6h14olU1B2IGL?=
 =?iso-8859-1?Q?fXvbnCR8pE2w4HEowo4RdXIfg1XQIQDzKXF9jFYt+RjppvbWPkg+1lz05f?=
 =?iso-8859-1?Q?niA5KVF51CV+tu/olh6pE44AazDozPxz5130LqmbbMBwNV/qGhsEBGZ9Up?=
 =?iso-8859-1?Q?aafHypnhUW68yycvlIl3hrcmVdPUiOtchv4rhDdxrPQEefZFzO/ac1s2Mh?=
 =?iso-8859-1?Q?tjrs8hj6lA9B+baeBRATDXLjB09XZcGj8dF2GXqIb7jSI90/iUTVxVdER7?=
 =?iso-8859-1?Q?MGdll/ttJqss7tvNME8G6rigZDiKNaK6lJXMpvQc9d10UYdEb225asbwyL?=
 =?iso-8859-1?Q?A8dRTmSIeyvg4aNdyvXyGFWbx7dZE60dsa07CKfOQegAsVr41pYk1bWZb0?=
 =?iso-8859-1?Q?/CzI84qFBvQonnDnv2AdxMfw7t19U95kx/wbNBWYzxRqs5VGS6u2WrT6xD?=
 =?iso-8859-1?Q?UT6bgFGr5Fp7U4xp2WUPfUyseMnHIdB/1EhlBag5HrpIuhpHTs3/aq9UcZ?=
 =?iso-8859-1?Q?QakadqKipHVpnP5NNcyUFGz+fDTetW8i48UeZiJlNy7E7HhqUeEBRQ/tf2?=
 =?iso-8859-1?Q?0DocKDi8AkiYrN6ruqmz0L9OSl3rF36ubpGf15ufZBtoU69XrRSfc/n85A?=
 =?iso-8859-1?Q?eV/KIivTMh3XwLc5JHZmH1ijGc7z7cQOuURJGCTikkiYle1cCp0hGH56L0?=
 =?iso-8859-1?Q?gTYPrTCgQszvDhNv1rUtL8FmfXMe2IRKJUx5Ml+8NRK0nL7GfTrWUDUA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eeb0784-d548-49f3-edaa-08dbf2d5cdcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2023 01:27:05.9424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: scQYzCULk6geVBzzqAFkPuaJciwpisnhaDop1ed+LL5jDiOFuXHcwMu4DtPJHVmPju1nOD9Jo9WIp2VexLbdZ64bsV/hhZutt5FQMJV4v3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8599
X-Proofpoint-ORIG-GUID: w3MQhgRcfDnR5a8Ep2nAdKiHh-HfIuWo
X-Proofpoint-GUID: w3MQhgRcfDnR5a8Ep2nAdKiHh-HfIuWo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312020008

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Xen and/or Dom0 may have put values in PCI_COMMAND which they expect
to remain unaltered. PCI_COMMAND_SERR bit is a good example: while the
guest's view of this will want to be zero initially, the host having set
it to 1 may not easily be overwritten with 0, or else we'd effectively
imply giving the guest control of the bit. Thus, PCI_COMMAND register needs
proper emulation in order to honor host's settings.

According to "PCI LOCAL BUS SPECIFICATION, REV. 3.0", section "6.2.2
Device Control" the reset state of the command register is typically 0,
so when assigning a PCI device use 0 as the initial state for the guest's v=
iew
of the command register.

Here is the full list of command register bits with notes about
emulation, along with QEMU behavior in the same situation:

PCI_COMMAND_IO - QEMU does not allow a guest to change value of this bit
in real device. Instead it is always set to 1. A guest can write to this
register, but writes are ignored.

PCI_COMMAND_MEMORY - QEMU behaves exactly as with PCI_COMMAND_IO. In
Xen case, we handle writes to this bit by mapping/unmapping BAR
regions. For devices assigned to DomUs, memory decoding will be
disabled at the initialization.

PCI_COMMAND_MASTER - Allow guest to control it. QEMU passes through
writes to this bit.

PCI_COMMAND_SPECIAL - Guest can generate special cycles only if it has
access to host bridge that supports software generation of special
cycles. In our case guest has no access to host bridges at all. Value
after reset is 0. QEMU passes through writes of this bit, we will do
the same.

PCI_COMMAND_INVALIDATE - Allows "Memory Write and Invalidate" commands
to be generated. It requires additional configuration via Cacheline
Size register. We are not emulating this register right now and we
can't expect guest to properly configure it. QEMU "emulates" access to
Cachline Size register by ignoring all writes to it. QEMU passes through
writes of PCI_COMMAND_INVALIDATE bit, we will do the same.

PCI_COMMAND_VGA_PALETTE - Enable VGA palette snooping. QEMU passes
through writes of this bit, we will do the same.

PCI_COMMAND_PARITY - Controls how device response to parity
errors. QEMU ignores writes to this bit, we will do the same.

PCI_COMMAND_WAIT - Reserved. Should be 0, but QEMU passes
through writes of this bit, so we will do the same.

PCI_COMMAND_SERR - Controls if device can assert SERR. QEMU ignores
writes to this bit, we will do the same.

PCI_COMMAND_FAST_BACK - Optional bit that allows fast back-to-back
transactions. It is configured by firmware, so we don't want guest to
control it. QEMU ignores writes to this bit, we will do the same.

PCI_COMMAND_INTX_DISABLE - Disables INTx signals. If MSI(X) is
enabled, device is prohibited from asserting INTx as per
specification. Value after reset is 0. In QEMU case, it checks of INTx
was mapped for a device. If it is not, then guest can't control
PCI_COMMAND_INTX_DISABLE bit. In our case, we prohibit a guest to
change value of this bit if MSI(X) is enabled.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---

It is better to rework this patch using new register handling tools
that Stewart Hildenbrand upstreaming right now.

In v11:
- Fix copy-paste mistake: vpci->msi should be vpci->msix
- Handle PCI_COMMAND_IO
- Fix condition for disabling INTx in the MSI-X code
- Show domU changes to only allowed bits
- Show PCI_COMMAND_MEMORY write only after P2M was altered
- Update comments in the code
In v10:
- Added cf_check attribute to guest_cmd_read
- Removed warning about non-zero cmd
- Updated comment MSI code regarding disabling INTX
- Used ternary operator in vpci_add_register() call
- Disable memory decoding for DomUs in init_bars()
In v9:
- Reworked guest_cmd_read
- Added handling for more bits
Since v6:
- fold guest's logic into cmd_write
- implement cmd_read, so we can report emulated INTx state to guests
- introduce header->guest_cmd to hold the emulated state of the
  PCI_COMMAND register for guests
Since v5:
- add additional check for MSI-X enabled while altering INTX bit
- make sure INTx disabled while guests enable MSI/MSI-X
Since v3:
- gate more code on CONFIG_HAS_MSI
- removed logic for the case when MSI/MSI-X not enabled
---
 xen/drivers/vpci/header.c | 53 ++++++++++++++++++++++++++++++++++++---
 xen/drivers/vpci/msi.c    |  6 +++++
 xen/drivers/vpci/msix.c   |  5 ++++
 xen/include/xen/vpci.h    |  3 +++
 4 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 21b3fb5579..bc2ebe125b 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -167,6 +167,9 @@ static void modify_decoding(const struct pci_dev *pdev,=
 uint16_t cmd,
     if ( !rom_only )
     {
         pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
+        /* Show DomU that we updated P2M */
+        header->guest_cmd &=3D ~PCI_COMMAND_MEMORY;
+        header->guest_cmd =3D (val & PCI_COMMAND_MEMORY);
         header->bars_mapped =3D map;
     }
     else
@@ -518,14 +521,40 @@ static int modify_bars(const struct pci_dev *pdev, ui=
nt16_t cmd, bool rom_only)
     return 0;
 }
=20
+/* TODO: Add proper emulation for all bits of the command register. */
 static void cf_check cmd_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t cmd, void *data=
)
 {
     struct vpci_header *header =3D data;
=20
+    if ( !is_hardware_domain(pdev->domain) )
+    {
+        const struct vpci *vpci =3D pdev->vpci;
+        uint16_t excluded =3D PCI_COMMAND_PARITY | PCI_COMMAND_SERR |
+            PCI_COMMAND_FAST_BACK | PCI_COMMAND_IO;
+
+        if ( (vpci->msi && vpci->msi->enabled) ||
+             (vpci->msix && vpci->msix->enabled) )
+            excluded |=3D PCI_COMMAND_INTX_DISABLE;
+
+        cmd &=3D ~excluded;
+
+        /*
+         * Show guest that we allowed it to change bits that are not
+         * immediately excluded. Do not show change to
+         * PCI_COMMAND_MEMORY bit till we finish with P2M
+         */
+        header->guest_cmd =3D (header->guest_cmd &
+                             (excluded | PCI_COMMAND_MEMORY)) |
+            (cmd & ~PCI_COMMAND_MEMORY);
+
+        cmd |=3D pci_conf_read16(pdev->sbdf, reg) & excluded;
+    }
+
     /*
      * Let Dom0 play with all the bits directly except for the memory
-     * decoding one.
+     * decoding one. Bits that are not allowed for DomU are already
+     * handled above.
      */
     if ( header->bars_mapped !=3D !!(cmd & PCI_COMMAND_MEMORY) )
         /*
@@ -539,6 +568,14 @@ static void cf_check cmd_write(
         pci_conf_write16(pdev->sbdf, reg, cmd);
 }
=20
+static uint32_t cf_check guest_cmd_read(
+    const struct pci_dev *pdev, unsigned int reg, void *data)
+{
+    const struct vpci_header *header =3D data;
+
+    return header->guest_cmd;
+}
+
 static void cf_check bar_write(
     const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data=
)
 {
@@ -755,8 +792,9 @@ static int cf_check init_bars(struct pci_dev *pdev)
     }
=20
     /* Setup a handler for the command register. */
-    rc =3D vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_CO=
MMAND,
-                           2, header);
+    rc =3D vpci_add_register(pdev->vpci,
+                           is_hwdom ? vpci_hw_read16 : guest_cmd_read,
+                           cmd_write, PCI_COMMAND, 2, header);
     if ( rc )
         return rc;
=20
@@ -768,6 +806,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
     if ( cmd & PCI_COMMAND_MEMORY )
         pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEMOR=
Y);
=20
+    /*
+     * Clear PCI_COMMAND_MEMORY for DomUs, so they will always start with
+     * memory decoding disabled and to ensure that we will not call modify=
_bars()
+     * at the end of this function.
+     */
+    if ( !is_hwdom )
+        cmd &=3D ~ (PCI_COMMAND_MEMORY | PCI_COMMAND_IO);
+    header->guest_cmd =3D cmd;
+
     for ( i =3D 0; i < num_bars; i++ )
     {
         uint8_t reg =3D PCI_BASE_ADDRESS_0 + i * 4;
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 6ff71e5f9a..6cfa9aea00 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -70,6 +70,12 @@ static void cf_check control_write(
=20
         if ( vpci_msi_arch_enable(msi, pdev, vectors) )
             return;
+
+        /*
+         * Make sure domU doesn't enable INTx while enabling MSI.
+         */
+        if ( !is_hardware_domain(pdev->domain) )
+            pci_intx(pdev, false);
     }
     else
         vpci_msi_arch_disable(msi, pdev);
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index b6abab47ef..2aa2833160 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -97,6 +97,7 @@ static void cf_check control_write(
         for ( i =3D 0; i < msix->max_entries; i++ )
             if ( !msix->entries[i].masked && msix->entries[i].updated )
                 update_entry(&msix->entries[i], pdev, i);
+
     }
     else if ( !new_enabled && msix->enabled )
     {
@@ -135,6 +136,10 @@ static void cf_check control_write(
         }
     }
=20
+    /* Make sure domU doesn't enable INTx while enabling MSI-X. */
+    if ( new_enabled && !msix->enabled && !is_hardware_domain(pdev->domain=
) )
+        pci_intx(pdev, false);
+
     msix->masked =3D new_masked;
     msix->enabled =3D new_enabled;
=20
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index c39fab4832..a50dad6968 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -87,6 +87,9 @@ struct vpci {
         } bars[PCI_HEADER_NORMAL_NR_BARS + 1];
         /* At most 6 BARS + 1 expansion ROM BAR. */
=20
+        /* Guest (domU only) view of the PCI_COMMAND register. */
+        uint16_t guest_cmd;
+
         /*
          * Store whether the ROM enable bit is set (doesn't imply ROM BAR
          * is mapped into guest p2m) if there's a ROM BAR on the device.
--=20
2.42.0

