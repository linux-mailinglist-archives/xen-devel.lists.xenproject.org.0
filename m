Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7864E5B34C0
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 12:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404109.646446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWany-0005be-Iz; Fri, 09 Sep 2022 10:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404109.646446; Fri, 09 Sep 2022 10:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWany-0005Yg-ED; Fri, 09 Sep 2022 10:00:10 +0000
Received: by outflank-mailman (input) for mailman id 404109;
 Fri, 09 Sep 2022 10:00:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xTTi=ZM=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oWanx-0005YY-7H
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 10:00:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f442cee-3026-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 12:00:08 +0200 (CEST)
Received: from AM5PR0202CA0012.eurprd02.prod.outlook.com
 (2603:10a6:203:69::22) by GV1PR08MB7914.eurprd08.prod.outlook.com
 (2603:10a6:150:8e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Fri, 9 Sep
 2022 10:00:05 +0000
Received: from AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::c8) by AM5PR0202CA0012.outlook.office365.com
 (2603:10a6:203:69::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19 via Frontend
 Transport; Fri, 9 Sep 2022 10:00:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT015.mail.protection.outlook.com (100.127.140.173) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 10:00:05 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Fri, 09 Sep 2022 10:00:04 +0000
Received: from cdbf9fef72a2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D5AD421A-3083-468D-9C66-E258589EEDCA.1; 
 Fri, 09 Sep 2022 09:59:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cdbf9fef72a2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Sep 2022 09:59:58 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB9449.eurprd08.prod.outlook.com (2603:10a6:20b:5eb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Fri, 9 Sep
 2022 09:59:56 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Fri, 9 Sep 2022
 09:59:56 +0000
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
X-Inumbo-ID: 2f442cee-3026-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aO8VPYdogem1hXob61gmQIXyJYLtrc1qy3T7yhALq84yMpIk1Xs5L/WaCYxZouPOvn9hidZweL0UWeSAXwWm65okeVpAjZP45u8v3ziz67gYLY33J+IXsYkADw0eppj1ZptG7nkZdQeqKAa/xnc26Li5Eyeyd3l0OVYHwUL7meUYPuus+gSJg6HzqBL/InYX6OOqsQgbU1eqecWj4DkTugEWnovTDKT3EQMm95DS7jrN3bOKCiYKrQBJHCkISSJBlb7rtPIOUpyOKZT7fOH82ib1X+4n7YF1Ot1JbJWI5zxi7MqmFVde2Q570JlQeB6aEBsVR+cfQBfgwm8F82qJyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bw6YUkUYBAQIziCSp+7mB4Ve7T4KL+lB6q7LdPGfaY=;
 b=ADjpc332bwQTSTYMhebyBsJZX3UFUHjrr0RoPSmtSXjfaxUwUQ07DsbtSfRvZw8kxwSdtwvjs+oNFbiYklniV60wsNnE+9EAeHBeOGIXr0ZI5Uwi5B5A8jmmrpLx6eklcuUcFrE/uqF2GI+Mo5+famDkoZvh9rRDEmrRZZBPwZ+f9QOmi1ZY01GwUM7AxFFcTEL92ryQbwWMHlcxQ4ovbdYh+pIn7qS8f19Od58jcj+Sj67YcCfU31Rhvf577CtipfNbrecd5URFX0XUrRWb5MitOlx9EZVWdLy8od/LD/z4RP7WOTE7kGlqHoXc/wAMbUZ5zXI0FWgFSqDqJ5IRHQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bw6YUkUYBAQIziCSp+7mB4Ve7T4KL+lB6q7LdPGfaY=;
 b=uZRxghMtMJCrY1kPY04Yka47sFXYrM8g0nJCglfsYZg4wK3CUEZgeYT4tM5P0FYwzruRILf8mC/uHRQ42mnm0WPU8K7nzy8dSH6+fgYnceOrZPLbgCyk/QM/QNOSk9a/1BNMdHaaMRc2Sk7sMIAZIlj9fX7q2cFR35B3VSvSu70=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7cCrw0UV3gt0rc0jzUp3GnVwcuHR+quMUMSa+DJRPfZJMl9fWVJojdtj9Hse5uQOzkm+ezf9uepj9oq3/J+MsuX7tya8hTGGuQzYshprUnzedY29zey2+0+p4FN2Nw+3Ce972n+Cr7ZgayvkYQgZjB8iiTTr6UVBXbLvpr2wEvzwq3KMQifQaZdfbXLBUkzlGllzPjqszoHVRIllUC+ptsGmD/4S2K5yTygQfshdvupcCwpIhNC6OT71JJDo+d8bbfiYnf7EQLsEQpuat2XLKWZBgjZX5WZej83JUXjgwIKj9MSZ0Ln9XWFu+XS5lCq8mXRaETITwQfL4mQvDZONw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bw6YUkUYBAQIziCSp+7mB4Ve7T4KL+lB6q7LdPGfaY=;
 b=PKAV7ywXDk3c9Aw+ClK0b6a9T658f/Bsb8Vl4dLZql0j9AoOAmrEP3Nq4EWTPlGXvQCqfpTx+0pRpFNnGfbPs/LaABGTCgHW6u1+6DjM/1kS5M3Y8n3rdUYMYp2dhUWZVvto1/8kjS4UysaBCODJyatJbG6kjG9xHDfP0v2P9NViJTZol0M6nQ//wgRzPTDqR4jjoFaSqixgGyrZgXJiM2jOaeHnhLhDnh4TdoYmvZ4V+o+Z9yQWm5M90O9hs4qiEZUsZrkbwrJlRM0B0kX8/AwE6SyFyUrSeq8clZakWbP+76DZETQgkM9esbgimk4ncgZ9SflYObGiVeOjknXdrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bw6YUkUYBAQIziCSp+7mB4Ve7T4KL+lB6q7LdPGfaY=;
 b=uZRxghMtMJCrY1kPY04Yka47sFXYrM8g0nJCglfsYZg4wK3CUEZgeYT4tM5P0FYwzruRILf8mC/uHRQ42mnm0WPU8K7nzy8dSH6+fgYnceOrZPLbgCyk/QM/QNOSk9a/1BNMdHaaMRc2Sk7sMIAZIlj9fX7q2cFR35B3VSvSu70=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Juergen
 Gross <jgross@suse.com>
Subject: RE: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
Thread-Topic: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
Thread-Index: AQHYxCOLeMow4nnAdEmRQz42iuSBI63W0QoAgAADAYCAAABeMIAACGOAgAAAOWA=
Date: Fri, 9 Sep 2022 09:59:56 +0000
Message-ID:
 <AS8PR08MB7991F3041237E2766F9DA30592439@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220909080944.28559-1-jgross@suse.com>
 <52ff1228-3092-c455-479d-315a16cfaaa6@suse.com>
 <77d2c3fa-7cee-6f86-215a-a95ce242a990@suse.com>
 <AS8PR08MB7991390DCD341CF688FDB0E892439@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <d63aff2d-8cc5-800c-66d5-9cfd4539e431@suse.com>
In-Reply-To: <d63aff2d-8cc5-800c-66d5-9cfd4539e431@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C463E96D54EC5848AEE062A4617425AB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5298ad59-8c75-4379-028f-08da924a11ed
x-ms-traffictypediagnostic:
	AS2PR08MB9449:EE_|AM7EUR03FT015:EE_|GV1PR08MB7914:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qKW3o7IpVdhRC+a2NEqBcT0iz21qzzB1SFWNblLnIYvJHQvY4o5wEKvXmvoJv/7AQBZ7jTDXNyPxFTBC+HEqu7T7cyekBiTHf5/NlwL3BxBDToABhNDP0trKrNMJXk8F0tPwB1Df56C+CCjGberIqBNBA1Gob1DljFPvhmT7LBoG+DLIK00iKDi3Pht8++iSK9FRghfA6KY8PnScIcxGeIQzJ6JdigyHMr1WaX31m25dRnYDyvOkoAgnfZNOxr5ITmyhvYegUbGRkXMK/inkJZHZJ4i8DKE37PGTEZDLhwRzmbBarEL6MPJOTFqUMKnIubMw+Vytv8YNWyL9V07giTsgBhbtma8XITMO1sbN4jmVvdiRhJygVmBSnLVNJeFbA58/CKVic/TEUwuJCVHbShnKS99CY2FMYMa1M++P99A/nGi+VZgkU9Rzw0k0ydsTIdc5XBeWqzjFTHh8XkbAUHcrERNADeWepGKSZIUSUfSm/dTHIwgNec/yaNcmcMGkxR4ULuvYz5f6HS6uyNQsXGrt6jD3HrGRNWp72S1rxB7OKmPpMX3wNR5p7C8bZguQGgDRRNljmQ9rzF1iR92tK0y0y+k+v3ZOQ1JgLt/Xqf6VAS2tgsIT6dHKoMsFZxCQ15jzExkHbPePrV35TGSCfh8nDU4TQ40QmuHS7O2JmsngKkoUOuJioy0U3zE/xlm/uYEE+2buByMLefe63HJXxkwpusJpN0hehx30nskg2GsLPUj2Vwf1SsQVvd122p8riVpWwCzSGQVPd/MOXNJKkQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(38100700002)(76116006)(316002)(4326008)(33656002)(64756008)(8676002)(45080400002)(66946007)(66556008)(66446008)(122000001)(66476007)(86362001)(38070700005)(53546011)(83380400001)(478600001)(7696005)(71200400001)(41300700001)(6506007)(26005)(186003)(54906003)(6916009)(55016003)(8936002)(2906002)(9686003)(4744005)(5660300002)(52536014);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9449
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	06daff31-74f1-45eb-c7a8-08da924a0ce3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jj6bPYamXhWrHqRSqdu3xpDE/sxL4dY0VPgU5J5FpoFw7lHF6/0B0m1dJud580gn3CoLC98wJMemlBd2a+s81f9RIWKwJQTMbRIKe/BXPKgOOJ+/zGdIYwhh+fdfRR4J/vVuM79KR0G6ZiucGjUD1QdqlPfMY687K5AlZZBw0Xvvsmvctr577vVJZ7LgF7WGACFkoCGD6J432fYeN20Of43SrgscYORExn65aGcix6zlWtVnmzcbw0iu0aVpSB1HmJPrjuCnVjQndLHIAW944R/QfuAlu49cFsQtslw4LSyvoaW8jo4xevzPuXqVrI44B3BfsXDlPuiiY2ZqZZhHGeMQ9epPK+W8e1YJRBcGHszfdkPHEmjFHp6DRT2e7IHW1v4aDy6I4f7HAiDdDYrz8rnYLbrCBiRNmJekAJIlWkG5k1VQGiW0jiziK8656YKEa2N1tSCAiKgup54DcMBPmq/shncOFzcrTkHc9l1xaRx3/N66XbNRuR5TBUaHCK5bPx4KBv/dRyTnam5oYxBk1ga/FujWMGUoqM0MYyQG8t2K1EofI/6jDptbuLukzyWllDsoU5wARNq2SF94+bR3Xf8N+dzN2mKeSuly5rfFfn959VvutmC1agRcgD20l2hm943w4AI5TZPzAwCQdOxaNUnYURSyOOTfWjKQSqZfcy0HCJkNH+dFBBABHWrhFM6NPgCItVHnT3R7D6rmOnuwjun38AvYPnfX0W/5vbn4WR9iw5a//nVyikak3ACEGusm68ammZvBAnm1HuOAfsZ8JQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(376002)(136003)(40470700004)(46966006)(36840700001)(478600001)(83380400001)(186003)(9686003)(53546011)(55016003)(26005)(336012)(47076005)(6506007)(41300700001)(86362001)(36860700001)(82310400005)(7696005)(107886003)(40480700001)(52536014)(356005)(8676002)(33656002)(4326008)(8936002)(40460700003)(81166007)(6862004)(2906002)(70206006)(82740400003)(5660300002)(45080400002)(70586007)(4744005)(316002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 10:00:05.1702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5298ad59-8c75-4379-028f-08da924a11ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7914

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IE9uIDA5LjA5LjIwMjIg
MTE6MjgsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+ID4NCj4gPg0KPiA+IEtpbmQgcmVnYXJkcywNCj4g
PiBIZW5yeQ0KPiANCj4gSG1tLCBkaWQgeW91IG1lYW4gdG8gYWN0dWFsbHkgYWRkIHNvbWUgdGV4
dCBpbiB5b3VyIG1lc3NhZ2U/DQoNCkkgYW0gcmVhbGx5IHNvcnJ5LCBteSBvdXRsb29rIGp1c3Qg
Z290IGZyb3plbiBhbmQgSSBtdXN0IG1pcy1zZW5kIGFuDQplbXB0eSBlbWFpbCBzb21laG93LiBO
byBub3RoaW5nIGZyb20gbXkgc2lkZS4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4g
SmFuDQo=

