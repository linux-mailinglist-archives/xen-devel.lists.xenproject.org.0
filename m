Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EAB5F76E6
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 12:33:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417684.662421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkfB-0005jk-2j; Fri, 07 Oct 2022 10:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417684.662421; Fri, 07 Oct 2022 10:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogkfA-0005UC-0p; Fri, 07 Oct 2022 10:33:04 +0000
Received: by outflank-mailman (input) for mailman id 417684;
 Fri, 07 Oct 2022 10:33:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uvLM=2I=epam.com=prvs=22797713c5=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1ogkf6-0004PE-Ak
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 10:33:00 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 675f2b37-462b-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 12:32:56 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2978P16x005817;
 Fri, 7 Oct 2022 10:32:50 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3k2a45sjk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 10:32:50 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com (2603:10a6:803:33::29)
 by AS8PR03MB7159.eurprd03.prod.outlook.com (2603:10a6:20b:2ea::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 7 Oct
 2022 10:32:45 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273]) by VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273%5]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 10:32:45 +0000
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
X-Inumbo-ID: 675f2b37-462b-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3dJFWSIy0IghCZdaSKzBddZ1Bv3uipDP7U0xgibMA569oDDlo9xl7NNMVNv8YbQKXfINOmgKm8cNyWsvWQVC6fGklvqMoy8XHL1vHsUxJCDWfK8ec+DarhqXSDely93EtXkvUyeMBIvZEMXgornHDDJ8fYW0YVv3nO0dGL7MsJ4tsPzH+lvV4q7YubUJQiucE1IbzN9Ysg1/QK1YnSiqhgFDkOR+PMXJ6Cn0YS56zFZss+MPAwTYdZ7733P2f7ywqH0QLoR0wDxeXM0pnJU2vlJkm6US7J7DheFSYNGeMhQqG9Bj18sx0f9YGAPj1EutiI/zduHt5C4h1S1jAJCYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uI/NqW/3wfj/Zw9sR+GCehbnO/hQ40IHuafpqfCflac=;
 b=PhXivvvF/HiF5bZivKIDdGMl6NAgnB6Ffc5rsw1v7QcrjpbNGwTqqC+pfYpjqTkD87o0c2guyruVKG/JdEeFgD74qEzb6k29dEEFropkTjEN+Cmfz8S8r8J8OQxwV7xV4lB2+i5GV5lEGinaMQ+MEi/x/kaKG/kzluoTzIPenqrIjT9+5PxbZOX6dVbqasZB1T3kzujlIMR9cv0He5e89HPqg0BQM9f4yGkbe7aS5VXiYTZjdbdAdMCQ1Y+R42bSOuEOVQZmPCejo34SIory2bU/QeKpde6wagtg0v0bHUybjess+FWy0N0JegRvMcvT/Qj4ozBFX1FS8NK4bgBRqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uI/NqW/3wfj/Zw9sR+GCehbnO/hQ40IHuafpqfCflac=;
 b=BkMcuhp55247Y3cJJuJbWsG78IXBL3f83guzYQhBNdS0i5Eb5h/uZJIB6NsIT0uts/P4Gvh1e1gcUUs92PjUC2VzYy/ALgTEpjz3/Cp1y+peVDWHZBUjM5AF9ZC/JarwIAV7EuwHpHnFnf26kLrcOX9KUo1h278oxjX4UKSDDuS45ysWvVx1wuL4/S62VMd46E5EAzJwXParqQ2CwYjxvh1Gi+tB2UyM5kT2Y8qB0xdW8EGfgW9biALql8rqLFEqTteTy9ASFCmPQ65+WY+KIu40jGZ75gJckHoQiL6eaFFMTiGOrMLlvWJs1sKGZXijjAAEy45cnrHFXyffpAc1KA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mirela Simonovic <mirela.simonovic@aggios.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>,
        Wei Liu <wl@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>,
        Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
        Mykyta
 Poturai <mykyta.poturai@epam.com>
Subject: [PATCH 01/19] xen/arm: Implement PSCI system suspend
Thread-Topic: [PATCH 01/19] xen/arm: Implement PSCI system suspend
Thread-Index: AQHY2jgjWfMPRPlYK0auWtHF0HPLyA==
Date: Fri, 7 Oct 2022 10:32:45 +0000
Message-ID: 
 <598de284f5f133a622eca3e120a1aabae0f2a1e2.1665137247.git.mykyta_poturai@epam.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1665137247.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|AS8PR03MB7159:EE_
x-ms-office365-filtering-correlation-id: 8342bc57-0c76-48c6-c400-08daa84f45c1
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zuV0Yq2m0C6j5aBgFbfqJx84jSpWpnjSw0GbA0lkc9DjknEGZuaw5clHUpAfrrgzoA0QrylZ9CVMJ88DRqWjPQvFMsNOZsftQPgwW+tw+H2i7uVuqNkwPMwA001ZWBkd39ek/gQmNbD+hV7C5jfqSi+rgtCcm7S4pOjJKlUrt0jisaRNYzJEa4/QXa2HvjdbfWT7F1TxO7+zAka+tHX0qvpGGCoeMUQqhlzSpmJap+VtUNGbtAzrGn50fETM1iNvAkMnLJjqsXdily1jh+Yn+M95YdAejgA2K3InbqEKBsFBrW4I3flWyAw2qQXoufIwEW5Ofwpecnjg2ziK46GCgb8dhtBkhfEoNvPq3ShOnCfkCy6Wy7CuQh2VhSHYI4X9+FE+IRi3bsB0J79a95q2Wegac8jWvBI0w+Uc8a9EHfqaccDZR3/oiQcNaT6CBvAZwqYe2MMYPX4dErP7LyCUij1XBBjFNntS7CioUR5fUecEXHMWLhk1t8Oe1Y3rohiBwadwAG+Ok9EPSbfGRuZG3lLKu1vUjvbPqn2KaTBisjrTDNZk3qVzebMSl2xm5a28B6N6PaHZzy7DO42G2v07tnl143KMF5wKZ4H+C30SpBJeoE+j11ANTebJ/icEwN1MG0IScaeopB4wRfTTd097t9/0WOm0nU4C0T99g5mOsLmetim7kbImAmta1ybIRXZlxlvq7IiO0lnWhQoP/dgPqN+HSpdmTuhKH/tfbCEhhhEjLiTqr/CHtNk7NexnJrfV2bwIs+VibyIJOr/hHXh4iY1Md12BdF5nTqSwNOM3RUI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199015)(2616005)(186003)(83380400001)(316002)(6916009)(2906002)(54906003)(30864003)(86362001)(15650500001)(5660300002)(7416002)(8936002)(66446008)(41300700001)(66946007)(64756008)(76116006)(66556008)(91956017)(66476007)(8676002)(4326008)(71200400001)(478600001)(6486002)(6512007)(55236004)(6506007)(26005)(38100700002)(107886003)(38070700005)(122000001)(36756003)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?BDw1NkGgW0hE79NMHZQ3x9h8EcYoePTgh0mSPNcov8lIjh11H/88kfDHn0?=
 =?iso-8859-1?Q?uVdo66fC1RN9G+ir+NYw8hUTUlwvmzKXw6uGvCKOBZDQVWwx0xwWOvgHED?=
 =?iso-8859-1?Q?Lrk25mTmmEnCv5UQqG2hy5o+f8YjTpeDoLPQClqY6tpIOameR+f8krsoc3?=
 =?iso-8859-1?Q?UZvV4YmOEvSNtVg3cjsiYwxXWwGhp9HWPD7Rhi11gEKDgYCYsV64E1S/Nx?=
 =?iso-8859-1?Q?SubrXSpuK2QosuN2anWGwzhA45hxHpZeRgMWRhp+6YfqfLII7AbgeRpUBi?=
 =?iso-8859-1?Q?qvilK22NssL7bcFQgzDurp+KFfnaI0h8FrbwQ3mTFFMFV4nN2K2KYUWLvh?=
 =?iso-8859-1?Q?4C2lLfj/lHG1Lb3GGxSykX5ZsyAuzEOdvPYviNEO6dbJB7+zBgJbQVOaio?=
 =?iso-8859-1?Q?qkBZ45qatAUdI450BlW0QmnyH8CTm9taHiVwGZIZfjUgEt2r+2K+VTEqms?=
 =?iso-8859-1?Q?AAabQXe2ewXvgNCqHONL5EKVZGUYsO5IriH1xsAd1bP90fecjiVtQkPVjT?=
 =?iso-8859-1?Q?7gsj/OW7PjaTDpAXJfZBF0Dwo/7k5BMaVWEFakYhfkf7KxSCNIHkIxFTRc?=
 =?iso-8859-1?Q?EsGlmgWfROK7mnjBWC2uHKhZF+DzWOIP+TM0i+2dgMDYZ9G5ZqCeptOjGT?=
 =?iso-8859-1?Q?qWHPL4f+CoMW5tM9Zdy8o1PRisp4Ryqvhrjgs4/yIxYsqarYMV3EgA1Xis?=
 =?iso-8859-1?Q?Hr80wmM1S9Uu1h/mY4j2prPpXLnui2h3TsTMeBBGUvTi0AHZZct8gTw1Hr?=
 =?iso-8859-1?Q?UjoyRHlnzQMLKrO1kg462aLO9T6bBs2yYJubm2Y5YqWuICsexTnVZj5LGb?=
 =?iso-8859-1?Q?Kd518yE7Rh3TzQUMNe3ufvdZAjROQzJ8VXpg7oj1Z6DS7uYZNlms5s6vHE?=
 =?iso-8859-1?Q?Is2dM1M1pS4/AMC2Puq7MBP/A6IOce+D2vZCdcW/Nn6FPqNXdahAVqI04N?=
 =?iso-8859-1?Q?dMiPoz51TpGjp++OzI9NZU17WbF7STYvMqZMpctafOp87ojoLqjZjxAqz4?=
 =?iso-8859-1?Q?xDazmGkRDJmEfdBNs6Y0f37H9WwlUmQnRz2Z9iiLQxRbCwJXPuPOUibhHz?=
 =?iso-8859-1?Q?e0JK7odaO56bb3GoROreLVOV9NlqCK2SYpldMmtr3RQ1LXtbO66VhDsldr?=
 =?iso-8859-1?Q?62GtRz5sHFWaW0jFwdzlspLoc5mEucBqFBZSZUme5uoayj6L5MDowPWMTD?=
 =?iso-8859-1?Q?aWfZPIzPN8AE7zc1dssrptNQA0fFs0Upo78gWJbozdqh3TkqqpYcux8RXY?=
 =?iso-8859-1?Q?LQ4Ydi3ZiFao41a3oO0t9jCTfqVQVfhiuEOTK+rZEhE/d37D78SMEPKuDL?=
 =?iso-8859-1?Q?oef/2BjVSEog+Ta8zEW39ZWrldqEcZhhipMGLuabmjj/vQnxIryYXEYxBO?=
 =?iso-8859-1?Q?jXGg4t/XjmUbhMye4hp/kezGAfIp6Let1E4qf/T45WjxLzdlNN8NWC+mH6?=
 =?iso-8859-1?Q?S8rsyomQzPE+Z0XjvzOKMSJH3gTZwNCPScj0wDht5kWN7Me5XP7ZtCAThP?=
 =?iso-8859-1?Q?kUDyvdgCBbmv0UXfnCGvGSXWbNnhKZHhLUWRIiG+KAdmqp4c42gbLu9XvS?=
 =?iso-8859-1?Q?aWDmoti1jmx6NZTNuuvz1LDk4pbCj/cL982yeyhq6YC7ZvrXRIjxtmuaNx?=
 =?iso-8859-1?Q?MgV0COz/Q072ZUk9sakFsqo4zfqNMMfR/JRIiWK/9TfMiWMsgUQIWlLw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8342bc57-0c76-48c6-c400-08daa84f45c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 10:32:45.2399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9YQq0UBcYWBLY9YOz//j3kG/BoUXzXkmtaNvE+BYjH2MnGV53ZNGWtc/q9ZoynD5V2+LpA1yX7eFVgYoMl24Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7159
X-Proofpoint-GUID: HX4J_RYu_KNOMa4DwtvDbvD0iJpi3afV
X-Proofpoint-ORIG-GUID: HX4J_RYu_KNOMa4DwtvDbvD0iJpi3afV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=965 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210070064

From: Mirela Simonovic <mirela.simonovic@aggios.com>

The implementation consists of:
-Adding PSCI system suspend call as new PSCI function
-Trapping PSCI system_suspend HVC
-Implementing PSCI system suspend call (virtual interface that allows
 guests to suspend themselves)

The PSCI system suspend should be called by a guest from its boot
VCPU. Non-boot VCPUs of the guest should be hot-unplugged using PSCI
CPU_OFF call prior to issuing PSCI system suspend. Interrupts that
are left enabled by the guest are assumed to be its wake-up interrupts.
Therefore, a wake-up interrupt triggers the resume of the guest. Guest
should resume regardless of the state of Xen (suspended or not).

When a guest calls PSCI system suspend the respective domain will be
suspended if the following conditions are met:
1) Given resume entry point is not invalid
2) Other (if any) VCPUs of the calling guest are hot-unplugged

If the conditions above are met the calling domain is labeled as
suspended and the calling VCPU is blocked. If nothing else wouldn't
be done the suspended domain would resume from the place where it
called PSCI system suspend. This is expected if processing of the PSCI
system suspend call fails. However, in the case of success the calling
guest should resume (continue execution after the wake-up) from the entry
point which is given as the first argument of the PSCI system suspend
call. In addition to the entry point, the guest expects to start within
the environment whose state matches the state after reset. This means
that the guest should find reset register values, MMU disabled, etc.
Thereby, the context of VCPU should be 'reset' (as if the system is
comming out of reset), the program counter should contain entry point,
which is 1st argument, and r0/x0 should contain context ID which is 2nd
argument of PSCI system suspend call. The context of VCPU is set during
resume path, to prevent it being overwritten by ctxt_switch_from after
vcpu is blocked and scheduled out.

VCPU is marked as suspended with _VPF_suspended flag. A suspended domain
will resume after the Xen receives an interrupt which is targeted to the
domain, unblocks the domain's VCPU, and schedules it in. During the
vcpu_unblock execution the VCPU is checked for VPF_suspended flag. If
the flag is present, the context of that VCPU gets cleared and entry
point/cid are set.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta.poturai@epam.com>
---
 xen/arch/arm/Makefile            |   1 +
 xen/arch/arm/domain.c            |   4 +
 xen/arch/arm/suspend.c           | 182 +++++++++++++++++++++++++++++++
 xen/arch/arm/vpsci.c             |  28 +++++
 xen/common/sched/core.c          |   8 ++
 xen/include/asm-arm/domain.h     |   3 +
 xen/include/asm-arm/perfc_defn.h |   1 +
 xen/include/asm-arm/psci.h       |   2 +
 xen/include/asm-arm/suspend.h    |  17 +++
 xen/include/xen/sched.h          |   3 +
 10 files changed, 249 insertions(+)
 create mode 100644 xen/arch/arm/suspend.c
 create mode 100644 xen/include/asm-arm/suspend.h

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index b5913c9d39..07dbbd99a3 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -49,6 +49,7 @@ obj-y +=3D setup.o
 obj-y +=3D shutdown.o
 obj-y +=3D smp.o
 obj-y +=3D smpboot.o
+obj-y +=3D suspend.o
 obj-y +=3D sysctl.o
 obj-y +=3D time.o
 obj-y +=3D traps.o
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 23c8b345d4..4110154bda 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -40,6 +40,8 @@
 #include <asm/vtimer.h>
 #include <asm/vscmi.h>
=20
+#include <public/sched.h>
+
 #include "vpci.h"
 #include "vuart.h"
=20
@@ -101,6 +103,8 @@ static void ctxt_switch_from(struct vcpu *p)
     if ( is_idle_vcpu(p) )
         return;
=20
+    /* VCPU's context should not be saved if its domain is suspended */
+
     p2m_save_state(p);
=20
     /* CP 15 */
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
new file mode 100644
index 0000000000..987ba6ac11
--- /dev/null
+++ b/xen/arch/arm/suspend.c
@@ -0,0 +1,182 @@
+/*
+ * Copyright (C) 2022 EPAM Systems Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License as publishe=
d
+ * by the Free Software Foundation; version 2.1 only. with the special
+ * exception on linking described in file LICENSE.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ */
+
+#include <xen/sched.h>
+#include <asm/cpufeature.h>
+#include <asm/event.h>
+#include <asm/psci.h>
+#include <asm/suspend.h>
+#include <public/sched.h>
+
+struct cpu_context cpu_context;
+
+/* Reset values of VCPU architecture specific registers */
+static void vcpu_arch_reset(struct vcpu *v)
+{
+    v->arch.ttbr0 =3D 0;
+    v->arch.ttbr1 =3D 0;
+    v->arch.ttbcr =3D 0;
+
+    v->arch.csselr =3D 0;
+    v->arch.cpacr =3D 0;
+    v->arch.contextidr =3D 0;
+    v->arch.tpidr_el0 =3D 0;
+    v->arch.tpidrro_el0 =3D 0;
+    v->arch.tpidr_el1 =3D 0;
+    v->arch.vbar =3D 0;
+    v->arch.dacr =3D 0;
+    v->arch.par =3D 0;
+#if defined(CONFIG_ARM_32)
+    v->arch.mair0 =3D 0;
+    v->arch.mair1 =3D 0;
+    v->arch.amair0 =3D 0;
+    v->arch.amair1 =3D 0;
+#else
+    v->arch.mair =3D 0;
+    v->arch.amair =3D 0;
+#endif
+    /* Fault Status */
+#if defined(CONFIG_ARM_32)
+    v->arch.dfar =3D 0;
+    v->arch.ifar =3D 0;
+    v->arch.dfsr =3D 0;
+#elif defined(CONFIG_ARM_64)
+    v->arch.far =3D 0;
+    v->arch.esr =3D 0;
+#endif
+
+    v->arch.ifsr  =3D 0;
+    v->arch.afsr0 =3D 0;
+    v->arch.afsr1 =3D 0;
+
+#ifdef CONFIG_ARM_32
+    v->arch.joscr =3D 0;
+    v->arch.jmcr =3D 0;
+#endif
+
+    if ( is_32bit_domain(v->domain) && cpu_has_thumbee )
+    {
+        v->arch.teecr =3D 0;
+        v->arch.teehbr =3D 0;
+    }
+}
+
+
+static void vcpu_suspend(register_t epoint, register_t cid)
+{
+    struct vcpu *v =3D current;
+
+    v->arch.suspend_ep =3D epoint;
+    v->arch.suspend_cid =3D cid;
+    set_bit(_VPF_suspended, &v->pause_flags);
+    return;
+}
+
+/*
+ * This function sets the context of current VCPU to the state which is ex=
pected
+ * by the guest on resume. The expected VCPU state is:
+ * 1) pc to contain resume entry point (1st argument of PSCI SYSTEM_SUSPEN=
D)
+ * 2) r0/x0 to contain context ID (2nd argument of PSCI SYSTEM_SUSPEND)
+ * 3) All other general purpose and system registers should have reset val=
ues
+ */
+void vcpu_resume(struct vcpu *v)
+{
+
+    struct vcpu_guest_context ctxt;
+
+    /* Make sure that VCPU guest regs are zeroed */
+    memset(&ctxt, 0, sizeof(ctxt));
+
+    /* Set non-zero values to the registers prior to copying */
+    ctxt.user_regs.pc64 =3D (u64)v->arch.suspend_ep;
+
+    if ( is_32bit_domain(v->domain) )
+    {
+        ctxt.user_regs.r0_usr =3D v->arch.suspend_cid;
+        ctxt.user_regs.cpsr =3D PSR_GUEST32_INIT;
+
+        /* Thumb set is allowed only for 32-bit domain */
+        if ( v->arch.suspend_ep & 1 )
+        {
+            ctxt.user_regs.cpsr |=3D PSR_THUMB;
+            ctxt.user_regs.pc64 &=3D ~(u64)1;
+        }
+    }
+#ifdef CONFIG_ARM_64
+    else
+    {
+        ctxt.user_regs.x0 =3D v->arch.suspend_cid;
+        ctxt.user_regs.cpsr =3D PSR_GUEST64_INIT;
+    }
+#endif
+    ctxt.sctlr =3D SCTLR_GUEST_INIT;
+    ctxt.flags =3D VGCF_online;
+
+    /* Reset architecture specific registers */
+    vcpu_arch_reset(v);
+
+    /* Initialize VCPU registers */
+    arch_set_info_guest(v, &ctxt);
+    clear_bit(_VPF_suspended, &v->pause_flags);
+}
+
+int32_t domain_suspend(register_t epoint, register_t cid)
+{
+    struct vcpu *v;
+    struct domain *d =3D current->domain;
+    bool is_thumb =3D epoint & 1;
+
+    dprintk(XENLOG_DEBUG,
+            "Dom%d suspend: epoint=3D0x%"PRIregister", cid=3D0x%"PRIregist=
er"\n",
+            d->domain_id, epoint, cid);
+
+    /* THUMB set is not allowed with 64-bit domain */
+    if ( is_64bit_domain(d) && is_thumb )
+        return PSCI_INVALID_ADDRESS;
+
+    /* Ensure that all CPUs other than the calling one are offline */
+    for_each_vcpu ( d, v )
+    {
+        if ( v !=3D current && is_vcpu_online(v) )
+            return PSCI_DENIED;
+    }
+
+    //TODO: add support for suspending from any VCPU
+    if (current->vcpu_id !=3D 0)
+        return PSCI_DENIED;
+
+    /*
+     * Prepare the calling VCPU for suspend (reset its context, save entry=
 point
+     * into pc and context ID into r0/x0 as specified by PSCI SYSTEM_SUSPE=
ND)
+     */
+    vcpu_suspend(epoint, cid);
+
+    /*
+     * The calling domain is suspended by blocking its last running VCPU. =
If an
+     * event is pending the domain will resume right away (VCPU will not b=
lock,
+     * but when scheduled in it will resume from the given entry point).
+     */
+    vcpu_block_unless_event_pending(current);
+
+    return PSCI_SUCCESS;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index c1e250be59..f4e6e92873 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -18,6 +18,7 @@
 #include <asm/vgic.h>
 #include <asm/vpsci.h>
 #include <asm/event.h>
+#include <asm/suspend.h>
=20
 #include <public/sched.h>
=20
@@ -208,6 +209,11 @@ static void do_psci_0_2_system_reset(void)
     domain_shutdown(d,SHUTDOWN_reboot);
 }
=20
+static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t ci=
d)
+{
+    return domain_suspend(epoint, cid);
+}
+
 static int32_t do_psci_1_0_features(uint32_t psci_func_id)
 {
     /* /!\ Ordered by function ID and not name */
@@ -225,6 +231,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_=
id)
     case PSCI_0_2_FN32_SYSTEM_OFF:
     case PSCI_0_2_FN32_SYSTEM_RESET:
     case PSCI_1_0_FN32_PSCI_FEATURES:
+    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
+    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
     case ARM_SMCCC_VERSION_FID:
         return 0;
     default:
@@ -355,6 +363,26 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uin=
t32_t fid)
         return true;
     }
=20
+    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
+    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
+    {
+        register_t epoint =3D PSCI_ARG(regs,1);
+        register_t cid =3D PSCI_ARG(regs,2);
+        register_t ret;
+
+        perfc_incr(vpsci_system_suspend);
+        /* Set the result to PSCI_SUCCESS if the call fails.
+         * Otherwise preserve the context_id in x0. For now=20
+         * we don't support the case where the system is suspended
+         * to a shallower level and PSCI_SUCCESS is returned to the=20
+         * caller.
+         */
+        ret =3D do_psci_1_0_system_suspend(epoint, cid);
+        if ( ret !=3D PSCI_SUCCESS )
+            PSCI_SET_RESULT(regs, ret);
+        return true;
+    }
+
     default:
         return false;
     }
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 8f4b1ca10d..4e1ea62c44 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -38,6 +38,10 @@
 #include <xsm/xsm.h>
 #include <xen/err.h>
=20
+#if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
+#include <asm/suspend.h>
+#endif
+
 #include "private.h"
=20
 #ifdef CONFIG_XEN_GUEST
@@ -957,6 +961,10 @@ void vcpu_unblock(struct vcpu *v)
 {
     if ( !test_and_clear_bit(_VPF_blocked, &v->pause_flags) )
         return;
+#if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
+    if ( test_bit(_VPF_suspended, &v->pause_flags) )
+        vcpu_resume(v);
+#endif
=20
     /* Polling period ends when a VCPU is unblocked. */
     if ( unlikely(v->poll_evtchn !=3D 0) )
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 413e5a2a18..715841e0b5 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -203,6 +203,9 @@ struct arch_vcpu
     struct vtimer virt_timer;
     bool   vtimer_initialized;
=20
+    register_t suspend_ep;
+    register_t suspend_cid;
+
     /*
      * The full P2M may require some cleaning (e.g when emulation
      * set/way). As the action can take a long time, it requires
diff --git a/xen/include/asm-arm/perfc_defn.h b/xen/include/asm-arm/perfc_d=
efn.h
index 31f071222b..d71e91a5e4 100644
--- a/xen/include/asm-arm/perfc_defn.h
+++ b/xen/include/asm-arm/perfc_defn.h
@@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: system_res=
et")
 PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
 PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
 PERFCOUNTER(vpsci_features,            "vpsci: features")
+PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
=20
 PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
=20
diff --git a/xen/include/asm-arm/psci.h b/xen/include/asm-arm/psci.h
index 832f77afff..26462d0c47 100644
--- a/xen/include/asm-arm/psci.h
+++ b/xen/include/asm-arm/psci.h
@@ -43,10 +43,12 @@ void call_psci_system_reset(void);
 #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
 #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
 #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
+#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
=20
 #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
 #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
 #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
+#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
=20
 /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
 #define PSCI_0_2_AFFINITY_LEVEL_ON      0
diff --git a/xen/include/asm-arm/suspend.h b/xen/include/asm-arm/suspend.h
new file mode 100644
index 0000000000..fbaa414f0c
--- /dev/null
+++ b/xen/include/asm-arm/suspend.h
@@ -0,0 +1,17 @@
+#ifndef __ASM_ARM_SUSPEND_H__
+#define __ASM_ARM_SUSPEND_H__
+
+int32_t domain_suspend(register_t epoint, register_t cid);
+void vcpu_resume(struct vcpu *v);
+
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 3b4ed3a2ab..b2f6d1af28 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -903,6 +903,9 @@ static inline struct domain *next_domain_in_cpupool(
 /* VCPU is parked. */
 #define _VPF_parked          8
 #define VPF_parked           (1UL<<_VPF_parked)
+/* VCPU is suspended */
+#define _VPF_suspended       9
+#define VPF_suspended        (1UL<<_VPF_suspended)
=20
 static inline bool vcpu_runnable(const struct vcpu *v)
 {
--=20
2.37.1

