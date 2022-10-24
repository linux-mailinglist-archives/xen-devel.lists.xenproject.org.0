Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5877060AE71
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 17:00:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429195.680071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omyvh-0004Ue-Nr; Mon, 24 Oct 2022 14:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429195.680071; Mon, 24 Oct 2022 14:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omyvh-0004Sq-KO; Mon, 24 Oct 2022 14:59:53 +0000
Received: by outflank-mailman (input) for mailman id 429195;
 Mon, 24 Oct 2022 14:59:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=akEN=2Z=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1omyvg-0004Sk-Jq
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 14:59:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70040.outbound.protection.outlook.com [40.107.7.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81fc1f7d-53ac-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 16:59:50 +0200 (CEST)
Received: from DBBPR09CA0011.eurprd09.prod.outlook.com (2603:10a6:10:c0::23)
 by PAXPR08MB6749.eurprd08.prod.outlook.com (2603:10a6:102:13d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 14:59:45 +0000
Received: from DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::b5) by DBBPR09CA0011.outlook.office365.com
 (2603:10a6:10:c0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16 via Frontend
 Transport; Mon, 24 Oct 2022 14:59:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT035.mail.protection.outlook.com (100.127.142.136) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.19 via Frontend Transport; Mon, 24 Oct 2022 14:59:44 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Mon, 24 Oct 2022 14:59:44 +0000
Received: from c1c0b63ad1b5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0EF06B90-D7D0-4564-B945-64E9FC9A90AA.1; 
 Mon, 24 Oct 2022 14:59:33 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c1c0b63ad1b5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Oct 2022 14:59:33 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by DU0PR08MB7691.eurprd08.prod.outlook.com (2603:10a6:10:3a5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 14:59:31 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef%7]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 14:59:30 +0000
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
X-Inumbo-ID: 81fc1f7d-53ac-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=oJq1LyYmPA0ZBXDTSdml/fGfU87+yDbKKG4fMnoi7Z4Q1blckXcwNKjJHKBoMRMJ1fscdV2XntW2milBOfXVWHnggLFspp2BU6YRrHmdG4ORpqqn0AxkwxdBwSU6AM8srZyzaNB5pnvApTrwdMXWDkUWgnyVOufJlERm7xqkC2/117C8dmbtoKiOWqSTlOADqvubmTUPuqGw+hnr2Tw/s+bFdUzJrsZN5TBfYAP2ATlfPQgptq6EN59UM7UpuO4Bwx79UBwotrq7ySevzSEW0raGsIIQ9e0JnufMb/D2VMmdzMTPt8CGPOVs7/Zdn1YrGiKEoX2hrP6UDNZK/u2WFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRldwzwg/dN/KKy0HYQfQI789UQ5QZ5brzYGi/rfunE=;
 b=QShvns8NJgy39qvPCfkKZvqu14oRH2/tPjtQWha7TV5uivNBwDBGkamLTIzYacNpExfr9DC5D4Jx9si2Di/QPZfGe9bcCc0XidntD1Zw6ag2qwflY5ggDkqYNTVAS8LshsfAXPQZ5wHtaXSrXXlroRXc4gE0eA+adOVo2hEmjT14sDHqUMoA+3Zy+Ep8g/oS8MFZ+MvYoQ0KFy9tyGDPges527vcJYIGCmAjemqUsP6NsOzr/3CF3NQEG9Xp7pNhHHRveHHjMvyKkwy5BXibAMpESWoX8imMdhpsc53838kl8EdrgIRjZ5PQ4T7MbGlfBuylXbRc+pPJhNe6938KjQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRldwzwg/dN/KKy0HYQfQI789UQ5QZ5brzYGi/rfunE=;
 b=z7dY+2fZtAWig0Tya/JOFsTKy4sg9r9Pae1coJXsGmbIPKqkUL8wPLyJtzcCz6CR/KU1QN2FEiAKJ4YIDOpKe5ox7bG3cSqmmrh8YaSRSKpFdGZbJ1LigUuvoK8a5WThWbP2oMVRXlqMWmCr8JTuMtibZwhA+jIOwSONAqF+IPE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1a695eda3ff6bbdf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uk9cU37MkLv1xXgO/tgbpjVCikSrI4TrPTMOWPJNUM+6GQd5dfS8Xch4Wi/lQoveYg6VV0zskfe0GmerM1AtmIzT7k9TnxUzpZX4k53G6sKbiEsHF45e/kmrL2Uj4gtxxix0gg3fYYu9HxzptFn+1WXIWwVqHbRA3R9y8DNxuiUQqoB6Cy3ye2ujTAqPyJo4qR56bI5URlQNILof1d6fPHze5J27XqQ2uVH4LIo12lkqYLFDsUYM60dl8KCBnYHlxtCSxEo7J7Tpb74GzUvro986Qeh5sgd4NGtSG7shosPlJhxaxJpIzXpljFZrKpZvu+YLZ+lC0bfPzp8R+E1S2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRldwzwg/dN/KKy0HYQfQI789UQ5QZ5brzYGi/rfunE=;
 b=E2KJuMd0AIiM0mtvIlekkm0wZo4cVenz9pGiOTSNJ4Xr/Qq8Ukve0tlZGlddN715MvbMSikHtaL/pLwF3qW+sOdpMQzCesoXK6dK13gFL+G8oWCAWRH5sLCWUnS6+smggu/npelw3VsN+AaUlJaLmXP7yd+K+3yyGXDpYqxdo3C1xl0c4p66tlVPrtJGmOlkXGanwUroilcUCeY6a6u3GyBKGHl5Z8VSrQ+5mlBXur3i/l6EPN4srv0OhqdF0MO4Lk0ND4CX3o+j92PNC8+cVgw5spF1VdcXs6S7qBr/9WnoZiFva2BuL7l7t2otvR5aGlDz6HJl3RYK9Nzkx1RyHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRldwzwg/dN/KKy0HYQfQI789UQ5QZ5brzYGi/rfunE=;
 b=z7dY+2fZtAWig0Tya/JOFsTKy4sg9r9Pae1coJXsGmbIPKqkUL8wPLyJtzcCz6CR/KU1QN2FEiAKJ4YIDOpKe5ox7bG3cSqmmrh8YaSRSKpFdGZbJ1LigUuvoK8a5WThWbP2oMVRXlqMWmCr8JTuMtibZwhA+jIOwSONAqF+IPE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	"marco.solieri@minervasys.tech" <marco.solieri@minervasys.tech>,
	"lucmiccio@gmail.com" <lucmiccio@gmail.com>, "carlo.nonato@minervasys.tech"
	<carlo.nonato@minervasys.tech>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC v2 01/12] xen/arm: Clean-up the memory layout
Thread-Topic: [RFC v2 01/12] xen/arm: Clean-up the memory layout
Thread-Index: AQHY5ieonqQkHk83Kkm5zIRZSvwGdq4dph+A
Date: Mon, 24 Oct 2022 14:59:30 +0000
Message-ID: <193111E4-4D06-48AC-89AC-637CFF3DB37B@arm.com>
References: <20221022150422.17707-1-julien@xen.org>
 <20221022150422.17707-2-julien@xen.org>
In-Reply-To: <20221022150422.17707-2-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|DU0PR08MB7691:EE_|DBAEUR03FT035:EE_|PAXPR08MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: dddb08d1-ebca-49d7-4fe3-08dab5d0632a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yLSSZ37HbkETT9l38AvEcd6YvoDJEuguvpSVnbktmkLp0+RZf6CpR7fVeMUa0CCldgVWHoMxtfEgJWRAxbG2TNq4srYZDCsMsljXAKFMYfIq0FtpJYm13J+sRyHxaCN8Iziq0k0DH3nliWJ/AHq5gFMoSXxJcfbiHqE3+ivcQLQW4yW1potD48+k3ls3ZiPELBKsnyRkXYpApuoIzQPFAdm7dPrdKUbE7FMiyfdqMfQhagWgrpe3oF/KYRlQRmibc3IUImyrOHHDqMCb3wcCqtDDRMXMOsC8260ZhbwaIDChW08qnIt/6EFtJpaEhwa7DMGx9Fg9+/zgZO/A1ANfXX/8SY4JFT2Uy/FI+TKgzyjS0Z0uTCrmP9D7Mm96uFfnriyh94E96ASZGjeqfEYC2y3igpXLflXHrr3CbCaWRGJhD1LGCyKi9QjaPJcnpzOOmUJ2ZNQT/kT8Ty+iJI96NBr4mD/4BLFnvv7ZmEnxtyyrpc2estvla8o9OgYL2iu4Ew7tNGUJVsCYuj6ZMloAOW2nE6ugfjKpPjHfhpFWz7S6BDWWqc9bqVriZ/WpAgp6Bf5ACTZK7GvAe5gTrNBE5rkrTGNCJOMMs2OCyMclKi+6K+j4vMyE8LfSPZYZHK1/5rPwSCcch89V8uKUbdWP+JvRwgeFim8zpTml/6PqGvIEpx/UTppghOVMEZs+mdLexGYrACs4IkW3Aybc1BIzjHKb7s6R0tV0UZxhypQ7otuTt7sMgUXy9D/1mAunycE2oQKtsMbjEyvqeRJ+ORIgliz8ME1sNGLMvIHfno5UZUGrl4mFpcJqgURRvzhZ7weHuDjHel386KyCXn+SVZSNOOFymYxZgK69rMZMwlSVAes=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39850400004)(376002)(366004)(451199015)(6916009)(66556008)(33656002)(6486002)(38070700005)(38100700002)(2906002)(478600001)(41300700001)(5660300002)(36756003)(8676002)(4744005)(71200400001)(8936002)(91956017)(76116006)(64756008)(66446008)(66476007)(316002)(4326008)(66946007)(6512007)(186003)(54906003)(2616005)(26005)(122000001)(86362001)(53546011)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6C673C7C9FEE9444905E309EAE30B91D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7691
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	54542097-21b2-44b3-9379-08dab5d05a6e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	712JJWtWGitIDqSb079Fe1jP3cxksu6P1IaxvDNOD7efNU8TjMQYELcTSZgoDN3Vdu/B3WvOvcVsjx8uzyJjhKhbD6lNy9Gv5XVRsz4W0lG/OUb4qg032Bkk9iPRl/UBgoVEmmgbOPADmAiLyNKo75mVHc7ROXMFjNc3P045NbtUMk6oRnArXz+6kF51g4dtyKZfs0+fmv3Bz9Bm3Vpu7papnM14drw/ZJxnvGnd3o7xsotK2SpqMWg0SlMKOD0YBmymWU1VjmYt3NU5BFZOp7ZXTWvwrc0nIoS6ypETrE5S2KdxufcWJ5iNVaTCYpt9oVVBWsf3gbv7FPfSpUMY4hUkwG17DJ4KwNZYbAIarL8dhYMzOgVg4cN9Ec+ILfF5IZr/Lr7AEvWlI2T5rnD4ZiLGTGWBssQsXOy9c5JL4Fi81Fcm3MId1h0U3rffb2O4aBNNbEC7pSeiJ4H/WsGJ+UGgU4W2ZTwoA7By9oNVknz5tFCdanAjEZjw34dDJTguF7/2RgHLjutMGMxai3Wa6/iE7bbkzzbVkk+LnXlA9J6oiBEiqNrNZJP7XyFmQrgVbPV/YgdToK9J77bsxjOln6Xq0Sx+YGjZcMUYxbHEOXrCqqAK0uLhaFUKsZU/ViirPinClCOeJT3HRHXe5zkDHvupv3OQXZ9TD+aUEy5JRIZIkqxxMiplPaa1fgq4zdmwYw55QjPCCZVuq3pGJ9O2B0s2vSgELkwKVrQp5O6C4d36uRxKMnfMyZaQrJyNU3wOZUVyY3mv62xbLob65b7/9A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(107886003)(53546011)(2616005)(6506007)(26005)(6512007)(47076005)(36860700001)(336012)(186003)(2906002)(40460700003)(40480700001)(4744005)(82310400005)(54906003)(6486002)(316002)(478600001)(41300700001)(5660300002)(6862004)(8936002)(70206006)(70586007)(4326008)(8676002)(86362001)(36756003)(33656002)(82740400003)(81166007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 14:59:44.7888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dddb08d1-ebca-49d7-4fe3-08dab5d0632a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6749



> On 22 Oct 2022, at 16:04, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> In a follow-up patch, the base address for the common mappings will
> vary between arm32 and arm64. To avoid any duplication, define
> every mapping in the common region from the previous one.
>=20
> Take the opportunity to add missing *_SIZE for FIXMAP_VIRT_* and
> XEN_VIRT_*.
>=20
> Take the opportunity to add missing *_SIZE for some mappings.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20
> ----
>    Changes in v2:
>        - Use _AT(vaddr_t, ...) to build on 32-bit.
>        - Drop COMMON_VIRT_START
> ---

Hi Julien,

Looks ok for me.

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




