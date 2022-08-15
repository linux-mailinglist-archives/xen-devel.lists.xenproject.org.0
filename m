Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C99592AF3
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 10:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387156.623280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNVLv-0005a7-1T; Mon, 15 Aug 2022 08:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387156.623280; Mon, 15 Aug 2022 08:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNVLu-0005XU-Up; Mon, 15 Aug 2022 08:21:38 +0000
Received: by outflank-mailman (input) for mailman id 387156;
 Mon, 15 Aug 2022 08:21:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=krio=YT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oNVLt-0005XO-ND
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 08:21:37 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70051.outbound.protection.outlook.com [40.107.7.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46fbf20b-1c73-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 10:21:35 +0200 (CEST)
Received: from AM6PR0202CA0062.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::39) by AS4PR08MB7629.eurprd08.prod.outlook.com
 (2603:10a6:20b:4cc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 08:21:32 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::80) by AM6PR0202CA0062.outlook.office365.com
 (2603:10a6:20b:3a::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19 via Frontend
 Transport; Mon, 15 Aug 2022 08:21:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Mon, 15 Aug 2022 08:21:32 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Mon, 15 Aug 2022 08:21:31 +0000
Received: from 3f11f798db17.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F8B89FBF-70CF-48A2-AB7B-8F3A2FBD1BCF.1; 
 Mon, 15 Aug 2022 08:21:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3f11f798db17.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Aug 2022 08:21:21 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM5PR0802MB2483.eurprd08.prod.outlook.com (2603:10a6:203:9b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Mon, 15 Aug
 2022 08:21:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772%3]) with mapi id 15.20.5504.028; Mon, 15 Aug 2022
 08:21:18 +0000
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
X-Inumbo-ID: 46fbf20b-1c73-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gZn4NgY5qs2uwhYapGWNwY4KTtcSLZfK19T0/MghlGoAmAbPD18ZH61poa14X3wIYE0Y8kIPIdBHztDuweTJkAD3wU9qZwAT/qbXfxAHqdh+vGaalBpo510iem/nlT3ELFucieMeBjaXgbob0pggCiEkjUZ/zcnch0NnXzF4adIZGiJlqVEYczvEWRYLD5rVD5DD4otDMQgsT36SqsUYC3EqOVHKKIGVbk0R860ZwIhKgkWGsgovtpQEUY8A7BW3pWjyadC/a3De+lpaiDNES/K6n2jvh3zPulxrKMSYcx8HCjVDeaAJn5U987lOAFglBYJxFyr/DM+EUem3CQfgTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3ejvotiTn+Ug5b3O+QY1UZU2PJ9wrPN3asb/dugQAo=;
 b=Q6DF2fBU+v9Yfnn8HocZWBlbvSgpNEiAiq+bZk+CuQaWaGWBsQ7+oNiQ0RLVkWYNQGrayctJSenWWXn8Whnd5B/APCllaaKzJ1rJVJXjLRnZ1HgVu3ZzTfzGPy1ZAkjyv/NDTOw8Ialk0WSbpe63K6y9J79RbhZRA1IVhX5/cNsZ0E5VSRnxcVWv/9NNaLOn+q7xSXdnfce4btNIyeXMNH+PFPCAqgBTxOgT2Z+G3BS4e1BqQ+/wW0TEaPJQt9ywCvvt7luKUt8mBE+2ebW5Ua3bD8hJ1eJjlN+SlVeOYbvK1WXEHxkmlRCSC3Cbephnb+MW4+XUiJkx8++rf4mKpQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3ejvotiTn+Ug5b3O+QY1UZU2PJ9wrPN3asb/dugQAo=;
 b=yPq3u1tQRnSMvxmzq0sIVhi4j5eZtBektfUCWK+uq9WFYcnOLiGpDX03o+LnyVmbLmfniCAscNx3fSCfl3t2XAQFo4VqW+sV9FBYyxZDg5MAjfg2hL8odZNkDQ+gZTBKOyheMFOURw+SY0M1BLLmAUC0bxQk6AIdji+eMiHz798=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YesZbcBIxfmg1RXMzSHu5NeOlZmmeMZic7SyrLkTkzAWZSSVM6Rgz5LH0W5f8bGtPjlSEv4J/ZCmnDKL/QrK4yXl0HLi0NZWKeMAorG4dA1gPFPVdzu9MavDDSWMj60j9ykeYs8jfutIrxLxPpR74NWOKAPD1w72PNjZn01GfrCbNUeL8gl/N5M3Yhvn8lqL83hlNPG0ALH9gGulmrgBp/tPrhY//3GkF57jKOJ4xYM76avjt3tY/zFNAip0KlwH4R4aJHjKcUAqDJ+N7kPW2RfjwSCGw+fdlq5Tm07+zJcc5YyUF84x/OsJuwVLBrKHAWIG1HenkPXS9O3R2cx6dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3ejvotiTn+Ug5b3O+QY1UZU2PJ9wrPN3asb/dugQAo=;
 b=RsiEUdSODcoAEU5QX9JLfvU8/3OuWflxPwgaAn8Lh3uw8bN+7/UOtIf8wnq+zaEL83vKu/xkTz5MEGjJaJR+wuKKFMOengGiShPcfqxv1MntpMqhkqVHxrUXJO7fJwjRh5cYlbQSQSd0UVGm+OFTS5pHGmFDV65iYLHOhbqMG+bhnFFkYl+b56q/o4sG7zv0fMeMaPz4OC/E99Q1Df6ZYc0yhtLdOFQPjjwtQQ1d75HLQTXpqFm6I9MeN7pT4PyBoidQWf8Kbai0rQndn6AA+HA2adZqqEyMJBAqPzg1NdDEeKBbP8oCDwPysDZM0XJHAM/6x2oxE/woUwJpIKf/lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3ejvotiTn+Ug5b3O+QY1UZU2PJ9wrPN3asb/dugQAo=;
 b=yPq3u1tQRnSMvxmzq0sIVhi4j5eZtBektfUCWK+uq9WFYcnOLiGpDX03o+LnyVmbLmfniCAscNx3fSCfl3t2XAQFo4VqW+sV9FBYyxZDg5MAjfg2hL8odZNkDQ+gZTBKOyheMFOURw+SY0M1BLLmAUC0bxQk6AIdji+eMiHz798=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <stefano.stabellini@xilinx.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jgross@suse.com" <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, "Wei Liu (LSG)"
	<liuwe@microsoft.com>
Subject: RE: Xen 4.17: Current status of series floating in ML
Thread-Topic: Xen 4.17: Current status of series floating in ML
Thread-Index: AdiwaSAsLXrq8BcIQ6OGhWLWfPbjFwAFdOeAAAAtkIA=
Date: Mon, 15 Aug 2022 08:21:18 +0000
Message-ID:
 <AS8PR08MB7991B735C93D67084E946D4992689@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <AS8PR08MB7991375F9A36B36AE5ADF3E092689@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <c8d7de5e-0d0b-43cb-2b89-d253a2b0b490@xen.org>
In-Reply-To: <c8d7de5e-0d0b-43cb-2b89-d253a2b0b490@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 378623C7BC235E4B8A173C677ADA1EDA.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: fd5fe0d6-eff0-4e80-cfa4-08da7e972928
x-ms-traffictypediagnostic:
	AM5PR0802MB2483:EE_|VE1EUR03FT034:EE_|AS4PR08MB7629:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6K5N2O8W1htfsyphTr4/NEaed8HoulzEkdTcjVrJpAJ7INPQUStWnyjsUMN3YToKUiS68b0ZIpKhhMk1IeukopuNcrtCK5HOS0DV9AJcZkH6IZ+ByeaEsMIOK6L4/A+oZC0Sf+WQ2rnX0cm5n2a7hTQXAI2DxC+nbH/M9ivyB4zw5lElSOSm/WFQZ163B0hg/LtrE1hHr2VxoWhnlOGwY0Fpk+I39iCI5b3uEDqprkPDUGzKXXA6c7VSUYTdwHomNfJoJEj/rx2TJeTxJh4sVWU/0zjPdxbd9ArWzRt5FNFekJO6poKpgYahJlrBF8k6dDQdF6y3bEyC+/CfgYedDgJm1zquXUbEQh7ISzVz3HOnrUPRONHvh0HWHX46gDud+CCGcr0LdOpnxgj0SD2rioXvA5E+/yBm/QUIanHvdIVJc1s3B6nTnegB4lv2NsiOu1SJtvelC3MYGWtBCygnElwKLukvVtuxRJxB0jwPC4r9j3X+XFsV5i3n0TCOZqN6amtiGTONz8WXAQMRvwDtL+TLFQh5nQltsrd5CcjxqFVgVBrWcZposNCZE2abNNDGSDDtNq/Vd+EllLTCZ8JnHMtkcl9lDKu4C4JLRuE/xRmZzIhAeHda2FDO8OiyH56R8HQYq4YRWOqoD7GWD2/P4sIjKAdAHK7Lb3O3bovvvnBPqeTXPs/TedFinjOf8anmuWt7N2zEWlZhTssXMEoGuJcjEu7QDYNLVtowRHx+nwY8/21XaLzfuFPK7EBLalQUDFrlc+YUNdFFSB4kLDIzeT/qlMOLNQRUHDUGa1wXACUyEc0yNuzmub+IdOJPiurHTp1L0PHEzlIs7MCQXpOMxQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(478600001)(55016003)(2906002)(26005)(41300700001)(7696005)(9686003)(53546011)(6506007)(64756008)(966005)(66446008)(8676002)(66476007)(66556008)(33656002)(110136005)(54906003)(316002)(71200400001)(38100700002)(38070700005)(86362001)(186003)(5660300002)(76116006)(4326008)(7416002)(8936002)(52536014)(66946007)(83380400001)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2483
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f581e9ee-c834-4e3d-0b06-08da7e972118
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M0pipO7cmjnc6CLMtXhgPxzBoVuih3PmZwnYH5uFUGAdft5VaKdZK0NhxfzoK3n3oG0/0V9q2mwclq+YwsQvciB/jRKc/nJjP3jtkacvh315uiazGTcf7nzS9eGjp0Q6nFW+s3Oz0RvJFD025S6R2kmycKC2iiIITDo7z6p1Ls0v+3d4qvq/iiIAy8QDlxLQWd59+PaqCHBRUAs1j7eTcUrzKH5AAkAzTbXhEWObgczMvUq+UafMAEJ3YQrl73/zIK0tNtmFteHlyaCc9ZzQO/fEornJKQGFJk+0PxG7HTjLNOdgaLgAy8zYotAzCDEc65zE44hU/8P2fktq79cJp/gpdoExA5M8DdPIWdKLNPRkSh2Ut2brOO3soGpwBzdok5HqJwEGUizkxZixbFXFhGYNuYlyfZWjcNvv4dyvf5sEX/4Th6Cfz+yXUFQ6Y0+/jZLCrZmLf+AkbtxxgSx3awfQp5Ba513cAK6vxlNIuIUWC7b9aAfzwPn5vuVhrcRWLWgryAX6PdqQg5LDMu/CA3JbOMCcxH0IA4NT31OCe2kGRXrHC2i0wj8+WCWo0Q0lTXazFdNctvY8ODoOB55HTAf9AnxdoP4Pwi7JHv9otNl2tKiYQs3QiaM4CNzmRXe/HQTU7OGX6EIylxlskixcGxKkApfqfOsW992qdpoD8WW4e9/xx6hZ7iAbCBTMLwZWbyhYABHMPlE789FAY1+NNlSdIEi75UjgIvauB/pmMzqe9sww+pVMznyO6h7xX8RY5HrM1KjQFvgLVnyFpmo2XtNQzNkYsQAmtoDyR8be++d83Iikb1vhdtdDiDLRStLmEynRkzb0poem6rXGM+AGAw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(136003)(396003)(346002)(46966006)(40470700004)(36840700001)(186003)(9686003)(478600001)(7696005)(41300700001)(26005)(81166007)(86362001)(356005)(53546011)(33656002)(6506007)(107886003)(336012)(83380400001)(47076005)(966005)(54906003)(40480700001)(4326008)(110136005)(55016003)(82310400005)(70206006)(8676002)(5660300002)(70586007)(316002)(2906002)(82740400003)(40460700003)(8936002)(36860700001)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 08:21:32.0640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5fe0d6-eff0-4e80-cfa4-08da7e972928
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7629

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBYZW4gNC4xNzogQ3VycmVu
dCBzdGF0dXMgb2Ygc2VyaWVzIGZsb2F0aW5nIGluIE1MDQo+IE9uIDE1LzA4LzIwMjIgMDY6NDYs
IEhlbnJ5IFdhbmcgd3JvdGU6DQo+ID4gSGkgYWxsLA0KPiANCj4gSGkgSGVucnksDQo+IA0KPiBU
aGFua3MgZm9yIHRoZSBsaXN0IQ0KDQpObyBwcm9ibGVtLCBhbHdheXMgZmVlbCBnb29kIGlmIHRo
aXMgY2FuIGhlbHAgdGhlIGNvbW11bml0eS4NCg0KPiA+ICoqIEJsb2NrZXIgTGlzdCAqKjoNCj4g
PiAyLiB0b29scy94ZW5zdG9yZTogYWRkIHNvbWUgbmV3IGZlYXR1cmVzIHRvIHRoZSBkb2N1bWVu
dGF0aW9uDQo+ID4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3hlbi1kZXZl
bC9saXN0Lz9zZXJpZXM9NjY1MDY0DQo+ID4gU3RhdHVzOiBQYXRjaCAjMiBtZXJnZWQuIE9ubHkg
cGF0Y2ggIzUgaXMgbm90IHByb3Blcmx5IHJldmlld2VkL2Fja2VkLg0KPiA+IERpc2N1c3Npb24g
c2VlbXMgZ29pbmcgb24gYW5kIChwcm9iYWJseT8pIG5lZWRzIGEgcmVzcGluLg0KPiANCj4gSG1t
bS4uLiBXaHkgaXMgaXQgYSBibG9ja2VyPyBUaGlzIGlzIG9ubHkgZG9jdW1lbnRhdGlvbiBhbmQg
SSBoYXZlbid0DQo+IHlldCBzZWVuIGFueSBjb2RlIGltcGxlbWVudGluZyB0aG9zZSBuZXcgZmVh
dHVyZXMuDQoNCk9oIEkgdGhpbmsgdGhpcyBpcyBiZWNhdXNlIEkgd2FzIGNvcGllZCB3aGVuIGRv
aW5nIHRoZSByZXZpZXcgb2YgdjINCndoZW4gcGVvcGxlIHdlcmUgZGlzY3Vzc2luZyBpZiB3ZSBu
ZWVkIGEgcmV2ZXJ0IG9mIG1pcy1jb21taXR0ZWQgdjEuDQoNCiIiIg0KQXMgeW91IGNvbW1pdHRl
ZCwgSSB3b3VsZCBiZSBPSyBpZiB0aGlzIGlzIGFkZHJlc3NlZCBpbiBhIGZvbGxvdy11cA0Kc2Vy
aWVzLiBCdXQgdGhpcyAqbXVzdCogYmUgYWRkcmVzc2VkIGJ5IHRoZSB0aW1lIDQuMTcgaXMgcmVs
ZWFzZWQNCmJlY2F1c2Ugb3RoZXJ3aXNlIHdlIHdpbGwgY29tbWl0IG91cnNlbGYgdG8gYSBicm9r
ZW4gaW50ZXJmYWNlLiBASGVucnksDQpwbGVhc2UgYWRkIHRoaXMgaW4gdGhlIGJsb2NrZXIgbGlz
dC4NCiIiIg0KDQpUaGlzIHNlcmllcyBoYXMgYmVlbiBpbiBteSBsaXN0IHNpbmNlIHRoZW4gOikp
KQ0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBK
dWxpZW4gR3JhbGwNCg==

