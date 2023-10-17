Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BB47CB7E4
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 03:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617992.961192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsYfQ-0001hF-Mv; Tue, 17 Oct 2023 01:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617992.961192; Tue, 17 Oct 2023 01:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsYfQ-0001eP-Jm; Tue, 17 Oct 2023 01:14:40 +0000
Received: by outflank-mailman (input) for mailman id 617992;
 Tue, 17 Oct 2023 01:14:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qhkS=F7=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qsYfP-0000ji-N0
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 01:14:39 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe13::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8883c935-6c8a-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 03:14:35 +0200 (CEST)
Received: from AS9PR07CA0054.eurprd07.prod.outlook.com (2603:10a6:20b:46b::13)
 by AS8PR08MB9954.eurprd08.prod.outlook.com (2603:10a6:20b:638::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 01:14:31 +0000
Received: from AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46b:cafe::74) by AS9PR07CA0054.outlook.office365.com
 (2603:10a6:20b:46b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.18 via Frontend
 Transport; Tue, 17 Oct 2023 01:14:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT063.mail.protection.outlook.com (100.127.140.221) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Tue, 17 Oct 2023 01:14:30 +0000
Received: ("Tessian outbound d219f9a4f5c9:v211");
 Tue, 17 Oct 2023 01:14:30 +0000
Received: from 6df375bc8753.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4043F12C-6567-448B-956A-FCD60F7C6EDC.1; 
 Tue, 17 Oct 2023 01:14:24 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6df375bc8753.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Oct 2023 01:14:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB7380.eurprd08.prod.outlook.com (2603:10a6:150:24::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 01:14:22 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 01:14:22 +0000
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
X-Inumbo-ID: 8883c935-6c8a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cowd0ncFKjvWfwsNYKO8XD1DItcTWeYZVLf8QqI864=;
 b=yMdTtG1WGXUUpkVebTvHpBJDq8AyNlzQ3ZqIQ+Hb7wmVF551SJuIcEBHIFsXmC89ya0UD3udhT4jiPwyrBGKtDNn8DLZJDyAL3LDuWlcsCTZkCifWFD8MpyFwfaDskdigwUrjsUHoo+F+9YUa5Qn8gapekESsog7abeIGyodHig=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 76654382fd94d443
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDnO5D3Ib/p04FKyNsa/Cl+WhqxRf0Z0Qu8P8r5NbjJjHYz6pDirpTfo61PyCeD2JBkLl2L3WS9xE6WKv/mU4x3pQKEazwtcdpXPqDlfTQE0pm3ZZzbHrYZSYsrif3z9S8OTSaI5mZoHenCIiESRqYfTL5mCdwBcz56YAQwbLlq+NVsaVjdr9s8f7lUutlP8dyS/9rbYe62fGy46+ltiy5ojHgECJOgNrUgMD50H+IfphLtogEQ4d+nfsOBY2vbF9+I7544gfKHXF6Lthaqh+CtLWP1tz5vUTy19EczPvVlb+CVVE9WPTnZTKugkbF5EOBH2SgNbekCX79ACsSvKRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cowd0ncFKjvWfwsNYKO8XD1DItcTWeYZVLf8QqI864=;
 b=jsYoCpHwwia2Nq+jI+7oni3O93s1koFvVORsxFn8y/HBkicsiGa002Gevv7ypSq6X7pHPSIiIba9vHUTtzdcS6YAw14jILi22iRaCRfXGo8XdGwMuNGQI8XtaYOn/t7R9DWgdIH0D5O0rLBIARopejj82tBxyf7eqc49Qs2F58hyWYK8ETrgl216mjPY68aRK3pL1OT3YPpfAQRoIjXUjpeTkEx/kjZF4QcdnnLv/kGKnxwz10QMGqBQgAfEc63jwpdNSwrsJI9wAhCA2tekjG1ZHI1PXmXIeNRRiRZ9SM0kuRgw+MJ6ctTEVyOaHKUck3MpHMgWWcSaaiJU91TWPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cowd0ncFKjvWfwsNYKO8XD1DItcTWeYZVLf8QqI864=;
 b=yMdTtG1WGXUUpkVebTvHpBJDq8AyNlzQ3ZqIQ+Hb7wmVF551SJuIcEBHIFsXmC89ya0UD3udhT4jiPwyrBGKtDNn8DLZJDyAL3LDuWlcsCTZkCifWFD8MpyFwfaDskdigwUrjsUHoo+F+9YUa5Qn8gapekESsog7abeIGyodHig=
From: Henry Wang <Henry.Wang@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>, Xen-users
	<xen-users@lists.xenproject.org>, "xen-announce@lists.xenproject.org"
	<xen-announce@lists.xenproject.org>
CC: Community Manager <community.manager@xenproject.org>
Subject: Xen 4.18 rc3
Thread-Topic: Xen 4.18 rc3
Thread-Index: AQHaAJdC+jR+lkuHjEaiAi7ivmmoQg==
Date: Tue, 17 Oct 2023 01:14:22 +0000
Message-ID: <9D3774C3-16CA-4F37-B9E9-470BE98D8C76@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB7380:EE_|AM7EUR03FT063:EE_|AS8PR08MB9954:EE_
X-MS-Office365-Filtering-Correlation-Id: f8885c79-6dc2-4ed4-17d4-08dbceae6a79
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7xWGcWawEZ9/R9p6MxbN4n1/DxQLBSwRrv8ckfAKnJW9vCW/AiaViihCRVDKdT7+6d42zmNO9hWuOhdmUV+3viE4/5Jsw/4AHJaTJ0f6+nQ2XEEWoU/GTjGxgefnKOMwoUTiIoB61Q25JCmX0Se3dyomUpqrXbPX20ziqGmxSL8TN9M/3HpmmQEQO82zR6Df9fwjT8yGeSI9pzp9GLqimtIrI5hDxCxV3sEOamZnAZwHYE9jeojhzfMxH6RNQxe8ZcoY/JcRAlmuWDQLtaNhfWUqGWkIbvNay0raFj9Owfs96VWnvGSMBP2uqmZnQ+FQx73MdIt1aaQpznSLF1EslanVRfaPoxHSkgKeU3VPIgv6pBGzsHpMKqFb17Lb2VtAuZNYonjFNuh1QMIk/fPNYarrp3LiJHZ/0Hr79glvbqzacTaGFPNdFi8DMZV25osJf/u7IN68/b0DXHGzN7qpzJlVdf+4K8P2h3weCNYQHk15hCMJAfJB9K5CMNXpFpRmkoGYs/Z33oGqRhenojoCuZLj8H9JMEqDaCY9wOFhWC50DkmYK1M9Ww/NXN9PEgiI7bcjG0oFo3iu/SJ5Cc9k72/K62PMPflFMW77tkrt1eiUiylmv4RAQw1a2A/Yhfib
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(346002)(366004)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(478600001)(66476007)(966005)(91956017)(6486002)(66556008)(110136005)(76116006)(66946007)(64756008)(66446008)(71200400001)(26005)(6506007)(41300700001)(2616005)(6512007)(8936002)(8676002)(7116003)(2906002)(4326008)(4744005)(5660300002)(38070700005)(36756003)(33656002)(122000001)(86362001)(83380400001)(38100700002)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9D5FB088339BC04693732B2F9B8D4642@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7380
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d1c31631-4f4a-44a6-a304-08dbceae6553
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dAix/eiytP6VbK+XFkiIIt9H/9JrqnlesmAssWw967X6wDpjlrUbWLiwryp2shDwd2epJMceDW036iZhxhOFk523V+Fo9ib94RBnLgBI6p5TrSN2I1Bu2/1vdvRsk7dlg3ZZtd2kJ2bckIHZuLJ6+Jp3BB35hhQdI2/IHX10QbWMFlHJI3Xds/mBogL+6fH3NqHF/jZAxEieTOiYumIAqEP/UOVF09Mce3vEsjZ6v74oC+Mg/mE3xvtPk427hKVNh0S9Oqc/94LK4EjPrHib/OaAkPoAZ00F/0ogvqqwCUfvzjFY/Zd7fl6edaj0we7Ta+MXuiZMvXqjXq7faYNSxlR8aQkt/HO9+spwdwSaACtKjvylD52sLf5EbdNcnyYdDdW8MZOiuX3ybn4Cr6qAvP/4UC37df4/XzxYmuBYtXFMCQwx+GzjhqCFR6Bv1TSw90Oxdcki/nHl+XVvF8CqqkdEXxh+MNXSxRAMBvI9AhXImxMfY4tayS4eNH3fdYf9MturbvIf07GJ2PAZz9cEdqft5RT/5mt3WlXkR94W5auupLYK1Qa4Lwgj8IRwmtcr8KGlGNMOk1+n5GxFBtTo7WVLboB6Wxn1Igi7oeDntUL+bHQhDTkyEosUoO7Ondcd8xqaNKeLCOhAKav8aU9dE16IT21sJaw1qYKoG/T462QlVM0bssUPDs0m+Wk3eIQpUkNuh5n1hoFkbZwAZ3BrW6BTJL+VZZw/CyiVYjiFxvc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(1800799009)(82310400011)(186009)(64100799003)(451199024)(40470700004)(46966006)(36840700001)(86362001)(40480700001)(36756003)(33656002)(40460700003)(316002)(110136005)(70586007)(70206006)(450100002)(82740400003)(81166007)(356005)(83380400001)(36860700001)(47076005)(336012)(2616005)(26005)(6512007)(6506007)(4744005)(2906002)(6486002)(8936002)(966005)(478600001)(41300700001)(5660300002)(7116003)(8676002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 01:14:30.7915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8885c79-6dc2-4ed4-17d4-08dbceae6a79
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9954

Hi all,

Xen 4.18 rc3 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.18.0-rc3

For your convenience there is also a tarball at:
https://downloads.xenproject.org/release/xen/4.18.0-rc3/xen-4.18.0-rc3.tar.=
gz

And the signature is at:
https://downloads.xenproject.org/release/xen/4.18.0-rc3/xen-4.18.0-rc3.tar.=
gz.sig

Please send bug reports and test reports to xen-devel@lists.xenproject.org.
When sending bug reports, please CC relevant maintainers and me
(Henry.Wang@arm.com).

Kind regards,
Henry

