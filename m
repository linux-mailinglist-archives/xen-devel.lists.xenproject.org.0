Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65392586295
	for <lists+xen-devel@lfdr.de>; Mon,  1 Aug 2022 04:29:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.378479.611690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oILAf-0003uq-UO; Mon, 01 Aug 2022 02:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 378479.611690; Mon, 01 Aug 2022 02:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oILAf-0003sg-Q8; Mon, 01 Aug 2022 02:28:41 +0000
Received: by outflank-mailman (input) for mailman id 378479;
 Mon, 01 Aug 2022 02:28:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HgWw=YF=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oILAe-0003sa-OQ
 for xen-devel@lists.xenproject.org; Mon, 01 Aug 2022 02:28:40 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30049.outbound.protection.outlook.com [40.107.3.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5d58518-1141-11ed-924f-1f966e50362f;
 Mon, 01 Aug 2022 04:28:38 +0200 (CEST)
Received: from AS4P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::18)
 by AM9PR08MB7135.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Mon, 1 Aug
 2022 02:28:35 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5db:cafe::2d) by AS4P189CA0028.outlook.office365.com
 (2603:10a6:20b:5db::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.7 via Frontend
 Transport; Mon, 1 Aug 2022 02:28:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Mon, 1 Aug 2022 02:28:34 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Mon, 01 Aug 2022 02:28:33 +0000
Received: from e3cd763f889d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DD7A9ECC-671E-488C-A503-F1743B8D8198.1; 
 Mon, 01 Aug 2022 02:28:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e3cd763f889d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 01 Aug 2022 02:28:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB3934.eurprd08.prod.outlook.com (2603:10a6:803:df::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Mon, 1 Aug
 2022 02:28:19 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772%3]) with mapi id 15.20.5482.016; Mon, 1 Aug 2022
 02:28:19 +0000
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
X-Inumbo-ID: a5d58518-1141-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=f0E/XWYnyhOLy9/FyOqJl7VOV14KUbzVYp3qXxZit/VWkINcfLqr0n62hunZIW+qHoRWPDyIC5eiBIvYCCiNkGdG4ohr/XH+lfgxN+RgRbcO/upikfmwxV3R70pHBUCSxcc70yWcAXan0iwcVeJAq4PixipblvtDD9qgks06u4Fp6DlKLFfcr5yhqADxqW3IbrX7mD8tuFyi2ouxkEHE8yKKiDbZyaTF8gOYaP077STJ1J7pcFvqMp1PnD/jUTlFWRBEeHiAUbyxjDSIkDuPle6rAnsgv1GGKlSdPgkkS8+8bw1PaYE8TI6YHvm10OPxt9tqmUdBF976ejquZd5lvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ffvu7Kslyt4u+DFUG8QgKbf5/rd2PSyAa30/351HQns=;
 b=ZGwFQdkzDKzh8YQFYNamWrBVft8+MjhoYdmCT4vli3p/0WKEBiqanEcuuirD39EIOfA8k0/xGqoYIvLL0gKdr9FpjIJzGTv394xSRG4DnCF62nYaqClIlytkWzqLx9grKOOu4VzcMnfVZ8N353UuptBjN7Jln8llIYMVBuOsuFeTSzV1AKF89pbRkmN2miOvF7wcJUysYu3MRZB/DmKbTtb8kwMeftVtaRDKtAuq002Us12SFFO5FfDC4494QDZ/UsfLDqN18LQX2uSaVM36kUr95EYurlW/AK0ZW/btske/xXVUBdTEauRwnl+mZvToWDTnA60Mmat17zHYdInwzA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ffvu7Kslyt4u+DFUG8QgKbf5/rd2PSyAa30/351HQns=;
 b=7dnDJEBISz/jMrd+/C/tLa6U1UfvtVzW39ubPU/BEXBiI1IwFh+KNMleMIYRYzqNvHe/8XKBxXv8TlK8wFc3dYSEU9XneSMyYhdvYjf93NI2Sa5nZtFZZIQ7fohEoinAcgFGjU0QUF6WTg46gyjruyHTP813uiBY41+Bx56Udl8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MeBP8dfEiQgcYP7JGSouh8t0zrFvB/SGG2dAVcQObPGYea1DBuvLDFahtouB/Apn0/2dWnVsg4HLbCGzzSQlXhPVbpQyCQAex3+ywH7rPK1ciRMrwJh/X5XzUIEE4F/WJYNCoQGkxCngdVmNhFS2VYNUtB7oHMf0b3EHhNRN6Yyb3OIBjIUPaSkpbs25F7NgVWZsGSWYucjIRFedgMrlnyJH9vKk4XmJWqpHfn+sxGViBW++dM9yTUdDFBK7r33lScJEqZYwOaVvBj2sbmxGWIf9qbLZnPz1QjqXlW3RnOcIJMv0NLVrewvalSWGLq8s9ZQiI4u8QWYoASFDNTYMRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ffvu7Kslyt4u+DFUG8QgKbf5/rd2PSyAa30/351HQns=;
 b=LSn0xz6+0ocuLwIBEOESSF6j23hpECX70onlXKmumc9S2NbVHgJWk/od9WNyZ2TmymkDXMmpaiTIIWMwTqfNpUBS8BqGXivCVM362I1R9L0dylDGpbgenZ5VwKtF/IteS2gbIz4xoGnb5rzAw0897mnzqvVGt0IiwAxbG4bmXggqnWpTCdasAmmrlxL9v1hq5IQYX82yia478zEDl4czBjYMhAiltx0kK6LczJb5aK+xRDn9PXUiNSiI3CDH21jimfIeVbpyi42TimvYncbMPGsg+YkWU58a7dcWVHGYCgDyUxx6EjOw70tLqJu/mq36U0AnWAo6tamQ9VYiVCY0/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ffvu7Kslyt4u+DFUG8QgKbf5/rd2PSyAa30/351HQns=;
 b=7dnDJEBISz/jMrd+/C/tLa6U1UfvtVzW39ubPU/BEXBiI1IwFh+KNMleMIYRYzqNvHe/8XKBxXv8TlK8wFc3dYSEU9XneSMyYhdvYjf93NI2Sa5nZtFZZIQ7fohEoinAcgFGjU0QUF6WTg46gyjruyHTP813uiBY41+Bx56Udl8=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Julien Grall <jgrall@amazon.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Juergen Gross
	<jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Wei Liu
	<wl@xen.org>, "Wei Liu (LSG)" <liuwe@microsoft.com>
Subject: Reminder: Last posting date for Xen 4.17 is Fri Aug 12, 2022 
Thread-Topic: Reminder: Last posting date for Xen 4.17 is Fri Aug 12, 2022 
Thread-Index: AdilTB+JTXVONPGpQeecItnP/ErkOA==
Date: Mon, 1 Aug 2022 02:28:19 +0000
Message-ID:
 <AS8PR08MB79913A458D06BBC4498892D4929A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-Mentions: andrew.cooper3@citrix.com
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 065E3E8D64EF7C44AABF292B12089141.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 517d0353-2960-416d-bbde-08da7365887a
x-ms-traffictypediagnostic:
	VI1PR08MB3934:EE_|VE1EUR03FT004:EE_|AM9PR08MB7135:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 z/pFqY3Ak6vgWVR1tc+pR6Hmf7/Ahygcy8ADHlkzdDv54AZ6WCLqjGLZN8RqoYOHr66/jjzIugl1D88gbNPEDqKr9ko037zgRiqqwhS9mZo4m+lda/7saZqz042pqKYIbv/VVuDiNtBQpAMcnfXBA21t8UzdrscOBNl+GJOeWiP1mkznV8F3PHst3qbhHDU5rhf1r8PK9R/gHGwHRMiPikG4+cP2YhFV46bT81kzrFsDjwlymyL4+oJVwbjyOCc13wuFjCqlvDGhJLjZPiZ0xMujXYws+eiz8i5qO7Nh1HbrjcNxVMzdYR8siVaRJQ0xRYutdvf+b3dxm22t7hWoGwu9ipKTxoWWE/mcHib0BargCXHO5ov9GOI8Wk0CwbVojCqiep20hSyHxSQG3JKI5EDxeRDNGxE5aHuOOEZbHtjn0WDRfCQLn63TYmvK+bIW/S2jaVR7gZOfCSxb9xu0adukmt6MBJGCpvoUfC4aT281Tzd1qDjrkxonpd9EjW5/iePkdZ1c5PoOtXQMRGZd7mFZiE2XC3ZM0nU47MDPEpp29HHQTgffKNvya7RXd/kzXe2saB+LY2j6bz3AVTBvRkpJMmwk6zPPX15HLqTa9rtVNKdWzgZNRUhFLxB5sSnLa7T6ZCwvSI9HHZ3ASjWwtTUJMhbfahfHbQlUcI41S6/zRf+McuiOyIcZnbQeFUDrrXpcnXoW6/Hw+yV8SNLLin1I2QOAXHrAeLzRvv9C4D0t8z/CYQtktVwknIl7adeInz7wU4l9+RJK1YZ2pz53xz2UvymPNi4LEnq/U5D/4x7NDX+Cv/I0urGNS0rk5hi3ZB5C3QwDTWQSg7lCS5IfB8yUUqI3mXJQP9jVWvLyZ6w=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(396003)(366004)(376002)(346002)(136003)(71200400001)(478600001)(966005)(41300700001)(55016003)(2906002)(33656002)(54906003)(86362001)(66556008)(66946007)(76116006)(66446008)(66476007)(64756008)(316002)(110136005)(8676002)(186003)(38070700005)(38100700002)(9686003)(4743002)(7696005)(6506007)(26005)(83380400001)(52536014)(8936002)(4326008)(7416002)(5660300002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3934
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	59442341-9512-4435-7c88-08da73657f80
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h/PjNg1615AvFba1hycxt8ySvtayz9eYJgr9LlTX22qVO8QFjRdkvDNM0HjoWlcx03xX2lebqoBVemviYsmej00OyKZToJYJnQOJjrhHaVSNLQJxFvie4xX5atZwwXMe3bM9NvyEWdYMPib5qePp95g+B4+cmc3oYOxI4m4cZ0MhzMgcX0ocp5aa6t53bCzxrkdSO2qhoKLXxRJ15Zkr/b12xMkT/t5KXDS6umjm+wtG8Pzv0EjaqMyOAoGZaBer9bRbafTwgT66dEZj7ToFBaX3XzmEcERMXGF5RklveWL1PHnkxuJt+uYxP8WOQK8uuToqB+5lTVsQT8yuBdJqUdXyjjkumf1F/ehWFhA/xn1Yk+P2+UT9rp0+eVZAgyX9rSmwH2qsv7SG5uCSfCBL7+duEt6Xxth6dYGZnvFWstQnRlb/fe8aCW1OTjfxJNq/CtK9tUieKo9gdQwJv5REtNd+Kk5JE9ASTWQf4di++XnHTAD6kxH3aSwS4LI/uAtxlBvDKkP/LMQx3zZah+8TuSTG1wzMz1OxL9notrrFDyzqWxLgKV8JuVxn0A23FKPnq3X7YXWKORTqapZp5WSNzQzSspINm7R9SnB/eoCN0Q3jcO1jCXHa1y18ShAnAYTijxG8j67wSUaRr8PI2AphpG42Xf+ywSyK4PoiWRScOqd4017C5fHcDHRO6K8cBor78106IYylxz5p8g55tvA1gYofoUs9Ik/T2pSadyWxXX1IEzHbLwBcmFK/IOXYZRydnQopvTqPACZDy/KbLbl9s6wLRAOJkw/bOJIPiWLQLPpvR0iId7TNexqko2Fsdi8GVUp7CeGqAH5NWzR/an4J8oJw/zu1JT3Ke8k8rmGKYGzP1IF/jN+JRw115D+tefyN
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(46966006)(40470700004)(36840700001)(110136005)(2906002)(36860700001)(26005)(4743002)(82740400003)(6506007)(40480700001)(7696005)(55016003)(316002)(54906003)(356005)(82310400005)(40460700003)(41300700001)(9686003)(86362001)(336012)(478600001)(966005)(8936002)(107886003)(33656002)(70206006)(70586007)(5660300002)(83380400001)(81166007)(186003)(52536014)(8676002)(47076005)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 02:28:34.3699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 517d0353-2960-416d-bbde-08da7365887a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7135

Hi all,

This email is a weekly reminder about the Xen 4.17 release. The last postin=
g
date for Xen 4.17 is Fri Aug 12, 2022. If you want your features to be incl=
uded
for the release, please make sure they are posted for the first time before
**Fri Aug 12, 2022**.

Also, currently there are things in the Xen 4.17 release blocker list and t=
hese
should be addressed before the 4.17 release, so sending this email as a gen=
tle
reminder:

1. V2 of tools/xenstore: add some new features to the documentation [1]
Status:  Patch #1 is merged.
According to the discussion in the threads, patch #3 #4 is properly reviewe=
d.
Patch #2 needs a respin and we also need to clarify the integration with
migration/live-update.

2. Patch: x86: enable interrupts around dump_execstate() [2]
Status: Waiting for review.
This is a patch pending for more than 8 months. There has been already a
discussion (Thanks Andrew for the review!) but currently it is waiting for
Andrew's reply. Sorry to interrupt but @Andrew Cooper or other x86
maintainers could you please have a look. Thanks very much!

[1] https://patchwork.kernel.org/project/xen-devel/list/?series=3D645480
[2] https://patchwork.kernel.org/project/xen-devel/patch/e717897f-980d-ad44=
-31d9-39f5e7e1c45e@suse.com/

Kind regards,
Henry

