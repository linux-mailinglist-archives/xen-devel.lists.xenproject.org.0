Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B374535EC
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 16:37:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226380.391194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn0VY-0006yZ-0P; Tue, 16 Nov 2021 15:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226380.391194; Tue, 16 Nov 2021 15:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn0VX-0006vz-Sa; Tue, 16 Nov 2021 15:36:27 +0000
Received: by outflank-mailman (input) for mailman id 226380;
 Tue, 16 Nov 2021 15:36:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lo73=QD=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mn0VW-0006vt-5R
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 15:36:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f44b2dc8-46f2-11ec-a9d2-d9f7a1cc8784;
 Tue, 16 Nov 2021 16:36:24 +0100 (CET)
Received: from AM6P195CA0067.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::44)
 by DB9PR08MB7099.eurprd08.prod.outlook.com (2603:10a6:10:2c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Tue, 16 Nov
 2021 15:36:22 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::e9) by AM6P195CA0067.outlook.office365.com
 (2603:10a6:209:87::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Tue, 16 Nov 2021 15:36:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20 via Frontend Transport; Tue, 16 Nov 2021 15:36:20 +0000
Received: ("Tessian outbound 9a8c656e7c94:v110");
 Tue, 16 Nov 2021 15:36:20 +0000
Received: from fd2620a4c9a1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F9BFEC9B-14E7-40D0-90F7-FB1E7F7C3463.1; 
 Tue, 16 Nov 2021 15:36:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fd2620a4c9a1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 16 Nov 2021 15:36:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM5PR0802MB2596.eurprd08.prod.outlook.com (2603:10a6:203:98::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Tue, 16 Nov
 2021 15:36:12 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 15:36:12 +0000
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
X-Inumbo-ID: f44b2dc8-46f2-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xH6hEkRHRCnsDpQVM/w6/Vp65XyiVOeQulO2+x+2dF4=;
 b=bJW5giQeTLkiWOxgYKYUpao/uQtf4hr1U/9W9Y7ae0HePlrq8y8X6VtknpXHhVP1Xn2yhRi97sIA7biHqSM/S9fFkEGeRNr0LK4LDy2LtZEsgeMlio5BWV71uFjpC7dLSSYKkj/eYUNuW1FCrdtt0VePwVxbq6JkeHE3Z4iaHf4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5b181a9926d8c2e0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWrsiQvIhDtQcXi3PeuuvzVgeL5YqVipQ1Da6tZkvYUKBO4QuIZ99mjZfKNcLlMFH7h6Uf5ioolIKRHPidd7Ik2OEgdzBwa/396XYQtAulBVHQIGZbhN5tsDe6zU55QUcxKveDAPCG2fZXO0DFqdi+y4AJSp8SLNrJIj3fgTc4DVLVngjeIP2uHH9ymbu5hBpuMsF7LHpsfOe+VmUQogt5Sdi0Lf5nho/1OGMlC7mJwuXhbYswL4KZNSnDAg+CIQTc6J0zLeVV3FBQ2AdQhQGKe0Fuip1Oxw9nb488KV4oSmkiLQbX9N0pwgSlT1a4+TDNFVnMmG3AfjmteepeR+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xH6hEkRHRCnsDpQVM/w6/Vp65XyiVOeQulO2+x+2dF4=;
 b=WzU/lipieE2FT7Ii8zlo/SB7prg9KV8Ksj1kgivrvYqFwDzxxOwP1G3Ct15d1EuJhkPOW5pExRSyUzhr7HIlkYRI1EzOSQ7TkjdqGMYvcrYjVgIYTMB2fAdpMnSVvdSnR4sIpYHYsL4M8D36bpAHcq9EfYyNcVDCS3hMjy8D8nB3D62p5U+7leZV8bvpnndOjoDxTlo4LT7T4tK26NpPd83d0xFhbtJU6xBDLh+q5cIpAAZ688AareU6yVcbaj9zwHKVv0Ylj+WmqbJeV7pypjADnJaDwxqcFRjK6u1q3/W59cuAPtBsijOJLfqymVz4fJMm2MXg85A0nTWi6QEPLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xH6hEkRHRCnsDpQVM/w6/Vp65XyiVOeQulO2+x+2dF4=;
 b=bJW5giQeTLkiWOxgYKYUpao/uQtf4hr1U/9W9Y7ae0HePlrq8y8X6VtknpXHhVP1Xn2yhRi97sIA7biHqSM/S9fFkEGeRNr0LK4LDy2LtZEsgeMlio5BWV71uFjpC7dLSSYKkj/eYUNuW1FCrdtt0VePwVxbq6JkeHE3Z4iaHf4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Xen/ARM - Query about a data abort seen while reading GICD
 registers
Thread-Topic: Xen/ARM - Query about a data abort seen while reading GICD
 registers
Thread-Index: AQHX2v69rH0Wb2BjYUqXheWDWZOLqqwGSWAA
Date: Tue, 16 Nov 2021 15:36:12 +0000
Message-ID: <CED537AF-44AA-41B8-9458-17A5C43FBECC@arm.com>
References: <1489a1b9-aefa-0ddf-8dba-4a566388cc6f@xilinx.com>
In-Reply-To: <1489a1b9-aefa-0ddf-8dba-4a566388cc6f@xilinx.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5e91b002-404c-4c07-4c0f-08d9a916d6ba
x-ms-traffictypediagnostic: AM5PR0802MB2596:|DB9PR08MB7099:
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB7099FE00D96CBB797C343C169D999@DB9PR08MB7099.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9ORpEG4vjjQTK8lcCOPwVhGsknJTH/xiCerMLCFS2nvrG9RxrHuDYk5/ogdXxIkWxI7OSvy4M4ui73WVMXdGrxe57j5kavX/1NNifbkq+uYS+5ZCl4FoHOsKsYoMlRtlipicrHCGlVDe1mHVSmQ8NzNO6n1iMvNOw2ScnzsGUAxp3sXvfbpnLk1GNFbTPouEeFUfgPxCugnhU+wKMbimSW05RigrVDNMYkDHctCEMrvc/Dlbfh3D/9TViq32FuWrPt9IOTYn3zD8zlsyh1+w/HM4IKWXQvoMXFRkJmzUSHhRm/HBQ82tPne7BNt3ZuYZdNZv1ZtBD7ej3g3oAKnlUEPSqXgeLahnXaeeXt8U01AgvqtdL84DfE7RjjnT/2XZPyU9tfk3hQjlB46iBvESErGZA7+YiitaZMvis0cqUp187wBHZ6PtwFs0sCy9nq8bZzkryuX4VlQ952ETQTWzH9PZa9AdytP5Gy3GpV/+jajouoNfdTFADilJWA2hB0e1Neu04+ziSArCKm9bnmM9/jNogxm6rA2isboUuLan17uQLXRAM0YDlJvWxVlEMsc3PoRtlv2EDw18Z8Kfi0qcJbnINT2nN39IDtrFua5a4QSuK21C5t0vhzecPSfgwbbPDaAKvjAksLufSwgI58t+1I8+t1BEOfu9Om3QXTs25rTx511YhKCaGPl6ygcRqbFRpXrhd8jVmKfj9U3PJ2o21s7t3Bs/HZRoRNplWA8ZpNy5V1cvq1J1dUMU4OkHBs84
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(122000001)(186003)(6916009)(38100700002)(66556008)(2906002)(8936002)(5660300002)(53546011)(6506007)(66476007)(66946007)(2616005)(508600001)(66446008)(64756008)(36756003)(6486002)(71200400001)(316002)(4326008)(38070700005)(76116006)(86362001)(91956017)(33656002)(8676002)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <90F8E8832A3FEA4AB0F7219088C40D48@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2596
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0b0415e6-cc43-4eeb-b54e-08d9a916d20e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aN6ZhcO3FeAXV9N3i6rkNsjjMbrZbWFu2ElIrxEq9vLRxm/TEgZj+0CjdKd40y747m5eqeAWF8HvV/EQVzJne/y+97RSSPaBlZGkNC3UlTKyJfedtfh2ivoHXfCPPruA1YRIEKf6WRlIfq+7tolrXz4eXVbJi6bNovcYB1p2trRvPQKuyNDWtQgVTtCcyvXESNeQ4Fh9CUrXkpSnkVXFPXg/hspncgOCiPtmieQFlsC6SeRtgbwza7yDeXjEZQ7GE/pqy2Gdk5mnO/CtDqTS8+4uPGaoKUO6IRlXlu6MVjYUVxZKjxqqSWfd9wabMEUiJX8JKkEfX3j2/wmRH1KoSGOSwtRuwTmiVZVNsx1cJF8JY9vTuzFgoJ4GSizdraCgIF7dt58mJs7xuIRICvZKzKuPkcLd4lUXcH/D/Mr5BmmIqKRE635PSs8/Z/ISZlvsiAv2QndEEgg57KtRKz/ZsBkIYhBHYqkYOzGps92Qb7mtgsML4IMosznYojNY6jLJGnDxeIB4y53RGa3jdtnMdsgNd9sFTJ0qt4ruMsDHxQL4l97GBj1SzSmYb34mVzTcS8dwu4lXM0nF1UzubM8LmGAaamG8W4jD6lVeEZYB4p4YEBzA12Uo/r1UoRTmnPPpEcVB5TWakTnQ7/Ey6lJaP9jtHMW6fBQHokya+okk60TTEn6ZawcypbKcBew43DSCv7JCVl5DcVS94GBN41JQSA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6862004)(82310400003)(70206006)(6486002)(47076005)(356005)(70586007)(186003)(36860700001)(26005)(316002)(2616005)(86362001)(4326008)(81166007)(508600001)(336012)(8936002)(6506007)(53546011)(2906002)(8676002)(36756003)(33656002)(5660300002)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 15:36:20.5944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e91b002-404c-4c07-4c0f-08d9a916d6ba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7099

Hi Ayan,

> On 16 Nov 2021, at 15:27, Ayan Kumar Halder <ayan.kumar.halder@xilinx.com=
> wrote:
>=20
> Hi Xen/Arm experts,
>=20
> I am facing a very strange issue while running a baremetal application as=
 a DomU guest on arm64 platform.
>=20
> The baremetal app tries to read the GICD register with post indexing as f=
ollows :-
> ldr x1, =3D0x3001000
> ldr w2, [x1], #4 <<<------ PC =3D 0x40000ca8

Increment on on load is not supported by the emulation layer.

Could you try with:
add x1, x1, #4
ldr w2, [x1]

Regards
Bertrand

>=20
> And then I get :-
> HSR=3D0x92000005 pc=3D0x00000040000ca8 gva=3D0x3001000 gpa=3D0x0000000300=
1000
>=20
> This problem occurs only while reading the GICD registers with post index=
ing. If I read the register with pre-indexing, then I do not see any abort.=
 Alternatively, if I read GICC register with post indexing, I don't see the=
 abort either.
>=20
> From the HSR value, I interpret it as
> EC =3D 100100b # Data abort from lower exception
> IL =3D 1b # 32 bit instruction trapped
> DFSC =3D 101 # Translation fault level 1
>=20
> On debugging, I found that the abort is triggered from
>=20
> try_handle_mmio()
> { ...
>    /* All the instructions used on emulated MMIO region should be valid *=
/
>    if ( !dabt.valid ) {
>=20
>        return IO_ABORT;
>    }
> ...
> }
>=20
> From the Arm V8 Arm specs, I understand that dabt.valid is ISV, bit[24] i=
n "ISS encoding for an exception from a Data Abort".
>=20
>=20
> I saw that the caller is
>=20
> do_trap_guest_sync() "case HSR_EC_DATA_ABORT_LOWER_EL"
> where dabt.valid is false.
> In the success scenario, dabt.valid is true.
>=20
> I could not find the caller for do_trap_guest_sync()
>=20
> So, can anyone help me here
> 1. Who is the caller for do_trap_guest_sync() ?
> 2. Any idea on what the issue is and how I can debug it further ?
>=20
> Kind regards,
> Ayan
>=20


