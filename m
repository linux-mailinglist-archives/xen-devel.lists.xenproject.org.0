Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABBF645232
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 03:45:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455776.713340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2kQC-0000Jc-Lt; Wed, 07 Dec 2022 02:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455776.713340; Wed, 07 Dec 2022 02:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2kQC-0000Gw-J1; Wed, 07 Dec 2022 02:44:32 +0000
Received: by outflank-mailman (input) for mailman id 455776;
 Wed, 07 Dec 2022 02:44:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gfh3=4F=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p2kQA-0000Gq-6F
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 02:44:30 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1155ee9d-75d9-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 03:44:28 +0100 (CET)
Received: from DB9PR05CA0015.eurprd05.prod.outlook.com (2603:10a6:10:1da::20)
 by VI1PR08MB10103.eurprd08.prod.outlook.com (2603:10a6:800:1ce::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 02:44:19 +0000
Received: from DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::de) by DB9PR05CA0015.outlook.office365.com
 (2603:10a6:10:1da::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Wed, 7 Dec 2022 02:44:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT052.mail.protection.outlook.com (100.127.142.144) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14 via Frontend Transport; Wed, 7 Dec 2022 02:44:19 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Wed, 07 Dec 2022 02:44:19 +0000
Received: from 008aa5f9031f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3882E733-C1D5-4890-BA22-9B456096FD15.1; 
 Wed, 07 Dec 2022 02:44:13 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 008aa5f9031f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Dec 2022 02:44:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB8636.eurprd08.prod.outlook.com (2603:10a6:20b:562::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 02:44:11 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%8]) with mapi id 15.20.5880.011; Wed, 7 Dec 2022
 02:44:11 +0000
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
X-Inumbo-ID: 1155ee9d-75d9-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYQ6HmsflV0eXxZLbEdw2i8k7IELWSST3d07XYunoFw=;
 b=IXtcxo5KVqB531NvQCFAe8oyAF5cNUapd7YBJEyLb+B/2ZaQGferJGGeDIs7NICpJvcZBvS2cuVgiJ7U36w7iDvvYmbf4mNTmVgpBAFj6b7O+Q3dWN4dLYJ17jxNwy4LNbH/MXv5ehA++DzsGj6sNWTmll6Iw+xk4J922aDC/rY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mP97M6UsOJb8VxTpBqqFulx1UuEbWlaogjEQJXFibqoFUWib8niy3UwkNS5Q3T8Ioc/WBI7HQpvfuUcPP/BQrTtJ78worChiTvs56kIBY0Lp7Cbb/ixaoBwcgkdEOx5g2OgVsWZlnncK4Exj0/oeA3rNMVFuNHUjpZe1wXIplF6Yid9ql+n8joK92amefKP7MlsHuPbU/njWhTwjdZLBzOiCinlaaGKoUHxYeHM9Dj88Huzt+9ytpkTizXv66L8IJXFney3w1DOCwsyI0mNJwbKaNiLZr74NdfyKyC/dXxLFXdABtbv741f/fwowqQuJ8ewznVIJw2viuBqcpwYKpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYQ6HmsflV0eXxZLbEdw2i8k7IELWSST3d07XYunoFw=;
 b=gt/YmYmyK/gcyOCBkXmO6kNj4p8zSynGWOzTCfW9CWe55Am+dcLcXJOKHl3d8NFamAwHDJhNMBYkddc30BAsuS18yN9tqzgYXcNjeGyuvBdBg4ghPVs6q+gOwbxfKVPH5QJsJ4BJgeHx9nD42fZ2ei84L1DxTcqoInz8QyEg90wdLapdWLP2rI/cUe3zbpldiZVFE9H2zmq2vIeiXqdDmk6R0xovXqVpB1snSTg4yDSpHD/VAihwM1Id80cWVxKmDsvFZeNz/JTqvXGZFUIKczbQEljSDtpVgE/jK4DIoYfYQHVHD6d4ORlHxgVrDxd4x8nj56WNmgO1PsctBP+tJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYQ6HmsflV0eXxZLbEdw2i8k7IELWSST3d07XYunoFw=;
 b=IXtcxo5KVqB531NvQCFAe8oyAF5cNUapd7YBJEyLb+B/2ZaQGferJGGeDIs7NICpJvcZBvS2cuVgiJ7U36w7iDvvYmbf4mNTmVgpBAFj6b7O+Q3dWN4dLYJ17jxNwy4LNbH/MXv5ehA++DzsGj6sNWTmll6Iw+xk4J922aDC/rY=
From: Henry Wang <Henry.Wang@arm.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Ard Biesheuval <ardb@kernel.org>, Xen developer discussion
	<xen-devel@lists.xenproject.org>,
	=?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Julien Grall <julien@xen.org>
Subject: RE: [PATCH v2] Use EfiACPIReclaimMemory for ESRT
Thread-Topic: [PATCH v2] Use EfiACPIReclaimMemory for ESRT
Thread-Index: AQHY3SOE4Yny0gXZiEK8Iho+g/cvja5iEUeQ
Date: Wed, 7 Dec 2022 02:44:11 +0000
Message-ID:
 <AS8PR08MB7991DA43144C61A4B5D50DF7921A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <ce73ae2fa148c5d79a038275b0983d24537e97de.1665458679.git.demi@invisiblethingslab.com>
In-Reply-To:
 <ce73ae2fa148c5d79a038275b0983d24537e97de.1665458679.git.demi@invisiblethingslab.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 365B185E254EF044B1D11977DA8A18D0.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB8636:EE_|DBAEUR03FT052:EE_|VI1PR08MB10103:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c1fdb1-c449-44e9-f708-08dad7fcf074
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 seDVVc1Yc5QZbY4TauOpxoAFr6GUX5RiN3MHywIcLDNQpon+1JKl6AF4r9Pxyy1ecLdTQI/Di5xBNOitfIrAHXqE7FFcjArumsZ7w96EXL7MmyERbwQYXkRWpDZB055Xq2x41cirofV7JfXBgZkHG+TeqNSuY+MQ99bHmjc8N+8LbslNEnnApm3tkvKagwI2Q6O3SWnJXnwJXWQOhZi22xaor+UaEWAGZXC54E7ObohPbGXWKN6qkAP2n9IHwSaL6hkWEHjYoibVsPyCGxegUcqxbk/KMxdtEe0mME1rOpO0GTGAlP4ZPfRqBPIoDXZbRKGxHg2/PzOSF2zYdSgipbWrDOPXTW/lak3dQK3bcI84Cy1VQnbMero5IDzFwlvCoyaC8mTsWHl4iyf97uZHG4AUNuDvW5N07r9c5fxfdSqwwsGJE3aIflbq3FWPKUe5x5QR9J9iFvLBcVRHlRHg1WU317QBVemkdz3hbvzhyAeytRYETnCmL+XCcQBpGlJvXBs0K8nVNDYpO+pD1KLgEF9o5dI79jYMFWCZVjxb6jAYSz/4hwYa8vfXWU8qj1QsnmH0Pe+Ig3A9MUaGaLFZbuxp7vOX+QvQ0JW6My4LtyhA3AY++fAK0YgWKx9w/3i6znLMYMqgVKvM2ISJ3syjy9C6ze/oUaOpnpXCT3R9VNLpGTmZZpjl672L90TwqCDlO95M7lwT/k2o+SAXIqXMkQlfOIUJW0Vd3QxeF177k2c=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199015)(478600001)(966005)(71200400001)(66446008)(86362001)(7696005)(55016003)(66556008)(66946007)(64756008)(9686003)(6506007)(33656002)(26005)(66476007)(110136005)(8676002)(54906003)(316002)(76116006)(4326008)(2906002)(38100700002)(186003)(38070700005)(5660300002)(83380400001)(41300700001)(122000001)(8936002)(52536014);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8636
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cb6865a9-e0b8-4ded-9f06-08dad7fceb9d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lFbugNi3h2YH4E/schOnZq8f7Lo1McMzoXdNx7v4E6cAFjkzSLg9G/T+VlYrJb7Oyfi/qcg2CVyZ/4MWwck64+mQaSuZS0u8LgGSGklzb0I0omJpK5jZmtZ5Db5k/B2MbhzQZueLPSvFxkgrQLuvGZqSwMppZanEEcFNxyurAkYQWIBdcBw0UxblMrGzgm2BdcSgQnQU4j96uVIQERxxbNYT1W8PcBCm7SXl0yJmpAwvgNGkCZ8GQObh+kq0GpdsC5hWrDlthWY/kXTywx5HL6peHruBt5N1F8whQLNeiRbNIOSkJcEiv9GTitQG+w6MSHy9yrKyIohigWOmiq+iRT7L6PNm+RzKwiTPOQ99LDTg1ndc12TX3xuYdIqsHsG2G+Ys5Rh7Qti1HFACsfsaDzrCBlVUNO1pI6urq09Kecngfl1/ywmEqOCSRzDFeHw3N2rxdY1PtZJEMZ5E8DM8xCjI4Q0YAfnZhCnHS+SJ3xetHjyCHX9ovbeSUKbJBntSW9IqnuQaneJVHgz8Yzf8X1+qdFeMU7Fh5wB+ouRAPZB0PfAY1H/op9J3osPGtoXRlusHKZb0mmhNDpjWY1Z/55caGtszCyLRZG0CcR6lttgudhlGRL+jWcXQP8yXpZ8THWGsvsJDPj2QxhMD1cDrSMYgcvtiIFZ5q9GRbBiJogI9ecXe0q0GvC1WmDHq2Inoo0pIAf+1N5R1UUHXQMhkEz3eHyQentI/+xCrXvnr5jM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(36840700001)(40470700004)(46966006)(40480700001)(86362001)(55016003)(40460700003)(33656002)(2906002)(966005)(478600001)(9686003)(6506007)(7696005)(26005)(70586007)(70206006)(186003)(8676002)(4326008)(110136005)(316002)(54906003)(8936002)(5660300002)(52536014)(41300700001)(82310400005)(81166007)(82740400003)(356005)(47076005)(83380400001)(336012)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 02:44:19.2274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c1fdb1-c449-44e9-f708-08dad7fcf074
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10103

Hi Demi,

(+Julien for his info since I am replying below about the 4.17 stuff)

> -----Original Message-----
> From: Demi Marie Obenour <demi@invisiblethingslab.com>
> Subject: [PATCH v2] Use EfiACPIReclaimMemory for ESRT
>=20
> A previous patch tried to get Linux to use the ESRT under Xen if it is
> in memory of type EfiRuntimeServicesData.  However, this turns out to be
> a bad idea.  Ard Biesheuvel pointed out that EfiRuntimeServices* memory
> winds up fragmenting both the EFI page tables and the direct map, and
> that EfiACPIReclaimMemory is a much better choice for this purpose.
>=20
> Link: https://lists.xenproject.org/archives/html/xen-devel/2022-
> 09/msg01365.html
> Fixes: dc7da0874ba4 ("EFI: preserve the System Resource Table for dom0")
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> ---
> Should this be included in 4.17?  It is a bug fix for a feature new to
> 4.17, so I suspect yes, but it is ultimately up to Henry Wang.

I am planning to start the process of tagging the 4.17 so we can catch the
release date next Monday before the holiday season in Europe.

That said, if the EFI maintainer (Jan) is happy about including this in 4.1=
7,
I don't object it if this patch can land in the stable-4.17 branch before t=
he
end of Thursday (Dec. 8). Note that OSSTest probably needs ~1 day to do the
sync from the staging-4.17 branch.

Kind regards,
Henry

