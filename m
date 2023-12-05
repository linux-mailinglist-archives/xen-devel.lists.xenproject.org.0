Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8B7805653
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 14:46:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647891.1011603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVl5-0007Ze-Fp; Tue, 05 Dec 2023 13:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647891.1011603; Tue, 05 Dec 2023 13:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVl5-0007We-CI; Tue, 05 Dec 2023 13:46:43 +0000
Received: by outflank-mailman (input) for mailman id 647891;
 Tue, 05 Dec 2023 13:46:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QNL/=HQ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rAVl3-0007Ub-RC
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 13:46:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20600.outbound.protection.outlook.com
 [2a01:111:f403:2612::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b796167e-9374-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 14:46:40 +0100 (CET)
Received: from AM6PR04CA0052.eurprd04.prod.outlook.com (2603:10a6:20b:f0::29)
 by DU0PR08MB7566.eurprd08.prod.outlook.com (2603:10a6:10:31e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 13:46:29 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:20b:f0:cafe::dd) by AM6PR04CA0052.outlook.office365.com
 (2603:10a6:20b:f0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Tue, 5 Dec 2023 13:46:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Tue, 5 Dec 2023 13:46:28 +0000
Received: ("Tessian outbound 385ad2f98d71:v228");
 Tue, 05 Dec 2023 13:46:28 +0000
Received: from 525f584c6da2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E663F846-AA07-484C-8FD9-75BE1FBA861C.1; 
 Tue, 05 Dec 2023 13:46:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 525f584c6da2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Dec 2023 13:46:17 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM8PR08MB5570.eurprd08.prod.outlook.com (2603:10a6:20b:1d2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 13:46:16 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%7]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 13:46:16 +0000
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
X-Inumbo-ID: b796167e-9374-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TnLFqyNrcx6pXVq5ThqlOUc72W3MYzqi1f2e+SV9e5T/1RVmWmuMGWNAkMDH/7Bs0vTkaULtHT/wVhLGRnkAxj6SnXixUm46FsdDZq4x9Mg+SRyZaabL+khUe/WHo/H8wYEdxigmDI2vPfV9pVabMwYqpbCVuqhUbqi0LlekwrNXB2FNvmK+161cE5aKsW4Z17zwuviGEb4/bGVo4JLnSB5FddGEWNtp+0likL+h6FEjuvZarCaUEGBQI9dKHQSn/Nuo0QHWdZ3884hD8NqRx9afWuGgMwCsUHA+Bi+yW9BI0qIjhbJefb0qNTtey86ZygXHWFIbGeFoP/mR9mZfCQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkcRtQSt+ZngtZUfvVnKnyw+5YWnh/NRGw5LsMRqcrI=;
 b=nT9upRfQdYPT8Wmp5+etYoqXE7r6taPBSp42Q3txskPTWxIPPW//qR+HNpF/iOA4S3qMmNRNWA627afBZJQ8QVKjgAjYFLmQIJIv2OPrxheoSIcfYibIUxHuuPmnJWNSjw26zlZMfMMnRZo2oclC9++cVG9LloplIU5p4yMZPuDiR89JbukCTJbsB4G/SDnLeNvYOfpeJfgONxfyYslUWGo09yMsY+ZLyYV6x0pAIDRL/NumkKqw5Z0NGhtjZ01j0KYBHwfFpg9DUslIq/FUeBLPwCJXr6x5UjHM8k1tEE3hW4t369EUiY5y02koHPPaCwTQkNRBfMQrEAqTzX9SXg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkcRtQSt+ZngtZUfvVnKnyw+5YWnh/NRGw5LsMRqcrI=;
 b=sw1UtwDejQ8E/NIyT9uyc6C61djN/i6jr92ZkaMRlyFdR/Wz24n5l/kpO/2luntV6eAvYsi/GGuodjutZA9zrOhEcFafCj2S5Z5mmDH8lB69v7F/1sIkDSlKY0C6eH+Rg8eNyvGNdYkMogLpV+UAWOxqJAoeq4IyLTg1uMhInyA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cd7893aea5649c05
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PPKTi91qEeXLEWunAXY+CDcyxV33gLcB6U+uV8yFyqFiJQqU12D+Cfa5H71Pkq0kgltuRsBloBz/s8toufBq1pt7+A1MysFCDfZ7E3/A9yynLnfj1sv6UKLkUh3PgeO5I5hDeQSCLTFRfM3l0+KGONKj5OX8tGZ57u0mWxDY4KDsWw8ysPws2qfUqeWGP5XRRD1jabUvBY2nHnBgWZnBtaJHy19M2zeOXUpbWnFGq+AJOkAVlvIaVLV2yWzvEUuZOhDRFae2eB/aN6FnJymMJku4jpg43Px+HK2qdBROUsdlc8VEgHASqpFcYUYI1yR1vvYNlPwxiGaeVSaqobIIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkcRtQSt+ZngtZUfvVnKnyw+5YWnh/NRGw5LsMRqcrI=;
 b=n1/njHfo34LECIOTiXfu8o3RyhK9Dy8PyNRJhuO3OJjJhTWKvDWunfdAZ641ywuVSwrVdFGqpCIlZaHJOOd5zDDzRhU9rpzQMPV9Z5bzWuQrikAvoeVqJzVe8Kmodv2/yKARAFhx/h9bmhS6aZ4uYlxWOSdGldWGflY+03o1klPdgVzRnv4AnT+c+JPppjFZPHGQTrDt3LP7EmEYqwWkmywyv2bZK4h6hWf/9iwPZLoOu2IXW5Z6kmwLh33Jc72qA+lXK54X/KvAUs6yWIf5LgOCpBk1zu7ugp5P05Yb4tGEk2SLT3Yza2o1Rx3ZhpJFxKaWutXh6gOJOD5VCtJIdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkcRtQSt+ZngtZUfvVnKnyw+5YWnh/NRGw5LsMRqcrI=;
 b=sw1UtwDejQ8E/NIyT9uyc6C61djN/i6jr92ZkaMRlyFdR/Wz24n5l/kpO/2luntV6eAvYsi/GGuodjutZA9zrOhEcFafCj2S5Z5mmDH8lB69v7F/1sIkDSlKY0C6eH+Rg8eNyvGNdYkMogLpV+UAWOxqJAoeq4IyLTg1uMhInyA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <Michal.Orzel@amd.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>
Subject: Re: Clang-format configuration discussion - pt 2
Thread-Topic: Clang-format configuration discussion - pt 2
Thread-Index: AQHaHhwDfni7SbjBtk6S7YLD/w4HebCaxpCA
Date: Tue, 5 Dec 2023 13:46:15 +0000
Message-ID: <2E778E49-C2F5-421F-9598-CED15E7D4284@arm.com>
References: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
In-Reply-To: <1B83FF45-E93B-47D7-AD21-615CFCFD0816@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM8PR08MB5570:EE_|AM2PEPF0001C714:EE_|DU0PR08MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bc34f1e-63a2-4d71-7c90-08dbf5989525
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kzOwAhmg8yesBT6jhOOUP3J39qEIAZMqvwXDWRV5rScnaob6TOS7fVQbsv2bjSXl9meYfp1EeT0mA4CZyJ0V8kVhWhXalbNLbK6yDtrWf+V3/34lCLdXVuo67Pm22qjlXOkwchLQO1deIUfcdIeE42R4ywGGEgHhPZTShoXp3zb+zuhV9HX1FgJW00fT8qkCXRpL1YIJagC5rQdtfBQTfh7eMWb8YRfYWQ5oDmXiJBLqJDDG1FyAKAQ3XNHA23fl2sWe+hVDyCA5Djer8cYvoMJWnc2FADFyM847Fj9NAWrfBriQl4Tv/o3lXMEL4sQVWzRfykOLaTIxH5o2TD7ott/El8jKIFWAyyNoVnaVDez+Dn4OPNUEzxsDkQ7BM+rgu+gGAt7Bc13XoQ78nChvIpqkkjjj4uL4eDvmg0hxUBJkdlwvtpart2eYDAiQ2NWs1nk6udSBXcX6x1S2YDiG+dD0xaR07fD/ydqVu3Cey/MmantoA3t7qZUlbMlLTq/aJLL82tRUN/Eu21H73bOjHu4QPN3RVtlIGGGxqw0wKmN4ouSeM4ye15MAAh666vDf6fE/h8N7kjMEvl6tACbogzmjWrC9xFRfiHaITP51v+ldeLBApaVt3eOWEUVW/fTxA8fmm7/uLp8GLkBk4Htu0RW2Y6hEV8WGYEjTN75pDWZ5yyIo7vXYFVlYyCWp7ip2
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(346002)(376002)(136003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(2906002)(33656002)(316002)(66899024)(91956017)(66556008)(6916009)(54906003)(64756008)(66446008)(66476007)(38070700009)(76116006)(86362001)(66946007)(8676002)(41300700001)(36756003)(4326008)(8936002)(5660300002)(38100700002)(122000001)(6486002)(83380400001)(478600001)(966005)(26005)(71200400001)(2616005)(6512007)(53546011)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7639F983F4CC614583EB5C63C484BA11@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5570
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f24a89b2-5fc5-4efb-59c9-08dbf5988d75
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mBs91WgdiY4csIYP7DaILs2cUIpXVArMYaROtEs+/0u2inF9Wr3Aor/DFNjawGQulEdqR/LVkcsRR1An9gqu4wC4FxgcnX3T1CKc7EHikN23BT/mVSlb+dHSruwRKfzhHzQcB2YP2LKAuS6talGA6eqUMGTnZfdz4wICz6a0axrUrdElgInRiTps5fULgaCvAGFZdVtPmiAzQwghRSDJMW0by88FntJwa2Vbdq5Sx8tRVh6NpXJ9Yf/CLx9wsrSdqFdjfziS7F2P8GpwyfvHxU3epWUA29S+txU32EqiQ3Q78QGtMnWhGqligxvixAajJvhLaw00gW99I0BG5SbMPS/zL2ycUKSffMSSV5vg0yam9I/TELflTjvt+kq33ulSzDWMJX7CXqfkByGQsoWT6A1SoSqrEcy1RwwBHE6NkKZtnUhEodIOowwX/BvC6Z0KmqPETNQ8opnlq8x/QUXUlueiHfa5V+yt7Fjf9I4l98u4066vUUD1u2AbaUDGdoKFEy5p8KWHXTh19t9nUnqT6D0qIqwRF2bL3l/xOCOd8AwFREMx7oZtegq26iwtCZ/y03wd1gcimC2e8rwme49KtukR3lraem/NGC+Ki+ic8rIXDVxp5tyMQIWdHvhkbI504/zk+3BGr1g4W/+TptSyDUcvzR5SilXTeL3l7wJGs6I2kCk++2Aoy831fh0qS2w2phItuIiWaEDyMkP66tc73C/4IXUXXnNSBfneRVK+LTPoJCkVduCdzc2szP9zKBMMPOpqAj0zbL/ZWpU/LqvF9A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(136003)(376002)(230922051799003)(64100799003)(186009)(1800799012)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(356005)(47076005)(81166007)(83380400001)(478600001)(6486002)(966005)(53546011)(6506007)(82740400003)(36860700001)(8676002)(8936002)(316002)(54906003)(70206006)(6916009)(70586007)(40480700001)(6512007)(26005)(336012)(2616005)(86362001)(5660300002)(40460700003)(2906002)(4326008)(41300700001)(66899024)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 13:46:28.8528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc34f1e-63a2-4d71-7c90-08dbf5989525
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7566

DQoNCj4gT24gMjMgTm92IDIwMjMsIGF0IDE0OjQ3LCBMdWNhIEZhbmNlbGx1IDxMdWNhLkZhbmNl
bGx1QGFybS5jb20+IHdyb3RlOg0KPiANCj4gSGkgYWxsLA0KPiANCj4gTGV04oCZcyBjb250aW51
ZSB0aGUgZGlzY3Vzc2lvbiBhYm91dCBjbGFuZy1mb3JtYXQgY29uZmlndXJhdGlvbiwgdGhpcyBp
cyBwYXJ0IDIsIHByZXZpb3VzIGRpc2N1c3Npb25zIGFyZToNCj4gDQo+IC0gaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDIzLTExL21zZzAwNDk4
Lmh0bWwNCj4gDQo+IFlvdSBjYW4gZmluZCB0aGUgc2VyaWUgaW50cm9kdWNpbmcgY2xhbmctZm9y
bWF0IGhlcmU6DQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC94ZW4tZGV2
ZWwvY292ZXIvMjAyMzEwMzExMzIzMDQuMjU3MzkyNC0xLWx1Y2EuZmFuY2VsbHVAYXJtLmNvbS8N
Cj4gYW5kIHRoZXJlIGlzIGFsc28gYSBwYXRjaCBsaW5rZWQgdG8gbXkgZ2l0bGFiIGFjY291bnQg
d2hlcmUgeW91IGNhbiBmaW5kIHRoZSBvdXRwdXQgZm9yIHRoZSBoeXBlcnZpc29yIGNvZGUuDQo+
IA0KPiBGb3IgYSBmdWxsIGxpc3Qgb2YgY29uZmlndXJhYmxlcyBhbmQgdG8gZmluZCB0aGUgcG9z
c2libGUgdmFsdWVzIGZvciB0aGVtLCBwbGVhc2UgcmVmZXIgdG8gdGhpcyBwYWdlOg0KPiBodHRw
czovL2NsYW5nLmxsdm0ub3JnL2RvY3MvQ2xhbmdGb3JtYXRTdHlsZU9wdGlvbnMuaHRtbA0KPiAN
Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQoNClsuLi5dDQoNCj4gDQo+
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiBBbGlnbkFmdGVyT3BlbkJy
YWNrZXQ6IEFsaWduDQo+IA0KPiAtLS0NCj4gVGhpcyBvbmUgaXMgdG8gYWxpZ24gZnVuY3Rpb24g
cGFyYW1ldGVycyB0aGF0IG92ZXJmbG93cyB0aGUgbGluZSBsZW5ndGgsIEkgY2hvc2UgdG8gYWxp
Z24gdGhlbQ0KPiB0byB0aGUgb3BlbiBicmFja2V0IHRvIG1hdGNoIHRoZSBjdXJyZW50IGNvZGVi
YXNlIChob3BlZnVsbHkpDQo+IA0KPiBlLmcuOg0KPiBzb21lTG9uZ0Z1bmN0aW9uKGFyZ3VtZW50
MSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhcmd1bWVudDIpOw0KPiANCj4g
VGhpcyBvbmUgY2FuIGJlIGEgY2FuZGlkYXRlIGZvciBhbiBlbnRyeSBpbiBvdXIgY29kaW5nIHN0
eWxlDQo+IA0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gQWxpZ25B
cnJheU9mU3RydWN0dXJlczogTGVmdA0KPiANCj4gLS0tDQo+IOKAnFdoZW4gdXNpbmcgaW5pdGlh
bGl6YXRpb24gZm9yIGFuIGFycmF5IG9mIHN0cnVjdHMgYWxpZ25zIHRoZSBmaWVsZHMgaW50byBj
b2x1bW5zLiINCj4gSXTigJlzIGltcG9ydGFudCB0byBzYXkgdGhhdCBldmVuIGlmIHdlIHNwZWNp
Znkg4oCcTm9uZeKAnSwgaXQgaXMgZ29pbmcgdG8gZm9ybWF0IHRoZSBkYXRhIHN0cnVjdHVyZSBh
bnl3YXksDQo+IEkgY2hvb3NlIGxlZnQsIGJ1dCBjbGVhcmx5IEnigJltIG9wZW4gdG8gc3VnZ2Vz
dGlvbnMuDQo+IA0KPiBJIGRvbuKAmXQga25vdyBob3cgdG8gcGhyYXNlIHRoaXMgb25lIGluIG91
ciBjb2Rpbmcgc3R5bGUNCj4gDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+
IA0KPiBBbGlnbkNvbnNlY3V0aXZlQXNzaWdubWVudHM6IE5vbmUNCj4gDQo+IC0tLQ0KPiBUaGlz
IG9uZSBpcyBkaXNhYmxlZCBiZWNhdXNlIG9mIGZlZWRiYWNrcyBmcm9tIFN0ZWZhbm8gYW5kIEFs
ZWphbmRybyBhYm91dCBzb21lIHdlaXJkIGJlaGF2aW91ciBvbiBvdXINCj4gY29kZWJhc2UuDQo+
IA0KPiBUaGlzIG9uZSBjb3VsZCBiZSBwaGFzZWQgYWxvbmcgdGhpcyBsaW5lOiDigJxDb25zZWN1
dGl2ZSBhc3NpZ25tZW50cyBkb24ndCBuZWVkIHRvIGJlIGFsaWduZWQu4oCdLCB0aGUgaXNzdWUg
aXMNCj4gdGhhdCBpbiB0aGlzIHdheSBpdCBzZWVtcyB0aGF0IGl04oCZcyBvcHRpb25hbCwgYnV0
IGNsYW5nLWZvcm1hdCBpcyBnb2luZyB0byByZW1vdmUgdGhlIGFsaWdubWVudCBhbnl3YXkgZm9y
DQo+IGFzc2lnbm1lbnQgdGhhdCBhcmUgY29uc2VjdXRpdmUgYW5kIGFsaWduZWQuDQo+IA0KPiAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gQWxpZ25Db25zZWN1dGl2ZUJp
dEZpZWxkczogTm9uZQ0KPiANCj4gLS0tDQo+IFNhbWUgdGhpbmcgYXMgQWxpZ25Db25zZWN1dGl2
ZUFzc2lnbm1lbnRzLCBidXQgZm9yIGJpdGZpZWxkcy4NCj4gDQo+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQo+IA0KPiBBbGlnbkNvbnNlY3V0aXZlRGVjbGFyYXRpb25zOiBOb25l
DQo+IA0KPiAtLS0NCj4gVGhpcyBhbGlnbnMgZGVjbGFyYXRpb25zIG5hbWVzLCBzYW1lIGNvbnNp
ZGVyYXRpb25zIGFzIEFsaWduQ29uc2VjdXRpdmVBc3NpZ25tZW50cy4NCj4gDQo+IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiBPayB0aGlzIGlzIGl0IGZvciBub3csIGxl
dCBtZSBrbm93IHlvdXIgdGhvdWdodHMgYWJvdXQgdGhlbSwgaWRlYWxseSBpZiBJIGRvbuKAmXQg
Z2V0IGFueSByZXBseSBpbiB0d28gd2Vla3MgKDd0aCBvZiBEZWNlbWJlciksDQo+IEkgd2lsbCBj
b25zaWRlciB0aGF0IHdlIGhhdmUgYW4gYWdyZWVtZW50IG9uIHRoZXNlIGNvbmZpZ3VyYXRpb24u
DQoNCkhpIGFsbCwNCg0KSnVzdCBhIHBpbmcgZm9yIHdobyB3YW50cyB0byBzYXkgaGlzIHRob3Vn
aHRzIGFib3V0IHRoaXMsIEphbiBhbHJlYWR5IG1hZGUgY2xlYXIgaGlzIGNvbmNlcm5zIGFib3V0
IHRoZSBsYWNrIG9mIGZsZXhpYmlsaXR5DQpvZiB0aGUgdG9vbCwgd2hpY2ggd291bGQgcHJvdmlk
ZSBhIGRlZmF1bHQgZm9ybWF0dGluZyB3aXRob3V0IGxlYXZpbmcgdGhlIG9wdGlvbiB0byBsZWF2
ZSB0aGUgY29kZSBhcyBpdCBpcywgbWFraW5nIHRoZSB0b29sDQpub3QgZml0IGluIGhpcyBvcGlu
aW9uIHRvIHRoZSB1c2Ugb24gb3VyIGNvZGViYXNlLg0KDQpJbiBteSBvcGluaW9uLCBJIGRvbuKA
mXQga25vdyBvZiBhbnkgdG9vbCB0aGF0IGNhbiBhZGRyZXNzIGFsbCB0aGUgZmxleGliaWxpdHkg
dGhlIFhlbiBjb2Rlc3R5bGUgYWxsb3dzLCB5ZXQgdGhlIHVzZSBvZiBhdXRvbWF0aWMNCmNoZWNr
ZXJzIHdvdWxkIGltcHJvdmUgdGhlIHJldmlldyB0aW1lLCBhbGxvdyBtb3JlIG5ldyBjb250cmli
dXRvcnMgdG8gYXBwcm9hY2ggdGhlIGNvbW11bml0eSB3aXRob3V0IGJlaW5nIHB1dCBkb3duIGJ5
DQp0aGUgYW1vdW50IG9mIGNvZGUtc3R5bGUgY29tbWVudHMsIGNvbnNvbGlkYXRlIHRoZSBzdHls
ZSBhY3Jvc3MgdGhlIGNvZGViYXNlLg0KDQpTbywgcGxlYXNlIG1haW50YWluZXJzLCBsZXQgbWUg
a25vdyB5b3VyIHRob3VnaHRzIG9uIHRoYXQgb3IgcGxlYXNlIHNheSBjbGVhcmx5IHRoYXQgd2Ug
YXJlIG5vdCByZWFkeSB5ZXQgdG8gdXNlIGFuDQpBdXRvbWF0aWMgY29kZSBzdHlsZSBjaGVja2Vy
Lg0KDQpDaGVlcnMsDQpMdWNhDQoNCg0K

