Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF29D5F78A0
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 15:09:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417986.662727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogn5y-0005sg-LM; Fri, 07 Oct 2022 13:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417986.662727; Fri, 07 Oct 2022 13:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogn5y-0005py-IM; Fri, 07 Oct 2022 13:08:54 +0000
Received: by outflank-mailman (input) for mailman id 417986;
 Fri, 07 Oct 2022 13:08:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uvLM=2I=epam.com=prvs=22797713c5=mykyta_poturai@srs-se1.protection.inumbo.net>)
 id 1ogn5w-0005ps-Qu
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 13:08:53 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2eff056e-4641-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 15:08:50 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 297C3WmA020386;
 Fri, 7 Oct 2022 13:08:44 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3k2a45t4br-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Oct 2022 13:08:44 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com (2603:10a6:803:33::29)
 by AS1PR03MB8150.eurprd03.prod.outlook.com (2603:10a6:20b:4c6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Fri, 7 Oct
 2022 13:08:40 +0000
Received: from VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273]) by VI1PR03MB3758.eurprd03.prod.outlook.com
 ([fe80::77e8:5cf6:210:7273%5]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 13:08:40 +0000
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
X-Inumbo-ID: 2eff056e-4641-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLT5BPypL+dlfWryd1U1LeeYkmTsFquCiLaKNJYy4Nav6QvYuj6UebYwvYfwprW+82Nlli9Hmk6hxKSp2TN1xxyBmXHZQr0sACKZzoa+EYiCTkFlOHSQqIT6XVMShg0svNZ58Vb0DQ3T6pMelBXnexkwrT/dW2LxmZHsHCdUHIR5seChjXI5cxrSyb60p6pqCK36YEUmEDMJxsH4AgClPj5qiIdvMnPN62AelMXdV66KeEDSiEY1FJ0qnlpjSytWTGOik2Xhpgdqk25it1pBGWEMCk1O7yhhI1Btwc5WI+CirXn0U9gl2v/uiBePGjOcNiao6ZXS4IpohBUE30Izhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UbPdP4bVWAsM7T1sTAb1wibKL0UUmpwrjmjsEazapo=;
 b=hU99NTzVRMGbHSBvxN4SouiQvmzj1OVqqUFNe+nIQVcZZlnedjXGNScESGKc+OMS52LHxgtb7l9Iu4QdcQDU4PW1gqAjSc9R9FI63rdLg6LGgmv9eTRQDstFwIFIGG22WzLHdUqOVZC3LBTOn7RoISXc3riLOolKvQIqV/0CsbIkZ15smypP29wo1iMk3VOiC3BazvDpYCNB6kFWXmspRo/dAmHLcmiZntBTdfoFlqJwmRYognV3kIyuQf+Kj5WoVZSjJS3DwQ+30K0Kw4WKzWYq3NnQK1yIwo4kL/SXupz90gtb/V5em9Mm2h58RdRyo0T2ZjFV4PS5FTOxGFM+qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UbPdP4bVWAsM7T1sTAb1wibKL0UUmpwrjmjsEazapo=;
 b=O7j4NjSpjjAx8Nqs+Z5ZVYvrDJdqXRybqxxYp0X0FA+IgsxTSW1Hp70ZdpjhXtLdzc1y81jkq5JJf2V60bPKxrDe91061RrSQOghYhB6FtcTL7qmBDJKXmdEhpoo3aKMVNHq4m/nIOudEmWbaoylr4HI1KG0+DaXEiF6ajZivq45mJzpJqmAPqm9Lx1EIO2OCcS/s/KGNdq3bgQytMj/C4PWQ0o4ZfRvY+75T3nllBQRx+Zf8OfcDdCD95XsZ/V4BTbpY2+19KDdpsFPRGpTdgLKKq/5342aaF53uOZ9jj0Uk/r62iRZWRc7vgYLiN/Mmq+MCRRK4QCGUqZh9ksrFw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>,
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
	<dfaggioli@suse.com>
Subject: [PATCH 00/19] xen/arm64: Suspend to RAM support for Xen
Thread-Topic: [PATCH 00/19] xen/arm64: Suspend to RAM support for Xen
Thread-Index: AQHY2k3rsZJ6XuL2JUet06jBlxWLjg==
Date: Fri, 7 Oct 2022 13:08:40 +0000
Message-ID: <cover.1665128335.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3758:EE_|AS1PR03MB8150:EE_
x-ms-office365-filtering-correlation-id: 422d6da5-4efd-4e6b-748e-08daa8650dbe
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MNaAyEMXYm5HqSciyq+r8GIJY5mU/sTN/C8HaEB5A7REcKseq43c6qGgTRtx+jFoop4HEyMrhJac1ES2O91da4lpMVwmeqnMK3jZd7YW6tGr3kZYVcxq5WCzV0RqkObPThuep2h/+7y7yP/2ozzq5nGI39haeVKpBVhg3QdpIskrtUdsEBgdQg/Q7z1UPHIvx6rd+PzgG2SJ/4u2c4geMn1NFYOtVS9ISI49moFYc57VxbWvIGw+5WpUTjFxEwiQTPujyf8tCQQv7/hCWYicXMCzXk4U6APK2erW4bUk90D1sjgO2MlvYXnxu9wO/edKpbgkajndmgrcyJ9y0rEmrfe1/AsYCYEmkB1i0lIfbnRsnvAQRcu2ESENOleP/fDLq/cFcGYdMI6Xo1U05o36v3I27+8AaHmrzMhOXI+PxgQQDYHk+rjZstbCR3yysTLesdSCev+yP7VoweTG/KPkst2gCWufS+LjnIrUyvpHcYzwu32+9pjs66fbOAlaT3DktOZYxwn8vRKfq7cl2bUcFpxM+wXT4DKNmhoXtNQZCGZnWJqBR0+pN0A6gz1ECx1IvAwHb7pj8qI4mQ4z6aQTOL18VT6yWpwRsNHBWNWrbdl10/RFIN6Q6PbTV/djh8QK9c/lg4swFon6hm4aODsMOLd7FQkg1+e1q69nFYO1vN5q93h8Iz1m9wprPZHseomdCFievkS/jy0p2x4jUX+uQTRtGko6zb+gYbqUneToYwqies5tuLsGjFKQKtiaF4KHVJpWFYcwc5h87LyKCmBctcwp1iWRm53Vjl75EMte0Po=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3758.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199015)(6506007)(6486002)(38070700005)(6916009)(54906003)(966005)(316002)(478600001)(71200400001)(2906002)(122000001)(38100700002)(186003)(66476007)(66556008)(15650500001)(64756008)(41300700001)(7416002)(66946007)(36756003)(8676002)(76116006)(4326008)(66446008)(91956017)(55236004)(26005)(86362001)(5660300002)(2616005)(8936002)(6512007)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ZpG1wxYbI6o+cg14DuPiCWQaNot5Tm5zanh4bCWZaLQgtFFLoof5tSwd/t?=
 =?iso-8859-1?Q?+SHLN6d7v3+Nk0C2WBDNGVyDAkiibPhllnrMGTnLpe0PMaowRDGbpqWSxT?=
 =?iso-8859-1?Q?vrpELA83YNWqUDFmPFI8jZe/BktcIOav/98RC9mk51wizIaTnmoGWDNezo?=
 =?iso-8859-1?Q?cea4gWHWI3l40v9gzZSPBzFfJOWQADbNmExbrTxLP7bTNTl8lYfWuKK7ib?=
 =?iso-8859-1?Q?Dpuq2Ix4N5vLt+dIbrtiwKhSAvpBt9Kmb5nzu1Fw4xjFgSg6cYkUUy5KGg?=
 =?iso-8859-1?Q?6N73j3pwAaUE+hahPZUWCEAOk+Tu3MSf3g5scmgaPsfpLLPuqXZITUQxlE?=
 =?iso-8859-1?Q?fHSMdnoJaD/4yKM+uCLB0FqRrKEZeKFMIo7k5Nk8GSPbFzWF2KRXUihcZ2?=
 =?iso-8859-1?Q?8cm/QZ2QrNrGHs6O3Aai9kvWHRLDsy3HA5KDLZYB4iQb+2RYsG+x+pS0yf?=
 =?iso-8859-1?Q?E7OvrBSGBlwNo0vmqybXa8/G5BANlkQTGtIKJSlN5lmsHcUkwHaLnPfAKT?=
 =?iso-8859-1?Q?EnVw002mDXUCIy0bc3L4OuMdolaMu08/l+SCSeSuSb/s9rgNKR4kCCVuDB?=
 =?iso-8859-1?Q?Qz3SsSHWS7vuitTp8pKVC2cdVL3buwO69PkAerW0hK8bu7jqe2+9tSc2XF?=
 =?iso-8859-1?Q?A3JwZoEN2IY3KcIjptSQ5DAlYqaCgpWyUwvB7lAeW3TpzdlSfICnDcSom6?=
 =?iso-8859-1?Q?t8Q3jxenrLC1e5hoFG54raIA57c3//b1uEUMjkhXnAoQOeHIgOEI7hClad?=
 =?iso-8859-1?Q?qfDSGVUoja4z+T2t0co2YSAmJ1lfnPOjfWl51XdmdDtQyl6XhPgDSirsTI?=
 =?iso-8859-1?Q?VpAh57UN6U7vxhOHQLWFz9eRBhGRksOpAxmxcp5VHt7JKFRYSSLx1HRcAg?=
 =?iso-8859-1?Q?PAWYcmbtZbsSP5PHlfrVlDK3a3wJx2Ra9i6jEbbKQpGb5ibFRXxvr1dIlN?=
 =?iso-8859-1?Q?7CTsu3BauMK9zKLp/VRYDTmNwgJNKVnig+zfn0zN/PaXDSs3PAaL+yyoa3?=
 =?iso-8859-1?Q?NYG6HW+mAQfxHykehr6/w83GjeFv7U7vdCtCs0XBzDGELpkPy+sFjpsYKN?=
 =?iso-8859-1?Q?Gio5JqAnDXnJJJRPkssJmNgGAWRmInlpBgJUl0yNBonSSmk4ByshypT2u3?=
 =?iso-8859-1?Q?L5/peS46OI93kwYEYwyEvwvEljkyQ9IpGvLLnMs1dYt4Iw+vnRRM3JjqCK?=
 =?iso-8859-1?Q?EtXMg1CrgGdEqhcpQ7S5Ant3L8FhNTdWwB8I3x90MCM/QHSfUq03Ei3K/N?=
 =?iso-8859-1?Q?//xJQCfI5heuD0lCVqoEUn6rZ/4nNT4swQmIe5f8eqv8QZvlX3DXobTkPa?=
 =?iso-8859-1?Q?DCC4GNwAuXbzFUG6lBO37xe9Qc2Gv5BEV1emVLDdHI0K8y7qDsWxJQ7QS1?=
 =?iso-8859-1?Q?olQDxh84qklIqdrj84Pi3XJA65IFvHWEKNxDdjzb48VfRbQia97HWa7WtW?=
 =?iso-8859-1?Q?yGaWCnrOD9/gnfI6LBgUIgkMK46a5J584H3zZS3UTWl0nY2TpQ890s6nzb?=
 =?iso-8859-1?Q?yqCu73372ah5PFYojnNejzKEhzXlUNtUsaxP1wgplK7EsVItopvvJ+ot/W?=
 =?iso-8859-1?Q?rcsBeJP7z8eyAM7Ka1t8ydji6loda/5OfDPEVuvZTxsl1JYfhgcnrYVtZW?=
 =?iso-8859-1?Q?OGPm+bCOxWHIizA6HY+q4p8giNPSOFbS6WdSyHb8/wtGCY09F4Y09E8A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3758.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 422d6da5-4efd-4e6b-748e-08daa8650dbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 13:08:40.1470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ynQqJEd9UUAis4QfPGVF6AtT+oD5Slskrzg0N0xc+yF0haYQA48j/pnJAppZyC6CNcBvTWVXyN6b2jmuUY297w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR03MB8150
X-Proofpoint-GUID: jBncKgJDaDydLMu5ka6Gw1AUXIsB3IX4
X-Proofpoint-ORIG-GUID: jBncKgJDaDydLMu5ka6Gw1AUXIsB3IX4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210070079

This is a series from Mirela Simonovic. Ported to 4.16 and with
added changes suggested here=20
https://lore.kernel.org/all/CAKPH-NjmaZENb8gT=3D+FobrAycRF01_--6GuRA2ck9Di5=
wiudhA@mail.gmail.com

This series contains support for suspend to RAM (in the following text just
'suspend') for Xen on arm64. The implementation is aligned with the design
specification that has been proposed on xen-devel list:
https://lists.xenproject.org/archives/html/xen-devel/2017-12/msg01574.html

At a high-level the series contains:
1) Support for suspending guests via virtual PSCI SYSTEM_SUSPEND call
2) Support for resuming a guest on an interrupt targeted to that guest
3) Support for suspending Xen after dom0 finalizes the suspend
4) Support for resuming Xen on an interrupt that is targeted to a guest


---------------------------------------------------------------------------=
-----
In more details:

*** About suspending/resuming guests

The patches included in this series allow PSCI compliant guests that have
support for suspend to RAM (e.g. echo mem > /sys/power/state in Linux) to
suspend and resume on top of Xen without any EL1 code changes.

During their suspend procedure guests will hot-unplug their secondary CPUs,
triggering Xen's virtual CPU_OFF PSCI implementation, and then finalize the
suspend from their boot CPU, triggering Xen's virtual SYSTEM_SUSPEND PSCI.
Guests will save/restore their own EL1 context on suspend/resume.

A guest is expected to leave enabled interrupts that are considered to be i=
ts
wake-up sources. Those interrupts will be able to wake up the guest. This h=
olds
regardless of the state of the underlying software layers, i.e. whether Xen=
 gets
suspended or not doesn't affect the ability of the guest to wake up.

First argument of SYSTEM_SUSPEND PSCI call is a resume entry point, from wh=
ich
the guest assumes to start on resume. On resume, guests assume to be runnin=
g in
an environment whose state matches the CPU state after reset, e.g. with res=
et
register values, MMU disabled, etc. To ensure this, Xen has to 'reset' the
VCPU context and save the resume entry point into program counter before th=
e
guest's VCPU gets scheduled in on resume. This is done when the guest resum=
es.
Xen also needs to take care that the guest's view of GIC and timer gets sav=
ed.
Also, while a guest is suspended its watchdogs are paused, in order to avoi=
d
watchdog triggered shutdown of a guest that has been asleep for a period of=
 time
that is longer than the watchdog period.

After this point, from Xen's point of view a suspended guest has one VCPU
blocked, waiting for an interrupt. When such an interrupt comes, Xen will
unblock the VCPU of the suspended domain, which results in the guest
resuming.

*** About suspending/resuming Xen

Xen starts its own suspend procedure once dom0 is suspended. Dom0 is
considered to be the decision maker for EL1 and EL2.
On suspend, Xen will first freeze all domains. Then, Xen disables physical
secondary CPUs, which leads to physical CPU_OFF to be called by each second=
ary
CPU. After that Xen finalizes the suspend from the boot CPU.

This consists of suspending the timer, i.e. suppressing its interrupts (we =
don't
want to be woken up by a timer, there is no VCPU ready to be scheduled). Th=
en
the state of GIC is saved, console is suspended, and CPU context is saved. =
The
saved context tells where Xen needs to continue execution on resume.
Since Xen will resume with MMU disabled, the first thing to do in resume is=
 to
resume memory management in order to be able to access the context that nee=
ds to
be restored (we know virtual address of the context data). Finally Xen call=
s
SYSTEM_SUSPEND PSCI to the EL3.

When resuming, all the steps done in suspend need to be reverted. This is
completed by unblocking dom0's VCPU, because we always want the dom0 to
resume,
regardless of the target domain whose interrupt woke up Xen.

*** Handling of unprivileged guests during Xen suspend/resume

Any domU that is not suspended when dom0 suspends will be frozen, domUs tha=
t are
already suspended remain suspended. On resume the suspended domUs still rem=
ain
suspended (unless their wake interrupt caused Xen to wake) while the
others will be thawed.

For more details please refer to patches or the design specification:
https://lists.xenproject.org/archives/html/xen-devel/2017-12/msg01574.html

Juergen Gross (1):
  xen: don't free percpu areas during suspend

Mirela Simonovic (15):
  xen/arm: Implement PSCI system suspend
  xen/arm: While a domain is suspended put its watchdogs on pause
  xen/arm: Trigger Xen suspend when Dom0 completes suspend
  xen/x86: Move freeze/thaw_domains into common files
  xen/arm: Freeze domains on suspend and thaw them on resume
  xen/arm: Disable/enable non-boot physical CPUs on suspend/resume
  xen/arm: Add rcu_barrier() before enabling non-boot CPUs on resume
  xen/arm: Implement GIC suspend/resume functions (gicv2 only)
  xen/arm: Suspend/resume GIC on system suspend/resume
  xen/arm: Suspend/resume timer interrupt generation
  xen/arm: Implement PSCI SYSTEM_SUSPEND call (physical interface)
  xen/arm: Resume memory management on Xen resume
  xen/arm: Save/restore context on suspend/resume
  xen/arm: Resume Dom0 after Xen resumes
  xen/arm: Suspend/resume console on Xen suspend/resume

Mykyta Poturai (2):
  watchdog: Introduce a separate struct for watchdog timers
  timers: Don't migrate timers during suspend

Oleksandr Andrushchenko (1):
  Fix misleading indentation gcc warning

 xen/arch/arm/Makefile            |   1 +
 xen/arch/arm/arm64/entry.S       |   2 +
 xen/arch/arm/arm64/head.S        | 121 +++++++++++++
 xen/arch/arm/domain.c            |   4 +
 xen/arch/arm/gic-v2.c            | 138 ++++++++++++++-
 xen/arch/arm/gic.c               |  25 +++
 xen/arch/arm/mm.c                |   1 +
 xen/arch/arm/percpu.c            |   7 +-
 xen/arch/arm/psci.c              |  16 ++
 xen/arch/arm/suspend.c           | 292 +++++++++++++++++++++++++++++++
 xen/arch/arm/time.c              |  22 +++
 xen/arch/arm/vpsci.c             |  28 +++
 xen/common/domain.c              |  29 +++
 xen/common/keyhandler.c          |   2 +-
 xen/common/sched/core.c          |  55 +++++-
 xen/common/timer.c               |   3 +-
 xen/include/asm-arm/domain.h     |   3 +
 xen/include/asm-arm/gic.h        |   8 +
 xen/include/asm-arm/perfc_defn.h |   1 +
 xen/include/asm-arm/processor.h  |  22 +++
 xen/include/asm-arm/psci.h       |   3 +
 xen/include/asm-arm/suspend.h    |  40 +++++
 xen/include/asm-arm/time.h       |   3 +
 xen/include/xen/sched.h          |  16 +-
 xen/include/xen/watchdog.h       |   6 +
 25 files changed, 837 insertions(+), 11 deletions(-)
 create mode 100644 xen/arch/arm/suspend.c
 create mode 100644 xen/include/asm-arm/suspend.h

--=20
2.37.1

