Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E03556700F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 15:57:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361320.590779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8j2t-0000rn-M3; Tue, 05 Jul 2022 13:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361320.590779; Tue, 05 Jul 2022 13:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8j2t-0000oX-Ix; Tue, 05 Jul 2022 13:56:55 +0000
Received: by outflank-mailman (input) for mailman id 361320;
 Tue, 05 Jul 2022 13:56:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M7fe=XK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1o8j2s-0000o1-Ea
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 13:56:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2075.outbound.protection.outlook.com [40.107.22.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5273f784-fc6a-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 15:56:52 +0200 (CEST)
Received: from AM5PR0301CA0032.eurprd03.prod.outlook.com
 (2603:10a6:206:14::45) by AM0PR08MB3667.eurprd08.prod.outlook.com
 (2603:10a6:208:d5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Tue, 5 Jul
 2022 13:56:50 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::75) by AM5PR0301CA0032.outlook.office365.com
 (2603:10a6:206:14::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21 via Frontend
 Transport; Tue, 5 Jul 2022 13:56:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Tue, 5 Jul 2022 13:56:49 +0000
Received: ("Tessian outbound 3c5325c30453:v121");
 Tue, 05 Jul 2022 13:56:49 +0000
Received: from 65dd51f1652e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 60905307-56B7-43E1-9B86-1CF7DFA0D19F.1; 
 Tue, 05 Jul 2022 13:56:41 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 65dd51f1652e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Jul 2022 13:56:41 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by PR2PR08MB4634.eurprd08.prod.outlook.com (2603:10a6:101:1f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Tue, 5 Jul
 2022 13:56:40 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 13:56:39 +0000
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
X-Inumbo-ID: 5273f784-fc6a-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bmiyuYlBPOhSoifMc8WoC9uzY7Orz4/K61/mVnVyZXtlSBqI25SKnHsvs4qmq8n57hygWZaJy1vXn/ZkjQ3whaAyOcRKVnXZMFhfynnh3F8g3t2Z8Fh1yIUfsHmbj8rizU/aJ3aZIpVezl7WgEkLtsbNCXW5FNdRCIIl/HnNPRcn80WRYCFXZ8O0W+cGFLvy/ewDbfmfNOU+58QKqKRMjWLOTaeZ+HbN7+eI5eOxxeCtbvj+9JzQxL1Vt4ADEHgXbNWyZTGsOlw7c0qVfdTxRHIKQxdc5wcWbnebPDHM4Emp7FwT/PxdPOP1CcJF//x1RSL9ifIk2NkqqMXuYvXPEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sF58efq28Kqz77hh5t3+w9/PYs/O0V/yxFSFpda/52s=;
 b=myCeGcA94n7aji3A5v6tv7WSkxbaeFkliVXtgL8Se+/o4h8iXlvoy4ylzYW4b/7/WL4Le9p2SKfeLNyNKdjyGOpuVsqcFPpp85/0ftVArbpFHh/4ZG/QhM743f5gOFMDWj0X6rWBYK9cz+zsxo1wdB6xW7NLh/qGUC7GmgrrvozPVpxAYwzJuuEruy1Mkxr1D5fviDrLTUGAelIRZpFBOV0nxHSNCz0EmKtmEMUFSy/JDqztxodSqbIouhc5dc3TXOU4Olwun6Rh4wK6g3WD0P6PyClKeYJxLR5g+DB51vak3NzdHStUwqPRkhwXdChgaK9aVww59PB/QhuZpC4imQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sF58efq28Kqz77hh5t3+w9/PYs/O0V/yxFSFpda/52s=;
 b=4kbBpfxvMes24RJgKvSdc4TCbAew5giWsiPPCLqK7OXvZWFs+r/n6IU/DlDLsW4m0B4ajTDQ+6bgSBu8CMYppgMCQik+UAtme0t0FAoXSR437+cbn29rrHqi1gv+ZxaEarEgtRvr458TiK8rsrsN4Ss5U/jKIh+rlzdl2kDvsn8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 10393512b0d23c7f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9tl0Qw28IJhf36kccuJ2tOkUla02JXjKqHDr4GsGRKpRBYQhWptynH5dZpuW90/03sGdXJs1WYIRYe/x+DPgGZGvfpUhkjA2MbWd8Cgrx78lN/cbJKaQpGrLHijfusl3u4jvQtdsr7VW/UbRrG43NUIRJETyNG4W34UljUlmPoB/+bokMSM2/tpceapoqJ8hAQ6Pir927+3h9Kqr+qNI7V4vMFcI7MsBvL+5wZyi4yOVTwuAoPHS8Vf850+Hm+3fM5cDVSueeldoGQv39HjGcFhgaGpy96QNUYBji8k9zdEC9eThbNh/JUDmMQEvo8R2aRgPChMR7hJ9q2afz/T4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sF58efq28Kqz77hh5t3+w9/PYs/O0V/yxFSFpda/52s=;
 b=XECkKj9Eltw7hdj/P06qqB0VRixw67biVAcg3UPNLciNiQ4TmEzFWZhaW3SN0Kw9n2ofS2TvsEMAnLg8yW2HnH6Qu70HYVsnVEy1ccjctaLoa7bTwEfdqldnfjkfPTPVXKlkso6GojOyZyDBbPG56yaw/+T1tqn1OKOinSBm9ECQQikFH/5N8zejDXlJzSMa++60LS3OxjnXpLzk88/owODIXq2kt5UYgzt+11GGgFrWP/CzthiI+miGQ+yMYac6Wf3RGKs9PT7fgqbNRI4BIyZRUFTsSAZ5yOqn5GxLXHFJIhNdqZl1CtZe2FGtoa6AabwJaC58nPT9H51jpiDgvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sF58efq28Kqz77hh5t3+w9/PYs/O0V/yxFSFpda/52s=;
 b=4kbBpfxvMes24RJgKvSdc4TCbAew5giWsiPPCLqK7OXvZWFs+r/n6IU/DlDLsW4m0B4ajTDQ+6bgSBu8CMYppgMCQik+UAtme0t0FAoXSR437+cbn29rrHqi1gv+ZxaEarEgtRvr458TiK8rsrsN4Ss5U/jKIh+rlzdl2kDvsn8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Issue with check-endbr.sh during Xen build
Thread-Topic: Issue with check-endbr.sh during Xen build
Thread-Index: AQHYkHcMKffnFiUSAU+E175V5Z5atg==
Date: Tue, 5 Jul 2022 13:56:39 +0000
Message-ID: <815D8CFC-86A4-4C63-AA51-83C4C29E7AAD@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 88f501a7-00ac-41e2-1554-08da5e8e3523
x-ms-traffictypediagnostic:
	PR2PR08MB4634:EE_|AM5EUR03FT055:EE_|AM0PR08MB3667:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 S82BgshFoB6Z7bHTC3VGZCcBtJH9armtob4QfYDQAex/F1W/0qOqf1EfVrlQG/kI9/PUItpHmm4d1MmLomVBZ3I//vvPar4hzUM6OK10d1aOegfdwNyorqvB2f1b2cbVONDf6vc5K6YYsEHl0P819xrYhIAOYt4GrHz/umO+l7ccnNVKAAs/TZSTZTIrkYbhF1cGGDth9JKQpr9JB+jmiqXkSbwpTYraKPDcL3+if2Bw+v7PVhu0E7l7y4yefy3LOqZHFwhbt6zzzGn9oxStyudvI4i/zs5ISorFObdlg/TR6a7k7Oe9clgMtiU7mP7POV8R5QeeTgMvSSewTZyqHkonxxxjZaqN/yE4PgdeJcqY7Ln5zD+39MGaDTphqd2U8TtOpyXOcMzdUFO8BuvoegJeXwQsmTPqEBAXvpsx8FXu9/Yd/w4TpMrQDyc/8yrKGZKgEpaXZI9H3uy+S7M5EeuehK5jydAod5WZoHVlf6Ug4RmPXs+S+VMfK9gI5EQCjpB9560PnJNBkDXEfT7X/uTzvZtwtMn7RQkgZSCgK8cPDxoCgsUCqqXjmuVa5dqBB67iGIOCz17lzC4+N2XMrM7hKTYn8B6/NhE9eszmR9LcHBuQFKiIzFSMlHVvquiBxJ9fEgf6O2VAyOegszZ35gu8m4NTuV5U1LopOLcqIetlllRTCW4qRRwkQqMeW2XlDMjPCLdTm25zV6FywBNd7mKabAJUmXMq0n4Vowo1tUIw6v5wXIPaZqDZk4CjX41gEcD2LAOnvphhbnT/sETiAW4986zOqkrU+LRrVr82+e2obj1ZaZkRz+SGknG8poMbo4AQIA6WDkANhe0qwSEb0DQUX9lHAeDeSajUfxwDVlc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(6506007)(8936002)(478600001)(5660300002)(2906002)(76116006)(91956017)(41300700001)(38070700005)(33656002)(122000001)(66446008)(64756008)(8676002)(4326008)(66476007)(66556008)(38100700002)(66946007)(36756003)(71200400001)(186003)(6486002)(6916009)(26005)(54906003)(6512007)(86362001)(2616005)(19627235002)(83380400001)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F92BBBDACB8F0C4EBF775219AB667F0B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4634
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	365bc054-d440-465f-720a-08da5e8e2f45
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IKDzYTW7SrDGkjnl/tdtr/kFD5pTm4acZeAEzisZ/ICqx8uS/Ldo+wJVrPPUvRN4x7zXesxyZ5yPpoO7RnkT4Xes1lMpcIy3GyAKIWRe8mbxM/jdMfmZu48EygIhCRwSPpYpRwQ3BEDia8jb5xhTqCh874THMfXiZ8l2BlJnWbQp+Wbta8FOU2nEy/nD7YRU9KQTxBAc/lrzIp1BI/5ZFAfXWzVaQAE8MH4+oknCJlGGXad6Xvh3lEtXkpa+wxHPKNycz92ZJyykhr9i/z1Co9xVpg/rb3U26vFziaLeW0/ZYm09n0dYCjac19f2qV9GGmDF5ANVgsJSGbXNJfk5lkt5kj/C6ahUfnUcq/6VmaB9DWpDr9J4mr8FnSv+EqjZ88lqE6bg69zvp+5eH/ceG7YQ6BoYt0kkfQtXEIJIupq1MJFerurLnLtpiZBWxi2zpAD17qfneeeKWhk2OxTI8jj1E3D0gdTQInSYfdOCjsUqEIyaYg2pDzMkC1L1Gsp6I9zHhPfwOvfkosmd1OLRMDgd5kRXNWaDDHRA7DDBH8hST7TQeZotrotd8oyWXy/2OFfSMBtdPSslUOn7OkqzVqWonz+dFZw85wMcD+mVkDz/n/AwrxzZlDB3dc/vXlHnPf6RHUGORLM23KSMB3YT4Zu9JNxCcygK+tUu8lEb6dMWSN3+OadWNkTC+Z72Rpmv9F+urE+sJt/9qh7YKHmR5QkESQCe26t4cuaGYN7e74rX/S/aNTzvHo5lHqBFyK3Nt+DUCQ2z/jIl5u5ycAsW10EadGjhb70FaVpz0J1/dFzeORoaCIOq0dXyO3DzWSip
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(346002)(136003)(40470700004)(36840700001)(46966006)(4326008)(41300700001)(8676002)(6506007)(70206006)(70586007)(6486002)(316002)(54906003)(6916009)(40460700003)(478600001)(19627235002)(82310400005)(40480700001)(8936002)(2906002)(5660300002)(36860700001)(86362001)(36756003)(81166007)(33656002)(82740400003)(356005)(186003)(47076005)(2616005)(336012)(83380400001)(26005)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 13:56:49.5267
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f501a7-00ac-41e2-1554-08da5e8e3523
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3667

SGkgYWxsLA0KDQpJ4oCZdmUgZW5jb3VudGVyZWQgYW4gaXNzdWUgYnVpbGRpbmcgWGVuIGZvciB4
ODZfNjQsIGJhc2ljYWxseSB0aGUgc2NyaXB0IGNoZWNrLWVuZGJyLnNoIHdhcyByZXR1cm5pbmcg
YW4gZXJyb3I6DQrigJxFcnJvcjogTW9yZSB2YWxpZC1hZGRycyB0aGFuIGFsbC1hZGRyc+KAnS4N
Cg0KSSBoYXZlIGZvdW5kIGEgc29sdXRpb24gYnV0IEnigJltIHdyaXRpbmcgYW55d2F5IHRvIHlv
dSB0byBtYWtlIHlvdSBhd2FyZSBvZiB0aGUgaXNzdWUuDQoNCkluIG15IHNldHVwIEnigJltIHVz
aW5nIGEgZG9ja2VyIGNvbnRhaW5lciB3aXRoIGJhc2UgaW1hZ2UgZnJvbSB1YnVudHU6MjIuMDQs
IHdoZW4gSSBidWlsZCBmcm9tIHRoZSBjb250YWluZXIgaXQNCklzIGZhaWxpbmcsIGluc3RlYWQg
d2hlbiBJ4oCZbSBidWlsZGluZyBmcm9tIG15IG1hY2hpbmUgaXQgaXMgd29ya2luZyBmaW5lLg0K
DQpTbyBJ4oCZdmUgc2V0IC14IGluIHRoZSBzY3JpcHQgdG8gdHJhY2UgaXQgYW5kIEkgaGF2ZSB0
aGlzIGZvciBteSBob3N0IG1hY2hpbmUgKHhlbl94ODYtZG9ja2VyIGlzIGp1c3QgeGVuLXN5bXMp
Og0KDQokIC4veGVuL3hlbi90b29scy9jaGVjay1lbmRici5zaCB0bXBfZmlsZXMveGVuX3g4Ni1k
b2NrZXINCisgTVNHX1BGWD1jaGVjay1lbmRici5zaCB4ZW5feDg2LWRvY2tlcg0KKyBPQkpDT1BZ
PW9iamNvcHkNCisgT0JKRFVNUD1vYmpkdW1wDQorIEFERFIyTElORT1hZGRyMmxpbmUNCisgbWt0
ZW1wIC1kDQorIEQ9L3RtcC90bXAuM1RtVnAyaWRDbQ0KKyB0cmFwIHJtIC1yZiAvdG1wL3RtcC4z
VG1WcDJpZENtIEVYSVQNCisgVEVYVF9CSU49L3RtcC90bXAuM1RtVnAyaWRDbS94ZW4tc3ltcy50
ZXh0DQorIFZBTElEPS90bXAvdG1wLjNUbVZwMmlkQ20vdmFsaWQtYWRkcnMNCisgQUxMPS90bXAv
dG1wLjNUbVZwMmlkQ20vYWxsLWFkZHJzDQorIEJBRD0vdG1wL3RtcC4zVG1WcDJpZENtL2JhZC1h
ZGRycw0KKyBlY2hvIFgNCisgZ3JlcCAtYW9iIFggLXENCisgcGVybF9yZT10cnVlDQorIGVjaG8g
WA0KKyBncmVwIC1hb2JQIFx4NTggLXENCisgb2JqZHVtcCAtaiAudGV4dCB0bXBfZmlsZXMveGVu
X3g4Ni1kb2NrZXIgLWQgLXcNCisgZ3JlcCAJZW5kYnI2NCAqJA0KKyBjdXQgLWYgMSAtZCA6DQor
IG9iamR1bXAgLWogLnRleHQgdG1wX2ZpbGVzL3hlbl94ODYtZG9ja2VyIC1oDQorIGF3ayAkMiA9
PSAiLnRleHQiIHtwcmludGYgInZtYV9oaT0lc1xudm1hX2xvPSVzXG4iLCBzdWJzdHIoJDQsIDEs
IDgpLCBzdWJzdHIoJDQsIDksIDE2KX0NCisgZXZhbCB2bWFfaGk9ZmZmZjgyZDAgdm1hX2xvPTQw
MjAwMDAwDQorIHZtYV9oaT1mZmZmODJkMCB2bWFfbG89NDAyMDAwMDANCisgb2JqY29weSAtaiAu
dGV4dCB0bXBfZmlsZXMveGVuX3g4Ni1kb2NrZXIgLU8gYmluYXJ5IC90bXAvdG1wLjNUbVZwMmlk
Q20veGVuLXN5bXMudGV4dA0KKyB0cnVlDQorIExDX0FMTD1DIGdyZXAgLWFvYlAgXHhmM1x4MGZc
eDFlKFx4ZmF8XHhmYil8XHg2Nlx4MGZceDFmXHgwMSAvdG1wL3RtcC4zVG1WcDJpZENtL3hlbi1z
eW1zLnRleHQNCisgYXdrIC1GOiB7cHJpbnRmICIlcyV4XG4iLCAiZmZmZjgyZDAiLCBpbnQoMHg0
MDIwMDAwMCkgKyAkMX0NCisgd2FpdA0KKyBzdGF0IC1jICVzIC90bXAvdG1wLjNUbVZwMmlkQ20v
dmFsaWQtYWRkcnMNCisgdmFsX3N6PTI0MDA0DQorIHN0YXQgLWMgJXMgL3RtcC90bXAuM1RtVnAy
aWRDbS9hbGwtYWRkcnMNCisgYWxsX3N6PTI0MDA0DQorIFsgMjQwMDQgLWVxIDAgXQ0KKyBbIDI0
MDA0IC1lcSAwIF0NCisgWyAyNDAwNCAtbHQgMjQwMDQgXQ0KKyBzb3J0IC90bXAvdG1wLjNUbVZw
MmlkQ20vdmFsaWQtYWRkcnMgL3RtcC90bXAuM1RtVnAyaWRDbS9hbGwtYWRkcnMNCisgdW5pcSAt
dQ0KKyB3YyAtbA0KKyBucl9iYWQ9MA0KKyBbIDAgLWVxIDAgXQ0KKyBleGl0IDANCisgcm0gLXJm
IC90bXAvdG1wLjNUbVZwMmlkQ20NCg0KQW5kIEkgaGF2ZSB0aGlzIGZyb20gbXkgZG9ja2VyIGNv
bnRhaW5lcjoNCg0KIyAuL3hlbi94ZW4vdG9vbHMvY2hlY2stZW5kYnIuc2ggdG1wX2ZpbGVzL3hl
bl94ODYtZG9ja2VyDQorIE1TR19QRlg9J2NoZWNrLWVuZGJyLnNoIHhlbl94ODYtZG9ja2VyJw0K
KyBPQkpDT1BZPW9iamNvcHkNCisgT0JKRFVNUD1vYmpkdW1wDQorIEFERFIyTElORT1hZGRyMmxp
bmUNCisrIG1rdGVtcCAtZA0KKyBEPS90bXAvdG1wLnRSMFZ0OGwyaWUNCisgdHJhcCAncm0gLXJm
IC90bXAvdG1wLnRSMFZ0OGwyaWUnIEVYSVQNCisgVEVYVF9CSU49L3RtcC90bXAudFIwVnQ4bDJp
ZS94ZW4tc3ltcy50ZXh0DQorIFZBTElEPS90bXAvdG1wLnRSMFZ0OGwyaWUvdmFsaWQtYWRkcnMN
CisgQUxMPS90bXAvdG1wLnRSMFZ0OGwyaWUvYWxsLWFkZHJzDQorIEJBRD0vdG1wL3RtcC50UjBW
dDhsMmllL2JhZC1hZGRycw0KKyBlY2hvIFgNCisgZ3JlcCAtYW9iIFggLXENCisgcGVybF9yZT10
cnVlDQorIGVjaG8gWA0KKyBncmVwIC1hb2JQICdceDU4JyAtcQ0KKyBvYmpkdW1wIC1qIC50ZXh0
IHRtcF9maWxlcy94ZW5feDg2LWRvY2tlciAtZCAtdw0KKyBncmVwICcJZW5kYnI2NCAqJCcNCisg
Y3V0IC1mIDEgLWQgOg0KKysgb2JqZHVtcCAtaiAudGV4dCB0bXBfZmlsZXMveGVuX3g4Ni1kb2Nr
ZXIgLWgNCisrIGF3ayAnJDIgPT0gIi50ZXh0IiB7cHJpbnRmICJ2bWFfaGk9JXNcbnZtYV9sbz0l
c1xuIiwgc3Vic3RyKCQ0LCAxLCA4KSwgc3Vic3RyKCQ0LCA5LCAxNil9Jw0KKyBldmFsIHZtYV9o
aT1mZmZmODJkMCB2bWFfbG89NDAyMDAwMDANCisrIHZtYV9oaT1mZmZmODJkMA0KKysgdm1hX2xv
PTQwMjAwMDAwDQorIG9iamNvcHkgLWogLnRleHQgdG1wX2ZpbGVzL3hlbl94ODYtZG9ja2VyIC1P
IGJpbmFyeSAvdG1wL3RtcC50UjBWdDhsMmllL3hlbi1zeW1zLnRleHQNCisgdHJ1ZQ0KKyBMQ19B
TEw9Qw0KKyBncmVwIC1hb2JQICdceGYzXHgwZlx4MWUoXHhmYXxceGZiKXxceDY2XHgwZlx4MWZc
eDAxJyAvdG1wL3RtcC50UjBWdDhsMmllL3hlbi1zeW1zLnRleHQNCisgYXdrIC1GOiAne3ByaW50
ZiAiJXMleFxuIiwgImZmZmY4MmQwIiwgaW50KDB4NDAyMDAwMDApICsgJDF9Jw0KKyB3YWl0DQor
KyBzdGF0IC1jICVzIC90bXAvdG1wLnRSMFZ0OGwyaWUvdmFsaWQtYWRkcnMNCisgdmFsX3N6PTI0
MDA0DQorKyBzdGF0IC1jICVzIC90bXAvdG1wLnRSMFZ0OGwyaWUvYWxsLWFkZHJzDQorIGFsbF9z
ej0xOTY4Ng0KKyAnWycgMjQwMDQgLWVxIDAgJ10nDQorICdbJyAxOTY4NiAtZXEgMCAnXScNCisg
J1snIDE5Njg2IC1sdCAyNDAwNCAnXScNCisgZWNobyAnY2hlY2stZW5kYnIuc2ggeGVuX3g4Ni1k
b2NrZXIgRXJyb3I6IE1vcmUgdmFsaWQtYWRkcnMgdGhhbiBhbGwtYWRkcnMnDQpjaGVjay1lbmRi
ci5zaCB4ZW5feDg2LWRvY2tlciBFcnJvcjogTW9yZSB2YWxpZC1hZGRycyB0aGFuIGFsbC1hZGRy
cw0KKyBleGl0IDENCisgcm0gLXJmIC90bXAvdG1wLnRSMFZ0OGwyaWUNCg0KDQpBZnRlciBzcGVu
ZGluZyBhIGJpdCBvZiB0aW1lIHRvIHVuZGVyc3RhbmQgd2hhdCB0aGUgc2NyaXB0IGRvZXMsIEni
gJl2ZSBjaGVja2VkIHRoZSBhd2sgdmVyc2lvbg0KYW5kIHNlZW1zIHRoYXQgdGhlIHNjcmlwdCBp
cyBmYWlsaW5nIGluIHRoZSBEb2NrZXIgY29udGFpbmVyIGJlY2F1c2UgdGhlcmUgaXMgbWF3ayB0
aGVyZToNCiMgYXdrIC1XIHZlcnNpb24NCm1hd2sgMS4zLjQgMjAyMDAxMjANCkNvcHlyaWdodCAy
MDA4LTIwMTksMjAyMCwgVGhvbWFzIEUuIERpY2tleQ0KQ29weXJpZ2h0IDE5OTEtMTk5NiwyMDE0
LCBNaWNoYWVsIEQuIEJyZW5uYW4NCg0KcmFuZG9tLWZ1bmNzOiAgICAgICBzcmFuZG9tL3JhbmRv
bQ0KcmVnZXgtZnVuY3M6ICAgICAgICBpbnRlcm5hbA0KY29tcGlsZWQgbGltaXRzOg0Kc3ByaW50
ZiBidWZmZXIgICAgICA4MTkyDQptYXhpbXVtLWludGVnZXIgICAgIDIxNDc0ODM2NDcNCg0KSW5z
dGVhZCBpbiBteSBob3N0IG1hY2hpbmUgdGhlcmUgaXMgZ2F3azoNCiQgYXdrIC1XIHZlcnNpb24N
CkdOVSBBd2sgNC4xLjQsIEFQSTogMS4xIChHTlUgTVBGUiA0LjAuMSwgR05VIE1QIDYuMS4yKQ0K
W+KApl0NCg0KDQpTbyB0aGVyZSBzZWVtcyB0byBiZSBhIGRlcGVuZGVuY3kgb24gdGhlIGludGVy
cHJldGVyIChvciBhdCBsZWFzdCBpdCBkb2VzbuKAmXQgd29yayB3aXRoIHRoYXQgdmVyc2lvbiBv
ZiBtYXdrKS4NCg0KTXkgc29sdXRpb24gd2FzIHRvIGluc3RhbGwgZ2F3ayBpbiB0aGUgY29udGFp
bmVyIGFuZCBldmVyeXRoaW5nIHdhcyB3b3JraW5nIGZpbmUgYWZ0ZXJ3YXJkcy4NCg0KQ2hlZXJz
LA0KTHVjYQ0KDQoNCg0K

