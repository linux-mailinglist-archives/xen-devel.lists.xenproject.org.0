Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB11373D887
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 09:30:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555356.867073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDgft-0001ZV-38; Mon, 26 Jun 2023 07:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555356.867073; Mon, 26 Jun 2023 07:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDgfs-0001XM-WB; Mon, 26 Jun 2023 07:30:13 +0000
Received: by outflank-mailman (input) for mailman id 555356;
 Mon, 26 Jun 2023 07:30:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCbL=CO=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qDgfr-0001XE-45
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 07:30:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47305eca-13f3-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 09:30:09 +0200 (CEST)
Received: from AM6P193CA0115.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::20)
 by DBBPR08MB5961.eurprd08.prod.outlook.com (2603:10a6:10:203::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 07:30:04 +0000
Received: from AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::aa) by AM6P193CA0115.outlook.office365.com
 (2603:10a6:209:85::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Mon, 26 Jun 2023 07:30:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT016.mail.protection.outlook.com (100.127.140.106) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.15 via Frontend Transport; Mon, 26 Jun 2023 07:30:04 +0000
Received: ("Tessian outbound b11b8bb4dfe8:v142");
 Mon, 26 Jun 2023 07:30:03 +0000
Received: from 257ea5bb51f6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ABFE5644-1E02-433E-BEAE-83BCF624974E.1; 
 Mon, 26 Jun 2023 07:29:53 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 257ea5bb51f6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Jun 2023 07:29:53 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB8307.eurprd08.prod.outlook.com (2603:10a6:150:a4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 07:29:48 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%7]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 07:29:48 +0000
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
X-Inumbo-ID: 47305eca-13f3-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfAVLzyyapTdK3kvigyp1nQMe2J5k58O3GqP1opX5nk=;
 b=UtWP8BFiUVwt53ikcqveGxVN2saNtDN16QJCaRLj7DY6Gn/6/Y9H1PCo8K+ygE6KDve2i8Aur/v5QXeUor7CZFGfu5tp/YtIQsUhDDbze6QkbOUzAcOUmIT+X1BQr6ZLLrFNLX27BxWXDvI2SFDlYg6pKKdueNHqy7TGD1aspF0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3RwAucSVnx6I7lAUbIrcReGpuYx3Uw42i44wtC9ZS08YtJQUh6c4sKGLFez4KUMk+UHg6hhm70w0ID/7wNH4hjPM2gLfkxOJt35fDJ0OFWW44WwdIkmgJ50aYdFqwDvy2XvNJuCZQ6t4mYatTGVe4ieK1AUUwobIwtlkmnnR4pbTqHHJqMXgwvJTSmoqphIIcObi93PAtCGPeW5zGj9ld7L4Vbdon3bxJrPwciBAe1SnVJBopi18tFL2UML1F3hh/wvir4B+nnrHG1nC9vcGuwTqpLibo7fBbleneX4DCD2z4DvDPNwxjRaSaKXvMFhqJ6uRY3VT5MHCHQVXDGAMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfAVLzyyapTdK3kvigyp1nQMe2J5k58O3GqP1opX5nk=;
 b=ObBk+zhQXhrjRyyupPaZEfAq9vPN5K4xSoHpZztEXn8BsLpyGUMPScbmt9dpwY9Gdd/23dlCYvr5XzqOIA2X/6oCKaDhm1rzlmCbvp26GKKNtXKb17Ifue4pbTUVxUP/3ZxbnHjXu/wawSrKJwwIyTlCATItq+zFjpZcQ85eBfU4WvnXRI08EOxdvshLIoH7IiJ36WOKH6bzxGXWlf2WuO1xS/8o89TtpEqCE3V8LjBwAIVWBLsuKZE8SIzeQYpuXXvVFkfo2sfQMtijnOSD+LhRN48JPozs0qS53Bbu5rds9GbYdqz2aIt3mfcs1tw8M/XaAsJGfjPr4tzVHj+tTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfAVLzyyapTdK3kvigyp1nQMe2J5k58O3GqP1opX5nk=;
 b=UtWP8BFiUVwt53ikcqveGxVN2saNtDN16QJCaRLj7DY6Gn/6/Y9H1PCo8K+ygE6KDve2i8Aur/v5QXeUor7CZFGfu5tp/YtIQsUhDDbze6QkbOUzAcOUmIT+X1BQr6ZLLrFNLX27BxWXDvI2SFDlYg6pKKdueNHqy7TGD1aspF0=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 8/9] xen/arm: Allow the user to build Xen with USBAN
Thread-Topic: [PATCH 8/9] xen/arm: Allow the user to build Xen with USBAN
Thread-Index: AQHZp6aSsRUjsp5X0kuhcvqBjbjyw6+crs2w
Date: Mon, 26 Jun 2023 07:29:48 +0000
Message-ID:
 <AS8PR08MB7991E5463FC69273FE7A48B49226A@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-9-julien@xen.org>
In-Reply-To: <20230625204907.57291-9-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2E0D137271F7FB45A11AB812F9A8D197.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB8307:EE_|AM7EUR03FT016:EE_|DBBPR08MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e488348-a5b1-4a73-0f73-08db761728b8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Lif3gNIvtokHXq5QFBktZQwTPE8R9l67wzsSzkwQOXie0RlxBaSTyzuhIHdFsBsXNDl2GeKMXJcQx40JqKIkm2EzdmrT71vSZQmTMHrcNIRShBcO6MCTeVIljb+yoAJ1jhl20vg2p0iaiYbhTHL3SA2t4CNFTPLVF9jRnaLkEuFWjoQ4USRXVtNWCIKiKEDreIQDEyMuSiKbqGphYX+7MNCkZ976Hx0QcpkaaZNVH4Uvb+GK81/i/E34ugP6R/ydiguTv4b8XmLKQCdyrlMUwSvJj5DjrQSu76z8Lm4zKcGwAJZmDlW0SIEnQpyoDmgoqM0mAO/mvjOQ+1zO8EIYRzikm3mV4vMN785SN/fOfiug9zO+tf8QvqmkMBet4QMhXFuhJeSHPkLLwbiH6Get4+9QoiSJQ83Hv1Tlhy/CKxT+z99kETVwV+a4v+Sj9u20Edlh6UExXeH+WcwAXKa6BQKGXH4exwsxDYdWaUcRswomQjrN29WAJvOY2dGNAlrtUvZHp7aRTGk4A42V20SvZqU8+276mX1kaOfhZzIrUtY21PUkuJflYP0olOGqwuFx5Ftruv0858rev1tLEtLRpBOyvW1GSKud2q+6DCuMB+4Awlagtg8wdEOykT7Pzfli
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199021)(33656002)(5660300002)(52536014)(86362001)(8936002)(8676002)(41300700001)(66556008)(64756008)(66476007)(38070700005)(76116006)(4326008)(38100700002)(122000001)(316002)(66946007)(55016003)(9686003)(6506007)(26005)(186003)(66446008)(2906002)(7696005)(71200400001)(54906003)(478600001)(110136005)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8307
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3c5933a6-d78c-4f6a-28d3-08db76171f74
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E9/jHEx1/rsvPRTwiR2lA6AV+sSvvDM2vGwhkorWWWupjCpPeMRE+uBjjkjVDejFuLeKjXNizdyY3aqc1FUdQOxT9BNVrKsBrhY5volqEDpiFsSqduSvjMK/uk2BRNKFis8RomNzxJZydGAYuP2l3UBhy6mZkW5oBotLNizX918V/55OdZDOlGzXCUJGC0ktFAvXT2Zvoyrv/Cg4cij/IuhssP6pcnPUeJabO/YxLnaoDYnLZmh9At7CAVW3Fq3T6MVWkKnlEpu9+Ozm27qoHr6N97H9Ht/CDqhA+ahqlmIH9rfNVqGDetsNA/KJJ8HsGTiF44/T/qEoHK+vUL0VGfrokxNl3KfMdPGFdkyOE6SacCuYrBGCohJ9yCP6KLBorB9jfFYAVR0zaFNZYwAVvtkOQDzEm/H5mWiTEZVndpKXIXfn4t/y9/ZocIWGsX8UKADelDzA7Y1Dcf0tHlrAmSNYaRaTZUwSe3IXdrZbwr4h348ehwett7nzWFoHALYpScPyVIr2RpxxYsRH8IyQ4i02JAyWwkr14PR50EeapvfQEaU+RU9pTDbYf53hMtndltiyl45aq8x1SS09yTTgrvqt3WZ+wsWK8HcjSUl+zEydwr/QW0Z+pYvfi3MgX6knGQwwEGI58gIRcVvpxOJJ1p8uRNX7fqQVmQZL010w0kwheD4Gszbcs0Fa14DvhwaUXBzSSsDxliHhz8CTAHk7dxW0/6rcRu2WmqZAOhRC1pIiUMs0pbrp6S5iazjOcjcU
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199021)(40470700004)(46966006)(36840700001)(5660300002)(52536014)(70586007)(70206006)(4326008)(33656002)(478600001)(316002)(8676002)(8936002)(40460700003)(2906002)(55016003)(40480700001)(36860700001)(110136005)(54906003)(86362001)(41300700001)(7696005)(82310400005)(9686003)(336012)(6506007)(26005)(47076005)(186003)(356005)(82740400003)(107886003)(83380400001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 07:30:04.1908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e488348-a5b1-4a73-0f73-08db761728b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5961

Hi Julien,

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Subject: [PATCH 8/9] xen/arm: Allow the user to build Xen with USBAN

Typo in title: s/USBAN/UBSAN/ and...

>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> UBSAN has been enabled a few years ago on x86 but was never
> enabled on Arm because the final binary is bigger than 2MB (
> the maximum we can currently handled).
>=20
> With the recent rework, it is now possible to grow Xen over 2MB.
> So there is no more roadblock to enable Xen other than increasing
> the reserved area.
>=20
> On my setup, for arm32, the final binaray was very close to 4MB.
> Furthermore, one may want to enable USBAN and GCOV which would put

...here also.

> the binary well-over 4MB (both features require for some space).
> Therefore, increase the size to 8MB which should us some margin.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Both typos can be fixed on commit and I think I am good with the
current approach, so:

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

I did a play with UBSAN enabled on FVP (arm64), in my setup,
the result Xen file is 3.7MB:

-rwxrwxr-x  1 xinwan02 xinwan02 3.7M Jun 26 14:47 xen
lrwxrwxrwx  1 xinwan02 xinwan02    3 Jun 26 14:47 xen.efi -> xen
-rwxrwxr-x  1 xinwan02 xinwan02  14M Jun 26 14:47 xen-syms

and the Xen and Dom0 booted fine and I can login Dom0. So
technically:

Tested-by: Henry Wang <Henry.Wang@arm.com>

However, I noticed Xen will print below during the Dom0 boot:
(XEN) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
(XEN) UBSAN: Undefined behaviour in arch/arm/vgic.c:371:15
(XEN) left shift of 1 by 31 places cannot be represented in type 'int'
(XEN) Xen WARN at common/ubsan/ubsan.c:172

Just want to make sure you also noticed this, otherwise maybe you
can include another patch in the series to fix this? Or I can do that
in case you don't have enough bandwidth.

Kind regards,
Henry

