Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6A1473F93
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 10:34:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246488.425132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx4Cr-00006Q-KH; Tue, 14 Dec 2021 09:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246488.425132; Tue, 14 Dec 2021 09:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx4Cr-0008VC-GI; Tue, 14 Dec 2021 09:34:45 +0000
Received: by outflank-mailman (input) for mailman id 246488;
 Tue, 14 Dec 2021 09:34:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qXUZ=Q7=epam.com=prvs=298265c1fe=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1mx4Cp-0007DW-9a
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 09:34:43 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 100e8040-5cc1-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 10:34:41 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BE8mM0e003673;
 Tue, 14 Dec 2021 09:34:31 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cxr33874b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Dec 2021 09:34:31 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by PR2PR03MB5162.eurprd03.prod.outlook.com (2603:10a6:101:26::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Tue, 14 Dec
 2021 09:34:25 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::85d2:c8aa:2196:21c6%9]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 09:34:25 +0000
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
X-Inumbo-ID: 100e8040-5cc1-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwMCwwQXqjdWHPoSIBNlXW/2kkQyifJHYa+QPpeSwcRB7t1lx1HlqFsJvsgv9vEakc7Pn2D1k6AMcs7G4T7tQBREewIztTHdaTCXm1yJIQa3xD5qs84q8Dy8hq1e7S27+LevN4pJeX0K7UeJz3bqSiq4fOiRn1UMqKO9RoaCd+gmTSLbf5kUCr2mLU7qzWGAaFOepjw3141inXlNv+BwSREZ7G3PdKv2b6cwMdqdf9dwa/VGMENLgUlcz0nANTlvrb8bRp6OyzL/gQo2cX69Bgt5g+GDnnn/oTaY4w7qBNCJ8C7/1bqcgiNY+MM756/Wf99Zami+PpXE1RGzJitFKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HKrYB6SvkH+0z8vtwa49lxvxU4I58QQAwDDiPC1Yg8=;
 b=exkoGv/nni6YNhrwNCGwJa/o3/hHlAJYN99pZwxec5yZFjuKnQUqi8g4ZL95U//u2DlPJLzL/ePdBw702dvNDGB72jUrE4ne6x3vNgZEyxaaedYPvNTRCHxP8PP1v+y3XNUWbCzBMNaHStRjvWwSlt7QkjlCcSgurnMlFts/D1kzAsTlRPrRIJYtD31Zs7xIaag7ppbZYXfhHGdkitzVfN/5AYM6wEc15ZOEtXJl+dYjD/YXfHS8sQO55BMFSBx3q6VirlO4D2QqB3L2KubVFRiOtKKfXfksd246xhSngqncjEcryKLCNyVuXcE0XecbeVxSZfRpn8W4qLIDhJv+hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HKrYB6SvkH+0z8vtwa49lxvxU4I58QQAwDDiPC1Yg8=;
 b=Ty4slgKMwrGKaBsjf+B2udHjXAv2RU8B5k6EkwDLHamKtqSEODDL5b3bUoRWtVngybn/pmeNvTWxqnUOyZKJffFkbrMPEjAa2GHZ6NfdQBiCF9Nk6CN27lE2vyPOyyrneR4e2x0T51wpOxObEu3j/xP4eyUPTsIGBqCTzyFvCFchGnkIKoobPOOT0GqaxoZ0OzBHDBLcQYnhh4x+7KYtudMvMxtTe1ZuWRlgXbV9EWJixgPCAncOuI+GBPX0F5l2f5iIN19HBm0gG3KeKLD6vGqzMm5QcguNXL2hr4KEomNF74by+Gd6HLrdFIgiC7Nd0hLK1BrEF682VnRApcdFOA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [RFC v1 2/5] xen/arm: add generic SCI mediator framework
Thread-Topic: [RFC v1 2/5] xen/arm: add generic SCI mediator framework
Thread-Index: AQHX8M3IB9WR9OXgbE2xll7qsLGWCw==
Date: Tue, 14 Dec 2021 09:34:24 +0000
Message-ID: 
 <c0afe4837fe99e7f7921fc43b130aa2234f234be.1639472078.git.oleksii_moisieiev@epam.com>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1639472078.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8ab3c2b-0600-422c-935b-08d9bee4ead6
x-ms-traffictypediagnostic: PR2PR03MB5162:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PR2PR03MB51629015715B55D1DF6A15D7E3759@PR2PR03MB5162.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Lr+EizdDW3+1EkhjMTkYs51YyfAHaFeV8ARQ6c+fXlL+W5JJQhTblV2bw7AnzpfyUfx41UUIxf6GErurKQLo9Jzu/NPGbJgf6r2sbmkytup6yZgeAkJ0O7Q3Gc8XsrWMDsXmP+PBTjaR9FPeS+RHbCRv6B5BJUPgxVoVPYwyI4mQ5wYK1MIGQ72tdvuWbLU1WbdAMEOXKyNJ5zgHanrralo3rxTSlxEMREUdSibc47aQzYdXc9kqcfAmBYEsAY8gmsnXjvbz3f4nDltil/oWnaDu6njSn5Zsr6PwnuyoeUEuteAPDE8nn7kskUz4I+UOv39croeIbcyJdG1UUEHA4+Nl0A/lcXIxpWbnufaaPkpxSLhQ8Sf7q2YCqXLF6aVcUtMRZnU/zWXZeT9HsVcXdm4sKIkE0sPfYZl8fkInpD4+7wddZxu9n62vky5PTlSrkktflv/2KI9dv6fXWu5CQxBsriGqi66e2e6dldRVLFPXr0PclJLkJLVR1M/4xAV1NuwgReDmqa3O30nsyJ1lGy3qNJpYdEOVaDbwIWzOxQAbw9GF13mZWTGcVwX/OF52pyNjD8VMspnJU00gxR6MM5db3TuGUjHIo/7Jzr/fB/09btyxbBAugnSYKifrhxu5Xyf305BcYpd3y+UXmEin7SrcUnSUd6U5Q6Gece7+oIlqLEdk6hbYxZcphNQbZXWxjYzUwfuAU5vMNfqVO72SOgrstYvOW8sy+R8V8rv0CGZiCgmvoXbQzFLB5s/I9pTpLJI6/gsaWOqQC2xZYrE3Yw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(30864003)(5660300002)(38070700005)(38100700002)(8676002)(4326008)(316002)(122000001)(2616005)(36756003)(54906003)(6512007)(186003)(26005)(66476007)(66556008)(83380400001)(64756008)(66446008)(2906002)(6486002)(71200400001)(76116006)(6506007)(86362001)(8936002)(91956017)(66946007)(6916009)(41533002)(21314003)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?PF+a1wDPNITxYzO+CVWLhv6cupeYFD4x4az5b/Fw7baZ2ZiWdNurw3J+Ed?=
 =?iso-8859-1?Q?lrAyyuJXWs6Y3VcNxhNaqa70WJ3sEUT60ejR8ifTplaf7Wjfz6AhnTQ/xk?=
 =?iso-8859-1?Q?cCdt1NsnS1SG7EFASg6sPI5rnxUv/F8P2KoD4+QaosXvxiuias0h47hXra?=
 =?iso-8859-1?Q?ek90V8P/g8xk9xb6nJyIU7JfB9sTd6FXMDv0sH0Xb/DfNzqV1ctI6VKl4U?=
 =?iso-8859-1?Q?+9yo94sfG2Z7CzjldJn8EdUxQbqv4tw+dfztT298LTsGsFoGjnqLvMk2T6?=
 =?iso-8859-1?Q?okTp0Jj/VsE1VayD/jQNr7MJ+NIJ1stPOIPUf4qedLwSX0JWJdxlbzwiTt?=
 =?iso-8859-1?Q?lxBlM0CFinxlqx91ZLoNlwNXg3l2GmYcOcjY/kdxTKeRdEy8f6vqSwQWjT?=
 =?iso-8859-1?Q?UYVVTyr8KDa6rWggn5PmL2r5mCRmPzIwfGLpPM7oPCmfLfe/0H2icE/rz2?=
 =?iso-8859-1?Q?UJUkuX9SIZ98jnVf90yZc6WO8CV9BSK0ZXhk+i4zLfl7HG8sUALPQLNgRq?=
 =?iso-8859-1?Q?StrvVwTTjxEjoZO3m8aj55jZ4/5wxz5rG+OqT6C0wDBDPQI0CEZLKCHwt6?=
 =?iso-8859-1?Q?Prl+Px8JYf3aAyBqp11HnYaCT+O7LrzxJOS6KQyo+kUL3sRHwRr910oN5F?=
 =?iso-8859-1?Q?dkj0ibmB0LYPPUVitQIE8/1g2x4pwY7RcijVa16qPCkQeiXEuf8vkZaCOo?=
 =?iso-8859-1?Q?H9+MrjEr2Vieo3FEuTRxmPBSOvOyRgZNTPKYNaxeAD4s+pekQLd3uqOMvv?=
 =?iso-8859-1?Q?L9+ztoAxveJRjp5fugJ8lMa1Wtz90ZHFVFCn/b06si7t7tQa4R36bienUS?=
 =?iso-8859-1?Q?3/gt9UK5AkVjKzg/hQHKP6fDnpHLVYzrW4/p/6cdWxukSOxNXLpdTMsh17?=
 =?iso-8859-1?Q?LIUh1Sa9LxYFf3rdIVuWKsaPaqYXCtlF9104StSkn4airCPuBo4vt2YdCI?=
 =?iso-8859-1?Q?vR/vuJn8uCx0xSMmSoMhld8bzqzXva9iaIxfpL30WmjhxEn9AmhgLTIXxR?=
 =?iso-8859-1?Q?bSK1X3s0ga8GUEIibzDwxfQiFvwxGkuSRHNtHnKD4NQjKmPWmFjYK8/IRz?=
 =?iso-8859-1?Q?joyifMIFtQ50GGHpxZkXBcrhJsv/DpgAdLN/pmYswnDH1QDsnsnTu0H8Qm?=
 =?iso-8859-1?Q?YM4mUm0r0z6xFzV/k1RLng6mEtQphDKM0mNyucYXVEjgkiur3Yr7IrPoxo?=
 =?iso-8859-1?Q?1W385XTfEFRCFHP5VrqfEuBNh+PZW8kTCCVPl3IjAkKP7WCubYIR4V6h7W?=
 =?iso-8859-1?Q?uI0DZC3WKTsDSqxw/Je6E/zeHLqlRIMypQe+35X6xykRKADwHvlS0YHV8/?=
 =?iso-8859-1?Q?ZU9X3UOmpN1+zrbYp/z0t9ev47KJWtScb6ZNmFQxLRYjJqmJ3pnwDNi2YR?=
 =?iso-8859-1?Q?oSncDe0rK2Qzw7GwW0jW+IXS1pIOSMjgvWTZEEcEft1V+q/mVizDo7XjTe?=
 =?iso-8859-1?Q?ELwTjkKM9Ws7RZem6j6lglK7btpg14EHPe5NqDrY5xKh0y+zVCRsI20MaZ?=
 =?iso-8859-1?Q?y2cfaAU5kU+VwHOAgwEA7NV1+KLIXp2wx7XkD0a46F7YN6+tE2OX4JMNgS?=
 =?iso-8859-1?Q?YvG7F5YvQlZh7Q5Wq9EfVkTwjYq1dTZG7DRNAKLsMQ2InWLRLjX3svkLmV?=
 =?iso-8859-1?Q?9qiyG6bQtBtOBZsHjppKiutPcunHtgmJXEQLChTuzlHGNan7/1/edF+tCO?=
 =?iso-8859-1?Q?wQu2g7bfa68DLc53hz97m2l7J0hJ1vCa+Hy/ZlTHa+wCRIpaZE2/v2bbBn?=
 =?iso-8859-1?Q?iG38K3872OWZzugmMthC7nJpY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ab3c2b-0600-422c-935b-08d9bee4ead6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 09:34:25.0294
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RfqdyPuxzpK6fVl6BWZCRh4B0qxyja2icLr2P17aFoi0M0sb2PDsGY4FW6M9rRx0f1R2uC9DFJUED9BG5sQ7NsCJzR2J7eSLsAKmmjESwPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR03MB5162
X-Proofpoint-ORIG-GUID: wlhcHQlPM2w9Xz2Hror1NT-CP53P_nvL
X-Proofpoint-GUID: wlhcHQlPM2w9Xz2Hror1NT-CP53P_nvL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-14_05,2021-12-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112140054

This patch adds the basic framework for SCI mediator.
SCI is System Control Interface, which is designed to redirect
requests for the Hardware (such as power-domain/clock/resets etc)
from the Domains to the firmware. Originally, cpg should be passed
to the domain so it can work with power-domains/clocks/resets etc.
Considering that cpg can't be split between the Domains, we get the
limitation that the devices, which are using power-domains/clocks/resets
etc, couldn't be split between the domains.
The solution is to move the power-domain/clock/resets etc to the
Firmware (such as SCP firmware or ATF) and provide interface for the Domain=
s.
XEN shoud have an entity, caled SCI-Mediator, which is responsible for mess=
ages
redirection between Domains and Firmware and for permission handling.

This is how it works: user can build XEN with multiple SCI mediators.
See the next patches, where SCMI-SMC mediator is introduced.
SCI mediator register itself with REGISTER_SCI_MEDIATOR() macro.

At run-time, during initialization, framework calls probe for the first
matching device in the device-tree. When no device-tree is present - the
first registered mediator should be probed.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---
 MAINTAINERS                    |   6 ++
 xen/arch/arm/Kconfig           |   8 ++
 xen/arch/arm/Makefile          |   1 +
 xen/arch/arm/domain.c          |  24 +++++
 xen/arch/arm/domain_build.c    |  11 +++
 xen/arch/arm/platforms/rcar3.c |   3 +-
 xen/arch/arm/sci/Makefile      |   1 +
 xen/arch/arm/sci/sci.c         | 128 ++++++++++++++++++++++++++
 xen/arch/arm/setup.c           |   1 +
 xen/arch/arm/xen.lds.S         |   7 ++
 xen/include/asm-arm/domain.h   |   4 +
 xen/include/asm-arm/sci/sci.h  | 162 +++++++++++++++++++++++++++++++++
 xen/include/public/arch-arm.h  |  10 ++
 13 files changed, 365 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/sci/Makefile
 create mode 100644 xen/arch/arm/sci/sci.c
 create mode 100644 xen/include/asm-arm/sci/sci.h

diff --git a/MAINTAINERS b/MAINTAINERS
index e43dc0edce..5f96ea35ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -512,6 +512,12 @@ S:	Supported
 F:	xen/arch/arm/tee/
 F:	xen/include/asm-arm/tee
=20
+SCI MEDIATORS
+M:	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+S:	Supported
+F:	xen/arch/arm/sci
+F:	xen/include/asm-arm/sci
+
 TOOLSTACK
 M:	Wei Liu <wl@xen.org>
 S:	Supported
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ecfa6822e4..186e1db389 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -106,6 +106,14 @@ config TEE
=20
 source "arch/arm/tee/Kconfig"
=20
+config SCI
+	bool "Enable SCI mediators support"
+	default n
+	help
+	  This option enables generic SCI (System Control Interface) mediators
+	  support. It allows guests to control system resourcess via one of
+	  SCI mediators implemented in XEN.
+
 endmenu
=20
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 07f634508e..6366ff55e5 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -8,6 +8,7 @@ obj-y +=3D platforms/
 endif
 obj-$(CONFIG_TEE) +=3D tee/
 obj-$(CONFIG_HAS_VPCI) +=3D vpci.o
+obj-$(CONFIG_SCI) +=3D sci/
=20
 obj-$(CONFIG_HAS_ALTERNATIVE) +=3D alternative.o
 obj-y +=3D bootfdt.init.o
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 96e1b23550..80d0a23767 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -34,6 +34,7 @@
 #include <asm/platform.h>
 #include <asm/procinfo.h>
 #include <asm/regs.h>
+#include <asm/sci/sci.h>
 #include <asm/tee/tee.h>
 #include <asm/vfp.h>
 #include <asm/vgic.h>
@@ -688,6 +689,13 @@ int arch_sanitise_domain_config(struct xen_domctl_crea=
tedomain *config)
         return -EINVAL;
     }
=20
+    if ( config->arch.sci_type !=3D XEN_DOMCTL_CONFIG_SCI_NONE &&
+         config->arch.sci_type !=3D sci_get_type() )
+    {
+        dprintk(XENLOG_INFO, "Unsupported SCI type\n");
+        return -EINVAL;
+    }
+
     return 0;
 }
=20
@@ -764,6 +772,15 @@ int arch_domain_create(struct domain *d,
         /* At this stage vgic_reserve_virq should never fail */
         if ( !vgic_reserve_virq(d, GUEST_EVTCHN_PPI) )
             BUG();
+
+        if ( config->arch.sci_type !=3D XEN_DOMCTL_CONFIG_SCI_NONE )
+        {
+            if ( (rc =3D sci_domain_init(d, config->arch.sci_type)) !=3D 0=
)
+                goto fail;
+
+            if ( (rc =3D sci_get_channel_info(d, &config->arch)) !=3D 0)
+                goto fail;
+        }
     }
=20
     /*
@@ -796,6 +813,7 @@ void arch_domain_destroy(struct domain *d)
     domain_vgic_free(d);
     domain_vuart_free(d);
     free_xenheap_page(d->shared_info);
+    sci_domain_destroy(d);
 #ifdef CONFIG_ACPI
     free_xenheap_pages(d->arch.efi_acpi_table,
                        get_order_from_bytes(d->arch.efi_acpi_len));
@@ -996,6 +1014,7 @@ enum {
     PROG_xen,
     PROG_page,
     PROG_mapping,
+    PROG_sci,
     PROG_done,
 };
=20
@@ -1056,6 +1075,11 @@ int domain_relinquish_resources(struct domain *d)
         if ( ret )
             return ret;
=20
+    PROGRESS(sci):
+        ret =3D sci_relinquish_resources(d);
+        if ( ret )
+            return ret;
+
     PROGRESS(done):
         break;
=20
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d02bacbcd1..38874615dd 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -22,6 +22,7 @@
 #include <asm/kernel.h>
 #include <asm/setup.h>
 #include <asm/tee/tee.h>
+#include <asm/sci/sci.h>
 #include <asm/platform.h>
 #include <asm/psci.h>
 #include <asm/setup.h>
@@ -1894,6 +1895,10 @@ static int __init handle_device(struct domain *d, st=
ruct dt_device_node *dev,
                 return res;
             }
         }
+
+        res =3D sci_add_dt_device(d, dev);
+        if ( res < 0 )
+            return res;
     }
=20
     res =3D handle_device_interrupts(d, dev, need_mapping);
@@ -3075,6 +3080,10 @@ static int __init construct_dom0(struct domain *d)
     if ( rc < 0 )
         return rc;
=20
+    rc =3D sci_domain_init(d, sci_get_type());
+    if ( rc < 0 )
+        return rc;
+
     if ( acpi_disabled )
         rc =3D prepare_dtb_hwdom(d, &kinfo);
     else
@@ -3109,6 +3118,8 @@ void __init create_dom0(void)
     dom0_cfg.arch.tee_type =3D tee_get_type();
     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
=20
+    dom0_cfg.arch.sci_type =3D sci_get_type();
+
     if ( iommu_enabled )
         dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
=20
diff --git a/xen/arch/arm/platforms/rcar3.c b/xen/arch/arm/platforms/rcar3.=
c
index d740145c71..a268b09454 100644
--- a/xen/arch/arm/platforms/rcar3.c
+++ b/xen/arch/arm/platforms/rcar3.c
@@ -18,10 +18,11 @@
  */
=20
 #include <asm/platform.h>
+#include <asm/sci/sci.h>
=20
 static bool rcar3_smc(struct cpu_user_regs *regs)
 {
-    return false;
+    return sci_handle_call(current->domain, regs);
 }
=20
 static const char *const rcar3_dt_compat[] __initconst =3D
diff --git a/xen/arch/arm/sci/Makefile b/xen/arch/arm/sci/Makefile
new file mode 100644
index 0000000000..837dc7492b
--- /dev/null
+++ b/xen/arch/arm/sci/Makefile
@@ -0,0 +1 @@
+obj-y +=3D sci.o
diff --git a/xen/arch/arm/sci/sci.c b/xen/arch/arm/sci/sci.c
new file mode 100644
index 0000000000..5961b4cd5d
--- /dev/null
+++ b/xen/arch/arm/sci/sci.c
@@ -0,0 +1,128 @@
+/*
+ * xen/arch/arm/sci/sci.c
+ *
+ * Generic part of SCI mediator driver
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (C) 2021, EPAM Systems.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+
+#include <asm/sci/sci.h>
+
+extern const struct sci_mediator_desc _sscimediator[], _escimediator[];
+static const struct sci_mediator_desc __read_mostly *cur_mediator;
+
+bool sci_handle_call(struct domain *d, void *args)
+{
+    if ( unlikely(!cur_mediator) )
+        return false;
+
+    return cur_mediator->ops->handle_call(d, args);
+}
+
+int sci_domain_init(struct domain *d, uint16_t sci_type)
+{
+    if ( sci_type =3D=3D XEN_DOMCTL_CONFIG_SCI_NONE )
+        return 0;
+
+    if ( unlikely(!cur_mediator) )
+        return -ENODEV;
+
+    if ( cur_mediator->sci_type !=3D sci_type )
+        return -EINVAL;
+
+    return cur_mediator->ops->domain_init(d);
+}
+
+void sci_domain_destroy(struct domain *d)
+{
+    if ( unlikely(!cur_mediator) )
+        return;
+
+    cur_mediator->ops->domain_destroy(d);
+}
+
+int sci_relinquish_resources(struct domain *d)
+{
+    if ( unlikely(!cur_mediator) )
+        return 0;
+
+    return cur_mediator->ops->relinquish_resources(d);
+}
+
+
+int sci_add_dt_device(struct domain *d, struct dt_device_node *dev)
+{
+    if ( unlikely(!cur_mediator) )
+        return 0;
+
+    return cur_mediator->ops->add_dt_device(d, dev);
+}
+
+int sci_get_channel_info(struct domain *d,
+                         struct xen_arch_domainconfig *config)
+{
+    if ( unlikely(!cur_mediator) )
+        return 0;
+
+    return cur_mediator->ops->get_channel_info(d->arch.sci, config);
+}
+
+uint16_t sci_get_type(void)
+{
+    if ( unlikely(!cur_mediator) )
+        return XEN_DOMCTL_CONFIG_SCI_NONE;
+
+    return cur_mediator->sci_type;
+}
+
+static int __init sci_init(void)
+{
+    const struct sci_mediator_desc *desc;
+    struct dt_device_node *dt =3D NULL;
+
+    for ( desc =3D _sscimediator; desc !=3D _escimediator; desc++ )
+    {
+        if ( likely(dt_host) )
+        {
+            dt =3D dt_find_matching_node(dt_host, desc->dt_match);
+            if ( !dt )
+                continue;
+        }
+
+        if ( desc->ops->probe(dt) )
+        {
+            printk(XENLOG_INFO "Using SCI mediator for %s\n", desc->name);
+            cur_mediator =3D desc;
+            return 0;
+        }
+    }
+
+    return 0;
+}
+
+__initcall(sci_init);
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index d5d0792ed4..201de01411 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -50,6 +50,7 @@
 #include <asm/cpufeature.h>
 #include <asm/platform.h>
 #include <asm/procinfo.h>
+#include <asm/sci/sci.h>
 #include <asm/setup.h>
 #include <xsm/xsm.h>
 #include <asm/acpi.h>
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 08016948ab..3683f4821f 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -142,6 +142,13 @@ SECTIONS
       _eteemediator =3D .;
   } :text
=20
+  . =3D ALIGN(8);
+  .scimediator.info : {
+      _sscimediator =3D .;
+      *(.scimediator.info)
+      _escimediator =3D .;
+  } :text
+
   . =3D ALIGN(PAGE_SIZE);             /* Init code and data */
   __init_begin =3D .;
   .init.text : {
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 9b3647587a..d9b164017f 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -89,6 +89,10 @@ struct arch_domain
 #ifdef CONFIG_TEE
     void *tee;
 #endif
+
+#ifdef CONFIG_SCI
+    void *sci;
+#endif
 }  __cacheline_aligned;
=20
 struct arch_vcpu
diff --git a/xen/include/asm-arm/sci/sci.h b/xen/include/asm-arm/sci/sci.h
new file mode 100644
index 0000000000..aeff689c72
--- /dev/null
+++ b/xen/include/asm-arm/sci/sci.h
@@ -0,0 +1,162 @@
+/*
+ * xen/include/asm-arm/sci/sci.h
+ *
+ * Generic part of the SCI (System Control Interface) subsystem.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (C) 2021, EPAM Systems.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef __ASM_ARM_SCI_H
+#define __ASM_ARM_SCI_H
+
+#include <xen/lib.h>
+#include <xen/types.h>
+#include <xen/device_tree.h>
+
+#ifdef CONFIG_SCI
+
+struct sci_mediator_ops {
+
+    /*
+     * Probe for SCI. Should return true if SCI found and
+     * mediator is initialized.
+     */
+    bool (*probe)(struct dt_device_node *scmi_node);
+
+    /*
+     * Called during domain construction if toolstack requests to enable
+     * SCI support so mediator can inform SCP-firmware about new
+     * guest and create own structures for the new domain.
+     */
+    int (*domain_init)(struct domain *d);
+
+    /*
+     * Called during domain destruction, releases all resources, that
+     * were allocated by the mediator.
+     */
+    void (*domain_destroy)(struct domain *d);
+
+    /*
+     * Called during parsing partial device-sci for the domain.
+     * Passing device_node so mediator could process the device and
+     * mark the device as related to the domain if needed.
+     */
+    int (*add_dt_device)(struct domain *d, struct dt_device_node *dev);
+
+    /*
+     * Called during domain destruction to relinquish resources used
+     * by mediator itself. This function can return -ERESTART to indicate
+     * that it does not finished work and should be called again.
+     */
+    int (*relinquish_resources)(struct domain *d);
+
+    /* Handle call for current domain */
+    bool (*handle_call)(struct domain *d, void *regs);
+
+    /* Gets channel configuration and store it in domainconfig */
+    int (*get_channel_info)(void *sci_ops,
+                            struct xen_arch_domainconfig *config);
+
+};
+
+struct sci_mediator_desc {
+    /* Printable name of the SCI. */
+    const char *name;
+
+    /* Mediator callbacks as described above. */
+    const struct sci_mediator_ops *ops;
+
+    /*
+     * ID of SCI. Corresponds to xen_arch_domainconfig.sci_type.
+     * Should be one of XEN_DOMCTL_CONFIG_SCI_xxx
+     */
+    uint16_t sci_type;
+
+    /* Match structure to init mediator */
+    const struct dt_device_match *dt_match;
+
+};
+
+int sci_domain_init(struct domain *d, uint16_t sci_type);
+void sci_domain_destroy(struct domain *d);
+int sci_add_dt_device(struct domain *d, struct dt_device_node *dev);
+int sci_relinquish_resources(struct domain *d);
+bool sci_handle_call(struct domain *d, void *args);
+int sci_get_channel_info(struct domain *d,
+                         struct xen_arch_domainconfig *config);
+uint16_t sci_get_type(void);
+
+#define REGISTER_SCI_MEDIATOR(_name, _namestr, _type, _match, _ops) \
+static const struct sci_mediator_desc __sci_desc_##_name __used     \
+__section(".scimediator.info") =3D {                                  \
+    .name =3D _namestr,                                               \
+    .ops =3D _ops,                                                    \
+    .sci_type =3D _type,                                              \
+    .dt_match =3D _match                                              \
+}
+
+#else
+#include <public/errno.h>
+
+static inline int sci_domain_init(struct domain *d, uint16_t sci_type)
+{
+    if ( likely(sci_type =3D=3D XEN_DOMCTL_CONFIG_SCI_NONE) )
+        return 0;
+
+    return -XEN_ENODEV;
+}
+
+static inline void sci_domain_destroy(struct domain *d)
+{
+}
+
+static inline int sci_add_dt_device(struct domain *d,
+                                    struct dt_device_node *dev)
+{
+    return 0;
+}
+
+static inline int sci_relinquish_resources(struct domain *d)
+{
+    return 0;
+}
+
+static inline bool sci_handle_call(struct domain *d, void *args)
+{
+    return false;
+}
+
+static inline int sci_get_channel_info(struct domain *d,
+                                       struct xen_arch_domainconfig *confi=
g)
+{
+    return 0;
+}
+
+static inline uint16_t sci_get_type(void)
+{
+    return XEN_DOMCTL_CONFIG_SCI_NONE;
+}
+
+#endif  /* CONFIG_SCI */
+
+#endif /* __ASM_ARM_SCI_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 94b31511dd..9180be5e86 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -314,12 +314,16 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_TEE_NONE      0
 #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
=20
+#define XEN_DOMCTL_CONFIG_SCI_NONE      0
+
 struct xen_arch_domainconfig {
     /* IN/OUT */
     uint8_t gic_version;
     /* IN */
     uint16_t tee_type;
     /* IN */
+    uint8_t sci_type;
+    /* IN */
     uint32_t nr_spis;
     /*
      * OUT
@@ -335,6 +339,12 @@ struct xen_arch_domainconfig {
      *
      */
     uint32_t clock_frequency;
+
+    /* Sets shared address to sw domains.
+     * This information is needed to set correct channel in Domain partial
+     * device-tree
+     */
+    uint64_t sci_agent_paddr;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
=20
--=20
2.27.0

