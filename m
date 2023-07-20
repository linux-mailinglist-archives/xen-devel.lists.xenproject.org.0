Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E696075A387
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 02:41:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566305.884982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHja-0002mV-PL; Thu, 20 Jul 2023 00:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566305.884982; Thu, 20 Jul 2023 00:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHja-0002jA-Ls; Thu, 20 Jul 2023 00:41:34 +0000
Received: by outflank-mailman (input) for mailman id 566305;
 Thu, 20 Jul 2023 00:41:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5z78=DG=epam.com=prvs=156527e6f7=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qMHjZ-0002j3-2y
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 00:41:33 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b417c11-2696-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 02:41:31 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36JJMrqp031902; Thu, 20 Jul 2023 00:41:22 GMT
Received: from eur02-db5-obe.outbound.protection.outlook.com
 (mail-db5eur02lp2104.outbound.protection.outlook.com [104.47.11.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3rxgcw1t5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jul 2023 00:41:22 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS4PR03MB8650.eurprd03.prod.outlook.com (2603:10a6:20b:589::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Thu, 20 Jul
 2023 00:41:18 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85%3]) with mapi id 15.20.6588.035; Thu, 20 Jul 2023
 00:41:18 +0000
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
X-Inumbo-ID: 2b417c11-2696-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lnn3e5N8sPwD2uhw0JChihMTjNoNbR8fH0hY7yfPTjnc5VnJVUFFUJZp1YsXVeilJ3p9xGOUpAHTEWsIWCleHaMpK9+nvuTvyVV7nyxbqjIdjRyVZm1IV2w0C1npfB3w8eblEqzXBY7bOEtY7LUKUHctxwI/ro7HlTT8yCHi5Y126p+WrZ6rhDz5iL5naZKkqWZZslJaNrjCsQe3p0hOKlm1L9KaIqnRTn6OKWld6osrI3y/UTa0/huNkW5/IOi3HR/mRYD3PGRGrxWoNgWw31xqEE35vsIKn4n0M9AUoxurdvoSHnGeWxySGMGRNPXsrweMhHkxcHid3u6fSWSPrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rulf/RP7oBEruDr9bd9TTNzHsH02ElpBeA6ViNtKzRM=;
 b=BMskddhvCmXERZie/NwBaYAvIRuFHB5EhtD/nlQGqgXXZESD5xtxgNuOmA6Y+sNtEwN3zptMjfoIy28slNNlaMefOU8sOylvrx4xldEZg/5KyPblGsoz9UCMvvmQO7+T+WTvpXC6/jtC6e1PrzRbEyzW7byxsI1x5FfdsFGkwV1sf5x2YocbzTjyzUkWmZwDcjkUPJ7XXz4C6blsBcBOxFfjHfp8akfo5ri49TG5o3eTGqrO5rM0jmnGoQ0zB+nyDSFAwpgtpyPzR7NMivo6LJBeWnd+5FOKpkCVrZH36+efOLpp6hwLQnYyLtBtk6VSuVWUDoo85yWFna4ziRLA4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rulf/RP7oBEruDr9bd9TTNzHsH02ElpBeA6ViNtKzRM=;
 b=H7aXokX1q/BbetclSExhxyfxu10JuA6hR+eQEDLqOzYax8qAtgZR226w8TRBVs/88DCqu4DIV408kHD+akt/PMq6UvHVEB5zZuprfHRVevxv6/6VnfBCbJWmb2NNwHBJ0rPKue74myBMpux0fqCNwr8bispo9mYc0DfEnY6l1FL6Cy4aCqybcwP+A0/JOg5KA1EMt8KE4/j1TUsCFCqr5qeBxRIIbgFLo2RJBTSQokmz9TQjobFSWBuBYl6/BHoT8AaCHHUKkMGcEtn3e7JAnW9nxTUJ6AHmcBbX9fyay3mTY5zR7hVDEk9EjKXVxjyFnaTzgkZQwUDnv62vSxmUAQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        Paul Durrant
	<paul@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 00/13] PCI devices passthrough on Arm, part 3
Thread-Topic: [PATCH v8 00/13] PCI devices passthrough on Arm, part 3
Thread-Index: AQHZuqGqn2EU3dWVak6ca3YhrfMkhq/Bz9WA
Date: Thu, 20 Jul 2023 00:41:18 +0000
Message-ID: <87mszrfm8i.fsf@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS4PR03MB8650:EE_
x-ms-office365-filtering-correlation-id: 31a475bd-5ff5-415b-cdf6-08db88ba07e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9AvFMQu1hE1OrSd8z8xk7XzWVk60kIGD/fnFGm2RZXoZy41xsKEvMbnlBUttEaRi67LBBBzX2gxylF/CQrLDpSkgNnhYjjyIjNY8AP/CoHx2xtnRJNFUD1F+fKlTHwMxdLbEuW0N7H6UErDU4XpZGg8T3znwHrKB1njw5hHzGFmBTMPL54wxrOXQqXv7vrxQ2My++1SLa16nbHxNA163ie0J6mI1jaRDaP0mWQ7iJ3WKEJq3qgbjipPzU6TN6JB865BKyGncieNXwJaZyXcs6MW6g9lt8mXGs2cPLQyJ95ferWH/ov3NTjA/Pxoase4KO2pjmcx10+0egAMViCJWjGkNGXbbUqdINkw3Al7GpMRBpAwQTWKh03p1EfnHVl559wwbRxd8IubbJsNojalFwQyPjh7GxaiiELQC7fnB+dAbKaIO46ncO0XC/UZ8Wo1GtzI3Lw1nbrpgTf+rBkqA6SdbfKh3qM4iMU46hw/pzWgRdEAp/9yC6Xed1bS6rBd+vV/xBCoyU0UY7T1MRNVE6+6W/LHia3u7AUnUKXOwxvWELSQmsKK7wry/xUaJqlFn2u/m8SuLViCRSZFTvnFXSyz5cnylJDPE+P+o8ZDSwo1iFRz4W7/BTkCkojKwCJKL
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199021)(6486002)(478600001)(83380400001)(71200400001)(6506007)(26005)(6512007)(55236004)(107886003)(91956017)(38100700002)(64756008)(66476007)(66556008)(66446008)(54906003)(76116006)(66946007)(122000001)(4326008)(6916009)(186003)(2616005)(5660300002)(7416002)(316002)(8936002)(8676002)(38070700005)(86362001)(2906002)(41300700001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?smybYYhIJzRhlcDMK/YSc6r+9Bd7VMx1Q46RoQ/WPiKqE3w/stRVeE25+c?=
 =?iso-8859-1?Q?RPqexOVJ3ml/4yab/LRvSltw6BT8+QAvA9qziW3xzqiCOzwU1IstpSYswT?=
 =?iso-8859-1?Q?W/GBo2If5v+0LmvuGPWtedQYl6yI6FWFJ0ETYTr5S0R0bemHfEG22V/1AF?=
 =?iso-8859-1?Q?j3huDWrkTBOeUCsoCNseaV+0CDE7pXv1j0XanQI1ym5qpen2ykB5DJ/EFf?=
 =?iso-8859-1?Q?V/zuxx2CkW9tw8GNb8YDpYKQQaYHrma2iP1Z4jVV9+QjT0xaWHw19ymGmJ?=
 =?iso-8859-1?Q?5pKqUMRb42z6fj9JfHNFf/0E7XDF1wGOK3xtVD88+fxVjjYOhrT9t4SzCM?=
 =?iso-8859-1?Q?r+iV5lXBYECBtd+9eEzTwVqBxjEMTcdFIAT2QF59DsHqeuUiPGWfWvk1x3?=
 =?iso-8859-1?Q?Bs5KRPpN1d1I/YaTh8QE9NvZHIII+28IChWC3IgpMMfJLdAQ04XF3EN/h/?=
 =?iso-8859-1?Q?02DOCCA7C43tqw7rQHwteJhTPjgwanXFNZCep8UBjnGFLvYHlZwifoAbZJ?=
 =?iso-8859-1?Q?tUFkffEOEVrm76ZHndAsT9wYsdIJu43dag0884+Ew8vLX3kJCmUrksbG7X?=
 =?iso-8859-1?Q?7tjHd+8555rM3aOMy/dicxDKghtED3kkEWw/KtxwhygSedpska58ZlAmYf?=
 =?iso-8859-1?Q?FfBve/R0Eu4yFWZ8no1NYqcBhPDxyHcqIAGlK7NQO3PZaaHvAUvzbMWYWu?=
 =?iso-8859-1?Q?4kDCf9xVrfj/pInPK+SVPgpqY6/P6dhXNbNZTGeTcHEctt9vQHx9GEfcqL?=
 =?iso-8859-1?Q?QXV1sP99AAElmyxMl78ygqL0UyYY33m3fRW8ceMvUDIi7OBVbNFZjS8kH6?=
 =?iso-8859-1?Q?RltQ6QKtRs31cgJJqO74klHqWpddajVKOSYMwrPMh0Z0y72m2zsd0Ybmjp?=
 =?iso-8859-1?Q?ReSmfUa7kDUT5RYbX/cNvaw72ND4qMS4CY0Wz0WDhTpkxZMIOH6dGBPugB?=
 =?iso-8859-1?Q?NCm+ujNd1C+VMkU/Ycm0mvrZnVbsjF0kOdrYVjypbF63+/gFtCz2rEFaVc?=
 =?iso-8859-1?Q?GKI4molxehtHiAfE01JvFFpJSDCDauzPX4QGHsrew1qKh1x93WwNfRHDm/?=
 =?iso-8859-1?Q?OlzGYMR/VtoCZ+MQigdGHOahW6HL6+Lqm76ysJYpxxACXeZf0JiSb4Oz43?=
 =?iso-8859-1?Q?oAcSpKC92B8j4bUZzaMyoDSSuNL7rD6wyyzkQ/o8ss4uO/uGr7FFEPGS/2?=
 =?iso-8859-1?Q?UGUE8B1w8TA+EqVQ4/CAAjDf2mSSDoPeCGf7j3Z5tpElXSR1j0z7oEnGO9?=
 =?iso-8859-1?Q?Q3VpOOKFzNka8A4Xg1c1AK5a6078oXKyKHenFAt/2P8U6XokeQYU6PMEFO?=
 =?iso-8859-1?Q?JqrmdHWQhVQcfy/tKIQJuWFjLQL0GdO5yJQOy/fqtfbjn9DKWFEyTka+Tb?=
 =?iso-8859-1?Q?xOacan7ntM5h/iGarjgsN/vHkorbxUnPDlm+v3dfhWzgbtRpWGiD4Q6Bwx?=
 =?iso-8859-1?Q?LwiKhuwEAqaPTLgmZGHB8o1W+VqDHoe3PPGm74em1A6wQQt72quCVMCUC3?=
 =?iso-8859-1?Q?YJKBAZcBwyqRjZsmPaHzNAgZvA47dbH+W51a6vZFeDANluOGcjI787RnLx?=
 =?iso-8859-1?Q?Xu6/kRvoWeaew2fj2acnkBsA07EGAGWfhugj+esVh1tuxqtSuD1Oi+oStX?=
 =?iso-8859-1?Q?cGv0kl0j+tz05bVWzMsDl/7/cffcIvOvbBtbQzHiehrvHQvNb40Yt9Pg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a475bd-5ff5-415b-cdf6-08db88ba07e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 00:41:18.0739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bfMfmPQYjkGx28YZMfn6xOEeQ2e7B3i+fQIlqkKqflwSmPKkwE67lsDUitapF0VDlje+lHSsfR9Z23rwn2C8UNG/6z72RwG9z5oNZD28Se8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8650
X-Proofpoint-ORIG-GUID: geUXcCq6BGclhyMBkFH1Lf6T_53xcXwk
X-Proofpoint-GUID: geUXcCq6BGclhyMBkFH1Lf6T_53xcXwk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_16,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=615 suspectscore=0 phishscore=0 mlxscore=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307200003


Volodymyr Babchuk <volodymyr_babchuk@epam.com> writes:

Hello again,

Looks like I messed up with add_maintainers script and sent this series
without proper CCs. So I am CCing all interested persons only in this
cover letter only.

Sorry for the noise.

> Hello,
>
> This is next version of vPCI rework. Aim of this series is to prepare
> ground for introducing PCI support on ARM platform.
>
> The biggest change from previous, mistakenly named, v7 series is how
> locking is implemented. Instead of d->vpci_rwlock we introduce
> d->pci_lock which has broader scope, as it protects not only domain's
> vpci state, but domain's list of PCI devices as well.
>
> As we discussed in IRC with Roger, it is not feasible to rework all
> the existing code to use the new lock right away. It was agreed that
> any write access to d->pdev_list will be protected by **both**
> d->pci_lock in write mode and pcidevs_lock(). Read access on other
> hand should be protected by either d->pci_lock in read mode or
> pcidevs_lock(). It is expected that existing code will use
> pcidevs_lock() and new users will use new rw lock. Of course, this
> does not mean that new users shall not use pcidevs_lock() when it is
> appropriate.
>
> Apart from locking scheme rework, there are less major fixes in some
> patches, based on the review comments.
>
> Oleksandr Andrushchenko (12):
>   vpci: use per-domain PCI lock to protect vpci structure
>   vpci: restrict unhandled read/write operations for guests
>   vpci: add hooks for PCI device assign/de-assign
>   vpci/header: implement guest BAR register handlers
>   rangeset: add RANGESETF_no_print flag
>   vpci/header: handle p2m range sets per BAR
>   vpci/header: program p2m with guest BAR view
>   vpci/header: emulate PCI_COMMAND register for guests
>   vpci/header: reset the command register when adding devices
>   vpci: add initial support for virtual PCI bus topology
>   xen/arm: translate virtual PCI bus topology for guests
>   xen/arm: account IO handlers for emulated PCI MSI-X
>
> Volodymyr Babchuk (1):
>   pci: introduce per-domain PCI rwlock
>
>  xen/arch/arm/vpci.c                         |  61 ++-
>  xen/arch/x86/hvm/vmsi.c                     |   4 +
>  xen/common/domain.c                         |   1 +
>  xen/common/rangeset.c                       |   5 +-
>  xen/drivers/Kconfig                         |   4 +
>  xen/drivers/passthrough/amd/pci_amd_iommu.c |   9 +-
>  xen/drivers/passthrough/pci.c               |  96 ++++-
>  xen/drivers/passthrough/vtd/iommu.c         |   9 +-
>  xen/drivers/vpci/header.c                   | 453 ++++++++++++++++----
>  xen/drivers/vpci/msi.c                      |  18 +-
>  xen/drivers/vpci/msix.c                     |  56 ++-
>  xen/drivers/vpci/vpci.c                     | 176 +++++++-
>  xen/include/xen/pci.h                       |   1 +
>  xen/include/xen/rangeset.h                  |   5 +-
>  xen/include/xen/sched.h                     |   9 +
>  xen/include/xen/vpci.h                      |  42 +-
>  16 files changed, 828 insertions(+), 121 deletions(-)


--=20
WBR, Volodymyr=

