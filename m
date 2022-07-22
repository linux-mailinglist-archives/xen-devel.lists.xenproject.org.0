Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E31E57E062
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 13:02:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373139.605220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEqQc-00019s-Pc; Fri, 22 Jul 2022 11:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373139.605220; Fri, 22 Jul 2022 11:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEqQc-00017i-MB; Fri, 22 Jul 2022 11:02:42 +0000
Received: by outflank-mailman (input) for mailman id 373139;
 Fri, 22 Jul 2022 11:02:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sdc0=X3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oEqQb-00017Y-4X
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 11:02:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80047.outbound.protection.outlook.com [40.107.8.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd0ca2e2-09ad-11ed-924f-1f966e50362f;
 Fri, 22 Jul 2022 13:02:39 +0200 (CEST)
Received: from AM5PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:206:1::37)
 by DU0PR08MB7691.eurprd08.prod.outlook.com (2603:10a6:10:3a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 11:02:37 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::d6) by AM5PR04CA0024.outlook.office365.com
 (2603:10a6:206:1::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Fri, 22 Jul 2022 11:02:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Fri, 22 Jul 2022 11:02:36 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Fri, 22 Jul 2022 11:02:35 +0000
Received: from 1d8fd92e7151.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6050D417-A8A9-4D2A-A51D-BD2F04DDD32A.1; 
 Fri, 22 Jul 2022 11:02:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1d8fd92e7151.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 22 Jul 2022 11:02:29 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by DB7PR08MB3260.eurprd08.prod.outlook.com (2603:10a6:5:21::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 11:02:22 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5458.019; Fri, 22 Jul 2022
 11:02:22 +0000
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
X-Inumbo-ID: cd0ca2e2-09ad-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ND9BgXrNXqHDK95rnMISPLnNh79GtRJOTme44xhrb0ah1wrC/aAkCB9cbo96Y+mKdzBfBU0krDiKtuGBkl7OW9fNPLwoNewVQ0inZb9BPV7zx5Wm9KTJMXAUhYjF9MyjYenQ4QgbKiIhuuQv1ivLoLH1MSvgCtavDXbENCl3hoUla5vFTD6x8fwVvG0j3BeEljVkQ95V5taCYk/jeGLtYUb3yb5kuhTKVH9JoIbVPSAmlEh/+upA/BTNqQkNLy4iifAP7UOYoYwEK2L3Bggq97yVpYlXFMxnvDQEZ30wQobCbB0OYi1i1diUAcAyDw0zzVq9UrZHn+QZde+w2MpqJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4LYNAiJxauD9PPon6uI0OXhD+Qp4Tq+euSXLKEgZi0=;
 b=Y4BwKSaFcipvjPyWTzaYHy6H3WI36oerrBmiSq2BUzgBoJ9WpL6qbiXhRSxubkOcFiy7CLzO3CT7GeBfd/tdsCFEj/W1gB9+BrWDiiNLdFgWP7ydty57p18tQ+bpi+JsSRudcioZZ2eshhS7h6M7+t/zjKwwvR0DReqNqi+hh0qHKXvy+eDJXovfdLDHUV/2tfOSCHK/kcNdcP/ejvQiKn6UrWNcfDeaMMwtklUeiA9sJ0qp2hcRh5nsLcpgQDsrZy7it46oxeVaDJMoqO8XlDXkcvInFrFXHsEfVt2auFEtPuO4EcIqkSW2uKg16AChJjaF8KH/BPEhWHbEU8dSjA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4LYNAiJxauD9PPon6uI0OXhD+Qp4Tq+euSXLKEgZi0=;
 b=2UhNpcmt/rNeBk7z2laeXeNqgtdy1E96ydapHM22LAZLAaLQBdpiMbTBM+J2Mv3vFptVfK+1UyaMXc4gcw4CLz9hLLwTtrY9zLA2/+T2hpM92rMiQxkOUsGFG35lh6XJICswZJRKRvBdBlU5ZDJRY7xCB9es6OeOOpM0y1HVw1o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ee6d01aca74e9f3e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=efWUiu1GjxquQwmtIw3W7J6UUHeo8iITZxYaU0OmPNPDv6+jZBdhAgIKf37Us3uh4w7RU7zsH1uJlmTuq6xYR9Wz5z53ApJnoRPaEznoi+Is1NJXmUNLUbxBCWFjPktX7RRUVxhGVGOU/M23WtnRfn1nc67uj5TPBQyvyhbOBBoIE4g7U7Wo0g5pbmu1Xu47ZZoR+NQ9QjO9l7c+T2k7lUU8eKvQWa3isHN37F2m7NobZmFlFT9oIoD18nBeBpqe4zGuFbCF1C5ZrSNmuapQgwz+xKbtC7RhL+e1WG9vby8EuW7vjO/HOPdRDI4xK8CtfkscMz1ZU7Tig98TWZ9wEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4LYNAiJxauD9PPon6uI0OXhD+Qp4Tq+euSXLKEgZi0=;
 b=WUei4b1o4TvkAue0eSTc06mDToX6LidkvLrfnEgXCu7zyC5zB5aN3hoSPy5BXOLiaoxhyQVB6LDyCqaEh+Dpm1M9m9relNqwIsoMbIDBp2fhRu9+sIiTc0X/4LUOD0E0Sppg1dx2hH/Q6ILnie7ONVZe1RBkEB6PtFefEPAVI72eSR4+EfaGw/LEjQSXjRBEfwoMOmHMyxro2sf9icehjnYx/kL2DnBDMGwFX8Osi1IwbQ6mS02ebUlsCv+uRVV4tomwfaerX1AJG5gK37nUQvk64moCLKutB1QvhnZQQb3X+bh0RQQtaGCR+8UkDhcnygrnYa8PJf9vbXOj+I93KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4LYNAiJxauD9PPon6uI0OXhD+Qp4Tq+euSXLKEgZi0=;
 b=2UhNpcmt/rNeBk7z2laeXeNqgtdy1E96ydapHM22LAZLAaLQBdpiMbTBM+J2Mv3vFptVfK+1UyaMXc4gcw4CLz9hLLwTtrY9zLA2/+T2hpM92rMiQxkOUsGFG35lh6XJICswZJRKRvBdBlU5ZDJRY7xCB9es6OeOOpM0y1HVw1o=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH v3 07/25] tools/hotplug: cleanup Makefiles
Thread-Topic: [XEN PATCH v3 07/25] tools/hotplug: cleanup Makefiles
Thread-Index: AQHYh+Q6qu+KWis5mUCexJRiIhEBa62KZT+A
Date: Fri, 22 Jul 2022 11:02:22 +0000
Message-ID: <B6441EC0-1D46-43B7-9332-F3B60D912EB0@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-8-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-8-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1f6ccaab-1147-4eea-1709-08da6bd1af71
x-ms-traffictypediagnostic:
	DB7PR08MB3260:EE_|VE1EUR03FT037:EE_|DU0PR08MB7691:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7MyA+qrxkG3FGH0uft95o3bVujzyDGoIxDprb/eK537KOHgRAMXfLqhB8ncgPRLjhAJJFaz8pdGJFb/3JSNTReSHs/aCTFl0JTT5Yb4zNyTPA0lehB8R/1d5Qtss0y/krDN5JxqLR4oIEyHf/ENZlgrBe2hgbqJk5xgvfd0y8/yao6nUfRRmmFDDyQrkuve5LNXsV4uHFfHbFDA+Ku1wRoOmRK9V/iwC8jkMZTM4EAzgZ49UqUmfW50SAsXgDdw7UxX0Zwufsnm7nk8p0MxWRAkW4AATJt9+wKohzaBOvyavrIxuipee2IofoCBQ79N9BzHLahcjBBoVn0J5VpvoW930QOyxdP6axonsT9kJkU9KSKRj5TzgAHqxFxFKg4PQHKWhjs1zdgCpJOVjTuJaiBhw5zZNd+ah1h83LQIHJd/UTt8J37R14B++dWxLeZUJG0gDbp2rve5CGJuB5zMWs66VXzFhrW2VRtho044r3CsZIeQV/lnI5Z1Ug8l6Ugac802Aiq5T9FosVz0Ag+C52kCBHvA3croKsQ3xqzf8ny/Cz++yAj/ems44a/JGo06zjhsNgo+O+15o5/jjVdGKg9wigalYTDl0tqSXOOgf5LNhjBgM/E1c+C0G/0Tu8wqGQZOxy7xtxduRbJxFtw8LcMYx+FTPpBsCCTLBzAaKuQVCDszNSadj2rvuDehy7x1KmemxSk8BYQAA+rQLrx6G+LNrr3NCLiGjb/gsulv/a5dd1jmWBzF5PyF7PikwN8uKSkzhYLvy+7F4dLCcD12ca0vzRskb1UMOKo0ievZnZY9Otmekz5SrZ7BoaW21WDABWBZ7dXCGe5VPMze8y0DVZA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(33656002)(122000001)(36756003)(5660300002)(8936002)(38100700002)(2616005)(83380400001)(38070700005)(186003)(86362001)(6506007)(478600001)(71200400001)(6486002)(91956017)(41300700001)(6512007)(316002)(54906003)(26005)(6916009)(8676002)(66556008)(66946007)(76116006)(66476007)(64756008)(66446008)(53546011)(2906002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D121ED76A0E2A24CB309CDAEB2BFB231@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3260
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4b661a14-d679-464c-3fbe-08da6bd1a733
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7uVTZAz0zwlxNilMN1wOuqi56GdFywSSah2p5ADiJ7nbsez7MSSYbJ8uAZp8nHeyjQK6On+2cMp44TrG2RF8+Zcjlb/wiov8GVmEUikhW2OEmxdYGGf84IFC3s86s3TTeWi7KNIdmK++9t5TycnDb0FO3sw0UMi5rB1gjYWk89j4IkBSBHVDqHowx0qspkPp4t9wA7qGtt+aPUWJ8TEca81luWMjTWutQda0Ek/WakMIT8TP27U3R3ZrJSWlfbcrjl/Z9Xs6Dl21cgwrFC1k9SIWMCo/lNKoPLXPe5Hu8cF8awgUfr3oj1QdcJUP0bbM+fMZ037GnEfm33PujWeGO+8+RYdCKVpOeudd9yHpJGCILdFHBdudsCRvczu33t2Lrv/+rfHivhOHBaqq3QKTjK9xKkgMK7JBZvUXuzrxV92JA+YKKSj/mBth6+zAfLQYISOu2InLZEi5Pl/Z6a55Dlv5qFXo26UlzSSQUIVdQCBPqgAZa8iqLMCwknq90um0VjajN55OBc3F9kIs0F2/oX8W2Hs2KsdxD5GX2c31zbHUR4hB+vofzF6CRnKRN7fDaNf+w76nfRDhgoi2ufRKSxOcW6MjnTKYGXS9B9cXFYaBVBS7ah/mtcm3QD4jVT/88YaueJzwNQm9tCT3xnmBrfIwRy7JBToeG16a5J4PmF1BO5MEzSr1V3vOshK/8HXuVyiULCfrrTwVqRXSfYa9AY1LJlU78P7gMLiKtayH3x321XcPyKbb0cpx0+u7L0Gnr6j6FZN4nik2y/W5guZ1qQ0bFzv60iPnYvPkDEIgYR2K8GupYc78J+doILgD60smbbDmWAOxaCT4N8dj2nu2Of4DlXIG1tSzQxAkZE2SYG0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(346002)(136003)(46966006)(36840700001)(40470700004)(6862004)(478600001)(316002)(6486002)(86362001)(36860700001)(5660300002)(36756003)(8936002)(70206006)(70586007)(8676002)(41300700001)(47076005)(26005)(53546011)(33656002)(2616005)(40480700001)(81166007)(336012)(6506007)(4326008)(83380400001)(356005)(82740400003)(40460700003)(54906003)(6512007)(2906002)(82310400005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 11:02:36.0857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f6ccaab-1147-4eea-1709-08da6bd1af71
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7691



> On 24 Jun 2022, at 17:04, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> Remove "build" targets.
>=20
> Use simply expanded variables when recursively expanded variable
> aren't needed. (Use ":=3D" instead of "=3D".)
>=20
> Don't check if a directory already exist when installing, just create
> it.
>=20
> Fix $(HOTPLUGPATH), it shouldn't have any double-quote.
>=20
> Some reindentation.
>=20
> FreeBSD, "hotplugpath.sh" is already installed by common/.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Hi Antony,

> ---
> tools/hotplug/FreeBSD/Makefile       | 11 +++--------
> tools/hotplug/Linux/Makefile         | 16 ++++++----------
> tools/hotplug/Linux/systemd/Makefile | 16 +++++++---------
> tools/hotplug/NetBSD/Makefile        |  9 +++------
> tools/hotplug/common/Makefile        | 16 ++++++----------
> 5 files changed, 25 insertions(+), 43 deletions(-)
>=20
> diff --git a/tools/hotplug/FreeBSD/Makefile b/tools/hotplug/FreeBSD/Makef=
ile
> index de9928cd86..a6552c9884 100644
> --- a/tools/hotplug/FreeBSD/Makefile
> +++ b/tools/hotplug/FreeBSD/Makefile
> @@ -2,18 +2,15 @@ XEN_ROOT =3D $(CURDIR)/../../..
> include $(XEN_ROOT)/tools/Rules.mk
>=20
> # Xen script dir and scripts to go there.
> -XEN_SCRIPTS =3D vif-bridge block
> +XEN_SCRIPTS :=3D vif-bridge block
>=20
> -XEN_SCRIPT_DATA =3D
> +XEN_SCRIPT_DATA :=3D

Here (and also in NetBSD) the variable is empty, why are we keeping them
and the related code? Is it to keep a certain structure?

However the changes works and looks good to me, so your choice if it needs
to be addressed or not

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



