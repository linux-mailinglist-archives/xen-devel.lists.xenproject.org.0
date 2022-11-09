Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC69622484
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 08:20:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440672.694782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osfNm-0004A6-1W; Wed, 09 Nov 2022 07:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440672.694782; Wed, 09 Nov 2022 07:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osfNl-000489-Us; Wed, 09 Nov 2022 07:20:21 +0000
Received: by outflank-mailman (input) for mailman id 440672;
 Wed, 09 Nov 2022 07:20:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lI5b=3J=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1osfNk-000483-MU
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 07:20:20 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2083.outbound.protection.outlook.com [40.107.103.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f698dd79-5ffe-11ed-8fd1-01056ac49cbb;
 Wed, 09 Nov 2022 08:20:18 +0100 (CET)
Received: from AM6PR08CA0027.eurprd08.prod.outlook.com (2603:10a6:20b:c0::15)
 by DBBPR08MB6106.eurprd08.prod.outlook.com (2603:10a6:10:202::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Wed, 9 Nov
 2022 07:20:15 +0000
Received: from VI1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::7c) by AM6PR08CA0027.outlook.office365.com
 (2603:10a6:20b:c0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Wed, 9 Nov 2022 07:20:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT049.mail.protection.outlook.com (100.127.144.168) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Wed, 9 Nov 2022 07:20:15 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Wed, 09 Nov 2022 07:20:14 +0000
Received: from cb8831f6ac18.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EF8E1FC5-6025-4713-9A56-8BCF75E2CBF8.1; 
 Wed, 09 Nov 2022 07:20:04 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cb8831f6ac18.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Nov 2022 07:20:04 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by VE1PR08MB5581.eurprd08.prod.outlook.com (2603:10a6:800:1a0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Wed, 9 Nov
 2022 07:20:01 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d34b:9a50:9e36:20f]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d34b:9a50:9e36:20f%3]) with mapi id 15.20.5813.012; Wed, 9 Nov 2022
 07:20:01 +0000
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
X-Inumbo-ID: f698dd79-5ffe-11ed-8fd1-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=daEl58Gh7ruzImDboiIUI5plqlgPoFVH4ezMxHNLcViM6691Is8gKYSEujU8a8xRX+i8S7oj2jOEzlpK08ZCokZ8OHtpyxRwirDQDjXd7iz8ukdbp1sXiDv6XzHYXf3swzh0NoF+asap6CDGBxIFYRYLgWzI10CFMHZ7Eg1TNU+0tm4bUwZqIvyEbgX9cSAMxO6LnXqZR1lnLmFKG7Dui/0A4PQkh4pFyejtXf2LdrN7pQU0RvN+P+KgRsYhoJqNnYI7XohlafKuDAyJ3wXaRipHvDFId2kzxc0x0tbbONC4jUufYZLx0Q6RSVqwYBPWylN5VcRvv82/WL+Dk6GvQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gG+eAfoMX89UgH13kRKbv2U1hpK/zgkSDnWE7oJPfBU=;
 b=LHR5XTvCukMv/pU/OX4mcOuJLiI2mV8bPnMO5FXo7RO1iXZYqyQF+QkVQcGJ+g6ZsO89vLgR14KzoelBgnz0RSF3FZDtvEyDy3jFqyd7WWC4nbimQfbAi/aF1RiOELw3LvIigE0aJF9AdJFBnkUB3e1Sw0r4+TQhUqhb6GKFDyfGt+P7GucXlN7HMEjkf7BFe6fE9SW9gSi3zFlxsy+7H2rf/yykVyO3xoLgsNJupf4CN9KjCGhzMnq10CRC9rdsW6u66bIdCxczkb5qvJhNI70/EuA3Ctz5kPH3MQOVkNfwJca0yju/O9Mw1JB3hmSqSW+c+29f3iddFQnwJOH3Eg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gG+eAfoMX89UgH13kRKbv2U1hpK/zgkSDnWE7oJPfBU=;
 b=dlNVdSPnshhYi2jSxs8kAO/qxYxqn6zZvdRlcvQis3aIggxSnc+TCiijLIaqtHJF63FGnY72B4BA9ujjSgvZmZINpOPmnC6yLuKMtCjXKwjsgQei21916Pimla7kMu+w+ISmwGMcDISLRDnrAvltQEtKMiTYkLLbv2oVH9DV/LM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afb6/mAP5WS+Ai9z+ebAU1SyxBPUlESekfOAQfJY30XkOWsbvx3w7+9RFsTlZ4gXWhwvfiOTj6YyX8E6IrWrjD0lj2XxXvGMmHKqZGvmRcZWkGL0qGVop6FAogy8kS7mr4hrebE3cG5a63O6r9zZrgj0Z4UxVTzOWr8nUcw6Cqk2NSepdTXnLHAKbM8fz2+qD+xWZ4dJNQeH8r8ECJGv2BuxiBgE2vuwWy/uNAkKvZv2uyHfAyQ1WTj2y+g8+0ag3jxt9fXMp75KVLz0XhkjZ/HnAfVrRwkbfM50zIEVCvrmgVPRAk0wv1oPDVjV0F7vh7mF8oEMtA/2MvV+9t3CxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gG+eAfoMX89UgH13kRKbv2U1hpK/zgkSDnWE7oJPfBU=;
 b=RhlzzTHWpE9qkgqptSfATnbpgWagoU0zN+CeQwelEN2h6OLuVwhXemXsX6t1+5lXbOn/wkANtGJil4SptTWEyvkXgUVUJiIrWwgp9LU6SOQI1LLe8tqPq08Z0RaJulgPGKrvTWFIk890+lPbToEvFqKttWKHuwGrtx2YwsBHCVBm4aNAP5smzV+e0TXbX7Jxdh1IBqNYo6qCxnC51j341eLpA1FZ7Vp08g7Fslf0IAQlIeMBY+Bc1lcRcrnG5Gg2tJ0VOONf9uVXETJC7DzTr6Ww6aqflvsxkNev6OkYOzm8ZSz0tf8EzWCKwUmJVRPJn/ptka6dq7qRMQgTOfzwDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gG+eAfoMX89UgH13kRKbv2U1hpK/zgkSDnWE7oJPfBU=;
 b=dlNVdSPnshhYi2jSxs8kAO/qxYxqn6zZvdRlcvQis3aIggxSnc+TCiijLIaqtHJF63FGnY72B4BA9ujjSgvZmZINpOPmnC6yLuKMtCjXKwjsgQei21916Pimla7kMu+w+ISmwGMcDISLRDnrAvltQEtKMiTYkLLbv2oVH9DV/LM=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
Subject: Xen Arm vpl011 UART will cause segmentation fault in Linux guest
Thread-Topic: Xen Arm vpl011 UART will cause segmentation fault in Linux guest
Thread-Index: Adj0C3U97KqJOGXWTaWwFEv08mPlLw==
Date: Wed, 9 Nov 2022 07:20:01 +0000
Message-ID:
 <AS8PR08MB76960AFEAA767A12368E83D9923E9@AS8PR08MB7696.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 722B2FE40F27AC4DAE7755EEC2C99440.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7696:EE_|VE1PR08MB5581:EE_|VI1EUR03FT049:EE_|DBBPR08MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: 9454fd2c-1e65-41a8-f25d-08dac222d90f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rfV01Ow82LyIKAPiz8iXI9i+r5Sd3XYlRu5fn6ycn/4FXPfOkgBdNVmSAztnxilNPSfv0AqPRGNB71Wl8KAHooyR0LEKB9u0sp2wOBXxh7ffF5Zk0LLlDoH8edOpqd5sFGr8QEGsJrboAocutdc9TFjtNCryiPjozp4ZuYycpp68AGvdOXej7/FcezK/kx0Z2sP8uKqLbCeqiu51VYiIQg/hybx3uWp5BWRnUCLk/jCQgzkvLJVUZdsz5SKGelVXry1RsQObqBpyqDRf6X5fYt46LFUiAF9iToX6YXg/6g9+/FDCjxKk2R7I/P80XCPYqLcSsXJcaQ+4RGwIuZhZ+NgYlC5fEf4+8nq5LQe6AWioYNO2OUZEx8szfQxPZZCmArEak12qCRkZmJHS9Ax73J5e8LbwT4xhCNLhps2aUJ8KKH8WPughKXguEYkQcSWKpylSD+BgwTeu/SiLDOF+FePRD3w34N66hmnJ0UFImUqvGpyZTmQmHhWVgrSUi6k5Mf83ItKfCAqsW/NctqH7DdywFTRQ06sJkFf7Cg+nFidlmdDQRIrAchB4molQmaUBPSSyLSnX5bXnsRyS7S0sJ663pak4inM+I0BO4clX8PiWhenvziSTvhloluibX/FnB5LLXCjB/wNxS93+oiPYkQNm2BSdPoH1cKI1Jto0lzrprOcwJ/fqwGQzzBwnkVugYlT3w2joXtTpVfWZYmhOZTS9ce5lnYvc8tOU5JQMBFEdcg3TksPjIz6n5iMlLmvnYG3z62dcL0ILbQ/438ovcA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199015)(316002)(6506007)(7696005)(33656002)(5660300002)(186003)(83380400001)(55016003)(2906002)(122000001)(64756008)(8676002)(4326008)(66446008)(66476007)(76116006)(66946007)(66556008)(9686003)(38100700002)(86362001)(26005)(41300700001)(8936002)(52536014)(66899015)(71200400001)(478600001)(6916009)(54906003)(38070700005)(45080400002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5581
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4b87b011-4ef8-44a0-b453-08dac222d09d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZYHygS71hcRayYehTWLYW0v9YP8CKsArhz00fs4HPLfRFsrMNi2r98KdPbgBpysbul3EPDiaM6j3sUzdmStMQ9yTM5fvFBbq1KmrBokJ+cIdD0kCGytHxSJe+VA5RzKyU/Z366ffFEzNTVphvlDIMNd3h+3CCkLEVZxcUApcJE3O7Kptyxz2VSHuWs27+2UeAhcasfAdpecgRdCu1qj+67BZiTYaZj7vcj025aph5UolODNbJm6v1zyLxgI0G5LVmnRl3e4WCjDj1tnjjHp0DHsIf9myL2bKZqnIiaPYmFAccsiMwCtdWPgfiWe6DyWxFDMCEYozNuu09qRUTWH/yAiYZqeb3mWw/lWERN1b22ka2/1UQmm0HDnw2NVSgj6YRVuAM4uaZ5THhtXY1Bax6jiNtOCIBg4Azec9gcuXzQWgozCrgKH1v02oPlciIc86SZbOiBgRqTCeAuxqjTelPF8pRu3YKimz+aAwytMIKD6/qtk8Kjb5Z3Mu682xxLZIpJ3ueS4/Ki2/tHPn0Uajwmqfz1aH7JZy0JlY9YnFhKvwVfM6XvYT3+MiQBeUpRXGcjtbdI5hZZ08FfRBgxkd5R3lDKKApsjBaXJzB9O9k/Lu2/mH9JAITM33RwJ8K39Tuje2PDZogntgOxMXfmlhh0a8wFyoJJRolDfM+k59SDQpAVqYOD2oFVJVcB69HT2eVbW4EmIuOnIHMJapIdXkOMJKwFv0sa0CBptVEgwQxhuPslTxNZ+lP2KA5qedFyUN+jT3FoltpWDkEogDWvozeg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199015)(36840700001)(40470700004)(46966006)(82310400005)(47076005)(6506007)(83380400001)(336012)(186003)(26005)(7696005)(9686003)(86362001)(40460700003)(33656002)(36860700001)(356005)(81166007)(55016003)(82740400003)(40480700001)(70206006)(70586007)(5660300002)(66899015)(41300700001)(8676002)(2906002)(4326008)(478600001)(8936002)(52536014)(107886003)(54906003)(6916009)(316002)(45080400002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 07:20:15.1630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9454fd2c-1e65-41a8-f25d-08dac222d90f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6106

Hi all,

When the guest kernel enables DMA engine with "CONFIG_DMA_ENGINE=3Dy", Linu=
x AMBA PL011 driver will access PL011 DMACR register. But this register hav=
e not been supported by vpl011 of Xen. Xen will inject a data abort into gu=
est, this will cause segmentation fault of guest with the below message:
Unhandled fault at 0xffffffc00944d048
Mem abort info:
ESR =3D 0x96000000
EC =3D 0x25: DABT (current EL), IL =3D 32 bits
SET =3D 0, FnV =3D 0
EA =3D 0, S1PTW =3D 0
FSC =3D 0x00: ttbr address size fault
Data abort info:
ISV =3D 0, ISS =3D 0x00000000
CM =3D 0, WnR =3D 0
swapper pgtable: 4k pages, 39-bit VAs, pgdp=3D0000000020e2e000
[ffffffc00944d048] pgd=3D100000003ffff803, p4d=3D100000003ffff803, pud=3D10=
0000003ffff803, pmd=3D100000003fffa803, pte=3D006800009c090f13
Internal error: ttbr address size fault: 96000000 [#1] PREEMPT SMP
Modules linked in:
CPU: 0 PID: 132 Comm: bootlogd Not tainted 5.15.44-yocto-standard #1
pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
pc : pl011_stop_rx+0x70/0x80
lr : uart_tty_port_shutdown+0x44/0x110
sp : ffffffc00999bba0
x29: ffffffc00999bba0 x28: ffffff80234ac380 x27: ffffff8022f5d000
x26: 0000000000000000 x25: 0000000045585401 x24: 0000000000000000
x23: ffffff8021ba4660 x22: 0000000000000001 x21: ffffff8021a0e2a0
x20: ffffff802198f880 x19: ffffff8021a0e1a0 x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
x11: 0000000000000000 x10: 0000000000000000 x9 : ffffffc00871ba14
x8 : ffffffc0099de260 x7 : ffffff8021a0e318 x6 : 0000000000000003
x5 : ffffffc009315f20 x4 : ffffffc00944d038 x3 : 0000000000000000
x2 : ffffffc00944d048 x1 : 0000000000000000 x0 : 0000000000000048
Call trace:
pl011_stop_rx+0x70/0x80
tty_port_shutdown+0x7c/0xb4
tty_port_close+0x60/0xcc
uart_close+0x34/0x8c
tty_release+0x144/0x4c0
__fput+0x78/0x220
____fput+0x1c/0x30
task_work_run+0x88/0xc0
do_notify_resume+0x8d0/0x123c
el0_svc+0xa8/0xc0
el0t_64_sync_handler+0xa4/0x130
el0t_64_sync+0x1a0/0x1a4
Code: b9000083 b901f001 794038a0 8b000042 (b9000041)
---[ end trace 83dd93df15c3216f ]---
note: bootlogd[132] exited with preempt_count 1
/etc/rcS.d/S07bootlogd: line 47: 132 Segmentation fault start-stop-daemon
In Xen, vpl011_mmio_write doesn't handle DMACR . And kernel doesn't check i=
f pl011_write executes sucessfully in pl011_dma_rx_stop . So such segmentat=
ion fault occurs.
static inline void pl011_dma_rx_stop(struct uart_amba_port *uap)
{
        /* FIXME.  Just disable the DMA enable */
        uap->dmacr &=3D ~UART011_RXDMAE;
        pl011_write(uap->dmacr, uap, REG_DMACR);
}

I think we should prevent such segmentation fault. We have checked the PL01=
1 spec, it seems there is not any register bit can indicate DMA support sta=
tus of PL011. We might have two options:
1. Option#1 is to add DMA support for vpl011, but this is not trivial.
2. Option#2 is to ignore the write to DMACR, and return 0 for DMACR read in=
 vpl011. But this option need co-work with kernel, because current Linux PL=
011 driver assume the write operation will never be failed, and will not fa=
llback to no-DMA mode, when Xen return 0 for DMA enabled bit in DMACR.

How do you think about it?  Any suggestion about it is welcome. Thanks.

Best wishes
Jiamei Xie

