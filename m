Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471D8445FC0
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 07:36:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222060.384097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mispm-0005rR-Sl; Fri, 05 Nov 2021 06:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222060.384097; Fri, 05 Nov 2021 06:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mispm-0005ol-Pm; Fri, 05 Nov 2021 06:36:18 +0000
Received: by outflank-mailman (input) for mailman id 222060;
 Fri, 05 Nov 2021 06:36:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=znic=PY=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mispl-0005oe-BG
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 06:36:17 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe07::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac3c17c7-3e02-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 07:36:14 +0100 (CET)
Received: from AM6PR04CA0013.eurprd04.prod.outlook.com (2603:10a6:20b:92::26)
 by AS8PR08MB7111.eurprd08.prod.outlook.com (2603:10a6:20b:402::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Fri, 5 Nov
 2021 06:36:08 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::85) by AM6PR04CA0013.outlook.office365.com
 (2603:10a6:20b:92::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Fri, 5 Nov 2021 06:36:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Fri, 5 Nov 2021 06:36:07 +0000
Received: ("Tessian outbound c71e1a752bff:v108");
 Fri, 05 Nov 2021 06:36:07 +0000
Received: from 5d75a7617347.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9BBD1E68-D202-4DE7-8B53-B2A1D3848001.1; 
 Fri, 05 Nov 2021 06:36:01 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5d75a7617347.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 Nov 2021 06:36:01 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by DB9PR08MB7147.eurprd08.prod.outlook.com (2603:10a6:10:2cb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 06:35:59 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f4fd:a3a4:6768:1165]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f4fd:a3a4:6768:1165%3]) with mapi id 15.20.4669.011; Fri, 5 Nov 2021
 06:35:59 +0000
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
X-Inumbo-ID: ac3c17c7-3e02-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRCrcWdwvwVrrN9UGNWdcsejMI2CfEHwFHDg5GmoJyQ=;
 b=sZdXErw0BM+cAOXRP8c4tN4ydEcyKvwsAy+bowQq22Wq+ab899+UWDvOmP/3tO1l2qjuZyrqwKk3Spr9bCZwxMlWUk9UxyCxCoNMWEKzhu5qwxDhL3BYRRtk2YjfCW6cPe1m7rQBIY1tjbUzxPCXx/LjsGLw03chlMu6fdF8m44=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGjavCM4iQ7ntj6XH9YH6+OI+UWuW99fMi6gzBILL5+hyVd8JhzF+fnB0s1r/RkrqkFbnDCz1sj5tQ45cbFk/cs0hoEGXYs9DHJ/ls9iZ6vmza0lKoI8+ZVik5d61k2aHLAAwN0bw0Gc+16phqJissqrQX7cO8GV439heWUuP6PW/giV1+mszMgEzuuCq65E5Hgf/aG4H3VOtPNLDW4ifisONIV8c5li3LxtOXWNv8LselQTXGA2kKbmzA47RJ/UEKhcOFEXAf4y8Qzf4cTdZrw/q57vLYGNqq+RB5D788BVLWimOtvFes1MP75Yo8u9OUh+cokaSnq+9bqpco99sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRCrcWdwvwVrrN9UGNWdcsejMI2CfEHwFHDg5GmoJyQ=;
 b=R5CSGSGQI4ByJz7xxE4SjWTpMOry02Bbo4GDWG/ZpnXVeGDpv6etGf3HQiD7DGJIlMOjsuXatrEhXa+nNyDjpaYrQ9Qerr79/Kp5knWLfzAiBOC8BVbvM3X/av1EGMmLSVXlEGishL2i+qHIB5YBWwuWkycu1JTxpW4dU/ei5IaM6wrqeN8kk8L8vX+IEPgxk6ppikLa4RZKkRgk4aRj5zTEJOJ7UjpkJs9YimZx6C6jl/otWrVq3Qi9wG+V+Y9YCcx8btHpltLEU+PV9mtxkXtWtNtL3g+vzAykeADstzDH5CR4mnNVRxUyKbDEt4YZhAdjcipWQqasJS3YpIP4sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRCrcWdwvwVrrN9UGNWdcsejMI2CfEHwFHDg5GmoJyQ=;
 b=sZdXErw0BM+cAOXRP8c4tN4ydEcyKvwsAy+bowQq22Wq+ab899+UWDvOmP/3tO1l2qjuZyrqwKk3Spr9bCZwxMlWUk9UxyCxCoNMWEKzhu5qwxDhL3BYRRtk2YjfCW6cPe1m7rQBIY1tjbUzxPCXx/LjsGLw03chlMu6fdF8m44=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>
Subject: RE: static-mem preventing dom0 from booting
Thread-Topic: static-mem preventing dom0 from booting
Thread-Index: AQHX0eWC7qpRq+VAt0Cu1/k92WugAqv0ODjwgABBVXA=
Date: Fri, 5 Nov 2021 06:35:59 +0000
Message-ID:
 <DU2PR08MB7325A7A5658B1EB7C6EB4DECF78E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References:
 <alpine.DEB.2.22.394.2111041829300.284830@ubuntu-linux-20-04-desktop>
 <DU2PR08MB73256624607E7624CAAD38E5F78E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
In-Reply-To:
 <DU2PR08MB73256624607E7624CAAD38E5F78E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 659194B75B60CA459F57A23FEE854BB7.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 0d19d39f-cfe5-4d7c-694d-08d9a0268cad
x-ms-traffictypediagnostic: DB9PR08MB7147:|AS8PR08MB7111:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB711113E996F78833A5C44932F78E9@AS8PR08MB7111.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:383;OLM:383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DvKH18AwwuWs5nT/RbQ0uGirsOUvmGY/cY011NvwYgiSTPLslDC3DGGVf3BnL2NsjnRbRR1eIOiv5ovHfXIV68bkJ+POnGjOsTEs5aNQahjlIehf+eGY6/q3jrlwsuwdMGvbnKmDsdyLYJeHc0pLnx2FItiSlEi+/iDNdHKkK+AGdlHpHR7fpXeop+Zg2CL7TysL8i0UAKtmXauS10E3y3wfEUyfDsw9qjbVYdFkWBZo8gl79G92JMMZqbj/i1pDOlQYf6DVqsxSfq0nrHR8FrrBdwsV/nmWz7NZkdcXlvhSI4CUY5FcrZDIyLHaNYrYGwQj8lo9jsP40dtup7St+L2FzRUq+bZ+G3v+l92mPiBgBCFmuT+NjsopVjtJ8JRpqT9km12GkK1M9unNKOdeF7PxBhwQSGYQpfRah+Iq4Bpn+E7awbSSpRd7gIwYAy0oa8XgD0Fu82HWr8zQFNgYIESAeSiFOH5gvQZw8gbFhI6ffRvcOYxTh6pG8ea0M75R8vYy9KAF9uWFTNoYlHBJZ0Mmu4ewz87LlwvgBX3WU37gn6ZmkOSYKIgegwUi5/Zx2JebiBHqL8qSHWFEkP16noLFrfRcsBNr1FNFNKFMEJ/VfRwRMX+JJNbWupCv6jKbCSFysoYQ6iXQEMMZ4dyarNxzZaC/OTse0n0xSEHRJ5qvCJlUKnQfemcUHy1SYge7EvSY7u+fHPWhDHOe3VKOnfFqhGQ+zBgR2eQs9yVXYtU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(71200400001)(122000001)(7696005)(86362001)(4326008)(83380400001)(66476007)(53546011)(30864003)(66556008)(5660300002)(2906002)(508600001)(76116006)(66446008)(8676002)(66946007)(316002)(38070700005)(26005)(52536014)(54906003)(9686003)(6916009)(55016002)(8936002)(186003)(64756008)(33656002)(2940100002)(38100700002)(139555002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7147
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f0b4750d-7d29-4905-eb81-08d9a02687c8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sDJKQupH1N6YjPFTVDsldcmVdpyqB5OU8k7jrizV/Qu9WWaVj27lJgFdpLIUk61bW1bdXnmQGuxJDXiee54HOlnq8hcHXIMauhXNBjaInp6aFzdzzajMBMLz158zhDG6lUDsYHASLVkWpuJr9PLmNILPPhMCg2pLWJCXju/wSuUei60amox637mEdvSbR2RNwdsWw35ckR8GyUx/mOJ0muFLfIbwW2EzUKzyu6NgNmhHKgoQDlLb7YzWkAMqL8XNvt35vcdtLtMB+SEIiJr42Hol/uhirpP00V/jMZjolwLRJqssSeGU02VSSin3iZyw6a+g7d6EtRq3MP0wW6RxHLpJBlDJ44dp2JkgexEygPDH3UpVBDGycOxZaR8bk4ufaBAp1MPITM1lf2YLsCF6OqvGdflDvRX53eZE/DvWIXWnxYOjpfOZL9Rb5q8oPBoEKzreJ3tLaDLlyLw82vgZ/6HU8GWeG38cSafinqjbMdcVhVH65Cg1IcTAEkdWQfvgWakwOMQRGoEwrFRXZ0T+X1yMuFV2wZhgwkAfVX93qjTILQM+RjzC8SOogWEtkc5j/nDEiYq/39V4M1xlYALLMRzEZHOCRr9lsvMJZOqhtJuv14bxPwAVHr2Zrz7nYPlOOhVkPu1sOBfHnQPAaweoMmoWKpcxvDiEbLqhrUfxgvY1XhcbS53ACf01wMFFtZ8Bm1EkmkL+bwRZeVN3/2pWcAS7QekYq/sHNdcAffhKIkQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(82310400003)(55016002)(54906003)(33656002)(2940100002)(4326008)(316002)(30864003)(8676002)(9686003)(508600001)(70586007)(52536014)(70206006)(86362001)(186003)(7696005)(83380400001)(36860700001)(2906002)(47076005)(6506007)(81166007)(8936002)(356005)(26005)(53546011)(5660300002)(336012)(6862004)(139555002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 06:36:07.7562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d19d39f-cfe5-4d7c-694d-08d9a0268cad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7111

Hi stefano

> -----Original Message-----
> From: Penny Zheng
> Sent: Friday, November 5, 2021 11:23 AM
> To: Stefano Stabellini <sstabellini@kernel.org>
> Cc: xen-devel@lists.xenproject.org; Wei Chen <Wei.Chen@arm.com>
> Subject: RE: static-mem preventing dom0 from booting
>=20
> Hi Stefano
>=20
> > -----Original Message-----
> > From: Stefano Stabellini <sstabellini@kernel.org>
> > Sent: Friday, November 5, 2021 9:36 AM
> > To: Penny Zheng <Penny.Zheng@arm.com>
> > Cc: sstabellini@kernel.org; xen-devel@lists.xenproject.org
> > Subject: static-mem preventing dom0 from booting
> >
> > Hi Penny,
> >
> > I am trying to test the static-mem feature in Xen 4.16 but I am having
> > some issues. I can boot a dom0less domU with static-mem configured
> > correctly, but when I do so, dom0 doesn't boot any longer.
> >
>=20
> Hmm, In our first intention, dom0less is a mandatory option for static
> allocation.
> domU on static allocation shall boot when dom0 doesn't boot there.
>=20
> We think that, nevertheless, dom0 memory range is allocated by Xen
> automatically, and it leads to the unpredictability. Static allocation th=
rough
> device tree configuration prefers the total static environment to avoid
> unpredictability.
>=20
> > In the same configuration, if I remove the static-mem related lines
> > from the domU node on device tree, both dom0 and domU boot successfully=
.
> >
> > I am sure the dom0 memory range, allocated by Xen automatically, and
> > the domU memory range, hand-picked by me, do not clash as you can see
> > from the boot logs (appended).
> >
> > Am I missing anything in the configuration? I am using a ZCU102 board,
> > the memory node on the host device tree is:
> >
>=20
> Are you suggesting one scenario where dom0 with static-mem domU?
>=20
> Hmmm, one quick thought, it may not be working with vpl011 emulation.
> When dom0 exists, vpl011 will take dom0 as backend, which requests event
> channel, xen store, etc, involved to communicate. but static-mem domU
> without CONFIG_XEN shall not handle it.
>=20

Digging on this, and my misunderstanding. Domain created through device tre=
e
shall use xen as backend, not dom0. I guess that only the one created by xl=
 is using
dom0 as backend.

Nevertheless, if this is your scenario, where dom0 and static-mem domU(NO C=
ONFIG_XEN) co-exists,
I'll test for you.

> > 	memory {
> > 		device_type =3D "memory";
> > 		reg =3D <0x00 0x00 0x00 0x7ff00000 0x08 0x00 0x00 0x80000000>;
> > 	};
> >
> > I am attaching my u-boot boot.scr script with the device tree
> > modification to add static memory.
> >
> > Many thanks for your help!
> >
> > Cheers,
> >
> > Stefano
> >
> >
> > (XEN) Xen version 4.16-rc (sstabellini@) (gcc (Ubuntu
> > 9.3.0-17ubuntu1~20.04)
> > 9.3.0) debug=3Dy Thu Nov  4 18:28:30 PDT 2021
> > (XEN) Latest ChangeSet: Mon Nov 1 12:36:26 2021 +0000
> > git:9f8434d778-dirty
> > (XEN) Processor: 00000000410fd034: "ARM Limited", variant: 0x0, part
> > 0xd03,rev 0x4
> > (XEN) 64-bit Execution:
> > (XEN)   Processor Features: 1100000000002222 0000000000000000
> > (XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
> > (XEN)     Extensions: FloatingPoint AdvancedSIMD
> > (XEN)   Debug Features: 0000000010305106 0000000000000000
> > (XEN)   Auxiliary Features: 0000000000000000 0000000000000000
> > (XEN)   Memory Model Features: 0000000000001122 0000000000000000
> > (XEN)   ISA Features:  0000000000011120 0000000000000000
> > (XEN) 32-bit Execution:
> > (XEN)   Processor Features: 0000000000001231:0000000000011011
> > (XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 ThumbEE Jazelle
> > (XEN)     Extensions: GenericTimer Security
> > (XEN)   Debug Features: 0000000003010066
> > (XEN)   Auxiliary Features: 0000000000000000
> > (XEN)   Memory Model Features: 0000000010101105 0000000040000000
> > (XEN)                          0000000001260000 0000000002102211
> > (XEN)   ISA Features: 0000000002101110 0000000013112111
> > 0000000021232042
> > (XEN)                 0000000001112131 0000000000011142 000000000001112=
1
> > (XEN) Generic Timer IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 65000 KHz
> > (XEN) GICv2 initialization:
> > (XEN)         gic_dist_addr=3D00000000f9010000
> > (XEN)         gic_cpu_addr=3D00000000f9020000
> > (XEN)         gic_hyp_addr=3D00000000f9040000
> > (XEN)         gic_vcpu_addr=3D00000000f9060000
> > (XEN)         gic_maintenance_irq=3D25
> > (XEN) GICv2: Adjusting CPU interface base to 0xf902f000
> > (XEN) GICv2: 192 lines, 4 cpus, secure (IID 00000000).
> > (XEN) XSM Framework v1.0.1 initialized
> > (XEN) Initialising XSM SILO mode
> > (XEN) Using scheduler: null Scheduler (null)
> > (XEN) Initializing null scheduler
> > (XEN) WARNING: This is experimental software in development.
> > (XEN) Use at your own risk.
> > (XEN) Allocated console ring of 16 KiB.
> > (XEN) Bringing up CPU1
> > (XEN) Bringing up CPU2
> > (XEN) Bringing up CPU3
> > (XEN) Brought up 4 CPUs
> > (XEN) I/O virtualisation enabled
> > (XEN)  - Dom0 mode: Relaxed
> > (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
> > (XEN) P2M: 3 levels with order-1 root, VTCR 0x0000000080023558
> > (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
> > (XEN) *** LOADING DOMAIN 0 ***
> > (XEN) Loading d0 kernel from boot module @ 0000000000e00000
> > (XEN) Loading ramdisk from boot module @ 0000000002200000
> > (XEN) Allocating 1:1 mappings totalling 1024MB for dom0:
> > (XEN) BANK[0] 0x00000020000000-0x00000060000000 (1024MB)
> > (XEN) Grant table range: 0x00000005600000-0x00000005640000
> > (XEN) Allocating PPI 16 for event channel interrupt
> > (XEN) Extended region 0: 0x80000000->0xc0000000
> > (XEN) Extended region 1: 0xc8000000->0xe0000000
> > (XEN) Extended region 2: 0xf0000000->0xf9000000
> > (XEN) Extended region 3: 0xffc00000->0x600000000
> > (XEN) Extended region 4: 0x880000000->0x8000000000
> > (XEN) Extended region 5: 0x8001000000->0x10000000000
> > (XEN) Loading zImage from 0000000000e00000 to 0000000020000000-
> > 0000000021367a00
> > (XEN) Loading d0 initrd from 0000000002200000 to 0x0000000028200000-
> > 0x0000000029d60ac0
> > (XEN) Loading d0 DTB to 0x0000000028000000-0x00000000280096d4
> > (XEN) *** LOADING DOMU cpus=3D1 memory=3D80000KB ***
> > (XEN) Loading d1 kernel from boot module @ 0000000003e00000
> > (XEN) Loading ramdisk from boot module @ 0000000005200000
> > (XEN) Loading zImage from 0000000003e00000 to 0000000040000000-
> > 0000000041367a00
> > (XEN) Loading d1 initrd from 0000000005200000 to 0x0000000048200000-
> > 0x0000000048383400
> > (XEN) Loading d1 DTB to 0x0000000048000000-0x00000000480007f3
> > (XEN) Initial low memory virq threshold set at 0x4000 pages.
> > (XEN) Std. Loglevel: Errors and warnings
> > (XEN) Guest Loglevel: All
> > (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch
> > input)
> > (XEN) DEBUG start_xen 1054 id=3D0
> > (XEN) null.c:353: 0 <-- d0v0
> > (XEN) DEBUG start_xen 1054 id=3D1
> > (XEN) null.c:353: 1 <-- d1v0
> > (XEN) Freed 348kB init memory.
> > (XEN) traps.c:2013:d0v0 HSR=3D0x00000092000045 pc=3D0xffffffc0105300ec
> > gva=3D0xfffffffdfda3b000 gpa=3D0x0000081ffff000
> > (XEN) d1v0 Unhandled SMC/HVC: 0x84000050
> > (XEN) d1v0 Unhandled SMC/HVC: 0x8600ff01
> > (XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4
> > (XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8
> > (XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to
> > ICACTIVER12
> > (XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to
> > ICACTIVER16
> > (XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to
> > ICACTIVER20
> > (XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
> > (XEN) DOM1: [    0.000000] Booting Linux on physical CPU 0x0000000000
> > [0x410fd034]
> > (XEN) DOM1: [    0.000000] Linux version 5.14.0-00002-g9c4bc20097e8
> > (sstabellini@ubuntu-linux-20-04-desktop) (gcc (Ubuntu 9.3.0-17ubuntu1~
> > (XEN) DOM1: 20.04) 9.3.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #9
> > SMP Wed Nov 3 16:50:00 PDT 2021
> > (XEN) DOM1: [    0.000000] efi: UEFI not found.
> > (XEN) DOM1: [    0.000000] Zone ranges:
> > (XEN) DOM1: [    0.000000]   DMA32    [mem 0x0000000040000000-
> > 0x000000005fffffff]
> > (XEN) DOM1: [    0.000000]   Normal   empty
> > (XEN) DOM1: [    0.000000] Movable zone start for each node
> > (XEN) DOM1: [    0.000000] Early memory node ranges
> > (XEN) DOM1: [    0.000000]   node   0: [mem 0x0000000040000000-
> > 0x000000005fffffff]
> > (XEN) DOM1: [    0.000000] Initmem setup node 0 [mem
> 0x0000000040000000-
> > 0x000000005fffffff]
> > (XEN) DOM1: [    0.000000] cma: Reserved 256 MiB at 0x000000004f400000
> > (XEN) DOM1: [    0.000000] psci: probing for conduit method from DT.
> > (XEN) DOM1: [    0.000000] psci: PSCIv1.1 detected in firmware.
> > (XEN) DOM1: [    0.000000] psci: Using standard PSCI v0.2 function IDs
> > (XEN) DOM1: [    0.000000] psci: Trusted OS migration not required
> > (XEN) DOM1: [    0.000000] psci: SMC Calling Convention v1.1
> > (XEN) DOM1: [    0.000000] percpu: Embedded 22 pages/cpu s51672 r8192
> > d30248 u90112
> > (XEN) DOM1: [    0.000000] Detected VIPT I-cache on CPU0
> > (XEN) DOM1: [    0.000000] CPU features: detected: ARM erratum 843419
> > (XEN) DOM1: [    0.000000] CPU features: detected: ARM erratum 845719
> > (XEN) DOM1: [    0.000000] Built 1 zonelists, mobility grouping on.  To=
tal
> pages:
> > 129280
> > (XEN) DOM1: [    0.000000] Kernel command line: console=3DttyAMA0
> > (XEN) DOM1: [    0.000000] Dentry cache hash table entries: 65536 (orde=
r: 7,
> > 524288 bytes, linear)
> > (XEN) DOM1: [    0.000000] Inode-cache hash table entries: 32768 (order=
: 6,
> > 262144 bytes, linear)
> > (XEN) DOM1: [    0.000000] mem auto-init: stack:off, heap alloc:off, he=
ap
> > free:off
> > (XEN) DOM1: [    0.000000] Memory: 230280K/524288K available (13184K
> > kernel code, 862K rwdata, 3636K rodata, 2048K init, 315K bss, 31864K
> > (XEN) DOM1: reserved, 262144K cma-reserved)
> > (XEN) DOM1: [    0.000000] rcu: Hierarchical RCU implementation.
> > (XEN) DOM1: [    0.000000] rcu:         RCU event tracing is enabled.
> > (XEN) DOM1: [    0.000000] rcu:         RCU restricting CPUs from NR_CP=
US=3D4 to
> > nr_cpu_ids=3D1.
> > (XEN) DOM1: [    0.000000] rcu: RCU calculated value of scheduler-enlis=
tment
> > delay is 25 jiffies.
> > (XEN) DOM1: [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=
=3D16,
> > nr_cpu_ids=3D1
> > (XEN) DOM1: [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs:=
 0
> > (XEN) DOM1: [    0.000000] Root IRQ handler: gic_handle_irq
> > (XEN) DOM1: [    0.000000] random: get_random_bytes called from
> > start_kernel+0x4a8/0x728 with crng_init=3D0
> > (XEN) DOM1: [    0.000000] arch_timer: cp15 timer(s) running at 65.00MH=
z
> (virt).
> > (XEN) DOM1: [    0.000000] clocksource: arch_sys_counter: mask: 0xfffff=
fffffffff
> > max_cycles: 0xefdb196da, max_idle_ns: 440795204367 ns
> > (XEN) DOM1: [    0.000055] sched_clock: 56 bits at 65MHz, resolution 15=
ns,
> > wraps every 2199023255550ns
> > (XEN) DOM1: [    0.015323] Console: colour dummy device 80x25
> > (XEN) DOM1: [    0.017224] Calibrating delay loop (skipped), value calc=
ulated
> > using timer frequency.. 130.00 BogoMIPS (lpj=3D260000)
> > (XEN) DOM1: [    0.017335] pid_max: default: 32768 minimum: 301
> > (XEN) DOM1: [    0.019932] Mount-cache hash table entries: 1024 (order:=
 1,
> > 8192 bytes, linear)
> > (XEN) DOM1: [    0.020022] Mountpoint-cache hash table entries: 1024 (o=
rder:
> > 1, 8192 bytes, linear)
> > (XEN) DOM1: [    0.070463] rcu: Hierarchical SRCU implementation.
> > (XEN) DOM1: [    0.073611] EFI services will not be available.
> > (XEN) DOM1: [    0.074889] smp: Bringing up secondary CPUs ...
> > (XEN) DOM1: [    0.075178] smp: Brought up 1 node, 1 CPU
> > (XEN) DOM1: [    0.075205] SMP: Total of 1 processors activated.
> > (XEN) DOM1: [    0.075253] CPU features: detected: 32-bit EL0 Support
> > (XEN) DOM1: [    0.075304] CPU features: detected: CRC32 instructions
> > (XEN) DOM1: [    0.076596] CPU: All CPU(s) started at EL1
> > (XEN) DOM1: [    0.076717] alternatives: patching kernel code
> > (XEN) DOM1: [    0.092884] devtmpfs: initialized
> > (XEN) DOM1: [    0.109553] clocksource: jiffies: mask: 0xffffffff max_c=
ycles:
> > 0xffffffff, max_idle_ns: 7645041785100000 ns
> > (XEN) DOM1: [    0.109716] futex hash table entries: 256 (order: 2, 163=
84
> bytes,
> > linear)
> > (XEN) DOM1: [    0.124058] pinctrl core: initialized pinctrl subsystem
> > (XEN) DOM1: [    0.143628] NET: Registered PF_NETLINK/PF_ROUTE protocol
> > family
> > (XEN) DOM1: [    0.157764] DMA: preallocated 128 KiB GFP_KERNEL pool fo=
r
> > atomic allocations
> > (XEN) DOM1: [    0.158089] DMA: preallocated 128 KiB
> > GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> > (XEN) DOM1: [    0.158426] audit: initializing netlink subsys (disabled=
)
> > (XEN) DOM1: [    0.166578] cpuidle: using governor menu
> > (XEN) DOM1: [    0.167213] hw-breakpoint: found 6 breakpoint and 4
> > watchpoint registers.
> > (XEN) DOM1: [    0.168930] audit: type=3D2000 audit(0.140:1): state=3Di=
nitialized
> > audit_enabled=3D0 res=3D1
> > (XEN) DOM1: [    0.169475] ASID allocator initialised with 65536 entrie=
s
> > (XEN) DOM1: [    0.171250] Serial: AMBA PL011 UART driver
> > (XEN) DOM1: [    0.181920] 22000000.sbsa-uart: ttyAMA0 at MMIO
> 0x22000000
> > (irq =3D 13, base_baud =3D 0) is a SBSA
> > (XEN) DOM1: [    0.533061] printk: console [ttyAMA0] enabled
> >
>=20
> Cheers=1B$B!$=1B(B
>=20
> Penny  Zheng
> > [... cutting here, DOM1 boots until the end, no signs of dom0]

