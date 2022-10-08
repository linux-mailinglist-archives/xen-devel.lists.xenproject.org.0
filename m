Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BEC5F8801
	for <lists+xen-devel@lfdr.de>; Sun,  9 Oct 2022 00:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418822.663553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohHs0-0001AG-A7; Sat, 08 Oct 2022 22:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418822.663553; Sat, 08 Oct 2022 22:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohHs0-00017R-6j; Sat, 08 Oct 2022 22:00:32 +0000
Received: by outflank-mailman (input) for mailman id 418822;
 Sat, 08 Oct 2022 22:00:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IpNc=2J=epam.com=prvs=2280ebcbdc=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1ohHry-00017L-BX
 for xen-devel@lists.xenproject.org; Sat, 08 Oct 2022 22:00:30 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c33e14f-4754-11ed-964a-05401a9f4f97;
 Sun, 09 Oct 2022 00:00:28 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 298JNVmC025211;
 Sat, 8 Oct 2022 22:00:10 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3k31gf1fs2-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 08 Oct 2022 22:00:09 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS4PR03MB8602.eurprd03.prod.outlook.com (2603:10a6:20b:585::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Sat, 8 Oct
 2022 22:00:04 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::d287:2a0b:40db:8c6]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::d287:2a0b:40db:8c6%3]) with mapi id 15.20.5676.038; Sat, 8 Oct 2022
 22:00:03 +0000
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
X-Inumbo-ID: 9c33e14f-4754-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtQMz5ENceg8SeMlXgJbW6k33B3yyq6dCRfNjca4/QJfeQAxxQ1oq1wxbR6m8nXE3PVVNCvccixZ7LzxhiqWqOhmoj1HMK2j9760zZc9iYFT2hWsdU7JkPXwLXBuQ56aMuJgZOlEA+h5tt8C7jPlWLdld+B6eQB1enkIGEDNHj0xTt3ZwKGKFMTUXw6Ty5HxbwTFo+LfY8ApOwCoODZhcq+itgR0HOWLbGQ7D1CIpN9z1A6CMuCm7EJdiZ2xXHVyYLkDlXmDSoP9v9IsS3zFGORTFhEssX3CVrkBwBSzmI+HIUfeECOVLSMOSuRkgzZDgYNXzerVrgFLVPdHd/j7sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSYKyVF/vWxyqV3U+G5s1EFVb7pGe7lKPFsx4VlLqaA=;
 b=fcuuE59ekPznNFU67WMC1uIrOp5I5VBuBrkwyVmlFLb/F2SIHGorMghJ/Yso5KYtj864VVxgXmmSn4PnWkM0QGVtrMgfYNT7MhG9bqNUprwKgJ/fhZ3C8Gw0iwyK0K5NwzXE86QCp9u/hv6KgJTpWiN+t0bRhJW63M3AUUa3BPN++Qe6hrjcNlrKp1IsRCWpJS4kOsNcmgcQ+2OvDjnJqn0ENE0MhK0GJZbpQosPf9lYMgZM/1t4beoc27633Nol3dmiWp4ixHKvk9sumNxWhiT8l8t260F3iq5ZciJH9HRliVPPjR4yaCVHoEttJ9OA32OTKj5L25hx3MuLPQdfGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSYKyVF/vWxyqV3U+G5s1EFVb7pGe7lKPFsx4VlLqaA=;
 b=KNeSXxWMC1CupNGtt++QB/xWPkkEl58xCBWXD4P7bEdNu+0SPLqBwE6OYIaHsPI91kN0SqxxYZlp1rco/Tt886t03NrrUpnUICyYAuBUi+koV07REwfpww50NPprCR1Sit5m6DvEQyHUHWAH5GNJjPSvl8l3XkuTK2j68tgjaHRgrq4tyY6fen1qT+A0I6awk6Rno1TkVyP6FDtz9vg7lrir8L4ouvxsCXumHt+RhuCTuH8DTMvIjPKOkCYDjahz/V/jRbL9AdOkgdhy7yZ5IqllrkoSCrtX61PrF+573E20hMn7a41fWfNHqtFYVQPBjzJe7v9gozCNpCzLRnaqVg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Mirela
 Simonovic <mirela.simonovic@aggios.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George
 Dunlap <george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Jan
 Beulich <jbeulich@suse.com>,
        Wei Liu <wl@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>,
        Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
        Mykyta
 Poturai <mykyta.poturai@epam.com>
Subject: Re: [PATCH 01/19] xen/arm: Implement PSCI system suspend
Thread-Topic: [PATCH 01/19] xen/arm: Implement PSCI system suspend
Thread-Index: AQHY2jgjWfMPRPlYK0auWtHF0HPLyK4E74yA
Date: Sat, 8 Oct 2022 22:00:02 +0000
Message-ID: <87czb2f02o.fsf@hp.mail-host-address-is-not-set>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
 <598de284f5f133a622eca3e120a1aabae0f2a1e2.1665137247.git.mykyta_poturai@epam.com>
In-Reply-To: 
 <598de284f5f133a622eca3e120a1aabae0f2a1e2.1665137247.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 28.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS4PR03MB8602:EE_
x-ms-office365-filtering-correlation-id: 2f8e1592-5f6b-4569-0556-08daa978744c
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yf5baOOLtmQlPH4erOkILZAdM13MYopS9D4GNYZ1goDFkvxpLbvEJ5h1ovSxFsx6IDMbyb94/AKpGTw9LsVoiyF1+hhA9tSK24Y74kUCL9f+C6VG6qCEYQpW8O+wkzS6wWqA/A+K69ZTgkizj6/s6Qe8+0tOZjItjoL6sYB2zJLwrIXgWyv56EVZ2MouCpycFRS3OGUv0uW7DUXLJIusbEOxSXyJMgZmHQFnhKrpIzt+LeE5p8K3cvVid0IbKCruNni7hAqAgYihb4zREyxiVXDIHMTPgt2Wzv3YT5ommrZp1mRFZiWivm0KAIs7FsPWil089Hw9djeyeAYu3Mx2WdW8ZjvTiiHQU9ZisoeDa+30I4cI07QiJNAhHi1MgSbQfZ8XSZxnPqX9IHT0PCzTZS1QHgUWkU6PE+VTj66ujbOvSEHEoXoe+dlLfocD/lPa9Z7zi4KdxLfZDADvxShL/Crll1MQ8UmUrZaf49r3mXTxLXGWG+I89BO27+Olw89AO4c3CpCliXcLvGeZoIIcCbN+iSraXDXvahM53o+S6468bHO1RyqkPQ4fBziipnt/8KXlcidyDTGRWuGcBoajhkbv67I2YTrZK3iahoH3iMpES3XWNfbffzNUjZ0/5fcIezYo+qIIDxodZ/bl5bzkzPOGUOryxNJdG8GrsrZaU3ZXgSIIwYt2A4FJ1TDdC7aaehnt/hjk4Jr8rEc3ra1sC6p9gZiYF4hEOFtWaVyYGKene+WQ/26S0cF9js16yCWEhPYWPYrv/2XsRO8UHs0Ghh2JnetJk2XWnb41GejEsD4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(451199015)(4326008)(41300700001)(186003)(91956017)(38070700005)(66946007)(76116006)(66556008)(66476007)(66446008)(64756008)(8676002)(86362001)(83380400001)(6862004)(15650500001)(8936002)(7416002)(30864003)(5660300002)(6506007)(107886003)(6486002)(38100700002)(478600001)(122000001)(71200400001)(316002)(54906003)(6636002)(55236004)(26005)(6512007)(9686003)(2906002)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?5nyI9y6IvhnxzAipY3tsExwBRRELXxq/eC5e52qF+3e0nLhkqt/Omrbh+o?=
 =?iso-8859-1?Q?RcKNT2C2SrRpy4NlfCX9nYeANGH9rdw8OJz2H8Qc18cYdgWBShpuqt+yTr?=
 =?iso-8859-1?Q?S7sNzXnKOvgGnc4/YAbqGr1qwmwxNP+RQ2fC7cwHSfKo6HVb30Xg0dGrRC?=
 =?iso-8859-1?Q?NGn7+/+nUq8Ez+arK/892nwLhd6wyhmG4q6cEhwTcfO+LWkW8rDoIE29SC?=
 =?iso-8859-1?Q?B1NJHROS3YMUpLy4BBEuA0oeiKdia7KPbZqERJ5VMK0knbOvVDNGW2GKTV?=
 =?iso-8859-1?Q?eBvivMooTPCO4eoTETVZAGDcAESNZlZ5Vn4Cjt6TE8GVqxknxO0vCJ95kb?=
 =?iso-8859-1?Q?v3X7UpHoO9XfZYkM/jy5jUhAxYUr4mVqJSPXRtVDb7HwerztfzFRQvDgBT?=
 =?iso-8859-1?Q?spdxVODoTtD9GlA7BPl5itr9LAYdk5xdYJDxhOBLN8edYeT+11JrquSjtx?=
 =?iso-8859-1?Q?Rrf8c6tBiWY9jNIu8YpICuXGZjIXikJU8LWlQEJUYXwWoAIATUzJItXCtk?=
 =?iso-8859-1?Q?rsdMbcP1CbEIGIzVmYNws1KQn0G9j0El6Cy5mOChEfRDcErJgjAS5/uiPq?=
 =?iso-8859-1?Q?M/L8NK9/MEMDZFt+APG0Jxu4qpZlINuIA41VlBeVU1KvVYv2F8LIOyexa3?=
 =?iso-8859-1?Q?y3LPCn2o5Ax9+xU4YrHO92VJ6Vr4Yo0+ICiV5chro7pIj+wVa5c8O/Gou/?=
 =?iso-8859-1?Q?HQQBBBn97ytz8aaRA8CELa9tBfIC2TPflsQFLzIHgGMlpEmwJWvhIhjooi?=
 =?iso-8859-1?Q?MF+c+Xx2oVkIOfBmhbU7vKXe6ueywDkAPlRrTEDdJSNCJN4uSEPB3rjGia?=
 =?iso-8859-1?Q?cz8T/PqDg5hJzdEAcMI/UB4ZveUL9+2K5yiuroFAiN1GksEHN7hilNcz5x?=
 =?iso-8859-1?Q?CfeIsIHx4nTCY87G9V/wtfttr9+TSDezNH/QWyGWQTANUPYL+6wY56MkIM?=
 =?iso-8859-1?Q?iz/CrmgHzS6/0PPKLCu+sO8hyuqb+j41g0K5gsqT7b0LF8JmuPcyRfBI9P?=
 =?iso-8859-1?Q?7JVnT0gC84DWWifZanqEqt6+Lk1gWd/MveSPY3VLK9OT8Usey5yQJ9G/I6?=
 =?iso-8859-1?Q?fFe2P1n4rfqbzENAOmigfIcUwmEOoOWmMjM6EhuronMcZFi1vUU4yBiEtc?=
 =?iso-8859-1?Q?SMu4LAzcNG8CPuLgqjJaR5/kxnfp6nxL4o7SZD7Cm/EUEklsyZHrbt9RS8?=
 =?iso-8859-1?Q?T8SghNM35daN43cV9t1VqjBCpfbm1FiR/1ECRJE63Oa1gFOUCma0NzwVwt?=
 =?iso-8859-1?Q?qs/9nKyq+q65DLzhF9hMww7XQ5xCt2PeRFoZA1awO3dpDEw/PQegfMu9Xk?=
 =?iso-8859-1?Q?1dR6laG9XMwammXaawww+FtOwxUB3UiFAn/IcSKgECrsDhzQb3qfCxNQQh?=
 =?iso-8859-1?Q?ZaDYoRBRMfwOA3DewOW2H9CAj1LaqUDgik40pUiWd/rzkAog//sWQk52Lm?=
 =?iso-8859-1?Q?Ea8E5X8i69fAU2jyyrWTC/URYp7RCciOaat8MRYzaFXc52yHmPyKjfkDJo?=
 =?iso-8859-1?Q?bu1p6g2eyslH7yMLcGV9Yc10GxbsjSXbmE8NYKu66FBn9MBrhbwkW/dOIM?=
 =?iso-8859-1?Q?1YIQN9gccaUTUFJ31C/5NgF51Yop/35ziSb93M3cBZ7/XMniC2WAz6gShR?=
 =?iso-8859-1?Q?TJErcSMG0B7i4Zj9qYUVfsPlbA9ZTm8anSbXhsC/a1TFCfLoIxNnlAvA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8e1592-5f6b-4569-0556-08daa978744c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2022 22:00:03.8499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XGJa4pfNSp+1oRysuKicV64efnJw/wgY57NiA3JFxUTM6ldN9HxVWV1jNTqOmaxzJzxueIQxtNAPthOoexqZEWTnEI/qGsfdasHMHIBBRLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8602
X-Proofpoint-GUID: baf05AZYT_W3RrThA9UK-Sc07hzGF5ss
X-Proofpoint-ORIG-GUID: baf05AZYT_W3RrThA9UK-Sc07hzGF5ss
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 clxscore=1011
 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210080142


Hi Mykyta,

Mykyta Poturai <Mykyta_Poturai@epam.com> writes:

> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>
> The implementation consists of:
> -Adding PSCI system suspend call as new PSCI function
> -Trapping PSCI system_suspend HVC

AFAIK, this can be SMC as well.

> -Implementing PSCI system suspend call (virtual interface that allows
>  guests to suspend themselves)
>
> The PSCI system suspend should be called by a guest from its boot
> VCPU.

Why such limititation? PSCI standart does not limit choise of a CPU.


> Non-boot VCPUs of the guest should be hot-unplugged using PSCI
> CPU_OFF call prior to issuing PSCI system suspend. Interrupts that
> are left enabled by the guest are assumed to be its wake-up interrupts.
> Therefore, a wake-up interrupt triggers the resume of the guest. Guest
> should resume regardless of the state of Xen (suspended or not).
>
> When a guest calls PSCI system suspend the respective domain will be
> suspended if the following conditions are met:
> 1) Given resume entry point is not invalid
> 2) Other (if any) VCPUs of the calling guest are hot-unplugged
>
> If the conditions above are met the calling domain is labeled as
> suspended and the calling VCPU is blocked. If nothing else wouldn't
> be done the suspended domain would resume from the place where it
> called PSCI system suspend. This is expected if processing of the PSCI
> system suspend call fails. However, in the case of success the calling
> guest should resume (continue execution after the wake-up) from the entry
> point which is given as the first argument of the PSCI system suspend
> call. In addition to the entry point, the guest expects to start within
> the environment whose state matches the state after reset. This means
> that the guest should find reset register values, MMU disabled, etc.
> Thereby, the context of VCPU should be 'reset' (as if the system is
> comming out of reset), the program counter should contain entry point,
> which is 1st argument, and r0/x0 should contain context ID which is 2nd
> argument of PSCI system suspend call. The context of VCPU is set during
> resume path, to prevent it being overwritten by ctxt_switch_from after
> vcpu is blocked and scheduled out.
>
> VCPU is marked as suspended with _VPF_suspended flag. A suspended domain
> will resume after the Xen receives an interrupt which is targeted to the
> domain, unblocks the domain's VCPU, and schedules it in. During the
> vcpu_unblock execution the VCPU is checked for VPF_suspended flag. If
> the flag is present, the context of that VCPU gets cleared and entry
> point/cid are set.
>
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta.poturai@epam.com>
> ---
>  xen/arch/arm/Makefile            |   1 +
>  xen/arch/arm/domain.c            |   4 +
>  xen/arch/arm/suspend.c           | 182 +++++++++++++++++++++++++++++++
>  xen/arch/arm/vpsci.c             |  28 +++++
>  xen/common/sched/core.c          |   8 ++
>  xen/include/asm-arm/domain.h     |   3 +
>  xen/include/asm-arm/perfc_defn.h |   1 +
>  xen/include/asm-arm/psci.h       |   2 +
>  xen/include/asm-arm/suspend.h    |  17 +++
>  xen/include/xen/sched.h          |   3 +
>  10 files changed, 249 insertions(+)
>  create mode 100644 xen/arch/arm/suspend.c
>  create mode 100644 xen/include/asm-arm/suspend.h
>
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index b5913c9d39..07dbbd99a3 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -49,6 +49,7 @@ obj-y +=3D setup.o
>  obj-y +=3D shutdown.o
>  obj-y +=3D smp.o
>  obj-y +=3D smpboot.o
> +obj-y +=3D suspend.o
>  obj-y +=3D sysctl.o
>  obj-y +=3D time.o
>  obj-y +=3D traps.o
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 23c8b345d4..4110154bda 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -40,6 +40,8 @@
>  #include <asm/vtimer.h>
>  #include <asm/vscmi.h>
> =20
> +#include <public/sched.h>
> +

Do you really need this include?

>  #include "vpci.h"
>  #include "vuart.h"
> =20
> @@ -101,6 +103,8 @@ static void ctxt_switch_from(struct vcpu *p)
>      if ( is_idle_vcpu(p) )
>          return;
> =20
> +    /* VCPU's context should not be saved if its domain is suspended */
> +

Is this a some leftover?

>      p2m_save_state(p);
> =20
>      /* CP 15 */
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> new file mode 100644
> index 0000000000..987ba6ac11
> --- /dev/null
> +++ b/xen/arch/arm/suspend.c
> @@ -0,0 +1,182 @@
> +/*
> + * Copyright (C) 2022 EPAM Systems Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU Lesser General Public License as publis=
hed
> + * by the Free Software Foundation; version 2.1 only. with the special
> + * exception on linking described in file LICENSE.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU Lesser General Public License for more details.
> + */
> +
> +#include <xen/sched.h>
> +#include <asm/cpufeature.h>
> +#include <asm/event.h>
> +#include <asm/psci.h>
> +#include <asm/suspend.h>
> +#include <public/sched.h>
> +
> +struct cpu_context cpu_context;
> +
> +/* Reset values of VCPU architecture specific registers */
> +static void vcpu_arch_reset(struct vcpu *v)
> +{
> +    v->arch.ttbr0 =3D 0;
> +    v->arch.ttbr1 =3D 0;
> +    v->arch.ttbcr =3D 0;
> +
> +    v->arch.csselr =3D 0;
> +    v->arch.cpacr =3D 0;
> +    v->arch.contextidr =3D 0;
> +    v->arch.tpidr_el0 =3D 0;
> +    v->arch.tpidrro_el0 =3D 0;
> +    v->arch.tpidr_el1 =3D 0;
> +    v->arch.vbar =3D 0;
> +    v->arch.dacr =3D 0;
> +    v->arch.par =3D 0;
> +#if defined(CONFIG_ARM_32)
> +    v->arch.mair0 =3D 0;
> +    v->arch.mair1 =3D 0;
> +    v->arch.amair0 =3D 0;
> +    v->arch.amair1 =3D 0;
> +#else
> +    v->arch.mair =3D 0;
> +    v->arch.amair =3D 0;
> +#endif
> +    /* Fault Status */
> +#if defined(CONFIG_ARM_32)
> +    v->arch.dfar =3D 0;
> +    v->arch.ifar =3D 0;
> +    v->arch.dfsr =3D 0;
> +#elif defined(CONFIG_ARM_64)
> +    v->arch.far =3D 0;
> +    v->arch.esr =3D 0;
> +#endif
> +
> +    v->arch.ifsr  =3D 0;
> +    v->arch.afsr0 =3D 0;
> +    v->arch.afsr1 =3D 0;
> +
> +#ifdef CONFIG_ARM_32
> +    v->arch.joscr =3D 0;
> +    v->arch.jmcr =3D 0;
> +#endif
> +
> +    if ( is_32bit_domain(v->domain) && cpu_has_thumbee )
> +    {
> +        v->arch.teecr =3D 0;
> +        v->arch.teehbr =3D 0;
> +    }
> +}
> +
> +
> +static void vcpu_suspend(register_t epoint, register_t cid)
> +{
> +    struct vcpu *v =3D current;
> +
> +    v->arch.suspend_ep =3D epoint;
> +    v->arch.suspend_cid =3D cid;
> +    set_bit(_VPF_suspended, &v->pause_flags);
> +    return;
> +}
> +
> +/*
> + * This function sets the context of current VCPU to the state which is =
expected
> + * by the guest on resume. The expected VCPU state is:
> + * 1) pc to contain resume entry point (1st argument of PSCI SYSTEM_SUSP=
END)
> + * 2) r0/x0 to contain context ID (2nd argument of PSCI SYSTEM_SUSPEND)
> + * 3) All other general purpose and system registers should have reset v=
alues
> + */
> +void vcpu_resume(struct vcpu *v)
> +{
> +
> +    struct vcpu_guest_context ctxt;
> +
> +    /* Make sure that VCPU guest regs are zeroed */
> +    memset(&ctxt, 0, sizeof(ctxt));
> +
> +    /* Set non-zero values to the registers prior to copying */
> +    ctxt.user_regs.pc64 =3D (u64)v->arch.suspend_ep;
> +
> +    if ( is_32bit_domain(v->domain) )
> +    {
> +        ctxt.user_regs.r0_usr =3D v->arch.suspend_cid;
> +        ctxt.user_regs.cpsr =3D PSR_GUEST32_INIT;
> +
> +        /* Thumb set is allowed only for 32-bit domain */
> +        if ( v->arch.suspend_ep & 1 )
> +        {
> +            ctxt.user_regs.cpsr |=3D PSR_THUMB;
> +            ctxt.user_regs.pc64 &=3D ~(u64)1;
> +        }
> +    }
> +#ifdef CONFIG_ARM_64
> +    else
> +    {
> +        ctxt.user_regs.x0 =3D v->arch.suspend_cid;
> +        ctxt.user_regs.cpsr =3D PSR_GUEST64_INIT;
> +    }
> +#endif
> +    ctxt.sctlr =3D SCTLR_GUEST_INIT;
> +    ctxt.flags =3D VGCF_online;
> +
> +    /* Reset architecture specific registers */
> +    vcpu_arch_reset(v);
> +
> +    /* Initialize VCPU registers */
> +    arch_set_info_guest(v, &ctxt);
> +    clear_bit(_VPF_suspended, &v->pause_flags);
> +}
> +
> +int32_t domain_suspend(register_t epoint, register_t cid)
> +{
> +    struct vcpu *v;
> +    struct domain *d =3D current->domain;
> +    bool is_thumb =3D epoint & 1;
> +
> +    dprintk(XENLOG_DEBUG,
> +            "Dom%d suspend: epoint=3D0x%"PRIregister", cid=3D0x%"PRIregi=
ster"\n",
> +            d->domain_id, epoint, cid);
> +
> +    /* THUMB set is not allowed with 64-bit domain */
> +    if ( is_64bit_domain(d) && is_thumb )
> +        return PSCI_INVALID_ADDRESS;
> +
> +    /* Ensure that all CPUs other than the calling one are offline */
> +    for_each_vcpu ( d, v )
> +    {
> +        if ( v !=3D current && is_vcpu_online(v) )
> +            return PSCI_DENIED;
> +    }
> +
> +    //TODO: add support for suspending from any VCPU

How hard it would be to implement?

> +    if (current->vcpu_id !=3D 0)
> +        return PSCI_DENIED;
> +
> +    /*
> +     * Prepare the calling VCPU for suspend (reset its context, save ent=
ry point
> +     * into pc and context ID into r0/x0 as specified by PSCI SYSTEM_SUS=
PEND)
> +     */
> +    vcpu_suspend(epoint, cid);
> +
> +    /*
> +     * The calling domain is suspended by blocking its last running VCPU=
. If an
> +     * event is pending the domain will resume right away (VCPU will not=
 block,
> +     * but when scheduled in it will resume from the given entry point).
> +     */
> +    vcpu_block_unless_event_pending(current);
> +
> +    return PSCI_SUCCESS;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index c1e250be59..f4e6e92873 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -18,6 +18,7 @@
>  #include <asm/vgic.h>
>  #include <asm/vpsci.h>
>  #include <asm/event.h>
> +#include <asm/suspend.h>
> =20
>  #include <public/sched.h>
> =20
> @@ -208,6 +209,11 @@ static void do_psci_0_2_system_reset(void)
>      domain_shutdown(d,SHUTDOWN_reboot);
>  }
> =20
> +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t =
cid)
> +{
> +    return domain_suspend(epoint, cid);
> +}
> +
>  static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>  {
>      /* /!\ Ordered by function ID and not name */
> @@ -225,6 +231,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_fun=
c_id)
>      case PSCI_0_2_FN32_SYSTEM_OFF:
>      case PSCI_0_2_FN32_SYSTEM_RESET:
>      case PSCI_1_0_FN32_PSCI_FEATURES:
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>      case ARM_SMCCC_VERSION_FID:
>          return 0;
>      default:
> @@ -355,6 +363,26 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, u=
int32_t fid)
>          return true;
>      }
> =20
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> +    {
> +        register_t epoint =3D PSCI_ARG(regs,1);
> +        register_t cid =3D PSCI_ARG(regs,2);
> +        register_t ret;
> +
> +        perfc_incr(vpsci_system_suspend);
> +        /* Set the result to PSCI_SUCCESS if the call fails.
> +         * Otherwise preserve the context_id in x0. For now=20

Looks like there is a trailing space                          ^

> +         * we don't support the case where the system is suspended
> +         * to a shallower level and PSCI_SUCCESS is returned to the=20

And in this line also

> +         * caller.
> +         */
> +        ret =3D do_psci_1_0_system_suspend(epoint, cid);
> +        if ( ret !=3D PSCI_SUCCESS )
> +            PSCI_SET_RESULT(regs, ret);
> +        return true;
> +    }
> +
>      default:
>          return false;
>      }
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 8f4b1ca10d..4e1ea62c44 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -38,6 +38,10 @@
>  #include <xsm/xsm.h>
>  #include <xen/err.h>
> =20
> +#if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
> +#include <asm/suspend.h>
> +#endif
> +
>  #include "private.h"
> =20
>  #ifdef CONFIG_XEN_GUEST
> @@ -957,6 +961,10 @@ void vcpu_unblock(struct vcpu *v)
>  {
>      if ( !test_and_clear_bit(_VPF_blocked, &v->pause_flags) )
>          return;
> +#if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
> +    if ( test_bit(_VPF_suspended, &v->pause_flags) )
> +        vcpu_resume(v);
> +#endif

This does not look good. I do understant that that was I, who suggested
to add this flag, but I didn't expected that it will get into common code.

Also, this is not justified in the commit message. I remeber that there was
some discussion about why vcpu_block()/vcpu_unblock() could not be used, an=
d
I'd love to see its summary in the commit message.

> =20
>      /* Polling period ends when a VCPU is unblocked. */
>      if ( unlikely(v->poll_evtchn !=3D 0) )
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index 413e5a2a18..715841e0b5 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -203,6 +203,9 @@ struct arch_vcpu
>      struct vtimer virt_timer;
>      bool   vtimer_initialized;
> =20
> +    register_t suspend_ep;
> +    register_t suspend_cid;
> +
>      /*
>       * The full P2M may require some cleaning (e.g when emulation
>       * set/way). As the action can take a long time, it requires
> diff --git a/xen/include/asm-arm/perfc_defn.h b/xen/include/asm-arm/perfc=
_defn.h
> index 31f071222b..d71e91a5e4 100644
> --- a/xen/include/asm-arm/perfc_defn.h
> +++ b/xen/include/asm-arm/perfc_defn.h
> @@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: system_r=
eset")
>  PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
>  PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
>  PERFCOUNTER(vpsci_features,            "vpsci: features")
> +PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
> =20
>  PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
> =20
> diff --git a/xen/include/asm-arm/psci.h b/xen/include/asm-arm/psci.h
> index 832f77afff..26462d0c47 100644
> --- a/xen/include/asm-arm/psci.h
> +++ b/xen/include/asm-arm/psci.h
> @@ -43,10 +43,12 @@ void call_psci_system_reset(void);
>  #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
>  #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
>  #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
> +#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
> =20
>  #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
>  #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
>  #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
> +#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
> =20
>  /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
>  #define PSCI_0_2_AFFINITY_LEVEL_ON      0
> diff --git a/xen/include/asm-arm/suspend.h b/xen/include/asm-arm/suspend.=
h
> new file mode 100644
> index 0000000000..fbaa414f0c
> --- /dev/null
> +++ b/xen/include/asm-arm/suspend.h
> @@ -0,0 +1,17 @@
> +#ifndef __ASM_ARM_SUSPEND_H__
> +#define __ASM_ARM_SUSPEND_H__
> +
> +int32_t domain_suspend(register_t epoint, register_t cid);
> +void vcpu_resume(struct vcpu *v);
> +
> +#endif
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 3b4ed3a2ab..b2f6d1af28 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -903,6 +903,9 @@ static inline struct domain *next_domain_in_cpupool(
>  /* VCPU is parked. */
>  #define _VPF_parked          8
>  #define VPF_parked           (1UL<<_VPF_parked)
> +/* VCPU is suspended */
> +#define _VPF_suspended       9
> +#define VPF_suspended        (1UL<<_VPF_suspended)
> =20
>  static inline bool vcpu_runnable(const struct vcpu *v)
>  {


--=20
Volodymyr Babchuk at EPAM=

