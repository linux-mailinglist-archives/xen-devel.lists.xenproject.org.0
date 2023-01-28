Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C2B67F462
	for <lists+xen-devel@lfdr.de>; Sat, 28 Jan 2023 04:42:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486056.753536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLc6X-0002WG-QT; Sat, 28 Jan 2023 03:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486056.753536; Sat, 28 Jan 2023 03:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLc6X-0002St-NF; Sat, 28 Jan 2023 03:42:13 +0000
Received: by outflank-mailman (input) for mailman id 486056;
 Sat, 28 Jan 2023 03:42:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dFBb=5Z=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pLc6V-0002Sn-RZ
 for xen-devel@lists.xenproject.org; Sat, 28 Jan 2023 03:42:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2057.outbound.protection.outlook.com [40.107.6.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bda8d805-9ebd-11ed-b8d1-410ff93cb8f0;
 Sat, 28 Jan 2023 04:42:09 +0100 (CET)
Received: from DB6PR07CA0073.eurprd07.prod.outlook.com (2603:10a6:6:2b::11) by
 PAXPR08MB6350.eurprd08.prod.outlook.com (2603:10a6:102:12c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Sat, 28 Jan
 2023 03:42:07 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::d) by DB6PR07CA0073.outlook.office365.com
 (2603:10a6:6:2b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.13 via Frontend
 Transport; Sat, 28 Jan 2023 03:42:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.21 via Frontend Transport; Sat, 28 Jan 2023 03:42:06 +0000
Received: ("Tessian outbound 8038f0863a52:v132");
 Sat, 28 Jan 2023 03:42:06 +0000
Received: from de0917c2af9a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0216A9BB-6B29-4C63-A849-EA2666D0833E.1; 
 Sat, 28 Jan 2023 03:42:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de0917c2af9a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 28 Jan 2023 03:42:00 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PR3PR08MB5786.eurprd08.prod.outlook.com (2603:10a6:102:85::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Sat, 28 Jan
 2023 03:41:59 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.6043.023; Sat, 28 Jan 2023
 03:41:59 +0000
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
X-Inumbo-ID: bda8d805-9ebd-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGDSjEtfcXizPgazm0/AW6Wagym2+2R8sTT6ABlbzdU=;
 b=BRm+OaCGgLaUvw5bRNQbthxU9OsCBDUGlDdYgri0unmrlmKSRSEjO5xPraS0wLZTtrk6B2qyMEZFY3mxDP0MM72piRrwBPahyoRf129zHwd2g4SZeJwmi4hkrdNZo+Dvn9rzjp6jWbobF7mFnaCxxTBM9liF6jS6ddARp55HWJI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdTS59d+QMaCfHvNCPVH3h0wKQdVgr1OESMSlkOrF7Qumlh4NEpfP+UL5CrK54EhCx3Bqqhy9J+eJTwvxDcBilEKVgSuVfVYHuLyenKUl+tOKjWLXWhH2SXb3KRei+ulSdAUiSACobEwG+YAho90CvDd1EYAyO0zQyXXH5J79XP9nV/O5hAvWKPf7QKMXktp5y7i1qGE3RMay29KNt8iL1RRDe93Hgbza7UrXXv2nNqZcDED83HndvpJWEpKIB5CVwU/0Mqhqtl5+kFQXFVxeifFPPP5izaf/qHV76UXTJdDGuh+ZP8oqH+kpSp59rSHfJmJOUyYFvGfgDP56Heqeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGDSjEtfcXizPgazm0/AW6Wagym2+2R8sTT6ABlbzdU=;
 b=Hfb1lD/1Zg6EN50al9TagK1kVI43fkxJ7b5KhEJ2vNk6t3G4xqxidKjbSoSuBmSeM47I8SyDMW3sOstWxw7NUKpv7uniFeQk7/GX+LMcRZh2oB1gpYRHlNVbxAEtxt5TpAGndYzm2LWCQ51vWC6YOMCwWRcN5AO6+VWOowniMbU1ZUYFzfCXVa11rHGRbw/v9rZv1d7Xl/DqDkw+fENNNiSSf0/402vwNU1j4NKVsxs4wYNRbn3U0QRXLbcVQzSkpVuzKZP3y5fEEEk/4CKvzCy92iQ0JrBzpmqmqDn7VlXzaW0Sw5oXCD4By314vyG+qyjooshuO9aN9CKNhs8Spg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGDSjEtfcXizPgazm0/AW6Wagym2+2R8sTT6ABlbzdU=;
 b=BRm+OaCGgLaUvw5bRNQbthxU9OsCBDUGlDdYgri0unmrlmKSRSEjO5xPraS0wLZTtrk6B2qyMEZFY3mxDP0MM72piRrwBPahyoRf129zHwd2g4SZeJwmi4hkrdNZo+Dvn9rzjp6jWbobF7mFnaCxxTBM9liF6jS6ddARp55HWJI=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: RE: [PATCH] tools/xenstored: hashtable: Constify the parameters of
 hashfn/eqfn
Thread-Topic: [PATCH] tools/xenstored: hashtable: Constify the parameters of
 hashfn/eqfn
Thread-Index: AQHZMoEK6Qg1GivE6U2ZJONPV13z5a6zGZ7w
Date: Sat, 28 Jan 2023 03:41:59 +0000
Message-ID:
 <AS8PR08MB7991F1FCC828DBACE24605C192CD9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230127185546.65760-1-julien@xen.org>
In-Reply-To: <20230127185546.65760-1-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 07B9CA2BF1E8ED4EBA1AF7D7047076A4.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PR3PR08MB5786:EE_|DBAEUR03FT019:EE_|PAXPR08MB6350:EE_
X-MS-Office365-Filtering-Correlation-Id: eea51cb8-7ac7-4271-9c3f-08db00e1a0c0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Rcm31ZHUKkA7C33UPcTY832hO9b0MpDK1dNl3GFmpB4D7yYnpgFiftJLa89hyKm1fxT/TYcZIu6z8l9FlDf6F9ECfA5x/InRO/moWRixizMfMQELxGq5MtiygaX8nbHhzUJnegMxaDI6KKGeUIsftj2tNpxWdIoejUvTvhcH6tXUHYoJQoouWtJEY5FM1R/LusAtCXakHXDuJC5r3K8Sp6/N4dlbjYTCuSVMmgHATXnGun1a1+PdEn/0reNYvqTJ/BU5HfmtRDJ9FVm2501o4wa2ZzaBIi9oEF9Va9sxI2YUSdT446FrapwVpFlwSs3NZEvj5aAlxU0cU6H7LSY3fsf2xu/cBG6yn4uzoY7YvAM9Xg3xnJBHmHhH6EwP1cXib4jPiCIeWTrKJiRh4JAaL/H8TyfN25d6yHNsqgSFC2ggXzRvLM9KIng9DzBUIN/ntSLBI/41YKF2CenAt0p4RBz8NQ1yqscsi/h+frVYNDU2EnpnyRequsoLs1R/0czGs42l78NxPzFy8GWFJgRt0pdHEZzYTw5unAbzDoiT+fKtuCUzjovXWtWdHR3eQJ6Pnuy24/T0cCMLAgAZ2j3fRy1BHA7Loi8Q/bn5DtpJBishtqoVROX3aNSYb4UB9S1o3gF6JnxWfZ4wgmdwuLovsYelPgPOHAjMUIqmR8spuRkoks6dHOIb27DJHIAnG6JJ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(366004)(396003)(376002)(39860400002)(451199018)(83380400001)(5660300002)(316002)(52536014)(54906003)(8936002)(6506007)(71200400001)(122000001)(7696005)(86362001)(478600001)(26005)(38100700002)(186003)(38070700005)(110136005)(55016003)(2906002)(4744005)(9686003)(33656002)(66556008)(64756008)(66446008)(66476007)(8676002)(76116006)(66946007)(4326008)(41300700001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5786
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ffe88aa1-4eef-4c4b-ad5c-08db00e19c35
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jhd9dG3OWVVqPjD2mfeMm57Fg0j8YYqeAm/kf//1t3ydE9NpvdrRAhp0RnjpHHYlTYLFwUYNH44/CZqF0CY3ELNZymDtO6eYJmkdHo+Frr0peK3MEnZgirpqJOAUyGyvtwlQ/7YB63742qbFy423p0rBfs9eRX5H3jw0bCxqMbeoNlNbh/gRfSTluooUXYm6YmoeQEB2rO7HNMI29DGk0qEEdCVyKLmqD7FMOqW+AjWE4XBldfpDadpztDm+a+3Fj+3e0nTkKG9SPjTrFEtK3BBeAUclZy6h7r803Y6fNEu+kbl6Eo+nm1+gy24UPkakLiz3zN3wFqVytEN7dhVAAN3f/c4fVsjigI5ufTwCdmjfW/1UEkNRpkntXvHfNkybmDLcPqXXWdZwvh11kw1PGl1Zma5jGoQKtrfA5fQtdp8T+A6JeNGTy1QskP8ZN895tzu2XuH2kvpVRALxNBVG1x8bp1PwStLPNRvzXVJRe1P2LfDNbgo3hpBWaLGvbpA8786A7hikP7fDpNZzpV6z9Ffd1K20WtyCOPNDU15/umHG2SSf98yWaT6Wc+hq3t11U2ZeS455Lngae1kcsZqJb9vGMpi8Xf5wNGZnbu4qWBlwkdmB7tS5eNdfylEiynQ1ENvx4HTxuPuAdAt1tciHtgJcBGWpHMQeo0HMImVt7lsldz/MjO8vEyhHPVgjDDnB
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199018)(40470700004)(46966006)(36840700001)(4744005)(52536014)(2906002)(47076005)(5660300002)(82310400005)(83380400001)(55016003)(336012)(40480700001)(356005)(81166007)(82740400003)(4326008)(110136005)(41300700001)(8676002)(8936002)(54906003)(36860700001)(33656002)(316002)(70206006)(70586007)(6506007)(9686003)(40460700003)(86362001)(26005)(186003)(7696005)(107886003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 03:42:06.7676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eea51cb8-7ac7-4271-9c3f-08db00e1a0c0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6350

Hi Julien,

> -----Original Message-----
> Subject: [PATCH] tools/xenstored: hashtable: Constify the parameters of
> hashfn/eqfn
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> The parameters of hashfn/eqfn should never be modified. So constify
> them and propagate the const to the users.
>=20
> Take the opportunity to solve some coding style issues around the
> code modified.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Tested the build:
Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

