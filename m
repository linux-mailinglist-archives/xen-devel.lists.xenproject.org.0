Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FB5445E92
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 04:24:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221985.383960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mippJ-0006pQ-L4; Fri, 05 Nov 2021 03:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221985.383960; Fri, 05 Nov 2021 03:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mippJ-0006m3-Gr; Fri, 05 Nov 2021 03:23:37 +0000
Received: by outflank-mailman (input) for mailman id 221985;
 Fri, 05 Nov 2021 03:23:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=znic=PY=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mippH-0006lu-Ap
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 03:23:35 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe06::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c028e0a3-3de7-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 04:23:32 +0100 (CET)
Received: from AM5PR0601CA0048.eurprd06.prod.outlook.com
 (2603:10a6:203:68::34) by VI1PR0802MB2494.eurprd08.prod.outlook.com
 (2603:10a6:800:b6::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 5 Nov
 2021 03:23:28 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::2b) by AM5PR0601CA0048.outlook.office365.com
 (2603:10a6:203:68::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Fri, 5 Nov 2021 03:23:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Fri, 5 Nov 2021 03:23:27 +0000
Received: ("Tessian outbound d49ee2bec50d:v108");
 Fri, 05 Nov 2021 03:23:26 +0000
Received: from 0e111bae777b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 80424ABC-9627-47B7-AC39-78D5BCD21FBB.1; 
 Fri, 05 Nov 2021 03:23:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0e111bae777b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 Nov 2021 03:23:21 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by DB9PR08MB7050.eurprd08.prod.outlook.com (2603:10a6:10:2bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Fri, 5 Nov
 2021 03:23:17 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f4fd:a3a4:6768:1165]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f4fd:a3a4:6768:1165%3]) with mapi id 15.20.4669.011; Fri, 5 Nov 2021
 03:23:17 +0000
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
X-Inumbo-ID: c028e0a3-3de7-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pzeIrlEfGm/kn9oItGNutQTWoFYDoC1gT21Ki9oJd0=;
 b=XJ6J3UURvv4eU4QUAdZRWouZ59BpK+XSmD/ufCav613H7OJgpzyFPIBOCnY/4pA6gFnawp7k+GVVb6HQeM3049u7CkznwyGWQhhQLHIc5DH/ujxD9cyIdmkzHqbC7JoofAR7EMTLNrexerzJc51xPVQ8EJtrvAb8gVUlUYvDXLo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCbpePdUiN3gTeoShFPKIfMnWzQJq5qxKKq5ysAAoQbx6h/cDsvEFPjW0xUzF2kXW7sKsfz1DrOgYHjBEHEcsl7UTdLpEAF/71VILqmBwNQOSI3CkoTs0TFzbiTz9KDzcHao2rzIhEnVSAhgS67esYbp64rf7uudjZdm4xktAVTgzTx+/80kQr412DAWHnA4rKl0oOJHCyPRjZLOip5wJW8ZksdR6HFz3WUhQPX2N50r2O0c8j03RAieZWeWDxujLfTWXlvPKzKfjdHDbwbRLyFzpMR+NXO4nGtNnJp1ASQL8WvPpfv1cS/MLDG1ExXiS67j3ZxqrgMdaKXv72B03w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pzeIrlEfGm/kn9oItGNutQTWoFYDoC1gT21Ki9oJd0=;
 b=D5+QI/fMJktWhob4tDizm/jM1L0IvJQpLs4pj0jldcJWwMWvqF4YHdezvesTb9EMAkg+Q0BFwlBVPaxcRR9F2BagSoPtA3gSRdAicV6Oss9pKkhfaBj2GQ8EkoTMxq69ZpAoMcc7aO6lKUmWgsAdCnEGF4yzlXdccdHyezaWjsxGEiFYt3FE4E7mWTIgNebzFYLAuuO0on3uG9n/pTrszKO/x/VUBszS5wxTK5udCc8LWjGldQGaniP5VLY1/h4HnJsfYEFIiSgvwh5UKeu31C7eSRlQdA10uKdmdYZzqKm56zJ7V3/CKf9Yx9Zeo6HPN7G+R3F4OuRVZC3dKWIhtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pzeIrlEfGm/kn9oItGNutQTWoFYDoC1gT21Ki9oJd0=;
 b=XJ6J3UURvv4eU4QUAdZRWouZ59BpK+XSmD/ufCav613H7OJgpzyFPIBOCnY/4pA6gFnawp7k+GVVb6HQeM3049u7CkznwyGWQhhQLHIc5DH/ujxD9cyIdmkzHqbC7JoofAR7EMTLNrexerzJc51xPVQ8EJtrvAb8gVUlUYvDXLo=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>
Subject: RE: static-mem preventing dom0 from booting
Thread-Topic: static-mem preventing dom0 from booting
Thread-Index: AQHX0eWC7qpRq+VAt0Cu1/k92WugAqv0ODjw
Date: Fri, 5 Nov 2021 03:23:17 +0000
Message-ID:
 <DU2PR08MB73256624607E7624CAAD38E5F78E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References:
 <alpine.DEB.2.22.394.2111041829300.284830@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2111041829300.284830@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E7D2571691319C469BF12B212A6D158C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ef27ea12-021c-49a1-b6d4-08d9a00ba201
x-ms-traffictypediagnostic: DB9PR08MB7050:|VI1PR0802MB2494:
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB24941919970C1FC17F385148F78E9@VI1PR0802MB2494.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:293;OLM:293;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 43oB7iEGgBkWBOlgJNGVh1zORcJwoO2P58uPAkRdTr4et9Fxx3aqxZiNe7pte+Tk+KYAQIGbbGot7XLvqTEiPvDtycICIwy24tVVUcPqYtNU6SSmKxrdOXzVo6HVUSMVOBeW1Xo5gEstvW7vno0qAhs+5fuwfrG3juBv/ogTl3RX5T+p9MFtLp9M+GLSdk16n2Wvwvl5VcbK+3hplJ8d9Zy+NxeU7rGMpFp5hjDXzqkXOLYtMqNbBsjJ/1wztd7uI4+t21fXZi66XJfTeywW+TmO8n9zFaF6wBT66L/Vo1VO7eXZlhjbIGdS/KscDRqJV2j7IV3IvslImKzJuMERUsi1WE7UaLTJGYLAlg49sxGq+ga0+K7u5tyCZULlTbEEYwOQPgn6jDT125hpjhPHaCsB43UywSo4ewqQrlNY4unSEryDQlWynZcgsBU6rWsUM7wVS+sTCPcQnWnSbqkV7fBQ6fky5WGGdbVtlEQVWCzwLf5ZHguiZGyDYOAK3SnWt7iLstJgWOwytz2yyNinw/RvMimfGZ/zZ2yKqc0WenRSq35ZP0RPz+qWKdIB+Za4TS3U/Q06gGz7ZkUzY8uvG//ptaQfjmCPQmtk5cdxI/LkwVkhIpEwr5Aqdh86ws1/KDT2XBLkd6DWhQch78rXQQtS15lu5efHwgBreW7A/aHHuBQMusMrqksyYeGEnbYBVZ1LKY2FI9MfdP+Ae3y9kZlBEahoSy/4RR05aRRxUVA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(64756008)(316002)(66446008)(52536014)(508600001)(6916009)(2906002)(76116006)(30864003)(7696005)(8676002)(66946007)(186003)(8936002)(66476007)(9686003)(6506007)(53546011)(55016002)(54906003)(66556008)(26005)(122000001)(38100700002)(86362001)(83380400001)(38070700005)(33656002)(4326008)(5660300002)(139555002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7050
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9bf363f2-d400-4f3c-ab74-08d9a00b9c41
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T+7ipK/KR/UAzZnlwmD7nD+WFiXOvkLl9BbddsgLieNqQTvCrCof3iRJ7Zix4Pm4N29xAizQIVKCuMau0SgPYbhWcaO84B1tV6tWmZFrXyrHNwcKRryi8Epl4CAOQk0k0aNG54mTSM8/kkiENFR/WUqWAxjYcUkGxeezOcwoYSW5+hcAjqARlycjFwzWoatr3hl6ov0kxqT1ZinlAQWiK7T1E4mj3gHzLTDeHSJBZu1qjPvyp1wr2P3h9vPGOfYIkeNG4S4dIgPr5ui9wIFCNS8BPZljF19pAKtGzZ/MbxhHwZtR11cxZSZ5/K3iCnmKqbyHruKqybA/ZOh5YgaSx9SB9X3Tqo+0CHNrbMs5hwGyZK56skklDTphcGC4xrdH0+JtY2lODaeGJgy7YS/uFafmz7zlVHa7foxI0JKCVjQ6HrZFlJY8fTSx3IvBloPlfZIODOEnQAF9NO27xi3vzDrvPf6xSLOeopGk0PFRntsaQ9aJwyj5fRN5LNcYSVtPpSaLbUWp/5ZcGm8nCQxn5tf3VRBSrTZy9oVSucSG9j0ZWELGpTCnB6xsDlwe7/ysO8NKXLlAPoety1zXpamVwzYu2oXAJ0VIlPkEdLN9elwBvFPgoT9kuYTuACjob1Wg47++MEWpOPQCq4VORIVlRlstdkITEv9XRCOdggUyfimfjrGMsa3Me5apzkkqal4EV8YnrH1ni/0gBvq1WS03zFij6bDcJb9xbbygdP789Zc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(186003)(336012)(6862004)(82310400003)(7696005)(30864003)(54906003)(5660300002)(508600001)(47076005)(55016002)(316002)(4326008)(26005)(8936002)(52536014)(36860700001)(6506007)(8676002)(33656002)(81166007)(2906002)(9686003)(53546011)(70586007)(70206006)(86362001)(356005)(83380400001)(139555002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 03:23:27.2031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef27ea12-021c-49a1-b6d4-08d9a00ba201
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2494

Hi Stefano

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Sent: Friday, November 5, 2021 9:36 AM
> To: Penny Zheng <Penny.Zheng@arm.com>
> Cc: sstabellini@kernel.org; xen-devel@lists.xenproject.org
> Subject: static-mem preventing dom0 from booting
>=20
> Hi Penny,
>=20
> I am trying to test the static-mem feature in Xen 4.16 but I am having so=
me
> issues. I can boot a dom0less domU with static-mem configured correctly, =
but
> when I do so, dom0 doesn't boot any longer.
>=20

Hmm, In our first intention, dom0less is a mandatory option for static allo=
cation.
domU on static allocation shall boot when dom0 doesn't boot there.

We think that, nevertheless, dom0 memory range is allocated by Xen automati=
cally,
and it leads to the unpredictability. Static allocation through device tree=
 configuration
prefers the total static environment to avoid unpredictability.

> In the same configuration, if I remove the static-mem related lines from =
the
> domU node on device tree, both dom0 and domU boot successfully.
>=20
> I am sure the dom0 memory range, allocated by Xen automatically, and the
> domU memory range, hand-picked by me, do not clash as you can see from th=
e
> boot logs (appended).
>=20
> Am I missing anything in the configuration? I am using a ZCU102 board, th=
e
> memory node on the host device tree is:
>=20

Are you suggesting one scenario where dom0 with static-mem domU?

Hmmm, one quick thought, it may not be working with vpl011 emulation.
When dom0 exists, vpl011 will take dom0 as backend, which requests event
channel, xen store, etc, involved to communicate. but static-mem domU
without CONFIG_XEN shall not handle it.

> 	memory {
> 		device_type =3D "memory";
> 		reg =3D <0x00 0x00 0x00 0x7ff00000 0x08 0x00 0x00 0x80000000>;
> 	};
>=20
> I am attaching my u-boot boot.scr script with the device tree modificatio=
n to
> add static memory.
>=20
> Many thanks for your help!
>=20
> Cheers,
>=20
> Stefano
>=20
>=20
> (XEN) Xen version 4.16-rc (sstabellini@) (gcc (Ubuntu 9.3.0-17ubuntu1~20.=
04)
> 9.3.0) debug=3Dy Thu Nov  4 18:28:30 PDT 2021
> (XEN) Latest ChangeSet: Mon Nov 1 12:36:26 2021 +0000 git:9f8434d778-dirt=
y
> (XEN) Processor: 00000000410fd034: "ARM Limited", variant: 0x0, part
> 0xd03,rev 0x4
> (XEN) 64-bit Execution:
> (XEN)   Processor Features: 1100000000002222 0000000000000000
> (XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
> (XEN)     Extensions: FloatingPoint AdvancedSIMD
> (XEN)   Debug Features: 0000000010305106 0000000000000000
> (XEN)   Auxiliary Features: 0000000000000000 0000000000000000
> (XEN)   Memory Model Features: 0000000000001122 0000000000000000
> (XEN)   ISA Features:  0000000000011120 0000000000000000
> (XEN) 32-bit Execution:
> (XEN)   Processor Features: 0000000000001231:0000000000011011
> (XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 ThumbEE Jazelle
> (XEN)     Extensions: GenericTimer Security
> (XEN)   Debug Features: 0000000003010066
> (XEN)   Auxiliary Features: 0000000000000000
> (XEN)   Memory Model Features: 0000000010101105 0000000040000000
> (XEN)                          0000000001260000 0000000002102211
> (XEN)   ISA Features: 0000000002101110 0000000013112111
> 0000000021232042
> (XEN)                 0000000001112131 0000000000011142 0000000000011121
> (XEN) Generic Timer IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 65000 KHz
> (XEN) GICv2 initialization:
> (XEN)         gic_dist_addr=3D00000000f9010000
> (XEN)         gic_cpu_addr=3D00000000f9020000
> (XEN)         gic_hyp_addr=3D00000000f9040000
> (XEN)         gic_vcpu_addr=3D00000000f9060000
> (XEN)         gic_maintenance_irq=3D25
> (XEN) GICv2: Adjusting CPU interface base to 0xf902f000
> (XEN) GICv2: 192 lines, 4 cpus, secure (IID 00000000).
> (XEN) XSM Framework v1.0.1 initialized
> (XEN) Initialising XSM SILO mode
> (XEN) Using scheduler: null Scheduler (null)
> (XEN) Initializing null scheduler
> (XEN) WARNING: This is experimental software in development.
> (XEN) Use at your own risk.
> (XEN) Allocated console ring of 16 KiB.
> (XEN) Bringing up CPU1
> (XEN) Bringing up CPU2
> (XEN) Bringing up CPU3
> (XEN) Brought up 4 CPUs
> (XEN) I/O virtualisation enabled
> (XEN)  - Dom0 mode: Relaxed
> (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
> (XEN) P2M: 3 levels with order-1 root, VTCR 0x0000000080023558
> (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
> (XEN) *** LOADING DOMAIN 0 ***
> (XEN) Loading d0 kernel from boot module @ 0000000000e00000
> (XEN) Loading ramdisk from boot module @ 0000000002200000
> (XEN) Allocating 1:1 mappings totalling 1024MB for dom0:
> (XEN) BANK[0] 0x00000020000000-0x00000060000000 (1024MB)
> (XEN) Grant table range: 0x00000005600000-0x00000005640000
> (XEN) Allocating PPI 16 for event channel interrupt
> (XEN) Extended region 0: 0x80000000->0xc0000000
> (XEN) Extended region 1: 0xc8000000->0xe0000000
> (XEN) Extended region 2: 0xf0000000->0xf9000000
> (XEN) Extended region 3: 0xffc00000->0x600000000
> (XEN) Extended region 4: 0x880000000->0x8000000000
> (XEN) Extended region 5: 0x8001000000->0x10000000000
> (XEN) Loading zImage from 0000000000e00000 to 0000000020000000-
> 0000000021367a00
> (XEN) Loading d0 initrd from 0000000002200000 to 0x0000000028200000-
> 0x0000000029d60ac0
> (XEN) Loading d0 DTB to 0x0000000028000000-0x00000000280096d4
> (XEN) *** LOADING DOMU cpus=3D1 memory=3D80000KB ***
> (XEN) Loading d1 kernel from boot module @ 0000000003e00000
> (XEN) Loading ramdisk from boot module @ 0000000005200000
> (XEN) Loading zImage from 0000000003e00000 to 0000000040000000-
> 0000000041367a00
> (XEN) Loading d1 initrd from 0000000005200000 to 0x0000000048200000-
> 0x0000000048383400
> (XEN) Loading d1 DTB to 0x0000000048000000-0x00000000480007f3
> (XEN) Initial low memory virq threshold set at 0x4000 pages.
> (XEN) Std. Loglevel: Errors and warnings
> (XEN) Guest Loglevel: All
> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input=
)
> (XEN) DEBUG start_xen 1054 id=3D0
> (XEN) null.c:353: 0 <-- d0v0
> (XEN) DEBUG start_xen 1054 id=3D1
> (XEN) null.c:353: 1 <-- d1v0
> (XEN) Freed 348kB init memory.
> (XEN) traps.c:2013:d0v0 HSR=3D0x00000092000045 pc=3D0xffffffc0105300ec
> gva=3D0xfffffffdfda3b000 gpa=3D0x0000081ffff000
> (XEN) d1v0 Unhandled SMC/HVC: 0x84000050
> (XEN) d1v0 Unhandled SMC/HVC: 0x8600ff01
> (XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4
> (XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8
> (XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER12
> (XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER16
> (XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER20
> (XEN) d1v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
> (XEN) DOM1: [    0.000000] Booting Linux on physical CPU 0x0000000000
> [0x410fd034]
> (XEN) DOM1: [    0.000000] Linux version 5.14.0-00002-g9c4bc20097e8
> (sstabellini@ubuntu-linux-20-04-desktop) (gcc (Ubuntu 9.3.0-17ubuntu1~
> (XEN) DOM1: 20.04) 9.3.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #9 SMP W=
ed
> Nov 3 16:50:00 PDT 2021
> (XEN) DOM1: [    0.000000] efi: UEFI not found.
> (XEN) DOM1: [    0.000000] Zone ranges:
> (XEN) DOM1: [    0.000000]   DMA32    [mem 0x0000000040000000-
> 0x000000005fffffff]
> (XEN) DOM1: [    0.000000]   Normal   empty
> (XEN) DOM1: [    0.000000] Movable zone start for each node
> (XEN) DOM1: [    0.000000] Early memory node ranges
> (XEN) DOM1: [    0.000000]   node   0: [mem 0x0000000040000000-
> 0x000000005fffffff]
> (XEN) DOM1: [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-
> 0x000000005fffffff]
> (XEN) DOM1: [    0.000000] cma: Reserved 256 MiB at 0x000000004f400000
> (XEN) DOM1: [    0.000000] psci: probing for conduit method from DT.
> (XEN) DOM1: [    0.000000] psci: PSCIv1.1 detected in firmware.
> (XEN) DOM1: [    0.000000] psci: Using standard PSCI v0.2 function IDs
> (XEN) DOM1: [    0.000000] psci: Trusted OS migration not required
> (XEN) DOM1: [    0.000000] psci: SMC Calling Convention v1.1
> (XEN) DOM1: [    0.000000] percpu: Embedded 22 pages/cpu s51672 r8192
> d30248 u90112
> (XEN) DOM1: [    0.000000] Detected VIPT I-cache on CPU0
> (XEN) DOM1: [    0.000000] CPU features: detected: ARM erratum 843419
> (XEN) DOM1: [    0.000000] CPU features: detected: ARM erratum 845719
> (XEN) DOM1: [    0.000000] Built 1 zonelists, mobility grouping on.  Tota=
l pages:
> 129280
> (XEN) DOM1: [    0.000000] Kernel command line: console=3DttyAMA0
> (XEN) DOM1: [    0.000000] Dentry cache hash table entries: 65536 (order:=
 7,
> 524288 bytes, linear)
> (XEN) DOM1: [    0.000000] Inode-cache hash table entries: 32768 (order: =
6,
> 262144 bytes, linear)
> (XEN) DOM1: [    0.000000] mem auto-init: stack:off, heap alloc:off, heap
> free:off
> (XEN) DOM1: [    0.000000] Memory: 230280K/524288K available (13184K
> kernel code, 862K rwdata, 3636K rodata, 2048K init, 315K bss, 31864K
> (XEN) DOM1: reserved, 262144K cma-reserved)
> (XEN) DOM1: [    0.000000] rcu: Hierarchical RCU implementation.
> (XEN) DOM1: [    0.000000] rcu:         RCU event tracing is enabled.
> (XEN) DOM1: [    0.000000] rcu:         RCU restricting CPUs from NR_CPUS=
=3D4 to
> nr_cpu_ids=3D1.
> (XEN) DOM1: [    0.000000] rcu: RCU calculated value of scheduler-enlistm=
ent
> delay is 25 jiffies.
> (XEN) DOM1: [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D=
16,
> nr_cpu_ids=3D1
> (XEN) DOM1: [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> (XEN) DOM1: [    0.000000] Root IRQ handler: gic_handle_irq
> (XEN) DOM1: [    0.000000] random: get_random_bytes called from
> start_kernel+0x4a8/0x728 with crng_init=3D0
> (XEN) DOM1: [    0.000000] arch_timer: cp15 timer(s) running at 65.00MHz =
(virt).
> (XEN) DOM1: [    0.000000] clocksource: arch_sys_counter: mask: 0xfffffff=
fffffff
> max_cycles: 0xefdb196da, max_idle_ns: 440795204367 ns
> (XEN) DOM1: [    0.000055] sched_clock: 56 bits at 65MHz, resolution 15ns=
,
> wraps every 2199023255550ns
> (XEN) DOM1: [    0.015323] Console: colour dummy device 80x25
> (XEN) DOM1: [    0.017224] Calibrating delay loop (skipped), value calcul=
ated
> using timer frequency.. 130.00 BogoMIPS (lpj=3D260000)
> (XEN) DOM1: [    0.017335] pid_max: default: 32768 minimum: 301
> (XEN) DOM1: [    0.019932] Mount-cache hash table entries: 1024 (order: 1=
,
> 8192 bytes, linear)
> (XEN) DOM1: [    0.020022] Mountpoint-cache hash table entries: 1024 (ord=
er:
> 1, 8192 bytes, linear)
> (XEN) DOM1: [    0.070463] rcu: Hierarchical SRCU implementation.
> (XEN) DOM1: [    0.073611] EFI services will not be available.
> (XEN) DOM1: [    0.074889] smp: Bringing up secondary CPUs ...
> (XEN) DOM1: [    0.075178] smp: Brought up 1 node, 1 CPU
> (XEN) DOM1: [    0.075205] SMP: Total of 1 processors activated.
> (XEN) DOM1: [    0.075253] CPU features: detected: 32-bit EL0 Support
> (XEN) DOM1: [    0.075304] CPU features: detected: CRC32 instructions
> (XEN) DOM1: [    0.076596] CPU: All CPU(s) started at EL1
> (XEN) DOM1: [    0.076717] alternatives: patching kernel code
> (XEN) DOM1: [    0.092884] devtmpfs: initialized
> (XEN) DOM1: [    0.109553] clocksource: jiffies: mask: 0xffffffff max_cyc=
les:
> 0xffffffff, max_idle_ns: 7645041785100000 ns
> (XEN) DOM1: [    0.109716] futex hash table entries: 256 (order: 2, 16384=
 bytes,
> linear)
> (XEN) DOM1: [    0.124058] pinctrl core: initialized pinctrl subsystem
> (XEN) DOM1: [    0.143628] NET: Registered PF_NETLINK/PF_ROUTE protocol
> family
> (XEN) DOM1: [    0.157764] DMA: preallocated 128 KiB GFP_KERNEL pool for
> atomic allocations
> (XEN) DOM1: [    0.158089] DMA: preallocated 128 KiB
> GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> (XEN) DOM1: [    0.158426] audit: initializing netlink subsys (disabled)
> (XEN) DOM1: [    0.166578] cpuidle: using governor menu
> (XEN) DOM1: [    0.167213] hw-breakpoint: found 6 breakpoint and 4
> watchpoint registers.
> (XEN) DOM1: [    0.168930] audit: type=3D2000 audit(0.140:1): state=3Dini=
tialized
> audit_enabled=3D0 res=3D1
> (XEN) DOM1: [    0.169475] ASID allocator initialised with 65536 entries
> (XEN) DOM1: [    0.171250] Serial: AMBA PL011 UART driver
> (XEN) DOM1: [    0.181920] 22000000.sbsa-uart: ttyAMA0 at MMIO 0x22000000
> (irq =3D 13, base_baud =3D 0) is a SBSA
> (XEN) DOM1: [    0.533061] printk: console [ttyAMA0] enabled
>=20

Cheers=1B$B!$=1B(B

Penny  Zheng
> [... cutting here, DOM1 boots until the end, no signs of dom0]

