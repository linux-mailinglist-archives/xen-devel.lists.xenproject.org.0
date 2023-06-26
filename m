Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6237473E261
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 16:45:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555571.867454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDnSY-0006Yk-JZ; Mon, 26 Jun 2023 14:44:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555571.867454; Mon, 26 Jun 2023 14:44:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDnSY-0006WX-Ep; Mon, 26 Jun 2023 14:44:54 +0000
Received: by outflank-mailman (input) for mailman id 555571;
 Mon, 26 Jun 2023 14:44:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCbL=CO=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qDnSX-0006WP-3o
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 14:44:53 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2057.outbound.protection.outlook.com [40.107.7.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01ece363-1430-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 16:44:52 +0200 (CEST)
Received: from DB7PR05CA0010.eurprd05.prod.outlook.com (2603:10a6:10:36::23)
 by DB9PR08MB8740.eurprd08.prod.outlook.com (2603:10a6:10:3d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 14:44:22 +0000
Received: from DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::5f) by DB7PR05CA0010.outlook.office365.com
 (2603:10a6:10:36::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Mon, 26 Jun 2023 14:44:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT065.mail.protection.outlook.com (100.127.142.147) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.15 via Frontend Transport; Mon, 26 Jun 2023 14:44:22 +0000
Received: ("Tessian outbound d6c4ee3ba1eb:v142");
 Mon, 26 Jun 2023 14:44:22 +0000
Received: from 9fa633d52cb4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F15CC4D9-D045-4117-8A85-C3103FBE5F35.1; 
 Mon, 26 Jun 2023 14:44:16 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9fa633d52cb4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Jun 2023 14:44:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBAPR08MB5687.eurprd08.prod.outlook.com (2603:10a6:10:1b1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 14:44:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%7]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 14:44:13 +0000
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
X-Inumbo-ID: 01ece363-1430-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6opY+aZQujdikmovOWyStccBto0lwrAnsqxf0G6S40=;
 b=1AmRk0GdjMlZ/Kjxzc6kJQnBgMQQFgeNRHWHcPhS+JPExM2OJOoaN8wUmz8pZY7efvHAs5dvAek/PS/2tvaK9bOy4k1PwhOD9NhnezuSdsi87eV4CyS9EOughgEGT6KMp5DQ+NdGtJTHHr1Alxdvn7GFN5Y7cB7/5MwFlFvMh/g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YeAyZyfmpekO8W5RPZ5SAvyRYoQch5k+DohO0gGo+MPh/DemgMG+XtpBlEGE7oQ6tOZYvz91C5VSsoKe718piHumss5HsYpzXlmx1kG4iZMZHu3QW5l8BtVac0wFNacw+e2k/8DBYHsqDZPwQdCPdzsJ4OehoZiH9WnPqB3msT94eXajimP0i4zuIioTCN+ivC70Z2aEoBKmHuvnZGGNoZXfIaSxWYo2DybtrtBxL7ZCsOs3bTGfECK+22fakK3xxdjpkdTelrc8ATBqFOKkt58Rf2JBTOWw2rd0cdwU+KQbYb87BRRoT+x6iXq/RaX5bVnVXt+RaDHC06NwN7LPwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6opY+aZQujdikmovOWyStccBto0lwrAnsqxf0G6S40=;
 b=Q3KKdm3xWLIIXju26Dussb+VI4AR7vrxDI6wJVLPbJLyyrOntsCtvBA8xKUSGWyIJKYIxgKZ1HQlHRAnfKw72HJcJYCJEzVRuKjVc7L/4sL54Z11YWIE5esWTaFMekWgUTvxHlcf7VmvlgYyHgNZg8L/tocLFv/tvd/uXNIkqgrhk6QpaBCOymUBAkYeddJ4MJXQgPZQBbzrbMPRxQCKhCD+kZaqkptrz3uMpmGTzRbSiHh6ZcCzo4nqPbNIzj5I9J+LwPSV+4IBwCIRkGKDrQ2desrDHIcQE6u+a4MgjhdyQRmoWbXILflblX0x8Cw32X18hi/3oNbT14TALOWdhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6opY+aZQujdikmovOWyStccBto0lwrAnsqxf0G6S40=;
 b=1AmRk0GdjMlZ/Kjxzc6kJQnBgMQQFgeNRHWHcPhS+JPExM2OJOoaN8wUmz8pZY7efvHAs5dvAek/PS/2tvaK9bOy4k1PwhOD9NhnezuSdsi87eV4CyS9EOughgEGT6KMp5DQ+NdGtJTHHr1Alxdvn7GFN5Y7cB7/5MwFlFvMh/g=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 7/9] xen/arm64: head: Rework PRINT() to work when the
 string is not withing +/- 1MB
Thread-Topic: [PATCH 7/9] xen/arm64: head: Rework PRINT() to work when the
 string is not withing +/- 1MB
Thread-Index: AQHZp6aOU3BIgupHiUmzMkZr6l2qFK+dKdeQ
Date: Mon, 26 Jun 2023 14:44:13 +0000
Message-ID:
 <AS8PR08MB7991E205EBD09EF5C49033B99226A@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-8-julien@xen.org>
In-Reply-To: <20230625204907.57291-8-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 551957A0D23DA64FA46C0F9B6DCD8076.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DBAPR08MB5687:EE_|DBAEUR03FT065:EE_|DB9PR08MB8740:EE_
X-MS-Office365-Filtering-Correlation-Id: ffc27e41-2184-488c-7a27-08db7653d476
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 h/0F3ib1TEqqsXNiGduTWH8e+M+o4szJESe/iJhwli6eYwEPC4vYiZ3IYI1GdlXpFBSJUeiuASzotUDrh26Rq5BFfMuUm6PY9KzOKLaTGuwOfP2jcn9yP2D7T5hiPqiLjoFkK2Vv8cVNT+owVMD8Q2HB+VXCJvTeFl6ThaTt76dgi2eZ+FdZHc9I8dht6HUx2G8qzIxOwylyNtrqsNyveyAAKgdl1MuDTiL6VY/uFY/fmG6IWcoG/2QEqtZrar+xpzP2qBQyi8jrqnyPdrLfruF3mV/Y1RroCiKeVT3kkzGihazj2Y139qIaRetHaFy9sgB1ln8mVe50eLG/h5ZjAZVMldCjNU6nHawSMDkq9lw0wy4Mb0lQpYvWIUuLlSDS2DlYn3foC8gUaAUilmYdKAe+Egw2k1ks2KV5uQAOeYgTWxNGCc8gMjvekRHBA0beeaGYLNOaB6F36eUbH5ZF1xUOIbpWX1r3VHyXecoH2Xo5vl3KQSHbhHmC5XNewhILNGoR1QbV25xaNuefW3oJ6PWzeDvH8xPGeCzGU476vS3yfLg9qjvsbO69t/enYnBCo/A2Et97a9PntdMRCFLqNVTB6gpTAfpDt2DaTWFSI8jA1DKgsR8C/tRu86TYEgve
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39850400004)(366004)(376002)(451199021)(9686003)(478600001)(7696005)(71200400001)(54906003)(110136005)(83380400001)(26005)(186003)(6506007)(66446008)(2906002)(4744005)(5660300002)(52536014)(33656002)(38100700002)(122000001)(4326008)(66946007)(55016003)(76116006)(316002)(86362001)(8936002)(8676002)(41300700001)(66556008)(64756008)(66476007)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5687
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b2d4e54f-a722-4632-c938-08db7653cf7a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d2HqDS5eq+qnjJns1/3S0gBT6PMVpOtBYc0yuilc/BM1TqPfvSAkH3zrI76Ohv5i0ojZErsdklX1BzB/l1nDR7tCDwWJivwtQ0lEJTxjK9Sjd9N+MPnJhEFtGS036RVj8VNqBdrB4RXNGRnGAHEdDb15O6ytVE40ZBfCEeK+E+YzR96Ff/E5grRwq17UAlUQ00qaiOKX7+Rloy8yBnmhnu6dmPrg/QHz9/qSdfQgHnWF5Ddxi0osITMOiCj9FtpzmWgoawJHz/xHld5TbrKYb5EqwwlZjuoXx5bd87hGjhDzBxdv+nICtNIejfm3jm+RBc3tNprNnnZvUDVYyydic3Rc5gh+PUJJ02QQF3l3i5StHDBF3bz2OeEqTHhmGZTpLNxkYOYczGFdvxaOJx7R6CywEixkvhuB8bFeIH4nYMBEN/HMJNXN4Wb73qcnY2HIPTOEpkgrqVICxT421gVgPc1/wjtHp0svoH/U2HHXzmbcaIivRnAJ/TXDuFnBsOQ8DIXW6Z9+7Kv1AOH7Z9TUWCYd4+KwY5LXxqVU/hNnzwG5y3WiMsNTbcvgJS1ZTiCa859TeYYnnd2pCCrF3D3EUswUWYQX7QMQl0Exrvg+NcmO2PDfd1/E0UcZ82KZktjQxFoieiD8jh9Ho/d22SJDUuX9wNbTPxQbhBO2MDDicENeyR/QA81Ug9VoE+PIxawn6bcH4jaGFlM6iLtL9ze1F9iZOhdWectMrjCWojfC/+4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199021)(46966006)(36840700001)(40470700004)(2906002)(4744005)(7696005)(82310400005)(107886003)(356005)(81166007)(82740400003)(83380400001)(336012)(6506007)(26005)(47076005)(9686003)(186003)(36860700001)(55016003)(40480700001)(40460700003)(41300700001)(110136005)(54906003)(86362001)(478600001)(316002)(70206006)(4326008)(33656002)(70586007)(5660300002)(52536014)(8676002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 14:44:22.1954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc27e41-2184-488c-7a27-08db7653d476
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8740

Hi Julien,

> -----Original Message-----
> Subject: [PATCH 7/9] xen/arm64: head: Rework PRINT() to work when the
> string is not withing +/- 1MB
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> The instruction ADR is able to load an address of a symbol that is
> within the range +/- 1 MB of the instruction.
>=20
> While today Xen is quite small (~1MB), it could grow up to 2MB in the
> current setup. So there is no guarantee that the instruction can
> load the string address (stored in rodata).
>=20
> So replace the instruction ADR with the pseudo-instruction ADR_L
> which is able to handle symbol within the range +/- 4GB.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

