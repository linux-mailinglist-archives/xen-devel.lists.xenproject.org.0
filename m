Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C240F63088B
	for <lists+xen-devel@lfdr.de>; Sat, 19 Nov 2022 02:40:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445969.701429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owCpg-0001dm-0s; Sat, 19 Nov 2022 01:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445969.701429; Sat, 19 Nov 2022 01:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owCpf-0001aS-Ss; Sat, 19 Nov 2022 01:39:47 +0000
Received: by outflank-mailman (input) for mailman id 445969;
 Sat, 19 Nov 2022 01:39:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VbUS=3T=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1owCpe-0001aM-7P
 for xen-devel@lists.xenproject.org; Sat, 19 Nov 2022 01:39:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09cf5131-67ab-11ed-8fd2-01056ac49cbb;
 Sat, 19 Nov 2022 02:39:42 +0100 (CET)
Received: from DUZPR01CA0064.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::17) by PAWPR08MB9590.eurprd08.prod.outlook.com
 (2603:10a6:102:2e8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Sat, 19 Nov
 2022 01:39:39 +0000
Received: from DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c2:cafe::6b) by DUZPR01CA0064.outlook.office365.com
 (2603:10a6:10:3c2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Sat, 19 Nov 2022 01:39:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT046.mail.protection.outlook.com (100.127.142.67) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Sat, 19 Nov 2022 01:39:39 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Sat, 19 Nov 2022 01:39:39 +0000
Received: from 7233a6393383.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EDB50CCD-11C3-4560-A55D-AE9198E895D1.1; 
 Sat, 19 Nov 2022 01:39:32 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7233a6393383.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 19 Nov 2022 01:39:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB9055.eurprd08.prod.outlook.com (2603:10a6:102:343::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.8; Sat, 19 Nov
 2022 01:39:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%9]) with mapi id 15.20.5834.009; Sat, 19 Nov 2022
 01:39:31 +0000
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
X-Inumbo-ID: 09cf5131-67ab-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPmB5r0Qb0oqisuYaZfatXH2js6mSfv/b+/205Fi+vo=;
 b=2VYm6Pow5u9v+ZsI8Dq6k4f7cHg3NqnGbuT5MqP7gOkSmdklA5yj0qsZTCkBArYco5VCAwGx8WJxY+DtcCfgCojYEZFNoKLodfQcdS9DuFUC7pUCqDbj1sKMUPYEXQhUgvPDBnMJJdakTRk3sfjkB1Ayktn7/8ltW70ZYdu0mPw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEIobXLEZyKhk9881WgwZANJpUQBTEHjmeEx85pTbf5uMkW0BzQfk7RLad2RUX+6u1Zgl7L72XaVS3R//UKitIBbSrC1ra/TSRQSFIxDB6Ww0s9Ohg8SniHOZHDm1Auf2rZduNisJ5WUy12DbTjfCTFEgIJGqQvuJl5lJwbFYFp/To4YXiyx3zYazb2OUK74CQUjsqqIU9sS+D/pp4byx2mQk2WtpNnlMRzf8ID/wKmqyGBo4yDoWl3r730NkN4/HaFj+OdlUb9OcR41/rNDfPA0cPf0/GsO5HFFuzYyqfPaA8jaP1mzEAFI87BdWO/7hI72aLG4jwayBVeq0ngDNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPmB5r0Qb0oqisuYaZfatXH2js6mSfv/b+/205Fi+vo=;
 b=YgpczSQiQkCzymzBOjNOQO1DI1ApRnL47K80VbmjfFT94sE/US6Si7vs4PbyiZF4vkgUXOm9zkIZ2JI6yNGNwejaDC5OJb1vFMINvz83t92JuZJ48Ixah2xcc1yAPWg4vk+6qvc5ZtKA/2+rhzhNMJPUnV/tPRDYT0tHO5j16Yr7vfet7MmJ/bBFr9Nbs9mtAixzy1h8SCNoT4chTKrgMDRybNmGAde4b+RenGApsq8NSqg/c+jJERpIQkzg3RDxpLhBA1cCcB8PsdqGGAcRN0nlGGpSixRdz6yQM0+nXy5+mXXiJLrufom1bBFIiYsYeWxIqAtXvxPUfwgwDa+uvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPmB5r0Qb0oqisuYaZfatXH2js6mSfv/b+/205Fi+vo=;
 b=2VYm6Pow5u9v+ZsI8Dq6k4f7cHg3NqnGbuT5MqP7gOkSmdklA5yj0qsZTCkBArYco5VCAwGx8WJxY+DtcCfgCojYEZFNoKLodfQcdS9DuFUC7pUCqDbj1sKMUPYEXQhUgvPDBnMJJdakTRk3sfjkB1Ayktn7/8ltW70ZYdu0mPw=
From: Henry Wang <Henry.Wang@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Juergen
 Gross <jgross@suse.com>
Subject: RE: [XEN PATCH for-4.17] libs/light: Propagate
 libxl__arch_domain_create() return code
Thread-Topic: [XEN PATCH for-4.17] libs/light: Propagate
 libxl__arch_domain_create() return code
Thread-Index: AQHY+245sY2WpYuKG0eYsgh9xhHeR65FeJEA
Date: Sat, 19 Nov 2022 01:39:31 +0000
Message-ID:
 <AS8PR08MB7991DEC6DB2D9F9ACAB3B33392089@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221118165235.14143-1-anthony.perard@citrix.com>
In-Reply-To: <20221118165235.14143-1-anthony.perard@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: BAA1DF80BFE6044789EB0732A9F95C72.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAWPR08MB9055:EE_|DBAEUR03FT046:EE_|PAWPR08MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: d420e06d-e523-4252-d8b5-08dac9ceec77
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1utKKLiDQjzh8B6eB/maOFcqNeEoP4J5KTV5Qyr/KdrIiZbygD0MDSTTH8D4Y++E4gwboFm1dwO6m9LT0b9NbrjhOYKhOHghz0Hv3PBHGBGGq/4O+Y6sqAgAFQm2Fwe9L3On/vXlWDhMr9tP9w3Frojiwfgb2NlQf3oLOt8XZgmJ/A6UKfVHMx/P7nnVIeoqdLcQGX6t4BrqSnDQ5yGhPDzVoXpEzWI8vbu7tUyhrOWsCsBg8zv3SN0jaPVe+tI8Q2intXxi5zkAvonqXxV5B+mxfagdV1RdNjUp4OVBAD4xNVHKJRw3jCAl50e7kQHTg+gsU8xlrATzHUZaX/Gcea24FjnXJZDbMy7ciNENgAuyLujvMw3THoC20kZvFBk0qJYssZLyo6KvLVZhAxkvg49fY5ITmZ6TyBxjeFOD6FqWoE4uY3lny/lYUWkfjyLypbJAbJWBDirGHB+hrSUsdzy2Iq60NK6cTYQJFH+VBnqt+s5CohFmlnHuiclzMKXB5qV/diLhRK0G2E0/gl6wjej/j8okXPQNwtLsYC3nj3xr/vO0/3bx6w6I8IwXGcXar6Le+rC+O7V+rGHa4cxzVH11TXyPEzakN4KRvg4uXjsVq5lLFwssob6muhzxQioZ3LQUq8h1ovQ2+Zs09gRwBG8OwCrPY602Npcv4JfZ4+oCzq47XpWuiqTDRKbwDHs90tm5z9lVHMm9ci1anrrhzZjdRZCTkXHYvL2/om+O0S0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(451199015)(316002)(54906003)(2906002)(478600001)(110136005)(6506007)(66946007)(9686003)(7696005)(71200400001)(26005)(76116006)(186003)(41300700001)(8936002)(4326008)(122000001)(83380400001)(4744005)(38100700002)(55016003)(5660300002)(52536014)(8676002)(86362001)(66476007)(66556008)(33656002)(66446008)(38070700005)(64756008)(101420200003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9055
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	35f714be-e358-4f07-060b-08dac9cee790
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1oXQZPUUqRkfGgayG+k+lwmh5nJjxI1lBLNxgESk7KvvjsEi7yfCcLoLma7NTOA1BYvaKwr3yaiqyjkc3L6fS4IMVM82jVlT0hRplHqshCpiGXugGXxvkqxMfKiPrN8lbF+3kszlNQSF2Cm0qpfBuovKDTyI347cl9B8dllFLCHfm4+7O9C3ewiQS8WEFpkE5X0NHT/SxxEU05puvleY/1IISkjve0kd0NZRHvSKImH/JC4VvHavq1iC77rEMwh3e/O9cbmZhha4oVD0UN4aueBIHxnHjTXOR5ctoWqAOn5boSGvg8K9F0chFg2gdaimBtF1cn6wvP1gQZYlww0RLoDIZ4S605UQN45riV+TnqfeFgGmArNymuGOLp7tmFZ5hvg3Hj8LIAyzHZojj/ZI/HRlLWcS0ccEbQvhJ9NEgn+eYaSihx4JaTZUSnDr9BfkL18mZLHZwYA54ZHnDYEP9KeanDinoJofOy0ImVoT7ofulSmF0lQ27tUuTbSqVD8lIUORTSOG9b8GOl9yWHVMTaTru+bakZBS9Sr3UoAq1eFN3Oq37Or33TJE2CV5cGiZUhpyxxYGhBMdGiCrVdpe3EFc7FcfQGrhTd+oatCwMkIIinOB76SCKx1PuzatgdtwPAElulDJeH/hAfvLtQyt+esI1hz/HqPK3B9gR4/8YC+mxPOgfHpnRO6T/sPvlT9Hz1DGljVSiHZmxVVB2dhBeWkVf/gJQX8uMvAb8E/NH7sby5MjXYA23fmmgVb9AlvS
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(40460700003)(186003)(110136005)(33656002)(5660300002)(336012)(316002)(54906003)(9686003)(26005)(7696005)(6506007)(4744005)(41300700001)(70586007)(52536014)(8936002)(4326008)(70206006)(8676002)(40480700001)(36860700001)(82310400005)(356005)(81166007)(82740400003)(83380400001)(47076005)(55016003)(2906002)(86362001)(478600001)(107886003)(101420200003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2022 01:39:39.3913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d420e06d-e523-4252-d8b5-08dac9ceec77
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9590

Hi Anthony,

> -----Original Message-----
> From: Anthony PERARD <anthony.perard@citrix.com>
> Subject: [XEN PATCH for-4.17] libs/light: Propagate
> libxl__arch_domain_create() return code
>=20
> Commit 34990446ca91 started to overwrite the `rc` value from
> libxl__arch_domain_create(), thus error aren't propagated anymore.
>=20
> Check `rc` value before doing the next thing.
>=20
> Fixes: 34990446ca91 ("libxl: don't ignore the return value from
> xc_cpuid_apply_policy")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

