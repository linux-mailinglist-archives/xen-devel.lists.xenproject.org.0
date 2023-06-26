Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EC573EBEA
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 22:39:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555660.867580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDszS-0006Kz-J0; Mon, 26 Jun 2023 20:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555660.867580; Mon, 26 Jun 2023 20:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDszS-0006IE-GC; Mon, 26 Jun 2023 20:39:14 +0000
Received: by outflank-mailman (input) for mailman id 555660;
 Mon, 26 Jun 2023 20:39:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCbL=CO=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qDszR-0006I8-0a
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 20:39:13 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2073.outbound.protection.outlook.com [40.107.13.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8135f33a-1461-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 22:39:10 +0200 (CEST)
Received: from DU2PR04CA0212.eurprd04.prod.outlook.com (2603:10a6:10:2b1::7)
 by GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 20:38:37 +0000
Received: from DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::ad) by DU2PR04CA0212.outlook.office365.com
 (2603:10a6:10:2b1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Mon, 26 Jun 2023 20:38:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT039.mail.protection.outlook.com (100.127.142.225) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.16 via Frontend Transport; Mon, 26 Jun 2023 20:38:37 +0000
Received: ("Tessian outbound c08fa2e31830:v142");
 Mon, 26 Jun 2023 20:38:37 +0000
Received: from 580e0799811c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5A5FE0AA-D0D4-495C-8BFB-881F7873598F.1; 
 Mon, 26 Jun 2023 20:38:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 580e0799811c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Jun 2023 20:38:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB9588.eurprd08.prod.outlook.com (2603:10a6:10:45e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 20:38:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%7]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 20:38:28 +0000
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
X-Inumbo-ID: 8135f33a-1461-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuoYncLmyqqqfjY93ASrwaN9MkGxY9nGUal9WLlsMJk=;
 b=unknOtXPb5qvb3HwmT8kLJN7mffhwSqSGErqyVhSoPubAOQnXV7JSNZEjedGhNMAPTK3MbATZiXfExalCsrQGEq55QvZehjNn3Gc3J+7Z9bwbWzLFKBq78j9omia0QQ2wzM7VqRrL+JYO56tQfp0IkePv8s08WtMOdEUEW4W+bk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bc9c8a9bab8d46fc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DSVdqDgBKXH6U48qGiQ0INUindfRa7khgyxFkvheQlpXKFWHP7hFEGgfWX/imMm5VZHfowoaVnTUCEoCl7F3X7DdBFCTZrZ67f8HKjC8GMckfo+2Norcbd+AvSSDywuxvg7Hi5SLy38Jcf3geOfcNlU/HfEURgI2gisd1JfR/QxLpNrS0MQorc6WRwbYh+aeMpQDmaH/Ogl6N3lY8EuOBHvtlaE0xsHuVYgM54MqmvVqaZ3tesyAHf+oIUKyzRKki/pZBDUCYHdr37iwlkZP9yZMscwuuDIoSYKsikd2OPKxYMuUwkxJ31h95Wnh4BzCAat1t8ankiAFP99iEMlTtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuoYncLmyqqqfjY93ASrwaN9MkGxY9nGUal9WLlsMJk=;
 b=ebCvp2u5D5rKveNX6MrLwjmoTGfM27zgk9AGiiALdh6jbKgTqX+ZsM36ABTINRQRAbZ/sS2tgleMqeehSktYV74svmgbj7GrH2oAiN7U0yGMYw1qd+9hEwT+HqcxBmJGwmippxxTtecByfw5CFqokpyB9YmzNyZByo9RIJAYFOzv+sL772s85hP2j9hOFnwUR8jp1quxNa+YWy+uSeJ7wahfAGhPPfvujxteBshaQGgkkBpf72NJi2OGdom/Ye1GVs9w/hPP3Ho+6MXXQ0a5PkxUzZTEKPH+M0G01zoOrareQMm03KkJzf62Ng6rxuvZ+0mUXaRKlRGUdUKlYOZyHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuoYncLmyqqqfjY93ASrwaN9MkGxY9nGUal9WLlsMJk=;
 b=unknOtXPb5qvb3HwmT8kLJN7mffhwSqSGErqyVhSoPubAOQnXV7JSNZEjedGhNMAPTK3MbATZiXfExalCsrQGEq55QvZehjNn3Gc3J+7Z9bwbWzLFKBq78j9omia0QQ2wzM7VqRrL+JYO56tQfp0IkePv8s08WtMOdEUEW4W+bk=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall
	<julien@xen.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Subject: Xen Summit 2023 Design Session: FF-A Challanges
Thread-Topic: Xen Summit 2023 Design Session: FF-A Challanges
Thread-Index: AdmobVENtwj0rqU7RBOhAApc4UEreQ==
Date: Mon, 26 Jun 2023 20:38:27 +0000
Message-ID:
 <AS8PR08MB79919D1363896BF02C4941EB9226A@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5AA0892B6B0DA84D9F0D989DFB0D43B1.0
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB9588:EE_|DBAEUR03FT039:EE_|GV1PR08MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: c7b05031-58d8-43d8-2cb0-08db76855169
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 v2NG/gCZ92XiYQVCJ2MUnIEdss/aw5WRud93cVv9inlXNdcpPGGJVz49KI90Il0h/ZONzPtvRTWwWqQCcrPgkHU/CdCH8VW5ztKVb4KsEGX61mc3BQOzd8ZSnlSMRRmfAuTWqMkfv4KEjudAlaEqTMjRFSlLi4aMwzXtiBd5rUPU5KRwfJNZJ0u4qzl4KvebxGwXCKpoxdrLURmrCGSujidaHvOr1KMr2mDKPJ/qm0nzjMLYWfZ0qGUZ+HQB53MleauOKO13oI//RXni1TNYk92DaJJHWtLFTMokndwA1fIQ4Jy/sTGGYxU6X4AVxcYyoSzLkYgaESvsySq5KtxPf8q5QzWp00Qxqu+dUkffYqR11DdKI7xhC6LOCPPtfAhqxELHgnS3TEeUYU8Gb73Ihi3GoADg6Fs2p7pL4rgpayCxtryOGmurv6J8DRxFukhA+cDXL/BxriD1tcVVYnZGHbc6iP/kUC+3Tg7NozRPe7lYsG8K0DTPHM9xJzDeA8y4vjug4cPN7Y6361D+71jwdJ6QUUi/CuQ6jIZ4XiIIpT1BRiWIb5KiukWF7vAAzHEGfrXQ5VQTTfqC+zQLhpLpx9d+F2xSbC9nJPTdSYKr0z1oBptE7Mq361rI9g/I1rbA
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(451199021)(478600001)(6506007)(7696005)(71200400001)(54906003)(83380400001)(66446008)(26005)(9686003)(186003)(2906002)(4744005)(5660300002)(52536014)(33656002)(122000001)(64756008)(316002)(55016003)(66946007)(76116006)(38100700002)(8936002)(8676002)(41300700001)(6916009)(86362001)(4326008)(66556008)(66476007)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9588
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8fdbbf52-c24b-4b00-b17f-08db76854bfc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lbz/2u7yhNNi4BOHUA3PZeAy5BQKMi7NWbi86S1ifqrY16aT6Wh+amLeeJV9k1WbyU4mUyDSm0CBaSJz5zCt4hUMJAYO3nDW322PxGHyHwdRNkeMUisNU8/jucs+1U07wIz+Jtyrjm9V1+KPrljAAyb9qPut1rLgqPCDIOS0AUB2wTcorXm/clNNFRaLg7NK+N41KI6WKRNGCbOLnTk6CzMKp4bFX9llaqbKddflYFjyndJa6MURZGN6+BCnyp83mq/OmbaBq3DAvwTqb2QmInbuaV4N94s3+xPwS3gREssPI6zNdHpZnmMV1d7hxvnTr6i1Wu0GWje5Lm2d60gGDgfhBg/kbwoeSCV1HVtcTAA70pGUucAVmephSey0kR90rABkWpWiIcn/7AjuOn9rQ6fEEno1Y1L7y0bPbw0yteRq0yy9bwbyRB22a07ZbUK441+t0WY0YU/cBAjNDI0rSVmRnPGtGadKVUHSwbHIoqfwDj0gWmbt4/9vHA///mzieO5Mq97Rl3gn8ETg1hEsFSFh1naCOSzlUIAPc7zIR+xfnc7iA1PRqaRLz/TFqbjd0QWPu/JbLwuwq8L3ma2HHZR9WKtB8IyNKQFy/pOLUj9VW632yvFF+/hlwWyGPHe6ZbJtuAPBaElR6LVGIl5ZALFcre3J1hHPpDxVJ08VvxySRYVG05T1DbMWKkB2B7FhSFXLoIQD+Evte4Ew5DTJY2QivodvGSXhBj8HSDQwdFc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199021)(46966006)(40470700004)(36840700001)(36860700001)(82310400005)(47076005)(107886003)(7696005)(83380400001)(336012)(54906003)(26005)(9686003)(6506007)(478600001)(2906002)(186003)(4744005)(5660300002)(356005)(52536014)(33656002)(40460700003)(70206006)(6916009)(4326008)(316002)(81166007)(82740400003)(55016003)(40480700001)(70586007)(8676002)(41300700001)(86362001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 20:38:37.1632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b05031-58d8-43d8-2cb0-08db76855169
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8426

Hi all,

Below is the summary for the FF-A Challenges design session. I apologize
for being unable to completely follow of the design session...

- Scatter gather list and the critical section issue:
  Summary: we need to have a continuation system on the memory call in
  the FFA spec

- The guest OS sharing memory with the secure world may be "killed" issue:
  Summary: For the domain destroy, we need to investigate a potential
  notification system. We need to keep the guest virtually alive till we
  manage to reclaim the memory.

Kind regards,
Henry


