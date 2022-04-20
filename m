Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E428508877
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 14:48:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309223.525264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh9kw-0002bM-5D; Wed, 20 Apr 2022 12:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309223.525264; Wed, 20 Apr 2022 12:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh9kw-0002Yg-1T; Wed, 20 Apr 2022 12:48:26 +0000
Received: by outflank-mailman (input) for mailman id 309223;
 Wed, 20 Apr 2022 12:48:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yir3=U6=marvell.com=nareshb@srs-se1.protection.inumbo.net>)
 id 1nh9ku-0002PJ-DU
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 12:48:24 +0000
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com
 [67.231.156.173]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2981ee39-c0a8-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 14:48:23 +0200 (CEST)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 23KAYT2H009244;
 Wed, 20 Apr 2022 05:48:13 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3fhtapd81c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Apr 2022 05:48:13 -0700
Received: from DM6PR18MB3193.namprd18.prod.outlook.com (2603:10b6:5:1c4::10)
 by BY5PR18MB3202.namprd18.prod.outlook.com (2603:10b6:a03:1ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 12:48:09 +0000
Received: from DM6PR18MB3193.namprd18.prod.outlook.com
 ([fe80::987b:cd7e:d809:9a45]) by DM6PR18MB3193.namprd18.prod.outlook.com
 ([fe80::987b:cd7e:d809:9a45%5]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 12:48:09 +0000
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
X-Inumbo-ID: 2981ee39-c0a8-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8ZOIPNiWx5JW5GFsNa+m8hNtSz1o9ouA4C/xXk6mB+kccEQpZzmaZA2NXTwYg0KxjGEQ/04xFGdPD/3P2sJ7tzGQN1LTfPx+RA5DAf3fhxhbT9JSRksx676qMsEOn0C0NheX7DGrc100RqzKm4pMzzN9XE5uJsAYkfcgd9ELAhlwE9r5wYPcWP7vXHvYlVTwYcCTPThPe5i/YakVckmbDdIywueYF/06n7VvasBnFxaFZNX7MWHokyqaV1f3+x9RMrZI81B9OWJORjN4kaNcMCikLi1avIh4MNxlGiQTWoPZ4kkG7S8Ijxbu3bl6ubgObvxRzUcB+H11oFXMGzT/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZ4XQfscFW4XNzWpat06473mKPO2/jW7rq0jSMlmmFA=;
 b=B9eTMSrnTo2tbA0vGQjmjBjy2mjMqJvhTaoeqSmJOvG/MHUP0GViF5pzmSaVPE2fKYQqfM2zpumw58bki6Gu8A1hNU+a72BWw3/oWCX1VDWGFcKLBDK772Z6WLAk6NOVvRnxdadVuEG8nq5aVv6QyRe66JgYECdkDALwU5KUj1bH3RmEuSMYjRR3q3pZ58430PekbhRYuGaemuCF0fVxohaLNFMfb+Ym7XsekPJ1QroCyhGsIYFzM212y1Z018JraotQwqpU+l7BiZpQJmYEhpcG3TjPqYC0WpWwmuvX01iHqwxmaXiovwop5sxLtRmrouhs87r0mZaSBe3a3Nl19g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZ4XQfscFW4XNzWpat06473mKPO2/jW7rq0jSMlmmFA=;
 b=DyOBoic3ZIUYof65nZIFiR5Q47FkCAgeS1oisdBCQixhcDzWZ+QwPwVcDspbHrkHpFr0QLGW68KG2Sk3e/j7V6pyLrO8zT/1HNJf/7gPR8kBpDfO3JwX+RZkK8jH1ua92ABv02V9mtr9jOZvU8XmkpGzIvgr/cTQ2fc7FVere5w=
From: Naresh Bhat <nareshb@marvell.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>
Subject: DOMU: Virtual Function FLR in PCI passthrough is crashing
Thread-Topic: DOMU: Virtual Function FLR in PCI passthrough is crashing
Thread-Index: AQHYVLOBoc8zYi1khUW56WNBox6p/A==
Date: Wed, 20 Apr 2022 12:48:09 +0000
Message-ID: 
 <DM6PR18MB3193BA01B3A6FE2A4A9EAE5CB9F59@DM6PR18MB3193.namprd18.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 3881f8c8-5b13-69d0-d21d-4a02acccd4cb
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dca3b9df-6a12-4e82-a124-08da22cc0637
x-ms-traffictypediagnostic: BY5PR18MB3202:EE_
x-microsoft-antispam-prvs: 
 <BY5PR18MB3202137F228FC623A3452F07B9F59@BY5PR18MB3202.namprd18.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tl8iZAtZATbn04Wm0GC95yWbUsVFSJbpX5MNf92tW3xN/KCz3GA9fSuWrObD0bAjA0t5Gx4d1Hz75uQWk6XRUuQLr3R0iTTWBclbO0id9/WXngRLF6KvRea5SNEHp++zr+C3RKDB3viXwps8vC8vFvIheroTITLvcsOi7wxRKA4b2rL4uWK6Q7janj/aBsqzPZSCZsp7xzNAdAMKK4Zc3vQJ5Ni2LwpjNcpEaWOQ8tL+iKRqYNJKQC3glLempqKYhyGfUFXA3DdngO9xpIzAMkv6B4xX5mKN0C/BxbNJtAr0+kjvKHSIXUu9euBnkOsii5dYrq3mwGfn1otXlwMG8ApcXkE6Dq20VLrHZaeXfZJ8vzfeMYhkOibyRuM+Z7gVcSJGy9PhxinVwNHpIv+gkAYLGwixbvADMinBC3ugvWrFfmzmfMrULEG5iTCc7P3ve87dYOpbNZbVYETnCZyr2kV0DQTC0eKe/haeRwKv9v3roPvMwiusskahdfQcCI3he6/4KjRzzhONABHm9KSbFgfbLUcfe5uRwCw1V+5V3W8zU6LjANynAmtqqDFsFPJgn4GklGS0Pw4MfKp9g0Bl4RD1xr9Cb6CrpCUbqAqITM93NeuDs78odHbQF+cQ9jtJ/J3dNzNGqmgrvCmJGBUofDu7PeQ/oV5OtXLNqMkAUWh//P6nBpVJoPoQv/HAS5FnJkWGJ2FPIuFQxkDS+jyR/Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR18MB3193.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(33656002)(54906003)(508600001)(6916009)(66446008)(66556008)(91956017)(66946007)(52536014)(76116006)(71200400001)(45080400002)(4326008)(8676002)(8936002)(66476007)(5660300002)(64756008)(86362001)(9686003)(6506007)(7696005)(26005)(2906002)(83380400001)(38070700005)(38100700002)(55016003)(122000001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?NonSnZ2aIzPSH9AO5yYKXGcW+eOpSy1uEPdaDl4WVjmzXSF01b7zmzwVmG?=
 =?iso-8859-1?Q?Cn1G5ZJjjglJXB0+tKpej4DtQyI7f7gE3cmbfaL54pbWYNVvg7hLj355qw?=
 =?iso-8859-1?Q?EkIBg+bdYlJcAHMJIfK+fLy4v6s+ejtIpmx2KmTWHlQJMNwNaP/oGiOEZ1?=
 =?iso-8859-1?Q?IGRpOOra7e8aWd1ve6Gre9lLdJGmAiZYHiLLR/mBtfVKyHoHrgj/oIahwP?=
 =?iso-8859-1?Q?xX1AOsDlOLfaCGFALtNTGWN7ZXdcWHjP6FGQC2349nJ0KGaTYtAJVZLrdK?=
 =?iso-8859-1?Q?aaoiJVQdsfxnFgB+m47NmM1ThNKYmLfIgm+zrwfmrLeDRv38/iGBK+Lh0R?=
 =?iso-8859-1?Q?FI+0Ne6AeloDy9pk28CW6oPCNfOuD8DP0ZVaK85PYlllF9lX1x7EGQBQz8?=
 =?iso-8859-1?Q?QtCz3kJr1LqJMczJLt1/UpH8DBFt5TYMGzqjQF9dbNXk313112GycBbSEr?=
 =?iso-8859-1?Q?6s/kZ8UAARqE/VIAnmGgUR+W5vYqnYefOr7SFfc+KC8G3tIBoWtC/mXmHi?=
 =?iso-8859-1?Q?wlRE3eHvYxcaW+JIeyG0FgwLc4ssEjKYLlnq1a63HQUTXvalnc/xbCfEhA?=
 =?iso-8859-1?Q?WvZSjYaNf4civvTadldBWq2QjHYx//WxMki5dqLaJOUpUyiExsrPIX+M1P?=
 =?iso-8859-1?Q?/g7BfeQQl6sYP6jCVQF+3yiiSIeEN19yseVSmN2BdeWrkHQr1ft0vzMth1?=
 =?iso-8859-1?Q?PDFj4/Ps57JsDB4uhR6d/4mtV0a7k0pM4BbNNNFj2/5W/wWuXIMh47XIFJ?=
 =?iso-8859-1?Q?Ae/e5WVflpmfpo1hayIcbhyMcQHXHN+yurLp7q6XwaixrLExWTeGNMCfbo?=
 =?iso-8859-1?Q?9vmAZL2EyO8Gwe2Lx5PnWgPnhuKMGIw99nMBqgS98yJSadcN3XwBFSGDkU?=
 =?iso-8859-1?Q?8RsLKX/Y2WrBxqrRwkereqExlJkClUAQpyRATQizH3IAwB3UqJy5qGBfHt?=
 =?iso-8859-1?Q?eii2jf+ssNQ9pqUdVAVSgkm4dgKLGec/FD5lnyroOBWhCdpN/yyDn/gpr3?=
 =?iso-8859-1?Q?O1+QQnuH11NhddKl+4Y7Xa+Jf9k8TMkf+tDrIXFga4ML8LE5xE4QwvEZWz?=
 =?iso-8859-1?Q?Rot30kuHVX/Gowu4vko+IDibPRWmlQJuUCMjhKHfLrdKBMYPsZcdPcf+zF?=
 =?iso-8859-1?Q?LUSSsX3VRNov4VL/SQB0ZWLrtIVu07WJFzPYZX3+vJW94UG2ygoZzHylL4?=
 =?iso-8859-1?Q?+nzvTBMesEWpdbxosjAuj7k+7ERtzsPKIthY+gnsJvBtGm2TiRWyTdFAzv?=
 =?iso-8859-1?Q?NshG7uRuK85Aa+zRiIjY2ilfo7VrDpyJoSAzbazD8RkXvWv0yON59hpBGX?=
 =?iso-8859-1?Q?AGRx3is351rO+gcAas4sWMGQaPUD+KPX3/yisFD/CQRSz5990FFAIwzajs?=
 =?iso-8859-1?Q?BVQr30ZERK4Md+BbTWD7VJa1liK6ZeZ3nOhMKhxNC24xt0fK1mHKSW1djP?=
 =?iso-8859-1?Q?MikPQaNC9HNTUUiEUyW2YmcgbAt68SjJq36VvQxGYLda/M5XtIP67AEPOF?=
 =?iso-8859-1?Q?UsSHpX30Qgt1hSxMPZiNqrE4r3ATRieomr5ibTyqHP4SyPiuydWGkBgHdY?=
 =?iso-8859-1?Q?V3fBuMd+qEnw8ezQr+1BCHY2GmawS4YXQSUSU1UMYhNwcx9vwluMeGFxhB?=
 =?iso-8859-1?Q?y+x4V3c9QZEnphUcUgf6R98V3Cug55+fj/NMLw59KvJ4YGWgDctrPf323t?=
 =?iso-8859-1?Q?zrSBi++Gut6wNPnzBD7wcUAhc5Xt0VtSNWPosvcRLvKsF7samqx2YOOZHn?=
 =?iso-8859-1?Q?lKo0KYIdL5OLmmH0KOpltlzFxl2G9iTT2PcYV6e86hDHudg+rcwQBBiAAr?=
 =?iso-8859-1?Q?baoh2hSvog=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR18MB3193.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dca3b9df-6a12-4e82-a124-08da22cc0637
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 12:48:09.8859
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /mofZv0qsdBwwC7oTmcvbXNW9rdKbi1wz88A0901vS+KV0l19zmBbR6/HZUYJ0Y7jlqG9zkRTrTRlzcLCvcHRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3202
X-Proofpoint-GUID: IzSFc1nd7knrHx4kjMwmV7Sr5HweBjAR
X-Proofpoint-ORIG-GUID: IzSFc1nd7knrHx4kjMwmV7Sr5HweBjAR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-20_03,2022-04-20_01,2022-02-23_01

Hi,=0A=
=0A=
I have the following setup and try to test the Function Level Reset feature=
.  Any suggestions or pointers will be very much helpful.=0A=
=0A=
DOM0=0A=
Distribution: Ubuntu-20.04.3 (kernel 5.8.0-43)=0A=
Xen version : 4.11.4-pre=0A=
=0A=
DOMU=0A=
Distribution: Ubuntu-18.04.6 LTS (kernel 5.8.0)=0A=
PCIe device with SRIOV support, VF (Virtual Function) interface connected t=
o DOMU via PCI pass-through=0A=
=0A=
Issue on DOMU: =0A=
1. Enable MSIX on DOMU (We have used the following kernel APIs pci_enable_m=
six_range, pci_alloc_irq_vectors)=0A=
2. Execute FLR (Function Level Reset) via sysfs interface on the PCIe passt=
hrough device in DOMU=0A=
   # echo "1" > /sys/bus/pci/devices/<ID>/reset=0A=
=0A=
The following crash observed =0A=
=0A=
[ 4126.391455] BUG: unable to handle page fault for address: ffffc900400290=
00=0A=
[ 4126.391489] #PF: supervisor write access in kernel mode=0A=
[ 4126.391503] #PF: error_code(0x0003) - permissions violation=0A=
[ 4126.391516] PGD 94980067 P4D 94980067 PUD 16a155067 PMD 16a156067 PTE 80=
100000a000c075=0A=
[ 4126.391537] Oops: 0003 [#1] SMP NOPTI=0A=
[ 4126.391550] CPU: 0 PID: 971 Comm: bash Tainted: G           OE     5.8.0=
 #1=0A=
[ 4126.391570] RIP: e030:__pci_write_msi_msg+0x59/0x150=0A=
[ 4126.391580] Code: 8b 50 d8 85 d2 75 31 83 78 fc 03 74 2b f6 47 54 01 74 =
6e f6 47 55 02 75 1f 0f b7 47 56 c1 e0 04 48 98 48 03 47 60 74 10 8b 16 <89=
> 10 8b 56 04 89 50 04 8b 56 08 89 50 08 48 8b 03 49 89 44 24 20=0A=
[ 4126.391606] RSP: e02b:ffffc90040407cc0 EFLAGS: 00010286=0A=
[ 4126.391623] RAX: ffffc90040029000 RBX: ffff888164cfb120 RCX: 00000000000=
00000=0A=
[ 4126.391639] RDX: 0000000000000000 RSI: ffff888164cfb120 RDI: ffff888164c=
fb100=0A=
[ 4126.391653] RBP: ffffc90040407cf8 R08: 000053f2d6975617 R09: ffff888169c=
4e238=0A=
[ 4126.391672] R10: 0000000000000000 R11: ffffffff8266b248 R12: ffff888164c=
fb100=0A=
[ 4126.391688] R13: ffff88815e81c2e0 R14: ffff88815e81c130 R15: ffff8881648=
394a0=0A=
[ 4126.391723] FS:  00007f72b4b9b740(0000) GS:ffff88816ac00000(0000) knlGS:=
0000000000000000=0A=
[ 4126.391742] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
[ 4126.391756] CR2: ffffc90040029000 CR3: 0000000167b10000 CR4: 00000000000=
40660=0A=
[ 4126.391781] Call Trace:=0A=
[ 4126.391799]  default_restore_msi_irq+0x38/0x70=0A=
[ 4126.391818]  default_restore_msi_irqs+0x2f/0x80=0A=
[ 4126.391836]  arch_restore_msi_irqs+0x15/0x20=0A=
[ 4126.391851]  pci_restore_msi_state+0xa1/0x230=0A=
[ 4126.391870]  pci_restore_state.part.0+0x319/0x440=0A=
[ 4126.391888]  pci_dev_restore+0x4a/0x60=0A=
[ 4126.391901]  pci_reset_function+0x4b/0x70=0A=
[ 4126.391915]  reset_store+0x5d/0xa0=0A=
[ 4126.391931]  dev_attr_store+0x17/0x30=0A=
[ 4126.391944]  sysfs_kf_write+0x3e/0x50=0A=
[ 4126.391958]  kernfs_fop_write+0xda/0x1b0=0A=
[ 4126.391973]  vfs_write+0xc9/0x200=0A=
[ 4126.391986]  ksys_write+0x67/0xe0=0A=
[ 4126.392002]  __x64_sys_write+0x1a/0x20=0A=
[ 4126.392018]  do_syscall_64+0x52/0xc0=0A=
[ 4126.392033]  entry_SYSCALL_64_after_hwframe+0x44/0xa9=0A=
[ 4126.392049] RIP: 0033:0x7f72b4277224=0A=
[ 4126.392064] Code: 89 02 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 =
00 00 66 90 48 8d 05 c1 07 2e 00 8b 00 85 c0 75 13 b8 01 00 00 00 0f 05 <48=
> 3d 00 f0 ff ff 77 54 f3 c3 66 90 41 54 55 49 89 d4 53 48 89 f5=0A=
[ 4126.392093] RSP: 002b:00007ffc5236f578 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000001=0A=
[ 4126.392114] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007f72b42=
77224=0A=
[ 4126.392128] RDX: 0000000000000002 RSI: 0000562bde52f440 RDI: 00000000000=
00001=0A=
[ 4126.392140] RBP: 0000562bde52f440 R08: 000000000000000a R09: 00000000000=
00001=0A=
[ 4126.392155] R10: 000000000000000a R11: 0000000000000246 R12: 00007f72b45=
53760=0A=
[ 4126.392171] R13: 0000000000000002 R14: 00007f72b454f2a0 R15: 00007f72b45=
4e760=0A=
[ 4126.392185] Modules linked in: <driver function> intel_rapl_msr intel_ra=
pl_common crct10dif_pclmul crc32_pclmul ghash_clmulni_intel aesni_intel cry=
pto_simd cryptd glue_helper rapl xen_pcifront sch_fq_codel parport_pc ppdev=
 lp parport ip_tables x_tables autofs4=0A=
[ 4126.392228] CR2: ffffc90040029000=0A=
[ 4126.392238] ---[ end trace 23e8ad345e1ef956 ]---=0A=
=0A=
=0A=
Thanks and Regards=0A=
-Naresh Bhat=

