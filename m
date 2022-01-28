Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0D749FFF3
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 19:09:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262110.454213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDVft-0003oP-EY; Fri, 28 Jan 2022 18:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262110.454213; Fri, 28 Jan 2022 18:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDVft-0003ll-BQ; Fri, 28 Jan 2022 18:08:41 +0000
Received: by outflank-mailman (input) for mailman id 262110;
 Fri, 28 Jan 2022 18:08:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RLMC=SM=epam.com=prvs=40275dfd99=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1nDVfr-0003lf-3T
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 18:08:39 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f5eae63-8065-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 19:08:37 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20SHxc7t025473;
 Fri, 28 Jan 2022 18:08:26 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dvn2qr2b7-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 18:08:26 +0000
Received: from AS8PR03MB7585.eurprd03.prod.outlook.com (2603:10a6:20b:34a::20)
 by VE1PR03MB5597.eurprd03.prod.outlook.com (2603:10a6:803:11d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Fri, 28 Jan
 2022 18:08:21 +0000
Received: from AS8PR03MB7585.eurprd03.prod.outlook.com
 ([fe80::4c60:e636:e8dd:967]) by AS8PR03MB7585.eurprd03.prod.outlook.com
 ([fe80::4c60:e636:e8dd:967%5]) with mapi id 15.20.4930.015; Fri, 28 Jan 2022
 18:08:21 +0000
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
X-Inumbo-ID: 4f5eae63-8065-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLuP4WJhBtc7qQtCJH+/Jqdjhw/M4zJAeBwqUYfdSRSIVB00g7ptcaL/BFljvrBklDXNHRTkgT5CCgdxrrr53DQZzCWHJWe3xQOagUpIcS6E14fLzKeZIdnUkTPoPgAf08DZLpDeE0t+wFztGmLk3ECvfxFSTsRLh1j0HmPAB3FbMey+H1u9wldN5TgpD+TxQN6O8SN9OAfJrU6XzkiOToupBBTlgmSzBVwd5RPURnLOxsHRywYwpnKGnsWDgm5Xns+NmM1rrwVUssoG6erppZAk05g8dv3Gdrr87LxXm4IkgrQfv55gF9RZyZOuTiqklpQ7KYziVVbAmy3Ds28H7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66PlUvp9Xke4PZdGPPKolC64NlTZ9JLKBhtaWW3wxGs=;
 b=luJRfXBEFHudcSb426quTKOQKLxL3Me6cl61kvVe8N6N8r/C8rdwM+P2Jr50UYtq7oNcz1/xP+Mt28RZv+dlAun2frI56ySzVQLRqiQUYiMuQyE1cXX0VmTB5ZTzt1ZgmlUsoItV6IQWMWyPVOkElXHGnzOB+6zXGK223txb1gCoSKeDpO5cmuW+Tyz9avPqfDSp4W8NIkOeoPkLCETL3/uhufz9BNBhSMI2zQ6b1gyKCMg/lTPbXc9HUvMdcKU/Jm1W7cwdpOmxWHcSHUH4Da5y7vxfOlykokqSkxmEkdw58pQAa6RKIga9zb8hd0f7XQTUGUPjPjeRavQr/tjbWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66PlUvp9Xke4PZdGPPKolC64NlTZ9JLKBhtaWW3wxGs=;
 b=ZE7uK3ay4js1Z52+QgQk+BO2hB+LPvg8nSEcTlWnYVSC7yhTAQBfWoiVKowsJnx7ygrdyBd2aSDABboAHQwDJmcI8EIpj+LrQeBG1YOmHmgcQ5jln+QtyX+DO/Rdm2ZrnhBX9vlAkBis6KNSp8cJmOm/I9eo/s1OEhDNYbUcyzMWtVkNMcrXKT0EMCKQElhLfSvUgok53OMP2++7+pwcGCALEjhwpLxm9qbsh7VKCC5wGCibYc/XZcsQt5Y9LZiCqehuWYOQ1opPo9JbxfaL5PVd197V5sp+roX0FaYCjATbOUVgsh766vZ7374daRfKPkOTiB6F7szeUQWbfntE1Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
CC: Oleksandr Tyshchenko <olekstysh@gmail.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul
 Singh <rahul.singh@arm.com>,
        Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH V3 2/2] iommu/arm: Remove code duplication in all IOMMU
 drivers
Thread-Topic: [PATCH V3 2/2] iommu/arm: Remove code duplication in all IOMMU
 drivers
Thread-Index: AQHYE7f+bZ++2ph9sECkyhNAfkn036x3SlsAgAFyBgA=
Date: Fri, 28 Jan 2022 18:08:21 +0000
Message-ID: <877dajhgxb.fsf@epam.com>
References: <1643313352-29940-1-git-send-email-olekstysh@gmail.com>
 <1643313352-29940-3-git-send-email-olekstysh@gmail.com>
 <1532ec77-17d3-665b-3c19-ab8fd4147a7d@xen.org>
In-Reply-To: <1532ec77-17d3-665b-3c19-ab8fd4147a7d@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 27.2
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfa7aca5-00e7-4feb-24cf-08d9e2892b6e
x-ms-traffictypediagnostic: VE1PR03MB5597:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VE1PR03MB5597FB00B790321AC6A7E4ABE6229@VE1PR03MB5597.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pFR97Y0OGRVcdbschHxtdQReh4ANyRRpRrkZsIgPUpS5lKp7TRf5E64vvoGO52xER36wu0+IFD35G1aGX2m8+y8M0JlTTtWNUaxejqI7tEtcpOt8LTnmpIBPY8MKs38UEJabwToKhj58z/LqM4vXcMLa5z7XiS1GphKNKEhTpPAZW259FLKyxIBrfuJt/PaBxvY98bYnHoqNEU/F+IXtaG6SnmkZ9yy2kOZS/qEAYDTDOofDXMoBCjPWeFcLcNPRecSTwjK41SlV05zXMBvvqc8BsPa52r7nn9MGvkTR5Bcwe6ZtRCRUE7zcw5yizl/U0hxjpr+jZ0JWlHIb93+pq+Ik+Ebk9Iksqy8ekFVu3CdpPxilnYGG99+ypGH977KTJej2sT8cHpi2OiL5FbJDMNtqt9LJQ+Yy2qb/gBgQS3oBTycweebKcIL8Uj+ssvqqnz57QkJJmYoMCGKKqS54v6RTakACdKYKElwvOeVfsGeDFT6WHT7WOb8O63YOrPCSMoqd/9d6y+37KaS1+nxABaFm7PtDc37ZbnfXpbbnAKvORrZWyHo7lrksIwiQ0ExFPQbf6hXpBu5Z2piq27E6OMcM/5uNQXoXQZ/ZOmgHKqaKsR9XOs1KirLu6P0LFUID+PGrR7hNHC9FKGgReoPXlx/i/BTJh5mSip5KaDuV7JuBlAdN4v8P12TeaJPQ6EBX4cHp3GtLrg45X2UR2giK9Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB7585.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(86362001)(55236004)(71200400001)(83380400001)(2906002)(26005)(508600001)(6486002)(6506007)(122000001)(5660300002)(4744005)(66476007)(8676002)(2616005)(107886003)(186003)(38100700002)(38070700005)(316002)(4326008)(8936002)(66946007)(66556008)(6512007)(36756003)(66446008)(6916009)(64756008)(76116006)(54906003)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?flzwX0OYp3Ti7Y2PONzS8nZ2LF88/0sU7XFSUycX/bMYS+Xrvg+kh826nS?=
 =?iso-8859-1?Q?UGRdYXhxx94tNZCBOtsPSt2Y7tE4e80Mh2BMachTvcLoZ9ud1j+3HN/3ax?=
 =?iso-8859-1?Q?Ng6GBDEMF3JLAGlzTWGBwfWG11jsauP69sWOsLQrf7GtQ2VK2XbzjLn+sH?=
 =?iso-8859-1?Q?4xWlH1a9Byfr2FLYCvTo1Koc3fVuT392KbVjWMXkyyxHkqEaedNF22KrFJ?=
 =?iso-8859-1?Q?s/sW6tEr4dErEGFTSL+W7zEjQuzC3sziDUeM/alwEPXiwz0oh0FNEgUk5G?=
 =?iso-8859-1?Q?yjomhp8HisIDeCEvxTA5N8N5NbERKTeHjNNtUJgs0p/eh4oe3jSqtz2X4n?=
 =?iso-8859-1?Q?XFkti/SRioDLIGAwpiPPx9c/NSQwlaQXJulZof8JYblwx2v9k7CoNQQnxf?=
 =?iso-8859-1?Q?jox6teAKSv5+AC9OSs5zgQ/FP9rfxttgCoKgL0r7JgoUOFb0MIWDoookmg?=
 =?iso-8859-1?Q?rYgguW3ixPZIdB2OVDA4NhNqwqncz5uy9DIOUDCp8tmdAU/WEbzTs7U1qi?=
 =?iso-8859-1?Q?NnUh1jbIEe+ecA0utVc6YA1v4MzsP+16MdJZjftFx6SAzIMiBg4s3Y20rA?=
 =?iso-8859-1?Q?21mfH45uuv/yovBp8VJh3IDZ7U2C9rDDeCRddnCItDr/GXMLnKs50LSKf3?=
 =?iso-8859-1?Q?jTi/VAgjCvtSd0aXWfDcT2VxxCgDbrDKFej3PpM8JOEALMDanJv4+LeEXs?=
 =?iso-8859-1?Q?c/R8JEVNvJRXfAj5cVhniXvx5GPeSScbauskWPKmO4qGAAdX911HukSe4T?=
 =?iso-8859-1?Q?5IiXPMheXwbq/wv2YoCETDxfpKRFtjCAqPtaatjE/yo2IgNRlPLl6cV5sM?=
 =?iso-8859-1?Q?H2FxeG9nX0GQFHYDPvQFRBHgwi/b8V2bviH4AtstH5sbIK0kImDOC2gNHC?=
 =?iso-8859-1?Q?nugp2AfXBHL6tcjQGJnRxJe0ZrWpp4sB1scy9Mz4HNzdSlmEXJE+S4ox75?=
 =?iso-8859-1?Q?KYHCV2wlC5ISTnq197irlP4RlOs535ijGAzSFKrSrdYD/ATSO6DjVE9Jsv?=
 =?iso-8859-1?Q?twTVpzSojqTSaIx65HZst2YRRcaDpFvjvezWyaPtwxWkpIbql0I6OlcyDz?=
 =?iso-8859-1?Q?hJmNVXjOdHIC5F44v0b6nnRbDmtoCEb447tiwmUhWRtceFbIezIJGy9YCI?=
 =?iso-8859-1?Q?76rTbJLT8GknpdgH2aOxAiAs4baknmmlmJH9ZY1DVLCSLLQwzT5l4M2W8n?=
 =?iso-8859-1?Q?rx74rUylHXTs34CCnFX+nwl01+qnjSVOXlxrqL3Rb27rw3H+eJ8nGoPRYA?=
 =?iso-8859-1?Q?RuuC5kCqAC2C9wQloK2SCu+JuSos5cHEuNhjFQOfqw7Nouu6qOivBopAW5?=
 =?iso-8859-1?Q?HL0Bjjnj0BEzBXhna3hGl0b/2HmgbiO/yck3FJxn3VZZ+MsBv3TV6ZhkjT?=
 =?iso-8859-1?Q?WZ75/pWIOv2/oMw7OcBifdd0+tNlhG9BQ2PFqTjyp2kcHnwseVWGL7ZICO?=
 =?iso-8859-1?Q?otznVu5Vit9Ap2hr/QZF/qOsvd7cSguTlv5367O68G8Bj0ZbJY+UCc0vRI?=
 =?iso-8859-1?Q?nMxIEVmLQl43OUQxdgN6mgMQ1RhHSja9zzd9G7XfQDde9CRzQH0Fw8pZL4?=
 =?iso-8859-1?Q?xr/rW7LJuEURZ3mj9+l4w7HTa9/gIAXCiIfUWhZGilVehXzTB5XmfdaZVl?=
 =?iso-8859-1?Q?6Yg+gC2K+DwwgcnaGykxjx6Q+KShMtcZSSuoUwnSElJNC63J1MmaVgk6zh?=
 =?iso-8859-1?Q?jAJ8u38kcPSDHclA9sdoWRtxseAQpUH01NbfDcByvIdCa6r00eTLw4Wbw4?=
 =?iso-8859-1?Q?Ea7EpPSTEntgkZOhSSiG42Y/4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB7585.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa7aca5-00e7-4feb-24cf-08d9e2892b6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2022 18:08:21.5421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1v6jt5dyQVCHeh4J2IIos+mE0M3nBWtqrBg+J0llQK3gApwTClefFb7IeevFwPeYyTOVzzJjw3f/uiTOaKEa4VSyuHJ1bDzXI8y/CMuoJoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5597
X-Proofpoint-ORIG-GUID: PiA6N5mvFDjDTxxb4luaJ-bmnYkEFAto
X-Proofpoint-GUID: PiA6N5mvFDjDTxxb4luaJ-bmnYkEFAto
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_05,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxscore=0 bulkscore=0 mlxlogscore=620 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201280107


Hi Julien,

Julien Grall <julien@xen.org> writes:

> Hi,
>
> On 27/01/2022 19:55, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> All IOMMU drivers on Arm perform almost the same generic actions in
>> hwdom_init callback. Move this code to common arch_iommu_hwdom_init()
>> in order to get rid of code duplication.
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>
> IMO, the reviewed-by tags should have been dropped with the changes
> you made. So I would like both reviewer to confirm they are happy with
> the change.

Yep, I'm still fine with this:

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>


--=20
Volodymyr Babchuk at EPAM=

