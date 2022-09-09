Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0439D5B381A
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 14:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404301.646728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWdOb-00057F-KU; Fri, 09 Sep 2022 12:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404301.646728; Fri, 09 Sep 2022 12:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWdOb-00054S-Hi; Fri, 09 Sep 2022 12:46:09 +0000
Received: by outflank-mailman (input) for mailman id 404301;
 Fri, 09 Sep 2022 12:46:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xTTi=ZM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oWdOa-00054M-Cz
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 12:46:08 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2081.outbound.protection.outlook.com [40.107.105.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e8ced8b-303d-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 14:46:05 +0200 (CEST)
Received: from DB6PR07CA0060.eurprd07.prod.outlook.com (2603:10a6:6:2a::22) by
 AS4PR08MB8244.eurprd08.prod.outlook.com (2603:10a6:20b:51d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 9 Sep
 2022 12:46:03 +0000
Received: from DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::79) by DB6PR07CA0060.outlook.office365.com
 (2603:10a6:6:2a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.7 via Frontend
 Transport; Fri, 9 Sep 2022 12:46:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT014.mail.protection.outlook.com (100.127.143.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 12:46:03 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Fri, 09 Sep 2022 12:46:02 +0000
Received: from ba5f86f15cb1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8807125D-B82F-43D7-9A2B-45C568A52E59.1; 
 Fri, 09 Sep 2022 12:45:56 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ba5f86f15cb1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Sep 2022 12:45:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VE1PR08MB5693.eurprd08.prod.outlook.com (2603:10a6:800:1a5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Fri, 9 Sep
 2022 12:45:54 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Fri, 9 Sep 2022
 12:45:54 +0000
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
X-Inumbo-ID: 5e8ced8b-303d-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NWhvXc6uxzwULV8bsvMUH4F9GV+XYTX0zGKPzEUPEVqXZf7EBYyjIeyiYA6aIHTerLv0vd+H93/CnbFUryvndGePLssUJ+5IQJ2vE2RzDaioyEMrYDK8f0q+waMzbjkRmVp53j57xGKczstH0xuIhaqxS2nH4nBZZpDfypFMs/o/827EVZ7QMlAXLJIPq+M+fiz0H4ukqFM8vaHbjxHEgnhldPZLiUKvRC/ppT8KTQAtvxPZ2BijJdxVqqw3agqMNTfjd2J5Hk3V2PysmelQucDy57HgmQcpIc4vrEDq08RuaVfxOYbY4IY9y6P5mD+SFzJJpBQ3QfO8Gzu5KbT8mA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/1kBPCV7YnVAfRM5Yr2pA6ovbc5i62EGWqanErDBdI=;
 b=Bn0MrMc2x5uW4aq4ShGqr6KAnoo1q1cBF9yzfVEDT818/OZoYw/Lth36oRKdeoZM47Qb4orY9knryvzzF5rege3ghpdeJwsX/SwoAf5C4pCAeHwK8rf1NnyzphEl92o2PLzMGaD7oOJ3pkpNgnvRVSeC9huVgeqhhFBMXme68pQapu2+GqJb6NOow+9A/63jgSpyo2tfHiH9zwtgM+oyI9L4diOULyGNxukoWvgt5GycxqLXB4Ciw3+UQVcKWLpl7XA75AyE1EBsJM6MaRzrUYqL2cmropRT8mwCLPAWa593TQqIwS3Wp74sjstpzjyHj/CWi3QDaGziMKaHQByyZg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/1kBPCV7YnVAfRM5Yr2pA6ovbc5i62EGWqanErDBdI=;
 b=BYW3kehakvYU8vpMFKHFht7FiCsD7LffaQbyTZDV2xpC2CJum3EF3UtPFGma5YETf5czDvPBUzSrDvRVAmFELobi5ogaQLFkCKevc84/dpNe5X60LLXDrVnqF6Q4TgLU71GnvTgOKkXOmWazKr+87W0mblzs36velIERRtQCq6Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=haQvBckKCc2wahboUWH9GWVeEwkVT68e2/R1dZWp+vkjImUMJpqsis/jpNTobgvN4fWeVpPB4hqh8RGpj8YCgW4bpLXZ0FISbp+ITbSLhsc6JxOV5FMa+joye5hIXWYRycRd4q+U1LuvceGpdfGr2hqIiysoMvKIrqS44D0K2umhmx+xe/9N2VemTNOxRVkY6A2pQpttfrwSoAkBkpucc7lzOfLsDwGx0VVYi+CW0cjB+WgsdJ75c6AdX2Mlmv3URxG3shhE3eAjKsQVZobhG1YjMgUAAuq9mmh9gz+NoXFMVdpImKn3IP9VUIc649lX/LdXPjClF1niABY69VMgRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/1kBPCV7YnVAfRM5Yr2pA6ovbc5i62EGWqanErDBdI=;
 b=CV8UMEPeYGP1vJiZmEWU8ln6BVY7jk8qAOJK+v0GAJgNe0szYrX39uKwhwBxAknash77I8UEI/bUoTVTr7XxvvxZhJl8cMwVrneC2Imue/BVpqIaPkROf/jP5stAowQfoqyiloICke6yD/sgJfV07/pQL+/Oo6QYHMV2UuPWJQwtUea17o7WKOZWe9T59Ix5+6B8AMsbWYc3xi4HMxsGXAauV5gd5gzfDHBXZHfl/Q9aLLMbkMyFR2SILJI/B7bDjRTtONwzIMxxYMV2UBYweSJlLzsU0eDAPxOPCxXW0pqIIkV3kH91HEtVOwQJBf26L0KfEnGZTIIlY/MqAyJuNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/1kBPCV7YnVAfRM5Yr2pA6ovbc5i62EGWqanErDBdI=;
 b=BYW3kehakvYU8vpMFKHFht7FiCsD7LffaQbyTZDV2xpC2CJum3EF3UtPFGma5YETf5czDvPBUzSrDvRVAmFELobi5ogaQLFkCKevc84/dpNe5X60LLXDrVnqF6Q4TgLU71GnvTgOKkXOmWazKr+87W0mblzs36velIERRtQCq6Q=
From: Henry Wang <Henry.Wang@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jandryuk@gmail.com" <jandryuk@gmail.com>
Subject: RE: [PATCH] xsm/flask: adjust print messages to use %pd
Thread-Topic: [PATCH] xsm/flask: adjust print messages to use %pd
Thread-Index: AQHYxDGm1l2kl9jZnEi0PeM8zmcB0K3W20YggAAhgoCAAAz+wA==
Date: Fri, 9 Sep 2022 12:45:54 +0000
Message-ID:
 <AS8PR08MB7991B21BA960C937DF26C13D92439@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220909095012.4251-1-dpsmith@apertussolutions.com>
 <AS8PR08MB79918FE3B1C08991CFF62A3092439@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <dc4953b1-2975-eeda-6964-f37e1e68e33c@apertussolutions.com>
In-Reply-To: <dc4953b1-2975-eeda-6964-f37e1e68e33c@apertussolutions.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E5B11A8D3677D046A1DCA7536C7AF56E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 684083c7-180c-4797-0c13-08da92614140
x-ms-traffictypediagnostic:
	VE1PR08MB5693:EE_|DBAEUR03FT014:EE_|AS4PR08MB8244:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jIt4FdN4Bvnm8SJ1peHu9qEC2yPFg15g+sU26bJ2tijlq4QXRTtN8kgqB1+4rJhX8JOGemUnMGMg2FYNBuZjRle7vQ2fp0t/9OppETg05vuQU+6EAOq6NlzomlqZgEmYXNIEKz53rXaYj18cTGmiUHoLQ83Yi5QiwluMKLCLAzOYVJTGW/031CLRWlMZ2gnhxqGrYjJHU315XfBJ4cCtj9a3AF3i4htFsLeew3ctx8ToQb1szlSNXlxl7+GGuhkz7RU8UEnPnP/zNOZfGsJQ5cI+gzfU8F6iH2Wot6EJDJS9xWedyIRtExA14ptqessvyGWfLPhFHzJsUp63VG6RAlT55BywCZPfh4NJGvR0ieV5DZlWuOQJykxjlazuJzlM7wiyz0pX23JtqjjEo+X7QlPCaaT6lYntiMXzrptypeLza0bmucFNQyfV2RFKpY+Wgq/92OkmCMm2Cfd4q3C5C5UIqeEAX7jFvj0fJx1T4C1W5WxE1B5gQ5X69JLfX6UJnCngB6CRRVYFhRCz0jDg310SL6nSlq2Wk4ArBwWdZ12cEno3Lk9SVbJqWg1gYE04fQlJkhaBqMITIH5i2OWsAeECQP3VdMojVLb0I8I0W66jmHihH1KT/1KkFB26St9Tnzhp/XtG50gHPf+NusOHCum9r12q2qZQk2om8OO5qnI8ZjcnryNUiflPOx1xlZoCbPqYeN0HfIYsEu75eiu/K7VfztN2JzZEmcEoHk5xyk/sqtW+J9UWOmdgTWGPj8IXf6FTZLD6O9N2SQq8LP0NUg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(9686003)(186003)(7696005)(26005)(71200400001)(6506007)(478600001)(41300700001)(83380400001)(4744005)(15650500001)(2906002)(52536014)(8936002)(5660300002)(110136005)(55016003)(316002)(8676002)(66946007)(64756008)(4326008)(76116006)(66476007)(66446008)(66556008)(38070700005)(122000001)(38100700002)(86362001)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5693
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	08984172-654d-4f2e-ffcd-08da92613c4c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JD2eM2PHRwHl+sM6+i7427o7BrPnCNveuNH6eoEbeqD0JNF3c5hpdhL6PN29CQo4AZgo6V7elOTDRFRcctrKOHmqDsIGImncVd6LPz55vgIEZo4QQlcOHLuFul9d6TJ06jfdZMrPHyyBfcshx1HBgPCVHCGBeGEATiY3NQ1aF64izcv7LHF20B5Kjwp1ts4Ats//GbfYSiQxM8Age9O7+7y1LRrtSqCbB+cM3KBIGAE2uSeAxCZgehneYeo/Eqx0Se0jm79VpI749R7bqKeWnRKje0KyhmJfXRNv+ompIknBYtoEqcf/DHS4UOPbf943oRl/4TRP+jWLscD6jwVxM6fvA9ThJ4GV49tDXFCRhMEqNMJTeULvVTrJ+vRLCkhXpC2+oVlDbSYFjWzMk1P7G3Awt0f34Rqe08xQJnsJzlF0+tvA54JxQ+tuCbX/y/qdbTfOGyLVyxR6nCd07o5/y1ywgPAbaYgfCi/CnVbC+KZIoxqAoMspm6GW320Uk/p8zkkA1jJhLM13mHDtVoM9y8qh3tRrv7XK111Yc+OHdvm/Cr+3VGq/+BfWuQ6HDHZe2aozSDzLPi1ZDRyd72V+ej9zh/gXKNWh6fT5OKEo+BHNzAE9c24YNapru4GKcffX56yW7UDeRwdqjNzXlEsqDNMh8/vvUQe8udDLGNqWyGlI+lUpVnYiumCaBCSm4b0ZtIfadJGeMu9P7WRInUZJzjsrBsGdzkreJ3pPgBff5SraiTY3IdKzrxedrjPGyiUOPLT6OZ+5ec+LZBaIytwvXg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(376002)(39860400002)(40470700004)(36840700001)(46966006)(83380400001)(47076005)(40480700001)(8936002)(5660300002)(52536014)(4744005)(9686003)(41300700001)(15650500001)(55016003)(2906002)(7696005)(33656002)(86362001)(336012)(478600001)(107886003)(26005)(6506007)(356005)(81166007)(82740400003)(36860700001)(186003)(70206006)(4326008)(110136005)(82310400005)(40460700003)(8676002)(70586007)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 12:46:03.0389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 684083c7-180c-4797-0c13-08da92614140
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8244

SGkgRGFuaWVsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IERhbmll
bCBQLiBTbWl0aCA8ZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbT4NCj4gPiBUaGlzIHNob3Vs
ZCBhbHNvIGJlIGZpbmUgdG8gbWVyZ2UgaW4gNC4xNywgYnV0IGZvbGxvd2luZyB0aGUgZGlzY3Vz
c2lvbiB3aXRoDQo+ID4gSnVsaWVuIGFuZCBKYW4gSSB0aGluayBwcm92aWRpbmcgYSBSZWxlYXNl
IGFjayB3b3VsZCBsZWFkIHRvIGNvbmZ1c2lvbi4uLg0KPiANCj4gSSB3YXMgaG9waW5nIGl0IHdv
dWxkIGdvIGluLCBidXQgdW5kZXJzdGFuZCBpZiBpdCBpcyBrZXB0IG91dC4gSSBoYXZlIGENCj4g
bGlzdCBvZiBjbGVhbi11cHMgb2YgdmFyeWluZyBzaXplcyBmb3IgWFNNLCB3aXRoIHRoaXMgb25l
IGFjdHVhbGx5IGJlaW5nDQo+IHJlcXVlc3RlZCBieSBzb21lb25lIGVsc2UuIEkgZmlndXJlZCBp
dCB3YXMgYSBzaW1wbGUgb25lIHRoYXQgY291bGQgYmUNCj4gZG9uZSBxdWlja2x5IGFuZCBtaWdo
dCBiZSB3b3J0aCB0cnlpbmcgdG8gZ2V0IGl0IGludG8gdGhlIHJlbGVhc2UuDQoNClNvcnJ5IEkg
c2hvdWxkIGhhdmUgYmVlbiBtb3JlIGNsZWFyLiBJIGFtIG5vdCBwcm92aWRpbmcgdGhpcyByZWxl
YXNlIGFjaw0KdGFnIGlzIG5vdCBiZWNhdXNlIEkgYW0gYmxvY2tpbmcgdGhpcyBwYXRjaCwgYnV0
IGZvbGxvd2luZyB0aGUgZGlzY3Vzc2lvbg0KdGhlIHJlbGVhc2UgdGFnIGlzIHN1cHBvc2VkIHRv
IHRha2UgZWZmZWN0IGFmdGVyIHRoZSBjb2RlIGZyZWV6ZSAoU2VwLiAzMCkuDQoNCkFzIEkgYmVs
aWV2ZSB5b3UgYXJlIHRoZSBYU00gbWFpbnRhaW5lciBzbyBpZiB0aGlzIHBhdGNoIGFuZCB0aGUg
cmVzdCBvZg0KdGhlIGNsZWFudXAvYnVnZml4IHBhdGNoZXMgY2FuIGJlIHByb3Blcmx5IHJldmll
d2VkLCB0aGVzZSBzaG91bGQgZ28NCmludG8gdGhlIHJlbGVhc2Ugb2YgY291cnNlLg0KDQpLaW5k
IHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiB2L3IsDQo+IGRwcw0K

