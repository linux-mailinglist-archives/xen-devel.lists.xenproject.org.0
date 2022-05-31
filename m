Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D827B538D80
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 11:10:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339358.564213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxtZ-0003OZ-5q; Tue, 31 May 2022 09:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339358.564213; Tue, 31 May 2022 09:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvxtZ-0003LR-2Q; Tue, 31 May 2022 09:10:33 +0000
Received: by outflank-mailman (input) for mailman id 339358;
 Tue, 31 May 2022 09:10:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a0MG=WH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nvxtX-0003LI-5y
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 09:10:31 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe08::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84677e9b-e0c1-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 11:10:30 +0200 (CEST)
Received: from AS9PR06CA0489.eurprd06.prod.outlook.com (2603:10a6:20b:49b::13)
 by DB8PR08MB5114.eurprd08.prod.outlook.com (2603:10a6:10:e7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 09:10:26 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49b:cafe::ad) by AS9PR06CA0489.outlook.office365.com
 (2603:10a6:20b:49b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 31 May 2022 09:10:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13 via Frontend Transport; Tue, 31 May 2022 09:10:25 +0000
Received: ("Tessian outbound 1766a3bff204:v120");
 Tue, 31 May 2022 09:10:25 +0000
Received: from e68040609057.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3B396DB2-DD7B-4AA2-A02F-CF0641244690.1; 
 Tue, 31 May 2022 09:10:18 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e68040609057.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 May 2022 09:10:18 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM8PR08MB6356.eurprd08.prod.outlook.com (2603:10a6:20b:36b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 09:10:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 09:10:16 +0000
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
X-Inumbo-ID: 84677e9b-e0c1-11ec-837f-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DfYH4WdIMrH4vDhwTJWs/NqWoDArOjSqws4bTZaJDj3ixDmqyNY2Ey//3yPdB2ZDOh7Ezm1C3dll/kIUzqz07EnCW50G018yrn/FvVdJydHyjgzSyS57mKvmkC+uFHUmEuPezsigCibzviKoZXMRTmwq43VgugxbkUgbETrCc2nqdK2P9NkFRY5mRVOXbt8D0no3eusUdXorUZCgv2o51JNVb/dFRu0e7q7L0/7s+f8FTeR82UsZu3uvJKM5DSijGLS/P3L93npSGH99ux5Sag0VfpsLjCYXkyeKv7wgV/C0krCEMdVlrC0/iFa+aXFtslihuGdMNm69I3H4dRacmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZ+euNN5l2t86xNwjY4BHVGDgJbhWVlfAUToXePuX20=;
 b=AYD9hcNGdKCTqbFkEzBWaDyw88MUG2+hLRKd81Y/O6M+WDoVzG1LbfXHPQkx1SUpZdKPWjnLXIGNK0X2dkbeup39dmNSpmno3vkqyWCt2jUdrV+iQHcyFGNKEEnqFKv9azr9rK4Xgm3WJIxdcEIAIVa0IKzOEmePb5bicv3D0PdUQb0H1Qj4/kG9zR5NATFNe77XuK4ejFEzruqcqxA0q4aX+QffHS5RCyAMJcqD3XclRkXYpxSs2oPJ0R6kKz1fewtRPFhM3U43C8GlwyUwo8OgZFRBKkxx2cwRJ//AVtoy0fpEr2ecgxDPi+XUOXDbbO65rRB5otsXj1D1GISZbw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZ+euNN5l2t86xNwjY4BHVGDgJbhWVlfAUToXePuX20=;
 b=6hNzaBd0E6x9jLHkBw4G/5mGkOzkH2iZ6jsaRNzjfMf99cvIggLXT3wh0ebqCnQUnojGsenOR5bYDth2dAr7EFoYpwhABeGCTogMQ4eTWAJrn4/dm6ncDwoikf8TiyVAnL1UeHTPi8lenNcDNt2af9z1nxNLossCg/Zx8ayjP9o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8f1b65eb93e0fcd6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kc56nxQAZGqwi7/2iiOeySzkdasRUVXZ0QGEauUKCLnoud2N/OGDHr0qWtcX+RShwqv64SvHtfOSvuZJt/upNXiUzOuYLxxBlLwWHGjphzdpgA5Bhk+gKf1Pm4T5x081nxTCpmBuHHF7FtRi7SEHgF3TTpliz41D+UPa0DMJq9zHxSko3jl1FYjzBhoLbFn3mo9gOPJvXVWL7JYDsX4v65d9T1k0HTbj2Z+l0rm8Z0mg2s/NDyu2Dxod8ZrgBEpAFSLrsjFQE3z13LbKioQpmhQIjjdEwbT0k+6+hkdd/3YH0Yub5wAmqkKJxktOZvcBO0gjONMi/Zbx4xi1JIRj3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZ+euNN5l2t86xNwjY4BHVGDgJbhWVlfAUToXePuX20=;
 b=FLH+dGLZLJPN7dNE/dLTgfeDdDRhIULY3tVh/r1LAhOmls9QWTG7e5dnUPZyC79LgL07LgUHkccNLQi3+StZOD8uoKw2HaKQ0WOXSviYVJH9BhqdrxXOomZHBOJa73+KN2bpPzXRR5/G58VpY8OjTgj6/UQO2pP+Xb51qW8M4aACAx85TyqT5L0cYn+0bjy5gZrGkKlBYUnWfGaidgsdkN7QwQE0AoQmiLVJwTRblrhBMUUf+ja0DQsKeDVic3DF9uhR7fw+dMU1XtvJmr81UFJUbM9yr2zj6XWfWOALEuBZxB0vNA6lSWtb8x8At9AkovFmH+n++lC8zEBq1AlEtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZ+euNN5l2t86xNwjY4BHVGDgJbhWVlfAUToXePuX20=;
 b=6hNzaBd0E6x9jLHkBw4G/5mGkOzkH2iZ6jsaRNzjfMf99cvIggLXT3wh0ebqCnQUnojGsenOR5bYDth2dAr7EFoYpwhABeGCTogMQ4eTWAJrn4/dm6ncDwoikf8TiyVAnL1UeHTPi8lenNcDNt2af9z1nxNLossCg/Zx8ayjP9o=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, "scott.davis@starlab.io"
	<scott.davis@starlab.io>, "christopher.clark@starlab.io"
	<christopher.clark@starlab.io>, "jandryuk@gmail.com" <jandryuk@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>
Subject: Re: [v2 3/3] xsm: properly handle error from XSM init
Thread-Topic: [v2 3/3] xsm: properly handle error from XSM init
Thread-Index: AQHYdHZ7mUVqfmYJ+0G1eO3EqIdC6q04s42A
Date: Tue, 31 May 2022 09:10:16 +0000
Message-ID: <D84E711C-22C0-40F8-B524-A4418B1C4C83@arm.com>
References: <20220531023945.22196-1-dpsmith@apertussolutions.com>
 <20220531023945.22196-6-dpsmith@apertussolutions.com>
In-Reply-To: <20220531023945.22196-6-dpsmith@apertussolutions.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 22666112-538a-419f-0b1c-08da42e56655
x-ms-traffictypediagnostic:
	AM8PR08MB6356:EE_|VE1EUR03FT064:EE_|DB8PR08MB5114:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB51143FA11C139C58EEE3960E9DDC9@DB8PR08MB5114.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OoE2/nDnTCyWfvzZvKEwH0forFgVIx46j0ueW4H3tcTsK860shhIQWjLqmQq6N7MNQIWv4KxJ6G4e5swlGFRmnpwKZMnO5UqQGxBLDdphJ5s4jCVqnTCyhenwDT9T/mpHIG9u4T8iCULMCd96G/ksp3hCHT9Qq4N5tsSZDywW5aziH1dZ5iijyPxD/0AsDX5AZ3mlcJ+tOPULBWm3Myho++ZRi2IiBBAOAnQWjsp6W9+NtgBU5+fkfKqp3OxedimoG5FsX71x9am7pXIbZ7b/QALK16OBy5sltiCCGcO9ta9XB2gkMF4pi94/Ez3kQBetnid398NLu7H+NmDlEBwdYufduv9J+uYJmYFJ+hN+xKgUrCJxRnLH7voH90Hqs8YAnT1H/h7xuLuv1S2kurINuKQnUBCYB0ax37kzKmZ6HTGcusO3zvFUQPrhYn0hoDc7KsR7FVn1hO/B5LJKad/095uvbeD74v/YPSteNs4edH60W6AW689xpXn+ZcmnYk9oeWqcBOTXkTj63xnWfoySsmSGpTws7OsVPYmz/+lTXgS4886VTcv3TTQuvF31EYAcorfYAq8Gc5g/zB0r+Dd1Bq+IfofqfaE4WY1jI+snImIA0LbfBg6d2ukYQY7//P06V2YcHk9mOfoI2TVcc+WVAWsMiErb71E3aN5R18xuVOn4MQl+tteY7NPeD21gJBSF7JIW+dmm2n5wbqCMHu13fgXlxUZ7q+bNbV8aJAqaZBT5uf3Uu1dRSAG/s7z90I4
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(4744005)(71200400001)(33656002)(5660300002)(7416002)(83380400001)(54906003)(38100700002)(122000001)(316002)(66946007)(53546011)(6506007)(4326008)(2906002)(64756008)(66446008)(66556008)(76116006)(6486002)(66476007)(91956017)(38070700005)(2616005)(6512007)(86362001)(8936002)(26005)(36756003)(508600001)(8676002)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1B6A2506CB06B54F9AA6D64430223AB9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6356
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	266ce073-da97-4024-49a7-08da42e560b7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ws5CQyp7BfsXdJP15AaQ/r9Htp8UaiiYfLj0Ekzd0bggRw2E0ppDghsW8aTUWpiY0Ltt7S3QEtKp/hMpNtAer+79JCoiJphY9RgDq1Em7z7Fj7qEIY3xoppsCj0Z34SkBdlS4gUKpKFhNvJOab4mfhqXmiggaFNQEy0AQMA05UDWkwZ0Bz0Bh8UzpoFBkWiaNW/L2GKAT+4oD3RH+oUAbyJTLtOLSF1MQNsCc2wfBuophSg3wggLjhxEqgMJ1p+QHP2V8AXsUHK4/FN2jQOWDJ94PDOmnF1t/++FQVyMc42ENqvLC5v8mLjIDNRPssmvygVAL7UAfW7WDnbDvOioagp9pVXuwGNKOzqhWDB1efbPpxQZC79STClXX3UelqQy0h+LouYNiX/dTDof3ABcAkNc0Etwaf7hhSRj0mrwM5rJY9GxEck/5caeO+zO+UAkww33RiSJbcncCYEtz5LBkcND/iBzLNnJQxmZ0JbqMK2JGf6ZOLmfToAi/z8JmRM5B0tKjzC5uSj4KSCt8nDZtMUK9jRRR9KAR5P++a/8eODrOBR1+4VMj2O77QA6aS/RbXHkO3Q8RZqRJUzTHjI6ZyDyE1/wBeDOASgnosTyej0+fxCsQrmlMlkM0MNtpc8wT8pwbSecNmK9K7+1TNEUe23+A8O3BjFtFW39bT8AQ5DHdBzOEa39XytDCTDb8eBe
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(8676002)(4744005)(356005)(53546011)(5660300002)(40460700003)(83380400001)(6506007)(6862004)(4326008)(36756003)(82310400005)(2616005)(8936002)(70206006)(70586007)(508600001)(186003)(316002)(2906002)(36860700001)(81166007)(86362001)(54906003)(47076005)(26005)(6486002)(6512007)(33656002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 09:10:25.7202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22666112-538a-419f-0b1c-08da42e56655
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5114

Hi Daniel,

> On 31 May 2022, at 03:39, Daniel P. Smith <dpsmith@apertussolutions.com> =
wrote:
>=20
> This commit is to move towards providing a uniform interface across
> architectures to initialize the XSM framework. Specifically, it provides =
a
> common handling of initialization failure by providing the printing of a
> warning message.
>=20
> For Arm, xsm_dt_init() was tailored to have an Arm specific expansion of =
the
> return values. This expansion added a value to reflect whether the securi=
ty
> supported XSM policy module was the enforcing policy module. This was the=
n used
> to determine if a warning message would be printed. Despite this expansio=
n,
> like x86, Arm does not address any XSM initialization errors that may hav=
e
> occurred.
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

For the arm part:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand



