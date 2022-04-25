Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB8B50DAFE
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:21:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312459.529708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nityS-0002IF-28; Mon, 25 Apr 2022 08:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312459.529708; Mon, 25 Apr 2022 08:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nityR-0002FM-VG; Mon, 25 Apr 2022 08:21:35 +0000
Received: by outflank-mailman (input) for mailman id 312459;
 Mon, 25 Apr 2022 08:21:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WklX=VD=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nityQ-0002FE-Fo
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:21:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5f9bca1-c470-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 10:21:32 +0200 (CEST)
Received: from AS9PR06CA0255.eurprd06.prod.outlook.com (2603:10a6:20b:45f::26)
 by AM4PR08MB2819.eurprd08.prod.outlook.com (2603:10a6:205:a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.18; Mon, 25 Apr
 2022 08:21:27 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::55) by AS9PR06CA0255.outlook.office365.com
 (2603:10a6:20b:45f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15 via Frontend
 Transport; Mon, 25 Apr 2022 08:21:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14 via Frontend Transport; Mon, 25 Apr 2022 08:21:27 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Mon, 25 Apr 2022 08:21:27 +0000
Received: from 74b00610958b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E25E073C-67C6-4A82-83DC-FA339FAB6299.1; 
 Mon, 25 Apr 2022 08:21:21 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 74b00610958b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 25 Apr 2022 08:21:21 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by DB9PR08MB7422.eurprd08.prod.outlook.com (2603:10a6:10:371::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Mon, 25 Apr
 2022 08:21:08 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a02d:1e5a:41b8:8635]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a02d:1e5a:41b8:8635%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:21:08 +0000
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
X-Inumbo-ID: b5f9bca1-c470-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LeMk/pZtcVi2z/1bgpqfXlqAMEpb1KOGkd+nuALoPew=;
 b=fQ5Y7mr2EI8CPKa9+AKcskdzB+ZCaJ7+FnoIBL6ogHDtp60AdtqG8dU6+LS8ot65W0v5XEMFT4TRgpcGNqF4mMVtgMbvryuYs96nYsQ7dj2LVXkF1xGUOG5tHMN1daF92s7c9HFtyZX1LCminzg5XBmUvNTDv6tuWGlG4B98CBE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCqbeOJ1c41m05djo1/Neh/b7TPbri1S1QiCFRJsTX7tpDfG3cIeLPHuYXzODM7l2+xLRcdjdgjS6PBDEoVu6XqHPvFAI9Ws+rmn++9F0ZB9V5q3EpYGNYhGwjBUDUEnkAuY+kaKHZQzttnjNAkd7CgGJryKX2VN70HwtxZ66chis2u7ZAgdLFV8oovo0H49OZArqwyLp0IJR0GpoD9iBpKidNY0FFpLYU7W2605jchgGG9SBpS2CZ4WMrxyVjoPjLo7Um4wKofU9LTrHpuRQ6pvu0V31ZFzNniHNqdCaH41/dLj+qa+aRlHsENwOK9Jfr26lh3BRGbqabFsSDVJjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LeMk/pZtcVi2z/1bgpqfXlqAMEpb1KOGkd+nuALoPew=;
 b=LWqJWX+X6MZO+2FAC4IDLC+SDOm8o7VrElvYDF2jECxeAiod0zlKon/hlhFBpV42hMPIH4Ka9rBX988FWFT7MjJ27Xf5p+y2/VB+k0cqFi1yh/LzEBUJ7ok30SJgzoN1+oAFGrwnuomA/yiwcNd1IEZD1ESAu4UH6ZhBcP6rxVoSg5yAkGU9Ly/sSn7nGToWT6w1oJlbDhw7GkfOmi7RF1m99g3gmAHb5/2++VdodVE+xjPNND/QaJa2UneNKTMK+CvlE+7sH0LVc3tSSoQxMtJZJJUoYy1yhX38w+VRxDwp0nPObBiM3wQopIY/tr5Fn/kHNEXr4/OZYw4C8p9gSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LeMk/pZtcVi2z/1bgpqfXlqAMEpb1KOGkd+nuALoPew=;
 b=fQ5Y7mr2EI8CPKa9+AKcskdzB+ZCaJ7+FnoIBL6ogHDtp60AdtqG8dU6+LS8ot65W0v5XEMFT4TRgpcGNqF4mMVtgMbvryuYs96nYsQ7dj2LVXkF1xGUOG5tHMN1daF92s7c9HFtyZX1LCminzg5XBmUvNTDv6tuWGlG4B98CBE=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 5/6] xen/arm: unpopulate memory when domain is static
Thread-Topic: [PATCH v2 5/6] xen/arm: unpopulate memory when domain is static
Thread-Index: AQHYUx8sjuusUaZZhUW8Wxz6RmBB9Kz29IIAgAk/PSCAABseAIAABFLw
Date: Mon, 25 Apr 2022 08:21:08 +0000
Message-ID:
 <DU2PR08MB732526FEFECA658C21ADE984F7F89@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220418122251.3583049-1-Penny.Zheng@arm.com>
 <20220418122251.3583049-6-Penny.Zheng@arm.com>
 <b76b3207-4eb7-5236-6812-d64cd4dad17f@suse.com>
 <DU2PR08MB73253426B332CFF5358AB346F7F89@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <ee51e12b-806f-99a9-b60d-84d6a9a939d6@suse.com>
In-Reply-To: <ee51e12b-806f-99a9-b60d-84d6a9a939d6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 15262FA90F8CB440A6158530C3E24272.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c76a1097-829a-4625-8cc5-08da2694981f
x-ms-traffictypediagnostic:
	DB9PR08MB7422:EE_|AM5EUR03FT018:EE_|AM4PR08MB2819:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR08MB281954B8CF24CFE8812E0B4CF7F89@AM4PR08MB2819.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Yz6k380roGPZgKtIZuf1JYhWGHGrc6kbiW/4CfJi742GEaSg7VpFLrfkbIjxo2rKdojjn9BtMK+toEZ+LR/4XEnweMSK/SogtFvtyJn0Go+U3+SSXIKo/Id7jrvnDXyTavlTL5evbPD6EL+Gh6cZAIqU8aBF7x5LTjgGNPgJg1QcRvISiY7cIWXrJ7pPyYM2yBkAinoxZprGNG+/TMzWnoJdEbOODqeHQqw810pcVYxkB1JX8kkN2S/OtMseV89JxKiU3IelAWq7wTDWZ5rvgQuhUs6MuI/A32ccoKVGPzvO8+3FPI4nE5iRIp9adTSHBDJr9dP5yp5InKtudBLl3LLnzsYRSQSoyWuIJ6knZXjFdHNUNG0MJNj8GxxMjUSo6t3+/06TdQOarqeAXfS8EVRJBGAGY7UhHfIDYTDfsIY/ttYbcOXtg14kgiiHFmtwSWQwBV1Ob6i1C/ZXOv8XqcGklrvAaECWmLvMJlLBf/aWsM2beXXJjZifd9Z4sNcdfrP37rY/VpeHj9Ar6Jm1sYug5BbEwl3I9tgj5Y2cMhQGJFvEoJCn+i8YAf4joTAt0W+vCX0TQHS6Amx0h7PmubGdwchtRx//rt2j6NsK/Ol8D1qXJHC7knMjNUFFW5mem3eL0Rt0yXjK++94V9Q4B/UxlbsRPJST+pAqtk/VKq4kTb1fHPdUI8hpvV1N6xHrpSW0vuaz1NXz5c0ZsOoF8w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(52536014)(83380400001)(5660300002)(8936002)(53546011)(76116006)(33656002)(6506007)(66946007)(186003)(66476007)(2906002)(55016003)(66446008)(4326008)(66556008)(64756008)(54906003)(8676002)(6916009)(508600001)(7696005)(71200400001)(316002)(122000001)(38100700002)(38070700005)(9686003)(26005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7422
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	87e52c10-c915-42a6-50ea-08da26948cba
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vxR/p1RF99YQYOB4Blq/qplc6G//YDIPMAzrvA/HwVy3b16jbqLcvHN/7nJeKCGeg+NfYYpejXYluHqriVhbaJNpSARISrKH6DgLwweFVY9/3kY3TO62MyYBBLdoYPqCCPkRTorDXOShfY77IUqlkrgfTNZobfRFTuC+BcIRMEvK0HiX1+O/0LnNuC21n7G47I5sDNjFSUpx9cItSE13cQSJaqKz9NhbcMCgoxlJAff+JRjfXni4nkuUzzLHptRW6WFhArA2B1pkmE+90QeuMENl0XTdPD/XBKP4Zu+skHQbhazPc9DegfbiHaNTTOjaCWgGM4Qkm+/crCnMa+Rj4Ot2t/dt8v9/WLO0RQ3UOubuVnzREn28wZwKJ2BEUJx7rZFAhgnEHggkFyaSaseumGJ0wcB/KzBWr6G1aYlWGHm7MU/+Ux2ZnSG0lbSwVM5q4V+NjQ9+ajnmEPmM1ffRX4YtMQxB+3rcBIP2ohsKN17T9WNb8qSLqKUtzUKJMusDTkUgm61oVuiSySVEXm2gE2Xb/Ps3YPK9tzAXY7yjGj1VnalhfwKyRrDF3q0QfnszTbiCIhrAbaFuAAz3/StU3tYx1Mpa8yJ1AfJsbJijaarRZdyp/6wmUR1a+PFkCDK5upMOAyiRh5ljySRpXcLTxQ90FOrMgeMXPJF2DpXk+r1bAS9Aq7IhmR3tfWq1S89E
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(356005)(81166007)(316002)(9686003)(5660300002)(52536014)(33656002)(186003)(8936002)(54906003)(40460700003)(2906002)(336012)(47076005)(86362001)(26005)(7696005)(36860700001)(55016003)(53546011)(83380400001)(70586007)(70206006)(8676002)(6862004)(82310400005)(4326008)(6506007)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:21:27.4941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c76a1097-829a-4625-8cc5-08da2694981f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2819

SGksIGphbg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogTW9uZGF5LCBBcHJpbCAyNSwgMjAyMiA0
OjAxIFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT4NCj4gQ2M6IFdl
aSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IEJlcnRyYW5k
IE1hcnF1aXMNCj4gPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFZvbG9keW15ciBCYWJjaHVr
DQo+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJp
eC5jb20+Ow0KPiBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgNS82XSB4ZW4vYXJtOiB1bnBvcHVsYXRl
IG1lbW9yeSB3aGVuIGRvbWFpbiBpcw0KPiBzdGF0aWMNCj4gDQo+IE9uIDI1LjA0LjIwMjIgMDg6
MzQsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IFNlbnQ6IFR1
ZXNkYXksIEFwcmlsIDE5LCAyMDIyIDU6MTEgUE0NCj4gPj4NCj4gPj4gT24gMTguMDQuMjAyMiAx
NDoyMiwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVk
ZS9hc20vbW0uaA0KPiA+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21tLmgNCj4g
Pj4+IEBAIC0zNTgsNiArMzU4LDIzIEBAIHZvaWQgY2xlYXJfYW5kX2NsZWFuX3BhZ2Uoc3RydWN0
IHBhZ2VfaW5mbw0KPiA+Pj4gKnBhZ2UpOw0KPiA+Pj4NCj4gPj4+ICB1bnNpZ25lZCBpbnQgYXJj
aF9nZXRfZG1hX2JpdHNpemUodm9pZCk7DQo+ID4+Pg0KPiA+Pj4gKy8qDQo+ID4+PiArICogUHV0
IGZyZWUgcGFnZXMgb24gdGhlIHJlc3YgcGFnZSBsaXN0IGFmdGVyIGhhdmluZyB0YWtlbiB0aGVt
DQo+ID4+PiArICogb2ZmIHRoZSAibm9ybWFsIiBwYWdlIGxpc3QsIHdoZW4gcGFnZXMgZnJvbSBz
dGF0aWMgbWVtb3J5ICAqLw0KPiA+Pj4gKyNpZmRlZiBDT05GSUdfU1RBVElDX01FTU9SWQ0KPiA+
Pj4gKyNkZWZpbmUgYXJjaF9mcmVlX2hlYXBfcGFnZShkLCBwZykgeyAgICAgICAgICAgICAgICAg
ICAgXA0KPiA+Pj4gKyAgICBpZiAoIChwZyktPmNvdW50X2luZm8gJiBQR0NfcmVzZXJ2ZWQgKSAg
ICAgICAgICAgICAgXA0KPiA+Pj4gKyAgICB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXA0KPiA+Pj4gKyAgICAgICAgcGFnZV9saXN0X2RlbChwZywg
cGFnZV90b19saXN0KGQsIHBnKSk7ICAgICAgICAgXA0KPiA+Pj4gKyAgICAgICAgcGFnZV9saXN0
X2FkZF90YWlsKHBnLCAmKGQpLT5yZXN2X3BhZ2VfbGlzdCk7ICAgXA0KPiA+Pj4gKyAgICAgICAg
KGQpLT5yZXN2X3BhZ2VzKys7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiA+Pg0K
PiA+PiBUaGVyZSdzIG5vIGNvbnN1bWVyIG9mIHRoaXMgY291bnRlciwgc28gSSdkIGxpa2UgdG8g
YXNrIHRoYXQgaXQgYmUNCj4gPj4gaW50cm9kdWNlZCBvbmNlIGEgY29uc3VtZXIgYXBwZWFycy4N
Cj4gPj4NCj4gPj4+ICsgICAgfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwNCj4gPj4+ICsgICAgZWxzZSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwNCj4gPj4+ICsgICAgICAgIHBhZ2VfbGlzdF9kZWwocGcs
IHBhZ2VfdG9fbGlzdChkLCBwZykpOyAgICAgICAgIFwNCj4gPj4NCj4gPj4gSXMgdGhlcmUgYSBw
YXJ0aWN1bGFyIHJlYXNvbiB0byBoYXZlIHRoaXMgcGFnZV9saXN0X2RlbCgpIHR3aWNlLA0KPiA+
PiBpbnN0ZWFkIG9mIGp1c3Qgb25jZSBhaGVhZCBvZiB0aGUgaWYoKT8NCj4gPj4NCj4gPj4+ICt9
DQo+ID4+DQo+ID4+IEFsc28gdGhpcyBlbnRpcmUgY29uc3RydWN0IHdhbnQgdG8gYmUgYW4gZXhw
cmVzc2lvbiwgbm90IGENCj4gPj4gKGNvbXBvdW5kKSBzdGF0ZW1lbnQuIEFuZCBpdCBwcm9iYWJs
eSB3b3VsZCBiZXR0ZXIgZXZhbHVhdGUgaXRzDQo+ID4+IHBhcmFtZXRlcnMganVzdCBvbmNlLg0K
PiA+Pg0KPiA+DQo+ID4gI2RlZmluZSBhcmNoX2ZyZWVfaGVhcF9wYWdlKGQsIHBnKSB7ICAgICAg
ICAgICAgICAgICAgICBcDQo+ID4gICAgICAgICBwYWdlX2xpc3RfZGVsKHBnLCBwYWdlX3RvX2xp
c3QoZCwgcGcpKTsgICAgICAgICAgICAgXA0KPiA+ICAgICAgICAgaWYgKCAocGcpLT5jb3VudF9p
bmZvICYgUEdDX3Jlc2VydmVkICkgICAgICAgICAgICAgIFwNCj4gPiAgICAgICAgICAgICAgcGFn
ZV9saXN0X2FkZF90YWlsKHBnLCAmKGQpLT5yZXN2X3BhZ2VfbGlzdCk7ICAgXA0KPiA+IH0NCj4g
Pg0KPiA+IEknbSB0cnlpbmcgdG8gcmVmaW5lIHRoZSBhcmNoX2ZyZWVfaGVhcF9wYWdlKCkgaGVy
ZSwgYnV0IEknbSBhIGJpdA0KPiA+IGNvbmZ1c2VkIGFib3V0IHRvIGxldCBpdCBiZSBhbiBleHBy
ZXNzaW9uLCBub3QgYSBjb21wb3VuZCBzdGF0ZW1lbnQuDQo+ID4gRG8geW91IG1lYW4gdGhhdCB5
b3UgcHJlZmVyIHRvIGxldCB0aGUgaWYtY2xhdXNlIG91dCBvZiB0aGUNCj4gYXJjaF9mcmVlX2hl
YXBfcGFnZSgpPw0KPiANCj4gTm8uIFlvdSB3YW50IHRvIHB1dCBwYXJlbnRoZXNlcyBhcm91bmQg
dGhlIGJyYWNlcywgdXNpbmcgYSBnY2MgZXh0ZW5zaW9uIHdlDQo+IG1ha2UgZXh0ZW5zaXZlIHVz
ZSBvZiB0aHJvdWdob3V0IHRoZSBjb2RlIGJhc2UuDQo+IA0KDQpPaCwgb2gsIHRoYW5rcyENCnB1
dCBwYXJlbnRoZXNlcyBhcm91bmQgdGhlIGJyYWNlcywgdGhlbiB0aGF0J3Mgd2hhdCB5b3Ugc2Fp
ZCBhYm91dCBtYWtlIGl0IA0KYmUgYW4gZXhwcmVzc2lvbg0KDQo+IEphbg0KDQo=

