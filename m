Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3B54FC291
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 18:37:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303181.517252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndx2U-0003SN-2i; Mon, 11 Apr 2022 16:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303181.517252; Mon, 11 Apr 2022 16:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndx2T-0003Q8-Vz; Mon, 11 Apr 2022 16:37:17 +0000
Received: by outflank-mailman (input) for mailman id 303181;
 Mon, 11 Apr 2022 16:37:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HKFE=UV=citrix.com=prvs=093f373ac=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1ndx2R-0003Q2-TC
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 16:37:16 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a316256c-b9b5-11ec-8fbc-03012f2f19d4;
 Mon, 11 Apr 2022 18:37:13 +0200 (CEST)
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
X-Inumbo-ID: a316256c-b9b5-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649695034;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PXnKRUiEu3flkVGZJuSE892mOyZnkhJ96C6PfmmXlqw=;
  b=U2kt6+ope0PxyhFfFMh1Ee/PmHgJauS4z7cKonXZbQAqvwJDKKkYODfk
   hJCnqT62weunWZtsiP3TK3oxDFefevOzKKQNnXLWhCWP1XzxGh1HV08qK
   z8D7TG+Pg54QEzAtHMy2smmrPFX/tqmV9Ktn7l8Xy/KWHGazBoNAR3wO7
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68569806
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:aQahEKoG3iUdlWSWGVviAwcGWYZeBmKPZRIvgKrLsJaIsI4StFCzt
 garIBnSMq6PY2L8c49zbI2x8x4P78eEndIxHgI/+yo1FSgQ9puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 Iqq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBFIneqd89dyliHShBFJEf34TsHXiQmJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbCFrAiSJ/OWbrD4dtw1zYsnMFeW/3ZY
 qL1bBIxPEmeMk0XZD/7DrpkwOiZviOhTwEfrU2njrI242rrxytuhe2F3N39JYXRGJQ9clyjj
 n3C13T0BFcdLtP34SGe7numi+vLnCX6cIEfDru18rhtmlL77mAcBBAZT1KTveiyikn4XclWb
 UMT5EIGrq807kWnCMb8Wx6Qp2SNtRoRHdFXFoUS6hyJy6fSyxaUAC4DVDEpQN4sudIyRDcq/
 kSUhN6vDjtq2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nZtRsCqexivX8HDjix
 DbMpy87750fldUO1rm71Vnfjiiwu4PSSQoo+gTQWHnj5QR8DLNJfKTxtwKdt6wZat/EEB/R5
 xDohvRy8sgkKYO8rwypcN8DFY6A26+iCxbggXFGSsxJGyuWx1aveoVZ4TdbLUhvM9oZdTKBX
 HI/qT+997cIYiL0MPYfj5aZTp1zkPO+TYiNuuX8NIImX3RnSOOQEMiCj2a01nulrkUjmLpX1
 XyzIZf1ViZy5UiKIVOLqwYhPV0Dm3tWKYD7H8mTI/GbPV22PiP9dFv9GAHSBt3VFYvdyOkvz
 /5RNtGR1zJUW/Dkby/c/OY7dA5WfCZiW8ur8pMGLIZvxzaK/0l7VZfsLU4JIdQ5z8y5aM+Vl
 p1CZqOo4AWm3iCWQel7QntidKnuTf5CQYETZkQR0aKT8yF7O+6Htf5HH7NuJOVP3LEznJZcE
 qheE+3dU6snd9gy02lEBXULhNc5L0rDaMPnF3fNXQXTiLY8H1eZpYK+JlKHGetnJnPfiPbSa
 oaIj2vzaZECWx5jHIDRbveuxEm2pn8ThKR5WE6gHzWZUB6EHFRCQ8ApssIKHg==
IronPort-HdrOrdr: A9a23:Dqd/GKg7Nl8PN20xwaTQCxQA9nBQX2113DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3IwerwRZVpQRvnhPtICPoqTMuftW7dySSVxeBZnMffKljbdREWmdQtrJ
 uIH5IOa+EYSGIK9/oSgzPIXerIouP3iJxA7N22pxwGLGFXguNbnnxE426gYxVLrWJ9dP4E/e
 +nl6x6Tk2bCBMqh6qAdxs4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUhtUqI1SsF
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVEDPxkQylDb4RG4Fq/QpF491H2mxa1e
 UkkC1Qe/ibLEmhOV1dlCGdmTUIFgxerUMKh2Xo2EcL6vaJOw7SQ/Ax+76xNCGpsHbI9esMoJ
 6i0w+ixutqJAKFkyLn69fSURZ20kKyvHo5iOYWy2dSSI0EddZq3MciFW5uYd499RjBmcga+S
 hVfbXhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zo93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkf8IzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehTKYd0s8LAo23FUgMyPeFOwC1zxdLkHqbrUn8ki
X-IronPort-AV: E=Sophos;i="5.90,252,1643691600"; 
   d="scan'208";a="68569806"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U39HrjAhtuIfIF/eVRxVaYYLfUi7wrk/Asw47QhWomtB0ArzUSLYld6Sy81r8rKhVhREXkJrF8g1oJe8ouCL+yr8V9eneFyMk4i7zPnXoyQpxZHPhzxE68DKb5mlY7o3uX4EeHVSwDE4OKJVdeYVXYl5E/9LOp8XmrDLWEPUN+wW1BeXUCwj7JF3ArQLEZ3Zy2gCHAYz0zrfdpgBKG+kd98Yi1gSc44nOZnUPj8ZTR5pyENfQCSmXGS5+Yb9fbms+cf1mwFj2+0/htVcMzpu+rbYCuT/mCw2zAE9YkWh49oGGw3NNOWK3UJaowIQJGlTqz7Gv0bdFtHQt557364zJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gTF0zyo30UUWmfs8XexpK7uJLFU6+Ul5g3Eh9tnMqc=;
 b=ge8sEiamLRnEu6r02GL6BbruCvWH5JugdrAkkCjs14kXAyIkLmV/1egzIy5xdZvrovUe2v6vMVzvPaWyQ0krbvgwVvC3S34ivCI/EJQTb930K0vHHjJt293E6IOEPCArBoCMibYsOYqsg2noeDmqtFO/vA/aveTdB5j9MOjNE7DxD+jdB0AsVBABhjLkz1qsMBZTe0Jg80L56f67QIfgjHC4xY9BbhiYIxlgCb0N2J84OlZDbMqB2LIcu9Uk2/bQcDZMPApqMJ/GDcnJTNqyWFEeMqeb/25DPWeQwScX4X/hXCxOSSDVx4hEDy6CukfmVO2gFsd7oqBO0Ta2jZ3vVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gTF0zyo30UUWmfs8XexpK7uJLFU6+Ul5g3Eh9tnMqc=;
 b=O3dNQqqjpffrF/3pMh0tCWErzEHOL8MUVAZLRm5ixzrfVwGnWT5YOAP3tai5+8POVNnNt0K7QaAv/m1P0gJ5LmXldZoSj3BIdKlPlLj0DdTumvT0rgPhZum93OZYKpDAiYqCOAKhEJpWCybbbgTYozmzpeyJYuRUAu7x60AcAi8=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, Julien Grall <jgrall@amazon.com>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, "Konrad Rzeszutek Wilk" <konrad.wilk@oracle.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [XEN PATCH v10 7/7] build: adding out-of-tree support to the xen
 build
Thread-Topic: [XEN PATCH v10 7/7] build: adding out-of-tree support to the xen
 build
Thread-Index: AQHYPd9LOZzBp6Umj0ytv6m2JZ6hrazrCFex
Date: Mon, 11 Apr 2022 16:37:03 +0000
Message-ID: <PH0PR03MB6382A643B6F610CC13C227A0F0EA9@PH0PR03MB6382.namprd03.prod.outlook.com>
References: <20220322112238.1117737-1-anthony.perard@citrix.com>
 <20220322112238.1117737-8-anthony.perard@citrix.com>
In-Reply-To: <20220322112238.1117737-8-anthony.perard@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63731587-e5df-48c0-3dcb-08da1bd9824f
x-ms-traffictypediagnostic: DM5PR03MB2985:EE_
x-microsoft-antispam-prvs: <DM5PR03MB2985A01CBA7351F583DDD997F0EA9@DM5PR03MB2985.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /JMZzTAGFZVOIGdQFomSCacm7sNZZPWR3xyIuMXwmqh3jsBQHXSSkLXXAksEfFKyrq+KDVHvxP6dLsgh2JcEXRbYi9btYgCL2abTSMrXsuwzscCVsRd4Q+X4FUHl3taQCqRNOvGJofnhXcWO1PE7EepSmyuDMcYKt3ERYXjS+u/JJrgGcedfl2dkoaLxzwRglGTU3WdN0sJfYa0vU+HI6Fnx49N924a500rqPs5pKxrCLpJ2yhnxBa2s69lelsONb/G0iLiFW77zaPYgpr+2fa0iACA0bW0+h5oJAVNQBTvlcj3RcU/083/4B7NtisPn/dKgV2jw7Jarln5TbPAzptkzhF8unxnlHelMBEYRM3RIEGnDE4swPDblihDjVLIzxpEkvJpQZi8IfAcZT3qg03rGoe+ml52A9U+CU5XA/Co4brXDIAeD60NH7etlOE74edrtBcLaQCmtJhf+xuE6J4IIioNOa5e4hek72kW4BCmj6b+Zt+i4dR8T9qYmrvRNwy5zC2ySIVF3kd621rOliT1edq8mC8gSrJWtrsIGrslDnuL13c3Fs1BBgOXkG0CmNX4HRQUN6WefOzdD0kQdmTV/1B5CJFPqL5DlHut9TqNS/pfY+xh7IXoaIWf5h8VHg9orsuREdlGlx4XZHgAoXpUNqTHFQYtnFsLWUHTfgbNWTTAuMerskt99xr1ELWfaOM4oKkrffMB5asl3bsQfLg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(55016003)(33656002)(38070700005)(71200400001)(54906003)(110136005)(82960400001)(66556008)(64756008)(508600001)(8676002)(91956017)(76116006)(66946007)(4326008)(66446008)(66476007)(122000001)(38100700002)(44832011)(316002)(2906002)(186003)(26005)(86362001)(52536014)(7696005)(53546011)(6506007)(9686003)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?aXGAFMkcDEd8fQmV277Vzk4x7IHxvAxob+Z+dD6NENyeeKp1442MJlvVHU?=
 =?iso-8859-1?Q?C9vLLySffg/w+UY/SA031Bsyvw8l9VJj/fpki4DQasH5dcYQUOknp7BbVd?=
 =?iso-8859-1?Q?cj89WOmAD0e6cJnFHRWU5nGIbpEDyARS+edB0Q6vYGwTpoG+sGHi6mDp9W?=
 =?iso-8859-1?Q?hjo27T2EXJ7MZ+lJ3mabUQwCeOEw4hJjVqfoPckkKDrPAuR5BjjAYz/GRL?=
 =?iso-8859-1?Q?Ct7/z26S86AKbBS6nQzwy+z3F7VBet/JfSr4oVYlZcBMelKK6oQMkFH6k+?=
 =?iso-8859-1?Q?4kGHTzvxyN2NDyY6KNZRViXboppzUvlDVivhK7Wm4BpixCj5NqJgsIpNpH?=
 =?iso-8859-1?Q?r2+03JPCtgAOPQndxh/3zwH8UYQnB5e3wOTDQd4S4nxmOK1tfsT1mYmHum?=
 =?iso-8859-1?Q?Bp2XG4avuaTJ7ealkaL2nNs+61AeF+0J23U0b5oK/wgpUC7bo+ibMPWGY6?=
 =?iso-8859-1?Q?Wo334s6fxxK4De/c4syO4rm8qbeXmA3BhPLEUF8ppaH+LeCugBbGdJA8TF?=
 =?iso-8859-1?Q?2WPvmUJfUiNBcu2BhL6pTpyW0R2fMy+4mGLuRSswWlhSs51W3N7GNto+8y?=
 =?iso-8859-1?Q?TqzHChBRhZGd5bLG3ssCbDffcOotXwFEXaiWKgwxmAYx8Gq/526m/BrcZF?=
 =?iso-8859-1?Q?kuAcNOFioUzyg9Hg/JbuIgNsTXnGZAOTJVIyiyLuQSGyIibRwaC11weHtd?=
 =?iso-8859-1?Q?LnpifEcE6Bu/FtowKQtslbEtxWqqsKgXHLcg+tSRC0NvXnMqVh27gqYmGN?=
 =?iso-8859-1?Q?FjXScu1MJZ3O6462nMn4SnnfP0oYcZlOx8nxCiSrRnXLLQ3GRzNvE1q1+K?=
 =?iso-8859-1?Q?OY9pAupaivmqcBv96W58fmWKfrgOQ75tcJdmi74G+xcOHGVonO6WT8nzUH?=
 =?iso-8859-1?Q?LYN3ZEIG8NR7+oFO6rtOFEel/VyiQFxplyGMv8BWqglIWEfdsqIxUnqH8M?=
 =?iso-8859-1?Q?Dn7zR2yHDTZlTV9vD42iAlnnu7gsU/OcYccuAEfhVP9AL0KbBASIHgFXcE?=
 =?iso-8859-1?Q?CiWL++BXfkOhp+B6/Ps6rFjUWM3o8pSglvc5hjvQJFUNCKA16ir+wyZXIe?=
 =?iso-8859-1?Q?0VVw9Dw0XV2S6kmFEcrgrxt/yguzJ7cSUYnsS+EtxViJT/nF55EHcoFTYo?=
 =?iso-8859-1?Q?W5VkgDfZZ+qiqMXcb7hfSw8r4mKyJIHMpzr9QToyLHXIzx28nLE+DhLP8E?=
 =?iso-8859-1?Q?Sgbg9mhhE2dp72642Q7JRkVOcc0tkx0VR2lSEue6HlWKhHNY4tD1V2hpOd?=
 =?iso-8859-1?Q?ZgBO2BjjhBb+Q85aXLCUsLESSj64qXRxwFd1Vewz2G2cGieK6ZyAWnfnXo?=
 =?iso-8859-1?Q?amSX/Jxncxl28mAGOSTnloJUxjvyroza7DxJDubp6OC+sepB7ZMDBeluoH?=
 =?iso-8859-1?Q?1qpLWfeHzgcSvOrC0sUGFFKLBPb3X70AgV5u1ca/7GGwI8QPAf78LvjdUr?=
 =?iso-8859-1?Q?863Y52GkuKWvZOUZPofB9DRCT63WEzf4whOAwiyzXahBWoUiOx81BDbGpy?=
 =?iso-8859-1?Q?bL9OujCOInFxJtDWxT+zvJ3hh+u9E2wlEy28/uPCIpd9rQw33fgmDt2xA6?=
 =?iso-8859-1?Q?Hra6e/8sTeOiUNFTqQ0l4XioMiElhHx7wHZZgpCz7+xMyvmgTXIC5pyo7j?=
 =?iso-8859-1?Q?ExKrmDf+vVJl/rp7J3jkgTobQRRaoMGI4d3AiXa1nV1Hi7LsG3Z+lfKOK0?=
 =?iso-8859-1?Q?yfQ0VOPi5hfMhARz5xc0E7WgBkCUfa9MGe7wLx2VWjP2QoSOkLXSJmtdLM?=
 =?iso-8859-1?Q?GKytRP8eaJjluMrxQmweZmrgt0wI5776Ex4mafeKLiV8whJihyU7+VLb/l?=
 =?iso-8859-1?Q?FY2LQ8b0fQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63731587-e5df-48c0-3dcb-08da1bd9824f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2022 16:37:03.2868
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5os2C46c7pTE5FkvDN2kgmqwV2DnX5RmVFeYS+a4bFqTFEfg1BXgWWkZ+7r13FWgedrY9Pq/Vrd0BlkzTEp/b6p5vRVwohAQairD+YG97EQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2985
X-OriginatorOrg: citrix.com

> From: Anthony PERARD <anthony.perard@citrix.com>=0A=
> Sent: Tuesday, March 22, 2022 11:22 AM=0A=
> To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
> Cc: Anthony Perard <anthony.perard@citrix.com>; Jan Beulich <jbeulich@sus=
e.com>; Daniel P . Smith <dpsmith@apertussolutions.com>; Julien Grall <jgra=
ll@amazon.com>; Andrew Cooper <Andrew.Cooper3@citrix.com>; George Dunlap <G=
eorge.Dunlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano Stabellini=
 <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Roger Pau Monne <roger.pau=
@citrix.com>; Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>; Ross Lagerwal=
l <ross.lagerwall@citrix.com>; Daniel De Graaf <dgdegra@tycho.nsa.gov>=0A=
> Subject: [XEN PATCH v10 7/7] build: adding out-of-tree support to the xen=
 build =0A=
>  =0A=
> This implement out-of-tree support, there's two ways to create an=0A=
> out-of-tree build tree (after that, `make` in that new directory=0A=
> works):=0A=
>     make O=3Dbuild=0A=
>     mkdir build; cd build; make -f ../Makefile=0A=
> also works with an absolute path for both.=0A=
> =0A=
> This implementation only works if the source tree is clean, as we use=0A=
> VPATH.=0A=
> =0A=
> This patch copies most new code with handling out-of-tree build from=0A=
> Linux v5.12.=0A=
> =0A=
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>=0A=
> Acked-by: Jan Beulich <jbeulich@suse.com>=0A=
> Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>=0A=
> Acked-by: Julien Grall <jgrall@amazon.com>=0A=
> Tested-by: Julien Grall <jgrall@amazon.com>=0A=
> =0A=
=0A=
Acked-by: Ross Lagerwall <ross.lagerwall@citrix.com> (livepatch parts)=

