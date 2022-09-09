Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B15CB5B30C5
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 09:47:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403886.646149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWYjM-0006JG-FW; Fri, 09 Sep 2022 07:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403886.646149; Fri, 09 Sep 2022 07:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWYjM-0006GS-CO; Fri, 09 Sep 2022 07:47:16 +0000
Received: by outflank-mailman (input) for mailman id 403886;
 Fri, 09 Sep 2022 07:47:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uksk=ZM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oWYjK-0006GE-A9
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 07:47:14 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00089.outbound.protection.outlook.com [40.107.0.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d578bc7-3013-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 09:47:12 +0200 (CEST)
Received: from FR3P281CA0125.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:94::7) by
 AM8PR08MB6548.eurprd08.prod.outlook.com (2603:10a6:20b:314::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Fri, 9 Sep
 2022 07:47:10 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:94:cafe::e3) by FR3P281CA0125.outlook.office365.com
 (2603:10a6:d10:94::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16 via Frontend
 Transport; Fri, 9 Sep 2022 07:47:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 07:47:08 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Fri, 09 Sep 2022 07:47:08 +0000
Received: from 99da037e6697.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CAD35C6D-5FB2-4B40-9707-CEEAA290E7EC.1; 
 Fri, 09 Sep 2022 07:46:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 99da037e6697.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Sep 2022 07:46:56 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VE1PR08MB5855.eurprd08.prod.outlook.com (2603:10a6:800:1a2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Fri, 9 Sep
 2022 07:46:55 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a%4]) with mapi id 15.20.5612.018; Fri, 9 Sep 2022
 07:46:54 +0000
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
X-Inumbo-ID: 9d578bc7-3013-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iLG5HEQ80JmgE+TpYjCgNMMnDSYaQ4wNLGAIBzMI4Yq09WmD+sdStExeikl9oT5pn3FcprKWLYPYBkDIeoY5Pqg5ukrXJixeC8C9YQ5mC8/wBnvaMXJX175UJ7DMQkGvjnOB6LjQlwMOD1cNdszmLl8vvBAIA7w0WPkbzYmEwsiDLz/KVmP/HTzbUicBydAq4UotUZMxvaxXGbHD/B2YXsmF2S7XlhM2F4KaYf+4cRmJmrM3q5gFww2/bKsOd2E2sZAztxGEky7e0QXmVHBqBp4xAZTIyRexW2w9W3cfC98HnqJ30yT9qMizoxAh2EAXizoHZWekRM9EhGjJkShJ2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9t0EgJPcUHOqOm+x5NpCj8PWNZFagWdWrTdQF3n7BM=;
 b=Zk8z0MWPKzAIb7tFI0KIWWqihWd5Q+OluxfqBmyRE1McE6lUTLaGkZMPNai0UsMrLaUFIttcHe+Pdq8+fpofHeLCJTki5NUSRG0AiQEze67wlrL9384OQSDe2W4/jAAUz0KfCUSSH2tOrLuUpnJQlteKNB0E42r0PTW8Mk/6gjX2b7RfBDTjsz+ILC2SWYIMDy6panEk1q8ZCUHr5I59NfumNLAZ4diZk0uY1fELzqN0bdrNi0p4rzbEKsFiQhhahtLNjkZggtqfgkHBqgATb2MQNSo3oXW9A+gnhP68awtL46X1cbRb3FUqnvOxxgFW0o4ezZedLly94oIPepk98w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9t0EgJPcUHOqOm+x5NpCj8PWNZFagWdWrTdQF3n7BM=;
 b=rWHzvBqOknWVGm1UMp/p4HjWbZTxIxrw1tk/H7eva1cdYovX4OJrBbEgtIkXlV0Epdmnz0d5S1xxG4wqlUxIVXyrjheKM/MPu4/ym2jBkj1gwmep1jMb9QVp2pIJRGJMPNP5dDarZI81AZ6dddWmoYGwSBheDa+M1fUYTFdNSbc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d775fba767d3d04d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mwZg7jfojU5O352pQDdihVP/Rw14DIUEqtdF9AP1F/zyaLulgK+Osut6tU/ONGcFAJvO4PMmGyK7/WmE5n5F63KsHVtvZi1gC1FZj+U5NK6y7m+e/bhljMne4R5bBAKU3+HB2Annl7nGlsZJdvB3yM5v/LXIDgp3Zp1Rdqpp3Jn8IO6cCMGn5uZfQpkjdiROg0AUIkTezgCqrOAbcO/pTreF2mljfOlkL/mT9hAGicAsdFSRtpadyYQI7ssYV2f9H24fIzlHU6SMt7raPvmfAEfrt0P7Gd6z1F4nOjpDC762RtZC0IfGLrCBZq/EnOQtGzyH/cKa/g7KLlvCBHCwWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9t0EgJPcUHOqOm+x5NpCj8PWNZFagWdWrTdQF3n7BM=;
 b=YWfsXTwPfPm5fUTg21tnidC/A1kWjyzsHuUAfiDzkNitJrJk443QRwXrOAHNr+ys8COAHRF2CmdVjajUv69TevrIhCXGEUb2otOfY3Nyl3VubWnoaJsL43z6WyLvyNbFLYAVP4a3J7vwU+cME48KobCQFar4YwGiFOwKJfc+bSNm/jv+Ixup7SpFPxVTXH0TD0MaAbkvhwFaKYvfiBm4Ej41DjObyhRiKHQpDV2ZueH6kTA+2ouOq3Hjb/fNdk3e0PNfOVGlGVgqg4Q5+HqtzYSXrsbiFxms4uPrTXasl42Ebt/2DS6MpJ2b6CwYjeCq1SqrEtRw531pH0nvos4VVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9t0EgJPcUHOqOm+x5NpCj8PWNZFagWdWrTdQF3n7BM=;
 b=rWHzvBqOknWVGm1UMp/p4HjWbZTxIxrw1tk/H7eva1cdYovX4OJrBbEgtIkXlV0Epdmnz0d5S1xxG4wqlUxIVXyrjheKM/MPu4/ym2jBkj1gwmep1jMb9QVp2pIJRGJMPNP5dDarZI81AZ6dddWmoYGwSBheDa+M1fUYTFdNSbc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Rahul Singh
	<Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v5 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Thread-Topic: [PATCH v5 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Thread-Index: AQHYw3lB6B8WhlC/sEygMdr51CFDi63WBOiAgAALjYCAAKlBAA==
Date: Fri, 9 Sep 2022 07:46:54 +0000
Message-ID: <0185BE14-D3F6-4C9A-83BD-75FC1B454917@arm.com>
References: <cover.1662637415.git.rahul.singh@arm.com>
 <63a0010c1e0f6ffb86fce35e188d66bf4c0d57e7.1662637415.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2209081350530.157835@ubuntu-linux-20-04-desktop>
 <d30ba7f3-b3c0-1555-f74c-acb4b8c67789@xen.org>
In-Reply-To: <d30ba7f3-b3c0-1555-f74c-acb4b8c67789@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|VE1PR08MB5855:EE_|VE1EUR03FT029:EE_|AM8PR08MB6548:EE_
X-MS-Office365-Filtering-Correlation-Id: 14552290-aa04-4d58-1c57-08da92377fba
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ILGjiRQAr5v8+drV2p6a7AlWpQrYPRI0GUnEgcspElZ8i8/0Sno2sWuaLdO3Ben+ubuMvo2elwv8JglrOZyueCHMsbIrVpQDlKbI3ScZrFLmdFwvgyuyEWJ2RvairY8pWbWWzxILFDiVcCq1F8j6GnrGoG7IdZN+JsN4u9epaFCCBFPSRFzBpAqldZKNw5JG1n3/sfyu1BCvFbOoJg90Q65+5JG+b3GPJ+mIun0CFZe3qWPEEfzqHzNa1mVV7xjYS+T10kYVj+/3J6AF3k46QfJwkO4q2RKk6Gk941TjPQY8lD2y0PY7Oon9w8PrSuguE5xo3qi+/L36vP6dfyVmhpnYvzFvIh9hv7P/jECpmEt3hGWJBQgB2KhmbnsY7ATS1jgR0guhc6IqLeTCOte1WNdeloI3yuX+VdZYPANQVK4JFIZ3UNgTnSYTUIwBy52l1Bh+cWEhxPnl8pzRaZ0yI2c+H/K6KLCwzTL6Io9auPYUcsb4YOe74KOzhDsf6DGwrhjgOeh3GOKFcTlYp3kTymaaTVjEQturLQhAiLmzDgPEgwCkvPYYEpx1oyvZhYmqPzReppIXwjgNLBOQYGQd7BicRU+m7NNXy16kI8zDfPZNN7oSHiejbPRaipRY4I90KSvcDK6kjtanK1DbyldfGLFRcxtVD3lvmuOMfqylL25Nwz1n7d5PU0sUNUg2xGHnUIEIWkt6YGKklXJ8Rey/bPYXUwtSzdvhCvG5Vbjj9xxf7zl/TzdEOrR9SK0ejE04dXSTnYnGvtNeVI8Oqsuo9eUQ2OMzTxr/Zl7L9mnC20s=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(38100700002)(86362001)(36756003)(122000001)(4326008)(66446008)(64756008)(76116006)(8676002)(91956017)(66946007)(66476007)(66556008)(38070700005)(33656002)(41300700001)(6512007)(6506007)(26005)(53546011)(478600001)(71200400001)(6486002)(54906003)(6916009)(316002)(186003)(2906002)(2616005)(5660300002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <2CE305C14E5DE645A1EDB914D00DB878@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5855
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d1798764-2c74-4d5f-ac57-08da92377751
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iOEuQXURelnlMBwaBtTzCviidInudkvgw0alGLWhkPy3DrMPpNtH8aOX8yws1IDU8rm1G18s1Ghuwlw10JsX9Qc73WhRoO9RpKh4j5gccA9aCQbxWzZ6J639/VB7gO3j7Py/69xb6P7DPPJM8xbvt56QQ1ApJr7diXjTZF078QuSmgJySkoR6j/NRUuLvosK7Bct9RvSOxzhwSIu2g2atxJ9IJZcnmetLcpJyWfGeR8eax9bm9PBZTrSE/9u7CF8GxMzU3u+FOh2efEeFWaSXSohWSyNNk2CV5sbEdWa50mmLNfakazz4GIxkldwyrbyXfYNRQZbdPEwiIa0QZ0qiGkTC+rcCIFG1GhS38zXO6eX7g8TMSQyGF8QAvCN3DdPRw5OQmhtK/YNvbrNHn00N2PFdWg7gyVuYq9vJy4eG/1EZwbtEbDLq6I+PcD/UW7TsHbMgmAhsnp6154DuaHdbPjI1VYzABqIeqSGPd7zhq3LZMz2iXr8LuXjafigZISG7opYZ2WlXDtREYz+YAu521lVdnkNv21f+xcVYciW2BDKGcPzn8Z4prd+ZKRnERZI4mBS3kfxKJMsGM/pgeHOdcLQAqNZ0l84XcMn+/0mrxuXgF28A5k7r43hTtFMJaR9Te0xNmoMcWZ5xt6T25BKaFfrynnJXHspekU7j/tBRDPwOgXrvuYXkECYXZ+ijkUF2OqfzIhE5Vv+Qp2S/2ZJfbtJAG7gs5QHKd21Zfsjly7mhvQq/F3JuoDwM1QL/s2Dk7m8mOznk/IH4v57UAaTlQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(346002)(39860400002)(40470700004)(36840700001)(46966006)(82310400005)(356005)(26005)(2616005)(53546011)(41300700001)(6486002)(6506007)(40460700003)(6512007)(478600001)(36860700001)(186003)(81166007)(6862004)(47076005)(82740400003)(8936002)(86362001)(40480700001)(2906002)(336012)(33656002)(70586007)(316002)(70206006)(36756003)(4326008)(54906003)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 07:47:08.9012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14552290-aa04-4d58-1c57-08da92377fba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6548

Hi,

> On 8 Sep 2022, at 22:41, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Stefano,
>=20
> On 08/09/2022 21:59, Stefano Stabellini wrote:
>>> +/*
>>> + * TODO: BAR addresses and Root Complex window addresses are not guara=
nteed
>>> + * to be page aligned. We should check for alignment but this is not t=
he
>>> + * right place for alignment check.
>>> + */
>>> +static int is_bar_valid(const struct dt_device_node *dev,
>>> +                        uint64_t addr, uint64_t len, void *data)
>>> +{
>>> +    struct pdev_bar_check *bar_data =3D data;
>>> +    unsigned long s =3D bar_data->start;
>>> +    unsigned long e =3D bar_data->end;
>>> +
>>> +    if ( (s >=3D addr) && (e <=3D (addr + len - 1)) )
>>> +        bar_data->is_valid =3D  true;
>> "s" and "e" are "unsigned long" while "addr" and "len" are uint64_t. Is
>> that OK?
>=20
> Good catch. No, physical address on Arm32 can be up to 40 bits.
>=20
>> Specifically, considering a potential arm32 case, shouldn't "s" and "e"
>> be uint64_t as well? Which means pdev_bar_check.start and end should be
>> uint64_t?
>=20
> They should be paddr_t which will be 64-bit on both arm32 and arm64.

paddr_t sounds a lot better here.
@Rahul: Can you send a v6 fixing this ?

Thanks
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


