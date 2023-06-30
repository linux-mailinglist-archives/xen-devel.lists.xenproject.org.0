Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 885587431E4
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 02:47:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557221.870381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF2HT-0005t4-Ll; Fri, 30 Jun 2023 00:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557221.870381; Fri, 30 Jun 2023 00:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF2HT-0005q2-Ix; Fri, 30 Jun 2023 00:46:35 +0000
Received: by outflank-mailman (input) for mailman id 557221;
 Fri, 30 Jun 2023 00:46:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iY3W=CS=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qF2HS-0005pt-RC
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 00:46:34 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe16::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e32016b-16df-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 02:46:31 +0200 (CEST)
Received: from AS9PR0301CA0054.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::12) by DB9PR08MB6603.eurprd08.prod.outlook.com
 (2603:10a6:10:25a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 00:46:28 +0000
Received: from AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:469:cafe::19) by AS9PR0301CA0054.outlook.office365.com
 (2603:10a6:20b:469::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Fri, 30 Jun 2023 00:46:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT059.mail.protection.outlook.com (100.127.140.215) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.21 via Frontend Transport; Fri, 30 Jun 2023 00:46:27 +0000
Received: ("Tessian outbound c63645f235c1:v142");
 Fri, 30 Jun 2023 00:46:27 +0000
Received: from 16284118fde7.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6919367E-724A-45B8-9852-CD8DEF232850.1; 
 Fri, 30 Jun 2023 00:46:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 16284118fde7.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Jun 2023 00:46:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB7495.eurprd08.prod.outlook.com (2603:10a6:10:36c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 30 Jun
 2023 00:46:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%7]) with mapi id 15.20.6521.026; Fri, 30 Jun 2023
 00:46:13 +0000
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
X-Inumbo-ID: 8e32016b-16df-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk0AC1RR/0yRhUanGPKRace5jssaaF2t07UhAg3FgKM=;
 b=I+9bCVHwX+bB+9YZsBvrn4iV6Uz9UMucevNXRpGSHf9yMXbbQeGNY3SDhSG5U11EMVOHfq+GURH8l9q5tdsqiFsagXgEL2zlf4UxLyPbudWqGzH015yj5H88MzkGhm5B05of/tBNuSQHht0OCXn4YBXMrsMq/O02VPdwegrkM8g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c6e356c481201c5e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZ0PyY+gX/3UCsxWG7w0HZSFh9f/qOD4Saylw0Vj5+pd+vi8nh+rQpH06iKUJEQojHzQU4jD728biqLI5IXgu60jA56R4ZBgoKF5Qz8Cj4HWlmKGyoNu5MBaAIbhraZNETjjrnNySP5Pke61C7zQRxnFJwYOaJxW3655h8hukywYQf2j79/o15gBWtEQYDnNoTUFoCoellOmPe+i8hp+btHZ7hasYL2F2Zjuj6qpux+M6GHC44iXSSZUPzRRJ1s/enQLk1BGcJHrnKE2QrgWmmBS8Avpl+VO2KrnTDH7mUatA8vx0Eof1GewTlpVrFE6XbrrvKNXkVJpDJu3zETqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hk0AC1RR/0yRhUanGPKRace5jssaaF2t07UhAg3FgKM=;
 b=ZdTIXS+6XWM8zPxVLkoD11LqOovj5XV548IQA1hMgbwm+ztaUB7FhexK6PF797Gvcascl9iuYrEBN3UMhP81AZ8fLdbT0MPyTA2ZgfuzxIqqA7iS+kwEhuISk2n2slCcdSr7ZKxkiKm1LrNfl0/RxMJK0xDKRNDodJn5I5w+y8vYodwlQgaLLNjHd1xQf8vn1/rSFVIEgoA7/Uq/2KIwG53eaZDJSCwnLQgnrDrjFLGh7RCuiE330pjWan0cyhFWmGhVtyEON17JoRnB4KRdL/DgqsNRyvr0nuR8HAYfrzd0lsWWPxgk0W56mIXk5CSV5diDjCRDQi7Yy7+MAS7FGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hk0AC1RR/0yRhUanGPKRace5jssaaF2t07UhAg3FgKM=;
 b=I+9bCVHwX+bB+9YZsBvrn4iV6Uz9UMucevNXRpGSHf9yMXbbQeGNY3SDhSG5U11EMVOHfq+GURH8l9q5tdsqiFsagXgEL2zlf4UxLyPbudWqGzH015yj5H88MzkGhm5B05of/tBNuSQHht0OCXn4YBXMrsMq/O02VPdwegrkM8g=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>,
	"federico.serafini@bugseng.com" <federico.serafini@bugseng.com>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
Subject: RE: [PATCH] xen/arm: grant-table: Correct the prototype of the arch
 helpers
Thread-Topic: [PATCH] xen/arm: grant-table: Correct the prototype of the arch
 helpers
Thread-Index: AQHZqsz3/pX1kq6zlkOe7xuFvx2f0K+iWuww
Date: Fri, 30 Jun 2023 00:46:13 +0000
Message-ID:
 <AS8PR08MB7991279EF465D0ECE374F927922AA@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230629210150.69525-1-julien@xen.org>
In-Reply-To: <20230629210150.69525-1-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8537D58098736B4B818DE4EB3E8FEECD.0
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB7495:EE_|AM7EUR03FT059:EE_|DB9PR08MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 3545adc8-ee34-4c46-0675-08db79037019
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oyT0x48iidKJ983D2rbdvUovGTCbuaesjamC44bVR9fKXBHISpoafYGkf+gvUw498CiF7A57ETe2f29dJlVfQxIT0SmhT0oquyLI4t9MIZpuEjm3eIIjLLCSarSDD7c4G9HDBbmnFSWsWHq09CaKNyWp4whjygKp8oau+86gbgAv65hc9o9OfuqEMBQ4HQdurb63X0ho6R/8BvXRpKqUjTKwFSvjtludv4y0MYAr1sdIB8hBsO/FbriY48Me03uNn9u9EM9739kCBCTwwOMnieiy4gxj3FhnWBksD4p3e7045v0H2KdD2EW1P56GicfT4e7ZJ+UDCvJvcddWa5c2rYnPh/CHsSmRJv6JNoIve4PGUaR7QR4+q2EH9rEbFbgOzxuAJDlvIY45YlpdMyxuttyLvmjosvu9NpN5Iz08Gm3h4VUvT+6WeodU1w/bSJWzFHtMlvgj7Fj/mYjQjrxlYO/+EZsgPi+z6yAYdE4UheLlTTjop1zsvenkEfdxYcc9s16DSDL2Rz5dYPyg4NJkQxsUeU9iJpAaiexOH/QL2m0pxXmtbYwGzL0gz8tQ8g5nliDCyLHoXJwO8k5yj0XkMvvQg/1mc2Ic26iMMW9M9LUjiRst0HbdccDLYo1J4SeZ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199021)(9686003)(26005)(4326008)(66476007)(66556008)(38070700005)(8936002)(6506007)(110136005)(7696005)(478600001)(54906003)(2906002)(83380400001)(186003)(4744005)(71200400001)(33656002)(66946007)(76116006)(52536014)(55016003)(38100700002)(64756008)(5660300002)(86362001)(122000001)(8676002)(316002)(41300700001)(66446008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7495
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	96bf205d-1540-4ede-7fbb-08db790367c2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EZiO+I+EfWBPBJBdIwTpvrNZ8S0DqAZ0dh2saIutwsXBsXM/KLn8czUxtkMyFUPyPEzmKrxV3MD+daD4qCclBueSATkltHQ8OFMC37FYuLhFY3GXHV1bRittvUldlQvh6r80FEHsutAcgGyDi5aVmgNBmu9Ppo4IVSYCgbR096ujKss2lzB7hpZX1zeTv7Z8cS9x/K9smtlxz03kaoqmQyxsjOxnkfaoNhMCH4l0q9EFnrPls4u4fzCQKFqZcQAgw+VmsEgN11u3qlxcL337BRJNN/iLewJyu5ONo5K/6ztwN4hzHnTtPXUavdBYGUrdNP2XrdQK/CRacT1g9Dd/QUpXulyG8eda/uxT3WBdcfP+VJ7A4BYaqaG5WdPNKI9ghQ23FrPhki6H2hvQdTj578KIzNgphmvGs9rh1m2JrDiWAXwnZ0Mm6iBAu/A9UcaUhAYssRCn7sitj7ajA3IIWvJExakI9oakjfHUBz++/7telZrYZ9TfgbiZg8NapUaefFMKkr044Y/6VyGyS2UMrK+Pw+t3pV0Mm/mPDroYG2VILzrZ1+LAgTCAgnNh2MZw9Po8SJCcMG4zfhQDBmyCcTxPEW4Pog99oUwvzs1dxY7yaqugAGOSQEcRNHiiXOzXEkv+qx72L2iyF3J4x7WUtmFxDltEQavtbyfjYJmUqD3Chsx9+GAQFYRXqKVwO3KEsZzOtqsjDFxYgGeHE4buTihC8M+O++yZR2mhcSQwpAfGbb6VFO9Ta67CjD7NjZP3
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(82310400005)(36860700001)(40460700003)(33656002)(70206006)(356005)(52536014)(4744005)(5660300002)(8676002)(41300700001)(8936002)(40480700001)(316002)(86362001)(4326008)(82740400003)(55016003)(70586007)(81166007)(107886003)(47076005)(6506007)(9686003)(26005)(2906002)(186003)(7696005)(478600001)(54906003)(110136005)(83380400001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 00:46:27.4983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3545adc8-ee34-4c46-0675-08db79037019
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6603

Hi Julien,

> -----Original Message-----
> Subject: [PATCH] xen/arm: grant-table: Correct the prototype of the arch
> helpers
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Both the stub and the x86 prototypes for replace_grant_host_mapping()
> and create_grant_host_mapping() will define the first parameter (and
> third for the former) as uint64_t. Yet Arm will define it as
> 'unsigned long'.
>=20
> While there are no differences for 64-bit, for 32-bit it means
> that the address should be truncated as 32-bit guest could support
> up to 40-bit addresses.
>=20
> So replace 'unsigned long' with 'uint64_t' for the first parameter
> (and third parameter for replace_grant_host_mapping()).
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

