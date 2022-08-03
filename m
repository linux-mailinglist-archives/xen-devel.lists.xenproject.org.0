Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A07CE588C76
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 14:55:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379922.613819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJDuA-0006rw-4J; Wed, 03 Aug 2022 12:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379922.613819; Wed, 03 Aug 2022 12:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJDu9-0006os-VT; Wed, 03 Aug 2022 12:55:17 +0000
Received: by outflank-mailman (input) for mailman id 379922;
 Wed, 03 Aug 2022 12:55:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x4Xu=YH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oJDu8-0006om-8K
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 12:55:16 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130055.outbound.protection.outlook.com [40.107.13.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84f590ee-132b-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 14:55:15 +0200 (CEST)
Received: from AM6PR02CA0026.eurprd02.prod.outlook.com (2603:10a6:20b:6e::39)
 by HE1PR0801MB2123.eurprd08.prod.outlook.com (2603:10a6:3:7e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Wed, 3 Aug
 2022 12:55:12 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::4a) by AM6PR02CA0026.outlook.office365.com
 (2603:10a6:20b:6e::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Wed, 3 Aug 2022 12:55:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Wed, 3 Aug 2022 12:55:11 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Wed, 03 Aug 2022 12:55:10 +0000
Received: from e44c616999b9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B4B6EDDA-300A-40C9-B575-3D971039DC17.1; 
 Wed, 03 Aug 2022 12:55:04 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e44c616999b9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 03 Aug 2022 12:55:04 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by HE1PR0802MB2410.eurprd08.prod.outlook.com (2603:10a6:3:dd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Wed, 3 Aug
 2022 12:55:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 12:55:02 +0000
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
X-Inumbo-ID: 84f590ee-132b-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iOKsd61Gt47Si4vcZfDfsA/ZsUUkLPSYmfTdGqKBW+2A0IqLXP845DvHrnqJK8OZbrKvV+ESZs/1J1j+mOHSLF7qlF0OYQccsFJkrJ3wK2+rF9bGaxgn3KijVMYuo3VfmgW5hpEgs3HUUL1UPBV9gA6Xyo/POqp/NUeMNXwAgkLzI5N1MbEza5J74TtBBKUTrScf3Zf8SxZGIOfMsabxbaurTijxH6HCJl0YVrOWwpQBzCzliXfRSbfobtDcLcoJMuPNH90LBsRPX/JbuWW8jhKiCIHOzCJCWA1zSwgz156RzrCBij+HGV1+03guDTGr3zYuH5JG6b2Hcz7yHAdvyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nu8PmLjKmiRku0Kk/7dB2Im4mCKJ76wo9ud2Qrrg42E=;
 b=P0OhJlXXDjW1+FrC+R39UwEfhp6PYtCfmkHy+yUHYBN4ixHcBGKcuzPVHvxXmeZFLGZPYliP5QrrmI6mhKpi8+UJkoWYvsovc6gERVFPg6+ggX/j4LmBmdsPqf4vBHZI5b/lHKYTbVZ/QKgqS1snM/YqS7JZbO7irn6bjmJhxDuhkaTlwdFoWQY3h6sQ8NC8unm+sJ2WNOWbUjQQ3XM5nGMXAfkE0TK6PLU0Ea4iTvvm0rWN9LTVLke7ZI03s7mNA+Mu90OdOqOWF0zDM4yZbr4T3QNvg46AKxf/C6V4yL74QlerE4fW/gh+0DHf2GYyDWQZcKbF2zmt0GKxLeTWfQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nu8PmLjKmiRku0Kk/7dB2Im4mCKJ76wo9ud2Qrrg42E=;
 b=UGIU5k9aKMpdj6VRhTIv+qdRRzBtRS84nPp3d3y9vx8Vfa94Tuowqr92IyRrM0zKgZJ9HXzH7yfPXEitVxImDWeyhFt63vNoWDPChH0DZKPXlBLWzATbQ+ygyZ5aVluIMbnMgo0SZQCa1fh57CyhwFPybHFamXbIu9XEmoT0HrU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 16dbec55d3d621b2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CrkVoLBm4ybeO/obxpSdyTY9iBAS8YW5Jdu3ozPFeUYDe4HGFsukO7Jr8IlQ7T+7rUpOnp3AMSDZ8muk0OU8vgbiBJIDd1pV+/tBwDyKAJSqsKdCJF0YZI9l3MPNkaPHVMIW0k2EsOX3L0ohP9v7ejMHlMexiGSNtEl73xMSCqeyvV7WQg9zAkExB8luJeQj5oGpeV7H61Chx3vMDCgU8iPROVSTdxWd/R653qjFYLI/cGuda39PGn1w7Czte32vj07Ety2ZrSZtwjS4B0khAQq4wGXzhlNgGm26xguNDYXfBztmLCUnnkX/14gAW46hX1vH+/wvRrGKooRZ5hQP9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nu8PmLjKmiRku0Kk/7dB2Im4mCKJ76wo9ud2Qrrg42E=;
 b=QkRg7gHtaNRWdAx+7DZeuatWRl3gV88v4SW6B9JVMNhKykikQNYFSaK162U0ODRfBfi7S6lNcVEtnbcXvQkgHFVyot1gJHyYNICZHU985D6y207RdjgKZfPwl9jTAPmZnTVI/Wf8/N1KuAdxmtWlAb4LqibbKmGj377UrkdD3v5SdqGd9XgCJKbmrTQ945BWJFiNFsqLscAEG/faHf8u/CDJatL9/AWt6cdw0TBExIjn7K1B94ylQdg87P0yX0A04hpn6fw43wAUS4y1nwexfN74bMoqAz1NnMZZQZ32iR3FEUIeziXE4ivTnfHheR+FjLCTf4CcIBXLUjcige6TmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nu8PmLjKmiRku0Kk/7dB2Im4mCKJ76wo9ud2Qrrg42E=;
 b=UGIU5k9aKMpdj6VRhTIv+qdRRzBtRS84nPp3d3y9vx8Vfa94Tuowqr92IyRrM0zKgZJ9HXzH7yfPXEitVxImDWeyhFt63vNoWDPChH0DZKPXlBLWzATbQ+ygyZ5aVluIMbnMgo0SZQCa1fh57CyhwFPybHFamXbIu9XEmoT0HrU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] tools: use $(PYTHON) to call cppcheck tools
Thread-Topic: [PATCH v2] tools: use $(PYTHON) to call cppcheck tools
Thread-Index: AQHYpzA5Sq+ptI31i02cWAL8jJ4SLa2dFF0AgAABZ4CAAAxXgA==
Date: Wed, 3 Aug 2022 12:55:01 +0000
Message-ID: <6FFB4DB2-5F3B-4E2F-AF7D-A5C47D497476@arm.com>
References:
 <708f00303d1c370622707866d41a868425a17324.1659527529.git.bertrand.marquis@arm.com>
 <dd4a5616-5c1f-51f2-0bce-3679432dcd58@suse.com>
 <07858193-47b0-f1a5-6bdc-4cac4dbe2ed7@xen.org>
In-Reply-To: <07858193-47b0-f1a5-6bdc-4cac4dbe2ed7@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9982fca0-5cc8-4071-02e7-08da754f66bc
x-ms-traffictypediagnostic:
	HE1PR0802MB2410:EE_|VE1EUR03FT037:EE_|HE1PR0801MB2123:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SJ6/rbm9qf3iXGUKZFtDH3iCrruTly9MjnFnejgQtPPuvLjpmNKFCJdsm+OwK8/Ad/oZVCla6gqQvuih+YFAIOYGhIt+A9TmduvfnlxjC9BYikPnQhIT+twnl4iBbMn4eaOv6gbmIrGachzGQq1Tn/wy2X1232s2S3/NEcN6l950ccaI9GbdFfLt47eQ4mM3TmFiNjg2RHtWb6iseY3+4XM3XyurcXd7CUIErYV/YnFt3DcfVuLzSEuRwlOU8Ltoj3PCPDalXFZc1MMzL8E92JLRDFdUbcMwxbZhH9RlUZJXcLArLoP8JVxp55XgIdm5gEHVK+YdchDY51nBvWamxZ+xW9oxy/qkhtFUw5nNBUcT5vhjxjlkObmKSCn2thiUKShDt+OzdSYNgDGEq95wCaYs50aSkAB93scpMpHR1Bza5VG6TXNkpBDNpwmEBY2STN8hu/cloJSpJf/qQkX+CjeeC9t51wcjiiBq1N5Zrm07TjFojfP8nBaqlsuLjt9tviup9Gh9D6AP79WmGH08s8+OkaEyNgyeWFoMNZjIGfGlqXM8qZykqpM6vS9uT9MC1DNwStgfrDVoKabUQCDNdg0iVff6OqicaLxJiXvhjq4BF6R5/KU+M7RLB7upy6nSlt8ofRfvtgWmWhzCatIHZOpWHf0qioqEYfzFI6yjnqz1SHh5aanyAX53anuKbZ8mttnYqTCwUd0wVaXJS9oM0Bx0Cr7AG+PN11X/tc+SrxQuu4bDI6ltT0u4GcbOj0llKicVK5Biq7fVHoVQ/dhxyQkAXZ0ZaMZ3J3vXtnrinDAILAnAIEP9XvNK6O0+OEvIehgy48SxRl0b4CaFmCiCZA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(33656002)(53546011)(6506007)(38100700002)(6512007)(76116006)(38070700005)(71200400001)(5660300002)(66556008)(8936002)(66476007)(66446008)(41300700001)(316002)(66946007)(54906003)(4326008)(122000001)(8676002)(2906002)(186003)(64756008)(6916009)(91956017)(36756003)(2616005)(478600001)(26005)(6486002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EB505F1BEEDC74585B6EC0952F493B4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2410
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d9ffbc46-6333-46bc-f96b-08da754f6130
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wzur+ajlXmZ6JOv4npsaiYqM4Nt4bTc0kk5QDkTELMuSN06Z4ahYuCBzJvwp5X487B2aLZ8+rP6hycWhLc8CqlCQ3r0W61i2w2lEY0J9dgKeq01ns320WnBGAdKv6yZGc6qqWt3o71F4CspbitoYuE0usNe0PKvnHsAT1SlFRbLgU97lduyv7wDqVnknBdVWpK0952W7G6Te87Ly6hNZBsfNKrzDlkdjUHTcK1zTL9ppqJtN4HqEcKTpe+rco+1ZQarktgPnYsxltt0fm8DwIlfDdVsNRBz0Hy2RyhBUr7YBhgjXbtHIuv3NxQwWH/dEGwf1bJPOEda7CNreuJBZoYvxIc90NajsxKbs2GsKd3PtMu+ne0RXmnIT43MkifZ1MZ4maK9JCN+X9LifC/ZjQSPc9V41cHseOwrFQKIRd1ZUrQY9qFA+x9D3Dx1HouDlpeBbaxa5qhqRuuMpXmrPpEplxtdPGLF0meuPRHn8uOdi7vc3+AlYEw2PPLOt/RKBwZ0SWIrmRJvV6thmcQPsDedPpLk7FYUR1Xf478fNs0h9Kgmagn6fRKcyFZQO4mfnpm/jAxNABovgF/tEaeeH9MC8/eXyMP5sdczV5nYyv7spz3N4zAGOTmGv3eEc0d+ZQGNEpyvMwYfgrjLAmENnnL/o5bk2ribEcojs0xEySPPqiC098Qm48wBcCLdswP2hiTTJty6SYytIlAM/XK3duGTYQGx208mKU+XAVaaMz3UkZTTHGyjH3NCz6Dm3kO165p6JdqN0kq12uKx7lY3cEoMnzpSZon+FxhZ8Q83phcXKl6G9blg1kPg/Dl8qahmO
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(346002)(396003)(36840700001)(40470700004)(46966006)(36860700001)(54906003)(8936002)(70206006)(82740400003)(26005)(70586007)(40480700001)(47076005)(6862004)(6512007)(336012)(86362001)(33656002)(6506007)(186003)(8676002)(4326008)(316002)(81166007)(356005)(82310400005)(40460700003)(41300700001)(36756003)(5660300002)(2906002)(6486002)(478600001)(53546011)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 12:55:11.1687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9982fca0-5cc8-4071-02e7-08da754f66bc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2123

DQoNCj4gT24gMyBBdWcgMjAyMiwgYXQgMTM6MTAsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+IHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiBPbiAwMy8wOC8yMDIyIDEzOjA1LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+IE9uIDAzLjA4LjIwMjIgMTM6NTcsIEJlcnRyYW5kIE1hcnF1aXMgd3Jv
dGU6DQo+Pj4gV2hlbiBjYWxsaW5nIHB5dGhvbiB0b29scyB0byBjb252ZXJ0IG1pc3JhIGRvY3Vt
ZW50YXRpb24gb3IgbWVyZ2UNCj4+PiBjcHBjaGVjayB4bWwgZmlsZXMsIHVzZSAkKFBZVEhPTiku
DQo+Pj4gV2hpbGUgdGhlcmUgZml4IG1pc3JhIGRvY3VtZW50IGNvbnZlcnNpb24gc2NyaXB0IHRv
IGJlIGV4ZWN1dGFibGUuDQo+Pj4gDQo+Pj4gRml4ZXM6IDU3Y2FhNTM3NTMgKHhlbjogQWRkIE1J
U1JBIHN1cHBvcnQgdG8gY3BwY2hlY2sgbWFrZSBydWxlKQ0KPj4+IEZpeGVzOiA0M2FhM2Y2ZTcy
IHhlbi9idWlsZDogQWRkIGNwcGNoZWNrIGFuZCBjcHBjaGVjay1odG1sIG1ha2UgcnVsZXMNCj4+
IE5pdDogVGhlc2UgdHdvIHRpdGxlcyB3b3VsZCB3YW50IGV4cHJlc3NpbmcgY29uc2lzdGVudGx5
LiBJZiBJDQo+PiBlbmQgdXAgY29tbWl0dGluZyB0aGlzLCBJJ2xsIHRyeSB0byByZW1lbWJlciB0
byBhZGp1c3QuDQo+IA0KPiBUaGVyZSBhcmUgYWN0dWFsbHkgYSBmZXcgaXNzdWVzIHdpdGggdGhl
IEZpeGVzIHRhZ3MuIEZyb20gdGhlIGRvYyBbMV0gOg0KPiAgLSB0aGUgc2hhMSBzaG91bGQgYmUg
MTIgY2hhcmFjdGVycyAocmF0aGVyIHRoYW4gMTApDQo+ICAtIHRoZSBmb3JtYXQgc2hvdWxkIGJl
Og0KPiAgICAgIEZpeGVzOiA8Y29taWRpZD4gKCJDb21taXQgdGl0bGUiKQ0KDQpZb3Ugd2FudCBt
ZSB0byByZXNlbmQgYW5kIGZpeCB0aGF0ID8NCg0KT24gdGhlIDEyIGNoYXJzIG9uZSwgSSBtdXN0
IGFkbWl0IEkgdXNlZCBnaXQgbG9nIOKAlG9uZWxpbmUgYW5kIGRpZCBub3QgY291bnQuDQpBbnkg
cGFydGljdWxhciByZWFzb24gdG8gdXNlIDEyIGluc3RlYWQgb2YgdGhlIDEwIHRoYXQgZ2l0IGxv
ZyBpcyBnaXZpbmcgPw0KU2hvdWxkIHdlIHN1Z2dlc3QgaG93IHRvIGdldCB0aGlzIHByb3Blcmx5
IGluIGEgc2ltcGxlIG1hbm5lciA/DQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gQ2hlZXJz
LA0KPiANCj4gWzFdIGRvY3MvcHJvY2Vzcy9zZW5kaW5nLXBhdGNoZXMucGFuZG9jDQo+IA0KPiAt
LSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

