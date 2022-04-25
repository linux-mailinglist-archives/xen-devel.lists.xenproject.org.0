Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A6650DE62
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 13:02:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312764.530122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niwTS-0007jP-Md; Mon, 25 Apr 2022 11:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312764.530122; Mon, 25 Apr 2022 11:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niwTS-0007go-Jb; Mon, 25 Apr 2022 11:01:46 +0000
Received: by outflank-mailman (input) for mailman id 312764;
 Mon, 25 Apr 2022 11:01:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V551=VD=marvell.com=nareshb@srs-se1.protection.inumbo.net>)
 id 1niwTQ-0007gi-H2
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 11:01:45 +0000
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com
 [67.231.156.173]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16837521-c487-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 13:01:42 +0200 (CEST)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 23ONPmwb028740;
 Mon, 25 Apr 2022 04:01:39 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3fmgymd9tp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Apr 2022 04:01:39 -0700
Received: from DM6PR18MB3193.namprd18.prod.outlook.com (2603:10b6:5:1c4::10)
 by CH0PR18MB4211.namprd18.prod.outlook.com (2603:10b6:610:be::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 11:01:37 +0000
Received: from DM6PR18MB3193.namprd18.prod.outlook.com
 ([fe80::854b:68f2:3ff1:e61c]) by DM6PR18MB3193.namprd18.prod.outlook.com
 ([fe80::854b:68f2:3ff1:e61c%6]) with mapi id 15.20.5186.020; Mon, 25 Apr 2022
 11:01:37 +0000
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
X-Inumbo-ID: 16837521-c487-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAf0mLHle1qrOmPX/juPLNzwLeaOYoRjoR1I6l056agEx51IaFW7R3TosSUsFGBQEXwGLyhp/Q30SOOP+tMrN6rzI3hG+hz8dZli4ET+ITD1n2p7UtT0hOmS1tFK8QKR062fmWD1E0qlYUmL7ynYzBoDu8nfiEKhad3QtL8z+kS0pCCdIawmpQBByvpkbygS+uvU6SlbDZukUMTAdNN1tJY6zaqFcfPNjrIfmAOn06wB2h3LR1cPxGDN5VlqnXDxsT5kNJ9kgHWhzWf6AoYF46pZcCLOGzy1hUh2zRr2F/YBISacNyWc1janJvAPrWRJFRyAvkmR4yzSwpASztpskg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMrGmSzcMKOyH3oAW9hQTtRmv7evMx7ZBE6+j+OOV6Q=;
 b=W8qXz2t48tIuoSsU5Pmv8zi2L7xQ+tWSmbXatoyTR7ZUiELW2h9Fone9fn7LvTxGhN35SZnzt43RSVJ+jBuWJuST1MKYXLexYaetpe5FwNYsfAN6iEuk9P/9zjvu8onhd7LUjfr6pHrCeihr812kS8FhXREsFeU091ZeKybcdovOJyOeff/VrDpuNKJL525ScjSUrFcWpDy+jpb2XvsOEj6r9c3/L3q4mKuNBzuURtTFQ6J0EODeeUU5q4L6V4kgl/h68FerfN0KjQtfK57aWGbsqxRMMyJ8WX4sQpWbpcWebTL8fVu4b7AIe7dd/1+ZaF7gVPTi0ibwwLubJT51uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMrGmSzcMKOyH3oAW9hQTtRmv7evMx7ZBE6+j+OOV6Q=;
 b=ViEGlBxiyELzBIxogQxHtOAgA5dzvhyX1YtxA+9YZNmQau2hWttL3w1Q7KqHlIM5quTFWvgQzbtkY888F5J/HWleZVtBm//sF1TotOxyjv1NPIdymFeTdL/yHZ13JBSAOAkntdqj7ZIwycHlEayF00k/di/FVVUgaB9b65gcDxI=
From: Naresh Bhat <nareshb@marvell.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [EXT] Re: DOMU: Virtual Function FLR in PCI passthrough is
 crashing
Thread-Topic: [EXT] Re: DOMU: Virtual Function FLR in PCI passthrough is
 crashing
Thread-Index: AQHYVLOBoc8zYi1khUW56WNBox6p/Kz4xa6AgAe2FfE=
Date: Mon, 25 Apr 2022 11:01:37 +0000
Message-ID: 
 <DM6PR18MB3193E803521B24BB2BBD331AB9F89@DM6PR18MB3193.namprd18.prod.outlook.com>
References: 
 <DM6PR18MB3193BA01B3A6FE2A4A9EAE5CB9F59@DM6PR18MB3193.namprd18.prod.outlook.com>
 <7d1d06ce-6bbb-b4c6-5b59-32ac37e41c4a@suse.com>
In-Reply-To: <7d1d06ce-6bbb-b4c6-5b59-32ac37e41c4a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 9f1f0a53-5fa2-a218-d889-a5bb3569783d
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d5b27c8-05cf-4ed5-5941-08da26aaf84f
x-ms-traffictypediagnostic: CH0PR18MB4211:EE_
x-microsoft-antispam-prvs: 
 <CH0PR18MB4211843DAE06616B6925F13CB9F89@CH0PR18MB4211.namprd18.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lr81oV78svLpt8/sI7b2ZLR2BLNRaSSw2zWaWJRWE4uj1EByVokKU7Mp8a0cCLZoU0a6sqt+1qopk4xwFVW8Nln5mSpGe2O+JFgstWThXjkb4wYlY9oxnOEfEZmDqGRrEoK2XQvQoGf7Ou99NWZk+HR54SAVVP+BUfJ7NTEIHHMRv8nViog+Tzk353au0eg1beOH8+OZc0sslj7xDDy2uvwwW4TkIyus07ebEbY09ipNabhwbG0k9s/hdDUaNeYtD8sSm/998kgKVIC13CG3eZZ4j7nH+uAEeQqwLiWLxL2IkCPTgmaWnTwYcF3UYXqEPzHJJufGlJAHhhg/gA16ySeM7n6Aypkq+l0+VvDBjwLfIjq07pOPtodxbuNZ9vK5A19HPm93o7zqXbHy6oJTUMkCsfnpPJIkX4KTJijUJzYRgTbXL+POOUfw6qNKH+MLgtIlWcZzCcDamMqe/dQyPrBMxaKXI2SfBqNWAHe8Gj3uU660a0hzufS6kVTXy95t+iYHXdIwICc9i6EyZKW9lBt4yAStbD7eLshNimcA2wqTZH+I7aJEcWZuGN+Zc3q1hOKSqw6L14k9SvEW7SEeowYEwBQC7h7VdWD57q+Vt4mrE+J7Xyk70i5h4RPcg2f3FDyhNxMSUzVwt3MlVrlcDR9/ZpvlXHXerZaWNezGLeaFxUWRtMklYmIue4p+ndEgZg8kt23mfvLv1SBnbXnJVQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR18MB3193.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(86362001)(508600001)(66556008)(8676002)(26005)(66476007)(64756008)(33656002)(66446008)(4326008)(316002)(38100700002)(9686003)(55016003)(71200400001)(6916009)(91956017)(76116006)(66946007)(122000001)(53546011)(5660300002)(7696005)(6506007)(52536014)(8936002)(83380400001)(186003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?t0zyuROJbXrspJ9wBBBgCYBsawRg8UuFJZXNssVpEM57dhRIoiiC/oABkO?=
 =?iso-8859-1?Q?MF7V5DHbx7Nl4qseHcuFEqKLxt20VyqH8fAnPldqXjByNVYS2Ov8YvHcnY?=
 =?iso-8859-1?Q?gZmJxGRG1fCSM4TesER17xnlevqlm+4rcJjkXtVf7lXKYvn/J3K6KaRNFN?=
 =?iso-8859-1?Q?8CxNC1PQOHNaoBbeAtoULUK2XFHYeWwyt816vwJXbuqiO4GnBWAHv5UvNq?=
 =?iso-8859-1?Q?EZ1bVYL+x+vht/1TuQwSCqh4nQepft+lgkASlfx8M7rjDQNkNt9z+JT3l9?=
 =?iso-8859-1?Q?sIvFp+YHSnnBqcQJgxuR9rcNJi6DdyBbcFJEVhTspGpADvYRBgd18u+uOf?=
 =?iso-8859-1?Q?E/ZkYffMJijpwE1CHe/6bV89+AfsZ6/pJEqhBr80pzwsELpyqwdgakaWOr?=
 =?iso-8859-1?Q?N3DvWFhmFLc3RA05P3sPeZNIfxgR980ohVTdPKHSHnY84a2LymKNm5ckP1?=
 =?iso-8859-1?Q?ZNQguACU+VSRswRIgOmxUCutzkCSDaFQm623UjQX8VZ3O4rE+/Exd8E3UK?=
 =?iso-8859-1?Q?mptcjT1gGK0GnbNfJgMdzm8W1Nj5Cm0GrfwPyjLgs8CsP5fusxJmJXQ6wR?=
 =?iso-8859-1?Q?+KI1j1zSlaD804dour7mOZHiSd+FcmpuSyiVv/IwuZIPClurzpnPzL/bN7?=
 =?iso-8859-1?Q?sJ+ETsZQS70xpSNdB6jfyDyu4JK8i5V7qx5P8+LOb7AJ3Ukx7UmOmu7SuH?=
 =?iso-8859-1?Q?AWrc9zbviOedYRzmQUS8DKfMPTy5XF13Bo6a0YKnfXsy9q+lFeRqA8fWXD?=
 =?iso-8859-1?Q?Tbubw0qsOiEXatpJ6fl1GGw0ddYIhhIWsIqnqZn6OUVL/clm0eCROt/xDP?=
 =?iso-8859-1?Q?zBKJ3nQuHRPL/5EIjj9slp1nE/g0S9+IjPQGnXnsjo2729TdfRFQgX6Y8r?=
 =?iso-8859-1?Q?mEvBiToaW5+H5OaqMxI7wtINU2NLzSmYqX5kSwB0nBjaZtwYbABAeNwMl1?=
 =?iso-8859-1?Q?qjj7dqopylavDEhUosQ5KZ9QIkx1RC21irbw1ZBETfdCXznTbUc9yLvz8X?=
 =?iso-8859-1?Q?MHtuUvmDWiFQ3obl1iYniNWqBLhrh58IEml9TPBQt45Ckl9LThYm2a7NZd?=
 =?iso-8859-1?Q?Lqnb1X9ZjvVyfnSLcMOdGFjSeAWHWXkgBTTWnEo48V7x18LexMN1MGTXOS?=
 =?iso-8859-1?Q?z7F1k5ah9oZ7okhYge/vXifvRNrFouD6U3D1xZrRpLQVJwzqItPrGLG1pA?=
 =?iso-8859-1?Q?ItLhLB68zss5h3CQ9mVX3ZHO6RgxBVUhQswEdkv2lxLxPpk43YSFu2Uylh?=
 =?iso-8859-1?Q?4YsxUs7rhrhgTKwVQDmLkTCbkb79Jp+/RBCsmP/6YhL4FYPO2gt35LrdfT?=
 =?iso-8859-1?Q?/XSfoxmXuNwpIE3eYBPMTq75hnn06KgrE8ZEd7XidIuN5uZdEWCt/BkgB9?=
 =?iso-8859-1?Q?WBmgYNEqS+yAoXRjO0xjfc9/zoFsFb3ibpItKKxWLQITDZNAwFM9yJ40Pq?=
 =?iso-8859-1?Q?IVVpqVruX21WP55hZ2IGQD+c+QYdyrjNblXusU3V5vlHHgjTgi+rQQ5HdW?=
 =?iso-8859-1?Q?Zngy5GbAlAVqrDjJq8mjemiLPXqJHGb/07K/MB/2EFFAbrAGZtrlLECIIV?=
 =?iso-8859-1?Q?1I8m3HqblDrUgIVsqXA1cnQLUlf2w71hA8juEOSqXwS+7J7ecvhGPeEFBD?=
 =?iso-8859-1?Q?pTbiwKWWvF8cDc2ln7z7kTzOpcHWykt3gLFQgtXeHJ8eFJcYqliE9VLR8u?=
 =?iso-8859-1?Q?O46/gUoAuK2HatAV/CHA4avI3MRZC678nepFNYfnMzBkhzPeQi1b9iguG0?=
 =?iso-8859-1?Q?v7fsN2zhdfVeeZvZO+B20gop/wfljeI8w1lzEKOvxMcomB?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR18MB3193.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d5b27c8-05cf-4ed5-5941-08da26aaf84f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 11:01:37.8123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p56d/JH9emLqK6PbwILeNeJD2jWpXApbFP5cbzYKjoFzFJ5KHJgGdzkUrbsLad2CJ9ltfvmIchCm2XaDn9jOmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR18MB4211
X-Proofpoint-GUID: R7TDdGAU7cpvdIIsOIBA-jSBEL5xCGg-
X-Proofpoint-ORIG-GUID: R7TDdGAU7cpvdIIsOIBA-jSBEL5xCGg-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-25_07,2022-04-25_01,2022-02-23_01

Hi Jan Beulich, =0A=
=0A=
Thank you very much. Please see my inline comments below.=0A=
=0A=
From: Jan Beulich <jbeulich@suse.com>=0A=
Sent: 20 April 2022 18:37=0A=
To: Naresh Bhat <nareshb@marvell.com>=0A=
Cc: julien@xen.org <julien@xen.org>; sstabellini@kernel.org <sstabellini@ke=
rnel.org>; xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=
=0A=
Subject: [EXT] Re: DOMU: Virtual Function FLR in PCI passthrough is crashin=
g =0A=
=A0=0A=
External Email=0A=
=0A=
----------------------------------------------------------------------=0A=
On 20.04.2022 14:48, Naresh Bhat wrote:=0A=
> I have the following setup and try to test the Function Level Reset featu=
re.=A0 Any suggestions or pointers will be very much helpful.=0A=
> =0A=
> DOM0=0A=
> Distribution: Ubuntu-20.04.3 (kernel 5.8.0-43)=0A=
> Xen version : 4.11.4-pre=0A=
> =0A=
> DOMU=0A=
> Distribution: Ubuntu-18.04.6 LTS (kernel 5.8.0)=0A=
> PCIe device with SRIOV support, VF (Virtual Function) interface connected=
 to DOMU via PCI pass-through=0A=
> =0A=
> Issue on DOMU: =0A=
> 1. Enable MSIX on DOMU (We have used the following kernel APIs pci_enable=
_msix_range, pci_alloc_irq_vectors)=0A=
> 2. Execute FLR (Function Level Reset) via sysfs interface on the PCIe pas=
sthrough device in DOMU=0A=
>=A0=A0=A0 # echo "1" > /sys/bus/pci/devices/<ID>/reset=0A=
> =0A=
> The following crash observed =0A=
> =0A=
> [ 4126.391455] BUG: unable to handle page fault for address: ffffc9004002=
9000=0A=
> [ 4126.391489] #PF: supervisor write access in kernel mode=0A=
> [ 4126.391503] #PF: error_code(0x0003) - permissions violation=0A=
> [ 4126.391516] PGD 94980067 P4D 94980067 PUD 16a155067 PMD 16a156067 PTE =
80100000a000c075=0A=
> [ 4126.391537] Oops: 0003 [#1] SMP NOPTI=0A=
> [ 4126.391550] CPU: 0 PID: 971 Comm: bash Tainted: G=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 OE=A0=A0=A0=A0 5.8.0 #1=0A=
> [ 4126.391570] RIP: e030:__pci_write_msi_msg+0x59/0x150=0A=
> [ 4126.391580] Code: 8b 50 d8 85 d2 75 31 83 78 fc 03 74 2b f6 47 54 01 7=
4 6e f6 47 55 02 75 1f 0f b7 47 56 c1 e0 04 48 98 48 03 47 60 74 10 8b 16 <=
89> 10 8b 56 04 89 50 04 8b 56 08 89 50 08 48 8b 03 49 89 44 24 20=0A=
> [ 4126.391606] RSP: e02b:ffffc90040407cc0 EFLAGS: 00010286=0A=
=0A=
The RSP related selector value suggests you're talking about a PV DomU.=0A=
Such a DomU cannot write the MSI-X table directly, yet at a guess (from=0A=
the PTE displayed) that's what the insn does where the crash occurred. I=0A=
would guess you've hit yet another place in the kernel where proper PV=0A=
abstraction is missing. You may want to check with newer kernels.=0A=
=0A=
[Naresh]: We have tested with latest kernel i.e. 5.17.0 kernel, issue persi=
sts.=0A=
=0A=
As to FLR - I guess this operation as a whole needs passing through=0A=
pcifront to pciback, such that the operation can be carried out safely=0A=
(e.g. to save and restore active MSIs, which is what I infer is being=0A=
attempted here, as per the stack trace).=0A=
=0A=
[Naresh]: Any idea when the support will be added to Xen ?=0A=
=0A=
Jan=0A=

