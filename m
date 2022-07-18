Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66073577CDC
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 09:52:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369330.600686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDLXn-0005Ik-Mb; Mon, 18 Jul 2022 07:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369330.600686; Mon, 18 Jul 2022 07:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDLXn-0005Gv-Jl; Mon, 18 Jul 2022 07:51:55 +0000
Received: by outflank-mailman (input) for mailman id 369330;
 Mon, 18 Jul 2022 07:51:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nnHU=XX=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oDLXm-0005Gp-J5
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 07:51:54 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20071.outbound.protection.outlook.com [40.107.2.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cef50cd-066e-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 09:51:53 +0200 (CEST)
Received: from AM6P193CA0053.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::30)
 by AM8PR08MB6628.eurprd08.prod.outlook.com (2603:10a6:20b:362::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Mon, 18 Jul
 2022 07:51:51 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::b6) by AM6P193CA0053.outlook.office365.com
 (2603:10a6:209:8e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14 via Frontend
 Transport; Mon, 18 Jul 2022 07:51:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12 via Frontend Transport; Mon, 18 Jul 2022 07:51:50 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Mon, 18 Jul 2022 07:51:50 +0000
Received: from 0579016e35cd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5100EEED-9845-48DF-AFCA-2F06814DAB20.1; 
 Mon, 18 Jul 2022 07:51:44 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0579016e35cd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Jul 2022 07:51:44 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB8PR08MB4124.eurprd08.prod.outlook.com (2603:10a6:10:b0::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 07:51:40 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%5]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 07:51:40 +0000
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
X-Inumbo-ID: 7cef50cd-066e-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=A/a66/Cah+Fgtu9PZqo2fSCabBRv+/TxX0u5z7cncub41iGxWpnqkdf+CjccBzaw4w3we1OCAOqxJoLqtuo7XkNejP7JLEiMFHn3/iZHo2i1I8uVQIKkbCE/gmPGKckSzShQiQ2GCvwCFAwF9LgqjZwsB+9tIAfvwBRjl3lFcnGAdpXoKT5YOsamILrtCPCnUsiR1XNyXrCKRiZtxZIN9CqnTfQ4ru2rWzLmx9s9VdMGCnF3M02zVvxcUDoJ7sYt7iFOKWDz/Ojd5uTH9zC5iUEhVGZrxcDp3q3cuPqEsCZJfQkRUtYAA6ezRWA0t2cHEg3pQfVM3PhayUpqQk8aOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjGx78bJnWHhRzsa/su5yBPTVwWm1/fIEMhsXv8gEOc=;
 b=i6UNPV3SIZKPQX+IW6cT/g6eivJywfmgU2kPFHn8BqKfSKdLIZGy1g3C/zGgsRuAk+Yo73Az+qcoVk346cq+iWYadEJj9Ecb8FC7OylUQBajDio/bjFfAsz20O/8f2ZPY+0OsJ9NqT9EB4g74ARzSy4rVrAZVQ/ME9Tdsr4Txeh0asIMImUFwOk7H7/5sl3I/buqX8KeDhFivLTvMSiUCUHnpr121KkUOWSc7SSNx8mXgV2bGLXuJiZGSiwrxWIOG0TQlspHgClKbnaJUeeyOlnmUWTOi6nPdhf+ec+0cKmqKGg+AGbxVZddPrksbX06saJ55Q/EEA0H9gSoLOfc2A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BjGx78bJnWHhRzsa/su5yBPTVwWm1/fIEMhsXv8gEOc=;
 b=SGwHRILjXRF7fIpcb2eZsq8nR2M+ZfXLJWcvvGXvM8MO70ETY4SHIUTdQ4ey0FSx0oA3anoWZGFGVl8UuhxViyOo1K1wE1TSGxahATt7cYE5fH2iSO8UhhXi6eNe4BYpH8/yuINIo7TI5uXYO81M5mN/51C+XprZFkTpS6O8GCQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSlBcItPErkvBfYfUw6PzuRPhfU/L/hiKkTlG9dHYc8FRN1h8utnJTFJjAeKQ4HYx2g2YJTCIZm6+zxj/vqXtgld7Tgr8Num7E4TSEi5j6ueF0V+s0E1va+h5oLkr1myaxdr3PjeIvZvmRpGhCqbqvXUJ7b05tEpoxnykq62xUuACiwfs12SQJ6mwr7aUNTM4g9thfkp42z6oFayOcWxI3hOQ98URU3P6FWNbx/0aEu53uvvgaKW+xki4+h/mzHRAkL5uESd+nGmqseC/MG+q5tQ5T7Yl9keFD9btmtPxSqpfY+Rq2GQg1ldVKnafxEpV71LLh4VakNEXfdnoLbMTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjGx78bJnWHhRzsa/su5yBPTVwWm1/fIEMhsXv8gEOc=;
 b=Bbev20bPVoxP35xu5H12PeHTGEOWitI53R7h9VKFtM5mPyEG6oD0YBP/INaOc26EUWwrM2ewG3df596+MJGDRxSdTrNiioYqnQ5LERHSxhVPXPadYMDsfERi4VbFnNnUMxPZFeXKrD0UyfxOtzs1Q9Gj5STxOMo/TdxT7Lkf9gAA5e8r+qLeHUpOdeZAerNd0hLNhX7WoThfiNHyaNc9eEf7hEpH+95NOddDi+c0GlPujI2vpJacbKFjmkL5Ni9xxG0QmfkpOfJL2w4Jd79hosha9Y6/x1vF5R+x7UpTXUeyjWIQmIl2rfau7Znqy702UhqOfhSm14Lwwmxf4ChUFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BjGx78bJnWHhRzsa/su5yBPTVwWm1/fIEMhsXv8gEOc=;
 b=SGwHRILjXRF7fIpcb2eZsq8nR2M+ZfXLJWcvvGXvM8MO70ETY4SHIUTdQ4ey0FSx0oA3anoWZGFGVl8UuhxViyOo1K1wE1TSGxahATt7cYE5fH2iSO8UhhXi6eNe4BYpH8/yuINIo7TI5uXYO81M5mN/51C+XprZFkTpS6O8GCQ=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 9/9] xen: introduce a Kconfig option to configure NUMA
 nodes number
Thread-Topic: [PATCH v2 9/9] xen: introduce a Kconfig option to configure NUMA
 nodes number
Thread-Index: AQHYktrGRUcF8MDJDk6LN0+4egi+Ca160z2AgALXevCAABQigIAABL8AgAYMPgA=
Date: Mon, 18 Jul 2022 07:51:40 +0000
Message-ID:
 <PAXPR08MB7420CC0ACE1AAEED5254981C9E8C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-10-wei.chen@arm.com>
 <b7d914bc-a2d7-d12e-15ac-ae7389d8bcd2@suse.com>
 <PAXPR08MB74200E2A75A2D755AC95BF519E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <a54d09a2-6629-16f1-8893-37d022c2dd5b@suse.com>
 <a9cd1e2f-fb49-ef68-41a9-58eb7c546266@xen.org>
In-Reply-To: <a9cd1e2f-fb49-ef68-41a9-58eb7c546266@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 954B3AF06E76EF4583D800EF0DF16378.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b6e411cc-64e4-4529-5644-08da68925fd8
x-ms-traffictypediagnostic:
	DB8PR08MB4124:EE_|VE1EUR03FT005:EE_|AM8PR08MB6628:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 af337b/Bp6H6xyv1c/Z+AMowQzAKdUe7qd1XHF9nQbSSn45lM8fky9cMyS2P1+ddQjJO9YVg1gfcCR/UB61fhzi8tIzD9NjdIVF1Pz+4lWQXfeiHX9pEC8LAM4fjnlj9Wdq1f3nL0SnYd6BZvpWKaBh3RAqscxZLRHuChhSNA6d/kIhEGmPctatmDm31RU/nuaJwEzsgomlTK5vMI6eRj+kr38rCHgSoy/wjFvfw1x+oQw8gSHg6L0EsntCKF/b7GH7+Xr8YsfE4tiJRcE3qgWnI4xczaK3T5n2QKK5Ik/Gnef6+ns/o0Fa3jsws9jhV8o5DgPwiiJiBFV2QAXzdtL7w/vyF+4Ku1UH/XOgXOHnYp3cM7xwnyNbTrFP0LveD7fSnfhzL8/OSOUOezfssiRB0lGbjTYzt4xe/incapo7fxDdkF8O3rZ5wmd9ACxVHi7qB+95FmJdAITzJzonH6w2LkSxIDfmsywtv4373X+Vb5NMwqVU+dYCcCAwvEMqqw1smKmGeVUoK5Iyx+r18Jxh8weR3KOazBORFhXHb33dcRGcqhbB6JTRthE8wbdh2V10ESLZRWRhXwOJRWsk3wRIQBTy7NEURcPw9ogGIO0S6ObaxLi6/jNFPfoGqCFEB2jRrikikDSbID2eEYLvv0u+4q5DdolETYXDMqBheGo8j6gcglE4KqcQ4TUSk8fIFycr0buSG/NuWxXtKy0/PZRyOfDp1Fd4Kl/3WUM0QbsMHXPJlqRqPI5I7yGwl+chBAz14In2OQWpr9N4hPjGHp1rYouD4NTqzQ7l6mOkXqPpDbF976wJG71XIr8rztoQW
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(33656002)(86362001)(52536014)(8936002)(38100700002)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(55016003)(38070700005)(110136005)(7696005)(54906003)(53546011)(6506007)(316002)(26005)(83380400001)(41300700001)(9686003)(186003)(478600001)(71200400001)(5660300002)(2906002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4124
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	97dbad04-34c9-42ab-cd57-08da689259c7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FNxiVKCxesET/jdQyZg7236P/2slIpiVD+rF26SxwPSqxO7oyQzNlstYqWBOel9WxsIWcNya2PXsqo4YKmsI5KmAeVsakBhpafSGlQsWsHklcAxpnsOt12sVz9kek5K7p36uED8+JXuROSMBa7hxaqMz7GUKdEq8P9SB9xq/iYpu0hkGMnd0sOJVfC1ryjXVZar8kHE6ejZDdi0IlUuAGVF2xTDwcQD+c6lx/UgwbVmurgr+3yg2RfvvDbaYtktWzQU/h7Ee6nqHr9CZd2/CP/BuVs2sMx9lRv+ivnoY5yWs5mOODfxOubnqL1R+SumsaKwB6vpYiRazAzHZ/CXvySugTkaQvaWtfkpMXP0y2f7VMOCKj7D9CanDZ4JGHccTA4MnXmDMlaT53dd5/L18FaMH+QlnVsZlcDXSd4DOtbcxQdirGBEtWU3WqhgSWdJDpcfmh0g04XMIqyRCjwqCCzuBk2tb/vdWlfqO17y/HmFXKQ8gR3WE0iFBJPfFEI3NDrpiCMb+o4dIEvp441Jv3JUw/CRm0upKnbiCe3kozr9LhdFWncDDeX/vu5X2sf2QgIKKWrndva3MU8y2NJCoVJVfhIiYIPBdvubaqfrpdSbYegN4x7gdbbd7ef3MZk95sVMeiL4Q91BugOryuFGfmmL9nqDGgM/n5S75rWggAbLeVtCO/1wi1rWCqd2xEIq5mUnAajPeO53zUnMDIyArnhWS53eesCM03OqvvSPw+TyAgPTc8LnpLzEeqisFXuuDxKBRJNv1fmIsaB7xcgITs6UbPYqCdY8BNkrvBvZoGAJ29V+fMToWuMW1CJD7zItd
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(136003)(346002)(36840700001)(46966006)(40470700004)(478600001)(41300700001)(86362001)(6506007)(7696005)(356005)(54906003)(316002)(33656002)(81166007)(82740400003)(9686003)(26005)(83380400001)(186003)(336012)(47076005)(110136005)(53546011)(82310400005)(4326008)(40480700001)(40460700003)(55016003)(5660300002)(8936002)(8676002)(70206006)(70586007)(52536014)(2906002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 07:51:50.7770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e411cc-64e4-4529-5644-08da68925fd8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6628

SGkgSnVsaWVuLCBKYW4sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogMjAyMuW5tDfmnIgxNOaXpSAx
OToyNw0KPiBUbzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgV2VpIENoZW4gPFdl
aS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UNCj4gRHVubGFwIDxnZW9yZ2UuZHVubGFw
QGNpdHJpeC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA8cm9nZXIucGF1
QGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MiA5LzldIHhlbjogaW50cm9kdWNlIGEgS2NvbmZpZyBvcHRpb24gdG8gY29u
ZmlndXJlDQo+IE5VTUEgbm9kZXMgbnVtYmVyDQo+IA0KPiBIaSBKYW4sDQo+IA0KPiBPbiAxNC8w
Ny8yMDIyIDEyOjEwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPiBPbiAxNC4wNy4yMDIyIDEyOjE0
LCBXZWkgQ2hlbiB3cm90ZToNCj4gPj4gSGkgSmFuLA0KPiA+Pg0KPiA+Pj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPj4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCj4gPj4+IFNlbnQ6IDIwMjLlubQ35pyIMTLml6UgMjI6MzQNCj4gPj4+IFRvOiBXZWkgQ2hl
biA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gPj4+IENjOiBuZCA8bmRAYXJtLmNvbT47IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UNCj4gPj4+IER1bmxhcCA8
Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47
DQo+IFN0ZWZhbm8NCj4gPj4+IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1DQo+IE1vbm7DqQ0KPiA+Pj4gPHJvZ2VyLnBh
dUBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4+PiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYyIDkvOV0geGVuOiBpbnRyb2R1Y2UgYSBLY29uZmlnIG9wdGlvbiB0
bw0KPiBjb25maWd1cmUNCj4gPj4+IE5VTUEgbm9kZXMgbnVtYmVyDQo+ID4+Pg0KPiA+Pj4gT24g
MDguMDcuMjAyMiAxNjo1NCwgV2VpIENoZW4gd3JvdGU6DQo+ID4+Pj4gLS0tIGEveGVuL2FyY2gv
S2NvbmZpZw0KPiA+Pj4+ICsrKyBiL3hlbi9hcmNoL0tjb25maWcNCj4gPj4+PiBAQCAtMTcsMyAr
MTcsMTQgQEAgY29uZmlnIE5SX0NQVVMNCj4gPj4+PiAgIAkgIEZvciBDUFUgY29yZXMgd2hpY2gg
c3VwcG9ydCBTaW11bHRhbmVvdXMgTXVsdGktVGhyZWFkaW5nIG9yDQo+ID4+PiBzaW1pbGFyDQo+
ID4+Pj4gICAJICB0ZWNobm9sb2dpZXMsIHRoaXMgdGhlIG51bWJlciBvZiBsb2dpY2FsIHRocmVh
ZHMgd2hpY2ggWGVuDQo+IHdpbGwNCj4gPj4+PiAgIAkgIHN1cHBvcnQuDQo+ID4+Pj4gKw0KPiA+
Pj4+ICtjb25maWcgTlJfTlVNQV9OT0RFUw0KPiA+Pj4+ICsJaW50ICJNYXhpbXVtIG51bWJlciBv
ZiBOVU1BIG5vZGVzIHN1cHBvcnRlZCINCj4gPj4+PiArCXJhbmdlIDEgMjU1DQo+ID4+Pj4gKwlk
ZWZhdWx0ICI2NCINCj4gPj4+PiArCWRlcGVuZHMgb24gTlVNQQ0KPiA+Pj4NCj4gPj4+IERvZXMg
MSBtYWtlIHNlbnNlPyBUaGF0J3Mgbm90IGdvaW5nIHRvIGJlIE5VTUEgdGhlbiwgSSB3b3VsZCBz
YXkuDQo+ID4+Pg0KPiA+Pg0KPiA+PiBPaywgd2UgbmVlZCBhdCBsZWFzdCAyIG5vZGVzIHRvIGJl
IGEgcmVhbCBOVU1BLg0KPiA+Pg0KPiA+Pj4gRG9lcyB0aGUgdmFsdWUgYmVpbmcgKHBlcmhhcHMg
ZmFyKSBsYXJnZXIgdGhhbiBOUl9DUFVTIG1ha2Ugc2Vuc2U/DQo+ID4+Pg0KPiA+Pg0KPiA+PiBB
cm0gaGFzIDEyOCBkZWZhdWx0IE5SX0NQVVMgKGV4Y2VwdCBzb21lIHBsYXRmb3JtcykgYW5kIHg4
NiBoYXMgMjU2Lg0KPiA+PiBTbyBJIGFtIG5vdCB2ZXJ5IGNsZWFyIGFib3V0IHlvdXIgY29tbWVu
dHMgYWJvdXQgZmFyIGxhcmdlcj8gQXMgbXkNCj4gPj4gVW5kZXJzdGFuZGluZywgb25lIG5vZGUg
aGFzIDIgb3IgNCBjb3JlcyBhcmUgdmVyeSBjb21tb24gaW4gYSBOVU1BDQo+ID4+IFN5c3RlbS4N
Cj4gPg0KPiA+IFRoZSBkZWZhdWx0cyBhcmUgZmluZS4gQnV0IGRvZXMgaXQgbWFrZSBzZW5zZSB0
byBoYXZlIDI1NSBub2RlcyB3aGVuDQo+ID4ganVzdCAzMiBDUFVzIHdlcmUgc2VsZWN0ZWQ/IEkn
bSBhZnJhaWQga2NvbmZpZyBpcyBnb2luZyB0byBnZXQgaW4gdGhlDQo+ID4gd2F5LCBidXQgSSB0
aGluayBJJ2QgbGlrZSB0aGUgdXBwZXIgYm91bmQgdG8gYmUgbWluKE5SX0NQVVMsIDI1NSkuDQo+
DQo+IExvb2tpbmcgYXJvdW5kIE5VTUEgbm9kZXMgd2l0aCAwIENQVXMgZXhpc3RzLiBTbyBJIGRv
bid0IHRoaW5rIHdlIHNob3VsZA0KPiB0aWUgdGhlIHR3by4NCj4gDQoNClllcywgc29tZSBub2Rl
cyBjYW4gb25seSBoYXZlIFJBTSBhbmQgc29tZSBub2RlcyBjYW4gb25seSBoYXZlIENQVXMuDQpT
byBpcyBpdCBvayB0byB1c2UgMi0yNTUgZm9yIG5vZGUgcmFuZ2U/DQoNCj4gQ2hlZXJzLA0KPiAN
Cj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

