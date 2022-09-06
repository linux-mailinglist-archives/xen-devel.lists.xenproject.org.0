Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 863FE5AE0B7
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 09:15:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399459.640637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSnI-00083b-TH; Tue, 06 Sep 2022 07:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399459.640637; Tue, 06 Sep 2022 07:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSnI-00081U-QA; Tue, 06 Sep 2022 07:14:48 +0000
Received: by outflank-mailman (input) for mailman id 399459;
 Tue, 06 Sep 2022 07:14:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YUvx=ZJ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oVSnG-000810-Fx
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 07:14:46 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140057.outbound.protection.outlook.com [40.107.14.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 944cb497-2db3-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 09:14:43 +0200 (CEST)
Received: from FR3P281CA0177.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a0::14)
 by PAVPR08MB9746.eurprd08.prod.outlook.com (2603:10a6:102:31d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.16; Tue, 6 Sep
 2022 07:14:37 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a0:cafe::81) by FR3P281CA0177.outlook.office365.com
 (2603:10a6:d10:a0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.5 via Frontend
 Transport; Tue, 6 Sep 2022 07:14:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Tue, 6 Sep 2022 07:14:37 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Tue, 06 Sep 2022 07:14:36 +0000
Received: from cabb236e4cb8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2FD77009-0C8E-435E-9742-5B1AB8A7988E.1; 
 Tue, 06 Sep 2022 07:14:27 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cabb236e4cb8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Sep 2022 07:14:27 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by AS2PR08MB9000.eurprd08.prod.outlook.com (2603:10a6:20b:5fd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 07:14:24 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::9c00:1efb:1e42:3b20]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::9c00:1efb:1e42:3b20%7]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 07:14:24 +0000
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
X-Inumbo-ID: 944cb497-2db3-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ekk0TnT6eZ8s6M+NTeLW6Hzon8Lid4zDQfAJfOceKFPypOxJrSUUCC4SdukxWuTj3dXzUugPR+WyfSCs7T6G8p1pBZQdeErxxNa4IF7Lon2X/193BnBbigU0zXx1uddgx2Cz9XI9VOugP1hYs/qRGg4c4KzXEd7fKbM3vyKw7JuVXGkhsmEQHX4UyVuCICeMB0ocnPDavhAug9SEzXkD78kFNRQDnwDyaupLVV5fB61+ZnKfA7vhwSNhr89puSEYShUPqi7MtEeM0kv0/Ns+TtCiZhQa2n/0tnIsbFPqGVqIv/3QNpnmpoZVgb2Ihm8qkzWHzbVdF4flsAWKIRH/nA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7SYwP74Mbd5KJGLOVL+JMRE8GAuoLm9NruCqdPOXZw=;
 b=YiSU2NHF4bbNXulJOhRA9hxOhntR1xAo3OJ0MdHA9EasaKqQZTRoL+YEYKz++fdrNyPNOx/bZye8lMRsGnZDjZOegBseLYdqFvxoddq4NqiFrgW9xFjpkYnIr7guFC2RjGIOkZ+Gc/U7UWMd5fvYhJqKv994k5oHCnzPRs0ISirrfMpkBjdllnCLu3Lp9nDBbyeYgCZAHdYfaq737eZd2e91Gl03PM4zpOv+1m1Y3N9maduDSWxgtvDVrClujLNx/kah5kp41F75gKLKLv+X0K2Q08YV6p+YlFAGIV+5qsg8b8d14C9oetIKcUSC9Y3KLkJqD43KcUv7As/cxO2+QQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7SYwP74Mbd5KJGLOVL+JMRE8GAuoLm9NruCqdPOXZw=;
 b=KAUZyAEBEMiPHEWsrJkGntemrmTeAuWmEPw0kdGabotSF2RZwUllMXPbgfmmzDoAEGAUw4qdk88d1gP+cvsr6DG+7iR2ek1fAofs4k/BxQx+0futmcIh37lkXrEWwnyts0vty7yS4oO7J4RQ6YSGxXI/n0Yq+wvw9ORuU5t0fo8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvbI79a/q82Yee9yA7ED0p4LmdQaNZiUOxUwQ+2bNnayIrx9nd1jPBEk9BNjFUISbvtmrPB58WVd9zP6PtB+4qh6tuHMW8RZYtyqJcPlxHGjbodTfehn3LeMLGfvNU6UbkhKZDvGrOqd+ZKTiSiXfWhTb9hYEY7FxmRyj6e5HIs5z2k810cSa40QFwePX9mBcgIIp0MMiS8tsBhcw2oRc5KKGf84VvKfkc9xP64IrZwnOqB08eNI0WrXHjfaBVM6Hot0zajyO8YLgll09dxy7cgftkaQU/JDQqa8L/PuBXwHYArf5AOe8BJM7hkGXMS/fE2HsmVDsXhzMNBzjcPwdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7SYwP74Mbd5KJGLOVL+JMRE8GAuoLm9NruCqdPOXZw=;
 b=jJlXP2hnP5t0FBxTAcwNtnn5gv6P7KJiplEgAMWH0ZnSNg2w7DAm2W1LmFpMZuVi4gqHG8QgdVSkPcjB2hfBOT8tE5cQnYd58pbrajNMek1JLwe7fwAEJuQTq2/HJjC0TCoLIasezDipMgVXz8dooyhbVPDKkqw78IKp8ICpUhYYm2SsSJRbWH+r5ThxL0t794BJ8pO4sP/o9swM9RQpO4hNV1nhoqJfH1duBY/CxNFHtyua1b5wGMI3Q74f7wTXYgAcOSBa7Z5Pyqs6VpQNiyXS8xOVhcpU1YemQFRfPJUvYXCXtb1HLZuwZSWyhrI1K6IJGRm+AYceodnOweLBKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7SYwP74Mbd5KJGLOVL+JMRE8GAuoLm9NruCqdPOXZw=;
 b=KAUZyAEBEMiPHEWsrJkGntemrmTeAuWmEPw0kdGabotSF2RZwUllMXPbgfmmzDoAEGAUw4qdk88d1gP+cvsr6DG+7iR2ek1fAofs4k/BxQx+0futmcIh37lkXrEWwnyts0vty7yS4oO7J4RQ6YSGxXI/n0Yq+wvw9ORuU5t0fo8=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v10 8/9] xen: retrieve reserved pages on populate_physmap
Thread-Topic: [PATCH v10 8/9] xen: retrieve reserved pages on populate_physmap
Thread-Index: AQHYsRk4bhBJQxIp9UysK0xEJzOLuK2y32KAgB2pAvCAAYqqgIAABv8g
Date: Tue, 6 Sep 2022 07:14:23 +0000
Message-ID:
 <AM0PR08MB45306AFFC0B5C10807BA6486F77E9@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20220816023658.3551936-1-Penny.Zheng@arm.com>
 <20220816023658.3551936-9-Penny.Zheng@arm.com>
 <691b68f0-db68-b400-5473-558583f8dbc1@suse.com>
 <AM0PR08MB4530A910E43B82D9B5226F42F77F9@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <384fbd22-909a-b56c-9cc2-0765f2498b9e@suse.com>
In-Reply-To: <384fbd22-909a-b56c-9cc2-0765f2498b9e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A2537845717224439E1EB31548070ECE.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 298ba4a4-c61f-4363-ccb2-08da8fd77533
x-ms-traffictypediagnostic:
	AS2PR08MB9000:EE_|VE1EUR03FT009:EE_|PAVPR08MB9746:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uDH0D63JtieH3Y+z1/ea0vrFrTJWuSsQMxhRf/r/2+hASqc+yva/YUOAI9ywVOiqHhA4yXmueWncgqT/kcp3teq/gMxd0vmfMRj1bOgdC2nfpzw6KWAvKkLJndW8/3eEDNPl5NjUE/aUyan2sf7k2wsWMl1w5kYe5BSIcdcNH5JT+VSa2bqewWe3S3wxiq/B/wi8tP+xf2XA0neGYDrE4yMzBsoHbm+mecqqARS+FfoRUKJhVAH6tQ/LjZpYh1rPwBzY6F6n9OT0tZgClg8pRbcfHE3uMYsN/xUHmyHRdyHAAqgYIJC7oC7p5+AiSsCLDWzgOKOj+YGe3gYqcSOm8alAAf83OBNAb2W8wXP4DmwIXIGqOuz0d6bdmTXbii5Ob6U4Lhz9TzrMxgQjADbxeSheIHLG7cnOOYLHHGRvsNqmpudPKYKjY30HT9/U/LSnzWiQJvofCoE/oZxcUhKiLySrj64b1EZLNO8MdJad1g02t//xOvCb1JelsGzqCfQetUltCp3AGC5UGIogFSMxV0xXARQi6mhnTd065TsYlTg6JxPX3Xy5lS6t3v0Xxrj1nY59KqQ4xb/GPZJfAmbnU6H2al4uo/beRHfAYTBLZIzRiW8pfRWBl7VWr2sHE81KqUGWC6fQspuzgnDAgsBgDsvfwkLiX1BtWizcky67YEh0/BnXqp1W5+yQEXmNmrbLThrPGcub3Ac11SL4NgMCggwWH7+KI613hDAFbBbWqyvvNs/piDjAM1tS+mOqVJEDoqwvV+Ec5fTw/V3Az/kqIQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(53546011)(55016003)(7696005)(54906003)(316002)(86362001)(478600001)(26005)(38100700002)(6916009)(122000001)(41300700001)(6506007)(4326008)(38070700005)(186003)(71200400001)(66556008)(9686003)(66446008)(83380400001)(8676002)(66476007)(64756008)(52536014)(66946007)(2906002)(5660300002)(33656002)(8936002)(76116006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9000
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a3e5a74d-8921-4366-1e0d-08da8fd76d38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Di8sfGpSvd20uFBtRnWam5rJoArIrKfsowg6jVJhug3WT6Mcz/RG5l6hF6++dOyshhxh9WJNO/lFtfFzqzAQT/MCvi1CG0LH1IVnyQA5eqlYvr7Erp0DZ4uHtzJSBFVYQajrrpy9pgF+oL9Bmh9xFzxb8l0HROve5HHVnLGYO8z4Lq2WstHkXOrD+hKUfigbbvCXDAvijQbnwzg+T7bGL5ZgORgd8UdhHrbSHEBUZL04eCGWs7ZB24o3fmdVzH9XuBOpjRgo+YYLYl19k6y/B0DUDCn8iwF0ZyEdRsKb6gOSFzfCyqXzTc5eERqbKkSQWoKhww/OFgy4jfEnh64UphjN4V/w7NTxt+isT6I+07Z1mX3tzew7vPUCP6EadpwweSOFkoYpJ/hFg/vHPyv/7t1xyXnMSlmBcW62k6WnjBydAVGmeRw2Jl3Y/ONDWCc+LLwp4lTn/p5KvTHAetJl9hVt4gSK1wIf2lXqhKYgEp/ybx2Krj1836CZGxkFulobvXU9IoIwfnAe2R1M7l9hedpST6uY9SYXGaZHoT525lL0VAZmUKUanC0JB8s6eUzI9lHKtdDlCrZMbUFk0BxIu0TfJkccT+EaIXZgM7jT19zQdAhTVm5m0sYSm+9fw3vgr17PwtOxdRhXCgtxNp8YwHcgo+yEDup8VupjtLrrqunFb8xqbG4NlWHawhRG3xIL6IIdqnLk2RzifyN8GL1vGY5EUFAceRFIjD76ldB3b91WKMmm0lLZwzJPU2Bsd+JAz+7ONGJbwdpjGxArhQOtqQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(136003)(346002)(46966006)(36840700001)(40470700004)(47076005)(83380400001)(4326008)(54906003)(8676002)(70206006)(82310400005)(316002)(9686003)(33656002)(86362001)(70586007)(186003)(336012)(26005)(40480700001)(81166007)(2906002)(52536014)(356005)(55016003)(6862004)(8936002)(5660300002)(53546011)(478600001)(41300700001)(82740400003)(6506007)(7696005)(40460700003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 07:14:37.2009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 298ba4a4-c61f-4363-ccb2-08da8fd77533
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9746

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgNiwgMjAy
MiAyOjM0IFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT4NCj4gQ2M6
IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNv
bT47DQo+IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Ow0KPiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEwIDgvOV0g
eGVuOiByZXRyaWV2ZSByZXNlcnZlZCBwYWdlcyBvbg0KPiBwb3B1bGF0ZV9waHlzbWFwDQo+IA0K
PiBPbiAwNS4wOS4yMDIyIDA5OjA4LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBIaSBqYW4NCj4g
Pg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IFNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDE3LCAy
MDIyIDY6MDUgUE0NCj4gPj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0K
PiA+PiBDYzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBBbmRyZXcgQ29vcGVyDQo+ID4+
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcA0KPiA+PiA8Z2Vvcmdl
LmR1bmxhcEBjaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFN0ZWZh
bm8NCj4gPj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFdlaSBMaXUgPHds
QHhlbi5vcmc+Ow0KPiA+PiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gPj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MTAgOC85XSB4ZW46IHJldHJpZXZlIHJlc2VydmVkIHBhZ2VzIG9u
DQo+ID4+IHBvcHVsYXRlX3BoeXNtYXANCj4gPj4NCj4gPj4gT24gMTYuMDguMjAyMiAwNDozNiwg
UGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+PiBAQCAtMjg2Nyw2ICsyODU0LDYxIEBAIGludCBfX2lu
aXQgYWNxdWlyZV9kb21zdGF0aWNfcGFnZXMoc3RydWN0DQo+ID4+PiBkb21haW4gKmQsIG1mbl90
IHNtZm4sDQo+ID4+Pg0KPiA+Pj4gICAgICByZXR1cm4gMDsNCj4gPj4+ICB9DQo+ID4+PiArDQo+
ID4+PiArLyoNCj4gPj4+ICsgKiBBY3F1aXJlIG5yX21mbnMgY29udGlndW91cyBwYWdlcywgc3Rh
cnRpbmcgYXQgI3NtZm4sIG9mIHN0YXRpYw0KPiA+Pj4gK21lbW9yeSwNCj4gPj4+ICsgKiB0aGVu
IGFzc2lnbiB0aGVtIHRvIG9uZSBzcGVjaWZpYyBkb21haW4gI2QuDQo+ID4+PiArICovDQo+ID4+
PiAraW50IF9faW5pdCBhY3F1aXJlX2RvbXN0YXRpY19wYWdlcyhzdHJ1Y3QgZG9tYWluICpkLCBt
Zm5fdCBzbWZuLA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgaW50IG5yX21mbnMsIHVuc2lnbmVkDQo+ID4+PiAraW50DQo+ID4+PiArbWVtZmxhZ3Mp
IHsNCj4gPj4+ICsgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGc7DQo+ID4+PiArDQo+ID4+PiArICAg
IEFTU0VSVF9BTExPQ19DT05URVhUKCk7DQo+ID4+PiArDQo+ID4+PiArICAgIHBnID0gYWNxdWly
ZV9zdGF0aWNtZW1fcGFnZXMoc21mbiwgbnJfbWZucywgbWVtZmxhZ3MpOw0KPiA+Pj4gKyAgICBp
ZiAoICFwZyApDQo+ID4+PiArICAgICAgICByZXR1cm4gLUVOT0VOVDsNCj4gPj4+ICsNCj4gPj4+
ICsgICAgaWYgKCBhc3NpZ25fZG9tc3RhdGljX3BhZ2VzKGQsIHBnLCBucl9tZm5zLCBtZW1mbGFn
cykgKQ0KPiA+Pj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4+PiArDQo+ID4+PiArICAg
IHJldHVybiAwOw0KPiA+Pj4gK30NCj4gPj4+ICsNCj4gPj4+ICsvKg0KPiA+Pj4gKyAqIEFjcXVp
cmUgYSBwYWdlIGZyb20gcmVzZXJ2ZWQgcGFnZSBsaXN0KHJlc3ZfcGFnZV9saXN0KSwgd2hlbg0K
PiA+Pj4gK3BvcHVsYXRpbmcNCj4gPj4+ICsgKiBtZW1vcnkgZm9yIHN0YXRpYyBkb21haW4gb24g
cnVudGltZS4NCj4gPj4+ICsgKi8NCj4gPj4+ICttZm5fdCBhY3F1aXJlX3Jlc2VydmVkX3BhZ2Uo
c3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50DQo+ID4+PiArbWVtZmxhZ3MpIHsNCj4gPj4+
ICsgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZTsNCj4gPj4+ICsNCj4gPj4+ICsgICAgQVNTRVJU
X0FMTE9DX0NPTlRFWFQoKTsNCj4gPj4+ICsNCj4gPj4+ICsgICAgLyogQWNxdWlyZSBhIHBhZ2Ug
ZnJvbSByZXNlcnZlZCBwYWdlIGxpc3QocmVzdl9wYWdlX2xpc3QpLiAqLw0KPiA+Pj4gKyAgICBz
cGluX2xvY2soJmQtPnBhZ2VfYWxsb2NfbG9jayk7DQo+ID4+PiArICAgIHBhZ2UgPSBwYWdlX2xp
c3RfcmVtb3ZlX2hlYWQoJmQtPnJlc3ZfcGFnZV9saXN0KTsNCj4gPj4+ICsgICAgc3Bpbl91bmxv
Y2soJmQtPnBhZ2VfYWxsb2NfbG9jayk7DQo+ID4+PiArICAgIGlmICggdW5saWtlbHkoIXBhZ2Up
ICkNCj4gPj4+ICsgICAgICAgIHJldHVybiBJTlZBTElEX01GTjsNCj4gPj4+ICsNCj4gPj4+ICsg
ICAgaWYgKCAhcHJlcGFyZV9zdGF0aWNtZW1fcGFnZXMocGFnZSwgMSwgbWVtZmxhZ3MpICkNCj4g
Pj4+ICsgICAgICAgIGdvdG8gZmFpbDsNCj4gPj4+ICsNCj4gPj4+ICsgICAgaWYgKCBhc3NpZ25f
ZG9tc3RhdGljX3BhZ2VzKGQsIHBhZ2UsIDEsIG1lbWZsYWdzKSApDQo+ID4+PiArICAgICAgICBn
b3RvIGZhaWxfYXNzaWduOw0KPiA+Pj4gKw0KPiA+Pj4gKyAgICByZXR1cm4gcGFnZV90b19tZm4o
cGFnZSk7DQo+ID4+PiArDQo+ID4+PiArIGZhaWxfYXNzaWduOg0KPiA+Pj4gKyAgICBmcmVlX3N0
YXRpY21lbV9wYWdlcyhwYWdlLCAxLCBtZW1mbGFncyAmIE1FTUZfbm9fc2NydWIpOw0KPiA+Pg0K
PiA+PiBEb2Vzbid0IHRoaXMgbmVlZCB0byBiZSAhKG1lbWZsYWdzICYgTUVNRl9ub19zY3J1Yik/
IEFuZCB0aGVuIC0gd2l0aA0KPiA+DQo+ID4gSSBnb3QgYSBiaXQgY29uZnVzZWQgYWJvdXQgdGhp
cyBmbGFnIE1FTUZfbm9fc2NydWIsIGRvZXMgaXQgbWVhbiBubw0KPiA+IG5lZWQgdG8gc2NydWI/
DQo+IA0KPiBZZXMsIGFzIGl0cyBuYW1lIHNheXMuDQo+IA0KPiA+IFNpbmNlIEkgc2F3IHRoYXQg
aW4gYWxsb2NfZG9taGVhcF9wYWdlcyguLi4pDQo+ID4gICAgIGlmICggYXNzaWduX3BhZ2UocGcs
IG9yZGVyLCBkLCBtZW1mbGFncykgKQ0KPiA+ICAgICB7DQo+ID4gICAgICAgICBmcmVlX2hlYXBf
cGFnZXMocGcsIG9yZGVyLCBtZW1mbGFncyAmIE1FTUZfbm9fc2NydWIpOw0KPiA+ICAgICAgICAg
cmV0dXJuIE5VTEw7DQo+ID4gICAgIH0NCj4gPiBJdCBkb2Vzbid0IGNvbnRhaW4gZXhjbGFtYXRp
b24gbWFyayB0b28uLi4NCj4gDQo+IEhtbSwgeW91J3JlIHJpZ2h0IC0gb24gdGhlc2UgZXJyb3Ig
cGF0aHMgdGhlIHNjcnViYmluZyBpcyBuZWVkZWQgaWYgdGhlIHBhZ2UNCj4gd2Fzbid0IHByZXZp
b3VzbHkgc2NydWJiZWQsIGFzIHBhcnQgb2YgdGhlIHNldCBvZiBwYWdlcyBtYXkgaGF2ZSBiZWVu
DQo+IHRyYW5zaWVudGx5IGV4cG9zZWQgdG8gdGhlIGd1ZXN0IChhbmQgYnkgZ3Vlc3NpbmcgaXQg
bWF5IGhhdmUgYmVlbiBhYmxlIHRvDQo+IGFjdHVhbGx5IGFjY2VzcyB0aGUgcGFnZXM7IEknbSBp
bmNsaW5lZCB0byBzYXkgaXQncyBpdHMgb3duIGZhdWx0IHRob3VnaCBpZiB0aGF0DQo+IHdheSBp
bmZvcm1hdGlvbiBpcyBiZWluZyBsZWFrZWQpLg0KPiANCg0KVGhlbiwgdGhlIHNhbWUgZm9yIHRo
ZSBhY3F1aXJlX2RvbXN0YXRpY19wYWdlcyguLi4pDQoNCiAgICBpZiAoIGFzc2lnbl9wYWdlcyhw
ZywgbnJfbWZucywgZCwgbWVtZmxhZ3MpICkNCiAgICB7DQogICAgICAgIGZyZWVfc3RhdGljbWVt
X3BhZ2VzKHBnLCBucl9tZm5zLCBtZW1mbGFncyAmIE1FTUZfbm9fc2NydWIpOw0KICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsNCiAgICB9DQpPbiB0aGlzIGVycm9yIHBhdGgsIGl0IGhhcyBtaXN1c2Vk
IHRoZSBNRU1GX25vX3NjcnViIHRvby4NCkJ1dCBJTU8sIGFzIHdlIGFyZSB0YWxraW5nIGFib3V0
IHRoZXNlIHBhZ2VzIHdpbGwgYWx3YXlzIGJlIHJlc2VydmVkIHRvIHRoZSBndWVzdCwNCm1heWJl
IGhlcmUgaXQgYWxzbyBkb2Vzbid0IG5lZWQgc2NydWJiaW5nIGF0IGFsbD8NCiANCj4gQnV0IC4u
Lg0KPiANCj4gPj4gYXNzaWdubWVudCBoYXZpbmcgZmFpbGVkIGFuZCB3aXRoIGl0IGJlaW5nIGp1
c3QgYSBzaW5nbGUgcGFnZSB3ZSdyZQ0KPiA+PiB0YWxraW5nIGFib3V0LCB0aGUgcGFnZSB3YXMg
bm90IGV4cG9zZWQgdG8gdGhlIGd1ZXN0IGF0IGFueSBwb2ludA0KPiA+PiBhZmFpY3QuIFNvIEkg
ZG9uJ3Qgc2VlIHRoZSBuZWVkIGZvciBzY3J1YmJpbmcgaW4gdGhlIGZpcnN0IHBsYWNlLg0KPiAN
Cj4gd2hpbGUgbXkgY29tbWVudCB3YXNuJ3QgcmVhbGx5IGNvcnJlY3QsIGFzIHNhaWQgLSB5b3Ug
ZG9uJ3QgbmVlZCBhbnkNCj4gc2NydWJiaW5nIGhlcmUgYXQgYWxsLCBJIHRoaW5rLg0KPiANCj4g
SmFuDQo=

