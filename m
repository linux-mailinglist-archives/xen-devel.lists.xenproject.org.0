Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD255697A4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 03:45:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362695.592863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9GZr-00088Y-N6; Thu, 07 Jul 2022 01:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362695.592863; Thu, 07 Jul 2022 01:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9GZr-00085x-Jl; Thu, 07 Jul 2022 01:45:11 +0000
Received: by outflank-mailman (input) for mailman id 362695;
 Thu, 07 Jul 2022 01:45:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j4MP=XM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o9GZq-0007k8-2y
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 01:45:10 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10089.outbound.protection.outlook.com [40.107.1.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ee07926-fd96-11ec-924f-1f966e50362f;
 Thu, 07 Jul 2022 03:45:09 +0200 (CEST)
Received: from DB9PR02CA0024.eurprd02.prod.outlook.com (2603:10a6:10:1d9::29)
 by AS1PR08MB7473.eurprd08.prod.outlook.com (2603:10a6:20b:4df::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 01:44:40 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::d7) by DB9PR02CA0024.outlook.office365.com
 (2603:10a6:10:1d9::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Thu, 7 Jul 2022 01:44:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 01:44:39 +0000
Received: ("Tessian outbound 6f9e7ef31fa8:v122");
 Thu, 07 Jul 2022 01:44:38 +0000
Received: from cd15004ef429.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A8709358-53A5-4520-A6EA-D515FD6688FF.1; 
 Thu, 07 Jul 2022 01:44:32 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd15004ef429.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Jul 2022 01:44:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM0PR08MB3059.eurprd08.prod.outlook.com (2603:10a6:208:5c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 01:44:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.020; Thu, 7 Jul 2022
 01:44:28 +0000
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
X-Inumbo-ID: 6ee07926-fd96-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ENhmKJ6yzCiy3H0zXjVWZ7G5raLcKMAHPPe51OsPugOUWHD/9bFrz5YYtCLKR0vIcxHMGEAfqa/EqdNytMNe6e/amNYpnt/QzTS4Jn79uatlDaE0Mgsd/ftzjUL8OeJMqPbjhiblHpfcsxKskc50q4dxxUbM0YWVm5q1boaPufz0QXshzHG+NONuFmPXs1sI3paW+euIYpcQ2JVi0fIWQqASwEcoyEauD/Ba3PjMaGLuP6w/Oe5LGvO/mASpRY2Nr8vB/Qy04vAsXagdSWX7ecqJSkmdSVWru6O77isROT5OS+RgUZgC4ULgPQoWGp+iBudOO/pW7OS0wV+SmWg1zw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYpcNpnVUoenC3Di66fS55RIcJXm/TNgvfGMfiqZVCI=;
 b=nSbjleLtaFzqIcWFGg24VslLirzSuJgLWX0BtpVsaj2MilRFge0Ao6EhkPah/bJoRVhCbC1RS/YKVdzWokbO7dmLycRsedJmV+BlhSaPE84lv/bNJAiqGFalOTnahNsXCa7SVTeJL21ggkz09Jm0Tl+rTXespDGcnl0vKi+IFv/r2wrKb6WxZfI0IL2Ki7BOiNb6FlX+Dnl44CxDk///yMKI1cf7VWI+ytLzyeQEFJ0u6ChRVnQEc/f9pLXk/QIxOzpttP1951vR5g5ansXQ0Bd9tix9pR9Mbz7fVfkyBhRGxJZ1WDAMVoVnoU+iG/BXberLRYdDgpkD7WHYGJ3NwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYpcNpnVUoenC3Di66fS55RIcJXm/TNgvfGMfiqZVCI=;
 b=MaeXfjzcttqU4SU1fbBx73OPzuFufZlF+ptshwQyV4SIAHxCsMUh2orbW3HLro0wNrzQmSzGdfRoavtZV0DnZ8+8MAffMTYV5R0L1148PdFrlfswtQ43IDBQ9UBwV7ohhKB8h9+c/QWfmMJCHIQuJs/we28mA2j1rcqkkho2Fqs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2rGfiJlohTu6jD8HnyCBOenOZhx3IgDVnA//agBS/IQJ50LBmQRzBrSemqmi7Nxlgog5svDp9BOEY1qsFNlB2F8ae+WO+TDy9UGg9uiF7rjgwsUGMQNugDqmaI1Jjwbat+n4na5JKLWmkIbnAbV2nWQBwko5VzrHGUAyLtGB5+lEsDvm2KySuCW3b43/W74VW2WwAfApe25WukvxpvbTy/KDomyVY+IGj+MZQ6ZJi2fkVydz/ktBo8vZy1DR1NUh6SWMKYK46C0Gj6gKkIUUiT0VJonGWw7jygw33qr4J19/MPwcMNbORfUVQBAXf+ka5FNMEJ2mhNCBN1fS+XPPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYpcNpnVUoenC3Di66fS55RIcJXm/TNgvfGMfiqZVCI=;
 b=aw4hw3pPX7Glud4wAmSP6p6m2ukTKHr6uV0dInYfxR/qhlz+4E+hirji6wyhgRUbVMjjdITUPvCad0YZaXrP9UpvXb6e1hvg8CL5QbzGrdQ2eUMRcTu10cyowzqMSlUc60QkRj41HdhDKFjrMMk66vwnsPDxyGYsxS0BYCHcAOHImsuDkPpNuyPWYmJCJV5M1i74uN67FgNIxjYTseu6Q6pxAlLRtB71lbiPRBAr0PEbK6Wwe/AVfSGmQifH9F6djvuYS2Yp6eUBECVZxBu0NJKZF7U623jW0q1Wft4x5qdhvaojUR5pW67u4BXortxE+u+TPlVZKBBQZi6U8YBS1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYpcNpnVUoenC3Di66fS55RIcJXm/TNgvfGMfiqZVCI=;
 b=MaeXfjzcttqU4SU1fbBx73OPzuFufZlF+ptshwQyV4SIAHxCsMUh2orbW3HLro0wNrzQmSzGdfRoavtZV0DnZ8+8MAffMTYV5R0L1148PdFrlfswtQ43IDBQ9UBwV7ohhKB8h9+c/QWfmMJCHIQuJs/we28mA2j1rcqkkho2Fqs=
From: Henry Wang <Henry.Wang@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "scott.davis@starlab.io" <scott.davis@starlab.io>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v1 01/18] kconfig: allow configuration of maximum modules
Thread-Topic: [PATCH v1 01/18] kconfig: allow configuration of maximum modules
Thread-Index: AQHYkXwoifwexgw7vU2lK0bNIn1Zbq1yHf8Q
Date: Thu, 7 Jul 2022 01:44:28 +0000
Message-ID:
 <AS8PR08MB79918794CD0903E32D5B909C92839@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-2-dpsmith@apertussolutions.com>
In-Reply-To: <20220706210454.30096-2-dpsmith@apertussolutions.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 704E277118C1A347AD3E8E4D2B8866B9.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e280cf62-970d-4d62-26fb-08da5fba418f
x-ms-traffictypediagnostic:
	AM0PR08MB3059:EE_|DBAEUR03FT026:EE_|AS1PR08MB7473:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 59EBJtEkSUXEPgTFQjFV2+e+Bmnx24S277IUB4URhT25S+PMbElzDpFuZRc29igvPKVy9U4qrhGzXdNs7BrZJv27+5hvDVxhrHN0Z5uWiC3RqNRCt3edlhhh3XKuEh0IhwBjxnbt71oUGV7lG9e9E2YVvzcF7gul+litcAalLG5n8DuOGEBhRVhkxkBSem/DDRfEjp2Bv5HvZLZwdCDwsJw4BXk24664D3ONydPrAhuL36LQHlpsEbhcz+6ILlVs1NrrdqeyI4gRYr1n5k9WvjIXTLQo/2h0lOBlcnCu+xZyry2TDkhsZRROJaH9okKDZsks1nekN9+1H69hTcl65hULLXVI2L0uVEQqtaS/k607ZlPY+x5jfxW6yCPf4o3tybk4uLqmVWp99V2TZVJbSbElYmDr+KcDivz42rKCpU61eOOADsezYyijCDW1MCAP3Y0MqD42gSH7KYf0eZxHRRs50hivmopjsbsF/QYqBU5/KxXsDOVu2TSzX8KBO5Ff/N1SpdfQjvP+PKupLJn1WhXGF4ULnEIVFH1JWygFJmPeN+oSqw8Je7K7xqLeBYO9Wk/3DI5fSrs66Mxvvm36OpwATRn/pByhLpbaTUnEWf7G0g5fudb/vBcDrAUHaPULaNCNyw5YZG/nGh/8i9WIg8C3tQK6lYpBEMccxz7qB9HwKVUe2HO78ZA2zfC+KciYUENEx8d6FrIgRT5fXzkzUWMvmZxM1qhBxYoV3N9gYueXXvzURpBF6bfxGGcqhmvt1TK7jHIhaEPEXdYYIRbM169EQ0VXMnpRcyqO66tSnmE1dGenjVq0gC94xTQSvegj
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(7696005)(6506007)(9686003)(26005)(38070700005)(71200400001)(186003)(83380400001)(55016003)(33656002)(2906002)(122000001)(38100700002)(66556008)(478600001)(5660300002)(316002)(86362001)(41300700001)(52536014)(8936002)(7416002)(66446008)(54906003)(4326008)(66476007)(110136005)(64756008)(66946007)(76116006)(8676002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3059
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6505f504-28cf-42a6-a4ae-08da5fba3b0c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yjpWTin61pVct2mup+xJ5Lh9AuyAtojCNrKYCrwPHFn878dACykvOUUIIg8WVqi0Up2Y/MkA2mYYZiLAz9vFxwd6GDNJ0coyC0pL7oTfkjD1/WG1GzSwcj/1LMiaAW9WUVYET9cZAyKSnVBB+OHsYDJk5mlknPzChaY5oDExeSJfKynWqG//WuXUYYTOxD0UbSfeWwhnNY9H/nbp3zPE3cjQ51GIrv0Svvo9xCt5zvWyf9eYiOZYKrt7l4MWzfZTxtqanjD9HTqgOk+zgPqLVyNDwp+E65mudZz6K8Ze+foLCPM1i6DT/ebr8OueU3CsdeC+UTInIaTx9FmHtBI0ECcAMWFn+2/Uux+m2DAg36/ili05HT1Q+E4U/B5TYCFEGlc0lffQX1YgjAF4U0mj+KSEpk/ChvhEZuRHsKUFusrv/pO0yEhX5SldeoRlQpGcNSSi4OybfTqkF/Swum2SPHF1NWq1tGvUWb3aLVCH1Lpnt2WepSHktadNWLW8UWRORkzN8328LxWNFVEuGTCPgsxT9UV0nCKTdrgtgD1gw+1djyWwwOI+o6h9jBqcDQt4CAgxuF2AdHmjSm9zZsYZxCGH4XT69jf7gjK9ss1nBKwLR1D6ACXKTe8oxX8AFVC7P32kFXY8bGutZlm3BPyVNqLjaMM0ser/MO78biRPAojO2sUTWaQ7ijtN7C/ehsgSFWlm4i5HjoIEd1kM+Xnt8ul7SjQTfYbq8Ru0wuI3nL1v7twj6dFUVISvhndv/RoBNWxE5pdRxdmr1i1MVg8dOKoZ0LHLVKP85sWd4dh5612FUINiIRE3CGBc+3kadQUw
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(39860400002)(136003)(46966006)(36840700001)(40470700004)(5660300002)(70586007)(70206006)(8936002)(52536014)(4326008)(8676002)(40480700001)(82310400005)(40460700003)(2906002)(55016003)(36860700001)(33656002)(81166007)(82740400003)(356005)(478600001)(83380400001)(41300700001)(316002)(54906003)(110136005)(186003)(336012)(47076005)(26005)(9686003)(7696005)(6506007)(107886003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 01:44:39.4646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e280cf62-970d-4d62-26fb-08da5fba418f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7473

Hi Daniel,

> -----Original Message-----
> Subject: [PATCH v1 01/18] kconfig: allow configuration of maximum modules
>=20
> For x86 the number of allowable multiboot modules varies between the
> different
> entry points, non-efi boot, pvh boot, and efi boot. In the case of both A=
rm
> and
> x86 this value is fixed to values based on generalized assumptions. With
> hyperlaunch for x86 and dom0less on Arm, use of static sizes results in l=
arge
> allocations compiled into the hypervisor that will go unused by many use
> cases.
>=20
> This commit introduces a Kconfig variable that is set with sane defaults =
based
> on configuration selection. This variable is in turned used as the array =
size
> for the cases where a static allocated array of boot modules is declared.
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Christopher Clark <christopher.clark@starlab.io>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

> ---
>  xen/arch/Kconfig                  | 12 ++++++++++++
>  xen/arch/arm/include/asm/setup.h  |  5 +++--
>  xen/arch/x86/efi/efi-boot.h       |  2 +-
>  xen/arch/x86/guest/xen/pvh-boot.c |  2 +-
>  xen/arch/x86/setup.c              |  4 ++--
>  5 files changed, 19 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
> index f16eb0df43..24139057be 100644
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -17,3 +17,15 @@ config NR_CPUS
>  	  For CPU cores which support Simultaneous Multi-Threading or
> similar
>  	  technologies, this the number of logical threads which Xen will
>  	  support.
> +
> +config NR_BOOTMODS
> +	int "Maximum number of boot modules that a loader can pass"
> +	range 1 32768
> +	default "8" if X86
> +	default "32" if ARM
> +	help
> +	  Controls the build-time size of various arrays allocated for
> +	  parsing the boot modules passed by a loader when starting Xen.
> +
> +	  This is of particular interest when using Xen's hypervisor domain
> +	  capabilities such as dom0less.
> diff --git a/xen/arch/arm/include/asm/setup.h
> b/xen/arch/arm/include/asm/setup.h
> index 2bb01ecfa8..312a3e4209 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -10,7 +10,8 @@
>=20
>  #define NR_MEM_BANKS 256
>=20
> -#define MAX_MODULES 32 /* Current maximum useful modules */
> +/* Current maximum useful modules */
> +#define MAX_MODULES CONFIG_NR_BOOTMODS
>=20
>  typedef enum {
>      BOOTMOD_XEN,
> @@ -38,7 +39,7 @@ struct meminfo {
>   * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
>   * The purpose of the domU flag is to avoid getting confused in
>   * kernel_probe, where we try to guess which is the dom0 kernel and
> - * initrd to be compatible with all versions of the multiboot spec.
> + * initrd to be compatible with all versions of the multiboot spec.

Thanks for taking the chance to remove the space in the end of the sentence=
.

Kind regards,
Henry



