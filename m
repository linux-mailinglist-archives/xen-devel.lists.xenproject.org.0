Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1966C59278C
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 03:34:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386895.622918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNOyJ-000090-MJ; Mon, 15 Aug 2022 01:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386895.622918; Mon, 15 Aug 2022 01:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNOyJ-00005w-I5; Mon, 15 Aug 2022 01:32:51 +0000
Received: by outflank-mailman (input) for mailman id 386895;
 Mon, 15 Aug 2022 01:32:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=krio=YT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oNOyH-00005q-EC
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 01:32:49 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140045.outbound.protection.outlook.com [40.107.14.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2af18a5c-1c3a-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 03:32:47 +0200 (CEST)
Received: from FR3P281CA0152.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a2::6) by
 GVXPR08MB7701.eurprd08.prod.outlook.com (2603:10a6:150:6d::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.28; Mon, 15 Aug 2022 01:32:42 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a2:cafe::d9) by FR3P281CA0152.outlook.office365.com
 (2603:10a6:d10:a2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.14 via Frontend
 Transport; Mon, 15 Aug 2022 01:32:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Mon, 15 Aug 2022 01:32:41 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Mon, 15 Aug 2022 01:32:40 +0000
Received: from 5133d6e46419.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D1982C88-CFD6-4AE4-8795-CC1462DE2CFE.1; 
 Mon, 15 Aug 2022 01:32:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5133d6e46419.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Aug 2022 01:32:35 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB2829.eurprd08.prod.outlook.com (2603:10a6:802:22::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 15 Aug
 2022 01:32:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772%3]) with mapi id 15.20.5504.028; Mon, 15 Aug 2022
 01:32:26 +0000
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
X-Inumbo-ID: 2af18a5c-1c3a-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=U5Fv3z8icS4LrwA3OvK2O78tg1HWeQuwspsCKkioWhzD+Gqy1Mglg/QjEkW39bYL9yDgoXvhyAd7ybonpIK9CtYnP0d18yWu7O4Xj/BN+QuY+1vUDfSaVRWCyTCsXviXhnpW1fQWapsSDlk86zTL3MnoKghFcJMZyTy6iRxEnU4HUcc+IldCBRhTjo54cS1AgZlzpB/v08Jn0xQYKLdweFPj+5Fcl270YPYBszTDxE5PYRR+tayGb8wieCUhIq80CLcCZHNqZxOo/Fax+9/T+xb8ybbnJlBnu15iq8bg3tRw3oOeujbbmT2pLkTx57yRbrNdLwUfnye0IEXf39Nnqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wubEVuQyxDk6rQ2SzOEHrd5uU5tExPH/s+Ozmcrv4Q0=;
 b=QyGXb6A0op6yQCBDmhbwZ8ifjcPmBCwiESirqkDahi97flYqjQSakABnZdr8o+RskiMrnZtWPyEOIqwxSWcK/5IrpY7vHzaud7QcMxJiVD2tFegZbOwuSd/yvQ5evxZozzRunEy/h2zl6pLKJz+gOkfD5jx44RWXOgUNnz17Hlb6tw4e/uFVOgLdJXV8Hyy7Wf1by8ohFfIBQZmDmLqBSWc2PU7ZJAIvYSyaSYEy6z1CMcwXlQbQBSxEsjNM1cbFBQ3thI3+K2Xut9LJZvMUcNTE/NtJit4dyfkl9rc6zBRw2iFwDPeSRPx5y6mALJdNTNaNcrMHbwGqYuXKw7NZQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wubEVuQyxDk6rQ2SzOEHrd5uU5tExPH/s+Ozmcrv4Q0=;
 b=wMgvfXguCSq+jDt8FCiBylOTRKoTCLNbMalOl07moEH5oyP8Z/FcSNOhem7+HZ7f/+tCxtW8FvGNREoQs/jJHsBZUYffG9FRidds+CVF2b3QVDOh4WjzOy7hFk0Cc7xr0sOHE1oEMXg7kxdkE6Ptz8kajjKoOYXAQNYrxL4a6u4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VyrvQD3txX32gZZ4jFTHCDnUf2VeIuf+SX0RwnbBZJuWNQRooXG/f1EUIblmbuBRobZx/IlBpEGvItoBeiDgcbOBkcXiHtaYKBiIUvUcvm2ifnQ/x7RE5E1+jLUVmPGH1HzhDDKeFP/GgdAp5lhkmkK6MjE+g3ecSGyoM5+p5KbZn9eWsKTrNzAKJxm0T0X40en+UXeJ3HNAuD84CiIPkPcDfjFCdNMHhrktfcJng0A6ju2xsthKYhPtKpg+ngPL3wONRPFLUSDwbL7OlCxQQuEyKBq+zJSKh8hJbkcF9XCdiVquzeM4kE7i+q4dCxcynhLS24JTZBBsnmM+P8IyLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wubEVuQyxDk6rQ2SzOEHrd5uU5tExPH/s+Ozmcrv4Q0=;
 b=af9GdzqW8uCHXXkSZDIha3pOgUKTki82EIz9PFc2lc71odj4N21AaSonWbObWzn2erlh16RVIhkTqU525X84Oz+gdvxusRDrw/txPj6exuUZOF+eKy3Eazu0Waoififuhlw/TAJmQafMLQJqfiSkL8M2bzYxZg6iiYe5wgQYKfdEpdi4+qLfCyF6VqGBNcxi05H2Pw3PDY+FrOjyVcPgdB6L9qbj0zE/FNcmCtRi2yp7k+Io31EmVf1DMNCOGCFc14mHi82FxCbNTMmPcAtFMjlxuWPROOcm46HAANmcRKHB+RJZg1ZPsSq68HpixPz2+p6MdZiivjWFEWyQCB8ZPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wubEVuQyxDk6rQ2SzOEHrd5uU5tExPH/s+Ozmcrv4Q0=;
 b=wMgvfXguCSq+jDt8FCiBylOTRKoTCLNbMalOl07moEH5oyP8Z/FcSNOhem7+HZ7f/+tCxtW8FvGNREoQs/jJHsBZUYffG9FRidds+CVF2b3QVDOh4WjzOy7hFk0Cc7xr0sOHE1oEMXg7kxdkE6Ptz8kajjKoOYXAQNYrxL4a6u4=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 6/7] xen/arm: Tweak the dump page-table walk output
Thread-Topic: [PATCH 6/7] xen/arm: Tweak the dump page-table walk output
Thread-Index: AQHYroFQUZiO2c5J4keVr4CPZKE4rq2vL/PQ
Date: Mon, 15 Aug 2022 01:32:26 +0000
Message-ID:
 <AS8PR08MB7991337774EB40FF2CF1D44292689@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-7-julien@xen.org>
In-Reply-To: <20220812192448.43016-7-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7FD1342577AD6E4FA951A5D373892439.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2ae8358e-8542-473e-a2d0-08da7e5e0b86
x-ms-traffictypediagnostic:
	VI1PR08MB2829:EE_|VE1EUR03FT031:EE_|GVXPR08MB7701:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 T3Ndmj6luxwdTVRVWUUh+uSBrU6IHlI+ZbxLMOmfnT7X91C+x7YHjlDGOQ5We7KH8nquVZF8HB9tkwCvh2Zjvy2hlERYypQUZToy0jxHtU3itvqdTcq0Dv3gOAuDUkPwS9Acymo/6h1o4oSsyLTRMfk2KfOxip/5PwvxCDK2HuKH91lJWD4co1qQkQrbdpoAijBbHe7ktOq1jLp3HjczzkSvuL0YSlszdT3lx4tnfJ0BpB2Hh3Z3Kk+lwxaEyu9sCQbIe8a/lU54FU+fuCf7QBcTrMpsKboymqoUX1hA3d7V5fHsJDpRe6dyTNyNk1MK8oJizzm17Yr6SWYRw0ZNXaOSgebgttYeGm+csteHaDekgWTAI5Zi0a7zefywDtuqJLySyLohs5LGATEwZHd34wcbL222NMdTud5TDmxB2qCIDs0koCqJRSkHTRDYD69Kp8BUT6TFkV0ys/SSTKpXUuL7beG1QEgXntUGu9AZIAJdUHIeLpoGZ+QCUAAD+7z++lCpnvH3uHQUVfc82rQeGVeTB9A7FMuWME444n//vACNrGFC/Oq0H0wFjHfUu4TKYIka1TYz5aWh5bkLq0an1HoOC3t5Rf8PmCdrIBPhsWJyYuhoCpSh1xoV7zlbXuAtQgvZFB3Dqcd4n3XEco7g6KePMqgLEUHmQOFWgQ8Rw+Ef5rRYehL7QKR5MFuKN+LVFZIcxDYtA9F2KBJLfk25/0uiCnjbRib8ZFtRDoUIlMZ4pLMy83llATTWRflqPNBrkGQcL0/eecTnK2wPe4RonRuYEHXdVRcIER5zlHxs0tZSHeXsk9C5TjKu11HCK3O/
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(39850400004)(396003)(366004)(4326008)(38100700002)(122000001)(38070700005)(5660300002)(76116006)(66946007)(64756008)(66556008)(66446008)(8676002)(66476007)(186003)(71200400001)(478600001)(26005)(41300700001)(6506007)(7696005)(54906003)(9686003)(83380400001)(316002)(110136005)(4744005)(8936002)(86362001)(55016003)(33656002)(2906002)(52536014);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2829
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	333a2554-1f1c-4c4e-b8b6-08da7e5e02db
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CLMTD2tdpj82GXyuivl4ci9+0fNdi9uKTVA7SegZQL0KJc2FZfv+6G2HfNRg/+esrT42cKPRvxaz5S7wKPGuda/7YgWrJd9o8KPf+l5++uBAFjFtpvbISjNrLbJhDh8WR5dMiHKQPvkr0vGg9WGs4tPITMZ8Sh+foGEndfTMZ9xq7nzzEFt2dC9Kl0ZWFQGGv/fVzYJeILPybU0AfLT9T3vgFTbSHY5bX9qfv6YM0zqq8Vnl5pLZui0HHjWiNRJE3bfGAlZHAPu0BrsOiA9exvMjq2MPLlrNFb4a1gKIVGxH31ExbiBsC+OfCr+ClIXtmO+s6DjN6yiKle+rgje30kbXu0vz1sfhLl2HFdg/6Dx5Z2BInWvl2xKj6JcvrRXODNlynBEYKIUMOb1fZL79DShG5Ub9lTUQU2XTxphtAjtgry8LH+l5WaPLS6GZaT/lRQfduxBYobSPuQi/2bN+77GtJfKs5lyRZzM41fzjPkzz8EuC0tr1FW5ZkDBuqOEwh3zzOS4/VB+DRApO324rSyHkMj4HFc1w+nVycAlae1ZLKtwCytOvIjXiksktaic5McLg9sa06ExrjMqJpX4KnNPu7lBwxmflgU2NPWB/HZfImHRwSb4g/wp62s7/76qozi10CKxuk7hSWYz8eMqdEq+sX3tnOOoetLXP+3mLeK3/DRwCNdKe1HwJEzH/QIs7a8Wz6gfG+kk3aI05v6JOKH08mqBp9oxpaZOyHyMQ58l8NH6kyfWjq17wTxq6S5D7caUTmJeE1ArFOk0pPqWyVw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(39860400002)(346002)(46966006)(36840700001)(4326008)(70586007)(70206006)(8676002)(316002)(54906003)(110136005)(40480700001)(55016003)(82310400005)(5660300002)(4744005)(52536014)(8936002)(2906002)(82740400003)(81166007)(36860700001)(356005)(86362001)(33656002)(41300700001)(478600001)(6506007)(7696005)(83380400001)(26005)(9686003)(107886003)(336012)(47076005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 01:32:41.0651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae8358e-8542-473e-a2d0-08da7e5e0b86
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7701

Hi Julien,

> -----Original Message-----
> Subject: [PATCH 6/7] xen/arm: Tweak the dump page-table walk output
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Currently the output is looking like:
>=20
> (XEN) 1ST[0x1] =3D 0x000000004015ff7f
> (XEN) 2ND[0x1f] =3D 0x00500000bfe00f7d
>=20
> The content of the entries are not aligned making a bit trickier to
> read (I appreciate this is a matter of taste).
>=20
> Align the values by forcing the index to be always printed using
> 3 characters (enough to cover 512 in hexadecimal).
>=20
> New output:
>=20
> (XEN) 1ST[0x001] =3D 0x000000004015ff7f
> (XEN) 2ND[0x01f] =3D 0x00500000bfe00f7d
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


