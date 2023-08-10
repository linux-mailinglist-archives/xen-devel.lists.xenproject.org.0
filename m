Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D02777225
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 10:08:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581885.911334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU0it-00078b-BL; Thu, 10 Aug 2023 08:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581885.911334; Thu, 10 Aug 2023 08:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU0it-00075P-8C; Thu, 10 Aug 2023 08:08:47 +0000
Received: by outflank-mailman (input) for mailman id 581885;
 Thu, 10 Aug 2023 08:08:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zCzd=D3=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qU0ir-00075H-TF
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 08:08:45 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18a39fb5-3755-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 10:08:32 +0200 (CEST)
Received: from AS9PR06CA0021.eurprd06.prod.outlook.com (2603:10a6:20b:462::27)
 by GVXPR08MB7751.eurprd08.prod.outlook.com (2603:10a6:150:7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 08:08:39 +0000
Received: from AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:462:cafe::21) by AS9PR06CA0021.outlook.office365.com
 (2603:10a6:20b:462::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 08:08:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT023.mail.protection.outlook.com (100.127.140.73) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.19 via Frontend Transport; Thu, 10 Aug 2023 08:08:39 +0000
Received: ("Tessian outbound f1e964b3a9be:v145");
 Thu, 10 Aug 2023 08:08:39 +0000
Received: from 76bc1988541f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6C664300-1F04-4199-A3BB-820C38645FE2.1; 
 Thu, 10 Aug 2023 08:07:58 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 76bc1988541f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Aug 2023 08:07:58 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB8158.eurprd08.prod.outlook.com (2603:10a6:20b:54f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 08:07:55 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 08:07:55 +0000
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
X-Inumbo-ID: 18a39fb5-3755-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHgmFEnPHnSNPWliSz2PwyHZIWmcUEcvkSFnMNbuE2o=;
 b=ilLL8wC6Qb6qLo9M1JhZPOZAZckOcTVrD+asL9Js6uey7HfnRE12nsSV6jdWneu0N0I1TXWn79EK46oHtTSIy3vglhjV6Fe/NI2AVd3Mboi6dMYSP1NSTuCzQDQpW2mWUEgfu2voipxCWEzdqEYuJ36qW9lwiV4mVSNSZBOGGKU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a41979c26f847496
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KG0tdp4NEnRbcWmVLD5gUrsK/CcG0cXeCm0Sl/o/GUQc2WDWZzoMt+sKWfW0veZJB2qt13EbwzIEpa37oo6RCuxZIzD5WcrZ4Vn2jC0b+gd/Yw9/CcXkxAkQwKiCojV036dnLDpfIIdgMTBSg1jPimvgjMgcdeCwDkpkYrNcYlgySvxqGl5rWxBGQ2wBc6+SCWhjOUy09hAoZ2skkwXUyidepp4wIzS/1wcKvK+op8bzFhyscsXNmGUiR48TX447mfp4dcAxC3YBpSh3GrRXOicwuIDH5c6Gllw9Jhb9wWKn/eKytZlHEDuST+eoM+62DfSWBfJK+8xB/ZyrT+QUKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHgmFEnPHnSNPWliSz2PwyHZIWmcUEcvkSFnMNbuE2o=;
 b=NEcAPw9aUkBgFIJ9gaSUM56RDdlBubXpsTBTKA9zc6JTeyacXMpjerLFBAtAlg1BkVXW7uMvCbAq/V+OMALBqVKyWaykI50PMLfCtThM2QKdGyQBifBSo0456Tlrko//qinOWlruTnh/Y5Qkc177kV2I9d/X6aFHkb7wUKljV7CPt4MrAK9FG27l7X4umUsS4myBYYY1mhh/RprWL8X2tdvWLiZgf78StKY9ZPACqtpOThMj4YZ5J36xyZMekta7q2cRV5xE+L8HNxplcusYWfJDhkcDWG7SLuwNOMc6eXeeLWGooMxPmbUxx0KbzoMJEygIQc7sonia9FX8fB8Exg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHgmFEnPHnSNPWliSz2PwyHZIWmcUEcvkSFnMNbuE2o=;
 b=ilLL8wC6Qb6qLo9M1JhZPOZAZckOcTVrD+asL9Js6uey7HfnRE12nsSV6jdWneu0N0I1TXWn79EK46oHtTSIy3vglhjV6Fe/NI2AVd3Mboi6dMYSP1NSTuCzQDQpW2mWUEgfu2voipxCWEzdqEYuJ36qW9lwiV4mVSNSZBOGGKU=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Penny Zheng <Penny.Zheng@arm.com>, Paul Durrant <paul@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Chen
	<Wei.Chen@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 13/13] xen/arm: mmu: enable SMMU subsystem only in MMU
Thread-Topic: [PATCH v4 13/13] xen/arm: mmu: enable SMMU subsystem only in MMU
Thread-Index: AQHZxCqigu1wJWpVm0KnP9vpRTw2qK/VD2mAgA4rvQA=
Date: Thu, 10 Aug 2023 08:07:55 +0000
Message-ID: <0A1CB23B-6597-402E-8420-26C908A13ED4@arm.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-14-Henry.Wang@arm.com>
 <6c8f904c-d7f1-343e-2208-6cf963e1e25c@suse.com>
In-Reply-To: <6c8f904c-d7f1-343e-2208-6cf963e1e25c@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB8158:EE_|AM7EUR03FT023:EE_|GVXPR08MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: a084057b-638f-4ad8-f631-08db99790139
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Zp0dFhVnwHfx+oTsKSHTkJykPybbrJkYi42qUenR0599bWP1GUd1JgtPdFrpnYIuNPfRFyrJQwtyTkpJp4d0V3T3CBdt0Jg8fo+kFAq+XnoVLv2bT9aea1PEqYbtfnsKaoYJnciAngenehTQCCYg2KN8qS07Zx1SJD992AT4yXHBU/WKjSNDDKWGrthXYCiW2vskw7z/auyLa7MQ4oJWzCIR2NtlFJooicR+4YEni5Cz66Gf/ZVsCfvdQvpPyxZHKdFo4oawyqKW4oYTEPYh1llIqSpJJxjau/PthmF51dWjDQEO+SP5HZe9ZbldLMNVSqvKowmda+Rn5l9W46/B3Jq4RdsmafMPZPbRWXobnAmtSpDDDKnLeIXoqnlawH+19afuIBCTMv7ufzIIW+eW84xwX1rp+/ItJkGCQ7wXECHQzEcbIklkREtKMLFsLaVzs6Pz88nGi6JIE/IdeNaX6kwOMsxUfLpJ4/o+5Rp1xbY9V1rtpFqPqNabXJEP2SiZtSUh689a9cosSnmidSE3Uylkpx6+NHD6hJscHQQe871/wPCO3v746tTQsVp0Gv+RhaiVe7nvfUXJR676CHyRo3VDbg+hMusDcumYJNmfusaDlmbwi+pFrGYyo7ymYfAj
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(186006)(1800799006)(451199021)(6916009)(91956017)(64756008)(76116006)(66946007)(66556008)(66476007)(66446008)(4326008)(33656002)(966005)(6512007)(478600001)(41300700001)(36756003)(316002)(6506007)(53546011)(26005)(54906003)(8936002)(5660300002)(8676002)(86362001)(6486002)(38070700005)(38100700002)(4744005)(71200400001)(83380400001)(2906002)(122000001)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <2A96DB6FF701DA4E9F4F46922EFE53D9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8158
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	77182e12-d1bf-4ebb-5bf7-08db9978e6fc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eggvb/e9z4mNfHHTEpts1idldy/T04AJDs7DlQ4ZshIoza3uotg+YDkr5/GfVMEOpSTqXvQy3eo8we1FmJHQwFMm1QiLZKWhDX7P8ugeq4Wu4n5rS2edRHLIXzY8xvZHWbxjT31zFbZukgKkiprEXeoX0XoSaUWMwdVLNGsMVUtBBCNd0EjhgC6AppLywO8Xnq78H7gnMPQoqIh5XYC40vgSXvDrIkHv+A8TTJALYTLC7XCaA1FRyf3WkAB1Svl+cCJo1d8zbKrqX9SEqFqky0YKfBwOGblnt+FFzwmZxh066KyCspunpmdwKbRB8M1PaCI+aePXYV8gkw3ePswWANlbch7DXSrE0IPVxgDPC+i9L6mRJQ5/xvymFI3UiZzWVMIGBR0lbaGvQBvx+3b03I+Y0f2YZ+AVRmtgHuYeYsXZL8VLegKcxuGtk5vre3eWS7iJmajZfQkp/OWqB6MJNYLQ0IEqGKKm1OUQZ/k0emIHmUvvRWe1Xk38d1IaPIJSqYLHWbG8uCsT3BLu/dP/jD1ZXKEWN4IPeKn8KzlVoWwgdvreAKkalEfnUww7mJuT/2AJyCOXe7H4JTgNSG6dNFhzUOeB3Mh8fKp5eY6zbjrCdLuPytM15DuQT6CgFw6ozTeE1rFZgO/KKSi31zF/i6LXUH2RS/tL4KqMPms3U6o/CI73DQlXDGRIGzL7Q84DeWyfJ8pSqpkfd8gk8owxz5g5dtWrhHjzyrH8cMtVMQk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(1800799006)(82310400008)(451199021)(186006)(36840700001)(46966006)(40470700004)(40460700003)(4744005)(47076005)(83380400001)(54906003)(2906002)(6512007)(53546011)(336012)(966005)(6506007)(33656002)(26005)(36756003)(6486002)(86362001)(478600001)(40480700001)(2616005)(70206006)(8676002)(8936002)(6862004)(70586007)(4326008)(316002)(81166007)(356005)(5660300002)(82740400003)(41300700001)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 08:08:39.3256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a084057b-638f-4ad8-f631-08db99790139
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7751

Hi Jan,

> On Aug 1, 2023, at 15:43, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 01.08.2023 05:44, Henry Wang wrote:
>> From: Penny Zheng <Penny.Zheng@arm.com>
>>=20
>> SMMU subsystem is only supported in MMU system, so we make it dependent
>> on CONFIG_HAS_MMU.
>>=20
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>=20
> While entirely Arm-specific, this looks to require a non-Arm ack:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Based on the discussion in [1], now CONFIG_HAS_MMU is agreed to be renamed
as CONFIG_MMU, I will do the renaming but I would like to confirm with you =
that
if I can still take your asked-by tag with such change. Thanks!

[1] https://lore.kernel.org/xen-devel/429625da-ec4f-448f-a0c4-47ca0f62f395@=
xen.org/

Kind regards,
Henry

>=20
> Jan


