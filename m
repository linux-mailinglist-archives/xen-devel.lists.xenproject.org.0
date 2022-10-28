Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D5E610CBC
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 11:08:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431836.684449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooLLl-0004l8-8o; Fri, 28 Oct 2022 09:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431836.684449; Fri, 28 Oct 2022 09:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooLLl-0004iL-5S; Fri, 28 Oct 2022 09:08:25 +0000
Received: by outflank-mailman (input) for mailman id 431836;
 Fri, 28 Oct 2022 09:08:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l/aT=25=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ooLLk-0004iF-2D
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 09:08:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2064.outbound.protection.outlook.com [40.107.20.64])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12b624b8-56a0-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 11:08:23 +0200 (CEST)
Received: from AS9PR04CA0162.eurprd04.prod.outlook.com (2603:10a6:20b:530::22)
 by DB9PR08MB8739.eurprd08.prod.outlook.com (2603:10a6:10:3d1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 09:07:57 +0000
Received: from AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:530:cafe::e4) by AS9PR04CA0162.outlook.office365.com
 (2603:10a6:20b:530::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Fri, 28 Oct 2022 09:07:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT021.mail.protection.outlook.com (100.127.140.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 09:07:57 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Fri, 28 Oct 2022 09:07:56 +0000
Received: from b140c5e11771.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2E97AB99-25D3-43B0-822A-4A6872410224.1; 
 Fri, 28 Oct 2022 09:07:49 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b140c5e11771.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 28 Oct 2022 09:07:49 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB8477.eurprd08.prod.outlook.com (2603:10a6:20b:55b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 09:07:43 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 09:07:43 +0000
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
X-Inumbo-ID: 12b624b8-56a0-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DLJBoi0rlzz6l1kSWMcQgDsebyw9uzFZKJOyRB1Zp6KgSWI8MYdWQTwsu92f0807yhB9wXWdRMOcUf3O5glAJ+lN6XKb7spkQCb073JYz9phNnKTLK74cUxql/vmRFEO1HBLvRtOPcusJOAqZKcG2HKAxQkjGzgag05+X72K5OSpWFXOHfWm1w9vwbcvUd3qQRU2gZF+1h3cXblOazC0dB3HGCO+l2yNHz4eXQ2qxtTpCDEIgaEMYj4y9RIafDkh3xJnxSPvMIL3cYwdEpWmnxBMGdu7xCQL1gd3mWJueCBSp1tNgH00SZKnEJ7Aq6Oh1c7glWbfBU1Oez3xgBD2Mg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BkywJmE3cQrYTa8E/EP2z+5ZHNzxv9/EwXFHqJCAsAo=;
 b=VxzQScaRjlbdClzoxSTBmvCDxxTXm9AgL91NHUz1m9nhHzYt3QfPt61SZaVEcHtqbfgRFIz1iS1EL2dv7zYggDkMjF1V2xMS9e3HG5oEnAOqSB78vsrhJT68qf3YxbjmrNf45/YivBd12xysR6KW6KmP7I1N7S3ba1M5JG4f+08WFZaiu6C/Ot5OKAaG6/fZ+bmzyNlwARfK9KGtq9JXYDaAvzBnqGzE9KY0IlyrwJBf7BDIFfjcjyThcdRAg3ZnJTs4/liou/lZsSljJb5lMgjxLnD9SMRd+BHf+082hz+XAHpmQkpPSHpFxEo92ZM40Iy2pCgjGZ9FBjtdegdOSg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkywJmE3cQrYTa8E/EP2z+5ZHNzxv9/EwXFHqJCAsAo=;
 b=jGSdEf7grreNvj5tVo5/UfOy1XQXkw6I5ilQ1CcSFDQvMv3V9Wj8oFMM+t8GQe6HI7NdULN2p4Owdxc32QSFnQCrUe6Hq2wTtPy56kVNseKSX1IT6nKM6ohGaZetJgUNRBuKRjr1udd2rNEAPYtO3kmqbs00P0UM9xQ8j/t9EOI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIP3ADY0DhFj83Or22zktGWvUnbgW4aLy+zKKBLw0K8H+QkfbXupKO5MmnGn6QIvZvFMg6QnxhJAJWlJVf/fSo4LAaRb8z8Poh41buFmsJYkTwKSUw++KXa52nHFkDm+BBh/m2ldq9bx2nEFeqySlVMzQ+1rdlb0egd7l5ReIO8EWy6t5PKL61G3JAjhv4iqcT2qIF7I9Q7Ro9VzW/CNddqJcVdMxWN9qRFfU6pjy9cN7fZz2to1hDcYl/3JxA4F7oKY2WyS2FNS4sOfjvbqLejx2+iNDMbut0++PgqANjvwKC/M0ik4E9MiBYrschjJ5VMK93b1/5NQpFfxcdkEBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BkywJmE3cQrYTa8E/EP2z+5ZHNzxv9/EwXFHqJCAsAo=;
 b=llPHS7VngbLi5TIcQLYSWL3QjIW6QjqbXF7OmwplkGR9oIpi8Yg1rSrc+2OfGMoTYs9/uf/wm4vlDlGoij0ziACIz/dFqJ/8gkqQyDGnW/Fflg2wvnvi3UbjrVdVEhlgH9FdJQW3M75inbC7yYRD7B7t1mATyfKN1yPi+PcmWNDiAvVFoYc7JuR2tSLlM7o+NAqkUNWmJri/oz7PlLCRZWdHbVnseXs+LbXPZyEfHHwoJjg+gwZoIZMOcGKOFfzwNS70gpzGUg7Vr/oNDO+PXhEPIPKJ3ZlcgnW9itA13oMbQnudHy6mc4ox0UN9ob+DqL0kUljwRaSLIix2i7i9RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkywJmE3cQrYTa8E/EP2z+5ZHNzxv9/EwXFHqJCAsAo=;
 b=jGSdEf7grreNvj5tVo5/UfOy1XQXkw6I5ilQ1CcSFDQvMv3V9Wj8oFMM+t8GQe6HI7NdULN2p4Owdxc32QSFnQCrUe6Hq2wTtPy56kVNseKSX1IT6nKM6ohGaZetJgUNRBuKRjr1udd2rNEAPYtO3kmqbs00P0UM9xQ8j/t9EOI=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, George Dunlap
	<george.dunlap@citrix.com>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>, "christopher.clark@starlab.io"
	<christopher.clark@starlab.io>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jgross@suse.com" <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, "Wei Liu (LSG)"
	<liuwe@microsoft.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: Feedback for postponing the 4.17 release to a week later
Thread-Topic: Feedback for postponing the 4.17 release to a week later
Thread-Index: Adjqh6nb7bpyTo+8QPKuDS/Y5NDKqwAI6YmAAAA21oAAAA9FIA==
Date: Fri, 28 Oct 2022 09:07:42 +0000
Message-ID:
 <AS8PR08MB7991F1F7CCC8AC6A56F9F0E492329@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <AS8PR08MB79919CCB4F14F5FDE8929DF092329@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e7c17d83-d9f2-bb9e-24ae-8bc44005deeb@xen.org>
 <b1312717-15c8-f90a-c84f-1bf8709007ee@suse.com>
In-Reply-To: <b1312717-15c8-f90a-c84f-1bf8709007ee@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: AFA7768609CEF544B1ACFCFFB6E1A94A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB8477:EE_|AM7EUR03FT021:EE_|DB9PR08MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: 74998f9b-c30a-413b-45fb-08dab8c3e7c8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6Nu2xKf4YPK3vWT12mE+GvkwgOTCPBoXR58z3zYtFL3ND12JZ251OEk0tP+pLzwDfkMc0T+d5sxZ/++Ag4dT+OR7/dbUgv+1qiLeZ2vgRBOe5ZncO0BKnKwZp6CyrKWv3YBVBzTEko3Enank9mK5Y6YBXPdITcTI+LpuIQFe/oPlZBso3GgjuCvzDg6JJufq7WPk6iyqdj0e4uP0HMIYiWJg7X3l0GBDm+lg4Hrc7miTwGQnJjT3raT8Q8T97chzhKbxl+RviHlS5JQtrd2gRmVS8S7qPzm7++sZgZkPbwr1UQKBotHKq9kQnNorElG1Epa8gLqasYM8nmd/8Wc08/+5IS6FAbPG7wqIIqmYwwmPdKpCQmYVsLEAE+90NWL4LMQ6sCyozrRnKPu2L6VO+R++BIkthe8pH9EUL4UslTd3t2xGN0mfzRmrDkQJ7N39cJDdkxu2XhBi06zZH7k7W8tc/kAYW3GOFpxv6c3ecIxw8PFPU4gE+AAS+Hi/3BOYNrfT+vaKkvtGnoceFoQ/9dMaahTWZjdHrdGlPErUkozxT3Qs6NZSqaZta1UzeGnrrGt5sL5C2dNYEh8mqzQADagHxb3uWEwHltHHv2BDbm3Ru5uGbVVohckUP/yrH/k/S1q1trG65CiuAZF8e/SjBJMwGHqdzwP0Wyvne1H0xn9bHjFwQhRQ2Qi1vUqLmy7YdIPGY63HTS6RXmf6190eJfs/gI3SHd/3eTh2ae4MUI2OXb+jR4cqgmyyDK+s6Jf5imqYzSnbPCRkETEzg7jXAA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(451199015)(2906002)(55016003)(7696005)(122000001)(186003)(8676002)(38100700002)(86362001)(8936002)(6506007)(33656002)(53546011)(83380400001)(41300700001)(316002)(110136005)(9686003)(26005)(76116006)(54906003)(4326008)(66446008)(71200400001)(64756008)(66556008)(66476007)(66899015)(66946007)(52536014)(478600001)(7416002)(5660300002)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8477
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5895603b-0040-4516-63da-08dab8c3df37
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P9S0ulL2UWgFVNWhaEABhHvLru746TcRDtujyLdNP2t2BokHCSskm7IYQwgRh+j1IE4a5aoBWCEuH3Orq/UoH4FW+LXmboIusNXx83/94gWpL+rmfoottNKHNszeWwRUAnAfv8eKLVyzviGeAV7OKUZ2lnyIJnNsH8595oJSw2OtxT+6Zo9bEOXV3fcB1g9gLJXbX7ekhlF+VLIUGGQEkLkiwDKerkDVn5yAhNJtDBVP0Xs2oOZYDjoadnjtbJs5q/R/xPGL43wkss8C4T78CC5yiha1MaxW8cv7h4MM29jDkF/3O0jjp9gJ8avQfivvQIz8DkHgoV8eBombx8lBogA9m2fbumTxOJ+cjr9eIcEIqcbs5BdtQ4J9ofvUkJqikVIafKiJAylvsp1lC7fRwtKARr9x2DsYrNSDbIhWQcPPTccfySUKuWNTkdmpmJfWikQU/vONJYetdtOQtnIe4nntTD67WdEgGhHB5S1FYS+kV2k5JTHz3whl1rkY2epwks9Z0Ry9RXE0s4ZtOc+rCC7VMveSGjC9F7+15N+yEl27B2e6FFMAsEOqhm9IVfRx400c40DkGiZ4McW05o2PJolDDrY5rFfsjbN9dLqTvIsdQv71k+4ATAlNN//erDdAuPak+Oq7vu/tNu9sFf64ZcKcdj78CH5NaOjeHSDqdhZchKGR5hIF4IdjZuWrAej6IN3BZOqLxOhlUsawl15OgM02GnH6geYQ7rRilgZYuWqWnhfRla8OdNSYegImmyD1L59lN5d3kAt6qqxvFpsWqg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199015)(36840700001)(46966006)(40470700004)(81166007)(82740400003)(316002)(33656002)(40460700003)(40480700001)(478600001)(86362001)(356005)(2906002)(70586007)(8676002)(4326008)(54906003)(8936002)(5660300002)(41300700001)(110136005)(52536014)(70206006)(6506007)(82310400005)(36860700001)(83380400001)(9686003)(53546011)(7696005)(55016003)(26005)(186003)(336012)(66899015)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 09:07:57.2517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74998f9b-c30a-413b-45fb-08dab8c3e7c8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8739

SGkgSnVsaWVuIGFuZCBKYW4sDQoNClRoYW5rcyBmb3IgYmVpbmcgY2F1dGlvdXMgOikNCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+DQo+IFN1YmplY3Q6IFJlOiBGZWVkYmFjayBmb3IgcG9zdHBvbmluZyB0aGUgNC4x
NyByZWxlYXNlIHRvIGEgd2VlayBsYXRlcg0KPiANCj4gT24gMjguMTAuMjAyMiAxMDo1NywgSnVs
aWVuIEdyYWxsIHdyb3RlOg0KPiA+IE9uIDI4LzEwLzIwMjIgMDU6NDMsIEhlbnJ5IFdhbmcgd3Jv
dGU6DQo+ID4+IFNpbmNlIHRoZXJlIHdpbGwgYmUgYSBiYXRjaCBvZiBYU0FzIHJlbGVhc2VkIG9u
IE5vdi4gMSBbMV0gYW5kIHRoZSBvcmlnaW5hbA0KPiBkYXRlIGZvcg0KPiA+PiB0aGUgNC4xNyBy
ZWxlYXNlIHdhcyBzdXBwb3NlZCB0byBiZSBOb3YuIDIsIEkgYW0gdGhpbmtpbmcgdG8gcG9zdHBv
bmUgdGhlDQo+IDQuMTcNCj4gPj4gcmVsZWFzZSB0byBhIHdlZWsgbGF0ZXIgKE5vdi4gMTEpIHRv
IGdpdmUgYSBsaXR0bGUgYml0IGxvbmdlciB0aW1lIHNvIHRoYXQ6DQo+ID4+DQo+ID4+IC0gVGhl
IHNlY3VyaXR5IHRlYW0gd29uJ3QgZG8gYW55dGhpbmcgaW4gcnVzaC4NCj4gPj4gLSBXZSBjYW4g
aGF2ZSBtb3JlIGZlZWRiYWNrIGFmdGVyIG1lcmdpbmcgdGhlc2UgWFNBcy4NCj4gPj4gLSBJbmNs
dWRlIG1vcmUgcmVsZWFzZS1yZWxldmFudCBidWdmaXhlcy4NCj4gPj4NCj4gPj4gTWF5IEkgcGxl
YXNlIGhhdmUgc29tZSBmZWVkYmFjayBvbiB0aGlzIHByb3Bvc2FsPyBUaGFua3MgdmVyeSBtdWNo
IQ0KPiA+DQo+ID4gU29tZXdoYXQgcmVsYXRlZC4gV2hlbiBzaG91bGQgd2UgYnJhbmNoIGZvciB0
aGUgcmVsZWFzZSBhbmQgc2V0DQo+ID4gQ09ORklHX0RFQlVHPW4/DQo+ID4NCj4gPiBJIHRoaW5r
IHdlIHdvdWxkIGF0IGxlYXN0IG5lZWQgYSBSQyB3aXRoIENPTkZJR19ERUJVRz1uIGJ1dCBJSVVD
IHdlDQo+ID4gdXN1YWxseSBkbyBpdCBhdCBhIHBvaW50IHdoZXJlIHRoZSB0cmVlIGlzIG5lYXJs
eSBmcm96ZW4uDQo+ID4NCj4gPiBBRkFJQ1QsIHRoZXJlIGFyZSBzdGlsbCBhIGZldyB0aGluZ3Mg
aW4gZmxpZ2h0IChpbmNsdWRpbmcgZml4IGZvcg0KPiA+IFhTQS00MDkpLiBTbyBJIGFtIG5vdCBz
dXJlIHdlIGFyZSBpbiBwb3NpdGlvbiB5ZXQgdG8gYnJhbmNoLiBBbnkgb3BpbmlvbnM/DQo+IA0K
PiArMSB0byBpdCBiZWluZyB0b28gZWFybHkgdG8gYnJhbmNoLiBJIHdvdWxkIHN1Z2dlc3QgdGhh
dCB0aGUgWFNBIGJhdGNoDQo+IHNob3VsZCBoYXZlIGdvbmUgaW4gZmlyc3QgYW5kIHJlbGVhc2Ug
YmxvY2tlcnMgc2hvdWxkIGhhdmUgYmVlbiBkZWFsdA0KPiB3aXRoICh1bmxlc3MgZm9yIHNvbWUg
aXQgaXMgY2xlYXIgdGhhdCB0aGV5J3JlIGdvaW5nIHRvIGJlIHVuaW50cnVzaXZlKSwNCj4gdG8g
bGltaXQgd2hhdCBuZWVkcyBhcHBseWluZyB0byBzdGFnaW5nIGFuZCB0aGUgbmV3IGJyYW5jaC4N
Cg0KSSBhZ3JlZSwgdGhlcmVmb3JlIEkgdGhpbmsgd2UgY2FuIHN3aXRjaCB0byBDT05GSUdfREVC
VUc9biBpbiB0aGUgUkMNCm5leHQgd2VlayBhZnRlciB0aGUgTm92LiAxIFhTQXMuIFNvIHdlIGhh
dmUgYXQgbGVhc3QgYSB3ZWVrIGFmdGVyIHRoZSBSQzMuDQoNCkRvZXMgdGhpcyBzb3VuZCBvaz8N
Cg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gSmFuDQo=

